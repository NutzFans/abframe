<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): zhx
  - Date: 2015-07-10 10:46:31
  - Description:
-->
<head>
<title>新增/修改数据库</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div >
	<form id="form1" method="post" >
		<input name="servdb.dbid" id="dbid" class="nui-hidden" />		
        <fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
            <legend>数据库基本信息</legend>                       
            <div style="padding:5px;">
            <table style="table-layout:fixed;" id="table_file">
                <tr>
                    <td align="right">数据库名：</td>
                    <td>    
	                    <input name="servdb.dbname" id="dbname" class="nui-textbox" required="true"/>
	                </td>
	                <td align="right">服务器名称：</td>
                    <td>    
						<input property="editor" name="servdb.servid" id="dbservname" class="nui-buttonedit" onbuttonclick="showServer" showClose="false" required="true" allowInput="false"  />
                    </td>
                    <td align="right">数据库类型：</td>
                	<td>    
                        <input property="editor" name="servdb.dbtype" id="dbtype" class="nui-dictcombobox" dictTypeId="MIS_DBTYPE" required="true" allowInput="false" /> 
                    </td>
                </tr>
                <tr>
	                <td align="right"> 数据库版本号：</td>
                    <td>    
                        <input name="servdb.dbversion" id="dbversion" class="nui-textbox" required="false"/>
                    </td>
                
                    <td align="right">数据库安装路径：</td>
                    <td>    
                        <input name="servdb.dbinstallpath" id="dbinstallpath" class="nui-textbox" required="false"/>
                    </td>                   
               	 	<td  align="right">数据库端口号：</td>
	                 <td > 
	                 	<input name="servdb.dbport" id="dbport" class="nui-textbox" required="true" />	                   
	                </td>
                 </tr>                             
                 <tr>
                    <td align="right">数据库用户名：</td>
                    <td>    
                        <input name="servdb.dbuser" id="dbuser" class="nui-textbox" required="false"/>
                    </td>
                    <td align="right">数据库密码：</td>
                    <td>    
                        <input name="servdb.dbpassword" id="dbpassword" class="nui-textbox" required="false"/>
                    </td>
                    <td  align="right">数据库主要用途：</td>
                    <td>    
                        <input name="servdb.dbuse" id="dbuse" class="nui-textbox" required="false"/>
                    </td>
       			 </tr>
                 <tr>  
                	<td align="right">是否自动备份：</td>
                	<td>    
                        <input property="editor" name="servdb.isautobak" id="isautobak" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" required="true" allowInput="false" /> 
                    </td>
                	<td align="right">备份机制</td>
                    <td >
                    	<input property="editor" name="servdb.baktype" id="baktype" class="nui-dictcombobox" dictTypeId="MIS_BAKTYPE" required="true" allowInput="false" />
                    </td>	
	                <td align="right">备份存放路径：</td>
                    <td>    
                        <input name="servdb.dbbakpath" id="dbbakpath" class="nui-textbox"  />
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
        var updateURL = "com.primeton.eos.server.servercomponent.updateServdb.biz.ext";
    	var addURL = "com.primeton.eos.server.servercomponent.addServdb.biz.ext";
    	var saveURL = "";        
        nui.parse();
	    function SetData(data){
	    	data = nui.clone(data);
	    	if(data.action == "edit"){
    		var json = nui.encode({servdb:data});        			        		
        	nui.ajax({
        		url: "com.primeton.eos.server.servercomponent.getServdb.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                	nui.parse();
                    var temp1=nui.get("dbservname");
                    temp1.setValue(o.servdb.servid);
                    temp1.setText(o.servdb.dbservname);
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
        	var dbid = nui.get("dbid").getValue();
        	var saveURL = "";
			if(dbid){
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
				nui.get("dbservname").validate();
			}
		});
	}
        
    </script>
</body>
</html>