<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhouwenjie
  - Date: 2016-07-15 10:54:04
  - Description:
-->
<head>
<title>申请表单</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
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
<div class="nui-fit" style="border:solid 0px #aaa;padding:0px;width:auto">
<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
<div id="form_selectCustmer" style="width:100%;">
	<table  border="0" width="450px" class="form_table" id="table_file">
		<tr>
			<td align="right" width="120px">客户名称：</td>
			<!-- 只有custname的情况下，验证不通过，创建新客户的时候并没有产生id，所以要拆分id 和 name (王林琼)-->
			<!-- <td align="left" width="300px"><input name="rdproject.custid" id="custid" onbuttonclick="selectCustmer" class="nui-buttonedit" required="true" style="width:220px" allowInput="false"/> -->
			<td align="left" width="300px"><input name="rdproject.custname" id="custname1" onbuttonclick="selectCustmer" class="nui-buttonedit" required="true" style="width:220px" allowInput="false"/>
				<input type="checkbox"  id="checkbox1" onclick="toggleFieldSet(this, 'fd2')" hideFocus/>新客户</td>
		</tr>
	</table>
</div>
<!-- 新客户信息  s -->
<fieldset id="fd2" style="width:98%;">
	<legend>创建新客户</legend>
	<jsp:include page="/ame_product/ProQuotation/misCustInfo.jsp"/>
	<jsp:include page="/ame_common/addFiles1.jsp"/>
	
<!-- 新客户信息  s -->
</fieldset>
<fieldset id="field1" style="border:solid 1px #aaa;">
<legend>新建新项目</legend>
<div id="form1" style="width:100%;">
	<!-- 但是创建新客户的时候并没有产生id，所以要拆分id 和 name(王林琼) -->
	<input name="rdproject.custid" id="custid" class="nui-hidden" />
	<input class="nui-hidden" name="rdproject.projectId" id="projectId"/>
	<input class="nui-hidden" name="rdproject.longitude" id="longitude"/>
	<input class="nui-hidden" name="rdproject.latitude" id="latitude"/>
	<table style="width: 100%"> 
		<tr>
			<td align="right" width="200px">项目名称：</td>
			<td align="left" colspan="3"><input name="rdproject.projectName" id="projectName" class="nui-textbox" required="true" style="width:590px;"></td>
			<td align="right" width="125px">是否延续性项目：</td>
			<td align="left"><input name="rdproject.isconproj" id="isconproj" style="width:190px" class="nui-dictcombobox" dictTypeId="MIS_YN" required = "true"></td>
		</tr>
		<tr>
			<td align="right" width="120px">受益部门：</td>
			<td align="left"><input name="rdproject.omOrganization.orgid" id="finUnitId" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
			filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:190px;" required="true"></td>
			<td align="right" width="120px">实施负责部门：</td>
			<td align="left"><input name="rdproject.managerdept" id="managerdept" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
			filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:190px;" required="true"></td>
			<td align="right" width="125px">实施城市：</td>
			<td align="left"><input name="rdproject.implementcity" style="width:190px" class="nui-dictcombobox" dictTypeId="AREA4CLRY" allowInput = "true"></td>
		</tr>
		<tr>
			<td align="right" width="150px">项目负责人：</td>
			<td align="left" width="250px"><input property="editor" name="rdproject.manager" id="manager" class="nui-buttonedit" style="width:150px;" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false"/></td>
			<td align="right" width="120px">项目开始日期：</td>
			<td align="left"><input name="rdproject.startdate" id="startdate" allowInput="true"  class="nui-datepicker" required="false" style="width:190px"></td>
			<td align="right" width="125px">预计结束日期：</td>
			<td align="left"><input name="rdproject.expenddate" id="expenddate" allowInput="true"  class="nui-datepicker" required="false" style="width:190px"></td>
		</tr>
		<tr>
			<td align="right" width="120px">项目类型：</td>
			<td align="left" width="250px"><input name="rdproject.projectType" id="projectType" class="nui-dictcombobox" dictTypeId="PROJECT_TYPE" style="width:150px;" required="true"></td>
			<td align="right" width="120px">项目商务状态：</td>
			<td align="left"><input name="rdproject.outstatus" id="outstatus" required="true" style="width:190px" class="nui-dictcombobox" dictTypeId="MIS_PROJOUTSTATUS"></td>
			<td align="right" width="120px">项目交付状态：</td>
			<td align="left"><input name="rdproject.projectDestatus" id="projectDestatus" required="true" style="width:190px" class="nui-dictcombobox" dictTypeId="MIS_PROJDESTATUS"></td>
		</tr>
		<tr>
			<td align="right" width="120px">预计合同额：</td>
			<td align="left"><input name="rdproject.expcontsum"  id="expcontsum" style="width:150px" class="nui-textbox"  onvalidation="checkNum1"></td>
			<td align="right" width="125px">商机来源：</td>
			<td align="left"><input name="rdproject.bosource" style="width:190px" class="nui-dictcombobox" dictTypeId="AME_BOSOURCE"></td>
			<td align="right" width="120px">合同预计签订日期：</td>
			<td align="left" ><input name="rdproject.contplandate" style="width:190px" id="contplandate" class="nui-datepicker" style="width:150px;"></td>
		</tr>
		<tr>
			<td align="right" width="125px">是否有外包：</td>
			<td align="left" colspan="3"><input name="rdproject.ishavewb" style="width:150px" class="nui-dictcombobox" dictTypeId="MIS_YN" required = "true"><span style="color:red;">(提醒：如果客户方禁止外包，项目组不允许使用外包)</span></td>
		</tr>
		<tr>
			<td align="right" width="120px">项目办公位置:</td>
			<td align="left" colspan="3"><input name="rdproject.checkplace" id="checkplace" class="nui-buttonedit" onbuttonclick="map()" style="width:450px" allowInput="false"/>
			<a class="nui-button" iconCls="icon-no" onclick="clean()"  plain="true">清除位置</a>
			</td>
		</tr>
		<tr>
			<td align="right" rowspan="3" width="120px">备注:</td>
			<td align="left" colspan="5" rowspan="3"><input name="rdproject.remark" id="remark" class="nui-textarea" style="width:940px;height:65px"></td>
		</tr>
	</table>
</div>
</fieldset>
<div style="width:auto;">
        <div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
            <table style="width:auto;">
            	<tr>
            		<td>
                		相关人员
                	</td>
                </tr>
            </table>           
        </div>
</div> 
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
 allowResize="true" pageSize="20" allowCellEdit="true" allowCellSelect="true" showPager="false"multiSelect="true" editNextOnEnterKey="true">
    <div property="columns"> 
    	<div type="checkcolumn"></div>           
        <div field="userid" width="100" displayField="empname" headerAlign="center">员工姓名
        	<input property="editor" name="RdEmpProj.userid" id="userid" class="nui-buttonedit" onbuttonclick="showEmployee1" showClose="false" required="true" allowInput="false"/>
        </div>                          
        <div field="projRole" width="100" headerAlign="center" renderer="dictprojRole">角色
        	<input property="editor" name="RdEmpProj.projRole" id="projRole" property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="PRD_ROLE"/>
        </div>
        <div field="beginDate" width="100" dateFormat="yyyy-MM-dd" renderer="onDealDate" headerAlign="center">进入日期
        	<input property="editor" name="RdEmpProj.beginDate" id="beginDate"  property="editor" class="nui-datepicker" style="width:100px"/>
        </div>
        <div field="endDate" width="100" dateFormat="yyyy-MM-dd" renderer="onDealDate" headerAlign="center">退出日期
        	<input property="editor" name="RdEmpProj.endDate" id="endDate"  property="editor" class="nui-datepicker" style="width:100px;"/>
        </div>
        <div field="pricetype" width="40" allowSort="true"  headerAlign="center" renderer="getPriceType">计价模式</div>
    </div>
</div> 
<form id="opioionform" method="post">
    <div style="padding: 5px;" id="opinionHide">
        <table style="table-layout: fixed;">
        	<tr id="salesEdit">
                <td style="width: 150px;" align="right">审核结果：</td>
                <td style="width: 250px;">
					<input name="misOpinion.auditstatus" id="auditstatus" class="nui-dictradiogroup" style="width: 250px;" 
						required="false" dictTypeId="MIS_AUDITSTATUS" onvaluechanged="show()" value="1" />
                </td>
            </tr>
            <tr>
                <td style="width: 150px;height: auto;" align="right">任务处理说明：</td>
                <td colspan="3">
                    <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" 
                    	style="width: 600px;height: 40px;"/>
                </td>
            </tr>
        </table>
    </div>
</form>   
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">      
    <a class="nui-button" onclick="onOk" id="commitButton" style="width:80px;margin-right:20px;">提交申请</a>       
    <a class="nui-button" onclick="onCancel" id="closeButton" style="width:60px;">关闭</a>       
</div>
<script type="text/javascript" src="<%= request.getContextPath() %>/project/projectCreateApply/commonProjectProcess/projectProcess.js"></script> 
<script type="text/javascript">
nui.parse();
var url = '<%=request.getContextPath() %>';
var grid2 = nui.get("datagrid2");
grid2.load({"projectid":""});
var form = new nui.Form("form1");
var form_cust = new nui.Form("form_cust");
var form_selectCustmer = new nui.Form("form_selectCustmer");
var opioionform = new nui.Form("opioionform");
document.getElementById("opioionform").style.display="none";
document.getElementById("salesEdit").style.display="none";
nui.get("auditstatus").setValue(3);

//发起页面信息提示
promptInit({"workItemID":0,"processDefName":"com.primeton.rdmgr.project.projectCreateApplication","activityDefID":"manualActivity"});
projectCreateInit();
function projectCreateInit(){
	//初始化事业部和受益部门
	nui.ajax({
	    url: "com.primeton.rdmgr.project.createApplication.projectCreateInit.biz.ext",
	    type: "post",
	    cache: false,
	    contentType: 'text/json',
	    success: function (text) {
	    	nui.get("finUnitId").setValue(text.omOrganization.orgid);
	    	//nui.get("finUnitId").setText(text.omOrganization.orgname);
	    	document.getElementById("opioionform").style.display="";
	    	if(text.syb.length > 0){
		    	nui.get("belongto").setValue(text.syb[0].dictid);
		    	nui.get("belongto").setText(text.syb[0].dictname);
	    	}
	    }
	})
} 
	function onOk(){
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
		if(ck0.checked){//创建新客户
			if(!(form.validate()&&form_cust.validate()&&form_selectCustmer.validate())){
				alert("表单信息填写不完整，请确认必输项是否填写！!");
				return;
			}
		}else{//客户存在
			if(!(form.validate()&&form_selectCustmer.validate())){
				alert("表单信息填写不完整，请确认必输项是否填写！!");
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
	    if(confirm("确认提交？")){
	    	nui.get("commitButton").disable();
			nui.get("closeButton").disable();         
	        document.getElementById("fileCatalog1").value="miscustinfo";
	        form4.submit();
	    }
	}
	function SaveData1(){
		if(!form.validate()){
			alert("表单信息填写不完整，请确认必输项是否填写！!");
			return;
		}
		var data_opioion = opioionform.getData();
		if(ck0.checked){//创建新客户
			var data1 = {"rdEmpProj":grid2.getData(),"rdproject":form.getData().rdproject,"isNewCust":"1","miscustinfo":form_cust.getData().miscustinfo,"misOpinion": data_opioion.misOpinion};
		}else{//客户存在
			var data1 = {"rdEmpProj":grid2.getData(),"rdproject":form.getData().rdproject,"misOpinion": data_opioion.misOpinion};
		}
		var json = nui.encode(data1);
		nui.ajax({
	        url: "com.primeton.rdmgr.project.createApplication.projectCreate.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
	        success: function (o) {
	        	if("false"==o.out1){
	        		alert("合同编号填写有误,请重新输入!");
	        		return;
	        	}
              	if(o.exception == null){
                   	alert("发起流程成功！");
                   	window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
              	}else{
                   	alert("发起流程失败！");
                   	nui.get("commitButton").enable();
					nui.get("closeButton").enable();         
              	}
	        	
	        	
		    }
		});
	}  
function onCancel(){
	window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
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
function dictprojRole(e){
	return nui.getDictText('PRD_ROLE',e.value);//设置业务字典值
}
function getPriceType(e){
	return nui.getDictText('MIS_PRICETYPE',e.value);
}
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
		                var orgid = data.orgid;//人员seq
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
	//可折叠隐藏的fileset
	var dom0 = document.getElementById("fd2");
	var ck0 = document.getElementById("checkbox1");
    dom0.className = !ck0.checked ? "hideFieldset" : "";
	function toggleFieldSet(ck, id) {
        var dom = document.getElementById(id);
        dom.className = !ck.checked ? "hideFieldset" : "";
        if(ck.checked==false){
	        nui.get("custname1").enable();
	        nui.get("custid").setValue(null);
	        nui.get("custname1").setValue(null);
	        nui.get("custname1").setText(null);
	        nui.get("custname1").setShowButton(true);
			nui.get("custname1").setAllowInput(false);
        }
    	var custname2 = nui.get("custname2").getValue();
        if(ck.checked==true){//新客户
	        nui.get("custid").setValue(null);
	        nui.get("custname1").disable();
	    	nui.get("custname1").setValue(custname2);
	    	nui.get("custname1").setText(custname2);
	    	nui.get("custname1").setShowButton(false);
			nui.get("custname1").setAllowInput(true);
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
	
	function checkNum(){
		//alert("checkNum");
		var registercap = nui.get("registercap").getValue();
		if(IsNumber(registercap)==false){
			alert("请输入正确数字格式！");
			nui.get("registercap").setValue("");
			return;
		}
	}
	
</script>
</body>
</html>