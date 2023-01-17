<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-07-19 16:57:28
  - Description:
-->
<head>
	<title>查看简历</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit" id="form1">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<input name="resume.resumeid" id="resumeid" class="nui-hidden">
			<legend >基本信息</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:80px;font-size:12px;">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
						<td id="resume.empname" style="width:120px;font-size:12px;"></td>
						<td align="right" style="width:80px;font-size:12px;">员工工号:</td>
						<td id="resume.userid" style="width:120px;font-size:12px;"></td>
						<td align="right" style="width:80px;font-size:12px;">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
						<td id="resume.gender" style="width:120px;font-size:12px;"></td>
						<td align="right" style="width:80px;font-size:12px;">出生年月:</td>
						<td id="resume.birthdate" style="width:120px;font-size:12px;"></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;font-size:12px;">身份证号:</td>
						<td id="resume.cardno" style="width:120px;font-size:12px;"></td>
						<td align="right" style="width:80px;font-size:12px;">参加工作年月:</td>
						<td id="resume.workdate" style="width:120px;font-size:12px;"></td>
						<td align="right" style="width:80px;font-size:12px;">入职年月:</td>
						<td id="resume.indate" style="width:120px;font-size:12px;"></td>
						<td align="right" style="width:80px;font-size:12px;">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历:</td>
						<td id="resume.education" style="width:120px;font-size:12px;"></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;font-size:12px;">毕业院校:</td>
						<td id="resume.school" colspan="3" ></td>
						<td align="right" style="width:80px;font-size:12px;">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业:</td>
						<td id="resume.specialty" colspan="3" ></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;font-size:12px;">当前部门:</td>
						<td id="resume.orgname" style="width:120px;font-size:12px;"></td>
						<td align="right" style="width:80px;font-size:12px;">当前职务:</td>
						<td id="resume.duty" style="width:120px;font-size:12px;"></td>
						<td align="right" style="width:80px;font-size:12px;">技术级别:</td>
						<td id="resume.technology" style="width:120px;font-size:12px;"></td>
						<td align="right" style="width:80px;font-size:12px;">人员类型:</td>
						<td id="resume.emptype" style="width:120px;font-size:12px;"></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;font-size:12px;">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</td>
						<td id="resume.email" style="width:120px;font-size:12px;"></td>
						<td align="right" style="width:80px;font-size:12px;">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:</td>
						<td id="resume.tel" style="width:120px;font-size:12px;"></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;font-size:12px;" valign="top" >专业能力综述:</td>
						<td id="resume.abilitydescription"  colspan="7" ></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;font-size:12px;">其他说明:</td>
						<td id="resume.otherdescription"  colspan="7" ></td>
					</tr>
				</table>
			</div>
		</fieldset>
		
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend >工作经历</legend>
			<div id="workExp" class="nui-datagrid" style="width:100%;height:auto;" dataField="workExp"
	            showPager="false" url="com.primeton.eos.ame_resume.resumeManage.getWorkExp.biz.ext" allowCellWrap="true">
	            <div property="columns">
	            	<div field="startdate" width="50" headerAlign="center" dateFormat="yyyy-MM" align="center">服务开始年月</div>
	                <div field="enddate" width="50" headerAlign="center" dateFormat="yyyy-MM" align="center">服务截止年月</div>
	                <div field="companyname" width="100" headerAlign="center" align="left">公司名称</div>
	                <div field="duty" width="80" headerAlign="center" align="center">担任职务</div>
	                <div field="workdescription" width="220" headerAlign="center" align="left">工作说明</div>
	            </div>
            </div>
		</fieldset>
		
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend >项目经验 </legend>
			<div id="projExp" class="nui-datagrid" style="width:100%;height:auto;" dataField="projExp"
	            showPager="false" url="com.primeton.eos.ame_resume.resumeManage.getProjExp.biz.ext" allowCellWrap="true">			            
	            <div property="columns">
	            	<div field="beginenddate" width="70" headerAlign="center" align="center">开始年月</div>
	            	<div field="enddate" width="70" headerAlign="center" align="center">截至年月</div>
	                <div field="projectname" width="90" headerAlign="center" align="left">项目名称</div>
	                <div field="custname" width="80" headerAlign="center" align="left">客户名称</div>
	                <div field="projectintroduce" width="200" headerAlign="center" align="left">项目介绍</div>
	                <div field="projectduty" width="200" headerAlign="center" align="left">项目职责及主要工作</div>
            	</div>
        	</div>
		</fieldset>
		
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>有关证件（证书）</legend>
			<div id="cert" class="nui-datagrid" style="width:100%;height:auto;" dataField="cert"
	            showPager="false" url="com.primeton.eos.ame_resume.resumeManage.getCert.biz.ext" allowCellWrap="true">			            
	            <div property="columns">
	            	<div field="cardtype" width="80" headerAlign="center" align="left" renderer="onCertTypeRenderer">证件（证书）类型</div>
	                <div field="cardno" width="120" headerAlign="center" align="left">证件号码</div>
	                <div field="startdate" width="50" headerAlign="center" dateFormat="yyyy-MM-dd" align="center">有效开始日期</div>
	                <div field="enddate" width="50" headerAlign="center" dateFormat="yyyy-MM-dd" align="center">有效截止日期</div>
	                <div field="files" renderer="onFileRenderer" width="200" hight="100"  align="center" headerAlign="center">附件</div>
	                <div field="remark" width="200" headerAlign="center" align="left">备注</div>
            	</div>
        	</div>
	    </fieldset>
	</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 

	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="downloadResume()" id="saveExpRei" iconCls="icon-download">导出人员简历</a>
		<a class="nui-button" onclick="onCancel('cancel')" id="closeResume" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		var workExp = nui.get("workExp");
		var projExp = nui.get("projExp");
		var cert = nui.get("cert");
		var resumeid = "";
		
		function SetData(data){
			data = nui.clone(data);
			resumeid = data.resumeid;
			var json = nui.encode({resumeid: data.resumeid});
			nui.ajax({
				url: "com.primeton.eos.ame_resume.resumeManage.queryResumeByResumeid.biz.ext",
				data: json,
				type: 'POST',
				cache: false,
				contentType: 'text/json',
				success: function(text){
					document.getElementById("resume.empname").innerHTML = text.resume.empname == null ? "" : text.resume.empname;
					document.getElementById("resume.userid").innerHTML = text.resume.userid == null ? "" : text.resume.userid;
					document.getElementById("resume.gender").innerHTML =nui.getDictText('ABF_GENDER',text.resume.gender);
					document.getElementById("resume.birthdate").innerHTML = text.resume.birthdate == null ? "" : text.resume.birthdate;
					document.getElementById("resume.cardno").innerHTML = text.resume.cardno == null ? "" : text.resume.cardno;
					document.getElementById("resume.workdate").innerHTML = text.resume.workdate == null ? "" : text.resume.workdate;
					document.getElementById("resume.indate").innerHTML = text.resume.indate == null ? "" : text.resume.indate;
					document.getElementById("resume.education").innerHTML =nui.getDictText('DEGREE',text.resume.education);
					document.getElementById("resume.school").innerHTML = text.resume.school == null ? "" : text.resume.school;
					document.getElementById("resume.specialty").innerHTML = text.resume.specialty == null ? "" : text.resume.specialty;
					document.getElementById("resume.orgname").innerHTML = text.resume.orgname == null ? "" : text.resume.orgname;
					document.getElementById("resume.duty").innerHTML = text.resume.duty == null ? "" : text.resume.duty;
					document.getElementById("resume.technology").innerHTML =nui.getDictText('AME_TECH',text.resume.technology);
					document.getElementById("resume.emptype").innerHTML =nui.getDictText('AME_EMPTYPE2',text.resume.emptype);
					document.getElementById("resume.email").innerHTML = text.resume.email == null ? "" : text.resume.email;
					document.getElementById("resume.tel").innerHTML = text.resume.tel == null ? "" : text.resume.tel;
					document.getElementById("resume.otherdescription").innerHTML = text.resume.otherdescription == null ? "" : text.resume.otherdescription;
					document.getElementById("resume.abilitydescription").innerHTML = text.resume.abilitydescription == null ? "" : text.resume.abilitydescription;
					workExp.load({ resumeid: data.resumeid});
					workExp.sortBy("startdate", "desc");
		            projExp.load({ resumeid: data.resumeid});
		            projExp.sortBy("beginenddate", "desc");
		            cert.load({ resumeid: data.resumeid});
				},
    			error: function(jqXHR, textStatus, errorThrown){
    				alert(jqXHR.responseText);
    			}
    		});
		}
		
		function downloadResume(){
	    	var json = nui.encode({"resumeid":resumeid});
	    	nui.ajax({
    			url: "com.primeton.eos.ame_resume.resumeManage.exportResume.biz.ext",
    			data: json,
    			type: 'POST',
    			cache: false,
    			contentType: 'text/json',
    			success: function(text){
					nui.unmask();
		     		var filePath = text.downloadFile;
		        	var fileName = "简历";
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
    			error: function(jqXHR, textStatus, errorThrown){
    				alert(jqXHR.responseText);
    				CloseWindow();
    			}
    		});
	    }
	    
	    function onCancel(e) {
			CloseWindow("cancel");
        }
		
		function CloseWindow(action){
    		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
    		else window.close();
    	}
		
		function onCertTypeRenderer(e){
			return nui.getDictText('AME_CERTTYPE',e.value);//设置业务字典值
		}
		
		function onFileRenderer(e) {
	        var tempSrc = "";
        	//长度为1，不换行
        	if(e.record.files==null){
        		return;
        	}
        	if(e.record.files.length == 1){
	        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[0].fileId + "'>" + e.record.files[0].fileName + "</a>";
        	}else{
		        for(var i=0;i<e.record.files.length;i++){
		        	//长度大于1小于长度length换行
		        	if(i< e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>&nbsp;&nbsp;";
		        	}
		        	//最后一个不换行
	        		if(i == e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>";
		        	}
		        }
        	}
	       	return tempSrc;
	     }
	</script>
</body>
</html>