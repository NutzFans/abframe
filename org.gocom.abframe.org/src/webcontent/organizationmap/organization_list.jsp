<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("organizationmapManager_l_title_organization_list");
%>
<head>
<title><%=title%></title><!--组织机构列表  -->
</head>
<body topmargin="0" leftmargin="0">
<viewlist id="83b0e70b-cf59-407e-8e3c-546a65a47910">
  <h:form name="viewlist1" action="org.gocom.abframe.org.OrganizationmapQuery.flow" method="post">
    <input type="hidden" name="_eosFlowAction" value="pageQuery" >
    <h:hidden property="page/begin"/>
    <h:hidden property="page/count"/>
    <h:hidden property="page/isCount"/>
      <table align="center" border="0" width="100%" class="EOS_table">
        <tr>
       <td colspan="6" class="eos-panel-title">&nbsp;<%=title%></td><!--组织机构列表  -->
      </tr>
        <tr>
          <th>
            <b:message key = 'organizationmapManager_l_AcOrganization.orgcode'/><!--机构代码  -->
          </th>
          <th>
            <b:message key = 'organizationmapManager_l_AcOrganization.orgname'/><!--机构名称  -->
          </th>
          <th>
            <b:message key = 'organizationmapManager_l_AcOrganization.orgtype'/><!--机构类型  -->
          </th>
          <th>
            <b:message key = 'organizationmapManager_l_AcOrganization.manaposition'/><!--机构主管岗位  -->
          </th>
          <th>
            <b:message key = 'organizationmapManager_l_AcOrganization.orgmanager'/><!--机构管理员  -->
          </th>
          <th>
            <b:message key = 'organizationmapManager_l_AcOrganization.status'/><!--机构状态  -->
          </th>
        </tr>
        <w:checkGroup id="group1">
          <l:iterate property="orgs" id="id1">
            <tr class="<l:output evenOutput='EOS_table_row' />">
              <td>
                <b:write iterateId="id1" property="orgcode"/>
              </td>
              <td>
                <b:write iterateId="id1" property="orgname"/>
              </td>
              <td>
                <d:write iterateId="id1" dictTypeId="ABF_ORGTYPE" property="orgtype"/>
              </td>
              <td>
                <b:write iterateId="id1" property="manaposition"/>
              </td>
              <td>
                <b:write iterateId="id1" property="orgmanager"/>
              </td>
              <td>
                <d:write iterateId="id1" dictTypeId="ABF_ORGSTATUS" property="status"/>
              </td>
            </tr>
          </l:iterate>
        </w:checkGroup>
        <tr>
          <td colspan="7" class="command_sort_area">
            <div style="float:left">
            <input type="button" class="button" value="<b:message key = 'organizationmapManager_l_exportCurRecord'/>" onclick="exportCurRecord();"><!--导出当前页数据  -->
            <input type="button" class="button" value="<b:message key = 'organizationmapManager_l_exportAllRecord'/>" onclick="exportAllRecord();"><!--导出所有数据  -->
            
            </div>
          <div style="float:right">
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
              <b:message key="l_pageDisplay" />              
              <h:text size="3" property="page/length" value="10" validateAttr="minValue=1;maxValue=1000;type=integer;isNull=true" scope="flow" />              
              <!--首页 上页 下页 尾页 -->
              <input type="button" class="button" onclick="firstPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_firstPage'/>"  <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
              <input type="button" class="button" onclick="prevPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_upPage'/>" <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
              <input type="button" class="button" onclick="nextPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_nextPage'/>" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
              <l:equal property="page/isCount" targetValue="true">
                <input type="button" class="button" onclick="lastPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_lastPage'/>" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
              </l:equal>
            </div>
          </td>
        </tr>
      </table>
  </h:form>
<script>
    function exportCurRecord() {
     // var g = $id("group1");
      var frm = $name("viewlist1");     
      frm.elements["_eosFlowAction"].value = "exportCurRecord";
      frm.submit();
    }
    function exportAllRecord() {
      //var g = $id("group1");
      var frm = $name("viewlist1");
      frm.elements["_eosFlowAction"].value = "exportAllRecord";
      frm.submit();
    }

</script>
</viewlist>

</body>
</html>