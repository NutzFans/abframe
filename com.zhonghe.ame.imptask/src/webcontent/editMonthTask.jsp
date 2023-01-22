<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>重点任务编辑</title>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<fieldset style="border:solid 1px #aaa;padding:3px;width:94%;height: 90%">
		<legend>月度计划详情</legend>
		 	<form id="form1" method="post" >
	        	<table style="table-layout:fixed;" id="table_file1">
			            <tr>
							<td align="right" style="width:128px"><nobr>月份：</nobr></td>
							<td  colspan="2";>
								<input class="nui-textbox" name="month" id="month" style="width:200px" readOnly="readOnly">
							</td>
							<td align="right" style="width:128px">计划完成时间：</td>
							<td  colspan="2"style="width: 130px">
								<input name="planFinishTime" id="planFinishTime"  class="nui-datepicker"  style="width: 200px" required="true"/>
							</td> 
							<!-- <td align="right" style="width:128px"><nobr>实际完成时间：</nobr></td>
							<td colspan="2"style="width: 130px"><input
									name="actualCompleteTime" id="actualCompleteTime"
									class="nui-datepicker"  style="width: 200px" /></td> -->
						</tr>
						<!--<tr>
							<td align="right" style="width:128px"><nobr>完成状态：</nobr></td>
							<td  colspan="2"><input class="nui-dictcombobox"
									dictTypeId="ZH_TASK_STATUS" name="completeStatus" shownullItem="true"
									style="width: 200px;" id="completeStatus"/> 
							 <td align="right" style="width:128px"><nobr>完成率：</nobr></td>
							<td  colspan="2">
								<input class="nui-spinner" name="completeRate" id="completeRate" style="width:150px" onvaluechanged="setTaskStatus(e)"><span>%</span>
							</td> 
						</tr>-->
						<tr>
							<td align="right" style="width:128px"><nobr>月度计划描述：</nobr></td>
							<td  colspan="8">
								<input class="nui-textarea" name="monthDescribe" id="monthDescribe" style="width:800px" required="true">
							</td>	
							
						</tr>
						<!-- <tr>
							<td align="right" style="width:128px"><nobr>进展情况：</nobr></td>
							<td colspan="8">
								<input class="nui-textarea" name="completion" id="completion" style="width:800px;height: 40px" >
							</td>
						</tr>
						<tr>
							<td align="right" style="width:128px"><nobr>问题及纠偏措施：</nobr></td>
							<td colspan="8">
								<input name="problemMeasures" id="problemMeasures" class="nui-textarea" style="width:800px;height: 40px"   />
							</td>
						</tr> -->
	        	</table>
	        </form>
    	</fieldset>
</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="appButton" style="width:80px;margin-right:20px;">保存</a>
		<!-- <a class="nui-button" onclick="onCancel('cancel')" style="width:80px;">取消</a> -->
	</div>

    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var id = <%=request.getParameter("keyId")%>;
    	var save = "0";
    	var projectno1;
    	var month;
    	var newYear = mini.formatDate (new Date(), "yyyy");
    	function init(){
    		
			var data = {"keyId":id};
			var json = nui.encode(data);
			ajaxCommon({
				"url": "com.zhonghe.ame.imptask.keytask.queryMonthTask.biz.ext",
				"data": json,
				"success": function(data) {
				 	form.setData(data.monthTaskList[0]);
		            var keyTask = data.monthTaskList[0];
				 	month = keyTask.month;
				 	nui.get("planFinishTime").setViewDate(newYear+"-"+month)
				}
			});
		}
		init();
    function setTaskStatus(e){
    	if(e.value==100){
    		nui.get("completeStatus").setValue(1)
    	}else{
    		nui.get("completeStatus").setValue(0)
    	}
    }
    	
	function submit(){
		if(!form.validate()){
			showTips("请检查表单的完整性!");
			return;
		}
		var editData = form.getData();
		if(!isMonth()){
			showTips("计划完成时间需在计划月份内")
			return
		}else{
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
    }
    
    function isMonth(){
    	
		var planFinishTime = nui.parseDate(nui.get("planFinishTime").getValue());
			planFinishTime = nui.formatDate (planFinishTime, "yyyy-M")
			newYear = newYear + "-"+month
		return (newYear==planFinishTime)
    }
  
   	</script>
</body>
</html>