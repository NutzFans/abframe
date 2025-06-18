package com.zhonghe.ame.kaohe;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("二级组织工具类")
public class SecOrgUtil {

	@Bizlet("获取中心/事业部/分公司/子公司集合")
	public List<Map<String, String>> getBusSecOrgList() throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String queryOrgSql = "SELECT ORGCODE, ORGNAME FROM OM_ORGANIZATION WHERE (ORGLEVEL='2' AND STATUS='running' AND ORGSEQ LIKE '.1.%') OR (ORGSEQ='.1111.')";
		String queryDictSql = "SELECT DICTID, DICTNAME FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'ZH_NOT_SEC_ORG'";
		List<Entity> orgEntityList = dbSession.query(queryOrgSql);
		List<Entity> dictEntityList = dbSession.query(queryDictSql);

		// 提取 DICTID 到 Set
		Set<String> dictIds = dictEntityList.stream().map(dictEntity -> dictEntity.getStr("DICTID")).collect(Collectors.toSet());

		// 过滤 orgEntityList
		List<Entity> filteredList = orgEntityList.stream().filter(orgEntity -> !dictIds.contains(orgEntity.getStr("ORGCODE"))).collect(Collectors.toList());

		List<Map<String, String>> result = filteredList.stream().map(orgEntity -> {
			Map<String, String> map = new HashMap<>();
			map.put("secOrg", orgEntity.getStr("ORGCODE"));
			map.put("secOrgname", orgEntity.getStr("ORGNAME"));
			return map;
		}).collect(Collectors.toList());

		return result;
	}

}
