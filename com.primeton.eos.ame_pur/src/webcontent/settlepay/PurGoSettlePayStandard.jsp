<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="com.eos.foundation.eoscommon.ConfigurationUtil"%>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2016-06-03 15:10:55
  - Description:
-->
<head>
	<title>合规审核</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
</body>
	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
	<div class="nui-fit">
		<!-- 提示信息展示 -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<form id="form1" method="post">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>外包结算基本信息</legend>
				<input class="nui-hidden" name="workitemid" id="workitemid" value="<%=workItemID %>"/>
				<input name="purSettle.settlementid" id="settlementid" class="nui-hidden"/>
				<input name="purSettle.fileids" id="fileids1" class="nui-hidden"/>
				<input name="misOpinion.fileids" class="nui-hidden"/>
				<input name="purSettle.setstatus" id="setstatus" class="nui-hidden"/>
				<input name="purSettle.processinstid" id="processinstidSettle" class="nui-hidden" />
				<input name="misOpinion.processinstid" id="processinstid2" class="nui-hidden" />
				<!-- 供应商简称 -->
				<input name="purSettle.suppliersname" id="suppliersname" class="nui-hidden" />
				<!-- 项目ID -->
				<input name="purSettle.projectid" id="purSettleProjectid" class="nui-hidden" />
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">项目：</td>
							<td>
								<input name="purSettle.projectno" readOnly="readOnly" showButton="false" id="projectno" valueField="projectNo" textField="projectName" class="nui-buttonedit" required="false" style="width:240px" />
								<a href="javascript:void(0)" onclick='detailProj1();' title='点击查看项目信息'>查看</a>
							</td>
							<td align="right" style="width:120px;">客户：</td>
							<td><input name="purSettle.custno" readOnly="readOnly" showButton="false" id="custno" valueField="miscustid" textField="custname" class="nui-combobox" required="false" style="width:240px;" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">供应商：</td>
							<td><input id="custid" class="nui-combobox" required="false" style="width:240px" 
								readOnly="readOnly" showButton="false" allowInput="false" />
							</td>
							<td align="right" style="width:120px;">受益部门：</td>
							<td><input name="purSettle.benefitid" readOnly="readOnly" showButton="false" id="benefitid" class="nui-buttonedit" required="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">结算周期开始日期：</td>
							<td><input name="purSettle.startdate" id="startdate" readOnly="readOnly" showButton="false" class="nui-datepicker" required="false" style="width:100px"/></td>
							<td align="right" style="width:120px;">结算周期截止日期：</td>
							<td><input name="purSettle.enddate" id="enddate" readOnly="readOnly" showButton="false" class="nui-datepicker" required="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">工作量单位：</td>
							<td><input name="purSettle.workunit" id="workunit" readOnly="readOnly" showButton="false" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" required="false" style="width:50px" /></td>
							<td align="right" style="width:120px;">工作量数量：</td>
							<td><input name="purSettle.workamount" id="workamount" readOnly="readOnly" class="nui-textbox" dictTypeId="CONT_ORG" required="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">工作量技术确认人：</td>
							<td><input name="purSettle.confper" id="confper" readOnly="readOnly" class="nui-textbox" required="false" style="width:100px"/></td>
							<td align="right" style="width:120px;">成本归属类型：</td>
							<td><input name="purSettle.costtype" id="costtype" class="nui-dictcombobox" dictTypeId="AME_CONTCOSTTYPE" required="true" style="width:100px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">税率：</td>
							<td><input name="purSettle.tax" id="tax" class="nui-textbox" onblur="noTaxaMount" required="true" style="width:100px"/>%</td>
							<td align="right" style="width:120px;">不含税金额：</td>
							<td ><input name="purSettle.notaxmon" id="notaxmon"   class="nui-textbox" allowInput="true" required="true" style="width:120px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">结算单编号：</td>
							<td><input name="purSettle.settlementno" id="settlementno" class="nui-textbox" required="true" onblur="checkSettlementno" style="width:100px"/></td>
							<td align="right" style="width:120px;">财务对应合同编号：</td>
							<td><input name="purSettle.contnum" id="contnum" onbuttonclick="selectCont" class="nui-buttonedit" required="false" style="width:120px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">备注：</td>
							<td colspan="3"><input name="purSettle.comment" id="comment" readOnly="readOnly" class="nui-textarea" required="false" style="width:440px"/></td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>外包人员结算信息</legend>
				<div id="datagridOutperson" class="nui-datagrid" style="width:100%;height:auto;" multiSelect="true" 
			    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" allowSortColumn="false"
			    	onselect="onSelect" ondeselect="onDeselect" onlyCheckSelection="true">
					<div property="columns">
						<div field="setdetailid" width="80" align="center" headerAlign="center" allowSort="true" visible="false">结算明细id</div>
						<div field="purorderid" align="center" headerAlign="center" allowSort="true" visible="false">采购订单编号</div>
						<div field="outperno" align="center" headerAlign="center" allowSort="true" visible="false">编号</div>
						<div field="outpername"width="60" align="center" headerAlign="center" allowSort="true" >姓名</div>	
						<div field="setstartdate" width="80" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">
							结算开始日期
						</div>
						<div field="setenddate" width="80" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">
							结算截止日期
						</div>
						<div field="days" width="67" align="center" headerAlign="center" allowSort="true">
							工作日统计
						</div>
						<div field="months" width="45" align="center" headerAlign="center" allowSort="true">
							人月数
						</div>
						<div field="price" width="75" dataType="currency" align="right" headerAlign="center" allowSort="true">人月单价</div>
						<div field="setfee" width="80" dataType="currency" align="right" headerAlign="center" allowSort="true">
							工时结算费用
						</div>
						<div field="othfee" width="60" dataType="currency" align="right" headerAlign="center" allowSort="true">
							其他费用
						</div>
						<div field="totalfee" summaryType="sum" dataType="currency" width="90" dataType="currency" align="right" headerAlign="center" allowSort="true">
							结算费用小计
						</div>
						<div field="score" width="42" align="center" headerAlign="center" allowSort="true">
							打分
						</div>
						<div field="evaluate" width="75" align="center" headerAlign="center" allowSort="true">
							评价
						</div>
						<div field="purordernum" width="135" align="center" headerAlign="center" allowSort="true">订单编号</div>
						<div field="purstatus" width="65" renderer="dictGetOrderStatus" align="center" headerAlign="center" allowSort="true">订单状态</div>
					</div>
				</div>
				<div style="width:800px;height:55px;margin-left:155px;float:left;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:100px;">总计：</td>
							<td id="daystotal" style="width:63px;" align="center" ></td>
							<td id="monthstotal" style="width:44px;" align="center" ></td>
							<td align="right" style="width:243px;">结算费用总计：</td>
							<td id="sumtotal" style="width:87px;" align="right" ></td>
						</tr>
						<tr>
							<td colspan="3"></td>
							<td align="right" style="width:210px;">结算最终总金额：</td>
							<td><input name="purSettle.setamount" id="setamount" readOnly="readOnly" inputStyle="text-align:right;" vtype="float" class="nui-textbox" required="false" style="width:89px" /></td>
						</tr>
					</table>
				</div>
			</fieldset>
			
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;width: 1200px;">
				<legend>计提核销信息</legend>
				<div id="datagrid2" class="nui-datagrid" dataField="purPresettles" style="width:100%;height:auto;" 
			    	url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleListToSettle.biz.ext" multiSelect="true"
			    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" 
			    	onselect="onSelectPre" ondeselect="onDeselectPre" 
			    	onlyCheckSelection="true" allowSortColumn="false">
					<div property="columns">
						<div type="checkcolumn" width="30"></div>
						<div field="accruedid" width="60" headerAlign="center" allowSort="true" visible="true">计提编号</div>
						<div field="contnum" width="100" headerAlign="center" allowSort="true" visible="true">财务合同编号</div>
		                <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商编号</div>
		                <div field="custname" headerAlign="center" allowSort="true" visible="false">供应商名称</div>
		                <div field="suppliersname" width="80" headerAlign="center" allowSort="true" >供应商简称</div>
		                <div field="projectno" headerAlign="center" allowSort="true" visible="false">项目代码</div>
		                <div field="projectname" headerAlign="center" allowSort="true" visible="false">项目名称</div>
		                <div field="salesid" headerAlign="center" allowSort="true" visible="false" >所属销售ID</div>
		                <div field="orgname" headerAlign="center" allowSort="true" width="60" align="center" >所属销售</div>
		                <div field="syb" headerAlign="center" allowSort="true" width="100" renderer="dictGetContOrg" >所属事业部</div>
		                <div field="contnum" headerAlign="center" allowSort="true" visible="false">销售合同</div>
		                
		                <div field="workunit" width="70" align="center" headerAlign="center" allowSort="true" renderer="dictGetWorkunit">工作量单位</div>
		                <div field="workamount" width="70" align="center" headerAlign="center" allowSort="true" >工作量数量</div>
		                
		                <div field="startdate" headerAlign="center" allowSort="true" width="75" align="center" >开始日期</div>
		                <div field="enddate" headerAlign="center" allowSort="true" width="75" align="center" >结束日期</div>
		                <div field="accruedmoney" headerAlign="center" allowSort="true" width="80" align="right" dataType="currency" >计提金额</div>
		                <div field="notaxmoney" headerAlign="center" allowSort="true" width="80" align="right" dataType="currency" >不含税金额</div>
		                <div field="costtype" headerAlign="center" allowSort="true" renderer="dictGetCostType" width="60" align="center" >成本类型</div>
		                <div field="outper" headerAlign="center" allowSort="true" width="130" >相关外包人员</div>
		                <div field="accrueddate" headerAlign="center" allowSort="true" width="75" align="center" dateFormat="yyyy-MM-dd" >计提时间</div>
		                <div field="accruedstatus" headerAlign="center" allowSort="true" renderer="dictGetStatus" width="120" align="center" >状态</div>
		                <div field="settlementid" headerAlign="center" allowSort="true" visible="false" >结算单编号</div>
		                <div name="action" width="60" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
		                <div field="comment" width="120" headerAlign="center" allowSort="true" >备注</div>
					</div>
				</div>
				<div style="width: 620px;height:25px;margin-left: 260px;float:left;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:500px;">总计：</td>
							<td id="sumtotalworkamount" style="width:150px;" align="center" ></td>
							<td style="width: 275px;"></td>
							<td id="sumtotalpre" style="width: 120px;" align="right" ></td>
							<td id="sumNottotalpre" style="width:110px;" align="right" ></td>
						</tr>
					</table>
				</div>
			</fieldset>
			<!-- 填写外包费用页面，除了结算单本身的信息，还需要填报信息：日常零星报销单编号（自生成）、受益部门、
				  付款方式（必选）、收款单位（必选）、银行名称、银行账号、单位电话（可填）、对应客户、对应项目、
				  外包费用对应日期、外包服务金额、解释说明（可填） -->
			<!-- 报销单 -->
			<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
				<legend>本次结算信息</legend>
				<div style="padding:5px;">
					<!-- 报销单编号 -->
					<input name="expReiList.expno" id="pettyexpno" class="nui-hidden" />
					<!-- 销售合同编号 -->
					<input name="purSettle.cscontractid" id="cscontractid" class="nui-hidden" />
					<!-- 项目ID -->
					<input name="expReiList.projectid" id="projectid" class="nui-hidden" />
					<!-- 报销记录id -->
					<input name="expReiList.expRei.reiid" id="reiid" class="nui-hidden" />
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">受益部门：</td>
							<td><input name="expReiList.benefdeptno" id="benefitid2" readOnly="readOnly" showButton="false" class="nui-buttonedit" required="false" style="width:100px" /></td>
							<td align="right" style="width:120px;">付款方式：</td>
							<td><input name="expReiList.expRei.paymode" id="appmode" readOnly="readOnly" showButton="false" class="nui-dictcombobox" dictTypeId="EXP_PAYMODE" required="true" style="width:150px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">收款单位：</td>
							<td><input name="expReiList.expRei.companyname" id="companyname" readOnly="readOnly" showButton="false" class="nui-textbox" required="true" style="width:250px"/></td>
							<td align="right" style="width:120px;">银行名称：</td>
							<td><input name="expReiList.expRei.bankname" id="bankname" readOnly="readOnly" showButton="false" class="nui-textbox" required="false" style="width:150px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">银行账号：</td>
							<td><input name="expReiList.expRei.bankacct" id="bankacct" readOnly="readOnly" showButton="false" class="nui-textbox" required="false" style="width:250px"/></td>
							<td align="right" style="width:120px;">外包服务金额(元)：</td>
							<td><input name="expReiList.expRei.total" id="setamount2" inputStyle="text-align: right" readOnly="readOnly" class="nui-textbox" required="false" style="width:150px"/></td>
							<!-- <td align="right" style="width:120px;">单位电话：</td>
							<td><input name="erpexptpettyexp.companytel" id="companytel" readOnly="readOnly" showButton="false" class="nui-textbox" required="false" style="width:150px"/></td> -->
						</tr>
						<tr>
							<td align="right" style="width:120px;">对应客户：</td>
							<td><input name="expReiList.custname" id="custno2" readOnly="readOnly" showButton="false" valueField="miscustid" textField="custname" class="nui-combobox" required="false" style="width:250px;" /></td>
							<td align="right" style="width:120px;">对应项目：</td>
							<td><input name="expReiList.projectname" id="projectno2" readOnly="readOnly" showButton="false" valueField="projectNo" textField="projectName" class="nui-combobox" required="false" style="width:250px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">对应项目编号：</td>
							<td colspan="3"><input name="expReiList.projectno" id="projectno3" readOnly="readOnly" class="nui-textbox" required="false" style="width:150px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">解释说明：</td>
							<td colspan="3"><input name="expReiList.explain" id="explain" readOnly="readOnly" class="nui-textarea" required="false" style="width:450px;height:40px;"/></td>
						</tr>
						<span>
						<tr>
							<td align="right" style="width:120px;">报销单：</td>
							<td id="projectid2" style="width:140px"></td>
							<td align="right" style="width:120px;">商务合同：</td>
							<td id="cscontnum" style="width:140px"></td>
						</tr>
						</span>
					</table>
				</div>
			</fieldset>
			<fieldset id="field6" style="border: solid 1px #aaa;padding: 3px;">
				<legend>冲销记录</legend>
				<div>
					<div class="nui-CheckBox" name="purOutcost.checkSure" id="checkSure" onclick="checkSure()" checked="true" text="是否增加计提冲销记录" trueValue="1" falseValue="0"></div>
					<input name="purOutcost.contnum" id="purOutcostContnum" class="nui-hidden" />
					<input name="purOutcost.outcosttype" id="purOutcostOutcosttype" class="nui-hidden" />
					<input name="purOutcost.settlementid" id="purOutcostSettlementid" class="nui-hidden" />
					<input name="purOutcost.accruedid" id="purOutcostAccruedid" class="nui-hidden" />
					<input name="purOutcost.startdate" id="purOutcostStartdate" class="nui-hidden" />
					<input name="purOutcost.enddate" id="purOutcostEnddate" class="nui-hidden" />
					<input name="purOutcost.supplierid" id="purOutcostSupplierid" class="nui-hidden" />
					<input name="purOutcost.outcoststatus" id="purOutcostOutcoststatus" class="nui-hidden" value="1" />
					<input name="purOutcost.confirmdate" id="purOutcostConfirmdate" class="nui-hidden" />
					<input name="purOutcost.pzhs" id="purOutcostPzhs" class="nui-hidden" />
					<table style="table-layout:fixed;" id="table_file2">
						<tr>
							<td align="right" style="width:140px;" id="a1">成本结转金额(含税)：</td>
							<td><input name="purOutcost.taxmon" id="purOutcostTaxmon" onblur="changePurOutcostTax" required="true" class="nui-textbox" inputStyle="text-align: right;" style="width: 100px;" /></td>
							<td align="right" style="width:100px;" id="a2">税率：</td>
							<td id="a7"><input name="purOutcost.tax" id="purOutcostTax" onblur="changePurOutcostTax" class="nui-textbox" required="true" inputStyle="text-align: right;" style="width: 50px;" />%</td>
							<td align="right" style="width:140px;" id="a3">成本结转金额(不含税)：</td>
							<td><input name="purOutcost.notaxmon" id="purOutcostNotaxmon" required="true" class="nui-textbox" inputStyle="text-align: right;" style="width: 100px;" /></td>
						</tr>
						<tr>
							<td align="right" style="width:140px;" id="a4">工作量单位：</td>
							<td><input name="purOutcost.workunit" id="purOutcostWorkunit" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" style="width: 100px;" inputStyle="text-align: right;"/></td>
							<td align="right" style="width:100px;" id="a5">工作量数量：</td>
							<td><input name="purOutcost.workamount" id="purOutcostWorkamount" class="nui-spinner" showButton="false" 
									allowLimitValue="false" changeOnMousewheel="false" style="width: 50px;" inputStyle="text-align: right;"/></td>
							<td align="right" style="width:140px;" id="a6">成本说明</td>
							<td> <input name="purOutcost.costmemo" id="costmemo" class="nui-combobox" multiSelect="false" required="true" inputStyle="text-align: right;" 
							style="width: 100px;" showNullItem="true" textField="dictname" valueField="dictid" dataField="costmemos"/></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
		<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
			<legend>外包结算附件</legend>
			<jsp:include page="/ame_common/detailAndDelFile.jsp"/>
			<jsp:include page="/ame_common/addFiles1.jsp"/>
		</fieldset>
		<!-- 审核意见  -->
		<form id="opioionform" method="post">
			<input name="misOpinion.auditstatus" value="1" class="nui-hidden" />
		    <input name="misOpinion.processinstid" id="processinstid" class="nui-hidden" />
		    <input name="misOpinion.processinstname" id="processinstname" class="nui-hidden" />
		    <input name="misOpinion.activitydefid" id="activitydefid" class="nui-hidden" />
		    <input name="misOpinion.workitemid" id="workitemid" class="nui-hidden" />
		    <input name="misOpinion.workitemname" id="workitemname" class="nui-hidden" />
		    <input name="misOpinion.isshow" id="isshow" class="nui-hidden" />
			<input name="misOpinion.fileids" id="fileids"  class="nui-hidden"/>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
		        <legend>审批意见列表</legend>
	        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
				    url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext"  idField="id" allowResize="true"
				    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
				    <div property="columns">
				    	<div type="indexcolumn" headerAlign="center" width="30" >编号</div>
				        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
				        <div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
				        <div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center">处理结果</div>
				        <div field="auditopinion" width="150" headerAlign="center">处理意见</div>
				        <div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
				        <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
				        <div field="files" renderer="onFileRenderer" width="100" hight="100"  align="center" headerAlign="center">附件</div>
				    </div>
				</div>
		        <div style="padding:5px;" id="opinionHide">
		            <table style="table-layout:fixed;">
		            	<tr>
		                    <td style="width:150px;" align="right">审核结果：</td>
		                    <td style="width:250px;">  
								<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
		                    </td>
		                    <td style="width:366px;" align="right" colspan="2">
								<a class="nui-button" onclick="doSHZT" style="width:100px;margin-right:20px;">悬挂意见保存</a>
		                    </td>
		                </tr>
		                <tr id="choosehide">
		                    <td  style="width:150px;" align="right">回退到：</td> 
		                    <td style="width:140px;" colspan="3">
		                    	<input name="misOpinion.backTo" id="backTo" class="nui-combobox" valueField="id" textField="name" style="width:200px" required="true" />
		                    </td>
		                </tr>
		                <tr>
		                    <td style="width:150px;" align="right">审核意见：</td>
		                    <td style="width:300px;" colspan="3">
		                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:400px;height:40px;"/>
		                    </td>
		                </tr>
			            <!-- 
			            2016/11/08 15:52事业部领导审批人的设置修改到“结算单财务复核环节”。
			            <tr>
		                    <td style="width:150px;" align="right">事业部领导审批人：</td>
		                    <td style="width:410px;" colspan="3">   
			                    <input id="sybcheckerid" name="misOpinion.sybcheckerid" class="nui-buttonedit" onbuttonclick="showEmployeesyb" style="width:300px;"  allowInput="false"/>	 	                     
		                    </td>
		                </tr> -->
		                <tr>
		                	<td style="width:150px;" align="right">公司领导审批人：</td>
		                    <td style="width:410px;" colspan="3">   
			                    <input id="checkerid" name="misOpinion.checkerid" class="nui-buttonedit" onbuttonclick="showEmployee" style="width:300px;"  allowInput="false"/>	 	                     
		                    </td>
		                </tr>
		            </table>
		        </div>
		    </fieldset>
	    </form>
		<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
			<legend>审核意见附件</legend>
			<jsp:include page="/ame_common/addFiles.jsp"/>
		</fieldset>
		<div id="win1" class="nui-window" title="成本确认日期" style="width:100px;height:120px;" 
		    showMaxButton="true" showCollapseButton="true" showShadow="true"
		    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
	    	<div style="padding:5px;">
	    		<input name="purOutcost.confirmdate" id="confirmdate" class="nui-datePicker" style="width: 100px;margin-left: 10px;"/>
	    	</div>
		    <div property="footbar" style="padding:5px;margin-left: 10px;">
		        <input type='button' value='确定' onclick="sureDate()" style="vertical-align: bottom;"/>
		        <input type='button' value='关闭' onclick="hideWindow()" style="vertical-align: bottom;margin-left: 20px"/>
		    </div>
		</div>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	
	<script type="text/javascript">
        nui.parse();
	  	var form = new nui.Form("#form1");
	  	var opioionform = new nui.Form("#opioionform");
	  	var datagridOutperson = nui.get("datagridOutperson");
	  	var grid2 = nui.get("datagrid2");
	  	var dosuminit = 0;
	  	//计提状态为：确认计提审核中的工作量数量
		var sumWorkamount = 0;
	  	var dosuminit = 0;
	  	var settlementnohave = false;
		init();
		
		document.getElementById("choosehide").style.display="none";
		function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
		}
    	//审核结果触发
    	//审核结果设置
		var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
		nui.get("auditstatus").setData(dataStatus);
		nui.get("auditstatus").setValue("1");
	    nui.get("auditopinion").setValue("同意。");
	    //审核结果触发
	    function show(){
			var auditopinion = nui.get("auditopinion").getValue().trim();
			var auditstatus = nui.get("auditstatus").getValue();
			if(auditstatus=='0'){
				if(auditopinion=="同意。"){
					nui.get("auditopinion").setValue("");
				}
				chooselink();
			}else if(auditstatus=='1'){
				if(auditopinion==""){
					nui.get("auditopinion").setValue("同意。");
				}
				showNone();
			}else if(auditstatus=='2'){
				if(auditopinion=="同意。"){
					nui.get("auditopinion").setValue("");
				}
				showNone();
			}
		}
		function showNone(){
			nui.get("backTo").setValue("");
			document.getElementById("choosehide").style.display="none";
		}
		function chooselink(){
			document.getElementById("choosehide").style.display="";
		}
	
		//合同审批意见附件信息
		function onFileRenderer(e) {
	        var tempSrc = "";
	        for(var i=0;i<e.record.files.length;i++){
	        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>,&nbsp;&nbsp;&nbsp;&nbsp;";
	        }
	       	return tempSrc;
		}
		initcostmemo();
		function initcostmemo(){
			nui.ajax({	
			      url: "com.primeton.eos.ame_pur.settlePay.getCostmemo.biz.ext",
			      type: 'POST',
		          success: function (text) {
		       	  	//加载成本说明
		       	  	nui.get("costmemo").setData(text.costmemos);
		          },
			      error: function (jqXHR, textStatus, errorThrown) {
			        alert(jqXHR.responseText);
			      }
		    });
		}
		function init(){
			var opioionform = new nui.Form("opioionform");
    		var data={workItemID: <%=workItemID %>,goSettleStep: "standard"};
			var json=nui.encode(data);
			nui.ajax({
				url:"com.primeton.eos.ame_pur.settlePay.getGoSettlePay.biz.ext",
				type:"post",
				data:json,
				contentType:"text/json",
				success:function (o){
					o = nui.clone(o);
					//加载结算附件设置参数
            		nui.get("grid_0").load({"groupid":"purSettle","relationid":o.purSettle.settlementid});
					//结算单表单赋值
					nui.get("startdate").setValue(o.purSettle.startdate);
					nui.get("enddate").setValue(o.purSettle.enddate);
					nui.get("workunit").setValue(o.purSettle.workunit);
					nui.get("workamount").setValue(o.purSettle.workamount);
					//计算不含税
					var setamount = o.purSettle.setamount ==null?0: o.purSettle.setamount;
					var tax =o.purSettle.tax == null ? 0 : (o.purSettle.tax)*100;
					var notaxmon =o.purSettle.notaxmon ==null?setamount/(1+parseFloat(tax)):o.purSettle.notaxmon;
					nui.get("setamount").setValue(setamount);
					nui.get("tax").setValue(tax);
					nui.get("notaxmon").setValue(notaxmon);
					
					nui.get("confper").setValue(o.purSettle.confper);
					nui.get("comment").setValue(o.purSettle.comment);
					nui.get("settlementid").setValue(o.purSettle.settlementid);
					nui.get("fileids").setValue(o.purSettle.fileids);
					nui.get("setstatus").setValue(o.purSettle.setstatus);
					nui.get("suppliersname").setValue(o.purSettle.suppliersname);
					nui.get("processinstid2").setValue(o.purSettle.processinstid);
					nui.get("processinstidSettle").setValue(o.purSettle.processinstid);
					nui.get("costtype").setValue(o.purSettle.costtype);
					//结算单编号
					nui.get("settlementno").setValue(o.purSettle.settlementno);
					nui.get("contnum").setValue(o.purSettle.contnum);
					nui.get("contnum").setText(o.purSettle.contnum);
					//报销单赋值
					nui.get("custid").setValue(o.purSettle.custid);//供应商id
					nui.get("custid").setText(o.purSettle.custname);//供应商名称
					nui.get("custno").setValue(o.purSettle.miscustid);//客户id
					nui.get("custno").setText(o.purSettle.miscustname);//客户名称
					nui.get("projectno").setValue(o.purSettle.projectno);
					nui.get("projectno").setText(o.purSettle.projectname);
					nui.get("purSettleProjectid").setValue(o.purSettle.projectid);
					nui.get("benefitid").setValue(o.purSettle.orgid);
					nui.get("benefitid").setText(o.purSettle.orgname);
					
					//流程和工作项ID
					nui.get("workitemid").setValue(<%=workItemID %>);
					nui.get("processinstid").setValue(o.purSettle.processinstid);
					
					//报销单表单赋值
					nui.get("setamount2").setValue(o.purSettle.setamount == null ? 0 : o.purSettle.setamount);
					nui.get("projectid").setValue(o.purSettle.projectid);//项目id
					nui.get("projectno2").setValue(o.purSettle.projectno);//项目no
					nui.get("projectno2").setText(o.purSettle.projectname);//项目名称
					nui.get("projectno3").setValue(o.purSettle.projectno);
					nui.get("custno2").setValue(o.purSettle.custno);//客户no
					nui.get("custno2").setText(o.purSettle.miscustname);//客户名称
					nui.get("benefitid2").setValue(o.purSettle.orgid);//所属销售id
					nui.get("benefitid2").setText(o.purSettle.orgname);//所属销售名称
					if(o.purSettle.cscontractid){
						nui.get("cscontractid").setValue(o.purSettle.cscontractid);
						if(o.purSettle.cscontnum){
							document.getElementById("cscontnum").innerHTML = "<a href='#' onclick='javascript: doViewCsContract();' >" + o.purSettle.cscontnum + "</a>";
						}else{
							document.getElementById("cscontnum").innerHTML = "<a href='#' onclick='javascript: doViewCsContract();' >" + o.purSettle.cscontractid + "</a>";
						}
					}else{
						document.getElementById("cscontnum").innerHTML = "无销售合同";
					}
					
					nui.get("reiid").setValue(o.expReiList.expRei.reiid);//报销记录id
					nui.get("bankname").setValue(o.expReiList.expRei.bankname);//银行卡名称
					nui.get("bankacct").setValue(o.expReiList.expRei.bankacct);//银行卡账号
					nui.get("companyname").setValue(o.expReiList.expRei.companyname);//收款单位
					nui.get("appmode").setValue(o.expReiList.expRei.paymode);//付款方式
					//nui.get("companytel").setValue(o.erpexptpettyexp.companytel);//单位电话
					nui.get("explain").setValue(o.expReiList.explain);//解释说明
					nui.get("pettyexpno").setValue(o.expReiList.expno);//报销单编号
					document.getElementById("projectid2").innerHTML = "<a href='#' onclick='javascript: doView();' >" + o.purSettle.pettyexpno + "</a>";
					//会签审批人lookup 待完善
					var name = "";
                    var id = "";
                    var sybname = "";
                    var sybid = "";
                    for(var i = 0;i < o.leaders.length;i++){
                    	name += o.leaders[i].name+",";
                    	id += o.leaders[i].id+",";
                    }
                    for(var i = 0;i < o.sybleaders.length;i++){
						sybname += o.sybleaders[i].name+",";
                    	sybid += o.sybleaders[i].id+",";  
                    }
                    name = name.substring(0,name.length-1);
                    id = id.substring(0,id.length-1);
                    sybname = sybname.substring(0,sybname.length-1);
                    sybid = sybid.substring(0,sybid.length-1);
                    nui.get("checkerid").setValue(id);
                    nui.get("checkerid").setText(name);
					var custid = o.purSettle.custid;//供应商id
					var orgid = o.purSettle.orgid;//所属销售
					//结算单编号 
					var settlementid = o.purSettle.settlementid;
					//与订单相关外包人员信息
                    var projectno = nui.get("projectno").getValue();
					var custno = nui.get("custno").getValue();
					var jsonnew = nui.encode({purSettle: 
						{settlementid: settlementid,projectno: projectno,custid: custid,custno: custno}
					});
                	nui.ajax({
		        		url: "com.primeton.eos.ame_pur.outperson.queryOutSettleLook.biz.ext",
		                data: jsonnew,
		                type: 'POST',
		                cache: false,
		                showModal: false,
		                contentType: 'text/json',
		                success: function (onew) {
		                	datagridOutperson.setData(onew.purSettle.purSettleList);
                			datagridOutperson.selectAll(false);
                			dosuminit = 1;
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		        	});
                    //与订单相关的计提信息
					var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: o.purSettle.projectno,settlementid: settlementid,iden: "2"}});
                	grid2.load(jsonPresettle,function(){
                		grid2.selectAll(false);
                		var rowsPresettle = grid2.getSelecteds();
                		for(var i = 0;i < rowsPresettle.length;i++){
                			if(rowsPresettle[i].settlementid != settlementid){
                				grid2.deselect(rowsPresettle[i]);
                			}
                		}
                		if(o.purOutcost!=null){
                			nui.get("purOutcostWorkunit").setValue(o.purOutcost.workunit);
                			nui.get("purOutcostWorkamount").setValue(o.purOutcost.workamount);
                			nui.get("purOutcostTaxmon").setValue(o.purOutcost.taxmon);
                			nui.get("purOutcostTax").setValue(o.purOutcost.tax);
                			nui.get("purOutcostNotaxmon").setValue(o.purOutcost.notaxmon);
                			nui.get("costmemo").setValue(o.purOutcost.costmemo);
                			nui.get("purOutcostContnum").setValue(o.purOutcost.contnum);
                		}else{
                			//------------------------------------------------冲销信息初始化----开始----------------------------------
	                		//结算金额
							var setamount = nui.get("setamount").getValue();
							//计提金额
							var sumtotalpre = document.getElementById("sumtotalpre").innerHTML;
							//合同编号
							nui.get("purOutcostContnum").setValue(o.purSettle.contnum);
							var date = new Date();
							var rows = grid2.getSelecteds();
							//成本结转类型：1、计提，2、采购结算，3、计提冲销
							for(var i = 0;i < rows.length;i ++){
								if(rows[i].accruedstatus == "2"){	//确认计提审核中
									sumAccruedmoney += rows[i].accruedmoney;
									//工作量数量
									sumWorkamount += rows[i].workamount;
								}
							}
							//成本结转的工作量单位
	                		nui.get("purOutcostWorkunit").setValue(o.purSettle.workunit);
	                		//成本结转的工作量数量
	                		nui.get("purOutcostWorkamount").setValue(parseFloat(o.purSettle.workamount - sumWorkamount).toFixed(3)); 
							//计算成本结转金额（含税）
							setamount = parseFloat(setamount);
							sumAccruedmoney = parseFloat(sumAccruedmoney);
							//结转含税金额
							var purOutcostTaxmon = parseFloat(setamount-sumAccruedmoney).toFixed(2);
							purOutcostTaxmon = parseFloat(purOutcostTaxmon).toFixed(2);
							nui.get("purOutcostTaxmon").setValue(purOutcostTaxmon);
							//结转税率
							var purOutcostTax = o.purSettle.tax == null ? 0 : o.purSettle.tax*100;
							purOutcostTax = parseFloat(purOutcostTax).toFixed(2);
							nui.get("purOutcostTax").setValue(purOutcostTax);
							//结转不含税金额
							var purOutcostNotaxmon = parseFloat(purOutcostTaxmon/(1 + o.purSettle.tax)).toFixed(2);
							nui.get("purOutcostNotaxmon").setValue(purOutcostNotaxmon);
							if(sumAccruedmoney != 0){	//确认计提审核中的计提总金额不为0，成本结转类型为计提冲销
								nui.get("purOutcostOutcosttype").setValue("3");
								var accruedids = "";
								for(var i = 0; i < rows.length; i++){
									if(rows[i].accruedstatus == "2"){
										if(accruedids == ""){
											accruedids = rows[i].accruedid;
										}else{
											accruedids = accruedids + "," + rows[i].accruedid;
										}
									}
								}
								//计提单编号
								nui.get("purOutcostAccruedid").setValue(accruedids);
							}else{						//确认计提审核中的计提总金额为0，成本结转类型为采购结算
								nui.get("purOutcostOutcosttype").setValue("2");
							}
							//结算单编号
							nui.get("purOutcostSettlementid").setValue(o.purSettle.settlementid);
							//成本开始日期
							nui.get("purOutcostStartdate").setValue(nui.get("startdate").getValue());
							//成本结束日期
							nui.get("purOutcostEnddate").setValue(nui.get("enddate").getValue());
							//供应商ID
							nui.get("purOutcostSupplierid").setValue(o.purSettle.custid);
							
				        	//------------------------------------------------冲销信息初始化----结束----------------------------------
                		}
                	});
                    //流程回退路径赋值 
                    //填报报销单后面的流程只能回退到填报报销单
                    var backList = o.purSettle.backList;
                    //manualActivity8销售确认--manualActivity4商务合规审核--manualActivity41商务合规复核
                    for(var i = 0;i < backList.length;i++){
                    	if(o.purSettle.backList[i].id == 'manualActivity' || 
                    		o.purSettle.backList[i].id == 'manualActivity1' || 
                    		o.purSettle.backList[i].id == 'manualActivity2' || 
                    		o.purSettle.backList[i].id == 'manualActivity4' || 
                    		o.purSettle.backList[i].id == 'manualActivity8' || 
                    		o.purSettle.backList[i].id == 'manualActivity51' || 
                    		o.purSettle.backList[i].id == 'manualActivity41'){
                    		delete backList[i];
                    	}
                    }
                    backList = nui.decode(backList);
                    nui.get("backTo").setData(backList);
                    //查询审核意见
                    var processinstid = nui.get("processinstid").getValue();
					var grid = nui.get("datagrid1");
					grid.load({processInstID: processinstid});
					grid.sortBy("time", "desc");
					//流程提示信息
        			promptInit({workItemID:<%=workItemID %>});
				},
				error:function(){}
			});
		}
		
		//选择行
		var allSum = 0;
        function onSelect(e){
        	var rows = datagridOutperson.getSelecteds();
        	var sumFee = 0;
        	var sumdays = 0;
        	var summonths = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].totalfee){
					sumFee += parseFloat(rows[i].totalfee);
				}
				if(rows[i].days){
					sumdays += parseFloat(rows[i].days);
				}
				if(rows[i].months){
					summonths += parseFloat(rows[i].months);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			sumdays = parseFloat(sumdays);
			summonths = parseFloat(summonths);
            allSum = sumFee;
            allSum = parseFloat(allSum).toFixed(2);
            if(dosuminit == 1){
        		nui.get("setamount").setValue(allSum);
            }
            document.getElementById("sumtotal").innerHTML = parseFloat(allSum).toFixed(2);
            document.getElementById("daystotal").innerHTML = parseFloat(sumdays).toFixed(2);
            document.getElementById("monthstotal").innerHTML = parseFloat(summonths).toFixed(3);
        }
        
        //取消选中行
        function onDeselect(e){
        	var rows = datagridOutperson.getSelecteds();
        	var sumFee = 0;
        	var sumdays = 0;
        	var summonths = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].totalfee){
					sumFee += parseFloat(rows[i].totalfee);
				}
				if(rows[i].days){
					sumdays += parseFloat(rows[i].days);
				}
				if(rows[i].months){
					summonths += parseFloat(rows[i].months);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			sumdays = parseFloat(sumdays);
			summonths = parseFloat(summonths);
			allSum = sumFee;
			allSum = parseFloat(allSum).toFixed(2);
			if(dosuminit == 1){
        		nui.get("setamount").setValue(allSum);
			}
			document.getElementById("sumtotal").innerHTML = parseFloat(allSum).toFixed(2);
			document.getElementById("daystotal").innerHTML = parseFloat(sumdays).toFixed(2);
            document.getElementById("monthstotal").innerHTML = parseFloat(summonths).toFixed(3);
        }
        
        //选择行计提
        var allSumPre = 0;
        var allSumNotPre = 0;
        function onSelectPre(e){
        	var rows = grid2.getSelecteds();
        	var sumFee = 0;
        	var sumNotFee = 0;
        	var sumWorkamount = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].accruedmoney){
					sumFee += parseFloat(rows[i].accruedmoney);
					sumNotFee += parseFloat(rows[i].notaxmoney);
				}
				if(rows[i].workamount){
					sumWorkamount += parseFloat(rows[i].workamount);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			sumNotFee = parseFloat(sumNotFee).toFixed(2);
			sumWorkamount = parseFloat(sumWorkamount).toFixed(3);
            allSumPre = sumFee;
            allSumNotPre = sumNotFee;
            allSumPre = parseFloat(allSumPre).toFixed(2);
            allSumNotPre = parseFloat(allSumNotPre).toFixed(2);
            document.getElementById("sumtotalpre").innerHTML = parseFloat(allSumPre).toFixed(2);
            document.getElementById("sumNottotalpre").innerHTML = parseFloat(allSumNotPre).toFixed(2);
            document.getElementById("sumtotalworkamount").innerHTML = parseFloat(sumWorkamount).toFixed(3);
        }
        
        //取消选中行计提
        function onDeselectPre(e){
        	var rows = grid2.getSelecteds();
        	var sumFee = 0;
        	var sumNotFee = 0;
        	var sumWorkamount = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].accruedmoney){
					sumFee += parseFloat(rows[i].accruedmoney);
					sumNotFee += parseFloat(rows[i].notaxmoney);
				}
				if(rows[i].workamount){
					sumWorkamount += parseFloat(rows[i].workamount);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			sumNotFee = parseFloat(sumNotFee).toFixed(2);
			sumWorkamount = parseFloat(sumWorkamount).toFixed(3);
			allSumPre = sumFee;
			allSumNotPre = sumNotFee;
			allSumPre = parseFloat(allSumPre).toFixed(2);
			allSumNotPre = parseFloat(allSumNotPre).toFixed(2);
			document.getElementById("sumtotalpre").innerHTML = parseFloat(allSumPre).toFixed(2);
			document.getElementById("sumNottotalpre").innerHTML = parseFloat(allSumNotPre).toFixed(2);
			document.getElementById("sumtotalworkamount").innerHTML = parseFloat(sumWorkamount).toFixed(3);
        }
        
		function SaveData(){
			var auditstatus = nui.get("auditstatus").getValue();
			if(auditstatus == "1"){	
				if(!form.validate()){
					return;
				}
			}
			makeGoSettlePayStandard();
		}
		
		//调用合规审核逻辑流
    	function makeGoSettlePayStandard(){
    		var data = form.getData();
    		var opioionformData = opioionform.getData();
    		var backTo = nui.get("backTo").getValue();
    		data.backTo = backTo;
    		data.expReiList.projectno2 = nui.get("projectno2").getText();
    		data.expReiList.custno2 = nui.get("custno2").getValue();
    		data.expReiList.custname2 = nui.get("custno2").getText();
    		data.expReiList.benefitid2 = nui.get("benefitid2").getText();
    		var settlementno1 = nui.get("settlementno").getValue();
    		data.expReiList.settlementno="结算单编号："+settlementno1;
    		//计提信息
    		var purPresettles = grid2.getSelecteds();
			data.purSettle.purPresettles = purPresettles;
			data.purSettle.tax = data.purSettle.tax/100;
    		//审核信息
    		data.misOpinion = opioionformData.misOpinion;
    		var json = nui.encode(data);
    		nui.ajax({
    			url:"com.primeton.eos.ame_pur.settlePay.makeGoSettlePayStandard.biz.ext",
    			data:json,
    			type:"post",
    			contentType:"text/json",
    			success:function(action){
					if(action.exception == null){
			        	nui.alert("提交成功",null,function(){
				        	CloseWindow("ok");
			        	});
    				}else{
    					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(){
    						nui.get("sureButton").setEnabled(true);
    					});
    				}
    			},
    			error:function(jqXHR, textStatus, errorThrown){
    				nui.alert("error:" + jqXHR.responseText);
    			}
    		});
    	}
    	
    	//设置不含税
    	function noTaxaMount(){
    		var setamount = nui.get("setamount").getValue();
    		var tax = parseFloat(nui.get("tax").getValue());
    		var notaxmon = setamount/(1 + tax/100);
    		nui.get("notaxmon").setValue(parseFloat(notaxmon).toFixed(2));
    	}
		//设置业务字典值-事业部
		function dictGetContOrg(e){
			return nui.getDictText('CONT_ORG',e.value);
		}
		
		//设置业务字典值-计提状态
		function dictGetStatus(e){
			return nui.getDictText('AME_ACCRUEDSTATUS',e.value);
		}
		
		//设置业务字典值-采购订单状态
	    function dictGetOrderStatus(e){
	    	return nui.getDictText('AME_ORDERSTATUS',e.value);
	    }
	    
	    //设置业务字典值-成本归属类型
		function dictGetCostType(e){
			return nui.getDictText('AME_CONTCOSTTYPE',e.value);
		}
		
		//设置业务字典值-工作量单位
		function dictGetWorkunit(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);
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
        
		function onOk(){
			var filePaths = document.getElementsByName("uploadfile").length;
			var auditstatus = nui.get("auditstatus").getValue();
			if(auditstatus == 0 && nui.get("settlementno").getValue() == ""){
				nui.get("settlementno").setRequired(false);
			}else{
				if(settlementnohave){
					nui.alert("结算单编号已存在");
					return;
				}
			}
			if(auditstatus == "2"){
				for(var j=0;j < filePaths;j++){
	        		var a = document.getElementsByName("remarkList")[j].value;
	        		if(a == null || a == ""){
	        			nui.alert("新增附件不可以为空");
	        			return false;
	        		}
	        	}
				var filePaths1 = document.getElementsByName("uploadfile1").length;
	        	for(var j = 0;j < filePaths1;j++){
	        		var a = document.getElementsByName("remarkList1")[j].value;
	        		if(a == null || a == ""){
	        			nui.alert("新增附件不可以为空");
	        			return false;
	        		}
	        	}
				nui.confirm("确定终止流程吗？", "操作提示",
		            function (action) {            
		                if (action == "ok") {
		                	nui.get("sureButton").setEnabled(false);
					    	document.getElementById("fileCatalog1").value="purSettle";
							form4.submit();
						}else{
							return;
						}
					}
				);
			}else if(auditstatus == "0"){
				for(var j=0;j < filePaths;j++){
	        		var a = document.getElementsByName("remarkList")[j].value;
	        		if(a == null || a == ""){
	        			nui.alert("新增附件不可以为空");
	        			return false;
	        		}
	        	}
				var filePaths1 = document.getElementsByName("uploadfile1").length;
	        	for(var j = 0;j < filePaths1;j++){
	        		var a = document.getElementsByName("remarkList1")[j].value;
	        		if(a == null || a == ""){
	        			nui.alert("新增附件不可以为空");
	        			return false;
	        		}
	        	}
	        	if(opioionform.validate()){
					nui.confirm("确定退回吗？", "操作提示",
			            function (action) {            
			                if (action == "ok") {
			                	nui.get("sureButton").setEnabled(false);
						    	document.getElementById("fileCatalog1").value="purSettle";
								form4.submit();
							}else{
								return;
							}
						}
					);
				}else{
					return;
				}
			}else{
				if(!nui.get("costtype").getValue()){
					nui.alert("成本类型不能为空");
					return;
				}
	        	for(var j=0;j < filePaths;j++){
	        		var a = document.getElementsByName("remarkList")[j].value;
	        		if(a == null || a == ""){
	        			nui.alert("新增附件不可以为空");
	        			return false;
	        		}
	        	}
				var filePaths1 = document.getElementsByName("uploadfile1").length;
	        	for(var j = 0;j < filePaths1;j++){
	        		var a = document.getElementsByName("remarkList1")[j].value;
	        		if(a == null || a == ""){
	        			nui.alert("新增附件不可以为空");
	        			return false;
	        		}
	        	}
	        	/* if(auditstatus == "1" && (nui.get("sybcheckerid").getValue() == "" || nui.get("checkerid").getValue() == "")){
	        		nui.alert("审批通过时领导审批人不允许为空");
	        		return false;
	        	} */
	        	if(auditstatus == "1" && nui.get("checkerid").getValue() == ""){
	        		nui.alert("审批通过时领导审批人不允许为空");
	        		return false;
	        	}
				if(form.validate()){
					nui.confirm("确定提交吗？", "操作提示",
		            function (action) {            
		                if (action == "ok") {
		                	nui.get("sureButton").setEnabled(false);
					    	document.getElementById("fileCatalog1").value="purSettle";
							form4.submit();
						}else{
							return;
						}
					});
				}else{
					return;
				}
			}
	    }
    	function doSHZT(){
    		if(nui.get("auditopinion").getValue().trim() == ""){
    			nui.alert("悬挂时审核意见不可以为空");
        		return false;
    		}else{
    			if (!confirm("是否保存悬挂时的审核意见？")) {
                    return false;
                }else{
		    		var data = opioionform.getData();
		    		data.misOpinion.auditstatus = "5";
		    		var json = nui.encode(data);
		    		nui.ajax({
		    			url:"com.primeton.eos.ame_common.mail.saveMisopinion.biz.ext",
		    			data:json,
		    			type:"post",
		    			contentType:"text/json",
		    			success:function(action){
		    				if(action.exception == null){
					        	nui.alert("提交成功",null,function(){
						        	nui.get("datagrid1").reload();
					        	});
		    				}else{
		    					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
		    					});
		    				}
		    			},
		    			error:function(jqXHR, textStatus, errorThrown){
		    				nui.alert("error:" + jqXHR.responseText);
		    			}
		    		});
		    	}
    		}
    	}    
        function onCancel(e) {
            var data = form.getData();
        	if(data){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action=="yes"){
		                	CloseWindow("cancel");
		                }
		            }
		        });
			}else{
				CloseWindow("cancel");
			}
        }
    	
		//查看报销单信息
		function doView(){
			var reiid = nui.get("reiid").getValue();
			var executeUrl = "<%= request.getContextPath() %>/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + reiid;
			window.open(executeUrl);
			}
		
		//查看销售合同信息
		function doViewCsContract(){
			<%	String newBXAdd = ConfigurationUtil.getContributionConfig("com.primeton.eos.ame_common","NewBXSystem","addressAndPort","ipaddress");
				String newBXPort = ConfigurationUtil.getContributionConfig("com.primeton.eos.ame_common","NewBXSystem","addressAndPort","port");
				String newBXAppName = ConfigurationUtil.getContributionConfig("com.primeton.eos.ame_common","NewBXSystem","addressAndPort","appName");
			 %>
			var cscontractid = nui.get("cscontractid").getValue();
			var newBXPort = "<%=newBXPort %>"
			if(newBXPort == ""){
				window.open("http://<%=newBXAdd %>/<%=newBXAppName %>/contract/contract/contractView.jsp?contractid="+cscontractid,"csContractView","height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
			}else{
				window.open("http://<%=newBXAdd %>:<%=newBXPort %>/<%=newBXAppName %>/contract/contract/contractView.jsp?contractid="+cscontractid,"csContractView","height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
			}
		}
		
		function SaveData1(){
        	document.getElementById("fileCatalog").value="MIS_OPINION";
            form2.submit();
    	}
    	
    	//选择公司领导审批人
    	function showEmployee(e) {
	        var btnEdit = this;
	        nui.open({
				url:"<%=request.getContextPath() %>/ame_common/tree/lazytree.jsp",
				title: "选择公司领导审批人",
				width: 600,
				height: 400,
				onload: function () {
	                var iframe = this.getIFrameEl();
	                var empname=nui.get("checkerid").getText();
	                var userid=nui.get("checkerid").getValue();
	                if(userid){
	                	var data = {empname:empname,userid:userid};
	                }else{
	                	var data={};
	                }
	                iframe.contentWindow.SetData(data);
	            },
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
			                btnEdit.setValue(data.userid);
			                btnEdit.setText(data.empname);
						}
					}
				}
			});
		}
		
		//检查结算单编码是否存在
        function checkSettlementno(){
        	//结算单编码
        	var settlementno = nui.get("settlementno").getValue();
        	var settlementid = nui.get("settlementid").getValue();
        	if(settlementno){
        		var json = {purSettle: {settlementno: settlementno,settlementid: settlementid}};
	            form.loading("检查结算单编码是否重复...");
	            nui.ajax({
	                url: "com.primeton.eos.ame_pur.settle.checkSettlementno.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	form.unmask();
	                	text = nui.clone(text);
	                	if(text.result == "chongfu"){
	                		nui.alert("结算单编号已存在");	
	                		settlementnohave = true;
	                	}else{
	                		settlementnohave = false;
	                	}
	         
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	            });
        	}
        	
        }
        
        //选择财务对应合同弹窗
        function selectCont(){
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_common/contract_lookup.jsp",
                title: "选择合同",
                width: 1000,
                height: 520,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.text);
                            btnEdit.setText(data.text);
                        }
                    }
                }
            });
        }
        
        //确认计提
	    function onActionRenderer(e) {
            var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
            var rowIndex = e.rowIndex;
            var s = null;
            if(record.accruedstatus == 4 || record.accruedstatus == 0){
	            s = ' <a class="Edit_Button" href="javascript: editRow(\'' + uid + '\')" >计提确认</a>' ;
            }
            return s;
        }
        
        var chooseRow = "";
        function editRow(row_uid) {
        	//成本确认日期为空，设置为当天。
            var row = grid2.getRowByUID(row_uid);
            if (row) {
	        	if(nui.get("confirmdate").getValue() == ""){
		        	nui.get("confirmdate").setValue(new Date());
	        	}
        		showAtPos();
        		chooseRow = row;
            }
        }
        
        //成本确认日期
        function showAtPos() {
	        var win = nui.get("win1");
	        win.showAtPos("center", "middle");
	    }
	    function hideWindow() {
	        var win = nui.get("win1");
	        win.hide();
	    }
	    function sureDate(){
	    	hideWindow();
	    	surePreSettle(chooseRow);
	    }
	    
	    function surePreSettle(row){
	    	nui.confirm("确定要计提确认吗？","操作提示",function(action){
            	if(action == "ok"){
            		var json = nui.encode({"purOutcostParam": {"iden": "reviewCheck","accruedidSure": row.accruedid,
            			"confirmdate": nui.get("confirmdate").getValue(),"settlementid": nui.get("settlementid").getValue()}});
                    grid2.loading("正在计提确认中,请稍等...");
                    nui.ajax({
                        url:"com.primeton.eos.ame_pur.outaccrued.surePresettle.biz.ext",
                        type:'POST',
                        data:json,
                        cache: false,
                        contentType:'text/json',
                        success:function(text){
                            var returnJson = nui.decode(text);
                            grid2.unmask();
                            if(returnJson.exception == null){
                                nui.alert("确认计提成功", "系统提示",function(){
                                	var projectno = nui.get("projectno").getValue();
                                	var settlementid = nui.get("settlementid").getValue();
                                	var custid = nui.get("custid").getValue();
                                	//var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectno,settlementid: settlementid,iden: "2"}});
                                	var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectno,settlementid: settlementid,iden: "2"}});
				                	grid2.load(jsonPresettle,function(){
				                		grid2.selectAll(false);
				                		var rowsPresettle = grid2.getSelecteds();
				                		for(var i = 0;i < rowsPresettle.length;i++){
				                			if(rowsPresettle[i].settlementid != settlementid){
				                				grid2.deselect(rowsPresettle[i]);
				                			}
				                		}
				                	});
                                });
                                
                            }else{
                                nui.alert("确认计提失败", "系统提示");
                            }
                        }
                    }); 
            	}else{
            		//alert("取消");
            	}
            });
	    }
	    
	    /**
         * 查看项目
         */
        function detailProj1(){
	 		var projectid = nui.get("purSettleProjectid").getValue();
	 		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + projectid;
			window.open(executeUrl);
	    }
	    
	    //修改冲销记录税率
    	function changePurOutcostTax(){
    		//含税金额
    		var purOutcostTaxmon = nui.get("purOutcostTaxmon").getValue();
    		//税率
    		var purOutcostTax = nui.get("purOutcostTax").getValue();
    		var purOutcostNotaxmon = 0;
    		if(purOutcostTax){
	    		if(!isNaN(purOutcostTax)){
	    			purOutcostTax = purOutcostTax/100;
		    		purOutcostNotaxmon = purOutcostTaxmon/(1 + parseFloat(purOutcostTax));
	    		}else{
	    			purOutcostNotaxmon = 0;
	    			nui.alert("请输入数字！");
	    		}
    		}else{
    			purOutcostNotaxmon = 0;
    		}
    		nui.get("purOutcostNotaxmon").setValue(parseFloat(purOutcostNotaxmon).toFixed(2));
    	}
    	
    	 //选择是否冲销
        function checkSure(){
        	var checkSure = nui.get("checkSure").getValue();
        	if(checkSure == "1"){
        		nui.get("purOutcostTax").setRequired(true);
        		document.getElementById("purOutcostTaxmon").style.display = "";
        		document.getElementById("purOutcostTax").style.display = "";
        		document.getElementById("purOutcostNotaxmon").style.display = "";
        		document.getElementById("purOutcostWorkunit").style.display = "";
        		document.getElementById("purOutcostWorkamount").style.display = "";
        		document.getElementById("costmemo").style.display = "";
        		document.getElementById("a1").style.display = "";
        		document.getElementById("a2").style.display = "";
        		document.getElementById("a3").style.display = "";
        		document.getElementById("a4").style.display = "";
        		document.getElementById("a5").style.display = "";
        		document.getElementById("a6").style.display = "";
        		document.getElementById("a7").style.display = "";
        	}else{	
        		nui.get("purOutcostTax").setRequired(false);
        		document.getElementById("purOutcostTaxmon").style.display = "none";
        		document.getElementById("purOutcostTax").style.display = "none";
        		document.getElementById("purOutcostNotaxmon").style.display = "none";
        		document.getElementById("purOutcostWorkunit").style.display = "none";
        		document.getElementById("purOutcostWorkamount").style.display = "none";
        		document.getElementById("costmemo").style.display = "none";
        		document.getElementById("a1").style.display = "none";
        		document.getElementById("a2").style.display = "none";
        		document.getElementById("a3").style.display = "none";
        		document.getElementById("a4").style.display = "none";
        		document.getElementById("a5").style.display = "none";
        		document.getElementById("a6").style.display = "none";
        		document.getElementById("a7").style.display = "none";
        	}
        }
	</script>
</body>
</html>