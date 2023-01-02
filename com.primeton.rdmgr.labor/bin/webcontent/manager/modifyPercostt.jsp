<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2016-06-17 14:26:45
  - Description:
-->
<head>
<title>Title</title>
 <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    
</head>
<body>
	<form id="form1" method="post" >
		<input name="percost.percostid" id="percostid" class="nui-hidden" />
        <fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>基本信息</legend>
        	<div style="padding:5px;">
            	<table>
	                <tr>
	                    <td>工时成本套别名称：</td>
	                    <td style="width:160px;">    
	                       <input name="percost.percostname" class="nui-textbox" style="width:100%"  required="true">
	                    </td>
	                    <td>当前状态：</td>
	                    <td style="width:160px;">    
	                       <input name="percost.currentstate" class="nui-dictcombobox" style="width:100%" dictTypeId="ABF_STATUS" required="true">
	                    </td>
                    </tr>
                    <tr>
	                    <td>有效开始日期：</td>
						<td style="width:160px;">
							<input name="percost.startdate"class="nui-datepicker" id="startdate" style="width:100%" required="true"/>
						</td>
	                    <td>有效截止日期：</td>
						<td style="width:160px;">
							<input name="percost.closedate"class="nui-datepicker" id="closedate" style="width:100%" required="true"/>
						</td>
					</tr>	
				</table>
			</div>
		</fieldset>
		<div style="text-align:center;padding:10px;">
			<a class="nui-button"onclick="onOk"style="width:60px;margin-right:20px;">确定</a>
			<a class="nui-button"onclick="onCancel"style="width:60px;">关闭</a>
		</div>
    </form>
	<script type="text/javascript">
        var updateURL = "com.primeton.rdmgr.labor.mispricebiz.updatePercost.biz.ext";
    	var addURL = "com.primeton.rdmgr.labor.mispricebiz.addPercost.biz.ext";
    	var saveURL = "";        
        nui.parse();
        var form = new nui.Form("form1");        
        function SetData(data){
        	data = nui.clone(data);
        	if(data.action == "edit"){
        		var json = {percost: {percostid: data.percostid}};
	        	nui.ajax({
	        		url: "com.primeton.rdmgr.labor.mispricebiz.getPercost.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                    form.setData(o);
	                    form.isChanged(false);
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
        	}
        }
        function SaveData() {
            var o = form.getData();            
            if(form.validate()){
            	var percostid = nui.get("percostid").getValue();
				if(percostid){
					saveURL = updateURL;
				} else{
					saveURL = addURL;
				}
	            var json = nui.encode(o);
	            nui.ajax({
	                url: saveURL,
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                    if(text.count1==1){
	                    	alert("日期区间有重复，请重新选择!");
	                    	return false;
	                    }else{
	                    	CloseWindow("save");
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
        	var a=nui.get("startdate").getValue();
        	var b=nui.get("closedate").getValue();
        	if(b<=a){
        		alert("截止日期必须大于开始日期");
        		return false;
        	}
            SaveData();
        }
        function onCancel(e) {
            CloseWindow("cancel");
        }
    </script>
</body>
</html>