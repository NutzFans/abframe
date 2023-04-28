package com.zhonghe.ame.contractPact;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("月度经营统计 - 集团内外维度")
public class GroupDimMonthlyBudgetTrackUtil {

	@Bizlet("月度经营统计 - 集团内外维度")
	public DataObject[] trackAnalyze(String groupDimYearMonth) throws Exception {
		List<DataObject> trackDatas = new ArrayList<DataObject>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String groupDimYear = StrUtil.subBefore(groupDimYearMonth, '-', false);
		String groupDimMonth = StrUtil.subAfter(groupDimYearMonth, '-', false);

		String queryGroupSql = "SELECT DICTID, DICTNAME FROM EOS_DICT_ENTRY WHERE DICTTYPEID = ? ORDER BY SORTNO ASC";
		List<Entity> groups = dbSession.query(queryGroupSql, "ZH_OPERATION_INCOME_GROUP");

		// 根据年份获取开票数据（集团内外）
		String invoiceYearSql = "SELECT zi.headquarter_group, zi.create_time, zi.receivable_data, zcc.signing_date, zi.invoice_sum, zi.book_income, zi.receivable_sum FROM zh_invoice AS zi LEFT JOIN zh_charge_contract AS zcc ON zi.contract_no = zcc.contract_no WHERE YEAR( zi.create_time) = ? AND zi.app_status= '2'";
		List<Entity> invoiceYears = dbSession.query(invoiceYearSql, groupDimYear);

		Map<String, Entity> invoiceYearsMap = this.invoiceByGroup(invoiceYears, dbSession, groupDimYear, groupDimMonth);

		for (Entity group : groups) {
			DataObject trackData = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.GroupDimMonthlyBudgetTrackEntity");
			trackData.setString("groupId", group.getStr("DICTID"));
			trackData.setString("groupName", group.getStr("DICTNAME"));
			if (group.getStr("DICTID").equals("0")) {
				// 手持合同额
				String holdContractSumSql = "SELECT SUM( CAST ( contract_balance AS NUMERIC ( 18, 2) ) ) AS contract_balance_sum FROM zh_charge_contract WHERE app_status = '2' AND headquarter_group IN ( '0', '3', '4' )";
				Entity holdContractSumEntity = dbSession.queryOne(holdContractSumSql);
				trackData.setBigDecimal("holdContractSum", NumberUtil.div(holdContractSumEntity.getBigDecimal("contract_balance_sum"), 10000, 2));

				// 当月新签合同数量
				String monthContractCountSql = "SELECT COUNT( *) AS month_contract_count FROM zh_charge_contract WHERE YEAR ( signing_date ) =? AND MONTH ( signing_date ) =? AND app_status = '2' AND headquarter_group IN ( '0', '3', '4' )";
				Entity monthContractCountEntity = dbSession.queryOne(monthContractCountSql, groupDimYear, groupDimMonth);
				trackData.setInt("monthContractCount", monthContractCountEntity.getInt("month_contract_count"));

				// 当月新签合同额
				String monthNewContractSumSql = "SELECT SUM( CAST ( contract_sum AS NUMERIC ( 18, 2) ) ) AS contract_sums FROM zh_charge_contract WHERE YEAR ( signing_date ) = ? AND MONTH ( signing_date ) = ? AND app_status = '2' AND headquarter_group IN ( '0', '3', '4' )";
				Entity monthNewContractSumEntity = dbSession.queryOne(monthNewContractSumSql, groupDimYear, groupDimMonth);
				trackData.setBigDecimal("monthNewContractSum", NumberUtil.div(monthNewContractSumEntity.getBigDecimal("contract_sums"), 10000, 2));

				// 本年累计新签合同数量
				String yearContractCountSql = "SELECT COUNT( *) AS year_contract_count FROM zh_charge_contract WHERE YEAR ( signing_date ) = ? AND app_status = '2' AND headquarter_group IN ( '0', '3', '4' )";
				Entity yearContractCountEntity = dbSession.queryOne(yearContractCountSql, groupDimYear);
				trackData.setInt("yearContractCount", yearContractCountEntity.getInt("year_contract_count"));

				// 本年累计新签合同额
				String yearNewContractSumSql = "SELECT SUM( CAST ( contract_sum AS NUMERIC ( 18, 2) ) ) AS contract_sums FROM zh_charge_contract WHERE YEAR ( signing_date ) = ? AND app_status = '2' AND headquarter_group IN ( '0', '3', '4' )";
				Entity yearNewContractSumEntity = dbSession.queryOne(yearNewContractSumSql, groupDimYear);
				trackData.setBigDecimal("yearNewContractSum", NumberUtil.div(yearNewContractSumEntity.getBigDecimal("contract_sums"), 10000, 2));

			} else if (group.getStr("DICTID").equals("1")) {
				// 手持合同额
				String holdContractSumSql = "SELECT SUM( CAST ( contract_balance AS NUMERIC ( 18, 2) ) ) AS contract_balance_sum FROM zh_charge_contract WHERE app_status = '2' AND headquarter_group = '1'";
				Entity holdContractSumEntity = dbSession.queryOne(holdContractSumSql);
				trackData.setBigDecimal("holdContractSum", NumberUtil.div(holdContractSumEntity.getBigDecimal("contract_balance_sum"), 10000, 2));

				// 当月新签合同数量
				String monthContractCountSql = "SELECT COUNT( *) AS month_contract_count FROM zh_charge_contract WHERE YEAR ( signing_date ) =? AND MONTH ( signing_date ) =? AND app_status = '2' AND headquarter_group = '1'";
				Entity monthContractCountEntity = dbSession.queryOne(monthContractCountSql, groupDimYear, groupDimMonth);
				trackData.setInt("monthContractCount", monthContractCountEntity.getInt("month_contract_count"));

				// 当月新签合同额
				String monthNewContractSumSql = "SELECT SUM( CAST ( contract_sum AS NUMERIC ( 18, 2) ) ) AS contract_sums FROM zh_charge_contract WHERE YEAR ( signing_date ) = ? AND MONTH ( signing_date ) = ? AND app_status = '2' AND headquarter_group = '1'";
				Entity monthNewContractSumEntity = dbSession.queryOne(monthNewContractSumSql, groupDimYear, groupDimMonth);
				trackData.setBigDecimal("monthNewContractSum", NumberUtil.div(monthNewContractSumEntity.getBigDecimal("contract_sums"), 10000, 2));

				// 本年累计新签合同数量
				String yearContractCountSql = "SELECT COUNT( *) AS year_contract_count FROM zh_charge_contract WHERE YEAR ( signing_date ) = ? AND app_status = '2' AND headquarter_group = '1'";
				Entity yearContractCountEntity = dbSession.queryOne(yearContractCountSql, groupDimYear);
				trackData.setInt("yearContractCount", yearContractCountEntity.getInt("year_contract_count"));

				// 本年累计新签合同额
				String yearNewContractSumSql = "SELECT SUM( CAST ( contract_sum AS NUMERIC ( 18, 2) ) ) AS contract_sums FROM zh_charge_contract WHERE YEAR ( signing_date ) = ? AND app_status = '2' AND headquarter_group = '1'";
				Entity yearNewContractSumEntity = dbSession.queryOne(yearNewContractSumSql, groupDimYear);
				trackData.setBigDecimal("yearNewContractSum", NumberUtil.div(yearNewContractSumEntity.getBigDecimal("contract_sums"), 10000, 2));

			}

			if (invoiceYearsMap.containsKey(group.getStr("DICTID"))) {
				Entity invoiceYear = invoiceYearsMap.get(group.getStr("DICTID"));
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

		DataObject trackData = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.GroupDimMonthlyBudgetTrackEntity");
		trackData.setString("groupId", "hj");
		trackData.setString("groupName", "合计");

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

		return ArrayUtil.toArray(trackDatas, DataObject.class);
	}

	// 对提供的开票数据进行包装（集团内外汇总）
	private Map<String, Entity> invoiceByGroup(List<Entity> invoiceYears, Session dbSession, String groupDimYear, String groupDimMonth) {
		Map<String, Entity> invoiceMap = new HashMap<String, Entity>();
		for (Entity invoiceYear : invoiceYears) {
			if (StrUtil.containsAny(invoiceYear.getStr("headquarter_group"), "0", "3", "4")) {
				if (invoiceMap.containsKey("0")) {
					Entity entity = invoiceMap.get("0");
					String createTime = StrUtil.subPre(invoiceYear.getStr("create_time"), 7);
					String signingDate = StrUtil.subPre(invoiceYear.getStr("signing_date"), 7);
					String receivableDate = StrUtil.subPre(invoiceYear.getStr("receivable_data"), 7);

					// 当月合同执行额
					if (StrUtil.endWith(createTime, groupDimMonth)) {
						entity.set("monthContractExecutionSum", NumberUtil.add(entity.getBigDecimal("monthContractExecutionSum"), invoiceYear.getBigDecimal("invoice_sum")));
					}

					// 当月新签合同执行额
					if (StrUtil.endWith(createTime, groupDimMonth) && StrUtil.endWith(signingDate, groupDimMonth) && StrUtil.startWith(signingDate, groupDimYear)) {
						entity.set("monthNewContractExecutionSum",
								NumberUtil.add(entity.getBigDecimal("monthNewContractExecutionSum"), invoiceYear.getBigDecimal("invoice_sum")));
					}

					// 当月合同收款额
					if (StrUtil.startWith(receivableDate, groupDimYear) && StrUtil.endWith(receivableDate, groupDimMonth)) {
						entity.set("monthReceiveSum", NumberUtil.add(entity.getBigDecimal("monthReceiveSum"), invoiceYear.getBigDecimal("receivable_sum")));
					}

					// 本年累计合同执行额
					entity.set("yearContractExecutionSum", NumberUtil.add(entity.getBigDecimal("yearContractExecutionSum"), invoiceYear.getBigDecimal("invoice_sum")));

					// 本年累计新签合同执行额
					if (StrUtil.startWith(signingDate, groupDimYear)) {
						entity.set("yearNewContractExecutionSum", NumberUtil.add(entity.getBigDecimal("yearNewContractExecutionSum"), invoiceYear.getBigDecimal("invoice_sum")));
					}

					// 本年累计合同收款额
					if (StrUtil.startWith(receivableDate, groupDimYear)) {
						entity.set("yearReceiveSum", NumberUtil.add(entity.getBigDecimal("yearReceiveSum"), invoiceYear.getBigDecimal("receivable_sum")));
					}

					invoiceMap.put("0", entity);

				} else {
					Entity entity = new Entity();
					String createTime = StrUtil.subPre(invoiceYear.getStr("create_time"), 7);
					String signingDate = StrUtil.subPre(invoiceYear.getStr("signing_date"), 7);
					String receivableDate = StrUtil.subPre(invoiceYear.getStr("receivable_data"), 7);

					// 当月合同执行额
					if (StrUtil.endWith(createTime, groupDimMonth)) {
						entity.set("monthContractExecutionSum", invoiceYear.getBigDecimal("invoice_sum"));
					} else {
						entity.set("monthContractExecutionSum", new BigDecimal(0));
					}

					// 当月新签合同执行额
					if (StrUtil.endWith(createTime, groupDimMonth) && StrUtil.endWith(signingDate, groupDimMonth) && StrUtil.startWith(signingDate, groupDimYear)) {
						entity.set("monthNewContractExecutionSum", invoiceYear.getBigDecimal("invoice_sum"));
					} else {
						entity.set("monthNewContractExecutionSum", new BigDecimal(0));
					}

					// 当月合同收款额
					if (StrUtil.startWith(receivableDate, groupDimYear) && StrUtil.endWith(receivableDate, groupDimMonth)) {
						entity.set("monthReceiveSum", invoiceYear.getBigDecimal("receivable_sum"));
					} else {
						entity.set("monthReceiveSum", new BigDecimal(0));
					}

					// 本年累计合同执行额
					entity.set("yearContractExecutionSum", invoiceYear.getBigDecimal("invoice_sum"));

					// 本年累计新签合同执行额
					if (StrUtil.startWith(signingDate, groupDimYear)) {
						entity.set("yearNewContractExecutionSum", invoiceYear.getBigDecimal("invoice_sum"));
					} else {
						entity.set("yearNewContractExecutionSum", new BigDecimal(0));
					}

					// 本年累计合同收款额
					if (StrUtil.startWith(receivableDate, groupDimYear)) {
						entity.set("yearReceiveSum", invoiceYear.getBigDecimal("receivable_sum"));
					} else {
						entity.set("yearReceiveSum", new BigDecimal(0));
					}

					invoiceMap.put("0", entity);
				}

			} else if (StrUtil.contains(invoiceYear.getStr("headquarter_group"), "1")) {
				if (invoiceMap.containsKey("1")) {
					Entity entity = invoiceMap.get("1");
					String createTime = StrUtil.subPre(invoiceYear.getStr("create_time"), 7);
					String signingDate = StrUtil.subPre(invoiceYear.getStr("signing_date"), 7);
					String receivableDate = StrUtil.subPre(invoiceYear.getStr("receivable_data"), 7);

					// 当月合同执行额
					if (StrUtil.endWith(createTime, groupDimMonth)) {
						entity.set("monthContractExecutionSum", NumberUtil.add(entity.getBigDecimal("monthContractExecutionSum"), invoiceYear.getBigDecimal("invoice_sum")));
					}

					// 当月新签合同执行额
					if (StrUtil.endWith(createTime, groupDimMonth) && StrUtil.endWith(signingDate, groupDimMonth) && StrUtil.startWith(signingDate, groupDimYear)) {
						entity.set("monthNewContractExecutionSum",
								NumberUtil.add(entity.getBigDecimal("monthNewContractExecutionSum"), invoiceYear.getBigDecimal("invoice_sum")));
					}

					// 当月合同收款额
					if (StrUtil.startWith(receivableDate, groupDimYear) && StrUtil.endWith(receivableDate, groupDimMonth)) {
						entity.set("monthReceiveSum", NumberUtil.add(entity.getBigDecimal("monthReceiveSum"), invoiceYear.getBigDecimal("receivable_sum")));
					}

					// 本年累计合同执行额
					entity.set("yearContractExecutionSum", NumberUtil.add(entity.getBigDecimal("yearContractExecutionSum"), invoiceYear.getBigDecimal("invoice_sum")));

					// 本年累计新签合同执行额
					if (StrUtil.startWith(signingDate, groupDimYear)) {
						entity.set("yearNewContractExecutionSum", NumberUtil.add(entity.getBigDecimal("yearNewContractExecutionSum"), invoiceYear.getBigDecimal("invoice_sum")));
					}

					// 本年累计合同收款额
					if (StrUtil.startWith(receivableDate, groupDimYear)) {
						entity.set("yearReceiveSum", NumberUtil.add(entity.getBigDecimal("yearReceiveSum"), invoiceYear.getBigDecimal("receivable_sum")));
					}

					invoiceMap.put("1", entity);

				} else {
					Entity entity = new Entity();
					String createTime = StrUtil.subPre(invoiceYear.getStr("create_time"), 7);
					String signingDate = StrUtil.subPre(invoiceYear.getStr("signing_date"), 7);
					String receivableDate = StrUtil.subPre(invoiceYear.getStr("receivable_data"), 7);

					// 当月合同执行额
					if (StrUtil.endWith(createTime, groupDimMonth)) {
						entity.set("monthContractExecutionSum", invoiceYear.getBigDecimal("invoice_sum"));
					} else {
						entity.set("monthContractExecutionSum", new BigDecimal(0));
					}

					// 当月新签合同执行额
					if (StrUtil.endWith(createTime, groupDimMonth) && StrUtil.endWith(signingDate, groupDimMonth) && StrUtil.startWith(signingDate, groupDimYear)) {
						entity.set("monthNewContractExecutionSum", invoiceYear.getBigDecimal("invoice_sum"));
					} else {
						entity.set("monthNewContractExecutionSum", new BigDecimal(0));
					}

					// 当月合同收款额
					if (StrUtil.startWith(receivableDate, groupDimYear) && StrUtil.endWith(receivableDate, groupDimMonth)) {
						entity.set("monthReceiveSum", invoiceYear.getBigDecimal("receivable_sum"));
					} else {
						entity.set("monthReceiveSum", new BigDecimal(0));
					}

					// 本年累计合同执行额
					entity.set("yearContractExecutionSum", invoiceYear.getBigDecimal("invoice_sum"));

					// 本年累计新签合同执行额
					if (StrUtil.startWith(signingDate, groupDimYear)) {
						entity.set("yearNewContractExecutionSum", invoiceYear.getBigDecimal("invoice_sum"));
					} else {
						entity.set("yearNewContractExecutionSum", new BigDecimal(0));
					}

					// 本年累计合同收款额
					if (StrUtil.startWith(receivableDate, groupDimYear)) {
						entity.set("yearReceiveSum", invoiceYear.getBigDecimal("receivable_sum"));
					} else {
						entity.set("yearReceiveSum", new BigDecimal(0));
					}

					invoiceMap.put("1", entity);
				}
			}
		}
		return invoiceMap;
	}
}
