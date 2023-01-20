<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-14 13:40:07
  - Description:
-->
<head>
<title>新增编辑功能列表</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;font-size:12px;}
</style>
</head>
<body>
<div class="nui-fit">
	<div id='form1'>
		<table style="margin: 40px auto 0;">
			<input id='appid' class="nui-hidden" name="funcGroup.acApplication.appid"/>
			<input class="nui-hidden" id="funcgroupid" name="funcgroupid"/>
			<tr>
				<td style="width:100px" align="right">功能组名称：</td>
            	<td style="width:150px;" align="left">
					<input class="nui-textbox" id='funcgroupname' name="funcGroup.funcgroupname" style="width:100%" required="true"/>
				</td>
			</tr>
			<tr>
				<td style="width:100px" align="right">所属功能组：</td>
            	<td style="width:150px;" align="left">
					<input class="nui-textbox" id='acFuncgroup' name="funcGroup.acFuncgroup" style="width:100%"/>
				</td>
			</tr>
		</table>
	</div>
</div>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width: 60px;margin-right: 20px;">保存</a>
	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var status = '<%=request.getParameter("status")%>';//0是新增，1是修改
	var appid = '<%=request.getParameter("appid")%>';
	nui.get("appid").setValue(appid);
	function setData(data){
		if(status == '0'){
			nui.get("acFuncgroup").setEnabled(false);
			nui.get("acFuncgroup").setValue(appid);
			return;
		}else{
			nui.get("funcgroupname").setValue(data[0].funcgroupname);
			nui.get("funcgroupid").setValue(data[0].funcgroupid);
			nui.get("acFuncgroup").setValue(data[0].acFuncgroup.funcgroupname);
		}
	}
	
	function onOk(){
		var form = new nui.Form("#form1");
		var data = form.getData();
		form.isValid()
        if (form.isValid() == false) {
        	nui.alert("请填写必填项。")
        	return;
        }else{
        	save(data);
        	return;
        }
	}

	//增加最高级业务字典
	function save(data){
		if(status=='0'){
			var json = {funcGroupId:appid,funcGroupTemp:{funcgroupname:data.funcGroup.funcgroupname,acFuncgroup:{funcgroupid:appid}}};
			//新增
			nui.ajax({
				url: "org.gocom.abframe.rights.application.FuncGroupManager.addSubFuncGroup.biz.ext",
				type: 'POST',
				data:json,	
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.isSuccess=='1'){
	            		nui.alert("新增子功能组成功啦。");
	            		CloseWindow("save");
	            	}else{
	            		nui.alert("新增子功能组失败啦，请联系信息技术部。");
	            	}
	            }
			})
		}else if(status=='1'){
			//修改
		    var json = {funcGroupUpdate:{funcgroupname:data.funcGroup.funcgroupname,funcgroupid:data.funcgroupid}};
			nui.ajax({
				url: "org.gocom.abframe.rights.application.FuncGroupManager.updateFuncGroup.biz.ext",
				type: 'POST',
				data:json,	
				contentType: 'text/json',
	            success: function (result) {
	            	if(result.isSuccess=='1'){
	            		nui.alert("修改功能组成功啦。");
	            		CloseWindow("edit");
	            	}else{
	            		nui.alert("修改功能组失败啦，请联系信息技术部。");
	            	}
	            }
			})
		}
	}
	//关闭窗口
	function onCancel(e) {
        CloseWindow("cancel");
    }
    function CloseWindow(action) {
        if (action == "cancel" ) {
            if (!confirm("是否关闭？")) {
                return false;
            }
        }
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
</script>
</html>