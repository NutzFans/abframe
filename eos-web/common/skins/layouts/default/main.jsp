<%@page import="com.eos.foundation.eoscommon.BusinessDictUtil"%>
<script>
	<% 
	String s = BusinessDictUtil.getDictName("AME_SYSCONF", "AMEPATH");
	String url = s+"ame/clipview/index.jsp";
	%>
	window.location.href = "<%=url %>";
</script>