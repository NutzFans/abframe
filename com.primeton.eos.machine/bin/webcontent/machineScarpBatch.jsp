<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="commonj.sdo.DataObject"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>

<head>
	<title>批量报废机器</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table id="a1" style="color:red;display:none">
				<tr>
					<td>资产编号：</td>
				<tr>
				<tr>
					<td id="result"><%=request.getAttribute("noexist")%></td>
					<td>不存在，请在Excel中重新确认</td>
				</tr>
			</table>
    	</div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" url="com.primeton.eos.machine.machine.getToScrap.biz.ext" dataField="machines" showPager="false" multiSelect="true">
	        <div property="columns">
	        	<div type="checkcolumn"></div>
	        	<div field="id" width="0" headerAlign="center" renderer="onActionRenderer">机器id</div>
	        	<div field="assetnum" width="80" headerAlign="center">资产编号</div>
	        	<div field="emp" width="60" headerAlign="center">负责人</div>
	        	<div field="org" width="80" headerAlign="center">所属部门</div>
	        	<div field="area" width="60" renderer="dictArea" headerAlign="center">区域</div>
	        	<div field="status" width="60" renderer="dictStatus" headerAlign="center" allowSort="true">状态</div>
	        	<div field="secType" width="60" renderer="dictType" headerAlign="center">类型</div>
	        	<div field="storageType" width="60" renderer="dictStorageType" headerAlign="center">管理类型</div>
	        	<div field="assetAmount" headerAlign="center" width="80">资产原值</div>
	        	<div field="depreciableAmount" headerAlign="center" width="80">月折旧额</div>
	        	<div field="hasdepreciableAmount" headerAlign="center" width="80">已折旧金额</div>
	        	<div field="net" headerAlign="center" width="80">净资产</div>
	        	<div field="temporaryscrap" headerAlign="center" width="150">报废原因</div>
	        </div>
	    </div>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
	    <a class="nui-button" iconCls="icon-ok" onclick="ok()">确认</a>
	    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div>	
</body>
</html>

<script type="text/javascript">
	nui.parse();
	var grid=nui.get("datagrid1");
	if(document.getElementById("result").innerHTML != "null"){
		document.getElementById("a1").style.display = "";
	}
	var exist = "<b:write property='exist'/>";
	grid.load({"exist":exist});
	
	
	function SetData(data){
        //跨页面传递的数据对象，克隆后才可以安全使用
        data = nui.clone(data);
		grid.load(data);
	}
 
	function ok() {
		var rows = grid.getSelecteds();
		var status=0;
		if(rows.length<1){
			nui.alert("请选择其中一条机器数据!");
			return;
		}
		for(var i=0;i<rows.length;i++){
			status = rows[i].status;
			if(status == 4){
				nui.alert("已报废的机器不能再次报废,请去掉相应勾选!");
				return;
			}
		}
        var json = {data:rows};
        if(confirm("确认报废？")){
            grid.loading("操作中，请稍后......");
            nui.ajax({
                url: "com.primeton.eos.machine.machine.machineScrapBatch.biz.ext",
                type: "post",
                data: json, 
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                    onCancel("save");
                },
                error: function () {
                }
            });
        }
     }
     
     function dictType(e){
		return nui.getDictText("MIS_MA_SECTYPE",e.value);
	}
	
	function dictStatus(e){
		return nui.getDictText("MIS_MA_STATUS",e.value);
	}
	
	function dictArea(e){
		return nui.getDictText("EXP_REGION",e.value);
	}
	
	function dictStorageType(e){
		return nui.getDictText("MIS_MA_STORAGE",e.value);
	}
	
	<%--function checkColumns(e){
		if (e.cellCls == "mini-checkcolumn") {
			if(e.row.status == "4"){
				e.cellHtml = "";
			} else {
				grid.select(e.row);
			}
        }
	}--%>
	function onCancel(e) {
		if (window.CloseOwnerWindow) 
			return window.CloseOwnerWindow(e);
        else window.close();  
    }
</script>