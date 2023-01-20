<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuyl
  - Date: 2016-12-14 16:23:30
  - Description:
-->
<head>
	<title>合同收入成本核算月度汇总表明细</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<!-- 点击毛利金额，能显示对应的明细数据，明细数据包含合同收入确认及成本确认信息及毛利数据 -->
	<div>
	 	<fieldset style="width:2650px;border:solid 1px #aaa;padding:3px;">
	 	<legend><span id="titletext" style="font-size: 12px;">合同收入成本核算明细信息</span></legend>
	 		
	        <div id="datagrid1" class="nui-datagrid" style="width:100%;height: auto;" allowResize="true" dataField="objs" 
		    	multiSelect="true" allowAlternating="true" showpager="false" ondrawsummarycell="onDrawSummaryCell" 
		    	showSummaryRow="true" virtualScroll="true" allowHeaderWrap="true" allowSortColumn="false"
		    	url="com.primeton.eos.ame_income.csReveForecast.queryCsContractReveCostAccountingDetail.biz.ext">
				<div property="columns">
					<div field="dictname" width="100" align="left" headerAlign="center" allowSort="true">事业部</div>
					<div field="salename" width="70" align="center" headerAlign="center" allowSort="true">销售</div>
					<div field="contnum" width="90" align="left" headerAlign="center" allowSort="true">合同编号</div>
					<div field="projectname" width="150" align="left" headerAlign="center" allowSort="true">合同名称</div>
					<div field="custname" width="200" align="left" headerAlign="center" allowSort="true">所属客户</div>
					<div field="contsum" width="90" summaryType="sum" dataType="currency" align="right" headerAlign="center" >合同金额</div>
					<!-- 合同收入确认信息 -->
					<div field="reveno" width="40" align="center" headerAlign="center" >收入编号</div>
					<div field="newyearmonth" width="50" align="center" dateFormat="yyyy-MM-dd" headerAlign="center" >预计确认年月</div>
					<div field="wqrje" width="90" summaryType="sum" dataType="currency" align="right" headerAlign="center" >预计确认金额（含税）</div>
					<div field="wqrjebhs" width="90" summaryType="sum" dataType="currency" align="right" headerAlign="center" >预计确认金额（不含税）</div>
					<div field="yqrje" width="90" summaryType="sum" dataType="currency" align="right" headerAlign="center" >实际确认金额（含税）</div>
					<div field="yqrjebhs" width="90" summaryType="sum" dataType="currency" align="right" headerAlign="center" >实际确认金额（不含税）</div>
					<div field="confirmday" width="80" align="center" dateFormat="yyyy-MM-dd" headerAlign="center" >实际确认日期</div>
					<div field="fcreverate" width="60" numberFormat="p1" align="center" headerAlign="center" >预估确认比例</div>
					<div field="fcreverate2" width="60" numberFormat="p1" align="center" headerAlign="center" >实际确认比例</div>
					<div field="revetype" width="120" renderer="onGenderInComeType" align="left" headerAlign="center" >收入类型</div>
					<div field="status" width="95" renderer="onGenderStatus" align="center" headerAlign="center" >状态</div>
					<!-- <div field="revetimedesc" width="130" align="left" headerAlign="center" >收入确认时点描述</div>
					<div field="reveproof" width="130" renderer="onGenderReveproof" align="left" headerAlign="center" >预计收入确认证据</div>
					<div field="actreveproof" width="130" renderer="onGenderReveproof" align="left" headerAlign="center" >实际收入确认证据</div>
					<div field="changetimes" width="50" align="center" headerAlign="center" >预测变更次数</div> -->
					<!-- 成本确认信息 -->
					<div header="结转成本" headerAlign="center">
						<div property="columns">
							<!-- 人力信息 -->
							<div field="costsb" width="100" align="right">人力</div>
							<!-- 采购信息 -->
							<div field="costsc" width="100" align="right">采购</div>
							<!-- 直接费用信息 -->
							<!-- <div field="" width="100" align="right">直接费用</div> -->
						</div>
					</div>
					<!-- 毛利数据信息 -->
					<div field="maoli" width="100" align="right">毛利</div>
					<div field="processInstID" width="50" align="center"headerAlign="center" renderer="onGenderProId" >流程ID</div>
					<div field="memo" width="192" align="left" headerAlign="center" >说明</div>
					<div field="actsum_fc" width="90" summaryType="sum" dataType="currency" align="right" headerAlign="center" >累计收款额</div>
					<div field="billsummon" width="90" summaryType="sum" dataType="currency" align="right" headerAlign="center" >累计开票额</div>
					<div field="processsummon" width="90" summaryType="sum" dataType="currency" align="right" headerAlign="center" >其中：已开票已交付</div>
					<div field="endsummon" width="90" summaryType="sum" dataType="currency" align="right" headerAlign="center" >其中：已开票未交付</div>
					<div width="auto"></div>
				</div>
			</div>
		</fieldset>
	</div>
	<div style="text-align:center;padding:10px;width:2635px;" class="nui-toolbar">
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
		<!-- <a class="nui-button" onclick="exportIncomeDetail" iconCls="icon-download" style="width: 60px;" id="exportButton">导出</a> -->	
	</div>
	
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form>
	<script type="text/javascript">
		nui.parse();
		/* var form = new nui.Form("form1"); */
		var grid = nui.get("datagrid1");
		//事业部new String(request.getParameter("name").getBytes("ISO-8859-1"),"GB2312");
		var dictname = getUrlParam("dictname");
		//销售
		var salename = getUrlParam("salename");
		//所属客户
		var custname = getUrlParam("custname");
		//合同
		var contnum = getUrlParam("contnum");
		//年度
		var years = getUrlParam("years");
		//年度
		var quarters = getUrlParam("quarters");
		//月份
		var months = getUrlParam("months");
		//条件部门
		var orgseq = getUrlParam("orgseq");
		//部门
		var orgseq1 = getUrlParam("orgseq1");
		//条件销售
		var salename1 = getUrlParam("salename1");
		//条件客户
		var custname1 = getUrlParam("custname1");
		//条件合同
		var contnum1 = getUrlParam("contnum1");
		//
		var revetype = getUrlParam("revetype");
		
		if(months < 10){
			months = "0" + months;
		}
		
		function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			//return URLDecoder.decode(r[2], "utf-8");
			return decodeURIComponent(r[2]); 
			return null; 
		}
		init();
		function init(){
			//alert("dictname = " + dictname + ",salename = " + salename + ",custname = " + custname + ",contnum = " + contnum 
			//	+ ",years = " + years + ",quarters = " + quarters + ",months = " + months);
			var json = {obj: {orgseq:orgseq,orgseq1:orgseq1,salename1:salename1,custname1:custname1,contnum1:contnum1,revetype:revetype,salename: salename,ymonths: months,yyears: years,status: "3",custname: custname,s1: "YQRJE",s2: "DESC"}};
			grid.load(json,function(){
				//grid.hideColumn(grid.getColumn(13));
			});
			return;
			if(status == 0){
				status = "0";
			}else if(status == 2){
				status = "2";
			}
			//alert(status + "|" + months + "|" + years.length + "|" + nd);
			if(status == 3){
				if((dictname == null || dictname == "") && (salename == null || dictname == "") && (months.indexOf("年之后的收入确认总计") == "-1") && (months != "总计") && nd != 1){
					document.getElementById("titletext").innerHTML=  "普元 " + years + "年" + months + "月的" + "已确认收入详细信息";
				}else if(months.indexOf("年之后的收入确认总计") != "-1"){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年之后已确认收入详细信息";
				}else if(months=="总计" && years.length==4){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年已确认收入总计详细信息";
				}else if(months=="01" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q1的" + "已确认收入详细信息";
				}else if(months=="02" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q2的" + "已确认收入详细信息";
				}else if(months=="03" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q3的" + "已确认收入详细信息";
				}else if(months=="04" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q4的" + "已确认收入详细信息";
				}else if(months=="总计" && years.length==8){
					var yearmin = years.substr(0,4);
					var yearmax = years.substr(4,4);
					years = yearmin+","+yearmax;
					if(yearmin == yearmax){
						document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + yearmin + "年已确认收入总计详细信息";
					}else{
						document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + yearmin + "年-"+ yearmax + "年已确认收入总计详细信息";
					}
				}else if(months=="a"){	//年度整年的已确认收入
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年的已确认收入详细信息";
				}else{
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + months + "月的" + "已确认收入详细信息";
				}
			}else{
				if((dictname == null || dictname == "") && (salename == null || dictname == "") && (months.indexOf("年之后的收入确认总计") == "-1") && (months != "总计") && nd != 1){
					document.getElementById("titletext").innerHTML= "普元 " + years + "年" + months + "月的" + "预估可确认收入详细信息";
				}else if(months.indexOf("年之后的收入确认总计") != "-1"){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年之后预估可确认收入详细信息";
				}else if(months=="总计" && years.length==4){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年预估可确认收入总计详细信息";
					//预估可确认的总计状态包括未确认和流程中的
					status = "0,2";
				}else if(months=="01" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q1的" + "预估可确认收入详细信息";
					status = "0,2";
				}else if(months=="02" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q2的" + "预估可确认收入详细信息";
					status = "0,2";
				}else if(months=="03" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q3的" + "预估可确认收入详细信息";
					status = "0,2";
				}else if(months=="04" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q4的" + "预估可确认收入详细信息";
					status = "0,2";
				}else if(months=="总计" && years.length==8){
					var yearmin = years.substr(0,4);
					var yearmax = years.substr(4,4);
					years = yearmin+","+yearmax;
					if(yearmin == yearmax){
						document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + yearmin + "年预估可确认收入总计详细信息";
					}else{
						document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + yearmin + "年-"+ yearmax + "年预估可确认收入总计详细信息";
					}
					status = "0,2";
				}else if(months=="a"){	//年度整年的预估可确认收入
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年的预估可确认收入详细信息";
				}else{
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + months + "月的" + "预估可确认收入详细信息";
				}
			}
			if(months=="01" && nd==1){
				months='1,2,3';
			}else if(months=="02" && nd==1){
				months='4,5,6';
			}else if(months=="03" && nd==1){
				months='7,8,9';
			}else if(months=="04" && nd==1){
				months='10,11,12';
			}
			if(months=="a"){
				months = "总计";
			}
			var json = {obj: {orgseq:orgseq,orgseq1:orgseq1,salename1:salename1,custname1:custname1,contnum1:contnum1,revetype:revetype,salename: salename,ymonths: months,yyears: years,status: status,custname: custname,s1: "YQRJE",s2: "DESC"}};
			grid.load(json,function(){
				//grid.hideColumn(grid.getColumn(13));
			});
			//csReveForecast_grid.hideColumn(csReveForecast_grid.getColumn(6));
		}
		
		//状态
		function onGenderStatus(e) {
	    	return nui.getDictText('AME_REVESTATUS',e.value);
	    }
	    
	    //收入类型
	    function onGenderInComeType(e) {
	        return nui.getDictText('AME_REVETYPE',e.value);
	    }
	    
	    //收入确认证据
	    function onGenderReveproof(e) {
	    	return nui.getDictText('MIS_INCOMECONV',e.value);
	    }
	    
	    //流程ID
	    function onGenderProId(e){
	    	var s = "";
            s = s + '<a class="dgBtn"  href="javascript: doOperate(' + e.rowIndex + ')">'+ e.value +'</a> '; 
            if(e.value){
	            return s;
            }else{
            	return;
            }     
	    }
	    function doOperate(rowIndex) {
	    	var row = grid.getRow(rowIndex);
	    	var url = "<%= request.getContextPath() %>/bps/wfclient/task/taskView.jsp?processDefName='com.primeton.eos.income.ReveConfirm'&processInstID=" + row.processInstID;
	    	var title = "收入确认流程信息" + row.processInstID;
	    	var width = 1000;
	    	window.open(url, title, "height=500, width=1200, top=0,left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no");
	    }
	    
	    //计算毛利
    	var wqrjebhs = 0;
    	var costsb = 0;
    	var costsc = 0;
    	var wqrjebhsSum = 0;
    	var costsbSum = 0;
    	var costscSum = 0;
    	var costsbSum2 = 0;
    	var costscSum2 = 0;
        grid.on("drawcell", function (e) {
        	if (e.field == "wqrjebhs") {
                wqrjebhs = e.value;
            }
            if (e.field == "costsb") {
                costsb = e.value;
            }
            if (e.field == "costsc") {
                costsc = e.value;
            }
            if (e.field == "maoli") {
                e.cellHtml = wqrjebhs;
            }
        });
        
        
	    function onDrawSummaryCell(e) {
            var result = e.result;
            var grid = e.sender;
            //客户端汇总计算
            if (e.field == "custname") {
                e.cellHtml = "<div style='width: 140px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>合计:</span></div>";
            }
            if (e.field == "contsum") {
                e.cellHtml = "<div style='width: 83px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>" + e.cellHtml + "</span></div>";
            }
            if (e.field == "yqrje") {
                e.cellHtml = "<div style='width: 83px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>" + e.cellHtml + "</span></div>";
            }
            if (e.field == "yqrjebhs") {
                e.cellHtml = "<div style='width: 83px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>" + e.cellHtml + "</span></div>";
            }
            if (e.field == "wqrje") {
                e.cellHtml = "<div style='width: 83px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>" + e.cellHtml + "</span></div>";
            }
            if (e.field == "wqrjebhs") {
                e.cellHtml = "<div style='width: 83px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>" + e.cellHtml + "</span></div>";
            }
            if (e.field == "actsum_fc") {
                e.cellHtml = "<div style='width: 83px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>" + e.cellHtml + "</span></div>";
            }
            if (e.field == "billsummon") {
                e.cellHtml = "<div style='width: 83px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>" + e.cellHtml + "</span></div>";
            }
            if (e.field == "processsummon") {
                e.cellHtml = "<div style='width: 83px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>" + e.cellHtml + "</span></div>";
            }
            if (e.field == "endsummon") {
                e.cellHtml = "<div style='width: 83px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>" + e.cellHtml + "</span></div>";
            }
            if (e.field == "maoli") {
                if(result.objs){
                	for(var i = 0;i < result.objs.length;i ++){
                		wqrjebhsSum += result.objs[i].wqrjebhs;
                		costsbSum += result.objs[i].costsb;
                		costscSum += result.objs[i].costsc;
                	}
                	wqrjebhsSum = parseFloat(wqrjebhsSum);
                	costsbSum = parseFloat(costsbSum);
                	costscSum = parseFloat(costscSum);
                	//alert("wqrjebhsSum = " + wqrjebhsSum + ",costsbSum = " + costsbSum + ",costscSum = " + costscSum);
	                e.cellHtml = "<div style='width: 93px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>" + parseFloat(wqrjebhsSum - costsbSum - costscSum).toFixed(2) + "</span></div>";
            	}
            }
            if (e.field == "costsb") {
            	if(result.objs){
            		for(var i = 0;i < result.objs.length;i ++){
                		costsbSum2 += result.objs[i].costsb;
                	}
	                e.cellHtml = "<div style='width: 93px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>" + costsbSum2 + "</span></div>";
            	}
            }
            if (e.field == "costsc") {
            	if(result.objs){
            		for(var i = 0;i < result.objs.length;i ++){
                		costscSum2 += result.objs[i].costsc;
                	}
               		e.cellHtml = "<div style='width: 93px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>" + costscSum2 + "</span></div>";
            	}
            }
        }
        
        function onCancel(e) {
        	CloseWindow("cancel");
        }
        
        //标准方法接口定义
        function CloseWindow(action) {            
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        //导出收入明细
        function exportIncomeDetail(){
        	nui.confirm("是否确认导出收入明细？", "确定？",
            function (action) {            
                if (action == "ok") {
		        	if(status == 0){
						/* status = '0,1,2,4'; */
						status = '0,1,2';
					}
					var titletext;
					//事业部
					dictname = getUrlParam("dictname");
					//销售
					salename = getUrlParam("salename");
					//月份
					months = getUrlParam("months");
					//年度
					years = getUrlParam("years");
					//状态(3,0)
					status = getUrlParam("status");
					//所属客户
					custname = getUrlParam("custname");
					//是否年度ND
					nd = getUrlParam("nd");
					if(months < 10){
						months = "0" + months;
					}
					if(status == 3){
						if((dictname == null || dictname == "") && (salename == null || dictname == "")){
							titletext =  "普元 " + years + "年" + months + "月的" + "已确认收入详细信息";
						}else if(months.indexOf("年之后的收入确认总计") != "-1"){
							titletext = dictname + " " + salename + " " + years + "年之后已确认收入详细信息";
						}else if(months=="总计" && years.length==4){
							titletext = dictname + " " + salename + " " + years + "年已确认收入总计详细信息";
						}else if(months=="01" && nd==1){
							titletext = dictname + " " + salename + " " + years + "年" + "Q1的" + "已确认收入详细信息";
						}else if(months=="02" && nd==1){
							titletext = dictname + " " + salename + " " + years + "年" + "Q2的" + "已确认收入详细信息";
						}else if(months=="03" && nd==1){
							titletext = dictname + " " + salename + " " + years + "年" + "Q3的" + "已确认收入详细信息";
						}else if(months=="04" && nd==1){
							titletext = dictname + " " + salename + " " + years + "年" + "Q4的" + "已确认收入详细信息";
						}else if(months=="总计" && years.length==8){
							var yearmin = years.substr(0,4);
							var yearmax = years.substr(4,4);
							years = yearmin+","+yearmax;
							if(yearmin == yearmax){
								titletext = dictname + " " + salename + " " + yearmin + "年已确认收入总计详细信息";
							}else{
								titletext = dictname + " " + salename + " " + yearmin + "年-"+ yearmax + "年已确认收入总计详细信息";
							}
						}else if(months=="a"){	//年度整年的已确认收入
							titletext = dictname + " " + salename + " " + years + "年的已确认收入详细信息";
						}else{
							titletext = dictname + " " + salename + " " + years + "年" + months + "月的" + "已确认收入详细信息";
						}
						
					}else{
						if((dictname == null || dictname == "") && (salename == null || dictname == "")){
							titletext = "普元 " + years + "年" + months + "月的" + "预估可确认收入详细信息";
						}else if(months.indexOf("年之后的收入确认总计") != "-1"){
							titletext = dictname + " " + salename + " " + years + "年之后预估可确认收入详细信息";
						}else if(months=="总计" && years.length==4){
							titletext = dictname + " " + salename + " " + years + "年预估可确认收入总计详细信息";
						}else if(months=="01" && nd==1){
							titletext = dictname + " " + salename + " " + years + "年" + "Q1的" + "预估可确认收入详细信息";
						}else if(months=="02" && nd==1){
							titletext = dictname + " " + salename + " " + years + "年" + "Q2的" + "预估可确认收入详细信息";
						}else if(months=="03" && nd==1){
							titletext = dictname + " " + salename + " " + years + "年" + "Q3的" + "预估可确认收入详细信息";
						}else if(months=="04" && nd==1){
							titletext = dictname + " " + salename + " " + years + "年" + "Q4的" + "预估可确认收入详细信息";
						}else if(months=="总计" && years.length==8){
							var yearmin = years.substr(0,4);
							var yearmax = years.substr(4,4);
							years = yearmin+","+yearmax;
							if(yearmin == yearmax){
								titletext = dictname + " " + salename + " " + yearmin + "年预估可确认收入总计详细信息";
							}else{
								titletext = dictname + " " + salename + " " + yearmin + "年-"+ yearmax + "年预估可确认收入总计详细信息";
							}
						}else if(months=="a"){	//年度整年的预估可确认收入
							titletext = dictname + " " + salename + " " + years + "年的预估可确认收入详细信息";
						}else{
							titletext = dictname + " " + salename + " " + years + "年" + months + "月的" + "预估可确认收入详细信息";
						}
					}
					
					if(months=="01" && nd==1){
						months='1,2,3';
					}else if(months=="02" && nd==1){
						months='4,5,6';
					}else if(months=="03" && nd==1){
						months='7,8,9';
					}else if(months=="04" && nd==1){
						months='10,11,12';
					}
					if(months=="a"){
						months = "总计";
					}
					var json = {obj: {orgseq:orgseq,orgseq1:orgseq1,salename1:salename1,custname1:custname1,contnum1:contnum1,revetype:revetype,salename: salename,ymonths: months,yyears: years,status: status,custname: custname,s1: "YQRJE",s2: "DESC"},titletexts: {titletext: titletext}};
					grid.loading("收入成本核算明细导出中...");
					nui.ajax({
		    			url: "com.primeton.eos.ame_income.csContract.exportCsContractRecognisedIncomeDetail.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		grid.unmask();
				        	var filePath = o.downloadFile;
				        	var fileName = "收入成本核算明细";
				        	var myDate = new Date();
				        	var year = myDate.getYear();
				        	var month = myDate.getMonth()+1;
				        	var day = myDate.getDate();
				        	var hours = myDate.getHours();
				        	var minutes = myDate.getMinutes();
				        	var seconds = myDate.getSeconds();
				        	var curDateTime = year;
				        	if(month>9){
								curDateTime = curDateTime + "" + month;
							}else{
								curDateTime = curDateTime + "0" + month;
								}
				        	if(day>9){
								curDateTime = curDateTime + day;
							}else{
								curDateTime = curDateTime + "0" + day;
								}
							if(hours>9){
								curDateTime = curDateTime + hours;
							}else{
								curDateTime = curDateTime + "0" + hours;
								}
							if(minutes>9){
								curDateTime = curDateTime + minutes;
							}else{
								curDateTime = curDateTime + "0" + minutes;
								}
							if(seconds>9){
								curDateTime = curDateTime + seconds;
							}else{
								curDateTime = curDateTime + "0" + seconds;
								}
							fileName = fileName + "_" + curDateTime + ".xls";
							var frm = document.getElementById("viewlist1");
				        	frm.elements["downloadFile"].value = filePath;
				        	frm.elements["fileName"].value = fileName;
						    frm.submit();
				        },
				        error: function () {
				        	alert("error");
				        }
					});
				}else{
					return;
				}
            });
        }
        
	</script>
</body>
</html>