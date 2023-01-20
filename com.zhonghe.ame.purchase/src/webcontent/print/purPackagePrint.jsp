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
<div title="采购计划发包打印" style="height: auto" >
	<div id="pipi" class="nui-panel" style="font-size: 20px;width: 240px;height: 30px;margin-left: 309px"  align="center"></div>
	<div class="mini-panel" title="基本信息" style="width: 788px;height: auto">
    	<form id="form1" >
			<input name="files" id="fileids" class="nui-hidden"/>
			<input class="nui-hidden" name="id"/>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width:100px">发包编号：</td>
							<td style="width:220px" >
								<input name="packageCode" id="packageCode"  class="nui-textbox" borderStyle="border:0" width="100%"/>
							</td>
							<td align="right" style="width:100px">立项编号：</td>
							<td style="width:220px" ><input name="proAppCode" id="proAppCode" class="nui-textbox" borderStyle="border:0" width="100%"/></td>
						</tr>
						<tr>
							<td align="right" style="width:100px">立项金额(万元)：</td>
							<td style="width:220px" ><input name="price" id="price" class="nui-textbox" borderStyle="border:0" width="100%"/></td>
							<td align="right" style="width:100px">项目名称：</td>
							<td style="width:220px" >
								<input name="projectId" id="projectId" class="nui-textbox" borderStyle="border:0" width="100%" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">立项部门：</td>
							<td style="width:220px" >
								<input name="orgname" id="orgname" class="nui-textbox" borderStyle="border:0" width="100%"/>
							</td>
							<td align="right" style="width:160px">发包方式：</td>
							<td colspan="1">
								<input class="nui-dictcombobox" dictTypeId="ZH_CGFS"  id="packageType" name="packageType" borderStyle="border:0" width="100%" /> 
							</td>
						</tr>
						<tr>
							<td align="right" style="width:100px">是否设招标限价：</td>
							<td colspan="1">
								<input class="nui-dictcombobox" dictTypeId="ZH_BIDSTATUS" id="isPriceLimit" name="isPriceLimit"  borderStyle="border:0"  width="100%" /> 
							<td align="right" style="width: 130px">招标限价(万元)：</td>
							<td style="width:220px" >
								<input name="limitPrice" id="limitPrice"  class="nui-textbox"  borderStyle="border:0"  width="100%" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width:100px">申请日期：</td>
							<td style="width:220px" >
								<input name="appTime" id="appTime" class="nui-datepicker"  borderStyle="border:0"  width="100%" />
							</td>
						</tr>
						<tr>
							<td class="form_label"   align="right" style="width:120px;">发包范围：</td>
		                    <td colspan="7" id="packageRange" style="height: 48px;background:#F0F0F0;border:1px solid #A5ACB5;">    
		                        <!--<input style="width:100%;height: 65px;"   name="packageRange" id="packageRange" class="nui-textarea"   borderStyle="border:0"/>-->
		                    </td>	
						</tr>
						<tr>
							<td class="form_label"  align="right" style="width:120px;">选择此方式理由：</td>
		                    <td colspan="7" id="invitationReason" style="height: 48px;background:#F0F0F0;border:1px solid #A5ACB5">    
		                       <!-- <input style="width:100%;height: 50px;" name="invitationReason"  id="invitationReason" class="nui-textarea"   borderStyle="border:0" />-->
		                    </td>
						</tr>						
					
						<tr>
			          		<td class="form_label"  align="right" style="width:120px;">相关情况说明：</td>
			                <td colspan="7" id="relevantRemark" style="height: 48px;background:#F0F0F0;border:1px solid #A5ACB5">    
			                    <!--<input style="width:100%;height: this.scrollHeight;"  onpropertychange="this.style.posHeight=this.scrollHeight" name="relevantRemark" id="relevantRemark" class="nui-textarea"   borderStyle="border:0" />-->
			                </td>
          				</tr>
						<tr>
			          		<td class="form_label"  align="right" style="width:120px;">选择以下供应商原因：</td>
			                <td colspan="7" id="chooseSupplierReason" style="height: 48px;background:#F0F0F0;border:1px solid #A5ACB5">    
			                    <input style="width:100%;height: 45px;"  name="chooseSupplierReason" id="chooseSupplierReason" class="nui-textarea"   borderStyle="border:0" />
			                </td>
          				</tr>
				</table>
			</div>
		</form>
    </div>
	<div class="mini-panel" title="供应商信息" style="width: 788px;height: auto;">
        <div id="datagrid1" class="nui-datagrid" style="width:100%;height: auto;" multiSelect="true" allowCellwrap="true"
        	sortMode="client"  url="com.zhonghe.ame.purchase.purchasePackage.queryPurPackageSup.biz.ext"
            showFooter="false" showPager="false" allowSortColumn="true" dataField="sups">
             <div property="columns">
	                <div field="custname"  width="130" align="center" headerAlign="center"  >供应商名称 </div>
	               	<div  field="status" width="130" align="center" headerAlign="center"  renderer="dictstatus" >是否合格供应商</div>
	                <div  field="registercap"  width="130" align="center" headerAlign="center"  >注册资金(万元)</div>
	                <div  field="linkman"  width="130" align="center" headerAlign="center"  >联系人</div>
	                <div   field="linktel" width="130" align="center" headerAlign="center"  >联系电话</div>
	            </div>
	        </div>
        </div>
    </div>
    <fieldset id="field2" style="border:solid 1px #aaa;padding:0px;width: 784px;">
		<legend>发包方式支持性材料附件</legend>
		<jsp:include page="/ame_common/detailFile.jsp"/>
	</fieldset>
    <div class="nui-panel" id="d3" title="审批意见列表" style="width: 788px;height: auto;">
    	<div id="datagrid4" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
		    url="com.zhonghe.ame.purchase.common.queryPlanApproval.biz.ext"  idField="id" allowResize="true"
		    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="false">
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
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid1 = nui.get("datagrid1");
	var grid4 = nui.get("datagrid4");
	setData();
	document.getElementById("pipi").innerHTML="【采购发包申请】";
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
	
	function dictstatus(e) {
		return nui.getDictText('MIS_YN',e.value);//设置业务字典值
	}
	
	function setData(){
		id = <%= request.getParameter("id") %> ;
		var json = nui.encode({"id": id});
		nui.ajax({
	            url: "com.zhonghe.ame.purchase.purchasePackage.queryPurPackage.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	var result=o.proApp[0];
	            	form.setData(result)
					form.setEnabled(false);
					nui.get("chooseSupplierReason").setValue(result.chooseSupplierReason);
					 
					$("#packageRange").html(result.packageRange);
					$("#invitationReason").html(result.invitationReason);
					$("#chooseSupplierReason").html(result.chooseSupplierReason);
					$("#relevantRemark").html(result.relevantRemark);
					  
					grid1.load({'id':result.id})
					 var grid_0 = nui.get("grid_0");
					 grid_0.load({"groupid":"purcahsePackageApp","relationid":id});
					 grid_0.sortBy("fileTime","desc");
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