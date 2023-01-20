<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>新增/编辑合同收入信息</title>
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
		<div style="padding:5px;">
			<table style="table-layout:fixed;" id="table_file">
				<tr>
                    <td style="width:100px;" align="right">合同存档编号：</td>
                    <td style="width:150px;" id="csContract.contnum"></td>
                    <td style="width:100px;" align="right">合同名称：</td>
                    <td style="width:250px;" id="csContract.projectname"></td>
	                <td style="width:100px;" align="right">合同签署日期：</td>
	                <td style="width:100px;" id="csContract.signdate"></td>
                </tr>
                <tr>
                    <td style="width:100px;" align="right">签署单位：</td>
                    <td style="width:150px;" id="csContract.misCustinfo.custname"></td>
                    <td style="width:100px;" align="right">最终用户：</td>
                    <td style="width:250px;" id="csContract.username"></td>
                    <td style="width:100px;" align="right">受益销售：</td>
                    <td style="width:100px;" id="csContract.salename"></td>
                </tr>
                <tr>
                    <td style="width:100px;" align="right">服务金额：</td>
                    <td style="width:150px;"id="csContract.servmon"></td>
                    <td style="width:100px;" align="right">产品金额：</td>
                    <td style="width:150px;"id="csContract.prodmon"></td>
                    <td style="width:100px;" align="right">维保金额：</td>
                    <td style="width:150px;"id="csContract.masum"></td>
                </tr>
                <tr>
                    <td style="width:100px;" align="right">合同总金额：</td>
                    <td style="width:150px;"id="csContract.contsum"></td>
                </tr>
			</table>
		</div>
		</form>
	</fieldset>
	 <fieldset style="border:solid 1px #aaa;padding:3px;">
        <legend>合同收入记录列表</legend>
        <div class="nui-toolbar">
            <a class="mini-button" iconCls="icon-add" id="addCsReve" onclick="add()" >增加</a>
            <a class="mini-button" iconCls="icon-edit" id="editCsReve" onclick="edit()">编辑</a>  
            <a class="mini-button" iconCls="icon-remove" id="delCsReve" onclick="removeReve()">删除</a>
            <a class="mini-button" iconCls="icon-goto" id="delCsReve" onclick="creatReveCostProcess()">发起已确认收入成本确认处理流程</a>
        </div>          
    	<div id="grid_income" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="csReveForecasts" showSummaryRow="true" ondrawsummarycell="doCountSum"
	 		url="com.primeton.eos.ame_income.csReveForecast.queryIncome.biz.ext" allowCellSelect="true"  showPager="false" idField="appid" multiSelect="true">
			<div property="columns">
				<div type="checkcolumn" width="25"></div>
				<div field="contnum" width="0">合同编号</div>
				<div field="reveno" width="65" align="center"  headerAlign="center" allowSort="true" renderer="getDetail">收入确认次数</div>
				<div field="revetype" width="80" align="center"  headerAlign="center" renderer="dictReveType">收入类型</div>
				<div field="newyearmonth" width="75" align="center"  headerAlign="center">预计确认年月</div>
				<div field="newmonthperiod" width="70" align="center"  headerAlign="center" renderer="dictmonth">预计确认旬度</div>
				<div field="changetimes" width="70" align="center"  headerAlign="center">变更次数</div>
				<div field="fcsum" width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >本次确认金额</div>	
				<div field="actsum2" width="90" align="right" headerAlign="center" dataType="currency" summaryType="sum" >不含税金额</div>	
				<div field="fcreverate" width="60" align="center" headerAlign="center" numberFormat="p1" summaryType="sum">本次确认比例</div>	
				<div field="revetimedesc" width="70" align="center" headerAlign="center" >收入确认时点</div>		
				<div field="actreveproof" width="100" align="center" headerAlign="center" renderer="dictproof">收入确认证据</div>		
				<div field="maconfirmday" width="65" align="center"  headerAlign="center">实际确认日期</div>
				<div field="status" width="70" align="center" headerAlign="center" renderer="dictstatus">目前确认状态</div>		
			</div>
		</div>
    </fieldset>
    <fieldset id="field_add" style="border:solid 1px #aaa;padding:3px;">
		<legend>新增合同收入记录</legend>
		<form id="form_add" method="post">
			<input name="csReveForecast.contnum" id="contnum1" class="nui-hidden"/>
			<table style="table-layout:fixed;" id="table_file">
				<tr>
					<td align="right" style="width:100px">收入确认次数：</td>
					<td style="width:165px"><input name="csReveForecast.reveno" id="reveno" required="true" class="nui-textbox" style="width:120px" /></td>
					<td align="right" style="width:150px">预计确认年月：</td>
					<td style="width:185px"><input name="csReveForecast.yearmonth" id="yearmonth1" required="true" class="nui-monthpicker" format="yyyyMM" style="width:120px" allowInput="false"/></td>
					<td align="right" style="width:100px">预计确认旬度：</td>
					<td style="width:185px"><input name="csReveForecast.monthperiod" id="monthperiod1" class="nui-dictcombobox" dictTypeId="AME_MONTHPERIOD" style="width:100px"/></td>
				</tr>	
				<tr>
					<td align="right" style="width:100px">合同订单编号：</td>
					<td style="width:160px"><input name="csReveForecast.contorderno" id="contorderno1" class="nui-combobox" style="width:150px" valueField="contorderno" textField="contorderno"/></td>
					<td align="right" style="width:150px">预计收入确认证据：</td>
					<td style="width:165px"><input name="csReveForecast.reveproof" id="reveproof" class="nui-dictcombobox" dictTypeId="MIS_INCOMECONV" multiSelect="true" style="width:160px" /></td>
				</tr>
				<tr>
					<td align="right" style="width:100px">预计金额产品额：</td>
					<td style="width:130px"><input name="csReveForecast.productsum" id="productsum" style="width:120px" onblur="calMoney" class="nui-spinner" changeOnMousewheel="false" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
					<td align="right" style="width:150px">预计金额服务额：</td>
					<td style="width:130px"><input name="csReveForecast.servicesum" id="servicesum" style="width:120px" onblur="calMoney" class="nui-spinner" changeOnMousewheel="false" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
					<td align="right" style="width:100px">预计金额MA额：</td>
					<td style="width:130px"><input name="csReveForecast.masum" id="masum" style="width:120px" onblur="calMoney" class="nui-spinner" changeOnMousewheel="false" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
				</tr>
				<tr>
					<td align="right" style="width:150px">预计确认金额：</td>
					<td style="width:130px"><input name="csReveForecast.fcsum" id="fcsum1" style="width:120px" class="nui-spinner" changeOnMousewheel="false" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
					<td align="right" style="width:150px">本次确认比例：</td>
					<td style="width:150px"><input name="csReveForecast.fcreverate" id="fcreverate1" style="width:110px" align="right" class="nui-spinner" changeOnMousewheel="false" showbutton="false" inputStyle="text-align:right;" format="p0"/></td>
					<td style="width:100px" align="right">是否业务发起：</td> 
					<td style="width:160px"><input name="csReveForecast.saleseva" id="saleseva" class="nui-dictcombobox" dictTypeId="MIS_YN" style="width:100px" required="true" /></td>
				</tr>
				<tr>
					<td align="right" style="width:100px">收入类型：</td>
					<td style="width:160px"><input name="csReveForecast.revetype" id="revetype" class="nui-dictcombobox" onvaluechanged="changeisrevetype(e)" dictTypeId="AME_REVETYPE" style="width:150px" required="true" multiSelect="true" /></td>
					<td align="right" style="width:150px">收入确认状态：</td>
					<td><input name="csReveForecast.status" id="status_add" class="nui-dictcombobox" dictTypeId="AME_REVESTATUS" style="width:150px" /></td>
					<td  align="right" style="width:150px">新合同收入类型</td>
					<td><input name="csReveForecast.newtype" id="newtype" class="nui-dictcombobox" dictTypeId="AME_NEWTYPE" style="width:160px"  multiSelect="true" /></td>
				</tr>
				<tr id="setyearmonth" style="display: none;">
					<td align="right" style="width:100px">本次结算开始年月：</td>
					<td style="width:160px"><input name="csReveForecast.setstart" id="setstart" class="nui-monthpicker" format="yyyyMM" style="width:150px" allowInput="false"/></td>
					<td align="right" style="width:100px">本次结算结束年月：</td>
					<td style="width:160px"><input name="csReveForecast.setend" id="setend" class="nui-monthpicker" format="yyyyMM" style="width:150px" allowInput="false"/></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td align="right" style="width:100px">收入确认时点：</td>
					<td colspan="5"><input name="csReveForecast.revetimedesc" id="revetimedesc" class="nui-textarea" style="width:100%" /></td>
				</tr>
				<tr>
					<td align="right" style="width:100px">说明：</td>
					<td colspan="5"><input name="csReveForecast.memo" id="memo" class="nui-textarea" style="width:100%"/></td>
				</tr>
			</table>
		</form>
	</fieldset>
	<fieldset id="field_edit" style="border:solid 1px #aaa;padding:3px;">
		<legend>编辑合同收入记录</legend>
		<form id="form_edit" method="post">
			<input name="csReveForecast.reveid" id="reveid" class="nui-hidden" />
			<input name="csReveForecast.contnum" id="contnum2" class="nui-hidden" />
			<input name="csReveForecast.fileids" id="fileids"  class="nui-hidden"/>
<!-- 			<input name="csReveForecast.changetimes" id="changetimes" class="nui-hidden"/> -->
			<table style="table-layout:fixed;" id="table_file">
				<tr>
					<td align="right" style="width:160px">收入确认次数：</td>
					<td style="width:160px"><input name="csReveForecast.reveno" id="reveno" class="nui-textbox" style="width:100px"/></td>
					<td align="right" style="width:160px">最初预计确认年月：</td>
					<td style="width:120px"><input name="csReveForecast.yearmonth" id="yearmonth2" class="nui-monthpicker" format="yyyyMM" style="width:120px" allowInput="false"/></td>
					<td align="right" style="width:160px">最初预计确认旬度：</td>
					<td style="width:150px"><input name="csReveForecast.monthperiod" id="monthperiod2" class="nui-dictcombobox" dictTypeId="AME_MONTHPERIOD" style="width:100px"/></td>
				</tr>
				<tr>
					<td align="right" style="width:160px">目前确认状态：</td>
					<td><input name="csReveForecast.status" id="status" class="nui-dictcombobox" dictTypeId="AME_REVESTATUS" style="width:160px" /></td>
					<td align="right" style="width:160px">最新预计确认年月：</td>
					<td style="width:120px"><input name="csReveForecast.newyearmonth" id="newyearmonth" class="nui-monthpicker" format="yyyyMM" style="width:100px" allowInput="false"/></td>
					<td align="right" style="width:160px">最新预计确认旬度：</td>
					<td><input name="csReveForecast.newmonthperiod" id="newmonthperiod" class="nui-dictcombobox" dictTypeId="AME_MONTHPERIOD" style="width:100px"/></td>
				</tr>
				<tr>
					<td align="right" style="width:160px">收入确认证据：</td>
					<td><input name="csReveForecast.reveproof" id="reveproof" class="nui-dictcombobox"  dictTypeId="MIS_INCOMECONV" style="width:160px" multiSelect="true"/></td>
					<td align="right" style="width:160px">实际收入确认证据：</td>
					<td><input name="csReveForecast.actreveproof" id="actreveproof" class="nui-dictcombobox"  dictTypeId="MIS_INCOMECONV" style="width:160px" multiSelect="true"/></td>
					<td align="right" style="width:160px">实际确认日期：</td>
					<td style="width:120px"><input name="csReveForecast.maconfirmday" id="maconfirmday" class="nui-datepicker"  style="width:100px"/></td>
				</tr>
				<tr>
					<td align="right" style="width:160px">收入类型：</td>
					<td style="width:200px"><input name="csReveForecast.revetype" id="revetype2" class="nui-dictcombobox" onvaluechanged="changeisrevetype1(e)" dictTypeId="AME_REVETYPE" required="true" style="width:150px" multiSelect="true" /></td>
					<td align="right" style="width:160px">本次确认比例：</td>
					<td style="width:150px"><input name="csReveForecast.fcreverate" id="fcreverate2" style="width:150px" class="nui-spinner" changeOnMousewheel="false" showbutton="false" inputStyle="text-align:right;" format="p0"/></td>
					<td align="right" style="width:160px">实际应收开始日期：</td>
					<td style="width:120px"><input name="csReveForecast.maconfirmdayStart" id="maconfirmdayStart" class="nui-datepicker"  style="width:100px"/></td>
				</tr>
				<tr>
					<td align="right" style="width:160px">合同订单编号：</td>
					<td style="width:160px"><input name="csReveForecast.contorderno" id="contorderno2" class="nui-combobox" style="width:150px" multiSelect="true" valueField="contorderno" textField="contorderno" required="true"/></td>
					<td style="width:160px" align="right">是否销售评估：</td> 
					<td style="width:160px"><input name="csReveForecast.saleseva" id="saleseva" class="nui-dictcombobox" dictTypeId="MIS_YN" style="width:100px" required="true" /></td>
					<td  align="right" style="width:150px">新合同收入类型</td>
					<td><input name="csReveForecast.newtype" id="newtype2" class="nui-dictcombobox" dictTypeId="AME_NEWTYPE" style="width:160px"  multiSelect="true" /></td>
				</tr>
				<tr id="setyearmonth1" style="display: none;">
					<td align="right" style="width:100px">本次结算开始年月：</td>
					<td style="width:160px"><input name="csReveForecast.setstart" id="setstart1" class="nui-monthpicker" format="yyyyMM" style="width:150px" allowInput="false"/></td>
					<td align="right" style="width:100px">本次结算结束年月：</td>
					<td style="width:160px"><input name="csReveForecast.setend" id="setend1" class="nui-monthpicker" format="yyyyMM" style="width:150px" allowInput="false"/></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td align="right" style="width:160px">收入确认时点：</td>
					<td colspan="5"><input name="csReveForecast.revetimedesc" id="revetimedesc" class="nui-textarea" style="width: 100%"/></td>
				</tr>
			</table>
			<fieldset id="field_edit" style="border:solid 1px #aaa;padding:3px; width:950px">
				<legend>合同金额</legend>
					<table style="table-layout:fixed;">
						<tr>
							<td style="width:160px"></td>
							<td align="left" style="width:170px">预计确认金额</td>
							<td align="left" style="width:170px">实际确认金额（含税）</td>
							<td align="left" style="width:170px">税率</td>
							<td align="left" style="width:170px">实际确认金额（不含税）</td>
						</tr>
						<tr>
							<td align="right" style="width:160px">预计金额产品额：</td>
							<td style="width:185px"><input name="csReveForecast.productsum" id="productsum2" onblur="calMoney2" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
							<td><input name="csReveForecast.actproductsum" id="actproductsum" style="width:120px" onblur="calMoney3" class="nui-spinner" changeOnMousewheel="false"  onvaluechanged="onvaluechanged(e)" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
							<td><input name="csReveForecast.productrate" id="productrate" style="width:120px" class="nui-spinner" changeOnMousewheel="false"  onvaluechanged="onvaluechanged(e)" showbutton="false" inputStyle="text-align:right;" format="p2"/></td>
							<td><input name="csReveForecast.actproductsum2" id="actproductsum2" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
						</tr>
						<tr>
							<td align="right" style="width:160px">预计金额服务额：</td>
							<td style="width:120px"><input name="csReveForecast.servicesum" id="servicesum2" onblur="calMoney2" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
							<td><input name="csReveForecast.actservicesum" id="actservicesum"  onblur="calMoney3" style="width:120px" class="nui-spinner" changeOnMousewheel="false" onvaluechanged="onvaluechanged(e)" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
							<td><input name="csReveForecast.servicerate" id="servicerate" style="width:120px" class="nui-spinner" changeOnMousewheel="false" showbutton="false"  onvaluechanged="onvaluechanged(e)" inputStyle="text-align:right;" format="p0"/></td>
							<td><input name="csReveForecast.actservicesum2" id="actservicesum2" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
						</tr>
						<tr>
							<td align="right" style="width:160px">预计金额MA额：</td>
							<td style="width:200px"><input name="csReveForecast.masum" id="masum2" onblur="calMoney2" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
							<td><input name="csReveForecast.actmasum" id="actmasum" style="width:120px"onblur="calMoney3"  class="nui-spinner" changeOnMousewheel="false" onvaluechanged="onvaluechanged(e)" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
							<td><input name="csReveForecast.marate" id="marate" style="width:120px"  class="nui-spinner" changeOnMousewheel="false" showbutton="false" onvaluechanged="onvaluechanged(e)" inputStyle="text-align:right;" format="p0"/></td>
							<td><input name="csReveForecast.actmasum2" id="actmasum2" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
						</tr>
						<tr>
							<td align="right" style="width:160px">预计确认金额：</td>
							<td style="width:125px"><input name="csReveForecast.fcsum" id="fcsum2" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
							<td><input name="csReveForecast.actsum" id="actsum" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
							<td></td>
							<td><input name="csReveForecast.actsum2" id="actsum2" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
						</tr>
					</table>
			</fieldset>
			<table style="table-layout:fixed;">
				<tr>
					<td align="right" style="width:130px">说明：</td>
					<td colspan="5"><input name="csReveForecast.memo" id="memo" class="nui-textarea" height="100px" style="width:900px"/></td>
				</tr>
			</table>
		</form>
		<jsp:include page="/ame_common/inputFile.jsp"/>
	</fieldset>
</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOkAdd()" id="addReveFore" style="width:90px;margin-right:20px;">确定增加</a>
		<a class="nui-button" onclick="onOkEdit()" id="editReveFore" style="width:90px;margin-right:20px;">确定编辑</a>
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
  		document.getElementById("addReveFore").style.display="none";
  		document.getElementById("editReveFore").style.display="none";
  		var contsum = "";
	  	//进页面调用方法
      	function SetData(data){
      		nui.get("yearmonth2").disable();
      		nui.get("monthperiod2").disable();
      		data = nui.clone(data);
      		var json = {csContract:{contractid:data.contractid}};
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
	                document.getElementById("csContract.misCustinfo.custname").innerHTML = o.csContract.misCustinfo == null ?"":o.csContract.misCustinfo.custname;
	                document.getElementById("csContract.username").innerHTML = o.csContract.username == null ?"":o.csContract.username;
	                document.getElementById("csContract.contsum").innerHTML = o.csContract.contsum== null ?"":o.csContract.contsum;
	                document.getElementById("csContract.salename").innerHTML = o.csContract.salename== null ?"":o.csContract.salename;
	                document.getElementById("csContract.servmon").innerHTML = o.csContract.servmon== null ?"":o.csContract.servmon;
	                document.getElementById("csContract.prodmon").innerHTML = o.csContract.prodmon== null ?"":o.csContract.prodmon;
	                document.getElementById("csContract.masum").innerHTML = o.csContract.masum== null ?"":o.csContract.masum;
	                contsum = o.csContract.contsum;
	                
	                grid_income.load({contnum:o.csContract.contnum});
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
	        });
      	
      	}
	  	function dictproof(e) {
			return nui.getDictText('MIS_INCOMECONV',e.value);//设置业务字典值
		}
	  	function dictstatus(e) {
	  		if(e.record.processinstid){//有流程实例id
				if(e.value == "2"||e.value == "3"){
					return "<a href='javascript:void(0)' onclick='checkDictstatus();' title='点击查看流程图'>" + nui.getDictText('AME_REVESTATUS',e.value) + "</a>";
				}else{
					return nui.getDictText('AME_REVESTATUS',e.value);//设置业务字典值
				}
	  		}else{//没有流程实例id
				return nui.getDictText('AME_REVESTATUS',e.value);//设置业务字典值
			}
		}
		function checkDictstatus(e){
			var selectRow = grid_income.getSelected();
			var processInstID = selectRow.processinstid;
    		var url = "/default/bps/wfclient/task/processinstView.jsp";
    		var title = "流程图查看";
    		var width=1000;
		    nui.open({
				url: url,
				title: title,
				width: width,
				height: 550,
				onload: function () {
					var iframe = this.getIFrameEl();
					if(iframe.contentWindow.initData) {
						iframe.contentWindow.initData({"processInstID": processInstID});
					}
				},
				ondestroy: function (action){
				}
			});
		}
		
		//判断收入类型是否包含人力服务收入
		function changeisrevetype(e){
			revetype = nui.get("revetype").getValue();
			if(revetype.indexOf('5') >= 0){
				document.getElementById("setyearmonth").style.display="";
			}else{
				document.getElementById("setyearmonth").style.display="none";
				nui.get("setstart").setValue("");
				nui.get("setend").setValue("");
			}
		}
		function changeisrevetype1(e){
			revetype = nui.get("revetype2").getValue();
			if(revetype.indexOf('5') >= 0){
				document.getElementById("setyearmonth1").style.display="";
			}else{
				document.getElementById("setyearmonth1").style.display="none";
				nui.get("setstart1").setValue("");
				nui.get("setend1").setValue("");
			}
		}
		
		function onvaluechanged(e){
			var actproductsum = nui.get("actproductsum").getValue();
	    	var productrate = nui.get("productrate").getValue();
	    	var actservicesum = nui.get("actservicesum").getValue();
	    	var servicerate = nui.get("servicerate").getValue();
	    	var actmasum = nui.get("actmasum").getValue();
	    	var marate = nui.get("marate").getValue();
	    	var actproductsum2 = parseFloat(actproductsum/(1+parseFloat(productrate))).toFixed(2);
	    	var actservicesum2 = parseFloat(actservicesum/(1+parseFloat(servicerate))).toFixed(2);
	    	var actmasum2 = parseFloat(actmasum/(1+parseFloat(marate))).toFixed(2);
	    	nui.get("actproductsum2").setValue(actproductsum2);
	    	nui.get("actservicesum2").setValue(actservicesum2);
	    	nui.get("actmasum2").setValue(actmasum2);
	    	nui.get("actsum2").setValue(Number(actproductsum2) + Number(actservicesum2) + Number(actmasum2));
		}
		
		function renderrate(e) {
			return parseFloat(e.value*100).toFixed(1)+"%";
        }
        function dictmonth(e) {
			return nui.getDictText('AME_MONTHPERIOD',e.value);//设置业务字典值
		}
		function dictReveType(e) {
            return nui.getDictText('AME_REVETYPE',e.value);
        }
		
		//新增计算money
        function calMoney(){
        	//新增的预计确认金额
        	var productsum = nui.get("productsum").getValue();
        	var servicesum = nui.get("servicesum").getValue();
        	var masum = nui.get("masum").getValue();
        	nui.get("fcsum1").setValue(productsum+servicesum+masum);
        	nui.get("fcreverate1").setValue((productsum+servicesum+masum)/contsum);
        }
		//编辑预计确认金额
        function calMoney2(){
        	var productsum2 = nui.get("productsum2").getValue();
        	var servicesum2 = nui.get("servicesum2").getValue();
        	var masum2 = nui.get("masum2").getValue();
        	nui.get("fcsum2").setValue(productsum2+servicesum2+masum2);
        	nui.get("fcreverate2").setValue((productsum2+servicesum2+masum2)/contsum);
        }
        //实际确认金额（含税）
        function calMoney3(){
        	var actproductsum = nui.get("actproductsum").getValue();
        	var actservicesum = nui.get("actservicesum").getValue();
        	var actmasum = nui.get("actmasum").getValue();
        	nui.get("actsum").setValue(actproductsum+actservicesum+actmasum);
        	
        	var productRate = nui.get("productrate").getValue();
        	var serviceRate = nui.get("servicerate").getValue();
        	var maRate = nui.get("marate").getValue();
        	
        	nui.get("actproductsum2").setValue(actproductsum/(1+productRate));
        	nui.get("actservicesum2").setValue(actservicesum/(1+serviceRate));
        	nui.get("actmasum2").setValue(actmasum/(1+maRate));
	      	nui.get("actsum2").setValue(actproductsum/(1+productRate)+actservicesum/(1+serviceRate)+actmasum/(1+maRate));
        }
		function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow();
	        else window.close();  
	    }
        function add() { 
          	document.getElementById("field_edit").style.display="none";
          	document.getElementById("field_add").style.display="";
          	document.getElementById("addReveFore").style.display="";
          	document.getElementById("editReveFore").style.display="none";
          	var contnum =nui.get("contnum").getValue();
          	nui.get("contnum1").setValue(contnum);
          	var status_add = nui.get("status_add").getValue();
          	if(!status_add){
	          	nui.get("status_add").setValue(0);
          	}
          	//获取所有订单编号
          	var contractid = nui.get("contractid").getValue();
          	var json = nui.encode({contractid: contractid});
          	nui.ajax({
        		url: "com.primeton.eos.ame_income.csReveForecast.getOrderno.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                    nui.get("contorderno1").setData(o.csContOrder);
                    nui.get("contorderno1").setValue(o.csContOrder[0].contorderno);//shownulllitem
                	nui.get("contorderno1").setText(o.csContOrder[0].contorderno);//shownulllitem
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
        	});
	    }
	    function edit() {
	        var rows = grid_income.getSelecteds();
	        if(rows.length==0){
				alert("请选中一条记录！");
				return;
			}
	        if(rows.length>1){
				alert("只能选中一条记录！");
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
			document.getElementById("editReveFore").style.display="";
			document.getElementById("addReveFore").style.display="none";
			//加载预估信息
    		var json = nui.encode({csReveForecast:{reveid:row.reveid}}); 
        	nui.ajax({
        		url: "com.primeton.eos.ame_income.csReveForecast.getCsReveForecastDetail.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                    //加载附件设置参数
                    form_edit.setData(o);
                    //新增yearmonth1 monthperiod1 编辑yearmonth2 monthperiod2 newyearmonth newmonthperiod
                    var yearmonth = o.csReveForecast.yearmonth;
                    var yearmonth2 = yearmonth.substring(0,4)+"-"+yearmonth.substring(4,6);
                    /* nui.get("productRate").setValue(o.csReveForecast.productrate);
                    nui.get("serviceRate").setValue(o.csReveForecast.servicerate);
                    nui.get("maRate").setValue(o.csReveForecast.marate);*/    
                 	nui.get("yearmonth2").setValue(yearmonth2);
                    
                    var contorderno = o.csReveForecast.contorderno;
                    var revetype = o.csReveForecast.revetype;
		            if(revetype.indexOf('5') >= 0){
		            	document.getElementById("setyearmonth1").style.display="";
		            	var setstart = o.csReveForecast.setstart;
		            	var setend = o.csReveForecast.setend;
		            	var setstart1 = null;
		           		var setend1 = null;
		            	if(setstart != "" && setstart != null){
		            		setstart1 = setstart.substring(0,4)+"-"+setstart.substring(4,6);
		            	}
		            	if(setend != "" && setend != null){
		            		setend1 = setend.substring(0,4)+"-"+setend.substring(4,6);
		            	}
		            	nui.get("setstart1").setValue(setstart1);
		            	nui.get("setend1").setValue(setend1);
		            }else{
		            	document.getElementById("setyearmonth1").style.display="none";
		            }
                    
                    var newyearmonth = o.csReveForecast.newyearmonth;
                    var newyearmonth = newyearmonth.substring(0,4)+"-"+newyearmonth.substring(4,6);
                    nui.get("newyearmonth").setValue(newyearmonth);
                    //加载附件设置参数
                	nui.get("grid_0").load({"groupid":"csReveForecast","relationid":o.csReveForecast.reveid});
                	//加载所有订单放在combobox里面可选
                	var contractid = nui.get("contractid").getValue();
		          	var json = nui.encode({contractid: contractid});
		          	nui.ajax({
		        		url: "com.primeton.eos.ame_income.csReveForecast.getOrderno.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (o) {
		                    nui.get("contorderno2").setData(o.csContOrder);
		                    if(contorderno!=null&&contorderno!=""){
		                    	nui.get("contorderno2").setValue(contorderno);
		                    }else{
		                    	nui.get("contorderno2").setRequired(true);
		                    }
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		        	});
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
        	});
	    }
    	//新增调用方法
		function onOkAdd() {
			if(!form_add.validate()){
				alert("表单信息填写不完整，请确认必输项是否填写！！");
				return;
			}
			
			
			//验证输入的实际确认产品、服务MA 是否等于实际确认金额
			var productsum = nui.get("productsum").getValue();
			if(!productsum){
				productsum=0;
			}
	  		var servicesum = nui.get("servicesum").getValue();
			if(!servicesum){
				servicesum=0;
			}
	  		var masum = nui.get("masum").getValue();
			if(!masum){
				masum=0;
			}
	  		var fcsum1 = nui.get("fcsum1").getValue();
			if(!fcsum1){
				fcsum1=0;
			}
			fcsum1=parseFloat(fcsum1).toFixed(2);
	  		var summoney = parseFloat(parseFloat(productsum)+parseFloat(servicesum)+parseFloat(masum)).toFixed(2);
	  		if(summoney!=fcsum1){
	  			//防止计算出总金额之后又修改总金额
	  			alert("预计确认金额不等于产品、服务、MA之和");
	  			return;
	  		}
	  		
			
			
			if(!confirm("确认提交？")){
				return;
			}
			var data_add = form_add.getData();
			var yearmonth = nui.get("yearmonth1").getText();
			var setstart = nui.get("setstart").getText();
			var setend = nui.get("setend").getText();
        	data_add.csReveForecast.yearmonth = yearmonth.substring(0,4)+""+yearmonth.substring(4,6);
        	data_add.csReveForecast.setstart = setstart==""?"":setstart.substring(0,4)+""+setstart.substring(4,6);
        	data_add.csReveForecast.setend = setend==""?"":setend.substring(0,4)+""+setend.substring(4,6);
        	data_add.csReveForecast.newyearmonth = data_add.csReveForecast.yearmonth;
        	data_add.csReveForecast.newmonthperiod = data_add.csReveForecast.monthperiod;
	        var json = nui.encode({csReveForecast :data_add.csReveForecast});
			nui.ajax({
	            url: "com.primeton.eos.ame_income.csReveForecast.addCsReveForecast.biz.ext",
	            data: json,
	            type: 'POST',
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	            	alert("保存成功！");
	            	var contnum = nui.get("contnum").getValue();
		            var incomedata = {contnum: contnum};
		            grid_income.load(incomedata);
		            form_add.reset();
		            document.getElementById("field_add").style.display="none";
	            	document.getElementById("addReveFore").style.display="none";
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
	        });
	    }
    	//编辑调用方法
	    function onOkEdit(){
	    	if(!form_edit.validate()){
				alert("表单信息填写不完整，请确认必输项是否填写！！");
				return;
			}
			//判等预计确认金额和产品服务ma之和
			var fcsum2 =nui.get("fcsum2").getValue();
			var productsum2 =nui.get("productsum2").getValue();
			var servicesum2 =nui.get("servicesum2").getValue();
			var masum2 =nui.get("masum2").getValue();
			/* if(fcsum2<0 || productsum2<0 || servicesum2 <0 || masum2<0){
				alert("金额不能为负数！");
				return;
			} */
			if(fcsum2!=(productsum2 + servicesum2 + masum2)){
				alert("预计确认金额不等于产品+服务+MA总和！");
				return;
			}
			//验证输入的实际确认产品、服务MA 是否等于实际确认金额
			var actproductsum = nui.get("actproductsum").getValue();
			if(!actproductsum){
				actproductsum=0;
			}
	  		var actservicesum = nui.get("actservicesum").getValue();
			if(!actservicesum){
				actservicesum=0;
			}
	  		var actmasum = nui.get("actmasum").getValue();
			if(!actmasum){
				actmasum=0;
			}
	  		var actsum = nui.get("actsum").getValue();
			if(!actsum){
				actsum=0;
			}
			actsum=parseFloat(actsum).toFixed(2);
	  		var summoney = parseFloat(parseFloat(actproductsum)+parseFloat(actservicesum)+parseFloat(actmasum)).toFixed(2);
	  		if(summoney!=actsum){
	  			//防止计算出总金额之后又修改总金额
	  			alert("实际确认的含税产品、服务、MA总和不等于实际确认含税金额！");
	  			return;
	  		}
	  		//验证不含税
			var actproductsum2 = nui.get("actproductsum2").getValue();
			if(!actproductsum2){
				actproductsum2=0;
			}
	  		var actservicesum2 = nui.get("actservicesum2").getValue();
			if(!actservicesum2){
				actservicesum2=0;
			}
	  		var actmasum2 = nui.get("actmasum2").getValue();
			if(!actmasum2){
				actmasum2=0;
			}
	  		var actsum2 = nui.get("actsum2").getValue();
			if(!actsum2){
				actsum2=0;
			}
			actsum2=parseFloat(actsum2).toFixed(2);
	  		var summoney2 = parseFloat(parseFloat(actproductsum2)+parseFloat(actservicesum2)+parseFloat(actmasum2)).toFixed(2);
	  		if(summoney2!=actsum2){
	  			//防止计算出总金额之后又修改总金额
	  			alert("实际确认的不含税产品、服务、MA总和不等于实际确认不含税金额！");
	  			return;
	  		}
			
			if(!confirm("确认保存？")){
				return;
			}
	    	document.getElementById("fileCatalog").value="csReveForecast";
	    	form2.submit();
	    }
		function SaveData() {
			var data_edit = form_edit.getData();
			var newyearmonth = nui.get("newyearmonth").getText();
        	data_edit.csReveForecast.newyearmonth = newyearmonth.substring(0,4)+""+newyearmonth.substring(4,6);
			var yearmonth = nui.get("yearmonth2").getText();
        	data_edit.csReveForecast.yearmonth = yearmonth.substring(0,4)+""+yearmonth.substring(4,6);
        	var setstart1 = nui.get("setstart1").getText();
			var setend1 = nui.get("setend1").getText();
        	data_edit.csReveForecast.setstart = setstart1==""?"":(setstart1.substring(0,4)+""+setstart1.substring(4,6));
        	data_edit.csReveForecast.setend = setend1==""?"":(setend1.substring(0,4)+""+setend1.substring(4,6)); 
        	data_edit.csReveForecast.confirmdayStart = data_edit.csReveForecast.confirmdayStart == null || data_edit.csReveForecast.confirmdayStart==""?data_edit.csReveForecast.confirmday:data_edit.csReveForecast.confirmdayStart; 
        	data_edit.csReveForecast.maconfirmdayStart = data_edit.csReveForecast.maconfirmdayStart == null || data_edit.csReveForecast.maconfirmdayStart==""?data_edit.csReveForecast.maconfirmday:data_edit.csReveForecast.maconfirmdayStart; 
// 			var changetimes = nui.get("changetimes").getValue();
//         	data_edit.csReveForecast.changetimes = changetimes+1;
	        var json = nui.encode({csReveForecast:data_edit.csReveForecast});
			nui.ajax({
	            url: "com.primeton.eos.ame_income.csReveForecast.updateCsReveForecast.biz.ext",
	            data: json,
	            type: 'POST',
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	            	alert("编辑成功！");
	            	document.getElementById("editReveFore").style.display="none";
	            	var contnum = nui.get("contnum").getValue();
		            var incomedata = {contnum: contnum};
		            grid_income.load(incomedata);
		            form_edit.reset();
		            form2.reset();
		            var myTable = document.getElementById('filetable');
		            for(var i=0; i<myTable.rows.length; i++){
			            myTable.deleteRow(i);
		            }
		            document.getElementById("field_edit").style.display="none";
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
	        });
	    }
	    function removeReve() {
		    var rows = grid_income.getSelecteds();   //获取所有选中的行对象
		    var data = {csReveForecasts:rows};
		    var json = nui.encode(data);     //序列化成json字符串
			if (rows.length> 0) {
            	if (confirm("确定删除选中记录？")) {
	                nui.ajax({
		                url: "com.primeton.eos.ame_income.csReveForecast.deleteCsReveForecast.biz.ext",
		                type: "post",
		                data: json, 
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                	alert("删除成功！");
		                	grid_income.reload();
		                },
		                error: function () {
	                    }
	               });
                }
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
           	if (e.field == "noRateSum") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if(e.field == "fcreverate") {
            	e.cellHtml = "<div align='right'><b>" + parseFloat(parseFloat(e.value).toFixed(4))*parseFloat(100) + "%</b></div>";
            }
        }
        function getDetail(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
        }
        function checkDetail(){
	 		var selectRow = grid_income.getSelected();
			var executeUrl = "/default/ame_income/csReveForecast/detailCsReveForecast.jsp?id=" + selectRow.reveid;
		    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
			window.open(executeUrl, "合同收入记录详细信息","height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes" );
	    }
	    function creatReveCostProcess(){
	    	var rows = grid_income.getSelecteds();
	        if(rows.length==0){
				alert("请选中一条记录！");
				return;
			}
	        if(rows.length>1){
				alert("只能选中一条记录！");
				return;
			}
	        var row = grid_income.getSelected();
			if(!(row.revetype.indexOf("1")!=-1||row.revetype.indexOf("5")!=-1)){
				alert("只有人力服务项目收入类型、定制项目服务收入类型才允许发起已确认收入成本确认处理流程！");
				return;
			}
	        if(row.status !=3 ){
	        	alert("该笔收入未确认，不能发起已确认收入成本确认处理流程！");
	        	grid_income.deselect(row);
	        	return;
	        }
	        if(row.processinstid1!=null){
	        	alert("该笔收入已完成收入成本确认处理！");
	        	grid_income.deselect(row);
	        	return;
	        }
	        if(!confirm("确认发起已确认收入成本确认处理流程？")){
	        	return;
	        }
    		var json = nui.encode({reveid:row.reveid}); 
        	nui.ajax({
        		url: "com.primeton.eos.ame_income.ReveCostConfirmProcess.creatReveCostProcess.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                	var returnJson = nui.decode(o);
                    if(returnJson.exception == null){
                        nui.alert("已确认收入成本确认处理流程发起成功");
                    }else{
                        nui.alert("已确认收入成本确认处理流程发起失败");
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
        	});
	    }
    </script>
</body>
</html>
