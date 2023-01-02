<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%
	String addEmp=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_addEmp");
	String mdfEmp=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_mdfEmp");
	String empQryRes=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_empQryRes");
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Title</title>
</head>
<body topmargin="0" leftmargin="0">

<h:form name="page_form" action="org.gocom.abframe.org.employee.EmpOrgMaintain.flow" checkType="blur" target="_self" method="post">
  <input type="hidden" name="_eosFlowAction" value="pageQuery" >
  <h:hidden property="orgid"/>
  <h:hiddendata property="criteria" />
  <h:hiddendata property="page" />
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
       <td colspan="10" class="eos-panel-title">&nbsp;<%=empQryRes %></td>
      </tr>      
      <tr>
        <th align="center">
          <!--选择-->
          <l:greaterThan property="page/size" targetValue="0" compareType="number">
              <input  type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll('checkSelect','group1');"> 
          </l:greaterThan>
          <b:message key="l_select"/>
        </th>
        <th>工号</th>
        <th>登录名</th>
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
        <th>入职日期 </th>
        <th>离职日期 </th>
        <th>
		  <!--操作员状态-->
		  <b:message key="empOrgMaintain_oOpr.status"/>
        </th>
      </tr>
      <w:checkGroup id="group1">
        <l:iterate property="oaOrgEmpQry" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />">
            <td align="center">
              <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))">
                <h:param name='oaOrgEmpQry/empid' iterateId='id1' property='empid' indexed="true"/>
                <h:param name='oaOrgEmpQry/operatorid' iterateId='id1' property='operatorid' indexed="true"/>                
                <h:param name='oaOrgEmpQry/orgid' iterateId='id1' property='inorgid' indexed="true"/>
              </w:rowCheckbox>
            </td>
            <td><b:write iterateId="id1" property="empcode"/></td>
            <td><b:write iterateId="id1" property="userid"/></td>
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
              <b:write iterateId="id1" property="indate" formatPattern="yyyy-MM-dd"/>
            </td>
            <td>
              <b:write iterateId="id1" property="outdate" formatPattern="yyyy-MM-dd"/>
            </td>
            <td> 
              <d:write dictTypeId="ABF_OPERSTATUS" iterateId="id1" property="status"/>
            </td>
          </tr>
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="10" class="command_sort_area">
         <div style="float:left">
          <input type="button" class="button" value="<b:message key='l_add'/>" onclick="addRec2();">
          <l:greaterThan property="page/size" targetValue="0" compareType="number">
            <input type="button" class="button" value="<b:message key='l_update'/>" onclick="mdfRec2();" id="updateButton">
          </l:greaterThan>
          <l:greaterThan property="page/size" targetValue="0" compareType="number">
            <input type="button" class="button" value="<b:message key='l_delete'/>" onclick="rmvRec();" id="deleteButton">
          </l:greaterThan>
             </div>
          <div style="float:right">
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
              </div>
        </td>
      </tr>
    </table>
</h:form>
</body>
</html>
<script>
  function addRec2() {
    var sUrl="org.gocom.abframe.org.employee.EmployeeManager.flow?_eosFlowAction=baseinfo&emp/orgid="+$name("orgid").value;
    sUrl +='&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数,并且作为判断是否弹出窗口的标志
    var argument = $name("orgid").value;
    showModalCenter(sUrl,argument,callBack,600,500,"<%=addEmp %>");
  }
  function callBack(returnValue) {
	parent.parent.orgTree.getSelectNode().reloadChild();
 	window.location.href=window.location.href+"&";
  }

  function mdfRec2() {
    var g= $id('group1');
    if(g.getSelectLength()==1){
	  var parm="iEmpid="+g.getSelectParams("oaOrgEmpQry/empid")+"&lOperatorid="+g.getSelectParams("oaOrgEmpQry/operatorid");
      var sUrl="org.gocom.abframe.org.employee.EmpOprOrgModify.flow?"+parm;   
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
    var frm = $name("page_form");
    var myAjax = new Ajax("org.gocom.abframe.org.employee.EmpManager.removeEmpOprOrg.biz");
    if(confirm("<b:message key='l_del_confirm'/>")){
	    if(myAjax.submitForm(frm)){
	    	var returnNode =myAjax.getValue("root/data/iRtn");
	    	if(returnNode>=0){
	    		callBack(1);
	    	}    	
	    }
    }
  }
  
</script>