<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 朱勇伦
  - Date: 2016-12-20 14:56:10
  - Description:
-->
<head>
	<title>合同收款开票流程-销售确认</title>
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
	<!-- 非受益发起的开票需要经过销售确认，显示信息和开发票申请信息界面一致，允许修改（提供任务到达短信和邮件告知） -->
	<div class="nui-fit">
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<form id="form_cont" method="post">
			<input class="nui-hidden" id="workItemID" value="<%=workItemID %>"/>
			<input class="nui-hidden" name="csNewbill.processinstid" id="csNewbillProcessinstid"/>
			<input class="nui-hidden" name="csNewbill.billid" id="billid"/>
			<input name="csContract.contractid" id="contractid" class="nui-hidden"/>
			<input name="misOpinion.processinstid" id="processinstid2" class="nui-hidden" />
			<fieldset style="border:solid 1px #aaa;padding:3px;width: 100%;">
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
	        
	        <fieldset style="border:solid 1px #aaa;padding:3px;width: 100%;">
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
						<div field="fcsum" width="112" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收款金额(含税)</div>	
						<div field="productsum" width="133" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收款产品金额(含税)</div>
						<div field="servicesum" width="133" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">预计收款服务金额(含税)</div>
						<div field="fcreverate" width="80" align="center" headerAlign="center" numberFormat="p1">预计确认比例</div>	
						<div field="actsum" width="100" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">已收款金额</div>	
						<div field="confirmday" width="auto" align="center" headerAlign="center">实际收款日期</div>
					</div>
				</div>
	        </fieldset>
	        
	        <fieldset style="border:solid 1px #aaa;padding:3px;display: none;width: 100%;" id="kpcpxxxx">
	            <legend>开票产品详细信息</legend>
	            <div style="padding:5px;">
		        	<div id="prod_grid" class="nui-datagrid" style="width: 100%;height:auto;" allowResize="true" 
		        		oncellendedit="doCal" onselect="prodGridOnselect" ondeselect="prodGridOnselect" showPager="false" 
		        		allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" 
		        		onlyCheckSelection="true">			        
				        <div property="columns">
				            <div type="checkcolumn"></div>
				            <div field="conProId" width="60" headerAlign="center" >conProId</div>
				            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
				            <div field="prod_name" width="180" headerAlign="center">产品名称</div>
				            <div field="prodmon" width="100" dataType="currency" headerAlign="center" align="right">产品金额</div>
				            <div field="price" width="100" dataType="currency" headerAlign="center" align="right">开票单价
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float" inputStyle="text-align: right"/>
				            </div>
				            <div field="num" width="60" headerAlign="center" align="right">开票数量
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float" inputStyle="text-align: right"/>
				            </div>
				            <div field="unit" width="60" headerAlign="center" renderer="onUnitRenderer">开票单位
				            	<input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="UNIT"/>
				            </div>
				            <div field="money" width="100" dataType="currency" headerAlign="center" align="right" >产品开票金额
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float" allowInput="false"/>
				            </div>
				            <div field="miemo" width="auto" headerAlign="center" >开票特殊要求
				            	<input property="editor" class="nui-textarea" style="width:100%;"/>
				            </div>
				            <div field="rdmiemo" width="auto" headerAlign="center" >发票右下角备注
				            	<input property="editor" class="nui-textarea" style="width:100%;"/>
				            </div>
				        	<div field="tax" width="0" dataType="currency" headerAlign="center" align="right" >税金</div>
				            <div field="u8xse" width="0" dataType="currency" headerAlign="center" align="right" >销售额</div>
				            <div field="taxrate" width="0" dataType="currency" headerAlign="center" align="right">税率</div>
			        	</div>
				    </div>
	            </div>
	            <div style="width: 580px;height: 25px;margin-left: 155px;float:left;">
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
	        
	        <fieldset style="border:solid 1px #aaa;padding:3px;display: none;width: 100%;" id="kpfwxxxx">
	            <legend>开票服务详细信息</legend>
	            <div style="padding:5px;">
		        	<div id="serv_grid" class="nui-datagrid" style="width: 100%;height:auto;" allowResize="false" 
		        		oncellendedit="doCal" onselect="servGridOnselect" ondeselect="servGridOnselect" showPager="false" 
		        		allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" 
		        		onlyCheckSelection="true">			        
				        <div property="columns">    
				        	<div type="checkcolumn"></div>  
				        	<div field="contsaleid" width="60" headerAlign="center" >contsaleid</div> 
				            <div field="salename" width="60" headerAlign="center" >销售姓名</div>
				            <div field="servmon" width="100" dataType="currency" headerAlign="center" align="right">服务金额</div>
				            <div field="servname" width="100" headerAlign="center" align="left" renderer="onServRenderer">服务名称
				            	<input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="CS_SERVNAME"/>
				            </div>
				            <div field="price" width="100" headerAlign="center" dataType="currency" align="right">开票单价
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float" inputStyle="text-align: right"/>
				            </div>
				            <div field="num" width="60" headerAlign="center" align="right" align="right">开票数量
					            <input property="editor" class="nui-textbox" style="width:100%;" vtype="float" inputStyle="text-align: right"/>
				            </div>
				            <div field="unit" width="60" headerAlign="center" renderer="onUnitSALERenderer">开票单位
				            	<input property="editor" class="nui-dictcombobox" style="width:100%;" dictTypeId="UNIT_SALE" required="true"/>
				            </div>
				            <div field="money" width="100" headerAlign="center" dataType="currency" align="right">服务开票金额
				            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float" allowInput="false"/>
				            </div>
				            <div field="miemo" width="auto" headerAlign="center" >开票特殊要求
				            	<input property="editor" class="nui-textarea" style="width:100%;"/>
				            </div>
				            <div field="rdmiemo" width="auto" headerAlign="center" >发票右下角备注
				            	<input property="editor" class="nui-textarea" style="width:100%;"/>
				            </div>
				            <div field="tax" width="0" dataType="currency" headerAlign="center" align="right" >税金</div>
				            <div field="u8xse" width="0" dataType="currency" headerAlign="center" align="right" >销售额</div>
				            <div field="taxrate" width="0" dataType="currency" headerAlign="center" align="right">税率</div>
				        </div>    
				    </div>
	            </div>
	            <div style="width: 500px;height: 25px;margin-left: 155px;float:left;">
					<table style="table-layout:fixed;font-weight: bold;" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<!-- 服务金额 -->
							<td id="servMonTotal" style="width: 100px;" align="right" ></td>
							<td align="right" style="width: 100px;"></td>
							<!-- 开票单价 -->
							<td id="servPriceTotal" style="width: 100px;display: none;" align="right" ></td>
							<!-- 开票数量 -->
							<td id="servNumTotal" style="width: 160px;" align="right" ></td>
							<!-- 产品开票金额 -->
							<td id="servMoneyTotal" style="width: 100px;" align="right" ></td>
						</tr>
					</table>
				</div>
	        </fieldset>
        
	        <!-- 提供开票基本信息输入（开票单位、开票类型、开票账户信息、预计到款时间，发票邮寄信息） -->
	        <fieldset style="border:solid 1px #aaa;padding:3px;width: 100%;">
	        	<legend id="billTitle">开票信息</legend>
				<div style="padding:5px;">
					<input name="csNewbill.appname" id="appname" class="nui-hidden"/>
					<input name="csNewbill.fileids" id="fileids1" class="nui-hidden"/>
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:100px">开票产品金额：</td>
							<td style="width: 310px;">
								<!--  allowInput="false" 不允许输入 -->
								<input name="csNewbill.billprodmon" id="billprodmon" class="nui-spinner" inputStyle="text-align: right" style="width:120px" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2" readonly="readonly"/>
							</td>
							<td align="right" style="width:100px">开票服务金额：</td>
							<td>
								<input name="csNewbill.billservmon" id="billservmon" class="nui-spinner"inputStyle="text-align: right" style="width:120px" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2" readonly="readonly"/>
							</td>
							<td align="right" style="width:100px">开票金额：</td>
							<td>
								<input name="csNewbill.billsummon" id="billsummon" class="nui-spinner" inputStyle="text-align: right" style="width: 120px" allowLimitValue="false" changeOnMousewheel="false" showButton="false" format="n2" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width:100px">客户名称：</td>
							<td>
								<input name="csNewbill.custname" id="custname" class="nui-buttonedit" onbuttonclick="selectMisCust" style="width: 300px" required="true"/>
							</td>
							<td align="right" style="width:100px">开票单位：</td>
							<td colspan="3">
								<input name="csNewbill.accoutname" id="accoutname" class="nui-textbox" style="width: 200px" required="true"/>
							</td>
						</tr>
						<tr>
		                	<td align="right" style="width:130px">发票类型：</td>
							<td>
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
								<input name="csNewbill.accountid" id="accountid" class="nui-textbox" style="width: 150px" required="true"/>
							</td>
							<td align="right" style="width:100px">开户银行：</td>
							<td colspan="3">
								<input name="csNewbill.accoutbank" id="accoutbank" class="nui-textbox" style="width: 300px" required="true"/>
							</td>
						</tr>
						<tr id="temp2" >
							<td align="right" style="width:100px">开票单位电话：</td>
							<td>
								<input name="csNewbill.telephone" id="telephone" class="nui-textbox" style="width: 200px" required="true"/>
							</td>
							<td align="right" style="width:100px">开票单位地址：</td>
							<td colspan="3">
								<input name="csNewbill.address" id="address" class="nui-textbox" style="width: 300px" required="true"/>
							</td>
						</tr>
						<tr id="temp3" >
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td align="right" style="width:100px">发票邮寄地址：</td>
							<td>
								<input name="csNewbill.mailingaddress" id="mailingaddress" class="nui-textbox" style="width: 300px" />
							</td>
							<td align="right" style="width:100px">发票邮寄联系人：</td>
							<td>
								<input name="csNewbill.mailinglinkman" id="mailinglinkman" class="nui-textbox" style="width: 100px" />
							</td>
							<td align="right" style="width:100px">发票邮寄电话：</td>
							<td>
								<input name="csNewbill.mailinglinktel" id="mailinglinktel" class="nui-textbox" style="width: 150px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:100px">确认人：</td>
							<td style="width: 200px" >
								<input name="csNewbill.suresaleid" id="suresaleid" class="nui-combobox" style="width:100px"
									textField="salename" valueField="saleid" readOnly="readOnly" required="true" />
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
			<jsp:include page="/ame_common/detailAndDelFile.jsp"/>
			<jsp:include page="/ame_common/addFiles1.jsp"/>
		</fieldset>
		<!-- 审核意见  -->
		<jsp:include page="/ame_common/misOpinion.jsp"/>
		<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
			<legend>处理意见附件</legend>
			<jsp:include page="/ame_common/addFiles.jsp"/>
			<!-- form2 fileCatalog uploadfile remarkList SaveData -->
		</fieldset>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" style="width: 60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width: 60px;" id="canelButton">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form_cont = new nui.Form("form_cont");
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	//合同收款
	var csGatherFcGrid = nui.get("csGatherFcGrid");
	//开票产品详细信息
	var prod_grid = nui.get("prod_grid");
	//开票服务详细信息
	var serv_grid = nui.get("serv_grid");
	//文件路径
	var ContextPath= '<%=request.getContextPath() %>' 
	
	init();//页面初始化
	function init(){
		promptInit({"workItemID":0,"processDefName":"com.primeton.eos.income.GatherFcBillingConfirm","activityDefID":"manualActivity"});
		var json={"workItemID": <%=workItemID %>};
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
				//审批意见的流程实例ID
				nui.get("processinstid").setValue(data.csNewbill.processinstid);
				nui.get("workitemid").setValue(<%=workItemID %>);
				//开票申请的流程实例ID
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
				document.getElementById("csContract.servmon").innerHTML = data.csNewbill.csContract.servmon == null ? "0.00" : nui.formatNumber(data.csNewbill.csContract.servmon,'#,##.##');
	            document.getElementById("csContract.prodmon").innerHTML = data.csNewbill.csContract.prodmon == null ? "0.00" : nui.formatNumber(data.csNewbill.csContract.prodmon,'#,##.##');
	            document.getElementById("csContract.masum").innerHTML = data.csNewbill.csContract.masum == null ? "0.00" : nui.formatNumber(data.csNewbill.csContract.masum,'#,##.##');
				
				//合同收款记录
				csGatherFcGrid.load({"csGatherFc": {"contnum": data.csNewbill.csContract.contnum}},function(){
					csGatherFcGrid.selectAll(false);
	        		var rows = csGatherFcGrid.getSelecteds();
					for(var i = 0;i < rows.length;i ++){
						if(rows[i].billprocinstid != data.csNewbill.processinstid){
							csGatherFcGrid.deselect(rows[i]);
						}
					}
					//产品开票详细信息kpcpxxxx
					if(data.csBillProds){
						document.getElementById("kpcpxxxx").style.display = "";
						prod_grid.setData(data.csBillProds);
						for(var i = 0;i < data.csBillProds.length;i ++){
							if(data.csBillProds[i].billid == data.csNewbill.billid){
								prod_grid.select(data.csBillProds[i]);
							}
						}
					}
					//服务开票详细信息kpfwxxxx
					if(data.csBillSales){
						document.getElementById("kpfwxxxx").style.display = "";
						serv_grid.setData(data.csBillSales);
						for(var i = 0;i < data.csBillSales.length;i ++){
							if(data.csBillSales[i].billid == data.csNewbill.billid){
								serv_grid.select(data.csBillSales[i]);
							}
						}
					}
					//申请人名称
					nui.get("appname").setValue(data.csNewbill.appname);
					//开票产品金额     
					nui.get("billprodmon").setValue(data.csNewbill.billprodmon);
					//开票服务金额
					nui.get("billservmon").setValue(data.csNewbill.billservmon);
					//开票金额
					nui.get("billsummon").setValue(data.csNewbill.billsummon);
					//开票类型
					nui.get("billtype").setValue(data.csNewbill.billtype);
					//确认人
					nui.get("suresaleid").setValue(data.csNewbill.suresaleid);
					nui.get("suresaleid").setText(data.csNewbill.suresalename);
					//发票邮寄地址
	                nui.get("mailingaddress").setValue(data.csNewbill.mailingaddress);
	                //发票邮寄联系人
	                nui.get("mailinglinkman").setValue(data.csNewbill.mailinglinkman);
	                //发票邮寄电话
	                nui.get("mailinglinktel").setValue(data.csNewbill.mailinglinktel);
					if(data.csNewbill.billtype == "1"){
						document.getElementById("temp1").style.display = "none";
						document.getElementById("temp2").style.display = "none";
						document.getElementById("temp3").style.display = "none";
						//税号
	                    nui.get("taxnumb").setValue(data.csNewbill.taxnumb);
						//开票单位
	    				nui.get("custname").setValue(data.csNewbill.csContract.misCustinfo.custid);
	                    nui.get("custname").setText(data.csNewbill.csContract.misCustinfo.custname);
	                    //户名
	                    nui.get("accoutname").setValue(data.csNewbill.accoutname);
					}else{
						//开票单位
	    				nui.get("custname").setValue(data.csNewbill.csContract.misCustinfo.custid);
	                    nui.get("custname").setText(data.csNewbill.csContract.misCustinfo.custname);
	                    //户名
	                    nui.get("accoutname").setValue(data.csNewbill.accoutname);
	                    //开户银行
	                    nui.get("accoutbank").setValue(data.csNewbill.accoutbank);
	                    //税号
	                    nui.get("taxnumb").setValue(data.csNewbill.taxnumb);
	                    //账号
	                    nui.get("accountid").setValue(data.csNewbill.accountid);
	                    //地址
	                    nui.get("address").setValue(data.csNewbill.address);
	                    //电话
	                    nui.get("telephone").setValue(data.csNewbill.telephone);
					}
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
			//产品金额
			document.getElementById("prodmonTotal").innerHTML = nui.formatNumber(prodmonSum,'#,##.##');
			//开票单价
			document.getElementById("prodPriceTotal").innerHTML = nui.formatNumber(prodPriceSum,'#,##.##');
			//开票数量
			document.getElementById("prodNumTotal").innerHTML = parseFloat(prodNumSum).toFixed(0);
			//产品开票金额
			document.getElementById("prodMoneyTotal").innerHTML = nui.formatNumber(prodMoneySum,'#,##.##');
		}
		
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
			//服务金额
			document.getElementById("servMonTotal").innerHTML = nui.formatNumber(servmonSum,'#,##.##');
			//服务开票单价
			document.getElementById("servPriceTotal").innerHTML = nui.formatNumber(servPriceSum,'#,##.##');
			//服务开票数量
			document.getElementById("servNumTotal").innerHTML = parseFloat(servNumSum).toFixed(0);
			//开票服务金额
			document.getElementById("servMoneyTotal").innerHTML = nui.formatNumber(servMoneySum,'#,##.##');
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
		
		nui.get("billprodmon").setValue(prodMoneySum.toFixed(2));
		nui.get("billsummon").setValue(nui.get("billservmon").getValue() + prodMoneySum);
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
		document.getElementById("servNumTotal").innerHTML = parseFloat(servNumSum).toFixed(0);
		//开票服务金额
		document.getElementById("servMoneyTotal").innerHTML = nui.formatNumber(servMoneySum,'#,##.##');
		
		nui.get("billservmon").setValue(servMoneySum.toFixed(2));
		nui.get("billsummon").setValue(nui.get("billprodmon").getValue() + servMoneySum);
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
		var processinstid = nui.get("processinstid").getValue();
		for(var i = 0;i < rows.length;i ++){
			//选择的行数据中有收款状态不为“未收款（未开票）”的数据，不能发起开票申请 
			if(rows[i].billstatus != "0"  && !(rows[i].billstatus == "1" && rows[i].billprocinstid == processinstid)){
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
		//选中的收款类型既不是产品也不是产品+服务
		if(sktype.indexOf("0") == "-1" && sktype.indexOf("2") == "-1"){	
			document.getElementById("kpcpxxxx").style.display = "none";
			prod_grid.deselectAll(true);
		}else if(sktype.indexOf("0") != "-1" && sktype.indexOf("2") == "-1"){	//选中的收款类型是产品
			document.getElementById("kpcpxxxx").style.display = "";
		}
		//选中的收款类型既不是服务也不是产品+服务
		if(sktype.indexOf("1") == "-1" && sktype.indexOf("2") == "-1"){
			document.getElementById("kpfwxxxx").style.display = "none";
			serv_grid.deselectAll(true);
		}else if(sktype.indexOf("1") != "-1" && sktype.indexOf("2") == "-1"){	//选中的收款类型是服务
			document.getElementById("kpfwxxxx").style.display = "";
		}
		//选中的收款类型既不是产品也不是服务更不是产品+服务
		if(sktype.indexOf("2") == "-1" && sktype.indexOf("0") == "-1" && sktype.indexOf("1") == "-1"){
			document.getElementById("kpcpxxxx").style.display = "none";
			document.getElementById("kpfwxxxx").style.display = "none";
			prod_grid.deselectAll(true);
			serv_grid.deselectAll(true);
		}else if(sktype.indexOf("2") != "-1"){	//选中的收款类型为产品+服务
			document.getElementById("kpcpxxxx").style.display = "";
			document.getElementById("kpfwxxxx").style.display = "";
		}
	}
	
	function onOk(e){
		if(e==0){	//终止流程
	    	nui.confirm("确定终止流程吗？", "操作提示",
	            function (action) {            
	                if (action == "ok") {
	                	nui.get("sureButton").setEnabled(false);
	                	//终止流程设置操作为2终止
	                	nui.get("auditstatus").setValue(2);
	                	document.getElementById("fileCatalog").value="MIS_OPINION";
						form2.submit();
					}else{
						nui.get("sureButton").setEnabled(true);
						return;
					}
				}
			);
		}else{
			//开票金额
			var rows = csGatherFcGrid.getSelecteds();
			var sum = 0;
			var billsummon = nui.get("billsummon").getValue();
			for(var i=0;i<rows.length;i++){
				sum=sum+parseFloat(rows[i].fcsum);
			}
			sum=sum.toFixed(2);
			if(sum != billsummon){
				nui.alert("勾选的预计收款金额与开票金额不等，请联系商务！");
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
			//审核结果0：退回，1：提交
			var auditstatus = nui.get("auditstatus").getValue();
			var titleName = "";
			if(auditstatus == "1"){
				//提交流程
	    		titleName = "确定提交流程吗？";
			}else if(auditstatus == "0"){
				//退回流程
	    		titleName = "确定退回流程吗？";
	    		if(!nui.get("backTo").getValue()){
	    			nui.alert("审核结果为退回，请选择回退到的环节！");
	    			return false;
	    		}
			}else{
				titleName = "确定终止流程吗？";
			}
			nui.confirm(titleName, "操作提示",
	            function (action) {            
	                if (action == "ok") {
	                	nui.get("sureButton").setEnabled(false);
	                	document.getElementById("fileCatalog1").value="csNewbill";
						form4.submit();
					}else{
						nui.get("sureButton").setEnabled(true);
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
			if(!form_cont.validate()){
				return;
			}
		}
		processSaleCheck();
	}
	
	function processSaleCheck(){
		var json = form_cont.getData();
		//工作项ID
		var workItemID = nui.get("workItemID").getValue();
		json.workItemID = workItemID;
		//处理信息
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		//收款记录信息
		var rows = csGatherFcGrid.getSelecteds();
		json.csGatherFcs = rows;
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
		nui.ajax({
			url:"com.primeton.eos.ame_income.gatherFcBillingProcess.gatherFcBillingProcessSaleCheck.biz.ext",
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
	
	prod_grid.on("drawcell", function (e) {
	    var record = e.record,
	    column = e.column,
	    field = e.field,
	    value = e.value;
	    //增加背景色
	    if (field == "num" || field == "price" || field == "money" || field == "unit" || field == "miemo" || field == "rdmiemo") {
	        e.cellStyle = "background: #FFFD75";//cyan
	    }
	});
	
	serv_grid.on("drawcell", function (e) {
	    var record = e.record,
	    column = e.column,
	    field = e.field,
	    value = e.value;
	    //增加背景色
	    if (field == "num" || field == "price" || field == "money" || field == "servname" || field == "miemo" || field == "rdmiemo") {
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