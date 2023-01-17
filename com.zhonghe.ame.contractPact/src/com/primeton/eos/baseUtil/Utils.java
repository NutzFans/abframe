package com.primeton.eos.baseUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;
import java.io.*;
import java.lang.reflect.Array;

import javax.servlet.http.HttpServletRequest;

import com.eos.common.connection.ConnectionHelper;
import com.eos.common.transaction.ITransactionManager;
import com.eos.common.transaction.TransactionManagerFactory;
import com.eos.data.datacontext.DataContextManager;
import com.eos.data.datacontext.IRequestMap;
import com.eos.data.datacontext.UserObject;
import com.eos.foundation.data.DataObjectUtil;
import com.primeton.ext.common.muo.MUODataContextHelper;

import commonj.sdo.DataObject;



/**
 * 用于公用类
 * @author hhdz
 *
 */
public class Utils {
	
	// 主数据接口返回值-正常
	public final static String MDM_WEBSERVICE_RETURN_OK = "1";
	// 主数据接口返回值-失败
	public final static String MDM_WEBSERVICE_RETURN_FAIL = "0";
	
	/**
	 * 
	 * @return 当前登录人ID
	 */
	public static String getLoginUserid() {
		return DataContextManager.current().getMUODataContext().getUserObject().getUserId();
	}
	
	/**
	 * 
	 * @return 当前登录人姓名
	 */
	public static String getLoginUserName() {
		return DataContextManager.current().getMUODataContext().getUserObject().getUserName();
	}
	
	/**
	 * 
	 * @return 当前登录人部门名称
	 */
	public static String getLoginDeptName() {
		return DataContextManager.current().getMUODataContext().getUserObject().getUserOrgName();
				
	}
	
	public final static String EMPID = "empid";
	public final static String EMPNAME = "empname";
	public final static String ORGID = "orgid";
	public final static String ORGNAME = "orgname";
	public final static String EMPCODE = "empcode";
	public final static String MOBILENO = "mobileno";
	public final static String ORGCODE = "orgcode";
	public final static String ORGSEQ = "orgseq";
	
	
	
	/**
     * 字符串转换成日期
     * @param value
     * @param fromPattern
     * @param toPattern
     * @return
     */
    public static java.util.Date getDateFromString(String value, String fromPattern,
            String toPattern) {
        java.util.Date day = null;
        if (toPattern == null) {
            toPattern = "yyyy-MM-dd";
        }
        if (value != null) {
            try {
                SimpleDateFormat formatter = null;
                if (fromPattern != null) {
                    formatter = new SimpleDateFormat(fromPattern);
                } else {
                    formatter = new SimpleDateFormat("yyyy-MM-dd");
                }
                day = formatter.parse(value);
            } catch (Exception e) {
                return null;
            }
            return day;
        } else {
            return null;
        }
    }
	
    
    
}
