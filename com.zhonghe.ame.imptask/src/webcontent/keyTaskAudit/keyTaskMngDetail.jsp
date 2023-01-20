<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>重点任务查看</title>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>重点任务基本信息</legend>
		 	<form id="form1" method="post" >
	        	<table style="table-layout:fixed;" id="table_file1">
			            <tr>
							<td align="right" style="width:128px">重点任务名称：</td>
							<td  colspan="7">
								<input class="nui-textbox" name="taskName" id="taskName" style="width:100%" readOnly="readOnly">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:128px">重点任务方向：</td>
							<td  colspan="7">
								<input class="nui-textbox" name="taskDirection" id="taskDirection" style="width:100%" required="true" onblur="checkProjectno" readOnly="readOnly">
							</td>
						</tr>
						<tr>	
							<td align="right" style="width:128px">责任单位：</td>
							<td  colspan="7" style="width: 210px;"><input
									name="orgId" id="orgId"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									onvaluechanged="changeOrgForm" style="width: 100%;" readOnly="readOnly" />
							</td>	
						</tr>
						
						<tr>
							<td align="right" style="width:128px">年度：</td>
							<td  colspan="2">
								<input class="nui-textbox"  name="declareYear" id="declareYear" style="width:200px" shownullItem="true" readOnly="readOnly">
							</td>
						
							<td align="right" style="width:128px"> 计划完成时间：</td>
							<td colspan="2"style="width: 130px"><input
									name="planCompleteTime" id="planCompleteTime"
									class="nui-datepicker" required="true" style="width: 230px" readOnly="readOnly"/></td>
							<td align="right" style="width:128px"> 实际完成时间：</td>
							<td colspan="2" style="width: 130px"><input
									name="actualCompleteTime" id="actualCompleteTime"  readOnly="readOnly"
									class="nui-datepicker" style="width: 250px"/></td>
							
						</tr>
						<tr>
							<td align="right" style="width:128px">年度目标：</td>
							<td  colspan="8">
								<input name="yearTarget" id="yearTarget" class="nui-textarea" style="width:950px;height: 40px" showClose="false" allowInput="true"  readOnly="readOnly"/>
							</td>
						<tr>
							<td align="right" style="width:128px">总体目标：</td>
							<td  colspan="8";>
								<input class="nui-textarea"  name="populationTarget" id="populationTarget" style="width:950px;height: 40px"  readOnly="readOnly">
							</td>
						</tr>
						<!-- <tr>
							<td align="right" style="width:128px">进展情况：</td>
							<td  colspan="8">
								<input class="nui-textarea" dictTypeId="zh_keytaskstatus" name="completion" id="completion" style="width:950px;height:40px" shownullItem="true"  readOnly="readOnly">
							</td>
						</tr> -->
						<tr>
							<td align="right" style="width:128px">决策情况：</td>
							<td  colspan="8">
								<input class="nui-textarea" name="decisionSituation" id="decisionSituation" style="width:950px;height: 40px" shownullItem="true"  readOnly="readOnly">
							</td>
						</tr>

	        	</table>
	        </form>
    	</fieldset>
		<fieldset style="border: solid 1px #aaa;padding: 3px;width: 1080px;">
			    <legend>重点任务月度计划 </legend>
		<div style="width:auto;">
        <div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
            <table style="width:auto;">
                <tr>
                    <td style="width:100%;">
						<!--<a class="nui-button" iconCls="icon-export" onclick="exportMonthPlan()" plain="true">导出</a>-->
                    </td>
                </tr>
            </table>           
        </div>
	</div> 
	<div id="datagrid2" class="nui-datagrid" style="width:auto;height:auto;" dataField="monthTaskList"  url="com.zhonghe.ame.imptask.keytask.queryMonthTask.biz.ext"
		 allowResize="true" pageSize="20" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" showPager="false">
	    <div property="columns"> 
	    	 <div name="temp123" type="checkcolumn"></div>
		        	<!-- <div type="expandcolumn" width="20"></div> -->
		        	<div field="month" width="40" align="center" headerAlign="center" allowSort="true">月份</div>
		            <div field="monthDescribe" width="120" align="center" headerAlign="center" allowSort="true">月度计划描述</div>
		            <div field="planFinishTime" width="80" align="center" headerAlign="center" allowSort="true" >计划完成时间</div>
		            <div field="actualCompleteTime" width="90" align="center" headerAlign="center" allowSort="true" >实际完成时间</div>
		            <div field="completion" width="80" align="center" headerAlign="center" allowSort="true"  >进展情况</div>
		            <div field="orgname" width="120" align="center" headerAlign="center" >责任单位</div>
		            <div field="completeRate" width="150" align="center" headerAlign="center">完成率（%）</div>
		            <div field="completeStatus" width="150" align="center" headerAlign="center" renderer="check">完成状态</div>
		            <div field="problemMeasures" width="100" align="center" headerAlign="center" allowSort="true">问题及纠偏措施</div>
		           <!--  <div field="filepath" width="80" align="center" headerAlign="center" allowSort="true">附件</div> -->
	    </div>
	</div>
	</fieldset>
</div>
    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var workItemID = <%=request.getParameter("workItemID")%>;
    	var id = <%=request.getParameter("id")%>;
    	
    	var appContext = "<%=request.getContextPath()%>";

    	var grid = nui.get("datagrid2");
    	
    	function init(){ 
			var data = {"id":id};
			var json = nui.encode(data);
			ajaxCommon({
				"url": "com.zhonghe.ame.imptask.newKeytaskMng.getKeytaskMngById.biz.ext",
				"data": json,
				"success": function(data) {
					form.setData(data.data);
					grid.load({id:data.data.id});
				}
			});	
		 }
		init();
	    
	    function exportMonthPlan(){
			if(!confirm("是否确认导出？")){
				return;
			}
			
			var json =  nui.encode({"keyId":ida});
			nui.ajax({
				url: "com.zhonghe.ame.imptask.keytask.exportMonthPlan.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		nui.unmask();
		     		var filePath = o.downloadFile;
		        	var fileName = "重点任务-"+nui.get("taskName").getValue()+"月度计划";
		        	var myDate = new Date();
		        	var year = myDate.getFullYear();
		        	var month = myDate.getMonth()+1;
		        	var day = myDate.getDate();
		        	var hours = myDate.getHours();
		        	var minutes = myDate.getMinutes();
		        	var seconds = myDate.getSeconds();
		        	var curDateTime = year;
		        	if(month>9){
						curDateTime = curDateTime + "" + month;
					}else{
						curDateTime = curDateTime + "0" + month;
						}
		        	if(day>9){
						curDateTime = curDateTime + day;
					}else{
						curDateTime = curDateTime + "0" + day;
						}
					if(hours>9){
						curDateTime = curDateTime + hours;
					}else{
						curDateTime = curDateTime + "0" + hours;
						}
					if(minutes>9){
						curDateTime = curDateTime + minutes;
					}else{
						curDateTime = curDateTime + "0" + minutes;
						}
					if(seconds>9){
						curDateTime = curDateTime + seconds;
					}else{
						curDateTime = curDateTime + "0" + seconds;
					}
					fileName = fileName + "_" + curDateTime + ".xls";
					var frm = document.getElementById("viewlist1");
		        	frm.elements["downloadFile"].value = filePath;
		        	frm.elements["fileName"].value = fileName;
				    frm.submit();
		        },
		        error: function () {
		        	alert("error");
		        }
			});
		}
	    
	    function check(e){
			if(e.row.orgname!==null){
				return "已完成";
			}else{
				return "";
			}
		}
	
	function CloseWindow(action) {            
        if (action == "close" && form.isChanged()) {
            if (confirm("是否关闭窗口？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }

    function onCancel(e) {
        CloseWindow("cancel");
    }
	

   	</script>
</body>
</html>