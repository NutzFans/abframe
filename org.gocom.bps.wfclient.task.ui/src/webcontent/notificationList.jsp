<%@page import="com.primeton.bps.web.control.I18nUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/bps/wfclient/common/common.jsp"%>
<html>
<head>
<title><%=I18nUtil.getMessage(request,"bps.wfclient.notification.NoticeList")%></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body style="width: 98%" class="body-font">
	<div id="queryform" class="nui-from" align="center">	
		<table id="table1" style="width: 100%;height:32px;" align="center" >
			<tr>
				<td width="90" align="right">流程实例名称:</td>
				<td align="left">
					<input class="nui-textbox" name="criteria._expr[0]._value">
					<input class="nui-hidden" name="criteria._expr[0]._property" value="procInstName">
					<input class="nui-hidden" name="criteria._expr[0]._op" value="like">
					<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all">
				</td>
				<td  width="70" align="right">工作项名称:</td>
				<td align="left">
					<input class="nui-textbox" name="criteria._expr[1]._value">
					<input class="nui-hidden" name="criteria._expr[1]._property" value="workItemName">
					<input class="nui-hidden" name="criteria._expr[1]._op" value="like">
					<input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all">
				</td>
				<td  width="70" align="right">通知内容:</td>
				<td align="left">
					<input class="nui-textbox" name="criteria._expr[2]._value">
					<input class="nui-hidden" name="criteria._expr[2]._property" value="message">
					<input class="nui-hidden" name="criteria._expr[2]._op" value="like">
					<input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all">
				</td>
				<td  width="70" align="right">是否已阅:</td>
				<td align="left">
					<input id="state" class="nui-combobox" name="criteria._expr[3]._value" showNullItem="false" value="" data="[{id:'',text:'<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.All")%>'},{id:'VIEWED',text:'<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.Yes")%>'},{id:'UNVIEWED',text:'<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.No")%>'}]"/>
					<input class="nui-hidden" name="criteria._expr[3]._property" value="state">
				</td>
				<td align="right">
					<a class="nui-button grayBtn" onclick="search"><%=I18nUtil.getMessage(request, "bps.wfclient.common.Query")%></a>
				</td>
			</tr>			
		</table>	
	</div>
	<div id="notificationListId" class="nui-datagrid bpsDatagrid"
		style="margin-top:15px;width: 100%;" dataField="notificationList"
		url="org.gocom.bps.wfclient.task.business.notice.queryNotificationList.biz.ext"
		allowAlternating="true" pageSize="15" showPager="true" >
		<div property="columns">
			<div name="action" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;" width="30"><%=I18nUtil.getMessage(request, "bps.wfclient.common.Operation")%></div>
			<div field="message" headerAlign="center" align="left" width="180"><%=I18nUtil.getMessage(request, "bps.wfclient.notification.Message")%></div>
			<div field="procInstName" headerAlign="center" align="left" width="180">流程实例名称</div>
			<div field="workItemName" headerAlign="center" align="left" width="80">工作项名称</div>
			<div field="sender" headerAlign="center" align="center" width="60">工作项参与者</div>
			<div field="createTime" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss" width="85px">通知产生时间</div>
	        <div name="confirmTime" field="confirmTime" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss" width="85px">通知阅读时间</div>
			<div field="state" headerAlign="center" align="center" renderer="doChangetimeOutFlag" width="40">是否已阅</div>
		</div>
	</div>
	<!-- for integration coframe
	<div class="pager" style="height:30px;width:100%">
		<div id="pager" class="nui-bpspager"  datagridId="notificationListId"></div>
	</div>
	 -->
	<script type="text/javascript">
    	nui.parse();
		var grid =nui.get("notificationListId");
		var combox=nui.get("state");
		combox.select(0);
		search();
		//var pager = nui.get("pager");
		//pager.setDatagridParams(data);
		
    	
		resizeDatagridHeight();
    	$(window).bind("resize", resizeDatagridHeight);
    	// 自动调整datagrid的外部高度,撑满屏幕
    	function resizeDatagridHeight(){
    		var realheight = window.innerHeight || (document.documentElement && document.documentElement.clientHeight) || document.body.clientHeight;
    		if((navigator.userAgent.indexOf('Firefox') >= 0 || navigator.userAgent.indexOf('Chrome') >= 0)){
				realheight  -= 25;
			}
	    	realheight = realheight - 125 - 20  + "px";
	    	var datagridObj = document.getElementById("notificationListId");
	    	datagridObj.style.height=realheight;
    	}

		function onActionRenderer(e) {
			var s = "";
			s = s + '<a class="dgBtn" href="javascript:doShowNotificationDetail(' + e.rowIndex + ')"><%=I18nUtil.getMessage(request, "bps.wfclient.common.View")%></a> ';
			return s;
		}
			
		function doShowNotificationDetail(rowIndex) {
			var row = grid.getRow(rowIndex);
			nui.open({
				url : contextPath+ "/bps/wfclient/task/showNotificationDetail.jsp",
				title : "<%=I18nUtil.getMessage(request, "bps.wfclient.notification.ShowNoticeDetail")%>",
				width : 1000,
				height : 550,
				onload : function() {
					var iframe = this.getIFrameEl();
					if (iframe.contentWindow.initData) {
						iframe.contentWindow.initData(row);
					}
				},
				ondestroy : function(action) {
					if (action == "ok") {
						grid.reload();
					}
				}
			});
		}

		function confirm(rowIndex) {
			var row = grid.getRow(rowIndex);
			var data = {
				notificationID : row.notificationID
			};
			var json = nui.encode(data);//将数据转换成json格式		    	
			nui.ajax({
					url : "org.gocom.bps.wfclient.task.business.notice.confrimNotification.biz.ext",
					type : 'POST',
					data : json,
					cache : false,
					contentType : 'text/json',
					success : function(text) {
						grid.reload();
					}
			});
		}

		function search(e) {
			var form = new nui.Form("#queryform");
			var json = form.getData(false, true);
			grid.load(json);//grid查询
			//pager.setDatagridParams(json);
		}
		//超时
        var timeFlag={
        	"VIEWED":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.Yes")%>",
        	"UNVIEWED":"<%=I18nUtil.getMessage(request, "bps.wfclient.bizdict.No")%>"
        };
		function doChangetimeOutFlag(e) {
			if(e.value == "VIEWED"){
				return "<font color='blue'>是</font>";
			}else{
				return "<font color='red'>否</font>";
			}
		}
	</script>
</body>
</html>
