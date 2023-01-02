<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>

<link id="css_skin" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/coframe/tools/skins/skin1/style.css" />
<head>
	<title>编辑</title>
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
        <input name="csContractsalePay.contsaleservid" id="incomeconfid" class="nui-hidden" />
        <input name="csContractsalePay.userid" id="userid" class="nui-hidden" />
        <input name="csContractsalePay.cwusername" id="cwusername" class="nui-hidden" />
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>服务费支付</legend>
            <div style="padding:5px;">
            <table style="table-layout:fixed;">
            	<tr>
                    <td style="width: 120px;" align="right">合同存档编号：</td>
                    <td style="width: 150px;" align="left">    
                        <input class="nui-buttonedit" style="width:140px" name="csContractsalePay.csContract.contractid" 
	                        id="contractid" value="" text="" onbuttonclick="onButtonEdit1" showClose="false" 
	                        oncloseclick="onCloseClick" required="true" allowInput="false" showbutton="false" readOnly="readOnly" />
                    </td>    
                    <td style="width: 150px;" align="right">合同名称（项目）：</td>
                    <td style="width: 580px;" colspan="3" align="left">    
                        <input name="csContractsalePay.projectname" id="projectname" style="width:430px" class="nui-textbox" allowInput="false"/>
                    </td>    
                </tr>
            	<tr>
                    <td style="width:120px;" align="right">供应商：</td>
                    <td style="width: 450px;" colspan="3" align="left">    
                        <input class="nui-buttonedit" style="width:240px" name="csContractsalePay.custid" 
	                        id="custid" value="" text="" onbuttonclick="onSelectSupplier" showClose="true" oncloseclick="onCloseClick" required="true" allowInput="false" />
                    </td>
					<td style="width:120px;" align="right">采购合同编号：</td> 
                    <td style="width:310px;" align="left">    
                        <input name="csContractsalePay.purcontno" id="purcontnum" textField="purcontnum" valueField="purcontid" class="nui-combobox" style="width: 150px;"/>
                    </td>              
                </tr>
                <tr>
                    <td style="width:110px;" align="right">报销单号：</td> 
                    <td style="width:250px;" align="left">    
                        <input name="csContractsalePay.expno" id="expno" class="nui-textbox"/>
                    </td> 
                    <td style="width:150px;" align="right">商务确认人：</td>
                    <td style="width:150px;" align="left">    
                        <input name="csContractsalePay.username" id="username" class="nui-textbox" allowInput="false"/>
                    </td>
                    <td style="width:120px;" align="right">商务确认日期：</td>
                    <td style="width:310px;" align="left">    
                        <input name="csContractsalePay.optime" id="optime" class="nui-datepicker" allowInput="false"/>
                    </td>
                </tr>
                    <td style="width:120px;" align="right">总金额：</td>
                    <td style="width:150px;" align="left">    
                        <input name="csContractsalePay.contsum" id="contsum" class="nui-textbox" inputStyle="text-align: right" allowInput="false"/>
                    </td>
                    <td style="width:150px;" align="right">产品金额：</td>
                    <td style="width:150px;" align="left">    
                        <input name="csContractsalePay.prodmon" id="prodmon" class="nui-textbox" inputStyle="text-align: right" allowInput="false"/>
                    </td>
                    <td style="width:120px;" align="right">服务金额：</td>
                    <td style="width:310px;" align="left">    
                        <input class="nui-textbox" name="csContractsalePay.servmon" id="servmon" inputStyle="text-align: right" allowInput="false"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">合同净额：</td>
                    <td style="width:150px;" align="left">    
                        <input name="csContractsalePay.contpolmon" id="contpolmon" class="nui-textbox" inputStyle="text-align: right" allowInput="false"/>
                    </td>
                    <td style="width:150px;" align="right">外包2：</td>
                    <td style="width:150px;" align="left">    
                        <input class="nui-textbox" name="csContractsalePay.othmon" id="othmon" inputStyle="text-align: right" allowInput="false"/>
                    </td>
                    <td style="width:120px;" align="right">外包1：</td>
                    <td style="width:310px;" align="left">    
                        <input name="csContractsalePay.servsubmon" id="servsubmon" class="nui-textbox" inputStyle="text-align: right" allowInput="false"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">销售：</td>
                    <td style="width:150px;" align="left">    
                        <input class="nui-textbox" name="csContractsalePay.salename" id="salename" allowInput="false"/>
                    </td>
                    <td style="width:150px;" align="right">财务审核人：</td> 
                    <td style="width:150px;" align="left">
                    	<input name="csContractsalePay.cwuserid" id="senderuserid" class="nui-buttonedit" onbuttonclick="selectSenderuser" allowInput="false"/>
        			</td>
                    <td style="width:120px;" align="right">付款日期：</td>
                    <td style="width:310px;" align="left">    
                        <input name="csContractsalePay.paydate" id="paydate" class="nui-datepicker"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">备注：</td>
                    <td style="width:880px;" colspan="5" align="left">    
                        <input class="nui-textarea" name="csContractsalePay.memo" id="memo" width="690"/>
                    </td>
                </tr>
            </table>
        </div>
        </fieldset>        
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 1650px">
            <legend>合同销售人员</legend>
            <div style="padding:5px;">
	        	<div id="dept_grid" class="nui-datagrid" style="width: 100%;height:auto;" allowResize="true" oncellendedit="doCal"
			        url="com.primeton.mis.contract.contract.querySalesByContractid.biz.ext" idField="contsaleid" 
			        onshowrowdetail="onShowRowDetail" showPager="false" allowCellSelect="true" 
			        multiSelect="true" editNextOnEnterKey="true" allowCellEdit="true" >			        
			        <div property="columns">            
			            <div type="expandcolumn">#</div>
			            <div field="saleid" width="50" headerAlign="center" >销售ID</div>
			            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
			            <div field="org" renderer="onSYBRenderer" width="90" headerAlign="center">销售所属事业部</div>
			            <div field="contsum" dataType="currency" width="90" headerAlign="center" align="right" >合同总金额</div>
			            <div field="prodmon" dataType="currency" width="90" headerAlign="center" align="right" >产品金额</div>
			            <div field="servmon" dataType="currency" width="90" headerAlign="center" align="right" >服务金额</div>
			            <div field="confservmon" dataType="currency" width="90" headerAlign="center" align="right" >累积确认服务收入</div>
			            <div field="confnetservmon" dataType="currency" width="100" headerAlign="center" align="right" >累积确认服务净收入</div>
			            <div field="servnumtype" renderer="onSLLXRenderer" width="80" headerAlign="center">服务数量类型</div>
			            <div field="servnum" width="60" headerAlign="center" >服务数量</div>
			            <div field="servsubmon" dataType="currency" width="80" headerAlign="center" align="right" >服务外包1金额</div>
			            <div field="thispayedservmon" width="120" headerAlign="center" align="right" >本次支付服务外包1金额</div> 
			            <div field="servpayedmon" dataType="currency" width="120" headerAlign="center" align="right" >服务外包1已支付金额</div>
			            <div field="othmon" dataType="currency" width="80" headerAlign="center" align="right" >服务外包2</div>
			            <div field="thispayedothmon" width="110" headerAlign="center" align="right" >本次支付服务外包2</div>
			            <div field="othpayedmon" dataType="currency" width="110" headerAlign="center" align="right" >服务外包2已支付金额</div>
			            <div field="payedmon" dataType="currency" width="0" headerAlign="center" align="right" >本次支付分包金额</div>
			            <div field="payedomon" dataType="currency" width="0" headerAlign="center" align="right" >本次支付服务费</div>
			            <div field="netservmon" dataType="currency" width="90" headerAlign="center" align="right" >服务净额</div>
			            <div field="contpolmon" dataType="currency" width="90" headerAlign="center" align="right" >合同净额</div>
			        </div>
			    </div>
			    <div id="detailGrid_Form" style="display:none;">
			        <div id="employee_grid" class="nui-datagrid" style="width:90%;height:auto;" showPager="false" 
			        allowCellEdit="true" allowCellSelect="true" editNextOnEnterKey="true" oncellendedit="doSubCal">
			            <div property="columns">
			                <div field="prodtypename" width="210" headerAlign="center">产品名称</div>
			                <div field="prodmon" dataType="currency" width="100" align="right" headerAlign="center">产品金额</div>
			                <div field="prodsubmon" dataType="currency" width="100" align="right" headerAlign="center">产品外包1金额</div>
			                <div field="thispayedprodmon" width="120" align="right" headerAlign="center">本次支付产品外包1金额</div>
			                <div field="prodpayedmon" dataType="currency" width="120" align="right" headerAlign="center">产品外包1已支付金额</div>
			                <div field="othmon" dataType="currency" width="100" align="right" headerAlign="center">产品外包2</div>
			                <div field="thispayedothmon" width="120" align="right" headerAlign="center">本次支付产品外包2</div>
			                <div field="othpayedmon" dataType="currency" width="100" align="right" headerAlign="center">产品外包2已支付金额</div>
			                <div field="netprodmon" dataType="currency" width="100" align="right" headerAlign="center">产品净额</div>
			                <div field="confprodmon" dataType="currency" width="100" align="right" headerAlign="center">累积确认收入</div>
			                <div field="confnetprodmon" dataType="currency" width="100" align="right" headerAlign="center">累积确认净收入</div>
			            </div>
			        </div>    
			    </div>
            </div>
        </fieldset>
    </form>
</div>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
    <a class="nui-button" onclick="onOk('0')" id="saveBtn" style="width:60px;margin-right:20px;">保存</a>
    <a class="nui-button" onclick="onCancel" style="width:60px;">取消</a>
</div> 
<script type="text/javascript">
    var updateURL = "com.primeton.mis.contract.thirdpay.updateThirdpay.biz.ext";
	var addURL = "com.primeton.mis.contract.thirdpay.addThirdpay.biz.ext";
	var saveURL = "";
    nui.parse();
	var dept_grid = nui.get("dept_grid");
	var employee_grid = nui.get("employee_grid");
    function onSYBRenderer(e){
    	return nui.getDictText('CONT_ORG',e.value);
    }
    function onSLLXRenderer(e){
    	return nui.getDictText('SERV_NUM_TYPE',e.value);
    }
    //销售人员点开对应的产品子grid时的方法
    var detailGrid_Form = document.getElementById("detailGrid_Form");      
	var currentRow=null;    
	function onShowRowDetail(e) {
        var grid = e.sender;
        var row = e.record;          
        if(currentRow){//如果有当前行
        	var datas=employee_grid.getData();
        	currentRow.saleProds=datas;
        }
        currentRow=row;
        var td = grid.getRowDetailCellEl(row);
        td.appendChild(detailGrid_Form);            
        var saleProds = row.saleProds;
        if(saleProds){
            saleProds = nui.decode(saleProds);
            employee_grid.setData(saleProds);
        }else{
			employee_grid.setData({});
			row.saleProds = {};
		}
		detailGrid_Form.style.display = "";
	}
	//判断本次确认服务收入、本次确认服务净收入
	function doCal(e){
		var row = dept_grid.getSelected();
		var thispayedservmon = 0;
		var thispayedothmon = 0;
		if(row.thispayedservmon != null && isNaN(row.thispayedservmon)){
			alert("请输入实数！");
			var rowData = {thispayedservmon: 0};
			dept_grid.updateRow(row,rowData);
			return;
		}
		if(row.thispayedothmon != null && isNaN(row.thispayedothmon)){
			alert("请输入实数！");
			var rowData = {thispayedothmon: 0};
			dept_grid.updateRow(row,rowData);
			return;
		}
		if(row.thispayedservmon != null && !isNaN(row.thispayedservmon)){
			thispayedservmon = row.thispayedservmon;
		}	
		if(row.thispayedothmon != null && !isNaN(row.thispayedothmon)){
			thispayedothmon = row.thispayedothmon;
		}
		var servsubmon = 0;
		if(row.servsubmon != null && !isNaN(row.servsubmon)){
			servsubmon = row.servsubmon;
		}
		var othmon = 0;
		if(row.othmon != null && !isNaN(row.othmon)){
			othmon = row.othmon;
		}
		var servpayedmon = 0;
		if(row.servpayedmon != null && !isNaN(row.servpayedmon)){
			servpayedmon = row.servpayedmon;
		}
		var othpayedmon = 0;
		if(row.othpayedmon != null && !isNaN(row.othpayedmon)){
			othpayedmon = row.othpayedmon;
		}
		if(parseFloat(servsubmon) < parseFloat(parseFloat(servpayedmon) + parseFloat(thispayedservmon))){
			alert("服务分包金额<本次支付服务分包金额+已支付服务分包金额！");
			var rowData = {thispayedservmon: 0};
			dept_grid.updateRow(row,rowData);
			return;
		}
		if(parseFloat(othmon) < parseFloat(parseFloat(othpayedmon) + parseFloat(thispayedothmon))){
			alert("服务服务费<本次支付服务服务费+已支付服务服务费！");
			var rowData = {thispayedothmon: 0};
			dept_grid.updateRow(row,rowData);
			return;
		}
		if(thispayedservmon != 0 || thispayedothmon != 0){
			var payedmon = 0;
			var payedomon = 0;
			var sumprodmon = 0;
			var sumprodothmon = 0;
			if(row.payedmon != null && !isNaN(row.payedmon)){
				sumprodmon = row.payedmon;
			}
			if(row.payedomon != null && !isNaN(row.payedomon)){
				sumprodothmon = row.payedomon;
			}
			payedmon = parseFloat(sumprodmon) + parseFloat(thispayedservmon);
			payedomon = parseFloat(sumprodothmon) + parseFloat(thispayedothmon);
			var rowData = {isneedsave: 1,payedmon: payedmon,payedomon: payedomon};
			dept_grid.updateRow(row,rowData);
		}
	}
	//判断本次确认产品收入、本次确认产品净收入
	function doSubCal(e){
		var row = employee_grid.getSelected();
		var thispayedprodmon = 0;
		var thispayedothmon = 0;
		if(row.thispayedprodmon != null && isNaN(row.thispayedprodmon)){
			alert("请输入实数！");
			var rowData = {thispayedprodmon: 0};
			employee_grid.updateRow(row,rowData);
			return;
		}
		if(row.thispayedothmon != null && isNaN(row.thispayedothmon)){
			alert("请输入实数！");
			var rowData = {thispayedothmon: 0};
			employee_grid.updateRow(row,rowData);
			return;
		}
		if(row.thispayedprodmon != null && !isNaN(row.thispayedprodmon)){
			thispayedprodmon = row.thispayedprodmon;
		}
		if(row.thispayedothmon != null && !isNaN(row.thispayedothmon)){
			thispayedothmon = row.thispayedothmon;
		}
		var prodsubmon = 0;
		if(row.prodsubmon != null && !isNaN(row.prodsubmon)){
			prodsubmon = row.prodsubmon;
		}
		var othmon = 0;
		if(row.othmon != null && !isNaN(row.othmon)){
			othmon = row.othmon;
		}
		var prodpayedmon = 0;
		if(row.prodpayedmon != null && !isNaN(row.prodpayedmon)){
			prodpayedmon = row.prodpayedmon;
		}
		var othpayedmon = 0;
		if(row.othpayedmon != null && !isNaN(row.othpayedmon)){
			othpayedmon = row.othpayedmon;
		}
		if(parseFloat(prodsubmon) < parseFloat(parseFloat(prodpayedmon) + parseFloat(thispayedprodmon))){
			alert("产品分包金额<本次支付产品分包金额+已支付产品分包金额！");
			var rowData = {thispayedprodmon: 0};
			employee_grid.updateRow(row,rowData);
			return;
		}
		if(parseFloat(othmon) < parseFloat(parseFloat(othpayedmon) + parseFloat(thispayedothmon))){
			alert("产品服务费<本次支付产品服务费+已支付产品服务费！");
			var rowData = {thispayedothmon: 0};
			employee_grid.updateRow(row,rowData);
			return;
		}
		//汇总本次支付分包金额、本次支付服务费
		var datas=employee_grid.getData();
		var sumprodmon = 0;
		var sumprodothmon = 0;
		for(var i=0;i<datas.length;i++){
			if(datas[i].thispayedprodmon){
				if(!isNaN(datas[i].thispayedprodmon)){
					sumprodmon += parseFloat(datas[i].thispayedprodmon);
				}else{
					datas[i].thispayedprodmon = 0;
				}
			}
			if(datas[i].thispayedothmon){
				if(!isNaN(datas[i].thispayedothmon)){
					sumprodothmon += parseFloat(datas[i].thispayedothmon);
				}else{
					datas[i].thispayedothmon = 0;
				}
			}
		}
		if(thispayedprodmon != 0 || thispayedothmon != 0){
			var row = dept_grid.getSelected();			
			var thispayedservmon = 0;
			var thispayedservothmon = 0;
			if(row.thispayedservmon != null && !isNaN(row.thispayedservmon)){
				thispayedservmon = row.thispayedservmon;
			}	
			if(row.thispayedothmon != null && !isNaN(row.thispayedothmon)){
				thispayedservothmon = row.thispayedothmon;
			}
			var payedmon = 0;
			var payedomon = 0;
			payedmon = parseFloat(sumprodmon) + parseFloat(thispayedservmon);
			payedomon = parseFloat(sumprodothmon) + parseFloat(thispayedservothmon);
			var rowData = {isneedsave: 1,payedmon: payedmon,payedomon: payedomon};
			dept_grid.updateRow(row,rowData);
		}
	}
	//点击保存时调用的方法
	var form = new nui.Form("form1");
	function SaveData() {
        var o = form.getData();
        var row = dept_grid.getSelected();
        if(row){
        	var datas=employee_grid.getData();
        	row.saleProds=datas;
        }
        o.csContractsalePay.csContract.sales = dept_grid.getData();
        if(!form.validate()){
        	nui.alert("表单信息不完整！");
        	return;
        }
		var incomeconfid = nui.get("incomeconfid").getValue();
		if(incomeconfid){
			saveURL = updateURL;
		} else{
			saveURL = addURL;
		}
        var json = nui.encode(o);
        nui.confirm("确定保存吗？","操作提示",function(action){
        	if(action == "ok"){
        		nui.get("saveBtn").setEnabled(false);
		        nui.ajax({
		            url: saveURL,
		            data: json,
		            type: 'POST',
		            cache: false,
		            contentType: 'text/json',
		            success: function (text) {
		            	nui.get("saveBtn").setEnabled(true);
		            	if(text.result == null){
		            		nui.alert("保存成功！","操作提示",function (){
				                CloseWindow("ok");
		            		});
		            	}else{
		            		nui.alert("保存失败！");
		            	}
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		                alert(jqXHR.responseText);
		                CloseWindow();
		            }
		        });
        	}
        });
    }
	//页面进入时调用的方法
    function SetData(data) {
        if (data.action == "edit") {
            //跨页面传递的数据对象，克隆后才可以安全使用
            data = nui.clone(data);
			var json = nui.encode({csContractsalePay: data});
            nui.ajax({
                url: "com.primeton.mis.contract.thirdpay.getThirdpay.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
                success: function (o) {
                    form.setData(o);
                    form.setChanged(false);
                    //合同存档编号
                    nui.get("contractid").setText(o.csContractsalePay.csContract.contnum);
                    //合同名称（项目）
                    nui.get("projectname").setValue(o.csContractsalePay.csContract.projectname);
                    //供应商
                    nui.get("custid").setText(o.csContractsalePay.custname);
                    //报销单号
                    nui.get("expno").setValue(o.csContractsalePay.expno);
                    //总金额
                    nui.get("contsum").setValue(o.csContractsalePay.csContract.contsum);
                    //产品金额
                    nui.get("prodmon").setValue(o.csContractsalePay.csContract.prodmon);
                    //服务金额 
                    nui.get("servmon").setValue(o.csContractsalePay.csContract.servmon);
                    //合同净额 
                    nui.get("contpolmon").setValue(o.csContractsalePay.csContract.contpolmon);
                    //外包2 
                    nui.get("othmon").setValue(o.csContractsalePay.csContract.othmon);
                    //外包1
                    nui.get("servsubmon").setValue(o.csContractsalePay.csContract.servsubmon);
                    //销售
                    nui.get("salename").setValue(o.csContractsalePay.csContract.salename);
                    //支付确认人 
                    nui.get("username").setValue(o.csContractsalePay.username);
                    //支付日期
                    nui.get("optime").setValue(o.csContractsalePay.optime);
                    nui.get("paydate").setValue(o.csContractsalePay.paydate);
                    //采购合同编号
                    nui.get("purcontnum").setValue(o.csContractsalePay.purcontno);
                    nui.get("purcontnum").setText(o.csContractsalePay.purcontno);
                    //供应商
                    nui.get("senderuserid").setText(o.csContractsalePay.cwusername);
                    
                    //采购合同编号集合
                    var json = nui.decode({"purContract": {"purSupplier": {"custid": o.csContractsalePay.custid}}});
                    nui.ajax({
		        		url: "com.primeton.eos.ame_pur.PurContract.queryPurContractByCustid.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (o) {
		                	nui.parse();
		                	//采购合同编号
		                	var purcontnums = [];
		                	for(var i = 0;i < o.purContracts.length;i ++){
		                		if(o.purContracts[i].purcontnum){
			                		purcontnums[i] = {"purcontnum": o.purContracts[i].purcontnum,
			                		"purcontid": o.purContracts[i].purcontnum};
		                		}
		                	}
		                	nui.get("purcontnum").setData(nui.encode(purcontnums));
		                	
	                	},
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                    CloseWindow();
		                }
		        	});
               		dept_grid.load({ contractid: o.csContractsalePay.csContract.contractid });
                }
            });
        }else{
        	var userid = "<b:write property='userObject/userId' scope='session'/>";
        	var username = "<b:write property='userObject/userName' scope='session'/>";
        	nui.get("userid").setValue(userid);
        	nui.get("username").setValue(username);
        	nui.get("optime").setValue(new Date());
        }
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
        	nui.alert("表单信息不完整！");
        	return;
        }else{
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
    //“签署单位”点击选择时的方法
    //2016/11/25-签署单位使用供应商选择页面。
    function onSelectSupplier(e) {
        var btnEdit = this;	
        var lookupUrl="";
        lookupUrl = "/ame_pur/PurSupplier/SelectSupplier.jsp";
        if (lookupUrl=="") return;
        nui.open({
			url:"<%=contextPath%>"+lookupUrl,
			title: "选择签署单位",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.custid);
		                btnEdit.setText(data.custname);
		                //purcontnum通过选择供应商，带出供应商所有的采购合同号//nui.decode({"custid": data.custid});
		                var json = nui.decode({"purContract": {"purSupplier": {"custid": data.custid}}});
                        nui.ajax({
			        		url: "com.primeton.eos.ame_pur.PurContract.queryPurContractByCustid.biz.ext",
			                data: json,
			                type: 'POST',
			                cache: false,
			                contentType: 'text/json',
			                success: function (o) {
			                	nui.parse();
			                	//采购合同编号
			                	var purcontnums = [];
			                	for(var i = 0;i < o.purContracts.length;i ++){
			                		if(o.purContracts[i].purcontnum){
				                		purcontnums[i] = {"purcontnum": o.purContracts[i].purcontnum,
				                		"purcontid": o.purContracts[i].purcontnum};
			                		}
			                	}
			                	nui.get("purcontnum").setData(nui.encode(purcontnums));
			                	if(o.purContracts.length > 0){
				                	nui.get("purcontnum").setValue(o.purContracts[0].purcontnum);
				                	nui.get("purcontnum").setText(o.purContracts[0].purcontnum);
			                	}
		                	},
			                error: function (jqXHR, textStatus, errorThrown) {
			                    alert(jqXHR.responseText);
			                    CloseWindow();
			                }
			        	});
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
			title: "选择合同",
			width: 1000,
			height: 510,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.id);
		                btnEdit.setText(data.text);
		                nui.get("projectname").setValue(data.projectname);
		                nui.get("prodmon").setValue(data.prodmon);
		                nui.get("servmon").setValue(data.servmon);
		                nui.get("contsum").setValue(data.contsum);
		                nui.get("servsubmon").setValue(data.servsubmon);
		                nui.get("othmon").setValue(data.othmon);
		                nui.get("contpolmon").setValue(data.contpolmon);
		                nui.get("salename").setValue(data.salename);
		                dept_grid.load({ contractid: data.id });
					}
				}
			}
		});
	}
	function selectSenderuser(){
	    	var btnEdit = this;
	        nui.open({
	            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择财务审核人员",
                width: 430,
                height: 400,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.userid);
                            btnEdit.setText(data.empname);
                            nui.get("cwusername").setValue(data.empname);
                        }
                    }

                }
            });
        }
</script>
</body>
</html>