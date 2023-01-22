<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): liubo
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>新增/编辑考勤规则信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
		<form id="form1" method="post">
			
				<table style="table-layout:fixed;" id="table_file1">
					<tr>
						<td align="right" style="width:120px">考勤规则编号:</td>
						<td ><input name="attendance.ruleno" id="ruleno" readonly="readonly" class="nui-textbox" style="width:170px"/></td>	
						<td align="right" style="width:120px">考勤规则名称:</td>
						<td><input name="attendance.rulename" id="rulename" class="nui-textbox" style="width:170px" required="true"/></td>
					</tr>
					
					<tr>
						<td align="right" style="width:120px">签到时间:</td>
						<td><input name="attendance.starttime" id="starttime" class="mini-timespinner" format="H:mm" style="width:170px"/></td>
						<td align="right" style="width:120px">签退时间:</td>
						<td><input name="attendance.endtime" id="endtime" class="mini-timespinner" format="H:mm" style="width:170px" /></td>
					</tr>
					
					<tr>
						<td align="right" style="width:120px">考勤地点类型:</td>
						<td><input name="attendance.ruletype" id="ruletype" class="nui-dictcombobox" dictTypeId="AME_ATTENDANCE_RULETYPE"   value="1"  style="width:170px" showNullItem="true" nullItemText="" onvaluechanged="onTypeChanged"/></td>
						<td align="right" style="width:120px">是否默认规则:</td>
						<td><input name="attendance.status" id="status" class="nui-dictcombobox" dictTypeId="MIS_YN" value="0" showNullItem="true" nullItemText="" style="width:170px"/></td>
					</tr>
					<tr id="tr_1">
						<td align="right" style="width:120px">考勤地理位置:</td>
						<td><input name="attendance.address" id="address" class="nui-textbox" onclick="map()" style="width:170px"/></td>
						<td align="right" style="width:120px">经纬度类型:</td>
						<td><input name="attendance.datatype" id="datatype" class="nui-dictcombobox" dictTypeId="AME_ATTENDANCE_DATATYPE" value="1" showNullItem="true" nullItemText="" style="width:170px"/></td>
					</tr>
					
					<tr id="tr_2">
						<td align="right" style="width:120px">有效范围(米):</td>
						<td><input name="attendance.validrange" id="validrange" class="nui-textbox" style="width:170px" vtype="float" floatErrorText="请输入数字"/></td>
					</tr>
					
				</table>
				<input name="attendance.longitude" id="longitude"  class="nui-hidden"/>
					<input name="attendance.latitude" id="latitude" class="nui-hidden"/>
					<!-- 供应商id -->
				    <input name="attendance.ruleid" id="ruleid"  class="nui-hidden"/>
		</form>
</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" id="onoKAttendance" style="width:60px;margin-right:20px;">确定</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>

<script type="text/javascript">



	  	var form = new nui.Form("form1");
        var updateURL = "com.primeton.eos.ame_common.ameAttendance.updateAttendance.biz.ext";
    	var addURL = "com.primeton.eos.ame_common.ameAttendance.addAttendance.biz.ext";
    	var saveURL = "";  
    	nui.parse();
	    function SetData(data){
	    	data = nui.clone(data);
	    	if(data.action == "edit"){
    		var json = nui.encode({attendance:data});        			        		
        	nui.ajax({
        		url: "com.primeton.eos.ame_common.ameAttendance.getAttendance.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                	nui.parse();
                    var temp1=nui.get("ruleid");
                    temp1.setValue(o.attendance.ruleid);
                    //如果是固定位置，则显示经纬度
                    var type = o.attendance.ruletype;
                    if(type==1){
						showTr();
					}else if(type==3){
						hideTr();
						$("#tr_2").show(); 
					}else{
						hideTr();
					}
                    form.setData(o);
                    form.isChanged(false);
                     	 
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
        	});
    		}
    		if(data.action == "new"){
    			//设置考勤规则编号
				var ruleno = "KQ";
				nui.ajax({
		            url: "com.primeton.eos.ame_common.ameAttendance.getRuleno.biz.ext",
					type: 'POST',
					data: {firstPart: ruleno},	
					contentType: 'text/json',
		            success: function (o) {
		            	nui.get("ruleno").setValue(o.ruleno);
		            }
		        });
		        
    		}
    	}
    	/* function validecustnum(){
        	//保证考勤规则编号唯一
            var ruleno = nui.get("ruleno").getValue();
            var json = {ruleno: ruleno};
            nui.ajax({
                url: "com.primeton.eos.ame_common.ameAttendance.validateRuleno.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                   	if(text.cont == 1){
                   		alert("考勤规则编号已被" + text.attendance.rulename + "使用！");
                   		return;
                   	}
                   	
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
        } */
        
        //如果规则中，为不固定地理位置，隐藏地理位置
        function hideTr(){
            $("#tr_1").hide();  
            //$("#tr_2").hide();
            //将经纬度
            nui.get("longitude").setValue(null);
	        nui.get("latitude").setValue(null); 
	        nui.get("address").setValue(null); 
	        nui.get("datatype").setValue(null);	
	        //nui.get("validrange").setValue(null);
        }
        //如果规则中，为固定地理位置。则显示
        function showTr(){
        	$("#tr_1").show();  
            //$("#tr_2").show();  	
        }
        
        //规则中位置类型发生变化
        function onTypeChanged(){
        	var ruletype = nui.get("ruletype");
        	var values = ruletype.getValue();
			if(values==1){
				showTr();
			}else if(values==3){
				hideTr();
				//$("#tr_2").show(); 
			}else{
				hideTr();
			}
        }
        
        function map() {        	
            nui.open({
                url: "<%=request.getContextPath() %>/ame_common/attendance/baiduMap.jsp",
                title: "地图信息", 
				width: 700,
	            height: 450,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var longitude = nui.get("longitude").getValue();
                    var latitude = nui.get("latitude").getValue();
                    var address = nui.get("address").getValue();
                    var data = {longitude:longitude,latitude:latitude,suggestId:address};
                    iframe.contentWindow.SetData(data);
                }, 
                ondestroy: function (action) {
	                
                	var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(nui.decode(data));
					if (action == "ok") {
	                	nui.get("address").setValue(data.suggestId);
	                	nui.get("longitude").setValue(data.longitude);
	                	nui.get("latitude").setValue(data.latitude);
	                }
                }
            });
        }
         //日期格式化
        var formatDate = function (date) {
		    var y = date.getFullYear();
		    return y ;
		};
		
        function SaveData() {
           //校验默认规则
	      var status = nui.get("status").getValue();
	      if(status=="2"){
		      if(!confirm("系统会将其他规则设置为非默认规则，确认保存为默认规则吗.")){
		        return;
		      }
	      }
	      if(form.validate()){ 
		      var ruletype = nui.get("ruletype");
	          var values = ruletype.getValue();
	          if(values==1){//固定位置
	          	 var address = nui.get("address").getValue();
	          	 if(!address){
	          	 	alert("考勤地址不能为空");
	             	return ;
	          	 }
	             var validrange = nui.get("validrange").getValue();
	             if(!validrange){
	             	alert("有效范围不能为空");
	             	return ;
	             }else{
	             	if(validrange<0){
	             	 alert("有效范围必须大于0");
	             	 return ;
	             	}
	             }
	         }else if(values==3){//项目组位置
	         	var validrange = nui.get("validrange").getValue();
	             if(!validrange){
	             	alert("有效范围不能为空");
	             	return ;
	             }else{
	             	if(validrange<0){
	             	 alert("有效范围必须大于0");
	             	 return ;
	             	}
	             }
	         }
	         var startTime = nui.get("starttime").getValue();
	         var endtime = nui.get("endtime").getValue();
	         var hours_st = startTime.getHours();
	         var hours_en = endtime.getHours();
	         if(hours_st==0){
	         	alert("考勤规则签到时间设置有误");
	         	return ;
	         }
	         if(hours_en==0){
	         	alert("考勤规则签退时间设置有误");
	         	return ;
	         }
          	 if(confirm("确认保存考勤规则信息？")){
	        	var ruleid = nui.get("ruleid").getValue();
	        	var saveURL = "";
				if(ruleid){
					saveURL = updateURL;
				} else{
					saveURL = addURL;
				}
				var o = form.getData();
				o.attendance.starttime =nui.get("starttime").getText();
				o.attendance.endtime =nui.get("endtime").getText();
	            var json = nui.encode(o);
	            nui.ajax({
	                url: saveURL,
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
			              	
			                  if(action == "ok" || action == "close"){
			                    
			                     
			                  }
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
            SaveData();
        }
        function onCancel(e) {
            CloseWindow("cancel");
        }
        
    </script>
</body>
</html>
