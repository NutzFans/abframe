<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zhengquan
  - Date: 2019-03-20 09:50:31
  - Description:
-->
<head>
<title>印章外借详情</title>
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .mini-grid-rows-view {
	    	height: auto !important;
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
					<input id="fileids"  class="nui-hidden"/>
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
									<td style="width:150px;"><input name="yzwj.yzwjrq" class="nui-datepicker"  style="width:100%" />
		               			</td>	
								<td align="right" style="width:120px;">印章归还日期：</td>
								<td style="width:150px;"><input name="yzwj.yzghsj" class="nui-datepicker"  style="width:100%" /></td>
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
				<jsp:include page="/ame_common/detailFile.jsp"/>
				</fieldset>
					<form id="opioionform" method="post">
				        <fieldset style="border:solid 1px #aaa;padding:3px;">
				        <legend>处理意见列表</legend>
				        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
							    url="com.primeton.eos.ame_dailyoffice.yzglHandle.queryAuditOpinions.biz.ext"  idField="id" allowResize="true"
							    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
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
				    	</fieldset>
			    	</form>
				</div>
		</div>
	</div>
</body>
<script type="text/javascript">
    nui.parse();
    var processInstId='<%=request.getParameter("processInstID") %>';
    var contextPath = '<%=contextPath %>'
    var form = new nui.Form("yzwjForm");
	init(); 
	
	function init(){
	var dataYzlx = [{"id": "frz","text": "法人章"},{"id": "gz","text": "公章"},{"id": "htz","text": "合同章"},{"id": "xmzyz","text": "项目专用章"}];
    nui.get("yzlx").setData(dataYzlx);
	form.mask("数据加载中...");
	var json = nui.encode({yzwjdata : {"processinstid":processInstId}});
	nui.ajax({
			url: "com.primeton.eos.ame_dailyoffice.yzwjHandle.queryYzwjDataProcess.biz.ext",
			type: "post",
			data: json,
			contentType: "text/json",
			success: function (o){
				form.unmask();
				o = nui.clone(o);
				form.setData(o);
				//如果勾选了其他章选项的时候，显示其他章名称
				if(o.yzwj.qtz == "true"){
					nui.getbyName("yzwj.qtzmc").show();
				}
				//加载附件设置参数
				nui.get("grid_0").load({"groupid":"yzwj","relationid": o.yzwj.dh},function(){});
				//查询审核意见
				var grid = nui.get("datagrid1");
				if(o.yzwj.processinstid!=null && o.yzwj.processinstid!=""){
						grid.load({processInstID:o.yzwj.processinstid});
						grid.sortBy("time", "desc");
					}
			},
			error: function(){}
		});
	} 
	function yzlxchange(e){
	var qtzmc = nui.getbyName("yzwj.qtzmc");
	if(e.checked){
		qtzmc.show();
	}else{
		qtzmc.hide();
		qtzmc.setValue("");
	}
}
</script>
</html>