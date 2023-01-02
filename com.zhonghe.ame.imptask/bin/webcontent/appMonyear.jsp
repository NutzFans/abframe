<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../purchase/common/common.jsp"%>
<html>
<head>
<title>月度计划填报</title>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
 <%long workitemid = (Long)request.getAttribute("workItemID");%> 
	<div class="nui-fit">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>重点任务基本信息</legend>
		 	<form id="form1" method="post" >
	        	<table style="table-layout:fixed;" id="table_file1">
			            <tr>
							<td align="right" style="width:128px">重点任务名称：</td>
							<td colspan="2"; >
								<input class="nui-textbox" name="taskName" id="taskName" style="width:200px" readOnly="readOnly">
							</td>
							<td align="right" style="width:128px">重点任务方向：</td>
							<td colspan="2"; >
								<input class="nui-textbox" name="taskDirection" id="taskDirection" style="width:200px" required="true" onblur="checkProjectno" readOnly="readOnly">
							</td>	
							<td align="right" style="width:128px">责任单位：</td>
							<td  colspan="2"; style="width: 210px;"><input
									name="orgId" id="orgId"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									onvaluechanged="changeOrgForm" style="width: 200px;" readOnly="readOnly" /></td>	
						</tr>
						<tr>
									
							<td align="right" style="width:128px">申报年度：</td>
							<td colspan="2"; >
								<input class="mini-spinner" minValue="2021" maxValue="2100" name="declareYear" id="declareYear" style="width:200px" shownullItem="true" readOnly="readOnly">
							</td>
									
							<td align="right" style="width:128px"> 计划完成时间：</td>
							<td colspan="2"; style="width: 130px"><input
									name="planCompleteTime" id="planCompleteTime"
									class="nui-datepicker" required="true" style="width: 200px" readOnly="readOnly"/></td>
							
						</tr>
						<tr>
							<td align="right" style="width:160px">总体目标：</td>
							<td colspan="8"; >
								<input class="nui-textarea"  name="populationTarget" id="populationTarget" style="width:950px;height: 40px" required="true" readOnly="readOnly">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">年度目标：</td>
							<td colspan="8"; >
								<input name="yearTarget" id="yearTarget" class="nui-textarea" style="width:950px;height: 40px" showClose="false" allowInput="true" required="true" readOnly="readOnly"/>
							</td>
						</tr>
						
						<tr>
						<td align="right" style="width:160px">决策情况：</td>
							<td colspan="8"; >
								<input class="nui-textarea" name="decisionSituation" id="decisionSituation" style="width:950px;height: 40px" shownullItem="true" required="true" readOnly="readOnly">
							</td>
						</tr>
						

	        	</table>
	        </form>
	        		 <fieldset style="border: solid 1px #aaa;padding: 3px;width: 1100px;">
			    <legend>重点任务月度计划 </legend>
		<div style="width:auto;">
        <!-- <div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
            <table style="width:auto;">
                <tr>
                    <td style="width:100%;">
                        <a class="nui-button" iconCls="icon-edit" onclick="edit()" plain="true">编辑</a>
                       
                    </td>
                </tr>
            </table>           
        </div> -->
	</div> 
	<div id="datagrid2" class="nui-datagrid" style="width:auto;height:auto;" dataField="monthTaskList"  url="com.zhonghe.ame.imptask.keytask.queryMonthTask.biz.ext"
 		allowResize="true" pageSize="20"  allowCellSelect="true" showPager="false">
	    <div property="columns"> 
	    	 <div name="temp123" type="checkcolumn"></div>
		        	<!-- <div type="expandcolumn" width="20"></di -->
		        	<div field="month" width="40" align="center" headerAlign="center" allowSort="true">月份</div>
		            <div field="monthDescribe" width="120" align="center" headerAlign="center" allowSort="true">月度计划描述</div>
		            <div field="planFinishTime" width="80" align="center" headerAlign="center" allowSort="true" >计划完成时间</div>
		            <div field="actualCompleteTime" width="90" align="center" headerAlign="center" allowSort="true" >实际完成时间</div>
		            <div field="completion" width="80" align="center" headerAlign="center" allowSort="true"  >完成情况</div>
		            
		            <div field="problemMeasures" width="100" align="right" headerAlign="center" allowSort="true">问题及纠偏措施</div>
		            <div field="completeStatus" width="80" align="center" headerAlign="center" renderer="check">完成状态</div>
		            
		            <!-- <div field="filepath" width="80" align="center" headerAlign="center" allowSort="true">附件</div> -->
	    </div>
	</div>
	</fieldset>  
	</div>
<jsp:include page="/ame_common/misOpinion.jsp"/>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="appButton" style="width:60px;margin-right:20px;">确定</a>
		<a class="nui-button" onclick="closeCancel()" style="width:60px;">关闭</a>
	</div>

    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var projectid = <%=request.getParameter("projectid")%>;
    	var workItemID = <%=request.getParameter("workItemID")%>;
    	var opioionform = new nui.Form("#opioionform");
    	var grid = nui.get("datagrid2");
    	function init(){ 
			var data = {workitemid:<%=workitemid%>};
			var json = nui.encode(data);
			nui.ajax({
		        url: "com.zhonghe.ame.imptask.keytask.queryTaskMngInfo.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
			            form.setData(o.keyTask);
			            nui.get("orgId").setText(o.keyTask.orgname);
						nui.get("backTo").setData(o.keyTask.backList);			            
						grid.load({id:o.keyTask.id});
			            //流程提示信息
			            // promptInit({"workItemID": <%=workitemid%>});
						//初始化处理意见
						initMisOpinion({auditstatus:"1"});

			        }
			    });
		 }
		init();
	    
	    function check(e){
			if(e.value==1){
			return "已完成";
			}else{
			return "未完成";
			}
		}
	    	
    	
    	//修改投标明细
		function edit(){
    		var row = grid.getSelecteds();
			if (row.length > 1) {
    			nui.alert("只能选中一条项目记录进行编辑");
    		}else{
    			var row=row[0];
    			console.log(row.id);
			if (row) {
				nui.open({
					url: "/default/imptask/editMonthTask.jsp?keyId="+row.id,
					width: 1000,
					height: 550,
					onload: function () {
						var iframe = this.getIFrameEl();
					},
					ondestroy: function (action) {
	            		if(action=="ok"){
	            			grid.reload();
	            		}
	            	}
				}) 
			
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
    		}
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
		  			url: "com.zhonghe.ame.imptask.keytask.appMonthTask.biz.ext",
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
								//nui.get("sureButton").setEnabled(true);
							    CloseWindow("ok");
								
							});
						}
					},
					error: function(jqXHR, textStatus, errorThrown){
						alert(jqXHR.responseText);
					}
		  		})  

	}
	
    
    //设置日期格式
	function onDealDate(e){
		if(e.cellHtml){
			return e.cellHtml.substring(0,10);
		}
	}
	
   	</script>
</body>
</html>