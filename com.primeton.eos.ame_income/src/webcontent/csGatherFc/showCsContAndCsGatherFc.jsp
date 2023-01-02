<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): zhuyl
  - Date: 2016-10-29 15:40:49
  - Description:
-->
<head>
<title>新增/编辑合同收款记录</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
	<legend>合同基本信息</legend>
	<form id="form1" method="post">
	<input name="csContract.contractid" id="contractid" class="nui-hidden"/>
	<input name="csContract.contnum" id="contnum"  class="nui-hidden"/>
	<input name="fileids" id="fileids" class="nui-hidden"/>
		<div style="padding:5px;">
			<table style="table-layout:fixed;" id="table_file">
				<tr>
                    <td style="width:100px;" align="right">合同存档编号：</td>
                    <td style="width:250px;" id="csContract.contnum"></td>
                    <td style="width:100px;" align="right">合同名称：</td>
                    <td style="width:250px;" id="csContract.projectname"></td>
	                <td style="width:100px;" align="right">合同签署日期：</td>
	                <td style="width:100px;" id="csContract.signdate"></td>
                </tr>
                <tr>
                    <td style="width:100px;" align="right">签署单位：</td>
                    <td style="width:250px;" id="csContract.misCustinfo.custname"></td>
                    <td style="width:100px;" align="right">最终用户：</td>
                    <td style="width:250px;" id="csContract.username"></td>
                    <td style="width:100px;" align="right">受益销售：</td>
                    <td style="width:100px;" id="csContract.salename"></td>
                </tr>
                <tr>
                    <td style="width:100px;" align="right">产品金额：</td>
                    <td style="width:150px;"id="csContract.prodmon"></td>
                    <td style="width:100px;" align="right">服务金额：</td>
                    <td style="width:250px;"id="csContract.servmon"></td>
                    <td style="width:100px;" align="right">维保金额：</td>
                    <td style="width:150px;"id="csContract.masum"></td>
                </tr>
                <tr>
                    <td style="width:100px;" align="right">合同总金额：</td>
                    <td style="width:250px;"id="csContract.contsum"></td>
                    <td></td><td></td><td></td><td></td>
                </tr>
			</table>
		</div>
		</form>
	</fieldset>
	 <fieldset style="border:solid 1px #aaa;padding:3px;">
        <legend>合同收款记录列表</legend>
        <div class="nui-toolbar">
            <a class="mini-button" iconCls="icon-add" id="addCsGatherFc" onclick="add()" >增加</a>
            <a class="mini-button" iconCls="icon-edit" id="editCsGatherFc" onclick="edit()">编辑</a>  
            <a class="mini-button" iconCls="icon-remove" id="removeCsGather" onclick="removeCsGatherFc()">删除</a>
        </div>          
    	<div id="grid_income" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="csGatherFcs" 
    		showSummaryRow="true" ondrawsummarycell="doCountSum"
	 		url="com.primeton.eos.ame_income.csGatherFc.querycsGatherFcIncome.biz.ext" 
	 		allowCellSelect="true"  showPager="false" idField="appid" multiSelect="true">
			<div property="columns">
				<div type="checkcolumn" width="25"></div>
				<div field="contnum" width="0">合同编号</div>
				<div field="gatherno" width="65" align="center" headerAlign="center" allowSort="true" renderer="getDetail">收款次数</div>
				<div field="gathertype" width="80" align="center" headerAlign="center" renderer="dictGatherType">收款类型</div>
				<div field="newyearmonth" width="75" align="center" headerAlign="center">收款年月</div>
				<div field="changetimes" width="70" align="center" headerAlign="center">变更次数</div>
				<div field="fcsum" width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >本次收款金额</div>	
				<div field="fcsum2" width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >不含税金额</div>	
				<div field="fcreverate" width="70" align="right" headerAlign="center" numberFormat="p1" summaryType="sum">收款比例</div>	
				<div field="gathertimedesc" width="300" align="left" headerAlign="center" >收款确认时点描述</div>		
				<div field="confirmday" width="90" align="center" headerAlign="center" >实际收款日期</div>
				<div field="status" width="auto" align="center" headerAlign="center" renderer="dictstatus">当前收款状态</div>
				<div field="billstatus" width="auto" align="center" headerAlign="center" renderer="dictstatus1">收款开票状态</div>
			</div>
		</div>
    </fieldset>
    <fieldset id="field_add" style="border:solid 1px #aaa;padding:3px;">
		<legend>新增合同收款记录</legend>
		<form id="form_add" method="post">
			<input name="csGatherFc.contnum" id="contnum1" class="nui-hidden"/>
			<table style="table-layout:fixed;" id="table_file">
				<tr>
					<td align="right" style="width:110px">收款确认次数：</td>
					<td><input name="csGatherFc.gatherno" id="gatherno" required="true" class="nui-textbox" style="width:120px" /></td>
					<td align="right" style="width:110px">预计收款年月：</td>
					<td><input name="csGatherFc.yearmonth" id="yearmonth" required="true" class="nui-monthpicker" format="yyyyMM" style="width:120px" allowInput="false"/></td>
					<td align="right" style="width:110px">收款类型：</td>
					<td><input name="csGatherFc.gathertype" id="gathertype" class="nui-dictcombobox" dictTypeId="AME_GATHERTYPE" onblur="calRate" style="width:100px" required="true" /></td>
				</tr>	
				<tr>
					<td align="right" style="width:110px">预计收款金额：</td>
					<td><input name="csGatherFc.fcsum" id="fcsum" class="nui-textbox" inputStyle="text-align: right" style="width:120px" onblur="calRate"/></td>
					<td align="right" style="width:110px">预计收款比例：</td>
					<td><input name="csGatherFc.fcreverate" id="fcreverate" class="nui-textbox" style="width:110px" align="right" inputStyle="text-align:right;"/>%</td>
					<td align="right" style="width:110px">收款状态：</td>
					<td><input name="csGatherFc.status" id="status_add" class="nui-dictcombobox" dictTypeId="AME_GATHERSTATUS" style="width:125px" /></td>
				</tr>
				<tr>
					<td align="right" style="width:110px">预计金额产品额：</td>
					<td><input name="csGatherFc.productsum" id="productsum" class="nui-textbox" inputStyle="text-align: right" style="width:120px" /></td>
					<td align="right" style="width:110px">预计金额服务额：</td>
					<td><input name="csGatherFc.servicesum" id="servicesum" class="nui-textbox" inputStyle="text-align: right" style="width:120px" /></td>
					<td align="right" style="width:110px">收款开票状态：</td>
					<td><input name="csGatherFc.billstatus" id="billstatus_add" class="nui-dictcombobox" dictTypeId="MIS_GATHERBILL" style="width:125px" /></td>
				</tr>
				<tr>
					<td align="right" style="width:110px">收款确认时点描述：</td>
					<td colspan="5"><input name="csGatherFc.gathertimedesc" id="gathertimedesc" class="nui-textbox" style="width:500px" /></td>
				</tr>
				<tr>
					<td align="right" style="width:110px">说明：</td>
					<td colspan="5"><input name="csGatherFc.memo" id="memo" class="nui-textarea" style="width:100%"/></td>
				</tr>
			</table>
		</form>
	</fieldset>
	<fieldset id="field_edit" style="border:solid 1px #aaa;padding:3px;">
		<legend>编辑合同收款记录</legend>
		<form id="form_edit" method="post">
			<input name="csGatherFc.gatherid" id="gatherid" class="nui-hidden" />
			<input name="csGatherFc.contnum" id="contnum2" class="nui-hidden" />
			<table style="table-layout:fixed;" id="table_file">
				<tr>
					<td align="right" style="width:160px">收款确认次数：</td>
					<td style="width:160px"><input name="csGatherFc.gatherno" id="gatherno_edit" class="nui-textbox" style="width:100px"/></td>
					<td align="right" style="width:160px">最初预计收款年月：</td>
					<td style="width:120px"><input name="csGatherFc.yearmonth" id="yearmonth_edit" class="nui-monthpicker" format="yyyyMM" style="width:100px" showButton="false" allowInput="false"/></td>
					<td align="right" style="width:160px">目前确认状态：</td>
					<td><input name="csGatherFc.status" id="status_edit" class="nui-dictcombobox" dictTypeId="AME_GATHERSTATUS" style="width:125px" /></td>
				</tr>
				<tr>
					<td align="right" style="width:160px">最新预计收款年月：</td>
					<td style="width:120px"><input name="csGatherFc.newyearmonth" id="newyearmonth_edit" class="nui-monthpicker" format="yyyyMM" style="width:100px" allowInput="false"/></td>
					
					<td align="right" style="width:160px">收款确认时点描述：</td>
					<td colspan="3"><input name="csGatherFc.gathertimedesc" id="gathertimedesc_edit" class="nui-textbox" style="width:400px"/></td>
				</tr>
				<tr>
					<td align="right" style="width:160px">收款类型：</td>
					<td style="width:200px"><input name="csGatherFc.gathertype" id="gathertype_edit" onblur="calRate_edit" class="nui-dictcombobox" dictTypeId="AME_GATHERTYPE" required="true" style="width:120px" multiSelect="false"/></td>
					<td align="right" style="width:160px">预计收款金额：</td>
					<td style="width:125px"><input name="csGatherFc.fcsum" id="fcsum_edit" class="nui-textbox" style="width:120px" onblur="calRate_edit" inputStyle="text-align:right;" /></td>
					<td align="right" style="width:160px">收款比例：</td>
					<td style="width:150px"><input name="csGatherFc.fcreverate" id="fcreverate_edit" class="nui-textbox" style="width:100px" align="right" inputStyle="text-align:right;"/>%</td>
				</tr>
				<tr>
					<td align="right" style="width:160px">预计金额产品额：</td>
					<td style="width:185px"><input name="csGatherFc.productsum" id="productsum_edit" inputStyle="text-align: right" class="nui-textbox" style="width:120px" /></td>
					<td align="right" style="width:160px">预计金额服务额：</td>
					<td style="width:120px"><input name="csGatherFc.servicesum" id="servicesum_edit" inputStyle="text-align: right" class="nui-textbox" style="width:120px" /></td>
					<td align="right" style="width:160px">财报实际收款日期：</td>
					<td style="width:120px"><input name="csGatherFc.confirmday" id="confirmday_edit" class="nui-datepicker" style="width:100px"/></td>
				</tr>
				<tr>
					<td align="right" style="width:160px">实际收款金额(含税)：</td>
					<td><input name="csGatherFc.actsum" id="actsum_edit" style="width:120px" inputStyle="text-align: right" class="nui-textbox"/></td>
					<td align="right" style="width:160px">实际收款金额(不含税)：</td>
					<td><input name="csGatherFc.actsum2" id="actsum2_edit" style="width:120px" inputStyle="text-align: right" class="nui-textbox"/></td>
					<td align="right" style="width:160px">管报实际收款日期：</td>
					<td style="width:120px"><input name="csGatherFc.maconfirmday" id="maconfirmday_edit" class="nui-datepicker" style="width:100px"/></td>
				</tr>
				<tr>
					<td align="right" style="width:160px">实际收款产品额(含税)：</td>
					<td><input name="csGatherFc.actproductsum" id="actproductsum_edit" onblur="bluractproductsumedit" inputStyle="text-align: right" style="width:120px" class="nui-textbox"/></td>
					<td align="right" style="width:160px">实际收款服务额(含税)：</td>
					<td><input name="csGatherFc.actservicesum" id="actservicesum_edit" onblur="bluractservicesumedit" inputStyle="text-align: right" style="width:120px" class="nui-textbox"/></td>
					<td align="right" style="width:160px">收款开票状态：</td>
					<td><input name="csGatherFc.billstatus" id="billstatus_edit" class="nui-dictcombobox" dictTypeId="MIS_GATHERBILL" style="width:125px" /></td>
				</tr>
				<tr>
					<td align="right" style="width:160px">产品税率：</td>
					<td><input name="csGatherFc.productrate" id="productRate_edit" inputStyle="text-align: right" style="width:120px" class="nui-textbox"/></td>
					<td align="right" style="width:160px">服务税率：</td>
					<td><input name="csGatherFc.servicerate" id="serviceRate_edit" inputStyle="text-align: right" style="width:120px" class="nui-textbox"/></td>
					<td></td><td></td>
				</tr>
				<tr>
					<td align="right" style="width:160px">实际收款产品额(不含税)：</td>
					<td><input name="csGatherFc.actproductsum2" id="actproductsum2_edit" inputStyle="text-align: right" style="width:120px" class="nui-textbox"/></td>
					<td align="right" style="width:160px">实际收款服务额(不含税)：</td>
					<td><input name="csGatherFc.actservicesum2" id="actservicesum2_edit" inputStyle="text-align: right" style="width:120px" class="nui-textbox"/></td>
					<td></td><td></td>
				</tr>
				<tr>
					<td align="right" style="width:130px">说明：</td>
					<td colspan="5"><input name="csGatherFc.memo" id="memo_edit" class="nui-textarea" style="width:100%"/></td>
				</tr>
			</table>
		</form>
	</fieldset>
	<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;display: none;">
	<legend>附件</legend>
	<jsp:include page="/ame_common/inputFile.jsp"/>
</fieldset>
</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOkAdd()" id="addGatherFc" style="width:90px;margin-right:20px;">确定增加</a>
		<a class="nui-button" onclick="onOkEdit()" id="editGatherFc" style="width:90px;margin-right:20px;">确定编辑</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
<script type="text/javascript">
        nui.parse();
	  	var form = new nui.Form("form1");
	  	var form_add = new nui.Form("form_add");
	  	var form_edit = new nui.Form("form_edit");
	  	var grid_income = nui.get("grid_income");
  		document.getElementById("field_edit").style.display="none";
  		document.getElementById("field_add").style.display="none";
  		document.getElementById("addGatherFc").style.display="none";
  		document.getElementById("editGatherFc").style.display="none";
  		var contsum = 0; 
  		var servmon = 0; 
  		var prodmon = 0;
	  	//进页面调用方法
      	function SetData(data){
      		data = nui.clone(data);
      		var json = {csContract:{contractid: data.contractid}};
      		nui.ajax({
	            url: "com.primeton.eos.ame_income.csReveForecast.queryContByContractid.biz.ext",
	            data: json,
	            type: 'POST',
	            cache: false,
	            contentType: 'text/json',
	            success: function (o) {
	            	nui.get("contractid").setValue(o.csContract.contractid);
	            	nui.get("contnum").setValue(o.csContract.contnum);
	                document.getElementById("csContract.projectname").innerHTML = o.csContract.projectname == null ? "":o.csContract.projectname;
	                //合同编号加链接
	                var tempSrc = "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + o.csContract.contnum + "</a>";
	                document.getElementById("csContract.contnum").innerHTML = tempSrc;
	                document.getElementById("csContract.signdate").innerHTML = o.csContract.signdate == null ?"":o.csContract.signdate;
	                document.getElementById("csContract.misCustinfo.custname").innerHTML = o.csContract.misCustinfo == null ? "" : o.csContract.misCustinfo.custname;
	                document.getElementById("csContract.username").innerHTML = o.csContract.username == null ? "" : o.csContract.username;
	                document.getElementById("csContract.contsum").innerHTML = o.csContract.contsum== null ? "" : toThousands(o.csContract.contsum);
	                contsum = o.csContract.contsum;
	                document.getElementById("csContract.salename").innerHTML = o.csContract.salename== null ? "" :o.csContract.salename;
	                document.getElementById("csContract.servmon").innerHTML = o.csContract.servmon== null ? "" : toThousands(o.csContract.servmon);
	                servmon = o.csContract.servmon; 
	                document.getElementById("csContract.prodmon").innerHTML = o.csContract.prodmon== null ? "" : toThousands(o.csContract.prodmon);
	                prodmon = o.csContract.prodmon;
	                document.getElementById("csContract.masum").innerHTML = o.csContract.masum== null ? "" : toThousands(o.csContract.masum);
	                grid_income.sortBy("newyearmonth","desc");
	                grid_income.load({contnum: o.csContract.contnum});
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
	        });
      	
      	}
      	
      	//设置业务字典值-收款状态
	  	function dictstatus(e) {
			return nui.getDictText('AME_GATHERSTATUS',e.value);
		}
		function dictstatus1(e) {
			return nui.getDictText('MIS_GATHERBILL',e.value);
		}
		//金额比例
		function renderrate(e) {
			return parseFloat(e.value*100).toFixed(1)+"%";
        }
        
        //设置业务字典值-收款类型
		function dictGatherType(e) {
            return nui.getDictText('AME_GATHERTYPE',e.value);
        }
		
		//新增计算预计收款金额
        function calRate(){
        	var gathertype = nui.get("gathertype").getValue();//收款类型
        	if(gathertype==null||gathertype==""){
        		return;
        	}
        	//预计收款金额
        	var fcsum = nui.get("fcsum").getValue();
        	//不能超过的金额
        	var cantMoreSum = 0;
        	//所有行的金额
        	var allFcsum = 0;
        	var allRows = grid_income.getData();
        	for(var i = 0;i < allRows.length;i ++){
        		allFcsum += allRows[i].fcsum;
        	}
        	allFcsum = parseFloat(allFcsum).toFixed(2);
        	//不能超过的金额=合同总金额-所有行的总金额
        	cantMoreSum = parseFloat(contsum - allFcsum).toFixed(2);
        	if(parseFloat(cantMoreSum) < parseFloat(fcsum)){
        		nui.alert("预计收款金额不能大于合同总金额！");
        		return;
        	}
        	if(contsum > 0){
        		//预计收款比例值设置
	        	nui.get("fcreverate").setValue(parseFloat(fcsum/contsum*100).toFixed(1));
	        	if(gathertype == 0){		//选择的收款类型为：产品
	        		//判断合同是否为产品类
	        		if(prodmon > 0){
	        			//服务额设置为0
	        			nui.get("servicesum").setValue(0);
	        			//产品额设置
	        			if(fcsum > 0){	//收款金额不为空
		        			nui.get("productsum").setValue(parseFloat(fcsum).toFixed(2));
	        			}else{	//收款金额为空
	        				nui.get("productsum").setValue(0);
	        			}
	        		}else{
	        			nui.alert("收款类型（产品）与合同（产品金额）信息不一致！");
	        			nui.get("productsum").setValue(0);
	        		}
	        	}else if(gathertype == 1){	//选择的收款类型为：服务
	        		//判断合同是否为服务类
	        		if(servmon > 0){
	        			//产品额设置为0
	        			nui.get("productsum").setValue(0);
	        			//服务额设置
	        			if(fcsum > 0){	//收款金额不为空
	        				nui.get("servicesum").setValue(parseFloat(fcsum).toFixed(2));
	        			}else{	//收款金额为空
		        			nui.get("servicesum").setValue(0);
	        			}
	        		}else{
	        			nui.alert("收款类型（服务）与合同（服务金额）信息不一致！");
	        			nui.get("servicesum").setValue(0);
	        		}
	        	}else if(gathertype == 2){	//选择的收款类型为：产品+服务
	        		if(prodmon > 0 && servmon > 0){
	        			//产品额设置
	        			nui.get("productsum").setValue(parseFloat(prodmon/contsum*fcsum).toFixed(2));
	        			//服务额设置
	        			nui.get("servicesum").setValue(parseFloat(servmon/contsum*fcsum).toFixed(2));
	        		}else{
	        			nui.alert("收款类型（产品+服务）与合同（产品金额、服务金额）信息不一致！");
	        		}
	        	}else{
	        		nui.get("productsum").setValue(0);
	        		nui.get("servicesum").setValue(0);
	        	}
        	}else{
        		nui.alert("合同总金额为空");
        	}
        }
		//编辑计算预计收款金额
        function calRate_edit(){
        	var gathertype = nui.get("gathertype_edit").getValue();//收入类型
        	if(gathertype==null || gathertype==""){
        		return;
        	}
        	//预计收款金额
        	var fcsum = nui.get("fcsum_edit").getValue();
        	//不能超过的金额
        	var cantMoreSum = 0;
        	//所有行的金额
        	var allFcsum = 0;
        	//选中行的金额
        	var selectRowsum = 0;
        	var allRows = grid_income.getData();
        	var selectRows = grid_income.getSelected();
        	for(var i = 0;i < allRows.length;i ++){
        		allFcsum += allRows[i].fcsum;
        	}
        	selectRowsum = selectRows.fcsum;
        	allFcsum = parseFloat(allFcsum).toFixed(2);
        	selectRowsum = parseFloat(selectRowsum).toFixed(2);
        	//不能超过的金额=合同总金额-(所有行的金额-选中行的金额)
        	cantMoreSum = parseFloat(contsum - (allFcsum - selectRowsum)).toFixed(2);
        	if(parseFloat(cantMoreSum) < parseFloat(fcsum)){
        		nui.alert("预计收款金额不能大于合同总金额！本次操作无效！");
        		nui.get("fcreverate_edit").setValue(null);
        		return;
        	}
        	//如果合同额大于0
        	if(contsum > 0){
	        	nui.get("fcreverate_edit").setValue(parseFloat(fcsum/contsum*100).toFixed(1));
	        	if(gathertype == 0){		//选择的收款类型为：产品
	        		//判断合同是否为产品类
	        		if(prodmon > 0){
	        			//服务额设置为0
	        			nui.get("servicesum_edit").setValue(0);
	        			//产品额设置
	        			if(fcsum > 0){	//收款金额不为空
		        			nui.get("productsum_edit").setValue(parseFloat(fcsum).toFixed(2));
	        			}else{	//收款金额为空
	        				nui.get("productsum_edit").setValue(0);
	        			}
	        		}else{
	        			nui.alert("收款类型（产品）与合同（产品金额）信息不一致！");
	        			nui.get("productsum_edit").setValue(0);
	        		}
	        	}else if(gathertype == 1){	//选择的收款类型为：服务
	        		//判断合同是否为服务类
	        		if(servmon > 0){
	        			//产品额设置为0
	        			nui.get("productsum_edit").setValue(0);
	        			//服务额设置
	        			if(fcsum > 0){	//收款金额不为空
	        				nui.get("servicesum_edit").setValue(parseFloat(fcsum).toFixed(2));
	        			}else{	//收款金额为空
		        			nui.get("servicesum_edit").setValue(0);
	        			}
	        		}else{
	        			nui.alert("收款类型（服务）与合同（服务金额）信息不一致！");
	        			nui.get("servicesum_edit").setValue(0);
	        		}
	        	}else if(gathertype == 2){	//选择的收款类型为：产品+服务
	        		if(prodmon > 0 && servmon > 0){
	        			//产品额设置
	        			nui.get("productsum_edit").setValue(parseFloat(prodmon/contsum*fcsum).toFixed(2));
	        			//服务额设置
	        			nui.get("servicesum_edit").setValue(parseFloat(servmon/contsum*fcsum).toFixed(2));
	        		}else{
	        			nui.alert("收款类型（产品+服务）与合同（产品金额、服务金额）信息不一致！");
	        		}
	        	}else{
	        		nui.get("productsum_edit").setValue(0);
	        		nui.get("servicesum_edit").setValue(0);
	        	}
        	}else{
        		nui.alert("合同总金额为空");
        	}
        }
		function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow();
	        else window.close();  
	    }
	    
	    //点击新增
        function add() { 
        	//编辑相关控件隐藏
          	document.getElementById("field_edit").style.display="none";
          	document.getElementById("editGatherFc").style.display="none";
          	//附件
          	document.getElementById("field6").style.display="";
          	//新增相关控件显示
          	document.getElementById("field_add").style.display="";
          	document.getElementById("addGatherFc").style.display="";
          	var contnum =nui.get("contnum").getValue();
          	//合同编号
          	nui.get("contnum1").setValue(contnum);
          	//收款状态
          	nui.get("status_add").setValue(0);
          	nui.get("billstatus_add").setValue(0);
          	//产品额
          	nui.get("productsum").setValue(0);
          	//服务额
        	nui.get("servicesum").setValue(0);
        	//收款金额
        	nui.get("fcsum").setValue(0);
        	//收款比例
        	nui.get("fcreverate").setValue(0);
	    }
	    
	    //点击编辑
	    function edit() {
	    	nui.get("yearmonth_edit").disable();
	        var rows = grid_income.getSelecteds();
	        if(rows.length==0){
				nui.alert("请选中一条记录！");
				return;
			}
	        if(rows.length>1){
				nui.alert("只能选中一条记录！");
				return;
			}
	        var row = grid_income.getSelected();
	        /* if(row.status == 2 ){
	        	alert("流程中，不能编辑！");
	        	grid_income.deselect(row);
	        	return;
	        }
	        if(row.status==3){
	        	alert("收入已确认，不能编辑！");
	        	grid_income.deselect(row);
	        	return;
	        } */
			document.getElementById("field_add").style.display="none";
			document.getElementById("field_edit").style.display="";
			document.getElementById("editGatherFc").style.display="";
          	document.getElementById("field6").style.display="";
			document.getElementById("addGatherFc").style.display="none";
			//加载预估信息
    		var json = nui.encode({csGatherFc:{gatherid:row.gatherid}}); 
        	nui.ajax({
        		url: "com.primeton.eos.ame_income.csGatherFc.getCsGatherFcDetail.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                    //加载附件设置参数
                	o.csGatherFc.fcreverate = parseFloat(o.csGatherFc.fcreverate*100).toFixed(1);
                    form_edit.setData(o);
                    //加载附件
					nui.get("grid_0").load({"groupid":"CS_GATHER_FC","relationid": o.csGatherFc.gatherid});
                    var yearmonth = o.csGatherFc.yearmonth;
                    var yearmonth2 = yearmonth.substring(0,4)+"-"+yearmonth.substring(4,6);
                    nui.get("yearmonth_edit").setValue(yearmonth2);
                    var newyearmonth = o.csGatherFc.newyearmonth;
                    var newyearmonth = newyearmonth.substring(0,4)+"-"+newyearmonth.substring(4,6);
                    nui.get("newyearmonth_edit").setValue(newyearmonth);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
        	});
	    }
    	//确定新增调用方法
		function onOkAdd() {
			//预计收款金额
        	var fcsum = nui.get("fcsum").getValue();
        	fcsum = fcsum == "" ? 0 : fcsum;
        	//预计金额产品额
        	var productsum = nui.get("productsum").getValue();
        	productsum = productsum == "" ? 0 : productsum;
        	//预计金额服务额
        	var servicesum = nui.get("servicesum").getValue();
        	servicesum = servicesum == "" ? 0 : servicesum;
        	//获取合同总金额
        	//var contsum =document.getElementById("csContract.contsum").innerHTML;
        	//获取合同产品金额
        	//var prodmon =document.getElementById("csContract.prodmon").innerHTML;
        	//获取合同服务金额
        	//var servmon =document.getElementById("csContract.servmon").innerHTML;
        	/* if(parseFloat(fcsum) < parseFloat(productsum)){
        		nui.alert("预计金额产品额不能大于预计收款金额！");
        		return;
        	}
        	if(parseFloat(fcsum) < parseFloat(servicesum)){
        		nui.alert("预计金额服务额不能大于预计收款金额！");
        		return;
        	} */
        	if(parseFloat(fcsum) != (parseFloat(productsum) + parseFloat(servicesum))){
        		nui.alert("预计收款金额不等于预计金额产品额、预计金额服务额之和");
        		return;
        	}
        	if(parseFloat(contsum) < parseFloat(fcsum)){
        		nui.alert("预计收款金额不能大于合同总金额！");
        		return;
        	}
        	if(parseFloat(prodmon) < parseFloat(productsum)){
        		nui.alert("预计金额产品额不能大于合同产品金额！");
        		return;
        	}
        	if(parseFloat(servmon) < parseFloat(servicesum)){
        		nui.alert("预计金额服务额不能大于合同服务金额！");
        		return;
        	}
			if(!form_add.validate()){
				nui.alert("表单信息填写不完整，请确认必输项是否填写！！");
				return;
			}
			document.getElementById("fileCatalog").value="CsGatherFc";
			form2.submit();
			nui.confirm("确定新增保存？","保存提示",
				function(action){
					if(action == "ok"){
						nui.get("addGatherFc").setEnabled(false);
						var fileids = nui.get("fileids").getValue();
						var data_add = form_add.getData();
						//附件ID赋值
						var yearmonth = nui.get("yearmonth").getText();
			        	data_add.csGatherFc.yearmonth = yearmonth.substring(0,4)+""+yearmonth.substring(4,6);
			        	data_add.csGatherFc.newyearmonth = data_add.csGatherFc.yearmonth;
			        	var fcreverate = nui.get("fcreverate").getValue();
			        	fcreverate = fcreverate == "" ? 0 : fcreverate;
			        	data_add.csGatherFc.fcreverate = Math.round(fcreverate*100)/10000;
				        //合同ID
				        var contractid = nui.get("contractid").getValue();
				        data_add.csGatherFc.contractid = contractid;
				        //合同名称
				        var projectname = document.getElementById("csContract.projectname").innerHTML;
				        data_add.csGatherFc.projectname = projectname;
				        data_add.csGatherFc.maconfirmday = data_add.csGatherFc.maconfirmday==null ||data_add.csGatherFc.maconfirmday==''?data_add.csGatherFc.confirmday:data_add.csGatherFc.maconfirmday; 
				        var json = {csGatherFc: data_add.csGatherFc,fileids:fileids};
						nui.ajax({
				            url: "com.primeton.eos.ame_income.csGatherFc.addCsGatherFc.biz.ext",
				            data: json,
				            type: 'POST',
				            cache: false,
				            contentType: 'text/json',
				            success: function (text) {
				            	if(text.csGatherFc.exception == null){
					            	nui.alert("保存成功！");
					            	var contnum = nui.get("contnum").getValue();
						            var incomedata = {contnum: contnum};
						            grid_income.load(incomedata);
						            form_add.reset();
						            document.getElementById("field_add").style.display="none";
				            		document.getElementById("addGatherFc").style.display="none";
          							document.getElementById("field6").style.display="none";
          							form2.reset();
				            	}else{
				            		nui.alert("保存失败！");
				            	}
				            	nui.get("addGatherFc").setEnabled(true);
				            },
				            error: function (jqXHR, textStatus, errorThrown) {
				                alert(jqXHR.responseText);
				            }
				        });
					}
				}	
			);
	    }
	    
	    function SaveData(){
	    }
    	//确定编辑调用方法
	    function onOkEdit(){
	    	//获取合同总金额
        	//var contsum =document.getElementById("csContract.contsum").innerHTML;
        	//获取合同产品金额
        	//var prodmon =document.getElementById("csContract.prodmon").innerHTML;
        	//获取合同服务金额
        	//var servmon =document.getElementById("csContract.servmon").innerHTML;
	    	//预计收款金额
	    	var fcsum_edit = nui.get("fcsum_edit").getValue();
	    	fcsum_edit = fcsum_edit == "" ? 0 : fcsum_edit;
	    	//预计金额产品额
	    	var productsum_edit = nui.get("productsum_edit").getValue();
	    	productsum_edit = productsum_edit == "" ? 0 : productsum_edit;
	    	//预计金额服务额
	    	var servicesum_edit = nui.get("servicesum_edit").getValue();
	    	servicesum_edit = servicesum_edit == "" ? 0 : servicesum_edit;
	    	/* if(parseFloat(fcsum_edit) < parseFloat(productsum_edit)){
        		nui.alert("预计金额产品额不能大于预计收款金额！");
        		return;
        	}
        	if(parseFloat(fcsum_edit) < parseFloat(servicesum_edit)){
        		nui.alert("预计金额服务额不能大于预计收款金额！");
        		return;
        	} */
        	if(parseFloat(fcsum_edit) != (parseFloat(productsum_edit) + parseFloat(servicesum_edit))){
        		nui.alert("预计收款金额不等于预计金额产品额、预计金额服务额之和");
        		return;
        	}
        	if(parseFloat(contsum) < parseFloat(fcsum_edit)){
        		nui.alert("预计收款金额不能大于合同总金额！");
        		return;
        	}
        	if(parseFloat(prodmon) < parseFloat(productsum_edit)){
        		nui.alert("预计金额产品额不能大于合同产品金额！");
        		return;
        	}
        	if(parseFloat(servmon) < parseFloat(servicesum_edit)){
        		nui.alert("预计金额服务额不能大于合同服务金额！");
        		return;
        	}
        	if(parseFloat(fcsum_edit) < (parseFloat(productsum_edit) + parseFloat(servicesum_edit))){
        		nui.alert("预计金额产品额加预计金额服务额不能大于预计收款金额！");
        		return;
        	}
	    	if(!form_edit.validate()){
				nui.alert("表单信息填写不完整，请确认必输项是否填写！！");
				return;
			}
			document.getElementById("fileCatalog").value="CsGatherFc";
			form2.submit();
			nui.confirm("确定编辑保存？","保存提示",
				function(action){
					if(action == "ok"){
						nui.get("editGatherFc").setEnabled(false);
						var data_edit = form_edit.getData();
						var fileids = nui.get("fileids").getValue();
						var yearmonth = nui.get("yearmonth_edit").getText();
			        	//data_edit.csGatherFc.yearmonth = yearmonth.substring(0,4)+""+yearmonth.substring(4,6);
			        	data_edit.csGatherFc.yearmonth = yearmonth;
			        	var newyearmonth = nui.get("newyearmonth_edit").getText();
			        	data_edit.csGatherFc.newyearmonth = newyearmonth;
			        	var fcreverate = nui.get("fcreverate_edit").getValue();
			        	fcreverate = fcreverate == "" ? 0 : fcreverate;
			        	data_edit.csGatherFc.fcreverate = Math.round(fcreverate*100)/10000;
				        //合同ID
				        var contractid = nui.get("contractid").getValue();
				        data_edit.csGatherFc.contractid = contractid;
				        //合同名称
				        var projectname = document.getElementById("csContract.projectname").innerHTML;
				        data_edit.csGatherFc.projectname = projectname;
				        data_edit.csGatherFc.maconfirmday = data_edit.csGatherFc.maconfirmday==null ||data_edit.csGatherFc.maconfirmday==''?data_edit.csGatherFc.confirmday:data_edit.csGatherFc.maconfirmday;
				        var json = {csGatherFc: data_edit.csGatherFc,fileids:fileids};
						nui.ajax({
				            url: "com.primeton.eos.ame_income.csGatherFc.updateCsGatherFcByOne.biz.ext",
				            data: json,
				            type: 'POST',
				            cache: false,
				            contentType: 'text/json',
				            success: function (text) {
				            	if(text.csGatherFc.exception == null){
					            	nui.alert("保存成功！");
					            	var contnum = nui.get("contnum").getValue();
						            var incomedata = {contnum: contnum};
						            grid_income.load(incomedata);
						            /* form_add.reset();
						            document.getElementById("field_add").style.display="none";
				            		document.getElementById("addGatherFc").style.display="none"; */
						            form_edit.reset();
						            document.getElementById("field_edit").style.display="none";
				            		document.getElementById("editGatherFc").style.display="none";
          							document.getElementById("field6").style.display="none";
          							form2.reset();
				            	}else{
				            		nui.alert("保存失败！");
				            	}
				            	nui.get("editGatherFc").setEnabled(true);
				            },
				            error: function (jqXHR, textStatus, errorThrown) {
				                alert(jqXHR.responseText);
				            }
				        });
					}
				}	
			);
	    }
	    
	    function removeCsGatherFc() {
		    var rows = grid_income.getSelecteds();   //获取所有选中的行对象
		    var data = {csGatherFcs: rows};
		    var json = nui.encode(data);     //序列化成json字符串
			if (rows.length> 0) {
				nui.confirm("确定删除选中记录？","删除提示",function(action){
					if(action == "ok"){
						//nui.get("removeCsGather").setEnabled(false);
		                nui.ajax({
			                url: "com.primeton.eos.ame_income.csGatherFc.deletecsGatherFc.biz.ext",
			                type: "post",
			                data: json, 
			                cache: false,
			                contentType: 'text/json',
			                success: function (text) {
			                	if(text.exception == null){
				                	nui.alert("删除成功！");
				                	grid_income.reload();
				                	form_edit.reset();
						            document.getElementById("field_edit").style.display="none";
				            		document.getElementById("editGatherFc").style.display="none";
			                	}else{
			                		nui.alert("删除失败！");
			                	}
			                	nui.get("removeCsGather").setEnabled(true);
			                },
			                error: function () {
		                    }
						});
					}
				});
            } else {
                alert("请至少选中一条记录");
            }
        }
        //合同编号加链接
        function doView(){
			var contractid =nui.get("contractid").getValue();
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
		}
		function doCountSum(e){        	
            if (e.field == "fcsum") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
           	if (e.field == "fcsum2") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "fcreverate") {
            	if(!isNaN(e.cellHtml)){
	                e.cellHtml = "<div align='right'><b>" + parseFloat(e.cellHtml * 100).toFixed(1) + " %" + "</b></div>";
            	}else{
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            	}
            }
        }
        function getDetail(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
        }
        function checkDetail(){
	 		var selectRow = grid_income.getSelected();
			var executeUrl = "/default/ame_income/csGatherFc/detailCsGatherFc.jsp?id=" + selectRow.gatherid;
		    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
			window.open(executeUrl, "合同收入记录详细信息","height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes" );
	    }
	    
	    
	    //实际金额产品额（含税）
	    function bluractproductsumedit(){
	    	//收款类型
	    	var gathertype_edit = nui.get("gathertype_edit").getValue();
	    	if(gathertype_edit == "1"){
	    		nui.alert("收款类型为服务！不能有产品额！");
	    		nui.get("actproductsum_edit").setValue(0);
	    		return;
	    	}
	    	//实际金额产品额含税
	    	var actproductsum_edit = nui.get("actproductsum_edit").getValue();
	    	//产品税率
	    	var productRate_edit = nui.get("productRate_edit").getValue();
	    	//实际金额产品额不含税
	    	var actproductsum2_edit = nui.get("actproductsum2_edit").getValue();
	    	if(actproductsum_edit){
		    	if(productRate_edit){
		    		actproductsum_edit = parseFloat(actproductsum_edit);
		    		productRate_edit = parseFloat(productRate_edit);
		    		nui.get("actproductsum2_edit").setValue(parseFloat(actproductsum_edit/(1+productRate_edit)).toFixed(2));
		    	}else{
		    		nui.get("actproductsum2_edit").setValue(0);
		    	}
	    	}else{
	    		nui.get("actproductsum2_edit").setValue(0);
	    	}
	    }
	    
	    //实际金额服务额（含税）
	    function bluractservicesumedit(){
	    	//收款类型
	    	var gathertype_edit = nui.get("gathertype_edit").getValue();
	    	if(gathertype_edit == "0"){
	    		nui.alert("收款类型为产品！不能有产品额！");
	    		nui.get("actservicesum_edit").setValue(0);
	    		return;
	    	}
	    	//实际金额服务额含税
	    	var actservicesum_edit = nui.get("actservicesum_edit").getValue();
	    	//服务税率
	    	var serviceRate_edit = nui.get("serviceRate_edit").getValue();
	    	//实际金额服务额不含税
	    	var actservicesum2_edit = nui.get("actservicesum2_edit").getValue();
	    	if(actservicesum_edit){
		    	if(serviceRate_edit){
		    		actservicesum_edit = parseFloat(actservicesum_edit);
		    		serviceRate_edit = parseFloat(serviceRate_edit);
		    		nui.get("actservicesum2_edit").setValue(parseFloat(actservicesum_edit/(1+serviceRate_edit)).toFixed(2));
		    	}else{
		    		nui.get("actservicesum2_edit").setValue(0);
		    	}
	    	}else{
	    		nui.get("actservicesum2_edit").setValue(0);
	    	}
	    }
	    
	    //金额千分位
	    function toThousands(num) {
			var num = (num || 0).toString(), result = '';
			if(num){
				if(num != 0){
					var s = num.substring(0,1);
					if(s=="-"){
						var num3 = num.split("-");
						var num4 = num3[1];
						var num2 = num4.split(".");
						num = num2[0];
						while (num.length > 3) {
							result = ',' + num.slice(-3) + result;
							num = num.slice(0, num.length - 3);
						}
						if (num) { 
							if(num2[1]){
								result = "-"+num + result + "." + num2[1]; 
							}else{
								result = "-"+num + result; 
							}
						}
					}else{
						var num2 = num.split(".");
						num = num2[0];
						while (num.length > 3) {
							result = ',' + num.slice(-3) + result;
							num = num.slice(0, num.length - 3);
						}
						if (num) { 
							if(num2[1]){
								result = num + result + "." + num2[1]; 
							}else{
								result = num + result; 
							}
						}
					}
				}else{
					result = 0;
				}
			}else{
				result = 0;
			}
			return result;
		}
		
    </script>
</body>
</html>
