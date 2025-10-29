package com.zhonghe.ame.kaohe;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.db.Entity;

import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;
import com.esproc.jdbc.Array;
import com.primeton.data.sdo.impl.types.DayType;

import commonj.sdo.DataObject;

@Bizlet("收入指标分析预测导出Excel数据包装")
public class SrzbfxycExcelWrap {

	@Bizlet("Excel数据包装")
	public Map<String, List<DataObject>> excelWrap(List<Entity> operatingRevenueList, List<Entity> externalIncomeOfTheGroupList) {
		Map<String, List<DataObject>> excelMap = new HashMap<String, List<DataObject>>();
		if (operatingRevenueList != null && operatingRevenueList.size() > 0) {
			List<DataObject> dataObjectList = new ArrayList<DataObject>();
			for (Entity operatingRevenue : operatingRevenueList) {
				DataObject dataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.kaohe.incomeStatistics.srzbfxycExcelEntity");
				dataObject.setString("secondaryOrgname", operatingRevenue.getStr("secondaryOrgname"));
				dataObject.setBigDecimal("expectedValue", operatingRevenue.getBigDecimal("expectedValue"));
				dataObject.setBigDecimal("annualForecastedBookValue", operatingRevenue.getBigDecimal("annualForecastedBookValue"));
				dataObject.setBigDecimal("annualForecastAssessmentValue", operatingRevenue.getBigDecimal("annualForecastAssessmentValue"));
				dataObject.setBigDecimal("assessmentValueGap", operatingRevenue.getBigDecimal("assessmentValueGap"));
				dataObject.setBigDecimal("asOfTheCurrentMonthTheBookValueHasBeenCompleted", operatingRevenue.getBigDecimal("asOfTheCurrentMonthTheBookValueHasBeenCompleted"));
				dataObject.setBigDecimal("asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted", operatingRevenue.getBigDecimal("asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted"));
				dataObject.setString("assessmentCompletionRate", operatingRevenue.getStr("assessmentCompletionRate"));
				dataObject.setBigDecimal("totalToBeCompletedInTheFuture", operatingRevenue.getBigDecimal("totalToBeCompletedInTheFuture"));
				dataObject.setBigDecimal("totalHandheldContractAmount", operatingRevenue.getBigDecimal("totalHandheldContractAmount"));
				dataObject.setBigDecimal("totalAmountOfPendingContractToBeSigned", operatingRevenue.getBigDecimal("totalAmountOfPendingContractToBeSigned"));
				dataObject.setBigDecimal("totalAmountOfLowriskContractToBeSigned", operatingRevenue.getBigDecimal("totalAmountOfLowriskContractToBeSigned"));
				dataObject.setBigDecimal("totalAmountOfRiskContractsToBeSigned", operatingRevenue.getBigDecimal("totalAmountOfRiskContractsToBeSigned"));
				dataObject.setBigDecimal("totalAmountOfAssessmentDeductionRegulation", operatingRevenue.getBigDecimal("totalAmountOfAssessmentDeductionRegulation"));
				dataObject.setBigDecimal("totalAmountOfAssessmentOfThisYearSRegulation", operatingRevenue.getBigDecimal("totalAmountOfAssessmentOfThisYearSRegulation"));
				dataObject.setBigDecimal("totalAmountOfAssessingVirtualOutputValue", operatingRevenue.getBigDecimal("totalAmountOfAssessingVirtualOutputValue"));
				dataObject.setBigDecimal("totalAmountOfAssessmentIncomeCorrection", operatingRevenue.getBigDecimal("totalAmountOfAssessmentIncomeCorrection"));
				dataObject.setBigDecimal("totalAmountOfAssessOthers", operatingRevenue.getBigDecimal("totalAmountOfAssessOthers"));
				dataObjectList.add(dataObject);
			}
			excelMap.put("营业收入", dataObjectList);
		}
		if (externalIncomeOfTheGroupList != null && externalIncomeOfTheGroupList.size() > 0) {
			List<DataObject> dataObjectList = new ArrayList<DataObject>();
			for (Entity externalIncomeOfTheGroup : externalIncomeOfTheGroupList) {
				DataObject dataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.kaohe.incomeStatistics.srzbfxycExcelEntity");
				dataObject.setString("secondaryOrgname", externalIncomeOfTheGroup.getStr("secondaryOrgname"));
				dataObject.setBigDecimal("expectedValue", externalIncomeOfTheGroup.getBigDecimal("expectedValue"));
				dataObject.setBigDecimal("annualForecastedBookValue", externalIncomeOfTheGroup.getBigDecimal("annualForecastedBookValue"));
				dataObject.setBigDecimal("annualForecastAssessmentValue", externalIncomeOfTheGroup.getBigDecimal("annualForecastAssessmentValue"));
				dataObject.setBigDecimal("assessmentValueGap", externalIncomeOfTheGroup.getBigDecimal("assessmentValueGap"));
				dataObject.setBigDecimal("asOfTheCurrentMonthTheBookValueHasBeenCompleted", externalIncomeOfTheGroup.getBigDecimal("asOfTheCurrentMonthTheBookValueHasBeenCompleted"));
				dataObject.setBigDecimal("asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted", externalIncomeOfTheGroup.getBigDecimal("asOfTheCurrentMonthTheAssessmentValuesHaveBeenCompleted"));
				dataObject.setString("assessmentCompletionRate", externalIncomeOfTheGroup.getStr("assessmentCompletionRate"));
				dataObject.setBigDecimal("totalToBeCompletedInTheFuture", externalIncomeOfTheGroup.getBigDecimal("totalToBeCompletedInTheFuture"));
				dataObject.setBigDecimal("totalHandheldContractAmount", externalIncomeOfTheGroup.getBigDecimal("totalHandheldContractAmount"));
				dataObject.setBigDecimal("totalAmountOfPendingContractToBeSigned", externalIncomeOfTheGroup.getBigDecimal("totalAmountOfPendingContractToBeSigned"));
				dataObject.setBigDecimal("totalAmountOfLowriskContractToBeSigned", externalIncomeOfTheGroup.getBigDecimal("totalAmountOfLowriskContractToBeSigned"));
				dataObject.setBigDecimal("totalAmountOfRiskContractsToBeSigned", externalIncomeOfTheGroup.getBigDecimal("totalAmountOfRiskContractsToBeSigned"));
				dataObject.setBigDecimal("totalAmountOfAssessmentDeductionRegulation", externalIncomeOfTheGroup.getBigDecimal("totalAmountOfAssessmentDeductionRegulation"));
				dataObject.setBigDecimal("totalAmountOfAssessmentOfThisYearSRegulation", externalIncomeOfTheGroup.getBigDecimal("totalAmountOfAssessmentOfThisYearSRegulation"));
				dataObject.setBigDecimal("totalAmountOfAssessingVirtualOutputValue", externalIncomeOfTheGroup.getBigDecimal("totalAmountOfAssessingVirtualOutputValue"));
				dataObject.setBigDecimal("totalAmountOfAssessmentIncomeCorrection", externalIncomeOfTheGroup.getBigDecimal("totalAmountOfAssessmentIncomeCorrection"));
				dataObject.setBigDecimal("totalAmountOfAssessOthers", externalIncomeOfTheGroup.getBigDecimal("totalAmountOfAssessOthers"));
				dataObjectList.add(dataObject);
			}
			excelMap.put("集团外收入", dataObjectList);
		}
		return excelMap;
	}

	@Bizlet("其他参数包装")
	public DataObject[] exportInfoWarp(String year, String month) {
		List<DataObject> dataObjectList = new ArrayList<DataObject>();
		String yearMonth = year + "年" + month + "月";
		for (int i = 0; i < 2; i++) {
			DataObject dataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.kaohe.incomeStatistics.ExportInfoExcelEntity");
			dataObject.setString("yearMonth", yearMonth);
			dataObjectList.add(dataObject);
		}
		return ArrayUtil.toArray(dataObjectList, DataObject.class);
	}

	@Bizlet("其他参数包装")
	public DataObject exportInfo(String year, String month) {
		DataObject dataObject = DataObjectUtil.createDataObject("com.zhonghe.ame.kaohe.incomeStatistics.ExportInfoExcelEntity");
		String yearMonth = year + "年" + month + "月";
		dataObject.setString("yearMonth", yearMonth);
		return dataObject;
	}

}
