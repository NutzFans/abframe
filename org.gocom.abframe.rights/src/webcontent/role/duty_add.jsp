<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>
<%
	//职务查询条件
	String duty_queryCond = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_title_duty")
					 + com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_queryCond");
	//职务查询结果
	String dutyList = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("roleManager_l_title_duty")
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
	 * 增加职务
	 */
	function addRecord()
	{
		var g = $id("group1");
	    if (g.getSelectLength() < 1) {
	      alert('<b:message key="l_m_alert_mustSelectOneOrMore"/>');  <!-- 至少选择一行！ -->
	      return;
	    }
	    var frm = $name("viewlist1");
	    frm.elements["_eosFlowAction"].value = "addDuty";
	    frm.submit();
	}  
</script>
</head>
<body class="eos-panel-table">
<form name="form1" action="org.gocom.abframe.rights.role.AddDuty.flow" method="post" onsubmit="return checkForm(this);">
  <input type="hidden" name="_eosFlowAction" value="query"/>
  <h:hidden property="acRole/roleid"/>
  
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
        <td class="form_label">	<!-- 职务名称 -->
          <b:message key="roleManager_OmDuty.dutyname"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="duty/dutyname"/>
        </td>
        <td class="form_label">	<!-- 职务套别 -->
          <b:message key="roleManager_OmDuty.dutytype"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_DUTYTYPE" property="duty/dutytype" nullLabel="<%=pleaseSelect %>" style="width:133"/>
        </td>
       
      </tr>
      <tr class="form_bottom">
        <td colspan="4" class="form_bottom">
          <input type="hidden" name="dut/_entity" value="org.gocom.abframe.dataset.organization.VcDuty">
          <b:message key="l_pageDisplay"/>
          <h:text size="2" property="page/length" value="10" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
          <input type="hidden" name="page/begin" value="0">
          <input type="hidden" name="page/isCount" value="true">
          <input type="submit" class="button" value="<b:message key="l_query"/>">&nbsp;
          <input type="button" class="button" value='<b:message key="l_reset"></b:message>' onclick="javascript:$name('form1').reset();">
        </td>                                                
      </tr>
    </table>
</form>
<form name="viewlist1" action="org.gocom.abframe.rights.role.AddDuty.flow" method="post">
  <input type="hidden" name="_eosFlowAction" value="pageQuery" >
  <h:hiddendata property="criteria" />
  <h:hidden property="acRole/roleid"/>
  <h:hidden property="page/begin"/>
  <h:hidden property="page/length"/>
  <h:hidden property="page/count"/>
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr height="4%">
		<td class="eos-panel-title" colspan="6">&nbsp;&nbsp;<%=dutyList%></td>
	  </tr>
      <tr>
        <th align="center">
         <l:greaterThan property="page/size" targetValue="0" compareType="number">
	        <input  type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll();"> 
	     </l:greaterThan>
        	<b:message key="l_select"/>
        </th>
        <th>	<!-- 职务名称 -->
          <b:message key="roleManager_OmDuty.dutyname"/>
        </th>
        <th>	<!-- 职务代码 -->
          <b:message key="roleManager_OmDuty.dutycode"/>
        </th>
        <th>	<!-- 职务套别 -->
          <b:message key="roleManager_OmDuty.dutytype"/>
        </th>
      </tr>
      <w:checkGroup id="group1">
        <l:iterate property="dutyList" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />">
            <td align="center">
              <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), null, $id('addButton'))" afterUnSelectFunc="clickCheck($id('group1'), null, $id('addButton'))">
				<h:param name='partyRole/partyid' iterateId='id1' property='dutyid' indexed='true' />
				<h:param name='partyRole/partytype' value='duty' indexed='true' />
				<h:param name='partyRole[*]/acRole/roleid' property="acRole/roleid" indexed='true'/>
              </w:rowCheckbox>
            </td>
            <td>
              <b:write iterateId="id1" property="dutyname"/>
            </td>
            <td>
              <b:write iterateId="id1" property="dutycode"/>
            </td>
            <td align="center">
              <d:write dictTypeId="ABF_DUTYTYPE" iterateId="id1" property="dutytype"/>
            </td>         
          </tr >
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="4" class="command_sort_area">
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