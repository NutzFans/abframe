package com.zhonghe.ame.marketInfo.marketinfo.khxx;

import cn.hutool.core.lang.Console;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("市场经营工具类")
public class BidInfoUtil {

	@Bizlet("更新收费合同信息")
	public void updateChargeContract(DataObject bidInfo) {
		try {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			String updateSql = "UPDATE zh_charge_contract SET invest_amount = ?, bid_service = ?, major = ?, project_type = ?, contract_model = ?, procurement_type = ?, headquarter_group = ?, signatory = ?, signatory_name = ?, two_org = ? WHERE tender_id = ?";
			String investAmount = bidInfo.getString("investAmount");
			String bidService = bidInfo.getString("bidService");
			String major = bidInfo.getString("majorType");
			String projectType = bidInfo.getString("projectType");
			String contractModel = bidInfo.getString("contractModel");
			String procurementType = bidInfo.getString("procurementType");
			String headquarterGroup = bidInfo.getString("headquarterGroup");
			String signatory = bidInfo.getString("custId");
			String signatoryName = bidInfo.getString("custName");
			String twoOrg = bidInfo.getString("twoOrg");
			String tenderId = bidInfo.getString("id");
			dbSession.execute(updateSql, investAmount, bidService, major, projectType, contractModel, procurementType, headquarterGroup, signatory, signatoryName, twoOrg, tenderId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
