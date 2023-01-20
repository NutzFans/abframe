<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String appFunc_manager = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_title_appFunc_manager");
	String application_add = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_applicationAdd");
	String funcGroup_add = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_funcGroupAdd");
	String subfuncGroup_add = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_subFuncGroupAdd");
	String application_delete = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_appDelete");
    String application_import = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_import");
	String funcGroup_delete = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_funcGroupDelete");
	String refresh = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_refresh");
	String addFunction = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_functionAdd");//新增功能
%>
 
<script>
	// 新增应用
  	function addApp() {
		var url = "org.gocom.abframe.rights.application.ApplicationManager.flow";
		url = url + "?_eosFlowAction=add";
    	url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
    	
    	//弹出新增应用模态框
    	showModalCenter(url, "", callBackTypeAdd, 500, 220, '<%=application_add %>');//增加应用
  	}
	
	//新增完成回调函数
	function callBackTypeAdd()
    {
    	$id("DTree").getRootNode().reloadChild();
    }
    
    //查询应用
  	function queryApp(node){
    	parent.window.frames["IFRAMEAppFuncInfo"].location.href="org.gocom.abframe.rights.application.ApplicationManager.flow?_eosFlowAction=entry&appid="+node.getProperty("appid");
  	} 
	
	//删除应用
  	function deleteAppAjax(node){
		var parentNode=node.getParent();
		if(confirm('<b:message key="applicationManager_m_appdelete_confirm"/>')){
			var myAjax = new Ajax("org.gocom.abframe.rights.application.ApplicationManager.deleteApplication.biz");
			myAjax.addParam("application/appid", node.getProperty("appid"));
			myAjax.submit();
			var returnNode =myAjax.getResponseXMLDom();

			if( returnNode ) {
	        	if( myAjax.getValue("root/data/appDeleteResult") == 1 ) {
	                alert('<b:message key="applicationManager_m_delete_success"/>');
	        	} else {
	                alert('<b:message key="applicationManager_m_delete_failure"/>');
	          	}

	    	}
	    	//刷新树更节点
			callBackTypeAdd(); 
		}
  	} 
  	//导入功能
	function importApp(node){	  
	  var url = "org.gocom.abframe.tools.MetaDataManager.flow?appid="+node.getProperty("appid") + '&_ts='+(new Date()).getTime();
	  showModalCenter(url, "", callBackFuncGroup, 600, 220, '<b:message key="applicationManager_l_import"/>');//增加功能组 
	}
	//call
	//查询功能
  	function queryFunc(node)
  	{
    	parent.window.frames["IFRAMEAppFuncInfo"].location.href="org.gocom.abframe.rights.application.ApplicationManager.flow?_eosFlowAction=auto";
  	} 

	//查询功能组信息及其子功能组列表
  	function queryFuncGroup(node)
  	{
    	parent.window.frames["IFRAMEAppFuncInfo"].location.href="org.gocom.abframe.rights.application.FunctionGroupManager.flow?_eosFlowAction=entry&funcgroupid="+node.getProperty("funcgroupid");
  	} 

	//新增功能组
	function addFuncGroup(node)
	{
		var url = "org.gocom.abframe.rights.application.FunctionGroupManager.flow";
		url = url + "?_eosFlowAction=add";
		url = url + "&appid="+node.getProperty("appid");
		url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
		    	
		//弹出新增功能组模态框
		showModalCenter(url, "", callBackFuncGroup, 500, 220, '<%=funcGroup_add%>');//增加功能组 
	} 
	
	//新增完成回调函数
	function callBackFuncGroup()
    {
    	$id("DTree").getSelectNode().reloadChild();
    }
   	
   	//增加功能
   	function addFunction(node)
   	{
   		var url="org.gocom.abframe.rights.application.FunctionAdd.flow?_eosFlowAction=add&funcgroupid="+node.getProperty("funcgroupid");
		showModalCenter(url,null,null,500,200,'<b:message key="applicationManager_l_functionAdd"></b:message>');
   	}
   	
   	//新增子功能组 
  	function addSubFuncGroup(node)
  	{
   	 	var url = "org.gocom.abframe.rights.application.FuncGroupSubAdd.flow";
		url = url + "?_eosFlowAction=add";
		url = url + "&funcgroupid="+node.getProperty("funcgroupid");
		url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
		    	
		//弹出新增功能组模态框
		showModalCenter(url, "", callBackFuncGroup, 450, 200, '<%=subfuncGroup_add%>');//增加子功能组
  	}
  	
	//删除功能组
  	function deleteFuncGroup(node)
  	{
    	var parentNode=node.getParent();
		if(confirm('<b:message key="applicationManager_m_functdelete_confirm"/>')){
			var myAjax = new Ajax("org.gocom.abframe.rights.application.FuncGroupManager.deleteFuncGroup.biz");
			myAjax.addParam("funcGroup/funcgroupid", node.getProperty("funcgroupid"));
			myAjax.submit();
			var returnNode =myAjax.getResponseXMLDom();

			if( returnNode ) {
	        	if( myAjax.getValue("root/data/funcGroupDelResult") == 1 ) {
	                alert('<b:message key="applicationManager_m_delete_success"/>');
	        	} else {
	                alert('<b:message key="applicationManager_m_delete_failure"/>');
	          	}
	    	}
       		parentNode.reloadChild(); // 刷新父节点
        	if(node.getProperty("grouplevel") > 1){ //若删除的功能组不是一级功能组节点，刷新父节点的同时查询父节点
          		parentFuncgroupid = parentNode.getProperty("funcgroupid");
          		parent.window.frames["IFRAMEAppFuncInfo"].location.href="org.gocom.abframe.rights.application.FunctionGroupManager.flow?_eosFlowAction=query&funcgroupid="+parentFuncgroupid;
        	}
    	}
	}

  	function queryFuncResource(node)
  	{
    	parent.window.frames["IFRAMEAppFuncInfo"].location.href="org.gocom.abframe.rights.application.ResourceManager.flow?_eosFlowAction=entry&funccode="+node.getProperty("funccode");
  	}
	
	//刷新根
  	function refresh(root)
  	{
    	window.parent.frames["IFRAMEAppFuncTree"].location.reload();
  	} 
	
	//刷新节点
  	function refreshNode(node)
  	{
    	node.reloadChild();
  	} 
	
	//双击树节点，重载树
  	function dbClickNode(node)
  	{
		if(node.isExpanded()){
	   		node.collapseNode(); //关闭当前节点
		}else{
	   		node.expandNode(); //展开当前节点的下级子节点
	 	}
  	} 

  	/*
   	*  自定义初始化树高度
   	*/
  	function custInit()
  	{
    	var height = document.body.clientHeight - FINAL_PANEL_HEIGHT;
    	$id("DTree").style.height =height;
  	}
</script>

</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
	<tr>       
		<td width="30%" height="100%" valign="top">
			<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
				<tr height="4%">
					<td class="eos-panel-title">&nbsp;&nbsp;<%=appFunc_manager%></td>
				</tr>
				<tr>
				<td width="25%" height="100%" valign="top" class="eos-panel-body">
				<r:rtree height="500px" id="DTree" width="100%">
				  <r:treeRoot action="org.gocom.abframe.rights.application.ApplicationMaintain.getAppAll.biz" childEntities="appList" display="<%=appFunc_manager%>" 
				    onClickFunc="queryFunc" icon='<%=SkinUtil.getStyleFileForTag("images/abf/root.png",request)%>' >
				    <r:treeMenu>
				      <r:treeMenuItem display="<%=application_add%>" onClickFunc="addApp"/>
				      <r:treeMenuItem display="<%=refresh%>" onClickFunc="refresh"/>
				    </r:treeMenu>
				  </r:treeRoot>
				
				  <r:treeNode nodeType="appList" showField="appname" action="org.gocom.abframe.rights.application.ApplicationMaintain.getFuncGroup.biz" 
				  submitXpath="funcGroupTemp" childEntities="funcGroupList" onClickFunc="queryApp" onDblclickFunc="dbClickNode" 
				   icon='<%=SkinUtil.getStyleFileForTag("images/abf/application.png",request)%>' preload="true">
				    <r:treeMenu>
				      <r:treeMenuItem display="<%=funcGroup_add%>" onClickFunc="addFuncGroup"/>
				      <r:treeMenuItem display="<%=application_delete%>" onClickFunc="deleteAppAjax"/>
				      <r:treeMenuItem display="<%=application_import%>" onClickFunc="importApp"/>
				      <r:treeMenuItem display="<%=refresh%>" onClickFunc="refreshNode"/>
				    </r:treeMenu>
				  </r:treeNode>
				  
				  <r:treeNode nodeType="funcGroupList" showField="funcgroupname" 
				  action="org.gocom.abframe.rights.application.ApplicationMaintain.getSubFuncGroupAndFunc.biz" submitXpath="subFuncGroupTemp" 
				  childEntities="subFuncGroupList;funcList" onClickFunc="queryFuncGroup" onDblclickFunc="dbClickNode" preload="true" 
				  icon='<%=SkinUtil.getStyleFileForTag("images/abf/function_group_open.png",request)+","+SkinUtil.getStyleFileForTag("images/abf/function_group_close.png",request)%>' >
				    <r:treeMenu>
				      <r:treeMenuItem display="<%=subfuncGroup_add%>" onClickFunc="addSubFuncGroup"/>
				      <r:treeMenuItem display="<%=funcGroup_delete%>" onClickFunc="deleteFuncGroup"/>
				      <r:treeMenuItem display="<%=addFunction%>" onClickFunc="addFunction"/>
				      <r:treeMenuItem display="<%=refresh%>" onClickFunc="refreshNode"/>
				    </r:treeMenu>
				    <r:treeMove toNode="subFuncGroupList" action="org.gocom.abframe.rights.application.FuncGroupManager.moveFuncGroupToFuncGroup.biz"/>
				    <r:treeMove toNode="funcGroupList" action="org.gocom.abframe.rights.application.FuncGroupManager.moveFuncGroupToFuncGroup.biz"/>
				  </r:treeNode>
				
				  <r:treeNode nodeType="subFuncGroupList" showField="funcgroupname" 
				  action="org.gocom.abframe.rights.application.ApplicationMaintain.getSubFuncGroupAndFunc.biz" submitXpath="subFuncGroupTemp" 
				  childEntities="subFuncGroupList;funcList" onClickFunc="queryFuncGroup" onDblclickFunc="dbClickNode"  preload="true"
				  icon='<%=SkinUtil.getStyleFileForTag("images/abf/function_group_open.png",request)+","+SkinUtil.getStyleFileForTag("images/abf/function_group_close.png",request)%>' >
				    <r:treeMenu>
				      <r:treeMenuItem display="<%=subfuncGroup_add%>" onClickFunc="addSubFuncGroup"/>
				      <r:treeMenuItem display="<%=funcGroup_delete%>" onClickFunc="deleteFuncGroup"/>
				      <r:treeMenuItem display="<%=addFunction%>" onClickFunc="addFunction"/>
				      <r:treeMenuItem display="<%=refresh%>" onClickFunc="refreshNode"/>
				    </r:treeMenu>
				    <r:treeMove toNode="funcGroupList" action="org.gocom.abframe.rights.application.FuncGroupManager.moveSubFuncGroupToFuncGroup.biz"/>
				    <r:treeMove toNode="subFuncGroupList" action="org.gocom.abframe.rights.application.FuncGroupManager.moveSubFuncGroupToFuncGroup.biz"/>
				 </r:treeNode>
				 
				  <r:treeNode nodeType="funcList" showField="funcname" preload="true" onClickFunc="queryFuncResource" icon='<%=SkinUtil.getStyleFileForTag("images/abf/function.png",request)%>' >
				    <r:treeMove toNode="funcGroupList" action="org.gocom.abframe.rights.application.FuncGroupManager.moveFuncToFuncgroup.biz"/>
				    <r:treeMove toNode="subFuncGroupList" action="org.gocom.abframe.rights.application.FuncGroupManager.moveFuncToSubFuncGroup.biz"/>
				  </r:treeNode>
				</r:rtree>
				</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
</html>

<script>
     //初始化页面js
	eventManager.add(window,"load",custInit);
</script>