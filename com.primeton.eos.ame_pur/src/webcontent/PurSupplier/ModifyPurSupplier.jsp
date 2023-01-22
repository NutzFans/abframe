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
						<td colspan="3"><input name="purSupplier.custname" id="custname" class="nui-textbox" required="true" style="width:100%"/></td>
						
					</tr>
					<tr>
						<td colspan="1" align="right" style="width:120px">供应商简称:</td>
						<td><input name="purSupplier.suppliersname" id="suppliersname" class="nui-textbox"  style="width:100%" showNullItem="true" /></td>
						<td align="right" style="width:120px">注册资金(万元):</td>
						<td><input name="purSupplier.registercap" id="registercap" class="nui-spinner" maxValue="9999999999999999" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商联系人:</td>
						<td><input name="purSupplier.linkman" id="linkman" class="nui-textbox" style="width:100%"/></td>
						<td align="right" style="width:120px">供应商联系电话:</td>
						<td><input name="purSupplier.linktel" id="linktel" class="nui-textbox" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商类型:</td>
						<td>
							<input name="purSupplier.custtype"  class="nui-dictcombobox" dictTypeId="AME_SUPTYPE" showNullItem="true" style="width:100%"/>
						</td>
					</tr>
					<tr>
						<td colspan="1" align="right" style="width:120px">供货范围:</td>
						<td colspan="3"><input name="purSupplier.comments" id="comments" class="nui-textarea" style="width:100%"/ emptyText=" 填写合同所涉及需评价物项"></td>
					</tr>
				</table>
			</fieldset>
		</form>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
			<legend style="color: red;">附件（重要、一般、其他必须上传相关准入证明材料）</legend>
			<jsp:include page="/ame_common/inputFile.jsp"/>
		</fieldset>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="save()" id="onoKPurSupplier" style="width:60px;margin-right:20px;">确定</a>
	<a class="nui-button" onclick="closeCancel()" style="width:60px;">关闭</a>
</div>
<script type="text/javascript">
        nui.parse();
	  	var form = new nui.Form("form1");
        var updateURL = "com.primeton.eos.ame_pur.PurSupplier.updatePurSupplier.biz.ext";
    	var addURL = "com.primeton.eos.ame_pur.PurSupplier.addPurSupplier.biz.ext";
    	var saveURL = "";  
    	var dataAction=""; 
    	var custnum="";     
	    function SetData(data){
	    	data = nui.clone(data);
	    	dataAction = data.action;
	    	if(data.action == "edit"){
	    		nui.get("custname").setReadOnly(true);
	    		var json = nui.encode({purSupplier:data}); 
	        	ajaxCommon({
	        		url: "com.primeton.eos.ame_pur.PurSupplier.getPurSupplierDetail.biz.ext",
	                data: json,
	                success: function (o) {
	                    form.setData(o);
	                    var grid_0 = nui.get("grid_0");
	        				 grid_0.load({"groupid":"purSupplier","relationid":o.purSupplier.custid});
							 grid_0.sortBy("fileTime","desc");
	                }
	        	});
    		}
    		if(data.action == "new"){
				nui.get("grid_0").hide();      //隐藏附件信息
				nui.get("filedetail").hide();  //隐藏相关附件表头
    		}
    	}
		
		function save(){
			document.getElementById("fileCatalog").value="purSupplier";
			form2.submit();
		}
		
		
        function SaveData() {
        	var saveURL = "";
        	var o = form.getData();
	        var json = nui.encode(o);
        	var custid = nui.get("custid").getValue();
			if(custid){
				saveURL = updateURL;
				ajaxCommon({
	                url: saveURL,
	                data: json,
	                success: function (text) {
	                  var returnJson = nui.decode(text);
		              if(returnJson.exception == null){
		                showTips("保存供应商成功")
		                closeOk();
		              }else{
		                showTips("保存失败", "系统提示")
		              }        
	                }
	            });
			} else{
				saveURL = addURL;
	            ajaxCommon({
	                url: saveURL,
	                data: json,
	                success: function (text) {
	                   	var returnJson = nui.decode(text);
	                   	form.setData(returnJson);
		              	if(returnJson.exception == null){
		              	    showTips("新增供应商成功")
            				closeOk();
		              	}else{
		                	showTips("保存失败", "系统提示")
		                }     
	                }
	            });
	    	}
	    }
    
        function validecustnum(){
        	//保证供应商编号唯一
            var custnum = nui.get("custnum").getValue();
            var json = {custnum: custnum};
            nui.ajax({
                url: "com.primeton.eos.ame_pur.PurSupplier.validteCustnum.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                   	if(text.cont == 1){
                   		alert("供应商编号已被" + text.purSupplier.suppliersname + "使用！");
                   		return;
                   	}
                   	if(confirm("确定提交？")){
						nui.get("onoKPurSupplier").disable();
						document.getElementById("fileCatalog").value="ame_pur";
						form2.submit();
					}
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
        }
    </script>
</body>
</html>
