package com.primeton.ame.schindler;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.StringReader;
import java.rmi.RemoteException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.eos.foundation.database.DatabaseUtil;
import com.ibm.icu.math.BigDecimal;
import com.ibm.icu.text.SimpleDateFormat;

import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.dom4j.Document;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.xml.sax.InputSource;

import com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.SysSynchroGetOrgBaseInfoContext;
import com.primeton.ame.schindler.org.AaOrgtest;
import com.primeton.ame.schindler.org.impl.AaOrgtestImpl;
import com.primeton.eos.ame_common.SSLHttpUtils;


public class Test {
	public static void main(String[] args) throws RemoteException, ExceptionException0 {
//		String url = "https://172.17.133.134/sys/webservice/sysSynchroGetOrgWebService?wsdl";
//		String oauser = "jingying";
//		String oapassword = "92edb6981700ba6521a99f5bdeaec38e";
//		String s ="";
//		SysSynchroGetOrgBaseInfoContext context = new SysSynchroGetOrgBaseInfoContext();
//		context.setReturnOrgType("[{\"type\":\"group\"}]");
//		context.setReturnType("[{\"type\":\"no\"},{\"type\":\"keyword\"},{\"type\":\"order\"}]");
//		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
//        		+ "  <soapenv:Header>\n"
//        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
//        		+ " <tns:user>"+oauser+"</tns:user>\n"
//        		+ " <tns:password>"+oapassword+"</tns:password>\n"
//        		+ " </tns:RequestSOAPHeader>\n"
//        		+ "</soapenv:Header>\n"
//        		+ "   <soapenv:Body>\n"
//        		+ "      <web:getElementsBaseInfo>\n"
//        		+ "         <arg0>\n"
//        		+ "            <returnOrgType>"+context.getReturnOrgType()+"</returnOrgType>\n"
//        		+ "            <returnType>"+context.getReturnType()+"</returnType>\n"
//        		+ "         </arg0>\n"
//        		+ "      </web:getElementsBaseInfo>\n"
//        		+ "   </soapenv:Body>\n"
//        		+ "</soapenv:Envelope>";	
//		//web服务
//		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
//		SAXReader saxReader = new SAXReader();
//		Document doc;
//		try {
//			doc = saxReader.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
//			Element rootElement = doc.getRootElement();
//			Element bodyElement = rootElement.element("Body");
//			Element paramElement = null;
//			if (bodyElement != null) {
//				paramElement = bodyElement.element("getElementsBaseInfoResponse");
//			} else {
//				paramElement = (Element) rootElement.clone();
//			}
//			Element itemElement = paramElement.element("return");
//			String countString = itemElement.elementText("count");
//			String messgeString = itemElement.elementText("message");
//			String returnState = itemElement.elementText("returnState");
//			JSONArray array = JSONArray.parseArray(messgeString);
//			for (int i = 0; i < array.size(); i++) {
//				JSONObject jo = array.getJSONObject(i);
//				System.out.println(jo);
//				String id = jo.getString("id");
//				System.out.println(id);
//			}
//			System.out.println("结束!查询到的数量为：" + countString);
//		} catch (IOException e1) {
//			// TODO 自动生成的 catch 块
//			e1.printStackTrace();
//		} catch (DocumentException e) {
//			// TODO 自动生成的 catch 块
//			e.printStackTrace();
//		}catch (JSONException e) {
//			// TODO 自动生成的 catch 块
//			e.printStackTrace();
//		}
		QuerySysSynchroGetOrg qSynchroGetOrg = new QuerySysSynchroGetOrg();
//		qSynchroGetOrg.queryAllOrg();
//		qSynchroGetOrg.queryAllDept();
//		qSynchroGetOrg.queryAllGroup();
//		qSynchroGetOrg.queryAllPost();
//		qSynchroGetOrg.queryAllPerson();
//		qSynchroGetOrg.queryUpdatePerson();
//		qSynchroGetOrg.queryUpdateOrg();
//		qSynchroGetOrg.queryUpdateDept();
//		qSynchroGetOrg.queryUpdateGroup();
//		String regex = "x(\\w+)x";
		String text = "x167d9f130c1fed3a74f152e47bda844ax1680e496f665183dc1d3bbe481ea0a2ex1690dd57ecf56fa1280b2634f599eb9cx";
//		Pattern pattern = Pattern.compile(regex);
//		Matcher matcher = pattern.matcher(text);
//		List<String> list = new ArrayList<String>();
//		while (matcher.find()) {
//            String group = matcher.group(1); // 如果用matcher.group(1)表示截取第一个括号中间的内容，结果不会包括#
////            group = group.replaceAll("\"", "");
//            list.add(group);
//            System.out.println(group);
//        }
//		System.out.println(list);
//		System.out.println(list.size());
//		System.out.println(list.get(0));
//		int index = text.indexOf("x");
//		System.out.println(index);
//		index=text.indexOf("x", 1);
//		System.out.println(index);
//		String result=text.substring(index);
//		 System.out.println(result);
		String str = "x167d9f130c1fed3a74f152e47bda844ax1680e496f665183dc1d3bbe481ea0a2ex1690dd57ecf56fa1280b2634f599eb9cx";
//		String str1=str.substring(0, str.indexOf("x"));
//		String str2=str.substring(str1.length()+1, str.length());
//		System.out.println(str2);
//		String str3=str2.substring(0, str2.indexOf("x"));
//		System.out.println(str3);
		
		//167d9f130c1fed3a74f152e47bda844a
		
//		int num = getFindNumber(str, "x");
//		System.out.println(num);
//		for (int i = 0; i < num-1; i++) {
//			String str1=str.substring(0, str.indexOf("x"));
//			String str2=str.substring(str1.length()+1, str.length());
//			String str3=str2.substring(0, str2.indexOf("x"));
//			str = str2;
//			System.out.println(str3);
//		}
		
		
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		Date date = new Date();
//		System.out.println(date);
//		String timeString = simpleDateFormat.format(date);
//		System.out.println(timeString);
		DecimalFormat dFormat = new DecimalFormat("0.00");
//		String num = "1333.554395";
//		
//		
//		Boolean boolean1 = isNumber(num);
//		System.out.println(boolean1);
//		if (boolean1 == true) {
//			double d = Double.parseDouble(num);
//			
//			String a = dFormat.format(d);
//			System.out.println(a);
//		}
		String valueStr = "9000.0233242340";
		String valueStr1 = "8000.03420";
		double c = Double.parseDouble(valueStr);
		double d = Double.parseDouble(valueStr1);
		String yu = dFormat.format( c - d);
		System.out.println(yu);
		
	}
	public static boolean isNumber(String str) {
		Pattern pattern = Pattern.compile("^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){0,20})?$");
		return pattern.matcher(str).matches();
	}
	
	public static int getFindNumber(String str,String findStr){
		int index = 0;
		int has = 0;
		while ((index = str.indexOf(findStr, index)) != -1) {
			has++;
			index++;
		}
		return has;
	}
	
	
}
