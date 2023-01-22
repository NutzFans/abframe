<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- 
  - Author(s): jiangnan
  - Date: 2014-08-15 15:07:11
  - Description:
-->
<script src="../common/nui/nui.js" type="text/javascript"></script>
<%@include file="/common/common.jsp"%>
<head>
	<title>machineQuery</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="../demo.css" rel="stylesheet" type="text/css" />	
</head>
<body>

<div id="form1">

		<input class="nui-hidden" name="sortField" value="id"/>
		<input class="nui-hidden" name="sortOrder" value="desc"/>
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				<tr>
	            	<td align="right"><span>ID：</span></td>
	            	<td>
	            		<input class="nui-textbox" name="criteria._expr[0].id"/>
				        <input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
				        
				    </td>
		        	<td align="right"><span>购买日期：</span></td>
	            	<td>
	            		<input class="nui-datepicker" name="criteria._expr[1]._min" style="width:100px"/>-
	            		<input class="nui-datepicker" name="criteria._expr[1]._max" style="width:100px"/>
				        <input class="nui-hidden" name="criteria._expr[1]._property" value="buytime"/>
				        <input class="nui-hidden" name="criteria._expr[1]._op" value="between"/>
				        <input class="nui-hidden" name="criteria._expr[1]._pattern" value="yyyy-MM-dd"/>
				    </td>
	            	<td align="right"><span>status：</span></td>
	            	<td>
	            		<input class="nui-dictcombobox" name="criteria._expr[2].status" dictTypeId="MIS_MA_STATUS" multiSelect="false" showNullItem="true" nullItemText="全部"/>
	            		<input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
				    </td>
				</tr>
				<tr><td align="center" colspan="8">	
					<a class="nui-button" iconCls="icon-search" onclick="search()">查找</a>
					<!--<a class="nui-button" iconCls="icon-download" onclick="exportContract()">导出到Excel</a>-->
				</td></tr>
		    </table>
		</div>
    </div>
    <div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
                        <a class="nui-button" id="editBtn" iconCls="icon-edit" onclick="edit()">编辑</a>
                        <a class="nui-button" id="deleteBtn" iconCls="icon-remove" onclick="remove()">删除</a>       
                    </td>
                </tr>
            </table>           
        </div>
    </div>
		
    <div id="datagrid1" dataField="machines" class="nui-datagrid" style="width:100%;height:auto;" showSummaryRow="true"
    	url="com.primeton.eos.machine.machine.machineQuery.biz.ext" idField="id" allowResize="true"
    	sizeList="[10,20,30,50,100]" pageSize="10" allowAlternating="true" multiSelect="true">
	    <div property="columns">
	    	<div name="temp123" type="checkcolumn"></div>	    		
	    	<div field="assetnum" width="73" headerAlign="center" allowSort="true" renderer="onTitleRenderer">设备编号</div>
	    	<div field="empname" width="73" headerAlign="center" allowSort="true">负责人</div>
	       	<div field="deptname" width="73" headerAlign="center" allowSort="true">所属部门</div>
	       	<div field="buytime" width="70" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">购买日期</div>
	       	<div field="price" width="73" headerAlign="center" allowSort="true">购买金额</div>
	       	<div field="model" width="73" headerAlign="center" allowSort="true">型号</div>       
			<div field="type" renderer="onTypeRenderer" width="73" headerAlign="center" allowSort="true">机器类型</div>
			
			<div field="endTime" width="70" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">折旧完成日期</div>
			<div field="finishMonth" width="73" headerAlign="center" allowSort="true">已计提月份</div>
			<div field="depreciableAmount" width="73" headerAlign="center" allowSort="true">月折旧额</div>
			<div field="finishMoney" width="73" headerAlign="center" allowSort="true">以前月份累计折旧</div>
			<div field="net" width="73" headerAlign="center" allowSort="true">净资产</div>	       	
	       	<%--折旧完成日期 = 购买日期 + 3年
	       	已计提月份 = 当前月-Month(购买日期)+1
 			以前月份累计折旧 = 已计提月份*月折
 			净资产 = 购买金额 - 以前月份累计折旧--%> 	         	
	    </div>
	</div>
</div>
</body>
</html>
<script type="text/javascript">
	nui.parse();
    var grid = nui.get("datagrid1");
    search();

	function search() {
//		alert("search");
		var form = new nui.Form("#form1");
		var data = form.getData();
		grid.load(data);
	}
	
	function onStatuRenderer(e) {
        return nui.getDictText('MIS_MA_STATUS',e.value);
    }
    	
	function onTypeRenderer(e) {
        return nui.getDictText('MIS_MA_TYPE',e.value);
    }
        	
	function onAreaRenderer(e) {
        return nui.getDictText('EXP_REGION',e.value);
    }    	
	
	function onStorageTypeRenderer(e) {
        return nui.getDictText('MIS_MA_STORAGE',e.value);
    }
    
    function onTitleRenderer(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看机器详细信息'>" + e.value + "</a>";
	}
	function doView(){
		var selectRow = grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条合同数据!");
			return;
		}
		
		var executeUrl = "<%=request.getContextPath() %>/machine/machineView.jsp?id="+selectRow.id;
		window.open(executeUrl, "机器详细信息", "fullscreen=1");
	}
    
    function add() {
		nui.open({
			url: "<%=request.getContextPath() %>/machine/machineModify.jsp",
			title: "新增机器信息", width: 1100, height: 550,
			onload: function () {
				var iframe = this.getIFrameEl();
				var data = { action: "new"};
				iframe.contentWindow.SetData(data);
			},
			ondestroy: function (action) {
				if(action=='save'){
					alert("close save,reloading...");
                    grid.reload();
                }
			}
		});
	}
        
	function edit() {
		var rows = grid.getSelecteds();
		if (rows.length > 1) {
			alert("只能选中一条记录进行编辑");
		}else{
			var row = grid.getSelected();
			if (row) {
				nui.open({
					url: "<%=request.getContextPath() %>/machine/machineModify.jsp",
					title: "修改机器信息", width: 1100, height: 550,
					onload: function () {
						var iframe = this.getIFrameEl();
						var data = { action: "edit", id: row.id };
						iframe.contentWindow.SetData(data);
					},
					ondestroy: function (action) {
						if(action=='save'){
							alert("close save,reloading...");
                   			grid.reload();
                		}
					}
				});
			} else {
				alert("请选中一条记录");
			}
		}
	}

	function remove() {            
		var rows = grid.getSelecteds();
		var data = {machines:rows};
		var json = nui.encode(data);
		if (rows.length > 0) {
			if (confirm("确定删除选中记录？")) {
				grid.loading("操作中，请稍后......");
				nui.ajax({
					url: "com.primeton.eos.machine.machine.deleteMachines.biz.ext",
					type: "post",
					data: json,
					cache: false,
					contentType: 'text/json',
					success: function (text) {
						grid.reload();
					},
					error: function () {}
				});
			}
		} else {
			alert("请选中一条记录");
		}
	}
</script>
