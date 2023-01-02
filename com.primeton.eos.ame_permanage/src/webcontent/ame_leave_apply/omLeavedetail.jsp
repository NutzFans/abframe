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
            <legend>离职人员信息</legend>
            <table style="table-layout:fixed;" id="table_file">
            	<tr>
                	<td width="160px" align="right">离职人员：</td>
                    <td width="150px" id="userid" class = "asLabel"></td>
                    <td style="width:120px;" align="right">最后工作日：</td>
                    <td style="width:150px;" id="hopeoutdate" class = "asLabel"></td>
            		<td style="width:120px;" align="right">办理离职地点：</td>
                    <td style="width:150px;" id="outplace" class = "asLabel"></td>
                    <td style="width:120px;" align="right">办理日期：</td>
                    <td style="width:150px;" id="hopedealoutdate" class = "asLabel"></td>
            	</tr>
            	<tr>
            		<td style="width:120px;" align="right">个人离职原因：</td>
                    <td style="width:150px;" id="poutreason" class = "asLabel"></td>
                	<td width="120px" align="right">员工工号：</td>
                    <td width="150px" id="empcode" class = "asLabel"></td>
                    <td style="width:120px;" align="right">入职日期：</td>
                    <td style="width:150px;" id="indate" class = "asLabel"></td>
            		<td style="width:120px;" align="right">职位：</td>
                    <td style="width:150px;" id="positionname" class = "asLabel"></td>
            	</tr>
            	<tr id="tr1">
            		<td style="width:120px;" align="right">离职性质：</td>
                    <td style="width:150px;" id="outtype" class = "asLabel"></td>
            		<td style="width:120px;" align="right">离职原因归类：</td>
                    <td style="width:150px;" id="outreason" class = "asLabel"></td>
            		<td style="width:120px;" align="right" id="vacdealtype1">年假处理方式：</td>
                    <td style="width:150px;" id="vacdealtype" class = "asLabel"></td>
            		<td style="width:120px;" align="right" id="leaveprovedate1">开离职证明日期：</td>
                    <td style="width:150px;" id="leaveprovedate" class = "asLabel"></td>
            	</tr>
            	<tr id="bdleave" style="display: none;">
					<td align="right" style="width: 100px;" >离职补偿金额：</td>
					<td align="left" id="outoffsetmon" class = "asLabel"></td>
                	<td style="width:120px;" align="right">离职补偿说明：</td>
                    <td style="width:150px;" colspan="5" id="outoffsetdesc" class = "asLabel"></td>
            	</tr>
            	<tr id="tr2">
					<td align="right" style="width: 100px;" >交接人：</td>
					<td align="left" id="handuserid" class = "asLabel"></td>
                	<td style="width:120px;" align="right">工作交接要求：</td>
                    <td style="width:150px;" colspan="5" id="handrequire" class = "asLabel"></td>
            	</tr>
            	<tr id="tr3">
					<td align="right" style="width: 100px;" >交接说明：</td>
					<td align="left" id="handremark" class = "asLabel" colspan="7"></td>
            	</tr>
            	<tr id="hrconf" >
            		<td style="width:120px;" align="right">离职经办人：</td>
                    <td style="width:150px;" id="outagent" class = "asLabel"></td>
            		<td style="width:120px;" align="right">是否离职回访：</td>
                    <td style="width:150px;" id="isreturnvisit" class = "asLabel"></td>
            		<td style="width:120px;" align="right">是否签署保密：</td>
                    <td style="width:150px;" id="issignconf" class = "asLabel"></td>
                    <td style="width:120px;" align="right">邮箱保留设置：</td>
                    <td style="width:150px;" id="mailretain" class = "asLabel"></td>
            	</tr>
                <tr id="tr4">
                    <td style="width:120px;" align="right">离职证明收件人：</td>
                    <td style="width:150px;" id="recipient" class = "asLabel"></td>
            		<td style="width:120px;" align="right">离职证明联系方式：</td>
                    <td style="width:150px;" id="telephone" class = "asLabel"></td>
            		<td style="width:120px;" align="right">离职证明地址：</td>
            		<td style="width:150px;" id="leaveaddress" class = "asLabel"></td>
            		<td style="width:120px;" align="right">邮箱保留日期：</td>
                    <td style="width:150px;" id="mailretaindate" class = "asLabel"></td>
                	<!-- <td style="width:120px;" align="right">离职申请：</td>
                    <td style="width:690px;" colspan="7" id="outmemo" class = "asLabel"></td>  -->
                </tr>
                <tr id="tr5">
                	<td style="width:120px;" align="right">离职备注：</td>
                    <td style="width:690px;" colspan="7" id="remark" class = "asLabel"></td> 
                </tr>
                <tr id="tr12">
                	<td style="width:120px;" align="right">是否涉及第三方：</td>
                    <td style="width:150px;" colspan="1" id="isthird" class = "asLabel"></td> 
                	<td style="width:120px;" align="right">三方备注：</td>
                    <td style="width:150px;" colspan="5" id="thirdmark" class = "asLabel"></td> 
                </tr>
                <tr id="tr6">
                	<td style="width:120px;" align="right">离职回访原因：</td>
                    <td style="width:150px;" colspan="1" id="revisitreason" class = "asLabel"></td> 
                	<td style="width:120px;" align="right">离职回访原因说明：</td>
                    <td style="width:150px;" colspan="5" id="revisitremark" class = "asLabel"></td> 
                </tr>
                <tr id="tr7">
                	<td style="width:120px;" align="right">回访离职员工感受：</td>
                    <td style="width:690px;" colspan="7" id="revisitfeel" class = "asLabel"></td> 
                </tr>
                <tr id="tr8">
                	<td style="width:120px;" align="right">回访离职员工建议：</td>
                    <td style="width:690px;" colspan="7" id="revisitadvise" class = "asLabel"></td> 
                </tr>
                <tr id="tr9">
                	<td style="width:120px;" align="right">回访离职员工去向：</td>
                    <td style="width:690px;" colspan="7" id="revisitgo" class = "asLabel"></td> 
                </tr>
                <tr id="tr10">
                	<td style="width:120px;" align="right">回访离职员工薪资：</td>
                    <td style="width:690px;" colspan="7" id="revisitsalary" class = "asLabel"></td> 
                </tr>
                <tr id="tr11">
                	<td style="width:120px;" align="right">回访员工离职其他原因：</td>
                    <td style="width:690px;" colspan="7" id="revisitothreason" class = "asLabel"></td> 
                </tr>
            </table>
		</fieldset> 
	</div>
</body>
</html>