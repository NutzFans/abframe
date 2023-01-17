<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<head>
	<title>批量更改机器</title>
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
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%;" dataField="machines" 
	    url="com.primeton.eos.machine.machine.getMachine2.biz.ext" idField="id" showPager="false" 
	    multiSelect="true" allowCellEdit="true" allowCellSelect="true" editNextOnEnterKey="true" editNextRowCell="true">
	        <div property="columns">
	        	<div field="id" width="0" headerAlign="center" renderer="onActionRenderer">机器id</div>
	        	<div field="assetnum" width="80" headerAlign="center">资产编号</div>
	        	<div field="usingempname" width="60" headerAlign="center">原负责人</div>
	        	<div field="newusingemp" headerAlign="center" width="60" >新负责人
	        		<input property="editor" id="newemp" class="nui-buttonedit" style="width:150px;" 
	        		onbuttonclick="showEmployee" showClose="true" oncloseclick="onCloseClick1" allowInput="false"/>
	        	</div>
	        	<div field="newuserid" headerAlign="center" width="0">新负责人id</div>
	        	<div field="deptname" width="100" headerAlign="center">原所属部门</div>
	        	<div field="newdept" headerAlign="center" width="100">新所属部门
	        		<input property="editor" id="neworg" class="nui-buttonedit" style="width:150px;" 
	        		onbuttonclick="showDept" showClose="true" oncloseclick="onCloseClick2" allowInput="false"/>
	        	</div>
	        	<div field="newdeptid" headerAlign="center" width="0">新所属部门id</div>
	        	<div field="status" width="60" renderer="dictStatus" headerAlign="center">原状态</div>
	        	
	        	<div field="storageType" width="0" renderer="dictStorageType" headerAlign="center">原管理类型</div>
	        	<div field="newstorageType" headerAlign="center" renderer="dictStorageType" width="0">
	        	新管理类型
	        		<input property="editor" id="newstorage" class="nui-dictcombobox" dictTypeId="MIS_MA_STORAGE" 
	        		style="width:100%;"/>
	        	</div>	        	
	        	
	        	<div field="area" width="60" renderer="dictArea" headerAlign="center">原区域</div>
	        	<div field="newarea" headerAlign="center" renderer="dictArea" width="60" vtype="required">新区域
	        		<input property="editor" id="newarea" class="nui-dictcombobox" dictTypeId="EXP_REGION" 
	        		style="width:100%;"/>
	        	</div>
	        	<div field="operatorname" headerAlign="center" width="60" vtype="required">更改人
	        		<input property="editor" class="nui-buttonedit" style="width:100%;"	onbuttonclick="showOperator" 
	        		showClose="true" oncloseclick="onCloseClick" allowInput="false"/>
	        	</div>
	        	<div field="operator" headerAlign="center" width="0">更改人id</div>
	        	<div field="address" width="120" headerAlign="center">原存放物理地址</div>
	        	<div field="newaddress" headerAlign="center" width="150" >新存放物理地址
	        		<input property="editor" class="nui-textbox" style="width:100%;" />
	        	</div>
	        	<div field="comment" headerAlign="center" renderer="dictComment" width="150" >变更说明
	        		<input property="editor" class="nui-dictcombobox" dictTypeId="MIS_EDITCOMMENT" style="width:100%;"/>
	        	</div>
	        	<div field="remark" headerAlign="center" width="150" >备注
	        		<input property="editor" class="nui-textbox" style="width:100%;"/>
	        	</div>
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
		var data = grid.getSelecteds();
        var json = {mismachinechanges:data};
        if(confirm("确认提交？")){
            grid.loading("操作中，请稍后......");
            nui.ajax({
                url: "com.primeton.eos.machine.machine.machineModifyBatch.biz.ext",
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
	
	function dictStatus(e){
		return nui.getDictText("MIS_MA_STATUS",e.value);
	}
	
	function dictArea(e){
		return nui.getDictText("EXP_REGION",e.value);
	}
	
	function dictStorageType(e){
		return nui.getDictText("MIS_MA_STORAGE",e.value);
	}

	function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
						var row = grid.getSelected();
		                btnEdit.setValue(data.empname);
                        var rowData = {newusingemp:data.empname,newuserid:data.userid,newdept:data.orgname,newdeptid:data.orgid};
                        grid.updateRow(row,rowData);
					}
				}
			}
		});
	}
	
	function showDept(e){
    	var btnEdit = this;
		nui.open({
            url:"<%=request.getContextPath() %>/machine/SelectOrganization.jsp",
			title: "选择列表",
			width: 650,
			height: 380,
			ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须克隆
                    if (data) {                   	
		                var row = grid.getSelected();
		                btnEdit.setValue(data.orgname);
                        var rowData = {newdept:data.orgname,newdeptid:data.orgid};
                        grid.updateRow(row,rowData);
                    }
                }
			}
        });
    }	
	
	function showOperator(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/machine/SelectOperator.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
						var row = grid.getSelected();
		                btnEdit.setValue(data.empname);
                        var rowData = {operatorname:data.empname,operator:data.userid};
                        grid.updateRow(row,rowData);
					}
				}
			}
		});
	}
	
	function onCloseClick1(e) {
        var obj = e.sender;
        obj.setText("");
        obj.setValue("");
        var row = grid.getSelected();
        var rowData = {newusingemp:"",newuserid:""};
        grid.updateRow(row,rowData);
    }
    
    function onCloseClick2(e) {
        var obj = e.sender;
        obj.setText("");
        obj.setValue("");
        var row = grid.getSelected();
        var rowData = {newusingemp:"",newuserid:"",newdept:"",newdeptid:""};
        grid.updateRow(row,rowData);
    }
	
	function dictComment(e){
    	 return nui.getDictText("MIS_EDITCOMMENT",e.value);
    }
	
	function onCancel(e) {
		if (window.CloseOwnerWindow) 
			return window.CloseOwnerWindow(e);
        else window.close();  
    }
</script>