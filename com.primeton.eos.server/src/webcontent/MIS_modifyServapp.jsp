<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): zhx
  - Date: 2015-07-08 16:17:56
  - Description:
-->
<head>
<title>新增\修改应用</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div >
	<form id="form1" method="post" >
		<input name="servapp.appid" id="appid" class="nui-hidden" />		
        <fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
            <legend>应用基本信息</legend>                       
            <div style="padding:5px;">
            <table style="table-layout:fixed;" id="table_file">
                <tr>
                    <td align="right">应用中文名称：</td>
                    <td>    
	                    <input name="servapp.appchname" id="appchname" class="nui-textbox" required="true"/>
	                </td>
	                <td align="right">服务器名称：</td>
                    <td>    
						<input property="editor" name="servapp.servid" id="dyservname" class="nui-buttonedit" onbuttonclick="showServer" showClose="false" required="true" allowInput="false"  />
                    </td>
	                <td align="right">应用主要用途：</td>
                    <td>    
                        <input name="servapp.appuse" id="appuse" class="nui-textbox" required="false"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">应用安装路径：</td>
                    <td>    
                        <input name="servapp.appinstallpath" id="appinstallpath" class="nui-textbox" required="false"/>
                    </td>                   
               	 	<td  align="right">应用外网访问地址：</td>
	                 <td > 
	                 	<input name="servapp.appaccessoutpath" id="appaccessoutpath" class="nui-textbox" required="true" />	                   
	                </td>
                    <td align="right">应用内网访问地址：</td>
                    <td>    
                        <input name="servapp.appaccessinnerpath" id="appaccessinnerpath" class="nui-textbox" required="false"/>
                    </td>
                 </tr>
                                              
                <tr>
                    <td align="right">应用名：</td>
                    <td>    
                        <input name="servapp.appname" id="appname" class="nui-textbox" required="false"/>
                    </td>
                    <td  align="right">管理员用户名：</td>
                    <td>    
                        <input name="servapp.adminuser" id="adminuser" class="nui-textbox" required="false"/>
                    </td>
                    <td align="right">管理员密码：</td>
                    <td>    
                        <input name="servapp.adminpwd" id="adminpwd" class="nui-textbox" required="false"/>
                    </td>                  
                </tr>
                <tr>               	
                    <td align="right">GOVERNOR密码：</td>
                    <td>    
                        <input name="servapp.governorpwd" id="governorpwd" class="nui-textbox" required="false"/>
                    </td>                   
                	<td align="right">是否有备份：</td>
                	<td>    
                        <input property="editor" name="servapp.ishavebak" id="ishavebak" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" required="true" allowInput="false" /> 
                    </td>
                    <td align="right">应用端口号：</td>
                    <td>    
                        <input name="servapp.appport" id="appport" class="nui-textbox" required="false"/>
                    </td> 
                </tr>
                <tr>  
                	<td align="right">备份机制</td>
                    <td >
                    	<input property="editor" name="servapp.baktype" id="baktype" class="nui-dictcombobox" dictTypeId="MIS_BAKTYPE" required="true" allowInput="false" />
                    </td>	
	                <td align="right">备份文件存放路径：</td>
                    <td>    
                        <input name="servapp.appbakpath" id="appbakpath" class="nui-textbox"  />
                    </td>
				</tr>
            </table>
        	</div>
        </fieldset>
    </form>        
</div>
<div style="text-align:center;padding:10px; class="nui-toolbar">               
    <a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
    <a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">取消</a>
</div>
<script type="text/javascript">
	  	var form = new nui.Form("form1");
        var updateURL = "com.primeton.eos.server.servercomponent.updateServapp.biz.ext";
    	var addURL = "com.primeton.eos.server.servercomponent.addServapp.biz.ext";
    	var saveURL = "";        
        nui.parse();
	    function SetData(data){
	    	data = nui.clone(data);
	    	if(data.action == "edit"){
    		var json = nui.encode({servapp:data});        			        		
        	nui.ajax({
        		url: "com.primeton.eos.server.servercomponent.getServapp.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                	nui.parse();
                    var temp1=nui.get("dyservname");
                    temp1.setValue(o.servapp.servid);
                    temp1.setText(o.servapp.dyservname);
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
            if(form.validate()){                         
        	var appid = nui.get("appid").getValue();
        	var saveURL = "";
			if(appid){
				saveURL = updateURL;
			} else{
				saveURL = addURL;
			}
			var o = form.getData();
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
		                    //CloseWindow("saveFailed");
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
        function showServer(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/server/MIS_selectServer.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.servid);
		                btnEdit.setText(data.servname);       		                
					}
				}
				nui.get("dyservname").validate();
			}
		});
	}
        
    </script>
</body>
</html>