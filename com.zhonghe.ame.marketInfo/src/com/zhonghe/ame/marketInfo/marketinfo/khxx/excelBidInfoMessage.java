package com.zhonghe.ame.marketInfo.marketinfo.khxx;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.text.CharSequenceUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.ObjUtil;
import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.zhonghe.ame.contractPact.MisCustinfoImpl;
import com.zhonghe.ame.marketInfo.bid.ZhBidinfo;
import com.zhonghe.ame.marketInfo.bid.ZhBidinfoCompetitor;
import com.zhonghe.ame.marketInfo.bid.ZhCompetitor;
import com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoCompetitorImpl;
import com.zhonghe.ame.marketInfo.bid.impl.ZhBidinfoImpl;
import com.zhonghe.ame.marketInfo.bid.impl.ZhCompetitorImpl;

import commonj.sdo.DataObject;

@Bizlet("市场经营信息Excel导入")
public class excelBidInfoMessage {

	@Bizlet("导入市场经营信息")
	public String excleIn(String Url) {
		String error = "";
		try {
			InputStream is = new FileInputStream(Url);
			Workbook workbook;
			Sheet sheet;
			if (CharSequenceUtil.endWith(Url, ".xlsx", true)) {
				workbook = new XSSFWorkbook(is);
				sheet = workbook.getSheetAt(0);
			} else {
				workbook = new HSSFWorkbook(is);
				sheet = workbook.getSheetAt(0);
			}

			List<ZhBidinfo> zhBidinfos = new ArrayList<ZhBidinfo>();
			List<ZhBidinfoCompetitor> zhBidinfoCompetitors = new ArrayList<ZhBidinfoCompetitor>();
			int lastBidId = 0;
			String lastCreateUserId = "";

			for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
				Row row = sheet.getRow(rowNum);
				int nub = rowNum + 1;
				Cell bidOrgCell = row.getCell(1); // 牵头部门
				Cell recordDateCell = row.getCell(2); // 备案时间
				Cell createUserCell = row.getCell(3); // 填报人
				Cell bidNxwlCell = row.getCell(4); // 内协外联
				Cell custNameCell = row.getCell(5); // 甲方全称
				Cell projectNameCell = row.getCell(6); // 项目名称
				Cell investAmountCell = row.getCell(7); // 投资额(万元)
				Cell bidBdeCell = row.getCell(8); // 标的额
				Cell projectPlaceCell = row.getCell(9); // 项目地点
				Cell headquarterGroupCell = row.getCell(10); // 集团内外
				Cell bidFeaturesCell = row.getCell(11); // 特点
				Cell projectTypeCell = row.getCell(12); // 工程类别
				Cell majorTypeCell = row.getCell(13); // 专业类别
				Cell bidServiceCell = row.getCell(14); // 服务范围
				Cell projectFeaturesCell = row.getCell(15); // 主要项目特征
				Cell contractTypeCell = row.getCell(16); // 合同类型
				Cell procurementTypeCell = row.getCell(17); // 采购方式
				Cell bidUnitsNameCell = row.getCell(18); // 参与单位全称
				Cell contractPriceCell = row.getCell(19); // 报价/合同价/万元/%
				Cell contractModelCell = row.getCell(20); // 价格模式
				Cell bidConvertCell = row.getCell(21); // 折合万/人月
				Cell remarkCell = row.getCell(22); // 备注
				Cell bidResultCell = row.getCell(23); // 中标结果

				if (ObjectUtil.isNotNull(bidOrgCell) && CharSequenceUtil.isNotBlank(bidOrgCell.getStringCellValue())) {
					if (ObjectUtil.isAllNotEmpty(recordDateCell, createUserCell, bidNxwlCell, custNameCell, projectNameCell, investAmountCell, bidBdeCell, projectPlaceCell,
							headquarterGroupCell, bidFeaturesCell, projectTypeCell, majorTypeCell, bidServiceCell, contractTypeCell, procurementTypeCell, bidUnitsNameCell,
							contractPriceCell, contractModelCell, bidConvertCell, bidResultCell)) {
						ZhBidinfoImpl zhBidinfoImpl = new ZhBidinfoImpl();
						// 牵头部门
						String bidOrg = this.queryDict("ZH_BID_ORG", CharSequenceUtil.trim(bidOrgCell.getStringCellValue()));
						if (CharSequenceUtil.isNotBlank(bidOrg)) {
							zhBidinfoImpl.setBidOrg(bidOrg);
						} else {
							error = "第" + nub + "行，【牵头部门】内容错误";
							break;
						}
						// 备案时间
						zhBidinfoImpl.setRecordDate(recordDateCell.getDateCellValue());
						// 填报人
						String createUserId = this.queryUserEmpByName(CharSequenceUtil.trim(createUserCell.getStringCellValue()));
						if (CharSequenceUtil.isNotBlank(createUserId)) {
							zhBidinfoImpl.setCreateUserid(createUserId);
						} else {
							error = "第" + nub + "行，【填报人】内容错误";
							break;
						}
						// 内协外联
						String bidNxwl = this.queryDict("ZH_BID_NXWL", CharSequenceUtil.trim(bidNxwlCell.getStringCellValue()));
						if (CharSequenceUtil.isNotBlank(bidNxwl)) {
							zhBidinfoImpl.setBidNxwl(bidNxwl);
						} else {
							error = "第" + nub + "行，【内协外联】内容错误";
							break;
						}
						// 甲方全称
						zhBidinfoImpl.setCustId(this.querySignatoryIdByName(StrUtil.trim(custNameCell.getStringCellValue()), createUserId));
						// 项目名称
						zhBidinfoImpl.setProjectName(StrUtil.trim(projectNameCell.getStringCellValue()));
						// 投资额(万元)
						investAmountCell.setCellType(CellType.STRING);
						if (NumberUtil.isNumber(StrUtil.trim(investAmountCell.getStringCellValue()))) {
							zhBidinfoImpl.setInvestAmount(NumberUtil.roundStr(StrUtil.trim(investAmountCell.getStringCellValue()), 2));
						} else {
							zhBidinfoImpl.setInvestAmount(StrUtil.trim(investAmountCell.getStringCellValue()));
						}

						// 标的额
						String bidBde = this.queryDict("ZH_BID_BDE", StrUtil.trim(bidBdeCell.getStringCellValue()));
						if (StrUtil.isNotBlank(bidBde)) {
							zhBidinfoImpl.setBidBde(bidBde);
						} else {
							error = "第" + nub + "行，【标的额】内容错误";
							break;
						}
						// 项目地点
						zhBidinfoImpl.setProjectPlace(StrUtil.trim(projectPlaceCell.getStringCellValue()));
						// 集团内外
						String headquarterGroup = this.queryDict("ZH_GROUP", StrUtil.trim(headquarterGroupCell.getStringCellValue()));
						if (StrUtil.isNotBlank(headquarterGroup)) {
							zhBidinfoImpl.setHeadquarterGroup(headquarterGroup);
						} else {
							error = "第" + nub + "行，【集团内外】内容错误";
							break;
						}
						// 特点
						String bidFeatures = this.queryDict("ZH_BID_FEATURES", StrUtil.trim(bidFeaturesCell.getStringCellValue()));
						if (StrUtil.isNotBlank(bidFeatures)) {
							zhBidinfoImpl.setBidFeatures(bidFeatures);
						} else {
							error = "第" + nub + "行，【特点】内容错误";
							break;
						}
						// 工程类别
						String projectType = this.queryDict("ZH_PROJECT_TYPE", StrUtil.trim(projectTypeCell.getStringCellValue()));
						if (StrUtil.isNotBlank(projectType)) {
							zhBidinfoImpl.setProjectType(projectType);
						} else {
							error = "第" + nub + "行，【工程类别】内容错误";
							break;
						}
						// 专业类别
						String majorType = this.queryDict("ZH_MAJOR_TYPE", StrUtil.trim(majorTypeCell.getStringCellValue()));
						if (StrUtil.isNotBlank(majorType)) {
							zhBidinfoImpl.setMajorType(majorType);
						} else {
							error = "第" + nub + "行，【专业类别】内容错误";
							break;
						}
						// 服务范围
						String bidService = this.queryDict("ZH_BID_SERVICE", StrUtil.trim(bidServiceCell.getStringCellValue()));
						if (StrUtil.isNotBlank(bidService)) {
							zhBidinfoImpl.setBidService(bidService);
						} else {
							error = "第" + nub + "行，【服务范围】内容错误";
							break;
						}
						// 主要项目特征
						zhBidinfoImpl.setProjectFeatures(StrUtil.trim(projectFeaturesCell.getStringCellValue()));
						// 合同类型
						String contractType = this.queryDict("ZH_BID_CONTRACT_TYPE", StrUtil.trim(contractTypeCell.getStringCellValue()));
						if (StrUtil.isNotBlank(contractType)) {
							zhBidinfoImpl.setContractType(contractType);
						} else {
							error = "第" + nub + "行，【合同类型】内容错误";
							break;
						}
						// 采购方式
						String procurementType = this.queryDict("ZH_BID_PROCUREMENT_TYPE", StrUtil.trim(procurementTypeCell.getStringCellValue()));
						if (StrUtil.isNotBlank(procurementType)) {
							zhBidinfoImpl.setProcurementType(procurementType);
						} else {
							error = "第" + nub + "行，【采购方式】内容错误";
							break;
						}
						// 参与单位（我方）
						List<String> bidUnitsNameList = StrUtil.splitTrim(bidUnitsNameCell.getStringCellValue(), "、");
						List<String> bidUnitsList = new ArrayList<String>();
						for (String bidUnitsName : bidUnitsNameList) {
							String bidUnits = this.queryDict("ZH_BID_UNITS", bidUnitsName);
							if (StrUtil.isNotBlank(bidUnits)) {
								bidUnitsList.add(bidUnits);
							} else {
								error = "第" + nub + "行，【参与单位】内容错误";
								break;
							}
						}
						if (StrUtil.isNotBlank(error)) {
							break;
						} else {
							String bidUnitsCode = StrUtil.join(",", bidUnitsList);
							String bidUnitsName = StrUtil.join(",", bidUnitsNameList);
							zhBidinfoImpl.setBidUnitsCode(bidUnitsCode);
							zhBidinfoImpl.setBidUnitsName(bidUnitsName);
						}
						// 报价/合同价/万元/%
						contractPriceCell.setCellType(CellType.STRING);
						if (NumberUtil.isNumber(StrUtil.trim(contractPriceCell.getStringCellValue()))) {
							zhBidinfoImpl.setContractPrice(NumberUtil.roundStr(StrUtil.trim(contractPriceCell.getStringCellValue()), 2));
						} else {
							zhBidinfoImpl.setContractPrice(StrUtil.trim(contractPriceCell.getStringCellValue()));
						}
						// 价格模式
						String contractModel = this.queryDict("CONTRACT_MODEL", StrUtil.trim(contractModelCell.getStringCellValue()));
						if (StrUtil.isNotBlank(contractModel)) {
							zhBidinfoImpl.setContractModel(contractModel);
						} else {
							error = "第" + nub + "行，【价格模式】内容错误";
							break;
						}
						// 折合万/人月
						bidConvertCell.setCellType(CellType.STRING);
						if (NumberUtil.isNumber(StrUtil.trim(bidConvertCell.getStringCellValue()))) {
							zhBidinfoImpl.setBidConvert(NumberUtil.roundStr(StrUtil.trim(bidConvertCell.getStringCellValue()), 2));
						} else {
							zhBidinfoImpl.setBidConvert(StrUtil.trim(bidConvertCell.getStringCellValue()));
						}
						// 备注
						if (ObjUtil.isNotNull(remarkCell)) {
							remarkCell.setCellType(CellType.STRING);
							zhBidinfoImpl.setRemark(StrUtil.trim(remarkCell.getStringCellValue()));
						}
						// 中标结果
						String bidResult = this.queryDict("ZH_BID_RESULT", StrUtil.trim(bidResultCell.getStringCellValue()));
						if (StrUtil.isNotBlank(bidResult)) {
							zhBidinfoImpl.setBidResult(bidResult);
						} else {
							error = "第" + nub + "行，【中标结果】内容错误";
							break;
						}
						zhBidinfoImpl.setCreateDate(new Date());
						zhBidinfoImpl.setBidDataStatus("1");
						DatabaseExt.getPrimaryKey(zhBidinfoImpl);
						lastBidId = zhBidinfoImpl.getId();
						lastCreateUserId = zhBidinfoImpl.getCreateUserid();
						zhBidinfos.add(zhBidinfoImpl);
					} else {
						error = "第" + nub + "行，除【'备注'】外，其他都为必填项，请检查！";
						break;
					}
				} else if (ObjectUtil.isNotNull(bidUnitsNameCell) && CharSequenceUtil.isNotBlank(bidUnitsNameCell.getStringCellValue())) {
					ZhBidinfoCompetitorImpl zhBidinfoCompetitorImpl = new ZhBidinfoCompetitorImpl();
					zhBidinfoCompetitorImpl.setCompetId(this.queryCompetByName(StrUtil.trim(bidUnitsNameCell.getStringCellValue()), lastCreateUserId));
					// 报价/合同价/万元/%
					if (ObjUtil.isNotNull(contractPriceCell)) {
						contractPriceCell.setCellType(CellType.STRING);
						if (StrUtil.isNotBlank(contractPriceCell.getStringCellValue())) {
							if (NumberUtil.isNumber(StrUtil.trim(contractPriceCell.getStringCellValue()))) {
								zhBidinfoCompetitorImpl.setCompetContractPrice(NumberUtil.roundStr(StrUtil.trim(contractPriceCell.getStringCellValue()), 2));
							} else {
								zhBidinfoCompetitorImpl.setCompetContractPrice(StrUtil.trim(contractPriceCell.getStringCellValue()));
							}
						} else {
							error = "第" + nub + "行，【报价/合同价/万元/%】内容错误";
							break;
						}
					} else {
						error = "第" + nub + "行，【报价/合同价/万元/%】内容错误";
						break;
					}
					zhBidinfoCompetitorImpl.setBidId(lastBidId);
					DatabaseExt.getPrimaryKey(zhBidinfoCompetitorImpl);
					zhBidinfoCompetitors.add(zhBidinfoCompetitorImpl);
				} else {
					continue;
				}
			}
			if (StrUtil.isNotBlank(error)) {
				return error;
			} else {
				DatabaseUtil.insertEntityBatch("default", ArrayUtil.toArray(zhBidinfos, ZhBidinfo.class));
				DatabaseUtil.insertEntityBatch("default", ArrayUtil.toArray(zhBidinfoCompetitors, ZhBidinfoCompetitor.class));
				return "导入成功";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "导入出现未知错误，请联系管理员";
		}
	}

	private DataObject queryOneEntity(String sqlName, HashMap<String, Object> parameter) {
		Object[] objects = DatabaseExt.queryByNamedSql("default", sqlName, parameter);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
		if (dataObjects != null && dataObjects.length > 0) {
			return dataObjects[0];
		}
		return null;
	}

	private String queryDict(String DICTTYPEID, String DICTNAME) {
		String DICTID = "";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("DICTTYPEID", DICTTYPEID);
		map.put("DICTNAME", DICTNAME);
		DataObject dataObject = this.queryOneEntity("com.zhonghe.ame.payment.payMent.queryDict", map);
		if (dataObject != null) {
			DICTID = dataObject.getString("DICTID");
		}
		return DICTID;
	}

	private String queryUserEmpByName(String str) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("EMPNAME", str);
		DataObject emp = this.queryOneEntity("com.zhonghe.ame.payment.payMent.queryUserEmpByName", map);
		if (emp != null) {
			return emp.getString("empcode");
		} else {
			return null;
		}
	}

	private int querySignatoryIdByName(String str, String createUserId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("CUSTNAME", str);
		DataObject cust = this.queryOneEntity("com.zhonghe.ame.payment.payMent.querySignatoryIdByName", map);
		if (cust != null) {
			return cust.getInt("custid");
		} else {
			MisCustinfoImpl misCustinfoImpl = new MisCustinfoImpl();
			DatabaseExt.getPrimaryKey(misCustinfoImpl);
			misCustinfoImpl.setCustname(str);
			misCustinfoImpl.setCreateUserid(createUserId);
			misCustinfoImpl.setCreateDate(new Date());
			DatabaseUtil.insertEntity("default", misCustinfoImpl);
			return misCustinfoImpl.getInt("custid");
		}
	}

	private int queryCompetByName(String str, String createUserId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("competName", str);
		DataObject compet = this.queryOneEntity("com.zhonghe.ame.payment.payMent.queryCompetByName", map);
		if (compet != null) {
			return compet.getInt("competId");
		} else {
			ZhCompetitorImpl zhCompetitorImpl = new ZhCompetitorImpl();
			DatabaseExt.getPrimaryKey(zhCompetitorImpl);
			zhCompetitorImpl.setCompetName(str);
			zhCompetitorImpl.setCreateUserid(createUserId);
			zhCompetitorImpl.setCreateDate(new Date());
			DatabaseUtil.insertEntity("default", zhCompetitorImpl);
			return zhCompetitorImpl.getInt("competId");
		}
	}

}
