<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-05-23 14:00:52
  - Description:
-->
<head>
<title>流程关注查询</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width: 98%" class="body-font">
	<div style="width:100%;height:100%;padding:0px;margin:0px;">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<legend>流程关注查询</legend>
			<div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="queryform">
			<table id="table1" style="width: 100%;height:32px;font-size:12px;" align="center" >
				<tr>
					<td width="150" align="right">关注人：</td>
					<td align="left">
						<input class="nui-textbox" name="criteria._expr[1]._value">
						<input class="nui-hidden" name="criteria._expr[1]._property" value="username">
						<input class="nui-hidden" name="criteria._expr[1]._op" value="like">
					</td> 
					<td  width="90" align="right">流程定义名称:</td>
					<td align="left">
					<input id="processChName" class="nui-combobox" valueField="processchname" textField="processchname" 
							url="com.primeton.eos.ame_common.attention.queryProcessChName.biz.ext"
					 		name="criteria._expr[2]._value" showNullItem="true" filterType="like"  dataField="WFProcessDefine" >
					<input class="nui-hidden" name="criteria._expr[2]._property" value="processchname">
					<input class="nui-hidden" name="criteria._expr[2]._op" value="=">
					</td>
					<td  width="90" align="right">流程状态:</td>
					<td align="left">
					<input id="currentState" class="nui-combobox" name="criteria._expr[3]._value" value="2" showNullItem="true" nullItemText="全部" valueField="id" textField="text" data="[{id: 1,text: '未启动'},{id: 2,text: '运行'},{id: 3,text: '挂起'},{id: 7,text: '完成'},{id: 8,text: '终止'}]" >
					<input class="nui-hidden" name="criteria._expr[3]._property" value="currentstate">
					</td>
				</tr>
				<tr>
					<td align="center" colspan="15">
							<a class="nui-button grayBtn" iconCls="icon-search" onclick="search">查询</a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="nui-button grayBtn" iconCls="icon-reload" onclick="reset">重置</a>
					</td>	
				</tr>
			</table>
			</div>
			<div id="searchFlowAttentionId" class="nui-datagrid" dataField="flowAttentionSearchs"
				url="com.primeton.eos.ame_common.attention.querySearchFlowAttention.biz.ext"
				allowAlternating="true" pageSize="15" showPager="true" multiSelect="true">
				<div property="columns">
					<div field="username" headerAlign="center" align="center" allowSort="true" width="30px">关注人</div>
					<div field="attentiontime" headerAlign="center" align="center" allowSort="true" dateFormat="yyyy-MM-dd HH:mm:ss" width="80px">关注时间</div>
					<div field="processchname" headerAlign="center" align="left" allowSort="true" width="80px">流程定义名称</div>
					<div field="processinstname" headerAlign="center" align="left" allowSort="true" renderer="getDetail" width="210px">流程实例名称</div>
					<div field="currentstate" headerAlign="center" align="center" allowSort="true" renderer="onStateRenderer" width="20px">状态</div>
					<div field="activityinstname" headerAlign="center" align="left" allowSort="true" width="80px">当前流程环节</div>
					<div field="starttime" headerAlign="center" align="center" allowSort="true" dateFormat="yyyy-MM-dd HH:mm:ss" width="80px">流程启动时间</div>
					<div field="endtime" headerAlign="center" align="center" allowSort="true" dateFormat="yyyy-MM-dd HH:mm:ss" width="80px">流程结束时间</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var grid = nui.get("searchFlowAttentionId");
		grid.load();

		search();
		grid.sortBy("attentiontime", "desc");
		
		function search(){
	        var form = new nui.Form("#queryform");
	        var data = form.getData();
	        grid.load(data);
	        grid.sortBy("attentiontime", "desc");
	    }
		
		function reset(){
			var form = new nui.Form("#queryform");
			form.reset();
			grid.load();
			grid.sortBy("attentiontime", "desc");
		}
		
		function getDetail(e){
			var s = "";
            s = s + '<a class="dgBtn"  href="javascript: doOperate(' + e.rowIndex + ')">'+ e.value +'</a> ';      
            
            return s;
		}
		//执行操作
	    function doOperate(rowIndex) {
	    	var row = grid.getRow(rowIndex);
	    	var url = "<%=request.getContextPath() %>/bps/wfclient/task/taskView.jsp";
	    	var title = "流程信息 ";
	    	var width=1000;
	    	
		    nui.open({
				url: url,
				title: title,
				width: width,
				height: 550,
				onload: function () {
					var iframe = this.getIFrameEl();
					if(iframe.contentWindow.initData) {
						iframe.contentWindow.initData(row);
					}	
				},
				ondestroy: function (action){
					if (action == "ok") {
						grid.load();
					} 
				}
			});
	    }
		
		function onStateRenderer(e) {
			if (e.value==1) return"未启动";
			else if (e.value==2) return"运行";
			else if (e.value==3) return"挂起";
			else if (e.value==7) return"完成";
			else if (e.value==8) return"终止";
		}
	
	</script>
</body>
</html>