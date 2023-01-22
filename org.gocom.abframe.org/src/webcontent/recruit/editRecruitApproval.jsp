<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<%String contextPath=request.getContextPath();%>
<html>
<!-- 
  - Author(s): JYW
  - Date: 2019-11-08 17:30:42
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
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
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
				<input name="omRecruit.recruitid" id="recruitid" class="nui-hidden"/>
				<input name="omRecruit.fileids" id="fileids1" class="nui-hidden" />
				<input name="omRecruit.processinstid" id="processinstid" class="nui-hidden" />
				<!-- 表单公共页面 -->
				<jsp:include page="/abframe/org/recruit/recruitApprovalCommon.jsp"/>
				<!-- <div style="margin-left: 125px;"> -->
					<jsp:include page="/ame_common/addFiles1.jsp"/>
					<jsp:include page="/ame_common/detailFile.jsp"/>
				<!-- </div> -->
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;">
				<legend>招聘需求岗位面试轮次设置</legend>
				<div style="width:100%;">
			        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="mini-button" iconCls="icon-add" onclick="addRow('datagridInterview')" plain="true" tooltip="增加...">增加</a>
			                        <a class="mini-button" iconCls="icon-remove" onclick="removeRow('datagridInterview')" plain="true">删除</a>
			                        <a class="mini-button" iconCls="icon-save" onclick="saveInterviewData()" plain="true">保存</a>
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
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注流程</a>      
    <a class="nui-button" onclick="onOk('0')" id="savePayProcess"style="width:80px;margin-right:20px;">暂时保存</a>
    <a class="nui-button" onclick="onOk('1')" id="creatPayProcess" style="width:80px;margin-right:20px;">提交流程</a>
	<a class="nui-button" onclick="onOk('2')" id="breakProcess" style="width:80px;margin-right:20px;">中止流程</a>
	<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:80px;margin-right: 125px;">关闭</a>       
</div> 
</body>
<script type="text/javascript">
	nui.parse();
	<%long workItemID = (Long)request.getAttribute("workItemID");%>
	var form = new nui.Form("#form1");
	var opioionform = new nui.Form("opioionform");//审批意见
  	document.getElementById("salesEdit").style.display="none";
  	//隐藏招聘专员
	document.getElementById("recruitPerson").style.display="none";
	document.getElementById("recruitPerson1").style.display="none";
	document.getElementById("isreferrer").style.display="none";
	document.getElementById("isreferrer1").style.display="none";
	//面试轮次安排
	var datagridInterview = nui.get("datagridInterview");
	initData();
	function initData(){
		form.mask("数据加载中...");
		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		var json = {workItemID: <%=workItemID %>};
  		nui.ajax({//获取资产采购申请信息
      		url: "org.gocom.abframe.org.recruitApproval.recruitApproval.queryRecruitFlowData.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			form.unmask();
       	  		form.setData(o);
       	  		var omRecruit = o.omRecruit;
				nui.get("interviewer").setText(o.omRecruit.intername);
                nui.get("applyuserid").setText(o.omRecruit.applyname);
            	nui.get("position").setReadOnly(true);
            	/* nui.getDictText('AREA4CLRY',omRecruit.workplace);
            	console.log(nui.getDictText('AREA4CLRY',omRecruit.workplace)); */
                form.setChanged(false);
  				var processInstID = o.omRecruit.processinstid;
  				//加载附件
  				var fileGrid = nui.get("grid_0");
				fileGrid.load({"groupid":"omRecruitApproval","relationid":omRecruit.recruitid});
  				//加载面试安排数据
                datagridInterview.load({"recruitid":omRecruit.recruitid});
                datagridInterview.sortBy("interviewroundes", "asc");
  				//查询审核意见
				var grid = nui.get("datagrid1");
				grid.sortBy("time", "desc");
				grid.load({processInstID: processInstID});
				//悬挂意见保存
				nui.get("workitemid").setValue(<%=workItemID %>);	//工作项ID
				nui.get("processinstid").setValue(processInstID);	//审核意见流程实例ID
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
               	nui.get("isshow").setValue("1");
				//流程回退路径赋值 
                //nui.get("backTo").setData(omRecruit.backList);
				//审核结果设置
				initMisOpinion({auditstatus: "4"});
				nui.get("auditopinion").setValue("");
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}

	function setPositionName(e){
		//var recposition = e.value;
		var recposition = nui.get("recposition").getText();
		nui.get("recpositionname").setValue(recposition);
	}
	//保存面试安排计划数据
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
	}
	function setInterviewData(){
		var datas =  datagridInterview.getData();
		if(datas.length==0){
			
		}
	}
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
	var type ; //提交流程还是暂存
	function onOk(e){
		if(e!=2){
			//面试安排
			var datagridInterview = nui.get("datagridInterview").getData();
			for(var i=0;i<datagridInterview.length;i++){
				if(datagridInterview[i].interviewer == '' || datagridInterview[i].interviewer == null){
					nui.alert("招聘需求岗位面试轮次设置中的“面试官”为必填项！");
					return false;
				}
			}
		}
	 	var msg;//提示信息
        if(e == "1"){//发起
        	form.validate();
        	if(!form.isValid()){
	    		nui.alert("请检查表单的完整性！");
	        	return false;
        	}
        	msg="是否提交该招聘需求审批流程？";
        	type=1;
        }else if(e == "0"){
        	msg="是否暂时保存该招聘需求审批流程？";
        	type=0;
        }else{
        	msg="是否要终止该招聘需求审批流程？";
        	type=2;
        }
        nui.confirm(msg,"操作提示",function(action){
			if(action == "ok"){
				nui.get("creatPayProcess").disable();
				nui.get("savePayProcess").disable();
				nui.get("breakProcess").disable();
				document.getElementById("fileCatalog1").value="omRecruitApproval";
				form4.submit();
			}
		});
	}
	
    function SaveData1(){
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
	/* 	var position = nui.get("position").getValue()
		var firstPart = "";
		if(position=="1"){//正式员工
			firstPart = "R";
		}else if(position=="2"){//实习员工
			firstPart = "T";
		}else{
			firstPart = "O";
		}
		var myDate = new Date();
		firstPart = myDate.getFullYear() + "-" + firstPart; */
		omRecruit.applyuserName = applyuserName;
		omRecruit.orgName = orgName;
		//omRecruit.recpositionName = recpositionName;
		//omRecruit.firstPart = firstPart;//生成招聘需求编号的前缀
		var guanZhu = nui.get("guanZhuButton").getValue();//是否关注
		omRecruit.guanZhu = guanZhu;//是否关注
		var misOpinion = opioionform.getData().misOpinion;//审核意见
		if(type =="1"){//提交
			misOpinion.auditstatus ="4";//处理
			omRecruit.approvalstatus="1"//发起时状态为：上报
		}else if(type =="0"){
			misOpinion.auditstatus ="4";
			omRecruit.approvalstatus="0"//暂存时状态为：新增
		}else{
			misOpinion.auditstatus ="2";//终止流程
			omRecruit.approvalstatus="3"//暂存时状态为：终止
		}
		var content;
    	if(type == '1'){
           	content = '流程提交中...';
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
			url: "org.gocom.abframe.org.recruitApproval.recruitApproval.editRecruitApprovalFlow.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
	        success: function (o) {
	        	nui.unmask(document.body);
		    	if(o.retValue == 'success'){
		    		if(type==1){
	                   	nui.alert("流程提交成功！","系统提示",function (){
	                   		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
	                   	});
    				}else if(type==0){
    					nui.get("creatPayProcess").enable();
						nui.get("savePayProcess").enable();
						nui.get("breakProcess").enable();
						deleteFileTableRows();
						nui.get("grid_0").reload();
    					nui.confirm("流程暂存成功！是否关闭当前页面？","系统提示",function(action){
							if(action == "ok"){
								CloseWindow("cancel");
							}
						});
    				}else{
    					nui.alert("流程终止成功！","系统提示",function (){
	                   		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
	                   	});
    				}
		    	}else{
		    		nui.get("creatPayProcess").enable();
					nui.get("savePayProcess").enable();
					nui.get("breakProcess").enable();
    				if(type==1){
	                   	nui.alert("流程提交失败！");
    				}else if(type==0){
    					nui.alert("流程暂存失败！");
    				}else{
    					nui.alert("流程终止失败！","系统提示");
    				}
		    	}
	        }
		});
	}
	
	function deleteFileTableRows(){
		var myTable = document.getElementById('filetable1');
		var rowNum=myTable.rows.length;
	    if(rowNum>0){
	        for(i=0;i<rowNum;i++){
	          if(i!=0){
	          	  myTable.deleteRow(i);
		          rowNum=rowNum-1;
		          i=i-1;
	          }
	        }    
	    }
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
	
	//面试官角色
	function getRole(e){
		return nui.getDictText('INTERVIEWER_ROLE',e.value);
	}
	function onCancel(e) {
    	if(e=='cancel'){
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