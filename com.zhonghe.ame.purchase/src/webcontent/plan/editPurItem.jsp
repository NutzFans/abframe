<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<!-- 
  - Author(s): zhang-yb
  - Date: 2018-08-14 10:09:12
  - Description:
-->
	<head>
		<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
		<title>采购目录</title>
		<style type="text/css">
			html, body{font-size:12px;padding:0;margin:0;border:0;height:100%;}
		</style>
	</head>
	<body>
		<fieldset style="border:solid 1px #aaa;padding:3px;width: 90%;">
			<legend>采购目录</legend>
			<form id="form1" method="post">
				<input class="nui-hidden" name="id" id="id" />
				<table id="form11" style="table-layout:fixed; ">
					<tr>
						<td class="form_label" style="width: 100px" align="right">采购目录类型：</td>
						<td style="width: 400px">
							<input class="nui-dictcombobox" name="type" style="width:80%" id="type"
								dictTypeId="ZH_PURCHASE" required="true" onvaluechanged="codeTypeChange" />
						</td>
					</tr>
					<tr>
						<td align="right" class="form_label" id="type1">
							采购编码类型：
						</td>
						<td>
							<input id="grade" name="grade" class="nui-radiobuttonlist" required="true"
								onvaluechanged="codeTypeChange1"
								data="[{id: '1', text: '大类'}, {id:'2', text: '中类'}, {id:'3' , text: '小类'}]" />
						</td>
					</tr>
					<tr id="parent1">
						<!--  -->
						<td class="form_label" align="right">物项上级编码：</td>
						<td>
							<input class="nui-dictcombobox" style="width:80%" textField="itemCode" name="parentId"
								valueField="id" id="parentCode" required="true" dataField="purItems"
								onvaluechanged="typeChange" />
						</td>
					</tr>
					<tr id="parent">
						<td class="form_label" align="right">物项上级名称：</td>
						<td>
							<input class="nui-textbox" enabled="false" style="width:80%" id="typeName"
								name="a_item_name" required="true" />
						</td>
					</tr>
					<tr id="first">
						<td align="right" class="form_label" id="cgdl"></td>
						<td>
							<input class="nui-textbox" name="itemCode" style="width:80%" required="true" />
						</td>
					</tr>
					<tr id="first1">
						<td align="right" class="form_label" id="cgdlmc"></td>
						<td>
							<input class="nui-textbox" name="itemName" style="width:80%" required="true" />
						</td>
					</tr>
					<tr id="guikou">
						<td align="right" class="form_label">
							归口部门：
						</td>
						<td>
							<input id="orgId" name="orgId" class="nui-dictcombobox"  dictTypeId="ZH_PUTUNDER" required="true" style="width:80%;"/>
							<!-- <input name="orgId" id="orgId" style="width:80%" class="nui-combobox" required="true"
								url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" filterType="like"
								textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true"
								allowInput="true" /> -->
						</td>
					</tr>
				</table>
			</form>
		</fieldset>

		<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" class="nui-toolbar">
			<a class="nui-button" onclick="submit" style="width:60px;margin-right:20px;">保存</a>
			<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
		</div>
	</body>
	<script type="text/javascript">
		nui.parse();
		var isCode = true;
		var form1 = new nui.Form("#form1");
		document.getElementById("first").style.display = "none";
		document.getElementById("first1").style.display = "none";
		document.getElementById("parent").style.display = "none";
		document.getElementById("parent1").style.display = "none";
		document.getElementById("guikou").style.display = "none";

		var id = <%= request.getParameter("id") %> ;

		function codeTypeChange() {
			var type = nui.get("type").getValue();
			if (type == 2) {
				nui.get("grade").setData("[{id: '1', text: '大类'}, {id:'2', text: '中类'}]");
			} else {
				nui.get("grade").setData("[{id: '1', text: '大类'}, {id:'2', text: '中类'}, {id:'3', text: '小类'}]");
			}
			document.getElementById("first").style.display = "none";
			document.getElementById("first1").style.display = "none";
			document.getElementById("parent").style.display = "none";
			document.getElementById("parent1").style.display = "none";
			document.getElementById("guikou").style.display = "none";
		}

		function SetData(data) {
			var data = nui.clone(data);
			if (data.action == "edit") {
				var json = nui.encode(data);
				nui.ajax({
					url: "com.zhonghe.ame.purchase.purchaseItems.queryPurItemforedit.biz.ext",
					type: "post",
					data: json,
					contentType: 'text/json',
					success: function(o) {
						form1.setData(o.purItems);
						console.log(o)
						codeTypeChange();
						nui.get("grade").setValue(o.purItems.grade);
						codeTypeChange1();
						nui.get("parentCode").setText(o.purItems.a_item_code);
						nui.get("parentCode").setValue(o.purItems.parentId);
					}
				});
			}
		}

		function onCancel(e) {
			CloseWindow("cancel");
		}

		function CloseWindow(action) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
			else window.close();
		}

		function typeChange(e) {
			nui.get("typeName").setValue(e.selected.itemName);
		}

		function submit() {
			if (!form1.validate()) {
				nui.alert("请填写必填项!");
				return;
			}
			var formData = form1.getData();
			var json = nui.encode({
				"purItem": formData
			})
			nui.ajax({
				url: "com.zhonghe.ame.purchase.purchaseItems.addPurItem.biz.ext",
				data: json,
				type: 'POST',
				cache: false,
				contentType: 'text/json',
				success: function(text) {
					CloseWindow("ok");

				},
				error: function(jqXHR, textStatus, errorThrown) {
					alert(jqXHR.responseText);
				}
			});


		}

		function codeTypeChange1() {
			document.getElementById("guikou").style.display = "none";
			var typeValue = nui.get("type").getValue();
			if (typeValue == null || typeValue == "") {
				nui.alert("请先选采购目录类型！");
				return;
			}
			var codetype = nui.get("grade").getValue();
			if (codetype == 1) {
				document.getElementById("first").style.display = "";
				document.getElementById("first1").style.display = "";
				document.getElementById("cgdl").innerHTML = '采购大类编码：';
				document.getElementById("cgdlmc").innerHTML = '采购大类名称：';
				document.getElementById("parent").style.display = "none";
				document.getElementById("parent1").style.display = "none";
				if (typeValue == 1) {
					document.getElementById("guikou").style.display = "";
				}
				/* nui.get("Info").doLayout(); */
			} else if (codetype == 2) {
				document.getElementById("first").style.display = "";
				document.getElementById("first1").style.display = "";
				document.getElementById("parent").style.display = "";
				document.getElementById("parent1").style.display = "";
				document.getElementById("cgdl").innerHTML = '采购中类编码：';
				document.getElementById("cgdlmc").innerHTML = '采购中类名称：';
				document.getElementById("guikou").style.display = "none";
				if (typeValue == 2) {
					document.getElementById("guikou").style.display = "";
				}
				/* nui.get("Info").doLayout(); */
			} else if (codetype == 3) {
				document.getElementById("first").style.display = "";
				document.getElementById("first1").style.display = "";
				document.getElementById("cgdl").innerHTML = '采购小类编码：';
				document.getElementById("cgdlmc").innerHTML = '采购小类名称：';
				document.getElementById("parent1").style.display = "";
				document.getElementById("parent").style.display = "";
				document.getElementById("guikou").style.display = "none";
				/* nui.get("Info").doLayout(); */
			}
			var id = nui.get("id").getValue();
			nui.get("parentCode").setUrl("com.zhonghe.ame.purchase.purchaseItems.queryPurItem.biz.ext?grade=" + (codetype -
				1) + "&type=" + typeValue + "&id=" + id);

		}
	</script>
</html>
