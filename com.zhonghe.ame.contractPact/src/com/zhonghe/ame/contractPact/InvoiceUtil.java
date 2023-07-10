package com.zhonghe.ame.contractPact;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.HashMap;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.common.transaction.ITransactionManager;
import com.eos.common.transaction.TransactionManagerFactory;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

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
			if (StrUtil.equals("2", payType)) {
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

	private void updateExecuteStatusAndFinishTime(String executeStatus, String finishTime, String contractNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("contractNo", contractNo);
		map.put("executeStatus", executeStatus);
		map.put("finishTime", finishTime);
		DatabaseExt.executeNamedSql("default", "com.zhonghe.ame.invoice.invoice.updateExecuteStatusAndFinishTime", map);
	}

	@Bizlet("更新收费合同模块中合同余额字段 - 维护开票数据时")
	public void whUpdateChargeContract(String contractNo, String invoiceSum, String historyInvoiceSum) {
		DataObject[] charges = this.queryChargeByContractNo(contractNo);
		if (charges != null) {
			DataObject charge = charges[0];
			String contractBalance = charge.getString("contractBalance");
			BigDecimal newContractBalance = NumberUtil.sub(NumberUtil.add(contractBalance, historyInvoiceSum), NumberUtil.toBigDecimal(invoiceSum));
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
			if (StrUtil.isNotBlank(invoice.getString("receivableSum"))) {
				dataObject.set("receivableSum", invoice.getString("receivableSum"));
			}
			if (StrUtil.isNotBlank(invoice.getString("balanceSum"))) {
				dataObject.set("balanceSum", invoice.getString("balanceSum"));
			}
			if (StrUtil.isNotBlank(invoice.getString("verification"))) {
				dataObject.set("verification", invoice.getString("verification"));
			}

			newDataObject.set("id", null);
			DatabaseExt.getPrimaryKey(newDataObject);
			newDataObject.set("createUserid", newInvoice.getString("newCreateUserid"));
			newDataObject.set("implementOrg", newInvoice.getString("newImplementOrg"));
			newDataObject.set("invoiceSum", newInvoice.getString("newInvoiceSum"));
			newDataObject.set("bookIncome", newInvoice.getString("newBookIncome"));
			newDataObject.set("invoiceTax", newInvoice.getString("newInvoiceTax"));
			if (StrUtil.isNotBlank(newInvoice.getString("receivableSum"))) {
				newDataObject.set("receivableSum", newInvoice.getString("receivableSum"));
			}
			if (StrUtil.isNotBlank(newInvoice.getString("balanceSum"))) {
				newDataObject.set("balanceSum", newInvoice.getString("balanceSum"));
			}
			if (StrUtil.isNotBlank(newInvoice.getString("verification"))) {
				newDataObject.set("verification", newInvoice.getString("verification"));
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

}
