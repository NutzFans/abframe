/**
 * 
 */
package com.primeton.eos.ame_budget;

import java.util.HashMap;

import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

/**
 * @author wanglinqiong
 * @date 2016-10-28 15:05:27
 * 招聘表人员：指每个月某区域要新招聘多少人，与总人头没关系；公摊表人员：指每个月某区域总人头一共要分摊多少成本。
 * 编辑招聘人数，确定公摊人员表数据是否新增或者编辑增加
 * （例如：改变2017年1月份的招聘，就要修改公摊表2017年1月到12月份所有人员的数量，这时候2月份还没有数据可能要新增一条2月数据,3月份有数据就设计到编辑增加）
 */
public class ModifyShareBudgetByStaff {
	/**
	 * @param 
	 * @return
	 * @author wanglinqiong
	 * @throws Throwable 
	 */
	@Bizlet("")
	public void addDeptEmpBudget(DataObject deptStaffRebud,String para) throws Exception {//新增传进来的参数可以直接用（编辑删除需要数据库的数据，而不是传进来的 数据）
		//创建一个部门人员预算对象
		commonj.sdo.DataObject deptEmpBudget = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptEmpBudget");
		//判断传进来的是几月（）
		int month = deptStaffRebud.getInt("month");
		for (int i = 0; i <= 12-month; i++) {
			int a=month+i;
			deptEmpBudget.setInt("month", a);
			deptEmpBudget.setString("orgid", deptStaffRebud.getString("orgid"));
			deptEmpBudget.setString("year", deptStaffRebud.getString("year"));
			deptEmpBudget.setString("citycode", deptStaffRebud.getString("citycode"));
			deptEmpBudget.setString("costtype", deptStaffRebud.getString("costtype"));
			deptEmpBudget.setString("status", "2");//2代表招聘
			int result= DatabaseUtil.expandEntityByTemplate("default",deptEmpBudget,deptEmpBudget);
			if(result==0){//查询没有记录，新增一条记录
				deptEmpBudget.setFloat("empnum", deptStaffRebud.getFloat("renum"));
				deptEmpBudget.setDouble("tosalary", deptStaffRebud.getDouble("tosalary"));
				deptEmpBudget.setDouble("toweal", deptStaffRebud.getDouble("toweal"));
				deptEmpBudget.setDouble("tobonus", deptStaffRebud.getDouble("tobonus"));
				DatabaseExt.getPrimaryKey(deptEmpBudget);
				deptEmpBudget.setString("costtype", deptStaffRebud.getString("costtype"));
				DatabaseUtil.insertEntity("default", deptEmpBudget);
				//deptEmpBudget对象为instance（静态实例变量）需要删除主键
				deptEmpBudget.setBigDecimal("empbudid", null);
				deptEmpBudget.setBigDecimal("emptype", null);
				deptEmpBudget.setBigDecimal("tosalary", null);
				deptEmpBudget.setBigDecimal("toweal", null);
				deptEmpBudget.setBigDecimal("tobonus", null);
				deptEmpBudget.setBigDecimal("empnum", null);
				deptEmpBudget.setBigDecimal("month", null);
			}else if(result==1){//查询有一条记录，更新记录
				Float empnum = deptEmpBudget.getFloat("empnum");
				Double emptosalary = deptEmpBudget.getDouble("tosalary");
				Double emptoweal = deptEmpBudget.getDouble("toweal");
				Double emptobonus = deptEmpBudget.getDouble("tobonus");
				Float renum = deptStaffRebud.getFloat("renum");//传进来的招聘人数
				Double Staftosalary = deptStaffRebud.getDouble("tosalary");//传进来的薪资
				Double Staftoweal = deptStaffRebud.getDouble("toweal");//传进来的福利
				Double Staftobonus = deptStaffRebud.getDouble("tobonus");//传进来奖金
				Float total = empnum+renum;
				Double tosalary = emptosalary + Staftosalary;
				Double toweal = emptoweal + Staftoweal;
				Double tobonus = emptobonus + Staftobonus;
				deptEmpBudget.setFloat("empnum", total);
				deptEmpBudget.setDouble("tosalary", tosalary);
				deptEmpBudget.setDouble("toweal", toweal);
				deptEmpBudget.setDouble("tobonus", tobonus);
				DatabaseUtil.updateEntity("default", deptEmpBudget);
				deptEmpBudget.setBigDecimal("empbudid", null);
				deptEmpBudget.setBigDecimal("empnum", null);
				deptEmpBudget.setBigDecimal("emptype", null);
				deptEmpBudget.setBigDecimal("tosalary", null);
				deptEmpBudget.setBigDecimal("toweal", null);
				deptEmpBudget.setBigDecimal("tobonus", null);
			}else if(result==-1){//查到多条记录
				deptEmpBudget.setBigDecimal("empbudid", null);
				deptEmpBudget.setBigDecimal("empnum", null);
				deptEmpBudget.setBigDecimal("emptype", null);
				deptEmpBudget.setBigDecimal("tosalary", null);
				deptEmpBudget.setBigDecimal("toweal", null);
				deptEmpBudget.setBigDecimal("tobonus", null);
			}
		}
		//如果para=0则为自动计算，需要自动计算公摊，若为1则不需要计算公摊
		if("0".equals(para)){
			//创建一个公摊对象
			commonj.sdo.DataObject DeptSharBudget = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptSharBudget");
			//判断传进来的是几月（）
			for (int i = 0; i <= 12-month; i++) {
				int a=month+i;
				DeptSharBudget.setInt("month", a);
				DeptSharBudget.setString("orgid", deptStaffRebud.getString("orgid"));
				DeptSharBudget.setString("year", deptStaffRebud.getString("year"));
				String citycode = deptStaffRebud.getString("citycode");
				if(!(citycode.equals("1")||citycode.equals("2")||citycode.equals("3")||citycode.equals("4")||citycode.equals("5")||
						citycode.equals("6")||citycode.equals("7")||citycode.equals("8")||citycode.equals("9"))){
					citycode = "0";
				}
				DeptSharBudget.setString("citycode", citycode);
				DeptSharBudget.setString("costtype", deptStaffRebud.getString("costtype"));
				int result= DatabaseUtil.expandEntityByTemplate("default",DeptSharBudget,DeptSharBudget);
				if(result==0){//查询没有记录，新增一条记录
					//查询人员表存量和招聘的所有人员
					HashMap param = new HashMap();
					param.put("orgid", deptStaffRebud.getString("orgid"));
					param.put("year", deptStaffRebud.getString("year"));
					//传进来的citycode在sql里面判断城市为其他
					param.put("citycode", deptStaffRebud.getString("citycode"));
					param.put("costtype", deptStaffRebud.getString("costtype"));
					param.put("month", a);
					//事务没提交，查到的是数据库已有的数据
					Object[] list = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_budget.recurit.queryEmpPersonAndMoney", param);
					if(list.length!=0){
						DataObject result1 = (DataObject) list[0];
						Double fee  = result1.getDouble("fee");
						Float sumempnum  = result1.getFloat("sumempnum");
						DeptSharBudget.setDouble("sharmoney",fee);
						DeptSharBudget.setFloat("pernum",sumempnum);
						DatabaseExt.getPrimaryKey(DeptSharBudget);
//	        		DeptSharBudget.setString("costtype", deptStaffRebud.getString("costtype"));
						DatabaseUtil.insertEntity("default", DeptSharBudget);
						DeptSharBudget.setBigDecimal("sharid", null);
						DeptSharBudget.setBigDecimal("orgid", null);
						DeptSharBudget.setString("year", null);
						DeptSharBudget.setBigDecimal("month", null);
						DeptSharBudget.setString("citycode", null);
						DeptSharBudget.setBigDecimal("pernum", null);
						DeptSharBudget.setBigDecimal("sharmoney", null);
					}
				}else if(result==1){//查询有一条记录，更新记录
					//查询人员表存量和招聘的所有人员保存到公摊的人员
					HashMap param = new HashMap();
					param.put("orgid", deptStaffRebud.getString("orgid"));
					param.put("year", deptStaffRebud.getString("year"));
					param.put("citycode", citycode);
					param.put("costtype", deptStaffRebud.getString("costtype"));
					param.put("month", a);
					DatabaseExt.executeNamedSql("default", "com.primeton.eos.ame_budget.recurit.updateEmpPersonAndMoney", param);
					DeptSharBudget.setBigDecimal("sharid", null);
					DeptSharBudget.setBigDecimal("orgid", null);
					DeptSharBudget.setString("year", null);
					DeptSharBudget.setBigDecimal("month", null);
					DeptSharBudget.setString("citycode", null);
					DeptSharBudget.setBigDecimal("pernum", null);
					DeptSharBudget.setBigDecimal("sharmoney", null);
				}else if(result==-1){//查到多条记录
					DeptSharBudget.setBigDecimal("sharid", null);
					DeptSharBudget.setBigDecimal("orgid", null);
					DeptSharBudget.setString("year", null);
					DeptSharBudget.setBigDecimal("month", null);
					DeptSharBudget.setString("citycode", null);
					DeptSharBudget.setBigDecimal("pernum", null);
					DeptSharBudget.setBigDecimal("sharmoney", null);
				}
			}
		}
	}


	@Bizlet("")
	public void modifyDeptEmpBudget(DataObject deptStaffRebud,int modifyRenum,Double modifyTosalary,Double modifyToweal,Double modifyTobonus,String para) throws Exception {
		//创建一个部门人员预算对象
		commonj.sdo.DataObject deptEmpBudget = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptEmpBudget");
		//判断传进来的是几月（）
		int month = deptStaffRebud.getInt("month");
		for (int i = 0; i <= 12-month; i++) {
			int a=month+i;
			deptEmpBudget.setInt("month", a);
			deptEmpBudget.setString("orgid", deptStaffRebud.getString("orgid"));
			deptEmpBudget.setString("year", deptStaffRebud.getString("year"));
			deptEmpBudget.setString("citycode", deptStaffRebud.getString("citycode"));
			deptEmpBudget.setString("costtype", deptStaffRebud.getString("costtype"));
			deptEmpBudget.setString("status", "2");//2代表招聘
			int result= DatabaseUtil.expandEntityByTemplate("default",deptEmpBudget,deptEmpBudget);
			if(result==0){//查询没有记录，新增一条记录(数据完善之后不会出现这种)
				deptEmpBudget.setFloat("empnum", deptStaffRebud.getFloat("renum"));
				deptEmpBudget.setDouble("tosalary", deptStaffRebud.getDouble("tosalary"));
				deptEmpBudget.setDouble("toweal", deptStaffRebud.getDouble("toweal"));
				deptEmpBudget.setDouble("tobonus", deptStaffRebud.getDouble("tobonus"));
				DatabaseExt.getPrimaryKey(deptEmpBudget);
//				deptEmpBudget.setString("costtype", deptStaffRebud.getString("costtype"));
				DatabaseUtil.insertEntity("default", deptEmpBudget);
				//deptEmpBudget对象为instance（静态实例变量）需要删除主键
				deptEmpBudget.setBigDecimal("empbudid", null);
				deptEmpBudget.setString("emptype", null);
				deptEmpBudget.setBigDecimal("tosalary", null);
				deptEmpBudget.setBigDecimal("toweal", null);
				deptEmpBudget.setBigDecimal("tobonus", null);
			}else if(result==1){//查询有一条记录，更新记录
				Float empnum = deptEmpBudget.getFloat("empnum");
				Double emptosalary = deptEmpBudget.getDouble("tosalary");
				Double emptoweal = deptEmpBudget.getDouble("toweal");
				Double emptobonus = deptEmpBudget.getDouble("tobonus");
				Float total = empnum + modifyRenum;//（修改后的增量可以为负数）+ 数据库存量 = 更新后的数据
				Double tosalary = emptosalary + modifyTosalary;
				Double toweal = emptoweal + modifyToweal;
				Double tobonus = emptobonus + modifyTobonus;
				deptEmpBudget.setFloat("empnum", total);
				deptEmpBudget.setDouble("tosalary", tosalary);
				deptEmpBudget.setDouble("toweal", toweal);
				deptEmpBudget.setDouble("tobonus", tobonus);
				DatabaseUtil.updateEntity("default", deptEmpBudget);
				deptEmpBudget.setBigDecimal("empbudid", null);
				deptEmpBudget.setBigDecimal("empnum", null);
				deptEmpBudget.setString("emptype", null);
				deptEmpBudget.setBigDecimal("tosalary", null);
				deptEmpBudget.setBigDecimal("toweal", null);
				deptEmpBudget.setBigDecimal("tobonus", null);
			}else if(result==-1){//查到多条记录（数据出现重复）
				deptEmpBudget.setBigDecimal("empbudid", null);
				deptEmpBudget.setBigDecimal("empnum", null);
				deptEmpBudget.setString("emptype", null);
				deptEmpBudget.setBigDecimal("tosalary", null);
				deptEmpBudget.setBigDecimal("toweal", null);
				deptEmpBudget.setBigDecimal("tobonus", null);
			}
		}
		//如果para=0则为自动计算，需要自动计算公摊，若为1则不需要计算公摊
		if("0".equals(para)){
			//创建一个公摊对象
			commonj.sdo.DataObject DeptSharBudget = commonj.sdo.helper.DataFactory.INSTANCE.create("com.primeton.eos.ame_budget.ame_budget","DeptSharBudget");
			for (int i = 0; i <= 12-month; i++) {
				int a=month+i;
				DeptSharBudget.setInt("month", a);
				DeptSharBudget.setString("orgid", deptStaffRebud.getString("orgid"));
				DeptSharBudget.setString("year", deptStaffRebud.getString("year"));
				String citycode = deptStaffRebud.getString("citycode");
				if(!(citycode.equals("1")||citycode.equals("2")||citycode.equals("3")||citycode.equals("4")||citycode.equals("5")||
						citycode.equals("6")||citycode.equals("7")||citycode.equals("8")||citycode.equals("9"))){
					citycode = "0";
				}
				DeptSharBudget.setString("citycode", citycode);
				DeptSharBudget.setString("costtype", deptStaffRebud.getString("costtype"));
				int result= DatabaseUtil.expandEntityByTemplate("default",DeptSharBudget,DeptSharBudget);
				if(result==0){//查询没有记录，新增一条记录
					//查询人员表存量和招聘的所有人员
					HashMap param = new HashMap();
					param.put("orgid", deptStaffRebud.getString("orgid"));
					param.put("year", deptStaffRebud.getString("year"));
					param.put("citycode", deptStaffRebud.getString("citycode"));
					param.put("costtype", deptStaffRebud.getString("costtype"));
					param.put("month", a);
					//查询每个月每个degree的人员数量与价钱总和
					Object[] list = DatabaseExt.queryByNamedSql("default", "com.primeton.eos.ame_budget.recurit.queryEmpPersonAndMoney", param);
					if(list.length!=0){//查询每个月的人员与money
						DataObject result1 = (DataObject) list[0];
						Double fee  = result1.getDouble("fee");
						Float sumempnum  = result1.getFloat("sumempnum");
						DeptSharBudget.setDouble("sharmoney",fee);
						DeptSharBudget.setFloat("pernum",sumempnum);
						DatabaseExt.getPrimaryKey(DeptSharBudget);
//			        		DeptSharBudget.setString("costtype", deptStaffRebud.getString("costtype"));
						DatabaseUtil.insertEntity("default", DeptSharBudget);
						DeptSharBudget.setBigDecimal("sharid", null);
						DeptSharBudget.setBigDecimal("orgid", null);
						DeptSharBudget.setString("year", null);
						DeptSharBudget.setBigDecimal("month", null);
						DeptSharBudget.setString("citycode", null);
						DeptSharBudget.setBigDecimal("pernum", null);
						DeptSharBudget.setBigDecimal("sharmoney", null);
					}
				}else if(result==1){//查询有一条记录，更新记录
					//查询人员表存量和招聘的所有人员
					HashMap param = new HashMap();
					param.put("orgid", deptStaffRebud.getString("orgid"));
					param.put("year", deptStaffRebud.getString("year"));
					param.put("citycode", citycode);
					param.put("costtype", deptStaffRebud.getString("costtype"));
					param.put("month", a);
					DatabaseExt.executeNamedSql("default", "com.primeton.eos.ame_budget.recurit.updateEmpPersonAndMoney", param);
					DeptSharBudget.setBigDecimal("sharid", null);
					DeptSharBudget.setBigDecimal("orgid", null);
					DeptSharBudget.setString("year", null);
					DeptSharBudget.setBigDecimal("month", null);
					DeptSharBudget.setString("citycode", null);
					DeptSharBudget.setBigDecimal("pernum", null);
					DeptSharBudget.setBigDecimal("sharmoney", null);
				}else if(result==-1){//查到多条记录
					DeptSharBudget.setBigDecimal("sharid", null);
					DeptSharBudget.setBigDecimal("orgid", null);
					DeptSharBudget.setString("year", null);
					DeptSharBudget.setBigDecimal("month", null);
					DeptSharBudget.setString("citycode", null);
					DeptSharBudget.setBigDecimal("pernum", null);
					DeptSharBudget.setBigDecimal("sharmoney", null);
				}
			}
		}
	}
}