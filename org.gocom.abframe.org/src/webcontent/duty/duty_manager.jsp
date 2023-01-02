<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp" %>

<html>
<head>
<title> <b:message key="dutyManager_l_title_duty_manager"></b:message> </title>

<%
    //获取当前请求上下文
    String contextPath = request.getContextPath();
	//职务管理
	String duty_manager = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_title_duty_manager");
	//职务树
	String duty_tree = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_duty_tree");
	//刷新
	String refresh =  com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_refresh");
	//增加子职务
	String addSubDuty = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_addSubDuty");
	//删除职务
	String deleteDuty = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_deleteDuty");
%>

<script language="javascript">        
    var nodeOjb = null;
    //复制或移动标识，默认为移动
    var isMoveOrCopy = "move";
    //移动的参数
    var m, mt;
    
    /*
     * 树查询初始化参数
     */
    function getParam() {
        return "<queryDuty><dutytype>0</dutytype></queryDuty>";
    }
    
    /*
     *  在职务上右键菜单增加子职务
     *  param0: node   树当前选中节点
     *  return: 
     */
    function addDuty( node ) {
        nodeOjb = node; 
        var action;
        
        if( node.getProperty("dutyid") != null && node.getProperty("dutyid") != "" ) {
            action = "insert";
        }else{
        	action = "insertRoot";
        }
        
        var url = "org.gocom.abframe.org.duty.DutyMain.flow";
        url += "?_eosFlowAction="+action;
        url += "&parentDutyID=";
        if( node.getProperty("dutyid") != null && node.getProperty("dutyid") != "" ) {
            url += node.getProperty("dutyid");
        } 
        url += "&parentDutyName=";
        if( node.getProperty("dutyid") != "" && node.getProperty("dutyid") != null ) {
            url += node.getProperty("dutyname");
        }
        url += "&duty/dutytype=";
        url += node.getProperty("dutytype");
        url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
        
        showModalCenter(url, "", callBack, 450, 190, '<b:message key="dutyManager_l_addSubDuty"/>');  //增加子职务
    }
    
    /*
     *  删除职务，同时删除职务下的子职务
     *  param0: node   树当前选中节点
     */
    function deleteDuty( node ) {
        var parentNode = node.getParent();
        var nodeName = node.getProperty("dutyname");
        
        if( confirm('<b:message key="dutyManager_l_m_alert_confirmDeleteDuty"/>' + '\n'
                   + '<b:message key="dutyManager_l_m_alert_deleteDutyAndDeleteNextDuty"/>') ) {
            var myAjax = new Ajax("org.gocom.abframe.org.duty.DutyManager.deleteDutys.biz");
            myAjax.addParam("dutys[1]/dutyid", node.getProperty("dutyid"));
            myAjax.submit();
            var returnNode = myAjax.getResponseXMLDom();
            if( returnNode ) {
                if( myAjax.getValue("root/data/retCode") == "1" ) {
                    alert( '<b:message key="l_m_delete_success"/>'  );   //删除成功
                    parentNode.reloadChild();                            
                } else {
                    alert( '<b:message key="l_m_delete_fail"/>' );      //删除失败
                }
            } else {
                alert( '<b:message key="l_m_delete_fail"/>' );          //删除失败
            }
        }
    }
    
    /* 
     *  回调函数
     */
    function callBack(  ) {
        //if( nodeOjb != null ) {
            nodeOjb.reloadChild();
       // }
    }
    
    /*
     *  刷新方法
     *  param0: node   树当前选中节点
     */
    function refreshNode( node ) {
        node.reloadChild();
    }
    
    /*
     * 双击重载树节点
     * param0: node   树当前选中节点
     */
    
    function dbClickNode( node ) {
        if(node.isExpanded())
    	{
    		//关闭当前节点
        	node.collapseNode();
        }else{
            //展开当前节点的下级子节点
        	node.expandNode();
        }
    }
    
    /*
     *  单击查看详细信息
     *  param0: node   树当前选中节点
     */
    function clickNode(node) {
        dutyid = node.getProperty("dutyid");
        var dutytype = node.getProperty("dutytype");
        var url = "org.gocom.abframe.org.duty.DutyInfo.flow?_eosFlowAction=action0";
        if(  dutyid != null && dutyid != "" ) {    
            
            url += "&duty/dutyid=";
            url +=  dutyid;
            url += "&duty/dutytype=";
            url += dutytype;            
            
        }else{
        	url += "&duty/dutytype=";
        	url += dutytype;
        }
        $name("dutyInfoFrame").src = url;
    }
    
    /*
     *  移动树节点的回调函数
     *  param0: arg lookup返回的值
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
     *  param0: 待移动的树节点
     *  param1: 移动的目标节点
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
	       //alert(moveParam);
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
	  *  初始化框架右边的iframe页面
	  */
     function initRightFrame() {
     
         var url = "org.gocom.abframe.org.duty.DutyInfo.flow";
         url += "?duty/dutyid=";
         
         $name("dutyInfoFrame").src = url;
     }    
     /*  
      *  初始化树移动前的方法
      */
     function initTreeBeforeMove() {
         $id("tree1").beforeMove = function(movenode, toNode) {
		     //return confirm('<b:message key="l_m_alert_confirmWill"/>' + movenode.getText() + '<b:message key="l_m_alert_moveTo"/>' + toNode.getText() + '<b:message key="l_m_alert_belowIt"/>');
		     var url = "<%=contextPath%>/abframe/org/duty/select_dialog.jsp";
		     url += '?_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
		     showModalCenter(url, "", nodeMoveCallBack, 180, 120, '<b:message key="l_title_select_oper"/>'); 
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
	    <TD width="25%" height="100%" valign="top">
	        <TABLE border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
	        <tr height="4%">
		       <td class="eos-panel-title">&nbsp;<%=duty_manager %></td>
		      </tr>	        
	        <tr><td class="eos-panel-body" valign="top">
			    <r:rtree id="tree1" width="100%">
			        <r:treeRoot icon='<%=SkinUtil.getStyleFileForTag("images/abf/duty_manager.png",request)%>' action="org.gocom.abframe.org.duty.DutyManager.queryRootDuty.biz" childEntities="duty" display="<%=duty_tree %>" initParamFunc="getParam" onClickFunc="initRightFrame">
			        </r:treeRoot>
			        <r:treeNode preload="true" nodeType="duty" submitXpath="queryDuty"   showField="dutyname" childEntities="dutys" action="org.gocom.abframe.org.duty.DutyManager.querySubDuty.biz"  
			                icon='<%=SkinUtil.getStyleFileForTag("images/abf/duty_group.png",request)%>' onDblclickFunc="dbClickNode" onClickFunc="clickNode">
				        <r:treeMenu>
		                    <r:treeMenuItem display="<%=addSubDuty%>" onClickFunc="addDuty"/>
		                    <r:treeMenuItem display="<%=refresh %>" onClickFunc="refreshNode"/>
			            </r:treeMenu>
			        </r:treeNode>
			        <r:treeNode preload="true" nodeType="dutys" submitXpath="queryDuty" showField="dutyname" childEntities="dutys" action="org.gocom.abframe.org.duty.DutyManager.querySubDutyByTemplate.biz"
			         onDblclickFunc="dbClickNode" onClickFunc="clickNode" icon='<%=SkinUtil.getStyleFileForTag("images/abf/duty.png",request)%>'>
			            <r:treeMenu>
		                    <r:treeMenuItem display="<%=addSubDuty%>" onClickFunc="addDuty"/>
		                    <r:treeMenuItem display="<%=deleteDuty %>" onClickFunc="deleteDuty"/>
		                    <r:treeMenuItem display="<%=refresh %>" onClickFunc="refreshNode"/>
			            </r:treeMenu>
			            <r:treeMove toNode="dutys" initParamFunc="getInitParam" action="org.gocom.abframe.org.duty.DutyManager.moveDutyToDuty.biz" />
			            <r:treeMove toNode="duty" initParamFunc="getInitParam" action="org.gocom.abframe.org.duty.DutyManager.moveDutyToDuty.biz" />
			        </r:treeNode>
			    </r:rtree>
     		</td></tr>
     		</TABLE>
		</TD>
		<TD width="75%" height="100%" valign="top">		    
	        <iframe frameBorder="0" style="width:100%;height:100%" scrolling="no" src="" name="dutyInfoFrame">
	        </iframe>
	    </TD>
	</TR>
</TABLE>
</body>
</html>

<script>
     //初始化页面js
	eventManager.add(window,"load",custInit);
</script>