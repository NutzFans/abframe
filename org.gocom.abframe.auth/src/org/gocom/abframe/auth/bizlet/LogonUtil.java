/*******************************************************************************
 * $Header: /cvsroot/MIS10/src/NEWERP/org.gocom.abframe.auth/src/org/gocom/abframe/auth/bizlet/LogonUtil.java,v 1.12 2018/05/02 03:14:14 huangqj Exp $
 * $Revision: 1.12 $
 * $Date: 2018/05/02 03:14:14 $
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2006 Primeton Technologies, Ltd.
 * All rights reserved.
 *
 * Created on 2008-9-17
 *******************************************************************************/

package org.gocom.abframe.auth.bizlet;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.gocom.abframe.ABFConfigKey;
import org.gocom.abframe.tools.DBUtil;

import com.eos.data.datacontext.DataContextManager;
import com.eos.data.datacontext.IUserObject;
import com.eos.data.datacontext.UserObject;
import com.eos.foundation.common.utils.CryptoUtil;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.eoscommon.LogUtil;
import com.eos.system.annotation.Bizlet;
import com.eos.system.annotation.BizletParam;
import com.eos.system.utility.StringUtil;
import commonj.sdo.DataObject;

/**
 * 
 * 登录相关的构件
 * 
 * @author 翁增仁 wengzr (mailto:wengzr@primeton.com)
 */
/*
 * 
 * Revision 1.3 2009/03/30 05:39:38 caisy 代码规范
 * 
 * Revision 1.2 2009/01/07 06:52:46 liuxiang *** empty log message ***
 * 
 * Revision 1.1 2009/01/05 02:34:57 caisy abframe二期初始版本
 * 
 * Revision 1.4 2008/11/28 04:15:22 wengzr Added:增BlogFieldTag大字段输出标签
 * Refactor:重构AuthConfiguration
 * 
 * Revision 1.3 2008/11/24 13:43:43 wengzr
 * Added:增加验证码可配置,和验证码校验器VerifyCodeLoginValidator
 * 
 * Revision 1.2 2008/11/17 11:20:52 wengzr
 * refactor:将DataObjectExt移到org.gocom.abframe.tools构件包
 * 
 * Revision 1.1 2008/10/07 09:25:49 wengzr *** empty log message ***
 * 
 * Revision 1.4 2008/09/26 15:24:51 wengzr
 * refactor:重构权限缓存数据的获取方式,增加permission_data_provider配置
 * 
 * Revision 1.3 2008/09/17 16:40:48 wengzr Update:修改登录验证方式
 * 
 */
@Bizlet("登录运算逻辑")
public class LogonUtil {

	/**
	 * 获取加密后的密码<BR>
	 * 如果当前contribution.eosinfo配置了加密算法，则采用相应的加密算法进行加密，否则默认为明文
	 * 
	 * @param password
	 *            明文密码
	 * @return 加密后的密码
	 * @throws Exception
	 */
	@Bizlet(params = { @BizletParam(index = 0, paramAlias = "password") })
	public static String getPassword(String password) throws Exception {
		String algorithm = ABFConfigKey.LOGIN_PASSWORD_ENCRYPTION_ALGORITHM.getConfigValue();

		if (algorithm == null || algorithm.equals("")) {
			return password;
		}

		if ("MD5".equals(algorithm)) {
			return CryptoUtil.digestByMD5(password);
		} else if ("SHA".equals(algorithm)) {
			return CryptoUtil.digestBySHA(password);
		} else {
			throw new IllegalArgumentException("不支持该加密算法 " + algorithm);
		}
	}

	/**
	 * @return
	 * @author 蔡述尧
	 */
	@Bizlet("是否已登录")
	public static boolean isLogon() {
		return DataContextManager.current().getSessionCtx().getUserObject() == null ? false : true;
	}

	private static final int USERID = 1;

	private static final int USERNAME = 2;

	private static final int OPERATORID = 3;

	private static final int MENUTYPE = 4;

	private static final int EMPID = 5;

	private static final int EMPNAME = 6;

	private static final int ORGID = 7;

	private static final int ORGNAME = 8;

	private static final int ORGTYPE = 9;

	private static final int ORGCODE = 10;

	private static final int ORGSEQ = 11;

	private static final String SQLBASEINFO = "SELECT U.USERID,U.OPERATORNAME,U.OPERATORID,U.MENUTYPE,E.EMPID,E.EMPNAME,O.ORGID,O.ORGNAME,O.ORGTYPE,O.ORGCODE,O.ORGSEQ,E.OEMAIL,O.ORGDEGREE  FROM  AC_OPERATOR U LEFT OUTER JOIN OM_EMPLOYEE E ON U.OPERATORID = E.OPERATORID LEFT OUTER JOIN OM_ORGANIZATION O ON E.ORGID = O.ORGID WHERE U.USERID = ? ";

	private static final String SQLROLE = "SELECT ROLEID FROM AC_OPERATORROLE WHERE OPERATORID=?";

	private static final String SQLORGROLE = "SELECT ROLEID FROM OM_PARTYROLE R ,(SELECT POSITIONID AS PARTYID FROM OM_EMPPOSITION WHERE EMPID = ?) O WHERE R.PARTYID = O.PARTYID AND R.PARTYTYPE='position' UNION SELECT ROLEID FROM OM_PARTYROLE R, (SELECT ORGID  AS PARTYID  FROM OM_EMPORG WHERE EMPID = ?) O  WHERE R.PARTYID = O.PARTYID AND R.PARTYTYPE='organization' UNION SELECT ROLEID FROM OM_PARTYROLE R, (SELECT GROUPID  AS PARTYID  FROM OM_EMPGROUP WHERE EMPID = ?) O  WHERE R.PARTYID = O.PARTYID AND R.PARTYTYPE='workgroup' ";
	
	private static final String SQLORGLIST = "SELECT a.ORGID,b.ORGNAME FROM OM_EMPORG a,OM_ORGANIZATION b where EMPID=? and a.ORGID=b.ORGID";
	/**
	 * 
	 * 构造userObject
	 * 
	 * @param userid
	 * @param password
	 * @return 构造用户的信息
	 */
	@Bizlet("登录系统，并返回用户对象")
	public static UserObject initUserObject(DataObject acOperator) {
		UserObject uo = new UserObject();
		String userid = acOperator.getString("userid");
		HashSet<String> roleSet = new HashSet<String>();
		Connection conn = DBUtil.getConnection();

		HashMap<String, Object> attributes = new HashMap<String, Object>();
		ArrayList<DataObject> roleList = new ArrayList<DataObject>();
		ArrayList<DataObject> orgList = new ArrayList<DataObject>();
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		PreparedStatement ps4 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		ResultSet rs4 = null;

		try {
			// 查询人员基本信息
			ps = conn.prepareStatement(SQLBASEINFO);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			if (rs.next()) {
				// 存在操作员
				String empid = rs.getString(EMPID);
				int operatorid = Integer.parseInt(rs.getString(OPERATORID));
				uo.setUserId(rs.getString(USERID));
				uo.setUserMail(rs.getString("OEMAIL"));
				uo.setUserName(rs.getString(USERNAME));
				uo.setUserRealName(rs.getString(EMPNAME));
				uo.setUserOrgId(rs.getString(ORGID));
				uo.setUserOrgName(rs.getString(ORGNAME));
				String skin = rs.getString(MENUTYPE);
				// 设置 layout和style的默认值
				attributes.put(ABFConfigKey.SKIN_LAYOUTATTR.getConfigValue(), ABFConfigKey.SKIN_DEFAULT_LAYOUT.getConfigValue());
				attributes.put(ABFConfigKey.SKIN_STYLEATTR.getConfigValue(), ABFConfigKey.SKIN_DEFAULT_STYLE.getConfigValue());
				if (StringUtil.isNotNullAndBlank(skin)) {
					String[] tmp = skin.split(",");
					if (tmp.length > 0) {
						attributes.put(ABFConfigKey.SKIN_LAYOUTATTR.getConfigValue(), tmp[0]);
					}
					if (tmp.length > 1) {
						attributes.put(ABFConfigKey.SKIN_STYLEATTR.getConfigValue(), tmp[1]);
					}
				}
				attributes.put("orgseq", rs.getString(ORGSEQ));
				attributes.put("orgcode", rs.getString(ORGCODE));
				attributes.put("orgtype", rs.getString(ORGTYPE));
				attributes.put("orgdegree", rs.getString("ORGDEGREE"));
				attributes.put("empid", empid);
				attributes.put("operatorid", rs.getString(OPERATORID));
				// 查询角色列表
				// 查询操作员角色
				ps1 = conn.prepareStatement(SQLROLE);
				// 设置参数
				ps1.setInt(1, operatorid);
				rs1 = ps1.executeQuery();
				while (rs1.next()) {
					String id = rs1.getString("roleid");
					if (!roleSet.contains(id)) {
						DataObject role = DataObjectUtil.createDataObject("org.gocom.abframe.dataset.privilege.AcRole");
						role.setString("roleid", id);
						roleSet.add(id);
						roleList.add(role);
					}
				}
				if (StringUtil.isNotNullAndBlank(empid)) {
					// 关联员工，查询员工关联机构的角色列表，查询所在事业部、所在业务单元
					int iempid = Integer.parseInt(empid);
					ps2 = conn.prepareStatement(SQLORGROLE);
					// 设置参数
					ps2.setInt(1, iempid);
					ps2.setInt(2, iempid);
					ps2.setInt(3, iempid);
					rs2 = ps2.executeQuery();
					while (rs2.next()) {
						String id = rs2.getString("roleid");
						if (!roleSet.contains(id)) {
							DataObject role = DataObjectUtil.createDataObject("org.gocom.abframe.dataset.privilege.AcRole");
							role.setString("roleid", rs2.getString("roleid"));
							roleSet.add(id);
							roleList.add(role);
						}
					}
					ps3 = conn.prepareStatement(SQLORGLIST);
					// 设置参数
					ps3.setInt(1, iempid);
					rs3 = ps3.executeQuery();
					while (rs3.next()) {
						String orgid = rs3.getString("orgid");
						String orgname = rs3.getString("orgname");
						DataObject org = DataObjectUtil.createDataObject("commonj.sdo.DataObject");
						org.setString("orgid", orgid);
						org.setString("orgname", orgname);
						orgList.add(org);
					}
				}
				// 设置角色到用户对象中
				attributes.put("roles", roleList.toArray(new DataObject[roleList.size()]));
				attributes.put("orgs", orgList.toArray(new DataObject[orgList.size()]));
				uo.setAttributes(attributes);
			} else {
				// 无此操作员
				uo = null;
			}

		} catch (Exception e) {
			uo = null;
			LogUtil.logError("登录出错！", e, (Object) null);
		} finally {
			DBUtil.closeAll(conn, new PreparedStatement[] { ps, ps1, ps2, ps3, ps4 }, new ResultSet[] { rs, rs1, rs2, rs3, rs4 });
		}

		return uo;
	}

	/**
	 * 是否使用验证码
	 * 
	 * @return 使用返回true
	 */
	public static boolean useVerifyCode() {
		return ABFConfigKey.LOGIN_USE_VERIFY_CODE.getBLConfigValue();
	}

	/**
	 * 是否使用多语言选项
	 * 
	 * @return 使用返回true
	 */
	public static boolean useChooseLanguange() {
		return ABFConfigKey.USE_LANGUAGE_CHOOSE.getBLConfigValue();
	}

	/**
	 * 获取配置文件中的默认登录语言，如果未配置则返回zh_CN
	 * 
	 * @return 语言信息 如zh_CN en_US等
	 */
	public static String getDefaultLanguange() {
		return ABFConfigKey.USE_DEFAULT_LANGUAGE.getConfigValue("zh_CN");
	}

	/**
	 * 判断session中的userObject是否存在
	 * 
	 * @param request
	 * @return userObject不为空 返回true
	 */
	public static boolean isLogon(HttpServletRequest request) {
		IUserObject userObject = (IUserObject) request.getSession().getAttribute(IUserObject.KEY_IN_CONTEXT);
		return userObject == null ? false : true;
	}

	/**
	 * @return
	 * @author 蔡述尧
	 */
	@Bizlet("是否使用语言")
	public static void setLocale(String lang) {
		DataContextManager.current().setCurrentLocale(new Locale(lang));
	}
}
