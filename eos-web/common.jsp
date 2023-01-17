<%@ taglib uri="http://eos.primeton.com/tags/html" prefix="h"%>
<%@ taglib uri="http://eos.primeton.com/tags/logic" prefix="l"%>
<%@ taglib uri="http://eos.primeton.com/tags/bean" prefix="b"%>
<%@ taglib uri="http://eos.primeton.com/tags/eos" prefix="e"%>
<%@ taglib uri="http://eos.primeton.com/tags/webcomp" prefix="w"%>
<%@ taglib uri="http://eos.primeton.com/tags/richweb" prefix="r"%>
<%@ taglib uri="http://eos.primeton.com/tags/dict" prefix="d"%>
<%@ taglib uri="http://eos.primeton.com/tags/abframe" prefix="abf"%>
<%@page import="org.gocom.abframe.auth.bizlet.SkinUtil"%>
<%@page import="org.gocom.abframe.ABFConfigKey"%>
<%
//TODO 如果要设置客户端缓存页面，注释以下三行
response.setHeader("Pragma","No-Cache"); 
response.setHeader("Cache-Control","No-Cache"); 
response.setDateHeader("Expires",   0);  
%>
<script type="text/javascript">
	var contextPath = "<%=request.getContextPath()%>";	 // you should define the contextPath of web application
	var EOSDEBUG = true;
	var FINAL_PANEL_HEIGHT = 22;
	<%-- manager(group_manager.jsp)主页面中iframe需要减少的高度 --%>
	var IFRAME_MODIFY_HEIGHE = 35;
	<%-- tree(group_tree.jsp)页面中tree需要减少的高度 --%>
	var TREE_MODIFY_HEIGHT = 22;
</script>
<h:script i18n="true" src="/common/javascripts/message.js" />
<h:script src='<%=ABFConfigKey.SKIN_STYLE_LOC.getConfigValue()+"/resource.js.jsp"%>'/>
<h:script src="/common/skins/skin0/scripts/resource.js"></h:script>
<h:script src="/common/fckeditor/ckeditor.js" />
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<h:script src="/common/lib/mootools.js"/>
<h:script src="/common/javascripts/common.js" />
<h:css href='<%=SkinUtil.getStyleFileForTag("theme/style-sys.css",request)%>'/>
<h:css href='<%=SkinUtil.getStyleFileForTag("theme/style-component.css",request)%>'/>
<h:css href='<%=SkinUtil.getStyleFileForTag("theme/style-custom.css",request)%>'/>