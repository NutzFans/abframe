package com.zhonghe.ame.contractPact;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.function.BiFunction;

import cn.hutool.core.collection.ListUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.NumberUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.db.Entity;
import cn.hutool.db.Session;

import com.eos.common.connection.DataSourceHelper;
import com.eos.foundation.data.DataObjectUtil;
import com.eos.system.annotation.Bizlet;

import commonj.sdo.DataObject;

@Bizlet("收入预算执行跟踪")
public class IncomeBudgetTrackUtil {

	@Bizlet("收入预算执行跟踪分析")
	public DataObject[] trackAnalyze(String years) throws Exception {
		List<DataObject> trackDatas = new ArrayList<DataObject>();
		Session dbSession = new Session(DataSourceHelper.getDataSource());

		// 根据年度收入预算分组得到要进行统计的二级单位（中心及分公司）
		String annualPlanYearSecOrgSql = "SELECT secondary_org, secondary_orgname FROM annual_plan_year WHERE years=? GROUP BY secondary_org, secondary_orgname";
		List<Entity> secOrgs = dbSession.query(annualPlanYearSecOrgSql, years);

		// 查询开票数据获取真实的收入数据
		String invoiceYearSql = "SELECT implement_org, book_income, create_time FROM zh_invoice WHERE YEAR(create_time)=?";
		List<Entity> invoiceYears = dbSession.query(invoiceYearSql, years);
		
		trackDatas = CompletableFuture
				.supplyAsync(() -> this.annualYearBySecOrg(secOrgs, years, dbSession))
				.thenCombine(CompletableFuture.supplyAsync(() -> this.invoiceBySecOrg(invoiceYears, dbSession)),
						new BiFunction<Map<String, Entity>, Map<String, Entity>, List<DataObject>>() {

							@Override
							public List<DataObject> apply(Map<String, Entity> annualMap, Map<String, Entity> invoiceMap) {
								return IncomeBudgetTrackUtil.analyzeMerge(annualMap, invoiceMap);
							}

						}).join();		

		return ArrayUtil.toArray(trackDatas, DataObject.class);
	}

	// 对提供的开票数据进行包装（每个组织各月份真实收入汇总）
	private Map<String, Entity> invoiceBySecOrg(List<Entity> invoiceYears, Session dbSession) {
		Map<String, Entity> invoiceMap = new HashMap<String, Entity>();
		invoiceYears.forEach(entity -> {
			String secOrgId = this.getSecOrg(entity.getStr("implement_org"), dbSession);
			if (StrUtil.isNotBlank(secOrgId)) {
				if (invoiceMap.containsKey(secOrgId)) {
					Entity data = invoiceMap.get(secOrgId);
					String fieldName = this.getMonth(entity.getStr("create_time"));
					String income = data.getStr(fieldName);
					if (StrUtil.isNotBlank(income)) {
						data.set(fieldName, NumberUtil.add(income, entity.getStr("book_income")));
					} else {
						data.set(fieldName, entity.getBigDecimal("book_income"));
					}
					invoiceMap.put(secOrgId, data);
				} else {
					Entity data = new Entity();
					String fieldName = this.getMonth(entity.getStr("create_time"));
					data.set(fieldName, entity.getBigDecimal("book_income"));
					invoiceMap.put(secOrgId, data);
				}
			}
		});
		return invoiceMap;
	}

	// 根据提供的组织获取对应二级组织
	private String getSecOrg(String orgId, Session dbSession) {
		try {
			String secOrgSql = "SELECT ORGSEQ FROM OM_ORGANIZATION WHERE ORGID=?";
			Entity entity = dbSession.queryOne(secOrgSql, orgId);
			if (entity != null) {
				String orgseq = entity.getStr("ORGSEQ");
				String[] splitToArray = StrUtil.splitToArray(orgseq, ".");
				if (splitToArray.length >= 3) {
					String secOrg = splitToArray[2];
					if (StrUtil.isNotBlank(secOrg)) {
						return secOrg;
					} else {
						return null;
					}
				} else {
					return null;
				}
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	// 根据时间获取月份（字符串标识）
	private String getMonth(String createTime) {
		switch (DateUtil.parse(createTime).monthBaseOne()) {
		case 1: {
			return "jar";
		}
		case 2: {
			return "feb";
		}
		case 3: {
			return "mar";
		}
		case 4: {
			return "apr";
		}
		case 5: {
			return "may";
		}
		case 6: {
			return "jun";
		}
		case 7: {
			return "jul";
		}
		case 8: {
			return "aug";
		}
		case 9: {
			return "sep";
		}
		case 10: {
			return "oct";
		}
		case 11: {
			return "nov";
		}
		case 12: {
			return "dec";
		}
		default: {
			return null;
		}
		}
	}

	// 根据组织分组获取各自汇总数据（月份）
	private Map<String, Entity> annualYearBySecOrg(List<Entity> secOrg, String years, Session dbSession) {
		Map<String, Entity> annualMap = new HashMap<String, Entity>();
		secOrg.forEach(entity -> {
			String secOrgId = entity.getStr("secondary_org");
			Entity annualYear = this.getAnnualYearBySecOrg(secOrgId, years, dbSession);
			annualYear.set("secOrgName", entity.getStr("secondary_orgname"));
			annualMap.put(secOrgId, annualYear);
		});
		return annualMap;
	}

	// 根据组织和年份获取年度预算收入各月份汇总数据
	private Entity getAnnualYearBySecOrg(String secOrgId, String years, Session dbSession) {
		try {
			String querySql = "SELECT SUM( CAST ( jan AS NUMERIC ( 18, 2) ) ) AS jar, SUM ( CAST ( feb AS NUMERIC ( 18, 2 ) ) ) AS feb, SUM ( CAST ( mar AS NUMERIC ( 18, 2 ) ) ) AS mar, SUM ( CAST ( apr AS NUMERIC ( 18, 2 ) ) ) AS apr, SUM ( CAST ( may AS NUMERIC ( 18, 2 ) ) ) AS may, SUM ( CAST ( jun AS NUMERIC ( 18, 2 ) ) ) AS jun, SUM ( CAST ( jul AS NUMERIC ( 18, 2 ) ) ) AS jul, SUM ( CAST ( aug AS NUMERIC ( 18, 2 ) ) ) AS aug, SUM ( CAST ( sep AS NUMERIC ( 18, 2 ) ) ) AS sep, SUM ( CAST ( oct AS NUMERIC ( 18, 2 ) ) ) AS oct, SUM ( CAST ( nov AS NUMERIC ( 18, 2 ) ) ) AS nov, SUM ( CAST ( DEC AS NUMERIC ( 18, 2 ) ) ) AS DEC FROM annual_plan_year WHERE secondary_org = ? AND years = ?";
			return dbSession.queryOne(querySql, secOrgId, years);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<DataObject> analyzeMerge(Map<String, Entity> annualMap, Map<String, Entity> invoiceMap) {
		List<DataObject> trackDatas = new ArrayList<DataObject>();

		annualMap.forEach((secOrgId, entity) -> {

			Entity invoice = invoiceMap.get(secOrgId);

			// 1月份累计预算收入
			CompletableFuture<BigDecimal> jarAccBudget = CompletableFuture.supplyAsync(() -> {
				return NumberUtil.div(entity.getBigDecimal("jar"), 1.06, 2);
			});

			// 1月份累计实际收入
			CompletableFuture<BigDecimal> jarAccActual = CompletableFuture.supplyAsync(() -> {
				if (invoice != null) {
					return invoice.get("jar", new BigDecimal(0));
				} else {
					return new BigDecimal(0);
				}
			});

			// 2月份累计预算
			CompletableFuture<BigDecimal> febAccBudget = CompletableFuture.supplyAsync(() -> {
				return NumberUtil.div(NumberUtil.add(entity.getStr("jar"), entity.getStr("feb")), 1.06, 2);
			});

			// 2月份累计实际收入
			CompletableFuture<BigDecimal> febAccActual = CompletableFuture.supplyAsync(() -> {
				if (invoice != null) {
					return NumberUtil.add(invoice.get("jar", new BigDecimal(0)), invoice.get("feb", new BigDecimal(0)));
				} else {
					return new BigDecimal(0);
				}
			});

			// 3月份累计预算
			CompletableFuture<BigDecimal> marAccBudget = CompletableFuture.supplyAsync(() -> {
				return NumberUtil.div(NumberUtil.add(entity.getStr("jar"), entity.getStr("feb"), entity.getStr("mar")), 1.06, 2);
			});

			// 3月份累计实际收入
			CompletableFuture<BigDecimal> marAccActual = CompletableFuture.supplyAsync(() -> {
				if (invoice != null) {
					return NumberUtil.add(invoice.get("jar", new BigDecimal(0)), invoice.get("feb", new BigDecimal(0)), invoice.get("mar", new BigDecimal(0)));
				} else {
					return new BigDecimal(0);
				}
			});

			// 4月份累计预算
			CompletableFuture<BigDecimal> aprAccBudget = CompletableFuture.supplyAsync(() -> {
				return NumberUtil.div(NumberUtil.add(entity.getStr("jar"), entity.getStr("feb"), entity.getStr("mar"), entity.getStr("apr")), 1.06, 2);
			});

			// 4月份累计实际收入
			CompletableFuture<BigDecimal> aprAccActual = CompletableFuture.supplyAsync(() -> {
				if (invoice != null) {
					return NumberUtil.add(invoice.get("jar", new BigDecimal(0)), invoice.get("feb", new BigDecimal(0)), invoice.get("mar", new BigDecimal(0)),
							invoice.get("apr", new BigDecimal(0)));
				} else {
					return new BigDecimal(0);
				}
			});

			// 5月份累计预算
			CompletableFuture<BigDecimal> mayAccBudget = CompletableFuture.supplyAsync(() -> {
				return NumberUtil.div(NumberUtil.add(entity.getStr("jar"), entity.getStr("feb"), entity.getStr("mar"), entity.getStr("apr"), entity.getStr("may")), 1.06, 2);
			});

			// 5月份累计实际收入
			CompletableFuture<BigDecimal> mayAccActual = CompletableFuture.supplyAsync(() -> {
				if (invoice != null) {
					return NumberUtil.add(invoice.get("jar", new BigDecimal(0)), invoice.get("feb", new BigDecimal(0)), invoice.get("mar", new BigDecimal(0)),
							invoice.get("apr", new BigDecimal(0)), invoice.get("may", new BigDecimal(0)));
				} else {
					return new BigDecimal(0);
				}
			});

			// 6月份累计预算
			CompletableFuture<BigDecimal> junAccBudget = CompletableFuture.supplyAsync(() -> {
				return NumberUtil.div(
						NumberUtil.add(entity.getStr("jar"), entity.getStr("feb"), entity.getStr("mar"), entity.getStr("apr"), entity.getStr("may"), entity.getStr("jun")),
						1.06, 2);
			});

			// 6月份累计实际收入
			CompletableFuture<BigDecimal> junAccActual = CompletableFuture.supplyAsync(() -> {
				if (invoice != null) {
					return NumberUtil.add(invoice.get("jar", new BigDecimal(0)), invoice.get("feb", new BigDecimal(0)), invoice.get("mar", new BigDecimal(0)),
							invoice.get("apr", new BigDecimal(0)), invoice.get("may", new BigDecimal(0)), invoice.get("jun", new BigDecimal(0)));
				} else {
					return new BigDecimal(0);
				}
			});

			// 7月份累计预算
			CompletableFuture<BigDecimal> julAccBudget = CompletableFuture.supplyAsync(() -> {
				return NumberUtil.div(NumberUtil.add(entity.getStr("jar"), entity.getStr("feb"), entity.getStr("mar"), entity.getStr("apr"), entity.getStr("may"),
						entity.getStr("jun"), entity.getStr("jul")), 1.06, 2);
			});

			// 7月份累计实际收入
			CompletableFuture<BigDecimal> julAccActual = CompletableFuture.supplyAsync(() -> {
				if (invoice != null) {
					return NumberUtil.add(invoice.get("jar", new BigDecimal(0)), invoice.get("feb", new BigDecimal(0)), invoice.get("mar", new BigDecimal(0)),
							invoice.get("apr", new BigDecimal(0)), invoice.get("may", new BigDecimal(0)), invoice.get("jun", new BigDecimal(0)),
							invoice.get("jul", new BigDecimal(0)));
				} else {
					return new BigDecimal(0);
				}
			});

			// 8月份累计预算
			CompletableFuture<BigDecimal> augAccBudget = CompletableFuture.supplyAsync(() -> {
				return NumberUtil.div(NumberUtil.add(entity.getStr("jar"), entity.getStr("feb"), entity.getStr("mar"), entity.getStr("apr"), entity.getStr("may"),
						entity.getStr("jun"), entity.getStr("jul"), entity.getStr("aug")), 1.06, 2);
			});

			// 8月份累计实际收入
			CompletableFuture<BigDecimal> augAccActual = CompletableFuture.supplyAsync(() -> {
				if (invoice != null) {
					return NumberUtil.add(invoice.get("jar", new BigDecimal(0)), invoice.get("feb", new BigDecimal(0)), invoice.get("mar", new BigDecimal(0)),
							invoice.get("apr", new BigDecimal(0)), invoice.get("may", new BigDecimal(0)), invoice.get("jun", new BigDecimal(0)),
							invoice.get("jul", new BigDecimal(0)), invoice.get("aug", new BigDecimal(0)));
				} else {
					return new BigDecimal(0);
				}
			});

			// 9月份累计预算
			CompletableFuture<BigDecimal> sepAccBudget = CompletableFuture.supplyAsync(() -> {
				return NumberUtil.div(NumberUtil.add(entity.getStr("jar"), entity.getStr("feb"), entity.getStr("mar"), entity.getStr("apr"), entity.getStr("may"),
						entity.getStr("jun"), entity.getStr("jul"), entity.getStr("aug"), entity.getStr("sep")), 1.06, 2);
			});

			// 9月份累计实际收入
			CompletableFuture<BigDecimal> sepAccActual = CompletableFuture.supplyAsync(() -> {
				if (invoice != null) {
					return NumberUtil.add(invoice.get("jar", new BigDecimal(0)), invoice.get("feb", new BigDecimal(0)), invoice.get("mar", new BigDecimal(0)),
							invoice.get("apr", new BigDecimal(0)), invoice.get("may", new BigDecimal(0)), invoice.get("jun", new BigDecimal(0)),
							invoice.get("jul", new BigDecimal(0)), invoice.get("aug", new BigDecimal(0)), invoice.get("sep", new BigDecimal(0)));
				} else {
					return new BigDecimal(0);
				}
			});

			// 10月份累计预算
			CompletableFuture<BigDecimal> octAccBudget = CompletableFuture.supplyAsync(() -> {
				return NumberUtil.div(NumberUtil.add(entity.getStr("jar"), entity.getStr("feb"), entity.getStr("mar"), entity.getStr("apr"), entity.getStr("may"),
						entity.getStr("jun"), entity.getStr("jul"), entity.getStr("aug"), entity.getStr("sep"), entity.getStr("oct")), 1.06, 2);
			});

			// 10月份累计实际收入
			CompletableFuture<BigDecimal> octAccActual = CompletableFuture.supplyAsync(() -> {
				if (invoice != null) {
					return NumberUtil.add(invoice.get("jar", new BigDecimal(0)), invoice.get("feb", new BigDecimal(0)), invoice.get("mar", new BigDecimal(0)),
							invoice.get("apr", new BigDecimal(0)), invoice.get("may", new BigDecimal(0)), invoice.get("jun", new BigDecimal(0)),
							invoice.get("jul", new BigDecimal(0)), invoice.get("aug", new BigDecimal(0)), invoice.get("sep", new BigDecimal(0)),
							invoice.get("oct", new BigDecimal(0)));
				} else {
					return new BigDecimal(0);
				}
			});

			// 11月份累计预算
			CompletableFuture<BigDecimal> novAccBudget = CompletableFuture.supplyAsync(() -> {
				return NumberUtil.div(NumberUtil.add(entity.getStr("jar"), entity.getStr("feb"), entity.getStr("mar"), entity.getStr("apr"), entity.getStr("may"),
						entity.getStr("jun"), entity.getStr("jul"), entity.getStr("aug"), entity.getStr("sep"), entity.getStr("oct"), entity.getStr("nov")), 1.06, 2);
			});

			// 11月份累计实际收入
			CompletableFuture<BigDecimal> novAccActual = CompletableFuture.supplyAsync(() -> {
				if (invoice != null) {
					return NumberUtil.add(invoice.get("jar", new BigDecimal(0)), invoice.get("feb", new BigDecimal(0)), invoice.get("mar", new BigDecimal(0)),
							invoice.get("apr", new BigDecimal(0)), invoice.get("may", new BigDecimal(0)), invoice.get("jun", new BigDecimal(0)),
							invoice.get("jul", new BigDecimal(0)), invoice.get("aug", new BigDecimal(0)), invoice.get("sep", new BigDecimal(0)),
							invoice.get("oct", new BigDecimal(0)), invoice.get("nov", new BigDecimal(0)));
				} else {
					return new BigDecimal(0);
				}
			});

			// 12月份累计预算
			CompletableFuture<BigDecimal> decAccBudget = CompletableFuture.supplyAsync(() -> {
				return NumberUtil.div(NumberUtil.add(entity.getStr("jar"), entity.getStr("feb"), entity.getStr("mar"), entity.getStr("apr"), entity.getStr("may"),
						entity.getStr("jun"), entity.getStr("jul"), entity.getStr("aug"), entity.getStr("sep"), entity.getStr("oct"), entity.getStr("nov"),
						entity.getStr("dec")), 1.06, 2);
			});

			// 12月份累计实际收入
			CompletableFuture<BigDecimal> decAccActual = CompletableFuture.supplyAsync(() -> {
				if (invoice != null) {
					return NumberUtil.add(invoice.get("jar", new BigDecimal(0)), invoice.get("feb", new BigDecimal(0)), invoice.get("mar", new BigDecimal(0)),
							invoice.get("apr", new BigDecimal(0)), invoice.get("may", new BigDecimal(0)), invoice.get("jun", new BigDecimal(0)),
							invoice.get("jul", new BigDecimal(0)), invoice.get("aug", new BigDecimal(0)), invoice.get("sep", new BigDecimal(0)),
							invoice.get("oct", new BigDecimal(0)), invoice.get("nov", new BigDecimal(0)), invoice.get("dec", new BigDecimal(0)));
				} else {
					return new BigDecimal(0);
				}
			});

			// 组合生成DataObject
			DataObject trackData = jarAccBudget.thenCombine(jarAccActual, new BiFunction<BigDecimal, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(BigDecimal jarAccBudget, BigDecimal jarAccActual) {
					DataObject trackData = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.TrackAnalyzeEntity");
					trackData.setBigDecimal("jarAccBudget", jarAccBudget);
					trackData.setBigDecimal("jarAccActual", jarAccActual);
					String jarCompletionRate = "";
					if (jarAccBudget.intValue() == 0) {
						jarCompletionRate = "—";
					} else {
						jarCompletionRate = NumberUtil.decimalFormat("#.##%", NumberUtil.div(jarAccActual, jarAccBudget, 2));
					}
					trackData.setString("jarCompletionRate", jarCompletionRate);
					return trackData;
				}
			}).thenCombine(febAccBudget, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal febAccBudget) {
					trackData.setBigDecimal("febAccBudget", febAccBudget);
					return trackData;
				}

			}).thenCombine(febAccActual, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal febAccActual) {
					trackData.setBigDecimal("febAccActual", febAccActual);
					BigDecimal febAccBudget = trackData.getBigDecimal("febAccBudget");
					String febCompletionRate = "";
					if (febAccBudget.intValue() == 0) {
						febCompletionRate = "—";
					} else {
						febCompletionRate = NumberUtil.decimalFormat("#.##%", NumberUtil.div(febAccActual, febAccBudget, 2));
					}
					trackData.setString("febCompletionRate", febCompletionRate);
					return trackData;
				}

			}).thenCombine(marAccBudget, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal marAccBudget) {
					trackData.setBigDecimal("marAccBudget", marAccBudget);
					return trackData;
				}

			}).thenCombine(marAccActual, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal marAccActual) {
					trackData.setBigDecimal("marAccActual", marAccActual);
					BigDecimal marAccBudget = trackData.getBigDecimal("marAccBudget");
					String marCompletionRate = "";
					if (marAccBudget.intValue() == 0) {
						marCompletionRate = "—";
					} else {
						marCompletionRate = NumberUtil.decimalFormat("#.##%", NumberUtil.div(marAccActual, marAccBudget, 2));
					}
					trackData.setString("marCompletionRate", marCompletionRate);
					return trackData;
				}

			}).thenCombine(aprAccBudget, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal aprAccBudget) {
					trackData.setBigDecimal("aprAccBudget", aprAccBudget);
					return trackData;
				}

			}).thenCombine(aprAccActual, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal aprAccActual) {
					trackData.setBigDecimal("aprAccActual", aprAccActual);
					BigDecimal aprAccBudget = trackData.getBigDecimal("aprAccBudget");
					String aprCompletionRate = "";
					if (aprAccBudget.intValue() == 0) {
						aprCompletionRate = "—";
					} else {
						aprCompletionRate = NumberUtil.decimalFormat("#.##%", NumberUtil.div(aprAccActual, aprAccBudget, 2));
					}
					trackData.setString("aprCompletionRate", aprCompletionRate);
					return trackData;
				}

			}).thenCombine(mayAccBudget, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal mayAccBudget) {
					trackData.setBigDecimal("mayAccBudget", mayAccBudget);
					return trackData;
				}

			}).thenCombine(mayAccActual, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal mayAccActual) {
					trackData.setBigDecimal("mayAccActual", mayAccActual);
					BigDecimal mayAccBudget = trackData.getBigDecimal("mayAccBudget");
					String mayCompletionRate = "";
					if (mayAccBudget.intValue() == 0) {
						mayCompletionRate = "—";
					} else {
						mayCompletionRate = NumberUtil.decimalFormat("#.##%", NumberUtil.div(mayAccActual, mayAccBudget, 2));
					}
					trackData.setString("mayCompletionRate", mayCompletionRate);
					return trackData;
				}

			}).thenCombine(junAccBudget, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal junAccBudget) {
					trackData.setBigDecimal("junAccBudget", junAccBudget);
					return trackData;
				}

			}).thenCombine(junAccActual, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal junAccActual) {
					trackData.setBigDecimal("junAccActual", junAccActual);
					BigDecimal junAccBudget = trackData.getBigDecimal("junAccBudget");
					String junCompletionRate = "";
					if (junAccBudget.intValue() == 0) {
						junCompletionRate = "—";
					} else {
						junCompletionRate = NumberUtil.decimalFormat("#.##%", NumberUtil.div(junAccActual, junAccBudget, 2));
					}
					trackData.setString("junCompletionRate", junCompletionRate);
					return trackData;
				}

			}).thenCombine(julAccBudget, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal julAccBudget) {
					trackData.setBigDecimal("julAccBudget", julAccBudget);
					return trackData;
				}

			}).thenCombine(julAccActual, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal julAccActual) {
					trackData.setBigDecimal("julAccActual", julAccActual);
					BigDecimal julAccBudget = trackData.getBigDecimal("julAccBudget");
					String julCompletionRate = "";
					if (julAccBudget.intValue() == 0) {
						julCompletionRate = "—";
					} else {
						julCompletionRate = NumberUtil.decimalFormat("#.##%", NumberUtil.div(julAccActual, julAccBudget, 2));
					}
					trackData.setString("julCompletionRate", julCompletionRate);
					return trackData;
				}

			}).thenCombine(augAccBudget, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal augAccBudget) {
					trackData.setBigDecimal("augAccBudget", augAccBudget);
					return trackData;
				}

			}).thenCombine(augAccActual, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal augAccActual) {
					trackData.setBigDecimal("augAccActual", augAccActual);
					BigDecimal augAccBudget = trackData.getBigDecimal("augAccBudget");
					String augCompletionRate = "";
					if (augAccBudget.intValue() == 0) {
						augCompletionRate = "—";
					} else {
						augCompletionRate = NumberUtil.decimalFormat("#.##%", NumberUtil.div(augAccActual, augAccBudget, 2));
					}
					trackData.setString("augCompletionRate", augCompletionRate);
					return trackData;
				}

			}).thenCombine(sepAccBudget, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal sepAccBudget) {
					trackData.setBigDecimal("sepAccBudget", sepAccBudget);
					return trackData;
				}

			}).thenCombine(sepAccActual, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal sepAccActual) {
					trackData.setBigDecimal("sepAccActual", sepAccActual);
					BigDecimal sepAccBudget = trackData.getBigDecimal("sepAccBudget");
					String sepCompletionRate = "";
					if (sepAccBudget.intValue() == 0) {
						sepCompletionRate = "—";
					} else {
						sepCompletionRate = NumberUtil.decimalFormat("#.##%", NumberUtil.div(sepAccActual, sepAccBudget, 2));
					}
					trackData.setString("sepCompletionRate", sepCompletionRate);
					return trackData;
				}

			}).thenCombine(octAccBudget, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal octAccBudget) {
					trackData.setBigDecimal("octAccBudget", octAccBudget);
					return trackData;
				}

			}).thenCombine(octAccActual, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal octAccActual) {
					trackData.setBigDecimal("octAccActual", octAccActual);
					BigDecimal octAccBudget = trackData.getBigDecimal("octAccBudget");
					String octCompletionRate = "";
					if (octAccBudget.intValue() == 0) {
						octCompletionRate = "—";
					} else {
						octCompletionRate = NumberUtil.decimalFormat("#.##%", NumberUtil.div(octAccActual, octAccBudget, 2));
					}
					trackData.setString("octCompletionRate", octCompletionRate);
					return trackData;
				}

			}).thenCombine(novAccBudget, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal novAccBudget) {
					trackData.setBigDecimal("novAccBudget", novAccBudget);
					return trackData;
				}

			}).thenCombine(novAccActual, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal novAccActual) {
					trackData.setBigDecimal("novAccActual", novAccActual);
					BigDecimal novAccBudget = trackData.getBigDecimal("novAccBudget");
					String novCompletionRate = "";
					if (novAccBudget.intValue() == 0) {
						novCompletionRate = "—";
					} else {
						novCompletionRate = NumberUtil.decimalFormat("#.##%", NumberUtil.div(novAccActual, novAccBudget, 2));
					}
					trackData.setString("novCompletionRate", novCompletionRate);
					return trackData;
				}

			}).thenCombine(decAccBudget, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal decAccBudget) {
					trackData.setBigDecimal("decAccBudget", decAccBudget);
					return trackData;
				}

			}).thenCombine(decAccActual, new BiFunction<DataObject, BigDecimal, DataObject>() {

				@Override
				public DataObject apply(DataObject trackData, BigDecimal decAccActual) {
					trackData.setBigDecimal("decAccActual", decAccActual);
					BigDecimal decAccBudget = trackData.getBigDecimal("decAccBudget");
					String decCompletionRate = "";
					if (decAccBudget.intValue() == 0) {
						decCompletionRate = "—";
					} else {
						decCompletionRate = NumberUtil.decimalFormat("#.##%", NumberUtil.div(decAccActual, decAccBudget, 2));
					}
					trackData.setString("decCompletionRate", decCompletionRate);
					return trackData;
				}

			}).join();

			trackData.setString("secOrgId", secOrgId);
			trackData.setString("secOrgName", entity.getStr("secOrgName"));
			trackDatas.add(trackData);
		});

		List<String> customSort = Arrays.asList("核资源咨询中心", "核动力咨询中心", "系统工程咨询中心", "产业发展研究中心", "核化工咨询中心", "安全质量部（质量信息支持中心）", "工业安全支持中心", "企业发展部（采购管理支持中心）", "设备监理与检测中心", "河北分公司", "天津分公司",
				"福建分公司", "四川分公司", "西北分公司", "海南分公司");

		List<DataObject> newTrackDatas = ListUtil.sort(trackDatas, (t1, t2) -> {
			int t1Index = customSort.indexOf(t1.getString("secOrgName"));
			t1Index = t1Index == -1 ? Integer.MAX_VALUE : t1Index;
			int t2Index = customSort.indexOf(t2.getString("secOrgName"));
			t2Index = t2Index == -1 ? Integer.MAX_VALUE : t2Index;
			return t1Index - t2Index;
		});

		DataObject trackData = DataObjectUtil.createDataObject("com.zhonghe.ame.annualPlan.annualPlan.TrackAnalyzeEntity");
		trackData.setString("secOrgId", "1");
		trackData.setString("secOrgName", "合计");

		newTrackDatas.forEach(dataObject -> {
			trackData.setBigDecimal("jarAccBudget", NumberUtil.add(trackData.getBigDecimal("jarAccBudget"), dataObject.getBigDecimal("jarAccBudget")));
			trackData.setBigDecimal("jarAccActual", NumberUtil.add(trackData.getBigDecimal("jarAccActual"), dataObject.getBigDecimal("jarAccActual")));
			trackData.setBigDecimal("febAccBudget", NumberUtil.add(trackData.getBigDecimal("febAccBudget"), dataObject.getBigDecimal("febAccBudget")));
			trackData.setBigDecimal("febAccActual", NumberUtil.add(trackData.getBigDecimal("febAccActual"), dataObject.getBigDecimal("febAccActual")));
			trackData.setBigDecimal("marAccBudget", NumberUtil.add(trackData.getBigDecimal("marAccBudget"), dataObject.getBigDecimal("marAccBudget")));
			trackData.setBigDecimal("marAccActual", NumberUtil.add(trackData.getBigDecimal("marAccActual"), dataObject.getBigDecimal("marAccActual")));
			trackData.setBigDecimal("aprAccBudget", NumberUtil.add(trackData.getBigDecimal("aprAccBudget"), dataObject.getBigDecimal("aprAccBudget")));
			trackData.setBigDecimal("aprAccActual", NumberUtil.add(trackData.getBigDecimal("aprAccActual"), dataObject.getBigDecimal("aprAccActual")));
			trackData.setBigDecimal("mayAccBudget", NumberUtil.add(trackData.getBigDecimal("mayAccBudget"), dataObject.getBigDecimal("mayAccBudget")));
			trackData.setBigDecimal("mayAccActual", NumberUtil.add(trackData.getBigDecimal("mayAccActual"), dataObject.getBigDecimal("mayAccActual")));
			trackData.setBigDecimal("junAccBudget", NumberUtil.add(trackData.getBigDecimal("junAccBudget"), dataObject.getBigDecimal("junAccBudget")));
			trackData.setBigDecimal("junAccActual", NumberUtil.add(trackData.getBigDecimal("junAccActual"), dataObject.getBigDecimal("junAccActual")));
			trackData.setBigDecimal("julAccBudget", NumberUtil.add(trackData.getBigDecimal("julAccBudget"), dataObject.getBigDecimal("julAccBudget")));
			trackData.setBigDecimal("julAccActual", NumberUtil.add(trackData.getBigDecimal("julAccActual"), dataObject.getBigDecimal("julAccActual")));
			trackData.setBigDecimal("augAccBudget", NumberUtil.add(trackData.getBigDecimal("augAccBudget"), dataObject.getBigDecimal("augAccBudget")));
			trackData.setBigDecimal("augAccActual", NumberUtil.add(trackData.getBigDecimal("augAccActual"), dataObject.getBigDecimal("augAccActual")));
			trackData.setBigDecimal("sepAccBudget", NumberUtil.add(trackData.getBigDecimal("sepAccBudget"), dataObject.getBigDecimal("sepAccBudget")));
			trackData.setBigDecimal("sepAccActual", NumberUtil.add(trackData.getBigDecimal("sepAccActual"), dataObject.getBigDecimal("sepAccActual")));
			trackData.setBigDecimal("octAccBudget", NumberUtil.add(trackData.getBigDecimal("octAccBudget"), dataObject.getBigDecimal("octAccBudget")));
			trackData.setBigDecimal("octAccActual", NumberUtil.add(trackData.getBigDecimal("octAccActual"), dataObject.getBigDecimal("octAccActual")));
			trackData.setBigDecimal("novAccBudget", NumberUtil.add(trackData.getBigDecimal("novAccBudget"), dataObject.getBigDecimal("novAccBudget")));
			trackData.setBigDecimal("novAccActual", NumberUtil.add(trackData.getBigDecimal("novAccActual"), dataObject.getBigDecimal("novAccActual")));
			trackData.setBigDecimal("decAccBudget", NumberUtil.add(trackData.getBigDecimal("decAccBudget"), dataObject.getBigDecimal("decAccBudget")));
			trackData.setBigDecimal("decAccActual", NumberUtil.add(trackData.getBigDecimal("decAccActual"), dataObject.getBigDecimal("decAccActual")));
		});

		trackData.setString("jarCompletionRate", NumberUtil.decimalFormat("#.##%", NumberUtil.div(trackData.getBigDecimal("jarAccActual"), trackData.getBigDecimal("jarAccBudget"), 2)));
		trackData.setString("febCompletionRate", NumberUtil.decimalFormat("#.##%", NumberUtil.div(trackData.getBigDecimal("febAccActual"), trackData.getBigDecimal("febAccBudget"), 2)));
		trackData.setString("marCompletionRate", NumberUtil.decimalFormat("#.##%", NumberUtil.div(trackData.getBigDecimal("marAccActual"), trackData.getBigDecimal("marAccBudget"), 2)));
		trackData.setString("aprCompletionRate", NumberUtil.decimalFormat("#.##%", NumberUtil.div(trackData.getBigDecimal("aprAccActual"), trackData.getBigDecimal("aprAccBudget"), 2)));
		trackData.setString("mayCompletionRate", NumberUtil.decimalFormat("#.##%", NumberUtil.div(trackData.getBigDecimal("mayAccActual"), trackData.getBigDecimal("mayAccBudget"), 2)));
		trackData.setString("junCompletionRate", NumberUtil.decimalFormat("#.##%", NumberUtil.div(trackData.getBigDecimal("junAccActual"), trackData.getBigDecimal("junAccBudget"), 2)));
		trackData.setString("julCompletionRate", NumberUtil.decimalFormat("#.##%", NumberUtil.div(trackData.getBigDecimal("julAccActual"), trackData.getBigDecimal("julAccBudget"), 2)));
		trackData.setString("augCompletionRate", NumberUtil.decimalFormat("#.##%", NumberUtil.div(trackData.getBigDecimal("augAccActual"), trackData.getBigDecimal("augAccBudget"), 2)));
		trackData.setString("sepCompletionRate", NumberUtil.decimalFormat("#.##%", NumberUtil.div(trackData.getBigDecimal("sepAccActual"), trackData.getBigDecimal("sepAccBudget"), 2)));
		trackData.setString("octCompletionRate", NumberUtil.decimalFormat("#.##%", NumberUtil.div(trackData.getBigDecimal("octAccActual"), trackData.getBigDecimal("octAccBudget"), 2)));
		trackData.setString("novCompletionRate", NumberUtil.decimalFormat("#.##%", NumberUtil.div(trackData.getBigDecimal("novAccActual"), trackData.getBigDecimal("novAccBudget"), 2)));
		trackData.setString("decCompletionRate", NumberUtil.decimalFormat("#.##%", NumberUtil.div(trackData.getBigDecimal("decAccActual"), trackData.getBigDecimal("decAccBudget"), 2)));

		newTrackDatas.add(trackData);

		return newTrackDatas;
	}

}
