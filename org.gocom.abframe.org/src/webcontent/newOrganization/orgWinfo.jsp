<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-30 13:28:47
  - Description:
-->
<head>
<title>本级机构</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
</style>
</head>
<body>
<div class="nui-fit">
	<div title="应用信息" style="padding: 30px 0;">
	 	<form id="form1" method="post" >	
	 		<input class="nui-hidden" id="positionid" name="position.positionid" />
        	<table style="table-layout:fixed;" id="table_file1">
	            <tr>
					<td align="right" style="width:100px">岗位名称：</td>
					<td>
						<input class="nui-textbox" name="position.posiname"  required="true" style="width:250px"/>
					</td>
					<td align="right" style="width:100px">岗位代码：</td>
					<td>
						<input class="nui-textbox" name="position.posicode" required="true" style="width:250px"/>
					</td>
				</tr>
				<tr>
					<td align="right">所属机构：</td>
	            	<td align="left" >
					   <input name="position.omOrganization.orgid" class="nui-combobox"  id="orgseq" textField="orgname" valueField="orgid" dataField = "orgs"  shownullItem="true"
						    allowInput="true" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" style="width:250px"/>
					</td>
					<td align="right" style="width:100px">所属职务：</td>
					<td>
						<input class="nui-buttonedit" name="position.omDuty.dutyid" style="width:250px;"  onbuttonclick="showDuty" showClose="false" allowInput="false"/>
					</td>
				</tr>
				<tr>
					<td align="right" style="width:100px">有效日期：</td>
					<td>
						<input class="nui-datepicker" name="position.startdate" style="width:250px"/>
					</td>
					<td align="right" style="width:100px">失效日期：</td>
					<td>
						<input class="nui-datepicker" name="position.enddate" style="width:250px"/>
					</td>
				</tr>
        	</table>
        </form>
  	</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="ok()" iconCls="icon-ok"  style="width:60px;margin-right:20px;">保存</a>
	<a class="nui-button" onclick="onCancel('cancel')" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var positionid = '<%=request.getParameter("positionid") %>';
	var status = '<%=request.getParameter("status") %>';
	var form = new nui.Form("form1");
	setData();
	function setData(){
		if(status == "null"){
			var json = {data:{positionid:positionid},type:"1"};
			nui.ajax({
				url: "org.gocom.abframe.tools.CommonUtil.commonQueryInfo.biz.ext",
	            type: "post",
	            data: json, 
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	            	var json = {position:text.data} 
	            	nui.get("orgseq").setValue(text.data.omOrganization.orgid);
	            	form.setData(json);
	            }
			})
		}else if(status == "0"){
			var json = {data:{orgid:positionid},type:"0"};
			nui.ajax({
				url: "org.gocom.abframe.tools.CommonUtil.commonQueryInfo.biz.ext",
	            type: "post",
	            data: json, 
	            contentType: 'text/json',
	            cache: false,
	            success: function (text) {
	            	nui.get("orgseq").setValue(text.data.orgid);
	            }
			})
		}else if(status == "1"){
			var json = {data:{positionid:positionid},type:"1"};
			nui.ajax({
				url: "org.gocom.abframe.tools.CommonUtil.commonQueryInfo.biz.ext",
	            type: "post",
	            data: json, 
	            cache: false,
	            contentType: 'text/json',
	            success: function (text) {
	            	var json = {position:text.data} 
	            	nui.get("orgseq").setValue(text.data.omOrganization.orgid);
	            	form.setData(json);
	            }
			})
		}
	}
	//保存应用信息
	function ok(){
		var form = new nui.Form("#form1");
		var data = form.getData();
        if (form.isValid() == false) {
        	nui.alert("请填写必填项。")
        	return;
        }else{
        	save(data);
        	return;
        }
	}
	
	function save(data){
		if(status=="0"){
			//新增机构信息
			nui.ajax({
				url: "org.gocom.abframe.org.position.PositionManager.addPosition.biz.ext",
				type: 'POST',
				data:data,
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.retCode){
	            		CloseWindow("save");
	            	}else{
	            		nui.alert("新增失败啦，请联系信息技术部。");
	            	}
	            }
			})
		}else{
			//修改机构信息
			nui.ajax({
				url: "org.gocom.abframe.org.position.PositionManager.updatePosition.biz.ext",
				type: 'POST',
				data:data,
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.retCode == "1"){
	            		CloseWindow("edit");
	            	}else{
	            		CloseWindow();
	            		nui.alert("修改失败啦，请联系信息技术部。");
	            	}
	            }
			})
		}
	}
	
	//选择机构主管人员
	function showDuty(e) {
        var btnEdit = this;
        nui.open({
			url:"<%=request.getContextPath() %>/abframe/org/duty/duty_tree.jsp",
			title: "选择列表",
			width: 400,
			height:500,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                btnEdit.setText(data.empname);	
					}
				}
			}
		});
	}
	
	function onCancel(e) {
    	var data = form.getData();
    	if(data){
        	nui.showMessageBox({
	            title: "关闭提示",
	            iconCls: "nui-messagebox-question",
	            buttons: ["yes", "no"],
	            message: "是否关闭？",
	            callback: function (action) {
	                if(action == "yes"){
	                	CloseWindow("cancel");
	                }
	            }
	        });
		}else{
			CloseWindow("cancel");
		}
    }
    
    function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
</script>
</html>