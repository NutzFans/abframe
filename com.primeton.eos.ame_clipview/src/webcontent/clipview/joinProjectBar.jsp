<%@page pageEncoding="UTF-8"%>
<%@include file="/ame/clipview/common.jsp"%>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-08-15 11:15:24
  - Description:
-->
<head>
<title>我的项目统计</title>
<meta charset="utf-8" />
<style type="text/css">
.fa {
	display: inline-block;
	font-family: FontAwesome;
	font-style: normal;
	font-weight: normal;
	line-height: 1;
	-webkit-font-smoothing: antialiased;
}
</style>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script src="assets/js/jquery1.min.js"></script>
<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/main.css">
</head>
<body>
<div class="container" style='border:0'>
	<div class="row">
		<jsp:include page="/ame/clipview/barChart.jsp"/>
	</div>
</div>
<script src="assets/plugins/flot/jquery.flot.js"></script>
<script src="assets/plugins/flot/jquery.flot.barnumbers.js"></script>
</body>
</html>