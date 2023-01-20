<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title>select_demo</title>
</head>
<body>
<FORM name=testform action=#>
	根据机构+岗位选择人员(单选)：<BR>
	<INPUT type="text" size="20" name="opuserid_single"><INPUT type="text" size="20" name="opoperatorname_single">
	<INPUT type="text" size="20" name="opemp_orgid_single"><INPUT type="text" size="20" name="opemp_orgname_single">
	<INPUT type="text" size="20" name="opemp_empid_single">
	<INPUT value="选择"	type="button" onclick="javascript:select_opemp_single();" name="select_opemp_btn"><BR>

	根据机构+岗位选择人员(多选)：<BR>
	<INPUT type="text" size="20" name="opuserid_multi"><INPUT type="text" size="20" name="opoperatorname_multi">
	<INPUT type="text" size="20" name="opemp_orgid_multi"><INPUT type="text" size="20" name="opemp_orgname_multi">
	<INPUT value="选择"	type="button" onclick="javascript:select_opemp_multi();" name="select_opemps_btn"><BR>

	根据工作组+岗位选择人员(单选)：<BR>
	<INPUT type="text" size="20" name="gpuserid_single"><INPUT type="text" size="20" name="gpoperatorname_single">
	<INPUT type="text" size="20" name="gpemp_orgid_single"><INPUT type="text" size="20" name="gpemp_orgname_single">
	<INPUT value="选择"	type="button" onclick="javascript:select_gpemp_single();" name="select_gpemp_btn"><BR>

	根据工作组+岗位选择人员(多选)：<BR>
	<INPUT type="text" size="20" name="gpuserid_multi"><INPUT type="text" size="20" name="gpoperatorname_multi">
	<INPUT type="text" size="20" name="gpemp_orgid_multi"><INPUT type="text" size="20" name="gpemp_orgname_multi">
	<INPUT value="选择"	type="button" onclick="javascript:select_gpemp_multi();" name="select_gpemps_btn"><BR>
	
	选择部门(单选)：<BR>
	<INPUT type="text" size="20" name="orgid"><INPUT type="text" size="20" name="orgname"> 
	<INPUT value="选择"	type="button" onclick="javascript:select_org_single();" name="select_org_btn"><BR>

	列表方式选择部门(多选)：<BR>
	<INPUT type="text" size="20" name="orgid_multi"><INPUT type="text" size="20" name="orgname_multi"> 
	<INPUT value="选择"	type="button" onclick="javascript:select_org_multi();" name="select_org_multi_btn"><BR>

	树型方式选择部门(多选)：<BR>
	<INPUT type="text" size="20" name="orgid_multi1"><INPUT type="text" size="20" name="orgname_multi1"> 
	<INPUT value="选择"	type="button" onclick="javascript:select_org_multi1();" name="select_org_multi_btn1"><BR>

	选择人员(单选)：<BR>
	<INPUT type="text" size="20" name="userid_single"><INPUT type="text" size="20" name="operatorname_single">
	<INPUT type="text" size="20" name="emp_orgid_single"><INPUT type="text" size="20" name="emp_orgname_single">
	<INPUT value="选择"	type="button" onclick="javascript:select_emp_single();" name="select_emp_btn"><BR>
	
	选择人员(多选)：<BR>
	<INPUT type="text" size="20" name="userid_multi"><INPUT type="text" size="20" name="operatorname_multi">
	<INPUT type="text" size="20" name="emp_orgid_multi"><INPUT type="text" size="20" name="emp_orgname_multi">
	<INPUT value="选择"	type="button" onclick="javascript:select_emp_multi();" name="select_emp_btn"><BR>
	
	选择角色(单选)：<BR>
	<INPUT type="text" size="20" name="roleid_single"><INPUT type="text" size="20" name="rolename_single">
	<INPUT value="选择"	type="button" onclick="javascript:select_role_single();" name="select_role_btn"><BR>
	
	选择角色(多选)：<BR>
	<INPUT type="text" size="20" name="roleid_multi"><INPUT type="text" size="20" name="rolename_multi">
	<INPUT value="选择"	type="button" onclick="javascript:select_role_multi();" name="select_role_btn"><BR>
	
	选择项目(单选)：<BR>
	<INPUT type="text" size="20" name="p_no_single"><INPUT type="text" size="20" name="p_name_single">
	<INPUT value="选择"	type="button" onclick="javascript:select_pro_single();" name="select_pro_btn"><BR>
	
	选择项目(多选)：<BR>
	<INPUT type="text" size="20" name="p_no_multi"><INPUT type="text" size="20" name="p_name_multi">
	<INPUT value="选择"	type="button" onclick="javascript:select_pro_multi();" name="select_pro_btn"><BR>
	
	选择公司(单选)：<BR>
	<INPUT type="text" size="20" name="companyid_single"><INPUT type="text" size="20" name="companyname_single">
	<INPUT value="选择"	type="button" onclick="javascript:select_company_single();" name="select_company_btn"><BR>
	
	选择公司(多选)：<BR>
	<INPUT type="text" size="20" name="companyid_multi"><INPUT type="text" size="20" name="companyname_multi">
	<INPUT value="选择"	type="button" onclick="javascript:select_company_multi();" name="select_company_btn"><BR>
	
	选择项目组(单选)：<BR>
	<INPUT type="text" size="20" name="groupid"><INPUT type="text" size="20" name="groupname"> 
	<INPUT value="选择"	type="button" onclick="javascript:select_group_single();" name="select_group_btn"><BR>

	选择项目组(多选)：<BR>
	<INPUT type="text" size="20" name="groupid_multi"><INPUT type="text" size="20" name="groupname_multi"> 
	<INPUT value="选择"	type="button" onclick="javascript:select_group_multi();" name="select_group_multi_btn"><BR>
	
</FORM>
<SCRIPT>
//机构选择，单选
function select_org_single(){
	showModalCenter("com.bos.mp.common.Select.flow?_eosFlowAction=singleOrg&rootOrgID=","",callback_select_org_single , 350, 430,"机构选择（单选）");
}

//设置机构，单选
function callback_select_org_single(value)
{
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//返回值赋值
		$name("orgid").value = ret[0];
		$name("orgname").value = ret[1];
	}
}

//---------------------------------机构多选（开始）----------------------------------

var orgArguments = ""; //机构多选对话框参数

//机构选择，多选
function select_org_multi(){
	showModalCenter("com.bos.mp.common.Select.flow?_eosFlowAction=multiOrg",orgArguments,callback_select_org_multi, 600, 500,"机构选择（多选）");
}

//设置机构，多选
function callback_select_org_multi(value)
{
	//设置对话框参数
	orgArguments = value;
	//设置返回值
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//格式化返回值：以','分割
		$name("orgid_multi").value = ret[0].join(',');
		$name("orgname_multi").value = ret[1].join(',');
	}
}
//树型方式选机构，多选
var orgArguments1 = ""; //机构多选对话框参数

//机构选择，多选
function select_org_multi1(){
	showModalCenter("com.bos.mp.common.SelectPerson.flow?_eosFlowAction=multiOrgOrg&rootOrgID=104",orgArguments1,callback_select_org_multi1, 600, 500,"机构选择（多选）");
}

//设置机构，多选
function callback_select_org_multi1(value)
{
	//设置对话框参数
	orgArguments1 = value;
	//设置返回值
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//格式化返回值：以','分割
		$name("orgid_multi1").value = ret[0].join(',');
		$name("orgname_multi1").value = ret[1].join(',');
	}
}
//---------------------------------机构多选（结束）----------------------------------




//人员选择，单选
function select_emp_single(){
	showModalCenter("com.bos.mp.common.Select.flow?_eosFlowAction=singleEmp","",callback_select_emp_single, 700, 500,"人员选择（单选）");
	
}
//设置人员，单选
function callback_select_emp_single(value)
{
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//返回值赋值
		$name("userid_single").value = ret[0];
		$name("operatorname_single").value = ret[1];
		$name("emp_orgid_single").value = ret[2];
		$name("emp_orgname_single").value = ret[3];
	}
}
//根据机构+岗位人员选择，单选
function select_opemp_single(){
	showModalCenter("com.bos.mp.common.SelectPerson.flow?_eosFlowAction=singleOrg&orgid=&positionid=424,425,426","",callback_select_opemp_single, 250, 500,"人员选择（单选）");
	
}
//根据机构+岗位人员选择，单选
function callback_select_opemp_single(value){
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//返回值赋值
		$name("opuserid_single").value = ret[0];
		$name("opoperatorname_single").value = ret[1];
		$name("opemp_orgid_single").value = ret[2];
		$name("opemp_orgname_single").value = ret[3];
		$name("opemp_empid_single").value = ret[4];
	}
}
//根据工作组+岗位人员选择，单选
function select_gpemp_single(){
	showModalCenter("com.bos.mp.common.SelectPerson.flow?_eosFlowAction=singleGroup&groupid=101&positionid=1201,1202","",callback_select_gpemp_single, 250, 500,"人员选择（单选）");
	
}
//根据工作组+岗位人员选择，单选
function callback_select_gpemp_single(value){
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//返回值赋值
		$name("gpuserid_single").value = ret[0];
		$name("gpoperatorname_single").value = ret[1];
		$name("gpemp_orgid_single").value = ret[2];
		$name("gpemp_orgname_single").value = ret[3];
	}
}
var hqj="";
//根据机构+岗位人员选择，多选
function select_opemp_multi(){
	showModalCenter("com.bos.mp.common.SelectPerson.flow?_eosFlowAction=multiOrg&orgid=203&positionid=424,425,426",hqj,callback_select_opemp_multi, 700, 500,"人员选择（多选）");
}
//根据机构+岗位设置人员，多选
function callback_select_opemp_multi(value){
	hqj = value;
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//返回值赋值
		$name("opuserid_multi").value = ret[0].join(',');
		$name("opoperatorname_multi").value = ret[1].join(',');
		$name("opemp_orgid_multi").value = ret[2].join(',');
		$name("opemp_orgname_multi").value = ret[3].join(',');
	}
}
var hqj1="";
//根据工作组+岗位人员选择，多选
function select_gpemp_multi(){
	showModalCenter("com.bos.mp.common.SelectPerson.flow?_eosFlowAction=multiGroup&groupid=101&positionid=1201,1202",hqj1,callback_select_gpemp_multi, 700, 500,"人员选择（多选）");
}
//根据工作组+岗位设置人员，多选
function callback_select_gpemp_multi(value){
	hqj1 = value;
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//返回值赋值
		$name("gpuserid_multi").value = ret[0].join(',');
		$name("gpoperatorname_multi").value = ret[1].join(',');
		$name("gpemp_orgid_multi").value = ret[2].join(',');
		$name("gpemp_orgname_multi").value = ret[3].join(',');
	}
}
//---------------------人员多选（开始）-----------------

var empArguments = ""; //人员多选对话框参数

//人员选择，多选
function select_emp_multi(){
	
	showModalCenter("com.bos.mp.common.Select.flow?_eosFlowAction=multiEmp",empArguments,callback_select_emp_multi, 700, 500,"人员选择（多选）");
	
}

//设置人员，多选
function callback_select_emp_multi(value)
{
	//设置对话框参数
	empArguments = value;
	
	//设置返回值
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//格式化返回值：以','分割
		$name("userid_multi").value = ret[0].join(',');
		$name("operatorname_multi").value = ret[1].join(',');
		$name("emp_orgid_multi").value = ret[2].join(',');
		$name("emp_orgname_multi").value = ret[3].join(',');
	}
}
//----------------------人员多选（结束）------------------------------------






//角色选择，单选
function select_role_single(){
	showModalCenter("com.bos.mp.common.Select.flow?_eosFlowAction=singleRole","",callback_select_role_single, 600, 500,"角色选择（单选）");
}
//设置角色，单选
function callback_select_role_single(value)
{
	//设置返回值
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//返回值赋值
		$name("roleid_single").value = ret[0];
		$name("rolename_single").value = ret[1];
	}
}

//-------------------------------------------角色多选（开始）-------------------------

var roleArguments = ""; //角色多选对话框参数

//角色选择，多选
function select_role_multi(){
	showModalCenter("com.bos.mp.common.Select.flow?_eosFlowAction=multiRole",roleArguments,callback_select_role_multi, 600, 500,"角色选择（多选）");
	
}
///设置角色，多选
function callback_select_role_multi(value)
{
	//设置对话框参数
	roleArguments = value;
	//设置返回值
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	}else{
		//格式化返回值：以','分割
		$name("roleid_multi").value = ret[0].join(',');
		$name("rolename_multi").value = ret[1].join(',');
	}
}
//------------------------------------角色多选（结束）------------------------------------------






//项目选择，单选
function select_pro_single(){
	showModalCenter("com.bos.mp.common.Select.flow?_eosFlowAction=singlePro","",callback_select_pro_single, 600, 500,"项目选择（单选）");
	
}
//设置项目，单选
function callback_select_pro_single(value)
{
	//设置返回值
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//返回值赋值
		$name("p_no_single").value = ret[0];
		$name("p_name_single").value = ret[1];
	}
}


//----------------------------------------项目多选（开始）---------------------------

var proArguments = ""; //项目多选对话框参数

//项目选择，多选
function select_pro_multi(){
	showModalCenter("com.bos.mp.common.Select.flow?_eosFlowAction=multiPro",proArguments,callback_select_pro_multi, 600, 500,"项目选择（多选）");
}
//设置项目，多选
function callback_select_pro_multi(value)
{	
	//设置对话框参数
	proArguments = value;
	//设置返回值
	var ret = value;
	
	if (!ret) {
		// 返回值为空，返回
		return;
	}else{
		//格式化返回值：以','分割
		$name("p_no_multi").value = ret[0].join(',');
		$name("p_name_multi").value = ret[1].join(',');
	}
}
//----------------------------------------------项目多选（结束）---------------------------



//公司选择，单选
function select_company_single(){
	showModalCenter("com.bos.mp.common.Select.flow?_eosFlowAction=singleCompany","",callback_select_company_single, 600, 500,"公司选择（单选）");
	
}
//设置公司，单选
function callback_select_company_single(value)
{
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//返回值赋值
		$name("companyid_single").value = ret[0];
		$name("companyname_single").value = ret[1];
	}
}



//-----------------------公司多选（开始）----------------------------

var companyArguments = ""; //公司多选对话框参数

//公司选择，多选
function select_company_multi(){
	showModalCenter("com.bos.mp.common.Select.flow?_eosFlowAction=multiCompany",companyArguments,callback_select_company_multi, 600, 500,"项目选择（多选）");
}
function callback_select_company_multi(value)
{
	//设置对话框参数
	companyArguments = value;
	//设置返回值
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	}else{
		//格式化返回值：以','分割
		$name("companyid_multi").value = ret[0].join(',');
		$name("companyname_multi").value = ret[1].join(',');
	}
}

//--------------------------------公司多选（结束）----------------------------


//项目组选择，单选
function select_group_single(){
	showModalCenter("com.bos.mp.common.Select.flow?_eosFlowAction=singleGroup","",callback_select_group_single , 700, 500,"项目组选择（单选）");
}

//设置项目组，单选
function callback_select_group_single(value)
{
	//设置返回值
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//返回值赋值
		$name("groupid").value = ret[0];
		$name("groupname").value = ret[1];
	}
}

//-----------------------------项目组多选（开始）----------------------

var groupArguments = ""; //项目组多选对话框参数

//项目组选择，多选
function select_group_multi(){
	showModalCenter("com.bos.mp.common.Select.flow?_eosFlowAction=multiGroup",groupArguments,callback_select_group_multi, 700, 500,"项目组选择（多选）");
}

//设置项目组，多选
function callback_select_group_multi(value)
{
	//设置对话框参数
	groupArguments = value;
	//设置返回值
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//格式化返回值：以','分割
		$name("groupid_multi").value = ret[0].join(',');
		$name("groupname_multi").value = ret[1].join(',');
	}
}
//----------------------------------项目组多选（结束）---------------------------------

     //初始化页面按钮样式
     eventManager.add(window,"load",initButtonStyle);
</SCRIPT>
</body>
</html> 
