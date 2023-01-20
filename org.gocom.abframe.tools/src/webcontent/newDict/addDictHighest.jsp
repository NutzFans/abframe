<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2017-09-30 14:07:22
  - Description:
-->
<head>
<title>新增</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;font-size:12px;}
</style>
</head>
<body>
<div class="nui-fit" id="formcust">
	<div id='form1'>
		<input name="dicttypeid" id='dicttypeid' class="nui-hidden"/>
		<input name="eosDictEntry.status" value='1' class="nui-hidden"/>
		<input name="eosDictEntry.eosDictType.dicttypeid" id="pardicttypeid" class="nui-hidden"/>
		<table style="table-layout:fixed;padding-top: 10px;">
			<tr>
				<td align="right" style="width:140px">
					字典类型代码：
				</td>
				<td>
					<input name="dicttypeid" id='dicttypeid' class="nui-textbox" style="width: 100%"/>
				</td>
			</tr>
			<tr>
				<td align="right" style="width:140px">
					上级类型项代码：
				</td>
				<td>
					<input name="eosDictEntry.parentid"  id='parentid' class="nui-textbox" style="width: 100%"/>
				</td>
			</tr>
			<tr>
				<td align="right" style="width: 100px" >
					字典类型项代码：
				</td>
				<td>
					<input name="eosDictEntry.dictid" id='dictid' required="true" class="nui-textbox" style="width: 200px"/>
				</td>
			</tr>
			<tr>
				<td align="right">
					字典类型项名称：
				</td>
				<td>
					<input class="nui-textbox" required="true" id="dictname" name="eosDictEntry.dictname" style="width: 100%"/>
				</td>
			</tr>
			<tr>
				<td align="right">
					业务参数1：
				</td>
				<td>
					<input class="nui-textbox" id="filter1" name="eosDictEntry.filter1" style="width: 100%"/>
				</td>
			</tr>
			<tr>
				<td align="right">
					业务参数2：
				</td>
				<td>
					<input class="nui-textbox" id="filter2" name="eosDictEntry.filter2" style="width: 100%"/>
				</td>
			</tr>
			<tr>
				<td align="right">
					备注说明：
				</td>
				<td>
					<input class="nui-textbox" id="note" name="eosDictEntry.note" style="width: 100%"/>
				</td>
			</tr>
			<tr>
				<td align="right">
					显示排序：
				</td>
            	<td align="left">
            		<input class="nui-textbox" name="eosDictEntry.sortno" id='sortno' style="width:100%"/>
			    </td>
			</tr>
		</table>
	</div>
</div>
<div style="text-align: center;padding: 5px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width: 60px;margin-right: 20px;">保存</a>
	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	//页面进入时调用的方法
	var pd = '';
    function setData(data,a){
    	//新增
    	if(a==0){
    		nui.get("pardicttypeid").setValue(data.parentids);
    		//判断是否为最顶级（是否含有父字典id）
    		if(data.parentid==null){
    			nui.get("dicttypeid").setValue(data.dicttypeid);
    			if(data.parentids==null){
    				nui.get("parentid").setReadOnly(true);
    			}
    		}
    		if(data.dictid=="dictid"){
    			nui.get("parentid").setValue('');
    			nui.get("dicttypeid").setReadOnly(true);
	    	}else{
	    		nui.get("parentid").setValue(data.dictid);
	    		nui.get("pardicttypeid").setValue(data.dicttypeid);
	    	}
	    	pd = 0;
    	}else if(a==1){
    		nui.get("pardicttypeid").setValue(data.parentids);
    		nui.get("dicttypeid").setValue(data.dicttypeid);
    		nui.get("parentid").setReadOnly(true);
			nui.get("dicttypeid").setReadOnly(true);
			
    		//上级类型代码
    		if(data.parentid=='dictid'){
    			nui.get("parentid").setValue('');
    		}else{
    			nui.get("parentid").setValue(data.parentid);
    		}
    		
    		//字典类型代码
    		nui.get("dictid").setValue(data.dictid);
    		//字典类型项名称
    		nui.get("dictname").setValue(data.dicttypename);
    		nui.get("filter1").setValue(data.filter1);
    		nui.get("filter2").setValue(data.filter2);
    		nui.get("note").setValue(data.note);
    		//显示排序
    		nui.get("sortno").setValue(data.sortno);
    		nui.get("dictid").setReadOnly(true);
    		pd = 1;
    	}
    }
	//表单效验
	function onOk(){
		//定义变量接受form表单数据
		var form = new nui.Form("#formcust");
		var data = form.getData(); 
		var dic = data.eosDictEntry;
	  	if(dic.dictid==''||dic.dictname==''){
	  		nui.alert("表单信息填写不完整，请确认必输项是否填写！");
			return;
	  	}
		saveData(data,pd);
	}
	
	//保存数据
	var DICid='';
	function saveData(data,pd){
		var json = data;
		DICid = json;
		//pd=0新增，pd=1修改
		if(pd==0){
			nui.ajax({
	            url: "org.gocom.abframe.tools.newDict.newInsertDicEntry.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	if(o.reCode==1){
	            		alert("新增成功！");
            			CloseWindow("save");
	            	}else if(o.reCode==0){
	            		alert("新增失败！");
	            	}
	            }
	        });
		}else if(pd==1){
			nui.ajax({
	            url: "org.gocom.abframe.tools.newDict.newUpdateDicEntry.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	if(o.reCode==1){
	            		alert("修改成功！");
	            		CloseWindow("save");
	            	}else if(o.reCode==0){
	            		alert("修改失败！");
	            	}
	            }
	        });
		}
	}
	//关闭窗口
	function onCancel(e) {
        CloseWindow("cancel");
    }
    function GetData() {
		return DICid;
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