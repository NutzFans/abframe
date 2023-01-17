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
			<td class="form_label" width="20%">报销单类型：</td>
			<td width="80%"><h:text property="bxdlx" readonly="true"/><h:hidden property="bxdlxid"/></td>
		</tr>
		<tr>
			<td class="form_label">报销单编号：</td>
			<td><h:text property="expno" readonly="true"/></td>
		</tr>
		<tr>
			<td class="form_label">退回接收人：</td>
			<td><h:text property="backto" validateAttr="allowNull=false;"/></td>
		</tr>
		<tr>
			<td class="form_label">退回原因:</td>
			<td><h:textarea property="backreason" cols="30" rows="3" validateAttr="allowNull=false;"/></td>
		</tr>
		<tr class="form_bottom">
          <td colspan="2">
            <input type="button" value="退回" onclick="doSubmit();" class="button">
          </td>
        </tr>
	</table>
</form>
</body>
</html>
<script>
function doSubmit(){
	if(checkForm($name("form1"))){
		var myAjax = new Ajax("com.primeton.eos.common.sendMail.expFinReceive.biz");
      	myAjax.addParam('bxdlx',$name("bxdlxid").value);
		myAjax.addParam('expno',$name("expno").value);
		myAjax.addParam('cwczzt','2');
		myAjax.addParam('backreason',$name("backreason").value);
		myAjax.addParam('backto',$name("backto").value);
		myAjax.submit();
		var result =myAjax.getValue("/root/data/result");
		if(result == "1"){
			alert("已退回！");
			window.close();
		}
	}
}
</script>