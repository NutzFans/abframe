<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_modifyOrg");
	String pleaseSelect=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");

%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title><%=title%></title>
<script>
    function mdfOrg(){
    	var frm = $name("dataform1");
    	dateResult = f_compare_date($name('oOrg/startdate').value,$name('oOrg/enddate').value,'yyyy-MM-dd');
      	if(dateResult==1){
      		f_alert( $name('oOrg/enddate'),"<b:message key='orgSubMaintain_OmOrganization.enddate' /><b:message key='l_date_check' /><b:message key='orgSubMaintain_OmOrganization.startdate' />" );
      		return false;
      	}
      	var managerid = $name("oOrg/managerid").value;
      	if(managerid == null || managerid == ""){
      		alert("部门主管人员必选！");
      		return;
      	}
    	frm.submit();
    }
    function initComboPosiParam(){
    	return "<oPosi><omOrganization><orgid>"+$name("oOrg/orgid").value+"</orgid></omOrganization></oPosi>" ;
    }    
    function initComboEmpParam(){
    	//return "<oEmp><orgid>"+$name("oOrg/orgid").value+"</orgid></oEmp>" ;
    	return "<oEmp><empstatus></empstatus></oEmp>";
    }    
</script>
</head>
<body leftmargin="0" topmargin="0">

<h:form name="dataform1" action="org.gocom.abframe.org.organization.OrgModify.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
  <input type="hidden" name="_eosFlowAction" value="mdf"/>
    <table align="center" border="0" width="100%" class="form_table">
      <h:hidden property="oOrg/omOrganization/orgid"/>
      <h:hidden property="oOrg/orgid"/>
      <h:hidden name="oOrg/updator" property="userObject/attributes/empid" scope="session"/>
      <h:hidden property="oOrg/subcount"/>
      <h:hidden property="oOrg/orglevel"/>
      <h:hidden property="oOrg/orgseq"/>
      <h:hidden property="oOrg/orgmanager"/>
      <h:hidden property="oOrg/isleaf"/>      
      
      <tr>
        <td class="form_label">
          <b:message key="orgSubMaintain_OmOrganization.orgcode"></b:message><b:message key="l_colon"></b:message>
          <!--机构代码-->
        </td>
        <td colspan="1">
          <h:text property="oOrg/orgcode" validateAttr="allowNull=false;maxLength=32"/>
        </td>
        <td class="form_label">
          <b:message key="orgSubMaintain_OmOrganization.orgname"></b:message><b:message key="l_colon"></b:message>        
          <!--机构名称-->
        </td>
        <td colspan="1">
          <h:text property="oOrg/orgname" validateAttr="allowNull=false;maxLength=64"/>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key="orgSubMaintain_OmOrganization.omOrganization.orgid"></b:message><b:message key="l_colon"></b:message>        
          <!--上级机构-->
        </td>
        <td colspan="1">
          <h:text property="oOrg/omOrganization/orgname" readonly="true"/>
        </td>
        <td class="form_label">
          <b:message key="orgSubMaintain_OmOrganization.orgtype"></b:message><b:message key="l_colon"></b:message>
          <!--机构类型-->
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_ORGTYPE" property="oOrg/orgtype" style="width:133" nullLabel="<%=pleaseSelect%>"/>
        </td>      
      </tr>
      <tr> 
        <td class="form_label">
          <b:message key="orgSubMaintain_OmOrganization.orgdegree"></b:message><b:message key="l_colon"></b:message>
          <!--机构等级-->
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_ORGDEGREE" property="oOrg/orgdegree" style="width:133" nullLabel="<%=pleaseSelect%>"/>
        </td>             
        <td class="form_label">
          <!--机构状态-->
          <b:message key="orgSubMaintain_OmOrganization.status"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_ORGSTATUS" property="oOrg/status" style="width:133" nullLabel="<%=pleaseSelect%>"/>
        </td> 
      </tr>
      <tr>
        <td class="form_label">
          <!--排列顺序-->
          <b:message key="orgSubMaintain_OmOrganization.sortno"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/sortno" validateAttr="type=number"/>
        </td>      
        <td class="form_label">
          <!--所属地域-->
          <b:message key="orgSubMaintain_OmOrganization.area"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/area" validateAttr="maxLength=40"/>
        </td>      
      </tr>
      <tr>
         <td class="form_label">
          <!--机构地址-->
          <b:message key="orgSubMaintain_OmOrganization.orgaddr"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/orgaddr" validateAttr="maxLength=256"/>
        </td>      
        <td class="form_label">
          <!--邮编-->
          <b:message key="orgSubMaintain_OmOrganization.zipcode"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/zipcode" validateAttr="maxLength=10"/>
        </td>
      </tr>
      <tr>  
        <td class="form_label">
          <!--机构主管岗位-->
          <b:message key="orgSubMaintain_OmOrganization.manaposition"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <r:comboSelect id="posiList" property="oOrg/manaposition" 
			queryAction="org.gocom.abframe.org.organization.OrgManager.queryPosiByTemplate.biz" 
			textField="posiname" valueField="positionid" xpath="oaPosi" width="150" initParamFunc="initComboPosiParam"
		  />           
        </td>            
        <td class="form_label">
          <!--机构主管人员-->
          <b:message key="orgSubMaintain_OmOrganization.managerid"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:hidden property="oOrg/managerid"/><h:text property="oOrg/managername" readonly="true"/>
		  <INPUT value="选择" class="button" type="button" onclick="select_opemp_single();">
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <!--联系人-->
          <b:message key="orgSubMaintain_OmOrganization.linkman"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/linkman" validateAttr="maxLength=30"/>
        </td>      
        <td class="form_label">
          <!--联系电话-->
          <b:message key="orgSubMaintain_OmOrganization.linktel"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/linktel" validateAttr="maxLength=20"/>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <!--电子邮件-->
          <b:message key="orgSubMaintain_OmOrganization.email"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/email" validateAttr="maxLength=128"/>
        </td>      
        <td class="form_label">
          <!--网站地址-->
          <b:message key="orgSubMaintain_OmOrganization.weburl"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/weburl" validateAttr="maxLength=512"/>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <!--生效日期-->
          <b:message key="orgSubMaintain_OmOrganization.startdate"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <w:date property="oOrg/startdate"/>
        </td>              
        <td class="form_label">
          <!--失效日期-->
          <b:message key="orgSubMaintain_OmOrganization.enddate"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <w:date property="oOrg/enddate"/>
        </td>
      </tr>
      <tr>        
        <td class="form_label">
         		审批层级
        </td>
        <td colspan="3">
            <d:select dictTypeId="AME_FEELEVEL" extAttr="allowNull=false;" property="oOrg/approlevel" style="width:170" nullLabel='<%=pleaseSelect%>'/><font style="color:red">*</font>
        </td>
      </tr>
      <tr>        
        <td class="form_label">
          <!--备注-->
          <b:message key="orgSubMaintain_OmOrganization.remark"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="3">
          <h:textarea property="oOrg/remark" cols="60" rows="2" validateAttr="maxLength=512"/>
        </td>
      </tr>

      <tr class="form_bottom">
        <td colspan="4">
          <input type="button" class="button" value="<b:message key="l_save" />" onclick="javascript:mdfOrg();">
          <input type="button" class="button" value="<b:message key="l_close" />" onclick="javascript:window.close();">
        </td>
      </tr>
    </table>
</h:form>

<l:equal property="iRtn" targetValue="0" compareType="number" scope="request" >
	<script>
  		//window['returnValue'] = $id("function_code").value;
  		alert("<b:message key='l_m_save_success' />");
  		try{
  			parent.parent.orgTree.getSelectNode().getParent().reloadChild();
  		}catch(e){
  			
  		}
  		window.close();
	</script>
</l:equal>
<l:lessThan property="iRtn" targetValue="0" compareType="number" scope="request">
	<script>
  		alert("<b:message key='l_m_save_fail' />");
	</script>
</l:lessThan>
<script>
  		//根据机构+岗位人员选择，单选
function select_opemp_single(){
	showModalCenter("com.bos.mp.common.SelectPerson.flow?_eosFlowAction=singleOrg&orgid=&positionid=","",callback_select_opemp_single, 250, 500,"人员选择（单选）");
}
//根据机构+岗位人员选择，单选
function callback_select_opemp_single(value){
	var ret = value;
	if (!ret) {
		// 返回值为空，返回
		return;
	} else{
		//返回值赋值
		$name("oOrg/managerid").value = ret[4];
		$name("oOrg/managername").value = ret[1];
	}
}
</script>
</body>
</html>
