<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%
    //获得当前请求的上下文
    String contextPath = request.getContextPath();
	//岗位管理
	String posi_manager = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_title_position_manager");
	//岗位树
	String posi_tree = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_position_tree");
	//刷新
	String refresh =  com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_refresh");
	//增加子岗位
	String addSubPosi = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_addSubPosition");
	//增加岗位人员
	String addPosiEmp = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_addPositionEmp");
	//删除岗位
	String deletePosi = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_deletePosition");

	String select_dialogJspStr = contextPath+"/organization/duty/select_dialog.jsp";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title> <b:message key="positionManager_l_title_position_manager"></b:message> </title>
 <script>        
    var nodeObj = null;
    var positionid = "";
    //复制或移动标识，默认为移动
    var isMoveOrCopy = "move";
    //移动的参数
    var m, mt;
    
    /*  
     * 树查询时初始化参数
     */
    function getParam() {
        return "<queryPosi><postionid>0</postionid></queryPosi>";
    }
    
    
    /*  单击岗位，重定向右边frame的页面为当前岗位的基本信息
     *  param0: node 树当前选中的节点
     */
    function clickNode(node) {
        positionid = node.getProperty("positionid");
        if(  positionid != null && positionid != "" ) {    
            var url = "org.gocom.abframe.org.position.PositionManager.flow?_eosFlowAction=action0";
            url += "&position/positionid=";
            url +=  positionid;
            
            $name("posiInfoFrame").src = url;
        }
        
    }
    
    /*
     *  刷新方法
     *  param0: node 树当前选中的节点
     */
	function refreshNode( node ) {
	    node.reloadChild();
	}
	
	/*  
	 *  双击树节点，重载树
	 *  param0: node 树当前选中的节点
	 */
	function dbClickNode( node ) {
	    if(node.isExpanded())
		{
	    	node.collapseNode();   //关闭当前节点
	    }else{   
	    	node.expandNode();     //展开当前节点的下级子节点
	    }
	}
	
    /*
     *  删除岗位，同时删除岗位下的人员和所有子岗位
     *  param0: node 树当前选中的节点
     */
    function deletePosition( node ) {
        var parentNode = node.getParent();
        var nodeName = node.getProperty("posiname");
        
        if( confirm('<b:message key="positionManager_l_m_alert_confirmDeletePosi"/>' + '\n' 
                   + '<b:message key="positionManager_l_m_alert_deletePosiAndDeleteNextPosi"/>') ) {
            var myAjax = new Ajax("org.gocom.abframe.org.position.PositionManager.deletePositions.biz");
            myAjax.addParam("pos[1]/positionid", node.getProperty("positionid"));
            myAjax.submit();
            var returnNode = myAjax.getResponseXMLDom();
            if( returnNode ) {
                if( myAjax.getValue("root/data/retCode") == "1" ) {
                    alert( '<b:message key="l_m_delete_success"/>'  );   //删除成功
                    parentNode.reloadChild();
                } else {
                    alert( '<b:message key="l_m_delete_fail"/>' );       //删除失败
                }
            } else {
                alert( '<b:message key="l_m_delete_fail"/>' );           //删除失败
            }
        }
    }
    
    /* 
     * 增加子岗位
     * param0: node 树当前选中的节点
     */
    function addPosition( node ) {
        nodeObj = node;
        var url = "org.gocom.abframe.org.position.SubPosition.flow";
        url += "?_eosFlowAction=insert";
        url += "&parentPosID=" + node.getProperty("positionid");
        url += "&parentPosName=" +  node.getProperty("posiname");
        url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
        
        showModalCenter(url, "", callBack, 450, 190, '<b:message key="positionManager_l_addSubPosition"/>');
    }
    
    /*  
     *  增加岗位人员
     *  param0: node 树当前选中的节点
     */
    function addEmp( node ) {
        var parentNode = node.getParent();
        var nodeName = node.getProperty("posiname");
        
        nodeObj = node;
    
        var url = "org.gocom.abframe.org.position.PositionEmp.flow";
        url += "?_eosFlowAction=pageQuery";
        url += "&parentPosID=";
        url += node.getProperty("positionid");
        url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	    showModalCenter(url, "", callBack, 550, 450, '<b:message key="positionEmp_l_title_addPositionEmp"/>');
	    
	    node.reloadChild();
    }
    
    /*  
     *  弹出窗口回调函数
     */
    function callBack(  ) {
        if( nodeObj != null ) {
            nodeObj.reloadChild();
        }
    }
    
    /*
     *  根据性别显示不同图标
     *  param0: node 树当前选中的节点
     */
    function render(node)
    {
    	if(node.getProperty("omEmployee/gender") == "m")
    	{
    		node.setIcon('<%=SkinUtil.getStyleFile("images/abf/user.png",request)%>');
    	}else{
    		node.setIcon('<%=SkinUtil.getStyleFileForTag("images/abf/user_female.png",request)%>');
    	}    	
    }
    
    /*
     *  节点移动时回调方法
     *  param0: arg lookup返回的参数值
     */
    function nodeMoveCallBack( arg ) {
        //如果选择取消，则退出
        if( arg == "cancel" ) 
            return ;
        isMoveOrCopy = arg;
        move(m, mt)
    }
    
    /*  
     *  树移动的初始参数
     */
    function getInitParam()
	{
	    var str = "<isMoveOrCopy>" + isMoveOrCopy + "</isMoveOrCopy>";
		return str;
	}
	
	/*  
	 *  重写树移动的接口
	 */
    function move(move_node,moveto_node)
	{
	    var tree=move_node.getTree();
	    var moveAction = tree.model.getMoveAction( move_node, moveto_node );
	    if( moveAction )
	    {//可以移动,执行设置的动作
	       var beforeMove=move_node.getTree().beforeMove;
	  
	       //if(beforeMove) if( beforeMove(move_node,moveto_node)==false) return; //执行拖动前的自定义方法
	 
	       var moveParam = tree.model.getMoveParam( move_node, moveto_node );
	       var hs=new HideSubmit(moveAction)
	       hs.submitXML(moveParam);
	  
	       var isReloadMoveNodeParent;
	       var isReloadMoveToNodeParent;
	 
	       isReloadMoveNodeParent=!move_node.getParent().isChildOf(moveto_node); 
	 
	       isReloadMoveToNodeParent=!moveto_node.isChildOf(move_node.getParent()); 
	  
	       var afterMove=tree.afterMove;
	   
	       if(isReloadMoveNodeParent)move_node.getParent().reloadChild();
	       if(isReloadMoveToNodeParent) moveto_node.reloadChild();   
	       if(afterMove) tree.afterMove();
	     }
	 }
	 
	 /* 
	  * 初始化框架右边的iframe页面
	  */
     function initRightFrame() {
         var url = "org.gocom.abframe.org.position.PositionManager.flow";
         url += "?position/positionid=";
         url +=  positionid;
         
         $name("posiInfoFrame").src = url;
     }
     /*
      *
      */
     function clickRoot(){
        var url = "org.gocom.abframe.org.position.PositionManager.flow";
        $name("posiInfoFrame").src = url;
     }
     /*  
      *  初始化树移动前的方法
      */
     function initTreeBeforeMove() {
         $id("tree1").beforeMove = function(movenode, toNode) {
	         var url = "<%=select_dialogJspStr %>";
		     url += '?_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
		     showModalCenter(url, "", nodeMoveCallBack, 168, 100, '<b:message key="l_title_select_oper"/>'); 
		     m = movenode;
             mt = toNode;
             
		     return false;
		 }
     }
     
     /*
      *  自定义初始化树高度、右边框架和树移动方法
      */
	 function custInit(){  
		var height = document.body.clientHeight - FINAL_PANEL_HEIGHT;
		$id("tree1").style.height =height;
		
		initRightFrame();
		initTreeBeforeMove();
	 }
</script>
 
</head>
<body topmargin="0" leftmargin="0">  

    <TABLE border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
	<TR>
	    <TD width="25%" height="100%" valign="top" >
	        <w:panel id="posiTree" title="<%=posi_manager %>"> 
			    <r:rtree id="tree1" height="100%" width="100%" >
			        <r:treeRoot  action="org.gocom.abframe.org.position.PositionManager.queryRootPosition.biz" childEntities="pos" display="<%=posi_tree%>" initParamFunc="getParam" icon="/common/images/icons/folder_palette.png" onClickFunc="clickRoot"/>
			        <r:treeNode nodeType="pos" submitXpath="queryPosi"  showField="posiname" childEntities="pos;empPos" action="org.gocom.abframe.org.position.PositionManager.querySubPosition.biz" 
			        onClickFunc="clickNode" onDblclickFunc="dbClickNode" icon='<%=SkinUtil.getStyleFileForTag("images/abf/group.png",request)%>'>
				        <r:treeMenu>
		                <r:treeMenuItem display="<%=addSubPosi %>" onClickFunc="addPosition"/>
		                <r:treeMenuItem display="<%=addPosiEmp %>" onClickFunc="addEmp"/>
		                <r:treeMenuItem display="<%=deletePosi %>" onClickFunc="deletePosition"/>
		                <r:treeMenuItem display="<%=refresh %>" onClickFunc="refreshNode"/>
		                </r:treeMenu>
			            <r:treeMove toNode="pos" initParamFunc="getInitParam" action="org.gocom.abframe.org.position.PositionManager.movePositionToPosition.biz" />
			        </r:treeNode>
			        <r:treeNode nodeType="empPos"  showField="omEmployee/empname" icon='<%=SkinUtil.getStyleFileForTag("images/abf/user.png",request)%>' onRefreshFunc="render">
			            <r:treeMove toNode="pos" initParamFunc="getInitParam" action="org.gocom.abframe.org.position.PositionManager.moveEmpToPosition.biz" />
			        </r:treeNode>
			    </r:rtree>
     		</w:panel>
		</TD>
		<TD width="75%" height="100%" valign="top">
	        <iframe frameBorder="0" style="width:100%;height:100%" scrolling="no" src="" name="posiInfoFrame">
	        </iframe>
	    </TD>
	</TR>
	
</TABLE>
		    
</body>
</html>
<SCRIPT language="javascript">
    //初始化树的高度
    eventManager.add(window,"load",custInit);
</SCRIPT>