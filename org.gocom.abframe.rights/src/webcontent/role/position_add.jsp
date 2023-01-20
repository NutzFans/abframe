<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>
<%
	//岗位查询条件
	String position_queryCond = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_title_position")
					 + com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_queryCond");
	//岗位查询结果
	String positionList = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_title_position")
					 + com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_query_result");
	//请选择
	String pleaseSelect = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
%>
<script type="text/javascript">

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
	 * 增加岗位
	 */
	function addRecord()
	{
		var g = $id("group1");
	    if (g.getSelectLength() < 1) {
	      alert('<b:message key="l_m_alert_mustSelectOneOrMore"/>');  <!-- 至少选择一行！ -->
	      return;
	    }
	    var frm = $name("viewlist1");
	    frm.elements["_eosFlowAction"].value = "addPosi";
	    frm.submit();
	}
</script>
</head>
<body class="eos-panel-table">
<form name="form1" action="org.gocom.abframe.rights.role.AddPosition.flow" method="post" onsubmit="return checkForm(this);">
  <input type="hidden" name="_eosFlowAction" value="query"/>
  <h:hidden property="acRole/roleid"/>
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
        <td class="form_label">	<!-- 岗位名称 -->
          <b:message key="roleManager_OmPosition.posiname"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="posi/_expr[1]/posiname"/>
          <h:hidden property="dut/_expr[1]/_op" value="like"/>
          <h:hidden property="dut/_expr[1]/_likeRule" value="all"/>
        </td>
        <td class="form_label">	<!-- 岗位类别 -->
          <b:message key="roleManager_OmPosition.positype"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_POSITYPE" property="posi/_expr[2]/positype" nullLabel="<%=pleaseSelect %>" style="width:133"/>
          <h:hidden property="posi/_expr[2]/_op" value="="/>
          <%--<h:text name="enPosi/positype"/>--%>
        </td>
       
      </tr>
      <tr class="form_bottom">
        <td colspan="4" class="form_bottom">
          <b:message key="l_pageDisplay"/>
          <h:text size="2" property="page/length" value="10" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
          <input type="hidden" name="page/begin" value="0">
          <input type="hidden" name="page/isCount" value="true">
          <input type="submit" class="button" value="<b:message key="l_query"/>">&nbsp;
              <input type="button" class="button" value='<b:message key="l_reset"></b:message>' onclick="javascript:$name('form1').reset();">
        </td>
      </tr>
    </table>
  <h:hidden property="oper/_order[1]/_asc" value="operatorid" />
</form>
<form name="viewlist1" action="org.gocom.abframe.rights.role.AddPosition.flow" method="post">
  <input type="hidden" name="_eosFlowAction" value="pageQuery" >
  <h:hiddendata property="criteria" />
  <h:hidden property="acRole/roleid"/>
  <h:hidden property="page/begin"/>
  <h:hidden property="page/length"/>
  <h:hidden property="page/count"/>
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr height="4%">
		<td class="eos-panel-title" colspan="6">&nbsp;&nbsp;<%=positionList%></td>
	  </tr>
      <tr>
        <th align="center">
          <l:greaterThan property="page/size" targetValue="0" compareType="number">
	        <input  type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll();"> 
	      </l:greaterThan><b:message key="l_select"/>	<!-- 选择 -->
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
        <l:iterate property="posiList" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />">
            <td align="center">
              <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), null, $id('addButton'))" afterUnSelectFunc="clickCheck($id('group1'), null, $id('addButton'))">
				<h:param name='partyRole/partyid' iterateId='id1' property='positionid' indexed='true' />
				<h:param name='partyRole/partytype' value='position' indexed='true' />
				<h:param name='partyRole[*]/acRole/roleid' property="acRole/roleid" indexed='true'/>
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
          </tr >
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="5" class="command_sort_area">
          <div style="float:left" >
          <input type="button" class="button" value="<b:message key = 'l_add'/>" onclick="addRecord();" id="addButton" disabled="true">
          <input type="button" class="button" value="<b:message key="l_close"/>" onclick="window.close()">
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
