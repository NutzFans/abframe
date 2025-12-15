package com.primeton.eos.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import cn.hutool.core.lang.Console;
import cn.hutool.core.util.CharUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("经营管理系统 - 业务处理工具")
public class ZhzxBizUtils {

	@Bizlet("开票管理 - 实际开票金额字段历史数据填充")
	public void kpgl_sjkpjezdlssjtc() throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_invoice";
		List<Entity> zhInvoiceList = dbSession.query(querySql);
		String updateSql = "UPDATE zh_invoice SET actual_invoice_sum = ? WHERE id = ?";
		if (zhInvoiceList != null && zhInvoiceList.size() > 0) {
			for (Entity zhInvoice : zhInvoiceList) {
				dbSession.execute(updateSql, zhInvoice.get("invoice_sum"), zhInvoice.get("id"));
			}
		}
	}

	@Bizlet("开票管理 - 申请人名称、申请人部门名称、二级组织、二级组织名称数据填充")
	public void kpgl_user_org_tc() throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_invoice";
		List<Entity> zhInvoiceList = dbSession.query(querySql);
		String updateSql = "UPDATE zh_invoice SET create_username = ?, implement_orgname = ?, secondary_org = ?, secondary_orgname = ? WHERE id = ?";
		if (zhInvoiceList != null && zhInvoiceList.size() > 0) {
			String queryEmpSql = "SELECT EMPNAME FROM OM_EMPLOYEE WHERE USERID = ?";
			String queryOrgSql = "SELECT ORGNAME, ORGSEQ FROM OM_ORGANIZATION WHERE ORGID = ?";
			for (Entity zhInvoice : zhInvoiceList) {
				String userId = zhInvoice.getStr("create_userid");
				String orgId = zhInvoice.getStr("implement_org");
				String createUsername = "";
				String implementOrgname = "";
				String secondaryOrg = "";
				String secondaryOrgname = "";
				if (StrUtil.isNotBlank(userId)) {
					Entity empEntity = dbSession.queryOne(queryEmpSql, userId);
					if (empEntity != null) {
						createUsername = empEntity.getStr("EMPNAME");
					}
				}
				if (StrUtil.isNotBlank(orgId)) {
					Entity seqEntity = dbSession.queryOne(queryOrgSql, orgId);
					if (seqEntity != null) {
						implementOrgname = seqEntity.getStr("ORGNAME");
						String orgseq = seqEntity.getStr("ORGSEQ");
						String[] splitToArray = StrUtil.splitToArray(orgseq, ".");
						if (splitToArray.length >= 3) {
							String secOrg = splitToArray[2];
							if (StrUtil.isNotBlank(secOrg)) {
								secondaryOrg = secOrg;
								Entity orgEntity = dbSession.queryOne(queryOrgSql, secOrg);
								if (orgEntity != null) {
									secondaryOrgname = orgEntity.getStr("ORGNAME");
								}
							}
						}
					}
				}
				dbSession.execute(updateSql, createUsername, implementOrgname, secondaryOrg, secondaryOrgname, zhInvoice.getStr("id"));
			}
		}
	}

	@Bizlet("付款管理 - 申请人名称、申请人部门名称、二级组织、二级组织名称数据填充")
	public void fkgl_user_org_tc() throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_payment";
		List<Entity> zhPaymentList = dbSession.query(querySql);
		String updateSql = "UPDATE zh_payment SET create_username = ?, implement_orgname = ?, secondary_org = ?, secondary_orgname = ? WHERE id = ?";
		if (zhPaymentList != null && zhPaymentList.size() > 0) {
			String queryEmpSql = "SELECT EMPNAME FROM OM_EMPLOYEE WHERE USERID = ?";
			String queryOrgSql = "SELECT ORGNAME, ORGSEQ FROM OM_ORGANIZATION WHERE ORGID = ?";
			for (Entity zhPayment : zhPaymentList) {
				String userId = zhPayment.getStr("create_userid");
				String orgId = zhPayment.getStr("CREATED_ORGID");
				String createUsername = "";
				String implementOrgname = "";
				String secondaryOrg = "";
				String secondaryOrgname = "";
				if (StrUtil.isNotBlank(userId)) {
					Entity empEntity = dbSession.queryOne(queryEmpSql, userId);
					if (empEntity != null) {
						createUsername = empEntity.getStr("EMPNAME");
					}
				}
				if (StrUtil.isNotBlank(orgId)) {
					Entity seqEntity = dbSession.queryOne(queryOrgSql, orgId);
					if (seqEntity != null) {
						implementOrgname = seqEntity.getStr("ORGNAME");
						String orgseq = seqEntity.getStr("ORGSEQ");
						String[] splitToArray = StrUtil.splitToArray(orgseq, ".");
						if (splitToArray.length >= 3) {
							String secOrg = splitToArray[2];
							if (StrUtil.isNotBlank(secOrg)) {
								secondaryOrg = secOrg;
								Entity orgEntity = dbSession.queryOne(queryOrgSql, secOrg);
								if (orgEntity != null) {
									secondaryOrgname = orgEntity.getStr("ORGNAME");
								}
							}
						}
					}
				}
				dbSession.execute(updateSql, createUsername, implementOrgname, secondaryOrg, secondaryOrgname, zhPayment.getStr("id"));
			}
		}
	}

	@Bizlet("小额采购 - 申请人姓名数据填充")
	public void xecg_user_tc() throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_purchase_zero";
		List<Entity> zhPurchaseZeroList = dbSession.query(querySql);
		String updateSql = "UPDATE zh_purchase_zero SET create_username = ? WHERE id = ?";
		if (zhPurchaseZeroList != null && zhPurchaseZeroList.size() > 0) {
			String queryEmpSql = "SELECT EMPNAME FROM OM_EMPLOYEE WHERE USERID = ?";
			for (Entity zhPurchaseZero : zhPurchaseZeroList) {
				String userId = zhPurchaseZero.getStr("CREATED_BY");
				String createUsername = "";
				if (StrUtil.isNotBlank(userId)) {
					Entity empEntity = dbSession.queryOne(queryEmpSql, userId);
					if (empEntity != null) {
						createUsername = empEntity.getStr("EMPNAME");
					}
				}
				dbSession.execute(updateSql, createUsername, zhPurchaseZero.getStr("id"));
			}
		}
	}

	@Bizlet("评审结构 - 最终采购方式数据填充")
	public void psjg_final_purchas_mode_tc() throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_purchase_reviewreport";
		List<Entity> zhPurchaseReviewList = dbSession.query(querySql);
		String updateSql = "UPDATE zh_purchase_reviewreport SET final_purchas_mode = ? WHERE id = ?";
		if (zhPurchaseReviewList != null && zhPurchaseReviewList.size() > 0) {
			String queryProAppSql = "SELECT * FROM zh_project_approval WHERE id = ?";
			for (Entity zhPurchaseReview : zhPurchaseReviewList) {
				String proAppId = zhPurchaseReview.getStr("proapp_id");
				if (StrUtil.isNotBlank(proAppId)) {
					Entity proAppEntity = dbSession.queryOne(queryProAppSql, proAppId);
					if (proAppEntity != null) {
						String purchasMode = proAppEntity.getStr("purchas_mode");
						dbSession.execute(updateSql, purchasMode, zhPurchaseReview.getStr("id"));
					}
				}
			}
		}
	}

	@Bizlet("采购立项 - 最终采购方式数据填充")
	public void cglx_final_purchas_mode_tc() throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_project_approval";
		List<Entity> zhProAppList = dbSession.query(querySql);
		String updateSql = "UPDATE zh_project_approval SET final_purchas_mode = ? WHERE id = ?";
		if (zhProAppList != null & zhProAppList.size() > 0) {
			for (Entity zhProApp : zhProAppList) {
				dbSession.execute(updateSql, zhProApp.getStr("purchas_mode"), zhProApp.getStr("id"));
			}
		}
	}

	@Bizlet("市场经营 - 参与单位数据刷新")
	public void scjy_cydw_sjsx() throws Exception {
		Map<String, String> bidUnitsNameMap = new HashMap<String, String>();
		Map<String, String> bidUnitsCodeMap = new HashMap<String, String>();
		bidUnitsNameMap.put("中核咨询核资源", "核资源咨询中心");
		bidUnitsCodeMap.put("1", "16");
		bidUnitsNameMap.put("中核咨询核动力", "核动力咨询中心(工程造价咨询中心)");
		bidUnitsCodeMap.put("2", "17");
		bidUnitsNameMap.put("中核咨询系统工程", "系统工程事业部");
		bidUnitsCodeMap.put("3", "18");
		bidUnitsNameMap.put("中核咨询设备与检测", "设备监理中心");
		bidUnitsCodeMap.put("4", "19");
		bidUnitsNameMap.put("中核咨询产研", "产业发展研究中心");
		bidUnitsCodeMap.put("5", "20");
		bidUnitsNameMap.put("中核咨询核化工", "核化工咨询中心");
		bidUnitsCodeMap.put("6", "21");
		bidUnitsNameMap.put("中核咨询质量信息", "安全质量部（质量支持中心）");
		bidUnitsCodeMap.put("7", "13");
		bidUnitsNameMap.put("中核咨询工业安全", "工业安全支持中心");
		bidUnitsCodeMap.put("8", "102199");
		bidUnitsNameMap.put("中核咨询采购管理", "采购与供应链管理中心");
		bidUnitsCodeMap.put("9", "120598");
		bidUnitsNameMap.put("中核咨询工程项目管理", "工程项目管理支持中心");
		bidUnitsCodeMap.put("17", "102401");
		bidUnitsNameMap.put("中核咨询福建分公司", "福建分公司");
		bidUnitsCodeMap.put("11", "26");
		bidUnitsNameMap.put("中核咨询海南分公司", "海南分公司");
		bidUnitsCodeMap.put("12", "193");
		bidUnitsNameMap.put("中核咨询河北分公司", "河北分公司");
		bidUnitsCodeMap.put("13", "24");
		bidUnitsNameMap.put("中核咨询四川分公司", "系统工程事业部");
		bidUnitsCodeMap.put("14", "18");
		bidUnitsNameMap.put("中核咨询天津分公司", "天津分公司");
		bidUnitsCodeMap.put("15", "25");
		bidUnitsNameMap.put("中核咨询西北分公司", "系统工程事业部");
		bidUnitsCodeMap.put("16", "18");

		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT id, bid_units_code, bid_units_name FROM ZH_BIDINFO";
		String updateSql = "UPDATE ZH_BIDINFO SET bid_units_code = ?, bid_units_name = ? WHERE id = ?";

		List<Entity> bidEntityList = dbSession.query(querySql);

		for (Entity bidEntity : bidEntityList) {
			String bidUnitsCode = bidEntity.getStr("bid_units_code");
			String bidUnitsName = bidEntity.getStr("bid_units_name");
			if (StrUtil.isNotBlank(bidUnitsCode) && StrUtil.isNotBlank(bidUnitsName)) {
				List<String> codeList = StrUtil.split(bidUnitsCode, ",");
				List<String> nameList = StrUtil.split(bidUnitsName, ",");
				codeList = codeList.stream().map(code -> {
					String result = code;
					if (bidUnitsCodeMap.containsKey(code)) {
						result = bidUnitsCodeMap.get(code);
					}
					return result;
				}).collect(Collectors.toList());

				nameList = nameList.stream().map(name -> {
					String result = name;
					if (bidUnitsNameMap.containsKey(name)) {
						result = bidUnitsNameMap.get(name);
					}
					return result;
				}).collect(Collectors.toList());

				String unitsCode = StrUtil.join(",", codeList);
				String unitsName = StrUtil.join(",", nameList);

				dbSession.execute(updateSql, unitsCode, unitsName, bidEntity.getInt("id"));

			}
		}
	}

	@Bizlet("合同编号 - 刷新合同编号符合规范")
	public void htbh_sxhtbhfhgf() throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		// 付费合同
		Console.log("【开始】处理付费合同(zh_pay_contract)的合同编号调整");
		String queryZhPayContractSql = "SELECT id, contract_no FROM zh_pay_contract";
		String updateZhPayContractSql = "UPDATE zh_pay_contract SET contract_no = ? WHERE id = ?";
		List<Entity> payContractList = dbSession.query(queryZhPayContractSql);
		for (Entity payContract : payContractList) {
			String contractNo = payContract.getStr("contract_no");
			if (StrUtil.isNotBlank(contractNo)) {
				String fixContractNo = this.fixContractNo(contractNo);
				if (!contractNo.equals(fixContractNo)) {
					Console.log(StrUtil.format("原先合同编号：{}，修改后合同编号：{}", contractNo, fixContractNo));
					dbSession.execute(updateZhPayContractSql, fixContractNo, payContract.getInt("id"));
				}
			}
		}
		Console.log("【结束】处理付费合同(zh_pay_contract)的合同编号调整");

		// annual_charge_plan
		Console.log("【开始】处理annual_charge_plan的合同编号调整");
		String queryAnnualChargePlanSql = "SELECT id, contract_no FROM annual_charge_plan";
		String updateAnnualChargePlanSql = "UPDATE annual_charge_plan SET contract_no = ? WHERE id = ?";
		List<Entity> annualChargePlanList = dbSession.query(queryAnnualChargePlanSql);
		for (Entity annualChargePlan : annualChargePlanList) {
			String contractNo = annualChargePlan.getStr("contract_no");
			if (StrUtil.isNotBlank(contractNo)) {
				String fixContractNo = this.fixContractNo(contractNo);
				if (!contractNo.equals(fixContractNo)) {
					Console.log(StrUtil.format("原先合同编号：{}，修改后合同编号：{}", contractNo, fixContractNo));
					dbSession.execute(updateAnnualChargePlanSql, fixContractNo, annualChargePlan.getInt("id"));
				}
			}
		}
		Console.log("【结束】处理annual_charge_plan的合同编号调整");

		// annual_payment_plan
		Console.log("【开始】处理annual_payment_plan的合同编号调整");
		String queryAnnualPaymentPlanSql = "SELECT id, contract_no FROM annual_payment_plan";
		String updateAnnualPaymentPlanSql = "UPDATE annual_payment_plan SET contract_no = ? WHERE id = ?";
		List<Entity> annualPaymentPlanList = dbSession.query(queryAnnualPaymentPlanSql);
		for (Entity annualPaymentPlan : annualPaymentPlanList) {
			String contractNo = annualPaymentPlan.getStr("contract_no");
			if (StrUtil.isNotBlank(contractNo)) {
				String fixContractNo = this.fixContractNo(contractNo);
				if (!contractNo.equals(fixContractNo)) {
					Console.log(StrUtil.format("原先合同编号：{}，修改后合同编号：{}", contractNo, fixContractNo));
					dbSession.execute(updateAnnualPaymentPlanSql, fixContractNo, annualPaymentPlan.getStr("id"));
				}
			}
		}
		Console.log("【结束】处理annual_payment_plan的合同编号调整");

		// annual_plan_year
		Console.log("【开始】处理annual_plan_year的合同编号调整");
		String queryAnnualPlanYearSql = "SELECT id, contract_no FROM annual_plan_year";
		String updateAnnualPlanYearSql = "UPDATE annual_plan_year SET contract_no = ? WHERE id = ?";
		List<Entity> annualPlanYearList = dbSession.query(queryAnnualPlanYearSql);
		for (Entity annualPlanYear : annualPlanYearList) {
			String contractNo = annualPlanYear.getStr("contract_no");
			if (StrUtil.isNotBlank(contractNo)) {
				String fixContractNo = this.fixContractNo(contractNo);
				if (!contractNo.equals(fixContractNo)) {
					Console.log(StrUtil.format("原先合同编号：{}，修改后合同编号：{}", contractNo, fixContractNo));
					dbSession.execute(updateAnnualPlanYearSql, fixContractNo, annualPlanYear.getStr("id"));
				}
			}
		}
		Console.log("【结束】处理annual_plan_year的合同编号调整");

		// zh_agreement
		Console.log("【开始】处理框架协议(zh_agreement)的合同编号调整");
		String queryZhAgreementSql = "SELECT id, contract_no FROM zh_agreement";
		String updateZhAgreementSql = "UPDATE zh_agreement SET contract_no = ? WHERE id = ?";
		List<Entity> zhAgreementList = dbSession.query(queryZhAgreementSql);
		for (Entity zhAgreement : zhAgreementList) {
			String contractNo = zhAgreement.getStr("contract_no");
			if (StrUtil.isNotBlank(contractNo)) {
				String fixContractNo = this.fixContractNo(contractNo);
				if (!contractNo.equals(fixContractNo)) {
					Console.log(StrUtil.format("原先合同编号：{}，修改后合同编号：{}", contractNo, fixContractNo));
					dbSession.execute(updateZhAgreementSql, fixContractNo, zhAgreement.getInt("id"));
				}
			}
		}
		Console.log("【结束】处理框架协议(zh_agreement)的合同编号调整");

		// ZH_BIDINFO
		Console.log("【开始】处理市场经营信息(ZH_BIDINFO)的合同编号调整");
		String queryZhBidinfoSql = "SELECT id, contract_no FROM ZH_BIDINFO";
		String updateZhBidinfoSql = "UPDATE ZH_BIDINFO SET contract_no = ? WHERE id = ?";
		List<Entity> zhBidinfoList = dbSession.query(queryZhBidinfoSql);
		for (Entity zhBidinfo : zhBidinfoList) {
			String contractNo = zhBidinfo.getStr("contract_no");
			if (StrUtil.isNotBlank(contractNo)) {
				String fixContractNo = this.fixContractNo(contractNo);
				if (!contractNo.equals(fixContractNo)) {
					Console.log(StrUtil.format("原先合同编号：{}，修改后合同编号：{}", contractNo, fixContractNo));
					dbSession.execute(updateZhBidinfoSql, fixContractNo, zhBidinfo.getInt("id"));
				}
			}
		}
		Console.log("【结束】处理市场经营信息(ZH_BIDINFO)的合同编号调整");

		// zh_charge_contract
		Console.log("【开始】处理收费合同(zh_charge_contract)的合同编号调整");
		String queryZhChargeContractSql = "SELECT id, contract_no FROM zh_charge_contract";
		String updateZhChargeContractSql = "UPDATE zh_charge_contract SET contract_no = ? WHERE id = ?";
		List<Entity> zhChargeContractList = dbSession.query(queryZhChargeContractSql);
		for (Entity zhChargeContract : zhChargeContractList) {
			String contractNo = zhChargeContract.getStr("contract_no");
			if (StrUtil.isNotBlank(contractNo)) {
				String fixContractNo = this.fixContractNo(contractNo);
				if (!contractNo.equals(fixContractNo)) {
					Console.log(StrUtil.format("原先合同编号：{}，修改后合同编号：{}", contractNo, fixContractNo));
					dbSession.execute(updateZhChargeContractSql, fixContractNo, zhChargeContract.getInt("id"));
				}
			}
		}
		Console.log("【结束】处理收费合同(zh_charge_contract)的合同编号调整");

		// zh_kaohe_statistics_snapshot_details
		Console.log("【开始】处理考核收入统计快照明细(zh_kaohe_statistics_snapshot_details)的合同编号调整");
		String queryZhKaoheStatisticsSnapshotDetailsSql = "SELECT id, contract_no FROM zh_kaohe_statistics_snapshot_details";
		String updateZhKaoheStatisticsSnapshotDetailsSql = "UPDATE zh_kaohe_statistics_snapshot_details SET contract_no = ? WHERE id = ?";
		List<Entity> zhKaoheStatisticsSnapshotDetailsList = dbSession.query(queryZhKaoheStatisticsSnapshotDetailsSql);
		for (Entity zhKaoheStatisticsSnapshotDetails : zhKaoheStatisticsSnapshotDetailsList) {
			String contractNo = zhKaoheStatisticsSnapshotDetails.getStr("contract_no");
			if (StrUtil.isNotBlank(contractNo)) {
				String fixContractNo = this.fixContractNo(contractNo);
				if (!contractNo.equals(fixContractNo)) {
					Console.log(StrUtil.format("原先合同编号：{}，修改后合同编号：{}", contractNo, fixContractNo));
					dbSession.execute(updateZhKaoheStatisticsSnapshotDetailsSql, fixContractNo, zhKaoheStatisticsSnapshotDetails.getStr("id"));
				}
			}
		}
		Console.log("【结束】处理考核收入统计快照明细(zh_kaohe_statistics_snapshot_details)的合同编号调整");

		// zh_payment
		Console.log("【开始】处理付款管理(zh_payment)的合同编号调整");
		String queryZhPaymentSql = "SELECT id, contract_id FROM zh_payment";
		String updateZhPaymentSql = "UPDATE zh_payment SET contract_id = ? WHERE id = ?";
		List<Entity> zhPaymentList = dbSession.query(queryZhPaymentSql);
		for (Entity zhPayment : zhPaymentList) {
			String contractNo = zhPayment.getStr("contract_id");
			if (StrUtil.isNotBlank(contractNo)) {
				String fixContractNo = this.fixContractNo(contractNo);
				if (!contractNo.equals(fixContractNo)) {
					Console.log(StrUtil.format("原先合同编号：{}，修改后合同编号：{}", contractNo, fixContractNo));
					dbSession.execute(updateZhPaymentSql, fixContractNo, zhPayment.getInt("id"));
				}
			}
		}
		Console.log("【结束】处理付款管理(zh_payment)的合同编号调整");

		// zh_invoice
		Console.log("【开始】处理开票管理(zh_invoice)的合同编号调整");
		String queryZhInvoiceSql = "SELECT id, contract_no FROM zh_invoice";
		String updateZhInvoiceSql = "UPDATE zh_invoice SET contract_no = ? WHERE id = ?";
		List<Entity> zhInvoiceList = dbSession.query(queryZhInvoiceSql);
		for (Entity zhInvoice : zhInvoiceList) {
			String contractNo = zhInvoice.getStr("contract_no");
			if (StrUtil.isNotBlank(contractNo)) {
				String fixContractNo = this.fixContractNo(contractNo);
				if (!contractNo.equals(fixContractNo)) {
					Console.log(StrUtil.format("原先合同编号：{}，修改后合同编号：{}", contractNo, fixContractNo));
					dbSession.execute(updateZhInvoiceSql, fixContractNo, zhInvoice.getInt("id"));
				}
			}
		}
		Console.log("【结束】处理开票管理(zh_invoice)的合同编号调整");

	}

	// 修复合同编号
	private String fixContractNo(String originalNo) {
		// 1. 空值/纯空白处理
		if (StrUtil.isBlank(originalNo)) {
			return null;
		}
		// 2. 移除所有空格（首尾+中间）
		StringBuilder noWithoutSpace = new StringBuilder();
		for (int i = 0; i < originalNo.length(); i++) {
			char c = originalNo.charAt(i);
			// 排除所有空格类型：半角空格(32)、全角空格(12288)、制表符(9)、换行符(10)等
			if (!CharUtil.isBlankChar(c)) {
				noWithoutSpace.append(c);
			}
		}
		if (StrUtil.isBlank(noWithoutSpace)) {
			return null;
		}
		// 3. 替换中文全角横线（－）为英文半角横线（-），同时替换全角括号为半角括号
		String noWithHalfSymbol = StrUtil.replace(StrUtil.replace(noWithoutSpace, "－", "-"), "（", "(");
		noWithHalfSymbol = StrUtil.replace(noWithHalfSymbol, "）", ")");
		// 4. 小写字母转大写（Hutool工具）
		String upperNo = noWithHalfSymbol.toUpperCase();
		// 5. 最终空值兜底
		return StrUtil.isBlank(upperNo) ? null : upperNo;

	}

}
