<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
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
  <div class="layui-fluid">
    <div class="layui-card">
      <div class="layui-card-body">
		<table class="layui-hide" id="taskTableId" lay-filter="taskTableFilter"></table>
      </div>
    </div>
  </div>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="detail">处理</a>
</script>
<script src="<%= request.getContextPath() %>/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
  <script>
   layui.use(['form', 'table'], function () {
        var $ = layui.jquery,
            form = layui.form,
            table = layui.table;
		//监听工具条
		  table.on('tool(taskTableFilter)', function(obj){
		    var data = obj.data;
		    if(obj.event === 'detail'){
		      doOperate(data.workItemID,data.workItemName)
		    } 
		  });
		
        var tableRender = table.render({
            elem: '#taskTableId',
            url: 'org.gocom.bps.wfclient.task.business.task.queryMyTasks.biz.ext',
            cols: [[
                {field: 'workItemName', title: '当前环节名称', width: 250 ,templet: '#usernameTpl'},
                {field: 'processInstName', minWidth: 240, title: '流程实例名称', align:'left'},
                {title: '操作', width: 80, toolbar: '#currentTableBar', align: "center" , toolbar: '#barDemo'}
            ]],
            limits: [10, 15, 20, 25, 50, 100],
            limit: 1000,
            page: false,
            skin: 'line',
            parseData : function(res){
				return{
					"code": 0, //解析接口状态
					 "msg": "", //解析提示文本
					 "count": res.total, //解析数据长度
					 "data": res.tasks //解析数据列表
				};
			},
			contentType: 'application/json'
        });

        
		//执行操作
		function doOperate(workItemID,workItemName) {
			var url = "<%=request.getContextPath()%>/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID="+workItemID;
			var title = "工作项执行"+"-"+workItemName;
			var width=1100;
		    nui.open({
				url: url,
				title: title,
				width: "100%",
				height: "100%",
				onload: function () {
					var iframe = this.getIFrameEl();
				},
				ondestroy: function (action){
					if (action == "ok") {
						tableRender.reload();
					} else if (action == "execute") {  
						tableRender.reload();
					}
				}
			});
		}
		
		var time = setInterval(function() {
	    tableRender.reload();
	}, 300000);
		

     

    });
  </script>
</body>
</html>
