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
	<!-- 	<fieldset style="border:solid 1px #aaa;padding:3px;"> -->
	
		<fieldset style="border:solid 1px #aaa;padding:3px;  width:99%;height:33%; ">
		<legend>重点任务自评</legend>
		 	<form id="form2" method="post"  >
		 		<!-- <input class="nui-hidden" id="projectid" name="rdproject.projectId">
		 		<input name="rdproject.fileids" id="fileids" class="nui-hidden"/>
		 		<input name="rdproject.ruleid" id="ruleid" class="nui-hidden"/>
		 		<input name="rdproject.isPublic" id="isPublic" class="nui-hidden"/> -->
		 		
		 		<!-- 重点任务名称，进展情况，年度完成情况预测，年度得分预测，完成率，备注 -->
        
	        <!-- 	<table style="table-layout:fixed;" id="table_file1"> -->
	        	<table style="table-layout:fixed; border-spacing:1px " id="table_file1"  >
	        	
	        			<tr>
	        				<td align="right" style="width:160px">重点任务名称：</td>
							<td style="width: 210px;"><input
									name="keytaskId" id="keytaskId"
									class="nui-combobox" readOnly="readOnly"
									url="com.zhonghe.ame.imptask.selfValuater.getNeedSelfValuate.biz.ext"
									filterType="like" textField="taskName" valueField="keytaskId"
									dataField="needSelfValuates" valueFromSelect="true" allowInput="true"
									 style="width: 310px;" readOnly="readOnly"/></td>
									
							<td align="right" style="width:160px">年度得分预测：</td>
							<td>
								<input class="nui-textbox" name="annualFractionForecast" id="annualFractionForecast" style="width:310px" readOnly="readOnly">
							</td>
									
							<td align="right" style="width:160px">完成率：</td>
							<td>
								<input class="nui-textbox" name="completeRate" id="completeRate" style="width:310px" readOnly="readOnly">
								  <span style="border-spacing: 0px; padding-left: 0.2em;padding-right: 0.2em;">%</span>
								<!-- <td>%</td>
								<td> <a class="nui-button" id="addbtn"  onclick="queryzdrwAndydjh()">加载重点任务信息和月度计划</a> </td>  -->
							</td>	
							
							
							
						</tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr>
						<td align="right" style="width:160px">进展情况：</td>
							<td style="width: 100px" colspan="7"><input
									name="progress" id="progress"
									class="nui-textarea"  style="width: 1300px;"readOnly="readOnly" /></td>
						</tr>
						
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						
			            <tr>
			            
			            <td align="right" style="width:160px" > 年度完成情况预测：</td>
							<td style="width: 100px" colspan="7"><input
									name="annualCompeteForecast" id="annualCompeteForecast"
									class="nui-textarea" readOnly="readOnly" style="width: 1300px " /></td>
						</tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr>
						<td align="right" style="width:160px">备注：</td>
						<td colspan="5"><input class="nui-textarea"
									dictTypeId="ZH_TASK_STATUS"  name="remark" shownullItem="true"
									style="width: 1300px;" readOnly="readOnly" id="remark" /> 
						</tr>

	        	</table>
	        </form>
    	</fieldset>
    	<div style="text-align:center;padding:10px;" class="nui-toolbar">
				<a class="nui-button" id="addbtn"  onclick="queryzdrwAndydjh()">加载重点任务信息和月度计划</a> 
		</div>
    	
    	 <fieldset style="border:solid 1px #aaa;padding:3px;  width:99%;height:55%;  ">
		<legend>重点任务基本信息</legend>
		 	<form id="form1" method="post" >
	        	<table style="table-layout:fixed; border-spacing:10px " id="table_file1">
	        	
			            <tr>
							<td align="right" style="width:160px">重点任务名称:</td>
							<td  colspan="2";>
								<input class="nui-textbox" name="taskName" id="taskNameforjbxx" style="width:310px" readOnly="readOnly">
							</td>
							<td align="right" style="width:160px">重点任务方向:</td>
							<td  colspan="2";>
								<input class="nui-textbox" name="taskDirection" id="taskDirectionforjbxx" style="width:310px" required="true" onblur="checkProjectno" readOnly="readOnly">
							</td>	
							<td align="right" style="width:160px">责任单位:</td>
							<td  colspan="2"; style="width: 210px;"><input
									name="orgId" id="orgIdforjbxx"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									onvaluechanged="changeOrgForm" style="width: 310px;" readOnly="readOnly" /></td>	
						</tr>
						<tr>
							<!-- <td align="right" style="width:160px">实际完成时间：</td>
							<td style="width: 130px"><input
									name="actualCompleteTime" id="actualCompleteTime" 
									class="nui-datepicker"  style="width: 120px" readOnly="readOnly"/></td>-->
						
							<td align="right" style="width:160px">1:</td>
							<td  colspan="2";>
								<input class="nui-textbox"  name="declareYear" id="declareYearforjbxx" style="width:310px" shownullItem="true" readOnly="readOnly">
							</td>
						
							<td align="right" style="width:160px"> 计划完成时间:</td>
							<td colspan="2"; style="width: 130px"><input
									name="planCompleteTime" id="planCompleteTimeforjbxx"
									class="nui-datepicker" required="true" style="width: 310px" readOnly="readOnly"/></td>
							
						</tr>
						<tr>
							<td align="right" style="width:160px">决策情况:</td>
							<td  colspan="8";>
								<input class="nui-textarea" name="decisionSituation" id="decisionSituationforjbxx" style="width:1100px;height: 40px" shownullItem="true" required="true" readOnly="readOnly">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">完成情况:</td>
							<td  colspan="8";>
								<input class="nui-textarea" dictTypeId="zh_keytaskstatus" name="completion" id="completionforjbxx" style="width:1300px;height:40px" shownullItem="true" readOnly="readOnly">
							</td>
						</tr>
						<tr>
							
						</tr>
								<td align="right" style="width:160px">年度目标:</td>
								<td  colspan="8";>
									<input name="yearTarget" id="yearTargetforjbxx" class="nui-textarea" style="width:1300px;height: 40px" showClose="false" allowInput="true" required="true" readOnly="readOnly"/>
								</td>
						<tr>
							<!-- <td align="right" style="width:160px">完成状态：</td>
							<td>
								<input class="nui-dictcombobox" dictTypeId="zh_keytaskstatus" name="completeStatus" id="completeStatus" style="width:250px" shownullItem="true" readOnly="readOnly">
							</td> -->
							
							
							
							<td align="right" style="width:160px">总体目标:</td>
							<td  colspan="8";>
								<input class="nui-textarea"  name="populationTarget" id="populationTargetforjbxx" style="width:1300px;height: 40px" required="true" readOnly="readOnly">
							</td>
						</tr>
						<tr>
							
							<td align="right" style="width:160px"> 问题及纠偏措施:</td>
							<td  colspan="8";>
								<input class="nui-textarea"  name="problemMeasures" id="problemMeasuresforjbxx" style="width:1300px;height: 40px" shownullItem="true" readOnly="readOnly">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">备注:</td>
							<td  colspan="8";>
								<input class="nui-textarea" name="remark" id="remarkforjbxx" onvaluechanged="changeexpcontsum" style="width:1300px;height: 40px" readOnly="readOnly">
							</td>
						</tr>

	        	</table>
	        </form>
    	</fieldset>
		 <fieldset style="border: solid 1px #aaa;padding: 3px;width:99%;height:55%;">
			    <legend>重点任务月度计划 </legend>
		<div style="width:auto;">
        <div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
            <table style="width:auto;">
                <tr>
                    <td style="width:100%;">
                        <a class="nui-button" iconCls="icon-edit" onclick="edit()" plain="true">查看</a>
                       
                    </td>
                </tr>
            </table>           
        </div>
	</div> 
	<div id="datagrid2" class="nui-datagrid" style="width:auto;height:auto;" dataField="monthTaskList"  url="com.zhonghe.ame.imptask.keytask.queryMonthTask.biz.ext"
 allowResize="true" pageSize="20" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
	    <div property="columns"> 
	    	 <div name="temp123" type="checkcolumn"></div>
		        	<!-- <div type="expandcolumn" width="20"></di -->v>
		        	<div field="month" width="40" align="center" headerAlign="center" allowSort="true">月份</div>
		            <div field="monthDescribe" width="120" align="center" headerAlign="center" allowSort="true">月度计划描述</div>
		            <div field="planFinishTime" width="80" align="center" headerAlign="center" allowSort="true" >计划完成时间</div>
		            <div field="actualCompleteTime" width="90" align="center" headerAlign="center" allowSort="true" >实际完成时间</div>
		            <div field="completion" width="80" align="center" headerAlign="center" allowSort="true"  >完成情况</div>
		            <div field="orgname" width="120" align="center" headerAlign="center" >责任单位</div>
		            <div field="completeStatus" width="150" align="center" headerAlign="center" renderer="check">完成状态</div>
		            <div field="problemMeasures" width="100" align="right" headerAlign="center" allowSort="true">问题及纠偏措施</div>
		            <div field="filepath" width="80" align="center" headerAlign="center" allowSort="true">附件</div>
	    </div>
	</div>
	</fieldset>  
	
        
    	
    	
    	
    	
        
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="appButton" style="width:60px;margin-right:20px;">确定</a>
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
    	
    	var ida = "";
    	var grid_traveldetail = nui.get('grid_traveldetail');
    	
    	
    	var grid = nui.get("datagrid2");
    	
    	/* nui.get("remindfz").setValue(remindfz);
    	nui.get("projectStatus").setValue("1");
    	nui.get("createdate").setValue(new Date()); */
    	/* if(projectid!=''&&projectid!=null&&projectid!='null'){
    		save = '1';
    		nui.get("projectid").set(projectid);
    		gaid22.load({"projectid":projectid});
			setData(projectid);
    	}
		 */
		init();
		
		function init(){
			
			var json = nui.encode({id:id});
        	nui.ajax({
	            url: "com.zhonghe.ame.imptask.selfValuater.querySelfValuaterDetail.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	var pageData = o.selfValuaters[0]
	            	
	            	ida=pageData.keytaskId;
	            	
	            	nui.get("keytaskId").setText(pageData.taskName);
	            	nui.get("annualFractionForecast").setValue(pageData.annualFractionForecast);
	            	nui.get("completeRate").setValue(pageData.completeRate);
	            	nui.get("progress").setValue(pageData.progress);
	            	nui.get("annualCompeteForecast").setValue(pageData.annualCompeteForecast);
	            	nui.get("remark").setValue(pageData.remark);
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
		
		function clearContnum(){
			nui.get("contnum").setValue(null);
			nui.get("contnum").setText(null);
		}    
		
		<!--基本信息	-->										  
        function setData(projectid){        
        	var json = nui.encode({projid:projectid});
        	nui.ajax({
	            url: "com.primeton.rdmgr.project.benefitToBenefitProject.getProjectMessage.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	nui.get("grid_0").load({"groupid":"rdproject","relationid":o.rdproject.projectId});
	            	o = nui.decode(o);
	            	var rdproject = o.rdproject;
	                form2.setData(o);
                 	grid_cont.load({"projectid":projectid});//加载项目合同数据
                 	grid_cont.sortBy("contnum","desc");
	                if(rdproject.custid=='0'){
                	 	nui.get("custid").setText('无客户对应');
	                }else{
	                	nui.get("custid").setText(rdproject.custname);
	                }
	                projectno1=rdproject.projectno;
	                nui.get("manager").setText(rdproject.managername);
	                nui.get("createapplicant").setText(rdproject.createapplicantname);
	                nui.get("orgid").setValue(rdproject.finUnitId);
	                form2.setChanged(false);
				}
	     });
	}
	
	//选择考勤规则
	function chooseRule(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/ame_common/attendance/selectAttendanceRule.jsp",
			title: "选择项目规则",
			width: 900,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.rulename);
		                nui.get("ruleid").setValue(data.ruleid);
					}
				}
			}
		});
	}	
	
    function getContract() {
        var row = grid_cont.getSelected();
		if(row.proconttype==null || row.proconttype==""){
			alert("请先选择对应类型！");
			return;
		}
        var btnEdit = this;	
        var lookupUrl="";
    	lookupUrl = "/contract/contract/contract_lookup.jsp";
        nui.open({
			url:"<%=request.getContextPath() %>"+lookupUrl,
			title: "选择合同",
			width: 1150,
			height: 500,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.text);
		                btnEdit.setText(data.text);
		               	var rowData = {contracttype:data.contracttype,contcustname:data.custname,salename:data.salename};
		               	grid_cont.updateRow(row,rowData);
					}
				}
			}
		});
	}
	//选择合同订单
	function getContOrder(){
		var row = grid_cont.getSelected();
		if(row.contnum==null || row.contnum==""){
			alert("请先选择合同编号！");
			return;
		}
		var btnEdit = this;	
        var lookupUrl="";
    	lookupUrl = "/ame_common/contract/selectContOrder.jsp";
        nui.open({
			url:"<%=request.getContextPath() %>"+lookupUrl,
			title: "选择合同订单",
			width: 850,
			height: 300,
			onload: function () {
            	var iframe = this.getIFrameEl();
	            var data = {contnum: row.contnum };
	            iframe.contentWindow.loadData(data);
	        },
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.contorderno);
		                btnEdit.setText(data.contorderno);
					}
				}
			}
		});
	}
	
	//选择项目负责人
	function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.userid);
		                btnEdit.setText(data.empname);
		                var orgseq = data.omOrganization.orgseq;//人员seq
		                var orgname = data.orgname;//人员所属部门
		                var orgid = data.orgid;//人员所属部门
		                var projorgid = nui.get("orgid").getValue();
		                var json = nui.encode({"projorgid":projorgid,"orgid":orgid});
			        	nui.ajax({
				            url: "com.primeton.rdmgr.project.rdProject.checkPice.biz.ext",
							type: 'POST',
							data: json,	
							contentType: 'text/json',
				            success: function (o) {
    							if(o.result !=null ){
				            		var result = o.result;
				            		//内部价
				            		if(result == '0'){
					                	var updateRow = {
				                        pricetype : '0'
				                        };
					                }else{//外部价
					                	var updateRow = {
				                       	pricetype : '1'
				                        };
					                }
					                var projectEmp = nui.get("datagrid22");
			                        var row = projectEmp.getSelected();
				                  	projectEmp.updateRow(row,updateRow);
				            	}
							}
				     	});
					}
				}
			}
		});
	}
	
	
	function addRow() {
		var orgid = nui.get("orgid").getValue();
		if(orgid==null||orgid=='null'||orgid==''){
			alert("请先选择项目所属事业部，然后在添加人员!");
			return;
		}          
	    var newRow = { name: "New Row" };
	    gaid22.addRow(newRow, 0);
	}
	function removeRow() {
	    var rows = gaid22.getSelecteds();
	    if (rows.length > 0) {
	        gaid22.removeRows(rows, true);
	    }
	}
	
	function addContRow() {
	    var newRow = { name: "New Row" };
	    grid_cont.addRow(newRow, 0);
	}
	function removeContRow() {
	    var rows = grid_cont.getSelecteds();
	    if (rows.length > 0) {
	        grid_cont.removeRows(rows, true);
	    }
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
	
	function chooseplace(){
		var checkplace = nui.get("checkplace").getValue();
		var longitude=nui.get("longitude").getValue();
		var latitude=nui.get("latitude").getValue();
		nui.open({
			url:"<%=request.getContextPath() %>/ame_common/attendance/baiduMap.jsp?longitude="+longitude+"&latitude="+latitude+"&suggestId="+checkplace,
			title: "地图信息",
			width: 700,
			height: 450,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
						nui.get("checkplace").setValue(data.suggestId);
		                nui.get("longitude").setValue(data.longitude);
		                nui.get("latitude").setValue(data.latitude);
		                
					}
				}
			}
		});
	}
	
	
	function submit(){
    	
    			var data = form2.getData();
    			//console.log(bidInfo);
    			/* var bidCompetitor=grid_traveldetail.getData()
    			 */
    			var json = nui.encode({"selfValuate":data,"id":id,"keytaskId":keytaskId}); 
    			
    			/* console.log(json); */
    
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
	
	//选择服务客户弹窗
	function selectCustmer(){
		var btnEdit = this;
		nui.open({
			url:"<%=request.getContextPath() %>/contract/contract/MisCustinfo_lookup.jsp",
		    title: "选择服务客户",
		    width: 650,
		    height: 380,
		    ondestroy: function (action) {
		        if (action == "ok") {
		            var iframe = this.getIFrameEl();
		            var data = iframe.contentWindow.GetData();
		            data = nui.clone(data);    //必须
		            if (data) {
		                btnEdit.setValue(data.id);
		                btnEdit.setText(data.text);
		            }
		        }
		    }
	    });
	}
	
	//选择项目负责人
	function showEmployee1(e) {
	    var btnEdit = this;
	    nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.userid);
		                btnEdit.setText(data.empname);		 
					}
				}
			}
		});
	}

	function updateRdproject(){
		if(form2.validate()){
			if(!checkTime()){
				return;
			}else{
				
				/* form2.submit(); */
				form3.submit();
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
		var data = form2.getData();
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
	
	function checkProjectno(){
		var projectno = nui.get("projectno").getValue();
		var json = nui.encode({"projectno":projectno,"projectno1":projectno1});
		nui.ajax({
			url: "com.primeton.rdmgr.project.rdProject.checkProjectno.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
	        success: function (o) {
	        	if(o.result == "1"){
	        		alert("项目编号已存在！");
	        		nui.get("projectno").setValue("");
	        	}
	        }
		});
	}
	
	function CloseWindow(action) {            
        if (action == "close" && form2.isChanged()) {
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
	
	
	
	
	
	
		
	
	
	
	
		
	<%-- 	nui.parse();
    	var form = new nui.Form("form1");
    	var workItemID = <%=request.getParameter("workItemID")%>;
    	var ida = <%=request.getParameter("id")%>;
    	/* var opioionform = new nui.Form("#opioionform"); */
    	var grid_traveldetail = nui.get('grid_traveldetail');
    	//console.log(workItemID);
    	var grid_cont = nui.get("grid_cont");//项目合同
    	var save = "0";
    	var projectno1;
    	var remindfz = nui.getDictText('AME_SYSCONF',"projectYZ");
    	var grid = nui.get("datagrid2"); --%>
		
		
		
		
		
		
		
		
		   <%--  function init(){ 
			var data = {workitemid:ida};
			var json = nui.encode(data);
			nui.ajax({		
		        url: "com.zhonghe.ame.imptask.keytask.queryxxbjMngInfo.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
			            form.setData(o);
			            
			            nui.get("taskName").setValue(o.keyTask.taskName);
			            nui.get("taskDirection").setValue(o.keyTask.taskDirection);
			            
			            nui.get("orgId").setText(o.keyTask.orgname);
				       /*  nui.get("actualCompleteTime").setValue(o.keyTask.actualCompleteTime); */
				        nui.get("planCompleteTime").setValue(o.keyTask.planCompleteTime);
				        nui.get("completion").setValue(o.keyTask.completion);
				        /* nui.get("completeStatus").setValue(o.keyTask.completeStatus); */
				        nui.get("yearTarget").setValue(o.keyTask.yearTarget);
				        nui.get("populationTarget").setValue(o.keyTask.populationTarget);
				        nui.get("decisionSituation").setValue(o.keyTask.decisionSituation);
				        nui.get("problemMeasures").setValue(o.keyTask.problemMeasures);
			            nui.get("remark").setValue(o.keyTask.remark);
			            nui.get("declareYear").setValue(o.keyTask.declareYear);
			            
			            console.log(grid);
						grid.load({id:o.keyTask.id});
						
			            //流程提示信息
			            // promptInit({"workItemID": <%=workitemid%>});
			            //审核意见
			        	//var processinstid = nui.get("processinstid").getValue();
						
						//初始化处理意见
						initMisOpinion({auditstatus:"1"});

			        }
			    });
		 				
						
		 }
		init(); --%>
	    
	
	
	
		//附属页
	function queryzdrwAndydjh(){ 
			/* ida  = nui.get("keytaskId").value */
			var data = {workitemid:ida};
			var json = nui.encode(data);
			nui.ajax({		
		        url: "com.zhonghe.ame.imptask.keytask.queryxxbjMngInfo.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
			            form.setData(o);
			            
			            nui.get("taskNameforjbxx").setValue(o.keyTask.taskName);
			            nui.get("taskDirectionforjbxx").setValue(o.keyTask.taskDirection);
			            
			            nui.get("orgIdforjbxx").setText(o.keyTask.orgname);
				       /*  nui.get("actualCompleteTime").setValue(o.keyTask.actualCompleteTime); */
				        nui.get("planCompleteTimeforjbxx").setValue(o.keyTask.planCompleteTime);
				        nui.get("completionforjbxx").setValue(o.keyTask.completion);
				        /* nui.get("completeStatus").setValue(o.keyTask.completeStatus); */
				        nui.get("yearTargetforjbxx").setValue(o.keyTask.yearTarget);
				        nui.get("populationTargetforjbxx").setValue(o.keyTask.populationTarget);
				        nui.get("decisionSituationforjbxx").setValue(o.keyTask.decisionSituation);
				        nui.get("problemMeasuresforjbxx").setValue(o.keyTask.problemMeasures);
			            nui.get("remarkforjbxx").setValue(o.keyTask.remark);
			            nui.get("declareYearforjbxx").setValue(o.keyTask.declareYear);
			            
			            console.log(grid);
						grid.load({id:o.keyTask.id});
						
			            //流程提示信息
			            <%-- // promptInit({"workItemID": <%=workitemid%>}); --%>
			            //审核意见
			        	//var processinstid = nui.get("processinstid").getValue();
						
						//初始化处理意见
						initMisOpinion({auditstatus:"1"}); 

			        }
			    });
		 				
						
		 }
		/* queryzdrwAndydjh(); */
		
		
		
	    function check(e){
			if(e.value==1){
			return "已完成";
			}else{
			return "";
			/* return "未完成"; */
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
				
				 url: "/default/imptask/editMonthTaskforzp.jsp?keyId="+row.id,
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
    	
    	function addTicket(){
    	var rowS = {name: "New Row"} 
		grid_traveldetail.addRow(rowS);
    	<%--var row = grid_traveldetail.getData();
    	if(row.length==0){
    		var rowS = {name: "New Row"} 
    		grid_traveldetail.addRow(rowS);
    	}else{
    		var rowS = {name: "New Row",bookingregion:row[0].bookingregion};
    		grid_traveldetail.addRow(rowS);
    	}--%>
    }
    
	//删除行程明细
	function removeTicket(){
		var rows = grid_traveldetail.getSelecteds();
        if (rows.length>0) {
            grid_traveldetail.removeRows(rows, true);
        }else{
        	nui.alert("请至少选中一条记录！");
        }
	}
    	
    	

	//对应类型业务字典
	function dictGetType(e){
		return nui.getDictText('AME_PROCONT',e.value);
	}
	
	/* function submit(){
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
    } */
	
	
	
	 // 提交 
    function submitProcess(title){
    	nui.confirm("确定" + title + "流程吗？", "操作提示",function (action) {            
            if (action == "ok") {
				var misOpinion = opioionform.getData().misOpinion;//审核意见
            	nui.get("appButton").setEnabled(false);
            	var json = {misOpinion:misOpinion,workItemID:workItemID};
            	saveData(json);
            }
        });
    }
    

/* 	function updateRdproject(){
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
	 */
	
	function saveData(json){
			console.log(json);
			 mini.mask({
		            el: document.body,
		            cls: 'mini-mask-loading',
		            html: titleText+'中...'
		        }); 
		    	  nui.ajax({
		  			url: "com.zhonghe.ame.imptask.keytask.depAppMonthTask.biz.ext",
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
	function setColor(e){
		var row = e.record;
	    if (e.field == "traffictype") {
	        if(e.value == "2" || e.value == "4"){
		         e.cellStyle = "background:yellow";
    		}
	    }
	    if(e.field == "timequantums" || e.field == "timequantume" ||e.field == "bookingregion" ){
	    	if(row.bookingtype == "2"){
	    		e.value = "";
	    		e.cellHtml = "";
	    		row.timequantums = "";
	    		row.timequantume = "";
	    		row.bookingregion = "";
	    	}
	    }
	}
	
	
	
   	</script>
</body>
</html>