<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/common.jsp"%>
<h:css href="/css/style1/style-custom.css"/>
<%@include file="/common/skins/skin0/component.jsp" %>
<%--
- Author(s): huangqj
- Date: 2013-11-27 15:47:43
- Description:
--%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
      ErprptTDeptbudgetExpcond维护
    </title>
  </head>
  <body>
    <e:datasource name="criteria" type="entity" path="com.primeton.das.criteria.criteriaType" />
    <e:datasource name="page" type="entity" path="com.eos.foundation.PageCond" />
    <e:datasource name="erprpttdeptbudgetexpconds" type="entity" path="com.bos.mp.common.performance.ErprptTDeptbudgetExpcond" />
    <queryform id= "a3cba5f8-4fd0-48a6-a304-f0dcf26ce7ca">
      <h:form  name="query_form" action="com.primeton.eos.common.ErprptTDeptbudgetExpcondMaintain.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
        <input type="hidden" name="_eosFlowAction" value="pageQuery"/>
        <w:panel id="panel1" width="100%" title="部门买入卖出关系查询">
          <table align="center" border="0" width="100%" class="form_table">
            <tr>
              <td class="form_label">
                部门
              </td>
              <td colspan="3">
              	<h:select property="criteria/_expr[1]/orgid">
              		<h:options property="orgs" labelField="orgname" valueField="orgid"/>
              	</h:select>
                <h:hidden property="criteria/_expr[1]/_op" value="="/>
              </td>
            </tr>
            <tr class="form_bottom">
              <td colspan="4" class="form_bottom">
                <input type="hidden" name="criteria/_entity" value="com.bos.mp.common.performance.ErprptTDeptbudgetExpcond">
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
        <h:hidden property="criteria/_orderby[1]/_property" value="orgid"/>
      </h:form>
    </queryform>
    <br/>
    <viewlist id= "04e1eaaa-fe66-45b2-9002-56d6bd6b9392">
      <h:form name="page_form" action="com.primeton.eos.common.ErprptTDeptbudgetExpcondMaintain.flow" method="post">
        <input type="hidden" name="_eosFlowAction" value="pageQuery" >
        <h:hiddendata property="criteria" />
        <h:hidden property="page/begin"/>
        <h:hidden property="page/length"/>
        <h:hidden property="page/count"/>
        <h:hidden property="page/isCount"/>
        <w:panel id="list_panel" width="100%" title="部门买卖关系列表">
          <table align="center" border="0" width="100%" class="EOS_table">
            <tr>
              <th align="center">
                选择
              </th>
              <th>
                部门
              </th>
              <th>
                部门是否是叶子部门
              </th>
              <th>
                买入关系不属于事业部内部买卖
              </th>
              <th>
                卖出关系不属于事业部内部买卖
              </th>
            </tr>
            <w:checkGroup id="group1">
              <l:iterate property="erprpttdeptbudgetexpconds" id="id1">
                <tr class="<l:output evenOutput='EOS_table_row' />">
                  <td align="center">
                    <w:rowCheckbox>
                    	<h:param name='select_objs/pkid' iterateId='id1' property='pkid' indexed='true' />
                    </w:rowCheckbox>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="orgname"/>
                  </td>
                  <td>
                  	<l:equal iterateId="id1" property="orgisleaf" targetValue="0">否</l:equal>
                  	<l:equal iterateId="id1" property="orgisleaf" targetValue="1">是</l:equal>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="expinnerorgname"/>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="expoutorgname"/>
                  </td>
                </tr>
              </l:iterate>
            </w:checkGroup>
            <tr>
              <td colspan="5" class="command_sort_area">
                <span style="float:left">
                  <input type="button" value="增加" onclick="addRecord();" class="button">
                  <l:greaterThan property="page/size" targetValue="0" compareType="number">
                    <input type="button" value="修改" onclick="updateRecord();" class="button">
                  </l:greaterThan>
                  <l:greaterThan property="page/size" targetValue="0" compareType="number">
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
