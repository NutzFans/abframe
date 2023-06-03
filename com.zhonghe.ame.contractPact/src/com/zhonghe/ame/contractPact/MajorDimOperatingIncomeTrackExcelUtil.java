package com.zhonghe.ame.contractPact;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
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

@Bizlet("营业收入跟踪 - 专业类型维度")
public class MajorDimOperatingIncomeTrackExcelUtil {

	@Bizlet("营业收入跟踪分析 - 专业类型维度")
	public DataObject[] trackAnalyze(String majorDimYear, String majorDimGroup) throws Exception {
		List<DataObject> trackDatas = new ArrayList<DataObject>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());

		// 根据年份获取已配置阀值的专业类别（集团内外）
		String majorSql = "";
		List<Entity> majors = new ArrayList<Entity>();

		if (StrUtil.isNotBlank(majorDimGroup)) {
			majorSql = "SELECT major_type, SUM( CAST ( target_value AS NUMERIC ( 18, 2) ) ) AS target_value, SUM ( CAST ( threshold_value AS NUMERIC ( 18, 2 ) ) ) AS threshold_value FROM zh_operating_income_threshold WHERE years = ? AND threshold_type = '2' AND headquarter_group = ? GROUP BY major_type";
			majors = dbSession.query(majorSql, majorDimYear, majorDimGroup);
		} else {
			majorSql = "SELECT major_type, SUM( CAST ( target_value AS NUMERIC ( 18, 2) ) ) AS target_value, SUM ( CAST ( threshold_value AS NUMERIC ( 18, 2 ) ) ) AS threshold_value FROM zh_operating_income_threshold WHERE years = ? AND threshold_type = '2' GROUP BY major_type";
			majors = dbSession.query(majorSql, majorDimYear);
		}
		
		if (majors != null && majors.size() > 0) {
			for (Entity major : majors) {
				DataObject trackData = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.MajorOperatingTrackAnalyzeEntity");
				trackData.setString("majorId", major.getStr("major_type"));
				Entity majorEntity = dbSession.queryOne("SELECT DICTNAME FROM EOS_DICT_ENTRY WHERE DICTTYPEID='ZH_OPERATION_INCOME_MAJOR' AND DICTID=?", major.getStr("major_type"));
				trackData.setString("majorName", majorEntity.getStr("DICTNAME"));
				trackData.setBigDecimal("targetValue", major.getBigDecimal("target_value"));
				trackData.setBigDecimal("thresholdValue", major.getBigDecimal("threshold_value"));
				if (StrUtil.isNotBlank(majorDimGroup)) {
					if (majorDimGroup.equals("0")) {
						String invoiceYearSql = "SELECT SUM( CAST ( book_income AS NUMERIC ( 18, 2) ) ) AS book_income_sum FROM zh_invoice WHERE YEAR ( create_time ) = ? AND major = ? AND app_status = '2' AND headquarter_group IN ( '0', '3', '4' )";
						Entity invoiceYear = dbSession.queryOne(invoiceYearSql, majorDimYear, major.getStr("major_type"));
						if (invoiceYear != null) {
							trackData.setBigDecimal("cumulativeCompleted", NumberUtil.div(invoiceYear.getBigDecimal("book_income_sum"), 10000, 2));
						} else {
							trackData.setBigDecimal("cumulativeCompleted", new BigDecimal(0));
						}
						String annualYearSql = "SELECT SUM( CAST ( acp.sum AS NUMERIC ( 18, 2) ) ) AS sum_total FROM ( SELECT temp.* FROM ( SELECT ap.years, zc.major, ap.[sum], zc.headquarter_group FROM annual_payment_plan AS ap LEFT JOIN zh_charge_contract AS zc ON zc.id = ap.charge_id WHERE ap.charge_id IS NOT NULL AND zc.app_status= 2 ) AS temp UNION ALL SELECT ac.years, ac.major, ac.[sum], ac.headquarter_group FROM annual_charge_plan AS ac ) AS acp WHERE acp.years= ? AND acp.major= ? AND headquarter_group IN ( '0', '3', '4' ) GROUP BY acp.major";
						Entity annualYear = dbSession.queryOne(annualYearSql, majorDimYear, major.getStr("major_type"));
						if (annualYear != null) {
							trackData.setBigDecimal("totalYear", NumberUtil.div(NumberUtil.div(annualYear.getBigDecimal("sum_total"), 1.06, 2), 10000, 2));
						} else {
							trackData.setBigDecimal("totalYear", new BigDecimal(0));
						}
						String annualYearBySignedSql = "SELECT SUM( CAST ( SUM AS NUMERIC ( 18, 2) ) ) AS sum_total FROM annual_charge_plan WHERE years = ? AND major = ? AND headquarter_group IN ( '0', '3', '4' ) GROUP BY major";
						Entity annualYearBySigne = dbSession.queryOne(annualYearBySignedSql, majorDimYear, major.getStr("major_type"));
						if (annualYearBySigne != null) {
							trackData.setBigDecimal("toBeSigned", NumberUtil.div(NumberUtil.div(annualYearBySigne.getBigDecimal("sum_total"), 1.06, 2), 10000, 2));
						} else {
							trackData.setBigDecimal("toBeSigned", new BigDecimal(0));
						}
						trackData.setBigDecimal("followUpCcompleted", NumberUtil.sub(trackData.getBigDecimal("totalYear"), trackData.getBigDecimal("cumulativeCompleted")));
					} else {
						String invoiceYearSql = "SELECT SUM( CAST ( book_income AS NUMERIC ( 18, 2) ) ) AS book_income_sum FROM zh_invoice WHERE YEAR ( create_time ) = ? AND major = ? AND app_status = '2' AND headquarter_group='1'";
						Entity invoiceYear = dbSession.queryOne(invoiceYearSql, majorDimYear, major.getStr("major_type"));
						if (invoiceYear != null) {
							trackData.setBigDecimal("cumulativeCompleted", NumberUtil.div(invoiceYear.getBigDecimal("book_income_sum"), 10000, 2));
						} else {
							trackData.setBigDecimal("cumulativeCompleted", new BigDecimal(0));
						}
						String annualYearSql = "SELECT SUM( CAST ( acp.sum AS NUMERIC ( 18, 2) ) ) AS sum_total FROM ( SELECT temp.* FROM ( SELECT ap.years, zc.major, ap.[sum], zc.headquarter_group FROM annual_payment_plan AS ap LEFT JOIN zh_charge_contract AS zc ON zc.id = ap.charge_id WHERE ap.charge_id IS NOT NULL AND zc.app_status= 2 ) AS temp UNION ALL SELECT ac.years, ac.major, ac.[sum], ac.headquarter_group FROM annual_charge_plan AS ac ) AS acp WHERE acp.years= ? AND acp.major= ? AND headquarter_group='1' GROUP BY acp.major";
						Entity annualYear = dbSession.queryOne(annualYearSql, majorDimYear, major.getStr("major_type"));
						if (annualYear != null) {
							trackData.setBigDecimal("totalYear", NumberUtil.div(NumberUtil.div(annualYear.getBigDecimal("sum_total"), 1.06, 2), 10000, 2));
						} else {
							trackData.setBigDecimal("totalYear", new BigDecimal(0));
						}
						String annualYearBySignedSql = "SELECT SUM( CAST ( SUM AS NUMERIC ( 18, 2) ) ) AS sum_total FROM annual_charge_plan WHERE years = ? AND major = ? AND headquarter_group='1' GROUP BY major";
						Entity annualYearBySigne = dbSession.queryOne(annualYearBySignedSql, majorDimYear, major.getStr("major_type"));
						if (annualYearBySigne != null) {
							trackData.setBigDecimal("toBeSigned", NumberUtil.div(NumberUtil.div(annualYearBySigne.getBigDecimal("sum_total"), 1.06, 2), 10000, 2));
						} else {
							trackData.setBigDecimal("toBeSigned", new BigDecimal(0));
						}
						trackData.setBigDecimal("followUpCcompleted", NumberUtil.sub(trackData.getBigDecimal("totalYear"), trackData.getBigDecimal("cumulativeCompleted")));
					}
				} else {
					String invoiceYearSql = "SELECT SUM( CAST ( book_income AS NUMERIC ( 18, 2) ) ) AS book_income_sum FROM zh_invoice WHERE YEAR ( create_time ) = ? AND major = ? AND app_status = '2'";
					Entity invoiceYear = dbSession.queryOne(invoiceYearSql, majorDimYear, major.getStr("major_type"));
					if (invoiceYear != null) {
						trackData.setBigDecimal("cumulativeCompleted", NumberUtil.div(invoiceYear.getBigDecimal("book_income_sum"), 10000, 2));
					} else {
						trackData.setBigDecimal("cumulativeCompleted", new BigDecimal(0));
					}
					String annualYearSql = "SELECT SUM( CAST ( acp.sum AS NUMERIC ( 18, 2) ) ) AS sum_total FROM ( SELECT temp.* FROM ( SELECT ap.years, zc.major, ap.[sum], zc.headquarter_group FROM annual_payment_plan AS ap LEFT JOIN zh_charge_contract AS zc ON zc.id = ap.charge_id WHERE ap.charge_id IS NOT NULL AND zc.app_status= 2 ) AS temp UNION ALL SELECT ac.years, ac.major, ac.[sum], ac.headquarter_group FROM annual_charge_plan AS ac ) AS acp WHERE acp.years= ? AND acp.major= ? GROUP BY acp.major";
					Entity annualYear = dbSession.queryOne(annualYearSql, majorDimYear, major.getStr("major_type"));
					if (annualYear != null) {
						trackData.setBigDecimal("totalYear", NumberUtil.div(NumberUtil.div(annualYear.getBigDecimal("sum_total"), 1.06, 2), 10000, 2));
					} else {
						trackData.setBigDecimal("totalYear", new BigDecimal(0));
					}
					String annualYearBySignedSql = "SELECT SUM( CAST ( SUM AS NUMERIC ( 18, 2) ) ) AS sum_total FROM annual_charge_plan WHERE years = ? AND major = ? GROUP BY major";
					Entity annualYearBySigne = dbSession.queryOne(annualYearBySignedSql, majorDimYear, major.getStr("major_type"));
					if (annualYearBySigne != null) {
						trackData.setBigDecimal("toBeSigned", NumberUtil.div(NumberUtil.div(annualYearBySigne.getBigDecimal("sum_total"), 1.06, 2), 10000, 2));
					} else {
						trackData.setBigDecimal("toBeSigned", new BigDecimal(0));
					}
					trackData.setBigDecimal("followUpCcompleted", NumberUtil.sub(trackData.getBigDecimal("totalYear"), trackData.getBigDecimal("cumulativeCompleted")));
				}
				trackDatas.add(trackData);
			}

			List<String> customSort = Arrays.asList("咨询", "监理", "设备监理", "工程检测");

			List<DataObject> newTrackDatas = ListUtil.sort(trackDatas, new Comparator<DataObject>() {

				@Override
				public int compare(DataObject t1, DataObject t2) {
					int t1Index = customSort.indexOf(t1.getString("majorName"));
					t1Index = t1Index == -1 ? Integer.MAX_VALUE : t1Index;
					int t2Index = customSort.indexOf(t2.getString("majorName"));
					t2Index = t2Index == -1 ? Integer.MAX_VALUE : t2Index;
					return t1Index - t2Index;
				}
			});

			DataObject trackData = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.MajorOperatingTrackAnalyzeEntity");
			trackData.setString("majorId", "hj");
			trackData.setString("majorName", "合计");

			for (DataObject dataObject : newTrackDatas) {
				trackData.setBigDecimal("targetValue", NumberUtil.add(trackData.getBigDecimal("targetValue"), dataObject.getBigDecimal("targetValue")));
				trackData.setBigDecimal("thresholdValue", NumberUtil.add(trackData.getBigDecimal("thresholdValue"), dataObject.getBigDecimal("thresholdValue")));
				trackData.setBigDecimal("cumulativeCompleted", NumberUtil.add(trackData.getBigDecimal("cumulativeCompleted"), dataObject.getBigDecimal("cumulativeCompleted")));
				trackData.setBigDecimal("totalYear", NumberUtil.add(trackData.getBigDecimal("totalYear"), dataObject.getBigDecimal("totalYear")));
				trackData.setBigDecimal("toBeSigned", NumberUtil.add(trackData.getBigDecimal("toBeSigned"), dataObject.getBigDecimal("toBeSigned")));
				trackData.setBigDecimal("followUpCcompleted", NumberUtil.add(trackData.getBigDecimal("followUpCcompleted"), dataObject.getBigDecimal("followUpCcompleted")));
			}

			newTrackDatas.add(trackData);

			trackDatas = newTrackDatas;

		}
		
		return ArrayUtil.toArray(trackDatas, DataObject.class);
		
	}

}
