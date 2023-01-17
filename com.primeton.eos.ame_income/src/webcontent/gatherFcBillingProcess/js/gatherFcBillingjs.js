//选择开票单位（客户）
function selectMisCust(){
	var btnEdit = this;
    nui.open({
        url:ContextPath+"/contract/contract/MisCustinfo_lookup.jsp",
        title: "选择开票单位",
        width: 850,
        height: 410,
        ondestroy: function (action) {
            if (action == "ok") {
            	var iframe = this.getIFrameEl();
                var data = iframe.contentWindow.GetData();
                data = nui.clone(data);	//72100-中国联合网络通信有限公司
                nui.get("custname").setValue(data.id);
                nui.get("custname").setText(data.text);
                //户名
                nui.get("accoutname").setValue(data.accoutname);
                //开户银行
                nui.get("accoutbank").setValue(data.accoutbank);
                //税号
                nui.get("taxnumb").setValue(data.taxnumb);
                //账号
                nui.get("accountid").setValue(data.accountid);
                //地址
                nui.get("address").setValue(data.address);
                //电话
                nui.get("telephone").setValue(data.telephone);
            }
        }
    });
};

//合同收款记录列表统计行样式
function doCsGatherFcSum(e){ 
	if (e.field == "contsum" || e.field == "fcsum" || e.field == "actsum" || e.field == "productsum" 
		|| e.field == "servicesum") {
        e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
    }
}

//设置业务字典-收款状态
function dictstatus(e){
	return nui.getDictText("AME_GATHERSTATUS",e.value);
}

//设置业务字典-收款记录开票状态
function dictstatusbill(e){
	return nui.getDictText("MIS_GATHERBILL",e.value);
}

//收款类型
function dictGatherFcType(e) {
    return nui.getDictText('AME_GATHERTYPE',e.value);
}
	
//服务名称
function onServRenderer(e){
	return nui.getDictText('CS_SERVNAME',e.value);
}


//产品单位
function onUnitRenderer(e){
	return nui.getDictText('UNIT',e.value);
}

//服务单位
function onUnitSALERenderer(e){
	return nui.getDictText('UNIT_SALE',e.value);
}

//服务单位
function onServNumTypeRenderer(e){
	return nui.getDictText('SERV_NUM_TYPE',e.value);
}

//发票状态
function onStatusRenderer(e){
	return nui.getDictText('CS_BILLSTATUS',e.value);
}

//开票来源
function onBillTypeRenderer(e){
	return nui.getDictText('CS_BILLTYPE',e.value);
}

//开票与发票类型
function onTypeRenderer(e){
	return nui.getDictText('CS_BILLTICKET_TYPE',e.value);
}

function onBillStatusRenderer(e){
	return nui.getDictText('MIS_BILLSTATUS',e.value);
}

//收入预估状态
function dictrevestatus(e){
	return nui.getDictText('AME_REVESTATUS',e.value);
}

//收入确认类型
function dictReveType(e){
	return nui.getDictText('AME_REVETYPE',e.value);
}

//关闭页面
function CloseWindow(action) {
    if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
    else window.close();            
}
        