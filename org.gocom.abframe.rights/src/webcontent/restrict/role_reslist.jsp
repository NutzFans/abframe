<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>
<%
	//查询条件
	String queryCond = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("restrictManager_l_queryCond");
	//角色资源列表
	String roleList = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("queryResList_l_roleList");
%>
<script>
 	/*
 	 * 把选定的值设置到datacell的相应单元格中
 	 */
	function submitValue(){
		var group = $id("group1");
		var roleid = "";
		var rolename = "";
		if( group.getSelectLength() != 1 ) {
		    alert('<b:message key="l_m_alert_mustAdnOnlySelectOne"/>');  <!-- 必须且只能选择一行！ -->
            return;
		}
		roleid = group.getParam("selectedObjects/roleid");
		rolename = group.getParam("selectedObjects/rolename");
		//lookUp的返回值
		window.returnValue = [roleid,rolename];
		window.close();
	}
</script>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<h:form name="form1" action="org.gocom.abframe.org.QueryResList.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
  <input type="hidden" name="_eosFlowAction" value="roleQuery" >
    <table align="center" border="0" width="496" class="form_table">
      <tr>
        <td class="form_label">    <!-- 角色名称 -->
          <b:message key="queryResList_AcRole.rolename"/><b:message key="l_colon"></b:message>
        </td>
        <td>
          <h:text property="criteria/_expr[1]/rolename"/>
          <h:hidden property="criteria/_expr[1]/_op" value="like"/>
          <h:hidden property="criteria/_expr[1]/_likeRule" value="all"/>
        </td>
        <td>
          <input type="hidden" name="criteria/_entity" value="org.gocom.abframe.dataset.privilege.AcRole">&nbsp;
          <b:message key="l_pageDisplay"/>
          <h:text size="2" property="page/length" value="10" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
          <input type="hidden" name="page/begin" value="0">
          <input type="hidden" name="page/isCount" value="true">
          <input type="submit" class="button" value="<b:message key="l_query"/>">
        </td>
      </tr>
    </table>
</h:form>

<h:form name="viewlist1" action="org.gocom.abframe.org.QueryResList.flow" checkType="blur" target="_self" method="post">
  <input type="hidden" name="_eosFlowAction" value="rolePageQuery" >
  <h:hiddendata property="criteria" />
  <h:hiddendata property="page" />
    <table align="center" border="0" width="496" class="EOS_table">
      <tr height="4%">
		<td class="eos-panel-title" colspan="4">&nbsp;&nbsp;<%=roleList%></td>
	  </tr>
      <tr>
        <th align="center">    <!-- 选择 -->
          <b:message key="l_select"/>
        </th>
        <th>    <!-- 角色编号 -->
          <b:message key="queryResList_AcRole.roleid"/>
        </th>
        <th>    <!-- 角色名称 -->
          <b:message key="queryResList_AcRole.rolename"/>
        </th>
      </tr>
      <w:radioGroup id="group1">
        <l:iterate property="roleList" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />">
            <td align="center">
              <w:rowRadio>
                <h:param name='selectedObjects/roleid' iterateId='id1' property='roleid'/>
                <h:param name='selectedObjects/rolename' iterateId='id1' property='rolename'/>
              </w:rowRadio>
            </td>
            <td>
              <b:write iterateId="id1" property="roleid"/>
            </td>
            <td>
              <b:write iterateId="id1" property="rolename"/>
            </td>
          </tr>
        </l:iterate>
      </w:radioGroup>
      <tr>
        <td colspan="3" class="command_sort_area">
          <div style="float:left" >
          <input type="button" class="button" value="<b:message key="l_cofirm"/>" onclick="javascript:submitValue();"/>
          <input type="button" class="button" value="<b:message key="l_empty"/>" onclick="javascript:closeWin('','');" />
          <input type="button" class="button" value='<b:message key="l_close"/>' onclick="javascript:window.close();"/>
          </div><div style="float:right" >
            <l:equal property="page/isCount" targetValue="true">
              <b:message key="l_total"/>
              <b:write property="page/count"/>
              <b:message key="l_recordNO."/>
              <b:write property="page/currentPage"/>
              <b:message key="l_page"/>/
              <b:write property="page/totalPage"/>
              <b:message key="l_page"/>
            </l:equal>
            <l:equal property="page/isCount" targetValue="false">
              <b:message key="l_NO."/>
              <b:write property="page/currentPage"/>
              <b:message key="l_page"/>
            </l:equal>
            <input type="button" class="button" onclick="firstPage('page', 'rolePageQuery', null, null, 'viewlist1');" value="<b:message key="l_firstPage"/>"  <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="prevPage('page', 'rolePageQuery', null, null, 'viewlist1');" value="<b:message key="l_upPage"/>" <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="nextPage('page', 'rolePageQuery', null, null, 'viewlist1');" value="<b:message key="l_nextPage"/>" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            <l:equal property="page/isCount" targetValue="true">
              <input type="button" class="button" onclick="lastPage('page', 'rolePageQuery', null, null, 'viewlist1');" value="<b:message key="l_lastPage"/>" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            </l:equal>
          </div>
        </td>
      </tr>
    </table>
</h:form>
</body>
</html>
