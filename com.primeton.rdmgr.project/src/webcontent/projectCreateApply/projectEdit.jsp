<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): wyy
  - Date: 2016-07-15 11:02:14
  - Description:
-->
<head>
<title>项目编辑信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script src="../common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	    fieldset
	    {
	        border:solid 1px #aaa;
	    }        
	    .hideFieldset
	    {
	    	display:none;
	    }
    </style>
</head>
<body>
<div class="nui-fit" style="border:solid 1px #aaa;padding:0px;width:auto">
	<table  border="0" width="450px" class="form_table" id="table_file">
		<tr>
			<td align="right" width="120px">客户名称：</td>
			<td align="left" width="300px"><input name="rdproject.custname" id="custname1" onbuttonclick="selectCustmer" class="nui-buttonedit" required="true" style="width:220px" allowInput="false"/>
				<input type="checkbox"  id="checkbox1" onclick="toggleFieldSet(this, 'fd2')" hideFocus/><span id = "newcust">新客户</span></td>
		</tr>
	</table>
	<!-- 新客户信息  s -->
		
	<fieldset id="fd2" style="width:98%;">
		<legend>客户详细信息</legend>
         <jsp:include page="/ame_product/ProQuotation/misCustInfo.jsp"/>
	     <jsp:include page="/ame_common/detailFile.jsp"/>
	     <jsp:include page="/ame_common/addFiles1.jsp"/>
    </fieldset>
    
	<!-- 新客户信息  s -->
	<fieldset style="border:solid 1px #aaa;padding:3px; width:auto">
	<legend>项目申请信息</legend>
		<div id="form1" style="width:auto">
			<input name="rdproject.projectId" id="projectId" class="nui-hidden">
			<input name="rdproject.custid" id="custid" class="nui-hidden">
			<input class="nui-hidden" name="rdproject.longitude" id="longitude"/>
			<input class="nui-hidden" name="rdproject.latitude" id="latitude"/>
			<table style="width: 100%">
				<tr>
					<td align="right" width="150px">项目名称：</td>
					<td align="left" style="width:350px;"><input name="rdproject.projectName" id="projectName" class="nui-textbox" required="true" style="width:350px;"></td>
					<td align="right" width="150px">实施负责部门：</td>
					<td align="left"><input name="rdproject.managerdept" id="managerdept" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
					filterType="like" textField="orgname" required="true" valueField="orgid"  allowInput="true" style="width:200px;" dataField="allorgs"></td>
				</tr>
				<tr>
					<td align="right" width="150px">受益部门：</td>
					<td align="left"><input name="rdproject.omOrganization.orgid" id="finUnitId" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
					textField="orgname" valueField="orgid" dataField="allorgs" required="true" allowInput="true" style="width:200px;"></td>
					<td align="right" width="150px">是否延续性项目：</td>
			<td align="left"><input name="rdproject.isconproj" id="isconproj" style="width:200px" class="nui-dictcombobox" dictTypeId="MIS_YN" required = "true" onValuechanged="changeOcstartdate"></td>
				</tr>
				<tr>
					<td align="right" width="150px">项目类型：</td>
					<td align="left"><input name="rdproject.projectType" id="projectType" required="flase" class="nui-dictcombobox" dictTypeId="PROJECT_TYPE" style="width:200px;"></td>
					<td align="right" width="150px">对应商务合同编号：</td>
					<td align="left" colspan="3"><input name="rdproject.contnum" id="contnum" style="width:200px" class="nui-textbox"></td>
				</tr>
				<tr>
					<td align="right" width="150px">项目开始日期：</td>
					<td align="left"><input name="rdproject.startdate" id="startdate" allowInput="true" class="nui-datepicker" required="false" style="width:200px"></td>
					<td align="right" width="150px">预计结束日期：</td>
					<td align="left"><input name="rdproject.expenddate" id="expenddate" allowInput="true" class="nui-datepicker" required="false" style="width:200px"></td>
				</tr>
				<tr>
					<td align="right" width="150px">项目商务状态：</td>
					<td align="left" ><input name="rdproject.outstatus" id="outstatus" required="true" style="width:200px" class="nui-dictcombobox" dictTypeId="MIS_PROJOUTSTATUS"></td>
					<td align="right" width="150px">项目交付状态：</td>
					<td align="left" ><input name="rdproject.projectDestatus" id="projectDestatus" required="true" style="width:200px" class="nui-dictcombobox" dictTypeId="MIS_PROJDESTATUS"></td>
				</tr>
				<tr>
					<td align="right" width="120px">项目办公位置:</td>
					<td align="left" colspan="3"><input name="rdproject.checkplace" id="checkplace" class="nui-buttonedit" onbuttonclick="map()" style="width:550px" allowInput="false"/>
					<input type='button' align='center' value='清除位置' style="width:70px" onclick='javascript:clean()'/></td>
				</tr>
				<tr>
					<td align="right" width="150px">项目负责人：</td>
					<td align="left"><input property="editor" name="rdproject.manager" id="manager" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false" style="width:200px"/></td>
					<td align="right" width="150px">是否有外包：</td>
					<td align="left"><input name="rdproject.ishavewb" style="width:200px" class="nui-dictcombobox" dictTypeId="MIS_YN" required = "true"></td>
				</tr>
				<tr>
					<td align="right" width="150px">预计合同额：</td>
					<td align="left"><input name="rdproject.expcontsum" id="expcontsum" style="width:200px" class="nui-textbox" required="true" onvalidation="checkNum1" ></td>
					<td align="right" width="150px">商机来源：</td>
					<td align="left"><input name="rdproject.bosource" style="width:200px" class="nui-dictcombobox" dictTypeId="AME_BOSOURCE" ></td>
				</tr>
				<tr>
					<td align="right" width="150px">预计签订日期：</td>
					<td align="left"><input name="rdproject.contplandate" class="nui-datepicker" style="width:200px"/></td>
					<td align="right" width="150px">实施城市：</td>
					<td align="left"><input name="rdproject.implementcity" id="implementcity" class="nui-dictcombobox" dictTypeId="AREA4CLRY" style="width:200px;" ></td>
				</tr>
				<tr>
					<td align="right" rowspan="3" width="150px">备注：</td>
					<td align="left" colspan="3" rowspan="3"><input name="rdproject.remark" id="remark" class="nui-textarea" style="width:90%;height:60px"></td>
				</tr>
			</table>
		</div>
	</fieldset>
	<div style="width:auto;">
        <div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
            <table style="width:auto;">
                <tr>
                    <td style="width:100%;">
                        <a class="nui-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
                    </td>
                </tr>
            </table>           
        </div>
	</div> 
	<div id="datagrid2" class="nui-datagrid" style="width:auto;height:auto;" dataField="rdEmpProjs"  url="com.primeton.rdmgr.project.createApplication.queryRdEmpProjsInit.biz.ext"
 allowResize="true" pageSize="20" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
	    <div property="columns"> 
	    	<div type="checkcolumn"></div>           
	        <div field="userid" displayField="empname" width="100" headerAlign="center">员工姓名
	        	<input property="editor" name="RdEmpProj.userid" id="userid" class="nui-buttonedit" onbuttonclick="showEmployee1" showClose="false" required="true" allowInput="false"/>
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
	        <div field="pricetype" width="40" allowSort="true"  headerAlign="center" renderer="getPriceType">计价模式</div>
	    </div>
	</div>  
<fieldset>
<jsp:include page="/ame_common/misOpinion.jsp"/> <!-- fileids审核意见 附件addFiles-->
</fieldset>
</div>
<div style="text-align:center;padding:10px;">               
    <a class="nui-button" onclick="onOk(1)" id="commitButton" style="width:60px;margin-right:20px;">确定</a>
    <a class="nui-button" onclick="onOk(0)" id="breakPurCont"style="width:80px;margin-right:20px;">中止流程</a>     
    <a class="nui-button" onclick="onCancel" id="closeButton" style="width:60px;">关闭</a>       
</div>      
<script type="text/javascript" src="<%= request.getContextPath() %>/project/projectCreateApply/commonProjectProcess/projectProcess.js"></script> 
<script type="text/javascript">
	nui.parse();
	var url = '<%=request.getContextPath() %>';
	var form = new nui.Form("form1");
	var form_cust = new nui.Form("form_cust");
	var grid2 = nui.get("datagrid2");
	<%long workitemid = (Long)request.getAttribute("workItemID");%>
	init();
	function init(){
		document.getElementById("opinionHide").style.display="none";
		var data = {workitemid:<%=workitemid%>};
		var json = nui.encode(data);
		nui.ajax({
	        url: "com.primeton.rdmgr.project.createApplication.expandProject.biz.ext",
	        type: "post",
	        data: json ,
	        contentType:'text/json',
	        success: function (o) {
	            form.setData(o);
	            nui.get("checkplace").setText(o.rdproject.checkplace);
	            nui.get("manager").setValue(o.rdproject.manager);
		        nui.get("manager").setText(o.rdproject.managername);
	       		nui.get("finUnitId").setValue(o.rdproject.finUnitId);
	            nui.get("custid").setValue(o.rdproject.custid);
		        nui.get("custname1").setValue(o.rdproject.custname);
		        nui.get("custname1").setText(o.rdproject.custname);
	            nui.get("workitemid").setValue(<%=workitemid %>);
	            nui.get("processinstid").setValue(o.rdproject.processinstid);
	            //审核意见
	        	var processinstid = nui.get("processinstid").getValue();
				var grid = nui.get("datagrid1");
				grid.load({processInstID:processinstid});
				grid.sortBy("time", "desc");
				//相关人员初始化
	            grid2.load({"projectid":o.rdproject.projectId});
	            //可折叠隐藏的fileset（从相关数据区获取isNewCust）
	            if(o.isNewCust==1){//新客户
					document.getElementById("checkbox1").checked = true;
					//document.getElementById("checkbox1").disabled = 'false';
					var ck0 = document.getElementById("checkbox1");
		            var dom0 = document.getElementById("fd2");
				    dom0.className = !ck0.checked ? "hideFieldset" : "";
				    nui.get("custname1").disable();
				    form_cust.setData(o);
	            	nui.get("groupno").setValue(o.miscustinfo.groupno);
		        	nui.get("groupno").setText(o.miscustinfo.groupname);
	            }else{//已有客户
	            	document.getElementById("checkbox1").checked = false;
	            	document.getElementById("newcust").style.display = 'none';
	            	document.getElementById("checkbox1").style.display = 'none';
	            	var ck0 = document.getElementById("checkbox1");
		            var dom0 = document.getElementById("fd2");
				    dom0.className = !ck0.checked ? "hideFieldset" : "";
	            }
	            var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"miscustinfo","relationid":o.miscustinfo.custid});
				grid_0.sortBy("fileTime","desc");
	        },
	        error:function(){
	        	
	        }
	    });
	}
	//各种验证
	function onOk(e){
		if(e==0){
        	if(confirm("中止流程？")){//中止流程，直接调用saveData1方法
        		nui.get("auditstatus").setValue(2);
        		nui.get("commitButton").disable();
				nui.get("closeButton").disable();
    			SaveData1();
    			return;
        	}
    	}
		if(!checkTime()){
			return;
		}
		var RdEmpProj = grid2.getData();
		for(var i = 0 ; i<RdEmpProj.length;i++){
			if(RdEmpProj[i].pricetype ==null || RdEmpProj[i].pricetype == " "){
				alert("项目计价模式为空，请确认后再保存!");
				return;
			}
		}
		var ck0 = document.getElementById("checkbox1");
	    if(ck0.checked){//新客户
			if(!(form.validate() && form_cust.validate())){
				alert("表单信息填写不完整，请确认必输项是否填写！！");
				return;
			}
	    }else{
			if(!form.validate()){
				alert("表单信息填写不完整，请确认必输项是否填写！！");
				return;
			}
	    }
		var filePaths1 = document.getElementsByName("uploadfile1").length;
    	for(var j=0;j<filePaths1;j++){
    		var a=document.getElementsByName("remarkList1")[j].value;
    		if(a==null||a==""){
    			alert("新增附件不可以为空");
    			return false;
    		}
    	}
    	if(confirm("确认提交？")){
    		nui.get("commitButton").disable();
			nui.get("closeButton").disable();
	        document.getElementById("fileCatalog1").value="miscustinfo";
	        form4.submit();
    	}
	}
	function SaveData1(){
		var data = form.getData();
		var data_cust = form_cust.getData();
		var opioionform = new nui.Form("opioionform");
		var data1 = opioionform.getData();
		//是否新客户，miscustinfo是否带到逻辑流
		var ck0 = document.getElementById("checkbox1");
	    if(ck0.checked){//新客户
			var json = {rdproject:data.rdproject,misOpinion:data1.misOpinion,"rdEmpProj":grid2.getData(),"miscustinfo":data_cust.miscustinfo,isNewCust:"1"};
	    }else{
			var json = {rdproject:data.rdproject,misOpinion:data1.misOpinion,"rdEmpProj":grid2.getData(),"miscustinfo":data_cust.miscustinfo,isNewCust:"0"};
	    }
		var json1 = nui.encode(json);
		nui.ajax({
	        url: "com.primeton.rdmgr.project.createApplication.projectPMOCheck.biz.ext",
			type: 'POST',
			data: json1,	
			contentType: 'text/json',
	        success: function (o) {
	        	if("false"==o.out1){
	        		nui.get("commitButton").enable();
					nui.get("closeButton").enable();
	        		alert("合同编号输入有误,请重新输入!");
	        		return;
	        	}else{
	        		CloseWindow("ok");
	        	}
		    }
		});
	}
	//标准方法接口定义
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
	    }
	//选择销售合同弹窗
	function selectCont(){
		var btnEdit = this;
		nui.open({
	        url:"<%=request.getContextPath() %>/ame_common/contract_lookup.jsp",
	        title: "选择商务合同",
	        width: 1000,
	        height: 520,
	        allowResize: false,
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
	function addRow() {          
	    var newRow = { name: "New Row" };
	    grid2.addRow(newRow, 0);
	}
	function removeRow() {
	    var rows = grid2.getSelecteds();
	    if (rows.length > 0) {
	        grid2.removeRows(rows, true);
	    }
	}
	
	function getPriceType(e){
		return nui.getDictText('MIS_PRICETYPE',e.value);
	}
		
	function dictprojRole(e){
		return nui.getDictText('PRD_ROLE',e.value);//设置业务字典值
	}
	//设置日期格式
	
	function onDealDate(e){
		if(e.value){
			return e.value.substring(0,10);
		}
	}
	//处理日期
	function endTime(){
		var start = nui.get("startdate").getValue();
		var end = nui.get("expenddate").getValue();
		if(start){
			if(end){
				startDate = start.substring(0,4) + start.substring(5,7) + start.substring(8,10);
			    endDate   = end.substring(0,4) + end.substring(5,7) + end.substring(8,10);
		    	//项目开始日期不能大于预计结束日期。
				if(endDate < startDate){
					alert("项目开始日期不能大于预计结束日期!"); //项目开始日期不能大于预计结束日期!
					return false;
				}
			}
		}
		return true;
	}
	//grid2的表单验证
	function checkTime(){
		if(endTime()){
			var start="";
			var end="";
			var rows = grid2.getChanges();
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
		}else{
			return false;
		}
		return true;
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
					}
				}
			}
		});
	}
	
	//选择项目人
	function showEmployee1(e) {
		var projorgid = nui.get("finUnitId").getValue();
		if(projorgid==null||projorgid==""){
			alert("请先选择受益部门后再添加人员！")
			return;
		}
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
		                var json = nui.encode({"orgid":projorgid});
			        	nui.ajax({
				            url: "com.primeton.rdmgr.project.benefitToBenefitProject.getOrgSeq.biz.ext",
							type: 'POST',
							data: json,	
							contentType: 'text/json',
				            success: function (o) {
				            	if(o.org !=null ){
				            		var projOrgSeq = o.org.orgseq;
				            		if(projOrgSeq !=null && projOrgSeq !="" && orgseq !=null && orgseq !=""){
						            	var projOrgSeqArry = projOrgSeq.split('.');//截断
						            	var orgseqArry = orgseq.split('.');//截断
						            	var projorg='',userorg='';//事业部
						            	//项目所属事业部
						            	if(projOrgSeqArry[2] == '318' || projOrgSeqArry[2] == '12' || projOrgSeqArry[2] == '2904'|| projOrgSeqArry[2] == '30' || projOrgSeqArry[2] == '319'){
						            		projorg = projOrgSeqArry[2];
						            	}else{
						            		projorg = projOrgSeqArry[3];
						            	}
						            	//员工所属事业部
						            	if(orgseqArry[2] == '318' || orgseqArry[2] == '12' || orgseqArry[2] == '2904'|| orgseqArry[2] == '30' || orgseqArry[2] == '319'){
						            		userorg = orgseqArry[2];
						            	}else{
						            		userorg = orgseqArry[3];
						            	}
						            	var projectEmp = nui.get("datagrid2");
				                        var row = projectEmp.getSelected();
						                if(orgname == '济南技术中心'){//济南技术中心价
						            		var updateRow = {
					                        pricetype : '2'
					                        };
						            	}else if (orgname == '武汉交付中心'){//武汉交付中心价
						            		var updateRow = {
					                        pricetype : '3'
					                        };
						            	}else{
						            		//内部价
						            		if(projorg == userorg){
							                	var updateRow = {
						                        pricetype : '0'
						                        };
							                }else{//外部价
							                	var updateRow = {
						                       	pricetype : '1'
						                        };
							                }
						            	}
					                  	projectEmp.updateRow(row,updateRow);
					                }
				            	}
							}
				     	});	 
					}
				}
			}
		});
	}
	
	//可折叠隐藏的fileset
	function toggleFieldSet(ck, id) {
        var dom = document.getElementById(id);
        dom.className = !ck.checked ? "hideFieldset" : "";
        if(ck.checked==false){
	        nui.get("custname1").enable();
	        nui.get("custid").setValue(null);
// 	        nui.get("custname1").setValue(null);
// 	        nui.get("custname1").setText(null);
        }
    	var custname2 = nui.get("custname2").getValue();
        if(ck.checked==true){//新客户
	        nui.get("custid").setValue(null);
	        nui.get("custname1").disable();
	    	nui.get("custname1").setValue(custname2);
	    	nui.get("custname1").setText(custname2);
        }
    }
	function map() {        	
        nui.open({
            url: "<%=request.getContextPath() %>/ame_common/attendance/baiduMap.jsp",
            title: "地图信息", 
			width: 700,
            height: 450,
            onload: function () {
                var iframe = this.getIFrameEl();
                var longitude = nui.get("longitude").getValue();
                var latitude = nui.get("latitude").getValue();
                var checkplace = nui.get("checkplace").getValue();
                var data = {longitude:longitude,latitude:latitude,suggestId:checkplace};
                iframe.contentWindow.SetData(data);
            }, 
            ondestroy: function (action) {
            	var iframe = this.getIFrameEl();
				var data = iframe.contentWindow.GetData();
				data = nui.clone(nui.decode(data));
				if (action == "ok") {
                	nui.get("checkplace").setValue(data.suggestId);
                	nui.get("checkplace").setText(data.suggestId);
                	nui.get("longitude").setValue(data.longitude);
                	nui.get("latitude").setValue(data.latitude);
                }
            }
        });
    }
    
    //清楚地理位置
    function clean(){
		nui.get("checkplace").setValue(null);
		nui.get("checkplace").setText(null);
		nui.get("longitude").setValue(null);
		nui.get("latitude").setValue(null);
  	}
  	
  	function changeOcstartdate(){
  		var isconproj = nui.get("isconproj").getValue();
  		if(isconproj == '1'){
        	nui.get("ocstartdate").setRequired(true);
        }else{
        	nui.get("ocstartdate").setRequired(false);
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