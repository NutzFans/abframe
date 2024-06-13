<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<title>我的待办任务</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
<link rel="stylesheet" href="../../common/layuimini/css/layuimini.css?v=2.0.4.2" media="all">
<link rel="stylesheet" href="../../common/layuimini/css/themes/default.css" media="all">
<link rel="stylesheet" href="../../common/layuimini/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
</head>
<body>
	<div class="layui-fluid" style="padding: 0px">
		<div class="layui-card">
			<div class="layui-card-body" style="padding: 5px">
				<table class="layui-hide" id="taskTableId" lay-filter="taskTableFilter"></table>
			</div>
		</div>
		<div class="layui-card">
			<div class="layui-card-body" style="padding: 5px">
				<table class="layui-hide" id="announcementId" lay-filter="announcementFilter"></table>
			</div>
		</div>
	</div>

	<script type="text/html" id="barDemo">
  		<button type="button" class="layui-btn layui-btn-xs" lay-event="detail">处理</button>
	</script>

	<script type="text/html" id="announcementBar">
		<button type="button" class="layui-btn layui-btn-xs layui-btn-normal" lay-event="edit" perm-show="notice_edit_btn">编辑</button>
		<button type="button" class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del" perm-show="notice_del_btn">删除</button>
		<button type="button" class="layui-btn layui-btn-xs" lay-event="info">详情</button>
	</script>

	<script src="<%=request.getContextPath()%>/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
	<script>
		layui.use([ 'form', 'table' ], function() {
			var $ = layui.jquery;
			var form = layui.form;
			var table = layui.table;
			var date =  new Date();
			var year = date.getFullYear();
			var month = (date.getMonth() + 1).toString().padStart(2, '0');
			var day = date.getDate().toString().padStart(2, '0');
			var currentDate = year + '-' + month + '-' + day;

			table.on('tool(taskTableFilter)', function(obj) {
				var data = obj.data;
				if (obj.event === 'detail') {
					doOperate(data.workItemID, data.workItemName)
				}
			});

			var tableTaskRender = table.render({
				elem : '#taskTableId',
				url : 'org.gocom.bps.wfclient.task.business.task.queryMyTasks.biz.ext',
				response:{
					statusName: 'result',
					statusCode: 200,
					dataName: 'rows',
					countName: 'total'
				},
				cols : [ [ {
					field : 'workItemName',
					title : '当前环节名称',
					width : 250,
					align: 'left'
				}, {
					field : 'processInstName',
					minWidth : 240,
					title : '流程实例名称',
					align : 'left'
				}, {
					title : '操作',
					width : 80,
					align : "center",
					toolbar : '#barDemo'
				} ] ],
				limits : [ 5 ],
				limit : 5,
				page : true,
				parseData : function(res) {
					var dataList = res.tasks;
					var total = dataList.length;
					var list = [];
					var page = $("#layui-table-page1").find(".layui-laypage-em").next().html();
					var limit = $("#layui-table-page1").find(".layui-laypage-limits select").val();
					if (page == undefined || page == null || page == "") {
						page = 1;
					}
					if (limit == undefined || limit == null || limit == "") {
						limit = 5;
					}
					var start = (page-1) * limit;
					var end = page * limit;
					if(end > total){
                        end = total;
                    }
					for (var i = start; i < end; i++) {
						list.push(dataList[i]);
					}
					return {
						"result" : 200,
						"total" : total,
						"rows" : list
					}
				},
	            toolbar: [
	            	'<p>',
	                '待办事项',
	            	'</p>'
	            ].join(''),
	            defaultToolbar: [],
				contentType : 'application/json'
			});

			function doOperate(workItemID, workItemName) {
				var url = "<%=request.getContextPath()%>/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID=" + workItemID;
				var title = "工作项执行" + "-" + workItemName;
				var width = 1100;
				nui.open({
					url : url,
					title : title,
					width : "100%",
					height : "100%",
					onload : function() {
						var iframe = this.getIFrameEl();
					},
					ondestroy : function(action) {
						if (action == "ok") {
							tableTaskRender.reload();
						} else if (action == "execute") {
							tableTaskRender.reload();
						}
					}
				});
			}

			var tableAnnouncementRender = table.render({
				elem : '#announcementId',
				url : 'com.primeton.eos.ame_newlook.newlook.queryAnnouncement.biz.ext',
				method: 'POST',
				response:{
					statusName: 'result',
					statusCode: 200,
					dataName: 'rows',
					countName: 'total'
				},
				cols : [ [ {
					field : 'title',
					title : '标题',
					align: 'left',
					minWidth : 240,
					templet: function(d){
						if(d.sticky == "1"){
							if(greaterEqualDate(currentDate, d.createTime)){
								return '<img src="/default/common/announcement/zhiding.png" style="width: 28px; height: 28px; margin-right: 5px" /><img src="/default/common/announcement/new.png" style="width: 28px; height: 28px; margin-right: 5px" /><span>'+d.title+'</span>'
							}else{
								return '<img src="/default/common/announcement/zhiding.png" style="width: 28px; height: 28px; margin-right: 5px" /><span>'+d.title+'</span>'
							}
						}else{
							if(greaterEqualDate(currentDate, d.createTime)){
								return '<img src="/default/common/announcement/new.png" style="width: 28px; height: 28px; margin-right: 5px" /><span>'+d.title+'</span>'
							}else{
								return '<span>'+d.title+'</span>'
							}
						}
					}
				}, {
					field : 'createTime',
					title : '时间',
					align: 'center',
					width : 120
				}, {
					field : 'createUser',
					title : '创建者',
					align: 'center',
					width : 100
				}, {
					title : '操作',
					width : 165,
					align : "center",
					toolbar : '#announcementBar'
				}] ],
				limits : [ 5 ],
				limit : 5,
				page : true,
				parseData : function(res) {
					return {
						"result" : 200,
						"total" : res.total,
						"rows" : res.datas
					}
				},
	            toolbar: [
	            	'<p>',
	            	'通知公告',
	                '<button lay-event="add" class="layui-btn layui-btn-sm icon-btn" style="float: right" perm-show="notice_add_btn">新增</button>',
	            	'</p>'
	            ].join(''),
	            defaultToolbar: [],				
				contentType : 'application/json',
				done: function(res, curr, count){
					var json = {"funccode":"notice_add_btn,notice_edit_btn,notice_del_btn"};
					nui.ajax({
						url:"com.primeton.eos.ame_auth.ame_auth.getOperatorButtonAuth.biz.ext",
						data:json,
						type:'POST',
						async: false,
						contentType:'text/json',
						success:function(text){
							if(text.authfunc){
								var array = [];
								for(var i=0;i<text.authfunc.length;i++){
									array.push(text.authfunc[i].funccode);
								}
								console.log(array);
						        $('[perm-show]').each(function () {
						            var permShow = $(this).attr('perm-show')
						            if (array.includes(permShow)) {
						            	console.log(permShow);
						                $(this).remove();
						                var permShowClass = permShow.replace(/:/g, '-');
						                $('div.' + permShowClass).remove();
						            }
						        });							
							}
						}
					})
				}
			})
			
			function greaterEqualDate(currentDate, date){
				var diff =  new Date(currentDate) - new Date(date);
				var days = diff / (1000 * 60 * 60 * 24);
				if(days >= 0 && days <=10){
					return true;
				}else{
					return false;
				}
			}
			
			table.on('toolbar(announcementFilter)', function(obj) {
				if (obj.event === 'add') {
					var url = "<%=request.getContextPath()%>/ame/clipview/announcementAdd.jsp";
					nui.open({
						url : url,
						title : "通知公告发布",
						width : "100%",
						height : "100%",
						onload : function() {
							var iframe = this.getIFrameEl();
						},
						ondestroy : function(action) {
							tableAnnouncementRender.reload();
						}
					});					
				}
			})

			table.on('tool(announcementFilter)', function(obj) {
				var data = obj.data;
				if (obj.event === 'edit') {
					var url = "<%=request.getContextPath()%>/ame/clipview/announcementEdit.jsp?id="+data.id;
					nui.open({
						url : url,
						title : "通知公告发布",
						width : "100%",
						height : "100%",
						onload : function() {
							var iframe = this.getIFrameEl();
						},
						ondestroy : function(action) {
							tableAnnouncementRender.reload();
						}
					});
				}
				if(obj.event === 'del'){
					if (!confirm("是否确定删除？")) {
						return;
					}
					var data = {
						"id" : data.id
					};
					var json = nui.encode(data);					
					nui.ajax({
						url : "com.primeton.eos.ame_newlook.newlook.deleteAnnouncement.biz.ext",
						type : "post",
						data : json,
						contentType : 'text/json',
						success : function(data) {
							if (data.result == "1") {
								tableAnnouncementRender.reload();
							} else {
								alert("通知公告删除失败！");
							}							
						}
					});					
				}
				if(obj.event === 'info'){
					var executeUrl = "<%=request.getContextPath()%>/ame/clipview/announcementInfo.jsp?id=" + data.id;
					window.open(executeUrl);
				}
			})
			
			var time = setInterval(function() {
				tableTaskRender.reload();
				tableAnnouncementRender.reload();
			}, 300000);			

		})
	</script>
</body>
<style type="text/css">
.layui-table-tool-temp {
	padding-right: 0px;
}
</style>
</html>