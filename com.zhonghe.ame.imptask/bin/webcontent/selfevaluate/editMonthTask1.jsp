<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>重点任务月度计划编辑</title>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<fieldset style="border:solid 1px #aaa;padding:3px;width:97%;height: 90%">
		<legend>月度计划详情</legend>
		 	<form id="form1" method="post" >
	        	<table style="table-layout:fixed;" id="table_file1">
			            <tr>
							<td align="right" style="width:128px"><nobr>月份：</nobr></td>
							<td  colspan="2">
								<input class="nui-textbox" name="month" id="month" style="width:200px" readOnly="readOnly">
							</td>
							<td align="right" style="width:128px"><nobr>完成状态：</nobr></td>
							<td  colspan="2">
								<input class="nui-dictcombobox" readonly="readonly"
									dictTypeId="ZH_TASK_STATUS" name="completeStatus"  id ="completeStatus" shownullItem="true"
									style="width: 200px;" /> 
							</td>
							<td align="right" style="width:128px"><nobr>完成率：</nobr></td>
							<td  colspan="2" >
								<input class="nui-spinner" name="completeRate" id="completeRate" onvaluechanged="setTaskStatus(e)" required="true" style="width:100px" ><span>%</span>
								<td>
							</td>		
						</tr>
						<tr>
							<td align="right" style="width:128px">计划完成时间：</td>
							<td  colspan="2"style="width: 130px"><input
									name="planFinishTime" id="planFinishTime"
									class="nui-datepicker"  style="width: 200px" />
							</td> 
							<td align="right" style="width:128px"><nobr>实际完成时间：</nobr></td>
							<td colspan="2" style="width: 130px"><input viewDat="2021-01-01"
									name="actualCompleteTime" id="actualCompleteTime"
									class="nui-datepicker"  style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:128px"><nobr>月度计划描述：</nobr></td>
							<td  colspan="8">
								<input class="nui-textarea" name="monthDescribe" id="monthDescribe" style="width:800px;height: 40px"  >
							</td>	
						</tr>
						<tr>
							<td align="right" style="width:128px"><nobr>问题及纠偏措施：</nobr></td>
							<td colspan="8">
								<input name="problemMeasures" id="problemMeasures" class="nui-textarea" style="width:800px;height: 40px"  />
							</td>
						</tr>
						
						<tr>
						<td align="right" style="width:128px"><nobr>进展情况：</nobr></td>
							<td colspan="8" >
								<input class="nui-textarea" name="completion" id="completion" style="width:800px;height: 40px" required="true">
							</td>
						</tr>
	        	</table>
	        </form>
    	</fieldset>
    	</div>
<fieldset style="width:auto">
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="appButton" style="width:80px;margin-right:20px;">更新</a>
		<a class="nui-button" onclick="closeCancel()" style="width:80px;">取消</a>
	</div>
</fieldset>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");
	
	var id = <%=request.getParameter("keyId")%>;  	
	var type = <%=request.getParameter("type")%>;
	var newYear = mini.formatDate (new Date(), "yyyy");	
	var month;
	function init(){		
		var data = {"keyId":id};
		var json = nui.encode(data);
		ajaxCommon({
			"url": "com.zhonghe.ame.imptask.keytask.queryMonthTask.biz.ext",
			"data": json,
			"success": function(data) {
			 	if(type==0){
        			nui.get("monthDescribe").setReadOnly("true");// 月度计划描述     			
        			nui.get("planFinishTime").setReadOnly("true");// 计划完成时间
        		}
        		var keyTask = data.monthTaskList[0];
	            form.setData(keyTask);
	            month = keyTask.month
    			nui.get("actualCompleteTime").setViewDate(newYear+"-"+month);// 计划完成时间
			}
		});
	}
	//数据初始化加载
	init();
	
	function submit(){	
		var editData = form.getData()			 
		var json = {"taskMonth":editData,"id":id};			
    	ajaxCommon({
			"url": "com.zhonghe.ame.imptask.keytask.updateMonthTask.biz.ext",
			"data": json,
			"success": function(data) {
			 	if(data.result == "success"){
		        	showTips("更新成功")
        			closeOk();
				}else{
					showTips("提交失败")
					closeOk();
				}
			}
		});
    }
	
	function setTaskStatus(e){
    	if(e.value==100){
    		nui.get("completeStatus").setValue(1)
    	}else{
    		nui.get("completeStatus").setValue(0)
    	}
    }
   	</script>
</body>
</html>