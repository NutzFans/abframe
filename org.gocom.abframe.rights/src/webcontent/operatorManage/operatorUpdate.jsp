<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<%@ page import="commonj.sdo.DataObject"%>
<html>
<!-- 
  - Author(s): huangyq
  - Date: 2018-09-28 09:52:24
  - Description:
-->
<head>
<title>修改操作员</title>
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
		<input id="operatorid" name="acoperator.operatorid" class="nui-hidden"/>   
        <fieldset style="height:250px;width:470px;border:solid 1px #aaa;padding:3px;">
			<legend>操作员信息</legend>
        	<div>
            	<table>
            		<tr>
	                <td align="right">登录用户名：</td>
	                <td>
						<input name="acoperator.userid" id="userid"  class="nui-textbox"  required="true" />					 	    	   						                        
	                </td>
	                <td align="right">菜单风格：</td>
	                <td >    
	                   <input name="acoperator.menutype" id="menutype" class="nui-dictcombobox" dictTypeId="ABF_SKINLAYOUT" value="default" />
	                </td>
	                </tr>
	                <tr>
	                   <td align="right">用户密码：</td>
	                    <td>
							<input name="acoperator.password" id="password"  class="nui-password"  required="true" />					 	    	   						                        
	                    </td>
	                    <td align="right">操作员状态：</td>
	                    <td >    
	                       <input name="acoperator.status" id="status" class="nui-dictcombobox" dictTypeId="ABF_OPERSTATUS" value="running" />
	                    </td>
	                 </tr>
	                 <tr>
	                   <td align="right">操作员名称：</td>
	                    <td>
							<input name="acoperator.operatorname" id="operatorname"  class="nui-textbox"  required="true" />					 	    	   						                        
	                    </td>
	                    <td align="right">认证模式：</td>
	                    <td >    
	                       <input name="acoperator.authmode" id="authmode" class="nui-dictcombobox" dictTypeId="ABF_AUTHMODE" value="local" />
	                    </td>
	                 </tr>
	                 <tr>
	                    <td align="right">IP地址：</td>
	                    <td >    
	                       <input name="acoperator.ipaddress"class="nui-textbox"  />
	                    </td>
	                    <td align="right">密码失效日期：</td> 
	                    <td>
	                    	<input name="acoperator.invaldate" class="nui-datepicker" id="invaldate" />
              			</td>
	                 </tr>
	                 <tr>
	                    <td align="right">有效开始日期：</td>
						<td>
							<input name="acoperator.startdate" class="nui-datepicker" id="startdate" />
						</td>
						<td align="right">有效截止日期：</td>
						<td>
							<input name="acoperator.enddate" class="nui-datepicker" id="enddate" />
						</td>	                    
	                 </tr> 
				</table>
			</div>
		</fieldset>		
		<div style="text-align:center;padding:10px;">
			<a class="nui-button"onclick="onOk" id="savebutton" style="width:60px;margin-right:20px;">保存</a>
			<a class="nui-button"onclick="onCancel"style="width:60px;">关闭</a>
		</div>
	</div> 
	<script type="text/javascript">		    	   	   
    	nui.parse(); 
    	var operatorid = <%=request.getParameter("operatorid") %>;
    	nui.get("operatorid").setValue(operatorid);
    	
    	function saveData(){
		    var form = new nui.Form("form1");
		    form.validate();
		    var data = form.getData();
		    var json = nui.encode(data);
		    if(form.isValid()){
		    	nui.ajax({
			        url: "org.gocom.abframe.rights.OperatorManager.updateAcOperator.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
			        success: function (o) {
			        	if(o.reCode == "0"){
			        		nui.get("savebutton").enable();
			        	}else{
			        		CloseWindow("saveSuccess");
			        	}
				    }
			    });
		    }else{
		    	return;
		    }
		}
		//页面间传输json数据
		function setFormData(data){
	    	//跨页面传递的数据对象，克隆后才可以安全使用
	      	var infos = nui.clone(data);
	      	var json = infos.record;
	        var form = new nui.Form("#form1");//将普通form转为nui的form
	        form.setData(json);
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
          	if(!confirm("是否保存？")){
				return;
			}else{
				nui.get("savebutton").disable();
    			saveData();
			}
          }

          //关闭
          function onCancel() {
            CloseWindow("cancel");
          }         
    </script>
</body>
</html>