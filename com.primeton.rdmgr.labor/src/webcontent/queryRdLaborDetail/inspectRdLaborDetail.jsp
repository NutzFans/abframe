<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<!-- 
  - Author(s): EPCNB324
  - Date: 2017-11-09 14:16:42
  - Description:
-->
<head>
<title>工时检查</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
    	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
    		<table style="width:100%;">
    			<tr>
    				<td>
    					<input class="nui-checkbox" id="contract" name="labor.iscontract" style="width:80px" text="工时记录对应合同收入确认比例在"/>
    					<input class="nui-spinner" style="width:80px" name="labor.contractvalue" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"><span>%之上</span>
    				</td>
    				<td>
    					<input class="nui-checkbox" id="isSameValuation" name="labor.isSameValuation" style="width:80px" text="人员与项目的事业部归属与计价模式不一致">
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<input class="nui-checkbox" id="acHours" name="labor.isactHours" style="width:80px" text="当天所有工时记录的工时数和超过">
    					<input class="nui-spinner" style="width:80px" name="labor.actHoursvalue" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n1"><span>小时</span>
    				</td>
    				<td>
    					<input class="nui-checkbox" id="otHours" name="labor.isotwHours" style="width:80px" text="加班工时小于实际工时减8小时">
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<input class="nui-checkbox" id="surplusHours" name="labor.issurplusHours" style="width:80px" text="当天存在重复工时">
    				</td>
    				<td>
    					<input class="nui-checkbox" id="isTborgEqual" name="labor.isTborgEqual" style="width:80px" text="填报部门与填报人当前所属部门不一致">
    				</td>
    			</tr>
    			<tr>
    				<td>
    					<input class="nui-checkbox" id="orgLevelforSales" name="labor.isorgLevelforSales" style="width:80px" text="受益给销售的组织级工时或受益给非销售的非立项工时">
    				</td>
    				<td>
    					<input class="nui-checkbox" id="gradeOrg" name="labor.gradeOrg" style="width:80px" text="人员所在部门与人员级别部门不一致">
    				</td>
    			</tr>
    			<tr>
                	<td align="center" colspan="2">
                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">开始检查</a>
                        <a class="nui-button" onclick="exportRdLabors()" iconCls="icon-download"  id="exportButton">导出</a>
                        <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
							<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
							<input type="hidden" name="downloadFile" filter="false"/>
							<input type="hidden" name="fileName" filter="false"/>
						</form>	
                   </td>
    			</tr>
    		</table>
    	</div>
    </div>
    
    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:240px;" allowResize="true" showPager="false" showSummaryRow="true"
        url="com.primeton.rdmgr.labor.queryRdLaborDetail.queryInspectLabor.biz.ext" dataField="rdlabordetails" frozenStartColumn="0" frozenEndColumn="6" multiSelect="true"
    	<%--ondrawcell="ondrawCsGatherFcGridcell"--%> ondrawsummarycell="doCountSum">
        <div property="columns"> 
            <div field="checkname" width="170" headerAlign="center" allowSort="false" align="left">检查内容</div>
            <div field="userName" width="55" headerAlign="center" allowSort="true" align="center">填报人</div>
            <div field="orgname" width="100" headerAlign="center" allowSort="true" align="center">填报部门</div>
        	<div field="laborDate" width="75" headerAlign="center" align="center" allowSort="true" renderer="onTitleRenderer">填报日期</div> 
            <div field="projectName" width="150" headerAlign="center" allowSort="true" align="left">受益项目</div>  
            <div field="projectno" width="100" headerAlign="center" allowSort="true" align="center" <%--renderer="getProjectNameDetail"--%>>项目编号</div>
            <div field="salesName" width="100" headerAlign="center" allowSort="true" align="center">受益部门</div> 
            <div field="actHours" width="65" headerAlign="center" summaryType="sum" allowSort="true" align="center">工时数</div>   
            <div field="otwHours" width="65" headerAlign="center" summaryType="sum" allowSort="true" align="center">其中加班</div>
            <div field="taskname" width="70" headerAlign="center" allowSort="true" align="center">项目活动</div>  
            <div field="repContent" width="160" headerAlign="center" allowSort="true" align="left">工作内容</div>
        </div>
    </div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button"onclick="onCancel" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
    var grid = nui.get("datagrid1");
    var form = new nui.Form("form1");
    
    //页面初始化
	init();
   	function init(){
   		nui.getbyName("labor.contractvalue").setValue(90);
   		nui.getbyName("labor.actHoursvalue").setValue(14);
   		var json = [];
   		var data = form.getData();
   		json = nui.decode(sessionStorage.getItem("json"));
   		json.labor = data.labor;
   		json.isExport = null;
   		grid.load(json);
   	}
   	
   	//查询
   	function search(){
   		var data = form.getData();
   		data.labor.contractvalue = data.labor.contractvalue/100;
   		if(data.labor.iscontract == "false" && data.labor.isactHours == "false" && data.labor.issurplusHours == "false" && data.labor.isorgLevelforSales == "false" && data.labor.isTborgEqual == "false" && data.labor.isSameValuation == "false" && data.labor.isotwHours == "false" && data.labor.gradeOrg == "false"){
   			nui.alert("请勾选至少一条检查条件开始检查！")
   			return;
   		}
   		if(data.labor.iscontract == "true" && (data.labor.contractvalue== 0 || data.labor.contractvalue== '' || data.labor.contractvalue== null)){
   			nui.alert("请填写合同收入确认比例！")
   			return;
   		}
   		if(data.labor.isactHours == "true" && (data.labor.actHoursvalue== 0 || data.labor.actHoursvalue== '' || data.labor.actHoursvalue== null)){
   			nui.alert("请填写工时数！")
   			return;
   		}
   		var json = [];
   		json = nui.decode(sessionStorage.getItem("json"));
   		json.labor = data.labor;
   		json.isExport = null;
   		grid.load(json);
   	}
   	
   	//汇总行样式设置
   	function doCountSum(e){
		if (e.field == "actHours") {
            e.cellHtml = "<div align='center'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "otwHours") {
            e.cellHtml = "<div align='center'><b>" + e.cellHtml + "</b></div>";
        }
        var result = e.result;
        var grid = e.sender;
     	//服务端汇总计算
        if (e.field == "repContent") {                
            var s = "<div align='center'><b>"
            s +=    "检查到共" + result.total +"条数据<br/>"
                    + "</b></div>";
            e.cellHtml = s;
    	}
	}
	
	//导出
	function exportRdLabors(){
		var json = [];
   		var data = form.getData();
   		data.labor.contractvalue = data.labor.contractvalue/100;
   		json = nui.decode(sessionStorage.getItem("json"));
   		json.labor = data.labor;
   		json.isExport = "true";
		nui.confirm("确认导出检查到的工时记录？", "确定？",
		function (action) {
			if(action=='ok'){
				nui.ajax({
	    			url: "com.primeton.rdmgr.labor.queryRdLaborDetail.queryInspectLabor.biz.ext",
			        type: "post",
			        data: json,
			        cache: false,
			        contentType: 'text/json',
			        success: function (o) {
			     		nui.unmask();
			     		var filePath = o.downloadFile;
			        	var fileName = "检查工时记录";
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
		})
	}
	
	//关闭页面
   	function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    function onCancel(e) {
        CloseWindow("cancel");
    }
</script>
</html>