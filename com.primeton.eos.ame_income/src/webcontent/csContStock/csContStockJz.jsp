<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 朱海翔
  - Date: 2017-12-23 10:11:04
  - Description:
-->
<head>
<title>合同收入成本结转或进存货</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{
	    margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	}
</style>
</head>
<body >
	<div class="nui-fit" id = "form1">
		<fieldset id="fieldch" style="border:solid 1px #aaa;padding:3px;">
			<legend>合同收入成本进存货</legend>
			<div style="text-align:left;padding:2px;" class="nui-toolbar">
				<a class="nui-button" iconCls="icon-jz" onclick="costToStock" style="margin-right:20px;" id="costToStock">生产成本进存货</a>
			</div> 
		    <div id="grid_ch" class="nui-datagrid" style="height:235px;" width="970px" allowResize="true" dataField="stocks" url="com.primeton.eos.ame_income.csContStock.queryStockJz.biz.ext"
		    	 showPager="false" showPageIndex="false" showPageSize="false" frozenStartColumn="0" frozenEndColumn="2">
				<div property="columns">
					<div field="yearmonth" width="55" headerAlign="center" align="center" renderer="onYearMonthrenderer">财务年月</div>
					<div field="contnum" width="75" renderer="onContnumRenderer" headerAlign="center"  >合同编号</div>
			        <div field="status" align="center" width="60" headerAlign="center" allowSort="true" renderer="dictStatusRenderer">状态</div>
			         <!-- 不含税 -->
			        <div field="incomeProdNet" width="100" headerAlign="center" align="right" dataType="currency">收入确认产品额</div>
			        <div field="incomeServNet" width="100" headerAlign="center" align="right" dataType="currency">收入确认服务额</div>
			        <div field="incomeMaNet" width="90" headerAlign="center" align="right" dataType="currency">收入确认MA额</div>
			        <div field="incomeNet" width="90" headerAlign="center" align="right" dataType="currency">收入确认总额</div>
		        
			        <div field="scfyRg" width="110" headerAlign="center" align="right" dataType="currency">当月生产成本-人工</div>
			        <div field="scfyWb" width="110" headerAlign="center" align="right" dataType="currency">当月生产成本-采购</div>
			        <div field="scfyBx" width="130" headerAlign="center" align="right" dataType="currency">当月生产成本-直接费用</div>
			        <div field="scfyDyze" width="130" headerAlign="center" align="right" dataType="currency">当月生产成本-当月总额</div><!-- 计算 -->
			        <div field="scfy" width="95" headerAlign="center" align="right" dataType="currency">生产成本余额</div><!-- 累计 -->
			        
			        <div field="stockRg" width="120" headerAlign="center" align="right" dataType="currency">当月存货余额-人工</div>
			        <div field="stockWb" width="120" headerAlign="center" align="right" dataType="currency">当月存货余额-采购</div>
			        <div field="stockBx" width="130" headerAlign="center" align="right" dataType="currency">当月存货余额-直接费用</div>
			        <div field="stock" width="160" headerAlign="center" align="right" dataType="currency">当月存货余额-当月余额总计</div>
			        
			        <div field="stockJz" width="90" headerAlign="center" align="right" dataType="currency">当月存货减值</div>
			        <div field="stockNet" width="90" headerAlign="center" align="right" dataType="currency">当月存货净值</div>
			        <div field="stockJzAll" width="90" headerAlign="center" align="right" dataType="currency">累计减值</div>
				</div>
			</div>
		</fieldset>
		
		<fieldset id="fielddz" style="border:solid 1px #aaa;padding:3px;">
			<legend>当月收入为定制的成本</legend>
			<div style="text-align:left;padding:2px;" class="nui-toolbar">
				<a class="nui-button" iconCls="icon-jz" onclick="costDzJz" style="margin-right:20px;" id="costDzJz">定制项目成本结转</a>
			</div> 
		    <div id="grid_dz" class="nui-datagrid" style="width:auto;height:235px;" allowResize="true" dataField="stocks" url="com.primeton.eos.ame_income.csContStock.queryStockJz.biz.ext"
		    	  showPager="false" onshowrowdetail="onShowRowDetail1" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell">
				<div property="columns">
					<div type="expandcolumn" width="5"></div>
					<div field="contnum" width="25" headerAlign="center" align="center" >合同编号</div>
					<div field="projectname" width="55" headerAlign="center" align="center" >合同项目名称</div>
					<div field="yearmonth" width="25" headerAlign="center" align="center">结转年月</div>
					<div field="scfy" width="25" headerAlign="center" align="center" dataType="currency" summaryType="sum">当月生产成本余额</div>
					<div field="actsum2" width="25" headerAlign="center" align="center" dataType="currency" summaryType="sum">当月确认收入不含税</div>
				</div>
			</div>
			<div id="detailGrid_dz" style="display:none;">
		       <div id="grid_dz_detail" class="nui-datagrid" style="width:auto;height:235px;" allowResize="true" dataField="contstocks" url="com.primeton.eos.ame_income.csContStock.queryStocks.biz.ext"
		    	  showPager="false" >
					<div property="columns">
						<div field="yearmonth" width="55" headerAlign="center" align="center" renderer="onYearMonthrenderer">财务年月</div>
						<div field="contnum" width="75" renderer="onContnumRenderer" headerAlign="center"  >合同编号</div>
				        
				        <div field="incomeProdNet" width="100" headerAlign="center" align="right" dataType="currency">收入确认产品额</div>
				        <div field="incomeServNet" width="100" headerAlign="center" align="right" dataType="currency">收入确认服务额</div>
				        <div field="incomeMaNet" width="90" headerAlign="center" align="right" dataType="currency">收入确认MA额</div>
				        <div field="incomeNet" width="90" headerAlign="center" align="right" dataType="currency">收入确认总额</div>
				        
				        <div field="scfyRg" width="110" headerAlign="center" align="right" dataType="currency">当月生产成本-人工</div>
				        <div field="scfyWb" width="110" headerAlign="center" align="right" dataType="currency">当月生产成本-采购</div>
				        <div field="scfyBx" width="130" headerAlign="center" align="right" dataType="currency">当月生产成本-直接费用</div>
				        <div field="scfyDyze" width="130" headerAlign="center" align="right" dataType="currency">当月生产成本-当月总额</div><!-- 计算 -->
				        <div field="scfy" width="95" headerAlign="center" align="right" dataType="currency">生产成本余额</div><!-- 累计 -->
				        
				        <div field="stockRg" width="120" headerAlign="center" align="right" dataType="currency">当月存货余额-人工</div>
				        <div field="stockWb" width="120" headerAlign="center" align="right" dataType="currency">当月存货余额-采购</div>
				        <div field="stockBx" width="130" headerAlign="center" align="right" dataType="currency">当月存货余额-直接费用</div>
				        <div field="stock" width="160" headerAlign="center" align="right" dataType="currency">当月存货余额-当月余额总计</div>
				        
				        <div field="stockJz" width="90" headerAlign="center" align="right" dataType="currency">当月存货减值</div>
				        <div field="stockNet" width="90" headerAlign="center" align="right" dataType="currency">当月存货净值</div>
				        <div field="stockJzAll" width="90" headerAlign="center" align="right" dataType="currency">累计减值</div>
					</div>
				</div>
		    </div>
		</fieldset>
		<fieldset id="fielddz" style="border:solid 1px #aaa;padding:3px;">
			<legend>当月收入为人力的成本</legend>
			<div style="text-align:left;padding:2px;" class="nui-toolbar">
				<a class="nui-button" iconCls="icon-jz" onclick="costRlJz" style="margin-right:20px;" id="costRlJz">人力项目成本结转</a>
			</div> 
		    <div id="grid_rl" class="nui-datagrid" style="width:auto;height:235px;" allowResize="true" dataField="stocks" url="com.primeton.eos.ame_income.csContStock.queryStockJz.biz.ext"
		    	  showPager="false" allowCellSelect="true" allowCellEdit="true" onshowrowdetail="onShowRowDetail2" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell1">
				<div property="columns">
					<div type="expandcolumn" width="5"></div>
					<div field="contnum" width="55" headerAlign="center" align="center">合同编号</div>
					<div field="yearmonth" width="55" headerAlign="center" align="center">结转年月</div>
					<div field="setstart" width="55" headerAlign="center" align="center">财务结算开始年月</div>
					<div field="setend" width="55" headerAlign="center" align="center">财务结算结束年月</div>
					<div field="scfy" width="80" headerAlign="center" align="center" dataType="currency" summaryType="sum">当月生产成本余额</div>
					<div field="actsum2" width="80" headerAlign="center" align="center" dataType="currency" summaryType="sum">当月确认收入不含税</div>
					<div field="actyearmonth" width="55" headerAlign="center" align="center">实际结转结束年月
						<input property="editor" class="nui-textbox" />
					</div>
				</div>
			</div>
			<div id="detailGrid_rl" style="display:none;">
		       <div id="grid_rl_detail" class="nui-datagrid" style="width:auto;height:auto;" allowResize="true" dataField="contstocks" url="com.primeton.eos.ame_income.csContStock.queryStocks.biz.ext"
		    	  showPager="false">
					<div property="columns">
						<div field="yearmonth" width="55" headerAlign="center" align="center" renderer="onYearMonthrenderer">财务年月</div>
						<div field="contnum" width="75" renderer="onContnumRenderer" headerAlign="center"  >合同编号</div>
				        
				        <div field="incomeProdNet" width="100" headerAlign="center" align="right" dataType="currency">收入确认产品额</div>
				        <div field="incomeServNet" width="100" headerAlign="center" align="right" dataType="currency">收入确认服务额</div>
				        <div field="incomeMaNet" width="90" headerAlign="center" align="right" dataType="currency">收入确认MA额</div>
				        <div field="incomeNet" width="90" headerAlign="center" align="right" dataType="currency">收入确认总额</div>
				        
				        <div field="scfyRg" width="110" headerAlign="center" align="right" dataType="currency">当月生产成本-人工</div>
				        <div field="scfyWb" width="110" headerAlign="center" align="right" dataType="currency">当月生产成本-采购</div>
				        <div field="scfyBx" width="130" headerAlign="center" align="right" dataType="currency">当月生产成本-直接费用</div>
				        <div field="scfyDyze" width="130" headerAlign="center" align="right" dataType="currency">当月生产成本-当月总额</div><!-- 计算 -->
				        <div field="scfy" width="95" headerAlign="center" align="right" dataType="currency">生产成本余额</div><!-- 累计 -->
				        
				        <div field="stockRg" width="120" headerAlign="center" align="right" dataType="currency">当月存货余额-人工</div>
				        <div field="stockWb" width="120" headerAlign="center" align="right" dataType="currency">当月存货余额-采购</div>
				        <div field="stockBx" width="130" headerAlign="center" align="right" dataType="currency">当月存货余额-直接费用</div>
				        <div field="stock" width="160" headerAlign="center" align="right" dataType="currency">当月存货余额-当月余额总计</div>
				        
				        <div field="stockJz" width="90" headerAlign="center" align="right" dataType="currency">当月存货减值</div>
				        <div field="stockNet" width="90" headerAlign="center" align="right" dataType="currency">当月存货净值</div>
				        <div field="stockJzAll" width="90" headerAlign="center" align="right" dataType="currency">累计减值</div>
					</div>
				</div>
		    </div>
		</fieldset>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;margin-right:20px;" id="canelButton">关闭</a>
	</div>
	<script type="text/javascript">
		/**供应商查询*/
    	nui.parse();
    	var grid_ch = nui.get("grid_ch");
    	var grid_rl = nui.get("grid_rl");
    	var grid_dz = nui.get("grid_dz");
    	var grid_rl_detail = nui.get("grid_rl_detail");
    	var grid_dz_detail = nui.get("grid_dz_detail");
    	var finyear;
    	var finmonth;
    	var form = new nui.Form("#form1");
    	function setData(data){
    		var data = nui.clone(data);
    		finyear = data.year;
    		finmonth = data.month;
    		var data1 = {finyear:data.year,finmonth:data.month,flag:"ch"};
    		var data2 = {finyear:data.year,finmonth:data.month,flag:"dz"};
    		var data3 = {finyear:data.year,finmonth:data.month,flag:"rl"};
    		grid_ch.load(data1);
    		grid_dz.load(data2);
    		grid_rl.load(data3);
		}
		
		var detailGrid_rl = document.getElementById("detailGrid_rl");
		var detailGrid_dz = document.getElementById("detailGrid_dz");
		function onShowRowDetail1(e) {
	        var grid = e.sender;
	        var row = e.record;
			var currentRow = row;
	        var td = grid.getRowDetailCellEl(row);
	        td.appendChild(detailGrid_dz);
	        //查询收入预估
            var datas = {contnum: row.contnum,yearmonth:row.yearmonth};
            grid_dz_detail.load(datas);
			$('#detailGrid_dz').show();
		}
		function onShowRowDetail2(e) {
	        var grid = e.sender;
	        var row = e.record;
			var currentRow = row;
	        var td = grid.getRowDetailCellEl(row);
	        td.appendChild(detailGrid_rl);
	        //查询收入预估
            var datas = {contnum: row.contnum,yearmonth:row.yearmonth};
            grid_rl_detail.load(datas);
			$('#detailGrid_rl').show();
		}
		
		function onOk(){
			if (confirm("是否确认转换？")) {
            	nui.get("sureButton").disable();
            }else{
            	return false;
            }
			var contstock1 = contStock_grid.getData();
			var contstock2 = contStock_grid1.getData();
			var contnums = nui.get("contnums").getValue();
			var json = {"contstock1":contstock1,"contstock2":contstock2,"contnum":contnums};
			nui.ajax({
    			url: "com.primeton.eos.ame_income.csContStock.contStockConversion.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		if(o.result == 1){
			     		alert("转换成功");
			     		CloseWindow("ok");
		     		}else{
		     			alert("转换失败，请联系信息技术部");
		     			nui.get("sureButton").enable();
		     		}
		        },
		        error: function () {
		        	alert("error");
		        	nui.get("sureButton").enable();
		        }
			});
			
		}
		//成本进存货
		function costToStock(){
			if (confirm("是否确认进存货？")) {
            	nui.get("costToStock").disable();
            }else{
            	return false;
            }
            form.loading("操作中...");
			var data = grid_ch.getData();
			var json = {datas:data,finyear:finyear,finmonth:parseInt(finmonth),flag:"ch"};
			nui.ajax({
    			url: "com.primeton.eos.ame_income.csContStock.csContStockJz.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		if(o.result == 1){
			     		alert("操作成功");
			     		form.unmask();
			     		nui.get("costToStock").enable();
			     		grid_ch.reload();
		     		}else{
		     			alert("操作失败，请联系信息技术部");
		     			form.unmask();
		     			nui.get("costToStock").enable();
		     		}
		        },
		        error: function () {
		        	alert("error");
		        	nui.get("costToStock").enable();
		        }
			});
			
		}
		
		//定制结转
		function costDzJz(){
			if (confirm("是否确认定制项目结转？")) {
            	nui.get("costDzJz").disable();
            }else{
            	return false;
            }
            form.loading("操作中...");
			var data = grid_dz.getData();
			var json = {datas:data,finyear:finyear,finmonth:parseInt(finmonth),flag:"dz"};
			nui.ajax({
    			url: "com.primeton.eos.ame_income.csContStock.csContStockJz.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		if(o.result == 1){
			     		alert("操作成功");
			     		form.unmask();
		     			nui.get("costDzJz").enable();
		     			grid_dz.reload();
		     		}else{
		     			alert("操作失败，请联系信息技术部");
		     			form.unmask();
		     			nui.get("costDzJz").enable();
		     		}
		        },
		        error: function () {
		        	alert("error");
		        	nui.get("sureButton").enable();
		        }
			});
			
		}
		
		//人力结转
		function costRlJz(){
			
			var data = grid_rl.getData();
			for(var i=0;i<data.length;i++){
				if(data[i].actyearmonth){
					if(data[i].actyearmonth.length !=6 ){
						alert("存在实际结转结束年月结构不对的数据，请检查修改后提交！");
						return;
					}
					if(data[i].actyearmonth>data[i].yearmonth){
						alert("存在实际结转结束年月大于结转年月的数据，请检查修改后提交！");
						return;
					}
					var finyear1 = data[i].actyearmonth.substring(0,4);
					var finmonth1 = data[i].actyearmonth.substring(4,6);
					data[i].finyear = finyear1;
					data[i].finmonth = parseInt(finmonth1);
					if(parseInt(finmonth1)==1){
						data[i].lastyear = parseInt(finyear1)-1;
						data[i].lastmonth = "12";
					}else{
						data[i].lastyear = finyear1;
						data[i].lastmonth = parseInt(finmonth1)-1;
					}
				}else{
					alert("存在实际结转结束年月为空的数据，请检查修改后提交！");
					return;
				}
			}
			if (confirm("是否确认人力项目结转？")) {
            	nui.get("costRlJz").disable();
            }else{
            	return false;
            }
            form.loading("操作中...");
			var json = {datas:data,finyear:finyear,finmonth:parseInt(finmonth),flag:"rl"};
			nui.ajax({
    			url: "com.primeton.eos.ame_income.csContStock.csContStockJz.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		if(o.result == 1){
			     		alert("操作成功");
			     		form.unmask();
		     			nui.get("costRlJz").enable();
		     			grid_rl.reload();
		     		}else{
		     			alert("操作失败，请联系信息技术部");
		     			form.unmask();
		     			nui.get("costRlJz").enable();
		     		}
		        },
		        error: function () {
		        	alert("error");
		        	form.unmask();
	     			nui.get("costRlJz").enable();
		        }
			});
			
		}
	    //查看合同详细信息
	    function onContnumRenderer(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}
		function doView(){
			var selectRow = contStock_grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/newcont/newCont/contractView.jsp?contractid=" + selectRow.contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
		}
		function onCancel(e) {
				CloseWindow("cancel");
        }
        	//标准方法接口定义
        function CloseWindow(action) {            
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        function dictStatusRenderer(e) {
        	if(!nui.getDictText('AME_CONTSTOCKSTATUS',e.value)){
        		return "空字典项！";
        	}
			return nui.getDictText('AME_CONTSTOCKSTATUS',e.value);
        }
        
        function onDrawSummaryCell(e){
        	if (e.field == "scfy"||e.field == "actsum2") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
        }
        
        function onDrawSummaryCell1(e){
        	if (e.field == "scfy"||e.field == "actsum2") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
        }
  </script>
</body>
</html>