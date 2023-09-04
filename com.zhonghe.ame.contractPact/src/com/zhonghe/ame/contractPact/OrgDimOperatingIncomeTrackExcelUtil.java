package com.zhonghe.ame.contractPact;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.BinaryOperator;
import java.util.function.Function;
import java.util.stream.Collectors;

import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.map.MapUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("营业收入跟踪 - 单位维度")
public class OrgDimOperatingIncomeTrackExcelUtil {

	@Bizlet("营业收入跟踪分析 - 单位维度")
	public DataObject[] trackAnalyze(String orgDimYear, String orgDimGroup, String authType, String secOrgId) throws Exception {
		List<DataObject> trackDatas = new ArrayList<DataObject>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());

		String queryOrgSql = "SELECT DICTID, DICTNAME FROM EOS_DICT_ENTRY WHERE DICTTYPEID = ? ORDER BY SORTNO ASC";
		List<Entity> dictSecOrgs = dbSession.query(queryOrgSql, "ZH_OPERATION_INCOME_ORG");

		// 根据年份获取已配置阀值的组织（集团内外）
		String secOrgSql = "";
		List<Entity> secOrgs = new ArrayList<Entity>();

		// 根据年份获取开票数据真实的收入（集团内外）
		String invoiceYearSql = "";
		List<Entity> invoiceYears = new ArrayList<Entity>();

		// 根据年份获取收款/开票计划收入（集团内外）
		String annualYearSql = "";
		List<Entity> annualYears = new ArrayList<Entity>();

		// 根据年份获取收款/开票计划待签收入（集团内外）
		String annualYearBySignedSql = "";
		List<Entity> annualYearBySigneds = new ArrayList<Entity>();

		if (StrUtil.isNotBlank(orgDimGroup)) {
			secOrgSql = "SELECT sec_org, SUM( CAST ( target_value AS NUMERIC ( 18, 2) ) ) AS target_value, SUM ( CAST ( threshold_value AS NUMERIC ( 18, 2 ) ) ) AS threshold_value FROM zh_operating_income_threshold WHERE years = ? AND threshold_type = '1' AND headquarter_group = ? GROUP BY sec_org";
			secOrgs = dbSession.query(secOrgSql, orgDimYear, orgDimGroup);
			if (orgDimGroup.equals("0")) {
				invoiceYearSql = "SELECT implement_org, book_income, create_time FROM zh_invoice WHERE YEAR(create_time)=? AND app_status='2' AND headquarter_group IN ('0', '3', '4')";
				invoiceYears = dbSession.query(invoiceYearSql, orgDimYear);
				annualYearSql = "SELECT acp.secondary_org, SUM( CAST ( acp.sum AS NUMERIC ( 18, 2) ) ) AS sum_total FROM ( SELECT temp.* FROM ( SELECT ap.years, zc.secondary_org, ap.[sum], zc.headquarter_group FROM annual_payment_plan AS ap LEFT JOIN zh_charge_contract AS zc ON zc.id = ap.charge_id WHERE ap.charge_id IS NOT NULL AND zc.app_status= 2 ) AS temp UNION ALL SELECT ac.years, ac.secondary_org, ac.[sum], ac.headquarter_group FROM annual_charge_plan AS ac ) AS acp WHERE acp.years= ? AND acp.headquarter_group IN ('0', '3', '4') GROUP BY acp.secondary_org";
				annualYears = dbSession.query(annualYearSql, orgDimYear);
				annualYearBySignedSql = "SELECT secondary_org, SUM( CAST ( SUM AS NUMERIC ( 18, 2) ) ) AS sum_total FROM annual_charge_plan WHERE years = ? AND headquarter_group IN ('0', '3', '4') GROUP BY secondary_org";
				annualYearBySigneds = dbSession.query(annualYearBySignedSql, orgDimYear);
			} else {
				invoiceYearSql = "SELECT implement_org, book_income, create_time FROM zh_invoice WHERE YEAR(create_time)=? AND app_status='2' AND headquarter_group='1'";
				invoiceYears = dbSession.query(invoiceYearSql, orgDimYear);
				annualYearSql = "SELECT acp.secondary_org, SUM( CAST ( acp.sum AS NUMERIC ( 18, 2) ) ) AS sum_total FROM ( SELECT temp.* FROM ( SELECT ap.years, zc.secondary_org, ap.[sum], zc.headquarter_group FROM annual_payment_plan AS ap LEFT JOIN zh_charge_contract AS zc ON zc.id = ap.charge_id WHERE ap.charge_id IS NOT NULL AND zc.app_status= 2 ) AS temp UNION ALL SELECT ac.years, ac.secondary_org, ac.[sum], ac.headquarter_group FROM annual_charge_plan AS ac ) AS acp WHERE acp.years= ? AND acp.headquarter_group= '1' GROUP BY acp.secondary_org";
				annualYears = dbSession.query(annualYearSql, orgDimYear);
				annualYearBySignedSql = "SELECT secondary_org, SUM( CAST ( SUM AS NUMERIC ( 18, 2) ) ) AS sum_total FROM annual_charge_plan WHERE years = ? AND headquarter_group='1' GROUP BY secondary_org";
				annualYearBySigneds = dbSession.query(annualYearBySignedSql, orgDimYear);
			}
		} else {
			secOrgSql = "SELECT sec_org, SUM( CAST ( target_value AS NUMERIC ( 18, 2) ) ) AS target_value, SUM ( CAST ( threshold_value AS NUMERIC ( 18, 2 ) ) ) AS threshold_value FROM zh_operating_income_threshold WHERE years = ? AND threshold_type = '1' GROUP BY sec_org";
			secOrgs = dbSession.query(secOrgSql, orgDimYear);
			invoiceYearSql = "SELECT implement_org, book_income, create_time FROM zh_invoice WHERE YEAR(create_time)=? AND app_status='2'";
			invoiceYears = dbSession.query(invoiceYearSql, orgDimYear);
			annualYearSql = "SELECT acp.secondary_org, SUM( CAST ( acp.sum AS NUMERIC ( 18, 2) ) ) AS sum_total FROM ( SELECT temp.* FROM ( SELECT ap.years, zc.secondary_org, ap.[sum], zc.headquarter_group FROM annual_payment_plan AS ap LEFT JOIN zh_charge_contract AS zc ON zc.id = ap.charge_id WHERE ap.charge_id IS NOT NULL AND zc.app_status= 2 ) AS temp UNION ALL SELECT ac.years, ac.secondary_org, ac.[sum], ac.headquarter_group FROM annual_charge_plan AS ac ) AS acp WHERE acp.years= ? GROUP BY acp.secondary_org";
			annualYears = dbSession.query(annualYearSql, orgDimYear);
			annualYearBySignedSql = "SELECT secondary_org, SUM( CAST ( SUM AS NUMERIC ( 18, 2) ) ) AS sum_total FROM annual_charge_plan WHERE years = ? GROUP BY secondary_org";
			annualYearBySigneds = dbSession.query(annualYearBySignedSql, orgDimYear);
		}

		if (secOrgs != null && secOrgs.size() > 0) {
			Map<String, Entity> invoiceYearsMap = this.invoiceBySecOrg(invoiceYears, dbSession);

			Map<String, Entity> annualYearsMap = annualYears.stream().collect(Collectors.toMap(new Function<Entity, String>() {

				@Override
				public String apply(Entity t) {
					return t.getStr("secondary_org");
				}
			}, Function.identity(), new BinaryOperator<Entity>() {

				@Override
				public Entity apply(Entity t, Entity u) {
					return u;
				}
			}));

			Map<String, Entity> annualYearBySignedsMap = annualYearBySigneds.stream().collect(Collectors.toMap(new Function<Entity, String>() {

				@Override
				public String apply(Entity t) {
					return t.getStr("secondary_org");
				}
			}, Function.identity(), new BinaryOperator<Entity>() {

				@Override
				public Entity apply(Entity t, Entity u) {
					return u;
				}
			}));

			trackDatas = this.analyzeMerge(secOrgs, invoiceYearsMap, annualYearsMap, annualYearBySignedsMap, dbSession, dictSecOrgs);
		}

		if (StrUtil.equals(authType, "1")) {
			return ArrayUtil.toArray(trackDatas, DataObject.class);
		}
		if (StrUtil.equals(authType, "2")) {
			for (DataObject dataObject : trackDatas) {
				if (StrUtil.equals(dataObject.getString("secOrgId"), secOrgId)) {
					List<DataObject> searchTrackDatas = new ArrayList<DataObject>();
					searchTrackDatas.add(dataObject);
					return ArrayUtil.toArray(searchTrackDatas, DataObject.class);
				}
			}
		}
		return ArrayUtil.toArray(new ArrayList<DataObject>(), DataObject.class);
	}

	// 根据提供的组织获取对应二级组织
	private String getSecOrg(String orgId, Session dbSession) {
		try {
			String secOrgSql = "SELECT ORGSEQ FROM OM_ORGANIZATION WHERE ORGID=?";
			Entity entity = dbSession.queryOne(secOrgSql, orgId);
			if (entity != null) {
				String orgseq = entity.getStr("ORGSEQ");
				String[] splitToArray = StrUtil.splitToArray(orgseq, ".");
				if (splitToArray.length >= 3) {
					String secOrg = splitToArray[2];
					if (StrUtil.isNotBlank(secOrg)) {
						return secOrg;
					} else {
						return null;
					}
				} else {
					return null;
				}
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 对提供的开票数据进行包装（每个组织累计真实收入汇总）
	private Map<String, Entity> invoiceBySecOrg(List<Entity> invoiceYears, Session dbSession) {
		Map<String, Entity> invoiceMap = new HashMap<String, Entity>();
		for (Entity entity : invoiceYears) {
			String secOrgId = this.getSecOrg(entity.getStr("implement_org"), dbSession);
			if (StrUtil.isNotBlank(secOrgId)) {
				if (invoiceMap.containsKey(secOrgId)) {
					Entity data = invoiceMap.get(secOrgId);
					String income = data.getStr("book_income");
					if (StrUtil.isNotBlank(income)) {
						data.set("book_income", NumberUtil.add(income, entity.getStr("book_income")));
					} else {
						data.set("book_income", entity.getBigDecimal("book_income"));
					}
					invoiceMap.put(secOrgId, data);
				} else {
					Entity data = new Entity();
					data.set("book_income", entity.getBigDecimal("book_income"));
					invoiceMap.put(secOrgId, data);
				}
			}
		}
		return invoiceMap;
	}
	
	private List<DataObject> analyzeMerge(List<Entity> secOrgs, Map<String, Entity> invoiceYearsMap, Map<String, Entity> annualYearsMap, Map<String, Entity> annualYearBySignedsMap,
			Session dbSession, List<Entity> dictSecOrgs) {
		List<DataObject> trackDatas = new ArrayList<DataObject>();
		for (Entity secOrg : secOrgs) {
			try {
				Entity orgEntity = dbSession.queryOne("SELECT DICTNAME FROM EOS_DICT_ENTRY WHERE DICTTYPEID='ZH_OPERATION_INCOME_ORG' AND DICTID=?", secOrg.getStr("sec_org"));
				DataObject trackData = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.OperatingTrackAnalyzeEntity");
				trackData.setString("secOrgId", secOrg.getStr("sec_org"));
				trackData.setString("secOrgName", orgEntity.getStr("DICTNAME"));
				trackData.setBigDecimal("targetValue", secOrg.getBigDecimal("target_value"));
				trackData.setBigDecimal("thresholdValue", secOrg.getBigDecimal("threshold_value"));
				if (invoiceYearsMap.containsKey(secOrg.getStr("sec_org"))) {
					Entity invoiceYear = invoiceYearsMap.get(secOrg.getStr("sec_org"));
					trackData.setBigDecimal("cumulativeCompleted", NumberUtil.div(invoiceYear.getBigDecimal("book_income"), 10000, 2));
				} else {
					trackData.setBigDecimal("cumulativeCompleted", new BigDecimal(0));
				}
				if (annualYearsMap.containsKey(secOrg.getStr("sec_org"))) {
					Entity annualYear = annualYearsMap.get(secOrg.getStr("sec_org"));
					trackData.setBigDecimal("totalYear", NumberUtil.div(NumberUtil.div(annualYear.getBigDecimal("sum_total"), 1.06, 2), 10000, 2));
				} else {
					trackData.setBigDecimal("totalYear", new BigDecimal(0));
				}
				if (annualYearBySignedsMap.containsKey(secOrg.getStr("sec_org"))) {
					Entity annualYearBySigned = annualYearBySignedsMap.get(secOrg.getStr("sec_org"));
					trackData.setBigDecimal("toBeSigned", NumberUtil.div(NumberUtil.div(annualYearBySigned.getBigDecimal("sum_total"), 1.06, 2), 10000, 2));
				} else {
					trackData.setBigDecimal("toBeSigned", new BigDecimal(0));
				}
				trackData.setBigDecimal("followUpCcompleted", NumberUtil.sub(trackData.getBigDecimal("totalYear"), trackData.getBigDecimal("cumulativeCompleted")));
				trackDatas.add(trackData);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		List<String> customSort = dictSecOrgs.stream().map(entity -> entity.getStr("DICTNAME")).collect(Collectors.toList());

		List<DataObject> newTrackDatas = ListUtil.sort(trackDatas, new Comparator<DataObject>() {

			@Override
			public int compare(DataObject t1, DataObject t2) {
				int t1Index = customSort.indexOf(t1.getString("secOrgName"));
				t1Index = t1Index == -1 ? Integer.MAX_VALUE : t1Index;
				int t2Index = customSort.indexOf(t2.getString("secOrgName"));
				t2Index = t2Index == -1 ? Integer.MAX_VALUE : t2Index;
				return t1Index - t2Index;
			}
		});

		DataObject trackData = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.OperatingTrackAnalyzeEntity");
		trackData.setString("secOrgId", "1");
		trackData.setString("secOrgName", "合计");

		for (DataObject dataObject : newTrackDatas) {
			trackData.setBigDecimal("targetValue", NumberUtil.add(trackData.getBigDecimal("targetValue"), dataObject.getBigDecimal("targetValue")));
			trackData.setBigDecimal("thresholdValue", NumberUtil.add(trackData.getBigDecimal("thresholdValue"), dataObject.getBigDecimal("thresholdValue")));
			trackData.setBigDecimal("cumulativeCompleted", NumberUtil.add(trackData.getBigDecimal("cumulativeCompleted"), dataObject.getBigDecimal("cumulativeCompleted")));
			trackData.setBigDecimal("totalYear", NumberUtil.add(trackData.getBigDecimal("totalYear"), dataObject.getBigDecimal("totalYear")));
			trackData.setBigDecimal("toBeSigned", NumberUtil.add(trackData.getBigDecimal("toBeSigned"), dataObject.getBigDecimal("toBeSigned")));
			trackData.setBigDecimal("followUpCcompleted", NumberUtil.add(trackData.getBigDecimal("followUpCcompleted"), dataObject.getBigDecimal("followUpCcompleted")));
		}

		newTrackDatas.add(trackData);

		return newTrackDatas;
	}
	
}
