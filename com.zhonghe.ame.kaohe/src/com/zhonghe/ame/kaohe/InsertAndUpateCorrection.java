package com.zhonghe.ame.kaohe;

import cn.hutool.core.date.DateUtil;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("虚拟产值申报，同步修改考核修正数据")
public class InsertAndUpateCorrection {

	@Bizlet("更新虚拟产值申报状态、完成时间及修改考核修正数据")
	public void finishFlowAndUpdate(String processId) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String updateSql = "UPDATE zh_kaohe_virtual_production SET finish_time = ?, app_status = ? WHERE process_id = ?";
		dbSession.execute(updateSql, DateUtil.now(), 2, processId);
	}

}
