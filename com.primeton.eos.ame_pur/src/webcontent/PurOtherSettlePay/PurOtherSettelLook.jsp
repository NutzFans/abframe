<%@page import="com.eos.foundation.eoscommon.ConfigurationUtil"%>
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
  - Author(s): EPCNB324
  - Date: 2016-11-05 15:52:20
  - Description:
-->
<head>
    <title>查看流程业务信息</title>
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
    <%Long processInstID = Long.parseLong(request.getParameter("processInstID")); %>
    <div class="nui-fit">
         <fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
			<legend>本次采购结算信息</legend>
			<div style="padding:5px;">
				<input name="expReiList.expno" id="pettyexpno" class="nui-hidden" style="width:150px"/>
				<!-- 报销单ID -->
				<input name="expReiList.expid" id="expid" class="nui-hidden" style="width:100px" />
				<!-- 报销记录id -->
				<input name="expReiList.expRei.reiid" id="reiid" class="nui-hidden" />
				<input id="custid" class="nui-hidden" />
				<table style="table-layout:fixed;" id="table_file">
				    <tr>
						<td align="right" style="width:120px;">供应商：</td>
						<td id="custname" style="width:250px" ></td>
						<td align="right" style="width:120px;">本次结算金额：</td>
						<td id="setamount2" style="width:220px;">&nbsp  (元)</td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">付款方式：</td>
						<td id="appmode" style="width:200px;"></td>
						<td align="right" style="width:120px;">收款单位：</td>
						<td id="companyname" style="width:250px;"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">银行名称：</td>
						<td id="bankname"  style="width:200px;"></td>
						<td align="right" style="width:120px;">银行账号：</td>
						<td id="bankacct" style="width:250px;"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">联系人：</td>
						<td id="linkman" style="width:200px;"></td>
					    <td align="right" style="width:120px;">联系电话：</td>
						<td id="companytel" style="width:250px;"></td>
					</tr>
					<tr >
						<td align="right" style="width:120px;">解释说明：</td>
						<td colspan="3" id="explain" style="width:700px;height:40px;"></td>
					</tr>
					<tr>
						<td style="width:120px;height:auto;" align="right">纸质凭证送递人：</td>
	                    <td id="checkid" style="width:240px;">
	                    </td>
	                    <td align="right" style="width:120px;">成本归属类型：</td>
						<td id="costtype" style="width:250px;"></td>
					</tr>
					<span>
					<tr>
						<td align="right" style="width:120px;">报销单：</td>
						<td id="projectid2" style="width:250px" colspan="3"></td>
					</tr>
					</span>
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
					<div field="projectName" width="auto" align="center" headerAlign="center" allowSort="false" >项目名称</div>
					<div field="purmoney" headerAlign="center" allowSort="false" visible="true" width="55" align="right">采购金额</div>
					<div field="wzfje" headerAlign="center" allowSort="false" visible="true" width="70" align="right">未支付金额</div>
					<div field="prjfee" width="80" dataType="currency" align="right" headerAlign="center" allowSort="false" cellCls="myIndex">
						项目结算费用
					</div>
					<div field="startdate" headerAlign="center" allowSort="true" width="78" align="center" visible="true" dateFormat="yyyy-MM-dd" cellCls="myIndex">结算开始日期
					</div>
		            <div field="enddate" headerAlign="center" allowSort="true" width="78" align="center" visible="true" dateFormat="yyyy-MM-dd" cellCls="myIndex">结算结束日期
		            </div>
					<div field="contnum" width="80" align="center" headerAlign="center" allowSort="false" visible="true">销售合同编号</div>
					<div field="contract.projectname" width="100" align="center" headerAlign="center" allowSort="false" visible="true">销售合同名称</div>	
					<div field="contract.contsum" headerAlign="center" allowSort="false" visible="true" width="60" align="right">合同金额</div>
					<div field="contract.pay" headerAlign="center" allowSort="false" visible="true" width="80" align="right">已收款合同额</div>
					<div field="contract.paycount" headerAlign="center" allowSort="false" visible="true" width="60" numberFormat="p" align="right">收款比例</div>
					<div field="settlementno" width="105" align="right" headerAlign="center" allowSort="false" visible="false">
						结算单编号
					</div>
				</div>
			</div>
			<div style="width: 100%;height:24px;float:left;">
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width: 750px;">结算费用总计：</td>
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
			     onselect="onSelectPre" ondeselect="onDeselectPre" 
			     onlyCheckSelection="true" allowSortColumn="false">
			     <div property="columns">
					 <div field="accruedid" headerAlign="center" allowSort="true" align="center" visible="true" width="55">计提编号</div>
		             <div field="custid" headerAlign="center" allowSort="true" width="60" visible="false">供应商编号</div>
		             <div field="custname" headerAlign="center" allowSort="true" visible="false">供应商名称</div>
		             <div field="suppliersname" width="70" headerAlign="center" allowSort="true" >供应商简称</div>
		             <div field="projectno" width="70" headerAlign="center" allowSort="true" visible="true">项目代码</div>
		             <div field="projectname" width="auto" headerAlign="center" allowSort="true" visible="true">项目名称</div>
		             <div field="salesid" headerAlign="center" allowSort="true" visible="false" >所属销售ID</div>
		             <div field="orgname" headerAlign="center" allowSort="true" width="70" align="center" >受益部门</div>
		             <div field="syb" headerAlign="center" allowSort="true" width="100" renderer="dictGetContOrg" >所属事业部</div>
		             <div field="contnum" headerAlign="center" allowSort="true" visible="false">销售合同</div>
		             <div field="startdate" headerAlign="center" allowSort="true" width="80" align="center" visible="true" dateFormat="yyyy-MM-dd">开始日期</div>
		             <div field="enddate" headerAlign="center" allowSort="true" width="80" align="center" visible="true" dateFormat="yyyy-MM-dd">结束日期</div>
		             <div field="accrueddate" headerAlign="center" allowSort="true" width="80" align="center" dateFormat="yyyy-MM-dd">计提时间</div>
		             <div field="accruedmoney" headerAlign="center" allowSort="true" width="80" align="right" dataType="currency" >计提金额</div>
		             <div field="costtype" headerAlign="center" allowSort="true" renderer="dictGetCostType" width="60" align="center" >成本类型</div>
		             <%--<div field="outper" headerAlign="center" allowSort="true" width="200" >相关外包人员</div>--%>
		             <div field="accruedstatus" headerAlign="center" allowSort="true" renderer="dictGetStatus" width="120" align="center" >状态</div>
		             <div field="settlementid" headerAlign="center" allowSort="true" visible="fales" >结算单编号</div>
		             <div field="comment" width="auto" headerAlign="center" allowSort="true" visible="fales">备注</div>
			     </div>
	        </div>
	        <div style="width:300px;height:25px;margin-left:385px;float:left;">
			    <table style="table-layout:fixed;">
				   <tr>
					  <td align="right" style="width:140px;;">计提核销总计：</td>
					  <td id="sumtotalpre" style="width:115px;" align="right" ></td>
				   </tr>
			    </table>
			</div>
	     </fieldset>
	   
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
	     <fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
			<legend>送递信息</legend>
				<table>
				    <tr>
						<td align="right" style="width:120px">送递人：</td>
						<td id="postorname" style="width:250px"></td>
						<td align="right" style="width:225px">送递方式：</td>
						<td id="postway" style="width:200px"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">收件人：</td>
						<td colspan="3" id="receivername" style="width:250px"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">送递内容：</td>
						<td colspan="3" id="postcontent" style="width:250px">
						</td>
					</tr>
				</table>
		</fieldset>
	     <fieldset id="field4" style="border:solid 1px #aaa;padding:3px;width: 920px;">
			<legend>其他结算附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</fieldset>
		<!-- 审核意见  -->
		<div style="width: 927px;">
		<jsp:include page="/ame_common/misOpinion.jsp"/>
		</div>
    </div>
    <script type="text/javascript">
    nui.parse();
    var grid = nui.get("datagrid");
    var grid2 = nui.get("datagrid2");
    var grid10 = nui.get("datagrid10");
	var ticketgrid = nui.get("ticketgrid");//采购合同发票
	var historypay=0;
    var purSettles;
  	var projectidlist="";
	var settlementidList="";
	var grid_paymentPlan = nui.get("paymentPlanGrid");
    
    init();
	function init(){
	    document.getElementById("opinionHide").style.display="none";
	    var data = {processInstID: <%=processInstID %>,workItemID: "0",goSettleStep: "leaderApprove"};
	    
		
		var json=nui.encode(data);
		nui.ajax({
			url:"com.primeton.eos.ame_pur.PurOtherSettlePay.getOtherGoSettlePay1.biz.ext",
			type:"post",
			data:json,
			contentType:"text/json",
			success:function (o){
				o = nui.clone(o);
				purSettles = o.purSettles;
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
					//报销单号
					/* if(html==""){
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
				//加载结算附件设置参数
            	nui.get("grid_0").load({"groupid":"purSettle","relationid":settlementidList});
	    		document.getElementById("setamount2").innerHTML = historypay;
	    		nui.get("custid").setValue(o.purSettles[0].custid);
				document.getElementById("custname").innerHTML = o.purSettles[0].custname == null ?"":o.purSettles[0].custname;
				document.getElementById("costtype").innerHTML = o.purSettles[0].costtype == null ?"":nui.getDictText("AME_CONTCOSTTYPE",o.purSettles[0].costtype) ;
				//document.getElementById("projectno").innerHTML = projectnos == null ?"":projectnos;
				document.getElementById("checkid").innerHTML = o.purSettles[0].user.name == null ?"":o.purSettles[0].user.name;
				
				nui.get("reiid").setValue(o.purSettles[0].expReiList.expRei.reiid);
				nui.get("expid").setValue(o.purSettles[0].expReiList.expid);
				document.getElementById("appmode").innerHTML = o.purSettles[0].expReiList.expRei.paymode == null ?"":nui.getDictText("EXP_PAYMODE",o.purSettles[0].expReiList.expRei.paymode);
				document.getElementById("companyname").innerHTML = o.purSettles[0].expReiList.expRei.companyname == null ?"":o.purSettles[0].expReiList.expRei.companyname;
				document.getElementById("bankname").innerHTML = o.purSettles[0].expReiList.expRei.bankname == null ?"":o.purSettles[0].expReiList.expRei.bankname;
				document.getElementById("bankacct").innerHTML = o.purSettles[0].expReiList.expRei.bankacct == null ?"":o.purSettles[0].expReiList.expRei.bankacct;
				
				document.getElementById("linkman").innerHTML = o.purSettles[0].purSupplier.linkman == null ?"":o.purSettles[0].purSupplier.linkman;
				
				document.getElementById("companytel").innerHTML = o.purSettles[0].expReiList.expRei.companytel == null ?"":o.purSettles[0].expReiList.expRei.companytel;
				document.getElementById("explain").innerHTML = o.purSettles[0].expReiList.explain == null ?"":o.purSettles[0].expReiList.explain;
				
				html="<a href='#' onclick='javascript: doView();' >" + o.purSettles[0].pettyexpno + "</a>";
				document.getElementById("projectid2").innerHTML = html;
				nui.get("pettyexpno").setValue(o.purSettles[0].expReiList.expno);
				
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
	        	//送递人信息
	        	document.getElementById("postorname").innerHTML = o.amePostservice.postorname == null ?"":o.amePostservice.postorname;
	        	document.getElementById("postway").innerHTML = o.amePostservice.postway == null ?"":nui.getDictText("AME_POSTWAY",o.amePostservice.postway);
	        	document.getElementById("postcontent").innerHTML = o.amePostservice.postcontent == null ?"":o.amePostservice.postcontent;
	        	document.getElementById("receivername").innerHTML = o.amePostservice.receivername == null ?"":o.amePostservice.receivername;

	            //查询审核意见
				var grid1 = nui.get("datagrid1");
				grid1.load({processInstID: <%=processInstID %>});
				grid1.sortBy("time", "desc");
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
	        					var rowData={prjfee:purSettles[i].setamount,startdate:purSettles[i].startdate,enddate:purSettles[i].enddate,settlementid:purSettles[i].settlementid,settlementno:purSettles[i].settlementno};
	        					grid10.updateRow(rowsPrj[j],rowData);
	        					sum = sum+purSettles[i].setamount;
	        				}
	        			}
	        		}
	        		document.getElementById("sumtotal").innerHTML = sum;
    				document.getElementById("setamount2").innerHTML = sum;
            	}
            });
    		grid2.clearRows();
        } 
    }
    
    //查看报销单信息
	function doView(){
		var reiid = nui.get("reiid").getValue();
		var executeUrl = "<%= request.getContextPath() %>/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + reiid;
		window.open(executeUrl);
	}
	
	//采购合同类型业务字典
	function purcontracttype(e){
		return nui.getDictText('AME_CONTYPE',e.value);
	}
	
	//合同状态业务字典
	function contype(e){
		return nui.getDictText('AME_ORDERSTATUS',e.value);
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
        	
        	//计算结算费用和
        	sumFee = parseFloat(sumFee).toFixed(2);
			document.getElementById("sumtotal").innerHTML = parseFloat(sumFee).toFixed(2);
			nui.get("setamount").setValue(sumFee);
			nui.get("setamount2").setValue(sumFee);
			
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
        		var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectnos,iden:'3'},settlementid:settlementidList});
        		grid2.load(jsonPresettle,function(){
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
	            });
        	}
        	
        	//计算结算费用和
        	sumFee = parseFloat(sumFee).toFixed(2);
			document.getElementById("sumtotal").innerHTML = parseFloat(sumFee).toFixed(2);
			document.getElementById("setamount2").innerHTML = sumFee;
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