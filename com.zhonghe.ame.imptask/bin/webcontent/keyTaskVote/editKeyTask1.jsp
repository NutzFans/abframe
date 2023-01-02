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
		<fieldset style="border:solid 1px #aaa;padding:10px 5px 15px;">
		<legend>重点任务基本信息</legend>
		 	<form id="form1" method="post">
	        	<table style="table-layout:fixed; border-spacing:5px"id="table_file1"  >
			            <tr>
							<td align="right" style="width:128px">重点任务名称：</td>
							<td  colspan="8";>
			        			<input class="nui-hidden "name="id" id="id">
								<input class="nui-textbox" name="taskName" id="taskName" style="width:97%"  required="true">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:128px">重点任务方向：</td>
							<td  colspan="8";>
								<input class="nui-textbox" name="taskDirection" id="taskDirection" style="width:97%"  onblur="checkProjectno"  required="true">
							</td>	
						</tr>
						<tr>
							
							<td align="right" style="width:128px">责任单位：</td>
							<td colspan="2"; style="width: 210px;"><input
									name="orgid" id="orgid"
									class="nui-combobox" 
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									onvaluechanged="changeOrgForm" style="width: 200px;"  required="true" /></td>	
							
							<td align="right" style="width:128px">年度：</td>
							<td  colspan="2";>
								<input class="mini-spinner" minValue="2021" maxValue="2100" name="declareYear" id="declareYear"  required="true" style="width:200px" shownullItem="true">
							</td>		

							<td align="right" style="width:128px"> 计划完成时间：</td>
							<td  colspan="2";  style="width: 130px"><input
									name="planCompleteTime" id="planCompleteTime"
									class="nui-datepicker"  style="width: 200px"  required="true"/></td>
								
						</tr>
						<tr>
							<td align="right" style="width:128px">总体目标：</td>
							<td  colspan="8";>
								<input class="nui-textarea"   required="true" name="populationTarget" id="populationTarget"style="width:97%;height: 70px"   >
							</td> 
						</tr>
						<tr>
							<td align="right" style="width:128px">年度目标：</td>
							<td  colspan="8";>
								<input name="yearTarget"  required="true" id="yearTarget" class="nui-textarea" style="width:97%;height: 70px"  showClose="false" allowInput="true"  />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:128px">决策情况：</td>
							<td  colspan="8";>
								<input class="nui-textarea" name="decisionSituation" id="decisionSituation"  style="width:97%;height: 70px" shownullItem="true"  >
							</td>
						</tr>
	        	</table>
	        </form>
    	</fieldset>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit" id="appButton" iconCls="icon-save" style="width: 80px;margin-right: 20px;">确认</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var id = <%=request.getParameter("id")%>;
    	function init(){
			var data = {"id":id};
			var json = nui.encode(data);
			nui.ajax({
		        url: "com.zhonghe.ame.imptask.keytask.queryKeytaskDetail.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
			            form.setData(o.keytask);
			            var keyTask = o.keytask;
			            nui.get("orgid").setText(keyTask.orgname);
				        nui.get("planCompleteTime").setText(keyTask.planCompleteTime);
			        }
			    });
		}
		init();
	function submit(){
		var editData = form.getData();
			editData.appStatus = 3;
		var editDataJson = nui.encode({"keytask":editData});
		ajaxCommon({
			"url": "com.zhonghe.ame.imptask.keytask.updateKeyTask.biz.ext",
			"data": editDataJson,
			"success": function(data) {
				showTips("更新成功重点任务成功")
				closeOk();
			}
		});
    }
	
   	</script>
</body>
</html>