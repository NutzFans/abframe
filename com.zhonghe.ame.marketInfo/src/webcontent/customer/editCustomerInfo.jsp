<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
	body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
	}
</style>
<head>
<title>编辑客户信息</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px">
		<form id="form1" method="post">
			<input id="custid" class="nui-hidden" name="custinfo.custid" />
			<div style="padding: 5px;">
				<table style="table-layout: fixed;">
					<tr>
						<td align="right" style="width: 100px">填报人：</td>
						<td>
							<input name="custinfo.createUserid" id="createUserid" class="nui-hidden" />
							<input id="custmanager" name="custinfo.custmanager" class="nui-textbox" enabled="false" style="width: 100px" required="true" />
						</td>
						<td align="right" style="width: 100px">填报部门：</td>
						<td>
							<input name="custinfo.accoutbank" id="accoutbank" shownullItem=ture class="nui-treeselect" textField="orgname" valueField="orgid" parentField="omOrganization.orgid" dataField="orgs"
								showTreeIcon="true" valueFromSelect="true" style="width: 200px" url="com.zhonghe.ame.imptask.keytask.getAllRunOrgsforzdrw.biz.ext" allowInput="true" required="true"
								onvaluechanged="changeOrgForm(e)" multiSelect="false" checkRecursive="false" expandOnLoad="0" showFolderCheckBox="true" enabled="false" />
							<input name="custinfo.accoutname" id="accoutname" class="nui-hidden" />
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 100px">客户名称：</td>
						<td colspan="3">
							<input id="custname" class="nui-textbox" name="custinfo.custname" required="true" style="width: 100%" />
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>

	<div style="text-align: center; position: relative; bottom: 0px" class="nui-toolbar">
		<a class="nui-button" iconCls="icon-save" onclick="onOk()" style="width: 60px; margin-right: 20px;">保存</a>
		<a class="nui-button" iconCls="icon-close" onclick="closeCancel()" style="width: 60px;">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		
		function setEditData(data) {
			nui.get("custid").setValue(data.custid);
			nui.get("createUserid").setValue(data.createUserid);
			nui.get("custmanager").setValue(data.custmanager);
			nui.get("accoutbank").setValue(data.accoutbank);
			nui.get("accoutname").setValue(data.accoutname);
			nui.get("custname").setValue(data.custname);
		}
		
		function onOk() {
			var data = form.getData();
			var json = nui.encode(data);
			if (!form.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			ajaxCommon({
				"url" : "com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.editCustInfo.biz.ext",
				"data" : json,
				"success" : function(data) {
					if(data.result=="1"){
						showTips("编辑客户成功");
						closeOk();
					}else if(data.result=="2"){
						showTips("系统中已存在同名客户，无法编辑保存！", "danger");
					}else{
						showTips("编辑客户失败，请联系管理员！", "danger");
					}
				}
			});
		}
	</script>

</body>
</html>