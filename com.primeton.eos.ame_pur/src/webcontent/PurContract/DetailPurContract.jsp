<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>采购合同详细信息</title>
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
<div id="tabs1" class="nui-tabs" activeIndex="0" style="width:auto;height:100%">
	<div title="合同信息">
	<div id="custname">&nbsp;</div>
		 	<form id="form1" method="post" >
		        <input name="purContract.purSupplier.custid" id="custid1" class="nui-hidden" />
		        <input name="purContract.purSupplier.istaxpayer" id="istaxpayer" class="nui-hidden" />
		        <input name="purContract.purcontid" id="purcontid" class="nui-hidden" />
		        <input name="purContract.processinstid" id="processinstid" class="nui-hidden" />
		        <fieldset style="border:solid 1px #aaa;padding:3px;">
		            <legend>采购合同详细信息</legend>
		            	<table style="table-layout:fixed;" id="table_file">
					            <tr>
<!-- 									<td align="right" style="width:150px">供应商名称：</td> -->
<!-- 									<td id="purContract.purSupplier.custname" style="width:250px"></td> -->
									<td align="right" style="width:150px">采购合同编号：</td>
									<td id="purContract.purcontnum" style="width:250px"></td>
									<td align="right" style="width:150px">合同名称：</td>
									<td id="purContract.purcontname"   style="width:250px"></td>
									<td align="right" style="width:150px">签订日期：</td>
									<td id="purContract.signdate" style="width:250px"></td>
								</tr>
								<tr>
									<td align="right" style="width:150px">采购合同类型：</td>
									<td id="purContract.purtype"style="width:250px"></td>
									<td align="right" style="width:150px">合同金额：</td>
									<td id="purContract.contmoney" style="width:250px"></td>
									<td align="right" style="width:150px">合同状态：</td>
									<td id="purContract.purstatus" style="width:250px"></td>
								</tr>
								<tr>
									<td align="right" style="width:150px">我方经办人：</td>
									<td id="purContract.ouroper" style="width:250px"></td>
									<td align="right" style="width:150px">有效开始日期：</td>
									<td id="purContract.startdate"  style="width:250px"></td>
									<td align="right" style="width:150px">有效截止日期：</td>
									<td id="purContract.enddate"  style="width:250px"></td>
								</tr>
								<tr>
									<td align="right" style="width:150px">合同联系人：</td>
									<td id="purContract.liankman"  style="width:250px"></td>
									<td align="right" style="width:150px">联系电话：</td>
									<td id="purContract.linktel" style="width:250px"></td>
									<td align="right" style="width:150px">电子邮件：</td>
									<td id="purContract.linkemail" style="width:250px"></td>
								</tr>
								<tr>
									<!-- <td align="right" style="width:150px">成本类型：</td>
									<td id="purContract.costtype" style="width:250px"></td> -->
									<td align="right" style="width:150px">销售合同编号：</td>
									<td id="purContract.outcontnum"  style="width:250px"></td>
									<td align="right" style="width:150px">成本类型：</td>
									<td id="purContract.costtype" style="width:250px"></td>
								</tr>
								<tr>
									<td align="right" style="width:150px">合同关键内容信息：</td>
									<td colspan="5" id="purContract.contKeyinfo" style="width:900px"></td>
								</tr><!-- 
								<tr>
									<td align="right" style="width:150px">其他说明：</td>
									<td colspan="5" id="purContract.comment" ></td>
								</tr> -->
		            	</table>
		        </fieldset>
		        <jsp:include page="/ame_common/detailFile.jsp"/>
	        </form>
	</div>
	<div title="订单信息">
	<div id="custname1">&nbsp;</div>
	    <fieldset style="border:solid 1px #aaa;padding:3px;">
		    <legend>采购订单详细信息</legend>
			<div id="datagrid_order" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true"
			 showPager="false" idField="appid" multiSelect="true"  onselectionchanged="changePurOrder">
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
					<div field="purorderid" width="0" align="center" headerAlign="center">采购订单编号</div>		
					<div field="purordernum" width="100" align="center" headerAlign="center" >采购订单编码</div>
					<div field="signdate" width="75" align="center" headerAlign="center">签订日期</div>	
					<div field="purstatus" width="70" align="center" headerAlign="center" renderer="dictorderstatus">状态</div>				
					<div field="custjc"width="100" align="center" headerAlign="center">服务客户</div>
					<div field="projectName"width="200" align="center" headerAlign="center">所属项目</div>
					<div field="empname" width="80" align="center"  headerAlign="center">协议签订人员</div>
					<div field="calcycle" width="120" align="center" headerAlign="center">结算周期说明</div>				
					<div renderer="detailPurorder" width="50" align="center"  headerAlign="center">操作</div>
				</div>
			</div>
		</fieldset>
		<fieldset style="border:solid 1px #aaa;padding:3px;" id="showOutper">
	        <legend>人员列表</legend>
	        <div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                    	相关人员
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>
			<div id="grid_outper" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="purOrderOutpers" 
		    	url="com.primeton.eos.ame_pur.purContractProcess.queryOutperByOrder.biz.ext"  
		    	idField="appid" multiSelect="true" allowAlternating="true" showPager="false">
				<div property="columns">
					<div field="purOutperson.outperno" align="center" headerAlign="center" allowSort="true" visible="false">人员编号</div>
					<div field="purOutperson.outpername" width="50" align="center" headerAlign="center" renderer="detailOutper">姓名</div>	
					<div field="purOutperson.outpercartno" width="140" align="center" headerAlign="center">身份证</div>	
					<div field="purOutperson.degree" width="50" align="center" headerAlign="center" renderer="dictDegree">学历</div>	
					<div field="purOutperson.gradudate" width="80" align="center" headerAlign="center">毕业时间</div>	
					<div field="workunit" width="90" align="center" headerAlign="center" allowSort="true" renderer="dictOutperType">工作量计量单位</div>	
					<div field="price" width="70" align="center"  headerAlign="center" allowSort="true" numberFormat="n2">人月单价(元)</div>	
					<div field="startdate" width="90" align="center" headerAlign="center" allowSort="true">服务开始日期</div>	
					<div field="expenddate" width="90" align="center" headerAlign="center" allowSort="true">预计服务结束日期</div>
					<div field="actenddate" width="90" align="center" headerAlign="center" allowSort="true">实际服务结束日期</div>
					<div field="custjc" width="100" align="center" headerAlign="center" >当前服务客户</div>
					<div field="projectName" width="190" align="center" headerAlign="center" >当前服务项目</div>	
<!-- 					<div field="pcprotype" width="90" align="center" headerAlign="center" renderer="onFileRendererway">电脑提供方式</div>	 -->
<!-- 					<div field="comment" width="90" align="center" headerAlign="center">说明</div>	 -->
					<div field="currentstatus" width="60" align="center" headerAlign="center" renderer="dictOutperStatus">状态</div>	
				</div>
			</div>
		</fieldset>
	</div>
	<div title="结算/计提">
	    <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>采购合同对应项目列表</legend>
	        <div id="grid_purProjCont" class="nui-datagrid" style="width:100%;height:auto;" allowResize="false" dataField="purProjConts" oncellendedit="calMoney"
			 url="com.primeton.eos.ame_pur.PurContract.queryPurProjContByPurcontid.biz.ext" allowCellEdit="false" showPager="false" showSummaryRow="true" ondrawsummarycell="drawPurProjContSum">
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
					<div type="projectid" visible="false"></div>
					<div field="projectno" displayField="projectName" width="250" headerAlign="center">项目名称</div>
					<div field="projectno" width="120" align="center" headerAlign="center" renderer="">项目编号</div>
					<div field="contnum" width="120" align="center" headerAlign="center" renderer="">销售合同编号</div>
					<div field="custjc" width="140" align="center" headerAlign="center" >所属客户</div>
					<div field="orgname" width="75" align="center" headerAlign="center">受益销售</div>	
					<div field="purmoney"  width="120" headerAlign="center" align="right" summaryType="sum" numberFormat="n2">采购金额</div>
					<div field="wzfje" width="120" align="right" headerAlign="center" summaryType="sum" numberFormat="n2">未支付金额</div>
					<div field="status"  width="100" headerAlign="center" align="center" renderer="dictPurProjContStatus">状态</div>
					<div field="comment"  width="auto" headerAlign="center" align="center">备注说明</div>
					<div name="action" width="110" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
				</div>
			</div>
		</fieldset>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>采购付款计划列表</legend>
			<div id="paymentPlanGrid" class="nui-datagrid" style="width:100%;height:auto;" allowResize="false" dataField="plans" showSummaryRow="true"
		 	url="com.primeton.eos.ame_pur.purPaymentPlan.paymentPlanQueryByContract.biz.ext"  allowCellEdit="false" showPager="false" multiSelect="true" ondrawsummarycell="drawPaymentPlanSum">
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
					<div field="payCount" width="80" align="center" headerAlign="center" >付款次数</div>	
					<div field="expectedAmount" width="100" align="center"  headerAlign="center" currencyUnit="￥" dataType="currency" numberFormat="n2" summaryType="sum">付款金额</div>
					<div field="percentage" width="80" align="center"  headerAlign="center" summaryType="sum" renderer="percentageRenderer">付款比例</div>
					<div field="expectedDate" width="100" align="center"  headerAlign="center" dataType="date" dateFormat="yyyy-MM" renderer="onDealDate">预计付款年月</div>
		            <div field="evidence" width="140" align="center" headerAlign="center" >付款依据</div>
					<div field="nodeRemark" width="280" align="center"  headerAlign="center" >付款节点备注</div>
				</div>
			</div>
		</fieldset>
	    <fieldset style="border:solid 1px #aaa;padding:3px;width: 1770px;">
		    <legend>结算记录信息</legend>
			<div style="width:100%;height:auto;" showToolbar="false" showFooter="false" >
		        <div id="grid_settle" class="nui-datagrid" dataField="purSettles" style="width:100%;height: auto;" 
		        	url="com.primeton.eos.ame_pur.settle.queryPursettleList.biz.ext" 
		        	pageSize="10" showPageInfo="true" multiSelect="true" showSummaryRow="true" ondrawsummarycell="drawPurProjContSum">
		            <div property="columns">
		                <div field="processinstid" headerAlign="center" allowSort="true" visible="false">流程实例ID</div>
		                <div field="settlementno" width="100" headerAlign="center" allowSort="true">结算单编号</div>
		                <div field="benefitid" headerAlign="center" allowSort="true" visible="false">受益部门id</div>
		                <div field="orgname" width="60" align="center" headerAlign="center" allowSort="true" renderer="getDetail">受益部门</div>
		                <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商ID</div>
		                <div field="setamount" width="100" align="right" headerAlign="center" allowSort="true" summaryType="sum" numberFormat="n2">结算总金额(元)</div>
		                <div field="notaxmon" width="125" align="right" headerAlign="center" allowSort="true" summaryType="sum" numberFormat="n2">结算不含税总金额(元)</div>
		                <div field="costtype" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictGetCostType">成本归属类型</div>
		                <div field="startdate" width="80" align="center" headerAlign="center" allowSort="true">结算开始日期</div>
		                <div field="enddate" width="80" align="center" headerAlign="center" allowSort="true">结算截止日期</div>
		                <div field="setstatus" width="70" align="center" headerAlign="center" allowSort="true" renderer="dictGetStatus">结算单状态</div>
		                <div field="pettyexpno" headerAlign="center" allowSort="true" visible="false">报销单编号</div>
		                <div field="custno" headerAlign="center" allowSort="true" visible="false">客户代码</div>
		                <div field="custnamemis" width="200" headerAlign="center" allowSort="true">客户名称</div>
		                <div field="projectno" width="110" headerAlign="center" allowSort="true" visible="true">项目编号</div>
		                <div field="projectName" width="210" headerAlign="center" allowSort="true">项目名称</div>
		                <div field="purorderid" headerAlign="center" allowSort="true" visible="false">采购订单编号</div>
		                <div field="purordernum" width="150" headerAlign="center" allowSort="true">采购订单编码</div>
		                <div field="workunit" width="70" align="center" headerAlign="center" allowSort="true" renderer="dictGetServ">工作量单位</div>
		                <div field="workamount" width="70" align="right" headerAlign="center" allowSort="true">工作量数量</div>
		                <div field="subdate" width="80" align="center" headerAlign="center" allowSort="true" style="width:100px;">结算提交日期</div>
		                <div field="confper" width="80" headerAlign="center" allowSort="true">结算单确认人</div>
		                <div field="comment" width="auto" headerAlign="center" allowSort="true">备注</div>
		            </div>
		        </div>
			</div>
		</fieldset>
		<fieldset style="border:solid 1px #aaa;padding:3px;width: 1770px;">
		    <legend>计提记录信息</legend>
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		        <table style="width:100%;">
		            <tr>
		                <td style="width:100%;">
		                    <a id="updatepre" class="nui-button" iconCls="icon-edit" onclick="editpre()">编辑</a>
		                    <a class="nui-button" iconCls="icon-remove" onclick="removepre()">删除</a>
		                </td>
		            </tr>
		        </table>
		    </div>
	        <div id="grid_preSettle" class="nui-datagrid" dataField="purpresettles" style="width:100%;height: auto;" 
	        	url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleList.biz.ext" 
	        	pageSize="10" showPageInfo="true" multiSelect="true" idField="custid" 
	        	onselectionchanged="selectionChangedpre" showSummaryRow="true" ondrawsummarycell="drawPurProjContSum">
	            <div property="columns">
	                <div type="checkcolumn" width="30"></div>
	                <div field="accruedid" width="70" align="center" headerAlign="center" allowSort="true" renderer="getPreDetail">计提编号</div>
	                <div field="syb" headerAlign="center" allowSort="true" renderer="dictGetContOrg" >所属事业部</div>
	                <div field="orgname" width="60" align="center" headerAlign="center" allowSort="true" >所属销售</div>
	                <div field="suppliersname" width="70" headerAlign="center" allowSort="true" visible="false" >供应商简称</div>
	                <div field="accruedmoney" width="90" headerAlign="center" align="right"  allowSort="true" summaryType="sum" numberFormat="n2">计提金额(元)</div>
	                <div field="notaxmoney" width="120" align="right" headerAlign="center" allowSort="true" summaryType="sum" numberFormat="n2">计提不含税金额(元)</div>
	                <div field="costtype" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictGetCostType">成本归属类型</div>
	                <div field="startdate" width="80" align="center" headerAlign="center" allowSort="true" >计提开始日期</div>
	                <div field="enddate" width="80" align="center" headerAlign="center" allowSort="true" >计提结束日期</div>
	                <div field="accruedstatus" width="70" align="center" headerAlign="center" allowSort="true" renderer="dictGetAccruedStatus" >计提状态</div>
	                <div field="custname1" width="200" headerAlign="center" allowSort="true" >客户名称</div>
	                <div field="projectno" width="110" headerAlign="center" allowSort="true" >项目编号</div>
	                <div field="projectname" width="210" headerAlign="center" allowSort="true" >项目名称</div>
	                <div field="contnum" headerAlign="center" allowSort="true" >销售合同编号</div>
	                <div field="outper" width="160" headerAlign="center" allowSort="true" >相关外包人员</div>
	                <div field="settlementno" width="120" headerAlign="center" allowSort="true" >结算单编号</div>
	                <div field="settlementid" headerAlign="center" allowSort="true" visible="false" >结算单ID</div>
	                <div field="accrueddate" width="auto" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd">计提时间</div>
	            </div>
	        </div>
		</fieldset>
		<fieldset style="border:solid 1px #aaa;padding:3px;width: 100%;" id="expdetail">
		    <legend>费用明细</legend>
	        <div id="grid_ExpDetail" class="nui-datagrid" style="width:100%;height: auto;" 
	        	showSummaryRow="true" ondrawsummarycell="drawExpSum" showPager="false">
	            <div property="columns">
	                <div field="reiid" width="90" align="center" headerAlign="center" renderer="getExpReiList">报销记录编号</div>
	                <div field="expno" width="110" align="center" headerAlign="center" >报销单号</div>
	                <div field="empname" width="50" align="center" headerAlign="center" >报销人</div>
	                <div field="expstatus" width="100" align="center" headerAlign="center" renderer="dictGetStatus1">报销状态</div>
	                <div field="orgname" width="180" align="center" headerAlign="center" >受益部门/区域</div>
	                <div field="total" width="90" align="right" headerAlign="center"  summaryType="sum" numberFormat="n2">填报金额</div>
	                <div field="confamt" width="90" align="right" headerAlign="center"  summaryType="sum" numberFormat="n2">确认金额</div>
	                <div field="tbdate" width="140" align="center" headerAlign="center"  dateFormat="yyyy-MM-dd">填报日期</div>
	                <div field="finmon" width="90" align="right" headerAlign="center"   summaryType="sum" numberFormat="n2">明细费用</div>
	                <div field="findate" width="80" align="center" headerAlign="center" dateFormat="yyyy-MM-dd">明细费用日期</div>
	            </div>
	        </div>
		</fieldset>
		<fieldset id="field24" style="border:solid 1px #aaa;padding:3px;display: none;">
			<legend>采购合同的已有发票列表</legend>
			<div id="ticketgrid" class="nui-datagrid" style="width:100%;height:auto;"  dataField="purTickets" showSummaryRow="true" ondrawsummarycell="doCountNowPage"
			url="com.primeton.eos.ame_pur.purTicket.queryPurTickets.biz.ext"  showPager="false" >
				<div property="columns">
					<div field="ticnum" width="60" align="center"  headerAlign="center"allowSort="true" renderer="getTicketDetail">发票号</div>
					<div field="ticdate" width="50" align="center" headerAlign="center"allowSort="true">开票日期</div>
					<div field="ticmon" width="70" align="right" headerAlign="center" dataType="currency" summaryType="sum" allowSort="true">发票金额</div>
					<div field="ticrate" width="30" align="right" headerAlign="center" dataType="currency" allowSort="true" numberFormat="p0">税率</div>
					<div field="tictax" width="50" align="right" headerAlign="center" dataType="currency" summaryType="sum" allowSort="true">税金</div>
					<div field="ticmonnet" width="70" align="right" headerAlign="center" dataType="currency" summaryType="sum" allowSort="true">不含税金额</div>
					<div field="ticcontent" width="150" align="left" headerAlign="center" allowSort="true">开票内容</div>
					<div field="reamrk" width="150" align="left" headerAlign="center" allowSort="true">备注</div>
				</div>
			</div>
		</fieldset>
	</div>
</div>
</div>
<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
	<a class="nui-button" onclick="doViewProc" id="viewProc" style="width:100px;">查看流程图</a>
	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div> 
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");
	var grid_purProjCont = nui.get("grid_purProjCont");
	var grid_ExpDetail = nui.get("grid_ExpDetail");
	var grid_settle = nui.get("grid_settle");
	var grid_preSettle = nui.get("grid_preSettle");
	var grid_paymentPlan = nui.get("paymentPlanGrid");
	var ticketgrid = nui.get("ticketgrid");//采购合同发票
	//需要传到结算计提tab页新增计提的数据。供应商ID、供应商名称。
	var custid = "";
	var custname = "";
	var istaxpayer = "";
	
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		Map attr = user.getAttributes();
		DataObject[] roles = (DataObject[])attr.get("roles");
		boolean isOutUser = false;
		for(int i=0;i < roles.length;i++){
			if(roles[i].getString("roleid").equals("primetongeneral")){
				isOutUser = true;
			}
		}
		if(isOutUser == true){
	%>
		nui.get("tabs1").removeTab(2);
	<%	} %>
	var purcontid = getUrlParam("id");
	
	setData(purcontid);
	function getUrlParam(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) 
		return unescape(r[2]); 
		return null; 
	} 
	
	function dictGetStatus1(e){
		return nui.getDictText('EXP_CHECKFLAG',e.value);
	}
	
	function getExpReiList(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='checkExpNo("+ e.value +");' title='点击查看'>" + e.value + "</a>";
    	}
    }
    function checkExpNo(reiid){
		var executeUrl = "/default/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + reiid;
		window.open(executeUrl);
    }

	
	function doViewProc(){
		var processInstID = nui.get("processinstid").getValue();
		var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
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
    function setData(purcontid){ 
    	document.getElementById("showOutper").style.display="none"; 
    	var json = nui.encode({purContract:{purcontid: purcontid}});
    	nui.ajax({
            url: "com.primeton.eos.ame_pur.PurContract.getPurContractDetail.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
           		nui.get("grid_0").load({"groupid":"purContract","relationid":o.purContract.purcontid});
            	obj = nui.decode(o);
                form.setData(obj);
                form.setChanged(false);
                //需要传到结算计提tab页新增计提的数据。供应商ID、供应商名称和是否纳税人。
                custid = o.purContract.purSupplier.custid;
                custname = o.purContract.purSupplier.custname;
                istaxpayer = o.purContract.purSupplier.istaxpayer;
                document.getElementById("custname").innerText=o.purContract.purSupplier.custname;
                document.getElementById("custname1").innerText=o.purContract.purSupplier.custname;
                nui.get("custid1").setValue(o.purContract.purSupplier.custid);
                //供应商是否一般纳税人
                nui.get("istaxpayer").setValue(o.purContract.purSupplier.istaxpayer);
                nui.get("purcontid").setValue(o.purContract.purcontid);
                if(o.purContract.processinstid == null || o.purContract.processinstid == ""){
                	document.getElementById("viewProc").style.display = "none";
                }else{
                	nui.get("processinstid").setValue(o.purContract.processinstid);
                }
                document.getElementById("purContract.purcontnum").innerHTML = o.purContract.purcontnum == null ?"":o.purContract.purcontnum;
                document.getElementById("purContract.purcontname").innerHTML = o.purContract.purcontname == null ?"":o.purContract.purcontname;
                document.getElementById("purContract.signdate").innerHTML = o.purContract.signdate == null ?"":o.purContract.signdate;
                document.getElementById("purContract.purtype").innerHTML = nui.getDictText('AME_CONTYPE',o.purContract.purtype);
                document.getElementById("purContract.contmoney").innerHTML = o.purContract.contmoney == null ?"":o.purContract.contmoney;
                contmoney = o.purContract.contmoney == null ?"":o.purContract.contmoney;
                document.getElementById("purContract.contKeyinfo").innerHTML = o.purContract.contKeyinfo == null ?"":o.purContract.contKeyinfo;
                document.getElementById("purContract.purstatus").innerHTML = nui.getDictText('AME_ORDERSTATUS',o.purContract.purstatus);
                document.getElementById("purContract.startdate").innerHTML = o.purContract.startdate == null ?"":o.purContract.startdate;
                document.getElementById("purContract.enddate").innerHTML = o.purContract.enddate == null ?"":o.purContract.enddate;
                document.getElementById("purContract.liankman").innerHTML = o.purContract.liankman == null ?"":o.purContract.liankman;
                document.getElementById("purContract.linktel").innerHTML = o.purContract.linktel == null ?"":o.purContract.linktel;
                document.getElementById("purContract.linkemail").innerHTML = o.purContract.linkemail == null ?"":o.purContract.linkemail;
                document.getElementById("purContract.ouroper").innerHTML = o.purContract.ouroper == null ?"":o.purContract.ouroper;
                //document.getElementById("purContract.contnum").innerHTML = o.purContract.contnum == null ?"":o.purContract.contnum;
                document.getElementById("purContract.outcontnum").innerHTML = o.purContract.outcontnum == null ?"":o.purContract.outcontnum;
                //document.getElementById("purContract.comment").innerHTML = o.purContract.comment == null ?"":o.purContract.comment;
                document.getElementById("purContract.costtype").innerHTML = nui.getDictText('AME_CONTCOSTTYPE',o.purContract.costtype);
                nui.get("datagrid_order").setData(o.purContract.purOrders);
                //项目合同关系列表查询
                grid_purProjCont.load({purcontid:o.purContract.purcontid});
                //采购付款计划查询
                grid_paymentPlan.load({purcontid:o.purContract.purcontid})
                //加载结算信息--通过采购合同编号
		        var jsonsettle = {"iden": "4","purcontnum": o.purContract.purcontid};
		        grid_settle.load(jsonsettle);
		        grid_settle.sortBy("subdate","desc");
		        //加载计提信息
		        var jsonpre = {"iden": "4","purcontnum": o.purContract.purcontid};
		        grid_preSettle.load(jsonpre);
		        grid_preSettle.sortBy("accrueddate","desc");
				//采购发票
				var json_t = nui.decode({"criteria": {"_expr[0]": {"_property": "purcontid","_op": "=","_value": o.purContract.purcontid},"_expr[1]": {"_property": "state","_op": "=","_value": "1"}},"b": "true"});
				ticketgrid.sortBy("ticdate","desc");
				ticketgrid.load(json_t,function(){
					var tickets = ticketgrid.getData();
					if(tickets.length==null||tickets==null||tickets.length==0){
						document.getElementById("field24").style.display="none";
					}else{
						document.getElementById("field24").style.display="";
					}
				});
		        //费用明细数据
		        var expdetails = o.purContract.expdetails
		        if(expdetails!=null&&expdetails.length>0){
		        	document.getElementById("expdetail").style.display = "";
		        	grid_ExpDetail.setData(expdetails);
		        }else{
		        	document.getElementById("expdetail").style.display = "none";
		        }
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
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow();
        else window.close();  
    }
	   
    function checkDetail(){
    	var grid = nui.get("grid_0");
    	var selectRow = grid.getSelected();
    	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
		window.open(url, '_self');
    }
    
    
	    function getpurOrderDetail(){
	    	var datagrid_order = nui.get("datagrid_order");
	 		var selectRow = datagrid_order.getSelected();
			var executeUrl = "/default/ame_pur/PurOrder/DetailPurOrder.jsp?id=" + selectRow.purorderid;
			nui.open({
	            url: executeUrl,
	            title: "订单详细信息",
	            width: 850,
		        height: 550,
	            onload: function () {},
	            ondestroy: function (action) {}
	        });
	    }
    
    function getOutperDetail(){
    	var grid_outper = nui.get("grid_outper");
 		var selectRow = grid_outper.getSelected();
		var executeUrl = "/default/ame_pur/outperson/PurOutpersonLook.jsp?id=" + selectRow.purOutperson.outperno;
		nui.open({
            url: executeUrl,
            title: "外包人员详细信息",
            width: 1000,
	        height: 550,
            onload: function () {},
            ondestroy: function (action) {}
        });
    }
    //点击弹出的订单信息展示相应外包人员
    function changePurOrder(){
    	var datagrid_order = nui.get("datagrid_order");
 		var selectRow = datagrid_order.getSelected();
		document.getElementById("showOutper").style.display="";
		//外包人员
		var grid_outper = nui.get("grid_outper");
		grid_outper.load({purOrder:{purorderid:selectRow.purorderid}});
		grid_outper.sortBy("purOutperson.outperno", "desc");
    }
    
    //点击查看订单信息
    function detailPurorder(){
    	return "<a href='javascript:void(0)' onclick='getpurOrderDetail();' title='点击查看'>查看</a>";
    }
    
    function getdetail(e){
    	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    }
	
	function drawPurProjContSum(e){
		if (e.field == "purmoney"||e.field == "wzfje"||e.field=="setamount"||e.field=="notaxmon"||e.field=="accruedmoney"||e.field=="notaxmoney") {
            e.cellHtml = "<div align='right'><b>" + nui.formatNumber(e.cellHtml,'n') + "</b></div>";
        }
	}
	
	function drawExpSum(e){
		if (e.field == "finmon"||e.field == "confamt"||e.field=="total") {
            e.cellHtml = "<div align='right'><b>" + nui.formatNumber(e.cellHtml,'n') + "</b></div>";
        }
	}
    
    //外包人员状态
    function dictOutperStatus(e){
		return nui.getDictText('AME_OUTPERSTATUS',e.value);
	}
	//电脑提供方式
	function onFileRendererway(e){
		return nui.getDictText('AME_PCPROTYPE',e.value);//设置业务字典值
	}
	//人员订单关系表，计算单位
	function dictOutperType(e){
		return nui.getDictText('SERV_NUM_TYPE',e.value);//设置业务字典值
	}
	
	//学历
	function dictDegree(e) {
		return nui.getDictText('DEGREE',e.value);
	}
	
	function dictorderstatus(e) {
		return nui.getDictText('AME_ORDERSTATUS',e.value);//设置业务字典值
	}
	//点击姓名查看详情
	function detailOutper(e){
    	return "<a href='javascript:void(0)' onclick='getOutperDetail();' title='点击查看'>"+ e.value + "</a>";
    }
	//成本归属类型
	function dictGetCostType(e){
		return nui.getDictText('AME_CONTCOSTTYPE',e.value);
	}
	//设置业务字典值-结算单状态
	function dictGetStatus(e){
		return nui.getDictText('AME_SETSTATUS',e.value);
	}
	//设置业务字典值-工作量单位
	function dictGetServ(e){
		return nui.getDictText('SERV_NUM_TYPE',e.value);
	}
	//设置业务字典值-事业部
	function dictGetContOrg(e){
		return nui.getDictText('CONT_ORG',e.value);
	}
	//设置业务字典值-计提状态
	function dictGetAccruedStatus(e){
		return nui.getDictText('AME_ACCRUEDSTATUS',e.value);
	}
	//点击查看详情
    function getPreDetail(e){
        return "<a href='javascript:void(0)' onclick='checkPreDetail();' title='点击查看' >" + e.value + "</a>";
    }
    function checkPreDetail(){
 		var selectRow = grid_preSettle.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/ame_pur/outaccrued/PurOutPreSettleLook.jsp?accruedid=" + selectRow.accruedid;
		window.open(executeUrl, "查看计提信息", "fullscreen=1");
    }
    
    //-------------------------------------------------新增计提开始------------------------------------------------
    function onActionRenderer(e) {
        var grid = e.sender;
        var record = e.record;
        var uid = record._uid;
        var rowIndex = e.rowIndex;
        var s = null;
        s = ' <a class="Edit_Button" href="javascript: editRow(\'' + uid + '\')" >新增计提</a>' ;
        return s;
    }
    
    var chooseRow = "";
    function editRow(row_uid) {
    	//成本确认日期为空，设置为当天。
        var row = grid_purProjCont.getRowByUID(row_uid);
        if (row) {
        	nui.open({
                url: "<%=request.getContextPath() %>/ame_pur/outaccrued/PurOtherOutAccruedInput.jsp",
                title: "新增非人力外包计提信息", 
                width: 850, 
                height: 560,
                onload: function () {//弹出页面加载完成
	                var iframe = this.getIFrameEl();
	                row.purSupplierCustid = custid;
	                row.purSupplierCustname = custname;
	                row.istaxpayer = istaxpayer;
	                var data = {action:"DetailPurContractAdd",datarow: row};//传入页面的json数据
	                iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {//弹出页面关闭前
                	if(action == "ok"){
	                    grid_preSettle.reload();
                	}
                }
            });
        }
    }
    
    //-------------------------------------------------新增计提结束------------------------------------------------
    //当选择列时
    function selectionChangedpre(){
        var rows = grid_preSettle.getSelecteds();
        if(rows.length>1){
            nui.get("updatepre").disable();
        }else{
            nui.get("updatepre").enable();
        }
    }
    
    //编辑
	function editpre() {
	    var row = grid_preSettle.getSelected();
	    if (row) {
	        nui.open({
	            url: "<%=request.getContextPath() %>/ame_pur/outaccrued/PurOutAccruedInput.jsp",
                title: "编辑外包计提信息",
                width: 850,
                height: 420,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = {action:"edit",accruedid:row.accruedid};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    grid_preSettle.reload();
                }
            });
        } else {
            nui.alert("请选中一条记录","提示");
        }
    }

    //删除
    function removepre(){
        var rows = grid_preSettle.getSelecteds();
        //对于状态已经“确认计提”和“核销”的计提不允许删除
        if(rows.length > 0){
        	for(var i = 0; i < rows.length; i++){
        		if(rows[i].accruedstatus == "1" || rows[i].accruedstatus == "2"){
        			nui.alert("计提状态为" + nui.getDictText('AME_ACCRUEDSTATUS', rows[i].accruedstatus) + "！不能删除！");
		            return;
        		}
        	}
            nui.confirm("确定删除选中的计提信息？","删除计提信息提示",
            function(action){
                if(action=="ok"){
                    var json = nui.encode({purpresettles:rows});
                    grid_preSettle.loading("正在删除中,请稍等...");
                    $.ajax({
                        url:"com.primeton.eos.ame_pur.outaccrued.deletePurPresettles.biz.ext",
                        type:'POST',
                        data:json,
                        cache: false,
                        contentType:'text/json',
                        success:function(text){
                            var returnJson = nui.decode(text);
                            if(returnJson.exception == null){
                                grid_preSettle.reload();
                                nui.alert("删除成功", "系统提示", function(action){
                                });
                            }else{
                                grid_preSettle.unmask();
                                nui.alert("删除失败", "系统提示");
                            }
                        }
                    });
                }
            });
        }else{
            nui.alert("请选中一条记录！");
        }
    }
    function dictPurProjContStatus(e){
    	return nui.getDictText('AME_PROJCONTSTATUS',e.value);
    }
    var paymentPlanSum = 0;
    var contmoney = "";
	function drawPaymentPlanSum(e){
		if (e.field == "expectedAmount") {
			var html = nui.formatNumber(e.value,"n");
            e.cellHtml = "<div align='right'><b>" + html + "</b></div>";
            paymentPlanSum = (Math.round(e.value*100)/100);  
        } 
        if (e.field == "percentage") {
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
		}
	}
</script>
</html>