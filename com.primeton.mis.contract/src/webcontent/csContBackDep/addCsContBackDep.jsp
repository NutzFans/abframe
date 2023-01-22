<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2018-08-24 15:27:15
  - Description:
-->
<head>
<title>新增保函保证金</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend >新增保函保证金</legend>
		<form id="form_add" method="post">
			<input name="csContBackDep.contnum" id="contnum" class="nui-hidden"/>
			<input name="csContBackDep.projectname" id="projectname" class="nui-hidden"/>
			<table style="table-layout:fixed;" id="table_file">
				<tr>
					<td align="right" style="width:120px">合同编号：</td>
					<td colspan="5"><input name="csContBackDep.contractid" class="nui-buttonedit" onbuttonclick="getContract" showClose="false" allowInput="false" style="width:200px"/></td>
				</tr>
				<tr>
			    	<td align="right" style="width:120px">保函保证金类型：</td>
					<td><input name="csContBackDep.type" id="type" class="nui-dictcombobox" dictTypeId="CS_BACKDEP_TYPE"  style="width:100px" required="true" /></td>
					<td align="right" style="width:120px">金额：</td>
					<td><input name="csContBackDep.backdepmon" id="backdepmon" class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" style="width:120px" /></td>
					<td align="right" style="width:160px">保函保证金打款日期：</td>
					<td><input name="csContBackDep.paydate" id="paydate"  class="nui-datepicker" format="yyyy-MM-dd" style="width:120px" /></td>
				</tr>
				<tr>
			    	<td align="right" style="width:120px">是否已办理：</td>
					<td><input name="csContBackDep.isdeal" id="isdeal" class="nui-dictcombobox" dictTypeId="MIS_YN"  style="width:100px" /></td>
					<td align="right" style="width:120px">退还金额：</td>
					<td><input name="csContBackDep.returnmon" id=returnmon class="nui-spinner" format="n2"  allowLimitValue="false" changeOnMousewheel="false"  showbutton="false" style="width:120px" /></td>
					<td align="right" style="width:160px">保函保证金退还日期：</td>
					<td><input name="csContBackDep.predredate" id="predredate"  class="nui-datepicker" format="yyyy-MM-dd" style="width:120px" /></td>
				</tr>
				<tr>
					
			    	<td align="right" style="width:120px">状态：</td>
					<td><input name="csContBackDep.status" id="status" class="nui-dictcombobox" dictTypeId="CS_BACK_DEP"  style="width:100px" /></td>
					<td align="right" style="width:120px" id="aaa">付款申请单号：</td>
					<td id="bbb"><input name="csContBackDep.expno" id="expno" class="nui-textbox" style="width:120px" /></td>
					<td align="right" style="width:160px">保证金实际退还日期：</td>
					<td><input name="csContBackDep.practredate" id="practredate"  class="nui-datepicker" format="yyyy-MM-dd" style="width:120px" /></td>
					
				</tr>
				<tr>
					<td align="right" style="width:120px">期间描述：</td>
					<td colspan="5"><input name="csContBackDep.perioddesc" id="perioddesc" class="nui-textbox" style="width:500px" /></td>
				</tr>
				<tr>
					<td align="right" style="width:120px">备注：</td>
					<td colspan="5"><input name="csContBackDep.remark" id="remark" class="nui-textarea" style="width:100%"/></td>
				</tr>
			</table>
	    </form>
	    <div style="text-align:center;padding:10px;">               
            <a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">保存</a>       
            <a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>       
        </div>	
    </fieldset>
</body>
<script type="text/javascript">
	nui.parse();
	
	var form_add = new nui.Form("form_add");
	
     //确定新增调用方法
	function onOk() {
		if(!form_add.validate()){
			nui.alert("表单信息填写不完整，请确认必输项是否填写！！");
			return;
		}
		nui.confirm("确定新增保存？","保存提示",
			function(action){
				if(action == "ok"){
					var data_add = form_add.getData();
			        var json = {csContBackDep: data_add.csContBackDep};
					nui.ajax({
			            url: "com.primeton.mis.contract.csContBackDep.addCsContBackDep.biz.ext",
			            data: json,
			            type: 'POST',
			            cache: false,
			            contentType: 'text/json',
			            success: function (text) {
			            	if(text.exception == null){
				            	nui.alert("保存成功！");
				            	CloseWindow("ok");
			            	}else{
			            		nui.alert("保存失败！");
			            	}
			            },
			            error: function (jqXHR, textStatus, errorThrown) {
			                alert(jqXHR.responseText);
			            }
			        });
				}
			}	
		);
	}
    function getContract() {
        var btnEdit = this;	
        var lookupUrl="";
    	lookupUrl = "/contract/contract/contract_lookup.jsp";
        nui.open({
			url:"<%=request.getContextPath() %>"+lookupUrl,
			title: "选择合同",
			width: 1150,
			height: 500,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setValue(data.id);
		                btnEdit.setText(data.text);
		                nui.get("contnum").setValue(data.text);
		                nui.get("projectname").setValue(data.projectname);
					}
				}
			}
		});
	}
	//取消
    function onCancel(){
     	CloseWindow("close");
    }
    
    //关闭窗口
	function CloseWindow(action){
      if(action=="close"){
      	CloseWindow("cance");
      }else if(window.CloseOwnerWindow) 
        return window.CloseOwnerWindow(action);
      else
        return window.close();
    }
</script>
</html>