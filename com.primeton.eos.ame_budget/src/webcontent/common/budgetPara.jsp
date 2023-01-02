<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): ChiaYang
  - Date: 2016-10-27 17:23:19
  - Description:
-->
<head>
<title>预算参数维护</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="mini-panel" title="预算参数维护" width="auto">
		<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
			<div class="nui-toolbar"style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>预算年度：</span></td>
			           	<td align="left">
						    <input name="criteria._expr[0]._value" class="nui-textbox"   id="year"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="year"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td>
						<td align="right"><span>参数类型：</span></td>
			           	<td align="left">
						    <input name="criteria._expr[1]._value" class="nui-textbox" style="width:204px;"/>
							<input class="nui-hidden" name="criteria._expr[1]._property" value="paratype"/>
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td>
						<td align="right"><span>参数名称：</span></td>
			           	<td align="left">
			           		<input class="nui-textbox" name="criteria._expr[2]._value" style="width:204px;"/>
			           		<input class="nui-hidden" name="criteria._expr[2]._property" value="paraname"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td> 
					</tr>
				    <tr>
			    		<td align="center" colspan="15">
		                       <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
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
                        		<a class="nui-button" iconCls="icon-save" onclick="onOk">保存</a>       
			                </td>
			            </tr>
			        </table>
			    </div>
			</div>
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="budparas" 
		        	url="com.primeton.eos.ame_budget.common.queryBudPara.biz.ext" 
		        	allowCellEdit="true" allowCellSelect="true" multiSelect="true" showPager="false"  showModified = "true"
        			editNextOnEnterKey="true" editNextRowCell="true" >
		        <div property="columns">
		               <div type="checkcolumn" width="30"></div>
		               <div field="year" width="60" align="center" headerAlign="center" allowSort="true">预算年度
		               </div>
		               <div field=paracode width="120" align="center" headerAlign="center" allowSort="true">参数代码
		               </div>
		               <div field=paratype width="140" align="left" headerAlign="center">参数类型
		               </div>
		               <div field="paraname" width="140" align="left" headerAlign="center" allowSort="true">参数名称
		               </div>
		               <div field="parameters" width=60 align="left" headerAlign="center" cellStyle="background:#FFFFE6">参数值
		               		<input property="editor" class="nui-textbox" inputStyle="text-align:left;"/>
		               </div>
		               <div field="paramemo" width=auto align="left" headerAlign="center" cellStyle="background:#FFFFE6">参数说明
		               		<input property="editor" class="nui-textbox" inputStyle="text-align:left;"/>
		               </div>
		        </div>
		    </div>
		<script type="text/javascript">
			nui.parse();
			var myDate = new Date();
			nui.get("year").setValue(myDate.getFullYear());
			var grid = nui.get("datagrid1");
			var form = new nui.Form("form1");
			//初始化加载数据,默认按照预算年度降序排列
			init();
	    	function init() {
	    		var data = form.getData();
			  	grid.load(data); 
	    		grid.sortBy("sortno","asc");
	    	}
	    	//执行多条件查询
	        function search() {
				var form = new nui.Form("#form1");
				var data = form.getData(); //获取表单JS对象数据
			  	grid.load(data); //datagrid加载数据
			}
			//重置多条件查询
			function reset(){
				var form = new nui.Form("#form1");
				form.reset();
				grid.load();
			}
	    	//添加行
	    	function addRow() { 
	    		var year = nui.get("year").getValue();         
	            var newRow = { name: "New Row" ,year:year};
	            grid.addRow(newRow, 0);
	        }
	         function removeRow() {
	        	var row = grid.getSelected();
	            if (row) {
	                grid.removeRow(row, true);
	            }
	        }
	        function onOk(e){
        		var rows = grid.getChanges();
	        	if (rows.length == 0) {
	        		nui.alert("数据未做任何修改！");
	        		return;
	        	}
	        	
	        	for (var i = 0;i < rows.length; i++) {
	        		if (!rows[i].year) {
	        			nui.alert("预算年度不能为空！");
	        			return;
	        		}
	        		if (!rows[i].paracode) {
	        			nui.alert("预算代码不能为空！");
	        			return;
	        		}
	        		if (!rows[i].parameters) {
	        			nui.alert("预算值不能为空！");
	        			return;
	        		}
	        	}
        		var json = {budParas:rows};
	        	nui.ajax({
        		 	 url: "com.primeton.eos.ame_budget.common.saveBudPara.biz.ext",
        		 	 data: json,
	                 type: 'POST',
	                 cache: false,
	                 contentType: 'text/json',
	                 success: function (o) {
	                 	if(o.cont>0){
	                 		alert("新增的预算参数已经存在，请检查！");
	                 		return;
	                 	}else{
	                 		var returnJson = nui.decode(o);
							if(returnJson.exception == null){
								nui.alert("保存成功", "系统提示",function(){
				              		var data = form.getData(); //获取表单JS对象数据
				  					grid.load(data); //datagrid加载数据 
								});
			              	}else{
			                	nui.alert("保存失败", "系统提示", function(action){
				                  	if(action == "ok" || action == "close"){
				                  	}
			                  	});
			                } 
	                 	}
	                 },
	                 error: function (jqXHR, textStatus, errorThrown) {
	                 	alert(jqXHR.responseText);
	                 }
        		 });
	        }
		</script>
</body>
</html>