<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>


<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript">
/*
 * EOS
 */
 function doUpdateID(){
	alert("确定要更新？");
	var myAjax = new Ajax("com.primeton.eos.common.reportDeal.updataPS.biz");
	myAjax.submit();
	var returnvalue =myAjax.getValue("root/data/result");
	if(returnvalue == "1"){
		alert("更新数据成功！");
	}else if(returnvalue == "0"){
		alert("更新数据失败，请联系管理员！");
	}	
}

 function doUpdateIDRLD(){
	alert("确定要更新？");
	var myAjax = new Ajax("com.primeton.eos.common.reportDeal.updataRLD.biz");
	myAjax.submit();
	var returnvalue =myAjax.getValue("root/data/result");
	if(returnvalue == "1"){
		alert("更新数据成功！");
	}else if(returnvalue == "0"){
		alert("更新数据失败，请联系管理员！");
	}	
}

function impDeptBudgetData(year){
if(!year){
	alert("请输入年份点击查询后再导！");
	return;
}
	maskWindow();
	if(confirm("确定要导入"+year+"年"+"预算数据？")){
	var myAjax = new Ajax("com.primeton.eos.ame_budget.deptbudget.impBudgetData.biz");
	myAjax.addParam("year",year);
	myAjax.submit();
	var returnvalue =myAjax.getValue("root/data/result");
	if(returnvalue == "1"){
		alert("预算数据导入成功！");
		unMaskWindow();
	}else if(returnvalue == "0"){
		alert("预算数据导入失败，请联系管理员！");
		unMaskWindow();
	}	
	}
}

function PL_export(year,action)
{
    alert("导出时间较长，请耐心等待。。。");
	var myAjax = new Ajax("com.primeton.xbb.importExcel.exportPL.exportPLAll.biz");
	myAjax.addParam("year",year);
	myAjax.addParam("reportFile","<%=request.getSession().getServletContext().getRealPath("/reportFiles/"+request.getParameter( "raq" )).replace("\\","\\\\")  %>");
	myAjax.addParam("action",action);
	myAjax.submit();
	var returnvalue =myAjax.getValue("root/data/result");
	var returnurl =myAjax.getValue("root/data/url");
	if(returnvalue == "1"){
		alert("导出数据成功！");
		var filePath = returnurl;
    	var fileName = "PlAll";
    	var myDate = new Date();
    	var year = myDate.getYear();
    	var month = myDate.getMonth()+1;
    	var day = myDate.getDate();
    	var hours = myDate.getHours();
    	var minutes = myDate.getMinutes();
    	var seconds = myDate.getSeconds();
    	var curDateTime = year;
    	if(month>9)
			curDateTime = curDateTime + "" + month;
		else
			curDateTime = curDateTime + "0" + month;
    	if(day>9)
			curDateTime = curDateTime + "" + day;
		else
			curDateTime = curDateTime + "0" + day;
		if(hours>9)
			curDateTime = curDateTime + "" + hours;
		else
			curDateTime = curDateTime + "0" + hours;
		if(minutes>9)
			curDateTime = curDateTime + "" + minutes;
		else
			curDateTime = curDateTime + "0" + minutes;
		if(seconds>9)
			curDateTime = curDateTime + "" + seconds;
		else
			curDateTime = curDateTime + "0" + seconds;
		fileName = fileName + curDateTime + ".xls";
		var frm = document.getElementById("viewlist1");
    	frm.elements["downloadFile"].value = filePath;
    	frm.elements["fileName"].value = fileName;
	    frm.submit();
		//window.open("com.primeton.components.web.fileupload.getfileByAbsoPath.flow?fileType=xls文件&fileName=PL表汇总.xls&filePath=" + returnurl);
	}else if(returnvalue == "0"){
		alert("导出数据失败！");
	}
}

function sales_performence_export(year,startmonth,endmonth,orgseq,userid,action)
{
    alert("导出时间较长，请耐心等待。。。");
	var myAjax = new Ajax("com.primeton.xbb.importExcel.exportPL.exportSalesPerformence.biz");
	myAjax.addParam("year",year);
	myAjax.addParam("startmonth",startmonth);
	myAjax.addParam("endmonth",endmonth);
	myAjax.addParam("orgseq",orgseq);
	myAjax.addParam("userid",userid);
	myAjax.addParam("reportFile","<%=request.getSession().getServletContext().getRealPath("/reportFiles/"+request.getParameter( "raq" )).replace("\\","\\\\")  %>");
	myAjax.addParam("action",action);
	myAjax.submit();
	var returnvalue =myAjax.getValue("root/data/a");
	var returnurl =myAjax.getValue("root/data/url");
	if(returnvalue == "1"){
		alert("导出数据成功！");
		var filePath = returnurl;
    	var fileName = "SalesPerformence";
    	var myDate = new Date();
    	var year = myDate.getYear();
    	var month = myDate.getMonth()+1;
    	var day = myDate.getDate();
    	var hours = myDate.getHours();
    	var minutes = myDate.getMinutes();
    	var seconds = myDate.getSeconds();
    	var curDateTime = year;
    	if(month>9)
			curDateTime = curDateTime + "" + month;
		else
			curDateTime = curDateTime + "0" + month;
    	if(day>9)
			curDateTime = curDateTime + "" + day;
		else
			curDateTime = curDateTime + "0" + day;
		if(hours>9)
			curDateTime = curDateTime + "" + hours;
		else
			curDateTime = curDateTime + "0" + hours;
		if(minutes>9)
			curDateTime = curDateTime + "" + minutes;
		else
			curDateTime = curDateTime + "0" + minutes;
		if(seconds>9)
			curDateTime = curDateTime + "" + seconds;
		else
			curDateTime = curDateTime + "0" + seconds;
		fileName = fileName + curDateTime + ".xls";
		var frm = document.getElementById("viewlist1");
    	frm.elements["downloadFile"].value = filePath;
    	frm.elements["fileName"].value = fileName;
	    frm.submit();
		//window.open("com.primeton.components.web.fileupload.getfileByAbsoPath.flow?fileType=xls文件&fileName=SalesPerformence.xls&filePath=" + returnurl);
	}else if(returnvalue == "0"){
		alert("导出数据失败！");
	}
}

function deptBudget_export(orgid,year,action){
	alert("导出时间较长，请耐心等待。。。");
	var myAjax = new Ajax("com.primeton.xbb.importExcel.exportPL.exportDeptBudget.biz");
	myAjax.addParam("year",year);
	myAjax.addParam("orgid",orgid);
	myAjax.addParam("reportFile","<%=request.getSession().getServletContext().getRealPath("/reportFiles/"+request.getParameter( "raq" )).replace("\\","\\\\")  %>");
	myAjax.addParam("action",action);
	myAjax.submit();
	var returnvalue =myAjax.getValue("root/data/a");
	var returnurl =myAjax.getValue("root/data/url");
	if(returnvalue == "1"){
		alert("导出数据成功！");
		var filePath = returnurl;
    	var fileName = "DeptBudget";
    	var myDate = new Date();
    	var year = myDate.getYear();
    	var month = myDate.getMonth()+1;
    	var day = myDate.getDate();
    	var hours = myDate.getHours();
    	var minutes = myDate.getMinutes();
    	var seconds = myDate.getSeconds();
    	var curDateTime = year;
    	if(month>9)
			curDateTime = curDateTime + "" + month;
		else
			curDateTime = curDateTime + "0" + month;
    	if(day>9)
			curDateTime = curDateTime + "" + day;
		else
			curDateTime = curDateTime + "0" + day;
		if(hours>9)
			curDateTime = curDateTime + "" + hours;
		else
			curDateTime = curDateTime + "0" + hours;
		if(minutes>9)
			curDateTime = curDateTime + "" + minutes;
		else
			curDateTime = curDateTime + "0" + minutes;
		if(seconds>9)
			curDateTime = curDateTime + "" + seconds;
		else
			curDateTime = curDateTime + "0" + seconds;
		fileName = fileName + curDateTime + ".xls";
		var frm = document.getElementById("viewlist1");
    	frm.elements["downloadFile"].value = filePath;
    	frm.elements["fileName"].value = fileName;
	    frm.submit();
		//window.open("com.primeton.components.web.fileupload.getfileByAbsoPath.flow?fileType=xls文件&fileName=SalesPerformence.xls&filePath=" + returnurl);
	}else if(returnvalue == "0"){
		alert("导出数据失败！");
	}
}

 function show_trvAndPetty(id,type){
		//alert('test1');
		//EOS环境下可用这个函数
		var strurl='/default/com.primeton.eos.';
		if(type=='trv'){
			strurl=strurl+'trv.myTrvExp.flow?_eosFlowAction=view&erpexpttrvexp/trvexpno='+id;
		//	alert(strurl);
		}else if(type=='comm'){
			strurl=strurl+'comm.myCommExp.flow?_eosFlowAction=view&erpexptcommexp/commexpno='+id;
		}else{
			strurl=strurl+'petty.myPettyExp.flow?_eosFlowAction=view&erpexptpettyexp/pettyexpno='+id;
		//	alert(strurl);
		}
		window.open(strurl,"_blank");
	}
	
function show_expnoDetail(id){
	var strurl='/default/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=' + id;
	window.open(strurl,"_blank");
}
/* sales_performance */
function sales_performance(year,month,orgseq,type,name,raqName){
	/*
	*	收入类费用 链接[sales_performance_income]：type 表示"产品、服务、MA", name表示"毛收入、2013年收款确认收入、顾问费、净收入  "
	*	服务成本(不含直接费用 和 外购外包成本) 链接[sales_performance_ps]：type 表示不同部门的服务成本， name 表示 orgid对应的orgseq中的事业部ID[34/35/36]
	*	销售费用 和 直接费用链接[sales_performance_budget]：type 表示不同类型 ,name 无意义
	*	销售费用合计： 链接  [sales_performance_budgetsum]：type 表示不同类型 , month表示开始月， name 表示结束月
	*	基本工资 和 福利成本[sales_performance_budgetSalary]：type 表示不同类型 ,name 无意义
	*	公共费用 和 外购外包成本[sales_performance_budgetCosts]：type 表示不同类型 ,name 无意义
	*/

	var strurl='showReport.jsp?raq=sales_performance_'+raqName+'.raq&year='+year+'&month='+month+'&orgseq='+orgseq+'&type='+type+'&name='+name;
	window.open(strurl,"_blank"); 
}

/* department_PL */

function department_PL_income(orgid,year,month,type,title){
	//	alert('&orgid='+orgid+'&year='+year+'&month='+month+'&type='+type+'&title='+title);
	var strurl='showReport.jsp?raq=department_PL_income.raq&orgid='+orgid+'&year='+year+'&month='+month+'&type='+type+'&title='+title;
	window.open(strurl,"_blank"); 
}

function department_PL_cost(subRaq,orgid,year,month,parentType){
	var strurl;
	if(parentType.toString()=='rpg'){

		strurl='showReportGroup.jsp?rpg=department_PL_'+subRaq+'.rpg&orgid='+orgid+'&year='+year+'&month='+month+'&parentType='+parentType;
	}else{
		strurl='showReport.jsp?raq=department_PL_'+subRaq+'.raq&orgid='+orgid+'&year='+year+'&month='+month+'&parentType='+parentType;
	}
	window.open(strurl,"_blank"); 
}

function department_PL_listDetail(subRaq,orgid,year,month,deptExpTypeID,parentType){
//	alert('subRaq='+subRaq+' deptno='+deptno+' year='+year+' month='+month+" deptExpTypeID="+deptExpTypeID +' parentType='+parentType);
	var strurl='showReport.jsp?raq='+subRaq+'.raq&orgid='+orgid+'&year='+year+'&month='+month+'&deptExpTypeID='+deptExpTypeID+'&parentType='+parentType;
	window.open(strurl,"_blank"); 
}

/* primeton_PL */
 
 
 function primeton_PL_income(year,month,type,name){
	var strurl='showReport.jsp?raq=primeton_PL_income.raq&year='+year+'&month='+month+'&type='+type+'&name='+name;
	window.open(strurl,"_blank"); 
}

function primeton_PL_costs(year,month,fileName){
	var strurl='showReport.jsp?raq=primeton_PL_'+fileName+'.raq&year='+year+'&month='+month;
	window.open(strurl,"_blank"); 
}

/* department_BFT */
function department_BFT(orgid,time,fileName){
	var strurl='showReport.jsp?raq=department_BFT_'+fileName+'.raq&orgid='+orgid+'&time='+time;
	window.open(strurl,"_blank"); 
}

/* mis_machine_dept_asset_detail*/
function asset_dept(dept,year1,month1){
	var strurl='showMachineReport.jsp?raq=assetDeptDetail.raq&dept='+dept+'&year1='+year1+'&month1='+month1;
	window.open(strurl,"_blank");
}

/* mis_machine_deptGT_asset_detail*/
function asset_deptGT(dept,year1,month1){
	var strurl='showMachineReport.jsp?raq=assetDeptGTDetail.raq&dept='+dept+'&year1='+year1+'&month1='+month1;
	window.open(strurl,"_blank");
}

/* mis_machine_area_asset_detail*/
function asset_area(area,year1,month1){
	var strurl='showMachineReport.jsp?raq=assetAreaDetail.raq&area='+area+'&year1='+year1+'&month1='+month1;
	window.open(strurl,"_blank");
}

/* mis_machine_areaGT_asset_detail*/
function asset_areaGT(area,year1,month1){
	var strurl='showMachineReport.jsp?raq=assetAreaGTDetail.raq&area='+area+'&year1='+year1+'&month1='+month1;
	window.open(strurl,"_blank");
}

/* mis_machine_asset_cast */
function asset_cast(){
	var year1 = document.getElementById("year1").value;
	var month1 = document.getElementById("month1").value;
	var json={year1:year1,month1:month1};
	<%--nui.ajax({
	    url: "com.primeton.eos.machine.machine.assetCast.biz.ext",
	    type: "post",
	    cache: false,
	    contentType: 'text/json',
	    success: function (o) {
	   	}
	});--%>
}

/* deptCosts */
function deptcosts(benefno,deptno,year,month,type){
	var raq;
	if(type==1){
		raq='showReport.jsp?raq=deptCostsSub1.raq';
	}else if(type==2){
		raq='showReport.jsp?raq=deptCostsSub2.raq';
	}else{
		raq='showReportGroup.jsp?rpg=deptCostsSubs.rpg';
	}
	var strurl=raq+'&benefno='+benefno+'&deptno='+deptno+'&year='+year+'&month='+month;
	window.open(strurl,"_blank"); 
}

/* deptPL */
function deptPLCont(year,month,orgid){
	var raq='showReport.jsp?raq=deptPL_contract.raq';
	var strurl=raq+'&year='+year+'&month='+month+'&orgid='+orgid;
	window.open(strurl,"_blank"); 
}

function deptPLIncome(year,month,orgid,pdlx){
	var raq='showReport.jsp?raq=deptPL_income.raq';
	var strurl=raq+'&year='+year+'&month='+month+'&orgid='+orgid+'&pdlx='+pdlx;
	window.open(strurl,"_blank"); 
}

function projectcostsum(project_id)
{   window.open("/default/project/rdproject/projectDetail.jsp?projid="+project_id);
}

function projectcontract(contractid)
{
	window.open("<%= request.getContextPath() %>/contract/contract/contractView.jsp?contractid="+contractid);
}

function projecttimecost(project_id)
{
	window.open("<%= request.getContextPath() %>/ame_budget/detailPempcost.jsp?id="+project_id);
}

function formatDate(date) {
        var myyear = date.getFullYear();
        var mymonth = date.getMonth()+1;
        var myweekday = date.getDate();

        if(mymonth < 10){
            mymonth = "0" + mymonth;
        }
        if(myweekday < 10){
            myweekday = "0" + myweekday;
        }
        return (myyear+"-"+mymonth + "-" + myweekday);
    }

function laborrate(p)
{
	var ps = p.split(",");
	//年份
	var year = encodeURIComponent(ps[0]);
	//月份
	var month = encodeURIComponent(ps[1]);
	//事业部
	var org = encodeURIComponent(ps[2]);
	org = org.replace("&","\&");
    //得到月初日期
    var getMonthStartDate = new Date(year, month-1, 1);
    var startdate =  formatDate(getMonthStartDate);
   
    //得到该月末日期
    var monthStartDate = new Date(year, month, 1);　 
    if(month==12)
    {
    year++;
    month=1;
    }
　      var monthEndDate = new Date(year, month , 1);
    var　 days　 =　 monthEndDate.getTime()-1000*60*60*24; 
    var getMonthEndDate = new Date(days);
    var enddate =  formatDate(getMonthEndDate);
    
    //打开窗口
	var executeUrl ="<%= request.getContextPath() %>/labor/mgr/RdLaborRateCal.jsp?orgname="+org+"&startdate="+startdate+"&enddate="+enddate;	
	var iWidth=1000; //弹出窗口的宽度;
    var iHeight=500; //弹出窗口的高度;
	var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
	var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
	window.open(executeUrl, "部门人员月度工时率", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
}

function poutcost(project_no)
{
	window.open("<%= request.getContextPath() %>/ame_budget/detailPoutcost.jsp?id="+project_no);
}

//部门合同明细
function csContractDetail(p){
	var ps = p.split(",");
	//事业部
	var ps0 = encodeURIComponent(ps[0]);
	//销售
	var ps1 = encodeURIComponent(ps[1]);
	//月份
	var ps2 = encodeURIComponent(ps[2]);
	//年份
	var ps3 = encodeURIComponent(ps[3]);
	//状态
	var ps4 = encodeURIComponent(ps[4]);
	//客户
	var ps5 = encodeURIComponent(ps[5]);
	//是否年度
	var ps6 = encodeURIComponent(ps[6]);
	window.open("<%= request.getContextPath() %>/ame_income/csContract/csContractRecognisedIncomeDetail.jsp?dictname=" + ps0 + "&salename=" + ps1 + "&months=" + ps2 + "&years=" + ps3 + "&status=" + ps4 + "&custname=" + ps5 + "&nd=" + ps6, "部门合同收入详细信息", "height=500, width=1200, top=0,left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no");
	
	<%-- window.open("<%= request.getContextPath() %>/ame_income/csContract/csContractRecognisedIncomeDetail.jsp?p=" + p, "部门合同收入详细信息", "fullscreen=2"); --%>
}

//存货采购明细
function chOutcostDetail(p){
	 var ps = p.split(",");
	//事业部
	var ps0 = encodeURIComponent(ps[0]);
	//销售
	var ps1 = encodeURIComponent(ps[1]);
	//月份
	var ps2 = encodeURIComponent(ps[4]);
	//年份
	var ps3 = encodeURIComponent(ps[3]);
	//合同
	var ps4 = encodeURIComponent(ps[5]);
	//客户
	var ps5 = encodeURIComponent(ps[2]);
	//存货类型
	var ps6 = encodeURIComponent(ps[6]);
	window.open("<%= request.getContextPath() %>/importExcel/outcost4ch.jsp?syb=" + ps0 + "&salename=" + ps1 + "&months=" + ps2 + "&years=" + ps3 + "&contnum=" + ps4 + "&custname=" + ps5 + "&chtype=" + ps6, "存货采购明细", "fullscreen=1"); 
}

//存货人力明细
function chLabDetail(p){
	 var ps = p.split(",");
	//事业部
	var ps0 = encodeURIComponent(ps[0]);
	//销售
	var ps1 = encodeURIComponent(ps[1]);
	//月份
	var ps2 = encodeURIComponent(ps[4]);
	//年份
	var ps3 = encodeURIComponent(ps[3]);
	//合同
	var ps4 = encodeURIComponent(ps[5]);
	//客户
	var ps5 = encodeURIComponent(ps[2]);
	//存货类型
	var ps6 = encodeURIComponent(ps[6]);
	window.open("<%= request.getContextPath() %>/importExcel/labor4ch.jsp?syb=" + ps0 + "&salename=" + ps1 + "&months=" + ps2 + "&years=" + ps3 + "&contnum=" + ps4 + "&custname=" + ps5 + "&chtype=" + ps6, "存货人力明细", "fullscreen=1"); 
}

//部门收款明细
function csGatherFcDetail(p){
	var ps = p.split(",");
	//事业部
	var ps0 = encodeURIComponent(ps[0]);
	//销售
	var ps1 = encodeURIComponent(ps[1]);
	//客户
	var ps2 = encodeURIComponent(ps[2]);
	//月份
	var ps3 = encodeURIComponent(ps[3]);
	//年份
	var ps4 = encodeURIComponent(ps[4]);
	//状态
	var ps5 = encodeURIComponent(ps[5]);
	//按季、按月
	var ps6 = encodeURIComponent(ps[6]);
	if(ps6 == "1"){
		if(ps3 == "1"){ps3 = "1,2,3";}
		if(ps3 == "2"){ps3 = "4,5,6";}
		if(ps3 == "3"){ps3 = "7,8,9";}
		if(ps3 == "4"){ps3 = "10,11,12";}
	}
	window.open("<%= request.getContextPath() %>/ame_income/csGatherFc/csGatherFcReportDetail.jsp?dictname=" + ps0 + "&salename=" + ps1 + "&custname=" + ps2 + "&months=" + ps3 + "&years=" + ps4 + "&status=" + ps5, "部门合同收入详细信息", "height=500, width=1200, top=0,left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no");
	
}

//流程处理时效
function processInstshow(o){
	var processInstID = encodeURIComponent(o);
	var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
	var title = "流程图查看";
	var width=1000;
    nui.open({
		url: url,
		title: title,
		width: width,
		height: 530,
		onload: function () {
			var iframe = this.getIFrameEl();
			if(iframe.contentWindow.initData) {
				iframe.contentWindow.initData({"processInstID": o});
			}
		},
		ondestroy: function (action){
		}
	});
}

//统计外包费用
function doOutFee(year){
	/* 
	alert("统计外包费用" + year);
	var myAjax = new Ajax("com.primeton.eos.ame_pur.settle.getOutFeeStat.biz");
	myAjax.addParam("year",year);
	myAjax.submit(); 
	*/
	
	if(confirm("数据预处理时间较长,是否处理?")){
		var jsondel = nui.encode({year: year});
		document.getElementById("outfeebtn").disabled="disabled";
		document.getElementById("bg").style.display ="block";
		nui.ajax({
			url: "com.primeton.eos.ame_pur.settle.getOutFeeStat.biz.ext",
	        data: jsondel,
	        type: 'POST',
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	        	document.getElementById("bg").style.display ="none";
	        	nui.parse();
	        	o = nui.clone(o);
	        	if(o.exception == null){
		        	alert("统计完成");
		        	document.getElementById("outfeebtn").disabled="";
	        	}else{
	        		document.getElementById("outfeebtn").disabled="";
	        		alert("统计失败:" + nui.encode(o.exception));
	        	}
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	            alert(jqXHR.responseText);
	        }
		});
	}else{
		return;
	}
}

//部门收款明细
function ameProjectcostsumSsDetail(p){
	var ps = p.split(",");
	//单据类型
	var exptype = ps[0];
	//报销单号
	var expno = ps[1];
  	window.open("<%= request.getContextPath() %>/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid="+expno,"pettyExpView","height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
}

//合同收入成本核算月度汇总表明细
function csContractReveCostAccountingDetail(p){
	var ps = p.split(",");
	//事业部
	var ps0 = encodeURIComponent(ps[0]);
	//销售
	var ps1 = encodeURIComponent(ps[1]);
	//客户
	var ps2 = encodeURIComponent(ps[2]);
	//合同
	var ps3 = encodeURIComponent(ps[3]);
	//年份
	var ps4 = encodeURIComponent(ps[4]);
	//季度
	var ps5 = encodeURIComponent(ps[5]);
	//月份
	var ps6 = encodeURIComponent(ps[6]);
	//alert("ps0 = " + ps0 + ",ps1 = " + ps1 + ",ps2 = " + ps2 + ",ps3 = " + ps3 + ",ps4 = " + ps4 + ",ps5 = " + ps5 + ",ps6 = " + ps6);
	window.open("<%= request.getContextPath() %>/ame_income/csContract/csContractReveCostAccountingDetail.jsp?dictname=" + ps0 
	+ "&salename=" + ps1 + "&custname=" + ps2 + "&contnum=" + ps3 + "&years=" + ps4 + "&quarters=" + ps5 + "&months=" + ps6,
	 "部门合同收入详细信息", "height=500, width=1200, top=0,left=0, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no");
}
</script>

