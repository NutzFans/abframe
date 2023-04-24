package com.zhonghe.ame.contractPact;

import java.util.List;

import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("营业收入跟踪 - 单位维度 - 阀值配置")
public class OrgDimThresholdUtil {

	@Bizlet("营业收入跟踪 - 单位维度 - 阀值配置")
	public DataObject getOrgDimThreshold(String years, String secOrg) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_operating_income_threshold WHERE threshold_type='1' AND years=? AND sec_org=?";
		List<Entity> entitys = dbSession.query(querySql, years, secOrg);
		DataObject dataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.OrgDimThreholdEntity");
		dataObject.setString("years", years);
		dataObject.setString("secOrg", secOrg);
		for (Entity entity : entitys) {
			if (entity.getStr("headquarter_group").equals("0")) {
				dataObject.setString("nTargetValue", entity.getStr("target_value"));
				dataObject.setString("nThresholdValue", entity.getStr("threshold_value"));
			} else {
				dataObject.setString("wTargetValue", entity.getStr("target_value"));
				dataObject.setString("wThresholdValue", entity.getStr("threshold_value"));
			}
		}
		return dataObject;
	}

}
