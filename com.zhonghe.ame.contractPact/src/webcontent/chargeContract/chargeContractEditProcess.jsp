<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>收费合同签订申请 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 97%;">
				<legend>收费合同签订编辑</legend>
				<form id="form1" method="post">
					<input name="processid" id="processid" class="nui-hidden"/>
					<input name="files" id="fileids" class="nui-hidden"/>
					<input class="nui-hidden" name="id"/>
					
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right"> 申请人</td>
								<td>
									<input name="createUserid" id="createUserid" class="nui-hidden" style="width: 100%;"/>
									<input id="createUsername" name="createUsername"  class="nui-textbox" enabled="false" style="width: 100%;" required="true"/>
								</td>
								<td align="right" style="width: 120px">合同实施部门：</td>

									<td  style="width: 20%;">
									<input name="implementOrgname" id="implementOrgname" class="nui-hidden">
							     	<input name="implementOrg" id="implementOrg" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true" style="width:100%;" 
							     	url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" required="true" readonly="readonly"
							     	multiSelect="false" checkRecursive = "false" expandOnLoad="0" showFolderCheckBox="true"/>
							     	</td>
							<td align="right" style="width:160px">申请日期：</td>
								<td>
									<input id="createTime" name="createTime"  class="nui-datepicker" style="width: 100%;" required="true"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 120px">合同名称：</td>
									<td><input name="contractName"  class="nui-textbox" style="width: 100%;" required="true"/></td>	
						        <td align="right" style="width: 120px">合同金额（元）：</td>
									<td><input name="contractSum"  class="nui-textbox"  style="width: 100%;" required="true"/></td>
						    <td align="right" style="width:130px"><nobr>签约方：</nobr></td>
							<td>
							    <input
									name="signatory" id="custId"
									class="nui-combobox" required="true"
									url="com.zhonghe.ame.chargeContract.chargeContract.queryCusts.biz.ext"
									filterType="like" textField="custname" valueField="custid"
									dataField="custs" valueFromSelect="true" allowInput="true"
									onvaluechanged="changeOrgForm" style="width: 100%;" />
							</td>									
								
							</tr>
							<tr>
								
								<td align="right" style="width: 100px">专业类别：</td>
									<td><input id="major" name="major"  class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 100%;" required="true"/></td>	
								<td align="right" style="width: 100px">工程类别：</td>
									<td><input id="projectType" name="projectType"  class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 100%;" required="true"/></td>
								<td align="right" style="width: 100px">集团内外：</td>
									<td><input id="headquarterGroup" name="headquarterGroup"  class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 100%;" required="true"/></td>
								
								
							</tr>
							<tr>
							
							    <td align="right" style="width: 100px">合同签约主体：</td>
									<td><input id="contractSubject" name="contractSubject"  class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 100%;"  required="true"/></td>
								<td align="right" style="width: 100px">实施地点：</td>
									<td><input name="projectLocal"  class="nui-textbox" style="width: 100%;" required="true"/></td>
								<td align="right" style="width: 100px">标的规模：</td>
									<td><input name="projectSize"  class="nui-textbox" style="width: 100%;" required="true"/></td>
								
							</tr>
							<tr>
								
								<td align="right" style="width:160px">合同起始日期：</td>
									<td><input name="startTime"  class="nui-datepicker" style="width: 100%;" /></td>
								<td align="right" style="width:160px">合同结束日期：</td>
									<td><input name="endTime"  class="nui-datepicker" style="width: 100%;" /></td>
								<!-- <td align="right" style="width: 100px">合同编号：</td>
									<td><input name="contractNo"  class="nui-textbox" style="width: 100%;"/></td> -->
								<!-- <td align="right" style="width: 100px">分公司会签部门领导：</td>
							    <td  style="width: 20%;">
								  	<input name="fDeptCountersignId" id="userLookup_multiple" width="100%" class="nui-lookup" textField="empname" valueField="empid"
										popupWidth="auto" popup="#userPanel_lookup_multiple" grid="#userDatagrid_lookup_multiple" emptyText="请选择.." multiSelect="true"
										onvaluechanged="onFUseridsValueChanged" />
									<input name="fDeptCountersignName" id="fDeptCountersignName"  class="nui-hidden"/>
								</td> -->
							</tr>
							<!-- <tr>
								<td align="right" style="width: 100px">本部会签部门领导：</td>
							    <td  style="width: 20%;">
								  	<input name="zDeptCountersignId" id="userLookup_multiple1" width="100%" class="nui-lookup" textField="empname" valueField="empid"
										popupWidth="auto" popup="#userPanel_lookup_multiple1" grid="#userDatagrid_lookup_multiple1" emptyText="请选择.." multiSelect="true"
										onvaluechanged="onZUseridsValueChanged" />
							     	<input name="zDeptCountersignName" id="zDeptCountersignName" class="nui-hidden">
								</td>
							</tr> -->
							<tr>
							    <td align="right" style="width: 120px">会签部门领导:</td>
							    <td  colspan="1">
								  	<input id = "fDeptCountersignId" name="fDeptCountersignId" class="nui-textboxlist"  searchField="name" style="width:250px;"
										url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext" 
										textField="EMPNAME" valueField="EMPID" emptyText="请选择.." onvaluechanged="onFUseridsValueChanged" />
									<input name="fDeptCountersignName" id="fDeptCountersignName"  class="nui-hidden"/>
								</td>
								<td  colspan="3" style="color:red">
									⬅注:请按照合同管理办法规定选择相应会签部门进行审批(请输入名字搜索选择)
								</td>
							    <!-- <td align="right" style="width: 120px">本部会签部门领导:</td>
							    <td  style="width: 20%;">
								  	<input name="zDeptCountersignId" id="userLookup_multiple1" width="100%" class="nui-lookup" textField="empname" valueField="empid"
										popupWidth="auto" popup="#userPanel_lookup_multiple1" grid="#userDatagrid_lookup_multiple1" emptyText="请选择.." multiSelect="true"
										onvaluechanged="onZUseridsValueChanged" />
							     	<input name="zDeptCountersignName" id="zDeptCountersignName" class="nui-hidden">
								</td> -->
							</tr>
							<tr>
								<td align="right" style="width: 160px">备注：</td>
								<td  colspan="5"><input name="remark"  class="nui-textarea" style="width: 100%" required="false"/></td>
							</tr>
						</table>
					</div>
				</form>
			</fieldset>
			<jsp:include page="/ame_common/inputFile.jsp"/>
			<jsp:include page="/ame_common/misOpinion.jsp"/>

		</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="creatReimb" iconCls="icon-save" style="width: 80px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok" style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="onOk(2)" id="zzReimb" iconCls="icon-split" style="width: 80px;margin-right: 20px;">中止</a>
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" iconCls="icon-close"  style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<%-- <%@include file="/contractPact/common/userLookup1.jsp"%> --%>
	<script type="text/javascript">
        nui.parse();
	    <% 
			long workItemID=(Long)request.getAttribute("workItemID");
		%>
		var form = new nui.Form("form1");
		var type ;//暂存还是发起
    	function onOk(e){
    	    type=e;
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			form.validate();
			if(form.isValid()==false){
				nui.alert("请检查必填项");
				return;
			}
			nui.get("creatReimb").disable();
			nui.get("creatReimbProcess").disable();
			nui.get("zzReimb").disable();	
			var data = form.getData(); 
	  		document.getElementById("fileCatalog").value="chargeContractinfo";
	  		
	  	var filePaths = document.getElementsByName("uploadfile").length;
		     for(var j=0;j<filePaths;j++){
		      var a=document.getElementsByName("remarkList")[j].value;
		      if(a==null||a==""){
		       alert("新增附件不可以为空");
		       
		       nui.get("saveReimb").enable();
				nui.get("creatReimbProcess").enable();	
		       
		       return;
		      }
		     }
	  		
			form2.submit();
	    }
    	function SaveData(){			
				var form = new nui.Form("#form1");
    			var data = form.getData();
    			var info="";
    			data.type = type;
    			if(type==1){
    				info="是否提交？"
    			}else if(type==0){
    				info="是否暂时保存？"
    			}else{
					info="是否中止流程？"
					nui.get("auditstatus").setValue(2);
				}
				var data_opioion = opioionform.getData();
				data.files = nui.get("fileids").getValue();
    			var json = nui.encode({'cpData':data,"misOpinion":data_opioion.misOpinion,"type":type});
				if(!confirm(info)){
        				nui.get("creatReimb").enable();
               		 	nui.get("creatReimbProcess").enable();
               		 	nui.get("zzReimb").enable();
               		 	nui.get("auditstatus").setValue(4);
        				return;
        			}else{
        			
        				ajaxCommon({
							"url": "com.zhonghe.ame.chargeContract.chargeContract.editChargeContract.biz.ext",
							"data": json,
							"success": function(data) {
								 if(data.result == "1"){
			                     	if(type==1){		                     
										showTips("收费合同提交成功")
		               				 	closeOk();	               		
					                 }else if(type==0){
					                	showTips("收费合同暂时保存成功")
				               		 	closeOk();
				               	    }else{
				               	    	showTips("中止成功")
				               		 	closeOk();
				               	    }
								}else{
									showTips("提交失败");
									nui.get("creatReimb").enable();
			               		 	nui.get("creatReimbProcess").enable();
			               		 	nui.get("zzReimb").enable();
								}
							}
						});		
	            }
    	}
    	
        loadData();
   function loadData(){
		//流程提示信息
		var data={workItemID:<%=workItemID %>};
		var json=nui.encode(data);
		nui.ajax({
			url:"com.zhonghe.ame.chargeContract.chargeContract.getChargeContract.biz.ext",
			type:"post",
			data:json,
			contentType:"text/json",
			success:function (o){
				//付款申请基本信息
				form.setData(o.chargeContract);
				
				nui.get("fDeptCountersignId").setText(o.chargeContract.fDeptCountersignName);
				/* nui.get("userLookup_multiple1").setText(o.chargeContract.zDeptCountersignName); */
			  	//附件查询
			  	clog(o)
				var grid_0 = nui.get("grid_0");
	        	grid_0.load({"groupid":"CHARGE_CONTRACT","relationid":o.chargeContract.id});
				grid_0.sortBy("fileTime","desc");
				//设置审核意见基本信息
				nui.get("processinstid").setValue(o.workitem.processInstID);
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
				nui.get("workitemid").setValue(<%=workItemID %>);
               	nui.get("isshow").setValue("1");
               	nui.get("auditstatus").setValue(4);
               	document.getElementById("salesEdit").style.display="none";
               	nui.get("auditopinion").setValue("");
            	//查询审核意见
				var grid = nui.get("datagrid1");
				if(o.workitem.processInstID!=null||o.workitem.processInstID!=""){
					grid.load({processInstID:o.workitem.processInstID});
					grid.sortBy("time", "desc");
				}
				
			},
			error:function(){}
		});
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
		
        //当行选择改变时
        function onServiceUserMultipleSelectionChanged(){
        }
        
    </script></body>
</html>
