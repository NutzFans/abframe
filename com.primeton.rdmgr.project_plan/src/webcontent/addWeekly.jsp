<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): ganli
  - Date: 2019-05-24 14:55:51
  - Description:
-->
<head>
<title>提交周报</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
    
</head>
<body>
	<div class="nui-fit">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>提交周报</legend>
		 	<form id="form1" method="post" >
		 		<input class="nui-hidden" id="projectNo" name="weekly.projectNo">
		 		<input class="nui-hidden" id="projectName" name="weekly.projectName">
	        	<table style="table-layout:fixed;" id="table_file1">
			            <tr>
							<td align="right" style="width:160px">项目名称：</td>
							<td style="width:250px" class = "asLabel">
								<label id="show.projectName" style="display:inline-block;width:150px;"></label>
							</td>
							<td align="right" style="width:160px">项目经理：</td>
							<td style="width:250px" class = "asLabel">
								<label id="show.managername" style="display:inline-block;width:150px;"></label>
							</td>	
							<td align="right" style="width:160px">当前阶段：</td>
							<td style="width:250px" class = "asLabel">
								<label id="show.stage" style="display:inline-block;width:150px;"></label>
							</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">周报内容：</td>
							<td colspan="5" ></td>
						</tr>
						<tr>
							<td align="right" colspan="6" >
								<input class="nui-textarea" name="weekly.weeklycont" id="weeklycont" required="true" requiredErrorText="周报内容不能为空" style="width: 100%;height: 300px;">
							</td>
						</tr>
	        	</table>
	        </form>
    	</fieldset>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" id="appButton" onclick="commitWeekly" style="width:60px;margin-right:20px;">确定</a>
		<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div>
</body>
<script type="text/javascript">
    	nui.parse();
    	var form = new nui.Form("form1");
    	
    	function setFormData(data) {
		    data = nui.clone(data);
		    if (data) {
	            nui.get("projectNo").setValue(data.projectNo);
	            nui.get("projectName").setValue(data.projectName);
	            document.getElementById("show.projectName").innerHTML=data.projectName;
	            document.getElementById("show.managername").innerHTML=data.managername;
	            //根据当前时间和项目计划，查询当前处于哪个阶段
	            nui.ajax({
		            url: "com.primeton.rdmgr.project_plan.projectPlanManager.queryCurrentStage.biz.ext",
		            type: 'POST',
		            data: {"projectNo":data.projectNo},
		            contentType: 'text/json',
		            success: function (text) {
		            	var stage0=text.stage;
		            	if(stage0=="0"){
		            		document.getElementById("show.stage").innerHTML="无计划";
		            	}else if(stage0=="-1"){
		            		document.getElementById("show.stage").innerHTML="早于项目计划";
		            	}else if(stage0=="1"){
		            		document.getElementById("show.stage").innerHTML="晚于项目计划";
		            	}else{
		            		var state="";
		            		if(stage0.indexOf(",")>0){
		            			var stages = stage0.split(",");
		            			for(i=0;i<stages.length;i++){
		            				state+=","+nui.getDictText("AME_PROJECT_STAGE",stages[i]);
		            			}
		            			state=state.substring(1,state.length);
		            		}else
		            			var state=nui.getDictText("AME_PROJECT_STAGE",stage0);
		            		document.getElementById("show.stage").innerHTML=state;
		            	}
		            }
		        }); 
		    }
	    }
	    
	    function commitWeekly(){
	    	if(form.validate()){
				nui.get("appButton").disable();
				var data = form.getData();
				var json = nui.encode(data);
				nui.mask({
		            el: document.body,
		            cls: 'mini-mask-loading',
		            html: '数据处理中...'
		        });
				nui.ajax({
					url: "com.primeton.rdmgr.project_plan.projectPlanManager.addWeekly.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
			        success: function (text) {
			        	if(text.result){
			        		nui.unmask();
		                	alert("操作成功！");
		               		CloseWindow("ok");
		            	}else{
		            		nui.unmask();
		            		alert("操作失败！");
		            		nui.get("appButton").enable();
		            	}
			        }
				});
			}else{
				alert("请检查表单的完整性!");
				return;
			}
	    }
	    
    function onCancel(e) {
        CloseWindow("cancel");
    }
    
    //标准方法接口定义
    function CloseWindow(action) {           
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }
    
	</script>
</html>