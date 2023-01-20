<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/WEB-INF/runqianReport4.tld" prefix="report" %>
<jsp:include page="performance.jsp" flush="false" />


<%
String info="unitno="+request.getParameter("unitno")+";year=2013;startmonth=1;endmonth=5";
%>
<table align=center>
<tr><td>
<% if(info != null){ %>
<!-- 
<report:html name="report1" reportFileName="rpt_test_unit4.raq" params="<%=info %>"/>
 -->
<report:group groupFileName="rpt_test_unit.rpg"
			funcBarLocation="top"
			exceptionPage="/reportJsp/myError2.jsp"
			params="<%=info %>"	
			
		/>

<%}else{ %>
<report:html name="report1" reportFileName="report_0.raq"/>
<%} %>
</td></tr>
<!-- 
<tr><td>
<%=info %>
</td></tr>
 -->
 
</table>
<script>
	(function(){
		var tab=document.getElementById('rq_tabtbl');
		
		if(tab){
			var tds=tab.getElementsByTagName('td');
			
			if(tds.length){
				tds[0].style.border='';
			}
			
		}
		
	})()

</script>

</body>
</html>