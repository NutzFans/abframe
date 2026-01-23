package com.zhonghe.ame.kaohe;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("流程参与者工具类")
public class WFParticipantUtil {

	@Bizlet("通过组织名称(逗号隔开)获取组织的机构负责人")
	public DataObject[] getByOrgs(String secOrgNames) throws Exception {
		List<DataObject> dataObjectList = new ArrayList<DataObject>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		List<String> secOrgNameList = StrUtil.split(secOrgNames, ",");
		String queryOrgSqlOne = "SELECT ORGLEVEL, ORGSEQ, JUDGE, MANAGERID FROM OM_ORGANIZATION WHERE ORGNAME = ?";
		String queryEmpSqlOne = "SELECT EMPCODE, EMPNAME FROM OM_EMPLOYEE WHERE EMPID = ?";
		for (String secOrgName : secOrgNameList) {
			Entity orgEntity = dbSession.queryOne(queryOrgSqlOne, secOrgName);
			Entity empEntity = dbSession.queryOne(queryEmpSqlOne, orgEntity.getInt("MANAGERID"));
			DataObject dataObject = DataObjectUtil.createDataObject("com.eos.workflow.data.WFParticipant");
			dataObject.setString("id", empEntity.getStr("EMPCODE"));
			dataObject.setString("name", empEntity.getStr("EMPNAME"));
			dataObject.setString("typeCode", "person");
			dataObjectList.add(dataObject);
		}
		return ArrayUtil.toArray(dataObjectList, DataObject.class);
	}

}
