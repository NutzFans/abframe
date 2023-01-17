<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-05-31 16:36:30
  - Description:
-->
<head>
	<title>上线内容详细信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <script src="../common/nui/nui.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
	<script type="text/javascript" src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit" style="border:solid 1px #aaa;padding:0px;width:auto">
	<div style="width:auto;padding-top:10px;padding-right:40px;padding-left:40px;padding-bottom:10px">
    	<input type="hidden" class="mini-hidden" id="logid" name="onlinelog.logid">
        <table>
           <tr>
				<td align="left" style="width:100px;font-size:12px;"> 上 &nbsp;线&nbsp; 日&nbsp; 期：</td>
				<td id="onlinelog.onlinedate" style="width:180px;font-size:12px;"></td>
				<td align="left" style="width:95px;font-size:12px;">上线开始时间：</td>
				<td id="onlinelog.starttime" style="width:180px;font-size:12px;"></td>
				<td align="left" style="width:95px;font-size:12px;">上线结束时间：</td>
				<td id="onlinelog.endtime" style="width:180px;font-size:12px;"></td>
			</tr>
			<tr>
				<td align="left" style="width:100px;font-size:12px;"> 上&nbsp; 线&nbsp; 类&nbsp; 型：</td>
				<td id="onlinelog.onlinetype" style="width:180px;font-size:12px;" ></td>
				<td align="left" style="width:95px;font-size:12px;">   版&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  本：</td>
				<td id="onlinelog.version" style="width:180px;font-size:12px;"></td>
				<td align="left" style="width:100px;font-size:12px;"> 是&nbsp; 否&nbsp; 重&nbsp; 启：</td>
				<td id="onlinelog.restart" style="width:180px;font-size:12px;"></td>
			</tr>
		</table>
		<table style="table-layout:fixed;">
            <tr>
            	<td align="left" style="width:95px;font-size:12px;">上线内容概述：</td>
            	<td  align="left" id="onlinelog.onlinecontent" style="font-size:12px;" width="auto"></td>
            </tr>
        </table>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
		<legend>上线内容说明</legend>
		<table>
           <tr>
				<td id="content1" style="font-size:12px" width="auto" height="90%"></td>
		   </tr>
        </table>
        </fieldset>
        <table>
        	<tr>
        		<td align="left" style="width:90px;font-size:12px;">上线操作人员：</td>
				<td id="onlinelog.operator" style="width:180px;font-size:12px;" ></td>
				<td align="left" style="width:90px;font-size:12px;">日志录入时间：</td>
				<td id="onlinelog.operatetime" style="width:180px;font-size:12px;"></td>
        	</tr>
        </table>
    </div>
    <div style="text-align:center;padding:10px;">               
	    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>       
	</div>  
</div>
</body>
<script type="text/javascript">
    nui.parse();
    var editorId = "ke";
    var logid = getUrlParam("id");
 	function getUrlParam(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) 
		return unescape(r[2]); 
		return null; 
	 }
 	  SetData(logid);
    //-------------------------------------------------------------
    var editor1 = null;
	 KindEditor.ready(function(K) {
			editor1 = K.create('textarea[name="content1"]', {
			cssPath : '<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
			uploadJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			}
		});
		prettyPrint();
	});
	
 function SetData(data){
        var json = nui.encode({onlinelog:{logid: data}});
    	nui.ajax({
    		url: "com.primeton.eos.ame_common.onlineLog.queryOnlineLogDetail.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (o) {
                obj = nui.decode(o);
                document.getElementById("onlinelog.onlinedate").innerHTML = o.onlinelog.onlinedate == null ? "" : o.onlinelog.onlinedate;
                document.getElementById("onlinelog.starttime").innerHTML = o.onlinelog.starttime == null ? "" : o.onlinelog.starttime;
                document.getElementById("onlinelog.endtime").innerHTML = o.onlinelog.endtime == null ? "" : o.onlinelog.endtime;
                document.getElementById("onlinelog.onlinetype").innerHTML =nui.getDictText('AME_ONLINETYPE',o.onlinelog.onlinetype);
                document.getElementById("onlinelog.version").innerHTML = o.onlinelog.version == null ? "" : o.onlinelog.version;
                document.getElementById("onlinelog.restart").innerHTML = nui.getDictText('ABF_YESORNO',o.onlinelog.restart);
                document.getElementById("onlinelog.onlinecontent").innerHTML = o.onlinelog.onlinecontent == null ? "" : o.onlinelog.onlinecontent;
           		document.getElementById("content1").innerHTML = o.onlinelog.onlinecontentdetail == null ? "" : o.onlinelog.onlinecontentdetail;
           		document.getElementById("onlinelog.operator").innerHTML = o.onlinelog.operator == null ? "" : o.onlinelog.operator;
           		document.getElementById("onlinelog.operatetime").innerHTML = o.onlinelog.operatetime == null ? "" : o.onlinelog.operatetime;
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
    	});
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
    function onCancel(e) {
        CloseWindow("cancel");
    }
    
 
</script>
</body>
</html>