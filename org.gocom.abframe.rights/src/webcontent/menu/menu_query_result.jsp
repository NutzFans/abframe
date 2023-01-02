<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_title_menuQueryResult(menulist)");
%>

<head>
    <script>
  function addRecord() {
    var g = $id("group1");
    var frm = $name("viewlist1");
    frm.target='_parent';
    frm.elements["_eosFlowAction"].value = "addTopMenu";
    frm.submit();
  }
  
  function modiRecord() {
    var g = $id("group1");
    if (g.getSelectLength() != 1) {
      alert("<b:message key = 'l_m_alert_mustAdnOnlySelectOne'/>");<!--必须且只能选择一行！ -->
      return;
    }
    var frm = $name("viewlist1");    
    frm.target='_parent';
    frm.elements["_eosFlowAction"].value = "modiMenu";
    frm.submit();
  }
  
  function delRecord() {
    var g = $id("group1");
    if (g.getSelectLength() < 1) {
      alert("<b:message key = 'l_m_alert_mustSelectOneOrMore'/>");<!--至少选择一行！ -->
      return;
    }
    var frm = $name("viewlist1");    
    if( !confirm("<b:message key = 'menuManager_l_m_delete_menu_confim'/>") ) { <!--您确认要删除选中的菜单？ -->
    	return;
    }    
    frm.elements["_eosFlowAction"].value = "delMenu";
    frm.submit();
    
  }
  
  /* 
   *  实现全选复选框
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

<h:form name="viewlist1" action="org.gocom.abframe.rights.menu.MenuQuery.flow" method="post">
  <input type="hidden" name="_eosFlowAction" value="pageQuery" >

  <h:hiddendata property="menuCond" scope="flow"/>
  
  <h:hidden property="pageCond/begin" scope="flow"/>
  <h:hidden property="pageCond/length" scope="flow"/>
  <h:hidden property="pageCond/count" scope="flow"/>
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
       <td colspan="6" class="eos-panel-title">&nbsp;&nbsp;<%=title%></td><!--菜单列表 -->
      </tr>
      <tr>
        <th align="center">
          <l:greaterThan property="pageCond/size" targetValue="0" compareType="number" scope="flow" >
        	<input type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll();"> 
          </l:greaterThan>
          <b:message key = 'l_select'/><!--选择 -->
        </th>
        <th>
          <b:message key = 'menuManager_l_AcMenu.menulabel'/><!--菜单显示名称 -->
        </th>

        <th>
          <b:message key = 'menuManager_l_AcMenu.menuname'/><!--菜单名称 -->
        </th>
        <th>
          <b:message key = 'menuManager_l_AcMenu.menucode'/><!--菜单代码 -->
        </th>
        <th>
          <b:message key = 'menuManager_l_AcMenu.isleaf'/><!--是否叶子菜单 -->
        </th>
        <th>
          <b:message key = 'menuManager_l_AcMenu.menulevel'/><!--菜单层次 -->
        </th>        
      </tr>
      
      <w:checkGroup id="group1">
        <l:iterate property="menuList" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />">
            <td align="center">
              <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))">
                <h:param name='selectedObjects/menuid' iterateId='id1' property='menuid' indexed='true' />
              </w:rowCheckbox>
            </td>            
            <td >
              <b:write iterateId="id1" property="menulabel"/>
            </td>
            <td>
              <b:write iterateId="id1" property="menuname"/>
            </td>
            <td>
              <b:write iterateId="id1" property="menucode"/>
            </td>
            <td>
              <d:write iterateId="id1" dictTypeId="ABF_YESORNO" property="isleaf" />
            </td>
            <td>
              <b:write iterateId="id1" property="menulevel"/>
            </td>
          </tr>
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="8" class="command_sort_area">
          <div style="float:left" >
          <input type="button" class="button" value="<b:message key = 'l_add'/>" onclick="addRecord();"><!--增加 -->
          <l:greaterThan property="pageCond/size" scope="flow" targetValue="0" compareType="number">
            <input type="button" class="button" value="<b:message key = 'l_update'/>"  onclick="modiRecord();" id="updateButton" disabled="true"><!--修改 -->
          </l:greaterThan>
          <l:greaterThan property="pageCond/size" scope="flow" targetValue="0" compareType="number">
            <input type="button" class="button" value="<b:message key = 'l_delete'/>" onclick="delRecord();" id="deleteButton" disabled="true"><!--删除 -->
          </l:greaterThan>
          </div><div style="float:right" >
            <l:equal property="pageCond/isCount" scope="flow"  targetValue="true">
              <b:message key = 'l_total'/>       <!--共 -->
              <b:write property="pageCond/count" scope="flow"/>
              <b:message key = 'l_recordNO.'/>   <!--条记录 第 -->
              <b:write property="pageCond/currentPage" scope="flow"/>
              <b:message key = 'l_page'/>/       <!--页 -->
              <b:write property="pageCond/totalPage" scope="flow"/>
              <b:message key = 'l_page'/>        <!--页 -->
            </l:equal>
            <l:equal property="pageCond/isCount" scope="flow" targetValue="false">
              <b:message key = 'l_NO.'/>         <!--第 -->
              <b:write property="pageCond/currentPage" scope="flow"/>
              <b:message key = 'l_page'/>        <!--页 -->
            </l:equal>
            <!--首页 上页 下页 尾页 -->
            <input type="button" class="button" onclick="firstPage('pageCond', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_firstPage'/>"  <l:equal property="pageCond/isFirst" scope="flow" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="prevPage('pageCond', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_upPage'/>" <l:equal property="pageCond/isFirst" scope="flow" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="nextPage('pageCond', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_nextPage'/>" <l:equal property="pageCond/isLast" scope="flow" targetValue="true">disabled</l:equal> >
            <l:equal property="pageCond/isCount" scope="flow" targetValue="true">
              <input type="button" class="button" onclick="lastPage('pageCond', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_lastPage'/>" <l:equal property="pageCond/isLast" scope="flow" targetValue="true">disabled</l:equal> >
            </l:equal>
          </div>
        </td>
      </tr>
    </table>
</h:form>
