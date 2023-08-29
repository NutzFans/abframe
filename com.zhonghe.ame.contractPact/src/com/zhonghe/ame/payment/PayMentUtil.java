package com.zhonghe.ame.payment;

import static com.eos.system.annotation.ParamType.CONSTANT;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.system.annotation.Bizlet;
import com.eos.system.annotation.BizletParam;

import commonj.sdo.DataObject;

@Bizlet("付款管理模块工具类")
public class PayMentUtil {

	@Bizlet("判断付款金额是否超过季度限额")
	public String checkPayPaid(String payId, String contractNo, String applyPayContractSum) {
		try {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			int year = DateUtil.thisYear();
			String startDate = StrUtil.format("{}-{}-{}", year, "01", "01");
			String endDate = DateUtil.today();
			String queryPaymentSql = "SELECT apply_pay_contract_sum FROM zh_payment WHERE contract_id=? AND (app_status='2' OR app_status='1') AND create_time >=? AND create_time <=?";
			String querySql = "SELECT * FROM annual_payment_plan WHERE pay_id = ? AND years = ?";
			List<Entity> payMentList = dbSession.query(queryPaymentSql, contractNo, startDate, endDate);
			Entity entity = dbSession.queryOne(querySql, payId, year);
			BigDecimal payMentSum = new BigDecimal(0);
			for (Entity payMent : payMentList) {
				payMentSum = NumberUtil.add(payMentSum, payMent.getBigDecimal("apply_pay_contract_sum"));
			}
			if (ObjectUtil.isNotNull(entity)) {
				BigDecimal oneQuater = NumberUtil.add(entity.getStr("jan"), entity.getStr("feb"), entity.getStr("mar"));
				BigDecimal twoQuater = NumberUtil.add(entity.getStr("apr"), entity.getStr("may"), entity.getStr("jun"));
				BigDecimal threeQuater = NumberUtil.add(entity.getStr("jul"), entity.getStr("aug"), entity.getStr("sep"));
				BigDecimal fourQuater = NumberUtil.add(entity.getStr("oct"), entity.getStr("nov"), entity.getStr("dec"));
				int quater = DateUtil.quarter(DateTime.now());
				if (quater == 1) {
					return NumberUtil.isLessOrEqual(NumberUtil.add(new BigDecimal(applyPayContractSum), payMentSum), oneQuater) ? "1" : "2";
				}
				if (quater == 2) {
					return NumberUtil.isLessOrEqual(NumberUtil.add(new BigDecimal(applyPayContractSum), payMentSum), NumberUtil.add(oneQuater, twoQuater)) ? "1" : "2";
				}
				if (quater == 3) {
					return NumberUtil.isLessOrEqual(NumberUtil.add(new BigDecimal(applyPayContractSum), payMentSum), NumberUtil.add(oneQuater, twoQuater, threeQuater)) ? "1" : "2";
				}
				if (quater == 4) {
					return NumberUtil.isLessOrEqual(NumberUtil.add(new BigDecimal(applyPayContractSum), payMentSum), NumberUtil.add(oneQuater, twoQuater, threeQuater, fourQuater)) ? "1"
							: "2";
				}
				return "4";
			} else {
				return "3";
			}
		} catch (Exception e) {
			return "4";
		}

	}

	@Bizlet("更新付费合同中的合同余额，如果付款进度为结算款，更新付费合同的执行状态及完成时间")
	public void updatePayContract(int payMentId) {
		DataObject[] payMents = this.queryPayMentById(payMentId);
		DataObject payMent = payMents[0];
		String contractId = payMent.getString("contractId");
		String applyPayContractSum = payMent.getString("applyPayContractSum");
		String payType = payMent.getString("payType");
		DataObject[] pays = this.queryPayByContractNo(contractId);
		if (pays != null) {
			DataObject pay = pays[0];
			String contractBalance = pay.getString("contractBalance");
			BigDecimal newContractBalance = NumberUtil.sub(contractBalance, applyPayContractSum);
			this.updatePayContract(contractId, newContractBalance);
			if (StrUtil.equals("2", payType)) {
				this.updateExecuteStatusAndFinishTime("2", DateUtil.today(), contractId);
			}
		}
	}

	private DataObject[] queryPayMentById(int payMentId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("payMentId", payMentId);
		Object[] objects = DatabaseExt.queryByNamedSql("default", "com.zhonghe.ame.payment.payMent.queryPayMentById", map);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
		return dataObjects;
	}

	private DataObject[] queryPayByContractNo(String contractNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("contractNo", contractNo);
		Object[] objects = DatabaseExt.queryByNamedSql("default", "com.zhonghe.ame.payment.payMent.queryPayByContractNo", map);
		if (objects != null && objects.length > 0) {
			DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
			return dataObjects;
		} else {
			return null;
		}
	}

	private void updatePayContract(String contractNo, BigDecimal contractBalance) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("contractNo", contractNo);
		map.put("contractBalance", contractBalance);
		DatabaseExt.executeNamedSql("default", "com.zhonghe.ame.payment.payMent.updatePayContract", map);
	}

	private void updateExecuteStatusAndFinishTime(String executeStatus, String finishTime, String contractNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("contractNo", contractNo);
		map.put("executeStatus", executeStatus);
		map.put("finishTime", finishTime);
		DatabaseExt.executeNamedSql("default", "com.zhonghe.ame.payment.payMent.updateExecuteStatusAndFinishTime", map);
	}

	@Bizlet("更新付费合同模块中合同余额字段 - 维护付款数据时")
	public void whUpdatePayContract(String contractId, String applyPayContractSum, String historyApplyPayContractSum) {
		DataObject[] pays = this.queryPayByContractNo(contractId);
		if (pays != null) {
			DataObject pay = pays[0];
			String contractBalance = pay.getString("contractBalance");
			BigDecimal newContractBalance = NumberUtil.sub(NumberUtil.add(contractBalance, historyApplyPayContractSum), NumberUtil.toBigDecimal(applyPayContractSum));
			this.updatePayContract(contractId, newContractBalance);
		}
	}

	@Bizlet("更新付费合同模块中合同余额字段 - 作废付款时")
	public void zfUpdateChargeContrac(String contractId, String applyPayContractSum) {
		DataObject[] pays = this.queryPayByContractNo(contractId);
		if (pays != null) {
			DataObject pay = pays[0];
			String contractBalance = pay.getString("contractBalance");
			BigDecimal newContractBalance = NumberUtil.add(contractBalance, applyPayContractSum);
			this.updatePayContract(contractId, newContractBalance);
		}
	}

}
