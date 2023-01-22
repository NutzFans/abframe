<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-04 17:15:02
  - Description:
-->
<head>
	<title>各部门检查</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<link id="css_skin" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/coframe/tools/skins/skin1/style.css" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    .asLabel
    {
        border:0;background-color:#F5F5F5;cursor:default;    
    }
    </style>
</head>
<body>
<div class="nui-fit">
	<div title="" style="width: 100%;">
		<!-- 提示信息展示  -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<jsp:include page="/ame_permanage/ame_leave_apply/otherDeptLeavedetail.jsp"/>
		<%-- <fieldset id="vac">
			<legend>年假信息</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/vactionGrid.jsp"/>
		</fieldset --%>	
		<fieldset id="exprei">
			<legend>未完成报销</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/expReiListGrid.jsp"/>
		</fieldset>
		<fieldset id="expbei">
			<legend>未核销借款</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/expBeiListGrid.jsp"/>
		</fieldset>
		<fieldset id="project">
			<legend>当前负责项目</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/rdProjectGrid.jsp"/>
		</fieldset>
		<fieldset id="cont">
			<legend>当前负责合同</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/csContractGrid.jsp"/>
		</fieldset>
		<fieldset id="taskview">
			<legend>待办任务</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/tasklistGrid.jsp"/>
		</fieldset>
		<fieldset id="machineview">
			<legend>本人名下领用资产</legend>
			<div style="color: red;">提示：如该员工有资产信息，请联系员工完成资产交接处理后再执行本任务</div>
			<jsp:include page="/ame_permanage/ame_leave_apply/misMachineGrid.jsp"/>
		</fieldset>
		<fieldset id="dept">
			<legend>负责部门</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/orgGrid.jsp"/>
		</fieldset>
		<fieldset id="emp">
			<legend>负责员工</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/empGrid.jsp"/>
		</fieldset>
		<fieldset id="role">
			<legend>当前角色权限</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/operaRoleGrid.jsp"/>
		</fieldset>
		<fieldset id="checklist">
			<legend>核查要点</legend>
			<jsp:include page="/ame_common/checkList.jsp"/>
		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	
  	var form = new nui.Form("#form1");//申请信息
  	var opioionform = new nui.Form("opioionform");//审核意见
	//费用报销
	var expRei_grid = nui.get("expRei_grid");
	//费用借款
	var expBeiList_grid = nui.get("expBeiList_grid");
	var rdProject_grid = nui.get("rdProject_grid");
	var taskList_grid = nui.get("taskList_grid");
	var csContract_grid = nui.get("csContract_grid");
	var misMachine_grid = nui.get("misMachine_grid");
	var org_grid = nui.get("org_grid");
	var emp_grid = nui.get("emp_grid");
	//var operaRole_grid = nui.get("operaRole_grid");
    var grid_checklist = nui.get("grid_checklist");
	var activityDefID ;
	var omLeaveApply;
	var leaveid;
	
	var pdfjson = [];
	
	var userid="";
	var year =new Date().getFullYear();
	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
	
	//文件收件人
	var  leaveHR  =nui.getDictText('AME_SYSCONF','leaveHR');
	var  leaveBJadress  =nui.getDictText('AME_SYSCONF','leaveBJadress');
	var  leaveBJPhone  =nui.getDictText('AME_SYSCONF','leaveBJPhone');
	var  leaveSHadress  =nui.getDictText('AME_SYSCONF','leaveSHadress');
	var  leaveSHphone  =nui.getDictText('AME_SYSCONF','leaveSHphone');
	
    document.getElementById("choosehide").style.display="none";
    initMisOpinion({auditstatus:"1"});
	function initMisOpinion(data){
		//初始化处理意见
		var dataStatus=[{"dictID": 1,"dictName": "通过"},{"dictID": 2,"dictName": "终止流程"}];
		nui.get("auditstatus").setData(dataStatus);
		nui.get("auditstatus").setValue(data.auditstatus);
	}
	init();
	function init(){
		form.mask("数据加载中...");
		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		var json = {workItemID: <%=workItemID %>};
  		nui.ajax({//获取资产采购申请信息
      		url: "com.primeton.eos.ame_permanage.ame_leave_apply.getLeaveApply.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			form.unmask();
       	  		form.setData(o);
       	  		omLeaveApply = o.omLeaveApply;
       	  		userid=o.omLeaveApply.userid;
       	  		leaveid=o.omLeaveApply.leaveid;
                document.getElementById("userid").innerHTML = o.omLeaveApply.empname == null ?"": o.omLeaveApply.empname;
                document.getElementById("outdate").innerHTML = o.omLeaveApply.outdate == null ?"": o.omLeaveApply.outdate;
                document.getElementById("outplace").innerHTML = o.omLeaveApply.outplace == null ?"":  nui.getDictText('EXP_REGION',o.omLeaveApply.outplace);
                document.getElementById("hopedealoutdate").innerHTML = o.omLeaveApply.dealoutdate == null ?"": o.omLeaveApply.dealoutdate;
                document.getElementById("handuserid").innerHTML = o.omLeaveApply.handusername == null ?"": o.omLeaveApply.handusername;
                document.getElementById("mailretain").innerHTML = o.omLeaveApply.mailretain == null ?"": nui.getDictText('OM_LEAVE_MAIL',o.omLeaveApply.mailretain);
                document.getElementById("mailproxies").innerHTML = o.omLeaveApply.mailproxiesname == null ?"": o.omLeaveApply.mailproxiesname;
                document.getElementById("mailretaindate").innerHTML = o.omLeaveApply.mailretaindate == null ?"": o.omLeaveApply.mailretaindate;
                document.getElementById("empcode").innerHTML = o.omLeaveApply.empcode == null ?"": o.omLeaveApply.empcode;
                document.getElementById("indate").innerHTML = o.omLeaveApply.indate == null ?"": o.omLeaveApply.indate;
                document.getElementById("positionname").innerHTML = o.omLeaveApply.positionname == null ?"": o.omLeaveApply.positionname;
				expRei_grid.load({userid: userid},function(){//借款
					expBeiList_grid.sortBy("expid", "desc");
					expBeiList_grid.load({criteria:
										 {_expr:[{_property:"expstatus",_op:"in",_value:"5" },
										 {_property:"nohxje",_op:">",_value:"0" }
										 ],_not:[{_expr:[{_property:"exptype",_op:"=",_value:"D"}]}
										 ],_or:[{_expr:[{_property:"expuserid",_op:"=",_value:userid},
										 {_property:"transferuserid",_op:"=",_value:userid }]}
										 ]}
					},function(){//项目
						rdProject_grid.load({userid: userid},function(e){//合同
							if(e.result.rdprojects.length==0){
  								document.getElementById("project").style.display="none";
							}
							csContract_grid.load({userid: userid},function(e){//代办
								if(e.result.contracts.length==0){
  									document.getElementById("cont").style.display="none";
								}
								taskList_grid.load({userid: userid,type:"PRIVATE"},function(){//资产
									misMachine_grid.sortBy("id","desc");
									misMachine_grid.load({criteria:
													    {_expr:[{_property:"usingemp",_op:"=",_value:userid },
													    {_property:"status",_op:"in",_value:"0" }
													    ]}
									},function(){//部门
								  		org_grid.load({ctOrg:{_entity:"org.gocom.abframe.dataset.organization.OmOrganization",_expr:[{_property:"managerid",_op:"=",_value:o.omLeaveApply.empid},
												      {_property:"status",_op:"=",_value:"running" }
												      ]}
										},function(){//员工
											emp_grid.load({userid: userid},function(){//角色
												//operaRole_grid.load({userid:userid});
											});
										});
								  	});
								});
							});
						});
					});
				});
  				getEmpRole(userid);
				//保密协议
				var nature = omLeaveApply.nature;
				var company = omLeaveApply.company;
				if(nature == "2" || nature == "3" ){
					document.getElementById("secrecy").style.display="";
					if(company == "2"){
						document.getElementById("secrecyPrimeton").style.display="none";
						document.getElementById("secrecyZhiHui").style.display="";
						document.getElementById("secrecyNingBo").style.display="none";
					}else if(company == "3"){
						document.getElementById("secrecyPrimeton").style.display="none";
						document.getElementById("secrecyZhiHui").style.display="none";
						document.getElementById("secrecyNingBo").style.display="";
					}else{
						document.getElementById("secrecyPrimeton").style.display="";
						document.getElementById("secrecyZhiHui").style.display="none";
						document.getElementById("secrecyNingBo").style.display="none";
					}
				}
                var outtype = o.omLeaveApply.outtype;
                if(outtype =="2"){
	  				document.getElementById("leaveprint1").style.marginLeft="70px";
	  				document.getElementById("leaveprint").style.display="none";
                }
  				var processInstID = o.omLeaveApply.processinstid;
  				activityDefID = o.workitem.activityDefID;
  				if("manualActivity4" == activityDefID){//财务确认
	  				document.getElementById("project").style.display="none";
	  				document.getElementById("cont").style.display="none";
	  				document.getElementById("taskview").style.display="none";
	  				document.getElementById("machineview").style.display="none";
	  				document.getElementById("dept").style.display="none";
	  				document.getElementById("role").style.display="none";
	  				document.getElementById("mail").style.display="none";
	  				document.getElementById("emp").style.display="none";
  				}else if("manualActivity5" == activityDefID){//PMO确认
	  				document.getElementById("exprei").style.display="none";
	  				document.getElementById("expbei").style.display="none";
	  				document.getElementById("machineview").style.display="none";
	  				document.getElementById("dept").style.display="none";
	  				document.getElementById("role").style.display="none";
	  				document.getElementById("mail").style.display="none";
	  				document.getElementById("emp").style.display="none";
  				}else if("manualActivity6" == activityDefID){//行政确认
	  				document.getElementById("exprei").style.display="none";
	  				document.getElementById("expbei").style.display="none";
	  				document.getElementById("project").style.display="none";
	  				document.getElementById("cont").style.display="none";
	  				document.getElementById("taskview").style.display="none";
	  				document.getElementById("dept").style.display="none";
	  				document.getElementById("role").style.display="none";
	  				document.getElementById("mail").style.display="none";
	  				document.getElementById("emp").style.display="none";
  				}else if("manualActivity7" == activityDefID){//MIS确认
	  				document.getElementById("exprei").style.display="none";
	  				document.getElementById("expbei").style.display="none";
	  				document.getElementById("project").style.display="none";
	  				document.getElementById("cont").style.display="none";
	  				document.getElementById("machineview").style.display="none";
  				}else if("manualActivity9" == activityDefID || "manualActivity14" == activityDefID){//保密办确认
	  				document.getElementById("exprei").style.display="none";
	  				document.getElementById("expbei").style.display="none";
	  				document.getElementById("project").style.display="none";
	  				document.getElementById("cont").style.display="none";
	  				document.getElementById("taskview").style.display="none";
	  				document.getElementById("machineview").style.display="none";
	  				document.getElementById("dept").style.display="none";
	  				document.getElementById("role").style.display="none";
	  				document.getElementById("mail").style.display="none";
	  				document.getElementById("emp").style.display="none";
  				}else if("manualActivity13" == activityDefID){//离职回访
	  				document.getElementById("checklist").style.display="none";
	  				document.getElementById("leaveReturn").style.display="";
	  				setLeaveReason("revisitreason");
	  				setLeaveReason("revisitothreason");
	  				document.getElementById("exprei").style.display="none";
	  				document.getElementById("expbei").style.display="none";
	  				document.getElementById("project").style.display="none";
	  				document.getElementById("cont").style.display="none";
	  				document.getElementById("taskview").style.display="none";
	  				document.getElementById("machineview").style.display="none";
	  				document.getElementById("dept").style.display="none";
	  				document.getElementById("role").style.display="none";
	  				document.getElementById("mail").style.display="none";
	  				document.getElementById("emp").style.display="none";
  				}else if("manualActivity10" == activityDefID || "manualActivity11" == activityDefID){//离职确认及文件打印
	  				document.getElementById("downloadprove").style.display="";
	  				document.getElementById("dept").style.display="none";
	  				document.getElementById("emp").style.display="none";
	  					document.getElementById("role").style.display="none";
  					if("manualActivity11" == activityDefID){
		  				document.getElementById("leavemes1").style.display="none";
		  				document.getElementById("exprei").style.display="none";
		  				document.getElementById("expbei").style.display="none";
		  				document.getElementById("project").style.display="none";
		  				document.getElementById("cont").style.display="none";
		  				document.getElementById("taskview").style.display="none";
		  				document.getElementById("machineview").style.display="none";
	  					document.getElementById("mail").style.display="none";
  					}else{
	  					document.getElementById("checklist").style.display="none";
		  				document.getElementById("project").style.display="none";
		  				document.getElementById("cont").style.display="none";
		  				document.getElementById("leaveProve").style.display="";
  					}
	  				if(company =="2"){
                		document.getElementById("proveuserid").innerHTML = leaveHR == null ?"": leaveHR;
                		document.getElementById("provetel").innerHTML = leaveHR == null ?"": leaveBJPhone;
                		document.getElementById("proveadress").innerHTML = leaveHR == null ?"": leaveBJadress;
	  				}else{
                		document.getElementById("proveuserid").innerHTML = leaveHR == null ?"": leaveHR;
                		document.getElementById("provetel").innerHTML = leaveHR == null ?"": leaveSHphone;
                		document.getElementById("proveadress").innerHTML = leaveHR == null ?"": leaveSHadress;
	  				}
					var indate = omLeaveApply.indate;
					var outdate = omLeaveApply.outdate;
					if(indate){
						var indateyear = indate.substring(0,4);
						var indatemonth = indate.substring(5,7);
						indatemonth = indatemonth.indexOf('0') == 0?indatemonth.substring(1,2):indatemonth;
						var indateday = indate.substring(8,10);
						indateday = indateday.indexOf('0') == 0?indateday.substring(1,2):indateday;
					}
					if(outdate){
						var outdateyear = outdate.substring(0,4);
						var outdatemonth = outdate.substring(5,7);
						outdatemonth = outdatemonth.indexOf('0') == 0?outdatemonth.substring(1,2):outdatemonth;
						var outdateday = outdate.substring(8,10);
						outdateday = outdateday.indexOf('0') == 0?outdateday.substring(1,2):outdateday;
					}
					var leaderOp = omLeaveApply.leaderOp;
					var deptname ="";
					var deptorgname ="";
					var deptop ="";
					var depttime ="";
					var sybname ="";
					var syborgname ="";
					var sybop ="";
					var sybtime ="";
					var vpname ="";
					var vporgname ="";
					var vpop ="";
					var vptime ="";
					if(leaderOp){
						for(var i=0;i<leaderOp.length;i++){
							if(i==0){
								deptname = leaderOp[i].operatorname;
								deptorgname = leaderOp[i].orgname;
								deptop = leaderOp[i].auditopinion;
								depttime = leaderOp[i].max_time;
								if(depttime){
									depttime = depttime.substring(0,10);
								}
							}else if(i == 1){
								sybname = leaderOp[i].operatorname;
								syborgname = leaderOp[i].orgname;
								sybop = leaderOp[i].auditopinion;
								sybtime = leaderOp[i].max_time;
								if(sybtime){
									sybtime = sybtime.substring(0,10);
								}
							}else if(i == 2){
								vpname = leaderOp[i].operatorname;
								vporgname = leaderOp[i].orgname;
								vpop = leaderOp[i].auditopinion;
								vptime = leaderOp[i].max_time;
								if(vptime){
									vptime = vptime.substring(0,10);
								}
							}
						}
					}
					pdfjson = ({"filename":"","emp":{
								"orgname":omLeaveApply.orgname,
								"empname":omLeaveApply.empname,
								"empcode":omLeaveApply.empcode,
								"positionname":omLeaveApply.positionname,
								"indate":omLeaveApply.indate,
								"indateyear":indateyear,
								"indatemonth":indatemonth,
								"indateday":indateday,
								"outdate":omLeaveApply.outdate,
								"outdateyear":outdateyear,
								"outdatemonth":outdatemonth,
								"outdateday":outdateday,
								"poutreason":"本人因个人原因申请离职，已根据公司要求完成离职交接相关工作。",
								"deptname":deptname,
								"deptorgname":deptorgname,
								"deptop":deptop,
								"depttime":depttime,
								"sybname":sybname,
								"syborgname":syborgname,
								"sybop":sybop,
								"sybtime":sybtime,
								"vpname":vpname,
								"vporgname":vporgname,
								"vpop":vpop,
								"vptime":vptime
								}});
	  				
  				}
  				document.getElementById("datagrid1").style.display="none";
				var checklistdata={processInstID:o.workitem.processInstID,processDefName:o.workitem.processDefName,activityDefID:o.workitem.activityDefID};
				queryChickList(checklistdata);
				//悬挂意见保存
				nui.get("workitemid").setValue(<%=workItemID %>);	//工作项ID
				nui.get("processinstid").setValue(processInstID);	//审核意见流程实例ID
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
				
				//流程回退路径赋值 
                nui.get("backTo").setData(o.omLeaveApply.backList);
				
				//审核结果设置
				initMisOpinion({auditstatus: "1"});
				if("manualActivity13" == activityDefID){
					nui.get("auditopinion").setValue("已完成回访。");
				}else{
					nui.get("auditopinion").setValue("已完成交接。");
				}
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}
	
	//提交该流程    
    var titleText = "";
    function onOk(e){
    	var isNeedPay;
    	var auditstatus = nui.get("auditstatus").getValue();
    	if(auditstatus == "2"){	//终止流程
    		titleText = "终止";
    	}else if(auditstatus == "0"){	//退回流程
    		if(!nui.get("backTo").getValue()){
    			nui.alert("退回环节不能为空！");
    			return;
    		}
    		titleText = "退回";
    	}else if(auditstatus == "1"){	//提交流程
			if(!form.validate()){
	    		nui.alert("信息录入不完整！");
	        	return;
        	}
	    	var checklistrow = grid_checklist.getData();
	    	for(var i =0; i<checklistrow.length;i++){
	    		if(checklistrow[i].ischeck=="0"){
	    			alert("核查清单'"+checklistrow[i].checklistseq+checklistrow[i].checklistname+"'没有勾选！");
	    			return;
	    		}
	    	}
    		titleText = "提交";
    	}
    	nui.confirm("确定" + titleText + "流程吗？", "操作提示",function (action) {            
            if (action == "ok") {
				SaveData2();
            }
        });
    }
    function SaveData2(){
		var om = form.getData();//申请信息
		var misOpinion = opioionform.getData().misOpinion;//审核意见
    	nui.get("sureButton").setEnabled(false);
    	var checklistrow = grid_checklist.getData();
    	var json = {omLeaveApply:om.omLeaveApply,misOpinion:misOpinion,csIncomecheck:checklistrow};
    	saveData(json);
    }
    
	function  saveData(data){
		mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: titleText+'中...'
        });
    	nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_leave_apply.handuserConfirm.biz.ext",
            data: data,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	nui.unmask(document.body);
        		var returnJson = nui.decode(text);
        		var empresult = text.empresult;
        		var mailresult = text.mailresult;
        		var msg="";
        		var msg1="";
              	if(returnJson.result == "success"){
              		if("manualActivity11" == activityDefID){
              			if(empresult == "1"){
              				msg ="更新员工成功！";
              			}else{
              				msg ="更新员工失败！";
              			}
              			if(mailresult){
	              			if(empresult == "1"){
	              				msg1 ="删除员工邮箱成功！";
	              			}else{
	              				msg1 ="删除员工邮箱失败！";
	              			}
              			}
	    				nui.alert(titleText + "成功！"+msg+msg1,"系统提示",function(){
			        		CloseWindow("ok");
			        	});
              		}else{
	    				nui.alert(titleText + "成功","系统提示",function(){
			        		CloseWindow("ok");
			        	});
              		}
              	}else{
					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
						nui.get("sureButton").setEnabled(true);
					});
				}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
                CloseWindow();
            }
        });
	}
	//打印页面
    function doPrint(){
    	var executeUrl = "<%= request.getContextPath() %>/ame_permanage/ame_leave_apply/leaveApplyPrint.jsp?leaveid=" + leaveid;
 		var msg="离职交接单打印";
 		window.open(executeUrl, msg); 
    }
    
    function onDrawSummaryCell(e) {
	    var result = e.result;
	    var grid = e.sender;
	    if (e.field == "expusername" ) {
	        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
	    }
	    if (e.field == "total" || e.field == "confamt" || e.field == "hxamt" || e.field == "payamt") {
	        e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	    }
        if(e.field == "hxje" || e.field == "hxjeing" || e.field == "nohxje" || e.field == "confamt"){
        	e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
        if (e.field == "prodmon" || e.field == "servmon" || e.field == "contsum" ||e.field == "gathermon") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
</script>
<script src="<%=request.getContextPath() %>/ame_permanage/ame_leave_apply/js/leaveapply.js" type="text/javascript"></script>
</html>