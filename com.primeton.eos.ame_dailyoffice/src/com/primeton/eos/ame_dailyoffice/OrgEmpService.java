/**
 * 
 */
package com.primeton.eos.ame_dailyoffice;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;
import commonj.sdo.helper.DataFactory;

/**
 * @author xuan
 * @date 2019-03-05 14:32:58
 *
 */
@Bizlet("")
public class OrgEmpService {
	
	/**数据源：default*/
	public final static String DATASOURCE_DEFAULT = "default";
	
	/**
	 * 根据条件查询OrgEmp
	 * @param param
	 * @return
	 */
	@Bizlet("")
	public static DataObject[] getOrgEmpList(Map<String,String> param){	
		DataObject [] orgEmpList = null;
		DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
		criteria.set("_entity","com.primeton.eos.ame_dailyoffice.hygl.OrgEmpEntity");
		criteria.set("_expr[1]/uesrid", param.get("empid"));
		orgEmpList = DatabaseUtil.queryEntitiesByCriteriaEntity(DATASOURCE_DEFAULT,criteria); 
		return orgEmpList;
	}
	
	/**
	 * 根据empids或者orgid和查询实体名称获取人员组织机构数组
	 * @param empids
	 * @param orgids
	 * @return
	 * @throws Exception
	 */
	@Bizlet("")
	public static DataObject []  getOrgEmp(String empids,String orgids,String criteriaName)
			throws Exception {
		DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria","criteriaType");
		criteria.set("_entity", criteriaName);
		
		if(StringUtils.isNotBlank(empids)){
			criteria.set("_expr[1]/empid", empids);
			criteria.set("_expr[1]/_op", "in");
		}
		if(StringUtils.isNotBlank(orgids)){
			criteria.set("_orderby[1]/_property","sortno");
			criteria.set("_orderby[1]/_sort","asc");
			criteria.set("_expr[2]/orgid", orgids);
			criteria.set("_expr[2]/_op", "in");
		}
	
		DataObject [] orgs = DatabaseUtil.queryEntitiesByCriteriaEntity("default", criteria);
		return orgs;
	}
	
	/**
	 * 根据条件查询OrgLeader
	 * @param param
	 * @return
	 */
	@Bizlet("")
	public static DataObject getOrgLeader(String orgid){	
		DataObject [] orgLeadersList = null;
		DataObject orgLeaderList = DataObjectUtil.createDataObject("com.primeton.eos.ame_dailyoffice.hygl.OmEmployee");
		DataObject criteria = DataFactory.INSTANCE.create("com.primeton.das.criteria", "criteriaType");
		criteria.set("_entity","com.primeton.eos.ame_dailyoffice.dailyoffice.QueryDept");
		criteria.set("_expr[1]/orgid", orgid);
		orgLeadersList = DatabaseUtil.queryEntitiesByCriteriaEntity(DATASOURCE_DEFAULT,criteria);
		String orgdegree = orgLeadersList[0].getString("orgdegree");
		if(StringUtils.equalsIgnoreCase(orgdegree, "6")){
			orgLeaderList.setString("userid", orgLeadersList[0].getString("leaderBId"));
			orgLeaderList.setString("empname", orgLeadersList[0].getString("leaderBName"));
		}else if(StringUtils.equalsIgnoreCase(orgdegree, "4")&&orgid.equalsIgnoreCase("184")){
			orgLeaderList.setString("userid", orgLeadersList[0].getString("leaderBId"));
			orgLeaderList.setString("empname", orgLeadersList[0].getString("leaderBName"));
		}else{
			System.out.println(orgLeadersList[0].getString("leaderAId"));
			orgLeaderList.setString("userid", orgLeadersList[0].getString("leaderAId"));
			orgLeaderList.setString("empname", orgLeadersList[0].getString("leaderAName"));
		}
		return orgLeaderList;
	}
	
	/**
	 * 重构数据实体（处室人员回显排序问题）
	 * @param data：数据实体
	 * @param orderListName：排序集合名称
	 * @param orderId：排序主键
	 * @param orderLxName：排序分类字段名称
	 * @param orderEmpName：人员排序类型名称（可选填）
	 * @param orderOrgName：处室排序类型名称（可选填）
	 * @return data重构后的数具实体
	 * @throws Exception
	 */
	public static DataObject reSetDataWithOrder(DataObject data, String orderListName, String orderId, String orderLxName,
			String orderEmpName, String orderOrgName) 
			throws Exception{
		//获取数据实体排序list
		@SuppressWarnings("unchecked")
        List<DataObject> orderList = data.getList(orderListName);
		
		if (CollectionUtils.isNotEmpty(orderList)) {
			
			//排序后的数据实体排序list
			List<DataObject> orderedList = new ArrayList<DataObject>();
			//构造处室ID Set集合，用于查询org_Organization表对处室进行排序
			HashSet<String> orgIdSet = new HashSet<String>();
			//构造人员ID Set集合，用于查询org_employee表对处室进行排序
			HashSet<String> empIdSet = new HashSet<String>();
			//按排序类型给待排序集合分类
			for (DataObject orderItem : orderList) {
				String orderLx = orderItem.getString(orderLxName);
				//如果主体类型为org:处室，把主体添加进orgIdSet，否则添加进empIdSet
				if(StringUtils.isNotBlank(orderOrgName) && orderOrgName.equals(orderLx)){
					orgIdSet.add(orderItem.getString(orderId));
				}else if(StringUtils.isNotBlank(orderEmpName) && orderEmpName.equals(orderLx)){
					empIdSet.add(orderItem.getString(orderId));
				}
			}
			
			//如果处室ID集合大于1，构造处室ID集合字符串，并排序
			if(orgIdSet.size() > 1){
				String orgIds = orgIdSet.toString().replace(" ", "");
				orgIds = orgIds.replace("[", "");
				orgIds = orgIds.replace("]", "");
				DataObject [] orgs = getOrgEmp("", orgIds, "com.primeton.eos.ame_dailyoffice.hygl.OmOrganization");
				//排序后的处室ID
				String[] orgsOrder = new String[orgs.length];
				for(int i = 0; i < orgs.length; i++){
					orgsOrder[i] = orgs[i].getString("orgid");
				}
				//按排序结果往结果List填数据
				for(String orgid : orgsOrder){
					Iterator<DataObject> it = orderList.iterator();
					while(it.hasNext()){
						DataObject temp = it.next();
					    if(orgid.equals(temp.getString(orderId))){
					    	orderedList.add(temp);
					        it.remove();
					    }
					}
				}
			}
			

			//如果人员ID集合大于1，构造人员ID集合字符串，并排序
			if(empIdSet.size() > 1){
				String empIds = empIdSet.toString().replace(" ", "");
				empIds = empIds.replace("[", "");
				empIds = empIds.replace("]", "");
				DataObject [] emps = getOrgEmp(empIds, "", "com.geostar.gtgh.oa.common.business.commonEntity.EmpOrderEntity");
				//排序后的人员ID
				String[] empsOrder = new String[emps.length];
				for(int i = 0; i < emps.length; i++){
					empsOrder[i] = emps[i].getString("empid");
				}
				//按排序结果往结果List填数据
				for(String empid : empsOrder){
					Iterator<DataObject> it = orderList.iterator();
					while(it.hasNext()){
						DataObject temp = it.next();
					    if(empid.equals(temp.getString(orderId))){
					    	orderedList.add(temp);
					        it.remove();
					    }
					}
				}
			}
			
			//回填类型非emp和org待排序集合
			for(DataObject tempOrderItem : orderList){
				orderedList.add(tempOrderItem);
			}
			
			data.setList(orderListName, orderedList);
		}
		return data;
	}

}
