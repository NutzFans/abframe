package com.zhonghe.ame.purchase;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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

	@Bizlet("根据提供的组织ID获取所属部门或分公司下所有组织ID")
	public String getOrgStrsByOrgId(int orgId) {
		try {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			String querySqlOne = "SELECT ORGSEQ FROM OM_ORGANIZATION WHERE ORGID = ?";
			Entity entity = dbSession.queryOne(querySqlOne, orgId);
			String orgseq = entity.getStr("ORGSEQ");
			String secOrgseq = StrUtil.sub(orgseq, 0, StrUtil.ordinalIndexOf(orgseq, ".", 3) + 1);
			String param = secOrgseq + "%";
			String querySqlTwo = "SELECT ORGID FROM OM_ORGANIZATION WHERE ORGSEQ LIKE ?";
			List<Entity> entitys = dbSession.query(querySqlTwo, param);
			List<Integer> orgIdList = new ArrayList<Integer>();
			for (Entity org : entitys) {
				orgIdList.add(org.getInt("ORGID"));
			}
			String orgStrs = StrUtil.join(",", orgIdList);
			return orgStrs;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

	@Bizlet("根据提供大组织ID获取所属部门Judge类型及判断是否为中核(上海)供应链")
	public String getOrgJudgeNew(int orgId) {
		try {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			String querySqlOne = "SELECT ORGSEQ, JUDGE FROM OM_ORGANIZATION WHERE ORGID = ?";
			Entity entity = dbSession.queryOne(querySqlOne, orgId);
			String orgseq = entity.getStr("ORGSEQ");
			String judge = entity.getStr("JUDGE");
			String querySqlTwo = "SELECT DICTNAME FROM EOS_DICT_ENTRY WHERE DICTTYPEID='ZH_SHGYL_ORG' AND DICTID='SEC_ORG_ID'";
			Entity dictEntity = dbSession.queryOne(querySqlTwo);
			String dictName = "." + dictEntity.getStr("DICTNAME") + ".";
			if (StrUtil.contains(orgseq, dictName) || StrUtil.contains(orgseq, ".1111.")) {
				// 中核上海供应链
				return "3";
			} else {
				if (StrUtil.equals("1", judge)) {
					// 总部
					return "1";
				}
				if (StrUtil.equals("2", judge)) {
					// 分公司
					return "2";
				}
			}
			return null;
		} catch (Exception e) {
			return null;
		}
	}

}
