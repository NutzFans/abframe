var purmoney = 0;
var typedata=[];
var form = new nui.Form("#fgsyzsySealUse");
function init(){
	var orgid = null;
	var orgname = null;
	var org_data = queryOrgDataByUserid(userid);
	if(org_data){
		orgid = org_data.orgid;
		orgname = org_data.orgname;
	}
	var dataYzlx = [{"id": "frz","text": "法人章"},{"id": "gz","text": "公章"},{"id": "htz","text": "合同章"},{"id": "xmzyz","text": "项目专用章"}];
	nui.get("yzlx").setData(dataYzlx);
	//初始化表单信息
	nui.getbyName("fgsyzsy.userid").setValue(userid);
    nui.getbyName("fgsyzsy.username").setValue(username);
    nui.getbyName("fgsyzsy.orgid").setValue(orgid);
    nui.getbyName("fgsyzsy.orgname").setValue(orgname);
    nui.getbyName("fgsyzsy.yzsqrq").setValue(new Date());
    var nui_dh = nui.getbyName("fgsyzsy.dh");
    var text = nui_dh.getValue();
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


function onOk(e) {
	//印章类型必填校验
	var nui_yzlx = nui.getbyName("fgsyzsy.yzlx").getValue();
	var nui_qtz = nui.getbyName("fgsyzsy.qtz").getValue();
	var nui_qtzmc = nui.getbyName("fgsyzsy.qtzmc").getValue();
	if(nui_yzlx == ""){
		if(nui_qtz == "true"){
			if(nui_qtzmc == ""){
				alert("其他章类型必填！");
				return;
			}
		}else{
			alert("用章类型必填！");
			return;
		}
	}
	var nui_sybld = nui.getbyName("fgsyzsy.yzssdw");
	if(nui_sybld.getValue() == ""){
		alert(nui_sybld.requiredErrorText);
		return;
	}
	var nui_yysy = nui.getbyName("fgsyzsy.yysyyjwjmc").getValue();
	if(nui_yysy == ""){
		alert(nui.getbyName("fgsyzsy.yysyyjwjmc").requiredErrorText);
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
	nui.getbyName("purstatus").setValue(e);
	if(e==1){
    	if(confirm("确认保存并发起流程？")){
//    		nui.get("creatPurReq").disable();
//			nui.get("savePurReq").disable();
			document.getElementById("fileCatalog").value="fgsyzsy";
        	form2.submit();
    	}
	}else if(e==0){
    	if(confirm("确认保存信息？")){
    		//nui.getbyName("createSealUse").disable();
			//nui.getbyName("saveSealUse").disable();
			document.getElementById("fileCatalog").value="fgsyzsy";
        	form2.submit();
    	}
    }
}


function SaveData1(){
	document.getElementById("fileCatalog").value="fgsyzsy";
    form2.submit();
}

function SaveData() {
    if(form.validate()){        
    	var isok = true;
    	var formData = form.getData(false,true);
    	
    	//获取印章名称
    	var nui_yzlx = nui.getbyName("fgsyzsy.yzlx");
    	var nui_qtzmc = formData.fgsyzsy.qtzmc;
    	formData.fgsyzsy.yzlxmc = getYzmc(nui_yzlx,nui_qtzmc);
    	
    	var opioion_data = opioionform.getData(false,true)
        var json = {fgsyzsy:formData.fgsyzsy,isSave:nui.getbyName("purstatus").getValue(),misOpinion:opioion_data.misOpinion};
        form.loading("提交中，请稍候...");
        nui.ajax({
            url: "com.primeton.eos.ame_dailyoffice.fgsyzglHandle.handleFgsyzgl.biz.ext",
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
						nui.getbyName("fgsyzsy.yzglid").setValue(text.data.yzglid);
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
						nui.getbyName("fgsyzsy.yzglid").setValue(text.data.yzglid);
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
	var qtzmc = nui.getbyName("fgsyzsy.qtzmc");
	if(e.checked){
		qtzmc.show();
	}else{
		qtzmc.hide();
		qtzmc.setValue("");
	}
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