<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<h:css href="/css/style1/style-custom.css"/>
<%--
- Author(s): huangqj
- Date: 2014-08-08 15:23:53
- Description:
--%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
      MisPrice
    </title>
  </head>
  <body>
    <queryform id= "3aeb4870-5b6e-48a0-a568-cb594932bb1f">
      <h:form  id="queryFormDatacell"  name="query_form" action="" checkType="blur" target="_self" method="post" onsubmit="return submitQuery(this);">
        <w:panel id="panel1" width="100%" title="服务人员价格查询">
          <table align="center" border="0" width="100%" class="form_table">
            <tr>
              <td class="form_label">
                服务人员级别
              </td>
              <td colspan="3"><%--页面已作废，不需要修改--%>
                <d:select dictTypeId="ABF_EMPLEVEL" nullLabel="全部" property="criteria/_expr[1]/degree"/>
                <h:hidden property="criteria/_expr[1]/_op" value="="/>
              </td>
            </tr>
            <tr class="form_bottom">
              <td colspan="4" class="form_bottom">
                <input type="hidden" name="criteria/_entity" value="com.primeton.eos.common.newdataset.MisPrice">
                <input type="submit" value="查询" class="button">
              </td>
            </tr>
          </table>
        </w:panel>
        <h:hidden property="criteria/_orderby[1]/_sort" value="desc"/>
        <h:hidden property="criteria/_orderby[1]/_property" value="innerdprice"/>
      <h:hidden name="criteria/_expr[2]/percostid" property="percostid"/>
      </h:form>
    </queryform>
    <script>
      function submitQuery(frm) {
        if (checkForm(frm)) {
          var a = $id('cell1');
          a.reload();
        }
        return false;
      }
    </script>
    <br/>
    <r:datacell entityType="com.primeton.eos.common.newdataset.MisPrice" id="cell1" paramFormId="queryFormDatacell" queryAction="com.primeton.rdmgr.labor.mispricebiz.queryMisPrices.biz" submitAction="com.primeton.rdmgr.labor.mispricebiz.saveAllMisPrices.biz" width="100%" xpath="misprices">
      <r:toolbar location="bottom" tools="nav,edit,pagesize,info"/>
      <r:field fieldName="degree" label="服务人员级别">
        <d:select dictTypeId="ABF_EMPLEVEL"/>
      </r:field>
      <r:field fieldName="innerdprice" label="内部日价">
        <h:text validateAttr="type=number;allowNull=false"/>
      </r:field>
      <r:field fieldName="innermprice" label="内部月价">
        <h:text validateAttr="type=number;allowNull=false"/>
      </r:field>
      <r:field fieldName="outdprice" label="外部日价">
        <h:text validateAttr="type=number;allowNull=false"/>
      </r:field>
      <r:field fieldName="outmprice" label="外部月价">
        <h:text validateAttr="type=number;allowNull=false"/>
      </r:field>
    </r:datacell>
    <script>
  		var cell1 = $id("cell1");
    	cell1.afterAdd = function(row) {  
		var rowData = cell1.getEntity(row);
		rowData.setProperty("percostid", '<b:write property="percostid"/>');
	}
    </script>
  </body>
</html>
