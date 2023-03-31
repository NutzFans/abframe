<%@page pageEncoding="UTF-8"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): 朱海翔
  - Date: 2018-11-09 11:11:43
  - Description:
-->
<head>
<title>Title</title>
</head>
<body>
<div id="handout_wrap_inner"></div>
</body>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery.media.js"></script>
<script type="text/javascript">
	
	$(function(){
		SetData();	
	})
	
	function SetData(){
			//调用
		    var filepath = window.location.href.substring(window.location.href.lastIndexOf("upload")+7,window.location.href.length);
			$('#handout_wrap_inner').media({
		        width: '100%',
		        height: '95%',
		        autoplay: true,
		        src: "/file/"+filepath
		 
		    }); 
	}
	
    
</script>
</html>