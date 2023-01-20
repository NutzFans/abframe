<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>查看流程业务信息</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<%Long processInstID = Long.parseLong(request.getParameter("processInstID")); %>
<div class="nui-fit">
	<form id="form1" method="post" >
        <input name="csBill.billid" id="billid" class="nui-hidden" />
        <input name="csContract.contractid" id="contractid" class="nui-hidden"/>
        <fieldset style="border: solid 1px #aaa;padding:3px;">
            <legend>开票信息</legend>
            <div style="padding:5px;">
		        <table style="table-layout:fixed;">
		        	<tr>
						<td align="right" style="width:130px"></td>
						<td style="width:190px"></td>
						<td align="right" style="width:130px"></td>
						<td style="width:190px"></td>
						<td align="right" style="width:130px"></td>
						<td style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">合同名称：</td>
						<td id="projectname" style="width:830px;" colspan="5"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">合同编号：</td>
						<td id="contnum" style="width:190px;"></td>
						<td align="right" style="width:130px">客户：</td>
						<td id="miscustname" style="width:190px;"></td>
						<td align="right" style="width:130px">受益人：</td>
						<td id="salename" style="width:190px;"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">合同金额：</td>
						<td id="contsum" style="width:190px"></td>
						<td align="right" style="width:130px">已确认收款：</td>
						<td id="income" style="width:190px"></td>
						<td align="right" style="width:130px">合同收入类型：</td>
						<td id="incometype" style="width:190px"></td>
					</tr>
					<tr>
		                <td style="width:130px;" align="right">合同产品金额：</td>
		                <td style="width:190px;" id="csContract.prodmon"></td>
		                <td style="width:130px;" align="right">合同服务金额：</td>
		                <td style="width:190px;" id="csContract.servmon"></td>
		                <td style="width:130px;display:none;" align="right">合同MA金额：</td>
		                <td style="width:190px;display:none;" id="csContract.masum"></td>
					</tr>
		        </table>
		    </div>
        </fieldset>
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 1195px;">
            <legend>合同收款记录列表</legend>
        	<div id="csGatherFcGrid" class="nui-datagrid" style="width: 100%;height:auto;" allowResize="true" 
        		dataField="csGatherFcs" showSummaryRow="true" ondrawsummarycell="doCsGatherFcSum" showPager="false" 
		    	url="com.primeton.eos.ame_income.gatherFcBillingProcess.getCsGahterFcList.biz.ext" multiSelect="true"
		    	onlyCheckSelection="true">
				<div property="columns">
					<div field="gatherno" width="60" align="center" headerAlign="center">收款次数</div>
					<div field="status" width="120" align="center" headerAlign="center" renderer="dictstatus">收款状态</div>
					<div field="billstatus" width="120" align="center" headerAlign="center" renderer="dictstatusbill">开票状态</div>
					<div field="gathertype" width="90" align="center" headerAlign="center" renderer="dictGatherFcType">收款类型</div>	
					<div field="newyearmonth" width="80" align="center"  headerAlign="center">预计收款年月</div>
					<div field="fcsum" width="130" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收款金额（含税）</div>	
					<div field="productsum" width="150" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收款产品金额（含税）</div>
					<div field="servicesum" width="150" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收款服务金额（含税）</div>
					<div field="fcreverate" width="80" align="center" headerAlign="center" numberFormat="p1">预计确认比例</div>	
					<div field="actsum" width="130" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">已收款金额</div>	
					<div field="confirmday" width="80" align="center" headerAlign="center">实际收款日期</div>
				</div>
			</div>
        </fieldset>
        
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 1135px;">
            <legend>合同收入记录列表</legend>
        	<div id="csReveForecastGrid" class="nui-datagrid" style="width: 100%;height:auto;" allowResize="true" 
        		dataField="csReveForecasts" showSummaryRow="true" ondrawsummarycell="doCsReveForecastSum" showPager="false" 
		    	url="com.primeton.eos.ame_income.gatherFcBilling.getCsReveForecastsByCscontract.biz.ext" multiSelect="true">
				<div property="columns">
					<div field="reveno" width="55" align="center" headerAlign="center">收入次数</div>
					<div field="status" width="120" align="center" headerAlign="center" renderer="dictrevestatus">收入状态</div>
					<div field="revetype" width="120" align="center" headerAlign="center" renderer="dictReveType">收入类型</div>	
					<div field="newyearmonth" width="80" align="center"  headerAlign="center">预计收入年月</div>
					<div field="fcsum" width="130" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收入金额（含税）</div>	
					<div field="productsum" width="150" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收入产品金额（含税）</div>
					<div field="servicesum" width="150" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收入服务金额（含税）</div>
					<div field="fcreverate" width="80" align="center" headerAlign="center" numberFormat="p1">预计确认比例</div>	
					<div field="actsum" width="130" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">已收入金额</div>	
					<div field="confirmday" width="80" align="center" headerAlign="center">实际收入日期</div>
				</div>
			</div>
        </fieldset>
        
        <fieldset style="border:solid 1px #aaa;padding:3px;display: none;width: 1335px;" id="kpcpxxxx">
            <legend>开票产品详细信息</legend>
            <div style="width:100%;">
		    </div>
            <div style="padding:5px;">
	        	<div id="prod_grid" class="nui-datagrid" style="width: 1330px;height:auto;" allowResize="true" 
	        		<%--oncellendedit="doCal"--%> onselect="prodGridOnselect" ondeselect="prodGridOnselect" showPager="false" 
	        		allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" 
	        		onlyCheckSelection="true">			        
			        <div property="columns">
			            <div field="conProId" width="0" headerAlign="center" >conProId</div>
			            <div type="checkcolumn"></div>
			            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
			            <div field="prod_name" width="180" headerAlign="center">产品名称</div>
			            <div field="prodmon" width="100" dataType="currency" headerAlign="center" align="right">产品金额</div>
			            <div field="price" width="100" dataType="currency" headerAlign="center" align="right">开票单价</div>
			            <div field="num" width="60" headerAlign="center" dataType="currency" align="right" >开票数量</div>
			            <div field="unit" width="60" headerAlign="center" renderer="onUnitRenderer">开票单位</div>
			            <div field="money" width="100" dataType="currency" headerAlign="center" align="right" >产品开票金额</div>
			            <div field="tax" width="80" headerAlign="center" dataType="currency" align="right">税金</div>
			            <div field="u8xse" width="90" headerAlign="center" dataType="currency" align="right">销售额(不含税)</div>
			            <div field="taxrate" width="60" headerAlign="center" dataType="currency" align="right">税率</div>
			            <div field="status" width="80" headerAlign="center" align="left" renderer="onBillStatusRenderer" >状态</div>
			            <div field="miemo" width="auto" headerAlign="center">开票特殊要求
			            	<input property="editor" class="nui-textarea" style="width:100%;" readOnly="readOnly"/>
			            </div>
			            <div field="rdmiemo" width="auto" headerAlign="center" >发票右下角备注
			            	<input property="editor" class="nui-textarea" style="width:100%;" readOnly="readOnly"/>
			            </div>
			        </div>
			    </div>
            </div>
            <div style="width: 580px;height: 25px;margin-left: 65px;float:left;">
				<table style="table-layout:fixed;font-weight: bold;" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="right" style="width: 180px;"></td>
						<!-- 产品金额 -->
						<td id="prodmonTotal" style="width: 100px;" align="right" ></td>
						<!-- 开票单价 -->
						<td id="prodPriceTotal" style="width: 100px;" align="right" ></td>
						<!-- 开票数量 -->
						<td id="prodNumTotal" style="width: 60px;" align="right" ></td>
						<td style="width: 60px;" align="right" ></td>
						<!-- 产品开票金额 -->
						<td id="prodMoneyTotal" style="width: 100px;" align="right" ></td>
					</tr>
				</table>
			</div>
        </fieldset>
        
        <fieldset style="border:solid 1px #aaa;padding:3px;display: none;width: 1285px;" id="kpfwxxxx">
            <legend>开票服务详细信息</legend>
            <div style="width:100%;">
		    </div>
            <div style="padding:5px;">
	        	<div id="serv_grid" class="nui-datagrid" style="width: 1280px;height:auto;" allowResize="false" 
	        		<%--oncellendedit="doCal"--%> onselect="servGridOnselect" ondeselect="servGridOnselect" showPager="false" 
	        		allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" 
	        		onlyCheckSelection="true">			        
			        <div property="columns">    
			        	<div field="contsaleid" width="0" headerAlign="center" >contsaleid</div>
			        	<div type="checkcolumn"></div> 
			            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
			            <div field="servname" width="100" headerAlign="center" align="left" renderer="onServRenderer">服务名称</div>
			            <div field="servmon" width="100" dataType="currency" headerAlign="center" align="right">服务金额</div>
			            <div field="price" width="100" headerAlign="center" dataType="currency" align="right">开票单价</div>
			            <div field="num" width="60" headerAlign="center" dataType="currency" align="right" >开票数量</div>
			            <div field="unit" width="55" headerAlign="center" renderer="onUnitSALERenderer">开票单位</div>
			            <div field="money" width="100" headerAlign="center" dataType="currency" align="right">服务开票金额</div>
			            <div field="tax" width="80" headerAlign="center" dataType="currency" align="right">税金</div>
			            <div field="u8xse" width="90" headerAlign="center" dataType="currency" align="right">销售额(不含税)</div>
			            <div field="taxrate" width="60" headerAlign="center" dataType="currency" align="right">税率</div>
			            <div field="status" width="80" headerAlign="center" align="left" renderer="onBillStatusRenderer" >状态</div>
			            <div field="miemo" width="auto" headerAlign="center">开票特殊要求
			            	<input property="editor" class="nui-textarea" style="width:100%;" readOnly="readOnly"/>
			            </div>
			            <div field="rdmiemo" width="auto" headerAlign="center" >发票右下角备注
			            	<input property="editor" class="nui-textarea" style="width:100%;" readOnly="readOnly"/>
			            </div>
			        </div>    
			    </div>
            </div>
            <div style="width: 500px;height: 25px;margin-left: 65px;float:left;">
				<table style="table-layout:fixed;font-weight: bold;" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<!-- 服务金额 -->
						<td align="right" style="width: 100px;"></td>
						<td id="servMonTotal" style="width: 100px;" align="right" ></td>
						<!-- 开票单价 -->
						<td id="servPriceTotal" style="width: 100px;" align="right" ></td>
						<!-- 开票数量 -->
						<td id="servNumTotal" style="width: 60px;" align="right" ></td>
						<!-- 产品开票金额 -->
						<td id="servMoneyTotal" style="width: 100px;" align="right" ></td>
					</tr>
				</table>
			</div>
        </fieldset>
    
        <!-- 提供开票基本信息输入（开票单位、开票类型、开票账户信息、预计到款时间，发票邮寄信息） -->
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 1050px;">
        	<legend id="billTitle">开票信息</legend>
			<div style="padding:5px;">
				<input name="csNewbill.appname" id="appname" class="nui-hidden"/>
				<input name="csNewbill.fileids" id="fileids1" class="nui-hidden"/>
				<table style="table-layout:fixed;" id="table_file">
					<tr>
						<td align="right" style="width:100px">开票产品金额：</td>
						<td id="billprodmon" style="width: 300px"></td>
						<td align="right" style="width:100px">开票服务金额：</td>
						<td id="billservmon" style="width: 200px"></td>
						<td align="right" style="width:100px">开票金额：</td>
						<td id="billsummon" style="width: 120px"></td>
					</tr>
					<tr>
						<td align="right" style="width:100px">客户名称：</td>
						<td id="custname" style="width: 300px"></td>
						<td align="right" style="width:100px">开票单位：</td>
						<td id="accoutname" style="width: 200px" colspan="3"></td>
					</tr>
					<tr>
	                	<td align="right" style="width:130px">发票类型：</td>
						<td id="billtype" style="width: 100px"></td>
						<td align="right" style="width:100px">开票申请日期：</td>
						<td style="width:75px" id="billappdate"></td>
						<td align="right" style="width:100px">税号：</td>
						<td id="taxnumb" style="width: 200px"></td>
	                </tr>
					<tr id="temp1" >
						<td align="right" style="width:100px">账号：</td>
						<td id="accountid" style="width: 200px"></td>
						<td align="right" style="width:100px">开户银行：</td>
						<td id="accoutbank" style="width: 300px" colspan="3"></td>
					</tr>
					<tr id="temp2" >
						<td align="right" style="width:100px">开票单位电话：</td>
						<td id="telephone" style="width: 200px"></td>
						<td align="right" style="width:100px">开票单位地址：</td>
						<td id="address" style="width: 300px" colspan="3"></td>
					</tr>
					<tr id="temp3" >
						<td></td>
						<td></td>
					</tr>
					<tr>
						<td align="right" style="width:100px">发票邮寄地址：</td>
						<td id="mailingaddress" style="width: 300px"></td>
						<td align="right" style="width:100px">发票邮寄联系人：</td>
						<td id="mailinglinkman" style="width: 100px"></td>
						<td align="right" style="width:100px">发票邮寄电话：</td>
						<td id="mailinglinktel" style="width: 150px"></td>
					</tr>
					<tr>
						<td align="right" style="width:100px">确认人：</td>
						<td style="width: 200px" id="suresaleid"></td>
						<td align="right" style="width:100px">开票日期：</td>
						<td style="width:75px" id="billdate"></td>
						<td align="right" style="width:100px">开票类型：</td>
						<td id="billtype1" style="width: 150px"></td>
						<td></td><td></td>
					</tr>
				</table>
			</div>
        </fieldset>
        	
        <fieldset style="border:solid 1px #aaa;padding:3px;width: 1050px;">
        	<legend id="ticketTitle">发票信息</legend>
        	<div style="padding:5px;">
	        	<div id="ticket_grid" class="nui-datagrid" style="width: 970px;height:auto;" allowResize="false" 
	        		showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
	        		editNextOnEnterKey="true" onlyCheckSelection="true" oncellbeginedit="cellbegineditticket"
	        		onselect="ticketGridOnselect" ondeselect="ticketGridOnselect" oncellendedit="doCal_ticket">			        
			        <div property="columns"> 
			        	<div type="checkcolumn" width="30"></div>   
			        	<div field="ticketid" width="0" headerAlign="center" >TICKETID</div>
			            <div field="type" width="70" headerAlign="center" align="left" renderer="onTypeRenderer" >开票类型
			            	<input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="CS_BILLTICKET_TYPE"/>
			            </div>
			            <div field="billtype1" width="100" headerAlign="center" align="left" renderer="onBillTypeRenderer">开票来源</div>
			            <div field="status" width="100" headerAlign="center" align="left" renderer="onStatusRenderer" >发票状态</div>
			            <div field="money" width="100" headerAlign="center" dataType="currency" align="right">发票金额
			            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
			            </div>
			            <div field="tax" width="100" headerAlign="center" dataType="currency" align="right">税金
			            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
			            </div>
			            <div field="u8xse" width="100" headerAlign="center" dataType="currency" align="right">销售额
			            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
			            </div>
			            <div field="taxrate" width="100" headerAlign="center" dataType="currency" align="right">税率
			            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
			            </div>
			            <div field="billno" width="auto" headerAlign="center" align="left" align="right">票号
			            	<input property="editor" class="nui-textbox" style="width:100%;" />
			            </div>
			            <div field="ticketdate" width="80" headerAlign="center" align="left" align="right" dateFormat="yyyy-MM-dd">发票日期
			            	<input property="editor" class="nui-datepicker" style="width:100%;" />
			            </div>
			            <div field="czticketid" width="0" headerAlign="center" >CZTICKETID</div>
			        </div>    
			    </div>
            </div>
            <div style="width: 200px;height: 25px;margin-left: 75px;float:left;">
				<table style="table-layout:fixed;font-weight: bold;" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="right" style="width: 100px;"></td>
						<!-- 发票金额 -->
						<td id="ticketMoneyTotal" style="width: 100px;" align="right" ></td>
					</tr>
				</table>
			</div>
        </fieldset>
    </form>
	<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;width: 920px;">
		<legend>开票附件</legend>
		<jsp:include page="/ame_common/detailFile.jsp"/>
	</fieldset>
    <!-- 审核意见  -->
	<jsp:include page="/ame_common/misOpinion.jsp"/>
</div>

<div id="win1" class="nui-window" title="开票产品详细信息" style="width: 900px;height: auto;" 
    showMaxButton="true" showCollapseButton="true" showShadow="true"
    showToolbar="false" showFooter="true" showModal="true" allowResize="true" allowDrag="true">
	<div style="padding:5px;">
    	<div id="prod_grid_chooise" class="nui-datagrid" style="width: 870px;height: auto;" allowResize="true" 
    		showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
    		editNextOnEnterKey="true" allowUnselect="true">			        
	        <div property="columns">
	        	<div type="checkcolumn" width="30"></div>
	            <div field="conProId" width="60" headerAlign="center" >conProId</div>
	            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
	            <div field="prod_name" width="180" headerAlign="center">产品名称</div>
	            <div field="prodmon" width="100" dataType="currency" headerAlign="center" align="right">产品金额</div>
	            <div field="price" width="80" dataType="currency" headerAlign="center" align="right">开票单价</div>
	            <div field="num" width="60" headerAlign="center" align="right">开票数量</div>
	            <div field="unit" width="60" headerAlign="center" renderer="onUnitRenderer">开票单位</div>
	            <div field="money" width="80" dataType="currency" headerAlign="center" align="right" >产品开票金额</div>
	            <div field="miemo" width="auto" headerAlign="center" >开票特殊要求</div>
	            <div field="rdmiemo" width="auto" headerAlign="center" >发票右下角备注</div>
	        </div>
	    </div>
        <div class="nui-toolbar" style="text-align:center;width: 862px;height: 30px;">
	        <a class="nui-button" onclick="sureChooise('0')" style="">确定</a>
	        <a class="nui-button" onclick="hideWindow('0')" style="margin-left: 20px">关闭</a>
	    </div>
    </div>
</div>
<div id="win2" class="nui-window" title="开票服务详细信息" style="width: 800px;height: auto;" 
    showMaxButton="true" showCollapseButton="true" showShadow="true"
    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
    <div style="padding:5px;">
    	<div id="serv_grid_chooise" class="nui-datagrid" style="width: 770px;height:auto;" allowResize="false" 
    		showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
    		editNextOnEnterKey="true" allowUnselect="true">			        
	        <div property="columns">    
	        	<div type="checkcolumn" width="30"></div>
	        	<div field="contsaleid" width="60" headerAlign="center" >contsaleid</div> 
	            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
	            <div field="servname" width="100" headerAlign="center" align="left" renderer="onServRenderer">服务名称</div>
	            <div field="servmon" width="100" dataType="currency" headerAlign="center" align="right">服务金额</div>
	            <div field="price" width="80" headerAlign="center" dataType="currency" align="right">开票单价</div>
	            <div field="num" width="60" headerAlign="center" align="right" align="right">开票数量</div>
	            <div field="money" width="80" headerAlign="center" dataType="currency" align="right">服务开票金额</div>
	            <div field="miemo" width="auto" headerAlign="center" >开票特殊要求</div>
	            <div field="rdmiemo" width="auto" headerAlign="center" >发票右下角备注</div>
	        </div>    
	    </div>
    </div>
</div>
</body>
<script type="text/javascript">
    nui.parse();
    var billid = '<%=request.getParameter("billid") %>';
	var form = new nui.Form("form1");
	//合同收款
	var csGatherFcGrid = nui.get("csGatherFcGrid");
	//合同收入
	var csReveForecastGrid = nui.get("csReveForecastGrid");
	//开票产品详细信息
	var prod_grid = nui.get("prod_grid");
	//开票服务详细信息
	var serv_grid = nui.get("serv_grid");
	//发票信息
	var ticket_grid = nui.get("ticket_grid");
	//要选择的开票产品详细信息
	var prod_grid_chooise = nui.get("prod_grid_chooise");
	//要选择的开票服务详细信息
	var serv_grid_chooise = nui.get("serv_grid_chooise");
	var billtype1 = "";
	SetData();
    var processinstid = "";
	//文件路径
	var ContextPath= '<%=request.getContextPath() %>' 
    
    //页面进入时调用的方法
    function SetData() {
		var json = nui.encode({csNewbill:{processinstid: <%=processInstID %>}});
        nui.ajax({
            url: "com.primeton.eos.ame_income.gatherFcBilling.getBillApplyNew.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (data) {
                form.setData(data);
                form.setChanged(false);
                //加载结算附件设置参数
        		nui.get("grid_0").load({"groupid":"csNewbill","relationid":data.csNewbill.billid});
				//合同基本信息
                document.getElementById("projectname").innerHTML = data.csNewbill.csContract.projectname == null ?"": data.csNewbill.csContract.projectname;
            	nui.get("contractid").setValue(data.csNewbill.csContract.contractid);
            	document.getElementById("contnum").innerHTML = data.csNewbill.csContract.contnum == null ? "" : data.csNewbill.csContract.contnum;
            	document.getElementById("contsum").innerHTML = data.csNewbill.csContract.contsum == null ? "0.00" : nui.formatNumber(data.csNewbill.csContract.contsum,'#,##.##');
            	document.getElementById("salename").innerHTML = data.csNewbill.csContract.salename == null ? "" : data.csNewbill.csContract.salename;
            	document.getElementById("income").innerHTML = data.csNewbill.csContract.income == null ? "0.00" : nui.formatNumber(data.csNewbill.csContract.income,'#,##.##');
				document.getElementById("incometype").innerHTML = data.csNewbill.csContract.incometype == null ? "" : nui.getDictText('MIS_HTINCOMETYPE',data.csNewbill.csContract.incometype);
            	document.getElementById("miscustname").innerHTML = data.csNewbill.csContract.misCustinfo.custname == null ? "" : data.csNewbill.csContract.misCustinfo.custname;
				document.getElementById("csContract.servmon").innerHTML = data.csNewbill.csContract.servmon== null ? "0.00" : nui.formatNumber(data.csNewbill.csContract.servmon,'#,##.##');
                document.getElementById("csContract.prodmon").innerHTML = data.csNewbill.csContract.prodmon== null ? "0.00" : nui.formatNumber(data.csNewbill.csContract.prodmon,'#,##.##');
                document.getElementById("csContract.masum").innerHTML = data.csNewbill.csContract.masum== null ? "0.00" : nui.formatNumber(data.csNewbill.csContract.masum,'#,##.##');
				//合同收款记录
				processinstid = data.csNewbill.processinstid;
				csGatherFcGrid.load({"csGatherFc": 
					{"contnum": data.csNewbill.csContract.contnum,"billprocinstid": data.csNewbill.processinstid,
						"iden": "CommerceCheck"}},function(){
					//合同收入记录
					csReveForecastGrid.load({"csContract": {"contnum": data.csNewbill.csContract.contnum}},
						function(){
							csReveForecastGrid.selectAll(false);
						}
					);
					//收款类型
        			var sktype = "";
					csGatherFcGrid.selectAll(false);
            		var rows = csGatherFcGrid.getSelecteds();
					for(var i = 0;i < rows.length;i ++){
						if(sktype){
		        			if(sktype.indexOf(rows[i].gathertype + "") == "-1"){
		        				sktype = sktype + "," + rows[i].gathertype;
		        			}
		        		}else{
		        			sktype = rows[i].gathertype + "";
		        		}
					}
					//产品开票详细信息kpcpxxxx
					if(sktype.indexOf("0") != "-1" || sktype.indexOf("2") != "-1"){
						document.getElementById("kpcpxxxx").style.display = "";
						var csBillProds = nui.clone(data.csBillProds);
						prod_grid.setData(data.csBillProds);
						for(var i = 0;i < data.csBillProds.length;i ++){
							if(data.csBillProds[i].billid == data.csNewbill.billid){
								prod_grid.select(data.csBillProds[i]);
							}
						}
						prod_grid_chooise.setData(csBillProds);
					}
					//服务开票详细信息kpfwxxxx
					if(sktype.indexOf("1") != "-1" || sktype.indexOf("2") != "-1"){
						document.getElementById("kpfwxxxx").style.display = "";
						var csBillSales = nui.clone(data.csBillSales);
						serv_grid.setData(data.csBillSales);
						for(var i = 0;i < data.csBillSales.length;i ++){
							if(data.csBillSales[i].billid == data.csNewbill.billid){
								serv_grid.select(data.csBillSales[i]);
							}
						}
						serv_grid_chooise.setData(csBillSales);
					}
					//申请人名称
					nui.get("appname").setValue(data.csNewbill.appname);
					//开票产品金额
    				document.getElementById("billprodmon").innerHTML = data.csNewbill.billprodmon == null ? "0.00" : nui.formatNumber(data.csNewbill.billprodmon,'#,##.##');
    				//开票服务金额
    				document.getElementById("billservmon").innerHTML = data.csNewbill.billservmon == null ? "0.00" : nui.formatNumber(data.csNewbill.billservmon,'#,##.##');
    				//开票金额
    				document.getElementById("billsummon").innerHTML = data.csNewbill.billsummon == null ? "0.00" : nui.formatNumber(data.csNewbill.billsummon,'#,##.##');
    				//开票类型
    				document.getElementById("billtype").innerHTML = data.csNewbill.billtype == null ? "" : nui.getDictText('BILLTYPE',data.csNewbill.billtype);
    				//确认人
    				document.getElementById("suresaleid").innerHTML = data.csNewbill.suresalename == null ? "" : data.csNewbill.suresalename;
    				//开票数量
    				document.getElementById("billdate").innerHTML = data.csNewbill.billdate == null ? "" : data.csNewbill.billdate;
    				//开票数量
    				document.getElementById("billappdate").innerHTML = data.csNewbill.billappdate == null ? "" : data.csNewbill.billappdate;
    				//发票邮寄地址
                    document.getElementById("mailingaddress").innerHTML = data.csNewbill.mailingaddress == null ? "" : data.csNewbill.mailingaddress;
                    //发票邮寄联系人
                    document.getElementById("mailinglinkman").innerHTML = data.csNewbill.mailinglinkman == null ? "" : data.csNewbill.mailinglinkman;
                    //发票邮寄电话
                    document.getElementById("mailinglinktel").innerHTML = data.csNewbill.mailinglinktel == null ? "" : data.csNewbill.mailinglinktel;
    				document.getElementById("billtype1").innerHTML = data.csNewbill.billtype1 == null ? "" : nui.getDictText('CS_BILLTYPE',data.csNewbill.billtype1);
    				billtype1 = data.csNewbill.billtype1;
    				//判断开票类型
    				if(data.csNewbill.billtype == "1"){	//增值税普通
    					document.getElementById("temp1").style.display = "none";
						document.getElementById("temp2").style.display = "none";
						document.getElementById("temp3").style.display = "none";
						//税号
                        document.getElementById("taxnumb").innerHTML = data.csNewbill.taxnumb == null ? "" : data.csNewbill.taxnumb;
    					//开票单位
	    				document.getElementById("custname").innerHTML = data.csNewbill.csContract.misCustinfo.custname == null ? "" : data.csNewbill.csContract.misCustinfo.custname;
                        //户名
                        document.getElementById("accoutname").innerHTML = data.csNewbill.accoutname == null ? "" : data.csNewbill.accoutname;
    				}else{	//增值税专用
    					//开票单位
	    				document.getElementById("custname").innerHTML = data.csNewbill.csContract.misCustinfo.custname == null ? "" : data.csNewbill.csContract.misCustinfo.custname;
                        //户名
                        document.getElementById("accoutname").innerHTML = data.csNewbill.accoutname == null ? "" : data.csNewbill.accoutname;
                        //开户银行
                        document.getElementById("accoutbank").innerHTML = data.csNewbill.accoutbank == null ? "" : data.csNewbill.accoutbank;
                        //税号
                        document.getElementById("taxnumb").innerHTML = data.csNewbill.taxnumb == null ? "" : data.csNewbill.taxnumb;
                        //账号
                        document.getElementById("accountid").innerHTML = data.csNewbill.accountid == null ? "" : data.csNewbill.accountid;
                        //地址
                        document.getElementById("address").innerHTML = data.csNewbill.address == null ? "" : data.csNewbill.address;
                        //电话
                        document.getElementById("telephone").innerHTML = data.csNewbill.telephone == null ? "" : data.csNewbill.telephone;
    				}
    				//发票信息
					if(data.csTicketHashMap){
						ticket_grid.setData(data.csTicketHashMap);
						for(var i = 0;i < data.csTicketHashMap.length;i ++){
							if(data.csTicketHashMap[i].billid == data.csNewbill.billid){
								ticket_grid.select(data.csTicketHashMap[i]);
							}
						}
					}
    				ticketSumRows = ticket_grid.getData().length;
    				
    				//查询审核意见
					var grid1 = nui.get("datagrid1");
					grid1.load({processInstID: <%=processInstID %>});
					grid1.sortBy("time", "desc");
					
					document.getElementById("opinionHide").style.display="none";
				});
            }
        });
	}
	
    function GetData() {
        var o = form.getData();
        return o;
    }
	
	//选择开票产品详细信息行
	function prodGridOnselect(){
		var rows1 = prod_grid.getSelecteds();
		//产品金额合计
		var prodmonSum = 0;
		//产品开票单价合计
		var prodPriceSum = 0;
		//产品开票数量合计
		var prodNumSum = 0;
		//产品开票金额合计
		var prodMoneySum = 0;
		if(rows1.length > 0){
			for(var i = 0;i < rows1.length;i ++){
				var num = 0;
				var price = 0;
				if(rows1[i].num){
					num = rows1[i].num;
					prodNumSum += parseFloat(rows1[i].num);
				}
				if(rows1[i].price){
					price = rows1[i].price;
					prodPriceSum += parseFloat(rows1[i].price);
				}
				if(rows1[i].prodmon){
					prodmonSum += parseFloat(rows1[i].prodmon);
				}
				if(rows1[i].money){
					prodMoneySum += parseFloat(rows1[i].money);
				}
			}
		}
		//产品金额
		document.getElementById("prodmonTotal").innerHTML = nui.formatNumber(prodmonSum,'#,##.##');
		//开票单价
		document.getElementById("prodPriceTotal").innerHTML = nui.formatNumber(prodPriceSum,'#,##.##');
		//开票数量
		document.getElementById("prodNumTotal").innerHTML = parseFloat(prodNumSum).toFixed(2);
		//产品开票金额
		document.getElementById("prodMoneyTotal").innerHTML = nui.formatNumber(prodMoneySum,'#,##.##');
		
		document.getElementById("billprodmon").innerHTML = prodMoneySum.toFixed(2);
		document.getElementById("billsummon").innerHTML = document.getElementById("billservmon").innerHTML + prodMoneySum;
	}
	
	//选择开票服务详细信息行
	function servGridOnselect(){
		//服务金额合计
		var servmonSum = 0;
		//服务开票单价合计
		var servPriceSum = 0;
		//服务开票数量合计
		var servNumSum = 0;
		//服务开票金额合计
		var servMoneySum = 0;
		var rows2 = serv_grid.getSelecteds();
		if(rows2.length > 0){
			for(var i = 0;i < rows2.length;i ++){
				var num = 0;
				var price = 0;
				if(rows2[i].num){
					num = rows2[i].num;
					servNumSum += parseFloat(rows2[i].num);
				}
				if(rows2[i].price){
					price = rows2[i].price;
					servPriceSum += parseFloat(rows2[i].price);
				}
				if(rows2[i].servmon){
					servmonSum += parseFloat(rows2[i].servmon);
				}
				if(rows2[i].money){
					servMoneySum += parseFloat(rows2[i].money);
				}
			}
		}
		//服务金额
		document.getElementById("servMonTotal").innerHTML = nui.formatNumber(servmonSum,'#,##.##');
		//服务开票单价
		document.getElementById("servPriceTotal").innerHTML = nui.formatNumber(servPriceSum,'#,##.##');
		//服务开票数量
		document.getElementById("servNumTotal").innerHTML = parseFloat(servNumSum).toFixed(2);
		//开票服务金额
		document.getElementById("servMoneyTotal").innerHTML = nui.formatNumber(servMoneySum,'#,##.##');
		
		document.getElementById("billservmon").innerHTML = servMoneySum.toFixed(2);
		document.getElementById("billsummon").innerHTML = document.getElementById("billprodmon").innerHTML + servMoneySum;
	}
	
	function ticketGridOnselect(){
		//发票金额合计
		var ticketMoneySum = 0;
		var rows = ticket_grid.getSelecteds();
		if(rows.length > 0){
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].money){
				    if(rows[i].status == '5'){
			    		ticketMoneySum += 0;
				    }else {
						ticketMoneySum += parseFloat(rows[i].money);
				    }
				}
			}
		}
		document.getElementById("ticketMoneyTotal").innerHTML = nui.formatNumber(ticketMoneySum,'#,##.##');
	}
	
	/**
	 * 汇收入记录总行
	 */
	function doCsReveForecastSum(e){
		if (e.field == "fcsum") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "productsum") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "servicesum") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "actsum") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
    //控制发票信息列表已存在的发票不能编辑
	function cellbegineditticket(e){
		var record = e.record;
		var field = e.field;
		if(record.ticketid){
			e.cancel = true;
		}
		if(record.czticketid){
			if(field == "billno" || "tax" == field || "u8xse" == field || "taxrate" == field || "ticketdate" == field){
				ticket_grid.setAllowCellEdit(true);
			}else{
				e.cancel = true;
			}
		}
		//发票金额合计
		var ticketMoneySum = 0;
		var rows = ticket_grid.getSelecteds();
		if(rows.length > 0){
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].money){
					if(rows[i].status == '5'){
				    	ticketMoneySum += 0;
				    }else {
						ticketMoneySum += parseFloat(rows[i].money);
				    }
				}
			}
		}
		document.getElementById("ticketMoneyTotal").innerHTML = nui.formatNumber(ticketMoneySum,'#,##.##');
	}
	
	//开票税率默认值
	function doCal_ticket(e){
		var rows1 = e.record;
		var type = "";
		type = rows1.type;
		
		var u8xse = 0.00;
		var taxrate = 0.00;
		var tax = 0.00;
		
		var taxrate_t = rows1.taxrate;
		if(taxrate_t == 0 || taxrate_t=="" || taxrate_t == null){
			if(type=="0"){
				taxrate = nui.getDictText('AME_SYSCONF','PRODUCTRATE');
			}else if (type=="1"){
				taxrate = nui.getDictText('AME_SYSCONF','SERVICERATE');
			}
			var rowData = {taxrate: taxrate};
			ticket_grid.updateRow(rows1,rowData);
		}
		
		var u8xse_t = rows1.u8xse;
		if(u8xse_t == 0 || u8xse_t == "" || u8xse_t == null){
		    var money = 0.00;
			if(rows1.money == "" || rows1.money == null){
				money = 0.00;
			}else {
				money = rows1.money;
			} 
			taxrate = rows1.taxrate;
			u8xse = parseFloat(money)/(1+taxrate);
			var rowData_t = {u8xse:u8xse};
			ticket_grid.updateRow(rows1,rowData_t);
		}
		
		var tax_t = rows1.tax;
		if(tax_t == 0 || tax_t == "" || tax_t == null || isNaN(tax_t)){
			if(rows1.money == "" || rows1.money == null){
				money = 0.00;
			}else {
				money = rows1.money;
			} 
			var u8xse = 0.00;
			if(rows1.u8xse == "" || rows1.u8xse == null){
				u8xse = 0.00;
			}else{
				u8xse = rows1.u8xse;
			}
			var tax = parseFloat(money) - parseFloat(u8xse);
			var rowData_x = {tax:tax};
			ticket_grid.updateRow(rows1,rowData_x);
		}
	}
	
	function showAtPos(e,conProIds,contsaleids) {
        var win;
        if(e == "0"){
        	if(typeof(conProIds) == "undefined"){
        		//开票产品
        		win = nui.get("win1");
        	}else{
	        	//将conProIds转成字符串类型
		        conProIds = conProIds + "";
	        	//开票产品
	        	win = nui.get("win1");
	        	if(conProIds != null){
		        	prod_grid_chooise.selectAll(false);
		        	var rows = prod_grid_chooise.getSelecteds();
		        	for(var i = 0;i < rows.length;i ++){
		        		if(conProIds.indexOf(rows[i].conProId) == "-1" ){
				        	prod_grid_chooise.deselect(rows[i]);
		        		}
		        	}
	        	}
        	}
        }else if(e == "1"){
        	if(typeof(contsaleids) == "undefined"){
        		//开票服务
        		win = nui.get("win2");
        	}else{
	        	//将contsaleids转成字符串类型
	        	contsaleids = contsaleids + "";
	        	//开票服务
	        	win = nui.get("win2");
	        	if(contsaleids != null){
		        	serv_grid_chooise.selectAll(false);
		        	var rows = serv_grid_chooise.getSelecteds();
		        	for(var i = 0;i < rows.length;i ++){
		        		if(contsaleids.indexOf(rows[i].contsaleid) == "-1" ){
				        	serv_grid_chooise.deselect(rows[i]);
		        		}
		        	}
	        	}
        	}
    	}
        win.showAtPos("center", "middle");
    }
    function hideWindow(e) {
        var win;
        if(e == "0"){
        	//开票产品
        	win = nui.get("win1");
        	prod_grid_chooise.deselectAll();//clearSelect 
        }else if(e == "1"){
        	//开票服务
        	win = nui.get("win2");
        	serv_grid_chooise.deselectAll();
        }
        win.hide();
    }
    
    function sureChooise(e){
    	var rows = "";
    	if(e == "0"){
        	//开票产品
        	rows = prod_grid_chooise.getSelecteds();
        	var conProIds = "";
        	for(var i = 0;i < rows.length;i ++){
        		if(conProIds){
        			conProIds += "," + rows[i].conProId;
        		}else{
	        		conProIds = rows[i].conProId;
        		}
        	}
        	chooiseTicketGridRow.conProIds = conProIds;
        	ticket_grid.updateRow(chooiseTicketGridRow,{});
        	hideWindow("0");
        }else if(e == "1"){
        	//开票服务
        	rows = serv_grid_chooise.getSelecteds();
        	var contsaleids = "";
        	for(var i = 0;i < rows.length;i ++){
        		if(contsaleids){
        			contsaleids += "," + rows[i].contsaleid;
        		}else{
	        		contsaleids = rows[i].contsaleid;
        		}
        	}
        	chooiseTicketGridRow.contsaleids = contsaleids;
        	ticket_grid.updateRow(chooiseTicketGridRow,{});
        	hideWindow("1");
        }
    }
    	
	ticket_grid.on("drawcell", function (e) {
        var record = e.record,
        column = e.column,
        field = e.field,
        value = e.value;
    });
</script>
<script src="<%= request.getContextPath() %>/ame_income/gatherFcBillingProcess/js/gatherFcBillingjs.js" type="text/javascript"></script>
</html>