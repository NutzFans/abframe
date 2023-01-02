package com.zhonghe.ame.purchase.service;


import java.util.ArrayList;
import java.util.Iterator;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.eos.engine.component.ILogicComponent;
import com.primeton.ext.engine.component.LogicComponentFactory;

public class MaterialsService {
	MaterialsOpLog materialsOpLog=new MaterialsOpLog();
	QueryMaterials queryMaterials=new QueryMaterials();
	//物资分类接信息
	public String materialsSort(String materials) throws Throwable {
		
		JSONObject jsonObject=(JSONObject) JSONObject.parseObject(materials).get("ESB");
		JSONObject data=(JSONObject) JSONObject.parseObject(jsonObject.toJSONString()).get("DATA");
		
		JSONObject dataInfos=(JSONObject) JSONObject.parseObject(data.toJSONString()).get("DATAINFOS");
		JSONArray  dataInfoArray=(JSONArray) dataInfos.getJSONArray("DATAINFO");
		
		
		ArrayList<ZhImpMaterialsSort>  dataInfoList=new ArrayList<ZhImpMaterialsSort>();
		int dataSize=dataInfoArray.size();
		int count=0;
		
	
		String code="";
		String praentcode="";
		String desc1="";
		String desc2="";
		String desc3="";
		String uuid="";
		for (Iterator<Object> iterator=dataInfoArray.iterator();iterator.hasNext();) {
			 JSONObject jsonObject1 = (JSONObject) iterator.next();
			 code=jsonObject1.get("CODE").toString();//主编码的值
			 praentcode=jsonObject1.get("PARENTCODE").toString();//父节点编码的值
			 desc1=jsonObject1.get("DESC1").toString();//分类名称的值
			 desc2=jsonObject1.get("DESC2").toString();//分类描述的值
			 desc3=jsonObject1.get("DESC3").toString();//状态的值
			 uuid=jsonObject1.get("UUID").toString();//UUID的值
		
			//存储到对象中
			commonj.sdo.DataObject materialClass = commonj.sdo.helper.DataFactory.INSTANCE
					       .create("com.zhonghe.ame.purchase.restData",
					         "ZhImpMaterialsSort");
			
		
			materialClass.set("code", code);
			materialClass.set("parentcode", praentcode);
			materialClass.set("desc1", desc1);
			materialClass.set("desc2", desc2);
			materialClass.set("desc3", desc3);
			materialClass.set("uuid", uuid);
			materialClass.set("createdBy", "ESB");
			
			//查询是否存在
			Boolean isQuery=queryMaterials.queryMaterialsSortByCode(code);
			
			
			//存储到数据库
			Object[] inParametersMa={materialClass};
				
			//抛出异常信息
			String throwableMessage = null;
			System.out.println(isQuery);
			Boolean success=false;
			try {
				if (isQuery) {
					ILogicComponent logicComponent=LogicComponentFactory.create("com.zhonghe.ame.purchase.restImp");
					logicComponent.invoke("editMaterialsSort", inParametersMa);
				} else {
					ILogicComponent logicComponent=LogicComponentFactory.create("com.zhonghe.ame.purchase.restImp");
					logicComponent.invoke("addMaterialsSort", inParametersMa);
					
				}	
				success=true;
				count++;
			} catch (Exception  e) {
				throwableMessage=e.getMessage();
				e.printStackTrace();
			}
				

			ZhImpMaterialsSort returnDataInfo=new ZhImpMaterialsSort();
			returnDataInfo.setCode(code);
			returnDataInfo.setUuid(uuid);
			returnDataInfo.setSynresult(success?"0":"1");
			returnDataInfo.setSynstatus(success?"成功":throwableMessage);

			dataInfoList.add(returnDataInfo);
				
			//存储到日志对象中
			commonj.sdo.DataObject materialOperatLog = commonj.sdo.helper.DataFactory.INSTANCE
					       .create("com.zhonghe.ame.purchase.restData",
					         "ZhImplementOperatlog");
			materialOperatLog.set("code", code);
			materialOperatLog.set("parentcode", praentcode);
			materialOperatLog.set("desc1", desc1);
			materialOperatLog.set("desc2", desc2);
			materialOperatLog.set("desc3", desc3);
			materialOperatLog.set("uuid", uuid);
			materialOperatLog.set("puuid", dataInfos.get("PUUID"));
			materialOperatLog.set("syncode", dataInfos.get("SYNCODE"));
			materialOperatLog.set("synstatus", success?"0":"1");
			materialOperatLog.set("synresult", success?"成功":throwableMessage);
			
			materialsOpLog.setMaterialsSortOpLog(materialOperatLog,"2");
			
			}
	
		//将JSON的Key转成大写
		JSONArray jsonArray=ModifyJsonKeyUtil.transToArray(JSONObject.toJSONString(dataInfoList));
		
		//设置返回结果json
		JSONObject resultDataInfo = new JSONObject();
		resultDataInfo.put("PUUID", dataInfos.get("PUUID"));
		resultDataInfo.put("DATAINFO", jsonArray);
		
		JSONObject resultDataInfos = new JSONObject();
		resultDataInfos.put("DATAINFOS", resultDataInfo);
		
		JSONObject resultEsb = new JSONObject();
		resultEsb.put("RESULT", count>0?"S":"E");
		resultEsb.put("DESC", dataSize==count?"成功添加:"+count:"成功添加:"+count+"   添加失败:"+(dataSize-count));
		resultEsb.put("DATA", resultDataInfos);
		
		JSONObject resultData = new JSONObject();
		resultData.put("ESB", resultEsb);
		
		String resultString=resultData.toJSONString();
		return resultString;
	}
	
	//物资主数据信息
	public String materialsMasterData(String materials) throws Throwable {
		
			JSONObject jsonObject=(JSONObject) JSONObject.parseObject(materials).get("ESB");
			JSONObject data=(JSONObject) JSONObject.parseObject(jsonObject.toJSONString()).get("DATA");
			
			JSONObject dataInfos=(JSONObject) JSONObject.parseObject(data.toJSONString()).get("DATAINFOS");
			JSONArray  dataInfoArray=(JSONArray) dataInfos.getJSONArray("DATAINFO");
			
			
			ArrayList  dataInfoList=new ArrayList();
			int dataSize=dataInfoArray.size();
			int count=0;
			String categorycode="";
			String categoryname="";
			String code="";
			String desc10="";
			String desc11="";
			String desc20="";
			String desc34="";
			String desclong="";
			String descshort="";
			String uuid="";
			for (Iterator<Object> iterator=dataInfoArray.iterator();iterator.hasNext();) {
				
				JSONObject jsonObject1 = (JSONObject) iterator.next();
				categorycode=jsonObject1.get("CATEGORYCODE").toString();//类别编码的值
				categoryname=jsonObject1.get("CATEGORYNAME").toString();//类别名称的值
				code=jsonObject1.get("CODE").toString();//主编码的值
				desc10=jsonObject1.get("DESC10").toString();//基本计量单位编码的值
				desc11=jsonObject1.get("DESC11").toString();//基本计量单位名称的值
				desc20=jsonObject1.get("DESC20").toString();//状态的值
				desc34=jsonObject1.get("DESC34").toString();//集采标识的值
				desclong=jsonObject1.get("DESCLONG").toString();//长描述的值
				descshort=jsonObject1.get("DESCSHORT").toString();//短描述的值
				uuid=jsonObject1.get("UUID").toString();//UUID的值
			
				//存储到对象中
				commonj.sdo.DataObject materialClass = commonj.sdo.helper.DataFactory.INSTANCE
						       .create("com.zhonghe.ame.purchase.restData",
						         "ZhMaterialsMasterData");
					
				materialClass.set("categorycode", categorycode);
				materialClass.set("categoryname", categoryname);
				materialClass.set("code", code);
				materialClass.set("desc10", desc10);
				materialClass.set("desc11", desc11);
				materialClass.set("desc20", desc20);
				materialClass.set("desc34", desc34);
				materialClass.set("desclong", desclong);
				materialClass.set("descshort", descshort);
				materialClass.set("uuid", uuid);
				materialClass.set("createdBy", "ESB");
				
				//查询是否存在
				Boolean isQuery=queryMaterials.queryMaterialsMaterDataByCode(code);
				//存储到数据库
				Object[] inParametersMa={materialClass};
		
				//抛出异常信息
				String throwableMessage = null;
				Boolean success=false;
				try {
					if (isQuery) {
						ILogicComponent logicComponent=LogicComponentFactory.create("com.zhonghe.ame.purchase.restImp");
						logicComponent.invoke("editMaterialsMaterData", inParametersMa);
					} else {
						ILogicComponent logicComponent=LogicComponentFactory.create("com.zhonghe.ame.purchase.restImp");
						logicComponent.invoke("addMaterialsMaterData", inParametersMa);
					}
					success=true;
					count++;
				} catch (Exception  e) {
					throwableMessage=e.getMessage();
					e.printStackTrace();
				}
				
					
				ZhImpMaterialsSort returnDataInfo=new ZhImpMaterialsSort();
				returnDataInfo.setCode(code);
				returnDataInfo.setUuid(uuid);
				returnDataInfo.setSynresult(success?"0":"1");
				returnDataInfo.setSynstatus(success?"成功":throwableMessage);

				dataInfoList.add(returnDataInfo);
				
				//存储到日志对象中
				commonj.sdo.DataObject materialOperatLog = commonj.sdo.helper.DataFactory.INSTANCE
						       .create("com.zhonghe.ame.purchase.restData",
						         "ZhImplementOperatlog");
				materialOperatLog.set("categorycode", categorycode);
				materialOperatLog.set("categoryname", categoryname);
				materialOperatLog.set("code", code);
				materialOperatLog.set("desc10", desc10);
				materialOperatLog.set("desc11", desc11);
				materialOperatLog.set("desc20", desc20);
				materialOperatLog.set("desc34", desc34);
				materialOperatLog.set("desclong", desclong);
				materialOperatLog.set("descshort", descshort);
				materialOperatLog.set("uuid", uuid);
				
				materialOperatLog.set("puuid", dataInfos.get("PUUID"));
				materialOperatLog.set("syncode", dataInfos.get("SYNCODE"));
				materialOperatLog.set("synstatus", success?"0":"1");
				materialOperatLog.set("synresult", success?"成功":throwableMessage);
				materialsOpLog.setMaterialsSortOpLog(materialOperatLog,"1");
				
				}
		
			//将JSON的Key转成大写
			JSONArray jsonArray=ModifyJsonKeyUtil.transToArray(JSONObject.toJSONString(dataInfoList));
			
			//设置返回结果json
			JSONObject resultDataInfo = new JSONObject();
			resultDataInfo.put("PUUID", dataInfos.get("PUUID"));
			resultDataInfo.put("DATAINFO", jsonArray);
			
			JSONObject resultDataInfos = new JSONObject();
			resultDataInfos.put("DATAINFOS", resultDataInfo);
			
			JSONObject resultEsb = new JSONObject();
			resultEsb.put("RESULT", count>0?"S":"E");
			resultEsb.put("DESC", dataSize==count?"成功添加:"+count:"成功添加:"+count+"   添加失败:"+(dataSize-count));
			resultEsb.put("DATA", resultDataInfos);
			
			JSONObject resultData = new JSONObject();
			resultData.put("ESB", resultEsb);
			
			String resultString=resultData.toJSONString();
			return resultString;
		}

}
