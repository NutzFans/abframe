package com.zhonghe.ame.payContract.payContract.impl;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet
public class excelPayContractMessage {

	private static String ln = "<br>";

	@Bizlet
	public String excleIn(String Url) {
		String error = "";
		String err = "";
		try {
			InputStream is = new FileInputStream(Url);
			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
			HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
			for (int rowNum = 2; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
				HSSFRow hssfRow = hssfSheet.getRow(rowNum);
				ZhPayContractImpl book = new ZhPayContractImpl();
				DatabaseExt.getPrimaryKey(book);
				int nub = rowNum + 1;
				//合同经办人
				if (hssfRow.getCell((short) 1).getStringCellValue() == null
						|| hssfRow.getCell((short) 1).getStringCellValue() == "") {
					err = "第" + nub + "行，第2列合同经办人为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					book.setCreateUsername(hssfRow.getCell((short) 1) + "");
				}
				// 合同承办部门
				hssfRow.getCell((short) 2).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 2).getStringCellValue() == null
						|| hssfRow.getCell((short) 2).getStringCellValue() == "") {
					err = "第" + nub + "行，第3列合同承办部门为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					String type = organizer(hssfRow.getCell((short) 2).getStringCellValue());
					book.setOrganizer(type);
				}
				// 合同编号
				if (hssfRow.getCell((short) 3).getStringCellValue() == null
						|| hssfRow.getCell((short) 3).getStringCellValue() == "") {
					err = "第" + nub + "行，第4列合同编号为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					book.setContractNo(hssfRow.getCell((short) 3) + "");
				}
				// 合同名称
				hssfRow.getCell((short) 4).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 4).getStringCellValue() == null
						|| hssfRow.getCell((short) 4).getStringCellValue() == "") {
					err = "第" + nub + "行，第5列合同名称为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					book.setContractName(hssfRow.getCell((short) 4) + "");
				}
				// 合同金额
				hssfRow.getCell((short) 5).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 5).getStringCellValue() == null
						|| hssfRow.getCell((short) 5).getStringCellValue() == "") {
					err = "第" + nub + "行，第6列合同金额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					hssfRow.getCell((short) 5).setCellType(CellType.STRING);
					String sum = hssfRow.getCell((short) 5)
							.getStringCellValue();
					Boolean boolean1 = isNumber(sum);
					if (boolean1.equals(true)) {
						book.setContractSum(hssfRow.getCell((short) 5) + "");
					} else {
						err = "第" + nub + "行，第6列合同金额内容格式为00.00，请检查！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}
				//合同最终金额
				hssfRow.getCell((short) 6).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 6).getStringCellValue() == null
						|| hssfRow.getCell((short) 6).getStringCellValue() == "") {
					err = "第" + nub + "行，第7列合同最终金额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					hssfRow.getCell((short) 6).setCellType(CellType.STRING);
					String sum = hssfRow.getCell((short) 6)
							.getStringCellValue();
					Boolean boolean1 = isNumber(sum);
					if (boolean1.equals(true)) {
						book.setFinalSum(hssfRow.getCell((short) 6) + "");
					} else {
						err = "第" + nub + "行，第7列合同最终金额内容格式为00.00，请检查！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}
				//合同不含税金额
				hssfRow.getCell((short) 7).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 7).getStringCellValue() == null
						|| hssfRow.getCell((short) 7).getStringCellValue() == "") {
					err = "第" + nub + "行，第8列合同不含税金额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					hssfRow.getCell((short) 7).setCellType(CellType.STRING);
					String sum = hssfRow.getCell((short) 7)
							.getStringCellValue();
					Boolean boolean1 = isNumber(sum);
					if (boolean1.equals(true)) {
						book.setNoTaxSum(hssfRow.getCell((short) 7) + "");
					} else {
						err = "第" + nub + "行，第8列合同不含税金额内容格式为00.00，请检查！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}
				//税额
				hssfRow.getCell((short) 8).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 8).getStringCellValue() == null
						|| hssfRow.getCell((short) 8).getStringCellValue() == "") {
					err = "第" + nub + "行，第9列税额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					hssfRow.getCell((short) 8).setCellType(CellType.STRING);
					String sum = hssfRow.getCell((short) 8)
							.getStringCellValue();
					Boolean boolean1 = isNumber(sum);
					if (boolean1.equals(true)) {
						book.setPayTax(hssfRow.getCell((short) 8) + "");
					} else {
						err = "第" + nub + "行，第9列税额内容格式为00.00，请检查！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}
				// 合同余额
				hssfRow.getCell((short) 9).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 9).getStringCellValue() == null
						|| hssfRow.getCell((short) 9).getStringCellValue() == "") {
					err = "第" + nub + "行，第10列合同余额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					hssfRow.getCell((short) 9).setCellType(CellType.STRING);
					String sum = hssfRow.getCell((short) 9)
							.getStringCellValue();
					Boolean boolean1 = isNumber(sum);
					if (boolean1.equals(true)) {
						book.setContractBalance(hssfRow.getCell((short) 9) + "");
					} else {
						err = "第" + nub + "行，第10列合同余额内容格式为00.00，请检查！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}
				// 执行状态
				hssfRow.getCell((short) 10).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 10).getStringCellValue() == null
						|| hssfRow.getCell((short) 10).getStringCellValue() == "") {
					err = "第" + nub + "行，第11列执行状态为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					if (hssfRow.getCell((short) 16).getStringCellValue()
							.equals("执行")) {
						book.setExecuteStatus("1");
					} else if (hssfRow.getCell((short) 16).getStringCellValue()
							.equals("完成")) {
						book.setExecuteStatus("2");
					}else {
						book.setExecuteStatus(hssfRow.getCell((short) 10) + "");
					}
				}
				// 签约方
				hssfRow.getCell((short) 11).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 11).getStringCellValue() == null
						|| hssfRow.getCell((short) 11).getStringCellValue() == "") {
					err = "第" + nub + "行，第12列签约方为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					book.setSignatory(hssfRow.getCell((short) 11) + "");
				}
				// 合同签约主体
				hssfRow.getCell((short) 12).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 12).getStringCellValue() == null
						|| hssfRow.getCell((short) 12).getStringCellValue() == "") {
					err = "第" + nub + "行，第13列合同签约主体为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					String type = contractSubject(hssfRow.getCell((short) 12) + "");
					book.setContractSubject(type);
				}
				// 付款方
				hssfRow.getCell((short) 13).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 13).getStringCellValue() == null
						|| hssfRow.getCell((short) 13).getStringCellValue() == "") {
					err = "第" + nub + "行，第14列付款方为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					String type = contractSubject(hssfRow.getCell((short) 13) + "");
					book.setPayer(type);
				}
				// 签订日期
				String format = "yyyy-MM-dd";
				String signingDate = hssfRow.getCell((short) 14)
						.getStringCellValue();
				if (signingDate == null || signingDate == "") {
					err = "第" + nub + "行，第15列签订日期为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					Boolean boolean2 = isValid(signingDate);
					if (boolean2.equals(true)) {
						SimpleDateFormat sdf = new SimpleDateFormat(format);
						Date edate = sdf.parse(signingDate);
						book.setSigningDate(edate);// 签订日期
					} else {
						err = "第" + nub + "行，第15列签订日期格式异常，请检查！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}
				// 合同类型/标的.
				hssfRow.getCell((short) 15).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 15).getStringCellValue() == null
						|| hssfRow.getCell((short) 15).getStringCellValue() == "") {
					err = "第" + nub + "行，第16列合同类型为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					String type = contractType(hssfRow.getCell((short) 15)
							.getStringCellValue());
					book.setContractType(type);
				}
				// 合同密级
				hssfRow.getCell((short) 16).setCellType(CellType.STRING);// 获取表格中数据并转为String类型
				if (hssfRow.getCell((short) 16).getStringCellValue() == null
						|| hssfRow.getCell((short) 16).getStringCellValue() == "") {
					err = "第" + nub + "行，第17列合同密级为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					if (hssfRow.getCell((short) 16).getStringCellValue()
							.equals("非密")) {
						book.setContractSecretLevel("1");
					} else if (hssfRow.getCell((short) 16).getStringCellValue()
							.equals("普通商密")) {
						book.setContractSecretLevel("2");
					}else if (hssfRow.getCell((short) 16).getStringCellValue()
							.equals("内部")) {
						book.setContractSecretLevel("3");
					} else {
						book.setContractSecretLevel(hssfRow.getCell((short) 16) + "");
					}
				}
				// 项目密级
				hssfRow.getCell((short) 17).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 17).getStringCellValue() == null
						|| hssfRow.getCell((short) 17).getStringCellValue() == "") {
					err = "第" + nub + "行，第18列项目密级为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					if (hssfRow.getCell((short) 17).getStringCellValue()
							.equals("非密")) {
						book.setProjectSecretLevel("1");
					} else if (hssfRow.getCell((short) 17).getStringCellValue()
							.equals("秘密")) {
						book.setProjectSecretLevel("2");
					} else if (hssfRow.getCell((short) 17).getStringCellValue()
							.equals("机密")) {
						book.setProjectSecretLevel("3");
					} else if (hssfRow.getCell((short) 17).getStringCellValue()
							.equals("绝密")) {
						book.setProjectSecretLevel("4");
					} else {
						book.setProjectSecretLevel(hssfRow.getCell((short) 17)
								+ "");
					}
				}
				// 是否为SM协作配套
				hssfRow.getCell((short) 18).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 18).getStringCellValue() == null
						|| hssfRow.getCell((short) 18).getStringCellValue() == "") {
					err = "第" + nub + "行，第19列是否为SM协作配套为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					if (hssfRow.getCell((short) 18).getStringCellValue()
							.equals("是")) {
						book.setIssm("y");
					} else if (hssfRow.getCell((short) 18).getStringCellValue()
							.equals("否")) {
						book.setIssm("n");
					} else {
						book.setIssm(hssfRow.getCell((short) 18) + "");
					}
				}
				// 是否为补充协议
				hssfRow.getCell((short) 19).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 19).getStringCellValue() == null
						|| hssfRow.getCell((short) 19).getStringCellValue() == "") {
					err = "第" + nub + "行，第20列是否为补充协议为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					if (hssfRow.getCell((short) 19).getStringCellValue()
							.equals("是")) {
						book.setIssupagreement("y");
					} else if (hssfRow.getCell((short) 19).getStringCellValue()
							.equals("否")) {
						book.setIssupagreement("n");
					} else {
						book.setIssupagreement(hssfRow.getCell((short) 19) + "");
					}
				}
				//合同性质contract_nature
				hssfRow.getCell((short) 20).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 20).getStringCellValue() == null
						|| hssfRow.getCell((short) 20).getStringCellValue() == "") {
					err = "第" + nub + "行，第21列合同性质为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					if (hssfRow.getCell((short) 20).getStringCellValue()
							.equals("采购合同")) {
						book.setContractNature("1");
					} else if (hssfRow.getCell((short) 20).getStringCellValue()
							.equals("非采购类付费合同")) {
						book.setContractNature("2");
					} else {
						book.setContractNature(hssfRow.getCell((short) 20) + "");
					}
				}
				//合同价款形式
				hssfRow.getCell((short) 21).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 21).getStringCellValue() == null
						|| hssfRow.getCell((short) 21).getStringCellValue() == "") {
					err = "第" + nub + "行，第21列合同性质为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					if (hssfRow.getCell((short) 21).getStringCellValue()
							.equals("固定单价")) {
						book.setContractPrice("1");
					} else if (hssfRow.getCell((short) 21).getStringCellValue()
							.equals("固定总价")) {
						book.setContractPrice("2");
					} else {
						book.setContractPrice(hssfRow.getCell((short) 21) + "");
					}
				}
				//采购计划年份
				hssfRow.getCell((short) 22).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 22).getStringCellValue() == null
						|| hssfRow.getCell((short) 22).getStringCellValue() == "") {
					err = "第" + nub + "行，第23列采购计划年份为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					book.setPlanYear(hssfRow.getCell((short) 22) + "");
				}
				// 预算金额
				hssfRow.getCell((short) 23).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 23).getStringCellValue() == null
						|| hssfRow.getCell((short) 23).getStringCellValue() == "") {
					err = "第" + nub + "行，第24列预算金额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					hssfRow.getCell((short) 23).setCellType(CellType.STRING);
					String sum = hssfRow.getCell((short) 23)
							.getStringCellValue();
					Boolean boolean1 = isNumber(sum);
					if (boolean1.equals(true)) {
						book.setBudgetSum(hssfRow.getCell((short) 23) + "");
					} else {
						err = "第" + nub + "行，第24列预算金额内容格式为00.00，请检查！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}
				// 标的类型
				hssfRow.getCell((short) 24).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 24).getStringCellValue() == null
						|| hssfRow.getCell((short) 24).getStringCellValue() == "") {
					err = "第" + nub + "行，第25列标的类型为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					if (hssfRow.getCell((short) 24).getStringCellValue()
							.equals("工程")) {
						book.setMarkType("1");
					} else if (hssfRow.getCell((short) 24).getStringCellValue()
							.equals("物资")) {
						book.setMarkType("2");
					}else if (hssfRow.getCell((short) 24).getStringCellValue()
							.equals("服务")) {
						book.setMarkType("3");
					} else {
						book.setMarkType(hssfRow.getCell((short) 24) + "");
					}
				}
				// 集采类型
				hssfRow.getCell((short) 25).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 25).getStringCellValue() == null
						|| hssfRow.getCell((short) 25).getStringCellValue() == "") {
					err = "第" + nub + "行，第26列集采类型为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					if (hssfRow.getCell((short) 25).getStringCellValue()
							.equals("一级集采")) {
						book.setIntype("1");
					} else if (hssfRow.getCell((short) 25).getStringCellValue()
							.equals("二级集采")) {
						book.setIntype("2");
					} else if (hssfRow.getCell((short) 25).getStringCellValue()
							.equals("自行采购")) {
						book.setIntype("3");
					} else {
						book.setIntype(hssfRow.getCell((short) 25) + "");
					}
				}
				// 采购方式
				hssfRow.getCell((short) 26).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 26).getStringCellValue() == null
						|| hssfRow.getCell((short) 26).getStringCellValue() == "") {
					err = "第" + nub + "行，第27列采购方式为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					String type = procurementType(hssfRow.getCell((short) 26)
							.getStringCellValue());
					book.setProcurementType(type);
				}
				// 供应商来源
				hssfRow.getCell((short) 27).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 27).getStringCellValue()
						.equals("公开")) {
					book.setSupplierSource("1");
				} else if (hssfRow.getCell((short) 27).getStringCellValue()
						.equals("邀请")) {
					book.setSupplierSource("2");
				} else {
					book.setSupplierSource(hssfRow.getCell((short) 27) + "");
				}
				// 是否电子采购
				hssfRow.getCell((short) 28).setCellType(CellType.STRING);
				if (hssfRow.getCell((short) 28).getStringCellValue()
						.equals("是")) {
					book.setIselectronic("y");
				} else if (hssfRow.getCell((short) 28).getStringCellValue()
						.equals("否")) {
					book.setIselectronic("n");
				} else {
					book.setIselectronic(hssfRow.getCell((short) 28) + "");
				}
				book.setImplementOrg("1");
				DatabaseUtil.insertEntity("default", book);
			}
		} catch (FileNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		if (error == null || error == "") {
			error = "导入成功";
		}
		return error;
	}

	public static boolean isNumber(String str) {
		Pattern pattern = Pattern.compile("^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){0,2})?$");
		return pattern.matcher(str).matches();
	}

	
	
	public static boolean isValid(String dataStr) {
		final SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.setLenient(false);
		try {
			sdf.parse(dataStr);
		} catch (ParseException e) {
			// TODO 自动生成的 catch 块
			return false;
		}
		return true;
	}

	public static String procurementType(String str) {
		String type = "";
		if (str.equals("招标")) {
			type = "1";
		} else if (str.equals("询价")) {
			type = "2";
		} else if (str.equals("竞价")) {
			type = "3";
		} else if (str.equals("竞争性谈判")) {
			type = "4";
		} else if (str.equals("单一来源")) {
			type = "5";
		} else if (str.equals("零星采购")) {
			type = "6";
		} else {
			type = str;
		}
		return type;
	}

	public static String contractType(String str) {
		String type = "";
		if (str.equals("宣传")) {
			type = "1";
		} else if (str.equals("室内装修/改造")) {
			type = "2";
		} else if (str.equals("车辆（租赁）")) {
			type = "3";
		} else if (str.equals("车辆（购置）")) {
			type = "4";
		} else if (str.equals("办公/后勤保障品")) {
			type = "5";
		} else if (str.equals("其他工程建设")) {
			type = "6";
		} else if (str.equals("业务合作")) {
			type = "7";
		} else if (str.equals("标准化管理")) {
			type = "8";
		} else if (str.equals("现场仪器/设备（含检修）")) {
			type = "9";
		} else if (str.equals("人力资源")) {
			type = "11";
		} else if (str.equals("金融财审")) {
			type = "12";
		} else if (str.equals("网络及信息化建设")) {
			type = "13";
		} else if (str.equals("知识产权管理")) {
			type = "14";
		} else if (str.equals("质量体系认证")) {
			type = "15";
		} else if (str.equals("安全技术服务支持")) {
			type = "16";
		} else if (str.equals("安全保障品")) {
			type = "17";
		} else if (str.equals("法律法务/审计")) {
			type = "18";
		} else if (str.equals("房屋购置")) {
			type = "19";
		} else if (str.equals("房屋租赁/物业")) {
			type = "20";
		} else if (str.equals("员工福利")) {
			type = "21";
		} else if (str.equals("保险")) {
			type = "22";
		} else if (str.equals("出版/协会")) {
			type = "23";
		} else {
			type = str;
		}
		return type;
	}
	
	public static String contractSubject(String str) {
		String type = "";
		if (str.equals("公司")) {
			type = "1";
		} else if (str.equals("河北分公司")) {
			type = "2";
		} else if (str.equals("天津分公司")) {
			type = "3";
		} else if (str.equals("福建分公司")) {
			type = "4";
		} else if (str.equals("四川分公司")) {
			type = "5";
		} else if (str.equals("西北分公司")) {
			type = "6";
		} else if (str.equals("海南分公司")) {
			type = "7";
		}
		return type;
	}

	public static String organizer(String str) {
		String type = "";
		if (str.equals("党委组织部")) {
			type = "1";
		} else if (str.equals("党委宣传部")) {
			type = "2";
		} else if (str.equals("公司办公室")) {
			type = "3";
		} else if (str.equals("保密部")) {
			type = "4";
		} else if (str.equals("企业发展部（采购管理支持中心）")) {
			type = "5";
		} else if (str.equals("人力资源部")) {
			type = "6";
		} else if (str.equals("财务部")) {
			type = "7";
		} else if (str.equals("科技信息部")) {
			type = "8";
		} else if (str.equals("安全质量部")) {
			type = "9";
		} else if (str.equals("纪检监督部")) {
			type = "10";
		} else if (str.equals("审计法务部")) {
			type = "11";
		} else if (str.equals("核资源咨询中心")) {
			type = "12";
		} else if (str.equals("核动力咨询中心")) {
			type = "13";
		} else if (str.equals("系统工程咨询中心")) {
			type = "14";
		} else if (str.equals("设备监理与检测中心")) {
			type = "15";
		} else if (str.equals("产业发展研究中心")) {
			type = "16";
		} else if (str.equals("核化工咨询中心")) {
			type = "17";
		} else if (str.equals("河北分公司")) {
			type = "18";
		} else if (str.equals("天津分公司")) {
			type = "19";
		} else if (str.equals("福建分公司")) {
			type = "20";
		} else if (str.equals("四川分公司")) {
			type = "21";
		} else if (str.equals("西北分公司")) {
			type = "22";
		} else if (str.equals("海南分公司")) {
			type = "23";
		} else if (str.equals("工业安全支持中心")) {
			type = "24";
		} else {
			type = str;
		}
		return type;
	}

	@Bizlet("未来年度付款计划")
	public void savePayPlan(DataObject[] payPlan, DataObject cpData) {
		for (int i = 0; i < payPlan.length; i++) {
			DataObject dataObject = payPlan[i];
			String uuid = UUID.randomUUID().toString().trim().replace("-", "");
			String id=dataObject.getString("id");
			if(id==null){
				dataObject.set("id", uuid);
				dataObject.set("contractNo", cpData.get("contractNo"));
				dataObject.set("contractName", cpData.get("contractName"));
				dataObject.set("payId", cpData.get("id"));
				dataObject.set("createTime", cpData.get("createTime"));
				dataObject.set("createUsername", cpData.get("createUsername"));//经办人
				dataObject.set("organizer", cpData.get("implementOrgname"));//承办部门
				dataObject.set("signatory", cpData.get("signatory"));//收款单位
				dataObject.set("payer", cpData.get("payer"));//付款方
				dataObject.set("contractSum", cpData.get("contractSum"));//合同金额
				dataObject.set("contractNature", cpData.get("contractNature"));//合同性质
				dataObject.set("contractType", cpData.get("contractType"));//合同类型
				DatabaseUtil.insertEntity("default", dataObject);
			}else {
				dataObject.set("contractNo", cpData.get("contractNo"));
				dataObject.set("contractName", cpData.get("contractName"));
				dataObject.set("payId", cpData.get("id"));
				dataObject.set("createTime", cpData.get("createTime"));
				dataObject.set("createUsername", cpData.get("createUsername"));//经办人
				dataObject.set("organizer", cpData.get("implementOrgname"));//承办部门
				dataObject.set("signatory", cpData.get("signatory"));//收款单位
				dataObject.set("payer", cpData.get("payer"));//付款方
				dataObject.set("contractSum", cpData.get("contractSum"));//合同金额
				dataObject.set("contractNature", cpData.get("contractNature"));//合同性质
				dataObject.set("contractType", cpData.get("contractType"));//合同类型
				DatabaseUtil.updateEntity("default", dataObject);
			}
			
		}
	}

	@Bizlet("未来年度收款计划")
	public void savechargePlans(DataObject[] chargePlans, DataObject cpData) {
		DecimalFormat decimalFormat=new DecimalFormat(".00");
		for (int i = 0; i < chargePlans.length; i++) {
			DataObject dataObject = chargePlans[i];
			String uuid = UUID.randomUUID().toString().trim().replace("-", "");//生成cataloguuid
			String id=dataObject.getString("id");
			if(id==null){
				dataObject.set("id", uuid);
				dataObject.set("contractNo", cpData.get("contractNo"));
				dataObject.set("contractName", cpData.get("contractName"));
				dataObject.set("chargeId", cpData.get("id"));
				dataObject.set("createTime", cpData.get("createTime"));
				dataObject.set("createUsername", cpData.get("createUsername"));//经办人
				dataObject.set("organizer", cpData.get("implementOrgname"));//承办部门
				dataObject.set("signatory", cpData.get("signatory"));//付款单位
				dataObject.set("contractSum", cpData.get("contractSum"));//合同金额
				dataObject.set("payee", cpData.get("payee"));//收款方
				Double sum = new Double(dataObject.getString("sum"));
				double income = sum/1.06;
				dataObject.set("income", decimalFormat.format(income));//计划收入
				dataObject.set("major", cpData.get("major"));//专业类别
				dataObject.set("projectType", cpData.get("projectType"));//工程类别
				dataObject.set("headquarterGroup", cpData.get("headquarterGroup"));//集团内/集团外
				DatabaseUtil.insertEntity("default", dataObject);
			}else {
				dataObject.set("contractNo", cpData.get("contractNo"));
				dataObject.set("contractName", cpData.get("contractName"));
				dataObject.set("chargeId", cpData.get("id"));
				dataObject.set("createTime", cpData.get("createTime"));
				dataObject.set("createUsername", cpData.get("createUsername"));//经办人
				dataObject.set("organizer", cpData.get("implementOrgname"));//承办部门
				dataObject.set("signatory", cpData.get("signatory"));//付款单位
				dataObject.set("contractSum", cpData.get("contractSum"));//合同金额
				dataObject.set("payee", cpData.get("payee"));//收款方
				//计划收入=计划收款金额（sum）/1.06income
				Double sum = new Double(dataObject.getString("sum"));
				double income = sum/1.06;
				dataObject.set("income", decimalFormat.format(income));//计划收入
				dataObject.set("major", cpData.get("major"));//专业类别
				dataObject.set("projectType", cpData.get("projectType"));//工程类别
				dataObject.set("headquarterGroup", cpData.get("headquarterGroup"));//集团内/集团外
				DatabaseUtil.updateEntity("default", dataObject);
			}
			
		}
	}
	
	@Bizlet("付款流程财务审批")
	public static String queryOrgId(String orgId){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("orgid",orgId);
		DataObject org = queryOneEntity("com.zhonghe.ame.payment.payMent.queryOrg", map);
		int orglevel =  org.getInt("orglevel");
		if (orglevel != 2) {
			int i = 0;
			for (i = 0; i < orglevel - 2; i++) {
				map.put("orgid",org.get("parentorgid"));
				org = queryOneEntity("com.zhonghe.ame.payment.payMent.queryOrg", map);
			}
		}
		orgId = org.getString("orgid");
		return orgId;
	}
	
	
	
	public static DataObject queryOneEntity(String sqlName,HashMap<String,Object> parameter){
		Object[] objects = DatabaseExt.queryByNamedSql("default",sqlName,parameter);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects,"commonj.sdo.DataObject",true);
		if(dataObjects != null && dataObjects.length > 0){
			return dataObjects[0];
		}
		
		return null;
	}

	public static void main(String[] args) {
		DecimalFormat decimalFormat=new DecimalFormat(".00");
		double sum = 6070.66;
		double income = sum/1.06;
		System.out.println(decimalFormat.format(income));
	}
}
