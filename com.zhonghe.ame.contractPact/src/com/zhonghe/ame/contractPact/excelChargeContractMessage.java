package com.zhonghe.ame.contractPact;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import cn.hutool.core.text.CharSequenceUtil;
import cn.hutool.core.util.NumberUtil;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContract;
import com.zhonghe.ame.chargeContract.chargeContract.impl.ZhChargeContractImpl;

import commonj.sdo.DataObject;

@Bizlet
public class excelChargeContractMessage {

	private static String ln = "<br>";

	@Bizlet
	public String excleIn(String Url) {
		String error = "";
		String err = "";
		String type = "";
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
			List<ZhChargeContract> listAdd = new ArrayList<ZhChargeContract>();
			DecimalFormat dFormat = new DecimalFormat("0.00");
			double jine = 0;
			for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
				Row row = sheet.getRow(rowNum);
				int nub = rowNum + 1;
				if (row.getCell(rowNum) == null) {
					break;
				}
				ZhChargeContract book = new ZhChargeContractImpl();
				DatabaseExt.getPrimaryKey(book);

				// 合同经办人（必填）
				if (row.getCell((short) 1).getStringCellValue() == null || row.getCell((short) 1).getStringCellValue() == "") {
					err = "第" + nub + "行，第2列合同经办人为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					if ("sysadmin".equals(row.getCell((short) 1).getStringCellValue().trim()) || "SYSADMIN".equals(row.getCell((short) 1).getStringCellValue().trim())) {
						continue;
					}
					book.setCreateUsername(row.getCell((short) 1).getStringCellValue().trim());
					String userId = queryUserEmpByName(row.getCell((short) 1).getStringCellValue().trim());
					if (userId != null) {
						book.setCreateUserid(userId);
					} else {
						err = "第" + nub + "行，第2列合同经办人填写错误！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}
				
				// 合同承办部门
				if (row.getCell((short) 2).getStringCellValue() == null || row.getCell((short) 2).getStringCellValue() == "") {
					err = "第" + nub + "行，第3列合同承办部门为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 2).setCellType(CellType.STRING);
					book.setImplementOrgname(row.getCell((short) 2) + "");
					String orgid = queryOrganizationId(row.getCell((short) 2).getStringCellValue());
					book.setImplementOrg(orgid);
				}
				
				// 合同编号
				if (row.getCell((short) 3).getStringCellValue() == null || row.getCell((short) 3).getStringCellValue() == "") {
					err = "第" + nub + "行，第4列合同编号为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 3).setCellType(CellType.STRING);
					book.setContractNo(row.getCell((short) 3) + "");
				}
				
				// 合同名称
				if (row.getCell((short) 4).getStringCellValue() == null || row.getCell((short) 4).getStringCellValue() == "") {
					err = "第" + nub + "行，第5列合同名称为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 4).setCellType(CellType.STRING);
					book.setContractName(row.getCell((short) 4) + "");
				}
				
				// 合同金额
				row.getCell((short) 5).setCellType(CellType.STRING);
				if (row.getCell((short) 5).getStringCellValue() == null || row.getCell((short) 5).getStringCellValue() == "") {
					err = "第" + nub + "行，第6列合同金额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 5).setCellType(CellType.STRING);
					String sum = row.getCell(5).getStringCellValue();
					Boolean boolean1 = isNumber(sum);
					if (boolean1.equals(true)) {
						jine = Double.parseDouble(sum);
						book.setContractSum(dFormat.format(jine));
						book.setActContractSum(NumberUtil.round(dFormat.format(jine), 2));
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
				
				// 合同最终金额
				row.getCell((short) 6).setCellType(CellType.STRING);
				if (row.getCell((short) 6).getStringCellValue() == null || row.getCell((short) 6).getStringCellValue() == "") {
					err = "第" + nub + "行，第7列合同最终金额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 6).setCellType(CellType.STRING);
					String sum = row.getCell(6).getStringCellValue();
					Boolean boolean1 = isNumber(sum);
					if (boolean1.equals(true)) {
						jine = Double.parseDouble(sum);
						book.setFinContractSum(dFormat.format(jine));
					} else {
						err = "第" + nub + "行，第6列合同最终金额内容格式为00.00，请检查！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}
				
				// 合同不含税金额（元）
				row.getCell((short) 7).setCellType(CellType.STRING);
				if (row.getCell((short) 7).getStringCellValue() == null || row.getCell((short) 7).getStringCellValue() == "") {
					err = "第" + nub + "行，第8列合同不含税金额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 7).setCellType(CellType.STRING);
					String sum = row.getCell(7).getStringCellValue();
					Boolean boolean1 = isNumber(sum);
					if (boolean1.equals(true)) {
						jine = Double.parseDouble(sum);
						book.setNoTaxSum(dFormat.format(jine));
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
				
				// 税额
				row.getCell((short) 8).setCellType(CellType.STRING);
				if (row.getCell((short) 8).getStringCellValue() == null || row.getCell((short) 8).getStringCellValue() == "") {
					err = "第" + nub + "行，第9列税额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 8).setCellType(CellType.STRING);
					String sum = row.getCell(8).getStringCellValue();
					Boolean boolean1 = isNumber(sum);
					if (boolean1.equals(true)) {
						jine = Double.parseDouble(sum);
						book.setPayTax(dFormat.format(jine));
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
				
				// 余额
				row.getCell((short) 9).setCellType(CellType.STRING);
				if (row.getCell((short) 9).getStringCellValue() == null || row.getCell((short) 9).getStringCellValue() == "") {
					err = "第" + nub + "行，第10列余额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 9).setCellType(CellType.STRING);
					String sum = row.getCell(9).getStringCellValue();
					Boolean boolean1 = isNumber(sum);
					if (boolean1.equals(true)) {
						jine = Double.parseDouble(sum);
						book.setContractBalance(dFormat.format(jine));
					} else {
						err = "第" + nub + "行，第10列余额内容格式为00.00，请检查！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}
				
				// 执行状态
				if (row.getCell((short) 10).getStringCellValue() == null || row.getCell((short) 10).getStringCellValue() == "") {
					err = "第" + nub + "行，第11列执行状态为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 10).setCellType(CellType.STRING);
					String ExecuteStatus = queryDict("EXECUTE_STATUS", row.getCell((short) 10).getStringCellValue());
					book.setExecuteStatus(ExecuteStatus);
				}
				
				// 签约方
				if (row.getCell((short) 11).getStringCellValue() == null || row.getCell((short) 11).getStringCellValue() == "") {
					err = "第" + nub + "行，第12列签约方为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 11).setCellType(CellType.STRING);
					book.setSignatory(querySignatoryName(row.getCell((short) 11).getStringCellValue()));
					book.setSignatoryName(row.getCell((short) 11).getStringCellValue());
				}
				
				// 合同签约主体
				if (row.getCell((short) 12).getStringCellValue() == null || row.getCell((short) 12).getStringCellValue() == "") {
					err = "第" + nub + "行，第13列合同签约主体为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 12).setCellType(CellType.STRING);
					type = queryDict("PAYER", row.getCell((short) 12).getStringCellValue());
					book.setContractSubject(type);
				}
				
				// 收款方
				if (row.getCell((short) 13).getStringCellValue() == null || row.getCell((short) 13).getStringCellValue() == "") {
					err = "第" + nub + "行，第14列收款方为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 13).setCellType(CellType.STRING);
					type = queryDict("PAYER", row.getCell((short) 13).getStringCellValue());
					book.setPayee(type);
				}
				
				// 签订日期
				try{
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
					String format = "yyyy-MM-dd";
					String signingDate = simpleDateFormat.format(row.getCell((short) 14).getDateCellValue());
					if (signingDate == null || signingDate == "") {
						err = "第" + nub + "行，第15列合签订日期为必填项，不可为空！";
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
							book.setSigningDate(edate);
						} else {
							err = "第" + nub + "行，第15列合签订日期格式异常，请检查！";
							if (error == "" || error == null) {
								error = err;
							} else {
								error = error + ln + err;
							}
							continue;
						}
					}
				}catch(Exception e){
					err = "第" + nub + "行，第15列签订日期格式异常，请设置该单元格为日期类型，格式为yyyy-MM-dd！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				}

				// 合同密级
				if (row.getCell((short) 15).getStringCellValue() == null || row.getCell((short) 15).getStringCellValue() == "") {
					err = "第" + nub + "行，第16列合同密级为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 15).setCellType(CellType.STRING);
					type = queryDict("CONTRACT_SECRET_LEVEL", row.getCell((short) 15).getStringCellValue());
					book.setContractSecretLevel(type);
				}
				
				// 项目密级
				if (row.getCell((short) 16).getStringCellValue() == null || row.getCell((short) 16).getStringCellValue() == "") {
					err = "第" + nub + "行，第17列项目密级为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 16).setCellType(CellType.STRING);
					type = queryDict("PROJECT_SECRET_LEVEL", row.getCell((short) 16).getStringCellValue());
					book.setProjectSecretLevel(type);
				}
				
				// 是否计划对外分包
				if (row.getCell((short) 17).getStringCellValue() == null || row.getCell((short) 17).getStringCellValue() == "") {
					err = "第" + nub + "行，第18列是否计划对外分包为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 17).setCellType(CellType.STRING);
					type = queryDict("ABF_YESORNO", row.getCell((short) 17).getStringCellValue());
					book.setIsfb(type);
				}
				
				// 是否协议变更
				if (row.getCell((short) 18).getStringCellValue() == null || row.getCell((short) 18).getStringCellValue() == "") {
					err = "第" + nub + "行，第19列是否协议变更为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 18).setCellType(CellType.STRING);
					type = queryDict("ABF_YESORNO", row.getCell((short) 18).getStringCellValue());
					book.setIssupagreement(type);
				}
				
				// 专业类别
				if (row.getCell((short) 19).getStringCellValue() == null || row.getCell((short) 19).getStringCellValue() == "") {
					err = "第" + nub + "行，第20列专业类别为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 19).setCellType(CellType.STRING);
					type = queryDict("ZH_MAJOR_TYPE", row.getCell((short) 19).getStringCellValue());
					book.setMajor(type);
				}
				
				// 工程类别
				if (row.getCell((short) 20).getStringCellValue() == null || row.getCell((short) 20).getStringCellValue() == "") {
					err = "第" + nub + "行，第21列工程类别为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 20).setCellType(CellType.STRING);
					type = queryDict("ZH_PROJECT_TYPE", row.getCell((short) 20).getStringCellValue());
					book.setProjectType(type);
				}
				
				// 集团内外
				if (row.getCell((short) 21).getStringCellValue() == null || row.getCell((short) 21).getStringCellValue() == "") {
					err = "第" + nub + "行，第22列集团内外为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 21).setCellType(CellType.STRING);
					type = queryDict("ZH_GROUP", row.getCell((short) 21).getStringCellValue());
					book.setHeadquarterGroup(type);
				}
				
				// 合同价格模式
				if (row.getCell((short) 22).getStringCellValue() == null || row.getCell((short) 22).getStringCellValue() == "") {
					err = "第" + nub + "行，第23列合同价格模式为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 22).setCellType(CellType.STRING);
					type = queryDict("CONTRACT_MODEL", row.getCell((short) 22).getStringCellValue());
					book.setContractModel(type);
				}
				
				// 招标人采购方式
				if (row.getCell((short) 23).getStringCellValue() == null || row.getCell((short) 23).getStringCellValue() == "") {
					err = "第" + nub + "行，第24列招标人采购方式为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 23).setCellType(CellType.STRING);
					type = queryDict("ZH_PROCUREMENT_TYPE", row.getCell((short) 23).getStringCellValue());
					book.setProcurementType(type);
				}
				book.setAppStatus(2);
				book.setCreateTime(new Date());
				listAdd.add(book);
			}
			
			ZhChargeContract[] arrAdd = new ZhChargeContract[listAdd.size()];
			if (error == null || error == "") {
				if (arrAdd.length != 0) {
					listAdd.toArray(arrAdd);
					DatabaseUtil.insertEntityBatch("default", arrAdd);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return error;
		}
		if (error == null || error == "") {
			error = "导入成功";
		}
		return error;
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
		} else if (str.equals("电子商城采购")) {
			type = "7";
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
		} else {
			type = str;
		}
		return type;
	}

	public static boolean isNumber(String str) {
		Pattern pattern = Pattern.compile("^(([1-9]{1}\\d*)|([0]{1}))(\\.(\\d){0,20})?$");
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

	public static String ContractSecretLevel(String str) {
		String type = "";
		if (str.equals("非密")) {
			type = "1";
		} else if (str.equals("普通商密")) {
			type = "2";
		} else if (str.equals("内部")) {
			type = "3";
		} else {
			type = str;
		}
		return type;
	}

	public static String ProjectSecretLevel(String str) {
		String type = "";
		if (str.equals("非密")) {
			type = "1";
		} else if (str.equals("秘密")) {
			type = "2";
		} else if (str.equals("机密")) {
			type = "3";
		} else if (str.equals("绝密")) {
			type = "4";
		} else {
			type = str;
		}
		return type;
	}

	public static String Isfb(String str) {
		String type = "";
		if (str.equals("是")) {
			type = "y";
		} else if (str.equals("否")) {
			type = "n";
		} else {
			type = str;
		}
		return type;
	}

	public static String major(String str) {
		String type = "";
		if (str.equals("评估咨询")) {
			type = "1";
		} else if (str.equals("项目咨询")) {
			type = "2";
		} else if (str.equals("股权投资咨询")) {
			type = "3";
		} else if (str.equals("设计咨询")) {
			type = "4";
		} else if (str.equals("造价咨询")) {
			type = "5";
		} else if (str.equals("工程监理")) {
			type = "6";
		} else if (str.equals("设备监理")) {
			type = "7";
		} else if (str.equals("检修技术服务")) {
			type = "8";
		} else if (str.equals("项目监督检查")) {
			type = "9";
		} else if (str.equals("项目后评价")) {
			type = "10";
		} else if (str.equals("工程项目管理")) {
			type = "11";
		} else if (str.equals("工程检测评价")) {
			type = "12";
		} else if (str.equals("产业发展研究")) {
			type = "13";
		} else if (str.equals("科研管理咨询")) {
			type = "14";
		} else if (str.equals("科技成果转化咨询")) {
			type = "15";
		} else if (str.equals("质量管理咨询")) {
			type = "16";
		} else if (str.equals("采购管理咨询")) {
			type = "17";
		} else {
			type = str;
		}
		return type;
	}

	public static String projectType(String str) {
		String type = "";
		if (str.equals("核电")) {
			type = "1";
		} else if (str.equals("民用")) {
			type = "2";
		} else if (str.equals("专项工程")) {
			type = "3";
		} else if (str.equals("其他核工程")) {
			type = "4";
		} else if (str.equals("其他")) {
			type = "5";
		} else if (str.equals("检修")) {
			type = "6";
		} else {
			type = str;
		}
		return type;
	}

	public static String headquarterGroup(String str) {
		String type = "";
		if (str.equals("集团内")) {
			type = "0";
		} else if (str.equals("集团外")) {
			type = "1";
		} else {
			type = str;
		}
		return type;
	}

	public static String contractModel(String str) {
		String type = "";
		if (str.equals("固定总价")) {
			type = "1";
		} else if (str.equals("暂定总价")) {
			type = "2";
		} else if (str.equals("固定单价")) {
			type = "3";
		} else if (str.equals("下浮率")) {
			type = "4";
		} else if (str.equals("费率")) {
			type = "5";
		} else if (str.equals("无价格")) {
			type = "6";
		} else {
			type = str;
		}
		return type;
	}

	public static DataObject queryOneEntity(String sqlName, HashMap<String, Object> parameter) {
		Object[] objects = DatabaseExt.queryByNamedSql("default", sqlName, parameter);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects, "commonj.sdo.DataObject", true);
		if (dataObjects != null && dataObjects.length > 0) {
			return dataObjects[0];
		}

		return null;
	}

	public static String querySignatoryName(String str) {
		String custid = "";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("CUSTNAME", str);
		DataObject org = queryOneEntity("com.zhonghe.ame.payment.payMent.querySignatoryIdByName", map);
		if (org != null) {
			custid = org.getString("custid");
		} else {
			custid = insertCompetitor(str);
		}
		return custid;
	}

	public static String queryOrganizationId(String str) {
		String custid = "";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ORGNAME", str);
		DataObject org = queryOneEntity("com.zhonghe.ame.payment.payMent.queryOrganizationId", map);
		if (org != null) {
			custid = org.getString("ORGID");
		} else {
			custid = "1";
		}
		return custid;
	}

	public static String insertCompetitor(String str) {
		String custid = "";
		MisCustinfoImpl impl = new MisCustinfoImpl();
		DatabaseExt.getPrimaryKey(impl);
		impl.setCustname(str);
		DatabaseUtil.insertEntity("default", impl);
		custid = impl.getString("custid");
		return custid;
	}

	@Bizlet("根据业务字典名称及编号查询id")
	public static String queryDict(String DICTTYPEID, String DICTNAME) {
		String DICTID = "";
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("DICTTYPEID", DICTTYPEID);
		map.put("DICTNAME", DICTNAME);
		DataObject org = queryOneEntity("com.zhonghe.ame.payment.payMent.queryDict", map);
		if (org != null) {
			DICTID = org.getString("DICTID");
		}
		return DICTID;
	}
	
	public static String queryUserEmpByName(String str) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("EMPNAME", str);
		DataObject emp = queryOneEntity("com.zhonghe.ame.payment.payMent.queryUserEmpByName", map);
		if (emp != null) {
			return emp.getString("empcode");
		} else {
			return null;
		}
	}	

}
