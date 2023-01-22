<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-04-20 13:55:40
  - Description:
-->
<head>
	<title>合同基本信息</title>
	<style type="text/css">
     .asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;    
	    }
    </style>
</head>
<body>
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		<legend>合同基本信息</legend>
			<form id="form_cont" method="post">
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:130px">合同名称：</td>
							<td><input name="csContract.projectname" id="projectname"  class="nui-buttonedit" style="width:300px" required="true" onbuttonclick="selectCont" allowInput="false"/></td>
							<td align="right" style="width:130px">合同编号：</td>
							<td style="width:190px" ><input name="csContract.contnum" id="contnum"  class="nui-textbox" style="width:150px" required="true" onvaluechanged="changeContNum"/></td>
						</tr>
					</table>
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<!-- <td align="right" style="width:130px">合同编号：</td>
							<td id="contnum" style="width:190px"></td> -->
							<td align="right" style="width:130px">客户：</td>
							<td id="custname" style="width:190px"></td>
							<td align="right" style="width:130px">受益人：</td>
							<td id="salename" style="width:190px"></td>
						</tr>
						<tr>
							<td align="right" style="width:130px">合同金额：</td>
							<td id="contsum" style="width:190px"></td>
							<td align="right" style="width:130px">登记日期：</td>
							<td id="contreg" style="width:190px"></td>
						</tr>
					</table>
				</div>
			</form>
	</fieldset>
</body>
</html>