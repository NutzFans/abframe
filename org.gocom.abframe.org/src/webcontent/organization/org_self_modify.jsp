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
</head>
<body topmargin="0" leftmargin="0">

<h:form name="dataform1" action="org.gocom.abframe.org.organization.OrgSelfModify.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
  <input type="hidden" name="_eosFlowAction" value="mdf2"/>
  <w:panel id="panel1" width="100%" title="<%=title%>" align="left">
    <table align="center" border="0" height="100%" width="100%" class="form_table">
      <h:hidden property="oOrg/omOrganization/orgid"/>
      <h:hidden property="oOrg/orgid"/>
      <h:hidden property="oOrg/updator"/>
      <h:hidden property="oOrg/subcount"/>
      <h:hidden property="oOrg/orglevel"/>
      <h:hidden property="oOrg/orgseq"/>
      <h:hidden property="oOrg/orgmanager"/>
      <h:hidden property="oOrg/isleaf"/>
      <tr>
      <td class="form_label">
          <b:message key="orgSubMaintain_OmOrganization.orgname"></b:message><b:message key="l_colon"></b:message>        
          <!--机构名称-->
        </td>
        <td colspan="1">
          <h:text property="oOrg/orgname" validateAttr="allowNull=false;maxLength=64"/>
        </td>
        <td class="form_label">
          <b:message key="orgSubMaintain_OmOrganization.orgcode"></b:message><b:message key="l_colon"></b:message>
          <!--机构代码-->
        </td>
        <td colspan="1">
          <h:text property="oOrg/orgcode" validateAttr="allowNull=false;maxLength=32"/>
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
			textField="posiname" valueField="positionid" xpath="oaPosi" width="100" initParamFunc="initComboPosiParam"
		  />     
		</td>            
        <td class="form_label">
          <!--机构主管人员-->
          <b:message key="orgSubMaintain_OmOrganization.managerid"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <r:comboSelect id="empList" property="oOrg/managerid"  
			queryAction="org.gocom.abframe.org.employee.EmpManager.queryEmpByTemplate.biz" 
			textField="empname" valueField="empid" xpath="oaEmp" width="100" initParamFunc="initComboEmpParam"
		  />
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
          <!--创建时间-->
          <b:message key="orgSubMaintain_OmOrganization.createtime"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <w:date property="oOrg/createtime"/>
        </td>      
        <td class="form_label">
          <!--最近更新时间-->
          <b:message key="orgSubMaintain_OmOrganization.lastupdate"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <w:date property="oOrg/lastupdate"/>
        </td>      
      </tr>
      <tr>        
        <td class="form_label">
          <!--备注-->
          <b:message key="orgSubMaintain_OmOrganization.remark"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="3">
          <h:textarea property="oOrg/remark" cols="50" rows="2" validateAttr="maxLength=512"/>
        </td>
      </tr>
      
      <tr class="form_bottom">
        <td colspan="4">
          <input type="submit" class="button" value="<b:message key="l_save" />">
        </td>
      </tr>
    </table>
  </w:panel>
</h:form>
 
</body>
</html>
<script>
    function initComboPosiParam(){
    	return "<oPosi><omOrganization><orgid>"+$name("oOrg/orgid").value+"</orgid></omOrganization></oPosi>" ;
    }
    function initComboEmpParam(){
    	return "<oEmp><orgid>"+$name("oOrg/orgid").value+"</orgid></oEmp>" ;
    }
        
</script>
