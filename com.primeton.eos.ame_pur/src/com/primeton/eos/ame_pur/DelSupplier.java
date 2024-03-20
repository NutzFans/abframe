package com.primeton.eos.ame_pur;

import java.util.List;

import cn.hutool.core.lang.Console;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("删除供货商")
public class DelSupplier {

	@Bizlet("删除供货商")
	public String del(DataObject[] dataObject) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_pay_contract WHERE signatory = ?";
		String delSql = "DELETE FROM PUR_SUPPLIER WHERE CUSTID = ?";
		for (int i = 0; i < dataObject.length; i++) {
			String custid = dataObject[i].getString("custid");
			List<Entity> entityList = dbSession.query(querySql, custid);
			if (ObjectUtil.isNotNull(entityList) && entityList.size() > 0) {
				return "2";
			} else {
				dbSession.execute(delSql, custid);
			}
		}
		return "1";
	}

}
