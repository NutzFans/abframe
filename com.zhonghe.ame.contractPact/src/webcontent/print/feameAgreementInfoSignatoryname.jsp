<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<style type="text/css">
	html, body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }    
    .mini-grid-cell-nowrap{
		white-space: nowrap;
	}
</style>
<head>
<title>收付费合同信息</title>
</head>
<body>
<div  id="form1">
<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.payContract.payContract.ZhPayContractEntity"/>
</div>

	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		<p style="color: red;font-weight: bold;"  align="center">付费合同信息:</p>
    </div>
<div class="nui-fit">
    <div id="datagrid1" sizeList="[10,20,50,100]" showPager="true" dataField="data" 
    	showSummaryRow="true"  pageSize="10" align="left"
    	class="nui-datagrid" style="width:100%;height:100%;" 
    	allowSortColumn=true multiSelect="true" allowSortColumn=true frozenStartColumn="0" frozenEndColumn="6" url="com.zhonghe.ame.payContract.payContract.payContractAll.biz.ext">
        <div property="columns">
        <div type="checkcolumn"></div>
        <div field="id" headerAlign="center" allowSort="true" visible="false">id</div>
        <div type="indexcolumn" width="40" align="center" headerAlign="center">序号</div>
        	<div field="createUsername" width="60"  headerAlign="center" allowSort="true" >申请人</div>
        	 <div field="implementOrgname" width="120"  headerAlign="center" allowSort="true" >合同承办部门</div>
        	 <div field="contractNo" width="180" headerAlign="center" allowSort="true" >合同编号</div>
        	 <div field="contractName" width="250"  headerAlign="center" allowSort="true" renderer="lookInfo">合同名称</div>
        	 <div field="contractSum" width="120"  headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同金额（元）</div>
        	 <div field="finalSum" width="140" dataType="currency"  headerAlign="center" allowSort="true" >合同最终金额（元）</div>
        	 <div field="noTaxSum" width="150" dataType="currency" headerAlign="center" allowSort="true" >合同不含税金额（元）</div>
        	 <div field="payTax" width="120" dataType="currency" headerAlign="center" allowSort="true" >税额（元）</div>
        	 <div field="contractBalance" dataType="currency" width="120"  headerAlign="center" allowSort="true" summaryType="sum">合同余额（元）</div>
        	 <div field="executeStatus"    headerAlign="center" allowSort="true" renderer="EXECUTE_STATUS" >执行状态</div>
        	 <div field="appStatus"    headerAlign="center" allowSort="true" renderer="onActionRenderer" >审批状态</div>
        	  <div field="signatoryname" width="190"  headerAlign="center" allowSort="true" >签约方</div>
        	 <div field="contractSubject"    headerAlign="center" allowSort="true" renderer="PAYER" >合同签约主体</div>
        	 <div field="payer" width="150"  headerAlign="center" allowSort="true" renderer="PAYER">付款方</div>
        	 <div field="signingDate"  dateFormat="yyyy-MM-dd" width="90"   headerAlign="center" >签订日期</div>
        	 <div field="contractType" width="120"  headerAlign="center" allowSort="true"  renderer="zhContractType">合同类型</div>
        	 <div field="contractSecretLevel" width="120"  headerAlign="center" allowSort="true"  renderer="CONTRACT_SECRET_LEVEL">合同密级</div>
        	 <div field="projectSecretLevel" width="120"  headerAlign="center" allowSort="true"  renderer="PROJECT_SECRET_LEVEL">项目密级</div>
        	 <div field="issm" width="180"  headerAlign="center" allowSort="true"  renderer="ABF_YESORNO">是否为SM协作配套</div>
        	 <div field="issupagreement" width="120"  headerAlign="center" allowSort="true"  renderer="ABF_YESORNO">是否为补充协议</div>
        	 <div field="contractNature" width="120"  headerAlign="center" allowSort="true"  renderer="CONTRACT_NATURE">合同性质</div>
        	 <div field="contractPrice" width="120"  headerAlign="center" allowSort="true"  renderer="CONTRACT_PRICE">合同价款形式</div>
        	 <div field="planYear" width="120"  headerAlign="center" allowSort="true" >采购计划年份</div>
        	 <div field="budgetSum" width="150"  dataType="currency" headerAlign="center" allowSort="true" >合同预算金额（元）</div>
        	 <div field="markType" width="120"  headerAlign="center" allowSort="true"  renderer="MARK_TYPE">标的类型</div>
        	 <div field="intype" width="120"  headerAlign="center" allowSort="true"  renderer="INTYPE">集采类型</div>
        	 <div field="procurementType" width="120"  headerAlign="center" allowSort="true"  renderer="PROCUREMENT_TYPE">采购方式</div>
        	 <div field="supplierSource" width="120"  headerAlign="center" allowSort="true"  renderer="SUPPLIER_SOURCE">供应商来源</div>
        	 <div field="iselectronic" width="120"  headerAlign="center" allowSort="true"  renderer="ABF_YESORNO">是否电子采购</div>
        </div>
    </div>
</div>

<div  id="form2">
<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContractEntity"/>
</div>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		<p style="color: red;font-weight: bold;"  align="center">收费合同信息:</p>
    </div>
    <div class="nui-fit">
    <div id="datagrid2" sizeList="[10,20,50,100]" showPager="true" dataField="data" 
    	showSummaryRow="true"  pageSize="10"
    	class="nui-datagrid" style="width:100%;height:450px;" 
    	multiSelect="true" allowSortColumn=true frozenStartColumn="0" frozenEndColumn="5" url="com.zhonghe.ame.chargeContract.chargeContract.queryChargeContractAll.biz.ext">
        <div property="columns">
        <div name="temp123" type="checkcolumn"></div>
        <div type="indexcolumn" width="40" align="center" headerAlign="center">序号</div>
        	<div field="createUsername" width="100" align="center" headerAlign="center" allowSort="true" >合同经办人</div>
        	<div field="implementOrgname" width="120"  headerAlign="center" allowSort="true" >合同承办部门</div>
        	<div field="contractNo" width="180" headerAlign="center" allowSort="true" >合同编号</div>
        	<div field="contractName" width="150" align="center" headerAlign="center" allowSort="true" renderer="lookInfo1">合同名称</div>
        	<div field="contractSum" width="120" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同金额</div>
        	<div field="finContractSum" width="150" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同最终金额（元）</div>
        	<div field="noTaxSum" width="150" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同不含税金额（元）</div>
            <div field="payTax" width="120" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">税额（元）</div>
            <div field="contractBalance" width="120" align="center" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">合同余额（元）</div>
        	<div field="executeStatus" width="80" align="center" headerAlign="center" allowSort="true"  renderer="EXECUTE_STATUS">执行状态</div>
        	<div field="appStatus"  align="center" headerAlign="center" allowSort="true" renderer="onActionRenderer" >审批状态</div>
        	<div field="signatoryName" width="190" align="center" headerAlign="center" allowSort="true" >签约方</div>
        	<div field="contractSubject" width="120" align="center" headerAlign="center" allowSort="true"  renderer="PAYER">合同签约主体</div>
       		<div field="payee" width="80" align="center" headerAlign="center" allowSort="true"  renderer="PAYER">收款方</div>
        	<div field="signingDate"  dateFormat="yyyy-MM-dd" width="90"   headerAlign="center" >签订日期</div>
        	<div field="contractSecretLevel" width="80" align="center" headerAlign="center" allowSort="true"  renderer="CONTRACT_SECRET_LEVEL">合同密级</div>
        	<div field="projectSecretLevel" width="80" align="center" headerAlign="center" allowSort="true"  renderer="PROJECT_SECRET_LEVEL">项目密级</div>
            <div field="isfb" width="120" align="center" headerAlign="center" allowSort="true"  renderer="ABF_YESORNO">是否计划对外分包</div>
        	<div field="issupagreement"  align="center" headerAlign="center" allowSort="true" renderer="ABF_YESORNO" >是否协议变更</div>
        	<div field="major" width="80" align="center" headerAlign="center" allowSort="true"  renderer="ZH_MAJOR_TYPE">专业类别</div>
        	<div field="projectType" width="80" align="center" headerAlign="center" allowSort="true"  renderer="ZH_PROJECT_TYPE">工程类别</div>
        	<div field="headquarterGroup" width="80" align="center" headerAlign="center" allowSort="true"  renderer="ZH_GROUP">集团内外</div>
        	<div field="contractModel" width="100" align="center" headerAlign="center" allowSort="true"  renderer="CONTRACT_MODEL">合同价格模式</div>
        	<div field="procurementType" width="150" align="center" headerAlign="center" allowSort="true"  renderer="ZH_PROCUREMENT_TYPE">招标人采购方式</div>
        </div>
        </div>
		</div>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	var form1 = new nui.Form("#form2");
    	var grid1 = nui.get("datagrid2");
    	var type = <%=request.getParameter("type")%>;
		var reve_grid = nui.get("reve_grid");
    	var json=nui.encode({"iden": "1","expseq": null,"feeseq": null,"parentfeetypeid": null});
    	setData();
    	setData1();
    	
		function check(e){
			if(e.value==1){
			return "是";
			}else{
			return "否";
			}
		}
		function setData(){
			signatoryname = "<%= request.getParameter("signatoryname") %>" ;
			// 此时按照form 表单提交样式，自行组装请求体，将传递数据
			var json = {
						"critria": {
							"_entity": "com.zhonghe.ame.payContract.payContract.ZhPayContractEntity",
							"_expr": [{
									"_op": "like",
									"_property": "signatoryname",
									"_value": signatoryname
								}
							]
						}
					}
			grid.sortBy("createTime", "desc");
			grid.load(json);
			
		}
		
		function setData1(){
			signatoryName = "<%= request.getParameter("signatoryname") %>" ;
			var json = {
						"critria": {
							"_entity": "com.zhonghe.ame.chargeContract.chargeContract.ZhChargeContractEntity",
							"_expr": [{
									"signatoryName": signatoryName,
								}
							]
						}
					}
			grid1.sortBy("createTime", "desc");
			grid1.load(json);
		}
		
		function dictGetType(e){
			return nui.getDictText('EXP_EXPTYPE',e.value);
		}
		function dictGetStatus(e){
			return nui.getDictText('EXP_CHECKFLAG',e.value);
		}
		 
		/* function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.sortBy("createTime","desc");
		  	grid.load(data); //datagrid加载数据
		}
		function search1() {
			var form1 = new nui.Form("#form2");
			var data = form1.getData(); //获取表单JS对象数据
			grid1.sortBy("createTime","desc");
		  	grid1.load(data); //datagrid加载数据
		} */
		function isStr(str, val) {
		  if (str.indexOf(val) != -1) {
		    return true
		  } else {
		    return false
		  }
  		}
	function lookInfo(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}
	    function doView(){
			var row = grid.getSelected();
			if (row) {
				executeUrl = "<%= request.getContextPath() %>/contractPact/print/payContractListPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			}else {
				showTips("请选中一条记录");
			}
			
// 			  	nui.open({
// 			  		url : url,
// 			        width:'100%', 
// 			        height: '100%',
// 			       onload: function () {
// 			       	var iframe = this.getIFrameEl();
// 						iframe.contentWindow.setViewData(selectRow);
// 			       },
// 			       ondestroy: function (action) {
// 			       	search();
// 			       }
// 			  	});
		}	
	function lookInfo1(e) {
			return "<a href='javascript:void(0)' onclick='doView1();' title='点击查看'>" + e.value + "</a>";
		}
	    function doView1(){
			var row = grid1.getSelected();
			if (row) {
				executeUrl = "<%= request.getContextPath() %>/contractPact/print/chargeContractInfoPrint.jsp?id=" + row.id;
				window.open(executeUrl);
			}else {
				showTips("请选中一条记录");
			}
		}
	function zhContractType(e) {
		return nui.getDictText("ZH_CONTRACT_TYPE", e.value);
	}
	
	function zhInvoiceNameType(e) {
		return nui.getDictText("ZH_INVOICE_NAME_TYPE", e.value);
	}
	
	function zhFlowType(e) {
		return nui.getDictText("ZH_FLOW_TYPE", e.value);
		onActionRenderer();
	}
	function zhIsSupagreement(e) {
		return nui.getDictText("ZH_ISSUPAGREEMENT", e.value);
	}
	
	function ORGANIZER(e) {
		return nui.getDictText("ORGANIZER", e.value);
	}
	function EXECUTE_STATUS(e) {
		return nui.getDictText("EXECUTE_STATUS", e.value);
	}
	function PAYER(e) {
		return nui.getDictText("PAYER", e.value);
	}
	function CONTRACT_SECRET_LEVEL(e) {
		return nui.getDictText("CONTRACT_SECRET_LEVEL", e.value);
	}
	function PROJECT_SECRET_LEVEL(e) {
		return nui.getDictText("PROJECT_SECRET_LEVEL", e.value);
	}
	function ABF_YESORNO(e) {
		return nui.getDictText("ABF_YESORNO", e.value);
	}
	function CONTRACT_NATURE(e) {
		return nui.getDictText("CONTRACT_NATURE", e.value);
	}
	function CONTRACT_PRICE(e) {
		return nui.getDictText("CONTRACT_PRICE", e.value);
	}
	function MARK_TYPE(e) {
		return nui.getDictText("MARK_TYPE", e.value);
	}
	function INTYPE(e) {
		return nui.getDictText("INTYPE", e.value);
	}
	function PROCUREMENT_TYPE(e) {
		return nui.getDictText("PROCUREMENT_TYPE", e.value);
	}
	function SUPPLIER_SOURCE(e) {
		return nui.getDictText("SUPPLIER_SOURCE", e.value);
	}
	function onActionRenderer(e) {
            var record = e.record;
        	var processId=record.processid;
			var s = "<a  href='javascript:void(0)' onclick='feeView();' >"+nui.getDictText('ZH_FLOW_TYPE', e.value)+"</a>";
            return s;
    }
    function ZH_MAJOR_TYPE(e) {
		return nui.getDictText("ZH_MAJOR_TYPE", e.value);
	}
	function ZH_PROJECT_TYPE(e) {
		return nui.getDictText("ZH_PROJECT_TYPE", e.value);
	}
	function CONTRACT_MODEL(e) {
		return nui.getDictText("CONTRACT_MODEL", e.value);
	}
	function ZH_GROUP(e) {
		return nui.getDictText("ZH_GROUP", e.value);
	}
	function ZH_PROCUREMENT_TYPE(e) {
		return nui.getDictText("ZH_PROCUREMENT_TYPE", e.value);
	}
</script>
</body>
</html>