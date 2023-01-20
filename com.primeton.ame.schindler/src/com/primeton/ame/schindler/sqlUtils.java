package com.primeton.ame.schindler;

import java.util.HashMap;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.system.annotation.Bizlet;
import com.primeton.fc.bfms.studio.data.reverse.db.EntityName;

import commonj.sdo.DataObject;

/**
 * 命名SQL操作公共类
 */
@Bizlet("")
public class sqlUtils {
	/**
	 * 根据指定sql查询实体
	 * @param sqlName	sql全名
	 * @param parameter	sql参数
	 * @return			实体集合
	 */
	@Bizlet("")
	public static DataObject[] queryEntities(String sqlName,HashMap<String,Object> parameter){
		Object[] objects = DatabaseExt.queryByNamedSql("default",sqlName,parameter);
		return DataObjectUtil.convertDataObjects(objects,"commonj.sdo.DataObject",true);
	}
	
	/**
	 * 执行sql，用于删除或者更新操作
	 * @param sqlName	sql全名
	 * @param parameter	sql参数
	 */
	@Bizlet("")
	public static void executeSql(String sqlName,HashMap<String,Object> parameter){
		DatabaseExt.executeNamedSql("default",sqlName,parameter);
	}
}
