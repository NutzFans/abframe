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
  - Author(s): xuqingqian
  - Date: 2016-10-25 17:20:08
  - Description:
-->
<head>
    <title>财务审核</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    html, body
	    {
	        font-size:12px;
	        padding:0;
	        margin:0;
	        border:0;
	        height:100%;
	        overflow:hidden;
	    }
	     .myIndex{
	        background:#FFF68F;
	    }
	</style>
</head>
<body>
<%long workItemID = (Long)request.getAttribute("workItemID"); %>
<div class="nui-fit">
    <!-- 提示信息展示 -->
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
	<form id="form1" method="post">
	     <fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
	        <legend>采购结算对应的供应商信息</legend>
	        <input class="nui-hidden" name="workitemid" id="workitemid" value="<%=workItemID %>"/>
			<input name="settlementid" id="settlementid" class="nui-hidden"/>
			<input name="misOpinion.fileids" id="fileids" class="nui-hidden"/>
			<input name="purSettle.fileids" id="fileids1" class="nui-hidden"/>
			<input name="purSettle.setstatus" id="setstatus" class="nui-hidden" value="0"/>
			<input name="purSettle.processinstid" id="processinstidSettle" class="nui-hidden" />
			<input name="misOpinion.processinstid" id="processinstid2" class="nui-hidden" />
			<input name="purSettle.purcontid" id="purcontid" class="nui-hidden" />
			<!-- 供应商简称 -->
			<input name="purSettle.suppliersname" id="suppliersname" class="nui-hidden" />
			<input name="purSettle.save" id="save" class="nui-hidden" />
			<input id="projectno" class="nui-hidden" />
			<div style="padding:5px;">
				<table style="table-layout:fixed;" id="table_file">
					<tr>
						<%--<td align="right" style="width:120px;">项目：</td>
						<td><input name="purSettle.projectno" id="projectno"  readOnly="readOnly" class="nui-buttonedit" allowInput="false" emptyText="请选择项目" required="true" style="width:240px" /></td>
						<td align="right" style="width:120px;">供应商：</td>
						<td><input name="purSettle.custid"  id="custid"  readOnly="readOnly"  valueField="custid" textField="custname" class="nui-combobox" required="true" style="width:200px" allowInput="false" />
						</td>--%>
						<td align="right" style="width:120px;">供应商：</td>
						<td colspan="3"><input name="purSettle.custid"  onbuttonclick="changeCust" <%--onvaluechanged="changeCust"--%> id="custid" readOnly="readOnly" valueField="custid" textField="custname" class="nui-buttonedit" emptyText="请选择供应商" required="true" style="width:200px" allowInput="false" />
						</td>
					</tr>
					<tr>
						
					</tr>
					<tr style="display:none">
						<td align="right" style="width:120px;">客户：</td>
						<td><input name="purSettle.custno" id="custno" valueField="miscustid" textField="miscustname" readOnly="readOnly" showButton="false" class="nui-combobox" required="true" style="width:280px;" /></td>
						<td align="right" style="width:120px;">受益部门：</td>
						<td><input name="purSettle.benefitid" readOnly="readOnly" showButton="false" id="benefitid" class="nui-buttonedit" required="false" style="width:100px" /></td>
					</tr>
					<tr style="display:none">
					    <td align="right" style="width:120px;">支付金额(元)：</td>
						<td colspan="3"><input name="purSettle.setamount"  id="setamount"  class="nui-textbox" required="false" style="width:150px" inputStyle="text-align: right;"/>
						</td>
					</tr>
					<tr style="display:none">
					    <td align="right" style="width:120px;">备注：</td>
					    <td colspan="3"><input name="purSettle.comment" id="comment"  class="nui-textarea" required="false" style="width:440px"/></td>				
					</tr>
				</table>
			</div>
	     </fieldset>
	     
	     <fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
	       <legend>采购合同信息</legend>
	       <div id="datagrid" class="nui-datagrid" dataField="purContracts" style="width:100%;height:auto;"
	            url="com.primeton.eos.ame_pur.PurOtherSettlePay.queryPurContract.biz.ext" multiSelect="false"
	            showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" idField="custid"
			    onselectionchanged="onSelectCont" >
			    <div property="columns">
			       <div type="checkcolumn" width="30" visible="false">#</div>
			       <div field="custid" headerAlign="center" allowSort="false" visible="false">供应商编号</div>
			       <div field="purcontid" headerAlign="center" allowSort="false" visible="false">采购合同编号</div>
			       <div field="purcontnum" headerAlign="center" allowSort="false" visible="true" width="70">合同编号</div>
			       <div field="purcontname" headerAlign="center" allowSort="false" visible="true">合同名称</div>
			       <div field="signdate" headerAlign="center" allowSort="false" width="80" align="center" >签订日期</div>
			       <div field="purtype" headerAlign="center" allowSort="false" visible="true" renderer="purcontracttype" width="70">合同类型</div>
			       <div field="purstatus" headerAlign="center" allowSort="false" visible="true" renderer="contype" width="70">合同状态</div>
			       <div field="contmoney" headerAlign="center" allowSort="false" visible="true" width="70" align="right">合同金额</div>
			       <div field="payMoney" headerAlign="center" allowSort="false" visible="true" width="100" align="right">已付款/审核中的合同额</div>
			       <div field="payCount" headerAlign="center" allowSort="false" visible="true" width="70" numberFormat="p" align="right">付款比例</div>
			       <%--<div field="purstatus" headerAlign="center" allowSort="false" visible="true" dictTypeId="CS_CONTRACTTYPE">合同状态</div>--%>
			       <%--<div field="contnum" headerAlign="center" allowSort="false" visible="true">销售合同编号</div>--%>
			       <div field="startdate" headerAlign="center" allowSort="false" width="80" align="center" visible="false">有效开始日期</div>
		           <div field="enddate" headerAlign="center" allowSort="false" width="80" align="center" visible="false">有效截止日期</div>
			       <div field="liankman" headerAlign="center" allowSort="false" visible="false">合同联系人</div>
			       <div field="ouroper" headerAlign="center" allowSort="false" visible="false">我方联系人</div>
			       <div field="comment" headerAlign="center" allowSort="false" visible="false">说明</div>
			    </div>
	       </div>
	     </fieldset>
		     
	     <fieldset id="field10" style="border:solid 1px #aaa;padding:3px;">
	     	<legend>请选择项目(可多选)</legend>
	     	<div id="datagrid10" class="nui-datagrid" dataField="purProjCont" style="width:100%;height:auto;" 
		    	url="com.primeton.eos.ame_pur.PurOtherSettlePay.queryRdProject.biz.ext" multiSelect="true" 
		    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" allowSortColumn="false"
		    	oncellendedit="doSumfee" onselect="onSelectPrj" ondeselect="onSelectPrj" 
		    	onlyCheckSelection="true">
				<div property="columns">
					<div type="checkcolumn" width="30"></div>
					<div field="purcontid" align="center" headerAlign="center" allowSort="false" visible="false">采购合同id</div>
					<div field="projectId" align="center" headerAlign="center" allowSort="false" visible="false">项目id</div>
					<div field="settlementid" align="center" headerAlign="center" allowSort="false" visible="false">结算单编号</div>
					<div field="purcontnum" align="center" headerAlign="center" allowSort="false" visible="false">采购合同编号</div>
					<div field="projectno" width="90" align="center" headerAlign="center" allowSort="false" >项目编号</div>	
					<div field="projectName" width="110" align="center" headerAlign="center" allowSort="false" >项目名称</div>
					<div field="purmoney" headerAlign="center" allowSort="false" visible="true" width="55" align="right">采购金额</div>
					<div field="wzfje" headerAlign="center" allowSort="false" visible="true" width="70" align="right">未支付金额</div>
					<div field="prjfee" width="auto" dataType="currency" align="right" headerAlign="center" allowSort="false" cellCls="myIndex">
						项目结算费用
						<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
					</div>
					<div field="startdate" headerAlign="center" allowSort="true" width="78" align="center" visible="true" dateFormat="yyyy-MM-dd" cellCls="myIndex">结算开始日期
						<input property="editor" class="nui-datepicker" style="width:100%;" />
					</div>
		            <div field="enddate" headerAlign="center" allowSort="true" width="78" align="center" visible="true" dateFormat="yyyy-MM-dd" cellCls="myIndex">结算结束日期
		            	<input property="editor" class="nui-datepicker" style="width:100%;" />
		            </div>
					<div field="contnum" width="80" align="center" headerAlign="center" allowSort="false" visible="true">销售合同编号</div>
					<div field="contract.projectname" width="100" align="center" headerAlign="center" allowSort="false" visible="true">销售合同名称</div>	
					<div field="contract.contsum" headerAlign="center" allowSort="false" visible="true" width="60" align="right">合同金额</div>
					<div field="contract.pay" headerAlign="center" allowSort="false" visible="true" width="80" align="right">已收款合同额</div>
					<div field="contract.paycount" headerAlign="center" allowSort="false" visible="true" width="60" numberFormat="p" align="right">收款比例</div>
					<div field="settlementno" width="105" align="right" headerAlign="center" allowSort="false" visible="false">
						结算单编号
						<input property="editor" class="nui-textbox" style="width:100%;" vtype="float" />
					</div>
				</div>
			</div>
			<div style="width: 100%;height:24px;float:left;">
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width: 350px;">结算费用总计：</td>
						<td id="sumtotal" style="width: 65px;" align="right" ></td>
					</tr>
				</table>
			</div>
	     </fieldset>
	     
	     <fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>计提核销信息</legend>
			<div id="datagrid2" class="nui-datagrid" dataField="purPresettles" style="width:100%;height:auto;" 
			     url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleListToSettle.biz.ext" multiSelect="true"
			     showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" 
			     onselect="onSelectPre" ondeselect="onSelectPre" 
			     onlyCheckSelection="true" allowSortColumn="false">
			     <div property="columns">
			         <div type="checkcolumn" width="30"></div>			
					 <div field="accruedid" headerAlign="center" allowSort="true" align="center" visible="true" width="55">计提编号</div>
		             <div field="custid" headerAlign="center" allowSort="true" width="60" visible="false">供应商编号</div>
		             <div field="custname" headerAlign="center" allowSort="true" visible="false">供应商名称</div>
		             <div field="suppliersname" width="70" headerAlign="center" allowSort="true" >供应商简称</div>
		             <div field="projectno" width="70" headerAlign="center" allowSort="true" visible="true">项目代码</div>
		             <div field="projectname" width="auto" headerAlign="center" allowSort="true" visible="true">项目名称</div>
		             <div field="salesid" headerAlign="center" allowSort="true" visible="false" >所属销售ID</div>
		             <div field="orgname" headerAlign="center" allowSort="true" width="55" align="center" >受益部门</div>
		             <div field="syb" headerAlign="center" allowSort="true" width="70" renderer="dictGetContOrg" >所属事业部</div>
		             <div field="contnum" headerAlign="center" allowSort="true" visible="false">销售合同</div>
		             <div field="startdate" headerAlign="center" allowSort="true" width="75" align="center" visible="true" dateFormat="yyyy-MM-dd">开始日期</div>
		             <div field="enddate" headerAlign="center" allowSort="true" width="75" align="center" visible="true" dateFormat="yyyy-MM-dd">结束日期</div>
		             <div field="accrueddate" headerAlign="center" allowSort="true" width="75" align="center" dateFormat="yyyy-MM-dd">计提时间</div>
		             <div field="accruedmoney" headerAlign="center" allowSort="true" width="55" align="right" dataType="currency" >计提金额</div>
		             <div field="costtype" headerAlign="center" allowSort="true" renderer="dictGetCostType" width="55" align="center" >成本类型</div>
		             <%--<div field="outper" headerAlign="center" allowSort="true" width="200" >相关外包人员</div>--%>
		             <div field="accruedstatus" headerAlign="center" allowSort="true" renderer="dictGetStatus" width="120" align="center" >状态</div>
		             <div field="settlementid" headerAlign="center" allowSort="true" visible="fales" >结算单编号</div>
		             <div field="comment" width="auto" headerAlign="center" allowSort="true" visible="fales">备注</div>
	                <div name="action" width="110" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
			     </div>
	        </div>
			<div style="width:300px;height:25px;margin-left:580px;float:left;">
			    <table style="table-layout:fixed;">
				   <tr>
					  <td align="right" style="width:140px;">计提核销总计：</td>
					  <td id="sumtotalpre" style="width:110px" align="right" ></td>
				   </tr>
			    </table>
			</div>
	    </fieldset>
	     
	     <!-- 填写外包费用页面，除了结算单本身的信息，还需要填报信息：日常零星报销单编号（自生成）、受益部门、
			  付款方式（必选）、收款单位（必选）、银行名称、银行账号、单位电话（可填）、对应客户、对应项目、
			  外包费用对应日期、外包服务金额、解释说明（可填） -->
		<!-- 报销单 -->
		<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
			<legend>本次采购结算信息</legend>
			<div style="padding:5px;">
				<input name="expReiList.expno" id="pettyexpno" class="nui-hidden" style="width:150px"/>
				<!-- 项目ID -->
				<input name="expReiList.projectid" id="projectid" class="nui-hidden" style="width:100px" />
				<!-- 报销单ID -->
				<input name="expReiList.expid" id="expid" class="nui-hidden" style="width:100px" />
				<!-- 报销记录id -->
				<input name="expReiList.expRei.reiid" id="reiid" class="nui-hidden" />
				<input name="expReidetail.ticnum" id="expticnum" class="nui-hidden" />
				<input name="expReidetail.ticdate" id="expticdate" class="nui-hidden" />
				<input name="expReidetail.ticcomp" id="expticcomp" class="nui-hidden" />
				<input name="expReidetail.ticmon" id="expticmon" class="nui-hidden" />
				<input name="expReidetail.ticmonnet" id="expticmonnet" class="nui-hidden" />
				<table style="table-layout:fixed;" id="table_file">
					<tr>
					    <td align="right" style="width:120px;">本次结算金额：</td>
						<td><input name="expReiList.expRei.total" id="setamount2"  inputStyle="text-align: right;" onvaluechanged="changeSetamount"  class="nui-textbox" required="true" style="width:150px" />&nbsp  (元)</td>
						<td align="right" style="width:150px;">税金：</td>
						<td style="width:200px;"><input name="expReidetail.tictax" id="exptictax"  inputStyle="text-align: right;" onvaluechanged="changeSetamount" format="n2"  minValue="0" showButton="false" allowLimitValue="false"  class="nui-spinner" required="true" style="width:150px" /></td>
						<td align="right" style="width:150px;">不含税金额：</td>
						<td style="width:200px;"><input name="purSettle.notaxmon" id="notaxmon" format="n2" changeOnMousewheel="false"  inputStyle="text-align: right;" readonly="readOnly" style="width:150px" class="nui-spinner" showButton="false" allowLimitValue="false"/></td>
					</tr>
						<tr>
							<td align="right" style="width:150px;">收款单位：</td>
							<td><input name="expReiList.expRei.companyname" id="companyname"  class="nui-textbox" required="true" style="width:200px"/></td>
							<td align="right" style="width:150px;">付款方式：</td>
							<td><input name="expReiList.expRei.paymode" id="appmode" class="nui-dictcombobox" dictTypeId="EXP_PAYMODE" required="true" style="width:150px"/></td>
							<td align="right" style="width:150px;">税率：</td>
							<td style="width:200px;"><input name="purSettle.tax" id="tax" format="n2" changeOnMousewheel="false" inputStyle="text-align: right;" readonly="readOnly" style="width:150px" class="nui-spinner" showButton="false" allowLimitValue="false"/></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">银行账号：</td>
							<td>
								<input name="expReiList.expRei.bankacct"  id="bankacct" class="nui-textbox" 
									required="true" style="width:150px"/>
								<a class="mini-button" onclick="searchbankacct" style="height:19px;" plain="false">查询</a>
							</td>
							<td align="right" style="width:150px;">银行名称：</td>
							<td><input name="expReiList.expRei.bankname" id="bankname"  class="nui-textbox" required="true" style="width:150px"/></td>
							<td align="right" style="width:150px;">财务合同编号：</td>
							<td><input name="purSettle.contnum" id="contnum"   class="nui-buttonedit" allowInput="true" required="false" style="width:150px" onbuttonclick="selectCont"/></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">工作量单位：</td>
							<td><input name="purSettle.workunit" id="workunit"  value="1" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" required="true" style="width: 80px" /></td>
							<!-- 工作量数量 -->
							<td align="right" style="width:150px;">工作量数量：</td>
							<td><input name="purSettle.workamount" id="workamount" class="nui-spinner" showButton="false" allowLimitValue="false" changeOnMousewheel="false" style="width: 150px;" inputStyle="text-align: left"  /></td>
							<td align="right" style="width:150px;">成本归属类型：</td>
							<td ><input name="purSettle.costtype" id="costtype" class="nui-dictcombobox" dictTypeId="AME_CONTCOSTTYPE" required="false" style="width:150px"/></td>
						</tr>
						<tr style="display:none">
							<td align="right" style="width:150px;">对应客户：</td>
							<td>
							<input name="expReiList.custname" id="custno2" readOnly="readOnly" showButton="false" valueField="miscustid" textField="custname" class="nui-combobox" required="false" style="width:250px;" /></td>
							<td align="right" style="width:150px;">对应项目：</td>
							<td><input name="expReiList.projectname" id="projectno2" readOnly="readOnly" showButton="false" valueField="projectNo" textField="projectName" class="nui-combobox" required="false" style="width:250px" /></td>
						</tr>
						<tr style="display:none">
							<td align="right" style="width:150px;">受益部门：</td>
							<td><input name="expReiList.benefdeptno" id="benefitid2" readOnly="readOnly" showButton="false" class="nui-buttonedit" required="false" style="width:100px" /></td>
						</tr>
						<tr >
							<td align="right" style="width:150px;">解释说明：</td>
							<td colspan="5"><input name="expReiList.explain" id="explain" class="nui-textarea" required="true" onvaluechanged="changecomment" style="width:700px;height:40px;"/></td>
						</tr>
					<tr>
						<td align="right" style="width:120px;">报销单：</td>
						<td id="projectid2" style="width:140px" colspan="3"></td>
						<td style="width:120px;" align="right">纸质凭证送递人：</td>
	                    <td ><input name="checkid" id="checkid" readOnly="readOnly"  class="nui-buttonedit" required="true" style="width:150px;" allowinput="false" />
	                    </td>
					</tr>
				</table>
			</div>
		</fieldset>
	     
       <div class="nui-CheckBox" name="purOutcost.checkSure" checked="true" text="是否增加采购成本结转明细" trueValue="1" falseValue="0" id="checkSure" onclick="checkSure()"></div>
		<table style="table-layout:fixed;" id="table_file2">
		<tr id="a1">
		<td align="right" style="width:120px;" id="a4">成本确认日期:</td>
		<td><input name="purOutcost.confirmdate" id="purOutcostConfirmdate" class="nui-datepicker" required="false" inputStyle="text-align: right;" style="width: 150px;" /></td>
		<td align="right" style="width:100px;" id="a2">税率：</td>
		<td id="a7"><input name="purOutcost.tax" id="purOutcostTax" onvaluechanged="changePurOutcostTax" class="nui-textbox"  allowLimitValue="false" changeOnMousewheel="false" showButton="false" required="true" inputStyle="text-align: right;" style="width: 100px;" /> %</td>
		<td align="right" style="width:140px;" id="a8">成本说明</td>
		<td> <input name="purOutcost.costmemo" id="costmemo" class="nui-combobox" multiSelect="false" showNullItem="true" 
			required="true" style="width:150px" textField="dictname" valueField="dictid" dataField="costmemos"/></td>
		</tr>
		</table>
		<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
			<legend>结转明细</legend>
			<div id="datagrid3" class="nui-datagrid" dataField="purOutCosts" style="width:100%;height:auto;" 
			     url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleListToSettle.biz.ext" showSummaryRow="true" ondrawsummarycell="doPurOutCostSum"
			     allowResize="true" allowCellEdit="true" allowCellSelect="true"  multiSelect="true" onlyCheckSelection="true" allowSortColumn="false" showPager="false">
			     <div property="columns">
					 <div field="outcostid" headerAlign="center" allowSort="true" align="center" visible="false" width="55">结转编号</div>
		             <div field="outcosttype" headerAlign="center" allowSort="true" width="60" visible="false">结转类型</div>
		             <div field="settlementid" headerAlign="center" allowSort="true" visible="false">结算id</div>
		             <div field="accruedid" width="70" headerAlign="center" allowSort="true" visible="false">计提id</div>
		             <div field="supplierid" width="70" headerAlign="center" allowSort="true" visible="false">供应商id</div>
		             <div field="purcontno" width="auto" headerAlign="center" allowSort="true" visible="false">合同编号</div>
		             <div field="projectno" width="90" headerAlign="center" allowSort="true">项目编号</div>
		             <div field="settlemon" headerAlign="center" allowSort="true" visible="false" >本次结算金额</div>
		             <div field="accruedmon" headerAlign="center" allowSort="true" width="60" align="center" visible="false">本次计提金额</div>
		             <div field="taxmon" headerAlign="center" allowSort="true" align="right" dataType="currency" summaryType="sum">结转金额（含税）</div>
		             <div field="tax" headerAlign="center" allowSort="true" width="75" align="right" visible="true" numberFormat="p1">税率</div>
		             <div field="notaxmon" headerAlign="center" allowSort="true" width="75" align="right" visible="true" dataType="currency" summaryType="sum">结转金额（不含税）</div>
		             <div field="confirmdate" headerAlign="center" allowSort="true" width="75" align="center" dateFormat="yyyy-MM-dd" visible="false">确认日期</div>
		             <div field="paydate" headerAlign="center" allowSort="true" width="55" align="right" dateFormat="yyyy-MM-dd" visible="false">付款日期</div>
		             <div field="costmemo" headerAlign="center" allowSort="true" renderer="dictCostmo" width="55" align="center" visible="false">成本类型</div>
		             <div field="pzhs" headerAlign="center" allowSort="true" width="120" align="center"<%-- cellCls="myIndex"--%>>凭证编号
	             		<input property="editor" class="nui-textbox" style="width:100%;"/>
		             </div>
		             <div field="outcoststatus" headerAlign="center" allowSort="true" width="70" visible="false">结转状态</div>
			     </div>
	        </div>
	    </fieldset>

		<fieldset id="field24" style="border:solid 1px #aaa;padding:3px;display: none;">
			<legend>采购合同的已有发票列表</legend>
			<div id="ticketgrid" class="nui-datagrid" style="width:100%;height:auto;"  dataField="purTickets" showSummaryRow="true" ondrawsummarycell="doCountNowPage"
			url="com.primeton.eos.ame_pur.purTicket.queryPurTickets.biz.ext"  showPager="false" >
				<div property="columns">
					<div field="ticnum" width="60" align="center"  headerAlign="center"allowSort="false" renderer="getTicketDetail">发票号</div>
					<div field="ticdate" width="50" align="center" headerAlign="center"allowSort="false">开票日期</div>
					<div field="tictype" width="50" align="center" headerAlign="center"allowSort="false" renderer="getTicketType">发票类型</div>
					<div field="ticmon" width="70" align="right" headerAlign="center" dataType="currency" summaryType="sum" allowSort="false">发票金额</div>
					<div field="ticrate" width="30" align="right" headerAlign="center" dataType="currency" allowSort="false" numberFormat="p0">税率</div>
					<div field="tictax" width="50" align="right" headerAlign="center" dataType="currency" summaryType="sum" allowSort="false">税金</div>
					<div field="ticmonnet" width="70" align="right" headerAlign="center" dataType="currency" summaryType="sum" allowSort="false">不含税金额</div>
					<div field="ticcontent" width="150" align="left" headerAlign="center" allowSort="false">开票内容</div>
					<div field="reamrk" width="150" align="left" headerAlign="center" allowSort="false">备注</div>
				</div>
			</div>
		</fieldset>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>采购付款计划列表</legend>
			<div id="paymentPlanGrid" class="nui-datagrid" style="width:100%;height:auto;" allowResize="false" dataField="plans" showSummaryRow="true" ondrawsummarycell="drawPaymentPlanSum"
		 	url="com.primeton.eos.ame_pur.purPaymentPlan.paymentPlanQueryByContract.biz.ext"  allowCellEdit="false" showPager="false" multiSelect="true" >
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
					<div field="id" width="0" align="center" headerAlign="center" >ID</div>		
					<div field="payCount" width="60" align="center" headerAlign="center" >付款次数</div>	
					<div field="expectedAmount" width="80" align="center"  headerAlign="center" currencyUnit="￥" dataType="currency" numberFormat="n2" summaryType="sum">付款金额</div>
					<div field="percentage" width="60" align="center"  headerAlign="center" renderer="percentageRenderer" summaryType="sum">付款比例</div>
		            <div field="expectedDate" width="80" align="center"  headerAlign="center" dataType="date" dateFormat="yyyy-MM" renderer="onDealDate">预计付款年月</div>
		            <div field="evidence" width="130" align="center" headerAlign="center">付款依据</div>
					<div field="nodeRemark" width="250" align="center"  headerAlign="center" >付款节点备注</div>
				</div>
			</div>
		</fieldset>
	</form>
	<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
	    <legend>结算附件</legend>
		<jsp:include page="/ame_common/detailFile.jsp"/>
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
	                    <td style="width:140px;">
	                    	<input name="misOpinion.backTo" id="backTo" class="nui-combobox" valueField="id" textField="name" style="width:200px" required="true" />
	                    </td>
	                </tr>
	                <tr>
	                    <td style="width:150px;" align="right">审核意见：</td>
	                    <td style="width:300px;" colspan="3">
	                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height:40px;"/>
	                    </td>
	                </tr>
	                <tr>
	                	<td style="width:150px;" align="right">领导审批人：</td>
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
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
   <input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
   <input type="hidden" name="downloadFile" filter="false"/>
   <input type="hidden" name="fileName" filter="false"/>
</form> 
	<jsp:include page="/ame_pur/PurOtherSettlePay/splitPreSettle.jsp"/>
	<script type="text/javascript">
	
		nui.parse();
		
		
		<%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	   		Map<String,Object> a = user.getAttributes();
	   		String empid = (String) a.get("empid");
	    %>
	       var empid = <%=empid %>;
		   var expusername = "<%=username %>"
		var form = new nui.Form("#form1");
		var opioionform = new nui.Form("#opioionform");
		var grid = nui.get("datagrid");
		var grid4 = nui.get("datagrid4");
	  	var grid2 = nui.get("datagrid2");
	  	var grid3 = nui.get("datagrid3");
	  	var grid10 = nui.get("datagrid10");
		var ticketgrid = nui.get("ticketgrid");//采购合同发票
	  	var backTo = nui.get("backTo").getValue();
	  	var historypay=0;
	  	var purSettles;
	  	var purOutCosts;
	  	var purOutCost;
	  	var projectidlist="";
	  	var erpexptpettyexpParent;
	  	var needSettlementid="1";
	  	var grid_paymentPlan = nui.get("paymentPlanGrid");
	  	//计提状态为：确认计提审核中的计提总金额
		var sumAccruedmoney = 0;
		
		init();
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
		    promptInit({"workItemID":<%=workItemID %>,"processDefName":"com.primeton.eos.ame_pur.ame_purOtherSettlePay","activityDefID":"manualActivity3"});
			//com.primeton.eos.ame_pur.ame_purOtherSettlePay
			//promptInit({"workItemID":0,"processDefName":"com.primeton.eos.ame_pur.ame_purSettlePay","activityDefID":"manualActivity"});
			var data={workItemID: <%=workItemID %>,goSettleStep: "business"};
		
			
			var json=nui.encode(data);
			nui.ajax({
				url:"com.primeton.eos.ame_pur.PurOtherSettlePay.getOtherGoSettlePay1.biz.ext",
				type:"post",
				data:json,
				contentType:"text/json",
				success:function (o){
					o = nui.clone(o);
					purSettles = o.purSettles;
					purOutCosts = o.purOutCosts;
					purOutCost = o.purOutCost;
					
	  				var settlementidList="";
					var html = "";
					var projectnos="";
					for(var i=0;i<o.purSettles.length;++i){
						if(settlementidList==""){
							settlementidList=o.purSettles[i].settlementid;
						}else{
							settlementidList=settlementidList+','+o.purSettles[i].settlementid;
						}
						if(projectidlist==""){
							projectidlist=o.purSettles[i].projectid;
						}else{
							projectidlist=projectidlist+','+o.purSettles[i].projectid;
						}
						/* //报销单号
						if(html==""){
							html="<a href='#' onclick='javascript: doView(" + o.purSettles[i].pettyexpno + ");' >" + o.purSettles[i].pettyexpno + "</a>";
						}else{
							html=html+","+"<a href='#' onclick='javascript: doView(" + o.purSettles[i].pettyexpno + ");' >" + o.purSettles[i].pettyexpno + "</a>";
						} */
						if(projectnos==""){
							projectnos=o.purSettles[i].projectno;
						}else{
							projectnos=projectnos+','+o.purSettles[i].projectno;
						}
						//金额
						historypay=historypay+o.purSettles[i].setamount;
					}
					
					//加载附件设置参数
            		nui.get("grid_0").load({"groupid":"purSettle","relationid":settlementidList});
            		//加载审核附件设置参数
            		nui.get("workamount").setValue(o.purSettles[0].workamount);
					//nui.get("setamount").setValue(o.purSettle.setamount == null ? 0 : o.purSettle.setamount);
					nui.get("comment").setValue(o.purSettles[0].comment);
					nui.get("settlementid").setValue(settlementidList);
					nui.get("setstatus").setValue(o.purSettles[0].setstatus);
					nui.get("suppliersname").setValue(o.purSettles[0].suppliersname);
					nui.get("processinstid2").setValue(o.purSettles[0].processinstid);
					nui.get("processinstidSettle").setValue(o.purSettles[0].processinstid);
					nui.get("setamount").setEnabled(true);
					nui.get("custid").setValue(o.purSettles[0].custid);//供应商id
					nui.get("custid").setText(o.purSettles[0].custname);//供应商名称
					nui.get("purcontid").setValue(o.purSettles[0].purcontid);//采购合同id
					nui.get("workunit").setValue(o.purSettles[0].workunit);//工作量单位
					nui.get("workamount").setValue(o.purSettles[0].workamount);//工作量数量
					//nui.get("custno").setValue(o.purSettle.miscustid);//客户id
					//nui.get("custno").setText(o.purSettle.miscustname);//客户名称
					nui.get("projectno").setValue(projectnos);
					//nui.get("projectno").setValue(o.purSettle.projectno);
					//nui.get("projectno").setText(o.purSettle.projectname);
					//nui.get("benefitid").setValue(o.purSettle.orgid);
					//nui.get("benefitid").setText(o.purSettle.orgname);
					nui.get("workitemid").setValue(<%=workItemID %>);
					nui.get("processinstid").setValue(o.purSettles[0].processinstid);
					nui.get("contnum").setValue(o.purSettles[0].contnum);
					nui.get("contnum").setText(o.purSettles[0].contnum);
					nui.get("checkid").setValue(o.purSettles[0].user.id);
			        nui.get("checkid").setText(o.purSettles[0].user.name);
					//结算税率
					nui.get("tax").setValue(purSettles[0].tax);  
					//结算不含税
					nui.get("notaxmon").setValue(purSettles[0].notaxmon);
					if(o.purOutCosts){
						//结算税率
						nui.get("purOutcostTax").setValue(o.purOutCosts[0].tax*100);
						nui.get("purOutcostConfirmdate").setValue(o.purOutCosts[0].confirmdate);
						nui.get("costmemo").setValue(o.purOutCosts[0].costmemo);
					}
			        //nui.get("settlementno").setValue(o.purSettle.settlementno);
			        //成本归属类型为空，默认设置为成本项
					if(!o.purSettles[0].costtype){
						nui.get("costtype").setValue("1");
					}else{
						nui.get("costtype").setValue(o.purSettles[0].costtype);
					}
					var custid = o.purSettles[0].custid;
					var purcontid = o.purSettles[0].purcontid;
					var orgid = o.purSettles[0].orgid;
					var projectno = o.purSettles[0].projectno;
					//结算单编号 
					var settlementid = o.purSettles[0].settlementid;
					
					//采购合同信息
		        	if(settlementid){
			    		var json2 = nui.decode({"criteria": 
					                		  {"_expr[0]": {"_property": "purSupplier.custid","_op": "=","_value": custid}
					                		  ,"_expr[1]": {"_property": "purtype","_op": "in","_value": '1,2,4,5,3'}
					                		  ,"_expr[2]": {"_property": "purcontid","_op": "=","_value": purcontid}
					                		  ,"_expr[3]": {"_property": "purstatus","_op": "=","_value": '2'}}});
			        	grid.sortBy("purcontid","asc");
			        	grid.load(json2,function(){
							grid.selectAll(false);
							var rowsPresettle = grid.getData();
	                		for(var i = 0;i < rowsPresettle.length;i++){
	                			if(rowsPresettle[i].purcontid != purcontid){
	                				grid.deselect(rowsPresettle[i]);
	                			}
	                			else{
	                			   grid.select(rowsPresettle[i]);
	                			}
	                		}
	                		loadPaymentPlan();
						});
			    	}else{
			        	var json2 = nui.decode({"criteria": 
					                		  {"_expr[0]": {"_property": "purSupplier.custid","_op": "=","_value": custid}
					                		  ,"_expr[1]": {"_property": "purtype","_op": "in","_value": '1,2,4,5,3'}}});
			        	grid.sortBy("purcontid","asc");
			        	grid.load(json2, loadPaymentPlan);
			    	}
					
					//采购发票
					var json_t = nui.decode({"criteria": {"_expr[0]": {"_property": "purcontid","_op": "=","_value": purcontid},"_expr[1]": {"_property": "state","_op": "=","_value": "1"}},"b": "true"});
					ticketgrid.sortBy("ticdate","desc");
					ticketgrid.load(json_t,function(){
						var tickets = ticketgrid.getData();
						if(tickets.length==null||tickets==null||tickets.length==0){
							document.getElementById("field24").style.display="none";
						}else{
							document.getElementById("field24").style.display="";
						}
					});
					//明细
					if(o.expReidetail){
						nui.get("exptictax").setValue(o.expReidetail.tictax);
						nui.get("expticcomp").setValue(o.expReidetail.ticcomp);
						nui.get("expticdate").setValue(o.expReidetail.ticdate);
						nui.get("expticnum").setValue(o.expReidetail.ticnum);
						nui.get("expticmon").setValue(o.expReidetail.ticmon);
						nui.get("expticmonnet").setValue(o.expReidetail.ticmonnet);
						nui.get("notaxmon").setValue(o.expReidetail.ticmonnet);
					}
					
					//采购结算信息
					nui.get("pettyexpno").setValue(o.purSettles[0].pettyexpno);
					//nui.get("projectid").setValue(o.erpexptpettyexp.projectid);
					//nui.get("setamount2").setValue(o.erpexptpettyexp.total);
					nui.get("reiid").setValue(o.purSettles[0].expReiList.expRei.reiid);
					nui.get("expid").setValue(o.purSettles[0].expReiList.expid);
					nui.get("appmode").setValue(o.purSettles[0].expReiList.expRei.paymode);
					nui.get("companyname").setValue(o.purSettles[0].expReiList.expRei.companyname);
					nui.get("bankname").setValue(o.purSettles[0].expReiList.expRei.bankname);
					nui.get("bankacct").setValue(o.purSettles[0].expReiList.expRei.bankacct);
					//nui.get("linkman").setValue(o.purSettles[0].purSupplier.linkman);
					//nui.get("companytel").setValue(o.purSettles[0].erpexptpettyexp.companytel);
					nui.get("explain").setValue(o.purSettles[0].expReiList.explain);
					//报销单号
					html="<a href='#' onclick='javascript: doView();' >" + o.purSettles[0].pettyexpno + "</a>";
					document.getElementById("projectid2").innerHTML = html;
                	
                	//会签审批人lookup 待完善
					var name = "";
                    var id = "";
                    for(var i = 0;i < o.leaders.length;i++){
                    	name += o.leaders[i].name+",";
                    	id += o.leaders[i].id+",";
                    }
                    name = name.substring(0,name.length-1);
                    id = id.substring(0,id.length-1);
                    nui.get("checkerid").setValue(id);
                    nui.get("checkerid").setText(name);
                	
                    //流程回退路径赋值 
                    nui.get("backTo").setData(o.purSettles[0].backList);
          
                    //查询审核意见
	            	var processinstid = nui.get("processinstid").getValue();
					var grid1 = nui.get("datagrid1");
					grid1.load({processInstID: processinstid});
					grid1.sortBy("time", "desc");
					//流程提示信息
        			promptInit({workItemID:<%=workItemID %>});
				},
				error:function(){
				}
			});
		}
		
		//采购合同发票汇总
		function doCountNowPage(e){
			//客户端汇总计算
			if (e.field == "ticmon"||e.field == "tictax"||e.field == "ticmonnet") {
				e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
			}
		}
		
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
		
		//设置业务字典值-工作量单位
		function dictGetWorkunit(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);
		}
		
		//成本类型字典
		function dictCostmo(e){
			return nui.getDictText('AME_COSTTYPE',e.value);
		}
		
		//合同状态业务字典
		function contype(e){
			return nui.getDictText('AME_ORDERSTATUS',e.value);
		}
		
		//合同类型业务字典
		function contracttype(e){
			return nui.getDictText('MIS_CONTRACTTYPE',e.value);
		}
		
		//采购合同类型业务字典
		function purcontracttype(e){
			return nui.getDictText('AME_CONTYPE',e.value);
		}
		
		//设置业务字典值-事业部
		function dictGetContOrg(e){
			return nui.getDictText('CONT_ORG',e.value);
		}
		
		//设置业务字典值-计提状态
		function dictGetStatus(e){
			return nui.getDictText('AME_ACCRUEDSTATUS',e.value);
		} 
		//设置业务字典值-发票类型
		function getTicketType(e){
			return nui.getDictText('MIS_MA_INVOICETYPE',e.value);
		}
		
		//设置业务字典值-成本归属类型
		function dictGetCostType(e){
			return nui.getDictText('AME_CONTCOSTTYPE',e.value);
		}
		
		//设置结转总数
		function doPurOutCostSum(e){
			if (e.field == "taxmon" || e.field == "notaxmon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
		}
        
         //选择行计提
        var allSumPre = 0;
        var allSumNotPre = 0;
        function onSelectPre(e){
        	var rows = grid2.getSelecteds();
        	var sumFee = 0;
        	var sumNotFee = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].accruedmoney){
					sumFee += parseFloat(rows[i].accruedmoney);
					sumNotFee += parseFloat(rows[i].notaxmoney);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			sumNotFee = parseFloat(sumNotFee).toFixed(2);
            allSumPre = sumFee;
            allSumNotPre = sumNotFee;
            allSumPre = parseFloat(allSumPre).toFixed(2);
            allSumNotPre = parseFloat(allSumNotPre).toFixed(2);
            document.getElementById("sumtotalpre").innerHTML = parseFloat(allSumPre).toFixed(2);
            //document.getElementById("sumNottotalpre").innerHTML = parseFloat(allSumNotPre).toFixed(2);
            
            var rowsProj = grid10.getSelecteds();
        	var custid = nui.get("custid").getValue();
            if(purOutCosts==null||jQuery.isEmptyObject(purOutCosts)){
        			grid3.clearRows();
	            	for(var i=0;i<rowsProj.length;i++){
		            	var premoney = 0;
		            	var outmoney = 0;
		            	var accuredids = "";
		            	var outcoststatus = "";
		            	var contnum = "";
		            	var costmemo="";
		            	var purcontnum = "";
		            	var settlementid = "";
		            	var projectno = "";
		            	var tax = 0;
	            		for(var j=0;j<rows.length;j++){
	            			if(rows[j].projectno==rowsProj[i].projectno&&(rows[j].accruedstatus=="1"||rows[j].accruedstatus=="2")){
	            				premoney += rows[j].accruedmoney;
	            				if(accuredids ==""){
	            					accuredids = rows[j].accruedid;
	            				}else{
	            					accuredids = accuredids + ',' + rows[j].accruedid;
	            				}
	            			}
	            		}
	            		outmoney = rowsProj[i].prjfee - premoney;
	            		if(premoney==0){
	            		outcosttype = "2";
	            		}else{
	            		outcosttype = "3";
	            		}
	            		var costmemo = nui.get("costmemo").getValue();
	            		if(costmemo==0||costmemo==1||costmemo==6){
	            		contnum = rowsProj[i].contnum;
	            		}
	            		if(rows.length>0){
		            		if(rows[0].costmemo){
		            			costmemo = rows[0].costmemo;
		            		}
	            		}
	            		if(rowsProj[i].purcontnum){
	            			purcontnum = rowsProj[i].purcontnum;
	            		}
	            		if(rowsProj[i].settlementid){
	            			settlementid = rowsProj[i].settlementid;
	            		}
	            		if(rowsProj[i].projectno){
	            			projectno = rowsProj[i].projectno;
	            		}
	            		if(rowsProj[i].prjfee){
	            			prjfee = rowsProj[i].prjfee;
	            		}
	            		if(purOutCosts){
	            			tax = purOutCosts[0].tax;
	            		}
	            		var newRow={name: "New Row",taxmon:outmoney,projectno:projectno,settlementid:settlementid,accruedid:accuredids,tax:tax,notaxmon:outmoney/(1+tax),
	            		settlemon:prjfee,accruedmon:premoney,supplierid:custid,outcosttype:outcosttype,purcontno:purcontnum,contnum:contnum,costtype:costmemo};
			        	grid3.addRow(newRow, 0);
	            	}
            	}else{
            		grid3.setData(purOutCosts);
            	}
//             ------------------------------------------------冲销信息初始化----结束----------------------------------
       }
        
        //取消选中行计提
        function onDeselectPre(e){
        	var rows = grid2.getSelecteds();
        	var sumFee = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].accruedmoney){
					sumFee += parseFloat(rows[i].accruedmoney);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			allSumPre = sumFee;
			allSumPre = parseFloat(allSumPre).toFixed(2);
			document.getElementById("sumtotalpre").innerHTML = parseFloat(allSumPre).toFixed(2);
        }
        
        //点击采购合同展示对应的项目和销售合同
		function onSelectCont(e){ 
			var a = e.sender;
            var rows=a.getSelected();
            var sum=0;
            //项目信息
			
            if(rows.purcontid == null || rows.purcontid == 0){
            	grid10.load(json_p);
            }else{

            	var json_p = nui.decode({"criteria": 
					                {"_expr[0]": {"_property": "purcontid","_op": "=","_value": rows.purcontid},
					                "_expr[1]": {"_property": "projectId","_op": "in","_value": projectidlist}}});	
                
	            grid10.sortBy("projectno","asc");
	            grid10.load(json_p,function(){
	            	//选择项目
	            	if(purSettles.length >= 1) {
	            		grid10.selectAll(false);
		        		var rowsPrj = grid10.getData();
		        		for(var i=0;i<purSettles.length;++i){
		        			for(var j=0;j<rowsPrj.length;j++){
		        				if(rowsPrj[j].projectno != purSettles[i].projectno){
		        					if(i==0){
		        						grid10.deselect(rowsPrj[j]);
		        					}
		        				}else{
		        					grid10.select(rowsPrj[j]);
		        					var w=rowsPrj[j].wzfje+purSettles[i].setamount;
		        					var rowData={prjfee:purSettles[i].setamount,startdate:purSettles[i].startdate,enddate:purSettles[i].enddate,settlementid:purSettles[i].settlementid,settlementno:purSettles[i].settlementno,wzfje:w};
		        					grid10.updateRow(rowsPrj[j],rowData);
		        					sum = sum+purSettles[i].setamount;
		        				}
		        			}
		        		}
		        		document.getElementById("sumtotal").innerHTML = sum;
	    				nui.get("setamount").setValue(sum);
						nui.get("setamount2").setValue(sum);
	            	}
	            });
	    		grid2.clearRows();
            } 
        }
    	
    	//支付金额改变事件
    	function changeSetamount(){
    		var setamount = nui.get("setamount2").getValue();
			var exptictax = parseFloat(nui.get("exptictax").getValue());
    		nui.get("setamount").setValue(setamount);
			if(setamount!=null&&exptictax!=null){
				var notaxmon = setamount-exptictax;
				nui.get("notaxmon").setValue(notaxmon);
				var tax = setamount/notaxmon - 1;
				nui.get("tax").setValue(tax);
				nui.get("expticmon").setValue(setamount);
				nui.get("expticmonnet").setValue(notaxmon);
			}
    		
    	}
    	
    	//备注改变事件
    	function changecomment(){
    		var setamount = nui.get("explain").getValue();
    		nui.get("comment").setValue(setamount);
    		
    	}
    	
		//发起其他结算流程
		function SaveData(){
		   makeOtherGoSettelpayRev(); 
		}
		
		//调用合规审核逻辑流
    	function makeOtherGoSettelpayRev(){
    		var data = form.getData();
    		var opioionformData = opioionform.getData();
    		var backTo = nui.get("backTo").getValue();
    		data.backTo = backTo;
    		
    		//审核信息
    		data.misOpinion = opioionformData.misOpinion;
    		
    		//计提信息
			var purPresettles = grid2.getSelecteds();
			data.purSettle.purPresettles = purPresettles;
    		
    		//项目信息
          	var rdProject = grid10.getSelecteds();
         	data.purSettle.rdProject = rdProject;
         	data.purSettle.prjlength = rdProject.length;
    		data.purSettle.tax=nui.get("tax").getValue();
    		var purOutcosts = grid3.getData();
    		data.purOutcosts = purOutcosts;
         	
         	//拼接结算单
         	var settlementno1="结算单编号：";
         	for(var i=0;i<rdProject.length;i++){
         		if(i != rdProject.length-1){
         			settlementno1=settlementno1+rdProject[i].settlementno+",";
         		}else{
         			settlementno1=settlementno1+rdProject[i].settlementno;
         		}
         	}
    		data.expReiList.settlementno=settlementno1;
    		data.purSettle.presettleflag = "finsp";//标识当前是财务收单审核归档
    		var json = nui.encode(data);
    		nui.ajax({
    			url:"com.primeton.eos.ame_pur.PurOtherSettlePay.makeOtherGoSettelpayRev1.biz.ext",
    			data:json,
    			type:"post",
    			contentType:"text/json",
    			success:function(action){
					if(action.exception == null){
			        	nui.alert("提交成功",null,function(){
				        	CloseWindow("ok");
			        	});
    				}else{
    					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(){});
    				}
    				nui.get("sureButton").setEnabled(true);
    			},
    			error:function(jqXHR, textStatus, errorThrown){
    				nui.alert("error:" + jqXHR.responseText);
    			}
    		});
    	}
		
		function SaveData1(){
        	document.getElementById("fileCatalog").value="MIS_OPINION";
            form2.submit();
    	}
		
		function onOk(){
			var filePaths = document.getElementsByName("uploadfile").length;
			var massage="";
			var auditstatus = nui.get("auditstatus").getValue();
			
			//判断审核意见附件
        	for(var j = 0;j < filePaths;j++){
        		var a = document.getElementsByName("remarkList")[j].value;
        		if(a == null || a == ""){
        			nui.alert("审批意见新增附件不可以为空");
        			return false;
        		}
        	}
        	
        	//判断附件
        	var filePaths1 = document.getElementsByName("uploadfile1").length;
        	for(var j = 0;j < filePaths1;j++){
        		var a = document.getElementsByName("remarkList1")[j].value;
        		if(a == null || a == ""){
        			nui.alert("新增结算附件不可以为空");
        			return false;
        		}
        	}
        	
        	//判断审批信息
        	if(auditstatus == "1" && nui.get("checkerid").getValue() == ""){
        		nui.alert("审批通过时领导审批人不允许为空");
        		return false;
        	}
        	
			//审核结果
        	var auditstatus = nui.get("auditstatus").getValue();
        	if(auditstatus == "2")
        	{
        	   massage="您的审核意见是“终止流程”，"
        	}
        	else if(auditstatus == "0")
        	{
        	  massage="您的审核意见是“退回”，"
        	}
        	else if(auditstatus == "1")
        	{ 
        	  massage="您的审核意见是“通过”，"
        	}
        	var backTo = nui.get("backTo").getValue();
        	if(auditstatus == "2" ||  auditstatus == "0" ){
        	    if((backTo == null || backTo == "") && auditstatus == "0")
        	    { 
        	       nui.alert("退回时请选择退回到的环节！");
        	       return;
        	    }
        	    
        	    nui.confirm(massage+"确认提交吗？", "确定？",
	            function (action) {            
	                if (action == "ok") {
	                	nui.get("sureButton").setEnabled(false);
				    	document.getElementById("fileCatalog1").value="purSettle";
						form4.submit();
					}else{
						return;
					}
				});
        	}
        	else{
		       //判断是否选中采购合同
			   var rows = grid.getSelecteds();
			   if(rows.length == 0){
					nui.alert("未选中采购合同记录");
					return false;
			   }
			   else {
				    var zongje = parseFloat(nui.get("setamount").getValue()).toFixed(2);
		            var zongji = rows[0].contmoney-rows[0].payMoney+historypay;
		            if(parseFloat(zongje)<=0){
		                nui.alert("本次结算金额必须大于零！" );
		                return;
		            }
				    if(parseFloat(zongje) > parseFloat(zongji)){
				        nui.alert("本次结算金额" + zongje + "元，大于采购合同未付款金额，不能发起付款流程！");
					    return false;
				    }
				}
				
				//判断是否选中项目
				var Prjrows = grid10.getSelecteds();
				if(Prjrows.length == 0){
					nui.alert("未选中项目记录！");
					return;
				}else{
					for(var i=0;i<Prjrows.length;++i){
						if(Prjrows[i].prjfee<=0 || Prjrows[i].prjfee==null){
							nui.alert("选中的项目结算费用不能为空，不能小于零！")
							return;
						}
						if(Prjrows[i].settlementno==null || Prjrows[i].settlementno==""){
							nui.alert("选中的项目结算单编号不能为空！")
							return;
						}
						if(Prjrows[i].startdate=="" || Prjrows[i].startdate==null){
							nui.alert("选中的项目的结算开始日期不能为空！")
							return;
						}
						if(Prjrows[i].enddate=="" || Prjrows[i].enddate==null){
							nui.alert("选中的项目的结算结束日期不能为空")
							return;
						}
					}
				}
				
				var purPresettles = grid2.getSelecteds();
				var costtype =nui.get("costtype").getValue()//成本归属类型
				if(purPresettles.length != 0){
					for(var i=0;i<purPresettles.length;++i){
						if(costtype != purPresettles[i].costtype){
							nui.alert("结算单成本类型与对应的计提记录成本类型不一致，请核对处理")
							return;
						}
					}
				}
				
		    	if(form.validate()){
					nui.confirm(massage+"确认提交吗？", "确定？",
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
		
		//确认计提
	    function onActionRenderer(e) { 
            var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
            var rowIndex = e.rowIndex;
            var s = null;
            if(record.accruedstatus == 4 || record.accruedstatus == 0){
	            s = ' <a class="Edit_Button" href="javascript: editRow(\'' + uid + '\')" >计提确认</a>';
            }
            if(s){
	            s += ' <a class="Edit_Button" href="javascript: editPreSplitRow(\'' + uid + '\')" >计提拆分</a>';
            }else{
            	s = ' <a class="Edit_Button" href="javascript: editPreSplitRow(\'' + uid + '\')" >计提拆分</a>'
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
	    	nui.confirm("确定要计提确认吗？","确定？",function(action){
            	if(action == "ok"){
            		var json = nui.encode({"purOutcostParam": {"iden": "reviewCheck","accruedidSure": row.accruedid,"confirmdate": nui.get("confirmdate").getValue()}});
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
                                	var purcontnum = grid.getSelecteds()[0].purcontnum;
                                	var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectno,purcontnum:purcontnum}});
				                	grid2.load(jsonPresettle,function(){
				                		grid2.selectAll(false);
				                		var rowsPresettle = grid2.getSelecteds();
				                		for(var i = 0;i < rowsPresettle.length;i++){
				                			if(!rowsPresettle[i].settlementid){
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
	    
	    //检查结算单编码是否存在
        function checkSettlementno(e){
        	var row =e.record;;
    		//结算单编码
        	var settlementno = row.settlementno;
        	var settlementid = row.settlementid;
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
	                		nui.alert(settlementno+"结算单编号已存在");	
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
        
        //查看报销单信息
		function doView(){
			var reiid = nui.get("reiid").getValue();
			var executeUrl = "<%= request.getContextPath() %>/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + reiid;
			window.open(executeUrl);
		}
		
		//查询银行账号
    	function searchbankacct(){
    		//收款单位 companyname 银行名称 bankname 银行账号 bankacct
    		//ame_pur/settlepay/selectBankInfo.jsp
    		var empid = <%=empid %>;
    		nui.open({
                url: "<%=request.getContextPath() %>/ame_pur/settlepay/selectBankInfo.jsp?empid="+empid,
                title: "查询银行信息", 
                width: 650, 
                height: 420,
                onload: function () {
	            var iframe = this.getIFrameEl();
	            var data = {expusername:expusername};
	            iframe.contentWindow.SetData(data);
	            },
                ondestroy: function (action) {//弹出页面关闭前
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                        	if(data.username){
	                            nui.get("companyname").setValue(data.username);
                        	}
                            nui.get("bankname").setValue(data.bankname);
                            nui.get("bankacct").setValue(data.bankacct);
                        }
                    }
                }
            });
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
        
        //项目输入置计算合计
    	function doSumfee(e)
    	{	
	    	var rows = grid10.getSelecteds();
	    	var sumFee = 0;
	    	
        	//供应商ID
        	var custid = nui.get("custid").getValue();
        	for(var i = 0;i < rows.length;i ++){
        		if(rows[i].prjfee){
					sumFee += parseFloat(rows[i].prjfee);
				}
        	}
        	
        	var row =e.record;
			if(row){
				if(row.prjfee > row.wzfje){
					nui.alert("本项目的本次结算金额不能大于未支付金额！");
					var rowData = {prjfee: 0};
					nui.get("setamount").setValue(0);
					nui.get("setamount2").setValue(0);
					grid10.updateRow(row,rowData);
					return;
				}
			}
        	
        	//计算结算费用和
        	sumFee = parseFloat(sumFee).toFixed(2);
			document.getElementById("sumtotal").innerHTML = parseFloat(sumFee).toFixed(2);
			nui.get("setamount").setValue(sumFee);
			nui.get("setamount2").setValue(sumFee);
    		var tax = parseFloat(nui.get("tax").getValue());
    		var notaxmon = sumFee/(1 + tax);
    		nui.get("notaxmon").setValue(parseFloat(notaxmon).toFixed(2));
			//nui.get("purOutcostTaxmon").setValue(sumFee);
			//nui.get("purOutcostNotaxmon").setValue(parseFloat(notaxmon).toFixed(2));
			
    		//结算单编码
        	var settlementno = row.settlementno;
        	var settlementid = row.settlementid;
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
	                		nui.alert(settlementno+"结算单编号已存在");	
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
    	
    	//已选项目计算结算总计，已选项目筛选出计提
	    function onSelectPrj(e){
	    	var rows = grid10.getSelecteds();
	    	var sumFee = 0;
	    	
			//计提核销信息 根据项目(projectno)筛选计提信息
        	var projectnos = "";
        	//供应商ID
        	var custid = nui.get("custid").getValue();
        	for(var i = 0;i < rows.length;i ++){
        		if(!projectnos){
					projectnos = rows[i].projectno;
					if(rows[i].prjfee){
						sumFee += parseFloat(rows[i].prjfee);
					}
        		}else{
        			projectnos += "," + rows[i].projectno; 
					if(rows[i].prjfee){
						sumFee += parseFloat(rows[i].prjfee);
					}
        		}
        	}
        	if(rows.length == 0){
        		grid2.clearRows();
        	}else{
        		var purcontnum = grid.getSelecteds()[0].purcontnum;
        	 	var settlementid=nui.get("settlementid").getValue();
        		var jsonPresettle = {purPresettle: {custid: custid,projectno: projectnos,purcontnum:purcontnum}};
        		jsonPresettle = nui.decode(jsonPresettle);
        		grid2.load(jsonPresettle,function(o){
        			if(o.result.purPresettles.length>0){
		            	//选择计提
		            	if(purSettles.length >= 1) {
		            		grid2.selectAll(false);
			        		var rowsPresettle = grid2.getData();
			        		for(var i=0;i<purSettles.length;++i){
			        			for(var j=0;j<rowsPresettle.length;j++){
			        				if(rowsPresettle[j].settlementid != purSettles[i].settlementid){
			        					if(i==0){
			        						grid2.deselect(rowsPresettle[j]);
			        					}
			        				}else{
			        					grid2.select(rowsPresettle[j]);
			        				}
			        			}
			        		}
		            	}
		        	}else{
		        		var rowsProj = grid10.getSelecteds();
			        	var custid = nui.get("custid").getValue();
			        	if(purOutCosts==null||jQuery.isEmptyObject(purOutCosts)){
			        			grid3.clearRows();
				            	for(var i=0;i<rowsProj.length;i++){
					            	var premoney = 0;
					            	var outmoney = 0;
					            	var accuredids = "";
					            	var outcoststatus = "";
					            	var contnum = "";
					            	var costmemo="";
					            	var purcontnum = "";
					            	var settlementid = "";
					            	var projectno = "";
					            	var tax = 0;
				            		for(var j=0;j<rows.length;j++){
				            			if(rows[j].projectno==rowsProj[i].projectno&&rows[j].accruedstatus=="2"){
				            				premoney += rows[j].accruedmoney;
				            				if(accuredids ==""){
				            					accuredids = rows[j].accruedid;
				            				}else{
				            					accuredids = accuredids + ',' + rows[j].accruedid;
				            				}
				            			}
				            		}
				            		outmoney = rowsProj[i].prjfee - premoney;
				            		if(premoney==0){
				            		outcosttype = "2";
				            		}else{
				            		outcosttype = "3";
				            		}
				            		var costmemo = nui.get("costmemo").getValue();
				            		if(costmemo==0||costmemo==1||costmemo==6){
				            		contnum = rowsProj[i].contnum;
				            		}
				            		if(rows[0].costmemo){
				            			costmemo = rows[0].costmemo;
				            		}
				            		if(rowsProj[i].purcontnum){
				            			purcontnum = rowsProj[i].purcontnum;
				            		}
				            		if(rowsProj[i].settlementid){
				            			settlementid = rowsProj[i].settlementid;
				            		}
				            		if(rowsProj[i].projectno){
				            			projectno = rowsProj[i].projectno;
				            		}
				            		if(rowsProj[i].prjfee){
				            			prjfee = rowsProj[i].prjfee;
				            		}
				            		if(purOutCosts){
				            			tax = purOutCosts[0].tax;
				            		}
				            		var newRow={name: "New Row",taxmon:outmoney,projectno:projectno,settlementid:settlementid,accruedid:accuredids,tax:tax,notaxmon:outmoney/(1+tax),
				            		settlemon:prjfee,accruedmon:premoney,supplierid:custid,outcosttype:outcosttype,purcontno:purcontnum,contnum:contnum,costtype:costmemo};
						        	grid3.addRow(newRow, 0);
				            	}
			            	}else{
			            		grid3.setData(purOutCosts);
			            	}
		        	}
	            });
        	}
        	
        	//计算结算费用和
        	sumFee = parseFloat(sumFee).toFixed(2);
			document.getElementById("sumtotal").innerHTML = parseFloat(sumFee).toFixed(2);
			nui.get("setamount").setValue(sumFee);
			nui.get("setamount2").setValue(sumFee);
	    }
	    
	     //选择是否冲销
        function checkSure(){
        	var checkSure = nui.get("checkSure").getValue();
        	if(checkSure == "1"){
        		document.getElementById("table_file2").style.display = "";
        		document.getElementById("field6").style.display = "";
        		document.getElementById("a1").style.display = "";
        		nui.get("purOutcostTax").setRequired(true);
        		nui.get("costmemo").setRequired(true);
        	}else{	
        		document.getElementById("table_file2").style.display = "none";
        		document.getElementById("field6").style.display = "none";
        		document.getElementById("a1").style.display = "none";
        		nui.get("purOutcostTax").setRequired(false);
        		nui.get("costmemo").setRequired(false);
        	}
        }
        
        //修改冲销记录税率
    	function changePurOutcostTax(){
    		//含税金额
    		var purOutcostTax = nui.get("purOutcostTax").getValue();
    		var row = grid3.getData();
    		if(row.length>0){
    			for(var i=0;i<row.length;i++){
    				var rowData = {tax:purOutcostTax/100,notaxmon:(row[i].taxmon/(1 + purOutcostTax/100)).toFixed(2)}
    				grid3.updateRow(row[i],rowData);
    			}
    		}
    	}
    	function percentageRenderer(e) {
	    	if(e.value == null) {
				return "";
			}
			return e.value + "%";
		}
		
		function onDealDate(e){
			if(e.field == "expectedDate"){
				var date = e.value;
				if(date){
					return e.cellHtml.substring(0,7);
				}
				return "";
			}
		}
		//采购付款计划查询
		function loadPaymentPlan() {
			var contractData = grid.getData();
			if(contractData.length > 0 ) {
				var contractIds = "";
				contractContmoney = 0;
				for(var i = 0, j = contractData.length; i < j; i++) {
					contractIds +=  "," + contractData[i]["purcontid"];
					contractContmoney += parseFloat(contractData[i]["contmoney"]);
				}
				if(contractIds.length > 0) {
					contractIds = contractIds.substring(1);
					grid_paymentPlan.load({purcontid:contractIds});
				}
			}
		}
		var contractContmoney = "";
		var paymentPlanSum = 0;
		function drawPaymentPlanSum(e){
			if (e.field == "expectedAmount") {
				var html = nui.formatNumber(e.value,"n");
	            e.cellHtml = "<div align='right'><b>" + html + "</b></div>";
	            paymentPlanSum = (Math.round(e.value*100)/100);  
	        } 
	        if (e.field == "percentage") {
	        	var contmoney = contractContmoney;
	       	 	var html = "";
	        	if(contmoney && contmoney > 0) {
	        		var p = (Math.round(paymentPlanSum * 10000 / contmoney ) / 100.00);
	        		html = nui.formatNumber(p,"n");
	        	} else {
	        		html = "0.00";
	        	}
	        	e.cellHtml = "<div align='right'><b>" + html + "%</b></div>";
	        }
		}
</script>
</body>
</html>