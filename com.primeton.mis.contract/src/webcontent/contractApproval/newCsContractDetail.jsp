<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%> 
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/coframe/tools/skins/skin1/style.css" />
<%
	String contextPath=request.getContextPath();
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- 
  - Author(s): mengyy
  - Date: 2018-01-12 16:38:45
  - Description:
-->
<head>
    <title>待签署合同详情</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<link id="css_skin" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/coframe/tools/skins/skin1/style.css" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    .asLabel
    {
        border:0;background-color:#F5F5F5;cursor:default;    
    }
    </style>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fit" style="border:solid 0px #aaa;padding:0px;width:100%;">
		<!-- 提示信息展示  -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
	<!-- 
		针对OEM合同、框架合同，需要新增订单
		1、增加合同时允许选择对应的项目（选择后项目外部状态变更为：项目实施阶段
		2、合同收入预测提供表格（子表）方式增加
		3、合同订单处理提供表格(子表）方式增加
	 -->
    <div id="form1" >
    	<input name="cscontract.fileids" id="fileids" class="nui-hidden"/>
        <input name="cscontract.contractid" id="conId" class="nui-hidden" />
        <input class="nui-hidden" name="cscontract.salename" id="salename"/>
        <input class="nui-hidden" name="cscontract.org" id="org"/>
        <input class="nui-hidden" name="cscontract.projectId" id="projectId" />
        <input class="nui-hidden" name="cscontract.ocstartdate" id="ocstartdate" />
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 99%;">
            <legend>合同基本信息</legend>
            <div style="padding:5px;">
            <table style="table-layout:fixed;" id="table_file">
                <tr>
                    <td style="width:150px;" align="right">合同类型：</td>
                    <td style="width:150px;"colspan="2" id="contracttype" class = "asLabel">    
                    </td>
                    <td style="width:150px;" align="right">合同号：</td>
                    <td style="width:150px;"colspan="2" id="contid" class = "asLabel">    
                    </td>
                </tr>
                <tr>
                	<td style="width:140px;" align="right">合同名称（项目）：</td>
                    <td style="width:420px;" colspan="2" id="projectname" class = "asLabel">    
                    </td>
                    <td style="width:140px;" align="right">签署单位：</td>
                    <td style="width:420px;" colspan="2" id="custname" class = "asLabel">    
                    </td>
                    
                </tr>
                <tr>
                    <td style="width:140px;" align="right">客户类型：</td>
                    <td style="width:150px;" colspan="2" id="signtarget" class = "asLabel">    
                    </td>
                    <td style="width:120px;" align="right">最终用户：</td>
                    <td style="width:420px;" colspan="2" id="username" class = "asLabel">    
                    </td>
                </tr>
                <tr style="display:">
                    <td style="width:140px;" align="right">是否已提供项目预算：</td>
					<td style="width:150px;"  id="purChaseYesOrNo" class = "asLabel">  
					</td>
                     <td style="width:140px;" align="right" id='starttime1'>协议有效期开始：</td>
                    <td style="width:150px;" id="xystart" class = "asLabel">    
                    </td>
                    <td style="width:140px;" align="right" id='endtime1'>协议有效期结束：</td>
                    <td style="width:150px;" id="xyend" class = "asLabel">    
                    </td>
                </tr>
                <tr>
                    <td style="width:140px;" align="right">合同总金额：</td>
                    <td style="width:150px;" id="contsum" class = "asLabel">    
                    </td>
                    <td style="width:140px;" align="right">产品金额：</td>
                    <td style="width:150px;" id="prodmon" class = "asLabel">    
                    </td>
                    <td style="width:140px;" align="right">服务金额：</td>
                    <td style="width:150px;" id="servmon" class = "asLabel">    
                    </td>
                </tr>
                <tr>
                	<td id="temp1" style="width:120px;" align="right">行业：</td>
                    <td style="width:150px;" id="industry" class = "asLabel">    
                    </td>
                    <td style="width:140px;" align="right">采购1：</td>
                    <td style="width:150px;" id="servsubmon" class = "asLabel">    
                    </td>
                    <td style="width:140px;" align="right">质保金比例：</td>
                    <td style="width:150px;" id="zbjbl" class = "asLabel">    
                    </td>
                </tr>
                <tr id="temp2" style="display:">
                    <td style="width:140px;" align="right">是否禁止分包外包：</td>
                    <td style="width:150px;" id="isforbid" class = "asLabel">
                    </td>
                    <td style="width:140px;" align="right">是否高风险标识：</td>
                    <td style="width:150px;" id="ishighrisk" class = "asLabel">
                    </td>
                    <td style="width:120px;" align="right">是否允许对外宣传：</td>
                    <td style="width:150px;" id="publicity" class = "asLabel">
                     </td>
                    
                </tr>
                <tr id="temp3" style="display:">
                <td style="width:140px;" align="right">是否有排他合作：</td>
                    <td style="width:150px;" id="ispt" class = "asLabel" >   
                    </td>
                    <td style="width:140px;" align="right" id='pt1'>排他合作的条件：</td>
                    <td style="width:690px;" colspan="5" id="ptcondition" class = "asLabel">    
                    </td>
                </tr>
                <tr>
                	<td style="width:120px;" align="right">是否批量预估收入：</td>
                    <td style="width:150px;" id="isfinreve" class = "asLabel"></td>
                </tr>
                <tr id="remark">
                	<td style="width:140px;" align="right">合同备注说明：</td>
                    <td id="content1" colspan="5" class = "asLabel"  style="font-size:12px" width="auto" height="90%"></td>
                </tr>
            </table>
        </div>
        </fieldset>
        <fieldset id="project" style="border:solid 1px #aaa;padding:3px;width: 99%;">
        	<legend>合同项目信息</legend>
        	<div style="padding:5px;">
	        	<table style="table-layout:fixed;" id="table_file1">
		            <tr>
						<td align="right" style="width:120px">项目编号：</td>
						<td style="width:width:180px"  colspan="2" id="projectno" class = "asLabel">
						</td>	
						<td align="right" width="120px">对应客户：</td>
						<td id="rdproject.custname" colspan="2"  style="width:180px" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">项目名称：</td>
						<td id="rdproject.projectName" colspan="3"  style="width:180px" class = "asLabel"></td>
						<td align="right" style="width:120px"> 受益部门：</td>
						<td id="omOrganization.orgname" colspan="2" style="width:180px"  class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">项目经理：</td>
						<td id="rdproject.manager" style="width:200px" class = "asLabel"></td>
						<td align="right" style="width:120px">项目类型：</td>
						<td id="rdproject.projectType" style="width:250px" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">是否延续性项目：</td>
						<td id="rdproject.isconproj" style="width:200px" class = "asLabel"></td>
						<td align="right" style="width:120px">项目开始日期：</td>
						<td id="rdproject.startdate" style="width:150px" class = "asLabel"></td>
						<td align="right" style="width:120px">预计结束日期：</td>
						<td id="rdproject.expenddate" style="width:250px" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">项目内部状态：</td>
						<td id="rdproject.projectStatus" style="width:200px" class = "asLabel"></td>
						<td align="right" style="width:120px"> 项目外部状态：</td>
						<td  style="width:150px" id="rdproject.outstatus" class = "asLabel"></td>
						<td></td>
						<td></td>
					</tr>
				</table>
			</div>
        </fieldset>
		<div id="tabs1" class="nui-tabs" activeIndex="0" style="width:99%;overflow: auto;">
            <div title="合同销售人员" >
	        	<div id="sales_grid" class="nui-datagrid" frozenStartColumn="0" frozenEndColumn="0"  style="width:99%;height:auto;" allowResize="true"
			        dataField="cscontractsales"
			        onshowrowdetail="onShowRowDetail" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			        
			        <div property="columns">            
			            <div type="expandcolumn">#</div>
			            <!-- <div name="oldsalename" field="oldsalename" width="75" headerAlign="center">原销售姓名</div> -->
			            <div field="saleid" width="45" headerAlign="center" >销售ID</div>
			            <div field="salename" width="55" headerAlign="center" >销售姓名</div>
			            <div field="orgid" width="0" headerAlign="center" >销售所在部门ID</div>
			            <div field="orgname" width="80" headerAlign="center">销售所在部门</div>
			            <div field="org" width="95" headerAlign="center" renderer="onGenderRenderer">销售所属事业部</div>
			            <!-- <div field="techdirector" width="0" headerAlign="center" >技术负责人ID</div>
			            <div field="techdirectorname" width="70" headerAlign="center" >技术负责人</div>
			            <div field="techorg" width="0" headerAlign="center" >技术负责部门ID</div>
			            <div field="techorgname" width="90" headerAlign="center" >技术负责部门</div> -->
			            <div field="contsum" dataType="currency" width="100" headerAlign="center" align="right" >合同总金额</div>
			            <div field="prodmon" dataType="currency" width="80" headerAlign="center" align="right" >产品金额</div>
			            <div field="prodwbmon" dataType="currency" width="80" headerAlign="center" align="right" >产品维保金额</div>
			            <div field="servjsmon" dataType="currency" width="80" headerAlign="center" align="right" >技术服务金额</div>
			            <div field="servmon" dataType="currency" width="90" headerAlign="center" align="right" >服务总金额</div>
			            <div field="servsubmon" dataType="currency" width="80" headerAlign="center" align="right" >服务采购1</div>
			            <!-- <div field="othmon" dataType="currency" width="80" headerAlign="center" align="right" >服务采购2</div> -->
			            <div field="netservmon" dataType="currency" width="80" headerAlign="center" align="right" >服务净额</div>
			            <div field="contpolmon" dataType="currency" width="80" headerAlign="center" align="right" >合同净额</div>
			        </div>
			    </div>
			    <div id="detailGrid_Form" style="display:none;">
			        <div id="product_grid" class="nui-datagrid" frozenStartColumn="0" frozenEndColumn="3"  style="width:99%;height:auto;"
			           showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
			            <div property="columns">
			                <div field="prodname" displayField="prodtypename" width="210" headerAlign="center" >产品名称</div>
			                <div field="price" dataType="currency" width="100" align="right" headerAlign="center">产品单价</div>
			                <div field="prodmon" dataType="currency" width="100" align="right" headerAlign="center">产品金额</div>
			                <div field="prodsubmon" dataType="currency" width="90" align="right" headerAlign="center">产品采购1</div>
			                <!-- <div field="othmon" dataType="currency" width="90" align="right" headerAlign="center">产品采购2</div> -->
			                <div field="netprodmon" dataType="currency" width="90" align="right" headerAlign="center">产品净额</div>
			                <div field="prodwbmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保金额</div>
			                <div field="prodwbsubmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保分包费</div>
			                <div field="prodwbothmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保服务费</div>
			                <div field="prodwbnetmon" dataType="currency" width="90" align="right" headerAlign="center">产品维保净额</div>
			                <div field="buyprod" width="150" align="left" headerAlign="center">说明</div>
			            </div>
			        </div>    
			    </div>
            </div>
            <!-- 合同业务分类 -->
        	<div title="合同业务分类" >
		       	<fieldset style="border:solid 1px #aaa;padding:3px;">
		        	<legend>合同业务分类</legend>
			        <div id="csContType_grid" class="nui-datagrid" style="width:80%;height:auto;" dataField="contTypes" 
		            	showPager="false" url="com.primeton.mis.contract.contract.getContType.biz.ext" 
		            	 showSummaryRow="true" ondrawsummarycell="drawCsReveForecastSum">			            
			            <div property="columns">
			                <div field="contnum" width="100" headerAlign="center" align="left">合同编号</div>
			                <div field="contorderno" width="100" headerAlign="center" align="left">合同订单编号</div>
			                <div field="type" width="100" renderer="getCsContracttype" headerAlign="center" align="left">合同业务分类</div>
			                <div field="summon" dataType="currency" width="80" headerAlign="center" align="right" summaryType="sum">业务分类金额</div>
			                <div field="taxrate" dataType="currency" width="80" headerAlign="center" align="right">税率</div>
			                <div field="summon2" dataType="currency" width="80" headerAlign="center" align="right" summaryType="sum">不含税金额</div>
			            </div>
			        </div>
		        </fieldset>
	        </div>
            <!-- 合同收款 -->
        	<div title="合同收款预估" >
        		<fieldset style="border:solid 1px #aaa;padding:3px;width:98%;">
	            <legend>合同收款预估 </legend>
	            <div id="csGatherFc_grid" class="nui-datagrid" frozenStartColumn="0" frozenEndColumn="3" style="width:100%;height:auto;" dataField="csGatherFcs"
		            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
		            onrowclick="doUpdateCsGatherFc" 
		            showSummaryRow="true" ondrawsummarycell="drawCsGahterFcSum" allowCellWrap="true">			            
		            <div property="columns">
		                <div field="gatherno" width="80" headerAlign="center" align="center">收款确认次数</div>
		                <!-- AME_GATHERTYPE-收款类型：0-产品、1-服务、2-产品+服务 -->
		                <div field="gathertype" width="80" renderer="onGatherType" headerAlign="center" align="left">收款类型</div>
		                <div field="gathertimedesc" width="180" headerAlign="center" align="left">收款确认时点描述</div>
		                <!-- 最初预计确认年月 -->
		                <div field="yearmonth" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left">预计收款年月</div>
		                <!-- 最新预计确认年月 -->
		                <!-- <div field="newyearmonth" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left">预计收款年月</div> -->
		                <div field="productsum" width="80" dataType="currency" headerAlign="center" align="right">预计产品额</div>
		                <div field="servicesum" width="80" dataType="currency" headerAlign="center" align="right">预计服务额</div>
		                <div field="fcsum" width="100" dataType="currency" headerAlign="center" align="right" summaryType="sum">预计收款金额</div>
		                <div field="fcreverate" width="80" headerAlign="center" align="right" numberFormat="p1">预计收款比例</div>
		                <div field="status" width="80" renderer="onGatherStatus" headerAlign="center" align="left">当前收款状态</div>
		                <div field="billstatus" width="80" renderer="onGatherBillStatus" headerAlign="center" align="left">收款开票状态</div>
		                <div field="memo" width="150" headerAlign="center" align="left">说明</div>
		            </div>
		        </div>
		        </fieldset>
		       	<!--合同保函  -->
		        <fieldset style="border:solid 1px #aaa;padding:3px;width: 98%;">
		            <legend>合同保函记录</legend>
		            <div id="csContBack_grid" class="nui-datagrid" style="width:100%;height:auto;" 
			            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
			            showSummaryRow="true" ondrawsummarycell="drawCsBackdepSum" dataField="ameCsContBacks"allowCellWrap="true">			            
			            <div property="columns">
			                <div field="type" width="0" headerAlign="center" align="center">类型</div>
			                <div field="backdepmon" width="80" dataType="currency" headerAlign="center" align="right" summaryType="sum">金额</div>
			                <div field="perioddesc" width="180" headerAlign="center" align="left">期间描述</div>
			                <div field="isdeal" width="80" renderer="onGenderSaleseva" headerAlign="center" align="left">保函是否已办理</div>
			                <div field="status" width="80" renderer="onCsBackDepStatus" headerAlign="center" align="left">状态</div>
			                <div field="returnmon" width="80" dataType="currency" headerAlign="center" align="right" summaryType="sum">退还金额</div>
			                <div field="paydate" width="80" headerAlign="center"  renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保函开具日期</div>
			                <div field="predredate" width="80" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保函到期日期</div>
			                <div field="remark" width="100" headerAlign="center" align="left">备注</div>
			            </div>
			        </div>
			        <div style="width:100%;">
				        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				            <table style="width:100%;">
				            	<tr>
				                    <td style="width:20%;">
				                    	相关附件
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
		        <!--合同保证金  -->
		        <fieldset style="border:solid 1px #aaa;padding:3px;width: 98%;">
		            <legend>合同保证金记录</legend>
		            <div id="csContDep_grid" class="nui-datagrid" style="width:100%;height:auto;" 
			            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
			            showSummaryRow="true" ondrawsummarycell="drawCsBackdepSum"  dataField="ameCsContDeps"allowCellWrap="true">			            
			            <div property="columns">
			                <div field="type" width="0" headerAlign="center" align="center">类型</div>
			                <div field="backdepmon" width="80" dataType="currency" headerAlign="center" align="right" summaryType="sum">金额</div>
		                	<div field="expno" width="100" headerAlign="center" align="center" renderer="getDetail">付款申请单号</div>
			                <div field="perioddesc" width="180" headerAlign="center" align="left">期间描述</div>
			                <div field="isdeal" width="80" renderer="onGenderSaleseva" headerAlign="center" align="left">保证金是否已办理</div>
			                <div field="status" width="80" renderer="onCsBackDepStatus" headerAlign="center" align="left">状态</div>
			                <div field="returnmon" width="80" dataType="currency" headerAlign="center" align="right" summaryType="sum">退还金额</div>
			                <div field="paydate" width="80" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保证金打款日期</div>
			                <div field="predredate" width="100" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保证金预计退回日期</div>
			                <div field="practredate" width="100" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保证金实际退回日期</div>
			                <div field="remark" width="100" headerAlign="center" align="left">备注</div>
			            </div>
			        </div>
			        <div style="width:100%;">
				        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				            <table style="width:100%;">
				            	<tr>
				                    <td style="width:20%;">
				                    	相关附件
				                    </td>
				                </tr>
			                 </table>           
				        </div>
				    </div>
			        <div id="grid_2" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
						<div property="columns">
							<div type="indexcolumn" headerAlign="center" width="15" >编号</div>
							<div field="fileName"width="50" headerAlign="center" align="center" renderer="getfiledetail">附件名称</div>
							<div field="fileType" width="50" align="center" headerAlign="center" >附件类型</div>
							<div field="operatorname" width="50"headerAlign="center" align="center">操作员名称</div>
							<div field="fileTime" width="50" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
						</div>
					</div>
		        </fieldset>
	        </div>
	        <!-- 合同收入确认预估 -->
        	<div title="合同收入确认预估" >
        		<fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>合同收入确认</legend>
		            <div id="csReveForecast_grid" class="nui-datagrid" frozenStartColumn="0" frozenEndColumn="3" style="width:99%;height:auto;" dataField="csReveForecasts"
			            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
			            url="com.primeton.mis.contract.contract.getCsReveForecast.biz.ext" 
			            showSummaryRow="true" ondrawsummarycell="drawCsReveForecastSum">			            
			            <div property="columns">
			                <div field="reveno" width="55" headerAlign="center" align="center">收入次数</div>
			                <div field="revetype" width="120" renderer="onGenderInComeType" headerAlign="center" align="left">收入类型</div>
			                <div field="newtype" width="160" renderer="onGenderNewType" headerAlign="center" align="left">新合同收入类型</div>
			                <div field="reveproof" width="150" renderer="onGenderInComeConv" headerAlign="center" align="left">收入确认证据</div>
			                <div field="revetimedesc" width="130" headerAlign="center" align="left">收入时点描述</div>
			                <!-- 最初预计确认年月 -->
			                <div field="yearmonth" width="90" headerAlign="center" dateFormat="yyyy-MM" align="left">预计确认年月</div>
			                <!-- 最初预计确认旬度 -->
			                <div field="monthperiod" width="90" renderer="onGenderMonthperiod" headerAlign="center" align="left">预计确认旬度</div>
			                <!-- 最新预计确认年月 -->
			                <!-- <div field="newyearmonth" width="90" headerAlign="center" dateFormat="yyyy-MM" align="left">最新预计确认年月</div> -->
			                <!-- 最新预计确认旬度 -->
			                <!-- <div field="newmonthperiod" width="90" renderer="onGenderMonthperiod" headerAlign="center" align="left">最新预计确认旬度</div> -->
			                <div field="productsum" width="80" dataType="currency" headerAlign="center" align="right">预计产品额</div>
			                <div field="servicesum" width="80" dataType="currency" headerAlign="center" align="right">预计服务额</div>
			                <div field="masum" width="80" dataType="currency" headerAlign="center" align="right">预计MA额</div>
			                <div field="fcsum" width="100" dataType="currency" headerAlign="center" align="right" summaryType="sum">预计确认金额
			                </div>
			                <div field="fcreverate" width="80" headerAlign="center" align="right" numberFormat="p1">预计确认比例
			                </div>
			                <div field="status" width="100" renderer="onGenderStatus" headerAlign="center" align="left">状态</div>
			                <!-- 订单编号 -->
			                <!-- <div field="contorderno" width="110" headerAlign="center" align="center">订单编号</div> -->
			                <div field="saleseva" width="70" headerAlign="center" renderer="onGenderSaleseva" align="center">销售评估</div>
			                <div field="memo" width="150" headerAlign="center" align="left">说明</div>
			            </div>
			        </div>
		        </fieldset>
		        <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>产品收入分成</legend>
			        <div id="product_reve_grid" class="nui-datagrid" style="width:1300px;height:auto;" allowCellSelect="true" multiSelect="true" dataField="productReves" 
			            url="com.primeton.mis.contract.contractApproval.queryNewProdReve.biz.ext" showPager="false" allowCellEdit="true" showSummaryRow="true" 
			            ondrawsummarycell="drawProdReveSum">			            
			            <div property="columns">
			                <div field="reveno" width="100" headerAlign="center" >收入次数</div>
			                <div field="status" width="100" headerAlign="center" renderer="getStatus">收入状态</div>
			                <div field="newyearmonth" width="100" headerAlign="center" >最新预计确认年月</div>
			                <div field="confirmday" width="100" headerAlign="center" >实际确认日期</div>
			                <div field="prodname" displayField="prodtypename" width="150" headerAlign="center" >产品名称</div>
			                <div field="prodtypename1" width="120" headerAlign="center" >产品分类</div>
			                <div field="prodrevetype"  width="80" headerAlign="center" renderer="getReveProdtype">收入产品类型</div>
			                <div field="contsum" dataType="currency" width="80" align="right" headerAlign="center" summaryType="sum">参与分成合同额</div>
			                <div field="tax" dataType="currency" width="80" align="right" headerAlign="center" summaryType="sum">税金</div>
			                <div field="productrate" dataType="currency" width="80" align="right" headerAlign="center" >产品税率</div>
			                <div field="contsum2" dataType="currency" width="80" align="right" headerAlign="center" summaryType="sum">不含税合同额</div>
			                <div field="pratio" dataType="currency" width="60" align="right" headerAlign="center">分成比例</div>
			                <div field="pratiomon" dataType="currency" width="80" align="right" headerAlign="center" summaryType="sum">分成金额</div>
			            </div>
			        </div>
	        	</fieldset>
        	</div>
        	<div title="合同产品授权清单">
				<jsp:include page="/contract/contractApproval/ameCsLicDetailGrid.jsp"/>
			</div> 
        	<div title="合同附件">
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</div> 
		</div>
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 99%;">
            <legend>合同其他信息</legend>
            <div style="padding:5px;">
	        <table>
	            <tr>
                   <td style="width:140px;" align="right">MA服务开始日期：</td>
                    <td style="width:130px;" id="servstartdate" class = "asLabel">    
                    </td>
	                <td style="width:120px;" align="right">MA服务结束日期：</td>
	                <td style="width:130px;" id="servenddate" class = "asLabel">    
	                </td>
	                <td style="width:140px;" align="right">是否400转化合同：</td>
                    <td style="width:150px;" id="istrans" class = "asLabel">
                    </td>
                </tr>
                <tr>
                	<td style="width:140px;" align="right">服务数量类型：</td>
                    <td style="width:150px;" id="servnumtype" class = "asLabel">    
                    </td>
                    <td style="width:120px;" align="right">服务数量：</td>
                    <td style="width:150px;" id="servnum" class = "asLabel">    
                    </td>
                    <td style="width:140px;" align="right">服务开始日期：</td>
                    <td style="width:150px;" id="servstart" class = "asLabel">    
                    </td>
                </tr>
                <tr>                	
                    <td style="width:140px;" align="right">赠送服务数量类型：</td>
                    <td style="width:150px;" id="zsservtype" class = "asLabel">    
                    </td>
                    <td style="width:140px;" align="right">赠送服务数量：</td>
                    <td style="width:150px;" id="zsservnum" class = "asLabel">    
                    </td>
                    <td style="width:140px;" align="right">服务结束日期：</td>
                    <td style="width:150px;" id="servend" class = "asLabel">    
                    </td>
                </tr>
                <tr id="saleshap">
                    <td style="width:140px;" align="right">线索描述：</td>
                    <td style="width:300px;" id="cscontract.csSaleshap.telcontent" class = "asLabel"></td>
                	<td style="width:140px;" align="right">销售线索日期：</td>
                    <td style="width:100px;" id="cscontract.csSaleshap.insertdate" class = "asLabel"></td>
                    <td style="width:140px;" align="right">来源：</td>
                    <td style="width:140px;" class = "asLabel" id="cscontract.csSaleshap.source"  dictTypeId="MIS_SALESKEY_SOURCE" shownullitem="true"></td>
                </tr>
        	</table>
            </div>
        </fieldset>
        
		<fieldset style="border:solid 1px #aaa;padding:3px;" id="fieldset1">
	        <legend>审批意见列表</legend>
        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
			    url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext"  idField="id" allowResize="true"
			    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
			    <div property="columns">
			    	<div type="indexcolumn" headerAlign="center" width="30" >编号</div>
			        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
			        <div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
			        <div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center">处理结果</div>
			        <div field="auditopinion" width="150" headerAlign="center">处理意见</div>
			        <div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
			        <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
			        <div field="files" renderer="onFileRenderer" width="100" hight="100"  align="center" headerAlign="center">附件</div>
			    </div>
			</div>
	    </fieldset>
    </div>
</div>
<div style="text-align: center;padding: 10px;border-width:1px 0px 0px 0px;" class="nui-toolbar" id="s1">
	<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>  
</div>     
<script type="text/javascript">
    nui.parse();
    var form = new nui.Form("#form1");
    var isCommerce = false;//
    <l:iterate id="roles" property="userObject/attributes/roles" scope="session">
		var roleid = "<b:write iterateId='roles' property='roleid'/>";
		if(roleid == "commerce"){
			isCommerce = true;
		}
	</l:iterate>
	if(isCommerce == false){//非商务，不能增删改
		document.getElementById("remark").style.display="none";
	}
    
    
    
	
    //销售人员对应的grid的增加、删除方法
    //销售人员对应的产品的grid的增加、删除方法
	var sales_grid = nui.get("sales_grid");
	var product_grid = nui.get("product_grid");
	//合同收入预测
	var csReveForecast_grid = nui.get("csReveForecast_grid");
	//合同收款
	var csGatherFc_grid = nui.get("csGatherFc_grid");
	//产品分成
	var product_reve_grid = nui.get("product_reve_grid");
	//合同保函
	var csContBack_grid = nui.get("csContBack_grid");
	//合同保证金
	var csContDep_grid = nui.get("csContDep_grid");
	var csContType_grid = nui.get("csContType_grid");//合同业务分类
	
	var csContLicense_grid = nui.get("csContLicense_grid");//合同授权清单
    //销售人员点开对应的产品子grid时的方法
    var detailGrid_Form = document.getElementById("detailGrid_Form");        
	var currentRow=null;

	function onShowRowDetail(e) {
        var grid = e.sender;
        var row = e.record;            
        if(currentRow){//如果有当前行
        	var datas=product_grid.getData();
        	currentRow.saleProds=datas;
        }
		currentRow=row;		
        var td = grid.getRowDetailCellEl(row);
        td.appendChild(detailGrid_Form);            
        var saleProds = row.saleProds;
        if(saleProds){
            saleProds = nui.decode(saleProds);
            product_grid.setData(saleProds);
        }else{
			product_grid.setData({});
			row.saleProds = {};
		}
		$('#detailGrid_Form').show();
	}
	document.getElementById("fieldset1").style.display = "none";
	var stat = <%=request.getParameter("stat") %>;
	var processInstID = <%=request.getParameter("processInstID") %>;
	
	var doaction;
	var projectid=null;
	
	init();
    function init() {
      
    	form.mask("数据加载中...");
    	doaction = "new";
    	//流程提示信息
		var data={"processInstID":processInstID};
		var json=nui.encode(data);
		
		nui.ajax({
			url:"com.primeton.mis.contract.contractApproval.getAmeContract.biz.ext",
			type:"post",
			data:json,
			contentType:"text/json",
			success:function (o){
				form.unmask();
				form.setData(o);
                form.isChanged(false);
                sales_grid.setData(o.cscontract.cscontractsales);
                csGatherFc_grid.setData(o.cscontract.csGatherFcs);
                csReveForecast_grid.setData(o.cscontract.csReveForecasts);
                csContBack_grid.setData(o.cscontract.ameCsContBacks);
                csContDep_grid.setData(o.cscontract.ameCsContDeps);
                csContType_grid.setData(o.cscontract.ameCsContTypes);
                product_reve_grid.sortBy("reveid","asc");
				product_reve_grid.load({"contractid": o.cscontract.contractid});
				//合同产品授权
				csContLicense_grid.load({contractid: o.cscontract.contractid});
				csContLicense_grid.hideColumn(0);
				//加载附件设置参数
        		nui.get("grid_0").load({"groupid":"AME_CS_CONTRACT","relationid": o.cscontract.contractid},function(){
					//加载合同保函附件
	        		nui.get("grid_1").load({"groupid":"AME_CS_CONT_BACK","relationid": o.cscontract.contractid},function(){
						//加载接通保证金附件
		        		nui.get("grid_2").load({"groupid":"AME_CS_CONT_DEP","relationid": o.cscontract.contractid});
	        		});
        		});
        		
                document.getElementById("purChaseYesOrNo").innerHTML =nui.getDictText('MIS_YN',o.cscontract.isProBudget);;
                document.getElementById("contracttype").innerHTML =nui.getDictText('MIS_CONTRACTTYPE',o.cscontract.contracttype);
                document.getElementById("contid").innerHTML = o.cscontract.contid == null ?"":o.cscontract.contid;
                document.getElementById("projectname").innerHTML = o.cscontract.projectname == null ? "":o.cscontract.projectname;
                document.getElementById("custname").innerHTML = o.cscontract.misCustinfo == null ?"":o.cscontract.misCustinfo.custname;
                document.getElementById("signtarget").innerHTML = nui.getDictText('CS_SIGNTARGET',o.cscontract.signtarget);
                document.getElementById("username").innerHTML = o.cscontract.username == null ?"":o.cscontract.username;
                document.getElementById("zbjbl").innerHTML = o.cscontract.zbjbl == null ?"":o.cscontract.zbjbl;
                document.getElementById("industry").innerHTML = nui.getDictText('MIS_INDUSTRY_SUBDIVISION',o.cscontract.industry);
                document.getElementById("servnumtype").innerHTML = nui.getDictText('SERV_NUM_TYPE',o.cscontract.servnumtype);
                document.getElementById("servnum").innerHTML = o.cscontract.servnum == null ?"":o.cscontract.servnum;
                document.getElementById("servstart").innerHTML = o.cscontract.servstart == null ?"":o.cscontract.servstart;
                document.getElementById("zsservtype").innerHTML = nui.getDictText('SERV_NUM_TYPE',o.cscontract.zsservtype);
                document.getElementById("zsservnum").innerHTML = o.cscontract.zsservnum == null ?"":o.cscontract.zsservnum;
                document.getElementById("servend").innerHTML = o.cscontract.servend == null ?"":o.cscontract.servend;
                document.getElementById("servsubmon").innerHTML = o.cscontract.servsubmon == null ?"":formatNumber(o.cscontract.servsubmon.toFixed(2),'#,##.00');
                document.getElementById("contsum").innerHTML = o.cscontract.contsum == null ?"":formatNumber(o.cscontract.contsum.toFixed(2),'#,##.00');
                document.getElementById("prodmon").innerHTML = o.cscontract.prodmon == null ? "":formatNumber(o.cscontract.prodmon.toFixed(2),'#,##.00');
                document.getElementById("servmon").innerHTML = o.cscontract.servmon == null ? "":formatNumber(o.cscontract.servmon.toFixed(2),'#,##.00');
                document.getElementById("isforbid").innerHTML = nui.getDictText('MIS_YN',o.cscontract.isforbid);
                document.getElementById("ishighrisk").innerHTML = nui.getDictText('MIS_YN',o.cscontract.ishighrisk);
                /* document.getElementById("othmon").innerHTML = o.cscontract.othmon == null ?"":formatNumber(o.cscontract.othmon.toFixed(2),'#,##.00'); */
                document.getElementById("xystart").innerHTML = o.cscontract.xystart == null?"":o.cscontract.xystart;
                document.getElementById("xyend").innerHTML = o.cscontract.xyend == null?"":o.cscontract.xyend;
                document.getElementById("ispt").innerHTML = nui.getDictText('MIS_YN',o.cscontract.ispt);
              //判断是否有排他合作
                 if(o.cscontract.ispt=='1'){
	               document.getElementById("pt1").style.display = ""; 
	               document.getElementById("ptcondition").style.display = ""; 

		           }else{
					 document.getElementById("pt1").style.display = "none";
					 document.getElementById("ptcondition").style.display = "none"; 
					}		
					
                document.getElementById("ptcondition").innerHTML = o.cscontract.ptcondition == null ?"":o.cscontract.ptcondition;
                document.getElementById("content1").innerHTML = o.cscontract.paycondition == null ?"":o.cscontract.paycondition;
                document.getElementById("servstartdate").innerHTML = o.cscontract.servstartdate == null ?"":o.cscontract.servstartdate;
                document.getElementById("servenddate").innerHTML = o.cscontract.servenddate == null ?"":o.cscontract.servenddate;
                document.getElementById("istrans").innerHTML = nui.getDictText('MIS_YN',o.cscontract.istrans);
               document.getElementById("publicity").innerHTML = nui.getDictText('MIS_YN',o.cscontract.publicity);
               document.getElementById("isfinreve").innerHTML = nui.getDictText('MIS_YN',o.cscontract.isfinreve); 
        		if(o.cscontract == null || o.cscontract.saleshapid==null){
					document.getElementById("saleshap").style.display = "none";
				}else{
				/*销售线索新加字段*/
					document.getElementById("cscontract.csSaleshap.insertdate").innerHTML = o.cscontract.csSaleshap.insertdate == null ?"":o.cscontract.csSaleshap.insertdate;
					document.getElementById("cscontract.csSaleshap.telcontent").innerHTML = o.cscontract.csSaleshap.telcontent == null ?"":o.cscontract.csSaleshap.telcontent;
					document.getElementById("cscontract.csSaleshap.source").innerHTML = nui.getDictText('MIS_SALESKEY_SOURCE',o.cscontract.csSaleshap.source);
				}
				if(o.cscontract == null || o.cscontract.projectno == null ){
					document.getElementById("project").style.display = 'none';
					/* var tabs = nui.get("tabs1");
					var list_tab =tabs.tabs[3];
					tabs.updateTab(list_tab, { visible: false }); */
				}else{
				/*合同项目信息*/
					projectid = o.cscontract.rdproject.projectId;
               		document.getElementById("projectno").innerHTML = o.cscontract.projectno == null ?"":o.cscontract.projectno;
               		document.getElementById("rdproject.projectName").innerHTML = o.cscontract.rdproject.projectName == null ?"":o.cscontract.rdproject.projectName;
	                document.getElementById("omOrganization.orgname").innerHTML = o.cscontract.rdproject.omOrganization == null ?"":o.cscontract.rdproject.omOrganization.orgname;
	                document.getElementById("rdproject.projectType").innerHTML = nui.getDictText('PROJECT_TYPE',o.cscontract.rdproject.projectType);
	                document.getElementById("rdproject.custname").innerHTML = o.cscontract.rdproject.custname == null ?"":o.cscontract.rdproject.custname;
	                document.getElementById("rdproject.projectStatus").innerHTML = nui.getDictText('MIS_PROJSTATUS',o.cscontract.rdproject.projectStatus);
	                document.getElementById("rdproject.outstatus").innerHTML = nui.getDictText('MIS_PROJOUTSTATUS',o.cscontract.rdproject.outstatus);
	                document.getElementById("rdproject.startdate").innerHTML = o.cscontract.rdproject.startdate == null ?"":o.cscontract.rdproject.startdate;
	                document.getElementById("rdproject.expenddate").innerHTML = o.cscontract.rdproject.expenddate == null ?"":o.cscontract.rdproject.expenddate;
					document.getElementById("rdproject.isconproj").innerHTML = nui.getDictText('MIS_YN',o.cscontract.rdproject.isconproj);
					document.getElementById("rdproject.manager").innerHTML = o.cscontract.rdproject.managername == null ?"":o.cscontract.rdproject.managername;
				
 					var tabs1 =nui.get("tabs1");
					var tab_bb = {name: "tab_service", id: "tab_service", title: "项目预算损益信息",url:"<%=request.getContextPath() %>/project/rdproject/projectprofit.jsp?projid="+projectid};//项目损益页面
					tabs1.addTab(tab_bb,3);
				}
				
				var contracttype = o.cscontract.contracttype;
               	/* //编辑的时候隐藏最初预计确认年月和最初预计确认旬度
            	csReveForecast_grid.hideColumn(csReveForecast_grid.getColumn(8));
            	csReveForecast_grid.hideColumn(csReveForecast_grid.getColumn(9));
            	//编辑的时候隐藏合同收款的最初预计确认年月
            	csGatherFc_grid.hideColumn(csGatherFc_grid.getColumn(5)); */
            	if(contracttype == "01" || contracttype == "04" || contracttype == "20"){//产品合同、混合合同
					//document.getElementById("temp1").style.display = "";
					//document.getElementById("industry").style.display = "";
					//document.getElementById("temp2").style.display = "none";
					//document.getElementById("temp3").style.display = "none";
					
					document.getElementById("starttime1").style.display = "none";
			        document.getElementById("xystart").style.display = "none";
			        document.getElementById("endtime1").style.display = "none";
			        document.getElementById("xyend").style.display = "none";
				}else if(contracttype == "08" || contracttype == "10"){//服务合同
					//document.getElementById("temp1").style.display = "";
					//document.getElementById("industry").style.display = "";
					//document.getElementById("temp2").style.display = "none";
					//document.getElementById("temp3").style.display = "none";
					document.getElementById("starttime1").style.display = "none";
			        document.getElementById("xystart").style.display = "none";
			        document.getElementById("endtime1").style.display = "none";
			        document.getElementById("xyend").style.display = "none";
				}else{//框架协议
					//document.getElementById("temp1").style.display = "none";
					//document.getElementById("industry").style.display = "none";
					//document.getElementById("temp2").style.display = "";
					//document.getElementById("temp3").style.display = "";
					document.getElementById("starttime1").style.display = "";
			        document.getElementById("xystart").style.display = "";
			        document.getElementById("endtime1").style.display = "";
			        document.getElementById("xyend").style.display = "";
				}
				//审批意见
				var grid = nui.get("datagrid1");
				if(stat!='1'){
					document.getElementById("fieldset1").style.display = "";
					document.getElementById("s1").style.display = "none";
					if(o.cscontract.processinstid!=null&&o.cscontract.processinstid!=""){
						grid.load({processInstID:o.cscontract.processinstid});
						grid.sortBy("time", "desc");
					}
				}
			},
			error:function(){}
		});
	}
	function getDetail(e){
		if(e.value){
    		return "<a href='javascript:void(0)' onclick='checkDetailPayApply();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    function checkDetailPayApply(){
 		var selectRow = csContDep_grid.getSelected();
		var executeUrl = "/default/ame_fee/PaymentApply/PayApplyDetail.jsp?expid=" + selectRow.expid;
		window.open(executeUrl, "付款申请明细", "fullscreen=1");
    }
    //附件下载
    function getfiledetail(e){
    	var record = e.record;
        var uid = record._uid;
        var groupId = record.groupId;
    	return "<a href='javascript:void(0)' type='"+groupId+"' uid='"+uid+"' onclick='checkfiledetail(this);' title='点击查看'>" + e.value + "</a>";
    }
    function checkfiledetail(obj){
    	var groupId = $(obj).attr("type");
    	var uid = $(obj).attr("uid");
    	if(groupId == "AME_CS_CONTRACT"){
    		var grid = nui.get("grid_0");
    	}else if(groupId == "AME_CS_CONT_BACK"){
    		var grid = nui.get("grid_1");
    	}else{
    		var grid = nui.get("grid_2");
    	}
    	var selectRow = grid.getSelected();
    	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
		window.open(url, '_self');
    }  
    //附件
    function onFileRenderer(e) {
        var tempSrc = "";
    	//长度为1，不换行
    	if(e.record.files==null){
    		return;
    	}
    	if(e.record.files.length == 1){
        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[0].fileId + "'>" + e.record.files[0].fileName + "</a>";
    	}else{
	        for(var i=0;i<e.record.files.length;i++){
	        	//长度大于1小于长度length换行
	        	if(i< e.record.files.length-1){
	        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>&nbsp;&nbsp;</br>";
	        	}
	        	//最后一个不换行
        		if(i == e.record.files.length-1){
	        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>";
	        	}
	        }
    	}
       	return tempSrc;
     }
	function getReveProdtype(e){
		return nui.getDictText('REVE_PRODTYPE',e.value);
	}
	function onCheckRenderer(e) {
		return nui.getDictText('MIS_AUDITSTATUS',e.value);
	}
	function onGenderRenderer(e) {
        return nui.getDictText('CONT_ORG',e.value);
    }
    function onGenderInComeType(e) {
        return nui.getDictText('AME_REVETYPE',e.value);
    }
    function onGenderNewType(e) {
        return nui.getDictText('AME_NEWTYPE',e.value);
    }
    function onGenderMonthperiod(e){
    	return nui.getDictText('AME_MONTHPERIOD',e.value);
    }
    function onGenderInComeConv(e){
    	return nui.getDictText('MIS_INCOMECONV',e.value);
    }
    function onGenderStatus(e){
    	return nui.getDictText('AME_REVESTATUS',e.value);
    }
    //是否提供预算
    function onGenderSaleseva(e){
    	return nui.getDictText('MIS_YN',e.value);
    }
    //合同保函保证金状态
    function onCsBackDepStatus(e){
    	return nui.getDictText('CS_BACK_DEP',e.value);
    }
    function getStatus(e) {
        return nui.getDictText('AME_REVESTATUS',e.value);
    } 
	
    //关闭
   function onCancel(){
		CloseWindow("cancel");
	}
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
        
    function onCancel(e) {
        CloseWindow("cancel");
    }
     //合同收款列表-行点击
     function doUpdateCsGatherFc(){
     
     }
     
     //合同收款列表-收款类型业务字典
     function onGatherType(e){
     	return nui.getDictText('AME_GATHERTYPE',e.value);
     }
     
     //合同收款列表-收款状态业务字典
     function onGatherStatus(e){
     	return nui.getDictText('AME_GATHERSTATUS',e.value);
     }
     function onGatherBillStatus(e){
     	return nui.getDictText('MIS_GATHERBILL',e.value);
     }
     
	//合同业务分类
    function getCsContracttype(e){
		return nui.getDictText('CS_CONTRACT_TYPE',e.value);
	}
		
	//合同产品授权单位
    function getCsContLicType(e){
		return nui.getDictText('CS_CONT_LIC_UNIT',e.value);
	}
	
     csGatherFc_grid.on("drawcell", function (e) {
        var record = e.record,
        column = e.column,
        field = e.field,
        value = e.value;
        //状态为已收款的，设置行样式
    	if(record.status == 2){
        	e.cellStyle = "background-color: 33FFFF";
    	}
	});
	
	function drawCsGahterFcSum(e){
		if (e.field == "fcsum") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	function drawCsBackdepSum(e){
		if (e.field == "backdepmon" || e.field == "returnmon") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	function drawProdReveSum(e){
		if (e.field == "contsum" || e.field == "tax"|| e.field == "contsum2"|| e.field == "pratiomon") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	csReveForecast_grid.on("drawcell", function (e) {
        var record = e.record,
        column = e.column,
        field = e.field,
        value = e.value;
        //状态为已确认收入的，设置行样式
    	if(record.status == "3"){
        	e.cellStyle = "background-color: 33FFFF";
    	}
	});
	
	function drawCsReveForecastSum(e){
		if (e.field == "fcsum" || e.field == "summon"|| e.field == "summon2") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "total" || e.field == "grantnum"|| e.field == "lastnum") {
            e.cellHtml = "<div align='center'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	var editor1 = null;
	 KindEditor.ready(function(K) {
			editor1 = K.create('textarea[name="content1"]', {
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
	
	
	
</script>
</body>
</html>