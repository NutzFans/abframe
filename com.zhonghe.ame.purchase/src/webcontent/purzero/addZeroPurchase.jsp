<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp" %>
<html>
<head>
	<title>新增零星采购</title>
	<style type="text/css">
		body {
			margin: 0;
			padding: 0;
			border: 0;
			width: 100%;
			height: 100%;
			overflow: hidden;
		}
	</style>
</head>
<body>
	<div class="nui-fit">
		<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 98%;">
			<legend>零星采购信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<div style="padding: 5px; margin-left:5px;">
					<table style="table-layout: fixed;" id="table_file" width="60%">
						<tr>
							<td align="right" style="width:140px">零星采购名称：</td>
							<td colspan="4">
								<input name="purchaseName" id="purchaseName"  class="nui-textbox" required="true"  style="width: 100%" required="true" />
							</td>
							<td width="120px" class="form_label" align="right">采购单位：</td>
							<td colspan="2">
								<input name="createdOrgname" id="createdOrgname" class="nui-textbox" required="true" value="<%=userOrgName %>" style="width:100%;" readonly="readonly" />
							</td>
							
						</tr>
						<tr>
							<td align="right" style="width: 140px">合同名称<span style="color: red;">(若有)</span>：</td>
							<td colspan="4">
								<input name="contract" id="contract" class="nui-textbox" style="width: 100%;" />
							</td>
							<td width="120px" class="form_label" align="right">总金额(万元)：</td>
							<td colspan="2">
								<input name="totalAmount" id="totalAmount" style="width: 100%"
									class="nui-textbox" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 140px">供方/乙方/承包人全称：</td>
							<td colspan="4">
								<input name="contractor" id="contractor" class="nui-textbox" required="true"  style="width: 100%;" />
							</td>
							<td align="right" style="width:100px">预计采购时间：</td>
							<td colspan="2">
								<input name="purchaseDate" id="purchaseDate"  class="nui-datepicker" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td class="form_label" align="right">申请原因：</td>
							<td colspan="7">
								<input style="width:100%;height: 40px;" name="applyReason" class="nui-textarea"
									id="remark" required="true" />
							</td>
						</tr>
					</table>
				</div>
			</form>
			<fieldset style="height:100%; border:solid 1px #aaa;width: 95%; ">
				<a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addTicket()">增加</a>
				<a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeTicket()">删除</a>
				<div id="grid_traveldetail" class="nui-datagrid" style="width: 100%;height: auto;"
					allowCellSelect="true" showPager="false" allowCellEdit="true" multiSelect="true"
					oncellendedit="changeValueon">
					<div property="columns">
						<div field="itemName" width="130" align="center" headerAlign="center" vtype="required">
							采购物项名称
							<input name="itemName" property="editor" class="nui-textbox" width="100%" />
						</div>
						<div field="brandSpec" width="130" align="center" headerAlign="center">品牌/型号/规格
							<input name="brandSpec" property="editor" class="nui-textbox" width="100%" />
						</div>
						<div field="unit" width="80" align="center" headerAlign="center">单位
							<input name="unit" property="editor" class="nui-textbox" style="width:100%;" />
						</div>
						<div field="onePrice" align="center" headerAlign="center" vtype="float">
							<h4 style="color:red">单价(万元)</h4>
							<input name="onePrice" property="editor" class="nui-textbox"  width="100%" />
						</div>
						<div field="num" align="center" headerAlign="center" vtype="required">数量
							<input name="num" property="editor" class="nui-spinner" minValue="0" value="0" maxValue="999999999" width="100%" />
						</div>
						<div field="totalPrice" width="130" align="center" headerAlign="center">
							<h4 style="color:red">总价(万元)</h4>
							<input name="totalPrice" property="editor" class="nui-textbox" readonly="readonly"
								width="100%" />
						</div>
						<!-- <div  field="plansimplementtime"  width="130" align="center" headerAlign="center"  >拟实施时间
					<input id="plansimplementtime" name="plansimplementtime" property="editor"  class="nui-datepicker"  />
			</div> -->
					</div>
				</div>
			</fieldset>
			
			<fieldset id="field2" style="border: solid 1px #aaa;">
				<legend>上传附件</legend>
				<jsp:include page="/ame_common/inputFile.jsp" />
			</fieldset>
			
		</fieldset>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk(0)" id="saveReimb" iconCls="icon-save"
			style="width: 80px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onOk(1)" id="creatReimbProcess" iconCls="icon-ok"
			style="width: 80px;margin-right: 20px;">提交</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" iconCls="icon-close"
			style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid_traveldetail = nui.get("grid_traveldetail");
		var type;
		function changeValueon(e) {
			var record = e.record;
			if (e.field == "num" || e.field == "onePrice") {
				if (record.num != null && record.onePrice != null) {
					var totalPrice1 = mulFloat(record.num, record.onePrice).toString();
					grid_traveldetail.updateRow(e.row, {
						totalPrice: totalPrice1
					});
					totalAmount();
				} else {
					grid_traveldetail.updateRow(e.row, {
						totalPrice: ""
					});

				}
			}
		}

		//math.evaluate()
		//选择部门领导
		function selectManager() {
			var btnEdit = this;
			selectUser(function (data) {
				btnEdit.setValue(data.userid);
				btnEdit.setText(data.empname);
				nui.get("managerName").setValue(data.empname)
			})
		}
		//选择分管领导
		function selectLeader() {
			var btnEdit = this;
			selectUser(function (data) {
				btnEdit.setValue(data.userid);
				btnEdit.setText(data.empname);
				nui.get("leaderName").setValue(data.empname)
			})
		}
		
		//添加附件之后， onOk 方法进行 附件提交， 附件页面回调父级页面SaveData 方法
		// 因此改造 原先的onOk  方法中保存逻辑处理放置于 SaveData中
		function onOk(e) {
			// 进行原先效验逻辑处理，效验通过， 进行文件提交， 然后进行保存处理
			type = e;
			var judge = getJudge();
			var formData = form.getData(), gridData = grid_traveldetail.getData();
			var totalAmount = nui.get("totalAmount").getValue();
			formData.type = type;
			if(judge==1){
				judge = isExist(judge);
			}
			formData.judge = judge;
			var json = nui.encode({ "purZero": formData, "purZeroItem": gridData });
			if (type == 1) {
				if (!form.validate() || gridData.length < 1) {
					alert("请检查表单和采购明细填写是否完整!");
					return;
				}
				if(totalAmount>=10){
					alert("零星采购总金额不能大于10万元");
					return;
				}
				grid_traveldetail.validate();
				if (grid_traveldetail.isValid() == false) {
					var error = grid_traveldetail.getCellErrors()[0];
					grid_traveldetail.beginEditCell(error.record, error.column);
					return;
				}
			} 
			// 附件不是必填，不需要效验
			// 添加附件提交
			document.getElementById("fileCatalog").value = "purchaseZero";
			form2.submit();
		}
		
		function SaveData() {			
			var judge = getJudge();
			var formData = form.getData(), gridData = grid_traveldetail.getData();
			var totalAmount = nui.get("totalAmount").getValue();
			formData.type = type;
			if(judge==1){
				judge = isExist(judge);
			}
			formData.judge = judge;
			formData.files = nui.get("fileids").getValue();
			console.log("999-3",nui.get("fileids").getValue());
			var json = nui.encode({ "purZero": formData, "purZeroItem": gridData });
			if (type == 1) {	
				info = "是否提交？"
			} else {
				info = "是否暂时保存？"
			}	
			if (!confirm(info)) {
				nui.get("saveReimb").enable();
				nui.get("creatReimbProcess").enable();
				return;
			} else {
				ajaxCommon({
					"url": "com.zhonghe.ame.purchase.purchaseItems.addPurZero.biz.ext",
					"data": json,
					"success": function (data) {
						showTips("新增零星采购成功");
						closeOk();
					}
				});
			}
		}


		function addTicket() {
			var rowS = { name: "New Row" }
			grid_traveldetail.addRow(rowS);
		}


		function removeTicket() {
			var rows = grid_traveldetail.getSelecteds();
			if (rows.length > 0) {
				grid_traveldetail.removeRows(rows, true);
				totalAmount();
			} else {
				nui.alert("请至少选中一条记录！");
			}
		}

		//计算总金额
		function totalAmount() {
			var tempData = grid_traveldetail.data;
			var a = tempData.length;
			var b = 0;
			for (var i = 0; i < a; i++) {
				if (!!tempData[i].totalPrice && tempData[i].totalPrice > 0) {
					b = addFloat(b, tempData[i].totalPrice)
				} else {
					var x = 0;
					b = addFloat(b, x)
				}
			}
			nui.get("totalAmount").setValue(b)
// 			if (b > 5) {
// 				$(".leader").css("display", "");
// 			} else if (b < 5) {
// 				$(".leader").css("display", "none");
// 				nui.get("leader").setText("");
// 				nui.get("leader").setValue("")
// 				nui.get("leaderName").setValue("")
// 			}
		}
		    //判断是否是项监部
	function isExist(judge){
	    var bool;
	     var json = nui.encode({org:{"orgid":userOrgId}});
	      nui.ajax({
	        url:"com.zhonghe.ame.purchase.common.queryOrgByOrgId.biz.ext",
	        data:json,
	        async:false,
	        type:"post",
	        success:function(text){
	        	if(text.res.branch == "4"||text.res.branch =="5"){
	        		judge = 3;
	        	}
        		
	        }
	      });
	      return judge;
    }

	</script>
</body>
</html>