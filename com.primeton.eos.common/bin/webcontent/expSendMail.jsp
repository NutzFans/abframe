<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<h:css href="/css/style1/style-custom.css"/>
<html>
<!-- 
  - Author(s): huangqj
  - Date: 2013-08-20 14:49:28
  - Description:
-->
<head>
<title>Title</title>
</head>
<body>
<form name="form1" action="com.primeton.eos.common.ExpSendMail.flow">
	<h:hidden name="_eosFlowAction" value="sendMailSubmit"/>
	<table align="center" border="0" width="100%" class="form_table">
		<tr>
			<td class="form_label" width="30%">报销单类型：</td>
			<td width="80%"><h:text property="bxdlx" readonly="true"/><h:hidden property="bxdlxid"/></td>
		</tr>
		<tr>
			<td class="form_label">报销单编号：</td>
			<td><h:text property="pk" readonly="true"/></td>
		</tr>
		<tr>
			<td class="form_label">报销金额：</td>
			<td><h:text property="je" validateAttr="type=float;"/></td>
		</tr>
		<tr>
			<td class="form_label">报销人工号：</td>
			<td><h:text property="bxr" readonly="true"/></td>
		</tr>
		<tr>
			<td class="form_label">报销人姓名：</td>
			<td><h:text property="bxrxm" readonly="true"/></td>
		</tr>
		<tr>
			<td class="form_label">报销人邮箱：</td>
			<td><h:text property="oemail" validateAttr="type=email;" size="30"/></td>
		</tr>
		<tr>
			<td class="form_label">本次扣除:</td>
			<td><h:text property="bckc" validateAttr="type=float;"/></td>
		</tr>
		<tr>
			<td class="form_label">常用备注选择:</td>
			<td><d:select dictTypeId="EXP_MAILREMARK" property="cybzxz" nullLabel="请选择" onchange="doSetBZ();"/></td>
		</tr>
		<tr>
			<td class="form_label">备注:</td>
			<td><h:text property="bz"/></td>
		</tr>
		<tr class="form_bottom">
          <td colspan="2">
            <input type="button" value="发送打款通知邮件" onclick="doSubmit();" class="button">
          </td>
        </tr>
	</table>
</form>
</body>
</html>
<script>
function doSetBZ(){
	if($name("cybzxz").value != ""){
		$name("bz").value = $name("cybzxz").options[$name("cybzxz").selectedIndex].innerText;
	}
}
function doSubmit(){
	if(checkForm($name("form1"))){
		form1.submit();
	}
}
</script>