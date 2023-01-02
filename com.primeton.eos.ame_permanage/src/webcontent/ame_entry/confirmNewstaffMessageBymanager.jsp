<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%String contextPath=request.getContextPath();%>
<html>
<!-- 
  - Author(s): jyw
  - Date: 2019-08-06 10:22:46
  - Description:
-->
<head>
<title>新员工入职主管确认</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%=contextPath %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    .asLabel{border:0;background-color:#F5F5F5;cursor:default;}
    .mini-textbox-border {
	    padding-left: 0px;
	}
</style>
</head>
<body>
<%long workItemID = (Long)request.getAttribute("workItemID"); %>
<div class="nui-fit">
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
	<form id="form_Intend" method="post">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>入职人员基本信息</legend>
			<input name="omIntendJoin.intendid" id="intendid"  class="nui-hidden"/>
			<input name="omIntendJoin.processinstid" id="processinstid2"  class="nui-hidden"/>
			<div style="padding:5px;margin-right: 8%;">
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width:130px">姓名：</td>
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
						<td align="right" style="width:130px">职位名称：</td>
						<td name="omIntendJoin.positionname" class = "asLabel" id="positionname" style="width:190px"></td>
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
					    <td align="right" style="width:130px">入职日期：</td>
                		<td  name="omIntendJoin.actdate"  class = "asLabel" id="actdate" style="width:190px"></td>
						<td align="right" style="width:130px;">所属部门：</td>
						<td name="omIntendJoin.inorgname" class = "asLabel" id="inorgname" style="width:190px"></td>
						<td align="right" style="width:130px;">归属子公司：</td>
	                	<td name="omIntendJoin.company" class = "asLabel" id="company" style="width:190px"></td>
					</tr>
					<tr>
					    <td align="right" style="width:130px">工作地点：</td>
						<td name="omIntendJoin.intendworkplace" class = "asLabel" id="intendworkplace" style="width:190px"></td>
						<td align="right" style="width:130px">备注：</td>
						<td name="omIntendJoin.remark" colspan = '3' class = "asLabel" id="remark" style="width:190px"></td>
					</tr>
				</table>
			</div>
		</fieldset>
		<div style="margin-right: 55%;padding: 5px;">
			<table style="width: 100%;">
				<tr>
					<td align="right" style="width: 28px;">员工是否自备工作电脑：</td>
					<td align="left" style="width: 73px;">
						<input name="omIntendJoin.isTakePC" width="66.4%" id="isTakePC" onvaluechanged="changePC(this.value)" class="nui-dictcombobox" dictTypeId="MIS_YN"/>
					</td>
				</tr>
			</table>
		</div>
		<fieldset id="pcField" style="border: solid 1px #aaa; padding: 3px;">
			<legend>入职员工办公电脑信息<span id="symbol">：</span><span style="color: red;" id="pcDesc">您只需大致填写员工所需工作电脑的要求即可，如：对CPU的要求、对内存的要求等。</span></legend>
			<div style="padding: 5px;margin-right: 32%;">
				<table style="width:100%;" id="pc">
					<tr>
						<td align="right" style="width: 80px;">电脑品牌：</td>
						<td align="left" style="width: 140px;height: 30px;">
							<input name="omIntendJoin.brands" id="brands"  width="100%" class="nui-textbox"/>
						</td>
						<td align="right" style="width: 80px;">型号：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.modelNo" id="modelNo" width="100%" class="nui-textbox"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 80px;">CPU：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.cpu" id="cpu" width="100%" class="nui-textbox" />
						</td>
						<td align="right" style="width: 80px;">内存（G）：</td>
						<td align="left" style="width: 140px;">
							<input property="editor" name="omIntendJoin.ram"  id="ram" class="nui-spinner" vtype="int" minValue="0" maxValue="32" value="4" width="100%"/>
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
	</form>
    <!-- 审核意见  -->
	<jsp:include page="/ame_common/misOpinion.jsp"/>
	<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
		<legend>处理意见附件</legend>
		<jsp:include page="/ame_common/addFiles.jsp"/>
	</fieldset>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width:60px; margin-right:20px;" id="savePayProcess">提交</a>
	<a class="nui-button"onclick="onCancel" iconCls="icon-close" style="width:60px;" id="closeWin">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form_Intend = new nui.Form("form_Intend");
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	//nui.get("isTakePC").disable();
	var brands;
	var modelNo;
	var cpu;
	var ram;
	initLoadData();
  	function initLoadData(){
  		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		//初始化拟入职人员信息
       	nui.ajax({
            url: "org.gocom.abframe.org.intendstaff.addIntendStaffInfo.queryProcessIntendInfo.biz.ext",
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
            		document.getElementById("intendjobtype").innerHTML = o.omIntendJoin.intendjobtype == null ?"":nui.getDictText('AME_EMPTYPE2',o.omIntendJoin.intendjobtype);
            		document.getElementById("intendworkplace").innerHTML = o.omIntendJoin.intendworkplace == null ?"":nui.getDictText('AREA4CLRY',o.omIntendJoin.intendworkplace);
            		document.getElementById("company").innerHTML = o.omIntendJoin.company == null ?"":nui.getDictText('company',o.omIntendJoin.company);
            		document.getElementById("inorgname").innerHTML = o.omIntendJoin.inorgname == null ?"":o.omIntendJoin.inorgname;
            		document.getElementById("actdate").innerHTML = o.omIntendJoin.actdate == null ?"":o.omIntendJoin.actdate.slice(0,11);
            		document.getElementById("remark").innerHTML = o.omIntendJoin.remark == null ?"":o.omIntendJoin.remark;
            		//disabledpc(o.omIntendJoin.isTakePC);
            		brands = o.omIntendJoin.brands;
            		modelNo = o.omIntendJoin.modelNo;
            		cpu = o.omIntendJoin.cpu;
            		ram = o.omIntendJoin.ram;
            		changePC(o.omIntendJoin.isTakePC);
            		//审批意见的流程实例ID
					nui.get("processinstid").setValue(o.workitem.processInstID);
	               	nui.get("processinstname").setValue(o.workitem.processInstName);
	               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
	               	nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID %>);
	               	nui.get("isshow").setValue("1");
	               	nui.get("backTo").setData(o.omIntendJoin.backList);
	            	//初始化处理意见
					initMisOpinion({auditstatus:"1"});
	            	//查询审核意见
					var grid = nui.get("datagrid1");
					if(o.workitem.processInstID!=null||o.workitem.processInstID!=""){
						grid.load({processInstID:o.workitem.processInstID});
						grid.sortBy("time", "desc");
					}
            	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
		});
  	}
  	
  	function changePC(value){
		var table = document.getElementById("pc");
		if(!!value){
			if(value==1){//员工自备电脑
				document.getElementById("pcField").style.display = "none";
				nui.get("brands").setValue();    
				nui.get("modelNo").setValue();
				nui.get("cpu").setValue(); 
				nui.get("ram").setValue();
			}else{//主管填写电脑配置
				document.getElementById("pcField").style.display = "";
				nui.get("brands").setValue(brands);    
				nui.get("modelNo").setValue(modelNo);
				nui.get("cpu").setValue(cpu); 
				nui.get("ram").setValue(ram);
			}
		}
	}
  	//发起流程
	function onOk(){
    	var auditstatus = nui.get("auditstatus").getValue();
    	var isTakePC = nui.get("isTakePC").getValue();
    	if(!form_Intend.validate()){
    		nui.alert("请检查表单的完整性!");
			return false;
    	}
    	if(auditstatus == "2"){	//终止流程
    		submitProcess("终止");
    	}else if(auditstatus == "0"){	//退回流程
    		if(!nui.get("backTo").getValue()){
    			nui.alert("退回环节不能为空！");
    			return;
    		}
    		submitProcess("退回");
    	}else if(auditstatus == "1"){//提交流程
    		if(isTakePC=='0'){
    			var brands = nui.get("brands").getValue();    
				var modelNo =nui.get("modelNo").getValue();
				var cpu =nui.get("cpu").getValue(); 
				var ram =nui.get("ram").getValue();
    			if(brands||modelNo||cpu){
    				submitProcess("提交");
    			}else{
    				nui.confirm("您确定不填写员工工作电脑配置信息，直接提交流程吗？", "操作提示",function (action) {            
			            if (action == "ok") {
			            	  nui.get("savePayProcess").disable();
						      nui.get("closeWin").disable();
					      	  SaveData();
			            }
			        });
    			}
    		}else{
    			submitProcess("提交");
    		}
    	}
	}
	/**
     * 提交
     */
    function submitProcess(title){
    	nui.confirm("确定" + title + "流程吗？", "操作提示",function (action) {            
            if (action == "ok") {
            	  nui.get("savePayProcess").disable();
			      nui.get("closeWin").disable();
		      	  SaveData();
            }
        });
    }
    
	function SaveData(){
		var json = form_Intend.getData();
		//发起页面的处理信息
		var opioionformData = opioionform.getData();
		var auditstatus = nui.get("auditstatus").getValue();
		json.misOpinion = opioionformData.misOpinion;//保存意见
		if(auditstatus == "0"){//退回流程
			json.omIntendJoin.adminBackFlag='0';//行政电脑办公确认标识
			var backTo = nui.get("backTo").getValue();
			//回退信息
			if(backTo == 'manualActivity13' || backTo == 'manualActivity'){
			  	json.otherBackFlag='1';//入职接待以及入职接待以后的流程退回标识
	  		}
		}
		var intendpositiontypename = document.getElementById("intendpositiontype").innerHTML;
		json.omIntendJoin.intendpositiontypename  = intendpositiontypename;
		json.omIntendJoin.intendname = document.getElementById("intendname").innerHTML;
		form_Intend.loading("处理中,请稍后...");
		nui.ajax({
			url:"org.gocom.abframe.org.intendstaff.addIntendStaffInfo.saveIntendsProcess.biz.ext",
			data: json,
			type:"post",
			contentType:"text/json",
			success:function(action){
				action = nui.clone(action);
				form_Intend.unmask();
				var exception = action.exception;
				if(!exception){
						nui.alert("新员工入职主管确认流程提交成功！","系统提示",function(){
		        		CloseWindow("ok");
	    				nui.get("savePayProcess").disable();
		        	});
				}else{
					nui.alert("流程提交失败！","系统提示",function (){
	    				nui.get("savePayProcess").disable();
					});
				}
			},
			error:function(jqXHR, teactionatus, errorThrown){
				nui.alert("error:" + jqXHR.responseText);
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
	                	CloseWindow("cancel")
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
</script>
</html>