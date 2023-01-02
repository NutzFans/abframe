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
	<title>坏账核销审批流程-事业部领导审批</title>
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
		<div class="nui-panel" title="坏账核销事业部领导审批" style="width: auto">
			<jsp:include
				page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp" />
			<form id="form_cont" method="post">
				<input class="nui-hidden" id="workItemID" value="<%=workItemID %>"/>
				<input name="csContract.contractid" id="contractid"
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
				<jsp:include page="/contract/cancelBadDebts/badDebtCommon1.jsp"></jsp:include>
			
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
			 </form>
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
							<div field="gatherno" width="60" align="center"
								headerAlign="center">合同收款编号记录</div>
							<div field="cancellmoney" name="cancellmoney"
								dataType="currency" width="110" align="center" summaryType="sum" headerAlign="center">
								核销金额 
							</div>
							<div field="cancelltype" name="cancelltype"
								 width="110" align="center" renderer="dictcancelltype" headerAlign="center">
								处理类型 
							</div>
							<div field="incomecontime" width="110" align="center"  renderer="onDealDate1"
								headerAlign="center" >
								收入确认时间 
							</div>
						
							<div field="cancelldate" width="110" align="center"  renderer="onDealDate1"
								headerAlign="center" >
								核销时间 
							</div>
							<div field="accountage" width="110" align="center"
								headerAlign="center" >
								账龄
							</div>
							<div field="remark" name="remark"
								 width="110" align="center" headerAlign="center">
								备注说明
							</div>
							

						</div>
					</div>
				</fieldset>
			
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
	var csgather1;
	var result=[];
	var form_cont = new nui.Form("form_cont");
	//var form_cont1=new nui.Form("form_cont1");
	var  grid_income = nui.get("grid_income")
	var grid_hxjk=nui.get("grid_hxjk")
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	var csGatherFcGrid1 = nui.get("csGatherFcGrid1");
	//获取发票信息
	var datagrid3=nui.get("datagrid3");
		//处理申请原因
	var applyreasonFrom = new nui.Form("applyreasonFrom");
	
	var csticket22;
	//文件路径
	 var ContextPath= '<%=request.getContextPath()%>' 
	 init();//页面初始化
	 if(csticket22){
	 document.getElementById("tickettable").style.display="";
	 
	 }else{
	 document.getElementById("tickettable").style.display="none";
	 
	 }
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
    				nui.get("gatherno").setValue(data.amebcancell.gatherno); 
    				nui.get("applyreason").setValue(data.amebcancell.applyreason); 
    				nui.get("processinstid1").setValue(data.amebcancell.processinstid); 
    				nui.get("cancellapplyid").setValue(data.amebcancell.cancellapplyid);
    				nui.get("cancelltype").setValue(data.amebcancell.cancelltype); 
    				nui.get("contnum1").setValue(data.amebcancell.contnum); 
                	document.getElementById("applyreason1").innerHTML = data.amebcancell.applyreason == null ? "" : data.amebcancell.applyreason;
    			    //document.getElementById("cancelltype4").innerHTML = data.amebcancell.cancelltype == null ? "" : nui.getDictText('AME_CANCELLTYPE',data.amebcancell.cancelltype);
    			
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
					  } */
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
				
				    nui.get("workitemid").setValue(<%=workItemID %>);
				    nui.get("processinstid").setValue(processinstid2);
				  	nui.get("activitydefid").setValue(data.workItem.activityDefID);
				  
				//判断是否展示，是否存在未收回发票
				/* if(data.csticket){
				 nui.get("haveTicket").setValue("1");
				} */
				 
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
		var cancelltype1 = nui.get("cancelltype").getValue();
		//工作项ID
		var workItemID = nui.get("workItemID").getValue();
		//坏账核销明细
		var data1 = grid_hxjk.getData();
		//合同信息
		var formcont1Data = form_cont.getData();
		var csContract =formcont1Data.csContract;
		//发票信息
		var row2 = datagrid3.getData();
		
		//发起页面的处理信息
		var opioionformData = opioionform.getData();
		var misOpinion = opioionformData.misOpinion;
		//申请原因
		var applyreasonData= applyreasonFrom.getData();
		var applyreason= applyreasonData.amebcancell;
		//传json值
		var json={data1:data1,row2:row2,misOpinion:misOpinion,workItemID:workItemID,applyreason:applyreason,csContract:csContract,cancelltype1:cancelltype1}
		
		nui.ajax({
			url:"com.primeton.eos.ame_income.cancelBadDebts.badDebtCancellByFinance.biz.ext",
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


//显示问题
  	/* function drawGather(e){
			 	if(e.record.status!='0' && e.field == "aaa"){
				 	 e.cellHtml="";
			 	}
			 	if( e.record.gatherno==csgather1 && (e.field=="gatherno"||e.field=="status"||e.field=="billstatus"||e.field=="gathertype"||e.field=="newyearmonth"
			 	||e.field=="fcsum"||e.field=="productsum"||e.field=="servicesum"||e.field=="fcreverate"||e.field=="actsum"||e.field=="confirmday")){
			 	
			 	e.cellStyle = "background: yellow";
			 	
			 	}
			 
			 }	
			  */
			 
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
			 
			 
	
</script>
<script src="<%= request.getContextPath() %>/ame_income/gatherFcBillingProcess/js/gatherFcBillingjs.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/contract/cancelBadDebts/js/cancellBadDebt.js" type="text/javascript"></script>

</html>