<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): ganli
  - Date: 2019-05-28 15:02:53
  - Description:
-->
<head>
<title>项目计划审批</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    html, body
	    {
	        font-size:12px;
	        padding:0;
	        margin:0;
	        border:0;
	        height:100%;
	        overflow:hidden;
	    }
	     .myIndex{
	        background:#FFF68F;
	    }
    </style>
</head>
<body>
	<%
	  	long workItemID=(Long)request.getAttribute("workItemID");
	%>
	<div class="nui-fit" style="border:solid 1px #aaa;padding:0px;width:auto">
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>待审核</legend>
			<table align="center" border="0" width="100%" class="form_table">
		        <tr>
		          <td class="form_label" align="right">项目编号：</td>
		          <td colspan="1" align="left" style="width: 250px">
		             <label id="show.projectNo" style="display:inline-block;width:250px;"></label>
		          </td>
		          <td class="form_label" align="right">项目名称：</td>
		          <td colspan="1">
		             <label id="show.projectName" style="display:inline-block;width:300px;"></label>
		          </td>
		      	</tr>
		    </table>
		 	<div class="nui-fit" style="padding-left:0px;width:100%;height: 210px;">
				<div id="datagrid2" class="mini-datagrid" style="width:100%;height: 100%;" allowResize="true"  showEmptyText="false" showPager="false" 
				     allowAlternating="true" allowCellSelect="true" >
					<div property="columns" >
				    <div type="checkcolumn"></div>
					<div field="stage" headerAlign="center"  align="center" renderer="renderStage" >阶段</div>
					<div field="startTime" headerAlign="center"  align="center" renderer="renderDate" >开始时间</div>
					<div field="endTime" headerAlign="center"  align="center" renderer="renderDate" >结束时间</div>
				</div>
			</div>
    	</fieldset>
    	<form id="opioionform" method="post">
	    <input name="misOpinion.processinstid" id="processinstid" class="nui-hidden" />
	    <input name="misOpinion.processinstname" id="processinstname" class="nui-hidden" />
	    <input name="misOpinion.activitydefid" id="activitydefid" class="nui-hidden" />
	    <input name="misOpinion.workitemid" id="workitemid" class="nui-hidden" />
	    <input name="misOpinion.workitemname" id="workitemname" class="nui-hidden" />
	    <input name="misOpinion.isshow" id="isshow" class="nui-hidden" />
		<input name="misOpinion.fileids" id="fileids"  class="nui-hidden"/>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
	        <legend>处理意见列表</legend>
	        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:180px;" dataField="misOpinions"
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
	        <div style="padding:5px;" id="opinionHide">
	            <table style="table-layout:fixed;">
	            	<tr id="salesEdit">
	                    <td style="width:150px;" align="right">审核结果：</td>
	                    <td style="width:250px;">  
							<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
	                    </td>
	                    <td style="width:366px;" align="right" colspan="2">  
	                    	<a class="nui-button" onclick="doSHZT" style="width:100px;margin-right:20px;">悬挂意见保存</a>
	                    </td>
	                </tr>
	                <!-- <tr id="choosehide">
	                    <td  style="width:150px;" align="right">回退到：</td> 
	                    <td style="width:250px;" colspan="3">
	                    	<input name="misOpinion.backTo" id="backTo" class="nui-combobox" valueField="id" textField="name" style="width:200px" required="true" />
	                    </td>
	                </tr> -->
	                <tr>
	                    <td style="width:150px;height:auto;" align="right">处理意见：</td>
	                    <td colspan="3">
	                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height: 40px;"/>
	                    </td>
	                </tr>
	                
	            </table>
	        </div>
	    </fieldset>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">  
		<a class="nui-button" onclick="onOk" id="submitReimbProcess" style="width: 60px;margin-right:20px;">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid1 = nui.get("datagrid1");
	var grid2 = nui.get("datagrid2");
	var opioionform = new nui.Form("opioionform");
	init();
	
	
	function init() {
		<%-- promptInit({workItemID: <%=workItemID %>}); --%>
		
		nui.ajax({
					url: "com.primeton.rdmgr.project_plan.projectPlanManager.queryLatestPlan.biz.ext",
					type: 'POST',
					data: {"project":{"workItemID":<%=workItemID %>}},	
					contentType: 'text/json',
			        success: function (text) {
			        	if(text.plans&&text.plans.length>0){
			        		if(text.auditPlans&&text.auditPlans.length>0){
			        			flag=true;
			        		}
			        		for(var i=0;i<text.plans.length;i++){
			        			if(flag){
				            		var newRow={"stage":text.plans[i].stage,"startTime":text.plans[i].startTime,"endTime":text.plans[i].endTime,"startTime2":text.auditPlans[i].startTime,"endTime2":text.auditPlans[i].endTime,"versionNo":text.plans[i].versionNo,"projectNo":text.plans[i].projectNo,"projectName":text.plans[i].projectName};
			        			}else{
				            		var newRow={"stage":text.plans[i].stage,"startTime":text.plans[i].startTime,"endTime":text.plans[i].endTime,"versionNo":text.plans[i].versionNo,"projectNo":text.plans[i].projectNo,"projectName":text.plans[i].projectName};
			        			}
								grid2.addRow(newRow);
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
			       	nui.get("isshow").setValue("1");
			       	nui.get("auditstatus").setValue("1");
			       	
			       	
					nui.get("auditopinion").setValue("同意。");
					//审核结果设置
					initMisOpinion({auditstatus: "1"});
			        //查询审核意见
					grid1.load({processInstID: text.process[0].processInstID});
					grid1.sortBy("time", "desc");
            	}
	        }
		});
         promptInit({"workItemID": <%=workItemID %>});
    }
    
	function onCancel(e) {
        CloseWindow("cancel");
    }
    
    //标准方法接口定义
    function CloseWindow(action) {           
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }
    
    function initMisOpinion(data){
		//初始化处理意见
		var dataStatus=[{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "不通过"},{"dictID": 2,"dictName": "终止流程"}];
		nui.get("auditstatus").setData(dataStatus);
		nui.get("auditstatus").setValue(data.auditstatus);
	}
		
    function doSHZT(){
		if(nui.get("auditopinion").getValue().trim() == ""){
			nui.alert("审核意见不可以为空");
    		return false;
		}else{
			if (!confirm("是否保存悬挂时的审核意见？")) {
                return false;
            }else{
	    		var data = opioionform.getData();
	    		data.misOpinion.auditstatus = "5";
	    		var json = nui.encode(data);
	    		nui.ajax({
	    			url:"com.primeton.eos.ame_common.mail.saveMisopinion.biz.ext",
	    			data:json,
	    			type:"post",
	    			contentType:"text/json",
	    			success:function(action){
	    				if(action.exception == null){
				        	nui.alert("提交成功",null,function(){
					        	nui.get("datagrid1").reload();
				        	});
	    				}else{
	    					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
	    					});
	    				}
	    			},
	    			error:function(jqXHR, textStatus, errorThrown){
	    				nui.alert("error:" + jqXHR.responseText);
	    			}
	    		});
	    	}
		}
	}
	
	//审核结果触发
    function show(){
		var auditopinion = nui.get("auditopinion").getValue().trim();
		var auditstatus = nui.get("auditstatus").getValue();
		if(auditstatus=='0'){
			if(auditopinion=="同意。"){
				nui.get("auditopinion").setValue("");
			}
		}else if(auditstatus=='1'){
			if(auditopinion==""){
				nui.get("auditopinion").setValue("同意。");
			}
		}else if(auditstatus=='2'){
			if(auditopinion=="同意。"){
				nui.get("auditopinion").setValue("");
			}
			
		}
	}
    	
    function onCheckRenderer(e) {
		return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
	}
	
	function renderStage(e){
    	return nui.getDictText("AME_PROJECT_STAGE",e.value)
    }
    
    function onOk(){
    	nui.confirm("是否确定审核并且提交流程?","操作提示",function(o){
    		if("ok" == o){
    			nui.get("submitReimbProcess").disable();
				nui.get("closeWin").disable();
	        	
	        	if(nui.get("auditopinion").getValue().trim() == ""){
					nui.alert("审核意见不可以为空");
					nui.get("submitReimbProcess").enable();
					nui.get("closeWin").enable();
				}else{
		    		var data = opioionform.getData();
		    		var json = nui.encode(data);
		    		nui.mask({
			            el: document.body,
			            cls: 'mini-mask-loading',
			            html: '数据处理中...'
			        });
		    		nui.ajax({
		    			url:"com.primeton.rdmgr.project_plan.projectPlanManager.saveAuditAndFinishWorkitem.biz.ext",
		    			data:json,
		    			type:"post",
		    			contentType:"text/json",
		    			success:function(action){
		    				if(action.result == "true"){
		    					nui.unmask();
			                   	nui.alert("流程提交成功！");
			                   	CloseWindow("ok");
		    				}else{
		    					nui.unmask();
								nui.get("submitReimbProcess").enable();
								nui.get("closeWin").enable();
			                   	nui.alert("流程提交失败！");
		    				}
		    			},
		    			error:function(jqXHR, textStatus, errorThrown){
		    				nui.alert("error:" + jqXHR.responseText);
		    			}
		    		});
				}
    		}else{
    			
    		}
    	});
    }
    
    function renderDate(e){
    	if(e.field=="startTime"){
    		if(e.row.startTime2&&e.row.startTime2.substring(0,10)!=e.value.substring(0,10)){
    			e.cellStyle = 'background-color:#FF6347';
    			return e.value.substring(0,10)+"变更为"+e.row.startTime2.substring(0,10);
    		}else if(e.value){
	    		return e.value.substring(0,10);
	    	}
    	}
    	if(e.field=="endTime"){
    		if(e.row.endTime2&&e.row.endTime2.substring(0,10)!=e.value.substring(0,10)){
    			e.cellStyle = 'background-color:#FF6347';
    			return e.value.substring(0,10)+"变更为"+e.row.endTime2.substring(0,10);
    		}else if(e.value){
	    		return e.value.substring(0,10);
	    	}
    	}
    	
    }
</script>
</html>