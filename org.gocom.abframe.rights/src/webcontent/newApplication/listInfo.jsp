<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-14 13:38:56
  - Description:
-->
<head>
<title>功能组信息</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
</style>
</head>
<body>
<div class="nui-fit">
	<div title="应用信息" style="padding: 0;">
	 	<form id="form1" method="post" >
        	<table style="table-layout:fixed;" id="table_file1">
	            <tr>
	            	
	            	<input class="nui-hidden" name="funcGroupInfo.acFuncgroup.funcgroupid" >
					<td align="right" style="width:100px">功能组名称：</td>
					<td>
						<input class="nui-textbox" name="funcGroupInfo.funcgroupname" style="width:250px" required="true">
					</td>
					<td align="right" style="width:100px">所属功能组：</td>
					<td>
						<input class="nui-textbox" readonly="readonly" name="funcGroupInfo.acFuncgroup.funcgroupname" style="width:250px"  required="true"/>
					</td>
				</tr>
        	</table>
        </form>
  	</div>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="ok" id="a" style="width:60px;margin-right:20px;">保存</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");
	var appid = '<%=request.getParameter("appid") %>';
	var funcgroupid = '<%=request.getParameter("funcgroupid") %>';
	
	setData();
	function setData(){
		var json = {funcGroupId:appid};
		nui.ajax({
			url: "org.gocom.abframe.rights.application.FuncGroupManager.getFuncGroupInfo.biz.ext",
            type: "post",
            data: json, 
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	form.setData(text);
            },
            error: function () {
            }
		})
	}
	//保存应用信息
	function ok(){
		var data = form.getData();
		save(data);
	}
	
	function save(data){
		//修改
	    var json = {funcGroupUpdate:{funcgroupname:data.funcGroupInfo.funcgroupname,funcgroupid:funcgroupid,acFuncgroup:data.funcGroupInfo.acFuncgroup}};
		nui.ajax({
			url: "org.gocom.abframe.rights.application.FuncGroupManager.updateFuncGroup.biz.ext",
			type: 'POST',
			data:json,	
			contentType: 'text/json',
            success: function (result) {
            	if(result.isSuccess=='1'){
            		nui.alert("修改功能组成功啦。");
            	}else{
            		nui.alert("修改功能组失败啦，请联系信息技术部。");
            	}
            }
		})
	}
</script>
</html>