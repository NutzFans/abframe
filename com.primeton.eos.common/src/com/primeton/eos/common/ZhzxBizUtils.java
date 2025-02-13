package com.primeton.eos.common;

import java.util.List;

import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("经营管理系统 - 业务处理工具")
public class ZhzxBizUtils {

	@Bizlet("开票管理 - 实际开票金额字段历史数据填充")
	public void kpgl_sjkpjezdlssjtc() throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT * FROM zh_invoice";
		List<Entity> zhInvoiceList = dbSession.query(querySql);
		String updateSql = "UPDATE zh_invoice SET actual_invoice_sum = ? WHERE id = ?";
		if (zhInvoiceList != null && zhInvoiceList.size() > 0) {
			for (Entity zhInvoice : zhInvoiceList) {
				dbSession.execute(updateSql, zhInvoice.get("invoice_sum"), zhInvoice.get("id"));
			}
		}
	}

}
