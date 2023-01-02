<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2019-05-21 13:52:37
  - Description:
-->
<head>
<title>请假申请</title>
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
			<input name="fileids" id="fileids1" class="nui-hidden"/>
			<input name="applydate" class="nui-hidden"/>
			<input name="status" class="nui-hidden"/>
			<input name="leaveid" class="nui-hidden"/>
			<input name="processinstid" class="nui-hidden"/>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 80px">请假人：</td>
							<td>
								<input id="username" name="username" class="nui-textbox" readonly="readonly" style="width: 110px"/>
								<input id="userid" name="userid" class="nui-hidden"/>
							</td>
							<td align="right" style="width: 80px">所在部门：</td>
							<td>
								<input id="orgname" name="orgname" class="nui-textbox" readonly="readonly" style="width: 110px"/>
							</td>
							<td align="right" style="width: 80px">请假类型：</td>
							<td>
								<input id="leavetype" name="leavetype" class="nui-combobox" style="width: 110px" required="true"  readonly="readonly"/>
							</td>
							<td align="right" style="width: 80px">岗位代理人：</td>
							<td>
								<input id="postagent" name="postagent" class="nui-buttonedit" 
									readonly="readonly" allowInput="false" style="width: 110px"/>
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
		
		<fieldset id="field11" style="border: solid 1px #aaa;padding: 3px;width: 97%">
			<legend>请假详情</legend>
	    	<div id="grid_leave" class="nui-datagrid" style="height: auto;" allowCellSelect="true" 
	    	url="com.primeton.eos.ame_permanage.ame_leavepro.queryLeaveDetail.biz.ext" dataField="leavedetail"
	    	showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="calDays" showSummaryRow="true" ondrawsummarycell="drawsum">
	            <div property="columns">
	                <div field="startdate" width="110" align="center" headerAlign="center" vtype="required:true" renderer="onDealDate">开始日期</div>
	                <div field="sptype" width="60" renderer="dictype" align="center" vtype="required:true" headerAlign="center">开始时段</div>
	                <div field="enddate" width="110" align="center" headerAlign="center" vtype="required:true" renderer="onDealDate">结束日期</div>
	                <div field="eptype" width="60" renderer="dictype" align="center" vtype="required:true" headerAlign="center">结束时段</div>
	                <div field="days" name="days" width="60" align="right" vtype="required:true" headerAlign="center" numberFormat="n1" summaryType="sum">请假天数</div> 
	            </div>
	        </div>
		</fieldset>
		
		<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;width: 97%">
			<legend>请假附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
			<div id="filetips" style="display: none">
				<span><font color="red" size="2"><b>提示：</b></font></span>
				<span><font color="red" size="2"><b id = "tips"></b></font></span>
			</div>
			<jsp:include page="/ame_common/addFiles1.jsp"/>
		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
</div>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk('1')" id="creatLeave" style="width: 80px;margin-right: 20px;">提交</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;margin-right: 100px;" id="canelButton">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
  	var form_leave = new nui.Form("form_leave");//请假申请信息
  	var grid_leave = nui.get("grid_leave");//请假明细
  	var opioionform = new nui.Form("opioionform");//审核意见
  	
  	init();//申请数据初始化
  	function init(){
		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		var json = {workItemID: <%=workItemID %>};
  		nui.ajax({//获取差旅信息
      		url: "com.primeton.eos.ame_permanage.ame_leavepro.queryLeavePro.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
       	  		form_leave.setData(o.leaveinfo);
  				var processInstID = o.leaveinfo.processinstid;
  				nui.get("postagent").setText(o.leaveinfo.agentname);//岗位代理人
  				nui.get("leavetype").setText(o.leaveinfo.leavetypename);//请假类型
  				//查询审核意见
				var grid = nui.get("datagrid1");
				grid.sortBy("time", "desc");
				grid.load({processInstID: processInstID});
				
				nui.get("processinstid").setValue(o.workitem.processInstID);
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
				nui.get("workitemid").setValue(<%=workItemID %>);
				
				//审核结果设置
				initMisOpinion({auditstatus: "4"});
				nui.get("auditopinion").setValue("");
				$("#salesEdit").hide();
				
				var json = {leaveid: o.leaveinfo.leaveid};
  				grid_leave.load(json);//加载本次请假详情
  				changetype();//加载附件提示
  				//加载附件
  				var grid_0 = nui.get("grid_0");
  				grid_0.load({"groupid":"ameLeave","relationid":o.leaveinfo.leaveid});
				grid_0.sortBy("fileTime","desc");
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
  	}
    function onOk(e){
		var filePaths = document.getElementsByName("uploadfile1").length;
    	if(filePaths==0){
    		nui.alert("请补充请假材料！");
    		return;
    	}
    	for(var j = 0;j < filePaths;j++){
    		var a = document.getElementsByName("uploadfile1")[j].files.length;
    		if(a == 0){
    			nui.alert("新增附件不可以为空");
    			return false;
    		}
    	}
    	
		nui.confirm("是否提交？","操作提示",function(o){
        	if("ok" == o){
				document.getElementById("fileCatalog1").value="ameLeave";
	        	form4.submit();
        	}
        });
    }
    
    //附件提交后触发
    function SaveData1(){
    	mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '操作中...'
        });
        var leaveinfo = form_leave.getData();//请假信息
		var misOpinion = opioionform.getData().misOpinion;//审核意见
		var json = {leaveinfo:leaveinfo,misOpinion:misOpinion};
    	//按钮禁用
    	nui.get("creatLeave").disable();
    	nui.ajax({	
      		url: "com.primeton.eos.ame_permanage.ame_leavepro.saveLeaveProDept.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (text) {
      			nui.unmask();
      			if(text.result == "1"){
      				nui.alert("流程提交成功！","系统提示",function (){
                   		CloseWindow("ok");
                   	});
      			}else {
    				nui.alert("流程提交失败！","系统提示");
      				nui.get("creatLeave").enable();
      			}
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
	function leavetype(e){
		return nui.getDictText('AME_LEAVETYPE',e.value);
	}
	//汇总行
	function drawsum(e){
		if(e.field == "days"){
        	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	function onCancel(e) {
        CloseWindow("cancel");
    }
    //标准方法接口定义
    function CloseWindow(action) {           
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }
    
   //请假类型改变时触发
	function changetype(){
		var json = {leavetypeid:nui.get("leavetype").getValue()}
		nui.ajax({	
            url: "com.primeton.eos.ame_permanage.ame_leavepro.getLeaveType.biz.ext",
            type: 'POST',
            data: json,
            success: function (text) {
            	filetips = text.leavetypes[0].filetips;
            	if(filetips){
					$("#filetips").show();
					$("#tips").text(filetips);
				}else{
					$("#filetips").hide();
				}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
		
	}
    
</script>
</html>