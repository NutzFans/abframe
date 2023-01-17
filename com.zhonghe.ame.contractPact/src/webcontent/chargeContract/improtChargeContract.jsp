<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp"%>
<html>
<!-- 
  - Author(s): huangqj
  - Date: 2022-10-20 09:11:25
  - Description:
-->
<head>
<title>Title</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js"
	type="text/javascript"></script>
</head>
<body>
	<form enctype="multipart/form-data" id="batchUpload" method="post"
		class="form-horizontal">
		<div style="margin-left: 200px; margin-top: 15px">
			<input class="nui-htmlfile" name="ecdPath" id="ecdPath" /> <input
				id="saveButton" class="nui-button" text="提交"
				style="margin-left: 20px" onclick="uploadBtn()" />
		</div>

	</form>

	<script type="text/javascript">
    	nui.parse();
    	var contextPath = "<%=request.getContextPath()%>";
		function uploadBtn() {
			/* loading("保存中..."); */
			/* nui.loading("保存中..."); */ 
			 nui.loading("保存中...");
			var uploadEventFile = nui.get("ecdPath").getValue();
			if (uploadEventFile == '' || uploadEventFile == null) {
				nui.alert("请选择excel,再上传", "");
				return;
			} else if (uploadEventFile.lastIndexOf(".xls") < 0) {//可判断以.xls和.xlsx结尾的excel  
				nui.alert("只能上传Excel文件", "");
				return;
			} else {
				document.getElementById('batchUpload').action = contextPath
						+ '/com.zhonghe.ame.chargeContract.improtChargeContract.flow';
				document.getElementById('batchUpload').submit();
			}

		}
	</script>
</body>
</html>