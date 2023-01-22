<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): shihao
  - Date: 2016-11-17 11:26:15
  - Description:
-->
<head>
<title>发送短信</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/common/nui/locale/zh_CN.js" type="text/javascript"></script>
</head>
<% 
	String userName = request.getParameter("userName");
	if(userName==null){
		userName = "";
	}
	String telphone = request.getParameter("telphone");
	if(telphone==null){
		telphone = "";
	}
	String content = request.getParameter("content");
	if(content==null){
		content = "";
	}
%>
<body style="width: 100%;height: 100%;overflow: hidden;">
	<dir id="smsForm" style="padding-top:5px;">
		<input class="nui-hidden" id="userid"  />
		<fieldset id="smsFieldset" title="短信详细信息" style="border:solid 1px #aaa;padding:3px;width: 88%;">
		  <legend><span>短信详细信息</span></legend>
		  <table style="width:100%;height:100%;table-layout:fixed;" class="nui-form-table">
		 	<tr>
		 		<td class="form_label" width="25%" align="right">发送人:</td>
		 		<td>
		 			<input id="userName" name="userName" 
		 			<%if(!"".equals(userName)){%>
		 				value="<%=userName %>" text="<%=userName %>"  
		 			<%} %>
		 			class="mini-textboxlist" textField="empname" valueField="empname" searchField="name" url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" closeclick="clean" style="width:40%" required="true" onvaluechanged="changeTel"/>
		 		</td>
		 	</tr>
		 	<tr>
		 		<td class="form_label" align="right">手机号码:</td>
		 		<td>
		 			<input id="telphone" class="nui-textbox" value="<%=telphone %>" name="telphone" required="true"  style="width:40%"/>
		 		</td>
		 	</tr>
		 	<tr>
		 		<td class="form_label" align="right">短信内容:</td>
		 		<td>
		 			<input id="content" class="nui-textarea" name="content" value="<%=content %>"  required="true" style="width:60%"/>
		 		</td>
		 	</tr>
		 	
		 </table>
		 <div class="nui-toolbar" style="padding:0px;" borderStyle="border:0;">
			    <table width="100%">
			      <tr>
			        <td style="text-align:center;">
			          <a class="nui-button" iconCls="icon-upload" onclick="sendSms">发送</a>
			          <span style="display:inline-block;width:25px;"></span>
			          <a class="nui-button" iconCls="icon-cancel" onclick="reset">清除</a>
			        </td>
			      </tr>
			    </table>
		</div>
	   </fieldset>
 	</dir>
</body>
<script type="text/javascript">
    nui.parse();
    var form = new nui.Form("#smsForm");
    
    function reset(){
    	form.reset();
    }
    
    function sendSms(){
    	form.validate();
		if (form.isValid() == false) {
			nui.alert("请检查必填项!");
			return;
		}
        var data = form.getData(false, true);
		var json = nui.encode(data);
		$.ajax({
	            url: "com.primeton.eos.ame_common.smsPlatform.sendSmsByWeb.biz.ext",
	            type: 'POST',
	            data: json,
	            cache: false,
	            contentType:'text/json',
	            cache: false,
	            success: function (text) {
	                var returnJosn = nui.decode(text);
	                var status = returnJosn.status;
	                var msginfo = returnJosn.msginfo;
	                if(status=="SUCC"){
		            	nui.alert("发送成功","提示");
	            	}else{
	            		nui.alert(msginfo,"提示");
	            	}
	            }
	     	}); 
    }
    
	function changeTel(e){
		var data = e.sender.data;
		var tel="";
		var userid="";
		for(var i=0;i<data.length;i++){
			if(tel==""){
				tel = data[i].MOBILENO;
				userid = data[i].userid;
			}else{
				tel = tel + "," + data[i].MOBILENO;
				userid = userid + "," + data[i].userid;
			}
		}
		nui.get("telphone").setValue(tel);
		nui.get("userid").setValue(userid);
	}
	    
    function clean(){
    	nui.get("userName").setText("");
     	nui.get("userName").setValue("");
		nui.get("telphone").setValue("");
		nui.get("userid").setValue("");
    }
</script>
