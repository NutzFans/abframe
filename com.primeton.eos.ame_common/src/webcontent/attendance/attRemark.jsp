<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): 朱海翔
  - Date: 2017-03-20 11:28:42
  - Description:
-->
<head>
<title>考勤备注信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js"
	type="text/javascript"></script>
</head>
<body>
	<div>
<form id="form1" method="post">
	<fieldset id="field1" style="border:solid 1px #aaa;padding:2px;">
		<legend>考勤备注信息</legend>
			<table style="table-layout:fixed;" id="table_file">
				
				<tr>
					<td align="right" width="80px">备注信息：</td>
					<td align="left"><input id="remark" class="nui-textarea" required="true" style="width:240px"/><input id="remarktype" class="nui-hidden" /></td>
				</tr>
			</table>
		</fieldset>
	</form>
</div>
<div style="text-align:center;padding:2px; class="nui-toolbar">
	<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
</div>
<script type="text/javascript">
       nui.parse();
       var form = new nui.Form("#form1");
       var remarkData = [];
       var signinid = "";
       var signoutid = "";
       var SIGNINREMARK = "";
       var SIGNOUTREMARK ="";
        function SetData(data){
        	data = nui.clone(data);
        	signinid = data.signinid;
        	signoutid = data.signoutid;
        	SIGNINREMARK = data.SIGNINREMARK;
        	SIGNOUTREMARK = data.SIGNOUTREMARK;
        	remarktype = data.remarktype;
        	nui.get("remarktype").setValue(remarktype);
        }
        function SaveData() {
            if(form.validate()){                         
            var remarktype = nui.get("remarktype").getValue();
            var remark = nui.get("remark").getValue();
            if(remarktype == 1){
            	var signid = signinid;
            }else{
            	var signid = signoutid;
            }
            var json = nui.encode({signid : signid,remark : remark,remarktype:remarktype});
            nui.ajax({
                url: "com.primeton.eos.ame_common.ameAttendance.addRemark.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                   var returnJson = nui.decode(text);
		              if(returnJson.exception == null){
		                CloseWindow("saveSuccess");
		              }else{
		                nui.alert("保存失败", "系统提示", function(action){
		                    CloseWindow("saveFailed");
		                  });
		                }        
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
               
            });
        }else{
        	return;
        }
    }
	function GetData(){
      var remarktype = nui.get("remarktype").getValue();
      var remark = nui.get("remark").getValue(); 
      var data = {remark : remark,remarktype:remarktype};
      return data;
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
        function onOk(e) {
            SaveData();
        }
        function onCancel(e) {
            CloseWindow("cancel");
        }
        
        
    </script>
</body>
</html>