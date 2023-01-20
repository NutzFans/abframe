<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wyy
  - Date: 2016-06-28 10:10:25
  - Description:
-->
<head>
	<title>反馈信息回复</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-fit">
		<form id="form1" method="post">
			<input class="nui-hidden" name="ameFeedback.feedbackid" id="feedbackid"/>
			<fieldset id="field1" style="border:solid 1px #aaa;padding:1px;">
				<legend>反馈基本信息</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">反馈人：</td>
							<td><input name="ameFeedback.feedbackperson" id="feedbackperson" class="nui-textbox" required="false" style="width:120px" allowInput="false"/></td>
							<td align="right" style="width:120px;">反馈功能：</td>
							<td><input name="ameFeedback.functionname" id="functionname" class="nui-textbox" required="false" style="width:120px" allowInput="false"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">反馈类型：</td>
							<td><input name="ameFeedback.feedbacktype" id="feedbacktype" class="nui-dictcombobox" dictTypeId="AME_FEEDTYPE" required="false" style="width:150px"  allowInput="false" readonly="readonly"/></td>
							<td align="right" style="width:120px;">反馈时间：</td>
							<td><input name="ameFeedback.feedbackdate" id="feedbackdate" class="nui-datepicker" required="false" style="width:120px" allowInput="false" readonly="readonly"/></td>
						</tr> 
						<tr>
							<td align="right" style="width:120px;">反馈内容：</td>
							<td colspan="3"><input name="ameFeedback.contentexplain" id="contentexplain" class="nui-textarea" required="false" style="width:495px;height:78px" allowInput="false"/></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
		<form id="form2" method="post">
			<input class="nui-hidden" name="ameFeedback.state" id="feedbackstate"/>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:1px;">
				<legend>回复信息</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td><input class="nui-hidden" name="ameFeedback.feedbackid" id="feedbackid2" required="true"/></td>
						</tr>						
						<tr>
							<td align="right" style="width:120px;">回复意见：</td>
							<td colspan="8"><input name="ameFeedback.replyadvice" id="replyadvice" class="nui-textarea"  required="true" style="width:495px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">需求编号：</td>
							<td colspan="8"><input name="ameFeedback.requirmentnumber" id="requirmentnumber" class="nui-textbox" required="false" style="width:495px" /></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
		<jsp:include page="/ame_common/detailFile.jsp"/>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">确定</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	
	<script type="text/javascript">
       	 nui.parse();
 		 var form1 = new nui.Form("#form1");
 		 var form2 = new nui.Form("form2");
	     function SetData(data){
	    	data = nui.clone(data);
	    	if(data.action == "edit")
	    		var json = nui.encode({ameFeedback:data}); 
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_common.ameFeedback.replyFeedback.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	//加载附件设置参数
                	    nui.get("grid_0").load({"groupid":"ameFeedback","relationid":o.ameFeedback.feedbackid});
	                	nui.parse();
	                    form1.setData(o);
	                    form2.setData(o);
	                    form1.isChanged(false);	
	                    form2.isChanged(false);	 
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    		}
    	function onOk(){
    		var feedbackid = nui.get("feedbackid").getValue();
    		nui.get("feedbackid2").setValue(feedbackid);
    		nui.get("feedbackstate").setValue("1");
    		var form2 = new nui.Form("#form2");
    		form2.validate();
    		if(form2.isValid()){
    			var data = form2.getData();
	    		var json = nui.encode(data);
	    		nui.ajax({
		        		url: "com.primeton.eos.ame_common.ameFeedback.updateFeedback.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',  
		                success: function (o) {
		                	alert("回复成功");
		                	CloseWindow("saveSuccess");
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                    CloseWindow();
		                }
		        	});
    		}else{
    			alert("请填写合法数据");
    			return;
    		}
	    }
	    //标准方法接口定义
        function CloseWindow(action) {
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        function onCancel(e) {
            CloseWindow("cancel");
        }
        //设置业务字典值-反馈类型
		function dictGetType(e) {
			return nui.getDictText('AME_FEEDTYPE',e.value);
		}
		
    </script>
</body>
</html>