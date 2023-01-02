<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2020-02-27 17:12:54
  - Description:
-->
<head>
<title>员工续签合同信息</title>
</head>
<body>
    <div id="form1" >
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<input name="empCont.empcontid" class="nui-hidden"/>
			<input name="empCont.empid" id="empid" class="nui-hidden"/>
			<input name="empCont.userid" id="userid" class="nui-hidden"/>
			<input name="empCont.empname" id="empname" class="nui-hidden"/>
			<input name="empCont.orgid" id="orgid" class="nui-hidden"/>
			<input name="empCont.orgname" id="orgname" class="nui-hidden"/>
			<input name="empCont.syqname" id="syqname" class="nui-hidden"/>
			<input name="empCont.sybname" id="sybname" class="nui-hidden"/>
			<input name="empCont.major" id="major" class="nui-hidden"/>
			<input name="empCont.hrconfirmdate" id="hrconfirmdate" class="nui-hidden"/>
			<input name="empCont.processinstid" id="processinstid" class="nui-hidden"/>
			<input name="empCont.oldempcontid" id="oldempcontid" class="nui-hidden"/><!-- 历史合同  -->
			<input name="empCont.applystatus" id="applystatus" class="nui-hidden"/><!-- 发起/暂存 -->
            <legend>续签合同信息</legend>
            <table style="table-layout:fixed;" id="table_file">
            	<tr>
                    <td style="width:140px;" align="right">签署工号：</td>
                    <td style="width:150px;">    
                        <input name="empCont.contuserid" id="contuserid" class="nui-textbox"  readonly="readonly" />
                    </td>
                	<td width="100px" align="right">合同属性：</td>
                    <td width="150px">    
						<input property="editor" name="empCont.conttype" id="conttype" class="nui-dictcombobox"  shownullItem="true" dictTypeId="CONT_TYPE"  required="true"/>
                    </td>
                    <td align="right" style="width:120px">合同性质：</td>
					<td style="width:150px">
						<input name="empCont.contprop" id="contprop" class="nui-dictcombobox" shownullItem="true" dictTypeId="CONT_PROP"  required="true" onvaluechanged="changecontprop"/>
					</td>
            		<td style="width:130px;" align="right">职位分类(续签岗位)：</td>
                    <td style="width:150px;">    
                        <input class="nui-dictcombobox" name="empCont.position" id="position" dictTypeId="AME_POSITION_MEMO"  valueFromSelect="true" required="true"   emptyText="请选择" allowInput="true"/>
                    </td>
            	</tr>
            	<tr>
                    <td style="width:100px;" align="right">合同期限(年)：</td>
                    <td style="width:150px;">    
                        <input name="empCont.conttime" id="conttime" class="nui-textbox" onblur="validate()" maxLength="5"/>
                    </td>
                    <td style="width:100px;" align="right">合同开始日期：</td>
                    <td style="width:150px;">    
                        <input class="nui-datepicker" name="empCont.contstart" id="contstart" required="true"  onvaluechanged="changecontstart"/>
                    </td>
                    <td style="width:120px;" align="right">合同结束日期：</td>
                    <td style="width:150px;">    
                        <input class="nui-datepicker" name="empCont.contend" id="contend" required="true" />
                    </td>
            		<td style="width:100px;" align="right">职位名称：</td>
                    <td style="width:150px;">    
                         <input name="empCont.positionname" id="positionname" class="nui-textbox" />
                    </td>
            	</tr>
            	<tr>
            		<td style="width:100px;" align="right" id="sm1">是否涉密(智慧涉及)：</td>
                    <td style="width:150px;" id="sm2">    
                        <input name="empCont.isSM" id="isSM" class="nui-dictcombobox" shownullItem="true" dictTypeId="MIS_YN"  onvaluechanged="changeissm"/>
                    </td>
                    <td style="width:100px;" align="right">签署公司：</td>
                    <td style="width:150px;">    
                        <input name="empCont.contcompany" id="contcompany" class="nui-dictcombobox" shownullItem="true" dictTypeId="company" onvaluechanged="changeContCompany"/>
                    </td>
            		<td style="width:100px;" align="right">签署工作地：</td>
                    <td style="width:150px;">    
                        <input class="nui-dictcombobox" name="empCont.contworkplace" id="contworkplace" dictTypeId="AREA4CLRY" />
                    </td>
            		<td align="right" style="width:80px;display: none;" id="worktype1">工时制:</td>
        			<td style="width:100px;display: none;" align="left" id="worktype2">    
            			<input name="empCont.worktype" id="worktype" class="nui-dictcombobox" dictTypeId="AME_WORKTYPE"/>
        			</td>
            	</tr>
            	<tr>
            		<td style="width:100px;" align="right" id="contempname1">签署姓名：</td>
                    <td style="width:150px;" id="contempname2">    
                        <input name="empCont.contempname" id="contempname" class="nui-textbox" />
                    </td>
            		<td style="width:100px;display: none;" align="right" id="contstatus1">合同状态：</td>
                    <td style="width:150px;display: none;" id="contstatus2">    
                        <input class="nui-dictcombobox" name="empCont.contstatus" id="contstatus" dictTypeId="EMP_CONT_STATUS" />
                    </td>
            	</tr>
                <tr>
	            	<td style="width:90px;" align="right">备注：</td>
	                <td style="width:150px;" colspan="7">    
	                    <input name="empCont.remark" id="remark" class="nui-textarea"style="width:98%;"  maxLength="255"/>
	                </td>
                </tr>
            </table>
		</fieldset>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;display: none;">
			<legend>续签确认</legend>
			<table style="table-layout:fixed;" id="table_file">
            	<tr>
            		<td style="width:110px;" align="right" id="leader1">部门意见：</td>
                    <td style="width:150px;" id="leader2">    
                        <input class="nui-dictcombobox" name="empCont.leaderAdvice" id="leaderAdvice" dictTypeId="MIS_DEPT" emptyText="请选择"  onvaluechanged="changeleader"/>
                    </td>
                    <td style="width:110px;" align="right" id="empuser1">员工意见：</td>
                    <td style="width:150px;" id="empuser2">    
                        <input class="nui-dictcombobox" name="empCont.empAdvice" id="empAdvice" dictTypeId="MIS_EMP"  emptyText="请选择"  onvaluechanged="changeEmpAdv"/>
                    </td>
                 </tr>
                 <tr id="tips" style="display: none;">
                 	<td style="width:110px;" align="left" colspan="4">
                 		<div style="width:900px;color: red;margin-left: 50px;"  id="tip"></div>
                 	</td>
                 </tr>
			</table>
		</fieldset>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;display: none;">
			<legend >合同打印</legend>
			<div style="text-align:left; margin-left:5%;">
				<span style="color:red" id="zhengshi">请于合同到期日前到就近办公室办理，或者自行打印劳动合同<strong>3</strong>份，续签意向书<strong>1</strong>份，邮寄到最上方流程操作提示的收件人处。</span><br/>
				<a class="nui-button" onclick="exportPDFContract('Primeton_IntentAgain.pdf')" id="Primeton_IntentAgain">下载续订意向书</a>
				<a class="nui-button" style="display: none;" onclick="exportPDFContract('Primeton_LaborContractAgain.pdf')" id="Primeton_LaborContractAgain">下载劳动合同</a>
				<a class="nui-button" style="display: none;" onclick="exportPDFContract('PrimetonSmart_LaborContractAgain.pdf')" id="PrimetonSmart_LaborContractAgain">下载劳动合同</a>
				<a class="nui-button" style="display: none;" onclick="exportPDFContract('PrimetonNingbo_LaborContractAgain.pdf')" id="PrimetonNingbo_LaborContractAgain">下载劳动合同</a>
				<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
					<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
					<input type="hidden" name="downloadFile" filter="false"/>
					<input type="hidden" name="fileName" filter="false"/>
				</form>	
			</div>
		</fieldset>
		<fieldset id="contProve" style="border:solid 1px #aaa;padding:3px;display: none;">
            <legend>为方便HR给您回寄盖章合同，请填写个人联系方式：</legend>
            <table style="table-layout:fixed;" id="table_file1">
            	<tr>
            		<td style="width:120px;" align="right">收件人：</td>
                    <td style="width:150px;">    
                        <input name="empCont.recipient" id="recipient" class="nui-textbox" required="true"/>
                    </td>
            		<td style="width:120px;" align="right">联系电话：</td>
                    <td style="width:150px;">    
                        <input name="empCont.telephone" id="telephone" class="nui-textbox" required="true"/>
                    </td>
            		<td style="width:115px;" align="right">收件地址：</td>
                    <td style="width:150px;" colspan="3">    
                        <input name="empCont.address" id="address" class="nui-textbox" style="width: 400px;" required="true"/>
                    </td>
            	</tr>
            </table>
		</fieldset> 
	</div>
</body>
</html>