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
    <title>项目考核方案审批流程</title>
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
	</style>
</head>
<body>
<div class="nui-fit">
    <div class="mini-panel" title="项目考核方案审批流程" style="width: auto">
        <!-- 提示信息展示 -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<form id="form1" method="post">
			<input name="rdprojcheck.fileids" id="fileids" class="nui-hidden"/>
			<input name="rdprojcheck.eStatus" id="eStatus" class="nui-hidden"/><!-- 暂时保存/发起 -->
			<input name="rdprojcheck.orgid" id="orgid" class="nui-hidden"/>
			<input name="rdprojcheck.custid" id="custid" class="nui-hidden"/>
			<input name="project.projectIds" id="projectIds" class="nui-hidden"/>
			<input name="project.managername" id="managername" class="nui-hidden"/>
		     <fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		        <legend>选择项目</legend>
				<input name="rdprojcheck.projcheckid" id="projcheckid" class="nui-hidden"/>
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">考核项目：</td>
							<td colspan="3"><input name="projectname"  onbuttonclick="selectProject" id="projectnames"   class="nui-buttonedit" emptyText="请选择项目" required="false" style="width:300px" allowInput="true" />
							</td>
						</tr>
					</table>
				</div>
		     </fieldset>
		     
		     <fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
		       <legend>项目基本信息</legend>
		       		<table style="table-layout:fixed;" id="a1">
						<tr>
							<td align="right" style="width:120px;">项目名称：</td>
							<td>
								<input name="rdprojcheck.projectname" id="projectname" class="nui-textbox" style="width:150px" required="false"/>
							</td>
							<td align="right" style="width:120px;">项目编号：</td>
							<td>
								<input name="rdprojcheck.projectno" id="projectno" class="nui-textbox" style="width:150px" readonly="readonly" />
							</td>
							<td align="right" style="width:120px;">客户名称：</td>
							<td>
								<input name="project.custname" id="custname" class="nui-textbox" style="width:150px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">受益销售：</td>
							<td>
								<input name="project.orgname" id="orgname" class="nui-textbox" style="width:150px" allowInput="true" />
							</td>
							<td align="right" style="width:120px;">相应合同编号：</td>
							<td>
								<input name="rdprojcheck.contnum" id="contnum" class="nui-buttonedit" inputStyle="text-align: right" style="width:150px" required="true" onbuttonclick="selectCont" allowInput="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">实施责任部门：</td>
							<td>
								<input name="project.managerdeptname" id="managerdeptname" class="nui-textbox" style="width:150px" readonly="readonly" />
							</td>
							<td align="right" style="width:120px;">项目经理：</td>
							<td>
								<input name="rdprojcheck.manager" id="manager" class="mini-textboxlist" inputStyle="text-align: right" style="width:150px" required="true"
	        						url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" searchField="name"
	        						textField="empname" valueField="userid" />
							</td>
							<td align="right" style="width:120px;">考核预算版本：</td>
							<td>
								<input name="project.cbversion" id="cbversion" class="nui-textbox" style="width:150px" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">项目开始日期：</td>
							<td>
								<input name="project.startdate" id="startdate" class="nui-datepicker" inputStyle="text-align: right" style="width:150px" required="true" />
							</td>
							<td align="right" style="width:120px;">预计完成日期：</td>
							<td>
								<input name="project.expenddate" id="expenddate" class="nui-datepicker" inputStyle="text-align: right" style="width:150px" required="true" />
							</td>
							<td align="right" style="width:120px;">项目考核发起日期：</td>
							<td>
								<input name="rdprojcheck.checkstartdate" id="checkDate" class="nui-datepicker" inputStyle="text-align: right" style="width:150px" required="true" />
							</td>
						</tr>
					</table>
		     </fieldset>
		     
		     <fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
		       <legend>预算情况</legend>
		       		<table style="table-layout:fixed;" id="a1">
						<tr>
							<td align="right" style="width:120px;">产品合同额：</td>
							<td>
								<input name="rdprojcheck.prodmon" id="prodmon" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" readonly="readonly" />
							</td>
							<td align="right" style="width:120px;">服务合同额：</td>
							<td>
								<input name="rdprojcheck.servmon" id="servmon" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" readonly="readonly" />
							</td>
							<td align="right" style="width:140px;">合同总额：</td>
							<td>
								<input name="rdprojcheck.contmon" id="contmon" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">产品不含税收入：</td>
							<td>
								<input name="rdprojcheck.prodincomenet" id="prodincomenet" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" readonly="readonly" />
							</td>
							<td align="right" style="width:120px;">服务不含税收入：</td>
							<td>
								<input name="rdprojcheck.servincomenet" id="servincomenet" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" readonly="readonly" />
							</td>
							<td align="right" style="width:120px;">合同毛收入：</td>
							<td>
								<input name="rdprojcheck.grossincome" id="grossincome" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">产品退税：</td>
							<td>
								<input name="rdprojcheck.prodtaxback" id="prodtaxback" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" readonly="readonly" />
							</td>
							<td align="right" style="width:120px;">合同净收入：</td>
							<td>
								<input name="rdprojcheck.netincome" id="netincome" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">预算总成本：</td>
							<td>
								<input name="rdprojcheck.budget" id="budget" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" readonly="readonly" />
							</td>
							<td align="right" style="width:120px;">项目外部采购：</td>
							<td>
								<input name="rdprojcheck.outbuy" id="outbuy" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" readonly="readonly"/>
							</td>
							<td align="right" style="width:120px;">预算总成本(不含外购)：</td>
							<td>
								<input name="rdprojcheck.budgetcost" id="budgetcost" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">已确认成本：</td>
							<td>
								<input name="rdprojcheck.assessmentcost" id="assessmentcost" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" required="true" onValuechanged="changeNum"/>
							</td>
							<td align="right" style="width:120px;">预计后续成本：</td>
							<td>
								<input name="rdprojcheck.followupcost" id="followupcost" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" readonly="readonly" />
							</td>
							<td align="right" style="width:120px;">预算转换系数：</td>
							<td>
								<input name="rdprojcheck.budgetratio" id="budgetratio" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" required="true"  required="true"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">考核毛利下限：</td>
							<td>
								<input name="project.jiangyouA" id="jiangyouA" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" readonly="readonly"/>
							</td>
							<td align="right" style="width:120px;">预算毛利：</td>
							<td>
								<input name="rdprojcheck.projgross" id="projgross" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" readonly="readonly"/>
							</td>
							<td align="right" style="width:120px;">预算毛利率：</td>
							<td>
								<input name="rdprojcheck.projgrossrate" id="projgrossrate" class="nui-spinner" format="n3" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px" readonly="readonly"/>
							</td>
						</tr>
					</table>
		     </fieldset>
		     
		     <fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
		       <legend>考核方案</legend>
		       		<table style="table-layout:fixed;" id="a1">
						<tr>
							<td align="right" style="width:120px;">考核项目类型：</td>
							<td>
								<input name="rdprojcheck.projecttype" id="projecttype" class="nui-dictcombobox" dictTypeId="RD_CHECK_TYPE" inputStyle="text-align: right" style="width:150px" shownullItem="true" />
							</td>
							<td align="right" style="width:120px;">对应收入确认年月：</td>
							<td>
								<input name="rdprojcheck.checkincomeym" id="checkincomeym" class="nui-monthpicker" inputStyle="text-align: right" style="width:150px" format="yyyy-MM"/>
							</td>
							<td align="right" style="width:120px;">奖金提成比例：</td>
							<td>
								<input name="rdprojcheck.bonusrate" id="bonusrate" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px"  />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">项目经理分配比例：</td>
							<td>
								<input name="rdprojcheck.managerrate" id="managerrate" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" 
									inputStyle="text-align: right" style="width:150px"  />
							</td>
							<td align="right" style="width:120px;">奖金发放时机：</td>
							<td >
								<input name="rdprojcheck.bonustime" id="bonustime" class="nui-textbox" style="width:100%;" />
							</td>
							<td align="right" style="width:120px;">目标奖金：</td>
							<td colspan="3">
								<input name="rdprojcheck.targetbonus" id="targetbonus" format="n2" class="nui-spinner" style="width:100%;" inputStyle="text-align: right"  allowLimitValue="false" changeOnMousewheel="false" showbutton="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">考核时机及主要约定：</td>
							<td colspan="5">
								<input name="rdprojcheck.checktime" id="checktime" class="nui-textarea"  style="width:100%  " />
							</td>
						</tr>
						<tr>
						<tr>
							<td align="right" style="width:120px;">考核附加说明：</td>
							<td colspan="5">
								<input name="rdprojcheck.checkmemo" id="checkmemo" class="nui-textarea"  style="width: 100%;"/>
							</td>
						</tr>
					</table>
		     </fieldset>
		</form>
		<table style="table-layout:fixed;" id="a18">
			<tr>
                <td style="width: 126px;height: auto;" align="right">考核方案制定人：</td>
                <td >
                   <input id="leader" class="mini-textboxlist"  name="leader.sybmanagerid" searchField="name" style="width:180px;"
						url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
						textField="empname" valueField="userid" required="true"/>
                </td>
                <td style="color: red;">(在【确定项目考核方案】环节中将按照考核方案制定人的顺序进行审批)</td>
            </tr>
		</table>
		 <fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
			<legend>项目考核附件</legend>
			<jsp:include page="/ame_common/addFiles.jsp"/>
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
   <a class="nui-button" onclick="onOk('1')" iconCls="icon-upload" style="width:140px;margin-right:20px;" id="appButton">发起项目考核流程</a>
   <a class="nui-button" onclick="onOk('0')" iconCls="icon-save" style="width:95px;margin-right:20px;" id="saveButton">暂时保存</a>
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
		nui.get("auditstatus").setValue(3);
		document.getElementById("salesEdit").style.display="none";
		document.getElementById("field2").style.display="none";
		document.getElementById("field3").style.display="none";
		document.getElementById("field5").style.display="none";
		document.getElementById("field4").style.display="none";
		document.getElementById("a18").style.display="none";
		document.getElementById("opioionform").style.display="none";
		promptInit({"workItemID": 0,"processDefName": "com.primeton.rdmgr.project.examineToProject","activityDefID": "manualActivity"});
	  	<%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	    %>
		
		
        //选择项目
        function selectProject(){
        	var btnEdit = this;
            nui.open({
                url:"<%=request.getContextPath() %>/project/examineToProject/selectCheckProj.jsp",
                title: "选择项目",
                width: 850,
                height: 440,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);
                        if (data) {
                        	var json = nui.encode({"rdprojects":data});
						 	nui.ajax({
					            url: "com.primeton.rdmgr.project.examineToProject.getProjV.biz.ext",
					            data: json,
					            type: 'POST',
					            cache: false,
					            contentType: 'text/json',
					            success: function (o) {
					            	data = o.rdprojects;
					            	var projectId;
		                        	var projectName;
		                        	var projectno;
		                        	var contnum;
		                        	var prodmon;//产品合同额
		                        	var servmon;//服务合同额
		                        	var prodincomenet;//产品不含税收入
		                        	var servincomenet;//服务不含税收入
		                        	var prodtaxback;//产品退税
		                        	var assessmentcost;//评估日已发生成本
		                        	var budget;//预算总成本
		                        	var outbuy;//项目外部采购
		                        	if(data.length>1){
		                        		for(var i = 0;i<data.length;i++){
		                        			if(i==0){
		                        				projectId = data[i].projectId;
		                        				projectName = data[i].projectName;
		                        				projectno = data[i].projectno;
		                        				contnum = data[i].contnum;
		                        				if(data[i].prjBugdetVer!=null){
		                        					prodmon = data[i].prjBugdetVer.pcontamt;
						                        	servmon = data[i].prjBugdetVer.scontamt;
						                        	prodincomenet = data[i].prjBugdetVer.pntaxincome;
						                        	servincomenet = data[i].prjBugdetVer.sntaxincome;
						                        	prodtaxback = data[i].prjBugdetVer.ppayback;
						                        	assessmentcost = 0;
						                        	budget = data[i].prjBugdetVer.pcostsum;
						                        	outbuy = data[i].prjBugdetVer.pconsultfee;
		                        				}
		                        			}else{
		                        				projectId += "," + data[i].projectId;
		                        				projectName += "," + data[i].projectName;
		                        				projectno += "," + data[i].projectno;
		                        				contnum += "," + data[i].contnum;
		                        				if(data[i].prjBugdetVer!=null){
		                        					if(parseFloat(data[i].prjBugdetVer.pcontamt)!=0){
		                        						var prodmon1 = parseFloat(prodmon);
		                        						prodmon1 += parseFloat(data[i].prjBugdetVer.pcontamt);
		                        						prodmon = parseFloat(prodmon1);
		                        					}
		                        					if(parseFloat(data[i].prjBugdetVer.scontamt)!=0){
		                        						var servmon1 = parseFloat(servmon);
		                        						servmon1 += parseFloat(data[i].prjBugdetVer.scontamt);
		                        						servmon = parseFloat(servmon1);
		                        					}
						                        	if(parseFloat(data[i].prjBugdetVer.pntaxincome)!=0){
						                        		var prodincomenet1 = parseFloat(prodincomenet);
		                        						prodincomenet1 += parseFloat(data[i].prjBugdetVer.pntaxincome);
		                        						prodincomenet = parseFloat(prodincomenet1);
		                        					}
		                        					if(parseFloat(data[i].prjBugdetVer.sntaxincome)!=0){
		                        						var servincomenet1 = parseFloat(servincomenet);
		                        						servincomenet1 += parseFloat(data[i].prjBugdetVer.sntaxincome);
		                        						servincomenet = parseFloat(servincomenet1);
		                        					}
		                        					if(parseFloat(data[i].prjBugdetVer.ppayback)!=0){
		                        						var prodtaxback1 = parseFloat(prodtaxback);
		                        						prodtaxback1 += parseFloat(data[i].prjBugdetVer.ppayback);
		                        						prodtaxback = parseFloat(prodtaxback1);
		                        					}
		                        					if(parseFloat(data[i].prjBugdetVer.pcostsum)!=0){
		                        						var budget1 = parseFloat(budget);
		                        						budget1 += parseFloat(data[i].prjBugdetVer.pcostsum);
		                        						budget = parseFloat(budget1);
		                        					}
		                        					if(parseFloat(data[i].prjBugdetVer.pconsultfee)!=0){
		                        						var outbuy1 = parseFloat(outbuy);
		                        						outbuy1 += parseFloat(data[i].prjBugdetVer.pconsultfee);
		                        						outbuy = parseFloat(outbuy1);
		                        					}
		                        				}
		                        			}
		                    			}
		                            }else{
		                            	projectId = data[0].projectId;
		                            	projectName = data[0].projectName;
		                            	projectno = data[0].projectno;
		                            	contnum = data[0].contnum;
		                            	if(data[0].prjBugdetVer!=null){
		                            		prodmon = data[0].prjBugdetVer.pcontamt;
				                        	servmon = data[0].prjBugdetVer.scontamt;
				                        	prodincomenet = data[0].prjBugdetVer.pntaxincome;
				                        	servincomenet = data[0].prjBugdetVer.sntaxincome;
				                        	prodtaxback = data[0].prjBugdetVer.ppayback;
				                        	assessmentcost = 0;
				                        	budget = data[0].prjBugdetVer.pcostsum;
				                        	outbuy = data[0].prjBugdetVer.pconsultfee;
		                            	}
		                            }
		                            var contmon;//合同总额
		                            var netincome;//合同净收入
		                            var grossincome;//合同毛收入
		                            var followupcost;//预计后续成本
		                            var jiangyouA;//考核毛利下限
		                            var projgross;//预算毛利
		                            var projgrossrate;//预算毛利率
		                            
		                            contmon = parseFloat(prodmon)+parseFloat(servmon);
		                            netincome = parseFloat(prodincomenet)+parseFloat(servincomenet)+parseFloat(prodtaxback)-parseFloat(outbuy);
		                            grossincome = parseFloat(prodincomenet)+parseFloat(servincomenet);
		                            followupcost = parseFloat(budget)-outbuy-parseFloat(assessmentcost);
		                            if(parseFloat(prodincomenet) > 0){
		                            	jiangyouA = parseFloat(servincomenet) * parseFloat(0.3) + (parseFloat(prodincomenet) + parseFloat(prodtaxback)) * parseFloat(0.6);
		                            }else{
		                            	jiangyouA = parseFloat(servincomenet) * parseFloat(0.35);
		                            }
		                            
		                            projgross = parseFloat(prodtaxback) + parseFloat(grossincome) - parseFloat(budget);
		                            projgrossrate = parseFloat(projgross) / (parseFloat(grossincome) + parseFloat(prodtaxback));
		                            //基本信息
		                            nui.get("projectIds").setValue(projectId);
		                            nui.get("projectnames").setText(projectName);
		                            nui.get("projectnames").setValue(projectno);
		                            nui.get("projectname").setValue(projectName);
		                            nui.get("projectno").setValue(projectno);
		                            nui.get("contnum").setValue(contnum);
		                          	nui.get("contnum").setText(contnum);
		                            nui.get("custname").setValue(data[0].custname);
		                            nui.get("custid").setValue(data[0].custid);
		                            nui.get("orgname").setValue(data[0].orgname);
		                            nui.get("orgid").setValue(data[0].finUnitId);
		                            nui.get("manager").setValue(data[0].manager);
		                            nui.get("manager").setText(data[0].managername);
		                            nui.get("managerdeptname").setValue(data[0].mangerdeptname);
		                            nui.get("startdate").setValue(data[0].startdate);
		                            nui.get("expenddate").setValue(data[0].expenddate);
		                            nui.get("cbversion").setValue(data[0].cbversion);
		                            var myDate = new Date();
							    	var year = myDate.getFullYear();
							    	var month = myDate.getMonth()+1;
							    	var day = myDate.getDate();
							    	if(month<10){
							    		month = "0" + month;
							    	}
							    	if(day<10){
							    		day = "0" + day;
							    	}
							    	var nowDate = year +"-"+ month +"-"+ day;
									nui.get("checkDate").setValue(nowDate);
		                            if(nui.encode(data[0].cbversion)!='null'){
		                            	//预算信息
			                            nui.get("prodmon").setValue(prodmon);
			                            nui.get("servmon").setValue(servmon);
			                            nui.get("prodincomenet").setValue(prodincomenet);
			                            nui.get("servincomenet").setValue(servincomenet);
			                            nui.get("prodtaxback").setValue(prodtaxback);
			                            nui.get("assessmentcost").setValue("");
			                            nui.get("budget").setValue(budget);
			                            nui.get("contmon").setValue(contmon);
			                            nui.get("netincome").setValue(netincome);
			                            nui.get("grossincome").setValue(grossincome);
			                            nui.get("followupcost").setValue(followupcost);
			                            nui.get("jiangyouA").setValue(parseFloat(jiangyouA).toFixed(2));
			                            nui.get("projgross").setValue(projgross);
			                            nui.get("projgrossrate").setValue(parseFloat(projgrossrate).toFixed(3));
			                            nui.get("outbuy").setValue(parseFloat(outbuy).toFixed(2));
			                            nui.get("budgetcost").setValue(parseFloat(budget-outbuy).toFixed(2));//不含外购得预算总成本
			                            if(parseFloat(projgross)<parseFloat(jiangyouA)){
				                        	nui.get("projgross").setBorderStyle("background:#FF0000");
				                        }
		                            }
		                            var orgid = data[0].finUnitId;
		                          	var json = nui.encode({"orgid":orgid});
								 	nui.ajax({
						                url: "com.primeton.rdmgr.project.examineToProject.getLeaders.biz.ext",
						                data: json,
						                type: 'POST',
						                cache: false,
						                contentType: 'text/json',
						                success: function (o) {
						                   	var empname = o.names;
						                   	var userid = o.userids;
						                   	nui.get("leader").setValue(userid);
						                   	nui.get("leader").setText(empname);
						                   	document.getElementById("field2").style.display="";
											document.getElementById("field3").style.display="";
											document.getElementById("field5").style.display="";
											document.getElementById("field4").style.display="";
											document.getElementById("opioionform").style.display="";
											document.getElementById("a18").style.display="";
						                },
						                error: function (jqXHR, textStatus, errorThrown) {
						                    alert(jqXHR.responseText);
						                }
						            });  
					            }
					        });  
                        }
                    }
                }
            });
        }
        
        //选择销售合同弹窗(只能选择本事业部是合同)
        function selectCont(){
        	var data = nui.get("custname").getValue();
        	nui.open({
                url:"<%=request.getContextPath() %>/project/examineToProject/selectProjContract.jsp",
                title: "选择销售合同",
                width: 800,
                height: 400,
                allowResize: false,
                onload:function (){
                	var iframe = this.getIFrameEl();
                    iframe.contentWindow.setData(data);
                },
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                        	var contnum;
                        	var prodmon;//产品合同额
                        	var servmon;//服务合同额
                        	var assessmentcost;//评估日已发生成本
                        	var budget = nui.get("budget").getValue();//预算总成本
                        	var outbuy = nui.get("outbuy").getValue();//项目外部采购
                        	if(data.length>1){
                        		for(var i = 0;i<data.length;i++){
                        			if(i==0){
                        				contnum = data[i].contnum;
                    					prodmon = data[i].prodmon;
			                        	servmon = data[i].servmon;
			                        	assessmentcost = 0;
                        			}else{
                        				contnum += "," + data[i].contnum;
                    					if(parseFloat(data[i].prodmon)!=0){
                    						var prodmon1 = parseFloat(prodmon);
                    						prodmon1 += parseFloat(data[i].prodmon);
                    						prodmon = parseFloat(prodmon1);
                    					}
                    					if(parseFloat(data[i].servmon)!=0){
                    						var servmon1 = parseFloat(servmon);
                    						servmon1 += parseFloat(data[i].servmon);
                    						servmon = parseFloat(servmon1);
                    					}
                        			}
                    			}
                            }else{
                            	contnum = data[0].contnum;
                            	if(data[0]!=null){
                            		prodmon = data[0].prodmon;
		                        	servmon = data[0].servmon;
		                        	assessmentcost = 0;
                            	}
                            }
                            var contmon;//合同总额
                            var prodincomenet;//产品不含税收入
                        	var servincomenet;//服务不含税收入
                        	var prodtaxback;//产品退税
                            var netincome;//合同净收入
                            var grossincome;//合同毛收入
                            var followupcost;//预计后续成本
                            var jiangyouA;//考核毛利下限
                            var projgross;//预算毛利
                            var projgrossrate;//预算毛利率
                            
                            contmon = parseFloat(prodmon)+parseFloat(servmon);
                            prodincomenet = parseFloat(prodmon)/1.17;
                            servincomenet = parseFloat(servmon)/1.06;
                            prodtaxback = parseFloat(prodincomenet)*0.14;
                            netincome = parseFloat(prodincomenet)+parseFloat(servincomenet)+parseFloat(prodtaxback)-parseFloat(outbuy);
                            grossincome = parseFloat(prodincomenet)+parseFloat(servincomenet);
                            followupcost = parseFloat(budget)-parseFloat(assessmentcost);
                            if(parseFloat(prodincomenet) > 0){
                            	jiangyouA = parseFloat(servincomenet) * parseFloat(0.3) + (parseFloat(prodincomenet) + parseFloat(prodtaxback)) * parseFloat(0.6);
                            }else{
                            	jiangyouA = parseFloat(servincomenet) * parseFloat(0.35);
                            }
                            
                            projgross = parseFloat(prodtaxback) + parseFloat(grossincome) - parseFloat(budget);
                            projgrossrate = parseFloat(projgross) / (parseFloat(grossincome) + parseFloat(prodtaxback));
                            
                            //基本信息
                            nui.get("contnum").setValue(contnum);
                          	nui.get("contnum").setText(contnum);
                          	
                          	//预算信息
                            nui.get("prodmon").setValue(prodmon);
                            nui.get("servmon").setValue(servmon);
                            nui.get("prodincomenet").setValue(prodincomenet);
                            nui.get("servincomenet").setValue(servincomenet);
                            nui.get("prodtaxback").setValue(prodtaxback);
                            nui.get("assessmentcost").setValue(0);
                            nui.get("contmon").setValue(contmon);
                            nui.get("netincome").setValue(netincome);
                            nui.get("grossincome").setValue(grossincome);
                            nui.get("followupcost").setValue(followupcost);
                            nui.get("jiangyouA").setValue(parseFloat(jiangyouA).toFixed(2));
                            nui.get("projgross").setValue(projgross);
                            nui.get("projgrossrate").setValue(parseFloat(projgrossrate).toFixed(2));
                        }
                    }
                }
            });
        }
        
        function changeNum(){
        	var assessmentcost = nui.get("assessmentcost").getValue();
        	var budgetcost = nui.get("budgetcost").getValue();
        	var followupcost = parseFloat(budgetcost)-parseFloat(assessmentcost);
        	nui.get("followupcost").setValue(followupcost);
        }
    	
       
		//发起流程
		function SaveData(){
			var a = nui.get("leader").getValue();
			var b = nui.get("leader").getText();
			var data = form.getData();
			var data_opioion = opioionform.getData();
			var rdprojcheck = data.rdprojcheck;
			var checkincomeym = rdprojcheck.checkincomeym;
			if(checkincomeym!=null && checkincomeym!=""){
				var year =  checkincomeym.getFullYear();
				var month = checkincomeym.getMonth()+1;
				if(month<10){
					month = "0" + month;
				}
				rdprojcheck.checkincomeym = year + "" + month;
			}
			var project = data.project;
			rdprojcheck.guanzhu = nui.get("guanZhuButton").getValue();
			var json = nui.encode({"sybmanager":a,"technology":b,"project":project,"rdprojcheck":rdprojcheck,"misOpinion": data_opioion.misOpinion});
			 nui.ajax({
                url: "com.primeton.rdmgr.project.examineToProject.createProjectCheck.biz.ext",
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
						nui.get("saveButton").enable();
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
			var managername = nui.get("manager").getText();
			nui.get("managername").setValue(managername);
			if(!form.validate()){
    			nui.alert("表单信息填写不完整，请确认必输项是否填写!");
    			return;
    		}
    		var budgetratio=nui.get("budgetratio").getValue();
    		if(budgetratio==null||budgetratio==""){
    			nui.alert("预算转换系数不能为空");
    			return;
    		}
    		var projectname = nui.get("projectname").getValue();
			if(projectname ==""||projectname==null){
				alert("请先选择要进行考核的项目！");
				return;
			}
			var leader = nui.get("leader").getValue();
			if(leader==""||leader==null){
				alert("考核方案指定人不能为空！");
				return;
			}
    		nui.get("eStatus").setValue(e);
        	if(1 == e){
	        	nui.confirm("是否确定发起项目考核方案确认?","操作提示",function(o){
	        		if("ok" == o){
	        			nui.get("appButton").disable();
						nui.get("saveButton").disable();
	        			document.getElementById("fileCatalog").value="ProjectCheck";
			        	form2.submit();
	        		}else{
	        			
	        		}
	        	});
        	}else if(0 == e){
		        nui.confirm("是否暂时保存申请流程？暂时保存后可以在待办任务中进行查询处理！","操作提示",function(o){
		        	if("ok" == o){
		        		nui.get("appButton").disable();
						nui.get("saveButton").disable();
		        		document.getElementById("fileCatalog").value="csReveForecast";
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
	</script>
</body>
</html>