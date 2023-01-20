<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2015-07-10 14:06:49
  - Description:
-->
<head>
	<title>财务结算工时查询</title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fix">
	<div id="form1">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <input name="criteria._expr[0]._value" id="year" class="nui-hidden" style="width:150px;"/>
		    <input class="nui-hidden" name="criteria._expr[0]._property" value="year"/>
		    <input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
            <input name="criteria._expr[1]._value" id="month"class="nui-hidden"style="width:150px;" onenter="onKeyEnter"/>
		    <input class="nui-hidden" name="criteria._expr[1]._property" value="month"/>
		    <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
    		<input name="criteria._expr[8]._value" id="contnum"  class="nui-hidden" style="width:150px;"/>
		    <input class="nui-hidden" name="criteria._expr[8]._property" value="contnum"/>
		    <input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
		    <input class="nui-hidden" name="criteria._expr[8]._likeRule" value="all"/>
    	</div>
	</div>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <table style="width:100%;">
	              <tr>
	                  <td style="width:100%;">
	                  	 <a class="nui-button" iconCls="icon-download" onclick="exportLabor" id="bt1">导出</a>
	                  </td>
	              </tr>
	         </table>
	</div>
	<div class="nui-fit">
	    <div id="datagrid1" sizeList="[50,100,500]" pageSize="50" showPager="true" dataField="outs" showSummaryRow="true"  sortMode="client" 
        	class="nui-datagrid" style="width:100%;height:550px;" url="com.primeton.rdmgr.labor.input.newRdLaborHistory.queryLaborHistory.biz.ext" 
        	multiSelect="true" allowSortColumn="true" ondrawsummarycell="onDrawSummaryCell" >
            <div property="columns">
                <div field="serviceDate" width="80" align="left" headerAlign="center" allowSort="true" renderer="getDetail">填报日期</div>
                <div field="taskname" width="180" align="left"headerAlign="center" allowSort="true" >工作任务</div>
                <div field="workingHours" width="60" align="left"headerAlign="center" allowSort="true" renderer="getName">工作时间</div>
                <div field="otwHours" width="80" align="left"headerAlign="center" allowSort="true" >其中加班工时</div>
                <div field="empCode" width="80" align="center" headerAlign="center" allowSort="true">员工工号</div>
                <div field="empName" width="80" align="center" headerAlign="center" allowSort="true" >员工姓名</div>
                <div field="empOrgname" width="120" align="center" headerAlign="center" allowSort="true">员工所属部门</div>
                <div field="degree" width="60" align="center" headerAlign="center" allowSort="true">员工级别</div>
                <div field="buyOrgname" width="80" align="center" headerAlign="center" allowSort="true">受益部门</div>
                <div field="buyYjname" width="120" align="center" headerAlign="center" allowSort="true">受益事业部</div>
                <div field="pkCorp" width="60" align="center" headerAlign="center" allowSort="true" renderer="getPkCorp">成本类型</div>
                <div field="checkStatus" width="100" align="center" headerAlign="center" allowSort="true" renderer="getCheckStatus">状态</div>
                <div field="contnum" width="80" align="center" headerAlign="center" allowSort="true">合同编号</div>
                <div field="unitPrice" width="80" align="right"headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">工时单价</div>
                <div field="costs" width="80" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">工时成本</div>
                <div field="transcosts" width="80" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">转换成本</div>
            </div>
        </div>
	</div>
</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
	<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
	<input type="hidden" name="downloadFile" filter="false"/>
	<input type="hidden" name="fileName" filter="false"/>
</form>	
</body>
<script>
	nui.parse();
	var grid = nui.get("datagrid1");
	var form = new nui.Form("#form1");
	var contnum = '<%=request.getParameter("contnum")%>';
	var year = '<%=request.getParameter("year")%>';
	var month = '<%=request.getParameter("month")%>';
	if(contnum!=null && contnum!=""){
		nui.get("contnum").setValue(contnum);
	}
	if(year!=null && year!=""){
		nui.get("year").setValue(year);
	}
	if(month!=null && month!=""){
		nui.get("month").setValue(month);
	}
	search();
	
	function search() {
		var form = new nui.Form("#form1");
		var data = form.getData();
		grid.load(data);
	}
	function getPkCorp(e){
		return nui.getDictText('AME_LABORTYPE',e.value);
	}
	
	function getName(e){
		if(e.value){
			return e.value + "小时";
		}
	}
	
	function getCheckStatus(e){
		return nui.getDictText('AME_OUTCOSTSTATUS',e.value);
	}
	
	//导出
	function exportLabor(){
		if(!confirm("导出历史结算工时查询记录？")){
			return;
		}
		var data = form.getData();
		var json =  nui.encode(data);
		nui.ajax({
			url: "com.primeton.rdmgr.labor.input.newRdLaborHistory.exportLaborHistory.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "历史结算工时查询记录";
	        	var myDate = new Date();
	        	var year = myDate.getFullYear();
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
	}
	
	function getDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='getDetailByLabor();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    function getDetailByLabor(){
    	var selectRow = grid.getSelected();
		var executeUrl = "/default/labor/newRdLabor/LaborHistoryDetail.jsp?id=" + selectRow.id;
		window.open(executeUrl);
    }
    
    function onDrawSummaryCell(e) {
		    var result = e.result;
		    var grid = e.sender;
		    if (e.field == "contnum") {
		        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
		    }
		    if (e.field == "unitPrice") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "costs") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "transcosts") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		}
</script>
</html>