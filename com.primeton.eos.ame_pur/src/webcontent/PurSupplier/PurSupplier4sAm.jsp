<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>供应商信息列表查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="mini-panel" title="供应商查询" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<input class="nui-hidden" id="state" name="state" value="1">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:120px;"><span>供应商名称：</span></td>
		            	<td align="left" style="width:280px;">
						    <input name="criteria._expr[7]._value" class="nui-hidden" value = "1" />
						    <input class="nui-hidden" name="criteria._expr[7]._property" value="status"/>
						    <input class="nui-hidden" name="criteria._expr[7]._op" value="="/>
						    <input name="criteria._expr[8]._value" class="nui-hidden" value = "0,1" />
						    <input class="nui-hidden" name="criteria._expr[8]._property" value="custtype"/>
						    <input class="nui-hidden" name="criteria._expr[8]._op" value="in"/>
						    <input name="criteria._expr[1]._value" class="nui-textbox"  style="width:204px;"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="custname"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td> 
						<td align="right"><span>登记日期：</span></td>
		            	<td align="left">
						    <input class="nui-datepicker" name="criteria._expr[2]._min" id="startTime" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[2]._max" id="endTime" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[2]._property" value="createDate"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[2]._pattern" value="yyyy-MM-dd"/>
						</td>
						
						<td align="right" style="width: 150px;"><span>供应商所在城市：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[3]._value" class="nui-dictcombobox" dictTypeId="MIS_AREA" allowInput="true"  showNullItem="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="registcity"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>供应商注册资本：</span></td>
						<td align="left">
		            		<input class="nui-textbox" name="criteria._expr[4]._min" style="width:100px"/>-<input class="nui-textbox" name="criteria._expr[4]._max" style="width:100px"/>(万元)
		            		<input class="nui-hidden" name="criteria._expr[4]._property" value="registercap"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
						</td>
						<td align="right"><span>本地化服务城市：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[6]._value" class="nui-dictcombobox" dictTypeId="MIS_AREA" allowInput="true"  showNullItem="true" nullItemText="" multiSelect="true"/>
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="locservcity"/>
						    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>成立日期：</span></td>
		            	<td align="left">
						    <input class="nui-datepicker" name="criteria._expr[9]._min" id="startTime1" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[9]._max" id="endTime1" style="width:100px"/>
					        <input class="nui-hidden" name="criteria._expr[9]._property" value="estabdate"/>
						    <input class="nui-hidden" name="criteria._expr[9]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[9]._pattern" value="yyyy-MM-dd"/>
						</td>
						<td align="right"><span>推荐指数：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[10]._value" class="nui-dictcombobox" dictTypeId="AME_REINDEX" style="width:90px;" showNullItem="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[10]._property" value="reindex"/>
						    <input class="nui-hidden" name="criteria._expr[10]._op" value="="/>
						</td>
					</tr>
				    <tr>
		    			<td align="center" colspan="15">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
                       </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="purSuppliers" 
	    url="com.primeton.eos.ame_pur.PurSupplier.queryPurSupplier.biz.ext" sizeList="[10,20,50,100,200,500,1000,10000]" idField="appid" multiSelect="true"> <!-- onselectionchanged="selectionChanged" -->
			<div property="columns">
				<div type="checkcolumn" width="25"></div>	
				<div field="custid" width="0" >客户ID</div>		
				<div field="custname" width="180" align="left" headerAlign="center" renderer="getDetail" allowSort="true">供应商名称</div>	
				<div field="custnum" width="110" align="center" headerAlign="center"  allowSort="true">供应商编号</div>
				<div field="suppliersname" width="75" align="center" headerAlign="center" allowSort="true">供应商简称</div>
				<div field="locservcity" width="110" align="left"headerAlign="center" renderer="dictcity" allowSort="true">本地化服务城市</div>
				<div field="linkman" width="100" align="center" headerAlign="center" allowSort="true">供应商联系人</div>
				<div field="linktel" width="100" align="center" headerAlign="center"  allowSort="true">供应商联系电话</div>	
				<div field="estabdate" width="80" align="center" headerAlign="center"allowSort="true">成立日期</div>
				<div field="reindex" width="80" align="center" headerAlign="center"allowSort="true" renderer="dictreindex">推荐指数</div>				
			</div>
		</div>
	</div>
	<script type="text/javascript">
		/**供应商查询*/
		var form = new nui.Form("#form1");
    	nui.parse();
    	var grid = nui.get("datagrid1");
    	init();
    	function init(){
    		var data = form.getData(); //获取表单JS对象数据
    		grid.load(data);
			grid.sortBy("reindex","desc");
		}
		function dictstatus(e) {
			return nui.getDictText('AME_SUPSTATUS',e.value);//设置业务字典值
		}
		function dictcusttype(e) {
			return nui.getDictText('AME_SUPTYPE',e.value);//设置业务字典值
		}
		function dictcity(e) {
			return nui.getDictText('MIS_AREA',e.value);//设置业务字典值
		}
		function dictreindex(e){
			return nui.getDictText('AME_REINDEX',e.value);//设置业务字典值
		}
    	function search() {
    		var startTime = nui.get("startTime").getValue();
    		var endTime = nui.get("endTime").getValue();
    		if(startTime > endTime){
    			alert("登记日期取值区间有误！");
    			return;
    		}
    		var startTime1 = nui.get("startTime1").getValue();
    		var endTime1 = nui.get("endTime1").getValue();
    		if(startTime1 > endTime1 && endTime1 != null && endTime1 != ""){
    			alert("成立日期取值区间有误！");
    			return;
    		}
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		}
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			var data = form.getData(); 
			grid.load(data);
		}
		
        function getDetail(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
        }
        function checkDetail(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "/default/ame_pur/PurSupplier/DetailPurSupplier.jsp?id=" + selectRow.custid+"&flag="+1;
			window.open(executeUrl, "供应商详细信息", "fullscreen=1");
	    }
  </script>
</body>
</html>