<%@page pageEncoding="UTF-8"%>
<%@include file="/ame/clipview/common.jsp"%>
<!--[if gte IE 9]><!-->
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2020-04-20 11:45:17
  - Description:
-->
<head>
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame_mobile/workDesk/assets/css/main.css">
</head>
<body>
<div style="text-align: center; vertical-align: center">
<jsp:include page="/project/controlCabin/controCabinTable.jsp"/>
</div>
</body>
<script type="text/javascript">
</script>
</html>