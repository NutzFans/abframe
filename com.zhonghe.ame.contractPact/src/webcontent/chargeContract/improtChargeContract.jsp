<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp"%>
<html>
<head>
<title>Title</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<form enctype="multipart/form-data" id="batchUpload" method="post" class="form-horizontal">
		<div>
			<input class="nui-htmlfile" name="ecdPath" id="ecdPath" style="width: 250px"/>
			<input id="saveButton" class="nui-button" text="导入" style="margin-left: 10px" onclick="uploadBtn()" iconCls="icon-upload" />
		</div>
	</form>

	<script type="text/javascript">
		nui.parse();
		var contextPath = "<%=request.getContextPath()%>";
		
		function uploadBtn() {
			nui.loading("保存中...");
			var uploadEventFile = nui.get("ecdPath").getValue();
			if (uploadEventFile == '' || uploadEventFile == null) {
				nui.alert("请选择excel,再上传", "");
				return;
			} else if (uploadEventFile.lastIndexOf(".xls") < 0) {//可判断以.xls和.xlsx结尾的excel  
				nui.alert("只能上传Excel文件", "");
				return;
			} else {
				document.getElementById('batchUpload').action = contextPath + '/com.zhonghe.ame.chargeContract.improtChargeContract.flow';
				document.getElementById('batchUpload').submit();
			}

		}
	</script>

</body>
</html>