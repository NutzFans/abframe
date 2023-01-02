<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>
<%
	//职务列表
	String organList = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_organList");
%>
<script>
  /*
   * 增加机构时的提示信息
   */
  function addRecord() {
  		alert('<b:message key="roleManager_l_pleaseSelectRole"/>');  <!-- 请选择角色！ -->
  }
  
</script>
</head>
<body leftmargin="0" topmargin="0">
<form name="viewlist1" action="org.gocom.abframe.rights.role.AssignRolePosition.flow" method="post">
  <input type="hidden" name="_eosFlowAction" value="pageQuery" >
  <h:hiddendata property="criteria" />
  <h:hidden property="page/begin"/>
  <h:hidden property="page/length"/>
  <h:hidden property="page/count"/>
  <w:panel id="list_panel" width="100%" title="<%=organList %>">
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
        <th align="center">
          <b:message key="l_select"/>	<!-- 选择 -->
        </th>
        <th>	<!-- 机构名称 -->
          <b:message key="roleManager_OmOrganization.orgname"/>
        </th>
        <th>	<!-- 机构类别 -->
          <b:message key="roleManager_OmOrganization.orgtype"/>
        </th>
        <th>	<!-- 机构状态 -->
          <b:message key="roleManager_OmOrganization.status"/>
        </th>
        <th>	<!-- 所属地域 -->
          <b:message key="roleManager_OmOrganization.area"/>
        </th>
      </tr>
     <tr>
        <td colspan="5" class="command_sort_area">
           <div style="float:left" >
           <input type="button" class="button" value="<b:message key = 'l_add'/>" onclick="addRecord();">
           </div><div style="float:right" >
            <l:equal property="page/isCount" targetValue="false" value="false">
              <b:message key="l_total"/>
              <b:write property="page/count" value="0"/>
              <b:message key="l_recordNO."/>
              <b:write property="page/currentPage" value="0"/>
              <b:message key="l_page"/>/
              <b:write property="page/totalPage" value="0"/>
              <b:message key="l_page"/>
            </l:equal>
            <l:equal property="page/isCount" targetValue="false">
              <b:message key="l_NO."/>
              <b:write property="page/currentPage" value="0"/>
              <b:message key="l_page"/>
            </l:equal>
            <input type="button" class="button" onclick="firstPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key="l_firstPage"/>" disabled="disabled">
            <input type="button" class="button" onclick="prevPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key="l_upPage"/>" disabled="disabled">
            <input type="button" class="button" onclick="nextPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key="l_nextPage"/>" disabled="disabled">
            <input type="button" class="button" onclick="lastPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key="l_lastPage"/>" disabled="disabled">
          </div>
        </td>
      </tr>
    </table>
  </w:panel>
</form>
</body>
</html>
