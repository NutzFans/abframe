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
  - Date: 2020-03-03 15:15:54
  - Description:
-->
<head>
<title>背景调查HR审核</title>
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
						<td align="right"style="width:120px;">拟入职数量：</td>
						<td align="left" style="width: 150px;" name="omRecruit.intendnum" id="intendnum" class = "asLabel"></td>
					</tr>
					<tr>	
						<td align="right">期望入职时间：</td>
						<td align="left" style="width: 150px;" name="omRecruit.hopedate" id="hopedate" class = "asLabel"></td>
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
	            		<td rowspan="8"style="width:130px;" align="center">
						    <img src="" alt="" id="myimg"/>
						<td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">婚姻状况:</td>
	            		<td name="resume.marristatus" id="marristatus" style="width:120px;" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">求职状态:</td>
	            		<td name="resume.applystatus" id="applystatus" style="width:120px;" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">发布城市:</td>
	            		<td name="resume.announcecity" id="announcecity" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">应聘职位:</td>
	            		<td name="resume.applyoccupation" id="applyoccupation" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">应聘日期:</td>
	            		<td name="resume.applydate" id="applydate" style="width:120px;" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">目前居住地:</td>
	            		<td name="resume.currentadress" id="currentadress" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
						
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
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">毕业时间:</td>
	            		<td name="resume.highestoutdate" id="highestoutdate" style="width:120px;" class = "asLabel"></td>
						<td align="right" style="width:80px;">联系电话:</td>
	            		<td name="resume.tel" id="tel" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">私人邮箱:</td>
	            		<td name="resume.selfemail" id="selfemail" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">联系地址:</td>
	            		<td name="resume.mailaddress" id="mailaddress" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">邮编:</td>
	            		<td name="resume.postcode" id="postcode" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">最近一家公司:</td>
	            		<td name="resume.currentcompany" id="currentcompany" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
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
					</tr>
					<tr>
						<td align="right" style="width:80px;">标签:</td>
	            		<td name="resume.labelid" id="labelid" style="width:120px;" align="left" colspan="3"  class = "asLabel"> </td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">简历附件:</td>
	            		<td name="resume.files" id="files" style="width:120px;" align="left"  class = "asLabel"  colspan="7"> </td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;width:99%;">
			<legend>面试评价信息</legend>
			<iframe id="appraise" src="" frameborder="0" scrolling="no" height="670px" width="100%" style="text-align: center;"></iframe>
		</fieldset>
		<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
			<legend>面试情况</legend>
			<div id="interviews" class="nui-datagrid" style="width:100%;height:auto;" dataField="resumInterviews" showPager="false" onrowclick="rowclick"
				allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" url="com.primeton.eos.ame_permanage.ame_resum.getInterview.biz.ext" 
				allowSortColumn="true" allowCellWrap="false" oncellendedit="changeinterviewer('interviews')">
				<div property="columns">
					<input field="interviewid" class="nui-hidden" visible="false">
					<div field="interviewroundes" width="15" headerAlign="center" align="center">轮次</div>
					<div field="status" width="0" headerAlign="center"  align="center" allowSort="true" renderer="getinterviewstatus">面试状态</div>
					<div field="interviewdtae" width="50" headerAlign="center" align="center" allowSort="true" dateFormat="yyyy-MM-dd H:mm:ss">面试时间</div>
					<div field="interviewer" displayField="empname"width="45" headerAlign="center" align="center" >面试人</div>
					<div field="positionname" width="45" headerAlign="center"  align="center" allowSort="true" renderer="getposition">面试官角色</div>
					<div field="applyoccupation" width="0" headerAlign="center" align="center">面试岗位</div>
					<div field="memo" width="0" headerAlign="center" align="left">面试提醒</div>
					<div field="linkman" displayField="linkmanname"width="45" headerAlign="center" align="center" >联系人</div>
					<div field="linktel" width="40" headerAlign="center" align="center">联系人电话</div>
					<div field="venue" width="70" headerAlign="center" align="left">面试地点</div>
					<div field="feedbackstatus" width="45" headerAlign="center" align="center" renderer="getfeedbackstatus">反馈意见</div>
					<div field="feedback" width="0" headerAlign="center" align="left">反馈评价</div>
					<div field="orientation" width="0" headerAlign="center" align="left">意向薪资待遇说明</div>
				</div>
			</div>
		</fieldset>
		<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
			<legend>背景调查审核附件</legend>
			<jsp:include page="/ame_common/detailAndDelFile.jsp"/>
		</fieldset><fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
			<legend>背景调查审核结果列表</legend>
			<div id="backCheckGrid" class="nui-datagrid" style="width:100%;height:auto;" dataField="backCheckOpinions"
			    url="com.primeton.eos.ame_permanage.ame_interview.getBackGroundOpinions.biz.ext"  idField="id" allowResize="true"
			    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
			    <div property="columns">
			    	<div type="indexcolumn" headerAlign="center" width="30" >编号</div>
			        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
			        <div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
			        <div field="auditstatus" renderer="onbackRenderer" width="80" align="center" headerAlign="center">处理结果</div>
			        <div field="auditopinion" width="150" headerAlign="center">处理意见</div>
			        <div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
			        <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
			    </div>
			</div>
		</fieldset>
		<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
			<legend>背景调查审核结果</legend>
			<div style="padding:5px;">
	            <table style="table-layout:fixed;">
	            	<tr id="salesEdit">
	                    <td style="width:150px;" align="right">审核结果：</td>
	                    <td style="width:250px;">  
							<input id="auditstatus1" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"/>
						</td>
	                </tr>
	            </table>
	        </div>
		</fieldset>
		<fieldset id="omIntendJoinfield" style="border:solid 1px #aaa;padding:3px;">
			<legend>拟入职信息</legend>
			<input name="omIntendJoin.intendid" id="intendid" class="nui-hidden"/>
			<input name="omIntendJoin.intendstatus" id="intendstatus" class="nui-hidden"/>
			<table>
				<tr>
					<td align="right" style="width:120px;">拟入职日期：</td>
					<td align="left">
						<input name="omIntendJoin.interdate" id="interdate" class="nui-datepicker" required="false" style="width: 150px;"/>
					</td>
					 <td align="right" style="width:120px;" >招聘渠道：</td>
	        		<td align="left">    
	            		<input name="resume.recruitway" id="recruitway" class="nui-dictcombobox" shownullItem="true" dictTypeId="RECRUIT_WAY" required="false"  onvaluechanged="changerecruitway()" style="width:170px;"/>
	        		</td>
	                <!--根据招聘渠道类型切换招聘渠道说明的控件-->
	        		<td align="right" style="width:120px;" id="zpqdsm1" >招聘渠道说明：</td>
	        		<td align="left" id="zpqdsm"></td>
	    		</tr>
        		<tr>
					<td align="right" style="width:120px;">招聘专员：</td>
					<td align="left">   
	                    <input id="intendrecempname" class="mini-textboxlist"  name="omIntendJoin.intendrecempname" searchField="name"
							url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
							textField="empname" valueField="userid" required="false" onvaluechanged="changeAgent"/>
                    </td>
        		</tr>
			</table>
		</fieldset>
	</form>
	<jsp:include page="/ame_common/misOpinion.jsp"/>
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
            		document.getElementById("intendnum").innerHTML = o.omRecruit.intendnum == null ?"":o.omRecruit.intendnum;
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
            		
            		var labelname='';
            		for(var i=0;i<o.resume.label.length;i++){
            			if (labelname==''){
            				labelname = o.resume.label[i].ameLabel.labelcontent;
            			}else{
            				labelname = labelname + ','+ o.resume.label[i].ameLabel.labelcontent;
            			}
            		}
            		document.getElementById("labelid").innerHTML = labelname;
            		
            		//简历附件信息
            		nui.get("grid_0").load({"groupid":"AmeInterviewBackCheck","relationid":o.recommend.processinstid});
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
            		
            		
            		grid_interview.load({"criteria": {"_expr[0]": { "ameResume.resumeid": o.resume.resumeid},"_expr[1]": { "omRecruit.recruitid": o.omRecruit.recruitid}}});
					grid_interview.sortBy("interviewroundes", "asc");
					
            		//审批意见的流程实例ID
					nui.get("processinstid").setValue(o.recommend.processinstid);
					//流程回退路径赋值 
                	nui.get("backTo").setData(o.recommend.backList);
               		//审核结果设置
					var dataStatus = [{"dictID": 4,"dictName": "处理"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
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
               		
               		var dataStatus1 = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "不通过"}];
					nui.get("auditstatus1").setData(dataStatus1);
               		
               		nui.get("backCheckGrid").load({"processinstid": processinstid});
               		changerecruitway();
               		nui.get("recruitwayexp").setValue(o.resume.recruitwayexp);
               		
               		if(o.omIntendJoin.intendrecempname == null || o.omIntendJoin.intendrecempname == ''){
               		}else{
               			nui.get("intendrecempname").setValue(o.omIntendJoin.intendrecempname);
               			nui.get("intendrecempname").setText(o.omIntendJoin.intendrecempnamename);
               		}
            	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
		});
  	}
  	
  	function onOk(){
  		var auditstatus = nui.get("auditstatus").getValue();
  		var filePaths = document.getElementsByName("uploadfile").length;
    	for(var j=0;j<filePaths;j++){
    		var a=document.getElementsByName("remarkList")[j].value;
    		if(a==null||a==""){
    			nui.alert("背景调查新增附件不可以为空！");
    			return false;
    		}
    	}
    	
		if(!form_recruit.validate() && auditstatus!="2" && auditstatus!="0"){
			nui.alert("信息录入不完整!");
			return;
		}else{
    		SaveData();
		}
  	}
  	//保存
	function SaveData(){
		var json = form_recruit.getData();
		
		var auditstatus1 = nui.get("auditstatus1").getValue();
		
		if (auditstatus1 == '1'){
			json.resume.interviewstatus ='6';
			json.omRecruit.intendnum = 1+parseInt(document.getElementById("intendnum").innerHTML==null || document.getElementById("intendnum").innerHTML == ''?0:document.getElementById("intendnum").innerHTML);
		}else if(auditstatus1 == '0'){
			json.resume.interviewstatus ='11';
			json.omIntendJoin.intendstatus = '3';
		}
		
		json.omIntendJoin.recruitway =json.resume.recruitway;
		json.omIntendJoin.recruitwayexp =json.resume.recruitwayexp;
		
		json.recommend.candidatestatus = json.resume.interviewstatus;//状态一致;
		
		//审批意见
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		
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
	    					nui.alert("提交流程任务处理失败！","系统提示",function (){
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
	
	function changenextInterview(){
		var nextInterview = nui.get("offerInend").getValue();
		if(nextInterview == '2' || nextInterview == '3'){
			document.getElementById("endlabel").style.display="";
			document.getElementById("endlabel1").style.display="";
			
			document.getElementById("showbackgroundCheck").style.display="none";
			nui.get("backgroundCheck").setValue('0');
		}else{
			document.getElementById("endlabel").style.display="none";
			document.getElementById("endlabel1").style.display="none";
			
			document.getElementById("showbackgroundCheck").style.display="";
			nui.get("backgroundCheck").setValue(null);
		}
		
		
	}
	
	var editor2 = null;
	KindEditor.ready(function(K) {
		editor2 = K.create('textarea[name="content2"]', {
		cssPath : '/default/common/nui/resource/kindeditor/plugins/code/prettify.css',
		uploadJson : '/default/common/nui/resource/kindeditor/jsp/upload_json.jsp',
		fileManagerJson : '/default/common/nui/resource/kindeditor/jsp/file_manager_json.jsp',
		allowFileManager : true,
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
		},
		afterChange : function() {
		    $('.word_count2').html(this.count()); //字数统计包含HTML代码
		    var a = this.count();
		    var a1 = this.count('text');
		    var limitNum = 2048;  //设定限制字数
		    var pattern = "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+limitNum+"</span>字。（字数统计包含纯文本、HTML代码）"; 
		    $('.word_surplus2').html(pattern); //输入显示
		    if(a > limitNum) {
			    pattern = ('字数超过限制，请适当删除部分内容');
			    //超过字数限制自动截取
			    var strValue = editor1.text();
			    strValue = strValue.substring(0,limitNum);
			    editor1.text(strValue);      
		    } else {
		      	//计算剩余字数
		      	var result = limitNum - this.count(); 
		      	pattern = "您当前输入了<span style='color:red'>"+a1+"</span>个文字（<span style='color:red'>"+a+"</span>个字符），大约还可以输入<span style='color:red'>"+result+"</span>字。（字数统计包含纯文本、HTML代码）"; 
	      	}
	      	$('.word_surplus2').html(pattern); //输入显示
		} 
		});
		prettyPrint();
	});
	
	
	function getfeedbackstatus(e){
		return nui.getDictText('AME_FEEDBACK_STATUS',e.value);//设置业务字典值
	}
	function getinterviewstatus(e){
		return nui.getDictText('INTERVIEW_STATUS',e.value);//设置业务字典值
	}
	function getposition(e){
		return nui.getDictText('INTERVIEWER_ROLE',e.value);//设置业务字典值
	}
	
	function addRow(gridId) {
		var grid = nui.get(gridId);
		var datas =  grid.getData();
		var length = datas.length;     
		var newRow = { name: "New Row" };
		grid.addRow(newRow, length);
		grid.beginEditCell(newRow, "beginEditCell");
	}
	
	function removeRow(gridId) {
		var grid = nui.get(gridId);
		var rows = grid.getSelecteds();
		if (rows.length > 0) {
			grid.removeRows(rows, true);                
		}
	}
	
	function moveRowUp(gridId){
		var grid = nui.get(gridId);
		var rows = grid.getSelecteds();
		grid.moveUp(rows);
	}
	
	function moveRowDown(gridId){
		var grid = nui.get(gridId);
		var rows = grid.getSelecteds();
		grid.moveDown(rows);
	}
	
	//保存审批层级数据
	function saveApprovalChains() {
		datagridApproval.loading("数据保存中……");
		var changeData = setApprovalLevel();
		var processinstid = nui.get("processinstid").getValue();
		var json = nui.encode({"approvalChains":changeData,"processinstid":processinstid});
		nui.ajax({
			url: "org.gocom.abframe.org.recruitApproval.recruitApproval.saveApprovalChains.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
	        success: function (o) {
	        	datagridApproval.unmask();
	        	datagridApproval.reload();
		    	if(o.retValue == 'success'){
		    		nui.alert("审批层级保存成功！","保存提示");
		    	}else{
		    		nui.alert("审批层级保存失败！","保存提示");
		    	}
		    }
		});         
	}
	
	function onbackRenderer(e){
		var auditstatus1 = e.value;
		if(auditstatus1 == '1'){
			return "通过";
		}else{
			return "不通过";
		}
	}
	
	function changerecruitway(){ 
         var wayvalue = nui.get(id="recruitway").getValue();
         if(wayvalue == '1' || wayvalue == '6'){
            document.getElementById("zpqdsm").innerHTML =  '<input name="resume.recruitwayexp" id="recruitwayexp" class="nui-dictcombobox" shownullItem="true" dictTypeId="RECRUIT_WAYEXP" required="false" allowInput="true"  style="width: 150px;"/>';
         }  
         if(wayvalue == '2' || wayvalue == '3' || wayvalue == '4' || wayvalue == '5' || wayvalue == '7'){
            document.getElementById("zpqdsm").innerHTML =  '<input name="resume.recruitwayexp" id="recruitwayexp" class="nui-textbox"  required="false"  style="width: 150px;"/>';
         } 
         nui.parse();
	}
</script>
</html>