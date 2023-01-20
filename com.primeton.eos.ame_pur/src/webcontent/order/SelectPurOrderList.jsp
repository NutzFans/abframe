<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2016-06-16 18:34:33
  - Description:
-->
<head>
	<title>选择订单页面</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-panel" title="采购订单查询" style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				<tr>
					<td>采购合同编号：</td>
					<td>
						<input class="nui-textbox" name="criteria._expr[0]._value" style="width:100px;"/>
						<input class="nui-hidden" name="criteria._expr[0]._property" value="purcontid"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
					</td>
					<td>采购订单编号：</td>
					<td>
						<input class="nui-textbox" name="criteria._expr[1]._value" style="width:100px;"/>
						<input class="nui-hidden" name="criteria._expr[1]._property" value="purorderid"/>
					    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
					</td>
					<td>采购订单编码：</td>
					<td>
						<input class="nui-textbox" name="criteria._expr[2]._value" style="width:100px;"/>
						<input class="nui-hidden" name="criteria._expr[2]._property" value="purordernum"/>
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
	<div class="nui-panel" title="采购订单信息列表" style="width:100%;height:85%;" showToolbar="false" showFooter="false" >
        <div id="datagrid1" class="nui-datagrid" dataField="purOrders" style="width:100%;height:195px;" 
        	url="com.primeton.eos.ame_pur.order.queryOrderListOpen.biz.ext" sizeList="[5,15,25,50]"
        	pageSize="5" showPageInfo="true" multiSelect="false" 
        	allowSortColumn="false" onrowdblclick="onRowDblClick">
            <div property="columns">
                <div type="indexcolumn" width="30"></div>
                <div type="checkcolumn" width="30"></div>
                <div field="purContract.purcontid" headerAlign="center" allowSort="true" >采购合同编号</div>
                <div field="purorderid" headerAlign="center" allowSort="true" >采购订单编号</div>
                <div field="purordernum" headerAlign="center" allowSort="true" >采购订单编码</div>
                <div field="signdate" headerAlign="center" allowSort="true" 
                	dateFormat="yyyy-MM-dd HH:mm:ss" >签订日期</div>
                <div field="calcycle" headerAlign="center" allowSort="true" >结算周期说明</div>
                <div field="purstatus" headerAlign="center" allowSort="true" >状态</div>
                <div field="userid" headerAlign="center" allowSort="true" >服务客户</div>
                <div field="projectno" headerAlign="center" allowSort="true" >项目</div>
                <div field="signuserid" headerAlign="center" allowSort="true" >协议签订人员</div>
                <div field="contmemo" headerAlign="center" allowSort="true" >协议内容说明</div>
                <div field="processinstid" headerAlign="center" allowSort="true" >流程实例ID</div>
            </div>
        </div>
        <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
	        <a class="nui-button" style="width:60px;margin-right:20px;" onclick="onOk()">确定</a>
	        <a class="nui-button" style="width:60px;" onclick="onCancel()">取消</a>
	    </div>
	</div>
	<script type="text/javascript">
        nui.parse();
		var form = new nui.Form("#form1");
        var grid = nui.get("datagrid1");
        
		init();
    	function init(){
    		grid.load();
    		grid.sortBy("purorderid","desc");
		}
		
        function GetData() {
			var row = grid.getSelected();
			return row;
		}

        //重新刷新页面
        function refresh(){
            var form = new  nui.Form("#form1");
            var json = form.getData(false,false);
            grid.load(json);//grid查询
        }

        //查询
        function search() {
            var form = new nui.Form("#form1");
            var json = form.getData();
            grid.load(json);//grid查询
        }
        
        function onRowDblClick() {
			onOk();
		}
		
		function onOk() {
			CloseWindow("ok");
		}
		
		function onCancel() {
			CloseWindow("cancel");
		}

        //重置查询条件
        function reset(){
            var form = new nui.Form("#form1");//将普通form转为nui的form
            form.reset();
        }

        //enter键触发查询
        function onKeyEnter(e) {
            search();
        }

        function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
		}
    </script>
</body>
</html>