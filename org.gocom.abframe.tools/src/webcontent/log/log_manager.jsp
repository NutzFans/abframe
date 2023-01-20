<%@page pageEncoding="UTF-8" %>
<%@include file="/common.jsp"%>

<html>
  <head>
    <title></title>
<%
    //获取标签中使用的国际化资源信息
    String pleaseSelect = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
    String logQuery = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("configManager_l_title_logQuery");
    String logList = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("configManager_l_title_logList");
    String operstatus = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("configManager_AtOperlog.operstatus");

%>
  <script>
      /*
       * 清除业务日志
       */
      function cleanup()
      {
         var frm = $name("page_form");
         frm.elements["_eosFlowAction"].value = "cleanup";

         if( confirm( '<b:message key="configManager_l_m_alert_clearupAll"/>' ) ) {
             frm.submit();
         }
      }
      /*
       * 归档业务日志
       */
      function backup()
      {
        var frm = $name("page_form");
        frm.elements["_eosFlowAction"].value = "backup";

        if( confirm( '<b:message key="configManager_l_m_alert_backupAll"/>' ) ) {
            frm.submit();
        }
      }
      /*
       * 删除业务日志
       */
      function deleteRecord()
      {
          var g = $id("group1");
          var frm = $name("page_form");
          if (g.getSelectLength() < 1) {
              alert( '<b:message key="l_m_alert_mustSelectOneOrMore"/>' );  <!-- 必须至少选择一行 -->
           return;
       }
       frm.elements["_eosFlowAction"].value = "delete";
       if( confirm( '<b:message key="configManager_l_m_alert_deleteAll"/>' ) ) {
             frm.submit();
       }
      }
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
    </script>
  </head>
  <body topmargin="0" leftmargin="0">
    <e:datasource name="criteria" type="entity" path="com.primeton.das.criteria.criteraiType" />
    <e:datasource name="page" type="entity" path="com.eos.foundation.PageCond" />
    <e:datasource name="atoperlogs" type="entity" path="org.gocom.abframe.dataset.tools.AtOperlog" />
    <h:form name="query_form" action="org.gocom.abframe.tools.OperlogManager.flow" method="post" onsubmit="return checkForm(this);">
      <input type="hidden" name="_eosFlowAction" value="pageQuery"/>
      <w:panel id="panel1" width="100%" title="<%=logQuery %>">
        <table align="center" border="0" width="100%" class="form_table" cellpadding="0" cellspacing="0">
          <tr>
            <td class="form_label">  <!-- 操作员姓名 -->
              <b:message key="configManager_AtOperlog.operatorname"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td>
              <h:text property="criteria/_expr[1]/operatorname"/>
              <h:hidden property="criteria/_expr[1]/_op" value="like"/>
              <h:hidden property="criteria/_expr[1]/_likeRule" value="all"/>
            </td>
            <td class="form_label">    <!-- 操作状态 -->
              <b:message key="configManager_AtOperlog.operstatus"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td >
              <d:select dictTypeId="ABF_LOGOPERSTARTUS" style="width:133" nullLabel="<%=pleaseSelect %>" name="criteria/_expr[2]/operstatus"></d:select>

              <h:hidden property="criteria/_expr[2]/_op" value="like"/>
              <h:hidden property="criteria/_expr[2]/_likeRule" value="all"/>
            </td>
            <td class="form_label">    <!-- 操作状态 -->
              <b:message key="configManager_AtOperlog.logtype"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td >
              <d:select dictTypeId="ABF_LOG_TYPE" style="width:133" nullLabel="<%=pleaseSelect %>" name="criteria/_expr[3]/logtype"></d:select>

              <h:hidden property="criteria/_expr[3]/_op" value="="/>
            </td>
            <td class="form_label">    <!-- 操作日期 -->
              <b:message key="configManager_AtOperlog.opertime"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td>
              <h:hidden property="criteria/_expr[4]/_op" value="between" />
              <h:hidden property="criteria/_expr[4]/opertime" value=" " />
              <h:hidden property="criteria/_expr[4]/_pattern" value="yyyy-MM-dd"/>
              <table style="border:0px;background-color:transparent" border="0" cellspacing="0" cellpadding="0">
                <tr style="border: 0px none ; background-color: transparent;">
                  <td style="border: 0px none ; background-color: transparent;">
                    <b:message key="configManager_l_label_from"></b:message>
                  </td>
                  <td style="border: 0px none ; background-color: transparent;">
                    <w:date property="criteria/_expr[4]/_min" defaultNull="true" size="9"/>
                  </td>
                  <td style="border: 0px none ; background-color: transparent;">
                    <b:message key="configManager_l_label_to"></b:message>
                  </td>
                  <td style="border: 0px none ; background-color: transparent;">
                    <w:date property="criteria/_expr[4]/_max" defaultNull="true" size="9"/>
                  </td>
                </tr>
              </table>
            </td>
          </tr>
          <tr class="form_bottom">
            <td colspan="8" class="form_bottom">
              <input type="hidden" name="criteria/_entity" value="org.gocom.abframe.dataset.tools.AtOperlog">
              <b:message key="l_pageDisplay"></b:message>
              <h:text size="2" property="page/length" value="10" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
              <input type="hidden" name="page/begin" value="0">
              <input type="hidden" name="page/isCount" value="true">
              <input type="submit" class="button" value='<b:message key="l_query"></b:message>'>&nbsp;
              <input type="button" class="button" value='<b:message key="l_reset"></b:message>' onclick="javascript:$name('query_form').reset();">
            </td>
          </tr>
        </table>
      </w:panel>
      <h:hidden property="criteria/_orderby[1]/_sort" value="desc"/>
      <h:hidden property="criteria/_orderby[1]/_property" value="opertime"/>
    </h:form>
    <h:form name="page_form" action="org.gocom.abframe.tools.OperlogManager.flow" method="post">
      <input type="hidden" name="_eosFlowAction" value="pageQuery"/>
      <h:hiddendata property="criteria" />
      <h:hidden property="page/begin"/>
      <h:hidden property="page/length"/>
      <h:hidden property="page/count"/>
        <table align="center" border="0" width="100%" class="EOS_table" cellpadding="0" cellspacing="0">
          <tr height="4%">
			<td class="eos-panel-title" colspan="6">&nbsp;&nbsp;<%=logList%></td>
		  </tr>
          <tr>
            <th align="center">
            	<l:greaterThan property="page/size" targetValue="0" compareType="number">
	          		<input type="checkbox" id="checkSelect" name="checkSelect" title='<b:message key="l_select"></b:message>' onclick="checkSelectAll();"><!-- 选择 -->
	          	</l:greaterThan>
              	<b:message key="l_select"></b:message>
            </th>
            <th>         <!-- 登陆名 -->
              <b:message key="configManager_AtOperlog.userid"></b:message>
            </th>
            <th>         <!-- 操作员姓名 -->
               <b:message key="configManager_AtOperlog.operatorname"></b:message>
            </th>
            <th>         <!-- 操作时间 -->
              <b:message key="configManager_AtOperlog.opertime"></b:message>
            </th>
            <th>         <!-- 功能名称 -->
              <b:message key="portalManager_AcFunction.funcname"></b:message>
            </th>
            <th>         <!-- 操作状态 -->
              <b:message key="configManager_AtOperlog.operstatus"></b:message>
            </th>
          </tr>
          <w:checkGroup id="group1">
            <l:iterate property="atoperlogs" id="id1">
              <tr class="<l:output evenOutput='EOS_table_row' />">
                <td align="center">
                  <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" > 
                    <h:param name='select_objs/operatorid' iterateId='id1' property='operatorid' indexed="true"/>
                  </w:rowCheckbox>
                </td>
                <td>
                  <b:write iterateId="id1" property="userid"/>
                </td>
                <td>
                  <b:write iterateId="id1" property="operatorname"/>
                </td>
                <td>
                  <b:write iterateId="id1" property="opertime"/>
                </td>
                <td>
                  <b:write iterateId="id1" property="funcname"/>
                </td>

                <td>
                  <d:write dictTypeId="ABF_LOGOPERSTARTUS" property="operstatus" iterateId="id1" />
                </td>
              </tr>
            </l:iterate>
          </w:checkGroup>
          <tr>
            <td colspan="11" class="command_sort_area">
               <div style="float:left" >
                <input type="button" class="button" value='<b:message key="configManager_l_backup"/>' onclick="backup();" <l:equal property="page/count" targetValue="0">disabled</l:equal>>
                <input type="button" class="button" value='<b:message key="configManager_l_clearup"/>' onclick="cleanup();" <l:equal property="page/count" targetValue="0">disabled</l:equal>>
                <input type="button" class="button" value='<b:message key="l_delete"/>' onclick="deleteRecord();" id="deleteButton" disabled="true" <l:equal property="page/count" targetValue="0">disabled</l:equal>>
               </div><div style="float:right" >
                <l:equal property="page/isCount" targetValue="true">
                  <b:message key="l_total"></b:message>
                  <b:write property="page/count"/>
                  <b:message key="l_recordNO."></b:message>
                  <b:write property="page/currentPage"/>
                  <b:message key="l_page"></b:message>/
                  <b:write property="page/totalPage"/>
                  <b:message key="l_page"></b:message>
                </l:equal>
                <l:equal property="page/isCount" targetValue="false">
                  <b:message key="l_NO."></b:message>
                  <b:write property="page/currentPage"/>
                  <b:message key="l_page"></b:message>
                </l:equal>
                <input type="button" class="button" onclick="firstPage('page', 'pageQuery', null, null, 'page_form');" value='<b:message key="l_firstPage"></b:message>'  <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
                <input type="button" class="button" onclick="prevPage('page', 'pageQuery', null, null, 'page_form');" value='<b:message key="l_upPage"></b:message>' <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
                <input type="button" class="button" onclick="nextPage('page', 'pageQuery', null, null, 'page_form');" value='<b:message key="l_nextPage"></b:message>' <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
                <l:equal property="page/isCount" targetValue="true">
                  <input type="button" class="button" onclick="lastPage('page', 'pageQuery', null, null, 'page_form');" value='<b:message key="l_lastPage"></b:message>' <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
                </l:equal>
              </>
            </td>
          </tr>
        </table>
    </h:form>
  </body>
</html>