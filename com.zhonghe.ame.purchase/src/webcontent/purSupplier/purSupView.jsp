<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
<title>新增/编辑供应商信息</title>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
		<form id="form1" method="post">
			<!-- 供应商id -->
			<input name="purSupplier.files" id="fileids" class="nui-hidden"/>
			<input name="purSupplier.custid" id="custid"  class="nui-hidden"/>
			<!-- 创建人id，默认当前用户id -->
			<input name="purSupplier.createUserid" id="createUserid" class="nui-hidden"/>
			<!-- 文件上传 -->
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>基本资料</legend>
				<table style="table-layout:fixed;" id="table_file1">
					<tr>
						<td colspan="1" align="right" style="width:120px">供应商名称:</td>
						<td colspan="3"><input name="purSupplier.custname" id="custname" class="nui-textbox" style="width:100%"/></td>
					</tr>
					<tr>
						<td colspan="1" align="right" style="width:120px">供应商简称:</td>
						<td><input name="purSupplier.suppliersname" id="suppliersname" class="nui-textbox"  style="width:100%" showNullItem="true" /></td>
						<td align="right" style="width:120px">注册资金(万元):</td>
						<td><input name="purSupplier.registercap" id="registercap" class="nui-textbox" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商联系人:</td>
						<td><input name="purSupplier.linkman" id="linkman" class="nui-textbox" style="width:100%"/></td>
						<td align="right" style="width:120px">供应商联系电话:</td>
						<td><input name="purSupplier.linktel" id="linktel" class="nui-textbox" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">是否合格供应商:</td>
						<td><input name="purSupplier.isqualified" id="isqualified" class="nui-dictcombobox" dictTypeId="MIS_YN" style="width:100%"/></td>
						<td align="right" style="width:120px">供应商类型:</td>
						<td><input name="purSupplier.custtype" id="custtype"  style="width:100%" class="nui-dictcombobox" dictTypeId="AME_SUPTYPE"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">综合评价:</td>
						<td><input name="purSupplier.appraise" id="appraise" class="nui-dictcombobox" dictTypeId="ZH_APPRAISE" style="width:100%"/></td>
						<td align="right" style="width:120px">年度监督检查:</td>
						<td><input name="purSupplier.inspect" id="inspect" class="nui-dictcombobox" dictTypeId="ZH_INSPECT" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">不良行为:</td>
						<td><input name="purSupplier.misconduct" id="misconduct" class="nui-textbox" style="width:100%"/></td>
					</tr>
					<tr>
						<td colspan="1" align="right" style="width:120px">供货范围:</td>
						<td colspan="3"><input name="purSupplier.comments" id="comments" class="nui-textarea" style="width:100%"/></td>
					</tr>
				</table>
			</fieldset>
		</form>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="closeCancel()" style="width:60px;">关闭</a>
</div>
<script type="text/javascript">
        nui.parse();
	  	var form = new nui.Form("form1");
	  	form.setEnabled(false)
    	var dataAction=""; 
	    function SetData(data){
	    	data = nui.clone(data);
	    	dataAction = data.action;
	    		var json = nui.encode({purSupplier:data}); 
	        	ajaxCommon({
	        		url: "com.primeton.eos.ame_pur.PurSupplier.getPurSupplierDetail.biz.ext",
	                data: json,
	                success: function (o) {
	                console.log(o)
	                    form.setData(o);
	                    var grid_0 = nui.get("grid_0");
	        				 grid_0.load({"groupid":"purSupplier","relationid":o.purSupplier.custid});
							 grid_0.sortBy("fileTime","desc");
	                }
	        	});
    	}
		
    </script>
</body>
</html>
