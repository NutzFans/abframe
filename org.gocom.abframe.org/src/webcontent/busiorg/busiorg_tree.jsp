<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<%
	String contextPath = request.getContextPath();
	//获取标签中使用的国际化资源信息
	String manager=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_title_busiorg_manager");
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_title_busiorg_tree");
	String addSubBusiorg=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_addSubBusiorg");
	String addVirtualSubBusiorg=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_addVirtualSubBusiorg");
	String addBusidomain=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_addBusidomain");
	String busiorg=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_busiorg");
	String refresh=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_refresh");
	String deleteBusiorg=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_deleteBusiorg");
	String deleteBusidomain=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_deleteBusidomain");
%>
<title><%=title%></title> <!--业务机构树 -->
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">

<script>
//被选中节点，用于节点刷新
var selectedNode;

   //增加业务机构
 function addBusiorg(node) {
     selectedNode = node;
     var url = "org.gocom.abframe.org.busiorg.SubBusiOrgMaintain.flow";
     url += "?_eosFlowAction=insert";
     url += "&org/nodetype=actual";
     //使用模态窗口，需要自己传递页面流级变量
     url += "&parentBusiorgid="+node.getProperty("busiorgid");     
     url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
     showModalCenter(url, "", refreshSelectedNode, 400, 200, "<b:message key = 'bizOrgManager_l_addSubBusiorg'/>");<!--新增子机构 -->
 }
   //增加虚拟子业务机构
 function addVirtualBusiorg(node) {
     selectedNode = node;
     var url = "org.gocom.abframe.org.busiorg.SubBusiOrgMaintain.flow";
     url += "?_eosFlowAction=insert";
     url += "&org/nodetype=virtual";
     //使用模态窗口，需要自己传递页面流级变量
     url += "&parentBusiorgid="+node.getProperty("busiorgid");
     url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
     showModalCenter(url, "", refreshSelectedNode, 400, 200, "<b:message key = 'bizOrgManager_l_addVirtualSubBusiorg'/>");<!--新增子机构 -->
 }


//新增业务套别
function addBusidomain(node) {
	selectedNode=node;
		
	var url = "org.gocom.abframe.org.busiorg.BusiDomainMaintain.flow";
    url += "?_eosFlowAction=insert";
    url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数  
	showModalCenter(url,null,refreshSelectedNode,300,200,"<%=addBusidomain%>"); <!--新增业务套别 -->
}

//更新本业务机构或业务套别
function updateBusiorg(node){
	if(node.getProperty("orglevel")=="1") {
		//更新业务套别
		var params = "&isBusidomain=true&org/busiorgid="+node.getProperty("busiorgid");
		parent.window.frames["orgTabs"].location.href="org.gocom.abframe.org.busiorg.BusiOrgManager.flow?_eosFlowAction=toTab"+params;
	} else { 
		var params = "&isBusidomain=false&org/busiorgid="+node.getProperty("busiorgid");
		parent.window.frames["orgTabs"].location.href="org.gocom.abframe.org.busiorg.BusiOrgManager.flow?_eosFlowAction=toTab"+params;	
	}	
}

//显示业务套别列表
function displayBusiDomainList(node){
	parent.window.frames["orgTabs"].location.href="org.gocom.abframe.org.busiorg.BusiOrgManager.flow?_eosFlowAction=displayBusidomain";
	refreshSubOrg(node);
}

//删除业务机构
function deleteBusiorg(node){
	var parentNode=node.getParent();
	var nodeName=node.getProperty("orgname");
	if(node.getProperty("orglevel")=="1") {
		if(!confirm("<b:message key = 'bizOrgManager_l_m_delete_busidomain_confim'/>\n<b:message key = 'bizOrgManager_l_m_delete_busidomain_note'/>")){ <!--您确认要删除选中的业务机构？注意：删除业务套别将删除该业务套别下所有子业务机构。 -->
			return;
		}	
	} else {
		if(!confirm("<b:message key = 'bizOrgManager_l_m_delete_busiorg_confim'/>\n<b:message key = 'bizOrgManager_l_m_delete_busiorg_note'/>")){ <!--您确认要删除选中的业务机构？注意：删除业务机构将删除该业务机构下所有子业务机构。 -->
			return;
		}	
	}	
	var myAjax = new Ajax("org.gocom.abframe.org.busiorg.BusiOrgManager.deleteBusiorg.biz");
	myAjax.addParam("org/busiorgid", node.getProperty("busiorgid"));
	myAjax.submit();
	var returnNode =myAjax.getResponseXMLDom()
    if( returnNode ) {
        if( myAjax.getValue("root/data/oprResult") == 1 ) {
            alert( '<b:message key="l_m_delete_success"/>' );  <!--  删除成功 -->
        } else {
            alert( '<b:message key="l_m_delete_fail"/>' );     <!-- 删除失败 -->  
        }
    } else {
        alert( '<b:message key="l_m_delete_fail"/>' );     <!-- 删除失败 -->   
    }
	parentNode.reloadChild();
}

//刷新选中节点
function refreshSelectedNode(node){	
 	selectedNode.reloadChild();
}

//刷新节点
function refreshSubOrg(node){
	node.reloadChild();
}

</script>


<table align="left" border="0" height="100%" width="100%" cellpadding="0" cellspacing="0">
<tr >
	<td height="22px;" class="eos-panel-title">&nbsp;<%=manager%></td>
</tr>
<tr>
<td class="eos-panel-body" valign="top">
<r:rtree id="orgTree" width="100%">
  <r:treeRoot action="org.gocom.abframe.org.busiorg.BusiOrgManager.queryBusiOrgForTree.biz"  onDblclickFunc="dbClickNode"
  	childEntities="orgList" display = "<%=busiorg%>" icon='<%=SkinUtil.getStyleFileForTag("images/abf/application_home.png",request)%>'  onClickFunc="displayBusiDomainList"><!-- 业务机构 --> 
    <r:treeMenu>
  	  <r:treeMenuItem display="<%=addBusidomain%>" onClickFunc="addBusidomain"/> <!--新增业务套别 -->
	  <r:treeMenuItem display="<%=refresh%>" onClickFunc="refreshSubOrg"/> <!--刷新 -->
    </r:treeMenu>
  </r:treeRoot>
  	
  <r:treeNode preload="true" action="org.gocom.abframe.org.busiorg.BusiOrgManager.queryBusiOrgForTree.biz" 
  	childEntities="orgList" nodeType="orgList" onClickFunc="updateBusiorg" onDblclickFunc="dbClickNode"
  	onRefreshFunc="orgListRefresh" showField="orgname" icon='<%=SkinUtil.getStyleFileForTag("images/abf/busorg_tree.png",request)%>' submitXpath="org">
  	<r:treeMenu> 
  	  <r:treeMenuItem display="<%=addSubBusiorg%>" onClickFunc="addBusiorg"/> <!--新增子机构 -->
  	  <r:treeMenuItem display="<%=addVirtualSubBusiorg%>" onClickFunc="addVirtualBusiorg"/> <!--新增子虚拟机构 -->
      <r:treeMenuItem display="<%=deleteBusiorg%>" onClickFunc="deleteBusiorg"/> <!--删除业务机构 -->
      <r:treeMenuItem display="<%=deleteBusidomain%>" onClickFunc="deleteBusiorg"/> <!--删除业务套别 -->
	  <r:treeMenuItem display="<%=refresh%>" onClickFunc="refreshSubOrg"/> <!--刷新 -->
    </r:treeMenu>
    <r:treeMove toNode="orgList" initParamFunc="getInitParam"  action="org.gocom.abframe.org.busiorg.BusiOrgManager.moveOrCopyBusiorgToBusiorg.biz"/>
  </r:treeNode>
</r:rtree>
</td>
</tr>
</table>

<script>

//刷新节点时将调用此方法，注意此方法更新了一级节点图标，用以区分业务套别节点
function orgListRefresh(node)
{
	if(node.getProperty("subcount")=="0")   //将当前节点设置为叶子节点
	 node.setLeaf(true)
	 
	if(node.getProperty("orglevel")=="1")   //更改业务套别图标
	 node.setIcon('<%=SkinUtil.getStyleFile("images/abf/busorg_two.png",request)%>');
}

/* afterShowMenu事件,在弹出菜点后被触发,传入参数 
   node:弹出菜单的树节点对象.
   menu:菜单对象.
*/

$id("orgTree").afterShowMenu=function(node,menu)
{
   if(node.entity.name!='root'){
	   if(node.getProperty("orglevel")=="1"){
	       menu.removeMenuItem("<%=deleteBusiorg%>"); //删除菜单项(业务机构)
	   }else{
	   	   menu.removeMenuItem("<%=deleteBusidomain%>"); //删除菜单项（业务套别）
	   }
   }
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
//让用户选择是复制还是移动节点
$id('orgTree').beforeMove=function(node,toNode)
{
	m=node;
	mt=toNode;
	//让用户选择是复制还是移动节点,并调用setOperation方法重启移动操作																  <!--请选择操作 -->
	showModalCenter("<%=contextPath %>/abframe/org/workgroup/select_dialog.jsp?_ts="+(new Date()).getTime(),null,setOperation, 168, 100,"<b:message key='workgroupManager_l_selectOperation'/>");
	//返回false，先取消移动操作
	return false;
}

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
</script>

</body>
</html>

<SCRIPT language="javascript">
    //初始化树的高度
    eventManager.add(window,"load",custInit);
	function custInit(){  
        var height = document.body.clientHeight-TREE_MODIFY_HEIGHT;
		$id("orgTree").style.height =height;
	}
</SCRIPT>

 