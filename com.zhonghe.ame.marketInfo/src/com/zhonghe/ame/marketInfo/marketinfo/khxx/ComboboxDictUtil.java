package com.zhonghe.ame.marketInfo.marketinfo.khxx;

import java.util.List;

import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("字典查询工具类")
public class ComboboxDictUtil {

	@Bizlet("根据字典类型或父级查询")
	public List<Entity> getDictData(String dictType, String parentId) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String querySql = "SELECT DICTID, DICTNAME, PARENTID FROM EOS_DICT_ENTRY WHERE DICTTYPEID = ? ORDER BY SORTNO ASC";
		String queryByParentIdSql = "SELECT DICTID, DICTNAME, PARENTID FROM EOS_DICT_ENTRY WHERE DICTTYPEID = ? AND PARENTID = ? ORDER BY SORTNO ASC";
		if (StrUtil.isNotBlank(parentId)) {
			return dbSession.query(queryByParentIdSql, dictType, parentId);
		} else {
			return dbSession.query(querySql, dictType);
		}
	}
}
