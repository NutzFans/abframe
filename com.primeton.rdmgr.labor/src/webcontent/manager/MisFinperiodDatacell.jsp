<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<h:css href="/css/style1/style-custom.css"/>
<%--
- Author(s): huangqj
- Date: 2014-08-15 15:13:40
- Description:
--%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
      MisFinperiod
    </title>
  </head>
  <body>
    <queryform id= "eb70ab9a-17c6-4938-a080-97a5d5e97448">
      <h:form  id="queryFormDatacell"  name="query_form" action="" checkType="blur" target="_self" method="post" onsubmit="return submitQuery(this);">
        <w:panel id="panel1" width="100%" title="财务周期查询">
          <table align="center" border="0" width="100%" class="form_table">
            <tr>
              <td class="form_label">
                财务年
              </td>
              <td colspan="1">
                <h:select property="criteria/_expr[1]/finyear">
                	<h:option label="全部" value=""/>
                	<h:option label="2016" value="2016"/>
                	<h:option label="2017" value="2017"/>
                	<h:option label="2018" value="2018"/>
                	<h:option label="2019" value="2019"/>
                	<h:option label="2020" value="2020"/>
                </h:select>
                <h:hidden property="criteria/_expr[1]/_op" value="="/>
              </td>
              <td class="form_label">
                财务月
              </td>
              <td colspan="1">
                <h:select property="criteria/_expr[2]/finmonth">
                	<h:option label="全部" value=""/>
                	<h:option label="1" value="1"/>
                	<h:option label="2" value="2"/>
                	<h:option label="3" value="3"/>
                	<h:option label="4" value="4"/>
                	<h:option label="5" value="5"/>
                	<h:option label="6" value="6"/>
                	<h:option label="7" value="7"/>
                	<h:option label="8" value="8"/>
                	<h:option label="9" value="9"/>
                	<h:option label="10" value="10"/>
                	<h:option label="11" value="11"/>
                	<h:option label="12" value="12"/>
                </h:select>
                <h:hidden property="criteria/_expr[2]/_op" value="="/>
              </td>
            </tr>
            <tr class="form_bottom">
              <td colspan="4" class="form_bottom">
                <input type="hidden" name="criteria/_entity" value="com.primeton.eos.common.newdataset.MisFinperiod">
                <input type="submit" value="查询" class="button">
              </td>
            </tr>
          </table>
        </w:panel>
        <h:hidden property="criteria/_orderby[1]/_sort" value="desc"/>
        <h:hidden property="criteria/_orderby[1]/_property" value="finyear"/>
        <h:hidden property="criteria/_orderby[2]/_sort" value="asc"/>
        <h:hidden property="criteria/_orderby[2]/_property" value="finmonth"/>
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
    <r:datacell 
        entityType="com.primeton.eos.common.newdataset.MisFinperiod"
        id="cell1" pageSize="12"
        isCount="true" height="400px"
        paramFormId="queryFormDatacell"
        queryAction="com.primeton.rdmgr.labor.misfinperiodbiz.queryMisFinperiods.biz"
        submitAction="com.primeton.rdmgr.labor.misfinperiodbiz.saveAllMisFinperiods.biz"
        width="100%"
        xpath="misfinperiods">

      <r:toolbar location="bottom" tools="nav,edit,pagesize,info"/>
      <r:field fieldName="finyear" label="财务年">
        <h:text/>
      </r:field>
      <r:field fieldName="finmonth" label="财务月">
        <h:text/>
      </r:field>
      <r:field fieldName="startdate" label="开始日期">
        <w:date/>
      </r:field>
      <r:field fieldName="enddate" label="结束日期">
        <w:date/>
      </r:field>
      <r:field fieldName="stddays" label="对应天数">
        <h:text/>
      </r:field>
      <r:field fieldName="stdhours" label="对应小时数">
        <h:text/>
      </r:field>
    </r:datacell>
  </body>
</html>
