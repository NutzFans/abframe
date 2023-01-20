<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>月度计划填报</title>
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
		<fieldset style="border:solid 1px #aaa;padding:10px 5px 15px;">
		<legend>重点任务基本信息</legend>
		 	<form id="form1" method="post"  style="width:100%;height:100%" >
	        	<table style="table-layout:fixed; border-spacing:5px " id="table_file1"  >
	        			<input class="nui-hidden" id="keytaskId" >
			            <tr>
							<td align="right" style="width:128px">重点任务名称：</td>
							<td  colspan="2";>
								<input class="nui-textbox" name="taskName" id="taskName" style="width:200px" readOnly="readOnly">
							</td>
							<td align="right" style="width:128px">重点任务方向：</td>
							<td  colspan="2";>
								<input class="nui-textbox" name="taskDirection" id="taskDirection" style="width:200px" required="true" onblur="checkProjectno" readOnly="readOnly">
							</td>	
							<td align="right" style="width:128px">责任单位：</td>
							<td  colspan="2" style="width: 210px;"><input
									name="orgId" id="orgId"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									onvaluechanged="changeOrgForm" style="width: 241px;" readOnly="readOnly" /></td>	
						</tr>
						<tr>
						
							
							<td align="right" style="width:128px">年度：</td>
							<td  colspan="2";>
								<input class="nui-dictcombobox" dictTypeId="YEAR_TYPE" name="declareYear" id="declareYear" style="width:200px" shownullItem="true" readOnly="readOnly">
							</td>		
							
							<td align="right" style="width:128px"> 计划完成时间：</td>
							<td style="width: 130px"><input
									name="planCompleteTime" id="planCompleteTime"
									class="nui-datepicker" required="true" style="width: 200px" readOnly="readOnly"/></td>
							
						</tr>
						
						
						<tr>
							<td align="right" style="width:128px">决策情况：</td>
							<td  colspan="8";>
								<input class="nui-textarea" name="decisionSituation" id="decisionSituation"  style="width:950px;height: 40px" shownullItem="true" required="true" readOnly="readOnly">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:128px">完成情况：</td>
							<td  colspan="8";>
								<input class="nui-textarea" dictTypeId="zh_keytaskstatus" name="completion" id="completion"  style="width:950px;height: 40px"  shownullItem="true" readOnly="readOnly">
							</td>
						</tr>
						
						<tr>
							<!-- <td align="right" style="width:160px">完成状态：</td>
							<td>
								<input class="nui-dictcombobox" dictTypeId="zh_keytaskstatus" name="completeStatus" id="completeStatus" style="width:250px" shownullItem="true" readOnly="readOnly">
							</td> -->
							<td align="right" style="width:128px">年度目标：</td>
							<td  colspan="8";>
								<input name="yearTarget" id="yearTarget" class="nui-textarea" style="width:950px;height: 50px" showClose="false" allowInput="true" required="true" readOnly="readOnly"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width:128px">总体目标：</td>
							<td  colspan="8";>
							<input class="nui-textarea"  name="populationTarget" id="populationTarget" style="width:950px;height: 50px" required="true" readOnly="readOnly">
							</td>
						</tr>

	        	</table>
	        </form>
    	</fieldset>
		 <fieldset style="border: solid 1px #aaa;padding: 3px;width: 97%;">
			    <legend>重点任务月度计划 </legend>
		<div style="width:auto;">
        <div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
            <table style="width:auto;">
                <tr>
                    <td style="width:97%;">
                        
                    </td>
                </tr>
            </table>           
        </div>
	</div> 
	<div id="datagrid2" class="nui-datagrid" style="width:97%;height:auto;" allowResize="true"  showpager="false">
	    <div property="columns"> 
	    	 <div name="temp123" type="checkcolumn"></div>
		        	<!-- <div type="expandcolumn" width="20"></di -->v>
		        	<div field="month" width="40" align="center" headerAlign="center" allowSort="true">月份</div>
		            <div field="monthDescribe" width="120" align="center" headerAlign="center" allowSort="true">月度计划描述</div>
		             <!--  <div field="planFinishTime" width="80" align="center" headerAlign="center" allowSort="true" >计划完成时间</div>-->
		         	 <div field="actualCompleteTime" width="90" align="center" headerAlign="center" allowSort="true" >实际完成时间</div> 
		            <div field="completion" width="80" align="center" headerAlign="center" allowSort="true"  >完成情况</div>
		            <div field="orgname" width="120" align="center" headerAlign="center" >责任单位</div>
		            <div field="problemMeasures" width="100" align="center" headerAlign="center" allowSort="true">问题及纠偏措施</div>
		            <div field="completeStatus" width="80" align="center" headerAlign="center" renderer="check">完成状态</div>
		            <div field="completeRate" width="80" align="center" headerAlign="center" >完成率（%）</div>
		            <!-- <div field="filepath" width="80" align="center" headerAlign="center" allowSort="true">附件</div> -->
	    </div>
	</div>
	</fieldset>

    <script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");
	var processInstID = <%=request.getParameter("processInstID")%>;   	
	var grid = nui.get("datagrid2");
	var appContext = "<%=request.getContextPath()%>";

	initData();
	function initData(){
		$.ajax({
			url:appContext+"/com.zhonghe.ame.imptask.keytask.queryTackMonthByProcessInstID.biz.ext",
			type:"POST",
			contentType:'application/json',
			data:nui.encode({processInstID: processInstID}),
				success:function(data){				
					if(!!data.keytaskMngs && data.keytaskMngs.length != 0){											
						var keyTask = (data.keytaskMngs)[0];
						nui.get("taskName").setValue(keyTask.taskName);
			            nui.get("taskDirection").setValue(keyTask.taskDirection);		            
			            nui.get("orgId").setValue(keyTask.orgId);
				        nui.get("planCompleteTime").setValue(keyTask.planCompleteTime);
				        nui.get("completion").setValue(keyTask.completion);
				        nui.get("yearTarget").setValue(keyTask.yearTarget);
				        nui.get("populationTarget").setValue(keyTask.populationTarget);
				        nui.get("decisionSituation").setValue(keyTask.decisionSituation);
			            nui.get("declareYear").setValue(keyTask.declareYear);
			            nui.get("keytaskId").setValue(keyTask.id);
			            var grid2 = nui.get("datagrid2");
						grid2.setData(data.taskMonths);
						
					}					
			}
		});
	}
	
		
    function check(e){
		if(e.value==1){
			return "已完成";
		}else if(e.value==0){
			return "未完成";
		}else{
			return "";
		}
	}
	
	function CloseWindow(action) {            
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }

    function onCancel(e) {
        CloseWindow("cancel");
    }
    

   	</script>
</body>
</html>