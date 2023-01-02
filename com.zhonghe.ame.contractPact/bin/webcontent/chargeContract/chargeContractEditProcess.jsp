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
								<td align="right" style="width: 120px">合同名称：</td>
								<td colspan="7"><input name="contractName" id="contractName"
									class="nui-textbox" style="width: 100%" required="true" /></td>
							</tr>
							<tr>
							<td class="form_label" align="right">申请人：</td>
							<td><input name="createUserid" id="createUserid"
								class="nui-hidden" style="width: 300px" /> <input
								id="createUsername" name="createUsername" class="nui-textbox"
								enabled="false" style="width: 300px" required="true" /></td>
							<td align="right" style="width: 120px">合同实施部门：</td>
							<td><input name="implementOrg" id="implementOrg"
								shownullItem=ture class="nui-treeselect" textField="orgname"
								valueField="orgid" parentField="omOrganization.orgid"
								dataField="orgs" showTreeIcon="true" valueFromSelect="true"
								style="width: 100%;"
								url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext"
								allowInput="true" required="true"
								onvaluechanged="changeOrgForm(e)" multiSelect="false"
								checkRecursive="false" expandOnLoad="0"
								showFolderCheckBox="true" enabled="false"/> <input name="implementOrgname"
								id="implementOrgname" class="nui-hidden" readonly="readonly"
								style="width: 100%" /></td>
							<td align="right" style="width: 160px">申请日期：</td>
							<td><input id="createTime" name="createTime"
								class="nui-datepicker" style="width: 300px" required="true" enabled="false"/></td>

						</tr>
						<tr>
							<td align="right" style="width: 160px">投标记录：</td>
							<td><input id="tenderId" name="tenderId"
								class="nui-buttonedit" onbuttonclick="onButtonEdit"
								style="width: 300px" required="false" enabled="true" /></td>
							<td align="right" style="width: 100px">专业类别：</td>
							<td><input id="major" name="major" class="nui-dictcombobox"
								dictTypeId="ZH_MAJOR_TYPE" style="width: 300px" required="true" enabled="true"/></td>
							<td align="right" style="width: 100px">工程类别：</td>
							<td><input id="projectType" name="projectType"
								class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE"
								style="width: 300px" required="true" enabled="true"/></td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">合同价格模式：</td>
							<td><input id="contractModel" name="contractModel"
								class="nui-dictcombobox" dictTypeId="CONTRACT_MODEL"
								style="width: 300px" required="true" enabled="true"/></td>
							<td align="right" style="width: 100px">招标人采购方式:</td>
							<td><input id="procurementType" name="procurementType"
								class="nui-dictcombobox" dictTypeId="ZH_PROCUREMENT_TYPE"
								style="width: 100%" required="true" enabled="true"/></td>
							<td align="right" style="width: 100px">集团内外：</td>
							<td><input id="headquarterGroup" name="headquarterGroup"
								class="nui-dictcombobox" dictTypeId="ZH_GROUP"
								style="width: 300px" required="true" enabled="true"/></td>
						</tr>
						<tr>
							<td align="right" style="width: 120px">合同金额(元)：</td>
							<td><input name="contractSum" id="contractSum" class="nui-textbox"
								vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum"/></td>
							<td align="right" style="width: 120px">合同不含税金额(元)：</td>
							<td><input name="noTaxSum" id="noTaxSum" class="nui-textbox"
								vtype="float" style="width: 300px" required="true" onvaluechanged="editContractSum"/></td>
							<td align="right" style="width: 120px">税额(元)：</td>
							<td><input name="payTax" id="payTax" class="nui-textbox"
								vtype="float" style="width: 300px" required="true" enabled="false"/></td>
						</tr>
						<tr>
							<td align="right" style="width: 130px"><nobr>签约方：</nobr></td>
							<td><input name="signatory" id="custId" class="nui-combobox"
								required="true"
								url="com.zhonghe.ame.chargeContract.chargeContract.queryCusts.biz.ext"
								filterType="like" textField="custname" valueField="custid"
								dataField="custs" valueFromSelect="true" allowInput="true"
								pinyinField="custtype" style="width: 100%;"
								 /></td>
							<td align="right" style="width: 100px">合同签约主体：</td>
							<td><input id="contractSubject" name="contractSubject"
								class="nui-dictcombobox" dictTypeId="PAYER"
								style="width: 300px" required="true" /></td>
							<td align="right" style="width: 100px">收款方:</td>
							<td><input id="payee" name="payee" class="nui-dictcombobox"
								dictTypeId="PAYER" style="width: 100%" required="true" /></td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">合同文本密级:</td>
							<td><input id="contractSecretLevel"
								name="contractSecretLevel" class="nui-dictcombobox"
								dictTypeId="CONTRACT_SECRET_LEVEL" style="width: 100%"
								required="true" /></td>
							<td align="right" style="width: 100px">项目密级:</td>
							<td><input id="projectSecretLevel" name="projectSecretLevel"
								class="nui-dictcombobox" dictTypeId="PROJECT_SECRET_LEVEL"
								style="width: 100%" required="true" /></td>
							<td align="right" style="width: 100px">是否计划对外分包:</td>
							<td><input id="isfb" name="isfb" class="nui-dictcombobox"
								dictTypeId="ABF_YESORNO" style="width: 100%" required="true" /></td>
						</tr>
						<tr>
							<td align="right" style="width: 160px">备注：</td>
							<td colspan="5"><input name="remark" class="nui-textarea"
								style="width: 100%" required="false" /></td>
						</tr>
						</table>
					</div>
				</form>
			</fieldset>
			<fieldset id="field3" style="border: solid 1px #aaa; padding: 3px;">
			<legend>未来年度收款计划</legend>
			<div style="width: 95%;">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table style="width: 100%;">
						<tr>
							<td style="width: 100%;"><a class="nui-button"
								iconCls="icon-add" onclick="addRow()" plain="true">增加</a> <a
								class="nui-button" iconCls="icon-remove" onclick="removeRow()"
								plain="true">删除</a> <span class="separator" style="color: red">(总计应与合同金额一致)</span></td>
						</tr>
					</table>
				</div>
			</div>
			<div id="datagrid2" class="nui-datagrid"
				style="width: 100%; height: 200px;" allowResize="true" showSummaryRow="true" datafield="data"
				allowCellEdit="true" allowCellSelect="true" multiSelect="true" allowSortColumn = "false"
				showPager="false">
				<div property="columns">
					<div field="years" width="80" headerAlign="center"
						allowSort="true">
						年份<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="jan" width="80" headerAlign="center"
						allowSort="true">
						一月<input property="editor" class="nui-textbox" id = "jan"
							style="width: 100%;" />
					</div>
					<div field="feb" width="80" headerAlign="center"
						allowSort="true" >
						二月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="mar" width="80" headerAlign="center"
						allowSort="true">
						三月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="apr" width="80" headerAlign="center"
						allowSort="true">
						四月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="may" width="80" headerAlign="center"
						allowSort="true">
						五月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="jun" width="80" headerAlign="center"
						allowSort="true">
						六月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="jul" width="80" headerAlign="center"
						allowSort="true">
						七月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="aug" width="80" headerAlign="center"
						allowSort="true">
						八月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="sep" width="80" headerAlign="center"
						allowSort="true">
						九月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="oct" width="80" headerAlign="center"
						allowSort="true">
						十月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="nov" width="80" headerAlign="center"
						allowSort="true">
						十一月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="dec" width="80" headerAlign="center"
						allowSort="true">
						十二月<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					<div field="sum" width="120" headerAlign="center"
						allowSort="true" summaryType="sum">
						总计<input property="editor" class="nui-textbox"
							style="width: 100%;" />
					</div>
					
				</div>
			</div>
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
		var grid2 = nui.get("datagrid2");
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
    			var grid2 = nui.get("datagrid2");
    			var chargePlans = grid2.getData();
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
    			var json = nui.encode({'cpData':data,"misOpinion":data_opioion.misOpinion,"type":type,"chargePlans" : chargePlans});
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
				queryPlan(o.chargeContract.id);
				//nui.get("fDeptCountersignId").setText(o.chargeContract.fDeptCountersignName);
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
        function queryPlan(str) {
			nui.ajax({
				url : "com.zhonghe.ame.chargeContract.chargeContract.queryPlan.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : {
					"chargeId" : str
				},
				success : function(data) {
					grid2.setData(data.data);
					console.log(data.data);
				}
			})
		}
       //grid2.on("cellbeginedit",function(e){
			//	e.cancel="true";
			//console.log(e);
		//}); 
	function onButtonEdit(e) {
			var btnEdit = this;
			mini.open({
						url : "/default/contractPact/chargeContract/chargeContractBidList.jsp",
						title : "招标记录信息",
						width : '90%',
						height : '90%',
						ondestroy : function(action) {
							if (action == "ok") {
								var iframe = this.getIFrameEl();
								var data = iframe.contentWindow.GetData();
								data = mini.clone(data); //必须
								if (data) {
									btnEdit.setValue(data.empname);
									btnEdit.setText(data.empname);
									btnEdit.doValueChanged();
								}
							}

						}
					});
		}
		function addRow() {
			var newRow = {
				name : "New Row"
			};
			var jan = 0;
			var feb = 0;
			var mar = 0;
			var apr = 0;
			var may = 0;
			var jun = 0;
			var jul = 0;
			var aug = 0;
			var sep = 0;
			var oct = 0;
			var nov = 0;
			var dec = 0;
			var sum = 0;
			newRow = {
				jan : jan,
				feb : feb,
				mar : mar,
				apr : apr,
				may : may,
				jun : jun,
				jul : jul,
				aug : aug,
				sep : sep,
				oct : oct,
				nov : nov,
				dec : dec,
				sum : sum
			};
			var l = grid2.getData().length;
			grid2.addRow(newRow, l + 1);
		}
		function removeRow() {
			var rows = grid2.getSelecteds();
			if (rows.length > 0) {
				grid2.removeRows(rows, true);
			}
		}
		grid2.on("cellendedit", function(e) {
			var row = e.row;
			var jan = row.jan * 1;
			var feb = row.feb * 1;
			var mar = row.mar * 1;
			var apr = row.apr * 1;
			var may = row.may * 1;
			var jun = row.jun * 1;
			var jul = row.jul * 1;
			var aug = row.aug * 1;
			var sep = row.sep * 1;
			var oct = row.oct * 1;
			var nov = row.nov * 1;
			var dec = row.dec * 1;
			var sum = jan + feb + mar + apr + may + jun + jul + aug + sep + oct
					+ nov + dec;
			grid2.updateRow(row, {
				sum : sum
			});
			console.log(row);
		});
		grid2.on("cellbeginedit", function(e) {
			if (e.field == "sum") {
				e.cancel = "true";
			}
			console.log(e);
		});
		function editContractSum() {
			var contractSum = nui.get("contractSum").getValue();
			var noTaxSum = nui.get("noTaxSum").getValue();
			abs = function(val) {
				var str = (val).toFixed(2) + '';
				var intSum = str.substring(0, str.indexOf(".")).replace(
						/\B(?=(?:\d{3})+$)/g, '');
				var dot = str.substring(str.length, str.indexOf("."))
				var ret = intSum + dot;
				return ret;
			}
			nui.get("payTax").setValue(abs(contractSum-noTaxSum));
		}
    </script></body>
</html>
