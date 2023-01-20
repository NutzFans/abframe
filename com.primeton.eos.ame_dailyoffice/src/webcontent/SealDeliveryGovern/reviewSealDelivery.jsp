<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	long workItemID=(Long)request.getAttribute("workItemID"); 
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zhengquan
  - Date: 2019-03-14 11:07:05
  - Description:
-->
<head>
<title>审批印章申请流程</title>
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/ame_dailyoffice/SealDeliveryGovern/js/reviewSealDelivery.js"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<div class="mini-panel" title="武大吉奥印章外借审批单" style="width: auto">
	<!-- 提示信息展示 -->
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<div class="nui-toolbar">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>武大吉奥印章外借审批单</legend>
				<form id="yzwjForm">
					<!--隐藏域-->
					<input name="yzwj.ywid" class="nui-hidden" />
					<input name="yzwj.yzwjid" class="nui-hidden"/>
					<input name="yzwj.processinstid" class="nui-hidden"/>
					<input name="yzwj.fileids" id="fileids"  class="nui-hidden"/>
					<input name="purstatus" class="nui-hidden"/>
					<div style="padding:5px;">
						<table style="table-layout:fixed;" id="table_file">
							<tr>
								<td align="right" style="width:120px;">单号：</td>
								<td style="width:150px;"><input name="yzwj.dh" allowInput="false" class="nui-textbox" style="width:100%" /></td>
								<td align="right" style="width:120px">经办人：</td>
								<td style="width:150px;"><input name="yzwj.username" allowInput="false" class="nui-textbox" style="width:100%" />
														 <input name="yzwj.userid" class="nui-hidden" /></td>
							</tr>
							<tr>
								<td align="right" style="width:120px;">外借部门：</td>
								<td style="width:150px;"><input name="yzwj.orgname" allowInput="false" class="nui-textbox" style="width:100%" />
														 <input name="yzwj.orgid" class="nui-hidden" /></td>
								<td align="right" style="width:120px">同行证明人：</td>
								<td style="width:150px;"><input name="yzwj.txzmr" class="nui-textbox" style="width:100%" /></td>
							</tr>
							<tr>
								<td align="right" style="width:120px;">印章外借日期：</td>
									<td style="width:150px;"><input name="yzwj.yzwjrq" class="nui-datepicker" required="true" requiredErrorText="印章外借日期不能为空！" style="width:100%" />
		               			</td>	
								<td align="right" style="width:120px;">印章归还日期：</td>
								<td style="width:150px;"><input name="yzwj.yzghsj" class="nui-datepicker" required="true" requiredErrorText="印章归还日期不能为空！"  style="width:100%" /></td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">外借章类型：</td>
								<td colspan="4" class = "asLabel">
									<div name="yzwj.yzlx" id="yzlx" class="mini-checkboxlist" repeatItems="4" repeatLayout="table" textField="text" valueField="id">
  									</div>
  									<div>
  										<input class="nui-checkbox" text="其他章" name="yzwj.qtz" onvaluechanged="yzlxchange(this)">
  										<input name="yzwj.qtzmc" class="nui-textbox" required="true" requiredErrorText="其他章名称不能为空！" style="display:none">
  									</div>
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">外借事由：</td>
								<td colspan="5" class = "asLabel"><input name="yzwj.wjsy" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%" /></td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">备注：</td>
								<td colspan="5" class = "asLabel"><input name="yzwj.bz" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%" /></td>
							</tr>
						</table>
					</div>
				</form>
				<jsp:include page="/ame_common/detailAndDelFile.jsp"/>
				<jsp:include page="/ame_common/addFiles.jsp"/>
				</fieldset>
				<form id="opioionform" method="post">
				<input name="misOpinion.auditstatus" value="1" class="nui-hidden" />
				<input name="misOpinion.processinstid" id="processinstid" class="nui-hidden" />
			    <input name="misOpinion.processinstname" id="processinstname" class="nui-hidden" />
			    <input name="misOpinion.activitydefid" id="activitydefid" class="nui-hidden" />
			    <input name="misOpinion.workitemid" id="workitemid" class="nui-hidden" />
			    <input name="misOpinion.workitemname" id="workitemname" class="nui-hidden" />
		        <input name="misOpinion.fileids" id="fileids1"  class="nui-hidden"/>
		         <input name="misOpinion.isshow" id="isshow" class="nui-hidden" />
		        <fieldset style="border:solid 1px #aaa;padding:3px;">
	        <legend>处理意见列表</legend>
	        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
				    url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext"  idField="id" allowResize="true" allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
				    <div property="columns">
				    	<div type="indexcolumn" headerAlign="center" width="30" >编号</div>
				        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
				        <div field="workitemname" width="90" align="center" headerAlign="center" >处理环节</div>
				        <div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center" >处理结果</div>
				        <div field="auditopinion" width="160" headerAlign="center">处理意见</div>
				        <div field="time" width="90" headerAlign="center" allowSort="true" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
				        <div field="orgname" width="90" align="center" headerAlign="center">处理人所在机构</div>
				    </div>
				</div>
	        <div style="padding:5px;" id="opinionHide">
	            <table style="table-layout:fixed;">
	            	<tr>
	                    <td style="width:150px;" align="right">审核结果：</td>
	                    <td style="width:250px;">  
							<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="showBackTo()" />
	                    </td>
	                </tr>
	                <tr id="choosehide" style="display: none">
	                    <td  style="width:150px;" align="right">回退到：</td> 
	                    <td style="width:140px;">
	                    	<input name="misOpinion.backTo" id="backTo" class="nui-combobox" valueField="id" textField="name" style="width:200px" required="true"/>
	                    </td>
	                </tr>
	                <tr>
	                    <td style="width:150px;" align="right">处理意见：</td>
	                    <td colspan="3">
	                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height:60px;"/>
	                    </td>
	                </tr>
	            </table>
	        </div>
	    </fieldset>
	    	</form>
				</div>
		</div>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk('1')" name="createSealUse" style="width:80px;margin-right:20px;">审批</a>
		<!--		<a class="nui-button" onclick="onOk('0')" name="saveSealUse"style="width:80px;margin-right:20px;">暂时保存</a>-->
		<a class="nui-button" onclick="onCancel('cancel')" id="closeWin" style="width:60px;">关闭</a>
	</div>
<script type="text/javascript">
    nui.parse();
    var workitemid='<%=workItemID %>';
    var contextPath = '<%=contextPath %>';
    var form = new nui.Form("yzwjForm");
	var opioionform = new nui.Form("opioionform");
	init();  
</script>
</body>
</html>