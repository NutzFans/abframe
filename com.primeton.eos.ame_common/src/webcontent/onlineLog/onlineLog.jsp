<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-05-25 09:19:04
  - Description:
-->
<head>
	<title>上线日志</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width: 98%" class="body-font">
	<div style="width:100%;height:100%;padding:0px;margin:0px;">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <legend>上线日志列表</legend>
	        <div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="queryform">
		        <table id="table1" style="width: 100%;height:32px;font-size:12px;" align="center" >
		        	<tr>
		        		<td width="100px" align="right">操作人员:</td>
		        		<td align="left">
			        		<input class="nui-textbox" name="criteria._expr[0]._value">
							<input class="nui-hidden" name="criteria._expr[0]._property" value="operator">
							<input class="nui-hidden" name="criteria._expr[0]._op" value="like">
		        		</td>
		        		<td  width="100px" align="right">上线日期范围:</td>
						<td align="left">
							<input class="nui-datepicker" id="startdate" onblur="checkTime()" name="criteria._expr[1]._min" style="width:100px">
							--
				    		<input class="nui-datepicker" onblur="checkTime()" name="criteria._expr[1]._max" style="width:100px" id="maxdatepicker">
					        <input class="nui-hidden" name="criteria._expr[1]._property" value="onlinedate">
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="between">
					        <input class="nui-hidden" name="criteria._expr[1]._pattern" value="yyyy-MM-dd">
						</td>
			        	<td  width="60px" align="right">上线类型:</td>
						<td align="left">
							<input id="isTimeOut" class="nui-dictcombobox" name="criteria._expr[2]._value" showNullItem="true"  dictTypeId="AME_ONLINETYPE" >
							<input class="nui-hidden" name="criteria._expr[2]._property" value="onlinetype">
							<input class="nui-hidden" name="criteria._expr[2]._op" value="=">
						</td>
						<td  width="100px" align="right">是否重启:</td>
						<td align="left">
							<input id="isTimeOut" class="nui-dictcombobox" name="criteria._expr[3]._value" style="width:80px" showNullItem="true"  dictTypeId="ABF_YESORNO" >
							<input class="nui-hidden" name="criteria._expr[3]._property" value="restart">
							<input class="nui-hidden" name="criteria._expr[3]._op" value="=">
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
			<div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
		                    </td>
		                </tr>
		             </table>           
		        </div>
		    </div>
		    <div id="searchOnlineLogId" class="nui-datagrid bpsDatagrid"
				style="margin-top:0px;width: 100%;" dataField="onlineLogSearch"
				url="com.primeton.eos.ame_common.onlineLog.querySearchOnlineLog.biz.ext"
				allowAlternating="true" pageSize="15" showPager="true" multiSelect="true">
				<div property="columns">
					<div field="logid" headerAlign="center" align="center" allowSort="true"  width="50px" visible="false">上线日期</div>
					<div field="onlinedate" headerAlign="center" align="center" allowSort="true" dateFormat="yyyy-MM-dd" width="50px">上线日期</div>
					<div field="starttime" headerAlign="center" align="center" allowSort="true" width="50px">上线开始时间</div>
					<div field="endtime" headerAlign="center" align="center" allowSort="true" width="50px">上线结束时间</div>
					<div field="operator" headerAlign="center" align="center" allowSort="true" width="50px">操作人员</div>
					<div field="onlinecontent" headerAlign="center" align="left" renderer="getDetail" width=280px">上线内容概述</div>
					<div field="onlinetype" headerAlign="center" align="center" allowSort="true" renderer="onOnlineTypeRenderer" width="70px">上线类型</div>
					<div field="version" headerAlign="center" align="center" allowSort="true" width=70px">版本</div>
					<div field="restart" headerAlign="center" align="center" allowSort="true" renderer="onRestartRenderer" width="30px">是否重启</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var grid=nui.get("searchOnlineLogId");
		grid.load();
		grid.sortBy("onlinedate", "desc");
		
		function search(){
	        var form = new nui.Form("#queryform");
	        
	        var data = form.getData();
	        grid.load(data);
	        grid.sortBy("onlinedate", "desc");
	    }
		
		function add(){
			nui.open({
				url: "<%=request.getContextPath() %>/ame_common/onlineLog/addOnlineLog.jsp",title: "新增上线日志", width: 800, height: 480,	                
				onload: function () {
	                var iframe = this.getIFrameEl();
	                var data = { action: "new"};
	                iframe.contentWindow.SetData(data);
	            },
	            ondestroy: function (action) {
	                grid.reload();
	            }
	        });
		}
		
		// 查询时进行合理的时间检测 
		function checkTime(){
			var a=nui.get("startdate").getValue();
        	var b=nui.get("maxdatepicker").getValue();
        	if(b<a && b != ''){
        		alert("截止日期必须大于开始日期");
        		nui.get("maxdatepicker").setValue('');
        		return false;
        	}
		}
		
		function reset(){
			var form = new nui.Form("#queryform");
			form.reset();
			grid.load();
			grid.sortBy("onlinedate", "desc");
		}
		
		function getDetail(e){
	        return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
	    }
	    function checkDetail(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath()%>/ame_common/onlineLog/logShow.jsp?id=" + selectRow.logid;
			var iWidth=900; //弹出窗口的宽度;
			var iHeight=400; //弹出窗口的高度;
			var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
			window.open(executeUrl, "反馈详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
	    }
		
		function onRestartRenderer(e){
	        return nui.getDictText('ABF_YESORNO',e.value);//设置业务字典值
	    }
	    
	    function onOnlineTypeRenderer(e){
	        return nui.getDictText('AME_ONLINETYPE',e.value);//设置业务字典值
	    }
		
	</script>
</body>
</html>