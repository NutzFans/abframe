package com.zhonghe.ame.purchase;

import java.util.List;

import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("组织机构操作类")
public class OrgUtils {

	@Bizlet("根据组织SEQ获取组织信息")
	public String getOrgsByOrgseq(String orgseq) {
		try {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			String param = orgseq + "%";
			String querySql = "SELECT ORGID, ORGSEQ FROM OM_ORGANIZATION WHERE ORGSEQ LIKE ?";
			List<Entity> entitys = dbSession.query(querySql, param);
			if (entitys.size() > 0) {
				String orgids = "";
				for (Entity entity : entitys) {
					String orgid = entity.getStr("ORGID");
					orgids = orgids + orgid + ",";
				}
				return StrUtil.removeSuffix(orgids, ",");
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}

}
