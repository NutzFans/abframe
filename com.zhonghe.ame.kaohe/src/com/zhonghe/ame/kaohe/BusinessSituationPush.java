package com.zhonghe.ame.kaohe;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.eoscommon.BusinessDictUtil;
import com.eos.runtime.core.TraceLoggerFactory;
import com.eos.system.annotation.Bizlet;
import com.eos.system.logging.Logger;
import com.primeton.eos.ame_common.SSLHttpUtils;

@Bizlet("经营情况推送到OA待办工具类")
public class BusinessSituationPush {

	Logger logger = TraceLoggerFactory.getLogger(this.getClass());

	@Bizlet("发送待办")
	public String sendTodo(String chartId) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		// 查询字典获取要推送的角色
		String queryDictSql = "SELECT DICTID FROM EOS_DICT_ENTRY WHERE DICTTYPEID = 'CHART_PUSH'";
		// 根据角色获取要推送的用户
		String queryUserByRole = "SELECT ao.USERID AS userCode, ao.OPERATORNAME AS userName FROM AC_OPERATORROLE AS aor , AC_OPERATOR AS ao WHERE ao.OPERATORID = aor.OPERATORID AND aor.ROLEID = ?";
		// 获取统计图表的信息
		String queryChartSql = "SELECT id, chart_name FROM zh_kaohe_company_chart WHERE id = ?";
		// 更新统计图表推送的状态
		String updateChartSql = "UPDATE zh_kaohe_company_chart SET push_status = ? WHERE id = ?";

		// 获取统计图表的信息
		Entity chartEntity = dbSession.queryOne(queryChartSql, chartId);
		// 获取推送用户集合
		List<Entity> roleDictList = dbSession.query(queryDictSql);
		List<Entity> userEntityList = new ArrayList<Entity>();
		for (Entity role : roleDictList) {
			List<Entity> users = dbSession.query(queryUserByRole, role.getStr("DICTID"));
			userEntityList.addAll(users);
		}
		userEntityList = this.distinctByKey(userEntityList, entity -> entity.getStr("userCode"));

		// oa待办接口
		String url = BusinessDictUtil.getDictName("AME_SYSCONF", "OAURL");
		// oa管理员账号
		String oauser = BusinessDictUtil.getDictName("AME_SYSCONF", "OAUSER");
		// oa管理员密码
		String oapassword = BusinessDictUtil.getDictName("AME_SYSCONF", "OAPASSWORD");
		// 请求地址前缀
		String amepath = BusinessDictUtil.getDictName("AME_SYSCONF", "AMEPATH");

		// 用户推送成功计数
		int pushSuccessCount = 0;
		// 推送反馈信息集合
		List<Entity> chartPushInfoList = new ArrayList<Entity>();

		// 遍历用户进行推送
		for (Entity userEntity : userEntityList) {
			Entity chartPushInfo = new Entity("zh_kaohe_company_chart_push");
			// 执行推送
			boolean status = this.executeSendTodo(url, oauser, oapassword, amepath, userEntity.getStr("userCode"), chartId, chartEntity.getStr("chart_name"));
			chartPushInfo.set("id", IdUtil.objectId());
			chartPushInfo.set("chart_id", chartId);
			chartPushInfo.set("user_code", userEntity.getStr("userCode"));
			chartPushInfo.set("user_name", userEntity.getStr("userName"));
			chartPushInfo.set("push_time", DateUtil.date());
			chartPushInfo.set("push_status", status ? "成功" : "失败");
			chartPushInfo.set("read_status", "未阅");
			chartPushInfoList.add(chartPushInfo);
			pushSuccessCount = status ? pushSuccessCount + 1 : pushSuccessCount;
		}

		if (pushSuccessCount == 0) {
			return "推送失败！请联系系统管理员";
		} else {
			// 存储推送反馈信息
			dbSession.insert(chartPushInfoList);
			// 全部推送成功
			if (pushSuccessCount == userEntityList.size()) {
				dbSession.execute(updateChartSql, "已推送", chartId);
				return "1";
			} else {
				dbSession.execute(updateChartSql, "已推送(部分成功)", chartId);
				return "部分用户推送成功！具体查看推送反馈详情";
			}
		}
	}

	/**
	 * 执行待办推送操作
	 */
	private boolean executeSendTodo(String url, String oauser, String oapassword, String amepath, String userCode, String chartId, String chartName) {
		try {
			// 待办超链接
			String linkurl = amepath + "common/oaLogin.jsp?userId=" + userCode + "&amp;state=3&amp;chartid=" + chartId;
			// soap消息
			String content = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n" + "  <soapenv:Header>\n"
					+ "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n" + " <tns:user>"
					+ oauser
					+ "</tns:user>\n"
					+ " <tns:password>"
					+ oapassword
					+ "</tns:password>\n"
					+ " </tns:RequestSOAPHeader>\n"
					+ "</soapenv:Header>\n"
					+ "   <soapenv:Body>\n"
					+ "      <web:sendTodo>\n"
					+ "         <arg0>\n"
					+ "            <appName>企业经营管理系统</appName>\n"
					+ "            <createTime>"
					+ DateUtil.now()
					+ "</createTime>\n"
					+ "            <link>"
					+ linkurl
					+ "</link>\n"
					+ "            <modelId>"
					+ chartId
					+ "</modelId>\n"
					+ "            <modelName>企业经营管理系统</modelName>\n"
					+ "            <subject>"
					+ "企业发展部戈乔发起的"
					+ chartName
					+ "</subject>\n"
					+ "            <targets>{\"LoginName\":\""
					+ userCode
					+ "\"}</targets>\n"
					+ "            <type>1</type>\n"
					+ "         </arg0>\n"
					+ "      </web:sendTodo>\n" + "   </soapenv:Body>\n" + "</soapenv:Envelope>";
			// 发起推送并返回结果
			String response = SSLHttpUtils.doPost(url, content, "UTF-8", 60000);
			return this.isPushSuccess(response);
		} catch (Exception e) {
			logger.error("统计图表推送异常", e);
			return false;
		}
	}

	@Bizlet("完成待办")
	public String sendTodoDone(String chartId, String userId) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		// 更新推送反馈信息
		String updatePushInfoSql = "UPDATE zh_kaohe_company_chart_push SET read_time = ?, read_status = ? WHERE chart_id = ? AND user_code = ?";

		// oa待办接口
		String url = BusinessDictUtil.getDictName("AME_SYSCONF", "OAURL");
		// oa管理员账号
		String oauser = BusinessDictUtil.getDictName("AME_SYSCONF", "OAUSER");
		// oa管理员密码
		String oapassword = BusinessDictUtil.getDictName("AME_SYSCONF", "OAPASSWORD");

		// 执行待办完成推送
		boolean status = this.executeSendTodoDone(url, oauser, oapassword, userId, chartId);

		if (status) {
			dbSession.execute(updatePushInfoSql, DateUtil.now(), "已阅", chartId, userId);
			return "1";
		} else {
			return "2";
		}
	}

	/**
	 * 完成待办推送
	 */
	private boolean executeSendTodoDone(String url, String oauser, String oapassword, String userCode, String chartId) {
		try {
			String content = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\r\n"
					+ "   <soapenv:Header>\r\n" + "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\r\n" + " <tns:user>"
					+ oauser
					+ "</tns:user>\r\n"
					+ " <tns:password>"
					+ oapassword
					+ "</tns:password>\r\n"
					+ " </tns:RequestSOAPHeader>\r\n"
					+ " </soapenv:Header>\r\n"
					+ "   <soapenv:Body>\r\n"
					+ "      <web:setTodoDone>\r\n"
					+ "         <arg0>\r\n"
					+ "            <appName>企业经营管理系统</appName>\r\n"
					+ "            <modelId>"
					+ chartId
					+ "</modelId>\r\n"
					+ "            <modelName>企业经营管理系统</modelName>\r\n"
					+ "            <optType>2</optType>\r\n"
					+ "            <targets>{\"LoginName\":\""
					+ userCode
					+ "\"}</targets>\r\n"
					+ "         </arg0>\r\n" + "      </web:setTodoDone>\r\n" + "   </soapenv:Body>\r\n" + "</soapenv:Envelope>";
			// 发起完成待办推送并返回结果
			String response = SSLHttpUtils.doPost(url, content, "UTF-8", 60000);
			return this.isPushSuccess(response);
		} catch (Exception e) {
			logger.error("统计图表完成待办异常", e);
			return false;
		}
	}

	@Bizlet("指定用户待办是否完成")
	public String completeTheTodo(String chartId, String userId) {
		try {
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			// 查询是否已完成待办
			String querySql = "SELECT * FROM zh_kaohe_company_chart_push WHERE read_status = '已阅' AND chart_id = ? AND user_code = ?";
			Entity entity = dbSession.queryOne(querySql, chartId, userId);
			if (entity != null) {
				return "1";
			} else {
				return "2";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "2";
		}
	}

	@Bizlet("指定用户推送")
	public String sendTodoByPushInfo(String pushInfoId) throws Exception {
		Session dbSession = new Session(DataSourceHelper.getDataSource());
		// 查询推送信息表
		String querySql = "SELECT zkccp.chart_id, zkcc.chart_name, zkccp.user_code FROM zh_kaohe_company_chart_push AS zkccp, zh_kaohe_company_chart AS zkcc WHERE zkccp.chart_id = zkcc.id AND zkccp.id = ?";
		// 更新推送信息
		String updatePushInfoSql = "UPDATE zh_kaohe_company_chart_push SET push_time = ?, push_status = ? WHERE id = ?";
		// 查询推送失败的数据
		String querFailSql = "SELECT * FROM zh_kaohe_company_chart_push WHERE push_status = '失败' AND chart_id = ?";
		//
		String updateChartSql = "UPDATE zh_kaohe_company_chart SET push_status = ? WHERE id = ？";

		Entity pushInfo = dbSession.queryOne(querySql, pushInfoId);

		// oa待办接口
		String url = BusinessDictUtil.getDictName("AME_SYSCONF", "OAURL");
		// oa管理员账号
		String oauser = BusinessDictUtil.getDictName("AME_SYSCONF", "OAUSER");
		// oa管理员密码
		String oapassword = BusinessDictUtil.getDictName("AME_SYSCONF", "OAPASSWORD");
		// 请求地址前缀
		String amepath = BusinessDictUtil.getDictName("AME_SYSCONF", "AMEPATH");

		boolean status = this.executeSendTodo(url, oauser, oapassword, amepath, pushInfo.getStr("user_code"), pushInfo.getStr("chart_id"), pushInfo.getStr("chart_name"));

		if (status) {
			dbSession.execute(updatePushInfoSql, DateUtil.now(), "成功", pushInfoId);
			List<Entity> pushFailList = dbSession.query(querFailSql, pushInfo.getStr("chart_id"));
			if (pushFailList != null && pushFailList.size() > 0) {
				// 还存在失败数据，不能修改主表的推送状态
			} else {
				dbSession.execute(updateChartSql, "已推送", pushInfo.getStr("chart_id"));
			}
			return "1";
		} else {
			return "2";
		}
	}

	/**
	 * 通用的去重方法，根据对象的指定属性进行去重
	 */
	private <T, K> List<T> distinctByKey(List<T> list, Function<? super T, K> keyExtractor) {
		Map<K, T> map = list.stream().collect(Collectors.toMap(keyExtractor, // 使用指定属性作为键
				Function.identity(), // 值就是对象本身
				(existing, replacement) -> existing // 冲突时保留第一个出现的元素
				));
		return new ArrayList<>(map.values());
	}

	/**
	 * 解析响应结果判断是否推送成功
	 */
	private boolean isPushSuccess(String response) {
		try {
			Document document = DocumentHelper.parseText(response);
			Element root = document.getRootElement();
			List<Element> bodys = root.elements();
			List<Element> deleteTodoResponse = bodys.get(0).elements();
			List<Element> retun = deleteTodoResponse.get(0).elements();
			List<Element> returnState = retun.get(0).elements("returnState");
			String state = returnState.get(0).getTextTrim();
			if ("2".equals(state)) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

}
