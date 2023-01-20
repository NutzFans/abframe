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
		<input name="emplevel.emplevelid" id="emplevelid" class="nui-hidden" />
		<input name="emplevel.orgseq" id="orgseq" class="nui-hidden" />
		<input name="emplevel.percostid" id="percostid" class="nui-hidden" />
        <fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>基本信息</legend>
        	<div style="padding:5px;">
            	<table>
	                <tr>
	                    <td>人员姓名：</td>
	                    <td style="width:160px;">    
	                       <input name="emplevel.username" id="username" class="nui-buttonedit" onbuttonclick="selectOmEmployee"  allowInput="false" style="width:100%;"/>
	                    </td>
	                    <td>人员工号：</td>
	                    <td style="width:160px;">    
	                       <input name="emplevel.userid" id="userid" class="nui-textbox" allowInput="false" style="width:100%;" />
	                    </td>
	                </tr>
                    <tr>
	                    <td>部门：</td>
	                    <td style="width:160px;">    
	                       <input  id="orgid" name="emplevel.orgname" class="nui-textbox" style="width:100%;" />
	                    </td>
						<td>当前有效状态：</td>
	                    <td style="width:160px;">    
	                       <input name="emplevel.currentstate" class="nui-dictcombobox" style="width:100%" dictTypeId="ABF_STATUS" required="true">
	                    </td>
                    </tr>
                    <tr>
                    	<td>有效开始日期：</td>
						<td style="width:160px;">
							<input name="emplevel.startdate"class="nui-datepicker" id="startdate" style="width:100%" required="true"/>
						</td>
	                    <td>有效截止日期：</td>
						<td style="width:160px;">
							<input name="emplevel.enddate"class="nui-datepicker" id="enddate" style="width:100%" required="true"/>
						</td>
						</tr>
						<tr>
						<td>是否统计工时率：</td>
	                    <td style="width:160px;">    
	                       <input name="emplevel.isworkrate" class="nui-dictcombobox" style="width:100%" dictTypeId="MIS_YN" required="true">
	                    </td>
	                    <td>人员级别：</td>
	                    <td style="width:160px;">   
	                       <input name="emplevel.degree" onbuttonclick="valueChangeDegree" id="degree" class="nui-combobox" style="width:100%" required="true" textField="degreename" valueField="degree" pinyinField="percostid" dataField = "degrees" shownullItem="true" allowInput="true" onvaluechanged="changeLevel">
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
        var updateURL = "com.primeton.rdmgr.labor.mispricebiz.updatemplevel.biz.ext";
    	var addURL = "com.primeton.rdmgr.labor.mispricebiz.addEmplevel.biz.ext";
    	var saveURL = "";    
    	var degrees = [];    
        nui.parse();
        var form = new nui.Form("form1");        
        function SetData(data){
        	data = nui.clone(data);
        	nui.get("orgid").disable();
        	if(data.action == "edit"){
        		var json = {emplevel: {emplevelid: data.emplevelid}};
	        	nui.ajax({
	        		url: "com.primeton.rdmgr.labor.mispricebiz.getEmplevel.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                    form.setData(o);
	                    nui.get("username").setText(o.emplevel.username);
	                    nui.get("username").setValue(o.emplevel.userid);
	                    degreedate(o.emplevel.orgseq,o.emplevel.startdate,o.emplevel.enddate);
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
            	var emplevelid = nui.get("emplevelid").getValue();
				if(emplevelid){
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
	                	if(text.exception != null){
	                		alert("人员级别保存失败!");
	                	}else{
		                    if(text.count1==1){
		                    	alert("日期区间有重复，请重新选择!");
		                    	return false;
		                    }else{
		                    	nui.alert("人员级别保存成功!",null,function (){
		                    		CloseWindow("save");
		                    	});
		                    }
	                	}
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert("s");
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
        	var b=nui.get("enddate").getValue();
        	if(b<=a){
        		alert("截止日期必须大于开始日期");
        		return false;
        	}
            SaveData();
        }
        function onCancel(e) {
            CloseWindow("cancel");
        }
        function selectOmEmployee(){
        	var btnEdit = this;
            nui.open({
                url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择人员",
                width: 650,
                height: 380,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
	                    	btnEdit.setValue(data.empname);
	                    	btnEdit.setText(data.empname);
	                    	nui.get("orgid").setValue(data.orgname);
	                    	nui.get("userid").setValue(data.userid);
	                    	nui.get("orgseq").setValue(data.orgseq);
                        }
                    }

                }
            });
        }
        
        function valueChangeDegree(){
        	var orgseq = nui.get("orgseq").getValue();
        	var startdate = nui.get("startdate").getValue();
        	var enddate = nui.get("enddate").getValue();
        	if(orgseq == '' || orgseq == null){
        		alert("选择人员级别前请选择人员姓名，人员所在部门不为空！");
        		return;
        	}
        	if(startdate == '' || startdate == null){
        		alert("选择人员级别前请选择有效开始日期！");
        		return;
        	}
        	if(enddate == '' || enddate == null){
        		alert("选择人员级别前请选择有效截至日期！");
        		return;
        	}
        	degreedate(orgseq,startdate,enddate)
        }
        
        //根据人员所属部门，有效开始日期，有效结束日期取得级别下拉框
        function degreedate(orgseq,startdate,enddate){
        	var json = {"manage":{"orgseq":orgseq,"startdate":startdate,"enddate":enddate}};
            nui.ajax({
				url:"com.primeton.rdmgr.labor.mispricebiz.getdegrees.biz.ext",
				data:json,
				type:'POST',
                async:false,
				contentType:'text/json',
				success:function(text){
					if(text.degrees.length>0){
						degrees = text.degrees;
						nui.get(degree).setData(text.degrees);
					}else{
						alert("请确认勾选的有效日期区间在已存在的工时定额成本套别有效日期区间内！");
						nui.get(degree).setData(null);
					}
				}
			});
        }
        
        //级别值改变时设置套别
        function changeLevel(){
        	var percostid = nui.get("degree").getSelected().percostid;
        	nui.get("percostid").setValue(percostid);
        }
    </script>
</body>
</html>