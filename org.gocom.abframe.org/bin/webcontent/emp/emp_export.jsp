<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_empQry");
	String pleaseSelect=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
	String selectOrg=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_selectOrg");
	String empQryRes=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_empQryRes");
	String oprInfo=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_oprInfo");	
	
%>
<html>
<!-- 
  - Author(s): EPCNB324
  - Date: 2016-03-25 14:30:19
  - Description:
-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Title</title>
</head>
<body topmargin="0" leftmargin="0">
<queryform id="888ba1a8-6556-432e-8807-be9715d36335">
<h:form name="form1" action="org.gocom.abframe.org.employee.EmpCondExport.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
  <input type="hidden" name="_eosFlowAction" value="qryagain"/>
<w:panel id="panel1" width="100%" title="<%=title %>"> 
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
        <td class="form_label" width="10%">
          <!--人员姓名-->
          <b:message key="empOrgMaintain_oEmp.empname"/><b:message key="l_colon"/>
        </td>
        <td colspan="1" width="10%">
          <h:text property="ctOrgEmpQry/_expr[1]/empname" validateAttr="maxLength=50" size="6"/>
          <h:hidden property="ctOrgEmpQry/_expr[1]/_op" value="like"/>
          <h:hidden property="ctOrgEmpQry/_expr[1]/_likeRule" value="all"/>
        </td>
        <td class="form_label" width="10%">登录名<b:message key="l_colon"/></td>
        <td colspan="1" width="10%">
          <h:text property="ctOrgEmpQry/_expr[2]/userid" validateAttr="maxLength=30" size="6"/>
          <h:hidden property="ctOrgEmpQry/_expr[2]/_op" value="="/>
        </td>
        <td class="form_label" width="10%">工号<b:message key="l_colon"/></td>
        <td colspan="1" width="10%">
          <h:text property="ctOrgEmpQry/_expr[3]/empcode" validateAttr="maxLength=30" size="6"/>
          <h:hidden property="ctOrgEmpQry/_expr[3]/_op" value="="/>
        </td>
        <td class="form_label" width="10%">人员状态</td>
        <td colspan="1" width="10%">
          <d:select property="ctOrgEmpQry/_expr[4]/empstatus" dictTypeId="ABF_EMPSTATUS" nullLabel="全部" value="on"/>
          <h:hidden property="ctOrgEmpQry/_expr[4]/_op" value="="/>
        </td>
        <td class="form_label" width="10%">人员类型</td>
        <td colspan="1" width="10%">
          <d:select property="ctOrgEmpQry/_expr[5]/emptype" dictTypeId="AME_EMPTYPE2" nullLabel="全部"/>
          <h:hidden property="ctOrgEmpQry/_expr[5]/_op" value="="/>
        </td>
      </tr>
      <tr class="form_bottom">
        <td colspan="10" class="form_bottom">
          <%--<input type="hidden" name="ctOrgEmpQry/_entity" value="org.gocom.abframe.dataset.organization.OmOrgPosiEmp">--%>
          <b:message key = 'l_pageDisplay'/>
          <h:text size="2" property="page/length" value="20" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
          <input type="hidden" name="page/begin">
          <input type="hidden" name="page/isCount" value="true">
          <%--<input type="submit" value="查询">--%>
          <input type="button" class="button" value="查询" onclick="doQuery();"/>
         <%-- <input type="reset"  value="<b:message key = 'l_reset'/>">--%>
          <input type="button" class="button" value="导出" onclick="exportDict();"/>
        </td>
      </tr>
    </table>
  </w:panel>
  </h:form>
</queryform>
<h:form name="viewlist1" action="org.gocom.abframe.org.employee.EmpCondExport.flow" checkType="blur" target="_self" method="post">
  <input type="hidden" name="_eosFlowAction" value="qryagain" >
    <h:hiddendata property="ctOrgEmpQry" />
    <h:hidden property="page/begin"/>
    <h:hidden property="page/length" />
    <h:hidden property="page/count"/>
    <h:hidden property="page/isCount"/>
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
        <th align="center">工号</th>
        <th align="center">登录名</th>
        <th>
          人员姓名
        </th>
        <th>
          办公邮件
        </th>
        <th>类型</th>
        <th>
          人员级别
        </th>
        <th>
          性别
        </th>
        <th>
          一级部门
        </th>        
        <th>  
		 二级部门          
        </th>
        <th>  
		 三级部门          
        </th>
        <th>  
		  四级部门          
        </th>
        <th>  
		  五级部门          
        </th>
      </tr>
      <w:checkGroup id="group1">
        <l:iterate property="oaOrgEmpQry" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />" title='<b:message key="org_locate"/>'>
            <td align="left" >
              <b:write iterateId="id1" property="empcode"/>
            </td>
            <td align="left" >
              <b:write iterateId="id1" property="userid"/>
            </td>
            <td>
              <b:write iterateId="id1" property="empname"/>
            </td>
            <td>
              <b:write iterateId="id1" property="oemail"/>
            </td>
            <td>
              <d:write iterateId="id1" dictTypeId="AME_EMPTYPE2" property="emptype"/>
            </td>
            <td>
              <d:write iterateId="id1" dictTypeId="ABF_EMPLEVEL" property="degree"/>
            </td>
            <td>
              <d:write dictTypeId="ABF_GENDER" iterateId="id1" property="gender"/>
            </td>
            <td>
              <b:write iterateId="id1" property="yjbm"/>
            </td>
            <td>
              <b:write iterateId="id1" property="ejbm"/>
            </td>
            <td>
              <b:write iterateId="id1" property="sjbm"/>
            </td>
            <td>
              <b:write iterateId="id1" property="sijbm"/>
            </td>
            <td>
              <b:write iterateId="id1" property="wjbm"/>
            </td>
          </tr>
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="11" class="command_sort_area">       
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
            <input type="button" class="button" style='margin-top:4' onclick="firstPage('page', 'qryagain', null, null, 'viewlist1');" value="<b:message key = 'l_firstPage'/>" <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
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
    function exportDict(){
    	form1.action = "org.gocom.abframe.org.employee.EmpCondExport.flow";
    	$name("_eosFlowAction").value = "dictExport";
    	form1.submit();
    }
    function doQuery(){
		form1.action = "org.gocom.abframe.org.employee.EmpCondExport.flow";
    	$name("_eosFlowAction").value = "qryagain";
    	form1.submit();
	}
</script>
</html>