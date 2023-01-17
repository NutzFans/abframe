<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@include file="/common/common.jsp"%>
<head>

	<title>导入Excel</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
    <div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
            		<td>
            		<div id="upload_div"></div>
                        <input class="nui-button" onclick="startUpload" text="确认">
                        <a class="nui-button" onclick="onCancel('cancel')">关闭</a>
                    </td>
                </tr>
            </table>           
        </div>
	</div>
</div>
<div id="a" style="width:100%;color:red" >
	<table>
		<tr>
			<td>资产编号为：</td>
		<tr>
		<tr>
			<td id="result"></td>
		</tr>
		<tr>
			<td>的机器上传失败，因为资产编号已存在，请在Excel中重新修改</td>
		</tr>
	</table>
</div> 
<script type="text/javascript">

	document.getElementById("a").style.display = "none";
	var sf;
    sf=new SWFFileUpload(nui.decode({
    		name:'machine.fileids',
    		renderTo:'#upload_div',
			value:'',
			cancelBtnText:'取消上传',
			maxFileCount:1,
			minFileCount:1,
			width:'',
			height:'',
			hasCancel:false,
			hiddenType:'nui',
			autoUpload:false,
			uploadUrl:'com.primeton.eos.machine.fileImport.flow'}));
	
	function startUpload(){
		sf.startUpload(succ,function(){
			alert('资产文件上传失败！');
		});
	}
	
	function succ(){
		var result = sf.getValue();
		if(result == "null"){
			nui.alert("资产文件上传成功!");
			onCancel("success");
		} else {
			nui.alert("资产编号为:"+result+"的资产已存在，请在Excel中重新更改");
			document.getElementById("a").style.display = "";
			document.getElementById("result").innerHTML = result;
		}
	}
	
	function onCancel(e) {   	
    	if(window.CloseOwnerWindow){
    	 	return window.CloseOwnerWindow(e);
    	}else{
			window.close();
    	}  
    }
</script>
</body>
</html>