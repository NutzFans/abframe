<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>收款确认审核</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
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
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fit">
  <form id="form1" method="post" >
        <input name="csGather.gatherid" id="gatherid" class="nui-hidden" />
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>收款确认</legend>
            <div style="padding:5px;">
	            <table style="table-layout:fixed;">
	            	 <tr>
	                    <td style="width:110px;" align="right">支付单位：</td>
	                    <td style="width:300px;" align="left"> 
	                    	<input name="csGather.misCustinfo.custname" id="custname" style="width:300px" class="nui-textbox" allowInput="false"/>
	                        <input name="csGather.misCustinfo.custid" id="custid" class="nui-hidden" />
	                    </td>
	                    <td style="width:110px;" align="right">收款日期：</td>
	                    <td style="width:150px;" align="left">    
	                        <input name="csGather.gatherdate" id="gatherdate" class="nui-datepicker"/>
	                    </td>
	                    <td style="width:110px;" align="right">收款金额：</td>
	                    <td style="width:150px;" align="left">    
	                        <input name="csGather.summon" id="summon" class="nui-textbox" required="true" vtype="float" allowInput="false"/>
	                    </td>
	                </tr>
	            </table>
        	</div>
        </fieldset>        
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>收款对应合同</legend>
            <div style="padding:5px;">
            	<div style="width:1250px;">
			        <div class="nui-toolbar" style="width: 1292.5px;border-bottom:0;padding:0px;">
			            <table style="width:860px;">
			                <tr>
			                    <td align="right" style="width: 490px;" >合计：</td>
			                    <td align="left" style="width: 102px;"><input id="summonTemp" class="nui-textbox" vtype="float" allowInput="false" style="width: 100px;" >
			                    </td>
			                    <td align="left" style="width: 102px;"><input id="summonOrder" class="nui-textbox" vtype="float" allowInput="false" style="width: 100px;">
			                    </td>
			                    <td align="left" style="width: auto;"><input id="summonGather" class="nui-textbox" vtype="float" allowInput="false" style="width: 120px;">
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
	        	<div id="cont_grid" class="nui-datagrid" style="width: 1295px;height:auto;" allowResize="true" idField="contractid"
			        onshowrowdetail="onShowRowDetail1" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
			        <div property="columns">
			            <div type="checkcolumn"></div>
			            <div type="expandcolumn">#</div>
			            <div field="csContract.contractid" width="0" headerAlign="center" >合同ID</div>
			            <div field="csContract.contnum" width="80" headerAlign="center" >合同存档编号
			            	<input property="editor" class="nui-buttonedit" style="width:100%;" onbuttonclick="onButtonEdit1" required="true" allowInput="false"/> 
			            </div>
			            <div field="csContract.projectname" width="280" headerAlign="center" >合同名称（项目）</div>
			            <div field="csContract.contsum" width="80" headerAlign="center" >合同总金额</div>
			            <div field="summon" width="105" headerAlign="center" >本次销售收款金额</div>
			            <div field="summono" width="105" headerAlign="center" >本次订单收款金额</div>
			            <div field="summong" width="125" headerAlign="center" >本次实际收款额(含税)</div>
			            <div width="auto"></div>
			        </div>
			    </div>
			    <div id="detailGrid_Form1" style="display:none;">
				   <div id="sale_grid" class="nui-datagrid" style="width: 850px;height:auto;" allowResize="true" oncellendedit="doCal" idField="contsaleid"
				        onshowrowdetail="onShowRowDetail2" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
				        <div property="columns">            
				            <div type="expandcolumn">#</div>
				            <div field="saleid" width="70" headerAlign="center" >销售ID</div>
				            <div field="salename" width="70" headerAlign="center" >销售姓名</div>
				            <div field="org" width="100" headerAlign="center" renderer="onSYBRenderer">销售所属事业部</div>
				            <div field="contsum" dataType="currency" width="90" headerAlign="center" >合同总金额</div>
				            <div field="prodmon" dataType="currency" width="90" headerAlign="center" >产品金额</div>
				            <div field="servmon" dataType="currency" width="90" headerAlign="center" >服务金额</div>
				            <div field="thisservmon" dataType="currency" width="110" headerAlign="center" >本次服务收款金额
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div width="auto"></div>
				        </div>
				    </div>
				    <div id="detailGrid_Form2" style="display:none;">
				        <div id="prod_grid" class="nui-datagrid" style="width: 825px;height:auto;" oncellendedit="doSubCal" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
				            <div property="columns">
				                <div field="prod_name" width="210" headerAlign="center">产品名称</div>
				                <div field="price" dataType="currency" width="100" align="center" headerAlign="center">产品单价</div>
				                <div field="prodmon" dataType="currency" width="100" align="center" headerAlign="center">产品金额</div>
				                <div field="prodsubmon" dataType="currency" width="100" align="center" headerAlign="center">产品分包金额</div>
				                <div field="othmon" dataType="currency" width="100" align="center" headerAlign="center">产品服务费</div>
				                <div field="netprodmon" dataType="currency" width="100" align="center" headerAlign="center">产品净额</div>
					            <div field="thisprodmon" dataType="currency" width="110" headerAlign="center" >本次产品收款金额
					            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
					            </div>
					            <div width="auto"></div>
				            </div>
				        </div>    
				    </div>
				    <div id="order_grid" class="nui-datagrid" style="width: 900px;height:auto;" allowResize="true" oncellendedit="doCal1" idField="contorderid"
				        showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
				        <div property="columns">            
				            <div field="contorderno" width="70" headerAlign="center" >订单编号</div>
				            <div field="memo" width="100" headerAlign="center" >订单备注说明</div>
				            <div field="orderreg" width="80" headerAlign="center" dateFormat="yyyy-MM-dd">订单登记日期</div>
				            <div field="orderdate" width="80" headerAlign="center" dateFormat="yyyy-MM-dd">订单签订日期</div>
				            <div field="orderprodmon" dataType="currency" width="90" headerAlign="center" >订单产品金额</div>
				            <div field="orderservmon" dataType="currency" width="90" headerAlign="center" >订单服务金额</div>
				            <div field="ordermon" dataType="currency" width="100" headerAlign="center" >合同订单金额</div>
				            <div field="thisprodmon" dataType="currency" width="90" headerAlign="center" >本次产品收款金额
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="thisservmon" dataType="currency" width="90" headerAlign="center" >本次服务收款金额
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="thismon" dataType="currency" width="105" headerAlign="center" >本次金额总和
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				        </div>
				    </div>
				    <!-- 合同收款纪录 -->
				    <div id="gatherfc_grid" class="nui-datagrid" style="width: 1269px;height:auto;" allowResize="true" oncellendedit="doCal2" idField="gatherid"
				        showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
				        editNextOnEnterKey="true" >			        
				        <div property="columns">            
				            <div field="gatherno" width="40" headerAlign="center" >次数</div>
				            <div field="newyearmonth" width="63" headerAlign="center" >最新年月</div>
				            <div field="status" width="45" headerAlign="center" renderer="dictGetGatherType">状态</div>
				            <div field="billdate" width="82" headerAlign="center" dateFormat="yyyy-MM-dd">开票日期</div>
				            <div field="productsum" dataType="currency" width="70" headerAlign="center" >预计产品额</div>
				            <div field="servicesum" dataType="currency" width="70" headerAlign="center" >预计服务额</div>
				            <div field="fcsum" dataType="currency" width="70" headerAlign="center" >预计金额</div>
				            <div field="confirmday" width="97" headerAlign="center" dateFormat="yyyy-MM-dd">实际收款日期
				                <input property="editor" class="nui-datepicker" style="width:100%;"/>
				            </div>
				            <div field="actproductsum" dataType="currency" width="100" headerAlign="center" >实际产品额(含税)
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="actservicesum" dataType="currency" width="100" headerAlign="center" >实际服务额(含税)
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="actsum" dataType="currency" width="90" headerAlign="center" >实际金额(含税)
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="productrate" dataType="currency" width="55" headerAlign="center" >产品税率
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="servicerate" dataType="currency" width="55" headerAlign="center" >服务税率
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				             <div field="actproductsum2" dataType="currency" width="112" headerAlign="center" >实际产品额(不含税)
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="actservicesum2" dataType="currency" width="112" headerAlign="center" >实际服务额(不含税)
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="actsum2" dataType="currency" width="105" headerAlign="center" >实际金额(不含税)
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
				            </div>
				            <div field="actsum3"  dataType="currency" headerAlign="center" width="auto"></div> 
				        </div>
				    </div>
			    </div>
            </div>
        </fieldset>
    </form>
</div>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
    <a class="nui-button" onclick="onOk" id="okbutton" style="width:60px;margin-right:20px;">保存</a>
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div> 
<script type="text/javascript">
    var updateURL = "com.primeton.mis.contract.gathering.dealGathering.biz.ext";
	var saveURL = "";
    nui.parse();
	var dept_grid = nui.get("dept_grid");
	var cont_grid = nui.get("cont_grid");
	var sale_grid = nui.get("sale_grid");
	var prod_grid = nui.get("prod_grid");
	var order_grid = nui.get("order_grid");
	var gatherfc_grid = nui.get("gatherfc_grid");
	function addRow(gridid) {          
        var newRow = { name: "New Row" };
        var grid = nui.get(gridid);
        grid.addRow(newRow, 0);
    }
    function removeRow(gridid) {;
        var grid = nui.get(gridid);
        var rows = grid.getSelecteds();
        if (rows.length > 0) {
            grid.removeRows(rows, true);
        }
        if(gridid == "cont_grid"){
        	doCal();
        	doCal1();
        	doCal2();
        }
    }
	function onSYBRenderer(e) {
        return nui.getDictText('CONT_ORG',e.value);
    }
    function doSubCal(e){
    	var row = prod_grid.getSelected();
    	if(row){
    		if(row.thisprodmon != null && isNaN(row.thisprodmon)){
				alert("请输入实数！");
				var rowData = {thisprodmon: 0};
				prod_grid.updateRow(row,rowData);
				return;
			}
			var prodmon = 0;
			if(row.prodmon != null){
				prodmon = row.prodmon;
			}
			if(row.thisprodmon > prodmon){
				alert("本次产品收款金额不得大于产品金额！");
				var rowData = {thisprodmon: 0};
				prod_grid.updateRow(row,rowData);
				return;
			}
    	}
    	var datas = prod_grid.getData();
    	var sumprodmon = 0;//合同销售的本次收款产品金额之和
    	for(var i=0;i<datas.length;i++){
    		var thisprodmon = datas[i].thisprodmon;
			if(thisprodmon && !isNaN(thisprodmon)){
				sumprodmon += parseFloat(thisprodmon);
			}
    	}
    	var row = sale_grid.getSelected();
		var rowData = {thisprodmon: sumprodmon.toFixed(2)};
		sale_grid.updateRow(row,rowData);
		doCal();
    }
    function doCal(e){
		var row = sale_grid.getSelected();
		if(row){
			if(row.thisservmon != null && isNaN(row.thisservmon)){
				alert("请输入实数！");
				var rowData = {thisservmon: 0};
				sale_grid.updateRow(row,rowData);
				return;
			}
			var servmon = 0;
			if(row.servmon != null){
				servmon = row.servmon;
			}
			if(row.thisservmon > servmon){
				alert("本次服务收款金额不得大于服务金额！");
				var rowData = {thisservmon: 0};
				sale_grid.updateRow(row,rowData);
				return;
			}
		}
		var datas = sale_grid.getData();
		var sumprodmon = 0;//合同销售的本次收款产品金额之和
		var sumservmon = 0;//合同销售的本次收款服务金额之和
		var summon = 0;//合同的本次收款之和
		for(var i=0;i<datas.length;i++){
			var thisservmon = datas[i].thisservmon;
			var thisprodmon = datas[i].thisprodmon;			
			if(thisservmon && !isNaN(thisservmon)){
				summon += parseFloat(thisservmon);
			}		
			if(thisprodmon && !isNaN(thisprodmon)){
				summon += parseFloat(thisprodmon);
			}
		}
		var row = cont_grid.getSelected();
		var rowData = {summon: summon.toFixed(2)};
		cont_grid.updateRow(row,rowData);
		var datas=cont_grid.getData();
		var sumsummon = 0;
		for(var i=0;i<datas.length;i++){
			//本次收款金额总和
			var summon = datas[i].summon;
			if(summon){
				if(!isNaN(summon)){
					sumsummon += parseFloat(summon);
				}
			}
		}
		nui.get("summonTemp").setValue(sumsummon.toFixed(2));
	}
	
	function doCal1(e){
		var row = order_grid.getSelected();
		if(row){
			if(row.thisprodmon != null && isNaN(row.thisprodmon)){
				alert("本次产品收款金额请输入实数！");
				var rowData = {thisprodmon: 0};
				order_grid.updateRow(row,rowData);
				return;
			}
			if(row.thisservmon != null && isNaN(row.thisservmon)){
				alert("本次服务收款金额请输入实数！");
				var rowData = {thisservmon: 0};
				order_grid.updateRow(row,rowData);
				return;
			}
			var servmon = 0;
			var prodmon = 0;
			if(row.orderservmon != null){
				servmon = row.orderservmon;
			}
			if(row.orderprodmon != null){
				prodmon = row.orderprodmon;
			}
			if(row.thisservmon > servmon ){
				alert("本次服务收款金额不得大于服务金额！");
				var rowData = {thisservmon: 0};
				order_grid.updateRow(row,rowData);
				return;
			}
			if(row.thisprodmon > prodmon){
				alert("本次产品收款金额不得大于产品金额！");
				var rowData = {thisprodmon: 0};
				order_grid.updateRow(row,rowData);
				return;
			}
			var Thisservmon=0;
			var Thisprodmon=0;
			if(row.thisservmon){Thisservmon=parseFloat(row.thisservmon)}
			if(row.thisprodmon){Thisprodmon=parseFloat(row.thisprodmon)}
			var thismon=Thisservmon+Thisprodmon;
			var rowData = {thismon: parseFloat(thismon)};
			order_grid.updateRow(row,rowData);
		}
		var datas = order_grid.getData();
		var sumprodmon = 0;//合同订单的本次收款产品金额之和
		var sumservmon = 0;//合同订单的本次收款服务金额之和
		var summon = 0;//合同订单的本次收款之和
		for(var i=0;i<datas.length;i++){
			var thisservmon = datas[i].thisservmon;
			var thisprodmon = datas[i].thisprodmon;			
			if(thisservmon && !isNaN(thisservmon)){
				summon += parseFloat(thisservmon);
			}		
			if(thisprodmon && !isNaN(thisprodmon)){
				summon += parseFloat(thisprodmon);
			}
		}
		var row = cont_grid.getSelected();
		var rowData = {summono: summon.toFixed(2)};
		cont_grid.updateRow(row,rowData);
		var datas=cont_grid.getData();
		var sumsummon = 0;
		for(var i=0;i<datas.length;i++){
			//本次收款金额总和
			var summono = datas[i].summono;
			if(summono){
				if(!isNaN(summono)){
					sumsummon += parseFloat(summono);
				}
			}
		}
		nui.get("summonOrder").setValue(sumsummon.toFixed(2));
	}
	
	//收款确认记录调用的方法
	function doCal2(e){
		var row = gatherfc_grid.getSelected();
		if(row){
			if(row.actproductsum != null && isNaN(row.actproductsum)){
				alert("本次实际产品额（含税）请输入实数！");
				var rowData = {actproductsum: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}
			if(row.actservicesum != null && isNaN(row.actservicesum)){
				alert("本次实际服务额（含税）请输入实数！");
				var rowData = {actservicesum: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}
			if(row.confirmday == null || row.confirmday ==""){
				alert("本次实际收款日期不为空！");
				var myDate = new Date();
				var rowData = {confirmday: myDate};
				gatherfc_grid.updateRow(row,rowData);
			}
			if(row.productrate != null && isNaN(row.productrate)){
				alert("本次产品税率请输入实数！");
				var rowData = {productrate: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}else if(row.productrate<=0){
				alert("本次产品税率请大于 0 ！");
				var rowData = {productrate: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}else if(row.productrate>=1){
				alert("本次产品税率请小于 1 ！");
				var rowData = {productrate: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}
			if(row.servicerate != null && isNaN(row.servicerate)){
				alert("本次服务税率请输入实数！");
				var rowData = {servicerate: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}else if(row.servicerate<=0){
				alert("本次服务税率请大于 0 ！");
				var rowData = {servicerate: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}else if(row.servicerate>=1){
				alert("本次服务税率请小于 1 ！");
				var rowData = {servicerate: 0};
				gatherfc_grid.updateRow(row,rowData);
				return;
			}
			
			var actproductsum = 0;
			var actservicesum = 0;
			var productrate = 0;
			var servicerate = 0;
			if(row.actproductsum){actproductsum=parseFloat(row.actproductsum)}
			if(row.actservicesum){actservicesum=parseFloat(row.actservicesum)}
			if(row.productrate){productrate=parseFloat(row.productrate)}
			if(row.servicerate){servicerate=parseFloat(row.servicerate)}
			var actsum=actproductsum+actservicesum;
			var actproductsum2=actproductsum/(1+productrate);
			var actservicesum2=actservicesum/(1+servicerate);
			var actsum2=actproductsum2+actservicesum2;
			
			var rowData = {actsum: parseFloat(actsum),
			               actproductsum2: parseFloat(actproductsum2),
			               actservicesum2:parseFloat(actservicesum2),
			               actsum2:parseFloat(actsum2),
			               actsum3:parseFloat(actsum2)};
			gatherfc_grid.updateRow(row,rowData);
		}
		
		var datas = gatherfc_grid.getData();
		var actproductsums = 0;//收款明细本次收款实际产品金额之和
		var actservicesums = 0;//收款明细本次收款实际服务金额之和
		var actsums = 0;//收款明细本次实际收款之和
		for(var i=0;i<datas.length;i++){
			var actservicesums = datas[i].actservicesum;
			var actproductsums = datas[i].actproductsum;
			var status = datas[i].status;
			if(actservicesums && !isNaN(actservicesums) ){
				actsums += parseFloat(actservicesums);
			}		
			if(actproductsums && !isNaN(actproductsums)){
				actsums += parseFloat(actproductsums);
			}
		}
		var row = cont_grid.getSelected();
		var rowData = {summong: actsums.toFixed(2)};
		cont_grid.updateRow(row,rowData);
		var datas=cont_grid.getData();
		var sumsummon = 0;
		for(var i=0;i<datas.length;i++){
			//本次收款金额总和
			var summong = datas[i].summong;
			if(summong){
				if(!isNaN(summong)){
					sumsummon += parseFloat(summong);
				}
			}
		}
		nui.get("summonGather").setValue(sumsummon.toFixed(2));
	}
	
	function doRecCal(){
		var row = dept_grid.getSelected();
		var servData = sale_grid2.getData();
		var prodData = prod_grid2.getData();
		var recmonsum = 0;
		if(servData){
			for(var i=0;i<servData.length;i++){
				var servrecmon = servData[i].servrecmon;
				var thisservmon = servData[i].thisservmon;
				if(thisservmon > servrecmon){
					alert("本次服务核销金额不能大于服务应收金额!");
					return;
				}else{
					recmonsum += parseFloat(thisservmon);
				}
			}
		}
		if(prodData){
			for(var j=0;j<prodData.length;j++){
				var prodrecmon = prodData[j].prodrecmon;
				var thisprodmon = prodData[j].thisprodmon;
				if(thisprodmon > prodrecmon){
					alert("本产品核销金额不能大于产品应收金额!");
					return;
				}else{
					recmonsum += parseFloat(thisprodmon);
				}
			}
		}
		recmonsum = parseFloat(recmonsum).toFixed(2);
		var rowData={thisrecmon: recmonsum};
		dept_grid.updateRow(row,rowData);
	}
	//点击保存时调用的方法
	var form = new nui.Form("form1");
	function SaveData() {
		var datas = cont_grid.getData();
		if(datas.length == 0){
			nui.alert("收款至少对应一条合同数据！","对应合同");
        	return;
		}
    	var summon = nui.get("summon").getValue();
    	var summonTemp = nui.get("summonTemp").getValue();
    	var summonOrder = nui.get("summonOrder").getValue();
    	var summonGather = nui.get("summonGather").getValue();
    	if(parseFloat(summon) != parseFloat(summonTemp)){
    		nui.alert("收款金额与本次销售收款金额之和不等！","请检查本次收款金额");
    		return;
    	}
    	if(parseFloat(summon) != parseFloat(summonOrder)){
    		nui.alert("收款金额与本次订单收款金额之和不等！","请检查本次收款金额");
    		return;
    	}
    	if(parseFloat(summon) != parseFloat(summonGather)){
    		nui.alert("收款金额与本次收款确认记录实际收款金额(含税)之和不等！","请检查本次收款金额");
    		return;
    	}
        var o = form.getData();
        var row = sale_grid.getSelected();
        if(row){
        	var datas = prod_grid.getData();
        	row.saleProds = datas;
        }
        var row = cont_grid.getSelected();
        if(row){
        	var datas = sale_grid.getData();
        	var datao = order_grid.getData();
        	var datag = gatherfc_grid.getData();
        	row.csContract.sales = datas;
        	row.csContract.order = datao ;
        	row.csContract.gatherfc = datag ;
        }
        o.csGather.csGatherConts = cont_grid.getData();
        if(!form.validate()){
        	return;
        }
		saveURL = updateURL;
        var json = nui.encode(o);
        nui.get("okbutton").disable();
        nui.ajax({
            url: saveURL,
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
                CloseWindow("save");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
        });
    }
	//页面进入时调用的方法
    function SetData(data) {
        var json = nui.encode({csGather:data});
        nui.ajax({
            url: "com.primeton.mis.contract.gathering.getGathering.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
                form.setData(o);
                form.setChanged(false);
                var summonTemp = 0;
                for(var i=0;i<o.csGather.csGathConts.length;i++){
                	summonTemp += o.csGather.csGathConts[i].summon;
                	o.csGather.csGathConts[i].summono=o.csGather.csGathConts[i].summon;
               	 	o.csGather.csGathConts[i].summong=o.csGather.csGathConts[i].summon;
                }
                nui.get("summonTemp").setValue(summonTemp);
                nui.get("summonOrder").setValue(summonTemp);
                nui.get("summonGather").setValue(summonTemp);
                o.csGather.csGathConts.summono=o.csGather.csGathConts.summon;
                o.csGather.csGathConts.summong=o.csGather.csGathConts.summon;
                cont_grid.setData(o.csGather.csGathConts);
                order_grid.setData(o.csGather.csGathConts[0].csContract.orders);
                gatherfc_grid.setData(o.csGather.csGathConts[0].csContract.gatherfcs);
                for(var a=0;a<o.csGather.csGatherIncomes.length;a++){
                	for(var b=0;b<o.csGather.csIncomeconfs.length;b++){
                		if(a==b){
                			o.csGather.csIncomeconfs[b].thisrecmon = o.csGather.csGatherIncomes[a].recmon;
                		}
                		if(o.csGather.csGatherIncomes[a].csGatherIncomesales&&o.csGather.csGatherIncomes[a].csGatherIncomesales!=null&&o.csGather.csGatherIncomes[a].csGatherIncomesales!=""){
	                		for(var c=0;c<o.csGather.csGatherIncomes[a].csGatherIncomesales.length;c++){
                				for(var d=0;d<o.csGather.csIncomeconfs[b].csIncomeconfSales.length;d++){
                					if(c==d){
                						o.csGather.csIncomeconfs[b].csIncomeconfSales[d].thisservmon = o.csGather.csGatherIncomes[a].csGatherIncomesales[d].servmon;
                					}
                				}
    	            		}
    	            		
                		}else{
                			for(var c=0;c<o.csGather.csGatherIncomes[a].csGatherIncomeprods.length;c++){
                				for(var d=0;d<o.csGather.csIncomeconfs[b].csIncomeconfProds.length;d++){
                					if(c==d){
                						o.csGather.csIncomeconfs[b].csIncomeconfProds[d].thisprodmon = o.csGather.csGatherIncomes[a].csGatherIncomeprods[d].prodmon;
                					}
                				}
    	            		}
                		}
                	}
                }
                dept_grid.setData(o.csGather.csIncomeconfs);
            }
        });
	}
    function GetData() {
        var o = form.getData();
        return o;
    }
    function CloseWindow(action) {            
        if (action == "cancel" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    function onOk(e) {
        if(!form.validate()){
        	return;
        }else{
        	//startUpload(SaveData);
        	SaveData();
	    }
    }
    function onCancel(e) {
        CloseWindow("cancel");
    }
 	//“签署单位”清除时的方法
    function onCloseClick(e) {
        var obj = e.sender;
        obj.setText("");
        obj.setValue("");
    }
    //“核销应收”点击选择时的方法
    function onButtonEdit(e) {
        var btnEdit = this;	
        var lookupUrl="";
    	lookupUrl = "/contract/rec/recLookup.jsp";
		if (lookupUrl=="") return;
        nui.open({
			url:"<%=contextPath%>"+lookupUrl,
			title: "选择列表",
			width: 850,
			height: 480,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                var row = dept_grid.getSelected();
		                btnEdit.setValue(data.text);
                    	var rowData = {csContractRec :{recid: data.id, recmon: data.recmon, recdate: data.recdate, contnum: data.text}};
                    	dept_grid.updateRow(row,rowData);
					}
				}
			}
		});
	}	
    //“合同存档编号”点击选择时的方法
    function onButtonEdit1(e) {
        var btnEdit = this;	
        var lookupUrl="";
    	lookupUrl = "/contract/contract/contract_lookup.jsp";
		if (lookupUrl=="") return;
        nui.open({
			url:"<%=contextPath%>"+lookupUrl,
			title: "选择列表",
			width: 1150,
			height: 500,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
						var row = cont_grid.getSelected();
                    	btnEdit.setValue(data.text);
                    	var rowData = {csContract :{contractid: data.id, contnum: data.text, projectname: data.projectname, contsum: data.contsum}};
                    	cont_grid.updateRow(row,rowData);
					}
				}
			}
		});
	}
	
    var detailGrid_Form1 = document.getElementById("detailGrid_Form1");
    var detailGrid_Form2 = document.getElementById("detailGrid_Form2");
    var detailGrid_Form3 = document.getElementById("detailGrid_Form3");
	var currentRow=null;
	var currentRow2=null;
	var currentRow3=null;
	//合同点开对应的销售子grid时的方法
	function onShowRowDetail1(e) {
        var grid = e.sender;
        var row = e.record;
        if(row.csContract == null || row.csContract.contractid == null || row.csContract.contractid == ""){
        	alert("请先选择合同！");
        	return;
        }else{
        	if(currentRow){//如果有当前行
	        	var datas = sale_grid.getData();
	        	var datao = order_grid.getData();
	        	var datag = gatherfc_grid.getData();
	        	currentRow.csContract.sales = datas;
	        	currentRow.csContract.order = datao;
	        	currentRow.csContract.gatherfc = datag;
	        	//o.csGather.csGathConts[0].csContract.orders
	        }
			currentRow=row;
	        var td = grid.getRowDetailCellEl(row);
	        td.appendChild(detailGrid_Form1);
	        var sales = row.csContract.sales;
	        if(sales){
	            sales = nui.decode(sales);
	            sale_grid.setData(sales);
	        }else{
				sale_grid.setData({});
				row.sales = {};
			}
			var orders = row.csContract.orders;
			if(orders){
	            order = nui.decode(orders);
	            order_grid.setData(orders);
	        }else{
				order_grid.setData({});
				row.order = {};
			}
			var gatherfc = row.csContract.gatherfcs;
			if(gatherfc){
	            gatherfc = nui.decode(gatherfc);
	            gatherfc_grid.setData(gatherfc);
	        }else{
				gatherfc_grid.setData({});
				row.gatherfc = {};
			}
			$('#detailGrid_Form1').show();
		}
	}
	//销售人员点开对应的产品子grid时的方法
	function onShowRowDetail2(e) {
        var grid = e.sender;
        var row = e.record; 
        if(currentRow2){//如果有当前行
        	var datas = prod_grid.getData();
        	currentRow2.saleProds = datas;
        }
		currentRow2=row;
        var td = grid.getRowDetailCellEl(row);
        td.appendChild(detailGrid_Form2);
        var saleProds = row.saleProds;
        if(saleProds){
            saleProds = nui.decode(saleProds);
            prod_grid.setData(saleProds);
        }else{
			prod_grid.setData({});
			row.saleProds = {};
		}
		$('#detailGrid_Form2').show();
	}	
	function onShowRowDetail3(e){
		var grid = e.sender;
        var row = e.record;
    	if(currentRow3){//如果有当前行
        	var datas = sale_grid2.getData();
        	var datas1 = prod_grid2.getData();
        	currentRow3.csIncomeconfSales = datas;
        	currentRow3.csIncomeconfProds = datas1;
        }
		currentRow3=row;
        var td = grid.getRowDetailCellEl(row);
        td.appendChild(detailGrid_Form3);
        var sales = row.csIncomeconfSales;
        if(sales){
            sales = nui.decode(sales);
            sale_grid2.setData(sales);
        }else{
			sale_grid2.setData({});
			row.csIncomeconfSales = {};
		}
		var prods = row.csIncomeconfProds;
        if(prods){
            prods = nui.decode(prods);
            prod_grid2.setData(prods);
        }else{
			prod_grid2.setData({});
			row.csIncomeconfProds = {};
		}
		$('#detailGrid_Form3').show();
	}
</script>
</body>
</html>