package com.zhonghe.ame.contractPact;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
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
import com.primeton.ame.schindler.sqlUtils;

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
			Workbook workbook;
			Sheet sheet;
			if (CharSequenceUtil.endWith(Url, ".xlsx", true)) {
				workbook = new XSSFWorkbook(is);
				sheet = workbook.getSheetAt(0);
			} else {
				workbook = new HSSFWorkbook(is);
				sheet = workbook.getSheetAt(0);
			}
			List<ZhPayContract> listAdd = new ArrayList<ZhPayContract>();
			DecimalFormat dFormat = new DecimalFormat("0.00");
			double jine = 0;
			String twoJine = "";
			for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
				Row row = sheet.getRow(rowNum);
				int nub = rowNum + 1;
				if (row.getCell(rowNum) == null) {
					break;
				}
				ZhPayContractImpl book = new ZhPayContractImpl();
				DatabaseExt.getPrimaryKey(book);

				// 合同经办人
				if (row.getCell((short) 1) == null || row.getCell((short) 1).getStringCellValue() == "") {
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
				if (row.getCell((short) 2) == null || row.getCell((short) 2).getStringCellValue() == "") {
					err = "第" + nub + "行，第3列合同承办部门为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 2).setCellType(CellType.STRING);
					book.setImplementOrgname(row.getCell((short) 2).getStringCellValue());
					String orgid = queryOrganizationId(row.getCell((short) 2).getStringCellValue());
					book.setImplementOrg(orgid);
				}

				// 合同编号
				if (row.getCell((short) 3) == null || row.getCell((short) 3).getStringCellValue() == "") {
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
				if (row.getCell((short) 4) == null || row.getCell((short) 4).getStringCellValue() == "") {
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
				if (row.getCell((short) 5) == null) {
					err = "第" + nub + "行，第6列合同金额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 5).setCellType(CellType.STRING);
					String sum = row.getCell((short) 5).getStringCellValue().trim();
					Boolean boolean1 = isNumber(sum);
					if (boolean1.equals(true)) {
						jine = Double.parseDouble(sum);
						twoJine = dFormat.format(jine);
						book.setContractSum(twoJine);
						book.setActContractSum(NumberUtil.round(twoJine, 2));
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
				if (row.getCell((short) 6) == null) {
					err = "第" + nub + "行，第7列合同最终金额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 6).setCellType(CellType.STRING);
					String sum = row.getCell((short) 6).getStringCellValue().trim();
					Boolean boolean1 = isNumber(sum);
					if (boolean1.equals(true)) {
						jine = Double.parseDouble(sum);
						twoJine = dFormat.format(jine);
						book.setFinalSum(twoJine);
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

				// 合同不含税金额
				if (row.getCell((short) 7) == null) {
					err = "第" + nub + "行，第8列合同不含税金额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 7).setCellType(CellType.STRING);
					String sum2 = row.getCell((short) 7).getStringCellValue().trim();
					Boolean boolean2 = isNumber(sum2);
					if (boolean2.equals(true)) {
						jine = Double.parseDouble(sum2);
						twoJine = dFormat.format(jine);
						book.setNoTaxSum(twoJine);
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
				if (row.getCell((short) 8) == null) {
					err = "第" + nub + "行，第9列税额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 8).setCellType(CellType.STRING);
					String sum3 = row.getCell((short) 8).getStringCellValue().trim();
					Boolean boolean3 = isNumber(sum3);
					if (boolean3.equals(true)) {
						jine = Double.parseDouble(sum3);
						twoJine = dFormat.format(jine);
						book.setPayTax(twoJine);
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
				if (row.getCell((short) 9) == null) {
					err = "第" + nub + "行，第10列合同余额为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 9).setCellType(CellType.STRING);
					String sum4 = row.getCell((short) 9).getStringCellValue().trim();
					Boolean boolean4 = isNumber(sum4);
					if (boolean4.equals(true)) {
						jine = Double.parseDouble(sum4);
						twoJine = dFormat.format(jine);
						book.setContractBalance(twoJine);
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
				if (row.getCell((short) 10) == null || row.getCell((short) 10).getStringCellValue() == "") {
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
					if (ExecuteStatus != null && ExecuteStatus != "") {
						book.setExecuteStatus(ExecuteStatus);
					} else {
						err = "第" + nub + "行，第11列执行状态填写内容错误！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}

				// 签约方
				if (row.getCell((short) 11) == null || row.getCell((short) 11).getStringCellValue() == "") {
					err = "第" + nub + "行，第12列签约方为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 11).setCellType(CellType.STRING);
					String signatory = querySignatoryName(row.getCell((short) 11).getStringCellValue().trim());
					if (signatory != null && signatory != "") {
						book.setSignatory(signatory);
					} else {
						err = "第" + nub + "行，第12列签约方未在供货商中查找到，请先补充！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}

				// 合同签约主体
				if (row.getCell((short) 12) == null || row.getCell((short) 12).getStringCellValue() == "") {
					err = "第" + nub + "行，第13列合同签约主体为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 12).setCellType(CellType.STRING);
					String type = queryDict("ZH_INVOICE_NAME_TYPE", row.getCell((short) 12).getStringCellValue());
					if (type != null && type != "") {
						book.setContractSubject(type);
					} else {
						err = "第" + nub + "行，第13列合同签约主体填写内容错误！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}

				// 付款方
				if (row.getCell((short) 13) == null || row.getCell((short) 13).getStringCellValue() == "") {
					err = "第" + nub + "行，第14列付款方为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 13).setCellType(CellType.STRING);
					String type = queryDict("ZH_INVOICE_NAME_TYPE", row.getCell((short) 13).getStringCellValue());
					if (type != null && type != "") {
						book.setPayer(type);
					} else {
						err = "第" + nub + "行，第14列付款方填写内容错误！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}

				// 签订日期
				try {
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
					String format = "yyyy-MM-dd";
					String signingDate = simpleDateFormat.format(row.getCell((short) 14).getDateCellValue());
					if (signingDate == null || signingDate == "") {
						err = "第" + nub + "行，第15列签订日期为必填项，不可为空！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					} else {
						Boolean boolean5 = isValid(signingDate);
						if (boolean5.equals(true)) {
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
				} catch (Exception e) {
					err = "第" + nub + "行，第15列签订日期格式异常，请设置该单元格为日期类型，格式为yyyy-MM-dd！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				}

				// 合同类型/标的.
				if (row.getCell((short) 15) == null || row.getCell((short) 15).getStringCellValue() == "") {
					err = "第" + nub + "行，第16列合同类型为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 15).setCellType(CellType.STRING);
					String type = queryDict("ZH_CONTRACT_TYPE", row.getCell((short) 15).getStringCellValue());
					if (type != null && type != "") {
						book.setContractType(type);
					} else {
						err = "第" + nub + "行，第16列合同类型填写内容错误！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}

				// 合同密级
				if (row.getCell((short) 16) == null || row.getCell((short) 16).getStringCellValue() == "") {
					err = "第" + nub + "行，第17列合同密级为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 16).setCellType(CellType.STRING);
					String type = queryDict("CONTRACT_SECRET_LEVEL", row.getCell((short) 16).getStringCellValue());
					if (type != null && type != "") {
						book.setContractSecretLevel(type);
					} else {
						err = "第" + nub + "行，第17列合同密级填写内容错误！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}

				// 项目密级
				if (row.getCell((short) 17) == null || row.getCell((short) 17).getStringCellValue() == "") {
					err = "第" + nub + "行，第18列项目密级为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 17).setCellType(CellType.STRING);
					String type = queryDict("PROJECT_SECRET_LEVEL", row.getCell((short) 17).getStringCellValue());
					if (type != null && type != "") {
						book.setProjectSecretLevel(type);
					} else {
						err = "第" + nub + "行，第18列项目密级填写内容错误！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}

				// 是否为SM协作配套
				if (row.getCell((short) 18) == null || row.getCell((short) 18).getStringCellValue() == "") {
					err = "第" + nub + "行，第19列是否为SM协作配套为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 18).setCellType(CellType.STRING);
					String type = queryDict("ABF_YESORNO", row.getCell((short) 18).getStringCellValue());
					if (type != null && type != "") {
						book.setIssm(type);
					} else {
						err = "第" + nub + "行，第19列是否为SM协作配套填写内容错误！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}

				// 是否为补充协议
				if (row.getCell((short) 19) == null || row.getCell((short) 19).getStringCellValue() == "") {
					err = "第" + nub + "行，第20列是否为补充协议为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 19).setCellType(CellType.STRING);
					String type = queryDict("ABF_YESORNO", row.getCell((short) 19).getStringCellValue());
					if (type != null && type != "") {
						book.setIssupagreement(type);
					} else {
						err = "第" + nub + "行，第20列是否为补充协议填写内容错误！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}

				// 合同性质contract_nature
				if (row.getCell((short) 20) == null || row.getCell((short) 20).getStringCellValue() == "") {
					err = "第" + nub + "行，第21列合同性质为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 20).setCellType(CellType.STRING);
					String type = queryDict("CONTRACT_NATURE", row.getCell((short) 20).getStringCellValue());
					if (type != null && type != "") {
						book.setContractNature(type);
					} else {
						err = "第" + nub + "行，第21列合同性质填写内容错误！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}

				// 合同价款形式
				if (row.getCell((short) 21) == null || row.getCell((short) 21).getStringCellValue() == "") {
					err = "第" + nub + "行，第22列合同价款形式为必填项，不可为空！";
					if (error == "" || error == null) {
						error = err;
					} else {
						error = error + ln + err;
					}
					continue;
				} else {
					row.getCell((short) 21).setCellType(CellType.STRING);
					String type = queryDict("CONTRACT_PRICE", row.getCell((short) 21).getStringCellValue());
					if (type != null && type != "") {
						book.setContractPrice(type);
					} else {
						err = "第" + nub + "行，第22列合同价款形式填写内容错误！";
						if (error == "" || error == null) {
							error = err;
						} else {
							error = error + ln + err;
						}
						continue;
					}
				}

				// 采购计划年份
				if (row.getCell((short) 22) == null) {
					row.createCell((short) 22).setCellValue(new HSSFRichTextString(String.valueOf(row.getCell((short) 22).getStringCellValue())));
				} else {
					row.getCell((short) 22).setCellType(CellType.STRING);
					if (row.getCell((short) 22).getStringCellValue() == "") {
						row.createCell((short) 22).setCellValue(new HSSFRichTextString(String.valueOf(row.getCell((short) 22).getStringCellValue())));
					} else {
						book.setPlanYear(row.getCell((short) 22) + "");
					}
				}

				// 预算金额
				if (row.getCell((short) 23) == null) {
					row.createCell((short) 23).setCellValue(new HSSFRichTextString(String.valueOf(row.getCell((short) 23).getStringCellValue())));
				} else {
					row.getCell((short) 23).setCellType(CellType.STRING);
					String sum6 = row.getCell((short) 23).getStringCellValue();
					if (row.getCell((short) 23).getStringCellValue() == "") {
						row.createCell((short) 23).setCellValue(new HSSFRichTextString(String.valueOf(row.getCell((short) 23).getStringCellValue())));
					} else {
						Boolean boolean6 = isNumber(sum6);
						if (boolean6.equals(true)) {
							jine = Double.parseDouble(sum6);
							twoJine = dFormat.format(jine);
							book.setBudgetSum(twoJine);
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
				}

				// 标的类型
				if (row.getCell((short) 24) == null || row.getCell((short) 24).getStringCellValue() == "") {
					row.createCell((short) 24).setCellValue(new HSSFRichTextString(String.valueOf(row.getCell((short) 24).getStringCellValue())));
				} else {
					row.getCell((short) 24).setCellType(CellType.STRING);
					String type = queryDict("MARK_TYPE", row.getCell((short) 24).getStringCellValue());
					book.setMarkType(type);
				}

				// 集采类型
				if (row.getCell((short) 25) == null || row.getCell((short) 25).getStringCellValue() == "") {
					row.createCell((short) 25).setCellValue(new HSSFRichTextString(String.valueOf(row.getCell((short) 25).getStringCellValue())));
				} else {
					row.getCell((short) 25).setCellType(CellType.STRING);
					String type = queryDict("INTYPE", row.getCell((short) 25).getStringCellValue());
					book.setIntype(type);
				}

				// 采购方式
				if (row.getCell((short) 26) == null || row.getCell((short) 26).getStringCellValue() == "") {
					row.createCell((short) 26).setCellValue(new HSSFRichTextString(String.valueOf(row.getCell((short) 26).getStringCellValue())));
				} else {
					row.getCell((short) 26).setCellType(CellType.STRING);
					String type = queryDict("ZH_PROCUREMENT_TYPE", row.getCell((short) 26).getStringCellValue());
					book.setProcurementType(type);
				}

				// 供应商来源
				if (row.getCell((short) 27) == null || row.getCell((short) 27).getStringCellValue() == "") {
					row.createCell((short) 27).setCellValue(new HSSFRichTextString(String.valueOf(row.getCell((short) 27).getStringCellValue())));
				} else {
					row.getCell((short) 27).setCellType(CellType.STRING);
					String type = queryDict("SUPPLIER_SOURCE", row.getCell((short) 27).getStringCellValue());
					book.setSupplierSource(type);

				}

				// 是否电子采购
				if (row.getCell((short) 28) == null || row.getCell((short) 28).getStringCellValue() == "") {
					row.createCell((short) 28).setCellValue(new HSSFRichTextString(String.valueOf(row.getCell((short) 28).getStringCellValue())));
				} else {
					row.getCell((short) 28).setCellType(CellType.STRING);
					String type = queryDict("ABF_YESORNO", row.getCell((short) 28).getStringCellValue());
					book.setIselectronic(type);

				}

				book.setAppStatus(2);
				book.setCreateTime(new Date());
				listAdd.add(book);
			}
			ZhPayContract[] arrAdd = new ZhPayContract[listAdd.size()];
			int a = listAdd.size();
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
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("payId", cpData.get("id"));
		sqlUtils.executeSql("com.zhonghe.ame.payment.payMent.deletePlanForNo", map);
		for (int i = 0; i < payPlan.length; i++) {
			DataObject dataObject = payPlan[i];
			String uuid = UUID.randomUUID().toString().trim().replace("-", "");
			dataObject.set("id", uuid);
			dataObject.set("contractNo", cpData.get("contractNo"));
			dataObject.set("contractName", cpData.get("contractName"));
			dataObject.set("payId", cpData.get("id"));
			dataObject.set("createTime", cpData.get("createTime"));
			dataObject.set("createUsername", cpData.get("createUsername"));// 经办人
			dataObject.set("organizer", cpData.get("implementOrgname"));// 承办部门
			dataObject.set("signatory", cpData.get("signatory"));// 收款单位
			dataObject.set("payer", cpData.get("payer"));// 付款方
			dataObject.set("contractSum", cpData.get("contractSum"));// 合同金额
			dataObject.set("contractNature", cpData.get("contractNature"));// 合同性质
			dataObject.set("contractType", cpData.get("contractType"));// 合同类型
			DatabaseUtil.insertEntity("default", dataObject);
		}
	}

	@Bizlet("未来年度收款计划")
	public void savechargePlans(DataObject[] chargePlans, DataObject cpData) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("chargeId", cpData.get("id"));
		sqlUtils.executeSql("com.zhonghe.ame.payment.payMent.deletePlanForNo1", map);
		DecimalFormat decimalFormat = new DecimalFormat(".00");
		for (int i = 0; i < chargePlans.length; i++) {
			DataObject dataObject = chargePlans[i];
			String uuid = UUID.randomUUID().toString().trim().replace("-", "");// 生成cataloguuid
			dataObject.set("id", uuid);
			dataObject.set("contractNo", cpData.get("contractNo"));
			dataObject.set("contractName", cpData.get("contractName"));
			dataObject.set("chargeId", cpData.get("id"));
			dataObject.set("createTime", cpData.get("createTime"));
			dataObject.set("createUsername", cpData.get("createUsername"));// 经办人
			dataObject.set("organizer", cpData.get("implementOrgname"));// 承办部门
			dataObject.set("signatory", cpData.get("signatory"));// 付款单位
			dataObject.set("contractSum", cpData.get("contractSum"));// 合同金额
			dataObject.set("payee", cpData.get("payee"));// 收款方
			Double sum = new Double(dataObject.getString("sum"));
			double income = sum / 1.06;
			dataObject.set("income", decimalFormat.format(income));// 计划收入
			dataObject.set("major", cpData.get("major"));// 专业类别
			dataObject.set("projectType", cpData.get("projectType"));// 工程类别
			dataObject.set("headquarterGroup", cpData.get("headquarterGroup"));// 集团内/集团外
			DatabaseUtil.insertEntity("default", dataObject);

		}
	}

	@Bizlet("付款流程财务审批")
	public static String queryOrgId(String orgId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("orgid", orgId);
		DataObject org = queryOneEntity("com.zhonghe.ame.payment.payMent.queryOrg", map);
		int orglevel = org.getInt("orglevel");
		if (orglevel != 2) {
			int i = 0;
			for (i = 0; i < orglevel - 2; i++) {
				map.put("orgid", org.get("parentorgid"));
				org = queryOneEntity("com.zhonghe.ame.payment.payMent.queryOrg", map);
			}
		}
		orgId = org.getString("orgid");
		return orgId;
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
		DataObject org = queryOneEntity("com.zhonghe.ame.payment.payMent.querySignatoryName", map);
		if (org != null) {
			custid = org.getString("custid");
		} else {
			custid = insertCompetitor(str);
		}
		return custid;
	}

	public static String insertCompetitor(String str) {
		String custid = "";
		PurSupplierImpl impl = new PurSupplierImpl();
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
