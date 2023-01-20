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
    <title>项目考核流程</title>
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
    <div class="mini-panel" title="项目考核流程" style="width: auto">
        <!-- 提示信息展示 -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<form id="form1" method="post">
			<input name="rdprojcheck.projcheckid" id="projcheckid" class="nui-hidden"/>
			<input name="rdprojcheck.fileids" id="fileids" class="nui-hidden"/>
			<input name="rdprojcheck.orgid" id="orgid" class="nui-hidden"/>
			<input name="project.projectIds" id="projectIds" class="nui-hidden"/>
			<input name="project.managername" id="managername" class="nui-hidden"/>
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
								<input name="rdprojcheck.contnum" id="contnum" class="nui-buttonedit" style="width:150px" onbuttonclick="selectCont" allowInput="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">实施责任部门：</td>
							<td>
								<input name="project.managerdeptname" id="managerdeptname" class="nui-textbox" style="width:150px" readonly="readonly" />
							</td>
							<td align="right" style="width:120px;">项目经理：</td>
							<td>
								<input name="rdprojcheck.manager" id="manager" class="mini-textboxlist" style="width:150px;"
	        						url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" searchField="name"
	        						textField="empname" valueField="userid" required="true"/>
							</td>
							<td align="right" style="width:120px;">考核预算版本：</td>
							<td>
								<input name="project.cbversion" id="cbversion" class="nui-textbox" style="width:150px" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">项目开始日期：</td>
							<td>
								<input name="project.startdate" id="startdate" class="nui-datepicker" style="width:150px" />
							</td>
							<td align="right" style="width:120px;">预计完成日期：</td>
							<td>
								<input name="project.expenddate" id="expenddate" class="nui-datepicker" style="width:150px" />
							</td>
							<td align="right" style="width:120px;">项目考核发起日期：</td>
							<td>
								<input name="rdprojcheck.checkstartdate" id="checkDate" class="nui-datepicker" style="width:150px" />
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
									inputStyle="text-align: right" style="width:150px"  required="true" readonly="readonly"/>
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
								<input name="rdprojcheck.projecttype" id="projecttype" class="nui-dictcombobox" dictTypeId="RD_CHECK_TYPE" style="width:150px" shownullItem="true" />
							</td>
							<td align="right" style="width:120px;">对应收入确认年月：</td>
							<td>
								<input name="rdprojcheck.checkincomeym" id="checkincomeym" class="nui-monthpicker" style="width:150px" format="yyyy-MM" />
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
								<input name="rdprojcheck.targetbonus" id="targetbonus" format="n2" class="nui-spinner" style="width:100%; "inputStyle="text-align: right" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" />
							</td>
						</tr>
						<tr>
							
							<td align="right" style="width:120px;">考核时机及主要约定：</td>
							<td colspan="5">
								<input name="rdprojcheck.checktime" id="checktime" class="nui-textarea" style="width:100% ;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">考核附加说明：</td>
							<td colspan="5">
								<input name="rdprojcheck.checkmemo" id="checkmemo" class="nui-textarea"  style="width: 100%;" />
							</td>
						</tr>
					</table>
		     </fieldset>
		</form>
		<table style="table-layout:fixed;" id="a18">
			<tr id="aa">
                <td style="width: 150px;height: auto;" align="right">考核方案制定人：</td>
                <td >
                   <input id="leader" class="mini-textboxlist"  name="leader.sybmanagerid" searchField="name" style="width:180px;"
						url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
						textField="empname" valueField="userid" required="true"/>
                </td>
                <td style="color: red;">(在【确定项目考核方案】环节中将按照考核方案制定人的顺序进行审批)</td>
            </tr>		
        </table>
        <div id="hidegaird">
        	<jsp:include page="/ame_common/checkList.jsp"/>	
        </div>
		 <fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
			<legend>项目考核附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
			<jsp:include page="/ame_common/addFiles.jsp"/>
		</fieldset>
		<form id="opioionform" method="post">
<!-- 	    <input name="misOpinion.auditopinion" value="修改合同审批信息" class="nui-hidden" /> -->
		    <input name="misOpinion.processinstid" id="processinstid" class="nui-hidden" />
		    <input name="misOpinion.processinstname" id="processinstname" class="nui-hidden" />
		    <input name="misOpinion.activitydefid" id="activitydefid" class="nui-hidden" />
		    <input name="misOpinion.workitemid" id="workitemid" class="nui-hidden" />
		    <input name="misOpinion.workitemname" id="workitemname" class="nui-hidden" />
		    <input name="misOpinion.isshow" id="isshow" class="nui-hidden" />
			<input name="misOpinion.fileids" id="fileids"  class="nui-hidden"/>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
		        <legend>处理意见列表</legend>
		        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
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
		        <div style="padding:5px;" id="opinionHide">
		            <table style="table-layout:fixed;">
		            	<tr id="salesEdit">
		                    <td style="width:150px;" align="right">审核结果：</td>
		                    <td style="width:250px;">  
								<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
		                    </td>
		                    <td style="width:366px;" align="right" colspan="2">  
		                    	<a class="nui-button" onclick="doSHZT" style="width:100px;margin-right:20px;">悬挂意见保存</a>
		                    </td>
		                </tr>
		                <tr id="choosehide">
		                    <td  style="width:150px;" align="right">回退到：</td> 
		                    <td style="width:250px;" colspan="3">
		                    	<input name="misOpinion.backTo" id="backTo" class="nui-combobox" valueField="id" textField="name" style="width:200px" required="true" />
		                    </td>
		                </tr>
		                <tr>
		                    <td style="width:150px;height:auto;" align="right">处理意见：</td>
		                    <td colspan="3">
		                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height: 40px;"/>
		                    </td>
		                </tr>
		            </table>
		        </div>
		    </fieldset>
	    </form>
    </div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">  
		<a class="nui-button" onclick="onOk" id="submitReimbProcess" style="width: 60px;margin-right:20px;">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>
</div>
	<script type="text/javascript">
	
		nui.parse();
		
		var form = new nui.Form("form1");
		var opioionform = new nui.Form("opioionform");
		nui.get("auditopinion").setValue("同意。");
	    document.getElementById("choosehide").style.display="none";
	    initMisOpinion({auditstatus:"1"});
	  	<%
	  		long workItemID=(Long)request.getAttribute("workItemID");
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	    %>
		init();
		function init(){
        	form.mask("数据加载中...");
        	//流程提示信息
			promptInit({workItemID: <%=workItemID %>});
			var json=nui.encode({workItemID: <%=workItemID %>});
			nui.ajax({
				url: "com.primeton.rdmgr.project.examineToProject.queryProjectCheck.biz.ext",
				type: "post",
				data: json,
				contentType: "text/json",
				success: function (o){
					var form = new nui.Form("form1");
					//加载附件设置参数
            		nui.get("grid_0").load({"groupid":"rdprojcheck","relationid": o.rdprojcheck.projcheckid});
            		
            		var rdprojcheck = o.rdprojcheck;
            		var project = o.project;
            		var leaders = o.leaders;
            		var workitem = o.workitem;
            		if(workitem.activityDefID == 'manualActivity2'){
            			nui.get("assessmentcost").setReadOnly(true);
            			nui.get("checkDate").setReadOnly(true);
            			nui.get("expenddate").setReadOnly(true);
            			nui.get("startdate").setReadOnly(true);
            			nui.get("contnum").setReadOnly(true);
            			nui.get("orgname").setReadOnly(true);
            			nui.get("projectname").setReadOnly(true);
            			nui.get("assessmentcost").setReadOnly(true);
            			nui.get("contnum").setShowButton(false);
            			
            			nui.get("projecttype").setRequired(true);
            			nui.get("checkincomeym").setRequired(true);
            			nui.get("bonusrate").setRequired(true);
            			nui.get("managerrate").setRequired(true);
            			nui.get("checktime").setRequired(true);
            			nui.get("bonustime").setRequired(true);
            			document.getElementById("aa").style.display="none";
            		}else{
            			document.getElementById("hidegaird").style.display="none";
            		}
					//基本信息
					nui.get("projcheckid").setValue(rdprojcheck.projcheckid);
					nui.get("projectIds").setValue(project.projectIds);
                    nui.get("projectname").setValue(rdprojcheck.projectname);
                    nui.get("projectno").setValue(rdprojcheck.projectno);
                    nui.get("contnum").setValue(rdprojcheck.contnum);
                    nui.get("contnum").setText(rdprojcheck.contnum);
                    nui.get("custname").setValue(project.custname);
                    nui.get("orgname").setValue(project.orgname);
                  	nui.get("orgid").setValue(rdprojcheck.orgid);
                    nui.get("manager").setValue(rdprojcheck.manager);
                    nui.get("manager").setText(project.managername);                                                                                         
                    nui.get("managerdeptname").setValue(project.managerdeptname);
                    nui.get("startdate").setValue(project.startdate);
                    nui.get("expenddate").setValue(project.expenddate);
                    nui.get("cbversion").setValue(project.cbversion);
                    nui.get("checkDate").setValue(rdprojcheck.checkstartdate);
                    //预算信息
                    nui.get("prodmon").setValue(rdprojcheck.prodmon);
                    nui.get("servmon").setValue(rdprojcheck.servmon);
                    nui.get("prodincomenet").setValue(rdprojcheck.prodincomenet);
                    nui.get("servincomenet").setValue(rdprojcheck.servincomenet);
                    nui.get("prodtaxback").setValue(rdprojcheck.prodtaxback);
                    nui.get("assessmentcost").setValue(rdprojcheck.assessmentcost);
                    nui.get("budget").setValue(rdprojcheck.budget);
                    nui.get("contmon").setValue(rdprojcheck.contmon);
                    nui.get("netincome").setValue(rdprojcheck.netincome);
                    nui.get("grossincome").setValue(rdprojcheck.grossincome);
                    nui.get("followupcost").setValue(rdprojcheck.followupcost);
                    nui.get("jiangyouA").setValue(project.jiangyouA);
                    nui.get("projgross").setValue(rdprojcheck.projgross);
                    nui.get("projgrossrate").setValue(rdprojcheck.projgrossrate);
                    nui.get("outbuy").setValue(rdprojcheck.outbuy);
                    nui.get("budgetcost").setValue(rdprojcheck.budgetcost);
					//项目考核方案
					nui.get("projecttype").setValue(rdprojcheck.projecttype);
					var checkincomeym = rdprojcheck.checkincomeym;
					if(checkincomeym!=null&&checkincomeym!=""){
						var year = checkincomeym.substring(0,4);
						var month = checkincomeym.substring(4,6);
						checkincomeym = year + "-" + month;
					}
                    nui.get("checkincomeym").setValue(checkincomeym);
                    nui.get("bonusrate").setValue(rdprojcheck.bonusrate);
                    nui.get("managerrate").setValue(rdprojcheck.managerrate);
                    nui.get("checktime").setValue(rdprojcheck.checktime);bonustime
                    nui.get("bonustime").setValue(rdprojcheck.bonustime);
                    nui.get("targetbonus").setValue(rdprojcheck.targetbonus);
                    nui.get("checkmemo").setValue(rdprojcheck.checkmemo);
                    nui.get("budgetratio").setValue(rdprojcheck.budgetratio);
                    //项目制定人
                    var leader = "";
                    var leadername = "";
                    for(var a = 0; a<leaders.length;a++){
               			if(a==0){
               				leader += leaders[a].id;
               				leadername += leaders[a].name;
               			}else{
               				leader += "," + leaders[a].id;
               				leadername += "," + leaders[a].name;
               			}
                    }
                    
                    //设置审核检查要点
					var checklistdata={processInstID:workitem.processInstID,processDefName:workitem.processDefName,activityDefID:workitem.activityDefID,workitemid:workitem.workItemID};
					queryChickList(checklistdata);
					
					nui.get("leader").setValue(leader);
					nui.get("leader").setText(leadername);
					//设置审核意见基本信息
					nui.get("processinstid").setValue(o.workitem.processInstID);
	               	nui.get("processinstname").setValue(o.workitem.processInstName);
	               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
	               	nui.get("workitemname").setValue(o.workitem.workItemName);
					nui.get("workitemid").setValue(<%=workItemID %>);
	               	nui.get("isshow").setValue("1");
	               	nui.get("auditstatus").setValue("1");
	               	nui.get("backTo").setData(o.rdprojcheck.backList);
	            	//查询审核意见
					var grid = nui.get("datagrid1");
					if(o.workitem.processInstID!=null||o.workitem.processInstID!=""){
						grid.sortBy("time", "desc");
						grid.load({processInstID: o.workitem.processInstID},function(){
							form.unmask();
						});
					}
				},
				error: function(){}
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
                        	var assessmentcost = nui.get("assessmentcost").getValue();;//评估日已发生成本
                        	var budget = nui.get("budget").getValue();//预算总成本
                        	var outbuy = nui.get("outbuy").getValue();//项目外部采购
                        	if(data.length>1){
                        		for(var i = 0;i<data.length;i++){
                        			if(i==0){
                        				contnum = data[i].contnum;
                    					prodmon = data[i].prodmon;
			                        	servmon = data[i].servmon;
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
                            grossincome = parseFloat(prodincomenet)+parseFloat(servincomenet)+parseFloat(prodtaxback);
                            followupcost = parseFloat(budget)-parseFloat(assessmentcost);
                            if(parseFloat(prodincomenet) > 0){
                            	jiangyouA = parseFloat(servincomenet) * parseFloat(0.3) + (parseFloat(prodincomenet) + parseFloat(prodtaxback)) * parseFloat(0.6);
                            }else{
                            	jiangyouA = parseFloat(servincomenet) * parseFloat(0.35);
                            }
                            
                            projgross = parseFloat(netincome) - parseFloat(budget);
                            projgrossrate = parseFloat(projgross) / parseFloat(grossincome);
                            
                            //基本信息
                            nui.get("contnum").setValue(contnum);
                          	nui.get("contnum").setText(contnum);
                          	
                          	//预算信息
                            nui.get("prodmon").setValue(prodmon);
                            nui.get("servmon").setValue(servmon);
                            nui.get("prodincomenet").setValue(prodincomenet);
                            nui.get("servincomenet").setValue(servincomenet);
                            nui.get("prodtaxback").setValue(prodtaxback);
                            nui.get("contmon").setValue(contmon);
                            nui.get("netincome").setValue(netincome);
                            nui.get("grossincome").setValue(grossincome);
                            nui.get("followupcost").setValue(followupcost);
                            nui.get("jiangyouA").setValue(parseFloat(jiangyouA).toFixed(2));
                            nui.get("projgross").setValue(projgross);
                            nui.get("projgrossrate").setValue(parseFloat(projgrossrate).toFixed(3));
                        }
                    }
                }
            });
        }
       
		//发起流程
		function SaveData(){
			var a = nui.get("leader").getValue();
			var b = nui.get("leader").getText();
			var data = form.getData();
			//拿到checklist填写的值
			var grid_checklist = nui.get("grid_checklist"); 
			var checklistrow = grid_checklist.getData();
			var data_opioion = opioionform.getData();
			var rdprojcheck = data.rdprojcheck;
			var checkincomeym = rdprojcheck.checkincomeym;
			if(checkincomeym!=null&&checkincomeym!=""){
				var year =  checkincomeym.getFullYear();
				var month = checkincomeym.getMonth()+1;
				if(month<10){
					month = "0" + month;
				}
				rdprojcheck.checkincomeym = year + "" + month;
			}
			var project = data.project;
			var json = nui.encode({"sybmanager":a,"technology":b,"project":project,"rdprojcheck":rdprojcheck,"misOpinion": data_opioion.misOpinion,"csIncomecheck":checklistrow});
			 nui.ajax({
                url: "com.primeton.rdmgr.project.examineToProject.makeFinceProjmb.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                   	var returnJson = nui.decode(text);
	              	if(returnJson.result == "success"){
	              		form.unmask();
	                   	nui.alert("流程提交成功！");
	                   	CloseWindow("ok");
	              	}else{
                   		form.unmask();
						nui.get("submitReimbProcess").enable();
						nui.get("closeWin").enable();
	                   	nui.alert("流程提交失败！");
	              	}
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
		}
		
		function onOk(){
			var managername = nui.get("manager").getText();
			nui.get("managername").setValue(managername);
			if(!form.validate()){
    			nui.alert("表单信息填写不完整，请确认必输项是否填写!");
    			return;
    		}
    		var grid_checklist = nui.get("grid_checklist"); 
	    	var checklistrow = grid_checklist.getData();
	    	for(var i =0; i<checklistrow.length;i++){
	    		if(checklistrow[i].ischeck=="0"){
	    			alert("核查清单'"+checklistrow[i].checklistseq+checklistrow[i].checklistname+"'没有勾选！");
	    			return;
	    		}
	    	}
        	nui.confirm("是否提交流程?","操作提示",function(o){
        		if("ok" == o){
        			nui.get("submitReimbProcess").disable();
					nui.get("closeWin").disable();
        			document.getElementById("fileCatalog").value="ProjectCheck";
		        	form2.submit();
        		}else{
        			
        		}
        	});
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
        
        //标准方法接口定义
	    function CloseWindow(action) {           
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();
	    }
	    
	    function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
		}
		function initMisOpinion(data){
			//初始化处理意见
			var dataStatus=[{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
			nui.get("auditstatus").setData(dataStatus);
			nui.get("auditstatus").setValue(data.auditstatus);
		}
	    //审核结果触发
	    function show(){
			var auditopinion = nui.get("auditopinion").getValue().trim();
			var auditstatus = nui.get("auditstatus").getValue();
			if(auditstatus=='0'){
				if(auditopinion=="同意。"){
					nui.get("auditopinion").setValue("");
				}
				chooselink();
			}else if(auditstatus=='1'){
				if(auditopinion==""){
					nui.get("auditopinion").setValue("同意。");
				}
				showNone();
			}else if(auditstatus=='2'){
				if(auditopinion=="同意。"){
					nui.get("auditopinion").setValue("");
				}
				showNone();
			}
		}
		function showNone(){
			nui.get("backTo").setValue("");
			document.getElementById("choosehide").style.display="none";
		}
		function chooselink(){
			document.getElementById("choosehide").style.display="";
		}
		
		//合同处理意见附件信息
	     function onFileRenderer(e) {
	        var tempSrc = "";
        	//长度为1，不换行
        	if(e.record.files.length == 1){
	        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[0].fileId + "'>" + e.record.files[0].fileName + "</a>";
        	}else{
		        for(var i=0;i<e.record.files.length;i++){
		        	//长度大于1小于长度length换行
		        	if(i< e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a><br/>&nbsp;&nbsp;";
		        	}
		        	//最后一个不换行
	        		if(i == e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>";
		        	}
		        }
        	}
	       	return tempSrc;
	     }
    	function doSHZT(){
    		if(nui.get("auditopinion").getValue().trim() == ""){
    			nui.alert("悬挂时审核意见不可以为空");
        		return false;
    		}else{
    			if (!confirm("是否保存悬挂时的审核意见？")) {
                    return false;
                }else{
		    		var data = opioionform.getData();
		    		data.misOpinion.auditstatus = "5";
		    		var json = nui.encode(data);
		    		nui.ajax({
		    			url:"com.primeton.eos.ame_common.mail.saveMisopinion.biz.ext",
		    			data:json,
		    			type:"post",
		    			contentType:"text/json",
		    			success:function(action){
		    				if(action.exception == null){
					        	nui.alert("提交成功",null,function(){
						        	nui.get("datagrid1").reload();
					        	});
		    				}else{
		    					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
		    					});
		    				}
		    			},
		    			error:function(jqXHR, textStatus, errorThrown){
		    				nui.alert("error:" + jqXHR.responseText);
		    			}
		    		});
		    	}
    		}
    	}
    	
    	function changeNum(){
        	var assessmentcost = nui.get("assessmentcost").getValue();
        	var budgetcost = nui.get("budgetcost").getValue();
        	var followupcost = parseFloat(budgetcost)-parseFloat(assessmentcost);
        	nui.get("followupcost").setValue(followupcost);
        }
	</script>
</body>
</html>