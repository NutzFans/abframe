/**
 * 
 */
package com.primeton.eos.ame_common;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import com.eos.foundation.data.DataContextUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.primeton.sca.transformer.DataObject2OMElement;

import commonj.sdo.DataObject;

/**
 * @author 朱海翔
 * @date 2019-05-25 14:34:25
 *
 */
@Bizlet("")
public class ApprovalDrawer {
	/**
	 * @param map,xmfzr
	 * @return
	 * @author 朱海翔
	 * 将项目负责人加入审批链中
	 */
	@Bizlet("")
	public HashMap addSpr(HashMap map,HashMap sprTemp)  {
		int mapsize = map.size();	
		ArrayList<DataObject> list = new ArrayList();
		if(mapsize!=0){
			list = (ArrayList) map.get("1");
			commonj.sdo.DataObject spr = commonj.sdo.helper.DataFactory.INSTANCE.create("com.eos.workflow.data","WFParticipant");
			spr.set("id", sprTemp.get("userid"));
			spr.set("name", sprTemp.get("empname"));
			spr.set("typeCode", "person");
			list.add(spr);
		}else{
			commonj.sdo.DataObject spr = commonj.sdo.helper.DataFactory.INSTANCE.create("com.eos.workflow.data","WFParticipant");
			spr.set("id", sprTemp.get("userid"));
			spr.set("name", sprTemp.get("empname"));
			spr.set("typeCode", "person");
			list.add(spr);
			map.put("1",list);
		}
		return map;
	}
	
	/**
	 * @param map(审批抽屉)，spnum(审批次数)
	 * @return
	 * @author 朱海翔
	 * 获取当前审批人
	 */
	@Bizlet("")
	public DataObject[] getCurrentSpr(HashMap map,int spnum)  {
		String keys="temp"+(spnum+1); 
		DataObject[] spr = (DataObject[]) map.get(keys);
		return spr;
	}
	
	/**
	 * @param userid(离职员工)，outtype(离职性质)
	 * @return
	 * @author 孟月月
	 * 获取当前审批人
	 */
	@Bizlet("")
	public HashMap  getLeaveAppSpr(String userid,String outtype,String dirleader)  {
		HashMap resultmap = new HashMap();
		HashMap param = new HashMap();
		param.put("userid", userid);
		int key=1;
		if("1".equals(outtype) ){
	    	Object[] list = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_permanage.ame_leave_apply.querySyb", param);
			ArrayList listSyb = new ArrayList();
	    	for(int i=0;i<list.length;i++){
		    	DataObject result = (DataObject) list[i];
		    	commonj.sdo.DataObject spr = commonj.sdo.helper.DataFactory.INSTANCE.create("com.eos.workflow.data","WFParticipant");
		    		if(!result.get("id").equals(dirleader)){
				    	spr.set("id", result.get("id"));
						spr.set("name", result.get("name"));
						spr.set("typeCode", "person");
						listSyb.add(spr);
		    		}
	    	}
	    	if(listSyb.size()>0){
				resultmap.put(String.valueOf(key), listSyb);
	    	}
		}else{
			Object[] listleader = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_permanage.ame_leave_apply.querySybAndVp", param);
			ArrayList listsyb = new ArrayList();
			ArrayList listvp = new ArrayList();
			for(int i=0;i<listleader.length;i++){
				DataObject list = (DataObject) listleader[i];
		    	commonj.sdo.DataObject spr = commonj.sdo.helper.DataFactory.INSTANCE.create("com.eos.workflow.data","WFParticipant");
				if("syb".equals(list.get("type"))){
					if(!list.get("id").equals(dirleader)){
						spr.set("id", list.get("id"));
						spr.set("name", list.get("name"));
						spr.set("typeCode", "person");
						listsyb.add(spr);
					}
				}else{
					if(!list.get("id").equals(dirleader)){
						spr.set("id", list.get("id"));
						spr.set("name", list.get("name"));
						spr.set("typeCode", "person");
						listvp.add(spr);
					}
				}
			}
			if(listsyb.size()>0){
				int key1=key+1;
				resultmap.put(String.valueOf(key1), listsyb);
			}
			if(listvp.size()>0){
				resultmap.put(String.valueOf(key), listvp);
			}
			resultmap.put(String.valueOf(key), listvp);
		}
		return resultmap;
	}
	
	/**
	 * @param 最高审批层级（maxSplevel），业务类型（bustype）,业务代码（buscode）,需要审批得机构序列（orgseq）
	 * @return 审批抽屉 drawer
	 * @author 朱海翔
	 * 构建审批抽屉
	 */
	@Bizlet("")
	public HashMap creatDrawer(int maxSplevel,String bustype,String buscode,String orgseq,String userid) {
		HashMap drawer = new HashMap();//最终审批抽屉
		int drawerkey=1;//抽屉层级，默认第一层
		for(int i=1;i<=maxSplevel;i++){
			HashMap resultmap = getSpr(i, bustype, buscode,orgseq,drawer,drawerkey,userid,maxSplevel);
			drawer = (HashMap) resultmap.get("drawer");
			drawerkey = (Integer) resultmap.get("drawerkey");
		}
		return drawer;
	}
	
	/**
	 * @param orgseq,expuserid,managerid(受益部门负责人)
	 * @return
	 * @author 朱海翔
	 * 根据审批层级、业务类型、业务类型代码,机构获取审批人
	 */
	@Bizlet("")
	public HashMap getSpr(int splevel,String bustype,String buscode,String orgseq,HashMap map,int drawerkey,String userid,int maxSplevel) {
		HashMap resultmap = new HashMap();
		if("ameLeave".equals(bustype)){//如果是请假流程
			resultmap = getLeaveSpr(splevel,orgseq,map,drawerkey,userid,maxSplevel);
		}
		return resultmap;
		
	}
	
	/**
	 * @param orgseq,expuserid,managerid(受益部门负责人)
	 * @return
	 * @author 朱海翔
	 * 获取请假人在当前审批层级得审批人
	 */
	@Bizlet("")
	public HashMap getLeaveSpr(int splevel,String orgseq,HashMap map,int drawerkey,String userid,int maxSplevel) {
		String [] orgs = orgseq.split("\\.");
		DataObject[]sprlist = struOrgLeader(orgs);
		int orglen = sprlist.length;
		HashMap resultmap = new HashMap();
		String bugroup = orgs[2];//一级部门（包括事业群，管理部门，信息中心等），其负责人为分管VP
		/*获取受益一级部门负责人id开始*/
		commonj.sdo.DataObject orgTemp = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization","OmOrganization");
		orgTemp.set("orgid",Integer.valueOf(bugroup).intValue());
		DatabaseUtil.expandEntity("default", orgTemp);
		int buempid = orgTemp.getInt("managerid");//顶级部门负责人
		commonj.sdo.DataObject empTemp = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization","OmEmployee");
		empTemp.set("empid",buempid);
		DatabaseUtil.expandEntity("default", empTemp);
		String buuserid = empTemp.getString("userid");//机构主管
		if(buuserid.equals(userid)){//如果是一级部门负责人则由ceo审批
			HashMap param = new HashMap();
			param.put("roles", "'CEO'");
        	Object[] list = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_fee.expBeiProcess.queryComleader", param);
        	DataObject result = (DataObject) list[0];
        	commonj.sdo.DataObject spr = commonj.sdo.helper.DataFactory.INSTANCE.create("com.eos.workflow.data","WFParticipant");
			spr.set("id", result.get("id"));
			spr.set("name", result.get("name"));
			spr.set("typeCode", "person");
			ArrayList list11 = new ArrayList();
			list11.add(spr);
			map.put(String.valueOf(drawerkey), list11);
			drawerkey = drawerkey+1;
			resultmap.put("drawer", map);
			resultmap.put("drawerkey", drawerkey);
		}else{
			if(splevel==1){
				if(maxSplevel==1){
					for(int k=0;k<sprlist.length;k++){
						
						if(!userid.equals(sprlist[k].getString("id"))){
							ArrayList list = new ArrayList();
							list.add(sprlist[k]);
							map.put(String.valueOf(drawerkey), list);
							drawerkey = drawerkey+1;
							resultmap.put("drawer", map);
							resultmap.put("drawerkey", drawerkey);
							break;
						}
					}
				}else{
					ArrayList list = new ArrayList();
					list.add(sprlist[splevel-1]);
					map.put(String.valueOf(drawerkey), list);
					drawerkey = drawerkey+1;
					resultmap.put("drawer", map);
					resultmap.put("drawerkey", drawerkey);
				}
				
			}else if(splevel==maxSplevel){
				if(map==null){
					if(!userid.equals(sprlist[splevel-1].getString("id"))){
						ArrayList list = new ArrayList();
						list.add(sprlist[splevel-1]);
						map.put(String.valueOf(drawerkey), list);
						drawerkey = drawerkey+1;
						resultmap.put("drawer", map);
						resultmap.put("drawerkey", drawerkey);
					}else{
						ArrayList list = new ArrayList();
						list.add(sprlist[splevel]);
						map.put(String.valueOf(drawerkey), list);
						drawerkey = drawerkey+1;
						resultmap.put("drawer", map);
						resultmap.put("drawerkey", drawerkey);
					}
				}else{
					if(splevel<=orglen){
						ArrayList list = new ArrayList();
						list.add(sprlist[splevel-1]);
						map.put(String.valueOf(drawerkey), list);
						drawerkey = drawerkey+1;
						resultmap.put("drawer", map);
						resultmap.put("drawerkey", drawerkey);
					}else{
						resultmap.put("drawer", map);
						resultmap.put("drawerkey", drawerkey);
					}
				}
			}else{
				if(splevel<=orglen){
					if(!userid.equals(sprlist[splevel-1].getString("id"))){
						ArrayList list = new ArrayList();
						list.add(sprlist[splevel-1]);
						map.put(String.valueOf(drawerkey), list);
						drawerkey = drawerkey+1;
						resultmap.put("drawer", map);
						resultmap.put("drawerkey", drawerkey);
					}else{
						resultmap.put("drawer", map);
						resultmap.put("drawerkey", drawerkey);
					}
				}else{
					resultmap.put("drawer", map);
					resultmap.put("drawerkey", drawerkey);
				}
			}
		}
		return resultmap;
	}
	
	/**
	 * @param sprdata(数组形式的审批人信息)
	 * @return 
	 * @author 朱海翔
	 * 构造审批抽屉
	 */
	@Bizlet("")
	public HashMap struSpr(DataObject[] sprdata) {
		HashMap resultmap = new HashMap();
		for(int i=0;i<sprdata.length;i++){
			ArrayList list = new ArrayList();
			String userid = sprdata[i].getString("userid");
			String empname = sprdata[i].getString("empname");
			String[] userids = userid.split(",");
			String[] empnames = empname.split(",");
			for(int j=0;j<userids.length;j++){
				commonj.sdo.DataObject spr = commonj.sdo.helper.DataFactory.INSTANCE.create("com.eos.workflow.data","WFParticipant");
				spr.set("id", userids[j]);
				spr.set("name", empnames[j]);
				spr.set("typeCode", "person");
				list.add(spr);
			}
			DataObject[] sprTemp = new DataObject[list.size()];
			list.toArray(sprTemp);
			int drawer = i+1; 
			resultmap.put("temp"+drawer,sprTemp);
		}
		return resultmap;
	}
	
	/**
	 * @param map(审批抽屉)
	 * @return sprinfo（dataobject[]）(数组形式的审批人信息)
	 * @author 朱海翔
	 * 重新构造审批人结构方便前端获取
	 */
	@Bizlet("")
	public DataObject[] resSpr(HashMap map) {
		ArrayList list = new ArrayList();
		int mapsize = map.size();
		for(int i=1;i<=mapsize;i++){
			commonj.sdo.DataObject[] sprTemp =  (DataObject[]) map.get("temp"+i);
			String userid=null;//审批人id拼接
			String name=null;//审批人name拼接
			for(int j=0;j<sprTemp.length;j++){
				if(userid==null){
					userid=(String) sprTemp[j].get("id");
					name=(String) sprTemp[j].get("name");
				}else{
					userid = userid+","+(String) sprTemp[j].get("id");
					name = name+","+(String) sprTemp[j].get("name");
				}
				
			}
			commonj.sdo.DataObject spr = commonj.sdo.helper.DataFactory.INSTANCE.create("com.eos.workflow.data","WFParticipant");
			spr.set("splevel",i);
			spr.set("userid",userid);
			spr.set("empname",name);
			list.add(spr);
		}
		commonj.sdo.DataObject[] sprinfo = new DataObject[list.size()];
		list.toArray(sprinfo);
		return sprinfo;
	}
	
	/**
	 * @param orgs(机构)
	 * @return orgList（dataobject[]）(数组形式的审批人信息)
	 * @author 朱海翔
	 * 构造机构领导链
	 */
	@Bizlet("")
	public DataObject[] struOrgLeader(String [] orgs) {
		ArrayList list = new ArrayList();
		for(int i=1;i<=orgs.length-2;i++){
			int orgid = Integer.valueOf(orgs[orgs.length-i]);
			Object[] listOrg = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_common.ameCommon.isSale", orgid);
        	DataObject result = (DataObject) listOrg[0];
        	if(result.getString("flag").equals("0")){//不是销售
        		commonj.sdo.DataObject orgTemp = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization","OmOrganization");
        		orgTemp.set("orgid",orgid);
        		DatabaseUtil.expandEntity("default", orgTemp);
        		int empid = orgTemp.getInt("managerid");//机构主管
        		commonj.sdo.DataObject empTemp = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization","OmEmployee");
        		empTemp.set("empid",empid);
        		DatabaseUtil.expandEntity("default", empTemp);
        		commonj.sdo.DataObject spr = commonj.sdo.helper.DataFactory.INSTANCE.create("com.eos.workflow.data","WFParticipant");
        		spr.set("id",empTemp.get("userid"));
        		spr.set("name",empTemp.get("empname"));
        		spr.set("typeCode", "person");
        		list.add(spr);
        		String leader = orgTemp.getString("repleader");//机构分管
        		if(leader!=null){
        			String[] leaders = leader.split("\\,");
        			for(int k=0;k<leaders.length;k++){
        				commonj.sdo.DataObject empTemp3 = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization","OmEmployee");
        				empTemp3.set("userid",leaders[k]);
        				DatabaseUtil.expandEntityByTemplate("default", empTemp3,empTemp3);
        				commonj.sdo.DataObject spr3 = commonj.sdo.helper.DataFactory.INSTANCE.create("com.eos.workflow.data","WFParticipant");
        				spr3.set("id", empTemp3.get("userid"));
        				spr3.set("name", empTemp3.get("empname"));
        				spr3.set("typeCode", "person");
        				list.add(spr3);
        			}
        		}
        	}
		}
		commonj.sdo.DataObject[] sprinfo = new DataObject[list.size()];
		list.toArray(sprinfo);
		return sprinfo;
	}
	
	
}
