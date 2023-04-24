package com.zhonghe.ame.contractPact;

import java.util.List;

import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("营业收入跟踪 - 专业类型维度 - 阀值配置")
public class MajorDimThresholdUtil {

	@Bizlet("营业收入跟踪 - 专业类型维度 - 阀值配置")
	public DataObject getMajorDimThreshold(String years, String majorId) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_operating_income_threshold WHERE threshold_type='2' AND years=? AND major_type=?";
		List<Entity> entitys = dbSession.query(querySql, years, majorId);
		DataObject dataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.MajorDimThreholdEntity");
		dataObject.setString("years", years);
		dataObject.setString("major", majorId);
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
