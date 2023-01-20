<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>重点任务申报-部门领导审批</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<%long workitemid = (Long)request.getAttribute("workItemID");%>
	<div class="nui-fit">
		<!-- <fieldset style="border:solid 1px #aaa;padding:10px 5px 15px; width:80%;height: 400px;"> -->
		<fieldset style="border:solid 1px #aaa;padding:10px 5px 15px;">
		<legend>重点任务基本信息</legend>
		 	<!-- <form id="form1" method="post" > -->
		 	<form id="form1" method="post"  style="width:100%;height:100%" >
		 		<table style="table-layout:fixed; border-spacing:5px " id="table_file1"  >
	        	<!-- <table style="table-layout:fixed;" id="table_file1"> -->
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
							<td colspan="2" style="width: 210px;"><input
									name="orgId" id="orgId"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									onvaluechanged="changeOrgForm" style="width: 241px;" readOnly="readOnly" /></td>	
						</tr>
						<tr>
							<!-- <td align="right" style="width:128px">实际完成时间：</td>
							<td style="width: 130px"><input
									name="actualCompleteTime" id="actualCompleteTime"
									class="nui-datepicker"  style="width: 120px" readOnly="readOnly"/></td> -->
									
							<td align="right" style="width:128px">年度：</td>
							<td  colspan="2";>
								<input class="nui-datepicker"  name="declareYear" id="declareYear" style="width:200px" shownullItem="true" readOnly="readOnly">
							</td>
									
							<td align="right" style="width:128px"> 计划完成时间：</td>
							<td colspan="2"; style="width: 130px"><input
									name="planCompleteTime" id="planCompleteTime"
									class="nui-datepicker" required="true" style="width: 200px" readOnly="readOnly"/></td>
						</tr>
						
						<tr>
							<td align="right" style="width:160px">决策情况：</td>
							<td  colspan="8";>
								<input class="nui-textarea" name="decisionSituation" id="decisionSituation" style="width:950px;height: 40px" shownullItem="true" required="true" readOnly="readOnly">
							</td>
						</tr>
						
						<tr>
							<td align="right" style="width:160px">完成情况：</td>
								<td  colspan="8";>
									<input class="nui-textarea" dictTypeId="zh_keytaskstatus" name="completion" id="completion" style="width:950px;height: 40px" shownullItem="true" readOnly="readOnly">
							</td>
						</tr>
						
						<tr>
							<!-- <td align="right" style="width:160px">完成状态：</td>
							<td>
								<input class="nui-dictcombobox" dictTypeId="zh_keytaskstatus" name="completeStatus" id="completeStatus" style="width:250px"    readOnly="readOnly">
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
						
						<tr>
							<td align="right" style="width:128px"> 问题及纠偏措施：</td>
							<td  colspan="8";>
								<input class="nui-textarea"  name="problemMeasures" id="problemMeasures" style="width:950px;height: 50px" shownullItem="true" readOnly="readOnly">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:128px">备注：</td>
							<td  colspan="8";>
								<input class="nui-textarea" name="remark" id="remark" onvaluechanged="changeexpcontsum" style="width:950px;height: 50px" readOnly="readOnly">
							</td>
						</tr>

	        	</table>
	        </form>
    	</fieldset>
<fieldset style="width: auto">
<jsp:include page="/ame_common/misOpinion.jsp"/>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="appButton" style="width:60px;margin-right:20px;">确定</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
	
    <script type="text/javascript">
		nui.parse();
		
    	var form = new nui.Form("form1");
    	var projectid = <%=request.getParameter("projectid")%>;
    	var workItemID = <%=request.getParameter("workItemID")%>;
    	var opioionform = new nui.Form("#opioionform");
    	//console.log(workItemID);
    	var grid_cont = nui.get("grid_cont");//项目合同
    	var save = "0";
    	var projectno1;
    	var remindfz = nui.getDictText('AME_SYSCONF',"projectYZ");
    	function init(){
			var data = {workitemid:<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
		        url: "com.zhonghe.ame.imptask.keytask.queryTaskInfo.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
			            form.setData(o);
			            
			            
						
			            
			            nui.get("taskName").setValue(o.keyTask.taskName);
			            nui.get("taskDirection").setValue(o.keyTask.taskDirection);
			            nui.get("orgId").setText(o.keyTask.orgname);
				        nui.get("planCompleteTime").setValue(o.keyTask.planCompleteTime);
				        nui.get("completion").setValue(o.keyTask.completion);
				        
				        
				        nui.get("yearTarget").setValue(o.keyTask.yearTarget);
				        nui.get("populationTarget").setValue(o.keyTask.populationTarget);
				        nui.get("decisionSituation").setValue(o.keyTask.decisionSituation);
				        nui.get("problemMeasures").setValue(o.keyTask.problemMeasures);
			            nui.get("remark").setValue(o.keyTask.remark);
			            nui.get("declareYear").setValue(o.keyTask.declareYear);
			            //流程提示信息
			            // promptInit({"workItemID": <%=workitemid%>});
			            //审核意见
			        	//var processinstid = nui.get("processinstid").getValue();
						var grid = nui.get("datagrid1");
						grid.load({processInstID:o.keyTask.processid});
						grid.sortBy("time", "desc");
						//初始化处理意见
						
		            	//相关人员初始化
			        }
			    });
		}
		init();
	    	
    	
    	
    	

	//对应类型业务字典
	function dictGetType(e){
		return nui.getDictText('AME_PROCONT',e.value);
	}
	
	function submit(){
	    	var auditstatus = nui.get("auditstatus").getValue();
	    	console.log(auditstatus);
	    	if(auditstatus == "2"){	//终止流程
	    		titleText = "终止";
	    		submitProcess("终止");
	    	}else if(auditstatus == "0"){	//退回流程
	    		if(!nui.get("backTo").getValue()){
	    			nui.alert("退回环节不能为空！");
	    			return;
	    		}
	    		titleText = "退回";
	    		submitProcess("退回");
	    	}else if(auditstatus == "1"){	//提交流程
	    		titleText = "提交";
	    		submitProcess("提交");
	    	}
    }
	
	
	
	 // 提交 
    function submitProcess(title){
    	nui.confirm("确定" + title + "流程吗？", "操作提示",function (action) {            
            if (action == "ok") {
				var misOpinion = opioionform.getData().misOpinion;//审核意见
            	nui.get("appButton").setEnabled(false);
            	var json = {misOpinion:misOpinion,workItemID: <%=workitemid %>};
            	saveData(json);
            }
        });
    }
    

	function updateRdproject(){
		if(form.validate()){
			if(!checkTime()){
				return;
			}else{
				form2.submit();
			}
		}else{
			alert("请检查表单的完整性!");
			return;
		}
	}
	
	
	function saveData(json){
			console.log(json);
			mini.mask({
		            el: document.body,
		            cls: 'mini-mask-loading',
		            html: titleText+'中...'
		        });
		    	 nui.ajax({
		    	 	
		  			url: "com.zhonghe.ame.imptask.keytask.approvalTask.biz.ext",
					type: "post",
					data: json,
					contentType: "text/json",
					success: function (o){
						nui.unmask(document.body);
						if(o.result == "success"){
				        	nui.alert(titleText + "成功","系统提示",function(){
				        		//nui.get("sureButton").setEnabled(true);
				        		CloseWindow("ok");
				        	});
						}else{
							nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
								
							    CloseWindow("ok");
							});
						}
					},
					error: function(jqXHR, textStatus, errorThrown){
						
						alert(jqXHR.responseText);
					}
		  		}) 
	
	
	
	
	}
	
	
	function CloseWindow(action) {            
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }

    function onCancel(e) {
        CloseWindow("cancel");
        window.opener.search();
    }
    
    //设置日期格式
	function onDealDate(e){
		if(e.cellHtml){
			return e.cellHtml.substring(0,10);
		}
	}
	
	//单元格开始编辑前，判断对应类型是否合同编号，如果是则允许编辑合同订单，如果不是则不允许编辑合同订单
	function checkOrder(e){
		if(e.field=="contorderno"){
			if(e.record.proconttype=="1"){
				e.cancel = true;
			}
		}
	}
	
	//当项目合同对应类型为项目与合同对应时清空合同订单
	function clearOrder(e){
		if(e.field=="proconttype"){
			if(e.value=="1"){
				var row = e.record;
				var rowData = {"contorderno":""};
				grid_cont.updateRow(row,rowData);
			}
		}
	}
	//预计合同改变 + 预计合同额expcontsum数字验证
	function changeexpcontsum(e){
		var remindfz = nui.get("remindfz").getValue();
		if(!remindfz){//如果为空，则根据预计合同额按比例计算
			calRemindfz();
		}
		//预计合同额expcontsum数字验证
		checkNum1();
	}
	
	//按比例计算阈值
	function calRemindfz(){
		var expcontsum = nui.get("expcontsum").getValue();
		if(!expcontsum){
			nui.alert("请先填写预计合同额！");
			return;
		}else{
			var projectYZRatio = nui.getDictText('AME_SYSCONF','projectYZRatio');//比例
			var remindfz = Math.round(parseFloat(expcontsum)*parseFloat(projectYZRatio));
			nui.get("remindfz").setValue(remindfz);
		}
	}
	
	
	//是否是数字
  	function IsNumber(num){
		var strRegex = "^\\d+(\\.\\d+)?$";
		var re=new RegExp(strRegex); 
		//re.test()
		if (re.test(num)){
			return (true); 
		}else{ 
			return (false); 
		}
	}
	
	//预计合同额expcontsum数字验证
	function checkNum1(){
		var expcontsum = nui.get("expcontsum").getValue();
		if(IsNumber(expcontsum)==false){
			alert("请输入正确数字格式！");
			nui.get("expcontsum").setValue("");
			return;
		}
	}
	
   	</script>
</body>
</html>