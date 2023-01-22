<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_condQueryOrg");
	String pleaseSelect=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title><%=title%></title>
</head>
<body topmargin="0" leftmargin="0">

<h:form name="form1" action="org.gocom.abframe.org.organization.OrgCondQuery.flow" checkType="blur" target="result" method="post" onsubmit="return checkForm(this);">
  <input type="hidden" name="_eosFlowAction" value="qry"/>
  <%-- 
  <h:hidden name="ctOrg/_expr[10]/orgseq" property="sOrgseq" />
  <h:hidden property="ctOrg/_expr[10]/_op" value="like"/>
  <h:hidden property="ctOrg/_expr[10]/_likeRule" value="end"/>
   --%>
  <w:panel id="panel1" width="100%" title="<%=title%>">
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
        <td class="form_label" width="10%">
          <!--机构代码-->
          <b:message key="orgSubMaintain_OmOrganization.orgcode"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1" width="15%">
          <h:text property="ctOrg/_expr[1]/orgcode" validateAttr="maxLength=32"/>
          <h:hidden property="ctOrg/_expr[1]/_op" value="="/>
        </td>      
        <td class="form_label" width="10%">
          <!--机构名称-->        
          <b:message key="orgSubMaintain_OmOrganization.orgname"></b:message><b:message key="l_colon"></b:message>        
        </td>
        <td colspan="1" width="15%">
          <h:text property="ctOrg/_expr[2]/orgname" validateAttr="maxLength=64"/>
          <h:hidden property="ctOrg/_expr[2]/_op" value="like"/>
          <h:hidden property="ctOrg/_expr[2]/_likeRule" value="all"/>
        </td>
        <td class="form_label" width="10%">
          <!--机构类型-->
          <b:message key="orgSubMaintain_OmOrganization.orgtype"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1" width="15%">
          <d:select dictTypeId="ABF_ORGTYPE" property="ctOrg/_expr[3]/orgtype" style="width:80" nullLabel="<%=pleaseSelect%>"/>
          <h:hidden property="ctOrg/_expr[3]/_op" value="="/>   
        </td>
        <td class="form_label" width="10%">
          <!--机构状态-->
          <b:message key="orgSubMaintain_OmOrganization.status"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1" width="15%">
          <d:select dictTypeId="ABF_ORGSTATUS" property="ctOrg/_expr[4]/status" style="width:70" nullLabel="<%=pleaseSelect%>"/>
          <h:hidden property="ctOrg/_expr[4]/_op" value="="/>
        </td>         
      </tr>

      <tr class="form_bottom">
        <td colspan="8" class="form_bottom">
          <input type="hidden" name="ctOrg/_entity" value="org.gocom.abframe.dataset.organization.OmOrganization">
          <b:message key = 'l_pageDisplay'/>
          <h:text size="2" property="page/length" value="15" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
          <input type="hidden" name="page/begin" value="0">
          <input type="hidden" name="page/isCount" value="true">
          <input type="submit" class="button" value="<b:message key = 'l_query'/>">
          <input type="reset" class="button" value="<b:message key = 'l_reset'/>">   
        </td>
      </tr>
    </table>
  </w:panel>
  <h:hidden property="ctOrg/_orderby[1]/_sort" value="asc"/>
  <h:hidden property="ctOrg/_orderby[1]/_property" value="orglevel"/>
  <h:hidden property="ctOrg/_orderby[2]/_sort" value="asc"/>
  <h:hidden property="ctOrg/_orderby[2]/_property" value="sortno"/>
</h:form>

<iframe name="result" height="82%" width="100%" frameborder="0" scrolling="no"></iframe>

</body>
</html>
<script>
	var frm = $name("form1");
    frm.submit();
   
</script> 