<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-07-18 17:02:40
  - Description:
-->
<head>
<title>新增/修改人员信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body {
		margin: 0;
		padding: 0;
		width: 100%;
		height: 100%;
		overflow: hidden;
	}
</style>
</head>
<body>
	<%--民族、籍贯、户口所在省市、居住地省市、紧急联系人、与员工关系、
紧急联系人联系方式、社会工作时间、员工属性（正式员工、实习生、其他）、
职位、工作地、福利缴纳地、招聘渠道、内部推荐人、招聘经办人、
离职性质（主动离职、被动离职）、离职原因、离职去向、离职补偿、离职说明--%>
	<div class="nui-fit" id="form1">
		<div class="nui-panel" title="人员信息" style="width: 100%;">
			<fieldset style="border:solid 1px #aaa;padding:3px;">
			<input name="emp.empid" id="empid" class="nui-hidden">
			<input name="emp.orgid" id="orgid" class="nui-hidden">
				<legend >基本个人信息</legend>
				<div style="padding:5px;">
					<table style="width:100%;">
						<tr>
							<td align="right" style="width:80px;">员工工号:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.empcode" id="empcode" class="nui-textbox"  width="100%" required="true"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">姓名:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.empname" id="empname" class="nui-textbox" required="true" style="width:100%;" onblur="changeReal()"/>
	                		</td>
	                		<td align="right" style="width:80px;">昵称:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.realname" id="realname" class="nui-textbox" width="100%"/>
	                		</td>
	                		<td align="right" style="width:80px;">性别:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.gender" id="gender" class="nui-dictcombobox" dictTypeId="ABF_GENDER" width="100%" required="true" shownullItem="true"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">民族:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.nation" id="nation" class="nui-textbox"  width="100%" maxLength="20"/>
	                		</td>
							<td align="right" style="width:80px;">出生年月:</td>
	                		<td style="width:140px;">    
	                    		<input name="emp.birthdate" id="birthdate" class="nui-datepicker" showTodayButton="false" width="100%"/>
	                		</td>
	                		<td align="right" style="width:80px;">手机号码:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.mobileno" id="mobileno" class="nui-textbox"  width="100%" required="true"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">证件类型:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.cardtype" id="cardtype" class="nui-dictcombobox" shownullItem="true" dictTypeId="ABF_CARDTYPE" required="true" width="100%"/>
	                		</td>
							<td align="right" style="width:80px;">证件号码:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.cardno" id="cardno" class="nui-textbox" width="100%" onblur="changeCard()" required="true"/>
	                		</td>
	                		<td align="right" style="width:80px;">社会工作时间:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.socialstart" id="socialstart" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"/>
	                		</td>
	                	</tr>
	                	<tr>
							<td align="right" style="width:80px;">最高学历:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.highestlen" id="highestlen" shownullItem="true" class="nui-dictcombobox" dictTypeId="DEGREE"  width="100%"/>
	                		</td>
							<td align="right" style="width:80px;">入学时间:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.highestindate" id="highestindate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"/>
	                		</td>
	                		<td align="right" style="width:80px;">毕业时间:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.highestoutdate" id="highestoutdate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">学历验证:</td>
							<td style="width:140px;" align="left">    
	                    		<input name="emp.eduverify" id="eduverify" shownullItem="true" class="nui-dictcombobox" dictTypeId="EDUVERIFY"  width="100%" />
	                		</td>
							<td align="right" style="width:80px;">籍贯:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.birthplace" id="birthplace" class="nui-textbox"  width="100%"/>
	                		</td>
	                		<td align="right" style="width:80px;">户籍性质:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.resiproperty" id="resiproperty" shownullItem="true" class="nui-dictcombobox" dictTypeId="ABF_BIRTHTYPE" width="100%"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">户口所在省市:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.residende" id="residende" shownullItem="true" class="nui-dictcombobox" allowInput="true" dictTypeId="MIS_AREA" width="100%"/>
	                		</td>
							<td align="right" style="width:80px;">户口所在地址:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.resiaddress" id="resiaddress" class="nui-textbox"  width="100%"/>
	                		</td>
							<td align="right" style="width:80px;">居住地省市:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.liveplace" id="liveplace" shownullItem="true" class="nui-dictcombobox" dictTypeId="MIS_AREA" width="100%" allowInput="true"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">家庭电话:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.htel" id="htel" class="nui-textbox" width="100%"/>
	                		</td>
	                		<td align="right" style="width:80px;">家庭邮编:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.hzipcode" id="hzipcode" class="nui-textbox"  width="100%" maxLength="20"/>
	                		</td>
	                		<td align="right" style="width:80px;">家庭地址:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.haddress" id="haddress" class="nui-textbox" width="100%"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">紧急联系人:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.emergency" id="emergency" class="nui-textbox"  width="100%" maxLength="20"/>
	                		</td>
							<td align="right" style="width:80px;">与员工关系:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.emerelation" id="emerelation" shownullItem="true" class="nui-dictcombobox" dictTypeId="EMP_RELATION" width="100%"/>
	                		</td>
	                		<td align="right" style="width:80px;">联系人电话:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.emelink" id="emelink" class="nui-textbox" width="100%"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">政治面貌:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.party" id="party" class="nui-dictcombobox" shownullItem="true" dictTypeId="ABF_PARTYVISAGE" width="100%"/>
	                		</td>
							<td align="right" style="width:80px;">微信号:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.msn" id="msn" class="nui-textbox"  width="100%" maxLength="20"/>
	                		</td>
	                		<td align="right" style="width:80px;">私人邮箱:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.pemail" id="pemail" class="nui-textbox" width="100%"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">档案保管机构:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.filesaveorg" id="filesaveorg" class="nui-textbox" width="100%"/>
	                		</td>
							<td align="right" style="width:80px;">档案所在省市:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.filecity" id="filecity" shownullItem="true" class="nui-dictcombobox" dictTypeId="MIS_AREA"  width="100%" allowInput="true"/>
	                		</td>
	                		<td align="right" style="width:80px;">档案所在地址:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.fileaddress" id="fileaddress" class="nui-textbox" width="100%"/>
	                		</td>
						</tr>
						<tr>
	                		<td align="right" style="width:80px;">居住证类型:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.ishaveresi" id="ishaveresi" class="nui-dictcombobox" shownullItem="true" dictTypeId="AME_RESIDENCE" width="100%"/>
	                		</td>
	                		<td align="right" style="width:80px;">居住证办理单位:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.residealorg" id="residealorg" class="nui-textbox" width="100%"/>
	                		</td>
	                		<td align="right" style="width:80px;">居住证年限:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.resilimit" id="resilimit" class="nui-textbox" width="100%"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">居住证开始时间:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.resistartdate" id="resistartdate" class="nui-datepicker" dateFormat="yyyy-MM-dd"  width="100%" />
	                		</td>
	                		<td align="right" style="width:80px;">居住证结束时间:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.resienddate" id="resienddate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"/>
	                		</td>
	                		<td align="right" style="width:80px;">公积金帐号:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.fundno" id="fundno" class="nui-textbox" width="100%"/>
	                		</td>
						</tr>
						<tr>
	                		<td align="right" style="width:80px;">补充公积金帐号:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.addfundno" id="addfundno" class="nui-textbox"  width="100%" />
	                		</td>
	                		<td align="right" style="width:80px;">婚姻状况:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.marristatus" id="marristatus" shownullItem="true" class="nui-dictcombobox" dictTypeId="ABF_MARRITYPE" width="100%" />
	                		</td>
	                		<td align="right" style="width:80px;">未成年子女姓名:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.nonagename" id="nonagename" class="nui-textbox" width="100%"/>
	                		</td>
						</tr>
						<tr>
	                		<td align="right" style="width:80px;">未成年子女性别:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.nonagesex" id="nonagesex" class="nui-dictcombobox" dictTypeId="ABF_GENDER"  width="100%" shownullItem="true"/>
	                		</td>
	                		<td align="right" style="width:80px;">子女出生年月:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.nonagebirth" id="nonagebirth" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"/>
	                		</td>
						</tr>
					</table>
				</div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>基本公司信息</legend>
				<div style="width:100%;">
		            <table style="width:100%;">
		                <tr>
		                	<td align="right" style="font-size:12px;width:80px;">人员状态:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.empstatus" id="empstatus" class="nui-dictcombobox" shownullItem="true" dictTypeId="ABF_EMPSTATUS" width="100%" required="true"/>
	                		</td>
							<td align="right" style="font-size:12px;width:80px;">员工属性:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.emptype" id="emptype" class="nui-dictcombobox" required="true"  dictTypeId="EMP_TYPE" width="100%" />
	                		</td>
	                		<td align="right" style="width:80px;">人员性质:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.nature" id="nature" class="nui-dictcombobox" required="true" shownullItem="true" dictTypeId="AME_EMPTYPE2" width="100%"  />
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">入职日期:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.indate" id="indate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%" required="true"/>
	                		</td>
							<td align="right" style="width:80px;">司龄起算日期:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.compmstartday" id="compmstartday" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%" required="false"/>
	                		</td>
						</tr>
						<tr>
	                		<td align="right" style="width:80px;">职位分类:</td>
	            			<td style="width:140px;" align="left">    
	                			<input name="emp.positionname" id="positionname" onvaluechanged="setPositionName"class="nui-dictcombobox" shownullItem="true" allowInput="true" dictTypeId="AME_POSITION_MEMO" width="100%"  required="true"/>
	            			</td>
	            			<td align="right" style="width:80px;">职位名称:</td>
	            			<td style="width:140px;" align="left">    
	                			<input name="emp.positioncall" id="positioncall" class="nui-textbox"  required="true" width="100%"  />
	            			</td>
						    <td align="right" style="width:80px;">职位级别:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.joblevel" id="joblevel" class="nui-dictcombobox" shownullItem="true" dictTypeId="AME_TECH" width="100%"  />
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">人员成本属性:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.degree" id="degree" class="nui-dictcombobox" required="true" shownullItem="true" dictTypeId="AME_EMPTYPE2" width="100%" onvaluechanged="personType2()" />
	                		</td>
							<td align="right" style="width:80px;">直接上级:</td>
	                		<td style="width:140px;" align="left">
	                			<input name="emp.major" id="major"  width="100%" onbuttonclick="selectEmp" class="nui-buttonedit" allowInput="false" emptyText="请选择人员"  required="true"/>    
	                		</td>
						    <td align="right" style="width:80px;">导师:</td>
	                		<td style="width:140px;" align="left">
	                			<input name="emp.mentor" id="mentor"  width="100%" onbuttonclick="selectEmp" class="nui-buttonedit" allowInput="false" emptyText="请选择人员" />    
	                		</td>
						</tr>
						<tr>
	            			<td align="right" style="width:80px;">所属公司:</td>
	            			<td style="width:140px;" align="left">    
	                			<input name="emp.company" id="company" class="nui-dictcombobox" dictTypeId="company" width="100%" required="true"/>
	            			</td>
	            			<td align="right" style="width:80px;">办公地址:</td>
	            			<td style="width:140px;" align="left">    
	                			<input name="emp.oaddress" id="oaddress" class="nui-textbox" width="100%" />
	            			</td>
						    <td align="right" style="width:80px;">PCF:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.isjoinpcf" id="isjoinpcf" class="nui-dictcombobox" shownullItem="true" dictTypeId="MIS_YN" width="100%" required="true"/>
	                		</td>
						</tr>
						<tr>
	                		<td align="right" style="width:80px;">PCF金额:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.pcfamount" id="pcfamount" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" showbutton="false"  width="100%"/>
	                		</td>
	                		<td align="right" style="width:80px;">PCF开始日期:</td>
	                		<td style="width:100px;" align="left">    
	                			<input name="emp.pcfstartdate" id="pcfstartdate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%" />
	                		</td>
						    <td align="right" style="width:80px;">PCF结束日期:</td>
	                		<td style="width:100px;" align="left">    
	                			<input name="emp.pcfenddate" id="pcfenddate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%" />
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">员工是否自备电脑:</td>
	                		<td style="width:100px;" align="left">  
	                			<input name="emp.istakepc" id="istakepc" class="nui-dictcombobox" required="true" shownullItem="true" dictTypeId="MIS_YN" width="100%"/>
	                		</td>
	                		<td align="right" style="width:80px;">自备电脑开始日期:</td>
	                		<td style="width:100px;" align="left">    
	                			<input name="emp.takepcdate" id="takepcdate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"/>
	                		</td>
						    <td align="right" style="width:80px;">自备电脑结束日期:</td>
	                		<td style="width:100px;" align="left">    
	                			<input name="emp.takepcenddate" id="takepcenddate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">内部推荐人:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.innerrec" id="innerrec"  width="100%" onbuttonclick="selectEmp" class="nui-buttonedit" allowInput="false" emptyText="请选择人员" />
	                		</td>
							<td align="right" style="width:80px;">招聘经办人:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.recruitoper" id="recruitoper" width="100%" onbuttonclick="selectEmp" class="nui-buttonedit" allowInput="false" emptyText="请选择人员" />
	                		</td>
						    <td align="right" style="width:80px;">招聘渠道:</td>
	            			<td style="width:140px;" align="left">    
	                			<input name="emp.recruitsour" id="recruitsour" class="nui-dictcombobox" shownullItem="true" dictTypeId="RECRUIT_WAY" width="100%" />
	            			</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">办公电话:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.otel" id="otel" class="nui-textbox"  width="100%" maxLength="20"/>
	                		</td>
							<td align="right" style="width:80px;">办公邮编:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.ozipcode" id="ozipcode" class="nui-textbox"  width="100%"/>
	                		</td>
						    <td align="right" style="width:80px;">办公邮箱:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.oemail" id="oemail" class="nui-textbox" width="100%"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">开户行名称:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.bankname" id="bankname" class="nui-textbox"  width="100%" maxLength="20"/>
	                		</td>
							<td align="right" style="width:80px;">开户行帐号:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.bankacct" id="bankacct" class="nui-textbox"  width="100%"/>
	                		</td>
						    <td align="right" style="width:80px;">传真号码:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.faxno" id="faxno" class="nui-textbox"  width="100%"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">工作地:</td>
	            			<td style="width:140px;" align="left">    
	                			<input name="emp.workplace" id="workplace" class="nui-dictcombobox" shownullItem="true" allowInput="true" dictTypeId="AREA4CLRY" width="100%"  required="true"/>
	            			</td>
							<td align="right" style="width:80px;">工作描述:</td>
	                		<td align="left" colspan="3">    
	                    		<input name="emp.workexp" id="workexp" class="nui-textbox"  style="width:100%"/>
	                		</td>
						</tr>
						<tr>
	            			<td align="right" style="width:80px;">福利缴纳地:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.welfareplace" id="welfareplace" class="nui-dictcombobox" shownullItem="true"  allowInput="true" dictTypeId="AREA4CLRY" width="100%"/>
	                		</td>
	                		<td align="right" style="width:80px;">备注:</td>
	                		<td  align="left" colspan="3">    
	                    		<input name="emp.remark" id="remark" class="nui-textbox" style="width:100%"/>
	                		</td>
						</tr>
						<tr>
	            			<td align="right" style="width:80px;">员工标签:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.tag" id="tag" class="nui-dictcombobox" shownullItem="true"  allowInput="false" dictTypeId="EMP_TAG" multiSelect="true" width="100%"/>
	                		</td>
						</tr>
		            </table>           
			    </div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;" id="leave">
				<legend>离职信息</legend>
				<div style="width:100%;">
		            <table style="width:100%;">
		                <tr>
		                	<td align="right" style="width:80px;">离职日期:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.outdate" id="outdate" class="nui-datepicker" onvaluechanged="changeOutDate" dateFormat="yyyy-MM-dd" width="100%" onblur="changeStatus"/>
	                		</td>
							<td align="right" style="width:80px;">离职性质:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.outtype" id="outtype" class="nui-dictcombobox" shownullItem="true" dictTypeId="OUT_TYPE" width="100%"  onvaluechanged="changeReason"/>
	                		</td>
	                		<td align="right" style="width:80px;">离职原因:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.outreason" id="outreason" valueField="dictid" textField="dictname" class="nui-combobox" shownullItem="true"  width="100%" />
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">离职去向:</td>
	                		<td colspan="3" align="left">    
	                    		<input name="emp.outto" id="outto" class="nui-textbox" width="100%" maxLength="20"/>
	                		</td>
	                		<td align="right" style="width:80px;">离职补偿:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.outmakeup" id="outmakeup" class="nui-textbox" width="100%"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">离职说明:</td>
	                		<td colspan="5" align="left">    
	                    		<input name="emp.outmemo" id="outmemo" class="nui-textbox" width="100%"/>
	                		</td>
						</tr>
		            </table>           
			    </div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>操作员信息</legend>
				<div style="width:100%;">
				<input name="oOpr.operatorid" id="operatorid" class="nui-hidden">
		            <table style="width:100%;">
		                <tr>
							<td align="right" style="width:80px;">用户登录名:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="oOpr.userid" id="userid" class="nui-textbox" width="100%" maxLength="20" readonly="readonly" required="true"/>
	                		</td>
	                		<td align="right" style="width:80px;">用户密码:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="oOpr.password" id="password" class="nui-password"width="100%" required="true" readonly="readonly"/>
	                		</td>
							<td align="right" style="width:80px;">操作员状态:</td>
	                		<td style="width:140px;" align="left" >    
	                    		<input name="oOpr.status" id="status" shownullItem="true" dictTypeId="ABF_OPERSTATUS" class="nui-dictcombobox" width="100%"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;"  id="role1">员工角色:</td>
	                		<td style="width:140px;" align="left" id="role2">    
	                    		<input name="emp.role" id="role" dictTypeId="AME_ROLE" class="nui-dictcombobox" multiSelect="true"  style="width:100%;" required="true"/>
	                		</td>
	                		<td align="right" style="width:80px;">可管理机构:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.orgidlist" id="orgidlist" class="nui-textboxlist" searchField="orgname" style="width:100%"
	        						url="org.gocom.abframe.org.party.PartyManager.getMangerOrgs.biz.ext" value="" text="" 
	        						textField="orgname" valueField="orgid" dataField = "orgs"/>
	                		</td>
	                		<td align="right" style="width:80px;">可授权角色:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.specialty" id="specialty"  class="nui-combobox"  shownullItem="true" 
								url="org.gocom.abframe.org.party.PartyManager.getAuthRole.biz.ext" filterType="like" multiSelect="true"
								textField="rolename" valueField="roleid" dataField="roles" valueFromSelect="true" allowInput="true" width="100%" />
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">认证模式:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="oOpr.authmode" id="authmode" shownullItem="true" dictTypeId="ABF_AUTHMODE" class="nui-dictcombobox" required="true" value="local" width="100%"/>
	                		</td>
	                		<td align="right" style="width:80px;">菜单风格:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="oOpr.menutype" id="menutype" dictTypeId="ABF_SKINLAYOUT" shownullItem="true" class="nui-dictcombobox" required="true" value="default"  width="100%" />
	                		</td>
							<td align="right" style="width:80px;">密码失效日:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="oOpr.invaldate" id="invaldate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%" />
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">生效日期:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="oOpr.startdate" id="startdate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"/>
	                		</td>
							<td align="right" style="width:80px;">失效日期:</td>
	                		<td style="width:140px;" align="left" >    
	                    		<input name="oOpr.enddate" id="enddate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"/>
	                		</td>
						</tr>
		            </table>           
			    </div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;" id="levels">
				<legend >人员级别信息</legend>
				<div style="width:140px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-add" onclick="addRow('level')">增加</a>
			                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('level')">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
			    <!-- 人员级别信息 -->
			    <div id="level" class="nui-datagrid" style="width:100%;height:auto;" 
		            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
		             allowSortColumn="true" allowCellWrap="true">			            
		            <div property="columns">
		            	<div type="checkcolumn" width="20px"></div>
		            	<input field="empeducid" class="nui-hidden" visible="false">
		            	<input field="percostid" class="nui-hidden" visible="false">
		            	<div field="startdate" width="80" headerAlign="center"  align="left" dateFormat="yyyy-MM-dd" renderer="dealdate">有效开始日期
		                	<input property="editor" class="nui-datepicker" dateFormat="yyyy-MM-dd"/>
		                </div>
		                <div field="enddate" width="80" headerAlign="center" align="left" dateFormat="yyyy-MM-dd" renderer="dealdate">有效截止日期
		                	<input property="editor" class="nui-datepicker" dateFormat="yyyy-MM-dd"/>
		                </div>
		            	<div field="degree" displayField="degreename" width="80" headerAlign="center"  align="left" allowSort="true" >人员级别
		                	<input property="editor" id = "degrees" class="nui-combobox" shownullItem="true" data="degreeData" valueField="degree" textField="degreename" pinyinField="percostid" onclick="valueChangeDegree" onvaluechanged="changedegree"/>
		                </div>
		                <div field="isworkrate" width="80" headerAlign="center" align="left" allowCellWrap="true" renderer="getIsworkrate">是否统计工时率
		                	<input property="editor" class="nui-dictcombobox" shownullItem="true" dictTypeId="MIS_YN"/>
		                </div>
		                <div field="currentstate" width="80" headerAlign="center" align="left" allowCellWrap="true" renderer="getCurrentstate">有效状态
		                	<input property="editor" class="nui-dictcombobox" shownullItem="true" dictTypeId="ABF_STATUS"/>
		                </div>
		            </div>
		        </div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend >人员专项费用额度</legend>
				<div style="width:140px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" id="addSpeQuo" iconCls="icon-add" onclick="addRow('speQuo')">增加</a>
			                        <a class="nui-button" id="editSpeQuo" iconCls="icon-remove" onclick="removeRow('speQuo')">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
			    <!-- 人员专项额度新增 -->
			    <div id="speQuo" class="nui-datagrid" dataField="speQuo" style="width:100%;height: auto"  
						showPager="false" allowAlternating="true" allowCellSelect="true" allowCellEdit="true" oncellmousedown="oncellmousedown"
						>
					<div property="columns">
						<!-- <div type="checkcolumn"></div> -->
						<div field="year" width="60px" align="center"  headerAlign="center" >年
							<input property="editor" class="nui-textbox"/>
						</div>
						<div field="month" width="60px" align="center" renderer="setMonth"  headerAlign="center">起始月
							<input property="editor" class="nui-textbox"/>
						</div>
						<div field="quotype" width="100px" align="center"  renderer="quoType" headerAlign="center">费用类型
							<input property="editor" class="nui-dictcombobox" dictTypeId="AME_SPEQUOTYPE"/>
						</div>
						<div field="feetype" width="100px" align="center"  renderer="feetype" headerAlign="center">费用类型
							<input property="editor" class="nui-dictcombobox" dictTypeId="AME_SPEFEETYPE"/>
						</div>
						<div field="stdquota" width="100px" align="center"  headerAlign="center">额度
							<input property="editor" class="nui-textbox"/>
						</div>
					</div>
				</div>
				<!-- 人员专项额度修改 -->
				<div id="upSpeQuo" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" frozenStartColumn="0" frozenEndColumn="3"
	   					url="org.gocom.abframe.org.organization.newOrgEmp.querySpeQuoInfo.biz.ext" dataField="speQuo" showPager="false" multiSelect="true">
				    <div property="columns">
				        <div field="userid" width="0" headerAlign="center" align="center"></div>
				        <div field="empname" width="0" headerAlign="center" align="center">员工</div>  
				        <div field="year" width="80" headerAlign="center" align="center">年份</div>  
				        <div field="quotype" width="110" headerAlign="center" renderer="quoType"align="center">专项费用类型</div> 
				       	<div field="quota1" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">一月</div>
				        <div field="quota2" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">二月</div>
				        <div field="quota3" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">三月</div>
		                <div field="quota4" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">四月</div>
		                <div field="quota5" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">五月</div>
		                <div field="quota6" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">六月</div>
		                <div field="quota7" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">七月</div>
		                <div field="quota8" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">八月</div>
		                <div field="quota9" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">九月</div>
		                <div field="quota10" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">十月</div>
		                <div field="quota11" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">十一月</div>
		                <div field="quota12" width="60" headerAlign="center" currencyUnit="￥" align="center" renderer="getDetail1">十二月</div>
				    </div>
				</div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend >学历信息</legend>
				<div style="width:140px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-add" onclick="addRow('Education')">增加</a>
			                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('Education')">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
			    <!-- 学历、毕业学校、专业、学校属性 -->
			    <div id="Education" class="nui-datagrid" style="width:100%;height:auto;" dataField="edus"
		            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
		            url="org.gocom.abframe.org.employee.Education.getEducationByName.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
		            <div property="columns">
		            	<div type="checkcolumn" width="20px"></div>
		            	<input field="empeducid" class="nui-hidden" visible="false">
		            	<div field="startdate" width="30" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" renderer="dealdate">开始日期
		                	<input property="editor" class="nui-datepicker" dateFormat="yyyy-MM-dd" style="width: 200px"  />
		                </div>
		                <div field="enddate" width="30" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" renderer="dealdate">截止时间
		                	<input property="editor" class="nui-datepicker" dateFormat="yyyy-MM-dd" style="width: 200px"/>
		                </div>
		            	<div field="degree" width="55" headerAlign="center"  align="center" allowSort="true" renderer="getDegree">学历
		                	<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="DEGREE" />
		                </div>
		                <div field="graduschool" width="70" headerAlign="center"  align="left">毕业学校
		                	<input property="editor" class="nui-textbox"  inputStyle="text-align: left"/>
		                </div>
		                <div field="profession" width="85" headerAlign="center" align="left">专业
		                	<input property="editor" class="nui-textbox"  inputStyle="text-align:left" maxLength="255"/>
		                </div>
		            </div>
		        </div>
			</fieldset>
			
			<fieldset style="border: solid 1px #aaa; padding: 3px;" id = "workinfo">
				<legend>工作经历</legend>	
				 <div id="grid_workDetail" class="nui-datagrid" style="width: 100%; height: auto;" dataField="workExp" allowCellSelect="true" 
					  showPager="false" allowCellEdit="true" multiSelect="true" editNextOnEnterKey="true" allowSortColumn="true" allowCellWrap="true"
					  url="com.primeton.eos.ame_resume.resumeManage.getWorkExp.biz.ext">
						<div property="columns">
							<div field="startdate" width="30" align="center" headerAlign="center" dateFormat="yyyy-MM">开始时间 </div>
							<div field="enddate" width="30" align="center" headerAlign="center" dateFormat="yyyy-MM">终止时间 </div>
							<div field="companyname" width="55" align="left" headerAlign="center">工作单位</div>
							<div field="duty" width="70" align="left"  headerAlign="center">职务 </div>
							<div field="workdescription" width="85" align="left" headerAlign="center">主要职责 </div>
					</div>
				</div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend >合同信息 </legend>
				<div style="width:200px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-add" onclick="addContract">增加</a>
			                        <a class="nui-button" iconCls="icon-edit" onclick="updateContract()">修改</a>
			                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('Contract')">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
			    <!-- 合同属性（劳动合同、实习协议、其他协议）、合同性质（固定期限合同、无固定期限合同）、合同期限、合同开始日期、合同结束日期、职位；允许上传附件； -->
			    <div id="Contract" class="nui-datagrid" style="width:100%;height:auto;" dataField="cons"
		            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
		            url="org.gocom.abframe.org.employee.EmpContract.getEmpContractByName.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
		            <div property="columns">
		            	<div type="checkcolumn" width="30px"></div>
		            	<input field="empcontid" class="nui-hidden" visible="false">
		            	<div field="conttype" width="80" headerAlign="center" align="center"allowSort="true" renderer="getConttype">合同属性
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="CONT_TYPE" shownullItem="true"/>
		                </div>
		                <div field="contprop" width="100" headerAlign="center" align="center"renderer="getContprop">合同性质
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="CONT_PROP" shownullItem="true"/>
		                </div>
		                <div field="conttime" width="70" headerAlign="center" align="left">合同期限(年)
		                	<input property="editor" onblur="validate()" class="nui-textbox"  inputStyle="text-align: left" />
		                </div>
		                <div field="contstart" width="80" headerAlign="center" align="left" renderer="dealdate">合同开始日期
		                	<input property="editor" class="nui-datepicker" dateFormat="yyyy-MM-dd" style="width: 200px" />
		                </div>
		                <div field="contend" width="80" headerAlign="center" align="left" renderer="dealdate">合同结束日期
		                	<input property="editor" class="nui-datepicker" dateFormat="yyyy-MM-dd" style="width: 200px" />
		                </div>
		                <div field="position" width="80" headerAlign="center" align="center" renderer="getPosition">职位分类
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_POSITION_MEMO" style="width: 200px" />
		                </div>
		                <div field="positionname" width="80" headerAlign="center"  align="left">职位名称
		                	<input property="editor" class="nui-textbox" inputStyle="text-align: left" maxLength="255"/>
		                </div>
				        <div field="contuserid"  width="60" headerAlign="center"  align="center" allowSort="true" >签署工号
				        	<input property="editor" class="nui-textbox" inputStyle="text-align: left" />
				        </div>
				        <div field="contcompany"  width="60" headerAlign="center"  align="center" renderer="company" allowSort="true" >签署公司
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="company" style="width: 200px" />
		                </div>
				        <div field="contworkplace"  width="60" headerAlign="center"  align="center" renderer="workplace" allowSort="true" >工作地
				        	<input property="editor" class="nui-dictcombobox" dictTypeId="AREA4CLRY" style="width: 200px" />
				        </div>
				        <div field="contstatus"  width="100" headerAlign="center"  align="center" renderer="contstatus" allowSort="true" >合同签署状态
				        	<input property="editor" class="nui-dictcombobox" dictTypeId="EMP_CONT_STATUS" style="width: 200px" />
				        </div>
		                <div field="agentname" width="80"  headerAlign="center" align="center" displayField="agentname">经办人
		                	<input property="editor" onbuttonclick="selectEmp3" class="nui-buttonedit" allowInput="false" emptyText="请选择人员" />
		                </div>
		                <div field="remark" width="80" headerAlign="center"  align="left">备注
		                	<input property="editor" class="nui-textbox" inputStyle="text-align: left" maxLength="255"/>
		                </div>
		                <div field="files" renderer="onFileRenderer" width="100" hight="100"  align="left" headerAlign="center">附件</div>
		                <div field="fileid" displayField="filename" width="200" headerAlign="center" align="left" visible="false">附件
		                	<input property="editor" class="nui-hidden" style="width: 200px" minWidth="200" minHeight="80" />
		                </div>
	            	</div>
	        	</div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>转正信息</legend>
				<div style="width:200px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-add" onclick="addVerify()">增加</a>
			                        <a class="nui-button" iconCls="icon-edit" onclick="updateVerify()">修改</a>
			                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('Verify')">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
			    <!-- 包含字段：试用期期限、试用期开始日期、试用期结束日期、转正结果、转正日期、转正评价、转正评价人；允许上传附件； -->
			    <div id="Verify" class="nui-datagrid" style="width:100%;height:auto;" dataField="vers"
		            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
		            url="org.gocom.abframe.org.employee.Verify.getVerifyByName.biz.ext" allowCellWrap="true" >			            
		            <div property="columns">
		            	<div type="checkcolumn" width="30px"></div>
		            	<input field="empveriid" class="nui-hidden" visible="false">
		                <div field="veritime" width="90" headerAlign="center" align="left">试用期期限(月)
		                	<input property="editor" class="nui-textbox"  onvaluechanged="changeVeritime" inputStyle="text-align: left" multiSelect="false" id = "veritime" onblur="validate1()"/>
		                </div>
		                <div field="veristart" width="90" headerAlign="center" dateFormat="yyyy-MM-dd"  renderer="dealdate" align="left">试用期开始日期
		                	<input property="editor" class="nui-datepicker" inputStyle="text-align: left" />
		                </div>
		                <div field="veriend" width="90" headerAlign="center" dateFormat="yyyy-MM-dd"  align="left" renderer="dealdate">试用期结束日期
		                	<input property="editor" class="nui-datepicker" inputStyle="text-align: left"  onvaluechanged="changeVeritime2" id ="Veriend"/>
		                </div>
		                <div field="veriresult" width="80" headerAlign="center"  align="left" renderer="getVeriresult">转正结果
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="VERI_RESULT" shownullItem="true"/>
		                </div>
		                <div field="shoulddate" width="80" headerAlign="center" dateFormat="yyyy-MM-dd"  align="left" renderer="dealdate">应转正日期
		                	<input property="editor" class="nui-datepicker"  inputStyle="text-align: left"/>
		                </div>
		                <div field="realdate" width="80" headerAlign="center" dateFormat="yyyy-MM-dd"  align="left" renderer="dealdate">实际转正日期
		                	<input property="editor" class="nui-datepicker"  inputStyle="text-align: left"/>
		                </div>
		                <div field="verijudge" width="80" headerAlign="center"  align="left">转正评价
		                	<input property="editor" class="nui-textbox" inputStyle="text-align: left" maxLength="255"/>
		                </div>
		                <div field="verijudgorname" width="80" headerAlign="center"  align="left" displayField="verijudgorname">转正评价人
		                	<input property="editor" onbuttonclick="selectEmp1" class="nui-buttonedit" allowInput="false" emptyText="请选择人员" />
		                </div>
		                <div field="agentname" width="80" headerAlign="center" align="left" displayField="agentname" >经办人
		                	<input property="editor" onbuttonclick="selectEmp2" class="nui-buttonedit" allowInput="false" emptyText="请选择人员" />
		                </div>
		                <div field="remark" width="80" headerAlign="center"  align="left">转正备注
		                	<input property="editor" class="nui-textbox" inputStyle="text-align: left" maxLength="255"/>
		                </div>
		                <div field="files" renderer="onFileRenderer" width="170" hight="100"  align="left" headerAlign="center">附件</div>
		                <div field="fileid" displayField="filename" width="170" headerAlign="center" align="left" visible="false">附件
		                	<input property="editor" class="nui-hidden" style="width: 170px" minWidth="170" minHeight="80" />
		                </div>
	            	</div>
	        	</div>
		    </fieldset>
		    
		    <fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend >调动信息</legend>
				<div style="width:140px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-add" onclick="addRow('OrgChange')">增加</a>
			                        <a class="nui-button" iconCls="icon-remove" onclick="removeRow('OrgChange')">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
			    <!--包含字段：调动日期、调出部门、调出职位、调入部门、调入职位 -->
			    <div id="OrgChange" class="nui-datagrid" style="width:100%;height:auto;" dataField="changes"
		            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
		            url="org.gocom.abframe.org.employee.EmpOrgChange.getEmpOrgChange.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
		            <div property="columns">
		            	<div type="checkcolumn" width="20px"></div>
		            	<input field="emporgid" class="nui-hidden" visible="false">
		            	<div field="changedate" width="80" headerAlign="center" dateFormat="yyyy-MM-dd" renderer="dealdate" align="left">调动日期
		                	<input property="editor" class="nui-datepicker"  inputStyle="text-align: left"/>
		                </div>
		                <div field="outorgid" width="120" headerAlign="center"  align="left" displayField="outorgname">调出部门
		                	<input property="editor"  inputStyle="text-align: left" class="nui-combobox" 
								required="true" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" filterType="like" 
								textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" />
		                </div>
		                <div field="outposi" width="80" headerAlign="center" align="left" renderer="getPosition">调出职位分类
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_POSITION_MEMO"  inputStyle="text-align: left"/>
		                </div>
		                <div field="outpositionname" width="80" headerAlign="center"  align="left">调出职位名称
		                	<input property="editor" class="nui-textbox" inputStyle="text-align: left" maxLength="255"/>
		                </div>
		                 <div field="outplace" width="80" headerAlign="center" align="left" renderer="getPlace">调出工作地
		                	<input property="editor"  class="nui-dictcombobox" shownullItem="true" dictTypeId="AREA4CLRY"/>
		                </div>
		                <div field="inorgid" width="120" headerAlign="center" align="left" allowCellWrap="true" displayField="inorgname">调入部门
		                	<input property="editor"  inputStyle="text-align: left" class="nui-combobox" 
								required="true" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" filterType="like" 
								textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" />
		                </div>
		                <div field="inposi" width="80" headerAlign="center" align="left" allowCellWrap="true" renderer="getPosition">调入职位分类
		                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_POSITION_MEMO" inputStyle="text-align: left"/>
		                </div>
		                <div field="inpositionname" width="80" headerAlign="center"  align="left">调入职位名称
		                	<input property="editor" class="nui-textbox" inputStyle="text-align: left" maxLength="255"/>
		                </div>
		                 <div field="inplace" width="80" headerAlign="center" align="left" renderer="getPlace">调入工作地
		                	<input property="editor"  class="nui-dictcombobox" shownullItem="true" dictTypeId="AREA4CLRY"/>
		                </div>
		                <div field="manager" width="80" headerAlign="center" align="left" displayField="managername">直属上级
		                	<input property="editor" onbuttonclick="selectEmp4" class="nui-buttonedit" allowInput="false" emptyText="请选择人员"/>
		                </div>
		            </div>
		        </div>
			</fieldset>
		</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="saveEmp" iconCls="icon-ok" style="width: 60px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" id="closeResume" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");
	var verify = nui.get("Verify");
	var contract = nui.get("Contract");
	var orgChange = nui.get("OrgChange");
	var education = nui.get("Education");
	var grid_workDetail = nui.get("grid_workDetail");//人员工作信息
	var speQuo = nui.get("speQuo");
	var upSpeQuo = nui.get("upSpeQuo");
	var level = nui.get("level");
	var action = "";
	var personType = "";
	var tiaoshu=0;
	var tiaoshu1=0;
	//var orgid = '<b:write property="emp/orgid"/>';
	//var empid = '<b:write property="emp/empid"/>';
	var orgid = '<%=request.getParameter("orgid") %>';
	var empid = '<%=request.getParameter("empid") %>';
	var status = '<%=request.getParameter("status") %>';
	var major = '<%=request.getParameter("major") %>';
	nui.get("orgid").setValue(orgid);  
	nui.get("cardtype").setValue("id");
	nui.get("empstatus").setValue("on");
	nui.get("status").setValue("running");
	if(empid ==""||empid==null){
		nui.get("role").setValue("employee");
		nui.get("role").setText("员工");
		nui.get("userid").setReadOnly(false);
		/* majorname1(); */
		upSpeQuo.hide();
		document.getElementById("leave").style.display="none";//不显示 
		document.getElementById("workinfo").style.display="none";//不显示 
	}else if(empid !=""&&empid !=null){
		speQuo.hide();
		SetData(empid);
	}
	//新增员工 增加通讯费的额度
	var grid = nui.get("speQuo");
	var date = new Date();
	var year = date.getFullYear();
	var month =date.getMonth()+1;
	var newRow = [{year:year,month:month,quotype: "2" }];
	grid.addRows(newRow);
	
	function personType2(){
		<%--var grid = nui.get("speQuo");
		grid.clearRows();//清除所有行--%>
	 	personType = nui.get("degree").getValue();
		if(personType==2||personType==3){
			document.getElementById("levels").style.display="block";//显示
		}else{
			document.getElementById("levels").style.display="none";//不显示 
		}
		
		<%--var date = new Date();
		var year = date.getFullYear();
		var month =date.getMonth()+1;
		if(personType == 1 || personType ==2){
			var newRow = [{year:year,month:month,quotype: "1" },{year:year,month:month,quotype: "2" }];
        	grid.addRows(newRow);
		}else{
			var newRow = [{year:year,month:month,quotype: "1" }];
        	grid.addRows(newRow);
		}--%>
	}
	
	function changeReal(){
		var empname = nui.get("empname").getValue();
		nui.get("realname").setValue(empname);
	}
	function changeOutDate(e){
		if(e.value){
			nui.get("outtype").setRequired(true);
		}
	}
	
	function SetData(data){
		nui.get("addSpeQuo").disable();
		nui.get("editSpeQuo").disable();
		var empid = data;
    	var json = nui.encode({"empid":empid});
    	nui.ajax({
    		url: "org.gocom.abframe.org.organization.newOrgEmp.queryMyEmp.biz.ext",
    		data: json,
    		type: 'POST',
			cache: false,
			contentType: 'text/json',
			success: function(text){
				form.setData(text);
				document.getElementById("role1").style.display="none";
				document.getElementById("role2").style.display="none";
				level.setData(text.emp.oEmplevels);
				var innerrecname = text.emp.innerrecname;
				var recruitopername = text.emp.recruitopername;
				var majorname = text.emp.majorname;
				var major = text.emp.major;
				var majorvalue = text.emp.major;
				var orgnames = text.emp.orgnames;
				var mentor = text.emp.mentor;
				var mentorname = text.emp.mentorname;
				nui.get("innerrec").setText(innerrecname);
				nui.get("recruitoper").setText(recruitopername);
				nui.get("major").setValue(major);
				nui.get("major").setText(majorname);
				nui.get("orgidlist").setText(orgnames);
				nui.get("mentor").setText(mentorname);
				nui.get("mentor").setValue(mentor);
	            verify.load({ empid: empid});
	            contract.load({ empid: empid});
	            orgChange.load({ empid: empid});
	            education.load({ empid: empid});
	            //获取当前的年份
	            if(typeof(text.oOpr.userid) != "undefined"){
	            	upSpeQuo.load({userid: text.oOpr.userid});
	            }
	            /* if(majorname ==""|| majorname==null ){
					majorname1();
				}else{
				    nui.get("major").setText(majorname);
				} */
	            nui.get("password").readOnly = true;
	            personType2();
	            changeReason();
	            if(text.resume.resumeid != null && text.resume.resumeid != ''){
	            	grid_workDetail.load({resumeid:text.resume.resumeid});
		            grid_workDetail.sortBy("startdate", "desc");
	            }
			},
			error: function(jqXHR, textStatus, errorThrown){
			}
    	});
	}
	
	/* function majorname1(){
		if(orgid == null || orgid == ""){
			nui.get("major").setData(null);
		}else{
			var json = nui.encode({"orgid":orgid,"empid":empid});
			nui.ajax({
        		url: "org.gocom.abframe.org.organization.newOrgEmp.querymajorname.biz.ext",
        		data: json,
        		type: 'POST',
    			cache: false,
    			contentType: 'text/json',
    			success: function(text){
    			    org = text.org;
    			    nui.get("major").setValue(org[0].userid);
    				nui.get("major").setText(org[0].majorname);
    				console.log(nui.get("major").getValue());
    			},
    			error: function(jqXHR, textStatus, errorThrown){
    			}
        	});
		}
	         
	} */
	function changeReason(){
		var outtype = nui.get("outtype").getValue();
		if(outtype == null || outtype == ""){
			nui.get("outreason").setData(null);
		}else{
			var json = nui.encode({"dictid":outtype});
			nui.ajax({
        		url: "org.gocom.abframe.org.employee.EmpManager.changeOutReason.biz.ext",
        		data: json,
        		type: 'POST',
    			cache: false,
    			contentType: 'text/json',
    			success: function(text){
    				nui.get("outreason").setData(text.data);
    			},
    			error: function(jqXHR, textStatus, errorThrown){
    			}
        	});
		}
	}
	
	function getPlace(e){
		return nui.getDictText('AREA4CLRY',e.value);
	}
	function getConttype(e){
		return nui.getDictText('CONT_TYPE',e.value);
	}
	function getContprop(e){
		return nui.getDictText('CONT_PROP',e.value);
	}
	function getVeriresult(e){
		return nui.getDictText('VERI_RESULT',e.value);
	}
	function getDegree(e){
		return nui.getDictText('DEGREE',e.value);
	}
	
	function getSchooltype(e){
		return nui.getDictText('SCHOOL_TYPE',e.value);
	}
	function getCurrentstate(e){
		return nui.getDictText('ABF_STATUS',e.value);
	}
	function getIsworkrate(e){
		return nui.getDictText('MIS_YN',e.value);
	}
	//职位类型
	function getPosition(e){
		return nui.getDictText('AME_POSITION_MEMO',e.value);
	}
	
    //所属公司
	function company(e){
		return nui.getDictText('company',e.value);
	}
	//工作地
	function workplace(e){
		return nui.getDictText('AREA4CLRY',e.value);
	}
	//合同状态
	function contstatus(e){
		return nui.getDictText('EMP_CONT_STATUS',e.value);
	}
	
	function changeCard(){
		var cardno = nui.get("cardno").getValue();
		if(cardno.length<6){
			alert("证件号码必须大于等于6位");
		}else{
			if(empid == null || empid == ""){
				var password = cardno.substring(cardno.length-6,cardno.length);
				nui.get("password").setValue(password);
				var cardtype = nui.get("cardtype").getValue();
				if(cardtype=="id"){
					var birthdate = nui.get("birthdate").getValue();
					if(birthdate==""){
						var day = cardno.substring(cardno.length-12,cardno.length-8) + "-" + cardno.substring(cardno.length-8,cardno.length-6) + "-" + cardno.substring(cardno.length-6,cardno.length-4);
						nui.get("birthdate").setValue(day);
					}
				}
			}else{
				var cardtype = nui.get("cardtype").getValue();
				if(cardtype=="id"){
					var birthdate = nui.get("birthdate").getValue();
					if(birthdate==""){
						var day = cardno.substring(cardno.length-12,cardno.length-8) + "-" + cardno.substring(cardno.length-8,cardno.length-6) + "-" + cardno.substring(cardno.length-6,cardno.length-4);
						nui.get("birthdate").setValue(day);
					}
				}
			}
		}
	}
	
	function validate(){  
	     var reg = new RegExp("^[0-9]*[1-9][0-9]*$");  
	     var obj = nui.get("conttime").getValue();
	     if(!reg.test(obj)){  
	     	alert("请输入数字!");
	     	nui.get("conttime").setValue("");    
	     }  
     }
	
	function checkMessage(){
		var oemail = nui.get("oemail").getValue();
		var json = nui.encode({"oemail":oemail});
		nui.ajax({
			url: "org.gocom.abframe.org.organization.newOrgEmp.checkMail.biz.ext",
			data: json,
			type: 'POST',
			cache: false,
			contentType: 'text/json',
			success: function(text){
				if(text.result==1){
					return false;
    			}else{
    				return true;
    			}
			},
			error: function(jqXHR, textStatus, errorThrown){
				CloseWindow();
			}
		});
	}
	
	function onOk(){
		var addURL = "org.gocom.abframe.org.organization.newOrgEmp.addEmpOrg.biz.ext";
		var updateURL = "org.gocom.abframe.org.organization.newOrgEmp.updateEmpOrg.biz.ext";
		var saveURL = "";
		var userid = nui.get("userid").getValue();
		var indate = nui.get("indate").getValue();
		var mobileno = nui.get("mobileno").getValue();
		var cardno = nui.get("cardno").getValue();
		var cardtype = nui.get("cardtype").getValue();
		var gender = nui.get("gender").getValue();
		var empname = nui.get("empname").getValue();
		var empcode = nui.get("empcode").getValue();
		var degree = nui.get("degree").getValue();
		var oemail = nui.get("oemail").getValue();
		var company = nui.get("company").getValue();
		
		
		
		if(empcode==""||empcode==null){
			nui.alert("员工工号不能为空！");
			return;
		}
		if(empname==""||empname==null){
			nui.alert("人员姓名不能为空！");
			return;
		}
		if(gender==""||gender==null){
			nui.alert("性别不能为空！");
			return;
		}
		if(cardtype==""||cardtype==null){
			nui.alert("证件类型不能为空！");
			return;
		}
		if(cardno==""||cardno==null){
			nui.alert("证件号码不能为空！");
			return;
		}
		if(mobileno==""||mobileno==null){
			nui.alert("手机号不能为空！");
			return;
		}
		if(indate==""||indate==null){
			nui.alert("入职日期不能为空！");
			return;
		}
		if(userid==""||userid==null){
			nui.alert("用户登录名不能为空！");
			return;
		}
		if(company==""||company==null){
			nui.alert("所属公司不能为空！");
			return;
		}
		
		var a =[];
		var data = form.getData();
		var verify = nui.get("Verify").getData();
		if(nui.encode(verify)==nui.encode(a)){
			verify = nui.get("Verify").getChanges();
		}
		var contract = nui.get("Contract").getData();
		if(nui.encode(contract)==nui.encode(a)){
			contract = nui.get("Contract").getChanges();
		}
		var orgChange = nui.get("OrgChange").getData();
		if(nui.encode(orgChange)==nui.encode(a)){
			orgChange = nui.get("OrgChange").getChanges();
		}
		var education = nui.get("Education").getData();
		if(nui.encode(education)==nui.encode(a)){
			education = nui.get("Education").getChanges();
		}
		var level = nui.get("level").getData();
		if(nui.encode(level)==nui.encode(a)){
			level = nui.get("level").getChanges();
		}
		data.emp.oEmplevels = level;
		var empid = nui.get("empid").getValue();
		if(data.oOpr == null||data.oOpr == ""){
			
		}else{
			data.oOpr.hasopr='y';
		}
		if(empid==null||empid==""){
			var speQuoList = speQuo.getData();
			if(speQuoList.length>0){
				for(var i = 0 ;i < speQuoList.length;i++){
					if(speQuoList[i].year == null || speQuoList[i].year ==""){
						nui.alert("请填写人员专项额度年份！");
						//nuiShowTips("");
			        	return;
					}else if(speQuoList[i].month == null || speQuoList[i].month ==""){
						nui.alert("请填写人员专项额起始月份！");
						//nuiShowTips("起始月");	
			        	return;
					}else if(speQuoList[i].quotype == null || speQuoList[i].quotype ==""){
						nui.alert("请选择人员专项额额度类型");
						//nuiShowTips("额度类型");
			        	return;
					}else if(speQuoList[i].feetype == null || speQuoList[i].feetype ==""){
			        	nui.alert("请选择人员专项额专项报销类型");
			        	//nuiShowTips("标准额度");	
			        	return;
					}else if(speQuoList[i].stdquota == null || speQuoList[i].stdquota ==""){
						if(speQuoList[i].feetype == "1"){
				        	nui.alert("请填写人员专项额标准额度");
				        	//nuiShowTips("标准额度");	
				        	return;
						}
					}
				}
				for(var i = 0; i < speQuoList.length ;i++){
					speQuoList[i].userid = userid;
				}
			}else{
				speQuoList = null;
			}
			form.validate();
			if(form.isValid()){
				if(degree == "" || degree == null){
					nui.alert("人员类型不能为空！");
					return;
				}
				judge1();
				if(tiaoshu==1){
					nui.alert("员工工号重复，请确认后再进行保存！");
					return;
				}
				judge2();
				if(tiaoshu1==1){
					nui.alert("用户登录名重复，请确认后再进行保存！");
					return;
				}
				if(checkMessage()){
					nui.alert("人员邮箱重复，请确认后再进行保存！");
					return;
				}
				
				nui.confirm("确认新增人员信息吗？","保存提示",function(action){
					if(action == "ok"){
						saveURL = addURL;
			    		var json = nui.encode({"emp":data.emp,"oOpr":data.oOpr,"role":data.role, "verify":verify, "contract":contract, "education":education,"orgChange":orgChange,"speQuoList":speQuoList});
		    			nui.get("saveEmp").disable();
			    		nui.ajax({
			    			url: saveURL,
			    			data: json,
			    			type: 'POST',
			    			cache: false,
			    			contentType: 'text/json',
			    			success: function(text){
			    				nui.get("saveEmp").enable();
			    				if(text.returnVal==1){
		    						if(text.wxresult){
				                    	nui.alert("增加成功，但微信企业号人员未能成功同步，错误原因："+text.wxresult);
				                    }else{
						                nui.alert('增加成功！');  //保存成功 
				                    }
				                    if(text.dxresult != 0){
				                    	nui.alert("员工短信发送失败，请检查手机号码是否填写正确！");
				                    }
				    				CloseWindow("save");
				    			}else if(text.returnVal==2){
				    				nui.alert("增加基本信息失败，请重新尝试！");
				    			}else{
				    				nui.alert("增加失败，请重新尝试！");
				    			}
			    			},
			    			error: function(jqXHR, textStatus, errorThrown){
			    				CloseWindow();
			    			}
			    		});
					}
				});
				/* if(confirm("确认新增人员信息吗？")){
				
				}else{
					return;
				} */
			}else{
				nui.alert("请完善必填项信息！");
			}
		}else{
			if(oemail == "" || oemail ==null){
				nui.alert("办公邮件不能为空！");
				return;
			}
			if(checkMessage()){
				nui.alert("人员邮箱重复，请确认后再进行保存！");
				return;
			}
			form.validate();
			if(form.isValid()){
				nui.confirm("确认修改人员信息吗？","修改提示",function(action){
					if(action == "ok"){
						var speQuoList = null;
						saveURL = updateURL;
			    		var json = nui.encode({"emp":data.emp,"oOpr":data.oOpr,"verify":verify, "contract":contract, "education":education,"orgChange":orgChange,"speQuoList":speQuoList});
		    			nui.get("saveEmp").disable();
			    		nui.ajax({
			    			url: saveURL,
			    			data: json,
			    			type: 'POST',
			    			cache: false,
			    			contentType: 'text/json',
			    			success: function(text){
			    				nui.get("saveEmp").enable();
			    				if(text.returnVal==1){
			    					if(text.wxresult){
			    						nui.alert("修改成功,但人员微信企业号未能成功同步,错误原因："+text.wxresult);
			    					}else{
			    						nui.alert("修改成功！");
			    					}
			    					if(status!="tree"){
			    						CloseWindow("save");
			    					}
				    			}else if(text.returnVal==2){
				    				nui.alert("修改基本信息失败，请重新尝试！");
				    			}else{
				    				nui.alert("修改失败，请重新尝试！");
				    			}
			    			},
			    			error: function(jqXHR, textStatus, errorThrown){
			    				if(status != "tree"){
			    					CloseWindow();
			    				}
			    			}
			    		});
					}
				});
			}else{
				nui.alert("请完善必填项信息！");
			}
		}
	}
	
	function onCancel(e) {
    	var data = form.getData();
    	if(data){
        	nui.showMessageBox({
	            title: "关闭提示",
	            iconCls: "nui-messagebox-question",
	            buttons: ["yes", "no"],
	            message: "是否关闭？",
	            callback: function (action) {
	                if(action=="yes"){
	                	if(status != 'tree'){
	                		CloseWindow("cancel");
	                	}
	                }
	            }
	        });
		}else{
			if(status != 'tree'){
				CloseWindow("cancel");
			}
		}
    }
	
	function CloseWindow(action){
		if (action == "close" && form.isChanged()){
			if (confirm("数据被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	function addRow(gridid){
		var newRow = { name: "New Row",status: "0" };
        var grid = nui.get(gridid);
        grid.addRow(newRow, 0);
	}
	
	function removeRow(gridid){
		var grid = nui.get(gridid);
        var rows = grid.getSelecteds();
        var num = rows.length;
        if (rows.length > 0) {
        	if(confirm("确定删除"+num+"条记录吗？")){
        		grid.removeRows(rows, false);
        	}else{
        		return false;
        	}
        }else{
			alert("请选择一条记录！"); 
        }
	}
	
	function addContract(){
		nui.open({
			url: "<%=request.getContextPath() %>/abframe/org/newOrganization/addContract.jsp",
            title: "增加合同详情",
            width: 700,
            height: 450,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = {"action": "add"};
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {//.
                    	var conttype =data.conttype;
		            	var contprop = data.contprop;
		            	var conttime = data.conttime;
		            	var position = data.position;
		            	var positionname = data.positionname;
		            	var contstart = data.contstart;
		            	var contend = data.contend;
		            	var agent = data.agent;
		            	var agentname = data.agentname;
		            	var contuserid = data.contuserid;
		            	var contcompany = data.contcompany;
		            	var contworkplace = data.contworkplace;
		            	var contstatus = data.contstatus;
		            	var remark = data.remark;
                    	if(contstart!='null' && contstart!=null && contstart!=""){
                    		contstart = FormatDate(contstart);
                    	}
                    	var contend = data.contend;
                    	if(contend!='null' && contend!=null && contend!=""){
                    		contend = FormatDate(contend);
                    	}
                    	var fileid = data.fileid;
                    	if(fileid == null ||fileid==""||fileid=='null'){
                    		var newRow = { name: "New Row",
							conttype: conttype,
							contprop: contprop,
							conttime: conttime,
							position: position,
							positionname: positionname,
							contstart: contstart,
							contend: contend,
							agent: agent,
							agentname: agentname,
							contuserid: contuserid,
							contcompany: contcompany,
							contworkplace: contworkplace,
							contstatus: contstatus,
							remark:  remark,
							fileid:  fileid
							};
							var grid = nui.get('Contract');
							grid.addRow(newRow);
                    	}else{
                    		var json = nui.encode({"fileid":fileid});
                        	nui.ajax({
				    			url: "com.primeton.eos.ame_resume.resumeManage.queryUploadFiles.biz.ext",
				    			data: json,
				    			type: 'POST',
				    			cache: false,
				    			contentType: 'text/json',
				    			success: function(o){
				    				var files = o.files;
				    				var newRow = { name: "New Row",
									conttype: conttype,
									contprop: contprop,
									conttime: conttime,
									position: position,
									positionname: positionname,
									contstart: contstart,
									contend: contend,
									agent: agent,
									agentname: agentname,
									contuserid: contuserid,
									contcompany: contcompany,
									contworkplace: contworkplace,
									contstatus: contstatus,
									remark:  remark,
									fileid:  fileid,
									files:  files
									};
									var grid = nui.get('Contract');
									grid.addRow(newRow);
				    			}
				    		});
                    	}
                    }
                }
            }
		});
	}
	
	function addVerify(){
		var indate =nui.get("indate").getValue();
		nui.open({
			url: "<%=request.getContextPath() %>/abframe/org/newOrganization/addVerify.jsp",
            title: "增加转正详情",
            width: 700,
            height: 450,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = {"action": "add","indate":indate};
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {//.
                    	var veritime = data.veritime;
				    	var veristart = data.veristart;
				    	var veriend = data.veriend;
				    	var veriresult = data.veriresult;
				    	var shoulddate = data.shoulddate;
				    	var realdate = data.realdate; 
				    	var verijudge = data.verijudge;
				    	var verijudgor = data.verijudgor;
				    	var verijudgorname = data.verijudgorname;
				    	var agent = data.agent;
				    	var agentname = data.agentname;
                    	if(veristart!='null' && veristart!=null && veristart!=""){
                    		veristart = FormatDate(veristart);
                    	}
                    	if(veriend!='null' && veriend!=null && veriend!=""){
                    		veriend = FormatDate(veriend);
                    	}
                        if(shoulddate!='null' && shoulddate!=null && shoulddate!=""){
                    		shoulddate = FormatDate(shoulddate);
                    	}
                    	if(realdate!='null' && realdate!=null && realdate!=""){
                    		realdate = FormatDate(realdate);
                    	} 
                    	var fileid = data.fileid;
                    	if(fileid == null ||fileid==""||fileid=='null'){
                    		var newRow = { name: "New Row",
							veritime: veritime,
							veristart: veristart,
							veriend: veriend,
							veriresult: veriresult,
							shoulddate: shoulddate,
							realdate: realdate,
							verijudge: verijudge,
							verijudgor: verijudgor,
							verijudgorname: verijudgorname,
							agent: agent,
							agentname: agentname,
							fileid:  fileid
							};
							var grid = nui.get('Verify');
							grid.addRow(newRow);
                    	}else{
                    		var json = nui.encode({"fileid":fileid});
                        	nui.ajax({
				    			url: "com.primeton.eos.ame_resume.resumeManage.queryUploadFiles.biz.ext",
				    			data: json,
				    			type: 'POST',
				    			cache: false,
				    			contentType: 'text/json',
				    			success: function(o){
				    				var files = o.files;
				    				var newRow = { name: "New Row",
									veritime: veritime,
									veristart: veristart,
									veriend: veriend,
									veriresult: veriresult,
								  	shoulddate: shoulddate,
							        realdate: realdate,
									verijudge: verijudge,
									verijudgor: verijudgor,
									verijudgorname: verijudgorname,
									agent: agent,
									agentname: agentname,
									fileid:  fileid,
									files:  files
									};
									var grid = nui.get('Verify');
									grid.addRow(newRow);
				    			}
				    		});
                    	}
                    }
                }
            }
		});
	}
	
	function onCertTypeRenderer(e){
		return nui.getDictText('AME_CERTTYPE',e.value);//设置业务字典值
	}
	
	function selectOmEmployee(){
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择员工",
                width: 430,
                height: 400,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                        	var empname = data.empname == null ? "" : data.empname;
                            nui.get("empname").setValue(empname);
                            var userid = data.userid == null ? "" : data.userid;
                            nui.get("userid").setValue(userid);
                            nui.get("userid").disable();
                            var gender = data.gender == null ? "" : data.gender;
                            nui.get("gender").setValue(gender);
                            var birthdate = data.birthdate == null ? "" : data.birthdate;
                            nui.get("birthdate").setValue(birthdate);
                            var cardno = data.cardno == null ? "" : data.cardno;
                            nui.get("cardno").setValue(cardno);
                            var degree = data.degree == null ? "" : data.degree;
                            nui.get("education").setValue(degree);
                            var indate = data.indate == null ? "" : data.indate;
                            nui.get("indate").setValue(indate);
                            var orgname = data.orgname == null ? "" : data.orgname;
                            nui.get("orgname").setValue(orgname);
                            var oemail = data.oemail == null ? "" : data.oemail;
                            nui.get("email").setValue(data.oemail);
                            var mobileno = data.mobileno == null ? "" : data.mobileno;
                            nui.get("tel").setValue(mobileno);
                            var tag = data.tag == null ? "" : data.tag;
                            nui.get("tag").setValue(tag);
                        }
                    }

                }
            });
        }
        
	    function onFileRenderer(e) {
	        var tempSrc = "";
        	//长度为1，不换行
        	if(e.record.files==null){
        		return;
        	}
        	if(e.record.files.length == 1){
	        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[0].fileId + "'>" + e.record.files[0].fileName + "</a>";
        	}else{
		        for(var i=0;i<e.record.files.length;i++){
		        	//长度大于1小于长度length换行
		        	if(i< e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>&nbsp;&nbsp;";
		        	}
		        	//最后一个不换行
	        		if(i == e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>";
		        	}
		        }
        	}
	       	return tempSrc;
	     }
		function dealdate(e){
			if(e.value){
				return e.value.substring(0,10);
			}
		}
		
		function FormatDate(strTime) { 
		    var date = new Date(strTime); 
		    var year = date.getFullYear();
		    var month = date.getMonth()+1;
		    var day = date.getDate();
		    if(month<10){
		    	month = "0"+month;
		    }
		    if(day<10){
		    	day = "0"+day;
		    }
		    return year+"-"+month+"-"+day; 
		}
		
		function updateContract(){
			var rows = contract.getSelecteds();
			if (rows.length > 1){
        		alert("只能选中一条记录进行编辑！");
        	}else{
	            var row = contract.getSelected();
	            if(row){
	            	var fileid = row.fileid;
	            	var files = row.files;
	            	var conttype = row.conttype;
	            	var contprop = row.contprop;
	            	var conttime = row.conttime;
	            	var position = row.position;
	            	var contstart = row.contstart;
	            	var contend = row.contend;
	            	var agent = row.agent;
	            	var agentname = row.agentname;
	            	nui.open({
						url: "<%=request.getContextPath() %>/abframe/org/newOrganization/addContract.jsp?",
	                title: "增加合同详情",
	                width: 700,
	                height: 450,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = {"action": "edit","o":row};
	                    iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
	                    if (action == "ok") {
	                        var iframe = this.getIFrameEl();
	                        var data = iframe.contentWindow.GetData();
	                        data = nui.clone(data);    //必须
	                        if (data) {//.
	                        	var conttype = data.conttype;
				            	var contprop = data.contprop;
				            	var conttime = data.conttime;
				            	var position = data.position;
				            	var positionname = data.positionname;
				            	var contstart = data.contstart;
				            	var contend = data.contend;
				            	var agent = data.agent;
				            	var agentname = data.agentname;
				            	var contuserid = data.contuserid;
				            	var contcompany = data.contcompany;
				            	var contworkplace = data.contworkplace;
				            	var contstatus = data.contstatus;
				            	var remark = data.remark;
	                        	if(contstart!='null' && contstart!=null && contstart!=""){
	                        		contstart = FormatDate(contstart);
	                        	}
	                        	if(contend!='null' && contend!=null && contend!=""){
	                        		contend = FormatDate(contend);
	                        	}
	                        	var fileid = data.fileid;
	                        	if(fileid == null ||fileid==""||fileid=='null'){
	                        		var json = nui.encode({});
	                        		nui.ajax({
						    			url: "com.primeton.eos.ame_resume.resumeManage.queryUploadFiles.biz.ext",
						    			data: json,
						    			type: 'POST',
						    			cache: false,
						    			contentType: 'text/json',
						    			success: function(o){
						    				var files = o.files;
						    				var updateRow = {
											conttype: conttype,
											contprop: contprop,
											conttime: conttime,
											position: position,
											positionname: positionname,
											contstart: contstart,
											contend: contend,
											agent: agent,
											agentname: agentname,
											contuserid: contuserid,
											contcompany: contcompany,
											contworkplace: contworkplace,
											contstatus: contstatus,
											remark:  remark,
											fileid:  fileid,
											files:  files
											};
											var grid = nui.get('Contract');
											grid.updateRow(row,updateRow);
						    			}
						    		});
	                        	}else{
	                        		var json = nui.encode({"fileid":fileid});
		                        	nui.ajax({
						    			url: "com.primeton.eos.ame_resume.resumeManage.queryUploadFiles.biz.ext",
						    			data: json,
						    			type: 'POST',
						    			cache: false,
						    			contentType: 'text/json',
						    			success: function(o){
						    				var files = o.files;
						    				var updateRow = {
											conttype: conttype,
											contprop: contprop,
											conttime: conttime,
											position: position,
											positionname: positionname,
											contstart: contstart,
											contend: contend,
											agent: agent,
											agentname: agentname,
											contuserid: contuserid,
											contcompany: contcompany,
											contworkplace: contworkplace,
											contstatus: contstatus,
											remark:  remark,
											fileid:  fileid,
											files:  files
											};
											var grid = nui.get('Contract');
											grid.updateRow(row,updateRow);
						    			}
						    		});
	                        	}
	                        }
	                    }
	                }
				});
            }else{
                alert("请选中一条记录！");
            }
        }
	}
	
	function updateVerify(){
		var rows = verify.getSelecteds();
		if (rows.length > 1){
    		alert("只能选中一条记录进行编辑！");
    	}else{
            var row = verify.getSelected();
            if(row){
            	var fileid = row.fileid;
            	var files = row.files;
            	var veritime = row.veritime;
            	var veristart = row.veristart;
            	var veriend = row.veriend;
            	var veriresult = row.veriresult;
            	var shoulddate = row.shoulddate;
            	var realdate = row.realdate; 
            	var verijudge = row.verijudge;
            	var verijudgor = row.verijudgor;
            	var verijudgorname = row.verijudgorname;
            	var agent = row.agent;
            	var agentname = row.agentname;
            	nui.open({
					url: "<%=request.getContextPath() %>/abframe/org/newOrganization/addVerify.jsp?",
	                title: "增加转正详情",
	                width: 700,
	                height: 450,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = {"action": "edit","o":{"fileid":fileid,"files":files,"veritime":veritime,"veristart":veristart,"veriend":veriend,"shoulddate":shoulddate,"realdate":realdate,"veriresult":veriresult,"verijudge":verijudge,"verijudgor":verijudgor,"verijudgorname":verijudgorname,"agent":agent,"agentname":agentname}};
	                    iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
	                    if (action == "ok") {
	                        var iframe = this.getIFrameEl();
	                        var data = iframe.contentWindow.GetData();
	                        data = nui.clone(data);    //必须
	                        if (data) {//.
	                        	var veritime = data.veritime;
						    	var veristart = data.veristart;
						    	var veriend = data.veriend;
						    	var veriresult = data.veriresult;
						    	var shoulddate = data.shoulddate;
						    	var realdate = data.realdate; 
						    	var verijudge = data.verijudge;
						    	var verijudgor = data.verijudgor;
						    	var verijudgorname = data.verijudgorname;
						    	var agent = data.agent;
						    	var agentname = data.agentname;
		                    	if(veristart!='null' && veristart!=null && veristart!=""){
		                    		veristart = FormatDate(veristart);
		                    	}
		                    	if(veriend!='null' && veriend!=null && veriend!=""){
		                    		veriend = FormatDate(veriend);
		                    	}
		                    	if(shoulddate!='null' && shoulddate!=null && shoulddate!=""){
		                    		shoulddate = FormatDate(shoulddate);
		                    	}
		                    	if(realdate!='null' && realdate!=null && realdate!=""){
		                    		realdate = FormatDate(realdate);
		                    	}
	                        	var  fileid = data.fileid;
	                        	if(fileid == null ||fileid==""||fileid=='null'){
	                        		var json = nui.encode({});
	                        		nui.ajax({
						    			url: "com.primeton.eos.ame_resume.resumeManage.queryUploadFiles.biz.ext",
						    			data: json,
						    			type: 'POST',
						    			cache: false,
						    			contentType: 'text/json',
						    			success: function(o){
						    				var files = o.files;
						    				var updateRow = {
											veritime: veritime,
											veristart: veristart,
											veriend: veriend,
											veriresult: veriresult,
										    shoulddate: shoulddate,
											realdate: realdate, 
											verijudge: verijudge,
											verijudgor: verijudgor,
											verijudgorname: verijudgorname,
											agent: agent,
											agentname: agentname,
											fileid:  fileid,
											files:  files
											};
											var grid = nui.get('Verify');
											grid.updateRow(row,updateRow);
						    			}
						    		});
	                        	}else{
	                        		var json = nui.encode({"fileid":fileid});
		                        	nui.ajax({
						    			url: "com.primeton.eos.ame_resume.resumeManage.queryUploadFiles.biz.ext",
						    			data: json,
						    			type: 'POST',
						    			cache: false,
						    			contentType: 'text/json',
						    			success: function(o){
						    				var files = o.files;
						    				var updateRow = {
											veritime: veritime,
											veristart: veristart,
											veriend: veriend,
											veriresult: veriresult,
											shoulddate:shoulddate,
											realdate:realdate,
											verijudge: verijudge,
											verijudgor: verijudgor,
											verijudgorname: verijudgorname,
											agent: agent,
											agentname: agentname,
											fileid:  fileid,
											files:  files
											};
											debugger;
											var grid = nui.get('Verify');
											grid.updateRow(row,updateRow);
						    			}
						    		});
	                        	}
	                        }
	                    }
	                }
				});
            }else{
                alert("请选中一条记录！");
            }
        }
	}
	
	function selectEmp(){
		var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择人员",
                width: 430,
                height: 400,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.userid);
                            btnEdit.setText(data.empname);
                        }
                    }

                }
            });
		}
		
		function selectEmp1(){
			var btnEdit = this;
	        nui.open({
	            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择人员",
                width: 430,
                height: 400,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.userid);
                            btnEdit.setText(data.empname);
                            var Verify = nui.get("Verify");
                            var row = Verify.getSelected();
                            var updateRow = {
                            verijudgor : data.userid,
                            verijudgorname : data.empname
                            };
                            Verify.updateRow(row,updateRow);
                        }
                    }

                }
            });
		}
		
		function selectEmp2(){
			var btnEdit = this;
	        nui.open({
	            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择人员",
                width: 430,
                height: 400,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.userid);
                            btnEdit.setText(data.empname);
                            var Verify = nui.get("Verify");
                            var row = Verify.getSelected();
                            var updateRow = {
                            agent : data.userid,
                            agentname : data.empname
                            };
                            Verify.updateRow(row,updateRow);
                        }
                    }

                }
            });
		}
		
		function selectEmp3(){
			var btnEdit = this;
	        nui.open({
	            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择人员",
                width: 430,
                height: 400,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.userid);
                            btnEdit.setText(data.empname);
                            var Contract = nui.get("Contract");
                            var row = Contract.getSelected();
                            var updateRow = {
                            agent : data.userid,
                            agentname : data.empname
                            };
                            Contract.updateRow(row,updateRow);
                        }
                    }

                }
            });
		}
		
		function selectEmp4(){
			var btnEdit = this;
	        nui.open({
	            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择人员",
                width: 430,
                height: 400,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.userid);
                            btnEdit.setText(data.empname);
                            var OrgChange = nui.get("OrgChange");
                            var row = OrgChange.getSelected();
                            var updateRow = {
                            manager : data.userid,
                            managername : data.empname
                            };
                            OrgChange.updateRow(row,updateRow);
                        }
                    }

                }
            });
		}
		
		function oncellmousedown(e){
	    	if(empid != null|| empid != ""){
	    		if(e.field == 'year' || e.field == 'month' || e.field == 'quotype'){
	    			if(typeof(e.row._state) == "undefined"){
		    			e.column.readOnly = true;
		    		}else{
		    			e.column.readOnly = false;
		    		}
	    			
	    		}
	    	}
	    } 
		
		//额度类型业务字典
	    function quoType(e) {
			return nui.getDictText('AME_SPEQUOTYPE',e.value);//设置业务字典值
		}
		
		//专项报销类型
		function feetype(e){
			return nui.getDictText('AME_SPEFEETYPE',e.value);//设置业务字典值
		}
		
		var degreeData = [];
		function valueChangeDegree(e){
        	var datas = level.getSelected();
        	var startdate = datas.startdate;
        	var enddate = datas.enddate;
        	if(startdate == '' || startdate == null){
        		alert("选择人员级别前请选择有效开始日期！");
        		return;
        	}
        	if(enddate == '' || enddate == null){
        		alert("选择人员级别前请选择有效截至日期！");
        		return;
        	}
        	degreedate(startdate,enddate)
        }
        
        //根据人员所属部门，有效开始日期，有效结束日期取得级别下拉框
        function degreedate(startdate,enddate){
        	var json = {"manage":{"orgid":orgid,"startdate":startdate,"enddate":enddate}};
            nui.ajax({
				url:"com.primeton.rdmgr.labor.mispricebiz.getdegrees.biz.ext",
				data:json,
				type:'POST',
                async:false,
				contentType:'text/json',
				success:function(text){
					if(text.degrees.length>0){
						degreeData = nui.encode(text.degrees);
						nui.get("degrees").setData(degreeData);
					}else{
						alert("请确认勾选的有效日期区间在已存在的工时定额成本套别有效日期区间内！");
						degreeData = [];
						nui.get("degrees").setData(null);
					}
				}
			});
        }
        
        //选择级别时同时记录percostid
        function changedegree(e){
        	var row = level.getSelected();
        	var rowData = {"percostid":e.selected.percostid};
        	level.updateRow(row,rowData);
        }
        	/*
	 *   功能:实现VBScript的DateAdd功能.
	 *   参数:interval,字符串表达式，表示要添加的时间间隔.
	 *   参数:number,数值表达式，表示要添加的时间间隔的个数.
	 *   参数:date,时间对象.
	 *   返回:新的时间对象.
	 *   var now = new Date();
	 *   var newDate = DateAdd( "d", 5, now);
	 *---------------   DateAdd(interval,number,date)   -----------------
	 */
	function DateAdd(interval, number, date) {
	    switch (interval) {
	    case "y": {
	        date.setFullYear(date.getFullYear() + number);
	        return date;
	        break;
	    }
	    case "q": {
	        date.setMonth(date.getMonth() + number * 3);
	        return date;
	        break;
	    }
	    case "m": {
	        date.setMonth(date.getMonth() + number);
	        return date;
	        break;
	    }
	    case "w": {
	        date.setDate(date.getDate() + number * 7);
	        return date;
	        break;
	    }
	    case "d": {
	        date.setDate(date.getDate() + number);
	        return date;
	        break;
	    }
	    case "h": {
	        date.setHours(date.getHours() + number);
	        return date;
	        break;
	    }
	    case "mm": {
	        date.setMinutes(date.getMinutes() + number);
	        return date;
	        break;
	    }
	    case "s": {
	        date.setSeconds(date.getSeconds() + number);
	        return date;
	        break;
	    }
	    default: {
	        date.setDate(d.getDate() + number);
	        return date;
	        break;
	    }
	    }
	}
        //转正结束日期随着试用期期限变化
        function changeVeritime(e){
            var Verify = nui.get("Verify");
	        var row = Verify.getSelected();
	        var veristartDate = nui.get("indate").getValue();
	        var date1 = new Date(veristartDate);
	        var month =parseFloat(e.value);
	        if(e.value){
	            var Veriend1 = DateAdd("m", month, date1);
	            var Veriend1 = Veriend1.toString();
				var Veriend1 = Veriend1.replace("/-/g", "/");
			    var Veriend1 = new Date(Veriend1); 
			    Date.prototype.addDay = function(num){if(!isNaN(num))this.setDate(this.getDate() + parseInt(num));return this;}//给日期原型加个方法
			    Date.prototype.subDay = function(num){if(!isNaN(num))this.setDate(this.getDate() + parseInt(num));return this;}//给日期原型加个方法
				var Veriend2 = Veriend1.subDay(-1);
				var Veriend2 = Veriend2.getFullYear() + '-' + (Veriend2.getMonth() + 1) + '-' + Veriend2.getDate();
				var date1 = date1.getFullYear() + '-' + (date1.getMonth() + 1) + '-' + date1.getDate();
				var updateRow = {
		            veriend:Veriend2,
		            shoulddate:date1,
		        };
		        Verify.updateRow(row,updateRow);
			}
		}
	    //应转正日期和实际转正日期随着转正结束日期限变化
		function changeVeritime2(e){
		    var Verify = nui.get("Verify");
	        var row = Verify.getSelected();
	        var Veriend1 = nui.get("Veriend").getValue();
	        if(e.value){
				var date1 = new Date(Veriend1);
				var shoulddate = DateAdd("d", 1, date1);
				var date1 = date1.getFullYear() + '-' + (date1.getMonth() + 1) + '-' + date1.getDate();
				var updateRow = {
				    veriend:Veriend1, 
			        shoulddate:date1,
		        };
		        Verify.updateRow(row,updateRow);
	         }
		} 
		function validate1(){  
		     var reg = new RegExp("^[0-9]*[0-9][0-9]*$");  
		     var obj = nui.get("veritime").getValue();
		     if(obj){
			     if(!reg.test(obj)){  
			     	alert("请输入数字!");
			     	nui.get("veritime").setValue("");    
			     } 
		     } 
	     }
	     function changeStatus(){
			var outdate = nui.get("outdate").getValue();
			var json = nui.encode({"outdate":outdate});
			var URL = "org.gocom.abframe.org.organization.newOrgEmp.checkOutDate.biz.ext";
			nui.ajax({
    			url: URL,
    			data: json,
    			type: 'POST',
    			cache: false,
    			contentType: 'text/json',
    			success: function(text){
    				if(text.result=='-1'){
    					nui.get("empstatus").setValue("leave");
    					nui.get("status").setValue("stop");
    					nui.get("empstatus").setReadOnly(false);
    					nui.get("status").setReadOnly(false);
	    			}else{
	    				nui.get("empstatus").setValue("on");
    					nui.get("status").setValue("running");
    					nui.get("empstatus").setReadOnly(true);
    					nui.get("status").setReadOnly(true);
	    			}
    			},
    			error: function(jqXHR, textStatus, errorThrown){
    				CloseWindow();
    			}
    		});
		}
		function setPositionName(e){
		//var recposition = e.value;
		/*var position = nui.get("positionname").getText();
		nui.get("positioncall").setValue(position); */
	} 
	//验证员工编号
		function judge1(){
		 tiaoshu=0;
		//var newvalue=e.value;
		var newvalue=nui.get("empcode").getValue()
		var json ={empcode1:newvalue}
		nui.ajax({
					url: "org.gocom.abframe.org.organization.OrgManager.judgeEmpcode.biz.ext",
					type: 'POST',
					data:json,
					cache: false,
					async: false,
					contentType: 'text/json',
		            success: function (text) {
		            	if(text.result==1){
    					}
    					else{    					
    					tiaoshu=1;
    					return;
    				}
	    					
	    			}
		
		})
		}
		//验证登入名
		function judge2(){
		 tiaoshu1=0;
		//var newvalue=e.value;
		var newvalue=nui.get("userid").getValue()
		var json ={userid1:newvalue}
		nui.ajax({
					url: "org.gocom.abframe.org.organization.OrgManager.judgeEmpUserid.biz.ext",
					type: 'POST',
					data:json,
					cache: false,
					async: false,
					contentType: 'text/json',
		            success: function (text) {
		            	if(text.result==1){
    					}
    					else{    					
    					tiaoshu1=1;
    					return;
    				}
	    					
	    			}
		
		})
		}
		
		
	</script>
</html>