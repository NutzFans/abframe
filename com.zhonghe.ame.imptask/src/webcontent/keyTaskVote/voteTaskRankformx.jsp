<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>发起重点任务投票</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit" >
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>发起重点任务投票</legend>
		 	<form id="form1" method="post" >
	        	<table style="table-layout:fixed;" id="table_file1">
	        			<tr>		
							<td align="right"  style="width:160px">投票名称:</td>
							<td>
								<input class="nui-textbox" name="keytask_name" readOnly="readOnly" id="keytask_name" style="width:300px" required="true">
							</td>
							
						</tr>
						<tr>
							<td align="right" style="width:160px">投票结束时间:</td>
							<td style="width: 130px"><input name="finishtime" id="finishtime" readOnly="readOnly" class="nui-datepicker"  style="width: 300px" required="true"/></td>
						</tr>
						<tr>
							<td align="right" style="width:160px">责任单位名称:</td>
							<td colspan="6"><input class="nui-textbox" readOnly="readOnly" name="orgids" id=orgids shownullItem="true" style="width: 900px;" required="true" /> 
						</tr>
						<tr>
						<td align="right" style="width:160px">备注:</td>
						<td colspan="6"><input class="nui-textarea" readOnly="readOnly" name="remake" id="remake" shownullItem="true" style="width: 900px;" required="true" /> 
						</tr>
						<tr>
						<td align="right" style="width:160px">重点任务名称:</td>
						<td>
						<div id="datagrid1" class="nui-datagrid" style="width:900px;height:300px;" allowResize="true" showPageInfo="false" showReloadButton="false"
							showPagerButtonIcon="false" showPageIndex="false"
							showPageSize="false" title="重点任务详细信息">
						    <div property="columns">
						        <div field="keytaskIds.task_name" width=120 headerAlign="center" allowSort="true">重点任务名称</div>    
						        <div field="keytaskIds.number" width="120" headerAlign="center" align="center" allowSort="true">编号</div>                            
						        <div field="keytaskIds.finishtime" width="120"  align="center" headerAlign="center">年度</div>
						    </div>
						</div>
						</td>
						</tr>
	        	</table>
	        </form>
    	<!--</fieldset>
    	<div>
        <fieldset style="border: solid 1px #aaa;padding: 3px;width: 100%;" align="center">
			    <legend>参与投票重点任务</legend>
	        <div id="grid_traveldetail1" class="nui-datagrid"  style="width: 100%;height: auto;" allowCellSelect="true" 
	    		url="com.zhonghe.ame.imptask.keytask.queryTaskVoteOrg.biz.ext" dataField="result"
	    		showPager="false" allowCellEdit="true" multiSelect="true">
	            <div property="columns">
	               <div field="taskname" width="100" align="center" headerAlign="center" allowSort="true" >重点任务名称</div>
	            </div>
	        </div>
			</fieldset>
			<fieldset style="border: solid 1px #aaa;padding: 3px;width: 100%;" align="center">
			    <legend>投票单位</legend>
	        <div id="grid_traveldetail2" class="nui-datagrid"  style="width: 100%;height: auto;" allowCellSelect="true" 
	    		url="com.zhonghe.ame.imptask.keytask.queryTaskVoteOrg.biz.ext" dataField="result"
	    		showPager="false" allowCellEdit="true" multiSelect="true">
	            <div property="columns">
	               <div field="orgname" width="100" align="center" headerAlign="center" allowSort="true" >责任单位名称</div>
	            </div>
	        </div>
			</fieldset>
		</div>-->
		</fieldset>
	<div style="text-align:center;padding:10px;" class="nui-toolbar" >
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
</div>
    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var id = <%=request.getParameter("id")%>;
    	
    	var grid1 = nui.get("grid_traveldetail1");
    	var grid2 = nui.get("grid_traveldetail2");
    	
    	var grid = nui.get("datagrid1");
    	var size=0;
    	var monthData = [];
    	
    	
		function init(){
			var data = {"id":id};
			var json = nui.encode(data);
			nui.ajax({
		        url: "com.zhonghe.ame.imptask.keyTaskVote.queryTaskVoteDetail.biz.ext",
		        type: "post",
		        data: json ,
		        contentType:'text/json',
		        success: function (o) {
		        	var wx = nui.decode(o);
		        	//console.log(wx);
		        	size=getJsonLength(wx);
		        	console.log(size);
		        	//grid.setValue(wx.res[0]);
		        	form.setData(wx.res[0]);
		        	for(var i=0;i<=size;i++){
						monthData.add ({keytaskIds: wx.res[i]},);
						
					} 
					console.log(monthData);
					grid.setData(monthData)
		        	
			   }
			});
		}
		init();
		
		function CloseWindow(action) {            
	        if (action == "close" && form.isChanged()) {
	            if (confirm("数据被修改了，是否先保存？")) {
	                return false;
	            }
	        }
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();            
	    }

	    function onCancel(e) {
	        CloseWindow("cancel");
	    }
	    
	    function getJsonLength(jsonData){ //获取json数组的长度
   			var jsonLength = 0;
    		for(var item in jsonData){
            	jsonLength++;
            }
    		return jsonLength;
		}
    
   	</script>
</body>
</html>