<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-04 17:15:02
  - Description:
-->
<head>
	<title>领导审批</title>
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
		<jsp:include page="/ame_permanage/ame_leave_apply/omLeaveForm.jsp"/>
		<fieldset id="empcontract" style="display: none;">
			<legend>员工合同信息</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/empContractGrid.jsp"/>
		</fieldset>
		<fieldset id="exprei">
			<legend>未完成报销</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/expReiListGrid.jsp"/>
		</fieldset>
		<fieldset id="expbei">
			<legend>未核销借款</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/expBeiListGrid.jsp"/>
		</fieldset>
		<fieldset id="cont">
			<legend>当前负责合同</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/csContractGrid.jsp"/>
		</fieldset>
		<fieldset id="taskview">
			<legend>待办任务</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/tasklistGrid.jsp"/>
		</fieldset>
		<fieldset id="project">
			<legend>当前负责项目</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/rdProjectGrid.jsp"/>
		</fieldset>
		<fieldset id="machineview">
			<legend>离职员工名下领用资产</legend>
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
		<fieldset id="file">
			<legend>附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
    		<div>
    			<jsp:include page="/ame_common/addFiles2.jsp"/>
    		</div> 
		</fieldset>	
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<!-- <a class="nui-button" iconCls="icon-print" onclick="doPrint();" style="width:100px;margin-right:20px;">打印页面</a> -->
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	
  	var form = new nui.Form("#form1");//申请信息
  	var formvac = new nui.Form("#formvac");//年假信息
  	var opioionform = new nui.Form("opioionform");//审核意见
	//费用报销
	var expRei_grid = nui.get("expRei_grid");
	//费用借款
	var expBeiList_grid = nui.get("expBeiList_grid");
	var rdProject_grid = nui.get("rdProject_grid");
	var taskList_grid = nui.get("taskList_grid");
	var csContract_grid = nui.get("csContract_grid");
	var misMachine_grid = nui.get("misMachine_grid");
	var vaction_grid = nui.get("vaction_grid");
	var leveapply_grid = nui.get("leveapply_grid");
	var org_grid = nui.get("org_grid");
	var emp_grid = nui.get("emp_grid");
	//var operaRole_grid = nui.get("operaRole_grid");
	var Contract_grid = nui.get("Contract_grid");
	var activityDefID ;
	var vacdealtype;
	var leaveid;
	//修改员工
    var chooseRows = "";
    var chooseType = "";
	var omLeaveApply;
	var pdfjson = [];
	
  	var adminlist = [];
  	var recruitlist = [];
  	
	var userid="";
	var year =new Date().getFullYear();
	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
	
	var  leaveOthMail  =nui.getDictText('AME_SYSCONF','leaveOthMail');
	
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
      			//debugger;
      			form.unmask();
       	  		form.setData(o);
       	  		omLeaveApply =o.omLeaveApply;
       	  		userid=o.omLeaveApply.userid;
       	  		leaveid=o.omLeaveApply.leaveid;
                vacdealtype = o.omLeaveApply.vacdealtype;
				var nature = o.omLeaveApply.nature;//人员性质
				var emptype = o.omLeaveApply.emptype;//人员属性
				nui.get("userid").setValue(userid);
				nui.get("userid").setText(o.omLeaveApply.empname);
				nui.get("userid").setReadOnly(true);
				nui.get("empname").setValue(o.omLeaveApply.empname);
				nui.get("handuserid").setText(o.omLeaveApply.handusername);
				nui.get("mailproxies").setText(o.omLeaveApply.mailproxiesname);
				nui.get("outagent").setText(o.omLeaveApply.outagentname);
				nui.get("vacdealtype").setValue(vacdealtype);
				nui.get("oldoutdate").setValue(o.omLeaveApply.outdate);
				nui.get("orgid").setText(o.omLeaveApply.orgname);
				
				setVacdealtype1();
				/* if(o.omLeaveApply.issecrecy == "1"){//是否涉密
	  				document.getElementById("hidebaomi").style.display="";
	  				document.getElementById("hidebaomi1").style.display="";
				} */
				if("1" == nature){
					document.getElementById("vac").style.display="none";
					nui.get("vacdealtype").setValue("0");
				}
				if("2" == emptype){//实习员工，不涉及年假
					document.getElementById("vac").style.display="none";
					nui.get("vacdealtype").setValue("0");
				}
				var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"OM_LEAVE_APPLY","relationid":o.omLeaveApply.leaveid});
				grid_0.sortBy("fileTime","desc");
                var outtype = o.omLeaveApply.outtype;//离职性质
                var mailretain = o.omLeaveApply.mailretain;//邮箱保留
                changeReason(null,outtype);
                var outoffsetmon = nui.get("outoffsetmon").getValue();
                if(outoffsetmon){
                	setCost();
                }
  				var processInstID = o.omLeaveApply.processinstid;
  				activityDefID = o.workitem.activityDefID;
  				changemailretain(null,mailretain);
  				if("manualActivity3" == activityDefID || "manualActivity12" == activityDefID){//HR确认
  					var recruit =o.omLeaveApply.recruit;
  					var recuserid =o.omLeaveApply.recuserid;
  					var recusername =o.omLeaveApply.recusername;
  					if(recruit !=null && recruit.length > 0){
  						var recruitlValue="";
  						var recruitText="";
	  					for(var i = 0;i < recruit.length;i ++){
		        			if(recruitlValue == null || recruitlValue == ""){
			                    recruitlValue = recruit[i].id
			                    recruitText = recruit[i].name;
			                }else{
			                	recruitlValue = recruitlValue+","+recruit[i].id;
		         				recruitText = recruitText+","+recruit[i].name;
			                }
						}
	                    nui.get("recruit").setValue(recruitlValue);
	                    nui.get("recruit").setText(recruitText);
  					}else{
  						nui.get("recruit").setValue(recuserid);
  						nui.get("recruit").setText(recusername);
  					}
  					if("manualActivity3" == activityDefID){
  						var guanximail =o.omLeaveApply.guanximail;
  						var zhulimail =o.omLeaveApply.zhulimail;
  						var zhulimailText =o.omLeaveApply.zhulimailText;
  						console.log(zhulimailText);
	  					document.getElementById("admindeal1").style.display="";
	  					document.getElementById("admindeal2").style.display="";
	  					document.getElementById("empcontract").style.display="";
	  					document.getElementById("ver").style.display="";
	  					document.getElementById("ver1").style.display="";
	  					document.getElementById("othmail").style.display="";
	  					document.getElementById("othmail1").style.display="";
	  					if(guanximail){
	  						nui.get("guanximail").setValue(guanximail);
	  					}else{
	  						nui.get("guanximail").setValue(leaveOthMail);
	  					}
	  					if(zhulimail){
	  						nui.get("zhulimail").setValue(zhulimail);
	  						nui.get("zhulimail").setText(zhulimailText);
	  					}
	  					var admin = o.omLeaveApply.admin;
	  					var adminPur = o.omLeaveApply.adminPur;
						if(o.omLeaveApply.issignconf != null || o.omLeaveApply.issignconf != ""){
							if(nature == "2" || nature == "3"){
								nui.get("issignconf").setValue("1");
							}else{
								nui.get("issignconf").setValue("0");
							}
						}
	  					if(admin !=null && admin.length > 0){
							var admindealValue = nui.get("admindeal").getValue();
		        			var admindealText = nui.get("admindeal").getText();
		  					for(var i = 0;i < admin.length;i ++){
			        			if(admindealValue == null || admindealValue == ""){
				                    admindealValue = admin[i].id
				                    admindealText = admin[i].name;
				                }else{
				                	admindealValue = admindealValue+","+admin[i].id;
			         				admindealText = admindealText+","+admin[i].name;
				                }
							}
		                    nui.get("admindeal").setValue(admindealValue);
		                    nui.get("admindeal").setText(admindealText);
	  					}else{
							var admindealValue = nui.get("admindeal").getValue();
		        			var admindealText = nui.get("admindeal").getText();
		        			if(adminPur){
		  						for(var i = 0;i < adminPur.length;i ++){
				        			if(admindealValue == null || admindealValue == ""){
					                    admindealValue = adminPur[i].id
					                    admindealText = adminPur[i].name;
					                }else{
					                	admindealValue = admindealValue+","+adminPur[i].id;
				         				admindealText = admindealText+","+adminPur[i].name;
					                }
								}
			                    nui.get("admindeal").setValue(admindealValue);
			                    nui.get("admindeal").setText(admindealText);
		                    }
	  					}
  					}
  					$("#hrconf").css({"display":""});
	  				document.getElementById("exprei").style.display="none";
	  				document.getElementById("project").style.display="none";
	  				document.getElementById("cont").style.display="none";
	  				document.getElementById("taskview").style.display="none";
	  				document.getElementById("expbei").style.display="none";
	  				document.getElementById("machineview").style.display="none";
  					if("manualActivity12" == activityDefID){
	  					document.getElementById("handremark1").style.display="";
	  					document.getElementById("leaveProve").style.display="";
	  					document.getElementById("leaveProvePrint").style.display="";
	  					document.getElementById("leaveprovedate1").style.display="";
	  					document.getElementById("leaveprovedate").style.display="";
		  				document.getElementById("expbei").style.display="";
		  				document.getElementById("machineview").style.display="";
	  					document.getElementById("ver").style.display="";
	  					document.getElementById("ver1").style.display="";
	  					document.getElementById("hideveriresult").style.display="";
	  					document.getElementById("hideveriresult1").style.display="";
  					}
  					if("1" == emptype){
						if(outtype =="1"){
							nui.get("isreturnvisit").setValue("1");
						}else{
							nui.get("isreturnvisit").setValue("0");
  							document.getElementById("rec").style.display="none";
						}
					}else{//实习员工，不涉及回访
						nui.get("isreturnvisit").setValue("0");
  						document.getElementById("rec").style.display="none";
					}
  				}
  				if("manualActivity1" == activityDefID || "manualActivity2" == activityDefID){
  					document.getElementById("empcontract").style.display="";
  					document.getElementById("ver").style.display="";
  					document.getElementById("ver1").style.display="";
  					document.getElementById("updateOrg").style.display="none";
					org_grid.hideColumn(org_grid.getColumn(0));
  				}
				//年假
				vaction_grid.load({userid:userid},function(e){//员工合同
					if(e.result.vacs.length>0){
						var nowrestvac = e.result.vacs[0].nowrestvac;
						if(nowrestvac <= 0){
	  						document.getElementById("vacdeal").style.display="none";
							nui.get("vacdealtype").setValue("0");
						}else{
	  						document.getElementById("vacdeal").style.display="";
			                if(vacdealtype == "1"){
			                	changevactype(null,vacdealtype);
			                	formvac.setData(o.omLeaveApply.leaveinfo);
			                }
						}
					}else{
						document.getElementById("vacdeal").style.display="none";
						nui.get("vacdealtype").setValue("0");
					}
					var date1 =new Date();
		            var year1 = date1.getFullYear();
		            var firstMonth = year1 + '-' + '01' + '-' + '01'
		            leveapply_grid.sortBy("applydate", "desc");
					leveapply_grid.load({criteria:
									    {_expr:[{_property:"userid",_op:"=",_value:userid } ,
	        									{_property:"applydate",_op:"between",_min: firstMonth,_max: date1 }
									    ]
									    }
					});
	            	Contract_grid.load({ empid: o.omLeaveApply.empid},function(){//报销
						expRei_grid.load({userid: userid},function(){//借款
							expBeiList_grid.sortBy("expid", "desc");
							expBeiList_grid.load({criteria:
											    {_expr:[{_property:"expstatus",_op:"in",_value:"5" },
											    {_property:"nohxje",_op:">",_value:"0" }
											    ],_not:[{_expr:[{_property:"exptype",_op:"=",_value:"D"}]}
											    ],_or:[{
											    _expr:[{_property:"transferuserid",_op:"=",_value:userid}],
											    _and:[{_expr:[{_property:"expuserid",_op:"=",_value:userid},
											    {_property:"transferuserid",_op:"null"}]}]
											    }]
											    }
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
														/* operaRole_grid.load({userid:userid},function(o){
															console.log(o.result.emproles);
															nui.get("operaRole").setValue(o.result.emproles[0].roleid);
															nui.get("operaRole").setText(o.result.emproles[0].rolename);
														}); */
													});
												});
										  	});
										});
									});
								});
							});
						});
	            	});
				});
				
				var contcompanyname = selectContractType(omLeaveApply.company);
				var gendername = nui.getDictText('ABF_GENDER',omLeaveApply.gender);
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
				
				pdfjson = ({"filename":"","emp":{
					"orgname":omLeaveApply.sybname1,
					"empname":omLeaveApply.empname,
					"empcode":omLeaveApply.empcode,
					"positionname":omLeaveApply.positionname,
					"poutreason":"个人原因",
					"indate":omLeaveApply.indate,
					"indateyear":indateyear,
					"indatemonth":indatemonth,
					"indateday":indateday,
					"outdate":omLeaveApply.outdate,
					"outdateyear":outdateyear,
					"outdatemonth":outdatemonth,
					"outdateday":outdateday,
					"companyname":contcompanyname,
					"gendername":gendername,
					"cardno":omLeaveApply.cardno
					}});
				
  				getEmpRole(userid);
  				//查询审核意见
				var grid = nui.get("datagrid1");
				grid.sortBy("time", "desc");
				grid.load({processInstID: processInstID});
				
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
				if("manualActivity12" == activityDefID){
					nui.get("auditopinion").setValue("离职证明已提供。");
				}else{
					nui.get("auditopinion").setValue("同意。");
				}
			
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}
	
	//获取公司名称
	function selectContractType(contcompany){
		var json = nui.encode({"dictid":contcompany,"dicttypeid":"company"});
		var contcompanyname;
    	nui.ajax({
            url: "org.gocom.abframe.tools.newDict.queryDictEntry.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            async:false,
            contentType: 'text/json',
            success: function (text) {
        		var returnJson = nui.decode(text);
        		if(returnJson){
            		var entry = returnJson.EosDictEntry;
            		contcompanyname = entry.filter1;
        		}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                nui.alert(jqXHR.responseText);
            }
        });
    	return contcompanyname;
	}
	
	
	//提交该流程    
    var titleText = "";
    var vacdealtype;
    function onOk(e){
    	var isNeedPay;
    	var auditstatus = nui.get("auditstatus").getValue();
    	vacdealtype = nui.get("vacdealtype").getValue();
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
        	if(vacdealtype==null || vacdealtype==""){
	        	nui.alert("请选择年假处理方式！");
	        	return;
        	}
        	if(vacdealtype=="1"){
        		if(!formvac.validate()){
		    		nui.alert("年假信息录入不完整！");
		        	return;
        		}
        		var vac = formvac.getData();//年假信息
        		var leaveid = vac.leavedetail.leaveid;
        		if(!checkvac()){
        			return;
        		};
        		if("manualActivity1" == activityDefID && (leaveid==null || leaveid=="")){
        			var leavedetail={startdate:vac.leavedetail.startdate,enddate:vac.leavedetail.enddate,sptype:vac.leavedetail.sptype,eptype:vac.leavedetail.eptype};
        			if(checkleave(userid,leavedetail)){
				    		nui.alert("存在已请过假的日期，请检查并修改！");
							return;
				    }
        		}else{
        			var leavedetail={leaveid:vac.leavedetail.leaveid,startdate:vac.leavedetail.startdate,enddate:vac.leavedetail.enddate,sptype:vac.leavedetail.sptype,eptype:vac.leavedetail.eptype}
        			if(checkleaveNotLeaveid(userid,leavedetail)){
			    		nui.alert("存在已请过假的日期，请检查并修改！");
						return;
        			}
        		}
        	}
        	if(!onOkCheck()){
				return;
			}
    		titleText = "提交";
    	}
    	nui.confirm("确定" + titleText + "流程吗？", "操作提示",function (action) {            
            if (action == "ok") {
				document.getElementById("fileCatalog2").value="OM_LEAVE_APPLY";
				form6.submit();
            }
        });
    }
    function SaveData2(){
		var om = form.getData();//申请信息
		om.omLeaveApply.vacdealtype=vacdealtype;
		if("manualActivity3" == activityDefID || "manualActivity12" == activityDefID){
	    	if("manualActivity3" == activityDefID){
		    	//行政审批人
				var userids = nui.get("admindeal").getValue().split(",");
		        var empnames = nui.get("admindeal").getText().split(",");
		        //重新选择审核人后，先清空之前默认的审核人集合再赋值
		        adminlist.length = 0;
		        for(var i = 0;i < userids.length;i ++){
		        	adminlist[i] = {"userid": userids[i],"empname": empnames[i]};
		        }
				om.omLeaveApply.adminlist = adminlist;
				var zhulimailText = nui.get("zhulimail").getText();
				om.omLeaveApply.zhulimailText = zhulimailText;
	    	}
			//行政审批人
			var recruituserids = nui.get("recruit").getValue().split(",");
	        var recruitempnames = nui.get("recruit").getText().split(",");
	        //重新选择审核人后，先清空之前默认的审核人集合再赋值
	        recruitlist.length = 0;
	        for(var i = 0;i < recruituserids.length;i ++){
	        	recruitlist[i] = {"userid": recruituserids[i],"empname": recruitempnames[i]};
	        }
			om.omLeaveApply.recruit = recruitlist;
		}
		var misOpinion = opioionform.getData().misOpinion;//审核意见
    	nui.get("sureButton").setEnabled(false);
    	var json;
    	if(vacdealtype=="1"){
			var formvacdetail = formvac.getData();//年假信息
    		json = {omLeaveApply:om.omLeaveApply,misOpinion:misOpinion,leavedetail:formvacdetail.leavedetail};
		}else{
	    	json = {omLeaveApply:om.omLeaveApply,misOpinion:misOpinion};
		}
    	saveData(json);
    }
    
	function  saveData(data){
		mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: titleText+'中...'
        });
    	nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_leave_apply.leaderLeaveApply.biz.ext",
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
              		if("manualActivity12" == activityDefID || "manualActivity3" == activityDefID){
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
	
	//设置年假处理方式
	function setVacdealtype1(){
		nui.ajax({
    		url: "com.primeton.eos.ame_permanage.ame_leave_apply.getVacDealType.biz.ext",
    		type: 'POST',
			cache: false,
            async:false,
			contentType: 'text/json',
			success: function(text){
				nui.get("vacdealtype").setData(text.vactype);
			},
			error: function(jqXHR, textStatus, errorThrown){
			}
    	})
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