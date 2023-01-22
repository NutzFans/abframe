<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>
<%
	//岗位列表
	String positionList = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_positionList");
%>
<script>
  /* 
   * 新增岗位后的回调函数
   */
  function callBack() {
        var frm = $name("viewlist1");
        frm.elements["_eosFlowAction"].value = "callBack";
        frm.submit();
  }
  /*
   * 增加岗位
   */
  function addRecord() {
        var url = "org.gocom.abframe.rights.role.AddPosition.flow";
        url += "?_eosFlowAction=start";
        url += "&acRole/roleid=";
        url += '<b:write property="acRoleVar/roleid"/>';
        url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	    showModalCenter(url, "", callBack, 700, 400, '<b:message key="roleManager_l_addPosition"/>');
  }
  /*
   * 删除岗位
   */
  function delRecord() {
    var g = $id("group1");
    if (g.getSelectLength() < 1) {
      alert('<b:message key="l_m_alert_mustSelectOneOrMore"/>');  <!-- 至少选择一行！ -->
      return;
    }
    if( !confirm('<b:message key="roleManager_l_m_alert_confirmDeletePosi"/>') ) {
      return;
    }
    var frm = $name("viewlist1");
    frm.elements["_eosFlowAction"].value = "delRecord";
    frm.submit();
  }
  
  /*
   * 实现全选复选框
   */
   function checkSelectAll(){
	 if ($id("checkSelect").checked){
		selectAll("group1");
	 }else{
		selectNone("group1");
	 }
   }
   
</script>
</head>
<body leftmargin="0" topmargin="0">
<form name="viewlist1" action="org.gocom.abframe.rights.role.AssignRolePosition.flow" method="post">
  <input type="hidden" name="_eosFlowAction" value="pageQuery" >
  <h:hidden property="acRoleVar/roleid"/>
  <h:hiddendata property="criteria" />
  <h:hidden property="page/begin"/>
  <h:hidden property="page/length"/>
  <h:hidden property="page/count"/>
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
        <th align="center">
          <l:greaterThan property="page/size" targetValue="0" compareType="number">
	        <input  type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll();"> 
	      </l:greaterThan><b:message key="l_select"/>
        </th>
        <th>	<!-- 岗位名称 -->
          <b:message key="roleManager_OmPosition.posiname"/>
        </th>
        <th>	<!-- 岗位类别 -->
          <b:message key="roleManager_OmPosition.positype"/>
        </th>
        <th>	<!-- 岗位状态 -->
          <b:message key="roleManager_OmPosition.status"/>
        </th>
        <th>	<!-- 所属机构 -->
          <b:message key="roleManager_OmPosition.orgid(orgname)"/>
        </th>
      </tr>
      <w:checkGroup id="group1">
        <l:iterate property="positionList" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />">
            <td align="center">
              <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), null, $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), null, $id('addButton'))">
              	<h:param name='partyRole[*]/acRole/roleid' iterateId='id1' property='roleid' indexed='true' />
				<h:param name='partyRole/roleid' iterateId='id1' property='roleid' indexed='true' />
				<h:param name='partyRole/partytype' iterateId='id1' property='partytype' indexed='true' />
				<h:param name='partyRole/partyid' iterateId='id1' property='partyid' indexed='true' />
              </w:rowCheckbox>
            </td>
            <td>
              <b:write iterateId="id1" property="posiname"/>
            </td>
            <td>
              <d:write dictTypeId="ABF_POSITYPE" iterateId="id1" property="positype"/>
            </td>
            <td>
              <d:write dictTypeId="ABF_STATUS" iterateId="id1" property="status"/>
            </td>
            <td>
              <b:write iterateId="id1" property="orgname"/>
            </td>
          </tr>
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="5" class="command_sort_area" nowrap="nowrap">
          <div style="float:left">
          <input type="button" class="button" value="<b:message key = 'l_add'/>" onclick="addRecord();">
          <l:greaterThan property="page/size" targetValue="0" compareType="number">
            <input type="button" class="button" value="<b:message key = 'l_delete'/>" onclick="delRecord();" id="deleteButton" disabled="true">
          </l:greaterThan>
           </div><div style="float:right">
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
            <input type="button" class="button" onclick="firstPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key="l_firstPage"/>"  <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="prevPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key="l_upPage"/>" <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="nextPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key="l_nextPage"/>" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            <l:equal property="page/isCount" targetValue="true">
              <input type="button" class="button" onclick="lastPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key="l_lastPage"/>" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            </l:equal>
            </div>
        </td>
      </tr>
    </table>
</form>
</body>
</html>