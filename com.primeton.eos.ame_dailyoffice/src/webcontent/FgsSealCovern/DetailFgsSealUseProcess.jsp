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
<title>分公司用章使用详情</title>
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
</head>
<body>
<div class="nui-fit">
	<div class="mini-panel" title="武大吉奥分公司印章使用审批单" style="width: auto">
	<!-- 提示信息展示 -->
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<div class="nui-toolbar">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>武大吉奥分公司印章使用审批单</legend>
				<form id="fgsyzglSealUse">
					<!--隐藏域-->
					<input name="fgsyzgl.ywid" class="nui-hidden" />
					<input name="fgsyzgl.fileids" id="fileids"  class="nui-hidden"/>
					<input name="yzgl.yzglid" class="nui-hidden"/>
					<input name="purstatus" class="nui-hidden"/>
					<div style="padding:5px;">
						<table style="table-layout:fixed;" id="table_file">
							<tr>
								<td align="right" style="width:120px;">单号：</td>
								<td style="width:150px;"><input name="fgsyzgl.dh" class="nui-textbox" style="width:100%" /></td>
								<td align="right" style="width:120px;">印章申请日期：</td>
								<td style="width:150px;">
	                    			<input name="fgsyzgl.yzsqrq" class="nui-datepicker"  style="width:100%" />
	               				</td>	
							</tr>
							<tr>
								<td align="right" style="width:120px;">用印部门：</td>
								<td style="width:150px;"><input name="fgsyzgl.orgname" class="nui-textbox" style="width:100%" />
														 <input name="fgsyzgl.orgid" class="nui-hidden" /></td>
								<td align="right" style="width:120px">经办人：</td>
								<td style="width:150px;"><input name="fgsyzgl.username" class="nui-textbox" style="width:100%" />
														 <input name="fgsyzgl.userid" class="nui-hidden" /></td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">用章类型：</td>
								<td colspan="4" class = "asLabel">
									<div name="fgsyzgl.yzlx" id="yzlx" class="mini-checkboxlist" repeatItems="4" repeatLayout="table" textField="text" valueField="id">
  									</div>
  									<div>
  										<input class="nui-checkbox" text="其他章" name="fgsyzgl.qtz" onvaluechanged="yzlxchange(this)">
  										<input name="fgsyzgl.qtzmc" class="nui-textbox" style="display:none">
  									</div>
								</td>
							</tr>
							<tr>
								<td align="right" style="width:120px;">印章所属单位：</td>
								<td  style="width:410px;" colspan="3">
									<input name="fgsyzgl.yzssdw" class="nui-dictcombobox" dictTypeId="FGS_NAME"/>
								</td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">用印事由及文件名称：</td>
								<td colspan="5" class = "asLabel"><input name="fgsyzgl.yysyyjwjmc" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%" /></td>
							</tr>
							<tr name="bmfzryj" style="display:none">	
								<td align="right" style="width:120px">用印部门负责人意见：</td>
								<td colspan="5" class = "asLabel"><input name="fgsyzgl.yybmfzryj" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%" /></td>
							</tr>
							<tr name="glzxzhbyj" style="display:none">	
								<td align="right" style="width:120px">管理中心综合办意见：</td>
								<td colspan="5" class = "asLabel"><input name="fgsyzgl.glzxzhbyj" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%" /></td>
							</tr>
							<!--<tr>	
								<td align="right" style="width:120px">常务副总裁审批：</td>
								<td colspan="5" class = "asLabel"><input name="fgsyzgl.cwfzcsp" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%" /></td>
							</tr>-->
							<tr>	
								<td align="right" style="width:120px">备注：</td>
								<td colspan="5" class = "asLabel"><input name="fgsyzgl.bz" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%" /></td>
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
    var form = new nui.Form("fgsyzglSealUse");
	init(); 
	
	function init(){
	var dataYzlx = [{"id": "frz","text": "法人章"},{"id": "gz","text": "公章"},{"id": "htz","text": "合同章"},{"id": "xmzyz","text": "项目专用章"}];
	nui.get("yzlx").setData(dataYzlx);
	form.mask("数据加载中...");
	var json = nui.encode({fgsyzsy : {"processinstid":processInstId}});
	nui.ajax({
			url: "com.primeton.eos.ame_dailyoffice.fgsyzglHandle.queryFgsyzsyDataProcess.biz.ext",
			type: "post",
			data: json,
			contentType: "text/json",
			success: function (o){
				form.unmask();
				o = nui.clone(o);
				form.setData(o);
				//如果勾选了其他章选项的时候，显示其他章名称
				if(o.fgsyzgl.qtz == "true"){
					nui.getbyName("fgsyzgl.qtzmc").show();
				}
				//加载附件设置参数
				nui.get("grid_0").load({"groupid":"fgsyzsy","relationid": o.fgsyzgl.dh},function(){});
				//查询审核意见
				var grid = nui.get("datagrid1");
				if(o.fgsyzgl.processinstid!=null && o.fgsyzgl.processinstid!=""){
						grid.load({processInstID:o.fgsyzgl.processinstid});
						grid.sortBy("time", "desc");
					}
			},
			error: function(){}
		});
	} 
	function yzlxchange(e){
	var qtzmc = nui.getbyName("fgsyzgl.qtzmc");
	if(e.checked){
		qtzmc.show();
	}else{
		qtzmc.hide();
		qtzmc.setValue("");
	}
}
function onCheckRenderer(e) {
		return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
	}
</script>
</html>