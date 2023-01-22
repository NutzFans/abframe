<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-03 16:20:47
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
	                    <td style="width:350px;"colspan="2">本人因个人原因申请离职，原因包括但不限于以下内容</td>
	                    <td style="width:150px;" colspan="1">    
	                        <input name="omLeaveApply.poutreason" id="poutreason"  class="nui-dictcombobox" valueField="dictid" textField="dictname"/>
	                    </td>
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
        		<%-- <jsp:include page="/ame_common/addFiles2.jsp"/>  --%>
			</fieldset> 
		</div>
		<form id="opioionform" method="post" >
	        <div style="padding: 5px;" id="opinionHide">
	            <table style="table-layout: fixed;">
	            	<tr id="salesEdit">
	                    <td style="width: 150px;" align="right">审核结果：</td>
	                    <td style="width: 250px;">
							<input name="misOpinion.auditstatus" id="auditstatus" class="nui-dictradiogroup" style="width: 250px;" 
								required="true" dictTypeId="MIS_AUDITSTATUS" value="4" />
								 <input name="misOpinion.auditopinion" id="auditopinion" value="" class="nui-hidden" />
	                    </td>
	                </tr>
	            </table>
	        </div>
    	</form>
	</div>
</div>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注流程</a>
	<a class="nui-button" onclick="onOk('1')" id="creatProcess" style="width: 80px;margin-right: 20px;">发起流程</a>
	<a class="nui-button" onclick="onOk('0')" id="saveProcess" style="width: 80px;margin-right: 140px;">暂时保存</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	
  	var form = new nui.Form("#form1");//申请信息
  	var opioionform = new nui.Form("opioionform");//审核意见
	var leavetype = '<%=request.getParameter("leavetype") %>';
	
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
  	
  	document.getElementById("salesEdit").style.display="none";
	//流程操作提示
	promptInit({"workItemID": 0,"processDefName": "com.primeton.eos.ame_permanage.ame_leave_apply","activityDefID": "manualActivity"});
	<%
   		UserObject user = (UserObject) session.getAttribute("userObject");
   		String username = user.getUserName();
   		String userno = user.getUserId();
   		String userOrgName = user.getUserOrgName();
   		String userOrgId = user.getUserOrgId();
	%>
	init();
	function init(){
		if(leavetype == "0"){
			nui.get("userid").setReadOnly(true);
		}
		nui.get("userid").setValue("<%=userno %>");
	  	nui.get("userid").setText("<%=username %>");
	  	var json =({userid:"<%=userno %>"});
	  	nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_leave_apply.getEmpByUserid.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (o) {
              	var emp = o.emp;
				document.getElementById("indate").innerHTML= o.emp.indate == null ?"":o.emp.indate;
				document.getElementById("positionname").innerHTML= o.emp.positioncall == null ?"":o.emp.positioncall;
	  			setLeaveReason1("poutreason","0");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
                CloseWindow();
            }
        });
	}
	//离职回访，离职性质设置
	function setLeaveReason1(id,type){
		var json = nui.encode({"dictid":"1",type:type});
		nui.ajax({
    		url: "org.gocom.abframe.org.employee.EmpManager.changeOutReason.biz.ext",
    		data: json,
    		type: 'POST',
			cache: false,
            async:false,
			contentType: 'text/json',
			success: function(text){
				nui.get(id).setData(text.data);
			},
			error: function(jqXHR, textStatus, errorThrown){
			}
    	})
	}
	var type ; //发起还是暂存
    function onOk(e){
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
        var count = checkisapply(function(data){
        	if(data>0){
	        	nui.alert("您已经发起过离职交接流程,不能重复发起,请确认！");
		        return;
        	}else{
		        nui.confirm(msg,"操作提示",function(o){
		        	if("ok" == o){
						//按钮禁用
				    	nui.get("creatProcess").disable();
				    	nui.get("saveProcess").disable();
				    	SaveData2();
						//document.getElementById("fileCatalog2").value="OM_LEAVE_APPLY";
						//form6.submit();
		        	}
		        });
        	}
        });
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
    	om.omLeaveApply.leavetype = leavetype;//离职性质体现
		var guanZhu = nui.get("guanZhuButton").getValue();//是否关注
		om.omLeaveApply.guanZhu = guanZhu;//是否关注
		var json =nui.encode({omLeaveApply:om.omLeaveApply,misOpinion:misOpinion});
        save(json);
	}
	
	function checkisapply(callback){
		var userid = nui.get("userid").getValue();
		var json = {userid:userid};
  		nui.ajax({	
	    	url: "com.primeton.eos.ame_permanage.ame_leave_apply.queryLeaveApplybyuserid.biz.ext",
            type: 'POST',
            data: json,
            success: function (text) {
            	var count = text.count;
            	callback(count);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
	}
	
	function save(data){
		var content;
    	if(type == '1'){
           	content = '发起中...';
		}else if(type == '0'){
           	content = '暂存中...';
		}
    	mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: content
        });
    	nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_leave_apply.creatLeaveApply.biz.ext",
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
    				}
              	}else if(text.result == "-2"){
      				nui.get("creatProcess").enable();
    				nui.get("saveProcess").enable();
    				if(type==1){
	                   	nui.alert("发起流程失败！失败原因：未设置审批人，请立即联系信息技术部！");
    				}else if(type==0){
    					nui.alert("暂时保存失败！失败原因：未设置审批人，请立即联系信息技术部！");
    				}
      			}else if(text.result == "-3"){
      				nui.get("creatProcess").enable();
    				nui.get("saveProcess").enable();
    				if(type==1){
	                   	nui.alert("发起流程失败！失败原因：未设置实习生招聘专员，请立即联系信息技术部！");
    				}else if(type==0){
    					nui.alert("暂时保存失败！失败原因：未设置实习生招聘专员，请立即联系信息技术部！");
    				}
      			}else {
					nui.get("creatProcess").enable();
					nui.get("saveProcess").enable();
    				if(type==1){
	                   	nui.alert("发起流程失败！");
    				}else if(type==0){
    					nui.alert("暂时保存失败！");
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