<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common.jsp"%>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2017-08-24 17:07:54
  - Description:
-->
<head>
<title>菜单管理</title>
<style type="text/css">
</style>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="margin: 0px;padding: 0px;width: 100%;height: 100%;">
	<div class="nui-fit">
	<div class="nui-splitter" style="width:100%;height:100%;">
	 	<!-- 左边预算组织机构树 -->
		<div size="55" showCollapseButton="true" style="background-color: ;"> 
			<br/>
			<!-- 机构树展现  start-->
			<ul id="tree1" class="nui-tree"  
				style="width:100%;height: 90%;padding:5px;"  imgField="imagepath1" resultAsTree ="false" showTreeIcon="true" 
				textField="menuname"  dataField="newMenus" onnodeclick="click"  idField="menuid" parentField="parentsid" contextMenu="#treeMenu"  
				allowDrag="true" allowDrop="true" allowLeafDropIn="true" onbeforedrop="onNodeBeforeDrop" >      
			</ul>
			
			<!-- 机构树操作  start-->
			<ul id="treeMenu"  class="nui-contextmenu"  onbeforeopen="onBeforeOpen">
				<li name="save" iconCls="icon-add" id="onAddTopOrg"  onclick="onAddTopOrg">增加顶级菜单</li>
				<li name="clear" iconCls="icon-goto" id="refresh"  onclick="clearMenu">清理菜单序列号</li>       
				<li name="add" iconCls="icon-add" id="onAddFromOrg"  onclick="onAddFromOrg">增加子菜单</li>        
				<li name="edit" iconCls="icon-edit" id="quoProd"  onclick="onEditNode">修改菜单</li>
				<li name="remove" iconCls="icon-remove" id="onEditNode"  onclick="onRemoveNode">删除菜单</li>
				<li name="reload" iconCls="icon-reload" id="onRemoveNode" onclick="refresh">刷新</li>
			</ul>
			<!-- 机构树操作  end-->
		</div>
		<!-- 右边机构详情 -->
		<div size="190" showCollapseButton="true" > 
			<div id="prod_tab" class="nui-tabs" activeIndex="0" style="width:auto;height:100%" >
				<div name="query" id="prodList" url="<%=request.getContextPath() %>/abframe/rights/newMenu/queryNewMenu.jsp" title="菜单查询" refreshOnClick="true">
				</div>
				<div name="detail" id="prodList1" url="<%=request.getContextPath() %>/abframe/rights/newMenu/modifyNewMenu.jsp" title="菜单详情" refreshOnClick="true">
				</div>
				<div name="select" id="prodList2" url="<%=request.getContextPath() %>/abframe/rights/newMenu/queryMenuRole.jsp" title="授权详情 " refreshOnClick="true">
				</div>
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
		var tabs1 = nui.get("prod_tab");
		top["win"]=window;
		
		search();
		tabs1.updateTab("detail",{visible:false});
		tabs1.updateTab("select",{visible:false})
		
		function click(e){
			var menuid = e.node.menuid;
			var isleaf = e.node.isleaf;
			var parentNode = tree.getParentNode(e.node);
			var pName = parentNode.menuname;
			if(menuid == "0"){
				document.getElementById("onAddTopOrg").style.display="";
				document.getElementById("refresh").style.display="";
				document.getElementById("onRemoveNode").style.display="";
				document.getElementById("onAddFromOrg").style.display="none";
				document.getElementById("quoProd").style.display="none";
				document.getElementById("onEditNode").style.display="none";
				
				var tabs = nui.get("prod_tab");
				tabs1.updateTab("detail",{visible:false});
				tabs1.updateTab("select",{visible:false});
				tabs1.updateTab("query",{visible:true});
				tabs1.setActiveIndex(0);
				//获取当前激活的机构
				var tab = tabs.getActiveTab();
				//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
				for(var i=0;i<tabs.tabs.length;i++){
					var temp_tab = tabs.tabs[i];
					if(temp_tab.title=="菜单查询"){
						tabs.loadTab("<%=request.getContextPath() %>/abframe/rights/newMenu/queryNewMenu.jsp", temp_tab);
					}
				}
			
				//获取当前激活的机构
				var tab1 = tabs.getActiveTab();
				//刷新当前活动节点
				if(tab1.title=="菜单查询"){
					tabs.loadTab("<%=request.getContextPath() %>/abframe/rights/newMenu/queryNewMenu.jsp", tab1);
				}
				tabs.reloadTab();
			}else{
				if(isleaf=='y'){
					document.getElementById("onAddTopOrg").style.display="none";
					document.getElementById("refresh").style.display="none";
					document.getElementById("onRemoveNode").style.display="";
					document.getElementById("onAddFromOrg").style.display="none";
					document.getElementById("quoProd").style.display="";
					document.getElementById("onEditNode").style.display="";
				}else{
					document.getElementById("onAddTopOrg").style.display="none";
					document.getElementById("refresh").style.display="none";
					document.getElementById("onRemoveNode").style.display="";
					document.getElementById("onAddFromOrg").style.display="";
					document.getElementById("quoProd").style.display="";
					document.getElementById("onEditNode").style.display="";
				}
				var tabs = nui.get("prod_tab");
				if(isleaf=='y'){
					tabs1.updateTab("query",{visible:false});
					tabs1.updateTab("detail",{visible:true});
					tabs1.updateTab("select",{visible:true});
					tabs1.setActiveIndex(1);
				}else{
					tabs1.updateTab("query",{visible:false});
					tabs1.updateTab("detail",{visible:true});
					tabs1.updateTab("select",{visible:false});
					tabs1.setActiveIndex(1);
				}
				//获取当前激活的机构
				var tab = tabs.getActiveTab();
				//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
				for(var i=0;i<tabs.tabs.length;i++){
					var temp_tab = tabs.tabs[i];
					var title = temp_tab.title;
					var name = temp_tab.name;
					if(title == '菜单详情'){
						tabs.loadTab("<%=request.getContextPath() %>/abframe/rights/newMenu/modifyNewMenu.jsp?menuid="+menuid+"&pName="+pName, temp_tab);
					} 
					if(name=='select'){
						tabs.loadTab("<%=request.getContextPath() %>/abframe/rights/newMenu/queryMenuRole.jsp?menuid="+menuid, temp_tab);
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
		    if(node.menuid=="0"){
		    	document.getElementById("onAddTopOrg").style.display="";
				document.getElementById("refresh").style.display="";
				document.getElementById("onRemoveNode").style.display="";
				document.getElementById("onAddFromOrg").style.display="none";
				document.getElementById("quoProd").style.display="none";
				document.getElementById("onEditNode").style.display="none";
		    }else{
		    	if(isleaf=='y'){
					document.getElementById("onAddTopOrg").style.display="none";
					document.getElementById("refresh").style.display="none";
					document.getElementById("onRemoveNode").style.display="";
					document.getElementById("onAddFromOrg").style.display="none";
					document.getElementById("quoProd").style.display="";
					document.getElementById("onEditNode").style.display="";
				}else{
					document.getElementById("onAddTopOrg").style.display="none";
					document.getElementById("refresh").style.display="none";
					document.getElementById("onRemoveNode").style.display="";
					document.getElementById("onAddFromOrg").style.display="";
					document.getElementById("quoProd").style.display="";
					document.getElementById("onEditNode").style.display="";
				}
		    }
		    e.htmlEvent.preventDefault();
		}
		
		//编辑产品分类
		function onEditNode(){
			//获取当前选择的节点
			var node1 = tree.getSelectedNode();
			freshNode = tree.getParentNode(node1);
			node1.acMenu1 = freshNode;
			var data1 = node1;
			data1.fangs = null;
			nui.open({
	            url: "<%=request.getContextPath() %>/abframe/rights/newMenu/modifyNewMenu.jsp",
	            title: "菜单录入", 
	            width: 400,
	            height: 420,
	            allowResize:false,
	            onload: function () {
	            	 var iframe = this.getIFrameEl();
                     iframe.contentWindow.SetData(data1);
	            },
	            ondestroy: function (action) {
	                if (action == "ok") {
		            	search();
		            }
	            }
	        });
		}
		
		//从原有的组织机构中选择
		function onAddFromOrg(){
			//获取当前选择的节点
			var node = tree.getSelectedNode();
			var data = node;
			data.fangs = '1';
			nui.open({
	            url: "<%=request.getContextPath() %>/abframe/rights/newMenu/modifyNewMenu.jsp",
	            title: "菜单录入", 
	            width: 400,
	            height: 420,
	            allowResize:false,
	            onload: function () {
	            	 var iframe = this.getIFrameEl();
                     iframe.contentWindow.SetData(data);
	            },
	            ondestroy: function (action) {
	                if (action == "ok") {
		            	search();
		            }
	            }
	        });
		}
		
		/**
		*新增顶级产品分类
		*/
		function onAddTopOrg(){
			var node = tree.getSelectedNode();
			nui.open({
	            url: "<%=request.getContextPath() %>/abframe/rights/newMenu/addTopMenu.jsp",
	            title: "新增顶级产品分类", 
	            width: 400,
	            height: 340,
	            allowResize:false,
	            ondestroy: function (action) {
	            	search();
	            }
	     	});
		}
		
		
		//删除产品分类
		function onRemoveNode(){
			if( !confirm("您确认要删除选中的菜单？\n注意：删除菜单将删除该菜单下所有子菜单。") ) { <!--您确认要删除选中的菜单？\n注意：删除菜单将删除该菜单下所有子菜单。 --> 
			    return;
		    }
		    var menus = [];
		    var node = tree.getSelectedNode();
		    var menuid = node.menuid;
		    var menu = {"menuid":menuid};
		    menus[0] = menu;
			var json = nui.encode({'menus':menus});
			$.ajax({ 
	            url: "org.gocom.abframe.rights.menu.MenuManager.deleteMenus.biz.ext",
	            type: 'POST',
	            data: json,
	            cache: false,
	            contentType:'text/json',
	            cache: false,
	            success: function (text) {
	              var retCode = text.retCode;
	              if(retCode=="1"){
	              	alert("删除成功！");
	              	search();
	              }else{
	              	alert("删除失败！");
	              }
	            }
	     	});			
		}
		
	
		
		function clearMenu(){
	        var json = nui.encode({});
	        nui.ajax({
                url: "org.gocom.abframe.rights.menu.MenuManager.updateMenuSeq.biz.ext",
                type: "post",
                data: json, 
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	if(text.ret == "true"){
                		alert( '清理成功 !' );//清理成功 
                	}else{
                		alert( '清理失败 ' );//清理失败 
                	}
                },
                error: function () {
                }
            });
		}
		
		//定义两个全局变量记录移动前的from和to节点,用于更新节点的subcount属性，
		//因为移动后不会重新load这两个节点，否则需要重新load整棵树或者他们的父节点才能更新节点属性，这样树的展现方式不太友好
		var fromNode;
		var toNode;
		function onNodeBeforeDrop(e){
			Node =e.dragNode;//拖拽节点
			fromNode = tree.getParentNode(Node);
			toNode =e.dropNode;//投放节点
			if(fromNode.menuid=="0"){
				alert("此节点不能被拖拽！");
				e.cancel=true;
			}else{
				if(confirm("确认要将'"+Node.menuname+"'移动到'"+toNode.menuname+"'下面吗？")){
					menuDrag(e);
				}else{
					e.cancel=true;
				}
			}
		}
		
		
		//实现拖拽功能
		function menuDrag(e){
			//获取当前选择的节点
			var menuList = e.dragNode;//节点
			var json = nui.encode({'to':toNode,'from':fromNode,'menuList':menuList});
			$.ajax({ 
	            url: "org.gocom.abframe.rights.menu.MenuManager.moveMenu.biz.ext",
	            type: 'POST',
	            data: json,
	            cache: false,
	            contentType:'text/json',
	            cache: false,
	            success: function (text) {
	            	var oprResult = text.oprResult;
	            	if(oprResult != 1){
	            		alert( "移动节点失败" );
	            		return;
	            	}else if(text==null||text==""){
	            		alert( "移动节点失败" );
	            		return;
	            	}else{
	            		alert("移动节点成功");
	            		refresh();
	            	}
	            }
	     	});	
			
		}
		
		//刷新树
		function refresh(){
			search();
		}   
	
		function onKeyEnter(){
			search();
		}
		
		//重新初始化树
		function search(){
			var json = nui.encode({});
			nui.ajax({
            	url: "org.gocom.abframe.rights.menu.newMenu.queryNewMenu.biz.ext",
            	data: json,
            	type: 'POST',
            	cache: false,
            	contentType: 'text/json',
            	success: function (text) {					 
            		var returnJson = nui.decode(text);
					if(returnJson.exception == null){
						var data = returnJson.newMenus;
						//重新加载数据
						tree.loadList(data, "menuid", "parentsid");
						//设置树的展开
						var nodes=tree.getChildNodes(tree.getRootNode());
	    				tree.expandNode(nodes[0]);
	    				var tabs = nui.get("prod_tab");
						tabs1.updateTab("detail",{visible:false});
						tabs1.updateTab("select",{visible:false});
						tabs1.updateTab("query",{visible:true});
						tabs1.setActiveIndex(0);
	              	}else{
	                }  
            	},
            	error: function (jqXHR, textStatus, errorThrown) {
    				CloseWindow();
                }
            });

		}
</script>
</html>