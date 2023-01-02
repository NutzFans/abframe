<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-09-15 11:21:45
  - Description:
-->
<head>
	<title>暂时保存采购分包报备</title>
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
        <div style="color: red;margin-left: 20px;" id="tips">
			<span>说明：</span><br/>
			<span>1、请至少提供2家供应商进行询价比较；</span><br/>
			<span>2、公司与客户的合同中不得出现禁止分包/外包条款；</span><br/>
			<span>3、须优先从公司入围合格供应商库中选择有项目实施服务能力的供应商，如无法满足需求，可推荐新供应商，该供应商应满足合格供应商入围基本条件。</span><br/>
	    </div>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注流程</a>
		<a class="nui-button" onclick="onOk('1')" id="creatProcess" style="width: 80px;margin-right: 20px;">发起流程</a>
		<a class="nui-button" onclick="onOk('0')" id="saveProcess" style="width: 80px;margin-right: 20px;">暂时保存</a>
		<a class="nui-button" onclick="onOk('2')" id="endProcess" iconCls="icon-no" style="width: 100px;margin-right: 20px;">终止流程</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	
	var formPurSubCont = new nui.Form("#form_purSubCont");//合同信息
  	var opioionform = new nui.Form("opioionform");//审核意见
	
	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
	
  	document.getElementById("salesEdit").style.display="none";
  	document.getElementById("auditop").style.display="none";
  	
  	
	init();
	var purSubCont;
	var activityDefID;
	var creatText="发起";
	
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
  				var processInstID = purSubCont.processinstid;
  				activityDefID = o.workitem.activityDefID;
  				
  				var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"PUR_SUB_CONT","relationid":purSubCont.subcontid});
				grid_0.sortBy("fileTime","desc");
				
				if("manualActivity4" == activityDefID){
					creatText = "提交";
					document.getElementById("creatProcess").innerHTML=creatText+"流程";
  					document.getElementById("saveProcess").style.display="none";
  					document.getElementById("guanZhuButton").style.display="none";
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
				if("manualActivity4" == activityDefID){
					initMisOpinion({auditstatus: "1"});
					nui.get("auditopinion").setValue("同意。");
				}else{
					initMisOpinion({auditstatus: "4"});
					nui.get("auditopinion").setValue("");
				}
				
				
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
	}
	
	var type ; //发起还是暂存
    function onOk(e){
		if(e == '2'){
			nui.confirm("确定终止流程吗？", "操作提示",
	            function (action) {            
	                if (action == "ok") {
	                	type = '2';
	                	//终止流程设置操作为2终止
	                	nui.get("auditstatus").setValue(2);
    					var om = formPurSubCont.getData();//申请信息
	                	misOpinion = opioionform.getData().misOpinion;//审核意见
						var json = {purSubCont:om.purSubCont,misOpinion:misOpinion};
						save(json);
						return;
					}else{
						return;
					}
				}
			);
		}else{
	        var msg;//提示信息
	        if(e == "1"){//发起
	        	if(!formPurSubCont.validate()){
		    		nui.alert("信息录入不完整！");
		        	return;
	        	}
	        	if(!onOkCheck()){
	        		return;
	        	}
	        	msg="是否"+creatText+"采购分包报备流程？";
	        	type=1;
	        }else{
	        	msg="是否暂时保存采购分包报备流程？暂时保存后可以在待办任务中进行查询处理！";
	        	type=0;
	        	nui.get("applystatus").setValue('0');
	        }
	        nui.confirm(msg,"操作提示",function(o){
	        	if("ok" == o){
					//按钮禁用
			    	nui.get("creatProcess").disable();
			    	nui.get("saveProcess").disable();
			    	document.getElementById("fileCatalog1").value="purSubCont";
					form4.submit();
	        	}
	        });
		}
    }
	function SaveData1(){
		var om = formPurSubCont.getData();//申请信息
		var misOpinion = opioionform.getData().misOpinion;//审核意见
		var msg="采购分包报备";
		if("manualActivity4" != activityDefID){
			if(type =="1"){//发起还是暂存
				misOpinion.auditstatus ="3";
				misOpinion.workitemname="发起"+msg;
			}else{
				misOpinion.auditstatus ="4";
				misOpinion.workitemname="暂时保存"+msg;
			}
		}
    	om.purSubCont.status = "0";
		var guanZhu = nui.get("guanZhuButton").getValue();//是否关注
		om.purSubCont.guanZhu = guanZhu;//是否关注
		var json =nui.encode({purSubCont:om.purSubCont,misOpinion:misOpinion});
        save(json);
	}
	
	
	function save(data){
		var content;
    	if(type == '1'){
           	content = creatText+'中...';
		}else if(type == '0'){
           	content = '暂存中...';
		}else if(type == '2'){
           	content = '终止中...';
		}
    	mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: content
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
    				if(type==1){
	                   	nui.alert(creatText+"流程成功！","系统提示",function (){
	                   		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
	                   	});
    				}else if(type==0){
    					nui.alert("暂时保存成功！","系统提示",function (){
    						window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
    						form.unmask();
    					});
    				}else if(type == '2'){
    					nui.alert("终止流程成功！","系统提示",function (){
    						CloseWindow();
    					});
    				}
              	}else {
					nui.get("creatProcess").enable();
					nui.get("saveProcess").enable();
    				if(type==1){
	                   	nui.alert("发起流程失败！");
    				}else if(type==0){
    					nui.alert("暂时保存失败！");
    				}else if(type == '2'){
    					nui.alert("终止流程失败！");
    				}
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