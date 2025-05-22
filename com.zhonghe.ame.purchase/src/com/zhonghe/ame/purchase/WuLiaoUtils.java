package com.zhonghe.ame.purchase;

import java.util.List;

import cn.hutool.core.date.DateUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("物料编码检查工具类")
public class WuLiaoUtils {

	@Bizlet("物料编码检查")
	public String checkWuLiaoUtils(String[] wuLiaoCodes) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String date90DaysAgoStr = DateUtil.format(DateUtil.offsetDay(DateUtil.date(), -90), "yyyy-MM-dd");
		String querySql = "SELECT zpzi.ythpt_wl_code FROM zh_purchase_zero_item AS zpzi, zh_purchase_zero AS zpz WHERE ythpt_wl_code = ? AND zpzi.zero_id = zpz.id AND zpz.CREATED_TIME > ?";
		for (int i = 0; i < wuLiaoCodes.length; i++) {
			List<Entity> resultList = dbSession.query(querySql, wuLiaoCodes[i], date90DaysAgoStr);
			if (resultList != null && resultList.size() >= 2) {
				return "物料编码【"+wuLiaoCodes[i]+"】在最近90天内已被使用2次，无法再次使用，请联系企发部！";
			}
		}
		return "success";
	}
}
