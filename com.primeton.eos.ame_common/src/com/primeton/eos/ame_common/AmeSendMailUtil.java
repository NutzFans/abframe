package com.primeton.eos.ame_common;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;

import com.eos.system.utility.StringUtil;

import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.SimpleEmail;

import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

import javax.mail.internet.MimeUtility;

public class AmeSendMailUtil {
	
	@Bizlet("发送邮件")
	public static void sendMail(DataObject mailInfo) throws EmailException{
		Email email = null;
		//格式
		String messageFormat = mailInfo.getString("messageFormat");
		if (messageFormat == null){
		    messageFormat = "";
		}else {
		    messageFormat = messageFormat.toLowerCase().trim();
		}
		
		try{
			List inclineFilePaths = mailInfo.getList("inclineFilePaths");
			//附件路径
		    List attachFilePaths = mailInfo.getList("attachFilePaths");
		    
		    String message = mailInfo.getString("message");
			 //采用html
		    if(messageFormat.indexOf("htm")>-1){
		  		email = new HtmlEmail();
		  		((HtmlEmail)email).setHtmlMsg(message);
		  	}else{
		  		email = new SimpleEmail();
		  	}
		    if((inclineFilePaths!=null && inclineFilePaths.size()>0)||(attachFilePaths!=null && attachFilePaths.size()>0)){
		  		//附件或者有图片
		  		email = new HtmlEmail();
		  		((HtmlEmail)email).setHtmlMsg(message);
		  		if(inclineFilePaths!=null && inclineFilePaths.size()>0){
		  			Iterator iterator;
		  			for (iterator = inclineFilePaths.iterator(); iterator.hasNext(); ) { 
		  				Object incline = iterator.next();
		  	          ((HtmlEmail)email).embed(new File((String)incline));
		  	        }
		  		}
		  		//添加附件
		  		if(attachFilePaths!=null && attachFilePaths.size()>0){
		  			Iterator iterator;
		  			for (iterator = attachFilePaths.iterator(); iterator.hasNext(); ) { 
		  				Object attache = iterator.next();
		  				
		  				EmailAttachment att = new EmailAttachment();
		  				//取到附件名称。
		  				String fileName = attache.toString().substring(attache.toString().lastIndexOf("\\")+1,attache.toString().length());
		  				//附件名称中文乱码处理。
	  					att.setName(MimeUtility.encodeText(fileName,"utf-8",null));
		  				att.setPath((String)attache);
		  				((HtmlEmail)email).attach(att);
		  	      }
		  		}
		  	}
		    
		    String host = mailInfo.getString("smtpHost");
			if(StringUtil.isNotNullAndBlank(host)){
				email.setHostName(host);
		    }else{
		    	//设置默认值
		    	email.setHostName("smtp.primeton.com");
		    }
			//验证邮箱
			String userName = mailInfo.getString("userName");
			String password = mailInfo.getString("password");
			if(StringUtil.isNotNullAndBlank(userName) && StringUtil.isNotNullAndBlank(password)){
				email.setAuthentication(userName, password);
		    }
		    //发件人
			String from = mailInfo.getString("from");
			if(StringUtil.isNotNullAndBlank(userName)){
				email.setFrom(from);
			}
			//收件人列表
			List toList = mailInfo.getList("to");
			if(toList!=null &&toList.size()>0){
				 Iterator iterator;
				 for (iterator = toList.iterator(); iterator.hasNext(); ) { 
				    	Object e = iterator.next();
				        email.addTo((String)e);
				 }
			}
			//添加回复人
			List replyToList = mailInfo.getList("replyTo");
			if(replyToList!=null && replyToList.size()>0){
				 Iterator iterator;
				 for (iterator = replyToList.iterator(); iterator.hasNext(); ) { 
				    	Object e = iterator.next();
				    	email.addReplyTo((String)e);
				 }
			}
			
			//字体格式
			String charSet = mailInfo.getString("charset");
			if(StringUtil.isNotNullAndBlank(charSet)){
				email.setCharset(charSet);
			}else{
				email.setCharset("UTF-8");
			}
			
			//主题
			String subject = mailInfo.getString("subject");
			if(StringUtil.isNotNullAndBlank(subject)){
				email.setSubject(subject);
			}
			
			//添加抄送人
			List ccList = mailInfo.getList("cc");
			 
			if ((ccList != null) && (ccList.size() > 0)) {
				 Iterator cc_item;
			      for (cc_item = ccList.iterator(); cc_item.hasNext(); ) { 
			    	  Object e = cc_item.next();
			        email.addCc((String)e);
			      }
			 }
			
			//密送人
			 List bccList = mailInfo.getList("bcc");
			 if ((bccList != null) && (bccList.size() > 0)) {
				 Iterator bbc_item;
			      for (bbc_item = bccList.iterator(); bbc_item.hasNext(); ) { 
			    	  Object e = bbc_item.next();
			          email.addBcc((String)e);
			      }
			 }
			 //发送邮件
			 email.send();
		} catch (UnsupportedEncodingException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

}
