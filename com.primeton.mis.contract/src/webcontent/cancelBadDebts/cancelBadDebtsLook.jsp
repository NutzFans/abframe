<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%> 
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-12-28 14:00:02
  - Description:
-->
<head>
	<title>坏账核销或减值申请明细</title>
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<link id="css_skin" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/coframe/tools/skins/skin1/style.css" />
	<link href="../demo.css" rel="stylesheet" type="text/css" /><style type="text/css">
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
<body>
	<div class="nui-fit">
	<form id="form_cont" method="post">
		<input name="csContract.contractid" id="contractid" class="nui-hidden" />
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
		</form>	
		<fieldset  id="field6" style="border:solid 1px #aaa;padding:3px;width: 100%;">
	    	<legend>合同附件</legend>
	    	<jsp:include page="/ame_common/detailFile3.jsp"/>
    	</fieldset>
		<jsp:include page="/contract/cancelBadDebts/badDebtCommon1.jsp"></jsp:include>
		<fieldset style="border: solid 1px #aaa; padding: 3px; ">
		<legend>申请原因</legend>
		<form id="applyreasonFrom" method="post">
			<div style="padding: 5px;" id="opinionHide3">
				<table style="table-layout: fixed;">
				<input name="amebcancell.applyreason" id="applyreason" class="nui-hidden"/>
				<input name="amebcancell.processinstid" id="processinstid1" class="nui-hidden"/>
				<input name="amebcancell.cancellapplyid" id="cancellapplyid" class="nui-hidden"/>
				<input name="amebcancell.contnum" id="contnum1" class="nui-hidden"/>
				<input name="amebcancell.cancelltype" id="cancelltype" class="nui-hidden"/>
				<input name="amebcancell.gatherno" id="gatherno" class="nui-hidden"/>
			       <tr>
						<td
							style="width: 60px; height: auto; color: red; font-size: 130%"
							align="right"><b>原因：</b></td>
						<td id="applyreason1" class="nui-textarea" required="true"
							style="width: 240px; height: auto; font-size: 130%; padding: 20px"
							align="left" />
					</tr>
				</table>
			</div>
		</form>
		</fieldset>
		
		<fieldset style="border: solid 1px #aaa; padding: 3px; ">
		<legend>坏账核销或者合同减值处理明细</legend>
			<div id="grid_hxjk" class="nui-datagrid"
				style="width: 100%; height: auto;" allowResize="true"
				url="com.primeton.eos.ame_income.cancelBadDebts.getBadDebtDetail.biz.ext"
				dataField="baddebtdetails" allowCellSelect="true"
				showPager="false" allowCellEdit="true" multiSelect="true"
				showSummaryRow="true" ondrawsummarycell="doCsGatherFcSum"  oncellendedit="calDays"
				onselect="onselectHx">
				<div property="columns">
					<div field="incomecontime" width="110" align="center"  renderer="onDealDate1"headerAlign="center" >收入确认时间 </div>
					<div field="cancellmoney" name="cancellmoney"dataType="currency" width="110" align="center" summaryType="sum">核销金额 </div>
					<div field="cancelldate" width="110" align="center"  renderer="onDealDate1"headerAlign="center" >核销时间 </div>
					<div field="accountage" width="110" align="center"headerAlign="center" >账龄</div>
					<div field="cancelltype" name="cancelltype"width="110" align="center" renderer="dictcancelltype">处理类型 </div>
					<div field="remark" name="remark"width="110" align="center">备注说明</div>
				</div>
			</div>
		</fieldset>
		<fieldset style="border: solid 1px #aaa; padding: 3px;" id="tickettable">
			<legend>关联的发票列表</legend>
			<div id="datagrid3" class="nui-datagrid"
				style="width: 100%; height: auto;" allowResize="true"
				url="com.primeton.eos.ame_income.cancelBadDebts.getBadDebtBillDetails.biz.ext"
				dataField="queryBadDebtTicketDEtails" showPager="false"
				allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
				editNextOnEnterKey="true" onlyCheckSelection="true" showSummaryRow="true" ondrawsummarycell="ticketTaxSum"  ondrawcell="drawGather1"
				onselectionchanged="totalsum">
				<div property="columns">
					<div field="billdate" width="80" dateFormat="yyyy-MM-dd"
						align="center" headerAlign="center" allowSort="true">开票日期</div>
					<div field="notax" width="110" dataType="currency"
						summaryType="sum" align="right" headerAlign="center"
						allowSort="true">不含税金额</div>
					<div field="tax" width="110" dataType="currency" summaryType="sum"
						align="right" headerAlign="center" allowSort="true">税金</div>
					<div field="money" width="110" dataType="currency"
						summaryType="sum" align="right" headerAlign="center"
						allowSort="true">含税金额</div>
					<div field="isrecover" width="80" align="center" id="isrecover"
						headerAlign="center" renderer="isRecover1">是否可以收回发票
						<input property="editor" align="center" headerAlign="center"  class="nui-dictcombobox" dictTypeId="MIS_YN" />
					</div>
				</div>
			</div>
		</fieldset>
		<%-- <fieldset id="file" style="width: 96%;">
			<legend>附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</fieldset> --%>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
	<div style="text-align: center;padding: 10px;border-width:1px 0px 0px 0px;" class="nui-toolbar" id="s1">
		<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>  
	</div>  
</body>
<script type="text/javascript">
	nui.parse();
  	var csgather1;
	var result=[];
	var form_cont = new nui.Form("form_cont");
	var grid_income = nui.get("grid_income");
	var grid_hxjk=nui.get("grid_hxjk");
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	var csGatherFcGrid1 = nui.get("csGatherFcGrid1");
	//获取发票信息
	var datagrid3=nui.get("datagrid3");
	//处理申请原因
	var applyreasonFrom = new nui.Form("applyreasonFrom");
	var processInstID = <%=request.getParameter("processInstID") %>;
	var type = <%=request.getParameter("type") %>;
	
	
	var csticket22;
	var contnum;
	init();
	function init(){
		form_cont.mask("数据加载中...");
    	//流程提示信息
		var data1={"processInstID":processInstID};
		var json=nui.encode(data1);
  		nui.ajax({//获取资产采购申请信息
      		url: "com.primeton.eos.ame_income.cancelBadDebts.getBadDebtCancellProcess.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			form_cont.unmask();
       	  		var data = nui.clone(o);
				//核销申请内容
				nui.get("gatherno").setValue(data.amebcancell.gatherno); 
				nui.get("applyreason").setValue(data.amebcancell.applyreason); 
				nui.get("processinstid1").setValue(data.amebcancell.processinstid); 
				nui.get("cancellapplyid").setValue(data.amebcancell.cancellapplyid);
				nui.get("cancelltype").setValue(data.amebcancell.cancelltype); 
				nui.get("contnum1").setValue(data.amebcancell.contnum); 
            	document.getElementById("applyreason1").innerHTML = data.amebcancell.applyreason == null ? "" : data.amebcancell.applyreason;
			
    			nui.get("gatherno").setValue(data.amebcancell.gatherno); 
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
					
				csticket22=data.csticket;
				var csGatherFces =data.csGatherFces;
				var csgatherno=data.amebcancell.gatherno;
				result=csgatherno.split(",");
				      
				var processinstid2=data.amebcancell.processinstid;
				//合同收款记录
				csGatherFcGrid1.load({"csGatherFc": {"contnum": data.csContract.contnum}});
				//合同收入记录
				grid_income.load({"csReveForecast": {"contnum": data.csContract.contnum}});
				grid_hxjk.load({"processinstid":processinstid2},function(){//坏账明细
	                //加载查询审核意见
					var grid = nui.get("datagrid1");
					grid.sortBy("time", "desc");
	                grid.load({"processInstID":processinstid2},function(){//审批意见信息
	                
						datagrid3.load({"processinstid1":processinstid2},function(){//发票信息
						});
	                });
				});
				if(csticket22 && csticket22.length>0){
					document.getElementById("tickettable").style.display="";
				}else{
					document.getElementById("tickettable").style.display="none";
				}
				if(type != "1"){
					document.getElementById("closeWin").style.display = "none";
				}
				$("#opinionHide").hide();
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
    	
	}
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
	//关闭
   	function onCancel(){
		CloseWindow("cancel");
	}
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
</script>
<script src="<%= request.getContextPath() %>/ame_income/gatherFcBillingProcess/js/gatherFcBillingjs.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/contract/cancelBadDebts/js/cancellBadDebt.js" type="text/javascript"></script>
</html>