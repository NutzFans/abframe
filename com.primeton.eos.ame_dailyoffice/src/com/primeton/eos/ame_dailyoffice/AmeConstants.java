/**
 * 
 */
package com.primeton.eos.ame_dailyoffice;

import java.util.HashMap;
import java.util.Map;

import com.eos.system.annotation.Bizlet;

/**
 * @author zhengquan
 * @date 2019-03-11 17:25:06
 *
 */
@Bizlet("")
public class AmeConstants {
	/*
	 * 业务实体map
	 */
	public static Map <String,BusinessParam> YWLX_UTIL_MAP = new HashMap<String,BusinessParam>();
	
	static{
		YWLX_UTIL_MAP.put(Lcdm.LCDM_YZSY.toString(), new BusinessParam(Lcdy.AME_YZSY.toString(),Lcdy.AME_YZSY_NAME.toString(),Lcdy.AME_YZSY_DESC.toString(),""));
		YWLX_UTIL_MAP.put(Lcdm.LCDM_HYGL.toString(), new BusinessParam(Lcdy.AME_HYGL.toString(),Lcdy.AME_HYGL_NAME.toString(),Lcdy.AME_HYGL_DESC.toString(),""));
		YWLX_UTIL_MAP.put(Lcdm.LCDM_FGSYZSY.toString(), new BusinessParam(Lcdy.AME_FGSYZSY.toString(),Lcdy.AME_FGSYZSY_NAME.toString(),Lcdy.AME_FGSYZSY_DESC.toString(),""));
		YWLX_UTIL_MAP.put(Lcdm.LCDM_YZWJ.toString(), new BusinessParam(Lcdy.AME_YZWJ.toString(),Lcdy.AME_YZWJ_NAME.toString(),Lcdy.AME_YZWJ_DESC.toString(),""));
	}
	/*
	 * 流程代码常量
	 * @author zhengquan
	 */
	public enum Lcdm{
		LCDM_YZSY("YZSY"),//印章使用:YZSY
		LCDM_HYGL("HYGL"),//会议管理:HYGL
		LCDM_FGSYZSY("FGSYZSY"),//分公司印章使用:FGSYZSY
		LCDM_YZWJ("YZWJ");//印章外借:FGSYZSY
		
		//成员变量
		private String lcdm;
		
		//构造方法
		private Lcdm(String lcdm){
			this.lcdm = lcdm;
		}
		
		//覆盖方法
		public String toString(){
			return this.lcdm;
		}
	}
	
	public enum Lcdy{
		/**********************印章使用:YZSY******************************/
		AME_YZSY("com.primeton.eos.ame_dailyoffice.ame_yzsy"),AME_YZSY_NAME("的印章使用申请"),AME_YZSY_DESC("的印章使用申请"),
		
		/**********************会议管理:HYGL******************************/
		AME_HYGL("com.primeton.eos.ame_dailyoffice.ame_hygl"),AME_HYGL_NAME("会议管理流程"),AME_HYGL_DESC("会议管理流程"),
		
		/**********************分公司印章使用:FGSYZSY******************************/
		AME_FGSYZSY("com.primeton.eos.ame_dailyoffice.ame_fgsyzsy"),AME_FGSYZSY_NAME("的分公司印章使用申请"),AME_FGSYZSY_DESC("的分公司印章使用申请"), 
		
		/**********************印章外借:YZWJ******************************/
		AME_YZWJ("com.primeton.eos.ame_dailyoffice.ame_yzwj"), AME_YZWJ_NAME("的印章外借申请"), AME_YZWJ_DESC("的印章外借申请");
		//成员变量
		private String proParam;
		//构造函数
		private Lcdy(String param){
			this.proParam=param;
		}
		// 覆盖方法
		@Override
        public String toString() {
           return proParam.toString();
        }
	}
}
