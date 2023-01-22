<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): liubo
  - Date: 2016-06-02 18:18:37
  - Description:
-->
<head>
	<title>修改供应商</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<!-- 提示信息展示 -->
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<form id="form1" method="post">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>供应商基本信息</legend>
				<input name="purSupplier.fileids" id="fileids1"  class="nui-hidden"/>
				<input name="purSupplier.purstatus" id="purstatus" class="nui-hidden" />
				<input name="purSupplier.custid" id="custid" class="nui-hidden" />
				<table style="table-layout:fixed;" id="table_file">
					<tr>
						<td align="right" style="width:120px">供应商名称:</td>
						<td style="width:300px"><input name="purSupplier.custname" id="custname" class="nui-textbox" required="true" style="width:280px"/></td>
						<td align="right" style="width:120px">供应商编号:</td>
						<td style="width:260px"><input name="purSupplier.custnum" id="custnum" class="nui-textbox" style="width:170px"/></td>	
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商简称:</td>
						<td><input name="purSupplier.suppliersname" id="suppliersname" class="nui-textbox" style="width:100px"/></td>
						<td align="right" style="width:120px">供应商类型:</td>
						<td><input name="purSupplier.custtype" id="custtype" class="nui-dictcombobox" dictTypeId="AME_SUPTYPE" multiSelect="true"  style="width:260px" showNullItem="true" nullItemText=""/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">注册地址:</td>
						<td><input name="purSupplier.registaddress" id="registaddress" class="nui-textbox" style="width:280px"/></td>
						<td align="right" style="width:120px">注册地所在城市:</td>
						<td><input name="purSupplier.registcity" id="registcity" class="nui-dictcombobox" dictTypeId="MIS_AREA" allowInput="true" valueFromSelect="true" style="width:100px" showNullItem="true" nullItemText=""/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">法人代表:</td>
						<td><input name="purSupplier.legalperson" id="legalperson" class="nui-textbox" style="width:100px"/></td>
						<td align="right" style="width:120px">成立日期:</td>
						<td><input name="purSupplier.estabdate" id="estabdate" class="nui-datepicker" style="width:100px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">员工总数:</td>
						<td><input name="purSupplier.empsize" id="empsize" class="nui-textbox" style="width:100px"/></td>
						<!-- <td align="right" style="width:120px">状态:</td>
						<td><input name="purSupplier.status" id="status" class="nui-dictcombobox" dictTypeId="AME_SUPSTATUS"  style="width:100px" showNullItem="true" nullItemText=""/></td> -->
					</tr>
					<tr>
						<td align="right" style="width:120px">注册资本:</td>
						<td><input name="purSupplier.registercap" id="registercap" class="nui-textbox" style="width:100px"/>(万元)</td>
						<td align="right" style="width:120px">实收资本:</td>
						<td colspan="2"><input name="purSupplier.cappay" id="cappay" class="nui-textbox" style="width:100px"/>(万元)</td>
					</tr>
					<tr>
						<td align="right" style="width:120px">是否一般纳税人:</td>
						<td><input name="purSupplier.istaxpayer" id="istaxpayer" class="nui-dictcombobox" dictTypeId="ABF_YESORNO" style="width:100px" showNullItem="true" nullItemText=""/></td>
						<td align="right" style="width:120px">企业性质:</td>
						<td><input name="purSupplier.custnature" id="custnature" class="nui-dictcombobox" dictTypeId="MIS_CUSTNATURE"  style="width:150px" showNullItem="true" nullItemText=""/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">普元联系人:</td>
						<td><input name="purSupplier.infoprovider" id="infoprovider" class="nui-textbox" style="width:100px"/></td>
						<td align="right" style="width:120px">普元联系电话:</td>
						<td><input name="purSupplier.telephone" id="telephone" class="nui-textbox" style="width:130px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商联系人:</td>
						<td><input name="purSupplier.linkman" id="linkman" class="nui-textbox" style="width:100px"/></td>
						<td align="right" style="width:120px">供应商联系电话:</td>
						<td><input name="purSupplier.linktel" id="linktel" class="nui-textbox" style="width:130px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商联系邮箱:</td>
						<td><input name="purSupplier.linkmail" id="linkmail" class="nui-textbox" style="width:210px"/></td>
						<td align="right" style="width:120px">供应商传真:</td>
						<td><input name="purSupplier.fax" id="fax" class="nui-textbox" style="width:130px"/></td>
					</tr>
					<tr>
						<td align="right" >供应商邮编:</td>
						<td><input name="purSupplier.postcode" id="postcode" class="nui-textbox" style="width:100px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">供应商联系地址:</td>
						<td colspan="3"><input name="purSupplier.address" id="address" class="nui-textbox" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">公司网址:</td>
						<td colspan="3"><input name="purSupplier.website" id="website" class="nui-textbox" vtype="url" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">备注:</td>
						<td colspan="3"><input name="purSupplier.comments" id="comments" class="nui-textarea" style="width:100%"/></td>
					</tr>
						</table>
			</fieldset>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>账户信息</legend>
				<table border="0" cellspacing="1" cellpadding="1" style="width:700px;" >
					<tr>
						<td align="right" style="width:120px">户名:</td>	
						<td><input name="purSupplier.accoutname" id="accoutname" class="nui-textbox" style="width:280px"/></td>
						<td align="right" style="width:120px">开户银行:</td>
						<td><input name="purSupplier.accoutbank" id="accoutbank" class="nui-textbox" style="width:280px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">税号:</td>
						<td><input name="purSupplier.taxno" id="taxno" class="nui-textbox" style="width:210px"/></td>
						<td align="right" style="width:120px">账号:</td>
						<td><input name="purSupplier.accountid" id="accountid" class="nui-textbox" style="width:210px"/></td>
					</tr>
				</table>
			</fieldset>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>财务信息</legend>
				<table border="0" cellspacing="1" cellpadding="1" style="width:700px;"><!-- style="border:1px solid #A8A8A8; width:700px;" -->
					<tr>
						<td style="width:120px"></td>
						<td align="center" style="width:160px">去年</td>
						<td align="center" style="width:160px">过去两年</td>
						<td align="center" style="width:160px">过去三年</td>
					</tr>
					<tr>
						<td align="right" style="width:120px">年份:</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastyear" id="lastyear" class="nui-textbox"  style="width:120px;" inputStyle="text-align:center;"/></td>
						<td style="width:160px" align="center"><input name="purSupplier.twoago" id="twoago" class="nui-textbox"  style="width:120px" inputStyle="text-align:center;"/></td>
						<td style="width:160px" align="center"><input name="purSupplier.threeago" id="threeago" class="nui-textbox" style="width:120px" inputStyle="text-align:center;"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">营业额(万元):</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastyearincome" id="lastyearincome" class="nui-textbox" style="width:120px"/></td>
						<td style="width:160px" align="center"><input name="purSupplier.twoagoincome" id="twoagoincome" class="nui-textbox" style="width:120px"/></td>
						<td style="width:160px" align="center"><input name="purSupplier.threeagoincome" id="threeagoincome" class="nui-textbox" style="width:120px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">利润总和(万元):</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastyearprofit" id="lastyearprofit" class="nui-textbox" style="width:120px"/></td>
						<td style="width:160px" align="center"><input name="purSupplier.twoagoprofit" id="twoagoprofit" class="nui-textbox" style="width:120px"/></td>
						<td style="width:160px" align="center"><input name="purSupplier.threeagoprofit" id="threeagoprofit" class="nui-textbox" style="width:120px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">上年度固定资产原值:</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastproperty" id="lastproperty" class="nui-textbox" style="width:120px"/></td><td></td><td></td><td></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">上年度固定资产净值:</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastpropertynet" id="lastpropertynet" class="nui-textbox" style="width:120px"/></td><td></td><td></td><td></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">上年度流动资金:</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastfloat" id="lastfloat" class="nui-textbox" style="width:120px"/></td><td></td><td></td><td></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">上年度长期负债:</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastlongdebt" id="lastlongdebt" class="nui-textbox" style="width:120px"/></td><td></td><td></td><td></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">上年度短期负债:</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastshortdebt" id="lastshortdebt" class="nui-textbox" style="width:120px"/></td><td></td><td></td><td></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">上年净利润:</td>
						<td style="width:160px" align="center"><input name="purSupplier.lastnetprofit" id="lastnetprofit" class="nui-textbox" style="width:120px"/></td><td></td><td></td><td></td>
					</tr>
				</table>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>公司业务情况</legend>
				<table>
					<tr>
						<td align="right" style="width:120px">公司简介:</td>
						<td><input name="purSupplier.compdesc" id="compdesc" class="nui-textarea" style="width:550px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">主营产品:</td>
						<td><input name="purSupplier.mainprod" id="mainprod" class="nui-textarea" style="width:550px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">代理产品:</td>
						<td><input name="purSupplier.agentprod" id="agentprod" class="nui-textarea" style="width:550px"/></td>
					</tr>
				</table>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>资质和凭证</legend>
				<table style="table-layout:fixed;" id="table_file3">
					<tr>
						<td align="right" style="width:120px">营业执照注册号:</td>
						<td><input name="purSupplier.license" id="license" class="nui-textbox" style="width:150px"/></td>
						<td align="right" style="width:120px">营业执照到期日:</td>
						<td><input name="purSupplier.licenseenddate" id="licenseenddate" class="nui-datepicker" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">税务登记证:</td>
						<td><input name="purSupplier.taxnumb" id="taxnumb" class="nui-textbox" style="width:150px"/></td>
						<td align="right" style="width:120px">组织机构代码:</td>
						<td><input name="purSupplier.orgnum" id="orgnum" class="nui-textbox" style="width:160px"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">资质1:</td>
						<td><input name="purSupplier.qualify1" id="qualify1" class="nui-textbox" style="width:100%"/></td>
						<td align="right" style="width:120px">资质1有效期:</td>
						<td><input name="purSupplier.qualify1exp" id="qualify1exp" class="nui-datepicker" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">资质2:</td>
						<td><input name="purSupplier.qualify2" id="qualify2" class="nui-textbox" style="width:100%"/></td>
						<td align="right" style="width:120px">资质2有效期:</td>
						<td><input name="purSupplier.qualify2exp" id="qualify2exp" class="nui-datepicker" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">资质3:</td>
						<td><input name="purSupplier.qualify3" id="qualify3" class="nui-textbox" style="width:100%"/></td>
						<td align="right" style="width:120px">资质3有效期:</td>
						<td><input name="purSupplier.qualify3exp" id="qualify3exp" class="nui-datepicker" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">资质备注:</td>
						<td colspan="3"><input name="purSupplier.qualifycomm" id="qualifycomm" class="nui-textarea" style="width:100%"/></td>
					</tr>
			   </table>
			</fieldset>
		</form>
		<jsp:include page="/ame_common/detailAndDelFile.jsp"/>
		<jsp:include page="/ame_common/addFiles1.jsp"/>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
		<jsp:include page="/ame_common/addFiles.jsp"/>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(1)" id="submitPurCont" style="width:60px;margin-right:20px;">提交</a>
		<a class="nui-button" onclick="onOk(0)" id="breakPurCont"style="width:80px;margin-right:20px;">中止流程</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
	<script type="text/javascript">
		nui.parse();
		
	  	var form = new nui.Form("form1");
	  	var opioionform = new nui.Form("opioionform");
	  	
		<% 
		long workItemID=(Long)request.getAttribute("workItemID");
		%>	
		loadData();
		function loadData(){
			var data={workItemID:<%=workItemID %>};
			var json=nui.encode(data);
			nui.ajax({
				url:"com.primeton.eos.ame_pur.PurSupplierProcess.queryPurSupplier.biz.ext",
				type:"post",
				data:json,
				contentType:"text/json",
				success:function (o){
					form.setData(o);
                     //初始化审核意见
					nui.get("processinstid").setValue(o.workitem.processInstID);
	            	nui.get("workitemid").setValue(<%=workItemID %>);
	            	nui.get("workitemname").setValue(o.workitem.workItemName);
	            	nui.get("auditstatus").setValue("4");
		           	document.getElementById("salesEdit").style.display="none";
		           	nui.get("auditopinion").setValue("");
	            	//审核意见
					var grid = nui.get("datagrid1");
					grid.load({processInstID:o.workitem.processInstID});
					grid.sortBy("time", "desc");
					
					//附件
					nui.get("grid_0").load({"groupid":"purSupplier","relationid":o.purSupplier.custid});
					//流程提示信息
            		promptInit({workItemID:<%=workItemID %>}); 
				},
				error:function(){}
			});
		}
		
       /*  function delPurOrder(){
        	document.getElementById("field3").style.display="none";
        } */
    	function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
		}
	    
	  	//标准方法接口定义
        function CloseWindow(action) {            
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
	    function onOk(e) {
    		if(e==0){
	        	if(confirm("中止流程？")){//中止流程，直接调用saveData方法
	        		/* if(nui.get("purorderyon").getValue()=='y'){
		        		nui.get("purOrderYesOrNo").setValue("1");
	        		} */
	        		nui.get("auditstatus").setValue(2);
	    			nui.get("submitPurCont").disable();
	    			nui.get("breakPurCont").disable();
	    			SaveData();
	    			return;
	        	}
        	}
        	
    		if(!(form.validate())){
    			alert("表单信息不合法！");
    			return;
    		}
        	var filePaths2 = document.getElementsByName("uploadfile2").length;
        	for(var j=0;j<filePaths2;j++){
        		var a=document.getElementsByName("remarkList2")[j].value;
        		if(a==null||a==""){
        			alert("采购合作框架新增附件不可以为空！");
        			return false;
        		}
        	}
        
        	if(e==1){//提交流程
	        	if(confirm("确认提交？")){
	        		/* if(nui.get("purorderyon").getValue()=='y'){
		        		nui.get("purOrderYesOrNo").setValue("1");
	        		} */
	    			nui.get("submitPurCont").disable();
	    			nui.get("breakPurCont").disable();
	    			document.getElementById("fileCatalog1").value="PurSupplier";
					form4.submit();
					
	        	}
        	}
        }
        
		function SaveData1(){
	    	document.getElementById("fileCatalog").value="MisOpinion";
			form2.submit();
		}
	    
    	function SaveData() {
	        var data1 = form.getData();
	        var data5 = opioionform.getData();
		    var json1 = {"purSupplier":data1.purSupplier,"misOpinion":data5.misOpinion};
		    var json = nui.encode(json1);
	        nui.ajax({
	            url: "com.primeton.eos.ame_pur.PurSupplierProcess.modifyPurSupplier.biz.ext",
	            data: json,
	            type: 'POST',
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	            	var returnJson = nui.decode(text);
	            	if(returnJson.result=='1'){
	            		alert("流程提交成功！");
	            		CloseWindow("ok");
	            	}else{
	            		nui.get("submitPurCont").enable();
	    				nui.get("breakPurCont").enable();
	            		alert("流程提交失败！");
	            	}
	            },
	            error: function (jqXHR, textStatus, errorThrown) {
	            	alert("任务处理失败，请联系信息技术部人员！");
	                alert(jqXHR.responseText);
	                CloseWindow();
	            }
	        });
	    }
        function onCancel(e) {
            CloseWindow("cancel");
        }
        
	
		//附件下载
        function getdetail1(e){
            	return "<a href='javascript:void(0)' onclick='checkDetail1();' title='点击查看'>" + e.value + "</a>";
            }
        function checkDetail1(){
        	var grid = nui.get("grid_1");
        	var selectRow = grid.getSelected();
        	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
			window.open(url, '_self');
        }
        //订单附件删除
        function deleteOrderFile(e){
            var record = e.record;
            var uid = record._uid;

        	return "<a href='javascript:void(0)' onclick='deleteOrderFile1(" + uid + ")'>删除 </a>";
        }
        function deleteOrderFile1(uid){
        	var grid = nui.get("grid_1");
        	var row = grid.getRowByUID(uid);  //获取所有选中的行对象
	        var data = {files:row};
		    var json = nui.encode(data); 
        	if (confirm("确定删除此附件信息？")) {
                grid.loading("操作中，请稍后......");
                nui.ajax({
	                url: "com.primeton.eos.ame_common.file.deletefiles.biz.ext",
	                type: "post",
	                data: json, 
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
	                	grid.reload();
	                },
	                error: function () {
                    }
               });
            }
        }

	</script>

</body>
</html>