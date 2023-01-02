<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>发起采购合同流程</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<div class="mini-panel" title="发起采购合同审批流程" style="width: auto">
		<!-- 提示信息展示 -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>采购合同基本信息</legend>
			<form id="form1" method="post">
				<input name="purContract.purstatus" id="purstatus" class="nui-hidden" />
				<input name="purContract.fileids" id="fileids" class="nui-hidden"/>
				<input name="purContract.purOrderYesOrNo" id="purOrderYesOrNo1" class="nui-hidden"/>
				<input name="purContract.contnum" class="nui-hidden"/>
				<div style="padding:5px;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:120px;">供应商：</td>
							<td style="width:280px;"><input name="purContract.purSupplier.custid" id="custid" class="nui-buttonedit" required="true" style="width:200px" emptyText="请选择供应商" onbuttonclick="selectSupplier" allowInput="false" /></td>
							<td align="right" style="width:120px">合同类型：</td>
							<td style="width:150px;"><input name="purContract.purtype" id="purtype" class="nui-dictcombobox" dictTypeId="AME_CONTYPE" required="true" style="width:120px" showNullItem="true" nullItemText="" onvaluechanged="dealWithPurContName"/></td>
							<td align="right" style="width:120px">合同金额：</td>
							<td style="width:180px;"><input name="purContract.contmoney" id="contmoney" class="nui-textbox" style="width:150px" vtype="float" onvaluechanged="contmoneyValueChanged"/>&nbsp;(元)</td>
						</tr>
						<tr>
							<td align="right" style="width:120px">有效开始日期：</td>
							<td><input name="purContract.startdate" id="startdate" class="nui-datepicker" vtype="date:yyyy-MM-dd" style="width:200px" onblur="dealWithPurContName"/></td>
							<td align="right" style="width:120px">有效截止日期：</td>
							<td style="width:120px;"><input name="purContract.enddate" id="enddate" class="nui-datepicker" vtype="date:yyyy-MM-dd" style="width:120px" onblur="dealWithPurContName"/></td>
							<td align="right" style="width:120px">合同名称：</td>
							<td><input name="purContract.purcontname" id="purcontname" class="nui-textbox" style="width:180px" required="true"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">供应商联系人：</td>
							<td style="width:120px;"><input name="purContract.liankman" class="nui-textbox" vtype="rangeChar:2,30" style="width:200px"/></td>
							<td align="right" style="width:120px">供应商联系电话：</td>
							<td style="width:150px;"><input name="purContract.linktel" class="nui-textbox" vtype="rangeLength:8,30" style="width:120px"/></td>
							<td align="right" style="width:120px">供应商电子邮件：</td>
							<td colspan="5"><input name="purContract.linkemail" class="nui-textbox" vtype="email" style="width:180px"/></td>
						</tr>
						<tr>
							<!--<td align="right" style="width:120px">财务对应合同编码：</td> -->
							<!--<td><input name="purContract.outcontnum" id="outcontnum" onbuttonclick="selectCont" class="nui-buttonedit" style="width:100px"/></td> -->
							<!--<td align="right" style="width:120px">成本类型：</td> -->
							<!--<td><input name="purContract.costtype" id="costtype" class="nui-dictcombobox" dictTypeId="AME_CONTCOSTTYPE" style="width:100px" showNullItem="true"/></td> -->
							<td align="right" style="width:120px">我方申请人：</td>
							<td><input name="purContract.ouroper" id="ouroper" class="nui-textbox" vtype="rangeChar:2,30" style="width:200px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">合同关键内容信息：</td>
							<td colspan="5"><input name="purContract.contKeyinfo" class="nui-textarea" height="100px" style="width:100%"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">说明：</td>
							<td colspan="5"><input name="purContract.comment" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%"/></td>
						</tr>
					</table>
				</div>
			</form>
			<span>请上传采购合同/框架协议(电子版)!</span>
			<jsp:include page="/ame_common/addFiles.jsp"/>
		</fieldset>
		
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		    <legend>采购合同对应项目列表</legend>
		    <div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
		                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
		                    </td>
		                </tr>
	                 </table>
		        </div>
		    </div>
			<div id="grid_purProjCont" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="purProjConts" 
			 url="com.primeton.eos.ame_pur.PurContract.queryPurProjContByPurcontid.biz.ext" allowCellSelect="true"  allowCellEdit="true" showPager="false" multiSelect="true" showSummaryRow="true" ondrawsummarycell="drawPurProjContSum">
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
					<div field="purprojcontid" visible="false"></div>
					<div field="projectno" displayField="projectName" width="150" headerAlign="center">
						项目
		                <input property="editor" class="nui-buttonedit" onbuttonclick="selectProject" style="width:100%;"allowInput="false"/>
		            </div>
					<div field="projectno" width="100" align="center" headerAlign="center" >项目编号</div>
					<div field="contnum" width="100" align="center" headerAlign="center" >销售合同编号</div>
					<div field="custjc" width="100" align="center" headerAlign="center" >所属客户</div>
					<div field="orgname" width="75" align="center" headerAlign="center">受益销售</div>	
					<div field="purmoney"  width="100" headerAlign="center" align="right" summaryType="sum" numberFormat="n2">
						采购金额
						<input property="editor" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false"  style="width:100%;" inputStyle="text-align:right;" allowInput="true" />
		            </div>
					<div field="comment"  width="200" headerAlign="center" align="center">
						备注说明
						<input property="editor" class="nui-textbox" style="width:100%;"/>
		            </div>
				</div>
			</div>
		</fieldset>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
	   	 	<legend>采购付款计划列表</legend>
		    <div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="paymentPlanAddBtn" iconCls="icon-add" onclick="addPaymentPlan()">增加</a>
		                        <a class="nui-button" id="paymentPlanDelbtn" iconCls="icon-remove"  onclick="removePaymentPlan()">删除</a>
		                    </td>
		                </tr>
	                 </table>
		        </div>
		    </div>
			<div id="paymentPlanGrid" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="plans" ondrawsummarycell="drawPaymentPlanSum" ondrawcell="paymentPlanGridDrawCell"
			 url="com.primeton.eos.ame_pur.purPaymentPlan.paymentPlanQueryByContract.biz.ext" allowCellSelect="true"  allowCellEdit="true" showPager="false" multiSelect="true" showSummaryRow="true" >
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
					<div field="payCount" width="80" align="center" headerAlign="center" >付款次数
						<input property="editor"  class="nui-textbox" style="width:100%" vtype="maxLength:200"/>
					</div>
					<div field="expectedAmount" width="100" align="center"  headerAlign="center" summaryType="sum" currencyUnit="￥" dataType="currency" numberFormat="n2" >付款金额
						<input property="editor" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false" onvaluechanged="formatAmount" style="width:100%;" inputStyle="text-align:right;" allowInput="true" allowNull="true"/>
					</div>
					<div field="percentage" width="80" align="center"  headerAlign="center"  summaryType="sum">付款比例
					</div>	
					<div field="expectedDate" width="100" align="center"  headerAlign="center" dataType="date" renderer="onDealDate" dateFormat="yyyy-MM">预计付款年月
						<input property="editor" class="nui-monthpicker"  style="width:250px" allowInput="false" format="yyyy-MM"/>
					</div>
		            <div field="evidence" width="140" align="center" headerAlign="center" >付款依据
		            	<input property="editor" class="nui-textbox" style="width:100%;" vtype="maxLength:2000"  />
		            </div>
					<div field="nodeRemark" width="280" align="center"  headerAlign="center" >付款节点备注
						<input property="editor" class="nui-textarea" style="width:100%;" vtype="maxLength:4000"/>
					</div>
				</div>
			</div>
		</fieldset>
		<table style="table-layout:fixed;" id="tb_purOrderYesOrNo">
			<tr>
				<td style="width:155px;" align="right">是否携带工作协议书：</td>
				<td style="width:140px;">  
					<input name="purContract.purOrderYesOrNo" id="purOrderYesOrNo" class="mini-dictradiogroup" value="n" style="width:180px;" required="true" dictTypeId="ABF_YESORNO"  onvaluechanged="yesOrNo()" />
				</td>
			</tr>
		</table>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>采购订单基本信息</legend>
			<form id="form3" method="post">
				<input name="purOrder.fileids" id="fileids1"  class="nui-hidden"/>
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_purOrder">
						<tr>
							<td align="right" style="width:110px">服务客户：</td>
							<td style="width:200px"><input name="purOrder.userid" id="userid" class="nui-buttonedit" onbuttonclick="selectCustmer"  allowInput="false" style="width:200px" /></td>
							<td align="right" style="width:110px">项目名称：</td>
							<td style="width:200px"><input name="purOrder.projectno" id="projectno" class="nui-combobox" valueField="projectno" textField="projectName" allowInput="false" showNullItem="true" nullItemText="" style="width:200px" /></td>
							<td align="right" style="width:110px">协议签订人员：</td>
							<td style="width:100px"><input name="purOrder.signuserid" id="signuserid" class="nui-buttonedit" onbuttonclick="selectOmEmployee"  allowInput="false" vtype="rangeChar:2,30" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">结算周期说明：</td>
							<td colspan="5"><input name="purOrder.calcycle" class="nui-textbox" allowInput="true" vtype="rangeChar:0,1000" style="width:100%"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">协议内容说明：</td>
							<td colspan="5"><input name="purOrder.contmemo" class="nui-textarea" allowInput="true" vtype="rangeChar:0,2000" style="width:100%"/></td>
						</tr>
					</table>
				</div>
			</form>
			<span>请上传工作协议书电子版及工作协议书涉及人员简历、身份证、毕业证、学位证照片或复印件，建议分多个附件上传。</span>
			<jsp:include page="/ame_common/addFiles1.jsp"/>
		</fieldset>
		<form id="opioionform" method="post">
	        <div style="padding:5px;" id="opinionHide">
	            <table style="table-layout:fixed;">
	            	<tr id="salesEdit">
	                    <td style="width:150px;" align="right">审核结果：</td>
	                    <td style="width:250px;">  
							<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
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
	<a class="nui-button" onclick="onOk('1')" id="creatPurcont" style="width:80px;margin-right:20px;">发起流程</a>
	<a class="nui-button" onclick="onOk('0')" id="savePurcont"style="width:80px;margin-right:20px;">暂时保存</a>
</div>
</body>
<script type="text/javascript">
    nui.parse();
    
    <%
   		UserObject user = (UserObject) session.getAttribute("userObject");
   		String username = user.getUserName();
   		String userno = user.getUserId();
    %>
	nui.get("ouroper").setValue('<%=username %>');
    
  	var form = new nui.Form("form1"); //采购合同基本信息
  	var form3 = new nui.Form("form3"); //采购订单基本信息
  	var opioionform = new nui.Form("opioionform"); //审核意见
  	var grid_purProjCont = nui.get("grid_purProjCont"); //采购合同对应项目列表
  	var paymentPlanSum = 0.0;//预计付款金额总计
  	
    init();//初始化
    function init(){
    	//初始化审核意见
    	document.getElementById("salesEdit").style.display="none";
		nui.get("auditstatus").setValue(3);//1：通过,0：退回，2：终止流程，3:发起
    	promptInit({"workItemID":0,"processDefName":"com.primeton.eos.ame_pur.ame_purCont","activityDefID":"manualActivity"});
    	document.getElementById("field3").style.display="none";
    }
    
    //发起或者暂存
	function onOk(e) {
		if(!(form.validate() && form3.validate())){
			alert("表单信息填写不完整或长度超出限制，请确认必输项是否填写！！");
			return;
		}
		//有效开始日期不能大于有效截至日期。
		var start = nui.get("startdate").getValue();
    	var end = nui.get("enddate").getValue();
		if(end < start){
			nui.alert("有效开始日期不能大于有效截至日期！");
			return;
		}
		if(nui.get("custid").getValue()!=null||nui.get("purtype").getValue()!=null){
        	var filePaths = document.getElementsByName("uploadfile").length;
        	for(var j=0;j<filePaths;j++){
        		var a=document.getElementsByName("remarkList")[j].value;
        		if(a==null||a==""){
        			nui.alert("采购合作框架新增附件不可以为空！");
        			return false;
        		}
        	}
		}else{
			nui.alert("请补全采购框架信息！");
		}
    	if(nui.get("purOrderYesOrNo").getValue()=='y'){
    		if(nui.get("userid").getValue()!=""){
	        	var filePaths1 = document.getElementsByName("uploadfile1").length;
	        	for(var j=0;j<filePaths1;j++){
	        		var a=document.getElementsByName("remarkList1")[j].value;
	        		if(a==null||a==""){
	        			nui.alert("工作协议书新增附件不可以为空！");
	        			return false;
	        		}
	        	}
    		}else{
    			nui.alert("请完善工作协议书内容！");
    			return;
    		}
    	}
    	
    	//付款计划的预计付款金额汇总要等于合同金额
    	if(nui.get("paymentPlanGrid").getData().length > 0) {
			var contmoney = nui.get("contmoney").getValue();
			if(contmoney === "" || paymentPlanSum != contmoney){
				alert("采购付款计划的付款金额汇总要等于合同金额！");
				return;
			}
    	}
        		
		nui.get("purstatus").setValue(e);
    	if(e==1){
        	if(confirm("确认保存并发起流程？")){
        		nui.get("creatPurcont").disable();
    			nui.get("savePurcont").disable();
        		if(nui.get("purOrderYesOrNo").getValue()=='y'){
        			//带订单保存并发起
		        	document.getElementById("fileCatalog1").value="purOrder";
		        	form4.submit();
        		}else{//不带订单保存并发起
        			document.getElementById("fileCatalog").value="purContract";
		        	form2.submit();
        		}
        	}
    	}else if(e==0){
        	if(confirm("确认保存信息？")){
        		nui.get("creatPurcont").disable();
    			nui.get("savePurcont").disable();
        		if(nui.get("purOrderYesOrNo").getValue()=='y'){//带订单保存
		        	document.getElementById("fileCatalog1").value="purOrder";
		        	form4.submit();
        		}else{//不带订单保存
        			document.getElementById("fileCatalog").value="purContract";
		        	form2.submit();
        		}
        	}
        }
    }
	
	//保存数据
    function SaveData() {
        if(form.validate()){ 
        	mini.mask({
	            el: document.body,
	            cls: 'mini-mask-loading',
	            html: '发起中...'
	        });                        
        	var o = form.getData();
        	var data=form3.getData();
        	var data_opioion = opioionform.getData();
        	var data_purProjCont = grid_purProjCont.getData();
        	var data_paymentPlan = nui.get("paymentPlanGrid").getData();
	        var json = {purContract:o.purContract,purOrder:data.purOrder,misOpinion:data_opioion.misOpinion,purProjConts:data_purProjCont, paymentPlans: data_paymentPlan};
            nui.ajax({
                url: "com.primeton.eos.ame_pur.purContractProcess.creatPurContractProcess.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	nui.unmask();
                   	var returnJson = nui.decode(text);
                	var e = nui.get("purstatus").getValue();
    				if(e==1){
    					if(returnJson.result == '1'){
		                   	nui.alert("发起流程成功！");
		                   	window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
						}else{
							nui.alert("发起失败！");
		                	nui.get("creatPurcont").enable();
		    				nui.get("savePurcont").enable();
						}
					}else if(e==0){
						if(returnJson.result == '1'){
	    					nui.alert("暂时保存成功，可在待处理任务中继续发起！");
		                   	window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
		                }else{
							nui.alert("保存失败！");
		                	nui.get("creatPurcont").enable();
		    				nui.get("savePurcont").enable();
						}
					}
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
	        });
    	}
	}

	//处理日期和合同名称
	function dealWithPurContName(){
		if(nui.get("purtype").getValue()=="0"){
	    	var start = nui.get("startdate").getText();
	    	var end = nui.get("enddate").getText();
	    	if(end && start){
	    		var name ="人力资源服务框架协议(" + start.substring(0,4) + "." + start.substring(5,7) + "." + start.substring(8,10) + "-" + end.substring(0,4) + "." + end.substring(5,7) + "." + end.substring(8,10) + ")";
	    		nui.get("purcontname").setValue(name);
	    	}else{
	    		nui.get("purcontname").setValue("");
	    	}
	    	document.getElementById("tb_purOrderYesOrNo").style.display="";
	    	var purOrderYesOrNo = nui.get("purOrderYesOrNo").getValue();
	    	if(purOrderYesOrNo == 'y'){
	    		$("#field3").show();
	    	}
		}else{//只有人力服务才展示是否携带工作协议书按钮选项
			nui.get("purcontname").setValue("");
			document.getElementById("tb_purOrderYesOrNo").style.display="none";
			$("#field3").hide();
			form3.reset();
		}
	}
	
	//标准方法接口定义
	function CloseWindow(action) {           
	    if (action == "close" && form.isChanged()) {
	        if (confirm("数据被修改了，是否先保存？")) {
	            return false;
	        }
	    }
	    if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	    else window.close();            
	}
	//选择供应商
	function selectSupplier(){
		var btnEdit = this;
	    nui.open({
	        url:"<%=request.getContextPath() %>/ame_pur/PurSupplier/SelectSupplier.jsp",
            title: "选择供应商",
            width: 650,
            height: 380,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);
                    if (data) {
                        btnEdit.setValue(data.custid);
                        btnEdit.setText(data.custname);
                    } 
                }
            }
        });
    }
	//选择服务客户弹窗
    function selectCustmer(){
    	var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath() %>/contract/contract/MisCustinfo_lookup.jsp",
            title: "选择服务客户",
            width: 650,
            height: 380,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.id);
                        btnEdit.setText(data.text);
				        var json = nui.encode({rdProject: {custid: data.id}}); //服务客户userid
				    	nui.ajax({
				    		url: "com.primeton.eos.ame_pur.purContractProcess.queryProjByOrder.biz.ext",
				            data: json,
				            type: 'POST',
				            cache: false,
				            showModal: false,
				            contentType: 'text/json',
				            success: function (o) {
				            	o = nui.clone(o);
				            	if(o.rdProjects==null || o.rdProjects==""){
				            		alert("该服务客户没有对应的项目信息！");
				                	return;
				                }
			                	//项目
			                	nui.get("projectno").setData(o.rdProjects);
			                	nui.get("projectno").setValue(o.rdProjects[1].projectno);//shownulllitem
			                	nui.get("projectno").setText(o.rdProjects[1].projectName);//shownulllitem
				            },
				            error: function (jqXHR, textStatus, errorThrown) {
				                alert(jqXHR.responseText);
				                CloseWindow();
				            }
				    	});
                    }
                }
            }
        });
    }
	
	
	//是否带订单
	function yesOrNo(){
		var purOrderYesOrNo = nui.get("purOrderYesOrNo").getValue();
		nui.get("purOrderYesOrNo1").setValue(purOrderYesOrNo);
		if(purOrderYesOrNo=='y'){
			addPurOrder();
		}else {
			delPurOrder();
		}
	}
	
	function addPurOrder(){
		nui.get("signuserid").setValue('<%=userno %>');
		nui.get("signuserid").setText('<%=username %>');
		document.getElementById("field3").style.display="";
	}

	function delPurOrder(){
		document.getElementById("field3").style.display="none";
	}

	//选择协议签订人员弹窗
    function selectOmEmployee(){
    	var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择人员",
            width: 650,
            height: 380,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.userid);
                        btnEdit.setText(data.empname);
                    }
                }
            }
        });
    }
    
    function SaveData1(){
    	document.getElementById("fileCatalog").value="purContract";
        form2.submit();
	}
	
	//选择项目
    function selectProject(){
    	var btnEdit = this;
    	nui.open({
            url:"<%=request.getContextPath() %>/ame_common/SelectProject.jsp",
	        title: "选择项目",
	        width: 850,
	        height: 420,
	        allowResize: false,
	        ondestroy: function (action) {
	            if (action == "ok") {
	                var iframe = this.getIFrameEl();
	                var data = iframe.contentWindow.GetData();
	                data = nui.clone(data);    //必须
	                if (data) {
	                	btnEdit.setValue(data.projectno);
	                    btnEdit.setText(data.projectName);
	                	var row = grid_purProjCont.getSelected();
	                    var rowData = { "projectId":data.projectId,
	                    				"projectno":data.projectno,
	                    				"projectName":data.projectName,
	                    				"custjc":data.custjc,
	                    				"orgname":data.orgname,
	                    				"contnum":data.contnum};
					   	grid_purProjCont.updateRow(row,rowData);
	                }
	            }
	        }
	    });
	}
    //选择销售合同弹窗
    function selectCont(){
    	var btnEdit = this;
    	nui.open({
            url:"<%=request.getContextPath() %>/ame_common/contract_lookup.jsp",
            title: "选择销售合同",
            width: 1000,
            height: 520,
            allowResize: false,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.text);
                        btnEdit.setText(data.text);
                    }
                }
            }
        });
    }
    
    //新增采购合同对应项目列表
    function add() {
        var data = grid_purProjCont.getData();
        grid_purProjCont.addRow({name: "New Row"},data.length+1);
    }
    
    //删除采购合同对应项目列表
    function remove() {
	    var rows = grid_purProjCont.getSelecteds();
	    if(rows.length<1){
	    	nui.alert("请至少选中一条记录！");
	    	return;
	    }
	    
    	grid_purProjCont.removeRows(rows, true);
    }
    
    //采购合同对应项目列表格式化
    function drawPurProjContSum(e){
		if (e.field == "purmoney") {
			var html = nui.formatNumber(e.cellHtml,"n");
            e.cellHtml = "<div align='right'><b>" + html + "</b></div>";
            //采购金额自动归集，填写到表单信息
            nui.get("contmoney").setValue(e.value);
            nui.get("contmoney").doValueChanged();
        }
	}
	function drawPaymentPlanSum(e){
		if (e.field == "expectedAmount") {
			var html = nui.formatNumber(e.value,"n");
            e.cellHtml = "<div align='right'><b>" + html + "</b></div>";
            paymentPlanSum = (Math.round(e.value*100)/100);  
            return;
        } 
        if (e.field == "percentage") {
       	 	var contmoney = nui.get("contmoney").getValue();
       	 	var html = "";
            	
        	if(contmoney && contmoney > 0) {
        		var p = (Math.round(paymentPlanSum * 10000 / contmoney ) / 100.00);
        		html = nui.formatNumber(p,"n");
        	} else {
        		html = "0.00";
        	}
        	e.cellHtml = "<div align='right'><b>" + html + "%</b></div>";
        }
	}

    function onDealDate(e){
		if(e.field == "expectedDate"){
			var date = e.value;
			if(date){
				return e.cellHtml.substring(0,7);
			}
		}
	}
	//添加采购付款计划
    function addPaymentPlan() {
   		var paymentPlanGrid = nui.get("paymentPlanGrid");
        var data = paymentPlanGrid.getData();
        paymentPlanGrid.addRow({name: "New Row"},data.length+1);
    }
    //删除采购付款计划
    function removePaymentPlan() {
    	var paymentPlanGrid = nui.get("paymentPlanGrid");
	    var rows = paymentPlanGrid.getSelecteds();
	    if(rows.length<1){
	    	alert("请至少选中一条记录！");
	    	return;
	    }
    	paymentPlanGrid.removeRows(rows, true);
    }
    function formatAmount(e) {
    	var paymentPlanGrid = nui.get("paymentPlanGrid");
    	if(this.value != null && !isNaN(this.value)) {
    		this.value = (Math.round(this.value*100)/100);
    		
    		var contmoney = nui.get("contmoney").getValue();
        	if(contmoney && contmoney > 0) {
        		var p = (Math.round(this.value * 10000 / contmoney ) / 100.00);
        		paymentPlanGrid.getSelected().percentage = p;
        	}
    	} else {
    		paymentPlanGrid.getSelected().percentage = "";
    	}
    }
	function paymentPlanGridDrawCell(e) {
    	if(e.field == "percentage" && !isNaN(e.value) ) {
    		e.cellHtml = e.value + "%";
    	}
    }
    function contmoneyValueChanged(e) {
    	if(!e.value || e.value <= 0) {
    		return;
    	}
    	var paymentPlanGrid = nui.get("paymentPlanGrid")
    	var paymentPlanGridData = paymentPlanGrid.getData();
    	if(paymentPlanGridData.length > 0) {
    		for(var i = 0, l = paymentPlanGridData.length; i < l; i++) {
    			var expectedAmount = paymentPlanGridData[i]["expectedAmount"];
    			var p = (Math.round(expectedAmount * 10000 / e.value ) / 100.00);
    			paymentPlanGrid.updateRow(paymentPlanGrid.getRow(i),{"percentage" : p});
    		}
    	}
    }
</script>
</html>
