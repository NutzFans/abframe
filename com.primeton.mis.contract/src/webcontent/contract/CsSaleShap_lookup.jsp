<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): primeton
  - Date: 2017-04-10 15:02:59
  - Description:
-->
<head>
	<title>销售线索</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<%@include file="/nui/common.jsp"%>
	<link id="css_skin" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/coframe/tools/skins/skin1/style.css" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
    html, body{
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
	<div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;">
		<div id="form1">
			<input class="nui-hidden" name="criteria._entity" value="com.primeton.mis.contract.contract.CsSaleshap"/>
			<table style="width:100%;" class="table">
				<tr>
					<td align="right" style="width: 80px;">终端销售：</td>
					<td align="left">
						<input class="nui-hidden" name="criteria._expr[0]._property" value="directsaleid"/>
						<input class="nui-hidden" name="criteria._expr[0]._op" value="in"/>
						<input class="nui-textbox" onEnter='onKeyEnter' name="criteria._expr[0]._value"  style="width: 100px;"/>
					</td>
					<td align="right" style="width: 80px;">日期：</td>
	            	<td align="left">
	            		<input class="nui-datepicker" name="criteria._expr[1]._min" style="width:98px"/>-<input class="nui-datepicker" name="criteria._expr[1]._max" style="width:98px"/>
				        <input class="nui-hidden" name="criteria._expr[1]._property" value="insertdate"/>
				        <input class="nui-hidden" name="criteria._expr[1]._op" value="between"/>
				        <input class="nui-hidden" name="criteria._expr[1]._pattern" value="yyyy-MM-dd"/>
				    </td>
				    <td align="right" style="width: 80px;">所属类型：</td>
	            	<td align="left">
	            		<input class="nui-dictcombobox" name="criteria._expr[2]._value" dictTypeId="MIS_COMPANYTYPE"  showNullItem="true" nullItemText="全部"  style="width: 100px;"/>
	            		<input class="nui-hidden" name="criteria._expr[2]._property" value="belongtype"/>
	            		<input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
				    </td>
				    <td align="right" style="width: 80px;">来源：</td>
	            	<td align="left">
	            		<input class="nui-dictcombobox" name="criteria._expr[3]._value" dictTypeId="MIS_SALESKEY_SOURCE"  showNullItem="true" nullItemText="全部"  style="width: 100px;"/>
	            		<input class="nui-hidden" name="criteria._expr[3]._property" value="source"/>
	            		<input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
				    </td>
				</tr>
				<tr>
				    <td align="right" style="width: 80px;">公司名称：</td>
					<td align="left">
						<input class="nui-textbox" name="criteria._expr[4]._value" style="width: 100px;"/>
						<input class="nui-hidden" name="criteria._expr[4]._property" value="corpname"/>
						<input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
					</td>
					<td align="right" style="width: 80px;">线索描述：</td>
					<td align="left">
						<input class="nui-textbox" name="criteria._expr[5]._value" style="width: 202px;"/>
						<input class="nui-hidden" name="criteria._expr[5]._property" value="telcontent"/>
						<input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
					</td>
				    <td align="right" style="width: 80px;">搜索词：</td>
					<td align="left">
						<input class="nui-textbox" name="criteria._expr[6]._value" style="width: 100px;"/>
						<input class="nui-hidden" name="criteria._expr[6]._property" value="keyword"/>
						<input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
					</td>
					<td >
					<a class="nui-button" iconCls="icon-search" onclick="search"> 查询</a>
					</td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
	<div class="nui-fit">
		<div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%;" idField="salesid" 
	    	url="com.primeton.mis.contract.contract.queryCsSaleShap.biz.ext" dataField="cssaleshap" 
	    	sizeList=[5,10,20,50,100] multiSelect="false" pageSize="10" onrowdblclick="onRowDblClick" >
			<div property="columns" >
				<div type="checkcolumn"></div>
				<div field="insertdate" width="70" allowSort="true" dateFormat="yyyy-MM-dd "headerAlign="center" renderer="dateRenderer" >日期</div>
				<div field="corpname" width="120" allowSort="true" headerAlign="center" >公司名称</div>
				<div field="telcontent" width="250" allowSort="true" headerAlign="center" >线索描述</div>
				<div field="salesuserid" width="60" allowSort="true" headerAlign="center" >转交销售</div>
				<div field="directsaleid" width="60" allowSort="true" headerAlign="center" >终端销售</div>
				<div field="belongtype" width="60" allowSort="true" headerAlign="center" renderer="onBelongtypeRenderer">所属类型</div>
				<div field="source" width="60" allowSort="true" headerAlign="center"  renderer="onSourceRenderer">来源</div>
				<div field="keyword" width="60" allowSort="true" headerAlign="center" >搜索词</div>
				<div field="distributdate" width="60" allowSort="true" dateFormat="yyyy-MM-dd "headerAlign="center" >终端销售分配时间</div>
			</div>
		</div>
	</div>
	<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
    	<a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
    	<span style="display:inline-block;width:25px;">
    	</span>
    	<a class="nui-button" style="width:60px;" onclick="onCancel()">取消</a>
	</div>
	<script type="text/javascript">
	    nui.parse();
	    var grid = nui.get("datagrid1");
	    
		function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return decodeURIComponent(r[2]); 
			return null; 
		}
		var salesnames = getUrlParam("salesnames");
		nui.getbyName("criteria._expr[0]._value").setValue(salesnames);
		search();
	
	    function search(){
			var form = new nui.Form("#form1");
			var data = form.getData(true,true);
		    grid.sortBy("distributdate","desc");
			grid.load(data);
	    }
	
	    function GetData() {
			var row = grid.getSelected();
			var data = {};
			data.id = row.salesid;
			data.custname = row.custname;      
			data.telcontent = row.telcontent;      
			data.insertdate = row.insertdate;     
			data.salesuserid = row.salesuserid;     
			data.directsaleid = row.directsaleid;     
			data.distributdate = row.distributdate;     
			return data;
	    }
	
	
	    function onKeyEnter(e) {
			search();
	    }
	    //////////////////////////////////
	    function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
	    }
		//添加日期链接	
		function dateRenderer(e){
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}
		function doView(){
			var selectRow = grid.getSelected();
			if(!selectRow){
				nui.alert("请选择其中一条销售线索!");
				return;
			}
			var openUrl = "http://ame1.primeton.com/csoms/com.primeton.csoms.mis_cs2.saleslinkDetails.flow?" +"salesid="+selectRow.salesid;
       		window.open(openUrl);
       	}
   
		
		 function onBelongtypeRenderer(e) {
	        return nui.getDictText('MIS_COMPANYTYPE',e.value);
	    }
	
	 	function onSourceRenderer(e) {
	        return nui.getDictText('MIS_SALESKEY_SOURCE',e.value);
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
	    
		//行双击事件
		function onRowDblClick(){
			onOk();
		}
	</script>
</body>
</html>