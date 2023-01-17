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
  - Author(s): zhengquan
  - Date: 2019-02-27 14:19:39
  - Description:
-->
<head>
<title>创建用章流程</title>
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/ame_dailyoffice/SealGovern/js/createSealUse.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<div class="mini-panel" title="武大吉奥公司印章使用审批单" style="width: auto">
	<!-- 提示信息展示 -->
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<div class="nui-toolbar">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>武大吉奥公司印章使用审批单</legend>
				<form id="yzglSealUse">
					<!--隐藏域-->
					<input name="yzgl.ywid" class="nui-hidden" />
					<input name="yzgl.fileids" id="fileids"  class="nui-hidden"/>
					<input name="yzgl.yzglid" class="nui-hidden"/>
					<input name="purstatus" class="nui-hidden"/>
					<div style="padding:5px;">
						<table style="table-layout:fixed;" id="table_file">
							<tr>
								<td align="right" style="width:120px;">单号：</td>
								<td style="width:150px;"><input name="yzgl.dh" allowInput="false" class="nui-textbox" style="width:100%" /></td>
								<td align="right" style="width:120px;">印章申请日期：</td>
								<td style="width:150px;">
	                    			<input name="yzgl.yzsqrq" class="nui-datepicker"  style="width:100%" />
	               				</td>	
							</tr>
							<tr>
								<td align="right" style="width:120px;">用印部门：</td>
								<td style="width:150px;"><input name="yzgl.orgname" allowInput="false" class="nui-textbox" style="width:100%" />
														 <input name="yzgl.orgid" class="nui-hidden" /></td>
								<td align="right" style="width:120px">经办人：</td>
								<td style="width:150px;"><input name="yzgl.username" allowInput="false" class="nui-textbox" style="width:100%" />
														 <input name="yzgl.userid" class="nui-hidden" /></td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">用章类型：</td>
								<td colspan="4" class = "asLabel">
									<div name="yzgl.yzlx" id="yzlx" class="mini-checkboxlist" repeatItems="4" repeatLayout="table" textField="text" valueField="id">
  									</div>
  									<div>
  										<input class="nui-checkbox" text="其他章" name="yzgl.qtz" onvaluechanged="yzlxchange(this)">
  										<input name="yzgl.qtzmc" class="nui-textbox" required="true" requiredErrorText="其他章名称不能为空！"  style="display:none">
  									</div>
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">用印事由及文件名称：</td>
								<td colspan="5" class = "asLabel"><input name="yzgl.yysyyjwjmc" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%" required="true" requiredErrorText="用印事由及文件名称不能为空！" /></td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">备注：</td>
								<td colspan="5" class = "asLabel"><input name="yzgl.bz" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%" /></td>
							</tr>
						</table>
					</div>
				</form>
				<span>请上传印章清单附件(电子版)!</span>
				<jsp:include page="/ame_common/addFiles.jsp"/>
				</fieldset>
				<form id="opioionform" method="post">
		        <div style="padding:5px;" id="opinionHide">
		            <table style="table-layout:fixed;">
		            	<tr name="salesEdit" style="display:none">
		                    <td style="width:150px;" align="right">审核结果：</td>
		                    <td style="width:250px;">  
								<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS" />
		                    </td>
		                </tr>
		                <tr name="rwclsm">
		                    <td style="width:150px;height:auto;" align="right">任务处理说明：</td>
		                    <td colspan="3">
		                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height:60px;"/>
		                    </td>
		                </tr>
			            <tr id="checkbd">
		                    <td style="width:150px;" align="right">事业部领导：</td>
							<td  style="width:410px;" colspan="3">
								<input id="checkerid" name="misOpinion.checkerid" class="nui-dictcombobox" dictTypeId="YZGL_BMSPHJRY"/>
<!-- 								<input id="checkername" name="misOpinion.checkername" class="nui-textbox" allowInput="false"/> -->
<!-- 								<input id="checkerid" name="misOpinion.checkerid" class="nui-hidden"/> -->
							</td>
		                </tr>
		            </table>
		        </div>
	    	</form>
				</div>
		</div>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk('1')" name="createSealUse" style="width:80px;margin-right:20px;">发起流程</a>
		<a class="nui-button" onclick="onOk('0')" name="saveSealUse"style="width:80px;margin-right:20px;">暂时保存</a>
	</div>
<script type="text/javascript">
    nui.parse();
    var userid='<%=userid %>';
    var username='<%=username %>';
    var contextPath = '<%=contextPath %>'
    var form = new nui.Form("yzglSealUse");
    var opioionform = new nui.Form("opioionform");
	init();
	
</script>
</body>
</html>