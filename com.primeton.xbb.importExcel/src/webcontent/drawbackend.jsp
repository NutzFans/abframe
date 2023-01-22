<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): xuqq
  - Date: 2017-03-30 17:09:12
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
        	<th>销方名称</th>
			<th>金额</th>
			<th>税额</th>
			<th>退税差异</th>
			<th>认证日期</th>
			<th>内容</th>
			<th>销售</th>
      </tr>
      <l:iterate property="erpincomes" id="id1">
        <tr class="<l:output evenOutput='EOS_table_row' />">
          <td>
            <b:write iterateId="id1" property="sellername"/>
          </td>
          <td>
            <b:write iterateId="id1" property="sum"/>
          </td>
          <td>
            <b:write iterateId="id1" property="taxsum"/>
          </td>
          <td>
            <b:write iterateId="id1" property="divtax"/>
          </td>
          <td>
            <b:write iterateId="id1" property="date"/>
          </td>
          <td>
            <b:write iterateId="id1" property="content"/>
          </td>
          <td>
            <b:write iterateId="id1" property="orgname"/>
          </td>
        </tr>
      </l:iterate>
    </table>
  </w:panel>
</viewlist>
</body>
</html>