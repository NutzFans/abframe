<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-03-05 15:23:07
  - Description:
-->
<head>
	<title>员工合同续签详情</title>
	<style type="text/css">
	    .asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;    
	    }
	</style>
</head>
<body><div id="form1" >
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<input name="empCont.empcontid" class="nui-hidden"/>
			<input name="empCont.empid" id="empid" class="nui-hidden"/>
			<input name="empCont.userid" id="userid" class="nui-hidden"/>
			<input name="empCont.empname" id="empname" class="nui-hidden"/>
			<input name="empCont.orgname" id="orgname" class="nui-hidden"/>
			<input name="empCont.orgid" id="orgid" class="nui-hidden"/>
			<input name="empCont.orgname" id="orgname" class="nui-hidden"/>
			<input name="empCont.syqname" id="syqname" class="nui-hidden"/>
			<input name="empCont.sybname" id="sybname" class="nui-hidden"/>
			<input name="empCont.major" id="major" class="nui-hidden"/>
			<input name="empCont.processinstid" id="processinstid" class="nui-hidden"/>
			<input name="empCont.oldempcontid" id="oldempcontid" class="nui-hidden"/><!-- 历史合同  -->
			<input name="empCont.applystatus" id="applystatus" class="nui-hidden"/><!-- 发起/暂存 -->
            <legend>续签合同信息</legend>
            <table style="table-layout:fixed;" id="table_file">
            	<tr>
                    <td style="width:120px;" align="right">签署工号：</td>
                    <td style="width:150px;" id="contuserid" class = "asLabel"></td>
                	<td width="120px" align="right">合同属性：</td>
                    <td width="150px" id="conttype" class = "asLabel"></td>
                    <td align="right" style="width:120px">合同性质：</td>
					<td style="width:150px" id="contprop" class = "asLabel"></td>
            		<td style="width:100px;" align="right">职位分类：</td>
                    <td style="width:150px;" id="position" class = "asLabel"></td>
            	</tr>
            	<tr>
                    <td style="width:100px;" align="right">合同期限(年)：</td>
                    <td style="width:150px;" id="conttime" class = "asLabel"></td>
                    <td style="width:100px;" align="right">合同开始日期：</td>
                    <td style="width:150px;" id="contstart" class = "asLabel"></td>
                    <td style="width:120px;" align="right">合同结束日期：</td>
                    <td style="width:150px;" id="contend" class = "asLabel"></td>
            		<td style="width:100px;" align="right">职位名称：</td>
                    <td style="width:150px;" id="positionname1" class = "asLabel"></td>
            	</tr>
            	<tr>
                    <td style="width:100px;" align="right">签署公司：</td>
                    <td style="width:150px;" id="contcompany" class = "asLabel"></td>
            		<td style="width:100px;" align="right">签署工作地：</td>
                    <td style="width:150px;" id="contworkplace" class = "asLabel"></td>
            		<td align="right" style="width:100px;" >经办人：</td>
					<td align="left" style="width:150px;" id="agent" class = "asLabel"></td>
            	</tr>
                <tr>
	            	<td style="width:90px;" align="right">备注：</td>
	                <td style="width:150px;" colspan="7" id="remark" class = "asLabel"></td>
                </tr>
            </table>
		</fieldset>
	</div>
</body>
</html>