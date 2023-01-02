<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<head>
<title>打印页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/JsBarcode.all.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-barcode.js"></script>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<div align="right" style="width: 788px">
	<a class="nui-button" id="checkview" iconCls="icon-print" onclick="preview()">打印</a>
</div>
<div title="紧急采购打印" style="height: auto" >
	<div id="pipi" class="nui-panel" style="font-size: 20px;width: 240px;height: 30px;margin-left: 309px"  align="center"></div>
	<div class="mini-panel" title="基本信息" style="width: 788px;height: 200px">
    	<form id="form1" >
			<input class="nui-hidden" name="id"/>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td class="form_label" align = "right">验收单编号：</td>
							<td colspan="3">
								<input name="verifyCode" id="verifyCode" class="nui-textbox" readOnly="readOnly" borderStyle="border:0" style="width: 100%" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">验收人：</td>
								<td style="width:220px" >
									<input name="userId" id="userId"  class="nui-textbox" 
									onbuttonclick="selectOmEmployee" style="width: 100%" readOnly="readOnly" borderStyle="border:0"/></td>
<!-- 								<td><input name="implementOrg"  class="nui-textbox" style="width: 100%"/></td> -->
							
								<td align="right" style="width:100px">验收部门：</td>
									<td style="width:220px" ><input
										name="orgId" id="orgId"
										class="nui-textbox" 
										url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext"
										filterType="like" textField="orgname" valueField="orgid"
										dataField="allorgs" valueFromSelect="true" allowInput="true"
										style="width: 100%;" readOnly="readOnly"  borderStyle="border:0"/></td>
						</tr>
						
						<tr>
							<td align="right" style="width: 120px">合同编号：</td>
							<td>
								<input name="contractId" id="contractId"  class="nui-textbox" style="width: 100%" readOnly="readOnly" borderStyle="border:0"/>
							</td>
							<td align="right" style="width: 130px">总价(万元)：</td>
							<td>
								<input name="totalPrice" readOnly="readOnly" id="totalPrice" class="nui-textbox" style="width: 100%" borderStyle="border:0"/>
							</td>
						</tr>
							
						<tr>
							<td class="form_label"  align="right" style="width:120px;">备注：</td>
		                    <td colspan="7" >    
		                        <input style="width:100%;height: 70px;"   name="remark" id="remark" class="nui-textarea"  borderStyle="border:0"/>
		                    </td>	
						</tr>
				</table>
			</div>
		</form>
    </div>
	<div class="mini-panel" title="明细" style="width: 788px;height: auto;">
        <div id="datagrid1" class="nui-datagrid" style="width:100%;height: auto;" multiSelect="true" allowCellwrap="true"
        	sortMode="client"  url="com.zhonghe.ame.purchase.purchaseVerify.queryVerifyDetailTotal.biz.ext"
            showFooter="false" showPager="false" allowSortColumn="true" dataField="purVerifyDetail">
              <div property="columns">
	                <div field="goodsName"  align="center" headerAlign="center">货物名称</div>
	               	<div  field="model"  align="center" headerAlign="center" renderer="dictstatus"  >型号规格</div>
	                <div  field="supId" displayField="custname"  align="center" headerAlign="center">供应商名称</div>
	                <div  field="number" align="center" headerAlign="center">数量</div>
	                <div   field="singlePrice" align="center" headerAlign="center" renderer="doIt">单价(万元)</div>
	                <div   field="totalPriceDetail"  align="center" headerAlign="center"  renderer="doIt" >总价(万元)</div>
	                <div   field="qualitySituation" width="130" align="center" headerAlign="center"  >质量情况</div>
	            </div>
        </div>
    </div>
    <div class="nui-panel" id="d3" title="审批意见列表" style="width: 788px;height: auto;">
    	<div id="datagrid4" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
		    url="com.zhonghe.ame.purchase.common.queryPlanApproval.biz.ext"  idField="id" allowResize="true"
		    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
		    <div property="columns">
		    	<div type="indexcolumn" align="center" headerAlign="center">序号</div>
		        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
		         <div field="workitemname" width="120" align="center" headerAlign="center">处理环节</div>
		        <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
		        <div field="auditstatus" renderer="onCheckRenderer" width="60" align="center" headerAlign="center">处理结果</div>
		        <div field="auditopinion" width="20%" headerAlign="center"  align="left">审批意见</div>
		        <div field="time" width="110" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
		    </div>
		</div>
	  </div>
  </div>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid1 = nui.get("datagrid1");
	var grid4 = nui.get("datagrid4");
	setData();
	document.getElementById("pipi").innerHTML="【验收采购申请】";
	var id;
	function getV(e){
		var grid = e.sender;
        var record = e.record;
        var uid = record._uid;
        var rowIndex = e.rowIndex;
        var s ="<a>同意</a>";
        return s;
	}
	
	//科学计数法转普通计数法
	function doIt(e){
		var singlePrice = new Number(e.value)+'';
		return singlePrice;
	}
	
		//处理结果业务字典显示
  	function onCheckRenderer(e) {
		return nui.getDictText('MIS_AUDITSTATUS',e.value);
	}
	function setData(){
		id = <%= request.getParameter("id") %> ;
		var json = nui.encode({"id": id});
		nui.ajax({
	            url: "com.zhonghe.ame.purchase.purchaseVerify.queryVerify.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	var result=o.purVerify[0];
	            	form.setData(result);
					form.setEnabled(false);
					 
					 nui.get("orgId").setValue(result.orgname);
					 nui.get("userId").setValue(result.empname);
					 nui.get("contractId").setValue(result.contractNo);
					var jsonData = {"id":result.id}
					grid1.load(jsonData)
	                var processInstID = result.processid;
					grid4.sortBy("time", "desc");
					grid4.load({processInstID:processInstID});
				}
	     });
	}
	
	function createEwm(url){
		$('#qrcode').empty();
		var para = url;
    	$('#qrcode').qrcode({width: 100,height: 100,text: para});
	}
	
    
    //----------------------审批意见-------------------------//
	function onCheckRenderer(e) {
		return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
	}
	function initMisOpinion(data){
		//初始化处理意见
		var dataStatus=[{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
		nui.get("auditstatus").setData(dataStatus);
		nui.get("auditstatus").setValue(data.auditstatus);
	}
    //审核结果触发
    function show(){
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
	function dicttic(e){
		return nui.getDictText('AME_TICTYPE',e.value);//设置业务字典值
	}
	
	//打印按钮
	function preview() {
        document.getElementById('checkview').style.display="none";
        /* window.document.body.innerHTML = document.documentElement.innerHTML; */
        print();
        document.getElementById('checkview').style.display="";
    };
</script>
</body>
</html>