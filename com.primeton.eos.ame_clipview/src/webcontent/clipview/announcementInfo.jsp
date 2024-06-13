<%@page pageEncoding="UTF-8"%>
<%@include file="/purchase/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>通知公告</title>
<meta name="renderer" content="webkit">
<script src="<%=request.getContextPath()%>/common/nui/warterMark.js" type="text/javascript"></script>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
</head>
<body>
	<div style="margin: 0 auto; width: 900px; height: auto;">
		<h2 align="center" style="margin-top: 30px">通知公告</h2>
		<form id="dataFrm" class="layui-form layui-form-pane" lay-filter="dataFrm">
			<div class="layui-row" style="margin-top: 15px">
				<div class="layui-col-xs12">
					<label class="layui-form-label">标题</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input" disabled="disabled" name="title">
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-xs6">
					<label class="layui-form-label">发布人</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input" disabled="disabled" name="createUser">
					</div>
				</div>
				<div class="layui-col-xs6">
					<label class="layui-form-label">发布日期</label>
					<div class="layui-input-block">
						<input type="text" class="layui-input" disabled="disabled" name="createTime">
					</div>
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-col-xs12">
					<div class="layui-form-text">
						<label class="layui-form-label" style="padding-left: 40px">内容</label>
						<textarea class="layui-textarea" autoHeight="true" disabled="disabled" name="content"></textarea>
					</div>
				</div>
			</div>
		</form>
		<table id="filesGrid" class="layui-hide"></table>
	</div>

	<script src="<%=request.getContextPath()%>/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
	<script>
		layui.use([ 'jquery', 'form', 'table' ], function() {
			var $ = layui.jquery;
			var form = layui.form;
			var table = layui.table;
			var id = <%=request.getParameter("id")%>;

			form.render();

			getData();

			function getData() {
				$.ajax({
					url : "com.primeton.eos.ame_newlook.newlook.queryAnnouncementById.biz.ext",
					data : {
						id : id
					},
					type : "POST",
					dataType : "json",
					success : function(result) {
						var formData = result.data;
						formData.createTime = layui.util.toDateString(formData.createTime, 'yyyy-MM-dd');
						form.val("dataFrm", formData);
						$(function() {
							$.fn.autoHeight = function() {
								function autoHeight(elem) {
									elem.style.height = 'auto';
									elem.scrollTop = 0; //防抖动
									elem.style.height = elem.scrollHeight + 5 + 'px';
								}
								this.each(function() {
									autoHeight(this);
									$(this).on('keyup', function() {
										autoHeight(this);
									});
								});
							}
							$('textarea[autoHeight]').autoHeight();
						});
						var filesGrid = table.render({
							elem : '#filesGrid',
							method : 'post',
							url : 'com.primeton.eos.ame_common.file.getFiles.biz.ext',
							where : {
								"groupid" : "announcement",
								"relationid" : formData.id,
								"sortField" : "fileTime",
								"sortOrder" : "desc"
							},
							cols : [ [ {
								field : 'fileName',
								width : "80%",
								title : '附件名称',
								templet : "<div>{{getdetail(d)}}</div>"
							}, {
								field : 'fileSize',
								width : "20%",
								title : '文件大小',
								templet : "<div>{{getFileSize(d.fileSize)}}</div>"
							} ] ],
							parseData : function(res) {
								return {
									"code" : "0",
									"data" : res.files
								};
							},
							done : function(res, curr, count) {
								var data = res.data
								if (data.length == 0) {
									var audio_enable = document.getElementById('filesGrid');
									audio_enable.style.display = 'none';
								}
							}
						});

					}
				})
			}
		})

		function getdetail(e) {
			return "<a href='javascript:void(0)' style ='color: #1b3fba;'  onclick='checkDetail(" + e.fileId + ");' title='点击查看'>" + e.fileName + "</a>";
		}

		function checkDetail(e) {
			var url = "com.primeton.components.web.fileupload.getfile.flow?fileId=" + e;
			window.open(url, "_self");
		}

		function getFileSize(e) {
			var value = e;
			var unit = "KB";
			if (value > 0) {
				value = (value / 1024).toFixed(3);
				if (value >= 1024) {
					value = (value / 1024).toFixed(3);
					unit = "MB";
				}
			}
			return value + unit;
		}
		
		setWatermark('<%=userName%>');			
		
	</script>
</body>
</html>