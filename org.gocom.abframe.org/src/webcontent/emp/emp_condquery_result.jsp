<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%
	//获取标签中使用的国际化资源信息
	String empQryRes=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_empQryRes");
	String oprInfo=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_oprInfo");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title></title>
</head>
<body topmargin="0" leftmargin="0">

<h:form name="viewlist1" action="org.gocom.abframe.org.employee.EmpCondQuery.flow" checkType="blur" target="_self" method="post">
  <input type="hidden" name="_eosFlowAction" value="qryagain" >
  <h:hiddendata property="ctOrgEmpQry" />
  <h:hiddendata property="page" />
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
       <td colspan="12" class="eos-panel-title">&nbsp;<%=empQryRes %></td>
      </tr>
      <tr>
        <th align="center">员工工号</th>
        <th>
          <!--人员姓名-->
          <b:message key="empOrgMaintain_oEmp.empname"/>
        </th>
        <th><b:message key="empOrgMaintain_oOpr.userid"/></th>
        <th>
          <!--性别-->
          <b:message key="empOrgMaintain_oEmp.gender"/>
        </th>
        <th>类型</th>
        <th>
          <!--人员状态-->
          <b:message key="empOrgMaintain_oEmp.empstatus"/>
        </th>        
        <th>  
		  <!--所属机构-->
		  <b:message key="empOrgMaintain_oEmp.inorgid"/>          
        </th>
        <th><b:message key="empOrgMaintain_oEmp.oemail"/></th>
        <th><b:message key="empOrgMaintain_oEmp.mobileno"/></th>
        <th>出生日期</th>
        <th>入职日期</th>
        <th>离职日期</th>
      </tr>
      <w:checkGroup id="group1">
        <l:iterate property="oaOrgEmpQry" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />" title='<b:message key="org_locate"/>'
              onclick="locate('<b:write iterateId="id1" property="orgseq"/>','<b:write iterateId="id1" property="positionseq"/>','<b:write iterateId="id1" property="empid"/>',false);" 
              ondblclick="locate('<b:write iterateId="id1" property="orgseq"/>','<b:write iterateId="id1" property="positionseq"/>','<b:write iterateId="id1" property="empid"/>',true);" 
              onmouseover="this.style.cursor='hand'">
            <td align="left" >
              <b:write iterateId="id1" property="empcode"/>
            </td>
            <td>
              <b:write iterateId="id1" property="empname"/>
            </td>
            <td><b:write iterateId="id1" property="userid"/></td>
            <td>
              <d:write dictTypeId="ABF_GENDER" iterateId="id1" property="gender"/>
            </td>
            <td>
              <d:write dictTypeId="AME_EMPTYPE2" iterateId="id1" property="degree"/>
            </td>
            <td>
              <d:write dictTypeId="ABF_EMPSTATUS" iterateId="id1" property="empstatus"/>
            </td>
            <td>
              <b:write iterateId="id1" property="inorgname"/>
            </td>
            <td>
              <b:write iterateId="id1" property="oemail"/>
            </td>
            <td>
              <b:write iterateId="id1" property="mobileno"/>
            </td>
            <td><b:write iterateId="id1" property="birthdate" formatPattern="yyyy-MM-dd"/></td>
            <td><b:write iterateId="id1" property="indate" formatPattern="yyyy-MM-dd"/></td>
            <td><b:write iterateId="id1" property="outdate" formatPattern="yyyy-MM-dd"/></td>
          </tr>
        </l:iterate>
      </w:checkGroup>

      <tr>
        <td colspan="12" class="command_sort_area">
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
            <input type="button" class="button" style='margin-top:4' onclick="firstPage('page', 'qryagain', null, null, 'viewlist1');" value="<b:message key = 'l_firstPage'/>"  <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="prevPage('page', 'qryagain', null, null, 'viewlist1');" value="<b:message key = 'l_upPage'/>" <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="nextPage('page', 'qryagain', null, null, 'viewlist1');" value="<b:message key = 'l_nextPage'/>" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            <l:equal property="page/isCount" targetValue="true">
              <input type="button" class="button" onclick="lastPage('page', 'qryagain', null, null, 'viewlist1');" value="<b:message key = 'l_lastPage'/>" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            </l:equal>
          </div>
        </td>
      </tr>
    </table>
</h:form>
</body>
<script>
     function locate(orgseq,positonseq,empid,flag){ 
     var obj = {'type':2,'seq':[orgseq,positonseq,empid],'clickflag':flag};   
     parent.parent.parent.locate(obj);
    }
</script>
</html>