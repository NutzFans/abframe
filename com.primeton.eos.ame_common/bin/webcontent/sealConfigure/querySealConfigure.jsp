<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 75241
  - Date: 2019-04-19 13:41:54
  - Description:
-->
<head>
<title>用章设置</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div style="width:100%;">
	    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <table style="width:100%;">
	            <tr>
	                <td style="width:100%;">
	                    <a class="nui-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
	                    <a class="nui-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
	                    <a class="nui-button" iconCls="icon-ok" onclick="save()" plain="true">保存</a>
	                </td>
	            </tr>
	        </table>           
	    </div>
	</div>
	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="datas"  showPager="false" allowCellEdit="true" allowCellSelect="true" 
	    multiSelect="true" editNextOnEnterKey="true" url="com.primeton.eos.ame_common.SealConfigure.querySealConfigure.biz.ext" allowCellWrap="true">			            
	    <div property="columns">
	    	<div type="checkcolumn"></div>
	        <div field="sealname" width="100" headerAlign="center" align="left" allowSort="true">用章名称
	        	<input property="editor" id="sealname" class="nui-textbox" required="true" onvaluechanged="checkSealname(e)"/>
	        </div>
	        <div field="examuserid" displayField="exname" width="150" headerAlign="center" align="left" allowSort="true">用章审核人
	        	<input property="editor"  class="mini-textboxlist"   searchField="name" url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" 
					textField="empname" valueField="userid" required="true"/>
	        </div>
	        <div field="adminuserid" displayField="adname" width="150" headerAlign="center" align="left" allowSort="true">用章管理人
	        	<input property="editor" class="mini-textboxlist" searchField="name" url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" 
					textField="empname" valueField="userid" required="true"/>
	        </div>
	        <div field="remark" width="250" headerAlign="center"  align="left" allowSort="true">备注
	        	<input property="editor" class="nui-textarea" inputStyle="text-align: left"/>
	        </div>
	    </div>
	</div>
	<script type="text/javascript">
		nui.parse();//初始化NUI
		var grid = new nui.get("datagrid1");//获取表格对象
		
		init();
		function init(){
			grid.load();
			grid.sortBy("confid","asc");
		}
		
		//新增
	    function addRow(){
	    	var rowS = {name: "New Row"} 
			grid.addRow(rowS);
	    }
		
		//删除
		function removeRow(){
	        var rows = grid.getSelecteds();
	        if (rows.length>0) {
	            grid.removeRows(rows, true);
	        }else{
	        	nui.alert("请至少选中一条记录！");
	        }
	    }
	    
	    //保存
	    function save(){
	    	var added = grid.getChanges("added");//新增数据
	    	var modified = grid.getChanges("modified");//修复数据
	    	var removed = grid.getChanges("removed");//删除数据
	    	if(added.length==0&&modified.length==0&&removed.length==0){
	    		alert("无任何数据更改，请确认后在进行操作！");
	    		return;
	    	}else{
	    		var d = grid.getData();
	    		if(d.length!=0||(removed.length!=0)){//表格数据不为空或删除数据也不为空
	    			var ischeck = '1';
	    			if(d.length!=0){
	    				for(var i =0;i<d.length;i++){
	    					if(d[i].sealname==""||d[i].sealname == null){
	    						ischeck = "用章名称不能为空";
	    						break;
	    					}
	    					if(d[i].examuserid==""||d[i].examuserid == null){
	    						ischeck = "用章审核人不能为空";
	    						break;
	    					}
	    					if(d[i].adminuserid==""||d[i].adminuserid == null){
	    						ischeck = "用章管理人不能为空";
	    						break;
	    					}
	    				}
	    			}
	    			if(ischeck=='1'){
	    				grid.loading("保存中...");
	    				var json = nui.encode({added: added,modified:modified,removed:removed});
				        nui.ajax({
				            url: "com.primeton.eos.ame_common.SealConfigure.saveSealConfigure.biz.ext",
							type: 'POST',
							data: json,	
							contentType: 'text/json',
				            success: function (o) {
				            	var result = o.result;
				            	if(result=='1'){
				            		alert("保存成功！");
				            		grid.unmask();
				      				init();
				            	}else{
				            		alert("保存失败！");
				            		grid.unmask();
				            	}
				            }
				    	});
	    			}else{
	    				alert(ischeck);
	    				return;
	    			}
	    		}else{
	    			return;
	    		}
	    	}
	    }
	    
	    //检查用章名称是否重复
	    function checkSealname(e){
	    	var d = grid.getData();//表格数据
	    	var sealname = e.value;//用章名称
	    	var ischeck = 0;//是否重复
	    	if(d.length>0){
	    		for(var i=0;i<d.length;i++){
	    			if(sealname==d[i].sealname){
	    				ischeck++;
	    			}
	    		}
	    		if(ischeck!=0){
	    			alert("用章名称不能重复！");
	    			nui.get("sealname").setValue("");
	    			return;
	    		}
	    	}
	    }	
	</script>
</body>
</html>