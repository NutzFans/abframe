<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>人力投入tab页面</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<fieldset style="border:solid 1px #aaa;padding:1px;width: 1000px;">
    	<legend>现有人力月度成本</legend>
		<div id="grid_exitEmployee" class="nui-datagrid" style="width: 1080px;height: auto;" dataField="deptEmpBudgets" allowAlternating="true"
			url="com.primeton.eos.ame_budget.personInput.queryAllExitEmployee.biz.ext" showPager="false" showSummaryRow="true" ondrawsummarycell="doCountSumExitEmployee"><!-- showSummaryRow="true" ondrawsummarycell="doCountSum" -->
			<div property="columns">
				<div field="type" width="60" align="center" headerAlign="center" >分类</div>
				<div field="month1" width="75" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">1月</div>
				<div field="month2" width="75" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">2月</div>
				<div field="month3" width="75" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">3月</div>
				<div field="month4" width="75" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">4月</div>
				<div field="month5" width="75" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">5月</div>
				<div field="month6" width="75" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">6月</div>
				<div field="month7" width="75" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">7月</div>
				<div field="month8" width="75" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">8月</div>
				<div field="month9" width="75" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">9月</div>
				<div field="month10" width="75" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">10月</div>
				<div field="month11" width="75" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">11月</div>
				<div field="month12" width="75" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">12月</div>
				<div field="yearMoney" width="110" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">全年</div>
			</div>
		</div>
    </fieldset>
	<fieldset style="border:solid 1px #aaa;padding:1px;width: 1080px;">
    	<legend>招聘人力月度成本</legend>
    	<div style="width: 1080px;">
	        <div style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <span id="editbutton"><a class="nui-button" id="addOrEditRecurit" iconCls="icon-edit"  onclick="modifyRecruit()" >增加/编辑招聘人力月度成本</a></span>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
	    <div id="grid_recruit" class="nui-datagrid" style="width: 1080px;height: auto;" dataField="deptStaffRebuds" allowAlternating="true"
    	 url="com.primeton.eos.ame_budget.personInput.queryAllRecurit.biz.ext" showPager="false" showSummaryRow="true" ondrawsummarycell="doCountSumRecruit">
			<div property="columns">
				<div field="type" width="60" align="center" headerAlign="center" >分类</div>
				<div field="month1" width="70" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">1月</div>
				<div field="month2" width="70" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">2月</div>
				<div field="month3" width="70" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">3月</div>
				<div field="month4" width="70" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">4月</div>
				<div field="month5" width="70" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">5月</div>
				<div field="month6" width="70" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">6月</div>
				<div field="month7" width="70" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">7月</div>
				<div field="month8" width="70" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">8月</div>
				<div field="month9" width="70" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">9月</div>
				<div field="month10" width="70" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">10月</div>
				<div field="month11" width="70" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">11月</div>
				<div field="month12" width="70" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">12月</div>
				<div field="yearMoney" width="95" align="right" headerAlign="center" summaryType="sum" renderer="renderDelZero">全年</div>
			</div>
		</div>
    </fieldset>
    <fieldset style="border:solid 1px #aaa;padding:1px;width: 1000px;">
    	<legend>总人头数</legend>
		<div id="grid_peopleCont" class="nui-datagrid" style="width: 1080px;height: auto;" dataField="monthsOfPeoples" allowAlternating="true" 
	    		url="com.primeton.eos.ame_budget.personInput.queryAllpeopleCont.biz.ext" showPager="false" showSummaryRow="true" ondrawsummarycell="doCountSum">
				<div property="columns">
					<div field="dictname" width="60" align="center" headerAlign="center" >分类</div>
					<div field="sumPerson1" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">1月</div>
					<div field="sumPerson2" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">2月</div>
					<div field="sumPerson3" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">3月</div>
					<div field="sumPerson4" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">4月</div>
					<div field="sumPerson5" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">5月</div>
					<div field="sumPerson6" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">6月</div>
					<div field="sumPerson7" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">7月</div>
					<div field="sumPerson8" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">8月</div>
					<div field="sumPerson9" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">9月</div>
					<div field="sumPerson10" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">10月</div>
					<div field="sumPerson11" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">11月</div>
					<div field="sumPerson12" width="70" align="center" headerAlign="center"  numberFormat="n1" dataType="int" summaryType="sum" >12月</div>
					<div field="sumPerson" width="95" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">全年</div>
				</div>
			</div>
		</div>
    </fieldset>
	<fieldset style="border:solid 1px #aaa;padding:3px;width:width: 1080px;">
    <legend>公摊成本</legend>
    	<!-- <div style="width: 1080px">
	    	<div style="width: 99.2%;" class="nui-toolbar">
		                         人数（人）
		    </div>
	    	<div id="grid_peopleCont" class="nui-datagrid" style="width: 1080px;height: auto;" dataField="monthsOfPeoples" allowAlternating="true" 
	    		url="com.primeton.eos.ame_budget.personInput.queryAllpeopleCont.biz.ext" showPager="false" showSummaryRow="true" ondrawsummarycell="doCountSum">
				<div property="columns">
					<div field="dictname" width="60" align="center" headerAlign="center" >分类</div>
					<div field="sumPerson1" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">1月</div>
					<div field="sumPerson2" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">2月</div>
					<div field="sumPerson3" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">3月</div>
					<div field="sumPerson4" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">4月</div>
					<div field="sumPerson5" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">5月</div>
					<div field="sumPerson6" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">6月</div>
					<div field="sumPerson7" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">7月</div>
					<div field="sumPerson8" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">8月</div>
					<div field="sumPerson9" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">9月</div>
					<div field="sumPerson10" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">10月</div>
					<div field="sumPerson11" width="70" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">11月</div>
					<div field="sumPerson12" width="70" align="center" headerAlign="center"  numberFormat="n1" dataType="int" summaryType="sum" >12月</div>
					<div field="sumPerson" width="95" align="center" headerAlign="center"  numberFormat="n1" summaryType="sum">全年</div>
				</div>
			</div>
		</div> -->
		<!-- <br/> -->
    	<div style="width: 1080px">
	    	<div style="width:99.2%;" class="nui-toolbar">
		                         成本（元）
		    </div>
	    	<div id="grid_shareFee" class="nui-datagrid" style="width: 1080px;height:auto;" dataField="monthsOfMoney" allowAlternating="true" 
	    	 url="com.primeton.eos.ame_budget.personInput.queryAllMoney.biz.ext" showPager="false" showSummaryRow="true" ondrawsummarycell="doCountSum">
				<div property="columns">
					<div field="dictname" width="60" align="center" headerAlign="center" >分类</div>
					<div field="sumSharmoney1" width="70" align="right" headerAlign="center" summaryType="sum" >1月</div>
					<div field="sumSharmoney2" width="70" align="right" headerAlign="center" summaryType="sum" >2月</div>
					<div field="sumSharmoney3" width="70" align="right" headerAlign="center" summaryType="sum" >3月</div>
					<div field="sumSharmoney4" width="70" align="right" headerAlign="center" summaryType="sum" >4月</div>
					<div field="sumSharmoney5" width="70" align="right" headerAlign="center" summaryType="sum" >5月</div>
					<div field="sumSharmoney6" width="70" align="right" headerAlign="center" summaryType="sum" >6月</div>
					<div field="sumSharmoney7" width="70" align="right" headerAlign="center" summaryType="sum" >7月</div>
					<div field="sumSharmoney8" width="70" align="right" headerAlign="center" summaryType="sum" >8月</div>
					<div field="sumSharmoney9" width="70" align="right" headerAlign="center" summaryType="sum" >9月</div>
					<div field="sumSharmoney10" width="70" align="right" headerAlign="center" summaryType="sum">10月</div>
					<div field="sumSharmoney11" width="70" align="right" headerAlign="center" summaryType="sum">11月</div>
					<div field="sumSharmoney12" width="70" align="right" headerAlign="center" summaryType="sum">12月</div>
					<div field="sumSharmoney" width="95" align="right" headerAlign="center" summaryType="sum">全年</div>
				</div>
			</div>
		</div>
    </fieldset>
	<script type="text/javascript">
    	nui.parse();
    	var grid_exitEmployee = nui.get("grid_exitEmployee");
    	var grid_recruit = nui.get("grid_recruit");
    	var grid_peopleCont = nui.get("grid_peopleCont");
    	var grid_shareFee = nui.get("grid_shareFee");
    	//事业部（或普元或业务单元）
    	var orgid = '<%=request.getParameter("orgid") %>';
    	//事业部名称
    	var orgname = '<%=request.getParameter("orgname") %>';
    	//年份
    	var year = '<%=request.getParameter("year") %>';
    	//costtype服务为1，
    	var costtype = '<%=request.getParameter("costtype") %>';
    	var costtypename = '<%=request.getParameter("costtypename") %>';
    	//初始化数据事业部查看权限（业务单元、或者事业部数据）orgFlag是String 类型
    	var orgFlag = '<%=request.getParameter("orgFlag") %>';
//     	alert("orgid"+orgid);
//     	alert("orgname"+orgname);
//     	alert("year"+year);
//     	alert("costtype"+costtype);
//     	alert("costtypename"+costtypename);
//     	alert("orgFlag"+orgFlag);
//     	alert("budstatus"+budstatus);
    	if(orgFlag=="1"||orgFlag=="2"){
    		document.getElementById("editbutton").innerHTML="<a class='nui-button' id='addOrEditRecurit' iconCls='icon-search' onclick='modifyRecruit()' >查看招聘人力月度成本</a>";
    	}
    	//初始化现有人力方法
    	initExitEmployee();
    	//初始化招聘调用方法
    	initRecurit();
    	//初始化分摊调用方法
    	initShareFee();
		//现有人力页面加载
		function initExitEmployee(){
			grid_exitEmployee.load({"orgid":orgid,"year":year,"costtype":costtype,"status":"1","orgFlag":orgFlag});
		}
		//初始化招聘调用方法
		function initRecurit(){
			grid_recruit.load({"orgid":orgid,"year":year,"costtype":costtype,"status":"2","orgFlag":orgFlag});
		}
		//分摊人员
		function initShareFee(){
			grid_peopleCont.load({"orgid":orgid,"year":year,"costtype":costtype,"orgFlag":orgFlag});
			grid_shareFee.load({"orgid":orgid,"year":year,"costtype":costtype,"orgFlag":orgFlag});
		}
		//新增编辑预算人员招聘
		function modifyRecruit(){
			//锁定解锁
    		var budstatus = "";
			//点击
			nui.ajax({
                url: "com.primeton.eos.ame_budget.common.lockOrUnlock.biz.ext",
                data: {year:year},
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	budstatus = text.budstatus;//1锁定、2解锁
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
			nui.open({
                url: "<%=request.getContextPath() %>/ame_budget/deptBudget/modifyRecruit.jsp",
                title: year+"年度招聘人力月度成本", 
				width: 1000,
	            height: 500,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = nui.decode({orgid:orgid,year:year,orgname:orgname,costtype:costtype,orgFlag:orgFlag,budstatus:budstatus,costtypename:costtypename});
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                	//重新加载招聘table
                    initRecurit();
                    //招聘人力变动引起公摊费用变更，刷新
                    initShareFee();
                    //父页面的汇总刷新
                    parent.reload();
                }
            });
		}
		
		//去除全年展示的0元素（存量和招聘）或者公摊金额
		function renderDelZero(e){
			if(e.value==0){
				return;
			}
			if(e.field=="sumPerson"||e.field=="sumPerson1"||e.field=="sumPerson2"||e.field=="sumPerson3"||e.field=="sumPerson4"||e.field=="sumPerson5"||e.field=="sumPerson6"||e.field=="sumPerson7"||e.field=="sumPerson8"||e.field=="sumPerson9"||e.field=="sumPerson10"||e.field=="sumPerson11"||e.field=="sumPerson12"){
				return e.value;
			}
			if(e.record.type=="当月人数"){
				return formatNumber(e.value,'#,##.#');
			}else{
				return formatNumber(e.value,'#,##');
			}
		}
		function doCountSumExitEmployee(e){  
           	if(e.value){
	           	if (e.field=="month1") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptEmpBudgets[0].month1,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month2") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptEmpBudgets[0].month2,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month3") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptEmpBudgets[0].month3,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month4") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptEmpBudgets[0].month4,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month5") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptEmpBudgets[0].month5,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month6") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptEmpBudgets[0].month6,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month7") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptEmpBudgets[0].month7,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month8") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptEmpBudgets[0].month8,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month9") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptEmpBudgets[0].month9,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month10") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptEmpBudgets[0].month10,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month11") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptEmpBudgets[0].month11,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month12") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptEmpBudgets[0].month12,'#,##') + "</b></div>";
	            }
	           	if (e.field=="yearMoney") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptEmpBudgets[0].yearMoney,'#,##') + "</b></div>";
	            }
            }
        }
		function doCountSumRecruit(e){  
           	if(e.value){
	           	if (e.field=="month1") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptStaffRebuds[0].month1,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month2") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptStaffRebuds[0].month2,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month3") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptStaffRebuds[0].month3,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month4") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptStaffRebuds[0].month4,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month5") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptStaffRebuds[0].month5,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month6") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptStaffRebuds[0].month6,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month7") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptStaffRebuds[0].month7,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month8") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptStaffRebuds[0].month8,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month9") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptStaffRebuds[0].month9,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month10") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptStaffRebuds[0].month10,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month11") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptStaffRebuds[0].month11,'#,##') + "</b></div>";
	            }
	           	if (e.field=="month12") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptStaffRebuds[0].month12,'#,##') + "</b></div>";
	            }
	           	if (e.field=="yearMoney") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value-e.result.deptStaffRebuds[0].yearMoney,'#,##') + "</b></div>";
	            }
            }
        }
        function doCountSum(e){ 
       		if(e.value){ 
	            if (e.field=="sumPerson"||e.field=="sumPerson1"||e.field=="sumPerson2"||e.field=="sumPerson3"||e.field=="sumPerson4"||e.field=="sumPerson5"||e.field=="sumPerson6"||e.field=="sumPerson7"||e.field=="sumPerson8"||e.field=="sumPerson9"||e.field=="sumPerson10"||e.field=="sumPerson11"||e.field=="sumPerson12") {
	                e.cellHtml = "<div align='center'><b>" + e.cellHtml + "</b></div>";
	            }
	           	if (e.field == "sumSharmoney"||e.field == "sumSharmoney1"||e.field == "sumSharmoney2"||e.field == "sumSharmoney3"||e.field == "sumSharmoney4"||e.field == "sumSharmoney5"||e.field == "sumSharmoney6"||e.field == "sumSharmoney7"||e.field == "sumSharmoney8"||e.field == "sumSharmoney9"||e.field == "sumSharmoney10"||e.field == "sumSharmoney11"||e.field == "sumSharmoney12") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
	            }
            }
        }
        //新增编辑现有人员月度(暂时不用)
		function modifyExitEmployee(){
			nui.open({
                url: "<%=request.getContextPath() %>/ame_budget/deptBudget/modifyExitEmployee.jsp",
                title: year+"年度现有人力月度成本", 
				width: 900,
	            height: 500,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = {orgid:orgid,year:year,orgname:orgname,costtype:costtype};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                	//重新加载招聘table
                    initExitEmployee();
                }
            });
		}
  </script>
</body>
</html>