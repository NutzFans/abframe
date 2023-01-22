<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_empQry");
	String pleaseSelect=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
	String selectOrg=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_selectOrg");	
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Title</title>
</head>
<body topmargin="0" leftmargin="0">
<h:form name="form1" action="org.gocom.abframe.org.employee.EmpCondQuery.flow" checkType="blur" target="result" method="post" onsubmit="return checkForm(this);;">
  <input type="hidden" name="_eosFlowAction" value="qry"/>
  <%-- 
  <h:hidden name="ctOrgEmpQry/_expr[10]/orgseq" property="sOrgseq" />
  <h:hidden property="ctOrgEmpQry/_expr[10]/_op" value="like"/>
  <h:hidden property="ctOrgEmpQry/_expr[10]/_likeRule" value="end"/>
   --%>  
  <w:panel id="panel1" width="100%" title="<%=title %>"> 
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
        <td class="form_label" width="10%">人员姓名</td>
        <td colspan="1" width="10%">
          <h:text property="ctOrgEmpQry/_expr[1]/empname" id="empname" validateAttr="maxLength=50" size="8"/>
          <h:hidden property="ctOrgEmpQry/_expr[1]/_op" value="like"/>
          <h:hidden property="ctOrgEmpQry/_expr[1]/_likeRule" value="all"/>
        </td>
        <td class="form_label" width="10%">员工工号</td>
        <td colspan="1" width="10%">
          <h:text property="ctOrgEmpQry/_expr[2]/empcode" id="empcode" validateAttr="maxLength=30" size="8"/>
          <h:hidden property="ctOrgEmpQry/_expr[2]/_op" value="like"/>
          <h:hidden property="ctOrgEmpQry/_expr[2]/_likeRule" value="all"/>
        </td> 
        <td class="form_label" width="10%">登录名</td>
        <td colspan="1" width="10%">
          <h:text property="ctOrgEmpQry/_expr[3]/userid" id="userid" validateAttr="maxLength=30" size="8"/>
          <h:hidden property="ctOrgEmpQry/_expr[3]/_op" value="like"/>
          <h:hidden property="ctOrgEmpQry/_expr[3]/_likeRule" value="all"/>
        </td> 
        <td class="form_label" width="10%">出生日期</td>
        <td colspan="1" width="30%">
          <w:date property="ctOrgEmpQry/_expr[4]/_min" size="8"/>-<w:date property="ctOrgEmpQry/_expr[4]/_max" size="8"/>
          <h:hidden property="ctOrgEmpQry/_expr[4]/_property" value="birthdate"/>
          <h:hidden property="ctOrgEmpQry/_expr[4]/_op" value="between"/>
        </td>    
      </tr>
      <tr>
        <td class="form_label">员工状态</td>
        <td colspan="1">
          <d:select property="ctOrgEmpQry/_expr[5]/empstatus" dictTypeId="ABF_EMPSTATUS" nullLabel="全部" value="on"/>
          <h:hidden property="ctOrgEmpQry/_expr[5]/_op" value="="/>
        </td>
        <td class="form_label" width="10%"><b:message key="empOrgMaintain_oEmp.oemail"/></td>
        <td colspan="3" width="20%">
          <h:text property="ctOrgEmpQry/_expr[6]/oemail" id="oemail" size="20"/>
          <h:hidden property="ctOrgEmpQry/_expr[6]/_op" value="like"/>
          <h:hidden property="ctOrgEmpQry/_expr[6]/_likeRule" value="all"/>
        </td>
        <td class="form_label">入职日期</td>
        <td colspan="3">
          <w:date property="ctOrgEmpQry/_expr[7]/_min" size="8"/>-<w:date property="ctOrgEmpQry/_expr[7]/_max" size="8"/>
          <h:hidden property="ctOrgEmpQry/_expr[7]/_property" value="indate"/>
          <h:hidden property="ctOrgEmpQry/_expr[7]/_op" value="between"/>
        </td>  
      </tr>
      <tr>
        <td class="form_label">员工类型</td>
        <td colspan="1">
          <d:select property="ctOrgEmpQry/_expr[8]/degree" dictTypeId="AME_EMPTYPE2" nullLabel="全部"/>
          <h:hidden property="ctOrgEmpQry/_expr[8]/_op" value="="/>
        </td>
        <td class="form_label">
          <!--所属机构-->
          <b:message key="empOrgMaintain_oEmp.inorgid"/>          
        </td>
        <td colspan="3">
          <h:hidden property="ctOrgEmpQry/_expr[9]/_op" value="like"/>
           <h:hidden property="ctOrgEmpQry/_expr[9]/_likeRule" value="end"/>
              <w:lookup property="ctOrgEmpQry/_expr[9]/orgseq" id="orgseq" validateAttr="allowNull=true;message=所属机构可以为空" readonly="true" lookupUrl="/abframe/org/organization/org_tree_select1.jsp" dialogTitle="<%=selectOrg %>" width="350" height="430" size="15"></w:lookup>
        </td>
        <td class="form_label">离职日期</td>
        <td colspan="3">
          <w:date property="ctOrgEmpQry/_expr[10]/_min" size="8"/>-<w:date property="ctOrgEmpQry/_expr[10]/_max" size="8"/>
          <h:hidden property="ctOrgEmpQry/_expr[10]/_property" value="outdate"/>
          <h:hidden property="ctOrgEmpQry/_expr[10]/_op" value="between"/>
        </td>
      </tr>
      <tr class="form_bottom">
        <td colspan="10" class="form_bottom">
          <input type="hidden" name="ctOrgEmpQry/_entity" value="org.gocom.abframe.dataset.organization.OmOrgPosiEmp">
          <b:message key = 'l_pageDisplay'/>
          <h:text size="2" property="page/length" value="12" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
          <input type="hidden" name="page/begin" value="0">
          <input type="hidden" name="page/isCount" value="true">
          <input type="submit" class="button" value="<b:message key = 'l_query'/>">
          <input type="reset" class="button"  value="<b:message key = 'l_reset'/>">
          <input  class="button" type="button" value="导入人员信息" style="width: 75px;" onclick="importPerson()">
        </td>
      </tr>
    </table>
  </w:panel>
  <h:hidden property="ctOrgEmpQry/_orderby[1]/_sort" value="asc"/>
  <h:hidden property="ctOrgEmpQry/_orderby[1]/_property" value="empid"/>
</h:form>

<iframe name="result" height="70%" width="100%" frameborder="0" scrolling="no"></iframe>
</body>
</html>
<script>
	function checkForm(){
		var frm = $name("form1");
		frm.submit();
	}
    function lookupRetFun( arg ) {
        return true;
    }
    function importPerson() {
    
    	var url = "<%=request.getContextPath() %>/abframe/org/emp/importPerson.jsp";
    	
        showModalCenter(url, "", nodeMoveCallBack, 700, 170, '导入人员信息');
    }
    
    function nodeMoveCallBack(data){
    	
    }
</script> 
