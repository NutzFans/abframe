<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): xpc
  - Date: 2019-10-11 14:24:20
  - Description:
-->
<head>
	<title>批量导入统计指标值</title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    #box{
	    	width:100%;
	    	height: 100%;
	    	background: rgba(122,122,122,0.8);
	    	text-align:center;
	    	line-height:100px;
	    	color:#1C1C1C;
	    	position: absolute;
	    	top:0;
	    	bottom:0;
	    	left:0;
	    	right:0;
	     	z-inde:999;
	    	display: none;
	    	font-size:16px;
	    }
	    #form2{
	    	visibility: visible;
	    }
    </style>
</head>
<body>
	<form id="form2" action="com.primeton.xbb.importExcel.importReportQuotaStore.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
	            	<td style="width:550px;" colspan="5">
	            		请选择附件：<input type='file' id="uploadfile" name='uploadfile' >
	       	  		</td>
                </tr>
                <tr>
		            <td style="width:2%;" align="left">上传注意事项：</td>
			        <td style="width:12%;" align="left">
			        	<div style="color: red;">（1）上传用的 Excel 文件版本为 97-2003版本，即以 .xls 为后缀的版本，数据全部放在第一个工作表内。</div>
			        	<div style="color: red;">（2）标注业务字典的字段格式请和月度统计指标值新增页面下拉框里的内容保持一致。</div>
			       	</td>
		        </tr>
		        <tr>
		        	<td style="width:13%;"colspan="5"><a href="/default/abframe/import-template/importReportQuotaStore.xls">点击下载Excel 模板文件</a></td>
		        </tr>
            </table>           
        </div>
        </form>
       
        <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
	  <div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel()" style="width:60px;margin-right:20px;">取消</a>  
	  </div>
	  <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
</body>

<script type="text/javascript">
	nui.parse();
    var form3 = new nui.Form("form2");
	function onOk(){
			var fileName = document.getElementById("uploadfile").value;
			if(fileName == ""){
				alert("请选择附件！");
				return;
			}else{
				form2.submit();
				form3.mask("月度指标值正在导入，请稍等...");
				//nui.get("sureButton").setEnabled(false);
			}
		}
		
	function test(data){
		var aaa = eval('(' + data + ')');
		var errormsg = aaa.errormessage;
		var msg = aaa.msg;
		var succcount = aaa.succcount;
		var errcount = aaa.errcount;
		
		if(msg =='0'){
			if(succcount>0){
			    form3.unmask();
				if(errcount>0){
					alert("导入成功："+succcount+"条,导入失败："+errcount+"条,其中月度统计指标名为："+errormsg+",请确认！");
				}else{
					alert("导入成功："+succcount+"条");
					CloseWindow("ok");
				}
			}else{
				alert("没有数据导入！");
			}
		}else{
		    form3.unmask();
			alert("导入失败！")
		}
	}
	
	//关闭
   function onCancel(e){
		CloseWindow(e);
	}
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
</script>
</html>