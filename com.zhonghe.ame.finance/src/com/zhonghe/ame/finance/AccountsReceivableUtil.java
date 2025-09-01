package com.zhonghe.ame.finance;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.OptionalDouble;
import java.util.Set;
import java.util.stream.Collectors;

import mondrian.rolap.BitKey.Big;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("应收账款工具类")
public class AccountsReceivableUtil {

	@Bizlet("应收账款统计数据 - 图表")
	public List<Entity> queryTjByChartDatas(String year, String month, Boolean outsideTheGroup) throws Exception {
		if (StrUtil.isNotBlank(month) && month.length() == 1) {
			month = "0" + month;
		}
		String tjYearMonth = year + "-" + month;
		String tjHeadquarterGroup = outsideTheGroup ? "1" : null;
		return this.queryTjDatas(null, tjYearMonth, null, tjHeadquarterGroup);
	}

	@Bizlet("应收账款统计数据")
	public List<Entity> queryTjDatas(String tjSec, String tjYearMonth, String tjSecondaryOrg, String tjHeadquarterGroup) throws Exception {
		List<Entity> entityList = new ArrayList<Entity>();
		Map<String, String> dateMap = this.buildDateMap(tjYearMonth);
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String searchSecOrg = this.getSecOrg(tjSec, tjSecondaryOrg);
		if (StrUtil.isNotBlank(searchSecOrg)) {
			String queryInvoiceSumSql = "SELECT secondary_orgname, invoice_sum, headquarter_group FROM zh_invoice WHERE app_status = '2' AND create_time >= ? AND create_time <= ? AND secondary_org = ?";
			String queryReceivableSumSql = "SELECT secondary_orgname, receivable_sum, headquarter_group, create_time, receivable_data FROM zh_invoice WHERE app_status = '2' AND receivable_data >= ? AND receivable_data <= ? AND secondary_org = ?";
			String querySnapshotSql = "SELECT zars.*, org.ORGNAME AS secondary_orgname FROM zh_accounts_receivable_snapshot AS zars , OM_ORGANIZATION AS org WHERE zars.ar_year = ? AND zars.ar_month = ? AND zars.secondary_org = ? AND zars.secondary_org = org.ORGID";
			List<Entity> invoiceSumEntityList = dbSession.query(queryInvoiceSumSql, dateMap.get("beginOfYear"), dateMap.get("endOfMonth"), searchSecOrg);
			List<Entity> receivableSumEntityList = dbSession.query(queryReceivableSumSql, dateMap.get("beginOfYear"), dateMap.get("endOfMonth"), searchSecOrg);
			List<Entity> snapshotEntityList = dbSession.query(querySnapshotSql, dateMap.get("year"), dateMap.get("month"), searchSecOrg);
			Entity entity = this.buildData(invoiceSumEntityList, receivableSumEntityList, snapshotEntityList, tjHeadquarterGroup, dbSession, searchSecOrg);
			entityList.add(entity);
		} else {
			List<Entity> secOrgList = this.getBusSecOrgList(dbSession);
			String queryInvoiceSumSql = "SELECT secondary_orgname, secondary_org, invoice_sum, headquarter_group FROM zh_invoice WHERE app_status = '2' AND create_time >= ? AND create_time <= ?";
			String queryReceivableSumSql = "SELECT secondary_orgname, secondary_org, receivable_sum, headquarter_group, create_time, receivable_data FROM zh_invoice WHERE app_status = '2' AND receivable_data >= ? AND receivable_data <= ?";
			String querySnapshotSql = "SELECT * FROM zh_accounts_receivable_snapshot WHERE ar_year = ? AND ar_month = ?";
			List<Entity> invoiceSumEntityListAll = dbSession.query(queryInvoiceSumSql, dateMap.get("beginOfYear"), dateMap.get("endOfMonth"));
			List<Entity> receivableSumEntityListAll = dbSession.query(queryReceivableSumSql, dateMap.get("beginOfYear"), dateMap.get("endOfMonth"));
			List<Entity> snapshotEntityListAll = dbSession.query(querySnapshotSql, dateMap.get("year"), dateMap.get("month"));
			for (Entity secOrgEntity : secOrgList) {
				String secOrg = secOrgEntity.getStr("secOrg");
				List<Entity> invoiceSumEntityList = new ArrayList<Entity>();
				if (invoiceSumEntityListAll != null && invoiceSumEntityListAll.size() > 0) {
					invoiceSumEntityList = invoiceSumEntityListAll.stream().filter(invoiceSumEntity -> secOrg.equals(invoiceSumEntity.getStr("secondary_org"))).collect(Collectors.toList());
				}
				List<Entity> receivableSumEntityList = new ArrayList<Entity>();
				if (receivableSumEntityListAll != null && receivableSumEntityListAll.size() > 0) {
					receivableSumEntityList = receivableSumEntityListAll.stream().filter(receivableSumEntity -> secOrg.equals(receivableSumEntity.getStr("secondary_org")))
							.collect(Collectors.toList());
				}
				List<Entity> snapshotEntityList = new ArrayList<Entity>();
				if (snapshotEntityListAll != null && snapshotEntityListAll.size() > 0) {
					snapshotEntityList = snapshotEntityListAll.stream().filter(snapshotEntity -> secOrg.equals(snapshotEntity.getStr("secondary_org"))).collect(Collectors.toList());
				}
				Entity entity = this.buildData(invoiceSumEntityList, receivableSumEntityList, snapshotEntityList, tjHeadquarterGroup, dbSession, secOrg);
				entityList.add(entity);
			}
			Map<String, Integer> secOrderMap = this.getSecOrgOrderMap(dbSession);
			entityList.sort(Comparator.comparing(entity -> secOrderMap.getOrDefault(entity.getStr("secOrg"), 100)));
		}
		return entityList;
	}

	// 构建查询涉及到的日期数据
	private Map<String, String> buildDateMap(String tjYearMonth) {
		Map<String, String> map = new HashMap();
		DateTime searchDate = DateUtil.parse(tjYearMonth, "yyyy-MM");
		int year = DateUtil.year(searchDate);
		map.put("year", "" + year);
		int month = DateUtil.month(searchDate) + 1;
		map.put("month", "" + month);
		// 年份开始日期
		String beginOfYear = DateUtil.beginOfYear(searchDate).toString("yyyy-MM-dd");
		map.put("beginOfYear", beginOfYear);
		// 月份结束日期
		String endOfMonth = DateUtil.endOfMonth(searchDate).toString("yyyy-MM-dd");
		map.put("endOfMonth", endOfMonth);
		return map;
	}

	// 获取需要查询的组织
	private String getSecOrg(String tjSec, String tjSecondaryOrg) {
		if (StrUtil.isNotBlank(tjSec)) {
			if (StrUtil.isNotBlank(tjSecondaryOrg)) {
				return tjSecondaryOrg;
			} else {
				return tjSec;
			}
		} else {
			if (StrUtil.isNotBlank(tjSecondaryOrg)) {
				return tjSecondaryOrg;
			} else {
				return null;
			}
		}
	}

	// 构建展现数据
	private Entity buildData(List<Entity> invoiceSumEntityList, List<Entity> receivableSumEntityList, List<Entity> snapshotEntityList, String tjHeadquarterGroup, Session dbSession, String searchSecOrg)
			throws Exception {
		Entity entity = new Entity();
		entity.set("secOrg", searchSecOrg);
		// 1-当月开票金额
		if (invoiceSumEntityList != null && invoiceSumEntityList.size() > 0) {
			entity.set("secOrgname", invoiceSumEntityList.get(0).getStr("secondary_orgname"));
			if (StrUtil.isNotBlank(tjHeadquarterGroup)) {
				Set<String> excludeHeadquarterGroup = new HashSet<String>();
				if ("0".equals(tjHeadquarterGroup)) {
					excludeHeadquarterGroup.addAll(Arrays.asList("1"));
				} else if ("1".equals(tjHeadquarterGroup)) {
					excludeHeadquarterGroup.addAll(Arrays.asList("0", "3", "4"));
				}
				BigDecimal invoiceSumTotal = invoiceSumEntityList.stream().filter(invoiceSumEntity -> !excludeHeadquarterGroup.contains(invoiceSumEntity.getStr("headquarter_group")))
						.map(invoiceSumEntity -> invoiceSumEntity.getBigDecimal("invoice_sum")).filter(invoiceSum -> invoiceSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("invoiceSumTotal", NumberUtil.div(invoiceSumTotal, 10000, 2));
			} else {
				BigDecimal invoiceSumTotal = invoiceSumEntityList.stream().map(invoiceSumEntity -> invoiceSumEntity.getBigDecimal("invoice_sum")).filter(invoiceSum -> invoiceSum != null)
						.reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("invoiceSumTotal", NumberUtil.div(invoiceSumTotal, 10000, 2));
			}
		} else {
			entity.set("invoiceSumTotal", BigDecimal.ZERO);
		}

		// 1-当月回款金额、平均回款天数
		if (receivableSumEntityList != null && receivableSumEntityList.size() > 0) {
			entity.set("secOrgname", receivableSumEntityList.get(0).getStr("secondary_orgname"));
			if (StrUtil.isNotBlank(tjHeadquarterGroup)) {
				Set<String> excludeHeadquarterGroup = new HashSet<String>();
				if ("0".equals(tjHeadquarterGroup)) {
					excludeHeadquarterGroup.addAll(Arrays.asList("1"));
				} else if ("1".equals(tjHeadquarterGroup)) {
					excludeHeadquarterGroup.addAll(Arrays.asList("0", "3", "4"));
				}
				BigDecimal receivableSumTotal = receivableSumEntityList.stream().filter(receivableSumEntity -> !excludeHeadquarterGroup.contains(receivableSumEntity.getStr("headquarter_group")))
						.map(receivableSumEntity -> receivableSumEntity.getBigDecimal("receivable_sum")).filter(receivableSum -> receivableSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("receivableSumTotal", NumberUtil.div(receivableSumTotal, 10000, 2));
				OptionalDouble average = receivableSumEntityList
						.stream()
						.filter(receivableSumEntity -> !excludeHeadquarterGroup.contains(receivableSumEntity.getStr("headquarter_group")))
						.mapToLong(
								receivableSumEntity -> DateUtil.betweenDay(DateUtil.parse(receivableSumEntity.getStr("create_time")), DateUtil.parse(receivableSumEntity.getStr("receivable_data")),
										false)).filter(days -> days >= 0).average();
				entity.set("averageDay", NumberUtil.round(average.orElse(0.0), 1));
			} else {
				BigDecimal receivableSumTotal = receivableSumEntityList.stream().map(receivableSumEntity -> receivableSumEntity.getBigDecimal("receivable_sum"))
						.filter(receivableSum -> receivableSum != null).reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("receivableSumTotal", NumberUtil.div(receivableSumTotal, 10000, 2));
				OptionalDouble average = receivableSumEntityList
						.stream()
						.mapToLong(
								receivableSumEntity -> DateUtil.betweenDay(DateUtil.parse(receivableSumEntity.getStr("create_time")), DateUtil.parse(receivableSumEntity.getStr("receivable_data")),
										false)).filter(days -> days >= 0).average();
				entity.set("averageDay", NumberUtil.round(average.orElse(0.0), 1));
			}
		} else {
			entity.set("receivableSumTotal", BigDecimal.ZERO);
			entity.set("averageDay", BigDecimal.ZERO);
		}

		// 回款率
		if (entity.getBigDecimal("invoiceSumTotal").compareTo(BigDecimal.ZERO) == 0) {
			entity.set("collectionRate", BigDecimal.ZERO);
			entity.set("collectionRateText", NumberUtil.decimalFormat("#.##%", BigDecimal.ZERO));
		} else {
			BigDecimal collectionRate = NumberUtil.div(entity.getBigDecimal("receivableSumTotal"), entity.getBigDecimal("invoiceSumTotal"), 2);
			entity.set("collectionRate", collectionRate);
			entity.set("collectionRateText", NumberUtil.decimalFormat("#.##%", collectionRate));
		}

		if (snapshotEntityList != null && snapshotEntityList.size() > 0) {
			entity.set("secOrgname", snapshotEntityList.get(0).getStr("secondary_orgname"));
			if (StrUtil.isNotBlank(tjHeadquarterGroup)) {
				Set<String> excludeHeadquarterGroup = new HashSet<String>();
				if ("0".equals(tjHeadquarterGroup)) {
					excludeHeadquarterGroup.addAll(Arrays.asList("1"));
				} else if ("1".equals(tjHeadquarterGroup)) {
					excludeHeadquarterGroup.addAll(Arrays.asList("0", "3", "4"));
				}
				// 1-当月形成应收账款
				BigDecimal monthlyAccountsReceivableTotal = snapshotEntityList.stream().filter(snapshotEntity -> !excludeHeadquarterGroup.contains(snapshotEntity.getStr("headquarter_group")))
						.map(snapshotEntity -> snapshotEntity.getBigDecimal("monthly_accounts_receivable")).filter(monthlyAccountsReceivable -> monthlyAccountsReceivable != null)
						.reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("monthlyAccountsReceivableTotal", NumberUtil.div(monthlyAccountsReceivableTotal, 10000, 2));
				// 其中：当月开票部分
				BigDecimal monthlyInvoicingPortionTotal = snapshotEntityList.stream().filter(snapshotEntity -> !excludeHeadquarterGroup.contains(snapshotEntity.getStr("headquarter_group")))
						.map(snapshotEntity -> snapshotEntity.getBigDecimal("monthly_invoicing_portion")).filter(monthlyInvoicingPortion -> monthlyInvoicingPortion != null)
						.reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("monthlyInvoicingPortionTotal", NumberUtil.div(monthlyInvoicingPortionTotal, 10000, 2));
				// 占比
				if (entity.getBigDecimal("monthlyAccountsReceivableTotal").compareTo(BigDecimal.ZERO) == 0) {
					entity.set("proportion", BigDecimal.ZERO);
					entity.set("proportionText", NumberUtil.decimalFormat("#.##%", BigDecimal.ZERO));
				} else {
					BigDecimal proportion = NumberUtil.div(entity.getBigDecimal("monthlyInvoicingPortionTotal"), entity.getBigDecimal("monthlyAccountsReceivableTotal"), 2);
					entity.set("proportion", proportion);
					entity.set("proportionText", NumberUtil.decimalFormat("#.##%", proportion));
				}
				// 应收账款余额
				BigDecimal accountsReceivableBalanceTotal = snapshotEntityList.stream().filter(snapshotEntity -> !excludeHeadquarterGroup.contains(snapshotEntity.getStr("headquarter_group")))
						.map(snapshotEntity -> snapshotEntity.getBigDecimal("accounts_receivable_balance")).filter(accountsReceivableBalance -> accountsReceivableBalance != null)
						.reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("accountsReceivableBalanceTotal", NumberUtil.div(accountsReceivableBalanceTotal, 10000, 2));
				// 其中：1年以内
				BigDecimal oneBalanceTotal = snapshotEntityList.stream().filter(snapshotEntity -> !excludeHeadquarterGroup.contains(snapshotEntity.getStr("headquarter_group")))
						.map(snapshotEntity -> snapshotEntity.getBigDecimal("one_balance")).filter(oneBalance -> oneBalance != null).reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("oneBalanceTotal", NumberUtil.div(oneBalanceTotal, 10000, 2));
				// 其中：1-2年
				BigDecimal oneTwoBalanceTotal = snapshotEntityList.stream().filter(snapshotEntity -> !excludeHeadquarterGroup.contains(snapshotEntity.getStr("headquarter_group")))
						.map(snapshotEntity -> snapshotEntity.getBigDecimal("one_two_balance")).filter(oneTwoBalance -> oneTwoBalance != null).reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("oneTwoBalanceTotal", NumberUtil.div(oneTwoBalanceTotal, 10000, 2));
				// 其中：2-3年
				BigDecimal twoThreeBalanceTotal = snapshotEntityList.stream().filter(snapshotEntity -> !excludeHeadquarterGroup.contains(snapshotEntity.getStr("headquarter_group")))
						.map(snapshotEntity -> snapshotEntity.getBigDecimal("two_three_balance")).filter(twoThreeBalance -> twoThreeBalance != null).reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("twoThreeBalanceTotal", NumberUtil.div(twoThreeBalanceTotal, 10000, 2));
				// 其中：3年以上
				BigDecimal threeBalanceTotal = snapshotEntityList.stream().filter(snapshotEntity -> !excludeHeadquarterGroup.contains(snapshotEntity.getStr("headquarter_group")))
						.map(snapshotEntity -> snapshotEntity.getBigDecimal("three_balance")).filter(threeBalance -> threeBalance != null).reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("threeBalanceTotal", NumberUtil.div(threeBalanceTotal, 10000, 2));
			} else {
				// 1-当月形成应收账款
				BigDecimal monthlyAccountsReceivableTotal = snapshotEntityList.stream().map(snapshotEntity -> snapshotEntity.getBigDecimal("monthly_accounts_receivable"))
						.filter(monthlyAccountsReceivable -> monthlyAccountsReceivable != null).reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("monthlyAccountsReceivableTotal", NumberUtil.div(monthlyAccountsReceivableTotal, 10000, 2));
				// 其中：当月开票部分
				BigDecimal monthlyInvoicingPortionTotal = snapshotEntityList.stream().map(snapshotEntity -> snapshotEntity.getBigDecimal("monthly_invoicing_portion"))
						.filter(monthlyInvoicingPortion -> monthlyInvoicingPortion != null).reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("monthlyInvoicingPortionTotal", NumberUtil.div(monthlyInvoicingPortionTotal, 10000, 2));
				// 占比
				if (entity.getBigDecimal("monthlyAccountsReceivableTotal").compareTo(BigDecimal.ZERO) == 0) {
					entity.set("proportion", BigDecimal.ZERO);
					entity.set("proportionText", NumberUtil.decimalFormat("#.##%", BigDecimal.ZERO));
				} else {
					BigDecimal proportion = NumberUtil.div(entity.getBigDecimal("monthlyInvoicingPortionTotal"), entity.getBigDecimal("monthlyAccountsReceivableTotal"), 2);
					entity.set("proportion", proportion);
					entity.set("proportionText", NumberUtil.decimalFormat("#.##%", proportion));
				}
				// 应收账款余额
				BigDecimal accountsReceivableBalanceTotal = snapshotEntityList.stream().map(snapshotEntity -> snapshotEntity.getBigDecimal("accounts_receivable_balance"))
						.filter(accountsReceivableBalance -> accountsReceivableBalance != null).reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("accountsReceivableBalanceTotal", NumberUtil.div(accountsReceivableBalanceTotal, 10000, 2));
				// 其中：1年以内
				BigDecimal oneBalanceTotal = snapshotEntityList.stream().map(snapshotEntity -> snapshotEntity.getBigDecimal("one_balance")).filter(oneBalance -> oneBalance != null)
						.reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("oneBalanceTotal", NumberUtil.div(oneBalanceTotal, 10000, 2));
				// 其中：1-2年
				BigDecimal oneTwoBalanceTotal = snapshotEntityList.stream().map(snapshotEntity -> snapshotEntity.getBigDecimal("one_two_balance")).filter(oneTwoBalance -> oneTwoBalance != null)
						.reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("oneTwoBalanceTotal", NumberUtil.div(oneTwoBalanceTotal, 10000, 2));
				// 其中：2-3年
				BigDecimal twoThreeBalanceTotal = snapshotEntityList.stream().map(snapshotEntity -> snapshotEntity.getBigDecimal("two_three_balance"))
						.filter(twoThreeBalance -> twoThreeBalance != null).reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("twoThreeBalanceTotal", NumberUtil.div(twoThreeBalanceTotal, 10000, 2));
				// 其中：3年以上
				BigDecimal threeBalanceTotal = snapshotEntityList.stream().map(snapshotEntity -> snapshotEntity.getBigDecimal("three_balance")).filter(threeBalance -> threeBalance != null)
						.reduce(BigDecimal.ZERO, BigDecimal::add);
				entity.set("threeBalanceTotal", NumberUtil.div(threeBalanceTotal, 10000, 2));
			}
		} else {
			entity.set("monthlyAccountsReceivableTotal", BigDecimal.ZERO);
			entity.set("monthlyInvoicingPortionTotal", BigDecimal.ZERO);
			entity.set("proportion", BigDecimal.ZERO);
			entity.set("proportionText", NumberUtil.decimalFormat("#.##%", BigDecimal.ZERO));
			entity.set("accountsReceivableBalanceTotal", BigDecimal.ZERO);
			entity.set("oneBalanceTotal", BigDecimal.ZERO);
			entity.set("oneTwoBalanceTotal", BigDecimal.ZERO);
			entity.set("twoThreeBalanceTotal", BigDecimal.ZERO);
			entity.set("threeBalanceTotal", BigDecimal.ZERO);
		}

		if (StrUtil.isNotBlank(entity.getStr("secOrgname"))) {
			return entity;
		} else {
			entity.set("secOrgname", this.getSecOrgname(dbSession, searchSecOrg));
			return entity;
		}
	}

	private String getSecOrgname(Session dbSession, String searchSecOrg) throws Exception {
		String queryOrgNameSql = "SELECT ORGNAME FROM OM_ORGANIZATION WHERE ORGCODE = ?";
		Entity orgEntity = dbSession.queryOne(queryOrgNameSql, searchSecOrg);
		return orgEntity.getStr("ORGNAME");
	}

	private List<Entity> getBusSecOrgList(Session dbSession) throws Exception {
		String queryOrgSql = "SELECT ORGCODE, ORGNAME FROM OM_ORGANIZATION WHERE (ORGLEVEL='2' AND STATUS='running' AND ORGSEQ LIKE '.1.%') OR (ORGSEQ='.1111.')";
		String queryDictSql = "SELECT DICTID, DICTNAME FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'ZH_NOT_SEC_ORG'";
		List<Entity> orgEntityList = dbSession.query(queryOrgSql);
		List<Entity> dictEntityList = dbSession.query(queryDictSql);

		// 提取 DICTID 到 Set
		Set<String> dictIds = dictEntityList.stream().map(dictEntity -> dictEntity.getStr("DICTID")).collect(Collectors.toSet());

		// 过滤 orgEntityList
		List<Entity> filteredList = orgEntityList.stream().filter(orgEntity -> !dictIds.contains(orgEntity.getStr("ORGCODE"))).collect(Collectors.toList());

		List<Entity> result = filteredList.stream().map(orgEntity -> {
			Entity entity = new Entity();
			entity.set("secOrg", orgEntity.getStr("ORGCODE"));
			entity.set("secOrgname", orgEntity.getStr("ORGNAME"));
			return entity;
		}).collect(Collectors.toList());

		return result;
	}

	private Map<String, Integer> getSecOrgOrderMap(Session dbSession) throws Exception {
		String queryDictSql = "SELECT DICTID, SORTNO FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'ZH_OPERATION_INCOME_ORG'";
		Map<String, Integer> map = new HashMap<String, Integer>();
		List<Entity> dictList = dbSession.query(queryDictSql);
		for (Entity dict : dictList) {
			map.put(dict.getStr("DICTID"), dict.getInt("SORTNO"));
		}
		return map;
	}

}
