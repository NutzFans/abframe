<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<!-- 
  - Author(s): Pegasus
  - Date: 2015-05-26 17:05:09
  - Description:
-->
<head>
	<title>批量报废审批</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script>
		$(function(){
			nui.context='/default'
		})
	</script>
    <style type="text/css">
    	body{
        	margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    	}
    </style>
</head>
<body>

	<div class="nui-fit">
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%;" dataField="machines" url="com.primeton.eos.machine.machine.machineDiscardConfirmQuery.biz.ext" 
	    	idField="id" showPager="true" multiSelect="true" allowCellEdit="true" allowCellSelect="true" editNextOnEnterKey="true" editNextRowCell="true">
     	       	<div property="columns">
	        	<div field="isagree" width="120" headerAlign="center" renderer="dictIsAgree" defaultText="请选择" vtype="required">是否同意报废
	        		<input property="editor" id="isagree" class="nui-dictcombobox" value="" dictTypeId="MIS_MA_ISAGREE" style="width:100%;"/>
	        	</div>
	        	<div field="id" width="0" headerAlign="center">资产id</div>
	        	<div field="assetnum" width="80" headerAlign="center" allowSort="true">资产编号</div>
	        	<div field="buytime"width="80" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">购买日期</div>
	        	<div field="assetAmount" width="100" headerAlign="center" dataType="currency" currencyUnit="￥" allowSort="true" summaryType="sum">资产原值(元)</div>
	        	<div field="type"width="80" renderer="dictType" headerAlign="center" allowSort="true">资产父类型</div>
	        	<div field="secType"width="120" renderer="dictSecType" headerAlign="center" allowSort="true">资产子类型</div>
	        	<div field="status"width="60" renderer="dictStatus" headerAlign="center" allowSort="true">状态</div>
	        	<div field="area" renderer="dictArea" width="60" headerAlign="center" allowSort="true">区域</div>
	        	<div field="storageType"width="60" renderer="dictStorageType" headerAlign="center" allowSort="true">管理类型</div>
	        	<div field="usingempname"width="60" headerAlign="center">负责人</div>
	        	<div field="deptname" width="120" headerAlign="center">所属部门</div>
	        	<div field="brand"width="100" headerAlign="center" allowSort="true">品牌</div>
	        	<div field="configuration"width="120" headerAlign="center" allowSort="true">配置</div>
	        	<div field="comment" headerAlign="center" width="150" >报废原因</div>
	        	<div field="operatorname" width="80" headerAlign="center">报废操作人</div>
	        	<div field="changetime" width="120" headerAlign="center">报废时间</div>
	        </div>
	    </div>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
	    <a class="nui-button" iconCls="icon-ok" onclick="ok()">报废</a>
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
<script type="text/javascript">
	
    var processinstid = "<b:write property='workitem/processInstID'/>";
   	var processinstname = "<b:write property='workitem/processInstName'/>";
    var activitydefid = "<b:write property='workitem/activityDefID'/>";
    var workitemid = "<b:write property='workitem/workItemID'/>";
    var workitemname = "<b:write property='workitem/workItemName'/>";
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
	
	function ok() {
	
		grid.validate();
		if(!grid.isValid()){
            return;
    	}
		grid.selectAll();	
		
		var data=grid.getSelecteds();
		
        var json =nui.encode({machines:data,workitemid:workitemid});
        
        nui.ajax({
            url: "com.primeton.eos.machine.machine.machineDiscardConfirm.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function () {
				onCancel("同意");            	
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
                window.CloseOwnerWindow();
                //CloseWindow();
            }
        });
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
	
	function dictIsAgree(e) {
		return nui.getDictText("MIS_MA_ISAGREE",e.value);
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
    
    function dictType(e){
		return nui.getDictText("MIS_MA_TYPE",e.value);
	}
	
	function dictSecType(e){
		return nui.getDictText("MIS_MA_SECTYPE",e.value);
	}
    
</script>
</body>
</html>