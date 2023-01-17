<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	UserObject user = (UserObject) session.getAttribute("userObject");
	String username = user.getUserName();
	String userid = user.getUserId();
	String orgid = user.getUserOrgId();
	String orgname= user.getUserOrgName();
	String contextPath=request.getContextPath();
 %>
<html>
<!--
  - Author(s): wusiru
  - Date: 2017-08-14 11:15:47
  - Description:
-->
<head>
<title>会议日程</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

    <!-- 引入表单框架jsp -->
	<%@include file="/common/common.jsp"%>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= contextPath %>/common/nui/nui.js" type="text/javascript"></script>

	<link rel="stylesheet" href="<%=contextPath %>/ame_dailyoffice/SealGovern/hygl/hysq/hysp.css" type="text/css">
    <script src="<%=contextPath %>/ame_dailyoffice/SealGovern/hygl/hysq/hysp.js" type="text/javascript"></script>
	<script src="<%=contextPath %>/ame_dailyoffice/SealGovern/hygl/hysq/selectCh.js" type="text/javascript"></script>
</head>
<body>
<div class="nui-fit">
	<div class="mini-panel" title="武大吉奥公司会议申请单" style="width: auto">
	<!-- 提示信息展示 -->
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<div class="nui-toolbar">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>武大吉奥公司会议申请单</legend>
				<form id="hysqSealUse">
					<!--隐藏域-->
					<!-- hidden域 -->
					<input class="nui-hidden" name="hysq.hysqid" /> <!-- 会议申请id -->
					<input class="nui-hidden" name="hysq.fqrid" />  <!-- 发起人id -->
					<input class="nui-hidden" name="hysq.hysid" /> <!-- 会议室id -->
					<input class="nui-hidden" name="hysq.tzfs" /><!-- 通知方式 -->
					<input class="nui-hidden" name="hysq.processinstid" />
					<input class="nui-hidden" name="hysq.spzt" /> <!-- 审批状态 -->
					<input class="nui-hidden" name="hysq.fqrjgid" /> <!-- 发起人机构id -->
					<input class="nui-hidden" name="hysq.hycys[0].hycyid" /> <!-- 会议参与id -->
					<input class="nui-hidden" name="hysq.hycys[0].cyzid" /> <!-- 参会人员id -->
					<input class="nui-hidden" name="hysq.zcrid" /> <!-- 主持人id -->
					
					<!-- zhangyuan 2018-4-9  新增会议申请时间input域 -->
					<input class="nui-hidden" name="hysq.hysqsj" />
					<input name="purstatus" class="nui-hidden"/>
					
					<div style="padding:5px;">
						<table style="table-layout:fixed;" id="table_file">
							<tr>
								<td align="right" style="width:120px;">会议主题：</td>
								<td style="width:150px;"  colspan="5">
									<input required="true" requiredErrorText="会议主题不能为空" class="nui-textbox" name="hysq.hyzt" 
										    	vtype="maxLength:300" maxLengthErrorText="会议主题不允许超过300字">
								</td>
							</tr>
							<tr>
								<td align="right" style="width:120px;">会议日期：</td>
								<td style="width:150px;">
									<input class="nui-datepicker" ondrawdate="onDrawDate" required="true" onfocus="this.blur()" name="hysq.hyrq" onvaluechanged="validHySj()">
								</td>
								<td align="right" style="width:120px">起止时间：</td>
								<td style="width:150px;">
									<input style="width: 45%;float: left;" class="nui-timespinner" format="H:mm" name="hysq.hykssj" required="true" requiredErrorText="会议开始时间不能为空" onvalidation="validTime(e)"/>-
									<input style="width: 45%;float: right;" class="nui-timespinner" format="H:mm" name="hysq.hyjssj" required="true" requiredErrorText="会议结束时间不能为空" onvalidation="validJsTime(e)"/>
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">会议类型：</td>
								<td class = "asLabel">
									<input style="width:100%;" class="nui-dictcombobox" value="TWH" name="hysq.hylx" dictTypeId="HYGL_HYSQ_HYLX" />
								</td>
								<td align="right" style="width:120px">会议室：</td>
								<td style="width:150px;">
									<input class="nui-textbox" name="hysq.hysmc" 
										 required="true"
										 requiredErrorText="会议室不能为空" > 
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">主持人：</td>
								<td colspan="5" class = "asLabel">
									<input class="nui-buttonedit" required="true" name="hysq.zcrmc" onbuttonclick="selectOmEmployee" allowInput="false">
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">参会人员：</td>
								<td colspan="5" class = "asLabel">
									<input class="nui-buttonedit" required="true" name="hysq.hycys[0].cyzmc" onbuttonclick="selectOmEmployee_project" allowInput="false">
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">外部人员：</td>
								<td colspan="5" class = "asLabel">
									<input class="nui-textbox" name="hysq.wbry" maxlength = "100">
								</td>
							</tr>
							<!-- <tr>	
								<td align="right" style="width:120px">参会人数：</td>
								<td colspan="5" class = "asLabel">
									<input class="nui-textbox" name="hysq.chrs" vtype = "int" intErrorText="请输入整数">
								</td>
							</tr> -->
							<tr>	
								<td align="right" style="width:120px">会议准备说明：</td>
								<td colspan="5" class = "asLabel">
									<input class="nui-textarea height100" name="hysq.hyzbsm" allowInput="false" maxlength = "1300"/>
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">发起人：</td>
								<td class = "asLabel">
									<input class="nui-textbox" name="hysq.fqrmc" id="hysq.fqrmc" allowInput="false">
								</td>
								<td align="right" style="width:120px">发起人部门：</td>
								<td style="width:150px;">
									<input class="nui-textbox" name="hysq.fqrjgmc" id="hysq.fqrmc" allowInput="false">
								</td>
							</tr>
								
						</table>
					</div>
				</form>
				</fieldset>				
				</div>
		</div>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk('1')" name="createSealUse" style="width:80px;margin-right:20px;">提交</a>
		<!-- <a class="nui-button" onclick="onOk('0')" name="saveSealUse"style="width:80px;margin-right:20px;">暂时保存</a> -->
	</div>
<script type="text/javascript">
    nui.parse();
    var userid='<%=userid %>';
    var username='<%=username %>';
    var orgid='<%=orgid %>';
    var orgname='<%=orgname %>';
    var contextPath = '<%=contextPath %>'
    var form = new nui.Form("hysqSealUse");  
    var hysqid='<%=request.getParameter("hysqid") %>';
    var processInstId='<%=request.getParameter("processInstID") %>';
    var workItemID='<%=request.getParameter("workItemID") %>';
</script>
</body>
</html>