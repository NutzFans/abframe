package com.zhonghe.ame.contractPact;

import java.util.List;

import cn.hutool.core.util.IdUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("新增专业年度目标值及门槛值")
public class AddMajorDimThreshold {

	@Bizlet("新增专业年度目标值及门槛值")
	public String add(String years, String major, String nTargetValue, String nThresholdValue, String wTargetValue, String wThresholdValue) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String queryMajorSql = "SELECT * FROM zh_operating_income_threshold WHERE years=? AND major_type=? AND threshold_type='2'";
		List<Entity> list = dbSession.query(queryMajorSql, years, major);
		if (list != null && list.size() > 0) {
			// 该专业类别在该年度已配置目标值及门槛值
			return "1";
		}
		String insertSql = "INSERT INTO zh_operating_income_threshold (id, years, threshold_type, headquarter_group, major_type, target_value, threshold_value) VALUES (?, ?, ?, ?, ?, ?, ?)";
		dbSession.execute(insertSql, IdUtil.fastSimpleUUID(), years, "2", "0", major, nTargetValue, nThresholdValue);
		dbSession.execute(insertSql, IdUtil.fastSimpleUUID(), years, "2", "1", major, wTargetValue, wThresholdValue);
		return "0";
	}

	@Bizlet("编辑专业年度目标值及门槛值")
	public String edit(String years, String major, String nTargetValue, String nThresholdValue, String wTargetValue, String wThresholdValue) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String updateNsql = "UPDATE zh_operating_income_threshold SET target_value=?, threshold_value=? WHERE years=? AND major_type=? AND threshold_type='2' AND headquarter_group='0'";
		String updateWsql = "UPDATE zh_operating_income_threshold SET target_value=?, threshold_value=? WHERE years=? AND major_type=? AND threshold_type='2' AND headquarter_group='1'";
		dbSession.execute(updateNsql, nTargetValue, nThresholdValue, years, major);
		dbSession.execute(updateWsql, wTargetValue, wThresholdValue, years, major);
		return "1";
	}

}
