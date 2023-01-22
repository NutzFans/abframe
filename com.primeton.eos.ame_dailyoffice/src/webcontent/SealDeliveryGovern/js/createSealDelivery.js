var purmoney = 0;
var typedata=[];
function init(){
	var orgid = "";
	var orgname = "";
	var org_data = queryOrgDataByUserid(userid);
	if(org_data){
		orgid = org_data.orgid;
		orgname = org_data.orgname;
	}
	 var dataYzlx = [{"id": "frz","text": "法人章"},{"id": "gz","text": "公章"},{"id": "htz","text": "合同章"},{"id": "xmzyz","text": "项目专用章"}];
	 nui.get("yzlx").setData(dataYzlx);
	//初始化表单信息
	nui.getbyName("yzwj.userid").setValue(userid);
    nui.getbyName("yzwj.username").setValue(username);
    nui.getbyName("yzwj.orgid").setValue(orgid);
    nui.getbyName("yzwj.orgname").setValue(orgname);
    nui.getbyName("yzwj.yzwjrq").setValue(new Date());
    var nui_dh = nui.getbyName("yzwj.dh");
    var text = nui_dh.getValue();
    var org_leader = queryLeader(orgid);
    nui.get("checkerid").setValue(org_leader.userid);
//    nui.get("checkername").setValue(org_leader.empname);
    if(!text) {
    	var dh = createDh();
    	nui_dh.setValue(dh);
    }
}

/**
 * 生成单号
 * @returns {String}
 */
function createDh() {
	var dh = "YZ" + nui.formatDate(new Date(), "yyyyMMddHHmmssfff");
	
	return dh;
}

function queryLeader(orgid){
	var org_leader = null;
	if(orgid){
		var json = {orgid:orgid};
		nui.ajax({
            url: "com.primeton.eos.ame_dailyoffice.sealCommon.queryOrgLeader.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            async:false,
            contentType: 'text/json',
            success: function (text) {
            	org_leader = text.Leader;
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
	}
	return org_leader;
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
	//同行证明人必须填写
	var nui_txzmr = nui.getbyName("yzwj.txzmr").getValue();
	if(nui_txzmr == ""){
		alert("同行证明人不能为空！");
		return;
	}
	//事业部领导必须填写
	var nui_sybld = nui.getbyName("misOpinion.checkerid").getValue();
	if(nui_sybld == ""){
		alert("事业部领导不能为空！");
		return;
	}
	var nui_wjsy = nui.getbyName("yzwj.wjsy").getValue();
	if(nui_wjsy == ""){
		alert(nui.getbyName("yzwj.wjsy").requiredErrorText);
		return;
	}
	
	//附件必须填写
//	var filePaths = document.getElementsByName("uploadfile");
//	var flag = false;
//	if(!filePaths.length){
//		flag = true;
//	}else {
//		var i = 0;
//		$.each(filePaths,function(i,d){
//			var fileVal = $("#filex" + (i + 1)).val();
//			if(!fileVal || fileVal == ""){
//				flag = true;
//				return false;
//			}
//		});
//	}
//	if(flag){
//		alert("请上传相关附件！");
//		return false;
//	}
	//归还日期和外借日期权限控制
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
	format_ghsj = nui.formatDate(nui_ghsj.value, "yyyyMMdd");
	format_wjsj = nui.formatDate(nui_wjsj.value, "yyyyMMdd");
	if(format_wjsj > format_ghsj){
		alert("印章归还日期不能小于印章外借日期，请重新选取！");
		return false;
	}
	nui.getbyName("purstatus").setValue(e);
	if(e==1){
    	if(confirm("确认保存并发起流程？")){
			document.getElementById("fileCatalog").value="yzwj";
        	form2.submit();
    	}
	}else if(e==0){
    	if(confirm("确认保存信息？")){
			document.getElementById("fileCatalog").value="yzwj";
        	form2.submit();
    	}
    }
}


function SaveData1(){
	document.getElementById("fileCatalog").value="yzwj";
    form2.submit();
}

function SaveData() {
    if(form.validate()){        
    	var isok = true;
    	var formData = form.getData(false,true);
    	
    	//获取印章名称
    	var nui_yzlx = nui.getbyName("yzwj.yzlx");
    	var nui_qtzmc = formData.yzwj.qtzmc;
    	formData.yzwj.yzlxmc = getYzmc(nui_yzlx,nui_qtzmc);
    	
    	var opioion_data = opioionform.getData(false,true)
        var json = {yzwj:formData.yzwj,isSave:nui.getbyName("purstatus").getValue(),misOpinion:opioion_data.misOpinion};
        form.loading("提交中，请稍候...");
        nui.ajax({
            url: "com.primeton.eos.ame_dailyoffice.yzwjHandle.handleYzwj.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	var e = nui.getbyName("purstatus").getValue();
            	var returnData = nui.clone(text);
				if(e == 1){
					if(returnData.result == "1"){
						form.unmask();
						nui.alert("发起流程成功！");
						//确定不会重复保存表单
						nui.getbyName("yzwj.yzwjid").setValue(text.data.yzwjid);
						window.location=contextPath+"/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
					}else{
						nui.alert("发起失败！");
						form.unmask();
						nui.getbyName("saveSealUse").enable();
						nui.getbyName("createSealUse").enable();
					}
				}else if(e == 0){
					if(returnData.result == "1"){
						form.unmask();
						nui.alert("暂时保存成功，可在待处理任务中继续发起！");
						//确定不会重复保存表单
						nui.getbyName("yzwj.yzwjid").setValue(text.data.yzwjid);
						window.location=contextPath+"/bps/wfclient/task/taskList.jsp?taskType=self";
					}else{
						nui.alert("发起失败！");
						form.unmask();
						nui.getbyName("saveSealUse").enable();
						nui.getbyName("createSealUse").enable();
					}
				}
		     
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
    }
   }

//采购清单金额汇总行
function drawPurReqBillSum(e){
	if (e.field == "totalprice") {
        e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
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

//选择项目
function selectProject(){
	var btnEdit = this;
	nui.open({
        url:contextPath+"/ame_pur/Pur_Common/SelectProject.jsp",
        title: "选择项目",
        width: 850,
        height: 420,
        allowResize: false,
        ondestroy: function (action) {
            if (action == "ok") {
                var iframe = this.getIFrameEl();
                var data = iframe.contentWindow.GetData();
                data = nui.clone(data);    //必须
                if (data) {
                	btnEdit.setValue(data.projectno);
                    btnEdit.setText(data.projectName);
                	var row = grid_purProjReq.getSelected();
                    var rowData = { "projectId":data.projectId,
                    				"projectno":data.projectno,
                    				"projectName":data.projectName,
                    				"custjc":data.custjc,
                    				"orgname":data.orgname,
                    				"contnum":data.contnum,
                    				"budgetMoney":data.budgetmoney,
                    				"actPurmoney":data.actpurmoney==null?0:data.actpurmoney,
                    				"unusedmoney":data.unusedmoney};
				   	grid_purProjReq.updateRow(row,rowData);
                }
            }
        }
    });
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
function initByWorkItemid(){
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
	       	var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
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

/**
 * @author zhengquan
 * @time 2019年4月11日18点39分
 * @description 通过userid获取部门信息
 * @param userid
 * @returns
 */
function queryOrgDataByUserid(userid){
	var org_data = null;
	if(userid){
		var json = {userid:userid};
		nui.ajax({
            url: "com.primeton.eos.ame_dailyoffice.sealCommon.queryOrgData.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            async:false,
            contentType: 'text/json',
            success: function (text) {
            	org_data = text.orgdata;
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
	}
	return org_data;
}

//获取印章名称
function getYzmc(nui_yzlx,nui_qtzmc){
	var selecteds = nui_yzlx._selecteds;
	var yzlxmc = '';
	for(var i=0;i<selecteds.length;i++){
		yzlxmc = yzlxmc + selecteds[i].text + ",";
	}
	if(nui_qtzmc){
		yzlxmc = yzlxmc + "其他章";
	}else{
		yzlxmc = yzlxmc.substring("0",yzlxmc.length-1);
	}
	return yzlxmc;
}
