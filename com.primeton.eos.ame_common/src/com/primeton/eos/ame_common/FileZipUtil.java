package com.primeton.eos.ame_common;

import java.io.File;
import java.util.List;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.io.file.FileNameUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.ZipUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.system.annotation.Bizlet;

/**
 * @author 王维
 * @date 2024-05-15 17:51:42
 *
 */
@Bizlet("文件压缩工具类")
public class FileZipUtil {

	@Bizlet("文件压缩")
	public String fileZip(String relationId, String fileCatalog) throws Exception {
		String fileZipPath = BusinessDictUtil.getDictName("AME_SYSCONF", "FILE_ZIP_PATH");
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		String queryFileSql = "SELECT FILE_NAME, FILE_PATH FROM AT_FILEUPLOAD WHERE RELATION_ID = ? AND FILE_CATALOG = ?";
		List<Entity> entityList = dbSession.query(queryFileSql, relationId, fileCatalog);
		if (entityList != null && entityList.size() > 0) {
			String destDir = DateUtil.format(DateTime.now(), "yyyyMMddHHmmssSSS");
			for (Entity entity : entityList) {
				String fileName = entity.getStr("FILE_NAME");
				String filePath = entity.getStr("FILE_PATH");
				String suffix = FileNameUtil.getSuffix(filePath);
				String destPath = StrUtil.format("{}/{}/{}.{}", fileZipPath, destDir, fileName, suffix);
				FileUtil.copy(filePath, destPath, true);
			}
			File zipFile = ZipUtil.zip(StrUtil.format("{}/{}", fileZipPath, destDir));
			return FileUtil.getAbsolutePath(zipFile);
		}
		return null;
	}

}
