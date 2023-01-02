<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-16 15:17:50
  - Description:
-->
<head>
<title>交接人确认</title>
</head>
<body>
<div class="nui-fit">
	<div class="mini-panel" title="" style="width: 100%;">
		<!-- 提示信息展示  -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<div id="form1" >
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<input name="omLeaveApply.leaveid" class="nui-hidden"/>
				<input name="omLeaveApply.processinstid"  class="nui-hidden"/>
	            <legend>离职人员信息</legend>
	            <table style="table-layout:fixed;" id="table_file">
	            	<tr>
	                	<td width="120px" align="right">离职人员：</td>
	                    <td width="150px">    
							<input property="editor" name="omLeaveApply.userid" id="userid" class="nui-buttonedit" readonly="readonly" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false" />
	                    </td>
	                    <td style="width:100px;" align="right" id="lastOutDate">最后工作日：</td>
	                    <td style="width:150px;" colspan="3">    
	                        <input class="nui-datepicker" name="omLeaveApply.outdate" id="hopeoutdate" required="true" readonly="readonly"/>
	                    </td>
	            	</tr>
	            	<tr>
	                	<td width="120px" align="right">所属部门：</td>
	                    <td width="150px">    
							<input property="editor" name="omLeaveApply.orgname" id="orgname" class="nui-textbox"readonly="readonly" showClose="false" />
	                    </td>
	                    <td style="width:100px;" align="right" id="lastOutDate">手机号：</td>
	                    <td style="width:150px;" colspan="3">    
	                        <input class="nui-textbox" name="omLeaveApply.mobileno" id="mobileno" required="true" readonly="readonly"/>
	                    </td>
	            	</tr>
	            	<tr>
						<td align="right" style="width: 100px;" >交接人：</td>
						<td align="left">    
							<input id="handuserid" class="nui-combobox"  name="omLeaveApply.handuserid" readonly="readonly"  searchField="name"
								url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
								textField="empname" valueField="userid" onvaluechanged="changeHand" allowInput="true"/>
						</td>
	                	<td style="width:120px;" align="right">工作交接要求：</td>
	                    <td style="width:150px;" colspan="5">    
	                        <input name="omLeaveApply.handrequire" id="handrequire" class="nui-textarea"style="width:680px;" readonly="readonly"/>
	                    </td>
	            	</tr>
	            	<tr>
	                	<td style="width:120px;" align="right">工作交接说明：</td>
	                    <td style="width:150px;" colspan="7">    
	                        <input name="omLeaveApply.handremark" id="handremark" class="nui-textarea"style="width:960px;"/>
	                    </td>
	            	</tr>
	            </table>
			</fieldset>
			<jsp:include page="/ame_common/misOpinion.jsp"/> 
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
  	var form = new nui.Form("#form1");//申请信息
  	var opioionform = new nui.Form("opioionform");//审核意见
	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
	
    document.getElementById("choosehide").style.display="none";
    initMisOpinion({auditstatus:"1"});
	function initMisOpinion(data){
		//初始化处理意见
		var dataStatus=[{"dictID": 1,"dictName": "通过"},{"dictID": 2,"dictName": "终止流程"}];
		nui.get("auditstatus").setData(dataStatus);
		nui.get("auditstatus").setValue(data.auditstatus);
	}
	init();
	function init(){
		form.mask("数据加载中...");
		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		var json = {workItemID: <%=workItemID %>};
  		nui.ajax({//获取资产采购申请信息
      		url: "com.primeton.eos.ame_permanage.ame_leave_apply.getLeaveApply.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			form.unmask();
       	  		form.setData(o);
				nui.get("userid").setValue(o.omLeaveApply.userid);
				nui.get("userid").setText(o.omLeaveApply.empname);
				nui.get("handuserid").setText(o.omLeaveApply.handusername);
  				var processInstID = o.omLeaveApply.processinstid;
  				var activityDefID = o.workitem.activityDefID;
  				
  				document.getElementById("datagrid1").style.display="none";
				
				//悬挂意见保存
				nui.get("workitemid").setValue(<%=workItemID %>);	//工作项ID
				nui.get("processinstid").setValue(processInstID);	//审核意见流程实例ID
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
				
				//流程回退路径赋值 
                nui.get("backTo").setData(o.omLeaveApply.backList);
				
				//审核结果设置
				initMisOpinion({auditstatus: "1"});
				nui.get("auditopinion").setValue("已完成交接。");
			
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}
	//提交该流程    
    var titleText = "";
    var vacdealtype;
    function onOk(e){
    	var isNeedPay;
    	var auditstatus = nui.get("auditstatus").getValue();
    	if(auditstatus == "2"){	//终止流程
    		titleText = "终止";
    	}else if(auditstatus == "0"){	//退回流程
    		if(!nui.get("backTo").getValue()){
    			nui.alert("退回环节不能为空！");
    			return;
    		}
    		titleText = "退回";
    	}else if(auditstatus == "1"){	//提交流程
    		titleText = "提交";
    	}
    	nui.confirm("确定" + titleText + "流程吗？", "操作提示",function (action) {            
            if (action == "ok") {
            	SaveData2();
            }
        });
    }
    function SaveData2(){
		var om = form.getData();//申请信息
		var misOpinion = opioionform.getData().misOpinion;//审核意见
    	nui.get("sureButton").setEnabled(false);
    	var json = {omLeaveApply:om.omLeaveApply,misOpinion:misOpinion};
    	saveData(json);
    }
    
	function  saveData(data){
		mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: titleText+'中...'
        });
    	nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_leave_apply.handuserConfirm.biz.ext",
            data: data,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	nui.unmask(document.body);
        		var returnJson = nui.decode(text);
              	if(returnJson.result == "success"){
    				nui.alert(titleText + "成功","系统提示",function(){
		        		CloseWindow("ok");
		        	});
              	}else{
					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
						nui.get("sureButton").setEnabled(true);
					});
				}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
                CloseWindow();
            }
        });
	}
</script>
<script src="<%=request.getContextPath() %>/ame_permanage/ame_leave_apply/js/leaveapply.js" type="text/javascript"></script>
</html>