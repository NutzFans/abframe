package com.zhonghe.ame.contractPact;

import java.math.BigDecimal;
import java.util.HashMap;

import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.database.DatabaseExt;
import com.eos.system.annotation.Bizlet;
import commonj.sdo.DataObject;

@Bizlet("收费合同模块工具类")
public class ChargeContractUtil {

	@Bizlet("作废时更新金额数据 - 补充协议作废对主合同相关金额的变更")
	public boolean updateZfInfo(int id) {
		try {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			String querySql = "SELECT * FROM zh_charge_contract WHERE id=? AND  issupagreement = 'y'";
			Entity entity = dbSession.queryOne(querySql, id);
			if (ObjectUtil.isNotNull(entity)) {
				String relateCont = entity.getStr("relate_cont");
				if (StrUtil.isNotEmpty(relateCont)) {
					String querySql2 = "SELECT * FROM zh_charge_contract WHERE id=?";
					Entity mainEntity = dbSession.queryOne(querySql2, relateCont);
					if (ObjectUtil.isNotNull(mainEntity)) {
						String finContractSum = mainEntity.getStr("fin_contract_sum");
						String contractBalance = mainEntity.getStr("contract_balance");
						String contractSum = entity.getStr("contract_sum");
						BigDecimal newFinContractSum = NumberUtil.sub(finContractSum, contractSum);
						BigDecimal newContractBalance = NumberUtil.sub(contractBalance, contractSum);
						String updateSql = "UPDATE zh_charge_contract SET fin_contract_sum=?, contract_balance=? WHERE id=?";
						dbSession.execute(updateSql, newFinContractSum, newContractBalance, relateCont);
					}
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Bizlet("补充协议完成后 - 变更合同金额和余额")
	public void updateFinContractSumAndContractBalance(String finContractSum, String contractBalance, String relateCont) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("finContractSum", finContractSum);
		map.put("contractBalance", contractBalance);
		map.put("relateCont", relateCont);
		DatabaseExt.executeNamedSql("default", "com.zhonghe.ame.contractPact.chargeContract.updateFinContractSumAndContractBalance", map);
	}

	@Bizlet("通过修改最终合同金额和合同余额调整累计已入账")
	public String updateFinSumAndContractBalance(String id, String finalSum, String contractBalance) throws Exception {
		try {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			String updateSql = "UPDATE zh_charge_contract SET fin_contract_sum=?, contract_balance=? WHERE id=?";
			dbSession.execute(updateSql, finalSum, contractBalance, id);
			return "1";
		} catch (Exception e) {
			e.printStackTrace();
			return "2";
		}
	}

	@Bizlet("根据投标记录更新市场经营中的合同编号信息")
	public void updateContractNoByBidInfo(DataObject dataObject) throws Exception {
		if (StrUtil.isNotBlank(dataObject.getString("tenderId"))) {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			String updateSql = "UPDATE ZH_BIDINFO SET contract_no = ? WHERE id = ?";
			dbSession.execute(updateSql, dataObject.getString("contractNo"), dataObject.getString("tenderId"));
		}
	}

	@Bizlet("根据投标记录更新市场经营中的合同编号信息")
	public void updateContractNoByBidInfoNameSql(DataObject dataObject) throws Exception {
		if (StrUtil.isNotBlank(dataObject.getString("tenderId"))) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("contractNo", dataObject.getString("contractNo"));
			map.put("tenderId", dataObject.getString("tenderId"));
			DatabaseExt.executeNamedSql("default", "com.zhonghe.ame.contractPact.chargeContract.updateContractNoByBidInfo", map);
		}
	}

	@Bizlet("根据合同编号获取主键")
	public String getIdByContractNo(String contractNo) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT id FROM zh_charge_contract WHERE contract_no = ?";
		Entity entity = dbSession.queryOne(querySql, contractNo);
		if (entity != null) {
			return entity.getStr("id");
		} else {
			return null;
		}
	}

}
