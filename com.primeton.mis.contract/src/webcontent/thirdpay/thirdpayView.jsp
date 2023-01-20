<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>采购支付信息查看</title>
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
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>采购支付信息确认</legend>
            <div style="padding:5px;">
            <table style="table-layout:fixed;">
            	<tr>
            		<td style="width: 110px;"></td><td style="width: 350px;"></td>
            		<td style="width: 110px;"></td><td></td>
            		<td style="width: 110px;"></td><td></td>
            	</tr>
            	<tr>
                    <td style="width:110px;" align="right">合同存档编号：</td>
                    <td style="width:200px;" align="left" id="csContractsalePay.csContract.contnum"></td>
                    <td style="width:110px;" align="right">合同名称（项目）：</td>
                    <td style="width:510px;" colspan="3" align="left" id="csContractsalePay.csContract.projectname"></td>
                </tr>
            	<tr>
                    <td style="width:110px;" align="right">供应商：</td>
                    <td style="width:210px;" align="left" id="csContractsalePay.misCustinfo.custname"></td>
                    <td style="width:110px;" align="right">采购合同编号：</td>
                    <td style="width:210px;" align="left" id="csContractsalePay.purcontno"></td>
                    <td style="width:110px;" align="right">报销单号：</td> 
                    <td style="width:200px;" align="left" id="csContractsalePay.expno"></td>
                </tr>
                <tr>
                    <td style="width:110px;" align="right">总金额：</td>
                    <td style="width:200px;" align="left" id="csContractsalePay.csContract.contsum"></td>
                    <td style="width:110px;" align="right">产品金额：</td>
                    <td style="width:200px;" align="left" id="csContractsalePay.csContract.prodmon"></td>
                    <td style="width:110px;" align="right">服务金额：</td>
                    <td style="width:200px;" align="left" id="csContractsalePay.csContract.servmon"></td>
                </tr>
                <tr>
                    <td style="width:110px;" align="right">合同净额：</td>
                    <td style="width:250px;" align="left" id="csContractsalePay.csContract.contpolmon"></td>
                    <td style="width:110px;" align="right" id="third11">采购2：</td>
                    <td style="width:250px;" align="left" id="csContractsalePay.csContract.othmon"></td>
                    <td style="width:110px;" align="right">采购1：</td>
                    <td style="width:250px;" align="left" id="csContractsalePay.csContract.servsubmon"></td>
                </tr>
                <tr>
                    <td style="width:110px;" align="right">销售：</td>
                    <td style="width:250px;" align="left" id="csContractsalePay.csContract.salename"></td>
                    <td style="width:110px;" align="right">商务确认人：</td>
                    <td style="width:250px;" align="left" id="csContractsalePay.username"></td>
                    <td style="width:110px;" align="right">商务确认日期：</td>
                    <td style="width:250px;" align="left" id="csContractsalePay.optime"></td>
                </tr>
                <tr>
                    <td style="width:110px;" align="right"></td>
                    <td style="width:250px;" align="left"></td>
                    <td style="width:110px;" align="right">财务审核人：</td>
                    <td style="width:250px;" align="left" id="csContractsalePay.cwusername"></td>
                    <td style="width:110px;" align="right">付款日期：</td>
                    <td style="width:250px;" align="left" id="csContractsalePay.paydate"></td>
                </tr>
                <tr>
                    <td style="width:110px;" align="right">备注：</td>
                    <td style="width:970px;" align="left" colspan="5" id="csContractsalePay.memo"></td>
                </tr>
            </table>
        </div>
        </fieldset>
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 1770px">
            <legend>合同销售人员</legend>
            <div style="padding:5px;">
	        	<div id="dept_grid" class="nui-datagrid" style="width: 100%;height:auto;" allowResize="true"
			        url="com.primeton.mis.contract.thirdpay.querySalesByContractidAndThirdpay.biz.ext"  idField="contsaleid"
			        onshowrowdetail="onShowRowDetail" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
			        <div property="columns">            
			            <div type="expandcolumn">#</div>
			            <div field="saleid" width="50" headerAlign="center" >销售ID</div>
			            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
			            <div field="org" renderer="onSYBRenderer" width="90" headerAlign="center">销售所属事业部</div>
			            <div field="contsum" dataType="currency" width="90" headerAlign="center" align="right">合同总金额</div>
			            <div field="prodmon" dataType="currency" width="90" headerAlign="center" align="right">产品金额</div>
			            <div field="servmon" dataType="currency" width="90" headerAlign="center" align="right">服务金额</div>
			            <div field="confservmon" dataType="currency" width="110" headerAlign="center" align="right">累积确认服务收入</div>
			            <div field="confnetservmon" dataType="currency" width="120" headerAlign="center" align="right">累积确认服务净收入</div>
			            <div field="servnumtype" renderer="onSLLXRenderer" width="80" headerAlign="center">服务数量类型</div>
			            <div field="servnum" width="60" headerAlign="center" align="right">服务数量</div>
			            <div field="servsubmon" dataType="currency" width="80" headerAlign="center" align="right">服务采购1</div>
			            <div field="thispayedservmon" dataType="currency" width="130" headerAlign="center" align="right">本次支付服务采购1</div>
			            <div field="servpayedmon" dataType="currency" width="140" headerAlign="center" align="right">服务采购1累积支付金额</div>
			            <div name="othmon" field="othmon" dataType="currency" width="80" headerAlign="center" align="right">服务采购2</div>
			            <div name="thispayedothmon" field="thispayedothmon" dataType="currency" width="110" headerAlign="center" align="right">本次支付服务采购2</div>
			            <div name="othpayedmon" field="othpayedmon" dataType="currency" width="140" headerAlign="center" align="right">服务采购2累积支付金额</div>
			            <div field="netservmon" dataType="currency" width="90" headerAlign="center" align="right">服务净额</div>
			            <div field="contpolmon" dataType="currency" width="auto" headerAlign="center" align="right">合同净额</div>
			        </div>
			    </div>
			    <div id="detailGrid_Form" style="display:none;">
			        <div id="employee_grid" class="nui-datagrid" style="width:90%;height:auto;" showPager="false" allowCellEdit="true" allowCellSelect="true" editNextOnEnterKey="true">			            
			            <div property="columns">
			                <div field="prod_name" width="210" headerAlign="center">产品名称</div>
			                <div field="prodmon" dataType="currency" width="100" align="right" headerAlign="center">产品金额</div>
			                <div field="prodsubmon" dataType="currency" width="100" align="right" headerAlign="center">产品采购1</div>
			                <div field="thispayedprodmon" dataType="currency" width="120" align="right" headerAlign="center">本次支付产品采购1</div>
			                <div field="prodpayedmon" dataType="currency" width="120" align="right" headerAlign="center">产品采购1累积支付金额</div>
			                <div name="othmon" field="othmon" dataType="currency" width="100" align="right" headerAlign="center">产品采购2</div>
			                <div name="thispayedothmon" field="thispayedothmon" dataType="currency" width="120" align="right" headerAlign="center">本次支付产品采购2</div>
			                <div name="othpayedmon" field="othpayedmon" dataType="currency" width="120" align="right" headerAlign="center">产品采购2累积支付金额</div>
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
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div> 
<script type="text/javascript">
    nui.parse();
    var contsaleservid = '<%=request.getParameter("contsaleservid") %>';
	SetData();
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
	//页面进入时调用的方法
	var form = new nui.Form("form1");
	var isCommerce = false;
	var isFinance = false;
	var isLeader = false;
	<l:iterate id="roles" property="userObject/attributes/roles" scope="session">
		var roleid = "<b:write iterateId='roles' property='roleid'/>";
		if(roleid == "commerce"){
			isCommerce = true;
		}
		if(roleid == "finance"){
			isFinance = true;
		}
		if(roleid == "COO" || roleid == "general" || roleid == "viceGeneral" || roleid == "prodGeneral" || roleid == "CSManager"){
			isLeader = true;
		}
	</l:iterate>
    function SetData() {
		var json = nui.encode({csContractsalePay:{contsaleservid: contsaleservid}});
        nui.ajax({
            url: "com.primeton.mis.contract.thirdpay.getThirdpay.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
                form.setData(o);
                form.setChanged(false);
                document.getElementById("csContractsalePay.csContract.contnum").innerHTML = o.csContractsalePay.csContract.contnum;
                document.getElementById("csContractsalePay.csContract.projectname").innerHTML = o.csContractsalePay.csContract.projectname == null?"":o.csContractsalePay.csContract.projectname;
                document.getElementById("csContractsalePay.misCustinfo.custname").innerHTML = o.csContractsalePay.custname;
                document.getElementById("csContractsalePay.purcontno").innerHTML = o.csContractsalePay.purcontno == null ? "" : o.csContractsalePay.purcontno;
                document.getElementById("csContractsalePay.expno").innerHTML = o.csContractsalePay.expno == null?"":o.csContractsalePay.expno;
                document.getElementById("csContractsalePay.csContract.contsum").innerHTML = formatNumber(o.csContractsalePay.csContract.contsum.toFixed(2),'#,##.00');
                document.getElementById("csContractsalePay.csContract.prodmon").innerHTML = formatNumber(o.csContractsalePay.csContract.prodmon.toFixed(2),'#,##.00');
                document.getElementById("csContractsalePay.csContract.servmon").innerHTML = formatNumber(o.csContractsalePay.csContract.servmon.toFixed(2),'#,##.00');
                document.getElementById("csContractsalePay.csContract.contpolmon").innerHTML = formatNumber(o.csContractsalePay.csContract.contpolmon.toFixed(2),'#,##.00');
                document.getElementById("csContractsalePay.csContract.othmon").innerHTML = formatNumber(o.csContractsalePay.csContract.othmon.toFixed(2),'#,##.00');
                document.getElementById("csContractsalePay.csContract.servsubmon").innerHTML = formatNumber(o.csContractsalePay.csContract.servsubmon.toFixed(2),'#,##.00');
                document.getElementById("csContractsalePay.csContract.salename").innerHTML = o.csContractsalePay.csContract.salename;
                document.getElementById("csContractsalePay.username").innerHTML = o.csContractsalePay.username;
                document.getElementById("csContractsalePay.optime").innerHTML = o.csContractsalePay.optime;
                document.getElementById("csContractsalePay.cwusername").innerHTML = o.csContractsalePay.cwusername == null ? "":o.csContractsalePay.cwusername;
                document.getElementById("csContractsalePay.paydate").innerHTML = o.csContractsalePay.paydate == null ? "":o.csContractsalePay.paydate;
                document.getElementById("csContractsalePay.memo").innerHTML = o.csContractsalePay.memo == null ? "":o.csContractsalePay.memo;
                dept_grid.load({ contractid: o.csContractsalePay.csContract.contractid,contsaleservid: contsaleservid});
                if(isFinance == false && isCommerce == false && isLeader == false){//非商务、非财务、非领导，不能看服务费
                	document.getElementById("third11").innerHTML = "";
                	document.getElementById("othmon").innerHTML = "";
					dept_grid.hideColumn("othmon");
					dept_grid.hideColumn("thispayedothmon");
					dept_grid.hideColumn("othpayedmon");
					employee_grid.hideColumn("othmon");
					employee_grid.hideColumn("thispayedothmon");
					employee_grid.hideColumn("othpayedmon");                	
                }
            }
        });
	}
    function onCancel(e) {
        window.close();
    }
</script>
</body>
</html>