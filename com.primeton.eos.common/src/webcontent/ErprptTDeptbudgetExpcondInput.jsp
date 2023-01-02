<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<h:css href="/css/style1/style-custom.css"/>
<%--
- Author(s): huangqj
- Date: 2013-11-27 15:47:43
- Description:
--%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
      ErprptTDeptbudgetExpcond录入
    </title>
  </head>
  <body>
    <e:datasource name="erprpttdeptbudgetexpcond" type="entity" path="com.bos.mp.common.performance.ErprptTDeptbudgetExpcond" />
    <h:form name="data_form" action="com.primeton.eos.common.ErprptTDeptbudgetExpcondMaintain.flow" method="post" onsubmit="return checkForm(this);">
      <l:equal property="_eosLastAccessAction" targetValue="update">
        <input type="hidden" name="_eosFlowAction" value="updateSubmit" >
        <h:hidden property="erprpttdeptbudgetexpcond/pkid" />
      </l:equal>
      <l:equal property="_eosLastAccessAction" targetValue="insert">
        <input type="hidden" name="_eosFlowAction" value="insertSubmit" >
      </l:equal>
      <h:hiddendata property="criteria" />
      <h:hidden property="page/begin"/>
      <h:hidden property="page/length"/>
      <h:hidden property="page/isCount"/>
      <dataform id= "5a6832ce-ff53-49c1-b093-dbd087d07945">
        <w:panel id="panel1" width="100%" title="部门买卖关系录入">
          <table align="center" border="0" width="100%" class="form_table">
            <tr>
              <td class="form_label">
                部门
              </td>
              <td colspan="1">
              	<h:select property="erprpttdeptbudgetexpcond/orgid">
              		<h:options property="orgs" labelField="orgname" valueField="orgid"/>
              	</h:select>
              </td>
              <td class="form_label">
                部门是否是叶子部门
              </td>
              <td>
                <h:select property="erprpttdeptbudgetexpcond/orgisleaf">
                	<h:option label="是" value="1"/>
                	<h:option label="否" value="0"/>
                </h:select>
              </td>
            </tr>
            <tr>
              <td class="form_label">
                买入关系不属于事业部内部买卖
              </td>
              <td colspan="1">
              	<h:select property="erprpttdeptbudgetexpcond/expinnerorgid">
              		<h:option value="" label="无"/>
              		<h:options property="orgs" labelField="orgname" valueField="orgid"/>
              	</h:select>
              </td>
              <td class="form_label">
                卖出关系不属于事业部内部买卖
              </td>
              <td colspan="1">
              	<h:select property="erprpttdeptbudgetexpcond/expoutorgid">
              		<h:option value="" label="无"/>
              		<h:options property="orgs" labelField="orgname" valueField="orgid"/>
              	</h:select>
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
