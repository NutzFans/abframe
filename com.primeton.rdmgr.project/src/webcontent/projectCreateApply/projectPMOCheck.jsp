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
<title>PMO审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script src="../common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<%long workitemid = (Long)request.getAttribute("workItemID");%>
<div class="nui-fit" style="border:solid 1px #aaa;padding:0px;width:auto">
<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
<div id="form1" style="width:auto">
	<fieldset style="border:solid 1px #aaa;padding:3px; width:auto">
	<legend>项目申请信息</legend>
	<input name="rdproject.projectId" id="projectId" class="nui-hidden">
	<input class="nui-hidden" name="rdproject.longitude" id="longitude"/>
	<input class="nui-hidden" name="rdproject.latitude" id="latitude"/>
	<table style="width:auto">
		<tr>
			<td align="right" width="120px">项目名称：</td>
			<td align="left"><input name="rdproject.projectName" id="projectName" class="nui-textbox" required="true" style="width: 250px;"></td>
			<td align="right" width="120px">项目类型：</td>
			<td align="left"><input name="rdproject.projectType" id="projectType" required="true" class="nui-dictcombobox" dictTypeId="PROJECT_TYPE" style="width: 200px;"></td>
		</tr>
		<tr>
			<td align="right" width="120px">项目编号：</td>
			<td align="left"><input name="rdproject.projectno" id="projectno" class="nui-textbox" required="true" style="width: 250px;"></td>
			<td align="right" width="120px">项目成本类型：</td>
			<td align="left"><input name="rdproject.pcosttype" id="pcosttype" required="true" class="nui-dictcombobox" dictTypeId="AME_PCOSTTYPE" style="width: 200px;"></td>
		</tr>
		<tr>
			<td align="right" width="120px">项目负责人：</td>
			<td align="left"><input property="editor" name="rdproject.manager" id="manager" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" style="width: 200px;" required="true" allowInput="false"/></td>
			<td align="right" width="120px">对应商务合同：</td>
			<td align="left"><input name="rdproject.contnum" id="contnum" onbuttonclick="selectCont" class="nui-buttonedit" 
			required="false"  emptyText="请选择内部商务合同" allowInput="false" style="width: 120px;"/><input type='button' align='center' value='清除合同'  onclick='javascript:clearContnum()' style="width:80px;"/></td>
		</tr>
		<tr>
			<td align="right" width="120px">项目实施负责部门：</td>
			<td align="left"><input name="rdproject.managerdept" id="managerdept" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
			filterType="like" textField="orgname" required="true" valueField="orgid"  allowInput="true" dataField="allorgs" style="width: 250px;"></td>
			<td align="right" width="120px">受益部门：</td>
			<td align="left"><input name="rdproject.omOrganization.orgid" id="finUnitId" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
			textField="orgname" valueField="orgid" dataField="allorgs" required="true" allowInput="true" style="width: 200px;"></td>
		</tr>
		<tr>
			<td align="right" width="120px">对应客户：</td>
			<td align="left"><input name="rdproject.custid" id="custid" onbuttonclick="selectCustName" class="nui-buttonedit" 
			required="true"  emptyText="请选择客户" allowInput="false" style="width: 250px;"/></td>
			<td align="right" width="120px">成本跟踪阈值：</td>
			<td align="left"><input name="rdproject.remindfz" id="remindfz" class="nui-textbox" required="true" style="width: 200px;"><span> 元</span></td>
		</tr>
		<tr> 
			<td align="right" width="120px">项目商务状态：</td>
			<td align="left"><input name="rdproject.outstatus" id="outstatus" style="width: 250px;" required="true"  class="nui-dictcombobox" dictTypeId="MIS_PROJOUTSTATUS"></td>
			<td align="right" width="120px">项目交付状态：</td>
			<td align="left"><input name="rdproject.projectDestatus" id="projectDestatus" style="width: 200px;" required="true"  class="nui-dictcombobox" dictTypeId="MIS_PROJDESTATUS"></td>
		</tr> 
		<tr>
			<td align="right" width="120px">项目开始日期：</td>
			<td align="left"><input name="rdproject.startdate" id="startdate" style="width: 250px;" class="nui-datepicker" required="false" ></td>
			<td align="right" width="120px">预计结束日期：</td>
			<td align="left"><input name="rdproject.expenddate" id="expenddate" class="nui-datepicker" required="false" style="width: 200px;"></td>
		</tr>
		<tr>
			<td align="right" width="120px">项目创建申请人：</td>
			<td align="left"><input name="rdproject.createapplicant" id="createapplicant" style="width: 250px;" class="nui-combobox" url="com.primeton.rdmgr.labor.mispricebiz.selectEmployee.biz.ext"
			textField="empname" valueField="userid" allowInput="true"  nullText="" required="true" dataField="omEmployees"></td>
			<td align="right" width="120px">考勤规则：</td>
			<td align="left"><input name="rdproject.ruleid" id="ruleid" class="nui-buttonedit" onbuttonclick="chooseRule"  style="width: 200px;"></td>
		</tr>
		<tr>
			<td align="right" width="120px">实施城市：</td>
			<td align="left"><input name="rdproject.implementcity" style="width: 250px;" id="implementcity" class="nui-dictcombobox" dictTypeId="AREA4CLRY"  allowInput = "true"></td>
			<td align="right" width="120px">是否延续性项目：</td>
			<td align="left"><input name="rdproject.isconproj" id="isconproj" style="width: 200px;"  class="nui-dictcombobox" dictTypeId="MIS_YN" required = "true" onValuechanged="changeOcstartdate"></td>
		</tr>
		<tr>
			<td align="right" width="120px">外部成本开始日期：</td>
			<td align="left"><input name="rdproject.ocstartdate" style="width: 250px;" id="ocstartdate" class="nui-datepicker"   ></td>
			<td align="right" width="120px">是否有外包：</td>
			<td align="left"><input name="rdproject.ishavewb"  class="nui-dictcombobox" dictTypeId="MIS_YN" required = "true" style="width: 200px;"></td>
		</tr>
		<tr>
			<td align="right" width="120px">预计签订日期：</td>
			<td align="left"><input name="rdproject.contplandate" style="width: 250px;" id="contplandate" class="nui-datepicker"   ></td>
			<td align="right" width="120px">合同预计金额：</td>
			<td align="left"><input name="rdproject.expcontsum" id="expcontsum" class="nui-textbox"  style="width: 200px;" onvalidation="checkNum1"></td>
		</tr>
		<tr>
			<td align="right" width="120px">商机来源：</td>
			<td align="left"><input name="rdproject.bosource"  class="nui-dictcombobox" dictTypeId="AME_BOSOURCE" style="width: 250px;"></td>
		</tr>
		<tr>
			<td align="right" width="120px">项目办公位置:</td>
			<td align="left" colspan="3"><input name="rdproject.checkplace" id="checkplace" class="nui-buttonedit" onbuttonclick="map()" style="width:550px" allowInput="false"/>
			<input type='button' align='center' value='清除位置'  onclick='javascript:clean()'/></td>
		</tr>
		<tr>
			<td align="right" rowspan="3" width="120px">备注：</td>
			<td align="left" colspan="3" rowspan="3"><input name="rdproject.remark" id="remark" class="nui-textarea" style="width:770px;height:60px"></td>
		</tr>
	</table>
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
 allowResize="true" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
	    <div property="columns"> 
	    	<div type="checkcolumn"></div>           
	        <div field="userid" displayField="empname" width="100" headerAlign="center">员工姓名
	        	<input property="editor" name="RdEmpProj.userid" id="userid" class="nui-buttonedit" onbuttonclick="showEmployee1" showClose="false" required="true" allowInput="false"/>
	        </div>                          
	        <div field="projRole" width="100" headerAlign="center" renderer="dictprojRole">角色
	        	<input property="editor" name="RdEmpProj.projRole" id="projRole" property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="PRD_ROLE"/>
	        </div>
	        <div field="beginDate" width="100" allowSort="true" dateFormat="yyyy-MM-dd" renderer="onDealDate" headerAlign="center">进入时间
	        	<input property="editor" name="RdEmpProj.beginDate" id="beginDate" renderer="onDealDate" property="editor" class="nui-datepicker" style="width:100px"/>
	        </div>
	        <div field="endDate" width="100" allowSort="true" dateFormat="yyyy-MM-dd" renderer="onDealDate" headerAlign="center">退出时间
	        	<input property="editor" name="RdEmpProj.endDate" id="endDate" property="editor" class="nui-datepicker" style="width:100px;"/>
	        </div>
	        <div field="pricetype" width="50" allowSort="true"  headerAlign="center" renderer="getPriceType">计价模式
				<input property="editor" name="RdEmpProj.pricetype" id="pricetype" property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="MIS_PRICETYPE"/>
			</div>
	    </div>
	</div>    
	<%-- <div style="width:98%">
		<jsp:include page="/ame_common/detailFile.jsp"/>
	</div> --%>
</div>
<fieldset style="width: auto">
<jsp:include page="/ame_common/misOpinion.jsp"/> <!-- fileids审核意见 附件addFiles-->
<jsp:include page="/ame_common/addFiles.jsp"/>
</fieldset>
</div>
<div style="text-align:center;padding:10px;">           
    <a class="nui-button" onclick="onOk" id="commitButton" style="width:60px;margin-right:20px;">确定</a>       
    <a class="nui-button" onclick="onCancel" id="closeButton" style="width:60px;">关闭</a>       
</div>   
<script type="text/javascript">
nui.parse();
var grid2 = nui.get("datagrid2");
var form = new nui.Form("form1");
var projectno="";
function init(){
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
            nui.get("ruleid").setText(o.rdproject.rulename);
            projectno=o.rdproject.projectno;
           /*  var grid_0 = nui.get("grid_0");
			grid_0.load({"groupid":"rdproject","relationid":o.rdproject.projectId});
			grid_0.sortBy("fileTime","desc"); */
            nui.get("custid").setValue(o.rdproject.custid);
	        nui.get("custid").setText(o.rdproject.custname);
	        nui.get("contnum").setValue(o.rdproject.contnum);
	        nui.get("contnum").setText(o.rdproject.contnum);
	        nui.get("manager").setValue(o.rdproject.manager);
	        nui.get("manager").setText(o.rdproject.managername);
	        nui.get("createapplicant").setValue(o.rdproject.createapplicant);
	        nui.get("createapplicant").setText(o.rdproject.createapplicantname);
	        nui.get("finUnitId").setValue(o.rdproject.finUnitId);
            nui.get("workitemid").setValue(<%=workitemid %>);
            nui.get("backTo").setData(o.rdproject.backList);
            nui.get("processinstid").setValue(o.rdproject.processinstid);
            nui.get("remindfz").setValue(o.rdproject.remindfz);
            if(o.rdproject.isconproj == '1'){
            	nui.get("ocstartdate").setRequired(true);
            }
            //流程提示信息
            promptInit({"workItemID": <%=workitemid%>});
            //审核意见
        	var processinstid = nui.get("processinstid").getValue();
			var grid = nui.get("datagrid1");
			grid.load({processInstID:processinstid});
			grid.sortBy("time", "desc");
			//初始化处理意见
			initMisOpinion({auditstatus:"1"});
            //相关人员初始化
            grid2.load({"projectid":o.rdproject.projectId});
        }
    });
}
init();
function onOk(){
	var auditstatus = nui.get("auditstatus").getValue();
	if(auditstatus!=2&&auditstatus!=0){
		if(!form.validate()){
			alert("表单信息填写不完整，请确认必输项是否填写！!");
			return;
		}
		var RdEmpProj = grid2.getData();
		for(var i = 0 ; i<RdEmpProj.length;i++){
			if(RdEmpProj[i].pricetype ==null || RdEmpProj[i].pricetype == " "){
				alert("项目计价模式为空，请确认后再保存!");
				return;
			}
		}
		var filePaths = document.getElementsByName("uploadfile").length;
		for(var j=0;j<filePaths;j++){
			var a=document.getElementsByName("remarkList")[j].value;
			if(a==null||a==""){
				alert("新增附件不可以为空");
				return false;
			}
		}
		//因为公用一个页面（PMO审核项目创建申请，PMO负责人审核）还要考虑退回
		//我的解决方案是判断进页面的时候有没有从数据库读取出来projectNo，如果读出来有数据，证明是PMO负责人审核环节，就不需要重新验证
		var projectno1 = nui.get("projectno").getValue();
		if(projectno==projectno1){//PMO负责人审核环节、或者退回之后没有修改项目编号的情况
			if(confirm("确认提交？")){
				nui.get("commitButton").disable();
				nui.get("closeButton").disable();
			    document.getElementById("fileCatalog").value="MisOpinion";
				form2.submit();
			}
		}else{//PMO审核项目创建申请
			nui.ajax({
		        url: "com.primeton.rdmgr.project.createApplication.validateProjNo.biz.ext",
				type: 'POST',
				data: {projectno:projectno1},	
				contentType: 'text/json',
		        success: function (o) {
		        	if(o.isUnique==true){
			        	if(confirm("确认提交？")){
							nui.get("commitButton").disable();
							nui.get("closeButton").disable();
						    document.getElementById("fileCatalog").value="MisOpinion";
							form2.submit();
						}
		        	}else{
		        		alert("项目编号已存在！请重新填写！");
		        	}
		        	
			    }
			});
		}
	}else{
		nui.get("commitButton").disable();
		nui.get("closeButton").disable();
	    document.getElementById("fileCatalog").value="MisOpinion";
		form2.submit();
	}
}

function clearContnum(){
	nui.get("contnum").setValue(null);
	nui.get("contnum").setText(null);
}    
function SaveData(){
	var auditstatus = nui.get("auditstatus").getValue();
	if(auditstatus!=2&&auditstatus!=0){
		if(!checkTime()){
			return;
		}else{
			var data = form.getData();
			if(form.validate()){ 
				var opioionform = new nui.Form("opioionform");
				var data1 = opioionform.getData();
				var json = {"rdproject":data.rdproject,"misOpinion":data1.misOpinion,"rdEmpProj":grid2.getData()}
				var json1 = nui.encode(json);
				nui.ajax({
			        url: "com.primeton.rdmgr.project.createApplication.projectPMOCheck.biz.ext",
					type: 'POST',
					data: json1,	
					contentType: 'text/json',
			        success: function (o) {
			        	if(o.exception != null){
			        		alert("PMO负责人审核失败，请联系信息技术部");
			        		nui.get("commitButton").enable();
							nui.get("closeButton").enable();
			        	}else{
			        		CloseWindow("ok");
			        	}
				    }
				});
			} 
		}
	}else{
		if(confirm("确认提交？")){
			var data = form.getData();
			var opioionform = new nui.Form("opioionform");
			var data1 = opioionform.getData();
			var json = {"rdproject":data.rdproject,"misOpinion":data1.misOpinion,"rdEmpProj":grid2.getData()}
			var json1 = nui.encode(json);
			nui.ajax({
		        url: "com.primeton.rdmgr.project.createApplication.projectPMOCheck.biz.ext",
				type: 'POST',
				data: json1,	
				contentType: 'text/json',
		        success: function (o) {
		        	if(o.exception != null){
		        		alert("PMO负责人审核失败，请联系信息技术部");
		        		nui.get("commitButton").enable();
						nui.get("closeButton").enable();
		        	}else{
		        		CloseWindow("ok");
		        	}
			    }
			});
		}else{
			nui.get("commitButton").enable();
			nui.get("closeButton").enable();
		}
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
//选择客户
function selectCustName(){
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
		                var orgid = data.orgid;
		                var orgname = data.orgname;//人员所属部门
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
					                var projectEmp = nui.get("datagrid2");
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
  	
  	function chooseRule(){
  		nui.open({
            url: "<%=request.getContextPath() %>/ame_common/attendance/selectAttendanceRule.jsp",
            title: "地图信息", 
			width: 850,
            height: 400,
            ondestroy: function (action) {
            	var iframe = this.getIFrameEl();
				var data = iframe.contentWindow.GetData();
				data = nui.clone(nui.decode(data));
				if (action == "ok") {
                	nui.get("ruleid").setValue(data.ruleid);
                	nui.get("ruleid").setText(data.rulename);
                }
            }
        });
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
		if(expcontsum!=null&&expcontsum!=""){
			if(IsNumber(expcontsum)==false){
				alert("请输入正确数字格式！");
				nui.get("expcontsum").setValue("");
				return;
			}
		}
	}
  	
 
  	
</script>
</body>
</html>