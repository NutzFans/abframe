<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
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
<title>供应商详细信息</title>
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script src="../common/nui/nui.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
<script type="text/javascript" src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
<div id="tabs1" class="nui-tabs" activeIndex="0" style="width:auto;height:100%">
	<div title="供应商信息">
		<div class="nui-fit">
		 	<form id="form1" method="post" >
		        <div id="custname">&nbsp;</div>
		        <input name="purSupplier.custid" id="custid1" class="nui-hidden" />
		        <input name="purSupplier.processinstid" id="processinstid" class="nui-hidden" />
		        <fieldset style="border:solid 1px #aaa;padding:3px;">
		        	<legend>基本资料</legend>
		        	<table style="table-layout:fixed;" id="table_file1">
				            <tr>
								<td align="right" style="width:160px">供应商名称：</td>
								<td id="purSupplier.custname" style="width:250px"></td>
								<td align="right" style="width:160px">供应商编号：</td>
								<td id="purSupplier.custnum" style="width:250px" ></td>	
								<td align="right" style="width:160px">供应商类型：</td>
								<td id="purSupplier.custtype" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">供应商简称：</td>
								<td id="purSupplier.suppliersname" style="width:250px"></td>
								<td align="right" style="width:160px">状态：</td>
								<td id="purSupplier.status" style="width:250px"></td>
								<td align="right" style="width:160px">注册地所在城市：</td>
								<td id="purSupplier.registcity" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">法人代表：</td>
								<td id="purSupplier.legalperson" style="width:250px"></td>
								<td align="right" style="width:160px">注册资本(万元)：</td>
								<td id="purSupplier.registercap" style="width:250px"></td>
								<td align="right" style="width:160px">实收资本(万元)：</td>
								<td id="purSupplier.cappay"  style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">成立日期：</td>
								<td id="purSupplier.estabdate" style="width:250px"></td>
								<td align="right" style="width:160px">企业性质：</td>
								<td id="purSupplier.custnature" style="width:250px"></td>
								<td align="right" style="width:160px">员工总数：</td>
								<td id="purSupplier.empsize" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">是否一般纳税人：</td>
								<td id="purSupplier.istaxpayer" style="width:250px"></td>
								<td align="right" style="width:160px">营业执照注册号：</td>
								<td id="purSupplier.license" style="width:250px"></td>
								<td align="right" style="width:160px">营业执照到期日：</td>
								<td id="purSupplier.licenseenddate" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">创建人：</td>
								<td id="purSupplier.createUsername" style="width:250px"></td>
								<td align="right" style="width:160px">创建时间：</td>
								<td id="purSupplier.createDate" style="width:250px"></td>
								<td align="right" style="width:160px" id="a1">普元联系人：</td>
								<td id="purSupplier.infoprovider"  style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px" id="a2">普元联系电话：</td>
								<td id="purSupplier.telephone" style="width:250px"></td>
								<td align="right" style="width:160px">供应商联系人：</td>
								<td id="purSupplier.linkman"  style="width:250px"></td>
								<td align="right" style="width:160px">供应商联系电话：</td>
								<td id="purSupplier.linktel"  style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">供应商联系邮箱：</td>
								<td id="purSupplier.linkmail" style="width:250px"></td>
								<td align="right" style="width:160px">供应商邮编：</td>
								<td id="purSupplier.postcode" style="width:250px"></td>
								<td align="right" style="width:160px">供应商传真：</td>
								<td id="purSupplier.fax" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">本地化服务城市：</td>
								<td id="purSupplier.locservcity" style="width:250px"></td>
								<td align="right" style="width:160px" id="a4">对应客户：</td>
								<td id="purSupplier.dycustid" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">供应商联系地址：</td>
								<td id="purSupplier.address"style="width:auto" ></td>
								<td align="right" style="width:160px">入围标志：</td>
								<td id="purSupplier.inflag" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">注册地址：</td>
								<td colspan="5" id="purSupplier.registaddress" style="width:auto"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">公司网址：</td>
								<td colspan="5" id="purSupplier.website"  style="width:auto"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">供应商说明：</td>
								<td colspan="5" id="comments" style="width:auto;font-size:12px;"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px" id="a3">对应的U8供应商：</td>
								<td colspan="1" id="purSupplier.cvenname" style="width:250px"></td>
								<td align="right" style="width:160px">推荐指数：</td>
								<td colspan="3" id="purSupplier.reindex" style="width:auto"></td>
							</tr>
		        	</table>
		        </fieldset>
		        <fieldset style="border:solid 1px #aaa;padding:3px;">
					<legend>公司业务情况</legend>
					<table>
						<tr>
							<td align="right" style="width:160px">公司简介：</td>
							<td colspan="5" id="purSupplier.compdesc"  style="width:auto"></td>
						</tr>
						<tr>
							<td align="right" style="width:160px">主营产品：</td>
							<td colspan="5" id="purSupplier.mainprod"  style="width:auto"></td>
						</tr>
						<tr>
							<td align="right" style="width:160px">代理产品：</td>
							<td colspan="5" id="purSupplier.agentprod"   style="width:auto"></td>
						</tr>
					</table>
				</fieldset>
	        	<fieldset style="border:solid 1px #aaa;padding:3px;">
					<legend>账户信息</legend>
		        	<table style="table-layout:fixed;" id="table_file2">
		        		<tr>
							<td align="right" style="width:160px">户名：</td>
							<td id="purSupplier.accoutname" style="width:250px"></td>
							<td align="right" style="width:160px">开户银行：</td>
							<td id="purSupplier.accoutbank" style="width:250px"></td>
							<td align="right" style="width:160px">税号：</td>
							<td id="purSupplier.taxno" style="width:250px"></td>
						</tr>
						<tr>
							<td align="right" style="width:160px">账号：</td>
							<td id="purSupplier.accountid"  style="width:250px"></td>
						</tr>
					</table>
				</fieldset>
		        <fieldset style="border:solid 1px #aaa;padding:3px;" id="fieldfee">
		        	<legend>财务状况</legend>
						<table style="table-layout:fixed;" id="table_file2">
							<tr>
								<td align="right" style="width:160px">年度：</td>
								<td id="purSupplier.lastyear" style="width:250px"></td>
								<td align="right" style="width:160px">年度：</td>
								<td id="purSupplier.twoago" style="width:250px"></td>
								<td align="right" style="width:160px">年度：</td>
								<td id="purSupplier.threeago" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">营业收入(万元)：</td>
								<td id="purSupplier.lastyearincome"   style="width:250px"></td>
								<td align="right" style="width:160px">营业收入(万元)：</td>
								<td id="purSupplier.twoagoincome"  style="width:250px"></td>
								<td align="right" style="width:160px">营业收入(万元)：</td>
								<td id="purSupplier.threeagoincome" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">利润总和(万元)：</td>
								<td id="purSupplier.lastyearprofit"  style="width:250px"></td>
								<td align="right" style="width:160px">利润总和(万元)：</td>
								<td id="purSupplier.twoagoprofit"  style="width:250px"></td>
								<td align="right" style="width:160px">利润总和(万元)：</td>
								<td id="purSupplier.threeagoprofit"  style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">固定资产原值：</td>
								<td id="purSupplier.lastproperty"  style="width:250px"></td><td></td><td></td><td></td><td></td>
							</tr>
							<tr>
								
								<td align="right" style="width:160px">固定资产净值：</td>
								<td id="purSupplier.lastpropertynet" style="width:250px"></td><td></td><td></td><td></td><td></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">流动资金：</td>
								<td id="purSupplier.lastfloat"  style="width:250px"></td><td></td><td></td><td></td><td></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">长期负债：</td>
								<td id="purSupplier.lastlongdebt"   style="width:250px"></td><td></td><td></td><td></td><td></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">短期负债：</td>
								<td id="purSupplier.lastshortdebt"   style="width:250px"></td><td></td><td></td><td></td><td></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">净利润：</td>
								<td id="purSupplier.lastnetprofit"  style="width:250px"></td><td></td><td></td><td></td><td></td>
							</tr>
						</table>
		        </fieldset>
		        <fieldset style="border:solid 1px #aaa;padding:3px;">
		        	<legend>资质和凭证</legend>
		        	<table style="table-layout:fixed;" id="table_file3">
							<tr>
								<td align="right" style="width:160px">税务登记证：</td>
								<td id="purSupplier.taxnumb" style="width:250px"></td>
								<td align="right" style="width:160px">组织机构代码：</td>
								<td id="purSupplier.orgnum" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">资质1：</td>
								<td id="purSupplier.qualify1"   style="width:250px"></td>
								<td align="right" style="width:160px">资质1有效期：</td>
								<td id="purSupplier.qualify1exp" style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">资质2：</td>
								<td id="purSupplier.qualify2"  style="width:250px"></td>
								<td align="right" style="width:160px">资质2有效期：</td>
								<td id="purSupplier.qualify2exp"  style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">资质3：</td>
								<td id="purSupplier.qualify3"  style="width:250px"></td>
								<td align="right" style="width:160px">资质3有效期：</td>
								<td id="purSupplier.qualify3exp"  style="width:250px"></td>
							</tr>
							<tr>
								<td align="right" style="width:160px">资质备注：</td>
								<td colspan="5" id="purSupplier.qualifycomm"  style="width:auto"></td>
							</tr>
		        	</table>
		        </fieldset>
		        <fieldset id="field1" style="border:solid 1px #aaa;padding:3px;" style="width:auto">
		        <jsp:include page="/ame_common/detailFile.jsp"/>
		        </fieldset>
	        </form>
		</div>
	</div>
	<div title="合同与订单" id="htdd" name = "htdd">
		<div id="custname1"></div>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
	        <legend>采购合同列表</legend>
			<div id="datagrid2" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="purContracts" 
			showPager="false" idField="appid" multiSelect="true" onselectionchanged="changePurContract">
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="25" >编号</div>
					<div field="purcontid" width="0" align="center" headerAlign="center" >采购合同编号</div>		
					<div field="purcontname" width="150" align="center" headerAlign="center" renderer="detailPurContract">合同名称</div>	
					<div field="purcontnum" width="75" align="center" headerAlign="center">合同代码</div>
					<div field="contmoney" width="75" align="center" headerAlign="center">合同金额</div>
					<div field="signdate" width="80" align="center" headerAlign="center">签订日期</div>				
					<div field="purtype" width="80" align="center" headerAlign="center" renderer="dictpurtype">合同类型</div>				
					<div field="purstatus"width="80" align="center" headerAlign="center" renderer="dictpurstatus">合同状态</div>
					<div field="startdate"width="90" align="center" headerAlign="center">合同开始日期</div>
					<div field="enddate" width="60" align="center"  headerAlign="center">合同截止日期</div>
				</div>
			</div>
		</fieldset>
		<div id="purcontnamecont"></div>
		<fieldset style="border:solid 1px #aaa;padding:3px;" id="showOrder">
	        <legend>采购订单列表</legend>
	        <div id="datagrid_order" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="purSupplier.orders"
			 showPager="false" idField="appid" multiSelect="true"  onselectionchanged="changePurOrder" >
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
					<div field="purorderid" width="0" align="center" headerAlign="center">采购订单编号</div>		
					<div field="purordernum" width="120" align="center" headerAlign="center" >采购订单编码</div>
					<div field="signdate" width="70" align="center" headerAlign="center">签订日期</div>	
					<div field="purstatus" width="50" align="center" headerAlign="center" renderer="dictorderstatus">状态</div>				
					<div field="custname"width="200" align="center" headerAlign="center">服务客户</div>
					<div field="projectName"width="170" align="center" headerAlign="center">所属项目</div>
					<div field="empname" width="70" align="center"  headerAlign="center">协议签订人员</div>
					<div field="calcycle" width="80" align="center" headerAlign="center">结算周期说明</div>				
<!-- 					<div field="contmemo" width="240" align="center"  headerAlign="center">协议内容说明</div> -->
					<div renderer="detailPurorder" width="40" align="center"  headerAlign="center">操作</div>
				</div>
			</div>
        </fieldset>
        <div id="showOutper">
        <div id="purordernumoutper"></div>
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
		    	idField="appid" multiSelect="true" allowAlternating="true" onselectionchanged="selectionChanged" showPager="false">
				<div property="columns">
					<div field="purOutperson.outperno" align="center" headerAlign="center" allowSort="true" visible="false">人员编号</div>
					<div field="purOutperson.outpername" width="50" align="center" headerAlign="center" renderer="detailOutper">姓名</div>	
					<div field="purOutperson.outpercartno" width="120" align="center" headerAlign="center">身份证</div>	
					<div field="purOutperson.degree" width="50" align="center" headerAlign="center" renderer="dictDegree">学历</div>	
					<div field="purOutperson.gradudate" width="80" align="center" headerAlign="center">毕业时间</div>	
					<div field="workunit" width="90" align="center" headerAlign="center" allowSort="true" renderer="dictOutperType">工作量计量单位</div>	
					<div field="price" width="90" align="center" dataType="currency" headerAlign="center" allowSort="true">人月单价(元)</div>	
					<div field="startdate" width="90" align="center" headerAlign="center" allowSort="true">服务开始日期</div>	
					<div field="expenddate" width="90" align="center" headerAlign="center" allowSort="true">预计服务结束日期</div>
					<div field="actenddate" width="90" align="center" headerAlign="center" allowSort="true">实际服务结束日期</div>
					<div field="custname" width="200" align="center" headerAlign="center" >当前服务客户</div>
					<div field="projectName" width="190" align="center" headerAlign="center" >当前服务项目</div>
<!-- 					<div field="pcprotype" width="90" align="center" headerAlign="center" renderer="onFileRendererway">电脑提供方式</div>	 -->
<!-- 					<div field="comment" width="90" align="center" headerAlign="center">说明</div>	 -->
					<div field="currentstatus" width="50" align="center" headerAlign="center" renderer="dictOutperStatus">状态</div>	
				</div>
			</div>
		</fieldset>
		</div>
    </div>
    <!-- 结算信息 -->
    <div title="结算记录信息" id = "jsjl" name = "jsjl">
	    <div id="custnamesettle"></div>
	    <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>采购合同对应项目列表</legend>
	        <div id="grid_purProjCont" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="purProjConts" oncellendedit="calMoney"
			 url="com.primeton.eos.ame_pur.PurContract.queryPurProjContByPurcontid.biz.ext"  allowCellEdit="false" showPager="false" multiSelect="true" showSummaryRow="true" ondrawsummarycell="drawPurProjContSum">
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
					<div type="projectid" visible="false"></div>
					<div field="projectno" displayField="projectName" width="250" headerAlign="center">项目名称</div>
					<div field="projectno" width="120" align="center" headerAlign="center" >项目编号</div>
					<div field="contnum" width="120" align="center" headerAlign="center" >销售合同编号</div>
					<div field="custjc" width="140" align="center" headerAlign="center" >所属客户</div>
					<div field="orgname" width="75" align="center" headerAlign="center">受益销售</div>	
					<div field="purmoney" width="120" headerAlign="center" align="right" summaryType="sum" numberFormat="n2">采购金额</div>
					<div field="wzfje" width="120" align="right" headerAlign="center" summaryType="sum" numberFormat="n2">未支付金额</div>
					<div field="status" width="100" headerAlign="center" align="center" renderer="dictPurProjContStatus">状态</div>
					<div field="comment" width="auto" headerAlign="center" align="center">备注说明</div>
					<div name="action" width="110" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
				</div>
			</div>
		</fieldset>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>采购付款计划列表</legend>
			<div id="paymentPlanGrid" class="nui-datagrid" style="width:100%;height:auto;" allowResize="false" dataField="plans" 
		 	url="com.primeton.eos.ame_pur.purPaymentPlan.paymentPlanQueryBySupplier.biz.ext"  allowCellEdit="false" showPager="false" multiSelect="true" >
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
					<div field="id" width="0" align="center" headerAlign="center" >ID</div>		
					<div field="purContract.purcontnum" width="120" align="center" headerAlign="center">采购合同编号</div>		
					<div field="purContract.purcontname" width="280" align="left" headerAlign="center" >采购合同名称</div>	
					<div field="payCount" width="80" align="center" headerAlign="center" >付款次数</div>	
					<div field="expectedAmount" width="100" align="center"  headerAlign="center" currencyUnit="￥" dataType="currency" numberFormat="n2">付款金额</div>
					<div field="percentage" width="80" align="center"  headerAlign="center" renderer="percentageRenderer">付款比例</div>
		            <div field="expectedDate" width="100" align="center"  headerAlign="center" dataType="date" dateFormat="yyyy-MM" renderer="onDealDate">预计付款年月</div>
		            <div field="evidence" width="140" align="center" headerAlign="center">付款依据</div>
					<div field="nodeRemark" width="280" align="center"  headerAlign="center" >付款节点备注</div>
				</div>
			</div>
		</fieldset>
		
	    <fieldset style="border:solid 1px #aaa;padding:3px;width: 1770px;">
		    <legend>结算记录信息</legend>
			<div style="width:100%;height:85%;" showToolbar="false" showFooter="false" >
		        <div id="datagridsettle" class="nui-datagrid" dataField="purSettles" style="width:100%;height: auto;" 
		        	url="com.primeton.eos.ame_pur.settle.queryPursettleList.biz.ext" 
		        	pageSize="10" showPageInfo="true" multiSelect="true" showSummaryRow="true" ondrawsummarycell="drawPurProjContSum">
		            <div property="columns">
		                <div field="processinstid" headerAlign="center" allowSort="true" visible="false">流程实例ID</div>
		                <div field="settlementno" width="120" headerAlign="center" allowSort="true">结算单编号</div>
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
		                    <a class="nui-button" iconCls="icon-add" onclick="addpre()">增加</a>
		                    <a id="updatepre" class="nui-button" iconCls="icon-edit" onclick="editpre()">编辑</a>
		                    <a class="nui-button" iconCls="icon-remove" onclick="removepre()">删除</a>
		                </td>
		            </tr>
		        </table>
		    </div>
	        <div id="datagridpre" class="nui-datagrid" dataField="purpresettles" style="width:100%;height: auto;" 
	        	url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleList.biz.ext" 
	        	pageSize="10" showPageInfo="true" multiSelect="true" idField="custid"
	        	onselectionchanged="selectionChangedpre"  showSummaryRow="true" ondrawsummarycell="drawPurProjContSum">
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
	                <div field="custname1" width="240" headerAlign="center" allowSort="true" >客户名称</div>
	                <div field="projectno" width="110" headerAlign="center" allowSort="true" >项目编号</div>
	                <div field="projectname" width="210" headerAlign="center" allowSort="true" >项目名称</div>
	                <div field="contnum" width="100" headerAlign="center" allowSort="true" >销售合同编号</div>
	                <div field="outper" width="auto" headerAlign="center" allowSort="true" >相关外包人员</div>
	                <div field="settlementno" width="120" headerAlign="center" allowSort="true" >结算单编号</div>
	                <div field="settlementid" headerAlign="center" allowSort="true" visible="false" >结算单ID</div>
	                <div field="accrueddate" width="80" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd">计提时间</div>
	            </div>
	        </div>
		</fieldset>
		<fieldset id="field24" style="border:solid 1px #aaa;padding:3px;display: none;">
			<legend>供应商的已有发票列表</legend>
			<div id="ticketgrid" class="nui-datagrid" style="width:100%;height:auto;"  dataField="purTickets" showSummaryRow="true" ondrawsummarycell="doCountNowPage"
			url="com.primeton.eos.ame_pur.purTicket.queryPurTickets.biz.ext"  showPager="false" >
				<div property="columns">
					<div field="purcontnum" width="60" align="center"  headerAlign="center"allowSort="true" renderer="getPurcont11">采购合同编号</div>
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
    	<!-- <a class="nui-button" onclick="edit" style="width:60px;margin-right:20px;">编辑</a> -->
    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div> 
    <script type="text/javascript">
    /**供应商查询*/
		nui.parse();
		var editorId = "ke";
    	var form = new nui.Form("form1");
    	var custid = getUrlParam("id");
    	var flag = getUrlParam("flag");
		var ticketgrid = nui.get("ticketgrid");//采购合同发票
    	if(flag=='1'){
    		document.getElementById("fieldfee").style.display="none";
    		document.getElementById("a1").style.display="none";
    		document.getElementById("a2").style.display="none";
    		document.getElementById("a3").style.display="none";
    		document.getElementById("a4").style.display="none";
    		document.getElementById("purSupplier.infoprovider").style.display="none";
    		document.getElementById("purSupplier.telephone").style.display="none";
    		document.getElementById("purSupplier.cvenname").style.display="none";
    		document.getElementById("purSupplier.dycustid").style.display="none";
    	}
    	var custname;
    	var grid_purProjCont = nui.get("grid_purProjCont");
    	var grid_paymentPlan = nui.get("paymentPlanGrid");
    	var datagridpre = nui.get("datagridpre");
    	var datagridsettle = nui.get("datagridsettle");
		document.getElementById("showOrder").style.display="none";
		document.getElementById("showOutper").style.display="none";
// 		document.getElementById("showOutper1").style.display="none";
		selectSettle();
		
		//富文本
		var editor1 = null;
		 KindEditor.ready(function(K) {
				editor1 = K.create('textarea[name="comments"]', {
				cssPath : '<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css',
				uploadJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/upload_json.jsp',
				fileManagerJson : '<%=contextPath%>/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				}
			});
			prettyPrint();
		});
		
		//采购合同发票汇总
		function doCountNowPage(e){
			//客户端汇总计算
			if (e.field == "ticmon"||e.field == "tictax"||e.field == "ticmonnet") {
				e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
			}
		}
		function selectSettle(){
			
			//加载结算信息
	        var jsonsettle = {"iden": "2","custid": custid};
	        datagridsettle.load(jsonsettle);
	        datagridsettle.sortBy("subdate","desc");
	        //加载计提信息
	        var jsonpre = {"iden": "2","custid": custid};
	        datagridpre.load(jsonpre);
	        datagridpre.sortBy("accrueddate","desc");
		}
		
		//查看流程图
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
		
		setData(custid);
		function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		} 												  
		
        function setData(custid){        	 
        	//当页面通过合同查询进来时隐藏其他两个tab页
        	 if(flag == "1"){
				var body_tab=nui.get("tabs1");
				var htdd=body_tab.getTab("htdd");
				var jsjl=body_tab.getTab("jsjl");
	        	body_tab.updateTab(htdd, { visible: false });
	        	body_tab.updateTab(jsjl, { visible: false });
			}
        	var json = nui.encode({purSupplier:{custid: custid}});
        	nui.ajax({
	            url: "com.primeton.eos.ame_pur.PurSupplier.getPurSupplierDetail.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	nui.get("grid_0").load({"groupid":"purSupplier","relationid":o.purSupplier.custid});
	            	obj = nui.decode(o);
	                form.setData(obj);
	                form.setChanged(false);
	                nui.get("custid1").setValue(o.purSupplier.custid);
	                custname = o.purSupplier.custname;
	                
	                if(o.purSupplier.processinstid == null || o.purSupplier.processinstid == ""){
		          		document.getElementById("viewProc").style.display = "none";
		            }else{
		               	nui.get("processinstid").setValue(o.purSupplier.processinstid);
		            }
	                //采购发票
					var json_t = nui.decode({"criteria": {"_expr[0]": {"_property": "custid","_op": "=","_value": o.purSupplier.custid},"_expr[1]": {"_property": "state","_op": "=","_value": "1"}},"b": "true"});
					ticketgrid.sortBy("ticdate","desc");
					ticketgrid.load(json_t,function(){
						var tickets = ticketgrid.getData();
						if(tickets.length==null||tickets==null||tickets.length==0){
							document.getElementById("field24").style.display="none";
						}else{
							document.getElementById("field24").style.display="";
						}
					});
	                
	                document.getElementById("custname").innerText="供应商：" + o.purSupplier.custname;
	                document.getElementById("custname1").innerText="供应商：" + o.purSupplier.custname;
// 	                document.getElementById("custname2").innerText="供应商：" + o.purSupplier.custname;
	                document.getElementById("custnamesettle").innerText="供应商：" + o.purSupplier.custname;
	                document.getElementById("purSupplier.custnum").innerHTML = o.purSupplier.custnum == null ?"":o.purSupplier.custnum;
	                document.getElementById("purSupplier.custname").innerHTML = o.purSupplier.custname == null ?"":o.purSupplier.custname;
	                document.getElementById("purSupplier.suppliersname").innerHTML = o.purSupplier.suppliersname == null ?"":o.purSupplier.suppliersname;
	                document.getElementById("purSupplier.inflag").innerHTML = o.purSupplier.inflag == null ?"":nui.getDictText('PUR_INFLAG',o.purSupplier.inflag);
	                if(o.purSupplier.custtype){
		                var custtype =[];
		                if(o.purSupplier.custtype.length > 1){
		                	var custtypes = o.purSupplier.custtype;
		                	custtype = custtypes.split(',');
		                	var type =[] ;
		                	for(var i=0;i<custtype.length;i++){
			               		 type[i] = nui.getDictText('AME_SUPTYPE',custtype[i]);
		                	}
		                	document.getElementById("purSupplier.custtype").innerHTML =type;
		                }else{
			                document.getElementById("purSupplier.custtype").innerHTML = nui.getDictText('AME_SUPTYPE',o.purSupplier.custtype);
		                }
	                }
	                if(o.purSupplier.locservcity){
		                var locservcity =[];
		                if(o.purSupplier.locservcity.length > 1){
		                	var locservcitys = o.purSupplier.locservcity;
		                	locservcity = locservcitys.split(',');
		                	var type =[] ;
		                	for(var i=0;i<locservcity.length;i++){
			               		 type[i] = nui.getDictText('MIS_AREA',locservcity[i]);
		                	}
		                	document.getElementById("purSupplier.locservcity").innerHTML =type;
		                }else{
			                document.getElementById("purSupplier.locservcity").innerHTML = nui.getDictText('MIS_AREA',o.purSupplier.locservcity);
		                }
	                }
	                document.getElementById("purSupplier.dycustid").innerHTML = o.purSupplier.dycustname == null ?"":o.purSupplier.dycustname;
	                document.getElementById("purSupplier.reindex").innerHTML = nui.getDictText('AME_REINDEX',o.purSupplier.reindex);
	                document.getElementById("purSupplier.address").innerHTML = o.purSupplier.address == null ?"":o.purSupplier.address;
	                document.getElementById("purSupplier.postcode").innerHTML = o.purSupplier.postcode == null ?"":o.purSupplier.postcode;
	                document.getElementById("purSupplier.telephone").innerHTML = o.purSupplier.telephone == null ?"":o.purSupplier.telephone;
	                document.getElementById("purSupplier.fax").innerHTML = o.purSupplier.fax == null ?"":o.purSupplier.fax;
	                document.getElementById("purSupplier.website").innerHTML = o.purSupplier.website == null ?"":o.purSupplier.website;
	                document.getElementById("comments").innerHTML = o.purSupplier.comments == null ?"":o.purSupplier.comments;
	                document.getElementById("purSupplier.createDate").innerHTML = o.purSupplier.createDate == null ?"":o.purSupplier.createDate;
	                document.getElementById("purSupplier.createUsername").innerHTML = o.purSupplier.createUsername == null ?"":o.purSupplier.createUsername;
 	                document.getElementById("purSupplier.cvenname").innerHTML = o.purSupplier.cvenname == null ?"":o.purSupplier.cvenname;
	                document.getElementById("purSupplier.accoutbank").innerHTML = o.purSupplier.accoutbank == null ?"":o.purSupplier.accoutbank;
	                document.getElementById("purSupplier.accoutname").innerHTML = o.purSupplier.accoutname == null ?"":o.purSupplier.accoutname;
	                document.getElementById("purSupplier.taxnumb").innerHTML = o.purSupplier.taxnumb == null ?"":o.purSupplier.taxnumb;
	                document.getElementById("purSupplier.accountid").innerHTML = o.purSupplier.accountid == null ?"":o.purSupplier.accountid;
	                document.getElementById("purSupplier.status").innerHTML = nui.getDictText('AME_SUPSTATUS',o.purSupplier.status);
	                document.getElementById("purSupplier.custnature").innerHTML = nui.getDictText('MIS_CUSTNATURE',o.purSupplier.custnature);
	                document.getElementById("purSupplier.license").innerHTML = o.purSupplier.license == null ?"":o.purSupplier.license;
	                document.getElementById("purSupplier.licenseenddate").innerHTML = o.purSupplier.licenseenddate == null ?"":o.purSupplier.licenseenddate;
	                document.getElementById("purSupplier.legalperson").innerHTML = o.purSupplier.legalperson == null ?"":o.purSupplier.legalperson;
	                document.getElementById("purSupplier.orgnum").innerHTML = o.purSupplier.orgnum == null ?"":o.purSupplier.orgnum;
	                document.getElementById("purSupplier.registercap").innerHTML = o.purSupplier.registercap == null ?"":o.purSupplier.registercap;
	                document.getElementById("purSupplier.compdesc").innerHTML = o.purSupplier.compdesc == null ?"":o.purSupplier.compdesc;
	                document.getElementById("purSupplier.threeago").innerHTML = o.purSupplier.threeago == null ?"":o.purSupplier.threeago;
	                document.getElementById("purSupplier.threeagoincome").innerHTML = o.purSupplier.threeagoincome == null ?"":o.purSupplier.threeagoincome;
	                document.getElementById("purSupplier.threeagoprofit").innerHTML =o.purSupplier.threeagoprofit == null ?"":o.purSupplier.threeagoprofit;
	                document.getElementById("purSupplier.twoago").innerHTML = o.purSupplier.twoago == null ?"":o.purSupplier.twoago;
	                document.getElementById("purSupplier.twoagoincome").innerHTML = o.purSupplier.twoagoincome == null ?"":o.purSupplier.twoagoincome;
	                document.getElementById("purSupplier.twoagoprofit").innerHTML = o.purSupplier.twoagoprofit == null ?"":o.purSupplier.twoagoprofit;
	                document.getElementById("purSupplier.lastyear").innerHTML = o.purSupplier.lastyear == null ?"":o.purSupplier.lastyear;
	                document.getElementById("purSupplier.lastyearincome").innerHTML = o.purSupplier.lastyearincome == null ?"":o.purSupplier.lastyearincome;
	                document.getElementById("purSupplier.lastyearprofit").innerHTML = o.purSupplier.lastyearprofit == null ?"":o.purSupplier.lastyearprofit;
	                document.getElementById("purSupplier.lastproperty").innerHTML = o.purSupplier.lastproperty == null ?"":o.purSupplier.lastproperty;
	                document.getElementById("purSupplier.lastpropertynet").innerHTML = o.purSupplier.lastpropertynet == null ?"":o.purSupplier.lastpropertynet;
	                document.getElementById("purSupplier.lastfloat").innerHTML = o.purSupplier.lastfloat == null ?"":o.purSupplier.lastfloat;
	                document.getElementById("purSupplier.lastlongdebt").innerHTML = o.purSupplier.lastlongdebt == null ?"":o.purSupplier.lastlongdebt;
	                document.getElementById("purSupplier.lastshortdebt").innerHTML = o.purSupplier.lastshortdebt == null ?"":o.purSupplier.lastshortdebt;
	                document.getElementById("purSupplier.lastnetprofit").innerHTML =o.purSupplier.lastnetprofit == null ?"":o.purSupplier.lastnetprofit;
	                document.getElementById("purSupplier.mainprod").innerHTML = o.purSupplier.mainprod == null ?"":o.purSupplier.mainprod;
	                document.getElementById("purSupplier.agentprod").innerHTML = o.purSupplier.agentprod == null ?"":o.purSupplier.agentprod;
	                document.getElementById("purSupplier.qualify1").innerHTML = o.purSupplier.qualify1 == null ?"":o.purSupplier.qualify1;
	                document.getElementById("purSupplier.qualify1exp").innerHTML = o.purSupplier.qualify1exp == null ?"":o.purSupplier.qualify1exp;
	                document.getElementById("purSupplier.qualify2").innerHTML = o.purSupplier.qualify2 == null ?"":o.purSupplier.qualify2;
	                document.getElementById("purSupplier.qualify2exp").innerHTML = o.purSupplier.qualify2exp == null ?"":o.purSupplier.qualify2exp;
	                document.getElementById("purSupplier.qualify3").innerHTML = o.purSupplier.qualify3 == null ?"":o.purSupplier.qualify3;
	                document.getElementById("purSupplier.qualify3exp").innerHTML = o.purSupplier.qualify3exp == null ?"":o.purSupplier.qualify3exp;
	                document.getElementById("purSupplier.qualifycomm").innerHTML = o.purSupplier.qualifycomm == null ?"":o.purSupplier.qualifycomm;
	                document.getElementById("purSupplier.infoprovider").innerHTML =o.purSupplier.infoprovider == null ?"":o.purSupplier.infoprovider;
	                document.getElementById("purSupplier.linkman").innerHTML = o.purSupplier.linkman == null ?"":o.purSupplier.linkman;
	                document.getElementById("purSupplier.linktel").innerHTML = o.purSupplier.linktel == null ?"":o.purSupplier.linktel;
	                document.getElementById("purSupplier.linkmail").innerHTML = o.purSupplier.linkmail == null ?"":o.purSupplier.linkmail;
	                document.getElementById("purSupplier.registaddress").innerHTML = o.purSupplier.registaddress == null ?"":o.purSupplier.registaddress;
	                document.getElementById("purSupplier.registcity").innerHTML = o.purSupplier.registcity == null ?"": nui.getDictText('MIS_AREA',o.purSupplier.registcity);
	                document.getElementById("purSupplier.estabdate").innerHTML = o.purSupplier.estabdate == null ?"":o.purSupplier.estabdate;
	                document.getElementById("purSupplier.empsize").innerHTML = o.purSupplier.empsize == null ?"":o.purSupplier.empsize;
	                document.getElementById("purSupplier.istaxpayer").innerHTML = nui.getDictText('ABF_YESORNO',o.purSupplier.istaxpayer);
	                document.getElementById("purSupplier.taxno").innerHTML = o.purSupplier.taxno == null ?"":o.purSupplier.taxno;
	                document.getElementById("purSupplier.cappay").innerHTML = o.purSupplier.cappay == null ?"":o.purSupplier.cappay;
			 		//加载框架协议
			 		nui.get("datagrid2").setData(o.purSupplier.purContracts); //datagrid加载数据
			 		//项目合同关系列表查询
                    grid_purProjCont.load({custid:o.purSupplier.custid});
                    //采购付款计划查询
                    grid_paymentPlan.load({custid:o.purSupplier.custid});
				}
	     });
	}		
	function dictpurtype(e) {
		return nui.getDictText('AME_CONTYPE',e.value);//设置业务字典值
	}
	function dictpurstatus(e) {
		return nui.getDictText('AME_ORDERSTATUS',e.value);//设置业务字典值
	}
	function dictorderstatus(e) {
		return nui.getDictText('AME_ORDERSTATUS',e.value);//设置业务字典值
	}
	
	//设置业务字典值-工作量单位
	function dictGetServ(e){
		return nui.getDictText('SERV_NUM_TYPE',e.value);
	}
	
	//设置业务字典值-结算单状态
	function dictGetStatus(e){
		return nui.getDictText('AME_SETSTATUS',e.value);
	}
	
	//设置业务字典值-事业部
	function dictGetContOrg(e){
		return nui.getDictText('CONT_ORG',e.value);
	}
	
	//设置业务字典值-计提状态
	function dictGetAccruedStatus(e){
		return nui.getDictText('AME_ACCRUEDSTATUS',e.value);
	}
	
	//成本归属类型
	function dictGetCostType(e){
		return nui.getDictText('AME_CONTCOSTTYPE',e.value);
	}
	

   function edit(){
   		var custid = nui.get("custid1").getValue();	
   		nui.open({
            url: "ModifyPurSupplier.jsp",
            title: "编辑供应商信息",
            width: 830,
	        height: 550,
            onload: function () {
              var iframe = this.getIFrameEl();
              var data = {action: "edit",custid: custid};
              iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                if(action=="saveSuccess"){
                	window.location.reload(true);
           		}
           	}
        });
   }
   
   
	//计提增删改开始------------vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv----------------------------------
	//当选择列时
    function selectionChangedpre(){
        var rows = datagridpre.getSelecteds();
        if(rows.length>1){
            nui.get("updatepre").disable();
        }else{
            nui.get("updatepre").enable();
        }
    }
	//新增计提信息
	function addpre() {
	    nui.open({
	        url: "<%=request.getContextPath() %>/ame_pur/outaccrued/PurOutAccruedInput.jsp",
	        title: "新增外包计提信息", 
	        width: 850, 
	        height: 420,
	        onload: function () {//弹出页面加载完成
	            var iframe = this.getIFrameEl();
	            var data = {action: "addpre",custid: custid,custname: custname};//传入页面的json数据
	            iframe.contentWindow.SetData(data);
	        },
	        ondestroy: function (action) {//弹出页面关闭前
	            datagridpre.reload();
	        }
	    });
	}

	//编辑
	function editpre() {
	    var row = datagridpre.getSelected();
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
                    datagridpre.reload();
                }
            });
        } else {
            nui.alert("请选中一条记录","提示");
        }
    }

    //删除
    function removepre(){
        var rows = datagridpre.getSelecteds();
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
                    datagridpre.loading("正在删除中,请稍等...");
                    $.ajax({
                        url:"com.primeton.eos.ame_pur.outaccrued.deletePurPresettles.biz.ext",
                        type:'POST',
                        data:json,
                        cache: false,
                        contentType:'text/json',
                        success:function(text){
                            var returnJson = nui.decode(text);
                            if(returnJson.exception == null){
                                datagridpre.reload();
                                nui.alert("删除成功", "系统提示", function(action){
                                });
                            }else{
                                datagridpre.unmask();
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
    
    //点击查看详情
    function getPreDetail(e){
        return "<a href='javascript:void(0)' onclick='checkPreDetail();' title='点击查看' >" + e.value + "</a>";
    }
    function checkPreDetail(){
 		var selectRow = datagridpre.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/ame_pur/outaccrued/PurOutPreSettleLook.jsp?accruedid=" + selectRow.accruedid;
		window.open(executeUrl, "查看计提信息", "fullscreen=1");
    }
   //计提增删改结束------------^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^----------------------------------
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
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();  
    }
    //点击合同名称查看信息
    function detailPurContract(e){
    	return "<a href='javascript:void(0)' onclick='getPurContractDetail();' title='点击查看'>" + e.value + "</a>";
    }
    function getPurContractDetail(){
    	var datagrid2 = nui.get("datagrid2");
 		var selectRow = datagrid2.getSelected();
		var executeUrl = "/default/ame_pur/PurContract/DetailPurContract.jsp?id=" + selectRow.purcontid;
		nui.open({
            url: executeUrl,
            title: "合同详细信息",
            width: 1100,
	        height: 550,
            onload: function () {},
            ondestroy: function (action) {}
        });
    }
    //点击查看订单信息
    function detailPurorder(){
    	return "<a href='javascript:void(0)' onclick='getpurOrderDetail();' title='点击查看'>查看</a>";
    }
    function getpurOrderDetail(){
    	var datagrid_order = nui.get("datagrid_order");
 		var selectRow = datagrid_order.getSelected();
		var executeUrl = "/default/ame_pur/PurOrder/DetailPurOrder.jsp?id=" + selectRow.purorderid;
		nui.open({
            url: executeUrl,
            title: "订单详细信息",
            width: 900,
	        height: 550,
            onload: function () {},
            ondestroy: function (action) {}
        });
    } 
    //点击合同列表展示订单信息
    function changePurContract(){
    	var datagrid2 = nui.get("datagrid2");
 		var selectRow = datagrid2.getSelected();
		document.getElementById("showOrder").style.display="";
		document.getElementById("showOutper").style.display="none";
    	var json = nui.encode({purContract:{purcontid: selectRow.purcontid}});
		nui.ajax({
            url: "com.primeton.eos.ame_pur.PurContract.getPurContractDetail.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
            	obj = nui.decode(o);
                document.getElementById("purcontnamecont").innerText="合同名称为:" + o.purContract.purcontname + "的订单信息列表";
                nui.get("datagrid_order").setData(o.purContract.purOrders);
            }
     	});
    }
    //点击弹出的订单信息展示相应外包人员
    function changePurOrder(){
    	var datagrid_order = nui.get("datagrid_order");
 		var selectRow = datagrid_order.getSelected();
		document.getElementById("showOutper").style.display="";
		 document.getElementById("purordernumoutper").innerText="订单编码为:" + selectRow.purordernum + "的外包人员信息列表";
		//外包人员
		var grid_outper = nui.get("grid_outper");
		grid_outper.load({purOrder:{purorderid:selectRow.purorderid}});
		grid_outper.sortBy("purOutperson.outperno", "desc");
    }
    //外包人员状态
    function dictOutperStatus(e){
		return nui.getDictText('AME_OUTPERSTATUS',e.value);
	}
	//学历
	function dictDegree(e) {
		return nui.getDictText('DEGREE',e.value);
	}
	
	//点击姓名查看详情
	function detailOutper(e){
    	return "<a href='javascript:void(0)' onclick='getOutperDetail();' title='点击查看'>"+ e.value + "</a>";
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
	//人员订单关系表，计算单位
	function dictOutperType(e){
		return nui.getDictText('SERV_NUM_TYPE',e.value);//设置业务字典值
	}
	//电脑提供方式
	function onFileRendererway(e){
		return nui.getDictText('AME_PCPROTYPE',e.value);//设置业务字典值
	}
	function drawPurProjContSum(e){
		if (e.field == "purmoney"||e.field == "wzfje"||e.field=="setamount"||e.field=="notaxmon"||e.field=="accruedmoney"||e.field=="notaxmoney") {
            e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##.##') + "</b></div>";
        }
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
                height: 460,
                onload: function () {//弹出页面加载完成
	                var iframe = this.getIFrameEl();
	                row.purSupplierCustid = custid;
	                row.purSupplierCustname = custname;
	                var data = {action:"DetailPurContractAdd",datarow: row};//传入页面的json数据
	                iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {//弹出页面关闭前
                	if(action == "ok"){
	                    datagridpre.reload();
                	}
                }
            });
        }
    }
    function dictPurProjContStatus(e){
    	return nui.getDictText('AME_PROJCONTSTATUS',e.value);
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
	//-------------------------------------------------新增计提结束------------------------------------------------
   	</script>
</body>
</html>