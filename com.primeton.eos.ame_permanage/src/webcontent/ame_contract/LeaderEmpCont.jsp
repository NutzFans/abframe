<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-02-27 17:58:32
  - Description:
-->
<head>
	<title>领导确认</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link id="css_skin" rel="stylesheet" type="text/css" href="/default/coframe/tools/skins/skin1/style.css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<!-- 提示信息展示  -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<!-- 员工基本信息展示  -->
		<jsp:include page="/ame_permanage/ame_contract/empDetail.jsp"/>
		<fieldset id="oldCont">
			<legend>历史合同</legend>
			<jsp:include page="/ame_permanage/ame_contract/empContGrid.jsp"/>
		</fieldset>
		<!-- 续签合同信息  -->
		<jsp:include page="/ame_permanage/ame_contract/empContForm.jsp"/>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	
  	var form = new nui.Form("#form1");//申请信息
  	
	var contract = nui.get("Contract");
	
  	var opioionform = new nui.Form("opioionform");//审核意见
  	
  	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
  	
	var emp;
	var conttime;
	var contend;
	var empCont;
	var pdfjson = [];
	var oldcontend;
	var activityDefID;
	var auditopinion;
	var hrconfirmdate;//hr确认时间
	var contcompany;//公司
	
  	init();
	function init(){
		form.mask("数据加载中...");
		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		var json = {workItemID: <%=workItemID %>};
  		nui.ajax({//获取合同续签信息
      		url: "com.primeton.eos.ame_permanage.ame_contract.getOmEmpCont.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			form.unmask();
       	  		form.setData(o);
       	  		empCont = o.empCont;
       	  		emp = o.empCont.emp;
       	  		var leaderAdvice = empCont.leaderAdvice;
  				var processInstID = empCont.processinstid;
  				conttime= empCont.conttime;
	            contend= empCont.contend;
	            oldcontend= empCont.oldcontend;
	            hrconfirmdate= empCont.hrconfirmdate;
				contcompany = empCont.contcompany;
       	  		setEmp();//设置员工基本信息
	            contract.load({ empid: empCont.empid,processinstid:processInstID});
				nui.get("isSM").setValue(empCont.isSM);
				
				activityDefID = o.workitem.activityDefID;
				var empAdvice = empCont.empAdvice;
				var leaderAdvicename;
				var empAdvicename;
	            if(empCont.leaderAdvice){
  					 leaderAdvicename= nui.getDictText('MIS_DEPT',empCont.leaderAdvice);
  					 changeleader(null,empCont.leaderAdvice);
  				}
  				if(empAdvice){
  					empAdvicename = nui.getDictText('MIS_EMP',empAdvice);
  					changeEmpAdv(null,empAdvice);
  				}
  				if(empCont.contprop){
  					changecontprop(null,empCont.contprop);
  				}
  				if(!empCont.worktype){
  					var nature = emp.nature;//人员性质
  					nui.get("worktype").setValue(nature == "0" || nature == "4"?'1':'2');
  				}
  				if(!empCont.contempname){
  					nui.get("contempname").setValue(emp.empname);
  				}
  				
				document.getElementById("field2").style.display="";
				nui.get("leaderAdvice").setRequired(true);
				nui.get("position").setRequired(true);
				
				if("manualActivity3" == activityDefID  || "manualActivity4" == activityDefID){
					/* if(empAdvice == "1"){
						document.getElementById("field3").style.display="";
						document.getElementById("contProve").style.display="";
						contdownload();
					} */
					document.getElementById("worktype1").style.display="";
					document.getElementById("worktype2").style.display="";
					if("manualActivity3" == activityDefID){
						nui.get("contuserid").setReadOnly(true);
						nui.get("conttype").setReadOnly(true);
						nui.get("contprop").setReadOnly(true);
						nui.get("contcompany").setReadOnly(true);
						nui.get("conttime").setReadOnly(true);
						nui.get("contstart").setReadOnly(true);
						nui.get("contend").setReadOnly(true);
						nui.get("contworkplace").setReadOnly(true);
						nui.get("position").setReadOnly(true);
						nui.get("positionname").setReadOnly(true);
						nui.get("remark").setReadOnly(true);
						nui.get("worktype").setReadOnly(true);
						nui.get("empAdvice").setRequired(true);
						nui.get("contempname").setReadOnly(true);
						document.getElementById("leader1").style.display="none";
						document.getElementById("leader2").style.display="none";
						document.getElementById("sm1").style.display="none";
						document.getElementById("sm2").style.display="none";
	           			auditopinion = empAdvicename;
					}
					if("manualActivity4" == activityDefID){
           				nui.get("recipient").setReadOnly(true);
           				nui.get("telephone").setReadOnly(true);
           				nui.get("address").setReadOnly(true);
           				nui.get("recipient").setRequired(false);
           				nui.get("telephone").setRequired(false);
           				nui.get("address").setRequired(false);
           				document.getElementById("field3").style.display="";
						document.getElementById("contProve").style.display="";
						contdownload();
						document.getElementById("contstatus1").style.display="";
						document.getElementById("contstatus2").style.display="";
						
           				//nui.get("leaderAdvice").setReadOnly(true);
           				//nui.get("empAdvice").setReadOnly(true);
						auditopinion = "同意。";
					}
				}else{
					if("manualActivity1" == activityDefID){
	           			nui.get("conttype").setReadOnly(true);
						document.getElementById("contempname1").style.display="none";
						document.getElementById("contempname2").style.display="none";
	           			auditopinion = leaderAdvicename;
					}
					if("manualActivity2" == activityDefID){
	           			nui.get("contuserid").setReadOnly(false);
	           			auditopinion = "同意。";
           				document.getElementById("field3").style.display="";
           				contdownload();
						document.getElementById("worktype1").style.display="";
						document.getElementById("worktype2").style.display="";
           				nui.get("worktype").setRequired(true);
					}
					document.getElementById("empuser1").style.display="none";
					document.getElementById("empuser2").style.display="none";
				}
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
               	nui.get("isshow").setValue("1");
				
				//流程回退路径赋值 
                nui.get("backTo").setData(empCont.backList);
				
				//审核结果设置
				initMisOpinion({auditstatus: "1"});
				nui.get("auditopinion").setValue(auditopinion);
				
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}
	
	//提交该流程    
    var titleText = "";
    function onOk(e){
    	var auditstatus = nui.get("auditstatus").getValue();
    	var msg;
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
    		titleText = "提交";
    	}
    	if("manualActivity3" == activityDefID){
    		var empAdvice = nui.get("empAdvice").getValue();
    		if(empAdvice == "1" && auditstatus == "1" ){
    			msg="提交流程前，需要下载和打印续签意向书和合同并按要求签字邮寄，请确认是否提交？";
    		}else{
    			msg="确定" + titleText + "流程吗？";
    		}
    	}else{
    		msg="确定" + titleText + "流程吗？";
    	}
    	nui.confirm(msg, "操作提示",function (action) {            
            if (action == "ok") {
				SaveData();
            }
        });
    }
	function SaveData(){
		var om = form.getData();//申请信息
		var misOpinion = opioionform.getData().misOpinion;//审核意见
    	nui.get("sureButton").setEnabled(false);
    	var json =nui.encode({empCont:om.empCont,misOpinion:misOpinion});
        save(json);
	}
	function save(data){
		mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: titleText+'中...'
        });
    	nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_contract.leaderOmEmpCont.biz.ext",
            data: data,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	nui.unmask(document.body);
        		var returnJson = nui.decode(text);
              	if(returnJson.result == "success"){
              		nui.alert(titleText + "成功！","系统提示",function(){
		        		CloseWindow("ok");
		        	});
              	}else {
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
</script>
<script src="<%=request.getContextPath() %>/ame_permanage/ame_contract/js/empcontapply.js" type="text/javascript"></script>
</html>