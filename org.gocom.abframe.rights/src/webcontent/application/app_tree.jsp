<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<script>
    /*
     * 重载树节点
     * param0: node 需要重载的树节点
     */
    function queryApp(node){
        node.reloadChild();
    }
    //功能编号、功能名称、应用编号、应用名称
    var funccode = "";
    var funcname = "";
    var appid = "";
    var appname = "";
    /*
     * 树节点双击事件，返回双击节点的名称并关闭当前页面
     * param0: node 树当前选中的节点
     */
    function dbClickNode( node ) {
        setReturnValue( node );

        var tmpNode = getRootNodeValue( node );
        appid = tmpNode.getProperty("appid") ;
        appname =  tmpNode.getProperty("appname") ;

        returnValue = [funccode, funcname, appid, appname];

        window.close();
    }
    /*
     *  得到应用节点
     *  param0: node 树当前选中的节点
     */
    function getRootNodeValue( node ) {
        if( node.getParent().isRootNode()  ) {
            return node;
        }else{
        	return getRootNodeValue(node.getParent());
        }
    }
    /*
     *  单击树节点，给变量赋值
     *  param0: node 树当前选中的节点
     */
    function clickNode( node ) {
        setReturnValue( node );
        var tmpNode = getRootNodeValue( node );
        appid = tmpNode.getProperty("appid") ;
        appname =  tmpNode.getProperty("appname") ;
    }

    /*
     *  给变量赋值方法，并给文本框和隐藏域赋值
     *  param0: node 树当前选中节点
     */
    function setReturnValue( node ) {
        funccode = node.getProperty("funccode");
        funcname   = node.getProperty("funcname");

        $name("funccode").value = funccode;
        $name("funcname").value = funcname;
    }
    /*
     *  关闭当前窗口
     *  param0 idValue 功能编号
     *  param1 nameValue 功能名称
     *  param2 appIdValue 应用编号
     *  param3 appNameValue 应用名称
     */
    function closeWin( idValue, nameValue, appIdValue, appNameValue ) {
        returnValue = [ idValue, nameValue, appIdValue, appNameValue ];
        window.close();
    }
    /*
     *  确定方法，返回值，并关闭当前页面
     */
    function ok() {
        if( funccode == "" || funccode == null || funcname == "" || funcname == null ) {
            if( confirm('<b:message key="l_m_alert_notSelectValueExit"/>') ) {
                closeWin( funccode, funcname , appid, appname);
            }
        } else {
            closeWin( funccode, funcname, appid, appname );
        }
    }
</script>

</head>
<body>

<r:rtree width="345" height="360" id="DTree" >

  <r:treeRoot action="org.gocom.abframe.rights.application.ApplicationMaintain.getAppAll.biz" childEntities="appList" display="应用列表" onClickFunc="queryFunc" icon='<%=SkinUtil.getStyleFileForTag("images/abf/root.png",request)%>' >

  </r:treeRoot>
  <r:treeNode nodeType="appList" showField="appname" action="org.gocom.abframe.rights.application.ApplicationMaintain.getFuncGroup.biz" submitXpath="funcGroupTemp" childEntities="funcGroupList"  onDblclickFunc="queryApp" icon='<%=SkinUtil.getStyleFileForTag("images/abf/application.png",request)%>'>

  </r:treeNode>
  <r:treeNode nodeType="funcGroupList" showField="funcgroupname" action="org.gocom.abframe.rights.application.ApplicationMaintain.getSubFuncGroupAndFunc.biz" submitXpath="subFuncGroupTemp" childEntities="subFuncGroupList;funcList" onDblclickFunc="queryApp" icon='<%=SkinUtil.getStyleFileForTag("images/abf/function_group_open.png",request)+","+SkinUtil.getStyleFileForTag("images/abf/function_group_close.png",request)%>'>

  </r:treeNode>
  <r:treeNode nodeType="subFuncGroupList" showField="funcgroupname" action="org.gocom.abframe.rights.application.ApplicationMaintain.getSubFuncGroupAndFunc.biz" submitXpath="subFuncGroupTemp" childEntities="subFuncGroupList;funcList" onDblclickFunc="queryApp" icon='<%=SkinUtil.getStyleFileForTag("images/abf/function_group_open.png",request)+","+SkinUtil.getStyleFileForTag("images/abf/function_group_close.png",request)%>'>

  </r:treeNode>
  <r:treeNode nodeType="funcList" showField="funcname" onDblclickFunc="dbClickNode" onClickFunc="clickNode" icon='<%=SkinUtil.getStyleFileForTag("images/abf/function.png",request)%>'/>

</r:rtree>
<b:message key="l_selectValueIs"/><input type="text" name="funcname" readonly="readonly" value=""/>
		   <input type="hidden" name="funccode" value=""/>
		   &nbsp;&nbsp;
		   <input type="button" class="button" value='<b:message key="l_cofirm"/>' onclick="javascript:ok();"/>
		   &nbsp;&nbsp;
		   <input type="button" class="button" value='<b:message key="l_empty"/>' onclick="javascript:closeWin('','', '', '');"/>
</body>
</html>