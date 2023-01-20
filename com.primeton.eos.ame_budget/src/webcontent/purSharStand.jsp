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
<title>公共费用公摊标准</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="mini-panel" title="公共费用公摊标准" width="auto">
		<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
			<div class="nui-toolbar"style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>预算年度：</span></td>
			           	<td align="left">
						    <input name="criteria._expr[0]._value" class="nui-textbox"  style="width:204px;" id="year"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="year"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td>
						<td align="right"><span>城市：</span></td>
			           	<td align="left">
						    <input name="criteria._expr[1]._value" class="nui-dictcombobox" dictTypeId="EXP_REGION" style="width:212px;" showNullItem="true" nullItemText=""/>
							<input class="nui-hidden" name="criteria._expr[1]._property" value="citycode"/>
							<input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
						</td>
						<td align="right"><span>公摊费用：</span></td>
			           	<td align="left">
			           		<input class="nui-textbox" name="criteria._expr[2]._min" style="width:100px"/>
			           		-
			           		<input class="nui-textbox" name="criteria._expr[2]._max" style="width:100px"/>(元)
			           		<input class="nui-hidden" name="criteria._expr[2]._property" value="sharfee"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
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
                        		<span class="separator"></span>
                        		<a class="nui-button" iconCls="icon-remove" onclick="removeRow()">删除</a>
                        		<span class="separator"></span>
                        		<a class="nui-button" iconCls="icon-save" onclick="onOk">保存</a>       
                        		<span class="separator"></span>
                        		<a class="nui-button" iconCls="icon-reload" onclick="refresh()">刷新人均公摊费用</a>       
			                </td>
			            </tr>
			        </table>
			    </div>
			</div>
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="pubSharStands" showSummaryRow="true" ondrawsummarycell="doDrawSummaryRow"
		        	url="com.primeton.eos.ame_budget.pubSharStand.queryPubSharStand.biz.ext" oncellendedit="validateAndcalMoney"
		        	allowCellEdit="true" allowCellSelect="true" multiSelect="true" showPager="false" 
        			editNextOnEnterKey="true" editNextRowCell="true" >
		        <div property="columns">
		               <div type="checkcolumn" width="30"></div>
		               <div field="sharstandid" width="0" align="center" headerAlign="center">编号
		               		<input property="editor" class="nui-textbox"style="width:100%;"/>
		               </div>
		               <div field="year" width="70" align="center" headerAlign="center">预算年度
		               		<input property="editor" class="nui-spinner" allowLimitValue="false" increment="0" inputStyle="text-align:center;" showbutton="false"/>
		               </div>
		               <div field="citycode" width="70" align="center" headerAlign="center" renderer="dictGetEXP_REGION">城市
		               		<input property="editor" class="nui-dictcombobox" dictTypeId="EXP_REGION" id="citycode" allowInput="true" inputStyle="text-align:center;"/>
		               </div>
		               <div field="totalmoney" width="90" align="right" headerAlign="center" renderer="renderMoney" summaryType="sum">城市公摊总金额
		               		<input property="editor" style="width:100%;" class="nui-spinner" allowLimitValue="false" changeOnMousewheel="false" inputStyle="text-align:right;" format="n0" showbutton="false"/>
		               </div>
		               <div field="totalmonthsnum" width="90" align="right" headerAlign="center" renderer="renderMoney" summaryType="sum">总人月数
<!-- 		               		<input property="editor" style="width:100%;" class="nui-spinner"allowLimitValue="false" changeOnMousewheel="false" inputStyle="text-align:right;" format="n0" showbutton="false"/> -->
		               </div>
		               <div field="sharfee" width="70" align="right" headerAlign="center" renderer="renderMoney" summaryType="avg">人均公摊费用
<!-- 		               		<input property="editor" style="width:100%;" class="nui-spinner" allowLimitValue="false" changeOnMousewheel="false" inputStyle="text-align:right;" format="n0" showbutton="false"/> -->
		               </div>
		        </div>
		    </div>
		    <div><strong><font color="red" size="2">公摊操作说明：</font></strong></div>
		    <div style="padding-left: 38px"><font color="red" size="2">
		    <strong>新增/编辑某年某城市公摊总金额：</strong>
		    总人月数根据公摊预算人数动态计算出总人月数从而得到人均公摊费用，城市公摊总金额/总人月数=人均公摊费用。再根据人均公摊费用刷新公摊预算在该城市的公摊金额，人均公摊费用*每月人数=每月公摊金额。
		    </font></div>
		    <div style="padding-left: 38px"><font color="red" size="2">
		  <strong> 删除：</strong>
		   删除某年该城市的公摊标准数据，并把公摊预算在该城市的金额置为0。
		    </font></div>
		    <div style="padding-left: 38px"><font color="red" size="2">
		   <strong>刷新人均公摊费用：</strong>
		   根据某年各个城市公摊总金额，以及各个城市公摊预算的总人月数，计算各个城市人均公摊费用，并根据计算出的人均公摊费用，刷新各个城市公摊预算的公摊金额。
		    </font></div>
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
	    		grid.sortBy("year","desc");
	    	}
	    	
	    	var flag = true;
	    	function checkIsRepeat(e){
	    		if(e.field=="citycode"){
		        	if(e.field=="citycode"){
		        		//datacell里面竟然可以用id标志唯一
		        		var cityname = nui.get("citycode").getText();
		        		var row = grid.getSelected();
	                    var rowData = {cityname:cityname};
	                    grid.updateRow(row,rowData);
	        		}
	        	}
	    		var row = grid.getSelected();
	    		if(!(row.year && row.citycode)){
	    			return;
	    		}
	    		var data = grid.getData();
	    		if(data.length>1){
	    			for(var i=0;i<data.length;i++){
	    				if(data[i]._id != row._id){
		    				if(data[i].year==row.year && data[i].citycode==row.citycode){
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
	    	//设置业务字典值-人员类型
	        function dictGetEXP_REGION(e) {
	        	return nui.getDictText('EXP_REGION',e.value);
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
	        		nui.alert("没有修改的列！");
	        		return;
	        	}
	        	
	        	for (var i = 0;i < rows.length; i++) {
	        		if (!rows[i].year) {
	        			nui.alert("预算年度不能为空！");
	        			return;
	        		}
	        		if (!rows[i].citycode) {
	        			nui.alert("城市代码不能为空！");
	        			return;
	        		}
	        	}
	        	var rows = grid.getChanges();
        		var json = {pubSharStands:rows};
	        	nui.ajax({
        		 	 url: "com.primeton.eos.ame_budget.pubSharStand.validateShareStand.biz.ext",
        		 	 data: json,
	                 type: 'POST',
	                 cache: false,
	                 contentType: 'text/json',
	                 success: function (o) {
	                 	if(o.cont>0){
	                 		alert("已存在新增的公摊数据！");
	                 		return;
	                 	}else{
	                 		nui.confirm("确认保存吗？","系统提示",
				        		function (action) {
				        			if (action == "ok") {
				        				saveData();
				        			}
				        		}
				        	); 
	                 	}
	                 },
	                 error: function (jqXHR, textStatus, errorThrown) {
	                 	alert(jqXHR.responseText);
	                 }
        		 });
	        }
	        //保存数据
	        function saveData() {
        		 var rows = grid.getChanges();
        		 var json = {pubSharStands:rows};
        		 nui.ajax({
        		 	 url: "com.primeton.eos.ame_budget.pubSharStand.pubSharStand.biz.ext",
        		 	 data: json,
	                 type: 'POST',
	                 cache: false,
	                 contentType: 'text/json',
	                 success: function (text) {
	                 	var returnJson = nui.decode(text);
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
	                 },
	                 error: function (jqXHR, textStatus, errorThrown) {
	                 	alert(jqXHR.responseText);
	                 }
        		 });
	        }
	        function renderMoney(e){
	        	return formatNumber(e.value,'#,##');
	        }
	        /*  刷新按钮
		        1、从DEPT_SHAR_BUDGET里捞某特定城市的人月总数，并计算该城市人均公摊费用。
		        2、用计算后的 人均费用，重新计算DEPT_SHAR_BUDGET表里面对应城市的公摊金额 
	        */
	        function refresh(){
	        	var year = nui.get("year").getValue();
	        	if(!year){
	        		alert("请输入预算年度！");
	        		return;
	        	}
	        	if(!confirm("本次刷新将根据公摊总金额和公摊人员(存量+招聘)重新计算人均公摊费用以及所有该城市的预算的公摊金额!\n\n确认刷新？")){
	        		return;
	        	}
	        	var json = {year:year};
	        	nui.ajax({
        		 	 url: "com.primeton.eos.ame_budget.pubSharStand.refreshPubSharStand.biz.ext",
        		 	 data: json,
	                 type: 'POST',
	                 cache: false,
	                 contentType: 'text/json',
	                 success: function (text) {
	                 	var returnJson = nui.decode(text);
						if(returnJson.exception == null){
							alert("刷新成功");
							var data = form.getData();
		  					grid.load(data); //datagrid加载数据 
		              	}else{
		                	alert("刷新失败");
		                }    
	                 },
	                 error: function (jqXHR, textStatus, errorThrown) {
	                 	alert(jqXHR.responseText);
	                 }
        		 });
	        }
	        var flag = "";
	        function validateAndcalMoney(e){
	        	//先校验是否重复
	        	var row = e.record;
	    		if(!(row.year && row.citycode)){
	    			return;
	    		}
	    		var data = grid.getData();
	    		if(data.length>1){
	    			for(var i=0;i<data.length;i++){
	    				if(data[i]._id != row._id){
		    				if(data[i].year==row.year && data[i].citycode==row.citycode){
		    					alert("已存在"+row.year+"该城市的公摊标准！");
		    					var rowData = {totalmonthsnum:0,sharfee:0};
	                    		grid.updateRow(row,rowData);
		    					flag = false;
		    					return;
		    				}else{
		    					flag = true;
		    				}
	    				}
	    			}
	    		}
	    		//没有重复，如果是新增或者编辑(单纯点了一下state是没有值的)
	        	if(e.record._state=="added"||e.record._state=="modified"){
	        		//修改总金额触发计算效果
		        	if(e.field=="totalmoney"){
		        		var json  = {pubSharStand:row};
		        		nui.ajax({
		        		 	 url: "com.primeton.eos.ame_budget.pubSharStand.calPubSharStand.biz.ext",
		        		 	 data: json,
			                 type: 'POST',
			                 cache: false,
			                 contentType: 'text/json',
			                 success: function (text) {
			                 	var returnJson = nui.decode(text);
								if(returnJson.exception == null){
		                    		grid.updateRow(row,text.pubSharStand);
				              	}else{
				                	alert("人月数获取失败！");
				                }    
			                 },
			                 error: function (jqXHR, textStatus, errorThrown) {
			                 	alert(jqXHR.responseText);
			                 }
		        		 });
		        	}
	        	}
	        }
	        
	        function doDrawSummaryRow(e){
				if (e.field == "totalmoney") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
	            }
				if (e.field == "totalmonthsnum") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
	            }
				if (e.field == "sharfee") {
	                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
	            }
			}
		</script>
</body>
</html>