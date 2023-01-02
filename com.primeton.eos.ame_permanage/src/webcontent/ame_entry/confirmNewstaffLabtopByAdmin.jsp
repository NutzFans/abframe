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
<title>行政办公电脑确认</title>
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
	<div id="form_Intend">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>入职人员基本信息</legend>
			<div style="padding:5px;">
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
					    <td align="right" style="width:130px">入职日期:</td>
                		<td  name="omIntendJoin.actdate"  class = "asLabel" id="actdate" style="width:190px"></td>
						<td align="right" style="width:130px;">直接主管:</td>
                		<td name="omIntendJoin.managername" id="managername" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:130px;">所属部门:</td>
						<td name="omIntendJoin.inorgname" class = "asLabel" id="inorgname" style="width:190px"></td>
					</tr>
					<tr>
					    <td align="right" style="width:130px;">归属子公司：</td>
	                	<td name="omIntendJoin.company" class = "asLabel" id="company" style="width:190px"></td>
						<td align="right" style="width:130px">工作地点：</td>
						<td name="omIntendJoin.intendworkplace" class = "asLabel" id="intendworkplace" style="width:190px"></td>
						<td align="right" style="width:130px">备注：</td>
						<td name="omIntendJoin.remark"  class = "asLabel" id="remark" style="width:190px"></td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset style="border: solid 1px #aaa; padding: 3px;" id="pc">
			<legend>入职员工办公电脑信息</legend>
			<div style="padding: 5px; margin-right: 37%;">
				<table style="width: 100%;">
					<tr>
						<td align="right" style="width: 95px;">电脑品牌：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.brands" id="brands" width="100%" class="nui-textbox" />
						</td>
						<td align="right" style="width: 95px;">型号：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.modelNo" id="modelNo" width="100%" class="nui-textbox" />
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 95px;">CPU：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.cpu" id="cpu" width="100%" class="nui-textbox" />
						</td>
						<td align="right" style="width: 95px;">内存（G）：</td>
						<td align="left" style="width: 140px;">
							<input property="editor" name="omIntendJoin.ram" id="ram" class="nui-spinner" vtype="int" minValue="0" maxValue="32" value="4" width="100%" />
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="field8" style="border: solid 1px #aaa; padding: 3px;">
			<div style="width: 100%;">
				<table style="width: 100%;">
					<tr align="left">
						<td style="width: 28px;" align="right" colspan="2">是否需要采购电脑：</td>
						<td style="width: 140px;" colspan="4">
							<input class="nui-radiobuttonlist" name="isBuyComputer" id="isBuyComputer" repeatItems="2" repeatLayout="table" repeatDirection="Horizontal" textField="text" valueField="id" required="true" style="width: 200px;"  value="1" data="[{'id': '1','text': '有库存'},{'id': '0','text': '需要采购电脑'}]">
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="capital" style="border: solid 1px #aaa; padding: 3px;">
			<legend>发起资产采购申请</legend>
			<fieldset id="field3" style="border: solid 1px #aaa; padding: 3px;">
				<input name="machineApply.fileids" id="fileids2" class="nui-hidden" />
				<input name="machineApply.status" id="status" class="nui-hidden" />
				<legend>资产申请信息</legend>
				<table style="table-layout: fixed;" id="table_file">
					<tr>
						<td style="width: 120px;" align="right">资产类型：</td>
						<td style="width: 150px;">
							<input class="nui-dictcombobox" name="machineApply.type" id="type" dictTypeId="MIS_MA_TYPE" required="true" emptyText="请选择" onvaluechanged="onTypeFilterChanged(this.value)" />
						</td>
						<td style="width: 120px;" align="right">子类型：</td>
						<td style="width: 150px;">
							<input class="nui-combobox" name="machineApply.sectype" id="sectype" required="true" emptyText="请选择" valueField="dictID" textField="dictName" parentField="parentId" />
						</td>
						<td style="width: 120px;" align="right">区域：</td>
						<td style="width: 150px;"><input class="nui-dictcombobox" name="machineApply.area" id="area" dictTypeId="EXP_REGION" required="true" emptyText="请选择" />
						</td>
					</tr>
					<tr>
						<td style="width: 120px;" align="right">管理方式：</td>
						<td style="width: 150px;">
							<input class="nui-dictcombobox" name="machineApply.storagetype" id="storageType" dictTypeId="MIS_MA_STORAGE" required="true" onvaluechanged="onNameFilterChanged(this.value)" emptyText="请选择" />
						</td>
						<td style="width: 120px;" align="right">数量：</td>
						<td style="width: 150px;">
							<input name="machineApply.num" id="num" class="nui-textbox" required="true" maxLength="10" />
						</td>
						<td style="width: 120px;" align="right">购买总金额：</td>
						<td style="width: 150px;">
							<input name="machineApply.price" id="price" class="nui-spinner" format="n2" required="true" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" />
						</td>
					</tr>
					<tr id="temp">
						<td width="120px" align="right">新员工主管：</td>
						<td width="150px">
							<input property="editor" name="machineApply.usingemp" id="usingemp" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false" />
						</td>
						<td width="120px" align="right">所属部门：</td>
						<td width="150px">
							<input property="editor" name="machineApply.dept" id="deptname" class="nui-buttonedit" value="" text="" onbuttonclick="showDept" showClose="false" required="true" allowInput="false" />
						</td>
						<td width="120px" align="right">所属项目：</td>
						<td width="150px">
							<input property="editor" name="machineApply.projectno" id="projectno" class="nui-buttonedit" value="" text="" onbuttonclick="selectProject" showClose="false" />
						</td>
					</tr>
					<tr>
						<td style="width: 120px;" align="right">型号：</td>
						<td style="width: 200px;" colspan="5">
							<input name="machineApply.model" id="model" style="width: 680px;" class="nui-textbox" required="false" id="model" maxLength="50" />
						</td>
					</tr>
					<tr>
						<td style="width: 120px;" align="right">配置：</td>
						<td style="width: 200px;" colspan="5">
							<input name="machineApply.configuration" style="width: 680px; height: 40px" id="configuration" class="nui-textarea" required="false" id="configuration" maxLength="500" />
						</td>
					</tr>
					<tr>
						<td style="width: 120px;" align="right">采购途径：</td>
						<td style="width: 200px;" colspan="5">
							<input name="machineApply.purmeans" id="purmeans" style="width: 680px; height: 40px" class="nui-textarea" emptyText="可输入采购物品的链接或供应商" required="false" maxLength="500" />
						</td>
					</tr>
					<tr>
						<td style="width: 120px;" id="third31" align="right">备注：</td>
						<td style="width: 150px;" colspan="5">
							<input name="machineApply.remarks" id="remarks" class="nui-textarea" style="width: 680px;" required="false" />
						</td>
					</tr>
				</table>
				<jsp:include page="/ame_common/addFiles2.jsp" />
			</fieldset>
		</fieldset>
	</div>
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
	var orgname;//受益部门名称
	var form_Intend = new nui.Form("form_Intend");
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	nui.get("brands").disable();
	nui.get("modelNo").disable();
	nui.get("cpu").disable();
	nui.get("ram").disable();
	nui.get("usingemp").disable();
	nui.get("deptname").disable();
	document.getElementById("capital").style.display="none";
	//资产采购流程操作提示
	//promptInit({"workItemID": 0,"processDefName": "com.primeton.eos.machine.machinePur","activityDefID": "manualActivity"});
	initLoadData();
	function initLoadData() {
		//资产采购申请人默认填报人
		//初始化拟入职人员信息
		nui.ajax({
			url : "org.gocom.abframe.org.intendstaff.addIntendStaffInfo.queryProcessIntendInfo.biz.ext",
			data : {intendid : null,workItemID :<%=workItemID %>,processInstID:null},
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
            		document.getElementById("inorgname").innerHTML = o.omIntendJoin.inorgname == null ?"":o.omIntendJoin.inorgname;
            		document.getElementById("managername").innerHTML = o.omIntendJoin.managername == null ?"":o.omIntendJoin.managername;
            		document.getElementById("actdate").innerHTML = o.omIntendJoin.actdate == null ?"":o.omIntendJoin.actdate.slice(0,11);
            		document.getElementById("remark").innerHTML = o.omIntendJoin.remark == null ?"":o.omIntendJoin.remark;
            		var omIntendJoinInfo = o.omIntendJoin;
            		//审批意见的流程实例ID
					nui.get("processinstid").setValue(o.workitem.processInstID);
	               	nui.get("processinstname").setValue(o.workitem.processInstName);
	               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
	               	nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID %>);
	               	nui.get("isshow").setValue("1");
	               	nui.get("backTo").setData(omIntendJoinInfo.backList);
	               	//员工所属主管
	               	var managerid = omIntendJoinInfo.managerid;
	               	//员工所属主管姓名
	               	var managername = omIntendJoinInfo.managername;
	               	//员工入职部门id
	               	var inorgid = omIntendJoinInfo.inorgid;
	               	//员工入职部门名称
	               	var inorgname = omIntendJoinInfo.inorgname;
	               	nui.get("usingemp").setValue(managerid);
				  	nui.get("usingemp").setText(managername);
				  	nui.get("deptname").setValue(inorgid);
				  	nui.get("deptname").setText(inorgname);
				  	orgname = inorgname;
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
  	
  	var rbl = nui.get("isBuyComputer");
    rbl.on("valuechanged", function (e) {
        toggleFieldSet(this.getValue());
    });
    
  	function toggleFieldSet(value) {
        if(value==0){//需要采购电脑
        	document.getElementById("capital").style.display="block";
        	var brands =  nui.get("brands").getValue();
		  	var modelNo =  nui.get("modelNo").getValue();
		  	var cpu =  nui.get("cpu").getValue();
		  	var ram =  nui.get("ram").getValue();
		  	//alert(modelNo);
		  	if(!!modelNo){
		  		nui.get("model").setValue(brands+"："+modelNo);
		  	}else{
		  		nui.get("model").setValue(brands);
		  	}
		  	nui.get("configuration").setValue("CPU："+cpu+"，"+"RAM（内存）："+ram+"G");
        	nui.get("type").setValue("EPC");
        	onTypeFilterChanged("EPC");
        }
        if(value==1){//有库存，不需要采购电脑
        	 nui.get("model").setValue();
		  	 nui.get("configuration").setValue();
        	 document.getElementById("capital").style.display="none";
        }
    }
    
  	//发起流程还是暂时保存
	function onOk(){
    	var auditstatus = nui.get("auditstatus").getValue();
    	if(auditstatus == "2"){	//终止流程
    		submitProcess("终止");
    	}else if(auditstatus == "0"){	//退回流程
    		if(!nui.get("backTo").getValue()){
    			nui.alert("退回环节不能为空！");
    			return;
    		}
    		submitProcess("退回");
    	}else if(auditstatus == "1"){	//提交流程
    		var isBuyComputer = nui.get("isBuyComputer").getValue();
			if(!!isBuyComputer){
				if(isBuyComputer=='0'){
					if(!form_Intend.validate()){
			    		nui.alert("资产申请信息录入不完整！");
			        	return;
			    	}
			    	//管理方式
					var storageType = nui.get("storageType").getValue();
					if(storageType==2){
						nui.alert("此流程管理方式不能选择“区域”！");
			        	return;
					}
			    	var price = nui.get("price").getValue();
			    	if(price <= 0){
			    		nui.alert("购买总金额必须大于0");
			    		return;
			    	}
				}
			}else{
				nui.alert("是否采购电脑项必须勾选！");
				return;
			}
    		submitProcess("提交");
    	}
	}
	/**
     * 提交
     */
    function submitProcess(title){
    	var isBuyComputer = nui.get("isBuyComputer").getValue();
    	var auditstatus = nui.get("auditstatus").getValue();
    	if(isBuyComputer=='0'&&auditstatus=='1'){//需要采购电脑
    		nui.confirm("确定" + title + "流程同时发起资产申请流程吗？", "操作提示",function (action) {            
	            if (action == "ok") {
	            	  nui.get("savePayProcess").disable();
				      nui.get("closeWin").disable();
			      	  SaveData();
	            }
        	});
    	}else{
    		nui.confirm("确定" + title + "流程吗？", "操作提示",function (action) {            
            if (action == "ok") {
            	  nui.get("savePayProcess").disable();
			      nui.get("closeWin").disable();
		      	  SaveData();
            }
        });
    	}
    }
    
	function SaveData(){
		var json = form_Intend.getData();
		var auditstatus = nui.get("auditstatus").getValue();
		//发起页面的处理信息
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;//保存意见
		if(auditstatus == "0"){//退回流程
			json.adminBackFlag='0';//行政电脑办公确认标识
			var backTo = nui.get("backTo").getValue();
			//回退信息
			if(backTo == 'manualActivity13' || backTo == 'manualActivity'){
			  	json.otherBackFlag='1';//入职接待以及入职接待以后的流程退回标识
	  		}
		}
		form_Intend.loading("处理中,请稍后...");
		nui.ajax({
			url:"org.gocom.abframe.org.intendstaff.addIntendStaffInfo.saveCapitalConfirmProcess.biz.ext",
			data: json,
			type:"post",
			contentType:"text/json",
			success:function(action){
				action = nui.clone(action);
				form_Intend.unmask();
				if(action.exception == null){
					nui.alert("行政办公电脑确认流程提交成功！","系统提示",function(){
	    				nui.get("savePayProcess").disable();
	    				if(auditstatus == "1"){//提交流程时才发起资产申请
	    					startCapitalProcess();
	    				}
	    				if(auditstatus != "1"){
	    					CloseWindow("ok");
	    				}
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
	
	var type ; //发起还是暂存
    function startCapitalProcess(){
    	type=1;
		document.getElementById("fileCatalog2").value="MIS_MACHINEAPPLY";
		form6.submit();
    }
    
	function SaveData2(){
		var mis = form_Intend.getData();//申请信息
		var misOpinion ={};//审核意见 
    	mis.machineApply.typename = nui.get("type").getText();
    	mis.machineApply.sectypename = nui.get("sectype").getText();
    	mis.machineApply.state = '0';
    	//先不设置关注按钮
		//var guanZhu = nui.get("guanZhuButton").getValue();//是否关注
		mis.machineApply.guanZhu = "";//是否关注
		var json =nui.encode({machineApply:mis.machineApply,misOpinion:misOpinion});
        save(json);
	}
	
	function save(data){
		var content;
    	if(type == '1'){
           	content = '资产申请流程发起中...';
		}
    	mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: content
        });
    	nui.ajax({
            url: "com.primeton.eos.machine.machineProcess.createMachineApply.biz.ext",
            data: data,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	nui.unmask(document.body);
        		var returnJson = nui.decode(text);
              	if(returnJson.result == "success"){
    				if(type==1){
	                   	nui.alert("资产申请流程发起成功！","系统提示",function (){
	                   		CloseWindow("ok");
	                   		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
	                   	});
    				}
              	}else if(text.result == "-2"){
      				nui.get("creatProcess").enable();
    				nui.get("saveProcess").enable();
    				if(type==1){
	                   	nui.alert("资产申请流程发起失败！失败原因：未设置审批人，请立即联系信息技术部！");
    				}
      			}else {
					//nui.get("creatProcess").enable();
					//nui.get("saveProcess").enable();
    				if(type==1){
	                   	nui.alert("资产申请流程发起失败！");
    				}
              	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
                CloseWindow();
            }
        });
	}
	
	function onTypeFilterChanged(value){
    	var tempType =value;
    	var json = {parentId:tempType};
    	nui.ajax({
    		url: "com.primeton.eos.machine.machine.getSecType.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function(o){
				var data = o.childType;
				var secType = nui.get("sectype");      	
				secType.load(data);
				secType.select(0);
            }
    	});
    }
    
    function onNameFilterChanged(e){
    	var tempType=e;
    	showEmpAndOrg(tempType);
    }
    
    function showEmpAndOrg(tempType){
    	if(tempType == 2){
    		nui.alert("此流程管理方式不能选择“区域”！");
    		return false;
    		//nui.get("usingemp").setValue("");
			//nui.get("deptname").setValue("");
			//nui.get("projectno").setValue("");   		
			//document.getElementById("temp").style.display = "none";
    		//nui.get("usingemp").setRequired(false);    
    		//nui.get("deptname").setRequired(false);    
    	} 
    	/* else {
    		document.getElementById("temp").style.display = "";
    		nui.get("usingemp").setRequired(true);    
    		nui.get("deptname").setRequired(true);    
    	}  */
    }
    //选择使用人
    function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.userid);
		                btnEdit.setText(data.empname);
		                var temp2=nui.get("deptname");
		                temp2.setValue(data.orgid);
		                temp2.setText(data.orgname);
		                orgname = data.orgname;
					}
				}
				nui.get("usingemp").validate();
				nui.get("deptname").validate();
			}
		});
	}
	//所属部门
    function showDept(e){
    	var btnEdit = this;
		nui.open({
            url:"<%=request.getContextPath() %>/machine/SelectOrganization.jsp",
			title: "选择列表",
			width: 650,
			height: 380,
			ondestroy: function (action) {
                //if (action == "close") return false;
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须克隆
                    if (data) {                   	
						btnEdit.setValue(data.orgid);
		                btnEdit.setText(data.orgname);
		                orgname = data.orgname;
                    }
                }
				nui.get("deptname").validate();
			}
        });
    }
	//选择项目
	function selectProject(){
		var btnEdit = this;
		var usingemp = nui.get("usingemp").getValue();
		if(usingemp == null || usingemp ==""){
			nui.alert("请先选择负责人，再选项目。");
			return;
		}else{
	        nui.open({
	            url:"<%=request.getContextPath()%>/ame_common/SelectProject.jsp?orgname="+orgname,
	            title: "选择项目",
	            width: 850,
	            height: 420,
	            ondestroy: function (action) {
	                if (action == "ok") {
	                    var iframe = this.getIFrameEl();
	                    var data = iframe.contentWindow.GetData();
	                    data = nui.clone(data);
	                    if (data) {
	                        btnEdit.setValue(data.projectno);
	                        btnEdit.setText(data.projectno);
	                    }
					}
				}
	        });
        }
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
</script>
</html>