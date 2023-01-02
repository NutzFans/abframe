<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath = request.getContextPath();
%>
<html>
<!-- 
  - Author(s): 李鹏程
  - Date: 2019-11-18 09:17:11
  - Description:
-->
<head>
<title>坏账核销审批流程-财务坏账处理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js"
	type="text/javascript"></script>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
</head>
<body>
	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
	<div class="nui-fit">
		<div class="nui-panel" title="坏账核销财务坏账处理" style="width: auto">
			<jsp:include
				page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp" />
			<form id="form_cont" method="post">
				<input class="nui-hidden" id="workItemID" value="<%=workItemID %>" />
				<input name="csContract.contractid" id="contractid"
					class="nui-hidden" />
				<!-- <input name="csContract.contnum" id="contnum"
					class="nui-hidden" />  -->
				<input name="csContract.misCustinfo.custjc" id="custjc"
					class="nui-hidden" />
               
				<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<legend>合同信息</legend>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;" id="table_file1">
							<tr>
								<td align="right" style="width: 130px"></td>
								<td style="width: 190px"></td>
								<td align="right" style="width: 130px"></td>
								<td style="width: 190px"></td>
								<td align="right" style="width: 130px"></td>
								<td style="width: 190px"></td>
							</tr>
							<tr>
								<td align="right" style="width: 130px">合同名称：</td>
								<td id="projectname" style="width: 830px;" colspan="5"></td>
							</tr>
							<tr>
								<td align="right" style="width: 130px">合同编号：</td>
								<td id="contnum" style="width: 190px;"></td>
								<td align="right" style="width: 130px">客户：</td>
								<td id="miscustname" style="width: 190px;"></td>
								<td align="right" style="width: 130px">受益人：</td>
								<td id="salename" style="width: 190px;"></td>
							</tr>
							<tr>
								<td align="right" style="width: 130px">合同金额：</td>
								<td id="contsum" style="width: 190px"></td>
								<td align="right" style="width: 130px">已确认收款：</td>
								<td id="income" style="width: 190px"></td>
								<td align="right" style="width: 130px">合同收入类型：</td>
								<td id="incometype" style="width: 190px"></td>
							</tr>
							<tr>
								<td style="width: 130px;" align="right">合同产品金额：</td>
								<td style="width: 190px;" id="csContract.prodmon"></td>
								<td style="width: 130px;" align="right">合同服务金额：</td>
								<td style="width: 190px;" id="csContract.servmon"></td>
								<td style="width: 130px;" align="right">合同MA金额：</td>
								<td style="width: 190px;" id="csContract.masum"></td>
							</tr>
						</table>
					</div>
				</fieldset>
				<fieldset id="field6"
					style="border: solid 1px #aaa; padding: 3px; width: 100%;">
					<legend>合同附件</legend>
					<jsp:include page="/ame_common/detailFile3.jsp" />
				</fieldset>
				<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<legend>合同收入记录列表</legend>
					<div id="grid_income" class="nui-datagrid"
						style="width: 100%; height: auto;" allowResize="false"
						dataField="csReveForecasts"
						url="com.primeton.eos.ame_income.cancelBadDebts.getCsReveForecast1.biz.ext"
						allowCellSelect="true" showPager="false" idField="appid"
						multiSelect="false">
						<div property="columns">

							<div field="contnum" width="0">合同编号</div>
							<div field="reveno" width="60" headerAlign="center"
								align="center" headerAlign="center">收入确认次数</div>
							<div field="reveproof" width="80" headerAlign="center"
								align="center" headerAlign="center" renderer="dictproof">预计收入确认证据</div>
							<div field="revetimedesc" width="80" headerAlign="center"
								align="left" headerAlign="center">收入确认时点描述</div>
							<div field="newyearmonth" width="70" headerAlign="center"
								align="center" headerAlign="center">预计确认年月</div>
							<div field="fcsum" width="70" align="right" headerAlign="center"
								dataType="currency">预计确认金额</div>
							<div field="status" width="70" align="center"
								headerAlign="center" renderer="dictstatus1">目前确认状态</div>
							<div field="actsum" width="70" align="right" headerAlign="center"
								dataType="currency">实际确认金额</div>
							<div field="fcreverate" width="50" align="center"
								headerAlign="center" numberFormat="p1">本次确认比例</div>
							<div field="confirmday" width="70" align="center"
								headerAlign="center">确认日期</div>
							<div field="contorderno" width="70" align="center"
								headerAlign="center">订单编号</div>
							<div field="memo" width="70" align="center" headerAlign="center">说明</div>
							<div field="processinstid" width="0">流程实例ID</div>
							<div field="productsum" width="0">预计产品</div>
							<div field="servicesum" width="0">预计服务</div>
							<div field="masum" width="0">预计MA</div>
							<div field="actproductsum" width="0">实际产品</div>
							<div field="actservicesum" width="0">实际服务</div>
							<div field="actmasum" width="0">实际MA</div>
							<div field="contorderno" width="0">订单id</div>
						</div>
					</div>
				</fieldset>
				<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<legend>合同收款记录列表</legend>
					<div id="csGatherFcGrid1" class="nui-datagrid"
						style="width: 100%; height: auto;" allowResize="true"
						dataField="csGatherFcs" showSummaryRow="false" showPager="false"
						allowCellEdit="true" allowCellSelect="true" multiSelect="true"
						url="com.primeton.eos.ame_income.cancelBadDebts.getCsGatherFc.biz.ext"
						ondrawcell="drawGather">
						<div property="columns">

							<div field="gatherno" width="60" align="center"
								headerAlign="center">收款次数</div>
							<div field="status" width="80" align="center"
								headerAlign="center" renderer="dictstatus">
								收款状态
								<!--<input property="editor" align="center" headerAlign="center" required="true" class="nui-dictcombobox" dictTypeId="AME_GATHERSTATUS" />-->
							</div>
							<div field="billstatus" width="60" align="center"
								headerAlign="center" renderer="dictstatusbill">开票状态</div>
							<div field="gathertype" width="70" align="center"
								headerAlign="center" renderer="dictGatherFcType">收款类型</div>
							<div field="newyearmonth" width="80" align="center"
								headerAlign="center">预计收款年月</div>
							<div field="fcsum" width="130" align="right" headerAlign="center"
								dataType="currency" summaryType="sum" currencyUnit="￥">预计收款金额（含税）</div>
							<div field="productsum" width="150" align="right"
								headerAlign="center" dataType="currency" summaryType="sum"
								currencyUnit="￥">预计收款产品金额（含税）</div>
							<div field="servicesum" width="150" align="right"
								headerAlign="center" dataType="currency" summaryType="sum"
								currencyUnit="￥">预计收款服务金额（含税）</div>
							<div field="fcreverate" width="80" align="center"
								headerAlign="center" numberFormat="p1">预计确认比例</div>
							<div field="actsum" width="130" align="right"
								headerAlign="center" dataType="currency" summaryType="sum"
								currencyUnit="￥">已收款金额</div>
							<div field="confirmday" width="auto" align="center"
								headerAlign="center">实际收款日期</div>
						</div>
					</div>
				</fieldset>


				<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<legend>关联的发票列表</legend>
					<div id="datagrid3" class="nui-datagrid"
						style="width: 100%; height: auto;" allowResize="true"
						url="com.primeton.eos.ame_income.cancelBadDebts.getBadDebtBillDetails.biz.ext"
						dataField="queryBadDebtTicketDEtails" showPager="false"
						allowCellEdit="true" allowCellSelect="true" multiSelect="true"
						editNextOnEnterKey="true" onlyCheckSelection="true"
						showSummaryRow="true" ondrawsummarycell="ticketTaxSum"
						ondrawcell="drawGather1" onselectionchanged="totalsum">
						<div property="columns">
							<div field="billdate" width="80" dateFormat="yyyy-MM-dd"
								align="center" headerAlign="center" allowSort="true">开票日期</div>
							<div field="billno" width="80" align="center"
								headerAlign="center" allowSort="true">发票号</div>
							<div field="gatherno" width="80" align="center"
								headerAlign="center" allowSort="true">收款次数</div>
							<div field="notax" width="110" dataType="currency"
								summaryType="sum" align="right" headerAlign="center"
								allowSort="true">不含税金额</div>
							<div field="tax" width="110" dataType="currency"
								summaryType="sum" align="right" headerAlign="center"
								allowSort="true">税金</div>
							<div field="money" width="110" dataType="currency"
								summaryType="sum" align="right" headerAlign="center"
								allowSort="true">含税金额</div>
							<div field="isrecover" width="80" align="center" id="isrecover"
								headerAlign="center" renderer="isRecover1"
								style="background: yellow !important;">
								是否可以收回发票 <input property="editor" align="center"
									headerAlign="center" required="true"
									style="background: yellow !important;" class="nui-dictcombobox"
									dictTypeId="MIS_YN" />
							</div>
						</div>
					</div>
				</fieldset>


				<!-- <fieldset style="border: solid 1px #aaa; padding: 3px;">
				<legend>本次核销金额</legend>

				<table style="table-layout: fixed;" id="sum1" align="center">
					<tr>
						<td style="width: 200px;color:red" align="center"><b>本次核销金额总金额：</b></td>
						<td id="cancellsum" style="width: 830px; font-size: 150%;"
							colspan="5" />
					</tr>
				</table>
			</fieldset> -->
			</form>
			<fieldset style="border: solid 1px #aaa; padding: 3px;">
				
				<form id="applyreasonFrom" method="post">
					<div style="padding: 5px;" id="opinionHide3">
						<table style="table-layout: fixed;">
							<input name="amebcancell.applyreason" id="applyreason"
								class="nui-hidden" />
							<input name="amebcancell.processinstid" id="processinstid1"
								class="nui-hidden" />
							<input name="amebcancell.cancellapplyid" id="cancellapplyid"
								class="nui-hidden" />
							<input name="amebcancell.contnum" id="contnum1"
								class="nui-hidden" />
							<input name="amebcancell.cancelltype" id="cancelltype"
								class="nui-hidden" />
							<input name="amebcancell.gatherno" id="gatherno"
								class="nui-hidden" />
							<tr>
								<td
									style="width: 80px; height: auto; color: red; font-size: 130%"
									align="right"><b>申请原因：</b></td>
								<td id="applyreason1" class="nui-textarea" required="true"
									style="width: 240px; height: auto; font-size: 130%; padding: 20px"
									align="left" />
							</tr>
						</table>
					</div>
				</form>
			</fieldset>
			<fieldset style="border: solid 1px #aaa; padding: 3px;">
				<legend>坏账核销或合同减值明细表</legend>
				<div style="width: 100%;">
					<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
						<table style="width: 100%;">
							<tr>
								<td style="width: 20%;"><a class="nui-button" id="addHxBtn"
									iconCls="icon-add" onclick="addHx()">增加</a> <a
									class="nui-button" id="deltHxbtn" iconCls="icon-remove"
									onclick="removeHx()">删除</a>
									 <a
									class="nui-button" id="saveHxbtn" iconCls="icon-save"
									onclick="saveBadDebt()">保存</a>
									
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div id="grid_hxjk" class="nui-datagrid"
					style="width: 100%; height: auto;" allowResize="true"
					url="com.primeton.eos.ame_income.cancelBadDebts.getBadDebtDetail.biz.ext"
					dataField="baddebtdetails" allowCellSelect="true" showPager="false"
					allowCellEdit="true" multiSelect="true" showSummaryRow="true"
					ondrawsummarycell="doCsGatherFcSum" oncellendedit="calDays"
					onselect="onselectHx">
					<div property="columns">
					    <div field="gatherno" width="60" align="center"
								headerAlign="center">合同收款编号记录
							<input property="editor" class="nui-textbox"
								inputStyle="text-align: right;" />	
						</div>
						<div field="cancellmoney" name="cancellmoney" dataType="currency"
							width="120" align="center" summaryType="sum" headerAlign="center" currencyUnit="￥">
							核销金额 <input property="editor" class="nui-spinner"  format="n2" allowLimitValue="false"
								changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right;" />
						</div>
						<div field="cancelltype" name="cancelltype"
								 width="110" align="center" renderer="dictcancelltype" headerAlign="center">
								处理类型 <input property="editor" class="nui-dictcombobox" dictTypeId="AME_CANCELLTYPE" 
								required="true"/>

						</div>
						<div field="status" width="80" align="center"
								headerAlign="center" renderer="dictstatus">
								收款状态 <input property="editor" align="center"
									headerAlign="center" required="true" class="nui-dictcombobox",
									dictTypeId="AME_GATHERSTATUS" />
						</div>
						<div field="incomecontime" width="110" align="center"
							renderer="onDealDate1" headerAlign="center">
							收入确认时间 <input property="editor" class="nui-datepicker" />
						</div>
						<div field="cancelldate" width="110" align="center"
							renderer="onDealDate1" headerAlign="center">
							核销时间 <input property="editor" class="nui-datepicker" />
						</div>
						<div field="accountage" width="110" align="center"
							headerAlign="center">账龄</div>
						
						
						<div field="remark" name="remark" width="130" align="center" headerAlign="center">
							备注说明 <input property="editor" class="nui-textbox"
								inputStyle="text-align: right;" />
						</div>
					
					</div>
				</div>
				<fieldset style="border: solid 1px #aaa; padding: 3px;display:none">
					<legend>收款坏账处理</legend>
					<div id="csGatherFcGrid4" class="nui-datagrid"
						style="width: 100%; height: auto;" allowResize="true"
						dataField="csGatherFcs" showSummaryRow="false" showPager="false"
						allowCellEdit="true" allowCellSelect="true" multiSelect="true"
						url="com.primeton.eos.ame_income.cancelBadDebts.getcsGatherFcByFinance.biz.ext"
						ondrawcell="drawGather3">
						<div property="columns">
							
							<div field="gatherno" width="60" align="center"
								headerAlign="center">合同收款编号记录</div>
							<div field="status" width="80" align="center"
								headerAlign="center" renderer="dictstatus">
								收款状态 <input property="editor" align="center"
									headerAlign="center" required="true" class="nui-dictcombobox",
									dictTypeId="AME_GATHERSTATUS" />
							</div>
							<div field="maconfirmday" width="80" align="center"
								headerAlign="center" renderer="onDealDate">
								财报收款日期 <input property="editor" class="nui-datepicker" />
							</div>
							<div field="confirmday" width="80" align="center"
								headerAlign="center" renderer="onDealDate">
								实际收款日期<input property="editor" class="nui-datepicker" />
							</div>

							<div field="billstatus" width="60" align="center"
								headerAlign="center" renderer="dictstatusbill">开票状态</div>
							<div field="gathertype" width="70" align="center"
								headerAlign="center" renderer="dictGatherFcType">收款类型</div>
							<div field="fcsum" width="80" align="right" headerAlign="center"
								dataType="currency" summaryType="sum" currencyUnit="￥">预计收款金额（含税）</div>
							<div field="productsum" width="80" align="right"
								headerAlign="center" dataType="currency" summaryType="sum"
								currencyUnit="￥">预计收款产品金额（含税）</div>
							<div field="servicesum" width="80" align="right"
								headerAlign="center" dataType="currency" summaryType="sum"
								currencyUnit="￥">预计收款服务金额（含税）</div>

						</div>
					</div>
				</fieldset>


			</fieldset>

			<!-- 审核意见  -->
			<jsp:include page="/ame_common/misOpinion.jsp" />
			<fieldset id="field5" style="border: solid 1px #aaa; padding: 3px;">
				<legend>处理意见附件</legend>
				<jsp:include page="/ame_common/addFiles.jsp" />
				<!-- form2 fileCatalog uploadfile remarkList SaveData -->
			</fieldset>
		</div>
	</div>
	<div style="text-align: center; padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="printBad" iconCls="icon-print"
			style="width: 105px; margin-right: 20px;" id="exportButton">打印核销单</a>

		<a class="nui-button" onclick="onOk()"
			style="width: 60px; margin-right: 20px;" id="sureButton">提交</a> <a
			class="nui-button" onclick="onCancel('cancel')" style="width: 60px;"
			id="canelButton">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	
	//处理申请原因
	var applyreasonFrom = new nui.Form("applyreasonFrom");	
	var form_cont = new nui.Form("form_cont");
	//var form_cont1=new nui.Form("form_cont1");
	var  grid_income = nui.get("grid_income")
	var grid_hxjk=nui.get("grid_hxjk")
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	var csGatherFcGrid1 = nui.get("csGatherFcGrid1");
	var csGatherFcGrid4 = nui.get("csGatherFcGrid4");
	var result=[];
	//获取发票信息
	var datagrid3=nui.get("datagrid3");
	var cancelldateFirst;
	var csgather1;
	//文件路径
	 var ContextPath= '<%=request.getContextPath()%>' 
	 init();//页面初始化
	
	var contnum;
	
	function init(){
		promptInit({workItemID: <%=workItemID %>});//流程提示信息
		
		var json={"workItemID": <%=workItemID %>};
		
		//查询合同相关信息
		
			nui.ajax({
    			url:"com.primeton.eos.ame_income.cancelBadDebts.getBadDebtCancellProcess.biz.ext",
    			data: json,
    			type:"post",
    			contentType:"text/json",
    			success:function(data){
    				data = nui.clone(data);
    				//核销申请内容
    				nui.get("applyreason").setValue(data.amebcancell.applyreason); 
    				nui.get("processinstid1").setValue(data.amebcancell.processinstid); 
    				nui.get("cancellapplyid").setValue(data.amebcancell.cancellapplyid);
    				nui.get("cancelltype").setValue(data.amebcancell.cancelltype); 
    				nui.get("contnum1").setValue(data.amebcancell.contnum); 
    				document.getElementById("applyreason1").innerHTML = data.amebcancell.applyreason == null ? "" : data.amebcancell.applyreason;
    			
	    			//合同附件信息
					nui.get("grid_2").load({"groupid":"CS_CONTRACT","relationid": data.csContract.contractid});
                   
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
					contnum=data.csContract.contnum;	
					var csGatherFces =data.csGatherFces;
					var csgatherno=data.amebcancell.gatherno;
					
				    result=csgatherno.split(",");
				    var lee="";
				     for(var q=0;q<result.length;q++){
				     var x= result[q];
				     lee+="'"+x+"',";
				     }
				   var csgatherno88=lee.substring(0,lee.length-1)
				  
				      /*  if(csGatherFces.length!=0){
						
						  for(var q=0;q<csGatherFces.length;q++){
				               var t=csGatherFces[q]
				               csgather1=t.gatherno;
				          for(var i=0;i<result.length;i++){
				             var h=result[i];
				           
				             if(csgather1==h){
								
				             }
				      }   
				      }
					  }
					   */
					
								
					csGatherFcGrid4.load({"contnum": contnum,"csgatherno":csgatherno88});
					var processinstid2=data.amebcancell.processinstid;
					//合同收入记录
					grid_income.load({"csReveForecast": {"contnum": data.csContract.contnum}});
					
					csGatherFcGrid1.load({"csGatherFc":{"contnum": data.csContract.contnum}},function(){//坏账明细
					
					
					 grid_hxjk.load({"processinstid":processinstid2},function(){//坏账明细
					   
	                datagrid3.load({"processinstid1":processinstid2},function(){//发票信息
	              
	                 //加载查询审核意见
					var grid = nui.get("datagrid1");
					grid.sortBy("time", "desc");
					nui.get("backTo").setData(data.csnewbill.backList);
					
	                grid.load({"processInstID":processinstid2},function(){//审批信息
	               	});
	                });
					});
					});
					
					
					
				    nui.get("workitemid").setValue(<%=workItemID %>);
				    nui.get("processinstid").setValue(processinstid2);
	               	nui.get("activitydefid").setValue(data.workItem.activityDefID);
						//流程回退路径赋值 
			            //审核结果设置
					var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
					nui.get("auditstatus").setData(dataStatus);
					nui.get("auditstatus").setValue("1");
					nui.get("auditopinion").setValue("已处理。");
			           
					},
					error:function(jqXHR, textStatus, errorThrown){
						nui.alert("error:" + jqXHR.responseText);
					}
		    			
		    		});
			
				}
	
	function onOk(e){
	 	
		if(e==0){	//终止流程
	    	nui.confirm("确定终止流程吗？", "操作提示",
	            function (action) {            
	                if (action == "ok") {
	                	nui.get("sureButton").setEnabled(false);
	                	//终止流程设置操作为2终止
	                	nui.get("auditstatus").setValue(2);
						form2.submit();
					}else{
						nui.get("sureButton").setEnabled(true);
						return;
					}
				}
			);
		}else{
		
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
	             		form2.submit();
					}else{
						nui.get("sureButton").setEnabled(true);
						return;
					}
				}
			
			); 
		}
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
		var cancelltype1 = nui.get("cancelltype").getValue();
	
		//工作项ID
		var workItemID = nui.get("workItemID").getValue();
		//坏账核销明细
		 var data1 = grid_hxjk.getChanges();
		 //
		 var data2=grid_hxjk.getData();
	   //收款记录
	   var csGatherFcGrid=csGatherFcGrid4.getData();
		//发票信息
		var row2 = datagrid3.getData();
		//合同信息
		var formcont1Data = form_cont.getData();
		var csContract =formcont1Data.csContract;
		//发起页面的处理信息
		var opioionformData = opioionform.getData();
		var misOpinion = opioionformData.misOpinion;
		//申请原因
		var applyreasonData= applyreasonFrom.getData();
		var applyreason= applyreasonData.amebcancell;
		//传json值
		var json={data2:data2,csGatherFcGrid:csGatherFcGrid,data1:data1,row2:row2,misOpinion:misOpinion,workItemID:workItemID,applyreason:applyreason,cancelltype1:cancelltype1,csContract:csContract}
		
		nui.ajax({
			url:"com.primeton.eos.ame_income.cancelBadDebts.submitBadDebtCancellByFinanceDeal.biz.ext",
			data: json,
			type:"post",
			contentType:"text/json",
			success:function(o){
				o = nui.clone(o);
				if(o.exception == null){
					if(o.ret=="1"){
					nui.alert("提交失败！收款状态填写错误！");
					nui.get("sureButton").setEnabled(true);
					}else{
					nui.alert("提交成功！","操作提示",function(){
						CloseWindow("ok");
					});
					
					}
					
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
	
	
   //是否有未确认收入且无法退回的发票:
	function showTicket(e){
	
	    var rows = csGatherFcGrid1.getSelecteds();
	
		 if(rows.length!=0){
		datagrid3.load({"rows":rows,"contnum":contnum});
		}else{
		nui.alert("请选择收款记录！")	;	
		} 
		} 
		
	/* 
	function showTicket1(){
	  var rows = csGatherFcGrid1.getSelecteds();
	  var haveTicket = nui.get("haveTicket").getValue();
	      if(rows.length!=0){
				if(haveTicket=='1'){
				datagrid3.load({"rows":rows,"contnum":contnum});
				}else{
				document.getElementById("datagrid3").style.display = "none";
				}
		}else{
		alert("请选择收款记录！")	;	
		
		}	
	} */

	
   //时间规则判断
			function calDays(e){
		
			var column=e.column;
			var record=e.record;
			var field = e.field;
			var row = grid_hxjk.getRowByUID(record._uid);
			if(e.field=="incomecontime" || e.field=="cancelldate" ){
				if(record.incomecontime && record.cancelldate ){
					cancellDays(record.incomecontime,record.cancelldate,record._uid);
				}
			}
				//开始日期不能大于结束日期
			if(e.field=="incomecontime"){
				if(record.cancelldate){
					if(record.incomecontime>record.cancelldate){
						nui.alert("开始日期不能大于结束日期，请重新填写!")
						var rowData={incomecontime:null};
						grid_hxjk.updateRow(row,rowData);
					}
				}
			}
			if(e.field=="cancelldate"){
				if(record.incomecontime){
					if(record.incomecontime>record.cancelldate){
						nui.alert("开始日期不能大于结束日期，请重新填写!")
						var rowData={cancelldate:null};
						grid_hxjk.updateRow(row,rowData);
					}
				}
			}
			
			/* if(e.field=="cancellmoney"){
			if(column.summaryValue){
			    totalsum(e);
			}
			} */
			}


	   //计算账龄天数
		function cancellDays(incomecontime,cancelldate,uid){
			var json = {incomecontime:incomecontime,cancelldate:cancelldate};
	  		nui.ajax({	
		    	url: "com.primeton.eos.ame_income.cancelBadDebts.getCancellDate.biz.ext",
	            type: 'POST',
	            data: json,
	            success: function (text) {
	            	var row = grid_hxjk.getRowByUID(uid);
	            	var mounth=parseInt(text.days/30);
	            	if (mounth==0){
	            	mounth="";
	            	var day1=text.days-mounth*30;
	            	var rowData={accountage:day1+"天"};
	            	grid_hxjk.updateRow(row,rowData);
	            	} else{
	            	var day1=text.days-mounth*30;
	            	var rowData={accountage:mounth+"个月"+day1+"天"};
					grid_hxjk.updateRow(row,rowData);
	            	
	            	
	            	}
	            	
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
	        });
		}



//是否有发票
	function isRecover1(e){
		return nui.getDictText('MIS_YN',e.value);
	}
//显示问题
  /* 	function drawGather(e){
			 	if(e.record.status!='0' && e.field == "aaa"){
				 	 e.cellHtml="";
			 	}
			 	if( e.record.gatherno==csgather1 && (e.field=="gatherno"||e.field=="status"||e.field=="billstatus"||e.field=="gathertype"||e.field=="newyearmonth"
			 	||e.field=="fcsum"||e.field=="productsum"||e.field=="servicesum"||e.field=="fcreverate"||e.field=="actsum"||e.field=="confirmday")){
			 	
			 	e.cellStyle = "background: yellow";
			 	
			 	}
			 
			 }	 */
			 
			 
	 function drawGather1(e){
				var field = e.field;
				var record=e.record;
			 	if("isrecover" == field){
			 	e.cellStyle = "background: yellow";
			 	}
				if("suresaleid"==field){
			 	e.cellHtml = "";
			 	}
			 }
			 
			 
	 	/* function drawGather3(e){
	 	
	 
			 	if(e.record.status!='0' && e.field == "aaa"){
				 	 e.cellHtml="";
			 	}
			 	if( e.record.gatherno==csgather1 && (e.field=="gatherno"||e.field=="status"||e.field=="billstatus"||e.field=="gathertype"||e.field=="newyearmonth"
			 	||e.field=="fcsum"||e.field=="productsum"||e.field=="servicesum"||e.field=="fcreverate"||e.field=="actsum"||e.field=="confirmday"||e.field=="maconfirmday")){
			 	e.cellStyle = "background: yellow";
			 	}
			 	if( e.record.gatherno==csgather1 && (e.field=="status"||e.field=="confirmday"||e.field=="maconfirmday")){
			 	e.cellStyle = "background: red";
			 
			 	}
			 
			 } */
			 
			 
		 function drawGather3(e){
	 	if(e.record.status!='0' && e.field == "aaa"){
		 	 e.cellHtml="";
	 	}
	 	for (i=0;i<result.length;i++){
	 	var rr=result[i];
	 
	 	if( e.record.gatherno==rr  && (e.field=="status"||e.field=="confirmday"||e.field=="maconfirmday")){
	 	e.cellStyle = "background: yellow";
	 	}
	 }
	 }			 
			 
	function badDebtShow(){
	 var cancelltype1 = nui.get("cancelltype").getValue();
	if(cancelltype1=="baddebt"){
	document.getElementById("isShow").style.display="";
	
	}else{
	
	document.getElementById("isShow").style.display="none";
	nui.alert("请联系商务");
	
	}
	
	}
	
	
	//dataGrid列选中是进行判断是否可编辑
    	/*  function rowclick(e){
    	
    		var row=csGatherFcGrid4.getSelected ( );
    		var gatherno1=row.gatherno;
    		if(gatherno1==csgather1){
    			csGatherFcGrid4.setAllowCellEdit(true);       //@Review   看看visible后是否还需要enable
    		}
    		else {
    			csGatherFcGrid4.setAllowCellEdit(false); 
    		}
    			
    	}  */
    	
    
    
    function saveBadDebt(){
    
    	//工作项ID
		    var workItemID = nui.get("workItemID").getValue();
		//坏账核销明细
		    var data1 = grid_hxjk.getChanges();
		    //申请原因
		    var applyreasonData1= applyreasonFrom.getData();
		    var applyreason2= applyreasonData1.amebcancell;
		 //
	 		var json = {workItemID:workItemID,data1:data1,applyreason:applyreason2};
	  		nui.ajax({	
		    	url: "com.primeton.eos.ame_income.cancelBadDebts.saveBadDebtDetailsFinal.biz.ext",
	            type: 'POST',
	            data: json,
	            success: function (o) {
	            o = nui.clone(o);
				if(o.exception == null){
					nui.alert("保存成功！");
				}else{
					nui.alert("保存失败！");
					nui.get("sureButton").setEnabled(true);
				}
			     },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
	        });
    
    
    
    
    
    }
    
   
	function printBad(){
		nui.confirm("请确定是否已经保存坏账核销或合同减值明细","操作提示",function (action){
		if(action == "ok"){
		var contractid = document.getElementById("contractid").innerHTML;
        	var cancelltype = nui.get("cancelltype").getValue();
	    	var processinstid = nui.get("processinstid").getValue();
			var url = "<%=request.getContextPath() %>/contract/cancelBadDebts/printBadDebt.jsp?contractid="+ contractid+ "&cancelltype="+ cancelltype+ "&processinstid=" + processinstid;
			var title = "打印";
			window.open(url);
	
		}
		});
		
		}

			
</script>
<script
	src="<%=request.getContextPath()%>/ame_income/gatherFcBillingProcess/js/gatherFcBillingjs.js"
	type="text/javascript"></script>
<script
	src="<%=request.getContextPath()%>/contract/cancelBadDebts/js/cancellBadDebt.js"
	type="text/javascript"></script>

</html>