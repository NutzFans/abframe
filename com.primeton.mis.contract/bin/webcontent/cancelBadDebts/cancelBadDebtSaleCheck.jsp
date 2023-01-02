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
	<title>坏账核销或减值申请审批流程-销售确认</title>
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
	<div class="nui-fit">
		<div class="nui-panel" title="坏账核销或减值申请流程" style="width: auto">
			<jsp:include
				page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp" />
			<form id="form_cont" method="post">
				<input class="nui-hidden" id="workItemID" value="<%=workItemID %>"/>
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
					<span style="color:red"><b>提示:以下显示黄色部分为要申请坏账核销或者合同减值的收款列</b></span>
					<div id="csGatherFcGrid1" class="nui-datagrid"
						style="width: 100%; height: auto;" allowResize="true"
						dataField="csGatherFcs" showSummaryRow="false" showPager="false"
						url="com.primeton.eos.ame_income.cancelBadDebts.getCsGatherFc.biz.ext"
						multiSelect="true" onselectionchanged="showTicket" ondrawcell="drawGather" onlyCheckSelection="true"  allowUnselect="true">
						<div property="columns">
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
					
					<tr>
							<!-- <td style="width: 149px; height: auto;color:red" align="right"><b>申请核销类型：</b></td>
							<td colspan="1">
							<input name="amebcancell.cancelltype" id="cancelltype" class="nui-dictcombobox" value="baddebt"  required="true" dictTypeId="AME_CANCELLTYPE" />
							</td> -->
							<td style="width: 64px; height: auto;color:red" align="right"><b>申请原因：</b></td>
							<td colspan="8"><input name="amebcancell.applyreason"
								id="applyreason" class="nui-textarea" required="false"
								style="width: 600px; height: 60px;" /></td>
						</tr>
					</table>
				</div>
			</form>
	
				
		<!-- 审核意见  -->
		<jsp:include page="/ame_common/misOpinion.jsp"/>
		<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
			<legend>处理意见附件</legend>
			<jsp:include page="/ame_common/addFiles.jsp"/>
			<!-- form2 fileCatalog uploadfile remarkList SaveData -->
		</fieldset>
	   </div>
	   </div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" style="width: 60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width: 60px;" id="canelButton">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	//表单
	 //审核意见的表单
	var opioionform = new nui.Form("opioionform");
	//处理申请原因
	var applyreasonFrom = new nui.Form("applyreasonFrom");
	
	var form_cont = new nui.Form("form_cont");

	var  grid_income = nui.get("grid_income")
	
	var csGatherFcGrid1 = nui.get("csGatherFcGrid1");
	//获取发票信息
	var datagrid3=nui.get("datagrid3");
	var result=[];
	var csgather1 =[]; 
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
    				nui.get("cancelltype").setValue(data.amebcancell.cancelltype);
    				nui.get("processinstid1").setValue(data.amebcancell.processinstid); 
    				nui.get("cancellapplyid").setValue(data.amebcancell.cancellapplyid);
    				nui.get("contnum1").setValue(data.amebcancell.contnum); 
    				
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
					
					var w=data.csContract;
					
					 var csGatherFces =data.csGatherFces;
					 var csgatherno=data.amebcancell.gatherno;
				      result=csgatherno.split(",");
					console.log(result+"11")
				      /*  if(csGatherFces.length!=0){
						
						  for(var q=0;q<csGatherFces.length;q++){
				               var t=csGatherFces[q]
				            var   csgather2=t.gatherno;
				               console.log(csgather1)
				               csgather1.push(csgather2);
				                    console.log(result)
				          for(var i=0;i<result.length;i++){
				             var h=result[i];
				             if(csgather1==h){
				             	//合同收款记录
					          	 contnum=data.csContract.contnum;			
								//合同收款记录
								csGatherFcGrid1.load({"csGatherFc": {"contnum": data.csContract.contnum}});
								
				             }
				      } */   
				     // }
					  //}
				
					 contnum=data.csContract.contnum;			
						//合同收款记录
					csGatherFcGrid1.load({"csGatherFc": {"contnum": data.csContract.contnum}});
					
						//合同收入记录
					grid_income.load({"csReveForecast": {"contnum": data.csContract.contnum}});
					
					  var processinstid=data.amebcancell.processinstid;
				
					   
	                datagrid3.load({"processinstid1":processinstid},function(){//发票信息
	                
	                
					//加载查询审核意见
					var grid = nui.get("datagrid1");
					grid.sortBy("time", "desc");
					grid.load({"processInstID":processinstid},function(){//发票信息
				 	
					 });
	                
	                });
				
					
					
					
				    nui.get("workitemid").setValue(<%=workItemID %>);
				    nui.get("processinstid").setValue(processinstid);
				    nui.get("activitydefid").setValue(data.workItem.activityDefID);
				    
					//流程回退路径赋值 
		             nui.get("backTo").setData(data.csnewbill.backList);
		            //审核结果设置
					var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
					nui.get("auditstatus").setData(dataStatus);
					nui.get("auditstatus").setValue("1");
					nui.get("auditopinion").setValue("同意。");
		           
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
		var workItemID = nui.get("workItemID").getValue();
		//发票信息
		var row2 = datagrid3.getData();
		//申请信息详情
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
		//传json值
		var json={row2:row2,misOpinion:misOpinion,applyreason:applyreason,csContract:csContract,workItemID:workItemID}
		nui.ajax({
			url:"com.primeton.eos.ame_income.cancelBadDebts.badDebtCancllSaleCheck.biz.ext",
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
    
  //是否有未确认收入且无法退回的发票:
	function showTicket(e){
	
	    var rows = csGatherFcGrid1.getSelecteds();
		 if(rows.length!=0){
		datagrid3.load({"rows":rows,"contnum":contnum});
		}else{
		nui.alert("请选择收款记录！")	;	
		} 
		} 
	//是否有发票
	function isRecover1(e){
		return nui.getDictText('MIS_YN',e.value);
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
 	function drawGather(e){
				console.log(result+"22")
			 	for (i=0;i<result.length;i++){
			 	var rr=result[i];
			 	if( e.record.gatherno==rr && (e.field=="gatherno"||e.field=="status"||e.field=="billstatus"||e.field=="gathertype"||e.field=="newyearmonth"
			 	||e.field=="fcsum"||e.field=="productsum"||e.field=="servicesum"||e.field=="fcreverate"||e.field=="actsum"||e.field=="confirmday")){
			 	e.cellStyle = "background: yellow";
			 	}
			 }
			 }	 
</script>
<script src="<%= request.getContextPath() %>/contract/cancelBadDebts/js/cancellBadDebt.js" type="text/javascript"></script>

</html>