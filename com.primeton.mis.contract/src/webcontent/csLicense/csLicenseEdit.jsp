<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-04-23 10:36:16
  - Description:
-->
<head>
	<title>暂时保存</title>
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
		<!--合同基本信息展示  -->
		<jsp:include page="/contract/csLicense/csContDetail.jsp"/>
		<div id="cslicsend">
			<jsp:include page="/contract/csLicense/csLicenseForm.jsp"/>
			<fieldset  id="field6" style="border:solid 1px #aaa;padding:3px;width: 99%;">
	        	<legend>附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
	        	<jsp:include page="/ame_common/addFiles1.jsp"/>
	        </fieldset>
		</div>
		<div id="cslicgrid">
			<!--合同产品授权列表  -->
			<jsp:include page="/contract/csLicense/csLicenseGrid.jsp"/>
			<!--申请授权产品  -->
			<jsp:include page="/contract/csLicense/csLicProdEditGrid.jsp"/>
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
	
	var formCont = new nui.Form("#form_cont");//合同信息
  	var csLiceSendForm = new nui.Form("#form_csLiceSend");//申请信息
	var csContLicense_grid = nui.get("csContLicense_grid");//合同授权清单
	var csLicProd_grid = nui.get("csLicProd_grid");//申请授权产品
  	var opioionform = new nui.Form("opioionform");//审核意见
  	
  	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
  	document.getElementById("salesEdit").style.display="none";
  	document.getElementById("auditop").style.display="none";
  	
  	init();
	var csLiceSend;
	var activityDefID;
	var cscontract;
	var creatText="发起";
	
	function init(){
		csLiceSendForm.mask("数据加载中...");
		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		var json = {workItemID: <%=workItemID %>};
  		nui.ajax({//获取许可申请信息
      		url: "com.primeton.mis.contract.csLicense.getCsLiceSend.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      			csLiceSendForm.unmask();
       	  	    nui.get("projectid").setData(o.csLiceSend.list);
       	  		csLiceSendForm.setData(o);
       	  		csLiceSend = o.csLiceSend;
       	  		cscontract = o.csLiceSend.cscontract;
  				var processInstID = csLiceSend.processinstid;
  				activityDefID = o.workitem.activityDefID;
  				nui.get("projectname").setValue(cscontract.projectname);
  				nui.get("projectname").setText(cscontract.projectname);
  				nui.get("projectname").setReadOnly(true);
  				nui.get("inceptperson").setRequired(false);
  				
			  	document.getElementById("senddate1").style.display="none";
			  	document.getElementById("senddate2").style.display="none";
  				
            	document.getElementById("contnum").innerHTML = cscontract.contnum == null ?"":cscontract.contnum;
            	document.getElementById("contsum").innerHTML = cscontract.contsum == null ?"":formatNumber(cscontract.contsum,'#,##.##');
            	
            	document.getElementById("salename").innerHTML = cscontract.salename == null ?"":cscontract.salename;
            	document.getElementById("custname").innerHTML = cscontract.misCustinfo==null?"": cscontract.misCustinfo.custname == null ?"":cscontract.misCustinfo.custname;
            	document.getElementById("contreg").innerHTML = cscontract.contreg == null ?"":cscontract.contreg;
  				
  				nui.get("inceptperson").setText(csLiceSend.inceptperson);
  				
  				var grid_0 = nui.get("grid_0");
				grid_0.load({"groupid":"CS_LICE_SEND","relationid":csLiceSend.sendid});
				grid_0.sortBy("fileTime","desc");
				
				if("manualActivity4" == activityDefID){
					creatText = "提交";
					document.getElementById("creatProcess").innerHTML=creatText+"流程";
  					document.getElementById("saveProcess").style.display="none";
  					document.getElementById("guanZhuButton").style.display="none";
				}
  				csContLicense_grid.sortBy("contlicid","asc");
				csContLicense_grid.load({contnum: cscontract.contnum},function(e){
					csContLicense_grid.hideColumn (0);
					csLicProd_grid.load({contractid:cscontract.contractid,sendid:csLiceSend.sendid});
					csLicProd_grid.setFrozenStartColumn(0);
					csLicProd_grid.setFrozenEndColumn(4);
					
				});
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
                nui.get("backTo").setData(csLiceSend.backList);
				
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
    	var csLicProds = nui.clone(csLicProd_grid.getChanges());
		if(e == '2'){
			nui.confirm("确定终止流程吗？", "操作提示",
	            function (action) {            
	                if (action == "ok") {
	                	type = '2';
	                	//终止流程设置操作为2终止
	                	nui.get("auditstatus").setValue(2);
    					var om = csLiceSendForm.getData();//申请信息
	                	misOpinion = opioionform.getData().misOpinion;//审核意见
						var json = {csLiceSend:om.csLiceSend,misOpinion:misOpinion,csLicProds:csLicProds};
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
	        	if(!csLiceSendForm.validate()){
		    		nui.alert("信息录入不完整！");
		        	return;
	        	}
	        	if(!onOkCheck()){
	        		return;
	        	}
	        	if(!checkLicProds(csLicProds)){
	        		return;
	        	}
	        	msg="是否"+creatText+"正式许可申请流程？";
	        	type=1;
	        }else{
	        	msg="是否暂时保存正式许可申请流程？暂时保存后可以在待办任务中进行查询处理！";
	        	type=0;
	        	nui.get("applystatus").setValue('0');
	        }
	        nui.confirm(msg,"操作提示",function(o){
	        	if("ok" == o){
					//按钮禁用
			    	nui.get("creatProcess").disable();
			    	nui.get("saveProcess").disable();
			    	document.getElementById("fileCatalog1").value="csLiceSend";
					form4.submit();
	        	}
	        });
		}
    }
	function SaveData1(){
		var om = csLiceSendForm.getData();//申请信息
		var misOpinion = opioionform.getData().misOpinion;//审核意见
    	var csLicProds = nui.clone(csLicProd_grid.getChanges());
		var msg="正式许可申请流程";
		if("manualActivity4" != activityDefID){
			if(type =="1"){//发起还是暂存
				misOpinion.auditstatus ="3";
				misOpinion.workitemname="发起"+msg;
			}else{
				misOpinion.auditstatus ="4";
				misOpinion.workitemname="暂时保存"+msg;
			}
		}
    	om.csLiceSend.status = "1";
		var guanZhu = nui.get("guanZhuButton").getValue();//是否关注
		om.csLiceSend.guanZhu = guanZhu;//是否关注
		var json =nui.encode({csLiceSend:om.csLiceSend,misOpinion:misOpinion,csLicProds:csLicProds});
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
            url: "com.primeton.mis.contract.csLicense.csLicenseBuss.biz.ext",
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
<script src="<%=request.getContextPath() %>/contract/csLicense/js/csLicense.js" type="text/javascript"></script>
</html>