<%@page import="com.eos.workflow.data.WFWorkItem"%>
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
<title>新客户商务审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script src="../common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<%long workitemid = (Long)request.getAttribute("workItemID");%>
<div class="nui-fit" style="border:solid 1px #aaa;padding:0px;width:auto">
<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
<div id="checkbox1" style="display: none"><input type="checkbox"  onclick="toggleFieldSet(this)"/>不是新客户请勾选</div>
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
		<div id="form_proj" style="width:auto">
			<input name="rdproject.projectId" id="projectId" class="nui-hidden">
			<input name="rdproject.custid" id="custid" class="nui-hidden">
			<input class="nui-hidden" name="rdproject.longitude" id="longitude"/>
			<input class="nui-hidden" name="rdproject.latitude" id="latitude"/>
			<table style="width:auto">
				<tr>
					<td align="right" width="120px">项目名称：</td>
					<td align="left"><input name="rdproject.projectName" id="projectName" readonly="readonly" class="nui-textbox" style="width:350px;"></td>
					<td align="right" width="120px">项目类型：</td>
					<td align="left"><input name="rdproject.projectType" id="projectType" readonly="readonly" class="nui-dictcombobox" dictTypeId="PROJECT_TYPE" style="width:150px;"></td>
				</tr>
				<tr>
					<td align="right" width="120px">项目编号：</td>
					<td align="left"><input name="rdproject.projectno" id="projectno" readonly="readonly" class="nui-textbox" ></td>
					<td align="right" width="120px">项目成本类型：</td>
					<td align="left"><input name="rdproject.pcosttype" id="pcosttype" readonly="readonly" class="nui-dictcombobox" dictTypeId="AME_PCOSTTYPE" style="width:100px"></td>
				</tr>
				<tr><td align="right" width="120px">项目负责人：</td>
					<td align="left"><input property="editor" name="rdproject.manager" readonly="readonly" id="manager" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false"  allowInput="false"/></td>
				</tr>
				<tr>
					<td align="right" width="120px">项目实施负责部门：</td>
					<td align="left"><input name="rdproject.managerdept" id="managerdept" class="nui-combobox" readonly="readonly" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
					filterType="like" textField="orgname"  valueField="orgid"  allowInput="true" style="width:200px;" dataField="allorgs"></td>
					<td align="right" width="120px">受益部门：</td>
					<td align="left"><input name="rdproject.omOrganization.orgid" id="finUnitId" class="nui-combobox" readonly="readonly" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
					textField="orgname" valueField="orgid" dataField="allorgs"  allowInput="true" style="width:200px;"></td>
				</tr>
				<tr>
					<td align="right" width="120px">对应客户：</td>
					<td align="left"><input name="rdproject.custname" id="custname1" readonly="readonly" onbuttonclick="selectCustmer" class="nui-buttonedit" 
					 style="width:220px" emptyText="请选择客户" allowInput="false"/></td>
					<td align="right" width="120px">成本跟踪阈值：</td>
					<td align="left"><input name="rdproject.remindfz" id="remindfz" readonly="readonly" class="nui-textbox" ><span> 元</span></td>
				</tr>
				<tr> 
					<td align="right" width="120px">项目商务状态：</td>
					<td align="left"><input name="rdproject.outstatus" id="outstatus" readonly="readonly" style="width:100px" class="nui-dictcombobox" dictTypeId="MIS_PROJOUTSTATUS"></td>
					<td align="right" width="120px">对应商务合同：</td>
					<td align="left"><input name="rdproject.contnum" id="contnum" readonly="readonly" onbuttonclick="selectCont" class="nui-buttonedit" 
					required="false" style="width:145px" emptyText="请选择内部商务合同" allowInput="false"/></td>
				</tr> 
				<tr>
					<td align="right" width="120px">项目开始日期：</td>
					<td align="left"><input name="rdproject.startdate" id="startdate" readonly="readonly" class="nui-datepicker" required="false" style="width:110px"></td>
					<td align="right" width="120px">预计结束日期：</td>
					<td align="left"><input name="rdproject.expenddate" id="expenddate" readonly="readonly" class="nui-datepicker" required="false" style="width:110px"></td>
				</tr>
				<tr>
					<td align="right" width="120px">实施城市：</td>
					<td align="left"><input name="rdproject.implementcity" id="implementcity" class="nui-dictcombobox" dictTypeId="AREA4CLRY" style="width:150px;" ></td>
					<td align="right" width="120px">项目创建申请人：</td>
					<td align="left"><input name="rdproject.createapplicant" readonly="readonly" id="createapplicant" class="nui-combobox" url="com.primeton.rdmgr.labor.mispricebiz.selectEmployee.biz.ext"
					textField="empname" valueField="userid" allowInput="true"  nullText="" readonly="readonly" style="width:90px;" dataField="omEmployees"></td>
				</tr>
				<tr>
					<td align="right" width="120px">项目办公位置:</td>
					<td align="left"><input name="rdproject.checkplace" id="checkplace" class="nui-buttonedit" readonly="readonly"  style="width:175px" allowInput="false"/></td>
					<td align="right" width="120px">是否有外包：</td>
					<td align="left"><input name="rdproject.ishavewb" style="width:90px" class="nui-dictcombobox" dictTypeId="MIS_YN" readonly="readonly" ></td>
				</tr>
				<tr>
					<td align="right" rowspan="3" width="120px">备注：</td>
					<td align="left" colspan="3" rowspan="3"><input name="rdproject.remark" readonly="readonly" id="remark" class="nui-textarea" style="width:770px;height:60px"></td>
				</tr>
			</table>
		</div>
	</fieldset>
	<fieldset style="width: auto">
	<jsp:include page="/ame_common/misOpinion.jsp"/> <!-- fileids审核意见 附件addFiles-->
	<jsp:include page="/ame_common/addFiles.jsp"/>
	</fieldset>
</div>
<div style="text-align:center;padding:10px;">
    <a class="nui-button" onclick="onOk" id="commitButton" style="width:60px;margin-right:20px;">确定</a>       
    <a class="nui-button" onclick="onCancel" id="closeButton" style="width:60px;">关闭</a>       
</div>   
<script type="text/javascript" src="<%= request.getContextPath() %>/project/projectCreateApply/commonProjectProcess/projectProcess.js"></script> 
<script type="text/javascript">
nui.parse();
var url = '<%=request.getContextPath() %>';
var form_proj = new nui.Form("form_proj");
var form_cust = new nui.Form("form_cust");
var opioionform = new nui.Form("opioionform");
var isNewCust = "";//是否是新客户
init();
function init(){
	var data = {workitemid:<%=workitemid%>};
	var json = nui.encode(data);
	nui.ajax({
        url: "com.primeton.rdmgr.project.createApplication.expandProject.biz.ext",
        type: "post",
        data: json ,
        contentType:'text/json',
        success: function (o) {
            form_cust.setData(o);
            //暂时做出来的功能是，商务只能看项目的信息，不態更改项目信息（因为项目数据不会带到后台去）
            form_proj.setData(o);
            nui.get("checkplace").setText(o.rdproject.checkplace);
            nui.get("custid").setValue(o.rdproject.custid);//
	        nui.get("custname1").setValue(o.rdproject.custname);
	        nui.get("custname1").setText(o.rdproject.custname);
	        nui.get("manager").setValue(o.rdproject.manager);
	        nui.get("manager").setText(o.rdproject.managername);
	        nui.get("finUnitId").setValue(o.rdproject.finUnitId);
            nui.get("remindfz").setValue(o.rdproject.remindfz);
            isNewCust = o.isNewCust;
            if(o.isNewCust=="1"){
            	document.getElementById("checkbox1").style.display = "";
            	nui.get("groupno").setValue(o.miscustinfo.groupno);
	        	nui.get("groupno").setText(o.miscustinfo.groupname);
            }
           	var grid_0 = nui.get("grid_0");
			grid_0.load({"groupid":"miscustinfo","relationid":o.miscustinfo.custid});
			grid_0.sortBy("fileTime","desc");
			
            nui.get("workitemid").setValue(<%=workitemid %>);
            nui.get("backTo").setData(o.rdproject.backList);
            nui.get("processinstid").setValue(o.rdproject.processinstid);
            //流程提示信息
            promptInit({"workItemID": <%=workitemid%>});
            //审核意见
        	var processinstid = nui.get("processinstid").getValue();
			var grid = nui.get("datagrid1");
			grid.load({processInstID:processinstid});
			grid.sortBy("time", "desc");
			//初始化处理意见
			initMisOpinion({auditstatus:"1"});
        }
    });
}

function onOk(){
	if(!(form_proj.validate()&&form_cust.validate()&&opioionform.validate())){
		alert("表单信息填写不完整，请确认必输项是否填写！!");
		return;
	}
	var filePaths1 = document.getElementsByName("uploadfile1").length;
	for(var j=0;j<filePaths1;j++){
		var a=document.getElementsByName("remarkList1")[j].value;
		if(a==null||a==""){
			alert("客户新增附件不可以为空");
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
	var filePaths = document.getElementsByName("uploadfile").length;
	for(var j=0;j<filePaths;j++){
		var a=document.getElementsByName("remarkList")[j].value;
		if(a==null||a==""){
			alert("处理意见新增附件不可以为空");
			return false;
		}
	}
    document.getElementById("fileCatalog").value="MisOpinion";
	form2.submit();
}    

	function SaveData(){
		var data = form_cust.getData();
		var data_proj = form_proj.getData();
		if(form_cust.validate()){ 
			var opioionform = new nui.Form("opioionform");
			var data1 = opioionform.getData();
			var json = {"miscustinfo":data.miscustinfo,"misOpinion":data1.misOpinion,"rdproject":data_proj.rdproject,"isNewCust":isNewCust};
			var json1 = nui.encode(json);
			nui.ajax({
		        url: "com.primeton.rdmgr.project.createApplication.projectPMOCheck.biz.ext",
				type: 'POST',
				data: json1,	
				contentType: 'text/json',
		        success: function (o) {
		        	if(o.exception != null){
		        		alert("提交失败，请联系信息技术部");
		        		nui.get("commitButton").enable();
						nui.get("closeButton").enable();
		        	}
		        	CloseWindow("ok");
			    }
			});
		} 
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
                    btnEdit.setValue(data.text);
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
	
	//勾选不是新客户框
    function toggleFieldSet(ck){
    	if(ck.checked){
    		document.getElementById("fd2").style.display = "none";
    		nui.get("custname1").setReadOnly(false);
    		isNewCust = "0";
    	}else{
    		document.getElementById("fd2").style.display = "";
    		nui.get("custname1").setReadOnly(true);
    		nui.get("custid").setValue(nui.get("custid1").getValue());//将新客户id赋值给报价客户id
    		isNewCust = "1";
    	}
    }
</script>
</body>
</html>