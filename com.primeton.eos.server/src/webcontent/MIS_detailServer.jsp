<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): zhx
  - Date: 2015-07-06 16:37:40
  - Description:
-->
<head>
<title>服务器详细信息</title>
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
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div class="nui-fit">
	 	<form id="form1" method="post" >
	        <input name="server.servid" id="servid" class="nui-hidden" />
	        <input class="nui-hidden" id="servid" value="1">
	        <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>服务器基本信息</legend>
	            <div style="padding:15px;">
	            <table style="table-layout:fixed;" id="table_file">
	            	<span>
	                	<tr>
		                	<td style="width:150px;" align="right">服务器名称：</td>
			                <td style="width:250px;" id="server.servname"></td>
	                    	<td style="width:150px;" align="right">服务器IP：</td>
		                    <td style="width:250px;" id="server.servip"></td>
	                    	<td style="width:150px;" align="right">服务器主要用途：</td>
		                    <td style="width:250px;" id="server.servuse"></td>
	                	</tr>
	            	</span>
	            	<span>
		                <tr>
		                    <td style="width:150px;" align="right">服务器用途描述：</td>
		                    <td style="width:250px;" id="server.servusecomm"></td>
		                    <td style="width:150px;" align="right">服务器类型：</td>
		                    <td style="width:250px;" id="server.servtype" ></td>
		                    <td style="width:150px;" align="right">服务器MAC地址：</td>
		                    <td style="width:250px;" id="server.servmacid"></td>
		                </tr>
	                </span>
	                <span>
		                <tr>
		                    <td style="width:150px;" align="right">服务器内存(GB)：</td>
			                <td style="width:250px;" id="server.servmemory"></td>
		                	<td style="width:150px;" align="right">服务器CPU(个)：</td>
		                    <td style="width:250px;" id="server.servcpu"></td>
		                    <td style="width:150px;" align="right">服务器硬盘(GB)：</td>
		                    <td style="width:250px;" id="server.servhardware"></td>		                    
		                </tr>
	                </span>
	                <span>
		                <tr>
		                    <td style="width:150px;" align="right">服务器操作系统：</td>
		                    <td style="width:250px;" id="server.servos"></td>
		                    <td style="width:150px;" align="right" id=temp1>对应资产编号：</td>
		                    <td style="width:250px;" id="server.assetnum"></td>
		                    <td style="width:150px;" align="right" id=temp2>对应实体服务器：</td>
		                    <td style="width:250px;" id="server.exserver"></td>	                    
		                </tr>
	                </span>
	                <span>
		                <tr>
		                    <td style="width:150px;" align="right" id=temp3>机柜号：</td>
	                    	<td style="width:250px;" id="server.cabinet"></td>
							<td style="width:150px;" align="right">服务器负责人：</td>
		                    <td style="width:250px;" id="server.servusername"></td>
		                    <td style="width:150px;" align="right">录入人：</td>
	                   		<td style="width:250px;" id="server.insertuser"></td>	                    
		                </tr>
	                </span>
	                <span>
		                <tr>
	                    	<td style="width:150px;"  align="right">录入日期：</td>
		                    <td style="width:250px;" id="server.insertdate"></td>
		                    <td style="width:150px;" align="right">备注：</td>
		                	<td style="width:250px;" id="server.remark"></td>
		                    <td style="width:150px;" align="right">最后修改人：</td>
		                    <td style="width:250px;" id="server.lastmoduser"></td>
		                </tr>
	                </span> 
	                <span>
		                <tr>
		                    <td style="width:150px;" align="right">最后修改日期：</td>
		                    <td style="width:250px;" id="server.lastmoddate"></td>
		                </tr>
	               </span>                   
	            </table>
	        </div>
	        </fieldset>
	       <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>服务器登录用户信息</legend>
	            <div id="grid_0" class="nui-datagrid" style="width:100%;height:150px;" showPager="false" sortMode="client" dataField="server.misServuserinfos">
	            <div property="columns">
	              <div field="servname" width="40px">
	               	服务器登录用户名
	              </div>
	              <div name="servpassword" field="servpassword" width="50px">
	               	服务器登录密码               
	              </div>
	              <div field="remark" width="100px">
	               	备注               
	              </div>
	            </div>
	          </div>
	        </fieldset>
	         <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>服务器应用信息</legend>
	            <div id="grid_1" class="nui-datagrid" style="width:100%;height:150px;" showPager="false" sortMode="client"dataField="server.misServapps">
	            <div property="columns">
	              <div field="appchname" width="140px">
	               	应用中文名称
	              </div>  
	              <div field="appinstallpath" width="150px">
	               	应用安装路径              
	              </div>
	              <div field="appaccessoutpath" width="120px">
	               	应用外网访问地址	                
	              </div>
	              <div field="appaccessinnerpath" width="250px">
	               	应用内网访问地址
	              </div>
	              <div field="appport" width="60px">
	               	应用端口号
	              </div>
	              <div field="appname" width="60px">
	               	应用名
	              </div>
	              <div name="governorpwd" field="governorpwd" width="80px">
	               	GOVERNOR密码
	              </div>
	              <div field="adminuser" width="80px">
	               	管理员用户名
	              </div>
	              <div name="adminpwd" field="adminpwd" width="60px">
	               	管理员密码
	              </div>
	              <div field="ishavebak" width="60px" renderer="getIshavebak">
	               	是否有备份
	              </div>
	              <div field="appbakpath" width="80px">
	               	备份文件存放路径
	              </div>
	              <div field="baktype" width="80px" renderer="getBaktype">
	               	备份机制
	              </div>
	              <div field="appuse" width="60px">
	               	应用主要用途             
	              </div>
	            </div>
	          </div>
	        </fieldset>
	        <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>服务器数据库信息</legend>
	            <div id="grid_2" class="nui-datagrid" style="width:100%;height:150px;" showPager="false" sortMode="client"dataField="server.misServdbs">
	            <div property="columns">
	               <div field="dbtype" width="60px" renderer="getDbtype">
	               	数据库类型
	               </div>
	               <div field="dbversion" width="60px">
	              	 数据库版本号
	               </div>
	               <div field="dbinstallpath" width="80px">
	               	数据库安装路径
	               </div>
	               <div field="dbport" width="80px">
	               	数据库端口号
	               </div>
	               <div field="dbname" width="80px">
	               	数据库名
	               </div>
	               <div field="dbuser" width="80px">
	               	数据库用户名
	               </div>
	               <div name="dbpassword" field="dbpassword" width="80px">
	               	数据库密码
	               </div>
	               <div name=dbuse field="dbuse" width="80px">
	               	数据库主要用途
	               </div>
	               <div field="isautobak" width="80px" renderer="getIsautobak">
	               	是否自动备份
	               </div>
	               <div field="dbbakpath" width="80px">
	               	备份存放路径
	               </div>
	               <div field="baktype" width="80px" renderer="getBaktype">
	               	备份机制
	               </div>            
	            </div>
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
	    	var servid = getUrlParam("id");
			nui.parse();
			setData(servid);
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
	        function setData(servid){
	        	var json = nui.encode({server:{servid: servid}});
	        	nui.ajax({
		            url: "com.primeton.eos.server.servercomponent.getServer.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
		            success: function (o) {
		            	obj = nui.decode(o);
		                form.setData(obj);
		                form.setChanged(false);
		                document.getElementById("server.servname").innerHTML = o.server.servname;
		                document.getElementById("server.servtype").innerHTML = nui.getDictText('MIS_SERVTYPE',o.server.servtype);
		                document.getElementById("server.servip").innerHTML = o.server.servip;
		                document.getElementById("server.servuse").innerHTML = o.server.servuse;
		                document.getElementById("server.servusecomm").innerHTML = o.server.servusecomm == null ?"":o.server.servusecomm;
		                document.getElementById("server.servmacid").innerHTML = o.server.servmacid == null ?"":o.server.servmacid;
		                document.getElementById("server.servmemory").innerHTML = o.server.servmemory == null ?"":o.server.servmemory;
		                document.getElementById("server.servcpu").innerHTML = o.server.servcpu == null ?"":o.server.servcpu;
		                document.getElementById("server.servhardware").innerHTML = o.server.servhardware == null ?"":o.server.servhardware;
		                document.getElementById("server.servos").innerHTML = o.server.servos;
	                    document.getElementById("server.assetnum").innerHTML = o.server.assetnum == null ?"":o.server.assetnum;
	                    document.getElementById("temp1").innerHTML = o.server.assetnum == null ?"":"对应资产编号：";  
	                    document.getElementById("server.exserver").innerHTML = o.server.exserver == null ?"":o.server.exserver;
	                    document.getElementById("temp2").innerHTML = o.server.exserver == null ?"":"对应实体服务器："; 
	                    document.getElementById("server.cabinet").innerHTML = o.server.cabinet == null ?"":o.server.cabinet;
	                    document.getElementById("temp3").innerHTML = o.server.cabinet == null ?"":"机柜号：";
	                    document.getElementById("server.servusername").innerHTML = o.server.servusername == null ?"":o.server.servusername; 
	                    document.getElementById("server.insertuser").innerHTML = o.server.insertuser;
	                    document.getElementById("server.insertdate").innerHTML = o.server.insertdate;
	                    document.getElementById("server.remark").innerHTML = o.server.remark == null ?"":o.server.remark;
	                    document.getElementById("server.lastmoduser").innerHTML = o.server.lastmoduser == null ?"":o.server.lastmoduser;
	                    document.getElementById("server.lastmoddate").innerHTML = o.server.lastmoddate == null ?"":o.server.lastmoddate;	                    
	                    nui.get("grid_0").setData(o.server.misServuserinfos);
	                    <%	UserObject user = (UserObject) session.getAttribute("userObject");
						Map attr = user.getAttributes();
						DataObject[] roles = (DataObject[]) attr.get("roles");
						Boolean isServAdmin = false;
						Boolean isAppAdmin = false;
						Boolean isDbAdmin = false;
						for(int i=0;i<roles.length;i++){
							if(roles[i].getString("roleid").equals("servAdmin")){
								isServAdmin = true;
							}
							if(roles[i].getString("roleid").equals("appadmin")){
								isAppAdmin = true;
							}
							if(roles[i].getString("roleid").equals("dbAdmin")){
								isDbAdmin = true;
							}
						}						
						 if(isServAdmin == false){
						 %>		
						 		nui.get("grid_0").hideColumn("servpassword");
				 		  <%}
				 		if(isAppAdmin == false){
						 %>		
						 		nui.get("grid_1").hideColumn("governorpwd");
						 		nui.get("grid_1").hideColumn("adminpwd");
				 		  <%}
				 		   if(isDbAdmin == false){
						 %>		
						 		nui.get("grid_2").hideColumn("dbpassword");					 		
				 		  <%}%>			 		
	                    nui.get("grid_1").setData(o.server.misServapps);
	                    nui.get("grid_2").setData(o.server.misServdbs); 
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
      	function getIshavebak(e){
	  		return nui.getDictText('ABF_YESORNO',e.value);//设置业务字典值
	  	}
	   	function getIsautobak(e){
	  		return nui.getDictText('ABF_YESORNO',e.value);//设置业务字典值
	  	}
	  	function getBaktype(e){
	  		return nui.getDictText('MIS_BAKTYPE',e.value);//设置业务字典值
	  	}
	  	function getDbtype(e){
	  		return nui.getDictText('MIS_DBTYPE',e.value);//设置业务字典值
	  	}
	    </script>
</body>
</html>