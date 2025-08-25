package com.zhonghe.ame.finance;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("长期资产工具类")
public class LongTermAssetsUtil {

	@Bizlet("生成折旧明细数据")
	public List<Entity> generateData(Entity entity) throws Exception {
		List<Entity> resultList = new ArrayList<Entity>();
		// 采购/装修时间
		DateTime procTime = DateUtil.parseDate(entity.getStr("procTime"));
		// 长期资产分类
		String clazz = entity.getStr("clazz");
		// 不含税金额
		BigDecimal amountTax = entity.getBigDecimal("amountTax");
		// 总折旧(月)
		Integer depreciationMonth = entity.getInt("depreciationMonth");

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

	@Bizlet("保存数据")
	public void save(Entity assetsData, Entity[] assetsItemGrid) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String delAssetsItemSql = "DELETE FROM zh_caiwu_assets_item WHERE assets_id = ?";
		String assetsId;
		if (StrUtil.isNotBlank(assetsData.getStr("id"))) {
			// 编辑保存
			assetsId = assetsData.getStr("id");
		} else {
			assetsId = IdUtil.objectId();
		}

		Entity assetsEntity = Entity.create("zh_caiwu_assets").set("id", assetsId).set("name", assetsData.getStr("name")).set("clazz", assetsData.getStr("clazz"))
				.set("category", assetsData.getStr("category")).set("spec", assetsData.getStr("spec")).set("factory", assetsData.getStr("factory")).set("unit", assetsData.getStr("unit"))
				.set("plan_content", assetsData.getStr("planContent")).set("stock", assetsData.getStr("stock")).set("plan_time", assetsData.getStr("planTime"))
				.set("quantity", assetsData.getBigDecimal("quantity")).set("price", assetsData.getBigDecimal("price")).set("total", assetsData.getBigDecimal("total"))
				.set("proc_time", DateUtil.parse(assetsData.getStr("procTime"))).set("tax_rate", assetsData.getBigDecimal("taxRate")).set("amount_tax", assetsData.getBigDecimal("amountTax"))
				.set("depreciation_month", assetsData.getInt("depreciationMonth")).set("depreciation_rate", assetsData.getBigDecimal("depreciationRate"))
				.set("usage_time", DateUtil.parse(assetsData.getStr("procTime"))).set("secondary_org", assetsData.getStr("secondaryOrg"))
				.set("secondary_orgname", assetsData.getStr("secondaryOrgname")).set("department", assetsData.getStr("department")).set("create_userid", assetsData.getStr("createUserid"))
				.set("create_username", assetsData.getStr("createUsername")).set("create_time", DateUtil.parse(assetsData.getStr("createTime")))
				.set("update_userid", assetsData.getStr("updateUserid")).set("update_username", assetsData.getStr("updateUsername"))
				.set("update_time", DateUtil.parse(assetsData.getStr("updateTime")));

		List<Entity> assetsItemInsertEntitys = new ArrayList<Entity>();
		for (int i = 0; i < assetsItemGrid.length; i++) {
			Entity insert = Entity.create("zh_caiwu_assets_item").set("id", IdUtil.objectId()).set("assets_id", assetsId).set("zj_year", assetsItemGrid[i].getStr("zjYear"))
					.set("zj_zb", assetsItemGrid[i].getInt("zjZb")).set("total", assetsItemGrid[i].getBigDecimal("total")).set("jan", assetsItemGrid[i].getBigDecimal("jan"))
					.set("feb", assetsItemGrid[i].getBigDecimal("feb")).set("mar", assetsItemGrid[i].getBigDecimal("mar")).set("apr", assetsItemGrid[i].getBigDecimal("apr"))
					.set("may", assetsItemGrid[i].getBigDecimal("may")).set("jun", assetsItemGrid[i].getBigDecimal("jun")).set("jul", assetsItemGrid[i].getBigDecimal("jul"))
					.set("aug", assetsItemGrid[i].getBigDecimal("aug")).set("sep", assetsItemGrid[i].getBigDecimal("sep")).set("oct", assetsItemGrid[i].getBigDecimal("oct"))
					.set("nov", assetsItemGrid[i].getBigDecimal("nov")).set("dec", assetsItemGrid[i].getBigDecimal("dec"));
			assetsItemInsertEntitys.add(insert);
		}

		if (StrUtil.isNotBlank(assetsData.getStr("id"))) {
			// 编辑保存
			Entity updateWhere = Entity.create("zh_caiwu_assets").set("id", assetsId);
			dbSession.execute(delAssetsItemSql, assetsId);
			dbSession.insert(assetsItemInsertEntitys);
			dbSession.update(assetsEntity, updateWhere);
		} else {
			// 新增保存
			dbSession.execute(delAssetsItemSql, assetsId);
			dbSession.insert(assetsItemInsertEntitys);
			dbSession.insert(assetsEntity);
		}
	}

	@Bizlet("删除数据")
	public void del(String ids) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String delAssetsItemSql = "DELETE FROM zh_caiwu_assets_item WHERE assets_id IN (" + ids + ")";
		String delAssetsSql = "DELETE FROM zh_caiwu_assets WHERE id IN (" + ids + ")";
		dbSession.execute(delAssetsItemSql);
		dbSession.execute(delAssetsSql);
	}

}
