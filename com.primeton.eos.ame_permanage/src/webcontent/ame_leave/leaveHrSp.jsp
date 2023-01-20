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
     .myIndex{
        background:#FFF68F;
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
							<td align="right" style="width: 80px">工号：</td>
							<td>
								<input name="empcode" class="nui-textbox" readonly="readonly" style="width: 110px"/>
							</td>
							<td align="right" style="width: 80px">性别：</td>
							<td>
								<input name="gender" class="nui-textbox" readonly="readonly" style="width: 110px"/>
							</td>
							<td align="right" style="width: 80px">所属公司：</td>
							<td>
								<input  name="company" class="nui-textbox" readonly="readonly" style="width: 110px"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 80px">入职日期：</td>
							<td>
								<input id="indate" name="indate" class="nui-datepicker" style="width: 110px" readonly="readonly"/>
							</td>
							<td align="right" style="width: 80px">员工属性：</td>
							<td>
								<input id="emptype" name="emptype" class="nui-dictcombobox"  dictTypeId="EMP_TYPE" style="width: 110px" required="false" readonly="readonly"/>
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
							<td colspan="9">
								<input name="reason" class="nui-textarea" vtype="maxLength:250" required = "true" style="width: 905px" />
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		<fieldset id="field11" style="border: solid 1px #aaa;padding: 3px;width: 97%">
			<legend>本次请假详情</legend>
			<div class="nui-toolbar" style="border-bottom: 0;padding: 0px;" id="button_inorgid1">
	            <table style="width: 100%;">
	            	<tr>
	                    <td style="width: 20%;">
	                        <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addRow('grid_leave')">增加</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeRow('grid_leave')">删除</a>
	                    </td>
	                </tr>
	             </table>           
	        </div>
	    	<div id="grid_leave" class="nui-datagrid" style="height: auto;" allowCellSelect="true" 
	    	url="com.primeton.eos.ame_permanage.ame_leavepro.queryLeaveDetail.biz.ext" dataField="leavedetail"
	    	showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="calDays" showSummaryRow="true" ondrawsummarycell="drawsum">
	            <div property="columns">
	            	<div type="checkcolumn" width="10">&nbsp;</div>
	                <div field="startdate" width="110" align="center" headerAlign="center" vtype="required:true" renderer="onDealDate" cellCls="myIndex">开始日期
	                	<input property="editor" class="nui-datepicker"  required="true"/>
	                </div>
	                <div field="sptype" width="60" renderer="dictype" align="center" vtype="required:true" headerAlign="center" cellCls="myIndex">开始时段
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_TIMEPERIOD" required="true"/>
	                </div>
	                <div field="enddate" width="110" align="center" headerAlign="center" vtype="required:true" renderer="onDealDate" cellCls="myIndex">结束日期
	                	<input property="editor" class="nui-datepicker"  required="true"/>
	                </div>
	                <div field="eptype" width="60" renderer="dictype" align="center" vtype="required:true" headerAlign="center" cellCls="myIndex">结束时段
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_TIMEPERIOD" required="true"/>
	                </div>
	                <div field="days" name="days" width="60" align="right" vtype="required:true" headerAlign="center" numberFormat="n1" summaryType="sum">请假天数
	                </div> 
	            </div>
	        </div>
		</fieldset>
		
		<fieldset id="field_nj" style="border: solid 1px #aaa;padding: 3px;width: 1000px;">
			<legend>申请人年假信息</legend>
	    	<div id="grid_leave1" class="nui-datagrid" style="width: 100%;height: auto;" allowCellSelect="true" 
	    		 url="com.primeton.eos.ame_permanage.ame_leavepro.getEmpVac.biz.ext" dataField="vacs"
	    		 showPager="false" allowCellEdit="true" multiSelect="true" oncellendedit="doCal_EmpVac">
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
	                <div field="daysoff" width="80" align="center" headerAlign="center" cellCls="myIndex" >当年已休
	                	<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
	                </div> 
	                <div field="restbonus" width="90" align="center" headerAlign="center" >当年奖励剩余</div> 
	                <div field="nowrestvac" width="80" align="center" headerAlign="center" >当前可请年假 </div> 
	            </div>
	        </div>
		</fieldset>
		
		<fieldset style="border: solid 1px #aaa;padding: 3px;width: 97%" id = "yearvac">
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
		
		<fieldset style="border: solid 1px #aaa;padding: 3px;width: 60%" id="sprlists">
			<legend>部门审批人列表</legend>
			<div class="nui-toolbar" style="border-bottom: 0;padding: 0px;" id="button_inorgid1">
	            <table style="width: 100%;">
	            	<tr>
	                    <td style="width: 20%;">
	                        <a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addRow('grid_spr')">增加</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeRow('grid_spr')">删除</a>
	                    </td>
	                </tr>
	             </table>           
	        </div>
	    	<div id="grid_spr" class="nui-datagrid" style="height: auto;" allowCellSelect="true" 
	    	url="com.primeton.eos.ame_permanage.ame_leavepro.getSprInfo.biz.ext" dataField="sprdata"
	    	showPager="false" allowCellEdit="true" multiSelect="true">
	            <div property="columns">
	            	<div type="checkcolumn" width="5">&nbsp;</div>
	                <div field="splevel" width="20" align="center" headerAlign="center" vtype="required:true">审批顺序
	                	<input property="editor" class="nui-textbox"  required="true"/>
	                </div>
	                <div field="userid" width="80" displayField="empname" align="center" vtype="required:true" headerAlign="center">部门审批人
	                	<input property="editor" class="nui-textboxlist"  searchField="name" 
        						url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext"
        						textField="EMPNAME" valueField="USERID" />
	                </div>
	            </div>
	        </div>
		</fieldset>
		
		<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;width: 97%">
			<legend>请假附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
			<jsp:include page="/ame_common/addFiles1.jsp"/>
		</fieldset>
		<div id = "cl"><span size='5' style="color: red"><b>是否需要申请人补充材料:</b></span><input id ="isneedcl" class="nui-checkbox"></div>
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
  	var grid_leave1 = nui.get("grid_leave1");//年假记录
  	var grid_spr = nui.get("grid_spr");//部门审批人列表
  	var opioionform = new nui.Form("opioionform");//审核意见
  	var leaverule;//请假天数计算规则
	var filetips;//附件提示
	var limitdays;//最高请假天数
	var isreg;//是否常规请假
	var activityDefID;//当前环节
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
  				leaverule = o.leaveinfo.leaverule;
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
  				//加载附件
	  				var grid_0 = nui.get("grid_0");
	  				grid_0.load({"groupid":"ameLeave","relationid":o.leaveinfo.leaveid});
					grid_0.sortBy("fileTime","desc");
				activityDefID =o.workitem.activityDefID; 
				if(o.workitem.activityDefID=="manualActivity11"){//申请人补充资料后复核隐藏部门审批人列表、本年度请假记录、是否需要补充材料
					//$("#yearvac").hide();
					$("#sprlists").hide();
					$("#cl").hide();
				}else{
	  				grid_spr.load({processinstid: processInstID})//加载部门审批人列表
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
	  				
				}
				
				if(o.leaveinfo.leavetype=="1"){//年假
					//$("#field_nj").show();
					grid_leave1.load({userid:nui.get("userid").getValue()});
				}else{
					//$("#field_nj").hide();
				}
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
  	}
    function onOk(e){
    	var leaveinfo = form_leave.getData();//请假信息
    	var leavedetail = grid_leave.getData();//请假记录
    	var sprdata = grid_spr.getData();//部门审批人
    	var auditstatus = nui.get("auditstatus").getValue();
    	if(auditstatus=="2"){//审批意见为终止时不做任何校验
    	}else{
	    	if(auditstatus=="1"){//审批意见为通过时校验
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
				
				var totaldays = $(grid_leave.getSummaryCellEl("days")).find("b").text();//总天数
		    	
		    	if(limitdays!=null&&limitdays!=""&limitdays!=0){
		    		if(totaldays>limitdays){
			    		nui.alert("该类型请假总天数不能超过"+limitdays+"天，请检查并修改！");
						return;
		    		}
		    	}
		    	
		    	if(leaveinfo.leavetype=="1"){//如果是年假
			    	//年假信息
			    	var vacs = grid_leave1.getData();
			    	if(vacs.length==0){
			    		nui.alert("年假信息未初始化，请联系HR添加！");
			    		return;
			    	}else{
			    		if(vacs[0].nowrestvac<0){
			    			nui.alert("申请休得年假天数超过当前剩余年假，请检查并修改！");
			    			return;
			    		}
			    	}
		    	}
				if(activityDefID=="manualActivity11"){//复核环节不校验部门审批人
				}else{
					if(sprdata.length==0){
						nui.alert("部门审批人不能为空，请检查并修改！");
						return;
					}
					grid_spr.validate();
					if(grid_spr.isValid()==false){
						nui.alert("部门审批人填写不完整，请确认必输项是否填写!");
						return;
					}
					
					for(var x=0;x<sprdata.length;x++){
						for(var y=0;y<sprdata.length;y++){
							if(y!=x){
								if(sprdata[y].splevel==sprdata[x].splevel){
									nui.alert("部门审批层级有重复，请检查并修改！");
									return;
								}
							}
						}
					}
					
					if(checkSpr(sprdata)==true){
						nui.alert("部门审批人有重复，请检查并修改！");
						return;
					}
				}
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
	  								
	  							,"sortOrder":"desc","sortField":"startdate","t":new Date()};
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
		    	
    	}
	    	
		nui.confirm("是否提交？","操作提示",function(o){
        	if("ok" == o){
        		type = 1;
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
    	var leavedetail = grid_leave.getChanges();//请假记录
		var misOpinion = opioionform.getData().misOpinion;//审核意见
		leaveinfo.applydate = new Date();//申请日期，默认当前日期
		leaveinfo.totaldays = $(grid_leave.getSummaryCellEl("days")).find("b").text();
		var sprdata = grid_spr.getData();//部门审批人
		sprdata.sort(sortLevel);//按审批层级排序
		if(nui.get("isneedcl").getValue()=="true"){
			leaveinfo.isneedcl=1;
		}else{
			leaveinfo.isneedcl=0;
		}
		leaveinfo.leavetypename = nui.get("leavetype").getText();//请假类型
		var empVac = grid_leave1.getChanges();
		var daysoff = null;
		if(empVac.length>0){
			daysoff = empVac[0].daysoff;
		}
		var json = {leaveinfo:leaveinfo,misOpinion:misOpinion,leavedetail:leavedetail,sprdata:sprdata,"daysoff":daysoff};
    	//按钮禁用
    	nui.get("creatLeave").disable();
    	nui.ajax({	
      		url: "com.primeton.eos.ame_permanage.ame_leavepro.saveLeaveProHr.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (text) {
      			nui.unmask();
      			if(text.result == "1"){
                   	nui.alert("流程提交成功！","系统提示",function (){
                   		CloseWindow("ok");
                   	});
      			}else {
      				nui.get("creatLeave").enable();
    				nui.alert("流程提交失败！");
      			}
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
    }
    
      //增加请假明细
    function addRow(gridTemp){
    	var grid = nui.get(gridTemp);
    	var rowS = {name: "New Row"} 
		grid.addRow(rowS);
    }
    
	//删除请假明细
	function removeRow(gridTemp){
		var grid = nui.get(gridTemp);
		var rows = grid.getSelecteds();
        if (rows.length>0) {
            grid.removeRows(rows, true);
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
    
    //计算请假天数
	function calDays(e){
		var record=e.record;
		var field = e.field;
		var row = grid_leave.getRowByUID(record._uid);
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
			//$("#field_nj").show();
			if(grid_leave1.getData().length==0){
				grid_leave1.load({userid:nui.get("userid").getValue()});
			}
		}else{
			//$("#field_nj").hide();
		}
	}
    
    //根据审批层级排序
    function sortLevel(a,b){  
       return a.splevel-b.splevel  
    }
    
    
    //检查审批人是否有重复
    function checkSpr(sprdata){
    	var sprs = new Array();//所有审批人对象
    	var isrepeat=false;//是否有重复，默认否
    	for(var i=0;i<sprdata.length;i++){
    		var sprinfo = sprdata[i].userid;
    		var sprinfos = sprinfo.split(",");
    		for(var j=0;j<sprinfos.length;j++){
	    		if(sprs.length==0){
		    		sprs.push(sprinfos[j]);
	    		}else{
	    			var sprlength = nui.clone(sprs).length;
	    			for(var x=0;x<sprlength;x++){
	    				if(sprs[x]==sprinfos[j]){
	    					isrepeat=true;
	    					break;
	    				}else{
	    					sprs.push(sprinfos[j]);
	    				}
	    			}
	    		}
    		}
    	}
    	return isrepeat;
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
	function doCal_EmpVac(e){
		var rows1 = e.record;
		//vacdays+lastrest-overvac-daysoff-leavetotaldays=nowrestvac
		var vacdays = 0.00;
		var lastrest = 0.00;
		var overvac = 0.00;
		var daysoff = 0.00;
		var leavetotaldays = 0.00;
		var nowrestvac = 0.00;
		
		if(rows1.vacdays != "" && rows1.vacdays != null){
			vacdays = parseFloat(rows1.vacdays);
		}
		if(rows1.lastrest != "" && rows1.lastrest != null){
			lastrest = parseFloat(rows1.lastrest);
		}
		if(rows1.overvac != "" && rows1.overvac != null){
			overvac = parseFloat(rows1.overvac);
		}
		if(rows1.daysoff != "" && rows1.daysoff != null){
			daysoff = parseFloat(rows1.daysoff);
		}
		if(rows1.leavetotaldays != "" && rows1.leavetotaldays != null){
			leavetotaldays = parseFloat(rows1.leavetotaldays);
		}
		
		nowrestvac = vacdays+lastrest-overvac-daysoff-leavetotaldays
		
		var rowData_x = {"nowrestvac":nowrestvac};
		grid_leave1.updateRow(rows1,rowData_x);
	}
</script>
</html>