<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 朱勇伦
  - Date: 2016-12-20 15:00:50
  - Description:
-->
<head>
	<title>合同收款开票流程-财务审核开票</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
	<!-- 显示商务审核页面的内容同时，在审核通过的情况下，允许输入发票编号，开票金额等信息，提交时更改与开票相关的收款记录状态 -->
	<div class="nui-fit">
		<form id="form_cont" method="post">
			<input class="nui-hidden" id="workItemID" value="<%=workItemID %>"/>
			<input class="nui-hidden" name="csNewbill.processinstid" id="csNewbillProcessinstid"/>
			<input class="nui-hidden" name="csNewbill.billid" id="billid"/>
			<input name="csContract.contractid" id="contractid" class="nui-hidden"/>
			<input name="misOpinion.processinstid" id="processinstid2" class="nui-hidden" />
			<fieldset style="border:solid 1px #aaa;padding:3px;width: 98%;">
	            <legend>合同信息</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file1">
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
	        
	        <fieldset style="border:solid 1px #aaa;padding:3px;width: 98%;">
	            <legend>合同收款记录列表</legend>
            	<div id="csGatherFcGrid" class="nui-datagrid" style="width: 100%;height:auto;" allowResize="true" 
            		dataField="csGatherFcs" showSummaryRow="true" ondrawsummarycell="doCsGatherFcSum" showPager="false" 
			    	url="com.primeton.eos.ame_income.gatherFcBillingProcess.getCsGahterFcList.biz.ext" multiSelect="true"
			    	onlyCheckSelection="true">
					<div property="columns">
						<div field="gatherno" width="60" align="center" headerAlign="center">收款次数</div>
						<div field="status" width="60" align="center" headerAlign="center" renderer="dictstatus">收款状态</div>
						<div field="billstatus" width="60" align="center" headerAlign="center" renderer="dictstatusbill">开票状态</div>
						<div field="gathertype" width="60" align="center" headerAlign="center" renderer="dictGatherFcType">收款类型</div>	
						<div field="newyearmonth" width="80" align="center"  headerAlign="center">预计收款年月</div>
						<div field="fcsum" width="130" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收款金额（含税）</div>	
						<div field="productsum" width="150" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收款产品金额（含税）</div>
						<div field="servicesum" width="150" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收款服务金额（含税）</div>
						<div field="fcreverate" width="80" align="center" headerAlign="center" numberFormat="p1">预计确认比例</div>	
						<div field="actsum" width="80" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">已收款金额</div>	
						<div field="confirmday" width="auto" align="center" headerAlign="center">实际收款日期</div>
					</div>
				</div>
	        </fieldset>
	        
	        <fieldset style="border:solid 1px #aaa;padding:3px;display: none;width: 98%;" id="kpcpxxxx">
	            <legend>开票产品详细信息</legend>
	            <div style="padding:5px;">
		        	<div id="prod_grid" class="nui-datagrid" style="width: 100%;height:auto;" allowResize="true" 
		        		oncellendedit="doCal" onselect="prodGridOnselect" ondeselect="prodGridOnselect" showPager="false" 
		        		allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" 
		        		onlyCheckSelection="true">			        
				        <div property="columns">
				        	<div type="checkcolumn" width="0"></div>
				            <div field="conProId" width="0" headerAlign="center" >conProId</div>
				            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
				            <div field="prod_name" width="80" headerAlign="center">产品名称</div>
				            <div field="prodmon" width="80" dataType="currency" headerAlign="center" align="right">产品金额</div>
				            <div field="price" width="70" dataType="currency" headerAlign="center" align="right">开票单价</div>
				            <div field="num" width="55" headerAlign="center" headerAlign="center" align="right">开票数量</div>
				            <div field="unit" width="55" headerAlign="center" renderer="onUnitRenderer">开票单位</div>
				            <div field="money" width="112" dataType="currency" headerAlign="center" align="right">产品开票金额(含税)</div>
				            <div field="tax" width="80" headerAlign="center" dataType="currency" align="right">税金
				            	<input property="editor" class="nui-spinner" style="width: 100%;" format="n2" allowLimitValue="false"
								changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"/>
				            </div>
				            <div field="u8xse" width="90" headerAlign="center" dataType="currency" align="right">销售额(不含税)
				            	<input property="editor" class="nui-spinner" style="width: 100%;" format="n2" allowLimitValue="false"
								changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"/>
				            </div>
				            <div field="taxrate" width="60" headerAlign="center" dataType="currency" align="right">税率
				            	<input property="editor" class="nui-spinner" style="width: 100%;" format="n2" allowLimitValue="false"
								changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"/>
				            </div>
				            <div field="status" width="0" headerAlign="center" align="left" renderer="onBillStatusRenderer" >状态
				            	<input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="MIS_BILLSTATUS"/>
				            </div>
				            <div field="miemo" width="auto" headerAlign="center" >开票特殊要求
				            	<input property="editor" class="nui-textarea" style="width:100%;" readOnly="readOnly"/>
				            </div>
				            <div field="rdmiemo" width="auto" headerAlign="center" >发票右下角备注
				            	<input property="editor" class="nui-textarea" style="width:100%;" readOnly="readOnly"/>
				            </div>
				        </div>
				    </div>
	            </div>
	            <div style="width: 665px;height: 25px;margin-left: 20px;float:left;">
					<table style="table-layout:fixed;font-weight: bold;" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="right" style="width: 80px;"></td>
							<!-- 产品金额 -->
							<td id="prodmonTotal" style="width: 150px;" align="right" ></td>
							<!-- 开票单价 -->
							<td id="prodPriceTotal" style="width: 100px;display: none;" align="right" ></td>
							<!-- 开票数量 -->
							<td id="prodNumTotal" style="width: 180px;" align="right" ></td>
							<td style="width: 60px;" align="right" ></td>
							<!-- 产品开票金额 -->
							<td id="prodMoneyTotal" style="width: 105px;" align="right" ></td>
							<!-- 产品税金金额 -->
							<td id="prodTaxTotal" style="width: 80px;" align="right" ></td>
							<!-- 产品销售金额 -->
							<td id="prodU8xseTotal" style="width: 90px;" align="right" ></td>
						</tr>
					</table>
				</div>
	        </fieldset>
	        
	        <fieldset style="border:solid 1px #aaa;padding:3px;display: none;width: 98%;" id="kpfwxxxx">
	            <legend>开票服务详细信息</legend>
	            <div style="padding:5px;">
		        	<div id="serv_grid" class="nui-datagrid" style="width: 970px;height:auto;" allowResize="false" 
		        		oncellendedit="doCal" onselect="servGridOnselect" ondeselect="servGridOnselect" showPager="false" 
		        		allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" 
		        		onlyCheckSelection="true">			        
				        <div property="columns">    
				        	<div field="contsaleid" width="0" headerAlign="center" >contsaleid</div> 
				            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
				            <div field="servname" width="80" headerAlign="center" align="left" renderer="onServRenderer">服务名称</div>
				            <div field="servmon" width="80" dataType="currency" headerAlign="center" align="right">服务金额</div>
				            <div field="price" width="70" headerAlign="center" dataType="currency" align="right">开票单价</div>
				            <div field="num" width="60" headerAlign="center" align="right" align="right">开票数量</div>
				            <div field="unit" width="55" headerAlign="center" renderer="onUnitSALERenderer">开票单位</div>
				            <div field="money" width="112" headerAlign="center" dataType="currency" align="right">服务开票金额(含税)</div>
				             <div field="tax" width="80" headerAlign="center" dataType="currency" align="right">税金
				            	<input property="editor" class="nui-spinner" style="width: 100%;" format="n2" allowLimitValue="false"
								changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"/>
				            </div>
				            <div field="u8xse" width="90" headerAlign="center" dataType="currency" align="right">销售额(不含税)
				            	<input property="editor" class="nui-spinner" style="width: 100%;" format="n2" allowLimitValue="false"
								changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"/>
				            </div>
				            <div field="taxrate" width="60" headerAlign="center" dataType="currency" align="right">税率
				            	<input property="editor" class="nui-spinner" style="width: 100%;" format="n2" allowLimitValue="false"
								changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"/>
				            </div>
				            <div field="status" width="0" headerAlign="center" align="left" renderer="onBillStatusRenderer" >状态
				            	<input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="MIS_BILLSTATUS"/>
				            </div>
				            <div field="miemo" width="auto" headerAlign="center">开票特殊要求
				            	<input property="editor" class="nui-textarea" style="width:100%;" readOnly="readOnly"/>
				            </div>
				            <div field="rdmiemo" width="auto" headerAlign="center" >发票右下角备注
				            	<input property="editor" class="nui-textarea" style="width:100%;" readOnly="readOnly"/>
				            </div>
				        </div>    
				    </div>
	            </div>
	            <div style="width: 800px;height: 25px;margin-left: 75px;float:left;">
					<table style="table-layout:fixed;font-weight: bold;" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<!-- 服务金额 -->
							<td align="right" style="width: 50px;"></td>
							<td id="servMonTotal" style="width: 100px;" align="right" ></td>
							<!-- 开票单价 -->
							<td id="servPriceTotal" style="width: 100px;display: none;" align="right" ></td>
							<!-- 开票数量 -->
							<td id="servNumTotal" style="width: 133px;" align="right" ></td>
							<!-- 产品开票金额 -->
							<td id="servMoneyTotal" style="width: 150px;" align="right" ></td>
							<!-- 产品税金金额 -->
							<td id="servTaxTotal" style="width: 80px;" align="right" ></td>
							<!-- 产品销售金额 -->
							<td id="servU8xseTotal" style="width: 105px;" align="right" ></td>
						</tr>
					</table>
				</div>
	        </fieldset>
        
	        <!-- 提供开票基本信息输入（开票单位、开票类型、开票账户信息、预计到款时间，发票邮寄信息） -->
	        <fieldset style="border:solid 1px #aaa;padding:3px;width: 98%;">
	        	<legend id="billTitle">开票信息</legend>
				<div style="padding:5px;">
					<input name="csNewbill.appname" id="appname" class="nui-hidden"/>
					<input name="csNewbill.fileids" id="fileids1" class="nui-hidden"/>
					<input name="misCustinfo.custid" id="miscustinfoCustid" class="nui-hidden"/>
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
							<td style="width: 200px" colspan="3">
								<input name="misCustinfo.accoutname" id="miscustinfoAccoutname" class="nui-textbox" style="width: 200px" required="true"/>
							</td>
						</tr>
						<tr>
		                	<td align="right" style="width:130px">发票类型：</td>
							<td id="billtype" style="width: 100px"></td>
							<td align="right" style="width:100px">税号：</td>
							<td style="width: 200px" colspan="3">
								<input name="misCustinfo.taxnumb" id="miscustinfoTaxnumb" class="nui-textbox" style="width: 200px" required="true"/>
							</td>
		                </tr>
						<tr id="temp1" >
							<td align="right" style="width:100px">账号：</td>
							<td style="width: 200px">
								<input name="misCustinfo.accountid" id="miscustinfoAccountid" class="nui-textbox" style="width: 200px" required="true"/>
							</td>
							<td align="right" style="width:100px">开户银行：</td>
							<td style="width: 300px" colspan="3">
								<input name="misCustinfo.accoutbank" id="miscustinfoAccoutbank" class="nui-textbox" style="width: 300px" required="true"/>
							</td>
						</tr>
						<tr id="temp2" >
							<td align="right" style="width:100px">开票单位电话：</td>
							<td style="width: 200px">
								<input name="misCustinfo.telephone" id="miscustinfoTelephone" class="nui-textbox" style="width: 200px" required="true"/>
							</td>
							<td align="right" style="width:100px">开票单位地址：</td>
							<td style="width: 300px" colspan="3">
								<input name="misCustinfo.address" id="miscustinfoAddress" class="nui-textbox" style="width: 300px" required="true"/>
							</td>
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
							<td align="right" style="width:100px">拒绝开票：</td>
							<td style="width: 200px" >
								<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="cannotOpen" onvaluechanged="change"></a>
							</td>
							<td align="right" style="width:100px" >开票日期：</td>
							<td>
								<input name="csNewbill.billdate" id="billdate" class="nui-datepicker" style="width: 100px" required="true" />
							</td>
						</tr>
					</table>
				</div>
	        </fieldset>
	        	
	        <fieldset style="border:solid 1px #aaa;padding:3px;width: 98%;" id="fp">
	        	<legend id="ticketTitle">发票信息</legend>
	        	<div style="width:100%;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                    	<a class="nui-button" iconCls="icon-add" onclick="addRow('ticket')">增加</a>
			                    	<a class="nui-button" iconCls="icon-remove" onclick="removeRow('ticket')">删除</a>
			                    	<%--<a class="nui-button" id="addBtnFinance" iconCls="icon-add" onclick="addDoneSureBill">新增收入确认票</a>--%>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
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
				            <div field="billtype1" width="70" headerAlign="center" align="left" renderer="onBillTypeRenderer">开票来源</div>
				            <div field="status" width="100" headerAlign="center" align="left" renderer="onStatusRenderer" >发票状态
				            	<!-- <input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="CS_BILLSTATUS"/> -->
				            </div>
				            <div field="money" width="100" headerAlign="center" dataType="currency" align="right">发票金额(含税)
				            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
				            </div>
				            <div field="tax" width="100" headerAlign="center" dataType="currency" align="right">税金
				            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
				            </div>
				            <div field="u8xse" width="100" headerAlign="center" dataType="currency" align="right">销售额(不含税)
				            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
				            </div>
				            <div field="taxrate" width="100" headerAlign="center" dataType="currency" align="right">税率
				            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
				            </div>
				            <div field="billno" width="auto" headerAlign="center" align="left" align="right">票号
				            	<input property="editor" class="nui-textbox" style="width:100%;" />
				            </div>
				            <div field="ticketdate" width="100" headerAlign="center" align="left" align="right" dateFormat="yyyy-MM-dd">发票日期
				            	<input property="editor" class="nui-datepicker" style="width:100%;" />
				            </div>
				            <div field="czticketid" width="0" headerAlign="center" >CZTICKETID</div>
				            <div field="action" width="90" headerAlign="center" renderer="onActionRenderer" cellStyle="padding:0;" >操作</div>
				        </div>    
				    </div>
	            </div>
	            <div style="width: 200px;height: 25px;margin-left: 165px;float:left;">
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
		<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
			<legend>开票附件</legend>
			<jsp:include page="/ame_common/detailAndDelFile.jsp"/>
			<jsp:include page="/ame_common/addFiles1.jsp"/>
		</fieldset>
		<!-- 审核意见  -->
		<jsp:include page="/ame_common/misOpinion.jsp"/>
		<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
			<legend>审核意见附件</legend>
			<jsp:include page="/ame_common/addFiles.jsp"/>
		</fieldset>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" style="width: 60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width: 60px;" id="canelButton">关闭</a>
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
		            <div field="conProId" width="0" headerAlign="center" >conProId</div>
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
		        	<div field="contsaleid" width="0" headerAlign="center" >contsaleid</div> 
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
	        <div class="nui-toolbar" style="text-align:center;width: 762px;height: 30px;">
		        <a class="nui-button" onclick="sureChooise('1')" style="">确定</a>
		        <a class="nui-button" onclick="hideWindow('1')" style="margin-left: 20px">关闭</a>
		    </div>
        </div>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form_cont = new nui.Form("form_cont");
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	//合同收款
	var csGatherFcGrid = nui.get("csGatherFcGrid");
	//开票服务详细信息
	var serv_grid = nui.get("serv_grid");
	//开票产品详细信息
	var prod_grid = nui.get("prod_grid");
	//发票信息
	var ticket_grid = nui.get("ticket_grid");
	//发票行数
	var ticketSumRows = 0;
	//要选择的开票产品详细信息
	var prod_grid_chooise = nui.get("prod_grid_chooise");
	//要选择的开票服务详细信息
	var serv_grid_chooise = nui.get("serv_grid_chooise");
	//文件路径
	var ContextPath= '<%=request.getContextPath() %>' 

	init();
	function init(){
		var json={"workItemID": <%=workItemID %>,"iden": "financeCheck"};
		nui.ajax({
			url:"com.primeton.eos.ame_income.gatherFcBillingProcess.getGatherFcBillingProcess.biz.ext",
			data: json,
			type:"post",
			contentType:"text/json",
			success:function(data){
				data = nui.clone(data);
				//加载附件设置参数
	    		nui.get("grid_0").load({"groupid":"csNewbill","relationid": data.csNewbill.billid});
				nui.get("billid").setValue(data.csNewbill.billid);
				//审核意见流程实例ID
				nui.get("processinstid").setValue(data.csNewbill.processinstid);
				nui.get("workitemid").setValue(<%=workItemID %>);
				//开票流程实例ID
				nui.get("csNewbillProcessinstid").setValue(data.csNewbill.processinstid);
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
				if(data.csNewbill.billtype == "1"){
					document.getElementById("temp1").style.display = "none";
					document.getElementById("temp2").style.display = "none";
					
					//税号
					nui.get("miscustinfoTaxnumb").setValue(data.csNewbill.taxnumb);
					nui.get("miscustinfoCustid").setValue(data.csNewbill.csContract.misCustinfo.custid);
					document.getElementById("custname").innerHTML = data.csNewbill.csContract.misCustinfo.custname == null ? "" : data.csNewbill.csContract.misCustinfo.custname;
					//开票单位
					nui.get("miscustinfoAccoutname").setValue(data.csNewbill.accoutname);
				}else if(data.csNewbill.billtype == "2"){
    				nui.get("miscustinfoCustid").setValue(data.csNewbill.csContract.misCustinfo.custid);
    				document.getElementById("custname").innerHTML = data.csNewbill.csContract.misCustinfo.custname == null ? "" : data.csNewbill.csContract.misCustinfo.custname;
    				//开票单位
    				nui.get("miscustinfoAccoutname").setValue(data.csNewbill.accoutname);
    				//开户银行
    				nui.get("miscustinfoAccoutbank").setValue(data.csNewbill.accoutbank);
    				//税号
    				nui.get("miscustinfoTaxnumb").setValue(data.csNewbill.taxnumb);
    				//账号
    				nui.get("miscustinfoAccountid").setValue(data.csNewbill.accountid);
    				//地址
    				nui.get("miscustinfoAddress").setValue(data.csNewbill.address);
    				//电话
    				nui.get("miscustinfoTelephone").setValue(data.csNewbill.telephone);
				}
				//合同收款记录
				csGatherFcGrid.load({"csGatherFc": {"contnum": data.csNewbill.csContract.contnum,"billprocinstid": data.csNewbill.processinstid,"iden": "CommerceCheck"}}
				,function(){
					//收款类型
	    			var sktype = "";
					csGatherFcGrid.selectAll(false);
	        		var rows = csGatherFcGrid.getSelecteds();
					for(var i = 0;i < rows.length;i ++){
						if(rows[i].billprocinstid != data.csNewbill.processinstid){
							csGatherFcGrid.deselect(rows[i]);
						}
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
					//开票日期
					if(data.csNewbill.billdate){
						nui.get("billdate").setValue(data.csNewbill.billdate);
					}else{
						var myDate = new Date();    
	 					myDate.toLocaleDateString();
						nui.get("billdate").setValue(myDate);
					}
			    				
					//发票邮寄地址
	                document.getElementById("mailingaddress").innerHTML = data.csNewbill.mailingaddress == null ? "" : data.csNewbill.mailingaddress;
	                //发票邮寄联系人
	                document.getElementById("mailinglinkman").innerHTML = data.csNewbill.mailinglinkman == null ? "" : data.csNewbill.mailinglinkman;
	                //发票邮寄电话
	                document.getElementById("mailinglinktel").innerHTML = data.csNewbill.mailinglinktel == null ? "" : data.csNewbill.mailinglinktel;
					
					//判断开票类型
					if(data.csNewbill.billtype == "1"){	//增值税普通
						document.getElementById("temp1").style.display = "none";
						document.getElementById("temp2").style.display = "none";
						
					}else{	//增值税专用
						document.getElementById("custname").innerHTML = data.csNewbill.csContract.misCustinfo.custname == null ? "" : data.csNewbill.csContract.misCustinfo.custname;
	    				//开票单位
	    				nui.get("miscustinfoAccoutname").setValue(data.csNewbill.accoutname);
	    				//开户银行
	    				nui.get("miscustinfoAccoutbank").setValue(data.csNewbill.accoutbank);
	    				//税号
	    				nui.get("miscustinfoTaxnumb").setValue(data.csNewbill.taxnumb);
	    				//账号
	    				nui.get("miscustinfoAccountid").setValue(data.csNewbill.accountid);
	    				//地址
	    				nui.get("miscustinfoAddress").setValue(data.csNewbill.address);
	    				//电话
	    				nui.get("miscustinfoTelephone").setValue(data.csNewbill.telephone);
					}
    				ticket_grid.setData(data.csTickets);
    				ticketSumRows = ticket_grid.getData().length;
				});
	    				
				//流程回退路径赋值 
                nui.get("backTo").setData(data.csNewbill.backList);
                //审核结果设置
				var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
				nui.get("auditstatus").setData(dataStatus);
				nui.get("auditstatus").setValue("1");
				nui.get("auditopinion").setValue("同意。");
                //查询审核意见
                var processinstid = data.csNewbill.processinstid;
				var grid = nui.get("datagrid1");
				grid.sortBy("time", "desc");
				grid.load({"processInstID": processinstid});
			},
			error:function(jqXHR, textStatus, errorThrown){
				nui.alert("error:" + jqXHR.responseText);
			}
		});
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
		
	prod_grid.on("drawcell", function (e) {
        var record = e.record,
        column = e.column,
        field = e.field,
        value = e.value;
        //增加背景色
        if (field == "tax" || field == "u8xse" || field == "taxrate" || field == "status") {
            e.cellStyle = "background: #FFFD75";//cyan
        }
    });
        
    serv_grid.on("drawcell", function (e) {
        var record = e.record,
        column = e.column,
        field = e.field,
        value = e.value;
        //增加背景色
        if (field == "tax" || field == "u8xse" || field == "taxrate" || field == "status") {
            e.cellStyle = "background: #FFFD75";//cyan
        }
    });
		
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
		var prodTaxSum = 0;
		var prodU8xseSum = 0;
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
				if(rows1[i].tax){
					prodTaxSum += parseFloat(rows1[i].tax);
				}
				if(rows1[i].u8xse){
					prodU8xseSum += parseFloat(rows1[i].u8xse);
				}
			}
		}
		//产品金额
		document.getElementById("prodmonTotal").innerHTML = nui.formatNumber(prodmonSum,'#,##.##');
		//开票单价
		document.getElementById("prodPriceTotal").innerHTML = nui.formatNumber(prodPriceSum,'#,##.##');
		//开票数量
		document.getElementById("prodNumTotal").innerHTML = parseFloat(prodNumSum).toFixed(0);
		//产品开票金额
		document.getElementById("prodMoneyTotal").innerHTML = nui.formatNumber(prodMoneySum,'#,##.##');
		document.getElementById("prodTaxTotal").innerHTML = nui.formatNumber(prodTaxSum,'#,##.##');
		document.getElementById("prodU8xseTotal").innerHTML = nui.formatNumber(prodU8xseSum,'#,##.##');
		document.getElementById("billprodmon").innerHTML = nui.formatNumber(prodMoneySum.toFixed(2),'#,##.##');
		document.getElementById("billsummon").innerHTML = nui.formatNumber(document.getElementById("billservmon").innerHTML + prodMoneySum,'#,##.##');
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
		var servTaxSum = 0;
		var servU8xseSum = 0;
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
				if(rows2[i].tax){
					servTaxSum += parseFloat(rows2[i].tax);
				}
				if(rows2[i].u8xse){
					servU8xseSum += parseFloat(rows2[i].u8xse);
				}
			}
		}
		//服务金额
		document.getElementById("servMonTotal").innerHTML = nui.formatNumber(servmonSum,'#,##.##');
		//服务开票单价
		document.getElementById("servPriceTotal").innerHTML = nui.formatNumber(servPriceSum,'#,##.##');
		//服务开票数量
		document.getElementById("servNumTotal").innerHTML = parseFloat(servNumSum).toFixed(0);
		//开票服务金额
		document.getElementById("servMoneyTotal").innerHTML = nui.formatNumber(servMoneySum,'#,##.##');
		document.getElementById("servTaxTotal").innerHTML = nui.formatNumber(servTaxSum,'#,##.##');
		document.getElementById("servU8xseTotal").innerHTML = nui.formatNumber(servU8xseSum,'#,##.##');
		document.getElementById("billservmon").innerHTML = nui.formatNumber(servMoneySum.toFixed(2),'#,##.##');
		document.getElementById("billsummon").innerHTML = nui.formatNumber(document.getElementById("billprodmon").innerHTML + servMoneySum,'#,##.##');
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
	
    function doCal(e){
		var rows1 = prod_grid.getSelecteds();
		if(rows1){
			for(var i = 0;i < rows1.length;i ++){
				var num = 0;
				var price = 0;
				if(rows1[i].num){
					num = rows1[i].num;
				}
				if(rows1[i].price){
					price = rows1[i].price;
				}
				var money = (parseFloat(num) * parseFloat(price)).toFixed(2);
				var rowData = {money: money};
				prod_grid.updateRow(rows1[i],rowData);
				var taxrate = rows1[i].taxrate;
				if(taxrate == 0 || taxrate=="" || taxrate == null){
					var rowData = {taxrate: parseFloat(nui.getDictText('AME_SYSCONF','PRODUCTRATE'))};
					prod_grid.updateRow(rows1[i],rowData);
				}
				taxrate = parseFloat(rows1[i].taxrate);
				var u8xse = money/(1+taxrate);
				var tax = money - u8xse;
				var rowData = {u8xse:u8xse,tax:tax};
				prod_grid.updateRow(rows1[i],rowData);
			}
			prodGridOnselect();
		}
		var rows2 = serv_grid.getSelecteds();
		if(rows2){
			for(var i = 0;i < rows2.length;i ++){
				var num = 0;
				var price = 0;
				if(rows2[i].num){
					num = rows2[i].num;
				}
				if(rows2[i].price){
					price = rows2[i].price;
				}
				var money = (parseFloat(num) * parseFloat(price)).toFixed(2);
				var rowData = {money: money};
				serv_grid.updateRow(rows2[i],rowData);
				var taxrate = rows2[i].taxrate;
				if(taxrate == 0 || taxrate=="" || taxrate == null){
					var rowData = {taxrate: parseFloat(nui.getDictText('AME_SYSCONF','SERVICERATE'))};
					serv_grid.updateRow(rows2[i],rowData);
				}
				var taxrate = parseFloat(rows2[i].taxrate);
				var u8xse = money/(1+taxrate);
				var tax = money - u8xse;
				var rowData = {u8xse:u8xse,tax:tax};
				serv_grid.updateRow(rows2[i],rowData);
			}
			servGridOnselect();
		}
		var datas1 = prod_grid.getSelecteds();
		var datas = serv_grid.getSelecteds();
		var summoney = 0;
		var prodmoney = 0;
		var servmoney = 0;
		for(var i = 0;i < datas1.length;i ++){
			var prodmon = datas1[i].money;
			if(prodmon){
				if(!isNaN(prodmon)){
					prodmoney += parseFloat(prodmon);
				}
			}
		}
		for(var i = 0;i < datas.length;i ++){
			var servmon = datas[i].money;
			if(servmon){
				if(!isNaN(servmon)){
					servmoney += parseFloat(servmon);
				}
			}
		}
		summoney = parseFloat(prodmoney) + parseFloat(servmoney);
		document.getElementById("billprodmon").innerHTML =nui.formatNumber( prodmoney.toFixed(2),'#,##.##');
		document.getElementById("billservmon").innerHTML = nui.formatNumber(servmoney.toFixed(2),'#,##.##');
		document.getElementById("billsummon").innerHTML = nui.formatNumber(summoney.toFixed(2),'#,##.##');
	}
		
	//新增行
	function addRow(e){
		var myDate = new Date(); 
    	//开票日期
 		myDate.toLocaleDateString();
		if(e == "ticket"){
			var newRow = { name: "New Row",
				status: 0,
				ticketdate:myDate,
				billtype1:1
			};
			var rowIndex = ticketSumRows + 1;
			ticketSumRows = rowIndex;
    		ticket_grid.addRow(newRow, rowIndex);
		}
	}
		
	//删除行
	function removeRow(e){
		if(e == "ticket"){
			var rows = ticket_grid.getSelecteds();
			if(rows.length > 0){
				for(var i = 0;i < rows.length;i ++){
					if(rows[i].ticketid){
						nui.alert("原发票不允许删除！");
						return;
					}
				}
				ticket_grid.removeRows(rows,false);
				ticketSumRows = ticketSumRows - rows.length;
			}else{
				nui.alert("请至少选择一行！");
			}
		}
	}
		
	ticket_grid.on("drawcell", function (e) {
        var record = e.record,
        column = e.column,
        field = e.field,
        value = e.value;
    });
		
	//冲正操作
    function onActionRenderer(e) {
        var grid = e.sender;
        var record = e.record;
        var uid = record._uid;
        var rowIndex = e.rowIndex;
        var s = null;
        if(record.status == "1" && record.ticketid != null){
            s = '<a class="Edit_Button" style="padding-left: 10px;" href="javascript: editRow(\'' + uid + '\')" >冲正</a>'+
                '<a class="Edit_Button" style="padding-left: 20px;" href="javascript: editRow_zf(\'' + uid + '\')" >作废</a>'  ;
        }else if(record.status != "1" && record.ticketid == null && 
        	(record.conProIds == null || record.conProIds == "") && 
        	(record.contsaleids == null || record.contsaleids == "")){
        	s = '<a class="Edit_Button" style="padding-left: 20px;" href="javascript: chooiseBill(\'' + uid + '\')">关联</a>';
        }else if(record.status != "1" && (record.ticketid == null || record.ticketid == "") && 
        			(record.conProIds != null || record.contsaleids != null) && 
        			(record.czticketid == null || record.czticketid == "")){
        	s = '<a class="Edit_Button" style="padding-left: 13px;" href="javascript: chooiseBill(\'' + uid + '\')">已关联</a>';
        }else if(record.status != "1" && (record.ticketid == null || record.ticketid == "") && 
        			(record.conProIds != null || record.contsaleids != null) && record.czticketid != null){
        	s = '<span style="padding-left: 13px">已冲正</span>';
        }
        /* if((record.status == "1" || record.ticketid != null) && (record.conProIds != null || record.contsaleids != null)){
            s = '已冲正' ;
        } */
        return s;
    }
        
    //冲正操作
    function editRow(row_uid) {
    	var row = ticket_grid.getRowByUID(row_uid);
        var myDate = new Date(); 
    	//开票日期
		if(row.ticketdate){
			myDate = row.ticketdate;
		}else{ 
 			myDate.toLocaleDateString();
		}
    	var newRow = {};
    	if(row.type == "0"){
    		newRow = { name: "New Row",
				status: 3,
				type: row.type,
				money: 0-row.money,
				ticketdate:myDate,
				czticketid: row.ticketid,
				conProIds: row.billsubid,
				billtype1:1
			};
    	}
    	if(row.type == "1"){
        	newRow = { name: "New Row",
				status: 3,
				type: row.type,
				money: 0-row.money,
				ticketdate:myDate,
				czticketid: row.ticketid,
				contsaleids: row.billsubid,
				billtype1:1
			};
    	}
		var rowIndex = ticketSumRows + 1;
		ticketSumRows = rowIndex;
		ticket_grid.addRow(newRow, rowIndex);
		var rowData = {status: "4"};
		ticket_grid.updateRow(row,rowData);
    }
        
    //作废操作
    function editRow_zf(row_uid) {
    	var row = ticket_grid.getRowByUID(row_uid);
		var rowData = {status: "5"};
		ticket_grid.updateRow(row,rowData);
    }
        
    //选择开票产品或开票服务，操作时，必须先选择发票类型。
    var chooiseTicketGridRow = "";
    function chooiseBill(row_uid){
    	var row = ticket_grid.getRowByUID(row_uid);
    	chooiseTicketGridRow = row;
    	if(row.type){
    		if(row.type=="0"){
        		//row.type=="0"产品票
        		showAtPos("0",row.conProIds,row.contsaleids);
    		}else if(row.type=="1"){
        		//row.type=="1"服务票
    			showAtPos("1",row.conProIds,row.contsaleids);
    		}
    	}else{
    		nui.alert("请选择发票类型！");
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
        	var sumall = 0;
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
	    
	function onOk(e){
		//审核结果 0-退回，1-通过，2-终止
		var auditstatus = nui.get("auditstatus").getValue();
		if(auditstatus == "2"){	//终止流程
        	nui.confirm("确定终止流程吗？", "操作提示",
	            function (action) {            
	                if (action == "ok") {
	                	nui.get("sureButton").setEnabled(false);
	                	document.getElementById("fileCatalog").value="csNewbill";
						form2.submit();
					}else{
						return;
					}
				}
			);
    	}else{
    		//发票票号
    		var csTickets = ticket_grid.getSelecteds();
    		for (var i = 0;i < csTickets.length;i++){
				var billno = csTickets[i].billno;
				if(billno == null || billno == ""){
					nui.alert("勾选的发票票号不能为空！");
					return;
				}
				var ticketid  = csTickets[i].ticketid;
				var status = csTickets[i].status;
				var conProIds = csTickets[i].conProIds;
				var contsaleids = csTickets[i].contsaleids;
				if((ticketid == null || ticketid == "") && status == "0" && ((conProIds == null || conProIds =="") && (contsaleids == null || contsaleids == ""))){
					nui.alert("勾选的新增发票信息需要关联开票服务详细信息或开票产品详细信息！");
					return;
				}
			}
    		
    		//是否需要开收入确认票
    		var cannotOpen = nui.get("cannotOpen").getValue();
    		var massage = "";
    		if(cannotOpen != "true"){
        		var sum = document.getElementById("ticketMoneyTotal").innerHTML;
				var billsummon = document.getElementById("billsummon").innerHTML;
				if(sum != billsummon){
					massage+="未勾选<拒绝开票>，提交后请开一张收入确认票！"
				}
    		}
    	
			//开票附件
			var filePaths1 = document.getElementsByName("uploadfile1").length;
        	for(var j = 0;j < filePaths1;j++){
        		var a = document.getElementsByName("remarkList1")[j].value;
        		if(a == null || a == ""){
        			nui.alert("开票的新增附件不可以为空！");
        			return false;
        		}
        	}
        	//审核意见附件
			var filePaths = document.getElementsByName("uploadfile").length;
        	for(var j = 0;j < filePaths;j++){
        		var a = document.getElementsByName("remarkList")[j].value;
        		if(a == null || a == ""){
        			nui.alert("审核意见的新增附件不可以为空！");
        			return false;
        		}
        	}
        	var titleName = "";
			if(auditstatus == "1"){
				if(nui.get("cannotOpen").getValue() == "false"){
					if(!form_cont.validate()){
			    		if(!nui.get("billdate").getValue()){
							nui.alert("开票日期不能为空！");
						}
						return;
					}
				}else{
					nui.get("billdate").setRequired(false);
				}
				//提交流程
	    		titleName = massage+"确定提交流程吗？";
			}else if(auditstatus == "0"){
				//退回流程
	    		titleName = "确定退回流程吗？";
	    		if(!nui.get("backTo").getValue()){
	    			nui.alert("审核结果为退回，请选择回退到的环节！");
	    			return false;
	    		}
			}
			nui.confirm(titleName, "操作提示",
	            function (action) {            
	                if (action == "ok") {
	                	nui.get("sureButton").setEnabled(false);
	                	document.getElementById("fileCatalog1").value="csNewbill";
						form4.submit();
					}else{
						return;
					}
				}
			);
    	}
    }
        
    function SaveData1(){
    	document.getElementById("fileCatalog").value="MIS_OPINION";
        form2.submit();
	}
    	
	function SaveData(){
		var auditstatus = nui.get("auditstatus").getValue();
		if(auditstatus == "1"){		//提交流程
			if(nui.get("cannotOpen").getValue() == "false"){
				if(!form_cont.validate()){
		    		if(!nui.get("billdate").getValue()){
						nui.alert("开票日期不能为空！");
					}
					return;
				}
			}else{
				nui.get("billdate").setRequired(false);
			}
		}
		processFinanceCheck();
	}
        
    function processFinanceCheck(){
    	var json = form_cont.getData();
    	//工作项ID
    	var workItemID = nui.get("workItemID").getValue();
    	json.workItemID = workItemID;
    	//处理信息
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		//开不了票标识
		var cannotOpen = nui.get("cannotOpen").getValue();
		json.csNewbill.cannotOpen = cannotOpen;
		//收款信息，需要将收款状态为“未开票（未收款）”修改为“已开票（未收款）”，“未开票（已收款）”修改为“已开票（已收款）”。
		var csGatherFcs = csGatherFcGrid.getData();
		json.csGatherFcs = csGatherFcs;
		//发票信息
		var csTickets = ticket_grid.getSelecteds();
		json.csTickets = csTickets;
		//开票产品详细信息
		var prodRows = prod_grid.getSelecteds();
		json.csBillProds = prodRows; 
		//开票服务详细信息
		var servRows = serv_grid.getSelecteds();
		json.csBillSales = servRows;
		//开票税金和销售额
		var rows_prod = prod_grid.getSelecteds();
    	var rows_sale = serv_grid.getSelecteds();
    	var u8xse = 0; 
    	var tax = 0;
    	for (var i = 0; i < rows_prod.length ; i++){
    		tax += parseFloat(rows_prod[i].tax);
    		u8xse += parseFloat(rows_prod[i].u8xse);
    	}
    	for (var i = 0; i < rows_sale.length ; i++){
    		tax += parseFloat(rows_sale[i].tax);
    		u8xse += parseFloat(rows_sale[i].u8xse);
    	}
    	json.csNewbill.tax = tax ;
    	json.csNewbill.u8xse = u8xse ;
    	json.billtype = document.getElementById("billtype").innerHTML;
    	nui.ajax({
			url:"com.primeton.eos.ame_income.gatherFcBillingProcess.gatherFcBillingProcessFinanceCheck.biz.ext",
			data: json,
			type:"post",
			contentType:"text/json",
			success:function(o){
				o = nui.clone(o);
				if(o.exception == null){
					nui.alert("提交成功！","操作提示",function(){
						CloseWindow("ok");
					});
				}else{
					nui.alert("提交失败！");
					nui.get("sureButton").setEnabled(true);
				}
			},
			error:function(jqXHR, textStatus, errorThrown){
				nui.alert("error:" + jqXHR.responseText);
			}
		});
    }
        
    //取消
    function onCancel(e) {
        var data = form_cont.getData();
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
		
	//新增收入确认票
	function addDoneSureBill(){
		nui.open({url: "<%=request.getContextPath() %>/ame_income/gatherFcBilling/doneSureBillAdd.jsp",
	        title: "新增收入确认票", width: 1000, height: 500,
	        onload: function () {
	            var iframe = this.getIFrameEl();
	            var data = { "doneSureBill": {"contractid": nui.get("contractid").getValue()}};
	            iframe.contentWindow.SetData(data);
	        },
	        ondestroy: function (action) {
	        	if(action == "ok"){
	                nui.alert("收入确认票新增成功！");
	                var json={"workItemID": <%=workItemID %>,"iden": "financeCheck"};
					nui.ajax({
			    			url:"com.primeton.eos.ame_income.gatherFcBillingProcess.getGatherFcBillingProcess.biz.ext",
			    			data: json,
			    			type:"post",
			    			contentType:"text/json",
			    			success:function(data){
			    				ticket_grid.setData(data.csTickets);
	    						ticketSumRows = ticket_grid.getData().length;
			    			}
		    			})
	            	}
	            }
	        });
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
					taxrate = parseFloat(nui.getDictText('AME_SYSCONF','PRODUCTRATE'));
				}else if (type=="1"){
					taxrate = parseFloat(nui.getDictText('AME_SYSCONF','SERVICERATE'));
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
		
		//拒绝开票操作
        function change(){
        	var cannotOpen = nui.get("cannotOpen").getValue();
        	var auditstatus = nui.get("auditstatus").getValue();
        	var billdate = nui.get("billdate").getValue();
        	if(cannotOpen == "true") {
        		var dataStatus=[{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"}];
				nui.get("auditstatus").setData(dataStatus);
				if(auditstatus != 2){
					nui.get("auditstatus").setValue(auditstatus);
				}else{
					nui.get("auditstatus").setValue(1);
				}
				nui.get("auditopinion").setValue("拒绝开票。");
				nui.get("billdate").setValue(null);
				nui.get("billdate").setRequired(false);
        	}else {
        		var dataStatus=[{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
				nui.get("auditstatus").setData(dataStatus);
				nui.get("auditstatus").setValue(auditstatus);
				nui.get("auditopinion").setValue("同意。");
				nui.get("billdate").setRequired(true);
				if(billdate){
					nui.get("billdate").setValue(billdate);
				}else{
					var myDate = new Date();    
 					myDate.toLocaleDateString();
					nui.get("billdate").setValue(myDate);
				}
        	}
        } 
</script>
<script src="<%= request.getContextPath() %>/ame_income/gatherFcBillingProcess/js/gatherFcBillingjs.js" type="text/javascript"></script>
</html>