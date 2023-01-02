<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-04 14:22:47
  - Description:
-->
<head>
	<title>发起离职交接审批流程</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link id="css_skin" rel="stylesheet" type="text/css" href="/default/coframe/tools/skins/skin1/style.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=request.getContextPath()%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath()%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=request.getContextPath() %>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<div class="mini-panel" title="发起离职交接申请流程" style="width: 100%;">
		<!-- 提示信息展示  -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<div id="form1" >
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<input name="omLeaveApply.leaveid" class="nui-hidden"/>
				<input name="omLeaveApply.processinstid"  class="nui-hidden"/>
				<input name="omLeaveApply.fileids" id="fileids2" class="nui-hidden"/>
				<input name="omLeaveApply.applystatus" id="applystatus" class="nui-hidden"/>
				<input name="omLeaveApply.empname" id="empname" class="nui-hidden"/>
	            <legend>离职人员信息</legend>
	            <table style="table-layout:fixed;" id="table_file">
	            	<tr>
	                	<td width="120px" align="right">离职人员：</td>
	                    <td width="150px">    
							<input property="editor" name="omLeaveApply.userid" id="userid" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false" />
	                    </td>
	                	<td style="width:120px;" align="right">入职日期：</td>
                    	<td style="width:150px;" id="indate" ></td>
            			<td style="width:120px;" align="right">职位：</td>
                    	<td style="width:150px;" id="positionname" ></td>
	            	</tr>
	            	<tr>
	                    <td style="width:90px;" align="right">期望离职日期：</td>
	                    <td style="width:150px;">    
	                        <input class="nui-datepicker" name="omLeaveApply.outdate" id="hopeoutdate" required="true" />
	                    </td>
	                    <td style="width:90px;" align="right">期望办理离职日期：</td>
	                    <td style="width:150px;">    
	                        <input class="nui-datepicker" name="omLeaveApply.dealoutdate" id="hopedealoutdate" required="true" />
	                    </td>
	            	</tr>
	            	<tr>
	            		<td style="width:90px;" align="right">离职原因：</td>
	                    <td style="width:350px;" colspan="2">本人因个人原因申请离职，原因包括但不限于以下内容</td>
	                    <td style="width:150px;" colspan="2">    
	                        <input name="omLeaveApply.poutreason" id="poutreason"  class="nui-dictcombobox" valueField="dictid" textField="dictname"/>
	                    </td>
	            	</tr>
	                <tr>
	                </tr>
	                <!-- <tr>
	                	<td style="width:90px;" align="right" valign="top">离职申请：</td>
	                    <td style="width:800px;" colspan="5">    
	                        <input name="omLeaveApply.outmemo" id="outmemo" class="nui-hidden"/>
					   		<textarea id="ke" name="content1" style="width:100%;height:400px;visibility:hidden;"></textarea>
	                    </td> 
	                </tr>
	                <tr>
	                	<td style="width:120px;"></td>
				   		<td colspan="5">
				   		您当前输入了 <span class="word_count1">0</span> 个字符,<span class="word_surplus"></span>
				   		</td>
				   	</tr> -->
	            </table>
				<%-- <jsp:include page="/ame_common/detailFile.jsp"/>
        		<jsp:include page="/ame_common/addFiles2.jsp"/>  --%>
			</fieldset> 
		</div>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
</div>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注流程</a>
	<a class="nui-button" onclick="onOk('1')" id="creatProcess" style="width: 80px;margin-right: 20px;">发起流程</a>
	<a class="nui-button" onclick="onOk('0')" id="saveProcess" style="width: 80px;margin-right: 20px;">暂时保存</a>
	<a class="nui-button" onclick="onOk('2')" id="endProcess" iconCls="icon-no" style="width: 100px;margin-right: 20px;">终止流程</a>
	<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>  
</div>
</body>
<script type="text/javascript">
	nui.parse();
	
  	var form = new nui.Form("#form1");//申请信息
  	var opioionform = new nui.Form("opioionform");//审核意见
  	document.getElementById("salesEdit").style.display="none";
  	$("#auditopinion,#auditopinion1").hide();
	
	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
	init();
	function init(){
		form.mask("数据加载中...");
		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		var json = {workItemID: <%=workItemID %>};
  		nui.ajax({//获取离职申请信息
      		url: "com.primeton.eos.ame_permanage.ame_leave_apply.getLeaveApply.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			form.unmask();
       	  		form.setData(o);
				/* var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"OM_LEAVE_APPLY","relationid":o.omLeaveApply.leaveid});
				grid_0.sortBy("fileTime","desc"); */
				nui.get("userid").setValue(o.omLeaveApply.userid);
				nui.get("userid").setText(o.omLeaveApply.empname);
				nui.get("empname").setValue(o.omLeaveApply.empname);
				document.getElementById("indate").innerHTML= o.omLeaveApply.indate == null ?"":o.omLeaveApply.indate;
				document.getElementById("positionname").innerHTML= o.omLeaveApply.positionname == null ?"":o.omLeaveApply.positionname;
                //editor1.html(o.omLeaveApply.outmemo);
  				var processInstID = o.omLeaveApply.processinstid;
	  			setLeaveReason("poutreason","0");
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
				
				//流程回退路径赋值 
                nui.get("backTo").setData(o.omLeaveApply.backList);
				
				//审核结果设置
				initMisOpinion({auditstatus: "4"});
				nui.get("auditopinion").setValue("");
			
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}
	
	var type ; //发起还是暂存
    function onOk(e){
		if(e == '2'){
			nui.confirm("确定终止流程吗？", "操作提示",
	            function (action) {            
	                if (action == "ok") {
	                	type = '2';
	                	//终止流程设置操作为2终止
	                	nui.get("auditstatus").setValue(2);
    					var om = form.getData();//申请信息
	                	misOpinion = opioionform.getData().misOpinion;//审核意见
						json = {omLeaveApply:om.omLeaveApply,misOpinion:misOpinion};
						save(json);
						return;
					}else{
						return;
					}
				}
			);
		}else{
	        var msg;//提示信息
	        if(e == "1"){//发起
	        	if(!form.validate()){
		    		nui.alert("信息录入不完整！");
		        	return;
	        	}
	        	msg="是否发起离职申请流程？";
	        	type=1;
	        }else{
	        	msg="是否暂时保存离职申请流程？暂时保存后可以在待办任务中进行查询处理！";
	        	type=0;
	        	nui.get("applystatus").setValue('0');
	        }
	        nui.confirm(msg,"操作提示",function(o){
	        	if("ok" == o){
					//按钮禁用
			    	nui.get("creatProcess").disable();
			    	nui.get("saveProcess").disable();
			    	SaveData2();
					/* document.getElementById("fileCatalog2").value="OM_LEAVE_APPLY";
					form6.submit(); */
	        	}
	        });
		}
        
    }
	function SaveData2(){
    	/* var text = editor1.html();
		nui.get("outmemo").setValue(text); */
		var om = form.getData();//申请信息
		var misOpinion = opioionform.getData().misOpinion;//审核意见
		var msg="离职申请流程";
		if(type =="1"){//发起还是暂存
			misOpinion.auditstatus ="3";
			misOpinion.workitemname="发起"+msg;
		}else{
			misOpinion.auditstatus ="4";
			misOpinion.workitemname="暂时保存"+msg;
		}
    	om.omLeaveApply.status = '0';
		var guanZhu = nui.get("guanZhuButton").getValue();//是否关注
		om.omLeaveApply.guanZhu = guanZhu;//是否关注
		var json =nui.encode({omLeaveApply:om.omLeaveApply,misOpinion:misOpinion});
        save(json);
	}
	
	
	function save(data){
		var content;
    	if(type == '1'){
           	content = '发起中...';
		}else if(type == '0'){
           	content = '暂存中...';
		}else{
           	content = '终止中...';
		}
    	mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: content
        });
    	nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_leave_apply.editLeaveApply.biz.ext",
            data: data,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	nui.unmask(document.body);
        		var returnJson = nui.decode(text);
              	if(returnJson.result == "success"){
    				if(type==1){
	                   	nui.alert("发起流程成功！","系统提示",function (){
	                   		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
	                   	});
    				}else if(type==0){
    					nui.alert("暂时保存成功！","系统提示",function (){
    						window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
    						form.unmask();
    					});
    				}else if(type == '2'){
    					nui.alert("终止流程成功！","系统提示",function (){
    						CloseWindow();
    					});
    				}
              	}else if(text.result == "-2"){
      				nui.get("creatProcess").enable();
    				nui.get("saveProcess").enable();
    				if(type==1){
	                   	nui.alert("发起流程失败！失败原因：未设置审批人，请立即联系信息技术部！");
    				}else if(type==0){
    					nui.alert("暂时保存失败！失败原因：未设置审批人，请立即联系信息技术部！");
    				}
      			}else {
					nui.get("creatProcess").enable();
					nui.get("saveProcess").enable();
    				if(type==1){
	                   	nui.alert("发起流程失败！");
    				}else if(type==0){
    					nui.alert("暂时保存失败！");
    				}else if(type == '2'){
    					nui.alert("终止流程失败。");
    				}
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