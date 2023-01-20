<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>采购目录</title>
</head>
<style type="text/css">
		html, body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }    
    </style>
<body>
	<div class="nui-panel" title="采购目录" style="width:100%;height: 100%">
	<div id="tabs1" class="nui-tabs" activeIndex="0" style="width:100%;height:100%;" plain="false" onactivechanged="activechanged(e)">
		<div title="一级集采" >
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		        <table style="width:100%;">
		        	<tr>
		                <td style="width:20%;">
		                	<a class="nui-button" id="checkview" iconCls="icon-add" onclick="add()">新增</a>
				            <a class="nui-button" id="checkview2" iconCls="icon-edit" onclick="editTaskMng()">编辑</a>
				            <a class="nui-button" id="checkview1" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
				        </td>
		            </tr>
		        </table>           
		    </div>
		    <div id="datagrid1" dataField="purItems"  
		    	class="nui-treegrid" style="width:100%;height:90%;" url="com.zhonghe.ame.purchase.purchaseItems.queryPurItem.biz.ext" 
		    	treeColumn="itemName" idField="id" parentField="parentId" resultAsTree="false"  allowResize="true" expandOnLoad="true">
		        <div property="columns"> 
		       	<div name="temp123" type="checkcolumn"></div>
		        	<!-- <div type="expandcolumn" width="20"></div> -->
		            <div field="itemName" name='itemName' width="100" align="left" headerAlign="center" allowSort="true">物项名称</div>
		        	<div field="itemCode" width="100" align="center" headerAlign="center" allowSort="true" >物项编码</div>
		            <div field="type" width="100" align="center" headerAlign="center" allowSort="true" renderer="typeValue">对应采购类型</div>
		            <div field="grade" width="100" align="center" headerAlign="center" allowSort="true" renderer="gradeValue">物项类别</div>
		         <!--   <div field="grade" width="100" align="center" headerAlign="center" allowSort="true" renderer="gradeValue">归口部门</div> -->
		        </div>
		    	</div>
	    	</div>
	    	<div title="二级集采" >
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			        <table style="width:100%;">
			        	<tr>
			                <td style="width:20%;">
			                	<a class="nui-button" id="checkview" iconCls="icon-add" onclick="add()">新增</a>
					            <a class="nui-button" id="checkview2" iconCls="icon-edit" onclick="editTaskMng1()">编辑</a>
					            <a class="nui-button" id="checkview1" iconCls="icon-remove" onclick="deleteInfo1()">删除</a>
					        </td>
			            </tr>
			        </table>           
			    </div>
			    <div id="datagrid2" dataField="purItems" 
			    	class="nui-treegrid" style="width:100%;height:350px;" url="com.zhonghe.ame.purchase.purchaseItems.queryPurItem.biz.ext" 
			    	treeColumn="itemName" idField="id" parentField="parentId" resultAsTree="false"  allowResize="true" expandOnLoad="true">
			        <div property="columns"> 
			       	<div name="temp123" type="checkcolumn"></div>
			        	<!-- <div type="expandcolumn" width="20"></div> -->
			            <div field="itemName" name='itemName' width="100" align="left" headerAlign="center" allowSort="true">物项名称</div>
			        	<div field="itemCode" width="100" align="center" headerAlign="center" allowSort="true" >物项编码</div>
			            <div field="type" width="100" align="center" headerAlign="center" allowSort="true" renderer="typeValue">对应采购类型</div>
			            <div field="grade" width="100" align="center" headerAlign="center" allowSort="true" renderer="gradeValue">物项类别</div>
			         <!--   <div field="grade" width="100" align="center" headerAlign="center" allowSort="true" renderer="gradeValue">归口部门</div> -->
			        </div>
		    	</div>
	    	</div>
    	</div>
	</div>
<script type="text/javascript">
    	nui.parse();
    	var tabs = mini.get("tabs1");
    	var grid = nui.get("datagrid1");
    	var grid2 = nui.get("datagrid2");
    	var typeIndex;
		search();
		search2(); 
		
		function activechanged(e){
			typeIndex = e.index;	
		}
		
		function typeValue(e){
			if(e.value==1){
				return "一级集采";
			
			}else if(e.value==2){
				return "二级集采";
			}
		}
		function gradeValue(e){
			if(e.value==1){
				return "大类";
			}else if(e.value==2){
				return "中类";
			}else if(e.value==3){
				return "小类";
			}
		}
		function search() {
		  	grid.load({"type":1}); //datagrid加载数据
		}
		function search2() {
		  	grid2.load({"type":2}); //datagrid加载数据
		}
		
		function editTaskMng(){
    		var row = grid.getSelecteds();
			if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行编辑");
    		}else{
    		var row=row[0];
			if (row) {
				nui.open({
					url: "/default/purchase/plan/editPurItem.jsp",
					width: 620,
					height: 321,
					onload: function () {
						var iframe = this.getIFrameEl();
						var data = {action: "edit",id:row.id};
	                	iframe.contentWindow.SetData(data);
					},
					ondestroy: function (action) {
		            	if(action=="ok"){
		            		grid.reload();
		            	}
		            }
				})
			
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
    		}
		}
		function editTaskMng1(){
    		var row = grid2.getSelecteds();
			if (row.length > 1) {
    		nui.alert("只能选中一条项目记录进行编辑");
    		}else{
    		var row=row[0];
			if (row) {
				nui.open({
					url: "/default/purchase/plan/editPurItem.jsp",
					width: 620,
					height: 321,
					onload: function () {
						var iframe = this.getIFrameEl();
						var data = {action: "edit",id:row.id};
	                	iframe.contentWindow.SetData(data);
					},
					ondestroy: function (action) {
		            	if(action=="ok"){
		            		grid2.reload();
		            	}
		            }
				})
			
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
    		}
		}
		
		function deleteInfo(){
			var row = grid.getSelecteds();
			if(row.length>0){
				if(!confirm("确定删除吗？")){
        				return;
				}else{	
		    		
					if (row.length > 1) {
		    		nui.alert("只能选中一条项目记录进行删除");
		    		}else{
			    		var row=row[0];
						if (row) {
							var json = nui.encode({id:row.id});
							nui.ajax({
								    url: "com.zhonghe.ame.purchase.purchaseItems.deletePurItem.biz.ext",
									type: 'POST',
									data: json,	
									contentType: 'text/json',
								    success: function (o) {
								           if(o.result==1){
					                	 	nui.alert("删除成功","系统提示",function(){
							        		grid.reload();
							        	});
			
					                	 }else{
					                	 	nui.alert("删除失败，请联系信息技术部人员！","系统提示", function(action){
											});
					                	 }
								    }
							}); 
							row.id;
						}
		    		}
		   		}
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
    		
		}
		function deleteInfo1(){
			var row = grid2.getSelecteds();
			if(row.length>0){
				if(!confirm("确定删除吗？")){
        				return;
				}else{	
		    		
					if (row.length > 1) {
		    		nui.alert("只能选中一条项目记录进行删除");
		    		}else{
			    		var row=row[0];
						if (row) {
							var json = nui.encode({id:row.id});
							nui.ajax({
								    url: "com.zhonghe.ame.purchase.purchaseItems.deletePurItem.biz.ext",
									type: 'POST',
									data: json,	
									contentType: 'text/json',
								    success: function (o) {
								           if(o.result==1){
					                	 	nui.alert("删除成功","系统提示",function(){
							        		grid2.reload();
							        	});
			
					                	 }else{
					                	 	nui.alert("删除失败，请联系信息技术部人员！","系统提示", function(action){
											});
					                	 }
								    }
							}); 
							row.id;
						}
		    		}
		   		}
			}else{
				nui.alert("请选中一条记录","提示");
			}
			
    		
		}
     function add(){
		nui.open({
			url: "/default/purchase/plan/editPurItem.jsp",
			width: 620,
			height: 321,
			title:"&nbsp;",
			onload: function () {
				var iframe = this.getIFrameEl();
				var data = {action: "add"};
            	iframe.contentWindow.SetData(data);
			},
			ondestroy: function (action){
				if(typeIndex==0){
					search();
				}else{
					search2();
				}
			}
		})
	}
</script>
</body>
</html>