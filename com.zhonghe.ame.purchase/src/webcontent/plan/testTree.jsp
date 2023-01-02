<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>补充请假记录</title>
<style type="text/css">
    body{
        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
    }
</style>
</head>
<body>
	<div class="nui-toolbar" style="text-align:center;line-height:30px;" 
        borderStyle="border-left:0;border-top:0;border-right:0;">
          <label >名称：</label>
          <input id="key" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
          <a class="nui-button" style="width:60px;" onclick="search()">查询</a>
    </div>
    <div class="nui-fit">
        
        <ul id="tree1" class="nui-tree" style="width:100%;height:100%;" url="com.zhonghe.ame.purchase.purchaseItems.queryAllPurItem.biz.ext"
            showTreeIcon="true" textField="itemName" dataField="purchaseIteams" idField="id" parentField="parentId" resultAsTree="false"  
            expandOnLoad="true" onnodedblclick="onNodeDblClick" expandOnDblClick="false" 
            >
        </ul>
    	
    </div>                
    <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" 
        borderStyle="border-left:0;border-bottom:0;border-right:0;">
        <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="closeCancel()">取消</a>
    </div>
	
			
</body>
<script type="text/javascript">
	  nui.parse();
	
    var tree = mini.get("tree1");
	var orgid = "<%=request.getParameter("orgid") %>";
    var purType = "<%=request.getParameter("purType") %>";
   //tree.load({"orgid":orgid,"purType":purType})
    function GetData() {
        var node = tree.getSelectedNode();
        //console.log(tree.getParentNode(node));
        var array = new Array();
        var num = node.grade;
        for(var i = 0 ; i<num ; i++){
        	array.push(node);
        	node = tree.getParentNode(node);
        }
       	
        return array;
    }
    function onKeyEnter(e) {
        search();
    }
    function onNodeDblClick(e) {
        onOk();
    }

    function onOk() {
        var node = tree.getSelectedNode();
        //console.log(node);
        if (node && tree.isLeaf(node) == false) {
            alert("不能选中父节点");
            return;
        }

        closeOk();        
    }
</script>
</html>