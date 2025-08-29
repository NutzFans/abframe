package com.zhonghe.ame.finance;

import java.util.ArrayList;
import java.util.List;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.db.Entity;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("应收账款统计包装类")
public class AccountsReceivablewrap {

	@Bizlet("包装数据")
	public DataObject[] wrap(List<Entity> entityList) {
		List<DataObject> dataObjectList = new ArrayList<DataObject>();
		if (entityList != null && entityList.size() > 0) {
			for (Entity entity : entityList) {
				DataObject dataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.finance.accountsReceivable.AccountsReceivableTjEntity");
				dataObject.setString("secOrgname", entity.getStr("secOrgname"));
				dataObject.setBigDecimal("invoiceSumTotal", entity.getBigDecimal("invoiceSumTotal"));
				dataObject.setBigDecimal("receivableSumTotal", entity.getBigDecimal("receivableSumTotal"));
				dataObject.setString("collectionRateText", entity.getStr("collectionRateText"));
				dataObject.setBigDecimal("averageDay", entity.getBigDecimal("averageDay"));
				dataObject.setBigDecimal("monthlyAccountsReceivableTotal", entity.getBigDecimal("monthlyAccountsReceivableTotal"));
				dataObject.setBigDecimal("monthlyInvoicingPortionTotal", entity.getBigDecimal("monthlyInvoicingPortionTotal"));
				dataObject.setString("proportionText", entity.getStr("proportionText"));
				dataObject.setBigDecimal("accountsReceivableBalanceTotal", entity.getBigDecimal("accountsReceivableBalanceTotal"));
				dataObject.setBigDecimal("oneBalanceTotal", entity.getBigDecimal("oneBalanceTotal"));
				dataObject.setBigDecimal("oneTwoBalanceTotal", entity.getBigDecimal("oneTwoBalanceTotal"));
				dataObject.setBigDecimal("twoThreeBalanceTotal", entity.getBigDecimal("twoThreeBalanceTotal"));
				dataObject.setBigDecimal("threeBalanceTotal", entity.getBigDecimal("threeBalanceTotal"));
				dataObjectList.add(dataObject);
			}
		}
		return ArrayUtil.toArray(dataObjectList, DataObject.class);
	}

}
