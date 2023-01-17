<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common.jsp"%>
<%
	//获取操作员id属性，默认查询登录操作员的快捷菜单
	String operatorid=com.eos.foundation.data.DataContextUtil.getString("operatorid");
	//获取标签中使用的国际化资源信息
	String panel1Title="我的快捷菜单";
	String listPanelTitle="我的快捷菜单";

 %>
<%--
- Author(s): 蔡述尧
- Date: 2008-08-12 13:53:31
- Description:
--%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
      <b:message key = 'opershortcutManager_l_title_opershortcut_query'/><!--快捷菜单维护 -->
    </title>
  </head>
  <body leftmargin="0" topmargin="0">
    <e:datasource name="criteria" type="entity" path="com.primeton.das.criteria.criteraiType" />
    <e:datasource name="page" type="entity" path="com.eos.foundation.PageCond" />
    <h:form name="query_form" action="org.gocom.abframe.rights.menu.OpershortcutManager.flow" method="post" onsubmit="return checkForm(this);">
      <input type="hidden" name="_eosFlowAction" value="pageQuery"/>

      <w:panel id="panel1" width="100%" title="<%=panel1Title %>"><!--快捷菜单查询 -->
        <table align="center" border="0" width="100%" class="form_table">
          <tr>
            <td class="form_label">功能名称</td>
            <td colspan="1">
              <h:text property="criteria/_expr[1]/funcname"/>
              <h:hidden property="criteria/_expr[1]/_op" value="like"/>
            </td>
            <td class="form_label">
              <b:message key="opershortcutManager_l_AcOpershortcut.appid"/><b:message key="l_colon"/><!--应用编号 -->
            </td>
            <td colspan="1">
              <h:text property="criteria/_expr[2]/appid"/>
              <h:hidden property="criteria/_expr[2]/_op" value="="/>
            </td>
            <td class="form_label">
              <b:message key = 'opershortcutManager_l_AcOpershortcut.funccode'/><b:message key="l_colon"/><!--功能编号 -->
            </td>
            <td colspan="1">
              <h:text property="criteria/_expr[3]/funccode"/>
              <h:hidden property="criteria/_expr[3]/_op" value="="/>
              <h:hidden property="criteria/_expr[4]/operatorid"/>
            </td>
          </tr>

          <tr class="form_bottom">
            <td colspan="6" class="form_bottom">
              <input type="hidden" name="criteria/_entity" value="org.gocom.abframe.dataset.privilege.AcOpershortcutQuery">
              <b:message key = 'l_pageDisplay'/><!--每页显示 -->
              <h:text size="2" property="page/length" value="20" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
              <input type="hidden" name="page/begin" value="0">
              <input type="hidden" name="page/isCount" value="true">
	          <input type="submit" class="button" value="<b:message key = 'l_query'/>"><!--查询 -->
	          <input type="reset" class="button" value="<b:message key = 'l_reset'/>"><!--重置 -->
            </td>
          </tr>
        </table>
      </w:panel>
      <h:hidden property="criteria/_orderby[1]/_sort" value="asc"/>
      <h:hidden property="criteria/_orderby[1]/_property" value="orderno"/>
    </h:form>
    <h:form name="page_form" action="org.gocom.abframe.rights.menu.OpershortcutManager.flow" method="post">
      <input type="hidden" name="_eosFlowAction" value="pageQuery"/>
      <h:hiddendata property="criteria" />
      <h:hidden property="page/begin"/>
      <h:hidden property="page/length"/>
      <h:hidden property="page/count"/>
        <table align="center" border="0" width="100%" class="EOS_table">
          <tr height="4%">
			<td class="eos-panel-title" colspan="6">&nbsp;&nbsp;<%=listPanelTitle%></td>
		  </tr>
          <tr>
            <th align="center">
            	<l:greaterThan property="page/size" targetValue="0" compareType="number">
	          		<input type="checkbox" id="checkSelect" name="checkSelect" title='<b:message key="l_select"></b:message>' onclick="checkSelectAll();"><!-- 选择 -->
	          	</l:greaterThan>
				<b:message key = 'l_select'/><!--选择 -->
            </th>
            <th>
              <b:message key = 'opershortcutManager_l_AcOpershortcut.funccode(funcname)'/><!--功能名称 -->
            </th>
            <th>
              <b:message key = 'opershortcutManager_l_AcOpershortcut.funcgroupid(funcgroupname)'/><!--功能组名称 -->
            </th>
            <th>
              <b:message key = 'opershortcutManager_l_AcOpershortcut.appid(appname)'/><!--应用名称 -->
            </th>
            <th>
              <b:message key = 'opershortcutManager_l_AcOpershortcut.orderno'/><!--排列顺序 -->
            </th>
            <th>
              <b:message key = 'opershortcutManager_l_AcOpershortcut.imagepath'/><!--快捷菜单图片路径 -->
            </th>
          </tr>
          <w:checkGroup id="group1">
            <l:iterate property="acopershortcuts" id="id1">
              <tr class="<l:output evenOutput='EOS_table_row' />">
                <td align="center">
                  <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))">
                    <h:param name='select_objs/funccode' iterateId='id1' property='funccode' indexed='true' />
                    <h:param name='select_objs/operatorid' iterateId='id1' property='operatorid' indexed='true' />
                  </w:rowCheckbox>
                </td>
                <td>
                  <b:write iterateId="id1" property="funcname"/>
                </td>
                <td>
                  <b:write iterateId="id1" property="funcgroupname"/>
                </td>
                <td>
                  <b:write iterateId="id1" property="appname"/>
                </td>
                <td>
                  <b:write iterateId="id1" property="orderno"/>
                </td>
                <td>
                  <b:write iterateId="id1" property="imagepath"/>
                </td>
              </tr>
            </l:iterate>
          </w:checkGroup>
          <tr>
            <td colspan="6" class="command_sort_area">
             <div style="float:left" >
              <input type="button" class="button" value="<b:message key = 'l_add'/>" onclick="addRecord();"> <!--增加 -->
              <l:greaterThan property="page/size" targetValue="0" compareType="number">
                <input type="button" class="button" value="<b:message key = 'l_update'/>" onclick="updateRecord();" id="updateButton" disabled="true"><!--修改 -->
              </l:greaterThan>
              <l:greaterThan property="page/size" targetValue="0" compareType="number">
                <input type="button" class="button" value="<b:message key = 'l_delete'/>" onclick="deleteRecord();" id="deleteButton" disabled="true"><!--删除 -->
              </l:greaterThan>
               </div><div style="float:right" >
                <l:equal property="page/isCount" targetValue="true">
                  <b:message key = 'l_total'/>       <!--共 -->
                  <b:write property="page/count"/>
                  <b:message key = 'l_recordNO.'/>   <!--条记录 第 -->
                  <b:write property="page/currentPage"/>
                  <b:message key = 'l_page'/>/       <!--页 -->
                  <b:write property="page/totalPage"/>
                  <b:message key = 'l_page'/>        <!--页 -->
                </l:equal>
                <l:equal property="page/isCount" targetValue="false">
                  <b:message key = 'l_NO.'/>         <!--第 -->
                  <b:write property="page/currentPage"/>
                  <b:message key = 'l_page'/>        <!--页 -->
                </l:equal>
                <!--首页 上页 下页 尾页 -->
                <input type="button" class="button" onclick="firstPage('page', 'pageQuery', null, null, 'page_form');" value="<b:message key = 'l_firstPage'/>"  <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
                <input type="button" class="button" onclick="prevPage('page', 'pageQuery', null, null, 'page_form');" value="<b:message key = 'l_upPage'/>" <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
                <input type="button" class="button" onclick="nextPage('page', 'pageQuery', null, null, 'page_form');" value="<b:message key = 'l_nextPage'/>" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
                <l:equal property="page/isCount" targetValue="true">
                  <input type="button" class="button" onclick="lastPage('page', 'pageQuery', null, null, 'page_form');" value="<b:message key = 'l_lastPage'/>" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
                </l:equal>
              </div>
            </td>
          </tr>
        </table>
    </h:form>
    <script>
    
     /*
      * 功能：实现全选复选框
      *
      * return 
      */
      function checkSelectAll()
      {
		if ($id("checkSelect").checked)
		{
			selectAll("group1");
		}else{
			selectNone("group1");
		}
      }
      
      function updateRecord()
      {
        var g = $id("group1");
        var frm = $name("page_form");
        if (g.getSelectLength() != 1) {
          alert("<b:message key = 'l_m_alert_mustAdnOnlySelectOne'/>");<!--必须且只能选择一行！ -->
          return;
        }
        frm.elements["_eosFlowAction"].value = "update";
        frm.submit();
      }
      function addRecord()
      {
        var frm = $name("page_form");
        frm.elements["_eosFlowAction"].value = "insert";
        frm.submit();
      }
      function deleteRecord()
      {
        var g = $id("group1");
        var frm = $name("page_form");
        if (g.getSelectLength() < 1) {
          alert("<b:message key = 'l_m_alert_mustSelectOneOrMore'/>");<!--至少选择一行！ -->
          return;
        }
	    if( !confirm("<b:message key = 'opershortcutManager_l_m_delete_confim'/>") ) { <!--您确认要删除选中的快捷菜单？ -->
	    	return;
	    }
        frm.elements["_eosFlowAction"].value = "delete";
        frm.submit();
      }

    </script>
  </body>
</html>
