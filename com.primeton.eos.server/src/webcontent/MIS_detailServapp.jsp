<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="java.util.Map"%>
<%@page import="commonj.sdo.DataObject"%>
<html>
<!-- 
  - Author(s): zhx
  - Date: 2015-07-09 14:52:20
  - Description:
-->
<head>
<title>应用详细信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script>
		$(function(){
			nui.context='/default'
		})
	</script>
    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    </style>
</head>
<body>
	<div class="nui-fit">
	 	<form id="form1" method="post" >
	        <input name="servapp.appid" id="appid" class="nui-hidden" />
	        <input class="nui-hidden" id="appid" value="1">
	        <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>应用基本信息</legend>
	            <div style="padding:15px;">
	            <table style="table-layout:fixed;" id="table_file">
	            	<span>
	                	<tr>
	                		<td style="width:150px;" align="right">应用中文名称：</td>
		                    <td style="width:250px;" id="servapp.appchname"></td>
		                    <td style="width:150px;" align="right">服务器IP：</td>
			                <td style="width:250px;" id="servapp.dyservip"></td>	 
		                	<td style="width:150px;" align="right">服务器名称：</td>
			                <td style="width:250px;" id="servapp.dyservname"></td>	                    	                    	
	                	</tr>
	            	</span>
	            	<span>
		                <tr>
		                    <td style="width:150px;" align="right">应用安装路径：</td>
		                    <td style="width:250px;" id="servapp.appinstallpath"></td>
		                    <td style="width:150px;" align="right">应用外网访问地址：</td>
		                    <td style="width:250px;" id="servapp.appaccessoutpath" ></td>
		                    <td style="width:150px;" align="right">应用内网访问地址：</td>
		                    <td style="width:250px;" id="servapp.appaccessinnerpath"></td>
		                </tr>
	                </span>
	                <span>
		                <tr>
		                    <td style="width:150px;" align="right">应用名：</td>
			                <td style="width:250px;" id="servapp.appname"></td>
		                	<td style="width:150px;" align="right">管理员用户名：</td>
		                    <td style="width:250px;" id="servapp.adminuser"></td>
		                    <td style="width:150px;" align="right" id=temp1>管理员密码：</td>
		                    <td style="width:250px;" id="servapp.adminpwd"></td>		                    
		                </tr>
	                </span>
	                <span>
		                <tr>
		                    <td style="width:150px;" align="right" id=temp2>GOVERNOR密码：</td>
		                    <td style="width:250px;" id="servapp.governorpwd"></td>
		                    <td style="width:150px;" align="right">是否有备份：</td>
		                    <td style="width:250px;" id="servapp.ishavebak"></td>
		                    <td style="width:150px;" align="right">应用端口号：</td>
		                    <td style="width:250px;" id="servapp.appport"></td>	                    
		                </tr>
	                </span>
	                <span>
		                <tr>
		                    <td style="width:150px;" align="right">备份机制：</td>
	                    	<td style="width:250px;" id="servapp.baktype"></td>
							<td style="width:150px;" align="right">备份文件存放路径：</td>
		                    <td style="width:250px;" id="servapp.appbakpath"></td>
		                    <td style="width:150px;" align="right">应用主要用途：</td>
		                    <td style="width:250px;" id="servapp.appuse"></td>	                    
		                </tr>
	                </span>         
	            </table>
	        </div>
	        </fieldset>
        </form>
		</div>
		<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
			<a class="nui-button" iconCls="icon-print" onclick="javascript:doPrint();" style="width:100px;margin-right:20px;">打印页面</a>
	    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
		</div> 
	    <script type="text/javascript">
	    	var form = new nui.Form("form1");
	    	var appid = getUrlParam("id");
			nui.parse();
			setData(appid);
			function getUrlParam(name) { 
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
				var r = window.location.search.substr(1).match(reg); 
				if (r != null) 
				return unescape(r[2]); 
				return null; 
			} 												  
			
	        function toggleFieldSet(ck, id) {
	            var dom = document.getElementById(id);
	            dom.className = !ck.checked ? "hideFieldset" : "";
	        }	        
	        function setData(appid){        	 
	        	var json = nui.encode({servapp:{appid: appid}});
	        	nui.ajax({
		            url: "com.primeton.eos.server.servercomponent.getServapp.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
		            success: function (o) {
		            	obj = nui.decode(o);
		                form.setData(obj);
		                form.setChanged(false);
		                document.getElementById("servapp.appchname").innerHTML = o.servapp.appchname;
		                document.getElementById("servapp.dyservname").innerHTML = o.servapp.dyservname;
		                document.getElementById("servapp.dyservip").innerHTML = o.servapp.dyservip;
		                document.getElementById("servapp.appuse").innerHTML = o.servapp.appuse == null ?"":o.servapp.appuse;
		                document.getElementById("servapp.appinstallpath").innerHTML = o.servapp.appinstallpath == null ?"":o.servapp.appinstallpath;
		                document.getElementById("servapp.appaccessoutpath").innerHTML = o.servapp.appaccessoutpath == null ?"":o.servapp.appaccessoutpath;
		                document.getElementById("servapp.appaccessinnerpath").innerHTML = o.servapp.appaccessinnerpath == null ?"":o.servapp.appaccessinnerpath;
		                document.getElementById("servapp.appname").innerHTML = o.servapp.appname == null ?"":o.servapp.appname;
		                document.getElementById("servapp.adminuser").innerHTML = o.servapp.adminuser == null ?"":o.servapp.adminuser;
		                document.getElementById("servapp.adminpwd").innerHTML = o.servapp.adminpwd == null ?"":o.servapp.adminpwd;
		                document.getElementById("servapp.governorpwd").innerHTML = o.servapp.governorpwd == null ?"":o.servapp.governorpwd;	                    
	                    document.getElementById("servapp.ishavebak").innerHTML = nui.getDictText('ABF_YESORNO',o.servapp.ishavebak);  
	                    document.getElementById("servapp.appport").innerHTML = o.servapp.appport == null ?"":o.servapp.appport;
	                	document.getElementById("servapp.baktype").innerHTML = nui.getDictText('MIS_BAKTYPE',o.servapp.baktype);
	                    document.getElementById("servapp.appbakpath").innerHTML = o.servapp.appbakpath == null ?"":o.servapp.appbakpath; 
	                   <%	UserObject user = (UserObject) session.getAttribute("userObject");
						Map attr = user.getAttributes();
						DataObject[] roles = (DataObject[]) attr.get("roles");
						Boolean isAppAdmin = false;
						for(int i=0;i<roles.length;i++){							
							if(roles[i].getString("roleid").equals("appadmin")){
								isAppAdmin = true;
							}
						}						 
				 		if(isAppAdmin == false){
						 %>		
						 		document.getElementById("servapp.governorpwd").innerHTML = "";
						 		document.getElementById("temp2").innerHTML = "";
						 		document.getElementById("servapp.adminpwd").innerHTML = "";
						 		document.getElementById("temp1").innerHTML = "";
						 		
				 		  <%}%>
			            }
		     });
		}		
		function doPrint(){
	    	document.getElementById("temp1").style.display = "none";
	    	window.print();
	    }
		
		function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();  
	    }
	    </script>
</body>
</html>