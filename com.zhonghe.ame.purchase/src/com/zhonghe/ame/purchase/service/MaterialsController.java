package com.zhonghe.ame.purchase.service;


import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import jdk.nashorn.internal.objects.annotations.Getter;

import com.eos.engine.component.ILogicComponent;
import com.primeton.ext.engine.component.LogicComponentFactory;


@Path("/rest/services")
public class MaterialsController{
	MaterialsService materialsService=new MaterialsService();
	
	String  key="IUGZD4J7O2XBF78MRUDOISY2";
	
	//物资分类信息
	@POST
	@Path("/addMaterialsSort")
	//@Consumes("application/x-www-form-urlencoded") @FormParam("materials")
	public String addMaterialsSort(String materials) throws Throwable{
		System.out.print("物资编码同步 - 物资分类信息接口被调用");
		//解密
		String material= Rest3DES.getDecString(materials,key);
		String result=materialsService.materialsSort(material);	
		
		return result;
	}
	
	//物资主信息
	@POST
	@Path("/addMaterialsMaterData")
	//@Consumes("application/x-www-form-urlencoded") @FormParam("materials")
	public String addMaterialsMaterData(String materials) throws Throwable{
		System.out.print("物资编码同步 - 物资主信息接口被调用");
		//解密
		System.out.println(materials);
		String material= Rest3DES.getDecString(materials,key);
		String result=materialsService.materialsMasterData(material);
		
		return result;
	}
	
	@GET
	@Path("/get")
	public String testCon(){
		return "Test Connection Success";
	}

}
