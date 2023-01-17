<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): xupc
  - Date: 2020
  - Description:
-->
<head>
	<title>指标项列表</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
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
	    .asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;    
	    }
    </style>
</head>
<body>
	<div class="nui-panel" title="报表详情" id ="report" style="width: 100%;display: none;">
    	<table style="table-layout:fixed;" id="table_file1">
            <tr>
            	<td align="right" style="width:120px;font-size: 13px;" >报表编码：</td>
				<td id="reportcode" class="asLabel" style="width:100px;font-size: 13px;"></td>
				<td align="right" style="font-size: 13px;width:150px;">报表名称：</td>
				<td id="reportname" class="asLabel" style="font-size: 13px;width:150px;"></td>
				<td align="right" style="width:120px;font-size: 13px;" >加载方式：</td>
				<td id="loadingtype" class="asLabel" style="width:150px;font-size: 13px;"></td>
			</tr>
			<tr>
			    <td align="right" style="width:120px;font-size: 13px;" >数据加载逻辑：</td>
				<td id="loadinglogicname" class="asLabel" style="font-size: 13px;" colspan="3"></td>
				<td align="right" style="font-size: 13px; width:150px;">定时器任务编号：</td>
				<td id="timingname" class="asLabel" style="font-size: 13px;width:150px;"></td>
			</tr>
			<tr>
			    <td align="right" style="width:120px;font-size: 13px;" >有权角色：</td>
				<td id="roleid" class="asLabel" style="font-size: 13px;" colspan="3"></td>
			    <td align="right"  style="font-size: 13px;">是否显示统计值：</td>
				<td id="isshowtotal" class="asLabel" style="font-size: 13px;width:150px;"></td>
			</tr>
    	</table>
    </div>
    <div class="nui-panel" title="指标详情" id ="reportquota" style="width: 100%;display: none;">
    	<table style="table-layout:fixed;" id="table_file1">
            <tr>
            	<td align="right" style="width:120px;font-size: 13px;" > 指标编码：</td>
				<td id="reportquotacode" class="asLabel" style="width:100px;font-size: 13px;"></td>
				<td align="right" style="font-size: 13px;width:150px;"> 指标名称：</td>
				<td id="reportquotaname" class="asLabel" style="font-size: 13px;width:150px;"></td>
				<td align="right" style="font-size: 13px; width:150px;">排序：</td>
				<td id="quotasort" class="asLabel" style="font-size: 13px;width:150px;"></td>
			</tr>
			<tr>
			    <td align="right" style="width:120px;font-size: 13px;" >是否显示：</td>
				<td id="isshow" class="asLabel" style="width:100px;font-size: 13px;"></td>
				<td align="right"  style="font-size: 13px;">取数方式：</td>
				<td id="quotaaccesstype" class="asLabel" style="font-size: 13px;width:150px;"></td>
				<td align="right" style="font-size: 13px;"> 显示规则：</td>
				<td id="showrule" class="asLabel" style="font-size: 13px;width:150px;"></td>
			</tr>
    	</table>
    </div>
<!--核查要点与配置关联关系 -->
<fieldset style="border:solid 1px #aaa;padding:3px;width: 99%;">
    <legend>指标列表</legend>
    	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	    <table style="width:100%;">
	        <tr>
	            <td align="left">
	                <a class="nui-button" id="okbutton" iconCls="icon-ok" onclick="onOk()">保存</a>
	            </td>
	        </tr>
	     </table> 
	</div>
	<div id="datagrid1" class="nui-datagrid" style="width: 100%;height:auto;" allowResize="true"  
	    allowAlternating="true"  allowCellEdit="true" dataField="reportquotas"
		allowCellSelect="true" showPager="false">
		<div property="columns">
			<div field="reportname" width="110" headerAlign="center" align="left">所属报表</div>
			<div field="parentquotaname" width="110" headerAlign="center" align="left">父指标名称</div>
			<div field="reportquotaname" width="110" headerAlign="center" align="left">指标名称
			     <input property="editor" class="nui-textbox"/>
			</div>
			<div field="quotaaccesstype" width="80" headerAlign="center" align="center" renderer="getQuotaaccesstype">取数方式</div>
			<div field="quotasort" width="80" headerAlign="center" align="center">排序
			     <input property="editor" class="nui-textbox"/>
			</div>
			<div field="isshow" width="60" align="center" headerAlign="center" renderer="getIsshow">是否显示
			   <input property="editor" class="nui-dictcombobox" dictTypeId="MIS_YN"/>
			</div>
			<div field="quotaremark" width="180" align="left" headerAlign="center">备注
			     <input property="editor" class="nui-textbox"/>
			</div>
		</div>
	</div>
</fieldset>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	var quotaseq = '<%=request.getParameter("quotaseq") %>';
	var reportcode = '<%=request.getParameter("reportcode") %>';
	var parentquotacode = '<%=request.getParameter("parentquotacode") %>';
	if(parentquotacode =='.0.'){
	   document.getElementById("report").style.display="";
	}else{
	   document.getElementById("reportquota").style.display="";
	}
	init();
	function init(){
		var json = nui.encode({"quotaseq":quotaseq,"reportcode":reportcode});
		nui.ajax({
        	url: "com.primeton.eos.ame_common.ameReport.queryReportQuotaDetails.biz.ext",
        	data: json,
        	type: 'POST',
        	cache: false,
        	contentType: 'text/json',
        	success: function (text) {		
        	    var report = text.report; 			 
				var reportquota = text.reportquota;
				var reportquotas = text.reportquotas;
				
				document.getElementById("reportcode").innerHTML = report.reportcode == null ?"":report.reportcode;
				document.getElementById("reportname").innerHTML = report.reportname == null ?"":report.reportname;
				document.getElementById("loadingtype").innerHTML =  nui.getDictText('REPORT_LOADINGTYPE',report.loadingtype);
				document.getElementById("loadinglogicname").innerHTML = report.loadinglogicname == null ?"":report.loadinglogicname;
				document.getElementById("timingname").innerHTML = report.timingname == null ?"":report.timingname;
				document.getElementById("roleid").innerHTML = report.rolename == null ?"":report.rolename;
				document.getElementById("isshowtotal").innerHTML = nui.getDictText('MIS_YN',report.isshowtotal);
				
				document.getElementById("reportquotacode").innerHTML = reportquota.reportquotacode == null ?"":reportquota.reportquotacode;
				document.getElementById("reportquotaname").innerHTML = reportquota.reportquotaname == null ?"":reportquota.reportquotaname;
				document.getElementById("quotasort").innerHTML = reportquota.quotasort == null ?"":reportquota.quotasort;
				document.getElementById("isshow").innerHTML = nui.getDictText('MIS_YN',reportquota.isshow);
				document.getElementById("quotaaccesstype").innerHTML = nui.getDictText('QUOTA_ACCESSTYPE',reportquota.quotaaccesstype);
				document.getElementById("showrule").innerHTML = nui.getDictText('REPORT_SHOWRULE',reportquota.showrule);
				grid.setData(reportquotas);
        	},
        	error: function (jqXHR, textStatus, errorThrown) {
				CloseWindow();
            }
        });
	}
	//保存指标列表
    function onOk(){
    	var selectRow = grid.getChanges("modified");
    	if(selectRow.length == 0){
    		return false;
    	}
     	var data = {update:selectRow};
    	nui.ajax({
            url: "com.primeton.eos.ame_common.ameReport.updateReportQuotas.biz.ext",
            type: 'POST',
            data:data,
            contentType: 'text/json',
            success: function (text) {
               if(text.result == '1'){
               		nui.alert("保存成功！","提示",function(e){
               		    init();
               		});
               }else{
               		nui.alert("保存失败！");
               }
            }
        });
    }
	
	function getQuotaaccesstype(e){
		return nui.getDictText('QUOTA_ACCESSTYPE',e.value);//设置业务字典值
	}
	function getIsshow(e){
		return nui.getDictText('MIS_YN',e.value);//设置业务字典值
	}
</script>
</html>