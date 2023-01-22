<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2018-12-08 15:19:42
  - Description:
-->
<head>
	<title>领导审批</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link id="css_skin" rel="stylesheet" type="text/css" href="/default/coframe/tools/skins/skin1/style.css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	</style>
</head>
<body>
<div class="nui-fit">
	<div class="mini-panel" style="width: 100%;">
		<!-- 提示信息展示  -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<div id="form1" >	
		<!--行政采购展示  -->
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>资产申请信息</legend>
				<input name="machineApply.id" id="machineApplyId" class="nui-hidden"/>
				<input name="machineApply.processinstid"  class="nui-hidden"/>
				<input name="machineApply.state" id="state"  class="nui-hidden"/>
				<input name="machineApply.fileids" id="fileids2" class="nui-hidden"/>
				<input name="machineApply.applyempname" id="applyempname" class="nui-hidden"/>
	            <table style="table-layout:fixed;" id="table_file">
	            	<tr>
	            		<td style="width:120px;" align="right">资产类型：</td>
	                    <td style="width:150px;">    
	                        <input class="mini-dictcombobox" name="machineApply.type" id="type" dictTypeId="MIS_MA_TYPE" required="true" emptyText="请选择" onvaluechanged="onTypeFilterChanged"/>
	                    </td>
	                    <td style="width:120px;" align="right">子类型：</td>
	                    <td style="width:150px;">    
	                        <input class="nui-combobox" name="machineApply.sectype" id="sectype" required="true" emptyText="请选择" valueField="dictID" textField="dictName" parentField="parentId"/>
	                    </td>
	                    <td style="width:120px;" align="right">区域：</td>
	                    <td style="width:250px;">    
	                        <input class="nui-dictcombobox" name="machineApply.area" id="area" dictTypeId="EXP_REGION" required="true" emptyText="请选择" />
	                    </td>
	            	</tr>
	            	<tr>
	            		<td style="width:120px;" align="right">管理方式：</td>
	                    <td style="width:150px;">    
	                        <input class="nui-dictcombobox" name="machineApply.storagetype" id="storageType" dictTypeId="MIS_MA_STORAGE" required="true" onvaluechanged="onNameFilterChanged(this.value)" emptyText="请选择"/>
	                    </td>
	                    <td style="width:120px;" align="right">数量：</td>
	                    <td style="width:150px;">    
	                        <input name="machineApply.num" id="num" class="nui-textbox" required="true" maxLength="10"/>
	                    </td>
	            		<td style="width:120px;" align="right">购买总金额：</td>
		                <td style="width:250px;"> 
		                 	<input name="machineApply.price" id="price" class="nui-spinner" format="n2" required="true" allowLimitValue="false" onvaluechanged="calbenemon" changeOnMousewheel="false"  showbutton="false"/>	                   
		                	<span id="msg" style="color: red;display: none;" >(市场暂估金额)</span>
		                </td>
	            	</tr>
	            	<tr id="temp">
	                	<td width="120px" align="right">负责人：</td>
	                    <td width="150px">    
							<input property="editor" name="machineApply.usingemp" id="usingemp" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false" />
	                    </td>
	                    <td width="120px" align="right">所属部门：</td>
	                    <td width="150px">    
	                        <input property="editor" name="machineApply.dept" id="deptname" class="nui-buttonedit" value="" text="" onbuttonclick="showDept" showClose="false" required="true" allowInput="false"   />
	                    </td>
	                    <td width="120px" align="right">所属项目：</td>
	                    <td width="250px">    
	                        <input property="editor" name="machineApply.projectno" id="projectno" class="nui-buttonedit" value="" text="" onvaluechanged="changProject" onbuttonclick="selectProject" showClose="false"  />
	                    </td>
	            	</tr>
	            	<tr>
	            		<td style="width:120px;" align="right">型号：</td>
	                    <td style="width:200px;" colspan="5">    
	                        <input name="machineApply.model" id="model" style = "width: 680px;" class="nui-textbox" required="false" maxLength="50"/>
	                    </td>
	            	</tr>
	            	<tr>
	                    <td style="width:120px;" align="right">配置：</td>
	                    <td style="width:200px;" colspan="5">    
	                        <input name="machineApply.configuration"  style = "width: 680px;height:40px" id="configuration" class="nui-textarea" required="false" maxLength="500"/>
	                    </td>
	            	</tr>
	            	<tr>
	            		<td style="width:120px;" align="right">采购途径：</td>
	                    <td style="width:200px;" colspan="5">    
	                        <input name="machineApply.purmeans" id="purmeans"  style = "width: 680px;height:40px" class="nui-textarea" required="false" maxLength="500"/>
	                    </td>
	            	</tr>
	                <tr>
	                	<td style="width:120px;" id="third31" align="right">备注：</td>
	                    <td style="width:150px;" colspan="5">    
	                        <input name="machineApply.remarks" id="remarks" class="nui-textarea" style="width:680px;" required="false"/>
	                    </td>
					</tr>
	            	<tr id="NeedPay">
	            		<td style="width:120px;" align="right">是否需要申请借款：</td>
						<td style="width:150px;">  
							<input name="machineApply.isNeedPay" id="isNeedPay" class="nui-dictcombobox"   required="true" dictTypeId="MIS_YN" onvaluechanged="changeNeedPay"/>
						</td>
	            	</tr>
	            </table>
			</fieldset>
	    </div> 
		<fieldset id="fieldExpbei" style="border:solid 1px #aaa;padding:3px; display: none;">
			<legend>付款申请基本信息</legend>
			<form id="form_expbei" method="post">
				<input name="expbeilist.expid" id="expid" class="nui-hidden">
				<input name="expbeilist.expstatus" id="expstatus" class="nui-hidden">
				<input name="expbeilist.processinstid" class="nui-hidden">
				<input name="expbeilist.expno" class="nui-hidden">
				<input name="expbeilist.exptbid" id="exptbid" class="nui-hidden">
				<input name="expbeilist.tbdate" id="tbdate" class="nui-hidden">
				<input name="expbeilist.exporgid" id="exporgid" class="nui-hidden">
				<input name="expbeilist.expusername" id="expusername" class="nui-hidden">
				<input name="expbeilist.total" id="total" class="nui-hidden">
				<input id="expempid" class="nui-hidden" />
				<!-- 付款明细信息默认赋值 -->
				<input name="detaildata.beitype" id="beitype1" class="nui-hidden">
				<input name="detaildata.beimon" id="beimon1" class="nui-hidden">
				<!-- 付款明细信息默认赋值end -->
				<table style="table-layout: fixed;"> 
					<tr>
						<td align="right" style = "width: 110px;">付款单类型:</td>
						<td align="left" style = "width:150px;">
							<input name="expbeilist.exptype" id="exptype" class="nui-combobox"  required="true" readonly="readonly">
						</td>
						<td align="right" style = "width: 110px;">借款人:</td>
						<td align="left" style = "width:100px;"><input property="editor" name="expbeilist.expuserid" id="expuserid" class="nui-buttonedit" onbuttonclick="showEmployee1" showClose="false" required="true" allowInput="false"/></td>
						<td align="right" style = "width: 110px;">借款部门:</td>
						<td align="left" style = "width:100px;"><input  id="exporgname" class="nui-textbox" allowInput="false"></td>
					</tr>
					<tr >
						<td align="right" id = "yhzh" >银行账号:</td>
						<td align="left" id = "yhzh1"><input name="expbeilist.bankacct" id="bankacct" style="width: 150px;" class="nui-textbox" onblur="changeValue"><a class="mini-button" onclick="searchbankacct" style="height:19px;" plain="false">查询</a></td>
						<td align="right" id = "yhmc" >银行名称:</td>
						<td align="left" id = "yhmc1"><input name="expbeilist.bankname" id="bankname" class="nui-textbox"  required="true" ></td>
						<td align="right" >收款单位:</td>
						<td align="left"><input name="expbeilist.companyname" id="companyname" class="nui-textbox"></td>
					</tr>
					<tr>
						<td align="right" style = "width: 110px;">付款方式:</td>
						<td align="left" style = "width:100px;"><input name="expbeilist.paymode" id="paymode" required="true" class="nui-dictcombobox" dictTypeId = "EXP_PAYMODE" value = "2" onvaluechanged="changePaymode" /></td>
						<td align="right" >付款用途或备注:</td>
						<td align="left" colspan="3"><input name="expbeilist.remark" id="remark" class="nui-textarea" style = "width: 450px;height: 40px" maxLength="200"></td>
					</tr>
					<tr >
						<td align="right" style="width: 100px;" >借款金额:</td>
						<td align="left"><input name = "expbeilist.benefmon" id="benefmon" class="nui-spinner" required="true"  format="n2"  showbutton="false" changeOnMousewheel="false"  onvaluechanged="caltotal"/></td>
						<td align="right" style="width: 100px;">受益部门:</td>
						<td align="left" >
							<input property="editor" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" name ="expbeilist.beneforgid" id = "beneforgid1"
							filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" style="width: 180px" allowInput="true" required="true" onvaluechanged="changeOrg1"/>
						</td>
						<td align="right" id = "sygs" style = "width: 110px;">受益公司:</td>
						<td align="left" id = "sygs1" style = "width: 100px;"><input name="expbeilist.benefcompany" id="benefcompany" class="nui-dictcombobox" dictTypeId = "company" value = "1"></td>
					</tr>
					<tr >
						<td align="right" >受益项目:</td>
						<td align="left">
							<input name = "expbeilist.benefprojno" class="nui-combobox"  textField="projectName" valueField="projectno" onvaluechanged="changePrj" style="width: 200px" showClose="true" oncloseclick="clearproject" id="benefprojno1"/>
						</td>
						<td align="right" >所属客户:</td>
						<td align="left">
							<input name = "expbeilist.benefcustid" class="nui-combobox" id="benefcustid1"  textField="custjc" valueField="custid" style="width: 180px" readonly="readonly"/>
						</td>
						<td align="right">项目编号:</td>
						<td align="left">
							<input id = "projno1" class="nui-textbox" readonly="readonly"/>
						</td>
						<td></td>
					</tr>
					<tr>
						<td align="right" style = "width: 110px;">期望到款日期:</td>
						<td align="left" style = "width: 100px;"><input name="expbeilist.orderdate" id="orderdate" onvaluechanged="changeOrderDate" class="nui-datepicker" style="width: 200px"/></td>
						<td align="right" id="planrepaydate1" style = "width: 110px;">计划还款日期:</td>
						<td align="left" style = "width: 100px;"><input name="expbeilist.planrepaydate" id="planrepaydate" class="nui-datepicker" style="width: 180px" required="true" onvaluechanged="changePlanDate" onshowpopup="beforechange"></td>
					</tr>
				</table>
			</form>
		</fieldset>
		<jsp:include page="/ame_common/detailFile.jsp"/>
		<jsp:include page="/ame_common/addFiles2.jsp"/>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var activityDefID;//工作项
	
	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
  	var form = new nui.Form("#form1");//申请信息
	var opioionform = new nui.Form("#opioionform");//审核信息
	var formExpbei = new nui.Form("#form_expbei");//付款申请
	var planpaydates = "";
	//获取资产申请相关数据
	<%
   		UserObject user = (UserObject) session.getAttribute("userObject");
   		String username = user.getUserName();
   		String userno = user.getUserId();
   		String userOrgName = user.getUserOrgName();
   		String userOrgId = user.getUserOrgId();
   		Map<String,Object> a = user.getAttributes();
   		String empid = (String) a.get("empid");
	%>
	init();
	function init(){
		form.mask("数据加载中...");
		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		var json = {workItemID: <%=workItemID %>};
  		nui.ajax({//获取资产采购申请信息
      		url: "com.primeton.eos.machine.machineProcess.getMachineApply.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			form.unmask();
       	  		form.setData(o);
				var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"MIS_MACHINEAPPLY","relationid":o.machineApply.id});
				grid_0.sortBy("fileTime","desc");
				nui.get("usingemp").setText(o.machineApply.usingempname);
				nui.get("deptname").setText(o.machineApply.deptname);
				nui.get("projectno").setText(o.machineApply.projectno);
				nui.get("sectype").load(o.machineApply.childType);
  				var processInstID = o.machineApply.processinstid;
  				activityDefID=o.workitem.activityDefID;
  				var price = parseFloat(o.machineApply.price);
  				var num = parseFloat(o.machineApply.num);
		  		setMaxValue(price,num);
  				if("2" == o.machineApply.storagetype){
  					$("#temp").hide(0.01);
  				}else{
  					$("#temp").show();
  				}
  				if("manualActivity2" != activityDefID){//领导审批
  					$("#NeedPay").hide(0.01);
  					$("#field2").hide(0.01);
  					$("#fieldExpbei").hide(0.01);
  					$("#msg").show();
  					nui.get("type").setReadOnly(true);
  					nui.get("sectype").setReadOnly(true);
  					nui.get("configuration").setReadOnly(true);
  					nui.get("price").setReadOnly(true);
  					nui.get("num").setReadOnly(true);
  					nui.get("model").setReadOnly(true);
  					nui.get("storageType").setReadOnly(true);
  					nui.get("area").setReadOnly(true);
  					nui.get("purmeans").setReadOnly(true);
  					nui.get("usingemp").setReadOnly(true);
  					nui.get("deptname").setReadOnly(true);
  					nui.get("projectno").setReadOnly(true);
  					nui.get("remarks").setReadOnly(true);
  				}else{
  					if("1" == o.machineApply.isNeedPay){
	        			$("#fieldExpbei").show();
  						formExpbei.setData(o);
  						nui.get("exptype").setText(o.expbeilist.feetypename);
  						nui.get("expuserid").setText(o.expbeilist.empname);
  						nui.get("exporgname").setValue(o.expbeilist.orgname);
						nui.get("benefprojno1").setData(o.expbeilist.projects);
						if(o.machineApply.projectno != null ){
				  			nui.get("benefprojno1").setValue(o.machineApply.projectno);
			  				nui.get("projno1").setValue(o.machineApply.projectno);
							nui.get("benefcustid1").setValue(o.machineApply.custid);
							nui.get("benefcustid1").setText(o.machineApply.custjc);
						}
  					}else{
  						$("#fieldExpbei").hide(0.01);
  					}
  				}
  				//查询审核意见
				var grid = nui.get("datagrid1");
				grid.sortBy("time", "desc");
				grid.load({processInstID: processInstID});
				
				//悬挂意见保存
				nui.get("workitemid").setValue(<%=workItemID %>);	//工作项ID
				nui.get("processinstid").setValue(processInstID);	//审核意见流程实例ID
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
               	nui.get("isshow").setValue("1");
				
				//流程回退路径赋值 
                nui.get("backTo").setData(o.machineApply.backList);
				
				//审核结果设置
				initMisOpinion({auditstatus: "1"});
				if("manualActivity2" != activityDefID){//领导审批
					nui.get("auditopinion").setValue("同意。");
				}else{
					nui.get("auditopinion").setValue("");
				}
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}
	
	//提交该流程    
    var titleText = "";
    function onOk(e){
    	var isNeedPay;
    	var auditstatus = nui.get("auditstatus").getValue();
    	if(auditstatus == "2"){	//终止流程
    		titleText = "终止";
    	}else if(auditstatus == "0"){	//退回流程
    		if(!nui.get("backTo").getValue()){
    			nui.alert("退回环节不能为空！");
    			return;
    		}
    		titleText = "退回";
    	}else if(auditstatus == "1"){	//提交流程
    		if("manualActivity2" == activityDefID){
	    		if(!form.validate()){
		    		nui.alert("信息录入不完整！");
		        	return;
	        	}
    			isNeedPay = nui.get("isNeedPay").getValue();
	        	if("1" == isNeedPay){
	        		if(!formExpbei.validate()){
			    		nui.alert("付款申请信息录入不完整！");
			        	return;
	        		}
	        	}else{
	        		nui.get("state").setValue("1");//已采购
	        	}
        	}
    		titleText = "提交";
    	}
    	nui.confirm("确定" + titleText + "流程吗？", "操作提示",function (action) {            
            if (action == "ok") {
		    	if("manualActivity2" != activityDefID){//领导审批
		    		SaveData2();
		    	}else{
					document.getElementById("fileCatalog2").value="MIS_MACHINEAPPLY";
					form6.submit();
		    	}
            }
        });
    }
    
    function SaveData2(){
    	var mis = form.getData();//资产申请列表
    	Expbei = formExpbei.getData();
		var misOpinion = opioionform.getData().misOpinion;//审核意见
    	nui.get("sureButton").setEnabled(false);
    	var json = {machineApply:mis.machineApply,misOpinion:misOpinion,expbeilist:Expbei.expbeilist};
    	saveData(json);
    }
    
	function  saveData(data){
		mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: titleText+'中...'
        });
    	nui.ajax({
            url: "com.primeton.eos.machine.machineProcess.leaderMachineApply.biz.ext",
            data: data,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	nui.unmask(document.body);
        		var returnJson = nui.decode(text);
              	if(returnJson.result == "success"){
    				nui.alert(titleText + "成功","系统提示",function(){
		        		CloseWindow("ok");
		        	});
              	}else{
					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
						nui.get("sureButton").setEnabled(true);
					});
				}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
                CloseWindow();
            }
        });
	}
	
	//是否需要申请借款
	function changeNeedPay(e){
		if(e.value=="1"){
  			$("#fieldExpbei").show();
  			nui.get("exptype").setValue(0);
  			nui.get("exptype").setText("采购付款申请");
  			//填报人
			var username = "<%=username %>";
			nui.get("exptbid").setValue("<%=userno %>");
			//借款人默认填报人
			nui.get("expuserid").setValue("<%=userno %>");
		  	nui.get("expuserid").setText(username);
		  	nui.get("exporgname").setValue("<%=userOrgName %>");
		  	nui.get("exporgid").setValue("<%=userOrgId %>");
		  	nui.get("expempid").setValue("<%=empid %>");
		  	//设置填报日期
		  	var date=new Date; 
		  	nui.get("tbdate").setValue(date);
  			//银行帐号信息默认设置为当前登录人的信息
      		var json=nui.encode({"empid": "<%=empid %>"});
      		search(json);
      		var price = parseFloat(nui.get("price").getValue());
			var dept = nui.get("deptname").getValue();
		  	nui.get("benefmon").setValue(price);
		  	nui.get("total").setValue(price);
		  	nui.get("beneforgid1").setValue(dept);
	    	var applyempname = nui.get("applyempname").getValue();
	    	var typename = nui.get("type").getText();
	    	var sectypename = nui.get("sectype").getText();
	    	var machineApplyId = nui.get("machineApplyId").getValue();
	    	var remark =applyempname+"申请采购“"+typename+"-"+sectypename+"”,资产采购申请ID:"+machineApplyId;
	    	nui.get("remark").setValue(remark);
   	    	var jsonCust=nui.encode({"orgid": dept});
   	    	setProject(jsonCust);
   	    	changeOrderDate();
		}else{
  			$("#fieldExpbei").hide(0.01);
  			formExpbei.reset();
		}
	}
	
	//金额可修改购买金额的加10%
	function setMaxValue(price,num){
		var maxValue =price*(1+0.1);
		nui.get("benefmon").setMaxValue(maxValue);
	}
	
	//选择借款人
	function showEmployee1(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择借款人",
			width: 430,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.userid);
		                btnEdit.setText(data.empname);
		                nui.get("exporgname").setValue(data.orgname);
		                nui.get("exporgid").setValue(data.orgid);
		                nui.get("expusername").setValue(data.empname);	
		                nui.get("expempid").setValue(data.empid);
						//银行帐号信息设置借款人信息
				      	var json=nui.encode({"empid": data.empid});
				      	search(json);
					}
				}
			}
		});
	}
	//资产金额和数量改变时
	function calbenemon(){
		var isNeedPay = nui.get("isNeedPay").getValue();
		if("1" == isNeedPay){
	  		var price = parseFloat(nui.get("price").getValue());
		  	nui.get("benefmon").setValue(price);
		  	nui.get("total").setValue(price);
	  	}
	}
	
	//借款总金额等于受益金额
    function caltotal(e){
    	var exptype = nui.get("exptype").getValue();
    	nui.get("total").setValue(e.value);
    }
    function changeValue(){
    	var bankacct = nui.get("bankacct").getValue();
    	var a = bankacct.replace(/\s/g, "");
    	nui.get("bankacct").setValue(a);
    }
	function search(json){
		nui.ajax({	
      		url: "com.primeton.eos.ame_pur.settlePay.queryBankInfo.biz.ext",
      		type: 'POST',
     		data: json,
      		success: function (text) {
	          	text = nui.clone(text);
	          	//zhang-yb 选择第一条默认账户信息
                if(text.omemployeeaccts.length>0){
                	nui.get("companyname").setValue(text.omemployeeaccts[0].username);
	          		nui.get("bankname").setValue(text.omemployeeaccts[0].bankname);
					nui.get("bankacct").setValue(text.omemployeeaccts[0].bankacct);
	          	}
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
		        alert(jqXHR.responseText);
	      	}
    	})
	}
	//付款类型为采购付款申请时根据受益部门筛选客户
    function changeOrg1(e){
   	    nui.get("benefprojno1").setValue("");
   	   	nui.get("projno1").setValue("");
   	   	nui.get("benefcustid1").setValue("");
   	   	nui.get("benefcustid1").setText("");
   	    var json=nui.encode({"orgid": e.value});
   	    setProject(json);
    }
    
    function setProject(json){
    	 nui.ajax({	
		      url: "com.primeton.eos.ame_fee.paymentApply.queryOrgPro.biz.ext",
		      type: 'POST',
	          data: json,
	          success: function (text) {
	       	  	var projects = text.projects;
	       	  	nui.get("benefprojno1").setData(projects);
				var projectno = nui.get("projectno").getValue();
	  			nui.get("benefprojno1").setValue(projectno);
	  			var iscontain =false;
	  			if(projects.length >0){
	  				for(var ii=0;ii<projects.length;ii++){
	  					if(projectno == projects[ii].projectno){
	  						iscontain=true;
	  					}
	  				}
	  			}
	  			if(iscontain){
	  				nui.get("projno1").setValue(projectno);
	  				setCust(projectno);
	  			}
	          },
		      error: function (jqXHR, textStatus, errorThrown) {
		        alert(jqXHR.responseText);
		      }
	    });
    }
    function setCust(projectno){
    	json =nui.encode({"projectno": projectno});
    	nui.ajax({	
		      url: "com.primeton.eos.machine.machineProcess.getCustByprojectno.biz.ext",
		      type: 'POST',
	          data: json,
	          success: function (text) {
	       	  	var project = text.project;
	       	  	nui.get("benefcustid1").setValue(project.custid);
	       	  	nui.get("benefcustid1").setText(project.custjc);
	          },
		      error: function (jqXHR, textStatus, errorThrown) {
		        alert(jqXHR.responseText);
		      }
	    });
    }
    
    function changePrj(e){
		var benefprojno1 = nui.get("benefprojno1").getValue();
		if(benefprojno1 == "0"){
			nui.get("projno1").setValue("");
			nui.get("benefcustid1").setValue("");
			nui.get("benefcustid1").setText("");
		}else{
			nui.get("projno1").setValue(e.value);
	  		setCust(e.value);
		}
    }
    //清空受益项目时清空对应项目编号
    function clearproject(){
    	nui.get("benefprojno1").setValue("");
		nui.get("benefprojno1").setText("");
    	nui.get("projno1").setValue("");
		nui.get("benefcustid1").setValue("");
		nui.get("benefcustid1").setText("");
    }
	//查询银行账号
	function searchbankacct(){
		var expempid = nui.get("expempid").getValue();
		var expusername = nui.get("expusername").getValue();
		nui.open({
	        url: "<%=request.getContextPath() %>/ame_pur/settlepay/selectBankInfo.jsp?empid="+expempid,
	        title: "查询银行信息", 
	        width: 650, 
	        height: 420,
	        onload: function () {
	            var iframe = this.getIFrameEl();
	            var data = {expusername:expusername};
	            iframe.contentWindow.SetData(data);
	        },
	        ondestroy: function (action) {//弹出页面关闭前
	            if (action == "ok") {
	                var iframe = this.getIFrameEl();
	                var data = iframe.contentWindow.GetData();
	                data = nui.clone(data);    //必须
	                if (data) {
	                	if(data.username){
	                        nui.get("companyname").setValue(data.username);
	                	}
	                    nui.get("bankname").setValue(data.bankname);
	                    nui.get("bankacct").setValue(data.bankacct);
	                }
	            }
	        }
	 	});
	}
	//将前一个计划还款、退保日期记录下来
    function beforechange(){
    	planpaydates = nui.get("planrepaydate").getValue();
    }
    function changeOrderDate(){
    	var tbdate = nui.get("tbdate").getValue();
    	var year = tbdate.getFullYear(); //获取当前日期的年份
        var month = tbdate.getMonth()+1; //获取当前日期的月份
        var day = tbdate.getDate(); //获取当前日期的日
        var days = new Date(year, month, 0);
        days = days.getDate(); //获取当前日期中的月的天数
        var year2 = year;
        var month2 = parseInt(month) + 1;
        if (month2 == 13) {
            year2 = parseInt(year2) + 1;
            month2 = 1;
        }
        var day2 = day;
        var days2 = new Date(year2, month2, 0);
        days2 = days2.getDate();
        if (day2 > days2) {
            day2 = days2;
        }
        if (month2 < 10) {
            month2 = '0' + month2;
        }
        var tbnextmonth = year2 + '-' + month2 + '-' + day2;
        nui.get("planrepaydate").setValue(tbnextmonth);
    }
	//计划还款日期只能是一个月之内的日期
    function changePlanDate(e){
    	var tbdate = nui.get("tbdate").getValue();
    	var year = tbdate.getFullYear(); //获取当前日期的年份
        var month = tbdate.getMonth()+1; //获取当前日期的月份
        var day = tbdate.getDate(); //获取当前日期的日
        var days = new Date(year, month, 0);
        days = days.getDate(); //获取当前日期中的月的天数
        var year2 = year;
        var month2 = parseInt(month) + 1;
        if (month2 == 13) {
            year2 = parseInt(year2) + 1;
            month2 = 1;
        }
        var day2 = day;
        var days2 = new Date(year2, month2, 0);
        days2 = days2.getDate();
        if (day2 > days2) {
            day2 = days2;
        }
        if (month2 < 10) {
            month2 = '0' + month2;
        }
        var tbnextmonth = year2 + '-' + month2 + '-' + day2;
        var tbnexttime = new Date(tbnextmonth).getTime();
        var plantime =  new Date(e.value.substring(0,10)).getTime();
        if(plantime>tbnexttime){
        	alert("计划还款日期只能在当期日期一个月之内!")
        	nui.get("planrepaydate").setValue(planpaydates);
        	return;
        }
    }
	function onTypeFilterChanged(e){
    	var tempType = e.value;
    	var json = {parentId:tempType};
    	nui.ajax({
    		url: "com.primeton.eos.machine.machine.getSecType.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function(o){
				var data = o.childType;
				var secType = nui.get("sectype");      	
				secType.load(data);
				secType.select(0);
            }
    	});
    }
    
    function onNameFilterChanged(e){
    	var tempType=e;
    	showEmpAndOrg(tempType);
    }
    
    function showEmpAndOrg(tempType){
    	if(tempType == 2){
			nui.get("usingemp").setValue("");
			nui.get("deptname").setValue("");
			nui.get("projectno").setValue("");   		
			document.getElementById("temp").style.display = "none";
    		nui.get("usingemp").setRequired(false);    
    		nui.get("deptname").setRequired(false);    
    		nui.get("projectno").setRequired(false);    
    	} else {
    		document.getElementById("temp").style.display = "";
    		nui.get("usingemp").setRequired(true);    
    		nui.get("deptname").setRequired(true);    
    		nui.get("projectno").setRequired(true);    
    	} 
    }
    
    function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.userid);
		                btnEdit.setText(data.empname);
		                var temp2=nui.get("deptname");
		                temp2.setValue(data.orgid);
		                temp2.setText(data.orgname);
					}
				}
				nui.get("usingemp").validate();
				nui.get("deptname").validate();
			}
		});
	}
	
    function showDept(e){
    	var btnEdit = this;
		nui.open({
            url:"<%=request.getContextPath() %>/machine/SelectOrganization.jsp",
			title: "选择列表",
			width: 650,
			height: 380,
			ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须克隆
                    if (data) {                   	
						btnEdit.setValue(data.orgid);
		                btnEdit.setText(data.orgname);
						var isNeedPay = nui.get("isNeedPay").getValue();
						if("1" == isNeedPay){
					   	    nui.get("benefprojno1").setValue("");
					   	   	nui.get("projno1").setValue("");
					   	   	nui.get("benefcustid1").setValue("");
					   	   	nui.get("benefcustid1").setText("");
		  					nui.get("beneforgid1").setValue(data.orgid);
					   	   	var jsonOrg =nui.encode({"orgid": data.orgid});
				   	    	setProject(jsonOrg);
					   	}
                    }
                }
				nui.get("deptname").validate();
			}
        });
    }
    //项目清除时操作
    function changProject(e){
    	var projectno =e.value;
	    if(projectno == null || projectno ==""){
	   	    nui.get("benefprojno1").setValue("");
	   	   	nui.get("projno1").setValue("");
	   	   	nui.get("benefcustid1").setValue("");
	   	   	nui.get("benefcustid1").setText("");
	    }else{
			var isNeedPay = nui.get("isNeedPay").getValue();
			if("1" == isNeedPay){
			   	nui.get("benefprojno1").setValue(projectno);
			   	   	
   	  			var projects = nui.get("benefprojno1").getData();
		  		var iscontain =false;
		  		if(projects.length >0){
	  				for(var ii=0;ii<projects.length;ii++){
	  					if(projectno == projects[ii].projectno){
	  						iscontain=true;
	  					}
	  				}
	  			}
		  		if(iscontain){
					nui.get("projno1").setValue(projectno);
  					setCust(projectno);
		  		}else{
				   	nui.get("projno1").setValue("");
				   	nui.get("benefcustid1").setValue("");
				   	nui.get("benefcustid1").setText("");
		  		}
			}
	    }
    }
    
	//选择项目
	function selectProject(){
		var btnEdit = this;
        nui.open({
            url:"<%=request.getContextPath()%>/ame_common/SelectProject.jsp?preSettle=bukongzhi",
            title: "选择项目",
            width: 850,
            height: 420,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);
                    if (data) {
                        btnEdit.setValue(data.projectno);
                        btnEdit.setText(data.projectno);
						var isNeedPay = nui.get("isNeedPay").getValue();
						if("1" == isNeedPay){
						 	var projectno = data.projectno;
					   	    nui.get("benefprojno1").setValue(data.projectno);
					   	   	nui.get("projno1").setValue(data.projectno);
					   	   	
	       	  				var projects = nui.get("benefprojno1").getData();
				  			var iscontain =false;
				  			if(projects.length >0){
				  				for(var ii=0;ii<projects.length;ii++){
				  					if(projectno == projects[ii].projectno){
				  						iscontain=true;
				  					}
				  				}
				  			}
				  			if(iscontain){
								nui.get("projno1").setValue(projectno);
		  						setCust(projectno);
				  			}else{
						   	   	nui.get("projno1").setValue("");
						   	   	nui.get("benefcustid1").setValue("");
						   	   	nui.get("benefcustid1").setText("");
				  			}
					   	}
	                }
				}
			}
        });
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
</html>