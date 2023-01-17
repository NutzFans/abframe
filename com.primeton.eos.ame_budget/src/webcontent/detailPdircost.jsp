<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/nui/common.jsp"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2016-05-27 14:17:51
  - Description:
-->
<head>
<title>直接费用明细</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script>
		$(function(){
			nui.context='/default'
		})
	</script>
    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    </style>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div class="nui-fit">
	 	<form id="form1" method="post" >
	            <legend>直接费用明细</legend>
	            <div id="grid_1" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client"dataField="exps" showSummaryRow="true" ondrawsummarycell="doCountNowPage">
	            <div property="columns">
	              <div field="exptype" width="80px" headerAlign="center" renderer = "dicttype">单据类型</div>
	              <div field="expno" renderer="getExpReiList" width="80px" headerAlign="center">报销单号</div>
	              <div field="empname" width="80px" headerAlign="center">报销人</div>
	              <div field="deptname" width="120px" headerAlign="center">报销部门</div>
	              <div field="date" width="80px" headerAlign="center" renderer="timeFormat">报销日期</div>
	              <div field="dictname"  width="80px" headerAlign="center">报销单状态</div>
	              <div field="feetypename" width="80px" headerAlign="center">费用类型</div>  
	              <div field="confamt" summaryType="sum" width="60px" align="right" dataType="currency" headerAlign="center">报销金额</div>
	              <div field="benefdeptname" width="60px" headerAlign="center">受益部门</div>
	            </div>
	          </div>
		</form>
		</div>
		<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
	    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	    	<a class="nui-button" id="exportCurrentExcel" iconCls="icon-download" onclick="exportCurrent">导出明细表</a>
		</div>
		<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
		</form>  
	    <script type="text/javascript">
	    	var form = new nui.Form("form1");
	    	var projectid = getUrlParam("id");
	    	var contnum = getUrlParam("contnum");
	    	var startdate= getUrlParam("startdate");
	    	var enddate= getUrlParam("enddate");
			nui.parse();
			var json = nui.encode({projectid:projectid,startdate:startdate,enddate:enddate,contnum:contnum});
			setData(json);
			function getUrlParam(name) { 
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
				var r = window.location.search.substr(1).match(reg); 
				if (r != null) 
				return unescape(r[2]); 
				return null; 
			} 				
	        function toggleFieldSet(ck, id) {
	            var dom = document.getElementById(id);
	            dom.className = !ck.checked ? "hideFieldset" : "";
	        }  
	        function setData(json){
	        	nui.ajax({
		            url: "com.primeton.eos.ame_budget.ame_budget.getPdircost.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
		            success: function (o) {
		            	obj = nui.decode(o);
		                form.setData(obj);
		                form.setChanged(false);
	                    nui.get("grid_1").setData(o.exps);
		            }
		     });
		}		
		function doCountNowPage(e){        	
            //客户端汇总计算
            if (e.field == "amount") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "confamt") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
		function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();  
	    }
	   function getExpReiList(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkExpNo();' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function checkExpNo(){
	    	var selectRow = nui.get("grid_1").getSelected();
			var executeUrl = "<%= request.getContextPath() %>/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + selectRow.reiid;
			window.open(executeUrl);
	    }
      function dicttype(e){
      	return nui.getDictText('EXP_EXPTYPE',e.value);
      }
        function exportCurrent(){
		 var form = new nui.Form("#form1");
			nui.ajax({
                url: "com.primeton.eos.ame_budget.ame_budget.exportPdircost.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (o) {
             		nui.unmask();
                	var filePath = o.downloadFile;
                	var fileName = "直接费用成本明细";
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
		}
		
		function timeFormat(e){
			if(e.value){
				return e.value.substring(0,19);
			}
		}
	    </script>
</body>
</html>