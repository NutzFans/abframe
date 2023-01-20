<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<%@page import="java.util.Map"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<html>
<!-- 
  - Author(s): zhx
  - Date: 2015-07-10 11:36:58
  - Description:
-->
<head>
<title>数据库详细信息</title>
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
	        <input name="servdb.dbid" id="dbid" class="nui-hidden" />
	        <input class="nui-hidden" id="dbid" value="1">
	        <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>数据库基本信息</legend>
	            <div style="padding:15px;">
	            <table style="table-layout:fixed;" id="table_file">
	            	<span>
	                	<tr>
	                		<td style="width:150px;" align="right">数据库名：</td>
		                    <td style="width:250px;" id="servdb.dbname"></td>
		                    <td style="width:150px;" align="right">服务器IP：</td>
			                <td style="width:250px;" id="servdb.dbservip"></td>
		                	<td style="width:150px;" align="right">服务器名称：</td>
		                	<td style="width:250px;" id="servdb.dbservname"></td>			                
	                	</tr>
	            	</span>
	            	<span>
		                <tr>       		                    	
	                    	<td style="width:150px;" align="right">数据库类型：</td>
		                    <td style="width:250px;" id="servdb.dbtype"></td>
		                    <td style="width:150px;" align="right">数据库安装路径：</td>
		                    <td style="width:250px;" id="servdb.dbinstallpath"></td>
		                    <td style="width:150px;" align="right">数据库版本号：</td>	
		                    <td style="width:250px;" id="servdb.dbversion" ></td>	                    
		                </tr>
	                </span>
	                <span>
		                <tr>		                	
		                    <td style="width:150px;" align="right">数据库端口号：</td>
		                    <td style="width:250px;" id="servdb.dbport"></td>
		                    <td style="width:150px;" align="right">数据库用户名：</td>
			                <td style="width:250px;" id="servdb.dbuser"></td>
		                	<td style="width:150px;" align="right" id=temp1>数据库密码：</td>
		                    <td style="width:250px;" id="servdb.dbpassword"></td>		                                        
		                </tr>
	                </span>
	                <span>
		                <tr>
		                    <td style="width:150px;" align="right">是否自动备份：</td>
		                    <td style="width:250px;" id="servdb.isautobak"></td>
		                    <td style="width:150px;" align="right">备份机制：</td>
	                    	<td style="width:250px;" id="servdb.baktype"></td>
							<td style="width:150px;" align="right">备份存放路径：</td>
		                    <td style="width:250px;" id="servdb.dbbakpath"></td>	                    
		                </tr>
	                </span>
	                <span>
	                	<tr>
	                		<td style="width:150px;" align="right">数据库主要用途：</td>
		                    <td style="width:250px;" id="servdb.dbuse"></td>		
	                	</tr>
	                </spam>         
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
	    	var dbid = getUrlParam("id");
			nui.parse();
			setData(dbid);
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
	        	var json = nui.encode({servdb:{dbid: dbid}});
	        	nui.ajax({
		            url: "com.primeton.eos.server.servercomponent.getServdb.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
		            success: function (o) {
		            	obj = nui.decode(o);
		                form.setData(obj);
		                form.setChanged(false);
		                document.getElementById("servdb.dbname").innerHTML = o.servdb.dbname;
		                document.getElementById("servdb.dbservname").innerHTML = o.servdb.dbservname;
		                document.getElementById("servdb.dbservip").innerHTML = o.servdb.dbservip;
		                document.getElementById("servdb.dbtype").innerHTML = nui.getDictText('MIS_DBTYPE',o.servdb.dbtype); 
		                document.getElementById("servdb.dbversion").innerHTML = o.servdb.dbversion == null ?"":o.servdb.dbversion;
		                document.getElementById("servdb.dbinstallpath").innerHTML = o.servdb.dbinstallpath == null ?"":o.servdb.dbinstallpath;
		                document.getElementById("servdb.dbport").innerHTML = o.servdb.dbport == null ?"":o.servdb.dbport;
		                document.getElementById("servdb.dbuser").innerHTML = o.servdb.dbuser == null ?"":o.servdb.dbuser;
		                document.getElementById("servdb.dbpassword").innerHTML = o.servdb.dbpassword == null ?"":o.servdb.dbpassword;
		                document.getElementById("servdb.dbuse").innerHTML = o.servdb.dbuse == null ?"":o.servdb.dbuse;	                    
	                    document.getElementById("servdb.isautobak").innerHTML = nui.getDictText('ABF_YESORNO',o.servdb.isautobak);  
	                	document.getElementById("servdb.baktype").innerHTML = nui.getDictText('MIS_BAKTYPE',o.servdb.baktype);
	                    document.getElementById("servdb.dbbakpath").innerHTML = o.servdb.dbbakpath == null ?"":o.servdb.dbbakpath;
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
						 		document.getElementById("servdb.dbpassword").innerHTML = "";
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