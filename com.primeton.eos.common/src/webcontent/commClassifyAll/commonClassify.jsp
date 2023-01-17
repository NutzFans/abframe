<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): 张雅兰
  - Date: 2019-05-15 16:21:16
  - Description:
-->
<head>
<title>公共费用表类型维护</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="margin: 0px;padding: 0px;overflow: hidden;width: 100%;height: 100%;">
	<div class="nui-fit">
		<div class="nui-splitter" style="width:100%;height:100%;">
		 	<!-- 左边预算组织机构树 -->
			<div size="45" showCollapseButton="true" style="background-color: ;"> 
				<br/>
				<!-- 机构树展现  start-->
				<ul id="tree1" class="nui-tree" url="com.primeton.eos.common.commClassifyType.getcommonCls.biz.ext" 
					style="width:100%;height: 90%;padding:5px;" ondrawnode="setIcon" resultAsTree ="false" expandOnLoad="0"
				    showTreeIcon="true" textField="exptypename"  dataField="departtypes" onnodeclick="click" 
				    idField="exptypeid" parentField="parexptypeid" contextMenu="#treeMenu">      
				</ul>
				
				<!-- 机构树操作  start-->
				<ul id="treeMenu" class="nui-contextmenu"  onbeforeopen="onBeforeOpen">        
					<li name="add" iconCls="icon-add"  onclick="onAddFromOrg">新增费用类型</li>
					<li name="edit" iconCls="icon-edit"  onclick="onEditNode">修改费用类型</li>
					<li name="remove" iconCls="icon-remove" onclick="onRemoveNode">删除费用类型</li>        
				</ul>
				<!-- 机构树操作  end-->
			</div>
			<!-- 右边机构详情 -->
			<div size="190" showCollapseButton="true" > 
				<div id="body_tab" class="nui-tabs" activeIndex="0" style="width:auto;height:100%" >
					<!-- 机构详情信息 -->
					<div id="detail" url="../commClassifyAll/commonClsDetail.jsp" title="费用类型详情" refreshOnClick="true">
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
	
	    //设置图片
	    function setIcon(e){
	    	e.iconCls = "icon-organization";
		}
		
		//刷新树
		function refresh(){
			var root = tree.getRootNode();
			tree.loadNode(root);
		}   
	
		function onKeyEnter(){
			search();
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
		
		//重新初始化树
		function search(){
			var json = nui.encode({});
			nui.ajax({
            	url: "com.primeton.eos.common.commClassifyType.getcommonCls.biz.ext",
            	data: json,
            	type: 'POST',
            	cache: false,
            	contentType: 'text/json',
            	success: function (text) {					 
            		var returnJson = nui.decode(text);
					if(returnJson.exception == null){
						var data = returnJson.departtypes;
						//重新加载数据
						tree.loadList(data, "exptypeid","parexptypeid");
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
		
		function click(e){
			var comexptypeid = e.node.exptypeid;
			var type = e.node.type;
			var tabs = nui.get("body_tab");
			//获取当前激活的机构
			var tab = tabs.getActiveTab();
			//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
			for(var i=0;i<tabs.tabs.length;i++){
				var temp_tab = tabs.tabs[i];
				if(temp_tab.title=="费用类型详情"){
					tabs.loadTab("../commClassifyAll/commonClsDetail.jsp?comexptypeid="+comexptypeid+"&type="+type, temp_tab);
				}else{
					
				}
			}
		}
		
		
		//从原有的组织机构中选择
		function onAddFromOrg(){
			var node = tree.getSelectedNode();
			nui.open({
		            url: "<%=request.getContextPath() %>/mpcommon/commClassifyAll/commontypeAddChose.jsp",
		            title: "新增公共费用类型信息", 
		            width: 730,
		            height: 210,
		            allowResize:false,
		            onload: function () {
		            	 var iframe = this.getIFrameEl();
                         iframe.contentWindow.SetData(node.exptypeid,node.type,node.exptypename);
		            },
		            ondestroy: function (action) {
		           		var iframe = this.getIFrameEl();
		            	var addNode = iframe.contentWindow.getData();
		            	/* addNode.exptypename=addNode.comexptypename;
		            	addNode.exptypeid=addNode.comexptypeid;
		            	addNode.type=addNode.type;
		            	addNode.parexptypeid=addNode.erprptTCommgrouptype.comgrouptypeid; */
		                if (action == "SUCC") {
		                	if(addNode.comexptypeid==1){
		                	
		                	}else{ 
			                	var nodes=tree.getChildNodes(tree.getRootNode());
			                	refresh()
			                	/* tree.expandNode(nodes[0]);
		    					tree.addNode(addNode, "add", node); */
		                	}
			            }
		            }
		        });
		}
		
		
		//编辑组织机构
		function onEditNode(){
			//获取当前选择的节点
			var node = tree.getSelectedNode();
			freshNode = tree.getParentNode(node);
			var comexptypeid = node.exptypeid;
			var type = node.type;
			var exptypename = freshNode.exptypename;
			nui.open({
	            url: "<%=request.getContextPath() %>/mpcommon/commClassifyAll/modifyCommonFeeType.jsp?comexptypeid="+comexptypeid+"&type="+type,
	            title: "修改费用类型信息", 
	            width: 730,
	            height: 255,
	            allowResize:false,
	            onload: function () {
	            	 var iframe = this.getIFrameEl();
                     iframe.contentWindow.SetData(node.exptypeid,node.type,node.exptypename);
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
		
		//删除预算组织机构
		function onRemoveNode(){
			var node = tree.getSelectedNode();
			//不能删除root机构
			freshNode = tree.getParentNode(node);
			var json1 = nui.encode({exptypeid:node.exptypeid,type:node.type});
			nui.ajax({
            url: "com.primeton.eos.common.commClassifyType.checkComRelationVsBudget.biz.ext",
            type: 'POST',
            data: json1,
            cache: false,
            contentType:'text/json',
            success: function (text) {
            	var returnJosn = nui.decode(text);
                var statuss = returnJosn.statuss;
                if(statuss=="0"){ 
					nui.confirm("确定要删除该费用类型?","提示",
						function (action) {
						   if (action == "ok") {
						   		var json = nui.encode({comfeetype:{"comexptypeid":node.exptypeid},type:node.type});
			        			nui.ajax({
					            	url: "com.primeton.eos.common.commClassifyType.deleteCommonFeeType.biz.ext",
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
		            	});
	            	}else{
	            		nui.alert("无法删除该费用类型")
	            	}
            	}
        	})
		}
</script>
</html>