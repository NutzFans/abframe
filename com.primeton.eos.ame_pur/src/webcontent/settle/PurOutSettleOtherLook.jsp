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
  - Author(s): chiayang
  - Date: 2016-09-18 09:04:35
  - Description:
-->
<head>
	<title>查看非外包采购结算</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
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
				<input name="purSettle.processinstid" id="processinstid" class="nui-hidden" />
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">供应商：</td>
							<td id="custid"></td>
							<td align="right" style="width:120px;">采购合同：</td>
							<td id="purcontid"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">合同额：</td>
							<td id="contmoney"></td>
							<td align="right" style="width:120px;">已支付金额：</td>
							<td id="paymoney"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">对应项目编号：</td>
							<td id="projectno"></td>
							<td align="right" style="width:120px;">采购合同编号：</td>
							<td id="purcontno"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">受益部门：</td>
							<td id="benefitid"></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>非外包采购结算基本信息</legend>
				<input name="purSettle.settlementid" id="settlementid" class="nui-hidden"/>
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:130px;">结算单编号：</td>
							<td id="settlementno"></td>
							<td align="right" style="width:130px;">结算单状态：</td>
							<td id="setstatus"></td>
							<td align="right" style="width:180px;">财务对应销售合同编号：</td>
							<td id="contnum"></td>
						</tr>
						<tr>
							<td align="right" style="width:130px;">结算总金额：</td>
							<td id="setamount"></td>
							<td align="right" style="width:130px;">税率：</td>
							<td id="tax"></td>
							<td align="right" style="width:180px;">不含税金额：</td>
							<td id="notaxmon"></td>
						</tr>
						<tr>
							<td align="right" style="width:130px;">结算申请日期：</td>
							<td id="subdate"></td>						
							<td align="right" style="width:130px;">成本确认日期：</td>
							<td id="confirmdate"></td>		
							<td align="right" style="width:180px;">付款日期：</td>
							<td id="paydate" ></td>
						</tr>			
						<tr>
							<td align="right" style="width:130px;">凭证号：</td>
							<td id="pzhs"></td>
							<td align="right" style="width:130px;">凭证年：</td>
							<td id="pzyear"></td>
							<td align="right" style="width:180px;">凭证月：</td>
							<td id="pzmonth"></td>
						</tr>
						<tr>
							<td align="right" style="width:130px;">工作量单位：</td>
							<td id="workunit"></td>
							<td align="right" style="width:130px;">工作量数量：</td>
							<td colspan="3" id="workamount"></td>
						</tr>
						<tr>
							<td align="right" style="width:130px;">备注说明：</td>
							<td colspan="5" id="comment"></td>
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
						 <div field="accruedid" headerAlign="center" allowSort="true" visible="true">计提编号</div>
			             <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商编号</div>
			             <div field="custname" headerAlign="center" allowSort="true" visible="false">供应商名称</div>
			             <div field="suppliersname" width="80" headerAlign="center" allowSort="true" >供应商简称</div>
			             <div field="projectno" headerAlign="center" allowSort="true" visible="false">项目代码</div>
			             <div field="projectname" headerAlign="center" allowSort="true" visible="false">项目名称</div>
			             <div field="salesid" headerAlign="center" allowSort="true" visible="false" >所属销售ID</div>
			             <div field="orgname" headerAlign="center" allowSort="true" width="70" align="center">受益部门</div>
			             <div field="syb" headerAlign="center" allowSort="true" width="100" renderer="dictGetContOrg">所属事业部</div>
			             <div field="contnum" headerAlign="center" allowSort="true" visible="false">销售合同</div>
			             <div field="startdate" headerAlign="center" allowSort="true" width="80" align="center" visible="false">开始日期</div>
			             <div field="enddate" headerAlign="center" allowSort="true" width="80" align="center" visible="false">结束日期</div>
			             <div field="accrueddate" headerAlign="center" allowSort="true" width="80" align="center" dateFormat="yyyy-MM-dd hh:mm:ss" >计提时间</div>
			             <div field="accruedmoney" headerAlign="center" allowSort="true" width="120" align="right" dataType="currency">计提金额</div>
			             <div field="notaxmoney" headerAlign="center" allowSort="true" width="120" align="right" dataType="currency">不含税金额</div>
			             <div field="costtype" headerAlign="center" allowSort="true" renderer="dictGetCostType" width="70" align="center" >成本类型</div>
			             <%--<div field="outper" headerAlign="center" allowSort="true" width="200" >相关外包人员</div>--%>
			             <div field="accruedstatus" headerAlign="center" allowSort="true" renderer="dictGetStatus" width="120" align="center" >状态</div>
			             <div field="settlementid" headerAlign="center" allowSort="true" visible="fales" >结算单编号</div>
			             <div field="comment" width="auto" headerAlign="center" allowSort="true" >备注</div>
				     </div>
		        </div>
		        <div style="width:300px;height:25px;margin-left:215px;float:left; display:none;">
				    <table style="table-layout:fixed;">
					   <tr>
						  <td align="right" style="width:140px;">计提核销总计：</td>
						  <td id="sumtotalpre" style="width:110px" align="right" ></td>
					   </tr>
				    </table>
				</div>
		     </fieldset>
		     <fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		     	<legend>结转明细</legend>
		     	<div style="padding:5px;">
			     	<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:130px;">结转金额：</td>
							<td id="taxmon"></td>
							<td align="right" style="width:130px;">结转税率：</td>
							<td id="purOutcostTax"></td>
							<td align="right" style="width:180px;">结转不含税金额：</td>
							<td id="purOutcostNotaxmon"></td>
						</tr>
					</table>
				</div>
		     </fieldset>
	 	</form>
	 	<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>非外包采购结算附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</fieldset>
	 </div>
	 <div style="text-align:center;padding:10px;" class="nui-toolbar">
	 	<a class="nui-button" onclick="doViewSettle" id="viewSettle" style="width:100px;">查看流程图</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	<script type="text/javascript">
		nui.parse();	
		var form = new nui.Form("form1");
		var grid2 = nui.get("datagrid2");
		var grid_paymentPlan = nui.get("paymentPlanGrid");
		
		function getUrlParam(name){
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		}
	
		var settlementid = getUrlParam("settlementid");
		var custid = getUrlParam("custid") == "null" ? "" : getUrlParam("custid");
		var projectno = getUrlParam("projectno");
		
		init();
		
		function init(){
			var json = nui.encode({purSettle:{settlementid: settlementid}});
			nui.ajax({
				url: "com.primeton.eos.ame_pur.settle.queryOutOtherPurSettleLook.biz.ext",
				data: json,
				type: 'POST',
				cache: false,
				showModal: false,
				contentType: 'text/json',
				success: function (o) {
					nui.parse();
					o = nui.clone(o);
					//加载附件设置参数
                	nui.get("grid_0").load({"groupid":"purSettle","relationid": settlementid});
					
					form.setData(o.purSettle);
					document.getElementById("custid").innerHTML = o.purSettle.custname == null ? "" : o.purSettle.custname;
					document.getElementById("purcontid").innerHTML = o.purSettle.purcontname == null ? "" : o.purSettle.purcontname;
					document.getElementById("purcontno").innerHTML = o.purSettle.purcontnum == null ? "" : o.purSettle.purcontnum;
					document.getElementById("projectno").innerHTML = o.purSettle.projectno == null ? "" : o.purSettle.projectno;
					document.getElementById("contmoney").innerHTML = o.purSettle.contmoney == null ? "" : o.purSettle.contmoney;
					document.getElementById("benefitid").innerHTML = o.purSettle.orgname == null ? "" : o.purSettle.orgname;	
					
					
					document.getElementById("settlementno").innerHTML = o.purSettle.settlementno == null ? "" : o.purSettle.settlementno;
					document.getElementById("setstatus").innerHTML = o.purSettle.setstatus == null ? "" : nui.getDictText('AME_SETSTATUS',o.purSettle.setstatus);
					document.getElementById("contnum").innerHTML = o.purSettle.contnum == null ? "" : o.purSettle.contnum;
					
					document.getElementById("setamount").innerHTML = o.purSettle.setamount == null ? "" : o.purSettle.setamount;
					document.getElementById("tax").innerHTML = o.purSettle.tax == null ? "%" : o.purSettle.tax/0.01+'%';
					document.getElementById("notaxmon").innerHTML = o.purSettle.notaxmon == null ? "" : o.purSettle.notaxmon;
					
					document.getElementById("subdate").innerHTML = o.purSettle.subdate == null ? "" : o.purSettle.subdate;
					document.getElementById("paydate").innerHTML = o.purSettle.paydate == null ? "" : o.purSettle.paydate;
					document.getElementById("confirmdate").innerHTML = o.purSettle.confirmdate == null ? "" : o.purSettle.confirmdate;
					
					document.getElementById("pzhs").innerHTML = o.purSettle.pzhs == null ? "" : o.purSettle.pzhs;
					document.getElementById("pzyear").innerHTML = o.purSettle.pzyear == null ? "" : o.purSettle.pzyear;
					document.getElementById("pzmonth").innerHTML = o.purSettle.pzmonth == null ? "" : o.purSettle.pzmonth;
					
					document.getElementById("workunit").innerHTML = o.purSettle.workunit == null ? "" : nui.getDictText('SERV_NUM_TYPE',o.purSettle.workunit);
					document.getElementById("workamount").innerHTML = o.purSettle.workamount == null ? "" : o.purSettle.workamount;
					
					document.getElementById("comment").innerHTML = o.purSettle.comment == null ? "" : o.purSettle.comment;
					
					//结转信息
					document.getElementById("taxmon").innerHTML = o.purOutcost.taxmon == null ? "" : o.purOutcost.taxmon;
					document.getElementById("purOutcostTax").innerHTML = o.purOutcost.tax == null ? "%" : o.purOutcost.tax/0.01+'%';
					document.getElementById("purOutcostNotaxmon").innerHTML = o.purOutcost.notaxmon == null ? "" : o.purOutcost.notaxmon;
					
					var processinstid = o.purSettle.processinstid;
					if(processinstid == null || processinstid == ""){
	                	document.getElementById("viewSettle").style.display = "none";
	                }else{
	                	nui.get("processinstid").setValue(o.purSettle.processinstid);
	                }
					//计提核销信息 根据项目(projectno)筛选计提信息
					if(o.purSettle.projectno != null){
						var jsonPresettle = nui.decode({purPresettle: {projectno: o.purSettle.projectno,settlementid: o.purSettle.settlementid,"iden": "3"}});
	                	grid2.load(jsonPresettle,function(){
	                		grid2.selectAll(false);
	                		var rowsPresettle = grid2.getSelecteds();
	                		for(var i = 0;i < rowsPresettle.length;i++){
	                			if(!rowsPresettle[i].settlementid){
	                				grid2.deselect(rowsPresettle[i]);
	                			}
	                		}
            			})
					}
				
					//根据合同编号，发起逻辑流，算出已支付金额
					nui.ajax({
						url: "com.primeton.eos.ame_pur.settle.getOtherPurSettleMoney.biz.ext",
					    data: {purcontid: o.purSettle.purcontid},
					    type: 'POST',
					    cache: false,
					    contentType: 'text/json',
					    success: function (o) {
					       o = nui.clone(o);					
					       if(o.purSettle == null || o.purSettle == ""){
					           	return;
					       }			
					       //获取后台计算的总金额
					       document.getElementById("paymoney").innerHTML = o.setamounttotal == null ? "" : o.setamounttotal;
					 	},
					    error: function (jqXHR, textStatus, errorThrown) {
							alert(jqXHR.responseText);
							CloseWindow();
					    }
					});
					//采购付款计划查询
					contractContmoney = o.purSettle.contmoney;
					grid_paymentPlan.load({purcontid:  o.purSettle.purcontid});
				},
				error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                } 
			});
		}
	 	
	    function CloseWindow(action) {            
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
		
		function onCancel(e) {
            CloseWindow("cancel");
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
		
		function doViewSettle(){
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