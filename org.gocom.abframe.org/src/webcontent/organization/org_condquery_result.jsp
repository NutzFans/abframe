<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_condQueryOrgRes");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>
</head>
<body topmargin="0" leftmargin="0">

<h:form name="viewlist1" action="org.gocom.abframe.org.organization.OrgCondQuery.flow" method="post">
  <input type="hidden" name="_eosFlowAction" value="qryagain" >
  <h:hiddendata property="ctOrg" />
  <h:hidden property="page/begin"/>
  <h:hidden property="page/length"/>
  <h:hidden property="page/count"/>
  <h:hidden property="page/isCount"/>  
  <table align="center" border="0" width="100%" class="EOS_table">    
	  <tr>
       <td colspan="6" class="eos-panel-title">&nbsp;<%=title%></td>
      </tr>		
      <tr>
        <th align="center">
          <!--机构代码-->
          <b:message key="orgSubMaintain_OmOrganization.orgcode"/>
        </th>
        <th>
          <!--机构名称-->
          <b:message key="orgSubMaintain_OmOrganization.orgname"/>         
        </th>
        <th>
          <!--机构类型-->
          <b:message key="orgSubMaintain_OmOrganization.orgtype"/>
        </th>        
        <th>
          <!--机构状态-->
          <b:message key="orgSubMaintain_OmOrganization.status"/>
        </th>
        <th>
          <!--机构等级-->
          <b:message key="orgSubMaintain_OmOrganization.orgdegree"/>
        </th>        
      </tr>
      <w:checkGroup id="group1">
        <l:iterate property="oaOrg" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />"  title='<b:message key="org_locate"/>'
              onclick="locate('<b:write iterateId="id1" property="orgseq"/>',false);" 
              ondblclick="locate('<b:write iterateId="id1" property="orgseq"/>',true);" 
              onmouseover="this.style.cursor='hand'">
            <td align="left">
              <b:write iterateId="id1" property="orgcode"/>
            </td>
            <td>
              <b:write iterateId="id1" property="orgname"/>
            </td>
            <td>
              <d:write dictTypeId="ABF_ORGTYPE" iterateId="id1" property="orgtype"/>            
            </td>
            <td>
              <d:write dictTypeId="ABF_ORGSTATUS" iterateId="id1" property="status"/>            
            </td>            
            <td>
              <d:write dictTypeId="ABF_ORGDEGREE" iterateId="id1" property="orgdegree"/>
            </td>            
          </tr>
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="10" class="command_sort_area">       
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
            <input type="button" class="button" style='margin-top:4' onclick="firstPage('page', '', null, null, 'viewlist1');" value="<b:message key = 'l_firstPage'/>" <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="prevPage('page', '', null, null, 'viewlist1');" value="<b:message key = 'l_upPage'/>" <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="nextPage('page', '', null, null, 'viewlist1');" value="<b:message key = 'l_nextPage'/>" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            <l:equal property="page/isCount" targetValue="true">
              <input type="button" class="button" onclick="lastPage('page', '', null, null, 'viewlist1');" value="<b:message key = 'l_lastPage'/>" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            </l:equal>
          </div>
        </td>
      </tr>
    </table>
</h:form>
</body>
</html>
<script>
 function locate(seq,flag){ 
   var obj = {'type':0,'seq':[seq,'',''],'clickflag':flag};   
   parent.parent.parent.locate(obj);
 }
</script>

