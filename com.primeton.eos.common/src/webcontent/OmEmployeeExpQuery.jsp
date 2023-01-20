<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/common.jsp"%>
<h:css href="/css/style1/style-custom.css"/>
<%@include file="/common/skins/skin0/component.jsp" %>
<%--
- Author(s): huangqj
- Date: 2015-06-09 15:51:08
- Description:
--%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
      OmEmployeeExp维护
    </title>
  </head>
  <body>
    <e:datasource name="criteria" type="entity" path="com.primeton.das.criteria.criteriaType" />
    <e:datasource name="page" type="entity" path="com.eos.foundation.PageCond" />
    <e:datasource name="omemployeeexps" type="entity" path="com.bos.mp.common.performance.OmEmployeeExp" />
    <queryform id= "423a0809-bdcb-43b7-b8e0-45215ee2ccc8">
      <h:form  name="query_form" action="com.primeton.eos.common.OmEmployeeExpMaintain.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
        <input type="hidden" name="_eosFlowAction" value="pageQuery"/>
        <w:panel id="panel1" width="100%" title="员工报销查询">
          <table align="center" border="0" width="100%" class="form_table">
            <tr>
              <td class="form_label">工号</td>
              <td colspan="1">
                <h:hidden property="criteria/_expr[1]/_property" value="empid"/>
                <h:hidden property="criteria/_expr[1]/_op" value="in"/>
                <h:hidden property="criteria/_expr[1]/_ref" value="1"/>
                <h:hidden property="criteria/_ref[1]/_id" value="1"/>
                <h:hidden property="criteria/_ref[1]/_entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
                <h:hidden property="criteria/_ref[1]/_select/_field[1]" value="empid"/>
                <h:hidden property="criteria/_ref[1]/_expr[1]/_property" value="userid"/>
                <h:text property="criteria/_ref[1]/_expr[1]/_value"/>
                <h:hidden property="criteria/_ref[1]/_expr[1]/_op" value="like"/>
                <h:hidden property="criteria/_ref[1]/_expr[1]/_likeRule" value="all"/>
              </td>
              <td class="form_label">姓名</td>
              <td colspan="1">
                <h:text property="criteria/_ref[1]/_expr[2]/_value"/>
                <h:hidden property="criteria/_ref[1]/_expr[2]/_property" value="empname"/>
                <h:hidden property="criteria/_ref[1]/_expr[2]/_op" value="like"/>
                <h:hidden property="criteria/_ref[1]/_expr[2]/_likeRule" value="all"/>
              </td>
            </tr>
            <tr class="form_bottom">
              <td colspan="4" class="form_bottom">
                <input type="hidden" name="criteria/_entity" value="com.bos.mp.common.performance.OmEmployeeExp">
                每页显示
                <h:text size="2" property="page/length" value="10" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
                <input type="hidden" name="page/begin" value="0">
                <input type="hidden" name="page/isCount" value="true">
                <input type="submit" value="查询" class="button">
                <input type="button" class="button" value="导出" onclick="exportDict();"/>
              </td>
            </tr>
          </table>
        </w:panel>
        <h:hidden property="criteria/_orderby[1]/_sort" value="asc"/>
        <h:hidden property="criteria/_orderby[1]/_property" value="empid"/>
      </h:form>
    </queryform>
    <br/>
    <viewlist id= "fa64d575-6f42-4904-807b-0294659a1652">
      <h:form name="page_form" action="com.primeton.eos.common.OmEmployeeExpMaintain.flow" method="post">
        <input type="hidden" name="_eosFlowAction" value="pageQuery" >
        <h:hiddendata property="criteria" />
        <h:hidden property="page/begin"/>
        <h:hidden property="page/length"/>
        <h:hidden property="page/count"/>
        <h:hidden property="page/isCount"/>
        <w:panel id="list_panel" width="100%" title="员工报销列表">
          <table align="center" border="0" width="100%" class="EOS_table">
            <tr>
              <th align="center">
                选择
              </th>
              <th>员工工号</th>
              <th>员工姓名</th>
              <th>员工所在部门</th>
              <th>工作地点</th>
              <th>自购机使用登记日期</th>
              <th>审批人</th>
              <th>是否有领取补贴权限</th>
              <th>补贴停止时间</th>
              <th>补贴到年</th>
              <th>补贴到月</th>
              <th>备注</th>
            </tr>
            <w:checkGroup id="group1">
              <l:iterate property="omemployeeexps" id="id1">
                <tr class="<l:output evenOutput='EOS_table_row' />">
                  <td align="center">
                    <w:rowCheckbox>
                      <h:param name='select_objs/empid' iterateId='id1' property='empid' indexed='true' />           
                    </w:rowCheckbox>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="userid"/>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="empname"/>
                  </td>
                   <td>
                    <b:write iterateId="id1" property="orgname"/>
                  </td>
                   <td>
                    <d:write dictTypeId="EXP_REGION" iterateId="id1" property="workarea"/>
                  </td>
                   <td>
                    <b:write iterateId="id1" property="startusedate" formatPattern="yyyy-MM-dd"/>
                  </td>
                   <td>
                    <b:write iterateId="id1" property="appempname"/>
                  </td>
                   <td>
                    <d:write dictTypeId="ABF_YESORNO" iterateId="id1" property="ishaveauth"/>
                  </td>
                   <td>
                    <b:write iterateId="id1" property="stopdate" formatPattern="yyyy-MM-dd"/>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="expyear"/>
                  </td>
                  <td>
                    <b:write iterateId="id1" property="expmonth"/>
                  </td>
                   <td>
                    <b:write iterateId="id1" property="remark"/>
                  </td>
                </tr>
              </l:iterate>
            </w:checkGroup>
            <tr>
              <td colspan="15" class="command_sort_area">
                <span style="float:left">
                  <input type="button" value="增加" id="addBtn" onclick="addRecord();" class="button">
                  <l:greaterThan property="page/size" targetValue="0" compareType="number">
                    <input type="button" value="修改" id="updateBtn" onclick="updateRecord();" class="button">
                  </l:greaterThan>
                  <l:greaterThan property="page/size" targetValue="0" compareType="number">
                    <input type="button" value="删除" id="deltbtn" onclick="deleteRecord();" class="button">
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
      init();
      function init(){
      	var isAdmin = false;
		var isFinance = false;
		<l:iterate id="roles" property="userObject/attributes/roles" scope="session">
			var roleid = "<b:write iterateId='roles' property='roleid'/>";
			if(roleid == "admin"){
				isAdmin = true;
			} else if(roleid == "finance"){
				isFinance = true;
			}
		</l:iterate>
		if(isFinance == false && isAdmin == false){
			document.getElementById("updateBtn").disabled = true;
		}
		if(isAdmin == false){
			document.getElementById("addBtn").disabled = true;
			document.getElementById("deltbtn").disabled = true;
		}
      }
      function exportDict(){
    	query_form.action = "com.primeton.eos.common.OmEmployeeExpMaintain.flow";
    	$name("_eosFlowAction").value = "dictExport";
    	query_form.submit();
    }
    </script>
  </body>
</html>
