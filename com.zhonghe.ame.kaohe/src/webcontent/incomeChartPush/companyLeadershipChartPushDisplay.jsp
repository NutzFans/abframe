<%@page pageEncoding="UTF-8"%>
<%@include file="/purchase/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>公司生产经营情况统计</title>
<script src="../../common/echarts/echarts.min.js"></script>
<script src="../../common/d3/d3.v7.min.js"></script>
<script src="js/D3ComboChart.js"></script>
<meta name="viewport" content="width=1920, initial-scale=0.1, user-scalable=yes">
<link rel="stylesheet" href="../../common/layui-v2.11.4/css/layui.css" media="all">
<link rel="stylesheet" href="css/company.css?v=1.1" media="all">
<link rel="stylesheet" href="css/utils.css" media="all">
</head>
<body class="page-no-scroll">

	<!-- 小球样式 -->
	<div class="page-loading">
		<div class="ball-loader">
			<span></span>
			<span></span>
			<span></span>
			<span></span>
		</div>
	</div>

	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div>
				<div class="layui-row">
					<div class="layui-col-md2">
						<div style="padding-left: 10px; padding-top: 18px">
							<img src="../../ame/clipview/assets/images/amelogo.png" height="40px" width="220px">
						</div>
					</div>
					<div class="layui-col-md10" style="margin-left: -35px; padding-top: 9px; line-height: 60px; font-size: 30px; font-weight: bold; color: #fff;">经营管理系统</div>
				</div>
			</div>
		</div>
	</div>
	<div class="layui-fluid">
		<div class="layui-row">
			<div class="layui-col-md12">
				<div class="line-container">
					<!-- 左侧文字 -->
					<div class="left-text">公司生产经营情况统计</div>
					<!-- 右侧文字 -->
					<div id="statisticalPeriod" class="right-text"></div>
					<!-- 横线 -->
					<div class="line"></div>
					<!-- 中间文字 -->
					<span class="center-text">公司层面（账面口径）</span>
				</div>
			</div>
		</div>

		<!-- 统计数据 -->
		<div class="layui-row layui-col-space20">
			<div class="layui-col-md3">
				<div class="layui-card">
					<div class="layui-card-header">
						<span class="header-text">月末手持合同额（万元）</span>
					</div>
					<div class="layui-card-body" style="padding: 5px">
						<div class="layui-row">
							<div class="layui-col-md6">
								<div class="data-item">
									<div class="data-title">全部</div>
									<div>
										<span id="contractAmountHeldAtTheEndOfTheMonth" class="data-value"></span>
									</div>
								</div>
							</div>
							<div class="middle-divider"></div>
							<div class="layui-col-md6">
								<div class="data-item">
									<div class="data-title">集团外</div>
									<div>
										<span id="endOfMonthContractAmountHeldOutsideTheGroup" class="data-value"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-md3">
				<div class="layui-card">
					<div class="layui-card-header">
						<span class="header-text">本年新签合同额（万元）</span>
					</div>
					<div class="layui-card-body" style="padding: 5px">
						<div class="layui-row">
							<div class="layui-col-md6">
								<div class="data-item-compare">
									<div class="data-title">全部</div>
									<div>
										<span id="newContractAmountSignedThisYear" class="data-value"></span>
									</div>
								</div>
								<div class="compare-item">
									<div id="bnxqhtetb" class="compare-up-value">
										<span>同比</span>
										<i id="bnxqhtetbIcon" class="layui-edge layui-edge-top"></i>
										<span id="bnxqhtetbVal" class="compare-value"></span>
									</div>
								</div>
							</div>
							<div class="middle-divider"></div>
							<div class="layui-col-md6">
								<div class="data-item-compare">
									<div class="data-title">集团外</div>
									<div>
										<span id="newContractAmountSignedThisYearOutsideTheGroup" class="data-value"></span>
									</div>
								</div>
								<div class="compare-item">
									<div id="bnxqhtetbJtw" class="compare-down-value">
										<span>同比</span>
										<i id="bnxqhtetbJtwIcon" class="layui-edge layui-edge-bottom"></i>
										<span id="bnxqhtetbJtwVal" class="compare-value"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-md3">
				<div class="layui-card">
					<div class="layui-card-header">
						<span class="header-text">本年营业收入（万元）</span>
					</div>
					<div class="layui-card-body" style="padding: 5px">
						<div class="layui-row">
							<div class="layui-col-md6">
								<div class="data-item-compare">
									<div class="data-title">全部</div>
									<div>
										<span id="operatingRevenueForThisYear" class="data-value"></span>
									</div>
								</div>
								<div class="compare-item">
									<div id="bnyysrtb" class="compare-up-value">
										<span>同比</span>
										<i id="bnyysrtbIcon" class="layui-edge layui-edge-top"></i>
										<span id="bnyysrtbVal" class="compare-value"></span>
									</div>
								</div>
							</div>
							<div class="middle-divider"></div>
							<div class="layui-col-md6">
								<div class="data-item-compare">
									<div class="data-title">集团外</div>
									<div>
										<span id="thisYearsOperatingRevenueOutsideTheGroup" class="data-value"></span>
									</div>
								</div>
								<div class="compare-item">
									<div id="bnyysrtbJtw" class="compare-down-value">
										<span>同比</span>
										<i id="bnyysrtbJtwIcon" class="layui-edge layui-edge-bottom"></i>
										<span id="bnyysrtbJtwVal" class="compare-value"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="layui-col-md3">
				<div class="layui-card">
					<div class="layui-card-header">
						<span class="header-text">本年项目承揽率</span>
					</div>
					<div class="layui-card-body" style="padding: 5px">
						<div class="layui-row">
							<div class="layui-col-md6">
								<div class="data-item">
									<div class="data-title">全部</div>
									<div>
										<span id="projectAcceptanceRate" class="data-value"></span>
									</div>
								</div>
							</div>
							<div class="middle-divider"></div>
							<div class="layui-col-md6">
								<div class="data-item">
									<div class="data-title">集团外</div>
									<div>
										<span id="projectAcceptanceRateOutsideTheGroup" class="data-value"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="layui-row layui-col-space20">
			<div class="layui-col-md6">
				<div class="layui-card">
					<div class="layui-card-header" style="display: flex; justify-content: space-between; align-items: center;">
						<span class="header-text">本年新签合同额TOP5（万元）</span>
						<div class="layui-form">
							<!-- 选项卡风格单选框 -->
							<input type="radio" name="xqhtphTab" value="0" lay-skin="none" lay-filter="xqhtphTab" checked>
							<div lay-radio class="tab-radio">
								<span>全部</span>
							</div>
							<input type="radio" name="xqhtphTab" value="1" lay-skin="none" lay-filter="xqhtphTab">
							<div lay-radio class="tab-radio">
								<span>集团外</span>
							</div>
						</div>
					</div>
					<div class="layui-card-body" style="padding: 5px">
						<table id="xqhtphGrid" class="layui-hide"></table>
					</div>
				</div>
			</div>
			<div class="layui-col-md6">
				<div class="layui-card">
					<div class="layui-card-header" style="display: flex; justify-content: space-between; align-items: center;">
						<span class="header-text">本年合同履约收入TOP5（万元）</span>
						<div class="layui-form">
							<!-- 选项卡风格单选框 -->
							<input type="radio" name="htlyphTab" value="0" lay-skin="none" lay-filter="htlyphTab" checked>
							<div lay-radio class="tab-radio">
								<span>全部</span>
							</div>
							<input type="radio" name="htlyphTab" value="1" lay-skin="none" lay-filter="htlyphTab">
							<div lay-radio class="tab-radio">
								<span>集团外</span>
							</div>
						</div>
					</div>
					<div class="layui-card-body" style="padding: 5px">
						<table id="htlyphGrid" class="layui-hide"></table>
					</div>
				</div>
			</div>
		</div>

		<div class="layui-row layui-col-space20">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-header" style="display: flex; justify-content: space-between; align-items: center;">
						<span class="header-text">营业收入全年趋势预测（账面）</span>
						<div class="layui-form">
							<!-- 选项卡风格单选框 -->
							<input type="radio" name="yysrqnqsycTab" value="0" lay-skin="none" lay-filter="yysrqnqsycTab" checked>
							<div lay-radio class="tab-radio">
								<span>全部</span>
							</div>
							<input type="radio" name="yysrqnqsycTab" value="1" lay-skin="none" lay-filter="yysrqnqsycTab">
							<div lay-radio class="tab-radio">
								<span>咨询</span>
							</div>
							<input type="radio" name="yysrqnqsycTab" value="6" lay-skin="none" lay-filter="yysrqnqsycTab">
							<div lay-radio class="tab-radio">
								<span>监理</span>
							</div>
							<input type="radio" name="yysrqnqsycTab" value="7" lay-skin="none" lay-filter="yysrqnqsycTab">
							<div lay-radio class="tab-radio">
								<span>设备监理</span>
							</div>
							<input type="radio" name="yysrqnqsycTab" value="12" lay-skin="none" lay-filter="yysrqnqsycTab">
							<div lay-radio class="tab-radio">
								<span>工程检测</span>
							</div>
						</div>
					</div>
					<div class="layui-card-body" style="padding: 5px">
						<div id="yysrqnqsycChart" style="width: 100%; height: 400px"></div>
					</div>
				</div>
			</div>
		</div>

		<div class="layui-row">
			<div class="layui-col-md12">
				<div class="line-container">
					<!-- 横线 -->
					<div class="line"></div>
					<!-- 中间文字 -->
					<span class="center-text">内部各单位层面（考核口径）</span>
				</div>
			</div>
		</div>

		<div class="layui-row layui-col-space20">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-header" style="display: flex; justify-content: space-between; align-items: center;">
						<span class="header-text">营业收入（考核口径）</span>
						<div class="layui-form">
							<!-- 选项卡风格单选框 -->
							<input type="radio" name="yysrkhkjTab" value="0" lay-skin="none" lay-filter="yysrkhkjTab" checked>
							<div lay-radio class="tab-radio">
								<span>全部</span>
							</div>
							<input type="radio" name="yysrkhkjTab" value="1" lay-skin="none" lay-filter="yysrkhkjTab">
							<div lay-radio class="tab-radio">
								<span>集团外</span>
							</div>
						</div>
					</div>
					<div class="layui-card-body" style="padding: 5px">
						<div class="layui-row">
							<div class="layui-col-md9">
								<div class="layui-row">
									<div id="yysrkhkjChartByYwzx" style="width: 100%; height: 400px"></div>
								</div>
								<hr style="margin-top: 10px; margin-bottom: 25px">
								<div class="layui-row">
									<div id="yysrkhkjChartByQt" style="width: 100%; height: 400px"></div>
								</div>
							</div>
							<div class="layui-col-md3">
								<div class="layui-tabs layui-tabs-card">
									<ul class="layui-tabs-header layui-bg-tint">
										<li class="layui-this">当月完成值排行</li>
										<li>累计完成值排行</li>
										<li>累计完成率排行</li>
									</ul>
									<div class="layui-tabs-body">
										<div class="layui-tabs-item layui-show">
											<table id="ywzxCompletionValueGrid" class="layui-hide"></table>
											<div style="margin-top: 20px"></div>
											<table id="qtCompletionValueGrid" class="layui-hide"></table>
										</div>
										<div class="layui-tabs-item">
											<table id="ywzxCompletionValueLJGrid" class="layui-hide"></table>
											<div style="margin-top: 20px"></div>
											<table id="qtCompletionValueLJGrid" class="layui-hide"></table>
										</div>
										<div class="layui-tabs-item">
											<table id="ywzxCompletionRateGrid" class="layui-hide"></table>
											<div style="margin-top: 20px"></div>
											<table id="qtCompletionRateGrid" class="layui-hide"></table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="layui-row layui-col-space20">
			<div class="layui-col-md7">
				<div class="layui-card">
					<div class="layui-card-header" style="display: flex; justify-content: space-between; align-items: center;">
						<span class="header-text">全年收入分解&风险分析（考核口径）</span>
						<div class="layui-form" lay-filter="qnsrfjForm">
							<div style="display: inline-block; vertical-align: middle;">
								<select id="selSecOrg" name="selSecOrg" lay-filter="selSecOrg"></select>
							</div>
							<!-- 选项卡风格单选框 -->
							<input type="radio" name="qnsrfjTab" value="0" lay-skin="none" lay-filter="qnsrfjTab" checked>
							<div lay-radio class="tab-radio">
								<span>全部</span>
							</div>
							<input type="radio" name="qnsrfjTab" value="1" lay-skin="none" lay-filter="qnsrfjTab">
							<div lay-radio class="tab-radio">
								<span>集团外</span>
							</div>
						</div>
					</div>
					<div class="layui-card-body" style="padding: 5px">
						<div id="qnsrfjChart" style="width: 100%; height: 700px"></div>
					</div>
				</div>
			</div>
			<div class="layui-col-md5">
				<div class="layui-card">
					<div class="layui-card-header" style="display: flex; justify-content: space-between; align-items: center;">
						<span class="header-text">缺口预警（考核口径）</span>
						<div class="layui-form">
							<!-- 选项卡风格单选框 -->
							<input type="radio" name="qkyjTab" value="0" lay-skin="none" lay-filter="qkyjTab" checked>
							<div lay-radio class="tab-radio">
								<span>全部</span>
							</div>
							<input type="radio" name="qkyjTab" value="1" lay-skin="none" lay-filter="qkyjTab">
							<div lay-radio class="tab-radio">
								<span>集团外</span>
							</div>
						</div>
					</div>
					<div class="layui-card-body" style="padding: 5px">
						<div id="qkyjChart" style="width: 100%; height: 700px"></div>
					</div>
				</div>
			</div>
		</div>

		<div class="layui-row layui-col-space20">
			<div class="layui-col-md9">
				<div class="layui-card">
					<div class="layui-card-header" style="display: flex; justify-content: space-between; align-items: center;">
						<span class="header-text">回款&应收账款（万元）</span>
						<div class="layui-form">
							<input type="radio" name="yszkTab" value="0" lay-skin="none" lay-filter="yszkTab" checked>
							<div lay-radio class="tab-radio">
								<span>全部</span>
							</div>
							<input type="radio" name="yszkTab" value="1" lay-skin="none" lay-filter="yszkTab">
							<div lay-radio class="tab-radio">
								<span>集团外</span>
							</div>
						</div>
					</div>
					<div class="layui-card-body" style="padding: 5px">
						<div class="layui-row">
							<div class="layui-col-md8">
								<div class="layui-row">
									<div id="yszkChartByYwzx" style="width: 100%; height: 400px"></div>
								</div>
								<div class="layui-row">
									<div id="yszkChartByQt" style="width: 100%; height: 400px"></div>
								</div>
							</div>
							<div class="layui-col-md4">
								<div class="layui-row">
									<div id="yszkChartByZb" style="width: 100%; height: 800px"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="layui-col-md3">
				<div class="layui-card">
					<div class="layui-card-header" style="display: flex; justify-content: space-between; align-items: center;">
						<span class="header-text">新签合同额排行（万元）</span>
						<div class="layui-form">
							<!-- 选项卡风格单选框 -->
							<input type="radio" name="dwxqhteTab" value="0" lay-skin="none" lay-filter="dwxqhteTab" checked>
							<div lay-radio class="tab-radio">
								<span>全部</span>
							</div>
							<input type="radio" name="dwxqhteTab" value="1" lay-skin="none" lay-filter="dwxqhteTab">
							<div lay-radio class="tab-radio">
								<span>集团外</span>
							</div>
						</div>
					</div>
					<div class="layui-card-body" style="padding: 5px; height: 800px">
						<div class="layui-row">
							<div class="layui-tabs layui-tabs-card">
								<ul class="layui-tabs-header layui-bg-tint">
									<li class="layui-this" lay-on="dyxqhteTab">当月新签合同额</li>
									<li lay-on="bnljxqhteTab">本年累计新签合同额</li>
								</ul>
								<div class="layui-tabs-body">
									<div class="layui-tabs-item layui-show">
										<table id="ywzxThisMonthGrid" class="layui-hide"></table>
										<div style="margin-top: 20px"></div>
										<table id="qtThisMonthGrid" class="layui-hide"></table>
									</div>
									<div class="layui-tabs-item">
										<table id="ywzxCumulativeMonthGrid" class="layui-hide"></table>
										<div style="margin-top: 20px"></div>
										<table id="qtCumulativeMonthGrid" class="layui-hide"></table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="layui-row layui-col-space20">
			<div class="layui-col-md12">
				<div class="layui-card">
					<div class="layui-card-header" style="display: flex; justify-content: space-between; align-items: center;">
						<span class="header-text">开发中</span>
					</div>
					<div class="layui-card-body" style="padding: 5px; height: 50px; display: flex; align-items: center; justify-content: center;">
						<span>功能持续开发完善中...</span>
					</div>
				</div>
			</div>
		</div>


		<div id="completeTodoBtn" class="layui-row layui-col-space15 layui-hide">
			<div class="layui-col-md12" style="display: flex; align-items: center; justify-content: center;"">
				<button class="layui-btn" style="background-color: #3578f7; font-size: 16px;" lay-on="toBeCompleted">已阅 - 点击该按钮完成待办</button>
			</div>
			<div class="layui-col-md12" style="display: flex; align-items: center; justify-content: center;"">
				<span>（后续可在OA - 已办 或 经营管理系统 - 考核管理模块 查看）</span>
			</div>
		</div>

	</div>

	<script src="../../common/layui-v2.11.4/layui.js"></script>
	<script src="js/main.js"></script>

	<script>
		layui.use([ 'element', 'utils', 'form', 'table', 'util', 'layer' ], function() {
			var $ = layui.jquery;
			var element = layui.element;
			var utils = layui.utils;
			var layUtil = layui.util;
			var form = layui.form;
			var table = layui.table;
			var layer = layui.layer;
			var tabs = layui.tabs;

			var reqId = '<%=request.getParameter("id")%>';
			var userId = '<%=request.getParameter("userId")%>';
			var year, month;
			var xqhtphGrid, htlyphGrid;
			var ywzxCompletionValueGrid, qtCompletionValueGrid, ywzxCompletionValueLJGrid, qtCompletionValueLJGrid, ywzxCompletionRateGrid, qtCompletionRateGrid;
			var ywzxThisMonthGrid, qtThisMonthGrid, ywzxCumulativeMonthGrid, qtCumulativeMonthGrid;

			var chartDom = document.getElementById('yysrqnqsycChart');
			var renderChart = echarts.init(chartDom);
			
			var yysrkhkjChartByYwzxDom = document.getElementById('yysrkhkjChartByYwzx');
			var yysrkhkjChartByYwzx = echarts.init(yysrkhkjChartByYwzxDom);
			
			var yysrkhkjChartByQtDom = document.getElementById('yysrkhkjChartByQt');
			var yysrkhkjChartByQt = echarts.init(yysrkhkjChartByQtDom);
			
			var qnsrfjChartDom = document.getElementById('qnsrfjChart');
			var qnsrfjChart = echarts.init(qnsrfjChartDom);	
			
			var qkyjChartDom = document.getElementById('qkyjChart');
			var qkyjChart = echarts.init(qkyjChartDom);
			
			var yszkChartByYwzxDom = document.getElementById('yszkChartByYwzx');
			var yszkChartByYwzx = new D3ComboChart(yszkChartByYwzxDom);
			
			var yszkChartByQtDom = document.getElementById('yszkChartByQt');
			var yszkChartByQt = new D3ComboChart(yszkChartByQtDom);
			
			var yszkChartByZbDom = document.getElementById('yszkChartByZb');
			var yszkChartByZb = echarts.init(yszkChartByZbDom);						

			getData();

			function getData() {
				$.ajax({
					url : "com.zhonghe.ame.kaohe.incomeChartPush.getCompanyChartById.biz.ext",
					data : {
						"id" : reqId
					},
					async: false,
					type : "POST",
					dataType : "json",
					success : function(data) {
						var result = data.result;
						year = result.years;
						month = result.months;
						$('#statisticalPeriod').text('统计期：' + result.years + '年1 - ' + result.months + '月');
						$('#contractAmountHeldAtTheEndOfTheMonth').text(result.contractAmountHeldAtTheEndOfTheMonth);
						$('#endOfMonthContractAmountHeldOutsideTheGroup').text(result.endOfMonthContractAmountHeldOutsideTheGroup);
						$('#newContractAmountSignedThisYear').text(result.newContractAmountSignedThisYear);
						$('#newContractAmountSignedThisYearOutsideTheGroup').text(result.newContractAmountSignedThisYearOutsideTheGroup);
						var newContractAmountSignedThisYearComparedToTheSamePeriodLastYear = result.newContractAmountSignedThisYearComparedToTheSamePeriodLastYear;
						if (isNegative(newContractAmountSignedThisYearComparedToTheSamePeriodLastYear)) {
							$("#bnxqhtetb").attr("class", "compare-down-value");
							$("#bnxqhtetbIcon").attr("class", "layui-edge layui-edge-bottom");
							$("#bnxqhtetbVal").text(toPositivePercentage(newContractAmountSignedThisYearComparedToTheSamePeriodLastYear));
						} else {
							$("#bnxqhtetb").attr("class", "compare-up-value");
							$("#bnxqhtetbIcon").attr("class", "layui-edge layui-edge-top");
							$("#bnxqhtetbVal").text(toPositivePercentage(newContractAmountSignedThisYearComparedToTheSamePeriodLastYear));
						}
						var newContractAmountSignedThisYearComparedToTheSamePeriodLastYearOutsideTheGroup = result.newContractAmountSignedThisYearComparedToTheSamePeriodLastYearOutsideTheGroup;
						if (isNegative(newContractAmountSignedThisYearComparedToTheSamePeriodLastYearOutsideTheGroup)) {
							$("#bnxqhtetbJtw").attr("class", "compare-down-value");
							$("#bnxqhtetbJtwIcon").attr("class", "layui-edge layui-edge-bottom");
							$("#bnxqhtetbJtwVal").text(toPositivePercentage(newContractAmountSignedThisYearComparedToTheSamePeriodLastYearOutsideTheGroup));
						} else {
							$("#bnxqhtetbJtw").attr("class", "compare-up-value");
							$("#bnxqhtetbJtwIcon").attr("class", "layui-edge layui-edge-top");
							$("#bnxqhtetbJtwVal").text(toPositivePercentage(newContractAmountSignedThisYearComparedToTheSamePeriodLastYearOutsideTheGroup));
						}
						$('#operatingRevenueForThisYear').text(result.operatingRevenueForThisYear);
						$('#thisYearsOperatingRevenueOutsideTheGroup').text(result.thisYearsOperatingRevenueOutsideTheGroup);
						var yearOnYearOperatingRevenueForThisYear = result.yearOnYearOperatingRevenueForThisYear;
						if (isNegative(yearOnYearOperatingRevenueForThisYear)) {
							$("#bnyysrtb").attr("class", "compare-down-value");
							$("#bnyysrtbIcon").attr("class", "layui-edge layui-edge-bottom");
							$("#bnyysrtbVal").text(toPositivePercentage(yearOnYearOperatingRevenueForThisYear));
						} else {
							$("#bnyysrtb").attr("class", "compare-up-value");
							$("#bnyysrtbIcon").attr("class", "layui-edge layui-edge-top");
							$("#bnyysrtbVal").text(toPositivePercentage(yearOnYearOperatingRevenueForThisYear));
						}
						var thisYearsOperatingRevenueComparedToTheSamePeriodLastYearOutsideTheGroup = result.thisYearsOperatingRevenueComparedToTheSamePeriodLastYearOutsideTheGroup;
						if (isNegative(thisYearsOperatingRevenueComparedToTheSamePeriodLastYearOutsideTheGroup)) {
							$("#bnyysrtbJtw").attr("class", "compare-down-value");
							$("#bnyysrtbJtwIcon").attr("class", "layui-edge layui-edge-bottom");
							$("#bnyysrtbJtwVal").text(toPositivePercentage(thisYearsOperatingRevenueComparedToTheSamePeriodLastYearOutsideTheGroup));
						} else {
							$("#bnyysrtbJtw").attr("class", "compare-up-value");
							$("#bnyysrtbJtwIcon").attr("class", "layui-edge layui-edge-top");
							$("#bnyysrtbJtwVal").text(toPositivePercentage(thisYearsOperatingRevenueComparedToTheSamePeriodLastYearOutsideTheGroup));
						}
						var projectAcceptanceRate = result.projectAcceptanceRate;
						$('#projectAcceptanceRate').text(toPositivePercentage(projectAcceptanceRate));
						var projectAcceptanceRateOutsideTheGroup = result.projectAcceptanceRateOutsideTheGroup;
						$('#projectAcceptanceRateOutsideTheGroup').text(toPositivePercentage(projectAcceptanceRateOutsideTheGroup));
						renderXqhtphGrid(year, month);
						renderHtlyphGrid(year, month);
						renderYysrqnqsycChart(year, month);
						renderYysrkhkjChart(year, month);
						renderyysrKhkjGrid(year, month, "0");
						initSelSecOrg(year, month);
						renderQnsrfjChart(year, month);
						renderQkyjChart(year, month);
						renderDwxqhteGrid(year, month, "0");
						renderCompleteTodoBtn(reqId, userId);
						renderYszkChart(year, month);
						utils.removeLoading();
						utils.animateNum('#contractAmountHeldAtTheEndOfTheMonth', true);
						utils.animateNum('#endOfMonthContractAmountHeldOutsideTheGroup', true);
						utils.animateNum('#newContractAmountSignedThisYear', true);
						utils.animateNum('#newContractAmountSignedThisYearOutsideTheGroup', true);
						utils.animateNum('#operatingRevenueForThisYear', true);
						utils.animateNum('#thisYearsOperatingRevenueOutsideTheGroup', true);
					}
				});
			}

			// 本年新签合同排行 - 加载数据
			function renderXqhtphGrid(year, month) {
				xqhtphGrid = table.render({
					elem : '#xqhtphGrid',
					url : 'com.zhonghe.ame.kaohe.incomeChartPush.rankingOfNewlySignedContracts.biz.ext',
					where : {
						"year" : year,
						"month" : month
					},
					method : 'post',
					cols : [ [ {
						type : 'numbers',
						title : '序号',
						width : 70,
						align : 'center'
					},{
						field : 'secondary_orgname',
						title : '承办单位',
						width : 180
					},{
						field : 'contract_name',
						title : '合同名称'
					},{
						field : 'signatory_name',
						title : '签约方'
					},{
						field : 'contract_sum',
						title : '合同金额',
						width : 120,
						align : 'center',
						templet : function(d) {
							return d.contract_sum.toLocaleString('zh-CN', {
								minimumFractionDigits : 2,
								maximumFractionDigits : 2
							});
						}
					} ] ],
					parseData : function(res) {
						return {
							"code" : "0",
							"data" : res.result
						};
					}
				});
			}

			// 本年合同履约排行 - 加载数据
			function renderHtlyphGrid(year, month) {
				htlyphGrid = table.render({
					elem : '#htlyphGrid',
					url : 'com.zhonghe.ame.kaohe.incomeChartPush.contractPerformanceRanking.biz.ext',
					where : {
						"year" : year,
						"month" : month
					},
					method : 'post',
					cols : [ [ {
						type : 'numbers',
						title : '序号',
						width : 70,
						align : 'center'
					},{
						field : 'secondary_orgname',
						title : '承办单位',
						width : 180
					},{
						field : 'contract_name',
						title : '合同名称'
					},{
						field : 'payer_name',
						title : '付款单位'
					},{
						field : 'actual_invoice_sum',
						title : '金额',
						width : 120,
						align : 'center',
						templet : function(d) {
							return d.actual_invoice_sum.toLocaleString('zh-CN', {
								minimumFractionDigits : 2,
								maximumFractionDigits : 2
							});
						}
					} ] ],
					parseData : function(res) {
						return {
							"code" : "0",
							"data" : res.result
						};
					}
				});
			}

			// 本年新签合同排行 - 单选切换
			form.on('radio(xqhtphTab)', function(data) {
				xqhtphGrid.reloadData({
					where : {
						"year" : year,
						"month" : month,
						"xqhtphTab" : data.value
					}
				})
			});

			// 本年合同履约排行 - 单选切换
			form.on('radio(htlyphTab)', function(data) {
				htlyphGrid.reloadData({
					where : {
						"year" : year,
						"month" : month,
						"htlyphTab" : data.value
					}
				})
			});

			// 营业收入全年趋势预测 - 图表加载
			function renderYysrqnqsycChart(year, month) {
				$.ajax({
					url : "com.zhonghe.ame.kaohe.incomeChartPush.annualTrendForecastOfOperatingIncome.biz.ext",
					data : {
						"year" : year,
						"month" : month
					},
					async: false,
					type : "POST",
					dataType : "json",
					success : function(data) {
						var result = data.result;
						var chartOption = buildYysrqnqsycChartOption(result);
						renderChart.setOption(chartOption);
					}
				});
			}
			
			// 营业收入全年趋势预测 - 图表参数配置
			function buildYysrqnqsycChartOption(result){
				var monthStrs = [ "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月" ];
				var chartOption = {
				    tooltip: {
				        trigger: 'axis',
				        formatter: function (params) {
				            var result = "【" + params[0].name + "】<br>";
				            var validParams = params.filter(item => item.value !== undefined && item.value !== '-');
				            validParams.forEach(item => {
				                if (!result.includes(item.seriesName + "：")) {
				                    var str = item.seriesName + "：" + item.value.toLocaleString('zh-CN', { minimumFractionDigits: 2, maximumFractionDigits: 2 }) + "万元<br>";
				                    result += str;
				                }
				            });
				            return result;
				        },
				        textStyle: {
				            fontSize: 18
				        }
				    },
				    legend: {
				        textStyle: {
				            fontSize: 16
				        },
				        data: result.map(series => series.name)
				    },
				    grid: {
				        left: '80',
				        right: '30',
				        bottom: '30',
				        top: '40'
				    },
				    xAxis: {
				        type: 'category',
				        axisLabel: {
				            fontSize: 16,
				            color: '#000'
				        },
				        data: monthStrs
				    },
				    yAxis: {
				        type: 'value',
				        name: '单位：万元',
				        axisLabel: {
				            fontSize: 16,
				            color: '#000'
				        },
				        nameTextStyle: {
				            fontSize: 16,
				            color: '#000'
				        }
				    },
				    series: result.flatMap(series => {
				        // 创建实线部分 (当前月及之前)
				        var solidLineArray = series.data.map((_, i) => i < month ? series.data[i] : null);
				
				        // 创建虚线部分 (当前月之后)
				        var imaginaryArray = series.data.map((_, i) => i >= month ? series.data[i] : null);
				
				        imaginaryArray[month - 1] = solidLineArray[month - 1];
				
				        // 返回两个系列：实线和虚线
				        return [
				            {
				                name: series.name,
				                type: 'line',
				                data: solidLineArray,
				                smooth: true,
				                symbolSize: 10,
				                label: {
				                    show: true,
				                    fontSize: 18,
				                    color: '#000',
				                    formatter: function (param) {
				                        return param.value.toLocaleString('zh-CN', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
				                    }
				                },
				                lineStyle: {
				                    width: 2,
				                    color: series.color
				                }
				            },
				            {
				                name: series.name,
				                type: 'line',
				                data: imaginaryArray,
				                smooth: true,
				                symbolSize: 10,
				                label: {
				                    show: true,
				                    fontSize: 18,
				                    color: '#000',
				                    formatter: function (param) {
				                        return param.value.toLocaleString('zh-CN', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
				                    }
				                },
				                lineStyle: {
				                    width: 2,
				                    type: 'dashed',
				                    color: series.color
				                }
				            }
				        ];
				    })
				};
				return chartOption;
			}
			
			// 营业收入全年趋势预测 - 单选切换
			form.on('radio(yysrqnqsycTab)', function(data) {
				$.ajax({
					url : "com.zhonghe.ame.kaohe.incomeChartPush.annualTrendForecastOfOperatingIncome.biz.ext",
					data : {
						"year" : year,
						"month" : month,
						"major": data.value
					},
					async: false,
					type : "POST",
					dataType : "json",
					success : function(data) {
						var result = data.result;
						var chartOption = buildYysrqnqsycChartOption(result);
			        	renderChart.setOption(chartOption);
					}
				});
			});
			
			// 营业收入(考核口径) - 图表加载
			function renderYysrkhkjChart(year, month){
				$.ajax({
					url : "com.zhonghe.ame.kaohe.incomeChartPush.assessmentCriteriaForOperatingIncome.biz.ext",
					data : {
						"year" : year,
						"month" : month
					},
					type : "POST",
					async: false,
					dataType : "json",
					success : function(data) {
						var result = data.result;
						var ywzxData = result.ywzx;
						var qtData = result.qt;
						var ywzxChartOption = buildYysrkhkjChartOption(ywzxData);
						var qtChartOption = buildYysrkhkjChartOption(qtData);
						yysrkhkjChartByYwzx.setOption(ywzxChartOption);
						yysrkhkjChartByQt.setOption(qtChartOption);
					}
				});
			}
			
			// 营业收入(考核口径) - 图表参数配置
			function buildYysrkhkjChartOption(yysrData) {
			    var yysrChartOption = {
			        tooltip: {
			            trigger: 'axis',
			            formatter: function (params) {
			                var result = "【" + params[0].name + "】<br>";
			                params.forEach(item => {
			                    if (!result.includes(item.seriesName + "：")) {
			                        var str = item.seriesName + "：" + item.value.toLocaleString('zh-CN', { minimumFractionDigits: 2, maximumFractionDigits: 2 }) + "万元<br>";
			                        result += str;
			                    }
			                });
			                return result;
			            },
			            textStyle: {
			                fontSize: 18
			            },
			            axisPointer: {
			                type: 'shadow'
			            }
			        },
			        legend: {
			            textStyle: {
			                fontSize: 16
			            },
			            data: yysrData.examineDatas.map(series => series.name)
			        },
			        grid: {
			            left: '80',
			            right: '30',
			            bottom: '40',
			            top: '40'
			        },
			        xAxis: {
			            type: 'category',
			            axisLabel: {
			                fontSize: 16,
			                color: '#000',
			                interval: 0,
			                formatter: function (value) {
			                	 return value.replace(/(.{8})/g, '$1\n');
			                }
			            },
			            data: yysrData.secOrgNames,
			            axisTick: {
			                alignWithLabel: true
			            }
			        },
			        yAxis: {
			            type: 'value',
			            name: '单位：万元',
			            axisLabel: {
			                fontSize: 16,
			                color: '#000'
			            },
			            nameTextStyle: {
			                fontSize: 16,
			                color: '#000'
			            }
			        },
			        series: yysrData.examineDatas.map(series => ({
			            name: series.name,
			            type: 'bar',
			            data: series.datas,
			            label: {
			                show: true,
			                fontSize: 14,
			                color: '#000',
			                formatter: function (param) {
			                    return param.value.toLocaleString('zh-CN', { minimumFractionDigits: 0, maximumFractionDigits: 0 });
			                },
			                position: 'top'
			            }
			        }))
			    };
			    return yysrChartOption;
			}
			
			// 营业收入(考核口径) - 单选切换
			form.on('radio(yysrkhkjTab)', function(data) {
				$.ajax({
					url : "com.zhonghe.ame.kaohe.incomeChartPush.assessmentCriteriaForOperatingIncome.biz.ext",
					data : {
						"year" : year,
						"month" : month,
						"yysrkhkjTab": data.value
					},
					async: false,
					type : "POST",
					dataType : "json",
					success : function(data) {
						var result = data.result;
						var ywzxData = result.ywzx;
						var qtData = result.qt;
						var ywzxChartOption = buildYysrkhkjChartOption(ywzxData);
						var qtChartOption = buildYysrkhkjChartOption(qtData);
						yysrkhkjChartByYwzx.setOption(ywzxChartOption);
						yysrkhkjChartByQt.setOption(qtChartOption);
					}
				});
				renderyysrKhkjGrid(year, month, data.value);
			});
			
			// 营业收入(考核口径)  - 表格渲染
			function renderyysrKhkjGrid(year, month, yysrkhkjTab) {
				$.ajax({
					url : "com.zhonghe.ame.kaohe.incomeChartPush.monthlyCumulativeUnitCompletionValueAndCompletionRateRanking.biz.ext",
					data : {
						"year" : year,
						"month" : month,
						"yysrkhkjTab": yysrkhkjTab
					},
					async: false,
					type : "POST",
					dataType : "json",
					success : function(data) {
						var result = data.result;
						ywzxCompletionValueGrid = table.render({
							elem : '#ywzxCompletionValueGrid',
							cols : [ [ {
								type : 'numbers',
								title : '序号',
								width : 70,
								align : 'center'
							}, {
								field : 'secondaryOrgname',
								title : '单位名称'
							}, {
								field : 'completionValue',
								title : '完成值',
								width : 120,
								align : 'center',
								templet : function(d) {
									return d.completionValue.toLocaleString('zh-CN', {
										minimumFractionDigits : 2,
										maximumFractionDigits : 2
									});
								}
							} ] ],
							data : result.ywzxCompletionValue
						});
						qtCompletionValueGrid = table.render({
							elem : '#qtCompletionValueGrid',
							cols : [ [ {
								type : 'numbers',
								title : '序号',
								width : 70,
								align : 'center'
							}, {
								field : 'secondaryOrgname',
								title : '单位名称'
							}, {
								field : 'completionValue',
								title : '完成值',
								width : 120,
								align : 'center',
								templet : function(d) {
									return d.completionValue.toLocaleString('zh-CN', {
										minimumFractionDigits : 2,
										maximumFractionDigits : 2
									});
								}
							} ] ],
							data : result.qtCompletionValue
						});
						ywzxCompletionValueLJGrid = table.render({
							elem : '#ywzxCompletionValueLJGrid',
							cols : [ [ {
								type : 'numbers',
								title : '序号',
								width : 70,
								align : 'center'
							}, {
								field : 'secondaryOrgname',
								title : '单位名称'
							}, {
								field : 'completionValueLJ',
								title : '完成值',
								width : 120,
								align : 'center',
								templet : function(d) {
									return d.completionValueLJ.toLocaleString('zh-CN', {
										minimumFractionDigits : 2,
										maximumFractionDigits : 2
									});
								}
							} ] ],
							data : result.ywzxCompletionValueLJ
						});
						qtCompletionValueLJGrid = table.render({
							elem : '#qtCompletionValueLJGrid',
							cols : [ [ {
								type : 'numbers',
								title : '序号',
								width : 70,
								align : 'center'
							}, {
								field : 'secondaryOrgname',
								title : '单位名称'
							}, {
								field : 'completionValueLJ',
								title : '完成值',
								width : 120,
								align : 'center',
								templet : function(d) {
									return d.completionValueLJ.toLocaleString('zh-CN', {
										minimumFractionDigits : 2,
										maximumFractionDigits : 2
									});
								}
							} ] ],
							data : result.qtCompletionValueLJ
						});
						ywzxCompletionRateGrid = table.render({
							elem : '#ywzxCompletionRateGrid',
							cols : [ [ {
								type : 'numbers',
								title : '序号',
								width : 70,
								align : 'center'
							}, {
								field : 'secondaryOrgname',
								title : '单位名称'
							}, {
								field : 'completionRate',
								title : '完成率',
								width : 120,
								align : 'center',
							} ] ],
							data : result.ywzxCompletionRate
						});
						qtCompletionRateGrid = table.render({
							elem : '#qtCompletionRateGrid',
							cols : [ [ {
								type : 'numbers',
								title : '序号',
								width : 70,
								align : 'center'
							}, {
								field : 'secondaryOrgname',
								title : '单位名称'
							}, {
								field : 'completionRate',
								title : '完成率',
								width : 120,
								align : 'center',
							} ] ],
							data : result.qtCompletionRate
						});
					}
				});
			}			
			
			// 初始化单位下拉选择框
			function initSelSecOrg(year, month){
				$.ajax({
					url : "com.zhonghe.ame.kaohe.incomeChartPush.getKaoHeSecOrg.biz.ext",
					data : {
						"year" : year,
						"month" : month
					},
					async: false,
					type : "POST",
					dataType : "json",
					success : function(data) {
						var result = data.result;
						var selSecOrg = $('#selSecOrg');
						selSecOrg.empty();
						selSecOrg.append('<option value="all">中核工程咨询有限公司</option>');
						$.each(result, function(index, item) {
            				selSecOrg.append('<option value="' + item.secondary_org + '">' + item.secondary_orgname + '</option>');
        				});
        				form.render('select');
					}
				});
			}
			
			// 全年收入分解 - 图表加载
			function renderQnsrfjChart(year, month){
				$.ajax({
					url : "com.zhonghe.ame.kaohe.incomeChartPush.annualIncomeBreakdown.biz.ext",
					data : {
						"year" : year,
						"month" : month,
						"secOrg": "all"
					},
					async: false,
					type : "POST",
					dataType : "json",
					success : function(data) {
						var result = data.result;
						var chartOption = buildQnsrfjChartOption(result);
						qnsrfjChart.setOption(chartOption);
					}
				});
			}
			
			// 全年收入分解 - 图表参数配置
			function buildQnsrfjChartOption(result) {
				var allSum = result.datas[0].allSum.toLocaleString('zh-CN', {minimumFractionDigits : 2,maximumFractionDigits : 2})+"万元";
			    var chartOption = {
				    tooltip: {
				        trigger: 'item',
				        textStyle:{
				            fontSize: 18
				        },
				        formatter: function (param) {
				            if(param.name == '后续待签合同收入'){
				                return param.name + "："+param.value.toLocaleString('zh-CN', {minimumFractionDigits : 2,maximumFractionDigits : 2})+"万元，占比："+param.data.percentage+"<br>其中(低风险)："+param.data.dfxValue.toLocaleString('zh-CN', {minimumFractionDigits : 2,maximumFractionDigits : 2})+"万元<br>其中(中风险)："+param.data.zfxValue.toLocaleString('zh-CN', {minimumFractionDigits : 2,maximumFractionDigits : 2})+"万元";
				            }else{
				                return param.name + "："+param.value.toLocaleString('zh-CN', {minimumFractionDigits : 2,maximumFractionDigits : 2})+"万元，占比："+param.data.percentage;
				            } 
				        }
				    },
				    grid: {
				        left: '10',
				        right: '10',
				        bottom: '10',
				        top: '10'
				    },
					legend: {
					    textStyle: {
					        fontSize: 16
					    },
					    data: result.datas.map(series => series.name)
					},
					series: {
						name: result.name,
						type: 'pie',
						alignTo: 'edge',
						edgeDistance: 10,
						radius: ['40%', '70%'],
						label: {
						    show: true,
						    fontSize: 18,
						    color: '#000',
						    overflow: 'break',
						    formatter: function(param){
								if(param.name == '后续待签合同收入'){
									return param.name +"："+ param.value.toLocaleString('zh-CN', {minimumFractionDigits : 2,maximumFractionDigits : 2})+"万元("+param.data.percentage+")\n\n"+"{name|其中(低风险)："+param.data.dfxValue.toLocaleString('zh-CN', {minimumFractionDigits : 2,maximumFractionDigits : 2})+"万元}\n\n{name|其中(中风险)："+param.data.zfxValue.toLocaleString('zh-CN', {minimumFractionDigits : 2,maximumFractionDigits : 2})+"万元}";
								}else{
									return param.name +"："+ param.value.toLocaleString('zh-CN', {minimumFractionDigits : 2,maximumFractionDigits : 2})+"万元("+param.data.percentage+")";
								}
						    },
						    rich: {
						    	name: {
						    		fontSize: 18,
						    		color: '#c0392b'
						    	}
						    }			                                
						},
						itemStyle: {
						    borderColor: '#fff',
						    borderWidth: 1
						},
						data: result.datas
					},
					graphic: [
						{
							type: 'text',
							left: 'center',
							top: '50%',
							style: {
								text:allSum,
								fontSize: 22,
								fontWeight: 'bold',
								fill: '#000'
							}
						},
						{
							type: 'text',
							left: 'center',
							top: '45%',
							style: {
								text: '全年预测收入',
								fontSize: 22,
								fontWeight: 'bold',
								fill: '#000'
							}
						}
					]
			    };
			    return chartOption;
			}
			
			// 全年收入分解 - 下拉选择单位触发
			form.on('select(selSecOrg)', function(data){
				var formVal = form.val('qnsrfjForm');
				$.ajax({
					url : "com.zhonghe.ame.kaohe.incomeChartPush.annualIncomeBreakdown.biz.ext",
					data : {
						"year" : year,
						"month" : month,
						"secOrg": data.value,
						"qnsrfjTab": formVal.qnsrfjTab
					},
					async: false,
					type : "POST",
					dataType : "json",
					success : function(data) {
						var result = data.result;
						var chartOption = buildQnsrfjChartOption(result);
						qnsrfjChart.setOption(chartOption);
					}
				});
			});
			
			// 全年收入分解 - 单选切换
			form.on('radio(qnsrfjTab)', function(data) {
				var formVal = form.val('qnsrfjForm');
				$.ajax({
					url : "com.zhonghe.ame.kaohe.incomeChartPush.annualIncomeBreakdown.biz.ext",
					data : {
						"year" : year,
						"month" : month,
						"secOrg": formVal.selSecOrg,
						"qnsrfjTab": data.value
					},
					async: false,
					type : "POST",
					dataType : "json",
					success : function(data) {
						var result = data.result;
						var chartOption = buildQnsrfjChartOption(result);
						qnsrfjChart.setOption(chartOption);
					}
				});
			});
			
			// 缺口预警 - 图表加载
			function renderQkyjChart(year, month) {
				$.ajax({
					url : "com.zhonghe.ame.kaohe.incomeChartPush.gapWarningAssessmentCriteria.biz.ext",
					data : {
						"year" : year,
						"month" : month
					},
					async: false,
					type : "POST",
					dataType : "json",
					success : function(data) {
						var result = data.result;
						var chartOption = buildQkyjChartOption(result);
						qkyjChart.setOption(chartOption);
					}
				});
			}
			
			// 缺口预警 - 图表参数配置
			function buildQkyjChartOption(qkyjData){
				var chartOption = {
			        tooltip: {
				        trigger: 'axis',
				        axisPointer: {
				            type: 'shadow'
				        },
			            formatter: function (params) {
							return result = params[0].name + "："+params[0].value.toLocaleString('zh-CN', {minimumFractionDigits : 2,maximumFractionDigits : 2})+"万元"
			            },
			            textStyle: {
			                fontSize: 18
			            }
			        },
				    grid: {
				        left: '30',
				        right: '30',
				        bottom: '10',
				        top: '30'
				    },
				    xAxis: {
				        type: 'value',
				        position: 'top',
			            axisLabel: {
			                fontSize: 16,
			                color: '#000'
			            },
			            min: qkyjData.min,
			            max: qkyjData.max,
				    },
				    yAxis: {
				        type: 'category',
				        inverse: true,
				        axisLine: { show: false },
				        axisLabel: { show: false },
				        axisTick: { show: false },
				        splitLine: { show: false },
				        data: qkyjData.datas.map(series => series.name)
				    },
				    series: [
				        {
				            name: '缺口预警',
				            type: 'bar',
				            label: {
				                show: true,
				                fontSize: 16,
				                color: '#000',
				                formatter: function (param) {
				                	if(param.value > 0){
				                		return "{name|"+param.name +"："+ param.value.toLocaleString('zh-CN', { minimumFractionDigits: 2, maximumFractionDigits: 2 })+"万元}";
				                	}else{
				                		return param.name +"："+ param.value.toLocaleString('zh-CN', { minimumFractionDigits: 2, maximumFractionDigits: 2 })+"万元";
				                	}
				                },
				                rich: {
				                	name: {
				                		fontSize: 16,
				                		fontWeight: 'bold'
				                	}
				                }
				            },
				            data: qkyjData.datas
				        }
				    ]
				};
				return chartOption;
			}
			
			// 缺口预警 - 单选切换
			form.on('radio(qkyjTab)', function(data) {
				$.ajax({
					url : "com.zhonghe.ame.kaohe.incomeChartPush.gapWarningAssessmentCriteria.biz.ext",
					data : {
						"year" : year,
						"month" : month,
						"qkyjTab": data.value
					},
					async: false,
					type : "POST",
					dataType : "json",
					success : function(data) {
						var result = data.result;
						var chartOption = buildQkyjChartOption(result);
						qkyjChart.setOption(chartOption);
					}
				});
			});
			
			// 各单位新签合同额排行  - 表格渲染
			function renderDwxqhteGrid(year, month, dwxqhteTab) {
				$.ajax({
					url : "com.zhonghe.ame.kaohe.incomeChartPush.rankingOfNewlySignedContractAmountsByEachUnit.biz.ext",
					data : {
						"year" : year,
						"month" : month,
						"dwxqhteTab": dwxqhteTab
					},
					async: false,
					type : "POST",
					dataType : "json",
					success : function(data) {
						var result = data.result;
						ywzxThisMonthGrid = table.render({
							elem : '#ywzxThisMonthGrid',
							cols : [ [ {
								type : 'numbers',
								title : '序号',
								width : 70,
								align : 'center'
							}, {
								field : 'secondary_orgname',
								title : '单位名称'
							}, {
								field : 'total_contract_sum',
								title : '金额',
								width : 120,
								align : 'center',
								templet : function(d) {
									return d.total_contract_sum.toLocaleString('zh-CN', {
										minimumFractionDigits : 2,
										maximumFractionDigits : 2
									});
								}
							} ] ],
							data : result.ywzxThisMonth
						});
						qtThisMonthGrid = table.render({
							elem : '#qtThisMonthGrid',
							cols : [ [ {
								type : 'numbers',
								title : '序号',
								width : 70,
								align : 'center'
							}, {
								field : 'secondary_orgname',
								title : '单位名称'
							}, {
								field : 'total_contract_sum',
								title : '金额',
								width : 120,
								align : 'center',
								templet : function(d) {
									return d.total_contract_sum.toLocaleString('zh-CN', {
										minimumFractionDigits : 2,
										maximumFractionDigits : 2
									});
								}
							} ] ],
							data : result.qtThisMonth
						});
						ywzxCumulativeMonthGrid = table.render({
							elem : '#ywzxCumulativeMonthGrid',
							cols : [ [ {
								type : 'numbers',
								title : '序号',
								width : 70,
								align : 'center'
							}, {
								field : 'secondary_orgname',
								title : '单位名称'
							}, {
								field : 'total_contract_sum',
								title : '金额',
								width : 120,
								align : 'center',
								templet : function(d) {
									return d.total_contract_sum.toLocaleString('zh-CN', {
										minimumFractionDigits : 2,
										maximumFractionDigits : 2
									});
								}
							} ] ],
							data : result.ywzxCumulativeMonth
						});
						qtCumulativeMonthGrid = table.render({
							elem : '#qtCumulativeMonthGrid',
							cols : [ [ {
								type : 'numbers',
								title : '序号',
								width : 70,
								align : 'center'
							}, {
								field : 'secondary_orgname',
								title : '单位名称'
							}, {
								field : 'total_contract_sum',
								title : '金额',
								width : 120,
								align : 'center',
								templet : function(d) {
									return d.total_contract_sum.toLocaleString('zh-CN', {
										minimumFractionDigits : 2,
										maximumFractionDigits : 2
									});
								}
							} ] ],
							data : result.qtCumulativeMonth
						});
					}
				});
			}
			
			// 各单位新签合同额排行 - 单选切换
			form.on('radio(dwxqhteTab)', function(data) {
				renderDwxqhteGrid(year, month, data.value);
			});
			
			// 应收账款图表渲染
			function renderYszkChart(year, month){
				var tjTitle = year + '年1 - ' + month + '月';
				$.ajax({
					url : "com.zhonghe.ame.kaohe.incomeChartPush.accountsReceivable.biz.ext",
					data : {
						"year" : year,
						"month" : month
					},
					type : "POST",
					async: false,
					dataType : "json",
					success : function(data) {
						var result = data.result;
						var ywzxData = result.ywzx;
						ywzxData.tjTitle = tjTitle;
						var qtData = result.qt;
						qtData.tjTitle = tjTitle;
						var zbData = result.zb;
						zbData.tjTitle = tjTitle;
						yszkChartByYwzx.render(ywzxData);
						yszkChartByQt.render(qtData);
						var zbCharOption = buildYszkChartByZbOption(zbData);
						yszkChartByZb.setOption(zbCharOption);
					}
				});
			}
			
			function buildYszkChartByZbOption(zbData) {
				var titleText = zbData.tjTitle +'应收账款【'+zbData.monthlyAccountsReceivableTotalSum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+' 万元】占比情况'
				var yszkZbChartOption = {
	               title: {
	                   top: '20',
	                   left: 'center',
	                   text: titleText
	               },
	               tooltip: {
	               		formatter: function (info) {
	                        return [
	                            '<div class="tooltip-title">' +
	                            echarts.format.encodeHTML(info.data.name) +
	                            '</div>',
	                            '应收账款：' + info.data.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '万元<br>',
	                            '应收占比：' + info.data.proportionText + '<br>'
	                        ].join('');
	               		},
			            textStyle: {
			                fontSize: 18
			            }		
	               },
	               series: [{
	               		type: 'treemap',
	               		left: '0',
	               		top: '50',
	               		width: '98%',
	               		height: '725',
	               		roam: false,
	               		nodeClick: false,
	               		breadcrumb: {
	               			show: false
	               		},
	                    itemStyle: {
	                        borderWidth: 1,
	                        borderColor: '#fff',
	                    },
	               	 	label: {
	               	 		position: 'insideTopLeft',
	               	 		formatter: function (params) {
	               	 			let arr = ['{name|' + params.data.name + '}',
	               	 				'{hr|}',
	               	 				'{yszk|应收账款：'+ params.data.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + '万元}',
	               	 				'{yszb|应收占比：'+ params.data.proportionText + '}'];
	               	 			return arr.join('\n');
	               	 		},
		               	 	rich: {
		                        name: {
		                            fontSize: 14,
		                            color: '#fff'
		                        },
		                        hr: {
		                            width: '100%',
		                            borderColor: 'rgba(255,255,255,0.2)',
		                            borderWidth: 1,
		                            height: 0,
		                            lineHeight: 10
		                        },
		                        yszk: {
		                        	fontSize: 14,
		                        	lineHeight: 30,
		                        	color: '#fff'
		                        },
		                        yszb: {
		                        	fontSize: 14,
		                        	lineHeight: 30,
		                        	color: '#fff'
		                        }	               	 		
		               	 	}
	               	 	},
	               		data: zbData.datas			
	               }]
				};
				return yszkZbChartOption;
			}
			
			// 应收账款 - 单选切换
			form.on('radio(yszkTab)', function(data) {
				var tjTitle = year + '年1 - ' + month + '月';
				$.ajax({
					url : "com.zhonghe.ame.kaohe.incomeChartPush.accountsReceivable.biz.ext",
					data : {
						"year" : year,
						"month" : month,
						"yszkTab": data.value
					},
					async: false,
					type : "POST",
					dataType : "json",
					success : function(data) {
						var result = data.result;
						var ywzxData = result.ywzx;
						ywzxData.tjTitle = tjTitle;
						var qtData = result.qt;
						qtData.tjTitle = tjTitle;
						var zbData = result.zb;
						zbData.tjTitle = tjTitle;
						yszkChartByYwzx.update(ywzxData);
						yszkChartByQt.update(qtData);
						var zbCharOption = buildYszkChartByZbOption(zbData);
						yszkChartByZb.setOption(zbCharOption);
					}
				});
			});			
			
			// 渲染完成待办按钮
			function renderCompleteTodoBtn(chartId, userId){
				if(userId != null && userId !='null'){
					$.ajax({
						url : "com.zhonghe.ame.kaohe.businessSituation.completeTheTodo.biz.ext",
						data : {
							"chartId" : chartId,
							"userId" : userId
						},
						async: false,
						type : "POST",
						dataType : "json",
						success : function(data) {
							var result = data.result;
							if(result == "2"){
								$('#completeTodoBtn').removeClass('layui-hide');
							}
						}					
					});	
				}
			}			
			
			// 触发待办完成按钮事件
			layUtil.on({
				toBeCompleted: function(){
					var index = layer.load();
					$.ajax({
						url : "com.zhonghe.ame.kaohe.businessSituation.sendTodoDone.biz.ext",
						data : {
							"chartId" : reqId,
							"userId" : userId
						},
						type : "POST",
						dataType : "json",
						success : function(data) {
							var result = data.result;
							console.log(result);
							if(result == "1"){
								closeOk();
							}else{
								layer.close(index);
								layer.msg('执行待办完成失败！请联系管理员',{time: 5000 });
							}
						}					
					});
				},
				bnljxqhteTab: function(){
					ywzxCumulativeMonthGrid.resize();
					qtCumulativeMonthGrid.resize();
				},
				dyxqhteTab: function(){
					ywzxThisMonthGrid.resize();
					qtThisMonthGrid.resize();
				}
			});															
						
			// 判断是否为负数
			function isNegative(num) {
				var value = Number(num);
				return value < 0;
			}

			// 转为百分比
			function toPositivePercentage(num) {
				var decimals = 0;
				var value = Number(num);
				if (isNaN(value)) {
					return "0%";
				}
				var positiveValue = Math.abs(value);
				var percentage = positiveValue * 100;
				var formatted = percentage.toFixed(decimals);
				return formatted + '%';
			}
			
			// 实线部分数组
			function solidLineArray(index, arr){
				return arr.map((_, i) => i < index ? arr[i] : '-');
			}
			
			// 虚线部分数组
			function imaginaryArray(index, arr){
				var newArr = arr.map((_, i) => i >= index ? arr[i] : '-');
				newArr[index-1] = arr[index-1];
				return newArr;
			}
			
		 	//关闭窗口
		 	function CloseWindow(action) {
		        if (window.CloseOwnerWindow){
		        	return window.CloseOwnerWindow(action);
		        }else{
		        	window.close();
		        }
		    }
		    
		    function closeCancel() {
		        close_window("cancel");
			}
			
			function closeOk() {
				close_window("ok");
			}
			
			function close_window_directly() {
		        close_window("cancel");
			}
			
			function close_window(action) {
		        if (window.CloseOwnerWindow){
		        	return window.CloseOwnerWindow(action);
		        }else{
		        	window.close(); 
		        }          
			}			
			
		});
	</script>
</body>
</html>