/**
 * 
 */
package com.zhonghe.ame.payment;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.apache.commons.lang.StringUtils;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;
import com.ibm.icu.math.BigDecimal;
import com.ibm.icu.text.DecimalFormat;
import com.raq.expression.function.Count;

import commonj.sdo.DataObject;

/**
 * @author huangqj
 * @date 2022-10-28 15:09:09
 *
 */
@Bizlet("")
public class PayMentBean {
	
	public static final String CONTRACTID = "contract_id";
	public static final String  DEFAULT = "default";
	public static DecimalFormat fnum = new DecimalFormat("##0.0000000000000000"); 
	
	
	@Bizlet("")
	public String queryPaid(DataObject[] yfs,String contractNo){
		String paidSum = "";
		String valueStr = "0.00";
		BigDecimal yf = new BigDecimal(valueStr);
		BigDecimal add = null;
		String sum = null;
		for (int i = 0; i < yfs.length; i++) {
			DataObject dataObject = yfs[i];
			sum = (String) dataObject.get("apply_pay_contract_sum");
			BigDecimal yfj = new BigDecimal(sum);
			add = yf.add(yfj);
			yf = add;
		}
		if (add == null) {
			paidSum = "0.00";
		}else {
			paidSum = String.valueOf(add);
		}
		return paidSum;
	}
	@Bizlet("")
	public String contractBalance(String contractSum,String paidSum){
		DecimalFormat dFormat = new DecimalFormat("0.00");
		double c = Double.parseDouble(contractSum);
		double d = Double.parseDouble(paidSum);
		String contractBalance = dFormat.format( c - d);
		return contractBalance;
	}
	
	public static boolean isNullOrEmpty(String str) {
		return StringUtils.isEmpty(str) || StringUtils.isBlank(str);
	}
	
	@Bizlet("")
	public String checkPayPaid(String contractId,int applyPayContractSum){
		/*
		 * 
		 * 2、根据合同编号及当前季度作为条件查询出除废弃的所有付款管理信息
		 * 3、获取所有付款管理信息中的本次支付金额总数
		 * 4、根据合同编号获取当前季度的付款计划
		 * 5、将支付金额总数与
		 */
		String result = "";
		//1、获取当前时间，根据当前时间月份获取当前时间属于哪个季度
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM");
		String date = simpleDateFormat.format(new Date());
		String month = date.substring(5);
		String startDate = null;
		String endDate = null;
		String years = date.substring(0,4);
		int planSum = 0;
		HashMap<String,Object> map1 = new HashMap<String,Object>();
		if (month.equals("01") || month.equals("02")  || month.equals("03")) {
			startDate = date.substring(0,4) + "-01-01";
			endDate = date.substring(0,4) + "-03-31";
			map1.put("contractId",contractId);
			map1.put("years",years);
			DataObject org = queryOneEntity("com.zhonghe.ame.payment.payMent.queryPlan", map1);
			planSum = org.getInt("jan") + org.getInt("feb") + org.getInt("mar");
		}else if (month.equals("04") || month.equals("06")  || month.equals("05")) {
			startDate = date.substring(0,4) + "-04-01";
			endDate = date.substring(0,4) + "-06-30";
			map1.put("contractId",contractId);
			map1.put("years",years);
			DataObject org = queryOneEntity("com.zhonghe.ame.payment.payMent.queryPlan", map1);
			planSum = org.getInt("apr") + org.getInt("may") + org.getInt("jun");
		}else if (month.equals("07") || month.equals("08")  || month.equals("09")){
			startDate = date.substring(0,4) + "-07-01";
			endDate = date.substring(0,4) + "-09-30";
			map1.put("contractId",contractId);
			map1.put("years",years);
			DataObject org = queryOneEntity("com.zhonghe.ame.payment.payMent.queryPlan", map1);
			planSum = org.getInt("jul") + org.getInt("aug") + org.getInt("sep");
		}else {
			startDate = date.substring(0,4) + "-10-01";
			endDate = date.substring(0,4) + "-12-31";
			map1.put("contractId",contractId);
			map1.put("years",years);
			DataObject org = queryOneEntity("com.zhonghe.ame.payment.payMent.queryPlan", map1);
			planSum = org.getInt("oct") + org.getInt("nov") + org.getInt("dec");
		}
		int countSum = 0;
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("contractId",contractId);
		map.put("startDate",startDate);
		map.put("endDate",endDate);
		Object[] objects = DatabaseExt.queryByNamedSql("default","com.zhonghe.ame.payment.payMent.queryBid", map);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects,"commonj.sdo.DataObject",true);
		if(dataObjects != null && dataObjects.length > 0){
			for (int i = 0; i < dataObjects.length; i++) {
				DataObject dataObject = dataObjects[i];
				int a = dataObject.getInt("apply_pay_contract_sum");
				countSum = countSum + a ; 
			}
		}
		if (countSum <= planSum) {
			result = "true";
		}else {
			result = "false";
		}
		return result;
	}
	
	public static void main(String[] args) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM");
		String date = simpleDateFormat.format(new Date());
		String month = date.substring(5);
		if (month.equals("01") || month.equals("02")  || month.equals("03")) {
			String startDate = date.substring(0,4);
			System.out.println(startDate);
		}else if (month.equals("04") || month.equals("06")  || month.equals("05")) {
			String startDate = date.substring(0,4);
			System.out.println(startDate);
		}else if (month.equals("07") || month.equals("08")  || month.equals("09")){
			String startDate = date.substring(0,4);
			System.out.println(startDate);
		}else {
			String startDate = date.substring(0,4) + "-10-01";
			System.out.println(startDate);
		}
		System.out.println(month);
		System.out.println(simpleDateFormat.format(new Date()));
	}
	
	public static DataObject queryOneEntity(String sqlName,HashMap<String,Object> parameter){
		Object[] objects = DatabaseExt.queryByNamedSql("default",sqlName,parameter);
		DataObject[] dataObjects = DataObjectUtil.convertDataObjects(objects,"commonj.sdo.DataObject",true);
		if(dataObjects != null && dataObjects.length > 0){
			return dataObjects[0];
		}
		
		return null;
	}
}
