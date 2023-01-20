<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<!-- 
  - Author(s): Administrator
  - Date: 2014-09-23 17:01:53
  - Description:
-->
<head>
	<title>接受人确认</title>
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
    	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%" dataField="machines"
	            url="com.primeton.eos.machine.machine.machineChangeQuery.biz.ext"  
	            idField="id" sizeList="[5,10,20,50]" pageSize="10" multiSelect="true" allowCellEdit="true" allowCellSelect="true" 
        		editNextOnEnterKey="true"  editNextRowCell="true" showPager="false">
	        <!--<input name="MisMachine.id" id="machineId" class="nui-hidden" />-->
	        <div property="columns">
	        	<div field="isagree" width=60 headerAlign="center" renderer="dictIsAgree" defaultText="请选择" vtype="required">是否同意
	        		<input property="editor" id="isagree" class="nui-dictcombobox" value="" dictTypeId="MIS_MA_ISAGREE" style="width:100%;"/>
	        	</div>
	        	<div field="mid" width="0" headerAlign="center">机器ID</div>
	        	<div field="assetnum" width="60" headerAlign="center">资产编号</div>
	        	<div field="oldemp" width="60" headerAlign="center">原负责人</div>
	        	<div field="emp" headerAlign="center" width="60" >新负责人</div>
	        	<div field="oldorg" width="100" headerAlign="center">原所属部门</div>
	        	<div field="org" headerAlign="center" width="100">新所属部门</div>
	        	<div field="statusOld" width="60" renderer="dictStatus" headerAlign="center">原状态</div>
	        	<div field="areaOld" width="60" renderer="dictArea" headerAlign="center">原区域</div>
	        	<div field="area"headerAlign="center" renderer="dictArea" width="60" >新区域</div>
	        	<div field="operatorname" headerAlign="center" width="60" >更改人</div>
	        	<div field="addressOld" width="120" headerAlign="center">原存放物理地址</div>
	        	<div field="address" headerAlign="center" width="150" >新存放物理地址</div>
	        	<div field="comment" headerAlign="center" renderer="dictComment" width="150" >变更说明</div>
	        	<div field="remarks" headerAlign="center" width="150" >备注</div>
	        	<div field="changetime" allowSort="true" headerAlign="center" width="0" >更改时间</div>
	        </div>
	     </div>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
	    <a class="nui-button" iconCls="icon-ok" onclick="ok()">确认</a>
	    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
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
		var data={machineChange:{processinstid:processinstid,usingemp:userid}};
		grid.load(data);
		
		function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		}
		
		function init(){
		} 
		
        function toggleFieldSet(ck, id) {
            var dom = document.getElementById(id);
            dom.className = !ck.checked ? "hideFieldset" : "";
        }
	
	function ok() {
		grid.validate();
		if(!grid.isValid()){
            return;
    	}
		grid.selectAll();	
		var data=grid.getSelecteds();
        var json =nui.encode({machinechanges:data,workitemid:workitemid});
        nui.ajax({
            url: "com.primeton.eos.machine.machine.machineChangeAgree.biz.ext",
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

	function onViewProcess(e) {
    	window.open('org.gocom.foundation.wfframe.FlowManageClient.flow?processInstID='+processinstid,'_blank','location=no,status=no,resizable=yes,scrollbars=yes,screenX=0,screenY=0,width=800,height=600');
    }
    	
	function onCancel(e) {
		if (window.CloseOwnerWindow) 
			return window.CloseOwnerWindow(e);
        else 
        	window.close();  
    }
    
    function dictIsAgree(e){
    	return nui.getDictText("MIS_MA_ISAGREE",e.value);
    }
    
    function dictComment(e){
    	 return nui.getDictText("MIS_EDITCOMMENT",e.value);
    }
    
    function dictStatus(e){
		return nui.getDictText("MIS_MA_STATUS",e.value);
	}
	
	function dictArea(e){
		return nui.getDictText("EXP_REGION",e.value);
	}
    </script>
</body>
</html>