<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<!-- 
  - Author(s): zhx
  - Date: 2017-11-08 10:11:33
  - Description:
-->
<head>
<title>项目数据导出</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>截止日期：</span></td>
		            	<td align="left">
						    <input class="nui-datepicker" name="confirmdate" required="true" style="width:200px"/>-<input class="nui-datepicker" name="confirmdate1" required="true" style="width:200px"/>
	                        <a class="nui-button" id="exportCurrentExcel" iconCls="icon-download" onclick="exportCurrent">导出</a>  
						</td>
					</tr> 
	            </table>           
	        </div>
	    </div>
		<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
			<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
			<input type="hidden" name="downloadFile" filter="false"/>
			<input type="hidden" name="fileName" filter="false"/>
		</form>   
		<script type="text/javascript">
	    	nui.parse();
	      	function exportCurrent(){
         		var form = new nui.Form("#form1");
	      		if(!form.validate()){
					alert("截止日期必须填写!");
					return;
				}
         		var json = form.getData();
         		form.loading("请稍候...");
				nui.ajax({
	                url: "com.primeton.eos.ame_common.ame_common.exportProjectData.biz.ext",
	                type: "post",
	                data: json,
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	             		form.unmask();
	                	var filePath = o.downloadFile;
	                	var fileName = "projectData";
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
	                	form.unmask();
	                }
	            });	
		    }
    
	    </script>
</body>
</html>