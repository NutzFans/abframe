package com.zhonghe.ame.contractPact;

import java.util.List;

import cn.hutool.core.util.IdUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("新增单位年度目标值及门槛值")
public class AddOrgDimThreshold {

	@Bizlet("新增单位年度目标值及门槛值")
	public String add(String years, String secOrg, String nTargetValue, String nThresholdValue, String wTargetValue, String wThresholdValue) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySecOrgSql = "SELECT * FROM zh_operating_income_threshold WHERE years=? AND sec_org=?";
		List<Entity> list = dbSession.query(querySecOrgSql, years, secOrg);
		if (list != null && list.size() > 0) {
			// 该单位在该年度已配置目标值及门槛值
			return "1";
		}
		String insertSql = "INSERT INTO zh_operating_income_threshold (id, years, sec_org, threshold_type, headquarter_group, target_value, threshold_value) VALUES (?, ?, ?, ?, ?, ?, ?)";
		dbSession.execute(insertSql, IdUtil.fastSimpleUUID(), years, secOrg, "1", "0", nTargetValue, nThresholdValue);
		dbSession.execute(insertSql, IdUtil.fastSimpleUUID(), years, secOrg, "1", "1", wTargetValue, wThresholdValue);
		return "0";
	}

	@Bizlet("编辑单位年度目标值及门槛值")
	public String edit(String years, String secOrg, String nTargetValue, String nThresholdValue, String wTargetValue, String wThresholdValue) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String updateNsql = "UPDATE zh_operating_income_threshold SET target_value=?, threshold_value=? WHERE years=? AND sec_org=? AND threshold_type='1' AND headquarter_group='0'";
		String updateWsql = "UPDATE zh_operating_income_threshold SET target_value=?, threshold_value=? WHERE years=? AND sec_org=? AND threshold_type='1' AND headquarter_group='1'";
		dbSession.execute(updateNsql, nTargetValue, nThresholdValue, years, secOrg);
		dbSession.execute(updateWsql, wTargetValue, wThresholdValue, years, secOrg);
		return "1";
	}

}
