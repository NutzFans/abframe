package com.zhonghe.ame.contractPact;

import java.math.BigDecimal;

import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("付费合同模块工具类")
public class PayContractUtil {

	@Bizlet("作废时更新金额数据 - 补充协议作废对主合同相关金额的变更")
	public boolean updateZfInfo(int id) {
		try {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			String querySql = "SELECT * FROM zh_pay_contract WHERE id=? AND  issupagreement = 'y'";
			Entity entity = dbSession.queryOne(querySql, id);
			if (ObjectUtil.isNotNull(entity)) {
				String relateCont = entity.getStr("relate_cont");
				if (StrUtil.isNotEmpty(relateCont)) {
					String querySql2 = "SELECT * FROM zh_pay_contract WHERE id=?";
					Entity mainEntity = dbSession.queryOne(querySql2, relateCont);
					if (ObjectUtil.isNotNull(mainEntity)) {
						String finContractSum = mainEntity.getStr("final_sum");
						String contractBalance = mainEntity.getStr("contract_balance");
						String contractSum = entity.getStr("contract_sum");
						BigDecimal newFinContractSum = NumberUtil.sub(finContractSum, contractSum);
						BigDecimal newContractBalance = NumberUtil.sub(contractBalance, contractSum);
						String updateSql = "UPDATE zh_pay_contract SET final_sum=?, contract_balance=? WHERE id=?";
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

	@Bizlet("四类供货商需要判断合同金额 - 合同金额不能大于10万")
	public String checkCustAndContractSum(String contractSum, String custId) {
		try {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			String querySql = "SELECT * FROM PUR_SUPPLIER WHERE CUSTID=? AND CUSTTYPE='3'";
			Entity entity = dbSession.queryOne(querySql, custId);
			if (ObjectUtil.isNotNull(entity)) {
				if (NumberUtil.isLessOrEqual(new BigDecimal(contractSum), new BigDecimal(100000))) {
					return "1";
				} else {
					return "2";
				}
			} else {
				return "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "2";
		}

	}

	@Bizlet("通过修改最终合同金额和合同余额调整累计已支付")
	public String updateFinalSumAndContractBalance(String id, String finalSum, String contractBalance) {
		try {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			String updateSql = "UPDATE zh_pay_contract SET final_sum=?, contract_balance=? WHERE id=?";
			dbSession.execute(updateSql, finalSum, contractBalance, id);
			return "1";
		} catch (Exception e) {
			e.printStackTrace();
			return "2";
		}
	}

}
