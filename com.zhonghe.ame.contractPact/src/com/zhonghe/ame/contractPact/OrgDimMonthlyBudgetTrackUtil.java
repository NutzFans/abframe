package com.zhonghe.ame.contractPact;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("月度经营统计 - 单位维度")
public class OrgDimMonthlyBudgetTrackUtil {

	@Bizlet("月度经营统计 - 单位维度")
	public DataObject[] trackAnalyze(String orgDimYearMonth, String orgDimGroup, String authType, String secOrgId) throws Exception {
		List<DataObject> trackDatas = new ArrayList<DataObject>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String orgDimYear = StrUtil.subBefore(orgDimYearMonth, '-', false);
		String orgDimMonth = StrUtil.subAfter(orgDimYearMonth, '-', false);
		String startDate = StrUtil.format("{}-{}-{}", orgDimYear, "01", "01");
		String endDate = DateUtil.endOfMonth(DateUtil.parse(orgDimYearMonth, "yyyy-MM")).toString("yyyy-MM-dd");

		String queryOrgSql = "SELECT DICTID, DICTNAME FROM EOS_DICT_ENTRY WHERE DICTTYPEID = ? ORDER BY SORTNO ASC";
		List<Entity> secOrgs = dbSession.query(queryOrgSql, "ZH_OPERATION_INCOME_ORG");

		// 根据年份获取开票数据（集团内外）
		String invoiceYearSql = "";
		List<Entity> invoiceYears = new ArrayList<Entity>();

		if (StrUtil.isNotBlank(orgDimGroup)) {
			if (orgDimGroup.equals("0")) {
				invoiceYearSql = "SELECT zi.implement_org, zi.create_time, zi.receivable_data, zcc.signing_date, zi.invoice_sum, zi.book_income, zi.receivable_sum FROM zh_invoice AS zi LEFT JOIN zh_charge_contract AS zcc ON zi.contract_no = zcc.contract_no WHERE zi.create_time >= ? AND zi.create_time <= ? AND zi.app_status= '2' AND zi.headquarter_group IN ( '0', '3', '4' )";
				invoiceYears = dbSession.query(invoiceYearSql, startDate, endDate);
			} else {
				invoiceYearSql = "SELECT zi.implement_org, zi.create_time, zi.receivable_data, zcc.signing_date, zi.invoice_sum, zi.book_income, zi.receivable_sum FROM zh_invoice AS zi LEFT JOIN zh_charge_contract AS zcc ON zi.contract_no = zcc.contract_no WHERE zi.create_time >= ? AND zi.create_time <= ? AND zi.app_status= '2' AND zi.headquarter_group='1'";
				invoiceYears = dbSession.query(invoiceYearSql, startDate, endDate);
			}
		} else {
			invoiceYearSql = "SELECT zi.implement_org, zi.create_time, zi.receivable_data, zcc.signing_date, zi.invoice_sum, zi.book_income, zi.receivable_sum FROM zh_invoice AS zi LEFT JOIN zh_charge_contract AS zcc ON zi.contract_no = zcc.contract_no WHERE zi.create_time >= ? AND zi.create_time <= ? AND zi.app_status= '2'";
			invoiceYears = dbSession.query(invoiceYearSql, startDate, endDate);
		}

		Map<String, Entity> invoiceYearsMap = this.invoiceBySecOrg(invoiceYears, dbSession, orgDimYear, orgDimMonth);

		for (Entity secOrg : secOrgs) {
			DataObject trackData = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.OrgDimMonthlyBudgetTrackEntity");
			trackData.setString("secOrgId", secOrg.getStr("DICTID"));
			trackData.setString("secOrgName", secOrg.getStr("DICTNAME"));
			if (StrUtil.isNotBlank(orgDimGroup)) {
				if (orgDimGroup.equals("0")) {
					// 手持合同额
					String holdContractSumSql = "SELECT SUM( CAST ( contract_balance AS NUMERIC ( 18, 2) ) ) AS contract_balance_sum FROM zh_charge_contract WHERE secondary_org = ? AND app_status = '2' AND headquarter_group IN ( '0', '3', '4' )";
					Entity holdContractSumEntity = dbSession.queryOne(holdContractSumSql, secOrg.getStr("DICTID"));
					trackData.setBigDecimal("holdContractSum", NumberUtil.div(holdContractSumEntity.getBigDecimal("contract_balance_sum"), 10000, 2));

					// 当月新签合同数量
					String monthContractCountSql = "SELECT COUNT(*) AS month_contract_count FROM zh_charge_contract WHERE YEAR(signing_date)=? AND MONTH(signing_date)=? AND secondary_org=? AND app_status='2' AND headquarter_group IN ( '0', '3', '4' )";
					Entity monthContractCountEntity = dbSession.queryOne(monthContractCountSql, orgDimYear, orgDimMonth, secOrg.getStr("DICTID"));
					trackData.setInt("monthContractCount", monthContractCountEntity.getInt("month_contract_count"));

					// 当月新签合同额
					String monthNewContractSumSql = "SELECT SUM( CAST ( contract_sum AS NUMERIC ( 18, 2) ) ) AS contract_sums FROM zh_charge_contract WHERE YEAR ( signing_date ) = ? AND MONTH ( signing_date ) = ? AND secondary_org = ? AND app_status = '2' AND headquarter_group IN ( '0', '3', '4' )";
					Entity monthNewContractSumEntity = dbSession.queryOne(monthNewContractSumSql, orgDimYear, orgDimMonth, secOrg.getStr("DICTID"));
					trackData.setBigDecimal("monthNewContractSum", NumberUtil.div(monthNewContractSumEntity.getBigDecimal("contract_sums"), 10000, 2));

					// 本年累计新签合同数量
					String yearContractCountSql = "SELECT COUNT( *) AS year_contract_count FROM zh_charge_contract WHERE signing_date >= ? AND signing_date <= ? AND secondary_org = ? AND app_status = '2' AND headquarter_group IN ( '0', '3', '4' )";
					Entity yearContractCountEntity = dbSession.queryOne(yearContractCountSql, startDate, endDate, secOrg.getStr("DICTID"));
					trackData.setInt("yearContractCount", yearContractCountEntity.getInt("year_contract_count"));

					// 本年累计新签合同额
					String yearNewContractSumSql = "SELECT SUM( CAST ( contract_sum AS NUMERIC ( 18, 2) ) ) AS contract_sums FROM zh_charge_contract WHERE signing_date >= ? AND signing_date <= ? AND secondary_org = ? AND app_status = '2' AND headquarter_group IN ( '0', '3', '4' )";
					Entity yearNewContractSumEntity = dbSession.queryOne(yearNewContractSumSql, startDate, endDate, secOrg.getStr("DICTID"));
					trackData.setBigDecimal("yearNewContractSum", NumberUtil.div(yearNewContractSumEntity.getBigDecimal("contract_sums"), 10000, 2));

				} else {
					// 手持合同额
					String holdContractSumSql = "SELECT SUM( CAST ( contract_balance AS NUMERIC ( 18, 2) ) ) AS contract_balance_sum FROM zh_charge_contract WHERE secondary_org = ? AND app_status = '2' AND headquarter_group='1'";
					Entity holdContractSumEntity = dbSession.queryOne(holdContractSumSql, secOrg.getStr("DICTID"));
					trackData.setBigDecimal("holdContractSum", NumberUtil.div(holdContractSumEntity.getBigDecimal("contract_balance_sum"), 10000, 2));

					// 当月新签合同数量
					String monthContractCountSql = "SELECT COUNT(*) AS month_contract_count FROM zh_charge_contract WHERE YEAR(signing_date)=? AND MONTH(signing_date)=? AND secondary_org=? AND app_status='2' AND headquarter_group='1'";
					Entity monthContractCountEntity = dbSession.queryOne(monthContractCountSql, orgDimYear, orgDimMonth, secOrg.getStr("DICTID"));
					trackData.setInt("monthContractCount", monthContractCountEntity.getInt("month_contract_count"));

					// 当月新签合同额
					String monthNewContractSumSql = "SELECT SUM( CAST ( contract_sum AS NUMERIC ( 18, 2) ) ) AS contract_sums FROM zh_charge_contract WHERE YEAR ( signing_date ) = ? AND MONTH ( signing_date ) = ? AND secondary_org = ? AND app_status = '2' AND headquarter_group='1'";
					Entity monthNewContractSumEntity = dbSession.queryOne(monthNewContractSumSql, orgDimYear, orgDimMonth, secOrg.getStr("DICTID"));
					trackData.setBigDecimal("monthNewContractSum", NumberUtil.div(monthNewContractSumEntity.getBigDecimal("contract_sums"), 10000, 2));

					// 本年累计新签合同数量
					String yearContractCountSql = "SELECT COUNT( *) AS year_contract_count FROM zh_charge_contract WHERE signing_date >= ? AND signing_date <= ? AND secondary_org = ? AND app_status = '2' AND headquarter_group='1'";
					Entity yearContractCountEntity = dbSession.queryOne(yearContractCountSql, startDate, endDate, secOrg.getStr("DICTID"));
					trackData.setInt("yearContractCount", yearContractCountEntity.getInt("year_contract_count"));

					// 本年累计新签合同额
					String yearNewContractSumSql = "SELECT SUM( CAST ( contract_sum AS NUMERIC ( 18, 2) ) ) AS contract_sums FROM zh_charge_contract WHERE signing_date >= ? AND signing_date <= ? AND secondary_org = ? AND app_status = '2' AND headquarter_group='1'";
					Entity yearNewContractSumEntity = dbSession.queryOne(yearNewContractSumSql, startDate, endDate, secOrg.getStr("DICTID"));
					trackData.setBigDecimal("yearNewContractSum", NumberUtil.div(yearNewContractSumEntity.getBigDecimal("contract_sums"), 10000, 2));

				}
			} else {
				// 手持合同额
				String holdContractSumSql = "SELECT SUM( CAST ( contract_balance AS NUMERIC ( 18, 2) ) ) AS contract_balance_sum FROM zh_charge_contract WHERE secondary_org=? AND app_status='2'";
				Entity holdContractSumEntity = dbSession.queryOne(holdContractSumSql, secOrg.getStr("DICTID"));
				trackData.setBigDecimal("holdContractSum", NumberUtil.div(holdContractSumEntity.getBigDecimal("contract_balance_sum"), 10000, 2));

				// 当月新签合同数量
				String monthContractCountSql = "SELECT COUNT(*) AS month_contract_count FROM zh_charge_contract WHERE YEAR(signing_date)=? AND MONTH(signing_date)=? AND secondary_org=? AND app_status='2'";
				Entity monthContractCountEntity = dbSession.queryOne(monthContractCountSql, orgDimYear, orgDimMonth, secOrg.getStr("DICTID"));
				trackData.setInt("monthContractCount", monthContractCountEntity.getInt("month_contract_count"));

				// 当月新签合同额
				String monthNewContractSumSql = "SELECT SUM( CAST ( contract_sum AS NUMERIC ( 18, 2) ) ) AS contract_sums FROM zh_charge_contract WHERE YEAR ( signing_date ) = ? AND MONTH ( signing_date ) = ? AND secondary_org = ? AND app_status = '2'";
				Entity monthNewContractSumEntity = dbSession.queryOne(monthNewContractSumSql, orgDimYear, orgDimMonth, secOrg.getStr("DICTID"));
				trackData.setBigDecimal("monthNewContractSum", NumberUtil.div(monthNewContractSumEntity.getBigDecimal("contract_sums"), 10000, 2));

				// 本年累计新签合同数量
				String yearContractCountSql = "SELECT COUNT( *) AS year_contract_count FROM zh_charge_contract WHERE signing_date >= ? AND signing_date <= ? AND secondary_org = ? AND app_status = '2'";
				Entity yearContractCountEntity = dbSession.queryOne(yearContractCountSql, startDate, endDate, secOrg.getStr("DICTID"));
				trackData.setInt("yearContractCount", yearContractCountEntity.getInt("year_contract_count"));

				// 本年累计新签合同额
				String yearNewContractSumSql = "SELECT SUM( CAST ( contract_sum AS NUMERIC ( 18, 2) ) ) AS contract_sums FROM zh_charge_contract WHERE signing_date >= ? AND signing_date <= ? AND secondary_org = ? AND app_status = '2'";
				Entity yearNewContractSumEntity = dbSession.queryOne(yearNewContractSumSql, startDate, endDate, secOrg.getStr("DICTID"));
				trackData.setBigDecimal("yearNewContractSum", NumberUtil.div(yearNewContractSumEntity.getBigDecimal("contract_sums"), 10000, 2));
			}

			if (invoiceYearsMap.containsKey(secOrg.getStr("DICTID"))) {
				Entity invoiceYear = invoiceYearsMap.get(secOrg.getStr("DICTID"));
				// 当月合同执行额
				trackData.setBigDecimal("monthContractExecutionSum", NumberUtil.div(invoiceYear.getBigDecimal("monthContractExecutionSum"), 10000, 2));
				// 当月新签合同执行额
				trackData.setBigDecimal("monthNewContractExecutionSum", NumberUtil.div(invoiceYear.getBigDecimal("monthNewContractExecutionSum"), 10000, 2));
				// 当月合同收款额
				trackData.setBigDecimal("monthReceiveSum", NumberUtil.div(invoiceYear.getBigDecimal("monthReceiveSum"), 10000, 2));
				// 本年累计合同执行额
				trackData.setBigDecimal("yearContractExecutionSum", NumberUtil.div(invoiceYear.getBigDecimal("yearContractExecutionSum"), 10000, 2));
				// 本年累计新签合同执行额
				trackData.setBigDecimal("yearNewContractExecutionSum", NumberUtil.div(invoiceYear.getBigDecimal("yearNewContractExecutionSum"), 10000, 2));
				// 本年累计合同收款额
				trackData.setBigDecimal("yearReceiveSum", NumberUtil.div(invoiceYear.getBigDecimal("yearReceiveSum"), 10000, 2));
			} else {
				trackData.setBigDecimal("monthContractExecutionSum", new BigDecimal(0));
				trackData.setBigDecimal("monthNewContractExecutionSum", new BigDecimal(0));
				trackData.setBigDecimal("monthReceiveSum", new BigDecimal(0));
				trackData.setBigDecimal("yearContractExecutionSum", new BigDecimal(0));
				trackData.setBigDecimal("yearNewContractExecutionSum", new BigDecimal(0));
				trackData.setBigDecimal("yearReceiveSum", new BigDecimal(0));
			}

			trackDatas.add(trackData);
		}

		DataObject trackData = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.OrgDimMonthlyBudgetTrackEntity");
		trackData.setString("secOrgId", "1");
		trackData.setString("secOrgName", "合计");

		for (DataObject dataObject : trackDatas) {
			trackData.setBigDecimal("holdContractSum", NumberUtil.add(trackData.getBigDecimal("holdContractSum"), dataObject.getBigDecimal("holdContractSum")));
			trackData.setInt("monthContractCount", NumberUtil.add(trackData.getBigDecimal("monthContractCount"), dataObject.getBigDecimal("monthContractCount")).toBigInteger().intValue());
			trackData.setBigDecimal("monthNewContractSum", NumberUtil.add(trackData.getBigDecimal("monthNewContractSum"), dataObject.getBigDecimal("monthNewContractSum")));
			trackData.setInt("yearContractCount", NumberUtil.add(trackData.getBigDecimal("yearContractCount"), dataObject.getBigDecimal("yearContractCount")).toBigInteger().intValue());
			trackData.setBigDecimal("yearNewContractSum", NumberUtil.add(trackData.getBigDecimal("yearNewContractSum"), dataObject.getBigDecimal("yearNewContractSum")));
			trackData.setBigDecimal("monthContractExecutionSum",
					NumberUtil.add(trackData.getBigDecimal("monthContractExecutionSum"), dataObject.getBigDecimal("monthContractExecutionSum")));
			trackData.setBigDecimal("monthNewContractExecutionSum",
					NumberUtil.add(trackData.getBigDecimal("monthNewContractExecutionSum"), dataObject.getBigDecimal("monthNewContractExecutionSum")));
			trackData.setBigDecimal("monthReceiveSum", NumberUtil.add(trackData.getBigDecimal("monthReceiveSum"), dataObject.getBigDecimal("monthReceiveSum")));
			trackData.setBigDecimal("yearContractExecutionSum", NumberUtil.add(trackData.getBigDecimal("yearContractExecutionSum"), dataObject.getBigDecimal("yearContractExecutionSum")));
			trackData.setBigDecimal("yearNewContractExecutionSum",
					NumberUtil.add(trackData.getBigDecimal("yearNewContractExecutionSum"), dataObject.getBigDecimal("yearNewContractExecutionSum")));
			trackData.setBigDecimal("yearReceiveSum", NumberUtil.add(trackData.getBigDecimal("yearReceiveSum"), dataObject.getBigDecimal("yearReceiveSum")));
		}

		trackDatas.add(trackData);

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

	// 对提供的开票数据进行包装（每个组织汇总）
	private Map<String, Entity> invoiceBySecOrg(List<Entity> invoiceYears, Session dbSession, String orgDimYear, String orgDimMonth) {
		Map<String, Entity> invoiceMap = new HashMap<String, Entity>();
		for (Entity invoiceYear : invoiceYears) {
			String secOrgId = this.getSecOrg(invoiceYear.getStr("implement_org"), dbSession);
			if (StrUtil.isNotBlank(secOrgId)) {
				if (invoiceMap.containsKey(secOrgId)) {
					Entity entity = invoiceMap.get(secOrgId);
					String createTime = StrUtil.subPre(invoiceYear.getStr("create_time"), 7);
					String signingDate = StrUtil.subPre(invoiceYear.getStr("signing_date"), 7);
					String receivableDate = StrUtil.subPre(invoiceYear.getStr("receivable_data"), 7);

					// 当月合同执行额
					if (StrUtil.endWith(createTime, orgDimMonth)) {
						entity.set("monthContractExecutionSum", NumberUtil.add(entity.getBigDecimal("monthContractExecutionSum"), invoiceYear.getBigDecimal("invoice_sum")));
					}

					// 当月新签合同执行额
					if (StrUtil.endWith(createTime, orgDimMonth) && StrUtil.endWith(signingDate, orgDimMonth) && StrUtil.startWith(signingDate, orgDimYear)) {
						entity.set("monthNewContractExecutionSum",
								NumberUtil.add(entity.getBigDecimal("monthNewContractExecutionSum"), invoiceYear.getBigDecimal("invoice_sum")));
					}

					// 当月合同收款额
					if (StrUtil.startWith(receivableDate, orgDimYear) && StrUtil.endWith(receivableDate, orgDimMonth)) {
						entity.set("monthReceiveSum", NumberUtil.add(entity.getBigDecimal("monthReceiveSum"), invoiceYear.getBigDecimal("receivable_sum")));
					}

					// 本年累计合同执行额
					entity.set("yearContractExecutionSum", NumberUtil.add(entity.getBigDecimal("yearContractExecutionSum"), invoiceYear.getBigDecimal("invoice_sum")));

					// 本年累计新签合同执行额
					if (StrUtil.startWith(signingDate, orgDimYear)) {
						entity.set("yearNewContractExecutionSum", NumberUtil.add(entity.getBigDecimal("yearNewContractExecutionSum"), invoiceYear.getBigDecimal("invoice_sum")));
					}

					// 本年累计合同收款额
					if (StrUtil.startWith(receivableDate, orgDimYear)) {
						entity.set("yearReceiveSum", NumberUtil.add(entity.getBigDecimal("yearReceiveSum"), invoiceYear.getBigDecimal("receivable_sum")));
					}

					invoiceMap.put(secOrgId, entity);

				} else {
					Entity entity = new Entity();
					String createTime = StrUtil.subPre(invoiceYear.getStr("create_time"), 7);
					String signingDate = StrUtil.subPre(invoiceYear.getStr("signing_date"), 7);
					String receivableDate = StrUtil.subPre(invoiceYear.getStr("receivable_data"), 7);

					// 当月合同执行额
					if (StrUtil.endWith(createTime, orgDimMonth)) {
						entity.set("monthContractExecutionSum", invoiceYear.getBigDecimal("invoice_sum"));
					} else {
						entity.set("monthContractExecutionSum", new BigDecimal(0));
					}

					// 当月新签合同执行额
					if (StrUtil.endWith(createTime, orgDimMonth) && StrUtil.endWith(signingDate, orgDimMonth) && StrUtil.startWith(signingDate, orgDimYear)) {
						entity.set("monthNewContractExecutionSum", invoiceYear.getBigDecimal("invoice_sum"));
					} else {
						entity.set("monthNewContractExecutionSum", new BigDecimal(0));
					}

					// 当月合同收款额
					if (StrUtil.startWith(receivableDate, orgDimYear) && StrUtil.endWith(receivableDate, orgDimMonth)) {
						entity.set("monthReceiveSum", invoiceYear.getBigDecimal("receivable_sum"));
					} else {
						entity.set("monthReceiveSum", new BigDecimal(0));
					}

					// 本年累计合同执行额
					entity.set("yearContractExecutionSum", invoiceYear.getBigDecimal("invoice_sum"));

					// 本年累计新签合同执行额
					if (StrUtil.startWith(signingDate, orgDimYear)) {
						entity.set("yearNewContractExecutionSum", invoiceYear.getBigDecimal("invoice_sum"));
					} else {
						entity.set("yearNewContractExecutionSum", new BigDecimal(0));
					}

					// 本年累计合同收款额
					if (StrUtil.startWith(receivableDate, orgDimYear)) {
						entity.set("yearReceiveSum", invoiceYear.getBigDecimal("receivable_sum"));
					} else {
						entity.set("yearReceiveSum", new BigDecimal(0));
					}

					invoiceMap.put(secOrgId, entity);
				}
			}
		}
		return invoiceMap;
	}

}
