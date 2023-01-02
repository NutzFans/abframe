<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<h:css href="/css/style1/style-custom.css"/>
<%--
- Author(s): huangqj
- Date: 2014-01-23 13:42:32
- Description:
--%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
      OmEmployeeAcct录入
    </title>
  </head>
  <body>
    <e:datasource name="omemployeeacct" type="entity" path="com.bos.mp.common.performance.OmEmployeeAcct" />
    <h:form name="data_form" action="com.primeton.eos.common.OmEmployeeAcctMaintain.flow" method="post" onsubmit="return checkForm(this);">
      <l:equal property="_eosLastAccessAction" targetValue="update">
        <input type="hidden" name="_eosFlowAction" value="updateSubmit" >
      </l:equal>
      <l:equal property="_eosLastAccessAction" targetValue="insert">
        <input type="hidden" name="_eosFlowAction" value="insertSubmit" >
      </l:equal>
      <h:hiddendata property="criteria" />
      <h:hidden property="page/begin"/>
      <h:hidden property="page/length"/>
      <h:hidden property="page/isCount"/>
      <dataform id= "e1a3d576-b911-4a56-94d5-023d464073c2">
        <w:panel id="panel1" width="100%" title="员工银行帐号信息录入">
          <table align="center" border="0" width="100%" class="form_table">
            <h:hidden property="omemployeeacct/empid"/>
            <tr>
              <td class="form_label">
                银行名称
              </td>
              <td colspan="1">
                <h:text property="omemployeeacct/bankname"/>
              </td>
              <td class="form_label">
                银行帐号
              </td>
              <td colspan="1">
              	<l:equal property="_eosLastAccessAction" targetValue="update">
               	 <h:text property="omemployeeacct/bankacct" validateAttr="allowNull=false" readonly="true"/>
		      </l:equal>
		      <l:equal property="_eosLastAccessAction" targetValue="insert">
		      	<h:text property="omemployeeacct/bankacct" validateAttr="allowNull=false"/>
		      </l:equal>
              </td>
            </tr>
            <tr>
              <td class="form_label">
                单位名称
              </td>
              <td colspan="1">
                <h:text property="omemployeeacct/username"/>
              </td>
              
            </tr>
            <tr class="form_bottom">
              <td colspan="4">
                <input type="submit" value="保存" class="button">
                <input type="button" value="返回" onclick="javascript:history.go(-1);" class="button">
              </td>
            </tr>
          </table>
        </w:panel>
      </dataform>
    </h:form>
  </body>
</html>
