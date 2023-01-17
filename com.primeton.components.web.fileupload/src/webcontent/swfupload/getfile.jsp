<%@page pageEncoding="UTF-8"%><%@include file="/common/common.jsp"%>
<h:outputFile contentType="@fileObject/fileType" property="fileObject/filePath" outputFileName="@fileObject/fileName"/>
<%out.clear();out = pageContext.pushBody();%>