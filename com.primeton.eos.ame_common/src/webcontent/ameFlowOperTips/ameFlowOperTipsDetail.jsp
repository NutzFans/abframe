<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath=request.getContextPath();
 %>
<html>
<%-- 
  - Author(s): wenyy
  - Date: 2016-06-27 13:21:17
  - Description:
--%>
<head>
<title>流程提示信息</title>
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
<div class="nui-fit" style="width:auto">
	<form id="form1" method="post" style="width:auto">
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;width:auto">
	<legend>流程提示信息</legend>
			<input type="hidden" class="mini-hidden" id="proinfoid" name="AmeFlowOperTips.proinfoid">
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tbody>
						<tr>
							<td align="right" style="width:120px;">流程定义名称：</td>
							<td id="processdefname" style="width:250px;"></td>
							<td align="right" style="width:120px;">是否可用：</td> 
							<td id="prostatus" style="width:50px;"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;" >活动定义名称：</td>
							<td id="activitydefname" colspan="3" style="width:250px;"></td>
							
						</tr>
						<tr>
							<td align="right" style="width:120px;" >流程提示信息：</td>
							<td id="processinfo" colspan="3" width="auto"></td>
						</tr>
					</tbody>
				</table>
				</div>
			</fieldset>
	</form>
</div>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div> 
<script type="text/javascript">
	 	 nui.parse();
 		 var form1 = new nui.Form("form1");
 		 var processdefname = getUrlParam("processdefname");
 		 var activitydefname = getUrlParam("activitydefname");
 		 function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		 }
 		 SetData(processdefname,activitydefname);
	     function SetData(data1,data2){
	        var json = nui.encode({AmeFlowOperTips:{processdefname:data1,activitydefname:data2}});
        	nui.ajax({
        		url: "com.primeton.eos.ame_common.processPrompt.expandAmeFlowOperTips.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                    obj = nui.decode(o);
                    form1.setData(o);
                    form1.isChanged(false);		
                    document.getElementById("processdefname").innerHTML = o.AmeFlowOperTips.processdefname == null ? "" : o.AmeFlowOperTips.processDefName;
                    document.getElementById("activitydefname").innerHTML = o.AmeFlowOperTips.activitydefname == null ? "" : o.AmeFlowOperTips.activityDefName;
                    document.getElementById("prostatus").innerHTML = o.AmeFlowOperTips.prostatus == null ? "" : nui.getDictText('MIS_YN',o.AmeFlowOperTips.prostatus);
                    document.getElementById("processinfo").innerHTML = o.AmeFlowOperTips.processinfo == null ? "" : o.AmeFlowOperTips.processinfo;
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