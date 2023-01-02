<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): xpc
  - Date: 2019-06-17 13:52:37
  - Description:
-->
<head>
<title>请假申请明细</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
    }
</style>
</head>
<body>
<div class="nui-fit">
	<div class="nui-panel" title="请假申请" style="width: 100%;">
		<!-- 提示信息展示  -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;">
			<legend>请假信息</legend>
			<form id="form_leave" method="post">
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 80px">请假人：</td>
							<td>
								<input id="username" name="empname" class="nui-textbox" readonly="readonly"  style="width: 110px"/>
								<input id="userid" name="userid" class="nui-hidden"/>
							</td>
							<td align="right" style="width: 80px">所在部门：</td>
							<td>
								<input id="orgname" name="orgname" class="nui-textbox"  readonly="readonly"  style="width: 110px"/>
							</td>
							<td align="right" style="width: 80px">请假类型：</td>
							<td>
								<input id="leavetypename" name="leavetypename" class="nui-textbox" style="width: 110px" required="true"  readonly="readonly"/>
							</td>
							<td align="right" style="width: 80px">岗位代理人：</td>
							<td>
								<input id="postagentname" name="postagentname" class="nui-textbox"
									readonly="readonly"  style="width: 110px"/>
							</td>
						</tr>
						<tr>
							<td align="right" valign="top" >请假事由：</td>
							<td colspan="7">
								<input name="reason" class="nui-textarea" vtype="maxLength:250" readonly="readonly" required = "true" style="width: 740px" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		<fieldset id="field11" style="border: solid 1px #aaa;padding: 3px;">
			<legend>请假详情</legend>
	    	<div id="grid_leave" class="nui-datagrid" style="height: auto;" allowCellSelect="true" 
	    	url="com.primeton.eos.ame_permanage.ame_leavepro.queryLeaveDetail.biz.ext" dataField="leavedetail"
	    	showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="calDays"  >
	            <div property="columns">
	                <div field="startdate" width="110" align="center" headerAlign="center" vtype="required:true" renderer="onDealDate">开始日期</div>
	                <div field="sptype" width="60" renderer="dictype" align="center" vtype="required:true" headerAlign="center">开始时段</div>
	                <div field="enddate" width="110" align="center" headerAlign="center" vtype="required:true" renderer="onDealDate">结束日期</div>
	                <div field="eptype" width="60" renderer="dictype" align="center" vtype="required:true" headerAlign="center">结束时段</div>
	                <div field="days" name="days" width="60" align="center" vtype="required:true" headerAlign="center" numberFormat="n1" summaryType="sum">请假天数</div> 
	            </div>
	        </div>
		</fieldset>
		
		<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
			<legend>请假附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</fieldset>
    	<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var leave_processinstid=<%=request.getParameter("processInstID")%>;
	var leaveid=<%=request.getParameter("leaveid")%>;
  	SetData();
  	function SetData(){
  		var json ="";
  		if(leave_processinstid){
	  		json = {processinstid:leave_processinstid};
  		}else{
  			json = {leaveid:leaveid};
  		}
  		nui.ajax({
      		url: "com.primeton.eos.ame_permanage.ame_leavepro.detailLeave.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      		    o = nui.decode(o);
      		    //加载请假信息
      		    var form_leave = new nui.Form("form_leave");//请假申请信息
       	  		form_leave.setData(o.leavedetail);
       	  		$("#opinionHide").hide();
  				//查询审核意见
				var grid = nui.get("datagrid1");
				grid.sortBy("time", "desc");
				grid.load({processInstID:o.leavedetail.processinstid});
				
				//加载本次请假详情
				var grid_leave = nui.get("grid_leave");//请假明细
				var json = {leaveid:o.leavedetail.leaveid};
		  		grid_leave.load(json);
		  				
  				//加载附件
  				var grid_0 = nui.get("grid_0");
  				grid_0.load({"groupid":"ameLeave","relationid":o.leavedetail.leaveid});
				grid_0.sortBy("fileTime","desc");
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
  	}
	//日期格式化
	function onDealDate(e){
		if(e.value){
			return e.value.substring(0,10);
		}
	}
	//业务字典  订票方式  订票区域 交通方式
	function dictype(e){
		return nui.getDictText('AME_TIMEPERIOD',e.value);
	}
	//汇总行
	function drawsum(e){
		if(e.field == "days"){
        	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
</script>
</html>