<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): ganli
  - Date: 2019-05-24 14:55:51
  - Description:
-->
<head>
<title>项目计划变更</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
    
</head>
<body>
	<div title="项目计划">
		<div class="nui-fit">
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>项目计划</legend>
				<input name="processinstid" id="processinstid" class="nui-hidden" />
			    <input name="processinstname" id="processinstname" class="nui-hidden" />
			    <input name="activitydefid" id="activitydefid" class="nui-hidden" />
			    <input name="workitemid" id="workitemid" class="nui-hidden" />
			    <input name="workitemname" id="workitemname" class="nui-hidden" />
			    
				<table align="center" border="0" width="100%" class="form_table">
			        <tr>
			          <td class="form_label" align="right">项目编号：</td>
			          <td colspan="1" align="left" style="width: 250px">
			             <label id="show.projectNo" style="display:inline-block;width:250px;"></label>
			          </td>
			          <td class="form_label" align="right">项目名称：</td>
			          <td colspan="1">
			             <label id="show.projectName" style="display:inline-block;width:350px;"></label>
			          </td>
			      	</tr>
			    </table>
			 	<div class="nui-fit" style="padding-left:0px;width:100%;height: 220px;">
					<div id="datagrid1" class="mini-datagrid" style="width:100%;height: 100%;" allowResize="true"  showEmptyText="false" showPager="false" 
					     allowAlternating="true" allowCellSelect="true" editNextOnEnterKey="false" dataField="auditPlans" 
					     url="com.primeton.rdmgr.project_plan.projectPlanManager.queryInAuditPlan.biz.ext" idField="stage" >
						<div property="columns" >
						    <div type="checkcolumn"></div>
							<div field="stage" headerAlign="center"  align="center" renderer="renderStage" >阶段</div>
							<div field="startTime" headerAlign="center"  align="center" renderer="renderDate" >开始时间
								<input property="editor" class="nui-datepicker" style="width:80%;" required="true" requiredErrorText="开始时间不能为空" />
							</div>
							<div field="endTime" headerAlign="center"  align="center" renderer="renderDate" >结束时间
								<input property="editor" class="nui-datepicker" style="width:80%;" required="true" requiredErrorText="结束时间不能为空" />
							</div>
						</div>
					</div>
	    	</fieldset>
	    	<fieldset style="border:solid 1px #aaa;padding:3px;">
	        	<legend>处理意见列表</legend>
	        	<div id="datagrid2" class="nui-datagrid" style="width:100%;height:200px;" dataField="misOpinions"
				    url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext"  idField="id" allowResize="true"
				    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
				    <div property="columns">
				    	<div type="indexcolumn" headerAlign="center" width="30" >编号</div>
				        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
				        <div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
				        <div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center">处理结果</div>
				        <div field="auditopinion" width="150" headerAlign="center">处理意见</div>
				        <div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
				        <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
				    </div>
				</div>
	    	</fieldset>
		</div>
		<div style="text-align:center;padding:10px;" class="nui-toolbar">
			<a class="nui-button" id="appButton" onclick="commitPlan" style="width:60px;margin-right:20px;">确定</a>
			<a class="nui-button" id="appButton2" onclick="terminationPlan" style="width:80px;margin-right:20px;">终止流程</a>
			<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
		</div>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	var grid2 = nui.get("datagrid2");
	<%
	  	long workItemID=(Long)request.getAttribute("workItemID");
	%>
	
	init();
	
	function init() {
		nui.ajax({
			url: "com.primeton.rdmgr.project_plan.projectPlanManager.queryInAuditPlan.biz.ext",
			type: 'POST',
			data: {"project":{"workItemID":<%=workItemID %>}},	
			contentType: 'text/json',
	        success: function (text) {
	        	if(text.auditPlans){
	        		for(var i=0;i<text.auditPlans.length;i++){
		            	var newRow={"planId":text.auditPlans[i].planId,"stage":text.auditPlans[i].stage,"startTime":text.auditPlans[i].startTime,"endTime":text.auditPlans[i].endTime,"versionNo":text.auditPlans[i].versionNo,"projectNo":text.auditPlans[i].projectNo,"projectName":text.auditPlans[i].projectName};
						if(i==0){
					    	proNo = text.auditPlans[i].projectNo;
					    	proName = text.auditPlans[i].projectName;
						}
						grid.addRow(newRow);
						grid.beginEditRow(newRow); 
		            }
            	}
	        }
		});
		nui.ajax({
			url: "com.primeton.rdmgr.project_plan.projectPlanManager.queryProcess.biz.ext",
			type: 'POST',
			data: {"project":{"workItemID":<%=workItemID %>}},	
			contentType: 'text/json',
	        success: function (text) {
	        	if(text.process){
	        		document.getElementById("show.projectNo").innerHTML=text.process[0].projectNo;
    				document.getElementById("show.projectName").innerHTML=text.process[0].projectName;
    				nui.get("processinstid").setValue(text.process[0].processInstID);
			       	nui.get("processinstname").setValue(text.process[0].processInstName);
			       	nui.get("activitydefid").setValue(text.process[0].activityDefID);
			       	nui.get("workitemname").setValue(text.process[0].workItemName);
					nui.get("workitemid").setValue(<%=workItemID %>);
			        //查询审核意见
					grid2.load({processInstID: text.process[0].processInstID});
					grid2.sortBy("time", "desc");
            	}
	        }
		});
    }
	    
    function commitPlan(){
    	grid.validate();
	    if(grid.isValid() != false){
    		grid.commitEdit();
        	var rowData = grid.getChanges();
        	
			nui.get("appButton").disable();
			nui.get("appButton2").disable();
			
			var json = nui.encode(rowData);
			nui.ajax({
				url: "com.primeton.rdmgr.project_plan.projectPlanManager.modifyPlanAndFinishWorkitem.biz.ext",
				type: 'POST',
				data: {"plans": json,
						"processinstid":nui.get("processinstid").getValue(),
						"workitemid":nui.get("workitemid").getValue()},	
				contentType: 'text/json',
		        success: function (text) {
		        	if(text.result){
	                	alert("操作成功！");
	               		CloseWindow("ok");
	            	}else{
	            		alert("操作失败！");
	            		nui.get("appButton").enable();
	            		nui.get("appButton2").enable();
	            	}
		        }
			}); 
		}else{
			alert("请检查表单的完整性!");
			return;
		}
    }
    
    function terminationPlan(){
    	nui.get("appButton").disable();
		nui.get("appButton2").disable();
		
		nui.ajax({
			url: "com.primeton.rdmgr.project_plan.projectPlanManager.terminationFlow.biz.ext",
			type: 'POST',
			data: {"workitem/processinstid":nui.get("processinstid").getValue(),
					"workitem/processinstname":nui.get("processinstname").getValue(),
					"workitem/activitydefid":nui.get("activitydefid").getValue(),
					"workitem/workitemname":nui.get("workitemname").getValue(),
					"workitem/workitemid":nui.get("workitemname").getValue()},	
			contentType: 'text/json',
	        success: function (text) {
	        	if(text.result){
                	alert("流程已终止！");
               		CloseWindow("ok");
            	}else{
            		alert("操作失败！");
            		nui.get("appButton").enable();
            		nui.get("appButton2").enable();
            	}
	        }
		});
    }
	    
    //关闭窗口
	function onCancel(e) {
        CloseWindow("cancel");
    }
    //标准方法接口定义
    function CloseWindow(action) {           
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }
    function onCheckRenderer(e) {
		return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
	}
    function renderStage(e){
    	return nui.getDictText("AME_PROJECT_STAGE",e.value)
    }
    
    function renderDate(e){
    	if(e.value){
    		return e.value.substring(0,10);
    	}
    	
    }
	</script>
</html>