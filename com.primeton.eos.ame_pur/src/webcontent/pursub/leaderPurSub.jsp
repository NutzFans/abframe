<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-09-15 11:21:45
  - Description:
-->
<head>
	<title>审核</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link id="css_skin" rel="stylesheet" type="text/css" href="/default/coframe/tools/skins/skin1/style.css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<%@include file="/common/common.jsp"%>
	<h:script src='<%="/common/scripts/eos-web.js"%>' />
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
		<jsp:include page="//ame_pur/pursub/purSubForm.jsp"/>
		<fieldset  id="field6" style="border:solid 1px #aaa;padding:3px;width: 99%;">
        	<legend>附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
			<div id="addfile">
        		<jsp:include page="/ame_common/addFiles1.jsp"/>
        	</div>
        </fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	
	var formPurSubCont = new nui.Form("#form_purSubCont");//合同信息
  	var opioionform = new nui.Form("opioionform");//审核意见
  	
	
	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
	
	init();
	var purSubCont;
	var activityDefID;
	
	var leaderlist = [];//领导
	var saleleaders = [];//业务部门领导
	function init(){
		formPurSubCont.mask("数据加载中...");
		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		var json = {workItemID: <%=workItemID %>};
  		nui.ajax({//获取采购分包
      		url: "com.primeton.eos.ame_pur.purSub.getPurSubCont.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			formPurSubCont.unmask();
      			
       	  		formPurSubCont.setData(o);
       	  		purSubCont = o.purSubCont;
       	  		nui.get("custid").setText(purSubCont.custname);
       	  		nui.get("projectno").setText(purSubCont.projectName);
  				var processInstID = purSubCont.processinstid;
  				activityDefID = o.workitem.activityDefID;
  				
  				var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"PUR_SUB_CONT","relationid":purSubCont.subcontid});
				grid_0.sortBy("fileTime","desc");
				
				document.getElementById("project1").style.display="";
				document.getElementById("project2").style.display="";
				
				if("manualActivity1" == activityDefID){
					document.getElementById("saleleader").style.display="";
					document.getElementById("leader").style.display="";
					
					var saleleaders = purSubCont.saleleaders;
					if(saleleaders !=null && saleleaders.length > 0){
						var saleleaderValue="";
  						var saleleaderText="";
	  					for(var i = 0;i < saleleaders.length;i ++){
		        			if(saleleaderValue == null || saleleaderValue == ""){
			                    saleleaderValue = saleleaders[i].id
			                    saleleaderText = saleleaders[i].name;
			                }else{
			                	saleleaderValue = saleleaderValue+","+saleleaders[i].id;
		         				saleleaderText = saleleaderText+","+saleleaders[i].name;
			                }
						}
	                    nui.get("saleleaders").setValue(saleleaderValue);
	                    nui.get("saleleaders").setText(saleleaderText);
					}
					
					var leaders = purSubCont.leaders;
					if(leaders !=null && leaders.length > 0){
						var leaderValue="";
  						var leaderText="";
	  					for(var i = 0;i < leaders.length;i ++){
		        			if(leaderValue == null || leaderValue == ""){
			                    leaderValue = leaders[i].id
			                    leaderText = leaders[i].name;
			                }else{
			                	leaderValue = leaderValue+","+leaders[i].id;
		         				leaderText = leaderText+","+leaders[i].name;
			                }
						}
	                    nui.get("leaders").setValue(leaderValue);
	                    nui.get("leaders").setText(leaderText);
					}
				}else{
					document.getElementById("addfile").style.display="none";
					setToText();
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
                nui.get("backTo").setData(purSubCont.backList);
				
				//审核结果设置
				initMisOpinion({auditstatus: "1"});
				nui.get("auditopinion").setValue("同意");
				
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
        	if(!formPurSubCont.validate()){
	    		nui.alert("信息录入不完整！");
	        	return;
        	}
        	if(!onOkCheck()){
        		return;
        	}
        	if(activityDefID == "manualActivity1"){
	    		var saleleaders = nui.get("saleleaders").getValue();
	    		if(saleleaders == null || saleleaders ==""){
		    		nui.alert("请选择业务BG负责人");
		    		return;
		    	}
	    		var leaders = nui.get("leaders").getValue();
		    	if(leaders == null || leaders ==""){
		    		nui.alert("请选择审批人");
		    		return;
		    	}
	    	}
    		titleText = "提交";
    	}
    	msg="确定" + titleText + "流程吗？";
    	nui.confirm(msg, "操作提示",function (action) {            
            if (action == "ok") {
		    	document.getElementById("fileCatalog1").value="purSubCont";
				form4.submit();
            }
        });
    }
	function SaveData1(){
		var om = formPurSubCont.getData();//申请信息
		var misOpinion = opioionform.getData().misOpinion;//审核意见
		
		if(activityDefID == "manualActivity1" ){
			//业务BG负责人
			var saleleaderuserids = nui.get("saleleaders").getValue().split(",");
	        var saleleaderempnames = nui.get("saleleaders").getText().split(",");
	        //重新选择审核人后，先清空之前默认的审核人集合再赋值
	        saleleaders.length = 0;
	        for(var i = 0;i < saleleaderuserids.length;i ++){
	        	saleleaders[i] = {"userid": saleleaderuserids[i],"empname": saleleaderempnames[i]};
	        }
			om.purSubCont.saleleaders = saleleaders;
		
	    	//审批人
			var userids = nui.get("leaders").getValue().split(",");
	        var empnames = nui.get("leaders").getText().split(",");
	        //重新选择审核人后，先清空之前默认的审核人集合再赋值
	        leaderlist.length = 0;
	        for(var i = 0;i < userids.length;i ++){
	        	leaderlist[i] = {"userid": userids[i],"empname": empnames[i]};
	        }
			om.purSubCont.leaderlist = leaderlist;
    	}
		
    	nui.get("sureButton").setEnabled(false);
    	var json =nui.encode({purSubCont:om.purSubCont,misOpinion:misOpinion});
        save(json);
	}
	function save(data){
		mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: titleText+'中...'
        });
    	nui.ajax({
            url: "com.primeton.eos.ame_pur.purSub.purSubContBuss.biz.ext",
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
<script src="<%=request.getContextPath() %>/ame_pur/pursub/js/pursub.js" type="text/javascript"></script>
</html>