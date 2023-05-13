package com.zhonghe.ame.purchase;

import static com.eos.system.annotation.ParamType.CONSTANT;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;
import com.eos.system.annotation.BizletParam;

import commonj.sdo.DataObject;

@Bizlet("年度采购计划工具类")
public class PurPlanItemUtil {

	@Bizlet("包装采购计划明细数据")
	public DataObject[] wrap(DataObject[] dataObjects) throws Exception {
		List<DataObject> warpDatas = new ArrayList<DataObject>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		for (int i = 0; i < dataObjects.length; i++) {
			String id = dataObjects[i].getString("id");
			BigDecimal newBudgetAmount = dataObjects[i].getBigDecimal("newBudgetAmount");
			String querySql = "SELECT zpad.amount FROM zh_project_approval AS zpa, zh_project_approval_details AS zpad WHERE zpa.id=zpad.pid AND zpa.status='2' AND zpad.plan_id=?";
			List<Entity> list = dbSession.query(querySql, id);
			BigDecimal sumamount = new BigDecimal(0);
			String sumamountRate = "0%";
			if (list != null && list.size() > 0) {
				for (Entity entity : list) {
					BigDecimal amount = entity.getBigDecimal("amount");
					sumamount = NumberUtil.add(sumamount, amount);
				}
				sumamountRate = NumberUtil.decimalFormat("#.##%", NumberUtil.div(sumamount, newBudgetAmount, 2));
			}
			dataObjects[i].setBigDecimal("sumamount", sumamount);
			dataObjects[i].setString("sumamountRate", sumamountRate);
			warpDatas.add(dataObjects[i]);
		}
		return ArrayUtil.toArray(warpDatas, DataObject.class);
	}

}
