<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): 朱勇伦
  - Date: 2016-12-19 20:17:11
  - Description:
-->
<head>
	<title>开票申请</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<!-- 
	select * from CS_CONTRACT where CONTNUM='2017-L006';--76419
	select * from CS_CONTRACT_PRODUCT where CONTRACTID=76419;
	select * from CS_CONTRACTSALE where CONTRACTID=76419;
	select * from CS_BILL_PROD;
	select * from CS_BILL_SALE;
	select * from CS_NEWBILL where BILLID=5724;
	select * from CS_BILL_GATHER where BILLID=5724;
	由销售或助理发起（通过查询选择合同收款记录）
	操作界面显示选择合同的所有合同收款记录，可以选择1条或多条状态为未收款（未开票）的收款记录，开票金额自动统计，
	提供开票基本信息输入（开票单位、开票类型、开票账户信息、预计到款时间，发票邮寄信息）
	服务：2016-S032，产品+服务：2015-L021 
	恒大人寿保险有限公司：有户名、开户银行、账号、地址、电话信息，销售是 1237：蒋云平
	2016-L211 产品，服务类型
	2016-L262 2016-L196 2016-L231 多销售
	2016-S035 产品+服务类型
	2016-L164 2016-L173 2016-L200 2016-L251 多个产品+多个服务 单销售
	2016-S221 服务，产品+服务
	2017-L006
	
	 -->
	<div class="nui-fit">
		<div class="nui-panel" title="发起合同收款开票流程" style="width: auto">
			<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
			<form id="form_cont" method="post">
				<input name="csContract.contractid" id="contractid" class="nui-hidden"/>
				<fieldset style="border:solid 1px #aaa;padding:3px;">
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
	        
				<fieldset style="border:solid 1px #aaa;padding:3px;">
		            <legend>合同收款记录列表</legend>
	            	<div id="csGatherFcGrid" class="nui-datagrid" style="width: 100%;height:auto;" allowResize="true" 
	            		dataField="csGatherFcs" showSummaryRow="true" ondrawsummarycell="doCsGatherFcSum" showPager="false" 
				    	url="com.primeton.eos.ame_income.gatherFcBillingProcess.getCsGahterFcList.biz.ext" multiSelect="true"
				    	onselectionchanged="chooiseGatherFc" allowUnselect="true">
						<div property="columns">
							<div type="checkcolumn" width="25"></div>
							<div field="gatherno" width="60" align="center" headerAlign="center">收款次数</div>
							<div field="status" width="60" align="center" headerAlign="center" renderer="dictstatus">收款状态</div>
							<div field="billstatus" width="60" align="center" headerAlign="center" renderer="dictstatusbill">开票状态</div>
							<div field="gathertype" width="70" align="center" headerAlign="center" renderer="dictGatherFcType">收款类型</div>	
							<div field="newyearmonth" width="80" align="center"  headerAlign="center">预计收款年月</div>
							<div field="fcsum" width="130" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收款金额（含税）</div>	
							<div field="productsum" width="150" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收款产品金额（含税）</div>
							<div field="servicesum" width="150" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收款服务金额（含税）</div>
							<div field="fcreverate" width="80" align="center" headerAlign="center" numberFormat="p1">预计确认比例</div>	
							<div field="actsum" width="130" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">已收款金额</div>	
							<div field="confirmday" width="auto" align="center" headerAlign="center">实际收款日期</div>
						</div>
					</div>
		        </fieldset>
		        
		        <fieldset style="border:solid 1px #aaa;padding:3px;display: none" id="kpcpxxxx">
		            <legend>开票产品详细信息</legend>
		            <div style="color: #FF5254;font-weight: bold;">产品开票金额不可填写，会根据开票单价和开票数量自动算出。</div>
		            <div style="padding:5px;">
			        	<div id="prod_grid" class="nui-datagrid" style="width: 1050px;height:auto;" allowResize="true" 
			        	showPager="false" oncellendedit="doCal" onselect="prodGridOnselect" ondeselect="prodGridOnselect" 
			        	allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" 
			        	onlyCheckSelection="true">			        
					        <div property="columns">
					            <div type="checkcolumn"></div>
					            <div field="conProId" width="0" headerAlign="center" >conProId</div>
					            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
					            <div field="prod_name" width="180" headerAlign="center">产品名称</div>
					            <div field="prodmon" width="100" dataType="currency" headerAlign="center" align="right">产品金额</div>
					            <div field="price" width="100" dataType="currency" headerAlign="center" align="right">开票单价
					            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
					            </div>
					            <div field="num" width="60" headerAlign="center" align="right">开票数量
					            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n0"/>
					            </div>
					            <div field="unit" width="60" headerAlign="center" renderer="onUnitRenderer">开票单位
					            	<input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="UNIT" required="true"/>
					            </div>
					            <div field="money" width="100" dataType="currency" headerAlign="center" align="right" >产品开票金额
					            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"  readonly="readonly"/>
					            </div>
					            <div field="miemo" width="auto" headerAlign="center" >开票特殊要求
					            	<input property="editor" class="nui-textarea" style="width:100%;"/>
					            </div>
					            <div field="rdmiemo" width="auto" headerAlign="center" >发票右下角备注
					            	<input property="editor" class="nui-textarea" style="width:100%;"/>
					            </div>
					            <div field="tax" width="0" dataType="currency" headerAlign="center" align="right" visible="false">税金</div>
					            <div field="u8xse" width="0" dataType="currency" headerAlign="center" align="right" visible="false">销售额</div>
					            <div field="taxrate" width="0" dataType="currency" headerAlign="center" align="right" visible="false">税率</div>
					            
					        </div>
					    </div>
		            </div>
		            <div style="width: 580px;height: 25px;margin-left: 95px;float:left;">
						<table style="table-layout:fixed;font-weight: bold;" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="right" style="width: 180px;"></td>
								<!-- 产品金额 -->
								<td id="prodmonTotal" style="width: 100px;" align="right" ></td>
								<!-- 开票单价 -->
								<td id="prodPriceTotal" style="width: 100px;display: none;" align="right" ></td>
								<!-- 开票数量 -->
								<td id="prodNumTotal" style="width: 160px;" align="right" ></td>
								<td style="width: 60px;" align="right" ></td>
								<!-- 产品开票金额 -->
								<td id="prodMoneyTotal" style="width: 100px;" align="right" ></td>
							</tr>
						</table>
					</div>
		        </fieldset>
		        
		        <fieldset style="border:solid 1px #aaa;padding:3px;display: none" id="kpfwxxxx">
		            <legend>开票服务详细信息</legend>
		            <div style="color: #FF5254;font-weight: bold;">服务开票金额不可填写，会根据开票单价和开票数量自动算出。</div>
		            <div style="padding:5px;">
			        	<div id="serv_grid" class="nui-datagrid" style="width: 1000px;height:auto;" allowResize="false" 
			        	showPager="false" oncellendedit="doCal" onselect="servGridOnselect" ondeselect="servGridOnselect" 
			        	allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" 
			        	onlyCheckSelection="true">			        
					        <div property="columns">    
					        	<div type="checkcolumn"></div>  
					        	<div field="contsaleid" width="0" headerAlign="center" >contsaleid</div> 
					            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
					            <div field="servmon" width="100" dataType="currency" headerAlign="center" align="right">服务金额</div>
					            <div field="servname" width="100" headerAlign="center" align="left" renderer="onServRenderer">服务名称
					            	<input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="CS_SERVNAME"/>
					            </div>
					            <div field="price" width="100" headerAlign="center" dataType="currency" align="right">开票单价
					            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"/>
					            </div>
					            <div field="num" width="60" headerAlign="center" align="right" align="right">开票数量
						            <input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n0"/>
					            </div>
					            <div field="unit" width="60" headerAlign="center" renderer="onUnitSALERenderer">开票单位
					            	<input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="UNIT_SALE" required="true"/>
					            </div>
					            <div field="money" width="100" headerAlign="center" dataType="currency" align="right">服务开票金额
					            	<input property="editor" class="nui-spinner" inputStyle="text-align: right" style="width: 100%" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2"  readonly="readonly"/>
					            </div>
					            <div field="miemo" width="auto" headerAlign="center" >开票特殊要求
					            	<input property="editor" class="nui-textarea" style="width:100%;"/>
					            </div>
					            <div field="rdmiemo" width="auto" headerAlign="center" >发票右下角备注
					            	<input property="editor" class="nui-textarea" style="width:100%;"/>
					            </div>
					            <div field="tax" width="0" dataType="currency" headerAlign="center" align="right" visible="false">税金</div>
					            <div field="u8xse" width="0" dataType="currency" headerAlign="center" align="right" visible="false">销售额</div>
					            <div field="taxrate" width="0" dataType="currency" headerAlign="center" align="right" visible="false">税率</div>
					        </div>    
					    </div>
		            </div>
		            <div style="width: 500px;height: 25px;margin-left: 95px;float:left;">
						<table style="table-layout:fixed;font-weight: bold;" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<!-- 服务金额 -->
								<td id="servMonTotal" style="width: 100px;" align="right" ></td>
								<td align="right" style="width: 100px;"></td>
								<!-- 开票单价 -->
								<td id="servPriceTotal" style="width: 100px;display: none"" align="right" ></td>
								<!-- 开票数量 -->
								<td id="servNumTotal" style="width: 160px;" align="right" ></td>
								<!-- 产品开票金额 -->
								<td id="servMoneyTotal" style="width: 100px;" align="right" ></td>
							</tr>
						</table>
					</div>
		        </fieldset>
	        
		        <!-- 提供开票基本信息输入（开票单位、开票类型、开票账户信息、预计到款时间，发票邮寄信息） -->
		        <fieldset style="border:solid 1px #aaa;padding:3px;">
		        	<legend id="billTitle">开票信息</legend>
					<div style="padding:5px;">
						<input name="csNewbill.appname" id="appname" class="nui-hidden"/>
						<input name="csNewbill.fileids" id="fileids" class="nui-hidden"/>
						<table style="table-layout:fixed;" id="table_file">
							<tr>
								<td align="right" style="width:100px" nowrap="nowrap">开票产品金额：</td>
								<td style="width: 310px;">
									<!--  allowInput="false" 不允许输入 -->
									<input name="csNewbill.billprodmon" id="billprodmon" class="nui-spinner" inputStyle="text-align: right" style="width:120px" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2" readonly="readonly"/>
								</td>
								<td align="right" style="width:100px" nowrap="nowrap">开票服务金额：</td>
								<td style="width: 210px;">
									<input name="csNewbill.billservmon" id="billservmon" class="nui-spinner"inputStyle="text-align: right" style="width:120px" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2" readonly="readonly"/>
								</td>
								<td align="right" style="width:100px" nowrap="nowrap">开票金额：</td>
								<td>
									<input name="csNewbill.billsummon" id="billsummon" class="nui-spinner" inputStyle="text-align: right" style="width: 120px" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2" readonly="readonly"/>
								</td>
							</tr>
			                <tr id="temp0">
			                    <td align="left" colspan="6">
			                		<span style="color: #FF5254;font-weight: bold;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			                		如果客户名称和开票单位不一致，请在任务说明处写明相关情况，并上传变更文件！(无变更文件可不必上传)</span>
			                 	</td>
			                </tr>
							<tr>
								<td align="right" style="width:100px">客户名称：</td>
								<td>
									<input name="csNewbill.billcompid" id="custname" class="nui-buttonedit" allowInput="false" onbuttonclick="selectMisCust" style="width: 200px" required="true"/>
								</td>
								<td align="right" style="width:100px" >开票单位：</td>
								<td colspan="3">
									<input name="csNewbill.accoutname" id="accoutname" class="nui-textbox" style="width: 200px" required="true"/>
								</td>
			                </tr>
			                <tr>
			                	<td align="right" style="width:130px">发票类型：</td>
								<td  >
									<input name="csNewbill.billtype" id="billtype" class="nui-dictcombobox" dictTypeId="BILLTYPE" required="true" style="width: 100px" />
								</td>
								<td align="right" style="width:100px">税号：</td>
								<td colspan="3">
									<input name="csNewbill.taxnumb" id="taxnumb" class="nui-textbox" style="width: 200px" required="true"/>
									<span style="color: #FF5254;font-weight: bold;">请确认是最新税号</span>
								</td>
			                </tr>
							<tr id="temp1" >
								<td align="right" style="width:100px">账号：</td>
								<td>
									<input name="csNewbill.accountid" id="accountid" class="nui-textbox" style="width: 200px" required="true"/>
								</td>
								<td align="right" style="width:100px">开户银行：</td>
								<td>
									<input name="csNewbill.accoutbank" id="accoutbank" class="nui-textbox" style="width: 300px" required="true"/>
								</td>
							</tr>
							<tr id="temp2" >
								<td align="right" style="width:100px">开票单位电话：</td>
								<td>
									<input name="csNewbill.telephone" id="telephone" class="nui-textbox" style="width: 200px" required="true"/>
								</td>
								<td align="right" style="width:100px">开票单位地址：</td>
								<td>
									<input name="csNewbill.address" id="address" class="nui-textbox" style="width: 300px" required="true"/>
								</td>
							</tr>
							<tr id="temp3" >
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td align="right" style="width:100px" nowrap="nowrap">发票邮寄地址：</td>
								<td>
									<input name="csNewbill.mailingaddress" id="mailingaddress" class="nui-textbox" style="width: 300px" />
								</td>
								<td align="right" style="width:100px" nowrap="nowrap">发票邮寄联系人：</td>
								<td>
									<input name="csNewbill.mailinglinkman" id="mailinglinkman" class="nui-textbox" style="width: 100px" />
								</td>
								<td align="right" style="width:100px" nowrap="nowrap">发票邮寄电话：</td>
								<td>
									<input name="csNewbill.mailinglinktel" id="mailinglinktel" class="nui-textbox" style="width: 150px" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width:100px">确认人：</td>
								<td style="width: 200px" >
									<input name="csNewbill.suresaleid" id="suresaleid" class="nui-combobox" style="width:100px"
										textField="salename" valueField="saleid" required="true" />
								</td>
								<td></td><td></td>
								<td></td><td></td>
							</tr>
						</table>
					</div>
		        </fieldset>
		    </form>
		    
		    <fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
				<legend>开票附件</legend>
				<jsp:include page="/ame_common/addFiles.jsp"/>
			</fieldset>
			
		    <form id="opioionform" method="post">
		        <div style="padding:5px;" id="opinionHide">
		            <table style="table-layout:fixed;">
		            	<tr id="salesEdit">
		                    <td style="width:150px;" align="right">审核结果：</td>
		                    <td style="width:250px;">  
								<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
		                    </td>
		                </tr>
		                <tr>
		                    <td style="width:150px;height:auto;" align="right">任务处理说明：</td>
		                    <td colspan="3">
		                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height:60px;"/>
		                    </td>
		                </tr>
		            </table>
		        </div>
	    	</form>
		</div>
	</div>
	
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk('app')" iconCls="icon-organization" style="width:135px;margin-right:20px;" id="appButton">发起开票申请流程</a>
		<a class="nui-button" onclick="onOk('save')" iconCls="icon-save" style="width:95px;margin-right:20px;" id="saveButton">暂时保存</a>
		<a class="nui-button"onclick="onCancel" iconCls="icon-close" style="width:60px;">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	//表单
	var form_cont = new nui.Form("form_cont");
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	var csGatherFcGrid = nui.get("csGatherFcGrid");
	//开票产品详细信息
	var prod_grid = nui.get("prod_grid");
	//开票服务详细信息
	var serv_grid = nui.get("serv_grid");
    //开票确认人
    var sureNames = [];
	var contnum = '<%=request.getParameter("contnum")%>';
	//文件路径
	var ContextPath= '<%=request.getContextPath() %>' 
	<%
   		UserObject user = (UserObject) session.getAttribute("userObject");
   		String username = user.getUserName();
   		String userno = user.getUserId();
    %>
	    
	init();//页面初始化
	function init(){
		promptInit({"workItemID":0,"processDefName":"com.primeton.eos.income.GatherFcBillingConfirm","activityDefID":"manualActivity"});
		//申请人=登录人
		nui.get("appname").setValue("<%=username %>");
		//流程审批意见状态设置为3（发起），内容赋值为空，隐藏审核结果行。
		nui.get("auditstatus").setValue(3);
		document.getElementById("salesEdit").style.display="none";
		nui.get("auditopinion").setValue("");
		
		//查询合同相关信息
		if(contnum){
			nui.ajax({
    			url:"com.primeton.eos.ame_income.gatherFcBillingProcess.getContByContnum.biz.ext",
    			data: {"contnum": contnum},
    			type:"post",
    			contentType:"text/json",
    			success:function(data){
    				data = nui.clone(data);
    				//合同基本信息
                    document.getElementById("projectname").innerHTML = data.csContract.projectname == null ? "" : data.csContract.projectname;
                	nui.get("contractid").setValue(data.csContract.contractid);
                	document.getElementById("contnum").innerHTML = data.csContract.contnum == null ? "" : data.csContract.contnum;
                	document.getElementById("contsum").innerHTML = data.csContract.contsum == null ? "0.00" : nui.formatNumber(data.csContract.contsum,'#,##.##');
                	document.getElementById("salename").innerHTML = data.csContract.salename == null ? "" : data.csContract.salename;
					document.getElementById("income").innerHTML = data.csContract.income == null ? "0.00" : nui.formatNumber(data.csContract.income,'#,##.##');
                	document.getElementById("incometype").innerHTML = data.csContract.incometype == null ? "" : nui.getDictText('MIS_HTINCOMETYPE',data.csContract.incometype);
                	document.getElementById("miscustname").innerHTML = data.csContract.misCustinfo.custname == null ? "" : data.csContract.misCustinfo.custname;
					document.getElementById("csContract.servmon").innerHTML = data.csContract.servmon == null ? "0.00" : nui.formatNumber(data.csContract.servmon,'#,##.##');
	                document.getElementById("csContract.prodmon").innerHTML = data.csContract.prodmon == null ? "0.00" : nui.formatNumber(data.csContract.prodmon,'#,##.##');
	                document.getElementById("csContract.masum").innerHTML = data.csContract.masum == null ? "0.00" : nui.formatNumber(data.csContract.masum,'#,##.##');
					//确认人赋值
					var j=0;
					for(var i = 0;i < data.csContractsales.length;i ++){
						sureNames[i] = {"saleid": data.csContractsales[i].saleid,"salename": data.csContractsales[i].salename};
						j = i+1;
					}
					sureNames[j] = {"saleid":"<%=userno %>","salename":"<%=username %>"}
					nui.get("suresaleid").setData(sureNames);
					//确认人默认
					nui.get("suresaleid").setValue(sureNames[0].saleid);
					nui.get("suresaleid").setText(sureNames[0].salename);
					//合同收款记录
					csGatherFcGrid.load({"csGatherFc": {"contnum": contnum}},function(){
						prod_grid.setData(data.csContractProds);
						serv_grid.setData(data.csContractsales);
	    				//客户
	    				nui.get("custname").setValue(data.csContract.misCustinfo.custid);
                        nui.get("custname").setText(data.csContract.misCustinfo.custname);
                        //户名
                        nui.get("accoutname").setValue(data.csContract.misCustinfo.accoutname);
                        //开户银行
                        nui.get("accoutbank").setValue(data.csContract.misCustinfo.accoutbank);
                        //税号
                        nui.get("taxnumb").setValue(data.csContract.misCustinfo.taxnumb);
                        //账号
                        nui.get("accountid").setValue(data.csContract.misCustinfo.accountid);
                        //地址
                        nui.get("address").setValue(data.csContract.misCustinfo.address);
                        //电话
                        nui.get("telephone").setValue(data.csContract.misCustinfo.telephone);
					});
    			}
    		});
		}
	}
    
    //选择合同收款行
    function chooiseGatherFc(e){
    	//收款类型
    	var sktype = "";
    	//选择的收款金额
    	var chooiseBillsummon = 0;
    	//选择的收款产品金额
    	var chooiseBillprodmon = 0;
    	//选择的收款服务金额
    	var chooiseBillservmon = 0;
    	var rows = csGatherFcGrid.getSelecteds();
    	for(var i = 0;i < rows.length;i ++){
    		//选择的行数据中有收款状态不为“未收款（未开票）”的数据，不能发起开票申请 
    		if(rows[i].billstatus != "0" ){
    			nui.alert("只有开票状态为【未开票】的收款数据才能发起开票申请！","系统提示",function(){
    				csGatherFcGrid.deselect(rows[i]);
    			});
    			return;
    		}
    		if(sktype){
    			if(sktype.indexOf(rows[i].gathertype + "") == "-1"){
    				sktype = sktype + "," + rows[i].gathertype;
    			}
    		}else{
    			sktype = rows[i].gathertype + "";
    		}
    	}
    	
    	//判断选中的收款类型是否有产品
		if(sktype.indexOf("0") == "-1"){
			document.getElementById("kpcpxxxx").style.display = "none";
			prod_grid.deselectAll(true);
		}else if(sktype.indexOf("0") != "-1" && sktype.indexOf("2") == "-1"){
			document.getElementById("kpcpxxxx").style.display = "";
		}
		//判断选中的收款类型是否有服务
		if(sktype.indexOf("1") == "-1"){
			document.getElementById("kpfwxxxx").style.display = "none";
			serv_grid.deselectAll(true);
		}else if(sktype.indexOf("1") != "-1" && sktype.indexOf("2") == "-1"){
			document.getElementById("kpfwxxxx").style.display = "";
		}
		//选中的收款类型为产品+服务
		if(sktype.indexOf("2") == "-1" && sktype.indexOf("0") == "-1" && sktype.indexOf("1") == "-1"){
			document.getElementById("kpcpxxxx").style.display = "none";
			document.getElementById("kpfwxxxx").style.display = "none";
			prod_grid.deselectAll(true);
			serv_grid.deselectAll(true);
		}else if(sktype.indexOf("2") != "-1"){
			document.getElementById("kpcpxxxx").style.display = "";
			document.getElementById("kpfwxxxx").style.display = "";
		}
    }
	
	//金额合计
	function doCal(e){
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
				var money = (parseFloat(num) * parseFloat(price)).toFixed(2);
				//从业务字典取产品税率
				var taxrate = parseFloat(nui.getDictText('AME_SYSCONF','PRODUCTRATE'));
				var u8xse = money/(1+taxrate);
				var tax = money - u8xse;
				var rowData = {money: money,taxrate:taxrate,u8xse:u8xse,tax:tax};
				prod_grid.updateRow(rows1[i],rowData);
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
		//开票数量
		document.getElementById("prodNumTotal").innerHTML = parseFloat(prodNumSum).toFixed(0);
		//产品开票金额
		document.getElementById("prodMoneyTotal").innerHTML = nui.formatNumber(prodMoneySum,'#,##.##');
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
				var money = (parseFloat(num) * parseFloat(price)).toFixed(2);
				//从业务字典取服务税率
				var taxrate = parseFloat(nui.getDictText('AME_SYSCONF','SERVICERATE'));
				var u8xse = money/(1+taxrate);
				var tax = money - u8xse;
				var rowData = {money: money,taxrate:taxrate,u8xse:u8xse,tax:tax};
				serv_grid.updateRow(rows2[i],rowData);
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
		//服务开票数量
		document.getElementById("servNumTotal").innerHTML = parseFloat(servNumSum).toFixed(0);
		//开票服务金额
		document.getElementById("servMoneyTotal").innerHTML = nui.formatNumber(servMoneySum,'#,##.##');
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
		nui.get("billprodmon").setValue(prodmoney.toFixed(2));
		nui.get("billservmon").setValue(servmoney.toFixed(2));
		nui.get("billsummon").setValue(summoney.toFixed(2));
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
				doCal(rows1[i]);
			}
		}else{
			nui.get("billprodmon").setValue(prodMoneySum.toFixed(2));
			nui.get("billsummon").setValue(nui.get("billservmon").getValue() + prodMoneySum)
		}
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
				doCal(rows2[i]);
			}
		}else{
			nui.get("billservmon").setValue(servMoneySum.toFixed(2));
			nui.get("billsummon").setValue(nui.get("billprodmon").getValue() + servMoneySum)
		}
	}
		
	//发起流程还是暂时保存
	var operate;
	function onOk(e){
		var filePaths = document.getElementsByName("uploadfile").length;
		var custname = nui.get("custname").getText();
		var accoutname = nui.get("accoutname").getValue();
		var auditopinion = nui.get("auditopinion").getValue();
		//nui.alert("客户名称："+custname+";开票单位："+accoutname+";说明："+auditopinion);
		var billtype = nui.get("billtype").getValue();
		if(custname != accoutname && (auditopinion == null || auditopinion == "") && billtype == "2"){
			nui.alert("客户名称和开票单位不一致，请在任务说明处写明相关情况！");
			return false;
		}
		var rows_sale = serv_grid.getSelecteds();
		for (var i = 0; i < rows_sale.length ; i++){
    		if(rows_sale[i].servname == null || rows_sale[i].servname ==""){
    			nui.alert("选中的开票服务详细信息服务名称必选！");
    			return false;
    		}
    		if(rows_sale[i].unit == null || rows_sale[i].unit ==""){
    			nui.alert("选中的开票服务详细信息开票单位必选！");
    			return false;
    		}
    	}
    	var rows_prod = prod_grid.getSelecteds();
    	for (var i = 0; i < rows_prod.length ; i++){
    		if(rows_prod[i].unit == null || rows_prod[i].unit ==""){
    			nui.alert("选中的开票产品详细信息开票单位必选！");
    			return false;
    		}
    	}
    	for(var j = 0;j < filePaths;j++){
    		var a = document.getElementsByName("remarkList")[j].value;
    		if(a == null || a == ""){
    			nui.alert("新增附件不可以为空");
    			return false;
    		}
    	}
    	if(!form_cont.validate()){
			nui.alert("信息录入不完整!");
			return;
		}else{
    		operate = e;
    		document.getElementById("fileCatalog").value="csNewbill";
    		form2.submit();
		}
	}
		
	//开始
	function SaveData(){
		if(!form_cont.validate()){
			nui.alert("信息录入不完整!");
			return;
		}
		var json = form_cont.getData();
		//附件ID赋值
		json.csNewbill.fileids = nui.get("fileids").getValue();
		//操作-app：发起流程，save：暂时保存
		json.operate = operate;
		//开票产品信息
		json.csBillProds = prod_grid.getSelecteds();
		//开票服务信息
		json.csBillSales = serv_grid.getSelecteds();
		var message = "发起";
		if(operate == "save"){
			message = "暂时保存";
		}
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
    	
		//发起页面的处理信息
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		//勾选的收款信息
		var rows = csGatherFcGrid.getSelecteds();
		var sum = 0;
		var billsummon = nui.get("billsummon").getValue();
		for(var i=0;i<rows.length;i++){
			sum=sum+parseFloat(rows[i].fcsum);
		}
		sum=sum.toFixed(2);
		if(sum != billsummon){
			nui.alert("勾选的预计收款金额与开票金额不等，请联系商务！");
			return;
		}
		if(billsummon == 0 || billsummon == ''){
			nui.alert("开票金额不为零！");
			return;
		}
		json.csGatherFcs = rows;
		nui.confirm("确定要"+message+"合同收款开票流程吗？","操作提示",function (action){
			if(action == "ok"){
				form_cont.loading("处理中,请稍后...");
	    		nui.ajax({
	    			url:"com.primeton.eos.ame_income.gatherFcBillingProcess.gatherFcBillingProcessCreate.biz.ext",
	    			data: json,
	    			type:"post",
	    			contentType:"text/json",
	    			success:function(action){
	    				action = nui.clone(action);
	    				form_cont.unmask();
	    				if(action.exception == null){
	    					nui.alert("发起合同收款开票流程成功！","系统提示",function(){
				        		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
				        	});
	    				}else{
	    					nui.alert("流程提交失败！","系统提示",function (){
			    				nui.get("appButton").setEnabled(true);
	        					nui.get("saveButton").setEnabled(true);
	    					});
	    				}
	    			},
	    			error:function(jqXHR, textStatus, errorThrown){
	    				nui.alert("error:" + jqXHR.responseText);
	    			}
	    		});
			}
		});
	}
	
	//取消
    function onCancel(e) {
        CloseWindow("cancel");
    }
	
	//开票产品详细信息遇到可填报行背景色为黄色
	prod_grid.on("drawcell", function (e) {
        var record = e.record,
        column = e.column,
        field = e.field,
        value = e.value;
        //增加背景色
        if (field == "num" || field == "price" ||  field == "unit" || field == "miemo" || field == "rdmiemo") {
            e.cellStyle = "background: #FFFD75";//cyan
        }
    });
    //开票服务详细信息遇到可填报行背景色为黄色
	serv_grid.on("drawcell", function (e) {
        var record = e.record,
        column = e.column,
        field = e.field,
        value = e.value;
        //增加背景色
        if (field == "num" || field == "price" ||  field == "unit" ||  field == "servname" || field == "miemo" || field == "rdmiemo") {
            e.cellStyle = "background: #FFFD75";//cyan
        }
    });
		
    //开票类型选择
    nui.get("billtype").on("valuechanged",function(e){
		var billtype = nui.get("billtype").getValue();
		if(billtype == "1"){//增值税普通
			document.getElementById("temp1").style.display = "none";
			document.getElementById("temp2").style.display = "none";
			document.getElementById("temp3").style.display = "none";
		}else if(billtype == "2"){//增值税专用
			document.getElementById("temp1").style.display = "";
			document.getElementById("temp2").style.display = "";
			document.getElementById("temp3").style.display = "";
		}
	});
</script>
<script src="<%= request.getContextPath() %>/ame_income/gatherFcBillingProcess/js/gatherFcBillingjs.js" type="text/javascript"></script>
</html>