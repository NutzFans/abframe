<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): huangyq
  - Date: 2018-09-26 14:55:06
  - Description:
-->
<head>
<title>查询操作员</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:;
	    }
    </style>
</head>
<div class="nui-panel" title="操作员查询" style="width:100%;">
	<div id="form1">
    	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">        		
        	<table align="center" border="0" width="100%" class="form_table">	            
	      		<tr>
					<td align="right" style="width: 100px;">操作员名称：</td>
					<td colspan="1" align="left"  style="width: 200px">
				    <input class="nui-textbox" name="criteria._expr[1]._value" style="width:120px"/>
			        <input class="nui-hidden" name="criteria._expr[1]._property" value="operatorname"/>
			        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
			        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
					</td>
					<td align="right" style="width: 100px;">操作员状态：</td>
					<td colspan="1">
					<input class="nui-dictcombobox" name="criteria._expr[2]._value" dictTypeId="ABF_OPERSTATUS" style="width: 110px;"/>
            		<input class="nui-hidden" name="criteria._expr[2]._property" value="status"/>
            		<input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
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
		                	<a class="nui-button" id="addOperator" iconCls="icon-add" onclick="addOperator()">新增</a>
				            <a class="nui-button" id="updateOperator" iconCls="icon-edit" onclick="updateOperator()">修改</a>
				            <a class="nui-button" id="deleteOperator" iconCls="icon-remove" onclick="deleteOperator()">删除</a>	
				            <a class="nui-button" id="resetPwd" iconCls="icon-reload" onclick="resetPwd()">重置密码</a>
				        </td>
		            </tr>
		        </table>           
		    </div>		
				<div id="datagrid1" class="nui-datagrid" style="width:100%;height:340px;" allowResize="true" dataField="acoperator" 
				 	 pagesize="20" sizeList="[20,50,100,200,500]"   url="org.gocom.abframe.rights.OperatorManager.newqueryAcOperator.biz.ext"  
				 	 multiSelect="true" showSummaryRow="true" idField="operatorid" allowSortColumn="true">
					<div property="columns"> 
						<div name="temp666" type="checkcolumn"></div> 
						<div field="operatorid" width="60" align="right" headerAlign="center"  allowSort="true" >
							操作员ID						
						</div>                            
			    		<div field="operatorname" width="120" align="right" headerAlign="center" allowSort="true" >
			    			操作员名称	                	
			    		</div>
			    		<div field="userid" width="100" align="right" headerAlign="center" allowSort="true" >
			    			登录用户名	                	
			    		</div>
			    		<div field="authmode" width="150" align="right" headerAlign="center" allowSort="true" renderer="dictGetAuthmode">
			    			认证模式	                	
			    		</div>
			    		<div field="status" width="80" align="right" headerAlign="center" allowSort="true" renderer="dictGetStatus">
			    			操作员状态	                	
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
		
		function dictGetStatus(e){
				return nui.getDictText('ABF_OPERSTATUS',e.value);
			}
		function dictGetAuthmode(e){
				return nui.getDictText('ABF_AUTHMODE',e.value);
			}
		/**
		 *新增操作员 
		 */
		function addOperator() {
			nui.open({
	            url: "<%=request.getContextPath() %>/abframe/rights/operatorManage/operatorInput.jsp",
	            title: "新增操作员", 
	            width: 490, 
	            height: 350,
	            onload: function () {
	            },
	            ondestroy: function (action) {
	            	if(action=="saveSuccess"){
	            		alert("新增成功！");
	            		grid.reload();
	            	}
	            }
	        });
		}	
		
		/**
		 *修改操作员 
		 */
		function updateOperator(){
			var row = grid.getSelected();
	        var row1 = grid.getSelecteds();
	        if (row) {
	        	if(row1.length<2) {
	        		var operatorid=row.operatorid;
					nui.open({
			            url: "<%=request.getContextPath() %>/abframe/rights/operatorManage/operatorUpdate.jsp?operatorid="+operatorid,
			            title: "修改操作员", 
			            width: 490, 
			            height: 350,
			            onload: function () {
				            var iframe = this.getIFrameEl();
				            var data = {record:{acoperator:row}};
				            //直接从页面获取，不用去后台获取
				            iframe.contentWindow.setFormData(data);
			            },
			            ondestroy: function (action) {
			            	if(action=="saveSuccess"){
			            		alert("修改成功！");
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
		 * 删除操作员
		 */
		function deleteOperator() {
			var rows = grid.getSelecteds();
			var data = {acoperators:rows};
	        var json = nui.encode(data);
			if (rows.length > 0) {
					if (confirm("确定删除选中记录？")) {
		                nui.ajax({
		                    url: "org.gocom.abframe.rights.OperatorManager.deleteAcOperators.biz.ext",
		                    type: "post",
		                    data: json, 
		                    cache: false,
		                    contentType: 'text/json',
		                    success: function (text) {
		                    var returnJson = nui.decode(text);
		                    if(returnJson.reCode!=1){
		                			alert("删除失败！");
		                    }else{
		                			if(text.exception==null){
				                		alert("删除成功！");
					                	grid.reload();
				                	}else{
			                			alert("删除失败！");
				                	}
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
		
		/**
		 * 重置密码
		 */
		function resetPwd() {
			var rows = grid.getSelecteds();
			var data = {acoperators:rows};
	        var json = nui.encode(data);
			if (rows.length > 0) {
					if (confirm("确定重置选中记录密码？")) {
		                nui.ajax({
		                    url: "org.gocom.abframe.rights.OperatorManager.updateOperatorPwd.biz.ext",
		                    type: "post",
		                    data: json, 
		                    cache: false,
		                    contentType: 'text/json',
		                    success: function (text) {
		                    	if(text.exception==null){
			                		alert("重置密码成功！");
				                	grid.reload();
			                	}else{
			                		nui.alert("重置密码失败！");
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