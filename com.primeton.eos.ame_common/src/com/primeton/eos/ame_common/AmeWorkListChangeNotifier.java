package com.primeton.eos.ame_common;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.gocom.bps.wfclient.common.ServiceFactory;
import org.json.JSONObject;

import com.alibaba.fastjson.JSON;
import com.eos.data.datacontext.DataContextManager;
import com.eos.data.datacontext.IMUODataContext;
import com.eos.data.datacontext.IUserObject;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.workflow.data.WFUserObject;
import com.eos.workflow.data.WFWorkItem;
import com.primeton.das.entity.impl.hibernate.loader.custom.Return;
import com.primeton.workflow.api.IWorkListChangeNotifier;
import com.primeton.workflow.api.WFServiceException;






import com.zhonghe.ame.imptask.stringCommonUtil;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.apache.http.HttpResponse;
import org.apache.http.entity.StringEntity;
import org.apache.http.client.HttpClient;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.client.methods.HttpPost;

public class AmeWorkListChangeNotifier implements IWorkListChangeNotifier {

	/**
	 * 新增工作项
	 */
	public void notifyInsert(WFUserObject obj, Map map) {
		if (!(obj instanceof WFWorkItem)){
			return;
		}else{
			WFWorkItem workItem = (WFWorkItem)obj;
			System.out.println("新增工作项-状态"+workItem.getCurrentState());
			System.out.println("新增工作项-id"+workItem.getWorkItemID());
			try {
				if(workItem.getCurrentState()==10){
					sendto(obj);
				}
			} catch (UnsupportedEncodingException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}
	}

	/**
	 * 删除工作项
	 */
	public void notifyRemove(WFUserObject arg0, Map arg1) {
		if (!(arg0 instanceof WFWorkItem)){
			return;
		}else{
				WFWorkItem workItem = (WFWorkItem)arg0;
				System.out.println("删除工作项-状态"+workItem.getCurrentState());
				System.out.println("删除工作项-id"+workItem.getWorkItemID());
		}
	}

	/**
	 * 更新工作项工作项
	 */
	public void notifyUpdate(WFUserObject obj, Map arg1) {
		if (!(obj instanceof WFWorkItem)){
			return;
		}else{
			WFWorkItem workItem = (WFWorkItem)obj;
			System.out.println("更新工作项-状态"+workItem.getCurrentState());
			System.out.println("更新工作项-id"+workItem.getWorkItemID());
			if(workItem.getCurrentState()==10){
				deleteTodo(obj);
				try {
					sendto(obj);
				} catch (UnsupportedEncodingException e) {
					// TODO 自动生成的 catch 块
					e.printStackTrace();
				}
				
			}
			setTodoDone(obj);
			if(workItem.getCurrentState()==13){
				deleteTodo(obj);
			}
		}
	}
	
	private void sendWechat(WFUserObject obj){
		if (!(obj instanceof WFWorkItem)){
			return;
		}else{
			WFWorkItem workItem = (WFWorkItem)obj;
			int state = workItem.getCurrentState();
			//终止流程state=4，是回退或者拽回的时候，不用管
			int pState =2;
			try {
				pState = ServiceFactory.getWFProcessInstManager().getProcessInstState(workItem.getProcessInstID());
			} catch (WFServiceException e1) {
				e1.printStackTrace();
			}
			//当流程处于待领取（4）状态或者运行（10），或流程结束（7）/终止（8）时提示
			if(state==4||state==10||pState==8||pState==7){
				String componentName = "com.primeton.eos.ame_common.flowAttention";
				// 逻辑流名称
				String logicName = "flowAttentionResponse";
				com.eos.engine.component.ILogicComponent comp = com.primeton.ext.engine.component.LogicComponentFactory
						.create(componentName);
				//逻辑流的参数
				Object[] params = { workItem.getProcessInstID(),workItem.getProcessInstName(),workItem.getWorkItemName(),workItem.getWorkItemID(),workItem.getPartiName(),pState };
				//返回值
				Object[] returnValues = null;

				try {
					returnValues = comp.invoke(logicName, params);
				} catch (Throwable e) {
					e.printStackTrace();
				}
				/*//需要判断不是流程的最后一个节点
				Long processInstID = workItem.getProcessInstID();
				//执行之后，参与者已经换成执行人，而不是一个角色
				String userid = workItem.getParticipant();
				List<String> users = new ArrayList<String>();
				try {
					//微信内容
					String content = "流程'"+workItem.getProcessInstName()+"'已经完成了在'"+workItem.getWorkItemName()+"'的环节审批";
					Object[]  notifiers = (Object[])ServiceFactory.getWFRelativeDataManager().getRelativeData(processInstID, "notifiers");
					//存在流程关注人的
					if(notifiers!=null){
						for(int i=0;i<notifiers.length;i++){
							HashMap map = (HashMap)notifiers[0];
							String  user = (String)map.get("id");
							//过滤掉当前操作人本身
							if(!user.equals(userid)){
								users.add(user);
							}
						}
						//判断用户是否存在
						if(!users.isEmpty()){
							String[] ids = new String[users.size()];
							users.toArray(ids);
							//流程关注者
							String toUser =StringUtil.concat("|", ids);
							WeChatUtil.sendWXMsg(toUser, null, null, content, "5");
						}
					}
				} catch (WFServiceException e) {
					e.printStackTrace();
				}*/
			}else{
				//System.out.println("notifyUpdate:state="+state);
			}
			
		}
	}
	
	
	
	
	private void saveOpLog(WFUserObject obj){
		if (!(obj instanceof WFWorkItem)){
			return;
		}else{
			WFWorkItem workItem = (WFWorkItem)obj;
			int state = workItem.getCurrentState();
			//待领取（4）、运行（10）、完成（12）、终止（13）、挂起（8）
			if(state==12||state==13){
				commonj.sdo.DataObject misWork = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_common.ame_common","AmeOperatlog");
				IMUODataContext muo = DataContextManager.current().getMUODataContext();
				String userName = null;
				String userid = null;
				if (muo != null) {
					IUserObject userObject = muo.getUserObject();
					userName = userObject.getUserName();	
					userid = userObject.getUserId();
				}
				try{
					DatabaseExt.getPrimaryKey(misWork);
					misWork.setString("operatefunc", workItem.getActivityInstName());
					misWork.setString("operatefuncmo", workItem.getProcessChName());
					misWork.setString("operator", userName);
					misWork.setString("userid", userid);
					misWork.setDate("operatetime", new Date());
					misWork.setString("operatetype", "L");
					if(state==12){
						misWork.setString("operateinfo", "已执行流程名为“"+workItem.getProcessInstName()+"”的“"+workItem.getWorkItemName()+"”环节");
					}else if(state==13){
						misWork.setString("operateinfo", "已终止流程名为“"+workItem.getProcessInstName()+"”的“"+workItem.getWorkItemName()+"”环节");
					}
					DatabaseUtil.insertEntity("default", misWork);	
				}catch (Throwable e) {
					e.printStackTrace();
				}
			}
		}
	}
	/**
	 * @param args
	 * @throws UnsupportedEncodingException 
	 * @throws AxisFault 
	 */
	public static void sendto(WFUserObject obj) throws UnsupportedEncodingException {
		System.out.println("新增工作项");
		if (!(obj instanceof WFWorkItem)){
			return;
		}else{
			HttpClient httpclient=new DefaultHttpClient();
			//String url = "http://172.17.133.125:8080/ekp/sys/webservice/sysNotifyTodoWebService";
			String url = BusinessDictUtil.getDictName("AME_SYSCONF", "OAURL");//oa待办接口
			String oauser = BusinessDictUtil.getDictName("AME_SYSCONF", "OAUSER");//oa管理员账号
			String oapassword = BusinessDictUtil.getDictName("AME_SYSCONF", "OAPASSWORD");//oa管理员密码
			String amepath = BusinessDictUtil.getDictName("AME_SYSCONF", "AMEPATH");
			WFWorkItem workItem = (WFWorkItem)obj;
			String userid = workItem.getParticipant();//当前环节参与人
			long workitemid = workItem.getWorkItemID();
			String processname = workItem.getProcessInstName();
			String linkurl = amepath+"common/oaLogin.jsp?userId="+userid+"&amp;state=2&amp;workitemid="+workitemid;
		    //String urlEncodee= URLEncoder.encode(linkurl); 
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		    String createtime = sdf.format(new Date());
	        final HttpPost httpPost = new HttpPost(url);
	        String s ="";
	        try {
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
	        		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
	        		Document document=DocumentHelper.parseText(str);
		       		Element root = document.getRootElement();
		       		List<Element> bodys = root.elements();
		       		List<Element> deleteTodoResponse = bodys.get(0).elements();
		       		List<Element> retun = deleteTodoResponse.get(0).elements();
		       		List<Element> returnState = retun.get(0).elements("returnState");
		       		String state = returnState.get(0).getTextTrim();
		       		System.out.println("state"+state);
		       		if("2".equals(state)){
		       		}else{
		       			commonj.sdo.DataObject pushresult = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_common.ame_common","ZhPushresult");
		       			DatabaseExt.getPrimaryKey(pushresult);
		       			pushresult.set("requestmessage",s);
		       			pushresult.set("pushurl",url);
		       			pushresult.set("responsemessage",str);
		       			pushresult.set("createtime",new Date());
		       			DatabaseUtil.insertEntity("default", pushresult);
		       		}
		        } catch (Exception e) {
		        	commonj.sdo.DataObject pushresult = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_common.ame_common","ZhPushresult");
	       			DatabaseExt.getPrimaryKey(pushresult);
	       			pushresult.set("requestmessage",s);
	       			pushresult.set("pushurl",url);
	       			pushresult.set("responsemessage","异常");
	       			pushresult.set("createtime",new Date());
	       			DatabaseUtil.insertEntity("default", pushresult);
		        	e.printStackTrace();
				} finally {
					// 关闭连接,释放资源
					httpclient.getConnectionManager().shutdown();
					
				}
	        }
		
	}
	
	/**
	 * @param args
	 * @throws UnsupportedEncodingException 
	 * @throws AxisFault 
	 * 设为已办
	 */
	public static void setTodoDone(WFUserObject obj) {
		if (!(obj instanceof WFWorkItem)){
			return;
		}else{
			WFWorkItem workItem = (WFWorkItem)obj;
			long workitemid = workItem.getWorkItemID();
			int state = workItem.getCurrentState();
			if(state==12){
				HttpClient httpclient = new DefaultHttpClient();
				//String url = "http://172.17.133.125:8080/ekp/sys/webservice/sysNotifyTodoWebService";
				String url = BusinessDictUtil.getDictName("AME_SYSCONF", "OAURL");
				String oauser = BusinessDictUtil.getDictName("AME_SYSCONF", "OAUSER");
				String oapassword = BusinessDictUtil.getDictName("AME_SYSCONF", "OAPASSWORD");
				String userid = workItem.getParticipant();
				final HttpPost httpPost = new HttpPost(url);
				try {
					String s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\r\n"
							+ "   <soapenv:Header>\r\n"
							+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\r\n"
							+ " <tns:user>"+oauser+"</tns:user>\r\n"
							+ " <tns:password>"+oapassword+"</tns:password>\r\n"
							+ " </tns:RequestSOAPHeader>\r\n"
							+ " </soapenv:Header>\r\n"
							+ "   <soapenv:Body>\r\n"
							+ "      <web:setTodoDone>\r\n"
							+ "         <arg0>\r\n"
							+ "            <appName>企业经营管理系统</appName>\r\n"
							+ "            <modelId>"+workitemid+"</modelId>\r\n"
							+ "            <modelName>企业经营管理系统</modelName>\r\n"
							+ "            <optType>2</optType>\r\n"
							+ "            <targets>{\"LoginName\":\""+userid+"\"}</targets>\r\n"
							+ "         </arg0>\r\n"
							+ "      </web:setTodoDone>\r\n"
							+ "   </soapenv:Body>\r\n"
							+ "</soapenv:Envelope>";	
					
					String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
					Document document=DocumentHelper.parseText(str);
		       		Element root = document.getRootElement();
		       		List<Element> bodys = root.elements();
		       		List<Element> deleteTodoResponse = bodys.get(0).elements();
		       		List<Element> retun = deleteTodoResponse.get(0).elements();
		       		List<Element> returnState = retun.get(0).elements("returnState");
		       		String state1 = returnState.get(0).getTextTrim();
		       		if("2".equals(state1)){
		       		}else{
		       			commonj.sdo.DataObject pushresult = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_common.ame_common","ZhPushresult");
		       			DatabaseExt.getPrimaryKey(pushresult);
		       			pushresult.set("requestmessage",s);
		       			pushresult.set("pushurl",url);
		       			pushresult.set("responsemessage",str);
		       			pushresult.set("createtime",new Date());
		       			DatabaseUtil.insertEntity("default", pushresult);
		       		}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					// 关闭连接,释放资源
					httpclient.getConnectionManager().shutdown();
					
				}
			}
		}
	}
	
	/**
	 * @param args
	 * @throws UnsupportedEncodingException 
	 * @throws AxisFault 
	 * 删除待办
	 */
	public void deleteTodo(WFUserObject obj) {
		System.out.println("删除工作项");
		if (!(obj instanceof WFWorkItem)){
			return;
		}else{
			WFWorkItem workItem = (WFWorkItem)obj;
			long workitemid = workItem.getWorkItemID();
			int state = workItem.getCurrentState();
			String userid = workItem.getParticipant();
			if(state == 13||state == 10){
				HttpClient httpclient = new DefaultHttpClient();
				//String url = "http://172.17.133.125:8080/ekp/sys/webservice/sysNotifyTodoWebService";
				String url = BusinessDictUtil.getDictName("AME_SYSCONF", "OAURL");
				String oauser = BusinessDictUtil.getDictName("AME_SYSCONF", "OAUSER");
				String oapassword = BusinessDictUtil.getDictName("AME_SYSCONF", "OAPASSWORD");
				final HttpPost httpPost = new HttpPost(url);
				try {
					String s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\r\n"
							+ "   <soapenv:Header>\r\n"
							+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\r\n"
							+ " <tns:user>"+oauser+"</tns:user>\r\n"
							+ " <tns:password>"+oapassword+"</tns:password>\r\n"
							+ " </tns:RequestSOAPHeader>\r\n"
							+ " </soapenv:Header>\r\n"
							+ "   <soapenv:Body>\r\n"
							+ "      <web:deleteTodo>\r\n"
							+ "         <arg0>\r\n"
							+ "            <appName>企业经营管理系统</appName>\r\n"
							+ "            <modelId>"+workitemid+"</modelId>\r\n"
							+ "            <modelName>企业经营管理系统</modelName>\r\n"
							+ "            <optType>1</optType>\r\n"
							
							+ "            <type>1</type>\r\n"
							+ "         </arg0>\r\n"
							+ "      </web:deleteTodo>\r\n"
							+ "   </soapenv:Body>\r\n"
							+ "</soapenv:Envelope>";	
					
					String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
					Document document=DocumentHelper.parseText(str);
		       		Element root = document.getRootElement();
		       		List<Element> bodys = root.elements();
		       		List<Element> deleteTodoResponse = bodys.get(0).elements();
		       		List<Element> retun = deleteTodoResponse.get(0).elements();
		       		List<Element> returnState = retun.get(0).elements("returnState");
		       		String state1 = returnState.get(0).getTextTrim();
		       		if("2".equals(state1)){
		       		}else{
		       			commonj.sdo.DataObject pushresult = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_common.ame_common","ZhPushresult");
		       			DatabaseExt.getPrimaryKey(pushresult);
		       			pushresult.set("requestmessage",s);
		       			pushresult.set("pushurl",url);
		       			pushresult.set("responsemessage",str);
		       			pushresult.set("createtime",new Date());
		       			DatabaseUtil.insertEntity("default", pushresult);
		       		}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					// 关闭连接,释放资源
					httpclient.getConnectionManager().shutdown();
				}
			}
		}
	}
	
	public static void main(String[] args) throws Exception {
//		String s = "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
//				+ "<soap:Body>"
//				+ "<ns1:deleteTodoResponse xmlns:ns1=\"http://webservice.notify.sys.kmss.landray.com/\">"
//				+ "<return>"
//				+ "<returnState>2</returnState>"
//				+ "</return>"
//				+ "</ns1:deleteTodoResponse>"
//				+ "</soap:Body>"
//				+ "</soap:Envelope>";
//		
//		 Document document=DocumentHelper.parseText(s);
//		 Element root = document.getRootElement();
//		 List<Element> bodys = root.elements();
//		 List<Element> deleteTodoResponse = bodys.get(0).elements();
//		 List<Element> retun = deleteTodoResponse.get(0).elements();
//		 List<Element> returnState = retun.get(0).elements("returnState");
//		 String state = returnState.get(0).getTextTrim();
//		 System.out.println(state);
		String url = "https://172.17.133.134:443/sys/webservice/sysNotifyTodoWebService";
		String oauser = "jingying";
		String oapassword = "92edb6981700ba6521a99f5bdeaec38e";
		String workitemid = "204483";
		String s = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\r\n"
				+ "   <soapenv:Header>\r\n"
				+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\r\n"
				+ " <tns:user>"+oauser+"</tns:user>\r\n"
				+ " <tns:password>"+oapassword+"</tns:password>\r\n"
				+ " </tns:RequestSOAPHeader>\r\n"
				+ " </soapenv:Header>\r\n"
				+ "   <soapenv:Body>\r\n"
				+ "      <web:deleteTodo>\r\n"
				+ "         <arg0>\r\n"
				+ "            <appName>企业经营管理系统</appName>\r\n"
				+ "            <modelId>"+workitemid+"</modelId>\r\n"
				+ "            <modelName>企业经营管理系统</modelName>\r\n"
				+ "            <optType>1</optType>\r\n"
				
				+ "            <type>1</type>\r\n"
				+ "         </arg0>\r\n"
				+ "      </web:deleteTodo>\r\n"
				+ "   </soapenv:Body>\r\n"
				+ "</soapenv:Envelope>";	
		
		String str= SSLHttpUtils.doPost(url, s, "UTF-8", 60000);
		System.out.println("======"+str);
	}
}
