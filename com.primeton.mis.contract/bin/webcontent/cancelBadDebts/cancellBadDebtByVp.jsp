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
	<title>坏账核销审批流程-VP审批</title>
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
		<div class="nui-panel" title="坏账核销Vp审批" style="width: auto">
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

			
				<jsp:include page="/contract/cancelBadDebts/badDebtCommon1.jsp"></jsp:include>
			<!-- <table style="table-layout: fixed;" id="table_file">
				<tr>
					<td style="width: 200px;" align="right">是否有未确认收入且无法退回的发票:</td>
					<td style="width: 150px;"><input class="mini-dictcombobox"
						style="width: 135px" id="haveTicket" required="true"
						dictTypeId="MIS_YN" onvaluechanged="showTicket" /></td>
				</tr>
			</table> -->
			<fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>关联的发票信息</legend>
			 <div id="datagrid3" class="nui-datagrid" style="width: 100%; height: auto;" allowResize="true" url="com.primeton.eos.ame_income.cancelBadDebts.getBadDebtCancellTicketDetail.biz.ext" 
			     dataField="queryBadDebtTicketDEtails" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true"
				editNextOnEnterKey="true" onlyCheckSelection="true" showSummaryRow="true" ondrawsummarycell="ticketTaxSum"
				onselectionchanged="totalsum">
				<div property="columns">
<!-- 					<div type="checkcolumn" width="25"></div>
 -->					<div field="billdate" width="80" dateFormat="yyyy-MM-dd"
						align="center" headerAlign="center" allowSort="true"  id="billdate">开票日期</div>
					<div field="notax" width="110" dataType="currency"
						summaryType="sum" align="right" headerAlign="center"
						allowSort="true"  id="notax">不含税金额</div>
					<div field="tax" width="110" dataType="currency" summaryType="sum"
						align="right" headerAlign="center" allowSort="true"  id="tax">税金</div>
					<div field="money" width="110" dataType="currency"
						summaryType="sum" align="right" headerAlign="center"
						allowSort="true"   id="money">含税金额</div>
					<div field="cancelldate" width="80" align="center"
						headerAlign="center"  id="cancelldate">
						核销时间 <input property="editor" class="nui-datepicker" />
					</div>
					<div field="accountage" width="80" align="center"
						headerAlign="center"  id="accountage">
						账龄 <input property="editor" class="nui-datepicker"
							inputStyle="text-align: right;" />
					</div>
					<div field="suresaleid"  width="80" align="center" id="suresaleid"
						headerAlign="center" >
					</div>
				</div>
			</div>
           </fieldset>
			<fieldset style="border: solid 1px #aaa; padding: 3px;">
				<legend>本次核销金额</legend>

				<table style="table-layout: fixed;" id="sum1" align="center">
					<tr>
						<td style="width: 200px;" align="right"><b>本次核销金额总金额：</b></td>
						<td id="cancellsum" style="width: 830px;color: red; font-size: 150%;"
							colspan="5"/>
						
						
					</tr>
				</table>
			</fieldset>
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
	 console.log("nihao")
	
	var form_cont = new nui.Form("form_cont");
	//var form_cont1=new nui.Form("form_cont1");
	var  grid_income = nui.get("grid_income")
	var grid_hxjk=nui.get("grid_hxjk")
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	var csGatherFcGrid1 = nui.get("csGatherFcGrid1");
	//获取发票信息
	var datagrid3=nui.get("datagrid3");
	
	
	//文件路径
	 var ContextPath= '<%=request.getContextPath()%>' 
	 init();//页面初始化
	var contnum;
	
	function init(){
		promptInit({"workItemID":0,"processDefName":"com.primeton.mis.contract.cancelBadDebts","activityDefID":"manualActivity"});
		
		var json={"workItemID": <%=workItemID %>};
		console.log(json);
		//查询合同相关信息
		
			nui.ajax({
    			url:"com.primeton.eos.ame_income.cancelBadDebts.getBadDebtCancellProcess.biz.ext",
    			data: json,
    			type:"post",
    			contentType:"text/json",
    			success:function(data){
    				data = nui.clone(data);
	    			//审批意见的流程实例ID
					
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
					//合同收款记录
				csGatherFcGrid1.load({"csGatherFc": {"contnum": data.csContract.contnum}});
				//合同收入记录
				grid_income.load({"csReveForecast": {"contnum": data.csContract.contnum}});
				
				if(data.csticket){
				var lee=data.csticket;
				var total1=0;
				
				//查询总的核销金额，加载发票信息和坏账明细及审批意见；
				for (var i = 0, l = lee.length; i < l; i++) {
							var tax;
	                    	var lee1 = lee[i];
	                    	var d = lee1.processinstid;
	                    	var t = lee1.tax;
	                    	if (isNaN(t)) continue
	                    	/* var f = parseFloat(t); */
                            total1+=t;
	                }
	              //发票信息
	             datagrid3.load({"processinstid1":d});
	             //坏账明细
	             grid_hxjk.load({"processinstid":d});   
	             
				//计算核销总金额
	             var details =data.badDebtDetails;
	         	  var total = 0;
	              for (var i = 0, l = details.length; i < l; i++) {
	              			var cancellmoney;
	                    	var data2 = details[i];
	                    	var m = data2.cancellmoney;
	                   		var c = parseInt(m);
	                    if (isNaN(m)) continue 
	                      total+=c;
	                }
	         	  var sum2=total+total1;
	              document.getElementById("cancellsum").innerHTML = sum2 == null ? "0.00" : nui.formatNumber(sum2,'#,##.##');
					 
					 //加载查询审核意见
		            var processinstid = d;
					var grid = nui.get("datagrid1");
					grid.sortBy("time", "desc");
					grid.load({"processInstID": processinstid});
				}
				
				//判断是否展示，是否存在未收回发票
				/* if(data.csticket){
				console.log("hello")
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
     console.log("蛤蛤蛤")
		var auditstatus = nui.get("auditstatus").getValue();
		if(auditstatus == "1"){		//提交流程
			if(!form_cont.validate()){
				return;
			}
		}
		 processManagerCheck();
	}
	
	function processManagerCheck(){
	
		var json = form_cont.getData();
		//工作项ID
		var workItemID = nui.get("workItemID").getValue();
		//坏账核销明细
		var data1 = grid_hxjk.getData();
		//发票信息
		var row2 = datagrid3.getData();
		console.log(data1)
		console.log(row2)
		console.log("suohahahhahah")
		//发起页面的处理信息
		var opioionformData = opioionform.getData();
		var misOpinion = opioionformData.misOpinion;
		
		//传json值
		var json={data1:data1,row2:row2,misOpinion:misOpinion,workItemID:workItemID}
		
		nui.ajax({
			url:"com.primeton.eos.ame_income.cancelBadDebts.badDebtCancellByVp.biz.ext",
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
	function showTicket(){

		console.log(contnum);
	    var rows = csGatherFcGrid1.getSelecteds();
		var haveTicket = nui.get("haveTicket").getValue();
		if(haveTicket=='1'){
		if(rows.length!=0){
				
		//console.log(rows);
		datagrid3.load({"rows":rows,"contnum":contnum});
		 document.getElementById("suresaleid").style.display = "none";
	   document.getElementById("datagrid3").style.display = "";
		
		}else{
		nui.alert("请选择收款记录！")	;	
		}
		}else if(haveTicket=='0'){
		document.getElementById("datagrid3").style.display = "none";
		}
		
	}
	
	function showTicket1(){
	  var rows = csGatherFcGrid1.getSelecteds();
	  var haveTicket = nui.get("haveTicket").getValue();
	      if(rows.length!=0){
				if(haveTicket=='1'){
				//console.log("hahhahahahah")
				datagrid3.load({"rows":rows,"contnum":contnum});
				}else{
				document.getElementById("datagrid3").style.display = "none";
				}
		}else{
		alert("请选择收款记录！")	;	
		
		}	
	}
	

</script>
<script src="<%= request.getContextPath() %>/ame_income/gatherFcBillingProcess/js/gatherFcBillingjs.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/contract/cancelBadDebts/js/cancellBadDebt.js" type="text/javascript"></script>

</html>