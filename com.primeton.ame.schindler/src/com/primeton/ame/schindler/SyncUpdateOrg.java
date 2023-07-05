package com.primeton.ame.schindler;

import java.io.ByteArrayInputStream;
import java.math.BigDecimal;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.io.FileUtil;
import cn.hutool.core.lang.Console;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;
import cn.hutool.http.HttpUtil;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.primeton.ame.schindler.ISysSynchroGetOrgWebServiceServiceStub.SysSynchroGetOrgInfoContext;
import com.primeton.ame.schindler.org.AcOperator;
import com.primeton.ame.schindler.org.OmEmployee;
import com.primeton.ame.schindler.org.OmEmporgHis;
import com.primeton.ame.schindler.org.OmOrganization;
import com.primeton.ame.schindler.org.impl.AcOperatorImpl;
import com.primeton.ame.schindler.org.impl.OmEmployeeImpl;
import com.primeton.ame.schindler.org.impl.OmEmporgHisImpl;
import com.primeton.ame.schindler.org.impl.OmOrganizationImpl;

@Bizlet("同步OA更新组织机构信息")
public class SyncUpdateOrg {

	private final static String url = "https://172.17.133.134/sys/webservice/sysSynchroGetOrgWebService?wsdl";

	private final static String oauser = "jingying";

	private final static String oapassword = "92edb6981700ba6521a99f5bdeaec38e";

	@Bizlet("同步OA更新组织机构信息")
	public void syncUpdateOrg() throws Exception {
		Console.log("（≡・ x ・≡）开始执行同步OA操作（≡・ x ・≡）");

		// 工作组信息
		JSONArray groupJsonArray = this.analyzeWsByType("group");

		// 职位信息
		JSONArray postJsonArray = this.analyzeWsByType("post");
		// 机构信息
		JSONArray orgJsonArray = this.analyzeWsByType("org");
		// 部门信息
		JSONArray deptJsonArray = this.analyzeWsByType("dept");

		// 人员信息
		JSONArray personJsonArray = this.analyzeWsByType("person");

		Console.log("（≡・ x ・≡）完成OA的WS信息获取，执行解析操作（≡・ x ・≡）");

		Session dbSession = new Session(DataSourceHelper.getDataSource());

		this.syncGroupAndPost(groupJsonArray, postJsonArray, dbSession);

		Console.log("（≡・ x ・≡）完成了工作组、职位数据的解析同步（≡・ x ・≡）");

		this.syncAccount(personJsonArray, dbSession);

		Console.log("（≡・ x ・≡）完成了登录用户数据的解析同步（≡・ x ・≡）");

		this.syncOrg(orgJsonArray, dbSession);

		Console.log("（≡・ x ・≡）完成了机构数据的解析同步（≡・ x ・≡）");

		this.syncDept(deptJsonArray, dbSession);

		Console.log("（≡・ x ・≡）完成了部门数据的解析同步（≡・ x ・≡）");

		this.syncEmp(personJsonArray, dbSession);

		Console.log("（≡・ x ・≡）完成了员工数据的解析同步（≡・ x ・≡）");

		Console.log("（≡・ x ・≡）同步OA操作执行完成（≡・ x ・≡）");

	}

	// 根据提供的类型解析获取WS数据
	private JSONArray analyzeWsByType(String type) throws Exception {
		SysSynchroGetOrgInfoContext context = new SysSynchroGetOrgInfoContext();
		context.setReturnOrgType("[{\"type\":\"" + type + "\"}]");
		context.setCount(100000);
		context.setBeginTimeStamp("");
		String soapStr = "<soapenv:Envelope xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:web=\"http://webservice.notify.sys.kmss.landray.com/\">\n"
				+ "  <soapenv:Header>\n" + "   <tns:RequestSOAPHeader xmlns:tns=\"http://sys.webservice.client\">\n" + " <tns:user>"
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
				+ "         </arg0>\n" + "      </web:getUpdatedElements>\n" + "   </soapenv:Body>\n" + "</soapenv:Envelope>";
		String result = HttpUtil.post(url, soapStr);
		SAXReader saxReader = new SAXReader();
		Document doc = saxReader.read(new ByteArrayInputStream(result.getBytes("UTF-8")));
		Element rootElement = doc.getRootElement();
		Element bodyElement = rootElement.element("Body");
		Element paramElement = null;
		if (bodyElement != null) {
			paramElement = bodyElement.element("getUpdatedElementsResponse");
		} else {
			paramElement = (Element) rootElement.clone();
		}
		Element itemElement = paramElement.element("return");
		String messgeString = itemElement.elementText("message");
		return JSONUtil.parseArray(messgeString);
	}

	// 同步工作组和职位
	private void syncGroupAndPost(JSONArray groupJsonArray, JSONArray postJsonArray, Session dbSession) throws Exception {
		for (int i = 0; i < groupJsonArray.size(); i++) {
			JSONObject groupObj = groupJsonArray.getJSONObject(i);
			Entity entity = new Entity("OM_OA_GROUP_POST");
			entity.set("id", groupObj.getStr("id"));
			entity.set("name", groupObj.getStr("name"));
			entity.set("org_type", groupObj.getStr("type"));
			entity.set("hierarchyId", groupObj.getStr("hierarchyId"));
			entity.set("isAvailable", groupObj.getStr("isAvailable"));
			entity.set("parent", null);
			entity.set("persons", null);
			entity.set("members", groupObj.getStr("members", null));
			entity.set("alterTime", groupObj.getStr("alterTime"));
			dbSession.insertOrUpdate(entity, "id");
		}
		for (int i = 0; i < postJsonArray.size(); i++) {
			JSONObject postObj = postJsonArray.getJSONObject(i);
			Entity entity = new Entity("OM_OA_GROUP_POST");
			entity.set("id", postObj.getStr("id"));
			entity.set("name", postObj.getStr("name"));
			entity.set("org_type", postObj.getStr("type"));
			entity.set("hierarchyId", postObj.getStr("hierarchyId"));
			entity.set("isAvailable", postObj.getStr("isAvailable"));
			entity.set("parent", postObj.getStr("parent", null));
			entity.set("persons", postObj.getStr("persons", null));
			entity.set("members", null);
			entity.set("alterTime", postObj.getStr("alterTime"));
			dbSession.insertOrUpdate(entity, "id");
		}
	}

	// 同步登陆帐号
	private void syncAccount(JSONArray personJsonArray, Session dbSession) throws Exception {
		String querySql = "SELECT * FROM AC_OPERATOR WHERE USERID = ?";
		for (int i = 0; i < personJsonArray.size(); i++) {
			JSONObject personObj = personJsonArray.getJSONObject(i);
			String userId = personObj.getStr("loginName");
			Entity entity = dbSession.queryOne(querySql, userId);
			if (ObjectUtil.isNotNull(entity)) {
				entity.set("OPERATORNAME", personObj.getStr("name"));
				if (personObj.getBool("isAvailable", false)) {
					entity.set("STATUS", "running");
				} else {
					entity.set("STATUS", "stop");
				}
				if (StrUtil.equals(userId, "admin") || StrUtil.equals(userId, "cs997") || StrUtil.equals(userId, "0cs1") || StrUtil.equals(userId, "0cs2")
						|| StrUtil.equals(userId, "zbqt") || StrUtil.equals(userId, "0cs3") || StrUtil.equals(userId, "lyunwei") || StrUtil.equals(userId, "cncc1508")
						|| StrUtil.equals(userId, "hjcs") || StrUtil.equals(userId, "cs1") || StrUtil.equals(userId, "cs2") || StrUtil.equals(userId, "cs3")
						|| StrUtil.equals(userId, "C001") || StrUtil.equals(userId, "zhangxj")) {
					entity.set("STATUS", "stop");
				}
				entity.set("UNLOCKTIME", personObj.getStr("alterTime"));
				entity.set("PAGESTYLE", personObj.getStr("posts", null));
				entity.set("FILE_PATH", personObj.getStr("id"));
				dbSession.update(entity, new Entity("AC_OPERATOR").set("USERID", userId));
			} else {
				if (personObj.getBool("isAvailable", false)) {
					AcOperator impl = new AcOperatorImpl();
					DatabaseExt.getPrimaryKey(impl);
					impl.setUserid(personObj.getStr("loginName"));
					impl.setPassword("Q3qtuxGsI7B5u60nFMu+qA==");
					impl.setOperatorname(personObj.getStr("name"));
					impl.setAuthmode("local");
					impl.setStatus("running");
					impl.setUnlocktime(personObj.getDate("alterTime"));
					impl.setMenutype("default");
					impl.setPagestyle(personObj.getStr("posts", null));
					impl.setFilePath(personObj.getStr("id"));
					DatabaseUtil.insertEntity("default", impl);
				}
			}
		}
	}

	// 同步机构
	private void syncOrg(JSONArray orgJsonArray, Session dbSession) throws Exception {
		String querySql = "SELECT * FROM OM_ORGANIZATION WHERE WEBURL = ?";
		for (int i = 0; i < orgJsonArray.size(); i++) {
			JSONObject orgObj = orgJsonArray.getJSONObject(i);
			String id = orgObj.getStr("id");
			Entity entity = dbSession.queryOne(querySql, id);
			if (ObjectUtil.isNotNull(entity)) {
				entity.set("ORGNAME", orgObj.getStr("name"));
				dbSession.update(entity, new Entity("OM_ORGANIZATION").set("WEBURL", id));
			}
		}
	}

	private void syncDept(JSONArray deptJsonArray, Session dbSession) throws Exception {
		String querySql = "SELECT * FROM OM_ORGANIZATION WHERE WEBURL = ?";
		for (int i = 0; i < deptJsonArray.size(); i++) {
			JSONObject deptObj = deptJsonArray.getJSONObject(i);
			String id = deptObj.getStr("id");
			Entity entity = dbSession.queryOne(querySql, id);
			if (ObjectUtil.isNull(entity) && deptObj.getBool("isAvailable").booleanValue()) {
				OmOrganization impl = new OmOrganizationImpl();
				DatabaseExt.getPrimaryKey(impl);
				impl.setOrgcode(impl.getString("orgid"));
				impl.setOrgname(deptObj.getStr("name"));
				impl.setOrgtype("1");
				impl.setWeburl(id);
				impl.setStatus("running");
				impl.setCreatetime(DateUtil.date());
				if (StrUtil.isNotBlank(deptObj.getStr("order"))) {
					impl.setSortno(deptObj.getInt("order"));
				}
				DatabaseUtil.insertEntity("default", impl);
			}
		}
		String branchOfficeSql = "SELECT members FROM OM_OA_GROUP_POST WHERE name = '分公司' AND org_type='group'";
		Entity branchOfficeEntity = dbSession.queryOne(branchOfficeSql);
		JSONArray branchOfficeArray = JSONUtil.parseArray(branchOfficeEntity.getStr("members"));
		for (int i = 0; i < deptJsonArray.size(); i++) {
			JSONObject deptObj = deptJsonArray.getJSONObject(i);
			String id = deptObj.getStr("id");
			Entity entity = dbSession.queryOne(querySql, id);
			if (ObjectUtil.isNotNull(entity)) {
				if (deptObj.getBool("isAvailable").booleanValue()) {
					entity.set("ORGNAME", deptObj.getStr("name"));
					entity.set("ORGLEVEL", this.getOrgLevel(deptObj.getStr("hierarchyId")));
					entity.set("ORGDEGREE", this.getOrgdegree(branchOfficeArray, id, deptObj.getStr("hierarchyId")));
					String parentOrgId = this.getParentOrgId(deptObj.getStr("parent"), dbSession);
					if (StrUtil.isNotBlank(parentOrgId)) {
						entity.set("PARENTORGID", parentOrgId);
					}
					String orgSeq = this.getOrgSeq(deptObj.getStr("hierarchyId"), dbSession);
					if (StrUtil.isNotBlank(orgSeq)) {
						entity.set("ORGSEQ", orgSeq);
					}
					if (StrUtil.equals(deptObj.getStr("name"), "公司前台")) {
						entity.set("STATUS", "cancel");
					} else {
						entity.set("STATUS", "running");
					}
					String managerId = this.getManager(deptObj.getStr("thisLeader"), dbSession);
					if (StrUtil.isNotBlank(managerId)) {
						entity.set("MANAGERID", managerId);
					}
					String repleaderId = this.getRepleader(deptObj.getStr("superLeader"), dbSession);
					if (StrUtil.isNotBlank(repleaderId)) {
						entity.set("REPLEADER", repleaderId);
					}
					entity.set("JUDGE", this.getJudge(branchOfficeArray, deptObj.getStr("hierarchyId")));
					entity.set("APPROLEVEL", this.getApprolevel(branchOfficeArray, id, deptObj.getStr("hierarchyId")));
					if (StrUtil.isNotBlank(deptObj.getStr("order"))) {
						entity.set("SORTNO", deptObj.getStr("order"));
					}
					entity.set("LASTUPDATE", deptObj.getDate("alterTime"));
					dbSession.update(entity, new Entity("OM_ORGANIZATION").set("WEBURL", id));
				} else {
					entity.set("ORGNAME", deptObj.getStr("name"));
					entity.set("STATUS", "cancel");
					entity.set("LASTUPDATE", deptObj.getDate("alterTime"));
					dbSession.update(entity, new Entity("OM_ORGANIZATION").set("WEBURL", id));
				}
			}
		}
	}

	private void syncEmp(JSONArray personJsonArray, Session dbSession) throws Exception {
		String querySql = "SELECT * FROM OM_EMPLOYEE WHERE EMPCODE = ?";
		for (int i = 0; i < personJsonArray.size(); i++) {
			JSONObject personObj = personJsonArray.getJSONObject(i);
			String empCode = personObj.getStr("loginName");
			Entity entity = dbSession.queryOne(querySql, empCode);
			if (ObjectUtil.isNotNull(entity)) {
				if (personObj.getBool("isAvailable", false).booleanValue()) {
					entity.set("TAG", personObj.getStr("id"));
					if (StrUtil.equals(empCode, "admin") || StrUtil.equals(empCode, "cs997") || StrUtil.equals(empCode, "0cs1") || StrUtil.equals(empCode, "0cs2")
							|| StrUtil.equals(empCode, "zbqt") || StrUtil.equals(empCode, "0cs3") || StrUtil.equals(empCode, "lyunwei")
							|| StrUtil.equals(empCode, "cncc1508") || StrUtil.equals(empCode, "hjcs") || StrUtil.equals(empCode, "cs1") || StrUtil.equals(empCode, "cs2")
							|| StrUtil.equals(empCode, "cs3") || StrUtil.equals(empCode, "C001") || StrUtil.equals(empCode, "zhangxj")) {
						entity.set("EMPSTATUS", "leave");
					} else {
						entity.set("EMPSTATUS", "on");
					}
					entity.set("EMPNAME", personObj.getStr("name"));
					String orgCode = this.getEmpOrg(personObj.getStr("parent"), dbSession);
					if (StrUtil.isNotBlank(orgCode)) {
						entity.set("ORGID", orgCode);
					}
					entity.set("LASTMODYTIME", personObj.getStr("alterTime"));
					dbSession.update(entity, new Entity("OM_EMPLOYEE").set("EMPCODE", empCode));
				} else {
					entity.set("TAG", personObj.getStr("id"));
					entity.set("EMPSTATUS", "leave");
					entity.set("LASTMODYTIME", personObj.getStr("alterTime"));
					dbSession.update(entity, new Entity("OM_EMPLOYEE").set("EMPCODE", empCode));
				}
			} else {
				if (personObj.getBool("isAvailable", false)) {
					OmEmployee impl = new OmEmployeeImpl();
					DatabaseExt.getPrimaryKey(impl);
					impl.setEmpcode(empCode);
					impl.setOperatorid(this.getEmpOperatorId(empCode, dbSession));
					impl.setUserid(empCode);
					impl.setEmpname(personObj.getStr("name"));
					impl.setGender("n");
					impl.setEmpstatus("on");
					impl.setCardtype("id");
					impl.setCreatetime(DateUtil.date());
					String orgCode = this.getEmpOrg(personObj.getStr("parent"), dbSession);
					if (StrUtil.isNotBlank(orgCode)) {
						impl.setOrgid(new BigDecimal(orgCode));
					}
					impl.setEmptype("1");
					impl.setTag(personObj.getStr("id"));
					DatabaseUtil.insertEntity("default", impl);
				}
			}
		}
		String queryEmpAllSql = "SELECT EMPID, EMPCODE, ORGID, EMPSTATUS FROM OM_EMPLOYEE";
		List<Entity> emps = dbSession.query(queryEmpAllSql);
		dbSession.execute("DELETE FROM OM_EMPORG WHERE EMPID IN (select EMPID from OM_EMPORG group by EMPID having count(EMPID)>1)");
		dbSession.execute("DELETE FROM OM_EMPORG_HIS WHERE EMPID IN (select EMPID from OM_EMPORG_HIS group by EMPID having count(EMPID)>1)");
		for (Entity emp : emps) {
			if (StrUtil.isNotBlank(emp.getStr("ORGID"))) {
				String queryEmpOrgSql = "SELECT * FROM OM_EMPORG WHERE EMPID = ?";
				String queryEmpHisSql = "SELECT * FROM OM_EMPORG_HIS WHERE EMPID = ?";
				Entity empOrgEntity = dbSession.queryOne(queryEmpOrgSql, emp.getStr("EMPID"));
				Entity empHisEntity = dbSession.queryOne(queryEmpHisSql, emp.getStr("EMPID"));
				if (ObjectUtil.isNotNull(empOrgEntity)) {
					empOrgEntity.set("ORGID", emp.getStr("ORGID"));
					dbSession.update(empOrgEntity, new Entity("OM_EMPORG").set("EMPID", emp.getStr("EMPID")));
				} else {
					Entity newEmpOrgEntity = new Entity("OM_EMPORG");
					newEmpOrgEntity.set("ORGID", emp.getStr("ORGID"));
					newEmpOrgEntity.set("EMPID", emp.getStr("EMPID"));
					newEmpOrgEntity.set("ISMAIN", "y");
					newEmpOrgEntity.set("EMPPROP", "1.0");
					dbSession.insert(newEmpOrgEntity);
				}
				if (ObjectUtil.isNotNull(empHisEntity)) {
					empHisEntity.set("ORGID", emp.getStr("ORGID"));
					empHisEntity.set("CURRSTATE", emp.getStr("EMPSTATUS"));
					dbSession.update(empHisEntity, new Entity("OM_EMPORG_HIS").set("EMPID", emp.getStr("EMPID")));
				} else {
					OmEmporgHis impl = new OmEmporgHisImpl();
					DatabaseExt.getPrimaryKey(impl);
					impl.setEmpid(emp.getBigDecimal("EMPID"));
					impl.setOrgid(emp.getBigDecimal("ORGID"));
					impl.setCurrstate(emp.getStr("EMPSTATUS"));
					impl.setNature("0");
					impl.setOperattime(DateUtil.date());
					DatabaseUtil.insertEntity("default", impl);
				}
			}
		}
	}

	private int getOrgLevel(String hierarchyId) {
		if (StrUtil.equals(hierarchyId, "0")) {
			return 2;
		} else {
			return StrUtil.count(hierarchyId, "x") - 1;
		}
	}

	private String getParentOrgId(String parent, Session dbSession) throws Exception {
		if (StrUtil.isNotBlank(parent)) {
			String querySql = "SELECT * FROM OM_ORGANIZATION WHERE WEBURL = ?";
			Entity entity = dbSession.queryOne(querySql, parent);
			if (ObjectUtil.isNotNull(entity)) {
				return entity.getStr("ORGID");
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

	private String getOrgSeq(String hierarchyId, Session dbSession) throws Exception {
		List<String> ids = StrUtil.split(hierarchyId, "x", true, true);
		String querySql = "SELECT * FROM OM_ORGANIZATION WHERE WEBURL = ?";
		String orgSeq = ".";
		for (String id : ids) {
			Entity entity = dbSession.queryOne(querySql, id);
			if (ObjectUtil.isNotNull(entity)) {
				orgSeq = StrUtil.concat(false, orgSeq, entity.getStr("ORGID"), ".");
			}
		}
		if (StrUtil.equals(".", orgSeq)) {
			return null;
		} else {
			return orgSeq;
		}
	}

	private String getManager(String thisLeader, Session dbSession) throws Exception {
		if (StrUtil.isNotBlank(thisLeader)) {
			String querySql = "SELECT id FROM OM_OA_GROUP_POST WHERE id = ?";
			Entity entity = dbSession.queryOne(querySql, thisLeader);
			if (ObjectUtil.isNotNull(entity)) {
				String sql = "SELECT * FROM AC_OPERATOR WHERE PAGESTYLE LIKE ?";
				Entity leader = dbSession.queryOne(sql, "%" + thisLeader + "%");
				if (ObjectUtil.isNotNull(leader)) {
					String empSql = "SELECT * FROM OM_EMPLOYEE WHERE OPERATORID = ?";
					Entity emp = dbSession.queryOne(empSql, leader.getStr("OPERATORID"));
					if (ObjectUtil.isNotNull(emp)) {
						return emp.getStr("EMPID");
					} else {
						return null;
					}
				} else {
					return null;
				}
			} else {
				String sql = "SELECT * FROM AC_OPERATOR WHERE FILE_PATH = ?";
				Entity leader = dbSession.queryOne(sql, thisLeader);
				if (ObjectUtil.isNotNull(leader)) {
					String empSql = "SELECT * FROM OM_EMPLOYEE WHERE OPERATORID = ?";
					Entity emp = dbSession.queryOne(empSql, leader.getStr("OPERATORID"));
					if (ObjectUtil.isNotNull(emp)) {
						return emp.getStr("EMPID");
					} else {
						return null;
					}
				} else {
					return null;
				}
			}
		} else {
			return null;
		}
	}

	private String getRepleader(String superLeader, Session dbSession) throws Exception {
		if (StrUtil.isNotBlank(superLeader)) {
			String querySql = "SELECT id FROM OM_OA_GROUP_POST WHERE id = ?";
			Entity entity = dbSession.queryOne(querySql, superLeader);
			if (ObjectUtil.isNotNull(entity)) {
				String sql = "SELECT * FROM AC_OPERATOR WHERE PAGESTYLE LIKE ?";
				Entity leader = dbSession.queryOne(sql, "%" + superLeader + "%");
				if (ObjectUtil.isNotNull(leader)) {
					return leader.getStr("USERID");
				} else {
					return null;
				}
			} else {
				String sql = "SELECT * FROM AC_OPERATOR WHERE FILE_PATH = ?";
				Entity leader = dbSession.queryOne(sql, superLeader);
				if (ObjectUtil.isNotNull(leader)) {
					return leader.getStr("USERID");
				} else {
					return null;
				}
			}
		} else {
			return null;
		}
	}

	private String getEmpOrg(String parent, Session dbSession) throws Exception {
		if (StrUtil.isNotBlank(parent)) {
			String querySql = "SELECT * FROM OM_ORGANIZATION WHERE WEBURL = ?";
			Entity entity = dbSession.queryOne(querySql, parent);
			if (ObjectUtil.isNotNull(entity)) {
				return entity.getStr("ORGCODE");
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

	private BigDecimal getEmpOperatorId(String empCode, Session dbSession) throws Exception {
		String querySql = "SELECT * FROM AC_OPERATOR WHERE USERID = ?";
		Entity entity = dbSession.queryOne(querySql, empCode);
		return entity.getBigDecimal("OPERATORID");
	}

	private String getOrgdegree(JSONArray branchOfficeArray, String id, String hierarchyId) {
		for (int i = 0; i < branchOfficeArray.size(); i++) {
			String branch = branchOfficeArray.get(i, String.class);
			if (StrUtil.equals(branch, id)) {
				return "2";
			}
			if (StrUtil.contains(hierarchyId, branch)) {
				return "5";
			}
		}
		return "4";
	}

	private String getJudge(JSONArray branchOfficeArray, String hierarchyId) {
		for (int i = 0; i < branchOfficeArray.size(); i++) {
			String branch = branchOfficeArray.get(i, String.class);
			if (StrUtil.contains(hierarchyId, branch)) {
				return "2";
			}
		}
		return "1";
	}

	private String getApprolevel(JSONArray branchOfficeArray, String id, String hierarchyId) {
		for (int i = 0; i < branchOfficeArray.size(); i++) {
			String branch = branchOfficeArray.get(i, String.class);
			if (StrUtil.equals(branch, id)) {
				return "3";
			}
			if (StrUtil.contains(hierarchyId, branch)) {
				return "1";
			}
		}
		return "3";
	}

}
