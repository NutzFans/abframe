<%@page pageEncoding="UTF-8"%>
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
	SetData();
	function SetData(){
		$('#handout_wrap_inner').media({
	        width: '100%',
	        height: '95%',
	        autoplay: true,
	        src:"/file/"+parent.rowTemp.filePath.substring(parent.rowTemp.filePath.lastIndexOf("upload")+7,parent.rowTemp.filePath.length)
	    }); 
	}
</script>
</html>