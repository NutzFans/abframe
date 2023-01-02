<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): jiangnan
  - Date: 2014-02-13 15:44:29
  - Description:
-->
<head>
<title>Title</title>
<h:css href="/css/style1/style-custom.css"/>
</head>
<body>

<table align="center" border="0" width="100%" class="form_table">
	<tr class="form_bottom">
		<td colspan="4" align="left">导入完成。</td>
	</tr>
	<tr class="form_bottom">
		<td colspan="4" align="left">
			导入失败&nbsp;<b:write property="i"/>&nbsp;条。
		</td>
	</tr>
</table>

<br/>

<viewlist id="8ffcc094-a137-4bbb-b468-32523836885e">
  <w:panel id="list_panel" width="100%" title="导入失败的数据表">
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
        <th>
          合同编号
        </th>
        <th>
          开票日期
        </th>
        <th>
          开票名称
        </th>
        <th>
          项目名称
        </th>
        <th>
   2019年产品 收入
        </th>
        <th>
          产品增值税退税收入
        </th>
        <th>
          销售人员
        </th>
      </tr>
      <l:iterate property="erpincomes" id="id1">
        <tr class="<l:output evenOutput='EOS_table_row' />">
          <td>
            <b:write iterateId="id1" property="contractno"/>
          </td>
          <td>
            <b:write iterateId="id1" property="incomeDate"/>
          </td>
          <td>
            <b:write iterateId="id1" property="custname"/>
          </td>
          <td>
            <b:write iterateId="id1" property="projectname"/>
          </td>
          <td>
            <b:write iterateId="id1" property="incomeMoney"/>
          </td>
          <td>
            <b:write iterateId="id1" property="jrservmoney"/>
          </td>
          <td>
            <b:write iterateId="id1" property="deptname"/>
          </td>
        </tr>
      </l:iterate>
    </table>
  </w:panel>
</viewlist>




</body>
</html>