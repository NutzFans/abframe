<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2014-09-23 17:01:53
  - Description:
-->
<head>
	<title>生成月折旧资产报表</title>
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
	    <form method="post" id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
	    			<tr>
	    				<td align="center">
	    					<input class="nui-buttonedit" onbuttonclick="showDept" id="dept"/>
	    					<a class="nui-button" onclick="exportMachine1" id="dept1">导出部门资产表</a>
						</td>
					</tr>
					<tr>
						<td align="center">
			            		<input class="nui-dictcombobox" dictTypeId="EXP_REGION" id="area"/>
		    					<a class="nui-button" onclick="exportMachine2" id="area1" >导出区域公共资产表</a>
						</td>
					</tr>
					<tr>
						<td align="center">
	    					<a class="nui-button" onclick="exportMachine3" id="all">导出汇总表</a>
	    				</td>
					</tr>
					<tr>
						<td align="center">
	    					<a class="nui-button" onclick="exportMachine4" id="scarp">导出已报废表</a>
	    				</td>
					</tr>
	    		</table>
	    	</div>
		</form>	
<script type="text/javascript">
	nui.parse();
	
	function dictType(e){
		return nui.getDictText("MIS_MA_TYPE",e.value);
	}
	
	function dictStatusType(e){
		return nui.getDictText("MIS_MA_STATUS",e.value);
	}
	
	function dictStorageType(e){
		return nui.getDictText("MIS_MA_STORAGE",e.value);
	}
	
	function exportMachine1(){
            var form = new nui.Form("#form1");
            var name=this.id;
    		var dept=nui.get("dept");
        	var data=dept.getValue();
            var json = {data:data,name:name};
        	alert(nui.encode(json));
			nui.ajax({
                    url: "com.primeton.eos.machine.machine.exportMachine.biz.ext",
                    type: "post",
                    data: json,
                    cache: false,
                    contentType: 'text/json',
                    success: function (o) {
                 	nui.unmask();
                    	var filePath = o.downloadFile;
                    	var fileName = "machine";
                    	var myDate = new Date();
                    	var year = myDate.getYear();
                    	var month = myDate.getMonth()+1;
                    	var day = myDate.getDate();
                    	var hours = myDate.getHours();
                    	var minutes = myDate.getMinutes();
                    	var seconds = myDate.getSeconds();
                    	var curDateTime = year;
                    	if(month>9)
							curDateTime = curDateTime + month;
						else
							curDateTime = curDateTime + "0" + month;
                    	if(day>9)
							curDateTime = curDateTime + day;
						else
							curDateTime = curDateTime + "0" + day;
						if(hours>9)
							curDateTime = curDateTime + hours;
						else
							curDateTime = curDateTime + "0" + hours;
						if(minutes>9)
							curDateTime = curDateTime + minutes;
						else
							curDateTime = curDateTime + "0" + minutes;
						if(seconds>9)
							curDateTime = curDateTime + seconds;
						else
							curDateTime = curDateTime + "0" + seconds;
						<%--var frm = document.getElementById("viewlist1");
                    	frm.elements["downloadFile"].value = filePath;
                    	frm.elements["fileName"].value = fileName;
					    frm.submit();--%>
					    alert("成功");
                    },
                    error: function () {
                    	alert("error");
                    }
                });	
        }
	
	function exportMachine2(){
            var form = new nui.Form("#form1");
            var name=this.id;
    		var dept=nui.get("area");
        	var data=dept.getValue();
            var json = {data:data,name:name};
        	alert(json);
			nui.ajax({
                    url: "com.primeton.eos.machine.machine.exportMachine.biz.ext",
                    type: "post",
                    data: json,
                    cache: false,
                    contentType: 'text/json',
                    success: function (o) {
                 	nui.unmask();
                    	var filePath = o.downloadFile;
                    	var fileName = "machine";
                    	var myDate = new Date();
                    	var year = myDate.getYear();
                    	var month = myDate.getMonth()+1;
                    	var day = myDate.getDate();
                    	var hours = myDate.getHours();
                    	var minutes = myDate.getMinutes();
                    	var seconds = myDate.getSeconds();
                    	var curDateTime = year;
                    	if(month>9)
							curDateTime = curDateTime + month;
						else
							curDateTime = curDateTime + "0" + month;
                    	if(day>9)
							curDateTime = curDateTime + day;
						else
							curDateTime = curDateTime + "0" + day;
						if(hours>9)
							curDateTime = curDateTime + hours;
						else
							curDateTime = curDateTime + "0" + hours;
						if(minutes>9)
							curDateTime = curDateTime + minutes;
						else
							curDateTime = curDateTime + "0" + minutes;
						if(seconds>9)
							curDateTime = curDateTime + seconds;
						else
							curDateTime = curDateTime + "0" + seconds;
						<%--fileName = fileName + "_" + curDateTime + ".xls";
                    	var frm = document.getElementById("viewlist1");
                    	frm.elements["downloadFile"].value = filePath;
                    	frm.elements["fileName"].value = fileName;
					    frm.submit();--%>
					    alert("成功");
                    },
                    error: function () {
                    	alert("error");
                    }
                });	
        }
	
	function exportMachine3(){
            var form = new nui.Form("#form1");
			nui.ajax({
                    url: "com.primeton.eos.machine.machine.exportMachine.biz.ext",
                    type: "post",
                    cache: false,
                    contentType: 'text/json',
                    success: function (o) {
                 	nui.unmask();
                    	var filePath = o.downloadFile;
                    	var fileName = "machine";
                    	var myDate = new Date();
                    	var year = myDate.getYear();
                    	var month = myDate.getMonth()+1;
                    	var day = myDate.getDate();
                    	var hours = myDate.getHours();
                    	var minutes = myDate.getMinutes();
                    	var seconds = myDate.getSeconds();
                    	var curDateTime = year;
                    	if(month>9)
							curDateTime = curDateTime + month;
						else
							curDateTime = curDateTime + "0" + month;
                    	if(day>9)
							curDateTime = curDateTime + day;
						else
							curDateTime = curDateTime + "0" + day;
						if(hours>9)
							curDateTime = curDateTime + hours;
						else
							curDateTime = curDateTime + "0" + hours;
						if(minutes>9)
							curDateTime = curDateTime + minutes;
						else
							curDateTime = curDateTime + "0" + minutes;
						if(seconds>9)
							curDateTime = curDateTime + seconds;
						else
							curDateTime = curDateTime + "0" + seconds;
						fileName = fileName + "_" + curDateTime + ".xls";
                	<%--var frm = document.getElementById("viewlist1");
                    	frm.elements["downloadFile"].value = filePath;
                    	frm.elements["fileName"].value = fileName;
					    frm.submit();--%>
					    alert("成功");
                    },
                    error: function () {
                    	alert("error");
                    }
                });	
        }
	
	function exportMachine4(){
            var form = new nui.Form("#form1");
            var name = this.id;
            var data = 2;
            var json = {data:data,name:name};
        	alert(json);
			nui.ajax({
                    url: "com.primeton.eos.machine.machine.exportMachine.biz.ext",
                    type: "post",
                    data: json,
                    cache: false,
                    contentType: 'text/json',
                    success: function (o) {
                 	nui.unmask();
                    	var filePath = o.downloadFile;
                    	var fileName = "machine";
                    	var myDate = new Date();
                    	var year = myDate.getYear();
                    	var month = myDate.getMonth()+1;
                    	var day = myDate.getDate();
                    	var hours = myDate.getHours();
                    	var minutes = myDate.getMinutes();
                    	var seconds = myDate.getSeconds();
                    	var curDateTime = year;
                    	if(month>9)
							curDateTime = curDateTime + month;
						else
							curDateTime = curDateTime + "0" + month;
                    	if(day>9)
							curDateTime = curDateTime + day;
						else
							curDateTime = curDateTime + "0" + day;
						if(hours>9)
							curDateTime = curDateTime + hours;
						else
							curDateTime = curDateTime + "0" + hours;
						if(minutes>9)
							curDateTime = curDateTime + minutes;
						else
							curDateTime = curDateTime + "0" + minutes;
						if(seconds>9)
							curDateTime = curDateTime + seconds;
						else
							curDateTime = curDateTime + "0" + seconds;
						<%--var frm = document.getElementById("viewlist1");
                    	frm.elements["downloadFile"].value = filePath;
                    	frm.elements["fileName"].value = fileName;
					    frm.submit();--%>
					    alert("成功");
                    },
                    error: function () {
                    	alert("error");
                    }
                });	
        }
        
	function showDept(){
    	var btnEdit = this;
		nui.open({
            url:"<%=request.getContextPath() %>/machine/SelectOrganization.jsp",
			title: "选择列表",
			width: 650,
			height: 380,
			ondestroy: function (action) {
                //if (action == "close") return false;
                alert(action);
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须克隆
                    if (data) {                  	
						btnEdit.setValue(data.orgid);
		                btnEdit.setText(data.orgname);
                    }
                }
			}
        });
    }
	
	function onCancel(e) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();  
    }
</script>
</body>
</html>