package com.zhonghe.ame.marketInfo.marketinfo.khxx;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("")
public class excelMyBidMessage {
	@Bizlet("投标信息导入")
	public String excleIn(String Url) {
		String error = "";
		String err = "";
		try {
			InputStream is = new FileInputStream(Url);
			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
			HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
			List<ZhBidinfo> listAdd = new ArrayList<ZhBidinfo>();
			for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
				HSSFRow hssfRow = hssfSheet.getRow(rowNum);
				int nub = rowNum + 1;
				if (hssfRow.getCell(rowNum) == null) {
					break;
				}
				ZhBidinfoImpl zImpl = new ZhBidinfoImpl();
				DatabaseExt.getPrimaryKey(zImpl);
				
				//牵头部门
				if (hssfRow.getCell((short) 1) == null) {//单元格为空处理
					hssfRow.createCell((short) 1).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 1).getStringCellValue())));
				}else {
					hssfRow.getCell((short) 1).setCellType(CellType.STRING);
					int orgId = queryOrgIdByOrgName(hssfRow.getCell((short) 1).getStringCellValue());
					zImpl.setOrgId(orgId);
				}
				
				//定标时间
				if (hssfRow.getCell((short) 2) == null) {//单元格为空处理
					hssfRow.createCell((short) 2).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 2).getStringCellValue())));
				}else {
					zImpl.setBidOpenTime(hssfRow.getCell((short) 2).getDateCellValue());
				}
				
				//填报人
				if (hssfRow.getCell((short) 3) == null) {//单元格为空处理
					hssfRow.createCell((short) 3).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 3).getStringCellValue())));
				}else {
					String createUserid = queryUserIdByUserName(hssfRow.getCell((short) 3).getStringCellValue());
					zImpl.setCreatUserid(createUserid);
				}
				
				//内联外协
				if (hssfRow.getCell((short) 4) == null) {//单元格为空处理
					hssfRow.createCell((short) 4).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 4).getStringCellValue())));
				}else {
					String externalType = queryDict("EXTERNAL_TYPE", hssfRow.getCell((short) 4).getStringCellValue());
					zImpl.setExternalType(externalType);
				}
				
				//甲方全称
				if (hssfRow.getCell((short) 5) == null) {//单元格为空处理
					hssfRow.createCell((short) 5).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 5).getStringCellValue())));
				}else {
					zImpl.setPartyName(hssfRow.getCell((short) 5).getStringCellValue());
				}
				
				//项目名称
				if (hssfRow.getCell((short) 6) == null) {//单元格为空处理
					hssfRow.createCell((short) 6).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 6).getStringCellValue())));
				}else {
					zImpl.setProjectName(hssfRow.getCell((short) 6).getStringCellValue());
				}
				
				//投资额/万
				if (hssfRow.getCell((short) 7) == null) {//单元格为空处理
					hssfRow.createCell((short) 7).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 7).getStringCellValue())));
				}else {
					hssfRow.getCell((short) 7).setCellType(CellType.STRING);
					zImpl.setInvestmentAmount(hssfRow.getCell((short) 7).getStringCellValue());
				}
				
				//标的额
				if (hssfRow.getCell((short) 8) == null) {//单元格为空处理
					hssfRow.createCell((short) 8).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 8).getStringCellValue())));
				}else {
					String matterAmount = queryDict("MATTER_AMOUNT", hssfRow.getCell((short) 8).getStringCellValue());
					zImpl.setMatterAmount(matterAmount);
				}
				
				//项目地点
				if (hssfRow.getCell((short) 9) == null) {//单元格为空处理
					hssfRow.createCell((short) 9).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 9).getStringCellValue())));
				}else {
					zImpl.setProjectLocal(hssfRow.getCell((short) 9).getStringCellValue());
				}
				
				//集团内外
				if (hssfRow.getCell((short) 10) == null) {//单元格为空处理
					hssfRow.createCell((short) 10).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 10).getStringCellValue())));
				}else {
					String headquarterGroup = queryDict("HEADQUARTER_GROUP", hssfRow.getCell((short) 10).getStringCellValue());
					zImpl.setHeadquarterGroup(headquarterGroup);
				}
				
				//特点
				if (hssfRow.getCell((short) 11) == null) {//单元格为空处理
					hssfRow.createCell((short) 11).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 11).getStringCellValue())));
				}else {
					String characteristics = queryDict("CHARACTERISTICS", hssfRow.getCell((short) 11).getStringCellValue());
					zImpl.setCharacteristics(characteristics);
				}
				
				//工程类别
				if (hssfRow.getCell((short) 12) == null) {//单元格为空处理
					hssfRow.createCell((short) 12).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 12).getStringCellValue())));
				}else {
					String serviceType = queryDict("SERVICE_TYPE", hssfRow.getCell((short) 12).getStringCellValue());
					zImpl.setServiceType(serviceType);
				}
				
				//专业类别
				if (hssfRow.getCell((short) 13) == null) {//单元格为空处理
					hssfRow.createCell((short) 13).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 13).getStringCellValue())));
				}else {
					String major = queryDict("BID_MAJOR", hssfRow.getCell((short) 13).getStringCellValue());
					zImpl.setMajor(major);
				}
				
				//服务范围
				if (hssfRow.getCell((short) 14) == null) {//单元格为空处理
					hssfRow.createCell((short) 14).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 14).getStringCellValue())));
				}else {
					String scopeService = queryDict("SCOPE_SERVICE", hssfRow.getCell((short) 14).getStringCellValue());
					zImpl.setScopeService(scopeService);
				}
				
				//主要项目特征
				if (hssfRow.getCell((short) 15) == null) {//单元格为空处理
					hssfRow.createCell((short) 15).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 15).getStringCellValue())));
				}else {
					zImpl.setFeatures(hssfRow.getCell((short) 15).getStringCellValue());
				}
				
				//合同类型
				if (hssfRow.getCell((short) 16) == null) {//单元格为空处理
					hssfRow.createCell((short) 16).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 16).getStringCellValue())));
				}else {
					String contractType = queryDict("CONTRACT_TYPE", hssfRow.getCell((short) 16).getStringCellValue());
					zImpl.setContractType(contractType);
				}
				
				//采购方式
				if (hssfRow.getCell((short) 17) == null) {//单元格为空处理
					hssfRow.createCell((short) 17).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 17).getStringCellValue())));
				}else {
					String procurementType = queryDict("BIDPROCUREMENT_TYPE", hssfRow.getCell((short) 17).getStringCellValue());
					zImpl.setProcurementType(procurementType);
				}
				
				//价格模式
				if (hssfRow.getCell((short) 20) == null) {//单元格为空处理
					hssfRow.createCell((short) 20).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 20).getStringCellValue())));
				}else {
					String priceModel = queryDict("PRICE_MODEL", hssfRow.getCell((short) 20).getStringCellValue());
					zImpl.setPriceModel(priceModel);
				}
				
				//折合万/人月
				if (hssfRow.getCell((short) 21) == null) {//单元格为空处理
					hssfRow.createCell((short) 21).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 21).getStringCellValue())));
				}else {
					hssfRow.getCell((short) 21).setCellType(CellType.STRING);
					zImpl.setEquivalent(hssfRow.getCell((short) 21).getStringCellValue());
				}
				
				//备注
				if (hssfRow.getCell((short) 22) == null) {//单元格为空处理
					hssfRow.createCell((short) 22).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 22).getStringCellValue())));
				}else {
					zImpl.setRemake(hssfRow.getCell((short) 22).getStringCellValue());
				}
				
				//中标结果
				if (hssfRow.getCell((short) 23) == null) {//单元格为空处理
					hssfRow.createCell((short) 23).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 23).getStringCellValue())));
				}else {
					String BidResult = queryDict("BID_RESULT", hssfRow.getCell((short) 23).getStringCellValue());
					zImpl.setBidResult(BidResult);
				}
				if (hssfRow.getCell((short) 1).getStringCellValue() == null || hssfRow.getCell((short) 1).getStringCellValue() == ""
						) ;else {
					listAdd.add(zImpl);
				}
				
			}
			ZhBidinfo[] arrAdd = new ZhBidinfo[listAdd.size()];
			if (error == null || error == "") {
				if (arrAdd.length != 0) {
					listAdd.toArray(arrAdd);
					DatabaseUtil.insertEntityBatch("default", arrAdd);
				}
				excleInBid(Url);
				error = "导入成功";
			}
		} catch (FileNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return error;
	}
	
	
	//根据牵头部门名称获取其orgId
	@Bizlet
	public static int queryOrgIdByOrgName(String str){
		int orgid = 0;
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("ORGNAME",str);
		DataObject org = queryOneEntity("com.zhonghe.ame.marketInfo.myCreatedBid.MyCreateBid.queryOrg", map);
		if (org != null) {
			orgid = org.getInt("orgid");
		}
		return orgid;
	}
	
	@Bizlet("获取填报人")
	public static String queryUserIdByUserName(String str){
		String userId = "";
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("EMPNAME",str);
		DataObject org = queryOneEntity("com.zhonghe.ame.marketInfo.myCreatedBid.MyCreateBid.queryUserId", map);
		if (org != null) {
			userId = org.getString("USERID");
		}
		return userId;
	}
	
	@Bizlet("根据业务字典名称及编号查询id")
	public static String queryDict(String DICTTYPEID,String DICTNAME){
		String DICTID = "";
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("DICTTYPEID",DICTTYPEID);
		map.put("DICTNAME",DICTNAME);
		DataObject org = queryOneEntity("com.zhonghe.ame.marketInfo.myCreatedBid.MyCreateBid.queryDict", map);
		if (org != null) {
			DICTID = org.getString("DICTID");
		}
		return DICTID;
	}
	
	
	
	public static DataObject queryOneEntity(String sqlName,HashMap<String,Object> parameter){
		Object[] objects = DatabaseExt.queryByNamedSql("default",sqlName,parameter);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects,"commonj.sdo.DataObject",true);
		if(dataObjects != null && dataObjects.length > 0){
			return dataObjects[0];
		}
		
		return null;
	}
	
	public void excleInBid(String Url) {
		try {
			InputStream is = new FileInputStream(Url);
			String projectName = "";
			String projectNameNew = "";
			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
			HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
			List<ZhBidinfoCompetitor> listAdds = new ArrayList<ZhBidinfoCompetitor>();
			for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
				HSSFRow hssfRow = hssfSheet.getRow(rowNum);
				int nub = rowNum + 1;
				if (hssfRow.getCell(rowNum) == null) {
					break;
				}
				ZhBidinfoCompetitorImpl impl = new ZhBidinfoCompetitorImpl();
				DatabaseExt.getPrimaryKey(impl);
				//项目名称
				if (hssfRow.getCell((short) 6) == null) {//单元格为空处理
					hssfRow.createCell((short) 6).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 6).getStringCellValue())));
				}else {
					projectNameNew = hssfRow.getCell((short) 6).getStringCellValue();
				}
				
				if (projectNameNew == null || projectNameNew == "");else {
					projectName = projectNameNew;
				}
				
				impl.setBidId(queryProjectIdbyName(projectName));
				
				//参与单位全称18
				if (hssfRow.getCell((short) 18) == null) {//单元格为空处理
					hssfRow.createCell((short) 18).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 18).getStringCellValue())));
				}else {
					impl.setCompetId(queryCompetitor(hssfRow.getCell((short) 18).getStringCellValue()));
				}
				//报价/合同价/万元/%19
				if (hssfRow.getCell((short) 19) == null) {//单元格为空处理
					hssfRow.createCell((short) 19).setCellValue(new HSSFRichTextString(String.valueOf(hssfRow.getCell((short) 19).getStringCellValue())));
				}else {
					hssfRow.getCell((short) 19).setCellType(CellType.STRING);
					impl.setCompetBidPrice(hssfRow.getCell((short) 19).getStringCellValue());
				}
				listAdds.add(impl);
			}
			ZhBidinfoCompetitor[] arrAdds = new ZhBidinfoCompetitor[listAdds.size()];
			if (arrAdds.length != 0) {
				listAdds.toArray(arrAdds);
				DatabaseUtil.insertEntityBatch("default", arrAdds);
			}
		} catch (FileNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
	}
	
	
	public static int queryProjectIdbyName(String str){
		int id = 0;
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("projectName",str);
		DataObject org = queryOneEntity("com.zhonghe.ame.marketInfo.myCreatedBid.MyCreateBid.queryProject", map);
		if (org != null) {
			id = org.getInt("id");
		}
		return id;
	}
	
	public static int queryCompetitor(String str){
		int custId = 0;
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("CUSTNAME",str);
		DataObject org = queryOneEntity("com.zhonghe.ame.marketInfo.myCreatedBid.MyCreateBid.queryCompetitor", map);
		if (org != null) {
			custId = org.getInt("CUSTID");
		}else {
			custId = insertCompetitor(str);
		}
		return custId;
	}
	
	public static int insertCompetitor(String str){
		int custId = 0;
		ZhCompetitorImpl impl = new ZhCompetitorImpl();
		DatabaseExt.getPrimaryKey(impl);
		impl.setCustname(str);
		DatabaseUtil.insertEntity("default", impl);
		custId = impl.getInt("custid");
		return custId;
	}
	
//	@Bizlet("")
//	public static DataObject[] queryEntities(String sqlName,HashMap<String,Object> parameter, String entityName){
//		Object[] objects = DatabaseExt.queryByNamedSql("default",sqlName,parameter);
//		return DataObjectUtil.convertDataObjects(objects,entityName,true);
//	}
	
	@Bizlet("")
	public static DataObject[] queryEntities(String sqlName,HashMap<String,Object> parameter){
		Object[] objects = DatabaseExt.queryByNamedSql("default",sqlName,parameter);
		return DataObjectUtil.convertDataObjects(objects,"commonj.sdo.DataObject",true);
	}
	
	
	
}
