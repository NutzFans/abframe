<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="commonj.sdo.DataObject"%>
<%@ page import="java.util.Map" %>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="org.json.simple.JSONObject"%>
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
								<input id="orgid" name="orgid" class="nui-hidden"/>
							</td>
							<td align="right" style="width: 80px">请假类型：</td>
							<td>
								<input id="leavetype" name="leavetype" class="nui-combobox" url="com.primeton.eos.ame_permanage.ame_leavepro.getLeaveType.biz.ext" valueField="leavetypeid" textField="leavetype" dataField="leavetypes" style="width: 110px" required="true" onvaluechanged="changetype"/>
							</td>
							<td align="right" style="width: 80px">岗位代理人：</td>
							<td>
								<input id="postagent" name="postagent" class="nui-buttonedit" 
									onbuttonclick="selectOmEmployee" allowInput="false" style="width: 110px"/>
							</td>
						</tr>
						<tr>
							<td align="right" valign="top" >请假事由：</td>
							<td colspan="7">
								<input name="reason" class="nui-textarea" vtype="maxLength:250" required = "true" style="width: 740px" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		<fieldset id="field_nj" style="border: solid 1px #aaa;padding: 3px;width: 1000px;display: none">
			<legend>我的年假信息</legend>
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
	                <div field="bonusvac" width="80" align="center" headerAlign="center" >奖励年假天数 </div>
	                <div field="vacdays" width="50" align="center" headerAlign="center" >当年可用</div>
	                <div field="lastrest" width="50" align="center" headerAlign="center" >上年剩余 </div>
	                <div field="overvac" width="90" align="center" headerAlign="center" >当年春节统筹休假</div> 
	                <div field="daysoff" width="80" align="center" headerAlign="center" >当年已休</div> 
	                <div field="restbonus" width="90" align="center" headerAlign="center" >当年奖励剩余</div> 
	                <div field="nowrestvac" width="80" align="center" headerAlign="center" >当前可休年假 </div> 
	            </div>
	        </div>
		</fieldset>
		
		<fieldset id="field11" style="border: solid 1px #aaa;padding: 3px;width: 97%">
			<legend>请假详情</legend>
			<div class="nui-toolbar" style="border-bottom: 0;padding: 0px;" id="button_inorgid1">
	            <table style="width: 100%;">
	            	<tr>
	                    <td style="width: 20%;">
	                        <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addleave()">增加</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeleave()">删除</a>
	                    </td>
	                </tr>
	             </table>           
	        </div>
	    	<div id="grid_leave" class="nui-datagrid" style="height: auto;" allowCellSelect="true" 
	    	url="com.primeton.eos.ame_permanage.ame_leavepro.queryLeaveDetail.biz.ext" dataField="leavedetail"
	    	showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="calDays" showSummaryRow="true" ondrawsummarycell="drawsum">
	            <div property="columns">
	            	<div type="checkcolumn" width="10">&nbsp;</div>
	                <div field="startdate" width="110" align="center" headerAlign="center" vtype="required:true" renderer="onDealDate">开始日期
	                	<input property="editor" class="nui-datepicker"  required="true"/>
	                </div>
	                <div field="sptype" width="60" renderer="dictype" align="center" vtype="required:true" headerAlign="center">开始时段
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_TIMEPERIOD" required="true"/>
	                </div>
	                <div field="enddate" width="110" align="center" headerAlign="center" vtype="required:true" renderer="onDealDate">结束日期
	                	<input property="editor" class="nui-datepicker"  required="true"/>
	                </div>
	                <div field="eptype" width="60" renderer="dictype" align="center" vtype="required:true" headerAlign="center">结束时段
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_TIMEPERIOD" required="true"/>
	                </div>
	                <div field="days" name="days" width="60" align="right" vtype="required:true" headerAlign="center" numberFormat="n1" summaryType="sum">请假天数
	                </div> 
	            </div>
	        </div>
		</fieldset>
		<div><span style="color: red">请假审批规则：三天以内直属主管审批；三天以上（包括三天）七天以内直属主管+上级主管审批；七天以上（包括七天）直属主管+上级主管+再上级主管审批。</span></div>
		<div><span>项目组成员需要增加项目经理作为审批人，请选择附加审批人：</span><input id="spr" class="mini-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" style="width:200px;" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext"><!-- <a class = "nui-button" onclick="">选择附加审批人</a> --></div>
		<!-- <div style="line-height: 30px;"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;附加审批人：</span><span style="color:red">  除部门领导的其他审批人例如：项目经理等</span></div> -->
		<div style="line-height: 30px;"><span>审批通过邮件通知抄送人：</span><input id="cclist" class="nui-textboxlist" onvaluechanged="changecc" onremoveitem="removecc" allowInput="true" textField="EMPNAMES" valueField="OEMAIL" searchField="name" style="width:450px;"  url="com.primeton.mis.contract.contractApproval.getEmpByName.biz.ext" /><span style="color:red"> （需要补充部门助理以及其他需要告知的人）</span></div>
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
	</div>。
</div>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-checkbox" style="width:100px;margin-left: 2px;float: left;" id="guanZhuButton">关注</a>
	<a class="nui-button" onclick="onOk('1')" id="creatLeave" style="width: 80px;margin-right: 20px;">提交</a>
	<a class="nui-button" onclick="onOk('0')" id="saveLeave" style="width: 80px;margin-right: 20px;">暂时保存</a>
	<a class="nui-button" onclick="onOk('2')" id="zzLeave" style="width: 80px;margin-right: 20px;">终止流程</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;margin-right: 200px;" id="canelButton">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	<%
   		UserObject user = (UserObject) session.getAttribute("userObject");
   		Map<String,Object> a = user.getAttributes();
   		DataObject[] orgs = (DataObject[])a.get("orgs");
   		int orglen = orgs.length;
		JSONObject orglist = new JSONObject();
		for(int i=0;i<orgs.length;i++){
			JSONObject orgTemp = new JSONObject();
			orgTemp.put("orgid",orgs[i].get("orgid"));
			orgTemp.put("orgname",orgs[i].get("orgname"));
			orglist.put(i, orgTemp);
		}
    %>
	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
  	var form_leave = new nui.Form("form_leave");//请假申请信息
  	var grid_leave = nui.get("grid_leave");//请假明细
  	var grid_leave1 = nui.get("grid_leave1");//年假记录
  	var opioionform = new nui.Form("opioionform");//审核意见
  	var processinstid;//流程实例id
  	var leaverule;//请假天数计算规则
	var filetips;//附件提示
	var limitdays;//最高请假天数
	var isreg;//是否常规请假
  	
	document.getElementById("salesEdit").style.display="none";
  	
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
       	  		changetype();//不同请假类型处理
       	  		nui.get("cclist").setValue(o.leaveinfo.cclist);
       	  		nui.get("cclist").setText(o.leaveinfo.cclistname);//抄送人
       	  		nui.get("spr").setValue(o.leaveinfo.addspr);//附加审批人
       	  		nui.get("spr").setText(o.leaveinfo.addsprname);
       	  		nui.get("postagent").setText(o.leaveinfo.agentname);//岗位代理人
       	  		nui.get("leavetype").setText(o.leaveinfo.leavetypename);//请假类型
  				var processInstID = o.leaveinfo.processinstid;
  				processinstid= o.leaveinfo.processinstid;
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
				initMisOpinion({auditstatus: "4"});
				nui.get("auditopinion").setValue("");
			
				var json = {leaveid: o.leaveinfo.leaveid};
  				grid_leave.load(json);//加载行程详情
  				
  				//加载附件
  				var grid_0 = nui.get("grid_0");
  				grid_0.load({"groupid":"ameLeave","relationid":o.leaveinfo.leaveid});
				grid_0.sortBy("fileTime","desc");
  				
  				if(o.leaveinfo.leavetype=="1"){//年假
					$("#field_nj").show();
					grid_leave1.load({userid:nui.get("userid").getValue(),processinstid:processinstid});
				}else{
					$("#field_nj").hide();
				}
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
  	}
	var type ; //发起还是暂存
    function onOk(e){
    	var leaveinfo = form_leave.getData();//请假信息
    	var leavedetail = grid_leave.getData();//请假记录
    	var filePaths = document.getElementsByName("uploadfile1").length;
    	for(var j = 0;j < filePaths;j++){
    		var a = document.getElementsByName("uploadfile1")[j].files.length;
    		if(a == 0){
    			nui.alert("新增附件不可以为空");
    			return false;
    		}
    	}
    	if(e == "1"){//发起
			if(!form_leave.validate()){
				nui.alert("表单信息填写不完整，请确认必输项是否填写!");
				return;
			}
			if(leavedetail.length == 0){
				nui.alert("请填写请假记录！");
				return false;
			}
			grid_leave.validate();
			if(grid_leave.isValid()==false){
				nui.alert("请假详情填写不完整，请确认必输项是否填写!");
				return;
			}
			for(var i=0;i<leavedetail.length;i++){
				for(var j=0;j<leavedetail.length;j++){
					if(i!=j){
						if(judgeDate(leavedetail[i],leavedetail[j])==false){
							nui.alert("日期区间有重复，请检查并修改！");
							return;
						}
					}
				}
			}
			
			//判断是否已请过假
			var isleaves=false;
			var json1 = {"criteria": 
  								{"_expr[0]":
  									{"_property":"leaveid","_op":"in","_ref":"1"}
  								,
  								"_ref[0]":
  									{"_id":"1","_entity":"com.primeton.eos.ame_permanage.ame_permanage.AmeLeaveinfo",
  										"_expr[0]":
  										{"_property":"userid","_value":leaveinfo.userid},
  										"_select":{"_field[0]":"leaveid"},
  									"_expr[1]":{"_property":"status","_op":"<>","_value":"-2"}
  									},
  									"_expr[1]":{"_property":"leaveid","_op":"<>","_value":leaveinfo.leaveid}
  								
  								}
  								,"sortOrder":"desc","sortField":"startdate"};
			nui.ajax({//获取请假记录	
	      		url: "com.primeton.eos.ame_permanage.ame_leavepro.queryDetail.biz.ext",
		      	type: 'POST',
	          	data: json1,
	          	async:false,
	      		success: function (text) {
	      			var leavedetail1 = text.leavedetail;
	      			for(var i=0;i<leavedetail1.length;i++){
						for(var j=0;j<leavedetail.length;j++){
							if(judgeDate(leavedetail1[i],leavedetail[j])==false){
								isleaves=true;
							}
						}
					}
	          	},
		      	error: function (jqXHR, textStatus, errorThrown) {
		        	alert(jqXHR.responseText);
		      	}
	    	});
	    	if(isleaves==true){
	    		nui.alert("存在已请过假的日期，请检查并修改！");
				return;
	    	}
	    	
	    	var totaldays = $(grid_leave.getSummaryCellEl("days")).find("b").text();//总天数
	    	
	    	if(limitdays!=null&&limitdays!=""&limitdays!=0){
	    		if(totaldays>limitdays){
		    		nui.alert("该类型请假总天数不能超过"+limitdays+"天，请检查并修改！");
					return;
	    		}
	    	}
	    	
	    	
	    	if(leaveinfo.leavetype=="1"){//如果是年假
		    	//我的年假信息
		    	var vacs = grid_leave1.getData();
		    	if(vacs.length==0){
		    		nui.alert("我的年假信息未初始化，请联系HR添加！");
		    		return;
		    	}else{
		    		if(vacs[0].nowrestvac){
			    		if(parseFloat(totaldays)>parseFloat(vacs[0].nowrestvac)){
			    			nui.alert("申请休得年假天数超过当前剩余年假，请检查并修改！");
			    			return;
			    		}
		    		}else{
		    			nui.alert("申请休得年假天数超过当前剩余年假，请检查并修改！");
		    			return;
		    		}
		    	}
	    	}
			nui.confirm("提醒：请假申请邮件通知要抄送给部门助理。请确认是否提交流程？","操作提示",function(o){
				if("ok" == o){
	        		type = 1;
					document.getElementById("fileCatalog1").value="ameLeave";
		        	form4.submit();
	        	}
	        });
    	}else if(e == "0"){//暂存
    		for(var i=0;i<leavedetail.length;i++){
				for(var j=0;j<leavedetail.length;j++){
					if(i!=j){
						if(judgeDate(leavedetail[i],leavedetail[j])==false){
							nui.alert("日期区间有重复，请检查并修改！");
							return;
						}
					}
				}
			}
			
			//判断是否已请过假
			var isleaves=false;
			var json1 = {"criteria": 
  								{"_expr[0]":
  									{"_property":"leaveid","_op":"in","_ref":"1"}
  								,
  								"_ref[0]":
  									{"_id":"1","_entity":"com.primeton.eos.ame_permanage.ame_permanage.AmeLeaveinfo",
  										"_expr[0]":
  										{"_property":"userid","_value":leaveinfo.userid},
  										"_select":{"_field[0]":"leaveid"},
  									"_expr[1]":{"_property":"status","_op":"<>","_value":"-2"}
  									},
  									"_expr[1]":{"_property":"leaveid","_op":"<>","_value":leaveinfo.leaveid}
  									
  								
  								}
  								,"sortOrder":"desc","sortField":"startdate"};
			nui.ajax({//获取请假记录	
	      		url: "com.primeton.eos.ame_permanage.ame_leavepro.queryDetail.biz.ext",
		      	type: 'POST',
	          	data: json1,
	          	async:false,
	      		success: function (text) {
	      			var leavedetail1 = text.leavedetail;
	      			for(var i=0;i<leavedetail1.length;i++){
						for(var j=0;j<leavedetail.length;j++){
							if(judgeDate(leavedetail1[i],leavedetail[j])==false){
								isleaves=true;
							}
						}
					}
	          	},
		      	error: function (jqXHR, textStatus, errorThrown) {
		        	alert(jqXHR.responseText);
		      	}
	    	});
	    	if(isleaves==true){
	    		nui.alert("存在已请过假的日期，请检查并修改！");
				return;
	    	}
    		nui.confirm("是否暂存请假申请流程？暂时保存后可以在待办任务中进行查询处理！","操作提示",function(o){
	        	if("ok" == o){
	        		type = 0;
	        		document.getElementById("fileCatalog1").value="ameLeave";
		        	form4.submit();
	        	}
	        });
    	}else if(e == "2"){//终止
    		nui.confirm("是否确认终止流程？","操作提示",function(o){
	        	if("ok" == o){
	        		type = 2;
	        		//终止流程设置操作为2终止
                	nui.get("auditstatus").setValue(2);
                	form4.submit();
	        	}
	        });
    	}
    }
    
    //附件提交后触发
    function SaveData1(){
    	mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: '操作中...'
        });
        
        var leaveinfo = form_leave.getData();//请假信息
    	var leavedetail = grid_leave.getChanges();//请假记录
		var misOpinion = opioionform.getData().misOpinion;//审核意见
		var guanZhu = nui.get("guanZhuButton").getValue();//是否关注
		leaveinfo.guanZhu = guanZhu;//是否关注
		leaveinfo.applydate = new Date();//申请日期，默认当前日期
		leaveinfo.totaldays = $(grid_leave.getSummaryCellEl("days")).find("b").text();
		leaveinfo.spr = nui.get("spr").getValue();//附加审批人
		leaveinfo.cclist = nui.get("cclist").getValue();//邮件通知抄送人
		leaveinfo.cclistname = nui.get("cclist").getText();//邮件通知抄送人
		leaveinfo.isreg = isreg;//是否常规请假
		var minstart;//最小请假开始日期
    	for(var i=0;i<leavedetail.length;i++){
    		if(minstart==null||minstart==""){
    			minstart = leavedetail[i].startdate;
    		}else{
    			if(leavedetail[i].startdate<minstart){
    				minstart = leavedetail[i].startdate;
    			}
    		}
    	}
    	leaveinfo.minstart = minstart;//最小请假开始日期
		if(type==0){
			leaveinfo.pstatus = "0";//暂时保存
		}else if(type==1){
			leaveinfo.pstatus = "1";//发起流程
		}else if(type==2){
			leaveinfo.pstatus = "2";//终止流程
		}
		if(leaveinfo.leavetype=="3"){//如果是病假并且没有提交附件则一定需要补充材料
			var filePaths = document.getElementsByName("uploadfile1").length;
	    	if(filePaths==0){
	    		leaveinfo.isneedcl="1";
	    	}else{
	    		leaveinfo.isneedcl="0";
	    	}
		}else{
			leaveinfo.isneedcl="0";
		}
		
		leaveinfo.leavetypename = nui.get("leavetype").getText();//请假类型
		var json = {leaveinfo:leaveinfo,misOpinion:misOpinion,leavedetail:leavedetail};
    	//按钮禁用
    	nui.get("creatLeave").disable();
    	nui.get("saveLeave").disable();
    	nui.get("zzLeave").disable();
    	nui.ajax({	
      		url: "com.primeton.eos.ame_permanage.ame_leavepro.saveLeavePro.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (text) {
      			nui.unmask();
      			if(text.result == "1"){
      				if(type==1){
	                   	nui.alert("流程提交成功！","系统提示",function (){
	                   		CloseWindow("ok");
	                   	});
    				}else if(type==0){
    					nui.alert("暂时保存成功！","系统提示",function (){
    						CloseWindow("ok");
    					});
    				}else if(type==2){
    					nui.alert("终止成功！","系统提示",function (){
    						CloseWindow("ok");
    					});
    				}
      			}else {
      				nui.get("creatLeave").enable();
    				nui.get("saveLeave").enable();
    				nui.get("zzLeave").enable();
    				if(type==1){
	                   	nui.alert("发起流程失败！");
    				}else if(type==0){
    					nui.alert("暂时保存失败！");
    				}else if(type==2){
    					nui.alert("终止失败！");
    				}
      			}
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
    }
    
    
    //增加请假明细
    function addleave(){
    	var rowS = {name: "New Row"} 
		grid_leave.addRow(rowS);
    }
    
	//删除请假明细
	function removeleave(){
		var rows = grid_leave.getSelecteds();
        if (rows.length>0) {
            grid_leave.removeRows(rows, true);
        }else{
        	nui.alert("请至少选中一条记录！");
        }
	}
	
	//日期格式化
	function onDealDate(e){
		if(e.value){
			return e.value.substring(0,10);
		}
	}
	
	//计算请假天数
	function calDays(e){
		var record=e.record;
		var field = e.field;
		if(e.field=="startdate" || e.field=="sptype" ||e.field=="enddate" ||e.field=="eptype"){
			if(record.startdate && record.sptype && record.enddate && record.eptype){
				calLeaveDays(record.startdate,record.sptype,record.enddate,record.eptype,record._uid);
			}
		}
		//开始日期不能大于结束日期
		if(e.field=="startdate"){
			if(record.enddate){
				if(record.startdate>record.enddate){
					nui.alert("开始日期不能大于结束日期，请重新填写!")
					var rowData={startdate:null};
					grid_leave.updateRow(row,rowData);
				}else if(record.startdate==record.enddate){
					if(record.sptype=="pm"  && record.eptype=="am"){
						nui.alert("开始日期不能大于结束日期，请重新填写!")
						var rowData={startdate:null};
						grid_leave.updateRow(row,rowData);
					}
				}
			}
		}
		if(e.field=="enddate"){
			if(record.startdate){
				if(record.startdate>record.enddate){
					nui.alert("开始日期不能大于结束日期，请重新填写!")
					var rowData={enddate:null};
					grid_leave.updateRow(row,rowData);
				}else if(record.startdate==record.enddate){
					if(record.sptype=="pm"  && record.eptype=="am"){
						nui.alert("开始日期不能大于结束日期，请重新填写!")
						var rowData={enddate:null};
						grid_leave.updateRow(row,rowData);
					}
				}
			}
		}
		if(e.field=="sptype"){
			if(record.startdate==record.enddate&&record.sptype=="pm"  && record.eptype=="am"){
				nui.alert("开始日期不能大于结束日期，请重新填写!")
				var rowData={sptype:null};
				grid_leave.updateRow(row,rowData);
			}
		}
		if(e.field=="eptype"){
			if(record.startdate==record.enddate&&record.sptype=="pm"  && record.eptype=="am"){
				nui.alert("开始日期不能大于结束日期，请重新填写!")
				var rowData={eptype:null};
				grid_leave.updateRow(row,rowData);
			}
		}
	}
	
	//计算请假天数
	function calLeaveDays(startdate,sptype,enddate,eptype,uid){
		var json = {startdate:startdate,sptype:sptype,enddate:enddate,eptype:eptype,leaverule:leaverule};
  		nui.ajax({	
	    	url: "com.primeton.eos.ame_permanage.ame_leavepro.getDays.biz.ext",
            type: 'POST',
            data: json,
            success: function (text) {
            	var row = grid_leave.getRowByUID(uid);
            	var rowData={days:text.days};
				grid_leave.updateRow(row,rowData);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
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
	
	function onCancel(e) {
        CloseWindow("cancel");
    }
    //标准方法接口定义
    function CloseWindow(action) {           
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }
    
   //判断日期区间是否有重复
	function judgeDate(data1,data2){
		var startdate1=data1.startdate;
		var startdate2=data2.startdate;
		var enddate1=data1.enddate;
		var enddate2=data2.enddate;
		if(typeof(startdate1)=="string"){
			startdate1 = startdate1.substring(0,10);
		}
		if(typeof(startdate2)=="string"){
			startdate2 = startdate2.substring(0,10);
		}
		if(typeof(enddate1)=="string"){
			enddate1 = enddate1.substring(0,10);
		}
		if(typeof(enddate2)=="string"){
			enddate2 = enddate2.substring(0,10);
		}
		var date1s = new Date(startdate1).getTime();
		var date2s = new Date(startdate2).getTime();
		var date1e = new Date(enddate1).getTime();
		var date2e = new Date(enddate2).getTime();
		if((date2s<date1s&&date1s<date2e) || (date2s<date1e&&date1e<date2e) ||(date1s<date2s&&date2s<date1e) || (date1s<date2e&&date2e<date1e)){
			return false;
		}else{
			if((date1s==date2s)||(date1e==date2e)){
				if((date1e==date2s && data1.eptype=="am" && data2.sptype=="pm")||(date2e==date1s && data2.eptype=="am" && data1.sptype=="pm")){
					return true;
				}else{
					return false;
				}
			}else{
				if((date1s == date2e&&(data1.sptype=="am"||data2.eptype=="pm"))||(date2s == date1e&&(data2.sptype=="am"||data1.eptype=="pm"))){
					return false;
				}else{
					return true;
				}
			}
		}
	}
	
	//请假类型改变时触发
	function changetype(){
		var json = {leavetypeid:nui.get("leavetype").getValue()}
		nui.ajax({	
            url: "com.primeton.eos.ame_permanage.ame_leavepro.getLeaveType.biz.ext",
            type: 'POST',
            data: json,
            success: function (text) {
            	leaverule=text.leavetypes[0].leaverule;
            	limitdays = text.leavetypes[0].limitdays;
            	filetips = text.leavetypes[0].filetips;
            	isreg = text.leavetypes[0].isreg;
            	if(filetips){
					$("#filetips").show();
					$("#tips").text(filetips);
				}else{
					$("#filetips").hide();
				}
				//重新计算请假天数
				var leavedetail = grid_leave.getData();
				for(var i=0;i<leavedetail.length;i++){
					if(leavedetail[i].startdate&&leavedetail[i].sptype&&leavedetail[i].enddate&&leavedetail[i].eptype){
						calLeaveDays(leavedetail[i].startdate,leavedetail[i].sptype,leavedetail[i].enddate,leavedetail[i].eptype,leavedetail[i]._uid);
					}
				}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
		
		if(nui.get("leavetype").getValue()=="1"){//年假
			$("#field_nj").show();
			if(grid_leave1.getData().length==0){
				grid_leave1.load({userid:nui.get("userid").getValue(),processinstid});
			}
		}else{
			$("#field_nj").hide();
		}
	}
	
	/**
         *	选择岗位代理人
         */
    function selectOmEmployee(){
    	var btnEdit = this;
        nui.open({
        url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择岗位代理人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                        btnEdit.setValue(data.userid);
                        btnEdit.setText(data.empname);
                    }
                }
            }
        });
    }
    
    //请假邮件组不能删除
    function changecc(e){
    	if(e.value.indexOf("qingjia@primeton.com")==-1){
    		nui.alert("请假邮件组不能删除！");
    		if(e.value){
	    		nui.get("cclist").setValue("qingjia@primeton.com,"+e.value);
	    		nui.get("cclist").setText("请假&lt;qingjia@primeton.com&gt;,"+nui.get("cclist").getText());
    		}else{
    			nui.get("cclist").setValue("qingjia@primeton.com");
	    		nui.get("cclist").setText("请假&lt;qingjia@primeton.com&gt;");
    		}
    	}
    }
	
</script>
</html>