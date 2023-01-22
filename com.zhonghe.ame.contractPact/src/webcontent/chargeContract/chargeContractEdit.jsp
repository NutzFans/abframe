
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="commonj.sdo.DataObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-12 16:17:56
  - Description:
-->
<head>
	<title>收费合同签订编辑 </title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 100%;">
				<legend>收费合同签订信息</legend>
				<form id="form1" method="post">
						<input name="files" id="fileids" class="nui-hidden"/>
						<input class="nui-hidden" name="id" id = "chargeId"/>
<!-- 					<input name="expusername" id="expusername" class="nui-hidden"/> -->
<!-- 					<input name="senderusername" id="senderusername" class="nui-hidden"/> -->
<!-- 					<input id="empid" class="nui-hidden" /> -->
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
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>上传附件</legend>
				<jsp:include page="/ame_common/inputFile.jsp"/>
			</fieldset>

		
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
        <%
	   		UserObject user = (UserObject) session.getAttribute("userObject");
	   		String username = user.getUserName();
	   		String userno = user.getUserId();
	   		String userOrgName = user.getUserOrgName();
	   		String userOrgId = user.getUserOrgId();
	   		Map<String,Object> a = user.getAttributes();
	   		String empid = (String) a.get("empid");
	   		DataObject[] roles = (DataObject[])a.get("roles");
// 	   		Boolean isAdmin = false;//是否行政
// 			for(int i=0;i < roles.length;i++){
// 				if(roles[i].getString("roleid").equals("admin") || roles[i].getString("roleid").equals("finance")){
// 					isAdmin = true;
// 				}
// 			}
	    %>
<%-- 	    var isAdmin = <%=isAdmin %>; --%>
		var form = new nui.Form("form1");
		var grid2 = nui.get("datagrid2");
		var id = "";
        init();
        function init(){
        	
		  	nui.get("createUserid").setValue("<%=userno %>");
		  	nui.get("createUsername").setValue("<%=username %>");
<%-- 		  	nui.get("senderusername").setValue("<%=username %>"); --%>
<%-- 		  	nui.get("expusername").setValue("<%=username %>"); --%>
<%-- 		  	//nui.get("exporgid").setValue("<%=userOrgId %>"); --%>
<%-- 		  	//nui.get("exporgid").setText("<%=userOrgName %>"); --%>
<%-- 		  	nui.get("orgId").setValue("<%=userOrgId %>"); --%>
<%-- 		  	nui.get("orgId").setText("<%=userOrgName %>"); --%>
<%-- 		  	var datas = {value : "<%=userOrgId %>"};    --%>
        }
    	function onOk(){
			//定义变量接受form表单数据
			var form = new nui.Form("#form1");
			form.validate();
    			if(form.isValid()==false){
    				nui.alert("请检查必填项");
    				return;
    			}	
			var data = form.getData(); 
		  	document.getElementById("fileCatalog").value="feameAgreementinfo";
			form2.submit();
	    }
    	function SaveData(){
				var form = new nui.Form("#form1");
    			var data = form.getData();
    			var grid2 = nui.get("datagrid2");
    			var chargePlans = grid2.getData();
    			data.id=nui.get("chargeId").getValue();
    			data.files = nui.get("fileids").getValue();
//     			opinion(data);
    			var json = nui.encode({'data':data,"chargePlans" : chargePlans});
				if(!confirm("是否保存？")){
        				return;
        			}else{	
		    	nui.ajax({
		                url: "com.zhonghe.ame.chargeContract.chargeContract.updateChargeContract.biz.ext",
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		               		 if(text.result==1){
		               		 nui.alert("编辑成功",null,function(){
		               		 window.CloseOwnerWindow("save");
            					
            				});
            			} else{
            				nui.alert("编辑失败")
            			}
		                
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            }); 
		            }
    	}
    	
		
		function setEditData(data){
			queryPlan(data.id);
			console.log(data);
			var form = new nui.Form("form1");
			form.setData(data)
			var grid_0 = nui.get("grid_0");
        	grid_0.load({"groupid":"CHARGE_CONTRACT","relationid":data.id});
			grid_0.sortBy("fileTime","desc");
		}
		
    	 function onCancel(e) {
            CloseWindow("cancel");
        }
        //标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
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
