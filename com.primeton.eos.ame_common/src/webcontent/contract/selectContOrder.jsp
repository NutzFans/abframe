<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/nui/common.jsp"%>
<html>
<head>
    <title>选择合同订单</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link id="css_skin" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/coframe/tools/skins/skin1/style.css" />
    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    </style>
</head>
<body> 
	<div class="nui-toolbar" style="text-align:center;" borderStyle="border:0;">
	    <div id="form1">
			<input class="nui-hidden" name="sortField" value="orderreg"/>
			<input class="nui-hidden" name="sortOrder" value="desc"/>
			<table style="width:100%;">
				<tr>
	            	<td align="right"><span>合同编号：</span></td>
	            	<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[0]._value" id = "contnum"/>
	            		<input class="nui-hidden" name="criteria._expr[0]._property" value = "contnum"/>
				        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				    </td>
		        	<td align="right"><span>订单登记日期：</span></td>
	            	<td align="left">
	            		<input class="nui-datepicker" name="criteria._expr[1]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[1]._max" style="width:100px"/>
				        <input class="nui-hidden" name="criteria._expr[1]._property" value="orderreg"/>
				        <input class="nui-hidden" name="criteria._expr[1]._op" value="between"/>
				        <input class="nui-hidden" name="criteria._expr[1]._pattern" value="yyyy-MM-dd"/>
				    </td>
	            	<!-- <td align="right"><span>合同类型：</span></td>
	            	<td align="left">
	            		<input class="nui-dictcombobox" name="criteria._expr[2].contracttype" dictTypeId="MIS_CONTRACTTYPE" multiSelect="true"/>
	            		<input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
				    </td> -->
				    <td align="right"><span>合同销售：</span></td>
	            	<td align="left">
	            		<input class="nui-textbox" name="criteria._expr[3].salename"/>
				        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
				    </td>
				</tr>
				<tr><td align="center" colspan="8"><a class="nui-button" iconCls="icon-search" onclick="search()">查找</a></td></tr>
		    </table>
		</div>
	</div>
	<div class="nui-fit">
		<div id="datagrid1" class="nui-datagrid"  dataField="csContOrders"  url="com.primeton.eos.ame_common.contract.queryContOrder.biz.ext" style= "width: 100%"
	 				allowResize="true" allowCellSelect="true" multiSelect="true" showPager="true" sizeList="[5,10,20,50,100]" onrowdblclick="onRowDblClick">
			<div property="columns"> 
				<div field="contnum" width="100" headerAlign="center">合同编号</div>  
				<div field="salename" width="50" headerAlign="center">合同销售</div>        
				<div field="contorderno" width="100" headerAlign="center">合同订单编号</div>
				<div field="orderreg" width="60" headerAlign="center" dateFormate="yyyy-MM-dd" align="left">订单登记日期</div>                          
				<div field="orderdate" width="60" headerAlign="center" renderer="onDealDate" dateFormate="yyyy-MM-dd" align="left">订单签订日期</div>
				<div field="ordermon" dataType="currency" width="50" headerAlign="center" align="right">合同订单金额</div>
			</div>
		</div>
	</div>
	<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
		<a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
		<span style="display:inline-block;width:25px;"></span>
		<a class="nui-button" style="width:60px;" onclick="onCancel()">取消</a>
	</div>
	<script type="text/javascript">
    nui.parse();
    var grid = nui.get("datagrid1");
	function onGradeRenderer(e) {
		return nui.getDictText('CONT_ORG',e.value);
	}
    loadData();
	function loadData(data){
		var data = nui.clone(data);
		if(data.contnum){
			nui.get("contnum").setValue(data.contnum);
			nui.get("contnum").disable();
		}
		search();
	}
    function search(){
        var form = new nui.Form("#form1");
        var data = form.getData(true,true);
        grid.load(data);
    }
    function GetData() {
		var row = grid.getSelected();
		return row;
    }
    function onKeyEnter(e) {
		search();
    }
    //////////////////////////////////
    function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
    }
    function onOk() {
		var row = grid.getSelected();
		if (!row) {
			nui.alert("请选中一条记录");
			return;
		}
		CloseWindow("ok");
    }
    function onCancel() {
		CloseWindow("cancel");
    }
    function onRowDblClick(e) {
		onOk();
	}
  </script>
</body>
</html>
