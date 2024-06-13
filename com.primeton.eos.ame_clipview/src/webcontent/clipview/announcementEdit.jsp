<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>通知公告编辑</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
</head>
<body>
	<div class="nui-fit" style="padding: 5px;">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>通知公告编辑</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 80px">标题：</td>
							<td colspan="5">
								<input id="title" name="title" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 80px">是否置顶：</td>
							<td>
								<input id="sticky" name="sticky" class="nui-dictcombobox" dictTypeId="ZH_YN" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 80px">发布人：</td>
							<td>
								<input id="createUser" name="createUser" class="nui-textbox" enabled="false" required="true" style="width: 100%" />
							</td>
							<td align="right" style="width: 80px">发布日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-datepicker" enabled="false" required="true" style="width: 100%" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 80px">发布内容：</td>
							<td colspan="5">
								<input id="content" name="content" class="nui-textarea" style="width: 100%; height: 360px" required="true" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>上传附件</legend>
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>
	</div>

	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" iconCls="icon-ok" style="width: 80px; margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="closeCancel()" iconCls="icon-close" style="width: 80px; margin-right: 140px;">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var id = <%=request.getParameter("id")%>;

		init();

		function init() {
			var data = {
				"id" : id
			};
			var json = nui.encode(data);
			nui.ajax({
				url : "com.primeton.eos.ame_newlook.newlook.queryAnnouncementById.biz.ext",
				type : "post",
				data : json,
				contentType : 'text/json',
				success : function(result) {
					form.setData(result.data);
					var grid_0 = nui.get("grid_0");
					grid_0.load({
						"groupid" : "announcement",
						"relationid" : result.data.id
					});
					grid_0.sortBy("fileTime", "desc");
				}
			});
		}
		
		function onOk() {
			if (!form.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			document.getElementById("fileCatalog").value = "announcement";
			form2.submit();
		}
		
		function SaveData() {
			var data = form.getData();
			data.files = nui.get("fileids").getValue();
			var json = nui.encode({
				'data' : data
			});
			ajaxCommon({
				"url" : "com.primeton.eos.ame_newlook.newlook.updateAnnouncement.biz.ext",
				"data" : json,
				"success" : function(data) {
					if (data.result == "1") {
						showTips("通知公告编辑成功");
						closeOk();
					} else {
						showTips("通知公告编辑失败！", "danger");
					}
				}
			});
		}				
		
	</script>

</body>
</html>