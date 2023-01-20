<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%
	String contextPath=request.getContextPath();
 %>
<html xmlns="http://www.w3.org/1999/xhtml">
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
	<head>
	    <title>合同信息查看</title>
	    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<link href="../demo.css" rel="stylesheet" type="text/css" />
		<script src="<%= contextPath %>/common/nui/nui.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
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
<div class="nui-fit">
    <form id="form1" method="post" >
        <input name="cscontract.contractid" id="conId" class="nui-hidden" />
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>合同基本信息</legend>
            <div style="padding:5px;">
            <table width="100%" border="0" style="table-layout:fixed;" >
                <tr>
                    <td style="width:110px;text-align:right;">合同存档编号：</td>
                    <td style="width:125px;" id="cscontract.contnum" class = "asLabel"></td>
	                <td style="width:110px;text-align:right;">合同签署日期：</td>
	                <td style="width:125px;" id="cscontract.signdate" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">签署单位：</td>
                    <td style="width:360px;" colspan="3" id="cscontract.misCustinfo.custname" class = "asLabel"></td>
                </tr>
                <tr>
                    <td style="width:110px;text-align:right">最终用户：</td>
                    <td style="width:360px;" colspan="3" id="cscontract.username" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">合同名称(项目)：</td>
                    <td style="width:360px;" colspan="3" id="cscontract.projectname" class = "asLabel"></td>
                </tr>
                <tr>
                    <td style="width:110px;text-align:right">原始合同总金额：</td>
                    <td style="width:125px;"class = "asLabel"><div><b id="cscontract.contsumAct" ></b></div></td>
                    <td style="width:110px;text-align:right">原始产品金额：</td>
                    <td style="width:125px;" id="cscontract.prodmonAct" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">原始服务金额：</td>
                    <td style="width:125px;" id="cscontract.servmonAct" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">原始MA金额：</td>
                    <td style="width:125px;" id="cscontract.prodwbmonAct" class = "asLabel"></td>
                </tr>
                <tr>
                    <td style="width:110px;text-align:right">减值合同总金额：</td>
                    <td style="width:125px;" class = "asLabel"><div><b id="cscontract.contsumJz"></b></div></td>
                    <td style="width:110px;text-align:right">减值产品金额：</td>
                    <td style="width:125px;" id="cscontract.prodmonJz" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">减值服务金额：</td>
                    <td style="width:125px;" id="cscontract.servmonJz" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">减值MA金额：</td>
                    <td style="width:125px;" id="cscontract.prodwbmonJz" class = "asLabel"></td>
                </tr>
                <tr>
                    <td style="width:110px;text-align:right">可执行合同总金额：</td>
                    <td style="width:125px;" class = "asLabel"><div><b id="cscontract.contsum"></b></div></td>
                    <td style="width:110px;text-align:right">可执行产品金额：</td>
                    <td style="width:125px;" id="cscontract.prodmon" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">可执行服务金额：</td>
                    <td style="width:125px;" id="cscontract.servmon" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">可执行MA金额：</td>
                    <td style="width:125px;" id="cscontract.prodwbmon" class = "asLabel"></td>
                </tr>
                <tr>
                    <td style="width:110px;text-align:right">销售：</td>
                    <td style="width:125px;" id="cscontract.salename" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">部门：</td>
                    <td style="width:125px;" id="cscontract.org" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">服务类型：</td>
                    <td style="width:125px;" id="cscontract.servnumtype" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">服务数量：</td>
                    <td style="width:125px;" id="cscontract.servnum" class = "asLabel"></td>
                </tr>
                <tr>
                    <td style="width:110px;text-align:right">行业：</td>
                    <td style="width:125px;" id="cscontract.industry" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">所属公司：</td>
                    <td style="width:125px;" id="cscontract.company" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">赠送服务类型：</td>
                    <td style="width:125px;" id="cscontract.zsservtype" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">赠送服务数量：</td>
                    <td style="width:125px;" id="cscontract.zsservnum" class = "asLabel"></td>
                </tr>
                <tr>
                    <td style="width:110px;text-align:right">产品验收报告：</td>
                    <td style="width:125px;" id="cscontract.cpysbg" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">服务验收报告：</td>
                    <td style="width:125px;" id="cscontract.fwysbg" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">收入确认是否跨期：</td>
                    <td style="width:125px;" id="cscontract.srqrsfkq" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">质保金比例：</td>
                    <td style="width:125px;" id="cscontract.zbjbl" class = "asLabel"></td>
                </tr>
                <tr>
                    <td style="width:110px;text-align:right">服务开始日期：</td>
                    <td style="width:125px;" id="cscontract.servstart" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">服务结束日期：</td>
                    <td style="width:125px;" id="cscontract.servend" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">合同付款条件：</td>
                    <td style="width:125px;" id="cscontract.htfktj" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">新合同收入类型：</td>
                    <td style="width:125px;" id="cscontract.newtype" class = "asLabel"></td>
                </tr>
<!--                 <tr>
                    <td style="width:110px;text-align:right">SOA金额：</td>
                    <td style="width:125px;" id="cscontract.soamon" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">云计算金额：</td>
                    <td style="width:125px;" id="cscontract.yjsmon" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">大数据金额：</td>
                    <td style="width:125px;" id="cscontract.dsjmon" class = "asLabel"></td>
                    <td style="width:120px;" align="right">移动金额：</td>
                    <td style="width:100px;"id="cscontract.mobilemon" class = "asLabel"></td>
                </tr>
 -->                <tr>
                    <!-- <td style="width:110px;text-align:right">其他金额</td>
                    <td style="width:125px;" id="cscontract.qtmon" class = "asLabel"></td> -->
                    <td style="width:110px;text-align:right">产品安装日期：</td>
                    <td style="width:125px;" id="cscontract.cpazrq" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">初验日期：</td>
                    <td style="width:125px;" id="cscontract.cyrq" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">终验日期：</td>
                    <td style="width:125px;" id="cscontract.zyrq" class = "asLabel"></td>
                </tr>
                <tr>
                    <td style="width:110px;text-align:right">人月结算单日期1：</td>
                    <td style="width:125px;" id="cscontract.ryjsdrq1" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">人月结算单日期2：</td>
                    <td style="width:125px;" id="cscontract.ryjsdrq2" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">人月结算单日期3：</td>
                    <td style="width:125px;" id="cscontract.ryjsdrq3" class = "asLabel"></td>
                    <td style="width:110px;text-align:right">人月结算单日期4：</td>
                    <td style="width:125px;" id="cscontract.ryjsdrq4" class = "asLabel"></td>
                </tr>
                <tr>
                    <td style="width:110px;text-align:right">纯服务业务类型：</td>
                    <td style="width:125px;" id="cscontract.cfwssywlx" class = "asLabel"></td>
                	<td style="width:110px;text-align:right">已上传的文件：</td>
                	<td style="width:830px;" id="uploadedFile" colspan="5" class = "asLabel"></td>
                </tr>
            </table>
        </div>
        </fieldset>
        <div id="panel1" class="mini-panel" title="合同发票信息查询" style="width:100%;height:auto" showToolbar="true" 
			showCollapseButton="true" showFooter="true" allowResize="true" collapseOnTitleClick="true" expanded="true">
            <div id="grid_billTicket" class="nui-datagrid" style="width:100%;height: 340px;" showSummaryRow="true" frozenStartColumn="0" frozenEndColumn="4" 
				ondrawsummarycell="doCountNowPage" url="com.primeton.eos.ame_income.gatherFcBilling.queryBillTicket.biz.ext" 
				dataField="queryBillTickets" allowResize="true" sizeList="[10,20,30,50,100]" pageSize="20" allowAlternating="true" multiSelect="false">
			    <div property="columns">
			    	<div field="billno" width="90" headerAlign="center" align="center" allowSort="true">发票票号</div>
			    	<div field="custname" width="150" headerAlign="center" allowSort="true" renderer="onTitleRenderer2">开票单位</div>
			        <div field="ticketdate" width="80" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">发票日期</div>
			        <div field="type" width="70" renderer="onGenderRenderer" align="center" headerAlign="center" allowSort="true">开票类型</div>
			        <div field="money" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">发票金额</div>
			        <div field="tax" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">税金</div>
			        <div field="u8xse" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">销售额</div>
			        <div field="taxrate" width="100" dataType="currency"  align="right" headerAlign="center" allowSort="true">税率</div>
			        <div field="status" width="85" renderer="onGender2Renderer" align="center" headerAlign="center" allowSort="true">发票状态</div>
			        <div field="price" width="110" dataType="currency"  align="right" headerAlign="center" allowSort="true">服务/产品单价</div>
			        <div field="num" width="110" dataType="currency"align="right" headerAlign="center" allowSort="true">服务/产品数量</div>
			        <div field="unit" width="60" headerAlign="center" renderer="onUnitRenderer">产品单位</div>
			        <div field="moneySub" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">服务/产品金额</div>
			        <div field="taxSub" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">服务/产品税金</div>
			        <div field="u8xseSub" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">服务/产品销售额</div>
			        <div field="taxrateSub" width="100" dataType="currency"  align="right" headerAlign="center" allowSort="true">服务/产品税率</div>
			        <div field="saleProStatus" width="85" renderer="onGender3Renderer" align="center" headerAlign="center" allowSort="true">服务/产品状态</div>
			        <div field="billtypename" width="85" headerAlign="center" align="center" allowSort="true">发票类型</div>
			    </div>
		    </div>
        </div>
        <div id="panel2" class="mini-panel" title="合同收款情况" style="width:100%;height:auto" showToolbar="true" 
			showCollapseButton="true" showFooter="true" allowResize="true" collapseOnTitleClick="true" expanded="true">
	        <div id="grid_csGatherFc" class="nui-datagrid" style="width:100%;height:auto" allowResize="true" dataField="csGatherFcs" showSummaryRow="true" ondrawsummarycell="doCountNowPage"
		    	url="com.primeton.mis.newcont.newCont.queryCsGatherFcByContnum.biz.ext" showPager="false">
				<div property="columns">
					<div field="gatherno" width="60" align="center"  headerAlign="center" renderer="detailGather">收款次数</div>
					<div field="status" width="120" align="center" headerAlign="center" renderer="dictGatherstatus">收款状态</div>		
					<div field="newyearmonth" width="85" align="center"  headerAlign="center" renderer="dateRenderer">预计收款年月</div>	
					<div field="fcsum" width="130" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收款金额（含税）</div>	
					<div field="actsum" width="70" align="right" headerAlign="center" dataType="currency" summaryType="sum" >实际收款金额</div>	
					<div field="confirmday" width="80" align="center" headerAlign="center" >实际收款日期</div>
					<div field="gathertype" width="80" align="center"  headerAlign="center" renderer="dictgathertype">收款类型</div>
				</div>
			</div>
        </div>
        <div id="panel3" class="mini-panel" title="收入确认依据信息" style="width:100%;height:auto" showToolbar="true" 
			showCollapseButton="true" showFooter="true" allowResize="true" collapseOnTitleClick="true" expanded="true">
	        <div id="grid_income" class="nui-datagrid" style="width:100%;height:auto;" allowResize="false" dataField="csReveForecastFins" showSummaryRow="true" ondrawsummarycell="doCountNowPage"
    	 		url="com.primeton.eos.ame_income.csReveForecast.queryFinIncome.biz.ext" allowCellSelect="true"  showPager="false" 
    	 		onselectionchanged="selectionChanged"  multiSelect="false">
				<div property="columns">
					<div field="reveno" width="60" headerAlign="center" align="center" headerAlign="center">收入确认次数</div>
					<div field="status" width="70" align="center" headerAlign="center" renderer="dictstatus">目前确认状态</div>		
					<div field="actsum" width="70" align="right" headerAlign="center" dataType="currency" summaryType="sum" >实际确认金额</div>	
					<div field="confirmday" width="70" align="center" headerAlign="center" >财报确认日期</div>		
					<div field="revetype" width="80" align="center"  headerAlign="center" renderer="dictReveType">收入类型</div>
					<div field="newtype" width="80" align="center"  headerAlign="center" renderer="dictNewType">新合同收入类型</div>
					<div field="actreveproof" width="80" headerAlign="center" align="center" headerAlign="center" renderer="dictproof">收入确认证据</div>
					<div field="files" width="130" align="left" headerAlign="center" renderer="onFileRenderer">附件</div>		
				</div>
			</div>
		</div>
		<div id="panel4" class="mini-panel" title="合同毛利信息" style="width:100%;height:auto" showToolbar="true" 
			showCollapseButton="true" showFooter="true" allowResize="true" collapseOnTitleClick="true" expanded="true">
		        <div id="grid_csContGross" class="nui-datagrid" style="width:100%;height:240px;"  dataField="data" showSummaryRow="true"   allowCellWrap="true" 
			    	url="com.primeton.mis.newcont.newCont.queryCsGross.biz.ext" allowCellSelect="true" showPager="false"   multiSelect="true" >
				</div>
        </div>
        <div id="panel5" class="mini-panel" title="合同收入与成本结转确认信息" style="width:100%;height:auto" showToolbar="true" 
			showCollapseButton="true" showFooter="true" allowResize="true" collapseOnTitleClick="true" expanded="true">
		        <div id="grid_csContStock" class="nui-datagrid" style="width:100%;height:650px;"  dataField="data" showSummaryRow="true"   allowCellWrap="true" 
			    	url="com.primeton.mis.newcont.newCont.queryCsContStock.biz.ext" allowCellSelect="true" showPager="false"  multiSelect="true" >
				</div>
        </div>
        <div id="panel6" class="mini-panel" title="采购成本明细" style="width:100%;height:auto" showToolbar="true" 
			showCollapseButton="true" showFooter="true" allowResize="true" collapseOnTitleClick="true" expanded="true">
		    <div id="grid_purOutcost" class="nui-datagrid" style="width:100%;height:auto" allowResize="true" dataField="purOutCosts" 
		    	url="com.primeton.mis.newcont.newCont.purOutCostQueryByContractid.biz.ext" allowResize="true"  showPager="false" showSummaryRow="true" ondrawsummarycell="doCountNowPage">
			    <div property="columns">
			    	<div field="outcostid" width="40px;" align="center" headerAlign="center" renderer="getOutCostDetail">编号</div>
			    	<div field="outcosttype" width="80px;" align="center" headerAlign="center" renderer="dictOutcosttype">成本结转类型</div>
			    	<div field="confirmdate" width="80px;" align="center" headerAlign="center">成本确认日期</div>
			    	<div field="taxmon" width="115px;" align="right" headerAlign="center" currencyUnit="￥" summaryType="sum" dataType="currency">成本结转金额(含税)</div>
			    	<div field="notaxmon" width="115px;" align="right" headerAlign="center" currencyUnit="￥" summaryType="sum" dataType="currency">成本结转金额(不含税)</div>
			    	<div field="suppliersname" width="70px;" align="center" headerAlign="center">供应商简称</div>
			    	<div field="settlementno" width="70px;" align="left" headerAlign="center" renderer="getDetail">结算单编号</div>
			    	<div field="settlemon" width="90px;" align="right" headerAlign="center" currencyUnit="￥" summaryType="sum" dataType="currency">结算单金额</div>
			    	<div field="accruedid" width="70px;" align="left" headerAlign="center" renderer="getAccDetail">计提单编号</div>
			    	<div field="accruedmon" width="65px;" align="right" headerAlign="center" currencyUnit="￥" summaryType="sum" dataType="currency">计提金额</div>
			    	<div field="startdate" width="80px;" align="center" headerAlign="center" >成本开始日期</div>
			    	<div field="enddate" width="80px;" align="center" headerAlign="center" >成本结束日期</div>
			    	<div field="costmemo" width="80px;" align="center" headerAlign="center" renderer="dictCostmemo">成本结转说明</div>
			    	<div field="stockdate" width="80px;" align="center" headerAlign="center" >存货结转日期</div>
			    	<div field="orgname" width="60px;" align="center" headerAlign="center">受益部门</div>
			    	<div field="purcontno" width="70px;" align="left" headerAlign="center" renderer="getPurContractDetail">采购合同编号</div>
			    	<div field="purorderno" width="90px;" align="left" headerAlign="center" >采购订单编号</div>
			    </div>
			</div>
	    </div>
        <div id="panel7" class="mini-panel" title="合同应收预收账款信息" style="width:100%;height:auto" showToolbar="true" 
			showCollapseButton="true" showFooter="true" allowResize="true" collapseOnTitleClick="true" expanded="true">
		        <div id="grid_csMoney" class="nui-datagrid" style="width:100%;height:auto;"  dataField="data" showSummaryRow="true"   allowCellWrap="true" 
			    	url="com.primeton.mis.newcont.newCont.queryCsMoney.biz.ext" allowCellSelect="true" showPager="false"  multiSelect="true" >
				</div>
        </div>
        <div id="panel8" class="mini-panel" title="合同应付账款信息" style="width:100%;height:auto" showToolbar="true" 
			showCollapseButton="true" showFooter="true" allowResize="true" collapseOnTitleClick="true" expanded="true">
		        <div id="grid_csCope" class="nui-datagrid" style="width:100%;height:auto;"  dataField="data" showSummaryRow="true"   allowCellWrap="true" 
			    	url="com.primeton.mis.newcont.newCont.queryCsCope.biz.ext" allowCellSelect="true" showPager="false"  multiSelect="true" >
				</div>
        </div>
        <!-- 
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>产品服务收入</legend>
            <div style="padding:5px;">
	        	<div id="cpfwsr_grid" class="nui-datagrid" url="com.primeton.mis.newcont.newCont.getCpfwsrByContractid.biz.ext" style="width:100%;height:auto;" allowResize="true" pageSize="100" showPager="false" showSummaryRow="true" ondrawsummarycell="doCountNowPage1">			        
			        <div property="columns">
			            <div field="dictName" width="40" headerAlign="center" allowSort="true">类型</div>
				        <div field="a"" width="60"align="center" headerAlign="center" allowSort="true">2012年以前收入</div>
				        <div field="b" width="60" align="right" headerAlign="center" allowSort="true">2013年收入</div>
				        <div field="c" width="60" align="right" headerAlign="center" allowSort="true">2014年收入</div>
				        <div field="d" width="60" align="right" headerAlign="center" allowSort="true">2015年收入</div>
			        </div>
			    </div>
            </div>
        </fieldset>
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend>业务类型</legend>
            <div style="padding:5px;">
	        	<div id="ywlx_grid" class="nui-datagrid" url="com.primeton.mis.newcont.newCont.getYwlxByContractid.biz.ext" style="width:100%;height:auto;" allowResize="true" pageSize="100" showPager="false" showSummaryRow="true" ondrawsummarycell="doCountNowPage">			        
			        <div property="columns">
			            <div field="dictName" width="40" headerAlign="center" allowSort="true">类型</div>
				        <div field="a"" width="60"align="center" headerAlign="center" allowSort="true">2012年以前收入</div>
				        <div field="b" width="60" align="right" headerAlign="center" allowSort="true">2013年收入</div>
				        <div field="c" width="60" align="right" headerAlign="center" allowSort="true">2014年收入</div>
				        <div field="d" width="60" align="right" headerAlign="center" allowSort="true">2015年收入</div>
			        </div>
			    </div>
            </div>
        </fieldset>    
         -->    
    </form>
</div>

<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div>        
<script type="text/javascript">
    nui.parse();
	var contractid = '<%=request.getParameter("contractid") %>';
	SetData();
    //销售人员对应的grid的增加、删除方法
    //销售人员对应的产品的grid的增加、删除方法
	var dept_grid = nui.get("dept_grid");
	var employee_grid = nui.get("employee_grid");
	//合同收入记录信息
	var grid_income = nui.get("grid_income");
	//采购结转明细信息
	var grid_purOutcost = nui.get("grid_purOutcost");
	//收款
	var grid_csGatherFc = nui.get("grid_csGatherFc");
	//发票详情
	var grid_billTicket = nui.get("grid_billTicket");
	//合同毛利
	var grid_csContGross = nui.get("grid_csContGross");
	//cs_cont_stock数据结构改变（多行行转列，展示动态列）
	var grid_csContStock = nui.get("grid_csContStock");
	
	//cs_Money应收预收数据结构改变（多行行转列，展示动态列）
	var grid_csMoney = nui.get("grid_csMoney");
	var grid_csCope = nui.get("grid_csCope");
	
	var contsumAct=0;
	var confirmSumAct=0;
	//var cpfwsr_grid = nui.get("cpfwsr_grid");
	//var ywlx_grid = nui.get("ywlx_grid");
    //销售人员点开对应的产品子grid时的方法
    var detailGrid_Form = document.getElementById("detailGrid_Form");        
	var currentRow=null;
	function onShowRowDetail(e) {
        var grid = e.sender;
        var row = e.record;            
        if(currentRow){//如果有当前行
        	var datas=employee_grid.getData();
        	currentRow.saleProds=datas;
        }
		currentRow=row;		
        var td = grid.getRowDetailCellEl(row);
        td.appendChild(detailGrid_Form);            
        var saleProds = row.saleProds;
        if(saleProds){
            saleProds = nui.decode(saleProds);
            employee_grid.setData(saleProds);
        }else{
			employee_grid.setData({});
			row.saleProds = {};
		}
		$('#detailGrid_Form').show();
	}
	//点击保存时调用的方法
	var form = new nui.Form("form1");
	//页面进入时调用的方法
    function SetData(data) {
		var json = nui.encode({cscontract:{contractid: contractid}});
        nui.ajax({
            url: "com.primeton.mis.newcont.newCont.getContract.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
                form.setData(o);
                form.setChanged(false);
                if( o.cscontract.contsum != null ){
                	contsumAct = o.cscontract.contsum;
                }
                document.getElementById("cscontract.contnum").innerHTML = o.cscontract.contnum;
                //document.getElementById("cscontract.contreg").innerHTML = o.cscontract.contreg;
                document.getElementById("cscontract.signdate").innerHTML = o.cscontract.signdate == null ?"":o.cscontract.signdate;
                document.getElementById("cscontract.misCustinfo.custname").innerHTML = o.cscontract.misCustinfo == null ?"":o.cscontract.misCustinfo.custname;
                document.getElementById("cscontract.username").innerHTML = o.cscontract.username == null ?"":o.cscontract.username;
                document.getElementById("cscontract.projectname").innerHTML = o.cscontract.projectname == null ? "":o.cscontract.projectname;
                document.getElementById("cscontract.cfwssywlx").innerHTML = o.cscontract.cfwssywlx == null ? "":o.cscontract.cfwssywlx;
                document.getElementById("cscontract.industry").innerHTML = o.cscontract.industry == null ? "":nui.getDictText('MIS_INDUSTRY_SUBDIVISION',o.cscontract.industry);
                document.getElementById("cscontract.company").innerHTML = o.cscontract.company == null ? "":nui.getDictText('company',o.cscontract.company);
				document.getElementById("cscontract.contsum").innerHTML = o.cscontract.contsum == null ? "":formatNumber(o.cscontract.contsum.toFixed(2),'#,##.00');
                document.getElementById("cscontract.prodmon").innerHTML = o.cscontract.prodmon == null ? "":formatNumber(o.cscontract.prodmon.toFixed(2),'#,##.00');
                document.getElementById("cscontract.servmon").innerHTML = o.cscontract.servmon == null ? "":formatNumber(o.cscontract.servmon.toFixed(2),'#,##.00');
                document.getElementById("cscontract.prodwbmon").innerHTML = o.cscontract.prodwbmon == null ? "":formatNumber(o.cscontract.prodwbmon.toFixed(2),'#,##.00');
				document.getElementById("cscontract.contsumAct").innerHTML = o.cscontract.contsumAct == null ? "":formatNumber(o.cscontract.contsumAct.toFixed(2),'#,##.00');
                document.getElementById("cscontract.prodmonAct").innerHTML = o.cscontract.prodmonAct == null ? "":formatNumber(o.cscontract.prodmonAct.toFixed(2),'#,##.00');
                document.getElementById("cscontract.servmonAct").innerHTML = o.cscontract.servmonAct == null ? "":formatNumber(o.cscontract.servmonAct.toFixed(2),'#,##.00');
                document.getElementById("cscontract.prodwbmonAct").innerHTML = o.cscontract.prodwbmonAct == null ? "":formatNumber(o.cscontract.prodwbmonAct.toFixed(2),'#,##.00');
				document.getElementById("cscontract.contsumJz").innerHTML = o.cscontract.contsumJz == null ? "":formatNumber(o.cscontract.contsumJz.toFixed(2),'#,##.00');
                document.getElementById("cscontract.prodmonJz").innerHTML = o.cscontract.prodmonJz == null ? "":formatNumber(o.cscontract.prodmonJz.toFixed(2),'#,##.00');
                document.getElementById("cscontract.servmonJz").innerHTML = o.cscontract.servmonJz == null ? "":formatNumber(o.cscontract.servmonJz.toFixed(2),'#,##.00');
                document.getElementById("cscontract.prodwbmonJz").innerHTML = o.cscontract.prodwbmonJz == null ? "":formatNumber(o.cscontract.prodwbmonJz.toFixed(2),'#,##.00');
                document.getElementById("cscontract.salename").innerHTML = o.cscontract.salename;
                document.getElementById("cscontract.org").innerHTML = nui.getDictText('CONT_ORG',o.cscontract.org);
                document.getElementById("cscontract.newtype").innerHTML = o.cscontract.newtype == null ? "": nui.getDictText('AME_NEWTYPE',o.cscontract.newtype);
                document.getElementById("cscontract.servstart").innerHTML = o.cscontract.servstart == null ?"":o.cscontract.servstart;
                document.getElementById("cscontract.servend").innerHTML = o.cscontract.servend == null ?"":o.cscontract.servend;
                document.getElementById("cscontract.servnumtype").innerHTML = o.cscontract.servnumtype == null ? "":o.cscontract.servnumtype;
                document.getElementById("cscontract.servnum").innerHTML = o.cscontract.servnum == null ?"":o.cscontract.servnum;
                //document.getElementById("cscontract.lx").innerHTML = o.cscontract.lx == null ? "":o.cscontract.lx;
                document.getElementById("cscontract.zsservtype").innerHTML = o.cscontract.zsservtype == null ? "":o.cscontract.zsservtype;
                document.getElementById("cscontract.zsservnum").innerHTML = o.cscontract.zsservnum == null ?"":o.cscontract.zsservnum;
                document.getElementById("cscontract.cpysbg").innerHTML = o.cscontract.cpysbg == null ?"":o.cscontract.cpysbg;
                document.getElementById("cscontract.fwysbg").innerHTML = o.cscontract.fwysbg == null ?"":o.cscontract.fwysbg;
                document.getElementById("cscontract.srqrsfkq").innerHTML = o.cscontract.srqrsfkq == null ?"":o.cscontract.srqrsfkq;
                document.getElementById("cscontract.zbjbl").innerHTML = o.cscontract.zbjbl == null ?"":o.cscontract.zbjbl;
                document.getElementById("cscontract.htfktj").innerHTML = o.cscontract.htfktj == null ?"":o.cscontract.htfktj;
               /*  document.getElementById("cscontract.soamon").innerHTML = o.cscontract.soamon == null ?"":formatNumber(o.cscontract.soamon.toFixed(2),'#,##.00');
                document.getElementById("cscontract.yjsmon").innerHTML = o.cscontract.yjsmon == null ?"":formatNumber(o.cscontract.yjsmon.toFixed(2),'#,##.00');
                document.getElementById("cscontract.dsjmon").innerHTML = o.cscontract.dsjmon == null ?"":formatNumber(o.cscontract.dsjmon.toFixed(2),'#,##.00');
                document.getElementById("cscontract.mobilemon").innerHTML = o.cscontract.mobilemon == null ?"":formatNumber(o.cscontract.mobilemon.toFixed(2),'#,##.00');
                document.getElementById("cscontract.qtmon").innerHTML = o.cscontract.qtmon == null ?"":formatNumber(o.cscontract.qtmon.toFixed(2),'#,##.00'); */
                document.getElementById("cscontract.cpazrq").innerHTML = o.cscontract.cpazrq == null ?"":o.cscontract.cpazrq;
                document.getElementById("cscontract.cyrq").innerHTML = o.cscontract.cyrq == null ?"":o.cscontract.cyrq;
                document.getElementById("cscontract.zyrq").innerHTML = o.cscontract.zyrq == null ?"":o.cscontract.zyrq;
                document.getElementById("cscontract.ryjsdrq1").innerHTML = o.cscontract.ryjsdrq1 == null ?"":o.cscontract.ryjsdrq1;
                document.getElementById("cscontract.ryjsdrq2").innerHTML = o.cscontract.ryjsdrq2 == null ?"":o.cscontract.ryjsdrq2;
                document.getElementById("cscontract.ryjsdrq3").innerHTML = o.cscontract.ryjsdrq3 == null ?"":o.cscontract.ryjsdrq3;
                document.getElementById("cscontract.ryjsdrq4").innerHTML = o.cscontract.ryjsdrq4 == null ?"":o.cscontract.ryjsdrq4;
                var tempSrc = "";
                for(var i=0;i<o.cscontract.files.length;i++){
                	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + o.cscontract.files[i].fileId + "'>" + o.cscontract.files[i].fileName + "</a>,&nbsp;&nbsp;&nbsp;&nbsp;";
                }
               	document.getElementById("uploadedFile").innerHTML = tempSrc;
				grid_income.load({"contnum":o.cscontract.contnum});
				grid_purOutcost.load({"contractid":contractid});
				grid_billTicket.load({"criteria":{"_expr":[{"_property": "contnum","_op":"=","_value":o.cscontract.contnum},{"_property": "status","_op":"<>","_value":"5"}]}});
				grid_billTicket.sortBy("billno", "desc");
				grid_csGatherFc.sortBy("gatherno","asc");
				grid_csGatherFc.load({"contnum":o.cscontract.contnum});
				
				var colsGross = getColumns(o.cscontract.contnum,'1');
	        	grid_csContGross.set({columns:colsGross});
	        	grid_csContGross.load({contnum:o.cscontract.contnum},function(){
	        		var cols = getColumns(o.cscontract.contnum,null);
					grid_csContStock.set({columns:cols});
		        	grid_csContStock.load({contnum:o.cscontract.contnum},function(){
		        		grid_csContStock.frozenColumns(0, 0);
		        		var colsMoney = getColumns(o.cscontract.contnum,'2');
		        		grid_csMoney.set({columns:colsMoney});
		        		grid_csMoney.load({contnum:o.cscontract.contnum},function(){
			        		grid_csMoney.frozenColumns(0, 0);
		        			var colsCope = getColumns(o.cscontract.contnum,'3');
			        		grid_csCope.set({columns:colsCope});
			        		grid_csCope.load({contnum:o.cscontract.contnum});
		        		});
		        	});
	        	});
            }
        });
    }
    function GetData() {
        var o = form.getData();
        return o;
    }
    function CloseWindow(action) {
        window.close();            
    }
    function doCountNowPage(e){        	
            //客户端汇总计算
            if (e.field == "billtype") {
                e.cellHtml = "<div align='left'><b>合计</b></div>";
            }
            if (e.field == "taxmon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "notaxmon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "summon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "buymon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "fcreverate") {
	            e.cellHtml = "<div align='right'><b>" + parseFloat(e.value*100).toFixed(1)+"%" + "</b></div>";
	        }
            if (e.field == "fcsum") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
		 	if (e.field == "actsum") {
		 		confirmSumAct=commafyback(e.cellHtml);
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
		 	if (e.field == "confirmday") {
		 		if(contsumAct==0){
		            e.cellHtml = "<div align='right'><b></b></div>";
		 		}else{
		 			e.cellHtml = "<div align='right'><b>确认比例："+parseFloat((confirmSumAct/contsumAct)*100).toFixed(1)+"%"+"</b></div>";
		 		}
	        }
	        if (e.field == "taxmon") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "notaxmon") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "settlemon") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "accruedmon") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	       if (e.field == "money") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "tax") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "u8xse") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "moneySub") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "taxSub") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "u8xseSub") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "price") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "num") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
        }
        
        function commafyback(num){
	    	if(num ==0 ){
	    		return 0;
	    	}
	       var x = num.split(',');
	       return parseFloat(x.join(""));
		}
    function doCountNowPage1(e){        	
            //客户端汇总计算
            if (e.field == "dictName") {
                e.cellHtml = "<div align='left'><b>合计</b></div>";
            }
            if (e.field == "a") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "b") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "c") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "d") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
    //开票信息详情链接
    function onTitleRenderer2(e) {
		return "<a href='javascript:void(0)' onclick='doViewNewBill();' title='点击查看开票信息'>" + e.value + "</a>";
	}
    function doViewNewBill(){
		var selectRow = grid_billTicket.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条发票数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/ame_income/gatherFcBilling/billApplyViewNew.jsp?billid=" + selectRow.billid;
		window.open(executeUrl, "开票信息查看", "fullscreen=1");
	}
    //业务字典
	function onGenderRenderer(e) {
    	return nui.getDictText('CS_BILLTICKET_TYPE',e.value);
    }
    function onGender2Renderer(e) {
        return nui.getDictText('CS_BILLSTATUS',e.value);
    }
    function onUnitRenderer(e){
    	return nui.getDictText('UNIT',e.value);
    }
    function onGender3Renderer(e){
    	return nui.getDictText('MIS_BILLSTATUS',e.value);
    }
    function onCancel(e) {
        CloseWindow("cancel");
    }
	function dictReveType(e) {
        return nui.getDictText('AME_REVETYPE',e.value);
    }
	function dictNewType(e) {
        return nui.getDictText('AME_NEWTYPE',e.value);
    }
	function dictproof(e) {
		return nui.getDictText('MIS_INCOMECONV',e.value);//设置业务字典值
	}
	function dictstatus(e) {
		return nui.getDictText('AME_REVESTATUS',e.value);//设置业务字典值
	}
	function dateRenderer(e){
		if(e.value){
			return e.value.substring(0,4) +"/"+ e.value.substring(4,6);
		}
	}
	
	 function onFileRenderer(e) {
	        var tempSrc = "";
        	//长度为1，不换行
        	if(e.record.files){
	        	if(e.record.files.length == 1){
		        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[0].fileId + "'>" + e.record.files[0].fileName + "</a>";
	        	}else{
			        for(var i=0;i<e.record.files.length;i++){
			        	//长度大于1小于长度length换行
			        	if(i< e.record.files.length-1){
			        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>,<br/>";
			        	}
			        	//最后一个不换行
		        		if(i == e.record.files.length-1){
			        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>";
			        	}
			        }
	        	}
        	}
	       	return tempSrc;
	     }
	    function dictOutcosttype(e) {
	        return nui.getDictText('AME_OUTCOSTTYPE',e.value);
	    }
	    function dictOutcoststatus(e) {
	        return nui.getDictText('AME_OUTCOSTSTATUS',e.value);
	    }
	    function dictCostmemo(e) {
	        return nui.getDictText('AME_COSTTYPE',e.value);
	    }
	    function dictGatherstatus(e){
	    	if(e.value == '1' || e.value == '2'){	
	    		return "已收款";
	    	}else if(e.value == '3' || e.value == '5'){
	    		return "坏账";
	    	}else if(e.value == '4'){
	    		return "未收款";
	    	}else {
        		return nui.getDictText("AME_GATHERSTATUS",e.value);
	    	}
        }
	    function dictgathertype(e){
        	return nui.getDictText("AME_GATHERTYPE",e.value);
        }
        
        //点击查看详情
        function getDetail(e){
        	if(e.value == null || e.value=="" ||e.value=="null"){
        		return "";
        	}else{
		        return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看' >"+e.value+"</a>";
        	}
        }
        function checkDetail(){
	 		var selectRow = grid_purOutcost.getSelected();
	 		var executeUrl = "";
	 		if (selectRow.purtype == 0) {
	 			executeUrl = "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleLook.jsp?settlementid=" + selectRow.settlementid + "&projectno=" + selectRow.projectno + "&custid=" + selectRow.custno + "&custno=" + selectRow.purcustno;
	 		} else {
	 			executeUrl = "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleOtherLook.jsp?settlementid=" + selectRow.settlementid + "&projectno=" + selectRow.projectno + "&custid=" + selectRow.custno;			
	 		}
	 		window.open(executeUrl, "查看结算信息", "fullscreen=1");
	    }
	    
		//点击查看详情
        function getAccDetail(e){
        	var accruedid = e.value;
        	if(accruedid == null || accruedid=="" ||accruedid=="null"){
        		return "";
        	}else{
        		var str =accruedid.split(',');
        		var url="";
        		if(str.length>0){
        			for(var i=0;i<str.length;i++){
		    		    if(i==str.length-1){
		    		    	url=url+"<a href='javascript:void(0)' onclick='checkAccDetail(" +str[i]+ ")'>"+str[i]+"</a>"
		    		    }else{
		    				url=url+"<a href='javascript:void(0)' onclick='checkAccDetail(" + str[i] + ")'>"+str[i]+"</a>"+","
		    			}
	    			}
        		}else{
        		
        		}
        		return url;
	        }
        }
        function checkAccDetail(value){
			var executeUrl = "<%=request.getContextPath() %>/ame_pur/outaccrued/PurOutPreSettleLook.jsp?accruedid=" + value;
			window.open(executeUrl, "查看计提信息", "fullscreen=1");
	    }
	    
	    //采购合同编号提供链接
	    function getPurContractDetail(e) {
	    	if(e.value){
				return "<a href='javascript:void(0)' onclick='checkPurContractDetail();' title='点击查看采购合同'>" + e.value + "</a>";
	    	}
		}
		//采购合同查看
	    function checkPurContractDetail(){
	    	var selectRow = grid_purOutcost.getSelected();
			var executeUrl = "/default/ame_pur/PurContract/DetailPurContract.jsp?id=" + selectRow.purcontid;
			window.open(executeUrl, "采购合同查看", "fullscreen=1");
		}
		//结算单编号
		function getSettlementno(e){
			if(e.value){
				return "<a href='javascript:void(0)' onclick='getSettlementno1();' title='点击查看'>" + e.value + "</a>";
			}
		}
		function getSettlementno1(){
			var selectRow = grid_purOutcost.getSelected();
	 		var executeUrl = "";
	 		if (selectRow.purtype == 0) {
	 			executeUrl = "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleLook.jsp?settlementid=" + selectRow.settlementid + "&projectno=" + selectRow.projectno + "&custid=" + selectRow.supplierid + "&custno=" + selectRow.custno;
	 		} else {
	 			executeUrl = "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleOtherLook.jsp?settlementid=" + selectRow.settlementid + "&projectno=" + selectRow.projectno + "&custid=" + selectRow.supplierid;			
	 		}
			window.open(executeUrl, "结算单查看", "fullscreen=1");
		}
		
		//项目详细信息
        function detailProj(e){
        	if(e.value){
	        	return "<a href='javascript:void(0)' onclick='detailProj1();' title='点击查看项目信息'>" + e.value + "</a>";
        	}
        }
        function detailProj1(){
	 		var selectRow = grid_csGatherFc.getSelected();
	 		var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + selectRow.projectId;
			window.open(executeUrl);
	    }
	    //合同收入记录详情
        function detailGather(e){
        	return "<a href='javascript:void(0)' onclick='detailGather1();' title='点击查看收款明细记录'>" + e.value + "</a>";
        }
        function detailGather1(){
	 		var selectRow = grid_csGatherFc.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/ame_income/csGatherFc/detailCsGatherFc.jsp?id=" + selectRow.gatherid;
		    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
			window.open(executeUrl, "合同收款记录详细信息","fullscreen=1" );
	    }
	    
    	//动态获取列
    	var flag = true;
	    function getColumns(contnum,type) {
	    	var result = [];
			result.push({field:'type',width:130,align:'center',headerAlign:'center',header:'类型'});
	    	var json = {contnum:contnum,type:type};
	    	nui.ajax({
	            url: "com.primeton.mis.newcont.newCont.getCsContStockChangeColom.biz.ext",
				type: 'POST',
				async:false,
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	if(o.allYearQuarterlys.length==0){//没有数值
	            		flag=false;
	            	}
					for(var i = 0 ; i<o.allYearQuarterlys.length; i++){
			    		result.push({field:o.allYearQuarterlys[i].yearQuarterly,width:85,align:'right',headerAlign:'center',header:o.allYearQuarterlys[i].yearQuarterly,renderer:"onDrawCell1"});
					}
	            }
	        });
	        if(flag && type!='2' && type !='3' && type != '1'){
	        	result.push({field:"total",width:85,align:'right',headerAlign:'center',header:"汇总",renderer:"onDrawCell2"});
	        }
	        return result;
		} 
		function onDrawCell1(e){
			if(e.record.type == "是否已结转"){
				if(e.value == "1"){
					return "是";
				}else if(e.value == "0"){
					return "否";
				}else{
					return;
				}
			}else if(e.record.type == "结转年月"){
				return e.value;
			}else if(e.record.type == "已确认毛利率" || e.record.type == "合同总毛利率"){
				if(e.value == 0 || e.value==null){
					return;
				}else{
					return e.value+"%";
				}
			}else if(e.record.type == "生产费用-人工成本"){
				if(e.value == 0 || e.value==null){
					return;
				}else{
					return "<a href='javascript:void(0)' onclick='getSCFYDetail();' title='点击查看'>" + e.value + "</a>";
				}
			}else{
				if(e.value == 0 ||e.value==null){
					return;
				}else{
					return formatNumber(e.value,'#,##.##');
				}
			}
		}
		 
		function onDrawCell2(e){
			if(e.record.type == "是否已结转"){
				if(e.value == "1"){
					return "是";
				}else if(e.value == "0"){
					return "否";
				}else{
					return;
				}
			}else if(e.record.type == "结转年月"){
				return e.value;
			}else if(e.record.type == "已确认毛利" || e.record.type == "合同总毛利"){
				if(e.value == 0 || e.value==null){
					return;
				}else{
					return e.value+"%";
				}
			}else{
				if(e.value == 0){
					return;
				}else{
					return formatNumber(e.value,'#,##.##');
				}
			}
		}
		
	function  getSCFYDetail(e){
		var grid_csContStock = nui.get("grid_csContStock");
		var cell = grid_csContStock.getCurrentCell();
		var contnum=cell[0].contnum;
		var yearmonth=cell[1].field;
		var year =null;
		var month=null;
		if(yearmonth != null && yearmonth !=""){
			var year =yearmonth.substring(0,4);
			var month =yearmonth.substring(5,7);
		}
		if(month.substring(0,1)=="0"){
			month=month.substring(1,2);
		}else if(month=="Q1"){
			month="1,2,3";
		}else if(month=="Q2"){
			month="4,5,6";
		}else if(month=="Q3"){
			month="7,8,9";
		}else if(month=="Q4"){
			month="10,11,12";
		}
		var executeUrl = "<%=request.getContextPath() %>/labor/newRdLabor/LaborByHistoryDetail.jsp?contnum=" + contnum+"&year="+year+"&month="+month;
		window.open(executeUrl);
	}
</script>
</body>
</html>