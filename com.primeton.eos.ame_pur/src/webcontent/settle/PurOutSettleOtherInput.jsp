<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): chiayang
  - Date: 2016-09-18 09:04:35
  - Description:
-->
<head>
	<title>新增、编辑非外包采购结算记录</title>
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
	 	<form id="form1" method="post">
	 		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>非外包采购合同基本信息</legend>
				<input name="purSettle.settlementid" id="settlementid" class="nui-hidden"/>
				<input name="purSettle.projectno" id="projectno1" class="nui-hidden"/>
				<input name="purSettle.fileids" id="fileids" class="nui-hidden"/>
				<input name="purSettle.fileids" id="fileids" class="nui-hidden"/>
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">供应商：</td>
							<td style="width:300px;">
								<input name="purSettle.custid" id="custid" class="nui-buttonedit" required="true" style="width:280px" emptyText="请选择供应商" onbuttonclick="selectSupplier" allowInput="false" />
							</td>
							<td align="right" style="width:120px;display:none">采购合同：</td>
							<td><input name="purSettle.purcontid" id="purcontid" class="nui-combobox" onvaluechanged="changeContract" validate valueField="purcontid" textField="purcontname" showNullItem="true" allowInput="false" style="width:310px;display:none"/></td>
						</tr>
						<tr style="display:none">
							<td align="right" style="width:120px;">合同额：</td>
							<td id="contmoney"></td>
							<td align="right" style="width:120px;">已支付金额：</td>
							<td id="paymoney"></td>
						</tr>
						<tr style="display:none">
							<td align="right" style="width:120px;">对应项目编号：</td>
							<td id="projectno"></td>
							<td align="right" style="width:120px;">采购合同编号：</td>
							<td name="purOutcost.purcontno" id="purcontno"></td>
						</tr>
						<tr style="display:none">
							<td align="right" style="width:120px;">受益部门：</td>
							<td id="benefitid"></td>
							<td style="display:none;"><input name="purSettle.benefitid" id="benef" class="nui-textbox" style="width: 100px;" /></td>
							<td></td>
						</tr>
					</table>
				</div>
			</fieldset>
			
			<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
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
				       <div field="contmoney" headerAlign="center" allowSort="true" visible="true" width="70" align="right">合同金额</div>
				       <div field="payMoney" headerAlign="center" allowSort="true" visible="true" width="100" align="right">已付款/审核中的合同额</div>
				       <div field="payCount" headerAlign="center" allowSort="true" visible="true" width="70" numberFormat="p" align="right">付款比例</div>
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
		     	<legend>请选择项目(单选)</legend>
		     	<div id="datagrid10" class="nui-datagrid" dataField="purProjCont" style="width:100%;height:auto;" 
			    	url="com.primeton.eos.ame_pur.PurOtherSettlePay.queryRdProject.biz.ext" multiSelect="false" 
			    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" allowSortColumn="false"
			    	oncellendedit="doSumfee" onselect="onSelectPrj" ondeselect="onSelectPrj" 
			    	onlyCheckSelection="true">
					<div property="columns">
						<div type="checkcolumn" width="30"></div>
						<div field="purcontid" align="center" headerAlign="center" allowSort="true" visible="false">采购合同id</div>
						<div field="projectId" align="center" headerAlign="center" allowSort="true" visible="false">项目id</div>
						<div field="settlementid" align="center" headerAlign="center" allowSort="true" visible="false">结算单编号</div>
						<div field="purcontnum" align="center" headerAlign="center" allowSort="true" visible="false">采购合同编号</div>
						<div field="projectno" width="60" align="center" headerAlign="center" allowSort="true" >项目编号</div>	
						<div field="projectName" width="auto" align="center" headerAlign="center" allowSort="true" >项目名称</div>
						<div field="purmoney" headerAlign="center" allowSort="true" visible="true" width="60" align="right">采购金额</div>
						<div field="wzfje" headerAlign="center" allowSort="true" visible="true" width="70" align="right">未支付金额</div>
						<div field="contnum" width="80" align="center" headerAlign="center" allowSort="true" visible="true">销售合同编号</div>
						<div field="contract.projectname" width="60" align="center" headerAlign="center" allowSort="true" visible="true">合同名称</div>	
						<div field="contract.contsum" headerAlign="center" allowSort="true" visible="true" width="56" align="right">合同金额</div>
						<div field="contract.pay" headerAlign="center" allowSort="true" visible="true" width="80" align="right">已收款合同额</div>
						<div field="contract.paycount" headerAlign="center" allowSort="true" visible="true" width="60" numberFormat="p" align="right">收款比例</div>
						<div field="prjfee" width="80" dataType="currency" align="right" headerAlign="center" allowSort="true" cellCls="myIndex">
							项目结算费用
							<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
						</div>
						<div field="startdate" headerAlign="center" allowSort="true" width="78" align="center" visible="true" dateFormat="yyyy-MM-dd" cellCls="myIndex">结算开始日期
							<input property="editor" class="nui-datepicker" style="width:100%;" />
						</div>
			            <div field="enddate" headerAlign="center" allowSort="true" width="78" align="center" visible="true" dateFormat="yyyy-MM-dd" cellCls="myIndex">结算结束日期
			            	<input property="editor" class="nui-datepicker" style="width:100%;" />
			            </div>
						<div field="settlementno" width="70" align="right" headerAlign="center" allowSort="true">
							结算单编号
							<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
						</div>
					</div>
				</div>
				<div style="width: 100%;height:24px;float:left;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width: 700px;">结算费用总计：</td>
							<td id="sumtotal" style="width: 100px;" align="right" ></td>
						</tr>
					</table>
				</div>
		     </fieldset>
			
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>非外包采购结算基本信息</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<%--<td align="right" style="width:100px;">结算单编号：</td>
							<td><input name="purSettle.settlementno" id="settlementno" class="nui-textbox" style="width: 100px;" required="true" onblur="checkSettlementno"/></td>--%>
							<td align="right" style="width:100px;">结算总金额：</td>
							<td><input name="purSettle.setamount" id="setamount" class="nui-textbox" style="width: 100px;" onblur="noTaxaMount" required="true" inputStyle="text-align: right;"/></td>
							<td align="right" style="width:100px;">税率：</td>
							<td><input name="purSettle.tax" id="tax" class="nui-textbox" style="width: 100px;" onblur="noTaxaMount" required="true" inputStyle="text-align: right;"/>%</td>
							<td align="right" style="width:150px;">不含税金额：</td>
							<td><input name="purSettle.notaxmon" id="notaxmon" class="nui-textbox" style="width: 100px;" readOnly="readOnly" required="true" inputStyle="text-align: right;"/></td>
						</tr>
						<tr>
							<td align="right">成本说明：</td>
							<td ><input name="purSettle.costmemo" id="costmemo" class="nui-dictcombobox" dictTypeId="AME_COSTTYPE" showNullItem="true" required="true"  style="width: 100px;" /></td>
							<td align="right" style="width:100px;">结算单状态：</td>
							<td><input name="purSettle.setstatus" id="setstatus" class="nui-dictcombobox" dictTypeId="AME_SETSTATUS" onblur="changesetstatus" style="width:100px;"/></td>
							<td align="right" style="width:150px;">财务对应销售合同编号：</td>
							<td><input name="purOutcost.contnum" id="contnum" class="nui-buttonedit" style="width: 100px;" onbuttonclick="selectCont" /></td>
						</tr>
						<tr>
							<td align="right">结算申请日期：</td>
							<td><input name="purSettle.subdate" id="subdate" class="nui-datepicker" style="width: 100px;" /></td>						
							<%-- 
							<td align="right" style="width:120px;">结算开始日期：</td>
							<td><input name="purSettle.startdate" id="startdate" onvaluechanged="startandend('start')" class="nui-datepicker" required="false" style="width:100px"/></td>
							<td align="right" style="width:120px;">结算截止日期：</td>
							<td><input name="purSettle.enddate" id="enddate" onvaluechanged="startandend('end')" class="nui-datepicker" required="false" style="width:100px" /></td>
							--%>
							<td align="right">成本确认日期：</td>
							<td><input name="purSettle.confirmdate" id="confirmdate" class="nui-datepicker" style="width: 100px;" required="true"/></td>		
							<td align="right">付款日期：</td>
							<td><input name="purSettle.paydate" id="paydate" class="nui-datepicker" style="width: 100px;" /></td>
						</tr>			
						<tr>
							<td align="right">凭证号：</td>
							<td><input name="purSettle.pzhs" id="pzhs" class="nui-textbox" style="width: 100px;" /></td>
							<td align="right">凭证年：</td>
							<td><input name="purSettle.pzyear" id="pzyear" onvaluechanged="changepzyear" class="nui-monthpicker" format="yyyy" style="width: 100px;" /></td>
							<td align="right">凭证月：</td>
							<td><input name="purSettle.pzmonth" id="pzmonth" onvaluechanged="changepzmonth" class="nui-monthpicker" format="MM" style="width: 100px;" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">工作量单位：</td>
							<td><input name="purSettle.workunit" id="workunit" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" value="1" required="true"  onvaluechanged="changeWorkamount" style="width:80px" /></td>
							<td align="right" style="width:120px;">工作量数量：</td>
							<td><input name="purSettle.workamount" id="workamount" class="nui-spinner" showButton="false" 
								allowLimitValue="false" changeOnMousewheel="false" style="width: 100px;" 
								inputStyle="text-align: left;" /></td>
							<td align="right">成本归属类型：</td>
							<td ><input name="purSettle.costtype" id="costtype" class="nui-dictcombobox" dictTypeId="AME_CONTCOSTTYPE" showNullItem="true" required="true"  style="width: 100px;" /></td>
						</tr>
						<tr>
						</tr>
						<tr> 
							<td align="right">说明：</td>
							<td colspan="5"><input name="purSettle.comment" id="comment" class="nui-textarea" required="false" style="width:720px"/></td>
						</tr>
					</table>
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
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
				<legend>计提核销信息</legend>
				<div id="datagrid2" class="nui-datagrid" dataField="purPresettles" style="width:100%;height:auto;" 
				     url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleListToSettle.biz.ext" multiSelect="true"
				     showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" 
				     onselect="onSelectPre" ondeselect="onDeselectPre" 
				     onlyCheckSelection="true" allowSortColumn="false">
					<div property="columns">
						<div type="checkcolumn" width="30"></div>			
					 	<div field="accruedid" headerAlign="center" allowSort="true" visible="true" width="60">计提编号</div>
		             	<div field="custid" headerAlign="center" allowSort="true" visible="false">供应商编号</div>
		             	<div field="custname" headerAlign="center" allowSort="true" visible="false">供应商名称</div>
		             	<div field="suppliersname" width="70 " headerAlign="center" allowSort="true" >供应商简称</div>
		             	<div field="projectno" headerAlign="center" allowSort="true" visible="false">项目代码</div>
		             	<div field="projectname" headerAlign="center" width="auto"  allowSort="true" visible="false">项目名称</div>
		             	<div field="salesid" headerAlign="center" allowSort="true" visible="false" >所属销售ID</div>
		             	<div field="orgname" headerAlign="center" allowSort="true" width="60" align="center" >受益部门</div>
		             	<div field="syb" headerAlign="center" allowSort="true" width="70" renderer="dictGetContOrg" >所属事业部</div>
		             	<div field="contnum" headerAlign="center" allowSort="true" visible="false">销售合同</div>
			             
		             	<div field="workunit" width="70" align="center" headerAlign="center" allowSort="true" renderer="dictGetWorkunit">工作量单位</div>
						<div field="workamount" width="70" align="center" headerAlign="center" allowSort="true" >工作量数量</div>
			             
		             	<div field="startdate" headerAlign="center" allowSort="true" width="70" align="center" visible="true">开始日期</div>
		             	<div field="enddate" headerAlign="center" allowSort="true" width="70" align="center" visible="true">结束日期</div>
		             	<div field="accrueddate" headerAlign="center" allowSort="true" width="70" align="center" dateFormat="yyyy-MM-dd">计提时间</div>
		             	<div field="accruedmoney" headerAlign="center" allowSort="true" width="80" align="right" dataType="currency" >计提金额</div>
		             	<div field="costtype" headerAlign="center" allowSort="true" renderer="dictGetCostType" width="70" align="center" >成本类型</div>
		             	<%--<div field="outper" headerAlign="center" allowSort="true" width="200" >相关外包人员</div>--%>
		             	<div field="accruedstatus" headerAlign="center" allowSort="true" renderer="dictGetStatus" width="90" align="center" >状态</div>
		             	<div field="settlementid" headerAlign="center" allowSort="true" visible="fales" >结算单编号</div>
		             	<div field="comment" width="auto" headerAlign="center" allowSort="true" visible="fales">备注</div>
			     	</div>
		        </div>
		        <div style="width: 600px;height:25px;margin-left:205px;float:left;">
				    <table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:140px;">计提核销总计：</td>
							<td id="sumtotalworkamount" style="width:65px;" align="center" ></td>
							<td style="width: 80px;"></td>
							<td id="sumtotalpre" style="width:110px;" align="right" ></td>
					   </tr>
				    </table>
				</div>
		     </fieldset>
		     
		     <fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		     	<legend>结转明细</legend>
		     	<div style="padding:5px;">
		     	<div class="nui-CheckBox" name="purOutcost.checkSure" id="checkSure" onclick="checkSure()" checked="true" text="是否增加结转记录" trueValue="1" falseValue="0"></div>
				<input name="purOutcost.outcostid" id="purOutcostOutcostid" class="nui-hidden" />
				<input name="purOutcost.outcosttype" id="purOutcostOutcosttype" class="nui-hidden" />
				<input name="purOutcost.accruedid" id="purOutcostAccruedid" class="nui-hidden" />
				<input name="purOutcost.accruedmon" id="purOutcostAccruedmon" class="nui-hidden" />
				<input name="purOutcost.outcoststatus" id="purOutcostOutcoststatus" class="nui-hidden" value="1" />
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width: 100px;">结转金额：</td>
							<td><input name="purOutcost.taxmon" id="taxmon" class="nui-textbox" style="width: 100px;" onblur="noTaxamounts" inputStyle="text-align: right;"/></td>
							<td align="right" style="width: 100px;">结转税率：</td>
							<td><input name="purOutcost.tax" id="purOutcostTax" class="nui-textbox" style="width: 100px;" onblur="noTaxamounts" required="true" inputStyle="text-align: right;"/>%</td>
							<td align="right" style="width: 130px;">结转不含税金额：</td>
							<td><input name="purOutcost.notaxmon" id="purOutcostNotaxmon" class="nui-textbox" style="width: 100px;" readOnly="readOnly"/></td>
						</tr>
					</table>
				</div>
		     </fieldset>
	 	</form>
	 	<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>非外包采购结算附件</legend>
			<jsp:include page="/ame_common/inputFile.jsp"/>
			<%-- <jsp:include page="/ame_common/detailFile.jsp"/> --%>
		</fieldset>
	 </div>
	 <div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	 </div>
		<script type="text/javascript">
		nui.parse();
		//增加其他结算信息
		var addURL = "com.primeton.eos.ame_pur.settle.addOtherPurSettle.biz.ext";
		//修改其他结算信息
		var updateURL = "com.primeton.eos.ame_pur.settle.updateOtherPurSettle.biz.ext";
		var saveURL = "";		
		var form = new nui.Form("form1");	
		var settlementnohave = false;
		var grid = nui.get("datagrid");
		var grid2 = nui.get("datagrid2");
		var grid10 = nui.get("datagrid10");
		var historypay = 0;
		var purSettles;
		var grid_paymentPlan = nui.get("paymentPlanGrid");
		
		//操作是新增还是编辑
	  	var dataaction = null;
	  	
	  	//全局变量用以保存时计算金额
	  	var allpaymoney = null;
	  	var allcontmoney = null;
		
		init();
		function init(){
			//设置结算单的状态只能是新增和完成
			var setstatusdate = [{"__NullItem":true,"dictName":"","dictID":""},{"dictID":"0","dictName":"新增"},{"dictID":"2","dictName":"完成"}];
			nui.get("setstatus").setData(setstatusdate);
		}
		
		//新增时首先选择供应商
        function selectSupplier(){
        	grid2.clearRows();
        	var btnEdit = this;
            nui.open({
                url:"<%=request.getContextPath() %>/ame_pur/PurSupplier/SelectSupplier.jsp",
                title: "选择供应商",
                width: 650,
                height: 380,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);			            		
                        if (data) {
                            btnEdit.setValue(data.custid);
                            btnEdit.setText(data.custname);
                            //nui.get("suppliersname").setValue(data.suppliersname);
                            
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
							                		  ,"_expr[1]": {"_property": "purtype","_op": "in","_value": '1,2,4,5,3'}}});
					        	grid.load(json2);
					        	grid.sortBy("purcontid","asc");
					    	}
					    	grid10.clearRows();
				    		grid2.clearRows();
				    		grid_paymentPlan.clearRows();
				    		document.getElementById("sumtotal").innerHTML = 0;
			    			nui.get("setamount").setValue(0);
							//nui.get("setamount2").setValue(0);
							//供应商账户信息
							//nui.get("companyname").setValue(data.accoutname);
	    					//nui.get("linkman").setValue(data.linkman);
	    					//nui.get("companytel").setValue(data.linktel);
	    					//nui.get("bankname").setValue(data.accoutbank);
	   		                //nui.get("bankacct").setValue(data.accountid);
                        }
                        nui.get("custid").validate();
                    }
                }
            });
        }
        
        //根据工作量单位来判断工作量数量是否必填
        function changeWorkamount(){
			var workunit = nui.get("workunit").getValue();
			if(workunit!='3'){
				nui.get("workamount").setRequired(true);
			}else{
				nui.get("workamount").setRequired(false);
			}	
		}
		
		//根据采购合同的变化,查询出对应的信息
        function changeContract(){
        	//下拉列表框内的合同改变时,合同内容全部清空
        	document.getElementById("contmoney").innerHTML = "";
        	document.getElementById("paymoney").innerHTML = "";
        	document.getElementById("projectno").innerHTML = "";
        	document.getElementById("purcontno").innerHTML = "";
			document.getElementById("benefitid").innerHTML = "";
			grid2.clearRows();
			//供应商
        	var custid = nui.get("custid").getValue();
        	
        	//发起ajax请求，得到合同的剩余信息	
        	nui.ajax({
        		url: "com.primeton.eos.ame_pur.settle.getOutPurContractByCustid.biz.ext",
        		data: {purcontid: nui.get("purcontid").getValue()},
        		type: 'POST',
        		contentType: 'text/json',
        		success: function (o) {
        			o = nui.clone(o);
        			//合同额
				    document.getElementById("contmoney").innerHTML = o.purContract[0].contmoney == null ? "" : o.purContract[0].contmoney;
				   	
				   	allcontmoney = o.purContract[0].contmoney;
				   
        			//根据合同编号，发起逻辑流，算出已支付金额
				    nui.ajax({
				        url: "com.primeton.eos.ame_pur.settle.getOtherPurSettleMoney.biz.ext",
				        data: {purcontid: nui.get("purcontid").getValue()},
				        type: 'POST',
				        cache: false,
				        contentType: 'text/json',
				        success: function (m) {
				            m = nui.clone(m);					
				            if(m.purSettle == null || m.purSettle == ""){
				            	alert("该合同尚未支付过款项！");
				            }			
				            //获取后台计算的总金额
				            document.getElementById("paymoney").innerHTML = m.setamounttotal == null ? "" : m.setamounttotal;
				            allpaymoney =  m.setamounttotal;
				        },
				        error: function (jqXHR, textStatus, errorThrown) {
						    alert(jqXHR.responseText);
						    CloseWindow();
				        }
				    });
				    
				    
				    //对应项目编号
				    document.getElementById("projectno").innerHTML = o.purContract[0].projectno == null ? "" : o.purContract[0].projectno;
  					nui.get("projectno1").setValue(o.purContract[0].projectno);
				    //合同编码
				    document.getElementById("purcontno").innerHTML = o.purContract[0].purcontnum == null ? "" : o.purContract[0].purcontnum;  	
				    
				    if(o.purContract[1].projectno != null){
	            		//计提核销信息 根据项目(projectno)筛选计提信息
	                	var jsonPresettle = nui.decode({purPresettle: {custid:data.custid,projectno: o.purContract[0].projectno,iden: "1"}});
	                	grid2.load(jsonPresettle,function (action2){
	                		if((grid2.getData() == "" || grid2.getData() == null)){
	    						nui.confirm("项目状态为结项关闭，且无需核销的计提信息，不能发起结算流程。","确定要继续吗?"); 
	                		}
	                	});
						document.getElementById("sumtotalpre").innerHTML = 0;
	            	}
        			
        			//根据合同编号，发起逻辑流，查找受益部门
					nui.ajax({
						url: "com.primeton.eos.ame_pur.settle.getOtherPurSettleBenefitid.biz.ext",
						data: {projectno: o.purContract[0].projectno},
						type: 'POST',
						cache: false,
						contentType: 'text/json',
						success: function (o) {
						    o = nui.clone(o);					
							if(o.rdProject == null || o.rdProject == ""){
								 alert("该合同没有受益部门！");
								 return;
							}
							document.getElementById("benefitid").innerHTML = o.rdProject.orgname == null ? "" : o.rdProject.orgname;
							 //隐藏于隐藏受益部门
							nui.get("contnum").setValue(o.rdProject.contractid);
						 	nui.get("contnum").setText(o.rdProject.contnum);
							nui.get("benef").setValue(o.rdProject.orgid);
						},
						error: function (jqXHR, textStatus, errorThrown) {
						     alert(jqXHR.responseText);
						     CloseWindow();
				        }
					});
					
					//合同存档编号（取合同表中的外部商务合同代码）
					//nui.get("contnum").setText(o.purContract[0].outcontnum);
				             	
        		},
        		error: function (jqXHR, textStatus, errorThrown) {
        			alert(jqXHR.responseText);
				    CloseWindow();
        		}
        	});
        }
		
		//赋值
		var inselect = 0;
		function SetData(data){
        	data = nui.clone(data);
        	var settlementid = data.settlementid;
	    	var custid = data.custid;
	    	nui.get("settlementid").setValue(data.settlementid);
	    	
	    	if (data.action == "edit") {
	    		dataaction = "edit";
	    		var json = nui.encode({purSettle:{custid:custid,settlementid:settlementid}});
	    		nui.ajax({
	    			url: "com.primeton.eos.ame_pur.settle.getOutOneOtherPurSettle.biz.ext",
	    			data: json,
	    			type: 'POST',
	    			cache: false,
	    			showModal: false,
	    			contentType: 'text/json',
	    			success: function (o) {
	    				nui.parse();
	    				o = nui.clone(o);
	    				purSettles=o.purSettle;
				       	form.setData(o);
	                	//加载附件设置参数
                		nui.get("grid_0").load({"groupid":"purSettle","relationid": settlementid});
				       	//供应商
						nui.get("custid").setValue(o.purSettle.custid);
				        nui.get("custid").setText(o.purSettle.custname);
				        //采购合同
				        nui.get("purcontid").setValue(o.purSettle.purcontid);
				        nui.get("purcontid").setText(o.purSettle.purcontname);
				        var purcontid = o.purSettle.purcontid;
				        if(settlementid){
				    		var json2 = nui.decode({"criteria": 
						                		  {"_expr[0]": {"_property": "purSupplier.custid","_op": "=","_value": custid}
						                		  ,"_expr[1]": {"_property": "purtype","_op": "in","_value": '1,2,4,5,3'}
						                		  ,"_expr[2]": {"_property": "purcontid","_op": "=","_value": purcontid}}});
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
							});
				    	}else{
				        	var json2 = nui.decode({"criteria": 
						                		  {"_expr[0]": {"_property": "purSupplier.custid","_op": "=","_value": custid}
						                		  ,"_expr[1]": {"_property": "purtype","_op": "in","_value": '1,2,4,5,3'}}});
				        	grid.sortBy("purcontid","asc");
				        	grid.load(json2);
				    	}
				        
				        nui.get("tax").setValue(o.purSettle.tax/0.01);
				        historypay = o.purSettle.setamount;
				 		
				       	document.getElementById("purcontno").innerHTML = o.purSettle.purcontnum;
				       	document.getElementById("projectno").innerHTML = o.purSettle.projectno;
						document.getElementById("contmoney").innerHTML = o.purContract.contmoney;
						
						//凭证年月
						if(o.purSettle.pzyear != null && o.purSettle.pzmonth != null){
							nui.get("pzyear").setValue(o.purSettle.pzyear + "-" + o.purSettle.pzmonth);
							nui.get("pzmonth").setValue(o.purSettle.pzyear + "-" + o.purSettle.pzmonth);
						}else if(o.purSettle.pzyear != null && o.purSettle.pzmonth == null){
							nui.get("pzyear").setText(o.purSettle.pzyear);
						}else if(o.purSettle.pzyear == null && o.purSettle.pzmonth != null){
							nui.get("pzmonth").setText(o.purSettle.pzmonth);
						}
						
						if(o.purContract.projectno != null){
	                		//计提核销信息 根据项目(projectno)筛选计提信息
	                		if(o.purSettle.setstatus != "2") {
	                			var jsonPresettle = nui.decode({purPresettle: {custid:custid,projectno: o.purContract.projectno,iden: "1"}});
	                		}else if (o.purSettle.setstatus == "2"){
		                		var jsonPresettle = nui.decode({purPresettle: {projectno: o.purContract.projectno,settlementid: o.purSettle.settlementid,"iden": "3"}});
		                	}
		                	grid2.load(jsonPresettle)
                			
	                	}
	                	
	                	//结转信息
	                	if(o.purSettle.setstatus != "2") {
	                		nui.get("purOutcostTax").setRequired(false);
        					document.getElementById("field4").style.display="none";
        					noTaxaMount();
	                	} else if (o.purSettle.setstatus == "2"){
		                	nui.get("purOutcostOutcostid").setValue(o.purOutcost.outcostid); 
		                	nui.get("purOutcostOutcosttype").setValue(o.purOutcost.outcosttype); 
		                	nui.get("purOutcostAccruedid").setValue(o.purOutcost.accruedid); 
		                	nui.get("purOutcostAccruedmon").setValue(o.purOutcost.accruedmon);
		                	nui.get("purOutcostOutcoststatus").setValue(o.purOutcost.outcoststatus);
		                	nui.get("taxmon").setValue(o.purOutcost.taxmon);
		                	nui.get("purOutcostTax").setValue(o.purOutcost.tax/0.01);
		                	nui.get("purOutcostNotaxmon").setValue(o.purOutcost.notaxmon);
	                	}
	                	
	                	var workunit = nui.get("workunit").getValue();
						if(workunit!='3'){
							nui.get("workamount").setRequired(true);
						}else{
							nui.get("workamount").setRequired(false);
						}
	                	
						allcontmoney = o.purContract.contmoney;
						
						//根据合同编号，发起逻辑流，算出已支付金额
					    nui.ajax({
					        url: "com.primeton.eos.ame_pur.settle.getOtherPurSettleMoney.biz.ext",
					        data: {purcontid: nui.get("purcontid").getValue()},
					        type: 'POST',
					        cache: false,
					        contentType: 'text/json',
					        success: function (o) {
					            o = nui.clone(o);					
					            if(o.purSettle == null || o.purSettle == ""){
					            	alert("该合同尚未支付过款项！");
					            	return;
					            }			
					            //获取后台计算的总金额
					            document.getElementById("paymoney").innerHTML = o.setamounttotal == null ? "" : o.setamounttotal;
					            
					            allpaymoney = o.setamounttotal;
					        },
					        error: function (jqXHR, textStatus, errorThrown) {
							    alert(jqXHR.responseText);
							    CloseWindow();
					        }
					    });
					    
					    //根据合同编号，发起逻辑流，查找受益部门
						nui.ajax({
							url: "com.primeton.eos.ame_pur.settle.getOtherPurSettleBenefitid.biz.ext",
							data: {projectno: o.purSettle.projectno},
							type: 'POST',
							cache: false,
							contentType: 'text/json',
							success: function (o) {
							    o = nui.clone(o);					
								if(o.rdProject == null || o.rdProject == ""){
									 alert("该合同没有受益部门！");
									 return;
								}
								document.getElementById("benefitid").innerHTML = o.rdProject.orgname == null ? "" : o.rdProject.orgname;
								 //隐藏于隐藏受益部门
								 nui.get("contnum").setValue(o.rdProject.contractid);
							     nui.get("contnum").setText(o.rdProject.contnum);
								 nui.get("benef").setValue(o.rdProject.orgid);
							},
							error: function (jqXHR, textStatus, errorThrown) {
							     alert(jqXHR.responseText);
							     CloseWindow();
					        }
						});
						
						//合同存档编号（取合同表中的外部商务合同代码）
						//nui.get("contnum").setText(o.purContract[0].outcontnum);
				     
					},
	    			error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	    		});
	    	} else if(data.action == "add"){
	    		dataaction = "add";
				var myDate = new Date();
				nui.get("subdate").setValue(myDate);
	    		//新增时、凭证年、凭证月自动取当前年当前月，允许修改
	    		var year = nui.formatDate(new Date(),'yyyy');
	    		var month = nui.formatDate(new Date(),'MM');
	    		nui.get("pzyear").setValue(new Date());
	    		nui.get("pzmonth").setValue(new Date());	
	    		
	    		//默认不冲销，隐藏冲销记录模块
				nui.get("checkSure").setValue(0);
        		nui.get("purOutcostTax").setRequired(false);
        		document.getElementById("field4").style.display="none";
        		//默认设置结算单状态为0-新增
        		nui.get("setstatus").setValue("0");
	    		nui.get("workamount").setRequired(true);
	    	}
        }
 
        //保存
        function SaveData(action){
        	//结转类型
        	var checkSure = nui.get("checkSure").getValue();
        	if(checkSure == "1"){
        		var rows = grid2.getSelecteds();
	    		var sumAccruedmoney = 0;
	    		for(var i = 0;i < rows.length;i ++){
					sumAccruedmoney += rows[i].accruedmoney;
				}
				if(sumAccruedmoney != 0){	//确认计提审核中的计提总金额不为0，成本结转类型为计提冲销
					nui.get("purOutcostOutcosttype").setValue("3");
					var accruedids = "";
					for(var i = 0; i < rows.length; i++){
						if(accruedids == ""){
							accruedids = rows[i].accruedid;
						}else{
							accruedids = accruedids + "," + rows[i].accruedid;
						}
					}
					//计提单编号
					nui.get("purOutcostAccruedid").setValue(accruedids);
				}else{						//确认计提审核中的计提总金额为0，成本结转类型为采购结算
					nui.get("purOutcostOutcosttype").setValue("2");
				}  	
				//计提总金额
				nui.get("purOutcostAccruedmon").setValue(sumAccruedmoney);
				nui.get("purOutcostOutcoststatus").setValue('1');
        	}
        	if(form.validate()){
        		var settlementid = nui.get("settlementid").getValue();
        		var saveURL = "";
        		//如果采购记录已存在,执行修改操作;不存在,执行新增操作
        		if(settlementid){
        			saveURL = updateURL;
        		}else{
        			saveURL = addURL;
        		}
        		
        		var data = form.getData();	
        		//税率
        		data.purSettle.tax = data.purSettle.tax/100;
        		data.checkSure = checkSure;
        		if(checkSure == "1"){
        			data.purOutcost.tax = data.purOutcost.tax/100;
        		}
        		
        		//合同编号
        		data.purSettle.contnum = nui.get("contnum").getText();
    			//采购合同id
              	var rows = grid.getSelecteds();
              	data.purSettle.purcontid = rows[0].purcontid;
        		
        		//计提
        		if(data.purSettle.setstatus == '2')
        		{
        			var rowsPre = grid2.getSelecteds();
	        		data.purSettle.purPresettles = rowsPre;
        		}else{
        			data.purSettle.purPresettles = null;
        		}
        		
        		var pzyear = nui.get("pzyear").getValue();
				var pzmonth = nui.get("pzmonth").getValue();
				if(pzyear){
					pzyear = pzyear.getFullYear();
				}
				if(pzmonth){
					pzmonth = pzmonth.getMonth() + 1;
				}
				data.purSettle.pzyear = pzyear;
				data.purSettle.pzmonth = pzmonth;
				
				//项目信息
	          	var rdProject = grid10.getSelecteds();
	         	data.purSettle.rdProject = rdProject;
        		
        		var json = nui.encode(data);
        		
        		nui.ajax({
        			url: saveURL,
        			data: json,
        			type: 'POST',
        			cache: false,
        			contentType: 'text/json',
        			success: function (text) {
        				form.unmask();
        				var returnJson = nui.decode(text);
        				if (returnJson.exception == null) {
        					nui.alert("保存成功！",null,function(action){
        						CloseWindow("ok");
        					});
        				} else {
        					nui.alert("保存失败","系统提示",function(action){
        						if (action == "ok" || action == "close") {
        							nui.get("sureButton").setEnabled(true);
        						}      						
        					});
        				} 
        			},
        			error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
        		});
        	}else{
        		return;
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
        
        //保存
		function onOk(action){	
			var filePaths = document.getElementsByName("uploadfile").length;
		 		
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
	        	    var pick=0;
					for(var j=0;j<Prjrows.length;j++){
						if(Prjrows[i].settlementno==Prjrows[j].settlementno){
							pick=pick+1;
						}
					}
					if(pick>1){
						nui.alert(Prjrows[i].settlementno+"的结算单编号不能重复！");	
						return;
					}
					pick=0
				}
			}

			if(settlementnohave){
				nui.alert("结算单编号已存在！");
				return;
			}
			
			for(var j=0;j<filePaths;j++){
	        	var a=document.getElementsByName("remarkList")[j].value;
	        	if(a==null||a==""){
	        		alert("新增附件不可以为空！");
	        		return false;
	        	}
	        }
			
			if(form.validate()){
        		nui.confirm("确认保存吗？", "系统提示",
	            function (action) {            
	                if (action == "ok") {
	                	nui.get("sureButton").setEnabled(false);
	    				document.getElementById("fileCatalog").value="purSettle";
	    				form2.submit();
	    			}else{
						return;
					}
				});
	    	}else{
	    		return;
	    	}
		}
		
		//关闭
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
        
        //验证表单开始和截止日期
        function startandend(action){
			var nowdate = new Date();
			var nowyear = nowdate.getFullYear();
			var nowmonth;
			if(nowdate.getMonth() < 9){
				nowmonth = "0" + (nowdate.getMonth() + 1);
			}else{
				nowmonth = nowdate.getMonth() + 1;
			}
			var nowday;
			if(nowdate.getDate() <= 9){
				nowday = "0" + nowdate.getDate();
			}else{
				nowday = nowdate.getDate();
			}
			var now = nowyear + "-" + nowmonth + "-" + nowday;
        	var startdate = nui.get("startdate").getValue();
        	var enddate = nui.get("enddate").getValue();
			if(startdate.substring(0,10) > now){
				nui.alert("开始日期不能大于当前日期");
				return;
			}
			if(enddate.substring(0,10) > now){
				nui.alert("截止日期不能大于当前日期");
				return;
			}
        	if(startdate){
        		if(enddate){
	        		if(startdate > enddate){
	        			if(action == "start"){
	        				nui.alert("开始日期:" + startdate.substring(0,10) + "不能大于截止日期:" + enddate.substring(0,10));
	        				return;
	        			}else if(action == "end"){
	        				nui.alert("截止日期:" + enddate.substring(0,10) + "不能小于开始日期:" + startdate.substring(0,10));
	        				return;
	        			}
	        		}
        		}
        	}
        }
        
        //检查结算单编码是否存在
        function checkSettlementno(){
        	//结算单编码
        	var settlementno = nui.get("settlementno").getValue();
        	var settlementid = nui.get("settlementid").getValue();
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
        
        //  自动计算不含税金额=结算总金额/(1+税率)
        function noTaxaMount(){
        	var oldsetamount = nui.get("setamount").getValue();
        	var setamountmoney = parseFloat(oldsetamount) + parseFloat(allpaymoney)-historypay;//结算加已支付
			if(setamountmoney > allcontmoney){
				
				nui.alert("结算金额大于合同未付款金额！");
				nui.get("setamount").setValue(0);
				return;
			}
        	var oldtax = nui.get("tax").getValue();
        	
        	if(oldsetamount == null || oldsetamount == ""){
        		oldsetamount = 0;
        	}else if(isNaN(oldsetamount)){
        	    nui.alert("请输入数字！");
        	    nui.get("setamount").setValue(0);
        	    return;
        	}
        	
        	if(oldtax == null || oldtax == ""){
        		oldtax = 0;
        	}else if(isNaN(oldtax)){
        	    nui.alert("请输入数字！");
        	    nui.get("tax").setValue(0);
        	    return;
        	}
        	
        	//结算总金额
        	var newsetamount = parseFloat(oldsetamount);
        	//税率
        	var newtax = 1 + parseFloat(oldtax)/100;
        	
        	var notaxmon = (newsetamount / newtax).toFixed(2);
        	nui.get("notaxmon").setValue(notaxmon);
        	if(nui.get("purOutcostTax").getValue() == "" || nui.get("purOutcostTax").getValue() == null || nui.get("purOutcostTax").getValue() == 0 || isNaN(nui.get("purOutcostTax").getValue())){
        		nui.get("purOutcostTax").setValue(oldtax);
        	}
        	if(document.getElementById("sumtotalpre").innerHTML != null && document.getElementById("sumtotalpre").innerHTML != ""){
	        	var taxmon = parseFloat(oldsetamount) - parseFloat(document.getElementById("sumtotalpre").innerHTML);
	        	nui.get("taxmon").setValue(taxmon);
        	}else{
        		nui.get("taxmon").setValue(oldsetamount);
        	}
        	noTaxamounts();
        } 
        
        //自动结算结转不含税
        function noTaxamounts()
        {	
        	var oldsetamounts = nui.get("taxmon").getValue();
        	var oldtaxs = nui.get("purOutcostTax").getValue();
        	if(oldsetamounts == null || oldsetamounts == ""){
        		oldsetamounts = 0;
        	}else if(isNaN(oldsetamounts)){
        	    nui.alert("请输入数字！");
        	    nui.get("taxmon").setValue(0);
        	    return;
        	}
        	
        	if(oldtaxs == null || oldtaxs == ""){
        		oldtaxs = 0;
        	}else if(isNaN(oldtaxs)){
        	    nui.alert("请输入数字！");
        	    nui.get("purOutcostTax").setValue(0);
        	    return;
        	}
        	
        	//结算总金额
        	var newsetamounts = parseFloat(oldsetamounts);
        	//税率
        	var newtaxs = 1 + parseFloat(oldtaxs)/100;
        	
        	var notaxmons = (newsetamounts / newtaxs).toFixed(2);
        	if(notaxmons == null || notaxmons == ""){
        		nui.get("purOutcostNotaxmon").setValue(0);
        	}else{
        		nui.get("purOutcostNotaxmon").setValue(notaxmons);
        	}
        }
        
        //选择行计提
        var allSumPre = 0;
        function onSelectPre(e){
            var setstatus = nui.get("setstatus").getValue();
        	var rows = grid2.getSelecteds();
            if(setstatus != 2){
            	nui.alert("结算单状态为完成情况下可以勾选计提！");
            	for(var i=0;i<rows.length;i++){
					if(rows[i].settlementid != purSettles.settlementid){
						grid2.deselect(rows[i]);
					}
				}
            	return;
            }
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
            noTaxaMount();
        }
        
        //取消选中行计提
        function onDeselectPre(e){
        	var setstatus = nui.get("setstatus").getValue();
        	var rows = grid2.getSelecteds();	
            if(setstatus != 2){
            	nui.alert("结算单状态为完成情况下可以勾选计提！");
            	for(var i=0;i<rows.length;i++){
					if(rows[i].settlementid != purSettles.settlementid){
						grid2.deselect(rows[i]);
					}
				}
            	return;
            }
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
			noTaxaMount();
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
        
        //设置业务字典值-成本归属类型
		function dictGetCostType(e){
			return nui.getDictText('AME_CONTCOSTTYPE',e.value);
		}
		
		//设置业务字典值-计提状态
		function dictGetStatus(e){
			return nui.getDictText('AME_ACCRUEDSTATUS',e.value);
		}
		
		//设置业务字典值-事业部
		function dictGetContOrg(e){
			return nui.getDictText('CONT_ORG',e.value);
		}
		
		//合同状态业务字典
		function contype(e){
			return nui.getDictText('CS_CONTRACTTYPE',e.value);
		}
		
		//采购合同类型业务字典
		function purcontracttype(e){
			return nui.getDictText('AME_CONTYPE',e.value);
		}
		
		//选择结算单状态
		function changesetstatus(){
			var setstatus = nui.get("setstatus").getValue();
			if(setstatus == "0"){
        		var rows = grid2.getSelecteds();
        		if(rows.length>0){
        			nui.get("setstatus").setValue("2");
        			nui.get("checkSure").setValue(1);
	        		nui.get("purOutcostTax").setRequired(true);
	        		document.getElementById("field4").style.display="block";
	        		nui.alert("取消选择的计提，结算单状态才能变为新增！")
        		}else{
					nui.get("checkSure").setValue(0);
	        		nui.get("purOutcostTax").setRequired(false);
	        		document.getElementById("field4").style.display="none";
        		}
			}else if(setstatus == "2"){
				nui.get("checkSure").setValue(1);
        		nui.get("purOutcostTax").setRequired(true);
        		document.getElementById("field4").style.display="block";
			}
		}
		
		//点击是否增加结转记录
		function checkSure(){
			var checkSure = nui.get("checkSure").getValue();
        	if(checkSure == "1"){
        		nui.get("purOutcostTax").setRequired(true);
        	}else{	
        		nui.get("purOutcostTax").setRequired(false);
        	}
		}
		
		//凭证年选择事件
	  	function changepzyear(){
	  		var pzyear = nui.get("pzyear").getValue();
	  		if(pzyear){
		  		var cyear = pzyear.getYear();
		  		var cmonth = pzyear.getMonth() + 1;
		  		if(cmonth < 10){
		  			cmonth = "0" + cmonth;
		  		}else{
	    			cmonth = "" + cmonth;
	    		}
		  		var yearmonth = cyear + "-" + cmonth;
		  		nui.get("pzmonth").setValue(yearmonth);
	  		}
	  	}
	  	//凭证月选择事件
	  	function changepzmonth(){
	  		var pzmonth = nui.get("pzmonth").getValue();
	  		if(pzmonth){
		  		var cyear = pzmonth.getYear();
		  		var cmonth = pzmonth.getMonth() + 1;
		  		if(cmonth < 10){
		  			cmonth = "0" + cmonth;
		  		}else{
	    			cmonth = "" + cmonth;
	    		}
		  		var yearmonth = cyear + "-" + cmonth;
		  		nui.get("pzyear").setValue(yearmonth);
		  	}
	  	}
	  	
	  	//点击采购合同展示对应的项目和销售合同
		function onSelectCont(e){ 
			var a = e.sender;
            var rows=a.getSelected();
            var sum=0;
            if(purSettles){
	            	if(purSettles.contnum == null || purSettles.contnum==""){
	            		nui.get("contnum").setValue("");
						nui.get("contnum").setText("");
	            	}else{
						nui.get("contnum").setText(purSettles.contnum);
		            	var jsonc = nui.encode({"criteria": 
		                            	{"_expr": 
		                            		{"_property": "contnum","_value": purSettles.contnum}}});
	            		nui.ajax({
	            			url: "com.primeton.eos.ame_pur.PurOtherSettlePay.queryContract.biz.ext",
			                data: jsonc,
			                type: 'POST',
			                cache: false,
			                showModal: false,
			                contentType: 'text/json',
			                success: function (x) {
			                	nui.parse();
			                	x = nui.clone(x);
			                	if(x.contracts.length == 0){
			                		nui.get("contnum").setValue("");
									nui.get("contnum").setText("");
			                	}else{
			                		nui.get("contnum").setValue(x.contracts[0].contractid);
			                		nui.get("contnum").setText(x.contracts[0].contnum);
			                	}
			                }
	            		})
	            	}
            }else{
            	if(rows.outcontnum == null || rows.outcontnum == ""){
	        		nui.get("contnum").setValue("");
					nui.get("contnum").setText("");
	            }else{
	            	nui.get("contnum").setText(rows.outcontnum);
	            	var jsonc = nui.encode({"criteria": 
	                            	{"_expr": 
	                            		{"_property": "contnum","_value": rows.outcontnum}}});
            		nui.ajax({
            			url: "com.primeton.eos.ame_pur.PurOtherSettlePay.queryContract.biz.ext",
		                data: jsonc,
		                type: 'POST',
		                cache: false,
		                showModal: false,
		                contentType: 'text/json',
		                success: function (x) {
		                	nui.parse();
		                	x = nui.clone(x);
		                	if(x.contracts.length == 0){
		                		nui.get("contnum").setValue("");
								nui.get("contnum").setText("");
		                	}else{
		                		nui.get("contnum").setValue(x.contracts[0].contractid);
		                		nui.get("contnum").setText(x.contracts[0].contnum);
		                	}
		                }
            		})
	            }
            }
           
            //项目信息
            if(rows.purcontid == null || rows.purcontid == 0){
            	grid10.load(json_p);
            }else{
            	if(purSettles){
	            	var json_p = nui.decode({"criteria": 
						                {"_expr[0]": {"_property": "purcontid","_op": "=","_value": rows.purcontid},
						                "_expr[1]": {"_property": "projectno","_op": "=","_value": purSettles.projectno}}});
            	}else{
            		var json_p = nui.decode({"criteria": 
					                {"_expr[0]": {"_property": "purcontid","_op": "=","_value": rows.purcontid}}});
            	}
            		
                
	            grid10.sortBy("projectno","asc");
	            grid10.load(json_p,function(){
	            	//选择项目
	            	if(purSettles){
	            		grid10.selectAll(false);
		        		var rowsPrj = grid10.getData();
	        			for(var j=0;j<rowsPrj.length;j++){
	        				if(rowsPrj[j].projectno != purSettles.projectno){
	        					if(i==0){
	        						grid10.deselect(rowsPrj[j]);
	        					}
	        				}else{
	        					grid10.select(rowsPrj[j]);
	        					var rowData={prjfee:purSettles.setamount,startdate:purSettles.startdate,enddate:purSettles.enddate,settlementid:purSettles.settlementid,settlementno:purSettles.settlementno};
	        					grid10.updateRow(rowsPrj[j],rowData);
	        					sum = sum+purSettles.setamount;
	        				}
	        			}
		        		document.getElementById("sumtotal").innerHTML = sum;
	    				nui.get("setamount").setValue(sum);
	            	}
	            });
	    		grid2.clearRows();
	    		contractContmoney = rows.contmoney;
				grid_paymentPlan.load({purcontid:rows.purcontid});
            } 
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
					//nui.get("setamount2").setValue(0);
					grid10.updateRow(row,rowData);
					return;
				}
			}
        	
        	//计算结算费用和
        	sumFee = parseFloat(sumFee).toFixed(2);
			document.getElementById("sumtotal").innerHTML = parseFloat(sumFee).toFixed(2);
			nui.get("setamount").setValue(sumFee);
			//nui.get("setamount2").setValue(sumFee);
			
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
        		
    			if(rows[i].projectStatus=="N"){
    				nui.confirm(rows[i].projectName+"的项目状态为结项关闭，不能发起结算流程。","确定要继续吗?",function(action){
						if (action == "ok") {
		                    nui.get("sureButton").setEnabled(true);
		                } else {
		                    nui.get("sureButton").setEnabled(false);
		                }
					});
    			}else{
    				nui.get("sureButton").setEnabled(true);
    			}
    			
    			//生成结算单编号
				var code="";
				var myAjax = new Ajax("com.primeton.eos.ame_pur.settle.creatSettleCode.biz");
				myAjax.submit();
				var code =myAjax.getValue("root/data/settlementno");
				var rowData={settlementno:code};
				grid10.updateRow(rows[i],rowData);
        	}
        	
        	if(rows.length == 0){
        		grid2.clearRows();
        	}else{
        		if(purSettles == null){
        			var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectnos,iden: "1"}});
        			grid2.load(jsonPresettle,function(){
        				grid2.selectAll(false);
        			});
        		}else{
        			if(purSettles.setstatus=='2'){
        			var jsonPresettle = nui.decode({purPresettle: {projectno: projectnos,settlementid:purSettles.settlementid,iden:"3"}});
        			grid2.load(jsonPresettle,function(){
        				grid2.selectAll(false);
        			});
        		}else{
        			var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectnos,iden: "1"}});
        			grid2.load(jsonPresettle,function(){
        				if(purSettles){
        					grid2.selectAll(false);
	        				var rowsPresettle = grid2.getData();
        				}
        			});
        		}
        		}
        	}
        	
        	//计算结算费用和
        	sumFee = parseFloat(sumFee).toFixed(2);
			document.getElementById("sumtotal").innerHTML = parseFloat(sumFee).toFixed(2);
			nui.get("setamount").setValue(sumFee);
			//nui.get("setamount2").setValue(sumFee);
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