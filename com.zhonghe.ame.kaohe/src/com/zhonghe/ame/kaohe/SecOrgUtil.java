package com.zhonghe.ame.kaohe;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import cn.hutool.core.util.StrUtil;
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

	@Bizlet("获取职能部门")
	public List<Map<String, String>> getZnSecOrgList() throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String queryOrgSql = "SELECT ORGCODE, ORGNAME FROM OM_ORGANIZATION WHERE (ORGLEVEL='2' AND STATUS='running' AND ORGSEQ LIKE '.1.%') OR (ORGSEQ='.1111.')";
		String queryDictSql = "SELECT DICTID, DICTNAME FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'ORG_CLASS_FUNCTIONAL_DEP'";
		List<Entity> orgEntityList = dbSession.query(queryOrgSql);
		List<Entity> dictEntityList = dbSession.query(queryDictSql);

		// 提取 DICTID 到 Set
		Set<String> dictIds = dictEntityList.stream().map(dictEntity -> dictEntity.getStr("DICTID")).collect(Collectors.toSet());

		// 过滤 orgEntityList
		List<Entity> filteredList = orgEntityList.stream().filter(orgEntity -> dictIds.contains(orgEntity.getStr("ORGCODE"))).collect(Collectors.toList());

		List<Map<String, String>> result = filteredList.stream().map(orgEntity -> {
			Map<String, String> map = new HashMap<>();
			map.put("secOrg", orgEntity.getStr("ORGCODE"));
			map.put("secOrgname", orgEntity.getStr("ORGNAME"));
			return map;
		}).collect(Collectors.toList());

		return result;

	}

	@Bizlet("通过快照表获取需要考核的单位并排序显示")
	public List<Entity> getKaoHeSecOrg(String year, String month) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		Map<String, Integer> secOrderMap = this.getSecOrgOrderMap(dbSession);
		String querySql = "SELECT zkss.secondary_org, oo.ORGNAME AS secondary_orgname FROM zh_kaohe_statistics_snapshot AS zkss, OM_ORGANIZATION AS oo WHERE zkss.secondary_org = oo.ORGID AND zkss.years = ? AND zkss.months = ?";
		List<Entity> secOrgList = dbSession.query(querySql, year, month);
		secOrgList = secOrgList.stream().filter(entity -> !StrUtil.equals(entity.getStr("secondary_org"), "8") && !StrUtil.equals(entity.getStr("secondary_org"), "102123"))
				.collect(Collectors.toList());
		secOrgList.sort(Comparator.comparing(entity -> secOrderMap.getOrDefault(entity.getStr("secondary_org"), 100)));
		return secOrgList;
	}

	private Map<String, Integer> getSecOrgOrderMap(Session dbSession) throws Exception {
		Map<String, Integer> map = new HashMap<String, Integer>();
		String queryDictSql = "SELECT DICTID, SORTNO FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'ZH_OPERATION_INCOME_ORG'";
		List<Entity> dictList = dbSession.query(queryDictSql);
		for (Entity dict : dictList) {
			map.put(dict.getStr("DICTID"), dict.getInt("SORTNO"));
		}
		return map;
	}

}
