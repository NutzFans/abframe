/**
 * 
 */
package com.primeton.eos.ame_common;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

/**
 * @author zhx
 * @date 2016-07-14 17:05:09
 *
 */
@Bizlet("")
public class AmeAuth {

	/**
	 * @param rolemap
	 *            (key为页面上所需要的变量名，value为该角色对应的roleid 支持多个角色，多个角色以","隔开。)
	 * @param roles
	 *            （当前用户所拥有的角色）
	 * @return rolemap(key为页面上所需要的变量名，value值会以true，false的形式输出)
	 * @author zhx
	 */
	@Bizlet("")
	public static HashMap judgeRole(HashMap rolemap, DataObject[] roles) {
		for (int i = 0; i < roles.length; i++) {
			Iterator iter = rolemap.entrySet().iterator();
			while (iter.hasNext()) {
				Map.Entry entry = (Map.Entry) iter.next();
				Object key = entry.getKey();
				Object val = entry.getValue();
				if (val.toString().equals("true")) {
				} else {
					if (val.toString().contains(roles[i].getString("roleid"))) {// 当含有这个角色时将value值改为true
						rolemap.put(key, true);
					}
				}
			}
		}
		Iterator iter = rolemap.entrySet().iterator();
		while (iter.hasNext()) {
			Map.Entry entry = (Map.Entry) iter.next();
			Object key = entry.getKey();
			Object val = entry.getValue();
			if (val.toString().equals("true")) {
			} else {
				rolemap.put(key, false);
			}
		}
		return rolemap;
	}

	/**
	 * @param userid
	 *            (用户id。)
	 * @param orgseqs
	 *            （当前用户所在部门的orgseq）
	 * @return reorgseq(以数组形式返回所拥有权限的机构的orgseq)
	 * @author zhx
	 */
	@Bizlet("")
	public static String[] getOwnOrg(String userid, Object[] orgseqs) {
		int len = orgseqs.length;
		String[] reorgseq = new String[len];
		for (int i = 0; i < len; i++) {
			DataObject orgseqTemp = (DataObject) orgseqs[i];
			String orgseq = orgseqTemp.getString("orgseq");
			String[] orgs = orgseq.split(",");
			for (int j = 0; j < orgs.length; j++) {
				commonj.sdo.DataObject org = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_common.ame_common", "OmOrganizationView");
				org.set("fzrid", userid);
				org.set("orgid", orgs[i]);
				int conts = DatabaseUtil.expandEntityByTemplate("default", org, org);
				if (conts != 0) {
					int len1 = reorgseq.length;
					reorgseq[len1 + 1] = org.getString("orgseq");
					break;
				}
			}
		}
		return reorgseq;
	}

	/**
	 * @param userid
	 *            (用户id。)
	 * @param orgseqs
	 *            （当前用户所在部门的orgseq）
	 * @return reorgseq(以数组形式返回所拥有权限的机构的orgseq)
	 * @author zhx
	 */
	@Bizlet("")
	public static String getAuthLevel(String userid, DataObject[] auth, DataObject[] orgs, DataObject[] role) {
		String orglevel = "";
		for (int i = 0; i < auth.length; i++) {
			String useridAuth = auth[i].getString("userid");
			if (!"".equals(useridAuth) && useridAuth != null) {
				String[] useridAuths = useridAuth.split(",");
				for (int a = 0; a < useridAuths.length; a++) {
					if (useridAuths[a].equals(userid)) {
						if ("".equals(orglevel)) {
							orglevel = auth[i].getString("orglevel");
						} else {
							if (Integer.parseInt(orglevel) > Integer.parseInt(auth[i].getString("orglevel"))) {
								orglevel = auth[i].getString("orglevel");
								break;
							}
						}
					}
				}
			}
			String roleAuth = auth[i].getString("role");
			if (!"".equals(roleAuth) && roleAuth != null) {
				String[] roleAuths = roleAuth.split(",");
				for (int j = 0; j < role.length; j++) {
					for (int a = 0; a < roleAuths.length; a++) {
						if (roleAuths[a].equals(role[j].getString("roleid"))) {
							if ("".equals(orglevel)) {
								orglevel = auth[i].getString("orglevel");
							} else {
								if (Integer.parseInt(orglevel) > Integer.parseInt(auth[i].getString("orglevel"))) {
									orglevel = auth[i].getString("orglevel");
									break;
								}
							}
						}
					}
				}
			}
			String orgAuth = auth[i].getString("org");
			if (!"".equals(orgAuth) && orgAuth != null) {
				String[] orgids = orgAuth.split(",");
				String orgid = "";
				for (int l = 0; l < orgids.length; l++) {
					HashMap param = new HashMap();
					param.put("orgid", orgids[l]);
					Object[] list = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_common.ameCommon.selectOrgids", param);
					if (list.length != 0) {
						DataObject result = (DataObject) list[0];
						if ("".equals(orgid)) {
							orgid = result.getString("orgid");
						} else {
							orgid = orgid + "," + result.getString("orgid");
						}
					}
				}
				for (int k = 0; k < orgs.length; k++) {
					String[] orgids1 = orgid.split(",");
					for (int a = 0; a < orgids1.length; a++) {
						if (orgids1[a].equals(orgs[k].getString("omOrganization/orgid"))) {
							if ("".equals(orglevel)) {
								orglevel = auth[i].getString("orglevel");
							} else {
								if (Integer.parseInt(orglevel) > Integer.parseInt(auth[i].getString("orglevel"))) {
									orglevel = auth[i].getString("orglevel");
									break;
								}
							}
						}
					}
				}
			}
		}
		return orglevel;
	}

	/**
	 * @param orglevel
	 *            (机构层级。)
	 * @param orgs
	 *            （当前用户所在部门）
	 * @return orgid(将拥有权限的orgid拼接起来)
	 * @author zhx
	 */
	@Bizlet("")
	public static String getOrgByLevel(String orglevel, DataObject[] orgs) {
		String orgid = "";
		for (int i = 0; i < orgs.length; i++) {
			commonj.sdo.DataObject org = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization", "OmOrganization");
			org.setInt("orgid", orgs[i].getInt("orgid"));
			DatabaseUtil.expandEntity("default", org);
			String orgseq = org.getString("orgseq");
			String[] orgids = orgseq.split("\\.");
			if (Integer.parseInt(orglevel) + 1 <= orgids.length) {
				HashMap param = new HashMap();
				if ("1".equals(orglevel)) {
					param.put("orgid", 1111);
					Object[] list = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_common.ameCommon.selectOrgids", param);
					if (list.length != 0) {
						DataObject result = (DataObject) list[0];
						if ("".equals(orgid)) {
							orgid = result.getString("orgid");
						} else {
							orgid = orgid + "," + result.getString("orgid");
						}
					}
				}
				param.put("orgid", orgids[Integer.parseInt(orglevel)]);
				Object[] list = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_common.ameCommon.selectOrgids", param);
				if (list.length != 0) {
					DataObject result = (DataObject) list[0];
					if ("".equals(orgid)) {
						orgid = result.getString("orgid");
					} else {
						orgid = orgid + "," + result.getString("orgid");
					}
				}
			}
		}
		return orgid;
	}

	/**
	 * @param DataObject
	 *            participantrule(参与者规则)
	 * @return WFParticipant(以数组形式返回所有人参与者)
	 * @author zhx
	 */
	@Bizlet("")
	public static DataObject[] getWfParticipant(DataObject participantrule) {
		ArrayList<DataObject> partlist = new ArrayList();// 先定义参与者list
		// 先处理角色参与者
		String rolepart = participantrule.getString("rolepart");
		String[] roles = new String[] {};
		if (rolepart != null && !"".equals(rolepart)) {
			roles = rolepart.split(",");
		}
		String emppart = participantrule.getString("emppart");
		String[] emps = new String[] {};
		if (emppart != null && !"".equals(emppart)) {
			emps = emppart.split(",");
		}
		int partlen = roles.length + emps.length;
		commonj.sdo.DataObject[] wfpart = new DataObject[partlen];// 审批对象数组
		int len = 0;
		for (int i = 0; i < roles.length; i++) {
			commonj.sdo.DataObject roleTemp = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.privilege", "AcRole");
			roleTemp.set("roleid", roles[i]);
			DatabaseUtil.expandEntity("default", roleTemp);
			wfpart[len] = commonj.sdo.helper.DataFactory.INSTANCE.create("com.eos.workflow.data", "WFParticipant");
			wfpart[len].setString("id", roles[i]);
			wfpart[len].setString("name", (String) roleTemp.get("rolename"));
			wfpart[len].setString("typeCode", "role");
			len = len + 1;
		}
		// 处理用户参与者
		for (int i = 0; i < emps.length; i++) {
			commonj.sdo.DataObject empTemp = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization", "OmEmployee");
			empTemp.set("userid", emps[i]);
			DatabaseUtil.expandEntityByTemplate("default", empTemp, empTemp);
			wfpart[len] = commonj.sdo.helper.DataFactory.INSTANCE.create("com.eos.workflow.data", "WFParticipant");
			wfpart[len].setString("id", emps[i]);
			wfpart[len].setString("name", (String) empTemp.get("empname"));
			wfpart[len].setString("typeCode", "person");
			len = len + 1;
		}

		return wfpart;
	}

}
