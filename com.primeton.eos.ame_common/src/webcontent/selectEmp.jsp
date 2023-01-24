<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<!-- 
  - Author(s): 朱海翔
  - Date: 2017-03-21 10:54:04
  - Description:
-->
<head>
<title>选择人员（多选）</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body >
<div class="nui-fit" style="border:solid 0px #aaa;padding:0px;width:auto;">
	<form id="form1" method="post">
	        <div style="padding:5px;" id="opinionHide">
	            <table style="table-layout:fixed;">
		            <tr>
                    <td style="width:100px;" align="right">人员姓名：</td>
                    <td  align="left" >
					   					<input id="lookup2" class="nui-textboxlist"  searchField="name" style="width:240px"
			        						url="com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext" value="" text=""
			        						textField="EMPNAME" valueField="USERID" />
	   								</td>
	                </tr>
	            </table>
	        </div>
    </form>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>
	<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">取消</a>
</div>
<script type="text/javascript">
	nui.parse();
	//关闭
	function onCancel() {
		CloseWindow("cancel");
	} 
   	function onOk(){
		CloseWindow("ok");
	}
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	function GetData() {
        var userid = nui.get("lookup2").getValue();
        var empname = nui.get("lookup2").getText();
        var data={userid:userid,empname:empname};
		return data;
	}
</script>
</body>
</html>
