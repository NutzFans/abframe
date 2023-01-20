<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): huangyq
  - Date: 2018-09-30 15:36:09
  - Description:
-->
<head>
<title>快捷菜单配置</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:;
	    }
    </style>
</head>
<div class="nui-panel" title="我的快捷菜单" style="width:100%;">
	<div id="form1">
    	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">        		
        	<table align="center" border="0" width="100%" class="form_table">	            
	      		<tr>
					<td align="right" style="width: 100px;">功能名称：</td>
					<td colspan="1" align="left"  style="width: 200px">
				    <input class="nui-textbox" name="criteria._expr[1]._value" style="width:120px"/>
			        <input class="nui-hidden" name="criteria._expr[1]._property" value="funcname"/>
			        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
			        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
					</td>
					<td align="right" style="width: 100px;">应用编号：</td>
					<td colspan="1" align="left"  style="width: 200px">
				    <input class="nui-textbox" name="criteria._expr[2]._value" style="width:120px"/>
			        <input class="nui-hidden" name="criteria._expr[2]._property" value="appid"/>
			        <input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
					</td>	
					<td align="right" style="width: 100px;">功能编号：</td>
					<td colspan="1" align="left"  style="width: 200px">
				    <input class="nui-textbox" name="criteria._expr[3]._value" style="width:120px"/>
			        <input class="nui-hidden" name="criteria._expr[3]._property" value="funccode"/>
			        <input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
					</td>
					<td align="center">
    				<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
		            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a> 	          
    				</td>		
    			</tr>	     	      			  			         
            </table>
		</div>
	</div>
	<div style="width:100%;">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		        <table style="width:100%;">
		        	<tr>
		                <td style="width:20%;">                    	 
		                	<a class="nui-button" id="addRecord" iconCls="icon-add" onclick="addRecord()">新增</a>
				            <a class="nui-button" id="updateRecord" iconCls="icon-edit" onclick="updateRecord()">修改</a>
				            <a class="nui-button" id="deleteRecord" iconCls="icon-remove" onclick="deleteRecord()">删除</a>	
				        </td>
		            </tr>
		        </table>           
		    </div>		
				<div id="datagrid1" class="nui-datagrid" style="width:100%;height:340px;" allowResize="true" dataField="acopershortcuts" 
				 	 pagesize="10" sizeList="[10,20,50,100,200]"   url="org.gocom.abframe.rights.menu.OpershortcutManager.newQueryopershortcuts.biz.ext"  
				 	 multiSelect="true" showSummaryRow="true" idField="operatorid" allowSortColumn="true">
					<div property="columns"> 
						<div name="tempshortcut" type="checkcolumn"></div> 
						<div field="funcname" width="100" align="center" headerAlign="center"  allowSort="true" >
							功能名称						
						</div>                            
			    		<div field="funcgroupname" width="100" align="center" headerAlign="center" allowSort="true" >
			    			功能组名称	                	
			    		</div>
			    		<div field="appname" width="100" align="center" headerAlign="center" allowSort="true" >
			    			应用名称	                	
			    		</div>
			    		<div field="orderno" width="60" align="center" headerAlign="center" allowSort="true" >
			    			排列顺序	                	
			    		</div>
			    		<div field="imagepath" width="100" align="center" headerAlign="center" allowSort="true" >
			    			快捷菜单图片路径	                	
			    		</div>
					</div>
			    </div>   
	</div>		
</div>
</body>
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
	    var grid = nui.get("datagrid1");
		    
	    init();
	    function init(){
			var json = form.getData();
			grid.load(json);
		}
		//查询	
		function search() {
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		}
		//重置	
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			init();
		}
		
		/**
		 *新增快捷菜单 
		 */
		function addRecord() {
			nui.open({
	            url: "<%=request.getContextPath() %>/abframe/rights/opershortcut/opershortcutsInput.jsp",
	            title: "快捷菜单配置", 
	            width: 385, 
	            height: 280,
	            onload: function () {
	            },
	            ondestroy: function (action) {
	            	if(action=="saveSuccess"){
	            		nui.alert("新增成功！");
	            		grid.reload();
	            	}
	            }
	        });
		}	
		
		/**
		 *修改快捷菜单
		 */
		function updateRecord(){
			var row = grid.getSelected();
	        var row1 = grid.getSelecteds();
	        if (row) {
	        	if(row1.length<2) {
	        		var operatorid=row.operatorid;
	        		var funccode=row.funccode;
					nui.open({
			            url: "<%=request.getContextPath() %>/abframe/rights/opershortcut/opershortcutsUpdate.jsp?funccode="+funccode+"&operatorid="+operatorid,
			            title: "快捷菜单配置", 
			            width: 385, 
			            height: 280,
			            onload: function () {
				            var iframe = this.getIFrameEl();
				            var data = {record:{acopershortcut:row}};
				            //直接从页面获取，不用去后台获取
				            iframe.contentWindow.setFormData(data);
			            },
			            ondestroy: function (action) {
			            	if(action=="saveSuccess"){
			            		nui.alert("修改成功！");
			            		grid.reload();
			            	}
			            }
			        });
	        	}else{
	        		nui.alert("只能选中一条记录","提示");
	        	}
	        }else{
	             	alert("请选中一条记录","提示");
	        }
		}
		/**
		 * 删除快捷菜单
		 */
		function deleteRecord() {
			var rows = grid.getSelecteds();
			var data = {acopershortcuts:rows};
	        var json = nui.encode(data);
			if (rows.length > 0) {
					if (confirm("您确认要删除选中的快捷菜单？")) {
		                nui.ajax({
		                    url: "org.gocom.abframe.rights.menu.OpershortcutManager.deleteOpershortcuts.biz.ext",
		                    type: "post",
		                    data: json, 
		                    cache: false,
		                    contentType: 'text/json',
		                    success: function (text) {
	                			if(text.exception==null){
			                		nui.alert("删除成功！");
				                	grid.reload();
			                	}else{
		                			nui.alert("删除失败！");
			                	}
		                    },
		                    error: function () {
		                    }
		                });
					}
			 }else {
              	alert("请选中一条记录");
	          }
		}
	</script>
</html>