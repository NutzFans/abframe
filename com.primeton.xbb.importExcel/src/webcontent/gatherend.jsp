<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): xuqq
  - Date: 2017-03-30 15:31:34
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
        <th>合同编号</th>
			<th>支付单位</th>
			<th>收款日期</th>
			<th>收款金额</th>
			<th>销售</th>
			<th>部门</th>
			<th>二级部门</th>
			<th>部门名称</th>
			<th>收款对应收入年份</th>
      </tr>
      <l:iterate property="erpincomes" id="id1">
        <tr class="<l:output evenOutput='EOS_table_row' />">
          <td>
            <b:write iterateId="id1" property="contractno"/>
          </td>
          <td>
            <b:write iterateId="id1" property="custname"/>
          </td>
          <td>
            <b:write iterateId="id1" property="gatherdate"/>
          </td>
          <td>
            <b:write iterateId="id1" property="gathermon"/>
          </td>
          <td>
            <b:write iterateId="id1" property="salename"/>
          </td>
          <td>
            <b:write iterateId="id1" property="sybname"/>
          </td>
          <td>
            <b:write iterateId="id1" property="secondorgname"/>
          </td>
          <td>
            <b:write iterateId="id1" property="orgname"/>
          </td>
          <td>
            <b:write iterateId="id1" property="gatheryear"/>
          </td>
        </tr>
      </l:iterate>
    </table>
  </w:panel>
</viewlist>
</body>
</html>