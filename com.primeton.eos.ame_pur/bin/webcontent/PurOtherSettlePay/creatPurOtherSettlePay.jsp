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
  - Date: 2016-10-18 15:01:58
  - Description:
-->
<head>
    <title>其他采购支付流程发起</title>
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
<div class="nui-fit">
    <div class="mini-panel" title="发起其他采购支付流程" style="width: auto">
        <!-- 提示信息展示 -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<form id="form1" method="post">
		     <fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		        <legend>请选择供应商</legend>
				<input name="purSettle.settlementid" id="settlementid" class="nui-hidden"/>
				<input name="purSettle.fileids" id="fileids" class="nui-hidden"/>
				<input name="purSettle.setstatus" id="setstatus" class="nui-hidden" value="0"/>
				<!-- 供应商简称 -->
				<input name="purSettle.suppliersname" id="suppliersname" class="nui-hidden" />
				<!-- 工作量数量 -->
				<input name="purSettle.workamount" id="workamount" class="nui-hidden" />
				<input name="purSettle.save" id="save" class="nui-hidden" />
				<!-- 内部商务合同编号 -->
				<input name="purSettle.contnum" id="contnum" class="nui-hidden" />
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<!--<td align="right" style="width:120px;">项目：</td>
							<td><input name="purSettle.projectno" id="projectno" onbuttonclick="selectProject" class="nui-buttonedit" allowInput="false" emptyText="请选择项目" required="true" style="width:240px" /></td>-->
							<td align="right" style="width:120px;">供应商：</td>
							<td colspan="3"><input name="purSettle.custid"  onbuttonclick="changeCust" <%--onvaluechanged="changeCust"--%> id="custid"  valueField="custid" textField="custname" class="nui-buttonedit" emptyText="请选择供应商" required="true" style="width:200px" allowInput="false" />
							</td>
							<%--<td align="right" style="width:120px;">工作量单位：</td>
							<td><input name="purSettle.workunit" id="workunit"  value="1" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" required="false" style="width: 80px" /></td>
							<!-- 工作量数量 -->
							<td align="right" style="width:120px;">工作量数量：</td>
							<td><input name="purSettle.workamount" id="workamount" class="nui-spinner" showButton="false" 
								allowLimitValue="false" changeOnMousewheel="false" style="width: 100px;" 
								inputStyle="text-align: left"  /></td>--%>
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
		            showFooter="false" showPager="true" allowCellEdit="true" allowCellSelect="true" idField="custid"
				    onselectionchanged="onSelectCont" >
				    <div property="columns">
				       <div type="checkcolumn" width="30">#</div>
				       <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商编号</div>
				       <div field="purcontid" headerAlign="center" allowSort="true" visible="false">采购合同编号</div>
				       <div field="purcontnum" headerAlign="center" allowSort="true" visible="true" width="70">合同编号</div>
				       <div field="purcontname" headerAlign="center" allowSort="true" visible="true">合同名称</div>
				       <div field="signdate" headerAlign="center" allowSort="true" width="80" align="center" >签订日期</div>
				       <div field="purtype" headerAlign="center" allowSort="true" visible="true" renderer="purcontracttype" width="70">合同类型</div>
				       <div field="purstatus" headerAlign="center" allowSort="true" visible="true" renderer="contype" width="70">合同状态</div>
				       <div field="contmoney" headerAlign="center" allowSort="false" visible="false" width="70" align="right" >合同金额</div>
				       <div field="payMoney" headerAlign="center" allowSort="false" visible="false" width="100" align="right" >已付款/审核中的合同额</div>
				       <div field="payCount" headerAlign="center" allowSort="false" visible="false" width="70" numberFormat="p" align="right" >付款比例</div>
				       <%--<div field="purstatus" headerAlign="center" allowSort="true" visible="true" dictTypeId="CS_CONTRACTTYPE">合同状态</div>--%>
				       <%--<div field="contnum" headerAlign="center" allowSort="true" visible="true">销售合同编号</div>--%>
				       <div field="startdate" headerAlign="center" allowSort="true" width="80" align="center" visible="false">有效开始日期</div>
			           <div field="enddate" headerAlign="center" allowSort="true" width="80" align="center" visible="false">有效截止日期</div>
				       <div field="liankman" headerAlign="center" allowSort="true" visible="false">合同联系人</div>
				       <div field="ouroper" headerAlign="center" allowSort="true" visible="false">我方联系人</div>
				       <div field="comment" headerAlign="center" allowSort="true" visible="false">说明</div>
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
						<div field="purcontid" width="1" align="center" headerAlign="center" allowSort="true" visible="false">采购合同id</div>
						<div field="projectId" width="1" align="center" headerAlign="center" allowSort="true" visible="false">项目id</div>
						<div field="purcontnum" width="1" align="center" headerAlign="center" allowSort="true" visible="false">采购合同编号</div>
						<div field="projectno"width="90" align="center" headerAlign="center" allowSort="true" >项目编号</div>	
						<div field="projectName"width="110" align="center" headerAlign="center" allowSort="true" >项目名称</div>
						<div field="purmoney" headerAlign="center" allowSort="true" visible="true" width="80" align="right">采购金额</div>
						<div field="wzfje" headerAlign="center" allowSort="true" visible="true" width="80" align="right">未支付金额</div>
						<div field="prjfee" width="100" dataType="currency" align="right" headerAlign="center" allowSort="true" cellCls="myIndex">
							项目结算费用
							<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
						</div>
						<div field="startdate" headerAlign="center" allowSort="true" width="78" align="center" visible="true" dateFormat="yyyy-MM-dd" >结算开始日期
							<input property="editor" class="nui-datepicker" style="width:100%;" />
						</div>
			            <div field="enddate" headerAlign="center" allowSort="true" width="78" align="center" visible="true" dateFormat="yyyy-MM-dd" >结算结束日期
			            	<input property="editor" class="nui-datepicker" style="width:100%;" />
			            </div>
						<div field="contnum" width="94"align="center" headerAlign="center" allowSort="true" visible="true">销售合同编号</div>
						<div field="contract.projectname" width="110" align="center" headerAlign="center" allowSort="true" visible="true">销售合同名称</div>	
						<div field="contract.contsum" headerAlign="center" allowSort="true" visible="true" width="75" align="right">合同金额</div>
						<div field="contract.pay" headerAlign="center" allowSort="true" visible="true" width="80" align="right">已收款合同额</div>
						<div field="contract.paycount" headerAlign="center" allowSort="true" visible="true" width="75" numberFormat="p" align="right">收款比例</div>
					</div>
				</div>
				<div style="width:800px;height:24px;margin-left:140px;float:left;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:250px;">结算费用总计：</td>
							<td id="sumtotal" style="width:85px;" align="right" ></td>
						</tr>
					</table>
				</div>
		     </fieldset>
		     
		     <fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
		        <legend>计提核销信息</legend>
		        <div id="datagrid2" class="nui-datagrid" dataField="purPresettles" style="width:100%;height:auto;" 
				     url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleListToSettle.biz.ext" multiSelect="true"
				     showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" 
				     onselect="onSelectPre" ondeselect="onDeselectPre" 
				     onlyCheckSelection="true" allowSortColumn="false">
				     <div property="columns">
				         <div type="checkcolumn" width="30"></div>			
						 <div field="accruedid" headerAlign="center" allowSort="true" align="center" visible="true" width="70">计提编号</div>
			             <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商编号</div>
			             <div field="custname" headerAlign="center" allowSort="true" visible="false">供应商名称</div>
			             <div field="suppliersname" width="75" headerAlign="center" allowSort="true" >供应商简称</div>
			             <div field="projectno" width="90" headerAlign="center" allowSort="true" visible="true">项目代码</div>
			             <div field="projectname" width="auto" headerAlign="center" allowSort="true" visible="true">项目名称</div>
			             <div field="salesid" headerAlign="center" allowSort="true" visible="false" >所属销售ID</div>
			             <div field="orgname" headerAlign="center" allowSort="true" width="70" align="center" >受益部门</div>
			             <div field="syb" headerAlign="center" allowSort="true" width="100" renderer="dictGetContOrg" >所属事业部</div>
			             <div field="contnum" headerAlign="center" allowSort="true" visible="false">销售合同</div>
			             <div field="startdate" headerAlign="center" allowSort="true" width="75" align="center" visible="true">开始日期</div>
			             <div field="enddate" headerAlign="center" allowSort="true" width="75" align="center" visible="true">结束日期</div>
			             <div field="accrueddate" headerAlign="center" allowSort="true" width="75" align="center" dateFormat="yyyy-MM-dd">计提时间</div>
			             <div field="accruedmoney" headerAlign="center" allowSort="true" width="100" align="right" dataType="currency" >计提金额</div>
			             <div field="costtype" headerAlign="center" allowSort="true" renderer="dictGetCostType" width="60" align="center" >成本类型</div>
			             <%--<div field="outper" headerAlign="center" allowSort="true" width="200" >相关外包人员</div>--%>
			             <div field="accruedstatus" headerAlign="center" allowSort="true" renderer="dictGetStatus" width="120" align="center" >状态</div>
			             <div field="settlementid" headerAlign="center" allowSort="true" visible="fales" >结算单编号</div>
			             <div field="comment" width="auto" headerAlign="center" allowSort="true" visible="false">备注</div>
				     </div>
		        </div>
		        <div style="width:300px;height:25px;margin-left:590px;float:left;">
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
					<input name="expReidetail.ticnum" id="expticnum" class="nui-hidden" />
					<input name="expReidetail.ticdate" id="expticdate" class="nui-hidden" />
					<input name="expReidetail.ticcomp" id="expticcomp" class="nui-hidden" />
					<input name="expReidetail.ticmon" id="expticmon" class="nui-hidden" />
					<input name="expReidetail.tictax" id="exptictax" class="nui-hidden" />
					<input name="expReidetail.ticmonnet" id="expticmonnet" class="nui-hidden" />
					<table style="table-layout:fixed;" id="table_file">
						<tr>
						    <td align="right" style="width:120px;">本次结算金额：</td>
							<td><input name="expReiList.expRei.total" id="setamount2"  inputStyle="text-align: right;" onvaluechanged="changeSetamount"  class="nui-spinner" format="n2"  minValue="0"  showButton="false" allowLimitValue="false" required="true" style="width:220px" />&nbsp  (元)</td>
							
							<td align="right" style="width:120px;">付款方式：</td>
							<td><input name="expReiList.expRei.paymode" id="appmode" class="nui-dictcombobox" dictTypeId="EXP_PAYMODE" required="true" style="width:150px"/></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">银行账号：</td>
							<td>
								<input name="expReiList.expRei.bankacct"  id="bankacct" class="nui-textbox" 
									required="true" style="width:250px"/>
								<a class="mini-button" onclick="searchbankacct" style="height:19px;" plain="false">查询</a>
							</td>
							<td align="right" style="width:120px;">银行名称：</td>
							<td><input name="expReiList.expRei.bankname" id="bankname"  class="nui-textbox" required="true" style="width:150px"/></td>
							<td align="right" style="width:120px;">收款单位：</td>
							<td><input name="expReiList.expRei.companyname" id="companyname"  class="nui-textbox" required="true" style="width:250px"/></td>
						</tr>
						<tr style="display:none">
							<td align="right" style="width:120px;">对应客户：</td>
							<td>
							<input name="expReiList.custname" id="custno2" readOnly="readOnly" showButton="false" valueField="miscustid" textField="custname" class="nui-combobox" required="false" style="width:250px;" /></td>
							<td align="right" style="width:120px;">对应项目：</td>
							<td><input name="expReiList.projectname" id="projectno2" readOnly="readOnly" showButton="false" valueField="projectNo" textField="projectName" class="nui-combobox" required="false" style="width:250px" /></td>
						</tr>
						<tr style="display:none">
							<td align="right" style="width:120px;">受益部门：</td>
							<td><input name="expReiList.benefdeptno" id="benefitid2" readOnly="readOnly" showButton="false" class="nui-buttonedit" required="false" style="width:100px" /></td>
						</tr>
						<tr >
							<td align="right" style="width:120px;">解释说明：</td>
							<td colspan="5"><input name="expReiList.explain" id="explain" vtype="rangeLength:0,100" class="nui-textarea" required="true" onvaluechanged="changecomment" style="width:700px;height:40px;"/>
							(提示：解释说明请控制在一百字以内。)</td>
						</tr>
						<tr>
							<td style="width:120px;height:auto;" align="right">纸质凭证送递人：</td>
		                    <td colspan="5"><input name="checkerid" id="checkerid" class="nui-buttonedit" required="true" style="width:250px;" allowinput="false" onbuttonclick="selectSaleLeader"/>
		                    (提示:纸质凭证为发票或其他结算所需的凭证,需送递到财务,如果提交纸质凭证非本人,请更改,但不可为空！)
		                    </td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>

		<fieldset id="field24" style="border:solid 1px #aaa;padding:3px;display: none;">
			<legend>采购合同的已有发票列表</legend>
			<div id="ticketgrid" class="nui-datagrid" style="width:100%;height:auto;"  dataField="purTickets" showSummaryRow="true" ondrawsummarycell="doCountNowPage"
			url="com.primeton.eos.ame_pur.purTicket.queryPurTickets.biz.ext"  showPager="false" >
				<div property="columns">
					<div field="ticnum" width="60" align="center"  headerAlign="center"allowSort="true" renderer="getTicketDetail">发票号</div>
					<div field="ticdate" width="50" align="center" headerAlign="center"allowSort="true">开票日期</div>
					<div field="tictype" width="50" align="center" headerAlign="center"allowSort="true" renderer="getTicketType">发票类型</div>
					<div field="ticmon" width="70" align="right" headerAlign="center" dataType="currency" summaryType="sum" allowSort="true">发票金额</div>
					<div field="ticrate" width="30" align="right" headerAlign="center" dataType="currency" allowSort="true" numberFormat="p0">税率</div>
					<div field="tictax" width="50" align="right" headerAlign="center" dataType="currency" summaryType="sum" allowSort="true">税金</div>
					<div field="ticmonnet" width="70" align="right" headerAlign="center" dataType="currency" summaryType="sum" allowSort="true">不含税金额</div>
					<div field="ticcontent" width="150" align="left" headerAlign="center" allowSort="true">开票内容</div>
					<div field="reamrk" width="150" align="left" headerAlign="center" allowSort="true">备注</div>
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

		<fieldset id="field23" style="border:solid 1px #aaa;padding:3px;">
			<legend>本次采购结算发票</legend>
			<div id="form23" method="post">
				<div style="padding:5px;" >
					<table style="width:100%;" id="tictable">
						<input name="ticket.ticketid" id="ticketid" class="nui-hidden">
						<input name="ticket.ticrate" id="ticrate" class="nui-hidden">
						<input name="ticket.custid" id="tickcustid" class="nui-hidden">
						<input name="ticket.purcontid" id="tickpurcontid" class="nui-hidden">
						<input name="ticket.state" id="tickstate" class="nui-hidden">
						<tr>
							<td align="right" style="width:120px;">发票编号：</td>
							<td align="left" style="width:300px;">    
								<input name="ticket.ticnum" style="width:250px" id="ticnum" class="nui-textbox" required="true"  onvaluechanged="checkTicketnum"/>
							</td>
							<td align="right" style="width:120px;">发票类型：</td>
							<td align="left" style="width:150px;">  
								<input  name="ticket.tictype" style="width:150px" id="tictype" class="nui-dictcombobox"  dictTypeId="MIS_MA_INVOICETYPE" required="true"/>
							</td>
							<td align="right" style="width: 120px;">发票日期：</td>
							<td align="left" >
								<input class="nui-datepicker" style="width:250px" name="ticket.ticdate" id="ticdate" required="true" >
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">发票金额：</td>
							<td align="left" style="width:300px;">    
								<input name="ticket.ticmon" style="width:250px"  id="ticmon" class="nui-spinner" inputStyle="text-align: right;"  format="n2"  minValue="0" required="true" showButton="false" onvaluechanged="countMonnet" allowLimitValue="false"/>
							</td>
							<td align="right" style="width:120px;">税金：</td>
							<td align="left" style="width:150px;">    
								<input name="ticket.tictax" style="width:150px" id="tictax" class="nui-spinner" inputStyle="text-align: right;"  format="n2"  minValue="0" required="true" showButton="false" onvaluechanged="countMonnet" allowLimitValue="false"/>
							</td>
							<td align="right" style="width:120px;">不含税金额：</td>
							<td align="left" >    
								<input name="ticket.ticmonnet" style="width:250px" id="ticmonnet" class="nui-spinner" inputStyle="text-align: right;"  format="n2"  readonly="readonly" showButton="false" allowLimitValue="false"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">开票单位：</td>
							<td align="left" colspan="5">    
								<input name="ticket.ticcomp" id="ticcomp" class="nui-textbox"  maxLength="100" style="width:90%;">
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">开票内容：</td>
							<td align="left" colspan="5">    
								<input name="ticket.ticcontent" id="ticcontent" class="nui-textarea"  maxLength="125" style="width:90%;">
							</td>
						</tr>
					</table>
				</div>
			</div>
		</fieldset>
		
		<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		    <legend>结算附件上传</legend>
			<jsp:include page="/ame_common/addFiles.jsp"/>
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
	<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注流程</a>
   <%--<a class="nui-button" onclick="exportSettle" iconCls="icon-download" style="width:105px;margin-right:20px;" id="exportButton">导出结算单</a>--%>
   <a class="nui-button" onclick="onOk('app')" style="width:140px;margin-right:20px;" id="appButton" iconCls="icon-submit">提交采购支付申请</a>
   <a class="nui-button" onclick="onOk('save')" iconCls="icon-save" style="width:95px;margin-right:20px;" id="saveButton">暂时保存</a>
</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
   <input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
   <input type="hidden" name="downloadFile" filter="false"/>
   <input type="hidden" name="fileName" filter="false"/>
</form> 
	<script type="text/javascript">
	
		nui.parse();
		
		var form = new nui.Form("form1");
		var form23 = new nui.Form("form23");
		var opioionform = new nui.Form("#opioionform");
		var grid = nui.get("datagrid");
		var grid4 = nui.get("datagrid4");
	  	var grid2 = nui.get("datagrid2");
	  	var grid10 = nui.get("datagrid10");
		var ticketgrid = nui.get("ticketgrid");//采购合同发票
		var grid_paymentPlan = nui.get("paymentPlanGrid");
	  	
	  	<%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	   		Map<String,Object> a = user.getAttributes();
	   		String empid = (String) a.get("empid");
	    %>
	       var empid = <%=empid %>;
	        var expusername = "<%=username %>";
	      
	     
	       
		
		init();
	
		function init(){
			//com.primeton.eos.ame_pur.ame_purOtherSettlePay
			promptInit({"workItemID":0,"processDefName":"com.primeton.eos.ame_pur.ame_purOtherSettlePay","activityDefID":"manualActivity"});
			nui.get("auditstatus").setValue(3);
			document.getElementById("salesEdit").style.display="none";
			nui.get("auditopinion").setValue("");
			nui.get("checkerid").setValue('<%=userno %>');
			nui.get("checkerid").setText('<%=username %>');
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
		
        //选择项目
        function selectProject(){
        	var btnEdit = this;
        	var projectStatus;
            nui.open({
                url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp?preSettle=preSettle",
                title: "选择项目",
                width: 850,
                height: 475,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);
                        grid.clearRows();
                        grid2.clearRows();
                        //document.getElementById("daystotal").innerHTML = parseFloat(0);
            			//document.getElementById("monthstotal").innerHTML = parseFloat(0);
                        if (data) {
                        	if(data.projectno){
	                            btnEdit.setValue(data.projectno);
                        	}
                        	if(data.projectName){
	                            btnEdit.setText(data.projectName);
                        	}
                        	if(data.projectStatus){
	                            projectStatus = data.projectStatus;
                        	}
                            //内部商务合同编号
                            if(data.contnum){
	                            nui.get("contnum").setValue(data.contnum);
                            }
                            //如果不设置allowInput="false"会出现验证红圈  btnEdit.focus(); btnEdit.blur();
                            if(!data.custid){//客户为空
                            	nui.get("custno").setData();
			                	nui.get("custno").setValue();
			                	nui.get("custno2").setData();
			                	nui.get("custno2").setValue();
			                	nui.get("custid").setData();
			                	nui.get("custid").setValue();
			                	nui.get("benefitid").setText();
			                	nui.get("benefitid").setValue();
			                	nui.get("benefitid2").setText();
			                	nui.get("benefitid2").setValue();
			                	nui.get("projectno2").setText();
			                	nui.get("projectno2").setValue();
			                	nui.get("suppliersname").setValue();
			                	nui.get("companyname").setValue();<%--
                				nui.get("linkman").setValue();
                				nui.get("companytel").setValue();--%>
                				nui.get("bankname").setValue();
			   		            nui.get("bankacct").setValue();
                            }else{
                            	//赋值受益部门 
			                	nui.get("benefitid").setValue(data.finUnitId);
			                	nui.get("benefitid").setText(data.orgname);
			                	nui.get("benefitid2").setValue(data.finUnitId);
			                	nui.get("benefitid2").setText(data.orgname);
			                	nui.get("custno").setValue(data.custid);
			                	nui.get("custno").setText(data.custname);
			                	nui.get("custno2").setValue(data.custid);
			                	nui.get("custno2").setText(data.custname);
			                	nui.get("projectno2").setValue(data.projectno);
			                	nui.get("projectno2").setText(data.projectName);
			                	
			                	//筛选供应商
			                	var json2 = nui.encode({"criteria": 
	                            	{"_expr": 
	                            		{"_property": "miscustid","_value": data.custid}}
	                            ,"iden": "cust"});
	                            form.loading("数据处理中,请稍后...");
					        	nui.ajax({
					        		url: "com.primeton.eos.ame_pur.PurOtherSettlePay.queryMiscustsOther.biz.ext",
					                data: json2,
					                type: 'POST',
					                cache: false,
					                showModal: false,
					                contentType: 'text/json',
					                success: function (o2) {
					                	nui.parse();
					                	form.unmask();
					                	o2 = nui.clone(o2);
					                	if(o2.misCusts.length == 0){//供应商为空
						                	nui.get("custid").setData();
						                	nui.get("custid").setValue();
						                	nui.get("suppliersname").setValue();
					                	}else{
						                	nui.get("custid").setData(o2.misCusts);
						                	nui.get("custid").setValue(o2.misCusts[0].custid);
						                	nui.get("suppliersname").setValue(o2.misCusts[0].suppliersname);
						                	//采购合同信息
						                	//var json2 = nui.decode({custid: o2.misCusts[0].custid,projectno: data.projectno});
						                	var json2 = nui.decode({"criteria": 
						                		{"_expr[0]": {"_property": "custid","_op": "=","_value": o2.misCusts[0].custid},
						                		"_expr[1]": {"_property": "projectno","_op": "=","_value": data.projectno}}});
						                	grid.sortBy("purcontid","asc");
						                	grid.load(json2);
						                	//计提核销信息 根据项目(projectno)筛选计提信息
						                	var row10 = grid10.getSelecteds();
						                	var projectnos = "";
						                	for(var i = 0;i < row10.length;i ++){
						                		if(!projectnos){
						                			projectnos = row10[i].projectno;
						                		}else{
							                		projectnos += "," + row10[i].projectno; 
						                		}
						                	}
						                	var jsonPresettle = nui.decode({purPresettle: {custid: o2.misCusts[0].custid,projectno: projectnos,iden: "1"}});
						                	grid2.load(jsonPresettle,function (action2){
						                		if(projectStatus=="N" && (grid2.getData() == "" || grid2.getData() == null)){
			                						nui.confirm("项目状态为结项关闭，且无需核销的计提信息，不能发起结算流程。","确定要继续吗?",function(action){
			                							if (action == "ok") {
										                    nui.get("appButton").setEnabled(true);
			                								nui.get("saveButton").setEnabled(true);
										                } else {
										                    nui.get("appButton").setEnabled(false);
			                								nui.get("saveButton").setEnabled(false);
										                }
			                						}); 
						                			return;
						                		}else{
						                			nui.get("appButton").setEnabled(true);
			                						nui.get("saveButton").setEnabled(true);
						                		}
						                	});
                							document.getElementById("sumtotalpre").innerHTML = 0;
                						}
                						
                						//供应商账户信息(根据供应商名)
                						if(o2.misCusts==null || o2.misCusts == 0){
                						  nui.get("companyname").setValue();<%--
                						  nui.get("linkman").setValue();
                					      nui.get("companytel").setValue();--%>
                						  nui.get("bankname").setValue();
               		                      nui.get("bankacct").setValue();
                						}
                						else{
                						nui.get("companyname").setValue(o2.misCusts[0].accoutname);<%--
                						nui.get("linkman").setValue(o2.misCusts[0].linkman);
                					    nui.get("companytel").setValue(o2.misCusts[0].linktel);--%>
                					    nui.get("bankname").setValue(o2.misCusts[0].accoutbank);
			   		                    nui.get("bankacct").setValue(o2.misCusts[0].accountid);
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

                }
            });
        }
    	
		//自动计算不含税金额
		function countMonnet(){
			var ticmon = nui.get("ticmon").getValue();
			var tictax = nui.get("tictax").getValue();
			if(ticmon!=null && tictax!=null ){
				var ticmonnet = ticmon - tictax;
				nui.get("ticmonnet").setValue(ticmonnet);
				var ticrate = ticmon/ticmonnet-1;
				nui.get("ticrate").setValue(ticrate);
				nui.get("expticmon").setValue(ticmon);
				nui.get("expticmonnet").setValue(ticmonnet);
				nui.get("exptictax").setValue(tictax);
			}
		}

		//采购合同发票汇总
		function doCountNowPage(e){
				//客户端汇总计算
				if (e.field == "ticmon"||e.field == "tictax"||e.field == "ticmonnet") {
					e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
				}
			}

		function checkTicketnum(){
			//新增需要校验发票号是否重复
			var ticnum  = nui.get("ticnum").getValue();
			var json = nui.encode({ticnum:ticnum});
			nui.ajax({
				url: "com.primeton.eos.ame_pur.purTicket.checkTicnum.biz.ext",
				data: json,
				type: 'POST',
				cache: false,
				contentType: 'text/json',
				success: function(text){
					if(text.result=="1"){
						alert("发票号已存在，请检查后再进行操作！");
						nui.get("ticnum").setValue(null);
					}
				},
				error: function(jqXHR, textStatus, errorThrown){
					alert(jqXHR.responseText);
					CloseWindow();
				}
			});
		}
        //选择供应商
        function changeCust(e){
        	var btnEdit = this;
    		nui.open({
    			url:"<%=request.getContextPath() %>/ame_pur/PurOtherSettlePay/QueryPurSupplier.jsp?",
                title: "选择供应商",
                width: 600,
                height: 400,
                ondestroy: function (action) {
                	if (action == "ok") {
                		
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						
						btnEdit.setText(data.custname);
						nui.get("ticcomp").setValue(data.custname);
	                	btnEdit.setValue(data.custid);
	                	nui.get("suppliersname").setValue(data.suppliersname);
	                	
	                	var settlementid = nui.get("settlementid").getValue();
        	
			        	//采购合同信息
			        	if(settlementid){
				    		var json2 = nui.decode({"criteria": 
						                		  {"_expr[0]": {"_property": "purSupplier.custid","_op": "=","_value": data.custid}
						                		  ,"_expr[1]": {"_property": "purtype","_op": "in","_value": '1,2,4,5,3'}}});
				        	grid.load(json2);
				        	grid.sortBy("purcontid","asc");
				    	}else{
				        	var json2 = nui.decode({"criteria": 
						                		  {"_expr[0]": {"_property": "purSupplier.custid","_op": "=","_value": data.custid}
						                		  ,"_expr[1]": {"_property": "purtype","_op": "in","_value": '1,2,4,5,3'}},"b": "true"});
				        	grid.load(json2);
				        	grid.sortBy("purcontid","asc");
				    	}
				    	grid10.clearRows();
				    	grid2.clearRows();
				    	grid_paymentPlan.clearRows();
				    	document.getElementById("sumtotal").innerHTML = 0;
			    		nui.get("setamount").setValue(0);
						nui.get("setamount2").setValue(0);
						//供应商账户信息
						nui.get("companyname").setValue(data.accoutname);<%--
    					nui.get("linkman").setValue(data.linkman);
    					nui.get("companytel").setValue(data.linktel);--%>
    					nui.get("bankname").setValue(data.accoutbank);
   		                nui.get("bankacct").setValue(data.accountid);
					}
					nui.get("custid").validate();
                }
    	 	})
    	}
        
         //选择行计提
        var allSumPre = 0;
        function onSelectPre(e){
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
            //项目信息
			
            if(rows.purcontid == null || rows.purcontid == 0){
            	grid10.load(json_p);
            }else{

            	var json_p = nui.decode({"criteria": 
					                {"_expr[0]": {"_property": "purcontid","_op": "=","_value": rows.purcontid}},"b": "true"});	
                var json_t = nui.decode({"criteria": 
									{"_expr[0]": {"_property": "purcontid","_op": "=","_value": rows.purcontid},"_expr[1]": {"_property": "state","_op": "=","_value": "1"}},"b": "true"});	
	            grid10.load(json_p);
	    		grid10.sortBy("projectno","asc");
	    		grid2.clearRows();
				ticketgrid.sortBy("ticdate","desc");
				ticketgrid.load(json_t,function(){
					var tickets = ticketgrid.getData();
					if(tickets.length==null||tickets==null||tickets.length==0){
						document.getElementById("field24").style.display="none";
					}else{
						document.getElementById("field24").style.display="";
					}
				});
	    		document.getElementById("sumtotal").innerHTML = 0;
	    		nui.get("setamount").setValue(0);
				nui.get("setamount2").setValue(0);
				contractContmoney = rows.contmoney;
				grid_paymentPlan.load({purcontid:rows.purcontid});
            }
			nui.get("tickcustid").setValue(rows.purSupplier.custid);
			nui.get("tickpurcontid").setValue(rows.purcontid);
			nui.get("tickstate").setValue("1");  
			
			
        }
    	
    	//支付金额改变事件
    	function changeSetamount(){
    		var setamount = nui.get("setamount2").getValue();
    		nui.get("setamount").setValue(setamount);
    		
    	}
    	
    	//备注改变事件
    	function changecomment(){
    		var setamount = nui.get("explain").getValue();
    		nui.get("comment").setValue(setamount);
    		
    	}
    	
		//发起其他结算流程
		function SaveData(){
			//判断是否选中采购合同
		   	var rows = grid.getSelecteds();
		   	if(rows.length == 0){
				nui.alert("未选中采购合同记录");
				return;
			}
			else {
			    var zongje = parseFloat(nui.get("setamount").getValue()).toFixed(2);
	            var zongji = parseFloat(rows[0].contmoney-rows[0].payMoney).toFixed(2);
	            if(parseFloat(zongje)<=0){
	                nui.alert("本次结算金额必须大于零！" );
	                return;
	            }
			    if(parseFloat(zongje) > parseFloat(zongji)){
			        nui.alert("本次结算金额" + zongje + "元，大于采购合同未付款金额，不能发起付款流程！" );
				    return;
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
					<%--if(Prjrows[i].startdate=="" || Prjrows[i].startdate==null){
						nui.alert("选中的项目的结算开始日期不能为空！")
						return;
					}
					if(Prjrows[i].enddate=="" || Prjrows[i].enddate==null){
						nui.alert("选中的项目的结算结束日期不能为空")
						return;
					}--%>
				}
			}
			
			//采购发票
			var ticket;
			if(form23.validate()){
				var data11 = form23.getData();
				ticket = data11.ticket;
				nui.get("expticdate").setValue(ticket.ticdate);
				nui.get("expticcomp").setValue(ticket.ticcomp);
				nui.get("expticnum").setValue(ticket.ticnum);
			}else{
				return;
			}
			if(form.validate()){
			     var setamount = nui.get("setamount").getValue();
			     var save = nui.get("save").getValue();
			     var filePaths = document.getElementsByName("uploadfile").length;
			     var massage="";
			     if(filePaths == 0)
			     {
        		      massage="没有添加结算附件,";
			     }
			     else{
			          massage="";
			     }
			     //暂时保存
			     if(save == "save"){
			          nui.confirm("结算最终总金额为" + setamount + "(元),"+massage+"确认暂时保存？", "确定？",
			          function (action) {
			              if (action == "ok"){
			                  nui.get("appButton").setEnabled(false);
			                  nui.get("saveButton").setEnabled(false);
			                  var data = form.getData();
			                  
			                  //采购合同id
			                  data.purSettle.purcontid = rows[0].purcontid;
			                  //alert(nui.encode(rows.purcontid));
			                  
			                  //项目信息
			                  var rdProject = grid10.getSelecteds();
			                  data.purSettle.rdProject = rdProject;
			                  data.purSettle.prjlength = rdProject.length;
			                  
			                  //计提信息
							  var purPresettles = grid2.getSelecteds();
							  data.purSettle.purPresettles = purPresettles;
							  var custname = nui.get("custno").getText();
							  var suppliersname = nui.get("suppliersname").getValue();
							  data.suppliersname = suppliersname; 
							  data.custname = custname; 
							  if(purPresettles.length<1){
							  	data.purSettle.costtype="1";
							  }else{
							  	data.purSettle.costtype=purPresettles[0].costtype;
							  }
							  
							  data.ishavaTicket = "y";
							  data.ticket = ticket;
							  //纸质凭证送递人信息
							  var checkerid = nui.get("checkerid").getValue();
							  var checkername = nui.get("checkerid").getText();
							  data.checkerid = checkerid;
							  data.checkername = checkername;
							  //审核信息
								var opioionformData = opioionform.getData();
								data.misOpinion = opioionformData.misOpinion;
							  //报销单
							  data.expReiList.projectno2 = nui.get("projectno2").getText();
    		                  data.expReiList.custno2 = nui.get("custno2").getValue();
    		                  data.expReiList.benefitid2 = nui.get("benefitid2").getText();
    		                  data.expReiList.custname2 = nui.get("custno2").getText();
							  //alert(nui.encode(data));
							  
							  data.purSettle.guanzhu = nui.get("guanZhuButton").getValue();
							  
							  //调用发起逻辑流
							  var json = nui.decode(data);
							  form.loading("流程处理中,请稍后...");
							  nui.ajax({
					    			url:"com.primeton.eos.ame_pur.PurOtherSettlePay.makeOtherGoSettlePay1.biz.ext",
					    			data:json,
					    			type:"post",
					    			contentType:"text/json",
					    			success:function(action){
					    				form.unmask();
					    				var actionJson = nui.decode(action);
					    				if(action.exception == null){
								        	nui.alert("保存成功","系统提示",function(){
								        		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
								        	});
					    				}else{
					    					nui.alert("保存失败，请联系信息技术部人员！","系统提示", function(action){
						    					nui.get("appButton").setEnabled(true);
				                				nui.get("saveButton").setEnabled(true);
					    					});
					    				}
					    			},
					    			error:function(jqXHR, textStatus, errorThrown){
					    				nui.alert("error:" + jqXHR.responseText);
					    			}
					    		});
			              }
			              else{
			                 return;
			              } 
			          }
			          );
			          return;
			     }
			     //保存并发起流程
			     else{
			          nui.confirm("结算最终总金额为" + setamount + "(元),"+massage+"确认发起流程？", "确定？",
			          function (action) {
			              if (action == "ok"){
			                  nui.get("appButton").setEnabled(false);
			                  nui.get("saveButton").setEnabled(false);
			                  var data = form.getData();
			                  
			                  //采购合同id
			                  data.purSettle.purcontid = rows[0].purcontid;
			                  //alert(nui.encode(rows.purcontid));
			                  
			                  //项目信息
			                  var rdProject = grid10.getSelecteds();
			                  data.purSettle.rdProject = rdProject;
			                  data.purSettle.prjlength = rdProject.length;
			                  
			                  //计提信息
							  var purPresettles = grid2.getSelecteds();
							  data.purSettle.purPresettles = purPresettles;
							  var custname = nui.get("custno").getText();
							  var suppliersname = nui.get("suppliersname").getValue();
							  data.suppliersname = suppliersname; 
							  data.custname = custname; 
							  if(purPresettles.length<1){
							  	data.purSettle.costtype="1";
							  }else{
							  	data.purSettle.costtype=purPresettles[0].costtype;
							  }
							  
							  data.ishavaTicket = "y";
							  data.ticket = ticket;
							  //纸质凭证送递人信息
							  var checkerid = nui.get("checkerid").getValue();
							  var checkername = nui.get("checkerid").getText();
							  data.checkerid = checkerid;
							  data.checkername = checkername;							  
							  //审核信息
								var opioionformData = opioionform.getData();
								data.misOpinion = opioionformData.misOpinion;
							  //报销单
							  data.expReiList.projectno2 = nui.get("projectno2").getText();
    		                  data.expReiList.custno2 = nui.get("custno2").getValue();
    		                  data.expReiList.benefitid2 = nui.get("benefitid2").getText();
    		                  data.expReiList.custname2 = nui.get("custno2").getText();
							  //alert(nui.encode(data));
							  
							  data.purSettle.guanzhu = nui.get("guanZhuButton").getValue();
							  
							  //调用发起逻辑流
							  var json = nui.decode(data);
							  form.loading("流程处理中,请稍后...");
							  nui.ajax({
					    			url:"com.primeton.eos.ame_pur.PurOtherSettlePay.makeOtherGoSettlePay1.biz.ext",
					    			data:json,
					    			type:"post",
					    			contentType:"text/json",
					    			success:function(action){
					    				form.unmask();
					    				var actionJson = nui.decode(action);
					    				if(action.exception == null){
					    				 	var result="";
					    					if(action.result != null){
					    						result=action.result;
					    					}
								        	nui.alert("结算流程发起成功"+result,"系统提示",function(){
								        		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
								        	});
					    				}else{
					    					nui.alert("结算流程发起失败，请联系信息技术部人员！","系统提示", function(action){
						    					nui.get("appButton").setEnabled(true);
				                				nui.get("saveButton").setEnabled(true);
					    					});
					    				}
					    			},
					    			error:function(jqXHR, textStatus, errorThrown){
					    				nui.alert("error:" + jqXHR.responseText);
					    			}
					    		});
			              }
			              else{
			                 return;
			              } 
			          }
			          ); 
			     }
			}
			else{
			    return;
			}
		   //alert('1');
		}
		
		function onOk(e){
			var filePaths = document.getElementsByName("uploadfile").length;
        	for(var j = 0;j < filePaths;j++){
        		var a = document.getElementsByName("remarkList")[j].value;
        		if(a == null || a == ""){
        			nui.alert("新增附件不可以为空");
        			return false;
        		}
        	}
        	if(form.validate()){
        		nui.get("save").setValue(e);
	    		document.getElementById("fileCatalog").value="purSettle";
	    		form2.submit();
	    	}else{
	    		return;
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
        
        //选择纸质凭证送递人
        function selectSaleLeader(){
	    	var btnEdit = this;
	        nui.open({
	            url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
	                title: "纸质凭证送递人",
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
	                        form.validate();
	                    }
	
	                }
	           	 });
        }
	    
	    //查询银行账号
    	function searchbankacct(){
    		//收款单位 companyname 银行名称 bankname 银行账号 bankacct
    		//ame_pur/settlepay/selectBankInfo.jsp
    		  var empid = <%=empid %>;
    		  console.log(empid);
    		 
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
        	
        	var row = e.record;
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
			nui.get("ticmon").setValue(parseFloat(sumFee).toFixed(2));
			nui.get("ticmonnet").setValue(parseFloat(sumFee).toFixed(2));
			nui.get("setamount").setValue(sumFee);
			nui.get("setamount2").setValue(sumFee);
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
        		
    			if(rows[i].projectStatus=="N"){
    				nui.confirm(rows[i].projectName+"的项目状态为结项关闭，点击确认则继续发起结算流程。","确定要继续吗?",function(action){
						if (action == "ok") {
		                    nui.get("appButton").setEnabled(true);
							nui.get("saveButton").setEnabled(true);
		                } else {
		                    nui.get("appButton").setEnabled(false);
							nui.get("saveButton").setEnabled(false);
		                }
					});
    			}else{
    				nui.get("appButton").setEnabled(true);
					nui.get("saveButton").setEnabled(true);
    			}
        	}
        	
        	if(rows.length == 0){
        		grid2.clearRows();
        	}else{
        		var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectnos,iden: "1"}});
        		grid2.load(jsonPresettle);
        	}
        	
        	//计算结算费用和
        	sumFee = parseFloat(sumFee).toFixed(2);
			document.getElementById("sumtotal").innerHTML = parseFloat(sumFee).toFixed(2);
			nui.get("ticmon").setValue(parseFloat(sumFee).toFixed(2));
			nui.get("ticmonnet").setValue(parseFloat(sumFee).toFixed(2));
			nui.get("setamount").setValue(sumFee);
			nui.get("setamount2").setValue(sumFee);
	    }
	    
	    function changemon(){
	    	var ticmon = nui.get("ticmon").getValue();
	    	var tictax = nui.get("tictax").getValue();
			nui.get("ticmonnet").setValue(parseFloat(ticmon).toFixed(2)-parseFloat(tictax).toFixed(2));
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