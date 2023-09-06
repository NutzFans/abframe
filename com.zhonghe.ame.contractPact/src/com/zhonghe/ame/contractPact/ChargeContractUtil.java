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
	
}
