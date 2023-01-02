<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
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
<title>发起收入确认申请</title>
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
	<div class="mini-panel" title="发起收入确认申请" style="width: auto">
	<!-- 提示信息展示 -->
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>合同基本信息</legend>
				<form id="form_cont" method="post">
					<input name="csContract.contractid" id="contractid" class="nui-hidden"/>
					<div style="padding:5px;">
						<table style="table-layout:fixed;" id="table_file">
							<tr>
								<td align="right" style="width:130px">合同名称：</td>
								<td><input name="csContract.projectname" id="projectname"  class="nui-buttonedit" style="width:300px" onbuttonclick="selectCont" allowInput="false"/></td>
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
								<td align="right" style="width:130px">合同收入类型：</td>
								<td name="cscontract.incometype" id="incometype" style="width:190px"  required="true"></td>
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
				</form>
		<%--<jsp:include page="/ame_common/detailFile.jsp"/>--%>
		</fieldset>
		 <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>选择合同收入记录列表</legend>
            	<div id="grid_income" class="nui-datagrid" style="width:100%;height:auto;" allowResize="false" dataField="csReveForecasts"
        	 		url="com.primeton.eos.ame_income.csReveForecast.queryIncome.biz.ext" allowCellSelect="true"  showPager="false" idField="appid"
        	 		onselectionchanged="selectionChanged"  multiSelect="false">
				<div property="columns">
					<div type="checkcolumn" width="25"></div>
					<div field="contnum" width="0">合同编号</div>
					<div field="reveno" width="60" headerAlign="center" align="center" headerAlign="center" >收入确认次数</div>
					<div field="reveproof" width="80" headerAlign="center" align="center" headerAlign="center" renderer="dictproof">预计收入确认证据</div>
					<div field="revetimedesc" width="80" headerAlign="center" align="left" headerAlign="center">收入确认时点描述</div>
					<div field="newyearmonth" width="70" headerAlign="center" align="center" headerAlign="center" >预计确认年月</div>
<!-- 					<div field="newmonthperiod" width="65" align="center"  headerAlign="center" renderer="dictmonth">预计确认旬度</div> -->
					<div field="fcsum" width="70" align="right" headerAlign="center" dataType="currency" >预计确认金额</div>	
					<div field="status" width="70" align="center" headerAlign="center" renderer="dictstatus">目前确认状态</div>		
					<div field="actsum" width="70" align="right" headerAlign="center" dataType="currency" >实际确认金额</div>	
					<div field="fcreverate" width="50" align="center" headerAlign="center" numberFormat="p1">本次确认比例</div>	
					<div field="maconfirmday" width="70" align="center" headerAlign="center" >确认日期</div>	
					<div field="contorderno" width="70" align="center" headerAlign="center" >订单编号</div>	
					<div field="memo" width="70" align="center" headerAlign="center" >说明</div>		
<!-- 					<div field="actreveproof" width="70" align="center" headerAlign="center" renderer="dictproof">实际收入确认证据</div>		 -->
					<div field="processinstid" width="0" >流程实例ID</div>	
					<div field="productsum" width="0" >预计产品</div>	
					<div field="servicesum" width="0" >预计服务</div>	
					<div field="masum" width="0" >预计MA</div>	
					<div field="actproductsum" width="0" >实际产品</div>	
					<div field="actservicesum" width="0" >实际服务</div>	
					<div field="actmasum" width="0" >实际MA</div>	
					<div field="contorderno" width="0" >订单id</div>	
				</div>
			</div>
        </fieldset>
        <input id="incometypeTemp" class="nui-hidden" />
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>本次收入确认信息</legend>
			<form id="form_Reve" method="post">
				<input name="csReveForecast.reveid" id="reveid" class="nui-hidden" />
				<input name="csReveForecast.incometype" id="incometype1" class="nui-hidden" /><!-- 用于判断流程环节事业部领导/技术负责人 -->
				<input name="csReveForecast.purstatus" id="purstatus" class="nui-hidden" /><!-- 用于暂时保存和发起流程的区别标志位 -->
				<input name="csReveForecast.fileids" id="fileids"  class="nui-hidden"/><!-- 附件上传 -->
				<input name="csReveForecast.reveno" id="reveno1" class="nui-hidden"/>
				
				<input name="csReveForecast.fcsum" id="fcsum" class="nui-hidden"/>
				<input name="csReveForecast.productsum" id="productsum" class="nui-hidden" />
				<input name="csReveForecast.servicesum" id="servicesum" class="nui-hidden" />
				<input name="csReveForecast.masum" id="masum" class="nui-hidden"/>
				<input name="csReveForecast.status" id="status" class="nui-hidden"/>
				<input name="csReveForecast.maconfirmdayStart" id="maconfirmdayStart" class="nui-hidden"/>
				
				<div style="padding:5px;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:130px">收入确认次数：</td>
							<td style="width:160px" name="csReveForecast.reveno" id="reveno" /></td>
							<td align="right" style="width:130px">收入类型：</td>
							<td style="width:130px" name="csReveForecast.revetype" id="revetype" /></td>
							<td align="right" style="width:130px">预计确认年月：</td>
							<td style="width:250px" name="csReveForecast.newyearmonth" id="newyearmonth" /></td>
						</tr>
						<tr>
							<td align="right" style="width:130px">预计确认金额：</td>
							<td style="width:160px" id="fcsum1"/></td>
							<td align="right" style="width:130px">本次确认比例：</td>
							<td style="width:130px" name="csReveForecast.fcreverate" id="fcreverate"/></td>
							<td align="right" style="width:130px">预计收入确认证据：</td>
							<td style="width:250px" name="csReveForecast.reveproof" id="reveproof" /></td>
						</tr>
						<tr>
							<td align="right" style="width:130px">预计确认产品额：</td>
							<td style="width:160px" id="productsum1"/></td>
							<td align="right" style="width:130px">预计确认服务额：</td>
							<td style="width:130px"  id="servicesum1"/></td>
							<td align="right" style="width:130px">预计确认MA额：</td>
							<td style="width:250px" id="masum1" /></td>
						</tr>
						<tr>
							<td align="right" style="width:130px">收入确认时点描述：</td>
							<td name="csReveForecast.revetimedesc" id="revetimedesc" colspan="5"/></td>
						</tr>
						<tr id="setyearmonth" style="display: none;">
							<td align="right" style="width:100px">本次结算开始年月：</td>
							<td style="width:160px"><input name="csReveForecast.setstart" id="setstart" required="true" class="nui-monthpicker" format="yyyyMM" style="width:120px" allowInput="false" onvaluechanged="selectYM"/></td>
							<td align="right" style="width:100px">本次结算结束年月：</td>
							<td style="width:160px"><input name="csReveForecast.setend" id="setend" required="true" class="nui-monthpicker" format="yyyyMM" style="width:120px" allowInput="false" onvaluechanged="selectYM"/></td>
							<td align="right" style="width:100px">本次结算人月工作量：</td>
							<td style="width:250px"><input name="csReveForecast.labormonth" id="labormonth" required="true" class="nui-spinner" changeOnMousewheel="false" style="width:120px" format="n2" showbutton="false" minValue="0" maxValue="1000"/></td>
						</tr>
						<tr>
							<td align="right" style="width:130px">实际确认产品额：</td>	
							<td style="width:160px"><input name="csReveForecast.actproductsum" id="actproductsum" class="nui-spinner" changeOnMousewheel="false" style="width:120px" format="n2" showbutton="false" onblur="calThreeMoney"  minValue="-100000000" maxValue="100000000"/></td>
							<td align="right" style="width:130px">实际确认服务额：</td>
							<td style="width:130px"><input name="csReveForecast.actservicesum" id="actservicesum" class="nui-spinner" changeOnMousewheel="false" style="width:120px" format="n2" showbutton="false" onblur="calThreeMoney"  minValue="-100000000" maxValue="100000000"/></td>
							<td align="right" style="width:130px">实际确认MA额：</td>
							<td style="width:250px"><input name="csReveForecast.actmasum" id="actmasum" class="nui-spinner" changeOnMousewheel="false" style="width:120px" format="n2" showbutton="false" onblur="calThreeMoney"  minValue="-100000000" maxValue="100000000"/></td>
						</tr>
						<tr>
							<td align="right" style="width:130px">实际确认金额：</td>
							<td style="width:160px"><input name="csReveForecast.actsum" id="actsum" class="nui-spinner" changeOnMousewheel="false" style="width:120px" required="true" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
							<td align="right" style="width:130px">确认日期：</td>
							<td style="width:130px"><input name="csReveForecast.maconfirmday" id="confirmday" class="nui-datepicker" required="false" style="width:120px" /></td>
							<td align="right" style="width:130px">实际收入确认证据：</td>
							<td style="width:250px"><input name="csReveForecast.actreveproof" id="actreveproof" class="nui-dictcombobox" dictTypeId="MIS_INCOMECONV" multiSelect="true" required="true" style="width:200px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:130px">收入确认相关说明：</td>
							<td colspan="5"><input name="csReveForecast.memo" id="memo" class="nui-textarea" style="width:100%"/></td>
						</tr>
		                <tr  id = "isShowjsLeader">
		                	<td style="width:150px;height:auto;" align="right">部门技术负责审批人：</td>
		                	<td colspan="5"><input name="csReveForecast.jscheckerid" id="jscheckerid" class="mini-textboxlist" textField="empname" valueField="userid" searchField="name"  required="true" style="width:200px;" allowinput="true" url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext"/>
		                	</td>
		                </tr>
						<tr>
		                    <td style="width:150px;height:auto;" align="right">部门销售主管审核人：</td>
		                    <td colspan="5"><input name="csReveForecast.checkerid" id="checkerid" class="mini-textboxlist" textField="empname" valueField="userid" searchField="name" required="true" style="width:200px;" allowinput="true" url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext"/>
		                    (提示：业务单元内销售的收入确认，审核人为业务单元负责人，销售为业务单元负责人的情况，审核人为事业部总经理！)
		                    </td>
		                </tr>
					</table>
					<table>
						<tr>
							<td align="right" style="width:200px">是否该合同最后一次收入确认:
							</td>
							<td>
								<%--<input class="nui-checkbox" id="isCLoseProject" name="csReveForecast.isCLoseProject" style="width:200px" text="是否为最后一次收入确认？">--%>
								<input class="nui-radiobuttonlist" name="csReveForecast.isCLoseProject" id="isCLoseProject" repeatItems="2" repeatLayout="table" repeatDirection="Horizontal" textField="text" valueField="id" required="true" style="width:200px;" data="[{'id': 'true','text': '是'},{'id': 'false','text': '否'}]">
							</td>
						</tr>
					</table>
				</div>
			</form>
			<span>&nbsp;&nbsp;请上传收入确认证据图片或扫描件!</span>
		<jsp:include page="/ame_common/addFiles.jsp"/>
		</fieldset>
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
				<div title="该合同成本数据" style="width:100%;" visible="false">
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
		
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
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
		<jsp:include page="/ame_common/checkList.jsp"/>	
		<div id="form_purChaseYesOrNo">
			<table style="table-layout:fixed;">
				<tr>
					<td style="width:215px;" align="right">是否有暂未签署或未报备采购：</td>
					<td style="width:140px;">  
						<input id="purChaseYesOrNo" class="nui-dictcombobox"  style="width:80px;" required="true" dictTypeId="MIS_YN" onvaluechanged="changepurChase"/>
					</td>
				</tr>
			</table>
		</div>
		<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;display: none">
			<legend>未签署采购/未计提情况报备</legend>
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
	            	<div type="indexcolumn" width="80" align="center" headerAlign="center" cellCls="myIndex">编号</div>
	                <div field="custname" width="280" displayField="custname" align="left" headerAlign="center">供应商
						<input property="editor" class="nui-buttonedit" onbuttonclick="selectSupplier" style="width:100%;"/>
					</div>
	                <div field="purtype" width="200" align="center" headerAlign="center" renderer="dictContType">采购类型
						<input property="editor" class="nui-dictcombobox"  dictTypeId="AME_CONTYPE"/>
					</div>
	                <div field="money"  width="200" align="right"  headerAlign="center" dataType="currency" summaryType="sum">未签署采购/未计提金额
						<input property="editor" class="nui-spinner" allowLimitValue="false" increment="0" inputStyle="text-align:right;" showbutton="false"/>
					</div>
	                <div field="memo"  width="350" align="left" headerAlign="center">说明
						<input property="editor" class="nui-textbox" />
					</div>
	            </div>
	        </div>
		</fieldset>
		<form id="opioionform" method="post">
	        <div style="padding:5px;" id="opinionHide">
	            <table style="table-layout:fixed;">
	            	<tr id="salesEdit">
	                    <td style="width:150px;" align="right">审核结果：</td>
	                    <td style="width:250px;">  
							<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
	                    </td>
	                </tr>
	                <tr>
	                    <td style="width:150px;height:auto;" align="right">任务处理说明：</td>
	                    <td colspan="3">
	                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height:60px;"/>
	                    </td>
	                </tr>
	            </table>
	        </div>
    	</form>
	</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<span  style="float:left;">发起流程前，请仔细阅读《<a href="javascript:void(0)" onclick="noticeDetail();" title="点击查看">收入确认审核告知</a>》！</span>
	<a class="nui-button" onclick="onOk('1')" id="creatReveProcess" style="width:80px;margin-right:20px;">发起流程</a>
	<a class="nui-button" onclick="onOk('0')" id="saveReveProcess"style="width:80px;margin-right:20px;">暂时保存</a>
	<a class="nui-button" onclick="onCancel('cancel')" id="cancelReveProcess" style="width:80px;margin-right:220px;">关闭</a>
</div>
<script type="text/javascript">
        nui.parse();
        
	  	var form_cont = new nui.Form("form_cont");
	  	var form_Reve = new nui.Form("form_Reve");
		var grid_income = nui.get("grid_income");
		
		var grid_csGatherFc = nui.get("grid_csGatherFc");
		var grid_csContractCost = nui.get("grid_csContractCost");
		var grid_csProjectCost = nui.get("grid_csProjectCost");
		var grid_otherPurchase = nui.get("grid_otherPurchase");
		var opioionform = new nui.Form("opioionform");
		var fcsum = "";
		var salename = "";
        var saleid = "";
        var jsname = "";
        var jsid = "";
        var purChaseMoney = 0;
        var contnum="";
        var totalMoney="";
        var projectid="";
        var projectiddata =[];
        var projectids="";
        var isFin = false ;//以财务身份登陆，有权限发起仅已管报确认的收入
        
        //判断是否为财务
        <%
        	UserObject user = (UserObject)session.getAttribute("userObject");
    		Map attr = user.getAttributes();
        	DataObject[] roles = (DataObject[])attr.get("roles");
        	Boolean isFin = false; //是否财务
        	for(int i=0;i < roles.length;i++){
			   	if(roles[i].getString("roleid").equals("finance")){
					isFin = true;
				}
			}
         %>
    	var isFins = "<%=isFin %>";
    	if(isFins == "true"){
    		isFin=true;
    	}
	  	//合同页面点击发起流程按钮传参接收调用方法
// 	  	var contnum = '2016-S073';
	  	var contnum = '<%=request.getParameter("id") %>';
	  	if(contnum != null && contnum != "" && contnum != "null"){
	  		nui.get("projectname").disable();
	  		nui.ajax({
    			url:"com.primeton.eos.ame_income.csReveForeProcess.queryContByContnum.biz.ext",
    			data: {contnum:contnum},
    			type:"post",
    			contentType:"text/json",
    			success:function(data){
    				//合同基本信息
    				nui.get("projectname").setValue(data.csContract.projectname);
                    nui.get("projectname").setText(data.csContract.projectname);
                	nui.get("contractid").setValue(data.csContract.contractid);
                	document.getElementById("contnum").innerHTML = data.csContract.contnum == null ?"":data.csContract.contnum;
                	document.getElementById("contsum").innerHTML = data.csContract.contsum == null ?"":formatNumber(data.csContract.contsum,'#,##.##');
                	document.getElementById("salename").innerHTML = data.csContract.salename == null ?"":data.csContract.salename;
					document.getElementById("incometype").innerHTML = nui.getDictText('MIS_HTINCOMETYPE',data.csContract.incometype);
					document.getElementById("csContract.servmon").innerHTML = data.csContract.servmon== null ?"":formatNumber(data.csContract.servmon,'#,##.##');
	                document.getElementById("csContract.prodmon").innerHTML = data.csContract.prodmon== null ?"":formatNumber(data.csContract.prodmon,'#,##.##');
	                document.getElementById("csContract.masum").innerHTML = data.csContract.masum== null ?"0":formatNumber(data.csContract.masum,'#,##.##');
                	document.getElementById("custname").innerHTML = data.csContract.misCustinfo==null?"": data.csContract.misCustinfo.custname == null ?"":data.csContract.misCustinfo.custname;
	                //预估记录基本信息
					nui.get("incometype1").setValue(data.csContract.incometype);
					nui.get("incometypeTemp").setValue(data.csContract.incometype);
                    //查询收入预估记录
                    grid_income.load({contnum:data.csContract.contnum});
                    
                    var incometypes=data.csContract.incometype;
		        	//判断收入类型是否无条件产品合同、有条件产品合同
		        	if(incometypes){
						if(incometypes.indexOf('1') >= 0 || incometypes.indexOf('2') >= 0){
							nui.get("jscheckerid").disable();
							document.getElementById("jscheckerid").required=false;
							document.getElementById("isShowjsLeader").style.display="none";
						}else{
		  					nui.get("jscheckerid").enable();
		  					document.getElementById("jscheckerid").required=true;
		  					document.getElementById("isShowjsLeader").style.display="";
						}
					}else{
						nui.get("jscheckerid").enable();
	  					document.getElementById("jscheckerid").required=true;
	  					document.getElementById("isShowjsLeader").style.display="";
					}
					
                    //查询收入确认金额 状态status为3表示已确认
					nui.ajax({
			            url: "com.primeton.eos.ame_income.csReveForeProcess.querySumIncome.biz.ext",
			            data: {contnum:data.csContract.contnum},
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
		            //合同附件信息
		            nui.ajax({
		                url: "com.primeton.eos.ame_common.file.getFiles.biz.ext",
		                data: {relationid:data.csContract.contractid,groupid:"CS_CONTRACT"},
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
					//查询合同的销售所对应的事业部销售负责人
					nui.ajax({
		                url: "com.primeton.eos.ame_income.csReveForeProcess.querySaleLeaderByContractid.biz.ext",
		                data: {contractid:data.csContract.contractid},
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (o) {
		                	//销售负责人
		                    for(var i=0;i<o.saleLeaders.length;i++){
		                    	salename += o.saleLeaders[i].name+",";
		                    	saleid += o.saleLeaders[i].id+",";
		                    }
		                    salename = salename.substring(0,salename.length-1);
		                    saleid = saleid.substring(0,saleid.length-1);
		                    nui.get("checkerid").setValue(saleid);
		                    nui.get("checkerid").setText(salename);
		                    
		                    for(var i=0;i<o.techLeader.length;i++){
		                    	jsname += o.techLeader[i].name+",";
		                    	jsid += o.techLeader[i].id+",";
		                    }
		                    jsname = jsname.substring(0,jsname.length-1);
		                    jsid = jsid.substring(0,jsid.length-1);
		                    nui.get("jscheckerid").setValue(jsid);
		                    nui.get("jscheckerid").setText(jsname);
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            });
		            //合同收款
		            grid_csGatherFc.load({contnum:data.csContract.contnum});
		            grid_csContractCost.load({criteria:{_expr:[{_property:"contnum",_op:"=",_value:data.csContract.contnum}]}});
		            projectid = data.csContract.projectid;
		            selectRdProject(data.csContract.contnum);
    			}
    		});
	  	}else{
	  		nui.get("cancelReveProcess").disable();
  		}
	  	//方法1：实际确认金额修改之后把预计金额、预计、实际（服务、产品、MA）全部修改（方法二，在提交的时候把所有的数据全部修改一下）
	  	function calThreeMoney(){
	  		var actproductsum = nui.get("actproductsum").getValue();
	  		var actservicesum = nui.get("actservicesum").getValue();
	  		var actmasum = nui.get("actmasum").getValue();
	  		nui.get("actsum").setValue(actproductsum+actservicesum+actmasum);
	  		countprofit();
	  	}
	  	function dictproof(e) {
			return nui.getDictText('MIS_INCOMECONV',e.value);//设置业务字典值
		}
		function dictmonth(e) {
			return nui.getDictText('AME_MONTHPERIOD',e.value);//设置业务字典值
		}
		function dictstatus(e) {
			return nui.getDictText('AME_REVESTATUS',e.value);//设置业务字典值
		}
		function dictrate(e) {
			return nui.getDictText('AME_SYSCONF',e);//获取产品服务维保税率
		}		
        init();
        function init(){
        	//初始化审核意见
			nui.get("auditstatus").setValue(3);//1：通过,0：退回，2：终止流程，3:发起
        	//document.getElementById("innerHtml").innerHTML = "合同相关附件";
        	document.getElementById("salesEdit").style.display="none";
        	promptInit({"workItemID":0,"processDefName":"com.primeton.eos.income.ReveConfirm","activityDefID":"manualActivity"});
        	
        }
        
        function  selectionChanged(){
        	var row = grid_income.getSelected();
        	if(row.status==2){
        		alert("该笔收入正在收入确认流程中，无法选中！");
        		grid_income.deselect(row);
        		form_Reve.reset();
        		//清空预估信息
		    	document.getElementById("reveno").innerHTML ="";
		    	document.getElementById("reveproof").innerHTML = "";
		    	document.getElementById("newyearmonth").innerHTML = "";
				document.getElementById("fcreverate").innerHTML = "";
		    	document.getElementById("fcsum1").innerHTML = "";
		    	document.getElementById("revetype").innerHTML = "";
        		return;
        	}
        	if(row.status==8){
        		alert("该笔收入正在管报已确认的财报确认流程中，无法选中！");
        		grid_income.deselect(row);
        		form_Reve.reset();
        		//清空预估信息
		    	document.getElementById("reveno").innerHTML ="";
		    	document.getElementById("reveproof").innerHTML = "";
		    	document.getElementById("newyearmonth").innerHTML = "";
				document.getElementById("fcreverate").innerHTML = "";
		    	document.getElementById("fcsum1").innerHTML = "";
		    	document.getElementById("revetype").innerHTML = "";
        		return;
        	}
        	if(row.status==3){
        		alert("该笔收入财报管报都已确认，无法选中！");
        		grid_income.deselect(row);
        		form_Reve.reset();
        		//清空预估信息
		    	document.getElementById("reveno").innerHTML ="";
		    	document.getElementById("reveproof").innerHTML = "";
		    	document.getElementById("newyearmonth").innerHTML = "";
				document.getElementById("fcreverate").innerHTML = "";
		    	document.getElementById("fcsum1").innerHTML = "";
		    	document.getElementById("revetype").innerHTML = "";
        		return;
        	}
        	if(row.status==6){
        		alert("该笔收入已财报确认，无法选中！");
        		grid_income.deselect(row);
        		form_Reve.reset();
        		//清空预估信息
		    	document.getElementById("reveno").innerHTML ="";
		    	document.getElementById("reveproof").innerHTML = "";
		    	document.getElementById("newyearmonth").innerHTML = "";
				document.getElementById("fcreverate").innerHTML = "";
		    	document.getElementById("fcsum1").innerHTML = "";
		    	document.getElementById("revetype").innerHTML = "";
        		return;
        	}
        	
        	if(row.status==5){
        		alert("该笔收入收入无需确认，无法选中！");
        		grid_income.deselect(row);
        		form_Reve.reset();
        		//清空预估信息
		    	document.getElementById("reveno").innerHTML ="";
		    	document.getElementById("reveproof").innerHTML = "";
		    	document.getElementById("newyearmonth").innerHTML = "";
				document.getElementById("fcreverate").innerHTML = "";
		    	document.getElementById("fcsum1").innerHTML = "";
		    	document.getElementById("revetype").innerHTML = "";
        		return;
        	}
        	if(isFin==false && row.status==7){
        		alert("该笔收入仅管报确认，只有财务能发起财报确认，无法选中！");
        		grid_income.deselect(row);
        		form_Reve.reset();
        		//清空预估信息
		    	document.getElementById("reveno").innerHTML ="";
		    	document.getElementById("reveproof").innerHTML = "";
		    	document.getElementById("newyearmonth").innerHTML = "";
				document.getElementById("fcreverate").innerHTML = "";
		    	document.getElementById("fcsum1").innerHTML = "";
		    	document.getElementById("revetype").innerHTML = "";
        		return;
        	}
        	if(row.saleseva==0){
        		alert("该笔收入不需要业务发起！");
        		grid_income.deselect(row);
        		form_Reve.reset();
        		//清空预估信息
		    	document.getElementById("reveno").innerHTML ="";
		    	document.getElementById("reveproof").innerHTML = "";
		    	document.getElementById("newyearmonth").innerHTML = "";
				document.getElementById("fcreverate").innerHTML = "";
		    	document.getElementById("fcsum1").innerHTML = "";
		    	document.getElementById("revetype").innerHTML = "";
        		return;
        	}
        	//不能直接form.setData,因为有incometype已经写在hidden输入框了
        	//productsum servicesum masum actproductsum actservicesum actmasum
        	nui.get("reveid").setValue(row.reveid);
        	nui.get("reveno1").setValue(row.reveno);
        	nui.get("status").setValue(row.status);
        	//更改实际确认金额的时候会更改预计确认金额（所以必须要有这个hidden）
        	nui.get("fcsum").setValue(row.fcsum);
        	
        	document.getElementById("reveno").innerHTML = row.reveno== null ?"":row.reveno;
        	document.getElementById("reveproof").innerHTML = nui.getDictText('MIS_INCOMECONV',row.reveproof);
        	document.getElementById("newyearmonth").innerHTML = row.newyearmonth== null ?"":row.newyearmonth;
        	document.getElementById("fcreverate").innerHTML = row.fcreverate== null ?"":parseFloat(row.fcreverate*100).toFixed(1)+"%";
        	document.getElementById("revetype").innerHTML = nui.getDictText('AME_REVETYPE',row.revetype);
        	document.getElementById("fcsum1").innerHTML = row.fcsum== null ?"":formatNumber(row.fcsum,'#,##.##');
        	document.getElementById("productsum1").innerHTML = row.productsum== null ?"":formatNumber(row.productsum,'#,##.##');
        	document.getElementById("servicesum1").innerHTML = row.servicesum== null ?"":formatNumber(row.servicesum,'#,##.##');
        	document.getElementById("masum1").innerHTML = row.masum== null ?"":formatNumber(row.masum,'#,##.##');
        	document.getElementById("revetimedesc").innerHTML = row.revetimedesc== null ?"":row.revetimedesc;
        	
        	//判断收入类型是否包含人力服务收入
        	var revetype = row.revetype; 
        	if(revetype.indexOf('5') >= 0){
				document.getElementById("setyearmonth").style.display = "";
				var setstart = row.setstart;
            	var setend = row.setend;
            	var setstart1 = null;
            	var setend1 = null;
            	if(setstart !=null && setstart != ""){
            		setstart1 = setstart.substring(0,4)+"-"+setstart.substring(4,6);
            	}
            	if(setend !=null && setend != ""){
            		setend1 = setend.substring(0,4)+"-"+setend.substring(4,6);
            	}
            	nui.get("setstart").setValue(setstart1);
            	nui.get("setend").setValue(setend1);
			}else{
				document.getElementById("setyearmonth").style.display = "none";
				var contnum = document.getElementById("contnum").innerHTML;
				var json = nui.encode({"contnum":contnum});
	            nui.ajax({
	                url: "com.primeton.eos.ame_income.csReveForeProcess.getMaxSetdate.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                   	var returnJson = nui.decode(text);
		              	if(returnJson.setstart == null){
		    				
		              	}else{
		              		nui.get("setstart").setValue(returnJson.setstart.substring(0,4)+"-"+returnJson.setstart.substring(4,6));
		              	}
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	            });
			}
			//预估记录基本信息
			nui.get("incometype1").setValue(revetype);
			nui.get("incometypeTemp").setValue(revetype);
			//核查要点checklist加载
        	var checklistdata={processInstID:null,processDefName:"com.primeton.eos.income.ReveConfirm",activityDefID:"manualActivity",incomeType:revetype};
			queryChickList(checklistdata);
			
			//判断收入类型是否无条件产品合同、有条件产品合同
	        if(revetype){
				if(revetype.indexOf('0') >= 0 || revetype.indexOf('3') >= 0){
					nui.get("jscheckerid").disable();
					document.getElementById("jscheckerid").required=false;
					document.getElementById("isShowjsLeader").style.display="none";
				}else{
  					nui.get("jscheckerid").enable();
  					document.getElementById("jscheckerid").required=true;
  					document.getElementById("isShowjsLeader").style.display="";
				}
			}else{
				nui.get("jscheckerid").enable();
  				document.getElementById("jscheckerid").required=true;
  				document.getElementById("isShowjsLeader").style.display="";
			}
        	 
        	//用于判断提交的时候实际确认金额，与预计确认金额是否一致
        	fcsum = row.fcsum;
        	//默认把预计确认产品、服务、ma放到实际确认的产品、服务、ma里面
        	nui.get("actproductsum").setValue(row.productsum);
        	nui.get("actservicesum").setValue(row.servicesum);
        	nui.get("actmasum").setValue(row.masum);
        	nui.get("actsum").setValue(row.fcsum);//默认把预计确认金额放到实际确认金额
        	//设置确认日期为当前日期
        	nui.get("confirmday").setValue(new Date());
        	nui.get("actreveproof").setValue(row.actreveproof);
        	nui.get("memo").setValue(row.memo);
        	//业务单元的审批人
        	nui.get("checkerid").setValue(saleid);
            nui.get("checkerid").setText(salename);
            
        	nui.get("jscheckerid").setValue(jsid);
            nui.get("jscheckerid").setText(jsname);
            countprofit();
        }
        
        //选择销售负责人
        function selectSaleLeader(){
        	var btnEdit = this;
            nui.open({
                url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择销售负责人",
                width: 650,
                height: 380,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.userid);
                            btnEdit.setText(data.empname);
                        }
                        form_Reve.validate();
                    }

                }
            });
        }
        //选择销售合同弹窗(只能选择本事业部是合同)
        function selectCont(){
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_income/csReveForecast/SelectCsContract.jsp",
                title: "选择销售合同",
                width: 800,
                height: 400,
                allowResize: false,
                onload:function (){
                	var iframe = this.getIFrameEl();
                    iframe.contentWindow.search();
                },
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                        	//合同基本信息
                            nui.get("projectname").setValue(data.projectname);
                            nui.get("projectname").setText(data.projectname);
                        	nui.get("contractid").setValue(data.contractid);
                        	document.getElementById("contnum").innerHTML = data.contnum == null ?"":data.contnum;
                        	document.getElementById("contsum").innerHTML = data.contsum == null ?"":formatNumber(data.contsum,'#,##.##');
                        	
                        	document.getElementById("salename").innerHTML = data.salename == null ?"":data.salename;
        					document.getElementById("incometype").innerHTML = nui.getDictText('MIS_HTINCOMETYPE',data.incometype);
        					document.getElementById("csContract.servmon").innerHTML = data.servmon== null ?"":formatNumber(data.servmon,'#,##.##');
			                document.getElementById("csContract.prodmon").innerHTML = data.prodmon== null ?"":formatNumber(data.prodmon,'#,##.##');
			                document.getElementById("csContract.masum").innerHTML = data.masum== null ?"":formatNumber(data.masum,'#,##.##');
                        	document.getElementById("custname").innerHTML = data.misCustinfo==null?"": data.misCustinfo.custname == null ?"":data.misCustinfo.custname;
                        	//选择合同逻辑流计算已确认金额
			            	document.getElementById("inconme").innerHTML = formatNumber(data.confirmMoney,'#,##.##');
			                //初始化（清空）预估基本信息
        					nui.get("incometype1").setValue(data.incometype);
        					nui.get("incometypeTemp").setValue(data.incometype);
        					form_Reve.reset();
        					document.getElementById("reveno").innerHTML ="";
					    	document.getElementById("reveproof").innerHTML = "";
					    	document.getElementById("newyearmonth").innerHTML = "";
							document.getElementById("fcreverate").innerHTML = "";
					    	document.getElementById("fcsum1").innerHTML = "";
					    	document.getElementById("revetype").innerHTML = "";
	                        //查询收入预估记录
	                        grid_income.load({contnum:data.contnum});
	                        
	                        var incometypes=data.incometype;
				        	//判断收入类型是否无条件产品合同、有条件产品合同
				        	if(incometypes){
								if(incometypes.indexOf('1') >= 0 || incometypes.indexOf('2') >= 0){
									nui.get("jscheckerid").disable();
									document.getElementById("jscheckerid").required=false;
									document.getElementById("isShowjsLeader").style.display="none";
								}else{
									nui.get("jscheckerid").enable();
									document.getElementById("jscheckerid").required=true;
									document.getElementById("isShowjsLeader").style.display="";
								}
							}else{
								nui.get("jscheckerid").enable();
								document.getElementById("jscheckerid").required=true;
								document.getElementById("isShowjsLeader").style.display="";
							}
	                        //合同附件信息
	                        nui.ajax({
				                url: "com.primeton.eos.ame_common.file.getFiles.biz.ext",
				                data: {relationid:data.contractid,groupid:"CS_CONTRACT"},
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
				            //合同附件信息
				            <%--var grid_0 = nui.get("grid_0");
							grid_0.load({"groupid":"CS_CONTRACT","relationid":data.contractid});
							grid_0.sortBy("fileTime","desc");--%>
							//查询合同的销售所对应的事业部销售负责人
							nui.ajax({
				                url: "com.primeton.eos.ame_income.csReveForeProcess.querySaleLeaderByContractid.biz.ext",
				                data: {contractid:data.contractid},
				                type: 'POST',
				                cache: false,
				                contentType: 'text/json',
				                success: function (o) {
				                	//销售负责人
				                	salename="";
				                	saleid="";
				                	jsname="";
				                	jsid="";
				                    for(var i=0;i<o.saleLeaders.length;i++){
				                    	salename += o.saleLeaders[i].name+",";
				                    	saleid += o.saleLeaders[i].id+",";
				                    }
				                    salename = salename.substring(0,salename.length-1);
				                    saleid = saleid.substring(0,saleid.length-1);
				                    nui.get("checkerid").setValue(saleid);
				                    nui.get("checkerid").setText(salename);
				                	
				                	for(var i=0;i<o.techLeader.length;i++){
				                    	jsname += o.techLeader[i].name+",";
				                    	jsid += o.techLeader[i].id+",";
				                    }
				                    jsname = jsname.substring(0,jsname.length-1);
				                    jsid = jsid.substring(0,jsid.length-1);
				                    nui.get("jscheckerid").setValue(jsid);
				                    nui.get("jscheckerid").setText(jsname);
				                },
				                error: function (jqXHR, textStatus, errorThrown) {
				                    alert(jqXHR.responseText);
				                }
				            });
				            //合同收款
		            		grid_csGatherFc.load({contnum:data.contnum});
		            		grid_csContractCost.load({criteria:{_expr:[{_property:"contnum",_op:"=",_value:data.contnum}]}});
		            		projectid = data.projectid;
                        }
                        selectRdProject(data.contnum);
                    }
                }
            });
        }
    	function onOk(e) {
    		var projectname = nui.get("projectname").getValue();
    		if(!projectname){
    			alert("请选择合同！");
    			return;
    		}
    		var row = grid_income.getSelecteds();
    		if(row.length != 1){
    			alert("请选择收入预估一条记录！");
    			return;
    		}
    		if(!form_Reve.validate()){
    			alert("表单信息填写不完整，请确认必输项是否填写！");
    			return;
    		}
		  		
        	var filePaths1 = document.getElementsByName("uploadfile1").length;
        	for(var j=0;j<filePaths1;j++){
        		var a=document.getElementsByName("remarkList1")[j].value;
        		if(a==null||a==""){
        			alert("新增收入预估附件不可以为空！");
        			return false;
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
	  			alert("实际确认的含税产品、服务、MA总和不等于实际确认金额！");
	  			return;
	  		}
	  		if(projectids != null &&  projectids !=''){
	  			var project = nui.get("projectids").getValue();
	  			if(project == null || project == ''){
	  				alert("请选择项目！")
	  				return;
	  			}
	  		}
	  		var form_purChaseYesOrNo = new nui.Form("form_purChaseYesOrNo");
    		if(!form_purChaseYesOrNo.validate()){
    			alert("请选选择是否有暂未签署或未报备采购！");
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
			var grid_checklist = nui.get("grid_checklist"); 
	    	var checklistrow = grid_checklist.getData();
	    	for(var i =0; i<checklistrow.length;i++){
	    		if(checklistrow[i].ischeck=="0"){
	    			nui.alert("核查清单'"+checklistrow[i].checklistseq+checklistrow[i].checklistname+"'没有勾选！");
	    			return;
	    		}
	    	}
    		nui.get("purstatus").setValue(e);
        	if(e==1){
        		var myTable = document.getElementById('filetable0');
	    		if(myTable.rows.length <2){//必须上传两个附件（收入确认证据图片、预估申请表附件）
	    			alert("请上传收入确认证据图片！");
	    			return false;
	    		}
	    		
	        	if(confirm("提示：请确认是否已经正确上传了收入确认证据图片，以免后续审核环节被打回！\n\n确认发起流程？")){
		  			nui.get("fcsum").setValue(actsum);
		  			nui.get("productsum").setValue(actproductsum);
		  			nui.get("servicesum").setValue(actservicesum);
		  			nui.get("masum").setValue(actmasum);
		  			
	        		nui.get("creatReveProcess").disable();
					nui.get("saveReveProcess").disable();
        			document.getElementById("fileCatalog").value="csReveForecast";
		        	form2.submit();
	        	}
        	}else if(e==0){
        		if(confirm("是否暂时保存申请流程？暂时保存后可以在待办任务中进行查询处理！")){
		  			nui.get("fcsum").setValue(actsum);
		  			nui.get("productsum").setValue(actproductsum);
		  			nui.get("servicesum").setValue(actservicesum);
		  			nui.get("masum").setValue(actmasum);
		  			
	        		nui.get("creatReveProcess").disable();
					nui.get("saveReveProcess").disable();
	        		document.getElementById("fileCatalog").value="csReveForecast";
		        	form2.submit();
		        }
	        }
        }
        function SaveData() {
        	if(!form_Reve.validate()){
    			alert("表单信息填写不完整，请确认必输项是否填写！");
    			return;
    		}
        	var o = form_Reve.getData();
        	o.csReveForecast.incometype=nui.get("incometypeTemp").getValue();
        	var data_opioion = opioionform.getData();
        	var data_cont = form_cont.getData();
        	var ck0 = document.getElementById("checkbox1");
        	var data_otherPurchases = grid_otherPurchase.getData();
        	var purChaseYesOrNo = nui.get("purChaseYesOrNo").getValue();
        	var project = nui.get("projectids").getValue();
        	var setstart = nui.get("setstart").getText();
			var setend = nui.get("setend").getText();
        	o.csReveForecast.setstart = setstart==""?"":setstart.substring(0,4)+""+setstart.substring(4,6);
        	o.csReveForecast.setend = setend==""?"":setend.substring(0,4)+""+setend.substring(4,6);
    		o.csReveForecast.maconfirmdayStart = o.csReveForecast.maconfirmdayStart=="" || o.csReveForecast.maconfirmdayStart==null?o.csReveForecast.maconfirmday:o.csReveForecast.maconfirmdayStart; 
        	o.csReveForecast.project = project ;
        	var isFinance = '0';
			<l:iterate id="roles" property="userObject/attributes/roles" scope="session">
				var roleid = "<b:write iterateId='roles' property='roleid'/>";
				if(roleid == 'finance'){
					isFinance = '1';
				}
			</l:iterate>
			o.csReveForecast.isFinance = isFinance;
			//拿到核查要点checklist填写的值
	    	var grid_checklist = nui.get("grid_checklist"); 
	    	var checklistrow = grid_checklist.getData();
	    	data_opioion.misOpinion.activitydefid = "manualActivity"
	    	
	        var json = nui.encode({csReveForecast:o.csReveForecast,csContract:data_cont.csContract,misOpinion:data_opioion.misOpinion,otherPurchases:data_otherPurchases,purChaseYesOrNo:purChaseYesOrNo,csIncomecheck:checklistrow});
            nui.ajax({
                url: "com.primeton.eos.ame_income.csReveForeProcess.creatReveForeProcess.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                   	var returnJson = nui.decode(text);
                	var e = nui.get("purstatus").getValue();
	              	if(returnJson.exception == null){
	    				if(e==1){
		                   	alert("发起流程成功！");
		                   	window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
	    				}else if(e==0){
	    					alert("暂时保存成功！");
		                   	window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
	    				}
	              	}else{
	              		nui.get("creatReveProcess").enable();
						nui.get("saveReveProcess").enable();
	    				if(e==1){
		                   	alert("发起流程失败！");
	    				}else if(e==0){
	    					alert("暂时保存失败！");
	    				}
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
        
        function noticeDetail(){
			var executeUrl = "/default/ame_common/notice/noticeShow.jsp?id=81";
		    var iTop = (window.screen.availHeight-30-500)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-1000)/2; //获得窗口的水平位置;
			window.open(executeUrl, "收入确认审核告知详细信息","height=500, width=1000,top="+iTop+",left="+iLeft+",resizable=yes" );
	    }
		
	function dictContType(e){
		return nui.getDictText('AME_CONTYPE',e.value);
	}
	function remove() {
    	var rows = grid_otherPurchase.getSelecteds();
        if (rows.length>0) {
            grid_otherPurchase.removeRows(rows, true);
        }else{
        	alert("请 至少选中一条记录！");
        }
    }
    function add() {    
    	var newRow = { name: "New Row" };
        grid_otherPurchase.addRow(newRow);
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
		//汇总金额处理
		function doCountSum(e){        	
            if (e.field == "money") {//未签署采购金额
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.value,'#,##.##') + "</b></div>";
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
	    function dictGatherStatus(e){
        	return nui.getDictText("AME_GATHERSTATUS",e.value);
        }
        
        function dictstatus1(e){
        	return nui.getDictText("MIS_GATHERBILL",e.value);
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
		//关闭窗口	
		function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow();
        	else window.close(); 
	    }
	    function countprofit(){
	    	var servrate = dictrate("SERVICERATE");//服务税率
			var prodrate = dictrate("PRODUCTRATE");//产品税率
			var marate = dictrate("MARATE");//MA税率
			var actproductsum = nui.get("actproductsum").getValue();//产品金额
			var laborcountthis = nui.get("labormonth").getValue();//本次结算工作量
	  		var actservicesum = nui.get("actservicesum").getValue();//服务金额
	  		var actmasum = nui.get("actmasum").getValue();//MA金额
	  		var actsum2 = actproductsum/(1+parseFloat(prodrate))+actservicesum/(1+parseFloat(servrate))+actmasum/(1+parseFloat(marate));//不含税确认金额
	  		//计算成本
        	var rows = grid_csProjectCost.getData ();
        	var allsum = 0;
        	var laborcountinto = 0;
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
        	//写本次结算工作量laborcountthis
	    	document.getElementById("laborcountthis").innerHTML = laborcountthis == null || laborcountthis == 0?"":formatNumber(laborcountthis,'#,##.##')+"人月";
        	//写本次本次结算实际投入工作量laborcountthis
	    	document.getElementById("laborcountinto").innerHTML = laborcountinto == null || laborcountinto == 0?"":formatNumber(laborcountinto,'#,##.##')+"人月";
        	//写本次本次工作量偏差laborcountoffset
	    	document.getElementById("laborcountoffset").innerHTML = laborcountthis == null || laborcountthis == 0?"":formatNumber(laborcountthis-laborcountinto,'#,##.##')+"人月";
        	//写毛利率profitcost
	    	document.getElementById("profitcost").innerHTML = allsum == null || allsum == 0?"":formatNumber(allsum,'#,##.##');
    		//写毛利profit
        	document.getElementById("profit").innerHTML = actsum2 == null || actsum2 == 0?"":formatNumber(actsum2-allsum,'#,##.##');
        	//写毛利率profitRate
	    	document.getElementById("profitRate").innerHTML = actsum2 == null || actsum2 == 0?"":formatNumber(100*(actsum2-allsum)/actsum2,'#,##.##')+'%';
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
    		projectids = '';
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
    					
	    					if(projectids == '' || projectids == null){
	    						projectids = data.projects[i].projectId;
	    					}else{
	    						projectids = projectids+','+data.projects[i].projectId
	    					}
    					}
    					nui.get("projectids").setValue('');
    					document.getElementById("project").style.display=""
    				}else{
    					document.getElementById("project").style.display="none"
    				}
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
	    function changepurChase(){
	    	var purChaseYesOrNo = nui.get("purChaseYesOrNo").getValue();
        	if(purChaseYesOrNo == "0"){
        		document.getElementById("field4").style.display = "none";
        	}else{
        		document.getElementById("field4").style.display = "";
        	}
	    }
    </script>
</body>
</html>
