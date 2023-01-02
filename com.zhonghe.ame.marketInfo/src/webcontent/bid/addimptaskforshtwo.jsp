<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>重点任务审核直接申报</title>
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
		<!-- <fieldset style="border:solid 1px #aaa;padding:3px;"> -->
		<fieldset style="border:solid 1px #aaa;padding:10px 5px 15px; width:98%;height: 427px;">
		<legend>重点任务基本信息</legend>
		 	<!-- <form id="form1" method="post" > -->
		 	<form id="form1" method="post"  style="width:100%;height:400px" >
		 		<!-- <input class="nui-hidden" id="projectid" name="rdproject.projectId">
		 		<input name="rdproject.fileids" id="fileids" class="nui-hidden"/>
		 		<input name="rdproject.ruleid" id="ruleid" class="nui-hidden"/>
		 		<input name="rdproject.isPublic" id="isPublic" class="nui-hidden"/> -->
	        	<!-- <table style="table-layout:fixed;" id="table_file1"> -->
	        	<table style="table-layout:fixed; border-spacing:5px " id="table_file1"  >
	        			<tr>
	        			
	        				<td align="right" style="width:128px"><nobr>重点任务名称：</nobr></td>
							<td  colspan="2";>
								<input class="nui-textbox" name="taskName" id="projectName" style="width:200px" required="true">
							</td>
	        				
	        				<td align="right" style="width:128px"><nobr>重点任务方向：</nobr></td>
							<td  colspan="2";>
								<input class="nui-textbox" name="taskDirection" id="projectno" style="width:200px" required="true" onblur="checkProjectno">
							</td>	
	        				
	        				<td align="right" style="width:128px"><nobr>责任单位：</nobr></td>
							<td  colspan="2"; style="width: 210px;"><input
									name="orgId" id="orgId"
									class="nui-combobox" required="true"
									url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
									filterType="like" textField="orgname" valueField="orgid"
									dataField="allorgs" valueFromSelect="true" allowInput="true"
									onvaluechanged="changeOrgForm" style="width: 265px;" /></td>	
	        			
	        			
	        				
							<!-- <td align="right" style="width:128px"><nobr>实际完成时间：</nobr></td>
							<td  colspan="2"; style="width: 130px"><input
									name="actualCompleteTime" id="openTime"
									class="nui-datepicker"  style="width: 200px" /></td> -->
							
						</tr>
			            <tr>
							<td align="right" style="width:128px"><nobr>年度：</nobr></td>
							<td  colspan="2";>
								<input class="nui-textbox" name="declareYear" id="declareYear" style="width:200px" required="true">
							</td>
							
							<td align="right" style="width:128px"> <nobr>计划完成时间：</nobr></td>
							<td  colspan="2"; style="width: 130px"><input
									name="planCompleteTime" id="openTime"
									class="nui-datepicker" required="true" style="width: 200px" /></td>
							
							
							<td align="right" style="width:128px"> <nobr>实际完成时间：</nobr></td>
							<td  colspan="2"; style="width: 130px"><input
								name="actualCompleteTime" id="actualCompleteTime"
								class="nui-datepicker" required="true" style="width: 265px" /></td>
									
						</tr>
						<tr>
							<td align="right" style="width:128px"> <nobr>填报时间：</nobr></td>
								<td  colspan="2"; style="width: 130px"><input
										name="createTime" id="createTime"
										class="nui-datepicker" required="true" style="width: 200px" /></td>
										
						<td align="right" style="width:128px"><nobr>完成状态：</nobr></td>
							<td  colspan="2";>
								<input class="nui-dictcombobox" dictTypeId="ZH_TJZT" name="completeStatus" id="completeStatus" style="width:200px" required="true">
							</td>
							<td align="right" style="width:128px"><nobr>完成率：</nobr></td>
							<td  colspan="2";>
								<input class="nui-spinner" name="completeRate" id="completeRate" style="width:265px" required="true">
								<td>%</td>
							</td>
												
						</tr>
						<tr>
							<td align="right" style="width:128px"><nobr>总体目标：</nobr></td>
							<td  colspan="8";>
								<input class="nui-textarea"  name="populationTarget" id="isconproj" style="width:950px;height: 50px" required="true">
							</td>
						</tr>
						
						<tr>
							<td align="right" style="width:128px"><nobr>年度目标：</nobr></td>
							<td  colspan="8";>
								<input name="yearTarget" id="manager" class="nui-textarea" style="width:950px;height: 50px" showClose="false" allowInput="true" required="true"/>
							</td>
						</tr>
						
						<tr>
						<td align="right" style="width:128px"><nobr>决策情况：</nobr></td>
						<td  colspan="8";>
								<input class="nui-textarea" name="decisionSituation" id="projectStatus" style="width:950px;height: 40px" shownullItem="true" required="true">
							</td>
						</tr>

						<tr>
						<td align="right" style="width:128px"><nobr>完成情况：</nobr></td>
							<td  colspan="8";>
								<input class="nui-textarea" dictTypeId="zh_keytaskstatus" name="completion" id="outstatus" style="width:950px;height:40px" shownullItem="true">
							</td>	
						</tr>
						
						
						<tr>
							
							<td align="right" style="width:128px"><nobr> 问题及纠偏措施：</nobr></td>
							<td  colspan="8";>
								<input class="nui-textarea" dictTypeId="MIS_PROJDESTATUS" name="problemMeasures" id="projectDestatus" style="width:950px;height: 50px" shownullItem="true">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:128px"><nobr>备注：</nobr></td>
							<td  colspan="8";>
								<!-- <input class="nui-textarea" name="remark" id="remark" onvaluechanged="changeexpcontsum" style="width:300px;height: 100px"  	readOnly="readOnly"> -->
								<input class="nui-textarea" name="remark" id="remark" onvaluechanged="changeexpcontsum" style="width:950px;height: 50px" >
							</td>
						</tr>
						
						
						

	        	</table>
	        </form>
    	</fieldset>
        
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="submit()" id="appButton" style="width:80	px;margin-right:20px;">确定提交</a>
		<!-- <a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a> -->
	</div>

    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var projectid = <%=request.getParameter("projectid")%>;
    	var gaid22 = nui.get("datagrid22");
    	var grid_cont = nui.get("grid_cont");//项目合同
    	var save = "0";
    	var projectno1;
    	var remindfz = nui.getDictText('AME_SYSCONF',"projectYZ");
    	/* nui.get("remindfz").setValue(remindfz);
    	nui.get("projectStatus").setValue("1");
    	nui.get("createdate").setValue(new Date()); */
    	if(projectid!=''&&projectid!=null&&projectid!='null'){
    		save = '1';
    		nui.get("projectid").set(projectid);
    		gaid22.load({"projectid":projectid});
			setData(projectid);
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
	                form.setData(o);
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
	                form.setChanged(false);
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
	
				form.validate();
    			if(form.isValid()==false){
    				nui.alert("请检查必填项");
    				return;
    			}	
    			
    			var keytask = form.getData();
    			//console.log(bidInfo);
    			/* var bidCompetitor=grid_traveldetail.getData()
    			 */
    			var json = nui.encode({"keytask":keytask});
    			
		  		
				if(!confirm("是否提交申报流程？")){
        				return;
        			}else{	
        				
		    		nui.ajax({
		                url: "com.zhonghe.ame.imptask.keytask.keytaskdeclareforsh.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		               
		                	 if(text.result==1){
		                	 nui.alert("重点任务提交成功","系统提示",function(){
				        		//nui.get("sureButton").setEnabled(true);
				        		CloseWindow("ok");
				        	});

		                	 }else{
		                	 
		                	 nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
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