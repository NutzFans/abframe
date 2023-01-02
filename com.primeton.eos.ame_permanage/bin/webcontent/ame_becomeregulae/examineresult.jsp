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
  - Date: 2020-03-13 10:07:23
  - Description:
-->
<head>
<title>试用期考试结果确认</title>
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
	<form id="form1" method="post">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>待转正员工基本信息</legend>
			<div style="padding:5px;">
				<input name="emp.empid" id="empid"  class="nui-hidden"/>
				<input name="emp.userid" id="userid"  class="nui-hidden"/>
				<input name="emp.empname" id="empname1"  class="nui-hidden"/>
				<input name="emp.oemail" id="oemail1"  class="nui-hidden"/>
				<input name="emp.major" id="major"  class="nui-hidden"/>
				<input name="emp.orgid" id="orgid"  class="nui-hidden"/>
				<input name="ver.processinstid" id="processinstid"  class="nui-hidden"/>
				<input name="ver.empveriid" id="empveriid"  class="nui-hidden"/>
				<input name="ver.veristart" id="veristart1"  class="nui-hidden"/>
				<input name="ver.veriend" id="veriend"  class="nui-hidden"/>
				<table style="table-layout:fixed;" >	
					<tr>
						<td align="right" style="width:130px">姓名：</td>
						<td name="emp.empname" class = "asLabel" id="empname" style="width:190px"></td>
						<td align="right" style="width:130px">员工工号：</td>
						<td name="emp.empcode" class = "asLabel" id="empcode" style="width:190px"></td>
						<td align="right" style="width:130px">所属部门：</td>
						<td name="emp.orgname" class = "asLabel" id="orgname" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">职位：</td>
						<td name="emp.positionname" class = "asLabel" id="positionname" style="width:190px"></td>
						<td align="right" style="width:130px">直属主管：</td>
						<td name="emp.majorname" class = "asLabel" id="majorname" style="width:190px"></td>
						<td align="right" style="width:130px">入职导师：</td>
						<td class = "asLabel" name="emp.mentor" id="mentor" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">试用期时间：</td>
						<td name="ver.veristart" class = "asLabel" id="veristart" style="width:190px"></td>
						<td align="right" style="width:130px">邮箱：</td>
						<td name="emp.oemail" class = "asLabel" id="oemail" style="width:190px"></td>
						<td align="right" style="width:130px">联系电话：</td>
						<td name="emp.mobileno" class = "asLabel" id="mobileno" style="width:190px"></td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>考试结果</legend>
			<div style="padding:5px;">
				<table style="table-layout:fixed;" >	
					<tr>
						<td align="right" style="width:130px">考试通过：</td>
						<td >
							<input class="nui-radiobuttonlist" name="emp.test" id="test" required="true" data="[{'id': '1','text': '是'},{'id': '0','text': '否'}]" onvaluechanged='changetest'/>
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
	</form>
	<fieldset style="border:solid 1px #aaa;padding:3px;display:true;" >
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</fieldset>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" iconCls="icon-ok" style="width:60px;margin-right:20px;" id="appButton">提交</a>
	<a class="nui-button"onclick="onCancel" iconCls="icon-close" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form1 = new nui.Form("form1");
	var testmessage = '';
	
	initdate();
  	function initdate(){
  		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_becomeregulae.getRegularProcess.biz.ext",
            data: {workItemID:<%=workItemID %>,processInstID:null},
            type: 'POST',
			contentType: 'text/json',
            success: function (o) {
            	data = o;
            	if(data.ver){
            		document.getElementById("empname").innerHTML = o.emp.empname == null ?"":o.emp.empname;
            		document.getElementById("empcode").innerHTML = o.emp.empcode == null ?"":o.emp.empcode;
            		document.getElementById("orgname").innerHTML = o.emp.orgname == null ?"":o.emp.orgname;
            		document.getElementById("positionname").innerHTML = o.emp.positionname == null ?"":nui.getDictText('AME_POSITION_MEMO',o.emp.positionname);
            		document.getElementById("majorname").innerHTML = o.emp.majorname == null ?"":o.emp.majorname;
            		document.getElementById("veristart").innerHTML = (o.ver.veristart == null ?"":o.ver.veristart+'至')+(o.ver.veriend == null ?"":o.ver.veriend);
            		document.getElementById("mentor").innerHTML = o.emp.mentorname == null ?"":o.emp.mentorname;
            		document.getElementById("oemail").innerHTML = o.emp.oemail == null ?"":o.emp.oemail;
            		document.getElementById("mobileno").innerHTML = o.emp.mobileno == null ?"":o.emp.mobileno;
            		form1.setData(data);
            		
            		testmessage = o.workitem.activityDefID ==  'manualActivity3'?"第一次考试":"第二次考试";
            		//流程回退路径赋值 
                	nui.get("backTo").setData(o.ver.backList);
	                //审核结果设置
					var dataStatus = [{"dictID": 4,"dictName": "处理"},{"dictID": 0,"dictName": "退回"}];
					nui.get("auditstatus").setData(dataStatus);
					nui.get("auditstatus").setValue("4");
					nui.get("auditopinion").setValue("处理。");
					nui.get("workitemid").setValue(<%=workItemID %>);
               		nui.get("activitydefid").setValue(o.workitem.activityDefID);
					nui.get("processinstid").setValue(o.ver.processinstid);
					var processinstid = o.ver.processinstid;
					var grid = nui.get("datagrid1");
					grid.load({"processInstID": processinstid});
					grid.sortBy("time", "desc");
					
					nui.get("test").setValue(null);
        		}
    		},
    		 error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
		});	
  	}
  	
  	function onOk(){
  		var auditstatus = nui.get("auditstatus").getValue();
  		if(auditstatus == "0"){	//退回
    		if(!nui.get("backTo").getValue()){
    			nui.alert("退回环节不能为空！");
    			return;
    		}
    	}
  		if(!form1.validate() && auditstatus!="2" && auditstatus!="0"){
			nui.alert("信息录入不完整!");
			return;
		}else{
    		SaveData();
		}
  	}
  	
  	function SaveData(){
		var json = form1.getData();
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		nui.confirm("确定要提交转正流程吗？","操作提示",function (action){
			if(action == "ok"){
				nui.get("appButton").setEnabled(false);
				form1.loading("处理中,请稍后...");
				nui.ajax({
	    			url:"com.primeton.eos.ame_permanage.ame_becomeregulae.BecomeProcessReve.biz.ext",
	    			data: json,
	    			type:"post",
	    			contentType:"text/json",
	    			success:function(action){
	    				action = nui.clone(action);
	    				form1.unmask();
	    				if(action.exception == null){
	    					nui.alert("提交转正流程成功！","系统提示",function(){
				        		CloseWindow("ok");
			    				nui.get("appButton").setEnabled(true);
				        	});
	    				}else if(action.exception == '2'){
    						nui.alert("提交转正流程成功！但通知员工考试未通过邮件发送失败，请手动联系！","系统提示",function(){
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
    	var data = form1.getData();
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
		if (action == "close" && form1.isChanged()){
			if (confirm("数据被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	function changetest(){
		var testnow = nui.get("test").getValue();
		if(testnow == '1'){
			nui.get("auditopinion").setValue(testmessage+"通过。");
		}else{
			nui.get("auditopinion").setValue(testmessage+"不通过。");
		}
	}
</script>
</html>