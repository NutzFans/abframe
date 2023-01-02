<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<%@ page import="commonj.sdo.DataObject"%>
<html>
<!-- 
  - Author(s): huangyq
  - Date: 2018-09-30 16:22:32
  - Description:
-->
<head>
<title>修改快捷菜单</title>
<%@include file="/common/skins/skin0/component.jsp" %>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div id="form1" method="post" >	
		<input id="operatorid" name="acopershortcut.acOperator.operatorid" class="nui-hidden"/> 
		<input id="appid" name="acopershortcut.appid" class="nui-hidden"/> 
		<input id="funcgroupid" name="acopershortcut.funcgroupid" class="nui-hidden"/> 
        <fieldset style="height:180px;width:370px;border:solid 1px #aaa;padding:3px;">
			<legend>快捷菜单录入</legend>
        	<div>
            	<table>
	        		<tr>
	                <td align="right">功能名称：</td>
	                <td>
						<input name="acopershortcut.funccode" id="funcname"  class="nui-buttonedit"  width="190"
							   onbuttonclick="selectFunction" allowInput="false" required="true"/>					 	    	   						                        
	                </td>
	                </tr>
	                <tr>
	                <td align="right">功能组名称：</td>
	                <td>
						<input name="acopershortcut.funcgroupname" id="funcgroupname"  class="nui-textbox"  width="190" allowInput="false"/>					 	    	   						                        
	                </td>
	                </tr>
	                <tr>
	                <td align="right">应用名称：</td>
	                <td>
						<input name="acopershortcut.appname" id="appname"  class="nui-textbox"  width="190" allowInput="false"/>					 	    	   						                        
	                </td>
	                </tr>
	                <tr>
	                <td align="right">排列顺序：</td>
	                <td>
						<input name="acopershortcut.orderno" id="orderno"  class="nui-textbox"  width="190"/>					 	    	   						                        
	                </td>
	                </tr>
	                <tr>
	                <td align="right">快捷菜单图片路径：</td>
	                <td>
						<input name="acopershortcut.imagepath" id="imagepath"  class="nui-textbox"  width="190"/>					 	    	   						                        
	                </td>
	                </tr>
				</table>
			</div>
		</fieldset>		
		<div style="text-align:center;padding:10px;">
			<a class="nui-button"onclick="onOk"style="width:60px;margin-right:20px;">保存</a>
			<a class="nui-button"onclick="onCancel"style="width:60px;">关闭</a>
		</div>
	</div> 
	<script type="text/javascript">		    	   	   
    	nui.parse(); 
    	
	   	
    	function saveData(){
		    var form = new nui.Form("form1");
		    form.validate();
		    var data = form.getData();
		    var json = nui.encode(data);
		    if(form.isValid()){
		    	nui.ajax({
			        url: "org.gocom.abframe.rights.menu.OpershortcutManager.newUpdateOpershortcut.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
			        success: function (o) {
			        	CloseWindow("saveSuccess");
				    }
			    });
		    }else{
		    	return;
		    }
		}
    	  
			//选择功能
			function selectFunction(){
				var btnEdit = this;
			    nui.open({
					url:"/default/abframe/rights/function/newFunctionExtendSelectMy.jsp",
					title: "选择列表",
					width: 600,
					height: 440,
					ondestroy: function (action) {
						if (action == "ok") {
							var iframe = this.getIFrameEl();
							var data = iframe.contentWindow.GetData();
							data = nui.clone(data);    //必须
							if (data) {
				                btnEdit.setValue(data.funccode);
				                btnEdit.setText(data.funcname);	
				                nui.get("appid").setValue(data.appid);	
				                nui.get("appname").setValue(data.appname);
				                nui.get("funcgroupid").setValue(data.funcgroupid);
				                nui.get("funcgroupname").setValue(data.funcgroupname);
							}
						}
					}
				});
			}
			//页面间传输json数据
			function setFormData(data){
				//跨页面传递的数据对象，克隆后才可以安全使用
	      		var infos = nui.clone(data);
	      		var json = infos.record;
	        	var form = new nui.Form("#form1");//将普通form转为nui的form
	        	form.setData(json);
	        	<%
	   				UserObject user1 = (UserObject) session.getAttribute("userObject");
	   				Map<String,Object> a = user1.getAttributes();
	   				String operatorid = (String)a.get("operatorid");
	   			%>
	   			var operatorid=<%=operatorid %>;
	   			nui.get("operatorid").setValue(operatorid);
	        	nui.get("funcname").setText(json.acopershortcut.funcname);
			}
		  //关闭窗口
		  function CloseWindow(action) {
		  	if (action == "close" && form.isChanged()) {
		    	if (confirm("数据被修改了，是否先保存？")) {
		        saveData();
		    	}
		    }
		    if (window.CloseOwnerWindow)
		    return window.CloseOwnerWindow(action);
		    else window.close();
		  }

          //确定保存或更新
          function onOk() {
            saveData();
          }

          //关闭
          function onCancel() {
            CloseWindow("cancel");
          }         
    </script>
</body>
</html>