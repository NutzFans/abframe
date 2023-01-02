<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_title_menu_tree");
	String paneltitle=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_title_menu_manager");
	String appMenu=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_appMenu");
	String addTopMenu=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_addTopMenu");
	String addSubMenu=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_addSubMenu");
	String updateMenu=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_updateMenu");
	String deleteMenu=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_deleteMenu");
	String refresh=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_refresh");
	String clearseq=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_clearseq");
%>
<head>
<title><%=title %></title> <!--菜单树 -->
<style type="text/css">
	img{
		margin:3px 1px;
		vertical-align: middle;
	}
</style>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">

<script>

//当前选中节点

var selectedNode;

function queryMenus(node)
{
	parent.window.frames["menuInfo"].location.href="org.gocom.abframe.rights.menu.MenuQuery.flow";
}
function clearMenu(node){
   var myAjax = new Ajax("org.gocom.abframe.rights.menu.MenuManager.updateMenuSeq.biz"); 
        myAjax.submit();
        var ret = myAjax.getResponseXMLDom();
        if( ret && myAjax.getValue("root/data/ret") == "true" ) {
	         alert( '<b:message key="menuManager_l_clearseqok"/>' );  //清理成功 
	    } else {
	         alert( '<b:message key="menuManager_l_clearseqfailed"/>' );         //清理失败 
        }
}
function addMenu(node)
{
	parent.window.frames["menuInfo"].$id("menuManager").getWindow().location.href="org.gocom.abframe.rights.menu.MenuQuery.flow?_eosFlowAction=addTopMenu";
}

function addSubMenu(node)
{
	parent.window.frames["menuInfo"].$id("menuManager").getWindow().location.href="org.gocom.abframe.rights.menu.MenuManager.flow?_eosFlowAction=addSubMenuInput&acmenu/menuid="+node.getProperty("menuid");
}

function updateMenu(node)
{
	parent.window.frames["menuInfo"].$id("menuManager").getWindow().location.href="org.gocom.abframe.rights.menu.MenuManager.flow?_eosFlowAction=updateMenuInput&menus[1]/menuid="+node.getProperty("menuid");
}

function deleteMenu(node)
{
	var parentNode=node.getParent();
	
    if( !confirm("<b:message key = 'menuManager_l_m_delete_menu_confim'/>\n<b:message key = 'menuManager_l_m_delete_menu_note'/>") ) <!--您确认要删除选中的菜单？\n注意：删除菜单将删除该菜单下所有子菜单。 --> 
    {
	    return;
    }
	var myAjax = null;
	myAjax = new Ajax("org.gocom.abframe.rights.menu.MenuManager.deleteMenus.biz");
	    
	//增加参数
	myAjax.addParam("menus[1]/menuid",node.getProperty("menuid"));
	    
	//开始调用
	myAjax.submit();
	    
	//取得调用后的结果(xml对象)
	var returnNode =myAjax.getResponseXMLDom();
	    
	var retCode;
	if(returnNode)
	{
		//获取指定的节点值
	    retCode = myAjax.getValue("/root/data/retCode");
	}
	    
	//判断刷新业务字典信息成败
   	if(retCode == 1)
	{
		node.getParent().reloadChild();
	}else{
	    node.getParent().reloadChild();
    }
}
</script>

<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
	<tr>       
		<td width="30%" height="100%" valign="top">
			<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
				<tr height="4%">
					<td class="eos-panel-title">&nbsp;&nbsp;<%=paneltitle%></td> <!--菜单管理 -->
				</tr>
				<tr>
				<td width="30%" height="100%" valign="top" class="eos-panel-body">
				<r:rtree height="500px" width="100%" id="menuTree" >
				  <r:treeRoot action="org.gocom.abframe.rights.menu.MenuManager.queryMenusForMenuTree.biz"  onDblclickFunc="dbClickNode"
				  	childEntities="menuList" display="<%=appMenu %>" icon='<%=SkinUtil.getStyleFileForTag("images/abf/application_home.png",request)%>'   onClickFunc="queryMenus"> <!--应用菜单 -->
				  	<r:treeMenu>
				      <r:treeMenuItem display="<%=addTopMenu %>" onClickFunc="addMenu"/><!--增加顶级菜单 -->
				      <r:treeMenuItem display="<%=clearseq %>" onClickFunc="clearMenu"/><!--清理菜单序列号 -->
				      <r:treeMenuItem display="<%=refresh %>" onClickFunc="refreshSubOrg"/><!--刷新 -->
				    </r:treeMenu>
				  </r:treeRoot>
				
				  <r:treeNode  action="org.gocom.abframe.rights.menu.MenuManager.queryMenusForMenuTree.biz"
				  	childEntities="menuList" nodeType="menuList" onClickFunc="updateMenu" onDblclickFunc="dbClickNode"
				  	onRefreshFunc="menuListRefresh" showField="menulabel" iconField="expandpath1,imagepath1" submitXpath="menu" preload="true">
				  	<r:treeMenu>
				  	  <r:treeMenuItem display="<%=addSubMenu %>" onClickFunc="addSubMenu"/><!-- 增加子菜单 -->
				      <r:treeMenuItem display="<%=updateMenu %>" onClickFunc="updateMenu"/><!-- 修改菜单  -->
				      <r:treeMenuItem display="<%=deleteMenu %>" onClickFunc="deleteMenu"/><!-- 删除菜单 -->
				      <r:treeMenuItem display="<%=refresh %>" onClickFunc="refreshSubOrg"/><!-- 刷新 -->
				    </r:treeMenu>
				    <r:treeMove toNode="menuList" action="org.gocom.abframe.rights.menu.MenuManager.moveMenu.biz"/>
				  </r:treeNode>
				</r:rtree>
				</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<script>
//配置节点展开关闭默认图标。如果iconField属性值为空，则使用下面配置图片显示，如果不配置则使用系统默认配置
var STREE_DEFAULTOPEN_ICON='<%=SkinUtil.getStyleFile("images/abf/menu.png",request)%>';
var STREE_DEFAULTCLOSE_ICON='<%=SkinUtil.getStyleFile("images/abf/menu.png",request)%>';

function menuListRefresh(node)
{
	if(node.getProperty("subcount")=="0")   //将当前节点设置为叶子节点
	 node.setLeaf(true)
}

/* afterShowMenu事件,在弹出菜点后被触发,传入参数 
   node:弹出菜单的树节点对象.
   menu:菜单对象.
*/
$id("menuTree").afterShowMenu=function(node,menu)
{
   if(!node.isRootNode()){
   	 if(node.getProperty("isleaf")=="y")
     {
       menu.removeMenuItem("<%=addSubMenu %>");//删除菜单项
     }
   }
}

//不允许移动节点到叶子节点
$id('menuTree').isCanMove=function(node,tonode)
{
	if(tonode.getProperty("isleaf")!=="n") return false;
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

//刷新选中节点
function refreshSubOrg(node){
	node.reloadChild();
}

//定义两个全局变量记录移动前的from和to节点,用于更新节点的subcount属性，
// 因为移动后不会重新load这两个节点，否则需要重新load整棵树或者他们的父节点才能更新节点属性，这样树的展现方式不太友好
var fromNode;
var toNode;

//移动前确认
$id("menuTree").beforeMove = function(movenode, tonode) {
	//给fromNode和toNode节点赋值
	fromNode = movenode.getParent();
	toNode = tonode;
	//alert(fromNode.getEntity())
	//alert(toNode.getEntity())

	<!--#确认要将“***“移动到”***下面吗？ -->
	return confirm("<b:message key = 'l_m_alert_confirmWill'/>"+movenode.getText()+"<b:message key = 'l_m_alert_moveTo'/>"+tonode.getText()+"<b:message key = 'l_m_alert_belowIt'/>");
}

//移动后更新from和to节点
$id("menuTree").afterMove = function(ajax) {
	//获取返回值
    var returnNode = ajax.getResponseXMLDom();
    if( returnNode ) {
    	//判断移动操作调用的逻辑流执行是否正确
        if( ajax.getValue("root/data/oprResult") != 1 ) {
        	alert( "移动节点失败" );
        	//返回false，不执行刷新
        	return false;
        }
    } else {
        alert( "移动节点失败" );
        return false;
    }

    //to节点subcount+1
	var toSubcount = (toNode.getProperty("subcount"))*1+1;
	toNode.getEntity().setProperty("subcount",toSubcount);

	//fromNode可能是树的根节点，可能没有subcount属性
	try {
		//from节点subcount-1
		var fromSubcount = (fromNode.getProperty("subcount"))*1-1;
		fromNode.getEntity().setProperty("subcount",fromSubcount);
	} catch(e) {

	}
	//返回true执行刷新
	return true;
}

</script>
</body>
</html>

<SCRIPT language="javascript">
    //初始化树的高度
    eventManager.add(window,"load",custInit);
	function custInit(){
        var height = document.body.clientHeight - TREE_MODIFY_HEIGHT;
		$id("menuTree").style.height =height;
	}
</SCRIPT>