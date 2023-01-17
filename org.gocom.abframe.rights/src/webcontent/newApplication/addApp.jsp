<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-14 13:40:07
  - Description:
-->
<head>
<title>应用列表</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;font-size:12px;}
</style>
</head>
<body>
<div class="nui-fit">
	<div id='form1'>
		<table style="table-layout:fixed;">
			<input class="nui-hidden" name="appid"/>
			<tr>
				<td style="width:100px" align="right">应用名称：</td>
            	<td style="width:150px;" align="left">
					<input class="nui-textbox" name="appname" style="width:100%" required="true"/>
				</td>
				<td style="width:100px" align="right">应用代码：</td>
            	<td style="width:150px;" align="left">
					<input class="nui-textbox" name="appcode" style="width:100%" required="true"/>
				</td>
			</tr>
			<tr>
				<td style="width:100px" align="right">应用类型：</td>
            	<td style="width:150px;" align="left">
					<input class="nui-dictcombobox"  dictTypeId="ABF_APPTYPE" name="apptype" style="width:100%"/>
				</td>
				<td style="" align="right">是否开通：</td>
            	<td style="" align="left">
					<input class="nui-dictcombobox" name="isopen" dictTypeId="ABF_YESORNO" style="width:100%" />
				</td>
			</tr>
			<tr>
				<td style="width:100px" align="right">开通日期：</td>
            	<td style="width:150px;" align="left">
					<input class="nui-datepicker" name="opendate" style="width:100%"  format="yyyy-MM-dd"/>
				</td>
				<td style="" align="right">应用上下文：</td>
            	<td style="" align="left">
					<input class="nui-textbox" name="url" style="width:100%" />
				</td>
			</tr>
			<tr>
				<td style="width:100px" align="right">IP：</td>
            	<td style="width:150px;" align="left">
					<input class="nui-textbox" name="ipaddr" style="width:100%"/>
				</td>
				<td style="" align="right">端口：</td>
            	<td style="" align="left">
					<input class="nui-textbox" name="ipport" style="width:100%"/>
				</td>
			</tr>
			<tr>
				<td style="width:100px" align="right">应用描述：</td>
            	<td colspan="3" style="width:510px;" align="left">
					<input class="nui-textbox" name="appdesc" style="width: 100%;"/>
				</td>
			</tr>
		</table>
	</div>
</div>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width: 60px;margin-right: 20px;">保存</a>
	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var status = '<%=request.getParameter("status")%>';//0是新增，1是修改
	
	function setData(data){
		if(status == '0'){
			return;
		}else{
			var form = new nui.Form("form1");
			form.setData(data[0]);
		}
	}
	function onOk(){
		var form = new nui.Form("#form1");
		var data = form.getData();
		
        if (form.isValid() == false) {
        	nui.alert("请填写必填项。")
        	return;
        }else{
        	add(data);
        	return;
        }
	}

	//增加最高级业务字典
	function add(data){
		if(status=='0'){
			//新增
		    var json = {acapplication:{	appname:data.appname,appcode:data.appcode,
		    							appdesc:data.appdesc,apptype:data.apptype,ipaddr:data.ipaddr,
		    							ipport:data.ipport,isopen:data.isopen,opendate:data.opendate,url:data.url
		    							}};
			nui.ajax({
				url: "org.gocom.abframe.rights.application.ApplicationManager.addApplication.biz.ext",
				type: 'POST',
				data:json,	
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.retCode){
	            		nui.alert("新增应用成功。");
	            		CloseWindow("save");
	            	}else{
	            		nui.alert("新增应用失败啦，请联系信息技术部。");
	            	}
	            }
			})
		}else if(status=='1'){
			//修改
	     	var json = {acapplication:{	appid:data.appid,appname:data.appname,appcode:data.appcode,
		    							appdesc:data.appdesc,apptype:data.apptype,ipaddr:data.ipaddr,
		    							ipport:data.ipport,isopen:data.isopen,opendate:data.opendate,url:data.url
		    							}};
			nui.ajax({
				url: "org.gocom.abframe.rights.application.ApplicationManager.updateApplication.biz.ext",
				type: 'POST',
				data:json,	
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
	}
	//关闭窗口
	function onCancel(e) {
        CloseWindow("cancel");
    }
    function CloseWindow(action) {
        if (action == "cancel" ) {
            if (!confirm("是否关闭？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
</script>
</html>