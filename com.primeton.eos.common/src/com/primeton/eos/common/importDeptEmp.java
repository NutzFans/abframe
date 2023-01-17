/**
 * 
 */
package com.primeton.eos.common;

import java.io.File;
import java.math.BigDecimal;

import jxl.Sheet;
import jxl.Workbook;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

/**
 * @author huangqj
 * @date 2014-03-21 17:01:36
 *
 */
@Bizlet("")
public class importDeptEmp {

	/**
	 * @param year
	 * @param month
	 * @param filePath
	 * @return
	 * @author huangqj
	 */
	@Bizlet("")
	public static boolean importDeptEmp(String year, String month,
			String filePath) {
		// TODO �Զ���ɷ������
		try {
			Workbook book = Workbook.getWorkbook(new File(filePath));
			Sheet sheet = book.getSheet(0);
			int rowNum = sheet.getRows();
			for (int i = 2; i < rowNum - 1; i++) {
				String deptname = sheet.getCell(1, i).getContents();
				if(deptname != null && !deptname.equals("")){
					commonj.sdo.DataObject org = commonj.sdo.helper.DataFactory.INSTANCE
							.create("org.gocom.abframe.dataset.organization",
									"OmOrganization");
					org.setString("orgname", deptname);
					DatabaseUtil.expandEntityByTemplate("default", org, org);
					String deptNo = org.getString("orgid");
					if (deptNo != null && !deptNo.equals("")) {
						commonj.sdo.DataObject org1 = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization","OmOrganization");
						org1.setInt("omOrganization/orgid", org.getInt("orgid"));
						int count = DatabaseUtil.countByTemplate("default", org1);
						if(count == 0){
							for (int j = 1; j <= 8; j++) {
								String empNum = sheet.getCell(j + 1, i).getContents();
								if (empNum != null && empNum != "" && !empNum.equals("")) {
									float empnum = Float.parseFloat(empNum);
									if (empnum != 0) {
										commonj.sdo.DataObject deptEmpNum = commonj.sdo.helper.DataFactory.INSTANCE
												.create(
														"com.bos.mp.common.performance",
														"ErporgTDeptempnum");
										deptEmpNum.setString("deptno", deptNo);
										deptEmpNum.setInt("year", Integer
												.parseInt(year));
										deptEmpNum.setInt("month", Integer
												.parseInt(month));
										if(j==7){
											deptEmpNum.setInt("regionid", j+1);
										}else if(j==8){
											deptEmpNum.setInt("regionid", 0);
										}else{
											deptEmpNum.setInt("regionid", j);
										}
										deptEmpNum.setFloat("empnum", empnum);
										DatabaseUtil
												.insertEntity("default", deptEmpNum);
									}
								}
							}
						}
					}
				}
			}
		} catch (Exception e) {
			// TODO �Զ���� catch ��
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * @param year
	 * @param month
	 * @param filePath
	 * @return
	 */
	@Bizlet("")
	public static boolean importDeptSalary(String year, String month,
			String filePath) {
		// TODO �Զ���ɷ������
		try {
			Workbook book = Workbook.getWorkbook(new File(filePath));
			Sheet sheet = book.getSheet(0);
			int rowNum = sheet.getRows();
			for (int i = 3; i <= rowNum - 1; i++) {
				String deptname = sheet.getCell(1, i).getContents();
				if(deptname != null && !deptname.equals("")){
					commonj.sdo.DataObject org = commonj.sdo.helper.DataFactory.INSTANCE
							.create("org.gocom.abframe.dataset.organization",
									"OmOrganization");
					org.setString("orgname", deptname);
					DatabaseUtil.expandEntityByTemplate("default", org, org);
					String deptNo = org.getString("orgid");
					if (deptNo != null && !deptNo.equals("")) {
						commonj.sdo.DataObject org1 = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization","OmOrganization");
						org1.setInt("omOrganization/orgid", org.getInt("orgid"));
						int count = DatabaseUtil.countByTemplate("default", org1);
						if(count == 0){
							for (int j = 1; j < 4; j++) {
								String money = sheet.getCell(j + 1, i).getContents();
								if (money != null && money != "" && !money.equals("")) {
									float money1 = Float.parseFloat(money);
									if (money1 != 0) {
										commonj.sdo.DataObject deptCost = commonj.sdo.helper.DataFactory.INSTANCE
												.create(
														"com.bos.mp.common.performance",
														"ErprptTDeptcost");
										deptCost.setString("deptno", deptNo);
										deptCost.setInt("year", Integer
												.parseInt(year));
										deptCost.setInt("month", Integer
												.parseInt(month));
										deptCost.setInt("erprptTDeptcosttype/costtypeid", j+10);
										deptCost.setBigDecimal("amt", new BigDecimal(money1));
										DatabaseUtil
												.insertEntity("default", deptCost);
									}
								}
							}
						}
					}
				}
			}
		} catch (Exception e) {
			// TODO �Զ���� catch ��
			e.printStackTrace();
		}
		return false;
	}

	/**
	 * @param year
	 * @param month
	 * @param filePath
	 * @return
	 */
	@Bizlet("")
	public static boolean importDeptProperty(String year, String month,
			String filePath) {
		// TODO �Զ���ɷ������
		try {
			Workbook book = Workbook.getWorkbook(new File(filePath));
			Sheet sheet = book.getSheet(0);
			int rowNum = sheet.getRows();
			for (int i = 3; i <= rowNum - 1; i++) {
				String deptname = sheet.getCell(1, i).getContents();
				if(deptname != null && !deptname.equals("")){
					commonj.sdo.DataObject org = commonj.sdo.helper.DataFactory.INSTANCE
							.create("org.gocom.abframe.dataset.organization",
									"OmOrganization");
					org.setString("orgname", deptname);
					DatabaseUtil.expandEntityByTemplate("default", org, org);
					String deptNo = org.getString("orgid");
					if (deptNo != null && !deptNo.equals("")) {
						commonj.sdo.DataObject org1 = commonj.sdo.helper.DataFactory.INSTANCE.create("org.gocom.abframe.dataset.organization","OmOrganization");
						org1.setInt("omOrganization/orgid", org.getInt("orgid"));
						int count = DatabaseUtil.countByTemplate("default", org1);
						if(count == 0){
							for (int j = 1; j < 3; j++) {
								String money = sheet.getCell(j + 1, i).getContents();
								if (money != null && money != "") {
									float money1 = Float.parseFloat(money);
									if (money1 != 0) {
										commonj.sdo.DataObject deptCost = commonj.sdo.helper.DataFactory.INSTANCE
												.create(
														"com.bos.mp.common.performance",
														"ErprptTDeptcost");
										deptCost.setString("deptno", deptNo);
										deptCost.setInt("year", Integer
												.parseInt(year));
										deptCost.setInt("month", Integer
												.parseInt(month));
										deptCost.setInt("erprptTDeptcosttype/costtypeid", j+20);
										deptCost.setBigDecimal("amt", new BigDecimal(money1));
										DatabaseUtil
												.insertEntity("default", deptCost);
									}
								}
							}
						}
					}
				}
			}
		} catch (Exception e) {
			// TODO �Զ���� catch ��
			e.printStackTrace();
		}
		return false;
	}

}
