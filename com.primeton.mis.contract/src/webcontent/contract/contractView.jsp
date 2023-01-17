<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<head>
    <title>合同信息查看</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/common/components/swffileupload/swfupload/swffileupload.js"></script>
    <style type="text/css">
    html, body{font-size:12px;padding:0;margin:0;border:0;height:100%;width:100%;overflow:hidden;}
    .asLabel{border:0;background-color:#F5F5F5;cursor:default;}
    </style>
</head>
<body>
<div class="nui-fit">
    <form id="form1">
    <input name="cscontract.contractid" id="conId" class="nui-hidden" />
    <input class="nui-hidden" id="t_rownum" value="1">
    <fieldset style="border:solid 1px #aaa;padding:3px;">
        <legend>合同基本信息</legend>
        <div style="padding:5px;">
            <table style="table-layout:fixed;" id="table_file">
                <tr>
                    <td style="width:160px;" align="right">合同类型：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.contracttype" name="cscontract.contracttype"></td>
                    <td style="width:120px;" align="right">合同存档编号：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.contnum"></td>
	                <td style="width:120px;" align="right">登记日期：</td>
	                <td style="width:100px;" class = "asLabel" id="cscontract.contreg"></td>
	                <td style="width:120px;" align="right">合同签署日期：</td>
	                <td style="width:100px;" class = "asLabel" id="cscontract.signdate"></td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">签署单位：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.misCustinfo.custname"></td>
                    <td style="width:120px;" align="right">所属集团客户：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.misCustinfo.groupname"></td>
                    <td style="width:120px;" align="right">最终用户：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.username"></td>
                    <td style="width:120px;" align="right">合同号：</td>
                    <td style="width:100px;" class = "asLabel" id="cscontract.contid"></td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">合同名称：</td>
                    <td style="width:620px;" class = "asLabel" colspan='3' id="cscontract.projectname"></td>
                    <!--<td style="width:120px;" align="right">合同状态：</td>
                    <td style="width:620px;"  id="cscontract.status"></td>-->
                    <td style="width:120px;" align="right">客户类型：</td>
                    <td style="width:100px;" class = "asLabel" id="cscontract.signtarget"></td>
                    <td style="width:120px;" align="right">是否400转化：</td>
                    <td style="width:100px;" class = "asLabel" id="cscontract.istrans"></td>
                </tr>
                <tr id="temp2" style="display:">
                    <td style="width:120px;" align="right">协议有效期开始：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.xystart"></td>
                    <td style="width:120px;" align="right">协议有效期结束：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.xyend"></td>
                    <td style="width:120px;" align="right">是否有排他合作：</td>
                    <td style="width:100px;" class = "asLabel" id="cscontract.ispt"></td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">合同执行总金额：</td>
                    <td style="width:250px;" class = "asLabel">    
                        <b><div id="contsum" ></div></b>
                    </td>
                    <td style="width:120px;" align="right">产品执行金额：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.prodmon"></td>
                    <td style="width:120px;" align="right">服务执行金额：</td>
                    <td style="width:100px;" class = "asLabel" id="cscontract.servmon"></td>
                    <td style="width:120px;" align="right">质保金比例：</td>
                    <td style="width:100px;" class = "asLabel" id="cscontract.zbjbl"></td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">原合同总金额：</td>
                    <td style="width:250px;" class = "asLabel">    
                        <b><div id="contsumAct"></div></b>
                    </td>
                    <td style="width:120px;" align="right">原产品金额：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.prodmonAct"></td>
                    <td style="width:120px;" align="right">原服务金额：</td>
                    <td style="width:100px;" class = "asLabel" id="cscontract.servmonAct"></td>
                    <td style="width:120px;" align="right">销售：</td>
                    <td style="width:100px;" class = "asLabel" id="cscontract.salename"></td>
                </tr>
                <tr>
                    <td style="width:120px;" id="htje" align="right">合同净额：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.contpolmon"></td>
                    <td style="width:120px;" id="third11" align="right">采购2：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.othmon"></td>
                    <td style="width:120px;" id="third21" align="right">采购1：</td>
                    <td style="width:100px;" class = "asLabel" id="cscontract.servsubmon"> </td>
                    <td style="width:120px;" align="right">合同状态：</td>
                    <td style="width:120px;" class = "asLabel"  id="cscontract.status"></td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">待收款金额：</td>
                    <td style="width:250px;" class = "asLabel">
						<font color="red"><b><div id="notgathercontsum"></div></b><font>
                    </td>
                    <td style="width:120px;" id="third31" align="right">待支付采购2：</td>
                    <td style="width:250px;" class = "asLabel" id="notpayedothmon"></td>
                    <td style="width:120px;" id="third41" align="right">待支付采购1：</td>
                    <td style="width:100px;" class = "asLabel" id="notpayedservsubmon"></td>
                    <td style="width:120px;" align="right">所属公司</td>
                    <td style="width:100px;" class = "asLabel" id="cscontract.company"></td>
                </tr>
                <tr>
                   	<td style="width:110px;" align="right">销售模式：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.salemode" dictTypeId="MIS_SALEMODE" shownullitem="true"></td>
                    <td style="width:120px;" align="right">录入人员：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.insertuserid"></td>
                    <td style="width:120px;" align="right">录入日期：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.insertdate"></td>
                    <td></td>
                    <td></td>
                </tr>                 
                <tr>
                	<td style="width:120px;" align="right">禁止分包外包：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.isforbid"></td>
                    <td style="width:120px;" align="right" id="a21">是否高风险：</td>
                    <td style="width:250px;" class = "asLabel" id="cscontract.ishighrisk"></td>
                    <td style="width:120px;" align="right">最近修改人：</td>
                    <td style="width:100px;" class = "asLabel" id="cscontract.modifyuserid"></td>
                    <td style="width:120px;" align="right">最新修改日期：</td>
                    <td style="width:100px;" class = "asLabel" id="cscontract.modifydate"></td>
                </tr>
                <tr>
                    <td style="width:120px;" align="right">行业：</td>
                    <td style="width:100px;" class = "asLabel" id="cscontract.industry" ></td>
                	<!-- <td style="width:120px;" align="right">已上传的文件：</td>
                	<td style="width:1000px;" class = "asLabel" id="uploadedFile" colspan="5"></td>  -->
                	<td style="width:120px;" align="right" >结转类型：</td>
		            <td style="width:100px;" class = "asLabel" id="cscontract.carrytype" dictTypeId="CONTRACT_CARRY_TYPE" > </td>   
		                    
		            <td style="width:140px;" align="right">是否批量预估收入：</td>
		            <td style="width:100px;"class = "asLabel" id="cscontract.isfinreve"  dictTypeId="MIS_YN"></td>   
		             <td style="width:140px;" align="right">是否允许对外宣传：</td>
		            <td style="width:100px;"class = "asLabel" id="cscontract.publicity"  dictTypeId="MIS_YN"></td>   
		            
                </tr>
                <tr id="temp10" >
                	<td style="width:120px;" align="right">排他合作的条件：</td>
                    <td style="width:100px;"  class = "asLabel" id="cscontract.ptcondition" colspan="7"></td>
                </tr>
                <tr>
                	<td style="width:120px;" id="htbzsm" align="right">合同备注说明：</td>
                	<td style="width:1000px;" class = "asLabel" id="cscontract.paycondition1" colspan="7"></td>
                </tr>
                <tr>
                	<td align="right">应收账款逾期/坏账备注：</td>
                    <td style="width:960px;" colspan="7">    
                        <input name="cscontract.bdmemo" id="bdmemo" class="nui-textarea" maxLength="500" style="width: 100%;height:50px;"/>
                    </td> 
            	</tr>
                <tr id="saleshap">
                    <td style="width:120px;" align="right">线索描述：</td>
                    <td colspan="3" style="width:650px;" class = "asLabel" id="cscontract.csSaleshap.telcontent"></td>
                	<td style="width:120px;" align="right">销售线索日期：</td>
                    <td style="width:100px;" class = "asLabel" id="cscontract.csSaleshap.insertdate"></td>
                    <td style="width:120px;" align="right">来源：</td>
                    <td style="width:100px;"  class = "asLabel" id="cscontract.csSaleshap.source"  dictTypeId="MIS_SALESKEY_SOURCE" shownullitem="true"></td>
                </tr>
            </table>
        </div>
    </fieldset>
     <fieldset  id="field6" style="border:solid 1px #aaa;padding:3px;width: 100%;">
    	<legend>合同附件</legend>
    	<jsp:include page="/ame_common/detailFile3.jsp"/>
    </fieldset>
    <fieldset style="border:solid 1px #aaa;padding:3px;">
        <legend>合同关联项目数据</legend>
        <div id="rdproject_grid" class="nui-datagrid" dataField="rdProject" style="width:100%;height:auto;" allowResize="true" pageSize="100"
	        url="com.primeton.mis.contract.contract.queryProjectByContractid.biz.ext" showPager="false" allowCellWrap="true">			        
	        <div property="columns">
	            <div field="projectName" width="220" align="center" headerAlign="center" allowSort="true">项目名称</div>
	            <div field="projectno" width="120" align="center" renderer="doProjView" headerAlign="center" allowSort="true">项目编号</div>
	            <div field="proconttype" width="120" align="center" renderer="onProconttype" headerAlign="center" align="center" allowSort="true">项目合同关系类型</div>
	            <div field="contorderno" width="120" align="center" headerAlign="center" align="center" allowSort="true" renderer="onContorderno">合同订单编号</div>
		        <div field="projectType" width="120" align="center" renderer="onProjectTypeRenderer" headerAlign="center" align="center" allowSort="true">项目类型</div>
		        <div field="orgname" width="75" align="center" headerAlign="center" allowSort="true">受益部门</div>
		        <div field="managername" width="80" align="center" headerAlign="center" allowSort="true">项目负责人</div>
		        <div field="projectStatus" width="100" align="center" renderer="onprojectStatusRenderer" headerAlign="center" align="center" allowSort="true">项目内部状态</div>
		        <div field="outstatus" width="100" align="center" renderer="onProjectoutstatusRenderer" headerAlign="center" align="center" allowSort="true">项目外部状态</div>
		        <div field="pcostsum1" width="110" align="right" headerAlign="center" allowSort="true"  dataType="currency">当前总成本金额</div>
		        <div field="lastcostdate" width="80" align="center" headerAlign="center" allowSort="true" >最近成本日期</div>
		        <div field="createdate" align="center" dateFormat="yyyy-MM-dd" width="150" headerAlign="center" allowSort="true">项目创建日期</div>
		        <!-- <div field="csContract.contnum" width="70" align="center" headerAlign="center" allowSort="true">内部商务合同编号</div> -->
	        </div>
	    </div>
    </fieldset>
    </br>
    </br>
     <div class="mini-tabs" activeIndex="0" style="width:100%" id="cont-tab" >
    	<div title="合同订单信息">
	        <!-- 合同订单信息 -->
            <div id="csContOrder_grid" class="nui-datagrid" style="width:97%;height:auto;" dataField="csContOrders"
	            showPager="false" url="com.primeton.mis.contract.contract.getCsContOrder.biz.ext"  showSummaryRow="true"  ondrawsummarycell="drawSum">			            
	            <div property="columns">
	                <div field="contorderno" width="100" headerAlign="center" align="center">订单编号</div>
	                <div field="orderreg" width="100" headerAlign="center" renderer="onDealDate" dateFormate="yyyy-MM-dd" align="left">订单登记日期</div>
	                <div field="orderdate" width="100" headerAlign="center" renderer="onDealDate" dateFormate="yyyy-MM-dd" align="left">订单签订日期</div>
	                <div field="ordermon" dataType="currency" width="150" headerAlign="center" align="right" summaryType="sum">合同订单金额</div>
	                <div field="orderprodmon" dataType="currency" width="120" headerAlign="center" align="right" summaryType="sum">订单产品金额</div>
	                <div field="servjsmon" dataType="currency" width="120" headerAlign="center" align="right" summaryType="sum">技术服务金额</div>
	                <div field="prodwbmon" dataType="currency" width="120" headerAlign="center" align="right" summaryType="sum">产品维保金额</div>
	                <div field="orderservmon" dataType="currency" width="120" headerAlign="center" align="right" summaryType="sum">订单服务金额</div>
	                <!-- 分包金额 -->
	                <div field="servsubmon" dataType="currency" width="120" headerAlign="center" align="right" summaryType="sum">订单采购1</div>
	                <!-- 分成金额 -->
	                <div name="othmon" field="othmon" dataType="currency" width="120" headerAlign="center" align="right" summaryType="sum">订单采购2</div>
	                <div field="memo" name="memo" width="auto" headerAlign="center" align="left">备注说明</div>
	            </div>
	        </div>
	        <!-- 合同业务分类 -->
	       	<fieldset style="border:solid 1px #aaa;padding:3px;">
	        	<legend>合同业务分类</legend>
		        <div id="csContType_grid" class="nui-datagrid" style="width:50%;height:auto;" dataField="contTypes" 
	            	showPager="false" url="com.primeton.mis.contract.contract.getContType.biz.ext" 
	            	 showSummaryRow="true" ondrawsummarycell="drawSum">			            
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
     	<div title="合同销售人员">
            <div style="padding:5px;" id="salesList">

            </div>
    	</div>
    	<div title="合同开票与收款">
    		 <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>合同开票</legend>
	            <div style="padding:5px;">
	            	<div id="bill_grid" class="nui-datagrid" frozenStartColumn="0" frozenEndColumn="6" style="width:97%;height:auto;" allowResize="true" pageSize="100"
				        url="com.primeton.mis.contract.newBill.queryBillNew.biz.ext" showPager="false">			        
				        <div property="columns">
				            <div field="misCustinfo.custname" width="160" renderer="onBillTitleRenderer" headerAlign="center" allowSort="true">开票单位</div>
					        <div field="billdate"" width="140" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">开票日期</div>
					        <!-- <div field="csContract.projectname" width="140" headerAlign="center" allowSort="true">合同名称（项目）</div> -->
					        <div field="billtype" width="60" renderer="onBilltypeRenderer" align="center" headerAlign="center" allowSort="true">票据类型</div>
					        <div field="billprodmon" width="130" dataType="currency" currencyUnit="￥" align="right" headerAlign="center" allowSort="true">开票产品金额</div>
					        <div field="billservmon" width="130" dataType="currency" currencyUnit="￥" align="right" headerAlign="center" allowSort="true">开票服务金额</div>
					        <div field="billsummon" width="130" dataType="currency" currencyUnit="￥" align="right" headerAlign="center" allowSort="true">开票总金额</div>
					        <div field="tax" width="130" dataType="currency" currencyUnit="￥" align="right" headerAlign="center" allowSort="true">税金</div>
					        <div field="u8xse" width="130" dataType="currency" currencyUnit="￥" align="right" headerAlign="center" allowSort="true">销售额</div>
					        <!-- <div field="csContract.contnum" width="65" headerAlign="center" allowSort="true">合同存档编号</div> -->
					        <div field="appname" width="80" headerAlign="center" allowSort="true">申请人</div>
					        <div field="status" width="80" renderer="onBilltype1Renderer" align="center" headerAlign="center" allowSort="true">开票状态</div>
				        </div>
				    </div>
	            </div>
	        </fieldset>
		    <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>合同收款</legend>
	            <div style="padding:5px;">
	            	<div id="csGatherFc_grid" class="nui-datagrid" frozenStartColumn="0" frozenEndColumn="3" style="width:97%;height:auto;" dataField="csGatherFcs"
			            showPager="false" allowCellSelect="true" multiSelect="true" showSummaryRow="true" ondrawsummarycell="drawSum" ondrawcell="changeColor"
			            url="com.primeton.mis.contract.contract.getCsGatherFc.biz.ext" allowCellWrap="true">			            
			            <div property="columns">
			                <div field="gatherno" width="80" headerAlign="center" align="center" renderer="detailGather">收款确认次数</div>
			                <!-- AME_GATHERTYPE-收款类型：0-产品、1-服务、2-产品+服务 -->
			                <div field="gathertype" width="80" renderer="onGatherType" headerAlign="center" align="left">收款类型</div>
			                <div field="gathertimedesc" width="180" headerAlign="center" align="left">收款确认时点描述</div>
			                <div field="confirmday" width="80" headerAlign="center" align="right">财报收款日期</div>
			                <div field="maconfirmday" width="80" headerAlign="center" align="right">管报收款日期</div>
			                <div field="actproductsum" width="90" dataType="currency" headerAlign="center" align="right">实际收款产品额</div>
			                <div field="actservicesum" width="90" dataType="currency" headerAlign="center" align="right">实际收款服务额</div>
			                <div field="actsum" width="100" dataType="currency" headerAlign="center" align="right" summaryType="sum">实收款金额</div>
			                <div field="status" width="80" renderer="onGatherStatus" headerAlign="center" align="left">当前收款状态</div>
			                <div field="billstatus" width="80" renderer="onGatherBillStatus" headerAlign="center" align="left">开票状态</div>
			                <!-- 最初预计确认年月 -->
			                <div field="yearmonth" width="110" headerAlign="center" dateFormat="yyyy-MM" align="left">最初预计收款年月</div>
			                <!-- 最新预计确认年月 -->
			                <div field="newyearmonth" width="110" headerAlign="center" dateFormat="yyyy-MM" align="left">最新预计收款年月</div>
			                <div field="productsum" width="150" dataType="currency" headerAlign="center" align="right">预计产品额</div>
			                <div field="servicesum" width="150" dataType="currency" headerAlign="center" align="right">预计服务额</div>
			                <div field="fcsum" width="100" dataType="currency" headerAlign="center" align="right" summaryType="sum">预计收款金额</div>
			                <div field="fcreverate" width="80" headerAlign="center" align="right" numberFormat="p1">预计收款比例</div>
			                <div field="memo" width="150" headerAlign="center" align="left">说明</div>
			            </div>
			        </div>
	            </div>
	        </fieldset>
	       	<!--合同保函  -->
	        <fieldset style="border:solid 1px #aaa;padding:3px;width: 98%;">
	            <legend>合同保函记录</legend>
	            <div id="csContBack_grid" class="nui-datagrid" style="width:100%;height:auto;" 
		            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
		            url="com.primeton.mis.contract.contract.getCsContBackDep.biz.ext" dataField="csContBackDeps"
		            showSummaryRow="true" ondrawsummarycell="drawSum" allowCellWrap="true">			            
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
		        <div id="grid_0" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
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
		            url="com.primeton.mis.contract.contract.getCsContBackDep.biz.ext" dataField="csContBackDeps"
		            showSummaryRow="true" ondrawsummarycell="drawSum"  allowCellWrap="true">			            
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
    	</div>
    	<div title="合同收入">
    		<fieldset style="border:solid 1px #aaa;padding:3px;display: none" id="revefin">
	            <legend>合同财务收入</legend>
		    		 <div style="padding:5px;">
				            <div id="csReveForecast_grid_fin" class="nui-datagrid" style="width:1300px;height:auto;" allowResize="true" dataField="csReveForecastFins" showSummaryRow="true" ondrawsummarycell="doCsReveSum"
			    url="com.primeton.eos.ame_income.csReveForecast.queryCsReveForeCastFinNp.biz.ext"   multiSelect="true" frozenStartColumn="0" frozenEndColumn="3"
			    showPager="false"  >
					<div property="columns">
						<div field="reveid" width="0" >预估主键</div>	
						<div field="reveno" width="60" align="center"  headerAlign="center" renderer="detailReve"  >确认次数</div>
						<div field="revetype" width="100" align="center" headerAlign="center" renderer="revetype">收入类型</div>
						<div field="newtype" width="100" align="center" headerAlign="center" renderer="newtype">新合同收入类型</div>
						<div field="confirmday" width="80" align="center" headerAlign="center"  >确认日期</div>	
						<div field="actsum" width="80" align="right" headerAlign="center" dataType="currency" summaryType="sum" >本次确认</div>
						<div field="actsum2" width="110" align="right" headerAlign="center" dataType="currency" summaryType="sum" >本次确认(不含税)</div>
						<div field="actproductsum" width="80" align="right" headerAlign="center" dataType="currency" summaryType="sum" >产品金额</div>
						<div field="actservicesum" width="80" align="right" headerAlign="center" dataType="currency" summaryType="sum" >服务金额</div>
						<div field="actmasum" width="80" align="right" headerAlign="center" dataType="currency" summaryType="sum" >MA金额</div>
						<div field="actproductsum2" width="120" align="right" headerAlign="center" dataType="currency" summaryType="sum" >产品金额(不含税)</div>
						<div field="actservicesum2" width="120" align="right" headerAlign="center" dataType="currency" summaryType="sum" >服务金额(不含税)</div>
						<div field="actmasum2" width="120" align="right" headerAlign="center" dataType="currency" summaryType="sum" >MA金额(不含税)</div>	
						<div field="confirmdayStart" width="80" align="center" headerAlign="center" >应收开始日期</div>	
						<div field="projectno" width="100" renderer="detailProj" headerAlign="center" >项目编号</div>
						<div field="salename" width="70" align="left"  headerAlign="center">所属销售</div>	
						<div field="yjbm" width="100" align="center" headerAlign="center"  >一级部门</div>	
						<div field="ejbm" width="100" align="center" headerAlign="center" >二级部门</div>	
						<div field="status" width="120" align="center" headerAlign="center" renderer="dictstatus">状态</div>
						<div field="setstart" width="120" align="center" headerAlign="center" >本次结算开始年月</div>	
						<div field="setend" width="120" align="center" headerAlign="center" >本次结算结束年月</div>	
						<div field="labormonth" width="120" align="center" headerAlign="center" summaryType="sum" >本次确认工作量</div>	
						<div field="labormonthact" width="120" align="center" renderer="getReveLabor" headerAlign="center" summaryType="sum"  >本次实际工作量</div>	
					</div>
				</div>
		        </div>
         	</fieldset>
    		<fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>合同收入</legend>
	            <div style="padding:5px;">
		            <div id="csReveForecast_grid" class="nui-datagrid" frozenStartColumn="0" frozenEndColumn="4" style="width:1300px;height:auto;" dataField="csReveForecasts" allowCellWrap="true" ondrawcell="changeColor"
			            showPager="false" allowCellSelect="true" multiSelect="true" url="com.primeton.mis.contract.contract.getCsReveForecast.biz.ext" showSummaryRow="true" ondrawsummarycell="drawSum" >			            
			            <div property="columns">
			                <div field="reveno" width="70" headerAlign="center" align="center" renderer="detailReve">收入次数</div>
			                <div field="revetype" width="100" renderer="onGenderInComeType" headerAlign="center" align="left">收入类型</div>
			                <div field="newtype" width="100" renderer="onGenderNewType" headerAlign="center" align="left">新合同收入类型</div>
			                <div field="reveproof" width="150" renderer="onGenderInComeConv" headerAlign="center" align="left">收入确认证据</div>
			                <div field="revetimedesc" width="130" headerAlign="center" align="left">收入时点描述</div>
			                <div field="newyearmonth" width="100" headerAlign="center" dateFormat="yyyyMM" align="left">预计确认年月</div>
			                <div field="productsum" width="110" dataType="currency" headerAlign="center" align="right" summaryType="sum">预计产品额</div>
			                <div field="servicesum" width="110" dataType="currency" headerAlign="center" align="right" summaryType="sum">预计服务额</div>
			                <div field="masum" width=110 dataType="currency" headerAlign="center" align="right" summaryType="sum">预计MA额</div>
			                <div field="fcsum" width="110" dataType="currency" headerAlign="center" align="right" summaryType="sum">预计确认金额</div>
			                <div field="fcreverate" width="80" headerAlign="center" align="left" summaryType="sum">预计确认比例</div>
			                <div field="status" width="80" renderer="onGenderStatus" headerAlign="center" align="left">状态</div>
			                <div field="actproductsum" width="110" dataType="currency" headerAlign="center" align="right" summaryType="sum">实际产品额</div>
			                <div field="actservicesum" width="110" dataType="currency" headerAlign="center" align="right" summaryType="sum">实际服务额</div>
			                <div field="actmasum" width="110" dataType="currency" headerAlign="center" align="right" summaryType="sum">实际MA额</div>
			                <div field="actsum" width="110" dataType="currency" headerAlign="center" align="right" summaryType="sum">实际确认金额</div>
			                <div field="maconfirmday" width="80" dateFormat="yyyy-MM-dd" headerAlign="center" align="center">实际确认日期</div>
			                <div field="contorderno" width="80" headerAlign="center" align="center">订单编号</div>
			                <div field="saleseva" width="60" headerAlign="center" renderer="onGenderSaleseva" align="center">销售评估</div>
			                <div field="files" width="200" headerAlign="center" renderer="onFileRenderer" align="left" allowCellWrap="true">附件</div>
			                <div field="setstart" width="120" headerAlign="center" dateFormat="yyyyMM" align="left">本次结算开始年月</div>
			                <div field="setend" width="120" headerAlign="center" dateFormat="yyyyMM" align="left">本次结算结束年月</div>
			            </div>
			        </div>
	            </div>
	        </fieldset>
    		<fieldset style="border:solid 1px #aaa;padding:3px;" id="productReve">
	            <legend>产品收入分成</legend>
	            <div style="padding:5px;">
			        <div id="product_reve_grid" class="nui-datagrid" style="width:1300px;height:auto;" allowCellSelect="true" multiSelect="true" dataField="productReves" 
			            url="com.primeton.mis.contract.productReve.queryProductReve.biz.ext" showPager="false" allowCellEdit="true" showSummaryRow="true" 
			            ondrawsummarycell="drawSum">			            
			            <div property="columns">
			                <div field="contnum" width="80" headerAlign="center" >合同编号</div>
			                <div field="reveno" width="100" headerAlign="center" >收入次数</div>
			                <div field="status" width="100" headerAlign="center" renderer="getStatus">收入状态</div>
			                <div field="newyearmonth" width="100" headerAlign="center" >最新预计确认年月</div>
			                <div field="maconfirmday" width="100" headerAlign="center" >实际确认日期</div>
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
	            </div>
	        </fieldset>
   		</div>
    	<div title="关联采购" name="thirdpay">
        	<div id="thirdpay_grid" class="nui-datagrid" frozenStartColumn="0" frozenEndColumn="4" style="width:97%;height:auto;" allowResize="true" pageSize="100"
		        url="com.primeton.mis.contract.thirdpay.queryThirdpay.biz.ext" showPager="false" showSummaryRow="true" ondrawsummarycell="drawSum">			        
		        <div property="columns">
		            <!-- <div field="csContract.contnum" width="80" headerAlign="center" align="center" allowSort="true">商务合同号</div> -->
			        <div field="custname" width="260" renderer="onTitleRenderer" headerAlign="center" allowSort="true">供应商</div>
			        <div field="salename" width="70" align="center" headerAlign="center" allowSort="true">销售姓名</div>
			        <div field="payedmon" width="110" dataType="currency" currencyUnit="￥" align="right" summaryType="sum" headerAlign="center" allowSort="true">本次支付采购1</div>
			        <div name="payedomon" field="payedomon" width="110" dataType="currency" currencyUnit="￥" summaryType="sum" align="right" headerAlign="center" allowSort="true">本次支付采购2</div>
			        <div field="username" width="80" headerAlign="center" align="center" allowSort="true">商务确认人</div>
			        <div field="optime" width="80" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">商务确认日期</div>
			        <div field="purcontno" width="100" headerAlign="center" allowSort="true" renderer="getPurcontnoDetail">采购合同编号</div>
			        <div field="expno" width="80" width="auto" headerAlign="center" align="center" allowSort="true">报销单号</div>
			        <div field="cwusername" width="80" headerAlign="center" allowSort="true">财务审核人</div>
			        <div field="paydate" width="80" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">打款日期</div>
		        </div>
		    </div>
    	</div>
        	<div title="相关采购">
    		 <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>采购合同列表</legend>
	            <div style="padding:5px;">
	            	<div id="purcontract_grid" class="nui-datagrid"  style="width:97%;height:auto;" allowResize="true" dataField="purContracts1" pageSize="100"
				        url="com.primeton.eos.ame_pur.PurContract.queryPurContract1.biz.ext" showPager="false"  showSummaryRow="true" ondrawsummarycell="drawSum1">			        
				        <div property="columns">
							<div field="purcontnum" width="125" align="center" headerAlign="center" renderer="getPurcontnoDetail1" allowSort="true">采购合同编号</div>		
							<div field="suppliersname" width="130" align="center" headerAlign="center">供应商简称</div>							
					        <!-- <div field="csContract.projectname" width="140" headerAlign="center" allowSort="true">合同名称（项目）</div> -->
							<div field="purtype" width="110" align="center" headerAlign="center" allowSort="true" renderer="dictpurtype">采购合同类型</div>
					        <div field="contmoney" width="130" dataType="currency" currencyUnit="￥" align="right" headerAlign="center" summaryType="sum" allowSort="true">采购金额</div>
					        <div field="accruedmoney" width="130" dataType="currency" currencyUnit="￥" align="right" headerAlign="center" summaryType="sum" allowSort="true">已计提金额</div>
							<div field="yzfje" width="80" align="right" headerAlign="center" currencyUnit="￥"  summaryType="sum" dataType="currency">已支付金额</div>		
					        <div field="signdate" width="130"  dateFormat="yyyy-MM-dd"  align="center" headerAlign="center" allowSort="true">签订日期</div>
					       
				        </div>
				    </div>
	            </div>
	        </fieldset>
		    <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>采购计提列表</legend>
	            <div style="padding:5px;">
	            	<div id="purPresettle_grid" class="nui-datagrid" style="width:97%;height:auto;" dataField="purpresettle" 
			            showPager="false" allowCellSelect="true" multiSelect="true" showSummaryRow="true" ondrawsummarycell="drawSum2" ondrawcell="changeColor"
			            url="com.primeton.eos.ame_pur.settle.querPurpresettleByConstractid.biz.ext" allowCellWrap="true">			            
			            <div property="columns">
							<div field="purcontnum" width="125" align="center" headerAlign="center" renderer="getPurcontnoDetail2" allowSort="true">采购合同编号</div>		
			                <div field="suppliersname" width="80" headerAlign="center" align="center">供应商</div>
			                <!-- AME_GATHERTYPE-收款类型：0-产品、1-服务、2-产品+服务 -->
			                <div field="accruedid" width="80" headerAlign="center" align="center">计提记录编号</div>
			                <div field="accruedmoney" width="80"  dataType="currency" currencyUnit="￥" headerAlign="center" align="center" summaryType="sum">计提金额</div>
			                <div field="accruedstatus" width="80" headerAlign="center" align="center" renderer="dictGetAccruedStatus">计提状态</div>
			                <div field="accrueddate" width="90" dateFormat="yyyy-MM-dd" headerAlign="center" align="center">计提日期</div>
			                <div field="acctdate" width="90" dateFormat="yyyy-MM-dd" headerAlign="center" align="center">成本记账日期</div>
			            </div>
			        </div>
	            </div>
	        </fieldset>
	        <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>采购结算列表</legend>
	            <div style="padding:5px;">
	            	<div id="purSettle_grid" class="nui-datagrid"  style="width:97%;height:auto;" dataField="pursettle"
			            showPager="false" allowCellSelect="true" multiSelect="true" showSummaryRow="true" ondrawsummarycell="drawSum3" ondrawcell="changeColor"
			            url="com.primeton.eos.ame_pur.settle.queryPursettleBycontractid.biz.ext" allowCellWrap="true">			            
			            <div property="columns">
			            	<div field="purcontnum" width="125" align="center" headerAlign="center" renderer="getPurcontnoDetail3" allowSort="true">采购合同编号</div>		
			                <div field="suppliersname" width="80" headerAlign="center" align="center" >供应商</div>
			                <!-- AME_GATHERTYPE-收款类型：0-产品、1-服务、2-产品+服务 -->
			                <div field="settlementid" width="80" headerAlign="center" align="center">结算记录编号</div>
			                <div field="settlementno" width="180" headerAlign="center" align="center" renderer="getPurcontnoDetail4">结算编号</div>
			                <div field="setamount" width="80"   dataType="currency" currencyUnit="￥" headerAlign="center" align="center" summaryType="sum">结算金额</div>
			                <div field="setstatus" width="80" headerAlign="center" align="center" renderer="dictGetStatus1">结算状态</div>
			                <div field="startdate" width="90" dateFormat="yyyy-MM-dd" headerAlign="center" align="center">发起日期</div>
			                <div field="paydate" width="90" dateFormat="yyyy-MM-dd" headerAlign="center" align="center">打款日期</div>
			            </div>
			        </div>
	            </div>
	        </fieldset>
    	</div>
   		<div title="产品与服务" >
   			<fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>产品授权清单</legend>
	            <div id="csContLicense_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="csContLicenses" 
	            	showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
	            	editNextOnEnterKey="true"  url="com.primeton.mis.contract.contract.getContLicense.biz.ext" 
	            	oncellendedit="doContLicsum"  showSummaryRow="true" ondrawsummarycell="drawSum">			            
		            <div property="columns">
		                <div field="contnum" width="100" headerAlign="center" align="left">合同编号</div>
		                <div field="prodname" displayField="prodtypename" width="300" headerAlign="center" >产品名称</div>
		                <div field="grantunit" width="100" renderer="getCsContLicType" headerAlign="center" align="left">授权单位</div>
		                <div field="total" width="80" headerAlign="center" align="right" summaryType="sum">约定数量</div>
		                <div field="grantnum" width="80" headerAlign="center" align="right" summaryType="sum">已发放数量</div>
		                <div field="lastnum" width="80" headerAlign="center" align="right" summaryType="sum">剩余数量</div>
		            </div>
		        </div>
	        </fieldset>
	        <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>合同维保信息</legend>
	            <div style="padding:5px;">
	        	<table>
		            <tr>
	                    <td style="width:120px;" align="right">发货日期：</td>
	                    <td style="width:200px;" class = "asLabel" id="cscontract.goodsenddate"></td>
	                    <td style="width:120px;" align="right">发货备注：</td>
	                    <td style="width:840px;" class = "asLabel" colspan="5" id="cscontract.othmonmemo"></td>
	                </tr>  
		            <tr>
	                    <td style="width:120px;" align="right">项目计划初验日期：</td>
	                    <td style="width:200px;" class = "asLabel" id="cscontract.jhcyrq"></td>
	                    <td style="width:120px;" align="right">项目计划终验日期：</td>
	                    <td style="width:200px;" class = "asLabel" id="cscontract.jhzyrq"></td>
	                    <td style="width:120px;" align="right">服务开通标示：</td>
	                    <td style="width:200px;" class = "asLabel" id="cscontract.servopenflag"></td>
		                <td style="width:120px;" align="right">服务期限：</td>
		                <td style="width:200px;" class = "asLabel" id="cscontract.servterm"></td>
	                </tr>  
		            <tr>
	                    <td style="width:120px;" align="right">服务模块：</td>
	                    <td style="width:200px;" class = "asLabel">
	                        <input class="mini-dictcombobox" name="cscontract.servmodule" id="servmodule" dictTypeId="CS_SERVMODULE" style="width: 200px;"/>
		                <td style="width:120px;" align="right">服务开通情况：</td>
		                <td style="width:200px;" class = "asLabel" >
		                	<input class="mini-dictcombobox" name="cscontract.servstage"  id="servstage" dictTypeId="CS_SERVSTAGE" style="width: 200px;"/>
		                </td>
	                    <td style="width:120px;" align="right">MA服务开始日期：</td>
	                    <td style="width:200px;" class = "asLabel" >
	                    	<input name="cscontract.servstartdate" id="servstartdate" class="nui-datepicker" allowInput="false" style="width: 200px;"/>
	                    </td>
		                <td style="width:120px;" align="right">MA服务结束日期：</td>
		                <td style="width:200px;" class = "asLabel" >
		                	<input name="cscontract.servenddate" id="servenddate" class="nui-datepicker" allowInput="false" style="width: 200px;"/>
		                </td>
	                </tr>
		            <tr>
	                    <td style="width:120px;" align="right">售后服务相关内容：</td>
	                    <td style="width:550px;" colspan="3" >
	                    	<input name="cscontract.remakr" class="nui-textarea" style="width:530px;" />
	                    </td>
		                <td style="width:120px;" align="right">服务开通跟踪情况：</td>
		                <td style="width:550px;" class = "asLabel" colspan="3" id="cscontract.servopentail"></td>
	                </tr>   
	        	</table>
	            </div>
	        </fieldset>
	         <fieldset style="border:solid 1px #aaa;padding:3px;">
	            <legend>合同服务与验收信息</legend>
	            <div style="padding:5px;">
		            <table style="table-layout:fixed;" id="table_file">
		                <tr>
		                    <td style="width:120px;" align="right">服务数量类型：</td>
		                    <td style="width:100px;" class = "asLabel" id="cscontract.servnumtype"></td>
		                    <td style="width:120px;" align="right">服务数量：</td>
		                    <td style="width:100px;" class = "asLabel" id="cscontract.servnum"></td>
		                    <td style="width:120px;" align="right">服务单价：</td>
		                    <td style="width:100px;" class = "asLabel" id="cscontract.servprice"></td>
		                    <td style="width:120px;" align="right">服务开始日期：</td>
		                    <td style="width:100px;" class = "asLabel" id="cscontract.servstart"></td>
		                    <td style="width:120px;" align="right">服务结束日期：</td>
		                    <td style="width:320px;" class = "asLabel" id="cscontract.servend"></td>
		                </tr>                
		                <tr>
		                    <td style="width:120px;" align="right">赠送服务数量类型：</td>
		                    <td style="width:100px;" class = "asLabel" id="cscontract.zsservtype"></td>
		                    <td style="width:120px;" align="right">赠送服务数量：</td>
		                    <td style="width:100px;" class = "asLabel" id="cscontract.zsservnum"></td>
		                    <td style="width:120px;" align="right">产品验收日期：</td>
		                    <td style="width:100px;" class = "asLabel" id="cscontract.cpazrq"></td>
		                    <td style="width:120px;" align="right">初验日期：</td>
		                    <td style="width:100px;" class = "asLabel" id="cscontract.cyrq"></td>
		                    <td style="width:120px;" align="right">终验日期：</td>
		                    <td style="width:100px;" class = "asLabel" id="cscontract.zyrq"></td>
		                </tr>
		            </table>
		        </div>
	        </fieldset>
	        <fieldset id="htxtxx" style="border:solid 1px #aaa;padding:3px;">
	            <legend>合同系统信息</legend>
	            <div style="padding:5px;">
	            	<div >
				        <div class="nui-toolbar" id= "toolbars" style="border-bottom:0;padding:0px;">
				            <table style="width:100%;">
				                <tr>
				                    <td style="width:100%;">
				                        <a class="nui-button" iconCls="icon-add" onclick="addRecord()" id="contractview_addRecord" plain="true" >关联系统</a>
				                        <a class="nui-button" iconCls="icon-add" onclick="addServproject()"id="contractview_addServproject" plain="true" >关联服务</a>
				                        <a class="nui-button" iconCls="icon-add" onclick="addRow('project_grid')" plain="true" >新增系统</a>
				                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('project_grid')" plain="true">删除</a>
				                        <a class="nui-button" iconCls="icon-save" onclick="saveSystem()" id="contractview_saveSystem" plain="true">保存系统</a>
				                    </td>
				                </tr>
				            </table>           
				        </div>
				    </div>
		        	<div id="project_grid" class="nui-datagrid" dataField="contProjs" style="width:100%;height:auto;" allowResize="true" pageSize="100"
				        url="com.primeton.mis.contract.contract.querySystemByContractid.biz.ext" allowCellEdit="true" multiSelect="true" allowCellSelect="true" showPager="false">			        
				        <div property="columns">
				        	<div type="checkcolumn"></div>
				        	<div field="contractid" width="60" align="center" headerAlign="center" visible="false">合同id</div>
				        	<div field="salesid" width="60" align="center" headerAlign="center" visible="false">销售id</div>
				        	<div field="partnerid" width="60" align="center" headerAlign="center" visible="false">合作伙伴</div>
				        	<div field="enduserid" width="60" align="center" headerAlign="center" visible="false">最终用户</div>
				        	<div field="importlevel" width="60" align="center" headerAlign="center" visible="false">重要级别</div>
				            <div field="projectname" width="180" headerAlign="center" allowSort="true">应用系统名称
				            	<input property="editor" class="nui-textbox"/>
				            </div>  
				            <div field="servnum" width="60" align="center" headerAlign="center" allowSort="true">对应服务</div>
					        <div field="industry" renderer="onIndusRenderer" width="60" renderer="onTitleRenderer" headerAlign="center" align="center" allowSort="true">所属行业
					        	<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_INDUSTRY"/>
					        </div>
					        <div field="curstage" renderer="onCurstageRenderer" width="60" align="center" headerAlign="center" allowSort="true">销售服务阶段
					        	<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_PHASE"/>
					        </div>
					        <div field="salesname" width="60" align="center" headerAlign="center" allowSort="true">销售姓名</div>
					        <div field="releaseflag" renderer="onReleaRenderer" width="60" align="center" headerAlign="center" allowSort="true">系统上线情况
					        	<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_DEVELOPPHASE"/>
					        </div>
					        <div field="insertdate" dateFormat="yyyy-MM-dd" width="80" headerAlign="center" allowSort="true">系统录入时间</div>
					        <div renderer="onDoRenderer" width="40" align="center" headerAlign="center">操作</div>
				        </div>
				    </div>
	            </div>
	        </fieldset>
			
	        <fieldset id="htfwxx" style="border:solid 1px #aaa;padding:3px;">
	            <legend>合同服务信息</legend>
	            <div style="padding:5px;">
	            	<div >
				        <div class="nui-toolbar" id= "toolbars" style="border-bottom:0;padding:0px;">
				            <table style="width:100%;">
				                <tr>
				                    <td style="width:100%;">
				                        <a class="nui-button" iconCls="icon-add" onclick="addRow('servinfo_grid')" plain="true" >新增服务</a>
				                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('servinfo_grid')" plain="true">删除</a>
				                        <a class="nui-button" iconCls="icon-save" onclick="saveServinfo()" id="contractview_saveServinfo" plain="true">保存服务</a>
				                    </td>
				                </tr>
				            </table>           
				        </div>
				    </div>
		        	<div id="servinfo_grid" class="nui-datagrid" dataField="csServinfos" style="width:100%;height:auto;" allowResize="true" pageSize="100"
				        url="com.primeton.mis.contract.contract.queryServByContractid.biz.ext" allowCellEdit="true" multiSelect="true" allowCellSelect="true" showPager="false">			        
				        <div property="columns">
				        	<div type="checkcolumn"></div>
				        	<div field="contractid" width="60" align="center" headerAlign="center" visible="false">合同id</div>
				        	<div field="contractnum" width="60" align="center" headerAlign="center" visible="false">合同内部编号</div>
				        	<div field="contracttype" width="60" align="center" headerAlign="center" visible="false">合同类型</div>
				        	<div field="custid" width="60" align="center" headerAlign="center" visible="false">签署单位</div>
				            <div field="servnum" width="80" headerAlign="center" allowSort="true">服务编号
				            	<input property="editor" class="nui-textbox"/>
				            </div>
					        <div field="openbycont" renderer="onGenderSaleseva" width="80" renderer="onTitleRenderer" headerAlign="center" align="center" allowSort="true">是否按合同开通
					        	<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_YN"/>
					        </div>
					        <div field="remark" width="200" align="center" headerAlign="center" allowSort="true">补充说明
					        	<input property="editor" class="nui-textarea"/>
					        </div>
					        <div field="startdate" width="80" align="center" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true">服务开始日期
					        	<input property="editor" class="nui-datepicker" inputStyle="text-align: left"/>
					        </div>
					        <div field="overdate" width="80" align="center" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true">服务截止日期
					        	<input property="editor" class="nui-datepicker" inputStyle="text-align: left"/>
					        </div>
					        <div field="closedate" width="80" align="center" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true">标准截止日期
					        	<input property="editor" class="nui-datepicker" inputStyle="text-align: left"/>
					        </div>
					        <div field="servmodule" renderer="onServmodleRenderer" width="60" align="center" headerAlign="center" allowSort="true">购买服务模块
					        	<input property="editor" class="nui-dictcombobox" dictTypeId="CS_SERVMODULE"/>
					        </div>
					        <div field="opentype" renderer="onOpentypeRenderer" width="60" align="center" headerAlign="center" allowSort="true">服务开通类型
					        	<input property="editor" class="nui-dictcombobox" dictTypeId="CS_OPENTYPE"/>
					        </div>
					        <div field="insertdate" dateFormat="yyyy-MM-dd" width="80" headerAlign="center" allowSort="true">系统录入时间</div>
				        </div>
				    </div>
	            </div>
	        </fieldset> 
    	</div>
    	<div title="合同日志" name="log">
    		<jsp:include page="/ame_common/operatLog.jsp?groupid=CS_CONTRACT">
    			<jsp:param name="relationid" value="<%=request.getParameter("contractid")%>"/>
    		</jsp:include>
    	</div>
	</div>
    </form>
</div>

<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" id="contractview_save" style="width:60px;">保存</a>
    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div>        
</body>
<script type="text/javascript">
    nui.parse();
	var contractid = '<%=request.getParameter("contractid") %>';
	
	var csReveForecast_grid = nui.get("csReveForecast_grid");//合同收入预测
	var csReveForecast_grid_fin = nui.get("csReveForecast_grid_fin");//合同财务收入
	var csContOrder_grid = nui.get("csContOrder_grid");//合同订单处理
	var csGatherFc_grid = nui.get("csGatherFc_grid");//合同收款
	var product_reve_grid = nui.get("product_reve_grid");//产品分成
	var csContBack_grid = nui.get("csContBack_grid");//合同保函
	var csContDep_grid = nui.get("csContDep_grid");//合同保证金
	var csContType_grid = nui.get("csContType_grid");//合同业务分类
	var csContLicense_grid = nui.get("csContLicense_grid");//合同授权清单
	var form = new nui.Form("#form1");
	getSalesByContractid();
	var groupid = 'CS_CONTRACT';
	var contnum;
	var  cscontract;
	SetData();
    //销售人员对应的grid的增加、删除方法
    //销售人员对应的产品的grid的增加、删除方法
	var dept_grid = nui.get("dept_grid");
	var thirdpay_grid = nui.get("thirdpay_grid");
	//合同收款情况
	var bill_grid = nui.get("bill_grid");
	//合同收入确认明细
	var project_grid = nui.get("project_grid");
	var rdproject_grid = nui.get("rdproject_grid");
	//相关采购
	var purcontract_grid = nui.get("purcontract_grid");
	var purPresettle_grid = nui.get("purPresettle_grid");
	
	var purSettle_grid = nui.get("purSettle_grid"); 
	//服务信息
	var servinfo_grid = nui.get("servinfo_grid"); 
	
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		//String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
		Map attr = user.getAttributes();
		DataObject[] roles = (DataObject[])attr.get("roles");
		
		Boolean isCommerce = false;	//是否商务
		Boolean isFinance = false; //是否财务
		Boolean isLeader = false; //是否是领导（含：COO、事业部总经理、事业部副总经理、产品支持中心总监、软件产品部总经理、合同查询员）
		Boolean isSale = false;//是否是事业部助理
		
		for(int i=0;i < roles.length;i++){
			if(roles[i].getString("roleid").equals("commerce")){
				isCommerce = true;
			}
			if(roles[i].getString("roleid").equals("finance")){
				isFinance = true;
			}
		   	if( roles[i].getString("roleid").equals("sales")){
				isSale = true;
			}
			if( roles[i].getString("roleid").equals("COO") ||
				roles[i].getString("roleid").equals("prodGeneral") ||
				roles[i].getString("roleid").equals("CSManager") ||
				roles[i].getString("roleid").equals("contractQuery") ||
				roles[i].getString("roleid").equals("csoper") ||
				roles[i].getString("roleid").equals("legal") ||
				roles[i].getString("roleid").equals("PMO") ||
				roles[i].getString("roleid").equals("YYPT") ||
				roles[i].getString("roleid").equals("YYPTZL") ||
				roles[i].getString("roleid").equals("prodUnit")){
				isLeader = true;
			}
		}
	%> 
	var isCommerce = "<%=isCommerce %>"=="false"?false:true;//是否商务
	var isFinance = "<%=isFinance %>"=="false"?false:true;//是否财务
	var isLeader = "<%=isLeader %>"=="false"?false:true;//是否是领导（含：COO、事业部总经理、事业部副总经理、产品支持中心总监、软件产品部总经理、合同查询员）
	var isSale = "<%=isSale %>"=="false"?false:true;//是否销售
	
	
	init();
	function init(){
		if(isCommerce == false){//非商务，不能查看高风险
			document.getElementById("a21").style.display="none";
			document.getElementById("cscontract.ishighrisk").style.display="none";
			
		}
		if(isCommerce==false&&isFinance==false){
			var tabs = nui.get("cont-tab");
			tabs.updateTab("thirdpay",{visible:false});
			tabs.updateTab("log",{visible:false});
			document.getElementById("revefin").style.display="none";
		}else{
			document.getElementById("revefin").style.display="";
		}
		if( isSale == true){
			document.getElementById("productReve").style.display="none";	
		}
		getOpeatorButtonAuth("contractview_save,contractview_saveSystem,contractview_saveServinfo,contractview_addRecord,contractview_addServproject");//操作按钮权限初始化
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
    
    //换行处理
    function onContorderno(e){
    	if(e.value){
    		var contorderno = e.value;
    		contorderno = contorderno.replace(/,/g,"<br/>");
    		return contorderno;
    	}
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
    	if(groupId == "CS_CONT_BACK"){
    		var grid = nui.get("grid_0");
    	}else{
    		var grid = nui.get("grid_1");
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
    
    function onTitleRenderer(e) {
		return "<a href='javascript:void(0)' onclick='doView();' title='点击查看服务费支付信息'>" + e.value + "</a>";
	}
    function onTitleRenderer1(e) {
		return "<a href='javascript:void(0)' onclick='doView1();' title='点击查看收款信息'>" + e.value + "</a>";
	}
    function onBillTitleRenderer(e) {
		return "<a href='javascript:void(0)' onclick='doViewBill();' title='点击查看开票信息'>" + e.value + "</a>";
	}
    function onBillTitle1Renderer(e) {
    	if(e.value != null && e.value != ""){
			return "<a href='javascript:void(0)' onclick='doViewBill1();' title='点击查看开票信息'>" + e.value + "</a>";
		}
	}
    function onBillTitle2Renderer(e) {
    	if(e.value != null && e.value != ""){
			return "<a href='javascript:void(0)' onclick='doViewBill2();' title='点击查看开票信息'>" + e.value + "</a>";
		}
	}
	function onIncomeTitleRenderer(e){
		return "<a href='javascript:void(0)' onclick='doViewIncome();' title='点击查看收入信息'>" + e.value + "</a>";
	}
    function onDoRenderer(e) {
    	var projectid = e.record.projectid;
    	if(projectid !=null && projectid !=""){
			return "<a href='javascript:void(0)' onclick='doDelete();' title='点击删除合同系统信息'>删除</a>";
		}else{
			return "";
		}
	}
	function doView(){
		var selectRow = thirdpay_grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条服务费支付数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/contract/thirdpay/thirdpayView.jsp?contsaleservid=" + selectRow.contsaleservid;
		window.open(executeUrl, "服务费支付信息查看", "fullscreen=1");
	}
	function doView1(){
		var selectRow = gathering_grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条收款数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/contract/gathering/gatheringView.jsp?gatherid=" + selectRow.csGather.gatherid;
		window.open(executeUrl, "收款确认信息查看", "fullscreen=1");
	}
	function doViewBill(){
		var selectRow = bill_grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条开票数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/ame_income/gatherFcBilling/billApplyViewNew.jsp?billid=" + selectRow.billid;
		window.open(executeUrl, "开票信息查看", "fullscreen=1");
	}
	function doViewBill1(){
		var selectRow = income_grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条开票数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/contract/billnew/billApplyViewNew.jsp?billid=" + selectRow.billid;
		window.open(executeUrl, "开票信息查看", "fullscreen=1");
	}
	function doViewBill2(){
		var selectRow = rec_grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条开票数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/contract/billnew/billApplyViewNew.jsp?billid=" + selectRow.billid;
		window.open(executeUrl, "开票信息查看", "fullscreen=1");
	}
	function doViewIncome(){
		var selectRow = income_grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条收入确认数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/contract/incomenew/incomeViewNew.jsp?incomeconfid=" + selectRow.incomeconfid;
		window.open(executeUrl, "收入确认信息查看", "fullscreen=1");
	}
	function doDelete(){
		var selectRow = project_grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条合同系统数据!");
			return;
		}
		if(confirm("您确认删除这条合同系统数据吗？")){
			var contractid = selectRow.contractid;
			var projectid = selectRow.projectid;
			var json = nui.encode({contractid: contractid, projectid: projectid});
			nui.ajax({
	            url: "com.primeton.mis.contract.contract.deleteContractSystem.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
					project_grid.load({ contractid: contractid });
	            }
	        });
		}
	}
	//页面进入时调用的方法
    function SetData(data) {
        //按钮权限的控制
    	//getOpeatorButtonAuth("contractview_save","contractview_saveSystem","contractview_saveServinfo");//操作按钮权限初始化
        nui.ajax({
            url: "com.primeton.mis.contract.contract.getContract.biz.ext",
			type: 'POST',
			data: {contractid: contractid},	
			contentType: 'text/json',
            success: function (o) {
                form.setData(o);
                cscontract = o.cscontract;
                contnum = o.cscontract.contnum;
                nui.get("grid_001").load({"groupid":groupid,"relationid":o.cscontract.contractid});
                //加载附件设置参数
                nui.get("grid_2").load({"groupid":"CS_CONTRACT","relationid": o.cscontract.contractid});
                nui.get("bdmemo").setValue(o.cscontract.bdmemo);
        		nui.get("grid_0").load({"groupid":"CS_CONT_BACK","relationid": o.cscontract.contractid});
        		nui.get("grid_1").load({"groupid":"CS_CONT_DEP","relationid": o.cscontract.contractid});
                document.getElementById("cscontract.contracttype").innerHTML = nui.getDictText('MIS_CONTRACTTYPE',o.cscontract.contracttype);
                document.getElementById("cscontract.contnum").innerHTML = o.cscontract.contnum;
                document.getElementById("cscontract.contreg").innerHTML = o.cscontract.contreg;
                document.getElementById("cscontract.signdate").innerHTML = o.cscontract.signdate == null ?"":o.cscontract.signdate;
                document.getElementById("cscontract.misCustinfo.custname").innerHTML = o.cscontract.misCustinfo == null ?"":o.cscontract.misCustinfo.custname;
                document.getElementById("cscontract.misCustinfo.groupname").innerHTML = (o.cscontract.misCustinfo == null || o.cscontract.misCustinfo.groupname==null) ?"":o.cscontract.misCustinfo.groupname;
                document.getElementById("cscontract.username").innerHTML = o.cscontract.username == null ?"":o.cscontract.username;
                document.getElementById("cscontract.contid").innerHTML = o.cscontract.contid == null ?"":o.cscontract.contid;;
                document.getElementById("cscontract.projectname").innerHTML = o.cscontract.projectname == null ? "":o.cscontract.projectname;
                document.getElementById("cscontract.status").innerHTML = nui.getDictText('CS_CONTRACTTYPE',o.cscontract.status);
                document.getElementById("cscontract.servnumtype").innerHTML = nui.getDictText('SERV_NUM_TYPE',o.cscontract.servnumtype);
                document.getElementById("cscontract.servnum").innerHTML = o.cscontract.servnum == null ?"":o.cscontract.servnum;
                document.getElementById("cscontract.servprice").innerHTML = o.cscontract.servprice == null ?"":o.cscontract.servprice;
                document.getElementById("cscontract.zsservtype").innerHTML = nui.getDictText('SERV_NUM_TYPE',o.cscontract.zsservtype);
                document.getElementById("cscontract.zsservnum").innerHTML = o.cscontract.zsservnum == null ?"":o.cscontract.zsservnum;
                document.getElementById("cscontract.servstart").innerHTML = o.cscontract.servstart == null ?"":o.cscontract.servstart;
                document.getElementById("cscontract.servend").innerHTML = o.cscontract.servend == null ?"":o.cscontract.servend;
                document.getElementById("cscontract.cpazrq").innerHTML = o.cscontract.cpazrq == null ?"":o.cscontract.cpazrq;
                document.getElementById("cscontract.cyrq").innerHTML = o.cscontract.cyrq == null ?"":o.cscontract.cyrq;
                document.getElementById("cscontract.zyrq").innerHTML = o.cscontract.zyrq == null ?"":o.cscontract.zyrq;
                document.getElementById("cscontract.jhcyrq").innerHTML = o.cscontract.jhcyrq == null ?"":o.cscontract.jhcyrq;
                document.getElementById("cscontract.jhzyrq").innerHTML = o.cscontract.jhzyrq == null ?"":o.cscontract.jhzyrq;
                document.getElementById("cscontract.industry").innerHTML = nui.getDictText('MIS_INDUSTRY_SUBDIVISION',o.cscontract.industry);
                document.getElementById("cscontract.xystart").innerHTML = o.cscontract.xystart;
                document.getElementById("cscontract.xyend").innerHTML = o.cscontract.xyend;
                document.getElementById("cscontract.ispt").innerHTML = nui.getDictText('MIS_YN',o.cscontract.ispt);
                document.getElementById("cscontract.ptcondition").innerHTML = o.cscontract.ptcondition == null ?"":o.cscontract.ptcondition;
                document.getElementById("cscontract.prodmon").innerHTML = o.cscontract.prodmon == null ? "":nui.formatNumber(o.cscontract.prodmon,'n');
                document.getElementById("cscontract.servmon").innerHTML = o.cscontract.servmon == null ? "":nui.formatNumber(o.cscontract.servmon,'n');
                document.getElementById("cscontract.zbjbl").innerHTML = o.cscontract.zbjbl == null ?"":o.cscontract.zbjbl;
                document.getElementById("cscontract.prodmonAct").innerHTML = o.cscontract.prodmonAct == null ? "":nui.formatNumber(o.cscontract.prodmonAct,'n');
                document.getElementById("cscontract.servmonAct").innerHTML = o.cscontract.servmonAct == null ? "":nui.formatNumber(o.cscontract.servmonAct,'n');
                document.getElementById("cscontract.contpolmon").innerHTML = o.cscontract.contpolmon == null ? "":nui.formatNumber(o.cscontract.contpolmon,'n');
                document.getElementById("cscontract.othmon").innerHTML = o.cscontract.othmon == null ?"":nui.formatNumber(o.cscontract.othmon,'n');
                document.getElementById("cscontract.servsubmon").innerHTML = o.cscontract.servsubmon == null ?"":nui.formatNumber(o.cscontract.servsubmon,'n');
                document.getElementById("cscontract.salename").innerHTML = o.cscontract.salename;
                document.getElementById("cscontract.signtarget").innerHTML = nui.getDictText('CS_SIGNTARGET',o.cscontract.signtarget);
                document.getElementById("cscontract.istrans").innerHTML = nui.getDictText('MIS_YN',o.cscontract.istrans);
				document.getElementById("cscontract.insertuserid").innerHTML = o.cscontract.insertusername == null ?"":o.cscontract.insertusername;
				document.getElementById("cscontract.insertdate").innerHTML = o.cscontract.insertdate == null ?"":o.cscontract.insertdate;
				document.getElementById("cscontract.modifyuserid").innerHTML = o.cscontract.modifyusername == null ?"":o.cscontract.modifyusername;
				document.getElementById("cscontract.modifydate").innerHTML = o.cscontract.modifydate == null ?"":o.cscontract.modifydate;              
                document.getElementById("cscontract.goodsenddate").innerHTML = o.cscontract.goodsenddate == null ?"":o.cscontract.goodsenddate;
                document.getElementById("cscontract.isforbid").innerHTML = o.cscontract.isforbid == null ?"":nui.getDictText('MIS_YN',o.cscontract.isforbid);
                document.getElementById("cscontract.ishighrisk").innerHTML = o.cscontract.ishighrisk == null ?"":nui.getDictText('MIS_YN',o.cscontract.ishighrisk);
                document.getElementById("cscontract.company").innerHTML = o.cscontract.company == null ?"":nui.getDictText('company',o.cscontract.company);
                document.getElementById("cscontract.othmonmemo").innerHTML = o.cscontract.othmonmemo == null ?"":o.cscontract.othmonmemo;
                document.getElementById("cscontract.servopenflag").innerHTML = nui.getDictText('CS_SERVOPENFLAG',o.cscontract.servopenflag);
                document.getElementById("cscontract.servterm").innerHTML = nui.getDictText('CS_SERVTERM',o.cscontract.servterm);
                document.getElementById("cscontract.carrytype").innerHTML = nui.getDictText('CONTRACT_CARRY_TYPE',o.cscontract.carrytype);
                document.getElementById("cscontract.isfinreve").innerHTML = nui.getDictText('MIS_YN',o.cscontract.isfinreve);
                
                document.getElementById("cscontract.publicity").innerHTML = nui.getDictText('MIS_YN',o.cscontract.publicity);
                
                document.getElementById("cscontract.servopentail").innerHTML = o.cscontract.servopentail == null ?"":o.cscontract.servopentail;
				
				/*ipo新加字段*/
				document.getElementById("cscontract.salemode").innerHTML = nui.getDictText('MIS_SALEMODE',o.cscontract.salemode);
				document.getElementById("cscontract.paycondition1").innerHTML = o.cscontract.paycondition == null ?"":o.cscontract.paycondition;
				if(o.cscontract == null || o.cscontract.saleshapid==null){
					document.getElementById("saleshap").style.display = "none";
				}else{
				/*销售线索新加字段*/
					document.getElementById("cscontract.csSaleshap.insertdate").innerHTML = o.cscontract.csSaleshap.insertdate == null ?"":o.cscontract.csSaleshap.insertdate;
					document.getElementById("cscontract.csSaleshap.telcontent").innerHTML = o.cscontract.csSaleshap.telcontent == null ?"":o.cscontract.csSaleshap.telcontent;
					document.getElementById("cscontract.csSaleshap.source").innerHTML = nui.getDictText('MIS_SALESKEY_SOURCE',o.cscontract.csSaleshap.source);
				}
                /* var tempSrc = "";
                for(var i=0;i<o.cscontract.files.length;i++){
                	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + o.cscontract.files[i].fileId + "'>" + o.cscontract.files[i].fileName + "</a>,&nbsp;&nbsp;&nbsp;&nbsp;";
                }
               	document.getElementById("uploadedFile").innerHTML = tempSrc; */
               	var contracttype = o.cscontract.contracttype;
               	if(contracttype == "30"){//框架协议
					document.getElementById("temp2").style.display = "";
					document.getElementById("temp10").style.display = "";
				}else{//产品合同、服务合同、混合合同
					document.getElementById("temp2").style.display = "none";
				}
				document.getElementById("contsum").innerHTML = o.cscontract.contsum == null ?"":nui.formatNumber(o.cscontract.contsum,'n');
				document.getElementById("contsumAct").innerHTML = o.cscontract.contsumAct == null ?"":nui.formatNumber(o.cscontract.contsumAct,'n');
				project_grid.sortBy("projectname", "asc");
				project_grid.load({ contractid: contractid },function (){
					rdproject_grid.sortBy("projectName", "asc");
					rdproject_grid.load({ contnum: o.cscontract.contnum },function(){
					
					//采购相关
					purcontract_grid.load({"criteria":{"_expr":[{"_property": "contractid", "_value": contractid}]}},function (){
					purPresettle_grid.load({"criteria":{"_expr":[{"_property": "contractid", "_value": contractid}]}},function (){
					purSettle_grid.load({"criteria":{"_expr":[{"_property": "contractid", "_value": contractid}]}},function (){
					
					
					
						thirdpay_grid.sortBy("contsaleservid", "desc");
						thirdpay_grid.load({"criteria":{"_expr":[{"_property": "contractid", "_value": contractid}]}},function (){
							var a=0;
							if(isSale == 'true'){
								a=1;
							}
							bill_grid.sortBy("billdate", "desc");
							bill_grid.load({"criteria":{"_expr":[{"_property": "csContract.contractid","_op":"=","_value":contractid}]},"isSale":a},function (){
								//合同收入预测
								csReveForecast_grid.sortBy("reveno","asc");
								csReveForecast_grid.load({"csReveForecast": {"contnum": o.cscontract.contnum}},function (){
									csReveForecast_grid_fin.load({"contnum": o.cscontract.contnum},function (){
										//合同订单处理
										csContOrder_grid.sortBy("contorderno","asc");
										csContOrder_grid.load({"contractid": contractid},function(){
											csContType_grid.sortBy("contorderno","asc");
											csContType_grid.load({contnum: o.cscontract.contnum},function(){
												csGatherFc_grid.sortBy("gatherno","asc");
												csGatherFc_grid.load({"csGatherFc": {"contnum": o.cscontract.contnum}},function (){
													//产品分成
													product_reve_grid.sortBy("reveid","asc");
													product_reve_grid.load({"contnum": o.cscontract.contnum},function(){
														//合同保函
														csContBack_grid.load({contractid: o.cscontract.contractid,type:"1"},function(){
															//合同保证金
															csContDep_grid.load({contractid: o.cscontract.contractid,type:"2"},function(){
																//合同产品授权
																csContLicense_grid.sortBy("contlicid","asc");
																csContLicense_grid.load({contnum: o.cscontract.contnum},function(){
																
																	servinfo_grid.sortBy("insertdate","desc");
																	servinfo_grid.load({ contractid: contractid });
																});
															});
														});
													});
												});
											});
										});
									});
								});
							});
						});
						});
						});
						});
					});
				});
				if(isFinance == false && isCommerce == false){//非商务、非财务不能看订单的备注
					csContOrder_grid.hideColumn("memo");
				}
				if(isFinance == false && isCommerce == false ){//非商务、非财务、非领导，不能看服务费
					document.getElementById("cscontract.contpolmon").innerHTML = "";
					document.getElementById("cscontract.othmon").innerHTML = "";
					document.getElementById("notpayedothmon").innerHTML = "";
					document.getElementById("cscontract.paycondition1").innerHTML = "";
					$("#htje,#cscontract.contpolmon,#third11,#cscontract.othmon,#htxtxx").html("");
					<%--$("#htje,#cscontract.contpolmon,#third11,#cscontract.othmon,#htxtxx").css({
						"display":"none"
					});--%>
					$("#third31,#notpayedothmon,#htbzsm,#cscontract.paycondition1").html("");
					csContOrder_grid.hideColumn("othmon");
					thirdpay_grid.hideColumn("payedomon");
				}
            }
        });
    }
    nui.get('thirdpay_grid').on('load',function(e){
		var datas = thirdpay_grid.getData();
		var totalpayedmon = 0;
		var totalpayedomon = 0;
		for(var i=0;i<datas.length;i++){
			if(document.getElementById("cscontract.contreg").innerHTML >= '2018-01-01'){
				if(datas[i].paydate){
					var payedmon = datas[i].payedmon;
					var payedomon = datas[i].payedomon;
					if(payedmon){
						if(!isNaN(payedmon)){
							totalpayedmon += parseFloat(payedmon);
						}
					}
					if(payedomon){
						if(!isNaN(payedomon)){
							totalpayedomon += parseFloat(payedomon);
						}
					}
				}
			}else{
				var payedmon = datas[i].payedmon;
				var payedomon = datas[i].payedomon;
				if(payedmon){
					if(!isNaN(payedmon)){
						totalpayedmon += parseFloat(payedmon);
					}
				}
				if(payedomon){
					if(!isNaN(payedomon)){
						totalpayedomon += parseFloat(payedomon);
					}
				}
			}
		}
		var reg=new RegExp(",","g");
		var servsubmon = document.getElementById("cscontract.servsubmon").innerHTML.replace(reg,"");;
		var othmon = document.getElementById("cscontract.othmon").innerHTML.replace(reg,"");;
		document.getElementById("notpayedservsubmon").innerHTML = nui.formatNumber(parseFloat(servsubmon-totalpayedmon),'n');
		if(isFinance == false && isCommerce == false){
			document.getElementById("notpayedothmon").innerHTML = "";
		}else{
			document.getElementById("notpayedothmon").innerHTML = nui.formatNumber(parseFloat(othmon-totalpayedomon),'n');
		}
    })    
    function GetData() {
        var o = form.getData();
        return o;
    }
    function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    function onCancel(e) {
        CloseWindow("cancel");
    }
    function addRecord() {
    	nui.open({
			url: "<%= request.getContextPath() %>/contract/contract/system_lookup.jsp?contnum="+contnum,
			title: "选择系统",
			width: 1000,
			height: 470,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
                        var contractid = nui.get("conId").getValue();
						var json = {contractid: contractid, projectid: data.id};
						nui.ajax({
				            url: "com.primeton.mis.contract.contract.addContractSystem.biz.ext",
							type: 'POST',
							data: json,	
							contentType: 'text/json',
				            success: function (o) {
								project_grid.load({ contractid: contractid });
				            }
				        });
                    }
                }
            }
        });
	}
	
	function addServproject() {
		var rows = project_grid.getSelecteds();
		if (rows.length > 0) {
	    	nui.open({
				url: "<%= request.getContextPath() %>/contract/contract/servinfo_lookup.jsp?",
				title: "选择服务",
				width: 1000,
				height: 470,
	            onload: function () {
	                var iframe = this.getIFrameEl();
	                var data = {cscontract:cscontract};
	                iframe.contentWindow.SetData(data);
	            },
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
							var json = {projects: rows, servid: data.servid};
							nui.ajax({
					            url: "com.primeton.mis.contract.contract.addServProjects.biz.ext",
								type: 'POST',
								data: json,	
								contentType: 'text/json',
					            success: function (o) {
					            	if(o.result !="-1"){
						            	nui.alert("关联成功！","",function(){
						            		project_grid.load({ contractid: contractid });
						            	});
					            	}else{
					            		nui.alert("关联失败！","",function(){});
					            	}
					            }
					        });
	                    }
	                }
	            }
	        });
        }else{
        	nui.alert("请选中一条记录！");
        }
	}
	
	//增加行
    function addRow(gridid) {
    	var grid = nui.get(gridid);
    	var sales = nui.get("dept_grid0").getData();
    	var salesid = sales[0].saleid;
    	var salesname = sales[0].salename;
    	var newRow ={};        
        if(gridid == "project_grid"){
		    newRow = { name: "New Row","contractid":cscontract.contractid,"salesid":salesid,"partnerid":cscontract.misCustinfo.custid,"enduserid":cscontract.userid,"salesname":salesname,"importlevel":"1","curstage":"0","releaseflag":"1" };
        }else if(gridid == "servinfo_grid"){
        	newRow = { name: "New Row","contractid":cscontract.contractid,"contractnum":cscontract.contid,"contracttype":cscontract.contracttype,"custid":cscontract.misCustinfo.custid,"openbycont":"1","servmodule":"10","opentype":"0" };
        }
	    grid.addRow(newRow, 0);
    }
	
	
	function removeRow(gridid) {
        var grid = nui.get(gridid);
        var rows = grid.getSelecteds();
        if (rows.length > 0) {
        	for(var i = 0;i < rows.length;i ++){
    			if(rows[i].name != "New Row"){
	    			nui.alert("已关联的合同的系统不能删除");
    			}else{
    				grid.removeRows(rows, false);
    			}
    		}
        }else{
        	nui.alert("请选中一条记录！");
        }
    }
	
	function saveSystem(){
		var projects = project_grid.getChanges();
		var json =nui.encode({projects:projects});
		nui.get("contractview_saveSystem").disable();
		nui.ajax({
            url: "com.primeton.mis.contract.contract.saveCsProjects.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	if(text.result !="-1"){
	            	nui.alert("保存成功！","",function(){
            			nui.get("contractview_saveSystem").enable();
	            		project_grid.load({ contractid: contractid });
	            	});
            	}else{
            		nui.alert("保存失败！","",function(){
            			nui.get("contractview_saveSystem").enable();
            		});
            	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
            }
        });
	}
	
	
	function saveServinfo(){
		var servinfos = servinfo_grid.getChanges();
		var json =nui.encode({servinfos:servinfos});
		nui.get("contractview_saveServinfo").disable();
		nui.ajax({
            url: "com.primeton.mis.contract.contract.saveServinfos.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	if(text.result !="-1"){
	            	nui.alert("保存成功！","",function(){
            			nui.get("contractview_saveServinfo").enable();
	            		servinfo_grid.load({ contractid: contractid });
	            	});
            	}else{
            		nui.alert("保存失败！","",function(){
            			nui.get("contractview_saveServinfo").enable();
            		});
            	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
            }
        });
	}
	
    function doProjView(e) {
		return "<a href='javascript:void(0)' onclick='doViewProject("+e.record.projectId+");' title='点击查看项目信息'>" + e.value + "</a>";
	}
	function doViewProject(projectId){
      	var executeUrl = "/default/project/rdproject/projectDetail.jsp?projid=" + projectId;
		window.open(executeUrl);
    }
    //合同收入记录详情
    function detailReve(e){
    	return "<a href='javascript:void(0)' onclick='detailReve1();' title='点击查看收入记录'>" + e.value + "</a>";
    }
    function detailReve1(){
 		var selectRow = csReveForecast_grid.getSelected();
		var executeUrl = "/default/ame_income/csReveForecast/detailCsReveForecast.jsp?id=" + selectRow.reveid;
	    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
		window.open(executeUrl, "合同收入记录详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
    }
    
    //合同收款记录详情
    function detailGather(e){
    	return "<a href='javascript:void(0)' onclick='detailGather1();' title='点击查看收款明细记录'>" + e.value + "</a>";
    }
    function detailGather1(){
 		var selectRow = csGatherFc_grid.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/ame_income/csGatherFc/detailCsGatherFc.jsp?id=" + selectRow.gatherid;
	    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
		window.open(executeUrl, "合同收款记录详细信息","fullscreen=1" );
    }
    
	//计算待收款金额
	nui.get('csGatherFc_grid').on('load',function(e){
		var datas = csGatherFc_grid.getData();
		var totalfcsum = 0;
		for(var i = 0;i < datas.length;i ++){
			var fcsum = datas[i].fcsum;
			if(fcsum){
				if(!isNaN(fcsum)){
					if(datas[i].status == "2"){
						totalfcsum += parseFloat(fcsum);
					}
				}
			}
		}
		var reg=new RegExp(",","g");
		var contsum = document.getElementById("contsum").innerHTML.replace(reg,"");
		document.getElementById("notgathercontsum").innerHTML = nui.formatNumber(parseFloat(contsum-totalfcsum),'n');
    })
    
	//收款表格可编辑颜色控制  //合同收入预估grid加载时设置样式
    function changeColor(e){
    	//状态为已收款的，设置行样式
    	if(e.record.status == "2" || e.record.status =="3"){
        	e.cellStyle = "background-color: #33FFFF";
    	}
    }
	
	//已收款汇总行    保函保、证金汇总行    收入确认汇总行   产品分成汇总 //关联采购合计
	function drawSum(e){
		if (e.field == "fcsum" || e.field == "actsum" || e.field == "backdepmon" 
			|| e.field == "returnmon"|| e.field == "productsum"|| e.field == "servicesum" 
			||e.field == "masum" || e.field == "actproductsum"|| e.field == "actservicesum"|| e.field == "actmasum"
			||e.field == "ordermon" || e.field == "orderprodmon" || e.field == "servjsmon" || e.field == "prodwbmon" || e.field == "orderservmon"
			|| e.field == "servsubmon" || e.field == "othmon"||e.field == "contsum" || e.field == "tax"|| e.field == "contsum2"|| e.field == "pratiomon"
			||e.field == "payedmon" || e.field == "summon"|| e.field == "summon2"
			|| e.field == "total"  || e.field == "grantnum"  || e.field == "lastnum" ) {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	function drawSum1(e){
		if (e.field == "purmoney" || e.field == "yzfje" || e.field == "accruedmoney" 
			) {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	function drawSum2(e){
		if (e.field == "accruedmoney" 
			) {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	function drawSum3(e){
		if (e.field == "setamount" 
			) {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
    
    //动态加载合同销售人员
    function getSalesByContractid(){
    	var json = nui.encode({contractid: contractid});
    	nui.ajax({
            url: "com.primeton.mis.contract.contract.querySalesByContractid.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
			async:false, 
            success: function (o) {
				o = nui.decode(o);
				var html="";
                var salesLists= [];
                salesLists=o.data;
                for(var i=0;i<salesLists.length;i++){
                	var salesList =salesLists[i];
                	if(i>0){
                		html+='<br/>';
                	}
                	html+='<div id="dept_grid'+i+'" showPager="false" frozenStartColumn="0" frozenEndColumn="6"  sortMode="client" onselectionchanged="selectionChanged" class="nui-datagrid" style="width:97%;height:auto;" multiSelect="true" allowSortColumn=true>';
                	html+='<div property="columns">';
                	html+='<div field="oldsalename" width="50" headerAlign="center">原销售</div>';
                	html+='<div field="salename" width="50" headerAlign="center">销售</div>';
                	html+='<div field="orgname" width="70" headerAlign="center">所在部门</div>';
                	html+='<div field="org" width="100" headerAlign="center" renderer="onGenderRenderer">所属事业部</div>';
                	html+='<div field="techdirectorname" width="70" headerAlign="center" >技术负责人</div>';
                	html+='<div field="techorgname" width="90" headerAlign="center">技术负责部门</div>';
                	html+='<div field="contsum" dataType="currency" width="80" headerAlign="center" align="right">合同总金额</div>';
                	html+='<div field="prodmon" dataType="currency" width="80" headerAlign="center" align="right">产品金额</div>';
                	html+='<div field="servjsmon" dataType="currency" width="80" headerAlign="center" align="right">技术服务金额</div>';
                	html+='<div field="prodwbmon" dataType="currency" width="80" headerAlign="center" align="right">产品维保金额</div>';
                	html+='<div field="servmon" dataType="currency" width="80" headerAlign="center" align="right">服务总金额</div>';
                	html+='<div name="servsubmon" dataType="currency" field="servsubmon" width="80" headerAlign="center" align="right">服务采购1</div>';
                	if(!(isFinance == false && isCommerce == false )){//非商务、非财务、非领导，不能看服务费
                		html+='<div name="othmon" dataType="currency" field="othmon" width="80" headerAlign="center" align="right">服务采购2</div>';
                		html+='<div field="netservmon" dataType="currency" width="80" headerAlign="center" align="right">服务净额</div>';
                	}
                	html+='<div field="confservmon" dataType="currency" width="110" headerAlign="center" align="right">累积确认服务收入</div>';
                	html+='<div field="confnetservmon" dataType="currency" width="110" headerAlign="center" align="right">累积确认服务净收入</div>';
                	html+='<div name="servpayedmon" dataType="currency" field="servpayedmon" width="115" headerAlign="center" align="right">累积支付服务采购1</div>';
                	if(!(isFinance == false && isCommerce == false )){//非商务、非财务、非领导，不能看服务费
                		html+='<div name="othpayedmon" dataType="currency" field="othpayedmon" width="110" headerAlign="center" align="right">累积支付服务采购2</div>';
                		html+='<div field="contpolmon" dataType="currency" width="76" headerAlign="center" align="right">合同净额</div>';
                	}
                	html+='</div>';
                	html+='</div>';
                	html+='<div id="employee_grid'+i+'" frozenStartColumn="0" frozenEndColumn="4" showPager="false"  sortMode="client" onselectionchanged="selectionChanged" class="nui-datagrid" style="width:97%;height:auto;" multiSelect="true" allowSortColumn=true>';
                	html+='<div property="columns">';
                	html+='<div field="prodname" displayField="prodtypename" width="210" headerAlign="center" >产品名称</div>';
                	html+='<div field="price" dataType="currency" width="78" align="center" headerAlign="center">产品单价</div>';
                	html+='<div field="prodnumtype" width="100" align="center" headerAlign="center" renderer="dictProdUnit">产品数量单位</div>';
                	html+='<div field="prodnum" width="100" align="right" headerAlign="center">产品数量</div>';
                	html+='<div field="prodmon" dataType="currency" width="78" align="center" headerAlign="center">产品金额</div>';
                	html+='<div name="prodsubmon" dataType="currency" field="prodsubmon" width="90" align="center" headerAlign="center">产品采购1</div>';
                	if(!(isFinance == false && isCommerce == false)){//非商务、非财务、非领导，不能看服务费
                		html+='<div name="othmon" field="othmon" dataType="currency" width="80" align="center" headerAlign="center">产品采购2</div>';
                		html+='<div field="netprodmon" dataType="currency" width="78" align="center" headerAlign="center">产品净额</div>';
                	}
                	html+='<div field="prodwbmon" dataType="currency" width="78" align="center" headerAlign="center">产品维保金额</div>';
                	html+='<div field="prodwbsubmon" dataType="currency" width="78" align="center" headerAlign="center">产品维保分包费</div>';
                	html+='<div field="prodwbothmon" dataType="currency" width="78" align="center" headerAlign="center">产品维保服务费</div>';
                	html+='<div field="prodwbnetmon" dataType="currency" width="78" align="center" headerAlign="center">产品维保净额</div>';
                	html+='<div field="confprodmon" dataType="currency" width="90" align="center" headerAlign="center">累积确认收入</div>';
                	html+='<div field="confnetprodmon" dataType="currency" width="100" align="center" headerAlign="center">累积确认净收入</div>';
                	html+='<div name="prodpayedmon" dataType="currency" field="prodpayedmon" width="130" align="center" headerAlign="center">累积支付产品采购1</div>';
                	if(!(isFinance == false && isCommerce == false)){//非商务、非财务、非领导，不能看服务费
                		html+='<div name="othpayedmon" dataType="currency" field="othpayedmon" width="120" align="center" headerAlign="center">累积支付产品采购2</div>';
                	}
                	html+='</div>';
                	html+='</div>';
                	
                }
               	$('#salesList').append(html);
               	nui.parse();
               	for(var i=0;i<salesLists.length;i++){
               		var salesList1=salesLists[i];
					var dept_grid=nui.get("#dept_grid"+i);
			        var employee_grid=nui.get("#employee_grid"+i);
			        var arr=[];
			        arr.push(salesLists[i]);
			        dept_grid.setData(arr);
			        employee_grid.setData(salesList1.saleProds);
				}
            }
        });
    }
    
    //采购合同编号链接
    function getPurcontnoDetail(e){
    	if(e.value)
    	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    }
      //采购合同编号链接
    function getPurcontnoDetail1(e){
    	if(e.value)
    	return "<a href='javascript:void(0)' onclick='checkDetail1();' title='点击查看'>" + e.value + "</a>";
    }
      //采购合同编号链接
    function getPurcontnoDetail2(e){
    	if(e.value)
    	return "<a href='javascript:void(0)' onclick='checkPurcontnoDetail2();' title='点击查看'>" + e.value + "</a>";
    }
      //采购合同编号链接
    function getPurcontnoDetail3(e){
    	if(e.value)
    	return "<a href='javascript:void(0)' onclick='checkDetail3();' title='点击查看'>" + e.value + "</a>";
    }
          //采购结算编号链接
    function getPurcontnoDetail4(e){
    	if(e.value)
    	return "<a href='javascript:void(0)' onclick='checkDetail4();' title='点击查看'>" + e.value + "</a>";
    }
    function checkDetail(){
 		var selectRow = thirdpay_grid.getSelected();
		var executeUrl = "/default/ame_pur/PurContract/DetailPurContract.jsp?id=" + selectRow.purcontid;
	    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
		window.open(executeUrl,"采购合同详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
    }
    function checkDetail1(){
 		var selectRow = purcontract_grid.getSelected();
		var executeUrl = "/default/ame_pur/PurContract/DetailPurContract.jsp?id=" + selectRow.purcontid;
	    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
		window.open(executeUrl,"采购合同详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
    }
     function checkPurcontnoDetail2(){
 		var selectRow = purPresettle_grid.getSelected();
		var executeUrl = "/default/ame_pur/PurContract/DetailPurContract.jsp?id=" + selectRow.purcontid;
	    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
		window.open(executeUrl,"采购合同详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
    }
     function checkDetail3(){
 		var selectRow = purSettle_grid.getSelected();
		var executeUrl = "/default/ame_pur/PurContract/DetailPurContract.jsp?id=" + selectRow.purcontid;
	    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
		window.open(executeUrl,"采购合同详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
    }
     function checkDetail4(){
 		var selectRow = purSettle_grid.getSelected();
 		if (selectRow.purtype == 0) {
	 			executeUrl = "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleLook.jsp?settlementid=" + selectRow.settlementid + "&projectno=" + selectRow.projectno + "&custid=" + selectRow.custid + "&custno=" + selectRow.custno;
	 		} else {
	 			executeUrl = "<%=request.getContextPath() %>/ame_pur/settle/PurOutSettleOtherLook.jsp?settlementid=" + selectRow.settlementid + "&projectno=" + selectRow.projectno + "&custid=" + selectRow.custid;			
	 		}
	    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
		window.open(executeUrl,"采购合同详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
    }
    function getReveProdtype(e){
		return nui.getDictText('REVE_PRODTYPE',e.value);
	}
	function getStatus(e) {
        return nui.getDictText('AME_REVESTATUS',e.value);
    }
	//收入类型
	function onGenderInComeType(e) {
        return nui.getDictText('AME_REVETYPE',e.value);
    }
    //新合同收入类型
    function onGenderNewType(e){
        return nui.getDictText('AME_NEWTYPE',e.value);
    }
    //收入确认证据
    function onGenderInComeConv(e){
    	return nui.getDictText('MIS_INCOMECONV',e.value);
    }
    //确认旬度
    function onGenderMonthperiod(e){
    	return nui.getDictText('AME_MONTHPERIOD',e.value);
    }
    //状态
    function onGenderStatus(e){
    	return nui.getDictText('AME_REVESTATUS',e.value);
    }
    //是否需要销售评估
    function onGenderSaleseva(e){
    	return nui.getDictText('MIS_YN',e.value);
    }
    //合同保函保证金状态
    function onCsBackDepStatus(e){
    	return nui.getDictText('CS_BACK_DEP',e.value);
    }
    //项目合同关系类型
    function onProconttype(e){
    	return nui.getDictText('AME_PROCONT',e.value);
    }
    function dictProdUnit(e) {
        return nui.getDictText('CS_PROD_UNIT',e.value);
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
	function onGenderRenderer(e) {
        return nui.getDictText('CONT_ORG',e.value);
    }
	function onGender1Renderer(e) {
        return nui.getDictText('SERV_NUM_TYPE',e.value);
    }
    function onIndusRenderer(e){
    	return nui.getDictText('MIS_INDUSTRY',e.value);
    }
    function onCurstageRenderer(e){
    	return nui.getDictText('MIS_PHASE',e.value);
    }
    function onRecTypeRenderer(e){
    	return nui.getDictText('CS_RECFROM',e.value);
    }
    function onReleaRenderer(e){
    	return nui.getDictText('MIS_DEVELOPPHASE',e.value);
    }
    function onServmodleRenderer(e){
    	return nui.getDictText('CS_SERVMODULE',e.value);
    }
    function onOpentypeRenderer(e){
    	return nui.getDictText('CS_OPENTYPE',e.value);
    }
	function onBilltypeRenderer(e) {
        return nui.getDictText('BILLTYPE',e.value);
    }
	function onBilltype1Renderer(e) {
        return nui.getDictText('MIS_BILLSTATUS',e.value);
    }
    function onProjectTypeRenderer(e){
    	return nui.getDictText('PROJECT_TYPE',e.value);
    }
    function onprojectStatusRenderer(e){
    	return nui.getDictText('MIS_PROJSTATUS',e.value);
    }
    function onProjectoutstatusRenderer(e){
    	return nui.getDictText('MIS_PROJOUTSTATUS',e.value);
    }
	//合同业务分类
    function getCsContracttype(e){
		return nui.getDictText('CS_CONTRACT_TYPE',e.value);
	}
	function dictpurtype(e) {
		return nui.getDictText('AME_CONTYPE',e.value);//设置业务字典值
	}
	//设置业务字典值-计提状态
	function dictGetAccruedStatus(e){
		return nui.getDictText('AME_ACCRUEDSTATUS',e.value);
	}
	//设置业务字典值-结算单状态
	function dictGetStatus1(e){
		return nui.getDictText('AME_SETSTATUS',e.value);
	}
	//合同产品授权单位
    function getCsContLicType(e){
		return nui.getDictText('CS_CONT_LIC_UNIT',e.value);
	}
	
	function doCsReveSum(e){        	
        if (e.field == "contsum" || e.field == "labormonth"|| e.field == "labormonthact"|| e.field == "fcsum2" ||e.field == "actsum2"||e.field == "actsum"||e.field == "actproductsum"||e.field == "actservicesum"||e.field == "actservicesum2"||e.field == "actmasum"||e.field == "actproductsum2"||e.field == "actmasum2") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
    }
    
    function dictstatus(e) {
		if((e.value == "2" || e.value == "3") && e.record.processinstid != null){
			return "<a href='javascript:void(0)' onclick='checkDictstatus();' title='点击查看流程图'>" + nui.getDictText('AME_REVESTATUS',e.value) + "</a>";
		}else{
			return nui.getDictText('AME_REVESTATUS',e.value);//设置业务字典值
		}
	}
	function newtype(e) {
		return nui.getDictText('AME_NEWTYPE',e.value);//设置业务字典值
	}
	function revetype(e) {
		return nui.getDictText('AME_REVETYPE',e.value);//设置业务字典值
	}
	
	function checkDictstatus(e){
		var selectRow = grid.getSelected();
		var processInstID = selectRow.processinstid;
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
	
	function onOk(){
		var o = form.getData();
		var json = nui.encode(o);
		nui.get("contractview_save").disable();
        nui.ajax({
            url: "com.primeton.mis.contract.contract.upateC.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	nui.alert("保存成功！");
            	nui.get("contractview_save").enable();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
                nui.get("contractview_save").enable();
            }
        });
	}
		
</script>
</html>