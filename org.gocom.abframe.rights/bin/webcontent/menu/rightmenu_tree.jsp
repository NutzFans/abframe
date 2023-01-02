<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuRebuild_l_title_rightmenu_tree");
	String userCustMenu=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuRebuild_l_userCustMenu");
	String appMenu=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_appMenu");
	String addTopMenu=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_addTopMenu");
	String addSubMenu=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_addSubMenu");
	String updateMenu=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_updateMenu");
	String deleteMenu=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_deleteMenu");
	String refresh=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_refresh");

%>
<head>
<title><%=title %></title><!--重组菜单管理 -->
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<script>
//被选中节点
var selectedNode;
//
function refreshUpdate(node){
	$id("targetMenuTree").getSelectNode().getParent().reloadChild();
}

function refreshInsert(node){
	$id("targetMenuTree").getSelectNode().reloadChild();
}

//选中节点为树的根节点时，
function refreshTreeNode(node) {
	$id('targetMenuTree').getRootNode().reloadChild();
}

function addTopMenu(node){
	selectedNode=node;
    var url = "org.gocom.abframe.rights.menu.MenuRebuild.flow";
    url += "?_eosFlowAction=addTopCustmenu";
    url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	showModalCenter(url,null,refreshInsert,400,300,"<b:message key = 'menuRebuild_l_addCustMenu'/>");<!--新增重组菜单 -->

}

function addSubMenu(node){
	selectedNode=node;
    var url = "org.gocom.abframe.rights.menu.MenuRebuild.flow";
    url += "?_eosFlowAction=addSubCustmenu";
    url += "&upMenu/menuid="+node.getProperty("menuid");
    url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	showModalCenter(url,null,refreshInsert,400,300,"<b:message key = 'menuRebuild_l_addCustMenu'/>");<!--新增重组菜单 -->
}

function updateMenu(node){
	selectedNode=node;
    var url = "org.gocom.abframe.rights.menu.MenuRebuild.flow";
    url += "?_eosFlowAction=updateCustmenu";
    url += "&custmenu/menuid="+node.getProperty("menuid");
    url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	showModalCenter(url,null,refreshUpdate,400,300,"<b:message key = 'menuRebuild_l_updateCustMenu'/>");<!--修改重组菜单 -->
}

function deleteMenu(node) {
	var parentNode=node.getParent();
	var nodeName=node.getProperty("menuname");
	if(!confirm("<b:message key = 'menuManager_l_m_delete_menu_confim'/>\n<b:message key = 'menuManager_l_m_delete_menu_note'/>") ) { <!--您确认要删除当前选中的菜单?\n注意：删除菜单将删除该菜单下所有子菜单。 -->
		return;
	}
	var myAjax = new Ajax("org.gocom.abframe.rights.menu.MenuRebuild.deleteCustMenu.biz");
	myAjax.addParam("menu/menuid", node.getProperty("menuid"));
	myAjax.submit();
	var returnNode =myAjax.getResponseXMLDom();
    if( returnNode ) {
        if( (myAjax.getValue("root/data/oprResult") == 1)||(myAjax.getValue("root/data/retCode") == 1 )) {
        	alert( "<b:message key="l_m_delete_success" />" );<!--删除成功！ -->
        } else {
            alert( "<b:message key="l_m_delete_fail" />" );<!--删除失败！ -->
        }
    } else {
        alert( "<b:message key="l_m_delete_fail" />" );<!--删除失败！ -->
    }
	parentNode.reloadChild();
}


function refreshSubOrg(node){
	//node.setText(""+node.getProperty("orgid")+" "+node.getProperty("orgname")+"");
	node.reloadChild();
}
</script>
	<table border="0" width="100%" class="form_table"  height="100%">
	   <TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
	   <tr height="4%">
			<td class="eos-panel-title" colspan="8">&nbsp;&nbsp;<%=title%></td><!--重组菜单管理 -->
	   </tr>
	   <TR>
		<td valign="top" >
		  <r:rtree height="100%" id="menuTree" width="220">
			  <r:treeRoot action="org.gocom.abframe.rights.menu.MenuManager.queryMenusForMenuTree.biz"  onDblclickFunc="dbClickNode"
			  	childEntities="menuList" display="<%=appMenu %>" icon='<%=SkinUtil.getStyleFileForTag("images/abf/application_home.png",request)%>'  onClickFunc=""><!--应用菜单 -->
			  </r:treeRoot>
			  <r:treeNode action="org.gocom.abframe.rights.menu.MenuManager.queryMenusForMenuTree.biz"
			  	childEntities="menuList" nodeType="menuList" onClickFunc="" onDblclickFunc="dbClickNode"
			  	onRefreshFunc="menuListRefresh" showField="menulabel" iconField="expandpath,imagepath" submitXpath="menu">
			    <r:treeMove toNode="custMenuList" action="org.gocom.abframe.rights.menu.MenuRebuild.moveMenuToCustMenu.biz" toTree="targetMenuTree" />
			  </r:treeNode>
		  </r:rtree>
		</td>
		<td valign="top" >
			<r:rtree height="100%" id="targetMenuTree" width="500" >
			  <r:treeRoot action="org.gocom.abframe.rights.menu.MenuRebuild.queryMenuForCustMenuTree.biz"  onDblclickFunc="dbClickNode"
			  	childEntities="custMenuList" display="<%=userCustMenu %>" icon='<%=SkinUtil.getStyleFileForTag("images/abf/application_home.png",request)%>' onClickFunc=""><!--用户重组菜单 -->
			      <r:treeMenu>
			      	 <r:treeMenuItem display="<%=addTopMenu %>" onClickFunc="addTopMenu"/><!--增加顶级菜单 -->
			     	 <r:treeMenuItem display="<%=refresh %>" onClickFunc="refreshSubOrg"/><!--刷新 -->
			      </r:treeMenu>
			  </r:treeRoot>
			  <r:treeNode action="org.gocom.abframe.rights.menu.MenuRebuild.queryMenuForCustMenuTree.biz"
			  	childEntities="custMenuList" nodeType="custMenuList" onClickFunc=""  onDblclickFunc="dbClickNode"
			  	onRefreshFunc="menuListRefresh" showField="menulabel" iconField="expandpath,imagepath" submitXpath="menu">
			  	<r:treeMenu>
			  	  <r:treeMenuItem display="<%=addSubMenu %>" onClickFunc="addSubMenu"/><!--增加子菜单 -->
			      <r:treeMenuItem display="<%=updateMenu %>" onClickFunc="updateMenu"/><!--修改菜单 -->
			      <r:treeMenuItem display="<%=deleteMenu %>" onClickFunc="deleteMenu"/><!--删除菜单 -->
			      <r:treeMenuItem display="<%=refresh %>" onClickFunc="refreshSubOrg"/><!--刷新 -->
			    </r:treeMenu>
			  </r:treeNode>
			</r:rtree>
		</td>
	  </tr>
	</table>
<script>
//配置节点展开关闭默认图标。如果iconField属性值为空，则使用下面配置图片显示，如果不配置则使用系统默认配置
var STREE_DEFAULTOPEN_ICON='<%=SkinUtil.getStyleFile("images/abf/menu.png",request)%>';
var STREE_DEFAULTCLOSE_ICON='<%=SkinUtil.getStyleFile("images/abf/application_home.png",request)%>';
//加载时刷新节点
function menuListRefresh(node)
{
	if(node.getProperty("subcount")=="0")   //将当前节点设置为叶子节点
	 node.setLeaf(true)
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

/* afterShowMenu事件,在弹出菜点后被触发,传入参数 
   node:弹出菜单的树节点对象.
   menu:菜单对象.
*/

$id("targetMenuTree").afterShowMenu=function(node,menu)
{
   if(node.entity.name!='root'){
	   if(node.entity.name=="custMenuList"&&node.getProperty("isleaf")=="y"){
	       menu.removeMenuItem("<%=addSubMenu%>"); //删除菜单项 (增加子菜单)
	   }
   }
}

//不允许移动到叶子节点
$id('targetMenuTree').isCanMove=function(node,tonode)
{
	if(tonode.getProperty("isleaf")!=="n") return false;
}

//定义两个全局变量记录移动前的from和to节点,用于更新节点的subcount属性，
// 因为移动后不会重新load这两个节点，否则需要重新load整棵树或者他们的父节点才能更新节点属性，这样树的展现方式不太友好
var fromNode;
var toNode;

//移动前确认
$id("menuTree").beforeMove = function(movenode, tonode) {
	//toNode节点赋值,from节点属性不需要修改
	toNode = tonode;
	fromNode = null;
	//alert(toNode.getEntity())

	<!--#确认要将“***“移动到”***下面吗？ -->
	return confirm("<b:message key = 'l_m_alert_confirmWill'/>"+movenode.getText()+"<b:message key = 'l_m_alert_moveTo'/>"+tonode.getText()+"<b:message key = 'l_m_alert_belowIt'/>");
}


//移动后更新to节点的subcount属性
$id("menuTree").afterMove = function(ajax) {
	//获取返回值
    var returnNode = ajax.getResponseXMLDom();
    if( returnNode ) {
    	//判断移动操作调用的逻辑流执行是否正确
        if( ajax.getValue("root/data/oprResult") != 1 ) {
        	alert( "移动节点失败" );
        	//返回false，不执行刷新
        	return false;
        }else {
        	alert( "移动节点成功!" );
        	$id("targetMenuTree").getSelectNode().reloadChild();
        	return false;
        }
    }

    //to节点subcount+1
	var toSubcount = (toNode.getProperty("subcount"))*1+1;
	toNode.getEntity().setProperty("subcount",toSubcount);
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
        var height = document.body.clientHeight - FINAL_PANEL_HEIGHT;
		$id("menuTree").style.height =height;
		$id("targetMenuTree").style.height =height;
	}
</SCRIPT>
