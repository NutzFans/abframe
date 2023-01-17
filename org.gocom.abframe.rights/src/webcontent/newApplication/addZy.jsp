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
<title>新增资源</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;font-size:12px;}
</style>
</head>
<body>
<div class="nui-fit">
	<div id='form1'>
		<table style="table-layout:fixed;margin: 50px auto 0">
			<input class="nui-hidden" id="funccode" name="acFunction.funccode" style="width:100%" />
			<input class="nui-hidden" name="resid" style="width:100%" />
			<tr>
				<td style="width:100px" align="right">显示名称：</td>
            	<td align="left">
					<input class="nui-textbox" name="resname" style="width:100%" required="true"/>
				</td>
				<td style="width:100px" align="right">资源类型：</td>
            	<td  align="left">
					<input class="nui-dictcombobox"  dictTypeId="ABF_RESOURCETYPE" name="restype" style="width:100%" required="true"/>
				</td>
			</tr>
			<tr>
				<td style="width:100px" align="right">资源路径：</td>
            	<td colspan="3"  align="left">
					<input class="nui-textbox" name="respath" style="width:100%"/>
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
	var appid = '<%=request.getParameter("appid")%>';
	var status = '<%=request.getParameter("status")%>';
	nui.get("funccode").setValue(appid);
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

	//增加
	function add(data){
		if(status == '0'){
			//新增
			nui.ajax({
				url: "org.gocom.abframe.rights.application.ResourceManager.addFuncResource.biz.ext",
				type: 'POST',
				data:{funcResource:data},	
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.funcResourceAdd_return){
	            		nui.alert("新增资源成功。");
	            		CloseWindow("save");
	            	}else{
	            		nui.alert("新增资源失败啦，请联系信息技术部。");
	            	}
	            }
			})
		}else{
			//修改
			//新增
			nui.ajax({
				url: "org.gocom.abframe.rights.application.ResourceManager.updateFuncResource.biz.ext",
				type: 'POST',
				data:{funcResourceUpdate:data},	
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.funcResourceUpdate_result){
	            		nui.alert("修改资源成功。");
	            		CloseWindow("save");
	            	}else{
	            		nui.alert("修改资源失败啦，请联系信息技术部。");
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