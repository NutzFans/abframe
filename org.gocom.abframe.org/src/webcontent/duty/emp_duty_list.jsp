<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
    //职务查询条件
	String duty_query_cond = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_title_dutyEmp")
	                       + com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_query_cond");
	//职务查询结果
	String duty_list_result = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_title_dutyEmp")
                           + com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_query_result");
 %>

<script language="javascript">
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
<body topmargin="0" leftmargin="0">
    <e:datasource name="criteria" type="entity" path="com.primeton.das.criteria.criteraiType" />
    <h:form name="query_form" action="org.gocom.abframe.org.duty.DutyEmp.flow" method="post">
       <input type="hidden" name="_eosFlowAction" value="query"/>
       <h:hidden property="parentDutyID" scope="flow"/>
       <h:hidden name="criteria/_entity" value="org.gocom.abframe.dataset.organization.OmEmpposition"/>
       <h:hidden name="criteria/_expr[1]/omPosition.positionid" value=""/>
       <h:hidden name="criteria/_expr[1]/_op" value="in"/>
       <h:hidden name="criteria/_expr[1]/_ref" value="1"/>
       <h:hidden name="criteria/_ref[1]/_entity" value="org.gocom.abframe.dataset.organization.OmPosition"/>
       <h:hidden name="criteria/_ref[1]/_id" value="1"/>
       <h:hidden name="criteria/_ref[1]/_select/_field" value="positionid"/>
       <h:hidden name="criteria/_ref[1]/_expr[1]/omDuty.dutyid" property="duty/dutyid"/>
       <h:hidden property="duty/dutyid"/>
      
      <w:panel id="panel1" width="100%" title="<%=duty_query_cond %>">
        <table align="center" border="0" width="100%" class="form_table">
          <tr>
            <td class="form_label">     <!--  登陆名 -->
              <b:message key="positionEmp_omEmployee.userid"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td >
                <input type="text" name="criteria/_ref[2]/_expr[1]/userid"/>
                
                <h:hidden property="criteria/_expr[2]/_ref" value="2"/>
                <h:hidden property="criteria/_expr[2]/_op" value="in"/>
                <h:hidden property="criteria/_expr[2]/omEmployee.empid"/>
                               
                <h:hidden property="criteria/_ref[2]/_expr[1]/_op" value="like"/>
                <h:hidden property="criteria/_ref[2]/_expr[1]/_likeRule" value="all"/>
                <h:hidden property="criteria/_ref[2]/_id" value="2"/>
                <h:hidden property="criteria/_ref[2]/_entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>          
            </td>
            <td class="form_label">     <!-- 操作员姓名 -->
              <b:message key="positionEmp_omEmployee.empname"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td >
                <input type="text" name="criteria/_ref[2]/_expr[2]/empname"/>
                <h:hidden property="criteria/_ref[2]/_expr[2]/_op" value="like"/>
                <h:hidden property="criteria/_ref[2]/_expr[2]/_likeRule" value="all"/>
                
                 
            </td>
          </tr>
          <tr class="form_bottom">
            <td colspan="6" class="form_bottom">
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
    </h:form>
       
    <h:form name="form1" action="org.gocom.abframe.org.duty.DutyEmp.flow" method="post">
         <input type="hidden" name="_eosFlowAction" value="query"/>
         <table align="center" border="0" width="100%" class="EOS_table">
               
         <h:hidden property="parentPosID" name="parentPosID" scope="flow"/>
         
         <!-- 隐藏分页信息 -->
         <h:hidden property="page/length"/>
         <h:hidden property="page/begin"/>
         <h:hidden property="page/isCount"/>
         <h:hidden property="page/count"/>
         
         <!-- 隐藏匿查询信息 -->
         <h:hidden name="criteria/_entity" value="org.gocom.abframe.dataset.organization.OmEmpposition"/>
	     <h:hidden name="criteria/_expr[1]/omPosition.positionid" value=""/>
	     <h:hidden name="criteria/_expr[1]/_op" value="in"/>
	     <h:hidden name="criteria/_expr[1]/_ref" value="1"/>
	     <h:hidden name="criteria/_ref[1]/_entity" value="org.gocom.abframe.dataset.organization.OmPosition"/>
	     <h:hidden name="criteria/_ref[1]/_id" value="1"/>
	     <h:hidden name="criteria/_ref[1]/_select/_field" value="positionid"/>
	     <h:hidden name="criteria/_ref[1]/_expr[1]/omDuty.dutyid" property="duty/dutyid"/>
	     <h:hidden property="duty/dutyid"/>

         <h:hidden property="criteria/_expr[2]/_ref" value="2"/>
         <h:hidden property="criteria/_expr[2]/_op" value="in"/>
         <h:hidden property="criteria/_expr[2]/omEmployee.empid"/>
                       
         <h:hidden property="criteria/_ref[2]/_expr[1]/_op" value="like"/>
         <h:hidden property="criteria/_ref[2]/_expr[1]/_likeRule" value="all"/>
         <h:hidden property="criteria/_ref[2]/_id" value="2"/>
         <h:hidden property="criteria/_ref[2]/_entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>    
         
         <h:hidden property="criteria/_ref[2]/_expr[2]/_op" value="like"/>
         <h:hidden property="criteria/_ref[2]/_expr[2]/_likeRule" value="all"/>
         <h:hidden property="criteria/_ref[2]/_expr[1]/userid" />
         <h:hidden property="criteria/_ref[2]/_expr[2]/empname" />
         <tr>
	       <td colspan="4" class="eos-panel-title">&nbsp;<%=duty_list_result %></td>
	     </tr>
         <tr>
            <th align="center">
            <l:greaterThan property="page/size" targetValue="0" compareType="number">
              <input type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll();"> 
            </l:greaterThan>
              <b:message key="l_select"></b:message>
            </th>
            <th align="center">   <!-- 登陆名 -->
              <b:message key="positionEmp_omEmployee.userid"></b:message>
            </th>
            <th>                  <!-- 操作员姓名 -->
              <b:message key="positionEmp_omEmployee.empname"></b:message>
            </th>
            <th>                  <!-- 所属机构 -->
              <b:message key="positionManager_OmPosition.omOrganization.orgid(orgname)"></b:message>
            </th>
          </tr>
          <w:checkGroup id="group1">
          <l:iterate property="dutyEmpList" id="id1">
              <tr class="<l:output evenOutput='EOS_table_row' />">
                <td align="center">
                    <w:rowCheckbox>
                        <h:param name='select_objs/empid' iterateId='id1' property='omEmployee/empid' indexed='true' />
                    </w:rowCheckbox>
                </td>
                <td>
                  <b:write iterateId="id1" property="omEmployee/userid"/>
                </td>
                <td>
                  <b:write iterateId="id1" property="omEmployee/empname"/>
                </td>
                <td>
                  <b:write iterateId="id1" property="omOrganization/orgname"/>
                </td>
                 
                </tr>
            </l:iterate>
            </w:checkGroup>
            <tr>
              <td colspan="5" class="command_sort_area" >
                <br>                
          <div style="float:right">
                <l:equal property="page/isCount" targetValue="true" >
                  <b:message key="l_total"></b:message>
                  <b:write property="page/count" />
                  <b:message key="l_recordNO."></b:message>
                  <b:write property="page/currentPage" />
                  <b:message key="l_page"></b:message>/
                  <b:write property="page/totalPage" />
                  <b:message key="l_page"></b:message>
                </l:equal>
                <l:equal property="page/isCount" targetValue="false" >
                  <b:message key="l_NO."></b:message>
                  <b:write property="page/currentPage" />
                  <b:message key="l_page"></b:message>
                </l:equal>
                <input type="button" class="button" style="margin-top: 4" onclick="firstPage('page', 'query', null, null, 'form1');" value='<b:message key="l_firstPage"></b:message>'  <l:equal property="page/isFirst"  targetValue="true">disabled</l:equal> >
                <input type="button" class="button" onclick="prevPage('page', 'query', null, null, 'form1');" value='<b:message key="l_upPage"></b:message>' <l:equal property="page/isFirst"  targetValue="true">disabled</l:equal> >
                <input type="button" class="button" onclick="nextPage('page', 'query', null, null, 'form1');" value='<b:message key="l_nextPage"></b:message>' <l:equal property="page/isLast"  targetValue="true">disabled</l:equal> >
                <l:equal property="page/isCount" targetValue="true">
                  <input type="button" class="button" onclick="lastPage('page', 'query', null, null, 'form1');" value='<b:message key="l_lastPage"></b:message>' <l:equal property="page/isLast"  targetValue="true">disabled</l:equal> >
                </l:equal>
              </div>
              </td>
            </tr>
            </table>
       </h:form>  
      
</body>
</html>