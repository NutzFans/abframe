<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-09-09 14:20:10
  - Description:
-->
<head>
<title>负责部门信息</title>
</head>
<body>
    <div id="form1" style="width: auto;" >
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<input name="omLeaveApply.leaveid" class="nui-hidden"/>
			<input name="omLeaveApply.fileids" id="fileids2" class="nui-hidden"/>
			<input name="omLeaveApply.userid" class="nui-hidden"/>
			<input name="omLeaveApply.outdate" class="nui-hidden"/>
			<input name="omLeaveApply.mailretain" class="nui-hidden"/>
			<input name="omLeaveApply.outtype" class="nui-hidden"/>
			<input name="omLeaveApply.outreason" class="nui-hidden"/>
            <legend>离职人员信息</legend>
            <table style="table-layout:fixed;" id="table_file">
            	<tr id="tr1">
                	<td width="120px" align="right">离职人员：</td>
                    <td width="150px" id="userid" class = "asLabel"></td>
                    <td style="width:120px;" align="right">最后工作日：</td>
                    <td style="width:150px;" id="outdate" class = "asLabel"></td>
            		<td style="width:120px;" align="right">办理离职地点：</td>
                    <td style="width:150px;" id="outplace" class = "asLabel"></td>
                    <td style="width:120px;" align="right">办理离职日期：</td>
                    <td style="width:150px;" id="hopedealoutdate" class = "asLabel"></td>
            	</tr>
            	<tr id="tr2">
                	<td width="120px" align="right">员工工号：</td>
                    <td width="150px" id="empcode" class = "asLabel"></td>
                    <td style="width:120px;" align="right">入职日期：</td>
                    <td style="width:150px;" id="indate" class = "asLabel"></td>
            		<td style="width:120px;" align="right">职位：</td>
                    <td style="width:150px;" id="positionname" class = "asLabel"></td>
                    <td style="width:120px;" align="right">交接人：</td>
                    <td style="width:150px;" id="handuserid" class = "asLabel"></td>
            	</tr>
            	<tr id="tr3" style="display: none;">
                	<td width="120px" align="right">离职人员：</td>
                    <td width="150px" id="userid1" class = "asLabel"></td>
                    <td style="width:120px;" align="right">所属部门：</td>
                    <td style="width:150px;" id="orgid1" class = "asLabel"></td>
            		<td style="width:120px;" align="right">入职日期：</td>
                    <td style="width:150px;" id="indate1" class = "asLabel"></td>
                    <td style="width:120px;" align="right">职位：</td>
                    <td style="width:150px;" id="positionname1" class = "asLabel"></td>
            	</tr>
            	<tr id="tr4" style="display: none;">
                	<td width="120px" align="right">员工工号：</td>
                    <td width="150px" id="empcode1" class = "asLabel"></td>
                    <td style="width:120px;" align="right">最后工作日：</td>
                    <td style="width:150px;" id="outdate1" class = "asLabel"></td>
            		<td style="width:120px;" align="right">办理离职地点：</td>
                    <td style="width:150px;" id="outplace1" class = "asLabel"></td>
                    <td style="width:120px;" align="right">办理离职日期：</td>
                    <td style="width:150px;" id="hopedealoutdate1" class = "asLabel"></td>
            	</tr>
            	<tr id="tr22">
                    <td style="width:120px;" align="right">所属部门：</td>
                    <td style="width:150px;" id="orgid" class = "asLabel"></td>
                	<td width="120px" align="right">直属领导：</td>
                    <td width="150px" id="dirleadername" class = "asLabel"></td>
                    <td style="width:120px;" align="right">性别：</td>
                    <td style="width:150px;" id="gender" class = "asLabel"></td>
            		<td style="width:120px;" align="right">手机号：</td>
                    <td style="width:150px;" id="mobileno" class = "asLabel"></td>
            	</tr>
            	<tr id="tr222">
                    <td style="width:120px;" align="right">员工属性：</td>
                    <td style="width:150px;" id="emptype" class = "asLabel"></td>
            	</tr>
            	<tr id="tr5" style="display: none;">
                	<td width="120px" align="right">离职性质：</td>
                    <td width="150px" id="outtype" class = "asLabel"></td>
                	<td width="120px" align="right">个人离职原因：</td>
                    <td width="150px" id="poutreason" class = "asLabel"></td>
                    <td style="width:120px;" align="right">离职原因归类：</td>
                    <td style="width:150px;" id="outreason" class = "asLabel"></td>
                    <td style="width:120px;" align="right">交接人：</td>
                    <td style="width:150px;" id="handuserid1" class = "asLabel" colspan="3"></td>
            	</tr>
            	<tr id="bdleave" style="display: none;">
                	<td width="120px" align="right">补偿说明：</td>
                    <td width="150px" id="outoffsetdesc" class = "asLabel"></td>
                    <td style="width:120px;" align="right">离职补偿金额：</td>
                    <td style="width:150px;" id="outoffsetmon" class = "asLabel" colspan="5"></td>
            	</tr>
            	<tr id="tr6" style="display: none;">
                	<td width="120px" align="right">其他备注：</td>
                    <td width="150px" id="remark" class = "asLabel" colspan="7"></td>
            	</tr>
            	<tr id="mail">
            		<td style="width:120px;" align="right">邮箱保留设置：</td>
                    <td style="width:150px;" id="mailretain" class = "asLabel"></td>
            		<td style="width:120px;" align="right">邮箱代管人：</td>
                    <td style="width:150px;" id="mailproxies" class = "asLabel"></td>
            		<td style="width:120px;" align="right">邮箱保留日期：</td>
                    <td style="width:150px;" id="mailretaindate" class = "asLabel"></td>
            	</tr>
            	<tr id="baomi" style="display: none;">
            		<td style="width:120px;" align="right" id="hidebaomi">是否涉密：</td>
                    <td style="width:150px;" id="hidebaomi1">    
                        <input class="nui-dictcombobox" name="omLeaveApply.isbaomi" id="isbaomi" dictTypeId="MIS_YN" emptyText="请选择" required="true"   onvaluechanged="changeIsBaoMi"/>
                    </td>
            	</tr>
            </table>
		</fieldset>
		<fieldset id="downloadprove" style="border:solid 1px #aaa;padding:3px;display: none;">
            <legend>离职文件打印及邮寄</legend>
			<span style="text-align:left;margin-left: 70px;" id="leaveprint">
				<a class="nui-button" onclick="exportPDF('leaveapply2')" id="leaveapplypdf" >离职申请</a>
			</span>
			<span style="text-align:left;" id ="leaveprint1">
				<a class="nui-button"onclick="doPrint()" id="print1" >离职交接单</a>
			</span>
			<span style="text-align:left;display: none;" id="secrecy">
				<a class="nui-button" onclick="exportPDF('secrecyPrimeton')" id="secrecyPrimeton">保密承诺书（普元）</a>
				<a class="nui-button" onclick="exportPDF('secrecyNingBo')" id="secrecyNingBo">保密承诺书（宁波普元）</a>
				<a class="nui-button" onclick="exportPDF('secrecyZhiHui')" id="secrecyZhiHui">保密承诺书（普元智慧）</a>
			</span>
            <div style="color: red;margin-left: 70px;" id="leavemes1">如您无法前往公司办公室办理离职手续，请打印以上离职文件，签字后邮寄到以下地址：</div>	
			<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
				<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
				<input type="hidden" name="downloadFile" filter="false"/>
				<input type="hidden" name="fileName" filter="false"/>
			</form>	
            <table style="table-layout:fixed;" id="leavemes">
            	<tr>
            		<td width="114px" align="right">收件人：</td>
                    <td width="150px" id="proveuserid" class = "asLabel"></td>
                    <td style="width:105px;" align="right">联系方式：</td>
                    <td style="width:150px;" id="provetel" class = "asLabel"></td>
            		<td style="width:105px;" align="right">收件地址：</td>
                    <td style="width:500px;" id="proveadress" class = "asLabel" colspan="3"></td>
            	</tr>
            </table>
		</fieldset>  
		<fieldset id="leaveProve" style="border:solid 1px #aaa;padding:3px;display: none;">
            <legend>为方便HR给您寄送离职证明，请填写个人联系方式：</legend>
            <table style="table-layout:fixed;" id="table_file1">
            	<tr>
            		<td style="width:120px;" align="right">收件人：</td>
                    <td style="width:150px;">    
                        <input name="omLeaveApply.recipient" class="nui-textbox" required="true"/>
                    </td>
            		<td style="width:120px;" align="right">联系方式：</td>
                    <td style="width:150px;">    
                        <input name="omLeaveApply.telephone" class="nui-textbox" required="true"/>
                    </td>
            		<td style="width:115px;" align="right">收件地址：</td>
                    <td style="width:150px;" colspan="3">    
                        <input name="omLeaveApply.leaveaddress" class="nui-textbox" style="width: 400px;" required="true"/>
                    </td>
            	</tr>
            	<tr>
            		<td style="width:120px;" align="right" colspan="1">私人邮箱：</td>
                    <td style="width:150px;">    
                        <input name="omLeaveApply.pemail" class="nui-textbox" required="true"/>
                    </td>
                    <td style="color: red" align="left" colspan="6">提示：如有变更请修改</td>
            	</tr>
            </table>
		</fieldset>  
		<fieldset id="leaveReturn" style="border:solid 1px #aaa;padding:3px;display: none;">
            <legend>离职回访</legend>
            <table style="table-layout:fixed;" id="table_file1">
            	<tr>
            		<td style="width:115px;" align="right">招聘经办人：</td>
                    <td style="width:150px;">     
                        <input name="omLeaveApply.recempname" id="recempname1"  class="nui-textbox" readonly="readonly" style="width: 150px;"/>
                    </td>
            		<td style="width:115px;" align="right">主要原因：</td>
                    <td style="width:150px;">     
                        <input name="omLeaveApply.revisitreason" id="revisitreason"  class="nui-dictcombobox" valueField="dictid" textField="dictname" required="true" style="width: 150px;"/>
                    </td>
            		<td style="width:115px;" align="right">其他原因：</td>
                    <td style="width:150px;" colspan="3">     
                        <input name="omLeaveApply.revisitothreason" id="revisitothreason"  class="nui-dictcombobox"  multiSelect="true"  valueField="dictid" textField="dictname" required="true" style="width: 150px;"/>
                    </td>
            	</tr>
            	<tr>
            		<td style="width:95px;" align="right">离职原因说明：</td>
                    <td style="width:150px;" colspan="7">    
                        <input name="omLeaveApply.revisitremark" class="nui-textarea" style="width:950px;" required="true"/>
                    </td>
            	</tr>
            	<tr>
            		<td style="width:95px;" align="right">感受：</td>
                    <td style="width:150px;" colspan="7">    
                        <input name="omLeaveApply.revisitfeel" class="nui-textarea" style="width:950px;" required="true"/>
                    </td>
            	</tr>
            	<tr>
            		<td style="width:95px;" align="right">建议：</td>
                    <td style="width:150px;" colspan="7">    
                        <input name="omLeaveApply.revisitadvise" class="nui-textarea" style="width:950px;" required="true"/>
                    </td>
            	</tr>
            	<tr>
            		<td style="width:95px;" align="right">去向：</td>
                    <td style="width:150px;" colspan="7">    
                        <input name="omLeaveApply.revisitgo" class="nui-textarea" style="width:950px;" required="true"/>
                    </td>
            	</tr>
            	<tr>
            		<td style="width:95px;" align="right">薪资：</td>
                    <td style="width:150px;" colspan="7">    
                        <input name="omLeaveApply.revisitsalary" class="nui-textarea" style="width:950px;" required="true"/>
                    </td>
            	</tr>
            </table>
		</fieldset> 
		<fieldset id="leaveIntern" style="border:solid 1px #aaa;padding:3px;display: none;">
            <legend>离职实习生第三方确认</legend>
            <table style="table-layout:fixed;" id="table_file1">
            	<tr>
            		<td style="width:115px;" align="right">招聘经办人：</td>
                    <td style="width:150px;">     
                        <input name="omLeaveApply.recempname" id="recempname"  class="nui-textbox" readonly="readonly" style="width: 150px;"/>
                    </td>
            		<td style="width:115px;" align="right">是否涉及第三方：</td>
                    <td style="width:150px;">     
                        <input name="omLeaveApply.isthird" id="isthird"  class="nui-dictcombobox" dictTypeId="MIS_YN" required="true" style="width: 150px;"/>
                    </td>
                    <td><a style="margin-right: 30px;"></a><input class="nui-checkbox" id="issolve"/>已解决</td>
            	</tr>
            	<tr>
            		<td style="width:95px;" align="right">三方备注：</td>
                    <td style="width:150px;" colspan="7">    
                        <input name="omLeaveApply.thirdmark" class="nui-textarea" style="width:950px;" />
                    </td>
            	</tr>
            </table>
		</fieldset>     
	</div>
</body>
</html>