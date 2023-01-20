<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): WangTong
  - Date: 2019-10-12 12:39:47
  - Description:
-->
<head>
<title>报销单新增及修改</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;
	    }
    </style>
</head>
<body>
    <div class="nui-fit">
    <input name="pageType" class="nui-hidden" /> 
	<div id="dataform1">
		<table  style="width:100%;padding:10px;">
			<tr>
				<td align="right" >员工姓名：</td>
				<td><input name="omemployeeacct.empid" id="empname" class="nui-buttonedit" 
					onbuttonclick="selectEmpname" allowInput="false" required="true" width="130px"/>
				</td>
				<td class="form_label" align="right">
					单位/个人名称：</td>
				<td colspan="1"><input class="nui-textbox"
					name="omemployeeacct.username" width="120px"/></td>
					
				<td class="form_label" align="right">
					银行名称：</td>
				<td colspan="1" align="left"><input class="nui-dictcombobox"
					name="omemployeeacct.banknamedict" required="true" width="120px" dictTypeId="BANKNAME"/></td>
			</tr>
			
			<tr>
				<td class="form_label" align="right">
					银行卡号：</td>
				<td colspan="1"><input class="nui-textbox"
					name="omemployeeacct.bankacct" required="true" align="left" id="bankacct" width="130px"/></td>
				<td class="form_label" align="right">
					账户开户行：</td>
				<td colspan="1" align="left"><input class="nui-textbox"
					name="omemployeeacct.bankname" required="true" width="120px"/></td>
				<td class="form_label" align="right">
					银行账户类型：</td>	
				<td colspan="1" align="left"><input class="nui-dictcombobox"
					name="omemployeeacct.banktype" required="true" width="120px" dictTypeId="BANKACCTTYPE" multiSelect="true"/></td>
			</tr>
			<tr>
				<td class="form_label" align="right">是否默认卡：</td>
				<td colspan="1"><input class="nui-dictcombobox"
					dictTypeId="MIS_YN" name="omemployeeacct.isdefault"
					required="true" align="left" width="130px"/></td>
			</tr>
		</table>
		<!-- <div class="nui-toolbar" style="padding-top: 0px;margin-top: 20px" borderStyle="border:0px">
			<table width="100%">
				<tr>
					<td style="text-align: center;" colspan="6"><a
						class="nui-button" iconCls="icon-save" onclick="onOk()"> 保存 </a> <span
						style="display: inline-block; width: 25px;"> </span> <a
						class="nui-button" iconCls="icon-cancel" onclick="onCancel()">
							取消 </a></td>
				</tr>
			</table>
		</div> -->
	</div>
	</div>
	</body>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()"  id="okbutton" iconCls="icon-ok" style="width:60px;margin-right:20px;">保存</a>       
	    <a class="nui-button" onclick="onCancel()"  iconCls="icon-cancel" style="width:60px;">关闭</a>  
     </div> 
	<script type="text/javascript">
		nui.parse();
		function saveData() {
			var form = new nui.Form("#dataform1");
			form.setChanged(false);
			//保存
			var urlStr = "com.primeton.eos.common.omemployeeacctbiz.addOmEmployeeAcct.biz.ext";
			var pageType = nui.getbyName("pageType").getValue();
			//编辑
			if (pageType == "edit") {
				urlStr = "com.primeton.eos.common.omemployeeacctbiz.updateOmEmployeeAcct.biz.ext";
			}
			form.validate();
			if (form.isValid() == false)
				return;

			var data = form.getData(false, true);

			var json = nui.encode(data);
			
			$.ajax({
				url : urlStr,
				type : 'POST',
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(text) {
					var returnJson = nui.decode(text);
					if (returnJson.exception == null) {
						CloseWindow("save");
					} else {
						nui.alert("保存失败", "系统提示", function(action) {
							if (action == "ok" || action == "close") {
								//CloseWindow("saveFailed");
							}
						});
					}
				}
			});
		}

		//页面间传输json数据  
		function setFormData(data) {
			//跨页面传递的数据对象，克隆后才可以安全使用
			var infos = nui.clone(data);
			//保存list页面传递过来的页面类型：add表示新增、edit表示编辑
			nui.getbyName("pageType").setValue(infos.pageType);

			//如果是点击编辑类型页面
			if (infos.pageType == "edit") {
				//数据的回显
				var json = infos.record;
				var form = new nui.Form("#dataform1");//将普通form转为nui的form
				form.setData(json);
				//只是一个标志  标识这个页面是否被修改过
				form.setChanged(true);
				//回显员工姓名 
				nui.get("empname").setText(infos.empname);
				nui.get("empname").disable();
				nui.get("bankacct").disable();
			}
		}

		//关闭窗口
		function CloseWindow(action) {
			if (action == "close" && form.isChanged()) {
				if (confirm("数据被修改了，是否先保存？")) {
					saveData();
				}
			}
			if (window.CloseOwnerWindow)
				return window.CloseOwnerWindow(action);
			else
				window.close();
		}

		//确定保存或更新
		function onOk() {
			saveData();
		}

		//取消
		function onCancel() {
			CloseWindow("cancel");
		}

		

		/**
         *	选择员工姓名
         */
        function selectEmpname(){
	    	var btnEdit = this;
	        nui.open({
	            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择纸质报销单送递财务人员",
                width: 430,
                height: 400,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.empid);
                            btnEdit.setText(data.empname);
                        }
                    }

                }
            });
        }
	</script>
</html>