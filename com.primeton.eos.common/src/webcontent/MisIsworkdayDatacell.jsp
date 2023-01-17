<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<h:css href="/css/style1/style-custom.css"/>
<%--
- Author(s): huangqj
- Date: 2014-09-22 16:22:35
- Description:
--%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
      Entity
    </title>
  </head>
  <body>
    <queryform id= "5c5b05d1-c13d-482e-943f-309ebd9af96a">
      <h:form  id="queryFormDatacell"  name="query_form" action="" checkType="blur" target="_self" method="post" onsubmit="return submitQuery(this);">
        <w:panel id="panel1" width="100%" title="工作日维护查询">
          <table align="center" border="0" width="100%" class="form_table">
            <tr>
              <td class="form_label">
                日期
              </td>
              <td colspan="1">
                <h:hidden property="criteria/_expr[1]/_op" value="between" />
                <h:hidden property="criteria/_expr[1]/moddate" value=" " />
                <h:hidden property="criteria/_expr[1]/_pattern" value="yyyy-MM-dd"/>
                <table style="border:0px;background-color:transparent" border="0" cellspacing="0" cellpadding="0">
                  <tr style="border: 0px none ; background-color: transparent;">
                    <td style="border: 0px none ; background-color: transparent;">
                      从:
                    </td>
                    <td style="border: 0px none ; background-color: transparent;">
                      <w:date property="criteria/_expr[1]/_min" size="10"/>
                    </td>
                    <td style="border: 0px none ; background-color: transparent;">
                      到:
                    </td>
                    <td style="border: 0px none ; background-color: transparent;">
                      <w:date property="criteria/_expr[1]/_max" size="10"/>
                    </td>
                  </tr>
                </table>
              </td>
              <td class="form_label">
                是否是工作日
              </td>
              <td colspan="1">
                <d:select dictTypeId="ABF_YESORNO" nullLabel="全部" property="criteria/_expr[2]/isworkday"/>
                <h:hidden property="criteria/_expr[2]/_op" value="="/>
              </td>
              <td colspan="4" class="form_bottom">
                <input type="hidden" name="criteria/_entity" value="com.primeton.eos.common.newdataset.MisIsworkday">
                <input type="submit" value="查询" class="button">
              </td>
            </tr>
          </table>
        </w:panel>
        <h:hidden property="criteria/_orderby[1]/_sort" value="desc"/>
        <h:hidden property="criteria/_orderby[1]/_property" value="moddate"/>
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
        entityType="com.primeton.eos.common.newdataset.MisIsworkday"
        id="cell1" height="450px" pageSize="20"
        paramFormId="queryFormDatacell"
        queryAction="com.primeton.eos.common.misisworkdaybiz.queryMisIsworkdays.biz"
        submitAction="com.primeton.eos.common.misisworkdaybiz.saveAllMisIsworkdays.biz"
        width="100%"
        xpath="misisworkdays">

      <r:toolbar location="bottom" tools="nav,edit,pagesize,info"/>
      <r:field fieldName="moddate" label="日期">
        <w:date/>
      </r:field>
      <r:field fieldName="isworkday" label="是否是工作日">
        <d:select dictTypeId="ABF_YESORNO"/>
      </r:field>
    </r:datacell>
  </body>
</html>
