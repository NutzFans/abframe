<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-04-20 13:42:23
  - Description:
-->
<head>
	<title>发起正式申请</title>
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
		<fieldset  id="field6" style="border:solid 1px #aaa;padding:3px;width: 100%;">
        	<legend>附件</legend>
        	<jsp:include page="/ame_common/addFiles1.jsp"/>
        </fieldset>
	</div>
	<div id="cslicgrid">
		<!--合同产品授权列表  -->
		<jsp:include page="/contract/csLicense/csLicenseGrid.jsp"/>
	</div>
	<div id="csLicProds">
		<%-- <jsp:include page="/contract/csLicense/csLicProdForm.jsp"/> --%>
	</div>
	
	<form id="opioionform" method="post" >
        <div style="padding: 5px;" id="opinionHide">
			<input name="misOpinion.fileids" id="fileids" class="nui-hidden"/>
            <table style="table-layout: fixed;">
            	<tr id="salesEdit">
                    <td style="width: 150px;" align="right">审核结果：</td>
                    <td style="width: 250px;">
						<input name="misOpinion.auditstatus" id="auditstatus" class="nui-dictradiogroup" style="width: 250px;" 
							required="true" dictTypeId="MIS_AUDITSTATUS" value="4" />
						<input name="misOpinion.auditopinion" id="auditopinion" value="" class="nui-hidden" />
                    </td>
                </tr>
            </table>
        </div>
	</form>
</div>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注流程</a>
	<a class="nui-button" onclick="onOk('1')" id="creatProcess" style="width: 80px;margin-right: 20px;">发起流程</a>
	<a class="nui-button" onclick="onOk('0')" id="saveProcess" style="width: 80px;margin-right: 20px;">暂时保存</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	
  	var formCont = new nui.Form("#form_cont");//合同信息
  	var csLiceSend = new nui.Form("#form_csLiceSend");//申请信息
	var csContLicense_grid = nui.get("csContLicense_grid");//合同授权清单
  	var opioionform = new nui.Form("opioionform");//审核意见
	
	var paths = "<%= request.getContextPath() %>"; //默认路径，js文件不能直接取，定义全局变量
  	
  	document.getElementById("salesEdit").style.display="none";
  	document.getElementById("senddate1").style.display="none";
  	document.getElementById("senddate2").style.display="none";
	//流程操作提示
	promptInit({"workItemID": 0,"processDefName": "com.primeton.mis.contract.csLicenseApply","activityDefID": "manualActivity"});
	
	var type ; //发起还是暂存
	var csLicProds = [];//授权产品信息
	var activityDefID;
	
	nui.get("inceptperson").setRequired(false);
	
    function onOk(e){
    	//授权产品详情
		var csContlics = csContLicense_grid.getSelecteds();
		csLicProds = [];
    	for(var i = 0; i < csContlics.length; i++){
    		var csLicProdDetail = new nui.Form('form_'+i).getData();
	    	csLicProds.push(csLicProdDetail);
    	}
        var msg;//提示信息
        if(e == "1"){//发起
        	if(!formCont.validate() || !csLiceSend.validate()){
	    		nui.alert("信息录入不完整！");
	        	return;
        	}
        	if(!onOkCheck()){
        		return;
        	}
        	if(csContlics == null || csContlics.length<=0){
        		nui.alert("请选择授权产品，若产品授权清单为空，请联系商务部！");
		        return;
        	}
        	if(csContlics){
	        	for(var i = 0; i < csContlics.length; i++){
		    		var csLicProdForm = new nui.Form('form_'+i);
		    		var licfilenum = nui.get("licfilenum_"+i).getValue();
		    		var prodname = nui.get("prodname_"+i).getText();
		    		console.log(licfilenum);
		    		console.log(prodname);
		    		if(!csLicProdForm.validate()){
		    			nui.alert("信息录入不完整！");
		        		return;
		    		}
		    		if(licfilenum <=0){
		    			nui.alert("请填写"+prodname+"产品的申请个数！");
		        		return;
		    		}
		    	}
	    	}else{
	    		nui.alert("请选择授权产品！");
		        return;
	    	}
        	msg="是否发起正式许可申请流程？";
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
	function SaveData1(){
		var om = csLiceSend.getData();//申请信息
		var misOpinion = opioionform.getData().misOpinion;//审核意见
		var msg="正式许可申请";
		if(type =="1"){//发起还是暂存
			misOpinion.auditstatus ="3";
			misOpinion.workitemname="发起"+msg;
		}else{
			misOpinion.auditstatus ="4";
			misOpinion.workitemname="暂时保存"+msg;
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
           	content = '发起中...';
		}else if(type == '0'){
           	content = '暂存中...';
		}
    	mini.mask({
            el: document.body,
            cls: 'mini-mask-loading',
            html: content
        });
    	nui.ajax({
            url: "com.primeton.mis.contract.csLicense.csLicenseCreat.biz.ext",
            data: data,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	nui.unmask(document.body);
        		var returnJson = nui.decode(text);
              	if(returnJson.result == "success"){
    				if(type==1){
	                   	nui.alert("发起流程成功！","系统提示",function (){
	                   		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
	                   	});
    				}else if(type==0){
    					nui.alert("暂时保存成功！","系统提示",function (){
    						window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
    						form.unmask();
    					});
    				}
              	}else {
					nui.get("creatProcess").enable();
					nui.get("saveProcess").enable();
    				if(type==1){
	                   	nui.alert("发起流程失败！");
    				}else if(type==0){
    					nui.alert("暂时保存失败！");
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