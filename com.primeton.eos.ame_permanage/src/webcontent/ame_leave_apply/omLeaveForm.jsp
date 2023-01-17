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
    <div id="form1" >
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<input name="omLeaveApply.leaveid" class="nui-hidden"/>
			<input name="omLeaveApply.processinstid"  class="nui-hidden"/>
			<input name="omLeaveApply.fileids" id="fileids2" class="nui-hidden"/>
			<input name="omLeaveApply.empname" id="empname" class="nui-hidden"/>
			<input name="omLeaveApply.oldoutdate" id="oldoutdate" class="nui-hidden"/>
			<input name="omLeaveApply.handusername" id="handusername" class="nui-hidden"/>
			<input name="omLeaveApply.outagentname" id="outagentname" class="nui-hidden"/>
			<!-- <input name="omLeaveApply.orgid" id="orgid" class="nui-hidden"/> -->
			<input name="omLeaveApply.dirleader" id="dirleader" class="nui-hidden"/>
			<input name="omLeaveApply.outmemo" class="nui-hidden"/>
			<input name="omLeaveApply.issecrecy" id="issecrecy" class="nui-hidden"/>
			<input name="omLeaveApply.revisitreason" id="revisitreason" class="nui-hidden"/>
            <legend>离职人员信息</legend>
            <table style="table-layout:fixed;" id="table_file">
            	<tr>
                	<td width="120px" align="right">离职人员：</td>
                    <td width="150px">    
						<input property="editor" name="omLeaveApply.userid" id="userid" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false" />
                    </td>
            		<td style="width:120px;" align="right">所属公司：</td>
                    <td style="width:150px;">    
                        <input class="nui-dictcombobox" name="omLeaveApply.company" id="company" dictTypeId="company" readonly="readonly"/>
                    </td>
                    <td style="width:120px;" align="right">所属事业部：</td>
                    <td style="width:150px;">    
                        <input class="nui-textbox"name="omLeaveApply.sybname" id="sybname" readonly="readonly"/>
                    </td>
                    <td align="right" style="width:100px">所属部门：</td>
					<td style="width:150px">
						<input name="omLeaveApply.orgid" id="orgid" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
						filterType="like" textField="orgname1" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" readonly="readonly">
					</td>
            	</tr>
            	<tr>
            		<td style="width:120px;" align="right">个人离职原因：</td>
                    <td style="width:150px;">    
                        <input class="nui-dictcombobox" name="omLeaveApply.poutreason" id="poutreason" dictTypeId="OUT_REASON" multiSelect="true"  readonly="readonly"/>
                    </td>
                    <td style="width:120px;" align="right">员工属性：</td>
                    <td style="width:150px;">    
                        <input class="nui-dictcombobox" name="omLeaveApply.emptype" id="emptype" dictTypeId="EMP_TYPE" readonly="readonly"/>
                    </td>
                    <td style="width:100px;" align="right">入职日期：</td>
                    <td style="width:150px;">    
                        <input class="nui-datepicker" name="omLeaveApply.indate" id="indate" readonly="readonly" />
                    </td>
                    <td style="width:100px;" align="right">职位：</td>
                    <td style="width:150px;">    
                        <input class="nui-textbox"name="omLeaveApply.positionname" readonly="readonly" />
                    </td>
            	</tr>
            	<tr>
                    <td style="width:100px;" align="right" id="lastOutDate">离职日期：</td>
                    <td style="width:150px;">    
                        <input class="nui-datepicker" name="omLeaveApply.outdate" id="hopeoutdate" required="true" onvaluechanged="changeoutdate"/>
                    </td>
            		<td style="width:120px;" align="right">办理离职地点：</td>
                    <td style="width:150px;">    
                        <input class="nui-dictcombobox" name="omLeaveApply.outplace" id="outplace" dictTypeId="EXP_REGION" required="true" emptyText="请选择" allowInput="true" valueFromSelect="true" onvaluechanged="changeOutPlace"/>
                    </td>
                    <td style="width:120px;" align="right">办理离职日期：</td>
                    <td style="width:150px;">    
                        <input class="nui-datepicker" name="omLeaveApply.dealoutdate" id="hopedealoutdate" required="true" />
                    </td>
                    <td id="leaveprovedate1" style="width:120px;display: none;" align="right">离职证明开具日期：</td>
                    <td id="leaveprovedate" style="width:150px;display: none;">    
                        <input class="nui-datepicker" name="omLeaveApply.leaveprovedate" id="leaveprovedate" required="true"/>
                    </td>
            	</tr>
            	<tr>
            		<td style="width:120px;" align="right">离职性质：</td>
                    <td style="width:150px;">    
                        <input class="nui-dictcombobox" name="omLeaveApply.outtype" id="outtype" dictTypeId="OUT_TYPE" required="true" emptyText="请选择"  onvaluechanged="changeReason"/>
                    </td>
            		<td style="width:100px;" align="right">离职原因归类：</td>
                    <td style="width:150px;">    
                        <input class="nui-dictcombobox" name="omLeaveApply.outreason" id="outreason" valueField="dictid" textField="dictname" emptyText="请选择" required="true"/>
                    </td>
            		<td style="width:120px;display: none;" align="right" id="ver">试用期结束日：</td>
                    <td style="width:150px;display: none;" id="ver1"> 
                        <input class="nui-datepicker" name="omLeaveApply.veriend" readonly="readonly"/>
                    </td>
            		<td style="width:120px;display: none;" align="right" id="hideveriresult">转正状态：</td>
                    <td style="width:150px;display: none;" id="hideveriresult1">    
                        <input class="nui-dictcombobox" name="omLeaveApply.veriresult" id="veriresult" dictTypeId="VERI_RESULT" emptyText="请选择"/>
                    </td>
                </tr>
            	<tr id="bdleave" style="display: none;">
                	<td style="width:120px;" align="right">补偿说明：</td>
                    <td style="width:150px;" colspan="4">    
                        <input name="omLeaveApply.outoffsetdesc" id="outoffsetdesc" class="nui-textbox"style="width:550px;"/>
                    </td>
					<td align="right" style="width: 120px;" id="outoffsetmon1">离职补偿金额：</td>
					<td align="left"  id="outoffsetmon2">
						<input name = "omLeaveApply.outoffsetmon" id="outoffsetmon" class="nui-spinner" format="n2"  showbutton="false"   allowLimitValue="false" changeOnMousewheel="false"  />
					</td>
					<td align="left" style="width:150px;">
						<span id="cost" style="margin-left: 20px;color: red;"></span>
					</td>
            	</tr>
                <tr>
	            	<td style="width:90px;" align="right">其他备注：</td>
	                <td style="width:150px;" colspan="7">    
	                    <input name="omLeaveApply.remark" id="remark" class="nui-textarea"style="width:98%;" />
	                </td>
                </tr>
            </table>
		</fieldset>
		<fieldset >
			<legend>请假记录</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/empleaveapply.jsp"/>
		</fieldset>
		<fieldset id="vac">
			<legend>年假信息</legend>
			<jsp:include page="/ame_permanage/ame_leave_apply/vactionGrid.jsp"/>
		</fieldset>
		<fieldset id="handHr" style="border:solid 1px #aaa;padding:3px;">
            <legend>离职交接情况</legend>
            <table style="table-layout:fixed;" id="table_file1">
            	<tr>
					<td align="right" style="width:110px;" >交接人：</td>
					<td align="left" style="width:150px;">    
						<input id="handuserid" class="nui-textboxlist"  name="omLeaveApply.handuserid"  required="true"  searchField="name"
							url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
							textField="empname" valueField="userid" onvaluechanged="changeHand" allowInput="true"/>
					</td>
                	<td style="width:90px;" align="right">工作交接要求：</td>
                    <td align="left" style="width:150px;" colspan="5">    
                        <input name="omLeaveApply.handrequire" id="handrequire" class="nui-textarea"style="width:660px;"/>
                    </td>
            	</tr>
            	<tr id="handremark1" style="display: none;">
                	<td style="width:70px;" align="right">工作交接说明：</td>
                    <td style="width:150px;" colspan="7" align="left">    
                        <input name="omLeaveApply.handremark" id="handremark" class="nui-textarea" style="width:100%;"/>
                    </td>
            	</tr>
            	<tr>
            		<td style="width:90px;" align="right">邮箱保留：</td>
                    <td style="width:150px;" align="left">    
                        <input class="nui-dictcombobox" name="omLeaveApply.mailretain" id="mailretain" dictTypeId="OM_LEAVE_MAIL" emptyText="请选择" onvaluechanged="changemailretain" required="true"/>
                    </td>
                    <td align="right" style="width: 90px;display: none;" id="maildeal">邮箱代管人：</td>
					<td align="left" style="width:150px;display: none;" id="maildeal1">    
						<input id="mailproxies" class="nui-textboxlist"  name="omLeaveApply.mailproxies" searchField="name"
							url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
							textField="empname" valueField="userid" onvaluechanged="changemail" allowInput="true"/>
					</td>
            		<td style="width:120px;display: none;" align="right" id="maildeal2">邮箱保留日期：</td>
                    <td style="width:150px;display: none;" id="maildeal3" colspan="1" align="left">    
                        <input class="nui-datepicker" name="omLeaveApply.mailretaindate" id="mailretaindate"/>
                    </td>
            	</tr>
            </table>
		</fieldset>
		<fieldset id="hrconf" style="border:solid 1px #aaa;padding:3px;display: none;">
            <legend>HR离职设置</legend>
            <table style="table-layout:fixed;" id="table_file1">
            	<tr>
            		<td style="width:105px;" align="right">离职经办人：</td>
                    <td style="width:150px;">    
                        <input class="nui-textboxlist" name="omLeaveApply.outagent" id="outagent"  required="true" searchField="name"
							url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
							textField="empname" valueField="userid" onvaluechanged="changeOutagent"  allowInput="true"/>
                    </td>
            		<td style="width:105px;" align="right">是否离职回访：</td>
                    <td style="width:150px;">    
                        <input class="nui-dictcombobox" name="omLeaveApply.isreturnvisit" id="isreturnvisit"  onvaluechanged="changeIsreturn" dictTypeId="MIS_YN" emptyText="请选择"/>
                    </td>
            		<td style="width:115px;" align="right">是否签署保密：</td>
                    <td style="width:150px;" >    
                        <input class="nui-dictcombobox" name="omLeaveApply.issignconf" id="issignconf" dictTypeId="MIS_YN" emptyText="请选择"/>
                    </td>
            		<td style="width:95px;display: none;" align="right" id="admindeal1">行政处理人：</td>
                    <td style="width:150px;display: none;" id="admindeal2">    
                        <input class="nui-textboxlist" name="omLeaveApply.admindeal" id="admindeal"  required="true" searchField="name"
							url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
							textField="empname" valueField="userid"  allowInput="true"/>
                    </td>
            	</tr>
            	<tr id="othmail" style="display: none;">
            		<td style="width:105px;" align="right"colspan="1">离职告知收件人：</td>
                    <td style="width:150px;"colspan="7"> 
                        <input class="nui-textbox" name="omLeaveApply.guanximail" id="guanximail" required="true" style="width: 750px;"/>
                    </td>
            	</tr>
            	<tr id="othmail1" style="display: none;">
            		<td style="width:105px;" align="right"colspan="1">离职告知抄送人：</td>
                    <td style="width:150px;"colspan="7"> 
                        <input name="omLeaveApply.zhulimail" id="zhulimail" class="nui-textboxlist"  searchField="name" style="width:800px"
	    						url="com.primeton.mis.contract.contractApproval.getEmpByName.biz.ext" value="" text=""
	    						textField="EMPNAMES" valueField="OEMAIL"style="width: 750px;"/>
                    </td>
            	</tr>
            	<tr id="rec">
            		<td style="width:105px;" align="right">离职回访人员：</td>
                    <td style="width:150px;"colspan="7"> 
                        <input class="nui-textboxlist" name="omLeaveApply.recruitlist" id="recruit"  required="true" searchField="name"
							url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
							textField="empname" valueField="userid"  allowInput="true" style="width: 780px;"/>
                    </td>
            	</tr>
            </table>
		</fieldset>
		<fieldset id="leaveProve" style="border:solid 1px #aaa;padding:3px;display: none;">
            <legend>离职证明寄送信息</legend>
            <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
				<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
				<input type="hidden" name="downloadFile" filter="false"/>
				<input type="hidden" name="fileName" filter="false"/>
			</form>	
            <table style="table-layout:fixed;" id="table_file1">
            	<tr>
            		<td style="width:104px;" align="right">收件人：</td>
                    <td style="width:150px;">    
                        <input name="omLeaveApply.recipient" class="nui-textbox" readonly="readonly"/>
                    </td>
            		<td style="width:105px;" align="right">联系方式：</td>
                    <td style="width:150px;">    
                        <input name="omLeaveApply.telephone" class="nui-textbox" readonly="readonly"/>
                    </td>
            		<td style="width:115px;" align="right">收件地址：</td>
                    <td style="width:150px;" colspan="3">    
                        <input name="omLeaveApply.leaveaddress" class="nui-textbox" style="width: 400px;" readonly="readonly"/>
                    </td>
            	</tr>
            	<tr id="leaveProvePrint" style="display: none;">
            		<td></td>
            		<td><span style="text-align:left;" >
							<a class="nui-button" onclick="exportPDF('leaveProveprint')" id="leaveProveprint">离职证明打印</a>
						</span>
					</td>
            	</tr>
            </table>
		</fieldset>
	</div>
</body>
</html>