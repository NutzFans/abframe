<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<% String list_title = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("contributionMetadata.contributions");
%>
<html>
<head>
<title><%=list_title %></title>
<script>
function importApp(frm){
  var ajax =  new Ajax("org.gocom.abframe.rights.application.ApplicationMaintain.importContributions.biz");
  if(checkForm(frm)){
     ajax.submitForm(frm);
     var ret = ajax.getResponseXMLDom();   
     if(ret&&ajax.getValue("root/data/retCode")==1){
        alert( '<b:message key="applicationManager_l_import_ok"/>');
        window.returnValue=true;
        window.close();
     }else{
        alert( '<b:message key="applicationManager_l_import_failed"/>' );
     }   
  }
}
</script>
</head>
<body>
<viewlist id="d6e40b98-09f7-4f5c-9d7e-27ae51f83b63">
  <h:form name="dataform" method="post">
    <h:hidden property="appid" scope="request" />
    <w:panel id="list_panel" width="100%" title="<%=list_title %>">
      <table align="center" border="0" width="100%" class="EOS_table">
        <tr>
          <th align="center">
	          	<b:message key="l_select"/>
          </th>
          <th>
            <b:message key="contributionMetadata.name"/>
          </th> 
          <th>
            <b:message key="contributionMetadata.displayName"/>
          </th>                   
        </tr>
        <w:checkGroup id="group1">
          <l:iterate property="contributions" id="id1">
            <tr class="<l:output evenOutput='EOS_table_row' />">
              <td align="center">
                <w:rowCheckbox>
                  <h:param name='connames' iterateId='id1' property='name' indexed='true' />
                </w:rowCheckbox>
              </td>
              <td>
                <b:write iterateId="id1" property="name"/>
              </td> 
              <td>
                <b:write iterateId="id1" property="displayName"/>
              </td>                           
            </tr>
          </l:iterate>
        </w:checkGroup>
        <tr>
          <td colspan="5" class="command_sort_area">
            <input type="button" class="button" value='<b:message key="applicationManager_l_import" />' onclick="importApp(this.form);" class="button">           
          </td>
        </tr>
      </table>
    </w:panel>
  </h:form>
</viewlist>
</body>
</html>