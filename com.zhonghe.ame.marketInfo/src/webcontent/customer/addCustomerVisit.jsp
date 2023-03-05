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
<title>新增拜访交流</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px">
		<fieldset id="field1" style="border: solid 1px #aaa;">
			<legend>拜访交流信息</legend>
			<form id="form1" method="post">
				<input name="files" id="fileids" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">填报人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" />
								<input id="createUser"class="nui-textbox" enabled="false" style="width: 250px" required="true" />
							</td>
							<td align="right" style="width: 130px">填报部门：</td>
							<td>
								<input id="orgName"class="nui-textbox" enabled="false" style="width: 250px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">客户名称：</td>
							<td>
								<input name="custinfoId" id="custinfoId" class="nui-hidden" />
								<input id="custname" class="nui-textbox" enabled="false" required="true" style="width: 250px" />
							</td>
							<td align="right" style="width: 130px">接洽日期：</td>
							<td>
								<input name="visitDate" id="visitDate" class="nui-datepicker" required="true" style="width: 250px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">接洽地点：</td>
							<td colspan="4">
								<input name="visitAddress" id="visitAddress" class="nui-textbox" style="width: 100%" required="true" emptyText="参考格式：某某公司，上海 - 只需要填写接洽使用的公司及城市即可"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">主要议题及成果：</td>
							<td colspan="4">
								<input name="visitResult" id="visitResult" class="nui-textarea" style="width: 100%;height: 215px;" required="true" emptyText="参考格式如下
主要议题：
1、
2、

主要成果：
1、
2"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">主要参会人员：</td>
							<td colspan="4">
								<input name="visitMeetingPerson" id="visitMeetingPerson" class="nui-textarea" style="width: 100%;height: 75px" required="true" emptyText="参考格式如下
我方：副总经理张三，企业发展部副主任李四；
对方：副总经理张三，企业发展部副主任李四；"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">对方联系人：</td>
							<td colspan="4">
								<input name="visitContacts" id="visitContacts" class="nui-textbox" style="width: 100%" required="true" emptyText="参考格式：张三【13511112222】，李四【010-8274000】"/>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		<fieldset id="field2" style="border: solid 1px #aaa;">
			<legend>上传附件</legend>
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>
	</div>
	
	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" iconCls="icon-save" onclick="onOk()" style="width: 60px; margin-right: 20px;">保存</a>
		<a class="nui-button" iconCls="icon-close" onclick="closeCancel()" style="width: 60px;">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		
		function setInitData(data) {
			nui.get("createUserid").setValue(userId);
			nui.get("createUser").setValue(userName);
			nui.get("orgName").setValue(userOrgName);
			nui.get("custinfoId").setValue(data.custid);
			nui.get("custname").setValue(data.custname);			
		}

		function onOk() {
			if (!form.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}else{
				document.getElementById("fileCatalog").value = "customerVisit";
				form2.submit();			
			}			
		}
		
		function SaveData() {
			var data = form.getData();
			data.files = nui.get("fileids").getValue();
			delete data.criteria;
			var json = nui.encode({'custVisit' : data});
			ajaxCommon({
				"url" : "com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.addCustVisit.biz.ext",
				"data" : json,
				"success" : function(data) {
					if(data.result=="1"){
						showTips("新增客户交流拜访信息成功");
						closeOk();
					}else{
						showTips("新增客户交流拜访信息失败，请联系管理员！", "danger");
					}
				}
			});			
		}
	</script>	
	
</body>
