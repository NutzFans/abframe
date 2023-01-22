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
	<link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div class="nui-fit">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <table style="width:100%;">
	              <tr>
	                  <td style="width:100%;">
	                  	 <a class="nui-button" iconCls="icon-download" onclick="exportCS()">导出</a>
	                  </td>
	              </tr>
	         </table>
		</div>
		<div id="datagrid1" class="nui-datagrid" style="width:auto;height:auto;" showPager="false" showSummaryRow="true"
		url="com.primeton.eos.ame_income.csContStock.queryCscontstockByCs.biz.ext" dataField="csContStocks" ondrawsummarycell="onDrawSummaryCell">
	        <div property="columns">
	        	<div field="contnum" width="60" headerAlign="center" align="center">合同编号</div>
	        	<div field="custname" width="100" headerAlign="center" align="center">签署单位</div>
	        	<div field="projectname" width="100" headerAlign="center" align="center">项目名称</div>
	        	<div field="contsums" width="80" headerAlign="center" align="center" dataType="currency" summaryType="sum">合同总额</div>
	        	<div field="contsum" width="80" headerAlign="center" align="center" dataType="currency" summaryType="sum">待确认合同额</div>
	        	<div field="contsum1" width="80" headerAlign="center" align="center" dataType="currency" summaryType="sum">待确认合同额(<%=request.getParameter("proportion") %>)</div>
	        	<div field="stock" width="80" headerAlign="center" align="center" dataType="currency" summaryType="sum">存货余额</div>
	        	<div field="stockJZ" width="80" headerAlign="center" align="center" dataType="currency" summaryType="sum">存货减值</div>
	        </div>
	    </div>
	</div>
	
	<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;" onclick="onCancel">关闭</a>
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
	var year;
	var month;
	var proportion;
	
	function setData(data){
		year = data.year;
		month = data.month;
		proportion = data.proportion;		
		grid.load({"year":year,"month":month,"proportion":proportion});
	}	
	-
	function GetData() {
		var rows = grid.getSelecteds();
		return rows;
	}
	
	function onDrawSummaryCell(e) {
	    if (e.field == "contsum") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "contsum1") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "stock") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "stockJZ") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "contsums") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	}
	
	function onCancel(){
		CloseWindow("cancel");
	}
	
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	//导出
    function exportCS(){
		if(!confirm("导出存货减值明细？")){
			return;
		}
		var json =  nui.encode({"year":year,"month":month,"proportion":proportion});
		nui.ajax({
			url: "com.primeton.eos.ame_income.csContStock.exportStockCS.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "存货减值明细记录";
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
</script>
</html>