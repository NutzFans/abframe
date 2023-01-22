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
  - Author(s): xuqingqian
  - Date: 2016-10-18 15:01:58
  - Description:
-->
<head>
    <title>发起项目考核分配流程</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    html, body
	    {
	        font-size:12px;
	        padding:0;
	        margin:0;
	        border:0;
	        height:100%;
	        overflow:hidden;
	    }
	     .myIndex{
	        background:#FFF68F;
	    }
	    .asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;
	    }
	</style>
</head>
<body>
<div class="nui-fit">
    <div class="mini-panel" title="项目考核分配流程" style="width: auto">
        <!-- 提示信息展示 -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<form id="form1" method="post">
			<input name="rdprojcheck.fileids" id="fileids" class="nui-hidden"/>
			<input name="rdprojcheck.projectid" id="projectid" class="nui-hidden"/>
			<input name="rdprojcheck.custname" id="custname" class="nui-hidden"/>
			<input name="rdprojcheck.orgname" id="orgname" class="nui-hidden"/>
			<input name="rdprojcheck.managername" id="managername" class="nui-hidden"/>
			<input name="rdprojcheck.eStatus" id="eStatus" class="nui-hidden"/><!-- 暂时保存/发起 -->
		     <fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		        <legend>选择考核方案</legend>
				<input name="rdprojcheck.projcheckid" id="projcheckid" class="nui-hidden"/>
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:150px;">考核方案：</td>
							<td colspan="3"><input name="projectname"  onbuttonclick="selectProjectCheck" id="projectnames"   class="nui-buttonedit" emptyText="请选择项目" required="false" style="width:300px" allowInput="true" />
							</td>
						</tr>
					</table>
				</div>
		     </fieldset>
		     
		     <fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
		       <legend>基本信息</legend>
		       		<table style="table-layout:fixed;" id="a1">
						<tr>
							<td align="right" style="width:150px;">项目名称：</td>
							<td id="projectname" class="asLabel" colspan="3"></td>
							<td align="right" style="width:150px;">项目编号：</td>
							<td id="projectno" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">客户：</td>
							<td id="custid" class="asLabel" colspan="3"></td>
							<td align="right" style="width:150px;">合同编号：</td>
							<td id="contnum" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">项目经理：</td>
							<td id="manager" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">受益销售：</td>
							<td id="orgid" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">考核状态：</td>
							<td id="checkstatus" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">考核方案发起日期：</td>
							<td id="checkstartdate" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">考核方案确认日期：</td>
							<td id="projcheckdate" class="asLabel" style="width:150px"></td>
						</tr>
					</table>
		     </fieldset>
		     
		     <fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
		       <legend>预算情况</legend>
					<table style="table-layout:fixed;" id="a2">
						<tr>
							<td align="right" style="width:150px;">产品合同额：</td>
							<td id="prodmon" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">服务合同额：</td>
							<td id="servmon" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">合同总额：</td>
							<td id="contmon" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">产品不含税收入：</td>
							<td id="prodincomenet" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">服务不含税收入：</td>
							<td id="servincomenet" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">合同毛收入：</td>
							<td id="grossincome" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">产品退税：</td>
							<td id="prodtaxback" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">合同净收入：</td>
							<td id="netincome" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">预算总成本：</td>
							<td id="budget" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">项目外部采购：</td>
							<td id="outbuy" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">预算总成本(不含外购)：</td>
							<td id="budgetcost" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">预算毛利：</td>
							<td id="projgross" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">预算毛利率：</td>
							<td id="projgrossrate" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">预算转换系数：</td>
							<td id="budgetratio" class="asLabel" style="width:150px"></td>
						</tr>
					</table>
		     </fieldset>
		     
		     <fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		       <legend>考核方案</legend>
		       		<table style="table-layout:fixed;" id="a3">
						<tr>
							<td align="right" style="width:150px;">项目类型 ：</td>
							<td id="projecttype" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">考核对应收入确认年月：</td>
							<td id="checkincomeym" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">节省成本奖金提取比例：</td>
							<td id="bonusrate" class="asLabel" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">项目经理分配比例：</td>
							<td id="managerrate" class="asLabel" style="width:150px"></td>
							<td align="right" style="width:150px;">奖金发放时机：</td>
							<td id="bonustime" class="asLabel" ></td>
							<td align="right" style="width:150px;">目标奖金：</td>
							<td id="targetbonus" class="asLabel"" ></td>
						</tr>
						<tr>
							<td align="right" style="width:150px;">考核时机及主要约定：</td>
							<td id="checktime" class="asLabel" colspan="5" height=50px></td>
							
						</tr>
						<tr>
							<td align="right" style="width:150px;">考核其他附加要求：</td>
							<td id="checkmemo" class="asLabel" colspan="5" style="width:auto"></td>
						</tr>
					</table>
		     </fieldset>
		</form>
		 <div class="nui-tabs" activeIndex="0" id="tabs">
	     	<div title="项目预算与执行损益对照表" id="sunyi" name="sunyi">
	     		<iframe src="" id="projectSunYi" frameborder="0" scrolling="no" height="600px" width="100%" style="text-align: left;"></iframe>
     		</div>
     		<div title="项目人员工作量投入统计" id="tongji" name="tongji">
	       		<iframe src="" id="workrdport" frameborder="0" scrolling="no" height="600px" width="100%" style="text-align: left;"></iframe>
     		</div>
     		<div title="项目考核附件" id="fujian" name="fujian">
     			<jsp:include page="/ame_common/detailFile.jsp"/>
     			<jsp:include page="/ame_common/addFiles.jsp"/>
     		</div>
	     </div>
	     <fieldset id="field41" style="border:solid 1px #aaa;padding:3px;">
	     	<legend>项目考核模拟</legend>
		     	<input class="nui-hidden" id="budgetcost1"/>
				<input class="nui-hidden" id="bonusrate"/>
				<input class="nui-hidden" id="managerrate"/>
				<input class="nui-hidden" id="labordiffcost"/>
		     	<table style="table-layout:fixed;" id="a4">
		     		<tr>
		     			<td style="color: red;" colspan="5">说明：以下模拟产生的奖金不是最终考核奖金</td>
		     		</tr>
					<tr>
						<td align="right" style="width:180px;">考核时实际成本(不含外购)：</td>
						<td>
							<input name="simulation.a" id="a" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"  style="width:150px" onValuechanged="changenum"/>
						</td>
						<td align="right" style="width:150px;">其他扣减或维护预留成本：</td>
						<td>
							<input name="simulation.c" id="c" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right" style="width:150px" onValuechanged="changenum"/>
						</td>
						<td align="right" style="width:150px;">考核核算成本：</td>
						<td >
							<input name="simulation.d" id="d" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right" style="width:150px;" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:150px;">工时预算调差成本：</td>
						<td id="labordiffcost1" class="asLabel">
						</td>
						<td align="right" style="width:120px;">预算校准成本：</td>
						<td >
							<input name="simulation.budgetactcost" id="budgetactcost" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"  readonly="readonly" style="width: 150px;"/>
						</td>
						<td align="right" style="width:120px;">项目节省成本：</td>
						<td >
							<input name="simulation.e" id="e" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"  readonly="readonly" style="width: 150px;"/>
						</td>
					</tr>	
					<tr>
						<td align="right" style="width:120px;">预算偏离度系数：</td>
						<td >
							<input name="simulation.f" id="f" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"  readonly="readonly" style="width: 150px;"/>
						</td>
						<td align="right" style="width:120px;">收入确认延误系数：</td>
						<td >
							<input name="simulation.g" id="g" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right" style="width: 150px;" onValuechanged="changenum"/>
						</td>
						<td align="right" style="width:120px;">项目奖金：</td>
						<td >
							<input name="simulation.h" id="h" class="nui-spinner" readonly="readonly" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"   style="width: 150px;"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">项目经理奖金：</td>
						<td >
							<input name="simulation.i" id="i" class="nui-spinner" readonly="readonly" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right"  style="width: 150px;"/>
						</td>
						<td align="right" style="width:120px;">其他人员奖金：</td>
						<td >
							<input name="simulation.j" id="j" class="nui-spinner" readonly="readonly" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right" style="width: 150px;"/>
						</td>
					</tr>
				</table>
	     </fieldset>
		<form id="opioionform" method="post">
		        <div style="padding: 5px;" id="opinionHide">
		            <table style="table-layout: fixed;">
		            	<tr id="salesEdit">
		                    <td style="width: 150px;" align="right">审核结果：</td>
		                    <td style="width: 250px;">
								<input name="misOpinion.auditstatus" id="auditstatus" class="nui-dictradiogroup" style="width: 250px;" 
									required="false" dictTypeId="MIS_AUDITSTATUS" onvaluechanged="show()" value="1" />
		                    </td>
		                </tr>
		                <tr>
		                    <td style="width: 150px;height: auto;" align="right">任务处理说明：</td>
		                    <td colspan="3">
		                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" 
		                        	style="width: 600px;height: 40px;"/>
		                    </td>
		                </tr>
		            </table>
		        </div>
	    	</form>
    </div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注流程</a>
   <a class="nui-button" onclick="onOk('1')" iconCls="icon-upload" style="width:160px;margin-right:20px;" id="appButton">发起项目考核分配流程</a>
</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
   <input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
   <input type="hidden" name="downloadFile" filter="false"/>
   <input type="hidden" name="fileName" filter="false"/>
</form> 
	<script type="text/javascript">
		
		nui.parse();
		
		var form = new nui.Form("form1");
		var opioionform = new nui.Form("opioionform");
		document.getElementById("tabs").style.display="none";
		nui.get("auditstatus").setValue(3);
		var ismanager = '<%=request.getParameter("ismanager") %>';
		document.getElementById("salesEdit").style.display="none";
		document.getElementById("field2").style.display="none";
		document.getElementById("field3").style.display="none";
		document.getElementById("field4").style.display="none";
		document.getElementById("field41").style.display="none";
		document.getElementById("opioionform").style.display="none";
		promptInit({"workItemID": 0,"processDefName": "com.primeton.rdmgr.project.assessmentProject","activityDefID": "manualActivity"});
	  	<%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	    %>
	    var projcheck;
		
		var budgetratio;//预算转换系数
        //选择项目考核方案
        function selectProjectCheck(){
        	var btnEdit = this;
            nui.open({
                url:"<%=request.getContextPath() %>/project/assessmentProject/selectProjectCheck.jsp?ismanager="+ismanager,
                title: "选择考核项目",
                width: 850,
                height: 460,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);
                        if (data) {
                        	projcheck = data;
							
							//加载附件设置参数
		            		nui.get("grid_0").load({"groupid":"rdprojcheck","relationid": projcheck.projcheckid});
		            		
		            		var report = nui.getDictText('AME_SYSCONF','AMEREPORT');
		            		var ame = nui.getDictText('AME_SYSCONF','AMEPATH');
		            		document.getElementById("projectSunYi").src = ame + "project/rdproject/projectprofit.jsp?projid="+projcheck.projectid;
		            		document.getElementById("workrdport").src = report + "reportJsp/showReport4Proj.jsp?rpx=/rdprojectTJ.rpx&projectno="+projcheck.projectno;
							
							//基本信息
							nui.get("projectid").setValue(projcheck.projectid);
							nui.get("projectnames").setValue(projcheck.projcheckid);
							nui.get("projcheckid").setValue(projcheck.projcheckid);
							nui.get("projectnames").setText(projcheck.projectname);
							document.getElementById("projectname").innerHTML = projcheck.projectname == null? "":projcheck.projectname;
							document.getElementById("projectno").innerHTML = projcheck.projectno == null? "":projcheck.projectno;
							document.getElementById("contnum").innerHTML = projcheck.contnum == null? "":projcheck.contnum;
							document.getElementById("orgid").innerHTML= projcheck.orgname == null? "":projcheck.orgname;
							nui.get("orgname").setValue(projcheck.orgname);
							document.getElementById("manager").innerHTML= projcheck.managername == null? "":projcheck.managername;
							nui.get("managername").setValue(projcheck.managername);
							document.getElementById("custid").innerHTML= projcheck.custname == null? "":projcheck.custname;
							nui.get("custname").setValue(projcheck.custname);
							document.getElementById("checkstatus").innerHTML = projcheck.checkstatus == null? "":nui.getDictText('CHECK_STATUS',projcheck.checkstatus);
							document.getElementById("checkstartdate").innerHTML = projcheck.checkstartdate;
							document.getElementById("projcheckdate").innerHTML = projcheck.projcheckdate == null? "":projcheck.projcheckdate;
							nui.get("projcheckid").setValue(projcheck.projcheckid);
		                    //预算信息
		                    document.getElementById("prodmon").innerHTML = projcheck.prodmon == null? "":formatNumber(projcheck.prodmon);
		                    document.getElementById("servmon").innerHTML = projcheck.servmon == null? "":formatNumber(projcheck.servmon);
		                    document.getElementById("prodincomenet").innerHTML = projcheck.prodincomenet == null? "":formatNumber(projcheck.prodincomenet);
		                    document.getElementById("servincomenet").innerHTML = projcheck.servincomenet == null? "":formatNumber(projcheck.servincomenet);
		                    document.getElementById("prodtaxback").innerHTML = projcheck.prodtaxback == null? "":formatNumber(projcheck.prodtaxback);
		                    document.getElementById("budget").innerHTML = projcheck.budget == null? "":formatNumber(projcheck.budget);
		                    document.getElementById("budgetcost").innerHTML = projcheck.budgetcost == null? "":formatNumber(projcheck.budgetcost);
		                    document.getElementById("contmon").innerHTML = projcheck.contmon == null? "":formatNumber(projcheck.contmon);
		                    document.getElementById("netincome").innerHTML = projcheck.netincome == null? "":formatNumber(projcheck.netincome);
		                    document.getElementById("grossincome").innerHTML = projcheck.grossincome == null? "":formatNumber(projcheck.grossincome);
		                   	document.getElementById("projgross").innerHTML = projcheck.projgross == null? "":formatNumber(projcheck.projgross);
		                    document.getElementById("projgrossrate").innerHTML = projcheck.projgrossrate == null? "":formatNumber(projcheck.projgrossrate,3);
		                    document.getElementById("outbuy").innerHTML = projcheck.outbuy == null? "":formatNumber(projcheck.outbuy);
							//项目考核方案
							document.getElementById("projecttype").innerHTML = projcheck.projecttype == null? "":nui.getDictText('RD_CHECK_TYPE',projcheck.projecttype);
							document.getElementById("checkincomeym").innerHTML = projcheck.checkincomeym == null? "":projcheck.checkincomeym;
							document.getElementById("managerrate").innerHTML = projcheck.managerrate == null? "":projcheck.managerrate;
							document.getElementById("bonusrate").innerHTML = projcheck.bonusrate == null? "":projcheck.bonusrate;
							document.getElementById("budgetratio").innerHTML = projcheck.budgetratio == null? "":projcheck.budgetratio;
							document.getElementById("bonustime").innerHTML = projcheck.bonustime == null? "":projcheck.bonustime;
							document.getElementById("checktime").innerHTML = projcheck.checktime == null? "":projcheck.checktime;
							document.getElementById("checkmemo").innerHTML = projcheck.checkmemo == null? "":projcheck.checkmemo;
							document.getElementById("targetbonus").innerHTML = projcheck.targetbonus == null? "":projcheck.targetbonus;
							budgetratio = projcheck.budgetratio;
							json = nui.encode({projectid: projcheck.projectid,budgetratio:projcheck.budgetratio});
					    	nui.ajax({
					            url: "com.primeton.rdmgr.project.assessmentProject.getAssessmentProCost.biz.ext",
								type: 'POST',
								data: json,	
								contentType: 'text/json',
					            success: function (o) {
				                   	var pcostsum1 = o.budget1.pcostsum;
				                   	var pconsultfee1= o.budget1.pconsultfee
				                   	var labordiffcost= o.budget1.labordiffcost
				                   	//考核模拟
									nui.get("budgetcost1").setValue(projcheck.budgetcost);
					        		nui.get("bonusrate").setValue(projcheck.bonusrate);
					        		nui.get("managerrate").setValue(projcheck.managerrate);
					        		nui.get("c").setValue(0);
					        		nui.get("g").setValue(1);
					        		nui.get("a").setValue(pcostsum1-pconsultfee1);//项目总成本去除外购
					        		nui.get("labordiffcost").setValue(labordiffcost);//工时预算调差成本
					        		nui.get("budgetactcost").setValue(parseFloat(projcheck.budgetcost)+parseFloat(labordiffcost));//预算校准成本
					        		document.getElementById("labordiffcost1").innerHTML = "<a href='javascript:void(0)' onclick='checkDetail1();' title='点击查看'>"+ formatNumber(labordiffcost,'2') +"</a>";
					        		changenum();
									
									document.getElementById("field2").style.display="";
									document.getElementById("field3").style.display="";
									document.getElementById("field4").style.display="";
									document.getElementById("tabs").style.display="";
									document.getElementById("field41").style.display="";
									document.getElementById("opioionform").style.display="";
				                },
				                error: function (jqXHR, textStatus, errorThrown) {
				                    alert(jqXHR.responseText);
				                }
				            });
                        }
                    }
                }
            });
        }
        
		//发起流程
		function SaveData(){
			form.mask("流程提交中...");
			var data_opioion = opioionform.getData();
			var data = form.getData();
			var rdprojcheck = data.rdprojcheck;
			var guanzhu = nui.get("guanZhuButton").getValue();
			var a = nui.get("a").getValue();
			var c = nui.get("c").getValue();
			var g = nui.get("g").getValue();
			var labordiffcost = nui.get("labordiffcost").getValue();
			var budgetactcost = nui.get("budgetactcost").getValue();
			rdprojcheck.guanzhu = guanzhu;
			rdprojcheck.serviceCost = a;
			rdprojcheck.reservecost = c;
			rdprojcheck.delayCoefficient = g;
			projcheck.labordiffcost = labordiffcost;
			projcheck.budgetactcost = budgetactcost;
			var json = nui.encode({"rdprojcheck":rdprojcheck,"misOpinion": data_opioion.misOpinion,"projcheck":projcheck});
			 nui.ajax({
                url: "com.primeton.rdmgr.project.assessmentProject.createAssessmentProject.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                   	var returnJson = nui.decode(text);
                   	var eStatus = nui.get("eStatus").getValue();
	              	if(returnJson.result == "success"){
	              		form.unmask();
	    				if(eStatus==1){
		                   	nui.alert("发起流程成功！","系统提示",function (){
		                   		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
		                   	});
	    				}else if(eStatus==0){
	    					nui.alert("暂时保存成功！","系统提示",function (){
	    						window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
	    						form.unmask();
	    					});
	    				}
	              	}else{
                   		form.unmask();
						nui.get("appButton").enable();
	    				if(eStatus==1){
		                   	nui.alert("发起流程失败！");
	    				}else if(eStatus==0){
	    					nui.alert("暂时保存失败！");
	    				}
	              	}
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
		}
		
		function onOk(e){
			if(!form.validate()){
    			nui.alert("表单信息填写不完整，请确认必输项是否填写!");
    			return;
    		}
    		var projectname = nui.get("projectnames").getValue();
			if(projectname ==""||projectname==null){
				alert("请先选择要进行考核的项目考核方案！");
				return;
			}
    		nui.get("eStatus").setValue(e);
        	if(1 == e){
	        	nui.confirm("是否确定发起项目考核确认?","操作提示",function(o){
	        		if("ok" == o){
	        			nui.get("appButton").disable();
	        			document.getElementById("fileCatalog").value="ProjectCheck";
			        	form2.submit();
	        		}else{
	        			
	        		}
	        	});
        	}else if(0 == e){
		        nui.confirm("是否暂时保存申请流程？暂时保存后可以在待办任务中进行查询处理！","操作提示",function(o){
		        	if("ok" == o){
		        		nui.get("appButton").disable();
		        		document.getElementById("fileCatalog").value="ProjectCheck";
			        	form2.submit();
		        	}else{
		        	
		        	}
		        });
	        }
	    }
    
        function onCancel(e) {
            var data = form.getData();
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
        
        function changenum(){
	    	var a = nui.get("a").getValue();//考核时实际服务成本
	    	var c = nui.get("c").getValue();//维护期间预留成本
	    	var g = nui.get("g").getValue();//收入确认延误系数
	    	if(parseFloat(g)<0 || parseFloat(g)>1){
	    		alert("收入确认延误系数不能大于1或小于0！");
	    		nui.get("g").setValue(1);
	    		g = 1;
	    	}
	    	var budget = nui.get("budgetactcost").getValue();//预算校准成本
	    	var bonusrate = nui.get("bonusrate").getValue();
	    	var managerrate = nui.get("managerrate").getValue();
	    	var d = parseFloat(a)+parseFloat(c);//考核核算成本=不含外购已确认成本+其他扣减或维护预留成本+工时系数调差成本
	    	var e = parseFloat(budget) - parseFloat(d);//项目节省成本=不含外购的项目预算成本-考核实际核算成本
	    	if((parseFloat(d)-parseFloat(budget))/parseFloat(budget) < -0.2){//预算偏离系数计算规则（=1.2+IF(-项目节省成本/不含外购的项目预算成本<-0.2,-项目节省成本/不含外购的项目预算成本,-0.2)）
	    		var f = (1.2 + (parseFloat(d)-parseFloat(budget))/parseFloat(budget)).toFixed(2); 
	    	}else{
	    		var f = 1.2 - 0.2;
	    	}
	    	if(parseFloat(e)<=0){
	    		var h = 0;
	    	}else{
	    		if(parseFloat(e)*parseFloat(f)*parseFloat(g)*parseFloat(bonusrate)>parseFloat(budget)*0.06){
		    		var h = parseFloat(budget) * 0.06;
		    	}else{
		    		var h = parseFloat(e)*parseFloat(f)*parseFloat(g)*parseFloat(bonusrate);
		    	}
	    	}
	    	var i = parseFloat(h) * parseFloat(managerrate);
	    	var j = parseFloat(h) - parseFloat(i);
	    	nui.get("d").setValue(parseFloat(d));
	    	nui.get("e").setValue(parseFloat(e));
	    	nui.get("f").setValue(parseFloat(f).toFixed(2));
	    	nui.get("h").setValue(parseFloat(h));
	    	nui.get("i").setValue(parseFloat(i));
	    	nui.get("j").setValue(parseFloat(j));
	    }
        
	    //数字格式
	    function delcommafy(num){
		  num=num.replace(/,/gi,'');
		  return parseFloat(num);
		}
        
        //格式化千分位
		function formatNumber(num,cent) {
			if(cent==null||cent==""){
				cent = 2;
			}
			num = num.toString().replace(/\$|\,/g,'');  
	        // 检查传入数值为数值类型  
	         if(isNaN(num))  
	          num = "0";  
	        // 获取符号(正/负数)  
	        sign = (num == (num = Math.abs(num)));  
	        num = Math.floor(num*Math.pow(10,cent)+0.50000000001); // 把指定的小数位先转换成整数.多余的小数位四舍五入  
	        cents = num%Math.pow(10,cent);       // 求出小数位数值  
	        num = Math.floor(num/Math.pow(10,cent)).toString();  // 求出整数位数值  
	        cents = cents.toString();        // 把小数位转换成字符串,以便求小数位长度  
	       
	        // 补足小数位到指定的位数  
	        while(cents.length<cent)  
	         cents = "0" + cents;  
	         // 对整数部分进行千分位格式化.  
	         for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)  
	          num = num.substring(0,num.length-(4*i+3))+','+ num.substring(num.length-(4*i+3));  
	        return (((sign)?'':'-') + num + '.' + cents); 
		}
	
		//日期格式化
	    function ondealdate(e){
		    var date = e.substring(0,10);
		    return date;
		}
		
		function initData(data){
			projcheck = data.row;
			//加载附件设置参数
    		nui.get("grid_0").load({"groupid":"rdprojcheck","relationid": projcheck.projcheckid});
    		
    		var report = nui.getDictText('AME_SYSCONF','AMEREPORT');
    		var ame = nui.getDictText('AME_SYSCONF','AMEPATH');
    		document.getElementById("projectSunYi").src = ame + "project/rdproject/projectprofit.jsp?projid="+projcheck.projectid;
    		document.getElementById("workrdport").src = report + "reportJsp/showReport4Proj.jsp?rpx=/rdprojectTJ.rpx&projectno="+projcheck.projectno;
			
			//基本信息
			nui.get("projectid").setValue(projcheck.projectid);
			nui.get("projectnames").setValue(projcheck.projcheckid);
			nui.get("projcheckid").setValue(projcheck.projcheckid);
			nui.get("projectnames").setText(projcheck.projectname);
			document.getElementById("projectname").innerHTML = projcheck.projectname == null? "":projcheck.projectname;
			document.getElementById("projectno").innerHTML = projcheck.projectno == null? "":projcheck.projectno;
			document.getElementById("contnum").innerHTML = projcheck.contnum == null? "":projcheck.contnum;
			document.getElementById("orgid").innerHTML= projcheck.orgname == null? "":projcheck.orgname;
			nui.get("orgname").setValue(projcheck.orgname);
			document.getElementById("manager").innerHTML= projcheck.managername == null? "":projcheck.managername;
			nui.get("managername").setValue(projcheck.managername);
			document.getElementById("custid").innerHTML= projcheck.custname == null? "":projcheck.custname;
			nui.get("custname").setValue(projcheck.custname);
			document.getElementById("checkstatus").innerHTML = projcheck.checkstatus == null? "":nui.getDictText('CHECK_STATUS',projcheck.checkstatus);
			document.getElementById("checkstartdate").innerHTML = projcheck.checkstartdate;
			document.getElementById("projcheckdate").innerHTML = projcheck.projcheckdate == null? "":projcheck.projcheckdate;
			nui.get("projcheckid").setValue(projcheck.projcheckid);
            //预算信息
            document.getElementById("prodmon").innerHTML = projcheck.prodmon == null? "":formatNumber(projcheck.prodmon);
            document.getElementById("servmon").innerHTML = projcheck.servmon == null? "":formatNumber(projcheck.servmon);
            document.getElementById("prodincomenet").innerHTML = projcheck.prodincomenet == null? "":formatNumber(projcheck.prodincomenet);
            document.getElementById("servincomenet").innerHTML = projcheck.servincomenet == null? "":formatNumber(projcheck.servincomenet);
            document.getElementById("prodtaxback").innerHTML = projcheck.prodtaxback == null? "":formatNumber(projcheck.prodtaxback);
            document.getElementById("budget").innerHTML = projcheck.budget == null? "":formatNumber(projcheck.budget);
            document.getElementById("contmon").innerHTML = projcheck.contmon == null? "":formatNumber(projcheck.contmon);
            document.getElementById("netincome").innerHTML = projcheck.netincome == null? "":formatNumber(projcheck.netincome);
            document.getElementById("grossincome").innerHTML = projcheck.grossincome == null? "":formatNumber(projcheck.grossincome);
           	document.getElementById("projgross").innerHTML = projcheck.projgross == null? "":formatNumber(projcheck.projgross);
            document.getElementById("projgrossrate").innerHTML = projcheck.projgrossrate == null? "":formatNumber(projcheck.projgrossrate,3);
            document.getElementById("outbuy").innerHTML = projcheck.outbuy == null? "":formatNumber(projcheck.outbuy);
			document.getElementById("budgetcost").innerHTML = projcheck.budgetcost == null? "":formatNumber(projcheck.budgetcost);
			//项目考核方案
			document.getElementById("projecttype").innerHTML = projcheck.projecttype == null? "":nui.getDictText('RD_CHECK_TYPE',projcheck.projecttype);
			document.getElementById("checkincomeym").innerHTML = projcheck.checkincomeym == null? "":projcheck.checkincomeym;
			document.getElementById("managerrate").innerHTML = projcheck.managerrate == null? "":projcheck.managerrate;
			document.getElementById("bonusrate").innerHTML = projcheck.bonusrate == null? "":projcheck.bonusrate;
			document.getElementById("bonustime").innerHTML = projcheck.bonustime == null? "":projcheck.bonustime;
			document.getElementById("checktime").innerHTML = projcheck.checktime == null? "":projcheck.checktime;
			document.getElementById("checkmemo").innerHTML = projcheck.checkmemo == null? "":projcheck.checkmemo;
			document.getElementById("targetbonus").innerHTML = projcheck.targetbonus == null? "":projcheck.targetbonus;
			document.getElementById("budgetratio").innerHTML = projcheck.budgetratio == null? "":projcheck.budgetratio;
			budgetratio = projcheck.budgetratio;
			json = nui.encode({projectid: projcheck.projectid,budgetratio:projcheck.budgetratio});
	    	nui.ajax({
	            url: "com.primeton.rdmgr.project.assessmentProject.getAssessmentProCost.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
                   	var pcostsum1 = o.budget1.pcostsum;
	               	var pconsultfee1= o.budget1.pconsultfee
	               	var labordiffcost= o.budget1.labordiffcost
	               	//考核模拟
					nui.get("budgetcost1").setValue(projcheck.budgetcost);
	        		nui.get("bonusrate").setValue(projcheck.bonusrate);
	        		nui.get("managerrate").setValue(projcheck.managerrate);
	        		nui.get("c").setValue(0);
	        		nui.get("g").setValue(1);
	        		nui.get("a").setValue(pcostsum1-pconsultfee1);//项目总成本去除外购
	        		nui.get("labordiffcost").setValue(labordiffcost);//工时预算调差成本
	        		nui.get("budgetactcost").setValue(parseFloat(projcheck.budgetcost)+parseFloat(labordiffcost));//预算校准成本
	        		document.getElementById("labordiffcost1").innerHTML = "<a href='javascript:void(0)' onclick='checkDetail1();' title='点击查看'>"+ formatNumber(labordiffcost,'2') +"</a>";
	        		changenum();
					
					document.getElementById("field2").style.display="";
					document.getElementById("field3").style.display="";
					document.getElementById("field4").style.display="";
					document.getElementById("tabs").style.display="";
					document.getElementById("field41").style.display="";
					document.getElementById("opioionform").style.display="";
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
		}
		
		function checkDetail1(){
			var projectid=nui.get("projectid").getValue();
			var executeUrl = "<%=request.getContextPath() %>/project/assessmentProject/detailPempcost.jsp?id=" + projectid+"&budgetratio="+budgetratio;
			window.open(executeUrl, "应用详细信息", "fullscreen=1");
	    }
	</script>
</body>
</html>