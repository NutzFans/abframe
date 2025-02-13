package com.zhonghe.ame.contractPact;

import java.math.BigDecimal;
import java.util.HashMap;

import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.text.CharSequenceUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;

import com.eos.common.transaction.ITransactionManager;
import com.eos.common.transaction.TransactionManagerFactory;
import com.eos.das.entity.criteria.CriteriaType;
import com.eos.das.entity.criteria.ExprType;
import com.eos.das.entity.criteria.ExprType.OP;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.primeton.ame.schindler.sqlUtils;

import commonj.sdo.DataObject;

@Bizlet("开票管理模块工具类")
public class InvoiceUtil {

	@Bizlet("更新收费合同模块中合同余额字段")
	public void updateChargeContract(int invoiceId) {
		DataObject[] invoices = this.queryInvoiceById(invoiceId);
		DataObject invoice = invoices[0];
		String contractNo = invoice.getString("contractNo");
		String invoiceSum = invoice.getString("invoiceSum");
		String payType = invoice.getString("payType");
		DataObject[] charges = this.queryChargeByContractNo(contractNo);
		if (charges != null) {
			DataObject charge = charges[0];
			String contractBalance = charge.getString("contractBalance");
			BigDecimal newContractBalance = NumberUtil.sub(contractBalance, invoiceSum);
			this.updateChargeContract(contractNo, newContractBalance);
			if (CharSequenceUtil.equals("2", payType)) {
				this.updateExecuteStatusAndFinishTime("2", DateUtil.today(), contractNo);
			}
		}
	}

	@Bizlet("更新关联原开票数据的余额和收费合同模块中合同余额字段")
	public void updateSoureAndChargeContract(int invoiceId) {
		DataObject[] invoices = this.queryInvoiceById(invoiceId);
		DataObject invoice = invoices[0];
		String contractNo = invoice.getString("contractNo");
		String invoiceSum = invoice.getString("invoiceSum");
		String payType = invoice.getString("payType");
		int sourceInvoiceId = invoice.getInt("relateCont");
		DataObject[] sourceInvoices = this.queryInvoiceById(sourceInvoiceId);
		if (sourceInvoices != null) {
			DataObject sourceInvoice = sourceInvoices[0];
			String soureceBalanceSum = sourceInvoice.getString("balanceSum");
			BigDecimal newSoureceBalanceSum = NumberUtil.add(soureceBalanceSum, invoiceSum);
			this.updateInvoiceBalanceSum(sourceInvoiceId, newSoureceBalanceSum);
		}
		DataObject[] charges = this.queryChargeByContractNo(contractNo);
		if (charges != null) {
			DataObject charge = charges[0];
			String contractBalance = charge.getString("contractBalance");
			BigDecimal newContractBalance = NumberUtil.sub(contractBalance, invoiceSum);
			this.updateChargeContract(contractNo, newContractBalance);
			if (CharSequenceUtil.equals("2", payType)) {
				this.updateExecuteStatusAndFinishTime("2", DateUtil.today(), contractNo);
			}
		}
	}

	private DataObject[] queryInvoiceById(int invoiceId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("invoiceId", invoiceId);
		Object[] objects = DatabaseExt.queryByNamedSql("default", "com.zhonghe.ame.invoice.invoice.queryInvoiceById", map);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
		return dataObjects;
	}

	private DataObject[] queryChargeByContractNo(String contractNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("contractNo", contractNo);
		Object[] objects = DatabaseExt.queryByNamedSql("default", "com.zhonghe.ame.invoice.invoice.queryChargeByContractNo", map);
		if (objects != null && objects.length > 0) {
			DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
			return dataObjects;
		} else {
			return null;
		}
	}

	private void updateChargeContract(String contractNo, BigDecimal contractBalance) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("contractNo", contractNo);
		map.put("contractBalance", contractBalance);
		DatabaseExt.executeNamedSql("default", "com.zhonghe.ame.invoice.invoice.updateChargeContract", map);
	}

	private void updateInvoiceBalanceSum(int id, BigDecimal balanceSum) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("balanceSum", balanceSum);
		DatabaseExt.executeNamedSql("default", "com.zhonghe.ame.invoice.invoice.updateInvoiceBalanceSum", map);
	}

	private void updateExecuteStatusAndFinishTime(String executeStatus, String finishTime, String contractNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("contractNo", contractNo);
		map.put("executeStatus", executeStatus);
		map.put("finishTime", finishTime);
		DatabaseExt.executeNamedSql("default", "com.zhonghe.ame.invoice.invoice.updateExecuteStatusAndFinishTime", map);
	}

	@Bizlet("更新收费合同模块中合同余额字段 - 维护开票数据时")
	public void whUpdateChargeContract(String contractNo, String actualInvoiceSum, String historyActualInvoiceSum) {
		DataObject[] charges = this.queryChargeByContractNo(contractNo);
		if (charges != null) {
			DataObject charge = charges[0];
			String contractBalance = charge.getString("contractBalance");
			BigDecimal newContractBalance = NumberUtil.sub(NumberUtil.add(contractBalance, historyActualInvoiceSum), NumberUtil.toBigDecimal(actualInvoiceSum));
			this.updateChargeContract(contractNo, newContractBalance);
		}
	}

	@Bizlet("更新收费合同模块中合同余额字段 - 作废开票数据时")
	public void zfUpdateChargeContrac(String contractNo, String invoiceSum) {
		DataObject[] charges = this.queryChargeByContractNo(contractNo);
		if (charges != null) {
			DataObject charge = charges[0];
			String contractBalance = charge.getString("contractBalance");
			BigDecimal newContractBalance = NumberUtil.add(contractBalance, invoiceSum);
			this.updateChargeContract(contractNo, newContractBalance);
		}
	}

	@Bizlet("开票管理产值分配")
	public void czfpInvoice(DataObject invoice, DataObject newInvoice) throws Exception {
		ITransactionManager txManager = TransactionManagerFactory.getTransactionManager();
		try {
			int invoiceId = invoice.getInt("id");
			DataObject dataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.invoice.ZhInvoice.ZhInvoice");
			dataObject.set("id", invoiceId);
			DatabaseUtil.expandEntity("default", dataObject);
			DataObject newDataObject = ObjectUtil.clone(dataObject);
			dataObject.set("invoiceSum", invoice.getString("invoiceSum"));
			dataObject.set("bookIncome", invoice.getString("bookIncome"));
			dataObject.set("invoiceTax", invoice.getString("invoiceTax"));
			if (CharSequenceUtil.isNotBlank(invoice.getString("receivableSum"))) {
				dataObject.set("receivableSum", invoice.getString("receivableSum"));
			}
			if (CharSequenceUtil.isNotBlank(invoice.getString("balanceSum"))) {
				dataObject.set("balanceSum", invoice.getString("balanceSum"));
			}
			if (CharSequenceUtil.isNotBlank(invoice.getString("verification"))) {
				dataObject.set("verification", invoice.getString("verification"));
			}

			newDataObject.set("id", null);
			DatabaseExt.getPrimaryKey(newDataObject);
			newDataObject.set("createUserid", newInvoice.getString("newCreateUserid"));
			newDataObject.set("implementOrg", newInvoice.getString("newImplementOrg"));
			newDataObject.set("invoiceSum", newInvoice.getString("newInvoiceSum"));
			newDataObject.set("bookIncome", newInvoice.getString("newBookIncome"));
			newDataObject.set("invoiceTax", newInvoice.getString("newInvoiceTax"));
			if (CharSequenceUtil.isNotBlank(newInvoice.getString("newReceivableSum"))) {
				newDataObject.set("receivableSum", newInvoice.getString("newReceivableSum"));
			}
			if (CharSequenceUtil.isNotBlank(newInvoice.getString("newBalanceSum"))) {
				newDataObject.set("balanceSum", newInvoice.getString("newBalanceSum"));
			}
			if (CharSequenceUtil.isNotBlank(newInvoice.getString("newVerification"))) {
				newDataObject.set("verification", newInvoice.getString("newVerification"));
			}

			txManager.begin();

			DatabaseUtil.updateEntity("default", dataObject);
			DatabaseUtil.insertEntity("default", newDataObject);

			txManager.commit();

		} catch (Exception e) {
			txManager.rollback();
			throw e;
		}
	}

	@Bizlet("申请时产值分配配置保存")
	public void addSaveAllotDatas(DataObject[] allotDatas, int invoiceId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("invoiceId", invoiceId);
		sqlUtils.executeSql("com.zhonghe.ame.invoice.invoice.deleteAllotDatasByInvoiceId", map);
		if (allotDatas != null && allotDatas.length > 0) {
			for (int i = 0; i < allotDatas.length; i++) {
				DataObject dataObject = allotDatas[i];
				dataObject.set("id", IdUtil.simpleUUID());
				dataObject.set("invoiceId", invoiceId);
				dataObject.set("genDataId", null);
				DatabaseUtil.insertEntity("default", dataObject);
			}
		}
	}

	@Bizlet("在最后一个节点提交后，更新产值分配记录(主要是账面收入字段)")
	public void updateAllotDatas(DataObject[] allotDataObjects) {
		ITransactionManager txManager = TransactionManagerFactory.getTransactionManager();
		try {
			if (allotDataObjects != null && allotDataObjects.length > 0) {
				txManager.begin();
				for (int i = 0; i < allotDataObjects.length; i++) {
					DataObject allotDataObject = allotDataObjects[i];
					DatabaseUtil.updateEntity("default", allotDataObject);
				}
				txManager.commit();
			}
		} catch (Exception e) {
			txManager.rollback();
			throw e;
		}
	}

	@Bizlet("发起申请时包含产值分配，在审批通过后执行拆分相关逻辑")
	public void operateAllotDatas(int invoiceId) {
		ITransactionManager txManager = TransactionManagerFactory.getTransactionManager();
		try {
			// 获取开票记录
			DataObject zhInvoiceDataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.invoice.ZhInvoice.ZhInvoice");
			zhInvoiceDataObject.set("id", invoiceId);
			DatabaseUtil.expandEntity("default", zhInvoiceDataObject);

			// 获取开票记录关联的产值分配记录集合
			CriteriaType criteriaType = CriteriaType.FACTORY.create();
			criteriaType.set_entity("com.zhonghe.ame.invoice.ZhInvoice.ZhInvoiceAllot");
			ExprType exprType = ExprType.FACTORY.create();
			exprType.set_op("=");
			exprType.set_property("invoiceId");
			exprType.set_value(String.valueOf(invoiceId));
			criteriaType.set_expr(ListUtil.list(false, exprType));
			DataObject[] allotDataObjects = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteriaType);

			if (allotDataObjects != null && allotDataObjects.length > 0) {
				DataObject updateDataObject = ObjectUtil.clone(zhInvoiceDataObject);
				txManager.begin();
				for (int i = 0; i < allotDataObjects.length; i++) {
					DataObject allotDataObject = allotDataObjects[i];
					if (StrUtil.equals("1", allotDataObject.getString("dataType"))) {
						updateDataObject.set("invoiceSum", allotDataObject.getString("invoiceSum"));
						updateDataObject.set("bookIncome", allotDataObject.getString("bookIncome"));
						updateDataObject.set("invoiceTax", allotDataObject.getString("invoiceTax"));
						updateDataObject.set("balanceSum", allotDataObject.getString("invoiceSum"));
						DatabaseUtil.updateEntity("default", updateDataObject);
					} else {
						DataObject newDataObject = ObjectUtil.clone(zhInvoiceDataObject);
						newDataObject.set("id", null);
						DatabaseExt.getPrimaryKey(newDataObject);
						newDataObject.set("actualInvoiceSum", new BigDecimal(0));
						newDataObject.set("invoiceSum", allotDataObject.getString("invoiceSum"));
						newDataObject.set("bookIncome", allotDataObject.getString("bookIncome"));
						newDataObject.set("invoiceTax", allotDataObject.getString("invoiceTax"));
						newDataObject.set("balanceSum", allotDataObject.getString("invoiceSum"));
						newDataObject.set("createUserid", allotDataObject.getString("userid"));
						newDataObject.set("implementOrg", allotDataObject.getString("orgid"));
						DatabaseUtil.insertEntity("default", newDataObject);
						allotDataObject.set("genDataId", newDataObject.getInt("id"));
						DatabaseUtil.updateEntity("default", allotDataObject);
					}
				}
				txManager.commit();
			}
		} catch (Exception e) {
			txManager.rollback();
			throw e;
		}
	}

	@Bizlet("发起红冲/作废申请时包含产值分配，在审批通过后执行拆分相关逻辑")
	public void redInkOperateAllotDatas(int invoiceId) {
		ITransactionManager txManager = TransactionManagerFactory.getTransactionManager();
		try {
			// 获取开票记录
			DataObject zhInvoiceDataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.invoice.ZhInvoice.ZhInvoice");
			zhInvoiceDataObject.set("id", invoiceId);
			DatabaseUtil.expandEntity("default", zhInvoiceDataObject);

			// 获取开票记录关联的产值分配记录集合
			CriteriaType criteriaType = CriteriaType.FACTORY.create();
			criteriaType.set_entity("com.zhonghe.ame.invoice.ZhInvoice.ZhInvoiceAllot");
			ExprType exprType = ExprType.FACTORY.create();
			exprType.set_op("=");
			exprType.set_property("invoiceId");
			exprType.set_value(String.valueOf(invoiceId));
			criteriaType.set_expr(ListUtil.list(false, exprType));
			DataObject[] allotDataObjects = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteriaType);

			if (allotDataObjects != null && allotDataObjects.length > 0) {
				DataObject updateDataObject = ObjectUtil.clone(zhInvoiceDataObject);
				txManager.begin();
				for (int i = 0; i < allotDataObjects.length; i++) {
					DataObject allotDataObject = allotDataObjects[i];
					if (StrUtil.equals("1", allotDataObject.getString("dataType"))) {
						updateDataObject.set("invoiceSum", allotDataObject.getString("invoiceSum"));
						updateDataObject.set("bookIncome", allotDataObject.getString("bookIncome"));
						updateDataObject.set("invoiceTax", allotDataObject.getString("invoiceTax"));
						DatabaseUtil.updateEntity("default", updateDataObject);
						// 更新关联原开票数据的余额
						DataObject sourceInvoiceDataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.invoice.ZhInvoice.ZhInvoice");
						sourceInvoiceDataObject.set("id", zhInvoiceDataObject.getInt("relateCont"));
						DatabaseUtil.expandEntity("default", sourceInvoiceDataObject);
						String soureceBalanceSum = sourceInvoiceDataObject.getString("balanceSum");
						BigDecimal newSoureceBalanceSum = NumberUtil.add(soureceBalanceSum, allotDataObject.getString("invoiceSum"));
						sourceInvoiceDataObject.set("balanceSum", newSoureceBalanceSum);
						DatabaseUtil.updateEntity("default", sourceInvoiceDataObject);
					} else {
						DataObject newDataObject = ObjectUtil.clone(zhInvoiceDataObject);
						newDataObject.set("id", null);
						DatabaseExt.getPrimaryKey(newDataObject);
						newDataObject.set("actualInvoiceSum", new BigDecimal(0));
						newDataObject.set("invoiceSum", allotDataObject.getString("invoiceSum"));
						newDataObject.set("bookIncome", allotDataObject.getString("bookIncome"));
						newDataObject.set("invoiceTax", allotDataObject.getString("invoiceTax"));
						newDataObject.set("createUserid", allotDataObject.getString("userid"));
						newDataObject.set("implementOrg", allotDataObject.getString("orgid"));
						DatabaseUtil.insertEntity("default", newDataObject);
						allotDataObject.set("genDataId", newDataObject.getInt("id"));
						DatabaseUtil.updateEntity("default", allotDataObject);
						// 更新关联原开票数据的余额
						ExprType exprTypeInvoiceId = ExprType.FACTORY.create();
						exprType.set_op("=");
						exprTypeInvoiceId.set_property("invoiceId");
						exprTypeInvoiceId.set_value(String.valueOf(zhInvoiceDataObject.getInt("relateCont")));
						ExprType exprTypeUserid = ExprType.FACTORY.create();
						exprTypeUserid.set_op("=");
						exprTypeUserid.set_property("userid");
						exprTypeUserid.set_value(String.valueOf(allotDataObject.getString("userid")));
						ExprType exprTypeOrgid = ExprType.FACTORY.create();
						exprTypeOrgid.set_op("=");
						exprTypeOrgid.set_property("orgid");
						exprTypeOrgid.set_value(String.valueOf(allotDataObject.getString("orgid")));
						criteriaType.set_expr(ListUtil.list(false, exprTypeInvoiceId, exprTypeUserid, exprTypeOrgid));
						DataObject[] sourceAllotDataObjects = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteriaType);
						if (sourceAllotDataObjects != null && sourceAllotDataObjects.length > 0) {
							DataObject sourceAllotDataObject = sourceAllotDataObjects[0];
							DataObject sourceInvoiceDataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.invoice.ZhInvoice.ZhInvoice");
							sourceInvoiceDataObject.set("id", sourceAllotDataObject.get("genDataId"));
							DatabaseUtil.expandEntity("default", sourceInvoiceDataObject);
							String soureceBalanceSum = sourceInvoiceDataObject.getString("balanceSum");
							BigDecimal newSoureceBalanceSum = NumberUtil.add(soureceBalanceSum, allotDataObject.getString("invoiceSum"));
							sourceInvoiceDataObject.set("balanceSum", newSoureceBalanceSum);
							DatabaseUtil.updateEntity("default", sourceInvoiceDataObject);
						}
					}
				}

				// 更新收费合同模块中合同余额
				String contractNo = zhInvoiceDataObject.getString("contractNo");
				String invoiceSum = zhInvoiceDataObject.getString("invoiceSum");
				String payType = zhInvoiceDataObject.getString("payType");
				DataObject[] charges = this.queryChargeByContractNo(contractNo);
				if (charges != null) {
					DataObject charge = charges[0];
					String contractBalance = charge.getString("contractBalance");
					BigDecimal newContractBalance = NumberUtil.sub(contractBalance, invoiceSum);
					this.updateChargeContract(contractNo, newContractBalance);
					if (CharSequenceUtil.equals("2", payType)) {
						this.updateExecuteStatusAndFinishTime("2", DateUtil.today(), contractNo);
					}
				}

				txManager.commit();
			}
		} catch (Exception e) {
			txManager.rollback();
			throw e;
		}
	}

}
