<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2019-08-06 10:22:46
  - Description:
-->
<head>
<title>入职接待</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    .asLabel{border:0;background-color:#F5F5F5;cursor:default;}
</style>
</head>
<body>
<%long workItemID = (Long)request.getAttribute("workItemID"); %>
<div class="nui-fit">
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
	<form id="form_Intend" method="post">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>入职人员基本信息</legend>
			<div style="padding:5px;">
				<table style="table-layout:fixed;" id="table_intend1">
					<tr>
						<td align="right" style="width:130px">姓名：<span style="color: red;display:none" id = "isNameRepeat">(重复)</span></td>
						<td name="omIntendJoin.intendname" class = "asLabel" id="intendname" style="width:190px"></td>
						<td align="right" style="width:130px">出生日期：</td>
						<td name="omIntendJoin.birthdate" class = "asLabel" id="birthdate" style="width:190px"></td>
						<td align="right" style="width:130px">学历：</td>
						<td name="omIntendJoin.education" class = "asLabel" id="education" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">性别：</td>
						<td name="omIntendJoin.gender" class = "asLabel" id="gender" style="width:190px"></td>
						<td align="right" style="width:130px">手机号：</td>
						<td name="omIntendJoin.mobileno" class = "asLabel" id="mobileno" style="width:190px"></td>
						<td align="right" style="width:130px">私人邮箱：</td>
						<td name="omIntendJoin.email" class = "asLabel" id="email" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">职位分类：</td>
						<td name="omIntendJoin.position" class = "asLabel" id="position" style="width:190px"></td>
						<td align="right" style="width:130px">职位名称:</td>
                		<td name="omIntendJoin.positionname" id="positionname" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:130px">证件类型：</td>
						<td name="omIntendJoin.cardtype" class = "asLabel" id="cardtype" style="width:190px"></td>
					</tr>
					<tr>
					    <td align="right" style="width:130px">证件号：</td>
						<td name="omIntendJoin.cardno" class = "asLabel" id="cardno" style="width:190px"></td>
						<td align="right" style="width:130px">员工属性：</td>
						<td name="omIntendJoin.intendpositiontype" class = "asLabel" id="intendpositiontype" style="width:190px"></td>
						<td align="right" style="width:130px">人员性质：</td>
						<td name="omIntendJoin.intendjobtype" class = "asLabel" id="intendjobtype" style="width:190px"></td>
					</tr>
					<tr>
					    <td align="right" style="width:130px">参加工作年月：</td>
						<td name="omIntendJoin.worktime" class = "asLabel" id="worktime" style="width:190px"></td>
						<td align="right" style="width:130px">招聘专员：</td>
						<td name="omIntendJoin.intendrecempname" class = "asLabel" id="intendrecempname" style="width:190px"></td>
						<td align="right" style="width:130px">Base地点：</td>
						<td name="omIntendJoin.intendworkplace" class = "asLabel" id="intendworkplace" style="width:190px"></td>
					</tr>
					<tr>
					    <td align="right" style="width:130px">备注：</td>
						<td name="omIntendJoin.remark" class = "asLabel" id="remark" style="width:190px" colspan="5"></td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>入职基本信息</legend>
			<div style="padding:5px;">
				<input class="nui-hidden" id="workItemID" value="<%=workItemID %>"/>
				<input name="omIntendJoin.intendid" id="intendid"  class="nui-hidden"/>
				<input name="omIntendJoin.processinstid" id="processinstid2"  class="nui-hidden"/>
				<input name="omIntendJoin.fileids" id="fileids1" class="nui-hidden"/>
				<input name="omIntendJoin.intendname" class="nui-hidden"/>
				<input name="omIntendJoin.managerid" class="nui-hidden"/>
				<input name="omIntendJoin.isTrainee" class="nui-hidden"/>
				<input name="omIntendJoin.recruitid" class="nui-hidden"/>
				<input name="emp.empid" class="nui-hidden"/>
				<input name="emp.indate" class="nui-hidden"/>
				<input name="emp.company" class="nui-hidden"/>
				<input name="emp.empcode" class="nui-hidden"/>
				<input name="emp.orgid" class="nui-hidden"/>
				
				<input name="emp.major" class="nui-hidden" id="empmajor"/>
				<input name="emp.mentor" class="nui-hidden" id="empmentor"/>
				<input name="emp.mobileno" class="nui-hidden" id="empmobileno"/>
				<input name="emp.gender" class="nui-hidden" id="empgender"/>
				<input name="emp.cardtype" class="nui-hidden" id="empcardtype"/>
				<input name="emp.cardno" class="nui-hidden" id="empcardno"/>
				<input name="emp.positionname" class="nui-hidden" id="emppositionname"/>
				<input name="emp.positioncall" class="nui-hidden" id="emppositioncall"/>
				<input name="emp.workplace" class="nui-hidden" id="empworkplace"/>
				<input name="emp.welfareplace" class="nui-hidden" id="empwelfareplace"/>
				<input name="emp.pemail" class="nui-hidden" id="emppemail"/>
				<input name="emp.ishaveresi" class="nui-hidden" id="empishaveresi"/>
				<input name="emp.eduverify" class="nui-hidden" id="empeduverify"/>
				<input name="emp.emptype" class="nui-hidden" id="empemptype"/>
				<input name="emp.compmstartday" class="nui-hidden" id="empcompmstartday"/>
				<input name="emp.recruitsour" class="nui-hidden" id="emprecruitsour"/>
				<table style="table-layout:fixed;" id="table_entry1">
					<tr>
						<td align="right" style="width:130px;">实际入职日期:</td>
                		<td style="width:190px;" align="left">
						 	<input class="nui-datepicker" name="omIntendJoin.actdate" id="actdate" style="width:100%" required="true" onvaluechanged="changeactdate"/>
						</td>
						<td align="right" style="width:130px;">所属部门:</td>
						<td align="left" style="width:190px;">
						    <input class="nui-combobox"name="omIntendJoin.inorgid" id="orgid" url="com.primeton.eos.ame_fee.cashflow.getAllOrg.biz.ext" filterType="like" 
							textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" 
							allowInput="true"  required="true" style="width:100%;">
						</td>
						<td align="right" style="width:130px;">归属子公司(选择)：</td>
	                	<td style="width:190px;">    
                			<input name="omIntendJoin.company" id="company" class="nui-dictcombobox" dictTypeId="company" required="true"  style="width:100%;"/>
	                	</td>
					</tr>
					<tr>
						<td align="right" style="width:200px"   colspan="2">邮箱是否已开通，取消邮箱验证:
						</td>
						<td>
							<input class="nui-radiobuttonlist" name="omIntendJoin.isvalidatemail" id="isvalidatemail" repeatItems="2" repeatLayout="table" repeatDirection="Horizontal" textField="text" valueField="id" required="true" style="width:200px;" onvaluechanged="changeissendmail" data="[{'id': '1','text': '是'},{'id': '0','text': '否'}]">
						</td>
					</tr>
					<tr>
						<td align="right" style="width:130px;">员工工号:</td>
                		<td style="width:190px;" align="left">    
                    		<input name="omIntendJoin.empcode" id="empcode" class="nui-textbox"  width="100%" required="true" onvaluechanged="checkempcode"/>
                		</td>
						<td align="right" style="width:130px;">邮箱账号:</td>
                		<td style="width:190px;" align="left">    
                    		<input name="omIntendJoin.oemail" id="oemail" class="nui-textbox"  width="47%" required="true" onvaluechanged="checkoemail"/><input id="oemail1" width="53%" class="nui-textbox" readOnly="readOnly"/>
                		</td>
						<td align="right" style="width:130px;">系统账号:</td>
                		<td style="width:190px;" align="left">    
                    		<input name="omIntendJoin.userid" id="userid" class="nui-textbox"  width="100%" required="true" readOnly="readOnly"/>
                		</td>
					</tr>
				</table>
			</div>
		</fieldset><fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
			<legend>试用期期限基本信息</legend>
			<div style="padding:5px;">
				<table  style="table-layout:fixed;">
	                <tr>
	                	<td align="right" style="width:130px;">试用期开始时间：</td>
						<td style="width:190px;" align="left"> 
							<input class="nui-datepicker" name="omIntendJoin.probationstartdate" id="probationstartdate" style="width:100%" required="true" onvaluechanged="getDateNexThirdMonth('probationstartdate','probation','probationenddate')"/>
						</td>
						<td align="right" style="width:130px;">试用期期限(月)：</td>
						<td style="width:190px;" align="left">
							<input name="omIntendJoin.probation"  id="probation" class="nui-textbox"  onvaluechanged="getDateNexThirdMonth('probationstartdate','probation','probationenddate')" required="true" style="width:100%;" onblur="validate('probation')" value="3" inputStyle="text-align: right;"/>
						</td>
	                	<td align="right" style="width:130px;">试用期结束时间：</td>
						<td style="width:190px;" align="left"> 
							<input class="nui-datepicker" name="omIntendJoin.probationenddate" id="probationenddate" style="width:100%" required="true"/>
						</td>
	                </tr>
                </table>
			</div>
		</fieldset>
		
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>劳动合同期限基本信息</legend>
			<div style="padding:5px;">
				<table  style="table-layout:fixed;">
	                <tr>
	                	<td align="right" style="width:130px;">劳动合同开始时间：</td>
						<td style="width:190px;" align="left"> 
							<input class="nui-datepicker" name="omIntendJoin.laborstart" id="laborstart" style="width:100%" required="true" onvaluechanged="getDateNexThirdMonth('laborstart','laborterm','laborend')"/>
						</td>
						<td align="right" style="width:130px;">劳动合同期限(年)：</td>
						<td style="width:190px;" align="left">
							<input name="omIntendJoin.laborterm"  id="laborterm" class="nui-spinner" format="n2" showButton="false"  onvaluechanged="getDateNexThirdMonth('laborstart','laborterm','laborend')" required="true" style="width:100%;" <%--onblur="validate('laborterm')"--%> value="3" inputStyle="text-align: right;"/>
						</td>
	                	<td align="right" style="width:130px;">劳动合同结束时间：</td>
						<td style="width:190px;" align="left"> 
							<input class="nui-datepicker" name="omIntendJoin.laborend" id="laborend" style="width:100%" required="true"/>
						</td>
	                </tr>
                </table>
			</div>
		</fieldset>
	</form>
	
	<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		<legend>入职附件（招聘上传）</legend>
		<jsp:include page="/ame_common/detailFile.jsp"/>
	</fieldset>
	<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>入职附件（新员工上传）</legend>
		<jsp:include page="/ame_common/detailFile2.jsp"/>
	</fieldset>
    <!-- 审核意见  -->
	<jsp:include page="/ame_common/misOpinion.jsp"/>
	<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
		<legend>处理意见附件</legend>
		<jsp:include page="/ame_common/addFiles.jsp"/>
	</fieldset>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width:60px;margin-right:20px;" id="appButton">提交</a>
	<a class="nui-button"onclick="onCancel" iconCls="icon-close" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form_Intend = new nui.Form("form_Intend");
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	var isTrainee = null;
	initdate();
  	function initdate(){
  		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		//初始化拟入职人员信息
       	nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_entry.getProcessEntry.biz.ext",
            data: {intendid:null,workItemID:<%=workItemID %>,processInstID:null},
            type: 'POST',
            cache: false,
   			async:false,
            contentType: 'text/json',
            success: function (o) {
            	if(o.omIntendJoin){
            		form_Intend.setData(o);
            		document.getElementById("intendname").innerHTML = o.omIntendJoin.intendname == null ?"":o.omIntendJoin.intendname;
            		document.getElementById("birthdate").innerHTML = o.omIntendJoin.birthdate == null ?"":o.omIntendJoin.birthdate;
            		document.getElementById("education").innerHTML = o.omIntendJoin.education == null ?"":nui.getDictText('DEGREE',o.omIntendJoin.education);
            		document.getElementById("gender").innerHTML = o.omIntendJoin.gender == null ?"":nui.getDictText('ABF_GENDER',o.omIntendJoin.gender);
            		document.getElementById("mobileno").innerHTML = o.omIntendJoin.mobileno == null ?"":o.omIntendJoin.mobileno;
            		document.getElementById("email").innerHTML = o.omIntendJoin.email == null ?"":o.omIntendJoin.email;
            		document.getElementById("position").innerHTML = o.omIntendJoin.position == null ?"":nui.getDictText('AME_POSITION_MEMO',o.omIntendJoin.position);
            		document.getElementById("positionname").innerHTML = o.omIntendJoin.positionname == null ?"":o.omIntendJoin.positionname;
            		document.getElementById("cardtype").innerHTML = o.omIntendJoin.cardtype == null ?"":nui.getDictText('ABF_CARDTYPE',o.omIntendJoin.cardtype);
            		document.getElementById("cardno").innerHTML = o.omIntendJoin.cardno == null ?"":o.omIntendJoin.cardno;
            		document.getElementById("intendpositiontype").innerHTML = o.omIntendJoin.intendpositiontype == null ?"":nui.getDictText('EMP_TYPE',o.omIntendJoin.intendpositiontype);
            		document.getElementById("worktime").innerHTML = o.omIntendJoin.worktime == null ?"":o.omIntendJoin.worktime;
            		document.getElementById("intendrecempname").innerHTML = o.omIntendJoin.intendrecempname2 == null ?"":o.omIntendJoin.intendrecempname2;
            		document.getElementById("intendjobtype").innerHTML = o.omIntendJoin.intendjobtype == null ?"":nui.getDictText('AME_EMPTYPE2',o.omIntendJoin.intendjobtype);
            		document.getElementById("intendworkplace").innerHTML = o.omIntendJoin.intendworkplace == null ?"":nui.getDictText('AREA4CLRY',o.omIntendJoin.intendworkplace);
            		document.getElementById("remark").innerHTML = o.omIntendJoin.remark == null ?"":o.omIntendJoin.remark;
					
					isTrainee = o.omIntendJoin.isTrainee;
            		nui.get("oemail1").setValue(nui.getDictText('AME_SYSCONF','oemail'));
            		if(isTrainee == 1){
            			if(o.emp.oemail !=null && o.emp.oemail != '' && o.emp.oemail.indexOf("@")!=-1){
	            			nui.get("oemail").setValue(o.emp.oemail.split("@")[0]);
	            			nui.get("oemail").setReadOnly(true);
	            		}
	            		nui.get("empmajor").setValue(o.omIntendJoin.managerid);
	            		nui.get("empmentor").setValue(o.omIntendJoin.tutorid);
	            		nui.get("empmobileno").setValue(o.omIntendJoin.mobileno);
	            		nui.get("empgender").setValue(o.omIntendJoin.gender);
	            		nui.get("empcardtype").setValue(o.omIntendJoin.cardtype);
	            		nui.get("empcardno").setValue(o.omIntendJoin.cardno);
	            		nui.get("emppositionname").setValue(o.omIntendJoin.position);
	            		nui.get("emppositioncall").setValue(o.omIntendJoin.positionname);
	            		nui.get("empwelfareplace").setValue(o.omIntendJoin.welfare);
	            		nui.get("emppemail").setValue(o.omIntendJoin.email);
	            		nui.get("empishaveresi").setValue(o.omIntendJoin.ishaveresi);
	            		nui.get("empeduverify").setValue(o.omIntendJoin.eduverify);
	            		nui.get("empemptype").setValue(o.omIntendJoin.intendpositiontype);
	            		nui.get("emprecruitsour").setValue(o.omIntendJoin.recruitway);
						nui.get("empworkplace").setValue(o.omIntendJoin.intendworkplace);
            		}else if(o.omIntendJoin.oemail !=null && o.omIntendJoin.oemail != '' && o.omIntendJoin.oemail.indexOf("@")!=-1){
            			nui.get("oemail").setValue(o.omIntendJoin.oemail.split("@")[0]);
            		}
            		
            		//附件加载（招聘上传）
            		nui.get("grid_0").load({"groupid":"omIntendJoin","relationid":o.omIntendJoin.intendid});
            		//附件加载（新员工上传）
            		nui.get("grid_1").load({"groupid":"omIntendJoinInfo","relationid":o.omIntendJoin.intendid});
            		//审批意见的流程实例ID
					nui.get("processinstid").setValue(o.omIntendJoin.processinstid);
					//流程回退路径赋值 
                	nui.get("backTo").setData(o.omIntendJoin.backList);
               		//审核结果设置
					var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
					nui.get("auditstatus").setData(dataStatus);
					nui.get("auditstatus").setValue("1");
					nui.get("auditopinion").setValue("同意。");
					nui.get("workitemid").setValue(<%=workItemID %>);
               		nui.get("activitydefid").setValue(o.workitem.activityDefID);
					var processinstid = o.omIntendJoin.processinstid;
					var grid = nui.get("datagrid1");
					grid.load({"processInstID": processinstid});
					grid.sortBy("time", "desc");
					
					nameRepeat(o.omIntendJoin.intendname,o.omIntendJoin.userid);
            	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
		});
  	}
  	
  	//发起流程还是暂时保存
	function onOk(){
		var filePaths = document.getElementsByName("uploadfile").length;
    	for(var j = 0;j < filePaths;j++){
    		var a = document.getElementsByName("remarkList")[j].value;
    		if(a == null || a == ""){
    			nui.alert("新增附件不可以为空");
    			return false;
    		}
    	}
    	var auditstatus = nui.get("auditstatus").getValue();
    	if(!form_Intend.validate() && auditstatus!="2"){
			nui.alert("信息录入不完整!");
			return;
		}else{
    		document.getElementById("fileCatalog").value="omIntendJoin";
    		form2.submit();
		}
	}
	function SaveData1(){
		form2.submit();
	}
	
	function SaveData(){
		var json = form_Intend.getData();
		var message = "提交";
		//发起页面的处理信息
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		var intendpositiontypename = document.getElementById("intendpositiontype").innerHTML;
		var oemail1 = nui.get("oemail1").getValue();
		json.omIntendJoin.intendpositiontypename  = intendpositiontypename;
		json.omIntendJoin.oemail = json.omIntendJoin.oemail+oemail1;
		json.omIntendJoin.intendname = document.getElementById("intendname").innerHTML;
		
		var backTo = nui.get("backTo").getValue();
		//回退信息
		if(backTo == 'manualActivity13' || backTo == 'manualActivity'){
		  	json.omIntendJoin.adminBackFlag = "1";
  			json.omIntendJoin.otherBackFlag = "0";	
		}
		
		if(isTrainee == 1){
			json.emp.indate = json.omIntendJoin.actdate;
			json.emp.compmstartday = json.omIntendJoin.actdate; 
			json.emp.orgid = json.omIntendJoin.inorgid;
			json.emp.company = json.omIntendJoin.company;
			json.emp.empcode = json.omIntendJoin.empcode;
			json.emp.empcompmstartday = json.omIntendJoin.actdate; 
		}
		
		nui.confirm("确定要"+message+"新员工入职流程吗？","操作提示",function (action){
			if(action == "ok"){
				nui.get("appButton").setEnabled(false);
				form_Intend.loading("处理中,请稍后...");
	    		nui.ajax({
	    			url:"com.primeton.eos.ame_permanage.ame_entry.EntryProcessReve.biz.ext",
	    			data: json,
	    			type:"post",
	    			contentType:"text/json",
	    			success:function(action){
	    				action = nui.clone(action);
	    				form_Intend.unmask();
	    				console.log(action);
	    				if(action.exception == null){
	    					if(isTrainee == 1){
		    					nui.alert("提交成功！","系统提示",function(){
					        		CloseWindow("ok");
				    				nui.get("appButton").setEnabled(true);
					        	});
	    					}else{
	    						var creatwx = "";
		    					if(action.wxresult){
			                    	creatwx = "微信企业号人员未能成功同步，错误原因："+action.wxresult;
			                    }
			                    if(action.dxresult != 0){
			                    	if(creatwx==""){
			                    		creatwx += ",员工通知短信发送失败，请检查手机号码是否填写正确！";
			                    	}else{
			                    		creatwx = "员工通知短信发送失败，请检查手机号码是否填写正确！";
			                    	}
			                    }
		    					nui.alert("新员工账号创建成功！"+creatwx,"系统提示",function(){
					        		CloseWindow("ok");
				    				nui.get("appButton").setEnabled(true);
					        	});
	    					}
	    				}else if(action.exception == "fallsendmail"){
				        	nui.alert("新员工账号创建成功！提醒邮件发送失败，请手动发送入职提醒邮件！","系统提示",function(){
				        		CloseWindow("ok");
			    				nui.get("appButton").setEnabled(true);
				        	});
	    				}else{
	    					nui.alert("流程提交失败！","系统提示",function (){
			    				nui.get("appButton").setEnabled(true);
	    					});
	    				}
	    			},
	    			error:function(jqXHR, teactionatus, errorThrown){
	    				nui.alert("error:" + jqXHR.responseText);
	    			}
	    		});
			}
		});
	}
	//关闭
	function onCancel(e) {
    	var data = form_Intend.getData();
    	if(data){
        	nui.showMessageBox({
	            title: "关闭提示",
	            iconCls: "nui-messagebox-question",
	            buttons: ["yes", "no"],
	            message: "是否关闭？",
	            callback: function (action) {
	                if(action=="yes"){
	                	CloseWindow("cancel");
	                }
	            }
	        });
		}else{
			CloseWindow("cancel");
		}
    }
    function CloseWindow(action){
		if (action == "close" && form_Intend.isChanged()){
			if (confirm("数据被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	//校验员工工号是否重复（该功能改入到入职接待）
	function checkempcode (){
		var empcode = nui.get("empcode").getValue();
		//员工工号验重
		if(empcode){
			var json = nui.encode({empcode:empcode});
			$.ajax({
	            url: "com.primeton.eos.ame_permanage.ame_entry.checkempcode.biz.ext",
	            type: 'POST',
	            data: json,
	            contentType:'text/json',
	            async:false,
	            success: function (text) {
	                var result = text.result;
	                if(result == '1'){
	                	nui.alert("员工工号已存在！请输入新的员工工号。");
	                	nui.get("empcode").setValue('');
	                }
	            }
		     }); 
		}
	}
	
	function checkoemail(){
		var oemail = nui.get("oemail").getValue();
		var oemail1 = nui.get("oemail1").getValue();
		var isvalidatemail = nui.get("isvalidatemail").getValue();
		//员工工号验重
		if(oemail){
			if(isTrainee == 1 || isvalidatemail==1){
			}else{
				var json = nui.encode({userid:oemail,oemail:oemail+oemail1});
				$.ajax({
		            url: "com.primeton.eos.ame_permanage.ame_entry.checkoemail.biz.ext",
		            type: 'POST',
		            data: json,
		            contentType:'text/json',
		            async:false,
		            success: function (text) {
		                var result = text.result;
		                if(result == '2'){
		                	nui.alert("邮箱已存在！请输入新的邮箱。");
		                	nui.get("oemail").setValue('');
		                }else if(result == '1'){
		                	nui.alert("与邮箱同步的系统账号已存在！请输入新的邮箱。");
		                	nui.get("oemail").setValue('');
		                }
		            }
			     });
			}
		}
		nui.get("userid").setValue(nui.get("oemail").getValue());
	}
	
	function nameRepeat(name,userid){
		if(name != null && name != ''){
			var json = {"name":name,"userid":userid};
			nui.ajax({
	            url: "com.primeton.eos.ame_permanage.ame_entry.isNameRepeat.biz.ext",
	            type: 'POST',
	            data: json,
	            contentType:'text/json',
	            success: function (text) {
	                var isrepeat = text.isrepeat;
	                if(isrepeat > 0){
	                	document.getElementById("isNameRepeat").style.display="";
	                }else{
	                	document.getElementById("isNameRepeat").style.display="none";
	                }
	            }
		     }); 
		}else{
        	document.getElementById("isNameRepeat").style.display="none";
        }
	}
	
	//该表入职日期，同步试用期开始日期和劳动合同开始日期
    function changeactdate(){
    	var actdate = nui.get("actdate").getValue();//入职日期
    	var probationstartdate = nui.get("probationstartdate").getValue();//试用期开始日期
    	var laborstart = nui.get("laborstart").getValue(); //合同开始日期
		if(actdate != null && actdate != ''){
			nui.get("probationstartdate").setValue(actdate); 
			nui.get("laborstart").setValue(actdate); 
			getDateNexThirdMonth('probationstartdate','probation','probationenddate');
			getDateNexThirdMonth('laborstart','laborterm','laborend');
		}
    }
    
    //自动计算试用期结束日期
	function getDateNexThirdMonth(start,term,end){
		var veristart = nui.get(start).getValue()
		var veritime = nui.get(term).getValue();
		if(veritime == null || veritime == ''){
			veritime = 3;
		}
		if(term == "laborterm"){
			veritime = veritime * 12;
		}
		if(veristart != null && veristart != ''){
        	if(term == "laborterm"){//合同
				var json = ({"actdate":veristart,"month":veritime});
				nui.ajax({
		            url: "com.primeton.eos.ame_permanage.ame_entry.getNextMonth.biz.ext",
					type: 'POST',
					data: json,	
		            async:false,
					contentType: 'text/json',
		            success: function (o) {
	            		var enddate = new Date(o.probationenddate);
						if(enddate.getDate() <= 15){
							enddate = new Date(enddate.getFullYear(),enddate.getMonth(),15);
						}else{
							enddate = new Date(enddate.getFullYear(),enddate.getMonth()+1,0);
						}
	            		nui.get(end).setValue(enddate);
		            }
		        });
	        }
		}
		if(term == "probation"){//试用期
        	var month =parseFloat(veritime);
        	if(month==0){//如果试用期设置为0，试用期开始日期和结束日期都清空，同时将其设置为非必填
        		nui.get(start).setValue();//试用期开始日期
				nui.get(end).setValue();//试用期结束日期
				nui.get(start).setReadOnly(true); 
				nui.get(end).setReadOnly(true);
				nui.get(start).setRequired(false);
				nui.get(end).setRequired(false);  
        	}else{
        		nui.get(start).setReadOnly(false); 
				nui.get(end).setReadOnly(false);
				nui.get(start).setRequired(true);
				nui.get(end).setRequired(true);
				if(veristart&&veristart!=''){
					var date1 = new Date(veristart);
	        		if(month){
						var veriend = DateAdd("m", month, date1);
						var veriend1 = DateAdd("d", -1, veriend);
	        			nui.get(end).setValue(veriend1);
					}
				}else{
					nui.get(end).setValue();
				}   
        	}
		}
	}
	function DateAdd(interval, number, date) {
	    switch (interval) {
	    case "y": {
	        date.setFullYear(date.getFullYear() + number);
	        return date;
	        break;
	    }
	    case "q": {
	        date.setMonth(date.getMonth() + number * 3);
	        return date;
	        break;
	    }
	    case "m": {
	        date.setMonth(date.getMonth() + number);
	        return date;
	        break;
	    }
	    case "w": {
	        date.setDate(date.getDate() + number * 7);
	        return date;
	        break;
	    }
	    case "d": {
	        date.setDate(date.getDate() + number);
	        return date;
	        break;
	    }
	    case "h": {
	        date.setHours(date.getHours() + number);
	        return date;
	        break;
	    }
	    case "mm": {
	        date.setMinutes(date.getMinutes() + number);
	        return date;
	        break;
	    }
	    case "s": {
	        date.setSeconds(date.getSeconds() + number);
	        return date;
	        break;
	    }
	    default: {
	        date.setDate(d.getDate() + number);
	        return date;
	        break;
	    }
	    }
	}
</script>
</html>