<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common.jsp"%>
<html>
<!-- 
  - Author(s): yy
  - Date: 2017-08-24 17:07:54
  - Description:
-->
<head>
<title>核查要点维护</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="margin: 0px;padding: 0px;width: 100%;height: 100%;">
	<div class="nui-fit">
	<div class="nui-splitter" style="width:100%;height:100%;">
	 	<!-- 左边核查要点树 -->
		<div size="70" showCollapseButton="true" style="background-color: ;"> 
			<br/>
			<!-- 核查要点树展现  start-->
			<ul id="tree1" class="nui-tree"  
				style="width:100%;height: 90%;padding:5px;" ondrawnode="setIcon" resultAsTree ="false"
			    showTreeIcon="true" textField="checklistshowname1"  dataField="csIncomechecklists" onnodeclick="click" onbeforedrop="onNodeBeforeDrop" 
			    idField="checklistid" parentField="parentid" contextMenu="#treeMenu"  allowDrag="true" allowDrop="true" allowLeafDropIn="true">      
			</ul>
			
			<!-- 核查要点树操作  start-->
			<ul id="treeMenu"  class="nui-contextmenu"  onbeforeopen="onBeforeOpen">
				<li name="add" iconCls="icon-add" id="onAddIc"  onclick="onAddIc">新增核查要点</li>
				<li name="addx" iconCls="icon-add" id="onAddXIc"  onclick="onAddXIc">新增下级核查要点</li>
				<li name="edit" iconCls="icon-edit" id="onEditIc"  onclick="onEditIc">修改核查要点</li>
				<li name="remove" iconCls="icon-remove" id="onRemoveIc" onclick="onRemoveIcc">删除核查要点</li>
				<li name="reload" iconCls="icon-reload" id="refresh"  onclick="refresh">刷新</li>    
			</ul>
			<!-- 核查要点树操作  end-->
		</div>
		<!-- 右边核查要点详情 -->
		<div size="190" showCollapseButton="true" > 
			<div id="body_tab" class="nui-tabs" activeIndex="0" style="width:auto;height:100%;display: none;" >
				<!-- 核查要点详情信息 -->
				<div id="prodtypedetail" url="<%=request.getContextPath() %>/ame_common/csIncomecheck/csIncomecheckDetail.jsp" title="核查要点详情信息" refreshOnClick="true">
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
		
		search();
	    //设置图片
	    function setIcon(e){
	    	if(e.node.level == "0"){
	    		e.iconCls = "icon-jcs";
	    	}else{
	    		if(e.node.iscancheck == "1"){
	    			e.iconCls = "icon-jcx";
	    		}else{
	    			e.iconCls = "icon-jcl";
	    		}
	    	}
		}
		
		function click(e){
			var checklistid = e.node.checklistid;
			//是否叶子节点
			var isleaf = tree.isLeaf(e.node);
			if(checklistid!=0){
				document.getElementById("body_tab").style.display="";
				var tabs = nui.get("body_tab");
				//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
				for(var i=0;i<tabs.tabs.length;i++){
					var temp_tab = tabs.tabs[i];
					if(temp_tab.title=="核查要点详情信息"){
						tabs.loadTab("<%=request.getContextPath() %>/ame_common/csIncomecheck/csIncomecheckDetail.jsp?checklistid="+checklistid, temp_tab);
					}
				}
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
		    if(node.checklistid=="0"){
		    	document.getElementById("onAddIc").style.display="none";
		    	document.getElementById("refresh").style.display="";
		    	document.getElementById("onEditIc").style.display="none";
			    document.getElementById("onRemoveIc").style.display="none";
		    }else{
				document.getElementById("onAddIc").style.display="";
		    	document.getElementById("refresh").style.display="";
		    	document.getElementById("onEditIc").style.display="";
		    	document.getElementById("onRemoveIc").style.display="";
		    }
		    e.htmlEvent.preventDefault();
		}
		
		/**
		*新增核查要点
		*/
		function onAddIc(){
			var node = tree.getSelectedNode();
			freshNode = tree.getParentNode(node);
			var pName = freshNode.checklistname;
			var pId = freshNode.checklistid;
			var upchecklistseq = freshNode.checklistseq;
			var pSeq = freshNode.seq;
			var level = node.level;
			nui.open({
	            url: "<%=request.getContextPath() %>/ame_common/csIncomecheck/csIncomecheckModify.jsp",
	            title: "新增核查要点", 
	            width: 600,
	            height: 390,
	            allowResize:false,
	            onload: function () {
	            	 var iframe = this.getIFrameEl();
	            	 var data = {"pId":pId,"pName":pName,"level":level,"upchecklistseq":upchecklistseq,"pSeq":pSeq};
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
		*新增下级核查要点
		*/
		function onAddXIc(){
			var node = tree.getSelectedNode();
			var pId = node.checklistid;
			var pName = node.checklistname;
			var pSeq = node.pSeq;
			var upchecklistseq = node.checklistseq;
			var level = parseFloat(node.level)+1;
			nui.open({
	            url: "<%=request.getContextPath() %>/ame_common/csIncomecheck/csIncomecheckModify.jsp",
	            title: "新增下级核查要点", 
	            width: 600,
	            height: 390,
	            allowResize:false,
	            onload: function () {
	            	 var iframe = this.getIFrameEl();
	            	 var data = {"pId":pId,"pName":pName,"level":level,"upchecklistseq":upchecklistseq,"pSeq":pSeq};
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
		**编辑核查要点
		*/
		function onEditIc(){
			var node = tree.getSelectedNode();
			freshNode = tree.getParentNode(node);
			var pName = freshNode.checklistname;
			var pId = freshNode.checklistid;
			var upchecklistseq = freshNode.checklistseq;
			var pSeq = freshNode.seq;
			var level = node.level;
			var checklistid = node.checklistid;
			var iscancheck = node.iscancheck;
			var sortno = node.sortno;
			var sortno = node.sortno;
			var checklistname = node.checklistname;
			var checklistseq = node.checklistseq;
			var checklistshowname = node.checklistshowname;
			nui.open({
	            url: "<%=request.getContextPath() %>/ame_common/csIncomecheck/csIncomecheckModify.jsp",
	            title: "编辑核查要点", 
	            width: 600,
	            height: 390,
	            allowResize:false,
	            onload: function () {
	            	 var iframe = this.getIFrameEl();
	            	 var data = {"pId":pId,"pName":pName,"level":level,"upchecklistseq":upchecklistseq,"pSeq":pSeq,"checklistshowname":checklistshowname,
	            	 "checklistid":checklistid,"iscancheck":iscancheck,"sortno":sortno,"checklistseq":checklistseq,"checklistname":checklistname};
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
		**删除产品
		*/
		function onRemoveIcc(){
			//获取当前选择的节点
			var node = tree.getSelectedNode();
			var checklistid = node.checklistid;
	        var json = nui.encode({"checklistid":checklistid});
		    nui.ajax({
		    	url: "com.primeton.eos.ame_common.csIncomecheck.deleteCsIncomecheck.biz.ext",
		        type: "post",
		        data: json, 
		        cache: false,
		        contentType: 'text/json',
		        success: function (text) {
		   			var result = text.result;
			       	if(result=='2'){
			       		alert("该节点下面还有其他数据，不能删除此节点！");
			       }else if(result=='1'){
			       		alert("删除成功！");
			       		search();
			       }else{
			       		alert("删除失败！");
			       }
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
			if(Node.checklistid=="0"){
				alert("此节点不能被拖拽！");
				e.cancel=true;
			}else{
				if(confirm("确认要将'"+Node.checklistname+"'移动到'"+toNode.checklistname+"'下面吗？")){
					menuDrag(e);
				}else{
					e.cancel=true;
				}
			}
		}
		
		
		//实现拖拽功能
		function menuDrag(e){
			//获取当前选择的节点
			var checklist = e.dragNode;//节点
			var json = nui.encode({'to':toNode,'from':fromNode,'checklist':checklist});
			$.ajax({ 
	            url: "com.primeton.eos.ame_common.csIncomecheck.moveCsIncomeChecklist.biz.ext",
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
            	url: "com.primeton.eos.ame_common.csIncomecheck.queryCsIncomecheck.biz.ext",
            	data: json,
            	type: 'POST',
            	cache: false,
            	contentType: 'text/json',
            	success: function (text) {					 
            		var returnJson = nui.decode(text);
					if(returnJson.exception == null){
						var data = returnJson.csIncomechecklists;
						//重新加载数据
						tree.loadList(data, "checklistid", "parentid");
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
</script>
</html>