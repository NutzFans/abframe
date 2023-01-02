<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2017-09-27 17:07:03
  - Description:
-->
<head>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<title>业务字典</title>
<style type="text/css">
	body{margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;font-size:12px;}
</style>
</head>
<body>
<div class="nui-fit" id="formcust">
	<fieldset id="field1" style="border: none;margin-top: 30px">
		<div>
			<div id='form1'>
				<table style="table-layout:fixed;">
					<tr>
						<td style="width:20%;"align="right">类型代码：</td>
		            	<td style="width:10%;" align="left">
							<input class="nui-textbox" name="dicttypeid" id='dicttypeid' value='' style="width: 150px;"/>
						</td>
					</tr>
					<tr>
						<td style="width:20%;" align="right">类型名称：</td>
		            	<td style="width:20%;" align="left">
							<input class="nui-textbox" name="dicttypename" id='dicttypename' style="width: 150px;"/>
						</td>
					</tr>
					<tr style="margin-top: 20px">
						<td style="width:20%;" align="right">父字典ID：</td>
		            	<td style="width:20%;" align="left">
							<input class="nui-textbox" name="parentid" id="parentidsss" style="width: 150px;"/>
						</td>
					</tr>
					<tr style="margin-top: 20px">
						<td style="width:20%;" align="right">字典类型：</td>
		            	<td style="width:20%;" align="left">
							<input class="nui-dictcombobox" name="dicttype" id="dicttype" showNullItem="true" dictTypeId="AME_DICTTYPE" style="width: 150px;"/>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</fieldset>
</div>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width: 60px;margin-right: 20px;">保存</a>
	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var dicttypeid = '<%=request.getParameter("dicttypeid")%>';
	var dicttypename = '<%=request.getParameter("dicttypename")%>';
	var dicttype = '<%=request.getParameter("dicttype") %>';
	
	//判断是新增还是修改
	if(dicttypeid!='null'||dicttypename!='null'){
		nui.get("dicttypeid").setReadOnly(true);
		nui.get("parentidsss").setReadOnly(true);
		nui.get("dicttypeid").setValue(dicttypeid);
		nui.get("dicttypename").setValue(dicttypename);
		nui.get("dicttype").setValue(dicttype);
	}
	function onOk(){
		var form = new nui.Form("#form1");
		var data = form.getData();
		if(data.dicttypeid==""){
			nui.alert('请输入类型代码！');
			return;
		}
		if(data.dicttypename==""){
			nui.alert('请输入类型名称！');
			return;
		}
		if(data.dicttype==""){
			nui.alert('请选择字典的类型！');
			return;
		}
		if(dicttypeid!='null'||dicttypename!='null'){
			add(data,1);
		}else{
			add(data,0);
		}
	}
	var DICid="";
	
	function GetData() {
		return DICid;
	}
	//增加最高级业务字典
	function add(data,a){
		if(a==0){
			//新增
			var dicttypeid = data.dicttypeid;//类型代码
			var dicttypename = data.dicttypename;//类型名称
			var parentid = data.parentid;//父业务字典项代码
			var dicttype = data.dicttype;//业务字典的类型
		    var json = {eosDictType:{dicttypeid:dicttypeid,dicttypename:dicttypename,parentid:parentid,dicttype:dicttype}};
			nui.ajax({
				url: "org.gocom.abframe.tools.newDict.newInsertDicType.biz.ext",
				type: 'POST',
				data:json,	
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.reCode==1){
	            		alert("新增成功！");
	            		CloseWindow("save");
	            	}else{
	            		alert("新增失败！请联系信息技术部。");
	            	}
	            }
			})
		}else if(a==1){
			//修改
			var dicttypeid = data.dicttypeid;//类型代码
			var dicttypename = data.dicttypename;//类型名称
			var dicttype = data.dicttype;
		    var json = {eosDictType:{dicttypeid:dicttypeid,dicttypename:dicttypename,dicttype:dicttype}};
		    
			nui.ajax({
				url: "org.gocom.abframe.tools.newDict.newUpDicType.biz.ext",
				type: 'POST',
				data:json,	
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.reCode==1){
	            		alert("修改成功！");
	            		CloseWindow("save");
	            	}else{
	            		alert("修改失败！请联系信息技术部。");
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