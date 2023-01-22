<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<head>
	<title>行政更改机器</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<link href="../demo.css" rel="stylesheet" type="text/css"/>
	<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>
</head>
<body>
	<div class="nui-fit">
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%" dataField="machines"
	            url="com.primeton.eos.machine.machine.getMachine3.biz.ext"  
	            idField="id" sizeList="[5,10,20,50]" pageSize="10" multiSelect="true" allowCellEdit="true" allowCellSelect="true" 
	    		editNextOnEnterKey="true" editNextRowCell="true" showPager="false">
	        <div property="columns">
	        	<div field="mid" width="0" headerAlign="center">机器id</div>
	        	<div field="assetnum" width="60" headerAlign="center">资产编号</div>
	        	<div field="oldemp" width="60" headerAlign="center">原负责人</div>
	        	<div field="emp" headerAlign="center" width="60" >新负责人</div>
	        	<div field="oldorg" width="100" headerAlign="center">原所属部门</div>
	        	<div field="org" headerAlign="center" width="100">新所属部门</div>
	        	<div field="statusOld" width="100" renderer="dictStatus" headerAlign="center">原状态</div>
	        	<div field="status" headerAlign="center" renderer="dictStatus" width="100" vtype="required">新状态
	        		<input property="editor" id="status1" class="nui-combobox" style="width:100%;" textField="dictName" valueField="dictID" data='[{"dictID":"0","dictName":"使用"},{"dictID":"1","dictName":"入库闲置"},{"dictID":"2","dictName":"入库待修"},{"dictID":"3","dictName":"入库待报废"}]'/>
	        	</div>

	        	<div field="storagetypeOld" width="100" renderer="dictStorageType" headerAlign="center">原管理类型</div>
	        	<div field="storagetype" headerAlign="center" renderer="dictStorageType" width="100" vtype="required">
	        	新管理类型
	        		<input property="editor" id="newstorage" class="nui-dictcombobox" dictTypeId="MIS_MA_STORAGE" 
	        		style="width:100%;"/>
	        	</div>	 
	        	
	        	<div field="areaOld" width="60" renderer="dictArea" headerAlign="center">原区域</div>
	        	<div field="area"headerAlign="center" renderer="dictArea" width="60" >新区域</div>
	        	<div field="operatorname" headerAlign="center" width="60" >更改人</div>
	        	<div field="addressOld" width="120" headerAlign="center">原存放物理地址</div>
	        	<div field="address" headerAlign="center" width="150" >新存放物理地址</div>
	        	<div field="comment" headerAlign="center" renderer="dictComment"width="150" >变更说明</div>
	        	<div field="remarks" headerAlign="center" width="150" >备注</div>
	        	<div field="changetime" allowSort="true" headerAlign="center" width="0" >更改时间</div>
	        </div>
		</div>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
		<a class="nui-button" iconCls="icon-ok" onclick="ok()">确认</a>
	    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div>
    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
    	<div id="form1">
    	<table>
    		<tr>
    			<td>
            		<input class="nui-hidden" name="criteria._expr[0]._value" id="pst1"/>
            		<input class="nui-hidden" name="criteria._expr[0]._property" id="pst2"/>
			        <input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
			    </td>
    		</tr>
    	</table>
       	</div>           
    </div>
</body>
</html>

<script type="text/javascript">
	var processinstid = "<b:write property='workitem/processInstID'/>";
	var workitemid = "<b:write property='workitem/workItemID'/>";
	var empname = "<b:write property='userObject/userName' scope='session'/>";
	var userid = "<b:write property='userObject/userId' scope='session'/>";
	nui.parse();
	var grid=nui.get("datagrid1");
	search();
	
	function search(){
		nui.get("pst1").setValue(processinstid);
		nui.get("pst2").setValue("processinstid");
		var form = new nui.Form("#form1");
		var data = form.getData();
    	grid.load(data);
	}
	
	function SetData(data){
            //跨页面传递的数据对象，克隆后才可以安全使用
            data = nui.clone(data);
			grid.load(data);
	}

	function ok() {
		grid.validate();
		if(!grid.isValid()){
            return;
    	}
		grid.selectAll();
		var machines=grid.getSelecteds();
		json = {Machines:machines,workitemid:workitemid};
        if(confirm("确认提交？")){
            grid.loading("操作中，请稍后......");
            nui.ajax({
                url: "com.primeton.eos.machine.machine.adminChange.biz.ext",
                type: "post",
                data: json, 
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                    onCancel("更改成功");
                },
                error: function () {
                }
            });
        }
     }
	
	function dictStatus(e){
		return nui.getDictText("MIS_MA_STATUS",e.value);
	}
	
	function dictArea(e){
		return nui.getDictText("EXP_REGION",e.value);
	}
	
	function dictComment(e){
    	 return nui.getDictText("MIS_EDITCOMMENT",e.value);
    }
	
	function dictStorageType(e){
		return nui.getDictText("MIS_MA_STORAGE",e.value);
	}

	function onCancel(e) {
		if (window.CloseOwnerWindow) 
			return window.CloseOwnerWindow(e);
        else window.close();  
    }
</script>
