<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String contextPath=request.getContextPath(); %>
<title>新员工个人信息填写</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<script src="<%=contextPath%>/common/nui/nui.js" type="text/javascript"></script>
<script src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js" type="text/javascript"></script>
<style type="text/css">
	body {
		margin: 0;
		padding: 0;
		width: 100%;
		height: 100%;
		overflow: hidden;
	}
	.mini-textbox-border {
	    padding-left: 0px !important;
	}
</style>
</head>
<!-- 从上个页面获取传的参数 -->
<body>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk('0')" iconCls="icon-save" id="oktemp" style="width:90px;margin-right:16px;">暂时保存</a>
	    <a class="nui-button" onclick="onOk('1')" id="okbutton" iconCls="icon-ok" style="width:90px;margin-right:50px;">确认提交</a>
	</div> 
</body>
<script type="text/javascript">
	nui.parse();
	initData();
	function initData(){
		var json = nui.encode({"recInterSchd":{
		recruitid:'3454',
		interviewroundes:'1',
		interviewer:'jiaoyw',
		interviewerrole:'2'
		}});
		nui.ajax({
			url: "org.gocom.abframe.org.recruitApproval.recruitApproval.test.biz.ext",
			data: json,
			type: 'POST',
			cache: false,
			contentType: 'text/json',
			success: function(text){
			},
			error: function(jqXHR, textStatus, errorThrown){
				nui.alert(jqXHR.responseText);
			}
		});
	}
	/* function initData(){
		var json = nui.encode({"processInstID":"663"});
		nui.ajax({
			url: "org.gocom.abframe.org.intendstaff.addIntendStaffInfo.sendEamilToPrivateEmail.biz.ext",
			data: json,
			type: 'POST',
			cache: false,
			contentType: 'text/json',
			success: function(text){
			},
			error: function(jqXHR, textStatus, errorThrown){
				nui.alert(jqXHR.responseText);
			}
		});
	} */
</script>
</html>