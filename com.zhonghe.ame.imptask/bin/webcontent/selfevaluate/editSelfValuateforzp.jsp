<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>重点任务自评</title>
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
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>重点任务基本信息</legend>
		 	<form id="form1" method="post" >
	        	<table style="table-layout:fixed;" id="table_file1">
	        	
			            <tr>
							<td align="right" style="width:128px">重点任务名称：</td>
							<td  colspan="2";>
								<input class="nui-textbox" name="taskName" id="taskName" style="width:950px" readOnly="readOnly">
							</td>
						</tr>
						<tr>	
							<td align="right" style="width:128px">重点任务方向：</td>
							<td  colspan="2";>
								<input class="nui-textbox" name="taskDirection" id="taskDirection" style="width:950px" required="true" onblur="checkProjectno" readOnly="readOnly">
							</td>
						
						<tr>
							<td align="right" width="10%">责任单位：</td>
							<td  colspan="7" >
									<input
									name="orgId" id="orgId"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									onvaluechanged="changeOrgForm" style="width: 20%;" readOnly="readOnly" />
									
									<span>年度:</span>
									<input class="nui-textbox"   name="declareYear" id="declareYear"  shownullItem="true" readOnly="readOnly">
									
									<span>计划完成时间: </span>
									<input name="planCompleteTime" id="planCompleteTime" class="nui-datepicker" required="true" style="width: 20%" readOnly="readOnly"/>
									
									<span>实际完成时间:</span>
									<input name="actualCompleteTime" id="actualCompleteTime"  readOnly="readOnly" class="nui-datepicker" style="width: 24%"/>
							</td>	
							
						</tr>
						<tr>
							<td align="right" style="width:128px">决策情况：</td>
							<td  colspan="8";>
								<input class="nui-textarea" name="decisionSituation" id="decisionSituation" style="width:950px;height: 40px" shownullItem="true"  readOnly="readOnly">
							</td>
						</tr>
						
						<tr>
							
						</tr>
								<td align="right" style="width:128px">年度目标：</td>
								<td  colspan="8";>
									<input name="yearTarget" id="yearTarget" class="nui-textarea" style="width:950px;height: 40px" showClose="false" allowInput="true"  readOnly="readOnly"/>
								</td>
						<tr>
							<td align="right" style="width:128px">总体目标：</td>
							<td  colspan="8";>
								<input class="nui-textarea"  name="populationTarget" id="populationTarget" style="width:950px;height: 40px"  readOnly="readOnly">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:128px">完成情况：</td>
							<td  colspan="8";>
								<input class="nui-textarea" dictTypeId="zh_keytaskstatus" name="completion" id="completion" style="width:950px;height:40px" shownullItem="true"  readOnly="readOnly">
							</td>
						</tr>

	        	</table>
	        </form>
    	</fieldset>
    	
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
			<legend>上传附件</legend>
			<jsp:include page="/ame_common/inputFile.jsp"/>
		</fieldset>
    	
		<fieldset style="border: solid 1px #aaa;padding: 3px;width: 1080px;">
			    <legend>重点任务月度计划 </legend>
		<div style="width:auto;">
        <div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
            <table style="width:auto;">
                <tr>
                    <td style="width:100%;">
						<a class="nui-button" iconCls="icon-export" onclick="exportMonthPlan()" plain="true">导出</a>
                    </td>
                </tr>
            </table>           
        </div>
	</div> 
	<div id="datagrid2" class="nui-datagrid" style="width:auto;height:auto;" dataField="monthTaskList"  url="com.zhonghe.ame.imptask.keytask.queryMonthTask.biz.ext"
 allowResize="true" pageSize="20" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" showPager="false">
	    <div property="columns"> 
	    	 <div name="temp123" type="checkcolumn"></div>
		        	<div field="month" width="40" align="center" headerAlign="center" allowSort="true">月份</div>
		            <div field="monthDescribe" width="120" align="center" headerAlign="center" allowSort="true">月度计划描述</div>
		            <div field="planFinishTime" width="80" align="center" headerAlign="center" allowSort="true" >计划完成时间</div>
		            <div field="actualCompleteTime" width="90" align="center" headerAlign="center" allowSort="true" >实际完成时间</div>
		            <div field="completion" width="80" align="center" headerAlign="center" allowSort="true"  >进展情况</div>
		            <div field="completeRate" width="150" align="center" headerAlign="center">完成率（%）</div>
		            <div field="completeStatus" width="150" align="center" headerAlign="center" renderer="getValueStatus">完成状态</div>
		            <div field="problemMeasures" width="100" align="center" headerAlign="center" allowSort="true">问题及纠偏措施</div>
		          	
	    </div>
	</div>
	</fieldset>
	<div class="nui-fit">
		<fieldset style="border:solid 1px #aaa;padding:3px; width:97%;height:80%; ">
		<legend>重点任务自评</legend>
		 	<form id="form2" method="post" >
	        	<table style="table-layout:fixed;  " id="table_file1"  >
	        			<tr>
	        				<td align="right" style="width:15%">重点任务名称：</td>
							<td style="width: 20%;"><input
									name="keytaskId" id="keytaskId"
									class="nui-combobox" required="true"
									url="com.zhonghe.ame.imptask.selfValuater.getNeedSelfValuate.biz.ext"
									filterType="like" textField="taskName" valueField="keytaskId"
									dataField="needSelfValuates" valueFromSelect="true" allowInput="true"
									style="width:100%" /></td>
									
							<td align="right" style="width:15%">年度得分预测(分)：</td>
							<td style="width: 10%;">
								<input class="nui-spinner" maxValue="999999999" name="annualFractionForecast" id="annualFractionForecast" style="width:100%" required="true">
							</td>
									
							<td align="right" style="width:15%">完成率：</td>
							<td style="width: 10%;">
								<input align="right" class="nui-spinner" name="completeRate" id="completeRate" style="width:100%" required="true">
								<td>%</td>
							</td>
							
						</tr>
						<tr>
						<td align="right" style="width:15%">年度完成率预测：</td>
							<td style="width: 10%;">
								<input align="right" class="nui-spinner" name="completeRateYc" id="completeRateYc" style="width:100%" required="true">
								<td>%</td>
							</td>
						</tr>
						<tr>
						<td align="right" style="width:15%">进展情况：</td>
							<td style="width:20%" colspan="5"><input
									name="progress" id="progress" required="true"
									class="nui-textarea"  style="width: 100%" /></td>
						</tr>
			            <tr>
			            
			            <td align="right" style="width:15%" > 年度完成情况预测：</td>
							<td style="width:20%" colspan="5"><input
									name="annualCompeteForecast"  required="true" id="annualCompeteForecast"
									class="nui-textarea"    style="width: 100% " /></td>
						</tr>
						<tr>
						<td align="right" style="width:15%">备注：</td>
						<td style="width:20%" colspan="5" ><input class="nui-textarea" required="true"
									dictTypeId="ZH_TASK_STATUS" id="remark"  name="remark" shownullItem="true"
									style="width:100%"  /> 
						</tr>

	        	</table>
	        </form>
    	</fieldset>
       </div> 
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="appButton" style="width:60px;margin-right:20px;">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>

    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var form2 = new nui.Form("form2");
    	var id = <%=request.getParameter("id")%>;
    	var keytaskId = <%=request.getParameter("keytaskId")%>;
    	var gaid22 = nui.get("datagrid22");
    	var grid_cont = nui.get("grid_cont");//项目合同
    	var save = "0";
    	var projectno1;
    	var remindfz = nui.getDictText('AME_SYSCONF',"projectYZ");
		
		var grid = nui.get("datagrid2");
    	init2();
    	function init2(){ 
			var data = {workitemid:keytaskId};
			var json = nui.encode(data);
			
			nui.ajax({		
		        url: "com.zhonghe.ame.imptask.keytask.queryxxbjMngInfo.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
			            //form.setData(o);
			             nui.get("taskName").setValue(o.keyTask.taskName);
			            nui.get("taskDirection").setValue(o.keyTask.taskDirection);
			            nui.get("orgId").setText(o.keyTask.orgname);
				        nui.get("planCompleteTime").setValue(o.keyTask.planCompleteTime);
				        nui.get("completion").setValue(o.keyTask.completion);
				        nui.get("yearTarget").setValue(o.keyTask.yearTarget);
				        nui.get("populationTarget").setValue(o.keyTask.populationTarget);
				        nui.get("decisionSituation").setValue(o.keyTask.decisionSituation);
			            nui.get("declareYear").setValue(o.keyTask.declareYear.substr(0,4));
			            nui.get("actualCompleteTime").setValue(o.keyTask.actualCompleteTime);		            			            
						nui.get("datagrid2").load({id:o.keyTask.id});
						
			        }
			    });
		 				
						
		 }
		
		
		init();
		nui.get("keytaskId").setReadOnly("true");
		function init(){
			
			var json = nui.encode({id:id});
        	nui.ajax({
	            url: "com.zhonghe.ame.imptask.selfValuater.querySelfValuaterDetail.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	var pageData = o.selfValuaters[0]
	            	nui.get("keytaskId").setText(pageData.taskName);
	            	nui.get("annualFractionForecast").setValue(pageData.annualFractionForecast);
	            	nui.get("completeRate").setValue(pageData.completeRate);
	            	nui.get("progress").setValue(pageData.progress);
	            	nui.get("annualCompeteForecast").setValue(pageData.annualCompeteForecast);
	            	nui.get("remark").setValue(pageData.remark);
	            	nui.get("completeRateYc").setValue(pageData.completeRateYc);
				}
				
	     });
		}
		
		function dictprojRole(e){
			return nui.getDictText('PRD_ROLE',e.value);
		}
		
		function getPriceType(e){
			return nui.getDictText('MIS_PRICETYPE',e.value);
		}
		function dictIsmaincont(e){
			return nui.getDictText('MIS_YN',e.value);
		}
		
	//grid2的表单验证
	function checkTime(){
			var start="";
			var end="";
			var rows = gaid22.getChanges();
			if(rows){
				for(var i = 0;i < rows.length;i ++){
			     	if(!rows[i].userid){
			     		alert("相关人员的员工姓名不能为空!")
			     		return false
			     	}else{
			     		if(rows[i].beginDate){
			     			if(rows[i].endDate){
			     				start = rows[i].beginDate.substring(0,4) + rows[i].beginDate.substring(5,7) + rows[i].beginDate.substring(8,10);
			     				end = rows[i].endDate.substring(0,4) + rows[i].endDate.substring(5,7) + rows[i].endDate.substring(8,10);
			     				if(start > end){
				        			alert("进入日期:" + rows[i].beginDate.substring(0,10) + "不能大于退出日期:" + rows[i].endDate.substring(0,10));
				        			return false;
				        		}
			     			}
			     		}
			     	}
				}
			}
		return true;
	} 	
	
	//对应类型业务字典
	function dictGetType(e){
		return nui.getDictText('AME_PROCONT',e.value);
	}
	
	//合同类型业务字典
	function dictGetContType(e){
		return nui.getDictText('MIS_CONTRACTTYPE',e.value);
	}	
	
	
	function check(e){
			
			if(e.row.orgname!==null){
				return "已完成";
			}else{
				return "";
			}
		}
	
	function submit(){
    	
    			var data = form2.getData();

    			var json = nui.encode({"selfValuate":data,"id":id,"keytaskId":keytaskId}); 
    			
    			console.log(json);
    
    			var name = nui.get("keytaskId").text;
		  		
				if(!confirm("确定更新重点任务"+name+"的自评")){
        				return;
        			}else{	
        				
		    		 nui.ajax({
		                url: "com.zhonghe.ame.imptask.selfValuater.updateSelfValuater.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		               
		                	 if(text.result==1){
		                	 nui.alert("重点任务自评更新成功","系统提示",function(){
				        		//nui.get("sureButton").setEnabled(true);
				        		CloseWindow("ok");
				        	});

		                	 }else{
		                	 
		                	 nui.alert("更新失败，请联系信息技术部人员！","系统提示", function(action){
								//nui.get("sureButton").setEnabled(true);
							});
		                	 
		                	 }
		                
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            });  
		            }
    	
    	
    	
    	}
	
	function getValueStatus(e){
    		
    		if(e.value==0){
    			return "进行中";
    		}else if(e.value==1){
    			return "已完成";
    		}else{
    			return "";
    		}
    		
    	
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
	
	
	function SaveData(){
		var isPublic = nui.get("isPublic").getValue();
		if(isPublic==null||isPublic==""){
			nui.get("isPublic").setValue("n");
		}
		var data = form.getData();
		var rdproject = data.rdproject;
		var RdEmpProj = gaid22.getData();//项目有权人员
		var rdprocont = grid_cont.getData();//项目对应合同
		
		var contnums = null;
		for(var i=0;i<rdprocont.length;i++){
			if(rdprocont[i].proconttype==null||rdprocont[i].proconttype==""){
				alert("项目合同列表中对应类型不能为空，请检查后保存！");
				return;
			}else{
				if(rdprocont[i].proconttype=="2"){
					if(rdprocont[i].contorderno==null||rdprocont[i].contorderno==""){
						alert("项目合同列表中项目与合同订单对应时，合同订单不能为空，请检查后保存！");
						return;
					}
				}
			}
			if(rdprocont[i].contnum==null||rdprocont[i].contnum==""){
				alert("项目合同列表中合同编号不能为空，请检查后保存！");
				return;
			}
			if(rdprocont[i].ismaincont==null||rdprocont[i].ismaincont==""){
				alert("项目合同列表中是否主合同不能为空，请检查后保存！");
				return;
			}
			if(rdprocont[i].ismaincont=='1'){
				if(contnums == null){
					contnums = rdprocont[i].contnum;
				}else{
					if(contnums!=rdprocont[i].contnum){
						alert("同一个项目，最多只能有一个合同为主合同！，请检查后保存！");
						return;
					}
				}
			}
		}
		
		var isCf;
		for(var i = 0 ; i<RdEmpProj.length;i++){
			for( var l = i+1 ; l<RdEmpProj.length; l++){
				var useridA = RdEmpProj[i].userid;
				var useridB = RdEmpProj[l].userid;
				if(useridA == useridB){
					isCf = '1';
				}
			}
			if(RdEmpProj[i].pricetype ==null || RdEmpProj[i].pricetype == " "){
				alert("项目计价模式为空，请确认后再保存!");
				return;
			}
		}
		if(isCf == '1'){
			alert("项目有权人员有重复，请确认后再保存!");
			return;
		}
		nui.get("appButton").disable();
		var json = nui.encode({"rdproject":rdproject,"save":save,"rdprocont":rdprocont});
		nui.ajax({
			url: "com.primeton.rdmgr.project.rdProject.modifyRdProject.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
	        success: function (o) {
	        	var projectid = o.projectid;
	        	if(o.result == "1"){
	        		var json = {"RdEmpProj":gaid22.getData(),"projectid":projectid};
					var json1 = nui.encode(json);
					nui.ajax({
					    url: "com.primeton.rdmgr.project.createApplication.savePowerPerson.biz.ext",
						type: 'POST',
						data: json1,	
						contentType: 'text/json',
					    success: function (o) {
					    	if(o.result == '1'||o.result == 1){
					    		alert("保存失败！");
					    		nui.get("appButton").enable();
					    	}else{
					    		alert("保存成功！");
					    		nui.get("appButton").enable();
					    		setData(projectid);
					    	}
					    }
					});
	        	}else{
	        		alert("保存失败！");
	        		nui.get("appButton").enable();
	        	}
	        }
		});
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
        //window.opener.search();
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