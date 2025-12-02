package com.zhonghe.ame.contractPact;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.lang.Dict;
import cn.hutool.core.text.CharSequenceUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.das.entity.criteria.ExprType;
import com.eos.das.entity.criteria.OrderbyType;
import com.eos.das.entity.criteria.impl.CriteriaTypeImpl;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.foundation.database.DatabaseExt;
import com.eos.foundation.database.DatabaseUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("包装收款/开票计划数据")
public class WrapChargePlanInfo {

	@Bizlet("包装开票计划跟踪数据")
	public DataObject[] wrap(DataObject[] dataObjects, DataObject criteria) throws Exception {
		if (dataObjects != null && dataObjects.length > 0) {
			List<DataObject> warpDatas = new ArrayList<DataObject>();
			Session dbSession = new Session(DataSourceHelper.getDataSource());
			List<DataObject> feeCollectionPlanList = new ArrayList<DataObject>();
			List<DataObject> invoiceCollectionPlanList = new ArrayList<DataObject>();
			Map<String, DataObject> invoiceCollectionContractNoPlanMap = new HashMap<String, DataObject>();

			boolean criteriaBoolean = this.isCriteriaField(criteria);
			Map<String, String> orderMap = this.getCriteriaOrder(criteria);

			for (DataObject dataObject : dataObjects) {
				if (CharSequenceUtil.equals("1", dataObject.getString("isChargePlan"))) {
					feeCollectionPlanList.add(dataObject);
				} else {
					if (CharSequenceUtil.isNotBlank(dataObject.getString("contractNo"))) {
						String key = CharSequenceUtil.format("{}_{}_{}", dataObject.getString("years"), dataObject.getString("contractNo"), dataObject.getString("secondaryOrg"));
						invoiceCollectionContractNoPlanMap.put(key, dataObject);
					} else {
						invoiceCollectionPlanList.add(dataObject);
					}
				}
			}

			String queryInvoiceBySecSql = "SELECT * FROM zh_invoice WHERE app_status = '2' AND contract_no = ? AND create_time >= ? AND create_time <= ? AND secondary_org = ?";
			String queryInvoiceByNotSecSql = "SELECT t.* FROM zh_invoice t INNER JOIN( SELECT secondary_org, MAX (create_time) AS max_date FROM zh_invoice WHERE app_status = '2' AND contract_no = ? AND create_time >= ? AND create_time <= ? AND secondary_org != ? GROUP BY secondary_org ) sub ON t.secondary_org = sub.secondary_org AND t.create_time = sub.max_date";

			// 遍历收费合同中的明细数据，查询相关开票数据
			for (DataObject feeCollectionPlan : feeCollectionPlanList) {
				String contractNo = feeCollectionPlan.getString("contractNo");
				String year = feeCollectionPlan.getString("years");
				String startDate = CharSequenceUtil.format("{}-{}-{}", year, "01", "01");
				String endDate = CharSequenceUtil.format("{}-{}-{}", year, "12", "31");
				String secOrg = feeCollectionPlan.getString("secondaryOrg");

				// 获取合同编号及二级组织都相同的开票数据集合
				List<Entity> invoiceBySecList = dbSession.query(queryInvoiceBySecSql, contractNo, startDate, endDate, secOrg);

				feeCollectionPlan = this.fetchFillData(feeCollectionPlan, invoiceBySecList);

				if (!criteriaBoolean) {
					// 获取合同编号相同但二级组织不同到开票数据集合
					List<Entity> invoiceByNotSecList = dbSession.query(queryInvoiceByNotSecSql, contractNo, startDate, endDate, secOrg);
					if (invoiceByNotSecList != null && invoiceByNotSecList.size() > 0) {
						for (Entity invoiceByNotSec : invoiceByNotSecList) {
							String key = CharSequenceUtil.format("{}_{}_{}", year, contractNo, invoiceByNotSec.getStr("secondary_org"));
							if (!invoiceCollectionContractNoPlanMap.containsKey(key)) {
								DataObject annualChargePlan = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.AnnualChargePlan");
								annualChargePlan = this.fetchAnnualChargePlan(annualChargePlan, feeCollectionPlan, invoiceByNotSec);
								DatabaseExt.getPrimaryKey(annualChargePlan);
								DatabaseUtil.insertEntity("default", annualChargePlan);
								invoiceCollectionContractNoPlanMap.put(key, annualChargePlan);
							}
						}
					}
				}

				warpDatas.add(feeCollectionPlan);
			}

			// 遍历待签、产值分配等类型数据
			for (DataObject invoiceCollectionPlan : invoiceCollectionPlanList) {
				invoiceCollectionPlan = this.fetchFillData(invoiceCollectionPlan, null);
				warpDatas.add(invoiceCollectionPlan);
			}

			// 遍历有合同编号的产值分配数据
			for (Map.Entry<String, DataObject> entry : invoiceCollectionContractNoPlanMap.entrySet()) {
				DataObject dataObject = entry.getValue();
				String contractNo = dataObject.getString("contractNo");
				String year = dataObject.getString("years");
				String startDate = CharSequenceUtil.format("{}-{}-{}", year, "01", "01");
				String endDate = CharSequenceUtil.format("{}-{}-{}", year, "12", "31");
				String secOrg = dataObject.getString("secondaryOrg");

				// 获取合同编号及二级组织都相同的开票数据集合
				List<Entity> invoiceBySecList = dbSession.query(queryInvoiceBySecSql, contractNo, startDate, endDate, secOrg);
				if (invoiceBySecList != null && invoiceBySecList.size() > 0) {
					dataObject = this.fetchFillData(dataObject, invoiceBySecList);
					warpDatas.add(dataObject);
				} else {
					DataObject annualChargePlan = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.AnnualChargePlan");
					annualChargePlan.set("id", dataObject.get("id"));
					DatabaseUtil.deleteEntity("default", annualChargePlan);
				}
			}

			if ("1".equals(orderMap.get("isOrder"))) {
				if ("sumExcludeTax".equals(orderMap.get("orderbyName"))) {
					if ("asc".equals(orderMap.get("orderbySort"))) {
						warpDatas = warpDatas.stream().sorted(Comparator.comparing((dataObject) -> ((DataObject) dataObject).getBigDecimal("sumExcludeTax"))).collect(Collectors.toList());
					} else {
						warpDatas = warpDatas.stream().sorted(Comparator.comparing((dataObject) -> ((DataObject) dataObject).getBigDecimal("sumExcludeTax")).reversed()).collect(Collectors.toList());
					}
				} else if ("sumTotalBookIncome".equals(orderMap.get("orderbyName"))) {
					if ("asc".equals(orderMap.get("orderbySort"))) {
						warpDatas = warpDatas.stream().sorted(Comparator.comparing((dataObject) -> ((DataObject) dataObject).getBigDecimal("sumTotalBookIncome"))).collect(Collectors.toList());
					} else {
						warpDatas = warpDatas.stream().sorted(Comparator.comparing((dataObject) -> ((DataObject) dataObject).getBigDecimal("sumTotalBookIncome")).reversed())
								.collect(Collectors.toList());
					}
				}
			}

			return ArrayUtil.toArray(warpDatas, DataObject.class);
		} else {
			return dataObjects;
		}
	}

	private DataObject fetchFillData(DataObject dataObject, List<Entity> invoiceBySecList) {
		// 存储每月开票金额
		BigDecimal[] monthlyInvoiceAmounts = new BigDecimal[12];
		for (int i = 0; i < 12; i++) {
			monthlyInvoiceAmounts[i] = BigDecimal.ZERO;
		}
		// 存储累加账面收入
		BigDecimal totalBookIncome = BigDecimal.ZERO;
		if (invoiceBySecList != null && invoiceBySecList.size() > 0) {
			for (Entity invoiceBySec : invoiceBySecList) {
				int month = DateUtil.month(invoiceBySec.getDate("create_time")); // 获得月份，从0开始计数
				monthlyInvoiceAmounts[month] = monthlyInvoiceAmounts[month].add(invoiceBySec.getBigDecimal("invoice_sum"));
				totalBookIncome = totalBookIncome.add(invoiceBySec.getBigDecimal("book_income"));
			}
			dataObject.setString("isInvoice", "1");
		} else {
			dataObject.setString("isInvoice", "0");
		}
		// 1月实际
		dataObject.setBigDecimal("janActual", monthlyInvoiceAmounts[0]);
		// 2月实际
		dataObject.setBigDecimal("febActual", monthlyInvoiceAmounts[1]);
		// 3月实际
		dataObject.setBigDecimal("marActual", monthlyInvoiceAmounts[2]);
		// 4月实际
		dataObject.setBigDecimal("aprActual", monthlyInvoiceAmounts[3]);
		// 5月实际
		dataObject.setBigDecimal("mayActual", monthlyInvoiceAmounts[4]);
		// 6月实际
		dataObject.setBigDecimal("junActual", monthlyInvoiceAmounts[5]);
		// 7月实际
		dataObject.setBigDecimal("julActual", monthlyInvoiceAmounts[6]);
		// 8月实际
		dataObject.setBigDecimal("augActual", monthlyInvoiceAmounts[7]);
		// 9月实际
		dataObject.setBigDecimal("sepActual", monthlyInvoiceAmounts[8]);
		// 10月实际
		dataObject.setBigDecimal("octActual", monthlyInvoiceAmounts[9]);
		// 11月实际
		dataObject.setBigDecimal("novActual", monthlyInvoiceAmounts[10]);
		// 12月实际
		dataObject.setBigDecimal("decActual", monthlyInvoiceAmounts[11]);
		// 实际完成收入
		dataObject.setBigDecimal("sumTotalBookIncome", totalBookIncome);
		// 计划收入金额
		dataObject.setBigDecimal("sumExcludeTax", NumberUtil.div(dataObject.getString("sum"), "1.06", 2));
		return dataObject;
	}

	private DataObject fetchAnnualChargePlan(DataObject annualChargePlan, DataObject feeCollectionPlan, Entity invoiceBySec) {
		annualChargePlan.set("contractName", feeCollectionPlan.getString("contractName"));
		annualChargePlan.set("contractStauts", "4");
		annualChargePlan.set("signatory", feeCollectionPlan.getString("signatory"));
		annualChargePlan.set("signatoryName", feeCollectionPlan.getString("signatoryName"));
		annualChargePlan.set("payee", feeCollectionPlan.getString("payee"));
		annualChargePlan.set("contractSum", feeCollectionPlan.getBigDecimal("contractSum"));
		annualChargePlan.set("createUserid", invoiceBySec.getStr("create_userid"));
		annualChargePlan.set("createUsername", invoiceBySec.getStr("create_username"));
		annualChargePlan.set("years", feeCollectionPlan.getString("years"));
		annualChargePlan.set("jan", BigDecimal.ZERO);
		annualChargePlan.set("feb", BigDecimal.ZERO);
		annualChargePlan.set("mar", BigDecimal.ZERO);
		annualChargePlan.set("apr", BigDecimal.ZERO);
		annualChargePlan.set("may", BigDecimal.ZERO);
		annualChargePlan.set("jun", BigDecimal.ZERO);
		annualChargePlan.set("jul", BigDecimal.ZERO);
		annualChargePlan.set("aug", BigDecimal.ZERO);
		annualChargePlan.set("sep", BigDecimal.ZERO);
		annualChargePlan.set("oct", BigDecimal.ZERO);
		annualChargePlan.set("nov", BigDecimal.ZERO);
		annualChargePlan.set("dec", BigDecimal.ZERO);
		annualChargePlan.set("sum", BigDecimal.ZERO);
		annualChargePlan.set("createTime", feeCollectionPlan.getDate("createTime"));
		annualChargePlan.set("secondaryOrg", invoiceBySec.getStr("secondary_org"));
		annualChargePlan.set("secondaryOrgname", invoiceBySec.getStr("secondary_orgname"));
		annualChargePlan.set("major", feeCollectionPlan.getString("major"));
		annualChargePlan.set("projectType", feeCollectionPlan.getString("projectType"));
		annualChargePlan.set("headquarterGroup", feeCollectionPlan.getString("headquarterGroup"));
		annualChargePlan.set("riskLevel", "1");
		annualChargePlan.set("estimatedDate", feeCollectionPlan.getDate("createTime"));
		annualChargePlan.set("contractNo", feeCollectionPlan.getString("contractNo"));
		return annualChargePlan;
	}

	private boolean isCriteriaField(DataObject criteria) {
		CriteriaTypeImpl criteriaTypeImpl = (CriteriaTypeImpl) criteria;
		List<ExprType> exprTypeList = criteriaTypeImpl.get_expr();
		if (exprTypeList != null && exprTypeList.size() > 0) {
			for (ExprType exprType : exprTypeList) {
				String fieldName = exprType.get_property();
				String fieldValue = exprType.get_value();
				if (!StrUtil.equals("years", fieldName) && StrUtil.isNotBlank(fieldValue)) {
					return true;
				}
			}
		}
		return false;
	}

	private Map<String, String> getCriteriaOrder(DataObject criteria) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("isOrder", "0");
		CriteriaTypeImpl criteriaTypeImpl = (CriteriaTypeImpl) criteria;
		List<OrderbyType> orderbyTypeList = criteriaTypeImpl.get_orderby();
		if (orderbyTypeList != null && orderbyTypeList.size() > 0) {
			for (OrderbyType orderbyType : orderbyTypeList) {
				String orderbyName = orderbyType.get_property();
				String orderbySort = orderbyType.get_sort();
				if (StrUtil.equals("sumExcludeTax", orderbyName) || StrUtil.equals("sumTotalBookIncome", orderbyName)) {
					map.put("isOrder", "1");
					map.put("orderbyName", orderbyName);
					map.put("orderbySort", orderbySort);
					return map;
				}
			}
		}
		return map;
	}

}
