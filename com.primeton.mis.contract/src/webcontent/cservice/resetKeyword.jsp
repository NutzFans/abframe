<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/nui/common.jsp" %>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2015-07-27 16:35:21
  - Description:
-->
<head>
<title>上传关键词报表</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="../demo.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js"></script>
</head>
<body>
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:120px;" align="right">报表上传：</td>
	            	<td style="width:670px;" colspan="5">
	            		<div id="upload_div"></div>
	       	  		</td>
                </tr>
            </table>           
        </div>
    </div>
    <div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">               
	    <a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
	</div>
</body>
<script>
	nui.parse();
	
	var sf;
    sf=new SWFFileUpload(nui.decode({
		name:'machine.fileids',
		renderTo:'#upload_div',
		value:'',
		cancelBtnText:'取消上传',
		maxFileCount:3,
		minFileCount:0,
		width:'',
		height:'',
		hasCancel:false,
		hiddenType:'nui',
		autoUpload:false,
		uploadUrl:'com.primeton.mis.contract.keyword.resetKeyword.biz.ext'}));
	
	function onOk(){
		startUpload(succ);
	}
	
	function succ(){
		alert("上传成功!");
	}
		
	function startUpload(succ){
		sf.startUpload(function(){
			if(succ){
				succ();
			}
		},function(){
			alert('文件上传失败！');
		});
	}
</script>
</html>