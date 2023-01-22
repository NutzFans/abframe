<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>
</head>
<body leftmargin="0" topmargin="0" bottommargin="0" rightmargin="0">
<script>
    /*
     * 重载树节点
     * param0: node 需要重载的树节点
     */
    function queryApp(node){
        node.reloadChild();
    }
    //返回的功能编号和功能名称
    var funccode = "";
    var funcname = "";


    function dbClickNode( node ) {
        setReturnValue( node );

        var tmpNode = getRootNodeValue( node );
        returnValue = [funccode, funcname];
        window.close();
    }
    function getRootNodeValue( node ) {
        if( node.getParent().isRootNode()  ) {
            return node;
        }else{
        	return getRootNodeValue(node.getParent());
        }
    }
    function clickNode( node ) {
        setReturnValue( node );
    }

    function setReturnValue( node ) {
        funccode = node.getProperty("funccode");
        funcname   = node.getProperty("funcname");

        $name("funccode").value = funccode;
        $name("funcname").value = funcname;
    }
    function closeWin( idValue, nameValue) {
        returnValue = [ idValue, nameValue];
        window.close();
    }
    function ok() {
        if( funccode == "" || funccode == null || funcname == "" || funcname == null ) {
            if( confirm( '<b:message key="l_m_alert_notSelectValueExit"/>' ) ) {
                closeWin( funccode, funcname);
            }
        } else {
            closeWin( funccode, funcname);
        }
    }
</script>

<TABLE border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
	<TR>
	    <TD width="340" height="350" valign="top" class="eos-panel-table">
			<r:rtree height="340" width="350" id="DTree" >
  				<r:treeRoot action="org.gocom.abframe.rights.application.ApplicationMaintain.getAppAll.biz" childEntities="appList" display="应用列表" onClickFunc="queryFunc" icon='<%=SkinUtil.getStyleFileForTag("images/abf/root.png",request)%>' >
  				</r:treeRoot>
  				
  				<r:treeNode nodeType="appList" preload="true" showField="appname" action="org.gocom.abframe.rights.application.ApplicationMaintain.getFuncGroup.biz" submitXpath="funcGroupTemp" childEntities="funcGroupList"  onDblclickFunc="queryApp" icon='<%=SkinUtil.getStyleFileForTag("images/abf/application.png",request)%>'>
  				</r:treeNode>
  				
  				<r:treeNode nodeType="funcGroupList" preload="true" showField="funcgroupname" action="org.gocom.abframe.rights.application.ApplicationMaintain.getSubFuncGroupAndFunc.biz" submitXpath="subFuncGroupTemp" childEntities="subFuncGroupList;funcList" onDblclickFunc="queryApp" icon='<%=SkinUtil.getStyleFileForTag("images/abf/function_group_open.png",request)%>,<%=SkinUtil.getStyleFileForTag("images/abf/function_group_close.png",request)%>'>
  				</r:treeNode>
  				
  				<r:treeNode nodeType="subFuncGroupList" preload="true" showField="funcgroupname" action="org.gocom.abframe.rights.application.ApplicationMaintain.getSubFuncGroupAndFunc.biz" submitXpath="subFuncGroupTemp" childEntities="subFuncGroupList;funcList" onDblclickFunc="queryApp" icon='<%=SkinUtil.getStyleFileForTag("images/abf/function_group_open.png",request)%>,<%=SkinUtil.getStyleFileForTag("images/abf/function_group_close.png",request)%>'>
  				</r:treeNode>
  				<r:treeNode nodeType="funcList" preload="true" showField="funcname" onDblclickFunc="dbClickNode" onClickFunc="clickNode" icon='<%=SkinUtil.getStyleFileForTag("images/abf/function.png",request)%>' >
			</r:rtree>
		</TD>
	</TR>
	<TR>
	    <TD>
			<b:message key="l_selectValueIs"/><input type="text" name="funcname" readonly="readonly" value=""/>    <!-- 您选择的值为： -->
		   	<input type="hidden" name="funccode" value=""/>
		   	<input type="button" class="button" value='<b:message key="l_cofirm"/>' onclick="javascript:ok();"/>
		   	<input type="button" class="button" value='<b:message key="l_empty"/>' onclick="javascript:closeWin('','');"/>
		   	<input type="button" class="button" value='<b:message key="l_close"/>' onclick="javascript:window.close();"/>
	</TR>
</TABLE>
</body>
</html>