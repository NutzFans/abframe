<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.mini-grid-cell-nowrap {
	white-space: nowrap;
}
</style>
<head>
<title>定时任务管理</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id=scheduledTaskForm>
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">任务名称:</td>
						<td style="width: 205px">
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 200px" />
							<input name="criteria._expr[1]._property" value="taskName" class="nui-hidden" />
							<input name="criteria._expr[1]._op" value="like" class="nui-hidden" />
						</td>
						<td style="width: 70px; text-align: right;">任务类型:</td>
						<td style="width: 155px">
							<input name="criteria._expr[2].taskType" class="nui-dictcombobox" dictTypeId="scheduled_task_type" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td>
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
						</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
			<table style="width: 100%;">
				<tr>
					<td>
						<a class="nui-button" id="dsrwgl_add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="dsrwgl_edit" iconCls="icon-edit" onclick="edit()">修改</a>
						<a class="nui-button" id="dsrwgl_del" iconCls="icon-remove" onclick="del()">删除</a>
						<a class="nui-button" id="dsrwgl_pause" iconCls="icon-split" onclick="pause()">暂停</a>
						<a class="nui-button" id="dsrwgl_resume" iconCls="icon-goto" onclick="resume()">重启</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="scheduledTaskGrid" sizeList="[20,50,100,500]" showPager="true" dataField="scheduledTaskList" pageSize="20" class="nui-datagrid" style="width: 100%; height: 100%;"
				url="com.zhonghe.ame.scheduler.task.scheduledTasks.queryScheduledTasksList.biz.ext">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="taskName" width="200" headerAlign="center" allowSort="true" align="center">任务名称</div>
					<div field="taskType" width="80" headerAlign="center" allowSort="true" align="center" renderer="scheduled_task_type">任务类型</div>
					<div field="taskStatus" width="60" headerAlign="center" allowSort="true" align="center" renderer="AME_JOB_STATE">任务状态</div>
					<div field="startTime" width="60" headerAlign="center" allowSort="true" align="center">开始日期</div>
					<div field="endTime" width="60" headerAlign="center" allowSort="true" align="center">结束日期</div>
					<div field="cronExpression" width="150" headerAlign="center" allowSort="true" align="center" renderer="Cron_Expression">触发描述</div>
					<div field="remark" width="250" headerAlign="center" allowSort="true" align="center">备注</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		nui.parse();
		var scheduledTaskForm = new nui.Form("#scheduledTaskForm");
		var scheduledTaskGrid = nui.get("scheduledTaskGrid");

		init();

		function init() {
			// 按钮权限
			if (userId != 'sysadmin') {
				getOpeatorButtonAuth("dsrwgl_add,dsrwgl_edit,dsrwgl_del,dsrwgl_pause,dsrwgl_resume");
			}
			search();
		}

		function search() {
			var data = scheduledTaskForm.getData();
			scheduledTaskGrid.sortBy("updateTime", "desc");
			scheduledTaskGrid.load(data);
		}

		function reset() {
			scheduledTaskForm.reset();
			init();
		}		

		function add() {
			nui.open({
				url : "/default/scheduler/scheduledTasks/scheduledTasksAdd.jsp",
				width : "900",
				height : "580",
				allowResize : false,
				title : "定时任务 - 新增",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			});
		}
		
		function edit(){
			var row = scheduledTaskGrid.getSelected();
			if (row) {
				nui.open({
					url : "/default/scheduler/scheduledTasks/scheduledTasksEdit.jsp",
					width : '900',
					height : "580",
					allowResize : false,
					title : "定时任务 - 修改",
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.setEditData(row);
					},
					ondestroy : function(action) {
						search();
					}
				})
			}else{
				showTips("请选中需要修改的定时任务", "danger");
			}
		}		
		
		function del(){
			var row = scheduledTaskGrid.getSelected();
			if (row) {
				if (!confirm("是否删除定时任务？")) {
					return;
				}else{
					var taskName = row.taskName;
					var json = nui.encode({
						"taskName" : taskName
					});
					nui.ajax({
						url : "com.zhonghe.ame.scheduler.task.scheduledTasks.deleteScheduledTasksById.biz.ext",
						type : 'POST',
						data : json,
						contentType : 'text/json',
						success : function(o) {
							if (o.result == 1) {
								showTips("删除成功");
								search();
							} else {
								showTips("删除失败，请联系系统管理员！", "danger");
							}
						}
					});
				}
			}else{
				showTips("请选中需要删除的定时任务", "danger");
			}
		}
		
		function pause(){
			var row = scheduledTaskGrid.getSelected();
			if (row) {
				if(row.taskStatus == "0"){
					if (!confirm("是否暂停定时任务？")) {
						return;
					}else{
						var taskName = row.taskName;
						var json = nui.encode({
							"taskName" : taskName
						});
						nui.ajax({
							url : "com.zhonghe.ame.scheduler.task.scheduledTasks.pauseScheduledTasks.biz.ext",
							type : 'POST',
							data : json,
							contentType : 'text/json',
							success : function(o) {
								if (o.result == 1) {
									showTips("暂停定时任务成功");
									search();
								} else {
									showTips("暂停定时任务失败，请联系系统管理员！", "danger");
								}
							}
						});
					}					
				}else{
					showTips("只有任务状态为：正常，可以执行暂停操作", "danger");
				}
			}else{
				showTips("请选中需要暂停的定时任务", "danger");
			}
		}
		
		function resume(){
			var row = scheduledTaskGrid.getSelected();
			if (row) {
				if(row.taskStatus == "1"){
					if (!confirm("是否重启定时任务？")) {
						return;
					}else{
						var taskName = row.taskName;
						var json = nui.encode({
							"taskName" : taskName
						});
						nui.ajax({
							url : "com.zhonghe.ame.scheduler.task.scheduledTasks.resumeScheduledTasks.biz.ext",
							type : 'POST',
							data : json,
							contentType : 'text/json',
							success : function(o) {
								if (o.result == 1) {
									showTips("重启定时任务成功");
									search();
								} else {
									showTips("重启定时任务失败，请联系系统管理员！", "danger");
								}
							}
						});
					}					
				}else{
					showTips("只有任务状态为：暂停，可以执行重启操作", "danger");
				}
			}else{
				showTips("请选中需要重启的定时任务", "danger");
			}
		}						

		function scheduled_task_type(e) {
			return nui.getDictText("scheduled_task_type", e.value);
		}

		function AME_JOB_STATE(e) {
			return nui.getDictText("AME_JOB_STATE", e.value);
		}

		function Cron_Expression(e) {
			var cronExpression = e.value;
			var context;
			var times = cronExpression.split(/\s+/);
			var secound = times[1];
			if (secound < 10) {
				secound = "0" + secound;
			}
			var time = times[2] + ":" + secound;
			var day = times[3];
			var month = times[4];
			var week = times[5];
			if ((day == "*" || day == "?") && (month == "*" || month == "?") && (week == "*" || week == "?")) {
				context = "每天" + time + "触发";
			} else if (day != "*" && day != "?") {
				if ((month == "*" || month == "?") && (week == "*" || week == "?")) {
					context = "每月的第" + day + "日的" + time + "触发";
				} else if (month != "*" && month != "?" && (week == "*" || week == "?")) {
					context = "每年的第" + month + "个月的第" + day + "日的" + time + "触发";
				}
			} else if (month != "*" && month != "?") {
				if (week.indexOf("#") != -1) {
					var tw = week.substring(0, 1);
					var tm = week.substring(2, 3);
					var weekname;
					if (tw == '1') {
						weekname = '星期日';
					} else if (tw == '2') {
						weekname = '星期一';
					} else if (tw == '3') {
						weekname = '星期二';
					} else if (tw == '4') {
						weekname = '星期三';
					} else if (tw == '5') {
						weekname = '星期四';
					} else if (tw == '6') {
						weekname = '星期五';
					} else if (tw == '7') {
						weekname = '星期六';
					}
					context = "每年的第" + month + "个月的第" + tm + "个星期的" + weekname + "的" + time + "触发";
				} else if (week.indexOf("L") != -1) {
					var tw = week.substring(0, 1);
					if (tw == '1') {
						weekname = '星期日';
					} else if (tw == '2') {
						weekname = '星期一';
					} else if (tw == '3') {
						weekname = '星期二';
					} else if (tw == '4') {
						weekname = '星期三';
					} else if (tw == '5') {
						weekname = '星期四';
					} else if (tw == '6') {
						weekname = '星期五';
					} else if (tw == '7') {
						weekname = '星期六';
					}
					context = "每年的第" + month + "个月的最后一个星期的" + weekname + "的" + time + "触发";
				}
			} else if (week != "*" && week != "?") {
				if ((day == "*" || day == "?") && (month == "*" || month == "?")) {
					if (week.indexOf(",") != -1) {
						var weeks = week.split(",");
						var weekname;
						for (var i = 0; i < weeks.length; i++) {
							var w = weeks[i];
							if (w == '1') {
								w = '星期日';
							} else if (w == '2') {
								w = '星期一';
							} else if (w == '3') {
								w = '星期二';
							} else if (w == '4') {
								w = '星期三';
							} else if (w == '5') {
								w = '星期四';
							} else if (w == '6') {
								w = '星期五';
							} else if (w == '7') {
								w = '星期六';
							}
							if (weekname == null || weekname == "") {
								weekname = w;
							} else {
								weekname = weekname + "," + w;
							}
						}
						context = "每个" + weekname + "的" + time + "触发";
					} else if (week.indexOf("#") != -1) {
						var tw = week.substring(0, 1);
						var tm = week.substring(2, 3);
						var weekname;
						if (tw == '1') {
							weekname = '星期日';
						} else if (tw == '2') {
							weekname = '星期一';
						} else if (tw == '3') {
							weekname = '星期二';
						} else if (tw == '4') {
							weekname = '星期三';
						} else if (tw == '5') {
							weekname = '星期四';
						} else if (tw == '6') {
							weekname = '星期五';
						} else if (tw == '7') {
							weekname = '星期六';
						}
						context = "每月的第" + tm + "个星期的" + weekname + "的" + time + "触发";
					} else if (week.indexOf("L") != -1) {
						var tw = week.substring(0, 1);
						var weekname;
						if (tw == '1') {
							weekname = '星期日';
						} else if (tw == '2') {
							weekname = '星期一';
						} else if (tw == '3') {
							weekname = '星期二';
						} else if (tw == '4') {
							weekname = '星期三';
						} else if (tw == '5') {
							weekname = '星期四';
						} else if (tw == '6') {
							weekname = '星期五';
						} else if (tw == '7') {
							weekname = '星期六';
						}
						context = "每月的最后一个星期的" + weekname + "的" + time + "触发";
					} else {
						var weekname;
						if (week == '1') {
							weekname = '星期日';
						} else if (week == '2') {
							weekname = '星期一';
						} else if (week == '3') {
							weekname = '星期二';
						} else if (week == '4') {
							weekname = '星期三';
						} else if (week == '5') {
							weekname = '星期四';
						} else if (week == '6') {
							weekname = '星期五';
						} else if (week == '7') {
							weekname = '星期六';
						}
						context = "每个" + weekname + "的" + time + "触发";
					}
				}
			}
			return context;
		}
	</script>

</body>
</html>