<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@page import="java.util.Map"%>
<%@page import="commonj.sdo.DataObject"%>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2015-07-10 14:06:49
  - Description:
-->
<head>
	<title>定时器查询</title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fix">
	<div class="nui-panel" title="定时器查询" style="width:100%;">
		<div id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td class="form_label" align="right" style="width:100px;">任务名称:</td>
				        <td style="width:150px;" align="left">
				        	<input name="criteria._expr[0]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter" />
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="jobRelname"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				        </td>
				        <td class="form_label" align="right" style="width:100px;">任务状态:</td>
				        <td style="width:150px;" align="left">
				        	<input name="criteria._expr[1]._value" class="nui-dictcombobox" dictTypeId="AME_JOB_STATE" style="width:150px;" showNullItem="true" multiSelect="true" onenter="onKeyEnter" />
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="taskState"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
				        </td>
				        <td class="form_label" align="right" style="width:100px;"></td>
				        <td style="width:150px;"></td>	    		
			        </tr>
		    		<tr>
		    			<td align="center" colspan="8">
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search">查找</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
						</td>
					</tr>
		    	</table>
	    	</div>
		</div>
		<div style="width:100%;" >
			<div class="nui-toolbar" id="toolbars" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
				            <a class="nui-button" iconCls="labor-sendwx" onclick="updateScheduleInfo()">执行计划</a>
				            <a class="nui-button" id="stop" iconCls="icon-no" onclick="stopScheduleInfo()">暂停</a>
				            <a class="nui-button" id="continue" iconCls="icon-goto" onclick="continueScheduleInfo()">重启</a>
				        </td>
	                </tr>
	            </table>           
	        </div>
		    <div id="datagrid1" sizeList="[10,20,50,100]" showPager="true" dataField="scheduleInfos" class="nui-datagrid" style="width:100%;height:340px;" onselectionchanged="checkGatagrid"
		    	url="com.primeton.eos.ame_common.schedule.queryJob.biz.ext" multiSelect="true" allowSortColumn="true" sortMode="client" allowCellWrap="true" >
	            <div property="columns">
	            	<div type="checkcolumn"></div>
	                <div field="jobRelname" width="100" align="left"headerAlign="center" allowSort="true" renderer="getName">任务名称</div>
	                <div field="jobName" width="100" align="center" headerAlign="center" allowSort="true" >任务代码</div>
	                <div field="taskState" width="40" align="center" headerAlign="center" allowSort="true" renderer="getTaskState">状态</div>
	                <div field="context" width="150" align="left" headerAlign="center" allowSort="true" renderer="getContext">触发描述</div>
	                <div field="description" width="300" align="left"headerAlign="center" allowSort="true" >备注</div>
	            </div>
	        </div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	search();
	
	function search() {
		var form = new nui.Form("#form1");
		var data = form.getData();
		grid.load(data);
		nui.get("stop").enable();
		nui.get("continue").enable();
	}
	
	//重置
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		grid.load();
		nui.get("stop").enable();
		nui.get("continue").enable();
	}
	
	//状态
	function getTaskState(e){
		if(e){
			return nui.getDictText('AME_JOB_STATE',e.value);
		}
	}
	
	//触发时间描述
	function getContext(e){
		if(e.row.cronExpression!=null&&e.row.cronExpression!=""){
			var cronExpression = e.row.cronExpression;
			var context;
			var times = cronExpression.split(/\s+/);
			var secound = times[1];
			if(secound<10){
				secound = "0" + secound;
			}
        	var time = times[2]+":"+secound;
        	var day =  times[3];
        	var month =  times[4];
        	var week =  times[5];
    		if((day=="*"||day=="?")&&(month=="*"||month=="?")&&(week=="*"||week=="?")){
        		context = "每天" + time +"触发";
        	}else if(day!="*"&&day!="?"){
        		if((month=="*"||month=="?")&&(week=="*"||week=="?")){
        			context = "每月的第" + day + "日的" + time +"触发";
        		}else if(month!="*"&&month!="?"&&(week=="*"||week=="?")){
        			context = "每年的第" + month + "个月的第" + day + "日的" + time +"触发";
        		}
        	}else if(month!="*"&&month!="?"){
        		if(week.indexOf("#") != -1){
        			var tw = week.substring(0,1);
        			var tm = week.substring(2,3);
        			var weekname;
        			if(tw=='1'){
        				weekname = '星期日';
        			}else if(tw=='2'){
        				weekname = '星期一';
        			}else if(tw=='3'){
        				weekname = '星期二';
        			}else if(tw=='4'){
        				weekname = '星期三';
        			}else if(tw=='5'){
        				weekname = '星期四';
        			}else if(tw=='6'){
        				weekname = '星期五';
        			}else if(tw=='7'){
        				weekname = '星期六';
        			}
        			context = "每年的第" + month + "个月的第" + tm + "个星期的" + weekname + "的" + time +"触发";
        		}else if(week.indexOf("L") != -1){
        			var tw = week.substring(0,1);
        			if(tw=='1'){
        				weekname = '星期日';
        			}else if(tw=='2'){
        				weekname = '星期一';
        			}else if(tw=='3'){
        				weekname = '星期二';
        			}else if(tw=='4'){
        				weekname = '星期三';
        			}else if(tw=='5'){
        				weekname = '星期四';
        			}else if(tw=='6'){
        				weekname = '星期五';
        			}else if(tw=='7'){
        				weekname = '星期六';
        			}
        			context = "每年的第" + month + "个月的最后一个星期的" + weekname + "的" + time +"触发";
        		}
        	}else if(week!="*"&&week!="?"){
        		if((day=="*"||day=="?")&&(month=="*"||month=="?")){
        			if(week.indexOf(",") != -1){
        				var weeks = week.split(",");
        				var weekname;
        				for(var i=0;i<weeks.length;i++){
        					var w = weeks[i];
        					if(w=='1'){
		        				w = '星期日';
		        			}else if(w=='2'){
		        				w = '星期一';
		        			}else if(w=='3'){
		        				w = '星期二';
		        			}else if(w=='4'){
		        				w = '星期三';
		        			}else if(w=='5'){
		        				w = '星期四';
		        			}else if(w=='6'){
		        				w = '星期五';
		        			}else if(w=='7'){
		        				w = '星期六';
		        			}
		        			if(weekname == null || weekname == ""){
		        				weekname = w;
		        			}else{
		        				weekname = weekname + "," + w;
		        			}
        				}
        				context = "每个" + weekname + "的" + time +"触发";
        			}else if(week.indexOf("#") != -1){
        				var tw = week.substring(0,1);
        				var tm = week.substring(2,3);
        				var weekname;
        				if(tw=='1'){
	        				weekname = '星期日';
	        			}else if(tw=='2'){
	        				weekname = '星期一';
	        			}else if(tw=='3'){
	        				weekname = '星期二';
	        			}else if(tw=='4'){
	        				weekname = '星期三';
	        			}else if(tw=='5'){
	        				weekname = '星期四';
	        			}else if(tw=='6'){
	        				weekname = '星期五';
	        			}else if(tw=='7'){
	        				weekname = '星期六';
	        			}
        				context = "每月的第" + tm + "个星期的" + weekname + "的" + time +"触发";
        			}else if(week.indexOf("L") != -1){
        				var tw = week.substring(0,1);
        				var weekname;
        				if(tw=='1'){
	        				weekname = '星期日';
	        			}else if(tw=='2'){
	        				weekname = '星期一';
	        			}else if(tw=='3'){
	        				weekname = '星期二';
	        			}else if(tw=='4'){
	        				weekname = '星期三';
	        			}else if(tw=='5'){
	        				weekname = '星期四';
	        			}else if(tw=='6'){
	        				weekname = '星期五';
	        			}else if(tw=='7'){
	        				weekname = '星期六';
	        			}
        				context = "每月的最后一个星期的" + weekname + "的" + time +"触发";
        			}else{
        				var weekname;
        				if(week=='1'){
	        				weekname = '星期日';
	        			}else if(week=='2'){
	        				weekname = '星期一';
	        			}else if(week=='3'){
	        				weekname = '星期二';
	        			}else if(week=='4'){
	        				weekname = '星期三';
	        			}else if(week=='5'){
	        				weekname = '星期四';
	        			}else if(week=='6'){
	        				weekname = '星期五';
	        			}else if(week=='7'){
	        				weekname = '星期六';
	        			}
	        			context = "每个" + weekname + "的" + time +"触发";
        			}
        		}
        	}
        	return context;
		}else{
			return "固定时刻触发";
		}
	}
	
	//行选择改变时发生
	function checkGatagrid(){
		var rows = grid.getSelecteds();
		if(rows == null){
			nui.get("stop").enable();
			nui.get("continue").enable();
		}else{
			var isrun = "";
			var isstop = "";
			var isfine = "";
			for(var i=0;i<rows.length;i++){
				if(rows[i].taskState=='0'){
					isrun = '1';
				}else if(rows[i].taskState=='1'){
					isstop = '1';
				}else if(rows[i].taskState=='2'){
					isfine = '1';
				}
			}
			if(isrun=='1'&&isstop=='1'){
				nui.get("stop").disable();
				nui.get("continue").disable();
			}else if(isrun=='1'&&isstop==""){
				nui.get("continue").disable();
				nui.get("stop").enable();
			}else if(isrun==""&&isstop=="1"){
				nui.get("stop").disable();
				nui.get("continue").enable();
			}else if(isfine=="1"){
				nui.get("stop").disable();
				nui.get("continue").disable();
			}else{
				nui.get("stop").enable();
				nui.get("continue").enable();
			}
		}	
	}
	
	//任务名称处理
	function getName(e){
		if(e.value==null){
			return e.row.jobName;
		}else{
			return e.value;
		}
	}
	
	//修改
	function updateScheduleInfo(){
		var rows = grid.getSelecteds();
		if(rows.length==0){
			alert("请选中一行后再进行该操作！");
			return;
		}else if(rows.length>1){
			alert("最多选中一行后再进行该操作！");
			return;
		}else{
			nui.open({
		        url: "<%=request.getContextPath() %>/ame_common/schedule/modifySchedule.jsp",
		        title: "修改定时任务", 
				width: 740,
		        height: 420,
		        onload: function () {
		            var iframe = this.getIFrameEl();
		            var row = grid.getSelected();
		            var data = { action: "edit","jobName":row.jobName};
		            iframe.contentWindow.SetData(data);
		        },
		        ondestroy: function (o) {
		            if(o.action="ok"){
		        		grid.reload();
		        		nui.get("stop").enable();
						nui.get("continue").enable();
		        	}
		        }
		    });
		}
	}
	
	//暂停
	function stopScheduleInfo(){
		var rows = grid.getSelecteds();
		if(rows.length==0){
			alert("请选中最少一行后再进行该操作！");
			return;
		}else{
			nui.confirm("确定暂停选中定时器吗？", "操作提示",
	            function (action) {            
	                if (action == "ok") {
	                	var json = nui.encode({"schedules":rows});
						nui.ajax({
				            url: "com.primeton.eos.ame_common.schedule.stopschedule.biz.ext",
				            type: "post",
				            data: json, 
				            cache: false,
				            contentType: 'text/json',
				            success: function (o) {
				            	var result = o.result;
				            	var mesg = o.mesg;
				            	if(result=='1'){
				            		if(mesg==null||mesg==""){
				            			alert("暂停成功");
				            		}else{
				            			alert("暂停成功。其中名称为："+mesg+"定时器任务暂停失败！");
				            		}
				            		grid.reload();
				            		nui.get("stop").enable();
									nui.get("continue").enable();
				            	}else {
				            		alert("暂停失败");
				            		nui.get("stop").enable();
									nui.get("continue").enable();
				            	}
				            },
				            error: function () {
				            }
				       });
					}else{
						return;
					}
				}
			);
		}
	}
	
	//继续
	function continueScheduleInfo(){
		var rows = grid.getSelecteds();
		if(rows.length==0){
			alert("请选中最少一行后再进行该操作！");
			return;
		}else{
			nui.confirm("确定重启选中定时器吗？", "操作提示",
	            function (action) {            
	                if (action == "ok") {
	                	var json = nui.encode({"schedules":rows});
						nui.ajax({
				            url: "com.primeton.eos.ame_common.schedule.continueSchedule.biz.ext",
				            type: "post",
				            data: json, 
				            cache: false,
				            contentType: 'text/json',
				            success: function (o) {
				            	var result = o.result;
				            	var mesg = o.mesg;
				            	if(result=='1'){
				            		if(mesg==null||mesg==""){
				            			alert("重启成功");
				            		}else{
				            			alert("重启成功。其中名称为："+mesg+"定时器任务重启失败！");
				            		}
				            		grid.reload();
				            		nui.get("stop").enable();
									nui.get("continue").enable();
				            	}else {
				            		alert("重启失败");
				            		nui.get("stop").enable();
									nui.get("continue").enable();
				            	}
				            },
				            error: function () {
				            }
				       });
					}else{
						return;
					}
				}
			);
		}
	}
</script>
</html>