<%
String fileid = (String) request.getAttribute("fileids");
out.println("<script>parent.test('"+fileid+"')</script>");  

%>