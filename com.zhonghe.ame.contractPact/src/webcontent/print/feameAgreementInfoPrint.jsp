<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@include file="/common/common.jsp"%>
<html>
<head>
<title>打印页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="<%= request.getContextPath() %>/common/nui/warterMark.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/JsBarcode.all.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-barcode.js"></script>
<% 
	UserObject user = (UserObject)session.getAttribute("userObject");
	String userName = user.getUserName();
%>
<style type="text/css">
.link-top {
	width: 100%;
	height: 5px;
	border-bottom: solid #ACC0D8 5px;
}

.base_div {
	text-align: left;
	font-size: 14px;
	font-weight: bold;
	background: #F6F6F6;
	padding: 8px;
	border-bottom: 1px solid #999;
}

body {
	-webkit-print-color-adjust: exact;
}

table tr {
	height: 28px;
}

table,table tr td {
	font-size: 12px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body style="overflow-y: scroll;">
	<div align="right" style="width: 400px;">
		<div align="right">
			<a class="nui-button" id="checkview" iconCls="icon-print" onclick="printBtn()">打印</a>
		</div>
	</div>
	<div title="框架协议打印" style="height: auto">
		<div id="pipi" class="nui-panel" style="font-size: 13px; width: 840px; height: 30px; margin: 0 auto; text-align: center;" align="left"></div>
		<div class="" style="width: 788px; margin: 0 auto; font-size: 14px; border: 1px solid #999999;">
			<div class="base_div">框架协议基本信息</div>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<input class="nui-hidden" name="id" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td class="form_label" align="right">申请人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 200px" />
								<input id="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true" />
							</td>

							<td align="right" style="width: 160px">协议实施部门：</td>
							<td>
								<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 200px" />
								<input id="implementOrgname" name="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">申请日期：</td>
							<td>
								<input id="createTime" name="createTime" class="nui-textbox" enabled="false" style="width: 200px" />
							</td>

							<td align="right" style="width: 160px">协议名称：</td>
							<td>
								<input id="contractName" name="contractName" class="nui-textbox" style="width: 200px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">协议金额（元）：</td>
							<td>
								<input name="contractSum" class="nui-textbox" style="width: 200px" />
							</td>
							<td align="right" style="width: 160px">签约方：</td>
							<td>
								<input name="signatory" class="nui-dictcombobox" url="com.zhonghe.ame.chargeContract.chargeContract.queryCusts.biz.ext" filterType="like" textField="custname" valueField="custid"
									dataField="custs" valueFromSelect="true" style="width: 200px;" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">协议签约主体：</td>
							<td>
								<input id="contractSubject" name="contractSubject" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 160px">签署地点：</td>
							<td>
								<input name="projectLocal" class="nui-textbox" style="width: 200px" required="true" />
							</td>
						<tr>
							<td align="right" style="width: 160px">协议落实部门：</td>
							<td colspan="3">
								<input name="bidUnitsName" style="width: 100%" class="nui-textbox" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">协议内容：</td>
							<td colspan="5">
								<input name="projectSize" class="nui-textarea" style="width: 100%; height: 120px" required="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">备注：</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" style="width: 100%; height: 120px" required="false" />
							</td>
						</tr>
					</table>
				</div>
				<div class="link-top"></div>
				<p style="color: red; font-weight: bold;">补充协议信息:</p>
				<div style="padding: 5px;" align="center">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 160px">协议编号：</td>
							<td>
								<input id="contractNo" name="contractNo" class="nui-textbox" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 160px">签订日期：</td>
							<td>
								<input id="signingDate" name="signingDate" class="nui-textbox" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">协议期限：</td>
							<td>
								<input id="contractPeriod" name="contractPeriod" class="nui-textbox" style="width: 200px" required="true" />
							</td>
							<td align="right" style="width: 160px">协议起始日期：</td>
							<td>
								<input name="startTime" class="nui-datepicker" style="width: 200px" required="true">
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">协议结束日期：</td>
							<td>
								<input name="endTime" class="nui-datepicker" style="width: 200px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">备注：</td>
							<td colspan="5">
								<input name="remark1" class="nui-textarea" style="width: 100%; height: 120px" required="false" />
							</td>
						</tr>
					</table>
				</div>
			</form>
			<div title="相关附件">
				<jsp:include page="/ame_common/detailFile.jsp">
					<jsp:param name="downloadZip" value="true" />
				</jsp:include>
			</div>
			<div class="nui-panel" id="d3" title="审批意见列表" style="width: 100%; height: auto;">
				<div id="datagrid5" class="nui-datagrid" style="width: 100%; height: auto;" dataField="misOpinions" url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext" idField="id"
					allowResize="true" allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
					<div property="columns">
						<div type="indexcolumn" headerAlign="center" width="30">编号</div>
						<div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
						<div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
						<div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center">处理结果</div>
						<div field="auditopinion" width="150" headerAlign="center">处理意见</div>
						<div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
						<div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
						<div field="files" renderer="onFileRenderer" width="100" hight="100" align="center" headerAlign="center">附件</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<form name="exprotZipFileFlow" id="exprotZipFileFlow" action="com.primeton.eos.ame_common.ameExportZip.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>

	<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid5 = nui.get("datagrid5");
	setData();
	document.getElementById("pipi").innerHTML="【框架协议打印】";
	var id;
	function getV(e){
		var grid = e.sender;
        var record = e.record;
        var uid = record._uid;
        var rowIndex = e.rowIndex;
        var s ="<a>同意</a>";
        return s;
	}
	
	//处理结果业务字典显示
  	function onCheckRenderer(e) {
		return nui.getDictText('MIS_AUDITSTATUS',e.value);
	}
	
	function setData(){
		id = <%= request.getParameter("id") %> ;
		var json = nui.encode({"id": id});
		nui.ajax({
	            url: "com.zhonghe.ame.contractPact.frameAgreement.getFeameAgreementById.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	var data = o.data[0];
	            	var createUsername ;
	            	form.setData(data)
		            nui.get("createUsername").setValue(data.empname);
	            	
					if(data.empname!=null){
						createUsername= data.empname
					}else{
						createUsername ="";
					}
	            	document.getElementById("pipi").innerHTML="【"+createUsername+"发起的"+data.contractName+"】";
					form.setEnabled(false);
					
					var grid_0 = nui.get("grid_0");
					grid_0.load({"groupid":"ZH_CONTRACTFEAME","relationid":id});
					grid_0.sortBy("fileTime","desc");
					 
	                var processInstID = data.processid;
					grid5.sortBy("time", "desc");
					grid5.load({processInstID:processInstID});
				}
	     });
	}
	
	function setEditData(data){
			form.setEnabled(false);
			form.setData(data);
			nui.get("createUsername").setValue(data.empname);
			nui.get("implementOrgname").setValue(data.orgname);
				
			var grid_0 = nui.get("grid_0");
        	grid_0.load({"groupid":"ZH_CONTRACTFEAME","relationid":data.id});
			grid_0.sortBy("fileTime","desc");
			
			var grid5 = nui.get("datagrid5");
			grid5.load({processInstID:data.processid});
			grid5.sortBy("time", "desc");

	}
	
	function setViewData(data){
			setEditData(data);
			setTimeout(function(){
				//注销掉删除操作
				$(".Delete_Button").hide();
			},300);
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
	// 设置水印用户
	setWatermark('<%=userName %>')
	function printBtn() {
	    document.getElementById('checkview').style.display="none";
	    /* window.document.body.innerHTML = document.documentElement.innerHTML; */
	    print();
	    document.getElementById('checkview').style.display="";
    };
	function preview() {
	    document.getElementById('checkview').style.display="none";
	    /* window.document.body.innerHTML = document.documentElement.innerHTML; */
	    print();
	    document.getElementById('checkview').style.display="";
    };
    
		function downloadZipFile() {
			if (!confirm("是否确认打包下载？")) {
				return;
			}
			var relationId = id;
			var fileCatalog = 'feameAgreementinfo';
			var json = nui.encode({
				'relationId' : relationId,
				'fileCatalog' : fileCatalog
			});
			nui.ajax({
				url : "com.primeton.eos.ame_common.file_zip.fileZip.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					if (filePath != null && filePath != "") {
						var fileName = "框架协议_" + nui.get('contractName').getValue() + "_附件.zip";
						var frm = document.getElementById("exprotZipFileFlow");
						frm.elements["downloadFile"].value = filePath;
						frm.elements["fileName"].value = fileName;
						frm.submit();
					}
				}
			})
		}
</script>
</body>
</html>