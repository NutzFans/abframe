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
  - Date: 2019-11-15 17:50:08
  - Description:
-->
<head>
<title>面试安排</title>
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
			<input name="omRecruit.recpositionname" id="recpositionname1" class="nui-hidden"/>
			<input name="recommend.resumeid" id="resumeid1" class="nui-hidden"/>
			<input name="recommend.omRecruit.recruitid" id="recruitid1" class="nui-hidden"/>
			<input name="recommend.processinstid" id="processinstid" class="nui-hidden"/>
			<input name="recommend.candidatestatus" id="candidatestatus" class="nui-hidden"/>
			<input name="omRecruit.orgname" id="orgname" class="nui-hidden"/>
			<input class="nui-hidden" id="workItemID" value="<%=workItemID %>"/>
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
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;width:99%;">
			<input name="resume.resumeid" id="resumeid" class="nui-hidden">
			<input name="resume.fileids" id="fileids1" class="nui-hidden"/>
			<input name="resume.gender" id="gender1" class="nui-hidden"/>
			<input name="resume.interviewdtae" id="interviewdtae" class="nui-hidden"/>
			<input name="resume.empname" id="empname1" class="nui-hidden"/>
			<input name="resume.tel" id="tel1" class="nui-hidden"/>
			<input name="resume.selfemail" id="selfemail1" class="nui-hidden"/>
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
	            		<td align="right" style="width:80px;">技术级别:</td>
	            		<td name="resume.technology" id="technology" style="width:120px;" align="left" class = "asLabel"></td>
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
						<td align="right" style="width:80px;">标签:</td>
	            		<td name="resume.labelid" id="labelid" style="width:120px;" align="left"  class = "asLabel"  colspan="7"> </td>
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
		<div id="body_tab" class="nui-tabs" activeIndex="0" style="width: 100%;height:100%;padding: 0">
			<div title="面试评价信息">
				<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;width:99%;">
					<legend>面试评价信息</legend>
					<iframe id="appraise" src="" frameborder="0" scrolling="no" height="670px" width="100%" style="text-align: center;"></iframe>
				</fieldset>
			</div>
			<div title="HR面试核查信息">
				<fieldset id="field7" style="border:solid 1px #aaa;padding:3px;width:99%;">
					<legend>HR面试核查信息</legend>
					<jsp:include page="/ame_common/csIncomecheck/showIncomeCheck.jsp"/>	
				</fieldset>
			</div>
		</div>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;width:99%;">
			<legend >面试安排</legend>
			<table style="width:100%;">
				<tr>
					<td align="right" style="width:13%;">面试情况：</td>
                	<td style="width:87%;" align="left" >
                		<input name="resume.nextInterview" id="nextInterview" style="width:20%;" class="nui-combobox" data="[{id:'0',text:'面试结束，进入offer沟通结果'},{id:'1',text:'进入下一轮面试'},{id:'2',text:'结束面试'}]" width="100%" required="true" shownullItem="false" onvaluechanged="changenextInterview"/>
                	</td>
				</tr>
				<tr id="isshowsendmail1" style="display:none;">
					<td align="right">
						<span style="color: red">发送面试通知，并抄送面试发起人:</span>
					</td>
					<td  align="left">
						<input class="nui-radiobuttonlist" name="resume.issendmail" id="issendmail" repeatItems="2" repeatLayout="table" repeatDirection="Horizontal" textField="text" valueField="id" required="true" style="width:200px;" data="[{'id': '1','text': '是'},{'id': '0','text': '否'}]"/>
					</td>	
				</tr>
				<tr id="isshowsendmail" style="display:none;">
					<td align="right" style="width:20%;">私人邮箱:</td>
            		<td name="resume.selfemail" id="selfemail" style="width:20%;" align="left"></td>
				</tr>
				<tr id="endlabel1" style="display:none;">
					<td align="right" style="width:20%;">结束原因：</td>
                	<td style="width:80%;" align="left">
                		<input name="resume.interviewstatus" id="interviewstatus" style="width:20%;" class="nui-combobox" data="[{id:'3',text:'未通过面试'},{id:'9',text:'候选人放弃面试'},{id:'10',text:'中止面试'}]" width="100%" required="false" shownullItem="false"/>
                	</td>
				</tr>
				<tr id="endlabel" style="display:none;">
					<td align="right" style="width:20%;">结束原因说明：</td>
                	<td style="width:80%;"align="left">
                		<input name="logs.groupId" id="groupid" class="nui-hidden"/>
                		<input name="logs.relationId" id="relationid" class="nui-hidden" />
                		<input name="logs.loginfo" id="loginfo" style="width:100%;height:60px;" class="nui-textarea"  required="false" />
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
			</table>
			<div style="width:100%;">
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
							<td style="width:100%;">
								<a class="nui-button" iconCls="icon-add" id="add2" onclick="addRow1('interviews')">增加</a>
								<a class="nui-button" iconCls="icon-remove" id="delete2" onclick="removeRow1('interviews')">删除</a>
		                        <a class="mini-button" iconCls="icon-upload" onclick="moveRowUp('interviews')" plain="true">上移</a>
		                        <a class="mini-button" iconCls="icon-download" onclick="moveRowDown('interviews')" plain="true">下移</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="interviews" class="nui-datagrid" style="width:100%;height:auto;" dataField="resumInterviews" showPager="false" onrowclick="rowclick"
				allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" url="com.primeton.eos.ame_permanage.ame_resum.getInterview.biz.ext" 
				allowSortColumn="true" allowCellWrap="false" oncellendedit="changeinterviewer('interviews')" ondrawcell="selectionChanged">
				<div property="columns">
					<div field="aaa" type="checkcolumn" width="20px" ></div>
					<input field="interviewid" class="nui-hidden" visible="false">
					<div field="interviewroundes"  type="indexcolumn" width="15" headerAlign="center" align="center">轮次</div>
					<div field="status" width="0" headerAlign="center"  align="center" allowSort="true" renderer="getinterviewstatus">面试状态
						<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="INTERVIEW_STATUS" />
					</div>
					<div field="interviewdtae" width="80" headerAlign="center" align="center" allowSort="true" renderer="DateFormat">面试时间
						<input property="editor" class="nui-datepicker"  format="yyyy-MM-dd H:mm" showTime="true" showOkButton="true" showClearButton="false" style="width:100%;"/>
					</div>
					<div field="interviewer" displayField="empname"width="45" headerAlign="center" align="center" >面试人
						<input property="editor" class="nui-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext">
					</div>
					<div field="positionname" width="45" headerAlign="center"  align="center" allowSort="true" renderer="getposition">面试官角色
						<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="INTERVIEWER_ROLE" />
					</div>
					<div field="applyoccupation" width="0" headerAlign="center" align="center">面试岗位
						<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
					</div>
					<div field="linkman" displayField="linkmanname"width="45" headerAlign="center" align="center" >联系人
						<input property="editor" class="nui-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext">
					</div>
					<div field="linktel" width="40" headerAlign="center" align="center">联系人电话
						<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
					</div>
					<div field="interviewtype" width="45" headerAlign="center"  align="center" allowSort="true" renderer="getinterviewType">面试方式
						<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="INTERVIEW_TYPE" />
					</div>
					<div field="venue" width="70" headerAlign="center" align="left">面试地点
						<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
					</div>
					<div field="memo" width="70" headerAlign="center" align="left">面试备注
						<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
					</div>
					<div field="feedbackstatus" width="45" headerAlign="center" align="center" renderer="getfeedbackstatus">反馈意见</div>
					<div field="feedback" width="0" headerAlign="center" align="left">反馈评价</div>
					<div field="orientation" width="0" headerAlign="center" align="left">意向薪资待遇说明</div>
				</div>
			</div>
		</fieldset>
	</form>
	<fieldset style="border:solid 1px #aaa;padding:3px;display:none;" id="isshowsendmail2">
		<legend><span style="color: red">面试邮件内部通知</span></legend>
		<div style="line-height: 30px;padding-left: 66px;"><span>邮件抄送人：</span><input id="cclist" class="nui-textboxlist" onvaluechanged="changecc" onremoveitem="removecc" allowInput="true" textField="EMPNAMES" valueField="OEMAIL" searchField="name" style="width:500px;"  url="com.primeton.mis.contract.contractApproval.getEmpByName.biz.ext" /><span style="color:red"> （需要补充行政接待人以及其他需要告知的人）</span></div>
		<div style="line-height: 30px;padding-left: 66px;"><span>抄送邮件组：</span> <input id="cclistGroup" class="nui-dictcombobox"  multiSelect="true" style="width: 500px" shownullItem="false"  dictTypeId="AME_MAILGROUP" required="false" value="mianshi@primeton.com"/></div>
	</fieldset>
	<jsp:include page="/ame_common/misOpinion.jsp"/>
	<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;display:none">
		<legend>处理意见附件</legend>
		<jsp:include page="/ame_common/addFiles.jsp"/>
	</fieldset>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width:60px;margin-right:20px;" id="appButton">提交</a>
	<%--<a class="nui-button" iconCls="icon-save" onclick="temsave()" style="margin-right:20px;"  id="saveButton">暂时保存</a>--%>
	<a class="nui-button"onclick="onCancel" iconCls="icon-close" style="width:60px;">关闭</a>
</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form_recruit = new nui.Form("form_recruit");
	var grid_interview = nui.get('interviews');
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	
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
            		
            		nui.get("relationid").setValue(o.resume.resumeid);
            		nui.get("groupid").setValue("AME_RESUME");
            		var labelname='';
            		for(var i=0;i<o.resume.label.length;i++){
            			if (labelname==''){
            				labelname = o.resume.label[i].ameLabel.labelcontent;
            			}else{
            				labelname = labelname + ','+ o.resume.label[i].ameLabel.labelcontent;
            			}
            		}
            		document.getElementById("labelid").innerHTML = labelname;
            		
            		grid_interview.load({"criteria": {"_expr[0]": { "ameResume.resumeid": o.resume.resumeid},"_expr[1]": { "omRecruit.recruitid": o.omRecruit.recruitid}}});
					grid_interview.sortBy("interviewroundes", "asc");
            		
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
					var dataStatus = [{"dictID": 4,"dictName": "处理"},{"dictID": 2,"dictName": "终止流程"}];
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
               		
               		var path = nui.getDictText('AME_SYSCONF','AMEPATH')+"reportJsp/showReport4Proj.jsp?rpx=/queryAppraise.rpx&recruitid="+o.omRecruit.recruitid+"&resumeid="+o.resume.resumeid;
               		$("#appraise").attr('src',path); 
               		
               		//hr面试核查要点信息
               		showIncomeCheck(o.recommend.processinstid);
            	}
            	nui.get("issendmail").setValue("1");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
		});
  	}
  	
  	function onOk(){
  		var auditstatus = nui.get("auditstatus").getValue();
		if(auditstatus!="2"){
			var nextInterview = nui.get("nextInterview").getValue();
			if(nextInterview == '1'){
				var interviews = grid_interview.getData();
				if(interviews.length<=0){
		  			nui.alert("请增加面试安排!");
		  			return;
  				}
  				var wroundes = 0;
  				var nowdate = new Date();
				for(var j=0;j<interviews.length;j++){
					if(interviews[j].status == '0'){
						wroundes++;
					}
					if(wroundes == 1){
						if(interviews[j].interviewroundes == null || interviews[j].interviewroundes == ''){
		  					nui.alert("面试安排轮次必填!");
						  	return;
		  				}
		  				if(interviews[j].status == null || interviews[j].status == ''){
		  					nui.alert("面试安排面试状态必填!");
						  	return;
		  				}
		  				if(interviews[j].interviewdtae == null || interviews[j].interviewdtae == ''){
		  					nui.alert("面试安排面试时间必填!");
						  	return;
		  				}else if(DateFormat({"value":interviews[j].interviewdtae})<DateFormat({"value":nowdate})){
  							nui.alert("面试安排面试时间必须大于等于当天!");
				  			return;
  						}
		  				if(interviews[j].interviewer == null || interviews[j].interviewer == ''){
		  					nui.alert("面试安排面试人必选!");
						  	return;
		  				}
		  				if(interviews[j].linkman == null || interviews[j].linkman == ''){
		  					nui.alert("面试安排联系人必选!");
						  	return;
		  				}
		  				if(interviews[j].linktel == null || interviews[j].linktel == ''){
		  					nui.alert("面试安排联系人电话必填!");
						  	return;
		  				}
		  				if(interviews[j].interviewtype == null || interviews[j].interviewtype == ''){
		  					nui.alert("面试安排面试方式必填!");
						  	return;
		  				}else if ((interviews[j].interviewtype == '0' || interviews[j].interviewtype == '3') && (interviews[j].venue == null || interviews[j].venue == '')){
		  					nui.alert("面试安排面试地点必填!");
						  	return;
		  				}
					}
	  				for(var k=0;k<interviews.length;k++){
	  					if(interviews[j].interviewroundes == interviews[k].interviewroundes && j!=k){
	  						nui.alert("面试安排面试轮次不能重复!");
					  		return;
	  					}
	  				}
	  			}
	  			if(wroundes == 0){
	  				nui.alert("如果要进入下一轮面试，必须至少有一条面试安排的状态为轮候中!");
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
		var message = "";
		var issendmail = nui.get("issendmail").getValue();
		if(issendmail == '1'){
			message = "如需发送面试通知请检查面试候选人邮箱是否正确！";
		}
		nui.confirm("确定要提交招聘面试流程吗？"+message,"操作提示",function (action){
			if(action == "ok"){
				var json = form_recruit.getData();
		  		var auditstatus = nui.get("auditstatus").getValue();
				//审批意见
				var opioionformData = opioionform.getData();
				json.misOpinion = opioionformData.misOpinion;
				var nextInterview = nui.get("nextInterview").getValue();
				
				var auditstatus = nui.get("auditstatus").getValue();
				if(auditstatus!="2" && auditstatus!="0"){
					if(nextInterview == '1'){
						var interviews = grid_interview.getData();
				  		var interviewer = interviews[interviews.length-1].interviewer;
				  		var turn = interviews[interviews.length-1].interviewroundes;
				  		var x = interviews.length-1;
				  		for(var j=0;j<interviews.length;j++){
				  			if(interviews[j].interviewroundes < turn && interviews[j].status == '0'){
				  				turn = interviews[j].interviewroundes;
				  				interviewer = interviews[j].interviewer;
				  				x = j;
				  			}
				  		}
				  		var weekDay = ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"];  
						var myDate = new Date(Date.parse(interviews[x].interviewdtae)); 
			  			var updateRow = {"status":'1',"weekday":weekDay[myDate.getDay()]};
						grid_interview.updateRow(interviews[x],updateRow);
			  			json.interviews=grid_interview.getChanges();
				  		json.resume.interviewer = interviewer;
					}else{
						var interviews = grid_interview.getData();
						for(var j=0;j<interviews.length;j++){
				  			if(interviews[j].status == '0' || interviews[j].status == '1'){
				  				grid_interview.removeRow(interviews[j], false);
				  			}
				  		}
				  		json.interviews=grid_interview.getChanges();
					}
		  		}
		  		//json.omRecruit.recpositionname = document.getElementById("recposition").innerHTML;
				json.resume.cclist = nui.get("cclist").getValue();//发送邮件;
				var cclistGroup = nui.get("cclistGroup").getValue();//发送邮件组
	  			if(cclistGroup != null && cclistGroup != ''){
	  				if(json.resume.cclist != null && json.resume.cclist != ''){
	  					json.resume.cclist = json.resume.cclist+','+cclistGroup;
	  				}else{
	  					json.resume.cclist = cclistGroup;
	  				}
	  			}
				json.resume.cclistname = nui.get("cclist").getText();//发送邮件;
				var cclistGroupname = nui.get("cclistGroup").getText();//发送邮件组
	  			if(cclistGroupname != null && cclistGroupname != ''){
	  				if(json.resume.cclistname != null && json.resume.cclistname != ''){
	  					json.resume.cclistname = json.resume.cclistname+','+cclistGroupname;
	  				}else{
	  					json.resume.cclistname = cclistGroupname;
	  				}
	  			}
	  			
				for(var i=0;i<json.interviews.length;i++){
					json.interviews[i].interviewdate = DateFormat({"value":json.interviews[i].interviewdtae});
				}
				
				json.recommend.candidatestatus = json.resume.interviewstatus;//状态一致;
				
				var loginfo = nui.get("loginfo").getValue();
				if(loginfo == null || loginfo == ''){
				}else{
					json.logs.loginfo = nui.get("interviewstatus").getText()+"："+json.logs.loginfo;
				}
				
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
	    					if(action.sendMail == null){
		    					nui.alert("提交流程任务处理成功！","系统提示",function(){
					        		CloseWindow("ok");
				    				nui.get("appButton").setEnabled(true);
					        	});
				        	}else{
		    					nui.alert("提交流程任务处理成功！"+"但发送"+action.sendMail+"面试通知邮件失败，请线下通知。","系统提示",function(){
					        		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
					        	});
	    					}
	    				}else{
	    					nui.alert("流程提交失败！","系统提示",function (){
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
	
	function changeinterviewer(gridid){
	 	var grid = nui.get(gridid);
        var row = grid.getSelected();
        <%--if(row.interviewer != null && row.interviewer != ''){
	        if(row.interviewer.indexOf(",")!=-1){
	        	nui.alert("每一条面试安排的面试人唯一！");
	            var updateRow = {"interviewer":null,"empname":null};
	            grid.updateRow(row,updateRow);
	            return;
	        }
        }--%>
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
	
	function  selectionChanged(e){
		if(e.row.status !='0' && e.field == "aaa"){
 	 		e.cellHtml="";
 		}
	}
	
	//dataGrid列选中是进行判断是否可编辑
	function rowclick(e){
		var row=grid_interview.getSelected ( );
		var status=row.status;
		if(status!="0"){
			grid_interview.setAllowCellEdit(false);       //@Review   看看visible后是否还需要enable
		}
		else {
			grid_interview.setAllowCellEdit(true); 
		}
			
	}
	
	function addRow1(gridid){
		var newRow = { name: "New Row"};
        var grid = nui.get(gridid);
		newRow = { name: "New Row",status: "0",interviewroundes: grid.getData().length+1};
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
	
	function changenextInterview(){
		var nextInterview = nui.get("nextInterview").getValue();
		if(nextInterview == '2'){
			document.getElementById("endlabel").style.display="";
			document.getElementById("endlabel1").style.display="";
			nui.get("interviewstatus").setRequired(true);
			nui.get("loginfo").setRequired(true);
			nui.get("interviewstatus").setValue(null);
			nui.get("interviewstatus").setText(null);
			
			document.getElementById("isshowsendmessage").style.display="";
			nui.get("issendNopass").setRequired(true);
		}else{
			document.getElementById("endlabel").style.display="none";
			document.getElementById("endlabel1").style.display="none";
			if(nextInterview == '0'){
				nui.get("interviewstatus").setValue('4');
			}else if(nextInterview == '1'){
				nui.get("interviewstatus").setValue('2');
			}
			
			nui.get("loginfo").setValue(null);
			nui.get("interviewstatus").setRequired(false);
			nui.get("loginfo").setRequired(false);
			
			document.getElementById("isshowsendmessage").style.display="none";
			nui.get("issendNopass").setValue(null);
			nui.get("issendNopass").setRequired(false);
		}
		if(nextInterview == '1'){
			document.getElementById("isshowsendmail").style.display="";
			document.getElementById("isshowsendmail1").style.display="";
			document.getElementById("isshowsendmail2").style.display="";
			nui.get("issendmail").setValue('1');
		}else{
			document.getElementById("isshowsendmail").style.display="none";
			document.getElementById("isshowsendmail1").style.display="none";
			document.getElementById("isshowsendmail2").style.display="none";
			nui.get("issendmail").setValue('0');
		}
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
	function getposition(e){
		return nui.getDictText('INTERVIEWER_ROLE',e.value);//设置业务字典值
	}
	function getinterviewstatus(e){
		return nui.getDictText('INTERVIEW_STATUS',e.value);//设置业务字典值
	}
	function getfeedbackstatus(e){
		return nui.getDictText('AME_FEEDBACK_STATUS',e.value);//设置业务字典值
	}
	function getinterviewType(e){
		return nui.getDictText('INTERVIEW_TYPE',e.value);//设置业务字典值
	}
	
	function DateFormat(e){
		if(typeof(e.value)=="string" && e.value != '' && e.value != null && e.value != 'null'){
			return e.value.substring(0,16);
		}else{
			//alert(nui.formatDate(e.value,"yyyy-MM-dd HH:mm"))
			return nui.formatDate(e.value,"yyyy-MM-dd HH:mm");
		}
    }
    
    function checkDetail(fileId){
    	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+fileId;
		window.open(url,"_self");
    }
</script>
</html>