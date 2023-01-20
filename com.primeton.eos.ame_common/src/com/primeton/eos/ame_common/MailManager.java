package com.primeton.eos.ame_common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang.StringUtils;

import com.eos.system.annotation.Bizlet;
import com.eos.system.exception.EOSRuntimeException;
import commonj.sdo.DataObject;

/**
 * 
 * @author JYW
 *
 */
@Bizlet("创建邮件模板")
public class MailManager {
	@Bizlet("创建邮件模板实例")
	public static DataObject createMailInstance(DataObject mailInfo,Map<String, String> paramEntity)throws Exception {
		if(paramEntity==null){
			//因为邮件模板Id是必须要传
			throw new EOSRuntimeException("邮件模板参数不能为空！");
		}
		
		String mailtype = paramEntity.get("mailtype");
		if (StringUtils.isEmpty(mailtype)){
			throw new EOSRuntimeException("邮件模板类型不能为空！");
		}
		
		//查询邮件模板
		DataObject mailTemplate = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_common.mailtemplate", "MailTemplate");
		mailTemplate.set("mailtype", mailtype);
		//只查询默认模板为是的
		mailTemplate.set("defaultflag", "1");
		com.eos.foundation.database.DatabaseUtil.expandEntityByTemplate("default", mailTemplate,mailTemplate);
		String mailtitle = mailTemplate.getString("mailtitle");//邮件主题
		String tid = mailTemplate.getBigDecimal("templateid").toString();
		mailInfo.set("templateid", tid);
		//从文件上传表中获取邮件模板正文
		DataObject mailContent = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.tools", "AtFileupload");
		mailContent.set("relationId", tid);
		mailContent.set("groupId", "mailContent");
		com.eos.foundation.database.DatabaseUtil.expandEntityByTemplate("default", mailContent, mailContent);
		String content = mailContent.getString("content");
		String regx = "@#.*?#@";
		Pattern p = Pattern.compile(regx);
		Matcher m = p.matcher(content);
		String param_value = "";
		while (m.find()) {
			String temp_str = m.group();
			//截取与XPTH中对应的变量名称
			String temp_str_xpath = temp_str.substring(2,temp_str.length()- 2);
			param_value  =  String.valueOf(paramEntity.get(temp_str_xpath));
			if(param_value == "null"){
				param_value = "";
			}else{
				//将$，\\，特殊字符转义
				param_value = Matcher.quoteReplacement(param_value);
			}
			content = content.replaceAll(temp_str, param_value);
		}
		
		Matcher m_title = p.matcher(mailtitle);
		while (m_title.find()) {
			String temp_str = m_title.group();
			String temp_str_xpath = temp_str.substring(2, temp_str.length()-2);
			if (paramEntity != null){
				param_value =   String.valueOf(paramEntity.get(temp_str_xpath));
			}
			if (param_value == "null"){
				param_value = "";
			}else{
				param_value = Matcher.quoteReplacement(param_value);
			}
			mailtitle = mailtitle.replaceAll(temp_str,param_value);
		}
		mailInfo.set("messageFormat", "HTML");
		mailInfo.set("subject", mailtitle);
		mailInfo.set("message", content);
		List<String> filePaths = getUploadFilePath(tid);
		if(CollectionUtils.isNotEmpty(filePaths)){
			//附件路径
			mailInfo.setList("attachFilePaths", filePaths);
		}
		return mailInfo;
	}
	/**
	 * 根据relationId获取文件路径
	 * @param fileID
	 * @return
	 */
	public static List<String> getUploadFilePath(String relationId) {
		List<String> filePaths = new ArrayList<String>();
		//从文件上传表中获取邮件模板附件
		DataObject mailAtfile = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.tools", "AtFileupload");
		mailAtfile.set("relationId", relationId);
		mailAtfile.set("groupId", "mailAttach");
		DataObject[] mailAtfiles= com.eos.foundation.database.DatabaseUtil.queryEntitiesByTemplate("default", mailAtfile);
		if(mailAtfiles!=null&&mailAtfiles.length>0){
			for(int i=0;i<mailAtfiles.length;i++){
				filePaths.add(mailAtfiles[i].getString("filePath"));
			}	
		}
		return filePaths;
	}
}
