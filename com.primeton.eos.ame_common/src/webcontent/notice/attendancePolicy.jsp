<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): JFree
  - Date: 2013-03-11 18:35:52
  - Description:
-->
<head>
    <title>考勤制度</title>
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
    	<input type="hidden" class="mini-hidden" id="noticeid" name="ameNotice.noticeid">
    	<table style="table-layout:fixed;" style="width:auto;">
            <tr>
            	<th  align="center" id="ameNotice.noticetitle" style="font-size:16px;" width="auto"></th>
            </tr>
            <tr>
            	<td  align="center" id="ameNotice.noticedate" width="auto"></td>
            </tr>
           <tr>
				<td id="content1" width="auto"></td>
		   </tr>
		   <tr>
		   	<td align="left" id="file1" width="auto"></td>
		   </tr>
        </table>
    </div>
    <!--body-->
</div>
</body>
<script type="text/javascript">
    nui.parse();
    var editorId = "ke";
    var noticeid = "321";
 	
 	  SetData(noticeid);
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
        var json = nui.encode({ameNotice:{noticeid: data}});
    	nui.ajax({
    		url: "com.primeton.eos.ame_common.ameNotice.queryNotice.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (o) {
                obj = nui.decode(o);
                document.getElementById("ameNotice.noticetitle").innerHTML = o.ameNotice.noticetitle == null ? "" : o.ameNotice.noticetitle;
                var strInfo = o.ameNotice.orgname+"  "+o.ameNotice.noticedate.substr(0,10);
                document.getElementById("ameNotice.noticedate").innerHTML = o.ameNotice.noticedate == null ? "" : strInfo;
           		document.getElementById("content1").innerHTML = o.ameNotice.noticecontent == null ? "" : o.ameNotice.noticecontent;
		    	nui.ajax({
		    		url: "com.primeton.eos.ame_common.file.getFiles.biz.ext",
		            data: {"groupid":"ameNotice","relationid":o.ameNotice.noticeid},
		            type: 'POST',
		            cache: false,
		            contentType: 'text/json',
		            success: function (o1) {
		            	if(o1.files.length!=0){
		            		var tempSrc = "<table><tr><td>附件列表</td></tr>";
			                for(var i=0;i<o1.files.length;i++){
			                	tempSrc += "<tr><td><a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + o1.files[i].fileId + "'>" + o1.files[i].fileName + "</a></td></tr>";
			                }
			                tempSrc = tempSrc + "</table>";
			               	document.getElementById("file1").innerHTML = tempSrc;
		            	}
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		                alert(jqXHR.responseText);
		                CloseWindow();
		            }
		    	});
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
</html>
