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
<title>项目实施外包成本明细</title>
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
	            <legend>外包成本明细</legend>
	            <div id="grid_1" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client"dataField="pouts" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell">
	            <div property="columns">
                <div field="type" width="30" headerAlign="center" align="center" >类型</div>
                <div field="numbers" headerAlign="center" align="center" width="40"  >编号</div>
                <div field="custname" headerAlign="center" >供应商</div>
                <div field="status" headerAlign="center" align="center" width="60"  >状态</div>
                <div field="startdate" width="62" align="center" headerAlign="center" renderer="onDealDate" >开始日期</div>
                <div field="enddate" width="62" align="center" headerAlign="center" renderer="onDealDate">截止日期</div>
                <div field="poutcost" width="70" align="right" summaryType="sum" headerAlign="center" dataType="currency">含税金额(元)</div>
                <div field="poutcost1" width="70" align="right" summaryType="sum" headerAlign="center" dataType="currency">不含税金额(元)</div>
                <div field="workunit" width="50" align="center"headerAlign="center" >工作量单位</div>
                <div field="workamount" width="50" align="center"  headerAlign="center" >工作量数量</div>
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
	    	var projectno = getUrlParam("id");
	    	var costtype = getUrlParam("costtype");
			nui.parse();
			var json = nui.encode({projectno:projectno,costtype:costtype});
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
		            url: "com.primeton.eos.ame_budget.ame_budget.getPout.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
		            success: function (o) {
		            	obj = nui.decode(o);
		                form.setData(obj);
		                form.setChanged(false);
	                    nui.get("grid_1").setData(o.pouts);
		            }
		     });
		}		
		function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();  
	    }
        function checkDetail(){
	 		var selectRow = nui.get("grid_1").getSelected();
			var executeUrl = "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleLook.jsp?settlementid=" + selectRow.settlementid;
			window.open(executeUrl, "查看结算信息", "fullscreen=1");
	    }
	    //日期格式化
        function onDealDate(e){
	  		if(e.value){
	  			return e.value.substring(0,10);
	  		}
	  	}
	  	function onDrawSummaryCell(e) {
            if(e.field=='poutcost1'){
            	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if(e.field=='poutcost'){
            	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
        		 //格式化为千分位形式
	function formatNumber(num,cent) {
		num = num.toString().replace(/\$|\,/g,'');  
        // 检查传入数值为数值类型  
         if(isNaN(num))  
          num = "0";  
        // 获取符号(正/负数)  
        sign = (num == (num = Math.abs(num)));  
        num = Math.floor(num*Math.pow(10,cent)+0.50000000001); // 把指定的小数位先转换成整数.多余的小数位四舍五入  
        cents = num%Math.pow(10,cent);       // 求出小数位数值  
        num = Math.floor(num/Math.pow(10,cent)).toString();  // 求出整数位数值  
        cents = cents.toString();        // 把小数位转换成字符串,以便求小数位长度  
       
        // 补足小数位到指定的位数  
        while(cents.length<cent)  
         cents = "0" + cents;  
         // 对整数部分进行千分位格式化.  
         for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)  
          num = num.substring(0,num.length-(4*i+3))+','+ num.substring(num.length-(4*i+3));  
        return (((sign)?'':'-') + num + '.' + cents); 
	}
        function exportCurrent(){
		 var form = new nui.Form("#form1");
			nui.ajax({
                url: "com.primeton.eos.ame_budget.ame_budget.exportPoutcost.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (o) {
             		nui.unmask();
                	var filePath = o.downloadFile;
                	var fileName = "项目实施外包成本明细";
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
	    </script>
</body>
</html>