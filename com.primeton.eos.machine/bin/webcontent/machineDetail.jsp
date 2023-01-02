<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2014-09-23 17:01:53
  - Description:
-->
<head>
	<title>机器详细信息</title>
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
	<!--<script src="../common/nui/nui.js" type="text/javascript"></script>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
    	fieldset
    	{
        	border:solid 1px #aaa;
    	}        
    	.hideFieldset
    	{
        	border-left:0;
        	border-right:0;
        	border-bottom:0;
    	}
    	.hideFieldset .fieldset-body
    	{
        	display:none;
    	}
    	html, body
		    {
		        font-size:12px;
		        padding:0;
		        margin:0;
		        border:0;
		        height:100%;
		        overflow:hidden;
		    }
    </style>-->
	<%--<%@include file="/common/skins/skin0/component.jsp" %>--%>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div class="nui-fit">
    <form id="form1" method="post" >
        <input name="machine.id" id="machineId" class="nui-hidden" />
        <input class="nui-hidden" id="id" value="1" />
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>机器基本信息</legend>
            <div style="padding:5px;">
            <table style="table-layout:fixed;" id="table_file">
            	<tr>
                	<td style="width:150px;" align="right">资产类型：</td>
	                <td style="width:250px;" id="machine.type"></td>
                	<td style="width:150px;" align="right">用途：</td>
                    <td style="width:250px;" id="machine.using"></td>
                	<td style="width:150px;" align="right">配置：</td>
                    <td style="width:250px;" id="machine.configuration"></td>
            	</tr>
                <tr>
	                <td style="width:150px;" align="right">资产子类：</td>
	                <td style="width:250px;" id="machine.secType"></td>
                    <td style="width:150px;" align="right">品牌：</td>
                    <td style="width:250px;" id="machine.brand"></td>
                    <td style="width:150px;" align="right">型号：</td>
                    <td style="width:250px;" id="machine.model"></td>
                </tr>
                <tr>
                    <td style="width:150px;" align="right">管理类型：</td>
                    <td style="width:250px;" id="machine.storageType"></td>
                	<td style="width:150px;" align="right">区域：</td>
                    <td style="width:250px;" id="machine.area"></td>
                    <td style="width:150px;" align="right">状态：</td>
                    <td style="width:250px;" id="machine.status"></td>
                </tr>
                <tr>
                    <td style="width:150px;" align="right">操作系统：</td>
                    <td style="width:250px;" id="machine.operatingSystem"></td>
                    <td style="width:150px;" align="right">负责人：</td>
                    <td style="width:250px;" id="machine.usingemp"></td>
                    <td style="width:150px;" align="right">增加人：</td>
                    <td style="width:250px;" id="machine.operator"></td>
                </tr>
                <tr>
                    <td style="width:150px;" align="right">购买时间：</td>
                	<td style="width:250px;" id="machine.buytime"></td>
					<td style="width:150px;" align="right">所属部门：</td>
                    <td style="width:250px;" id="machine.dept"></td>
                    <td style="width:150px;" align="right">发票类型：</td>
               		<td style="width:250px;" id="machine.invoiceType"></td>	                    
                </tr>
                <tr>
                	<td style="width:150px;" id="third11" align="right">增加时间：</td>
                    <td style="width:250px;" id="machine.operatingTime"></td>
                    <td style="width:150px;" align="right">购买金额：</td>
                	<td style="width:250px;" id="machine.price"></td>
                    <td style="width:150px;" align="right">保修时间(月)：</td>
                    <td style="width:250px;" id="machine.warrantyTime"></td>
                </tr>
            	<tr>
                    <td style="width:150px;" align="right">资产分类：</td>
                    <td style="width:250px;" id="machine.isguoteng"></td>
        			<td style="width:150px;" align="right">存放物理地址：</td>
                    <td style="width:250px;" id="machine.address"></td>
                    <td style="width:150px;" align="right">资产领取日期：</td>
                    <td style="width:250px;" id="machine.startusedate"></td>
            	</tr>
            	<tr id="showProject" style="display:none;">
            		<td style="width:150px;" align="right">所属项目：</td>
                    <td style="width:250px;" id="machine.projectno"></td>
        			<td style="width:150px;" align="right">项目名称：</td>
                    <td style="width:250px;" id="machine.projectName"></td>
            	</tr>
                <tr>
					<td style="width:150px;" align="right">备注：</td>
                    <td style="width:400px;" colspan="5" id="machine.remarks"></td>	                	
                </tr>
                <tr>
                	<td style="width:150px;" id="third21" align="right">发票照片：</td>
                	<td style="width:1000px;" id="uploadedFile" colspan="5"></td>
                </tr>
            </table>
        </div>
        </fieldset>
       
       <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>机器使用信息</legend>
            <div style="padding:5px;">
	            <table style="table-layout:fixed;" id="table_file">
		            <span>
		                <tr>
		                    <td style="width:150px;" align="right">IP地址：</td>
		                    <td style="width:250px;" id="machine.ip"></td>
		                    <td style="width:150px;" align="right">用户名：</td>
		                    <td style="width:250px;" id="machine.username"></td>
			                <td style="width:150px;" align="right">密码：</td>
			                <td style="width:250px;" id="machine.password"></td>
		                </tr>
		           	</span>
		           	<span>
		                <tr>
		                	<td style="width:150px;" align="right">安装应用软件：</td>
			                <td style="width:1000px;" id="machine.application" colspan="5"></td>
		                </tr>
		            </span>
	            </table>
        	</div>
        </fieldset>
        
         <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>机器折旧信息</legend>
            <div style="padding:5px;">
	            <table style="table-layout:fixed;" id="table_file">
		            <span>
		                <tr>
		                    <td style="width:150px;" align="right">资产编号：</td>
		                    <td style="width:250px;" id="machine.assetnum"></td>
		                    <td style="width:150px;" align="right">资产原值：</td>
		                    <td style="width:250px;" id="machine.assetAmount"></td>
		                    <td style="width:150px;" align="right">折旧期限(月)：</td>
		                    <td style="width:250px;" id="machine.depreciableTime"></td>
		                </tr>
		           	</span>
		           	<span>
		                <tr>
			                <td style="width:150px;" align="right">月折旧额：</td>
			                <td style="width:250px;" id="machine.depreciableAmount"></td>
			                <td style="width:150px;" align="right">资产净值：</td>
			                <td style="width:250px;" id="machine.net"></td>
			                <td style="width:150px;" align="right">已累计折旧金额：</td>
			                <td style="width:250px;" id="machine.hasdepreciableAmount"></td>
		                </tr>
		            </span>
	            </table>
        	</div>
        </fieldset>
        
         <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>机器报废信息</legend>
            <div style="padding:5px;">
            <table style="table-layout:fixed;" id="table_file">
	            <span>
	                <tr>
	                    <td style="width:150px;" align="right">报废时间：</td>
	                    <td style="width:250px;" id="machine.scrapTime"></td>
	                    <td style="width:150px;" align="right">报废操作人员：</td>
	                    <td style="width:250px;" id="machine.scrapOperator"></td>
		                <td style="width:150px;" align="right">报废原因：</td>
		                <td style="width:250px;" id="machine.scrapComment"></td>
	                </tr>
	            <span>
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
    	var id = getUrlParam("id");
    	var assetnum = getUrlParam("assetnum");
		nui.parse();
		setData(id);
		
		function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		} 
		
		function init(){
		}
		
        function toggleFieldSet(ck, id) {
            var dom = document.getElementById(id);
            dom.className = !ck.checked ? "hideFieldset" : "";
        }
        
        function setData(id){
			var json = nui.encode({machine:{id: id,assetnum:assetnum}});
        	nui.ajax({
	            url: "com.primeton.eos.machine.machine.getDetail.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	                form.setData(o);
	                form.setChanged(false);
	                document.getElementById("machine.startusedate").innerHTML = o.machine.startusedate;
	                document.getElementById("machine.buytime").innerHTML = o.machine.buytime;
	                document.getElementById("machine.price").innerHTML = o.machine.price;
	                document.getElementById("machine.type").innerHTML = nui.getDictText('MIS_MA_TYPE',o.machine.type);
	                document.getElementById("machine.secType").innerHTML = nui.getDictText('MIS_MA_SECTYPE',o.machine.secType);
	                document.getElementById("machine.brand").innerHTML = o.machine.brand == null ?"":o.machine.brand;
	                document.getElementById("machine.model").innerHTML = o.machine.model == null ?"":o.machine.model;
	                document.getElementById("machine.configuration").innerHTML = o.machine.configuration == null ?"":o.machine.configuration;
	                document.getElementById("machine.operatingSystem").innerHTML =o.machine.operatingSystem == null ?"":o.machine.configuration;
	                document.getElementById("machine.address").innerHTML = o.machine.address == null ?"":o.machine.address;
	                document.getElementById("machine.storageType").innerHTML = nui.getDictText('MIS_MA_STORAGE',o.machine.storageType);
	                document.getElementById("machine.usingemp").innerHTML = o.machine.usingemp == null||o.machine.usingemp == "" ?"":o.machine.emp;
	                document.getElementById("machine.dept").innerHTML = o.machine.dept == null ?"":o.machine.org;
	                document.getElementById("machine.area").innerHTML = nui.getDictText('EXP_REGION',o.machine.area);
	                document.getElementById("machine.status").innerHTML = nui.getDictText('MIS_MA_STATUS',o.machine.status);
	                document.getElementById("machine.warrantyTime").innerHTML = o.machine.warrantyTime == null ?"":nui.getDictText('MIS_MA_DTIME',o.machine.warrantyTime);
	                document.getElementById("machine.using").innerHTML = o.machine.using == null ?"":o.machine.using;
	                document.getElementById("machine.remarks").innerHTML = o.machine.remarks == null ?"":o.machine.remarks;
	                document.getElementById("machine.invoiceType").innerHTML = nui.getDictText('MIS_MA_INVOICETYPE',o.machine.invoiceType);
	                if(o.machine.isguoteng == "1"){
	                	document.getElementById("showProject").style.display = "";
	                	document.getElementById("machine.projectno").innerHTML = o.machine.projectno == null?"":o.machine.projectno;
	                	document.getElementById("machine.projectName").innerHTML = o.machine.projectName == null?"":o.machine.projectName;
	                }
	                document.getElementById("machine.isguoteng").innerHTML = nui.getDictText('MIS_MA_GUOTENG',o.machine.isguoteng);
	                document.getElementById("machine.operator").innerHTML = o.machine.operatorname;
	                document.getElementById("machine.operatingTime").innerHTML = o.machine.operatingTime;
	                document.getElementById("machine.ip").innerHTML = o.machine.ip == null ?"":o.machine.ip;
	                document.getElementById("machine.username").innerHTML = o.machine.username == null ?"":o.machine.username;
	                document.getElementById("machine.password").innerHTML = o.machine.password == null ?"":o.machine.password;
	                document.getElementById("machine.application").innerHTML = o.machine.application == null ?"":o.machine.application;
	                document.getElementById("machine.assetnum").innerHTML = o.machine.assetnum;
	                document.getElementById("machine.assetAmount").innerHTML = o.machine.assetAmount;
	                document.getElementById("machine.depreciableTime").innerHTML = nui.getDictText('MIS_MA_DTIME',o.machine.depreciableTime);
	                document.getElementById("machine.depreciableAmount").innerHTML = o.machine.depreciableAmount;
	                document.getElementById("machine.scrapTime").innerHTML = o.machine.scrapTime == null ?"":o.machine.scrapTime;
	                document.getElementById("machine.scrapOperator").innerHTML = o.machine.scrapOperator == null ?"":o.machine.scrapOperatorname;
	                document.getElementById("machine.scrapComment").innerHTML = o.machine.scrapComment == null ?"":o.machine.scrapComment;
	                document.getElementById("machine.net").innerHTML = o.machine.net == null ?"":o.machine.net < 0?0:o.machine.net;
	                document.getElementById("machine.hasdepreciableAmount").innerHTML = o.machine.hasdepreciableAmount == null ?"":o.machine.hasdepreciableAmount<0?0:o.machine.hasdepreciableAmount;
	                var tempSrc = "";
	                for(var i=0;i<o.machine.files.length;i++){
	                	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + o.machine.files[i].fileId + "'>" + o.machine.files[i].fileName + "</a>,&nbsp;&nbsp;&nbsp;&nbsp;";
	                }
	               	document.getElementById("uploadedFile").innerHTML = tempSrc;
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