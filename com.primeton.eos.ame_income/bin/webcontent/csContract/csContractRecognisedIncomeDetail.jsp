<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuyl
  - Date: 2016-08-23 16:30:49
  - Description:
-->
<head>
	<title>合同收入金额详情</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<!-- 
		通过点击“部门合同收入确认表”中汇总的金额数据进入
		列表显示：合同编号、合同名称、合同金额、确认次数代码、确认金额、确认比例、收入类型、状态、收入实际确认日期
		（列表下方提供金额汇总）——与表格数据应该一致
	 -->
	 <div>
	 	<fieldset style="width:2250px;border:solid 1px #aaa;padding:3px;">
	 	<legend><span id="titletext" style="font-size: 12px;">部门合同收入确认明细信息</span></legend>
	 		
	        <div id="datagrid1" class="nui-datagrid" style="width:100%;height: auto;" allowResize="true" dataField="objs" 
		    	multiSelect="true" allowAlternating="true" showpager="false" ondrawsummarycell="onDrawSummaryCell" 
		    	showSummaryRow="true" virtualScroll="true" allowHeaderWrap="true" allowSortColumn="false" 
		    	onheadercellclick="headerSort" 
		    	url="com.primeton.eos.ame_income.csContract.queryCsContractRecognisedIncomeDetail.biz.ext">
				<div property="columns">
					<div field="dictname" width="100" align="left" headerAlign="center" allowSort="true">事业部</div>
					<div field="salename" width="70" align="center" headerAlign="center" allowSort="true">销售</div>
					<div field="contnum" width="90" align="left" headerAlign="center" allowSort="true" renderer="detailCont">合同编号</div>
					<div field="projectname" width="150" align="left" headerAlign="center" allowSort="true">合同名称</div>
					<div field="custname" width="200" align="left" headerAlign="center" allowSort="true">所属客户</div>
					<div field="contsum" width="90" summaryType="sum" dataType="currency" align="right" headerAlign="center" >合同金额</div>
					<div field="reveno" width="40" align="center" headerAlign="center" >收入编号</div>
					<div field="yqrje" width="90" summaryType="sum" dataType="currency" align="right" headerAlign="center" >实际确认金额（含税）</div>
					<div field="yqrjebhs" width="90" summaryType="sum" dataType="currency" align="right" headerAlign="center" >实际确认金额（不含税）</div>
					<div field="confirmday" width="80" align="center" dateFormat="yyyy-MM-dd" headerAlign="center" >财务确认日期</div>
					<div field="fcrate" width="60" numberFormat="p1" align="center" headerAlign="center" >收款比例</div>
					<div field="fcreverate2" width="60" numberFormat="p1" align="center" headerAlign="center" >实际确认比例</div>
					<div field="revetype" width="120" renderer="onGenderInComeType" align="left" headerAlign="center" >收入类型</div>
					<div field="status" width="95" renderer="onGenderStatus" align="center" headerAlign="center" >状态</div>
					<div field="revetimedesc" width="130" align="left" headerAlign="center" >收入确认时点描述</div>
					<div field="actreveproof" width="130" renderer="onGenderReveproof" align="left" headerAlign="center" >实际收入确认证据</div>
					<div field="processInstID" width="50" align="center"headerAlign="center" renderer="onGenderProId" >流程ID</div>
					<div field="memo" width="192" align="left" headerAlign="center" >说明</div>
					<div width="auto"></div>
				</div>
			</div>
		</fieldset>
	</div>
	<div style="text-align:center;padding:10px;width:2235px;" class="nui-toolbar">
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
		<a class="nui-button" onclick="exportIncomeDetail" iconCls="icon-download" style="width:135px;" id="exportButton">导出收入</a>	
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
		//月份
		var months = getUrlParam("months");
		//年度
		var years = getUrlParam("years");
		//状态(3,0)
		var status = getUrlParam("status");
		//所属客户
		var custname = getUrlParam("custname");
		//部门seq
		var orgseq = getUrlParam("orgseq");
		//部门seqsearch
		var orgseqsearch = getUrlParam("orgseqsearch");
		//客户search
		var custnamesearch = getUrlParam("custnamesearch");
		//销售search
		var salenamesearch = getUrlParam("salenamesearch");
		//是否年度ND
		var nd = getUrlParam("nd");
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
			if(status == 0){
				status = "0";
			}else if(status == 2){
				status = "2";
			}
			//alert(status + "|" + months + "|" + years.length + "|" + nd);
			if(dictname == null){
				dictname ='';
			}
			if(status == 3 || status == 2){
				if((dictname == null || dictname == "" || dictname == "null") && (salename == null || dictname == "") && (months.indexOf("年之后的收入确认总计") == "-1") && (months != "总计") && nd != 1){
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
			}else if(status == 0){
				if((dictname == null || dictname == "" || dictname == "null") && (salename == null || dictname == "") && (months.indexOf("年之后的收入确认总计") == "-1") && (months != "总计") && nd != 1){
					document.getElementById("titletext").innerHTML=  "普元 " + years + "年" + months + "月的" + "预估可确认收入详细信息";
				}else if(months.indexOf("年之后的收入确认总计") != "-1"){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年之后预估可确认收入详细信息";
				}else if(months=="总计" && years.length==4){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年预估可确认收入总计详细信息";
				}else if(months=="01" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q1的" + "预估可确认收入详细信息";
				}else if(months=="02" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q2的" + "预估可确认收入详细信息";
				}else if(months=="03" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q3的" + "预估可确认收入详细信息";
				}else if(months=="04" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q4的" + "预估可确认收入详细信息";
				}else if(months=="总计" && years.length==8){
					var yearmin = years.substr(0,4);
					var yearmax = years.substr(4,4);
					years = yearmin+","+yearmax;
					if(yearmin == yearmax){
						document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + yearmin + "年预估可确认收入总计详细信息";
					}else{
						document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + yearmin + "年-"+ yearmax + "年预估可确认收入总计详细信息";
					}
				}else if(months=="a"){	//年度整年的已确认收入
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年的预估可确认收入详细信息";
				}else{
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + months + "月的" + "预估可确认收入详细信息";
				}
			}
			else{
				if((dictname == null || dictname == "" || dictname == "null") && (salename == null || dictname == "") && (months.indexOf("年之后的收入确认总计") == "-1") && (months != "总计") && nd != 1){
					document.getElementById("titletext").innerHTML= "普元 " + years + "年" + months + "月的" + "预估可确认收入详细信息";
				}else if(months.indexOf("年之后的收入确认总计") != "-1"){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年之后预估可确认收入详细信息";
					status = "0,2";
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
			var statuslist = "";
			if(status == "3"){
				statuslist = "3";
			}else if (status == "0" || status == "0,2" || status == "0,1,2"){
				statuslist = "0,2,8,7";
			}else{
				statuslist = "2";
			}
			var json = {obj: {dictname: dictname,salename: salename,ymonths: months,yyears: years,status: statuslist,custname: custname,orgseq:orgseq,orgseqsearch:orgseqsearch,custnamesearch:custnamesearch,salenamesearch:salenamesearch,s1: "YQRJE",s2: "DESC"}};
			//alert(nui.encode(json));
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
        }
        function onCancel(e) {
        	CloseWindow("cancel");
        	/* nui.showMessageBox({
	            title: "关闭提示",
	            iconCls: "nui-messagebox-question",
	            buttons: ["yes", "no"],
	            message: "是否关闭？",
	            callback: function (action) {
	                if(action=="yes"){
	                	CloseWindow("cancel");
	                }
	            }
	        }); */
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
						status = "0";
					}else if(status == 2){
						status = "2";
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
					//事业部seq
					orgseq = getUrlParam("orgseq");
					//部门seqsearch
					var orgseqsearch = getUrlParam("orgseqsearch");
					//客户search
					var custnamesearch = getUrlParam("custnamesearch");
					//销售search
					var salenamesearch = getUrlParam("salenamesearch");
					//是否年度ND
					nd = getUrlParam("nd");
					if(months < 10){
						months = "0" + months;
					}
					//alert("status = " + status + "，months = " + months);
					if(status == 3 || status == 2){
						if((dictname == null || dictname == "") && (salename == null || dictname == "") && (months.indexOf("年之后的收入确认总计") == "-1") && (months != "总计") && nd != 1){
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
						
					}else if(status == 0){
						if((dictname == null || dictname == "") && (salename == null || dictname == "") && (months.indexOf("年之后的收入确认总计") == "-1") && (months != "总计") && nd != 1){
							titletext =  "普元 " + years + "年" + months + "月的" + "预估可确认收入详细信息";
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
						}else if(months=="a"){	//年度整年的已确认收入
							titletext = dictname + " " + salename + " " + years + "年的预估可确认收入详细信息";
						}else{
							titletext = dictname + " " + salename + " " + years + "年" + months + "月的" + "预估可确认收入详细信息";
						}
					}
					else{
						if((dictname == null || dictname == "") && (salename == null || dictname == "") && (months.indexOf("年之后的收入确认总计") == "-1") && (months != "总计") && nd != 1){
							titletext = "普元 " + years + "年" + months + "月的" + "预估可确认收入详细信息";
						}else if(months.indexOf("年之后的收入确认总计") != "-1"){
							titletext = dictname + " " + salename + " " + years + "年之后预估可确认收入详细信息";
							status = "0,2";
						}else if(months=="总计" && years.length==4){
							titletext = dictname + " " + salename + " " + years + "年预估可确认收入总计详细信息";
							status = "0,2";
						}else if(months=="01" && nd==1){
							titletext = dictname + " " + salename + " " + years + "年" + "Q1的" + "预估可确认收入详细信息";
							status = "0,2";
						}else if(months=="02" && nd==1){
							titletext = dictname + " " + salename + " " + years + "年" + "Q2的" + "预估可确认收入详细信息";
							status = "0,2";
						}else if(months=="03" && nd==1){
							titletext = dictname + " " + salename + " " + years + "年" + "Q3的" + "预估可确认收入详细信息";
							status = "0,2";
						}else if(months=="04" && nd==1){
							titletext = dictname + " " + salename + " " + years + "年" + "Q4的" + "预估可确认收入详细信息";
							status = "0,2";
						}else if(months=="总计" && years.length==8){
							var yearmin = years.substr(0,4);
							var yearmax = years.substr(4,4);
							years = yearmin+","+yearmax;
							if(yearmin == yearmax){
								titletext = dictname + " " + salename + " " + yearmin + "年预估可确认收入总计详细信息";
							}else{
								titletext = dictname + " " + salename + " " + yearmin + "年-"+ yearmax + "年预估可确认收入总计详细信息";
							}
							status = "0,2";
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
					var statuslist = "";
					if(status == "3"){
						statuslist = "3";
					}else if (status == "0" || status == "0,2" || status == "0,1,2"){
						statuslist = "0,2,8,7";
					}else{
						statuslist = "2";
					}
					var json = {obj: {dictname: dictname,salename: salename,ymonths: months,yyears: years,status: statuslist,custname: custname,orgseq:orgseq,orgseqsearch:orgseqsearch,custnamesearch:custnamesearch,salenamesearch:salenamesearch,s1: "YQRJE",s2: "DESC"},titletexts: {titletext: titletext}};
					grid.loading("收入明细导出中...");
					nui.ajax({
		    			url: "com.primeton.eos.ame_income.csContract.exportCsContractRecognisedIncomeDetail.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		grid.unmask();
				        	var filePath = o.downloadFile;
				        	var fileName = "收入明细";
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
	    
	    var sortOrderTime = 0;
	    function headerSort(e){
	    	var sortFiled = e.column.field;
        	if(sortFiled == "wqrje" || sortFiled == "yqrje" || sortFiled == "wqrjebhs" || sortFiled == "yqrjebhs"){
        		return;
        	}
        	if(sortOrderTime == 0){
	        	sortOrder = "DESC";
	        	sortOrderTime = 1;
        	}else{
        		sortOrder = "ASC";
        		sortOrderTime = 0;
        	}
        	sortFiled = "bb." + sortFiled;
	    	if(status == 0){
				status = "0";
			}else if(status == 2){
				status = "2";
			}
			//alert(status + "|" + months + "|" + years.length + "|" + nd);
			if(status == 3 || status == 2){
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
			}else if(status == 0) {
				if((dictname == null || dictname == "") && (salename == null || dictname == "") && (months.indexOf("年之后的收入确认总计") == "-1") && (months != "总计") && nd != 1){
					document.getElementById("titletext").innerHTML=  "普元 " + years + "年" + months + "月的" + "预估可确认收入详细信息";
				}else if(months.indexOf("年之后的收入确认总计") != "-1"){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年之后预估可确认收入详细信息";
				}else if(months=="总计" && years.length==4){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年预估可确认收入总计详细信息";
				}else if(months=="01" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q1的" + "预估可确认收入详细信息";
				}else if(months=="02" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q2的" + "预估可确认收入详细信息";
				}else if(months=="03" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q3的" + "预估可确认收入详细信息";
				}else if(months=="04" && nd==1){
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + "Q4的" + "预估可确认收入详细信息";
				}else if(months=="总计" && years.length==8){
					var yearmin = years.substr(0,4);
					var yearmax = years.substr(4,4);
					years = yearmin+","+yearmax;
					if(yearmin == yearmax){
						document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + yearmin + "年预估可确认收入总计详细信息";
					}else{
						document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + yearmin + "年-"+ yearmax + "年预估可确认收入总计详细信息";
					}
				}else if(months=="a"){	//年度整年的已确认收入
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年的预估可确认收入详细信息";
				}else{
					document.getElementById("titletext").innerHTML= dictname + " " + salename + " " + years + "年" + months + "月的" + "预估可确认收入详细信息";
				}
			}
			else{
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
			var statuslist = "";
			if(status == "3"){
				statuslist = "3";
			}else if (status == "0" || status == "0,2" || status == "0,1,2"){
				statuslist = "0,2,8,7";
			}else{
				statuslist = "2";
			}
			var json = {obj: {dictname: dictname,salename: salename,ymonths: months,yyears: years,status: statuslist,custname: custname,orgseq:orgseq,orgseqsearch:orgseqsearch,custnamesearch:custnamesearch,salenamesearch:salenamesearch,"sortFiled": sortFiled,"sortOrder": sortOrder}};
			alert(nui.encode(json));
			grid.load(json,function(){
				//grid.hideColumn(grid.getColumn(13));
			});
	    }
	    //合同详细信息
        function detailCont(e){
        	return "<a href='javascript:void(0)' onclick='detailCont1();' title='点击查看合同信息'>" + e.value + "</a>";
        }
        function detailCont1(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/newcont/newCont/contractView.jsp?contractid=" + selectRow.contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
	    }
	</script>
</body>
</html>