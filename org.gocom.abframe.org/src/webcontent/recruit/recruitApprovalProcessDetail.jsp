<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<%String contextPath=request.getContextPath();%>
<html>
<!-- 
  - Author(s): JYW
  - Date: 2019-11-26 22:16:16
  - Description:
-->
<head>
<title>招聘需求审批流程业务信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%=contextPath%>/common/nui/nui.js" type="text/javascript"></script>
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
	<script charset="utf-8" src="<%=contextPath%>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>
	<style type="text/css">
	     body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit" style="border:solid 0px #aaa;padding:0px;width:auto">
	<div class="mini-panel" title="招聘需求审批流程业务信息" style="width: 100%">
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<div id="form1" >
			<fieldset id="field1" style="border:solid 1px #aaa;">
				<legend>招聘需求业务信息</legend>
				<input name="omRecruit.recruitid" id="recruitid" class="nui-hidden"/>
				<input name="omRecruit.fileids" id="fileids1" class="nui-hidden" />
				<input name="omRecruit.processinstid" id="processinstid" class="nui-hidden" />
				<div style="padding:5px;">
					<table style="width:100%;">
						<tr>
		                	<td align="right" style="width:95px;">招聘职位分类：</td>
							<td align="left"  style="width:150px;" id="omRecruit.recposition" class = "asLabel"></td>
							<td align="right" style="width:95px;">招聘职位名称：</td>
							<td align="left"  style="width:150px;" id="omRecruit.recpositionname" class = "asLabel"></td>
		                	<td align="right" style="width:95px;">岗位级别：</td>
		                	<td align="left"  style="width:150px;" id="omRecruit.joblevel" class = "asLabel"></td>
							<td align="right" style="width:85px;">招聘人数：</td>
							<td align="left" style="width: 150px;" id="omRecruit.recnum" class = "asLabel"></td>
						</tr>
						<tr>
							<td align="right">工作地点：</td>
		                	<td align="left" id="omRecruit.workplace" class = "asLabel"></td>
							<td align="right">优先级别：</td>
							<td align="left"  id="omRecruit.priority" class = "asLabel"></td>
							<td align="right">期望入职日期：</td>
							<td align="left"  id="omRecruit.hopedate" class = "asLabel"></td>
							<td align="right">是否采用猎头：</td>
							<td align="left"  id="omRecruit.isheadhunting" class = "asLabel"></td>
						</tr>
						<tr>
							<td align="right">员工属性：</td>
		                	<td align="left"  id="omRecruit.position" class = "asLabel"></td>
		                	<td align="right">人员性质：</td>
							<td align="left"  id="omRecruit.jobtype" class = "asLabel"></td>
							<td align="right">招聘部门：</td>
							<td align="left"  id="omRecruit.orgid" class = "asLabel"></td>
							<td align="right">申请人：</td>
							<td align="left"  id="omRecruit.applyuserid" class = "asLabel"></td>
						</tr>
						<tr>
							<td align="right">招聘需求编号：</td>
		                	<td align="left" id="omRecruit.recruitno" class = "asLabel"></td>
		                	<td align="right">提出时间：</td>
							<td align="left"  id="omRecruit.propdate" class = "asLabel"></td>
							<!-- <td align="right">招聘状态：</td>
							<td align="left"  id="omRecruit.status" class = "asLabel"></td> -->
							<td align="right">招聘专员：</td>
							<td align="left"  id="omRecruit.recuserid" class = "asLabel"></td>
							<td align="right">主考官：</td>
							<td align="left"  id="omRecruit.interviewer" class = "asLabel"></td>
						</tr>
						<tr>
							<td align="right" >工作职责描述：</td>
		                	<td colspan="7" id="omRecruit.workduties" class = "asLabel"></td>
						</tr>
						<tr>
							<td align="right">岗位要求描述：</td>
		                	<td colspan="7" id="omRecruit.recdesc" class = "asLabel"></td>
						</tr>
						<tr>
		                	<td align="right">需求背景：</td>
		                	<td colspan="7" id="omRecruit.recbackground" class = "asLabel"></td>
						</tr>
						<tr>
							<td align="right">其他说明：</td>
		                	<td colspan="7" id="omRecruit.remark" class = "asLabel"></td>
						</tr>
					</table>
				</div>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;">
				<legend>招聘需求岗位面试轮次安排计划</legend>
			    <div id="datagridInterview" class="nui-datagrid" style="width:100%;height:auto;" 
			        url="org.gocom.abframe.org.recruitApproval.recruitApproval.getInterviewSchedule.biz.ext" idField="id" dataField="recInterSchds"
			        allowCellEdit="true" allowCellSelect="true" multiSelect="true" 
			        editNextOnEnterKey="true"  editNextRowCell="true" allowAlternating ="true" showLoading="true" showPager="false">
			        <div property="columns">
			         	<div type="checkcolumn"></div>
			            <div headerAlign="center" field="interviewRound" type="indexcolumn">面试轮次</div>
			            <div headerAlign="center" field="interviewroundes" visible="false" readOnly="true">面试轮次</div>
			            <div name="beginEditCell" displayField="interviewername" field="interviewer" headerAlign="center" width="150" >面试官</div>
			            <div field="interviewerrole" width="120" headerAlign="center" renderer="getRole">面试官角色</div>
			        </div>
			    </div>
			</fieldset>
		</div>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	<%Long processInstID = Long.parseLong(request.getParameter("processInstID")); %>
	var form = new nui.Form("#form1");
	var opioionform = new nui.Form("opioionform");//审批意见
	var datagridInterview = nui.get("datagridInterview");
	initData();
	function initData(){
		form.mask("数据加载中...");
  		var json = nui.encode({"processInstID": <%=processInstID %>});
  		nui.ajax({//获取资产采购申请信息
      		url: "org.gocom.abframe.org.recruitApproval.recruitApproval.queryRecruitFlowData.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			form.unmask();
       	  		form.setData(o);
       	  		var omRecruit = o.omRecruit;
            	document.getElementById("omRecruit.recruitno").innerHTML = omRecruit.recruitno == null ?"":omRecruit.recruitno;
	            document.getElementById("omRecruit.orgid").innerHTML = omRecruit.orgname == null ?"":omRecruit.orgname;
	            document.getElementById("omRecruit.recposition").innerHTML = omRecruit.recposition == null ?"":omRecruit.recposition;
	            document.getElementById("omRecruit.recpositionname").innerHTML = omRecruit.recpositionname == null ?"":omRecruit.recpositionname;
	            document.getElementById("omRecruit.jobtype").innerHTML = omRecruit.jobtype == null ?"":nui.getDictText('AME_EMPTYPE2',omRecruit.jobtype);
	            document.getElementById("omRecruit.position").innerHTML = omRecruit.position == null ?"":nui.getDictText('EMP_TYPE',omRecruit.position);
	            document.getElementById("omRecruit.priority").innerHTML = omRecruit.priority == null ?"":nui.getDictText('MIS_EMERLEVEL',omRecruit.priority);
	            document.getElementById("omRecruit.interviewer").innerHTML = omRecruit.intername == null ?"":omRecruit.intername;
	            document.getElementById("omRecruit.applyuserid").innerHTML = omRecruit.applyname == null ?"":omRecruit.applyname;
	            document.getElementById("omRecruit.workduties").innerHTML = omRecruit.workduties == null ?"":omRecruit.workduties;
	            document.getElementById("omRecruit.recdesc").innerHTML = omRecruit.recdesc == null ?"":omRecruit.recdesc;
	            document.getElementById("omRecruit.workplace").innerHTML = omRecruit.workplace == null ?"":nui.getDictText('AREA4CLRY',omRecruit.workplace);
	            document.getElementById("omRecruit.recnum").innerHTML = omRecruit.recnum == null ?"":omRecruit.recnum+'&nbsp人';
	            document.getElementById("omRecruit.isheadhunting").innerHTML = omRecruit.isheadhunting == null ?"":nui.getDictText('MIS_YN',omRecruit.isheadhunting);
	            document.getElementById("omRecruit.propdate").innerHTML = omRecruit.propdate == null ?"":omRecruit.propdate;
	            //document.getElementById("omRecruit.status").innerHTML = omRecruit.status == null ?"":nui.getDictText('RECRUIT_STATUS',omRecruit.status);
	            document.getElementById("omRecruit.hopedate").innerHTML = omRecruit.hopedate == null ?"":omRecruit.hopedate;
	            document.getElementById("omRecruit.recuserid").innerHTML = omRecruit.recusername == null ?"":omRecruit.recusername;
	            document.getElementById("omRecruit.recbackground").innerHTML = omRecruit.recbackground == null ?"":omRecruit.recbackground;
	            document.getElementById("omRecruit.remark").innerHTML = omRecruit.remark == null ?"":omRecruit.remark;
	            document.getElementById("omRecruit.joblevel").innerHTML = omRecruit.joblevel == null ?"":nui.getDictText('AME_TECH',omRecruit.joblevel);
                form.setChanged(false);
                //加载面试安排数据
                datagridInterview.load({"recruitid":omRecruit.recruitid});
                datagridInterview.sortBy("interviewroundes", "asc");
  				var processInstID = omRecruit.processinstid;
  				//加载附件
  				var fileGrid = nui.get("grid_0");
				fileGrid.load({"groupid":"omRecruitApproval","relationid":omRecruit.recruitid});
  				//查询审核意见
				var approvGrid = nui.get("datagrid1");
				approvGrid.load({processInstID: processInstID});
				approvGrid.sortBy("time", "desc");
				document.getElementById("opinionHide").style.display="none";
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}
	//面试官角色
	function getRole(e){
		return nui.getDictText('INTERVIEWER_ROLE',e.value);
	}
</script>
</html>