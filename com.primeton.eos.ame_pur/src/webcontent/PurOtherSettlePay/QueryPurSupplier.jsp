<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): xuqq
  - Date: 2017-01-09 11:06:29
  - Description:
-->
<head>
	<title>选择供应商</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>
</head>
<body>
	<div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;" id="form1">
          <label >供应商名称：</label>
           	<input name="criteria._expr[0]._value" class="nui-textbox"  style="width:100px;" onenter="onKeyEnter"/>
          	<input class="nui-hidden" name="criteria._expr[0]._property" value="custname" />
	        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
	        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
          <a class="nui-button" style="width:60px;" onclick="search()">查询</a>
    </div>
    <div class="nui-fit">
    	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%;" allowResize="true" onrowdblclick="onRowDblClick" dataField="purSuppliers" url="com.primeton.eos.ame_pur.PurOtherSettlePay.queryPurSupplier.biz.ext" sizeList="[10,20,50,100]" pageSize="15"  multiSelect="false">
			<div property="columns">
				<div type="checkcolumn" width="25"></div>	
				<div field="custid" width="0" align="center" headerAlign="center" allowSort="true">客户ID</div>		
				<div field="custname" width="125" align="center" headerAlign="center" renderer="getDetail" allowSort="true">供应商名称</div>
				<div field="suppliersname" width="80" align="center" headerAlign="center" allowSort="true">供应商简称</div>							
				<div field="custnum" width="90" align="center" headerAlign="center"  allowSort="true">供应商编号</div>
				<div field="status" width="60" align="center" headerAlign="center" renderer="dictStatus" allowSort="true">供应商状态</div>	
				<div field="registercap" width="0" align="center"  headerAlign="center"allowSort="true">注册资本</div>
				<div field="createDate" width="0" align="center" headerAlign="center"allowSort="true">登记日期</div>				
			</div>
		</div>
	</div>  
    <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="onCancel()">关闭</a><br/>
    </div>



	<script type="text/javascript">
		nui.parse();
		var grid = nui.get("datagrid1");
		
		init();
		function init(){
			grid.load(null,function(){
				alert("1");
			});
			grid.sortBy("custid", "desc");
			
		}
		
		//设置业务字典值-供应商状态
		function dictStatus(e){
			return nui.getDictText('AME_SUPSTATUS',e.value);
		}
			
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData();
			grid.load(data,function(a){
				if(a.total==0){
					alert("没有符合条件的供应商，如需要增加请联系商务！");
				}
			});
		}
		 
		function GetData() {
			var row = grid.getSelected();
			return row;
		}
		 
		function onKeyEnter(e) {
			search();
		}
		    
		function onRowDblClick(e) {
			onOk();
		}
	
		function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
		}
		
		function onOk() {
			var row = grid.getSelected();
			if(row.status!=1){
				alert("供应商无效或审核中！");
				return;
			}
			CloseWindow("ok");
		}
		
		function onCancel() {
			CloseWindow("cancel");
		} 
	</script>
</body>
</html>