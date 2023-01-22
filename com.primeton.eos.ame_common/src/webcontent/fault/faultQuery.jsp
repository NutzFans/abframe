<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<head>
	<title>故障查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div id="form1">
		<input class="nui-hidden" name="sortField" value="probid"/>
		<input class="nui-hidden" name="sortOrder" value="desc"/>
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				<tr>
		        	<td align="right"><span>故障类型：</span></td>
	            	<td align="left">
	            		<input class="nui-dictcombobox" name="criteria._expr[0]._value" showNullItem="true" nullItemText="全部" dictTypeId="MIS_FA_TYPE" multiSelect="false" style="width:100px"/>
				        <input class="nui-hidden" name="criteria._expr[0]._property" value="probtype"/>
				        <input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
				    </td>
				    <td align="right"><span>故障发现人：</span></td>
	            	<td align="left">
	            		<input class="nui-hidden" name="criteria._expr[1]._property" value="probfinder"/>
				        <input class="nui-hidden" name="criteria._expr[1]._op" value="in" id="findercond1"/>
				        <input class="nui-hidden" name="criteria._expr[1]._ref" value="1" id="findercond2"/>
						<input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
				        <input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="finder"/>					        
				        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="userid"/>
				        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
				        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="empname">
				        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
				    </td>
				    <td align="right"><span>故障发现日期：</span></td>
	            	<td align="left">
	            		<input class="nui-datepicker" name="criteria._expr[2]._min" style="width:100px"/>-
	            		<input class="nui-datepicker" name="criteria._expr[2]._max" style="width:100px"/>
				        <input class="nui-hidden" name="criteria._expr[2]._property" value="probfinddate"/>
				        <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
				        <input class="nui-hidden" name="criteria._expr[2]._pattern" value="yyyy-MM-dd"/>
				    </td>
	    		</tr>
	    		<tr><td align="right"></td>
	            	<td align="left"></td>
				    <td align="right"><span>故障处理人：</span></td>
	            	<td align="left">
	            		<input class="nui-hidden" name="criteria._expr[3]._property" value="probdealer" id="dealercond3"/>
				        <input class="nui-hidden" name="criteria._expr[3]._op" value="in" id="dealercond1"/>
				        <input class="nui-hidden" name="criteria._expr[3]._ref" value="3" id="dealercond2"/>				        	
						<input class="nui-hidden" name="criteria._ref[1]._id" value="2"/>
				        <input class="nui-textbox" name="criteria._ref[1]._expr[0]._value" id="dealer"/>					        
				        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="userid"/>
				        <input class="nui-hidden" name="criteria._ref[1]._entity" value="org.gocom.abframe.dataset.organization.OmEmployee"/>
				        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="empname">
				        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._likeRule" value="all"/>				        
						<input class="nui-hidden" name="criteria._ref[2]._id" value="3"/>
				        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._property" value="probdealer"/>					        
				        <input class="nui-hidden" name="criteria._ref[2]._select._field[0]" value="probid"/>
				        <input class="nui-hidden" name="criteria._ref[2]._entity" value="com.primeton.eos.fault.fault.MisProbinfoDeal"/>
				        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._op" value="in"/>			        
				        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._ref" value="2"/>
				    </td>
				    <td align="right"><span>故障处理日期：</span></td>
	            	<td align="left">
	            		<input class="nui-hidden" name="criteria._expr[4]._property" value="probdealdate" id="dealdatecond3"/>
				        <input class="nui-hidden" name="criteria._expr[4]._op" value="in" id="dealdatecond1"/>
				        <input class="nui-hidden" name="criteria._expr[4]._ref" value="4" id="dealdatecond2"/>
						<input class="nui-hidden" name="criteria._ref[3]._id" value="4"/>
				        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._property" value="probdealdate"/>			        
				        <input class="nui-datepicker" name="criteria._ref[3]._expr[0]._min" style="width:100px" id="dealdatemin"/>-
				        <input class="nui-datepicker" name="criteria._ref[3]._expr[0]._max" style="width:100px" id="dealdatemax"/>					        				        					        					        
				        <input class="nui-hidden" name="criteria._ref[3]._select._field[0]" value="probid"/>
				        <input class="nui-hidden" name="criteria._ref[3]._entity" value="com.primeton.eos.fault.fault.MisProbinfoDeal"/>
				        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._op" value="between"/>			        
				        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._pattern" value="yyyy-MM-dd"/>
				    </td>
	    		</tr>
	    		<tr>
	    			<td align="center" colspan="6">
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
					</td>
				</tr>
		    </table>
	    </div>
	</div>
    <div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
            		<td>
                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add">故障新增</a>
                        <a class="nui-button" id="updateBtn" iconCls="icon-edit" onclick="edit">故障修改</a>
                        <a class="nui-button" id="dealBtn" iconCls="icon-edit" onclick="deal">故障处理</a>	                        
                    </td>
                </tr>
            </table>           
        </div>
	</div>
	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:415px;" url="com.primeton.eos.ame_common.fault.faultQuery.biz.ext"  
	     idField="probid" sizeList="[5,10,20,50]" pageSize="15" multiSelect="true" allowResize="true" allowCellEdit="true" allowCellSelect="true">
		<div property="columns">
        	<div type="checkcolumn"></div>
        	<div field="probid" width="0" headerAlign="center" >故障id</div>
        	<div field="probdesc" width="200" headerAlign="center" allowSort="false" renderer="onActionRenderer">故障简述</div>	        	
        	<div field="probtype" width="80" headerAlign="center" renderer="dictFaultType" allowSort="true">故障类型</div>
        	<div field="servname" width="60" headerAlign="center">服务器名称</div>
        	<div field="appchname" width="60" headerAlign="center">应用名称</div>
        	<div field="dbname" width="60" headerAlign="center">数据库名称</div>
        	<div field="probfindername" width="60" headerAlign="center">故障发现人</div>
        	<div field="probfinddate" width="80" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">故障发现日期</div>
	        <div field="probdealresult" width="400" headerAlign="center" allowSort="true">故障处理结果</div>
	    </div>
	</div>
	<script type="text/javascript">
		var userid = "<b:write property='userObject/userId' scope='session'/>";
		var orgid = "<b:write property='userObject/userOrgId' scope='session'/>";
		var form = new nui.Form("#form1");
		nui.parse();
		var grid=nui.get("datagrid1");
		init();
		
		function init(){
			var isAdmin=false;
			var isFinance=false;
			var isOrgLeader=false;
			<l:iterate id="roles" property="userObject/attributes/roles" scope="session">
				var roleid = "<b:write iterateId='roles' property='roleid'/>";
				if(roleid == "admin"){
					isAdmin = true;
				} else if(roleid == "finance"){
					isFinance = true;
				}
			</l:iterate>
			
			var data = form.getData();
			grid.load(data);
	
		}
		
		function search(){
	
				if(nui.get("finder").getValue()==""){
					nui.get("findercond1").setValue("=");
					nui.get("findercond2").setValue("");
				} else {
					nui.get("findercond1").setValue("in");
					nui.get("findercond2").setValue("1");
				}
				
				if(nui.get("dealer").getValue()==""){
					nui.get("dealercond1").setValue("=");
					nui.get("dealercond2").setValue("");
					nui.get("dealercond3").setValue("probdealer");
				} else {
					nui.get("dealercond1").setValue("in");
					nui.get("dealercond2").setValue("3");
					nui.get("dealercond3").setValue("probid");				
				}
				
				if((nui.get("dealdatemin").getValue() == "") && (nui.get("dealdatemax").getValue() == "")) {
					nui.get("dealdatecond1").setValue("in");
					nui.get("dealdatecond2").setValue("4");
					nui.get("dealdatecond3").setValue("probdealdate");
				} else {
					nui.get("dealdatecond1").setValue("in");
					nui.get("dealdatecond2").setValue("4");
					nui.get("dealdatecond3").setValue("probid");				
				}		
			
			var data = form.getData();
	        grid.load(data);
		}
	
	 	function onActionRenderer(e) {
	 		return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
	 	}
	 
	 	function doView(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/ame_common/fault/faultDetail.jsp?probid=" + selectRow.probid;
			window.open(executeUrl, "故障详细信息", "fullscreen=1");
	    }
		
		function edit() {
			var rows = grid.getSelecteds();
	    	if (rows.length > 1) {
	    		nui.alert("只能选中一条故障进行修改");
	    	}else{
				var row = grid.getSelected();
		    	if(!row){
					nui.alert("请选择其中一条故障数据!");
					return;
				}
		        if (row) {
		            nui.open({
		                url: "<%=request.getContextPath() %>/ame_common/fault/faultModify.jsp",
		                title: "故障修改", width: 900, height: 500,
		                onload: function () {
		                    var iframe = this.getIFrameEl();
		                    var data = {action: "edit", probid: row.probid};
		                    iframe.contentWindow.SetData(data);
		                },
		                ondestroy: function (action) {
		                    grid.reload();
		                }
		            });
		        } 
	       }
	    }
	
		function add() {
	            nui.open({
	                url: "<%=request.getContextPath() %>/ame_common/fault/faultAdd.jsp",
	                title: "故障新增", width: 900, height: 500,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = {action: "new"};
	                    iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
	      	       		if(action=='save'){
	        	        	grid.reload();
	        	        	nui.alert("故障增加成功！");
	                	}
	                }
	            });
	        }
	
		function deal() {
			var rows = grid.getSelecteds();
	    	if (rows.length > 1) {
	    		nui.alert("只能选中一条故障进行处理");
	    	}else{
				var row = grid.getSelected();
		    	if(!row){
					nui.alert("请选择其中一条故障数据!");
					return;
				}
		        if (row) {
		            nui.open({
		                url: "<%=request.getContextPath() %>/ame_common/fault/faultDeal.jsp",
		                title: "故障处理", width: 900, height: 500,
		                onload: function () {
		                    var iframe = this.getIFrameEl();
		                    var data = {probid: row.probid};
		                    iframe.contentWindow.SetData(data);
		                },
		                ondestroy: function (action) {
		                    grid.reload();
		                }
		            });
		        } 
	       }
	    }
	
		
		function onTypeFilterChanged(e){
			var tempType = e.value;
			getSecType(tempType);
		}
		
		
		function dictFaultType(e){
			return nui.getDictText("MIS_FA_TYPE",e.value);
		}
	  
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			init();
		}
		
		function onCancel(e) {
			if (window.CloseOwnerWindow) 
				return window.CloseOwnerWindow(e);
	        else window.close();  
	    }
	    
	</script>
</body>
</html>