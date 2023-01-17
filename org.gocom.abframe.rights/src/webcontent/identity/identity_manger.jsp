<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%
	//��ȡ��ǩ��ʹ�õĹ�ʻ���Դ��Ϣ
	String identityManager = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("identityManager_l_title_identityManager");
	String identity_query = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("identityManager_l_identity")
			+ com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_query_cond");
%>
<html>
<head>
<title><b:message key="identityManager_l_title_identityManager"></b:message>
</title>
<script>
    function custInit(){
      $name('query_form').submit();   
     }
</script>
</head>
<body topmargin="0" leftmargin="0">
<w:tabPanel id="identityTabs" height="100%" width="100%">
	<w:tabPage id="identityInfo" tabType="div"
		title="<%=identityManager %>">
		<h:form name="query_form"
			action="org.gocom.abframe.rights.application.IdentityManager.flow"
			method="post" target="listpage">
			<input type="hidden" name="_eosFlowAction" value="query" />
			<input type="hidden" name="criteria/_entity" value="org.gocom.abframe.dataset.privilege.AcIdentity">
			<h:hidden property="criteria/_expr[1]/_op" value="like" />
			<h:hidden property="criteria/_expr[1]/_likeRule" value="all" />
			<w:panel id="panel1" width="100%" title="<%=identity_query %>">
				<table align="center" border="0" width="100%" class="form_table">
					<tr>
						<td class="form_label"><!--  ������ --> 
						<b:message
							key="identityManager_l_identityname"></b:message><b:message	key="l_colon"></b:message></td>
						<td >
						<input type="text"	name="criteria/_expr[2]/identityname" /> 
						<h:hidden name="criteria/_expr[2]/_op" value="like" /> 
						<h:hidden name="criteria/_expr[2]/_likeRule" value="all" /></td>
					</tr>
					<tr class="form_bottom">
						<td colspan="6" class="form_bottom">
						 <b:message key="l_pageDisplay"/> <h:text size="2" property="page/length" value="10"	validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
						<h:hidden name="page/begin" value="0" /> 
						<h:hidden name="page/isCount" value="true"/> 
						<input	type="submit" value='<b:message key="l_query"/>'>&nbsp;
						<input type="button" class="button" value='<b:message key="l_reset"/>'	onclick="javascript:$name('query_form').reset();"></td>
					</tr>
				</table>
			</w:panel>
		</h:form>
		<iframe name="listpage" width="100%" height="100%" frameborder="0" scrolling="no"></iframe>
	</w:tabPage>
</w:tabPanel>
</body>
</html>
<script>    
     //��ʼ��ҳ�水ť��ʽ
     eventManager.add(window,"load",custInit); 
</script>
