<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<%String contextPath=request.getContextPath();%>
<html>
<!-- 
  - Author(s): JYW
  - Date: 2019-11-15 16:45:05
  - Description:
-->
<head>
<title>招聘需求审批HR信息确认</title>
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
	<div class="mini-panel" title="招聘需求审批HR信息确认" style="width: 100%">
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<div id="form1" >
			<fieldset id="field1" style="border:solid 1px #aaa;">
				<legend>招聘需求审批HR信息确认</legend>
				<input name="omRecruit.recruitid" id="recruitid" class="nui-hidden"/>
				<input name="omRecruit.fileids" id="fileids1" class="nui-hidden" />
				<input name="omRecruit.processinstid" id="processinstid" class="nui-hidden" />
				<!-- 表单公共页面 -->
				<jsp:include page="/abframe/org/recruit/recruitApprovalCommon.jsp"/>
			</fieldset>
			<div style="display: inline;">
				<div style="width: 50%;float: left;">
					<fieldset id="field3" style="border:solid 1px #aaa;">
						<legend>招聘需求审批层级设置</legend>
						<div style="width:100%;">
					        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
					            <table style="width:100%;">
					                <tr>
					                    <td style="width:100%;">
					                        <a class="mini-button" iconCls="icon-add" onclick="addRow('datagridApproval')" plain="true" tooltip="增加...">增加</a>
					                        <a class="mini-button" iconCls="icon-remove" onclick="removeRow('datagridApproval')" plain="true">删除</a>
					                        <a class="mini-button" iconCls="icon-save" onclick="saveApprovalChains" plain="true">保存</a>
					                        <a class="mini-button" iconCls="icon-upload" onclick="moveRowUp('datagridApproval')" plain="true">上移</a>
					                        <a class="mini-button" iconCls="icon-download" onclick="moveRowDown('datagridApproval')" plain="true">下移</a>
					                    </td>
					                </tr>
					            </table>           
					        </div>
					    </div>
					    <div id="datagridApproval" class="nui-datagrid" style="width:100%;height:auto;" 
					        url="org.gocom.abframe.org.recruitApproval.recruitApproval.getApprovalChains.biz.ext" idField="id" dataField="approvalChains"
					        allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
					        editNextOnEnterKey="true"  editNextRowCell="true" allowAlternating ="true" showLoading="true" showPager="false">
					        <div property="columns">
					         	<div type="checkcolumn"></div>
					            <div headerAlign="center"  type="indexcolumn" width="20%">审批层级</div>
					            <div headerAlign="center" field="approvalLevel" visible="false" readOnly="true">审批层级</div>
					            <div name="beginEditCell" displayField="approvalPersonName" field="approvalPerson" headerAlign="center" width="80%" >审批人
					            	<input property="editor"  class="mini-textboxlist" searchField="name"
										url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext" value="" text=""
										textField="EMPNAME" valueField="USERID" required="true" width="100%" />
					            </div>
					        </div>
					    </div>
					</fieldset>
				</div>
				<div style="width: 50%;float: right;">
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
					            <div headerAlign="center" field="interviewRound" type="indexcolumn" width="15%">面试轮次</div>
					            <div headerAlign="center" field="interviewroundes" visible="false" readOnly="true">面试轮次</div>
					            <div name="beginEditCell" displayField="interviewername" field="interviewer" headerAlign="center" width="50%" >面试官
					            	<input property="editor"  class="mini-textboxlist" searchField="name"
										url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext" value="" text=""
										textField="EMPNAME" valueField="USERID" required="true" width="100%" />
					            </div>
					            <div field="interviewerrole" headerAlign="center" renderer="getRole" width="35%">面试官角色
					                <input property="editor" class="nui-dictcombobox" dictTypeId="INTERVIEWER_ROLE" required="true" style="width:200px;" minWidth="200" minHeight="50"/>
					            </div>
					        </div>
					    </div>
					</fieldset>
				</div>
			</div>
			<fieldset id="field1" style="border:solid 1px #aaa;">
				<legend>招聘需求审批相关附件</legend>
				<jsp:include page="/ame_common/addFiles1.jsp"/>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
		</div>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注流程</a>      
    <a class="nui-button" onclick="onOk('1')" id="submitProcess" style="width:80px;margin-right:20px;">提交流程</a>
	<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:80px;margin-right: 125px;">关闭</a>       
</div> 
</body>
<script type="text/javascript">
	nui.parse();
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	var nowuserid='<%=nowuserid %>';
	var nowusername='<%=nowusername%>';
	<%long workItemID = (Long)request.getAttribute("workItemID");%>
	var form = new nui.Form("#form1");
	var opioionform = new nui.Form("opioionform");//审批意见
	var datagridInterview = nui.get("datagridInterview");
	var datagridApproval = nui.get("datagridApproval");
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
       	  		var recuserid = nui.get("recuserid");
				recuserid.setValue(nowuserid);
				recuserid.setText(nowusername);
       	  		var omRecruit = o.omRecruit;
				nui.get("interviewer").setText(o.omRecruit.intername);
                nui.get("applyuserid").setText(o.omRecruit.applyname);
                if(o.omRecruit.isreferrer ==1){
	                    document.getElementById("refferexpmouldnoname").style.display="";
	                    document.getElementById("refferexpmouldno").style.display=""; 
	                    nui.get("refferexpmouldno").setValue(o.omRecruit.refferexpmouldno);
	                    nui.get("refferexpmouldno").setText(o.omRecruit.refferexpmouldno);
	            }
                //nui.get("recuserid").setText(o.omRecruit.recusername);
            	nui.get("position").setReadOnly(true);
            	/* nui.getDictText('AREA4CLRY',omRecruit.workplace);
            	console.log(nui.getDictText('AREA4CLRY',omRecruit.workplace)); */
                form.setChanged(false);
  				var processInstID = o.omRecruit.processinstid;
  				//加载附件
  				var fileGrid = nui.get("grid_0");
				fileGrid.load({"groupid":"omRecruitApproval","relationid":omRecruit.recruitid});
  				form.setChanged(false);
                //加载面试安排数据
                datagridInterview.load({"recruitid":omRecruit.recruitid});
                datagridInterview.sortBy("interviewroundes", "asc");
                //加载审批层级数据
                datagridApproval.load({"processinstid":processInstID});
  				var processInstID = omRecruit.processinstid;
  				//查询审核意见
				var approvGrid = nui.get("datagrid1");
				approvGrid.sortBy("time", "desc");
				approvGrid.load({processInstID: processInstID});
				//悬挂意见保存
				nui.get("workitemid").setValue(<%=workItemID %>);	//工作项ID
				nui.get("processinstid").setValue(processInstID);	//审核意见流程实例ID
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
               	nui.get("isshow").setValue("1");
				//流程回退路径赋值 
                nui.get("backTo").setData(omRecruit.backList);
				//审核结果设置
				initMisOpinion({auditstatus: "1"});
				nui.get("auditopinion").setValue("确认。");
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
	 //审核结果触发
    function show(){
		var auditopinion = nui.get("auditopinion").getValue().trim();
		var auditstatus = nui.get("auditstatus").getValue();
		if(auditstatus=='0'){
			if(auditopinion=="确认。"){
				nui.get("auditopinion").setValue("");
			}
			chooselink();
		}else if(auditstatus=='1'){
			if(auditopinion==""){
				nui.get("auditopinion").setValue("确认。");
			}
			showNone();
		}else if(auditstatus=='2'){
			if(auditopinion=="确认。"){
				nui.get("auditopinion").setValue("");
			}
			showNone();
		}
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
	/* datagridInterview.on("cellendedit", function (e) {
		alert("编辑完成！");
	}); */
	datagridApproval.on("celleditenter", function (e) {
		var index = datagridApproval.indexOf(e.record);
		if (index == datagridApproval.getData().length - 1) {
			var row = {};
			datagridApproval.addRow(row);
		}
	});
	//设置审批层级数据
	function setApprovalLevel(){
		var datas =  datagridApproval.getData();
		var rowData = {};
		var rowIndex;
		for(var i=0;i<datas.length;i++){
			rowIndex = datagridApproval.indexOf(datas[i])+1;
			if(datas[i].approvalLevel!=rowIndex){
				rowData = {"approvalLevel":rowIndex};
				datagridApproval.updateRow(datas[i],rowData);
			}
		}
		var changeData =datagridApproval.getChanges();
		return changeData;
	}
	//保存审批层级数据
	function saveApprovalChains() {
		datagridApproval.loading("数据保存中……");
		var changeData = setApprovalLevel();
		var processinstid = nui.get("processinstid").getValue();
		var json = nui.encode({"approvalChains":changeData,"processinstid":processinstid});
		nui.ajax({
			url: "org.gocom.abframe.org.recruitApproval.recruitApproval.saveApprovalChains.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
	        success: function (o) {
	        	datagridApproval.unmask();
	        	datagridApproval.reload();
		    	if(o.retValue == 'success'){
		    		nui.alert("审批层级保存成功！","保存提示");
		    	}else{
		    		nui.alert("审批层级保存失败！","保存提示");
		    	}
		    }
		});         
	}
	var msg;//提示信息	
	function onOk(e){
    	var auditstatus = nui.get("auditstatus").getValue();
    	if(auditstatus == "2"){	//终止流程
    		msg = "终止";
    	}else if(auditstatus == "0"){	//退回流程
    		if(!nui.get("backTo").getValue()){
    			nui.alert("退回环节不能为空！");
    			return;
    		}
    		msg = "退回";
    	}else if(auditstatus == "1"){	//提交流程
    		form.validate();
	    	if(!form.isValid()){
	    		nui.alert("请检查表单的完整性！");
	        	return false;
	    	}
	    	//面试安排
			var datagridInterview = nui.get("datagridInterview").getData();
			for(var i=0;i<datagridInterview.length;i++){
				if(datagridInterview[i].interviewer == '' || datagridInterview[i].interviewer == null){
					nui.alert("招聘需求岗位面试轮次设置中的“面试官”为必填项！");
					return false;
				}
			}
			//审批层级设置
			var datagridApproval = nui.get("datagridApproval").getData();
			if(datagridApproval.length==0){
				nui.alert("招聘需求审批层级为必须设置项！");
				return false;
			}else{
				for(var i=0;i<datagridApproval.length;i++){
					if(datagridApproval[i].approvalPerson == '' || datagridApproval[i].approvalPerson == null){
						nui.alert("招聘需求审批层级设置中的“审批人”为必填项！");
						return false;
					}
				}
			}
    		msg = "提交";
    	}
        nui.confirm("您是否"+msg+"该流程？","操作提示",function(action){
			if(action == "ok"){
				nui.get("submitProcess").disable();
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
		var recpositionName = nui.get("recposition").getText();
		if(orgName){
			var index = orgName.indexOf('-');
			if(index!=-1){
				orgName = orgName.slice(index+1);
			}
		}
		//面试计划安排
		var changeData = setInterviewRounds();
		//审批层级设置
		var approvalChains = setApprovalLevel();
		/* var position = nui.get("position").getValue()
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
		omRecruit.firstPart = firstPart;//生成招聘需求编号的前缀 */
		omRecruit.applyuserName = applyuserName;
		omRecruit.orgName = orgName;
		omRecruit.recpositionName = recpositionName;
		var guanZhu = nui.get("guanZhuButton").getValue();//是否关注
		omRecruit.guanZhu = guanZhu;//是否关注
		var misOpinion = opioionform.getData().misOpinion;//审核意见
    	mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: "流程"+msg+"中……"
        });
        var json = nui.encode({"omRecruit":omRecruit,"misOpinion":misOpinion,"recruitInterviewSchedule":changeData,"approvalChains":approvalChains});
		nui.ajax({
			url: "org.gocom.abframe.org.recruitApproval.recruitApproval.submitRecruitApprovalFlow.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
	        success: function (o) {
	        	nui.unmask(document.body);
		    	if(o.retValue == 'success'){
                   	nui.alert("流程"+msg+"成功！","系统提示",function (){
                   		CloseWindow("cancel");
                   	});
		    	}else{
		    		nui.alert("流程"+msg+"失败，请联系信息技术部人员！","系统提示", function(action){
						nui.get("submitProcess").enable();
					});
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