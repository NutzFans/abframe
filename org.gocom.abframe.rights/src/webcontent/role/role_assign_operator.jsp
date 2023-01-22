<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>
<%
	//操作员列表
	String employeeList = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_employeeList");
%>
<script>
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
    /*
     * 新增操作员后的回调函数
     */
    function callBack() {
        var frm = $name("viewlist1");
        frm.elements["_eosFlowAction"].value = "callBack";
        frm.submit();
    }
    /*
     * 增加操作员
     */
    function addRecord() {
        var url = "org.gocom.abframe.rights.role.AddOperator.flow";
        url += "?_eosFlowAction=start";
        url += "&acRole/roleid=";
        url += '<b:write property="acRole/roleid"/>';
        url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	    showModalCenter(url, "", callBack, 700, 400, '<b:message key="roleManager_l_addOperator"/>');
    }
    /*
     * 删除操作员
     */
    function delRecord() {
        var g = $id("group1");
        if (g.getSelectLength() < 1) {
        alert('<b:message key="l_m_alert_mustSelectOneOrMore"/>');  <!-- 至少选择一行！ -->
        return;
     }
     if( !confirm('<b:message key="roleManager_l_m_alert_confirmDeleteOperator"/>') ) {
        return;
     }
     var frm = $name("viewlist1");
     frm.elements["_eosFlowAction"].value = "delRecord";
     frm.submit();
     }
	
</script>
</head>
<body leftmargin="0" topmargin="0">

<form name="viewlist1" action="org.gocom.abframe.rights.role.AssignRoleOperator.flow" method="post">
  <input type="hidden" name="_eosFlowAction" value="pageQuery" >
  <h:hidden property="acRole/roleid"/>
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
        <th>工号</th>
        <th>	<!-- 登录名称 -->
          <b:message key="roleManager_OmEmployee.userid"/>
        </th>
        <th>	<!-- 操作员名称 -->
          <b:message key="roleManager_OmEmployee.empname"/>
        </th>
        <th>操作员状态</th>
        <th>	<!-- 所属机构 -->
          <b:message key="roleManager_OmEmployee.orgid(orgname)"/>
        </th>
      </tr>
      <w:checkGroup id="group1">
        <l:iterate property="operList" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />">
            <td align="center">
              <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), null, $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), null, $id('deleteButton'))">
				<h:param name='operatorRole[*]/acOperator/operatorid' iterateId='id1' property='operatorid' indexed='true' />
				<h:param name='operatorRole[*]/acRole/roleid' property='acRole/roleid' indexed='true'/>			
              </w:rowCheckbox>
            </td>
            <td>
              <b:write iterateId="id1" property="empcode"/>
            </td>
            <td>
              <b:write iterateId="id1" property="userid"/>
            </td>
            <td>
              <b:write iterateId="id1" property="empname"/>
            </td>
            <td>
              <d:write dictTypeId="ABF_OPERSTATUS" iterateId="id1" property="status"/>
            </td>
            <td>
              <b:write iterateId="id1" property="orgname"/>
            </td>
          </tr>
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="6" class="command_sort_area" nowrap="nowrap">
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
	        <div>                                                                         
        </td>
      </tr>
    </table>
</form>
</body>
</html>