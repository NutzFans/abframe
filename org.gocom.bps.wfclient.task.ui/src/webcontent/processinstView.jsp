<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Map"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/bps/wfclient/common/common.jsp"%>
<%@page import="com.primeton.bps.web.control.I18nUtil"%>
<html>
<head>
<title><%=I18nUtil.getMessage(request,
					"bps.wfclient.myTask.WorkItem")%></title>
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
	background-color: #f7f7f7;
}

.mini-grid-cell-nowrap {
	white-space: nowrap;
}
</style>
</head>
<body>
	<div style="width: 100%; height: 100%; padding: 5px;">
		<div id="workItemTabs" class="nui-tabs" activeIndex="0" onactivechanged="changeTabs" style="height: 100%">
			<div id="misOpinionTab" style="background-color: blue;" name="misOpinionTab" title="审批意见列表">
				<div id="misOpinionDataGrid" class="nui-datagrid" style="width: 100%" dataField="misOpinion" url="com.primeton.eos.ame_pur.purContractProcess.queryopinion.biz.ext" idField="id" allowResize="true"
					allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
					<div property="columns" height=auto>
						<div type="indexcolumn" headerAlign="center" width="20">编号</div>
						<div field="operatorname" width="30" headerAlign="center" align="center">处理人</div>
						<div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
						<div field="starttime" width="60" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">任务启动时间</div>
						<div field="endtime" width="60" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">任务处理时间</div>
						<div field="jiequtime" width="40" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时长</div>
						<div field="auditstatus" renderer="onCheckRenderer" width="30" align="center" headerAlign="center">处理结果</div>
						<div field="auditopinion" width="200" headerAlign="center" align="left">审批意见</div>
					</div>
				</div>
			</div>
			<div id="processGraphTab" style="background-color: blue;" name="processGraphTab" title="<%=I18nUtil.getMessage(request,
					"bps.wfclient.myTask.ProcessGraph")%>">
				<div id="processgraph" class="nui-bps-processgraph" showParticipants="true" style="height: 100%"></div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		nui.parse();
		var processInstID = "";
		var tabsObj = nui.get("workItemTabs");

		function initData(row) {
			var processGraphObj = nui.get("processgraph");
			processGraphObj.setProcInstID(row.processInstID);
			processGraphObj.load();

			var misOpinionDataGrid = nui.get("misOpinionDataGrid");
			misOpinionDataGrid.load({
				processInstID : row.processInstID
			});

			var ywDetail = {
				name : "ywDetail",
				id : "ywDetail",
				title : "业务信息"
			};
			
			<%UserObject user = (UserObject) session.getAttribute("userObject");
					Map attr = user.getAttributes();
					DataObject[] roles = (DataObject[]) attr.get("roles");
					boolean isOutUser = false;
					for (int i = 0; i < roles.length; i++) {
						if (roles[i].getString("roleid").equals("primetongeneral")) {
							isOutUser = true;
						}
					}
					if (isOutUser == true) {
					} else {%>
				tabsObj.addTab(ywDetail, 2);
			<%}%>
			
			processInstID=row.processInstID;
		}

    	var flag =true;
    	
		function changeTabs(e) {
			if (flag) {
				if (e.tab.name == "ywDetail") {
					nui.ajax({
						url : "org.gocom.bps.wfclient.task.business.task.queryProcessinstByProcessinstID.biz.ext",
						type : "post",
						data : {
							processinstid : processInstID
						},
						contentType : "text/json",
						success : function(o) {
							if (o.PROCURL != null && o.PROCURL != "") {
								tabsObj.loadTab("<%=request.getContextPath() %>"+o.PROCURL+"?processInstID=" + processInstID);
							} else {
								tabsObj.loadTab("<%=request.getContextPath() %>/bps/wfclient/task/noYWpage.jsp");
							}
							flag = false;
						}
					});
				}
			}
		}

		//跨域调用时监听
		window.addEventListener('message', function(ev) {
			var data = ev.data;
			initData(data);
		}, false);

		//处理结果业务字典显示
		function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS', e.value);
		}
	</script>

</body>
</html>