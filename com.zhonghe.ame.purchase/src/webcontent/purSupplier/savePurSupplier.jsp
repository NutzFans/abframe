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
						<td colspan="3"><input name="purSupplier.custname" id="custname" class="nui-textbox" required="true" style="width:100%" onvaluechanged="validename"/></td>
					</tr>
					<tr>
						<td colspan="1" align="right" style="width:120px">供应商简称:</td>
						<td><input name="purSupplier.suppliersname" id="suppliersname" class="nui-textbox"  style="width:100%" showNullItem="true" /></td>
						<td align="right" style="width:120px">注册资金(万元):</td>
						<td><input name="purSupplier.registercap" id="registercap" class="nui-spinner" maxValue="9999999999999999" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商类型:</td>
						<td>
							<input name="purSupplier.custtype"  class="nui-dictcombobox" dictTypeId="AME_SUPTYPE" required="true"  style="width:100%"/>
						</td>
						<td align="right" style="width:80px">企业类型:</td>
						<td>
							<input name="purSupplier.custnature"  class="nui-dictcombobox" dictTypeId="MIS_CUSTNATURE" required="true"  style="width:100%"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商联系人:</td>
						<td><input onblur="checkName()" name="purSupplier.linkman" id="linkman" class="nui-textbox" required="true" style="width:100%"/></td>
						<td><span id="checktext1"></span></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商联系电话:</td>
						<td><input onblur="checkPhone()" name="purSupplier.linktel" id="linktel" class="nui-textbox" required="true" style="width:100%"/> </td>
						<td><span id="checktext"></span></td>
					</tr>
					<tr>
						<td colspan="1" align="right" style="width:120px">供货范围:</td>
						<td colspan="3"><input name="purSupplier.comments" id="comments" class="nui-textarea" style="width:100%" required="true" emptyText=" 填写合同所涉及需评价物项"></td>
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
        var flag=false;
        var flags=false;
	  	var form = new nui.Form("form1");
        var updateURL = "com.zhonghe.ame.purchase.purSupplier.updatePurSupplier.biz.ext";
    	var addURL = "com.zhonghe.ame.purchase.purSupplier.addPurSupplier.biz.ext";
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
		function checkName(){ 
			var reg = /^[a-zA-Z\u4e00-\u9fa5]+$/;
		    var name = nui.get("linkman").getValue();
		    if(!(reg.test(name))){ 
		    	document.getElementById("checktext1").innerHTML = " 请输入正确联系人！";
		        flags= false; 
		        
		    } else{
		    	document.getElementById("checktext1").innerHTML = "";
		    	flags =true;
		    }
		}
		function checkPhone(){ 
			var reg = /^1[3|4|5|7|8|9][0-9]{9}$/;
		    var phone = nui.get("linktel").getValue();
		    if(!(reg.test(phone))){ 
		    	document.getElementById("checktext").innerHTML = " 请输入正确手机号！";
		        flag= false; 
		    } else{
		    	document.getElementById("checktext").innerHTML = "";
		    	flag =true;
		    }
		}
		
        function SaveData() {
       		 if(!form.validate()){
    			showTips("请检查表单完整性");
    			return;
    		}
    		//if(!flag){
    		//	return;
    		//}
    		//if(!flags){
    		//	return;
    		//}
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
    
        function validename(){
        	//保证供应商唯一
            var custname = nui.get("custname").getValue();
            var json = {custname: custname};
            nui.ajax({
                url: "com.primeton.eos.ame_pur.PurSupplier.validteCustname.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                   	if(text.cont == 1){
                   		showTips("供应商名称已存在");
                   		nui.get("custname").setValue();
                   		return;
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
