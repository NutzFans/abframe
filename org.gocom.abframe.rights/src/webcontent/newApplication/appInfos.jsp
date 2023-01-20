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
<title>功能信息</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
</style>
</head>
<body>
<div class="nui-fit">
	<div title="功能信息" style="padding: 0;">
	 	<form id="form1" method="post" >
        	<table style="table-layout:fixed;" id="table_file1">
	            <tr>
					<td align="right" style="width:100px">功能名称：</td>
					<td>
						<input class="nui-textbox" name="function.funcname" style="width:250px" required="true">
					</td>
					<td align="right" style="width:100px">功能编码：</td>
					<td>
						<input class="nui-textbox" name="function.funccode" readonly="false" style="width:250px"  required="true"/>
					</td>
				</tr>
			  	<tr>
					<td align="right" style="width:100px">功能类型：</td>
					<td>
						<input class="nui-dictcombobox" name="function.functype" dictTypeId="ABF_FUNCTYPE" onvaluechanged="changetype" style="width:250px"/>
					</td>
					<td align="right" style="width:100px">是否菜单：</td>
					<td>
						<input class="nui-dictcombobox" name="function.ismenu" dictTypeId="ABF_YESORNO"  style="width:250px" />
					</td>
				</tr>
				<tr>
					<td align="right" style="width:200px">是否数据权限控制：</td>
					<td >
					<input class="nui-dictcombobox" name="function.iscontrolconfig" id="iscontrolconfig" dictTypeId="ABF_YESORNO" value="y"  style="width:100%" />
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">调用入口：</td>
					<td colspan="3">
						<input class="nui-textbox" name="function.funcaction" id="funcaction"  style="width:100%" required="true"/>
					</td>
				
				</tr>
				<tr>
					<td align="right" style="width:100px">输入参数：</td>
					<td colspan="3">
						<input class="nui-textbox" name="function.parainfo"  style="width:100%" />
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">功能描述：</td>
					<td colspan="3">
						<input class="nui-textbox" name="function.funcdesc"  style="width:100%" />
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
		var json = {function:{funccode:appid}};
		nui.ajax({
			url: "org.gocom.abframe.rights.application.FunctionManager.expandFunction.biz.ext",
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
			url: "org.gocom.abframe.rights.application.FunctionManager.updateFunction.biz.ext",
			type: 'POST',
			data:{acfunction:data.function},
			contentType: 'text/json',
            success: function (result) {
            	if(result.isSuccess==1){
            		nui.alert("修改功能成功。");
            	}else{
            		nui.alert("修改功能失败啦，请联系信息技术部。");
            	}
            }
		})
	}
	
	function changetype(e){
		if(e.value=='4'){//如果功能类型是按钮则默认调用入口为"button"
			nui.get("funcaction").setValue("button");
		}
	}
</script>
</html>