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
<title>新增编辑功能列表</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;font-size:12px;}
</style>
</head>
<body>
<div class="nui-fit">
	<div id='form1'>
		<table style="margin-top: 30px;">
			<input class="nui-hidden" id="appid" name="acFuncgroup.funcgroupid"/>
			<tr>
				<td style="width:100px" align="right">功能名称：</td>
            	<td style="width:150px;" align="left">
					<input class="nui-textbox" name="funcname" style="width:100%" required="true"/>
				</td>
				<td style="width:100px" align="right">功能代码：</td>
            	<td style="width:150px;" align="left">
					<input class="nui-textbox" id="funccode" name="funccode" style="width:100%" required="true"/>
				</td>
			</tr>
			<tr>
				<td style="width:100px" align="right">页面类型：</td>
            	<td style="width:150px;" align="left">
					<input class="nui-dictcombobox"  dictTypeId="ABF_FUNCTYPE" onvaluechanged="changefunc" value="0" name="functype" style="width:100%"/>
				</td>
				<td style="width:100px" align="right">是否菜单：</td>
            	<td style="" align="left">
					<input class="nui-dictcombobox" name="ismenu" dictTypeId="ABF_YESORNO" value="n"  style="width:100%" />
				</td>
			</tr>
			<tr>
				<td style="width:150px" align="right">是否数据权限控制：</td>
            	<td align="left">
					<input class="nui-dictcombobox" name="iscontrolconfig" dictTypeId="ABF_YESORNO" required="true" style="width:100%" />
				</td>
			</tr>
			<tr>
				<td style="width:100px" align="right">功能入口：</td>
				<td style="width:200px;" align="left" colspan="3">
					<input class="nui-textbox" name="funcaction" id="funcaction" style="width: 100%;"/>
				</td>
			</tr>
			<tr>
				<td style="width:100px" align="right">输入参数：</td>
            	<td colspan="3" style="width:510px;" align="left">
					<input class="nui-textbox" name="parainfo" style="width: 100%;"/>
				</td>
			</tr>
			<tr>
				<td style="width:100px" align="right">功能描述：</td>
            	<td colspan="3" style="width:510px;" align="left">
					<input class="nui-textbox" name="funcdesc" style="width: 100%;"/>
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
	var appid = '<%=request.getParameter("appid")%>';
	nui.get("appid").setValue(appid);
	var form = new nui.Form("#form1");
	function setData(data){
		if(status == '0'){
			
			return;
		}else{
			nui.get('funccode').setEnabled(false);
			form.setData(data[0]);
		}
	}
	
	function onOk(){
		var form = new nui.Form("#form1");
		var data = form.getData();
		form.isValid()
        if (form.isValid() == false) {
        	nui.alert("请填写必填项。")
        	return;
        }else{
        	save(data);
        	return;
        }
	}

	//增加最高级业务字典
	function save(data){
		if(status=='0'){
			var json = {functionTemp:data};
			//新增
			nui.ajax({
				url: "org.gocom.abframe.rights.application.FunctionManager.addFunction.biz.ext",
				type: 'POST',
				data:json,	
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.isSuccess=='1'){
	            		nui.alert("新增功能成功啦。");
	            		CloseWindow("save");
	            	}else{
	            		nui.alert("新增功能失败啦，请联系信息技术部。");
	            	}
	            }
			})
		}else if(status=='1'){
			//修改
		    var json = {acfunction:data};
			nui.ajax({
				url: "org.gocom.abframe.rights.application.FunctionManager.updateFunction.biz.ext",
				type: 'POST',
				data:json,	
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.isSuccess=='1'){
	            		nui.alert("修改功能成功啦。");
	            		CloseWindow("edit");
	            	}else{
	            		nui.alert("修改功能失败啦，请联系信息技术部。");
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
    
    function changefunc(e){
    	if(e.value=="4"){//按钮类型的话默认url为button
    		nui.get("funcaction").setValue("button");
    	}
    }
</script>
</html>