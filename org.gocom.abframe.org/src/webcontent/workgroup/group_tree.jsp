<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<%
	String contextPath = request.getContextPath();

	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("workgroupManager_l_title_group_tree");
	String groupManage=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("workgroupManager_l_title_group_manager");
	String addGroup=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("workgroupManager_l_addGroup");
	String addPosition=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("workgroupManager_l_addPosition");
	String addEmp=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("workgroupManager_l_addEmp");
	String refresh=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_refresh");
	String deleteGroup=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("workgroupManager_l_deleteGroup");
	String deletePosition=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("workgroupManager_l_deletePosition");
%>
<title><%=title%></title>  <!--工作组树 -->
<script>
	//被选中节点
	var selectedNode;
	
	//刷新
	function refreshSubnode(node){
		node.reloadChild();
	}
	
	//双击树节点，重载树
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
	
	//刷新人员节点根据不同性别区分图片
	function empListRefresh(node)
	{
		if(node.getProperty("gender") == "m")
		{
			node.setIcon('<%=SkinUtil.getStyleFile("images/abf/user.png",request)%>');
		}else{
			node.setIcon('<%=SkinUtil.getStyleFile("images/abf/user_female.png",request)%>');
		} 
	}
	
	//功能：动态树移动时弹出模态窗口，用户选择是执行“移动”还是“复制”操作
	//实现：在beforeMove方法弹出模态窗口，提供用户选择并将选择结果返回；但由于模态窗口的实现是异步的，
	//如果在beforeMove方法中返回true，在用户选择前将立即执行默认移动操作,因而需要返回false，先停止默认移动操作
	//然后在模态窗口的回调函数setOperation方法中设置用户选择操作，然后继续执行重写的move方法
	
	//复制或移动标识
	var moveOrCopy="move";
	
	//移动操作赋初始值
	function getInitParam()
	{
	    var str = "<moveOrCopy>"+moveOrCopy+"</moveOrCopy>";
		return str;
	}
	
	var m,mt  //用于记录用户操作的移动节点及其目标节点
	//设置用户选择操作标识，并重新启动移动操作
	function setOperation(returnValue) {
		if(returnValue == "cancel"){
			return;
		}
		moveOrCopy=returnValue;
		move(m,mt)	
	}
	
	//树的移动操作覆盖方法
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
	//end对树的操作方法
	
	
	//显示工作组查询页面
	function queryGroup(node) {
		var params = "&defaultTab=queryGroup";
		parent.window.frames["groupTabs"].location.href="org.gocom.abframe.org.workgroup.WorkgroupManager.flow?_eosFlowAction=toTab"+params;
	}
	//显示GroupTabs页面
	function displayGroupTabs(node) {
		selectedNode = node;
		var params = "&defaultTab=modifySelfGroup&nodeType=group&group/groupid="+node.getProperty("groupid");
		parent.window.frames["groupTabs"].location.href="org.gocom.abframe.org.workgroup.WorkgroupManager.flow?_eosFlowAction=toTab"+params;
	}
	
	//显示岗位tab页面
	function displayPositionTabs(node) {
		selectedNode = node;
		var params = "&defaultTab=basepositioninfo&nodeType=position&position/positionid="+node.getProperty("positionid");
		parent.window.frames["groupTabs"].location.href="org.gocom.abframe.org.workgroup.WorkgroupManager.flow?_eosFlowAction=toTab"+params;
	}
	
	//增加工作组
	function addGroup(node){
		selectedNode = node;
		var title;
	    var url = "org.gocom.abframe.org.workgroup.GroupMain.flow";
	    url += "?_eosFlowAction=addGroup";
	    if(node.isRootNode()){
	    	title="<b:message key='workgroupManager_l_addGroup' />";	     	
	    }else{
	    	title="<b:message key='workgroupManager_l_addSubGroup' />";
	     	url += "&parentGroupid=";
	     	url += node.getProperty("groupid");
	    }
	     url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	     showModalCenter(url, "", refreshSelectedNode, 610, 200, title);  <!--增加子工作组 -->
	}
	
	//增加岗位
	function addPosition(node){
		selectedNode = node;
	     var url = "org.gocom.abframe.org.workgroup.GroupPositionMaintain.flow";
	     url += "?_eosFlowAction=insert";
	     url += "&parentGroupid=";
	     url += node.getProperty("groupid");
	     url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	     showModalCenter(url, "", refreshSelectedNode, 600, 200, "<b:message key='workgroupManager_l_addGroupPosition' />");    <!--增加工作组岗位 -->  
	}
	
	//增加员工
	function addEmp(node){
		selectedNode = node;  
	     
	    var url = "org.gocom.abframe.org.workgroup.GroupEmpMaintain.flow";
	    url += "?_eosFlowAction=addEmp";
	    url += "&groupID=";
	    url += node.getProperty("groupid");
	    url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	    showModalCenter(url, "", refreshSelectedNode, 550, 450, "<b:message key='workgroupManager_l_addGroupEmp' />");      <!--增加工作组员工 -->  
	}
	
	//刷新选中节点
	function refreshSelectedNode(returnValue) {
	 	selectedNode.reloadChild();
	 	
	}
	
	//增加一级工作组
	function addTopGroup(node) {
		 selectedNode=node;
	     var url = "org.gocom.abframe.org.workgroup.GroupAdd.flow";
	     url += '?_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	     showModalCenter(url, "", refreshSelectedNode, 470, 230, "<b:message key="workgroupManager_l_addGroup" />");  <!--新增工作组 -->
	}
	
	//删除工作组
	function deleteGroup(node){
		var parentNode=node.getParent();
		var nodeName=node.getProperty("groupname");
		if(confirm("<b:message key = 'workgroupManager_m_delete_group_confirm'/>\n<b:message key = 'workgroupManager_m_delete_group_note'/>")){ 
		<!--#您确认要删除选中的工作组？注意：删除工作组将删除该工作组下的所有子工作组、岗位及人员 -->
			var myAjax = new Ajax("org.gocom.abframe.org.workgroup.WorkgroupManager.deleteGroups.biz");  
			myAjax.addParam("groups[1]/groupid", node.getProperty("groupid"));
			myAjax.submit();
			var returnNode =myAjax.getResponseXMLDom()
	
	        if( returnNode ) {
	            if( (myAjax.getValue("root/data/oprResult") == 1)||(myAjax.getValue("root/data/retCode") == 1 ))
	                alert( '<b:message key="l_m_delete_success"/>' );  <!--  删除成功 -->
	            else {
	                alert( '<b:message key="l_m_delete_fail"/>' );     <!-- 删除失败 -->   
	            }
	        } else {
	            alert( '<b:message key="l_m_delete_fail"/>' );     <!-- 删除失败 -->  
	        }		
			parentNode.reloadChild();	
		}
	}
	
	//增加岗位员工
	function addPositionEmp(node){
		selectedNode = node;      
	
	    var url = "org.gocom.abframe.org.position.PositionEmp.flow";	    
	    url += "?_eosFlowAction=pageQuery";
	    url += "&emppos/omPosition/positionid=";
	    url += node.getProperty("positionid");;
	    url += "&_ts="+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	    showModalCenter(url, "", refreshSelectedNode, 550, 450, "<b:message key='workgroupManager_l_addPositionEmp' />");   <!--增加岗位员工 -->     
	}
	
	//删除岗位
	function deletePosition(node){
		var parentNode=node.getParent();
		var nodeName=node.getProperty("groupname");
		if(confirm("<b:message key = 'workgroupManager_m_delete_position_confirm'/>\n<b:message key = 'workgroupManager_m_delete_position_note'/>")){  
		<!--您确认要删除选中的工作组岗位？注意：删除工作组岗位将删除该岗位下的所有人员 -->
			var myAjax = new Ajax("org.gocom.abframe.org.position.PositionManager.deletePositions.biz");
			myAjax.addParam("pos[1]/positionid", node.getProperty("positionid"));
			myAjax.submit();
			var returnNode =myAjax.getResponseXMLDom()
	
	        if( returnNode ) {
	            if( (myAjax.getValue("root/data/oprResult") == 1)||(myAjax.getValue("root/data/retCode") == 1 ))
	                alert( '<b:message key="l_m_delete_success"/>' );  <!--  删除成功 -->
	            else {
	                alert( '<b:message key="l_m_delete_fail"/>' );     <!-- 删除失败 -->    
	            }
	        } else {
	            alert( '<b:message key="l_m_delete_fail"/>' );     <!-- 删除失败 -->  
	        }		
			parentNode.reloadChild();	
		}
	}
   /* 初始化树移动方法，因为调用了$id('groupTree')
   *
   */
   function initTreeBeforeMove() {
       //让用户选择是复制还是移动节点
		$id('groupTree').beforeMove=function(node,toNode)
		{
			m=node;
			mt=toNode;
			//传递给模态窗口，如果是工作组，则不显示复制操作
			var isGroup = false;
			if (node.getProperty("groupid")){
				isGroup = true;
			}
			//让用户选择是复制还是移动节点,并调用setOperation方法重启移动操作																  <!--请选择操作 -->
			showModalCenter("<%=contextPath %>/abframe/org/workgroup/select_dialog.jsp?_ts="+(new Date()).getTime(),isGroup,setOperation,180,120,"<b:message key='workgroupManager_l_selectOperation'/>");
			//返回false，先取消移动操作
			return false;
		}
   }
    /* load初始化函数
    *
    */   
    function custInit(){  
    	//树高度调整
        var height = document.body.clientHeight - TREE_MODIFY_HEIGHT;
		$id("groupTree").style.height =height;
		
		initTreeBeforeMove();
	}
</script>
</head>
<body leftmargin="0" topmargin="0">
<table align="left" border="0" height="100%" width="100%" cellpadding="0" cellspacing="0">
<tr >
	<td height="22px;" class="eos-panel-title">&nbsp;<%=groupManage%></td>
</tr>
<tr>
<td class="eos-panel-body" valign="top">
<r:rtree id="groupTree" width="100%">
  <r:treeRoot action="org.gocom.abframe.org.workgroup.WorkgroupManager.queryRootGroup.biz" onDblclickFunc="dbClickNode"
  	childEntities="groupList" display = "<%=title%>" icon='<%=SkinUtil.getStyleFileForTag("images/abf/application_home.png",request)%>'   onClickFunc="queryGroup">  <!-- -->
    <r:treeMenu>
  	  <r:treeMenuItem display="<%=addGroup%>" onClickFunc="addGroup"/>  <!--新增工作组 -->
	  <r:treeMenuItem display="<%=refresh%>" onClickFunc="refreshSubnode"/>  <!--刷新 -->
    </r:treeMenu>
  </r:treeRoot> 
   	
  <r:treeNode preload="true" action="org.gocom.abframe.org.workgroup.WorkgroupManager.queryGroupPositionEmpByParent.biz" onDblclickFunc="dbClickNode"
  	childEntities="groupList;positionList;empList" nodeType="groupList" onClickFunc="displayGroupTabs" 
  	onRefreshFunc="" showField="groupname" icon='<%=SkinUtil.getStyleFileForTag("images/abf/chart_organization.png",request)%>' submitXpath="group">
  	<r:treeMenu>  
  	  <r:treeMenuItem display="<%=addGroup%>" onClickFunc="addGroup"/>  <!--新增工作组 -->
  	  <r:treeMenuItem display="<%=addPosition%>" onClickFunc="addPosition"/>  <!--新增岗位 -->
      <r:treeMenuItem display="<%=addEmp%>" onClickFunc="addEmp"/>  <!--新增员工 -->
      <r:treeMenuItem display="<%=deleteGroup%>" onClickFunc="deleteGroup"/>  <!--删除工作组 -->
	  <r:treeMenuItem display="<%=refresh%>" onClickFunc="refreshSubnode"/>  <!--刷新 -->
    </r:treeMenu>
    <r:treeMove toNode="groupList" initParamFunc="getInitParam" action="org.gocom.abframe.org.workgroup.WorkgroupManager.moveOrCopyGroupToGroup.biz"/>
  </r:treeNode>
    
  <r:treeNode preload="true" action="org.gocom.abframe.org.workgroup.WorkgroupManager.queryEmpByPosition.biz" onDblclickFunc="dbClickNode"
  	childEntities="empOfPositionList" nodeType="positionList" onClickFunc="displayPositionTabs" 
  	onRefreshFunc="" showField="posiname" icon='<%=SkinUtil.getStyleFileForTag("images/abf/group.png",request)%>' submitXpath="position">
  	<r:treeMenu>  
      <r:treeMenuItem display="<%=addEmp%>" onClickFunc="addPositionEmp"/>  <!--新增员工 -->
      <r:treeMenuItem display="<%=deletePosition%>" onClickFunc="deletePosition"/>  <!--删除岗位 -->
	  <r:treeMenuItem display="<%=refresh%>" onClickFunc="refreshSubnode"/>  <!--刷新 -->
    </r:treeMenu>
    <r:treeMove toNode="groupList" initParamFunc="getInitParam" action="org.gocom.abframe.org.workgroup.WorkgroupManager.moveOrCopyPositionToGroup.biz"/>
  </r:treeNode>  
  
  <r:treeNode  
  	childEntities="" nodeType="empList" onClickFunc="" 
  	onRefreshFunc="empListRefresh" showField="empname" icon='<%=SkinUtil.getStyleFileForTag("images/abf/user.png",request)%>' submitXpath="emp">
    <r:treeMove toNode="groupList" initParamFunc="getInitParam" action="org.gocom.abframe.org.workgroup.WorkgroupManager.moveOrCopyEmpFromGroupToGroup.biz"/>
    <r:treeMove toNode="positionList" initParamFunc="getInitParam" action="org.gocom.abframe.org.workgroup.WorkgroupManager.moveOrCopyEmpFromGroupToPosition.biz"/>
  </r:treeNode>  
  
  <r:treeNode  
  	childEntities="" nodeType="empOfPositionList" onClickFunc="" 
  	onRefreshFunc="empListRefresh" showField="empname" icon='<%=SkinUtil.getStyleFileForTag("images/abf/user.png",request)%>' submitXpath="emp">
    <r:treeMove toNode="groupList" initParamFunc="getInitParam" action="org.gocom.abframe.org.workgroup.WorkgroupManager.moveOrCopyEmpFromPositionToGroup.biz"/>
    <r:treeMove toNode="positionList" initParamFunc="getInitParam" action="org.gocom.abframe.org.workgroup.WorkgroupManager.moveOrCopyEmpFromPositionToPosition.biz"/>
  </r:treeNode>  
</r:rtree>
</td>
</tr>
</table>

</body>
</html>
<SCRIPT language="javascript">
    //初始化树的高度
    eventManager.add(window,"load",custInit);
	
</SCRIPT>