package com.zhonghe.ame.payContract;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import cn.hutool.core.lang.Console;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("付费合同导出工具类")
public class PayContractExcelUtil {

	@Bizlet("数据包装")
	public DataObject[] wrap(DataObject[] dataObjects) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT zppi.NEW_BUDGET_AMOUNT FROM zh_project_approval_details AS zpad, zh_purchase_plan_item AS zppi WHERE zpad.plan_id = zppi.ID AND zpad.pid = ?";
		List<DataObject> warpDatas = new ArrayList<DataObject>();
		for (int i = 0; i < dataObjects.length; i++) {
			String proAppId = dataObjects[i].getString("proAppId");
			if (StrUtil.isNotBlank(proAppId)) {
				List<Entity> entityList = dbSession.query(querySql, proAppId);
				if (entityList != null && entityList.size() > 0) {
					BigDecimal total = entityList.stream().map(entity -> entity.getBigDecimal("NEW_BUDGET_AMOUNT")).reduce(BigDecimal.ZERO, BigDecimal::add);
					dataObjects[i].setBigDecimal("budgetAmount", NumberUtil.mul(10000, total));
				}
			}
			warpDatas.add(dataObjects[i]);
		}
		return ArrayUtil.toArray(warpDatas, DataObject.class);
	}

}
