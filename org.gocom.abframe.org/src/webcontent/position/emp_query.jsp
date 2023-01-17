<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common.jsp"%>

<html>
<head>
<%
	//人员查询
	String emp_query = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionEmp_l_title_EmpQuery");
	//人员列表
	String emp_list = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionEmp_l_title_EmpList");
%>

<script language="javascript">
    /*  
     *  增加岗位人员
     */
    function addEmpPosition() {
        var g = $id("group1");
        if (g.getSelectLength() < 1) {
            alert( '<b:message key="l_m_alert_mustSelectOneOrMore"/>' ); //必须至少选择一行  
            return;
        }
         var frm = $name("page_form");
         frm.elements["_eosFlowAction"].value = "insert";
         var myajax = new Ajax("org.gocom.abframe.org.position.PositionManager.addPositionEmp.biz");
         if(checkForm(frm)){
           myajax.submitForm(frm);        
           if( myajax.isSuccess() && myajax.getValue("root/data/retCode") == 1 ) {
	          window.close();
	      }
         }       
    }
    
</script>

</head>
  
<body class="eos-panel-table">
    <h:form name="query_form" action="org.gocom.abframe.org.position.EmpQueryInput.flow" method="post">
      <input type="hidden" name="_eosFlowAction" value="pageQuery"/>
      <h:hidden property="emppos/omPosition/positionid"/>     
        <table align="center" border="0" width="100%" class="form_table">
          <tr>
            <td class="form_label" >  <!--  登陆名 -->
               <b:message key="positionEmp_omEmployee.userid"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td >
              <h:text name="emppos/omEmployee/userid"/>
              
            </td>
            <td class="form_label">  <!-- 操作员姓名 -->
              <b:message key="positionEmp_omEmployee.empname"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td >
              <h:text name="emppos/omEmployee/empname"/>
            </td>
          </tr>
          <tr class="form_bottom">
            <td colspan="6" class="form_bottom">
              <b:message key="l_pageDisplay"></b:message>
              <h:text size="2" property="page/length" value="10" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
              <input type="hidden" name="page/begin" value="0">
              <input type="hidden" name="page/isCount" value="true">
              <input type="submit" class="button" value='<b:message key="l_query"></b:message>'>&nbsp;<input type="button" class="button" value='<b:message key="l_reset"></b:message>' onclick="javascript:$name('query_form').reset();">
            </td>
          </tr>
        </table>
    </h:form>
    <h:form name="page_form" action="org.gocom.abframe.org.position.EmpQueryInput.flow" method="post">
      <input type="hidden" name="_eosFlowAction" value="pageQuery"/>
      <h:hidden name="parentPosID" property="emppos/omPosition/positionid" />
      <h:hidden property="page/begin" scope="flow"/>
      <h:hidden property="page/length" scope="flow"/>
      <h:hidden property="page/count" scope="flow"/>
        <table align="center" border="0" width="544" class="EOS_table">
          <tr>
	       <td colspan="4" class="eos-panel-title">&nbsp;<%=emp_list %></td>
	      </tr>          
          <tr>
            <th align="center">
              <l:greaterThan property="page/size" targetValue="0" compareType="number" scope="flow">
	                  <input  type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll('checkSelect','group1');"> 
	              </l:greaterThan>
              <b:message key="l_select"></b:message>
            </th> 
            <th>   <!-- 人员姓名 -->
              <b:message key="positionEmp_omEmployee.empname"></b:message>
            </th>           
            <th>   <!-- 人员代码 -->
              <b:message key="positionEmp_l_omEmployee.empcode"></b:message>
            </th>            
            <th>   <!-- 登录名 -->
              <b:message key="positionEmp_omEmployee.userid"></b:message>
            </th>
          </tr>
          <w:checkGroup id="group1">
            <l:iterate property="emps" id="id1">
              <tr class="<l:output evenOutput='EOS_table_row' />">
                <td align="center">
                  <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), null, $id('addButton'))" afterUnSelectFunc="clickCheck($id('group1'), null, $id('addButton'))">
                    <h:param name='emps/empid' iterateId='id1' property='omEmployee/empid' indexed='true' />
                  </w:rowCheckbox>
                </td>
                <td>
                  <b:write iterateId="id1" property="omEmployee/empname"/>
                </td>                
                <td>
                  <b:write iterateId="id1" property="omEmployee/empcode"/>
                </td>                
                <td>
                  <b:write iterateId="id1" property="omEmployee/userid"/>
                </td>
              </tr>
            </l:iterate>
          </w:checkGroup>
          <tr>
            <td colspan="5" class="command_sort_area">
             <div style="float:left">
              <l:notEqual property="page/count" targetValue="0" scope="flow">
                  <input type="button" class="button" value='<b:message key="l_add"/>' onclick="addEmpPosition();" id="addButton" disabled="true">    
              </l:notEqual>
              <l:equal property="page/count" targetValue="0" scope="flow">
                  <input type="button" class="button" value='<b:message key="l_add"/>' onclick="addEmpPosition();" disabled="disabled">    
              </l:equal>
              <input type="button" class="button" value='<b:message key="l_close"/>' onclick="javascript:window.close();">
              </div>
          <div style="float:right">
                <l:equal property="page/isCount" targetValue="true" scope="flow">
                  <b:message key="l_total"></b:message>
                  <b:write property="page/count" scope="flow"/>
                   <b:message key="l_recordNO."></b:message>
                  <b:write property="page/currentPage" scope="flow"/>
                  <b:message key="l_page"></b:message>/
                  <b:write property="page/totalPage" scope="flow"/>
                  <b:message key="l_page"></b:message>
                </l:equal>
                <l:equal property="page/isCount" targetValue="false" scope="flow">
                  <b:message key="l_NO."></b:message>
                  <b:write property="page/currentPage" scope="flow"/>
                  <b:message key="l_page"></b:message>
                </l:equal>
                <input type="button" class="button" onclick="firstPage('page', 'pageQuery', null, null, 'page_form');" value='<b:message key="l_firstPage"></b:message>'  <l:equal property="page/isFirst"  targetValue="true" scope="flow">disabled</l:equal> >
                <input type="button" class="button" onclick="prevPage('page', 'pageQuery', null, null, 'page_form');" value='<b:message key="l_upPage"></b:message>' <l:equal property="page/isFirst"  targetValue="true" scope="flow">disabled</l:equal> >
                <input type="button" class="button" onclick="nextPage('page', 'pageQuery', null, null, 'page_form');" value='<b:message key="l_nextPage"></b:message>' <l:equal property="page/isLast" targetValue="true" scope="flow">disabled</l:equal> >
                <l:equal property="page/isCount" targetValue="true" scope="flow">
                  <input type="button" class="button" onclick="lastPage('page', 'pageQuery', null, null, 'page_form');" value='<b:message key="l_lastPage"></b:message>' <l:equal property="page/isLast"  targetValue="true" scope="flow">disabled</l:equal> >
                </l:equal>
              </div>
            </td>
          </tr>
        </table>
    </h:form>
    
  </body>
</html>