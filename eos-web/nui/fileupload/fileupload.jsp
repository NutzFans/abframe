<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page pageEncoding="UTF-8"%>
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css"
	  href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html>
<!-- 
  - Author(s): JFree
  - Date: 2013-03-13 20:33:27
  - Description:
-->
	<head>
	    <title>文件上传控件（FLASH）</title>
	    <link href="../demo.css" rel="stylesheet" type="text/css" />
	    <script src="swfupload/swfupload.js" type="text/javascript"></script>
	</head>
	<body>
		<br/>
		<input id="fileupload1" class="nui-fileupload" name="Fdata" limitType="*.txt" flashUrl="swfupload/swfupload.swf"
	       	   uploadUrl="upload.jsp" onuploadsuccess="onUploadSuccess" onuploaderror="onUploadError" onfileselect="onFileSelect" />
	    <br/>
	    <input type="button" value="上传" onclick="startUpload()"/>
	    	<div class="description">
	        	<h3>Description</h3>
	        	<p>FileUpload文件上传控件，基于FLASH的swfupload实现，能实现无刷新上传文件功能。</p>
	    	</div>
	    	
	    <script type="text/javascript">
		    nui.parse();
		
		    //动态设置url
		    //var fileupload = nui.get("fileupload1");
		    //fileupload.setUploadUrl("upload.jsp");
		
		    function onFileSelect(e) {
		        //alert("选择文件");
		    }
		    function onUploadSuccess(e) {
		 		alert("上传成功：" + e.serverData);
				this.setText("");
		    }
		    function onUploadError(e) {
		        
		    }
		
		    function startUpload() {
		        var fileupload = nui.get("fileupload1");
		        fileupload.startUpload();
		    }
		</script>
	</body>
</html>
		
		
		
