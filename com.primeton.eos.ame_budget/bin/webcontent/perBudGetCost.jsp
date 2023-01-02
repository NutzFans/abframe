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
<title>人员类型预算成本</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="mini-panel" title="人员类型预算成本" width="auto">
		<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
			<div class="nui-toolbar"style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
						<tr>
							<td align="right"><span>预算年度：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[2]._value" class="nui-textbox" id="year" style="width:100px;"/>
							    <input class="nui-hidden" name="criteria._expr[2]._property" value="year"/>
							    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
							</td>
							<td align="right"><span>招聘岗位：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[0]._value" class="nui-textbox"style="width:210px;" />
							    <input class="nui-hidden" name="criteria._expr[0]._property" value="degreename"/>
							    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
							</td> 
							<td align="right"><span>招聘岗位代码：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[1]._value" class="nui-textbox"style="width:204px;" />
							    <input class="nui-hidden" name="criteria._expr[1]._property" value="perdegree"/>
							    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
							</td> 
						</tr>
						<tr>
							<td align="right"><span>薪资：</span></td>
			            	<td align="left">
			            		<input class="nui-textbox" name="criteria._expr[3]._min" style="width:100px"/>-<input class="nui-textbox" name="criteria._expr[3]._max" style="width:100px"/>(元)
			            		<input class="nui-hidden" name="criteria._expr[3]._property" value="salary"/>
						        <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
							</td> 
							<td align="right"><span>福利：</span></td>
			            	<td align="left">
			            		<input class="nui-textbox" name="criteria._expr[4]._min" style="width:100px"/>-<input class="nui-textbox" name="criteria._expr[4]._max" style="width:100px"/>(元)
						        <input class="nui-hidden" name="criteria._expr[4]._property" value="weal"/>
							    <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
							</td>
							<td align="right"><span>绩效比例：</span></td>
			            	<td align="left">
							    <input name="criteria._expr[5]._value" class="nui-textbox"  style="width:204px;"/>
							    <input class="nui-hidden" name="criteria._expr[5]._property" value="perratio"/>
							    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
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
			                    <a class="nui-button" iconCls="icon-add" onclick="addRow()">增加</a>
                        		<a class="nui-button" iconCls="icon-remove" onclick="removeRow()">删除</a>
                        		<span class="separator"></span>
                        		<a class="nui-button" iconCls="icon-save" onclick="onOk">保存</a>       
			                </td>
			            </tr>
			        </table>
			    </div>
			</div>
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="perBudgetCosts" 
		        	url="com.primeton.eos.ame_budget.perBudGetCost.queryPerBudGetCost.biz.ext"
		        	allowCellEdit="true" allowCellSelect="true" multiSelect="true"  showPager="false" oncellendedit="checkIsRepeat" oncellmousedown="beginedit1">
		        <div property="columns">
		               <div type="checkcolumn" width="30"></div>
		               <div field="perid" visible="false" align="center" headerAlign="center">编号
		               		<input property="editor" class="nui-textbox" style="width:100%;"/>
		               </div>
		               <div field="year" width="70" align="center" headerAlign="center">预算年度
		               		<input property="editor" class="nui-spinner" allowLimitValue="false" increment="0" inputStyle="text-align:center;" showbutton="false"/>
		               </div>
		               <div  field="perdegree" width="50" align="center" headerAlign="center" >招聘岗位代码
		               		<input property="editor" class="nui-textbox" inputStyle="text-align:center;"/>
		               </div>
		               <div  field="degreename" width="70" align="center" headerAlign="center" >招聘岗位
		               		<input property="editor" class="nui-textbox" allowInput="true" inputStyle="text-align:center;"/>
		               </div>
		               <div field="salary" width="70" align="right" headerAlign="center" renderer="renderMoney">薪资
		               		<input property="editor" style="width:100%;" class="nui-spinner" allowLimitValue="false" increment="0" changeOnMousewheel="false" inputStyle="text-align:right;" format="n0" showbutton="false"/>
		               </div>
		               <div field="weal" width="70" align="right" headerAlign="center" renderer="renderMoney">福利
		               		<input property="editor" style="width:100%;" class="nui-spinner" allowLimitValue="false" increment="0" changeOnMousewheel="false" inputStyle="text-align:right;" format="n0" showbutton="false"/>
		               </div>
		               <div field="perratio" width="70" align="center" headerAlign="center" renderer="rendererRate">绩效比例
		               		<input property="editor" style="width:100%;" class="nui-spinner" changeOnMousewheel="false" allowLimitValue="false" inputStyle="text-align:center;" format="p0" showbutton="false"/>
		               </div>
		        </div>
		    </div>
		</div>
		
		<script type="text/javascript">
			nui.parse();
			
			var grid = nui.get("datagrid1");
			var form = new nui.Form("form1");
			var myDate = new Date();
			nui.get("year").setValue(myDate.getFullYear());
			//初始化加载数据,默认按照预算年度降序排列
			init();
	    	function init() {
	    		var data = form.getData();
			  	grid.load(data); 
			  	//查询实体，按照业务字典的顺序排序
	    		grid.sortBy("perdegree","asc");
	    	}
	    	var flag = true;
	    	function checkIsRepeat(){
	    		var row = grid.getSelected();
	    		if(!(row.year && row.pertype && row.perdegree)){
	    			return;
	    		}
	    		var data = grid.getData();
	    		if(data.length>1){
	    			for(var i=0;i<data.length;i++){
	    				if(data[i]._id != row._id){
		    				if(data[i].year==row.year && data[i].pertype==row.pertype && data[i].perdegree==row.perdegree){
		    					alert("与第"+(i+1)+ "条数据重复！");
		    					flag = false;
		    					return;
		    				}else{
		    					flag = true;
		    				}
	    				}
	    			}
	    		}
	    	}
	    	
	        
	        //设置业务字典值-人员层次
	        function dictGetAME_EMPTYPE1(e) {
	        	return nui.getDictText('AME_EMPTYPE1',e.value);
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
				var myDate = new Date();
				nui.get("year").setValue(myDate.getFullYear()+1);
				var data = form.getData();
				grid.load(data);
			}
			
	        //添加行
	        function addRow() {
	        	var year = nui.get("year").getValue();
	            var newRow = { name: "New Row",year:year };
	            grid.addRow(newRow, 0);
	        }
	       	function removeRow() {
	        	var row = grid.getSelected();
	            if (row) {
	                grid.removeRow(row, true);
	            }
	        }
	         function onOk(e) {
        		var rows = grid.getChanges();
	        	if (rows.length == 0) {
	        		nui.alert("没有修改的列！","系统提示",null);
	        		return;
	        	}
	        	
	        	for (var i = 0;i < rows.length; i++) {
	        		if (!rows[i].year) {
	        			nui.alert("预算年度不能为空！");
	        			return;
	        		}
	        		if (!rows[i].perdegree) {
	        			nui.alert("人员类型不能为空！");
	        			return;
	        		}
	        	}
	        	nui.confirm("确认保存吗？","系统提示",
	        		function (action) {
	        			if (action == "ok") {
	        				saveData();
	        			}
	        		}
	        	); 
	        }
	        //新增/编辑
	        function saveData() {
        		 var rows = grid.getChanges();
        		 var data = {perBudGetCosts:rows};
        		 var json = nui.encode(data);
        		 nui.ajax({
        		 	 url: "com.primeton.eos.ame_budget.perBudGetCost.perBudGetCost.biz.ext",
        		 	 data: json,
	                 type: 'POST',
	                 cache: false,
	                 contentType: 'text/json',
	                 success: function (text) {
	                 	var returnJson = nui.decode(text);
						if(returnJson.exception == null){
							nui.alert("保存成功", "系统提示",function(){
			              		//CloseWindow("ok");
			              		grid.reload(); 
							});
		              	}else{
		                	nui.alert("保存失败", "系统提示", function(action){
			                  	if(action == "ok" || action == "close"){
			                    	//CloseWindow("saveFailed");
			                  	}
		                  	});
		                }    
	                 },
	                 error: function (jqXHR, textStatus, errorThrown) {
	                 	alert(jqXHR.responseText);
                    	CloseWindow();
	                 }
        		 });
	        }
	        
	        function onCancel(e) {
            	CloseWindow("cancel");
        	}
	        
	        //标准方法接口定义
	        function CloseWindow(action) {           
	            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	            else window.close();            
	        }
	        function rendererRate(e){
	        	return nui.formatNumber(parseFloat(e.value),'p1');
	        }
	        function renderMoney(e){
	        	return formatNumber(e.value,'#,##');
	        }
	        
	        //已有的机构代码不需要编辑
	        function beginedit1(e){
				var selectRow = grid.getSelected();
		    	if(selectRow.name == "New Row"){
		    		grid.setAllowCellEdit(true);
				}else{
					if(e.field == "perdegree"){
						grid.setAllowCellEdit(false);
			    	}else{
			    		grid.setAllowCellEdit(true)
			    	}
				}
			}
		</script>
</body>
</html>