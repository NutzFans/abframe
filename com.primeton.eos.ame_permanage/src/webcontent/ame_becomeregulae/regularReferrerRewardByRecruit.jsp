<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): xupc
  - Date: 2020-04-23
  - Description:
-->
<head>
<title>内推转正金额确认</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    .asLabel{border:0;background-color:#F5F5F5;cursor:default;}
</style>
</head>
<body>
<%long workItemID = (Long)request.getAttribute("workItemID"); %> 
<div class="nui-fit">
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
	<form id="form1" method="post">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>试用期转正评价</legend>
			<div style="padding:5px;">
				<input name="emp.empid" id="empid"  class="nui-hidden"/>
				<input name="emp.userid" id="userid"  class="nui-hidden"/>
				<input name="ver.processinstid" id="processinstid"  class="nui-hidden"/>
				<input name="ver.empveriid" id="empveriid"  class="nui-hidden"/>
				<input name="resume.resumeid" id="resumeid"  class="nui-hidden"/>
				<input name="resume.referrer" id="referrer"  class="nui-hidden"/>
				<input name="resume.operatorid" id="operatorid"  class="nui-hidden"/>
				<input name="omRecruit.orgid" id="orgid"  class="nui-hidden"/>
				<input name="omRecruit.recruitid" id="recruitid"  class="nui-hidden"/>
				<table style="table-layout:fixed;" >	
					<tr>
						<td align="right" style="width:130px">姓名：</td>
						<td name="emp.empname" class = "asLabel" id="empname" style="width:190px"></td>
						<td align="right" style="width:130px">员工工号：</td>
						<td name="emp.empcode" class = "asLabel" id="empcode" style="width:190px"></td>
						<td align="right" style="width:130px">所属部门：</td>
						<td name="emp.orgname" class = "asLabel" id="orgname" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">职位：</td>
						<td name="emp.positionname" class = "asLabel" id="positionname" style="width:190px"></td>
						<td align="right" style="width:130px">直属主管：</td>
						<td name="emp.majorname" class = "asLabel" id="majorname" style="width:190px"></td>
						<td align="right" style="width:130px">入职导师：</td>
						<td class = "asLabel" style="width:190px">
							<input name="emp.mentor" id="mentor" class="mini-textboxlist" textField="EMPNAME" valueField="USERID" searchField="name"  url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext"  width="100%"  readonly="true"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:130px">试用期时间：</td>
						<td name="ver.veristart" class = "asLabel" id="veristart" style="width:190px"></td>
						<td align="right" style="width:130px">学历验证：</td>
						<td name="ver.eduverify" class = "asLabel" id="eduverify" style="width:190px"></td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;display:true">
			<legend>内推转正金额设置</legend>
			<input name="refferrewarddetail.refferexpmouldno" id="refferexpmouldno"  class="nui-hidden"/>
			<input name="refferrewarddetail.eventtype" id="eventtype"  class="nui-hidden"/>
			<div style="padding:5px;">
					<table style="table-layout:fixed;" >
						<tr>
							<td align="right" style="width:130px">内推转正金额：</td>
							<td  style="width:120px">
							     <input name="refferrewarddetail.rewardmoney" id="rewardmoney" class="nui-spinner" format="n2"  allowLimitValue="false"showbutton="false" changeOnMousewheel="false" style="width:190px;text-align:right;" />
							</td>
							<td align="right" style="width:130px">发放年月：</td>
							<td  style="width:120px">
							     <input name="refferrewarddetail.paydate" id="paydate"class="nui-datepicker" style="width:190px" align="right"/>
							</td>
						</tr>
					</table>
			  </div>  
		<!-- </fieldset>	
		<fieldset style="border:solid 1px #aaa;padding:3px;display:true">
		    <legend >内推奖励列表</legend> -->
		    <div id="grid_rewardmoneydetail" class="nui-datagrid" style="width:100%;height:auto;"  showPager="false" showSummaryRow="true" ondrawsummarycell="drawsummary"  >
		        <div property="columns">
			      	<div field="referrername" headerAlign="center" align="center" width="75">推荐人</div>
			    	<div field="eventtype"headerAlign="center" name = "eventtype" width="80px" align="center" renderer="eventType">奖励事件 </div>
			      	<div field="rewardmoney" headerAlign="center" align="right"  width="80" dataType="currency" summaryType="sum">奖励金额</div>
			      	<div field="beneforgname" headerAlign="center" align="center" width="80">受益部门</div>
			      	<div field="rewardstatus" headerAlign="center" align="center" width="80" renderer="rewardStatus">处理状态</div>
			      	<div field="createdate" headerAlign="center" align="center" width="120" renderer = "ondealdate">产生时间</div>
			      	<div field="paydate" headerAlign="center" align="center"  width="80" >发放日期</div>
		        </div>
		  	</div>
		</fieldset>	
		<fieldset style="border:solid 1px #aaa;padding:3px;display:true">
			<legend>转正审批意见</legend>
			<div id="omAppraises" class="nui-datagrid" style="width:100%;height:auto;" dataField="omAppraises" showPager="false" onrowclick="rowclick"
				allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" url="com.primeton.eos.ame_permanage.ame_becomeregulae.getOmAppraises.biz.ext" 
				allowSortColumn="true" allowCellWrap="false">
				<div property="columns">
					<input field="appraiseid" class="nui-hidden" visible="false">
					<div field="appraisertype" width="45" headerAlign="center"  align="center" allowSort="true" renderer="getappraisertype">审批人角色</div>
					<div field="appraiser" displayField="appraisername"width="45" headerAlign="center" align="center" >审批人</div>
					<div field="appraisedtae" width="50" headerAlign="center" align="center" allowSort="true" dateFormat="yyyy-MM-dd H:mm:ss">审批时间</div>
					<div field="appraisestatus" width="45" headerAlign="center"  align="center" allowSort="true" renderer="getappraisestatus">审批意见</div>
					<div field="appraise" width="70" headerAlign="center" align="left">转正评价</div>
				</div>
			</div>
		</fieldset>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;display:true">
			<legend>流程审批意见</legend>
			<div id="datagrid2" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
			    url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext"  idField="id" allowResize="true"
			    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
			    <div property="columns">
			    	<div type="indexcolumn" headerAlign="center" width="30" >编号</div>
			        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
			        <div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
			        <div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center">处理结果</div>
			        <div field="auditopinion" width="150" headerAlign="center">处理意见</div>
			        <div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
			        <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
			        <div field="files" renderer="onFileRenderer" width="100" hight="100"  align="center" headerAlign="center">附件</div>
			    </div>
			</div>
		</fieldset>
	</form>
	<!-- 审核意见  -->
	<fieldset  >
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</fieldset>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk('4')" iconCls="icon-ok" style="width:60px;margin-right:10px;" id="appButton">提交</a>
	<a class="nui-button"onclick="onCancel" iconCls="icon-close" style="width:60px;margin-right:10px;">关闭</a>
	<a class="nui-button" onclick="onOk('2')" iconCls="icon-remove" style="width:90px;margin-right:10px;display:none;" id="appButton2">终止流程</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form1 = new nui.Form("form1");
	var grid_rewardmoneydetail = nui.get("grid_rewardmoneydetail");
	var omAppraises = nui.get('omAppraises');
	var data = [];
	
	initdate();
  	function initdate(){
  		promptInit({workItemID: <%=workItemID %>});//流程提示信息 
  		nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_becomeregulae.getRegularProcess.biz.ext",
            data: {workItemID:<%=workItemID %>,processInstID:null},
            type: 'POST',
			contentType: 'text/json',
            success: function (o) {
            	data = o;
            	if(data.ver){
            		document.getElementById("empname").innerHTML = o.emp.empname == null ?"":o.emp.empname;
            		document.getElementById("empcode").innerHTML = o.emp.empcode == null ?"":o.emp.empcode;
            		document.getElementById("orgname").innerHTML = o.emp.orgname == null ?"":o.emp.orgname;
            		document.getElementById("positionname").innerHTML = o.emp.positionname == null ?"":nui.getDictText('AME_POSITION_MEMO',o.emp.positionname);
            		document.getElementById("majorname").innerHTML = o.emp.majorname == null ?"":o.emp.majorname;
            		document.getElementById("veristart").innerHTML = (o.ver.veristart == null ?"":o.ver.veristart+'至')+(o.ver.veriend == null ?"":o.ver.veriend);
            		document.getElementById("eduverify").innerHTML = (o.emp.eduverify == null ?"":nui.getDictText('EDUVERIFY',o.emp.eduverify));
            		
            		//设置导师
            		nui.get("mentor").setValue(o.emp.mentor);
            		nui.get("mentor").setText(o.emp.mentorname);
            		
            		form1.setData(data);
            		
            		omAppraises.load({"criteria": {"_expr[0]": { "empveriid": o.ver.empveriid},"_expr[1]": {"_property": "appraisertype","_op": "<>","_value": '0'}}});
					omAppraises.sortBy("appraisedtae", "asc");
            		
            		var grid_rewardmoneydetail_json = nui.encode({resumeid:o.resume.resumeid});
            		nui.ajax({
		                url: "com.primeton.eos.ame_permanage.ame_becomeregulae.getRewardmoneyDetail.biz.ext",
						type: 'POST',
						data: grid_rewardmoneydetail_json,	
						contentType: 'text/json',
		                success: function (o) {
		                	grid_rewardmoneydetail.setData(o.rewardmoneydetail);
		                	//默认设置金额
            		        nui.get("rewardmoney").setValue(o.refferexpmould.rewardmoney);
            		        /* nui.get("paydate").setValue(new Date()); */
            		        nui.get("refferexpmouldno").setValue(o.refferexpmould.refferexpmouldno);
            		        nui.get("eventtype").setValue(o.refferexpmould.eventtype);
		                }
		            });
		            
            		//审批意见的流程实例ID
					nui.get("processinstid").setValue(o.ver.processinstid);
               		nui.get("auditstatus").setValue("4"); 
					nui.get("workitemid").setValue(<%=workItemID %>);
               		nui.get("activitydefid").setValue(o.workitem.activityDefID);
               		
	                //审核结果设置
					var dataStatus = [{"dictID": 4,"dictName": "处理"}];
					nui.get("auditstatus").setData(dataStatus);
					nui.get("auditstatus").setValue("4");
					nui.get("auditopinion").setValue("已设置转正金额。");
					var processinstid = o.ver.processinstid;
					
					var grid1 = nui.get("datagrid2");
					grid1.load({"processInstID": processinstid});
					grid1.sortBy("time", "desc");
        		}
    		},
    		 error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
		});	
  	}
	
	var message = "提交";
	function onOk(auditstatus){
    	if(auditstatus=='4'){
    		message = "提交";
			nui.get("backTo").setValue(null);
    	}else if(auditstatus=='2'){
    		message = "终止";
			nui.get("backTo").setValue(null);
    	}
    	nui.get("auditstatus").setValue(auditstatus);
    	show();
		if(!form1.validate() && auditstatus!="2" && auditstatus!="0"){
			nui.alert("信息录入不完整!");
			return;
		}else{
    		SaveData();
		}
	}
	
	function SaveData(){
		var json = form1.getData();
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		nui.confirm("确定要"+message+"转正流程吗？","操作提示",function (action){
			if(action == "ok"){
				nui.get("appButton").setEnabled(false);
				nui.get("appButton2").setEnabled(false);
				form1.loading("处理中,请稍后...");
				nui.ajax({
	    			url:"com.primeton.eos.ame_permanage.ame_becomeregulae.BecomeProcessRewardmoney.biz.ext",
	    			data: json,
	    			type:"post",
	    			contentType:"text/json",
	    			success:function(action){
	    				action = nui.clone(action);
	    				form1.unmask();
	    				if(action.exception == null){
	    					nui.alert(message+"转正流程成功！","系统提示",function(){
				        		CloseWindow("ok");
			    				nui.get("appButton").setEnabled(true);
			    				nui.get("appButton2").setEnabled(true);
				        	});
	    				}else{
	    					nui.alert("流程提交失败！","系统提示",function (){
			    				nui.get("appButton").setEnabled(true);
			    				nui.get("appButton2").setEnabled(true);
	    					});
	    				}
	    			},
	    			error:function(jqXHR, teactionatus, errorThrown){
	    				nui.alert("error:" + jqXHR.responseText);
	    			}
	    		});
			}
		});
	}
	
	//关闭
	function onCancel(e) {
    	var data = form1.getData();
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
    function CloseWindow(action){
		if (action == "close" && form1.isChanged()){
			if (confirm("数据被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	function getappraisertype(e){
		return nui.getDictText('VERI_APPRAISETYPE',e.value);//设置业务字典值
	}
	function getappraisestatus(e){
		return nui.getDictText('VERI_STATUS',e.value);//设置业务字典值
	}
	 function rewardStatus(e){
		return nui.getDictText('AME_REWARDSTATUS',e.value);//内推简历是否确认
	}
	function eventType(e){
		return nui.getDictText('REFFER_EVENTTYPE',e.value);//内推简历是否确认
	}
	//汇总行样式
    function drawsummary(e){
    	if(e.field=="rewardmoney"||e.field=="rewardmoney"){
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
    	}
    }
    //日期格式化---时分秒的格式化
    function ondealdate(e){
		if(typeof(e.value)=="string" && e.value != '' && e.value != null && e.value != 'null'){
			return e.value.substring(0,16);
		}else{
			//alert(nui.formatDate(e.value,"yyyy-MM-dd HH:mm"))
			return nui.formatDate(e.value,"yyyy-MM-dd HH:mm");
		}
	}
</script>
</html>