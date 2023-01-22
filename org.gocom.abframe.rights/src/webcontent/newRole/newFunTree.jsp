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
<title>功能权限</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="margin: 0px;padding: 0px;width: 100%;height: 100%;">
	<div class="nui-fit">
		<!-- 机构树展现  start-->
		<ul id="tree1" class="nui-tree"  
			style="width:100%;height: 90%;padding:5px;"  resultAsTree ="false" showTreeIcon="true" 
			textField="appname"  dataField="newFunTree"   idField="appid" showCheckBox="true" checkRecursive="true"  imgField="imagepath1" resultAsTree="false"  expandOnLoad="0"
			parentField="parentid"  allowDrag="true" allowLeafDropIn="true" ondrawnode="onDrawNode" onbeforenodecheck="onBeforeNodeCheck" allowSelect="false" enableHotTrack="false">      
		</ul>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="saveFunc" id="a" style="width:60px;margin-right:20px;">保存</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
		var tree = nui.get("tree1");
		var freshNode = null;
		var addNode = null;
		var rootNode = tree.getRootNode();
		var roleid = '<%=request.getParameter("roleid") %>';
		var appid = '<%=request.getParameter("appid") %>';
		search();
		
		
		//刷新树
		function refresh(){
			search();
		}   
	
		function onKeyEnter(){
			search();
		}
		
		function onDrawNode(e) {
            var tree = e.sender;
            var node = e.node;

        }
        
		//重新初始化树
		function search(){
			var json = nui.encode({"roleid":roleid,"appid":appid});
			nui.ajax({
            	url: "org.gocom.abframe.rights.role.newRoleManage.showFunTree.biz.ext",
            	data: json,
            	type: 'POST',
            	cache: false,
            	contentType: 'text/json',
            	success: function (text) {					 
            		var returnJson = nui.decode(text);
					if(returnJson.exception == null){
						var data = returnJson.newFunTree;
						//重新加载数据
						tree.loadList(data, "appid", "parentid");
						var datas = text.datas;
						if(datas!=null&&datas!=""){
							var funccodes;
		            		for(var i = 0; i<datas.length; i ++){
		            			if(i==0){
		            				funccodes = datas[i].funccode;
		            			}else{
		            				funccodes = funccodes + "," + datas[i].funccode;
		            			}
		            		}
		        		  	tree.setValue(funccodes);
						}
	              	}else{
	                }  
            	},
            	error: function (jqXHR, textStatus, errorThrown) {
    				CloseWindow();
                }
            });
		}
		
		 function onBeforeNodeCheck(e) {
            var tree = e.sender;
            var node = e.node;
            if (tree.hasChildren(node)) {
                //e.cancel = true;
            }
        }
        
        function saveFunc(){
        	var acRole = {"roleid":roleid};
        	var value = tree.getValue(false);
        	if(value==""||value==null){
        		var func =null;
        	}else{
        		var func = tree.getCheckedNodes();
        	}
        	var acRole = {"roleid":roleid};
        	var json = nui.encode({"acRole":acRole,"datas":func});
        	nui.ajax({
            	url: "org.gocom.abframe.rights.role.newRoleManage.addRoleFunc.biz.ext",
            	data: json,
            	type: 'POST',
            	cache: false,
            	contentType: 'text/json',
            	success: function (text) {					 
            		var retCode = text.retCode;
            		if(retCode=='1'){
            			alert("保存成功！");
            			search();
            		}else{
            			alert("保存失败！");
            		}
            	},
            	error: function (jqXHR, textStatus, errorThrown) {
    				CloseWindow();
                }
            });
        }
</script>
</html>