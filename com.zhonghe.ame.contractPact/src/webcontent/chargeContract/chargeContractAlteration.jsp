<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>收费合同协议变更 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 98%;">
				<legend>收费合同信息</legend>
				<form id="form1" method="post">
						<input name="files" id="fileids" class="nui-hidden"/>
						<input class="nui-hidden" name="id"/>
					<input name="relateCont" id="relateCont" class="nui-hidden"/>
					<input name="endTime" id="endTime" class="nui-hidden" />
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
								<td align="right" style="width: 110px">协议名称:</td>
								<td colspan="7">
									<input id="contractName" name="contractName"  class="nui-textbox" style="width: 100%" required="true"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 110px">原合同名称:</td>
								<td colspan="3">
									<input id="originalContractName" name="originalContractName"  class="nui-textbox" style="width: 100%"  enabled="false"/>
								</td>
								<td align="right" style="width:110px">申请日期:</td>
								<td colspan="1">
									<input id="createTime" name="createTime" enabled="false" class="nui-datepicker" style="width: 100%" required="true"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 110px">合同签约主体：</td>
									<td colspan="1"><input id="contractSubject" name="contractSubject"  class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%"  required="true"/></td>
								<td class="form_label" align = "right"> 申请人</td>
								<td colspan="1">
									<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 100%"/>
									<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 100%" required="true"/>
								</td>
								<td align="right" style="width: 110px">合同实施部门:</td>
								<td colspan="1">
									<input name="implementOrg" id="implementOrg" class="nui-combobox" valueField="orgid" textField="orgname" 
									style="width: 100%" shownullitem="false" allowinput="true" required="true" enabled="false"/>
									<input name="implementOrgname" id="implementOrgname" class="nui-hidden">
						     	</td>
							</tr>
							<tr>
								<td align="right" style="width: 110px">协议编号:</td>
								<td colspan="1"><input id="contractNo" name="contractNo"  class="nui-textbox" style="width: 100%" required="true"/></td>
								<td align="right" style="width: 110px">原合同编号:</td>
									<td colspan="1"><input id="originalContractNo" name="originalContractNo" enabled="false" class="nui-textbox" style="width: 100%" required="true"/></td>
								<td align="right" style="width: 110px">实施地点:</td>
									<td colspan="1"><input id="projectLocal" name="projectLocal"  class="nui-textbox" style="width: 100%" required="true"/></td>
							</tr>
							<tr>
								<td align="right" style="width: 110px">签约方:</td>
								<td colspan="1"><input id="signatoryname" name="signatoryname"  class="nui-textbox" style="width: 100%" required="true" enabled="false"/>
									<input id="signatory" name="signatory"  class="nui-hidden"/>
								</td>
								<td align="right" style="width:160px">合同起始日期：</td>
								<td colspan="1"><input name="startTime"  class="nui-datepicker" style="width: 100%" /></td>
								<td align="right" style="width:160px">合同结束日期：</td>
								<td colspan="1"><input name="endTime"  class="nui-datepicker" style="width: 100%" /></td>
							</tr>
							<tr>
							<td align="right" style="width: 110px">标的规模:</td>
									<td colspan="1"><input id="projectSize" name="projectSize"   class="nui-textbox" style="width: 100%" required="true"/></td>
								<td align="right" style="width: 110px">合同最终金额(元):</td>
									<td colspan="1"><input id="contractSum" name="contractSum" class="nui-textbox"  style="width: 100%" required="true"/></td>
								<td align="right" style="width: 110px">合同增加金额(元):</td>
									<td colspan="1"><input id="increaseDecreaseSum" name="increaseDecreaseSum" class="nui-textbox"  style="width: 100%" required="true"/></td>
							</tr>
							<tr>
							    <td align="right" style="width: 110px">会签部门领导:</td>
							    <td  colspan="1">
								  	<input id = "fDeptCountersignId" name="fDeptCountersignId" class="nui-textboxlist"  searchField="name" style="width:300px;"
										url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext" 
										textField="EMPNAME" valueField="EMPID" emptyText="请选择.." onvaluechanged="onFUseridsValueChanged" />
									<input name="fDeptCountersignName" id="fDeptCountersignName"  class="nui-hidden"/>
								</td>
								<td  colspan="3" style="color:red">
									⬅注:请按照合同管理办法规定选择相应会签部门进行审批(请输入名字搜索选择)
								</td>
							</tr>
							<!-- <tr>
								<td align="right" style="width: 100px">分公司会签部门领导:</td>
							    <td  style="width: 20%;">
								  	<input name="fDeptCountersignId" id="userLookup_multiple" width="100%" class="nui-lookup" textField="empname" valueField="empid"
										popupWidth="auto" popup="#userPanel_lookup_multiple" grid="#userDatagrid_lookup_multiple" emptyText="请选择.." multiSelect="true"
										onvaluechanged="onFUseridsValueChanged" />
									<input name="fDeptCountersignName" id="fDeptCountersignName"  class="nui-hidden"/>
								</td>
								<td align="right" style="width: 100px">本部会签部门领导:</td>
							    <td  style="width: 20%;">
								  	<input name="zDeptCountersignId" id="userLookup_multiple1" width="100%" class="nui-lookup" textField="empname" valueField="empid"
										popupWidth="auto" popup="#userPanel_lookup_multiple1" grid="#userDatagrid_lookup_multiple1" emptyText="请选择.." multiSelect="true"
										onvaluechanged="onZUseridsValueChanged" />
							     	<input name="zDeptCountersignName" id="zDeptCountersignName" class="nui-hidden">
								</td>
							</tr> -->
							<tr>
								<td align="right" >变更说明:</td>
									<td colspan="7">
										<input id="remark" name="remark"  class="nui-textarea" style="width:100%;height: 50px" required="true"/>
									</td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>

			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>上传附件</legend>
				<jsp:include page="/ame_common/inputFile.jsp"/>
			</fieldset>

		
		</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		 <a class="nui-button" onclick="onOk(0)" id="creatReimb" iconCls="icon-save" style="width: 80px;margin-right: 20px;">暂存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close" style="width: 80px;margin-right: 0px;">关闭</a>
	</div>
	<%-- <%@include file="/contractPact/common/userLookup1.jsp"%> --%>
	<script type="text/javascript">
        nui.parse();
		var type ;//暂存还是发起
		var form = new nui.Form("form1");
    	function onOk(e){
    		type = e;
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			if(type==1){
				form.validate();
    			if(form.isValid()==false){
    				showTips("请检查必填项");
    				return;
    			}
			}
	
			var data = form.getData(); 
		  	document.getElementById("fileCatalog").value="chargeContractinfo";
  			 var filePaths = document.getElementsByName("uploadfile").length;
		     for(var j=0;j<filePaths;j++){
		      var a=document.getElementsByName("remarkList")[j].value;
		      if(a==null||a==""){
		       alert("新增附件不可以为空");
		       return;
		      }
		     }
		  	
			form2.submit();
	    }
	    
        function getOrgs(){
        		var a2=[];
			  	for(var p in orglist){
			  		a2[p] = orglist[p];
			  	}
			  	nui.get("implementOrg").setData(a2);
        }
	    
    	function SaveData(){
				var form = new nui.Form("#form1");
    			var data = form.getData();
    			var info = "";
    			data.type = type;
    			if(type==1){
    				info="是否提交？"
    			}else{
    				info="是否暂时保存？"
    			}
    			data.files = nui.get("fileids").getValue();
    			var json = nui.encode({'cpData':data});
				if(!confirm(info)){
    				nui.get("saveReimb").enable();
           		 	nui.get("creatReimbProcess").enable();
    				return;
        		}else{
		    	ajaxCommon({
		                url: "com.zhonghe.ame.chargeContract.chargeContract.addAlterationInfo.biz.ext",
		                data: json,
		                success: function (text) {
		               		 if(text.result=="1"){
			               		 if(type==1){
				               		 showTips("补充协议提交成功")
				               		 closeOk();
			               		 }else{
			               			 showTips("补充协议暂时保存成功");
			               			  closeOk();
			               		 }
		               		 }else{
		               		 	showTips("提交失败！");
		               		 	nui.get("saveReimb").enable();
		               		 	nui.get("creatReimbProcess").enable();
		               		 }
		                
		                }
		            }); 
		            }
    	}
    	
		
		function setEditData(data){
			form.setData(data)
				nui.get("implementOrg").setText(data.implementOrgname);
				nui.get("originalContractName").setValue(data.contractName);
				nui.get("originalContractNo").setValue(data.contractNo);
				nui.get("fDeptCountersignId").setText(data.fDeptCountersignName);
				nui.get("createUserid").setValue(userId);
		  		nui.get("createUsername").setValue(userName);
		  		nui.get("createTime").setValue(new Date());
			if(null != data.id){
				nui.get("relateCont").setValue(data.id);
			}
			
			var grid_0 = nui.get("grid_0");
        	grid_0.load({"groupid":"CHARGE_CONTRACT","relationid":data.id});
			grid_0.sortBy("fileTime","desc");
		}
		
        
	//多选lookup返回选中行，用户可以根据需要设置相关自定义值
		function userSetDataMultiple(rows) {
			//nui.get("fDeptCountersignName").setValue(nui.get("userLookup_multiple").getText());
		}
		
		//值改变的时候
		function onFUseridsValueChanged() {
			nui.get("fDeptCountersignName").setValue(nui.get("fDeptCountersignId").getText());
		}
		//值改变的时候
		function onZUseridsValueChanged() {
			nui.get("zDeptCountersignName").setValue(nui.get("userLookup_multiple1").getText());
		}
    </script></body>
</html>
