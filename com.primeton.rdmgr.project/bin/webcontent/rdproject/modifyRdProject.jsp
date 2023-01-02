<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>新增/修改项目</title>
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
		<legend>基本信息</legend>
		 	<form id="form1" method="post" >
		 		<input class="nui-hidden" id="projectid" name="rdproject.projectId">
		 		<input name="rdproject.fileids" id="fileids" class="nui-hidden"/>
		 		<input name="rdproject.ruleid" id="ruleid" class="nui-hidden"/>
		 		<input name="rdproject.isPublic" id="isPublic" class="nui-hidden"/>
	        	<table style="table-layout:fixed;" id="table_file1">
			            <tr>
							<td align="right" style="width:160px">项目名称：</td>
							<td>
								<input class="nui-textbox" name="rdproject.projectName" id="projectName" style="width:250px" required="true">
							</td>
							<td align="right" style="width:160px">项目编号：</td>
							<td>
								<input class="nui-textbox" name="rdproject.projectno" id="projectno" style="width:250px" required="true" onblur="checkProjectno">
							</td>	
							<td align="right" style="width:160px">项目类型：</td>
							<td>
								<input class="nui-dictcombobox" dictTypeId="PROJECT_TYPE" name="rdproject.projectType" id="projectType" style="width:250px" required="true">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">对应客户：</td>
							<td>
								<input name="rdproject.custid" id="custid" onbuttonclick="selectCustmer" class="nui-buttonedit" style="width:250px" allowInput="false" required="true"/>
							</td>
							<td align="right" style="width:160px"> 受益部门：</td>
							<td>
								<input name="rdproject.omOrganization.orgid" id="orgid" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
								filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:250px;" required="true">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">实施责任部门：</td>
							<td>
								<input name="rdproject.managerdept" id="managerdept" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
								filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:250px;">
							</td>
							<td align="right" style="width:160px">项目经理：</td>
							<td>
								<input name="rdproject.manager" id="manager" class="nui-buttonedit" onbuttonclick="showEmployee1" style="width:250px;" showClose="false" allowInput="false" required="true"/>
							</td>
							<td align="right" style="width:160px">是否延续性项目：</td>
							<td>
								<input class="nui-dictcombobox" dictTypeId="MIS_YN" name="rdproject.isconproj" id="isconproj" style="width:250px" required="true">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">项目操作状态：</td>
							<td>
								<input class="nui-dictcombobox" dictTypeId="MIS_PROJSTATUS" name="rdproject.projectStatus" id="projectStatus" style="width:250px" shownullItem="true" required="true">
							</td>
							<td align="right" style="width:160px">项目商务状态：</td>
							<td>
								<input class="nui-dictcombobox" dictTypeId="MIS_PROJOUTSTATUS" name="rdproject.outstatus" id="outstatus" style="width:250px" shownullItem="true">
							</td>
							<td align="right" style="width:160px"> 项目交付状态：</td>
							<td>
								<input class="nui-dictcombobox" dictTypeId="MIS_PROJDESTATUS" name="rdproject.projectDestatus" id="projectDestatus" style="width:250px" shownullItem="true">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">预计合同额：</td>
							<td>
								<input class="nui-textbox" name="rdproject.expcontsum" id="expcontsum" onvaluechanged="changeexpcontsum" style="width:250px" >
							</td>
							<td align="right" style="width:160px">商机来源：</td>
							<td>
								<input class="nui-dictcombobox" dictTypeId="AME_BOSOURCE" name="rdproject.bosource" id="bosource" style="width:250px" shownullItem="true" >
							</td>
							<td align="right" style="width:160px">项目关闭日期：</td>
							<td>
								<input class="nui-datepicker"name="rdproject.closedate" id="closedate" style="width:250px">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">项目开始日期：</td>
							<td>
								<input class="nui-datepicker"name="rdproject.startdate" id="startdate" style="width:250px">
							</td>
							<td align="right" style="width:160px">预计结束日期：</td>
							<td>
								<input class="nui-datepicker"name="rdproject.expenddate" id="expenddate" style="width:250px">
							</td>
							<td align="right" style="width:160px">项目验收日期：</td>
							<td>
								<input class="nui-datepicker"name="rdproject.enddate" id="enddate" style="width:250px">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">项目成本类型：</td>
							<td>
								<input class="nui-dictcombobox" dictTypeId="AME_PCOSTTYPE" name="rdproject.pcosttype" id="pcosttype" style="width:250px" shownullItem="true">
							</td>
							<td align="right" style="width:160px">外部成本开始日期：</td>
							<td>
								<input class="nui-datepicker"name="rdproject.ocstartdate" id="ocstartdate" style="width:250px">
							</td>
							<td align="right" style="width:160px">外部成本结束日期：</td>
							<td>
								<input class="nui-datepicker"name="rdproject.ocenddate" id="ocenddate" style="width:250px">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">成本跟踪阈值：</td>
							<td>
								<input class="nui-textbox" name="rdproject.remindfz" id="remindfz" style="width:250px">
							</td>
							<td align="right" style="width:160px">是否超阈值：</td>
							<td>
								<input class="nui-dictcombobox" dictTypeId="ABF_YESORNO" name="rdproject.ispassfz" id="ispassfz" style="width:250px" shownullItem="true">
							</td>
							<td align="right" style="width:160px">是否发送超阈值邮件：</td>
							<td>
								<input class="nui-dictcombobox" dictTypeId="ABF_YESORNO" name="rdproject.issendfzmail" id="issendfzmail" style="width:250px" shownullItem="true">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">项目考勤规则：</td>
							<td>
								<input class="nui-textbox" name="rdproject.rulename" id="rulename" style="width:250px" onclick="chooseRule">
							</td>
							<td align="right" style="width:160px">项目创建申请人：</td>
							<td>
								<input name="rdproject.createapplicant" id="createapplicant" class="nui-buttonedit" onbuttonclick="showEmployee1" style="width:250px;" showClose="false" allowInput="false"/>
							</td>
							<td align="right" style="width:160px">创建日期：</td>
							<td>
								<input class="nui-datepicker"name="rdproject.createdate" id="createdate" style="width:250px">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">预算状态：</td>
							<td>
								<input class="nui-dictcombobox" dictTypeId="AME_ISPASSBUD" name="rdproject.ispassbud" id="ispassbud" style="width:250px" shownullItem="true">
							</td>
							<td align="right" style="width:160px">实施城市：</td>
							<td>
								<input class="nui-dictcombobox" dictTypeId="AREA4CLRY" name="rdproject.implementcity" id="implementcity" style="width:250px" shownullItem="true" allowInput = "true">
							</td>
							<td align="right" style="width:160px">合同预计签订日期：</td>
							<td>
								<input class="nui-datepicker"name="rdproject.contplandate" id="contplandate" style="width:250px">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">项目办公位置：</td>
							<td colspan="3">
								<input class="nui-textbox" name="rdproject.checkplace" id="checkplace"  onclick="chooseplace()" style="width: 100%;">
								<input class="nui-hidden" id="longitude" name="rdproject.longitude"/>
	 							<input class="nui-hidden" id="latitude" name="rdproject.latitude"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">备注：</td>
							<td colspan="5">
								<input class="nui-textarea" name="rdproject.remark" id="remark" style="width: 100%;">
							</td>
						</tr>
	        	</table>
	        </form>
    	</fieldset>
    	<jsp:include page="/ame_common/inputFile.jsp"/>
        </br>
        <div id="a1">
	        <div class="nui-tabs" activeIndex="0" >
	        	<div title="项目有权的人员" >
	        		<div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
					    <table style="width:auto;" >
					        <tr>
					            <td style="width:100%;">
					                <a class="nui-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
					                <a class="nui-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
				                </td>
				            </tr>
				        </table>           
				    </div>
			        <div id="datagrid22" class="nui-datagrid" style="width:auto;height:auto;" dataField="rdEmpProjs"  url="com.primeton.rdmgr.project.createApplication.queryRdEmpProjsInit.biz.ext"
	 				allowResize="true" pageSize="20" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="false" showPager="false">
		    			<div property="columns"> 
		    				<div type="checkcolumn"></div>           
		        			<div field="userid" displayField="empname" width="100" headerAlign="center">员工姓名
		        				<input property="editor" name="RdEmpProj.userid" id="userid" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false"/>
		        			</div>
		        			<div field="pricetype" width="50" allowSort="true"  headerAlign="center" renderer="getPriceType">计价模式
		        				<input property="editor" name="RdEmpProj.pricetype" id="pricetype" property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="MIS_PRICETYPE"/>
		        			</div>                          
		        			<div field="projRole" width="100" headerAlign="center" renderer="dictprojRole">角色
		        				<input property="editor" name="RdEmpProj.projRole" id="projRole" property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="PRD_ROLE"/>
		        			</div>
		        			<div field="beginDate" width="100" allowSort="true" dateFormat="yyyy-MM-dd" renderer="onDealDate" headerAlign="center">进入时间
		        				<input property="editor" name="RdEmpProj.beginDate" id="beginDate" property="editor" class="nui-datepicker" style="width:100px"/>
		        			</div>
		        			<div field="endDate" width="100" allowSort="true" dateFormat="yyyy-MM-dd" renderer="onDealDate" headerAlign="center">退出时间
		        				<input property="editor" name="RdEmpProj.endDate" id="endDate" property="editor" class="nui-datepicker" style="width:100px;"/>
		        			</div>
		        			<div field="isAdd" width="0"  visible="false"></div>
		    			</div>
					</div> 
	        	</div>
	        	<div title = "项目合同">
	        		<div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
					    <table style="width:auto;" >
					        <tr>
					            <td style="width:100%;">
					                <a class="nui-button" iconCls="icon-add" onclick="addContRow()" plain="true">增加</a>
					                <a class="nui-button" iconCls="icon-remove" onclick="removeContRow()" plain="true">删除</a>
				                </td>
				            </tr>
				        </table>           
				    </div>
					<div id="grid_cont" showPager="false" dataField="projConts" class="nui-datagrid" url="com.primeton.rdmgr.project.rdProject.queryProContByProid.biz.ext" 
	            	 allowCellEdit="true" allowCellSelect="true" multiSelect="true" oncellbeginedit="checkOrder" oncellendedit="clearOrder">
		                <div property="columns">
		               		<div type="checkcolumn"></div>
		                    <div field="proconttype" width="80" align="center" headerAlign="center" renderer="dictGetType">对应类型
		                    	<input property="editor" property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="AME_PROCONT"/>
		                    </div>
		                    <div field="ismaincont" width="80" align="center" headerAlign="center" renderer="dictIsmaincont">是否主合同
		                    	<input property="editor" property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="MIS_YN"/>
		                    </div>
		                    <div field="contnum" displayField="contnum" width="110" align="center" headerAlign="center" >合同编号
		                    	<input property="editor" class="nui-buttonedit" onbuttonclick="getContract" showClose="false" allowInput="false"/>
		                    </div>
		                    <div field="contorderno" displayField="contorderno" width="80" align="center" headerAlign="center">合同订单编号
		                    	<input property="editor" class="nui-buttonedit" onbuttonclick="getContOrder" showClose="false" allowInput="false"/>
		                    </div>
		                    <div field="contracttype" width="120" align="center" headerAlign="center" renderer="dictGetContType">合同类型</div>
		                    <div field="contcustname" width="180" align="center"headerAlign="center" >合同所属客户</div>
		                    <div field="salename" width="80" align="center" headerAlign="center">合同销售</div>
		                </div>
		            </div>
				</div>
	        </div>
        </div>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="updateRdproject" id="appButton" style="width:60px;margin-right:20px;">确定</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
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
    	nui.get("remindfz").setValue(remindfz);
    	nui.get("projectStatus").setValue("1");
    	nui.get("createdate").setValue(new Date());
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