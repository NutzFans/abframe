<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page pageEncoding="UTF-8"%>
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css"
	  href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html>
<!-- 
  - Author(s): JFree
  - Date: 2013-03-13 20:40:12
  - Description:
-->
	<head>
	    <title>文件上传控件（HTML）</title>
	    <link href="../demo.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<br />
	   <form id="upload" action="upload.jsp" method="post" enctype="multipart/form-data">         
	        图片：<input class="nui-htmlfile" name="Fdata" limitType="*.txt" />
	       <br/>
	        生日：<input class="nui-datepicker" name="birthday"/>
	       <br/>
	       <input type="submit" value="上传"/>
	   </form>
	   <div class="description">
	       <h3>Description</h3>
	       <p>HtmlFile文件上传控件，上传时需要提交HTML表单，刷新页面。</p>
	   </div>
	</body>
</html>