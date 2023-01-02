<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-14 13:38:56
  - Description:
-->
<head>
<title>应用信息</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
</style>
</head>
<body>
<div class="nui-fit">
	<div title="应用信息" style="padding: 0;">
	 	<form id="form1" method="post" >
	 		<input class="nui-hidden" name="acapplication.appid"/>
        	<table style="table-layout:fixed;" id="table_file1">
	            <tr>
					<td align="right" style="width:100px">应用名称：</td>
					<td>
						<input class="nui-textbox" name="acapplication.appname" style="width:250px" required="true">
					</td>
					<td align="right" style="width:100px">应用代码：</td>
					<td>
						<input class="nui-textbox" name="acapplication.appcode" style="width:250px"  required="true"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">应用类型：</td>
					<td>
						<input class="nui-dictcombobox"  dictTypeId="ABF_APPTYPE" name="acapplication.apptype"  style="width:250px"  required="true"/>
					</td>
					<td align="right" style="width:100px">是否开通：</td>
					<td>
						<input class="nui-dictcombobox" dictTypeId="ABF_YESORNO" name="acapplication.isopen" id="isleaf" style="width:250px" shownullItem="false" required="true" onValuechanged="changeRd"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">开通日期：</td>
					<td>
						<input name="acapplication.opendate" class="nui-textbox" style="width:250px;"  required="true"/>
					</td>
					<td align="right" style="width:100px">应用上下文：</td>
					<td>
						<input name="acapplication.url" class="nui-textbox" style="width:250px" required="true"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">IP：</td>
					<td>
						<input name="acapplication.ipaddr" id="menucode" class="nui-textbox" style="width:250px" required="true"/>
					</td>
					<td align="right" style="width:100px">端口：</td>
					<td>
						<input name="acapplication.ipport" id="menucode" class="nui-textbox" style="width:250px" required="true"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">应用描述：</td>
					<td colspan="3">
						<input name="acapplication.appdesc"class="nui-textbox" style="width:610px" required="true"/>
					</td>
				</tr>
        	</table>
        </form>
  	</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="ok()" style="width:60px;margin-right:20px;">保存</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var appid = '<%=request.getParameter("appid") %>';
	var form = new nui.Form("form1");
	setData();
	function setData(){
		var json = {acapplication:{appid:appid}};
		nui.ajax({
			url: "org.gocom.abframe.rights.application.ApplicationManager.expandApplication.biz.ext",
            type: "post",
            data: json, 
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	form.setData(text);
            }
		})
	}
	//保存应用信息
	function ok(){
		var form = new nui.Form("#form1");
		var data = form.getData();
		
        if (form.isValid() == false) {
        	nui.alert("请填写必填项。")
        	return;
        }else{
        	save(data);
        	return;
        }
	}
	
	function save(data){
		nui.ajax({
				url: "org.gocom.abframe.rights.application.ApplicationManager.updateApplication.biz.ext",
				type: 'POST',
				data:data,
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.retCode==1){
	            		nui.alert("修改应用成功。");
	            		CloseWindow("save");
	            	}else{
	            		nui.alert("修改应用失败啦，请联系信息技术部。");
	            	}
	            }
			})
	}
</script>
</html>