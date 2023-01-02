var promoney = 0;
var typedata=[];
function init(){
    var dataYzlx = [{"id": "frz","text": "法人章"},{"id": "gz","text": "公章"},{"id": "htz","text": "合同章"},{"id": "xmzyz","text": "项目专用章"}];
    nui.get("yzlx").setData(dataYzlx);
	form.mask("数据加载中...");
	promptInit({workItemID:workitemid});
	var json=nui.encode({workItemID: workitemid});
	nui.ajax({
			url: "com.primeton.eos.ame_dailyoffice.yzwjHandle.queryYzwjDataProcess.biz.ext",
			type: "post",
			data: json,
			contentType: "text/json",
			success: function (o){
			form.unmask();
			o = nui.clone(o);
			form.setData(o);
			//如果勾选了其他章选项的时候，显示其他章名称
			if(o.yzwj.qtz == "true"){
				nui.getbyName("yzwj.qtzmc").show();
			}
			//只有在发起环节才能进行附件和表单的修改
			if(o.workItem.activityDefID != "yzwj_fqyzwjlc"){
				document.getElementById("field1").disabled=true;
				$("#field2").hide();
				var grid = nui.get("grid_0");
				grid.hideColumn(5);
			}
			//加载附件设置参数
			nui.get("grid_0").load({"groupid":"yzwj","relationid": o.yzwj.dh},function(){});
			//查询审核意见
			var grid = nui.get("datagrid1");
			if(o.workItem.processInstID!=null && o.workItem.processInstID!=""){
				grid.load({processInstID:o.workItem.processInstID});
				grid.sortBy("time", "desc");
				}
			//设置审核意见基本信息
			nui.get("processinstid").setValue(o.workItem.processInstID);
           	nui.get("processinstname").setValue(o.workItem.processInstName);
           	nui.get("activitydefid").setValue(o.workItem.activityDefID);
           	nui.get("workitemname").setValue(o.workItem.workItemName);
           	nui.get("workitemid").setValue(workitemid);
           	if("yzwj_fqyzwjlc" == o.workItem.activityDefID){
				var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 2,"dictName": "终止流程"}];
			}else{
				var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
			}
        	nui.get("auditstatus").setData(dataStatus);
           	nui.get("auditstatus").setValue("1");
            nui.get("auditopinion").setValue("同意。");
            if(o.yzwj.backList){
           		nui.get("backTo").setData(o.yzwj.backList);
           		}
			},
			error: function(){}
		});
}



//采购清单金额汇总行
function drawPurReqBillSum(e){
	if (e.field == "totalprice") {
        e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
    }
}


//审核结果触发
function showBackTo(){
	var auditopinion = nui.get("auditopinion").getValue().trim();
	var auditstatus = nui.get("auditstatus").getValue();
	if(auditstatus=='0'){
		if(auditopinion=="同意。"){
			nui.get("auditopinion").setValue("");
		}
		chooselink();
	}else if(auditstatus=='1'){
		if(auditopinion==""){
			nui.get("auditopinion").setValue("同意。");
		}
		showNone();
	}else if(auditstatus=='2'){
		if(auditopinion=="同意。"){
			nui.get("auditopinion").setValue("");
		}
		showNone();
	}
}
function showNone(){
	nui.get("backTo").setValue("");
	document.getElementById("choosehide").style.display="none";
}
function chooselink(){
	document.getElementById("choosehide").style.display="";
}

function onOk(e) {
	//印章类型必填校验
	var nui_yzlx = nui.getbyName("yzwj.yzlx").getValue();
	var nui_qtz = nui.getbyName("yzwj.qtz").getValue();
	var nui_qtzmc = nui.getbyName("yzwj.qtzmc").getValue();
	if(nui_yzlx == ""){
		if(nui_qtz == "true"){
			if(nui_qtzmc == ""){
				alert("其他类型必填！");
				return;
			}
		}else{
			alert("用章类型必填！");
			return;
		}
	}
	
	nui_ghsj = nui.getbyName("yzwj.yzghsj");
	nui_wjsj = nui.getbyName("yzwj.yzwjrq");
	if(nui_ghsj && nui_ghsj.value == ""){
		alert(nui_ghsj.requiredErrorText);
		return false;
	}
	if(nui_wjsj && nui_wjsj.value == ""){
		alert(nui_wjsj.requiredErrorText);
		return false;
	}
	//转换时间格式
	format_ghsj = nui.formatDate(nui_ghsj.value, "yyyyMMddHHmmssfff");
	format_wjsj = nui.formatDate(nui_wjsj.value, "yyyyMMddHHmmssfff");
	if(format_wjsj > format_ghsj){
		alert("印章归还日期不能小于印章外借日期，请重新选取！");
		return false;
	}
	nui.getbyName("purstatus").setValue(e);
	if(e==1){
    	if(confirm("确认提交流程？")){
    		document.getElementById("fileCatalog").value="yzsy";
    	    form2.submit();
    		//nui.get("addPurReq").disable();
    		//SaveData();
    	}
	}
}

//关闭
function onCancel(e){
		CloseWindow("cancel");
	}
function CloseWindow(action) {
	if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	else window.close();
}

function SaveData() {
    if(form.validate()){  
    	var o = form.getData();
    	var data_opioion = opioionform.getData();
    	var activitydefid = nui.get("activitydefid").getValue();
    	var json = {yzwjdata:o.yzwj,misOpinion:data_opioion.misOpinion,workItemId:workitemid};
        //form.loading("提交中，请稍候...");
        nui.ajax({
            url: "com.primeton.eos.ame_dailyoffice.yzwjHandle.modifySealDelivery.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
               	var returnJson = nui.decode(text);
            	var e = nui.getbyName("purstatus").getValue();
				if(e==1){
					if(returnJson.result == '1'){
						alert("流程提交成功！");
//	                   	var activityDefID = nui.get("activitydefid").getValue();
//	                   	if("fgsyzsy_xzbfzrsp"==activityDefID){
//	                   	window.location=contextPath+"/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
//	                   	}else{
                   		CloseWindow("ok");
//	                   	}
					}else{
						alert("流程提交失败！请联系系统运维部！");
	                	//nui.get("addPurReq").enable();
	                	form.unmask();
					}
				}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
    }
   }

//标准方法接口定义
function CloseWindow(action) {           
    if (action == "close" && form.isChanged()) {
        if (confirm("数据被修改了，是否先保存？")) {
            return false;
        }
    }
    if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
    else window.close();            
}

    function onBillUnit(e){
     	return nui.getDictText('AME_PURUNIT',e.value);
     }
    
	function onCheckRenderer(e) {
		return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
	}
    
    function drawPurProjContSum(e){
		if (e.field == "purmoney") {
            e.cellHtml = "<div id='promoney' align='right'><b>" + formatNumber(e.cellHtml,'#,##.##') + "</b></div>";
            //采购金额自动归集，填写到表单信息
            promoney = e.value;
        }
	}
    function yzlxchange(e){
    	var qtzmc = nui.getbyName("yzwj.qtzmc");
    	if(e.checked){
    		qtzmc.show();
    	}else{
    		qtzmc.hide();
    		qtzmc.setValue("");
    	}
    }
