<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<body>
<table class="table table-striped table-hover table-responsive" id="tasklist">
	<thead>
		<tr>
			<th data-field="workItemName" data-width = "150px" data-align="left" data-halign = "center" data-formatter = "onActionRenderer">工作项名称</th>
			<th data-field="processInstName" class="center" data-align="left">流程实例名称</th>
		</tr>
	</thead>
	<tbody class = "left">
		
	</tbody>
</table>
</body>
<!-- end: BODY -->
<script type="text/javascript">
 	//加载我的待办任务
 	
 	function loadMytask(){
 		//遮罩
 	    var el = $('#tasklist').parents(".panel");
 	    el.block({
		    overlayCSS: {
		        backgroundColor: '#fff'
		    },
		    message: '<img src="assets/images/loading.gif" /> Just a moment...',
		    css: {
		        border: 'none',
		        color: '#333',
		        background: 'none'
		    }
		});
 		$.ajax({
		   	type:"POST",
			url:'org.gocom.bps.wfclient.task.business.task.queryMyTasks.biz.ext',
			success:function(data){
		    	var datalist = data.tasks;
		     	$('#tasklist').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
		       		data:datalist,   //datalist 即为需要的数据
			       	dataType:'json',
			       	data_locale:"zh-US",  //转换中文 但是没有什么用处
			       	pagination: false,
			       	pageList:[],
			       	pageNumber:1,
			       	paginationLoop:false,
		  			//这里也可以将TABLE样式中的<tr>标签里的内容挪到这里面：
		     
		     	});
		     	$('#tasknum').text(data.total);
		     	$('#menutask').empty();
		     	$('#menutask').task({
					//data:nui.encode(o.data)
					data:data.tasks
				})
		     	el.unblock();
	   		},error:function(data){
	   		}
 		})
 	}
 	
 	//待办任务
 	 function onActionRenderer(e,row,index){
 	 	var workItemName = row.workItemName;
 	 	var workItemID = row.workItemID;
		var s = "<a href=javascript:doOperate('" + workItemID + "','" + workItemName + "')>" + e + "</a> ";
        return s;
	} 
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
					loadMytask();
					} else if (action == "execute") {  
						loadMytask();
						//doOperate(rowIndex, false);					
					}
				}
			});
		}
</script>
</html>