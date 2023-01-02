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
  - Author(s): 许青倩
  - Date: 2019-11-07 13:53:32
  - Description:
-->
<head>
<title>发起招聘面试安排</title>
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
<div class="nui-fit">
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
	<form id="form_recruit" method="post">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;width:99%;">
			<legend>招聘需求</legend>
			<input name="omRecruit.recruitid" id="recruitid" class="nui-hidden"/>
			<input name="omRecruit.recruitno" id="recruitno1" class="nui-hidden"/>
			<input name="omRecruit.orgname" id="orgname" class="nui-hidden"/>
			<input name="omRecruit.recuserid" id="recuserid1" class="nui-hidden"/>
			<input name="omRecruit.recpositionname" id="recpositionname1" class="nui-hidden"/>
			<input name="omRecruit.refferexpmouldno" id="refferexpmouldno" class="nui-hidden"/>
			<input name="omRecruit.isreferrer" id="isreferrer" class="nui-hidden"/>
			<input name="omRecruit.orgid" id="orgid" class="nui-hidden"/>
			<input name="recommend.fileids" id="fileids" class="nui-hidden"/>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:120px;">需求编号：</td>
	                	<td style="width:150px;" name="omRecruit.recruitno" id="recruitno" class = "asLabel"></td>
						<td align="right"style="width: 110px;">招聘部门：</td>
						<td align="left" style="width: 150px;" name="omRecruit.orgid" id="orgid" class = "asLabel"></td>
	                	<td align="right"style="width: 120px;">招聘职位：</td>
						<td align="left" style="width: 150px;" name="omRecruit.recpositionname" id="recpositionname" class = "asLabel"></td>
						<td align="right"style="width:120px;">招聘数量：</td>
						<td align="left" style="width: 150px;" name="omRecruit.recnum" id="recnum" class = "asLabel"></td>
					</tr>
					<tr>
	                	<td align="right"style="width: 120px;">人员性质：</td>
						<td align="left" style="width: 150px;" name="omRecruit.jobtype" id="jobtype" class = "asLabel"></td>
						<td align="right" style="width:100px;">员工属性：</td>
	                	<td style="width:150px;" name="omRecruit.position" id="position" class = "asLabel"></td>
	                	<td align="right" style="width:100px;">工作地点：</td>
	                	<td style="width:150px;" name="omRecruit.workplace" id="workplace" class = "asLabel"></td>
						<td align="right">期望入职时间：</td>
						<td align="left" style="width: 150px;" name="omRecruit.hopedate" id="hopedate" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right">申请人：</td>
						<td align="left" style="width: 150px;" name="omRecruit.applyuserid" id="applyuserid" class = "asLabel"></td>
						<td align="right">招聘专员：</td>
						<td align="left" style="width: 150px;" name="omRecruit.recuserid" id="recuserid" class = "asLabel"></td>
						<td align="right" style="width:100px;">备注：</td>
	                	<td style="width:601px;" colspan="3" name="omRecruit.remark" id="remark" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">工作职责描述：</td>
	                	<td style="width:150px;" colspan="7" name="omRecruit.workduties" id="workduties" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">招聘要求描述：</td>
	                	<td style="width:150px;" colspan="7" name="omRecruit.recdesc" id="recdesc" class = "asLabel"></td>
					</tr>
					<tr>
	                	<td align="right" style="width:100px;">需求背景：</td>
	                	<td style="width:601px;" colspan="7" name="omRecruit.recbackground" id="recbackground" class = "asLabel"></td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;width:97.5%;">
			<legend>面试人员列表</legend>
			<table>
				<tr>
					<td>
						<span style="color: red">是否给候选人发送面试通知邮件，并抄送面试发起人:</span>
					</td>
					<td>
						<input class="nui-radiobuttonlist" name="omRecruit.issendmail" id="issendmail" repeatItems="2" repeatLayout="table" repeatDirection="Horizontal" textField="text" valueField="id" required="true" style="width:200px;" data="[{'id': '1','text': '是'},{'id': '0','text': '否'}]"/>
					</td>	
				</tr>
			</table>
			<div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                    	<a class="nui-button" iconCls="icon-add" onclick="addRow('searchResumeLogId')">增加</a>
		                    	<a class="nui-button" iconCls="icon-remove" onclick="removeRow('searchResumeLogId')">删除</a>	
	                    	</td>
		                </tr>
		            </table>           
		        </div>
		        <div id="searchResumeLogId" class="nui-datagrid" style="width:100%;height:auto;" dataField="queryResume" showPager="false" onrowclick="selectedchange" oncellendedit="changeResume()"
					allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" url="com.primeton.eos.ame_permanage.ame_interview.queryResumes.biz.ext" 
					allowSortColumn="true" allowCellWrap="false" sortMode="client">
					<div property="columns">
						<div type="checkcolumn" width="20px"></div>
						<div field="empname" headerAlign="center" align="center" renderer="getDetail" width="60">姓名</div>
						<div field="interviewdtae" width="120" headerAlign="center" align="center" renderer="DateFormat" allowSort="true">第一轮面试时间
							<input property="editor" class="nui-datepicker" showTime="true" showOkButton="true" showClearButton="false" style="width:100%;"  format="yyyy-MM-dd H:mm"/>
						</div>
						<div field="applyoccupation" headerAlign="center" align="center" width="60">应聘职位</div>
						<div field="gender" headerAlign="center" align="center"width="35" renderer="ongender">性别</div>
						<div field="workingyear" headerAlign="center" align="center"  width="80">工作年限(年)</div>
						<div field="education" headerAlign="center" align="center" width="40" renderer="onDegreeRenderer">学历</div>
						<div field="school" headerAlign="center" align="left" width="100">毕业学校</div>
						<div field="specialty" headerAlign="center" align="left" width="75">专业</div>
						<div field="tel" headerAlign="center" align="left" width="80">联系电话</div>
						<div field="selfemail" headerAlign="center" align="left" width="130">电子邮件</div>
						<div field="expectincome" headerAlign="center" align="center" width="60">期望薪资</div>
						<div field="applystatus" headerAlign="center" align="center"width="50" renderer="ongenderApplyStatus">求职状态</div>
						<div field="interviewstatus" headerAlign="center" align="center"width="50" renderer="ongenderinterviewStatus">简历状态</div>
					</div>
				</div>
		    </div>
		</fieldset>
			<table>
				<tr>
				   <td align="right" style="width:160px;">招聘专员推荐简历时间：</td>
				   <td align="left"> 
				      <input name="recommend.recommendresumedate" id="recommendresumedate" class="nui-datepicker" format="yyyy-MM-dd"/>
				   </td>   
		           <td align="right" style="width:160px;" >面试官简历反馈时间：</td>
		           <td align="left" > 
		              <input name="recommend.resumefeedbackdate" id="resumefeedbackdate" class="nui-datepicker" format="yyyy-MM-dd"/>
		           </td>    
		        </tr>
	        </table>
	</form>
	
	<form id="form_interviewScheduals" method="post">
		<table  id="goaltable1" style="table-layout:fixed;border-collapse:collapse" bordercolor="#A8A8A8" border="1" cellspacing="0" cellpadding="1">
			<tr>
				<a class="nui-button" onclick="addinterviewScheduals(null)">增加面试</a>
			</tr>
		</table>
		<fieldset id="interviewfield0" style="border:solid 1px #aaa;padding:3px;width:97.5%;">
			<legend>第一轮次面试信息</legend>
			<div style="padding:5px;">
			<input name="interviewScheduals[0].interviewroundes" id="interviewroundes0" class="nui-hidden" value="1"/>
				<table style="width:100%;">
					<tr>
						<td align="right"style="width: 110px;">面试官：</td>
						<td align="left" style="width: 150px;">
							<input id="interviewer0" name="interviewScheduals[0].interviewer" class="nui-textboxlist" style="width: 100%" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext" required="true" onvaluechanged="changeinterviewScheduals('interviewer',0)"/>
						</td>
						<td align="right"style="width: 110px;">面试官角色：</td>
						<td align="left" style="width: 150px;">
							<input id="positionname0" name="interviewScheduals[0].interviewerrole" class="nui-dictcombobox" style="width: 100%" shownullItem="true"  dictTypeId="INTERVIEWER_ROLE" required="false" onvaluechanged="changeinterviewScheduals('positionname',0)"/>
						</td>
						<td align="right"style="width: 110px;">联系人：</td>
						<td align="left" style="width: 150px;">
							<input id="linkman0" name="interviewScheduals[0].linkman" class="nui-textboxlist" style="width: 100%" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext" required="true" onvaluechanged="changeinterviewer('input',0)"/>
						</td>
						<td align="right"style="width: 110px;">联系电话：</td>
						<td align="left" style="width: 150px;">
							<input id="linktel0" name="interviewScheduals[0].linktel" class="nui-textbox" style="width: 100%" vtype="float" inputStyle="text-align: left" maxLength="255" required="true" onvaluechanged="changeinterviewScheduals('linktel',0)"/>
						</td>
					<tr>
					<tr>
						<td align="right"style="width: 110px;">面试方式：</td>
						<td align="left" style="width: 150px;">
							<input id="interviewtype0" name="interviewScheduals[0].interviewtype" class="nui-dictcombobox" style="width: 100%" shownullItem="true"  dictTypeId="INTERVIEW_TYPE" required="true" onvaluechanged="changeinterviewScheduals('interviewtype',0)"/>
						</td>
						<td align="right"style="width: 110px;">面试地点：</td>
						<td align="left" style="width: 150px;" colspan="5">
							<input id="venue0" name="interviewScheduals[0].venue" class="nui-textbox" style="width: 100%" minWidth="200" minHeight="80" maxLength="255" required="true" onvaluechanged="changeinterviewScheduals('venue',0)"/>
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
	</form>
	
	<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;width:97.5%;">
		<legend>面试轮次明细信息</legend>
		<div id="tabs1" class="nui-tabs" ctiveIndex="0" style="width:100%;height:auto;">
			
		</div>
	</fieldset>
	<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend><span style="color: red">面试邮件内部通知</span></legend>
		<div style="line-height: 30px;padding-left: 66px;">邮件抄送人：<input id="cclist" class="nui-textboxlist" onvaluechanged="changecc" onremoveitem="removecc" allowInput="true" textField="EMPNAMES" valueField="OEMAIL" searchField="name" style="width:500px;"  url="com.primeton.mis.contract.contractApproval.getEmpByName.biz.ext" /><span style="color:red"> （需要补充行政接待人以及其他需要告知的人）</span></div>
		<div style="line-height: 30px;padding-left: 66px;">抄送邮件组： <input id="cclistGroup" class="nui-dictcombobox"  multiSelect="true" style="width: 500px" shownullItem="false"  dictTypeId="AME_MAILGROUP" required="false" value="mianshi@primeton.com"/></div>
	</fieldset>
	<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
		<legend>面试安排附件</legend>
		<jsp:include page="/ame_common/addFiles.jsp"/>
	</fieldset>
	
	<form id="opioionform" method="post">
        <div style="padding:5px;" id="opinionHide">
            <table style="table-layout:fixed;">
            	<tr style="display:none;">
                    <td style="width:150px;" align="right">审核结果：</td>
                    <td style="width:250px;">  
						<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
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
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注</a>
	<a class="nui-button" onclick="onOk('app')" iconCls="icon-organization" style="width:135px;margin-right:20px;" id="appButton">发起招聘面试安排</a>
	<%--<a class="nui-button" onclick="onOk('save')" iconCls="icon-save" style="width:95px;margin-right:20px;" id="saveButton">暂时保存</a>--%>
	<a class="nui-button"onclick="onCancel" iconCls="icon-close" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form_recruit = new nui.Form("form_recruit");
	var forminterview = new nui.Form("form_interviewScheduals");
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
  	//拟入职人员信息主键
  	var recruitid = '<%=request.getParameter("id") %>';
  	//招聘专员推荐简历时间
  	var recommendresumedate = '<%=request.getParameter("recommendresumedate") %>';
  	//面试官简历反馈时间
  	var resumefeedbackdate = '<%=request.getParameter("resumefeedbackdate") %>';
  	var ResumeLog = nui.get("searchResumeLogId");
	var tabs1 =nui.get("tabs1");
  	var applyoccupation = '';
  	var rounds = 1;
  	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	
	var nowuserid='<%=nowuserid %>';
	var nowusername='<%=nowusername%>';
	var hr;
  	initdate(null);
  	function initdate(data){
  		promptInit({"workItemID": 0,"processDefName": "com.primeton.eos.ame_permanage.ame_entry","activityDefID": "manualActivity"});//流程提示信息
  			nui.ajax({
	            url: "com.primeton.eos.ame_permanage.ame_interview.getInterviewEntry.biz.ext",
	            data: {recruitid:recruitid,workItemID:null,processInstID:null},
	            type: 'POST',
	            cache: false,
	   			async:false,
	            contentType: 'text/json',
	            success: function (o) {
	            	if(o.omRecruit){
	            		form_recruit.setData(o);
	            		
	            		//招聘专员推荐简历时间、面试官简历反馈时间
						nui.get("recommendresumedate").setValue(recommendresumedate);
					  	nui.get("resumefeedbackdate").setValue(resumefeedbackdate);
  	
	            		document.getElementById("recruitno").innerHTML = o.omRecruit.recruitno == null ?"":o.omRecruit.recruitno;
	            		document.getElementById("orgid").innerHTML = o.omRecruit.orgname == null ?"":o.omRecruit.orgname;
	            		document.getElementById("recpositionname").innerHTML = o.omRecruit.recpositionname == null ?"":o.omRecruit.recpositionname;
	            		document.getElementById("recnum").innerHTML = o.omRecruit.recnum == null ?"":o.omRecruit.recnum;
	            		document.getElementById("jobtype").innerHTML = o.omRecruit.jobtype == null ?"":nui.getDictText('AME_EMPTYPE2',o.omRecruit.jobtype);
	            		document.getElementById("position").innerHTML = o.omRecruit.position == null ?"":nui.getDictText('EMP_TYPE',o.omRecruit.position);
	            		document.getElementById("workplace").innerHTML = o.omRecruit.workplace == null ?"":nui.getDictText('AREA4CLRY',o.omRecruit.workplace);
	            		document.getElementById("hopedate").innerHTML = o.omRecruit.hopedate == null ?"":o.omRecruit.hopedate;
	            		document.getElementById("applyuserid").innerHTML = o.omRecruit.applyname == null ?"":o.omRecruit.applyname;
	            		document.getElementById("recuserid").innerHTML = o.omRecruit.recusername == null ?"":o.omRecruit.recusername;
	            		document.getElementById("remark").innerHTML = o.omRecruit.remark == null ?"":o.omRecruit.remark;
	            		document.getElementById("workduties").innerHTML = o.omRecruit.workduties == null ?"":o.omRecruit.workduties;
	            		document.getElementById("recdesc").innerHTML = o.omRecruit.recdesc == null ?"":o.omRecruit.recdesc;
	            		document.getElementById("recbackground").innerHTML = o.omRecruit.recbackground == null ?"":o.omRecruit.recbackground;
	            		
	            		hr =""+ o.omRecruit.recuserid+"";
	            		if(hr == '' || hr == null){
	            			hr = ""+ nowuserid +"";
	            		}else{
	            			hr =hr+ ","+nowuserid+"";
	            		}
	            		
  						var interviewScheduals = [];
            			interviewScheduals = o.interviewScheduals;
	            		for (var i=1;i<interviewScheduals.length;i++){
	            			addinterviewScheduals(i);
	            		}
	            		var forminterview = new nui.Form("form_interviewScheduals");
	            		if(interviewScheduals.length>0){
	            			forminterview.setData(o);
	            		}else{
	            			nui.get("interviewroundes0").setValue(1);
	            		}
	            		for (var i=0;i<interviewScheduals.length;i++){
							nui.get("interviewer"+i).setText(interviewScheduals[i].empname+"("+interviewScheduals[i].interviewer+")");
	            			nui.get("linkman"+i).setValue(nowuserid);
							nui.get("linkman"+i).setText(nowusername);
							changeinterviewer('input',i);
	            		}
						applyoccupation = o.omRecruit.position;
	            		<%--var resumeJson = ({"criteria": 
		                                    {"_expr[0]": {"_property": "resumeid","_op": "in","_ref": "1"},
		                                    "_ref[0]": {"_id": "1","_entity": "com.primeton.eos.ame_resume.resume.AmeResumeRecommend","_select":{"_field[0]":"resumeid"},"_expr[0]":{"_property": "omRecruit.recruitid","_op": "=","_value":recruitid}}}});
	            		ResumeLog.sortBy("lastupdate", "desc");
	            		ResumeLog.load(resumeJson,function(){
	            			var Resumes = ResumeLog.getData();
							for(var i=0;i<Resumes.length;i++){
								setInterviewTabs(Resumes[i]);
							}
						});--%>
						if(o.evaluateMoulddets.length<=0){
							nui.alert("请就招聘岗位设置面试评价模板！");
						}
						var resumes = data.resumes;
						if(resumes.length>0){
							for(var i=0;i<resumes.length;i++){
								ResumeLog.addRow(resumes[i],ResumeLog.length);
								setInterviewTabs(resumes[i]);
							}
						}
						
	            	}
	            	nui.get("issendmail").setValue("1");
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	                alert(jqXHR.responseText);
	            }
		});
  	}
  	
  	//发起流程
	var operate;
  	function onOk(e){
  		var Resumes = ResumeLog.getData();
  		if(Resumes.length<=0){
  			nui.alert("面试人员列表必选!");
  			return;
  		}else{
  			for(var i=0;i<Resumes.length;i++){
  				var interviews = nui.get('interviewtab_'+Resumes[i].resumeid).getData();
  				if(interviews.length<=0){
		  			nui.alert("面试人"+Resumes[i].empname+"未安排面试!")
		  			return;
  				}else{
  					var wroundes = 0;
  					var nowdate = new Date();
  					for(var j=0;j<1;j++){
  						if(interviews[j].status == '0'){
							wroundes++;
						}
  						if(interviews[j].interviewroundes == null || interviews[j].interviewroundes == ''){
  							nui.alert(Resumes[i].empname+"的第一轮面试安排轮次必填!");
				  			return;
  						}
  						if(interviews[j].status == null || interviews[j].status == ''){
  							nui.alert(Resumes[i].empname+"的第一轮面试安排面试状态必填!");
				  			return;
  						}
  						if(interviews[j].interviewdtae == null || interviews[j].interviewdtae == ''){
  							nui.alert(Resumes[i].empname+"的第一轮面试安排面试时间必填!");
				  			return;
  						}else if(DateFormat({"value":interviews[j].interviewdtae})<DateFormat({"value":nowdate})){
  							nui.alert(Resumes[i].empname+"的第一轮面试安排面试时间必须大于等于当天!");
				  			return;
  						}
  						if(interviews[j].interviewer == null || interviews[j].interviewer == ''){
  							nui.alert(Resumes[i].empname+"的第一轮面试安排面试人必选!");
				  			return;
  						}
  						if(interviews[j].applyoccupation == null || interviews[j].applyoccupation == ''){
  							nui.alert(Resumes[i].empname+"的第一轮面试安排面试岗位必填!");
				  			return;
  						}
  						if(interviews[j].linkman == null || interviews[j].linkman == ''){
  							nui.alert(Resumes[i].empname+"的第一轮面试安排联系人必选!");
				  			return;
  						}
  						if(interviews[j].linktel == null || interviews[j].linktel == ''){
  							nui.alert(Resumes[i].empname+"的第一轮面试安排联系人电话必填!");
				  			return;
  						}
  						if(interviews[j].interviewtype == null || interviews[j].interviewtype == ''){
  							nui.alert(Resumes[i].empname+"的第一轮面试安排面试方式必填!");
				  			return;
  						}
  						if((interviews[j].venue == null || interviews[j].venue == '') && (interviews[j].interviewtype == '0' || interviews[j].interviewtype == '3')){
  							nui.alert(Resumes[i].empname+"的第一轮面试安排面试地点必填!");
				  			return;
  						}
  						for(var k=0;k<interviews.length;k++){
  							if(interviews[j].interviewroundes == interviews[k].interviewroundes && j!=k){
  								nui.alert(Resumes[i].empname+"的第一轮面试安排面试轮次不能重复!");
				  				return;
  							}
  						}
  					}
		  			if(wroundes == 0){
		  				nui.alert("必须至少有一条面试安排的状态为轮候中!");
				  		return;
		  			}
  				}
  			}
  		}
  		if(!form_recruit.validate()){
			nui.alert("信息录入不完整!");
			return;
		}else{
    		operate = e;
    		document.getElementById("fileCatalog").value="AmeResumeRecommend";
    		form2.submit();
		}
  	}
  	
  	function SaveData(){
		var message = "发起";
		if(operate == "save"){
			message = "暂时保存";
		}
  	    
		var json = form_recruit.getData();
  		var Resumes = ResumeLog.getData();
  		
  		var message1 = "";
		var issendmail = nui.get("issendmail").getValue();
		if(issendmail == '1'){
			message1 = "如需发送面试通知请检查面试候选人邮箱是否正确！";
		}
		
		nui.confirm("确定要"+message+Resumes.length+"条招聘面试安排流程吗？"+message1,"操作提示",function (action){
			if(action == "ok"){
		  		json.misOpinion = opioionform.getData().misOpinion;
		  		for(var i=0;i<Resumes.length;i++){
		  			var interviews = nui.get('interviewtab_'+Resumes[i].resumeid).getData();
		  			var interviewer = interviews[interviews.length-1].interviewer;
		  			var interviewdtae = interviews[interviews.length-1].interviewdtae;
		  			var turn = interviews[interviews.length-1].interviewroundes;
		  			var x = interviews.length-1;
		  			for(var j=0;j<interviews.length;j++){
		  				if(interviews[j].interviewroundes < turn && interviews[j].status == '0'){
		  					turn = interviews[j].interviewroundes;
		  					interviewer = interviews[j].interviewer;
		  					interviewdtae = interviews[j].interviewdtae;
		  					x = j;
		  				}
		  			}
		  			var weekDay = ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];  
					var myDate = new Date(Date.parse(interviews[x].interviewdtae)); 
		  			var updateRow = {"status":'1',"weekday":weekDay[myDate.getDay()]};
					nui.get('interviewtab_'+Resumes[i].resumeid).updateRow(interviews[x],updateRow);
		  			Resumes[i].interviews=nui.get('interviewtab_'+Resumes[i].resumeid).getChanges();
		  			Resumes[i].interviewer = interviewer;
		  			Resumes[i].interviewdtae = interviewdtae;
		  			Resumes[i].interviewstatus = '2';
		  			Resumes[i].cclist = nui.get("cclist").getValue();//发送邮件;
		  			var cclistGroup = nui.get("cclistGroup").getValue();//发送邮件组
		  			if(cclistGroup != null && cclistGroup != ''){
		  				if(Resumes[i].cclist != null && Resumes[i].cclist != ''){
		  					Resumes[i].cclist = Resumes[i].cclist+','+cclistGroup;
		  				}else{
		  					Resumes[i].cclist = cclistGroup;
		  				}
		  			}
		  			Resumes[i].cclistname = nui.get("cclist").getText();//发送邮件;
		  			var cclistGroupname = nui.get("cclistGroup").getText();//发送邮件组
		  			if(cclistGroupname != null && cclistGroupname != ''){
		  				if(Resumes[i].cclistname != null && Resumes[i].cclistname != ''){
		  					Resumes[i].cclistname = Resumes[i].cclistname+','+cclistGroupname;
		  				}else{
		  					Resumes[i].cclistname = cclistGroupname;
		  				}
		  			}
		  			Resumes[i].hr = hr;//发送邮件;
		  			Resumes[i].createdate1 = DateFormat2(Resumes[i].createdate);
		  			Resumes[i].lastupdate1 = DateFormat2(Resumes[i].lastupdate);
		  		}
		  		json.resumes = Resumes;
		  		var guanZhu = nui.get("guanZhuButton").getValue();//是否关注
				json.omRecruit.guanZhu = guanZhu;//是否关注
		  		//json.omRecruit.recpositionname = document.getElementById("recposition").innerHTML;
		  		json.operate = operate;
				form_recruit.loading("处理中,请稍后...");
				nui.get("appButton").setEnabled(false);
	    		nui.ajax({
	    			url:"com.primeton.eos.ame_permanage.ame_interview.interviewProcessCreate.biz.ext",
	    			data: json,
	    			type:"post",
	    			contentType:"text/json",
	    			success:function(action){
	    				action = nui.clone(action);
	    				form_recruit.unmask();
	    				if(action.exception == null){
	    					if(action.sendMail == null){
		    					nui.alert(message+"招聘面试安排流程成功！","系统提示",function(){
					        		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
					        	});
	    					}else{
		    					nui.alert(message+"招聘面试安排流程成功！"+"但发送"+action.sendMail+"面试通知邮件失败，请线下通知。","系统提示",function(){
					        		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
					        	});
	    					}
	    				}else{
	    					nui.alert(message+action.exception+"的招聘面试安流程失败！请联系信息技术部。","系统提示",function(){
				        	
				        	});
	    				}
	    				nui.get("appButton").setEnabled(true);
	    			},
	    			error:function(jqXHR, textStatus, errorThrown){
	    				nui.alert("error:" + jqXHR.responseText);
	    				nui.get("appButton").setEnabled(true);
	    			}
	    		});
			}
		});
  	}
  	
  	function onCancel(e) {
    	var data = form_recruit.getData();
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
		if (action == "close" && form_Intend.isChanged()){
			if (confirm("数据被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
  	
  	function addRow(e){
  		if (e == "searchResumeLogId"){
  			nui.open({
    			url:"/default/ame_permanage/ame_interview/selectResumes.jsp?",
                title: "选择简历",
                width: 600,
                height: 400,
                ondestroy: function (action) {
                	if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						var Resumes = ResumeLog.getData();
						for(var i=0;i<data.length;i++){
							var isrepeat = false;
							for(var j=0;j<Resumes.length;j++){
								if(Resumes[j].resumeid == data[i].resumeid){
									isrepeat = true;
								}
							}
							if(isrepeat == false){
								ResumeLog.addRow(data[i],ResumeLog.length);
								setInterviewTabs(data[i]);
							}
						}
					}
                }
    	 	})
  		}
  	}
  	function removeRow(gridid){
		var grid = nui.get(gridid);
        var rows = grid.getSelecteds();
        var num = rows.length;
        if (rows.length > 0) {
        	if(confirm("确定删除"+num+"条记录吗？")){
        		grid.removeRows(rows, false);
        		for(var i=0;i<rows.length;i++){
        			tabs1.removeTab("interviewtab_"+rows[i].resumeid);
        		}
        	}else{
        		return false;
        	}
        }else{
			alert("请选择一条记录！"); 
        }
	}
	var tabnum = 0;
	function setInterviewTabs(Resumes){
		var tab_1 = {name: "interviewtab_"+Resumes.resumeid, id: "interviewtab_"+Resumes.resumeid, title: Resumes.empname+"面试安排"};
		tabnum = ResumeLog.indexOf(Resumes);
		tabs1.addTab(tab_1,tabnum);
		var tabBodyEl=tabs1.getTabBodyEl (tab_1);
		var html = '<div style="width:100%;"><div class="nui-toolbar" style="border-bottom:0;padding:0px;"><table style="width:100%;"><tr><td style="width:100%;"><a class="nui-button" iconCls="icon-add" id="add2" onclick="addRow1('+"'interviewtab_"+Resumes.resumeid+"'"+')">增加</a>';//<a class="nui-button" iconCls="icon-remove" id="delete2" onclick="removeRow1('+"'interviewtab_"+Resumes.resumeid+"'"+')">删除</a>
		html = html +'<a class="mini-button" iconCls="icon-upload" onclick="moveRowUp('+"'interviewtab_"+Resumes.resumeid+"'"+')" plain="true">上移</a>';
		html = html +'<a class="mini-button" iconCls="icon-download" onclick="moveRowDown('+"'interviewtab_"+Resumes.resumeid+"'"+')" plain="true">下移</a></td></tr></table></div></div>';
		html = html+'<div style="width:100%;"><div class="nui-toolbar" style="border-bottom:0;padding:0px;"><table style="width:100%;"></table></div></div>';<%--<tr><td style="width:20%;">'+Resumes.empname+'面试安排</td></tr>--%>
		html = html+'<div id="'+"interviewtab_"+Resumes.resumeid+'" class="nui-datagrid" style="width:100%;height:auto;" dataField="resumInterviews" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" url="com.primeton.eos.ame_permanage.ame_resum.getInterview.biz.ext" allowSortColumn="true" allowCellWrap="false" oncellendedit="changeinterviewer('+"'interviewtab_"+Resumes.resumeid+"',null"+')"><div property="columns">';
		html = html+'<div type="checkcolumn" width="20px"></div><input field="interviewid" class="nui-hidden" visible="false">';
    	html = html+'<div field="interviewroundes" width="15" headerAlign="center" align="center" type="indexcolumn">轮次</div>';//<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
    	html = html+'<div field="status" width="0" headerAlign="center"  align="center" allowSort="true" renderer="getinterviewstatus">面试状态<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="INTERVIEW_STATUS" /></div>';
    	html = html+'<div field="interviewdtae" width="80" headerAlign="center" align="center" allowSort="true"  renderer="DateFormat">面试时间<input property="editor" class="nui-datepicker" format="yyyy-MM-dd H:mm" showTime="true" showOkButton="true" showClearButton="false" style="width:100%;"/></div>';
        html = html+'<div field="interviewer" displayField="empname"width="45" headerAlign="center" align="center" >面试人<input property="editor" class="nui-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext"></div>';
        html = html+'<div field="positionname" width="45" headerAlign="center"  align="center" allowSort="true" renderer="getposition">面试官角色<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="INTERVIEWER_ROLE" /></div>';
    	html = html+'<div field="applyoccupation" width="0" headerAlign="center" align="center">面试岗位<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/></div>';
        html = html+'<div field="linkman" displayField="linkmanname"width="45" headerAlign="center" align="center" >联系人<input property="editor" class="nui-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext"></div>';
    	html = html+'<div field="linktel" width="40" headerAlign="center" align="center">联系人电话<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/></div>';
    	html = html+'<div field="interviewtype" width="60" headerAlign="center"  align="center" allowSort="true" renderer="getinterviewType">面试方式<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="INTERVIEW_TYPE" /></div>';
    	html = html+'<div field="venue" width="75" headerAlign="center" align="left">面试地点<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/></div>';
        html = html+'<div field="memo" width="75" headerAlign="center" align="left">面试备注<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/></div>';
        html = html+'</div></div>';
		$(tabBodyEl).append(html);
		nui.parse();
        tabs1.activeTab(tab_1);
		tabnum++;
		var grid_interview = nui.get('interviewtab_'+Resumes.resumeid);
		var forminterview = new nui.Form("form_interviewScheduals");
  		var interviewScheduals = [];
		interviewScheduals = forminterview.getData().interviewScheduals;
		if(interviewScheduals.length>0){
    		for(var i=0;i<interviewScheduals.length;i++){
    			newRow = { name: "New Row",status: "0",interviewroundes: interviewScheduals[i].interviewroundes,interviewer:interviewScheduals[i].interviewer,positionname:interviewScheduals[i].interviewerrole,empname:nui.get("interviewer"+i).getText(),linktel:interviewScheduals[i].linktel
        					,linkman:interviewScheduals[i].linkman,linkmanname:nui.get("linkman"+i).getText(),interviewtype:interviewScheduals[i].interviewtype,venue:interviewScheduals[i].venue,applyoccupation:applyoccupation};
    			grid_interview.addRow(newRow,i)
    		}
		}else{
    		addRow1("interviewtab_"+Resumes.resumeid)
    		interviewScheduals = grid_interview.getData();
    	}
	}
	function selectedchange(){
        var row = ResumeLog.getSelected();
        tabs1.activeTab("interviewtab_"+row.resumeid);
	}
	
	function addRow1(gridid){
		var newRow = { name: "New Row"};
        var grid = nui.get(gridid);
		if(gridid.indexOf("interviewtab_")>=0){
			newRow = { name: "New Row",status: "0",interviewroundes: grid.getData().length+1};
		}
        grid.addRow(newRow,grid.getData().length);
	}
	
	function removeRow1(gridid){
        var grid = nui.get(gridid);
        var rows = grid.getSelecteds();
        var num = rows.length;
        if (rows.length > 0) {
        	if(confirm("确定删除"+num+"条记录吗？")){
        		grid.removeRows(rows, false);
        	}else{
        		return false;
        	}
        }else{
			alert("请选择一条记录！"); 
        }
	}
	
	function changeinterviewer(gridid,num){
		if (gridid == 'input'){
			var linkman = nui.get("linkman"+num).getValue();
			if(linkman.indexOf(",")!=-1){
				nui.alert("面试安排的联系人唯一！");
	            nui.get("linkman"+num).setValue(null);
    			nui.get("linktel"+num).setValue(null);
    			changeinterviewScheduals("linkman",num);
			}else{
				nui.ajax({
		            url: "com.primeton.eos.ame_permanage.ame_leave_apply.getEmpByUserid.biz.ext",
		            type: 'POST',
		            data: {userid:linkman},
		            contentType:'text/json',
		            async:false,
		            success: function (text) {
		                var emp = text.emp;
		                if(emp != null && emp != ''){
	            			nui.get("linktel"+num).setValue(emp.mobileno);
		                }
		            }
			     }); 
			     changeinterviewScheduals("linkman",num);
			}
		}else{
		 	var grid = nui.get(gridid);
	        var row = grid.getSelected();
	        if(row.linkman != null && row.linkman != ''){
	        	if(row.linkman.indexOf(",")!=-1){
		        	nui.alert("每一条面试安排的联系人唯一！");
		            var updateRow = {"linkman":null,"linkmanname":null,"linktel":null};
		            grid.updateRow(row,updateRow);
		            return;
		        }else{
		        	nui.ajax({
			            url: "com.primeton.eos.ame_permanage.ame_leave_apply.getEmpByUserid.biz.ext",
			            type: 'POST',
			            data: {userid:row.linkman},
			            contentType:'text/json',
			            async:false,
			            success: function (text) {
			                var emp = text.emp;
			                if(emp != null && emp != ''){
			                	var updateRow = {"linktel":emp.mobileno};
		            			grid.updateRow(row,updateRow);
			                }
			            }
				     }); 
		        }
	        }
	        if(row.interviewtype != null && row.interviewtype != ''){
	        	if(row.interviewtype != '0' && row.interviewtype != '3'){
	        		var updateRow = {"venue":"无"};
        			grid.updateRow(row,updateRow);
	        	}
	        }
        }
	}
	
	function changeResume(){
		var rows = ResumeLog.getData();
		for(var i=0;i<rows.length;i++){
			var row = rows[i];
			var interviews = nui.get('interviewtab_'+row.resumeid).getData();
	  		if(interviews.length>0){
	  			var updateRow = {interviewdtae:row.interviewdtae};
	    		nui.get('interviewtab_'+row.resumeid).updateRow(interviews[0],updateRow);
	  		}
		}
	}
	
	function changeinterviewScheduals(id,num){
		var forminterview = new nui.Form("form_interviewScheduals");
  		var interviewScheduals = [];
		interviewScheduals = forminterview.getData().interviewScheduals;
		var updateRow = [];
		if(id == "interviewer"){
			updateRow = {interviewer:interviewScheduals[num].interviewer,empname:nui.get("interviewer"+num).getText()};
		}else if(id == "positionname"){
			updateRow = {positionname:interviewScheduals[num].interviewerrole};
		}else if(id == "linkman"){
			updateRow = {linktel:interviewScheduals[num].linktel,linkman:interviewScheduals[num].linkman,linkmanname:nui.get("linkman"+num).getText()};
		}else if(id == "linktel"){
			updateRow = {linktel:interviewScheduals[num].linktel};
		}else if(id == "interviewtype"){
			updateRow = {interviewtype:interviewScheduals[num].interviewtype};
			if(interviewScheduals[num].interviewtype == '0' || interviewScheduals[num].interviewtype == '3'){
				if(num == 0){
					nui.get("venue0").setRequired(true);
				}
			}else{
				if(num == 0){
					nui.get("venue0").setRequired(false);
				}
				nui.get("venue"+num).setValue("无");
				updateRow = {interviewtype:interviewScheduals[num].interviewtype,venue:"无"};
			}
		}else if(id == "venue"){
			updateRow = {venue:interviewScheduals[num].venue};
		}else{
			updateRow = {interviewer:interviewScheduals[num].interviewer,positionname:interviewScheduals[num].interviewerrole,empname:nui.get("interviewer"+num).getText(),linktel:interviewScheduals[num].linktel
    					,linkman:interviewScheduals[num].linkman,linkmanname:nui.get("linkman"+num).getText(),interviewtype:interviewScheduals[num].interviewtype,venue:interviewScheduals[num].venue};
		}
		var Resumes = ResumeLog.getData();
  		for(var i=0;i<Resumes.length;i++){
  			var interviews = nui.get('interviewtab_'+Resumes[i].resumeid).getData();
  			if(interviews.length>num){
    			nui.get('interviewtab_'+Resumes[i].resumeid).updateRow(interviews[num],updateRow);
  			}
  		}
	}
	
	function addinterviewScheduals(num){
		var set = '';
		if (num == null || num == 'null'){
			var forminterview = new nui.Form("form_interviewScheduals");
			num = forminterview.getData().interviewScheduals.length;
			set = 'add';
		}
		var forminterview = document.getElementById("form_interviewScheduals");
		 
		var node=document.createElement("fieldset");
		node.id = "interviewfield"+num;
		node.style.border = "solid 1px #aaa";
		node.style.padding = "3px";
		node.style.width = "97.5%";
		var html = '<legend>第'+SectionToChinese(1+num)+'轮次面试信息</legend>';
		var html = html+'<div style="padding:5px;"><table style="width:100%;"><input name="interviewScheduals['+num+'].interviewroundes" id="interviewroundes'+num+'" class="nui-hidden"/><tr>';
		var html = html+'<td align="right"style="width: 110px;">面试官：</td><td align="left" style="width: 150px;">';
		var html = html+'<input id="interviewer'+num+'" name="interviewScheduals['+num+'].interviewer" class="nui-textboxlist" style="width: 100%" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext" onvaluechanged="changeinterviewScheduals(\'interviewer\','+num+')"/></td>';
		var html = html+'<td align="right"style="width: 110px;">面试官角色：</td><td align="left" style="width: 150px;">';
		var html = html+'<input id="positionname'+num+'" name="interviewScheduals['+num+'].interviewerrole" class="nui-dictcombobox" style="width: 100%" shownullItem="true"  dictTypeId="INTERVIEWER_ROLE" onvaluechanged="changeinterviewScheduals(\'positionname\','+num+')"/></td>';
		var html = html+'<td align="right"style="width: 110px;">联系人：</td><td align="left" style="width: 150px;">';
		var html = html+'<input id="linkman'+num+'" name="interviewScheduals['+num+'].linkman" class="nui-textboxlist" style="width: 100%" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext" onvaluechanged="changeinterviewer(\'input\','+num+')"/></td>';
		var html = html+'<td align="right"style="width: 110px;">联系电话：</td><td align="left" style="width: 150px;">';
		var html = html+'<input id="linktel'+num+'" name="interviewScheduals['+num+'].linktel" class="nui-textbox" style="width: 100%" vtype="float" inputStyle="text-align: left" maxLength="255" onvaluechanged="changeinterviewScheduals(\'linktel\','+num+')"/></td><tr>';
		var html = html+'<tr><td align="right"style="width: 110px;">面试方式：</td><td align="left" style="width: 150px;">';
		var html = html+'<input id="interviewtype'+num+'" name="interviewScheduals['+num+'].interviewtype" class="nui-dictcombobox" style="width: 100%" shownullItem="true"  dictTypeId="INTERVIEW_TYPE" onvaluechanged="changeinterviewScheduals(\'interviewtype\','+num+')"/></td>';
		var html = html+'<td align="right"style="width: 110px;">面试地点：</td><td align="left" style="width: 150px;" colspan="5">';
		var html = html+'<input id="venue'+num+'" name="interviewScheduals['+num+'].venue" class="nui-textbox" style="width: 100%" minWidth="200" minHeight="80" maxLength="255" onvaluechanged="changeinterviewScheduals(\'venue\','+num+')"/></td>';
		var html = html+'</tr></table></div>';
		
		forminterview.appendChild(node);
		document.getElementById("interviewfield"+num).innerHTML = html;
		nui.parse();
		
		if (set == 'add'){
			nui.get("interviewroundes"+num).setValue(num+1);
		}
	}
  	
  	//业务字典
  	function ongender(e){
		return nui.getDictText('ABF_GENDER',e.value);//设置业务字典值
	}
	function onDegreeRenderer(e){
		return nui.getDictText('DEGREE',e.value);//设置业务字典值
	}
	function ongenderApplyStatus(e){
		return nui.getDictText('AME_APPLYSTATUS',e.value);//设置业务字典值
	}
	function ongenderinterviewStatus(e){
		return nui.getDictText('INTERVIEW_STATUS_OUT',e.value);//设置业务字典值
	}
	function getposition(e){
		return nui.getDictText('INTERVIEWER_ROLE',e.value);//设置业务字典值
	}
	function getinterviewstatus(e){
		return nui.getDictText('INTERVIEW_STATUS',e.value);//设置业务字典值
	}
	function getinterviewType(e){
		return nui.getDictText('INTERVIEW_TYPE',e.value);//设置业务字典值
	}
	//设置日期格式并判断当期时间是否过去时间
	function onDealDate(e){
		var date = e.value;
		if(date){
			return e.cellHtml.substring(0,10);
		}
	}
	//中文数字转换
	function SectionToChinese(section){
		var chnNumChar = ["零","一","二","三","四","五","六","七","八","九"];
		var chnUnitSection = ["","万","亿","万亿","亿亿"];
		var chnUnitChar = ["","十","百","千"];
		var strIns = '', chnStr = '';
		var unitPos = 0;
		var zero = true;
		while(section > 0){
			var v = section % 10;
			if(v === 0){
				if(!zero){
					zero = true;
					chnStr = chnNumChar[v] + chnStr;
				}
			}else{
				zero = false;
				strIns = chnNumChar[v];
				strIns += chnUnitChar[unitPos];
				chnStr = strIns + chnStr;
			}
			unitPos++;
			section = Math.floor(section / 10);
		}
		return chnStr;
	}
	
	
	function moveRowUp(gridId){
		/* var row = grid.getSelected();
		var index = grid.indexOf(row);
		grid.moveRow(row,index-1);  */
		var grid = nui.get(gridId);
		var rows = grid.getSelecteds();
		grid.moveUp(rows);
		var rows = grid.getData();
		for(var i=0;i<rows.length;i++){
			var row =  {"interviewroundes":i+1};
			grid.updateRow(rows[i],row);
		}
	}
	
	function moveRowDown(gridId){
		/* var row = grid.getSelected();
		var index = grid.indexOf(row);
		grid.moveRow(row,index+1); */
		var grid = nui.get(gridId);
		var rows = grid.getSelecteds();
		grid.moveDown(rows);
		var rows = grid.getData();
		for(var i=0;i<rows.length;i++){
			var row =  {"interviewroundes":i+1};
			grid.updateRow(rows[i],row);
		}
	}
	
	//开票产品详细信息遇到可填报行背景色为黄色
	ResumeLog.on("drawcell", function (e) {
        var record = e.record,
        column = e.column,
        field = e.field,
        value = e.value;
        //增加背景色
        if (field == "interviewdtae") {
            e.cellStyle = "background: #FFFD75";//cyan
        }
    });
    
	function DateFormat(e){
		if(typeof(e.value)=="string" && e.value != '' && e.value != null && e.value != 'null'){
			return e.value.substring(0,16);
		}else{
			//alert(nui.formatDate(e.value,"yyyy-MM-dd HH:mm"))
			return nui.formatDate(e.value,"yyyy-MM-dd HH:mm");
		}
    }
    
    function DateFormat2(value){
    	if(typeof(value)=="string" && value != '' && value != null && value != 'null'){
			return value.substring(0,18);
		}else if(value != '' && value != null && value != 'null'){
			//alert(nui.formatDate(e.value,"yyyy-MM-dd HH:mm"))
			return nui.formatDate(value,"yyyy-MM-dd HH:mm:ss");
		}else{
			return value;
		}
    }
</script>
</html>