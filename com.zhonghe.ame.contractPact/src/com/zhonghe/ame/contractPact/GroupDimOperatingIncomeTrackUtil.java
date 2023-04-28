package com.zhonghe.ame.contractPact;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("营业收入跟踪 - 集团内外维度")
public class GroupDimOperatingIncomeTrackUtil {

	@Bizlet("营业收入跟踪分析 - 集团内外维度")
	public DataObject[] trackAnalyze(String groupDimYear) throws Exception {
		List<DataObject> trackDatas = new ArrayList<DataObject>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());

		// 根据年份分组获取集团内/外配置的阀值
		String groupSql = "SELECT headquarter_group, SUM( CAST ( target_value AS NUMERIC ( 18, 2) ) ) AS target_value, SUM ( CAST ( threshold_value AS NUMERIC ( 18, 2 ) ) ) AS threshold_value FROM zh_operating_income_threshold WHERE years = ? AND threshold_type = '1' GROUP BY headquarter_group";
		List<Entity> groups = dbSession.query(groupSql, groupDimYear);

		if (groups != null && groups.size() > 0) {
			for (Entity group : groups) {
				DataObject trackData = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.GroupOperatingTrackAnalyzeEntity");
				trackData.setString("groupId", group.getStr("headquarter_group"));
				Entity groupEntity = dbSession.queryOne("SELECT DICTNAME FROM EOS_DICT_ENTRY WHERE DICTTYPEID='ZH_OPERATION_INCOME_GROUP' AND DICTID=?",
						group.getStr("headquarter_group"));
				trackData.setString("groupName", groupEntity.getStr("DICTNAME"));
				trackData.setBigDecimal("targetValue", group.getBigDecimal("target_value"));
				trackData.setBigDecimal("thresholdValue", group.getBigDecimal("threshold_value"));
				if (group.getStr("headquarter_group").equals("0")) {
					String invoiceYearSql = "SELECT SUM( CAST ( book_income AS NUMERIC ( 18, 2) ) ) AS book_income_sum FROM zh_invoice WHERE YEAR ( create_time ) = ? AND app_status = '2' AND headquarter_group IN ( '0', '3', '4' )";
					Entity invoiceYear = dbSession.queryOne(invoiceYearSql, groupDimYear);
					if (invoiceYear != null) {
						trackData.setBigDecimal("cumulativeCompleted", invoiceYear.getBigDecimal("book_income_sum"));
					} else {
						trackData.setBigDecimal("cumulativeCompleted", new BigDecimal(0));
					}
					String annualYearSql = "SELECT SUM( CAST ( acp.sum AS NUMERIC ( 18, 2) ) ) AS sum_total FROM ( SELECT temp.* FROM ( SELECT ap.years, ap.[sum], zc.headquarter_group FROM annual_payment_plan AS ap LEFT JOIN zh_charge_contract AS zc ON zc.id = ap.charge_id WHERE ap.charge_id IS NOT NULL AND zc.app_status= 2 ) AS temp UNION ALL SELECT ac.years, ac.[sum], ac.headquarter_group FROM annual_charge_plan AS ac ) AS acp WHERE years = ? AND headquarter_group IN ( '0', '3', '4' )";
					Entity annualYear = dbSession.queryOne(annualYearSql, groupDimYear);
					if (annualYear != null) {
						trackData.setBigDecimal("totalYear", NumberUtil.div(annualYear.getBigDecimal("sum_total"), 1.06, 2));
					} else {
						trackData.setBigDecimal("totalYear", new BigDecimal(0));
					}
					String annualYearBySignedSql = "SELECT SUM( CAST ( SUM AS NUMERIC ( 18, 2) ) ) AS sum_total FROM annual_charge_plan WHERE years = ? AND headquarter_group IN ( '0', '3', '4' ) ";
					Entity annualYearBySigne = dbSession.queryOne(annualYearBySignedSql, groupDimYear);
					if (annualYearBySigne != null && annualYearBySigne.getBigDecimal("sum_total") != null) {
						trackData.setBigDecimal("toBeSigned", NumberUtil.div(annualYearBySigne.getBigDecimal("sum_total"), 1.06, 2));
					} else {
						trackData.setBigDecimal("toBeSigned", new BigDecimal(0));
					}
					trackData.setBigDecimal("followUpCcompleted", NumberUtil.sub(trackData.getBigDecimal("totalYear"), trackData.getBigDecimal("cumulativeCompleted")));
				} else {
					String invoiceYearSql = "SELECT SUM( CAST ( book_income AS NUMERIC ( 18, 2) ) ) AS book_income_sum FROM zh_invoice WHERE YEAR ( create_time ) = ? AND app_status = '2' AND headquarter_group='1'";
					Entity invoiceYear = dbSession.queryOne(invoiceYearSql, groupDimYear);
					if (invoiceYear != null) {
						trackData.setBigDecimal("cumulativeCompleted", invoiceYear.getBigDecimal("book_income_sum"));
					} else {
						trackData.setBigDecimal("cumulativeCompleted", new BigDecimal(0));
					}
					String annualYearSql = "SELECT SUM( CAST ( acp.sum AS NUMERIC ( 18, 2) ) ) AS sum_total FROM ( SELECT temp.* FROM ( SELECT ap.years, ap.[sum], zc.headquarter_group FROM annual_payment_plan AS ap LEFT JOIN zh_charge_contract AS zc ON zc.id = ap.charge_id WHERE ap.charge_id IS NOT NULL AND zc.app_status= 2 ) AS temp UNION ALL SELECT ac.years, ac.[sum], ac.headquarter_group FROM annual_charge_plan AS ac ) AS acp WHERE years = ? AND headquarter_group='1'";
					Entity annualYear = dbSession.queryOne(annualYearSql, groupDimYear);
					if (annualYear != null) {
						trackData.setBigDecimal("totalYear", NumberUtil.div(annualYear.getBigDecimal("sum_total"), 1.06, 2));
					} else {
						trackData.setBigDecimal("totalYear", new BigDecimal(0));
					}
					String annualYearBySignedSql = "SELECT SUM( CAST ( SUM AS NUMERIC ( 18, 2) ) ) AS sum_total FROM annual_charge_plan WHERE years = ? AND headquarter_group='1'";
					Entity annualYearBySigne = dbSession.queryOne(annualYearBySignedSql, groupDimYear);
					if (annualYearBySigne != null && annualYearBySigne.getBigDecimal("sum_total") != null) {
						trackData.setBigDecimal("toBeSigned", NumberUtil.div(annualYearBySigne.getBigDecimal("sum_total"), 1.06, 2));
					} else {
						trackData.setBigDecimal("toBeSigned", new BigDecimal(0));
					}
					trackData.setBigDecimal("followUpCcompleted", NumberUtil.sub(trackData.getBigDecimal("totalYear"), trackData.getBigDecimal("cumulativeCompleted")));
				}
				trackDatas.add(trackData);
			}

			List<String> customSort = Arrays.asList("集团内", "集团外");

			List<DataObject> newTrackDatas = ListUtil.sort(trackDatas, (t1, t2) -> {
				int t1Index = customSort.indexOf(t1.getString("groupName"));
				t1Index = t1Index == -1 ? Integer.MAX_VALUE : t1Index;
				int t2Index = customSort.indexOf(t2.getString("groupName"));
				t2Index = t2Index == -1 ? Integer.MAX_VALUE : t2Index;
				return t1Index - t2Index;
			});

			DataObject trackData = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.GroupOperatingTrackAnalyzeEntity");
			trackData.setString("groupId", "hj");
			trackData.setString("groupName", "合计");

			newTrackDatas.forEach(dataObject -> {
				trackData.setBigDecimal("targetValue", NumberUtil.add(trackData.getBigDecimal("targetValue"), dataObject.getBigDecimal("targetValue")));
				trackData.setBigDecimal("thresholdValue", NumberUtil.add(trackData.getBigDecimal("thresholdValue"), dataObject.getBigDecimal("thresholdValue")));
				trackData.setBigDecimal("cumulativeCompleted", NumberUtil.add(trackData.getBigDecimal("cumulativeCompleted"), dataObject.getBigDecimal("cumulativeCompleted")));
				trackData.setBigDecimal("totalYear", NumberUtil.add(trackData.getBigDecimal("totalYear"), dataObject.getBigDecimal("totalYear")));
				trackData.setBigDecimal("toBeSigned", NumberUtil.add(trackData.getBigDecimal("toBeSigned"), dataObject.getBigDecimal("toBeSigned")));
				trackData.setBigDecimal("followUpCcompleted", NumberUtil.add(trackData.getBigDecimal("followUpCcompleted"), dataObject.getBigDecimal("followUpCcompleted")));
			});

			newTrackDatas.add(trackData);

			trackDatas = newTrackDatas;

		}

		return ArrayUtil.toArray(trackDatas, DataObject.class);
	}

}
