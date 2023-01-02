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
  - Author(s): zyl
  - Date: 2016-06-07 14:31:34
  - Description:
-->
<head>
	<title>新增、编辑结算</title>
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
				<input name="purSettle.settlementid" id="settlementid" class="nui-hidden"/>
				<input name="purSettle.fileids" id="fileids" class="nui-hidden"/>
				<input name="purSettle.setstatus" id="setstatus" class="nui-hidden" value="0"/>
				<!-- 供应商简称 -->
				<input name="purSettle.suppliersname" id="suppliersname" class="nui-hidden" />
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">供应商：</td>
							<td style="width:300px;"><input name="purSettle.custid" id="custid" class="nui-buttonedit" required="true" style="width:280px" emptyText="请选择供应商"
								onbuttonclick="selectSupplier" allowInput="false" />
							</td>
							<td align="right" style="width:120px;">客户：</td>
							<td><input name="purSettle.custno" onvaluechanged="changeMiscust" id="custno" valueField="miscustid" textField="miscustname" class="nui-combobox" required="false" style="width:280px;" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">项目：</td>
							<td><input name="purSettle.projectno" onvaluechanged="changeProject" id="projectno" allowInput="true" valueFromSelect="true" valueField="projectNo" textField="projectName" class="nui-combobox" required="false" style="width:280px" /></td>
							<td align="right" style="width:120px;">受益部门：</td>
							<td><input name="purSettle.benefitid" id="benefitid" readOnly="readOnly" showButton="false" class="nui-buttonedit" required="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">结算周期开始日期：</td>
							<td><input name="purSettle.startdate" id="startdate" onblur="startandend('start')" class="nui-datepicker" required="true" style="width:100px"/></td>
							<td align="right" style="width:120px;">结算周期截止日期：</td>
							<td><input name="purSettle.enddate" id="enddate" onblur="startandend('end')" class="nui-datepicker" required="true" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">结算单状态：</td>
							<td><input name="purSettle.setstatus" id="setstatus" onvaluechanged="changedSetstatus" class="nui-dictcombobox" dictTypeId="AME_SETSTATUS" style="width: 100px;"/></td>
							<td align="right" style="width:120px;">结算单编号：</td>
							<td><input name="purSettle.settlementno" id="settlementno" class="nui-textbox" onblur="checkSettlementno" required="true" style="width:100px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">工作量单位：</td>
							<td><input name="purSettle.workunit" id="workunit" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" value="1" required="true"  onvaluechanged="changeWorkamount" style="width:80px" /></td>
							<td align="right" style="width:120px;">工作量数量：</td>
							<td><input name="purSettle.workamount" id="workamount" class="nui-spinner" showButton="false" 
								allowLimitValue="false" changeOnMousewheel="false" style="width: 100px;" 
								inputStyle="text-align: left;" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">凭证年：</td>
							<td><input name="purSettle.pzyear" id="pzyear" onvaluechanged="changepzyear" class="nui-monthpicker" format="yyyy" required="false" style="width:60px" /></td>
							<td align="right" style="width:120px;">凭证月：</td>
							<td><input name="purSettle.pzmonth" id="pzmonth" onvaluechanged="changepzmonth" class="nui-monthpicker" format="MM"  required="false" style="width:45px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">付款日期：</td>
							<td><input name="purSettle.paydate" id="paydate" class="nui-datepicker" required="false" style="width:100px" /></td>
							<td align="right" style="width:120px;">凭证号：</td>
							<td><input name="purSettle.pzhs" id="pzhs" onvaluechanged="changePzhs" class="nui-textbox" rangeLengthErrorText="凭证号长度不能超过10" vtype="rangeLength:0,10" required="false" style="width:150px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">成本确认日期：</td>
							<td><input name="purSettle.confirmdate" id="confirmdate" onvaluechanged="changeConfirmdate" class="nui-datepicker" required="true" style="width:100px" /></td>
							<td align="right" style="width:210px;">结算总金额（元）：</td>
							<td><input name="purSettle.setamount" id="purSettleSetamount" readOnly="readOnly" inputStyle="text-align:right;" vtype="float" class="nui-textbox" required="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">税率：</td>
							<td><input name="purSettle.tax" id="tax" onvaluechanged="sumtaxmon" class="nui-textbox" required="true" inputStyle="text-align: right;" style="width:50px" />%</td>
							<td align="right" style="width:120px;">不含税金额（元）：</td>
							<td><input name="purSettle.notaxmon" id="notaxmon" value="0.00" readOnly="readOnly" inputStyle="text-align: right" class="nui-textbox" required="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">成本归属类型：</td>
							<td><input name="purSettle.costtype" id="costtype" class="nui-dictcombobox" dictTypeId="AME_CONTCOSTTYPE" showNullItem="true" required="false" style="width:100px"/></td>
							<td align="right" style="width:120px;">成本说明：</td>
							<td><input name="purSettle.costmemo" id="costmemo" class="nui-dictcombobox" dictTypeId="AME_COSTTYPE" showNullItem="true" required="false" style="width:100px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">财务对应合同编号：</td>
							<td><input name="purSettle.contnum" id="contnum" onbuttonclick="selectCont" class="nui-buttonedit" required="false" style="width:100px" /></td>
							<td align="right" style="width:120px;">工作量技术确认人：</td>
							<td><input name="purSettle.confper" id="confper" class="nui-textbox" required="false" style="width:100px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">备注：</td>
							<td colspan="3"><input name="purSettle.comment" id="comment" class="nui-textarea" required="false" style="width:440px"/></td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>外包人员信息</legend>
				<div id="datagrid" class="nui-datagrid" dataField="outPersons" style="width:100%;height:auto;" 
			    	url="com.primeton.eos.ame_pur.outperson.queryPurpersonToSettle.biz.ext" multiSelect="true" 
			    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" allowSortColumn="false"
			    	oncellendedit="doSumfee" onselect="onSelect" ondeselect="onDeselect" 
			    	onlyCheckSelection="true">
					<div property="columns">
						<div type="checkcolumn" width="30"></div>
						<div field="setdetailid" align="center" headerAlign="center" allowSort="true" visible="false">结算明细id</div>
						<div field="purorderid" align="center" headerAlign="center" allowSort="true" visible="false">采购订单编号</div>
						<div field="outperno" align="center" headerAlign="center" allowSort="true" visible="false">编号</div>
						<div field="outpername"width="90" align="center" headerAlign="center" allowSort="true" >姓名</div>	
						<div field="setstartdate" width="80" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">
							结算开始日期
							<input property="editor" required="true" errormode="border" class="nui-datepicker" style="width:100%;" />
						</div>
						<div field="setenddate" width="80" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">
							结算截止日期
							<input property="editor" required="true" errormode="border" class="nui-datepicker" style="width:100%;" />
						</div>
						<div field="days" width="80" align="center" headerAlign="center" allowSort="true">
							工作日统计
							<input property="editor" required="true" errormode="border" class="nui-textbox" style="width:100%;" />
						</div>
						<div field="months" width="50" align="center" headerAlign="center" allowSort="true">
							人月数
							<input property="editor" required="true" errormode="border" class="nui-textbox" style="width:100%;" />
						</div>
						<div field="price" width="80" align="right" headerAlign="center" allowSort="true">
							人月单价
							<%--<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>--%>
						</div>
						<div field="setfee" width="80" dataType="currency" align="right" headerAlign="center" allowSort="true">
							工时结算费用
							<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
						</div>
						<div field="othfee" width="80" dataType="currency" align="right" headerAlign="center" allowSort="true">
							其他费用
							<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
						</div>
						<div field="totalfee" summaryType="sum" readOnly="readOnly" dataType="currency" width="120" dataType="currency" align="right" headerAlign="center" allowSort="true">
							结算费用小计
							<input property="editor" class="nui-textbox" allowInput="false" style="width:100%;" vtype="float" />
						</div>
						<div field="score" width="50" align="center" headerAlign="center" allowSort="true">
							打分
							<input property="editor" class="nui-textbox" style="width:100%;" />
						</div>
						<div field="evaluate" width="auto" align="center" headerAlign="center" allowSort="true">
							评价
							<input property="editor" class="nui-textbox" style="width:100%;" />
						</div>
					</div>
				</div>
				<div style="width:600px;height:55px;margin-left:195px;float:left;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:80px;">总计：</td>
							<td id="daystotal" style="width:76px;" align="center" ></td>
							<td id="monthstotal" style="width:48px;" align="center" ></td>
							<td align="right" style="width:235px;">结算费用总计：</td>
							<td id="sumtotal" style="width:114px;" align="right" ></td>
						</tr>
						<tr>
							<td colspan="3"></td>
							<td align="right" style="width:235px;">结算最终总金额：</td>
							<td><input name="purSettle.setamount" id="setamount" onvaluechanged="changeSetamount" inputStyle="text-align:right;" vtype="float" class="nui-textbox" required="false" style="width:115px" /></td>
						</tr>
					</table>
				</div>
			</fieldset>
			
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;width: 1250px;">
				<legend>计提核销信息</legend>
				<div id="datagrid2" class="nui-datagrid" dataField="purPresettles" style="width:100%;height:auto;" 
			    	url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleListToSettle.biz.ext" multiSelect="true"
			    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" 
			    	onselect="onSelectPre" ondeselect="onDeselectPre" 
			    	onlyCheckSelection="true" allowSortColumn="false">
					<div property="columns">
						<div type="checkcolumn" width="30"></div>			
						<div field="accruedid" headerAlign="center" allowSort="true" visible="false">计提编号</div>
		                <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商编号</div>
		                <div field="custname" headerAlign="center" allowSort="true" visible="false">供应商名称</div>
		                <div field="suppliersname" width="80" headerAlign="center" allowSort="true" >供应商简称</div>
		                <div field="projectno" headerAlign="center" allowSort="true" visible="false">项目代码</div>
		                <div field="projectname" headerAlign="center" allowSort="true" visible="false">项目名称</div>
		                <div field="salesid" headerAlign="center" allowSort="true" visible="false" >所属销售ID</div>
		                <div field="orgname" headerAlign="center" allowSort="true" width="70" align="center" >所属销售</div>
		                <div field="syb" headerAlign="center" allowSort="true" width="100" renderer="dictGetContOrg" >所属事业部</div>
		                <div field="contnum" headerAlign="center" allowSort="true" visible="false">销售合同</div>
		                
		                <div field="workunit" width="70" align="center" headerAlign="center" allowSort="true" renderer="dictGetWorkunit">工作量单位</div>
	                	<div field="workamount" width="70" align="center" headerAlign="center" allowSort="true" >工作量数量</div>
		                
		                <div field="startdate" headerAlign="center" allowSort="true" width="80" align="center" >开始日期</div>
		                <div field="enddate" headerAlign="center" allowSort="true" width="80" align="center" >结束日期</div>
		                <div field="accrueddate" headerAlign="center" allowSort="true" width="80" align="center" >计提时间</div>
		                <div field="accruedmoney" headerAlign="center" allowSort="true" width="90" align="right" dataType="currency" >计提金额</div>
		                <div field="outper" headerAlign="center" allowSort="true" width="200" >相关外包人员</div>
		                <div field="accruedstatus" headerAlign="center" allowSort="true" renderer="dictGetStatus" width="100" align="center" >状态</div>
		                <div field="settlementid" headerAlign="center" allowSort="true" visible="false" >结算单编号</div>
		                <div field="comment" width="auto" headerAlign="center" allowSort="true" >备注</div>
					</div>
				</div>
				<div style="width: 600px;height:55px;margin-left: 205px;float:left;">
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width:140px;">总计：</td>
						<td id="sumtotalworkamount" style="width:65px;" align="center" ></td>
						<td style="width: 240px;"></td>
						<td id="sumtotalpre" style="width: 80px" align="right" ></td>
					</tr>
				</table>
				</div>
			</fieldset>
			
			<fieldset id="field6" style="border: solid 1px #aaa;padding: 3px;">
				<legend>结转明细</legend>
				<div>
					<div class="nui-CheckBox" name="purOutcost.checkSure" id="checkSure" onclick="checkSure()" checked="true" text="是否增加结转记录" trueValue="1" falseValue="0"></div>
					<input name="purOutcost.contnum" id="purOutcostContnum" class="nui-hidden" />
					<input name="purOutcost.outcosttype" id="purOutcostOutcosttype" class="nui-hidden" />
					<input name="purOutcost.accruedid" id="purOutcostAccruedid" class="nui-hidden" />
					<input name="purOutcost.startdate" id="purOutcostStartdate" class="nui-hidden" />
					<input name="purOutcost.enddate" id="purOutcostEnddate" class="nui-hidden" />
					<input name="purOutcost.supplierid" id="purOutcostSupplierid" class="nui-hidden" />
					<input name="purOutcost.outcoststatus" id="purOutcostOutcoststatus" class="nui-hidden" value="1" />
					<input name="purOutcost.confirmdate" id="purOutcostConfirmdate" class="nui-hidden" />
					<input name="purOutcost.pzhs" id="purOutcostPzhs" class="nui-hidden" />
					<input name="purOutcost.accruedmon" id="purOutcostAccruedmon" class="nui-hidden" />
					<table style="table-layout:fixed;" id="table_file2">
						<tr>
							<td align="right" style="width:140px;">成本结转金额(含税)：</td>
							<td><input name="purOutcost.taxmon" id="purOutcostTaxmon" onblur="changePurOutcostTax" class="nui-textbox" inputStyle="text-align: right;" style="width: 100px;" /></td>
							<td align="right" style="width:100px;">税率：</td>
							<td><input name="purOutcost.tax" id="purOutcostTax" onblur="changePurOutcostTax" class="nui-textbox" required="true" inputStyle="text-align: right;" style="width: 50px;" />%</td>
							<td align="right" style="width:140px;">成本结转金额(不含税)：</td>
							<td><input name="purOutcost.notaxmon" id="purOutcostNotaxmon" readOnly="readOnly" class="nui-textbox" inputStyle="text-align: right;" style="width: 100px;" /></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
		<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
			<legend>外包结算附件</legend>
			<jsp:include page="/ame_common/inputFile.jsp"/>
			<%-- <jsp:include page="/ame_common/detailFile.jsp"/> --%>
		</fieldset>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">保存</a>
		<%--<a class="nui-button" onclick="onOk('app')" style="width:130px;margin-right:20px;" id="appButton">保存并发起结算申请</a>--%>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	<script type="text/javascript">
		nui.parse();
		//更新逻辑流路径
		var updateURL = "com.primeton.eos.ame_pur.settle.updatePursettle.biz.ext";
        //新增逻辑流路径
    	var addURL = "com.primeton.eos.ame_pur.settle.addPursettle.biz.ext";
    	var saveURL = "";
	  	var form = new nui.Form("form1");
	  	var grid = nui.get("datagrid");
	  	var grid2 = nui.get("datagrid2");
	  	var dosuminit = 0;
	  	var doSumfeezongji = 0;
	  	var settlementnohave = false;
	  	//操作是新增还是编辑
	  	var dataaction = null;
	  	var dosuminit2 = 0;
	  	//计提总金额
		var sumAccruedmoney = 0;
		//初始化完毕
		var initOver = false;
		init();
		function init(){
			//设置结算单的状态只能是新增和完成
			//放开结算单编辑后，状态放开。
			/* var setstatusdate = [{"__NullItem":true,"dictName":"","dictID":""},{"dictID":"0","dictName":"新增"},{"dictID":"2","dictName":"完成"}];
			nui.get("setstatus").setData(setstatusdate); */
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
            	document.getElementById("sumtotal").innerHTML = parseFloat(allSum).toFixed(2);
            }else{
        		nui.get("setamount").setValue(allSum);
        		changeSetamount();
        		sumtaxmon();
	            document.getElementById("sumtotal").innerHTML = parseFloat(allSum).toFixed(2);
            }
            document.getElementById("daystotal").innerHTML = parseFloat(sumdays).toFixed(2);
        	document.getElementById("monthstotal").innerHTML = parseFloat(summonths).toFixed(3);
        	if(initOver){
	        	if(nui.get("workunit").getValue() == "1"){//人月数计算
		            //设置工作量数量
		        	nui.get("workamount").setValue(document.getElementById("monthstotal").innerHTML);
	            }else{
		            //设置工作量数量
		        	nui.get("workamount").setValue(document.getElementById("daystotal").innerHTML);            
	            }
        	}
            doSumfeezongji = allSum;
            sumOutcost();
        }
        
        
        function changeWorkamount(){
			var workunit = nui.get("workunit").getValue();
			if(workunit!='3'){
				nui.get("workamount").setRequired(true);
			}else{
				nui.get("workamount").setRequired(false);
			}	
		}
        
        //取消选中行
        function onDeselect(e){
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
				document.getElementById("sumtotal").innerHTML = parseFloat(allSum).toFixed(2);
			}else{
        		nui.get("setamount").setValue(allSum);
        		changeSetamount();
        		sumtaxmon();
				document.getElementById("sumtotal").innerHTML = parseFloat(allSum).toFixed(2);
			}
			
			document.getElementById("daystotal").innerHTML = parseFloat(sumdays).toFixed(2);
            document.getElementById("monthstotal").innerHTML = parseFloat(summonths).toFixed(3);
            if(initOver){
	            if(nui.get("workunit").getValue() == "1"){//人月数计算
		            //设置工作量数量
		        	nui.get("workamount").setValue(document.getElementById("monthstotal").innerHTML);
	            }else{
		            //设置工作量数量
		        	nui.get("workamount").setValue(document.getElementById("daystotal").innerHTML);            
	            }
            }
			doSumfeezongji = allSum;
			sumOutcost();
        }
        
        //选择行计提
        var allSumPre = 0;
        function onSelectPre(e){
        	var rows = grid2.getSelecteds();
        	var sumFee = 0;
        	var sumWorkamount = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].accruedmoney){
					sumFee += parseFloat(rows[i].accruedmoney);
				}
				if(rows[i].workamount){
					sumWorkamount += parseFloat(rows[i].workamount);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			sumWorkamount = parseFloat(sumWorkamount).toFixed(3);
            allSumPre = sumFee;
            allSumPre = parseFloat(allSumPre).toFixed(2);
            document.getElementById("sumtotalpre").innerHTML = parseFloat(allSumPre).toFixed(2);
            document.getElementById("sumtotalworkamount").innerHTML = parseFloat(sumWorkamount).toFixed(3);
            
            //成本结转类型：1、计提，2、采购结算，3、计提冲销
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].accruedstatus == "2"){	//确认计提审核中
					sumAccruedmoney += rows[i].accruedmoney;
				}
			}
			sumOutcost();
        }
        
        //取消选中行计提
        function onDeselectPre(e){
        	var rows = grid2.getSelecteds();
        	var sumFee = 0;
        	var sumWorkamount = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].accruedmoney){
					sumFee += parseFloat(rows[i].accruedmoney);
				}
				if(rows[i].workamount){
					sumWorkamount += parseFloat(rows[i].workamount);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			sumWorkamount = parseFloat(sumWorkamount).toFixed(3);
			allSumPre = sumFee;
			allSumPre = parseFloat(allSumPre).toFixed(2);
			document.getElementById("sumtotalpre").innerHTML = parseFloat(allSumPre).toFixed(2);
			document.getElementById("sumtotalworkamount").innerHTML = parseFloat(sumWorkamount).toFixed(3);
			//成本结转类型：1、计提，2、采购结算，3、计提冲销
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].accruedstatus == "2"){	//确认计提审核中
					sumAccruedmoney += rows[i].accruedmoney;
				}
			}
			sumOutcost();
        }
		
	  	//赋值
	  	function SetData(data){
	    	data = nui.clone(data);
	    	var settlementid = data.settlementid;
	    	var custid = data.custid;
	    	var custno = data.custno;
	    	if(data.action == "edit"){
	    		dataaction = "edit";
	    		var json = nui.encode({purSettle: {settlementid: settlementid,custid: custid,custno: custno}});
	    		form.loading("Loading...");
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_pur.settle.getPursettle.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                showModal: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	form.unmask();
	                	nui.parse();
	                	o = nui.clone(o);
	                	//加载附件设置参数
                		nui.get("grid_0").load({"groupid":"purSettle","relationid": settlementid});
	                    //流程实例ID
	                    var processinstid = o.purSettle.processinstid;
						//供应商
						nui.get("custid").setValue(o.purSettle.custid);
						nui.get("custid").setText(o.purSettle.custname);
						nui.get("suppliersname").setValue(o.purSettle.suppliersname);
						//nui.get("startdate").setText(o.purSettle.startdate);
						//nui.get("enddate").setText(o.purSettle.enddate);
						//工作量技术确认人
						//nui.get("confper").setValue(o.purSettle.confper);
						form.setData(o);
						//凭证年月
						if(o.purSettle.pzyear != null && o.purSettle.pzmonth != null){
							nui.get("pzyear").setValue(o.purSettle.pzyear + "-" + o.purSettle.pzmonth);
							nui.get("pzmonth").setValue(o.purSettle.pzyear + "-" + o.purSettle.pzmonth);
						}else if(o.purSettle.pzyear != null && o.purSettle.pzmonth == null){
							nui.get("pzyear").setText(o.purSettle.pzyear);
						}else if(o.purSettle.pzyear == null && o.purSettle.pzmonth != null){
							nui.get("pzmonth").setText(o.purSettle.pzmonth);
						}
						var workunit = nui.get("workunit").getValue();
						if(workunit!='3'){
							nui.get("workamount").setRequired(true);
						}else{
							nui.get("workamount").setRequired(false);
						}
						//结算单税率
						if(o.purSettle.tax){
							nui.get("tax").setValue(parseFloat(o.purSettle.tax*100).toFixed(2));
						}
						nui.get("contnum").setValue(o.purSettle.contnum);
						nui.get("contnum").setText(o.purSettle.contnum);
						var projectno = o.purSettle.projectno;
						var orgid = o.purSettle.orgid;
						var orgname = o.purSettle.orgname;
						//筛选客户
						var json2 = nui.encode({"criteria": 
                        	{"_expr": 
                        		{"_property": "custid","_value": custid}}}); 
			        	nui.ajax({
			        		url: "com.primeton.eos.ame_pur.settle.queryMiscust.biz.ext",
			                data: json2,
			                type: 'POST',
			                cache: false,
			                showModal: false,
			                contentType: 'text/json',
			                success: function (o2) {
			                	nui.parse();
			                	o2 = nui.clone(o2);
			                	if(o2.misCusts==null || o2.misCusts==""){
			                		nui.get("custno").setData();
				                	nui.get("custno").setValue();
				                	nui.get("projectno").setData();
				                	nui.get("projectno").setValue();
				                	nui.get("benefitid").setValue();
				                	nui.get("benefitid").setText();
			                	}else{
				                	//设置客户下拉列表
				                	nui.get("custno").setData(o2.misCusts);
				                	nui.get("custno").setValue(custno);
				                	//筛选项目
		                           	var json3 = nui.encode({"criteria": 
		                            	{"_expr[0]":{"_property": "custid","_value": custid},
		                            	 "_expr[1]":{"_property": "miscustid","_value": custno}}
		                            	,"iden": "addPurOutSettle"});
						        	nui.ajax({
						        		url: "com.primeton.eos.ame_pur.settle.queryMiscust.biz.ext",
						                data: json3,
						                type: 'POST',
						                cache: false,
						                showModal: false,
						                contentType: 'text/json',
						                success: function (o3) {
						                	nui.parse();
						                	o3 = nui.clone(o3);
						                	//项目
						                	nui.get("projectno").setData(o3.misCusts);
						                	nui.get("projectno").setValue(projectno);
						                	//赋值受益部门 
						                	nui.get("benefitid").setValue(orgid);
						                	nui.get("benefitid").setText(orgname);
						                	var json4 = nui.decode({custid: custid,projectno: projectno,settlementid: settlementid,setSettle: "2"});
						                	grid.sortBy("outpername","asc");
						                	grid.load(json4,function (){
						                		grid.selectAll(false);
						                		var rows = grid.getSelecteds();
						                		for(var i = 0;i < rows.length;i++){
						                			if(rows[i].settlementid != settlementid){
						                				grid.deselect(rows[i]);
						                			}
						                		}
						                		nui.get("setamount").setValue(o.purSettle.setamount);
						                		nui.get("purSettleSetamount").setValue(o.purSettle.setamount);
						                		nui.get("notaxmon").setValue(o.purSettle.notaxmon);
						                		dosuminit = 1;
						                		var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectno,settlementid: settlementid,iden: "3"}});
							                	grid2.load(jsonPresettle,function(){
							                		grid2.selectAll(false);
							                		var rowsPresettle = grid2.getSelecteds();
							                		for(var i = 0;i < rowsPresettle.length;i++){
							                			if(!rowsPresettle[i].settlementid){
							                				grid2.deselect(rowsPresettle[i]);
							                			}
							                		}
							                		//结转初始化
								                	var setstatus = nui.get("setstatus").getValue();
										    		if(setstatus == "0"){	//状态为：新增
														nui.get("checkSure").setValue(0);
										        		nui.get("purOutcostTax").setRequired(false);
										        		document.getElementById("field6").style.display="none";
										        		//编辑进入，需要将计提金额重置
										        		sumAccruedmoney = 0;
										    		}
										    		initOver = true;
							                	});
						                	});
						                	
					                	},
						                error: function (jqXHR, textStatus, errorThrown) {
						                    alert(jqXHR.responseText);
						                    CloseWindow();
					                	}
					                });
			                	}
			                },
			                error: function (jqXHR, textStatus, errorThrown) {
			                    alert(jqXHR.responseText);
			                    CloseWindow();
			                }
			        	});
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    		}else if(data.action == "add"){
    			dataaction = "add";
    			//生成结算单编号
				var code="";
				var myAjax = new Ajax("com.primeton.eos.ame_pur.settle.creatSettleCode.biz");
				myAjax.submit();
				var code =myAjax.getValue("root/data/settlementno");
				nui.get("settlementno").setValue(code);
				//默认不冲销，隐藏冲销记录模块
				nui.get("checkSure").setValue(0);
        		nui.get("purOutcostTax").setRequired(false);
        		document.getElementById("field6").style.display="none";
        		//默认设置结算单状态为0-新增
        		nui.get("setstatus").setValue("0");
        		nui.get("workamount").setRequired(true);
    		}
    	}
    	
    	//选择供应商
        function selectSupplier(){
        	var btnEdit = this;
            nui.open({
                url:"<%=request.getContextPath() %>/ame_pur/PurSupplier/SelectSupplier.jsp",
                title: "选择供应商",
                width: 650,
                height: 400,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);
                        if (data) {
                            btnEdit.setValue(data.custid);
                            btnEdit.setText(data.custname);
                            nui.get("suppliersname").setValue(data.suppliersname);
                            //成本结转供应商ID
							nui.get("purOutcostSupplierid").setValue(data.custid);
                            //删选客户
                            var json = nui.encode({"criteria": 
	                            	{"_expr": 
	                            		{"_property": "custid","_value": data.custid}}});
				        	nui.ajax({
				        		url: "com.primeton.eos.ame_pur.settle.queryMiscust.biz.ext",
				                data: json,
				                type: 'POST',
				                cache: false,
				                showModal: false,
				                contentType: 'text/json',
				                success: function (o) {
				                	nui.parse();
				                	o = nui.clone(o);
				                	if(o.misCusts==null || o.misCusts==""){
				                		nui.get("custno").setData();
					                	nui.get("custno").setValue();
					                	nui.get("projectno").setData();
					                	nui.get("projectno").setValue();
					                	nui.get("benefitid").setValue();
					                	nui.get("benefitid").setText();
				                	}else{
					                	//设置客户下拉列表
					                	nui.get("custno").setData(o.misCusts);
					                	nui.get("custno").setValue(o.misCusts[0].miscustid);
					                	//项目
					                	var json2 = nui.encode({"criteria": 
			                            	{"_expr[0]":{"_property": "custid","_value": data.custid},
			                            	 "_expr[1]":{"_property": "miscustid","_value": o.misCusts[0].miscustid}}
			                            	,"iden": "addPurOutSettle"}); 
							        	nui.ajax({
							        		url: "com.primeton.eos.ame_pur.settle.queryMiscust.biz.ext",
							                data: json2,
							                type: 'POST',
							                cache: false,
							                showModal: false,
							                contentType: 'text/json',
							                success: function (o2) {
							                	nui.get("projectno").setData(o2.misCusts);
							                	nui.get("projectno").setValue(o2.misCusts[0].projectNo);
							                	//alert("合同ID：" + o2.misCusts[0].contractid);
							                	//赋值受益部门 
							                	nui.get("benefitid").setValue(o2.misCusts[0].finUnitId);
							                	nui.get("benefitid").setText(o2.misCusts[0].orgname);
							                	//外包人员信息
							                	var jsonOutper = nui.decode({custid: data.custid,projectno: o2.misCusts[0].projectNo});
							                	grid.load(jsonOutper);
							                	grid.sortBy("outpername","asc");
							                	//计提核销信息 根据项目(projectno)筛选计提信息
							                	var jsonPresettle = nui.decode({purPresettle: {custid: data.custid,projectno: o2.misCusts[0].projectNo,iden: "1"}});
							                	grid2.load(jsonPresettle);
							                	nui.get("setamount").setValue(0);
							                	changeSetamount();
							                	sumtaxmon();
						                		document.getElementById("sumtotal").innerHTML = 0;
                								document.getElementById("sumtotalpre").innerHTML = 0;
                								document.getElementById("daystotal").innerHTML = 0;
												document.getElementById("monthstotal").innerHTML = 0;
							                	
						                	},
							                error: function (jqXHR, textStatus, errorThrown) {
							                    alert(jqXHR.responseText);
							                    CloseWindow();
						                	}
						                });
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
            });
        }
    	
    	//选择客户
        function changeMiscust(){
        	var custno = nui.get("custno").getValue();
        	var custid = nui.get("custid").getValue();
            var json = nui.encode({"criteria": 
            	{"_expr[0]":{"_property": "custid","_value": custid},
            	 "_expr[1]":{"_property": "miscustid","_value": custno}}
            	,"iden": "addPurOutSettle"}); 
        	nui.ajax({
        		url: "com.primeton.eos.ame_pur.settle.queryMiscust.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                showModal: false,
                contentType: 'text/json',
                success: function (o) {
                	nui.parse();
                	o = nui.clone(o);
                	if(o.misCusts==null || o.misCusts==""){
	                	nui.get("projectno").setData();
	                	nui.get("projectno").setValue();
	                	nui.get("benefitid").setValue();
	                	nui.get("benefitid").setText();
	                }else{
	                	//项目
	                	nui.get("projectno").setData(o.misCusts);
	                	nui.get("projectno").setValue(o.misCusts[0].projectNo);
	                	//赋值受益部门 
	                	nui.get("benefitid").setValue(o.misCusts[0].finUnitId);
	                	nui.get("benefitid").setText(o.misCusts[0].orgname);
	                	//custid供应商id
	                	//saleid受益部门
	                	var custid = nui.get("custid").getValue();
	                	var settlementid = nui.get("settlementid").getValue();
	                	if(settlementid){	//编辑更换客户
	                		var json2 = nui.decode({custid: custid,projectno: o.misCusts[0].projectNo,settlementid: settlementid});
		                	grid.load(json2);
		                	grid.sortBy("outpername","asc");
	                	}else{				//新增更换客户
		                	var json2 = nui.decode({custid: custid,projectno: o.misCusts[0].projectNo});
		                	grid.load(json2);
		                	grid.sortBy("outpername","asc");
	                	}
	                	//计提核销信息 根据项目(projectno)筛选计提信息
	                	var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: o.misCusts[0].projectNo}});
	                	grid2.load(jsonPresettle);
	                	nui.get("setamount").setValue(0);
	                	changeSetamount();
	                	sumtaxmon();
	                	document.getElementById("sumtotal").innerHTML = 0;
						document.getElementById("sumtotalpre").innerHTML = 0;
						document.getElementById("daystotal").innerHTML = 0;
						document.getElementById("monthstotal").innerHTML = 0;
	                }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
        	});
        }
        
        //选择项目
        function changeProject(){
        	var custno = nui.get("custno").getValue();
        	var custid = nui.get("custid").getValue();
        	var projectno = nui.get("projectno").getValue();
            var json = nui.encode({"criteria": 
            	{"_expr[0]":{"_property": "custid","_value": custid},
            	 "_expr[1]":{"_property": "miscustid","_value": custno},
            	 "_expr[2]":{"_property": "projectNo","_value": projectno}}
            	,"iden": "addPurOutSettle"}); 
        	nui.ajax({
        		url: "com.primeton.eos.ame_pur.settle.queryMiscust.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                showModal: false,
                contentType: 'text/json',
                success: function (o) {
                	nui.parse();
                	o = nui.clone(o);
                	if(o.misCusts==null || o.misCusts==""){
	                	nui.get("projectno").setData();
	                	nui.get("projectno").setValue();
	                	nui.get("benefitid").setValue();
	                	nui.get("benefitid").setText();
	                }else{
                		//赋值受益部门 
                		nui.get("benefitid").setValue(o.misCusts[0].finUnitId);
	                	nui.get("benefitid").setText(o.misCusts[0].orgname);
	                	//alert("选择项目：合同ID：" + o.misCusts[0].contractid);
	                	var settlementid = nui.get("settlementid").getValue();
	                	if(settlementid){
	                		var json2 = nui.decode({custid: custid,projectno: projectno,settlementid: settlementid});
		                	grid.load(json2);
		                	grid.sortBy("outpername","asc");
	                	}else{
		                	var json2 = nui.decode({custid: custid,projectno: projectno});
		                	grid.load(json2);
		                	grid.sortBy("outpername","asc");
	                	}
	                	//计提核销信息 根据项目(projectno)筛选计提信息
	                	var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectno}});
	                	grid2.load(jsonPresettle);
	                	nui.get("setamount").setValue(0);
	                	changeSetamount();
	                	sumtaxmon();
	                	document.getElementById("sumtotal").innerHTML = 0;
						document.getElementById("sumtotalpre").innerHTML = 0;
						document.getElementById("daystotal").innerHTML = 0;
						document.getElementById("monthstotal").innerHTML = 0;
                	}
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
        	});
        }
        
        //计算算费用 
        function doSumfee(e){
        	//setfee：本次结算费用，othfee：其他费用，totalfee：小计
        	var row = grid.getRow(e.rowIndex);
        	var setfee = 0;
        	var othfee = 0;
        	var totalfee = 0;
        	var price = 0;
        	var months = 0;
	        var sumtotalfee = 0;
	        var sumdays = 0;
	        var summonths = 0;
	        if(row.days){
	        	days = row.days;
	        }
        	if(row.months){
        		months = row.months;
        	}
        	if(row.price){
        		price = row.price; 
        	}
        	if(row.setfee){
        		setfee = row.setfee;
        	}
        	if(row.othfee){
        		othfee = row.othfee;
        	}
        	var setfee;
        	if(nui.get("workunit").getValue() == "1"){//人月数计算
        		setfee = (parseFloat(price) * parseFloat(months)).toFixed(2);
        	}else{//人天数计算
        		setfee = (parseFloat(price) * parseFloat(days)).toFixed(2);
        	}
        	var othfee = parseFloat(othfee).toFixed(2);
        	var totalfee = (parseFloat(setfee) + parseFloat(othfee)).toFixed(2);
        	//赋值小计费用 
        	var rowData = {totalfee: totalfee,setfee: setfee,othfee: othfee};
			grid.updateRow(row,rowData);
			//获取编辑数据后求和 
			var datas = grid.getSelecteds();
			for(var i=0;i<datas.length;i++){
				var totalfee = datas[i].totalfee;
				if(totalfee){
					if(!isNaN(totalfee)){
						sumtotalfee += parseFloat(totalfee);
					}
				}
				var days = datas[i].days;
				if(days){
					if(!isNaN(days)){
						sumdays += parseFloat(days);
					}
				}
				var months = datas[i].months;
				if(months){
					if(!isNaN(months)){
						summonths += parseFloat(months);
					}
				}
			}
			sumtotalfee = parseFloat(sumtotalfee).toFixed(2);
			sumdays = parseFloat(sumdays).toFixed(2);
			summonths = parseFloat(summonths).toFixed(3);
			if(doSumfeezongji != sumtotalfee){
				//赋值总费用
				var setamountValue = nui.get("setamount").getValue();
				sumtotalfee = parseFloat(sumtotalfee).toFixed(2);
				nui.get("setamount").setValue(sumtotalfee);
				changeSetamount();
				sumtaxmon();
			}
			document.getElementById("sumtotal").innerHTML = parseFloat(sumtotalfee).toFixed(2);
			document.getElementById("daystotal").innerHTML = parseFloat(sumdays).toFixed(2);
        	document.getElementById("monthstotal").innerHTML = parseFloat(summonths).toFixed(3);
        	if(initOver){
	        	if(nui.get("workunit").getValue() == "1"){//人月数计算
					//设置工作量数量-人月数统计月数总量
		        	nui.get("workamount").setValue(document.getElementById("monthstotal").innerHTML);
	        	}else{
					//设置工作量数量-人天数统计天数总量
		        	nui.get("workamount").setValue(document.getElementById("daystotal").innerHTML);
	        	}
        	}
			doSumfeezongji = sumtotalfee;
			sumOutcost();
        }
        
        //计算成本结转金额，设置结转类型。
        function sumOutcost(){
        	var setstatus = nui.get("setstatus").getValue();
        	var rows2 = grid2.getSelecteds();
        	if(setstatus == "0"){
        		return;
        	}
			//成本结转类型：1、计提，2、采购结算，3、计提冲销
			for(var i = 0;i < rows2.length;i ++){
				sumAccruedmoney += rows2[i].accruedmoney;
			}
			//结算单金额
			var setamount = nui.get("setamount").getValue();
			//计算成本结转金额（含税）
			setamount = parseFloat(setamount);
			sumAccruedmoney = parseFloat(sumAccruedmoney);
			//成本结转计提金额
			nui.get("purOutcostAccruedmon").setValue(sumAccruedmoney);
			//成本结转金额（含税）
			nui.get("purOutcostTaxmon").setValue(parseFloat(setamount-sumAccruedmoney).toFixed(2));
			var purOutcostTaxmon = nui.get("purOutcostTaxmon").getValue();
			//成本结转税率
			var purOutcostTax = nui.get("purOutcostTax").getValue();
			//计算成本结转金额（不含税）
			if(purOutcostTax){
				purOutcostTax = parseFloat(1+purOutcostTax/100).toFixed(2);
				purOutcostTaxmon = parseFloat(purOutcostTaxmon).toFixed(2);
				if(purOutcostTax == 0){
					nui.get("purOutcostNotaxmon").setValue(0);
				}else{
					nui.get("purOutcostNotaxmon").setValue(parseFloat(purOutcostTaxmon/(purOutcostTax)).toFixed(2));
				}
			}else{
				nui.get("purOutcostNotaxmon").setValue(0);
			}
			
			if(sumAccruedmoney != 0){	//计提总金额不为0，成本结转类型为计提冲销
				nui.get("purOutcostOutcosttype").setValue("3");
				var accruedids = "";
				for(var i = 0; i < rows2.length; i++){
					if(accruedids == ""){
						accruedids = rows2[i].accruedid;
					}else{
						accruedids = accruedids + "," + rows2[i].accruedid;
					}
				}
				//计提单编号
				nui.get("purOutcostAccruedid").setValue(accruedids);
			}else{						//计提总金额为0，成本结转类型为采购结算
				nui.get("purOutcostOutcosttype").setValue("2");
			}
        }
        
    	//保存
	  	function SaveData(action) {
	  		var rows = grid.getSelecteds();
            if(form.validate()){                         
	        	var settlementid = nui.get("settlementid").getValue();
	        	var saveURL = "";
				if(settlementid){
					saveURL = updateURL;
				} else{
					saveURL = addURL;
				}
				var o = form.getData();
				//外包人员信息
				var rows = grid.getSelecteds();
				o.purSettle.purSettleLists = rows;
				//采购合同id
				o.purSettle.purcontid = o.purSettle.purSettleLists[0].purcontid;
				//计提信息
				var purPresettles = grid2.getSelecteds();
				o.purSettle.purPresettles = purPresettles;
				var pzyear = nui.get("pzyear").getValue();
				var pzmonth = nui.get("pzmonth").getValue();
				if(pzyear){
					pzyear = pzyear.getFullYear();
				}
				if(pzmonth){
					pzmonth = pzmonth.getMonth() + 1;
				}
				o.purSettle.pzyear = pzyear;
				o.purSettle.pzmonth = pzmonth;
				//结算单税率除100
				o.purSettle.tax = parseFloat(o.purSettle.tax/100);
				//成本结转税率除100
				o.purOutcost.tax = parseFloat(o.purOutcost.tax/100);
	            var json = nui.encode(o);
	            form.loading("信息保存中...");
	            nui.ajax({
	                url: saveURL,
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	form.unmask();
						var returnJson = nui.decode(text);
						if(returnJson.exception == null){
							nui.alert("保存成功",null,function(){
								CloseWindow("ok");
							});
						}else{
							nui.alert("保存失败", "系统提示", function(action){
								if(action == "ok" || action == "close"){
									//CloseWindow("saveFailed");
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
	    
	    //设置业务字典值-学历
		function dictGetDegree(e) {
			return nui.getDictText('DEGREE',e.value);
		}
		
		//设置业务字典值-性别
		function dictGetGender(e) {
			return nui.getDictText('ABF_GENDER',e.value);
		}
		
		//设置业务字典值-事业部
		function dictGetContOrg(e){
			return nui.getDictText('CONT_ORG',e.value);
		}
		
		//设置业务字典值-计提状态
		function dictGetStatus(e){
			return nui.getDictText('AME_ACCRUEDSTATUS',e.value);
		}
		
		//设置业务字典值-工作量单位
		function dictGetWorkunit(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);
		}
		
		//设置日期格式
		function onDealDate(e){
			if(e.value){
				return e.value.substring(0,10);
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
        
		function onOk(action){
			var filePaths = document.getElementsByName("uploadfile").length;
			var settlementno = nui.get("settlementno").getValue();
			if(!settlementno){
				nui.alert("结算单编号不能为空！");
				return;
			}
			if(settlementnohave){
				nui.alert("结算单编号已存在");
				return;
			}
        	for(var j=0;j<filePaths;j++){
        		var a=document.getElementsByName("remarkList")[j].value;
        		if(a==null||a==""){
        			nui.alert("新增附件不可以为空");
        			return false;
        		}
        	}
        	var rows = grid.getSelecteds();
    		if(rows.length == 0){
				nui.alert("未选中外包人员记录");
				return;
			}
			var zongji = parseFloat(document.getElementById("sumtotal").innerHTML).toFixed(2);
    		var zongje = parseFloat(nui.get("setamount").getValue()).toFixed(2);
			if(parseFloat(zongje) > parseFloat(zongji)){
				nui.alert("结算最终总金额(" + zongje + ")大于总计(" + zongji + ")");
				return;
			}
			var outpernos = [];
			for(var i = 0;i < rows.length;i ++){
				outpernos[i] = rows[i].outperno;
			}
			/* var sortoutpernos = outpernos.sort();
			for(var i = 0;i < sortoutpernos.length;i ++){
				if(sortoutpernos[i] == sortoutpernos[i+1]){
					nui.alert("同一个人员只能选中一条记录");
					return;
				}
			} */
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
	        			nui.alert("开始日期:" + startdate.substring(0,10) + "不能大于截止日期:" + enddate.substring(0,10));
	        			return;
	        		}
        		}
        	}
			for(var i = 0;i < rows.length;i ++){
				if(!rows[i].setstartdate){
					nui.alert("结算开始日期不能为空");
					return;
				}
				if(!rows[i].setenddate){
					nui.alert("结算截止日期不能为空");
					return;
				}
				if(!rows[i].days){
					nui.alert("工作日统计不能为空");
					return;
				}
				if(!rows[i].months){
					nui.alert("人月数不能为空");
					return;
				}
				if(rows[i].setstartdate){
	        		if(rows[i].setenddate){
		        		if(rows[i].setstartdate > rows[i].setenddate){
		        			nui.alert("外包人员:" + rows[i].outpername + "的结算开始日期:" + rows[i].setstartdate.substring(0,10) + "不能大于结算截止日期:" + rows[i].setenddate.substring(0,10));
		        			return;
		        		}
	        		}
	        	}
	        	if(rows[i].setstartdate.substring(0,10) > now){
					nui.alert("外包人员:" + rows[i].outpername +"的开始日期不能大于当前日期");
					return;
				}
				if(rows[i].setenddate.substring(0,10) > now){
					nui.alert("外包人员:" + rows[i].outpername +"的截止日期不能大于当前日期");
					return;
				}
			}
        	if(form.validate()){
        		nui.confirm("确认保存吗？", "确定？",
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
			if((startdate.substring(0,10)) > now){
				nui.alert("开始日期不能大于当前日期");
				return;
			}
			if((enddate.substring(0,10)) > now){
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
        	//成本开始日期
			nui.get("purOutcostStartdate").setValue(nui.get("startdate").getValue());
			//成本结束日期
			nui.get("purOutcostEnddate").setValue(nui.get("enddate").getValue());
        	var settlementno = nui.get("settlementno").getValue();
        	if(settlementno == null || settlementno == ""){
        		//结算单编号规则截取
				var settlementno = "";
				var enddateyear = enddate.substr(0,4);
				var enddatemonth = enddate.substr(5,2);
				settlementno = "S-" + enddateyear + enddatemonth + "-";
				nui.ajax({
		            url: "com.primeton.eos.ame_pur.settle.getSettlementno.biz.ext",
					type: 'POST',
					data: {firstPart: settlementno},	
					contentType: 'text/json',
		            success: function (o) {
		            	o = nui.clone(o);
		            	nui.get("settlementno").setValue(o.settlementno);
		            }
		        });
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
        
        //选择合同弹窗
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
                            //选择合同默认给成本结转合同编号赋值
                            nui.get("purOutcostContnum").setValue(data.text);
                        }
                    }
                }
            });
        }
        
        //凭证年选择事件
	  	function changepzyear(){
	  		var pzyear = nui.get("pzyear").getValue();
	  		if(pzyear){
		  		var cyear = pzyear.getFullYear();
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
		  		var cyear = pzmonth.getFullYear();
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
        
        //更改结算单凭证号-修改成本结转凭证号
    	function changePzhs(){
    		var pzhs = nui.get("pzhs").getValue();
    		//凭证号数
			nui.get("purOutcostPzhs").setValue(pzhs);
    	}
    	
    	//更改结算成本确认日期-修改成本结转确认日期
    	function changeConfirmdate(){
    		var confirmdate = nui.get("confirmdate").getValue();
    		//成本确认日期
			nui.get("purOutcostConfirmdate").setValue(confirmdate);
    	}
    	
        //根据税率计算不含税金额
    	function sumtaxmon(){
    		var tax = nui.get("tax").getValue();
    		if(tax){
    			if(!isNaN(tax)){
    				//输入结算单税率，默认给结转税率赋相同的值
		    		nui.get("purOutcostTax").setValue(tax);
    				tax = tax/100;
		    		var taxmon = nui.get("setamount").getValue();
		    		if(taxmon){
		    			var notaxmon = taxmon / (1 + parseFloat(tax));
			    		notaxmon = parseFloat(notaxmon).toFixed(2);
			    		nui.get("notaxmon").setValue(notaxmon);
			    		//冲销记录成本结转金额处理
			    		//结算金额
						var setamount = nui.get("setamount").getValue();
						//计提金额
						var sumtotalpre = document.getElementById("sumtotalpre").innerHTML;
						var rate = tax;
						//成本结转金额（不含税）
						setamount = parseFloat(setamount);
						sumAccruedmoney = parseFloat(sumAccruedmoney);
						var notaxmon = parseFloat((setamount-sumAccruedmoney)/(1 + parseFloat(rate))).toFixed(2);
						nui.get("purOutcostTaxmon").setValue(parseFloat(setamount-sumAccruedmoney).toFixed(2));
						nui.get("purOutcostNotaxmon").setValue(notaxmon);
		    		}
				}else{
					nui.alert("请输入数字！");
				}
    		}else{
    			nui.get("purOutcostNotaxmon").setValue(0);
    		}
    	}
    	
    	//选择是否冲销
        function checkSure(){
        	var checkSure = nui.get("checkSure").getValue();
        	if(checkSure == "1"){
        		nui.get("purOutcostTax").setRequired(true);
        	}else{	
        		nui.get("purOutcostTax").setRequired(false);
        	}
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
    	
    	//结算最终总金额变更
    	function changeSetamount(){
    		var setamount = nui.get("setamount").getValue();
    		nui.get("purSettleSetamount").setValue(setamount);
    	}
    	
    	//结算单状态变更
    	function changedSetstatus(){
    		var setstatus = nui.get("setstatus").getValue();
    		if(setstatus == "0"){	//状态为：新增
				nui.get("checkSure").setValue(0);
        		nui.get("purOutcostTax").setRequired(false);
        		document.getElementById("field6").style.display="none";
    		}else if(setstatus == "2"){	//状态为：完成
    			nui.get("checkSure").setValue(1);
        		nui.get("purOutcostTax").setRequired(true);
        		document.getElementById("field6").style.display="block";
        		sumOutcost();
    		}
    	}
	</script>
</body>
</html>