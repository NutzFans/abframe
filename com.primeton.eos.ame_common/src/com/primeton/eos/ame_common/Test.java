	package com.primeton.eos.ame_common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;

public class Test {

	public static void main(String[] args) {
		String amepath = "http://jy.cncc.top:8080/default/";
		String userid = "0199";
		
						//http://jy.cncc.top:8080/sys/webservice/sysNotifyTodoWebService
		 String url = "https://172.17.133.134:443/sys/webservice/sysNotifyTodoWebService";
		  String oauser = "jingying";
		  String oapassword = "92edb6981700ba6521a99f5bdeaec38e";
		  String workitemid = "227594"; 
		  String processname = "高君舒发起采购验流程 :CNCC-CGYS-2022-BZB-552";
		  String linkurl = amepath+"common/oaLogin.jsp?userId="+userid+"&amp;state=2&amp;workitemid="+workitemid;
		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		  String createtime = sdf.format(new Date());
		String s ="";
         s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
        		+ "  <soapenv:Header>\n"
        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
        		+ " <tns:user>"+oauser+"</tns:user>\n"
        		+ " <tns:password>"+oapassword+"</tns:password>\n"
        		+ " </tns:RequestSOAPHeader>\n"
        		+ "</soapenv:Header>\n"
        		+ "   <soapenv:Body>\n"
        		+ "      <web:sendTodo>\n"
        		+ "         <arg0>\n"
        		+ "            <appName>企业经营管理系统</appName>\n"
        		+ "            <createTime>"+createtime+"</createTime>\n"
        		+ "            <link>"+linkurl+"</link>\n"
        		+ "            <modelId>"+workitemid+"</modelId>\n"
        		+ "            <modelName>企业经营管理系统</modelName>\n"
        		+ "            <subject>"+processname+"</subject>\n"
        		+ "            <targets>{\"LoginName\":\""+userid+"\"}</targets>\n"
        		+ "            <type>1</type>\n"
        		+ "         </arg0>\n"
        		+ "      </web:sendTodo>\n"
        		+ "   </soapenv:Body>\n"
        		+ "</soapenv:Envelope>";		
		
      //  httpclient.getConnectionManager().shutdown();
		
		
		
		
		// TODO 自动生成的方法存根
		
			/*String s = "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
					+ "<soap:Body>"
					+ "<ns1:deleteTodoResponse xmlns:ns1=\"http://webservice.notify.sys.kmss.landray.com/\">"
					+ "<return>"
					+ "<returnState>2</returnState>"
					+ "</return>"
					+ "</ns1:deleteTodoResponse>"
					+ "</soap:Body>"
					+ "</soap:Envelope>";
			
			 Document document=DocumentHelper.parseText(s);
			 Element root = document.getRootElement();
			 List<Element> bodys = root.elements();
			 List<Element> deleteTodoResponse = bodys.get(0).elements();
			 List<Element> retun = deleteTodoResponse.get(0).elements();
			 List<Element> returnState = retun.get(0).elements("returnState");
			 String state = returnState.get(0).getTextTrim();
			 System.out.println(state);*/
			 //取消OA门户待办（生产）
			
//			  String s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\r\n"
//			    + "   <soapenv:Header>\r\n"
//			    + "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\r\n"
//			    + " <tns:user>"+oauser+"</tns:user>\r\n"
//			    + " <tns:password>"+oapassword+"</tns:password>\r\n"
//			    + " </tns:RequestSOAPHeader>\r\n"
//			    + " </soapenv:Header>\r\n"
//			    + "   <soapenv:Body>\r\n"
//			    + "      <web:deleteTodo>\r\n"
//			    + "         <arg0>\r\n"
//			    + "            <appName>企业经营管理系统</appName>\r\n"
//			    + "            <modelId>"+workitemid+"</modelId>\r\n"
//			    + "            <modelName>企业经营管理系统</modelName>\r\n"
//			    + "            <optType>1</optType>\r\n"
//			    
//			    + "            <type>1</type>\r\n"
//			    + "         </arg0>\r\n"
//			    + "      </web:deleteTodo>\r\n"
//			    + "   </soapenv:Body>\r\n"
//			    + "</soapenv:Envelope>"; 
			  
			  String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
			  System.out.println("======"+str);
	}
	
}
