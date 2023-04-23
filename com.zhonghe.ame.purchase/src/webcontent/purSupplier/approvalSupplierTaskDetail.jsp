<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
    <title>供应商审核</title>
</head>
<body>
    	<div class="nui-fit" >
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 98%;">
				<legend>供应商信息</legend>
				<form id="form1" method="post">
			<!-- 供应商id -->
			<input name="purSupplier.files" id="fileids" class="nui-hidden"/>
			<input name="custid" id="custid"  class="nui-hidden"/>
			<!-- 创建人id，默认当前用户id -->
			<input name="createUserid" id="createUserid" class="nui-hidden"/>
			<!-- 文件上传 -->
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>基本资料</legend>
				<table style="table-layout:fixed;" id="table_file1">
					<tr>
						<td colspan="1" align="right" style="width:120px">供应商名称:</td>
						<td colspan="3"><input name="custname" id="custname" class="nui-textbox" required="true" style="width:100%"/></td>
						
					</tr>
					<tr>
						<td colspan="1" align="right" style="width:120px">供应商简称:</td>
						<td><input name="suppliersname" id="suppliersname" class="nui-textbox"  style="width:100%" showNullItem="true" /></td>
						<td align="right" style="width:120px">注册资金(万元):</td>
						<td><input name="registercap" id="registercap" class="nui-spinner" maxValue="9999999999999999" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商联系人:</td>
						<td><input name="linkman" id="linkman" class="nui-textbox" style="width:100%"/></td>
						<td align="right" style="width:120px">供应商联系电话:</td>
						<td><input name="linktel" id="linktel" class="nui-textbox" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商类型:</td>
						<td>
							<input name="custtype"  class="nui-dictcombobox" dictTypeId="AME_SUPTYPE" showNullItem="true" style="width:100%"/>
						</td>
					</tr>
					<tr>
						<td colspan="1" align="right" style="width:120px">供货范围:</td>
						<td colspan="3"><input name="comments" id="comments" class="nui-textarea" style="width:100%"/ emptyText=" 填写合同所涉及需评价物项"></td>
					</tr>
				</table>
			</fieldset>
		</form>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>附件</legend>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</fieldset>
        </fieldset>
	</div>
	
<script type="text/javascript">
	    nui.parse();
	    var form = new nui.Form("#form1");
	   	form.setEnabled(false);
	   	var workitemid = <%=request.getParameter("workItemID")%>;
	   	init();
	   	function init(){
	   		var json = nui.encode({"workitemid":workitemid});
	   		nui.ajax({	
					url: "com.zhonghe.ame.purchase.purSupplier.querySupplierDetail.biz.ext",
				    type: 'POST',
			        data: json,
			        success: function (o) {
						 form.setData(o.data);
						 
						 // 展示附件
						 var grid_0 = nui.get("grid_0");
        				 grid_0.load({"groupid":"purSupplier","relationid":o.data.custid});
						 grid_0.sortBy("fileTime","desc");
			       		 
			        },
				    error: function (jqXHR, textStatus, errorThrown) {
				        alert(jqXHR.responseText);
				    }
		    }); 
	   	}
   
	    function onCancel() {
	        CloseWindow("cancel");
	    }
	    
	   
	    function CloseWindow(action) {
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();
	    }

	
</script></body>
</html>