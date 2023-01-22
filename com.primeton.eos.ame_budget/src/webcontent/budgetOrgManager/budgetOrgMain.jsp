<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): shihao
  - Date: 2016-10-31 17:12:43
  - Description:
-->
<head>
<title>预算组织机构维护管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="margin: 0px;padding: 0px;overflow: hidden;width: 100%;height: 100%;">
<div class="nui-fit">
	<div class="nui-splitter" style="width:100%;height:100%;">
	 	<!-- 左边预算组织机构树 -->
		<div size="45" showCollapseButton="true" style="background-color: ;"> 
			<br/>
			<div>
				预算年度：<input class="nui-textbox"  width="40px" id="inputyear" onenter="onKeyEnter"/>
          		<a class="nui-button" style="width:40px;" onclick="search()">确认</a> 
          		<a class="nui-button" style="width:auto;" onclick="selectOrg()">初始化</a>
			</div>
			<!-- 机构树展现  start-->
			<ul id="tree1" class="nui-tree" url="com.primeton.eos.ame_budget.budgetOrgManager.getBudgetOrgTree.biz.ext" 
				style="width:100%;height: 90%;padding:5px;" ondrawnode="setIcon" resultAsTree ="false"
			    showTreeIcon="true" textField="orgname"  dataField="orgs" onnodeclick="click" 
			    idField="orgid" parentField="parentorgid" contextMenu="#treeMenu">      
			</ul>
			
			<!-- 机构树操作  start-->
			<ul id="treeMenu" class="nui-contextmenu"  onbeforeopen="onBeforeOpen">        
			    <li name="add" iconCls="icon-add" onclick="onAddNode">
					<span iconCls="icon-add">新增节点</span>
					<ul>
					    <li onclick="onAddFromOrg">从组织机构选择</li>                
			            <li onclick="onAddNew">增加全新机构</li>
					</ul>
				</li>
				<li name="edit" iconCls="icon-edit"  onclick="onEditNode">修改机构</li>
				<li name="remove" iconCls="icon-remove" onclick="onRemoveNode">删除机构</li>        
			</ul>
			<!-- 机构树操作  end-->
		</div>
		<!-- 右边机构详情 -->
		<div size="190" showCollapseButton="true" > 
			<div id="body_tab" class="nui-tabs" activeIndex="0" style="width:auto;height:100%" >
				<!-- 机构详情信息 -->
				<div id="detail" url="../budgetOrgManager/budgetOrgDetail.jsp" title="机构详情" refreshOnClick="true">
				</div>
				
				<!-- 下级机构列表 -->
				<div id="list" url="../budgetOrgManager/budgetOrgList.jsp" title="下级机构" >
				</div>
				
				<!-- 机构详情信息 -->
				<div id="empstock" url="<%=request.getContextPath() %>/ame_budget/budgetOrgManager/empstock.jsp" title="存量人员信息" refreshOnClick="true">
				</div>
			</div>
		</div>
</body>
	<script type="text/javascript">
		nui.parse();
		var tree = nui.get("tree1");
		init();
		var freshNode = null;
		var addNode = null;
		var rootNode = tree.getRootNode();
		function init(){
			//树节点
			var nodes=tree.getChildNodes(tree.getRootNode());
	    	tree.expandNode(nodes[0]);
	    	//获取下一年年份
			var d=new Date();
			var nowyear = d.getFullYear();
			nui.get("inputyear").setValue(nowyear);
			var inputyear=nui.get("inputyear").getValue();
		}
	
	    //设置图片
	    function setIcon(e){
	    	if(e.node.orgdegree == "2"){
				e.iconCls = "icon-building";
			}else if(e.node.orgdegree == "3"){
				e.iconCls = "icon-house";
			}else if (e.node.orgdegree == "1"){
				e.iconCls = "icon-bigbuilding";
			}else if (e.node.orgdegree == "4"&&e.node.orglevel == "2"){
				e.iconCls = "icon-building";
			}else{
				if(e.node.orgtype == "1"){
					e.iconCls = "icon-manage";
				}else if(e.node.orgtype == "3"){
					e.iconCls = "icon-serv";
				}else if(e.node.orgtype == "4"){
					e.iconCls = "icon-RD";
				}else if(e.node.orgtype == "5"){
					e.iconCls = "icon-market";
				}else{
					e.iconCls = "icon-house";
				}
			}
		}
		
		var orgidtemp="";
		var orgseqtemp="";
		var orgdegree="";
		var orglevel="";
		var orgtype="";
		var orgFlag="";
		function click(e){
			var year =nui.get("inputyear").getValue();
			orgidtemp=e.node.orgid;
			orgseqtemp=e.node.orgseq;
			var parentNode = tree.getParentNode(e.node);
			var pName = parentNode.orgname;
			//是否叶子节点,如果是叶子节点，将不展示机构列表
			var isLeaf = e.isLeaf;
			var tabs = nui.get("body_tab");
			//获取当前激活的机构
			var tab = tabs.getActiveTab();
			
			//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
			for(var i=0;i<tabs.tabs.length;i++){
				var temp_tab = tabs.tabs[i];
				if(temp_tab.title=="机构详情"){
					tabs.loadTab("../budgetOrgManager/budgetOrgDetail.jsp?orgid="+orgidtemp+"&budgetYear="+year+"&pName="+pName, temp_tab);
				}else if(temp_tab.title=="下级机构"){
					tabs.loadTab("../budgetOrgManager/budgetOrgList.jsp?orgid="+orgidtemp+"&budgetYear="+year+"&pName="+pName, temp_tab);
				}else{
				//判断事业部类型
					nui.ajax({
			            url: "com.primeton.eos.ame_budget.common.judgeOrgid.biz.ext",
			            type: "post",
			            data: {year:year,orgid:orgidtemp},
			            cache: false,
			            contentType: 'text/json',
			            success: function (text) {
			            	orgFlag = text.orgFlag;
			            	tabs.loadTab("<%=request.getContextPath() %>/ame_budget/budgetOrgManager/empstock.jsp?orgseq="+orgseqtemp+"&budgetYear="+year+"&orgFlag="+orgFlag+"&orgid="+orgidtemp, temp_tab);
			            }
		            });
				}
			}
			
			//刷新当前活动节点
			if(tab.title=="机构详情"){
				if(isLeaf){
					var list_tab = tabs.tabs[1];
					tabs.updateTab(list_tab, { visible: false });
				}else{
					var list_tab = tabs.tabs[1];
					if(!list_tab.visible){
						tabs.updateTab(list_tab, { visible: true });
					}
				}
				tabs.loadTab("../budgetOrgManager/budgetOrgDetail.jsp?orgid="+orgidtemp+"&budgetYear="+year+"&pName="+pName, tab);
			}else if(tab.title=="下级机构"){
				if(isLeaf){
					tabs.updateTab(tab, { visible: false });
					tabs.activeTab (tabs.tabs[0]);
				}else{
					tabs.loadTab("../budgetOrgManager/budgetOrgList.jsp?orgid="+orgidtemp+"&budgetYear="+year+"&pName="+pName, tab);
				}
			}else{
				if(isLeaf){
					var list_tab = tabs.tabs[1];
					tabs.updateTab(list_tab, { visible: false });
				}else{
					var list_tab = tabs.tabs[1];
					if(!list_tab.visible){
						tabs.updateTab(list_tab, { visible: true });
					}
				}
            	tabs.loadTab("<%=request.getContextPath() %>/ame_budget/budgetOrgManager/empstock.jsp?orgseq="+orgseqtemp+"&budgetYear="+year+"&orgFlag="+orgFlag+"&orgid="+orgidtemp, tab);
			}
		}
		
		function changeTabs(){
			 var node = tree.getSelectedNode();
			 var tabs = nui.get("body_tab");
			 var tab = tabs.getActiveTab();
			 var parentNode = tree.getParentNode(node);
			var pName = parentNode.orgname;
			var orgid=node.orgid;
			var year =nui.get("inputyear").getValue();
			if(tab.title=="机构详情"){
				if(isLeaf){
					var list_tab = tabs.tabs[1];
					tabs.updateTab(list_tab, { visible: false });
				}else{
					var list_tab = tabs.tabs[1];
					if(!list_tab.visible){
						tabs.updateTab(list_tab, { visible: true });
					}
				}
				tabs.loadTab("../budgetOrgManager/budgetOrgDetail.jsp?orgid="+orgid+"&budgetYear="+year+"&pName="+pName, tab);
			}else if(tab.title=="下级机构"){
				if(isLeaf){
					tabs.updateTab(tab, { visible: false });
					tabs.activeTab (tabs.tabs[0]);
				}else{
					tabs.loadTab("../budgetOrgManager/budgetOrgList.jsp?orgid="+orgid+"&budgetYear="+year+"&pName="+pName, tab);
					
				}
			}else{
				if(isLeaf){
					var list_tab = tabs.tabs[1];
					tabs.updateTab(list_tab, { visible: false });
				}else{
					var list_tab = tabs.tabs[1];
					if(!list_tab.visible){
						tabs.updateTab(list_tab, { visible: true });
					}
				}
            	tabs.loadTab("<%=request.getContextPath() %>/ame_budget/budgetOrgManager/empstock.jsp?orgseq="+orgseqtemp+"&budgetYear="+year+"&orgFlag="+orgFlag+"&orgid="+orgidtemp, tab);
			}
		}
		//右键菜单
		function onBeforeOpen(e) {
		    var menu = e.sender;
		    var node = tree.getSelectedNode();
		    if (!node) {
		        e.cancel = true;
		        return;
		    }
		    e.htmlEvent.preventDefault();
		}
		
		//编辑组织机构
		function onEditNode(){
			//获取当前选择的节点
			var node = tree.getSelectedNode();
			freshNode = tree.getParentNode(node);
			var year =nui.get("inputyear").getValue();
			var pseq = node.orgseq;
			var level = node.orglevel;
			var pName = freshNode.orgname;
			nui.open({
	            url: "<%=request.getContextPath() %>/ame_budget/budgetOrgManager/modifyBudgetOrg.jsp?orgid="+node.orgid+"&budgetYear="+year+"&pName="+pName,
	            title: "修改机构信息", 
	            width: 730,
	            height: 255,
	            allowResize:false,
	            onload: function () {
	            	 var iframe = this.getIFrameEl();
                     iframe.contentWindow.SetData(node.parentorgid,node.parentbudyear,pseq,level,pName);
	            },
	            ondestroy: function (action) {
	                if (action == "SUCC") {
	                	var tabs = nui.get("body_tab");
			 			var tab = tabs.getActiveTab();
			 			tabs.reloadTab(tab);
		            	search();
		            }
	            }
	        });
		}
		
		//从原有的组织机构中选择
		function onAddFromOrg(){
			var node = tree.getSelectedNode();
			var year =nui.get("inputyear").getValue();
			var pseq = node.orgseq;
			var level = node.orglevel;
			var pName = node.orgname;
			var pid = node.orgid;
			if(pid==1){
		        if(year){
			        nui.open({
			            url: "<%=request.getContextPath() %>/ame_budget/budgetOrgManager/selectOrg4BudgetAdd.jsp",
			            title: "选择组织机构", width: 300, height: 500,
			            onload: function () {
			            	 var iframe = this.getIFrameEl();
	                         iframe.contentWindow.SetData(year);
			            },
			            ondestroy: function (action) {
			            	if(action == "ok"){
				            	search();
			            	}
			            }
			        });
		        }else{
		        	alert("请填写预算年度！");
		        	return;
		        }
			}else{
				nui.open({
		            url: "<%=request.getContextPath() %>/ame_budget/budgetOrgManager/budgetOrgAddByChose.jsp",
		            title: "新增机构信息", 
		            width: 730,
		            height: 255,
		            allowResize:false,
		            onload: function () {
		            	 var iframe = this.getIFrameEl();
                         iframe.contentWindow.SetData(node.orgid,year,pseq,level,pName);
		            },
		            ondestroy: function (action) {
		                if (action == "SUCC") {
				            	var iframe = this.getIFrameEl();
				            	var data = iframe.contentWindow.getData();
				            	data = nui.decode(data);
				            	addNode = data;
		                	if(addNode.orgid==1){
		                		
		                	}else{
				            	var nodes=tree.getChildNodes(tree.getRootNode());
		    					tree.expandNode(nodes[0]);
		    					tree.addNode(addNode, "add", node);
	    					}
			            }
		            }
		        });
			}
		}
		
		//完全新增一条
		function onAddNew(){
			var node = tree.getSelectedNode();
			freshNode = node;
			var year =nui.get("inputyear").getValue();
			var pseq = node.orgseq;
			var level = node.orglevel;
			var pName = node.orgname;
			nui.open({
		            url: "<%=request.getContextPath() %>/ame_budget/budgetOrgManager/budgetOrgAdd.jsp",
		            title: "新增机构信息", 
		            width: 730,
		            height: 255,
		            allowResize:false,
		            onload: function () {
		            	 var iframe = this.getIFrameEl();
                         iframe.contentWindow.SetData(node.orgid,year,pseq,level,pName);
		            },
		            ondestroy: function (action) {
		                if (action == "SUCC") {
		                	var iframe = this.getIFrameEl();
			            	var data = iframe.contentWindow.getData();
			            	data = nui.decode(data);
			            	addNode = data;
		                	var nodes=tree.getChildNodes(tree.getRootNode());
	    					tree.expandNode(nodes[0]);
	    					tree.addNode(addNode, "add", node);
			            }
		            }
		        });
		}
		//删除预算组织机构
		function onRemoveNode(){
			var node = tree.getSelectedNode();
			//不能删除root机构
			freshNode = tree.getParentNode(node);
			nui.confirm("确定要删除该机构以及其所有子机构?","提示",
				function (action) {
				   if (action == "ok") {
				   		var json = nui.encode({orgId:node.orgid,budgetYear:node.budgetYear});
	        			nui.ajax({
			            	url: "com.primeton.eos.ame_budget.budgetOrgManager.removeBudgetOrg.biz.ext",
			            	data: json,
			            	type: 'POST',
			            	cache: false,
			            	contentType: 'text/json',
			            	success: function (text) {					 
			            		var returnJson = nui.decode(text);
								if(returnJson.exception == null){
									nui.alert("删除成功！", "系统提示",function(){
									 	tree.removeNode(node);
					              		var nodes=tree.getChildNodes(tree.getRootNode());
	    								tree.expandNode(nodes[0]);
									});
				              	}else{
				                	nui.alert("删除失败！", "系统提示", function(action){
					                  	if(action == "ok" || action == "close"){
					                    	//CloseWindow("saveFailed");
					                  	}
				                  	});
				                }  
			            	},
			            	error: function (jqXHR, textStatus, errorThrown) {
	            				CloseWindow();
			                }
			            });
            		}
            	}
            );
		}
		
		//刷新树
		function refresh(){
			var root = tree.getRootNode();
			tree.loadNode(root);
		}   
		
		function initNode(org){
			addNode = org;
		}
		
		function onKeyEnter(){
			search();
		}
		
		//重新初始化树
		function search(){
			var year =nui.get("inputyear").getValue();
			var json = nui.encode({year:year});
			nui.ajax({
            	url: "com.primeton.eos.ame_budget.budgetOrgManager.getBudgetOrgTree.biz.ext",
            	data: json,
            	type: 'POST',
            	cache: false,
            	contentType: 'text/json',
            	success: function (text) {					 
            		var returnJson = nui.decode(text);
					if(returnJson.exception == null){
						var data = returnJson.orgs;
						//重新加载数据
						tree.loadList(data, "orgid", "parentorgid");
						//设置树的展开
						var nodes=tree.getChildNodes(tree.getRootNode());
	    				tree.expandNode(nodes[0]);
	              	}else{
	                	
	                }  
            	},
            	error: function (jqXHR, textStatus, errorThrown) {
    				CloseWindow();
                }
            });

		}
		function selectOrg(){
	        var year = nui.get("inputyear").getValue();
	        if(year){
		        nui.open({
		            url: "<%=request.getContextPath() %>/ame_budget/budgetOrgManager/selectOrg4Budget.jsp",
		            title: "选择组织机构", width: 300, height: 500,
		            onload: function () {
		            	 var iframe = this.getIFrameEl();
                         iframe.contentWindow.SetData(year);
		            },
		            ondestroy: function (action) {
		            	if(action == "ok"){
			            	search();
		            	}
		            }
		        });
	        }else{
	        	alert("请填写预算年度！");
	        	return;
	        }
		}
		
	</script>
</html>