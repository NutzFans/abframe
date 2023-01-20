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
  - Date: 2019-11-15 17:48:50
  - Description:
-->
<head>
<title>面试反馈</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    .asLabel{border:0;background-color:#F5F5F5;cursor:default;}
	img{
	    display: none;
	    width: 135px;
	    height: 189px;
	}
</style>
</head>
<body>
<%long workItemID = (Long)request.getAttribute("workItemID"); %>
<div class="nui-fit">
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
	<form id="form_recruit" method="post">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;width:99%;">
			<legend>招聘需求</legend>
			<input name="omRecruit.recruitid" id="recruitid" class="nui-hidden"/>
			<input name="omRecruit.recruitno" id="recruitno1" class="nui-hidden"/>
			<input name="recommend.resumeid" id="resumeid1" class="nui-hidden"/>
			<input name="recommend.omRecruit.recruitid" id="recruitid1" class="nui-hidden"/>
			<input name="recommend.processinstid" id="processinstid" class="nui-hidden"/>
			<input name="recommend.candidatestatus" id="candidatestatus" class="nui-hidden"/>
			<input class="nui-hidden" id="workItemID" value="<%=workItemID %>"/>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:120px;">需求编号：</td>
	                	<td style="width:150px;" name="omRecruit.recruitno" id="recruitno" class = "asLabel"></td>
						<td align="right"style="width: 120px;">招聘职位：</td>
						<td align="left" style="width: 150px;" name="omRecruit.recpositionname" id="recpositionname" class = "asLabel"></td>
						<td align="right"style="width: 110px;">招聘部门：</td>
						<td align="left" style="width: 150px;" name="omRecruit.orgid" id="orgid" class = "asLabel"></td>
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
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;width:99%;">
			<input name="resume.resumeid" id="resumeid" class="nui-hidden">
			<input name="resume.fileids" id="fileids1" class="nui-hidden"/>
			<legend >简历基本信息</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:130px;">姓名:</td>
	            		<td name="resume.empname" id="empname" style="width:170px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="font-size:12px;width:130px;">性别:</td>
	            		<td name="resume.gender" id="gender" style="width:170px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:130px;">出生日期:</td>
	            		<td name="resume.birthdate" id="birthdate" style="width:170px;" class = "asLabel"></td>
	            		<%--<td rowspan="8"style="width:130px;" align="center">
						    <img src="" alt="" id="myimg"/>
						<td>--%>
	            		<td align="right" style="width:80px;">婚姻状况:</td>
	            		<td name="resume.marristatus" id="marristatus" style="width:120px;" class = "asLabel"></td>
	            	</tr>
					<tr>
						<td align="right" style="width:80px;">求职状态:</td>
	            		<td name="resume.applystatus" id="applystatus" style="width:120px;" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">发布城市:</td>
	            		<td name="resume.announcecity" id="announcecity" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">应聘职位:</td>
	            		<td name="resume.applyoccupation" id="applyoccupation" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">应聘日期:</td>
	            		<td name="resume.applydate" id="applydate" style="width:120px;" class = "asLabel"></td>
            		</tr>
					<tr>
	            		<td align="right" style="width:80px;">目前居住地:</td>
	            		<td name="resume.currentadress" id="currentadress" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">户口所在地:</td>
	            		<td name="resume.haddress" id="haddress" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">工作年月:</td>
	            		<td name="resume.workdate" id="workdate" style="width:120px;" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">工作年限:</td>
	            		<td name="resume.workingyear" id="workingyear" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">学历:</td>
	            		<td name="resume.education" id="education" style="width:120px;" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">毕业学校:</td>
	            		<td name="resume.school" id="school" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">专业:</td>
	            		<td name="resume.specialty" id="specialty" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">毕业时间:</td>
	            		<td name="resume.highestoutdate" id="highestoutdate" style="width:120px;" class = "asLabel"></td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">联系电话:</td>
	            		<td name="resume.tel" id="tel" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">私人邮箱:</td>
	            		<td name="resume.selfemail" id="selfemail" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">联系地址:</td>
	            		<td name="resume.mailaddress" id="mailaddress" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">邮编:</td>
	            		<td name="resume.postcode" id="postcode" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">最近一家公司:</td>
	            		<td name="resume.currentcompany" id="currentcompany" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">最近一个职位:</td>
	            		<td name="resume.currentoccupation" id="currentoccupation" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">目前薪资:</td>
	            		<td name="resume.currentincome" id="currentincome" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">期望薪资:</td>
	            		<td name="resume.expectincome" id="expectincome" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">技术级别:</td>
	            		<td name="resume.technology" id="technology" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">标签:</td>
	            		<td name="resume.labelid" id="labelid" style="width:120px;" align="left" colspan="3"  class = "asLabel"> </td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">备注:</td>
	            		<td name="resume.remark" id="remark1" style="width:120px;" align="left"  class = "asLabel"  colspan="7"> </td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">简历附件:</td>
	            		<td name="resume.files" id="files" style="width:120px;" align="left"  class = "asLabel"  colspan="7"> </td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
			<legend>面试安排附件</legend>
			<jsp:include page="/ame_common/detailAndDelFile.jsp"/>
		</fieldset>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;width:99%;">
			<legend>面试评价</legend>
			<input name="interview.interviewid" id="interviewid" class="nui-hidden"/>
			<input name="interview.feedbackdate" id="feedbackdate" class="nui-hidden"/>
			<input name="interview1.interviewid" id="interviewid1" class="nui-hidden"/>
			<input name="interview1.ameResume.resumeid" id="resumeid2" class="nui-hidden"/>
			<input name="interview1.omRecruit.recruitid" id="recruitid2" class="nui-hidden"/>
			<input name="interview1.status" id="status2" class="nui-hidden"/>
			<input name="interview1.interviewroundes" id="interviewroundes2" class="nui-hidden"/>
			<input name="appraisal.appraiseid" id="appraiseid" class="nui-hidden"/>
			<input name="appraisal.evaluationmouldid" id="evaluationmouldid" class="nui-hidden"/>
			<table style="width:70%;"  align="left">
				<tr>
					<td align="right" style="width:80px;">面试方式:</td>
            		<td name="interview.interviewtype" id="interviewtype" style="width:120px;" align="left" class = "asLabel"></td>
            		<td align="right" style="width:80px;">面试时间:</td>
            		<td name="nterview.interviewdtae" id="interviewdtae" style="width:120px;" align="left" class = "asLabel"></td>
					<td align="right" style="width:80px;">面试地点:</td>
            		<td name="interview.venue" id="venue" style="width:120px;" align="left" class = "asLabel"></td>
				</tr>
			</table>
			<table style="width:70%;"  align="left">
				<tr>
					<td  style="width:45%;">
						<table>
							<tr style="width:100%;">
								<td align="right" style="width:40%;">反馈意见：</td>
			                	<td style="width:60%;"align="left" >
			                		<input name="interview.feedbackstatus" id="feedbackstatus" style="width:100%;" class="nui-dictcombobox" dictTypeId="AME_FEEDBACK_STATUS"required="true" shownullItem="true"  onvaluechanged="changefeedbackstatus"/>
			                	</td>
							</tr>
						</table>
					</td>
					<td  style="width:35%;">
						<table>
							<tr>
								<td align="right" style="width:40%;"  id="nextlabel">下一轮面试人：</td>
			                	<td style="width:60%;"align="left"  id="nextlabel1" >
			                		<input name="interview1.interviewer" id="interviewer"class="nui-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext" width="100%" shownullItem="true"/>
			                	</td>
							</tr>
						</table>
					</td>
					<td style="width:20%;" align="right">
						<a href="javascript:void(0)" onclick='linkappraise();' id="appraiselink" title='前轮面试评价' style="font-size:20px;"><strong>前轮面试评价</strong></a>
					</td>
				</tr>
				<tr id="isshowsendmessage" style="display:none;">
					<td align="right">
						<span style="color: red">面试不通过，给候选人发送短信通知？</span>
					</td>
					<td  align="left">
						<input class="nui-radiobuttonlist" name="resume.issendNopass" id="issendNopass" repeatItems="2" repeatLayout="table" repeatDirection="Horizontal" textField="text" valueField="id" required="true" style="width:200px;" data="[{'id': '1','text': '是'},{'id': '0','text': '否'}]"/>
					</td>	
				</tr>
				<%--
				<tr id="endlabel">
					<td align="right" style="width:120px;">意向薪资待遇说明：</td>
                	<td style="width:150px;"align="left">
                		<input name="interview.orientation" id="orientation" class="nui-textarea" style = "width: 80%;height:60px" maxLength="500">
                	</td>
				</tr>--%>
			</table>
			<%--动态面试评价表  --%>
			<table   id="appraisal_table" style="width:70%;table-layout:fixed;border-collapse:collapse" bordercolor="#A8A8A8" border="1" cellspacing="0" cellpadding="1" align="left" >
				<tr>
					<td align="center" colspan="2">评价项</td>
					<td align="center">评分<span style="color: red">（十分制，面试不涉及请勾选‘不评分’）</span></td>
				</tr>
				<tr>
					<td align="center">求职动机</td>
                	<td align="center"   colspan="2">
                		<input name="recommend.motive" id="motive" class="nui-textbox" style = "width: 100%;" maxLength="500" required="false">
                	</td>
				</tr>
				<tr>
					<td align="center">离职原因</td>
                	<td align="center"   colspan="2">
                		<input name="recommend.reason" id="reason" class="nui-textbox" style = "width: 100%;" maxLength="500" required="false">
                	</td>
				</tr>
				<tr>
					<td align="center">综合评价</td>
                	<td align="center"   colspan="2">
                		<input name="appraisal.overallmerit" id="overallmerit" class="nui-textarea" style = "width: 100%;height:60px;" maxLength="500" required="true">
                	</td>
				</tr>
			</table>
		</fieldset>
	</form>
	<jsp:include page="/ame_common/checkList.jsp"/>	
	<jsp:include page="/ame_common/misOpinion.jsp"/>
	<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;display:none;">
		<legend>处理意见附件</legend>
		<jsp:include page="/ame_common/addFiles.jsp"/>
	</fieldset>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width:60px;margin-right:20px;" id="appButton">提交</a>
	<%--<a class="nui-button" iconCls="icon-save" onclick="temsave()" style="margin-right:20px;"  id="saveButton">暂时保存</a>--%>
	<a class="nui-button"onclick="onCancel" iconCls="icon-close" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form_recruit = new nui.Form("form_recruit");
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	var evaluateMoulddetalls = [];
	var path;
	
	initdate();
  	function initdate(){
  		promptInit({"workItemID": <%=workItemID %>,"processDefName": "com.primeton.eos.ame_permanage.ame_entry","activityDefID": "manualActivity"});//流程提示信息
  		nui.ajax({
	        url: "com.primeton.eos.ame_permanage.ame_interview.getInterviewEntry.biz.ext",
	        data: {recruitid:null,workItemID:<%=workItemID %>,processInstID:null},
            type: 'POST',
            cache: false,
   			async:false,
            contentType: 'text/json',
            success: function (o) {
            	if(o.omRecruit){
            		createappraisaltable(o.evaluateMoulddets);
            		evaluateMoulddetalls = o.evaluateMoulddets;
            		form_recruit.setData(o);
            		//招聘需求信息
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
            		//简历信息
            		document.getElementById("empname").innerHTML = o.resume.empname == null ? "" : o.resume.empname;
					document.getElementById("gender").innerHTML = o.resume.gender == null ? "" : nui.getDictText('ABF_GENDER',o.resume.gender);
					document.getElementById("birthdate").innerHTML = o.resume.birthdate == null ? "" : o.resume.birthdate;
					document.getElementById("marristatus").innerHTML = o.resume.marristatus == null ? "" : nui.getDictText('ABF_MARRITYPE',o.resume.marristatus);
					document.getElementById("applystatus").innerHTML = o.resume.applystatus == null ? "" : nui.getDictText('AME_APPLYSTATUS',o.resume.applystatus);
					document.getElementById("announcecity").innerHTML = o.resume.announcecity == null ? "" : o.resume.announcecity;
					document.getElementById("applyoccupation").innerHTML = o.resume.applyoccupation == null ? "" : o.resume.applyoccupation;
					document.getElementById("applydate").innerHTML = o.resume.applydate == null ? "" : o.resume.applydate;
					document.getElementById("haddress").innerHTML = o.resume.haddress == null ? "" : o.resume.haddress;
					document.getElementById("workdate").innerHTML = o.resume.workdate == null ? "" : o.resume.workdate;
					document.getElementById("workingyear").innerHTML = (o.resume.workingyear1 == null ? "" : o.resume.workingyear1)+'年';
					document.getElementById("education").innerHTML = o.resume.education == null ? "" : nui.getDictText('DEGREE',o.resume.education);
					document.getElementById("school").innerHTML = o.resume.school == null ? "" : o.resume.school;
					document.getElementById("specialty").innerHTML = o.resume.specialty == null ? "" : o.resume.specialty;
					document.getElementById("highestoutdate").innerHTML = o.resume.highestoutdate == null ? "" : o.resume.highestoutdate;
					document.getElementById("tel").innerHTML = o.resume.tel == null ? "" : o.resume.tel;
					document.getElementById("selfemail").innerHTML = o.resume.selfemail == null ? "" : o.resume.selfemail;
					document.getElementById("mailaddress").innerHTML = o.resume.mailaddress == null ? "" : o.resume.mailaddress;
					document.getElementById("postcode").innerHTML = o.resume.postcode == null ? "" : o.resume.postcode;
					document.getElementById("currentcompany").innerHTML = o.resume.currentcompany == null ? "" : o.resume.currentcompany;
					document.getElementById("currentoccupation").innerHTML = o.resume.currentoccupation == null ? "" : o.resume.currentoccupation;
					document.getElementById("currentincome").innerHTML = (o.resume.currentincome == null ? "" : o.resume.currentincome)+'千元';
					document.getElementById("expectincome").innerHTML = (o.resume.expectincome == null ? "" : o.resume.expectincome)+'千元';
					document.getElementById("technology").innerHTML = o.resume.technology == null ? "" : nui.getDictText('AME_TECH',o.resume.technology);
            		document.getElementById("remark1").innerHTML = o.resume.remark == null ? "" : o.resume.remark;
            		
            		document.getElementById("interviewtype").innerHTML = o.interview.interviewtype == null ? "" : nui.getDictText('INTERVIEW_TYPE',o.interview.interviewtype);
            		document.getElementById("interviewdtae").innerHTML = o.interview.interviewdtae == null ? "" : o.interview.interviewdtae;
            		document.getElementById("venue").innerHTML = o.interview.venue == null ? "" : o.interview.venue;
            		
            		var labelname='';
            		for(var i=0;i<o.resume.label.length;i++){
            			if (labelname==''){
            				labelname = o.resume.label[i].ameLabel.labelcontent;
            			}else{
            				labelname = labelname + ','+ o.resume.label[i].ameLabel.labelcontent;
            			}
            		}
            		document.getElementById("labelid").innerHTML = labelname;
            		
            		//下轮面试人
            		if(o.interview1.interviewer != null && o.interview1.interviewer != ''){
            			nui.get("interviewer").setValue(o.interview1.interviewer);
            			nui.get("interviewer").setText(o.interview1.interviewername);
            			nui.get("feedbackstatus").setValue('2');
            			nui.get("resumeid2").setValue(o.resume.resumeid);
            			nui.get("recruitid2").setValue(o.omRecruit.recruitid);
            			nui.get("status2").setValue(o.interview1.status);
            			nui.get("interviewroundes2").setValue(o.interview1.interviewroundes);
            		}else{
            			<%--nui.get("feedbackstatus").setValue('3');--%>
            			nui.get("resumeid2").setValue(o.resume.resumeid);
            			nui.get("recruitid2").setValue(o.omRecruit.recruitid);
            			nui.get("status2").setValue('0');
            			nui.get("interviewroundes2").setValue(o.interview.interviewroundes+1);
            		}
            		//简历附件信息
            		nui.get("grid_0").load({"groupid":"AmeResumeRecommend","relationid":o.recommend.processinstid});
            		//简历附件
            		var filelink = '';
            		if(o.resume.files.length>0){
            			for(var i=0;i<o.resume.files.length;i++){
            				if(filelink == ''){
            					filelink = "<a href='javascript:void(0)' onclick='checkDetail("+o.resume.files[i].fileId+");' title='点击查看'>" + o.resume.files[i].fileName + "</a>";
	    					}else{
	    						filelink = filelink+','+"<a href='javascript:void(0)' onclick='checkDetail("+o.resume.files[i].fileId+");' title='点击查看'>" + o.resume.files[i].fileName + "</a>";
	    					}
	    					
            			}
            		}
            		document.getElementById("files").innerHTML = filelink;
            		
            		//审批意见的流程实例ID
					nui.get("processinstid").setValue(o.recommend.processinstid);
					//流程回退路径赋值 
                	nui.get("backTo").setData(o.recommend.backList);
               		//审核结果设置
					var dataStatus = [{"dictID": 4,"dictName": "处理"}];
					nui.get("auditstatus").setData(dataStatus);
					nui.get("auditstatus").setValue("4");
					nui.get("auditopinion").setValue("处理。");
					nui.get("workitemid").setValue(<%=workItemID %>);
               		nui.get("activitydefid").setValue(o.workitem.activityDefID);
					var processinstid = o.recommend.processinstid;
					var grid = nui.get("datagrid1");
					grid.sortBy("time", "desc");
					grid.load({"processInstID": processinstid},function(){});
               		nui.get("activitydefid").setValue(o.workitem.activityDefID);
               		
               		if(o.omRecruit.interviewroundes<=0){
               			document.getElementById("appraiselink").style.display="none";
               		}else{
               			document.getElementById("appraiselink").style.display="";
               			path = nui.getDictText('AME_SYSCONF','AMEPATH')+"reportJsp/showReport4Proj.jsp?rpx=/queryAppraise.rpx&recruitid="+o.omRecruit.recruitid+"&resumeid="+o.resume.resumeid;
               			//$("#appraiselink").attr('href',path);
               		} 
            		changefeedbackstatus();
            		
            		//checklist所需参数processInstID、activityInstID、incomeType、checkObj
	        		var interviewerrole = o.interview.positionname;
	        		if(interviewerrole != null && interviewerrole!=''){
		        		var checklistdata={processInstID:processinstid,processDefName:o.workitem.processDefName,activityDefID:o.workitem.activityDefID,incomeType:interviewerrole};
						queryChickList(checklistdata);
	        		}
            	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
		});
  	}
  	
  	function linkappraise(){
		var executeUrl = path;
		var iWidth=600; //弹出窗口的宽度;
		var iHeight=430; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open(executeUrl, "前轮面试评价", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
  	}
  	
  	function onOk(){
  		var auditstatus = nui.get("auditstatus").getValue();
		var feedbackstatus = nui.get("feedbackstatus").getValue();
		if(auditstatus!="2"){
			if(feedbackstatus  == "2"){
				var interviewer = nui.get("interviewer").getValue();
				if(interviewer == null || interviewer == ''){
					nui.alert("需进入下一轮面试时下轮面试人必选！");
					return;
				}
			}
		}
    	if(auditstatus=="4" && feedbackstatus  != "0"){
	    	//checklist必须全部选中，如果不通过在备注栏说明原因
	    	var grid_checklist = nui.get("grid_checklist"); 
	    	var checklistrow = grid_checklist.getData();
	    	for(var i =0; i<checklistrow.length;i++){
	    		if(checklistrow[i].ischeck=="0"){
	    			alert("核查清单'"+checklistrow[i].checklistseq+checklistrow[i].checklistname+"'没有勾选！");
	    			return;
	    		}
	    	}
    	}
		if(!form_recruit.validate() && auditstatus!="2"){
			nui.alert("信息录入不完整!");
			return;
		}else{
    		SaveData();
		}
  	}
  	//保存
	function SaveData(){
	    nui.get("feedbackdate").setValue(new Date());
		var json = form_recruit.getData();
		var feedbackstatus = nui.get("feedbackstatus").getValue();
  		var auditstatus = nui.get("auditstatus").getValue();
		//审批意见
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		//根据反馈意见改变简历状态
		if (feedbackstatus == '1'){
			json.resume.reject ='1';
			json.resume.interviewstatus ='3';
			json.recommend.candidatestatus ='3';
		}else if(feedbackstatus == '3'){
			json.resume.interviewstatus ='3';
			json.recommend.candidatestatus ='3';
		}
		//面试轮次状态
		if(auditstatus == '0'){
			json.interview.status='0';
		}else{
			json.interview.status='2';
		}
		//拿到checklist填写的值
    	var grid_checklist = nui.get("grid_checklist"); 
    	var checklistrow = grid_checklist.getData();
    	json.csIncomecheck = checklistrow;
		nui.confirm("确定要提交招聘面试职流程吗？","操作提示",function (action){
			if(action == "ok"){
				nui.get("appButton").setEnabled(false);
				form_recruit.loading("处理中,请稍后...");
	    		nui.ajax({
	    			url:"com.primeton.eos.ame_permanage.ame_interview.interviewProcessReve.biz.ext",
	    			data: json,
	    			type:"post",
	    			contentType:"text/json",
	    			success:function(action){
	    				action = nui.clone(action);
	    				form_recruit.unmask();
	    				if(action.exception == null){
	    					nui.alert("提交流程任务处理成功！","系统提示",function(){
				        		CloseWindow("ok");
			    				nui.get("appButton").setEnabled(true);
				        	});
	    				}else{
	    					nui.alert("流程任务处理失败！","系统提示",function (){
			    				nui.get("appButton").setEnabled(true);
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
		if (action == "close" && form_recruit.isChanged()){
			if (confirm("数据被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	function changefeedbackstatus(){
		var feedbackstatus = nui.get("feedbackstatus").getValue();
		if(feedbackstatus == '2'){
			document.getElementById("nextlabel").style.display="";
			document.getElementById("nextlabel1").style.display="";
		}else{
			document.getElementById("nextlabel").style.display="none";
			document.getElementById("nextlabel1").style.display="none";
		}<%--
		if(feedbackstatus == '4'){
			document.getElementById("endlabel").style.display="";
		}else{
			document.getElementById("endlabel").style.display="none";
		}--%>
		var myTable = document.getElementById('appraisal_table');
		if(feedbackstatus == '0'){
			document.getElementById("appraisal_table").style.display="none";
			nui.get("overallmerit").setRequired(false);
			<%--nui.get("motive").setRequired(false);
			nui.get("reason").setRequired(false);--%>
			for(var i=0;i<(myTable.rows.length-4);i++){
				nui.get('grade'+i).setRequired(false);
			}
		}else{
			document.getElementById("appraisal_table").style.display="";
			nui.get("overallmerit").setRequired(true);
			<%--nui.get("motive").setRequired(false);
			nui.get("reason").setRequired(false);--%>
			for(var i=0;i<(myTable.rows.length-4);i++){
				var checkgrade = nui.get('checkgrade'+i).getValue();
				if(checkgrade == 'true'){
					nui.get('grade'+i).setRequired(false);
					nui.get('grade'+i).setValue(null);
				}else{
					nui.get('grade'+i).setRequired(true);
				}
			}
		}
		nui.get("auditopinion").setValue(nui.get("feedbackstatus").getText());
		
		if(feedbackstatus == '1'){
			document.getElementById("isshowsendmessage").style.display="";
			nui.get("issendNopass").setRequired(true);
		}else{
			document.getElementById("isshowsendmessage").style.display="none";
			nui.get("issendNopass").setValue(null);
			nui.get("issendNopass").setRequired(false);
		}
	}
	
	function createappraisaltable(evaluateMoulddets){
		if(evaluateMoulddets.length>0){
			var type = 0;
			var allnum = 0;
			var evaluationtype = ''; 
			for(var i=0;i<evaluateMoulddets.length;i++){
				var myTable = document.getElementById('appraisal_table');
				//向表格中增加一行
				var myNewRow = myTable.insertRow(myTable.rows.length-3);//取得表格的总行数
				var aRows=myTable.rows;
				//取得表格的总网格数
				var aCells=myNewRow.cells;
				//向新增行中增加3个网格
				var nownum = 0;
				if (evaluationtype == evaluateMoulddets[i].evaluationtype){	
					allnum++;
				}else{
					evaluationtype = evaluateMoulddets[i].evaluationtype;
					nownum = allnum;
					allnum = 0;
					type++;
				}
				var name = "appraisaldets["+(i)+"]";
				if(allnum == 0){
					var oCell1_1=aRows[myNewRow.rowIndex].insertCell(aCells.length);
					oCell1_1.innerHTML = nui.getDictText('AME_EVALUATION',evaluateMoulddets[i].evaluationtype)+
					"<br/><input class='nui-checkbox' name='"+name+".evaluationtype' id='checkevaluationtype"+evaluateMoulddets[i].evaluationtype+"' width='45%'  required='false' align='right' text='不评分'  onvaluechanged='changeevaluationtype("+evaluateMoulddets[i].evaluationtype+")'/>";
					oCell1_1.id = "evaluation_type"+type;
					oCell1_1.align="center";
					oCell1_1.style.width="60%";
				}
				var oCell1_2=aRows[myNewRow.rowIndex].insertCell(aCells.length);
				var oCell1_3=aRows[myNewRow.rowIndex].insertCell(aCells.length);
				oCell1_2.innerHTML = nui.getDictText('AME_EVALUATION_SUB',evaluateMoulddets[i].evaluationsubtype)+"<input class='nui-hidden' name='"+name+".evaluationsubtype' id='evaluationsubtype"+i+"' />"+"<input class='nui-hidden' name='"+name+".evaluationtype' id='evaluationtype"+i+"' />"+"<input class='nui-hidden' name='"+name+".appraisedetid' id='appraisedetid"+i+"' />";
				oCell1_3.innerHTML = "<input class='nui-spinner' name='"+name+".grade' id='grade"+i+"' width='45%'  required='true' format='n2' showbutton='false' changeOnMousewheel='false' minValue='0' maxValue='10' align='right' />-<input class='nui-checkbox' name='"+name+".check' id='checkgrade"+i+"' width='45%'  required='false' align='right' text='不评分'  onvaluechanged='changefeedbackstatus'/>";
				oCell1_2.align="left";
				oCell1_3.align="center";
				oCell1_2.style.width="40%";
				if(allnum == 0 && (type-1) != 0){
					document.getElementById("evaluation_type"+(type-1)).rowSpan = nownum+1;
				}
			}
			if(allnum != 0 && (type-1) != 0){
				document.getElementById("evaluation_type"+(type)).rowSpan = allnum+1;
			}
			nui.parse();
		}else{
			nui.alert("请先就岗位设置面试评价模板！");
			nui.get("appButton").setEnabled(false);
		}
	}
	
    function checkDetail(fileId){
    	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+fileId;
		window.open(url,"_self");
    }
    
    function changeevaluationtype(evaluationtype){
    	for(var i=0;i<evaluateMoulddetalls.length;i++){
    		if(evaluateMoulddetalls[i].evaluationtype == evaluationtype){
    			var checkevaluationtype = nui.get('checkevaluationtype'+evaluationtype).getValue();
    			if(checkevaluationtype == 'true'){
    				nui.get('checkgrade'+i).setValue('true');
    			}else{
    				nui.get('checkgrade'+i).setValue('false');
    			}
    		}
    	}
    	changefeedbackstatus();
    }
</script>
</html>