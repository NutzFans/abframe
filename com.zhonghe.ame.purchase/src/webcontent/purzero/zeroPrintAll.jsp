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
<div title="零星采购打印" style="height: auto" >
	<div id="pipi" class="nui-panel" style="font-size: 20px;width: 240px;height: 30px;margin-left: 309px"  align="center"></div>
	<div class="mini-panel" title="基本信息" style="width: 786px;height: 220px">
    	<form id="form1">
    	<table style="table-layout:fixed;" id="table_file1" >
    		<tr>
				<td align="right" style="width:100px">零星采购名称：</td>
				<td style="width:220px" >
					<input id="purchaseName" name="purchaseName" class="nui-textbox" borderStyle="border:0" width="100%"/>
				</td>
				<td align="right" style="width:100px">编号：</td>
				<td style="width:120px" >
					<input id="purchaseCode" name="purchaseCode" class="nui-textbox" borderStyle="border:0" width="100%"/>
				</td>
			</tr>
			<tr>
				<td align="right" style="width:100px">填报人：</td>
				<td  style="width:220px">
					<input name="createdName" id="createdName"  class="nui-textbox" borderStyle="border:0" width="100%"/> 
				</td>
				<td align="right" style="width:100px">采购单位：</td>
				<td style="width:220px" >
					<input name="orgname" id="orgname"  class="nui-textbox" borderStyle="border:0" width="100%"/> 
					
				</td>
			</tr>
            <tr>
                <td align="right" style="width:100px">部门负责人：</td>
				<td style="width:220px" >
					<input name="managerName" id="managerName"  class="nui-textbox" borderStyle="border:0" width="100%"/>
					
				</td>
                <td align="right" style="width:100px">分管领导：</td>
                <td style="width:120px" >
					<input name="leaderName" id="leaderName"  class="nui-textbox" borderStyle="border:0" width="100%"/>
                </td>
        	</tr>
        	<tr>
                <td align="right" style="width:100px">总金额(万元)：</td>
                <td style="width:220px" >
					<input name="totalAmount" id="totalAmount"  class="nui-textbox" borderStyle="border:0" width="100%"/>
                </td>
    		   <td class="form_label selectReportUser" align="right">采购备案人员：</td>
                <td style="width:220px" >
					<input name="reportUserName" id="reportUserName"  class="nui-textbox" borderStyle="border:0" width="100%"/>
                </td>
        	</tr>
        	<tr>
        		<td align="right" style="width:100px">申请原因：</td>
                 <td  colspan="7">    
                    <input style="width:100%;height: 70px;" name="applyReason" class="nui-textarea" borderStyle="border:0" width="100%"/>
                </td>
        	</tr>
    	</table>
    	</form>
    </div>
    <!--报销明细  --> 
	<div class="mini-panel" title="明细" style="width: 788px;height: auto;">
        <div id="datagrid1" class="nui-datagrid" style="width:100%;height: auto;" multiSelect="true" allowCellwrap="true"
        	sortMode="client"  url="com.zhonghe.ame.purchase.purchaseItems.queryPurZeroItem.biz.ext"
            showFooter="false" showPager="false" allowSortColumn="true" dataField="purZeroItem">
            <div property="columns">
            	<div type="indexcolumn" align="center" headerAlign="center">序号</div>
                <div field="itemName"  width="130" align="center" headerAlign="center"  vtype="required">采购物项名称</div>
				<div  field="brandSpec" width="130" align="center" headerAlign="center"  >品牌/型号/规格</div>
                <div   field="unit" displayField="unit"  width="70" align="center" headerAlign="center"  >单位</div>
                <div  field="onePrice"  width="80" align="center" headerAlign="center"  vtype="required">单价(万元)</div>
                <div  field="num"  width="70" align="center" headerAlign="center"   vtype="required">数量</div>
                <div   field="totalPrice" width="130" align="center" headerAlign="center"  >总价(万元)</div>
            </div>
        </div>
    </div>
    <div class="nui-panel" id="d3" title="审批意见列表" style="width: 788px;height: auto;">
    	<div id="datagrid4" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions" showFooter="false" 
		    url="com.zhonghe.ame.purchase.common.queryPlanApproval.biz.ext"  idField="id"  showPager="false">
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
	document.getElementById("pipi").innerHTML="【零星采购申请】";
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
	            url: "com.zhonghe.ame.purchase.purchaseProApp.queryPurZeroDetailByid.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	form.setData(o.purZero)
					form.setEnabled(false);
					
					var jsonData = {"zeroId": o.purZero.id}
	                grid1.load(jsonData);
		                console.log(o)
	                var processInstID = o.purZero.processid;
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