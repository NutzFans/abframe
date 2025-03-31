package com.primeton.eos.common;

import java.util.List;

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

}
