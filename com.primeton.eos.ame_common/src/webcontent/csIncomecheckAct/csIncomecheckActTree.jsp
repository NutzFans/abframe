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
<title>流程节点审核检查点配置树</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="margin: 0px;padding: 0px;width: 100%;height: 100%;">
	<div class="nui-fit">
	<div class="nui-splitter" style="width:100%;height:100%;">
	 	<!-- 左边核查要点树 -->
		<div size="45" showCollapseButton="true" style="background-color: ;">
			<table id="form1"  style="height: 7%;border-bottom: dashed 1px #909aa6;width: 100%;">
				<tr>
					<td align="left">
						<div id="ismulti" class="nui-radiobuttonlist" valueField="id" textField="text" 
							data="[{'id': '0','text': '已有配置'},{'id': '1','text': '全部'}]" value="0"
							style="width: 150px;margin-left: 5px;margin-top: 5px;float: left;" onvaluechanged="search">
					    </div>	
					</td>
				</tr>
			</table>
			<!-- 核查要点树展现  start-->
			<ul id="tree1" class="nui-tree"  
				style="width:100%;height: 90%;padding:5px;" ondrawnode="setIcon" resultAsTree ="false"
			    showTreeIcon="true" textField="name"  dataField="data" onnodeclick="click" 
			    idField="activitydefid" parentField="parentid" contextMenu="#treeMenu"  allowDrag="true" allowDrop="true" allowLeafDropIn="true">      
			</ul>
		</div>
		<!-- 右边核查要点详情 -->
		<div size="190" showCollapseButton="true" > 
			<div id="body_tab" class="nui-tabs" activeIndex="0" style="width:auto;height:100%;display: none;" >
				<!-- 核查要点详情信息 -->
				<div id="checkAct" url="<%=request.getContextPath() %>/ame_common/csIncomecheckAct/csIncomecheckActDetail.jsp" title="流程审核要点配置" refreshOnClick="true">
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
	    	var isleaf = tree.isLeaf(e.node);
    		if(isleaf){
    			e.iconCls = "icon-checkAct";
    		}else{
    			e.iconCls = "icon-checklist";
    		}
		}
		
		function click(e){
			var activitydefid = e.node.activitydefid;
			var processdefname = e.node.processdefname;
			//是否叶子节点
			var isleaf = tree.isLeaf(e.node);
			//alert("是否叶子："+isLeaf);
			if(isleaf){
				document.getElementById("body_tab").style.display="";
				var tabs = nui.get("body_tab");
				//当切换节点，而又没有切换TAB时，出现未切换的TAB页页面不刷新问题
				for(var i=0;i<tabs.tabs.length;i++){
					var temp_tab = tabs.tabs[i];
					if(temp_tab.title=="流程审核要点配置"){
						tabs.loadTab("<%=request.getContextPath() %>/ame_common/csIncomecheckAct/csIncomecheckActDetail.jsp?processdefname="+processdefname+"&&activitydefid="+activitydefid, temp_tab);
					}
				}
			}
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
			var ismulti = nui.get("ismulti").getValue();
			var json = nui.encode({"ismulti":ismulti});
			nui.ajax({
            	url: "com.primeton.eos.ame_common.csIncomecheckAct.queryIncomecheckAct.biz.ext",
            	data: json,
            	type: 'POST',
            	cache: false,
            	contentType: 'text/json',
            	success: function (text) {					 
            		var returnJson = nui.decode(text);
					if(returnJson.exception == null){
						var data = returnJson.data;
						//重新加载数据
						tree.loadList(data, "activitydefid", "parentid");
						//设置树的展开
						var nodes=tree.getChildNodes(tree.getRootNode());
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