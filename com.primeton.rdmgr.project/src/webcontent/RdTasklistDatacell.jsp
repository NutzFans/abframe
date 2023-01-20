<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<h:css href="/css/style1/style-custom.css"/>
<%--
- Author(s): wkq
- Date: 2011-02-11 16:12:43
- Description:
--%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
      任务项
    </title>
  </head>
  <body>
    <queryform id="59c29488-1934-478c-846e-cc4e7a735859">
  <h:form  id="queryFormDatacell"  name="query_form" action="" checkType="blur" target="_self" method="post" onsubmit="return submitQuery(this);">
    <w:panel id="panel1" width="100%" title="任务项查询">
      <table align="center" border="0" width="100%" class="form_table">
        <tr>
          <td class="form_label">
            任务名
          </td>
          <td colspan="1">
            <h:text property="criteria/_expr[1]/taskname"/>
            <h:hidden property="criteria/_expr[1]/_op" value="like"/>
            <h:hidden property="criteria/_expr[1]/_likeRule" value="all"/>
          </td>
        </tr>
        <tr class="form_bottom">
          <td colspan="6" class="form_bottom">
            <input type="hidden" name="criteria/_entity" value="com.primeton.rdmgr.data.rd.RdTasklist">
            每页显示
            <h:text size="2" property="page/length" value="20" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
            <input type="hidden" name="page/isCount" value="true">
            <input type="hidden" name="page/count" value="0">
            <input type="submit" value="查询" class="button">
          </td>
        </tr>
      </table>
    </w:panel>
    <h:hidden property="criteria/_orderby[1]/_sort" value="asc"/>
    <h:hidden property="criteria/_orderby[1]/_property" value="tasklist"/>
  </h:form>
</queryform>
    <script>
      function submitQuery(frm) {
        if (checkForm(frm)) {
          var a = $id('cell1');
          a.pageSize = $name("page/length").value;
          a.reload();
        }
        return false;
      }
    </script>
    <br/>
    <r:datacell 
    entityType="com.primeton.rdmgr.data.rd.RdTasklist"
    id="cell1"
    isCount="true"
    pageSize="20"
    paramFormId="queryFormDatacell"
    queryAction="com.primeton.rdmgr.project.rdtasklistbiz.queryRdTasklists.biz"
    readonly="false"
    submitAction="com.primeton.rdmgr.project.rdtasklistbiz.saveAllRdTasklists.biz"
    width="100%"
    height="400"
    xpath="rdtasklists">

  <r:toolbar location="bottom" tools="nav:first prev next last goto,edit:add del save reload,pagesize,info"/>
  <r:field fieldName="tasklist" label="任务编号">
    <h:text validateAttr="allowNull=false"/>
  </r:field>
  <r:field fieldName="taskname" label="任务名" width="200">
    <h:text validateAttr="allowNull=false"/>
  </r:field>
</r:datacell>
<script>
var cell1 = $id("cell1");
cell1.afterAdd = function(row) {  //新创建日报时，设置日期和填报人缺省值
	var rowData = cell1.getEntity(row);
	var wtype = $name("criteria/_expr[2]/workType").value;
	if (wtype != null && wtype != "")
		rowData.setProperty("workType", wtype);
	var ttype = $name("criteria/_expr[3]/taskType").value;
	if (ttype != null && ttype != "")
		rowData.setProperty("taskType", ttype);
}
var selectUser = $id("user_list");

</script>

  </body>
</html>
