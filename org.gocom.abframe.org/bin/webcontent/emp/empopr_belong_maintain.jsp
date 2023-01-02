<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%
	//获取标签中使用的国际化资源信息
	String OmEmporg_omEmployee_empid=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_OmEmporg.omEmployee.empid");
	String OmEmporg_omOrganization_orgid=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_OmEmporg.omOrganization.orgid");
	String OmEmporg_omOrganization_orgname=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_OmEmporg.omOrganization.orgname");
	String OmEmporg_ismain               =com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_OmEmporg.ismain");
	String OmEmporg_omOrganization_orgtype=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_OmEmporg.omOrganization.orgtype");
	String OmEmpposition_omEmployee_empid=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_OmEmpposition.omEmployee.empid");
	String OmEmpposition_omPosition_positionid=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_OmEmpposition.omPosition.positionid");
	String OmEmpposition_omPosition_posiname=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_OmEmpposition.omPosition.posiname");
	String OmEmpposition_ismain           =com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_OmEmpposition.ismain");
	String OmEmpposition_omPosition_positype=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_OmEmpposition.omPosition.positype");
%>
<html>
<script>
	function custInit(){
		registerEvent();
	}

	function registerEvent() {	
		$id("dcEmporg").beforeDel = function(){
			return window.confirm("<b:message key='orgSubMaintain_l_m_alert_isRmvCurRow' />");
		}
		$id("dcEmporg").afterSubmit = function() {
			alert("<b:message key='l_m_save_success' />");
		}
		//
		$id("dcEmpposi").beforeDel = function(){
			return window.confirm("<b:message key='orgSubMaintain_l_m_alert_isRmvCurRow' />");
		}
		$id("dcEmpposi").afterSubmit = function() {
		
			alert("保存成功!");
		}
	}

	//获得人员机构当前活动行，把lookUp返回值设置到datacell的单元格中
	function returnFuncOrg(arg){    
		var lookup = $id("lookupID");
		lookup.value = arg[1];
		lookup.displayValue = arg[1];

		var row = $id("dcEmporg").getActiveRow();
		var entity = $id("dcEmporg").getEntity(row);
		entity.setProperty("omOrganization/orgid",arg[0]);		
		entity.setProperty("omOrganization/orgname",arg[1]);
		entity.setProperty("omOrganization/orgtype", arg[2]);
		entity.setProperty("omEmployee/empid",$name("oEmp/empid").value );
		entity.setProperty("ismain", "n");
		$id("dcEmporg").refreshRow(row);
	}

	//获得人员岗位当前活动行，把lookUp返回值设置到datacell的单元格中
	function returnFuncPosi(arg){    
		var lookup = $id("lookupID2");
		lookup.value = arg[1];
		lookup.displayValue = arg[1];
		var row = $id("dcEmpposi").getActiveRow();
		var entity = $id("dcEmpposi").getEntity(row);
		entity.setProperty("omPosition/positionid",arg[0]);
		entity.setProperty("omPosition/posiname",arg[1]);
		entity.setProperty("omPosition/positype", arg[2]);
		entity.setProperty("omEmployee/empid",$name("oEmp/empid").value );
		entity.setProperty("ismain", "n");
		
		$id("dcEmpposi").refreshRow(row);
	}
	function msg(ajax){	
	   var ret = ajax.getValue("/root/data/iRtn")-0;	
	   switch(ret){
	      case 0:
	         alert('<b:message key="empBelong_l_Organization_ok"/>');
	      break;
	      case -1:
             alert('<b:message key="empBelong_l_Organization_failed"/>');
	      break;
	      case -2:
	         alert('<b:message key="empBelong_l_Organization_dual"/>');
	      break;	         
	   }
	}	
	function msg1(ajax){
	   var ret = ajax.getValue("/root/data/iRtn")-0;	
	   switch(ret){
	      case 0:
	         alert('<b:message key="empBelong_l_Position_ok"/>');
	      break;
	      case -1:
             alert('<b:message key="empBelong_l_Position_failed"/>');
	      break;
	      case -2:
	         alert('<b:message key="empBelong_l_Position_dual"/>');
	      break;	         
	   }
	}
</script>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Title</title>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0">

<h:form id="qfEmpopr">
	<h:hidden name="oEmp/empid" property="emp/empid"/>
</h:form>
<r:datacell id="dcEmporg" rowStyleClass="rowclass2" rowEvenStyleClass="rowclass1" showIndex="false"
	queryAction="org.gocom.abframe.org.employee.EmpManager.queryEmporgByEmp.biz" paramFormId="qfEmpopr"
	xpath="oaEmporg" width="100%" height="50%" pageSize="10" pageSizeList="10,20,30" 
	submitAction="org.gocom.abframe.org.employee.EmpManager.saveEmporg.biz"  >

	<r:toolbar tools="nav,pagesize,edit,info" location="botton" />
	<r:field fieldName="omEmployee/empid" label="<%=OmEmporg_omEmployee_empid %>" width="0"/>
	<r:field sortAt="client" fieldName="omOrganization/orgid" label="<%=OmEmporg_omOrganization_orgid %>" width="0"/>
	<r:field fieldName="omOrganization/orgname" label="<%=OmEmporg_omOrganization_orgname %>" editId="lookupID" >  
		<w:lookup id="lookupID" validateAttr="allowNull=false" width="350" height="430" lookupUrl="/abframe/org/organization/org_select.jsp"  dialogTitle="选择可管理机构" readonly="true" onReturnFunc="returnFuncOrg">
		</w:lookup>
	</r:field>	
	<r:field fieldName="ismain" label="<%=OmEmporg_ismain %>"><d:select dictTypeId="ABF_YESORNO"/></r:field>
	<r:field fieldName="omOrganization/orgtype" label="<%=OmEmporg_omOrganization_orgtype %>" allowModify="false"><d:select dictTypeId="ABF_ORGTYPE"/></r:field>
	<r:field fieldName="empprop" label="占比数"><input type="text"/></r:field>
</r:datacell>

<r:datacell id="dcEmpposi" rowStyleClass="rowclass2" rowEvenStyleClass="rowclass1" showIndex="false"
	queryAction="org.gocom.abframe.org.employee.EmpManager.queryEmpposiByEmp.biz" paramFormId="qfEmpopr"
	xpath="oaEmpposi" width="100%" height="50%" pageSize="10" pageSizeList="10,20,30"
	submitAction="org.gocom.abframe.org.employee.EmpManager.saveEmpposi.biz"  >

	<r:toolbar tools="nav,pagesize,edit,info" location="botton" />	
	<r:field fieldName="omEmployee/empid" label="<%=OmEmpposition_omEmployee_empid %>" width="0"/>
	<r:field sortAt="client" fieldName="omPosition/positionid" label="<%=OmEmpposition_omPosition_positionid %>" width="0"/>
	<r:field fieldName="omPosition/posiname" label="<%=OmEmpposition_omPosition_posiname %>" editId="lookupID2" >
		<w:lookup id="lookupID2" validateAttr="allowNull=false" lookupUrl="/abframe/org/position/position_tree.jsp"  dialogTitle="选择岗位" readonly="true" onReturnFunc="returnFuncPosi"></w:lookup>	
	</r:field>
	<r:field fieldName="ismain" label="<%=OmEmpposition_ismain %>"><d:select dictTypeId="ABF_YESORNO"/></r:field>			
	<r:field fieldName="omPosition/positype" label="<%=OmEmpposition_omPosition_positype %>" allowModify="false"><d:select dictTypeId="ABF_POSITYPE"/></r:field> 
</r:datacell>   
</body>
</html>

<script>
     function initall(){
      custInit();
      $id("dcEmporg").afterSubmit = msg;
      $id("dcEmpposi").afterSubmit = msg1;
      
     }
     $id("dcEmporg").beforeSubmit = function checkZB(){	
     	 var rows = $id("dcEmporg").getAllRows(true);
     	 var total = 0; 
     	 for(var i = 0 ; i<rows.length ; i++){
     	 	var entity = $id("dcEmporg").getEntity(rows[i]);
     	 	var empprop = entity.getProperty("empprop");
     	 	total = parseFloat(total) + parseFloat(empprop);
     	 }
     	 if(total != 1 ){
     	 	alert("占比数总和必须为1！");
     	 	return false;
     	 }
	 }
	eventManager.add(window,"load",initall);		
</script>

