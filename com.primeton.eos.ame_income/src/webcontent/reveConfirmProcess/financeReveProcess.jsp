<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>财务审核</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>合同基本信息</legend>
			<div style="padding:5px;">
				<table style="table-layout:fixed;" id="table_file">
					<tr>
						<td align="right" style="width:139px">合同名称：</td>
						<td name="csContract.projectname" id="projectname" style="width:250px" /></td>
						<td style="width:93px;" align="right">合同签署日期：</td>
        				<td style="width:250px;" id="signdate" ></td>
						<td align="right" style="width:95px">合同登记日期：</td>
						<td name="csContract.contreg" id="contreg" style="width:100px" /></td>
					</tr>
				</table>
				<table style="table-layout:fixed;" id="table_file">
					<tr>
						<td align="right" style="width:130px">合同编号：</td>
						<td name="csContract.contnum" id="contnum" style="width:190px"></td>
						<td align="right" style="width:130px">客户：</td>
						<td name="csContract.custname" id="custname" style="width:190px"></td>
						<td align="right" style="width:130px">受益人：</td>
						<td name="csContract.salename" id="salename" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">合同金额：</td>
						<td name="csContract.contsum" id="contsum" style="width:190px"></td>
						<td align="right" style="width:130px">已确认收入：</td>
						<td id="inconme" style="width:190px"></td>
						<td align="right" style="width:130px">收入类型：</td>
						<td name="cscontract.incometype" id="incometype" style="width:190px"></td>
					</tr>
					<tr>
	                    <td style="width:130px;" align="right">合同产品金额：</td>
	                    <td style="width:190px;"id="csContract.prodmon"></td>
	                    <td style="width:130px;" align="right">合同服务金额：</td>
	                    <td style="width:190px;"id="csContract.servmon"></td>
	                    <td style="width:130px;" align="right">合同MA金额：</td>
	                    <td style="width:190px;"id="csContract.masum"></td>
	                </tr>
	                <tr>
	                	<td style="width:130px;" align="right">已上传的文件：</td>
        				<td style="width:1000px;" id="uploadedFile" colspan="5"></td>
	                </tr>
				</table>
			</div>
		<%--<jsp:include page="/ame_common/detailFile.jsp"/>--%>
		</fieldset>
		<div>
			<div style="float: left;width: 80px;margin-right: 458px;">
				<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;width: 80px;">
					<legend>经营考核收入确认</legend>
					<form id="form_ContAndReve" method="post">
				            <span>合同收入记录列表</span>
			            	<div id="grid_income" class="nui-datagrid" style="width:520px;height:120px;" allowResize="true" dataField="csReveForecasts"
			        	 		url="com.primeton.eos.ame_income.csReveForecast.queryIncome.biz.ext" allowCellSelect="true"  showPager="false" 
			        	 		multiSelect="false">
							<div property="columns">
								<div field="reveno" width="80" headerAlign="center" align="center" headerAlign="center" >收入确认次数</div>
								<div field="reveproof" width="0" headerAlign="center" align="center" headerAlign="center" renderer="dictproof">预计收入确认证据</div>
								<div field="revetimedesc" width="0" headerAlign="center" align="left" headerAlign="center">收入确认时点描述</div>
								<div field="yearmonth" width="80" headerAlign="center" align="center" headerAlign="center" >预计确认年月</div>
			<!-- 					<div field="newmonthperiod" width="65" align="center"  headerAlign="center" renderer="dictmonth">预计确认旬度</div> -->
								<div field="fcreverate" width="80" align="center" headerAlign="center" summaryType="sum" numberFormat="p1">本次确认比例</div>	
								<div field="fcsum" width="80" align="right" headerAlign="center" dataType="currency"   >预计确认金额</div>
								<div field="status" width="75" align="center" headerAlign="center" renderer="dictstatus">目前确认状态</div>		
								<div field="actsum" width="80" align="right" headerAlign="center" summaryType="sum" dataType="currency"   >实际确认金额</div>	
								<div field="actsum2" width="120" align="right" headerAlign="center" summaryType="sum" dataType="currency"   >实际确认金额（不含税）</div>
								<div field="maconfirmday" width="70" align="center" headerAlign="center" >实际确认日期</div>
								<div field="memo" width="70" align="center" headerAlign="center" >说明</div>		
			<!-- 					<div field="actreveproof" width="70" align="center" headerAlign="center" renderer="dictproof">实际收入确认证据</div>		 -->
							</div>
						</div>
						<div style="padding:5px;width: 515px">
							<input name="csReveForecast.fileids" id="fileids1"  class="nui-hidden"/>
							<input name="csReveForecast.fcsum" id="fcsum" class="nui-hidden"/>
							<input name="csReveForecast.reveid" id="reveid" class="nui-hidden" />
							<input name="csReveForecast.contnum" class="nui-hidden" />
							<input name="csReveForecast.newtype" id="newtype" class="nui-hidden" /><!-- 默认财报类型 -->
							<input name="csReveForecast.status" id="status" class="nui-hidden" /><!-- 默认已审核确认 -->
							<input name="csReveForecast.contorderno" id="contorderno" class="nui-hidden" />
							<%--<input name="csReveForecast.status" id="status" class="nui-hidden" />--%>
							<table style="table-layout:fixed;">
								<br/>
								<tr>
									<td align="right" style="width:140px">收入确认次数：</td>
									<td  name="csReveForecast.reveno" id="reveno" style="width: 100px"/></td>
									<td align="right" style="width:140px">收入类型：</td>
									<td name="csReveForecast.revetype" id="revetype" /></td>
								</tr>
								<tr>
									<td align="right">实际确认日期：</td>
									<td ><input name="csReveForecast.maconfirmday" id="maconfirmday" onvaluechanged="changeMaday" class="nui-datepicker" style="width:100px" /></td>
									<td align="right" >实际应收开始日期：</td>
									<td ><input name="csReveForecast.maconfirmdayStart" id="maconfirmdayStart" class="nui-datepicker" style="width:100px" /></td>
								</tr>
								<tr>
									<td align="right" >预计确认年月：</td>
									<td name="csReveForecast.newyearmonth" id="newyearmonth" /></td>
									<td align="right" >本次确认比例：</td>
									<td  name="csReveForecast.fcreverate" id="fcreverate"/></td>
								</tr>
								
								<tr id="setyearmonth" style="display: none;">
									<td align="right" >本次结算开始年月：</td>
									<td><input name="csReveForecast.setstart" id="setstart" required="true" class="nui-monthpicker" format="yyyyMM" style="width:100px" allowInput="false" onvaluechanged="selectYM"/> </td>
									<td align="right" >本次结算结束年月：</td>
									<td ><input name="csReveForecast.setend" id="setend" required="true" class="nui-monthpicker" format="yyyyMM" style="width:100px" allowInput="false" onvaluechanged="selectYM"/></td>
								</tr>
								<tr id="setyearmonth1"  style="display: none;">
									<td align="right" >本次结算人月工作量：</td>
									<td><input name="csReveForecast.labormonth" id="labormonth" required="true" class="nui-spinner" changeOnMousewheel="false" style="width:100px" format="n2" showbutton="false" minValue="-1000" maxValue="1000"/></td>
									<td align="right">本次实际工作量：</td>
									<td id="laborcountinto2"></td>
								</tr>
							</table>
							<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
								<legend>合同收入金额信息</legend>
									<input name="csReveForecast.productsum" id="productsum" class="nui-hidden" />
									<input name="csReveForecast.servicesum" id="servicesum" class="nui-hidden" />
									<input name="csReveForecast.masum" id="masum" class="nui-hidden"/>
									<table style="table-layout:fixed;">
										<tr>
											<td align="right" style="width:60px"></td>
											<td style="width:120px" align="left">预计确认金额</td>
											<td style="width:120px" align="center">实际确认金额</td>
											<td style="width:60px" align="center">税率</td>
											<td style="width:120px" align="center">不含税金额</td>
										</tr>
										<tr> 
											<td align="right" >产品：</td>
											<td name="csReveForecast.productsum" id="productsum1"/></td>
											<td ><input name="csReveForecast.actproductsum" id="actproductsum" onblur="calThreeMoney" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000" /></td>
											<td ><input name="csReveForecast.productrate" id="productrate" onblur="calThreeMoney" style="width:60px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="p0" showbutton="false"/></td>
											<td ><input name="csReveForecast.actproductsum2" id="actproductsum2" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
										</tr>
										<tr>
											<td align="right" >服务：</td>
											<td  name="csReveForecast.servicesum" id="servicesum1" /></td>
											<td ><input name="csReveForecast.actservicesum" id="actservicesum" onblur="calThreeMoney" style="width:120px" class="nui-spinner"  changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
											<td ><input name="csReveForecast.servicerate" id="servicerate" onblur="calThreeMoney" style="width:60px" class="nui-spinner" changeOnMousewheel="false" showbutton="false" inputStyle="text-align:right;" format="p0"/></td>
											<td ><input name="csReveForecast.actservicesum2" id="actservicesum2" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
										</tr>
										<tr>
											<td align="right" style="width:120px">MA：</td>
											<td  name="csReveForecast.masum" id="masum1" /></td>
											<td ><input name="csReveForecast.actmasum" id="actmasum" onblur="calThreeMoney" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
											<td ><input name="csReveForecast.marate" id="marate" onblur="calThreeMoney" style="width:60px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="p0" showbutton="false"/></td>
											<td ><input name="csReveForecast.actmasum2" id="actmasum2" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
										</tr>
										<tr>
											<td align="right" ">总金额：</td>
											<td name="csReveForecast.fcsum" id="fcsum1" /></td>
											<td ><input name="csReveForecast.actsum" id="actsum" class="nui-spinner" changeOnMousewheel="false" style="width:120px" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
											<td ></td>
											<td ><input name="csReveForecast.actsum2" id="actsum2" style="width:120px" class="nui-spinner" changeOnMousewheel="false" onblur="countprofit" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
										</tr>
									</table>
								</fieldset>
								<table style="table-layout:fixed;">
									<tr>
										<td align="right" style="width:120px">收入确认相关说明：</td>
										<td colspan="3" ><input name="csReveForecast.memo" id="memo" class="nui-textarea" style="width:330px"/></td>
									</tr>
									<tr>
										<td align="right">预计证据：</td>
										<td  name="csReveForecast.reveproof" id="reveproof" /></td>
										<td align="right" style="width: 120px">实际证据：</td>
										<td style="width: 130px"><input name="csReveForecast.actreveproof" id="actreveproof" class="nui-dictcombobox" dictTypeId="MIS_INCOMECONV" multiSelect="true" style="width:120px" /></td>
									</tr>
									<tr>
									<td align="right">收入确认时点：</td>
										<td colspan="3" name="csReveForecast.revetimedesc" id="revetimedesc"/></td>
									</tr>
									<tr>
										<td align="right" >临时冻结项目:
										</td>
										<td>
											<input class="nui-radiobuttonlist" name="csReveForecast.isCLoseProject" id="isCLoseProject" repeatItems="2" repeatLayout="table" repeatDirection="Horizontal" textField="text" valueField="id" style="width:80px;" data="[{'id': 'true','text': '是'},{'id': 'false','text': '否'}]">
										</td>
										<td align="right" >外部成本结束日期：</td>
										<td ><input name="csReveForecast.ocenddate" id="ocenddate" class="nui-datepicker" style="width:100px" /><input class="nui-button" id="tooltips" data-tooltips="1111"  style="height: 19px;" iconCls="icon-tip" ></td>
										
									</tr>
									
								</table>
						</div>
					</form>
				</fieldset>
			</div>
		
			<div style="float: left;width: 80px;">
				<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;width: 515px">
					<legend>财务核算收入确认</legend>
					<span>财务已确认收入明细</span>
		            	<div id="grid_finincome" class="nui-datagrid" style="width: 520px;height:120px;" allowResize="true" dataField="csReveForecastFins"
		        	 		url="com.primeton.eos.ame_income.csReveForecast.queryFinIncome.biz.ext" allowCellSelect="true"  showPager="false" 
		        	 		multiSelect="true" onselectionchanged="selectFinreve">
							<div property="columns">
								<div type="checkcolumn"></div>
								<div field="reveno" width="80" headerAlign="center" align="center" headerAlign="center" >收入确认次数</div>
								<div field="actsum" width="80" align="right" headerAlign="center" summaryType="sum" dataType="currency"   >实际确认金额</div>	
								<div field="actsum2" width="120" align="right" headerAlign="center" summaryType="sum" dataType="currency"   >实际确认金额（不含税）</div>	
								<div field="confirmday" width="80" align="center" headerAlign="center" >确认日期</div>	
								<div field="setstart" width="80" align="center" headerAlign="center" >结算开始日期</div>	
								<div field="setend" width="80" align="center" headerAlign="center" >结算结束日期</div>	
								<div field="labormonthact" width="80" align="center" headerAlign="center" >实际工作量</div>
								<div field="labormonth" width="80" align="center" headerAlign="center" >确认工作量</div>	
								<div field="memo" width="120" align="center" headerAlign="center" >说明</div>		
							</div>
						</div>
	        	<div><input class="nui-checkbox" id="syncflag" checked="checked" onvaluechanged="changeischeck"/>本次收入确认同步财务收入确认
	        	<a class="nui-button" onclick="syncjysr">同步经营收入</a>
	        	</div>
					<form id="formFinReve" method="post">
						<input class="nui-hidden" name="csReveForecastFin.reveid"/>
						<input class="nui-hidden" name="csReveForecastFin.contnum" id="contnumFin"/>
						<input class="nui-hidden" name="csReveForecastFin.status" id="statusFin"/>
						<div style="padding:5px;width: 515px" id="finreve" >
							<table style="table-layout:fixed;">
								<tr>
									<td align="right" style="width:160px">收入确认次数：</td>
									<td style="width:110px" name="csReveForecastFin.reveno" id="revenoFin" /></td>
									<td align="right" style="width:140px">收入类型：</td>
									<td style="width:130px" name="csReveForecastFin.revetype" id="revetypeFin" /></td>
								</tr>
								<tr>
									<td align="right" style="width:110px">财报确认日期：</td>
									<td style="width:130px"><input name="csReveForecastFin.confirmday" id="confirmdayFin" onvaluechanged="changeday" class="nui-datepicker" style="width:110px" /></td>
									<td align="right" style="width:110px">财报应收开始日期：</td>
									<td style="width:130px"><input name="csReveForecastFin.confirmdayStart" id="confirmdayStartFin" class="nui-datepicker" style="width:110px" /></td>
								</tr>
								<tr>
									<td align="right" style="width:110px">新合同收入类型：</td>
									<td style="width:150px"/><input name="csReveForecastFin.newtype" id="newtypeFin" class="nui-dictcombobox" multiSelect="true"  dictTypeId="AME_NEWTYPE" style="width:110px" /></td>
									<td align="right" >收入占比：</td>
									<td /><input id="ratioFin" name="csReveForecastFin.reveratio" required="true" class="nui-spinner" format='n4' class="nui-spinner" onvaluechanged="changeratio" changeOnMousewheel="false" showbutton='false' minValue="0" maxValue="1" style="width:110px"/></td>
								</tr>
								<tr id="setyearmonthFin" style="display: none;">
									<td align="right" >本次结算开始年月：</td>
									<td ><input name="csReveForecastFin.setstart" id="setstartFin" required="true" class="nui-monthpicker" format="yyyyMM" style="width:110px" allowInput="false" /></td>
									<td align="right" >本次结算结束年月：</td>
									<td ><input name="csReveForecastFin.setend" id="setendFin" required="true" class="nui-monthpicker" format="yyyyMM" style="width:110px" allowInput="false" /></td>
								</tr>
								<tr id="setyearmonthFin1" style="display: none;">
									<td align="right">本次结算人月工作量：</td>
									<td ><input name="csReveForecastFin.labormonth" id="labormonthFin" required="true" class="nui-spinner" changeOnMousewheel="false" style="width:110px" format="n2" showbutton="false" minValue="-1000" maxValue="1000"/></td>
									<td align="right">本次实际工作量：</td>
									<td><input name="csReveForecastFin.labormonthact" id="laborcountinto1" required="true" class="nui-spinner" changeOnMousewheel="false" style="width:110px" format="n2" showbutton="false" minValue="-1000" maxValue="1000"/></td>
								</tr>
							</table>
							<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
								<legend>合同收入金额信息</legend>
									<table style="table-layout:fixed;">
										<tr>
											<td align="right" style="width:60px"></td>
											<td style="width:120px" align="center">实际确认金额</td>
											<td style="width:60px" align="center">税率</td>
											<td style="width:120px" align="center">不含税金额</td>
										</tr>
										<tr> 
											<td align="right" >产品：</td>
											<td ><input name="csReveForecastFin.actproductsum" id="actproductsumFin" onblur="calThreeMoneyFin" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000" /></td>
											<td ><input name="csReveForecastFin.productrate" id="productrateFin" onblur="calThreeMoneyFin" style="width:60px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="p0" showbutton="false"/></td>
											<td ><input name="csReveForecastFin.actproductsum2" id="actproductsum2Fin" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
										</tr>
										<tr>
											<td align="right">服务：</td>
											<td ><input name="csReveForecastFin.actservicesum" id="actservicesumFin" onblur="calThreeMoneyFin" style="width:120px" class="nui-spinner"  changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
											<td ><input name="csReveForecastFin.servicerate" id="servicerateFin" onblur="calThreeMoneyFin" style="width:60px" class="nui-spinner" changeOnMousewheel="false" showbutton="false" inputStyle="text-align:right;" format="p0"/></td>
											<td ><input name="csReveForecastFin.actservicesum2" id="actservicesum2Fin" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
										</tr>
										<tr>
											<td align="right" >MA：</td>
											<td ><input name="csReveForecastFin.actmasum" id="actmasumFin" onblur="calThreeMoneyFin" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
											<td ><input name="csReveForecastFin.marate" id="marateFin" onblur="calThreeMoneyFin" style="width:60px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="p0" showbutton="false"/></td>
											<td ><input name="csReveForecastFin.actmasum2" id="actmasum2Fin" style="width:120px" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
										</tr>
										<tr>
											<td align="right">总金额：</td>
											<td ><input name="csReveForecastFin.actsum" id="actsumFin" class="nui-spinner" changeOnMousewheel="false" style="width:120px" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
											<td ></td>
											<td ><input name="csReveForecastFin.actsum2" id="actsum2Fin" style="width:120px" class="nui-spinner" changeOnMousewheel="false" onblur="countprofit" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
										</tr>
									</table>
								</fieldset>
								<table style="table-layout:fixed;">
									<tr>
										<td align="right" style="width:120px">收入确认相关说明：</td>
										<td><input name="csReveForecastFin.memo" id="memoFin" class="nui-textarea" style="width:360px"/></td>
									</tr>
								</table>
						</div>
					</form>
				</fieldset>
			</div>
		</div>
			
	<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
		<legend>合同对应收款及成本数据</legend>
		<table id="project">
			<tr>
				<td align="right" >项目:</td>
				<td>
					<input id="projectids" class="nui-combobox" data="projectiddata" multiSelect="true" required="true" style="width:400px" onvaluechanged="changeProjectCost"/>
				</td>
			</tr>
		</table>
		<div  class="nui-tabs" style="width:100%;" activeIndex="0">
			<div title="该项目成本数据" style="width:100%;">
				<div id="grid_csProjectCost" class="nui-datagrid" style="width:100%;height:auto" dataField="CsProjectFinalCost" showSummaryRow="true" ondrawsummarycell="doCostSum"
			    	url="com.primeton.eos.ame_income.csReveForeProcess.queryCsProjectFinalCost.biz.ext" showPager="false">
					<div property="columns">
						<div type="indexcolumn" width="25"></div>
						<div field="rlny" width="60" align="center"  headerAlign="center" renderer="detailGather">年月</div>
						<div field="projectno" width="100" align="center"  headerAlign="center" renderer="getProjectNameDetail">项目编号</div>
						<div field="concost" width="100" align="right" headerAlign="center" dataType="currency" summaryType="sum" renderer="concostPDetail">人力成本</div>	
						<div field="accruedmoney" width="100" align="right" headerAlign="center" dataType="currency" summaryType="sum">采购计提(不含税)</div>
						<div field="setamount" width="100" align="right" headerAlign="center" dataType="currency" summaryType="sum" >采购结算(不含税)</div>	
						<div field="directsum" width="100" align="right"  dataType="currency" headerAlign="center" summaryType="sum" renderer="directsumPDetail">直接费用</div>		
						<div field="allsum" width="100" align="right"  dataType="currency" headerAlign="center" summaryType="sum">月成本汇总</div>
						<div field="actmonth" width="100" align="right" headerAlign="center" dataType="currency" summaryType="sum" >工时人月数</div>	
						<div field="workamount" width="100" align="right" headerAlign="center" dataType="currency" summaryType="sum" >采购人月数</div>	
						<div field="allmonth" width="100" align="right" headerAlign="center" dataType="currency" summaryType="sum" >工作量汇总</div>	
					</div>
				</div>
			</div>
			<div title="该合同成本数据" style="width:100%;">
				<div id="grid_csContractCost" class="nui-datagrid" style="width:100%;height:auto" dataField="CsContractFinalCost" showSummaryRow="true" ondrawsummarycell="doCostSum"
			    	url="com.primeton.eos.ame_income.csReveForeProcess.queryCsContractFinalCost.biz.ext" showPager="false">
					<div property="columns">
						<div type="indexcolumn" width="25"></div>
						<div field="rlny" width="60" align="center"  headerAlign="center" renderer="detailGather">年月</div>
						<div field="concost" width="100" align="right" headerAlign="center" dataType="currency" summaryType="sum" renderer="concostDetail">人力成本</div>	
						<div field="accruedmoney" width="100" align="right" headerAlign="center" dataType="currency" summaryType="sum"  renderer="accruedmoneyDetail">采购成本(不含税)</div>
						<div field="directsum" width="100" align="right"  dataType="currency" headerAlign="center" summaryType="sum" renderer="directsumDetail">直接费用</div>		
						<div field="allsum" width="100" align="right"  dataType="currency" headerAlign="center" summaryType="sum">月成本汇总</div>
						<div field="actmonth" width="100" align="right" headerAlign="center" dataType="currency" summaryType="sum" >工时人月数</div>	
						<div field="workamount" width="100" align="right" headerAlign="center" dataType="currency" summaryType="sum" >采购人月数</div>	
						<div field="allmonth" width="100" align="right" headerAlign="center" dataType="currency" summaryType="sum" >工作量汇总</div>	
					</div>
				</div>
			</div>
		
			<div title="该合同对应收款情况" style="width:100%;">
				<div id="grid_csGatherFc" class="nui-datagrid" style="width:100%;height:auto" dataField="csGatherFcs" showSummaryRow="true" ondrawsummarycell="doCountSum"
			    	url="com.primeton.eos.ame_income.csReveForeProcess.queryCsGahterFcByContnum.biz.ext" showPager="false">
					<div property="columns">
						<div type="indexcolumn" width="25"></div>
						<div field="gatherno" width="60" align="center"  headerAlign="center" renderer="detailGather">收款次数</div>
						<div field="fcsum" width="130" align="right" headerAlign="center" dataType="currency" summaryType="sum">预计收款金额（含税）</div>	
						<div field="fcsum2" width="140" align="right" headerAlign="center" dataType="currency" summaryType="sum" >预计收款金额（不含税）</div>	
						<div field="newyearmonth" width="85" align="center"  headerAlign="center">预计收款年月</div>
						<div field="status" width="80" align="center" headerAlign="center" renderer="dictGatherStatus">收款状态</div>		
						<div field="billstatus" width="80" align="center" headerAlign="center" renderer="dictstatus1">收款开票状态</div>
						<div field="confirmday" width="80" align="center" headerAlign="center" >实际收款日期</div>
						<div field="actsum" width="130" align="right" headerAlign="center" dataType="currency" summaryType="sum" >实际收款金额（含税）</div>	
						<div field="actsum2" width="140" align="right" headerAlign="center" dataType="currency" summaryType="sum" >实际收款金额（不含税）</div>	
					</div>
				</div>
			</div>
		</div>
	</fieldset>
	<fieldset>
		<legend>收入的毛利核算</legend>
		<div id="form_GrossProfit">
			<table style="table-layout:fixed;">
				<tr>
					<td style="width:180px;" align="right">本次结算工作量：</td>
					<td id="laborcountthis" style="width:150px;"></td>
					<td style="width:180px;" align="right">本次实际投入工作量：</td>
					<td id="laborcountinto" style="width:150px;"></td>
					<td style="width:180px;" align="right">工作量偏差：</td>
					<td id="laborcountoffset" style="width:150px;"></td>
				<tr>
				<tr>
					<td style="width:180px;" align="right">本次确认金额(不含税)：</td>
					<td id="profitsum" style="width:150px;"></td>
					<td style="width:180px;" align="right">本次确认成本(不含税)：</td>
					<td id="profitcost" style="width:150px;"></td>
					<td style="width:120px;" align="right">本次确认毛利：</td>
					<td id="profit" style="width:150px;"></td>
				</tr>
				<tr>
					<td style="width:130px;" align="right">本次确认毛利率：</td>
					<td id="profitRate" style="width:150px;"></td>
					<td style="width:130px;" align="right">预算毛利率：</td>
					<td id="bugetprofitRate" style="width:150px;"></td>
					<td style="width:130px;" align="right">毛利率偏差：</td>
					<td id="profitRateoffset" style="width:150px;"></td>
				</tr>
			</table>
		</div>
	</fieldset>
	
    <fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>该合同对应采购成本情况</legend>
			
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                    	对应采购合同列表
	                    </td>
	                </tr>
                 </table>
	        </div>
			<div id="grid_purCont" class="nui-datagrid" style="width:100%;height:auto;" allowResize="false" dataField="purContracts" ondrawsummarycell="doCountSum"
			 showPager="false" showSummaryRow="true">
				<div property="columns">
					<div type="indexcolumn" width="25"></div>	
					<div field="purSupplier.suppliersname" width="70" align="center" headerAlign="center">供应商简称</div>							
					<div field="purcontnum" width="125" align="center" headerAlign="center">采购合同编号</div>		
					<div field="purcontname" width="275" align="left" headerAlign="center">合同名称</div>	
					<div field="purtype" width="70" align="center" headerAlign="center"renderer="dictpurtype">合同类型</div>		
					<div field="signdate" width="90" align="center" headerAlign="center">签订日期</div>				
					<div field="startdate"width="80" align="center" headerAlign="center">合同开始日期</div>
					<div field="enddate" width="80" align="center"  headerAlign="center">合同截止日期</div>
					<div field="contmoney" width="80" align="right"  headerAlign="center" dataType="currency" summaryType="sum" >合同金额(元)</div>
					<div field="purstatus" width="70" align="center" headerAlign="center"  renderer="dictpurstatus">合同状态</div>		
				</div>
			</div>
			<br/>
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                    	采购结算记录(含外包、非外包)
	                    </td>
	                </tr>
                 </table>           
	        </div>
	        <div id="grid_purSettle" class="nui-datagrid" dataField="purSettles" style="width:100%;height:auto" showSummaryRow="true"ondrawsummarycell="doCountSum"
	        	url="com.primeton.eos.ame_income.csReveForeProcess.queryPursettlesByContnum.biz.ext"  showPager="false">
	            <div property="columns">
	            	<div type="indexcolumn" width="25"></div>
	                <div field="settlementno" width="60" headerAlign="center" align="center">结算单编号</div>
	                <div field="setamount" width="60" align="right" dataType="currency" headerAlign="center" summaryType="sum" >结算总金额(元)</div>
	                <div field="notaxmon" width="70" align="right" dataType="currency" headerAlign="center"  summaryType="sum">结算不含税总金额(元)</div>
	                <div field="costtype" width="50" align="center" headerAlign="center" renderer="dictGetCostType" >成本类型</div>
	                <div field="startdate" width="50" align="center" headerAlign="center" >结算开始日期</div>
	                <div field="enddate" width="50" align="center" headerAlign="center" >结算截止日期</div>
	                <div field="setstatus" width="50" align="center" headerAlign="center" renderer="dictGetStatus">结算单状态</div>
	                <div field="subdate" width="60" align="center" headerAlign="center" style="width:100px;">结算提交日期</div>
	                <div field="purcontnum" width="50" align="center" headerAlign="center" renderer="getPurContDetail">采购合同编号</div>
	            </div>
	        </div>
	        <br/>
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                    	采购计提记录(应付账款)
	                    </td>
	                </tr>
                 </table>           
	        </div>
			<div id="grid_presettle" class="nui-datagrid" dataField="purpresettles" style="width:100%;height:auto" ondrawsummarycell="doCountSum"
	        	url="com.primeton.eos.ame_income.csReveForeProcess.queryPurPresettleListByContnum.biz.ext" showPager="false"  showSummaryRow="true">
	            <div property="columns">
	                <div type="indexcolumn" width="25"></div>
	                <div field="accrueddate" width="50" headerAlign="center" align="center">计提时间</div>
	                <div field="accruedmoney" width="55" headerAlign="center" align="right" dataType="currency"  summaryType="sum">计提金额(元)</div>
	                <div field="notaxmoney" width="55" align="right" dataType="currency" headerAlign="center"  summaryType="sum">计提不含税金额(元)</div>
	                <div field="costtype" width="40" align="center" headerAlign="center" renderer="dictGetCostType">成本归属类型</div>
	                <div field="startdate" width="50" align="center" headerAlign="center" >计提开始日期</div>
	                <div field="enddate" width="50" align="center" headerAlign="center" >计提结束日期</div>
	                <div field="accruedstatus" width="50" align="center" headerAlign="center" renderer="dictGetAccruedStatus" >计提状态</div>
	                <div field="purcontnum" width="60" headerAlign="center" align="center" renderer="getPurContDetail1">采购合同编号</div>
	            </div>
	        </div>
	        <br/>
	        <div id="form_purChaseYesOrNo">
				<table style="table-layout:fixed;">
					<tr>
						<td style="width:215px;" align="right">是否有暂未签署或未报备采购：</td>
						<td style="width:140px;">  
							<input id="purChaseYesOrNo" class="nui-dictcombobox"  style="width:80px;" required="true" dictTypeId="MIS_YN" readonly="readonly" />
						</td>
					</tr>
				</table>
			</div>
	        <div id="cContract">
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                    	未签署采购/未计提情况报备
		                    </td>
		                </tr>
	                 </table>           
		        </div>
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;" id="button_inorgid1">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="add()">增加</a>
		                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
		                    </td>
		                </tr>
		             </table>           
		        </div>
		    	<div id="grid_otherPurchase" class="nui-datagrid" style="width:100%;height:auto;" allowCellSelect="true" showSummaryRow="true" 
		        	showPager="false" allowCellEdit="true"  multiSelect="true" ondrawsummarycell="doCountSum" >
		            <div property="columns">
		            	<div type="indexcolumn" width="50" align="center" headerAlign="center" cellCls="myIndex">编号</div>
		                <div field="custname" width="200" displayField="custname" align="left" headerAlign="center">供应商
							<input property="editor" class="nui-buttonedit" onbuttonclick="selectSupplier" style="width:100%;"/>
						</div>
		                <div field="purtype" width="150" align="center" headerAlign="center" renderer="dictContType">采购类型
							<input property="editor" class="nui-dictcombobox"  dictTypeId="AME_CONTYPE"/>
						</div>
		                <div field="money"  width="150" align="right"  headerAlign="center" dataType="currency" summaryType="sum">未签署采购/未计提金额
							<input property="editor" class="nui-spinner" allowLimitValue="false" increment="0" inputStyle="text-align:right;" showbutton="false"/>
						</div>
		                <div field="memo"  width="250" align="left" headerAlign="center">说明
							<input property="editor" class="nui-textbox" />
						</div>
		            </div>
		        </div>
			</div>
		</fieldset>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;display:none;">
			<legend>项目成本汇总</legend>
			<div style="width:800px;height:55px;margin-left:70px;float:left;">
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width:150px;">采购总成本(不含税)：</td>
						<td id="purChaseMoney" style="width:150px;" align="left" ></td> 
						<td align="right" style="width:120px;">人力服务成本：</td>
						<td id="pempcost" style="width:150px;" align="left" ></td> 
						<td align="right" style="width:120px;">直接费用成本：</td>
						<td id="pdircost" style="width:150px;" align="left" ></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td align="right" style="width:150px;">总成本：</td>
						<td id="totalMoney" style="width:150px;" align="left" ></td> 
					</tr>
				</table>
			</div>
		</fieldset>
		<br/>
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;" id="innerHtml">
                    	合同收入记录相关附件
                    </td>
                </tr>
             </table>           
        </div>
    </div>
	<jsp:include page="/ame_common/detailFile2.jsp"/>
	<jsp:include page="/ame_common/addFiles1.jsp"/>
	<jsp:include page="/ame_common/checkList.jsp"/>	
	<jsp:include page="/ame_common/misOpinion.jsp"/>
	<jsp:include page="/ame_common/addFiles.jsp"/>
	<table style="table-layout:fixed;display:none;">
        <tr>
        	<td style="width:150px;" align="right">
        		当前环节处理临时说明:
        	</td>
            <td style="width:610px;">
                <input id="workItemMemo" class="nui-textarea" required="false" style="width:600px;height:45px;"/>
            </td>
            <td>
                <a class="nui-button" onclick="saveWorkitemMemo('0')" style="width:50px;margin-right:15px;">保存</a>
                <a class="nui-button" onclick="saveWorkitemMemo('1')" style="width:50px;margin-right:15px;">清除</a>
            </td>
        </tr>
    </table>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" id="saveReveProcess"style="width:80px;margin-right:20px;">提交</a>
	<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>
</div>
<script type="text/javascript">
    nui.parse();
  	var form_ContAndReve = new nui.Form("form_ContAndReve");
  	var formFinReve = new nui.Form("formFinReve");
  	var opioionform = new nui.Form("opioionform");
  	var grid_income = nui.get("grid_income");
  	var grid_finincome = nui.get("grid_finincome");
  	var grid_1 = nui.get("grid_1");//预估附件
  	
  	var grid_csGatherFc = nui.get("grid_csGatherFc");
  	var grid_csContractCost = nui.get("grid_csContractCost");
	var grid_csProjectCost = nui.get("grid_csProjectCost");
  	var grid_purCont = nui.get("grid_purCont");
	var grid_purSettle = nui.get("grid_purSettle");
	var grid_presettle = nui.get("grid_presettle");
	var grid_otherPurchase = nui.get("grid_otherPurchase");
  	<% 
	long workItemID=(Long)request.getAttribute("workItemID");
	%>
	function dictproof(e) {
		return nui.getDictText('MIS_INCOMECONV',e.value);//设置业务字典值
	}
	function dictmonth(e) {
		return nui.getDictText('AME_MONTHPERIOD',e.value);//设置业务字典值
	}
	function dictstatus(e) {
		return nui.getDictText('AME_REVESTATUS',e.value);//设置业务字典值
	}
  	var purChaseMoney = 0;
  	var contnum="";
  	var prodmon ;
    var servmon;
    var masum;
  	var totalMoney="";
    var projectid="";
    var projectiddata =[];
    var projectids="";
    var finreveno;//财务收入确认次数
    var finrevetype;
    loadData();
	function loadData(){
		//初始化处理意见
		initMisOpinion({auditstatus:"1"});
		//流程提示信息
		promptInit({workItemID:<%=workItemID %>});
		var data={workItemID:<%=workItemID %>};
		var json=nui.encode(data);
		nui.ajax({
			url:"com.primeton.eos.ame_income.csReveForeProcess.queryEveForeProcess.biz.ext",
			type:"post",
			data:json,
			contentType:"text/json",
			success:function (o){
				//合同预估表基本信息
				form_ContAndReve.setData(o);
				formFinReve.setData(o);
				var setstart = o.csReveForecast.setstart;
				if(setstart!=null&&setstart!=""){
					nui.get("setstart").setValue(setstart.substring(0,4)+"-"+setstart.substring(4,6));
				}
				var setend = o.csReveForecast.setend;
				if(setend!=null&&setend!=""){
					nui.get("setend").setValue(setend.substring(0,4)+"-"+setend.substring(4,6));
				}
				var labormonth = o.csReveForecast.labormonth;
				nui.get("labormonth").setValue(labormonth);
				
				var setstartFin = o.csReveForecastFin.setstart;
				if(setstartFin!=null&&setstartFin!=""){
					nui.get("setstartFin").setValue(setstartFin.substring(0,4)+"-"+setstartFin.substring(4,6));
				}else{
					if(setstart!=null&&setstart!=""){
						nui.get("setstartFin").setValue(setstart.substring(0,4)+"-"+setstart.substring(4,6));
					}
				}
				var setendFin = o.csReveForecastFin.setend;
				if(setendFin!=null&&setendFin!=""){
					nui.get("setendFin").setValue(setendFin.substring(0,4)+"-"+setendFin.substring(4,6));
				}else{
					if(setend!=null&&setend!=""){
						nui.get("setendFin").setValue(setend.substring(0,4)+"-"+setend.substring(4,6));
					}
				}
				var labormonthFin = o.csReveForecastFin.labormonth;
				if(labormonthFin===null&&labormonthFin===""){
					nui.get("labormonthFin").setValue(labormonth);
				}else{
					nui.get("labormonthFin").setValue(labormonthFin);
				}
				//合同基本信息
				prodmon = o.csContract.prodmon;
				servmon = o.csContract.servmon;
				masum = o.csContract.masum;
				contsum = o.csContract.contsum;
            	document.getElementById("projectname").innerHTML = o.csContract.projectname == null ?"":o.csContract.projectname;
            	document.getElementById("contnum").innerHTML = o.csContract.contnum == null ?"":o.csContract.contnum;
            	document.getElementById("contsum").innerHTML = o.csContract.contsum == null ?"":formatNumber(o.csContract.contsum,'#,##.##');
            	document.getElementById("salename").innerHTML = o.csContract.salename == null ?"":o.csContract.salename;
            	document.getElementById("signdate").innerHTML = o.csContract.signdate == null ?"":o.csContract.signdate;
            	document.getElementById("contreg").innerHTML = o.csContract.contreg == null ?"":o.csContract.contreg;
				document.getElementById("incometype").innerHTML = nui.getDictText('MIS_HTINCOMETYPE',o.csContract.incometype);
            	document.getElementById("custname").innerHTML = o.csContract.misCustinfo.custname == null ?"":o.csContract.misCustinfo.custname;
            	document.getElementById("csContract.servmon").innerHTML = o.csContract.servmon== null ?"":formatNumber(o.csContract.servmon,'#,##.##');
                document.getElementById("csContract.prodmon").innerHTML = o.csContract.prodmon== null ?"":formatNumber(o.csContract.prodmon,'#,##.##');
                document.getElementById("csContract.masum").innerHTML = o.csContract.masum== null ?"0":formatNumber(o.csContract.masum,'#,##.##');
            	//防止后面计算出现空字符串或者NaN的情况
            	nui.get("actproductsum").setValue(o.csReveForecast.actproductsum==""?0:o.csReveForecast.actproductsum);
            	nui.get("actservicesum").setValue(o.csReveForecast.actservicesum==""?0:o.csReveForecast.actservicesum);
            	nui.get("actmasum").setValue(o.csReveForecast.actmasum==""?0:o.csReveForecast.actmasum);
		    	document.getElementById("productsum").innerHTML = o.csReveForecast.productsum== null ?"0":formatNumber(o.csReveForecast.productsum,'#,##.##');
		    	document.getElementById("servicesum").innerHTML = o.csReveForecast.servicesum== null ?"0":formatNumber(o.csReveForecast.servicesum,'#,##.##');
		    	document.getElementById("masum").innerHTML = o.csReveForecast.masum== null ?"0":formatNumber(o.csReveForecast.masum,'#,##.##');
		    	document.getElementById("reveno").innerHTML = o.csReveForecast.reveno== null ?"":o.csReveForecast.reveno;
		    	document.getElementById("revetype").innerHTML = nui.getDictText('AME_REVETYPE',o.csReveForecast.revetype);
		    	finrevetype=o.csReveForecast.revetype;
		    	document.getElementById("reveproof").innerHTML = nui.getDictText('MIS_INCOMECONV',o.csReveForecast.reveproof);
		    	document.getElementById("newyearmonth").innerHTML = o.csReveForecast.newyearmonth== null ?"":o.csReveForecast.newyearmonth;
				document.getElementById("fcreverate").innerHTML = o.csReveForecast.fcreverate== null ?"":parseFloat(o.csReveForecast.fcreverate*100).toFixed(1)+"%";
		    	document.getElementById("fcsum").innerHTML = o.csReveForecast.fcsum== null ?"":formatNumber(o.csReveForecast.fcsum,'#,##.##');
        		document.getElementById("revetimedesc").innerHTML = o.csReveForecast.revetimedesc== null ?"":o.csReveForecast.revetimedesc;
              	document.getElementById("productsum1").innerHTML = o.csReveForecast.productsum== null ?"0":formatNumber(o.csReveForecast.productsum,'#,##.##');
		    	document.getElementById("servicesum1").innerHTML = o.csReveForecast.servicesum== null ?"0":formatNumber(o.csReveForecast.servicesum,'#,##.##');
		    	document.getElementById("masum1").innerHTML = o.csReveForecast.masum== null ?"0":formatNumber(o.csReveForecast.masum,'#,##.##');
                if(o.csReveForecastFin.productrate==null||o.csReveForecastFin.productrate==""){
	                nui.get("productrateFin").setValue(nui.getDictText("AME_SYSCONF","PRODUCTRATE"));
                }
                if(o.csReveForecastFin.servicerate==null||o.csReveForecastFin.servicerate==""){
			    	nui.get("servicerateFin").setValue(nui.getDictText("AME_SYSCONF","SERVICERATE"));
                }
                if(o.csReveForecastFin.marate==null||o.csReveForecastFin.marate==""){
			    	nui.get("marateFin").setValue(nui.getDictText("AME_SYSCONF","MARATE"));
                }
                if(o.csReveForecastFin.newtype==null||o.csReveForecastFin.newtype==""){
			    	nui.get("newtypeFin").setValue(o.csReveForecast.newtype);
                }
                
                if(o.csReveForecastFin.confirmday==null||o.csReveForecastFin.confirmday==""){
			    	nui.get("confirmdayFin").setValue(o.csReveForecast.maconfirmday);
                }
                 if(o.csReveForecastFin.confirmdayStart==null||o.csReveForecastFin.confirmdayStart==""){
			    	nui.get("confirmdayStartFin").setValue(o.csReveForecast.maconfirmdayStart);
                }
                
                nui.get("contnumFin").setValue(o.csReveForecast.contnum);
		    	document.getElementById("revetypeFin").innerHTML = nui.getDictText('AME_REVETYPE',o.csReveForecast.revetype);
		    	
                //判断收入类型是否包含人力服务收入
	        	var revetype = o.csReveForecast.revetype; 
	        	if(revetype.indexOf('5') >= 0){
					document.getElementById("setyearmonth").style.display = "";
					document.getElementById("setyearmonthFin").style.display = "";
					document.getElementById("setyearmonth1").style.display = "";
					document.getElementById("setyearmonthFin1").style.display = "";
				}else{
					document.getElementById("setyearmonth").style.display = "none";
					document.getElementById("setyearmonthFin").style.display = "none";
					document.getElementById("setyearmonth1").style.display = "none";
					document.getElementById("setyearmonthFin1").style.display = "none";
				}
				nui.get("ocenddate").setValue(o.csReveForecast.ocenddate);
                //合同附件查询
				<%--var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"CS_CONTRACT","relationid":o.csContract.contractid});
				grid_0.sortBy("fileTime","desc");--%>
				nui.ajax({
	                url: "com.primeton.eos.ame_common.file.getFiles.biz.ext",
	                data: {relationid:o.csContract.contractid,groupid:"CS_CONTRACT"},
	                type: 'POST',
		            cache: false,
	   				async:false,
	                contentType: 'text/json',
	                success: function (o) {
	                	//alert(nui.encode(o));
	                	var tempSrc = "";
		                for(var i=0;i<o.files.length;i++){
		                	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + o.files[i].fileId + "'>" + o.files[i].fileName + "</a>,&nbsp;&nbsp;&nbsp;&nbsp;";
		                }
		               	document.getElementById("uploadedFile").innerHTML = tempSrc;
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                }
	            });
				//预估列表查询(默认勾选所选记录)
				grid_income.load({contnum:o.csContract.contnum});
				
				grid_finincome.load({contnum:o.csContract.contnum},function(data){
					if(o.csReveForecastFin.reveno){
						finreveno = o.csReveForecastFin.reveno;
						document.getElementById("revenoFin").innerHTML = o.csReveForecastFin.reveno;
					}else{
						finreveno= data.data.length+1;
						document.getElementById("revenoFin").innerHTML = data.data.length+1;
					}
				});
				grid_income.on("drawcell", function (e) {
		            var record = e.record,
			        column = e.column,
			        field = e.field,
			        value = e.value;
	            	if(record.reveid == nui.get("reveid").getValue()){
		            	e.cellStyle = "background: yellow";
	            	}
		        });
				//预估附件查询
				var grid_1 = nui.get("grid_1");
				grid_1.load({"groupid":"csReveForecast","relationid":o.csReveForecast.reveid});
				grid_1.sortBy("fileTime","desc");
				//设置审核意见基本信息
				nui.get("processinstid").setValue(o.workitem.processInstID);
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
				nui.get("workitemid").setValue(o.workitem.workItemID);
               	nui.get("isshow").setValue("1");
               	nui.get("backTo").setData(o.csReveForecast.backList);
            	
        		//checklist所需参数processInstID、activityInstID、incomeType、checkObj
        		var revetype = o.csReveForecast.revetype;
        		var checklistdata={processInstID:o.workitem.processInstID,processDefName:o.workitem.processDefName,activityDefID:o.workitem.activityDefID,incomeType:revetype};
				queryChickList(checklistdata);
        		//查询收入确认金额
				nui.ajax({
		            url: "com.primeton.eos.ame_income.csReveForeProcess.querySumIncome.biz.ext",
		            data: {contnum:o.csContract.contnum},
		            type: 'POST',
		            cache: false,
		            contentType: 'text/json',
		            success: function (text) {
		            	document.getElementById("inconme").innerHTML = formatNumber(text.sum,'#,##.##');
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		                alert(jqXHR.responseText);
		                CloseWindow();
		            }
		        });
		        //查询审核意见
				var grid = nui.get("datagrid1");
				grid.load({processInstID:o.workitem.processInstID});
				grid.sortBy("time", "desc");
				
	            
            	purChaseMoney = parseFloat(o.purChaseMoney).toFixed(2);
				document.getElementById("purChaseMoney").innerHTML = o.purChaseMoney== null ?"<b>0.00</b>":"<b>"+formatNumber(o.purChaseMoney,"#,##.##") +"</b>";
				contnum=o.csContract.contnum;
				totalMoney=o.totalMoney;
            	document.getElementById("pempcost").innerHTML = o.pempcost== null ?"<b>0.00</b>":"<b><a href='javascript:void(0)' onclick='rdLaborDetailList()' title='点击查看明细'>" + formatNumber(o.pempcost,"#,##.##") + "</a>元</b>";
            	document.getElementById("pdircost").innerHTML = o.pdircost== null ?"<b>0.00</b>":"<b><a href='javascript:void(0)' onclick='pdircostDetailList("+ o.csContract.contractid +")' title='点击查看明细'>" + formatNumber(o.pdircost,"#,##.##") + "</a>元</b>";
            	
            	grid_csGatherFc.setData(o.csGatherFcs);
            	grid_csContractCost.load({criteria:{_expr:[{_property:"contnum",_op:"=",_value:o.csContract.contnum},
	        											   {_property:"rlny",_op:"between",_min: o.csReveForecast.setstart,_max: o.csReveForecast.setend }
	        											  ]
	    											}
										});
				grid_purCont.setData(o.purContracts);
	            grid_purSettle.setData(o.purSettles);
	            grid_presettle.setData(o.purPresettles);
	            grid_otherPurchase.setData(o.otherPurchases);
	            nui.get("workItemMemo").setValue(o.workItemMemo);
	            nui.get("purChaseYesOrNo").setValue(o.purChaseYesOrNo);
	            if(o.purChaseYesOrNo == "0"){
            		document.getElementById("cContract").style.display = "none";
            	}
	            projectids = o.csReveForecast.project;
	            selectRdProject(o.csContract.contnum);
            	//nui.get("projectids").setValue(o.csReveForecast.project);
            	projectid = o.csContract.projectid;
			},
			error:function(){}
		});
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
        
    function onOk(e) {
		if(!(form_ContAndReve.validate()&& opioionform.validate())){
			alert("表单信息填写不完整，请确认必输项是否填写！！");
			return;
		}
    	var filePaths1 = document.getElementsByName("uploadfile1").length;
    	for(var j=0;j<filePaths1;j++){
    		var a=document.getElementsByName("remarkList1")[j].value;
    		if(a==null||a==""){
    			alert("收入预估附件不可以为空！");
    			return false;
    		}
    	}
  		if(projectids != null &&  projectids !=''){
  			var project = nui.get("projectids").getValue();
  			if((project == null || project == '')&&projectiddata.length>0){
  				alert("请选择项目！")
  				return;
  			}
  		}
    	var filePaths = document.getElementsByName("uploadfile").length;
    	for(var j=0;j<filePaths;j++){
    		var a=document.getElementsByName("remarkList")[j].value;
    		if(a==null||a==""){
    			alert("处理意见附件不可以为空！");
    			return false;
    		}
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
  		//判断未报备的数据是否为空
			var rows = grid_otherPurchase.getData();
	    	for(var i = 0;i < rows.length;i ++){
				if(!rows[i].custname){
					alert("未签署采购的供应商名称不能为空");
					return;
				}
				if(!rows[i].purtype){
					alert("未签署采购的类型不能为空");
					return;
				}
				if(!rows[i].money){
					alert("未签署采购的金额不能为空");
					return;
				}
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
    	
    	var auditstatus = nui.get("auditstatus").getValue();
    	if(auditstatus==1){
	    	//checklist必须全部选中，如果不通过在备注栏说明原因
	    	var grid_checklist = nui.get("grid_checklist"); 
	    	var checklistrow = grid_checklist.getData();
	    	for(var i =0; i<checklistrow.length;i++){
	    		if(checklistrow[i].ischeck=="0"){
	    			alert("核查清单'"+checklistrow[i].checklistseq+checklistrow[i].checklistname+"'没有勾选！");
	    			return;
	    		}
	    	}
    	}
    	if(confirm("确认提交？")){
    		nui.get("saveReveProcess").disable();
			nui.get("closeWin").disable();
    		document.getElementById("fileCatalog1").value="csReveForecast";
        	form4.submit();
    	}
    }
    function SaveData1(){
    	document.getElementById("fileCatalog").value="MIS_OPINION";
    	form2.submit();
	}
	
    function SaveData() {
    	var project = nui.get("projectids").getValue();
    	var reve = form_ContAndReve.getData();
    	var syncflag=nui.get("syncflag").getValue();
    	var FinReve = formFinReve.getData();
    	FinReve.csReveForecastFin.reveno=finreveno;
    	FinReve.csReveForecastFin.revetype=finrevetype;
    	var finreves;
    	if(syncflag=="true"){
    		var setstartFin = nui.get("setstartFin").getText();
			var setendFin = nui.get("setendFin").getText();
	    	FinReve.csReveForecastFin.setstart = setstartFin==""?"":setstartFin.substring(0,4)+""+setstartFin.substring(4,6);
	    	FinReve.csReveForecastFin.setend = setendFin==""?"":setendFin.substring(0,4)+""+setendFin.substring(4,6);
    		FinReve.csReveForecastFin.status = "2";//财务审核环节为审核中
    		finreves = FinReve.csReveForecastFin;
    		reve.csReveForecast.newtype=finreves.newtype;
    	}
    	var opin = opioionform.getData();
    	var setstart = nui.get("setstart").getText();
		var setend = nui.get("setend").getText();
    	reve.csReveForecast.setstart = setstart==""?"":setstart.substring(0,4)+""+setstart.substring(4,6);
    	reve.csReveForecast.setend = setend==""?"":setend.substring(0,4)+""+setend.substring(4,6);
    	reve.csReveForecast.project = project ;
    	reve.csReveForecast.maconfirmdayStart = reve.csReveForecast.maconfirmdayStart=="" || reve.csReveForecast.maconfirmdayStart==null?reve.csReveForecast.maconfirmday:reve.csReveForecast.maconfirmdayStart; 
    	//拿到checklist填写的值
    	var grid_checklist = nui.get("grid_checklist"); 
    	var checklistrow = grid_checklist.getData();
    	var data_otherPurchases = grid_otherPurchase.getData();
        var json = nui.encode({csReveForecastFin:finreves,csReveForecast:reve.csReveForecast,misOpinion:opin.misOpinion,csIncomecheck:checklistrow,otherPurchases:data_otherPurchases});
        nui.ajax({
            url: "com.primeton.eos.ame_income.csReveForeProcess.reveForecastApplyProcess.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	var returnJson = nui.decode(text);
              	if(returnJson.exception == null){
                   	alert("提交成功！");
                   	CloseWindow("ok");
              	}else{
                   	alert("提交失败！");
                   	nui.get("saveReveProcess").enable();
					nui.get("closeWin").enable();
              	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                CloseWindow();
            }
        });
   	}
    
	
    //标准方法接口定义
    function CloseWindow(action) {           
        if (action == "close" && form.isChanged()) {
            if (confirm("数据被修改了，是否先保存？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    function onCancel(e) {
        CloseWindow("cancel");
    }
    
    //汇总金额处理
		function doCountSum(e){        	
            if (e.field == "contmoney") {//合同总金额
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value,'#,##.##') + "</b></div>";
            }
            if (e.field == "setamount") {//结算总金额
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value,'#,##.##') + "</b></div>";
            }
            if (e.field == "notaxmon") {//结算不含税总金额
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value,'#,##.##') + "</b></div>";
            }
            if (e.field == "accruedmoney") {//计提金额
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value,'#,##.##') + "</b></div>";
            }
            if (e.field == "notaxmoney") {//计提不含税金额
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value,'#,##.##') + "</b></div>";
            }
            if (e.field == "money") {//未签署采购金额
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value,'#,##.##') + "</b></div>";
                document.getElementById("purChaseMoney").innerHTML = "<b>" + formatNumber(parseFloat(parseFloat(purChaseMoney) + parseFloat(e.value)).toFixed(2),'#,##.##') + "</b> 元";
                document.getElementById("totalMoney").innerHTML = "<b>" + formatNumber(parseFloat(parseFloat(totalMoney) + parseFloat(e.value)).toFixed(2),'#,##.##') + "</b> 元";
            }
            //收款汇总格式化
            if(e.field=="fcsum"){
            	e.cellHtml = "<div align='right'><b>" + formatNumber(e.value,'#,##.##') + "</b></div>";
            }
            //收款汇总格式化
            if(e.field=="fcsum2"){
            	e.cellHtml = "<div align='right'><b>" + formatNumber(e.value,'#,##.##') + "</b></div>";
            }
            //收款汇总格式化
            if(e.field=="actsum"){
            	e.cellHtml = "<div align='right'><b>" + formatNumber(e.value,'#,##.##') + "</b></div>";
            }
            //收款汇总格式化
            if(e.field=="actsum2"){
            	e.cellHtml = "<div align='right'><b>" + formatNumber(e.value,'#,##.##') + "</b></div>";
            }
        }
        //成本汇总金额处理
        function doCostSum(e){
        	if(e.field=="concost" || e.field=="accruedmoney" || e.field=="setamount" || e.field=="directsum" || e.field=="allsum" || e.field=="actmonth" || e.field=="workamount" || e.field=="allmonth"){
            	e.cellHtml = "<div align='right'><b>" + formatNumber(e.value,'#,##.##') + "</b></div>";
            }
            if(e.field=="rlny"){
            	var s = "<div align='center'><b>"
	            s +=    "汇总：<br/>"
	                    + "</b></div>";
	            e.cellHtml = s;
            }
            countprofit();
        }
    function remove() {
    	var rows = grid_otherPurchase.getSelecteds();
        if (rows) {
        	for(var i=0; i<rows.length;i++){
                grid_otherPurchase.removeRow(rows[i], true);
        	}
        }else{
        	alert("请 至少选中一条记录！");
        }
    }
    function add() {    
        grid_otherPurchase.addRow({});
    }
    function dictpurstatus(e) {
		return nui.getDictText('AME_ORDERSTATUS',e.value);//设置业务字典值
	}
	function dictpurtype(e) {
		return nui.getDictText('AME_CONTYPE',e.value);//设置业务字典值
	}
	function dictGetCostType(e){
		return nui.getDictText('AME_CONTCOSTTYPE',e.value);
	}
		
	function dictGetServ(e){
		return nui.getDictText('SERV_NUM_TYPE',e.value);
	}
	
	function dictGetStatus(e){
		return nui.getDictText('AME_SETSTATUS',e.value);
	}
	function dictGetAccruedStatus(e){
		return nui.getDictText('AME_ACCRUEDSTATUS',e.value);
	}
	
	function dictContType(e){
		return nui.getDictText('AME_CONTYPE',e.value);
	}
	//选择供应商弹窗
	    function selectSupplier(e) {
	        var btnEdit = this;
	        nui.open({
				url:"<%=request.getContextPath() %>/ame_pur/PurSupplier/SelectSupplier.jsp",
				title: "选择列表",
				width: 600,
				height: 400,
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
			                //解决删除之后还有value的情况
							btnEdit.setText(data.custname);
							var rowData = {custname:data.custname};
							var row = grid_otherPurchase.getSelected();
            			    grid_otherPurchase.updateRow(row,rowData);
						}
					}
				}
			});
		}
		
		 function rdLaborDetailList(){
			var executeUrl = "/default/ame_income/reveConfirmProcess/erpPsReportList.jsp?contnum=" + contnum;
			window.open(executeUrl, "人力成本信息", "fullscreen=1");
	    }
	    function pdircostDetailList(contractid){
	    	nui.ajax({
				url:"com.primeton.eos.ame_income.csReveForeProcess.expandRdProject.biz.ext",
				type:"post",
				data:{contractid:contractid},
				contentType:"text/json",
				success:function (o){
					var executeUrl = "/default/ame_budget/detailPdircost.jsp?id=" + o.rdProject.projectId;
					window.open(executeUrl, "直接费用信息", "fullscreen=1");
				},
				error:function(){}
			});
	    }
		function getPurContDetail(e){
        	return "<a href='javascript:void(0)' onclick='chackPurContDetail();' title='点击查看'>" + e.value + "</a>";
        }
        function chackPurContDetail(){
	 		var selectRow = grid_purSettle.getSelected();
	 		//公用页面需要传进去id
			var executeUrl = "/default/ame_pur/PurContract/DetailPurContract.jsp?id=" + selectRow.purcontid;
		    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
			window.open(executeUrl, "合同详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
	    }
        function getPurContDetail1(e){
        	return "<a href='javascript:void(0)' onclick='chackPurContDetail1();' title='点击查看'>" + e.value + "</a>";
        }
        function chackPurContDetail1(){
	 		var selectRow = grid_presettle.getSelected();
	 		//公用页面需要传进去id
			var executeUrl = "/default/ame_pur/PurContract/DetailPurContract.jsp?id=" + selectRow.purcontid;
		    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
			window.open(executeUrl, "合同详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
	    }
	    function dictGatherStatus(e){
        	return nui.getDictText("AME_GATHERSTATUS",e.value);
        }
        function dictstatus1(e){
        	return nui.getDictText("MIS_GATHERBILL",e.value);
        }
        function saveWorkitemMemo(e){
        	var workItemMemo = nui.get("workItemMemo").getValue();
        	if(!workItemMemo){
        		return;
        	}
        	if(e==0){
        		var json ={workItemMemo:workItemMemo,workItemID:<%=workItemID %>};
        	}else if (e==1){
        		var json ={workItemMemo:null,workItemID:<%=workItemID %>};
        	}
        	nui.ajax({
				url:"com.primeton.eos.ame_income.csReveForeProcess.savesaveWorkitemMemo.biz.ext",
				type:"post",
				data:json,
				contentType:"text/json",
				success:function (o){
					var o = nui.decode(o);
	              	if(o.exception == null){
	              		if(e==0){
							alert("保存成功！");
	              		}else{
							alert("清除成功！");
							nui.get("workItemMemo").setValue(null);
	              		}
					}else{
						if(e==0){
							alert("保存失败！");
	              		}else{
							alert("清除失败！");
	              		}
					}
				},
				error:function(){}
			});
        }
        
         //选择结算起止年月触发
        function selectYM(){
        	var start = nui.get("setstart").getText();
        	var end = nui.get("setend").getText();
        	var contnum_s = document.getElementById("contnum").innerHTML;
        	grid_csContractCost.load({criteria:{_expr:[{_property:"contnum",_op:"=",_value:contnum_s},
        											   {_property:"rlny",_op:"between",_min:start,_max:end}
        											  ]
    											}
									});
			changeProjectCost();
        }
        //合同成本人力成本明细
        function concostDetail(e){
        	if(e.value == 0 || e.value == null){
        		return e.value;
        	}else
        	{
        		return "<a href='javascript:void(0)' onclick='doViewconcost(\""+e.record.contnum+"\",\"\",\""+e.record.rlny+"\");' title='点击查看'>" + e.value + "</a>";
    		}
		}
		//项目成本人力明细
		function concostPDetail(e){
        	if(e.value == 0 || e.value == null){
        		return e.value;
        	}else
        	{
        		return "<a href='javascript:void(0)' onclick='doViewconcost(\"\",\""+e.record.projectid+"\",\""+e.record.rlny+"\");' title='点击查看'>" + e.value + "</a>";
    		}
		}
		function doViewconcost(contnum,projectid,rlny){
			var startdate = rlny.substring(0,4)+'-'+rlny.substring(4,6)+'-01';
			var enddate = rlny.substring(0,4)+'-'+rlny.substring(4,6)+'-'+getLastDayOfMonth(rlny.substring(0,4),rlny.substring(4,6));
			var start='&startdate=',end='&enddate=';
			if(projectid == null || projectid == ''){
				start='&startdate_f=';
				end='&enddate_f=';
			}
			var executeUrl = "/default/ame_budget/detailPempcost.jsp?contnum=" + contnum+"&id="+projectid+start+startdate+end+enddate;
			window.open(executeUrl, "人力成本明细", "fullscreen=1");
		}
		//直接费用明细
		function directsumDetail(e){
			if(e.value == 0 || e.value == null){
        		return e.value;
        	}else
        	{
			 return "<a href='javascript:void(0)' onclick='doViewdirectsum(\""+e.record.contnum+"\",\"\",\""+e.record.rlny+"\");' title='点击查看'>" + e.value + "</a>";
			}
		}
		//项目成本直接费用明细
		function directsumPDetail(e){
			if(e.value == 0 || e.value == null){
        		return e.value;
        	}else
        	{
			 return "<a href='javascript:void(0)' onclick='doViewdirectsum(\"\",\""+e.record.projectid+"\",\""+e.record.rlny+"\");' title='点击查看'>" + e.value + "</a>";
			}
		}
		function doViewdirectsum(contnum,projectid,rlny){
			var startdate = rlny.substring(0,4)+'/'+rlny.substring(4,6)+'/01';
			var enddate = rlny.substring(0,4)+'-'+rlny.substring(4,6)+'-'+getLastDayOfMonth(rlny.substring(0,4),rlny.substring(4,6));
			var executeUrl = "/default/ame_budget/detailPdircost.jsp?contnum=" + contnum+"&id="+projectid+"&startdate="+startdate+"&enddate="+enddate;
			window.open(executeUrl, "直接费用明细", "fullscreen=1");
		}
		
		//计提费用明细
		function accruedmoneyDetail(e){
			if(e.value == 0 || e.value == null){
        		return e.value;
        	}else
        	{
			 	return "<a href='javascript:void(0)' onclick='doViewaccruedmoney(\""+e.record.contnum+"\",\""+e.record.rlny+"\");' title='点击查看'>" + e.value + "</a>";
			}
		}
		function doViewaccruedmoney(contnum,rlny){
			var startdate = rlny.substring(0,4)+'-'+rlny.substring(4,6)+'-01';
			var enddate = rlny.substring(0,4)+'-'+rlny.substring(4,6)+'-'+getLastDayOfMonth(rlny.substring(0,4),rlny.substring(4,6));
			var executeUrl = "/default/ame_income/reveConfirmProcess/purCostdetail.jsp?contnum=" + contnum+"&startdate="+startdate+"&enddate="+enddate;
			window.open(executeUrl, "计提费用明细", "fullscreen=1");
		}
		
		//结算费用明细
		function setamountDetail(e){	
			if(e.value == 0 || e.value == null){
        		return e.value;
        	}else
        	{
			 	return "<a href='javascript:void(0)' onclick='doViewsetamount(\""+e.record.contnum+"\",\""+e.record.rlny+"\");' title='点击查看'>" + e.value + "</a>";
			}
		}
		function doViewsetamount(contnum,rlny){
			var startdate = rlny.substring(0,4)+'-'+rlny.substring(4,6)+'-01';
			var enddate = rlny.substring(0,4)+'-'+rlny.substring(4,6)+'-'+getLastDayOfMonth(rlny.substring(0,4),rlny.substring(4,6));
			var executeUrl = "/default/ame_income/reveConfirmProcess/purCostdetail.jsp?contnum=" + contnum+"&startdate="+startdate+"&enddate="+enddate+"&outcosttype=2";
			window.open(executeUrl, "结算费用明细", "fullscreen=1");
		}
		
		//根据月末查询本月最后一天
		function getLastDayOfMonth(year,month) 
		{ 
			//获取本年本月的第一天日期 
			var date = new Date(year,month-1,'01'); 
			//设置日期 
			date.setDate(1); 
			//设置月份 
			date.setMonth(date.getMonth() + 1); 
			//获取本月的最后一天 
			cdate = new Date(date.getTime() - 1000*60*60*24); 
			//打印某年某月的最后一天 
			//alert(cdate.getFullYear()+"年"+(Number(cdate.getMonth())+1)+"月最后一天的日期:"+cdate.getDate()+"日"); 
			//返回结果 
			return cdate.getDate(); 
		}
		
		function changeisCLoseProject(){
			var change = nui.get("isCLoseProject").getValue();
			if(change=="true"){
			}else{
				nui.get("ocenddate").setValue(null);
			}
		}
		var laborcountinto = 0;
		function countprofit(){
	  		var actsum2 = parseFloat(nui.get("actsum2").getValue()).toFixed(2);;//不含税确认金额
			var laborcountthis =nui.get("labormonth").getValue();//本次结算工作量
	  		//计算成本
        	var rows = grid_csProjectCost.getData ();
        	var allsum = 0;
        	laborcountinto = 0;
        	for (var i = 0 ; i < rows.length ; i++){
        		if(rows[i].allsum != null){
        			allsum+=rows[i].allsum;
        		}
        		if(rows[i].allsum != null){
        			laborcountinto+=rows[i].allmonth;
        		}
        	}
        	//写毛利profitsum
        	document.getElementById("profitsum").innerHTML = actsum2 == null || actsum2 == 0?"":formatNumber(actsum2,'#,##.##');
        	//写毛利率profitcost
	    	document.getElementById("profitcost").innerHTML = allsum == null || allsum == 0?"":formatNumber(allsum,'#,##.##');
    		//写毛利profit
        	document.getElementById("profit").innerHTML = actsum2 == null || actsum2 == 0?"":formatNumber(actsum2-allsum,'#,##.##');
        	//写毛利率profitRate
	    	document.getElementById("profitRate").innerHTML = actsum2 == null || actsum2 == 0?"":formatNumber((actsum2-allsum)*100/actsum2,'#,##.##')+'%';
    		//写毛利率profitcost
	    	document.getElementById("profitcost").innerHTML = allsum == null || allsum == 0?"":formatNumber(allsum,'#,##.##');
    		//写本次结算工作量laborcountthis
	    	document.getElementById("laborcountthis").innerHTML = laborcountthis == null || laborcountthis == 0?"":formatNumber(laborcountthis,'#,##.##')+"人月";
        	//写本次本次结算实际投入工作量laborcountthis
	    	document.getElementById("laborcountinto").innerHTML = laborcountinto == null || laborcountinto == 0?"":formatNumber(laborcountinto,'#,##.##')+"人月";
	    	//写本次本次结算实际投入工作量laborcountthis
	    	//nui.get("laborcountinto1").setValue(laborcountinto);
	    	//写本次本次结算实际投入工作量laborcountthis
	    	document.getElementById("laborcountinto2").innerHTML = laborcountinto == null || laborcountinto == 0?"":formatNumber(laborcountinto,'#,##.##')+"人月";
        	//写本次本次工作量偏差laborcountoffset
	    	document.getElementById("laborcountoffset").innerHTML = laborcountthis == null || laborcountthis == 0?"":formatNumber(laborcountthis-laborcountinto,'#,##.##')+"人月";
        	//本次确认毛利率
			var profitRate = document.getElementById("profitRate").innerHTML.replace(/%/, "").replace(/,/, "");
			if (profitRate == null || profitRate == ''){
				profitRate = 0 ;
			}
			//预算毛利率
			var budgetrate = document.getElementById("bugetprofitRate").innerHTML.replace(/%/, "").replace(/,/, "");
			//写毛利率偏差profitRateoffset
			document.getElementById("profitRateoffset").innerHTML = profitRate == null || profitRate == 0?"":formatNumber(profitRate - budgetrate,'#,##.##')+'%';
			var profitRateoffset = budgetrate == null || budgetrate == 0?0:(profitRate - budgetrate);
			//本次确认毛利率低于20%
			if(profitRate<20){
				document.getElementById("profitRate").style.color="red";
				document.getElementById("profitRate").style.fontSize="18px";
			}else{
				document.getElementById("profitRate").style.color="black";
				document.getElementById("profitRate").style.fontSize="";
			}
			//预算偏差大于15%以上
			if(profitRateoffset > 15 || profitRateoffset < -15){
				document.getElementById("profitRateoffset").style.color="red";
				document.getElementById("profitRateoffset").style.fontSize="18px";
			}else{
				document.getElementById("profitRateoffset").style.color="black";
				document.getElementById("profitRateoffset").style.fontSize="";
			}
    	}
    	//动态生成项目选项
    	function selectRdProject(contnum){
    		projectiddata = [];
    		nui.ajax({
    			url:"com.primeton.rdmgr.project.rdworklistbiz.queryRdProjects.biz.ext",
    			data: {"contnum": contnum},
    			type:"post",
    			contentType:"text/json",
                async :false,
    			success:function(data){
    				if(data.projects.length>=1){
    					for (var i=0;i<data.projects.length;i++){
   				         	projectiddata.push({id: data.projects[i].projectId,text: data.projects[i].projectName});
    					
    					}
    					document.getElementById("project").style.display=""
    				}else{
    					document.getElementById("project").style.display="none"
    				}
					nui.get("projectids").setValue(projectids);
					nui.get("projectids").setData(projectiddata);
    			},
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
			});
			changeProjectCost();
    	}
    	//多选项目触发事件
    	function changeProjectCost(){
    		var project = '';
    		if (nui.get("projectids").getValue() == '' || nui.get("projectids").getValue() == null){
    			project = nui.get("projectids").getValue();
    		}else{
    			project = nui.get("projectids").getValue();
    		}
    		if(project == null || project == ''){
    			return;
    		}
        	var start = nui.get("setstart").getText();
        	var end = nui.get("setend").getText();
        	var grid_csProjectCost = nui.get("grid_csProjectCost");
    		grid_csProjectCost.load({manage:{projectid:project,start:start,end:end}});  
    		//写入预算毛利率bugetprofitRate
    		nui.ajax({
    			url:"com.primeton.eos.ame_income.csReveForeProcess.getBudgetrate.biz.ext",
    			data: {"projectid": project},
    			type:"post",
    			contentType:"text/json",
                async :false,
    			success:function(data){
					document.getElementById("bugetprofitRate").innerHTML = data.budgetrate == null || data.budgetrate == 0?"":formatNumber(data.budgetrate*100,'#,##.##')+'%';
				},
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
			});         
    	}
    	//项目编号链接
    	function getProjectNameDetail(e){
	    	if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkProjectName();' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function checkProjectName(){
	    	var selectRow = grid_csProjectCost.getSelected();
			var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectid;
			window.open(executeUrl);
	    }
	    
	    function calThreeMoney(){
	    	//实际确认金额含税
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
			var sum  = parseFloat(parseFloat(actproductsum)+parseFloat(actservicesum)+parseFloat(actmasum)).toFixed(2);
			nui.get("actsum").setValue(sum);
			//不含税
			var productrate = nui.get("productrate").getValue();
			var servicerate = nui.get("servicerate").getValue();
			var marate = nui.get("marate").getValue();
			var actproductsum2 = parseFloat(actproductsum/(1+productrate)).toFixed(2);
	    	var actservicesum2 = parseFloat(actservicesum/(1+servicerate)).toFixed(2);
	    	var actmasum2 = parseFloat(actmasum/(1+marate)).toFixed(2);
	    	nui.get("actproductsum2").setValue(actproductsum2);
	    	nui.get("actservicesum2").setValue(actservicesum2);
	    	nui.get("actmasum2").setValue(actmasum2);
	    	var bhssum  = parseFloat(parseFloat(actproductsum2)+parseFloat(actservicesum2)+parseFloat(actmasum2)).toFixed(2);
	    	nui.get("actsum2").setValue(bhssum);
	    	
	  	}
	    function calThreeMoneyFin(){
	    	//实际确认金额含税
			var actproductsum = nui.get("actproductsumFin").getValue();
			if(!actproductsum){
				actproductsum=0;
			}
			var actservicesum = nui.get("actservicesumFin").getValue();
			if(!actservicesum){
				actservicesum=0;
			}
			var actmasum = nui.get("actmasumFin").getValue();
			if(!actmasum){
				actmasum=0;
			}
			var sum  = parseFloat(parseFloat(actproductsum)+parseFloat(actservicesum)+parseFloat(actmasum)).toFixed(2);
			nui.get("actsumFin").setValue(sum);
			//不含税
			var productrate = nui.get("productrateFin").getValue();
			var servicerate = nui.get("servicerateFin").getValue();
			var marate = nui.get("marateFin").getValue();
			var actproductsum2 = parseFloat(actproductsum/(1+productrate)).toFixed(2);
	    	var actservicesum2 = parseFloat(actservicesum/(1+servicerate)).toFixed(2);
	    	var actmasum2 = parseFloat(actmasum/(1+marate)).toFixed(2);
	    	nui.get("actproductsum2Fin").setValue(actproductsum2);
	    	nui.get("actservicesum2Fin").setValue(actservicesum2);
	    	nui.get("actmasum2Fin").setValue(actmasum2);
	    	var bhssum  = parseFloat(parseFloat(actproductsum2)+parseFloat(actservicesum2)+parseFloat(actmasum2)).toFixed(2);
	    	nui.get("actsum2Fin").setValue(bhssum);
	    	
	  	}
	  	function changeischeck(e){
	    	if(e.value=="true"){
	    		document.getElementById("finreve").style.display="";
	    	}else{
	    		document.getElementById("finreve").style.display="none";
	    	}
	    }
	    
	    function changeMaday(e){
	    	if(e.value){
	    		nui.get("maconfirmdayStart").setValue(e.value);
	    	}
	    }
	    function changeday(e){
	    	if(e.value){
	    		nui.get("confirmdayStartFin").setValue(e.value);
	    	}
	    }
	    
	    function changeratio(){
	    	
	    	var ratioFin = nui.get("ratioFin").getValue();
	    	
	    	nui.get("actmasumFin").setValue(parseFloat(masum)*parseFloat(ratioFin));
	    	nui.get("actservicesumFin").setValue(parseFloat(servmon)*parseFloat(ratioFin));
	    	nui.get("actproductsumFin").setValue(parseFloat(prodmon)*parseFloat(ratioFin));
	    	calThreeMoneyFin();
	    }
	    
	    var tip = new mini.ToolTip();
		tip.set({
		    target: document,
		    selector: '#tooltips',
		    placement:"right",
		    onbeforeopen: function (e) {            
		        e.cancel = false;
		    },
		    onopen: function (e) { 
		           var el=e.element;
		           var id=el.id;
		           console.log($("#"+id))
		           var content="请环节处理人在判断该合同如果没有后续收入确认时,设置项目的外部成本日期";
		           tip.setContent(content);
		           $(".mini-tooltip-inner").css("background","#E9F4FE");
		    }
		});
		
		
		//勾选跟管报确认收入作减值
		function selectFinreve(){
			var rows = grid_finincome.getSelecteds();
			var actproductsum=0;//产品金额
			var actservicesum=0;//服务金额
			var actmasum=0;//ma金额
			var labormonth=0;//确认工作量
			var labormonthact=0;//实际工作量
			for(var i=0;i<rows.length;i++){
				if(rows[i].actproductsum!=null&&rows[i].actproductsum!=""){
					actproductsum = rows[i].actproductsum+actproductsum;
				}
				if(rows[i].actservicesum!=null&&rows[i].actservicesum!=""){
					actservicesum = rows[i].actservicesum+actservicesum;
				}
				if(rows[i].actmasum!=null&&rows[i].actmasum!=""){
					actmasum = rows[i].actmasum+actmasum;
				}
				if(rows[i].labormonth!=null&&rows[i].labormonth!=""){
					labormonth = rows[i].labormonth+labormonth;
				}
				if(rows[i].labormonthact!=null&&rows[i].labormonthact!=""){
					labormonthact = rows[i].labormonthact+labormonthact;
				}
			}
			var maactproductsum = nui.get("actproductsum").getValue();//管报产品收入
			var maactservicesum = nui.get("actservicesum").getValue();//管报服务收入
			var maactmasum = nui.get("actmasum").getValue();//管报ma收入
			if(maactproductsum==null||maactproductsum==""){
				maactproductsum=0;
			}
			if(maactservicesum==null||maactservicesum==""){
				maactservicesum=0;
			}
			if(maactmasum==null||maactmasum==""){
				maactmasum=0;
			}
			nui.get("actproductsumFin").setValue(maactproductsum-actproductsum);
			nui.get("actservicesumFin").setValue(maactservicesum-actservicesum);
			nui.get("actmasumFin").setValue(maactmasum-actmasum);
			
			var malabormonth = nui.get("labormonth").getValue();
			if(malabormonth==null||malabormonth==""){
				malabormonth=0;
			}
			var malabormonthact =laborcountinto;
			
			nui.get("labormonthFin").setValue(malabormonth-labormonth);
			nui.get("laborcountinto1").setValue(malabormonthact-labormonthact);
			calThreeMoneyFin();//计算不含税
		}
		
		//将经营收入覆盖财务收入
		function syncjysr(e){
			nui.confirm("是否确认将经营收入覆盖财务收入？","操作提示",function(o){
				if("ok"==o){
					var maactproductsum = nui.get("actproductsum").getValue();//管报产品收入
					var maactservicesum = nui.get("actservicesum").getValue();//管报服务收入
					var maactmasum = nui.get("actmasum").getValue();//管报ma收入
					if(maactproductsum==null||maactproductsum==""){
						maactproductsum=0;
					}
					if(maactservicesum==null||maactservicesum==""){
						maactservicesum=0;
					}
					if(maactmasum==null||maactmasum==""){
						maactmasum=0;
					}
					nui.get("actproductsumFin").setValue(maactproductsum);
					nui.get("actservicesumFin").setValue(maactservicesum);
					nui.get("actmasumFin").setValue(maactmasum);
					
					var malabormonth = nui.get("labormonth").getValue();
					if(malabormonth==null||malabormonth==""){
						malabormonth=0;
					}
					var malabormonthact =laborcountinto;
					
					nui.get("labormonthFin").setValue(malabormonth);
					nui.get("laborcountinto1").setValue(malabormonthact);
					calThreeMoneyFin();//计算不含税
				}
			})
		}
</script>
</body>
</html>
