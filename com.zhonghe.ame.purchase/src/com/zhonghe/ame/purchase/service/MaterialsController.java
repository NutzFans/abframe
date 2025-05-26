package com.zhonghe.ame.purchase.service;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import com.eos.foundation.eoscommon.LogUtil;
import com.eos.runtime.core.TraceLoggerFactory;
import com.eos.system.logging.Logger;

@Path("/rest/services")
public class MaterialsController {

	String key = "IUGZD4J7O2XBF78MRUDOISY2";

	MaterialsService materialsService = new MaterialsService();

	Logger logger = TraceLoggerFactory.getLogger(this.getClass());

	// 物资分类信息
	@POST
	@Path("/addMaterialsSort")
	public String addMaterialsSort(String materials) throws Throwable {
		logger.info("物资编码同步 - 物资分类信息接口被调用");

		// 解密
		String material = Rest3DES.getDecString(materials, key);
		logger.info("物资编码同步 - 物资分类信息解密完成");
		logger.info(material);

		// 处理
		String result = materialsService.materialsSort(material);

		return result;
	}

	// 物资主信息
	@POST
	@Path("/addMaterialsMaterData")
	public String addMaterialsMaterData(String materials) throws Throwable {
		logger.info("物资编码同步 - 物资主信息接口被调用");

		// 解密
		String material = Rest3DES.getDecString(materials, key);
		logger.info("物资编码同步 - 物资主信息解密完成");
		logger.info(material);

		// 处理
		String result = materialsService.materialsMasterData(material);

		return result;
	}

	@GET
	@Path("/get")
	public String testCon() {
		return "Test Connection Success";
	}

}
