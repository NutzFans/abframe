<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-04-21 11:12:26
  - Description:
-->
<head>
<title>许可申请表单</title>
</head>
<body>
    <div id="form_csLiceSend" >
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
    		<input name="csLiceSend.fileids" id="fileids1" class="nui-hidden"/>
			<input name="csLiceSend.sendid" class="nui-hidden"/>
			<input name="csLiceSend.processinstid" id="processinstid" class="nui-hidden"/>
			<input name="csLiceSend.applystatus" id="applystatus" class="nui-hidden"/><!-- 发起/暂存 -->
			<input name="csLiceSend.contractid" id="contractid" class="nui-hidden"/>
			<input name="csLiceSend.contnum" id="liccontnum" class="nui-hidden"/>
			<input name="csLiceSend.projectname" id="licprojectname" class="nui-hidden"/>
			<input name="csLiceSend.contnum" id="liccontnum" class="nui-hidden"/>
			<input name="csLiceSend.isNeedAppr" id="isNeedAppr" class="nui-hidden"/>
			<input name="csLiceSend.inceptpersonmail" id="inceptpersonmail" class="nui-hidden"/><!-- 接收人邮件 -->
			<input name="csLiceSend.inceptiscomp" id="inceptiscomp" class="nui-hidden"/><!-- 接收人是否内部员工 -->
			
            <legend>许可申请表单</legend>
            <table style="table-layout:fixed;" id="table_file">
            	<tr>
                    <td style="width:140px;" align="right">应用系统：</td>
                    <td style="width:150px;"colspan="3">    
                        <input name="csLiceSend.projectid" id="projectid" class="nui-combobox" filterType="like" 
                        textField="projectname" valueField="projectid" dataField="list" valueFromSelect="true" allowInput="true"  style="width:300px"/>
                    </td>
                    <td style="width:100px;" align="right" id="senddate1">发送日期：</td>
                    <td style="width:150px;"  id="senddate2">    
                        <input class="nui-datepicker" name="csLiceSend.senddate" id="senddate" onvaluechanged="changecontstart"style="width:140px"/>
                    </td>
            	</tr>
            	<tr>
                    <td style="width:100px;" align="right">接收人：</td>
                    <td style="width:150px;" colspan="2">    
                        <input name="csLiceSend.inceptperson" id="inceptperson" required="true" class="nui-buttonedit" style="width:300px" onbuttonclick="selectPerson" allowInput="false"/>
                    </td>
                    <td style="width:100px;" align="right">接收人所在公司：</td>
                    <td style="width:150px;"colspan="2">    
                        <input class="nui-textbox" name="csLiceSend.custname" id="custname" readonly="readonly" style="width:245px"/>
						<input name="csLiceSend.inceptcustid" id="inceptcustid" class="nui-hidden"/>
                    </td>
            	</tr>
                <tr>
	            	<td style="width:90px;" align="right">备注：</td>
	                <td style="width:150px;" colspan="7">    
	                    <input name="csLiceSend.remark" id="remark" class="nui-textarea"style="width:98%;"  maxLength="255"/>
	                </td>
                </tr>
                <tr id="leader" style="display: none;">
	            	<td style="width:90px;" align="right">审批人：</td>
	                <td style="width:150px;" colspan="7">    
	                    <input class="nui-textboxlist" name="" id="leaders" searchField="name" style="width:98%"
    						url="com.primeton.mis.contract.contractApproval.getEmpByName.biz.ext" value="" text=""
    						textField="EMPNAME" valueField="USERID" allowInput="true"/>
	                </td>
                </tr>
            </table>
		</fieldset>
	</div>
</body>
</html>