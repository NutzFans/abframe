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
<style type="text/css">
	div{
	 	white-space:normal;
	    word-break:break-all;
	         word-wrap:break-word; 
         }
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<div align="right" style="width: 788px">
	<a class="nui-button" id="checkview" iconCls="icon-print" onclick="preview()">打印</a>
</div>
<div title="采购立项打印" style="height: auto" >
	<div id="pipi" class="nui-panel" style="font-size: 20px;width: 240px;height: 30px;margin-left: 309px"  align="center"></div>
	<div class="mini-panel" title="基本信息" style="width: 788px;<!--height: 240px-->">
    	<form id="form1">
			<input name="files" id="fileids" class="nui-hidden"/>
			<input name="files1" id="fileids1" class="nui-hidden"/>
			<input name="processid" id="processid" class="nui-hidden"/>
			<input class="nui-hidden" name="id"/>
			<div style="padding: 5px;">
				<table style="table-layout:fixed;" id="table_file1" >
					<tr>
						<td align="right" style="width:100px">立项名称：</td>
						<td colspan="3">
							<input name="proAppName"  class="nui-textbox"  borderStyle="border:0" width="100%"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:100px">立项编号：</td>
						<td style="width:220px" >
							<input name="proAppCode"  class="nui-textbox"  borderStyle="border:0" width="100%"/>
						</td>
						<td align="right" style="width:140px">分公司职能部门经办人：</td>
						<td style="width:220px" >
							<input name="proAppAgentUserid" id="proAppAgentUserid" class="nui-textbox"  borderStyle="border:0" width="100%"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:100px">立项单位：</td>
						<td >
							<input name="proAppOrgName" class="nui-textbox"  borderStyle="border:0" width="100%"/>
						</td>
					
						<td align="right" style="width:120px">所属项目名称：</td>
						<td style="width:220px" >
							<input name="projectId" id="projectId"  class="nui-textbox"  borderStyle="border:0" width="100%"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:100px">立项金额(万元)：</td>
						<td style="width:220px" >
							<input name="proAppApplyPrice"  id="proAppApplyPrice" class="nui-textbox" readonly="readonly"  borderStyle="border:0" width="100%"/>
						</td>
						<td align="right" style="width:140px">项目拟实施日期：</td>
						<td style="width:220px" >
							<input name="proAppImplTime"  class="nui-datepicker"   borderStyle="border:0" width="100%"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 100px">费用来源：</td>
						<td style="width:220px" >
							<input name="costFrom"  class="nui-radiobuttonlist"  data="[{id: '1', text: '公司自筹资金'}, {id:'2', text: '中央预算内资金'}]" required="ture"/>
						</td>
						<td align="right" style="width:140px">立项对象类别：</td>
						<td style="width:220px" >
							<input name="proAppObjType"  class="nui-radiobuttonlist"  data="[{id: '1', text: '工程'}, {id:'2', text: '物资'}, {id:'3', text: '服务'}]" required="ture"/>
						</td>
					</tr>
					<tr>
          				<td class="form_label" align="right" style="width:120px;">立项类型：</td>
			            <td >    
			               <input class="nui-dictcombobox" name="type" id="type" dictTypeId="ZH_PURCHASE" required="true" visible="true" style="width:100%;"/>
			            </td>
          			</tr>
					<tr>
	              		<td align="right" style="width:160px">立项范围说明：</td>
	                    <td id="proAppRange" colspan="5" style="height: 68px;background:#F0F0F0;border:1px solid #A5ACB5">    
	                       <!-- <input style="width:100%;height: 60px;" name="proAppRange" class="nui-textarea"  id="proAppRange" />  -->
	                    </td>
          			</tr>
          			
				</table>
			</div>
		</form>
    </div>
    <!--报销明细  --> 
	<div class="mini-panel" title="明细" style="width: 788px;height: auto;">
        <div id="datagrid1" class="nui-datagrid" style="width:100%;height: auto;" multiSelect="true" allowCellwrap="true"
        	sortMode="client"  url="com.zhonghe.ame.purchase.dao.projectApproval.queryProAppDtl.biz.ext"
            showFooter="false" showPager="false" allowSortColumn="true" dataField="datas">
            <div property="columns">
           		<div type="indexcolumn" align="center" headerAlign="center">序号</div>
           		<div  field="planName" width="110" align="center" headerAlign="center" >计划名称</div>
           		<div  field="code" width="110" align="center" headerAlign="center" >计划编号(物项明细编号)</div>
                <div field="materialName"  width="110" align="center" headerAlign="center" vtype="required"  >采购物项名称 </div>
                <div field="budgetAmount"  width="110" align="center" headerAlign="center" vtype="required">预算金额(万元)</div>
                <div field="amount"  width="110" align="center" headerAlign="center" vtype="required">立项金额(万元) </div>
                <div field="needOrgName"  width="60" align="center" headerAlign="center" >采购单位</div> 
                <div field="contractamount"  width="100" align="center" headerAlign="center" vtype="true" visible="false">拟签合同金额(元)
                </div>
            </div>
        </div>
    </div>
    <fieldset id="field2" style="border:solid 1px #aaa;padding:1px;width: 784px;">
		<legend>费用估算证明附件</legend>
		<jsp:include page="/ame_common/detailFile.jsp"/>
	</fieldset>
	<fieldset id="field3" style="border:solid 1px #aaa;padding:1px;width: 784px;">
		<legend>立项支持材料附件</legend>
		<jsp:include page="/ame_common/detailFile2.jsp"/>
	</fieldset>
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
	document.getElementById("pipi").innerHTML="【采购立项申请】";
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
	            url: "com.zhonghe.ame.purchase.purchaseProApp.queryProApp.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	var result=o.proApp[0];
	            	form.setData(result);
					form.setEnabled(false);
					$("#technologyNeed").html(result.remark);
					$("#proAppRange").html(result.proAppRange);
					nui.get("proAppAgentUserid").setValue(result.agentempname);
					/* nui.get("projectId").setValue(result.projectName); */
					grid1.load({"pid":result.id})
					 var grid_0 = nui.get("grid_0");
					 grid_0.load({"groupid":"proAppCost","relationid":id});
					 grid_0.sortBy("fileTime","desc");
					 var grid_1 = nui.get("grid_1");
					 grid_1.load({"groupid":"proAppSup","relationid":id});
					 grid_1.sortBy("fileTime","desc");
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