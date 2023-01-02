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
			<input name="fileids" id="fileids" class="nui-hidden"/>
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
							<td align="right" style="width: 80px">入职日期：</td>
							<td>
								<input id="indate" name="indate" class="nui-datepicker" style="width: 110px" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 80px">员工属性：</td>
							<td>
								<input id="emptype" name="emptype" class="nui-dictcombobox"  dictTypeId="EMP_TYPE" style="width: 110px" required="false" readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td align="right" valign="top" >请假事由：</td>
							<td colspan="9">
								<input name="reason" class="nui-textarea" vtype="maxLength:250" readonly="readonly" required = "true" style="width: 905px" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		<fieldset id="field_nj" style="border: solid 1px #aaa;padding: 3px;width: 1000px;display: none">
			<legend>申请人年假信息</legend>
	    	<div id="grid_leave1" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
	    		 url="com.primeton.eos.ame_permanage.ame_leavepro.getEmpVac.biz.ext" dataField="vacs"
	    		 showPager="false" allowCellEdit="true" multiSelect="true">
	            <div property="columns">
	                <div field="indate" dateFormat="yyyy-MM-dd" width="80" align="center" headerAlign="center" >入职日期 </div>
	                <div field="socialstart" dateFormat="yyyy-MM-dd" width="100" align="center" headerAlign="center" >社会工作起始时间 </div>
	                <div field="workyears" width="50" align="center" headerAlign="center" >社会工龄 </div>
	                <div field="comyears" width="40" align="center" headerAlign="center" >司龄 </div>
	                <div field="workingdays" width="80" align="center" headerAlign="center" >当年在职天数</div>
	                <div field="standvac" width="80" align="center" headerAlign="center" >标准年假天数 </div>
	                <div field="vacdays" width="50" align="center" headerAlign="center" >当年可用</div>
	                <div field="lastrest" width="50" align="center" headerAlign="center" >上年剩余 </div>
	                <div field="overvac" width="90" align="center" headerAlign="center" >当年春节统筹休假</div> 
	                <div field="daysoff" width="80" align="center" headerAlign="center">当年已休</div> 
	                <div field="nowrestvac" width="80" align="center" headerAlign="center" >当前可请年假 </div> 
	            </div>
	        </div>
		</fieldset>
		
		<fieldset style="border: solid 1px #aaa;padding: 3px;width: 97%">
			<legend>申请人本年度请假记录</legend>
	    	<div id="grid_leaves" class="nui-datagrid" style="height: auto;" allowCellSelect="true" 
	    	url="com.primeton.eos.ame_permanage.ame_leavepro.queryDetail.biz.ext" dataField="leavedetail"
	    	showPager="false" showSummaryRow="true" ondrawsummarycell="drawsum">
	            <div property="columns">
	                <div field="leavetype" width="40" displayField="leavetypename" align="center" headerAlign="center">请假类型</div>
	                <div field="starts" width="60" align="center" headerAlign="center">开始时间</div>
	                <div field="ends" width="60" align="center" headerAlign="center">结束时间</div>
	                <div field="status" width="40" renderer="leavestatus" align="center" headerAlign="center">状态</div>
	                <div field="days" name="days" width="40" align="right" headerAlign="center" numberFormat="n1" summaryType="sum">请假天数</div> 
	                <div field="reason" width="200" align="left" headerAlign="center">请假事由</div> 
	            </div>
	        </div>
		</fieldset>
		
		<fieldset id="field11" style="border: solid 1px #aaa;padding: 3px;width: 97%">
			<legend>本次请假详情</legend>
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
  	var grid_leaves = nui.get("grid_leaves");//当年请假明细
  	var opioionform = new nui.Form("opioionform");//审核意见
  	var grid_leave1 = nui.get("grid_leave1");//年假记录
  	
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
       	  		nui.get("postagent").setText(o.leaveinfo.agentname);//岗位代理人
       	  		nui.get("leavetype").setText(o.leaveinfo.leavetypename);//请假类型
  				var processInstID = o.leaveinfo.processinstid;
  				//查询审核意见
				var grid = nui.get("datagrid1");
				grid.sortBy("time", "desc");
				grid.load({processInstID: processInstID});
				
				nui.get("processinstid").setValue(o.workitem.processInstID);
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
				nui.get("workitemid").setValue(<%=workItemID %>);
				
				//流程回退路径赋值 
                nui.get("backTo").setData(o.backList);
				
				//审核结果设置
				initMisOpinion({auditstatus: "1"});
			
				var json = {leaveid: o.leaveinfo.leaveid};
  				grid_leave.load(json);//加载本次请假详情
  				var json1 = {"criteria": 
  								{"_expr[0]":
  									{"_property":"leaveid","_op":"in","_ref":"1"}
  								,
  								"_ref[0]":
  									{"_id":"1","_entity":"com.primeton.eos.ame_permanage.ame_permanage.AmeLeaveinfo",
  										"_expr[0]":
  										{"_property":"userid","_value":o.leaveinfo.userid},
  										"_expr[1]":
  										{"_property":"status","_op":"<>","_value":"-2"},
  										"_select":{"_field[0]":"leaveid"}
  									},
  									"_expr[1]":{"_property":"leaveid","_op":"<>","_value":o.leaveinfo.leaveid},
  									"_or[0]":
  										{
	  										"_expr[0]":{
	  											"_property":"startdate","_op":"between","_min":new Date().getFullYear()+"-01-01","_max":new Date().getFullYear()+"-12-31"
	  										},
	  										"_expr[1]":{
	  											"_property":"enddate","_op":"between","_min":new Date().getFullYear()+"-01-01","_max":new Date().getFullYear()+"-12-31"
	  										}
  										}
  								}
  								
  							};
  				grid_leaves.sortBy("startdate","desc")
  				grid_leaves.load(json1);//加载本年度请假详情
  				if(o.leaveinfo.leavetype=="1"){//年假
					$("#field_nj").show();
					grid_leave1.load({userid:nui.get("userid").getValue()});
				}else{
					$("#field_nj").hide();
				}
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
		nui.confirm("是否提交？","操作提示",function(o){
        	if("ok" == o){
				SaveData()
        	}
        });
    }
    
    //附件提交后触发
    function SaveData(){
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
	function leavestatus(e){
		return nui.getDictText('AME_LEAVESTATUS',e.value);
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
    
</script>
</html>