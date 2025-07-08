package com.zhonghe.ame.kaohe;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.text.CharSequenceUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.runtime.core.TraceLoggerFactory;
import com.eos.system.annotation.Bizlet;
import com.eos.system.logging.Logger;

import commonj.sdo.DataObject;

@Bizlet("考核收入统计快照任务")
public class AssessmentIncomeSnapshotJob {

	Logger logger = TraceLoggerFactory.getLogger(this.getClass());

	/**
	 * 根据年份查询 annual_payment_plan 和 annual_charge_plan 的联合表
	 */
	private String querySqlByYear = "SELECT kh.* FROM (SELECT temp.* FROM (SELECT ap.id,ap.years,ap.create_time,zc.create_userid,zc.create_username,zc.secondary_org,zc.secondary_orgname,zc.contract_no,zc.contract_name,'1' AS contract_stauts,zc.signatory,zc.signatory_name,zc.payee,zc.contract_sum,ap.[sum],0.00 AS sum_exclude_tax,0.00 AS sum_total_book_income,zc.major,zc.project_type,zc.headquarter_group,NULL AS risk_level,NULL AS estimated_date,'1' AS is_charge_plan,ap.jan,ap.feb,ap.mar,ap.apr,ap.may,ap.jun,ap.jul,ap.aug,ap.sep,ap.oct,ap.nov,ap.dec FROM annual_payment_plan AS ap LEFT JOIN zh_charge_contract AS zc ON zc.id = ap.charge_id WHERE ap.charge_id IS NOT NULL AND zc.app_status= 2) AS temp UNION ALL SELECT ac.id,ac.years,ac.create_time,ac.create_userid,ac.create_username,ac.secondary_org,ac.secondary_orgname,ac.contract_no,ac.contract_name,ac.contract_stauts,ac.signatory,ac.signatory_name,ac.payee,ac.contract_sum,ac.[sum],0.00 AS sum_exclude_tax,0.00 AS sum_total_book_income,ac.major,ac.project_type,ac.headquarter_group,ac.risk_level,ac.estimated_date,'0' AS is_charge_plan,ac.jan,ac.feb,ac.mar,ac.apr,ac.may,ac.jun,ac.jul,ac.aug,ac.sep,ac.oct,ac.nov,ac.dec FROM annual_charge_plan AS ac) AS kh WHERE kh.years= ?";

	/**
	 * 根据年份和组织查询 annual_payment_plan 和 annual_charge_plan 的联合表
	 */
	private String querySqlByYearAndSecOrg = "SELECT kh.* FROM(SELECT temp.* FROM (SELECT ap.id, ap.years, ap.create_time, zc.create_userid, zc.create_username, zc.secondary_org, zc.secondary_orgname, zc.contract_no, zc.contract_name, '1' AS contract_stauts, zc.signatory, zc.signatory_name, zc.payee, zc.contract_sum, ap.[sum], 0.00 AS sum_exclude_tax, 0.00 AS sum_total_book_income, zc.major, zc.project_type, zc.headquarter_group, NULL AS risk_level, NULL AS estimated_date, '1' AS is_charge_plan, ap.jan, ap.feb, ap.mar, ap.apr, ap.may, ap.jun, ap.jul, ap.aug, ap.sep, ap.oct, ap.nov, ap.dec FROM annual_payment_plan AS ap LEFT JOIN zh_charge_contract AS zc ON zc.id = ap.charge_id WHERE ap.charge_id IS NOT NULL AND zc.app_status= 2) AS temp UNION ALL SELECT ac.id, ac.years, ac.create_time, ac.create_userid, ac.create_username, ac.secondary_org, ac.secondary_orgname, ac.contract_no, ac.contract_name, ac.contract_stauts, ac.signatory, ac.signatory_name, ac.payee, ac.contract_sum, ac.[sum], 0.00 AS sum_exclude_tax, 0.00 AS sum_total_book_income, ac.major, ac.project_type, ac.headquarter_group, ac.risk_level, ac.estimated_date, '0' AS is_charge_plan, ac.jan, ac.feb, ac.mar, ac.apr, ac.may, ac.jun, ac.jul, ac.aug, ac.sep, ac.oct, ac.nov, ac.dec FROM annual_charge_plan AS ac ) AS kh WHERE kh.years= ? AND kh.secondary_org = ?";

	/**
	 * 根据年份和月份删除快照明细数据
	 */
	private String delSnapshotDetaiByYearMonthSql = "DELETE FROM zh_kaohe_statistics_snapshot_details WHERE years = ? AND months = ?";

	/**
	 * 根据年份和月份及组织删除快照明细数据
	 */
	private String delSnapshotDetaiByYearMonthSecOrgSql = "DELETE FROM zh_kaohe_statistics_snapshot_details WHERE years = ? AND months = ? AND secondary_org = ?";

	/**
	 * 根据年份和月份删除快照信息
	 */
	private String delSnapshotByYearMonthSql = "DELETE FROM zh_kaohe_statistics_snapshot WHERE years = ? AND months = ?";

	/**
	 * 根据年份和月份及组织删除快照信息
	 */
	private String delSnapshotByYearMonthSecOrgSql = "DELETE FROM zh_kaohe_statistics_snapshot WHERE years = ? AND months = ? AND secondary_org = ?";

	@Bizlet("自动生成快照")
	public void automaticGenerateSnapshot() throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		logger.info("【执行】定时任务 - 考核收入统计 - 自动生成快照");
		Map<String, String> dateMap = this.getPreviousMonth();
		List<Entity> snapshotDetails = this.buildSnapshotDetails(dateMap.get("year"), dateMap.get("month"), null, dbSession);
		if (snapshotDetails != null && snapshotDetails.size() > 0) {
			List<Entity> snapshots = this.buildSnapshots(snapshotDetails, null, dateMap.get("year"), dateMap.get("month"), "定时任务");
			dbSession.execute(delSnapshotByYearMonthSql, dateMap.get("year"), dateMap.get("month"));
			dbSession.execute(delSnapshotDetaiByYearMonthSql, dateMap.get("year"), dateMap.get("month"));
			dbSession.insert(snapshotDetails);
			dbSession.insert(snapshots);
		}
	}

	@Bizlet("手动生成快照")
	public void artificialGenerateSnapshot(String year, String month, String secOrg, String createBy) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		List<Entity> snapshotDetails = this.buildSnapshotDetails(year, month, secOrg, dbSession);
		if (snapshotDetails != null && snapshotDetails.size() > 0) {
			List<Entity> snapshots = this.buildSnapshots(snapshotDetails, secOrg, year, month, createBy);
			dbSession.execute(delSnapshotByYearMonthSecOrgSql, year, month, secOrg);
			dbSession.execute(delSnapshotDetaiByYearMonthSecOrgSql, year, month, secOrg);
			dbSession.insert(snapshotDetails);
			dbSession.insert(snapshots);
		}
	}

	/**
	 * 构建插入 zh_kaohe_statistics_snapshot_details 表的数据集合
	 */
	private List<Entity> buildSnapshotDetails(String year, String month, String secOrg, Session dbSession) {
		List<Entity> snapshotDetails = new ArrayList<Entity>();
		try {
			List<Entity> basePlanDataList = this.getPlanDatas(dbSession, year, secOrg);

			if (basePlanDataList != null && basePlanDataList.size() > 0) {

				// 考核系数Map
				Map<String, BigDecimal> coefficientMap = this.getCoefficientToMap(dbSession);

				List<Entity> wrapBasePlanDataList = new ArrayList<Entity>();

				// 收费合同中明细的计划数据集合
				List<Entity> feeCollectionPlanList = new ArrayList<Entity>();

				// 待签、产值分配(无合同编号)等类型数据集合
				List<Entity> invoiceCollectionPlanList = new ArrayList<Entity>();

				// 产值分配(有合同编号)类型数据集合
				List<Entity> invoiceCollectionContractNoPlanList = new ArrayList<Entity>();

				// 遍历联合表数据集合，根据数据情况分别存储到不同的集合中
				for (Entity basePlanData : basePlanDataList) {
					if (CharSequenceUtil.equals("1", basePlanData.getStr("is_charge_plan"))) {
						feeCollectionPlanList.add(basePlanData);
					} else {
						if (CharSequenceUtil.isNotBlank(basePlanData.getStr("contract_no"))) {
							invoiceCollectionContractNoPlanList.add(basePlanData);
						} else {
							invoiceCollectionPlanList.add(basePlanData);
						}
					}
				}

				String queryInvoiceBySecSql = "SELECT * FROM zh_invoice WHERE app_status = '2' AND contract_no = ? AND create_time >= ? AND create_time <= ? AND secondary_org = ?";

				// 遍历收费合同中的明细数据，查询相关开票数据
				for (Entity feeCollectionPlan : feeCollectionPlanList) {
					String searchContractNo = feeCollectionPlan.getStr("contract_no");
					String searchYears = feeCollectionPlan.getStr("years");
					String searchStartDate = CharSequenceUtil.format("{}-{}-{}", searchYears, "01", "01");
					String searchEndDate = CharSequenceUtil.format("{}-{}-{}", searchYears, "12", "31");
					String searchSecOrg = feeCollectionPlan.getStr("secondary_org");

					// 获取合同编号及二级组织都相同的开票数据集合
					List<Entity> invoiceBySecList = dbSession.query(queryInvoiceBySecSql, searchContractNo, searchStartDate, searchEndDate, searchSecOrg);

					feeCollectionPlan = this.fetchFillData(feeCollectionPlan, invoiceBySecList, coefficientMap, month);
					wrapBasePlanDataList.add(feeCollectionPlan);
				}

				// 遍历待签、产值分配等类型数据
				for (Entity invoiceCollectionPlan : invoiceCollectionPlanList) {
					this.fetchFillData(invoiceCollectionPlan, null, coefficientMap, month);
					wrapBasePlanDataList.add(invoiceCollectionPlan);
				}

				// 遍历产值分配(有合同编号)类型数据
				for (Entity invoiceCollectionContractNoPlan : invoiceCollectionContractNoPlanList) {
					String searchContractNo = invoiceCollectionContractNoPlan.getStr("contract_no");
					String searchYears = invoiceCollectionContractNoPlan.getStr("years");
					String searchStartDate = CharSequenceUtil.format("{}-{}-{}", searchYears, "01", "01");
					String searchEndDate = CharSequenceUtil.format("{}-{}-{}", searchYears, "12", "31");
					String searchSecOrg = invoiceCollectionContractNoPlan.getStr("secondary_org");

					// 获取合同编号及二级组织都相同的开票数据集合
					List<Entity> invoiceBySecList = dbSession.query(queryInvoiceBySecSql, searchContractNo, searchStartDate, searchEndDate, searchSecOrg);

					invoiceCollectionContractNoPlan = this.fetchFillData(invoiceCollectionContractNoPlan, invoiceBySecList, coefficientMap, month);
					wrapBasePlanDataList.add(invoiceCollectionContractNoPlan);
				}

				snapshotDetails = this.wrapBasePlanDataToSnapshotDetail(wrapBasePlanDataList, month);

				// 考核修正数据集合
				List<Entity> correctionSnapshotDetails = this.getSnapshotDetailsForCorrectionPlan(dbSession, year, month, secOrg, coefficientMap);
				if (correctionSnapshotDetails.size() > 0) {
					snapshotDetails.addAll(correctionSnapshotDetails);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return snapshotDetails;
	}

	/**
	 * 根据条件获取 annual_payment_plan 和 annual_charge_plan 的联合表数据集合
	 */
	private List<Entity> getPlanDatas(Session dbSession, String year, String secOrg) throws Exception {
		if (StrUtil.isNotBlank(secOrg)) {
			return dbSession.query(querySqlByYearAndSecOrg, year, secOrg);
		} else {
			return dbSession.query(querySqlByYear, year);
		}
	}

	/**
	 * 填充其他相关数据
	 */
	private Entity fetchFillData(Entity entity, List<Entity> invoiceBySecList, Map<String, BigDecimal> coefficientMap, String searchMonth) {
		// 存储每月开票金额
		BigDecimal[] monthlyInvoiceAmounts = new BigDecimal[12];
		for (int i = 0; i < 12; i++) {
			monthlyInvoiceAmounts[i] = BigDecimal.ZERO;
		}

		if (invoiceBySecList != null && invoiceBySecList.size() > 0) {
			for (Entity invoiceBySec : invoiceBySecList) {
				// 获得月份，从0开始计数
				int month = DateUtil.month(invoiceBySec.getDate("create_time"));
				// 取账目收入(即不含税)
				monthlyInvoiceAmounts[month] = monthlyInvoiceAmounts[month].add(invoiceBySec.getBigDecimal("book_income"));
			}
		}

		// 1月实际
		entity.set("jan_actual", monthlyInvoiceAmounts[0]);
		// 2月实际
		entity.set("feb_actual", monthlyInvoiceAmounts[1]);
		// 3月实际
		entity.set("mar_actual", monthlyInvoiceAmounts[2]);
		// 4月实际
		entity.set("apr_actual", monthlyInvoiceAmounts[3]);
		// 5月实际
		entity.set("may_actual", monthlyInvoiceAmounts[4]);
		// 6月实际
		entity.set("jun_actual", monthlyInvoiceAmounts[5]);
		// 7月实际
		entity.set("jul_actual", monthlyInvoiceAmounts[6]);
		// 8月实际
		entity.set("aug_actual", monthlyInvoiceAmounts[7]);
		// 9月实际
		entity.set("sep_actual", monthlyInvoiceAmounts[8]);
		// 10月实际
		entity.set("oct_actual", monthlyInvoiceAmounts[9]);
		// 11月实际
		entity.set("nov_actual", monthlyInvoiceAmounts[10]);
		// 12月实际
		entity.set("dec_actual", monthlyInvoiceAmounts[11]);

		// 计划收入金额
		BigDecimal sumExcludeTax = NumberUtil.div(entity.getStr("sum"), "1.06", 2);
		entity.set("sum_exclude_tax", sumExcludeTax);

		// 截至当月已完成收入
		BigDecimal sumTotalBookIncome = this.getSumTotalBookIncome(monthlyInvoiceAmounts, searchMonth);
		entity.set("sum_total_book_income", sumTotalBookIncome);

		// 考核系数
		BigDecimal coefficient = this.getCoefficient(entity.getStr("contract_no"), entity.getStr("headquarter_group"), coefficientMap);
		entity.set("coefficient", coefficient);

		// 营业收入考核值
		BigDecimal coefficientSum = NumberUtil.mul(sumExcludeTax, coefficient);
		entity.set("coefficient_sum", coefficientSum);

		return entity;
	}

	/**
	 * 获取考核系数Map对象
	 */
	private Map<String, BigDecimal> getCoefficientToMap(Session dbSession) throws Exception {
		Map<String, BigDecimal> map = new HashMap<String, BigDecimal>();
		String querySql = "SELECT zcc.contract_no, zkc.coefficient, zkc.data_type, zkc.headquarter_group FROM zh_kaohe_coefficient AS zkc LEFT JOIN zh_charge_contract AS zcc ON zkc.charge_contract_id = zcc.id";
		List<Entity> coefficientList = dbSession.query(querySql);
		if (coefficientList != null && coefficientList.size() > 0) {
			for (Entity coefficient : coefficientList) {
				String contractNo = coefficient.getStr("contract_no");
				if (StrUtil.isNotBlank(contractNo)) {
					map.put(contractNo, coefficient.getBigDecimal("coefficient"));
				} else {
					String dataType = coefficient.getStr("data_type");
					String headquarterGroup = coefficient.getStr("headquarter_group");
					if (dataType.equals("1") && headquarterGroup.equals("0")) {
						map.put("0", coefficient.getBigDecimal("coefficient"));
					}
					if (dataType.equals("1") && headquarterGroup.equals("1")) {
						map.put("1", coefficient.getBigDecimal("coefficient"));
					}
				}
			}
		}
		return map;
	}

	/**
	 * 获取截至当月已完成收入
	 */
	private BigDecimal getSumTotalBookIncome(BigDecimal[] monthlyInvoiceAmounts, String searchMonth) {
		BigDecimal sumTotalBookIncome = BigDecimal.ZERO;
		int month = Integer.valueOf(searchMonth).intValue();
		for (int i = 0; i < month; i++) {
			sumTotalBookIncome = sumTotalBookIncome.add(monthlyInvoiceAmounts[i]);
		}
		return sumTotalBookIncome;
	}

	/**
	 * 获取考核系数值
	 */
	private BigDecimal getCoefficient(String contractNo, String headquarterGroup, Map<String, BigDecimal> coefficientMap) {
		if (!StrUtil.isBlankIfStr(contractNo)) {
			if (coefficientMap.containsKey(contractNo)) {
				return coefficientMap.get(contractNo);
			} else {
				if (headquarterGroup.equals("1")) {
					return coefficientMap.get("1");
				} else {
					return coefficientMap.get("0");
				}
			}
		} else {
			if (headquarterGroup.equals("1")) {
				return coefficientMap.get("1");
			} else {
				return coefficientMap.get("0");
			}
		}
	}

	/**
	 * 将提供的数据集合转化为快照明细数据集合
	 */
	private List<Entity> wrapBasePlanDataToSnapshotDetail(List<Entity> wrapBasePlanDataList, String month) {
		List<Entity> snapshotDetails = new ArrayList<Entity>();
		if (wrapBasePlanDataList != null && wrapBasePlanDataList.size() > 0) {
			for (Entity wrapBasePlanData : wrapBasePlanDataList) {
				Entity snapshotDetail = new Entity("zh_kaohe_statistics_snapshot_details");
				// 主键
				snapshotDetail.set("id", IdUtil.objectId());
				// 考核单位(中心/分公司)
				snapshotDetail.set("secondary_org", wrapBasePlanData.getStr("secondary_org"));
				// 考核年份
				snapshotDetail.set("years", wrapBasePlanData.getStr("years"));
				// 考核月份
				snapshotDetail.set("months", month);
				// 合同状态
				snapshotDetail.set("contract_stauts", wrapBasePlanData.getStr("contract_stauts"));
				// 经办人
				snapshotDetail.set("create_username", wrapBasePlanData.getStr("create_username"));
				// 合同编号
				snapshotDetail.set("contract_no", wrapBasePlanData.getStr("contract_no"));
				// 合同名称
				snapshotDetail.set("contract_name", wrapBasePlanData.getStr("contract_name"));
				// 付款单位
				snapshotDetail.set("signatory_name", wrapBasePlanData.getStr("signatory_name"));
				// 集团内外
				snapshotDetail.set("headquarter_group", wrapBasePlanData.getStr("headquarter_group"));
				// 专业类别
				snapshotDetail.set("major", wrapBasePlanData.getStr("major"));
				// 风险等级
				snapshotDetail.set("risk_level", wrapBasePlanData.getStr("risk_level"));
				// 预计签订日期
				snapshotDetail.set("estimated_date", wrapBasePlanData.getDate("estimated_date"));
				// 计划收款金额（元）
				snapshotDetail.set("sum", wrapBasePlanData.getBigDecimal("sum"));
				// 计划收入金额（元）
				snapshotDetail.set("sum_exclude_tax", wrapBasePlanData.getBigDecimal("sum_exclude_tax"));
				// 截至当月已完成收入（元）
				snapshotDetail.set("sum_total_book_income", wrapBasePlanData.getBigDecimal("sum_total_book_income"));
				// 考核系数
				snapshotDetail.set("coefficient", wrapBasePlanData.getBigDecimal("coefficient"));
				// 营业收入考核值（元）
				snapshotDetail.set("coefficient_sum", wrapBasePlanData.getBigDecimal("coefficient_sum"));
				// 1月计划
				snapshotDetail.set("jan", NumberUtil.div(wrapBasePlanData.getBigDecimal("jan"), 1.06, 2));
				// 2月计划
				snapshotDetail.set("feb", NumberUtil.div(wrapBasePlanData.getBigDecimal("feb"), 1.06, 2));
				// 3月计划
				snapshotDetail.set("mar", NumberUtil.div(wrapBasePlanData.getBigDecimal("mar"), 1.06, 2));
				// 4月计划
				snapshotDetail.set("apr", NumberUtil.div(wrapBasePlanData.getBigDecimal("apr"), 1.06, 2));
				// 5月计划
				snapshotDetail.set("may", NumberUtil.div(wrapBasePlanData.getBigDecimal("may"), 1.06, 2));
				// 6月计划
				snapshotDetail.set("jun", NumberUtil.div(wrapBasePlanData.getBigDecimal("jun"), 1.06, 2));
				// 7月计划
				snapshotDetail.set("jul", NumberUtil.div(wrapBasePlanData.getBigDecimal("jul"), 1.06, 2));
				// 8月计划
				snapshotDetail.set("aug", NumberUtil.div(wrapBasePlanData.getBigDecimal("aug"), 1.06, 2));
				// 9月计划
				snapshotDetail.set("sep", NumberUtil.div(wrapBasePlanData.getBigDecimal("sep"), 1.06, 2));
				// 10月计划
				snapshotDetail.set("oct", NumberUtil.div(wrapBasePlanData.getBigDecimal("oct"), 1.06, 2));
				// 11月计划
				snapshotDetail.set("nov", NumberUtil.div(wrapBasePlanData.getBigDecimal("nov"), 1.06, 2));
				// 12月计划
				snapshotDetail.set("dec", NumberUtil.div(wrapBasePlanData.getBigDecimal("dec"), 1.06, 2));
				// 1月实际
				snapshotDetail.set("jan_actual", wrapBasePlanData.getBigDecimal("jan_actual"));
				// 2月实际
				snapshotDetail.set("feb_actual", wrapBasePlanData.getBigDecimal("feb_actual"));
				// 3月实际
				snapshotDetail.set("mar_actual", wrapBasePlanData.getBigDecimal("mar_actual"));
				// 4月实际
				snapshotDetail.set("apr_actual", wrapBasePlanData.getBigDecimal("apr_actual"));
				// 5月实际
				snapshotDetail.set("may_actual", wrapBasePlanData.getBigDecimal("may_actual"));
				// 6月实际
				snapshotDetail.set("jun_actual", wrapBasePlanData.getBigDecimal("jun_actual"));
				// 7月实际
				snapshotDetail.set("jul_actual", wrapBasePlanData.getBigDecimal("jul_actual"));
				// 8月实际
				snapshotDetail.set("aug_actual", wrapBasePlanData.getBigDecimal("aug_actual"));
				// 9月实际
				snapshotDetail.set("sep_actual", wrapBasePlanData.getBigDecimal("sep_actual"));
				// 10月实际
				snapshotDetail.set("oct_actual", wrapBasePlanData.getBigDecimal("oct_actual"));
				// 11月实际
				snapshotDetail.set("nov_actual", wrapBasePlanData.getBigDecimal("nov_actual"));
				// 12月实际
				snapshotDetail.set("dec_actual", wrapBasePlanData.getBigDecimal("dec_actual"));

				snapshotDetails.add(snapshotDetail);
			}
		}
		return snapshotDetails;
	}

	/**
	 * 构造插入 zh_kaohe_statistics_snapshot 表的数据集合
	 */
	private List<Entity> buildSnapshots(List<Entity> snapshotDetails, String secOrg, String year, String month, String createBy) {
		List<Entity> snapshots = new ArrayList<Entity>();
		if (StrUtil.isNotBlank(secOrg)) {
			Entity snapshot = new Entity("zh_kaohe_statistics_snapshot");
			// 主键
			snapshot.set("id", IdUtil.objectId());
			// 考核单位(中心/分公司)
			snapshot.set("secondary_org", secOrg);
			// 考核年份
			snapshot.set("years", year);
			// 考核月份
			snapshot.set("months", month);
			// 快照生成方式
			snapshot.set("snapshot_method", "人工手动生成");
			// 快照生成人员
			snapshot.set("create_by", createBy);
			// 快照生成时间
			snapshot.set("create_time", DateUtil.date());

			snapshots.add(snapshot);
		} else {
			List<String> secOrgList = snapshotDetails.stream().map(snapshotDetail -> snapshotDetail.getStr("secondary_org")).distinct().collect(Collectors.toList());
			DateTime createTime = DateUtil.date();
			for (String sec : secOrgList) {
				Entity snapshot = new Entity("zh_kaohe_statistics_snapshot");
				// 主键
				snapshot.set("id", IdUtil.objectId());
				// 考核单位(中心/分公司)
				snapshot.set("secondary_org", sec);
				// 考核年份
				snapshot.set("years", year);
				// 考核月份
				snapshot.set("months", month);
				// 快照生成方式
				snapshot.set("snapshot_method", "定时任务生成");
				// 快照生成人员
				snapshot.set("create_by", createBy);
				// 快照生成时间
				snapshot.set("create_time", createTime);

				snapshots.add(snapshot);
			}
		}
		return snapshots;
	}

	/**
	 * 根据当前时间获取上个月的年份及月份
	 */
	private Map<String, String> getPreviousMonth() {
		Map<String, String> map = new HashMap();
		Date now = new Date();
		Date lastMonthDate = DateUtil.offsetMonth(now, -1);
		int year = DateUtil.year(lastMonthDate);
		int month = DateUtil.month(lastMonthDate) + 1;
		map.put("year", "" + year);
		map.put("month", "" + month);
		return map;
	}

	/**
	 * 根据考核修正数据生成快照明细数据(未wrap)
	 */
	private List<Entity> getSnapshotDetailsForCorrectionPlan(Session dbSession, String year, String month, String secOrg, Map<String, BigDecimal> coefficientMap) throws Exception {
		List<Entity> snapshotDetails = new ArrayList<Entity>();
		List<Entity> correctionList = new ArrayList<Entity>();

		String querySql = "SELECT * FROM zh_kaohe_correction WHERE years = ?";
		String queryBySecOrgSql = "SELECT * FROM zh_kaohe_correction WHERE years = ? AND secondary_org = ?";

		if (StrUtil.isNotBlank(secOrg)) {
			correctionList = dbSession.query(queryBySecOrgSql, year, secOrg);
		} else {
			correctionList = dbSession.query(querySql, year);
		}

		if (correctionList.size() > 0) {
			for (Entity correction : correctionList) {
				Entity correctionPlanOutside = new Entity("zh_kaohe_statistics_snapshot_details");
				Entity correnctionPlanWithin = new Entity("zh_kaohe_statistics_snapshot_details");
				// 主键
				correnctionPlanWithin.set("id", IdUtil.objectId());
				correctionPlanOutside.set("id", IdUtil.objectId());
				// 考核单位(中心/分公司)
				correnctionPlanWithin.set("secondary_org", correction.getStr("secondary_org"));
				correctionPlanOutside.set("secondary_org", correction.getStr("secondary_org"));
				// 考核年份
				correnctionPlanWithin.set("years", correction.getStr("years"));
				correctionPlanOutside.set("years", correction.getStr("years"));
				// 考核月份
				correnctionPlanWithin.set("months", month);
				correctionPlanOutside.set("months", month);
				// 合同状态
				correnctionPlanWithin.set("contract_stauts", "5");
				correctionPlanOutside.set("contract_stauts", "5");
				// 合同名称
				correnctionPlanWithin.set("contract_name", "修正上一年度集团内");
				correctionPlanOutside.set("contract_name", "修正上一年度集团外");
				// 集团内外
				correnctionPlanWithin.set("headquarter_group", "0");
				correctionPlanOutside.set("headquarter_group", "1");
				// 计划收入金额（元）
				correnctionPlanWithin.set("sum_exclude_tax", correction.getBigDecimal("amount_within_group"));
				correctionPlanOutside.set("sum_exclude_tax", correction.getBigDecimal("amount_outside_group"));
				// 截至当月已完成收入（元）
				correnctionPlanWithin.set("sum_total_book_income", correction.getBigDecimal("amount_within_group"));
				correctionPlanOutside.set("sum_total_book_income", correction.getBigDecimal("amount_outside_group"));
				// 考核系数
				correnctionPlanWithin.set("coefficient", coefficientMap.get("0"));
				correctionPlanOutside.set("coefficient", coefficientMap.get("1"));
				// 营业收入考核值（元）
				correnctionPlanWithin.set("coefficient_sum", NumberUtil.mul(correction.getBigDecimal("amount_within_group"), coefficientMap.get("0")));
				correctionPlanOutside.set("coefficient_sum", NumberUtil.mul(correction.getBigDecimal("amount_outside_group"), coefficientMap.get("1")));

				snapshotDetails.add(correnctionPlanWithin);
				snapshotDetails.add(correctionPlanOutside);
			}
		}
		return snapshotDetails;
	}

}
