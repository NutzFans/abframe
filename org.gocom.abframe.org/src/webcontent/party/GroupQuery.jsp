<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common.jsp"%>
<%--
- Author(s): 肖菁
- Date: 2009-01-13 15:00:27
- Description:
--%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
      工作组查询
    </title>
  </head>
  <body leftmargin="0" topmargin="0">
    <e:datasource name="criteria" type="entity" path="com.primeton.das.criteria.criteriaType" />
    <e:datasource name="page" type="entity" path="com.eos.foundation.PageCond" />
    <e:datasource name="omgroups" type="entity" path="org.gocom.abframe.dataset.organization.OmGroup" />
   <queryform id="07742845-780d-4774-875c-51359801f278">
  <h:form  name="form1" action="org.gocom.abframe.org.party.GroupQuery.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
  	<h:hidden name="_eosFlowAction" value="pageQuery"/>
    <w:panel id="panel1" width="100%" title="工作组查询条件">
      <table align="center" border="0" width="100%" class="form_table">
        <tr>
          <td class="form_label">
            工作组名
          </td>
          <td colspan="1">
            <h:text property="criteria/_expr[2]/groupname"/>
            <h:hidden property="criteria/_expr[2]/_op" value="like"/>
            <h:hidden property="criteria/_expr[2]/_likeRule" value="all"/>
          </td>
        </tr>
        <tr class="form_bottom">
          <td colspan="4" class="form_bottom">
            <input type="hidden" name="criteria/_entity" value="org.gocom.abframe.dataset.organization.OmGroup">
            每页显示
            <h:text size="2" property="page/length" value="10" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
            <input type="hidden" name="page/begin" value="0">
            <input type="hidden" name="page/isCount" value="true">
            <input type="submit" class="button" value="查询" class="button">
          </td>
        </tr>
      </table>
    </w:panel>
    <h:hidden property="criteria/_orderby[1]/_sort" value="asc"/>
    <h:hidden property="criteria/_orderby[1]/_property" value="groupname"/>
  </h:form>
</queryform>
 
    <br/>
    <viewlist id= "80feac2c-5c6d-45e4-8a45-34a99553cf46">
      <h:form name="page_form" action="org.gocom.abframe.org.party.GroupQuery.flow" method="post">
        <input type="hidden" name="_eosFlowAction" value="pageQuery" >
        <h:hiddendata property="criteria" />
        <h:hidden property="page/begin"/>
        <h:hidden property="page/length"/>
        <h:hidden property="page/count"/>
        <h:hidden property="page/isCount"/>
        <w:panel id="list_panel" width="100%" title="工作组查询结果">
          <table align="center" border="0" width="100%" class="EOS_table">
            <tr>
              <th align="center">
                选择
              </th>
              <th>
                工作组代码
              </th>
              <th>
                工作组名
              </th>
            </tr>
            <w:checkGroup id="group1">
              <l:iterate property="omgroups" id="id1">
                <tr class="<l:output evenOutput='EOS_table_row' />">
                  <td align="center">
                    <w:rowCheckbox onSelectFunc="insertSelected">
                      <h:param name='select_objs/groupid' iterateId='id1' property='groupid' indexed='true' />
                      <h:param name="groupid" iterateId='id1' property='groupid'  />
                      <h:param name="groupcode" iterateId='id1' property='groupid'  />
                      <h:param name="groupname" iterateId='id1' property='groupname'  />
                    </w:rowCheckbox>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="groupid"/>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="groupname"/>
                  </td>
                </tr>
              </l:iterate>
            </w:checkGroup>
            <tr>
              <td colspan="5" class="command_sort_area">
                <div style="float:left">
                <l:greaterThan property="page/size" targetValue="0" compareType="number">
                  <input type="button" class="button" value="确定" onclick="javascript: parent.closeWindow1();" class="button">
                </l:greaterThan>
                </div>
          <div style="float:right">
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
                  <input type="button" class="button" onclick="firstPage('page', 'pageQuery', null, null, 'page_form');" value="首页"  <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
                  <input type="button" class="button" onclick="prevPage('page', 'pageQuery', null, null, 'page_form');" value="上页" <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
                  <input type="button" class="button" onclick="nextPage('page', 'pageQuery', null, null, 'page_form');" value="下页" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
                  <l:equal property="page/isCount" targetValue="true">
                    <input type="button" class="button" onclick="lastPage('page', 'pageQuery', null, null, 'page_form');" value="尾页" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
                  </l:equal>
                </div>
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
      
      function insertSelected(row){
      	var arrTmp = new Array();
      	arrTmp[0] = row.getParam("groupid");
      	arrTmp[1] = row.getParam("groupcode");
      	arrTmp[2] = row.getParam("groupname");
      	
      	parent.insertEntity(arrTmp);
      }
    </script>
  </body>
</html>
