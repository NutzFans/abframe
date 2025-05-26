package com.zhonghe.ame.purchase.service;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import com.eos.foundation.eoscommon.LogUtil;
import com.eos.runtime.core.TraceLoggerFactory;
import com.eos.system.logging.Logger;

@Path("/rest/services")
public class MaterialsController {

	String materialsSortKey = "1WT71G8FQGQR3B1H2MVA699H";

	String materialsMaterDataKey = "IUGZD4J7O2XBF78MRUDOISY2";

	MaterialsService materialsService = new MaterialsService();

	Logger logger = TraceLoggerFactory.getLogger(this.getClass());

	// 物资分类信息
	@POST
	@Path("/addMaterialsSort")
	public String addMaterialsSort(String materials) throws Throwable {
		logger.info("物资分类同步 - 物资分类信息接口被调用");
		logger.info("加密数据：" + materials);

		// 解密
		String material = Rest3DES.getDecString(materials, materialsSortKey);
		logger.info("解密数据：" + material);

		// 处理
		String result = materialsService.materialsSort(material);

		return result;
	}

	// 物资主信息
	@POST
	@Path("/addMaterialsMaterData")
	public String addMaterialsMaterData(String materials) throws Throwable {
		logger.info("物资主信息同步 - 物资主信息接口被调用");
		logger.info("加密数据：" + materials);

		// 解密
		String material = Rest3DES.getDecString(materials, materialsMaterDataKey);
		logger.info("解密数据：" + material);

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
