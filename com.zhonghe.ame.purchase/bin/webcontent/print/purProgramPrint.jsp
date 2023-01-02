<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<head>
<title>采购方案打印页面</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/JsBarcode.all.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-barcode.js"></script>  

<style type="text/css">
	div{ word-wrap: break-word; word-break: normal;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>
<body>
<div align="right" style="width: 788px">
	<a class="nui-button" id="checkview" iconCls="icon-print" onclick="preview()">打印</a>
</div>
<div title="采购方案打印" style="height: auto" >
    <div id="pipi" class="nui-panel" style="font-size: 20px;width: 240px;height: 30px;margin-left: 309px"  align="center"></div>
    <div class="mini-panel" title="采购方案信息" style="width: 788px;height: auto">
        <form id="form1" method="post"  >
            <div style="padding: 5px; " >
                <table style="table-layout: fixed;">
                    <tr>
                        <td class="form_label" align = "right" style="width: 200px">采购方案名称：</td>
                        <td colspan="3">
                            <input name="programmeName"  readOnly="readOnly" id="programmeName" class="nui-textbox" style="width: 100%" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width:160px">采购立项编号：</td>
                        <td><input name="proappId" id="proappId"  readOnly="readOnly" onbuttonclick="onButtonEdit" class="nui-buttonedit" style="width: 300px" /></td>
                        <td align="right" style="width: 120px">单据编号：</td>
                        <td>
                            <input name="code" id="code" class="nui-textbox" readOnly="readOnly" style="width: 300px;"  />
                        </td>
                    </tr>
                    <tr>
                        <td class="form_label"  align="right" style="width:250px;">采购方案与文件说明：</td>
                        <td colspan="3" id="remark" style="height: 48px;background:#F0F0F0;border:1px solid #A5ACB5">
                            <!--<textarea  style="width:100%;overflow:hidden;height:150px;" name="remark" id="remark" class="nui-textarea"   readOnly="readOnly"  dictTypeId="ZH_PURCHASE"></textarea>-->
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
    <div class="mini-panel" title="采购计划信息" style="width: 788px;height: auto;">
        <div id="grid_traveldetail" class="nui-datagrid" style="width: 770px;height: auto;"
             allowCellSelect="true" showPager="false" allowCellEdit="false" multiSelect="true"
             dataField="purPlanItem" url="com.zhonghe.ame.purchase.purchaseItems.queryPurPlanItem.biz.ext">
            <div property="columns">
                <div  field="code" width="145" align="center" headerAlign="center" >计划编号</div>
                <div field="materialName"  width="110" align="center" headerAlign="center" vtype="required"  renderer="onViewL" >采购物项名称 </div>
                <div field="number"  width="80" align="center" headerAlign="center" visible="false" vtype="required">数量</div>
                <div field="budgetAmount"  width="70" align="center" headerAlign="center" renderer="onViewL"   vtype="required">预算金额(万元)</div>
                <div field="projectname"  width="100" align="center" headerAlign="center" >所属项目名称</div>
                <div field="remark"  width="100" align="center" headerAlign="center"  >备注</div>
            </div>
        </div>
    </div>
</div>
<fieldset id="field2" style="border:solid 1px #aaa;padding:0px;width: 784px;">
    <legend>采购方案材料附件</legend>
    <jsp:include page="/ame_common/detailFile.jsp"/>
</fieldset>
<div class="nui-panel" id="d3" title="审批意见列表" style="width: 770px;height: auto;">
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
	var grid_traveldetail = nui.get("grid_traveldetail");
	setData();
	document.getElementById("pipi").innerHTML="【采购方案】";
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
	            url: "com.zhonghe.ame.purchase.purchaseProgramme.queryPurProgramme.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	
	            	console.log(o)
						 var result=o.purProgrammes[0];
						 form.setData(result)
						 nui.get("proappId").setValue(result.proappId);
						 nui.get("proappId").setText(result.proAppCode);
						 
					     $("#remark").html(result.remark)
					     
						 var grid_0 = nui.get("grid_0");
        				 grid_0.load({"groupid":"purProgramme","relationid":id});
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