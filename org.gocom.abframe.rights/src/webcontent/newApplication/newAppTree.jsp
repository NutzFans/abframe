<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s):zhang-yb
  - Date: 2018-03-14 11:09:43
  - Description:
-->
<head>
<title>应用管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{margin: 0;padding: 0;width: 100%;height: 100%;}
</style>
</head>
<body>
<div class="nui-fit">
	<div class="nui-splitter" style="width:100%;height:100%;">
	 	<!-- 左边预算组织机构树 -->
		<div size="55" showCollapseButton="true" style="background-color: ;"> 
			<br/>
			<!-- 机构树展现  start-->
			<ul id="tree1" class="nui-tree" style="width:100%;height: 90%;padding:5px;" ondrawnode="onDrawNode"  resultAsTree ="false"
				showTreeIcon="true"  textField="appname"  dataField="newFunTree"   idField="seq" onnodeclick="click" onbeforedrop="onNodeBeforeDrop"
				parentField="parentid"  contextMenu="#treeMenu" allowDrag="true" allowDrop="true" allowLeafDropIn="true" expandOnLoad="false">      
			</ul>
			
			<!-- 机构树操作  start-->
			<ul id="treeMenu"  class="nui-contextmenu"  onbeforeopen="onBeforeOpen">
				<li name="saveApp" iconCls="icon-add" id="saveApp"  onclick="saveApp">新增应用</li>
				<li name="saveAdd" iconCls="icon-add" id="saveAdd"  onclick="saveAdd">新增功能组</li>
				<li name="saveAddSon" iconCls="icon-add" id="saveAddSon"  onclick="saveAddSon">新增子功能组</li>
				<li name="saveAddApp" iconCls="icon-add" id="saveAddApp"  onclick="saveAddApp">新增功能</li>
				<li name="removeApp" iconCls="icon-remove" id="removeApp"  onclick="removeApp">删除应用</li>
				<li name="removeAdd" iconCls="icon-remove" id="removeAdd"  onclick="removeAdd">删除功能组</li>
				<li name="reload" iconCls="icon-reload" id="reload" onclick="refresh">刷新</li>
			</ul>
			<!-- 机构树操作  end-->
		</div>
		<!-- 右边机构详情 -->
		<div size="190" showCollapseButton="true" > 
			<div id="prod_tab" class="nui-tabs" activeIndex="0" style="width:auto;height:100%">
				<div name="appLists" url="<%=request.getContextPath() %>/abframe/rights/newApplication/appLists.jsp" title="应用列表" refreshOnClick="true"></div>
				<div name="appInfo" url="<%=request.getContextPath() %>/abframe/rights/newApplication/appInfo.jsp" title="应用信息" refreshOnClick="true"></div>
				<div name="listInfo" url="<%=request.getContextPath() %>/abframe/rights/newApplication/listInfo.jsp" title="功能组信息" refreshOnClick="true"></div>
				<div name="appList"  url="<%=request.getContextPath() %>/abframe/rights/newApplication/appList.jsp" title="功能组列表" refreshOnClick="true"></div>
				<div name="sonAppList" url="<%=request.getContextPath() %>/abframe/rights/newApplication/sonAppList.jsp" title="子功能组列表" refreshOnClick="true"></div>
				<div name="appInfoList" url="<%=request.getContextPath() %>/abframe/rights/newApplication/appInfoList.jsp" title="功能列表" refreshOnClick="true"></div>
				<div name="authConfig" url="<%=request.getContextPath() %>/abframe/rights/newApplication/authConfig.jsp" title="权限配置" refreshOnClick="true"></div>
				<div name="appInfos" url="<%=request.getContextPath() %>/abframe/rights/newApplication/appInfos.jsp" title="功能信息" refreshOnClick="true"></div>
				<div name="zyList" url="<%=request.getContextPath() %>/abframe/rights/newApplication/zyList.jsp" title="资源列表" refreshOnClick="true"></div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var tree = nui.get("tree1");
	var freshNode = null;
	var addNode = null;
	var rootNode = tree.getRootNode();
	var tabs = nui.get("prod_tab");
	search();
	
	tabs.updateTab("appInfo",{visible:false});
	tabs.updateTab("appList",{visible:false})
	tabs.updateTab("sonAppList",{visible:false});
	tabs.updateTab("appInfoList",{visible:false});
	tabs.updateTab("listInfo",{visible:false});
	tabs.updateTab("appInfos",{visible:false});
	tabs.updateTab("zyList",{visible:false});
	tabs.updateTab("authConfig",{visible:false});
	//重新初始化树
	function search(){
		nui.ajax({
        	url: "org.gocom.abframe.rights.role.newAppTree.queryNewAppTree.biz.ext",
        	type: 'POST',
        	cache: false,
        	contentType: 'text/json',
        	success: function (text) {					 
        		//重新加载数据
				var returnJson = nui.decode(text.newAppTree);
    			tree.loadList(returnJson, "seq", "parentid");
    			//tree.sortBy("appname","asc");
    			
    			//设置树的展开
				var nodes=tree.getChildNodes(tree.getRootNode());
				tree.expandNode(nodes[0]);
        	},
        	error: function (jqXHR, textStatus, errorThrown) {
				CloseWindow();
            }
        });
	}
	
	function click(e){
		var imagePath = e.node.imagepath;
		var parentid = e.node.parentid;
		var appid1 = e.node.appid1;
		var appid = e.node.appid;
		var funcgroupid = e.node.funcgroupid;
		if(imagePath == "null"){
			
			tabs.updateTab("appLists",{visible:true});
			tabs.updateTab("appInfo",{visible:false});
			tabs.updateTab("appList",{visible:false})
			tabs.updateTab("sonAppList",{visible:false});
			tabs.updateTab("appInfoList",{visible:false});
			tabs.updateTab("listInfo",{visible:false});
			tabs.updateTab("appInfos",{visible:false});
			tabs.updateTab("zyList",{visible:false});
			tabs.updateTab("authConfig",{visible:false});
			tabs.setActiveIndex(0);
			//获取当前激活的机构
			//var tab = tabs.getActiveTab();
			//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
			for(var i=0;i<tabs.tabs.length;i++){
				var temp_tab = tabs.tabs[i];
				if(temp_tab.title=="应用列表"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/rights/newApplication/appLists.jsp", temp_tab);
				}
			}
			tabs.reloadTab();
					
		}else if(imagePath == "application"){
			tabs.updateTab("appInfo",{visible:true});
			tabs.updateTab("appList",{visible:true})
			tabs.updateTab("appLists",{visible:false});
			tabs.updateTab("sonAppList",{visible:false});
			tabs.updateTab("appInfoList",{visible:false});
			tabs.updateTab("listInfo",{visible:false});
			tabs.updateTab("appInfos",{visible:false});
			tabs.updateTab("zyList",{visible:false});
			tabs.updateTab("authConfig",{visible:false});
			tabs.setActiveIndex(1);
			//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
			for(var i=0; i < tabs.tabs.length; i++){
				var temp_tab = tabs.tabs[i];
				if(temp_tab.title=="应用信息"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/rights/newApplication/appInfo.jsp?appid="+appid, temp_tab);
				}else if(temp_tab.title=="功能组列表"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/rights/newApplication/appList.jsp?appid="+appid, temp_tab);
				}
			}
			tabs.reloadTab();
			
		}else if(imagePath == "bricks"){
			
			tabs.updateTab("listInfo",{visible:true});
			tabs.updateTab("sonAppList",{visible:true});
			tabs.updateTab("appInfoList",{visible:true});
			tabs.updateTab("appInfo",{visible:false});
			tabs.updateTab("appList",{visible:false});
			tabs.updateTab("appLists",{visible:false});
			tabs.updateTab("appInfos",{visible:false});
			tabs.updateTab("zyList",{visible:false});
			tabs.updateTab("authConfig",{visible:false});
			
			tabs.setActiveIndex(2);
			
			//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
			
			for(var i=0; i < tabs.tabs.length; i++){
				var temp_tab = tabs.tabs[i];
				if(temp_tab.title=="功能组信息"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/rights/newApplication/listInfo.jsp?appid="+appid+"&funcgroupid="+funcgroupid, temp_tab);
				}else if(temp_tab.title=="子功能组列表"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/rights/newApplication/sonAppList.jsp?appid="+appid, temp_tab);
				}else if(temp_tab.title=="功能列表"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/rights/newApplication/appInfoList.jsp?appid="+appid, temp_tab);
				}
			}
			tabs.reloadTab();
		}else if(imagePath == "application_form"){
		
			tabs.updateTab("appInfo",{visible:false});
			tabs.updateTab("appList",{visible:false})
			tabs.updateTab("appLists",{visible:false})
			tabs.updateTab("sonAppList",{visible:false});
			tabs.updateTab("appInfoList",{visible:false});
			tabs.updateTab("listInfo",{visible:false});
			tabs.updateTab("appInfos",{visible:true});
			tabs.updateTab("zyList",{visible:true});
			tabs.updateTab("authConfig",{visible:true});
			tabs.setActiveIndex(6);
			
			//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
			
			for(var i=0; i < tabs.tabs.length; i++){
				var temp_tab = tabs.tabs[i];
				if(temp_tab.title=="功能信息"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/rights/newApplication/appInfos.jsp?appid="+appid, temp_tab);
				}else if(temp_tab.title=="资源列表"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/rights/newApplication/zyList.jsp?appid="+appid, temp_tab);
				}else if(temp_tab.title=="权限配置"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/rights/newApplication/authConfig.jsp?appid="+appid+"&funcgroupid="+funcgroupid+"&appid1="+appid1, temp_tab);
				}
			}
			tabs.reloadTab();
		}
	}
	
	
	//右键菜单
	function onBeforeOpen(e) {
	    var menu = e.sender;
	    var node = tree.getSelectedNode();
	    var isleaf = node.isleaf;
	    if (!node) {
	        e.cancel = true;
	        return;
	    }
	    if(node.parentid == "0"){
	    
	    	document.getElementById("saveApp").style.display="";
	    	document.getElementById("reload").style.display="";
	    	document.getElementById("saveAdd").style.display="none";
	    	document.getElementById("removeAdd").style.display="none";
	    	document.getElementById("saveAddSon").style.display="none";
	    	document.getElementById("saveAddApp").style.display="none";
	    	document.getElementById("removeApp").style.display="none";
	    	
	    }else {
	    	if(isleaf=='n' && node.parentid == null){
	    	
				document.getElementById("saveAdd").style.display="";
		    	document.getElementById("removeApp").style.display="";
		    	document.getElementById("reload").style.display="";
		    	document.getElementById("saveApp").style.display="none";
		    	document.getElementById("removeAdd").style.display="none";
		    	document.getElementById("saveAddSon").style.display="none";
		    	document.getElementById("saveAddApp").style.display="none";
		    	
		    }else if(isleaf=='n' && node.parentid != null){
		    
		    	document.getElementById("saveAddSon").style.display="";
		    	document.getElementById("removeAdd").style.display="";
		    	document.getElementById("saveAddApp").style.display="";
		    	document.getElementById("reload").style.display="";
		    	document.getElementById("saveApp").style.display="none";
		    	document.getElementById("saveAdd").style.display="none";
		    	document.getElementById("removeApp").style.display="none";
		    }else{
		    	e.cancel = true;
		    	e.htmlEvent.preventDefault();
		    	return;
		    }
	    
	    }
	    e.htmlEvent.preventDefault();
	}
	
	//新增应用
	function saveApp(){
		var addUrl = "<%=request.getContextPath() %>/abframe/rights/newApplication/addApp.jsp?status=0";
        nui.open({
            url: addUrl,
            title: "新增应用", 
            width:600,
            height:300,
            onload: function () {
        		var iframe = this.getIFrameEl();
             	iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	refresh();
            }
        });
	}
	
	//删除应用
	function removeApp(){
		if( !confirm("您确认要删除选中的应用么？\n注意：删除应用将删除该应用下所有功能组。") ) {
		    return;
	    }
	    var node = tree.getSelectedNode();
		var json = {application:{appid:node.appid}};
		nui.ajax({
			url:'org.gocom.abframe.rights.application.ApplicationManager.deleteApplication.biz.ext',
			data:json,
			type:'post',
			dataType:'json',
			success:function(res){
				if(res.appDeleteResult == '-1'){
					nui.alert("删除失败，请联系信息技术部。")
				}else{
					nui.alert("删除成功。")
					reset();
				}
				
			},
			error:function(res){
			
			}
		})		
	}
	
	//新增功能组
	function saveAdd(){
		//获取当前选择的节点
		var node = tree.getSelectedNode();
		var appid = node.appid;
		var addUrl = "<%=request.getContextPath() %>/abframe/rights/newApplication/addApps.jsp?status=0&appid="+appid;
        nui.open({
            url: addUrl,
            title: "新增功能组", 
            width:400,
            height:200,
            onload: function () {
        		var iframe = this.getIFrameEl();
             	iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	search();
	            }
            }
        });
	}
	
	//删除功能组
	function removeAdd(){
        if( !confirm("您确认要删除选中的功能组么？\n注意：删除功能组将删除该功能组下所有子功能组。") ) {
		    return;
	    }
	    var node = tree.getSelectedNode();
	 	var json = {funcGroup:{funcgroupid:node.appid}};
		nui.ajax({
			url:'org.gocom.abframe.rights.application.FuncGroupManager.deleteFuncGroup.biz.ext',
			data:json,
			type:'post',
			dataType:'json',
			success:function(res){
				if(res.funcGroupDelResult){
					nui.alert("删除成功。")
					search();
				}
			}
		})
	}
	
	//新增子功能组
	function saveAddSon(){
		var node = tree.getSelectedNode();
		var appid = node.appid;
		var addUrl = "<%=request.getContextPath() %>/abframe/rights/newApplication/addAppss.jsp?status=0&appid="+appid;
        nui.open({
            url: addUrl,
            title: "新增子功能组", 
            width:400,
            height:200,
            onload: function () {
        		var iframe = this.getIFrameEl();
             	iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	search();
	            }
            }
        });
	}
	
	//新增功能
	function saveAddApp(){
		var node = tree.getSelectedNode();
		var appid = node.appid;
		var addUrl = "<%=request.getContextPath() %>/abframe/rights/newApplication/addAppsss.jsp?status=0&appid="+appid;
        nui.open({
            url: addUrl,
            title: "新增功能", 
            width:700,
            height:300,
            onload: function () {
        		var iframe = this.getIFrameEl();
             	iframe.contentWindow.setData(0);
            },
            ondestroy: function (action) {
            	if (action == "save") {
                	search();
	            }
            }
        });
	}
	
	//设置图片
    function setIcon(e){
    	if(e.node.isprod == "0"){
    		if(e.node.prodtypeid == "0"){
    			e.iconCls = "icon-quoprodtypetree";
    		}else{
    			e.iconCls = "icon-quoprodtype";
    		}
    	}else{
    		if(e.node.prodstatus == "1"){
    			e.iconCls = "icon-prod-on";
    		}else{
    			e.iconCls = "icon-prod-down";
    		}
    	}
	}
	
	//定义两个全局变量记录移动前的from和to节点,用于更新节点的subcount属性，
	//因为移动后不会重新load这两个节点，否则需要重新load整棵树或者他们的父节点才能更新节点属性，这样树的展现方式不太友好
	var fromNode;
	var toNode;
	function onNodeBeforeDrop(e){
		fromNode = e.dragNode;//暂定源节点——功能
		toNode = e.dropNode;//投放节点
		if(fromNode.imagepath == "null"){
			nui.alert("此节点不能被拖拽！");
			e.cancel=true;
		}else if(fromNode.imagepath == "bricks"){
			if(toNode.imagepath == "application"){
				e.cancel=true;
				return;
			}
			Node =e.dragNode;//移动节点
			Nodes = e.dropNode;//目标节点
			fromNode = tree.getParentNode(Node);
			if(Node.grouplevel == "1"){
				if(confirm("确认要将'("+Node.appname+")'移动到'("+Nodes.appname+")'下面吗？")){
					appDrag(e,2);
				}else{
					e.cancel=true;
				}
			}else{
				if(confirm("确认要将'("+Node.appname+")'移动到'("+Nodes.appname+")'下面吗？")){
					appDrag(e,4);
				}else{
					e.cancel=true;
				}
			}
			
		}else if(fromNode.imagepath == "application"){
			nui.alert("此节点不能被拖拽！");
			e.cancel=true;
		}else if(fromNode.imagepath == "application_form"){
			Node =e.dragNode;
			fromNode = tree.getParentNode(Node);
			toNode =e.dropNode;//投放节点
			if(toNode.imagepath == "application"){
				e.cancel=true;
				return;
			}
			if(toNode.grouplevel == "1"){
				if(confirm("确认要将'("+Node.appname+")'移动到'("+toNode.appname+")'下面吗？")){
					appDrag(e,1);
				}else{
					e.cancel=true;
				}
			}else{
				if(confirm("确认要将'("+Node.appname+")'移动到'("+toNode.appname+")'下面吗？")){
					appDrag(e,3);
				}else{
					e.cancel=true;
				}
			}
		}
	}
	
	//实现拖拽功能 
	function appDrag(e,s){
		if(s=="1"){
			//获取当前选择的节点   功能移动到一级节点
			var funcList = e.dragNode;//节点
			var json = nui.encode({'to':toNode,'from':fromNode,'funcList':{'funccode':funcList.appid,'funcname':funcList.appname}});
			$.ajax({ 
	            url: "org.gocom.abframe.rights.application.FuncGroupManager.moveFuncToFuncgroup.biz.ext",
	            type: 'POST',
	            data: json,
	            contentType:'text/json',
	            success: function (text) {
	            	//refresh();
	            }
	     	});	
		}else if(s=="2"){
			//获取当前选择的节点  移动的工作组是一级节点
			var funcGroupList = e.dragNode;//节点
			var json = nui.encode({'to':{'funcgroupid':toNode.funcgroupid,'funcgroupseq':toNode.funcgroupseq,"subcount":toNode.subcount,"grouplevel":toNode.grouplevel,"acApplication":fromNode},
									'from':fromNode,
									'funcGroupList':{"funcgroupid":funcGroupList.funcgroupid,'funcgroupseq':funcGroupList.funcgroupseq,"subcount":funcGroupList.subcount,
										"grouplevel":funcGroupList.grouplevel,"acApplication":fromNode
									}});
			$.ajax({ 
	            url: "org.gocom.abframe.rights.application.FuncGroupManager.moveFuncGroupToFuncGroup.biz.ext",
	            type: 'POST',
	            data: json,
	            contentType:'text/json',
	            success: function (text) {
	            	//refresh();
	            }
	     	});
		}else if(s=="3"){
			//获取当前选择的节点 功能移动到非一级节点
			var funcList = e.dragNode;//节点
			var json = nui.encode({'to':toNode,'from':fromNode,'funcList':{'funccode':funcList.appid,'funcname':funcList.appname}});
			$.ajax({ 
	            url: "org.gocom.abframe.rights.application.FuncGroupManager.moveFuncToSubFuncGroup.biz.ext",
	            type: 'POST',
	            data: json,
	            contentType:'text/json',
	            success: function (text) {
	            	//refresh();
	            }
	     	});
		}else if(s == "4"){
			//获取当前选择的节点  移动的工作组非一级节点
			var funcGroupList = e.dragNode;//节点
			var json = nui.encode({'to':{'funcgroupid':toNode.funcgroupid,'funcgroupseq':toNode.funcgroupseq,"subcount":toNode.subcount,"grouplevel":toNode.grouplevel,"acApplication":{"appid":toNode.appid1},},
									'from':fromNode,
									'subFuncGroupList':{"funcgroupid":funcGroupList.funcgroupid,'funcgroupseq':funcGroupList.funcgroupseq,"subcount":funcGroupList.subcount,
										"grouplevel":funcGroupList.grouplevel,"acApplication":{"appid":toNode.appid1}
									}});
			$.ajax({
	            url: "org.gocom.abframe.rights.application.FuncGroupManager.moveSubFuncGroupToFuncGroup.biz.ext",
	            type: 'POST',
	            data: json,
	            contentType:'text/json',
	            success: function (text) {
	            	//refresh();
	            }
	     	});
		}
	}

	
	
	function onDrawNode(e) {
        var imagepath= e.node.imagepath;
    	if(imagepath == 'null'){
    		e.iconCls = "icon-expand";
    	}else if(imagepath == 'application' || imagepath == 'bricks'){
            e.iconCls = "icon-organization";
        }else{
            e.iconCls = "icon-collapse";
        }
    }
	
	//刷新树
	function refresh(){
		search();
	}   

	function onKeyEnter(){
		search();
	}
</script>
</html>