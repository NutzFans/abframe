<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2017-11-01 15:06:08
  - Description:
-->
<head>
<title>跳转</title>
<style type="text/css">
	*{margin: 0;padding: 0;list-style-type:none;-webkit-touch-callout:none !important; /*系统默认菜单被禁用*/   -webkit-user-select:none; /*webkit浏览器*/   -khtml-user-select:none; /*早期浏览器*/   -moz-user-select:none;/*火狐*/   -ms-user-select:none; /*IE10*/   user-select:none;  }
    [v-cloak]{display: none !important;}
    #list{overflow: hidden; min-height: 101%;}
    .flex1 {-webkit-flex: 1;/* Chrome */  -ms-flex: 1;/* IE 10 */  flex: 1;/* NEW, Spec - Opera 12.1, Firefox 20+ */-webkit-box-flex: 1;/* OLD - iOS 6-, Safari 3.1-6 */-moz-box-flex: 1;/* OLD - Firefox 19- */}
    div.my_score{position:fixed;*position:absolute;top:40%;left:50%;margin-left:-30%;z-index:110;width:60%;line-height:4rem;border:1px solid gray;border-radius:8px;-webkit-border-radius:8px;-moz-border-radius:8px; text-align:center;font-size:3rem;font-weight:lighter;background: #00BFF0;color:white;}
    
</style>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-latest.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/p-pull-refresh.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/touche.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/vue.min.js"></script>
<script type="text/javascript">
	sessionStorage.setItem("startdate","<%=request.getParameter("startdate")%>");
    sessionStorage.setItem("enddate","<%=request.getParameter("enddate")%>");
    sessionStorage.setItem("operate","<%=request.getParameter("operate")%>");
    sessionStorage.setItem("laborDetailId","<%=request.getParameter("laborDetailId")%>");
    setTimeout(function(){ 
    	location.href = '<%=request.getContextPath() %>/ame_common/wxworktime/addworktime.jsp?time='+(new Date().getTime());  
    },100);
	
</script>
</body>
</html>