package zhzxUtils;

import java.math.BigDecimal;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Stream;

import org.ttzero.excel.reader.ExcelReader;
import org.ttzero.excel.reader.Sheet;

import cn.hutool.core.convert.Convert;
import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Console;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("公司重点任务数据导入")
public class CqzcglExcelImprot {

	@Bizlet("Excel数据导入")
	public String excelIn(String filePath) {
		try {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			Map<String, String> secOrgMap = this.getSecOrgMap();
			ExcelReader reader = ExcelReader.read(Paths.get(filePath));
			Sheet[] sheets = reader.all();

			List<Entity> assetsList = new ArrayList<Entity>();
			List<Entity> assetItemsList = new ArrayList<Entity>();
			DateTime createTime = DateTime.now();

			for (int i = 0; i < sheets.length; i++) {
				Sheet sheet = sheets[i].load();
				Stream<Map<String, Object>> dataMapStream = sheet.header(1).rows().map(row -> row.toMap());
				dataMapStream.forEach(dataMap -> {
					String secOrgName = Convert.toStr(dataMap.get("资产所属单位"));
					if (StrUtil.isNotBlank(secOrgName) && secOrgMap.containsKey(secOrgName)) {
						String secOrgCode = secOrgMap.get(secOrgName);
						String assetId = IdUtil.objectId();
						Entity assetEntity = Entity.create("zh_caiwu_assets").set("id", assetId).set("name", Convert.toStr(dataMap.get("长期资产名称"))).set("clazz", Convert.toStr(dataMap.get("长期资产分类")))
								.set("category", Convert.toStr(dataMap.get("长期资产类别"))).set("spec", Convert.toStr(dataMap.get("型号规格"), null)).set("factory", Convert.toStr(dataMap.get("生产厂家"), null))
								.set("unit", Convert.toStr(dataMap.get("计量单位"))).set("plan_content", Convert.toStr(dataMap.get("购买计划"))).set("stock", Convert.toStr(dataMap.get("现存数量"), null))
								.set("plan_time", Convert.toStr(dataMap.get("购买时间"))).set("quantity", Convert.toBigDecimal(dataMap.get("数量"))).set("price", Convert.toBigDecimal(dataMap.get("单价")))
								.set("proc_time", Convert.toDate(dataMap.get("采购日期"))).set("tax_rate", Convert.toBigDecimal(dataMap.get("税率")))
								.set("depreciation_month", Convert.toInt(dataMap.get("总折旧"))).set("usage_time", Convert.toDate(dataMap.get("采购日期"))).set("secondary_org", secOrgCode)
								.set("secondary_orgname", secOrgName).set("department", secOrgName).set("create_userid", "0052").set("create_username", "王冬圆").set("create_time", createTime)
								.set("update_userid", "0052").set("update_username", "王冬圆").set("update_time", createTime);
						assetEntity.set("total", NumberUtil.mul(assetEntity.getBigDecimal("quantity"), assetEntity.getBigDecimal("price")));
						assetEntity.set("amount_tax", NumberUtil.div(assetEntity.getBigDecimal("total"), NumberUtil.add(1, assetEntity.getBigDecimal("tax_rate")), 3));
						if ("固定资产".equals(assetEntity.getStr("clazz"))) {
							assetEntity.set("depreciation_rate", NumberUtil.div("0.995", assetEntity.getStr("depreciation_month"), 3));
						} else {
							assetEntity.set("depreciation_rate", NumberUtil.div("1", assetEntity.getStr("depreciation_month"), 3));
						}
						List<Entity> tempItemList = this.generateData(assetEntity);
						for (Entity assetsItemGrid : tempItemList) {
							Entity assetItem = Entity.create("zh_caiwu_assets_item").set("id", IdUtil.objectId()).set("assets_id", assetId).set("zj_year", assetsItemGrid.getStr("zjYear"))
									.set("zj_zb", assetsItemGrid.getInt("zjZb")).set("total", assetsItemGrid.getBigDecimal("total")).set("jan", assetsItemGrid.getBigDecimal("jan"))
									.set("feb", assetsItemGrid.getBigDecimal("feb")).set("mar", assetsItemGrid.getBigDecimal("mar")).set("apr", assetsItemGrid.getBigDecimal("apr"))
									.set("may", assetsItemGrid.getBigDecimal("may")).set("jun", assetsItemGrid.getBigDecimal("jun")).set("jul", assetsItemGrid.getBigDecimal("jul"))
									.set("aug", assetsItemGrid.getBigDecimal("aug")).set("sep", assetsItemGrid.getBigDecimal("sep")).set("oct", assetsItemGrid.getBigDecimal("oct"))
									.set("nov", assetsItemGrid.getBigDecimal("nov")).set("dec", assetsItemGrid.getBigDecimal("dec"));
							assetItemsList.add(assetItem);
						}
						assetsList.add(assetEntity);
					}
				});
			}
			dbSession.insert(assetsList);
			dbSession.insert(assetItemsList);
			return "数据导入成功";
		} catch (Exception e) {
			Console.error(e);
			return "数据导入失败，请检查！";
		}
	}

	private Map<String, String> getSecOrgMap() {
		Map<String, String> secOrgMap = new HashMap<String, String>();
		secOrgMap.put("福建分公司", "26");
		secOrgMap.put("河北分公司", "24");
		secOrgMap.put("设备监理中心", "19");
		secOrgMap.put("天津分公司", "25");
		secOrgMap.put("系统工程事业部", "18");
		return secOrgMap;
	}

	// 生成折旧明细数据
	private List<Entity> generateData(Entity entity) {
		List<Entity> resultList = new ArrayList<Entity>();
		// 采购/装修时间
		DateTime procTime = DateUtil.parseDate(entity.getStr("proc_time"));
		// 长期资产分类
		String clazz = entity.getStr("clazz");
		// 不含税金额
		BigDecimal amountTax = entity.getBigDecimal("amount_tax");
		// 总折旧(月)
		Integer depreciationMonth = entity.getInt("depreciation_month");

		DateTime startYearMonth = "固定资产".equals(clazz) ? DateUtil.offsetMonth(DateUtil.beginOfMonth(procTime), 1) : DateUtil.beginOfMonth(procTime);
		DateTime endYearMonth = DateUtil.offsetMonth(startYearMonth, depreciationMonth - 1);

		BigDecimal monthAmount = "固定资产".equals(clazz) ? NumberUtil.round(NumberUtil.div(NumberUtil.sub(amountTax, NumberUtil.mul(amountTax, 0.005)), depreciationMonth), 2) : NumberUtil.round(
				NumberUtil.div(amountTax, depreciationMonth), 2);

		List<DateTime> rangeDateTime = DateUtil.rangeToList(startYearMonth, endYearMonth, DateField.MONTH);
		Map<String, BigDecimal> rangeDateTimeMap = new HashMap<String, BigDecimal>();
		for (int i = 0; i < rangeDateTime.size(); i++) {
			if (i == 0) {
				BigDecimal amount = "固定资产".equals(clazz) ? NumberUtil.sub(NumberUtil.sub(amountTax, NumberUtil.mul(amountTax, 0.005)), NumberUtil.mul(monthAmount, (depreciationMonth - 1)))
						: NumberUtil.sub(amountTax, NumberUtil.mul(monthAmount, (depreciationMonth - 1)));
				DateTime rangeDate = rangeDateTime.get(i);
				rangeDateTimeMap.put(rangeDate.year() + "_" + rangeDate.month(), amount);
			} else {
				DateTime rangeDate = rangeDateTime.get(i);
				rangeDateTimeMap.put(rangeDate.year() + "_" + rangeDate.month(), monthAmount);
			}
		}

		int startYear = DateUtil.year(startYearMonth);
		int endYear = DateUtil.year(endYearMonth);

		for (int i = startYear; i <= endYear; i++) {
			Entity resultEntity = new Entity();
			resultEntity.set("zjYear", i);
			if (i == startYear) {
				resultEntity.set("zjZb", 12 - DateUtil.month(startYearMonth));
			} else if (i == endYear) {
				resultEntity.set("zjZb", DateUtil.month(endYearMonth) + 1);
			} else {
				resultEntity.set("zjZb", 12);
			}
			resultEntity.set("jan", rangeDateTimeMap.containsKey(i + "_0") ? rangeDateTimeMap.get(i + "_0") : BigDecimal.ZERO);
			resultEntity.set("feb", rangeDateTimeMap.containsKey(i + "_1") ? rangeDateTimeMap.get(i + "_1") : BigDecimal.ZERO);
			resultEntity.set("mar", rangeDateTimeMap.containsKey(i + "_2") ? rangeDateTimeMap.get(i + "_2") : BigDecimal.ZERO);
			resultEntity.set("apr", rangeDateTimeMap.containsKey(i + "_3") ? rangeDateTimeMap.get(i + "_3") : BigDecimal.ZERO);
			resultEntity.set("may", rangeDateTimeMap.containsKey(i + "_4") ? rangeDateTimeMap.get(i + "_4") : BigDecimal.ZERO);
			resultEntity.set("jun", rangeDateTimeMap.containsKey(i + "_5") ? rangeDateTimeMap.get(i + "_5") : BigDecimal.ZERO);
			resultEntity.set("jul", rangeDateTimeMap.containsKey(i + "_6") ? rangeDateTimeMap.get(i + "_6") : BigDecimal.ZERO);
			resultEntity.set("aug", rangeDateTimeMap.containsKey(i + "_7") ? rangeDateTimeMap.get(i + "_7") : BigDecimal.ZERO);
			resultEntity.set("sep", rangeDateTimeMap.containsKey(i + "_8") ? rangeDateTimeMap.get(i + "_8") : BigDecimal.ZERO);
			resultEntity.set("oct", rangeDateTimeMap.containsKey(i + "_9") ? rangeDateTimeMap.get(i + "_9") : BigDecimal.ZERO);
			resultEntity.set("nov", rangeDateTimeMap.containsKey(i + "_10") ? rangeDateTimeMap.get(i + "_10") : BigDecimal.ZERO);
			resultEntity.set("dec", rangeDateTimeMap.containsKey(i + "_11") ? rangeDateTimeMap.get(i + "_11") : BigDecimal.ZERO);
			resultEntity.set(
					"total",
					NumberUtil.add(resultEntity.getBigDecimal("jan"), resultEntity.getBigDecimal("feb"), resultEntity.getBigDecimal("mar"), resultEntity.getBigDecimal("apr"),
							resultEntity.getBigDecimal("may"), resultEntity.getBigDecimal("jun"), resultEntity.getBigDecimal("jul"), resultEntity.getBigDecimal("aug"),
							resultEntity.getBigDecimal("sep"), resultEntity.getBigDecimal("oct"), resultEntity.getBigDecimal("nov"), resultEntity.getBigDecimal("dec")));
			resultList.add(resultEntity);
		}

		return resultList;
	}

}
