<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 朱勇伦
  - Date: 2017-05-11 11:11:59
  - Description:
-->
<head>
	<title>选择U8客户</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>
</head>
<body>
<div class="nui-fix">
		<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
			            <td align="right">客户名称：</td>
			            <td align="left">
				           	<input name="criteria._expr[0]._value" class="nui-textbox"  style="width:100px;" onenter="onKeyEnter"/>
				          	<input class="nui-hidden" name="criteria._expr[0]._property" value="ccusname" />
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			    		</td>
			            <td align="right">客户类型：</td>
			            <td align="left">
				           	<input name="criteria._expr[1]._value" class="nui-textbox"  style="width:100px;" onenter="onKeyEnter"/>
				          	<input class="nui-hidden" name="criteria._expr[1]._property" value="customerclass.cccname" />
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
			        	</td>
			        </tr>
		    		<!-- <tr>
			    		<td align="right">供应商简称：</td>
			    		<td align="left">
				           	<input name="criteria._expr[2]._value" class="nui-textbox"  style="width:100px;" onenter="onKeyEnter"/>
				          	<input class="nui-hidden" name="criteria._expr[2]._property" value="cpersonname" />
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
				        </td>
		    		</tr> -->
		    		<tr>
		    			<td align="center" colspan="6">
		    				<a class="nui-button" style="width:60px;" onclick="search()">查询</a>
		    				<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		    			</td>
		    		</tr>
				</table>
			</div>
			<div id="datagrid1" class="nui-datagrid" dataField="customers" style="width:100%;height:195px;" 
		        	url="com.primeton.eos.ame_common.chooiseU8.querycustomer_U8.biz.ext" sizeList="[5,15,25,50]"
		        	pageSize="5" showPageInfo="true" multiSelect="false" 
		        	allowSortColumn="false" onrowdblclick="onRowDblClick">
		        	<div property="columns">
		        		<div type="indexcolumn" width="30" headerAlign="center">序号</div>
		                <div type="checkcolumn" width="30">选择</div>
		                <div field="ccuscode" width="70" headerAlign="center" allowSort="true" >客户CODE</div>
		                <div field="ccusname" width="170" headerAlign="center" allowSort="true" >客户名称</div>
		                <div field="ccusabbname" width="170" headerAlign="center" allowSort="true" >客户简称</div>
		                <div field="customerclass.cccname" width="120" headerAlign="center" allowSort="true" >客户类型</div>
		            </div>
			</div>
			<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
			        <a class="nui-button" style="width:60px;margin-right:20px;" onclick="onOk()">确定</a>
			        <a class="nui-button" style="width:60px;" onclick="onCancel()">关闭</a>
		    </div>
		</div>
	</div>
	<script type="text/javascript">
        nui.parse();
		var form = new nui.Form("#form1");
        var grid = nui.get("datagrid1");
        
        //初始化
        init();
    	function init(){
			var data = form.getData();
    		grid.load(data);
		}
		
		//查询
        function search() {
            var form = new nui.Form("#form1");
            var json = form.getData();
            grid.load(json);//grid查询
        }
        
        //重置查询条件
        function reset(){
            form.reset();
            var data = form.getData();
    		grid.load(data);
        }
        
        //关闭
        function onCancel() {
			CloseWindow("cancel");
		}
		
		//获取选中行
		function GetData() {
			var row = grid.getSelected();
			return row;
		}
		
		//重新刷新页面
        function refresh(){
            var form = new nui.Form("#form1");
            var json = form.getData(false,false);
            grid.load(json);//grid查询
        }
        
        function onRowDblClick() {
			onOk();
		}
		
		//enter键触发查询
        function onKeyEnter(e) {
            search();
        }
        
        function onOk() {
        	var row = grid.getSelected();
        	if(row==null){
        		nui.alert("请选中一条数据！")
        		return;
        	}else
        	{
        		CloseWindow("ok");
        	}
			
		}
		
		function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
		}
	</script>
</body>
</html>	