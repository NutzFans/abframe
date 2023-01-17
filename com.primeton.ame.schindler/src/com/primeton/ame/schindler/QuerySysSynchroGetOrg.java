package com.primeton.ame.schindler;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.ibm.icu.math.BigDecimal;
import com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.SysSynchroGetOrgBaseInfoContext;
import com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.SysSynchroGetOrgInfoContext;
import com.primeton.ame.schindler.org.AaGrouptest;
import com.primeton.ame.schindler.org.AaOrgtest;
import com.primeton.ame.schindler.org.AaPersontest;
import com.primeton.ame.schindler.org.AaPosttest;
import com.primeton.ame.schindler.org.AcOperator;
import com.primeton.ame.schindler.org.AcOperatorCopy1;
import com.primeton.ame.schindler.org.OmEmployee;
import com.primeton.ame.schindler.org.OmEmployeeCopyCopy1;
import com.primeton.ame.schindler.org.OmEmporg;
import com.primeton.ame.schindler.org.OmEmporgCopy1;
import com.primeton.ame.schindler.org.OmOrganization;
import com.primeton.ame.schindler.org.OmOrganizationCopy1;
import com.primeton.ame.schindler.org.ZhGroup;
import com.primeton.ame.schindler.org.ZhPost;
import com.primeton.ame.schindler.org.impl.AaGrouptestImpl;
import com.primeton.ame.schindler.org.impl.AaOrgtestImpl;
import com.primeton.ame.schindler.org.impl.AaPersontestImpl;
import com.primeton.ame.schindler.org.impl.AaPosttestImpl;
import com.primeton.ame.schindler.org.impl.AcOperatorCopy1Impl;
import com.primeton.ame.schindler.org.impl.AcOperatorImpl;
import com.primeton.ame.schindler.org.impl.OmEmployeeCopyCopy1Impl;
import com.primeton.ame.schindler.org.impl.OmEmployeeImpl;
import com.primeton.ame.schindler.org.impl.OmEmporgCopy1Impl;
import com.primeton.ame.schindler.org.impl.OmEmporgImpl;
import com.primeton.ame.schindler.org.impl.OmOrganizationCopy1Impl;
import com.primeton.ame.schindler.org.impl.OmOrganizationImpl;
import com.primeton.ame.schindler.org.impl.ZhGroupImpl;
import com.primeton.ame.schindler.org.impl.ZhPostImpl;
import com.primeton.das.entity.impl.hibernate.mapping.Map;
import com.primeton.eos.ame_common.SSLHttpUtils;
import com.raq.expression.operator.And;

import commonj.sdo.DataObject;
import commonj.sdo.helper.DataFactory;

public class QuerySysSynchroGetOrg {
	private final static String url = "https://172.17.133.134/sys/webservice/sysSynchroGetOrgWebService?wsdl";
	private final static String oauser = "jingying";
	private final static String oapassword = "92edb6981700ba6521a99f5bdeaec38e";
	private static String s ="";
	
	/**
	 * 获取dept(部门)信息
	 */
	public static void queryAllDept(){
		SysSynchroGetOrgBaseInfoContext context = new SysSynchroGetOrgBaseInfoContext();
		context.setReturnOrgType("[{\"type\":\"dept\"}]");
		context.setReturnType("[{\"type\":\"no\"},{\"type\":\"keyword\"},{\"type\":\"order\"}]");
		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
        		+ "  <soapenv:Header>\n"
        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
        		+ " <tns:user>"+oauser+"</tns:user>\n"
        		+ " <tns:password>"+oapassword+"</tns:password>\n"
        		+ " </tns:RequestSOAPHeader>\n"
        		+ "</soapenv:Header>\n"
        		+ "   <soapenv:Body>\n"
        		+ "      <web:getElementsBaseInfo>\n"
        		+ "         <arg0>\n"
        		+ "            <returnOrgType>"+context.getReturnOrgType()+"</returnOrgType>\n"
        		+ "            <returnType>"+context.getReturnType()+"</returnType>\n"
        		+ "         </arg0>\n"
        		+ "      </web:getElementsBaseInfo>\n"
        		+ "   </soapenv:Body>\n"
        		+ "</soapenv:Envelope>";	
		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Element rootElement = doc.getRootElement();
			Element bodyElement = rootElement.element("Body");
			Element paramElement = null;
			if (bodyElement != null) {
				paramElement = bodyElement.element("getElementsBaseInfoResponse");
			} else {
				paramElement = (Element) rootElement.clone();
			}
			Element itemElement = paramElement.element("return");
			String countString = itemElement.elementText("count");
			String messgeString = itemElement.elementText("message");
			String returnState = itemElement.elementText("returnState");
			JSONArray array = JSONArray.parseArray(messgeString);
			for (int i = 0; i < array.size(); i++) {
				JSONObject jo = array.getJSONObject(i);
				String id = jo.getString("id");
			}
			System.out.println("结束!查询到的dept数量为：" + countString);
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取org(机构)信息
	 */
	public static void queryAllOrg(){
		SysSynchroGetOrgBaseInfoContext context = new SysSynchroGetOrgBaseInfoContext();
		context.setReturnOrgType("[{\"type\":\"org\"}]");
		context.setReturnType("[{\"type\":\"no\"},{\"type\":\"keyword\"},{\"type\":\"order\"}]");
		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
        		+ "  <soapenv:Header>\n"
        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
        		+ " <tns:user>"+oauser+"</tns:user>\n"
        		+ " <tns:password>"+oapassword+"</tns:password>\n"
        		+ " </tns:RequestSOAPHeader>\n"
        		+ "</soapenv:Header>\n"
        		+ "   <soapenv:Body>\n"
        		+ "      <web:getElementsBaseInfo>\n"
        		+ "         <arg0>\n"
        		+ "            <returnOrgType>"+context.getReturnOrgType()+"</returnOrgType>\n"
        		+ "            <returnType>"+context.getReturnType()+"</returnType>\n"
        		+ "         </arg0>\n"
        		+ "      </web:getElementsBaseInfo>\n"
        		+ "   </soapenv:Body>\n"
        		+ "</soapenv:Envelope>";	
		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Element rootElement = doc.getRootElement();
			Element bodyElement = rootElement.element("Body");
			Element paramElement = null;
			if (bodyElement != null) {
				paramElement = bodyElement.element("getElementsBaseInfoResponse");
			} else {
				paramElement = (Element) rootElement.clone();
			}
			Element itemElement = paramElement.element("return");
			String countString = itemElement.elementText("count");
			String messgeString = itemElement.elementText("message");
			String returnState = itemElement.elementText("returnState");
			JSONArray array = JSONArray.parseArray(messgeString);
			for (int i = 0; i < array.size(); i++) {
				JSONObject jo = array.getJSONObject(i);
				String id = jo.getString("id");
			}
			System.out.println("结束!查询到的org数量为：" + countString);
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 获取group(群组)信息
	 */
	public static void queryAllGroup(){
		SysSynchroGetOrgBaseInfoContext context = new SysSynchroGetOrgBaseInfoContext();
		context.setReturnOrgType("[{\"type\":\"group\"}]");
		context.setReturnType("[{\"type\":\"no\"},{\"type\":\"keyword\"},{\"type\":\"order\"}]");
		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
        		+ "  <soapenv:Header>\n"
        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
        		+ " <tns:user>"+oauser+"</tns:user>\n"
        		+ " <tns:password>"+oapassword+"</tns:password>\n"
        		+ " </tns:RequestSOAPHeader>\n"
        		+ "</soapenv:Header>\n"
        		+ "   <soapenv:Body>\n"
        		+ "      <web:getElementsBaseInfo>\n"
        		+ "         <arg0>\n"
        		+ "            <returnOrgType>"+context.getReturnOrgType()+"</returnOrgType>\n"
        		+ "            <returnType>"+context.getReturnType()+"</returnType>\n"
        		+ "         </arg0>\n"
        		+ "      </web:getElementsBaseInfo>\n"
        		+ "   </soapenv:Body>\n"
        		+ "</soapenv:Envelope>";	
		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Element rootElement = doc.getRootElement();
			Element bodyElement = rootElement.element("Body");
			Element paramElement = null;
			if (bodyElement != null) {
				paramElement = bodyElement.element("getElementsBaseInfoResponse");
			} else {
				paramElement = (Element) rootElement.clone();
			}
			Element itemElement = paramElement.element("return");
			String countString = itemElement.elementText("count");
			String messgeString = itemElement.elementText("message");
			String returnState = itemElement.elementText("returnState");
			JSONArray array = JSONArray.parseArray(messgeString);
			for (int i = 0; i < array.size(); i++) {
				JSONObject jo = array.getJSONObject(i);
				String id = jo.getString("id");
			}
			System.out.println("结束!查询到的group数量为：" + countString);
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取post(岗位)信息
	 */
	public static void queryAllPost(){
		SysSynchroGetOrgBaseInfoContext context = new SysSynchroGetOrgBaseInfoContext();
		context.setReturnOrgType("[{\"type\":\"post\"}]");
		context.setReturnType("[{\"type\":\"no\"},{\"type\":\"keyword\"},{\"type\":\"order\"}]");
		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
        		+ "  <soapenv:Header>\n"
        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
        		+ " <tns:user>"+oauser+"</tns:user>\n"
        		+ " <tns:password>"+oapassword+"</tns:password>\n"
        		+ " </tns:RequestSOAPHeader>\n"
        		+ "</soapenv:Header>\n"
        		+ "   <soapenv:Body>\n"
        		+ "      <web:getElementsBaseInfo>\n"
        		+ "         <arg0>\n"
        		+ "            <returnOrgType>"+context.getReturnOrgType()+"</returnOrgType>\n"
        		+ "            <returnType>"+context.getReturnType()+"</returnType>\n"
        		+ "         </arg0>\n"
        		+ "      </web:getElementsBaseInfo>\n"
        		+ "   </soapenv:Body>\n"
        		+ "</soapenv:Envelope>";	
		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Element rootElement = doc.getRootElement();
			Element bodyElement = rootElement.element("Body");
			Element paramElement = null;
			if (bodyElement != null) {
				paramElement = bodyElement.element("getElementsBaseInfoResponse");
			} else {
				paramElement = (Element) rootElement.clone();
			}
			Element itemElement = paramElement.element("return");
			String countString = itemElement.elementText("count");
			String messgeString = itemElement.elementText("message");
			String returnState = itemElement.elementText("returnState");
			JSONArray array = JSONArray.parseArray(messgeString);
			for (int i = 0; i < array.size(); i++) {
				JSONObject jo = array.getJSONObject(i);
				String id = jo.getString("id");
			}
			System.out.println("结束!查询到的post数量为：" + countString);
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取person(人员)信息
	 */
	public static void queryAllPerson(){
		SysSynchroGetOrgBaseInfoContext context = new SysSynchroGetOrgBaseInfoContext();
		context.setReturnOrgType("[{\"type\":\"person\"}]");
		context.setReturnType("[{\"type\":\"no\"},{\"type\":\"keyword\"},{\"type\":\"order\"}]");
		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
        		+ "  <soapenv:Header>\n"
        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
        		+ " <tns:user>"+oauser+"</tns:user>\n"
        		+ " <tns:password>"+oapassword+"</tns:password>\n"
        		+ " </tns:RequestSOAPHeader>\n"
        		+ "</soapenv:Header>\n"
        		+ "   <soapenv:Body>\n"
        		+ "      <web:getElementsBaseInfo>\n"
        		+ "         <arg0>\n"
        		+ "            <returnOrgType>"+context.getReturnOrgType()+"</returnOrgType>\n"
        		+ "            <returnType>"+context.getReturnType()+"</returnType>\n"
        		+ "         </arg0>\n"
        		+ "      </web:getElementsBaseInfo>\n"
        		+ "   </soapenv:Body>\n"
        		+ "</soapenv:Envelope>";	
		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Element rootElement = doc.getRootElement();
			Element bodyElement = rootElement.element("Body");
			Element paramElement = null;
			if (bodyElement != null) {
				paramElement = bodyElement.element("getElementsBaseInfoResponse");
			} else {
				paramElement = (Element) rootElement.clone();
			}
			Element itemElement = paramElement.element("return");
			String countString = itemElement.elementText("count");
			String messgeString = itemElement.elementText("message");
			String returnState = itemElement.elementText("returnState");
			JSONArray array = JSONArray.parseArray(messgeString);
			for (int i = 0; i < array.size(); i++) {
				JSONObject jo = array.getJSONObject(i);
				String id = jo.getString("id");
			}
			System.out.println("结束!查询到的person数量为：" + countString);
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	/**
	 * person
	 */
	@Bizlet("Person")
	public static void queryUpdatePerson(){
		System.out.println("**************开始更新系统登录用户表信息**************");
		SysSynchroGetOrgInfoContext context = new SysSynchroGetOrgInfoContext();
		context.setReturnOrgType("[{\"type\":\"person\"}]");
		context.setCount(10000);
		context.setBeginTimeStamp("");
		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
        		+ "  <soapenv:Header>\n"
        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
        		+ " <tns:user>"+oauser+"</tns:user>\n"
        		+ " <tns:password>"+oapassword+"</tns:password>\n"
        		+ " </tns:RequestSOAPHeader>\n"
        		+ "</soapenv:Header>\n"
        		+ "   <soapenv:Body>\n"
        		+ "      <web:getUpdatedElements>\n"
        		+ "         <arg0>\n"
        		+ "            <returnOrgType>"+context.getReturnOrgType()+"</returnOrgType>\n"
        		+ "            <beginTimeStamp>"+context.getBeginTimeStamp()+"</beginTimeStamp>\n"
        		+ "            <count>"+context.getCount()+"</count>\n"
        		+ "         </arg0>\n"
        		+ "      </web:getUpdatedElements>\n"
        		+ "   </soapenv:Body>\n"
        		+ "</soapenv:Envelope>";	
		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Element rootElement = doc.getRootElement();
			Element bodyElement = rootElement.element("Body");
			Element paramElement = null;
			if (bodyElement != null) {
				paramElement = bodyElement.element("getUpdatedElementsResponse");
			} else {
				paramElement = (Element) rootElement.clone();
			}
			Element itemElement = paramElement.element("return");
			String countString = itemElement.elementText("count");
			String messgeString = itemElement.elementText("message");
			String returnState = itemElement.elementText("returnState");
			JSONArray array = JSONArray.parseArray(messgeString);
			List<AcOperator> listAdd = new ArrayList<AcOperator>();
			List<AcOperator> listUpdate = new ArrayList<AcOperator>();
 			for (int i = 0; i < array.size(); i++) {
				JSONObject jo = array.getJSONObject(i);
				if (jo.getString("no")== "" || jo.getString("no") == null) {
					continue;
				}
				AcOperator impl = new AcOperatorImpl();
				String id = jo.getString("lunid");
//				DataObject[] org = (DataObject[])DatabaseExt.queryByNamedSql("default", "com.primeton.ame.schindler.querySysSynchroGetOrg.queryPersonById", mapParam);
				DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
				criteria.set("_entity", "com.primeton.ame.schindler.org.AcOperator");
				criteria.set("_expr[1]/filePath", id);
				criteria.set("_expr[1]/_op", "=");
				DataObject[] org = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
				if (org.length == 0) {
					DatabaseExt.getPrimaryKey(impl);
 					impl.setUserid(jo.getString("no"));
 					impl.setPassword(jo.getString("password"));
 					impl.setOperatorname(jo.getString("name"));
 					impl.setAuthmode("ldap");
 					impl.setStatus("running");
 					impl.setUnlocktime(jo.getDate("alterTime"));
 					impl.setMenutype("default");
 					impl.setFilePath(jo.getString("lunid"));
 					impl.setEmail(jo.getString("email"));
 					listAdd.add(impl);
				}else {
					java.math.BigDecimal a =(java.math.BigDecimal) org[0].get("operatorid");
					impl.setOperatorid(a);
					impl.setUserid(jo.getString("no"));
 					impl.setPassword(jo.getString("password"));
 					impl.setOperatorname(jo.getString("name"));
 					impl.setAuthmode("ldap");
 					impl.setStatus("running");
 					impl.setUnlocktime(jo.getDate("alterTime"));
 					impl.setMenutype("default");
 					impl.setFilePath(jo.getString("lunid"));
 					impl.setEmail(jo.getString("email"));
 					listUpdate.add(impl);
				}
			}
 			AcOperator[] arrAdd = new AcOperator[listAdd.size()];
 			AcOperator[] arrUpdate = new AcOperator[listUpdate.size()];
 			if (arrAdd.length != 0) {
 				listAdd.toArray(arrAdd);
 				DatabaseUtil.insertEntityBatch("default", arrAdd);
			}
 			if (arrUpdate.length != 0) {
 				listUpdate.toArray(arrUpdate);
 				DatabaseUtil.updateEntityBatch("default", arrUpdate);
			}
 			System.out.println("**************完成更新系统登录用户表信息**************");
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	/**
	 * org
	 */
	@Bizlet("查询更改的组织org并同步更新组织机构表")
	public static void queryUpdateOrg(){
		System.out.println("**************开始更新组织机构表信息**************");
		SysSynchroGetOrgInfoContext context = new SysSynchroGetOrgInfoContext();
		context.setReturnOrgType("[{\"type\":\"org\"}]");
		context.setCount(10000);
		context.setBeginTimeStamp("");
		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
        		+ "  <soapenv:Header>\n"
        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
        		+ " <tns:user>"+oauser+"</tns:user>\n"
        		+ " <tns:password>"+oapassword+"</tns:password>\n"
        		+ " </tns:RequestSOAPHeader>\n"
        		+ "</soapenv:Header>\n"
        		+ "   <soapenv:Body>\n"
        		+ "      <web:getUpdatedElements>\n"
        		+ "         <arg0>\n"
        		+ "            <returnOrgType>"+context.getReturnOrgType()+"</returnOrgType>\n"
        		+ "            <beginTimeStamp>"+context.getBeginTimeStamp()+"</beginTimeStamp>\n"
        		+ "            <count>"+context.getCount()+"</count>\n"
        		+ "         </arg0>\n"
        		+ "      </web:getUpdatedElements>\n"
        		+ "   </soapenv:Body>\n"
        		+ "</soapenv:Envelope>";	
		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Element rootElement = doc.getRootElement();
			Element bodyElement = rootElement.element("Body");
			Element paramElement = null;
			if (bodyElement != null) {
				paramElement = bodyElement.element("getUpdatedElementsResponse");
			} else {
				paramElement = (Element) rootElement.clone();
			}
			Element itemElement = paramElement.element("return");
			String countString = itemElement.elementText("count");
			String messgeString = itemElement.elementText("message");
			String returnState = itemElement.elementText("returnState");
			JSONArray array = JSONArray.parseArray(messgeString);
//			HashMap<String,Object> mapParam = new HashMap<String,Object>();
			List<OmOrganization> listAdd = new ArrayList<OmOrganization>();
			List<OmOrganization> listUpdate = new ArrayList<OmOrganization>();
 			for (int i = 0; i < array.size(); i++) {
				JSONObject jo = array.getJSONObject(i);
				OmOrganization impl = new OmOrganizationImpl();
				String id = jo.getString("id");
				DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
				criteria.set("_entity", "com.primeton.ame.schindler.org.OmOrganization");
				criteria.set("_expr[1]/weburl", id);
				criteria.set("_expr[1]/_op", "=");
				DataObject[] org = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
 				if (org.length == 0) {
 					DatabaseExt.getPrimaryKey(impl);
 					impl.setOrgcode(impl.getString("orgid"));
 					impl.setOrgname(jo.getString("name"));
 					String hierarchyId = jo.getString("hierarchyId");
 					if (hierarchyId.equals("0")) {
 						java.math.BigDecimal bigDecimal = new java.math.BigDecimal(2);
						impl.setOrglevel(bigDecimal);
					}else {
						java.math.BigDecimal bigDecimal = new java.math.BigDecimal(getFindNumber(hierarchyId, "x") -1);
						impl.setOrglevel(bigDecimal);
					}
 					String parent = jo.getString("parent");
 					if (parent == null || parent == "") {
 						
					}else {
						criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
 						criteria.set("_entity", "com.primeton.ame.schindler.org.OmOrganization");
 						criteria.set("_expr[1]/weburl", parent);
 						criteria.set("_expr[1]/_op", "=");
 						org = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
 						if (org!=null) {
 							java.math.BigDecimal parentorgid =(java.math.BigDecimal) org[0].get("orgid");
 							impl.setParentorgid(parentorgid);
						}
					}
 					impl.setOrgtype("1");
 					String thisLeader = jo.getString("thisLeader");
 					if (thisLeader =="" || thisLeader == null) {
 						
					}else {
						criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
 	 					criteria.set("_entity", "com.primeton.ame.schindler.org.AcOperator");
 	 					criteria.set("_expr[1]/operatorid", thisLeader);
 	 					criteria.set("_expr[1]/_op", "=");
 	 					org = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
 	 					java.math.BigDecimal managerid =(java.math.BigDecimal) org[0].get("operatorid");
 	 					impl.setManagerid(managerid);
					}
 					impl.setStatus("running");
 					if (jo.getString("order") == "" || jo.getString("order") == null) {
						
					}else {
						impl.setSortno(Integer.valueOf(jo.getString("order")));
					}
 					
 					listAdd.add(impl);
				}else {
					java.math.BigDecimal orgid =(java.math.BigDecimal) org[0].get("orgid");
					impl.setOrgid(orgid);
					impl.setOrgcode(impl.getString("orgid"));
 					impl.setOrgname(jo.getString("name"));
 					String hierarchyId = jo.getString("hierarchyId");
 					if (hierarchyId.equals("0")) {
 						java.math.BigDecimal bigDecimal = new java.math.BigDecimal(2);
						impl.setOrglevel(bigDecimal);
					}else {
						java.math.BigDecimal bigDecimal = new java.math.BigDecimal(getFindNumber(hierarchyId, "x") -1);
						impl.setOrglevel(bigDecimal);
					}
 					String parent = jo.getString("parent");
 					if (parent == null || parent == "") {
 						
					}else {
						criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
 						criteria.set("_entity", "com.primeton.ame.schindler.org.OmOrganization");
 						criteria.set("_expr[1]/weburl", parent);
 						criteria.set("_expr[1]/_op", "=");
 						org = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
 						if (org!=null) {
 							java.math.BigDecimal parentorgid =(java.math.BigDecimal) org[0].get("orgid");
 							impl.setParentorgid(parentorgid);
						}
					}
 					impl.setOrgtype("1");
 					String thisLeader = jo.getString("thisLeader");
 					if (thisLeader =="" || thisLeader == null) {
 						
					}else {
						criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
 	 					criteria.set("_entity", "com.primeton.ame.schindler.org.AcOperator");
 	 					criteria.set("_expr[1]/operatorid", thisLeader);
 	 					criteria.set("_expr[1]/_op", "=");
 	 					org = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
 	 					java.math.BigDecimal managerid =(java.math.BigDecimal) org[0].get("operatorid");
 	 					impl.setManagerid(managerid);
					}
 					impl.setStatus("running");
 					if (jo.getString("order") == "" || jo.getString("order") == null) {
						
					}else {
						impl.setSortno(Integer.valueOf(jo.getString("order")));
					}
 					listUpdate.add(impl);
				}
			}
 			OmOrganization[] arrAdd = new OmOrganization[listAdd.size()];
 			OmOrganization[] arrUpdate = new OmOrganization[listUpdate.size()];
 			if (arrAdd.length != 0) {
 				listAdd.toArray(arrAdd);
 				DatabaseUtil.insertEntityBatch("default", arrAdd);
			}
 			if (arrUpdate.length != 0) {
 				listUpdate.toArray(arrUpdate);
 				DatabaseUtil.updateEntityBatch("default", arrUpdate);
			}
 			System.out.println("**************完成更新组织机构表信息**************");
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	
	/**
	 * dept
	 */
	@Bizlet("查询更改的组织dept")
	public static void queryUpdateDept(){
		System.out.println("**************开始更新组织机构表部门信息**************");
		SysSynchroGetOrgInfoContext context = new SysSynchroGetOrgInfoContext();
		context.setReturnOrgType("[{\"type\":\"dept\"}]");
		context.setCount(10000);
		context.setBeginTimeStamp("");
		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
        		+ "  <soapenv:Header>\n"
        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
        		+ " <tns:user>"+oauser+"</tns:user>\n"
        		+ " <tns:password>"+oapassword+"</tns:password>\n"
        		+ " </tns:RequestSOAPHeader>\n"
        		+ "</soapenv:Header>\n"
        		+ "   <soapenv:Body>\n"
        		+ "      <web:getUpdatedElements>\n"
        		+ "         <arg0>\n"
        		+ "            <returnOrgType>"+context.getReturnOrgType()+"</returnOrgType>\n"
        		+ "            <beginTimeStamp>"+context.getBeginTimeStamp()+"</beginTimeStamp>\n"
        		+ "            <count>"+context.getCount()+"</count>\n"
        		+ "         </arg0>\n"
        		+ "      </web:getUpdatedElements>\n"
        		+ "   </soapenv:Body>\n"
        		+ "</soapenv:Envelope>";	
		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Element rootElement = doc.getRootElement();
			Element bodyElement = rootElement.element("Body");
			Element paramElement = null;
			if (bodyElement != null) {
				paramElement = bodyElement.element("getUpdatedElementsResponse");
			} else {
				paramElement = (Element) rootElement.clone();
			}
			Element itemElement = paramElement.element("return");
			String countString = itemElement.elementText("count");
			String messgeString = itemElement.elementText("message");
			String returnState = itemElement.elementText("returnState");
			JSONArray array = JSONArray.parseArray(messgeString);
			HashMap<String,Object> mapParam = new HashMap<String,Object>();
			List<OmOrganization> listAdd = new ArrayList<OmOrganization>();
			List<OmOrganization> listUpdate = new ArrayList<OmOrganization>();
 			for (int i = 0; i < array.size(); i++) {
				JSONObject jo = array.getJSONObject(i);
				OmOrganization impl = new OmOrganizationImpl();
//				AaOrgtestImpl impl = new AaOrgtestImpl();
				String id = jo.getString("id");
				if (id == "17deb7be5f62c7d8544f9c24143a46eb") {
					System.out.println(jo.getString("name"));
				}
				DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
				criteria.set("_entity", "com.primeton.ame.schindler.org.OmOrganization");
				criteria.set("_expr[1]/weburl", id);
				criteria.set("_expr[1]/_op", "=");
				DataObject[] org = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
 				if (org.length == 0) {
 					DatabaseExt.getPrimaryKey(impl);
 					impl.setOrgcode(impl.getString("orgid"));
 					impl.setOrgname(jo.getString("name"));
 					String hierarchyId = jo.getString("hierarchyId");
 					if (hierarchyId.equals("0")) {
 						java.math.BigDecimal bigDecimal = new java.math.BigDecimal(2);
						impl.setOrglevel(bigDecimal);
					}else {
						java.math.BigDecimal bigDecimal = new java.math.BigDecimal(getFindNumber(hierarchyId, "x") -1);
						impl.setOrglevel(bigDecimal);
					}
 					String parent = jo.getString("parent");
 					if (parent == null || parent == "") {
					}else {
						criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
 						criteria.set("_entity", "com.primeton.ame.schindler.org.OmOrganization");
 						criteria.set("_expr[1]/weburl", parent);
 						criteria.set("_expr[1]/_op", "=");
 						org = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
 						if (org.length != 0) {
 							java.math.BigDecimal parentorgid =(java.math.BigDecimal) org[0].get("orgid");
 							impl.setParentorgid(parentorgid);
						}
					}
 					impl.setOrgtype("1");
 					String thisLeader = jo.getString("thisLeader");
 					if (thisLeader =="" || thisLeader == null) {
 						
					}else {
						criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
 	 					criteria.set("_entity", "com.primeton.ame.schindler.org.AcOperator");
 	 					criteria.set("_expr[1]/filePath", thisLeader);
 	 					criteria.set("_expr[1]/_op", "=");
 	 					org = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
 	 					if (org.length != 0) {
 	 						java.math.BigDecimal managerid =(java.math.BigDecimal) org[0].get("operatorid");
 	 	 					impl.setManagerid(managerid);
						}
					}
 					impl.setStatus("running");
 					if (jo.getString("order") == "" || jo.getString("order") == null) {
						
					}else {
						impl.setSortno(Integer.valueOf(jo.getString("order")));
					}
 					listAdd.add(impl);
// 					DatabaseUtil.insertEntity("default", impl);
				}else {
					java.math.BigDecimal orgid =(java.math.BigDecimal) org[0].get("orgid");
					impl.setOrgid(orgid);
					impl.setOrgcode(impl.getString("orgid"));
 					impl.setOrgname(jo.getString("name"));
 					String hierarchyId = jo.getString("hierarchyId");
 					if (hierarchyId.equals("0")) {
 						java.math.BigDecimal bigDecimal = new java.math.BigDecimal(2);
						impl.setOrglevel(bigDecimal);
					}else {
						java.math.BigDecimal bigDecimal = new java.math.BigDecimal(getFindNumber(hierarchyId, "x") -1);
						impl.setOrglevel(bigDecimal);
					}
 					String parent = jo.getString("parent");
 					if (parent == null || parent == "") {
 						
					}else {
						criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
 						criteria.set("_entity", "com.primeton.ame.schindler.org.OmOrganization");
 						criteria.set("_expr[1]/weburl", parent);
 						criteria.set("_expr[1]/_op", "=");
 						org = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
 						if (org.length != 0) {
 							java.math.BigDecimal parentorgid =(java.math.BigDecimal) org[0].get("orgid");
 							impl.setParentorgid(parentorgid);
						}
					}
 					impl.setOrgtype("1");
 					String thisLeader = jo.getString("thisLeader");
 					if (thisLeader =="" || thisLeader == null) {
 						
					}else {
						criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
 	 					criteria.set("_entity", "com.primeton.ame.schindler.org.AcOperator");
 	 					criteria.set("_expr[1]/filePath", thisLeader);
 	 					criteria.set("_expr[1]/_op", "=");
 	 					org = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
 	 					if (org.length != 0) {
 	 						java.math.BigDecimal managerid =(java.math.BigDecimal) org[0].get("operatorid");
 	 	 					impl.setManagerid(managerid);
						}
					}
 					impl.setStatus("running");
 					if (jo.getString("order") == "" || jo.getString("order") == null) {
						
					}else {
						impl.setSortno(Integer.valueOf(jo.getString("order")));
					}
 					if(impl.getParentorgid() != null){
 						listUpdate.add(0,impl);
 					}else{
 						listUpdate.add(impl);
 					}
 					/*if(listUpdate.size()==50){
 						break;
 					}*/
// 					DatabaseUtil.updateEntity("default", impl);
				}
			}
 			OmOrganization[] arrAdd = new OmOrganization[listAdd.size()];
 			OmOrganization[] arrUpdate = new OmOrganization[listUpdate.size()];
 			if (arrAdd.length != 0) {
 				listAdd.toArray(arrAdd);
 				DatabaseUtil.insertEntityBatch("default", arrAdd);
			}
 			if (arrUpdate.length != 0) {
 				listUpdate.toArray(arrUpdate);
 				DatabaseUtil.updateEntityBatch("default", arrUpdate);
			}
 			System.out.println("**************完成更新组织机构表部门信息**************");
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	
	/**
	 * group
	 */
	@Bizlet("查询更改的组织Group")
	public static void queryUpdateGroup(){
		
		SysSynchroGetOrgInfoContext context = new SysSynchroGetOrgInfoContext();
		context.setReturnOrgType("[{\"type\":\"group\"}]");
		context.setCount(10000);
		context.setBeginTimeStamp("");
		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
        		+ "  <soapenv:Header>\n"
        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
        		+ " <tns:user>"+oauser+"</tns:user>\n"
        		+ " <tns:password>"+oapassword+"</tns:password>\n"
        		+ " </tns:RequestSOAPHeader>\n"
        		+ "</soapenv:Header>\n"
        		+ "   <soapenv:Body>\n"
        		+ "      <web:getUpdatedElements>\n"
        		+ "         <arg0>\n"
        		+ "            <returnOrgType>"+context.getReturnOrgType()+"</returnOrgType>\n"
        		+ "            <beginTimeStamp>"+context.getBeginTimeStamp()+"</beginTimeStamp>\n"
        		+ "            <count>"+context.getCount()+"</count>\n"
        		+ "         </arg0>\n"
        		+ "      </web:getUpdatedElements>\n"
        		+ "   </soapenv:Body>\n"
        		+ "</soapenv:Envelope>";	
		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Element rootElement = doc.getRootElement();
			Element bodyElement = rootElement.element("Body");
			Element paramElement = null;
			if (bodyElement != null) {
				paramElement = bodyElement.element("getUpdatedElementsResponse");
			} else {
				paramElement = (Element) rootElement.clone();
			}
			Element itemElement = paramElement.element("return");
			String countString = itemElement.elementText("count");
			String messgeString = itemElement.elementText("message");
			String returnState = itemElement.elementText("returnState");
			JSONArray array = JSONArray.parseArray(messgeString);
			HashMap<String,Object> mapParam = new HashMap<String,Object>();
			List<ZhGroup> listAdd = new ArrayList<ZhGroup>();
			List<ZhGroup> listUpdate = new ArrayList<ZhGroup>();
			List<String> list = new ArrayList<String>();
 			for (int i = 0; i < array.size(); i++) {
				JSONObject jo = array.getJSONObject(i);
//				System.out.println(jo);
				ZhGroup impl = new ZhGroupImpl();
				String uuid = UUID.randomUUID().toString().trim().replace("-", "");
				mapParam.put("id", uuid);
				Object[] org = DatabaseExt.queryByNamedSql("default", "com.primeton.ame.schindler.querySysSynchroGetOrg.queryGroupById", mapParam);
				String members = jo.getString("members");
				if (members == null || members == "");else{list = memberStr(members);}
				if (org.length == 0 && list.size() == 0) {
					impl.setId(uuid);
					impl.setName(jo.getString("name"));
					impl.setHierarchyid(jo.getString("hierarchyId"));
					impl.setOrgType(jo.getString("type"));
					impl.setLunid(jo.getString("lunid"));
 					impl.setIsavailable(jo.getString("isAvailable"));
 					impl.setAltertime(jo.getString("alterTime"));
 					impl.setMemo(jo.getString("memo"));
 					impl.setOrderby(jo.getString("order"));
 					impl.setMembers(jo.getString("members"));
 					listAdd.add(impl);
				}else if(org.length == 0 && list.size() != 0){
					for (int j = 0; j < list.size(); j++) {
						impl = new ZhGroupImpl();
						uuid = UUID.randomUUID().toString().trim().replace("-", "");
						impl.setId(uuid);
						impl.setName(jo.getString("name"));
						impl.setHierarchyid(jo.getString("hierarchyId"));
						impl.setOrgType(jo.getString("type"));
						impl.setLunid(jo.getString("lunid"));
	 					impl.setIsavailable(jo.getString("isAvailable"));
	 					impl.setAltertime(jo.getString("alterTime"));
	 					impl.setMemo(jo.getString("memo"));
	 					impl.setOrderby(jo.getString("order"));
	 					impl.setMembers(list.get(j));
	 					listAdd.add(impl);
					}
				}else if (org.length != 0 && list.size() == 0) {
					impl.setId(uuid);
					impl.setName(jo.getString("name"));
					impl.setHierarchyid(jo.getString("hierarchyId"));
					impl.setOrgType(jo.getString("type"));
					impl.setLunid(jo.getString("lunid"));
 					impl.setIsavailable(jo.getString("isAvailable"));
 					impl.setAltertime(jo.getString("alterTime"));
 					impl.setMemo(jo.getString("memo"));
 					impl.setOrderby(jo.getString("order"));
 					impl.setMembers(jo.getString("members"));
 					listUpdate.add(impl);
				}else if (org.length != 0 && list.size() != 0) {
					for (int j = 0; j < list.size(); j++) {
						impl = new ZhGroupImpl();
						uuid = UUID.randomUUID().toString().trim().replace("-", "");
						impl.setId(uuid);
						impl.setName(jo.getString("name"));
						impl.setHierarchyid(jo.getString("hierarchyId"));
						impl.setOrgType(jo.getString("type"));
						impl.setLunid(jo.getString("lunid"));
	 					impl.setIsavailable(jo.getString("isAvailable"));
	 					impl.setAltertime(jo.getString("alterTime"));
	 					impl.setMemo(jo.getString("memo"));
	 					impl.setOrderby(jo.getString("order"));
	 					impl.setMembers(list.get(j));
	 					listUpdate.add(impl);
					}
				}
			}
 			ZhGroup[] arrAdd = new ZhGroup[listAdd.size()];
 			ZhGroup[] arrUpdate = new ZhGroup[listUpdate.size()];
 			if (arrAdd.length != 0) {
 				listAdd.toArray(arrAdd);
 				DatabaseUtil.insertEntityBatch("default", arrAdd);
			}
 			if (arrUpdate.length != 0) {
 				listUpdate.toArray(arrUpdate);
 				DatabaseUtil.updateEntityBatch("default", arrUpdate);
			}
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	
	/**
	 * post
	 */
	@Bizlet("查询更改的组织post")
	public static void queryUpdatePost(){
		SysSynchroGetOrgInfoContext context = new SysSynchroGetOrgInfoContext();
		context.setReturnOrgType("[{\"type\":\"post\"}]");
		context.setCount(10000);
		context.setBeginTimeStamp("");
		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
        		+ "  <soapenv:Header>\n"
        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
        		+ " <tns:user>"+oauser+"</tns:user>\n"
        		+ " <tns:password>"+oapassword+"</tns:password>\n"
        		+ " </tns:RequestSOAPHeader>\n"
        		+ "</soapenv:Header>\n"
        		+ "   <soapenv:Body>\n"
        		+ "      <web:getUpdatedElements>\n"
        		+ "         <arg0>\n"
        		+ "            <returnOrgType>"+context.getReturnOrgType()+"</returnOrgType>\n"
        		+ "            <beginTimeStamp>"+context.getBeginTimeStamp()+"</beginTimeStamp>\n"
        		+ "            <count>"+context.getCount()+"</count>\n"
        		+ "         </arg0>\n"
        		+ "      </web:getUpdatedElements>\n"
        		+ "   </soapenv:Body>\n"
        		+ "</soapenv:Envelope>";	
		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Element rootElement = doc.getRootElement();
			Element bodyElement = rootElement.element("Body");
			Element paramElement = null;
			if (bodyElement != null) {
				paramElement = bodyElement.element("getUpdatedElementsResponse");
			} else {
				paramElement = (Element) rootElement.clone();
			}
			Element itemElement = paramElement.element("return");
			String countString = itemElement.elementText("count");
			String messgeString = itemElement.elementText("message");
			String returnState = itemElement.elementText("returnState");
			JSONArray array = JSONArray.parseArray(messgeString);
			HashMap<String,Object> mapParam = new HashMap<String,Object>();
			List<ZhPost> listAdd = new ArrayList<ZhPost>();
			List<ZhPost> listUpdate = new ArrayList<ZhPost>();
 			for (int i = 0; i < array.size(); i++) {
				JSONObject jo = array.getJSONObject(i);
				System.out.println(jo);
				ZhPost impl = new ZhPostImpl();
				String id = jo.getString("id");
				mapParam.put("id", id);
				Object[] org = DatabaseExt.queryByNamedSql("default", "com.primeton.ame.schindler.querySysSynchroGetOrg.queryPostById", mapParam);
 				if (org.length == 0) {
 					impl.setId(id);
 					impl.setName(jo.getString("name"));
 					impl.setLunid(jo.getString("lunid"));
 					impl.setHierarchyid(jo.getString("hierarchyId"));
 					impl.setIsavailable(jo.getString("isAvailable"));
 					impl.setAltertime(jo.getString("alterTime"));
 					impl.setOrgType(jo.getString("type"));
 					impl.setParent(jo.getString("parent"));
 					impl.setPersons(jo.getString("persons"));
 					listAdd.add(impl);
				}else {
					impl.setId(id);
					impl.setName(jo.getString("name"));
 					impl.setLunid(jo.getString("lunid"));
 					impl.setHierarchyid(jo.getString("hierarchyId"));
 					impl.setIsavailable(jo.getString("isAvailable"));
 					impl.setAltertime(jo.getString("alterTime"));
 					impl.setOrgType(jo.getString("type"));
 					impl.setParent(jo.getString("parent"));
 					impl.setPersons(jo.getString("persons"));
 					listUpdate.add(impl);
				}
			}
 			ZhPost[] arrAdd = new ZhPost[listAdd.size()];
 			ZhPost[] arrUpdate = new ZhPost[listUpdate.size()];
 			if (arrAdd.length != 0) {
 				listAdd.toArray(arrAdd);
 				DatabaseUtil.insertEntityBatch("default", arrAdd);
			}
 			if (arrUpdate.length != 0) {
 				listUpdate.toArray(arrUpdate);
 				DatabaseUtil.updateEntityBatch("default", arrUpdate);
			}
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	
	public static List<String> memberStr(String str){
		List<String> list = new ArrayList<String>();
		String regex = "\"([^\"]+)\"";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(str);
		while (matcher.find()) {
            String group = matcher.group(1); 
            list.add(group);
        }
		return list;
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
	
	@Bizlet("组织机构并修改ORGSEQ")
	public static void queryOrganization(){
		System.out.println("**************开始更新组织机构表ORGSEQ**************");
		String ORGSEQ = "";
		String org = "";
		HashMap<String, Object> map = new HashMap<String,Object>();
		DataObject[] datas = sqlUtils.queryEntities(
				"com.primeton.ame.schindler.querySysSynchroGetOrg.queryOrganization", map);
		List<OmOrganization> listUpdate = new ArrayList<OmOrganization>();
		for (int i = 0; i < datas.length; i++) {
			OmOrganization impl = new OmOrganizationImpl();
			DataObject dataObject = datas[i];
			java.math.BigDecimal orgid =(java.math.BigDecimal) dataObject.get("orgid");
			impl.setOrgid(orgid);
			int ORGLEVEL = dataObject.getInt("orglevel");
			String parentorgId = dataObject.getString("parentorgid");
			if (ORGLEVEL == 1) {
				ORGSEQ = "." + orgid + ".";
				impl.setOrgseq(ORGSEQ);
			}else if(ORGLEVEL == 2){
				if (parentorgId != null) {
					ORGSEQ = "." + parentorgId + "." + orgid + ".";
					impl.setOrgseq(ORGSEQ);
				}else {
					ORGSEQ = "." + orgid + ".";
					impl.setOrgseq(ORGSEQ);
				}
			}else {
				int level = Integer.valueOf(ORGLEVEL);
				for (int j = 0; j < level - 2 ; j++) {
					ORGSEQ = "." + parentorgId + "." + orgid + ".";
					if (parentorgId == "" || parentorgId == null) {
						ORGSEQ = "." + orgid + ".";
						impl.setOrgseq(ORGSEQ);
						continue;
					}
					map.put("id", parentorgId);
					DataObject[] org1 = sqlUtils.queryEntities(
							"com.primeton.ame.schindler.querySysSynchroGetOrg.queryOrganizationById", map);
					org = "." + org1[0].getString("parentorgid") + ORGSEQ;
  					impl.setOrgseq(org);
				}
			}
			listUpdate.add(impl);
		}
		OmOrganization[] arrUpdate = new OmOrganization[listUpdate.size()];
		if (arrUpdate.length != 0) {
				listUpdate.toArray(arrUpdate);
				DatabaseUtil.updateEntityBatch("default", arrUpdate);
		}
		System.out.println("**************完成更新组织机构表ORGSEQ**************");
	}
	
	
	/**
	 * person
	 */
	@Bizlet("om_employee")
	public static void queryUpdateEmployee(){
		SysSynchroGetOrgInfoContext context = new SysSynchroGetOrgInfoContext();
		context.setReturnOrgType("[{\"type\":\"person\"}]");
		context.setCount(10000);
		context.setBeginTimeStamp("");
		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
        		+ "  <soapenv:Header>\n"
        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
        		+ " <tns:user>"+oauser+"</tns:user>\n"
        		+ " <tns:password>"+oapassword+"</tns:password>\n"
        		+ " </tns:RequestSOAPHeader>\n"
        		+ "</soapenv:Header>\n"
        		+ "   <soapenv:Body>\n"
        		+ "      <web:getUpdatedElements>\n"
        		+ "         <arg0>\n"
        		+ "            <returnOrgType>"+context.getReturnOrgType()+"</returnOrgType>\n"
        		+ "            <beginTimeStamp>"+context.getBeginTimeStamp()+"</beginTimeStamp>\n"
        		+ "            <count>"+context.getCount()+"</count>\n"
        		+ "         </arg0>\n"
        		+ "      </web:getUpdatedElements>\n"
        		+ "   </soapenv:Body>\n"
        		+ "</soapenv:Envelope>";	
		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Element rootElement = doc.getRootElement();
			Element bodyElement = rootElement.element("Body");
			Element paramElement = null;
			if (bodyElement != null) {
				paramElement = bodyElement.element("getUpdatedElementsResponse");
			} else {
				paramElement = (Element) rootElement.clone();
			}
			Element itemElement = paramElement.element("return");
			String countString = itemElement.elementText("count");
			String messgeString = itemElement.elementText("message");
			String returnState = itemElement.elementText("returnState");
			JSONArray array = JSONArray.parseArray(messgeString);
			List<OmEmployee> listAdd = new ArrayList<OmEmployee>();
			List<OmEmployee> listUpdate = new ArrayList<OmEmployee>();
 			for (int i = 0; i < array.size(); i++) {
				JSONObject jo = array.getJSONObject(i);
				if (jo.getString("no")== "" || jo.getString("no") == null) {
					continue;
				}
				OmEmployee impl = new OmEmployeeImpl();
				String id = jo.getString("lunid");
//				DataObject[] org = (DataObject[])DatabaseExt.queryByNamedSql("default", "com.primeton.ame.schindler.querySysSynchroGetOrg.queryPersonById", mapParam);
				DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
				criteria.set("_entity", "com.primeton.ame.schindler.org.OmEmployee");
				criteria.set("_expr[1]/tag", id);
				criteria.set("_expr[1]/_op", "=");
				DataObject[] org = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
				if (org.length == 0) {
					DatabaseExt.getPrimaryKey(impl);
					impl.setEmpcode(jo.getString("no"));
					//查询operator信息
					criteria.set("_entity", "com.primeton.ame.schindler.org.AcOperator");
					criteria.set("_expr[1]/filePath", id);
					criteria.set("_expr[1]/_op", "=");
					DataObject[] operator = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
					if (operator.length != 0) {
						java.math.BigDecimal operatorid =(java.math.BigDecimal) operator[0].get("operatorid");
						impl.setOperatorid(operatorid);
						String userid = (String) operator[0].get("userid");
						impl.setUserid(userid);
					}
					impl.setEmpname(jo.getString("name"));
					impl.setRealname(jo.getString("name"));
					if (jo.getString("isAvailable") == "true" ) {
						impl.setEmpstatus("on");
					}
					impl.setDegree("1");
					String parent = jo.getString("parent");
					if (parent != null) {
						criteria.set("_entity", "com.primeton.ame.schindler.org.OmOrganization");
						criteria.set("_expr[1]/weburl", jo.getString("parent"));
						criteria.set("_expr[1]/_op", "=");
						DataObject[] organization = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
						if (organization.length != 0) {
							java.math.BigDecimal Orgid =(java.math.BigDecimal) organization[0].get("orgid");
							impl.setOrgid(Orgid);
						}
					}
					impl.setTag(id);
 					listAdd.add(impl);
				}else {
					java.math.BigDecimal empid =(java.math.BigDecimal) org[0].get("empid");
					impl.setEmpid(empid);
					impl.setEmpcode(jo.getString("no"));
					//查询operator信息
					criteria.set("_entity", "com.primeton.ame.schindler.org.AcOperator");
					criteria.set("_expr[1]/filePath", id);
					criteria.set("_expr[1]/_op", "=");
					DataObject[] operator = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
					if (operator.length != 0) {
						java.math.BigDecimal operatorid =(java.math.BigDecimal) operator[0].get("operatorid");
						impl.setOperatorid(operatorid);
						String userid = (String) operator[0].get("userid");
						impl.setUserid(userid);
					}
					impl.setEmpname(jo.getString("name"));
					impl.setRealname(jo.getString("name"));
					if (jo.getString("isAvailable") == "true" ) {
						impl.setEmpstatus("on");
					}
					impl.setDegree("1");
					String parent = jo.getString("parent");
					if (parent != null) {
						criteria.set("_entity", "com.primeton.ame.schindler.org.OmOrganization");
						criteria.set("_expr[1]/weburl", jo.getString("parent"));
						criteria.set("_expr[1]/_op", "=");
						DataObject[] organization = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
						if (organization.length != 0) {
							java.math.BigDecimal Orgid =(java.math.BigDecimal) organization[0].get("orgid");
							impl.setOrgid(Orgid);
						}
					}
					impl.setTag(id);
 					listUpdate.add(impl);
				}
			}
 			OmEmployee[] arrAdd = new OmEmployee[listAdd.size()];
 			OmEmployee[] arrUpdate = new OmEmployee[listUpdate.size()];
 			if (arrAdd.length != 0) {
 				listAdd.toArray(arrAdd);
 				DatabaseUtil.insertEntityBatch("default", arrAdd);
			}
 			if (arrUpdate.length != 0) {
 				listUpdate.toArray(arrUpdate);
 				DatabaseUtil.updateEntityBatch("default", arrUpdate);
			}
			System.out.println("结束!查询到的person数量为：" + countString);
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	
	@Bizlet("om_emporg")
	public static void queryEmpOrg(){
		HashMap<String, Object> map = new HashMap<String,Object>();
		sqlUtils.executeSql("com.primeton.ame.schindler.querySysSynchroGetOrg.deleteEmpOrg", map);
		DataObject[] datas = sqlUtils.queryEntities(
				"com.primeton.ame.schindler.querySysSynchroGetOrg.queryEmpOrg", map);
		List<OmEmporg> listAdd = new ArrayList<OmEmporg>();
		for (int i = 0; i < datas.length; i++) {
			OmEmporg impl = new OmEmporgImpl();
			DataObject dataObject = datas[i];
			java.math.BigDecimal empid =(java.math.BigDecimal) dataObject.get("empid");
			if (empid == null ) continue;
			impl.setEmpid(empid);
			java.math.BigDecimal orgid =(java.math.BigDecimal) dataObject.get("orgid");
			if (orgid == null ) continue;
			impl.setOrgid(orgid);
			impl.setIsmain("y");
			java.math.BigDecimal empprop = new java.math.BigDecimal(1);
			impl.setEmpprop(empprop);
			listAdd.add(impl);
		}
		OmEmporg[] arrAdd = new OmEmporg[listAdd.size()];
		if (arrAdd.length != 0) {
				listAdd.toArray(arrAdd);
				DatabaseUtil.insertEntityBatch("default", arrAdd);
		}
	}



	@Bizlet("查询所有组织机构并将luuid写入weburl")
	public static void queryUpdateOrgWebUrl() {
		System.out.println("**************开始更新组织机构表OA唯一标识**************");
		SysSynchroGetOrgInfoContext context = new SysSynchroGetOrgInfoContext();
		context.setReturnOrgType("[{\"type\":\"org\"}]");
		context.setCount(10000);
		context.setBeginTimeStamp("");
		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
				+ "  <soapenv:Header>\n"
				+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
				+ " <tns:user>"
				+ oauser
				+ "</tns:user>\n"
				+ " <tns:password>"
				+ oapassword
				+ "</tns:password>\n"
				+ " </tns:RequestSOAPHeader>\n"
				+ "</soapenv:Header>\n"
				+ "   <soapenv:Body>\n"
				+ "      <web:getUpdatedElements>\n"
				+ "         <arg0>\n"
				+ "            <returnOrgType>"
				+ context.getReturnOrgType()
				+ "</returnOrgType>\n"
				+ "            <beginTimeStamp>"
				+ context.getBeginTimeStamp()
				+ "</beginTimeStamp>\n"
				+ "            <count>"
				+ context.getCount()
				+ "</count>\n"
				+ "         </arg0>\n"
				+ "      </web:getUpdatedElements>\n"
				+ "   </soapenv:Body>\n" + "</soapenv:Envelope>";
		String str = SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader
					.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Element rootElement = doc.getRootElement();
			Element bodyElement = rootElement.element("Body");
			Element paramElement = null;
			if (bodyElement != null) {
				paramElement = bodyElement
						.element("getUpdatedElementsResponse");
			} else {
				paramElement = (Element) rootElement.clone();
			}
			Element itemElement = paramElement.element("return");
			String countString = itemElement.elementText("count");
			String messgeString = itemElement.elementText("message");
			String returnState = itemElement.elementText("returnState");
			JSONArray array = JSONArray.parseArray(messgeString);
			List<OmOrganization> listUpdate = new ArrayList<OmOrganization>();
			for (int i = 0; i < array.size(); i++) {
				JSONObject jo = array.getJSONObject(i);
				OmOrganization impl = new OmOrganizationImpl();
				String id = jo.getString("id");
				String orgname = jo.getString("name");
				DataObject criteria = DataFactory.INSTANCE.create(
						"com.primeton.das.criteria", "criteriaType");
				criteria.set("_entity",
						"com.primeton.ame.schindler.org.OmOrganization");
				criteria.set("_expr[1]/orgname", orgname);
				criteria.set("_expr[1]/_op", "=");
				DataObject[] org = DatabaseUtil.queryEntitiesByCriteriaEntity(
						"default", criteria);
				if (org.length != 0) {
					java.math.BigDecimal orgid = (java.math.BigDecimal) org[0]
							.get("orgid");
					impl.setOrgid(orgid);
					impl.setWeburl(jo.getString("id"));
					listUpdate.add(impl);
				}
			}
			OmOrganization[] arrUpdate = new OmOrganization[listUpdate
					.size()];
			if (arrUpdate.length != 0) {
				listUpdate.toArray(arrUpdate);
				DatabaseUtil.updateEntityBatch("default", arrUpdate);
			}
			System.out.println("**************完成更新组织机构表OA唯一标识**************");
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	@Bizlet("查询所有组织机构并将luuid写入weburl")
	public static void queryUpdateDeptWebUrl() {
		System.out.println("**************开始更新组织机构表部门OA唯一标识**************");
		SysSynchroGetOrgInfoContext context = new SysSynchroGetOrgInfoContext();
		context.setReturnOrgType("[{\"type\":\"dept\"}]");
		context.setCount(10000);
		context.setBeginTimeStamp("");
		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
        		+ "  <soapenv:Header>\n"
        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
        		+ " <tns:user>"+oauser+"</tns:user>\n"
        		+ " <tns:password>"+oapassword+"</tns:password>\n"
        		+ " </tns:RequestSOAPHeader>\n"
        		+ "</soapenv:Header>\n"
        		+ "   <soapenv:Body>\n"
        		+ "      <web:getUpdatedElements>\n"
        		+ "         <arg0>\n"
        		+ "            <returnOrgType>"+context.getReturnOrgType()+"</returnOrgType>\n"
        		+ "            <beginTimeStamp>"+context.getBeginTimeStamp()+"</beginTimeStamp>\n"
        		+ "            <count>"+context.getCount()+"</count>\n"
        		+ "         </arg0>\n"
        		+ "      </web:getUpdatedElements>\n"
        		+ "   </soapenv:Body>\n"
        		+ "</soapenv:Envelope>";	
		String str = SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader
					.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Element rootElement = doc.getRootElement();
			Element bodyElement = rootElement.element("Body");
			Element paramElement = null;
			if (bodyElement != null) {
				paramElement = bodyElement
						.element("getUpdatedElementsResponse");
			} else {
				paramElement = (Element) rootElement.clone();
			}
			Element itemElement = paramElement.element("return");
			String countString = itemElement.elementText("count");
			String messgeString = itemElement.elementText("message");
			String returnState = itemElement.elementText("returnState");
			JSONArray array = JSONArray.parseArray(messgeString);
			List<OmOrganization> listUpdate = new ArrayList<OmOrganization>();
			for (int i = 0; i < array.size(); i++) {
				JSONObject jo = array.getJSONObject(i);
				OmOrganization impl = new OmOrganizationImpl();
				String id = jo.getString("id");
				String orgname = jo.getString("name");
				DataObject criteria = DataFactory.INSTANCE.create(
						"com.primeton.das.criteria", "criteriaType");
				criteria.set("_entity",
						"com.primeton.ame.schindler.org.OmOrganization");
				criteria.set("_expr[1]/orgname", orgname);
				criteria.set("_expr[1]/_op", "=");
				DataObject[] org = DatabaseUtil.queryEntitiesByCriteriaEntity(
						"default", criteria);
				if (org.length != 0) {
					java.math.BigDecimal orgid = (java.math.BigDecimal) org[0]
							.get("orgid");
					impl.setOrgid(orgid);
					impl.setWeburl(jo.getString("id"));
					listUpdate.add(impl);
				}
			}
			OmOrganization[] arrUpdate = new OmOrganization[listUpdate
					.size()];
			if (arrUpdate.length != 0) {
				listUpdate.toArray(arrUpdate);
				DatabaseUtil.updateEntityBatch("default", arrUpdate);
			}
			System.out.println("**************完成更新组织机构表部门OA唯一标识**************");
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	
	
	
	
	@Bizlet("Person")
	public static void queryUpdatePersonFilePath(){
		System.out.println("**************开始更新系统登录用户表OA唯一标识**************");
		SysSynchroGetOrgInfoContext context = new SysSynchroGetOrgInfoContext();
		context.setReturnOrgType("[{\"type\":\"person\"}]");
		context.setCount(10000);
		context.setBeginTimeStamp("");
		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
        		+ "  <soapenv:Header>\n"
        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
        		+ " <tns:user>"+oauser+"</tns:user>\n"
        		+ " <tns:password>"+oapassword+"</tns:password>\n"
        		+ " </tns:RequestSOAPHeader>\n"
        		+ "</soapenv:Header>\n"
        		+ "   <soapenv:Body>\n"
        		+ "      <web:getUpdatedElements>\n"
        		+ "         <arg0>\n"
        		+ "            <returnOrgType>"+context.getReturnOrgType()+"</returnOrgType>\n"
        		+ "            <beginTimeStamp>"+context.getBeginTimeStamp()+"</beginTimeStamp>\n"
        		+ "            <count>"+context.getCount()+"</count>\n"
        		+ "         </arg0>\n"
        		+ "      </web:getUpdatedElements>\n"
        		+ "   </soapenv:Body>\n"
        		+ "</soapenv:Envelope>";	
		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Element rootElement = doc.getRootElement();
			Element bodyElement = rootElement.element("Body");
			Element paramElement = null;
			if (bodyElement != null) {
				paramElement = bodyElement.element("getUpdatedElementsResponse");
			} else {
				paramElement = (Element) rootElement.clone();
			}
			Element itemElement = paramElement.element("return");
			String countString = itemElement.elementText("count");
			String messgeString = itemElement.elementText("message");
			String returnState = itemElement.elementText("returnState");
			JSONArray array = JSONArray.parseArray(messgeString);
			List<AcOperator> listAdd = new ArrayList<AcOperator>();
			List<AcOperator> listUpdate = new ArrayList<AcOperator>();
 			for (int i = 0; i < array.size(); i++) {
				JSONObject jo = array.getJSONObject(i);
				if (jo.getString("no")== "" || jo.getString("no") == null) {
					continue;
				}
				AcOperator impl = new AcOperatorImpl();
				String id = jo.getString("lunid");
//				DataObject[] org = (DataObject[])DatabaseExt.queryByNamedSql("default", "com.primeton.ame.schindler.querySysSynchroGetOrg.queryPersonById", mapParam);
				DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
				criteria.set("_entity", "com.primeton.ame.schindler.org.AcOperator");
				criteria.set("_expr[1]/userid", jo.getString("no"));
				criteria.set("_expr[1]/_op", "=");
				DataObject[] org = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
				if (org.length != 0) {
					java.math.BigDecimal a =(java.math.BigDecimal) org[0].get("operatorid");
					impl.setOperatorid(a);
					impl.setFilePath(jo.getString("lunid"));
					listUpdate.add(impl);
				}
			}
 			AcOperator[] arrUpdate = new AcOperator[listUpdate.size()];
 			if (arrUpdate.length != 0) {
 				listUpdate.toArray(arrUpdate);
 				DatabaseUtil.updateEntityBatch("default", arrUpdate);
			}
 			System.out.println("**************完成更新系统登录用户表OA唯一标识**************");
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	
	
	/**
	 * person
	 */
	@Bizlet("om_employeeTag")
	public static void queryUpdateEmployeeTag(){
		SysSynchroGetOrgInfoContext context = new SysSynchroGetOrgInfoContext();
		context.setReturnOrgType("[{\"type\":\"person\"}]");
		context.setCount(10000);
		context.setBeginTimeStamp("");
		s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
        		+ "  <soapenv:Header>\n"
        		+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n"
        		+ " <tns:user>"+oauser+"</tns:user>\n"
        		+ " <tns:password>"+oapassword+"</tns:password>\n"
        		+ " </tns:RequestSOAPHeader>\n"
        		+ "</soapenv:Header>\n"
        		+ "   <soapenv:Body>\n"
        		+ "      <web:getUpdatedElements>\n"
        		+ "         <arg0>\n"
        		+ "            <returnOrgType>"+context.getReturnOrgType()+"</returnOrgType>\n"
        		+ "            <beginTimeStamp>"+context.getBeginTimeStamp()+"</beginTimeStamp>\n"
        		+ "            <count>"+context.getCount()+"</count>\n"
        		+ "         </arg0>\n"
        		+ "      </web:getUpdatedElements>\n"
        		+ "   </soapenv:Body>\n"
        		+ "</soapenv:Envelope>";	
		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		SAXReader saxReader = new SAXReader();
		Document doc;
		try {
			doc = saxReader.read(new ByteArrayInputStream(str.getBytes("UTF-8")));
			Element rootElement = doc.getRootElement();
			Element bodyElement = rootElement.element("Body");
			Element paramElement = null;
			if (bodyElement != null) {
				paramElement = bodyElement.element("getUpdatedElementsResponse");
			} else {
				paramElement = (Element) rootElement.clone();
			}
			Element itemElement = paramElement.element("return");
			String countString = itemElement.elementText("count");
			String messgeString = itemElement.elementText("message");
			String returnState = itemElement.elementText("returnState");
			JSONArray array = JSONArray.parseArray(messgeString);
			List<OmEmployee> listAdd = new ArrayList<OmEmployee>();
			List<OmEmployee> listUpdate = new ArrayList<OmEmployee>();
 			for (int i = 0; i < array.size(); i++) {
				JSONObject jo = array.getJSONObject(i);
				if (jo.getString("no")== "" || jo.getString("no") == null) {
					continue;
				}
				OmEmployee impl = new OmEmployeeImpl();
				String id = jo.getString("lunid");
//				DataObject[] org = (DataObject[])DatabaseExt.queryByNamedSql("default", "com.primeton.ame.schindler.querySysSynchroGetOrg.queryPersonById", mapParam);
				DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
				criteria.set("_entity", "com.primeton.ame.schindler.org.OmEmployee");
				criteria.set("_expr[1]/empcode", jo.getString("no"));
				criteria.set("_expr[1]/_op", "=");
				DataObject[] org = DatabaseUtil.queryEntitiesByCriteriaEntity("default",criteria);
				if (org.length != 0) {
					java.math.BigDecimal empid =(java.math.BigDecimal) org[0].get("empid");
					impl.setEmpid(empid);
					impl.setTag(jo.getString("lunid"));
					listUpdate.add(impl);
				}
			}
 			OmEmployee[] arrUpdate = new OmEmployee[listUpdate.size()];
 			if (arrUpdate.length != 0) {
 				listUpdate.toArray(arrUpdate);
 				DatabaseUtil.updateEntityBatch("default", arrUpdate);
			}
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		} catch (DocumentException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}catch (JSONException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
}
