<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
	String workItemID = request.getParameter("workItemID");
 %>
<body>
	<form id="formSubmit" >
		<input type="hidden" name="workItemID" value='<%=workItemID %>'/>
		<input type="hidden" name="taskType" value='finishedSelf'/>
		<input type="hidden" id="isShowDetail" name="isShowDetail" value='true'/>
	</form>
</body>
<script src="<%=request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript">
	nui.parse();
	formSubmit();
	function formSubmit(){
		nui.open({
			url: "dispatchTaskExecute.jsp?workItemID=<%=workItemID %>",
			title: "待办执行",
			width: "100%",
			height: "98%",
			onload: function () {
					
			},
			ondestroy: function (action){
				formSubmit = document.getElementById('formSubmit');
				formSubmit.action = '<%=request.getContextPath() %>/ame_mobile/processCenter/processCenter.jsp';
				formSubmit.submit();
			}
		});
	}
	
</script>
</html>
