<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="java.util.Map" %>
<%String contextPath=request.getContextPath();%>
<html>
<!-- 
  - Author(s): JYW
  - Date: 2019-11-05 17:25:35
  - Description:
-->
<head>
	<title>发起招聘需求审批流程</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%=contextPath%>/common/nui/nui.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;
	    }
    </style>
</head>
<body>
	<div class="nui-fit" style="border:solid 0px #aaa;padding:0px;width:auto">
		<div class="mini-panel" title="发起招聘需求审批流程" style="width: 100%">
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<div id="form1" >
			<fieldset id="field1" style="border:solid 1px #aaa;">
				<legend>新增招聘需求</legend>
				<input name="omRecruit.fileids" id="fileids" class="nui-hidden" />
				<!-- 表单公共页面 -->
				<jsp:include page="/abframe/org/recruit/recruitApprovalCommon.jsp"/>
				<div style="margin-left:0.5px;margin-right:1px;">
					<jsp:include page="/ame_common/addFiles.jsp"/>
				</div>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;">
				<legend>招聘需求岗位面试轮次设置<span style="color: red">（审核环节可以调整）</span></legend>
				<div style="width:100%;">
			        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="mini-button" iconCls="icon-add" onclick="addRow('datagridInterview')" plain="true" tooltip="增加...">增加</a>
			                        <a class="mini-button" iconCls="icon-remove" onclick="removeRow('datagridInterview')" plain="true">删除</a>
			                        <!-- <a class="mini-button" iconCls="icon-save" onclick="saveInterviewData()" plain="true">保存</a> -->
			                        <a class="mini-button" iconCls="icon-upload" onclick="moveRowUp('datagridInterview')" plain="true">上移</a>
			                        <a class="mini-button" iconCls="icon-download" onclick="moveRowDown('datagridInterview')" plain="true">下移</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
			    <div id="datagridInterview" class="nui-datagrid" style="width:100%;height:auto;" 
			        url="org.gocom.abframe.org.recruitApproval.recruitApproval.getInterviewSchedule.biz.ext" idField="id" dataField="recInterSchds"
			        allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
			        editNextOnEnterKey="true"  editNextRowCell="true" allowAlternating ="true" showLoading="true" showPager="false">
			        <div property="columns">
			         	<div type="checkcolumn"></div>
			            <div headerAlign="center" field="interviewRound" type="indexcolumn" width="10%">面试轮次</div>
			            <div headerAlign="center" field="interviewroundes" visible="false" readOnly="true">面试轮次</div>
			            <div name="beginEditCell" displayField="interviewername" field="interviewer" headerAlign="center" width="50%" >面试官
			            	<input property="editor"  class="mini-textboxlist" searchField="name"
								url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext" value="" text=""
								textField="EMPNAME" valueField="USERID" required="true" width="100%" />
			            </div>
			            <div field="interviewerrole" headerAlign="center" renderer="getRole" width="40%">面试官角色
			                <input property="editor" class="nui-dictcombobox" dictTypeId="INTERVIEWER_ROLE" required="true" style="width:200px;" minWidth="200" minHeight="50"/>
			            </div>
			        </div>
			    </div>
			</fieldset>
		</div>
		<form id="opioionform" method="post">
		    <div style="padding:5px;margin-left: 60px;">
		        <table style="table-layout:fixed;">
		        	<tr style="display:none;">
		                <td style="width:150px;" align="right">审核结果:</td>
		                <td style="width:250px;">  
							<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
		                </td>
		            </tr>
		            <tr style="display:none;">
		                <td style="width:150px;height:auto;" align="right">任务处理说明：</td>
		                <td colspan="3">
		                    <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" maxLength="500"  required="false" style="width:600px;height:60px;"/>&nbsp;<span style="color: red">*最多只能输入500个字符</span>
		                </td>
		            </tr>
		        </table>
		    </div>
		</form>
		</div>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注流程</a>      
	    <a class="nui-button" onclick="onOk('1')" id="creatPayProcess" style="width:80px;margin-right:20px;">发起流程</a>
		<a class="nui-button" onclick="onOk('0')" id="savePayProcess"style="width:80px;margin-right:190px;">暂时保存</a>      
	</div> 
</body>
<script type="text/javascript">
	nui.parse();
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	var form = new nui.Form("form1");
	var opioionform = new nui.Form("opioionform");//审批意见
	//面试轮次安排
	var datagridInterview = nui.get("datagridInterview");
	var nowuserid='<%=nowuserid %>';
	var nowusername='<%=nowusername%>';
	//隐藏招聘专员
	document.getElementById("recruitPerson").style.display="none";
	document.getElementById("recruitPerson1").style.display="none";
	/* document.getElementById("isreferrer").style.display="none";
	document.getElementById("isreferrer1").style.display="none"; */
	initData();
	function initData(){
		//var recuserid = nui.get("recuserid");
		var applyuserid = nui.get("applyuserid");
		//recuserid.setValue(nowuserid);
		//recuserid.setText(nowusername);
		applyuserid.setValue(nowuserid);
		applyuserid.setText(nowusername);
		//流程操作提示
	  	promptInit({"workItemID":0,"processDefName":"org.gocom.abframe.org.recruitApproval.recruit_approval","activityDefID":"manualActivity"});
	}
	
	/* //保存面试安排计划数据
	function saveInterviewData() {
		datagridInterview.loading("数据保存中……");
		var changeData = setInterviewRounds();
		var recruitid = nui.get("recruitid").getValue();
		var json = nui.encode({"recruitInterviewSchedule":changeData,"recruitid":recruitid});
		nui.ajax({
			url: "org.gocom.abframe.org.recruitApproval.recruitApproval.saveInterviewerSchedule.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
	        success: function (o) {
	        	datagridInterview.unmask();
	        	datagridInterview.reload();
		    	if(o.retValue == 'success'){
		    		nui.alert("面试安排计划保存成功！","保存提示");
		    	}else{
		    		nui.alert("面试安排计划保存失败！","保存提示");
		    	}
		    }
		});         
	} */
	//设置面试计划安排轮次
	function setInterviewRounds(){
		var datas =  datagridInterview.getData();
		var rowData = {};
		var rowIndex;
		for(var i=0;i<datas.length;i++){
			rowIndex = datagridInterview.indexOf(datas[i])+1;
			if(datas[i].interviewroundes!=rowIndex){
				rowData = {"interviewroundes":rowIndex};
				datagridInterview.updateRow(datas[i],rowData);
			}
		}
		var changeData =datagridInterview.getChanges();
		return changeData;
	}
	function addRow(gridId) {
		var grid = nui.get(gridId);
		var datas =  grid.getData();
		var length = datas.length;     
		var newRow = { name: "New Row" };
		grid.addRow(newRow, length);
		grid.beginEditCell(newRow, "beginEditCell");
	}
	
	function removeRow(gridId) {
		var grid = nui.get(gridId);
		var rows = grid.getSelecteds();
		if (rows.length > 0) {
			grid.removeRows(rows, true);                
		}
	}
	
	function moveRowUp(gridId){
		/* var row = grid.getSelected();
		var index = grid.indexOf(row);
		grid.moveRow(row,index-1);  */
		var grid = nui.get(gridId);
		var rows = grid.getSelecteds();
		grid.moveUp(rows);
	}
	
	function moveRowDown(gridId){
		/* var row = grid.getSelected();
		var index = grid.indexOf(row);
		grid.moveRow(row,index+1); */
		var grid = nui.get(gridId);
		var rows = grid.getSelecteds();
		grid.moveDown(rows);
	}
	
	datagridInterview.on("celleditenter", function (e) {
		var index = datagridInterview.indexOf(e.record);
		if (index == datagridInterview.getData().length - 1) {
			var row = {};
			datagridInterview.addRow(row);
		}
	});
	
	var rbl = nui.get("interviewer");
    rbl.on("valuechanged", function (e) {
    	var text = rbl.getText();
    	var value = rbl.getValue();
    	var datas =  datagridInterview.getData();
    	if(datas.length==0){
    		var newRow = {name:"New Row","interviewroundes":1,"interviewer":value,"interviewername":text};
			datagridInterview.addRow(newRow, 0);
    	}else{
    		var row = datagridInterview.getRow(0);
    		var rowData = {"interviewroundes":1,"interviewer":value,"interviewername":text};
    		datagridInterview.updateRow(row,rowData);
    	}
    });
    
	var type ; //发起还是暂存
	function onOk(e){
		//面试安排
		var datagridInterview = nui.get("datagridInterview").getData();
		for(var i=0;i<datagridInterview.length;i++){
			if(datagridInterview[i].interviewer == '' || datagridInterview[i].interviewer == null){
				nui.alert("招聘需求岗位面试轮次设置中的“面试官”为必填项！");
				return false;
			}
		}
	 	var msg;//提示信息
        if(e == "1"){//发起
        	form.validate();
        	if(!form.isValid()){
	    		nui.alert("请检查表单的完整性！");
	        	return false;
        	}
        	msg="是否发起该招聘需求审批流程？";
        	type=1;
        }else{
        	msg="是否暂时保存该招聘需求审批流程？暂时保存后可以在待办任务中进行查询处理！";
        	type=0;
        }
        nui.confirm(msg,"操作提示",function(action){
			if(action == "ok"){
				nui.get("creatPayProcess").disable();
				nui.get("savePayProcess").disable();
				document.getElementById("fileCatalog").value="omRecruitApproval";
				form2.submit();
			}
		});
	}
	
	function setPositionName(e){
		//var recposition = e.value;
		var recposition = nui.get("recposition").getText();
		nui.get("recpositionname").setValue(recposition);
	}
	
    function SaveData(){
		var data = form.getData();
		var omRecruit = data.omRecruit;
		//申请人名称
		var applyuserName = nui.get("applyuserid").getText();
		//部门名称
		var orgName = nui.get("orgid").getText(); 
		//岗位名称
		//var recpositionName = nui.get("recposition").getText();
		//面试计划安排
		var changeData = setInterviewRounds();
		if(orgName){
			var index = orgName.indexOf('-');
			if(index!=-1){
				orgName = orgName.slice(index+1);
			}
		}
		var position = nui.get("position").getValue()
		var firstPart = "";
		if(position=="1"){//正式员工
			firstPart = "R";
		}else if(position=="2"){//实习员工
			firstPart = "T";
		}else{
			firstPart = "O";
		}
		var myDate = new Date();
		firstPart = myDate.getFullYear() + "-" + firstPart;
		omRecruit.applyuserName = applyuserName;
		omRecruit.orgName = orgName;
		//omRecruit.recpositionName = recpositionName;
		omRecruit.firstPart = firstPart;//生成招聘需求编号的前缀
		var guanZhu = nui.get("guanZhuButton").getValue();//是否关注
		omRecruit.guanZhu = guanZhu;//是否关注
		var misOpinion = opioionform.getData().misOpinion;//审核意见
		var msg="招聘需求审批流程";
		if(type =="1"){//发起
			misOpinion.auditstatus ="3";//发起
			misOpinion.workitemname="发起"+msg;
			omRecruit.approvalstatus="1"//发起时状态为：上报
		}else{
			misOpinion.auditstatus ="3";//发起
			misOpinion.workitemname="暂时保存"+msg;
			omRecruit.approvalstatus="0"//暂存时状态为：新增
		}
		var content;
    	if(type == '1'){
           	content = '流程发起中...';
		}else if(type == '0'){
           	content = '流程暂存中...';
		}
    	mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: content
        });
        var json = nui.encode({"omRecruit":omRecruit,"misOpinion":misOpinion,"recruitInterviewSchedule":changeData});
		nui.ajax({
			url: "org.gocom.abframe.org.recruitApproval.recruitApproval.creatRecruitApprovalFlow.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
	        success: function (o) {
	        	nui.unmask(document.body);
		    	if(o.result == 'success'){
		    		if(type==1){
	                   	nui.alert("发起流程成功！","系统提示",function (){
	                   		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
	                   	});
    				}else if(type==0){
    					nui.alert("暂时保存成功！","系统提示",function (){
    						window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
    					});
    				}
		    	}else{
		    		nui.get("creatPayProcess").enable();
					nui.get("savePayProcess").enable();
    				if(type==1){
	                   	nui.alert("发起流程失败！");
    				}else if(type==0){
    					nui.alert("暂时保存失败！");
    				}
		    	}
	        }
		});
	}	
	function showEmployee(e){
		var btnEdit = this;
	    nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择人员",
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
					}
				}
			}
		});
	}
	
	function onCancel(e) {
    	var data = form.getData();
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
    
    //面试官角色
	function getRole(e){
		return nui.getDictText('INTERVIEWER_ROLE',e.value);
	}
    var editor1 = null;
	KindEditor.ready(function(K) {
		editor1 = K.create('textarea[name="content1"]', {
		cssPath : '<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
		uploadJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
		fileManagerJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
		allowFileManager : true,
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
		},
		afterChange : function() {
		    $('.word_count1').html(this.count()); //字数统计包含HTML代码
		    var a = this.count();
		    var a1 = this.count('text');
		    var limitNum = 1000;  //设定限制字数
		    var pattern = "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+limitNum+"</span>字。（字数统计包含纯文本、HTML代码）"; 
		    $('.word_surplus').html(pattern); //输入显示
		    if(a > limitNum) {
			    pattern = ('字数超过限制，请适当删除部分内容');
			    //超过字数限制自动截取
			    var strValue = editor1.text();
			    strValue = strValue.substring(0,limitNum);
			    editor1.text(strValue);      
		    } else {
		      	//计算剩余字数
		      	var result = limitNum - this.count(); 
		      	pattern =  "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+result+"</span>字。（字数统计包含纯文本、HTML代码）"; 
	      	}
	      	$('.word_surplus').html(pattern); //输入显示
		} 
		});
		prettyPrint();
	});
    
    var editor2 = null;
	KindEditor.ready(function(K) {
		editor2 = K.create('textarea[name="content2"]', {
		cssPath : '<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
		uploadJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
		fileManagerJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
		allowFileManager : true,
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
		},
		afterChange : function() {
		    $('.word_count2').html(this.count()); //字数统计包含HTML代码
		    var a = this.count();
		    var a1 = this.count('text');
		    var limitNum = 1000;  //设定限制字数
		    var pattern = "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+limitNum+"</span>字。（字数统计包含纯文本、HTML代码）"; 
		    $('.word_surplus2').html(pattern); //输入显示
		    if(a > limitNum) {
			    pattern = ('字数超过限制，请适当删除部分内容');
			    //超过字数限制自动截取
			    var strValue = editor1.text();
			    strValue = strValue.substring(0,limitNum);
			    editor1.text(strValue);      
		    } else {
		      	//计算剩余字数
		      	var result = limitNum - this.count(); 
		      	pattern = "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+result+"</span>字。（字数统计包含纯文本、HTML代码）"; 
	      	}
	      	$('.word_surplus2').html(pattern); //输入显示
		} 
		});
		prettyPrint();
	});
    
    function CloseWindow(action){
		if (action == "close" && form.isChanged()){
			if (confirm("数据被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
</script>
</html>