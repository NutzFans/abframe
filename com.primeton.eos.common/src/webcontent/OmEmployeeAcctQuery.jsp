<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/common.jsp"%>
<h:css href="/css/style1/style-custom.css"/>
<%@include file="/common/skins/skin0/component.jsp" %>
<%--
- Author(s): huangqj
- Date: 2014-01-23 13:42:28
- Description:
--%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
      OmEmployeeAcct维护
    </title>
  </head>
  <body>
    <e:datasource name="criteria" type="entity" path="com.primeton.das.criteria.criteriaType" />
    <e:datasource name="page" type="entity" path="com.eos.foundation.PageCond" />
    <e:datasource name="omemployeeaccts" type="entity" path="com.bos.mp.common.performance.OmEmployeeAcct" />
    <queryform id= "0aebd685-4125-46b7-9a53-739b00bce120">
      <h:form  name="query_form" action="com.primeton.eos.common.OmEmployeeAcctMaintain.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
        <input type="hidden" name="_eosFlowAction" value="pageQuery"/>
        <h:hidden property="criteria/_expr[1]/_property"/>
        <h:hidden property="criteria/_expr[1]/_value"/>
        <w:panel id="panel1" width="100%" title="员工银行帐号查询">
          <table align="center" border="0" width="100%" class="form_table">
            <tr>
              <td class="form_label">
                银行名称
              </td>
              <td colspan="1">
                <h:text property="criteria/_expr[2]/bankname"/>
                <h:hidden property="criteria/_expr[2]/_op" value="like"/>
                <h:hidden property="criteria/_expr[2]/_likeRule" value="all"/>
              </td>
              <td class="form_label">
                银行帐号
              </td>
              <td colspan="1">
                <h:text property="criteria/_expr[3]/bankacct"/>
                <h:hidden property="criteria/_expr[3]/_op" value="like"/>
                <h:hidden property="criteria/_expr[3]/_likeRule" value="all"/>
              </td>
              <td class="form_label">
                单位名称
              </td>
              <td colspan="1">
                <h:text property="criteria/_expr[4]/username"/>
                <h:hidden property="criteria/_expr[4]/_op" value="like"/>
                <h:hidden property="criteria/_expr[4]/_likeRule" value="all"/>
              </td>
            </tr>
            <tr class="form_bottom">
              <td colspan="6" class="form_bottom">
                <input type="hidden" name="criteria/_entity" value="com.bos.mp.common.performance.OmEmployeeAcct">
                每页显示
                <h:text size="2" property="page/length" value="10" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
                <input type="hidden" name="page/begin" value="0">
                <input type="hidden" name="page/isCount" value="true">
                <input type="submit" value="查询" class="button">
              </td>
            </tr>
          </table>
        </w:panel>
        <h:hidden property="criteria/_orderby[1]/_sort" value="asc"/>
        <h:hidden property="criteria/_orderby[1]/_property" value="bankacct"/>
      </h:form>
    </queryform>
    <br/>
    <viewlist id= "2a156395-4c96-4115-8840-8f3af2380484">
      <h:form name="page_form" action="com.primeton.eos.common.OmEmployeeAcctMaintain.flow" method="post">
        <input type="hidden" name="_eosFlowAction" value="pageQuery" >
        <h:hiddendata property="criteria" />
        <h:hidden property="page/begin"/>
        <h:hidden property="page/length"/>
        <h:hidden property="page/count"/>
        <h:hidden property="page/isCount"/>
        <w:panel id="list_panel" width="100%" title="员工银行帐号列表">
          <table align="center" border="0" width="100%" class="EOS_table">
            <tr>
              <th align="center">
                选择
              </th>
			  <th>
                单位名称
              </th>
              <th>
                银行名称
              </th>
              <th>
                银行帐号
              </th>
            </tr>
            <w:radioGroup id="group1">
              <l:iterate property="omemployeeaccts" id="id1">
                <tr class="<l:output evenOutput='EOS_table_row' />">
                  <td align="center">
                    <w:rowRadio>
                      <h:param name='select_objs/empid' iterateId='id1' property='empid' indexed='true' />
                      <h:param name='select_objs/bankacct' iterateId='id1' property='bankacct' indexed='true' />
                      <h:param name='select_objs/bankname' iterateId='id1' property='bankname' indexed='true' />
                      <h:param name='select_objs/username' iterateId='id1' property='username' indexed='true' />
                    </w:rowRadio>
                  </td>
                   <td>
                    <b:write iterateId="id1" property="username"/>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="bankname"/>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="bankacct"/>
                  </td>
                </tr>
              </l:iterate>
            </w:radioGroup>
            <tr>
              <td colspan="4" class="command_sort_area">
                <span style="float:left">
                  <l:greaterThan property="page/size" targetValue="0" compareType="number">
                    <input type="button" value="选择" onclick="updateRecord();" class="button">
                  </l:greaterThan>
                  <input type="button" value="增加" onclick="addRecord();" class="button">
                  <l:greaterThan property="page/size" targetValue="0" compareType="number">
                    <input type="button" value="修改" onclick="updateRecord1();" class="button">
                    <input type="button" value="删除" onclick="deleteRecord();" class="button">
                  </l:greaterThan>
                </span>
                <span style="float:right">
                  <l:equal property="page/isCount" targetValue="true">
                    共
                    <b:write property="page/count"/>
                    条记录 第
                    <b:write property="page/currentPage"/>
                    页/
                    <b:write property="page/totalPage"/>
                    页
                  </l:equal>
                  <l:equal property="page/isCount" targetValue="false">
                    第
                    <b:write property="page/currentPage"/>
                    页
                  </l:equal>
                  <input type="button" onclick="firstPage('page', 'pageQuery', null, null, 'page_form');" value="首页"  <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
                  <input type="button" onclick="prevPage('page', 'pageQuery', null, null, 'page_form');" value="上页" <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
                  <input type="button" onclick="nextPage('page', 'pageQuery', null, null, 'page_form');" value="下页" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
                  <l:equal property="page/isCount" targetValue="true">
                    <input type="button" onclick="lastPage('page', 'pageQuery', null, null, 'page_form');" value="尾页" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
                  </l:equal>
                </span>
              </td>
            </tr>
          </table>
        </w:panel>
      </h:form>
    </viewlist>
    <script>
      function updateRecord()
      {
        var g = $id("group1");
        var frm = $name("page_form");
        if (g.getSelectLength() != 1) {
          alert("请选择一行记录！");
          return;
        }
        var ret = new Array;
        ret[0] = g.getParam("select_objs/bankacct");
        ret[1] = g.getParam("select_objs/bankname");
        ret[2] = g.getParam("select_objs/username");
        window.returnValue = ret;
        window.close();
      }
      function updateRecord1()
      {
        var g = $id("group1");
        var frm = $name("page_form");
        if (g.getSelectLength() != 1) {
          alert("请选择一行记录！");
          return;
        }
        frm.elements["_eosFlowAction"].value = "update";
        frm.submit();
      }
      function addRecord()
      {
        var frm = $name("page_form");
        frm.elements["_eosFlowAction"].value = "insert";
        frm.submit();
      }
      function deleteRecord()
      {
        var g = $id("group1");
        var frm = $name("page_form");
        if (g.getSelectLength() < 1) {
          alert("请选择记录！");
          return;
        }
        frm.elements["_eosFlowAction"].value = "delete";
        frm.submit();
      }
    </script>
  </body>
</html>
