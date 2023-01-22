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
<title>月度指标统计报表模型维护</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="margin: 0px;padding: 0px;width: 100%;height: 100%;">
	<div class="nui-fit">
	<div class="nui-splitter" style="width:100%;height:100%;">
	 	<!-- 月度指标统计报表模型维护树 -->
		<div size="54" showCollapseButton="true" style="background-color: ;"> 
			<br/>
			<!-- 左边报表指标展现  start-->
			<ul id="tree1" class="nui-tree" style="width:100%;height: 90%;padding:5px;"
				ondrawnode="setIcon" resultAsTree ="false" showTreeIcon="true" textField="reportquotaname"
			    idField="quotaseq" parentField="parentquotacode"  dataField="reportquotaname" onnodeclick="click"  
			    onbeforedrop="onNodeBeforeDrop" contextMenu="#treeMenu"  allowDrag="true" allowDrop="true" allowLeafDropIn="true">      
			</ul>
			
			<!-- 月度指标统计报表模型维护树操作  start-->
			<ul id="treeMenu"  class="nui-contextmenu"  onbeforeopen="onBeforeOpen">
				<li name="addReport" iconCls="icon-add" id="onAddReport"  onclick="onAddReport">新增报表</li>
				<li name="addReportQuota" iconCls="icon-add" id="onAddReportQuota"  onclick="onAddReportQuota">新增指标项</li>
				<li name="addXReportQuota" iconCls="icon-add" id="onAddXReportQuota"  onclick="onAddXReportQuota">新增下级指标项</li>
				<li name="remove" iconCls="icon-remove" id="onRemoveReportQuota" onclick="onRemoveReportQuota">删除指标项</li>
				<li name="remove2" iconCls="icon-remove" id="onRemoveReport" onclick="onRemoveReport">删除报表</li>
				<li name="refresh" iconCls="icon-reload" id="onRefresh"  onclick="refresh">刷新</li>    
			</ul>
			<!-- 核查要点树操作  end-->
		</div>
		<!-- 右边指标详情 -->
		<div size="190" showCollapseButton="true" >
			<div id="body_tab" class="nui-tabs" style="width:100%;height:100%">
			    <div name="queryReportQuotas" url="<%=request.getContextPath() %>/importExcel/queryReportQuotas.jsp" title="月度统计指标值查询与维护" refreshOnClick="true"></div>
				<div name="ReportPropertyDef" url="<%=request.getContextPath() %>/ame_common/ameReport/ReportPropertyDef.jsp" title="报表属性定义" refreshOnClick="true"></div>
				<div name="ReportQuotaPropertyDef" url="<%=request.getContextPath() %>/ame_common/ameReport/ReportQuotaPropertyDef.jsp" title="指标项属性定义" refreshOnClick="true"></div>
				<div name="ReportQuotadetail" url="<%=request.getContextPath() %>/ame_common/ameReport/ReportQuotadetail.jsp" title="指标项列表" ></div>
			</div>
		</div>
	</div>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
		var tree = nui.get("tree1");
		var tabs = nui.get("body_tab");
		tabs.updateTab("queryReportQuotas",{visible:true});
		tabs.updateTab("ReportPropertyDef",{visible:false});
		tabs.updateTab("ReportQuotaPropertyDef",{visible:false});
		tabs.updateTab("ReportQuotadetail",{visible:false});
	
		search();
	    //设置图片
	    function setIcon(e){
	    	if(e.node._level == "0"){
	    		e.iconCls = "icon-jcs";
	    	}else{
	    		if(e.node.parentquotacode =='.0.'){
	    			e.iconCls = "icon-jcx";
	    		}else{
	    			e.iconCls = "icon-jcl";
	    		}
	    	}
		}
		function click(e){
			var quotaseq = e.node.quotaseq;
			var parentquotacode = e.node.parentquotacode;
			var reportcode = e.node.reportcode;
			var reportquotaname = e.node.reportquotaname;
			if(quotaseq!='.0.'){
				if(parentquotacode =='.0.'){
				   tabs.updateTab("queryReportQuotas",{visible:false});
				   tabs.updateTab("ReportPropertyDef",{visible:true});
				   tabs.updateTab("ReportQuotaPropertyDef",{visible:false});
				   tabs.updateTab("ReportQuotadetail",{visible:true});
				   tabs.setActiveIndex(1);
				   //当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
				   for(var i=0;i<tabs.tabs.length;i++){
					  var temp_tab = tabs.tabs[i];
					  if(temp_tab.name == "ReportPropertyDef"){
					      title = reportquotaname +"报表属性定义";
                          tabs.updateTab (temp_tab,{title:title})
						  tabs.loadTab("<%=request.getContextPath() %>/ame_common/ameReport/ReportPropertyDef.jsp?reportcode="+reportcode, temp_tab);
					  }else if(temp_tab.name=="ReportQuotadetail"){
						  tabs.loadTab("<%=request.getContextPath() %>/ame_common/ameReport/ReportQuotadetail.jsp?quotaseq="+quotaseq+"&reportcode="+reportcode+"&parentquotacode="+parentquotacode, temp_tab);
					  }
				    }
				    tabs.reloadTab();
				}else{
				   tabs.updateTab("queryReportQuotas",{visible:false});
				   tabs.updateTab("ReportPropertyDef",{visible:false});
				   tabs.updateTab("ReportQuotaPropertyDef",{visible:true});
				   tabs.updateTab("ReportQuotadetail",{visible:true});
				   tabs.setActiveIndex(2);
				   //当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
				   for(var i=0;i<tabs.tabs.length;i++){
					  var temp_tab = tabs.tabs[i];
					  if(temp_tab.name=="ReportQuotaPropertyDef"){
					      title = reportquotaname +"指标项属性定义";
                          tabs.updateTab (temp_tab, {title:title})
						  tabs.loadTab("<%=request.getContextPath() %>/ame_common/ameReport/ReportQuotaPropertyDef.jsp?quotaseq="+quotaseq, temp_tab);
					  }else if(temp_tab.name=="ReportQuotadetail"){
						  tabs.loadTab("<%=request.getContextPath() %>/ame_common/ameReport/ReportQuotadetail.jsp?quotaseq="+quotaseq+"&reportcode="+reportcode+"&parentquotacode="+parentquotacode,temp_tab);
					  }
				    }
				    tabs.reloadTab();
				}
			}
			<%-- else{
			   tabs.updateTab("queryReportQuotas",{visible:true});
			   tabs.updateTab("ReportPropertyDef",{visible:false});
			   tabs.updateTab("ReportQuotaPropertyDef",{visible:false});
			   tabs.updateTab("ReportQuotadetail",{visible:true});
			   tabs.setActiveIndex(0);
		     //当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
			   for(var i=0;i<tabs.tabs.length;i++){
				  var temp_tab = tabs.tabs[i];
				  if(temp_tab.name=="queryReportQuotas"){
					  tabs.loadTab("<%=request.getContextPath() %>/importExcel/queryReportQuotas.jsp",temp_tab);
				  }else if(temp_tab.name=="ReportQuotadetail"){
					  tabs.loadTab("<%=request.getContextPath() %>/ame_common/ameReport/ReportQuotadetail.jsp?quotaseq="+quotaseq+"&reportcode="+reportcode+"&parentquotacode="+parentquotacode,temp_tab);
				  }
			    }
			    tabs.reloadTab();
			} --%>
		}
		
		//右键菜单
		function onBeforeOpen(e) {
		    var menu = e.sender;
		    var node = tree.getSelectedNode();
		    if (!node) {
		        e.cancel = true;
		        return;
		    }
		    if(node.parentquotacode == '.0.'){
		    	document.getElementById("onAddReport").style.display="";  //新增报表
		    	document.getElementById("onAddReportQuota").style.display="none";  //新增指标项
			    document.getElementById("onAddXReportQuota").style.display="";  //新增下级指标项
			    document.getElementById("onRemoveReport").style.display="none";  //删除报表
			    document.getElementById("onRemoveReportQuota").style.display="none";  //删除指标项
			    document.getElementById("onRefresh").style.display="";  //刷新
		    }else if(node.parentquotacode == null || node.parentquotacode == 'null'){
				document.getElementById("onAddReport").style.display="";  //新增报表
		    	document.getElementById("onAddReportQuota").style.display="none";  //新增指标项
			    document.getElementById("onAddXReportQuota").style.display="none";  //新增下级指标项
			    document.getElementById("onRemoveReportQuota").style.display="none"; //删除
			    document.getElementById("onRefresh").style.display="";  //刷新
		    }else{
		        document.getElementById("onAddReport").style.display="none";  //新增报表
		    	document.getElementById("onAddReportQuota").style.display="";  //新增指标项
			    document.getElementById("onAddXReportQuota").style.display="";  //新增下级指标项
			    document.getElementById("onRemoveReport").style.display="none";  //删除报表
			    document.getElementById("onRemoveReportQuota").style.display="";  //删除指标项
			    document.getElementById("onRefresh").style.display="";  //刷新
		    }
		    e.htmlEvent.preventDefault();
		}
		
		/**
		*新增报表
		*/
		function onAddReport(){
			var node = tree.getSelectedNode();
			nui.open({
	            url: "<%=request.getContextPath() %>/ame_common/ameReport/ReportPropertyDef.jsp",
	            title: "新增报表", 
	            width: 800,
	            height: 390,
	            allowResize:false,
	            ondestroy: function (action) {
	                if (action == "ok") {
	                	search();
		            }
	            }
	     	});
		}
		/**
		*新增指标
		*/
		function onAddReportQuota(){
			var node = tree.getSelectedNode();
			var parentquotacode = node.parentquotacode;
			var reportcode = node.reportcode;
			var isLeaf = tree.isLeaf(node);
			if(!isLeaf){
			  var isFlag = 1;
			}
			nui.open({
	            url: "<%=request.getContextPath() %>/ame_common/ameReport/ReportQuotaPropertyDef.jsp?parentquotacode=" + parentquotacode + "&isFlag="+isFlag + "&reportcode=" + reportcode,
	            title: "新增指标", 
	            width: 800,
	            height: 390,
	            allowResize:false,
	            ondestroy: function (action) {
	                if (action == "ok") {
	                	search();
		            }
	            }
	     	});
		}
		/**
		*新增下级指标
		*/
		function onAddXReportQuota(){
			var node = tree.getSelectedNode();
			var parentcode = node.parentquotacode;
			var childnodelength=  tree.getChildNodes(node).length;
			var parentquotacode = node.quotaseq;
			var reportcode = node.reportcode;
			/* if(parentcode == '.0.'){
			      var isFlag = 1;
			}else{
			    if(childnodelength > 0){
			       var isLeaf = tree.isLeaf(tree.getChildNodes(node)[0]);
			       if(!isLeaf){
			           var isFlag = 1;
			       }
			    }  
			} */
			nui.open({
	            url: "<%=request.getContextPath() %>/ame_common/ameReport/ReportQuotaPropertyDef.jsp?parentquotacode=" + parentquotacode + "&reportcode=" + reportcode,           
	            title: "新增下级指标", 
	            width: 750,
	            height: 390,
	            allowResize:false,
	            ondestroy: function (action) {
	                if (action == "ok") {
	                	search();
		            }
	            }
	     	});
		}
		/**
		**删除指标
		*/
		function onRemoveReportQuota(){
			//获取当前选择的节点
			var node = tree.getSelectedNode();
			var reportcode = node.reportcode;
			var reportquotacode = node.reportquotacode;
			var quotaseq = node.quotaseq;
	        var json = nui.encode({"reportcode":reportcode,"reportquotacode":reportquotacode,"quotaseq":quotaseq});
	        nui.confirm("您确定要删除当前指标及相关指标么，请确认后再提交！","删除指标确认提示",function(action){
			    if(action=="ok"){
					nui.ajax({
				    	url: "com.primeton.eos.ame_common.ameReport.deleteReportQuota.biz.ext",
				        type: "post",
				        data: json, 
				        cache: false,
				        contentType: 'text/json',
				        success: function (text) {
				   			var result = text.result;
					       	if(result=='1'){
					       		alert("删除成功！");
					       		search();
					       		tabs.updateTab("queryReportQuotas",{visible:true});
					       		tabs.updateTab("ReportPropertyDef",{visible:false});
					       		tabs.updateTab("ReportQuotaPropertyDef",{visible:false});
					       		tabs.updateTab("ReportQuotadetail",{visible:false});
					       		tabs.setActiveIndex(0);
					       		tabs.loadTab("<%=request.getContextPath() %>/importExcel/queryReportQuotas.jsp",tabs.tabs[0]);
					        }else{
					       		alert("删除失败！");
					        }
				       } 
			       	});
	    		 }
	    	 });
		}
		/**
		**删除报表
		*/
		function onRemoveReport(){
			//获取当前选择的节点
			var node = tree.getSelectedNode();
			var reportcode = node.reportcode;
			var reportid = node.reportid;
	        var json = nui.encode({"reportid":reportid,"reportcode":reportcode});
	        nui.confirm("您确定要删除报表及以下相关指标么，请确认后再提交！","删除报表确认提示",function(action){
			    if(action=="ok"){
					nui.ajax({
				    	url: "com.primeton.eos.ame_common.ameReport.deleteReport.biz.ext",
				        type: "post",
				        data: json, 
				        cache: false,
				        contentType: 'text/json',
				        success: function (text) {
				   			var result = text.result;
					       	if(result=='1'){
					       		alert("删除成功！");
					       		search();
					       		tabs.updateTab("queryReportQuotas",{visible:true});
					       		tabs.updateTab("ReportPropertyDef",{visible:false});
					       		tabs.updateTab("ReportQuotaPropertyDef",{visible:false});
					       		tabs.updateTab("ReportQuotadetail",{visible:false});
					       		tabs.setActiveIndex(0);
					       		tabs.loadTab("<%=request.getContextPath() %>/importExcel/queryReportQuotas.jsp",tabs.tabs[0]);
					        }else{
					       		alert("删除失败！");
					        }
				       } 
			       	});
	    		 }
	    	 });
		}
		//定义两个全局变量记录移动前的from和to节点
		//因为移动后不会重新load这两个节点，否则需要重新load整棵树或者他们的父节点才能更新节点属性，这样树的展现方式不太友好
		var fromNode = null;
	    var toNode = null;
		var parentNode = null;
		function onNodeBeforeDrop(e){
			fromNode = e.dragNode;
			toNode =e.dropNode;
			parentNode = tree.getParentNode(fromNode);
			if(fromNode.parentquotacode == '.0.'){
				alert("此节点不能被拖拽！");
				e.cancel=true;
			}else{
			    e.cancel = true;
				var moveUrl = "<%=request.getContextPath() %>/abframe/org/newOrganization/moveOrgNode.jsp";
		        nui.open({
		            url: moveUrl,
		            title: "移动节点", 
		            width:300,
		            height:200,
		            ondestroy: function (action) {
		            	if(action == "ok"){
		            		var iframe = this.getIFrameEl();
							var data = iframe.contentWindow.getData();
							data = nui.clone(data);   
							reportDrag(data);
		            	}
		            }
		        });
			}
		}
		
		///实现拖拽功能——移动/复制机构到报表
		function reportDrag(data){
		    var isLeaf = tree.isLeaf(fromNode);
			var text = data.opertion;
			//获取当前选择的节点
			var json = nui.encode({'to':toNode,'from':parentNode,'isMoveOrCopy':text,'oaRepquota':fromNode}); 
			$.ajax({ 
	            url: "com.primeton.eos.ame_common.ameReport.copyOrMoveReportQuotacode.biz.ext",
	            type: 'POST',
	            data: json,
	            cache: false,
	            contentType:'text/json',
	            cache: false,
	            success: function (text) {
	            	var result = text.result;
	            	if(result == 0){
	            		nui.alert("节点操作成功");
	            		search();
	            		return;
	            	}else{
	            		nui.alert("节点操作失败，请联系信息技术部。");
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
            	url: "com.primeton.eos.ame_common.ameReport.queryReportQuota.biz.ext",
            	data: json,
            	type: 'POST',
            	cache: false,
            	contentType: 'text/json',
            	success: function (text) {					 
            		var returnJson = nui.decode(text);
					var data = returnJson.reportquotacodes;
					//重新加载数据
					tree.loadList(data, "quotaseq", "parentquotacode");
					//设置树的展开
					var nodes=tree.getChildNodes(tree.getRootNode());
    				tree.expandNode(nodes[0]); 
            	},
            	error: function (jqXHR, textStatus, errorThrown) {
    				CloseWindow();
                }
            });
		}
</script>
</html>