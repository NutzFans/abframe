<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>合同列表</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
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
  <div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;">
    <div id="form1">
    	<input class="nui-hidden" name="sortField" value="contractid"/>
		<input class="nui-hidden" name="sortOrder" value="desc"/>
      	<table style="width:100%;" class="table">
        	<tr>
          		<td class="tit">合同存档编号:</td>
	          	<td align="left">
		            <input class="nui-textbox " onEnter='onKeyEnter' name="criteria._expr[1].contnum"/>
		            <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
	            	<input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
	          	</td>
          		<td class="tit">销售:</td>
	          	<td align="left">
		            <input class="nui-textbox " onEnter='onKeyEnter' name="criteria._expr[2].salename"/>
		            <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
	            	<input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
	          	</td>
          		<td class="tit">合同最终客户:</td>
	          	<td align="left">
	          		<input class="nui-hidden" name="criteria._expr[0]._property" value="misCustinfo.custid"/>
			        <input class="nui-hidden" name="criteria._expr[0]._op" value="in" id="tempcond11"/>
			        <input class="nui-hidden" name="criteria._expr[0]._ref" value="1" id="tempcond12"/>
			        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
			        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="custid"/>
			        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.eos.budget.budget.MisCustinfo"/>
			        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="custname">
            		<input class="nui-textbox" name="criteria._ref[0]._expr[0]._value" id="dyassetnum1" style="width:150px;" readonly="readonly"/>
			        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
			        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="all"/>
	          	</td>
	          	<td>
	            	<a class="nui-button" iconCls="icon-search" onclick="search">查询</a>
	          	</td>
        	</tr>
      </table>
    </div>
  </div>
  	<div class="nui-fit">
    	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%;" idField="custid" 
    	onrowdblclick="onRowDblClick" url="com.primeton.rdmgr.project.examineToProject.selectProjContart.biz.ext" 
    	dataField="contracts" sizeList=[5,10,20,50,100]  pageSize="10"   multiSelect="true">
      		<div property="columns" >
        		<div type="checkcolumn"></div>
	        	<div field="contnum" width="73" renderer="onTitleRenderer" headerAlign="center" allowSort="true">合同存档编号</div>
	        	<div field="projectname" width="140" renderer="onTitleRenderer" headerAlign="center" allowSort="true">合同名称</div>
		        <div field="contreg" width="70" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">登记日期</div>
		        <div field="misCustinfo.custname" width="150" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true">合同最终客户</div>
		        <div field="contsum" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="80" headerAlign="center" allowSort="true">总金额（元）</div>
	         	<div field="confirmMoney" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="90" headerAlign="center" allowSort="true">已确认收款（元）</div>
	         	<div field="servmon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="0" headerAlign="center" allowSort="true">服务</div>
	         	<div field="prodmon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="0" headerAlign="center" allowSort="true">产品</div>
	         	<div field="masum" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="0" headerAlign="center" allowSort="true">ma</div>
	         	<div field="salename" width="50" headerAlign="center" allowSort="true">销售</div>
	         	<div field="org"   width="80" headerAlign="center" allowSort="true" renderer="dictOrg">事业部</div>
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
	
    function GetData() {
      	var rows = grid.getSelecteds();
		return rows;
    }
	function dictOrg(e) {
			return nui.getDictText('CONT_ORG',e.value);//设置业务字典值
		}
    function onKeyEnter(e) {
      search();
    }
    
    function CloseWindow(action) {
      window.close();
    }
	function onRowDblClick(e) {
		onOk();
	}
    function onOk() {
      var row = grid.getSelected();
      if (!row) {
        alert("请选中一条记录");
        return;
      }
      CloseWindow("ok");
    }
    function onCancel() {
      CloseWindow("cancel");
    }
    function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	function setData(data){
		nui.get("dyassetnum1").setValue(data);
		search();
	}
	function search() {
		if(nui.get("dyassetnum1").getValue()==""||nui.get("dyassetnum1").getValue()==null){
			nui.get("tempcond11").setValue("=");
			nui.get("tempcond12").setValue("");
		}else{
			nui.get("tempcond11").setValue("in");
			nui.get("tempcond12").setValue("1");
		}
		var form = new nui.Form("#form1");
		var data = form.getData();
		grid.load(data);
	}
  </script>
</body>
</html>
