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
  - Author(s): zyl
  - Date: 2016-06-07 14:31:34
  - Description:
-->
<head>
	<title>查看结算</title>
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
	<div class="nui-fit">
		<form id="form1" method="post">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>外包结算基本信息</legend>
				<input id="isApp" class="nui-hidden"/>
				<input name="purSettle.settlementid" id="settlementid" class="nui-hidden"/>
				<input name="purSettle.fileids" id="fileids" class="nui-hidden"/>
				<input name="purSettle.processinstid" id="processinstid" class="nui-hidden" />
				<!-- 供应商简称 -->
				<input name="purSettle.suppliersname" id="suppliersname" class="nui-hidden" />
				<input id="cscontractid" class="nui-hidden"/>
				<input id="contractidFince" class="nui-hidden"/>
				<input name="purSettle.reiid" id="reiid" class="nui-hidden" />
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">供应商：</td>
							<td id="custid" style="width:200px"></td>
							<td align="right" style="width:120px;">客户：</td>
							<td id="custno" style="width:250px;"></td>
							<td align="right" style="width:120px;">项目：</td>
							<td id="projectno" style="width:200px"></td>
							<td align="right" style="width:120px;">受益部门：</td>
							<td id="benefitid" style="width:100px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">开始日期：</td>
							<td id="startdate" style="width:100px"></td>
							<td align="right" style="width:120px;">截止日期：</td>
							<td id="enddate" style="width:100px"></td>
							<td align="right" style="width:120px;">工作量单位：</td>
							<td id="workunit" style="width:50px"></td>
							<td align="right" style="width:120px;">工作量数量：</td>
							<td id="workamount" style="width:100px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">付款日期：</td>
							<td id="paydate" style="width:100px"></td>
							<td align="right" style="width:120px;">凭证号：</td>
							<td id="pzhs" style="width:100px"></td>
							<td align="right" style="width:120px;">凭证年：</td>
							<td id="pzyear" style="width:100px"></td>
							<td align="right" style="width:120px;">凭证月：</td>
							<td id="pzmonth" style="width:100px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">税率：</td>
							<td id="tax" style="width:100px"></td>
							<td align="right" style="width:120px;">不含税金额（元）：</td>
							<td id="notaxmon" style="width:100px"></td>
							<td align="right" style="width:120px;">成本确认日期：</td>
							<td id="confirmdate" style="width:100px"></td>
							<td align="right" style="width:120px;">成本类型：</td>
							<td id="costtype" style="width:100px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">成本说明：</td>
							<td id="costmemo" style="width:100px"></td>
							<td align="right" style="width:120px;">结算单编号：</td>
							<td id="settlementno" style="width:100px"></td>
							<td align="right" style="width:120px;">工作量技术确认人：</td>
							<td id="confper" style="width:150px"></td>
							<td align="right" style="width:120px;">状态：</td>
							<td id="setstatus" style="width:100px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">报销单：</td>
							<td id="projectid2" style="width:100px"></td>
							<td align="right" style="width:120px;">项目对应合同：</td>
							<td id="cscontnum" style="width:140px"></td>
							<td align="right" style="width:120px;">财务对应合同：</td>
							<td id="contnum" style="width:140px"></td>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">备注：</td>
							<td colspan="7" id="comment" style="width:440px"></td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>外包人员信息</legend>
				<div id="datagrid" class="nui-datagrid" dataField="purSettleList" style="width:100%;height:auto;" 
			    	url="com.primeton.eos.ame_pur.outperson.queryOutSettleLookPerson.biz.ext" multiSelect="true" 
			    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" allowSortColumn="false"
			    	onlyCheckSelection="true" onselect="onSelect" showSummaryRow="true" ondrawsummarycell="drawMonths" >
					<div property="columns">
						<div field="outpername"width="90" align="center" headerAlign="center" allowSort="true" >姓名</div>	
						<div field="setstartdate" width="80" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">结算开始日期</div>
						<div field="setenddate" width="80" align="center" headerAlign="center" allowSort="true">结算截止日期</div>
						<div field="days" width="80" align="center" headerAlign="center" allowSort="true">工作日统计</div>
						<div field="months" width="50" align="center" headerAlign="center" allowSort="true">人月数</div>
						<div field="price" width="80" dataType="currency" align="right" headerAlign="center" allowSort="true" summaryType="sum">人月单价</div>
						<div field="setfee" width="80" dataType="currency" align="right" headerAlign="center" allowSort="true">工时结算费用</div>
						<div field="othfee" width="80" dataType="currency" align="right" headerAlign="center" allowSort="true">其他费用</div>
						<div field="totalfee" dataType="currency" width="90" align="right" headerAlign="center" allowSort="true">结算费用小计</div>
						<div field="score" width="50" align="center" headerAlign="center" allowSort="true">打分</div>
						<div field="evaluate" width="auto" align="center" headerAlign="center" allowSort="true">评价</div>
						<div field="purordernum" width="135" align="center" headerAlign="center" allowSort="true">订单编号</div>
						<div field="purstatus" width="65" renderer="dictGetOrderStatus" align="center" headerAlign="center" allowSort="true">订单状态</div>
					</div>
				</div>
				<div style="width:800px;height:55px;margin-left:110px;float:left;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:135px;">总计：</td>
							<td id="daystotal" style="width:76px;" align="center"></td>
							<td id="monthstotal" style="width:46px;" align="center"></td>
							<td align="right" style="width:235px;">结算费用总计：</td>
							<td id="sumtotal" style="width:86px;" align="right"></td>
						</tr>
						<tr>
							<td colspan="3"></td>
							<td align="right" style="width:235px;">结算最终总金额：</td>
							<td id="setamount" style="width: 88px;" align="right"></td>
						</tr>
					</table>
				</div>
			</fieldset>
			
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
				<legend>计提核销信息</legend>
				<div id="datagrid2" class="nui-datagrid" dataField="purPresettles" style="width:100%;height:auto;" 
			    	url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleListToSettle.biz.ext" multiSelect="true"
			    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" 
			    	onlyCheckSelection="true" allowSortColumn="false" showSummaryRow="true"  ondrawsummarycell="drawMonths">
					<div property="columns">
						<div field="accruedid" width="50" headerAlign="center" allowSort="true" visible="true">计提编号</div>
		                <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商编号</div>
		                <div field="custname" headerAlign="center" allowSort="true" visible="false">供应商名称</div>
		                <div field="suppliersname" width="80" headerAlign="center" allowSort="true" >供应商简称</div>
		                <div field="projectno" headerAlign="center" allowSort="true" visible="false">项目代码</div>
		                <div field="projectname" headerAlign="center" allowSort="true" visible="false">项目名称</div>
		                <div field="salesid" headerAlign="center" allowSort="true" visible="false" >所属销售ID</div>
		                <div field="orgname" headerAlign="center" allowSort="true" width="70" align="center" >所属销售</div>
		                <div field="syb" headerAlign="center" allowSort="true" width="100" renderer="dictGetContOrg" >所属事业部</div>
		                <div field="contnum" headerAlign="center" allowSort="true" visible="true">销售合同</div>
		                <div field="workunit" width="70" align="center" headerAlign="center" allowSort="true" renderer="dictGetWorkunit">工作量单位</div>
	                	<div field="workamount" width="70" align="center" headerAlign="center" allowSort="true" summaryType="sum" >工作量数量</div>
		                <div field="startdate" headerAlign="center" allowSort="true" width="80" align="center" >开始日期</div>
		                <div field="enddate" headerAlign="center" allowSort="true" width="80" align="center" >结束日期</div>
		                <div field="accrueddate" headerAlign="center" allowSort="true" width="125" align="center" dateFormat="yyyy-MM-dd hh:mm:ss" >计提时间</div>
		                <div field="costtype" headerAlign="center" allowSort="true" renderer="dictGetCostType" width="60" align="center" >成本类型</div>
		                <div field="accruedmoney" headerAlign="center" allowSort="true" width="90" align="right" dataType="currency" summaryType="sum">计提金额</div>
		                <div field="notaxmoney" headerAlign="center" allowSort="true" width="90" align="right" dataType="currency" summaryType="sum">不含税金额</div>
		                <div field="outper" headerAlign="center" allowSort="true" width="230" >相关外包人员</div>
		                <div field="accruedstatus" headerAlign="center" allowSort="true" renderer="dictGetStatus" width="120" align="center" >状态</div>
		                <div field="settlementid" headerAlign="center" allowSort="true" visible="false" >结算单编号</div>
		                <div field="comment" width="auto" headerAlign="center" allowSort="true" >备注</div>
					</div>
				</div>
			</fieldset>
			
			<fieldset id="field6" style="border: solid 1px #aaa;padding: 3px;">
				<legend>结转明细</legend>
				<div>
					<table style="table-layout:fixed;" id="table_file2">
						<tr>
							<td align="right" style="width:140px;">成本结转金额(含税)：</td>
							<td id="purOutcostTaxmon"></td>
							<td align="right" style="width:100px;">税率：</td>
							<td id="purOutcostTax"></td>
							<td align="right" style="width:200px;">成本结转金额(不含税)：</td>
							<td id="purOutcostNotaxmon"></td>
						</tr>
						<tr>
							<td align="right" style="width:140px;">工作量单位：</td>
							<td id="purOutcostWorkunit"></td>
							<td align="right" style="width:140px;">工作量数量：</td>
							<td id="purOutcostWorkamount"></td>
							<td align="right" style="width:140px;">单价：</td>
							<td id="purOutcostUnitPrice"></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
		<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
			<legend>外包结算附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</fieldset>
	</div>
	<div style="text-align:center;padding:10px; class="nui-toolbar">
		<%--<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;margin-right:20px;" id="sureButton">确定</a>
		--%>
		<a class="nui-button" onclick="doViewSettle" id="viewSettle" style="width:100px;">查看流程图</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>

	<script type="text/javascript">
		nui.parse();
	  	var form = new nui.Form("form1");
	  	var grid = nui.get("datagrid");
	  	var grid2 = nui.get("datagrid2");
	  	var dosuminit = 0;
	  	var doSumfeezongji = 0;
	  	
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
	  	
	  	function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		}
		var settlementid = getUrlParam("settlementid");
		var projectno = getUrlParam("projectno");
		var custid = getUrlParam("custid");
		var custno = getUrlParam("custno");
		
		//查看报销单信息
		function doView(){
			var reiid = nui.get("reiid").getValue();
			var executeUrl = "<%= request.getContextPath() %>/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + reiid;
			window.open(executeUrl);
		}
		
		//查看项目对应合同
		function doViewCsContract(){
			var cscontractid = nui.get("cscontractid").getValue();
			window.open("<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid="+cscontractid,"csContractView","height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
		}
		//查看财务对应合同
		function doViewContract(){
			var cscontractid = nui.get("contractidFince").getValue();
			window.open("<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid="+cscontractid,"csContractViewFince","height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
		}
		
        init();
        
        function init(){
        	nui.get("grid_0").load({"groupid": "purSettle","relationid": settlementid});
        	//com.primeton.eos.ame_pur.outperson.queryOutSettleLook
        	var json = nui.encode({purSettle: {settlementid: settlementid,projectno: projectno,custid: custid,custno: custno}});
        	nui.ajax({
        		url: "com.primeton.eos.ame_pur.outperson.queryOutSettleLook.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                showModal: false,
                contentType: 'text/json',
                success: function (o) {
                	nui.parse();
                	o = nui.clone(o);
                	var processinstid = o.purSettle.processinstid;
                	/* var orgid = o.purSettle.orgid;
					var orgname = o.purSettle.orgname; */
                    form.setData(o.purSettle);
                    form.isChanged(false);
					if(processinstid == null || processinstid == ""){
	                	document.getElementById("viewSettle").style.display = "none";
	                }else{
	                	nui.get("processinstid").setValue(o.purSettle.processinstid);
	                }
	                nui.get("reiid").setValue(o.purSettle.reiid);
	                if(o.purSettle.pettyexpno){
	                	document.getElementById("projectid2").innerHTML = "<a href='#' onclick='javascript: doView();' >" + o.purSettle.pettyexpno + "</a>";
	                }else{
	                	document.getElementById("projectid2").innerHTML = "无报销单";
	                }
	                if(o.purSettle.cscontractid){
	                	nui.get("cscontractid").setValue(o.purSettle.cscontractid);
						if(o.purSettle.cscontnum){
							document.getElementById("cscontnum").innerHTML = "<a href='#' onclick='javascript: doViewCsContract();' >" + o.purSettle.cscontnum + "</a>";
						}else{
							document.getElementById("cscontnum").innerHTML = "<a href='#' onclick='javascript: doViewCsContract();' >" + o.purSettle.cscontractid + "</a>";
						}
					}else{
						document.getElementById("cscontnum").innerHTML = "无项目对应合同";
					}
					//财务对应合同
					if(o.purSettle.contractidFince){
						nui.get("contractidFince").setValue(o.purSettle.contractidFince);
					}
					if(o.purSettle.contnum){
						document.getElementById("contnum").innerHTML = "<a href='#' onclick='javascript: doViewContract();' >" + o.purSettle.contnum + "</a>";
					}else{
						document.getElementById("contnum").innerHTML = "无财务对应合同";
					}
					document.getElementById("startdate").innerHTML = o.purSettle.startdate == null ? "" : o.purSettle.startdate;
					document.getElementById("enddate").innerHTML = o.purSettle.enddate == null ? "" : o.purSettle.enddate;
					document.getElementById("workamount").innerHTML = o.purSettle.workamount == null ? 0 : o.purSettle.workamount;
					document.getElementById("workunit").innerHTML = o.purSettle.workunit == null ? "" : nui.getDictText('SERV_NUM_TYPE',o.purSettle.workunit);
					document.getElementById("setstatus").innerHTML = o.purSettle.setstatus == null ? "" : nui.getDictText('AME_SETSTATUS',o.purSettle.setstatus);
					document.getElementById("confper").innerHTML = o.purSettle.confper == null ? "" : o.purSettle.confper;
					document.getElementById("comment").innerHTML = o.purSettle.comment == null ? "" : o.purSettle.comment;
					document.getElementById("setamount").innerHTML = o.purSettle.setamount == null ? "" : toThousands(parseFloat(o.purSettle.setamount).toFixed(2));
					
					//供应商
					document.getElementById("custid").innerHTML = o.purSettle.custname == null ? "" : o.purSettle.custname;
					//项目
                	document.getElementById("projectno").innerHTML = o.purSettle.projectname == null ? "" : o.purSettle.projectname;
                	//赋值受益部门 
                	document.getElementById("benefitid").innerHTML = o.purSettle.orgname == null ? "" : o.purSettle.orgname;
                	//客户
                	document.getElementById("custno").innerHTML = o.purSettle.miscustname == null ? "" : o.purSettle.miscustname;
                	//付款日期
                	document.getElementById("paydate").innerHTML = o.purSettle.paydate == null ? "" : o.purSettle.paydate;
                	//凭证号
					document.getElementById("pzhs").innerHTML = o.purSettle.pzhs == null ? "" : o.purSettle.pzhs;
					//税率
					document.getElementById("tax").innerHTML = o.purSettle.tax == null ? "" : parseFloat(o.purSettle.tax*100).toFixed(2) + " %";
					//不含税金额（元）
					document.getElementById("notaxmon").innerHTML = o.purSettle.notaxmon == null ? "" : toThousands(o.purSettle.notaxmon);
					//成本确认日期
					document.getElementById("confirmdate").innerHTML = o.purSettle.confirmdate == null ? "" : o.purSettle.confirmdate;
					//成本类型
					document.getElementById("costtype").innerHTML = o.purSettle.costtype == null ? "" : nui.getDictText("AME_CONTCOSTTYPE",o.purSettle.costtype);
					//成本说明
					document.getElementById("costmemo").innerHTML = o.purSettle.costmemo == null ? "" : nui.getDictText("AME_COSTTYPE",o.purSettle.costmemo);
                	//结算单编号
                	document.getElementById("settlementno").innerHTML = o.purSettle.settlementno == null ? "" : o.purSettle.settlementno;
                	//凭证年
					document.getElementById("pzyear").innerHTML = o.purSettle.pzyear == null ? "" : o.purSettle.pzyear;
					//凭证月
					document.getElementById("pzmonth").innerHTML = o.purSettle.pzmonth == null ? "" : o.purSettle.pzmonth;
					//结转数据
					var setstatus = o.purSettle.setstatus;
		    		if(setstatus == "0"){	//状态为：新增
		        		document.getElementById("field6").style.display="none";
		    		}else if(setstatus == "2"){	//状态为：完成
		        		document.getElementById("field6").style.display="block";
		    		}
		    		//结转金额	结转税率		结转不含税金额	工作量单位	工作量数量	单价
		    		document.getElementById("purOutcostTaxmon").innerHTML = o.purOutcost.taxmon == null ? "" : toThousands(o.purOutcost.taxmon);
		    		document.getElementById("purOutcostTax").innerHTML = o.purOutcost.tax == null ? "" : parseFloat(o.purOutcost.tax * 100).toFixed(2) + " %";
		    		document.getElementById("purOutcostNotaxmon").innerHTML = o.purOutcost.notaxmon == null ? "" : toThousands(o.purOutcost.notaxmon);
					document.getElementById("purOutcostWorkunit").innerHTML = o.purOutcost.workunit == null ? "" : nui.getDictText('SERV_NUM_TYPE',o.purOutcost.workunit);
					document.getElementById("purOutcostWorkamount").innerHTML = o.purOutcost.workamount == null ? "" : toThousands(o.purOutcost.workamount);
					if(o.purOutcost.workamount==null || o.purOutcost.workamount==0){
						document.getElementById("purOutcostUnitPrice").innerHTML ="";
					}else if(o.purOutcost.workamount==null && o.purOutcost.taxmon==null){
						document.getElementById("purOutcostUnitPrice").innerHTML ="";
					}else {
						document.getElementById("purOutcostUnitPrice").innerHTML = parseFloat((o.purOutcost.taxmon)/(o.purOutcost.workamount)).toFixed(2); 
					}		
					              	
                	//外包人员信息列表
                	grid.setData(o.purSettle.purSettleList);
                	grid.selectAll(false);
                	//计提信息
                	var jsonPresettle = nui.decode({purPresettle: {projectno: projectno,settlementid: settlementid,iden: "3"}});
                	grid2.load(jsonPresettle,function(){
                		grid2.selectAll(false);
                		var rowsPresettle = grid2.getSelecteds();
                		for(var i = 0;i < rowsPresettle.length;i++){
                			if(!rowsPresettle[i].settlementid){
                				grid2.deselect(rowsPresettle[i]);
                			}
                		}
                	});
        		},
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
        	});
        }
        
        //选择行
		var allSum = 0;
        function onSelect(e){
        	var rows = grid.getSelecteds();
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
			sumdays = parseFloat(sumdays).toFixed(2);
			summonths = parseFloat(summonths).toFixed(3);
            allSum = sumFee;
            allSum = parseFloat(allSum).toFixed(2);
            if(doSumfeezongji == allSum){
            	document.getElementById("sumtotal").innerHTML = toThousands(allSum);
            }else{
	            if(dosuminit == 1){
	        		document.getElementById("setamount").innerHTML = toThousands(allSum);
	            }
	            document.getElementById("sumtotal").innerHTML = toThousands(allSum);
            }
            document.getElementById("daystotal").innerHTML = parseFloat(sumdays);
        	document.getElementById("monthstotal").innerHTML = parseFloat(summonths);
            doSumfeezongji = allSum;
        }
        
	    //设置业务字典值-学历
		function dictGetDegree(e) {
			return nui.getDictText('DEGREE',e.value);
		}
		
		//设置业务字典值-性别
		function dictGetGender(e) {
			return nui.getDictText('ABF_GENDER',e.value);
		}
		
		//设置业务字典值-采购订单状态
	    function dictGetOrderStatus(e){
	    	return nui.getDictText('AME_ORDERSTATUS',e.value);
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
        
        function onCancel(e) {
            CloseWindow("cancel");
        }
        
        //金额千分位
	    function toThousands(num) {
			var num = (num || 0).toString(), result = '';
			if(num){
				if(num != 0){
					var s = num.substring(0,1);
					if(s=="-"){
						var num3 = num.split("-");
						var num4 = num3[1];
						var num2 = num4.split(".");
						num = num2[0];
						while (num.length > 3) {
							result = ',' + num.slice(-3) + result;
							num = num.slice(0, num.length - 3);
						}
						if (num) { 
							if(num2[1]){
								result = "-"+num + result + "." + num2[1]; 
							}else{
								result = "-"+num + result; 
							}
						}
					}else{
						var num2 = num.split(".");
						num = num2[0];
						while (num.length > 3) {
							result = ',' + num.slice(-3) + result;
							num = num.slice(0, num.length - 3);
						}
						if (num) { 
							if(num2[1]){
								result = num + result + "." + num2[1]; 
							}else{
								result = num + result; 
							}
						}
					}
				}else{
					result = 0;
				}
			}else{
				result = 0;
			}
			return result;
		}
        
        function drawMonths(e){
        	if (e.field == "price") {
		        e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
		    }
        	if (e.field == "workunit") {
		        e.cellHtml = "<div align='right'><b>总计：</b></div>";
		    }
        	if (e.field == "workamount") {
		        e.cellHtml = "<div align='center'><b>" + e.cellHtml + "</b></div>";
		    }
        	if (e.field == "accruedmoney") {
		        e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
		    }
        	if (e.field == "notaxmoney") {
		        e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
		    }
        }
	</script>
</body>
</html>