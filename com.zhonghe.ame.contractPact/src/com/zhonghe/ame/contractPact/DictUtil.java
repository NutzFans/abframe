package com.zhonghe.ame.contractPact;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.system.annotation.Bizlet;

@Bizlet("字典相关工具类")
public class DictUtil {

	@Bizlet("判断指定到字典项是否存在")
	public String isThereADictionaryEntry(String dictTypeId, String dictId) {
		try {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			String queryDictSql = "SELECT * FROM EOS_DICT_ENTRY WHERE DICTTYPEID = ? AND DICTID = ?";
			Entity dictEntity = dbSession.queryOne(queryDictSql, dictTypeId, dictId);
			if (ObjectUtil.isNotNull(dictEntity)) {
				return "1";
			} else {
				return "0";
			}
		} catch (Exception e) {
			return "0";
		}
	}

}
