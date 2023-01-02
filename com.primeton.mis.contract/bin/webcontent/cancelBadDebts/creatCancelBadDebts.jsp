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
<title>发起坏账核销或合同减值申请</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js"
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
	<div class="nui-fit">
		<div class="nui-panel" title="发起坏账核销或合同减值申请流程" style="width: auto">
			<jsp:include
				page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp" />
			<form id="form_cont" method="post">
				<input name="csContract.contractid" id="contractid"
					class="nui-hidden" />
					<!-- <input name="csContract.contnum" id="contnum"
					class="nui-hidden" /> -->
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
                <fieldset  id="field6" style="border:solid 1px #aaa;padding:3px;width: 100%;">
		    	<legend>合同附件</legend>
		    	<jsp:include page="/ame_common/detailFile3.jsp"/>
		    	</fieldset>
				<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<legend>合同收入记录列表</legend>
					<div id="grid_income" class="nui-datagrid"
						style="width: 100%; height: auto;" allowResize="false"
						dataField="csReveForecasts"
						url="com.primeton.eos.ame_income.cancelBadDebts.getCsReveForecast1.biz.ext"
						allowCellSelect="true" showPager="false" idField="appid"
						onselectionchanged="selectionChanged" multiSelect="false">
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
					<span style="color:red"><b>提示:请选择以下收款列表中无法收回的款项，允许多选</b></span>
					<div id="csGatherFcGrid1" class="nui-datagrid"
						style="width: 100%; height: auto;" allowResize="true"
						dataField="csGatherFcs" showSummaryRow="false" showPager="false"
						url="com.primeton.eos.ame_income.cancelBadDebts.getCsGatherFc.biz.ext"
						multiSelect="true" onselectionchanged="showTicket" ondrawcell="drawGather5" onlyCheckSelection="true"  allowUnselect="true">
						<div property="columns">
							<div field="aaa" type="checkcolumn" width="25"></div>
							<div field="gatherno" width="60" align="center"
								headerAlign="center">收款次数</div>
							<div field="status" width="60" align="center"
								headerAlign="center" renderer="dictstatus">收款状态</div>
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
						</div>
					</div>
				</fieldset>
			</form>
			<fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>关联的发票列表</legend>
			<div id="datagrid3" class="nui-datagrid"
				style="width: 100%; height: auto;" allowResize="true"
				url="com.primeton.eos.ame_income.cancelBadDebts.getBadDebtBillDetails.biz.ext"
				dataField="queryBadDebtTicketDEtails" showPager="false"
				allowCellEdit="true" allowCellSelect="true" multiSelect="true"
				editNextOnEnterKey="true" onlyCheckSelection="true" showSummaryRow="true" ondrawsummarycell="ticketTaxSum" ondrawcell="drawGather1"
				onselectionchanged="totalsum">
				<div property="columns">
				   <div field="billdate" width="80" dateFormat="yyyy-MM-dd"
						align="center" headerAlign="center" allowSort="true">开票日期</div>
					<div field="billno" width="80" 
						align="center" headerAlign="center" allowSort="true">发票号</div>
					<div field="gatherno" width="80" 
						align="center" headerAlign="center" allowSort="true">收款次数</div>
					<div field="notax" width="110" dataType="currency"
						summaryType="sum" align="right" headerAlign="center"
						allowSort="true">不含税金额</div>
					<div field="tax" width="110" dataType="currency" summaryType="sum"
						align="right" headerAlign="center" allowSort="true">税金</div>
					<div field="money" width="110" dataType="currency"
						summaryType="sum" align="right" headerAlign="center"
						allowSort="true">含税金额</div>
					<div field="isrecover" width="80" align="center" id="isrecover"
						headerAlign="center" renderer="isRecover1"  style="background:yellow!important;">是否可以收回发票
						<input property="editor" align="center" headerAlign="center" required="true" style="background:yellow!important;" class="nui-dictcombobox" dictTypeId="MIS_YN" />
					</div>
				</div>
			</div>
			</fieldset>
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
							<!-- <td style="width: 149px; height: auto;color:red" align="right"><b>申请核销类型：</b></td>
							<td colspan="1">
							<input name="amebcancell.cancelltype" id="cancelltype" class="nui-dictcombobox" value="baddebt"  required="true" dictTypeId="AME_CANCELLTYPE" />
							</td> -->
							<td style="width:63px; height: auto;color:red" align="right"><b>申请原因：</b></td>
							<td colspan="8"><input name="amebcancell.applyreason"
								id="applyreason" class="nui-textarea" required="false"
								style="width: 600px; height: 60px;" /></td>
						</tr>
					</table>
				</div>
			</form>
			
			<form id="opioionform" method="post">
				<div style="padding: 5px;" id="opinionHide">
					<table style="table-layout: fixed;">
						<input name="misOpinion.auditstatus" id="auditstatus" class="nui-hidden"/>
						<tr>
							<td style="width: 150px; height: auto;" align="right">任务处理说明：</td>
							<td colspan="3"><input name="misOpinion.auditopinion"
								id="auditopinion" class="nui-textarea" required="false"
								style="width: 600px; height: 60px;" /></td>
						</tr> 
					</table>
				</div>
			</form>
		</div>
	</div>

	<div style="text-align: center; padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk('app')"
			iconCls="icon-organization" style="width: 135px; margin-right: 20px;"
			id="appButton">发起审批流程</a> <a class="nui-button"
			onclick="onOk('save')" iconCls="icon-save"
			style="width: 95px; margin-right: 20px;" id="saveButton">暂时保存</a> <a
			class="nui-button" onclick="onCancel" iconCls="icon-close"
			style="width: 60px;">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	//表单
	var form_cont = new nui.Form("form_cont");
	var  grid_income = nui.get("grid_income")
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	//处理申请原因
	var applyreasonFrom = new nui.Form("#applyreasonFrom");
	
	var csGatherFcGrid1 = nui.get("csGatherFcGrid1");
	var contnum = '<%=request.getParameter("contnum")%>';
	//获取发票信息
	var datagrid3=nui.get("datagrid3");

	 //合同收入记录
	
	//登陆人用户信息
	var ContextPath= '<%=request.getContextPath()%>' 
	<%UserObject user = (UserObject) session.getAttribute("userObject");
			String username = user.getUserName();
			String userno = user.getUserId();%>
	init();//页面初始化
	document.getElementById("opinionHide").style.display = "none";
	
	
	function init(){
		promptInit({"workItemID":0,"processDefName":"com.primeton.mis.contract.cancelBadDebts","activityDefID":"manualActivity"});
		//流程审批意见状态设置为3（发起）
		nui.get("auditstatus").setValue(3);
		var json ={"contnum": contnum};
		//查询合同相关信息
		if(contnum){
			nui.ajax({
    			url:"com.primeton.eos.ame_income.cancelBadDebts.getContract.biz.ext",
    			data:json,
    			type:"post",
    			contentType:"text/json",
    			success:function(data){
    				data = nui.clone(data);
    				if(data.amebcancell){
    				//核销申请内容
    				nui.get("applyreason").setValue(data.amebcancell.applyreason); 
    				nui.get("processinstid1").setValue(data.amebcancell.processinstid); 
    				nui.get("cancellapplyid").setValue(data.amebcancell.cancellapplyid);
    				nui.get("gatherno").setValue(data.amebcancell.gatherno);
    				nui.get("contnum1").setValue(data.amebcancell.contnum);  
    				
    				}
    				  
    				//合同基本信息
    				 //加载附件设置参数
                    nui.get("grid_2").load({"groupid":"CS_CONTRACT","relationid": data.csContract.contractid});
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
					//document.getElementById("applyreason").innerHTML = data.amebcancell.applyreason == null ? "" : data.amebcancell.applyreason ;
					//document.getElementById("cancelltype").innerHTML = data.amebcancell.cancelltype == null ? "" : nui.getDictText('AME_CANCELLTYPE',data.amebcancell.cancelltype);
					
					//合同收款记录
					
					 csGatherFcGrid1.load({"csGatherFc": {"contnum": contnum}}); 
					 grid_income.load({"csReveForecast":{"contnum": contnum}});
    			}
    		});
		}
		}
	
		
		//发起流程还是暂时保存
		 var operate;
		 function onOk(e){
		 var auditopinion = nui.get("auditopinion").getValue();
	/* 	var haveTicket= nui.get("haveTicket").getValue();
		if(haveTicket=='1'){
			nui.alert("提醒：记得联系客户要回发票!");
		} */
    	var row3 = datagrid3.getData();
		
		for (var i = 0, l = row3.length; i < l; i++) {
	                    	var row = row3[i];
	                    	var isrecover = row.isrecover;
	                    	
	                    	if(isrecover==null){
	                    	nui.alert("请判断是否能收回发票！");
	                    	 	return;
	                    	}
	                    	}
    	if(!form_cont.validate()){
			nui.alert("信息录入不完整!");
			return;
		}else{
    		operate = e;
		}
		 SaveData();
	}
		
	//开始
	function SaveData(){
	    var applyreason2=  nui.get("applyreason").getValue();
		//合同收款的记录编号
		var csgathergr = csGatherFcGrid1.getSelecteds();
		//发票信息
		
	    var row2 = datagrid3.getData();
		
		for (var i = 0, l = row2.length; i < l; i++) {
								
	                    	var row = row2[i];
	                    	var isrecover = row.isrecover;
	                    	if(isrecover=="1"){
	                    	nui.alert("存在可收回发票！请尽快要回发票");
	                    	 
	                    	}
	                    	} 
	     
	            	
		//服务信息
		//操作-app：发起流程，save：暂时保存
		var message = "发起";
		if(operate == "save"){
			message = "暂时保存";
		}
		//合同信息
		var formcont1Data = form_cont.getData();
		var csContract =formcont1Data.csContract;
		//发起页面的处理信息
		//审批意见
		var opioionformData = opioionform.getData();
		var misOpinion = opioionformData.misOpinion;
		//申请原因
		var applyreasonData= applyreasonFrom.getData();
			
		var applyreason= applyreasonData.amebcancell;
			
		//判断是坏账还是减值流程
		var msg ="坏账/减值";
		
		//传json值
		var json={operate:operate,row2:row2, misOpinion:misOpinion,applyreason2:applyreason2,applyreason:applyreason,csContract:csContract,csgather:csgathergr}
		
		
		nui.confirm("确定要"+message+msg+"处理审批流程吗？","操作提示",function (action){
			if(action == "ok"){
			 mini.mask({
             el: document.body,
             cls: 'mini-mask-loading',
             html: message+'中...'
              });
	    		nui.ajax({
	    			url:"com.primeton.eos.ame_income.cancelBadDebts.badDebtCancellProcessCreat.biz.ext",
	    			data: json,
	    			type:"post",
	    			contentType:"text/json",
	    			success:function(action){
	    			    nui.unmask();	    			
	    				action = nui.clone(action);
	    				if(action.exception == null){
	    					
				        	if(operate == "app"){
	                   	nui.alert("发起坏账核销审批流程成功！","系统提示",function (){
	                   		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
	                   	});
    					}  else if(operate == "save"){
    					nui.alert("暂时保存成功！","系统提示",function (){
    						window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
    					});
    					}
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
	 //是否有未确认收入且无法退回的发票:
	function showTicket(e){
	
	    var rows = csGatherFcGrid1.getSelecteds();
		if(rows.length!=0){
		datagrid3.load({"rows":rows,"contnum":contnum});
		}else{
		nui.alert("请选择收款记录！")	;	
		} 
		} 
		
	 
    //是否有未确认收入且无法退回的发票:
	function showTicket1(e){
	
	    var rows = csGatherFcGrid1.getSelecteds();
	     checkSubmit();
	  
		/* if(rows.length!=0){
		datagrid3.load({"rows":rows,"contnum":contnum});
		}else{
		nui.alert("请选择收款记录！")	;	
		} */
		} 
		
	
	
	
	
	
	
 function checkSubmit(){
       var rows = csGatherFcGrid1.getSelecteds();
        var applyreasonData= applyreasonFrom.getData();
			
		var applyreason= applyreasonData.amebcancell;
	    var csgatherno=applyreason.gatherno;
	
        var result=csgatherno.split(",");
       if(rows.length!=0){
		
		  for(var q=0;q<rows.length;q++){
               var t=rows[q]
               var csgather1=t.gatherno;
          for(var i=0;i<result.length;i++){
             var h=result[i];
             if(csgather1==h){
               nui.alert("您已经发起过坏账核销流程,不能重复发起,请确认！");
               nui.get("appButton").disable();
				nui.get("saveButton").disable();
		        return;	
             }else{
				datagrid3.load({"rows":rows,"contnum":contnum});
				 nui.get("appButton").enable();
				 nui.get("saveButton").enable();
             }
      }   
      }
	  }  
	  else{
			nui.alert("请选择收款记录！")	;	
				}   
      }
	
 function drawGather5(e){
 	if(e.record.status!='0' && e.field == "aaa"){
	 	 e.cellHtml="";
	 	 document.getElementById("mini-35checkall").style.display="none";
 	}
 	
 	
 }
 
  function drawGather1(e){
	var field = e.field;
	var record=e.record;
 	if("isrecover" == field){
 	e.cellStyle = "background: yellow";
 	} 
 		
 }
 
//是否有发票
	function isRecover1(e){
		return nui.getDictText('MIS_YN',e.value);
	}

	//设置业务字典-收入状态
		function dictstatus1(e){
			return nui.getDictText("AME_REVESTATUS",e.value);
  }

</script>
	<script
	src="<%=request.getContextPath()%>/contract/cancelBadDebts/js/cancellBadDebt.js"
	type="text/javascript"></script>
	

</html>