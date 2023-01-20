<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%
	String condQueryOrgRes=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_condQueryOrgRes");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title> 
<script>
  function addRec() { 
  var sUrl="org.gocom.abframe.org.organization.OrganizationInfo.flow?_eosFlowAction=";
	    var argument = null;
	    sUrl=sUrl+"orgAdd&porg/orgid="+$name("iOrgid").value;
	    showModalCenter(sUrl,argument,callBack,570,400,'<b:message key="orgSubMaintain_l_menu_addSubOrg"/>');
  } 
  function callBack(returnValue) {
       parent.parent.callBack();
  }

  function mdfRec() {
    var g= $id('group1');
    if(g.getSelectLength()==1){
	  var parm="oOrg/orgid="+g.getSelectParams("oaRmvOrg/orgid");
      var sUrl="org.gocom.abframe.org.organization.OrganizationInfo.flow?_eosFlowAction=modifySelfOrg&"+parm;   
      showModalCenter(sUrl,null,callBack,600,400,'<b:message key="orgSubMaintain_l_title_modifyOrg"/>');
    }else{
      alert("<b:message key = 'l_m_alert_mustAdnOnlySelectOne'/>"); 
      return;
    }
  }

  function rmvRec() {
    var g = $id("group1");
    if (g.getSelectLength() < 1) {
      alert("<b:message key = 'l_m_alert_mustSelectOneOrMore'/>"); 
      return;
    }
    
    var frm = $name("viewlist1");
    var myAjax = new Ajax("org.gocom.abframe.org.organization.OrgManager.removeOrgs.biz");
    if(confirm("<b:message key='l_del_confirm'/>")){
	    if(myAjax.submitForm(frm)){
	    	var returnNode =myAjax.getValue("root/data/iRtn");
	    	if(returnNode>=0){
	    		callBack(1);
	    	}    	
	    }
    }
  }
  
</script>
</head>
<body topmargin="0" leftmargin="0">
 
<h:form name="viewlist1" action="org.gocom.abframe.org.organization.OrgSubMaintain.flow" checkType="blur" target="_self" method="post">
  <input type="hidden" name="_eosFlowAction" value="qryagain" >
  <h:hidden property="iOrgid" scope="f"/>
  <h:hidden property="iOrglevel" scope="f"/>
  <h:hidden property="sOrgseq" scope="f"/>   
  
  <%--
  <h:hidden property="_eosFlowDataContext"/>
  <h:hidden property="_eosFlowKey"/>
  <h:hiddendata property="ctOrg" />
  <h:hiddendata property="page" />
  --%>  
 
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
       <td colspan="5" class="eos-panel-title"><%=condQueryOrgRes %></td>
      </tr>
      <tr>
        <th align="center">
          <!--选择-->
          <l:greaterThan scope="f" property="page/size" targetValue="0" compareType="number">
              <input  type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll('checkSelect','group1');"> 
          </l:greaterThan>
          <b:message key="l_select"/>
        </th>
        <th>
          <!--机构名称-->
          <b:message key="orgSubMaintain_OmOrganization.orgname"/>        
        </th>
        <th>
          <!--机构代码-->
          <b:message key="orgSubMaintain_OmOrganization.orgcode"/>
        </th>        
        <th>
          <!--机构类型-->
          <b:message key="orgSubMaintain_OmOrganization.orgtype"/>
        </th>
        <th>
          <!--机构状态-->
          <b:message key="orgSubMaintain_OmOrganization.status"/>
        </th>
      </tr>
      <w:checkGroup id="group1">
        <l:iterate property="oaOrg" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />">
            <td align="center">
              <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))">
                <h:param name='oaRmvOrg/orgid' iterateId='id1' property='orgid' indexed="true"/>
                <h:param name='oaRmvOrg/orgseq' iterateId='id1' property='orgseq' indexed="true"/>                
              </w:rowCheckbox>
            </td>
            <td>
              <b:write iterateId="id1" property="orgname"/>
            </td>
            <td>
              <b:write iterateId="id1" property="orgcode"/>
            </td>            
            <td>
              <d:write dictTypeId="ABF_ORGTYPE" iterateId="id1" property="orgtype"/>
            </td>
            <td>
              <d:write dictTypeId="ABF_ORGSTATUS" iterateId="id1" property="status"/>
            </td>
          </tr>
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="5" class="command_sort_area">
         <div style="float:left">
          <input type="button" class="button" style='margin-top:2' value="<b:message key='l_add'/>" onclick="addRec();">
          <l:greaterThan property="page/size" targetValue="0" compareType="number" scope="f">
            <input type="button" class="button" value="<b:message key='l_update'/>" onclick="mdfRec();" id="updateButton">
          </l:greaterThan>
          <l:greaterThan property="page/size" targetValue="0" compareType="number" scope="f">
            <input type="button" class="button" value="<b:message key='l_delete'/>" onclick="rmvRec();" id="deleteButton">
          </l:greaterThan>
          </div>
          <div style="float:right">
            <l:equal property="page/isCount" scope="f" targetValue="true">
              <b:message key = 'l_total'/>       <!--共 -->
              <b:write property="page/count" scope="f"/>
              <b:message key = 'l_recordNO.'/>   <!--条记录 第 -->
              <b:write property="page/currentPage" scope="f"/>
              <b:message key = 'l_page'/>/       <!--页 -->
              <b:write property="page/totalPage" scope="f"/>
              <b:message key = 'l_page'/>        <!--页 -->
            </l:equal>
            <l:equal property="page/isCount" scope="f" targetValue="false">
              <b:message key = 'l_NO.'/>         <!--第 -->
              <b:write property="page/currentPage" scope="f"/>
              <b:message key = 'l_page'/>        <!--页 -->
            </l:equal>
            <input type="button" class="button" onclick="firstPage('page', 'qryagain', null, null, 'viewlist1');" value="<b:message key = 'l_firstPage'/>"  <l:equal property="page/isFirst" scope="f" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="prevPage('page', 'qryagain', null, null, 'viewlist1');" value="<b:message key = 'l_upPage'/>" <l:equal property="page/isFirst" scope="f" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="nextPage('page', 'qryagain', null, null, 'viewlist1');" value="<b:message key = 'l_nextPage'/>" <l:equal property="page/isLast" scope="f" targetValue="true">disabled</l:equal> >
            <l:equal property="page/isCount" scope="f" targetValue="true">
              <input type="button" class="button" onclick="lastPage('page', 'qryagain', null, null, 'viewlist1');" value="<b:message key = 'l_lastPage'/>" <l:equal property="page/isLast" scope="f" targetValue="true">disabled</l:equal> >
            </l:equal>
          </div>
        </td>
      </tr>
    </table>
</h:form>

</body>
</html>
