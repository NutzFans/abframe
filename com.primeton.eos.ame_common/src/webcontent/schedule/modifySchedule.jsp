<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): liubo
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>新增/编辑定时任务</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<form id="form1" method="post">
				<input name="task.taskType" id="taskType"  class="nui-hidden" />
				<input name="task.taskName" id="taskName" class="nui-hidden" />
				<input name="task.targetName" id="targetName" class="nui-hidden" />
				<input name="task.taskState" id="taskState" class="nui-hidden" />
				<input name="task.targetOperation" id="targetOperation" class="nui-hidden" />
				<table style="table-layout:fixed;" id="table_file1">
					<tr>
						<td align="right" style="width:120px" >任务名称：</td>
						<td colspan="2"><input name="task.jobRelname" id="jobRelname" class="nui-textbox" style="width: 100%;" required="true"/></td>
						<td colspan="2"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px" >起始时间：</td>
						<td style="width:140px"><input name="attendance.startTime" id="startTime" class="nui-datepicker"  style="width:120px" format="yyyy-MM-dd" required="true"/></td>
						<td align="right" style="width:80px">结束时间：</td>
						<td style="width:140px"><input name="attendance.endTime" id="endTime" class="nui-datepicker"  style="width:120px" format="yyyy-MM-dd" required="true"/></td>
						<td align="left" colspan="1">
							<div id="isNoEndTime" class="mini-checkboxlist" data="[{'id': false,'text': '无结束时间'}]" value="true" style="margin-left: 20px;" onvaluechanged="changeIsTime"></div>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:120px" >触发模式：</td>
					    <td colspan="4" align="left">    	
					    	<div class="nui-radiobuttonlist" name="trigger.type" id="triggerType" repeatItems="2"  textField="text" valueField="id" value="2"
							     data="[{'id': '2','text': '日历周期触发'}]" onvaluechanged="typeChanged">
							</div>
					    </td>
					</tr>
					<tr id="trTime" style="display:none;">
					  	<td colspan="5">
				  			<table width="80%">
						  		<tr>
							    	<td align="right" style="width:120px">间隔时间：</td> 
							    	<td colspan="2">
							    		<input class="nui-spinner" id="incrementSeconds" name="trigger.incrementSeconds" format="n0" value="0"  maxValue="999999999" minValue="0" showButton="false">&nbsp;单位：秒
							    	</td>
						    		<td colspan="2"></td>
							  	</tr>
							  	<tr>
							    	<td align="right" style="width:120px">执行次数：</td>
							    	<td colspan="2">
							    		<input class="nui-spinner" id="loopTimes" name="trigger.loopTimes" value="0" format="n0" maxValue="9999" minValue="-1" showButton="false">&nbsp;“-1”表示不限次数，直到结束时间为止
						    		</td>
						    		<td colspan="2"></td>
							  	</tr>
							</table>
					  	</td>
					</tr>
					<tr id="trCircle">
						<td colspan="5">
							<table width="80%">
								<tr>
									<td align="right" style="width:120px">触发时间：</td>
									<td colspan="5"><input name="attendance.time" id="time" class="mini-timespinner" format="H:mm" style="width:170px" required="true"/></td>
								</tr>
								<tr>
									<td align="right" style="width:120px" rowspan="4">循环模式：</td>
									<td align="left" style="170px;border: #F0F9FE solid 1px">
										<div class="nui-radiobuttonlist"  id="action_day" repeatItems="1"  textField="text" valueField="id"
										     data="[{'id': 'day','text': '每日'}]" onvaluechanged="triggerChanged" style="width:50px;margin-left: 10px;">
										</div>
									</td>
									<td colspan="3" style="border: #F0F9FE solid 1px"></td>
								</tr>
								<tr>
									<td align="left" style="170px;border: #F0F9FE solid 1px">
										<div class="nui-radiobuttonlist"  id="action_week" repeatItems="1"  textField="text" valueField="id"
										     data="[{'id': 'week','text': '每周'}]" onvaluechanged="triggerChanged" value="1" style="width:50px;margin-left: 10px;">
										</div>
									</td>
									<td align="left" colspan="3" style="border: #F0F9FE solid 1px">
										<div class="nui-combobox"  id="week1"  textField="text" valueField="id" showNullItem="true" 
										allowInput="false" multiSelect="true" style="width: 100%;" dataField="dictweek" value="1">
										</div>
									</td>
								</tr>
								<tr>
									<td align="left" style="170px;border: #F0F9FE solid 1px">
										<div class="nui-radiobuttonlist"  id="action_month" repeatItems="1"  textField="text" valueField="id"
										     data="[{'id': 'month','text': '每月'}]" onvaluechanged="triggerChanged" style="width:50px;margin-left: 10px;">
										</div>
									</td>
									<td colspan="3">
										<div id="month_type" disabled=true>
											<table border="0" width="100%" id="table7" cellspacing="0" cellpadding="0"  style="border: #F0F9FE solid 1px">
												<tr  style="border: #F0F9FE solid 1px">
													<td  style="border: #F0F9FE solid 1px">
														<input type="radio" name="month" id="month1" onchange="changeTrime(1)">
														<div class="nui-combobox"  id="month_day"  textField="text" valueField="id" showNullItem="true" 
															allowInput="false"  style="width: 15%;" dataField="dictday" value="1">
														</div>
													</td>
												</tr>
												<tr  style="border: #F0F9FE solid 1px">
													<td  style="border: #F0F9FE solid 1px">
														<input type="radio" name="month" id="month2" onchange="changeTrime(2)">
														<div class="nui-combobox"  id="month_weekOrder"  textField="text" valueField="id" showNullItem="true" 
															allowInput="false"  style="width: 15%;" dataField="dictm" value="1">
														</div>
														<div class="nui-combobox"  id="month_week"  textField="text" valueField="id" showNullItem="true" 
															allowInput="false" style="width: 17%;" dataField="dictweek" value="1">
														</div>
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
								<tr>
									<td align="left" style="170px;border: #F0F9FE solid 1px">
										<div class="nui-radiobuttonlist"  id="action_year" repeatItems="1"  textField="text" valueField="id"
										     data="[{'id': 'year','text': '每年'}]" onvaluechanged="triggerChanged" style="width:50px;margin-left: 10px;">
										</div>
									</td>
									<td colspan="3">
										<div id="year_type" disabled=true>
											<table border="0" width="100%" id="table8" cellspacing="0" cellpadding="0"  style="border: #F0F9FE solid 1px">
												<tr style="border: #F0F9FE solid 1px">
													<td  style="border: #F0F9FE solid 1px">
													<input type="radio" name="year" id="year1" onchange="changeTrime(3)">
														<span id="everyYear1">
														<div class="nui-combobox"  id="year_month1"  textField="text" valueField="id" showNullItem="true" 
															allowInput="false" style="width: 15%;" dataField="dictmonth" value="1">
														</div>
														<div class="nui-combobox"  id="year_day"  textField="text" valueField="id" showNullItem="true" 
															allowInput="false" style="width: 17%;" dataField="dictday" value="1">
														</div>
														</span>
													</td>
												</tr>
												<tr  style="border: #F0F9FE solid 1px">
													<td  style="border: #F0F9FE solid 1px">
													<input type="radio" name="year" id="year2" onchange="changeTrime(4)">
														<span id="everyYear2">
														<div class="nui-combobox"  id="year_month2"  textField="text" valueField="id" showNullItem="true" 
															allowInput="false" style="width: 15%;" dataField="dictmonth" value="1">
														</div>
														<div class="nui-combobox"  id="year_weekOrder"  textField="text" valueField="id" showNullItem="true" 
															allowInput="false" style="width: 17%;" dataField="dictm" value="1">
														</div>
														<div class="nui-combobox"  id="year_week"  textField="text" valueField="id" showNullItem="true" 
															allowInput="false" dataField="dictweek" style="width: 17%;" value="1">
														</div>
														</span>
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:120px">备注：</td>
						<td colspan="3"><input name="description" id="description" class="nui-textarea" style="height:50px;width: 125%;" maxLength="125"/></td>
					</tr>
					<tr>
						<td style="width:120px"></td>
						<td align="left" colspan="1">
							<div id="ischongqi" class="nui-checkboxlist" data="[{'id': '1','text': '保存后重启'}]" value="0"></div>
						</td>
					</tr>
				</table>
		</form>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" id="onoKAttendance" style="width:60px;margin-right:20px;">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>

<script type="text/javascript">
		nui.parse();
	  	var form = new nui.Form("form1");
        var updateURL = "com.primeton.eos.ame_common.schedule.updateSchedule.biz.ext";
    	var saveURL = "";
    	var group;
    	var dictweek = [{id: "1",text: "星期日"},{id: "2",text: "星期一"},{id: "3",text: "星期二"},{id: "4",text: "星期三"},{id: "5",text: "星期四"},{id: "6",text: "星期五"},{id: "7",text: "星期六"}];
    	var dictm = [{id: "1",text: "第1个"},{id: "2",text: "第2个"},{id: "3",text: "第3个"},{id: "4",text: "第4个"},{id: "-1",text: "最后1个"}];
    	var dictmonth = [{id: "1",text: "1月"},{id: "2",text: "2月"},{id: "3",text: "3月"},{id: "4",text: "4月"},{id: "5",text: "5月"},{id: "6",text: "6月"},{id: "7",text: "7月"},{id: "8",text: "8月"},{id: "9",text: "9月"},{id: "10",text: "10月"},{id: "11",text: "11月"},{id: "12",text: "12月"}];
    	var dictday = [{id: "1",text: "1日"},
	               		   {id: "2",text: "2日"},
	               		   {id: "3",text: "3日"},
	               		   {id: "4",text: "4日"},
	               		   {id: "5",text: "5日"},
	               		   {id: "6",text: "6日"},
	               		   {id: "7",text: "7日"},
	               		   {id: "8",text: "8日"},
	               		   {id: "9",text: "9日"},
	               		   {id: "10",text: "10日"},
	               		   {id: "11",text: "11日"},
	               		   {id: "12",text: "12日"},
	               		   {id: "13",text: "13日"},
	               		   {id: "14",text: "14日"},
	               		   {id: "15",text: "15日"},
	               		   {id: "16",text: "16日"},
	               		   {id: "17",text: "17日"},
	               		   {id: "18",text: "18日"},
	               		   {id: "19",text: "19日"},
	               		   {id: "20",text: "20日"},
	               		   {id: "21",text: "21日"},
	               		   {id: "22",text: "22日"},
	               		   {id: "23",text: "23日"},
	               		   {id: "24",text: "24日"},
	               		   {id: "25",text: "25日"},
	               		   {id: "26",text: "26日"},
	               		   {id: "27",text: "27日"},
	               		   {id: "28",text: "28日"},
	               		   {id: "29",text: "29日"},
	               		   {id: "30",text: "30日"},
	               		   {id: "31",text: "31日"}];
    	nui.get("week1").setData(dictweek);
    	nui.get("month_day").setData(dictday);
    	nui.get("month_weekOrder").setData(dictm);
    	nui.get("month_week").setData(dictweek);
    	nui.get("year_month1").setData(dictmonth);
    	nui.get("year_day").setData(dictday);
    	nui.get("year_month2").setData(dictmonth);
    	nui.get("year_weekOrder").setData(dictm);
    	nui.get("year_week").setData(dictweek);
    	document.getElementById("month1").click();
    	document.getElementById("year1").click();
    	nui.get("action_day").setValue("day");
    	var init = {"value":"day"};
    	triggerChanged(init);
    	
	    function SetData(data){
	    	var data = nui.clone(data);
	    	if(data.action == "edit"){
	    		saveURL = updateURL;
	    		var json = nui.encode({taskName :data.jobName});
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_common.schedule.getTaskDetail.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	var data1 = o.data;
	                	var taskName = data1.taskName;
	                	var jobRelname = data1.jobRelname;
	                	var taskType = data1.taskType;
	                	var quartzJobDetail = data1.quartzJobDetail;
	                	var taskDetail = data1.taskDetail;
	                	var targetName = taskDetail.targetName;
	                	var targetOperation = taskDetail.targetOperation;
	                	var taskState = data1.taskState;
                		nui.get("ischongqi").setValue("1");
	                	nui.get("taskState").setValue(taskState);
	                	nui.get("taskName").setValue(taskName);
	                	if(jobRelname==null||jobRelname==""){
	                		nui.get("jobRelname").setValue(taskName);
	                	}else{
	                		nui.get("jobRelname").setValue(jobRelname);
	                	}
	                	nui.get("taskType").setValue(taskType);
	                	nui.get("targetName").setValue(targetName);
	                	nui.get("targetOperation").setValue(targetOperation);
	                	var description = quartzJobDetail.description;
	                	nui.get("description").setValue(description);
	                	group = quartzJobDetail.group;
	                	var triggerList = data1.triggerList[0];
	                	if(triggerList!=null){
	                		var repeatCount = triggerList.repeatCount;
		                	var repeatInterval = triggerList.repeatInterval;
		                	var cronExpression = triggerList.cronExpression;
		                	var startTime = triggerList.startTime;
		                	var endTime = triggerList.endTime;
		                	nui.get("startTime").setValue(startTime);
		                	if(endTime==null){
		                		nui.get("isNoEndTime").setValue(false);
		                		nui.get("endTime").setReadOnly(true);
		                		nui.get("endTime").setRequired(false);
		                	}else{
		                		nui.get("endTime").setValue(endTime);
		                	}
		                	if(cronExpression!=null&&cronExpression!=""){
		                		setTrime(cronExpression);
		                	}else{
		                		nui.get("triggerType").setValue("1");
		                		nui.get("incrementSeconds").setValue(repeatInterval/1000);
		                		nui.get("loopTimes").setValue(repeatCount);
		                		typeChanged();
		                	}
	                	}else{
	                		nui.get("startTime").setValue(null);
	                		nui.get("isNoEndTime").setValue(false);
	                		nui.get("endTime").setReadOnly(true);
	                		nui.get("endTime").setRequired(false);
	                	}
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    		}
    	}
    	
    	function changeTrime(d){
    		if(d==1){
    			nui.get("month_day").setReadOnly(false);
    			nui.get("month_day").setRequired(true);
    			nui.get("month_weekOrder").setReadOnly(true);
    			nui.get("month_weekOrder").setRequired(false);
    			nui.get("month_week").setReadOnly(true);
    			nui.get("month_week").setRequired(false);
    		}else if(d==2){
    			nui.get("month_day").setReadOnly(true);
    			nui.get("month_day").setRequired(false);
    			nui.get("month_weekOrder").setReadOnly(false);
    			nui.get("month_weekOrder").setRequired(true);
    			nui.get("month_week").setReadOnly(false);
    			nui.get("month_week").setRequired(true);
    		}else if(d==3){
    			nui.get("year_month1").setReadOnly(false);
    			nui.get("year_month1").setRequired(true);
    			nui.get("year_day").setReadOnly(false);
    			nui.get("year_day").setRequired(true);
    			nui.get("year_month2").setReadOnly(true);
    			nui.get("year_month2").setRequired(false);
    			nui.get("year_weekOrder").setReadOnly(true);
    			nui.get("year_weekOrder").setRequired(false);
    			nui.get("year_week").setReadOnly(true);
    			nui.get("year_week").setRequired(false);
    		}else if(d==4){
    			nui.get("year_month1").setReadOnly(true);
    			nui.get("year_month1").setRequired(false);
    			nui.get("year_day").setReadOnly(true);
    			nui.get("year_day").setRequired(false);
    			nui.get("year_month2").setReadOnly(false);
    			nui.get("year_month2").setRequired(true);
    			nui.get("year_weekOrder").setReadOnly(false);
    			nui.get("year_weekOrder").setRequired(true);
    			nui.get("year_week").setReadOnly(false);
    			nui.get("year_week").setRequired(true);
    		}
    	}
    	
    	function typeChanged(){
    		var triggerType = nui.get("triggerType").getValue();
			var trTime = document.getElementById("trTime");
			var trCircle = document.getElementById("trCircle");
			switch(triggerType) {
				case "1" :
					if(trTime.style.display != "") {
						trTime.style.display = "";
					}
					trCircle.style.display = "none";
					break;
				case "2" :
					trTime.style.display = "none";
					if(trCircle.style.display != "") {
						trCircle.style.display = "";
					}
					break;
			}
    	}
    	
    	function setTrime(cronExpression){
    		var times = cronExpression.split(/\s+/);
        	var time = times[2]+":"+times[1]+":"+times[0];
        	nui.get("time").setValue(time);
        	var day =  times[3];
        	var month =  times[4];
        	var week =  times[5];
        	var typeTrime ="";
        	var radios1 = document.getElementsByName("month");
        	var radios2 = document.getElementsByName("year");
        	if(times.length==6){
        		if((day=="*"||day=="?")&&(month=="*"||month=="?")&&(week=="*"||week=="?")){
	        		nui.get("action_day").setValue("day");
	        		typeTrime = "day";
	        	}else if(day!="*"&&day!="?"){
	        		if((month=="*"||month=="?")&&(week=="*"||week=="?")){
	        			nui.get("action_month").setValue("month");
	        			typeTrime = "month";
	        			radios1[0].checked = true;
	        			nui.get("month_day").setValue(day);
	        		}else if(month!="*"&&month!="?"&&(week=="*"||week=="?")){
	        			nui.get("action_year").setValue("year");
	        			typeTrime = "year";
	        			radios2[0].checked = true;
	        			nui.get("year_month1").setValue(month);
	        			nui.get("year_day").setValue(day);
	        		}
	        	}else if(month!="*"&&month!="?"){
	        		nui.get("action_year").setValue("year");
	        		typeTrime = "year";
	        		radios2[1].checked = true;
	        		if(week.indexOf("#") != -1){
	        			var tw = week.substring(0,1);
	        			var tm = week.substring(2,3);
	        			nui.get("year_month2").setValue(month);
	        			nui.get("year_weekOrder").setValue(tm);
	        			nui.get("year_week").setValue(tw);
	        		}else if(week.indexOf("L") != -1){
	        			var tw = week.substring(0,1);
	        			nui.get("year_month2").setValue(month);
	        			nui.get("year_weekOrder").setValue("-1");
	        			nui.get("year_week").setValue(tw);
	        		}
	        	}else if(week!="*"&&week!="?"){
	        		if((day=="*"||day=="?")&&(month=="*"||month=="?")){
	        			if(week.indexOf(",") != -1){
	        				nui.get("action_week").setValue("week");
	        				typeTrime = "week";
	        				nui.get("week1").setValue(week);
	        			}else if(week.indexOf("#") != -1){
	        				var tw = week.substring(0,1);
	        				var tm = week.substring(2,3);
	        				nui.get("action_month").setValue("month");
	        				typeTrime = "month";
	        				radios1[1].checked = true;
	        				nui.get("month_weekOrder").setValue(tm);
	        				nui.get("month_week").setValue(tw);
	        			}else if(week.indexOf("L") != -1){
	        				var tw = week.substring(0,1);
	        				nui.get("action_month").setValue("month");
	        				typeTrime = "month";
	        				radios1[1].checked = true;
	        				nui.get("month_weekOrder").setValue("-1");
	        				nui.get("month_week").setValue(tw);
	        			}else{
	        				nui.get("action_week").setValue("week");
	        				typeTrime = "week";
	        				nui.get("week1").setValue(week);
	        			}
	        		}
	        	}
        	}else if(times.length==7){
        		var year = times[6];
        		if(year=="*"||year=="?"){
        			if((day=="*"||day=="?")&&(month=="*"||month=="?")&&(week=="*"||week=="?")){
		        		nui.get("action_day").setValue("day");
		        		typeTrime = "day";
		        	}else if(day!="*"&&day!="?"){
		        		if((month=="*"||month=="?")&&(week=="*"||week=="?")){
		        			nui.get("action_month").setValue("month");
		        			typeTrime = "month";
		        			radios1[0].checked = true;
		        			nui.get("month_day").setValue(day);
		        		}else if(month!="*"&&month!="?"&&(week=="*"||week=="?")){
		        			nui.get("action_year").setValue("year");
		        			typeTrime = "year";
		        			radios2[0].checked = true;
		        			nui.get("year_month1").setValue(month);
		        			nui.get("year_day").setValue(day);
		        		}
		        	}else if(month!="*"&&month!="?"){
		        		nui.get("action_year").setValue("year");
		        		typeTrime = "year";
		        		radios2[1].checked = true;
		        		if(week.indexOf("#") != -1){
		        			var tw = week.substring(0,1);
		        			var tm = week.substring(2,3);
		        			nui.get("year_month2").setValue(month);
		        			nui.get("year_weekOrder").setValue(tm);
		        			nui.get("year_week").setValue(tw);
		        		}else if(week.indexOf("L") != -1){
		        			var tw = week.substring(0,1);
		        			nui.get("year_month2").setValue(month);
		        			nui.get("year_weekOrder").setValue("-1");
		        			nui.get("year_week").setValue(tw);
		        		}
		        	}else if(week!="*"&&week!="?"){
		        		if((day=="*"||day=="?")&&(month=="*"||month=="?")){
		        			if(week.indexOf(",") != -1){
		        				nui.get("action_week").setValue("week");
		        				typeTrime = "week";
		        				nui.get("week1").setValue(week);
		        			}else if(week.indexOf("#") != -1){
		        				var tw = week.substring(0,1);
		        				var tm = week.substring(2,3);
		        				nui.get("action_month").setValue("month");
		        				typeTrime = "month";
		        				radios1[1].checked = true;
		        				nui.get("month_weekOrder").setValue(tm);
		        				nui.get("month_week").setValue(tw);
		        			}else if(week.indexOf("L") != -1){
		        				var tw = week.substring(0,1);
		        				nui.get("action_month").setValue("month");
		        				typeTrime = "month";
		        				radios1[1].checked = true;
		        				nui.get("month_weekOrder").setValue("-1");
		        				nui.get("month_week").setValue(tw);
		        			}else{
		        				nui.get("action_week").setValue("week");
		        				typeTrime = "week";
		        				nui.get("week1").setValue(week);
		        			}
		        		}
		        	}
        		}
        	}
        	var e = {"value":typeTrime};
        	triggerChanged(e);
    	}
    	
    	function triggerChanged(e){
    		if(e.value=="day"){
    			nui.get("week1").setReadOnly(true);
    			nui.get("week1").setRequired(false);
    			nui.get("month_day").setReadOnly(true);
    			nui.get("month_day").setRequired(false);
    			nui.get("month_weekOrder").setReadOnly(true);
    			nui.get("month_weekOrder").setRequired(false);
    			nui.get("month_week").setReadOnly(true);
    			nui.get("month_week").setRequired(false);
    			nui.get("year_month1").setReadOnly(true);
    			nui.get("year_month1").setRequired(false);
    			nui.get("year_day").setReadOnly(true);
    			nui.get("year_day").setRequired(false);
    			nui.get("year_month2").setReadOnly(true);
    			nui.get("year_month2").setRequired(false);
    			nui.get("year_weekOrder").setReadOnly(true);
    			nui.get("year_weekOrder").setRequired(false);
    			nui.get("year_week").setReadOnly(true);
    			nui.get("year_week").setRequired(false);
    			$("#month1").attr("disabled", true);
    			$("#month2").attr("disabled", true);
    			$("#year1").attr("disabled", true);
    			$("#year2").attr("disabled", true);
    			nui.get("action_week").setValue("");
    			nui.get("action_month").setValue("");
    			nui.get("action_year").setValue("");
    		}else if(e.value=="week"){
    			nui.get("week1").setReadOnly(false);
    			nui.get("week1").setRequired(true);
    			nui.get("month_day").setReadOnly(true);
    			nui.get("month_day").setRequired(false);
    			nui.get("month_weekOrder").setReadOnly(true);
    			nui.get("month_weekOrder").setRequired(false);
    			nui.get("month_week").setReadOnly(true);
    			nui.get("month_week").setRequired(false);
    			nui.get("year_month1").setReadOnly(true);
    			nui.get("year_month1").setRequired(false);
    			nui.get("year_day").setReadOnly(true);
    			nui.get("year_day").setRequired(false);
    			nui.get("year_month2").setReadOnly(true);
    			nui.get("year_month2").setRequired(false);
    			nui.get("year_weekOrder").setReadOnly(true);
    			nui.get("year_weekOrder").setRequired(false);
    			nui.get("year_week").setReadOnly(true);
    			nui.get("year_week").setRequired(false);
    			$("#month1").attr("disabled", true);
    			$("#month2").attr("disabled", true);
    			$("#year1").attr("disabled", true);
    			$("#year2").attr("disabled", true);
    			nui.get("action_day").setValue("");
    			nui.get("action_month").setValue("");
    			nui.get("action_year").setValue("");
    		}else if(e.value=="month"){
    			nui.get("week1").setReadOnly(true);
    			nui.get("week1").setRequired(false);
    			nui.get("month_day").setReadOnly(false);
    			nui.get("month_day").setRequired(true);
    			nui.get("month_weekOrder").setReadOnly(false);
    			nui.get("month_weekOrder").setRequired(true);
    			nui.get("month_week").setReadOnly(false);
    			nui.get("month_week").setRequired(true);
    			nui.get("year_month1").setReadOnly(true);
    			nui.get("year_month1").setRequired(false);
    			nui.get("year_day").setReadOnly(true);
    			nui.get("year_day").setRequired(false);
    			nui.get("year_month2").setReadOnly(true);
    			nui.get("year_month2").setRequired(false);
    			nui.get("year_weekOrder").setReadOnly(true);
    			nui.get("year_weekOrder").setRequired(false);
    			nui.get("year_week").setReadOnly(true);
    			nui.get("year_week").setRequired(false);
				var radios = document.getElementsByName("month");
				for(var i=0;i<radios.length;i++){
					if(radios[i].checked==true){
						if(i==0){
							changeTrime(1);
						}else{
							changeTrime(2);
						}
					}
				}
    			$("#month1").attr("disabled", false);
    			$("#month2").attr("disabled", false);
    			$("#year1").attr("disabled", true);
    			$("#year2").attr("disabled", true);
    			nui.get("action_day").setValue("");
    			nui.get("action_week").setValue("");
    			nui.get("action_year").setValue("");
    		}else if(e.value=="year"){
    			nui.get("week1").setReadOnly(true);
    			nui.get("week1").setRequired(false);
    			nui.get("month_day").setReadOnly(true);
    			nui.get("month_day").setRequired(false);
    			nui.get("month_weekOrder").setReadOnly(true);
    			nui.get("month_weekOrder").setRequired(false);
    			nui.get("month_week").setReadOnly(true);
    			nui.get("month_week").setRequired(false);
    			nui.get("year_month1").setReadOnly(false);
    			nui.get("year_month1").setRequired(true);
    			nui.get("year_day").setReadOnly(false);
    			nui.get("year_day").setRequired(true);
    			nui.get("year_month2").setReadOnly(false);
    			nui.get("year_month2").setRequired(true);
    			nui.get("year_weekOrder").setReadOnly(false);
    			nui.get("year_weekOrder").setRequired(true);
    			nui.get("year_week").setReadOnly(false);
    			nui.get("year_week").setRequired(true);
    			var radios = document.getElementsByName("year");
				for(var i=0;i<radios.length;i++){
					if(radios[i].checked==true){
						if(i==0){
							changeTrime(3);
						}else{
							changeTrime(4);
						}
					}
				}
    			$("#month1").attr("disabled", true);
    			$("#month2").attr("disabled", true);
    			$("#year1").attr("disabled", false);
    			$("#year2").attr("disabled", false);
    			nui.get("action_day").setValue("");
    			nui.get("action_week").setValue("");
    			nui.get("action_month").setValue("");
    		}
    	}
        
		function changeIsTime(){
			var isNoEndTime = nui.get("isNoEndTime").getValue();
			if(isNoEndTime){
				nui.get("endTime").setReadOnly(true);
				nui.get("endTime").setRequired(false);
			}else{
				nui.get("endTime").setReadOnly(false);
				nui.get("endTime").setRequired(true);
			}
		}
					        
		//日期格式化
        var formatDate = function (date) {
		    var y = date.getFullYear();
		    return y ;
		}
		
        function SaveData(){
        	if(form.validate()){
				var o = form.getData();
				var triggerType = nui.get("triggerType").getValue();
				var cronExpression;;
				var time;;
				var loopTimes;
				var incrementSeconds;
				if(triggerType == '2'){
					cronExpression = getCronExpression()
					time = nui.get("time").getValue();
				}else{
					loopTimes = nui.get("loopTimes").getValue();
					incrementSeconds = nui.get("incrementSeconds").getValue();
				}
				var taskState = nui.get("taskState").getValue();
				var ischongqi = nui.get("ischongqi").getValue();
				var description = nui.get("description").getValue();
				var jobRelname = nui.get("jobRelname").getValue();
				var scheduleInfo = {schedulerName:"default",taskName:o.task.taskName,taskType:o.task.taskType,targetQName:o.task.targetName,targetOperation:o.task.targetOperation,startTime:o.attendance.startTime,endTime:o.attendance.endTime,cronExpression:cronExpression};
	            var json = nui.encode({scheduleInfo:scheduleInfo,description:description,group:group,loopTimes:loopTimes,incrementSeconds:incrementSeconds,jobRelname:jobRelname,taskState:taskState,ischongqi:ischongqi});
	            nui.ajax({
	                url: saveURL,
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
                    	var returnJson = nui.decode(text);
		                if(returnJson.exception == null){
		                	alert("保存成功！");
	                		CloseWindow("saveSuccess");
		                }else{
			                nui.alert("保存失败", "系统提示", function(action){
		                  		if(action == "ok" || action == "close"){
		                     		
		                  		}
	                  		});
	                	}        
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
                    	alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	            });
            }else{
            	return;
            }
     	}
		
		function getCronExpression(){
			var triggerType = nui.get("triggerType").getValue();
			var cronExpression;
			if(triggerType=='2'){
				var time = nui.get("time").getValue();
				if(time !=null&&time!=""){
					var times = nui.formatDate (time,"HH:mm:ss");
					var t = times.split(":");
					var a = t[1][1];
					var b = t[0][1];
					var a1 = t[1]<10? a:t[1];
					var b1 = t[0]<10? b:t[0];
					cronExpression = "0 " + a1 + " " + b1;
				}
				var action_day = nui.get("action_day").getValue();
				var action_week = nui.get("action_week").getValue();
				var action_month = nui.get("action_month").getValue();
				var action_year = nui.get("action_year").getValue();
				if(action_day=='day'){
					cronExpression = cronExpression +" * * ? *";
				}else if(action_week == 'week'){
					var week = nui.get("week1").getValue();
					cronExpression = cronExpression +" ? * " + week + " *";
				}else if(action_month == 'month'){
					var month1 = $('input[name=month]').get(0).checked;
					if(month1){
						var month_day = nui.get("month_day").getValue();
						cronExpression = cronExpression +" " + month_day + " * ? *";
					}else{
						var month_weekOrder = nui.get("month_weekOrder").getValue();
						var month_week = nui.get("month_week").getValue();
						if(month_weekOrder=='-1'){
							cronExpression = cronExpression +" ? * " + month_week + "L *";
						}else{
							cronExpression = cronExpression +" ? * " + month_week + "#" + month_weekOrder + " *";
						}
					}
				}else if(action_year == 'year'){
					var year1 = $('input[name=year]').get(0).checked;
					if(year1){
						var year_month1 = nui.get("year_month1").getValue();
						var year_day = nui.get("year_day").getValue();
						cronExpression = cronExpression +" " + year_day + " " + year_month1 + " ? *";
					}else{
						var year_month2 = nui.get("year_month2").getValue();
						var year_weekOrder = nui.get("year_weekOrder").getValue();
						var year_week = nui.get("year_week").getValue();
						if(year_weekOrder=='-1'){
							cronExpression = cronExpression +" ? " + year_month2 + " " + year_week + "L *";
						}else{
							cronExpression = cronExpression +" ? " + year_month2 + " " + year_week + "#" + year_weekOrder + " *";
						}
					}
				}
			}
			return cronExpression;
		}
	
        //标准方法接口定义
        function CloseWindow(action) {            
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        function onOk(e) {
    		SaveData();
        }
        
        function onCancel(e) {
            CloseWindow("cancel");
        }
        
    </script>
</body>
</html>
