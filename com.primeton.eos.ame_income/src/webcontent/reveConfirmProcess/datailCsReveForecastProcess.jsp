<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
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
<title>收入确认流程业务详细信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .myrow{
	        background:#E6E6E6;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<div id="workItemMemoDiv">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>当前环节处理说明</legend>
			<table style="table-layout:fixed;">
		        <tr>
		        	<td style="width:150px;" align="right">
		        		当前活动环节:
		        	</td>
		            <td style="width:250px;" id="activityInstName"></td>
		        	<td style="width:150px;" align="right">
		        		当前参与人:
		        	</td>
		            <td style="width:250px;" id="partiName"></td>
		        </tr>
		        <tr>
		        	<td style="width:150px;" align="right">
		        		当前环节处理临时说明:
		        	</td>
		            <td style="width:250px;" id="workItemMemo" colspan="3"></td>
		        </tr>
		    </table>
	    </fieldset>
    </div>
	<form id="form_ContAndReve" method="post">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>合同基本信息</legend>
			<div style="padding:5px;">
			        
			
				<table style="table-layout:fixed;" id="table_file">
				
				    
				    <tr>
						<td align="right" style="width:90px">合同名称：</td>
						<td name="csContract.projectname" id="projectname" style="width:260px" /></td>
						<td style="width:90px;" align="right">合同签署日期：</td>
        				<td style="width:260px;" id="signdate" ></td>
						<td align="right" style="width:90px">合同登记日期：</td>
						<td name="csContract.contreg" id="contreg" style="width:100px" /></td>
						
					</tr>
					<tr>
						<td align="right" style="width:90px">合同编号：</td>
						<td name="csContract.contnum" id="contnum" style="width:260px"></td>
						<td align="right" style="width:90px">客户：</td>
						<td name="csContract.custname" id="custname" style="width:260px"></td>
						<td align="right" style="width:90px">受益人：</td>
						<td name="csContract.salename" id="salename" style="width:100px"></td>
					</tr>
					<tr>
						<td align="right" style="width:90px">合同金额：</td>
						<td name="csContract.contsum" id="contsum" style="width:260px"></td>
						<td align="right" style="width:90px">已确认收入：</td>
						<td id="inconme" style="width:260px"></td>
						<td align="right" style="width:90px">收入类型：</td>
						<td name="cscontract.incometype" id="incometype" style="width:100px"></td>
					</tr>
					<tr>
	                    <td style="width:90px;" align="right">合同产品金额：</td>
	                    <td style="width:260px;"id="csContract.prodmon"></td>
	                    <td style="width:90px;" align="right">合同服务金额：</td>
	                    <td style="width:260px;"id="csContract.servmon"></td>
	                    <td style="width:90px;" align="right">合同MA金额：</td>
	                    <td style="width:100px;"id="csContract.masum"></td>
	                </tr>
	                <tr>
	                	<td style="width:90px;" align="right">已上传的文件：</td>
        				<td style="width:1000px;" id="uploadedFile" colspan='5'></td>
	                </tr>
				</table>
			</div>
	<%--	<jsp:include page="/ame_common/detailFile.jsp"/>--%>
		</fieldset>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>合同收入记录列表</legend>
            	<div id="grid_income" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="csReveForecasts"
        	 		url="com.primeton.eos.ame_income.csReveForecast.queryIncome.biz.ext" allowCellSelect="true"  showPager="false" 
        	 		multiSelect="false">
				<div property="columns">
					<div field="reveno" width="60" headerAlign="center" align="center" headerAlign="center" >收入确认次数</div>
					<div field="reveproof" width="80" headerAlign="center" align="center" headerAlign="center" renderer="dictproof">预计收入确认证据</div>
					<div field="revetimedesc" width="80" headerAlign="center" align="left" headerAlign="center">收入确认时点描述</div>
					<div field="newyearmonth" width="70" headerAlign="center" align="center" headerAlign="center" >预计确认年月</div>
<!-- 					<div field="newmonthperiod" width="65" align="center"  headerAlign="center" renderer="dictmonth">预计确认旬度</div> -->
					<div field="fcreverate" width="50" align="center" headerAlign="center" summaryType="sum" numberFormat="p1">本次确认比例</div>	
					<div field="fcsum" width="70" align="right" headerAlign="center" dataType="currency"  >预计确认金额</div>	
					<div field="status" width="70" align="center" headerAlign="center" renderer="dictstatus">目前确认状态</div>		
					<div field="actsum" width="60" align="right" headerAlign="center" summaryType="sum" dataType="currency"  >实际确认金额</div>	
					<div field="maconfirmday" width="70" align="center" headerAlign="center" >实际确认日期</div>		
					<div field="contorderno" width="70" align="center" headerAlign="center" >订单编号</div>	
					<div field="memo" width="70" align="center" headerAlign="center" >说明</div>	
<!-- 					<div field="actreveproof" width="70" align="center" headerAlign="center" renderer="dictproof">实际收入确认证据</div>		 -->
				</div>
			</div>
        </fieldset>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>收入确认信息</legend>
			<div style="padding:5px;">
				<input name="csReveForecast.reveid" id="reveid" class="nui-hidden" />
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width:120px">收入确认次数：</td>
						<td style="width:130px" name="csReveForecast.reveno" id="reveno" /></td>
						<td align="right" style="width:130px">收入类型：</td>
						<td style="width:130px" name="csReveForecast.revetype" id="revetype" /></td>
						<td align="right" style="width:130px">新合同收入类型：</td>
						<td style="width:150px" name="csReveForecast.newtype" id="newtype"/></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">预计确认年月：</td>
						<td style="width:130px" name="csReveForecast.newyearmonth" id="newyearmonth" /></td>
						<td align="right" style="width:120px">收入确认时点：</td>
						<td style="width:130px" name="csReveForecast.revetimedesc" id="revetimedesc"/></td>
						<td align="right" style="width:130px">本次确认比例：</td>
						<td style="width:150px" name="csReveForecast.fcreverate" id="fcreverate"/></td>
					</tr>
					<tr id="setyearmonth" style="display: none;">
						<td align="right" style="width:100px">本次结算开始年月：</td>
						<td style="width:130px"><input name="csReveForecast.setstart" id="setstart" readonly="readonly" class="nui-monthpicker" format="yyyyMM" style="width:120px"/></td>
						<td align="right" style="width:100px">本次结算结束年月：</td>
						<td style="width:130px"><input name="csReveForecast.setend" id="setend" readonly="readonly" class="nui-monthpicker" format="yyyyMM" style="width:150px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:110px">财报确认日期：</td>
						<td style="width:130px"><input name="csReveForecast.confirmday" id="confirmday" readonly="readonly" class="nui-datepicker" style="width:120px" /></td>
						<td align="right" style="width:130px">实际收入确认证据：</td>
						<td colspan="1" style="width:130px"><input name="csReveForecast.actreveproof" id="actreveproof" readonly="readonly" class="nui-dictcombobox" dictTypeId="MIS_INCOMECONV" multiSelect="true" style="width:200px" /></td>
						<td align="right" style="width:110px">预计收入确认证据：</td>
						<td style="width:150px" name="csReveForecast.reveproof" id="reveproof" /></td>
					</tr>
				</table>
				<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
					<legend>合同收入金额信息</legend>
						<table style="table-layout:fixed;">
							<tr>
								<td align="right" style="width:120px"></td>
								<td style="width:120px" align="left">预计确认金额</td>
								<td style="width:140px" align="center">实际确认金额</td>
								<td style="width:140px" align="center">税率</td>
								<td style="width:140px" align="center">不含税金额</td>
							</tr>
							<tr> 
								<td align="right" style="width:120px">产品：</td>
								<td style="width:120px" name="csReveForecast.productsum" id="productsum"/></td>
								<td style="width:140px"><input name="csReveForecast.actproductsum" id="actproductsum" style="width:120px" readonly="readonly" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
								<td style="width:140px"><input name="csReveForecast.productrate" id="productrate" style="width:120px" readonly="readonly" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="p0" showbutton="false"/></td>
								<td style="width:140px"><input name="csReveForecast.actproductsum2" id="actproductsum2" style="width:120px" readonly="readonly" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
							</tr>
							<tr>
								<td align="right" style="width:120px">服务：</td>
								<td style="width:120px" name="csReveForecast.servicesum" id="servicesum" /></td>
								<td style="width:140px"><input name="csReveForecast.actservicesum" id="actservicesum" style="width:120px" readonly="readonly" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
								<td style="width:140px"><input name="csReveForecast.servicerate" id="servicerate" style="width:120px" readonly="readonly" class="nui-spinner" changeOnMousewheel="false" showbutton="false" inputStyle="text-align:right;" format="p0"/></td>
								<td style="width:140px"><input name="csReveForecast.actservicesum2" id="actservicesum2" style="width:120px" readonly="readonly" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
							</tr>
							<tr>
								<td align="right" style="width:120px">MA：</td>
								<td style="width:120px" name="csReveForecast.masum" id="masum" /></td>
								<td style="width:140px"><input name="csReveForecast.actmasum" id="actmasum" style="width:120px" class="nui-spinner" readonly="readonly" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
								<td style="width:140px"><input name="csReveForecast.marate" id="marate" style="width:120px" class="nui-spinner" readonly="readonly" changeOnMousewheel="false" inputStyle="text-align:right;" format="p0" showbutton="false"/></td>
								<td style="width:140px"><input name="csReveForecast.actmasum2" id="actmasum2" style="width:120px" class="nui-spinner" readonly="readonly" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
							</tr>
							<tr>
								<td align="right" style="width:120px">总金额：</td>
								<td style="width:120px" name="csReveForecast.fcsum" id="fcsum" /></td>
								<td style="width:140px"><input name="csReveForecast.actsum" id="actsum" class="nui-spinner" readonly="readonly" changeOnMousewheel="false" style="width:120px" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
								<td style="width:140px"></td>
								<td style="width:140px"><input name="csReveForecast.actsum2" id="actsum2" style="width:120px" readonly="readonly" class="nui-spinner" changeOnMousewheel="false" inputStyle="text-align:right;" format="n2" showbutton="false" minValue="-100000000" maxValue="100000000"/></td>
							</tr>
						</table>
					</fieldset>
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:50px">说明：</td>
							<td><input name="csReveForecast.memo" id="memo" class="nui-textarea" readonly="readonly" height="100px" style="width:850px"/></td>
						</tr>
						<tr>
							<td align="left" colspan="2">
								<input class="nui-checkbox" id="isCLoseProject"  name="csReveForecast.isCLoseProject" style="width:150px" text="收入确认完成后关闭项目" readonly="readonly" >
							</td>
						</tr>
					</table>
			</div>
			<div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;" id="innerHtml">
		                    	收入记录相关附件
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>
			<div id="grid_1" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="15" >编号</div>
					<div field="fileName"width="50" headerAlign="center" align="center" renderer="getfiledetail">附件名称</div>
					<div field="fileType" width="50" align="center" headerAlign="center" >附件类型</div>
					<div field="operatorname" width="50"headerAlign="center" align="center">操作员名称</div>
					<div field="fileTime" width="50" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
				</div>
			</div>
		</fieldset>
	</form>
	<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
		<legend>合同对应收款数据</legend>
		<div  class="nui-tabs" style="width:100%;" activeIndex="0">
			<div title="该合同对应收款情况" style="width:100%;">
				<div id="grid_csGatherFc" class="nui-datagrid" style="width:100%;height:auto" dataField="csGatherFcs" showSummaryRow="true" ondrawsummarycell="doCountSum"
			    	url="com.primeton.eos.ame_income.csReveForeProcess.queryCsGahterFcByContnum.biz.ext" showPager="false">
					<div property="columns">
						<div type="indexcolumn" width="25"></div>
						<div field="gatherno" width="60" align="center"  headerAlign="center" renderer="detailGather">收款次数</div>
						<div field="fcsum" width="130" align="right" headerAlign="center" dataType="currency" summaryType="sum">预计收款金额（含税）</div>	
						<div field="fcsum2" width="140" align="right" headerAlign="center" dataType="currency" summaryType="sum" >预计收款金额（不含税）</div>	
						<div field="newyearmonth" width="85" align="center"  headerAlign="center">预计收款年月</div>
						<div field="status" width="120" align="center" headerAlign="center" renderer="dictGatherStatus">收款状态</div>		
						<div field="confirmday" width="80" align="center" headerAlign="center" >实际收款日期</div>
						<div field="actsum" width="130" align="right" headerAlign="center" dataType="currency" summaryType="sum" >实际收款金额（含税）</div>	
						<div field="actsum2" width="140" align="right" headerAlign="center" dataType="currency" summaryType="sum" >实际收款金额（不含税）</div>	
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
			<div>
		</div>
	</fieldset>
	<div id="form_purChaseYesOrNo">
		<table style="table-layout:fixed;">
			<tr>
				<td style="width:215px;" align="right">是否有暂未签署或未报备采购：</td>
				<td style="width:140px;">  
					<input id="purChaseYesOrNo" class="nui-dictcombobox"  style="width:80px;" required="true" dictTypeId="MIS_YN" readonly="readonly" onvaluechanged="changepurChase" />
				</td>
			</tr>
		</table>
	</div>
        <fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
			<legend>未签署采购/未计提情况报备</legend>
	    	<div id="grid_otherPurchase" class="nui-datagrid" style="width:100%;height:auto;" allowCellSelect="true" showSummaryRow="true" 
	        	showPager="false" allowCellEdit="false"  multiSelect="true" ondrawsummarycell="doCountSum" >
	            <div property="columns">
	            	<div type="indexcolumn" width="50" align="center" headerAlign="center" cellCls="myIndex">编号</div>
	                <div field="custname" width="200" displayField="custname" align="left" headerAlign="center">供应商
						<input property="editor" class="nui-buttonedit" onbuttonclick="selectSupplier" style="width:100%;"/>
					</div>
	                <div field="purtype" width="150" align="center" headerAlign="center" renderer="dictContType">采购类型
						<input property="editor" class="nui-dictcombobox"  dictTypeId="AME_CONTYPE"/>
					</div>
	                <div field="money"  width="150" align="right"  headerAlign="center" dataType="currency" summaryType="sum">未签署采购/未计提金额
						<input property="editor" class="nui-spinner" allowLimitValue="false" increment="0" inputStyle="text-align:right;" showbutton="false"/>
					</div>
	                <div field="memo"  width="250" align="left" headerAlign="center">说明
						<input property="editor" class="nui-textbox" />
					</div>
	            </div>
	        </div>
		</fieldset>
		<br/>
		<fieldset id="field55" style="border:solid 1px #aaa;padding:3px;">
	       <legend>核查要点信息</legend>
	       <jsp:include page="/ame_common/csIncomecheck/showIncomeCheck.jsp"/>	
        </fieldset>
	<jsp:include page="/ame_common/misOpinion.jsp"/>
</div>
<script type="text/javascript">
    nui.parse();
  	var form_ContAndReve = new nui.Form("form_ContAndReve");
  	var grid_income = nui.get("grid_income");
  	var grid_AllCheck = nui.get("grid_AllCheck");
  	var grid_1 = nui.get("grid_1");//预估附件
  	
  	var grid_csGatherFc = nui.get("grid_csGatherFc");
  	var grid_csContractCost = nui.get("grid_csContractCost");
	var grid_otherPurchase = nui.get("grid_otherPurchase");
	<%
	long processInstID = Long.parseLong(request.getParameter("processInstID")); 
	%>
	function dictproof(e) {
		return nui.getDictText('MIS_INCOMECONV',e.value);//设置业务字典值
	}
	function dictmonth(e) {
		return nui.getDictText('AME_MONTHPERIOD',e.value);//设置业务字典值
	}
	function dictstatus(e) {
		return nui.getDictText('AME_REVESTATUS',e.value);//设置业务字典值
	}
	function checkBoxRenderer(e){
		var str = "";
		if(e.value==1){
			str = "<input name='ischeck' type='checkbox' align='center' value='1'  checked='checked' disabled/>"
		}else if(e.value==0){
			str = "<input name='ischeck' type='checkbox' align='center' value='1'  disabled/>";
		}
		return  str;
	}
	function isCancheckRenderer(e){
		if(e.value==0){
			e.rowCls = "myrow";//修改背景颜色样式
		}
	}
    var projectid="";
    loadData();
	function loadData(){
		document.getElementById("opinionHide").style.display="none";
		var data={processInstID:<%=processInstID %>};
		var json=nui.encode(data);
		nui.ajax({
			url:"com.primeton.eos.ame_income.csReveForeProcess.queryEveForeProcess.biz.ext",
			type:"post",
			data:json,
			contentType:"text/json",
			success:function (o){
			console.log(o);
				//合同预估表基本信息
				form_ContAndReve.setData(o);
				//合同基本信息
            	document.getElementById("projectname").innerHTML = o.csContract.projectname == null ?"":o.csContract.projectname;
            	document.getElementById("contnum").innerHTML = o.csContract.contnum == null ?"":o.csContract.contnum;
            	document.getElementById("contsum").innerHTML = o.csContract.contsum == null ?"":formatNumber(o.csContract.contsum,'#,##.##');
            	document.getElementById("salename").innerHTML = o.csContract.salename == null ?"":o.csContract.salename;
            	document.getElementById("signdate").innerHTML = o.csContract.signdate == null ?"":o.csContract.signdate;
            	document.getElementById("contreg").innerHTML = o.csContract.contreg == null ?"":o.csContract.contreg;
				document.getElementById("incometype").innerHTML = nui.getDictText('MIS_HTINCOMETYPE',o.csContract.incometype);
            	document.getElementById("custname").innerHTML = o.csContract.misCustinfo.custname == null ?"":o.csContract.misCustinfo.custname;
            	document.getElementById("csContract.servmon").innerHTML = o.csContract.servmon== null ?"":formatNumber(o.csContract.servmon,'#,##.##');
                document.getElementById("csContract.prodmon").innerHTML = o.csContract.prodmon== null ?"":formatNumber(o.csContract.prodmon,'#,##.##');
                document.getElementById("csContract.masum").innerHTML = o.csContract.masum== null ?"0":formatNumber(o.csContract.masum,'#,##.##');
            	//预估基本信息
		    	document.getElementById("revetimedesc").innerHTML = o.csReveForecast.revetimedesc== null ?"":o.csReveForecast.revetimedesc;
		    	document.getElementById("newyearmonth").innerHTML = o.csReveForecast.newyearmonth== null ?"":o.csReveForecast.newyearmonth;
		    	document.getElementById("reveno").innerHTML = o.csReveForecast.reveno== null ?"":o.csReveForecast.reveno;
		    	document.getElementById("revetype").innerHTML = nui.getDictText('AME_REVETYPE',o.csReveForecast.revetype);
		    	document.getElementById("newtype").innerHTML = nui.getDictText('AME_NEWTYPE',o.csReveForecast.newtype);
		    	document.getElementById("reveproof").innerHTML = nui.getDictText('MIS_INCOMECONV',o.csReveForecast.reveproof);
				document.getElementById("fcreverate").innerHTML = o.csReveForecast.fcreverate== null ?"":parseFloat(o.csReveForecast.fcreverate*100).toFixed(1)+"%";
		    	document.getElementById("fcsum").innerHTML = o.csReveForecast.fcsum== null ?"":formatNumber(o.csReveForecast.fcsum,'#,##.##');
                document.getElementById("productsum").innerHTML = o.csReveForecast.productsum== null ?"0":formatNumber(o.csReveForecast.productsum,'#,##.##');
		    	document.getElementById("servicesum").innerHTML = o.csReveForecast.servicesum== null ?"0":formatNumber(o.csReveForecast.servicesum,'#,##.##');
		    	document.getElementById("masum").innerHTML = o.csReveForecast.masum== null ?"0":formatNumber(o.csReveForecast.masum,'#,##.##');
                //判断收入类型是否包含人力服务收入
	        	var revetype = o.csReveForecast.revetype;
	        	if(revetype.indexOf('5') >= 0){
					document.getElementById("setyearmonth").style.display = "";
					var setstart = o.csReveForecast.setstart;
	            	var setend = o.csReveForecast.setend;
	            	var setstart1 = null;
	           		var setend1 = null;
	            	if(setstart != "" && setstart != null){
	            		setstart1 = setstart.substring(0,4)+"-"+setstart.substring(4,6);
	            	}
	            	if(setend != "" && setend != null){
	            		setend1 = setend.substring(0,4)+"-"+setend.substring(4,6);
	            	}
	            	nui.get("setstart").setValue(setstart1);
	            	nui.get("setend").setValue(setend1);
				}else{
					document.getElementById("setyearmonth").style.display = "none";
				}
                
                projectid = o.csContract.projectid;
                //合同附件查询
				<%--var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"CS_CONTRACT","relationid":o.csContract.contractid});
				grid_0.sortBy("fileTime","desc");--%>
				nui.ajax({
	                url: "com.primeton.eos.ame_common.file.getFiles.biz.ext",
	                data: {relationid:o.csContract.contractid,groupid:"CS_CONTRACT"},
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
				//预估列表查询(默认勾选所选记录)
				grid_income.load({contnum:o.csContract.contnum});
				grid_income.on("drawcell", function (e) {
		            var record = e.record,
			        column = e.column,
			        field = e.field,
			        value = e.value;
	            	if(record.reveid == nui.get("reveid").getValue()){
		            	e.cellStyle = "background: yellow";
	            	}
		        });
				//预估附件查询
				var grid_1 = nui.get("grid_1");
				grid_1.load({"groupid":"csReveForecast","relationid":o.csReveForecast.reveid});
				grid_1.sortBy("fileTime","desc");
            	//查询收入确认金额
				nui.ajax({
		            url: "com.primeton.eos.ame_income.csReveForeProcess.querySumIncome.biz.ext",
		            data: {contnum:o.csContract.contnum},
		            type: 'POST',
		            cache: false,
		            contentType: 'text/json',
		            success: function (text) {
		            	document.getElementById("inconme").innerHTML = text.sum;
		            },
		            error: function (jqXHR, textStatus, errorThrown) {
		                alert(jqXHR.responseText);
		                CloseWindow();
		            }
		        });
        		//checklist所需参数processInstID、activityInstID、incomeType、checkObj
	        	showIncomeCheck(o.csReveForecast.processinstid);
        		
		        //查询审核意见
				var grid = nui.get("datagrid1");
				grid.load({processInstID:<%=processInstID %>});
				grid.sortBy("time", "desc");
				
            	
            	grid_csGatherFc.setData(o.csGatherFcs);
            	grid_csContractCost.load({criteria:{_expr:[{_property:"contnum",_op:"=",_value:o.csContract.contnum},
	        											   {_property:"rlny",_op:"between",_min: o.csReveForecast.setstart,_max: o.csReveForecast.setend }
	        											  ]
	    											}
										});
	            grid_otherPurchase.setData(o.otherPurchases);
	            
	            //这个流程没有领导会签，所以resultWorkItem只会有一条记录，不需要做处理
	            if(o.resultWorkItem[0]){
		            document.getElementById("activityInstName").innerHTML = o.resultWorkItem[0].activityInstName== null ?"":o.resultWorkItem[0].activityInstName;
		            document.getElementById("partiName").innerHTML = o.resultWorkItem[0].partiName== null ?"":o.resultWorkItem[0].partiName;
		            document.getElementById("workItemMemo").innerHTML = o.workItemMemo== null ?"":o.workItemMemo;
	            }else{
	            	document.getElementById("workItemMemoDiv").style.display="none";
	            }
	            nui.get("purChaseYesOrNo").setValue(o.purChaseYesOrNo);
	            changepurChase();
			},
			error:function(){}
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
    //附件下载
    function getfiledetail(e){
    	return "<a href='javascript:void(0)' onclick='checkfiledetail();' title='点击查看'>" + e.value + "</a>";
    }
    function checkfiledetail(){
    	var grid = nui.get("grid_1");
    	var selectRow = grid.getSelected();
    	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
		window.open(url, '_self');
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
		
	function dictContType(e){
		return nui.getDictText('AME_CONTYPE',e.value);
	}
    function dictGatherStatus(e){
    	return nui.getDictText("AME_GATHERSTATUS",e.value);
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
        }
        //合同成本人力成本明细
        function concostDetail(e){
        	if(e.value == 0 || e.value == null){
        		return e.value;
        	}else
        	{
        		return "<a href='javascript:void(0)' onclick='doViewconcost(\""+e.record.contnum+"\",\""+e.record.rlny+"\");' title='点击查看'>" + e.value + "</a>";
    		}
		}
		function doViewconcost(contnum,rlny){
			var startdate = rlny.substring(0,4)+'-'+rlny.substring(4,6)+'-01';
			var enddate = rlny.substring(0,4)+'-'+rlny.substring(4,6)+'-'+getLastDayOfMonth(rlny.substring(0,4),rlny.substring(4,6));
			var executeUrl = "/default/ame_budget/detailPempcost.jsp?contnum=" + contnum+"&startdate_f="+startdate+"&enddate_f="+enddate;
			window.open(executeUrl, "人力成本明细", "fullscreen=1");
		}
		//直接费用明细
		function directsumDetail(e){
			if(e.value == 0 || e.value == null){
        		return e.value;
        	}else
        	{
			 return "<a href='javascript:void(0)' onclick='doViewdirectsum(\""+e.record.contnum+"\",\""+e.record.rlny+"\");' title='点击查看'>" + e.value + "</a>";
			}
		}
		function doViewdirectsum(contnum,rlny){
			var startdate = rlny.substring(0,4)+'/'+rlny.substring(4,6)+'/01';
			var enddate = rlny.substring(0,4)+'-'+rlny.substring(4,6)+'-'+getLastDayOfMonth(rlny.substring(0,4),rlny.substring(4,6));
			var executeUrl = "/default/ame_budget/detailPdircost.jsp?contnum=" + contnum+"&startdate="+startdate+"&enddate="+enddate;
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
