<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%
	String addEmp=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_addEmp");
	String mdfEmp=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_mdfEmp");
	String empQryRes=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_empQryRes");
%>
<html>
<script>

  function addRec2() {
    var sUrl=contextPath+"/organization/emp/empopr_posi_add.jsp";
    var argument = $name("iPosiid").value+"-"+$name("iOrgid").value;
    showModalCenter(sUrl,argument,callBack,600,500,"<%=addEmp %>");
  }
  function callBack(returnValue) {
 	window.location.href=window.location.href+"&";
  }

  function mdfRec2() {
    var g= $id('group1');
    if(g.getSelectLength()==1){
	  var parm="iEmpid="+g.getSelectParams("oaPosiEmpQry/empid");
	  //var parm="iEmpid="+g.getSelectParams("oaPosiEmpQry/empid")+"&lOperatorid="+g.getSelectParams("oaPosiEmpQry/operatorid");
      var sUrl="org.gocom.abframe.org.employee.EmpOprPosiModify.flow?"+parm;   
      showModalCenter(sUrl,null,callBack,600,500,"<%=mdfEmp %>");
    }else{
      alert("<b:message key = 'l_m_alert_mustAdnOnlySelectOne'/>");
      return;
    }
  }
  
  function rmvRec() {
    var g = $id("group1");
    if (g.getSelectLength() < 1) {
      alert("<b:message key = 'l_m_alert_mustSelectOneOrMore'/>");
      return;
    }
    var frm = $name("viewlist1");
    frm.elements["_eosFlowAction"].value = "rmv";
    frm.submit();
  }
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Title</title>
</head>
<body topmargin="0" leftmargin="0">

<h:form name="viewlist1" action="org.gocom.abframe.org.employee.EmpPosiMaintain.flow" checkType="blur" target="_self" method="post">
  <input type="hidden" name="_eosFlowAction" value="qryagain" >
  <h:hidden property="iPosiid" scope="f"/>
  <h:hidden property="iOrgid" scope="f"/>  
  <%--  
  <h:hiddendata property="ctPosiEmpQry" />
  <h:hiddendata property="page" />
  --%>
  <w:panel id="list_panel" width="100%" title="<%=empQryRes %>">
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
        <th align="center">
          <!--选择-->
          <b:message key="l_select"/>
        </th>
        <th>
          <!--人员代码-->
          <b:message key="empOrgMaintain_oEmp.empcode"/>
        </th>
        <th>
           <!--人员姓名-->
          <b:message key="empOrgMaintain_oEmp.empname"/>
        </th>
        <th>
          <!--性别-->
          <b:message key="empOrgMaintain_oEmp.gender"/>
        </th>
        <th>
          <!--人员状态-->
          <b:message key="empOrgMaintain_oEmp.empstatus"/>
        </th>
        <th>
		  <!--操作员ID-->
		  <b:message key="empOrgMaintain_oEmp.operatorid"/> 
        </th>
        <th>
		  <!--操作员状态-->
		  <b:message key="empOrgMaintain_oOpr.status"/>
        </th>
      </tr>
      <w:checkGroup id="group1">
        <l:iterate property="oaPosiEmpQry" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />">
            <td align="center">
              <w:rowCheckbox>
                <h:param name='oaPosiEmpQry/empid' iterateId='id1' property='empid' />
                <h:param name='oaPosiEmpQry/operatorid' iterateId='id1' property='operatorid' />                
                <h:param name='oaPosiEmpQry/inpositionid' iterateId='id1' property='inpositionid' />
              </w:rowCheckbox>
            </td>
            <td>
              <b:write iterateId="id1" property="empcode"/>
            </td>
            <td>
              <b:write iterateId="id1" property="empname"/>
            </td>
            <td>
              <d:write dictTypeId="ABF_GENDER" iterateId="id1" property="gender"/>
            </td>
            <td>
              <d:write dictTypeId="ABF_EMPSTATUS" iterateId="id1" property="empstatus"/>
            </td>
            <td>
              <b:write iterateId="id1" property="operatorid"/>
            </td>
            <td>
              <d:write dictTypeId="ABF_OPERSTATUS" iterateId="id1" property="status"/>
            </td>
          </tr>
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="7" class="command_sort_area">
          <div style="float:left">
          <input type="button" class="button" value="<b:message key='l_add'/>" onclick="addRec2();">
          <l:greaterThan property="page/size" scope="f" targetValue="0" compareType="number">
            <input type="button" class="button" value="<b:message key='l_update'/>" onclick="mdfRec2();">
          </l:greaterThan>
          <l:greaterThan property="page/size" scope="f" targetValue="0" compareType="number">
            <input type="button" class="button" value="<b:message key='l_delete'/>" onclick="rmvRec();">
          </l:greaterThan>
          </div>
          <div style="float:right">
            <l:equal property="page/isCount" scope="f" targetValue="true">
              <b:message key = 'l_total'/>       <!--共 -->
              <b:write property="page/count" scope="f"/>
              <b:message key = 'l_recordNO.'/>   <!--条记录 第 -->
              <b:write property="page/currentPage" scope="f"/>
              <b:message key = 'l_page'/>/       <!--页 -->
              <b:write property="page/totalPage" scope="f"/>
              <b:message key = 'l_page'/>        <!--页 -->
            </l:equal>
            <l:equal property="page/isCount" scope="f" targetValue="false">
              <b:message key = 'l_NO.'/>         <!--第 -->
              <b:write property="page/currentPage" scope="f"/>
              <b:message key = 'l_page'/>        <!--页 -->
            </l:equal>
            <input type="button" class="button" onclick="firstPage('page', 'qryagain', null, null, 'viewlist1');" value="<b:message key = 'l_firstPage'/>"  <l:equal property="page/isFirst" scope="f" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="prevPage('page', 'qryagain', null, null, 'viewlist1');" value="<b:message key = 'l_upPage'/>" <l:equal property="page/isFirst" scope="f" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="nextPage('page', 'qryagain', null, null, 'viewlist1');" value="<b:message key = 'l_nextPage'/>" <l:equal property="page/isLast" scope="f" targetValue="true">disabled</l:equal> >
            <l:equal property="page/isCount" scope="f" targetValue="true">
              <input type="button" class="button" onclick="lastPage('page', 'qryagain', null, null, 'viewlist1');" value="<b:message key = 'l_lastPage'/>" <l:equal property="page/isLast" scope="f" targetValue="true">disabled</l:equal> >
            </l:equal>
          </div>
        </td>
      </tr>
    </table>
  </w:panel>
</h:form>
</body>
</html>