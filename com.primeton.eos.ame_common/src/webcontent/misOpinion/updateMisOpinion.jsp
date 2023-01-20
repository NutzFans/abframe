<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
<title>编辑审批意见</title>
<%@include file="/common/skins/skin0/component.jsp" %>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<div title="编辑审批意见">
	 	<form id="form1" method="post" >
	 		<input class="nui-hidden" id="processflowid" name="misopinion.processflowid">
        	<table style="table-layout:fixed;" id="table_file1">
	            <tr>
					<td align="left">审批意见：</td>
				</tr>
				<tr>
					<td align="center">
						<input name="misopinion.auditopinion" id="auditopinion" class="nui-textarea" style="width:390px;height: 90px" />
					</td>
				</tr>
        	</table>
        </form>
  	</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="save" id="a" style="width:60px;margin-right:20px;">保存</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="kos">关闭</a>
</div>
    <script type="text/javascript">
		nui.parse();
    	var form = new nui.Form("form1");
    	var saveURL ="com.primeton.eos.ame_common.misOpinions.updateMisOpinion.biz.ext";
    	
    	function setData(data){
    		var processflowid = data.processflowid;
    		var auditopinion = data.auditopinion;
    		nui.get("auditopinion").setValue(auditopinion);
    		nui.get("processflowid").setValue(processflowid);
    	}
    	
    	function save(){
    		if(!form.validate()){
				alert("请检查表单的完整性!");
				return;
			}
    		var data = form.getData();
    		var json =nui.encode({"misopinion":data.misopinion});
			nui.ajax({
		        type:'post',
		        data:data,
		        async:false,
		        contentType: 'text/json',
		        url:saveURL,
		        success:function(o){
		        	var result = o.result;
		        	if(result=='1'){
		        		alert("保存成功！");
		        		onCancel("ok");
		        	}else{
		        		alert("保存失败！");
		        	}
		        }
			});
    	}
    	
	    function CloseWindow(action) {            
	        if (action == "close" && form.isChanged()) {
	            if (confirm("数据被修改了，是否先保存？")) {
	                return false;
	            }
	        }
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();            
	    }
	
	    function onCancel(e) {
	        CloseWindow(e);
	    }
	    
   	</script>
</body>
</html>