<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2019-08-06 10:33:44
  - Description:
-->
<head>
<title>入职信息确认</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;o

flow:hidden;
    }
    .asLabel{border:0;background-color:#F5F5F5;cursor:default;}
</style>
</head>
<body>
<%long workItemID = (Long)request.getAttribute("workItemID"); %>
<div class="nui-fit">
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
	<form id=form_Intend method="post">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<input name="emp.empid" id="empid" class="nui-hidden">
			<input name="emp.orgid" id="orgid" class="nui-hidden">
			<input name="oOpr.userid" id="userid" class="nui-hidden">
			<input name="oOpr.operatorid" id="operatorid" class="nui-hidden">
			<input name="omIntendJoin.intendid" id="intendid"  class="nui-hidden"/>
			<input name="omIntendJoin.intendname" id="intendname"  class="nui-hidden"/>
			<input name="omIntendJoin.processinstid" id="processinstid2"  class="nui-hidden"/>
			<input name="omIntendJoin.userid" id="userid1"  class="nui-hidden"/>
			<input name="omIntendJoin.fileids" id="fileids1" class="nui-hidden"/>
			<input class="nui-hidden" id="workItemID" value="<%=workItemID %>"/>
			<input name="resume.resumeid" id="resumeid" class="nui-hidden" />
			<legend >基本个人信息</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:80px;">员工工号:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.empcode" id="empcode" class="nui-textbox"  width="100%" required="true" onblur="changeReapeatName()"/>
                		</td>
						<td align="right" style="width:80px;">姓名:<span style="color: red;display:none" id = "isNameRepeat">(重复)</span></td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.empname" id="empname" class="nui-textbox" required="true" style="width:100%;" onblur="changeReal()"/>
                		</td>
                		<td align="right" style="width:80px;">性别:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.gender" id="gender" class="nui-dictcombobox" dictTypeId="ABF_GENDER" width="100%" required="true" shownullItem="true"/>
                		</td>
					</tr>
					<tr style = "display:none;">
                		<td align="right" style="width:80px;">昵称:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.realname" id="realname" class="nui-textbox" width="100%"/>
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
						<td align="right" style="width:80px;">籍贯:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.birthplace" id="birthplace" class="nui-textbox"  width="100%"/>
                		</td>
                		<td align="right" style="width:80px;">户口所在省市:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.residende" id="residende" shownullItem="true" class="nui-dictcombobox" dictTypeId="MIS_AREA" width="100%"/>
                		</td>
                		<td align="right" style="width:80px;">居住地省市:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.liveplace" id="liveplace" shownullItem="true" class="nui-dictcombobox" dictTypeId="MIS_AREA" width="100%" />
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">证件类型:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.cardtype" id="cardtype" class="nui-dictcombobox" shownullItem="true" dictTypeId="ABF_CARDTYPE" required="true" width="100%"/>
                		</td>
						<td align="right" style="width:80px;">证件号码:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.cardno" id="cardno" class="nui-textbox" width="100%" required="true" onvaluechanged="checkcardno"/>
                		</td>
                		<td align="right" style="width:80px;">户籍性质:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.resiproperty" id="resiproperty" shownullItem="true" class="nui-dictcombobox" dictTypeId="ABF_BIRTHTYPE" width="100%"/>
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
						<td align="right" style="width:80px;">最高学历:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.highestlen" id="highestlen" class="nui-dictcombobox" required="true"  width="100%" maxLength="20" dictTypeId="DEGREE"/>
                		</td>
						<td align="right" style="width:80px;">最高学历入学:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.highestindate" id="highestindate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%" required="true"/>
                		</td>
                		<td align="right" style="width:80px;">最高学历毕业:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.highestoutdate" id="highestoutdate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%" required="true"/>
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">学历验证:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.eduverify" id="eduverify" shownullItem="true" class="nui-dictcombobox" dictTypeId="EDUVERIFY"  width="100%" />
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">档案保管机构:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.filesaveorg" id="filesaveorg" class="nui-textbox" width="100%"/>
                		</td>
						<td align="right" style="width:80px;">档案所在省市:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.filecity" id="filecity" shownullItem="true" class="nui-dictcombobox" dictTypeId="MIS_AREA"  width="100%" />
                		</td>
                		<td align="right" style="width:80px;">档案所在地址:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.fileaddress" id="fileaddress" class="nui-textbox" width="100%"/>
                		</td>
					</tr>
					<tr>
                		<td align="right" style="width:80px;">社会工作时间:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.socialstart" id="socialstart" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%" required="true"/>
                		</td>
                		<td align="right" style="width:80px;">婚姻状况:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.marristatus" id="marristatus" shownullItem="true" class="nui-dictcombobox" dictTypeId="ABF_MARRITYPE" width="100%" />
                		</td>
                		<td align="right" style="width:80px;">居住证年限:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.resilimit" id="resilimit" class="nui-textbox" width="100%"/>
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">居住证类型:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.ishaveresi" id="ishaveresi" class="nui-dictcombobox" shownullItem="true" dictTypeId="AME_RESIDENCE" width="100%"/>
                		</td>
						<td align="right" style="width:80px;">居住证开始时间:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.resistartdate" id="resistartdate" class="nui-datepicker" dateFormat="yyyy-MM-dd"  width="100%" />
                		</td>
                		<td align="right" style="width:80px;">居住证结束时间:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.resienddate" id="resienddate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"/>
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">公积金帐号:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.fundno" id="fundno" class="nui-textbox" width="100%"/>
                		</td>
                		<td align="right" style="width:80px;">补充公积金帐号:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.addfundno" id="addfundno" class="nui-textbox"  width="100%" />
                		</td>
                		<td align="right" style="width:80px;">办理单位名称:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.residealorg" id="residealorg" class="nui-textbox" width="100%"/>
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">未成年子女姓名:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.nonagename" id="nonagename" class="nui-textbox" width="100%"/>
                		</td>
                		<td align="right" style="width:80px;">未成年子女性别:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.nonagesex" id="nonagesex" class="nui-dictcombobox" dictTypeId="ABF_GENDER"  width="100%" shownullItem="true"/>
                		</td>
                		<td align="right" style="width:80px;">未成年子女出生年月:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.nonagebirth" id="nonagebirth" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"/>
                		</td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
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
                    		<input name="emp.compmstartday" id="compmstartday" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%" required="true"/>
                		</td>
                		<td align="right" style="width:80px;">人员成本属性:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.degree" id="degree" class="nui-dictcombobox" required="true" shownullItem="true" dictTypeId="AME_EMPTYPE2" width="100%" onvaluechanged="personType2()" />
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">直接主管:</td>
                		<td style="width:140px;" align="left">
                			<input name="emp.major" id="major"  width="100%" onbuttonclick="selectEmp" class="nui-buttonedit" allowInput="false" emptyText="请选择人员" />    
                		</td>
                		<td align="right" style="width:80px;">工作地:</td>
            			<td style="width:140px;" align="left">    
                			<input name="emp.workplace" id="workplace" class="nui-dictcombobox" shownullItem="true" dictTypeId="AREA4CLRY" width="100%" />
            			</td>
            			<td align="right" style="width:80px;">所属公司:</td>
            			<td style="width:140px;" align="left">    
                			<input name="emp.company" id="company" class="nui-dictcombobox" dictTypeId="company" width="100%" required="true"/>
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
                		<td align="right" style="width:80px;">办公邮件:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.oemail" id="oemail" class="nui-textbox" width="100%"/>
                		</td>
					</tr>
					<tr>
                		<td align="right" style="width:80px;">职位级别:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.joblevel" id="joblevel" class="nui-dictcombobox" shownullItem="true" dictTypeId="AME_TECH" width="100%"  />
                		</td>
						<td align="right" style="width:80px;">开户行名称:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.bankname" id="bankname" class="nui-textbox"  width="100%" maxLength="20"/>
                		</td>
						<td align="right" style="width:80px;">开户行帐号:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.bankacct" id="bankacct" class="nui-textbox"  width="100%"/>
                		</td>
					</tr>
					<tr>
                		<td align="right" style="width:80px;">传真号码:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.faxno" id="faxno" class="nui-textbox"  width="100%"/>
                		</td>
						<td align="right" style="width:80px;">办公地址:</td>
            			<td style="width:140px;" align="left">    
                			<input name="emp.oaddress" id="oaddress" class="nui-textbox" width="100%" />
            			</td>
						<td align="right" style="width:80px;">福利缴纳地:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.welfareplace" id="welfareplace" class="nui-dictcombobox" shownullItem="true" dictTypeId="AREA4CLRY" width="100%"/>
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">工时制:</td>
	        			<td style="width:100px;" align="left">    
	            			<input name="omIntendJoin.worktype" id="worktype" class="nui-dictcombobox" dictTypeId="AME_WORKTYPE" width="100%" required="true"/>
	        			</td>
                		<td align="right" style="width:80px;">PCF:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.isjoinpcf" id="isjoinpcf" class="nui-dictcombobox" shownullItem="true" dictTypeId="MIS_YN" width="100%"/>
                		</td>
						<td align="right" style="width:80px;">PCF捐款金额：</td>
						<td style="width:140px;" align="left">
							<input name="emp.pcfamount" id ='pcfamount' class="nui-spinner" format="n2" width="100%" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right;"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">职位分类:</td>
            			<td style="width:140px;" align="left">    
                			<input name="emp.positionname" id="positionname" class="nui-dictcombobox" width="100%" shownullItem="true" allowInput="true" dictTypeId="AME_POSITION_MEMO" onvaluechanged="setPositionName"/>
            			</td>
            			<td align="right" style="width:80px;">职位名称：</td>
                		<td style="width:140px;" align="left">  
                    		<input name="emp.positioncall" id="positioncall" class="nui-textbox"   width="100%" />
                		</td>
						<td align="right" style="width:80px;">工作描述:</td>
                		<td align="left" >    
                    		<input name="emp.workexp" id="workexp" class="nui-textbox"  style="width:100%"/>
                		</td>
					</tr>
					<tr>
                		<td align="right" style="width:80px;">备注:</td>
                		<td  align="left" colspan="5">    
                    		<input name="emp.remark" id="remark" class="nui-textbox" style="width:100%"/>
                		</td>
					</tr>
	            </table> 
			</div>
		</fieldset>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>员工办公电脑信息</legend>
			<input name="emp.takepcdate" id="takepcdate" class="nui-hidden"/>
			<div style="width:100%;">
				<table style="width:94%;">
	                <tr>
	                	<td align="right" style="width:19px;">无需申请公司电脑:</td>
						<td style="width:140px;" align="left"> 
							<input class="nui-dictcombobox" name="emp.istakepc" id="istakepc" style="width:25.5%" required="true" dictTypeId="MIS_YN"/>
						</td>
	                </tr>
                </table>
            </div>
	    </fieldset>
		<fieldset id="field7" style="border:solid 1px #aaa;padding:3px;">
			<legend>试用期设定</legend>
			<input name="verify[0].empveriid" id="empveriid" class="nui-hidden"/>
			<input name="verify[0].processinstid" id="verifyprocessinstid" class="nui-hidden"/>
			<div style="width:100%;">
				<table style="width:100%;">
	                <tr>
	                	<td align="right" style="width:80px;">试用期开始时间:</td>
						<td style="width:140px;" align="left"> 
							<input class="nui-datepicker" name="verify[0].veristart" id="veristart" style="width:100%" required="true" onvaluechanged="getDateNexThirdMonth"/>
						</td>
						<td align="right" style="width:80px;">试用期期限(月):</td>
						<td style="width:140px;" align="left">
							<input name="verify[0].veritime"  id="veritime" class="nui-textbox"  onvaluechanged="getDateNexThirdMonth" required="true" style="width:100%;" onblur="validate()" inputStyle="text-align: right;"/>
						</td>
	                	<td align="right" style="width:80px;">试用期结束时间:</td>
						<td style="width:140px;" align="left"> 
							<input class="nui-datepicker" name="verify[0].veriend" id="veriend" style="width:100%" required="true"/>
						</td>
	                	<td align="right" style="width:80px;">应转正日期:</td>
						<td style="width:140px;" align="left"> 
							<input class="nui-datepicker" name="verify[0].shoulddate" id="shoulddate" style="width:100%" required="true"/>
						</td>
	                </tr>
	                <tr>
	                	<td align="right" style="width:80px;">转正状态:</td>
						<td style="width:140px;" align="left"> 
							<input class="nui-dictcombobox" name="verify[0].veriresult" id="veriresult" style="width: 100%" required="true" dictTypeId="VERI_RESULT" shownullItem="false"  multiSelect="false"/>
						</td>
                		<td align="right" style="width:80px;">转正备注:</td>
                		<td  align="left" colspan="5">    
                    		<input name="verify[0].remark" id="verifyremark" class="nui-textbox" style="width:100%"/>
                		</td>
	                </tr>
                </table>
            </div>
	    </fieldset>
	    
	    <fieldset id="field10" style="border:solid 1px #aaa;padding:3px;">
	    	<legend>年假信息设定</legend>
	    	<input name="empvar.userid" id="empvaruserid" class="nui-hidden"/>
	    	<input name="empvar.lastrest" id="empvarlastrest" class="nui-hidden"/>
	    	<input name="empvar.daysoff" id="empvardaysoff" class="nui-hidden"/>
	    	<input name="empvar.bonusvac" id="empvarbonusvac" class="nui-hidden"/>
	    	<input name="empvar.standvac" id="empvarstandvac" class="nui-hidden"/>
	    	<input name="empvar.workyears" id="empvarworkyears" class="nui-hidden"/>
	    	<input name="empvar.comyears" id="empvarcomyears" class="nui-hidden"/>
			<div style="width:100%;">
				<table style="width:100%;">
	                <tr>
	                	<td align="right" style="width:80px;">年假年份信息:</td>
	                	<td style="width:140px;" align="left"> 
	                		<input class="nui-combobox" name="empvar.year" showNullItem="false" id="empvaryear" valueField="id" textField="text" data="yearlist" style="width:100%;" required="true"/>
	                	</td>
	                	<td align="right" style="width:80px;">春节统筹休假天数:</td>
	                	<td style="width:140px;" align="left" > 
	                		<input class="nui-spinner" name="empvar.overvac" id="empvarovervac" showbutton="false" inputStyle="text-align: right;" changeOnMousewheel="false" format="n1" allowLimitValue="false" style="width:100%;" required="true"/>
	                	</td>
	                	<td style="width:80px;"></td>
	                	<td style="width:140px;"></td>
	                </tr>
                </table>
            </div>
	    </fieldset>
	    
	    <fieldset id="contProve" style="border:solid 1px #aaa;padding:3px;">
	        <legend>个人收件联系方式：</legend>
	        <table style="table-layout:fixed;" id="table_file1">
	        	<tr>
	        		<td style="width:120px;" align="right">收件人：</td>
	                <td style="width:150px;">   
	                    <input name="recept.recipient" id="recipient" class="nui-textbox"/>
	                </td>
	        		<td style="width:120px;" align="right">联系电话：</td>
	                <td style="width:150px;">    
	                    <input name="recept.telephone" id="telephone" class="nui-textbox"/>
	                </td>
	        		<td style="width:115px;" align="right">收件地址：</td>
	                <td style="width:150px;" colspan="3">    
	                    <input name="recept.address" id="address" class="nui-textbox" style="width: 400px;"/>
	                </td>
	        	</tr>
	        </table>
		</fieldset>
	    
	    <fieldset style="border:solid 1px #aaa;padding:3px;"  id="bank">
	    	<legend >银行卡号</legend>
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		        <table style="width:100%;">
		        	<tr>
		                <td style="width:20%;">
		                    <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
		                    <a class="nui-button" id="updateBtn" iconCls="icon-edit" onclick="edit()">编辑</a>
		                    <a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="remove()">删除</a>
		                </td>
		            </tr>
		         </table>           
		    </div>
		    <div id="bankcount" class="nui-datagrid" dataField="omemployeeaccts" style="width:100%;height:auto;" 
	        	url="com.primeton.eos.ame_pur.settlePay.queryBankInfo.biz.ext" ondrawcell="isDefalut"
	        	showPageInfo="false" showPager="hfalse" multiSelect="false" allowSortColumn="false">
	            <div property="columns">
	                <div type="checkcolumn" width="30">请选择</div>
	                <div type="indexcolumn" width="30">序号</div>
	                <div field="empid" headerAlign="center" allowSort="true" visible="false">empid</div>
	                <div field="username" headerAlign="center" allowSort="true" >单位/个人名称</div>
	                <div field="banknamedict" headerAlign="center" allowSort="true" renderer="bankdict">银行名称</div>
	                <div field="bankacct" headerAlign="center" allowSort="true" >银行帐号</div>
	                <div field="isdefault" headerAlign="center" align="center"allowSort="true" >是否默认</div>
	            </div>
	        </div>
	    </fieldset>
		
		<fieldset style="border:solid 1px #aaa;padding:3px;"  id="levels">
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
	            	<div type="checkcolumn" width="30px"></div>
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
	            	<div type="checkcolumn" width="25px"></div>
	            	<input field="empcontid" class="nui-hidden" visible="false">
	            	<div field="conttype" width="60" headerAlign="center" align="center"allowSort="true" renderer="getConttype">合同属性
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="CONT_TYPE" shownullItem="true"/>
	                </div>
	                <div field="contprop" width="80" headerAlign="center" align="center"renderer="getContprop">合同性质
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
			        <div field="contuserid"  width="50" headerAlign="center"  align="center" allowSort="true" >签署工号
			        	<input property="editor" class="nui-textbox" inputStyle="text-align: left" />
			        </div>
			        <div field="contcompany"  width="60" headerAlign="center"  align="center" renderer="company" allowSort="true" >签署公司
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="company" style="width: 200px" />
	                </div>
			        <div field="contworkplace"  width="40" headerAlign="center"  align="center" renderer="workplace" allowSort="true" >工作地
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
	            	<div type="checkcolumn" width="20px">&nbsp;</div>
	            	<input field="empeducid" class="nui-hidden" visible="false">
	            	<div field="startdate" width="30" headerAlign="center"  align="center" dateFormat="yyyy-MM-dd" renderer="dealdate" allowSort="true">开始时间
	                	<input property="editor" class="nui-datepicker" dateFormat="yyyy-MM-dd"/>
	                </div>
	                <div field="enddate" width="30" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" renderer="dealdate" allowSort="true">截止时间
	                	<input property="editor" class="nui-datepicker" dateFormat="yyyy-MM-dd"/>
	                </div>
	            	<div field="degree" width="55" headerAlign="center"  align="center" allowSort="true" renderer="getDegree">学历
	                	<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="DEGREE" />
	                </div>
	                <div field="graduschool" width="70" headerAlign="center"  align="left">毕业学校
	                	<input property="editor" class="nui-textbox" maxLength="30"  inputStyle="text-align: left"/>
	                </div>
	                <div field="profession" width="85" headerAlign="center" align="left">专业
	                	<input property="editor" class="nui-textbox" maxLength="40" inputStyle="text-align:left"/>
	                </div>
	            </div>
	        </div>
		</fieldset>
		
		<fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>工作经历</legend>
			<div style="padding: 5px;">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;"
					id="button_inorgid1">
					<table style="width: 100%;">
						<tr>
							<td style="width: 20%;">
								<a class="nui-button" id="addbtn" iconCls="icon-add" 
								onclick="addRow('workExp')">增加</a>
								<a class="nui-button" id="deltbtn" iconCls="icon-remove"
								onclick="removeRow('workExp')">删除</a>
							</td>
						</tr>
					</table>
				</div>
				<div id="workExp" class="nui-datagrid"
					style="width: 100%; height: auto;" dataField="workExp"
					allowCellSelect="true" showPager="false" allowCellEdit="true"
					multiSelect="true" editNextOnEnterKey="true"
					allowSortColumn="true" allowCellWrap="true"
					url="com.primeton.eos.ame_resume.resumeManage.getWorkExp.biz.ext">
					<div property="columns">
						<div type="checkcolumn" width="20px">&nbsp;</div>
						<div field="startdate" width="30" align="center"
							headerAlign="center"
							dateFormat="yyyy-MM">开始时间 
							<input property="editor" class="nui-monthpicker"
								ondrawdate="checkDate" required="true"/>
						</div>
						<div field="enddate" width="30" align="center"
							headerAlign="center"
							dateFormat="yyyy-MM">终止时间 
							<input property="editor" class="nui-monthpicker"
								ondrawdate="checkDate" required="true" />
						</div>
						<div field="companyname" width="55" align="left"
							headerAlign="center">工作单位 
							<input property="editor" class="nui-textbox"
								required="true" maxLength="100" />
						</div>
						<div field="duty" width="70" align="left" 
							headerAlign="center">职务 
							<input property="editor" maxLength="200" class="nui-textbox" required="true" />
						</div>
						<div field="workdescription" width="85" align="left"
							headerAlign="center">主要职责 
							<input property="editor" class="nui-textarea" maxLength="300" style="width:200px" minWidth="200" minHeight="80" />
						</div>
					</div>
				</div>
			</div>
		</fieldset>
		
	    <fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>项目经历</legend>
			<div style="padding: 5px;">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;"
					id="button_inorgid1">
					<table style="width: 100%;">
						<tr>
							<td style="width: 20%;">
								<a class="nui-button" id="addbtn" iconCls="icon-add" 
								onclick="addRow('projExp')">增加</a>
								<a class="nui-button" id="deltbtn" iconCls="icon-remove"
								onclick="removeRow('projExp')">删除</a>
							</td>
						</tr>
					</table>
				</div>
				<div id="projExp" class="nui-datagrid"
					style="width: 100%; height: auto;" dataField="projExp"
					allowCellSelect="true" showPager="false" allowCellEdit="true"
					multiSelect="true" editNextOnEnterKey="true"
					allowSortColumn="true" allowCellWrap="true"
					url="com.primeton.eos.ame_resume.resumeManage.getProjExp.biz.ext">
					<div property="columns">
						<div type="checkcolumn" width="20px">&nbsp;</div>
						<div field="beginenddate" width="30" align="center"
							headerAlign="center"
							dateFormat="yyyy-MM">开始时间 
							<input property="editor" class="nui-monthpicker"
								ondrawdate="checkDate" required="true" />
						</div>
						<div field="enddate" width="30" align="center"
							headerAlign="center"
							dateFormat="yyyy-MM">终止时间 
							<input property="editor" class="nui-monthpicker"
								ondrawdate="checkDate" required="true" />
						</div>
		                <div field="custname" width="80" headerAlign="center" align="left">客户名称
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
		                </div>
						<div field="projectname" width="55" align="left"
							headerAlign="center">项目名称 
							<input property="editor" class="nui-textbox" maxLength="150"  required="true" />
						</div>
						<div field="projectintroduce" width="70" align="left"
							headerAlign="center">项目描述
							 <input property="editor" class="nui-textarea"  maxLength="300"  style="width: 200px" minWidth="200" minHeight="80" />
						</div>
						<div field="projectduty" width="85" align="left" 
							headerAlign="center">主要职责
						 <input property="editor" class="nui-textarea" maxLength="200" style="width: 200px" minWidth="200" minHeight="80" />
						</div>
					</div>
				</div>
			</div>
		</fieldset>
	    
	    <fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>有关证件（证书）</legend>
			<div style="width: 200px;">
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table style="width: 100%;">
						<tr>
							<td style="width: 100%;">
								<a class="nui-button" iconCls="icon-add" id="add3" onclick="addCert()">增加</a>
		                        <a class="nui-button" iconCls="icon-edit" id="add3" onclick="updateCert()">修改</a>
		                        <a class="nui-button" iconCls="icon-remove" id="delete3" onclick="removeRow('grid_cert')">删除</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="cert" class="nui-datagrid"
				style="width: 100%; height: auto;" dataField="cert"
				showPager="false" allowCellEdit="true" allowCellSelect="true"
				allowSortColumn="true" allowCellWrap="true"
				multiSelect="true" editNextOnEnterKey="true"
				url="com.primeton.eos.ame_resume.resumeManage.getCert.biz.ext">
				<div property="columns">
					<div type="checkcolumn" width="20px"></div>
					<div field="cardtype" width="60" headerAlign="center"
						align="left" renderer="onCertTypeRenderer">
						证件（证书）类型 <input property="editor" class="nui-dictcombobox"
							dictTypeId="AME_CERTTYPE" inputStyle="text-align: left" />
					</div>
					<div field="cardno" width="80" headerAlign="center" align="left">
						证件号码 <input property="editor" class="nui-textbox" vtype="float"
							inputStyle="text-align: left" maxLength="32" />
					</div>
					<div field="startdate" width="60" headerAlign="center"
						dateFormat="yyyy-MM-dd" renderer="onDealDate" align="center">
						有效开始日期 <input property="editor" class="nui-datepicker"
							inputStyle="text-align: left" dateFormat="yyyy-MM-dd" />
					</div>
					<div field="enddate" width="60" headerAlign="center"
						dateFormat="yyyy-MM-dd" renderer="onDealDateS" align="center">
						有效截止日期 <input property="editor" class="nui-datepicker"
							inputStyle="text-align: left" dateFormat="yyyy-MM-dd" />
					</div>
					<div field="files" renderer="onFileRenderer" width="200" hight="100"  align="center" headerAlign="center">附件</div>
	                <div field="fileid" displayField="filename" width="200" headerAlign="center" align="left" visible="false">附件
	                	<input property="editor" class="nui-hidden" style="width: 200px" minWidth="200" minHeight="80" />
	                </div>
					<div field="remark" width="150" headerAlign="center" align="left">
						备注 <input property="editor" class="nui-textarea"
							style="width: 200px" minWidth="200" maxLength="240"  minHeight="80" />
					</div>
				</div>
			</div>
		</fieldset>
	</form>
	
	<fieldset id="field9" style="border:solid 1px #aaa;padding:3px;">
		<legend >劳动合同文本确认</legend>
		<div style="text-align:center;">
			<a class="nui-button"onclick="exportPDFContract('InternshipAgreement.pdf')" id="InternshipAgreement">实习协议</a>
			<a class="nui-button"onclick="exportPDFContract('Primeton_LaborContract.pdf')" id="Primeton_LaborContract">普元劳动合同下载</a>
			<a class="nui-button"onclick="exportPDFContract('PrimetonSmart_LaborContract.pdf')" id="PrimetonSmart_LaborContract">普元智慧数据劳动合同下载</a>
			<a class="nui-button"onclick="exportPDFContract('PrimetonNingbo_LaborContract.pdf')" id="PrimetonNingbo_LaborContract">宁波普元劳动合同下载</a>
			<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
				<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
				<input type="hidden" name="downloadFile" filter="false"/>
				<input type="hidden" name="fileName" filter="false"/>
			</form>	
		</div>
		<div style="text-align:center;">
			<a class="nui-button"onclick="exportPDFContract('LetterOfAppoint.pdf')" id="LetterOfAppoint" >打印员工录用告知书</a>
		</div>
	</fieldset>
	
	<fieldset id="field11" style="border:solid 1px #aaa;padding:3px;">
		<legend >试用期打印表</legend>
		<div style="text-align:center;">
			<a class="nui-button" onclick="print()" id="print" >打印试用期目标</a>
		</div>
	</fieldset>
	
	<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		<legend>入职附件（招聘上传）</legend>
		<jsp:include page="/ame_common/detailFile.jsp"/>
		<jsp:include page="/ame_common/addFiles1.jsp"/>
	</fieldset>
	<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend>入职附件（新员工上传）</legend>
		<jsp:include page="/ame_common/detailFile2.jsp"/>
	</fieldset>
    <!-- 审核意见  -->
	<jsp:include page="/ame_common/checkList.jsp"/>
	<fieldset id="field8" style="border:solid 1px #aaa;padding:3px;">
		<div style="width:100%;">
            <table style="width:100%;">
	            <tr align="left">
				    <td style="width:120px;" align="right" colspan="2">请确认是否需要员工再补充资料：</td>
					<td style="width:140px;" colspan="4">
						<input class="nui-radiobuttonlist" name="isByNewEmpconfirm" id="isByNewEmpconfirm" repeatItems="2" repeatLayout="table" repeatDirection="Horizontal" textField="text" valueField="id" required="true" style="width:200px;" data="[{'id': '1','text': '是'},{'id': '0','text': '否'}]">
					</td>
				</tr>
			</table>
		</div>
	</fieldset>
	<jsp:include page="/ame_common/misOpinion.jsp"/>
	<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
		<legend>处理意见附件</legend>
		<jsp:include page="/ame_common/addFiles.jsp"/>
	</fieldset>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width:60px;margin-right:20px;" id="appButton">提交</a>
	<a class="nui-button" iconCls="icon-save" onclick="temsave()" style="margin-right:20px;"  id="saveButton">暂时保存</a>
	<a class="nui-button"onclick="onCancel" iconCls="icon-close" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form_Intend = new nui.Form("form_Intend");
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	//拿到checklist填写的值
	var grid_checklist = nui.get("grid_checklist"); 
	//学历信息
	var education = nui.get("Education");
	//工作经历信息
	var workExp = nui.get("workExp");
	//项目经理信息
	var projExp = nui.get("projExp");
	//证书信息
	var cert = nui.get("cert");
	var level = nui.get("level");
	var bankcount = nui.get("bankcount");
	var contract = nui.get("Contract");
	var action = "";
	var personType = "";
	var orgid = "";
	var activityDefID = "";
	var empid = "";
	var expusername = "";
	
	var pdfjson = [];
	
	//动态设置财务年的值，为当前日期前两年到后两年的数组
    var nowdate = new Date();
    var year1 = nowdate.getFullYear();
	var yearlist = [{id: year1-2,text: year1-2},{id: year1-1,text: year1-1},{id: year1,text: year1},{id: year1+1,text: year1+1},{id: year1+2,text: year1+2}];
	nui.get("empvaryear").setData(yearlist);
	
	function personType2(){
	 	personType = nui.get("degree").getValue();
		if(personType==2||personType==3){
			document.getElementById("levels").style.display="block";//显示
		}else{
			document.getElementById("levels").style.display="none";//不显示 
		}
		nui.get("worktype").setValue(personType == 1 || personType == 2 || personType == 3?'2':'1');
	}
	
	function changeReal(){
		var empname = nui.get("empname").getValue();
		var userid = nui.get("userid").getValue();
		nui.get("realname").setValue(empname);
		nameRepeat(empname,userid);
	}
	function nameRepeat(name,userid){
		if(name != null && name != ''){
			var json = {"name":name,"userid":userid};
			nui.ajax({
	            url: "com.primeton.eos.ame_permanage.ame_entry.isNameRepeat.biz.ext",
	            type: 'POST',
	            data: json,
	            contentType:'text/json',
	            success: function (text) {
	                var isrepeat = text.isrepeat;
	                if(isrepeat > 0){
	                	document.getElementById("isNameRepeat").style.display="";
	                }else{
	                	document.getElementById("isNameRepeat").style.display="none";
	                }
	            }
		     }); 
		}else{
        	document.getElementById("isNameRepeat").style.display="none";
        }
	}
	function changeOutDate(e){
		if(e.value){
			nui.get("outtype").setRequired(true);
		}
	}
	
	initdate();
  	function initdate(){
  		promptInit({workItemID: <%=workItemID %>});//流程提示信息
  		//初始入职人员信息
       	nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_entry.getProcessEntry.biz.ext",
            data: {intendid:null,workItemID:<%=workItemID %>,processInstID:null},
            type: 'POST',
            cache: false,
   			async:false,
            contentType: 'text/json',
            success: function (o) {
            	if(o.omIntendJoin){
					activityDefID = o.workitem.activityDefID ;
            		o.omIntendJoin.worktype = o.omIntendJoin.worktype == null ?(o.emp.degree == 1 || o.emp.degree == 2 || o.emp.degree == 3?'2':'1'):o.omIntendJoin.worktype;
            		form_Intend.setData(o);
					empid = o.emp.empid;
					expusername = o.emp.empname;
					orgid = nui.get("orgid").getValue();
					if(o.emp.oEmplevels == null || o.emp.oEmplevels == ''){
						personType = nui.get("degree").getValue();
						if(personType==2||personType==3){
							var json = ({"criteria": 
	                                    {"_expr[0]": {"_property": "startdate","_op": "<=","_value": o.emp.indate},
	                                     "_expr[1]": {"_property": "closedate","_op": ">=","_value": o.emp.indate}}});
	               			nui.ajax({
					            url: "com.primeton.rdmgr.labor.mispricebiz.queryPercost.biz.ext",
								type: 'POST',
								data: json,	
					            async:false,
								contentType: 'text/json',
					            success: function (result) {
					            	var newRow = { startdate: o.emp.indate,enddate: result.percosts[0].closedate };
					        		level.addRow(newRow, 0);
					            }
					        });
				        }
					}else{
						level.setData(o.emp.oEmplevels);
					}
					//第一次加载数据，如果员工表中的数据为 空，则加载流程相关数据中的值作为初始值。
					var istakepc = o.emp.istakepc;
					if(!istakepc){
						nui.get("istakepc").setValue(o.emp.istakepc1);
					}
					var innerrecname = o.emp.innerrecname;
					var recruitopername = o.emp.recruitopername;
					var majorname = o.emp.majorname;
					var majorvalue = o.emp.major;
					var orgnames = o.emp.orgnames;
					nui.get("innerrec").setText(innerrecname);
					nui.get("recruitoper").setText(recruitopername);
					nui.get("major").setText(majorname);
					nui.get("major").setValue(o.emp.major);
					//转正状态
		            nui.ajax({
			            url: "org.gocom.abframe.org.employee.Verify.getVerifyByName.biz.ext",
						type: 'POST',
						data: {"empid": empid},	
			            async:false,
						contentType: 'text/json',
			            success: function (v) {
			            	if(v.vers != null && v.vers != ''){
			            		if(v.vers[0].veritime==0 && activityDefID == 'manualActivity7'){
				            		nui.get("veristart").setValue(o.omIntendJoin.probationstartdate);
				            		nui.get("veritime").setValue(o.omIntendJoin.probation);
				            		nui.get("veriend").setValue(o.omIntendJoin.probationenddate);
				            		if(o.omIntendJoin.isNeedProbation == 0){
				            			nui.get("veriresult").setValue('0');
				            		}else{
				            			nui.get("veriresult").setValue('4');
				            		}
			            		}else{
				            		nui.get("veristart").setValue(v.vers[0].veristart);
				            		nui.get("veritime").setValue(v.vers[0].veritime);
				            		nui.get("veriend").setValue(v.vers[0].veriend);
			            			nui.get("veriresult").setValue(v.vers[0].veriresult);
			            		}
			            		nui.get("empveriid").setValue(v.vers[0].empveriid);
			            		nui.get("shoulddate").setValue(v.vers[0].shoulddate);
			            		nui.get("verifyprocessinstid").setValue(v.vers[0].processinstid);
			            		nui.get("verifyremark").setValue(v.vers[0].remark);
			            	}else{
			            		nui.get("veristart").setValue(o.omIntendJoin.probationstartdate);
			            		nui.get("veritime").setValue(o.omIntendJoin.probation);
			            		nui.get("veriend").setValue(o.omIntendJoin.probationenddate);
			            		if(o.omIntendJoin.isNeedProbation == 0){
			            			nui.get("veriresult").setValue('0');
			            		}else{
			            			nui.get("veriresult").setValue('4');
			            		}
			            	}
			            }
			        });
			        //初始化应转正日期、试用期等。
					getDateNexThirdMonth();
			        //学历信息
		            education.load({ resumeid: o.resume.resumeid});
		            education.sortBy("startdate", "desc");
		            //工作经历信息
		            workExp.load({ resumeid: o.resume.resumeid});
		            workExp.sortBy("startdate", "desc");
		            //项目信息
		            projExp.load({ resumeid: o.resume.resumeid});
		            projExp.sortBy("beginenddate", "desc");
		            //证书信息
		            cert.load({ resumeid: o.resume.resumeid});
		            cert.sortBy("startdate", "desc");
	            
	            	contract.load({ empid: empid});
		            //如果试用期为0，则隐藏使用期打印表
		            var veristart =  nui.get("veristart").getValue();
		            if(veristart==0){
		            	document.getElementById("field11").style.display="none";
		            }
		            //劳动合同信息
					var emptype = o.emp.emptype;
					var company = o.omIntendJoin.company;
					if(emptype == '2'){//实习生
						document.getElementById("InternshipAgreement").style.display="none";
						document.getElementById("Primeton_LaborContract").style.display="none";
						document.getElementById("PrimetonSmart_LaborContract").style.display="none";
						document.getElementById("PrimetonNingbo_LaborContract").style.display="none";
						document.getElementById("LetterOfAppoint").style.display="none";
						document.getElementById("field9").style.display="none";
						nui.get("compmstartday").setRequired(false);
					}else{
						nui.get("compmstartday").setRequired(true);
						document.getElementById("InternshipAgreement").style.display="none";
						if(company == '2'){
							document.getElementById("Primeton_LaborContract").style.display="none";
							document.getElementById("PrimetonSmart_LaborContract").style.display="";
							document.getElementById("PrimetonNingbo_LaborContract").style.display="none";
						}else if(company == '3'){
							document.getElementById("Primeton_LaborContract").style.display="none";
							document.getElementById("PrimetonSmart_LaborContract").style.display="none";
							document.getElementById("PrimetonNingbo_LaborContract").style.display="";
						}else{
							document.getElementById("Primeton_LaborContract").style.display="";
							document.getElementById("PrimetonSmart_LaborContract").style.display="none";
							document.getElementById("PrimetonNingbo_LaborContract").style.display="none";
						}
					}
					
		            if (majorvalue == null || majorvalue == ''){
					    majorname1();
					}
		            personType2();
		            
		            //统筹年假信息默认
		            if(o.empvar.year == null || o.empvar.year == ''){
						nui.get("empvaryear").setValue(year1);
						nui.get("empvaruserid").setValue(o.emp.userid);
						nui.get("empvarovervac").setValue(0);
						
						nui.get("empvarlastrest").setValue(0);
						nui.get("empvardaysoff").setValue(0);
						nui.get("empvarbonusvac").setValue(0);
						nui.get("empvarstandvac").setValue(0);
						nui.get("empvarworkyears").setValue(0);
						nui.get("empvarcomyears").setValue(0);
		            }
		            
		            //银行卡信息
					bankcount.load({empid:empid});
					
            		//附件加载（招聘上传）
            		nui.get("grid_0").load({"groupid":"omIntendJoin","relationid":o.omIntendJoin.intendid});
            		//附件加载（新员工上传）
            		nui.get("grid_1").load({"groupid":"omIntendJoinInfo","relationid":o.omIntendJoin.intendid});
            		//审批意见的流程实例ID
					nui.get("processinstid").setValue(o.omIntendJoin.processinstid);
					//流程回退路径赋值 
                	nui.get("backTo").setData(o.omIntendJoin.backList);
               		//审核结果设置
					var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
					nui.get("auditstatus").setData(dataStatus);
					nui.get("auditstatus").setValue("1");
					nui.get("auditopinion").setValue("同意。");
					nui.get("workitemid").setValue(<%=workItemID %>);
               		nui.get("activitydefid").setValue(o.workitem.activityDefID);
					var processinstid = o.omIntendJoin.processinstid;
					var grid = nui.get("datagrid1");
					grid.sortBy("time", "desc");
					grid.load({"processInstID": processinstid},function(){});
					//checklist所需参数processInstID、activityInstID、incomeType、checkObj
               		nui.get("activitydefid").setValue(o.workitem.activityDefID);
	        		var checklistdata={processInstID:processinstid,processDefName:o.workitem.processDefName,activityDefID:o.workitem.activityDefID,incomeType:null,workitemid:'<%=workItemID %>'};
					queryChickList(checklistdata);
					//入职信息确认与入职材料归档共用一个页面，入职材料归档不需要确认是否需要员工再补充资料
					<%--if(activityDefID != "manualActivity7"){
						document.getElementById("field8").style.display="none";
						document.getElementById("field9").style.display="none";
					}--%>
					
					//导出pdf模板数据
					//合同签署部门
            		var htorgname = o.omIntendJoin.htorgname;
				  	if(htorgname){
				  		if(htorgname.indexOf(',')!=-1){
				  			htorgname = htorgname.split(',')[0];
				  		}
				  	}
					var startdate = new Date(o.omIntendJoin.laborstart);//获取合同开始日期
					var endday = new Date(o.omIntendJoin.laborend);//获取合同结束日期
					var trialstartdate = null;
					if(o.omIntendJoin.probationstartdate != null && o.omIntendJoin.probationstartdate != ''){
						trialstartdate = new Date(o.omIntendJoin.probationstartdate);//获取试用期开始日期
					}
					var trialdate = null;
					if(o.omIntendJoin.probationenddate != null && o.omIntendJoin.probationenddate != ''){
						trialdate = new Date(o.omIntendJoin.probationenddate);//获取试用期结束日期
					}
			        //var nowdate = new Date();//签合同日期
			        //签合同日期应为入职日期
			        var indate = new Date(o.emp.indate);
					pdfjson = ({"filename":"","emp":{
								"orgname":htorgname,
								"empname":o.emp.empname,
								"empcode":o.emp.empcode,
								"startyear":startdate.getFullYear(),
								"startmonth":startdate.getMonth()+1,
								"startday":startdate.getDate(),
								"endyear":endday.getFullYear(),
								"endmonth":endday.getMonth()+1,
								"endday":endday.getDate(),
								"starttrialyear":trialstartdate == null ?"/":trialstartdate.getFullYear(),
								"starttrialmonth":trialstartdate == null ?"/":trialstartdate.getMonth()+1,
								"starttrialday":trialstartdate == null ?"/":trialstartdate.getDate(),
								"endtrialyear":trialdate == null ?"/":trialdate.getFullYear(),
								"endtrialmonth":trialdate == null ?"/":trialdate.getMonth()+1,
								"endtrialday":trialdate == null ?"/":trialdate.getDate(),
								"positionname":nui.getDictText("AME_POSITION_MEMO",o.emp.positionname),
								"positionmemo":o.emp.positionname == null ?"":getDictfile("AME_POSITION_MEMO",o.emp.positionname),
								"workplace":o.emp.workplace == null ?"":nui.getDictText("AREA4CLRY",o.emp.workplace),
								"worktype":o.omIntendJoin.worktype == null ?(o.emp.degree == 1 || o.emp.degree == 2 || o.emp.degree == 3?'2':'1'):o.omIntendJoin.worktype,
								"nowyear":indate.getFullYear(),
								"nowmonth":indate.getMonth()+1,
								"nowdate":indate.getDate(),
								"nowday":startdate.getFullYear()+'-'+(startdate.getMonth()+1)+'-'+startdate.getDate()
								}});
            	}
				nameRepeat(o.emp.empname,o.emp.userid);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
		});
  	}
  	
  	//提交流程
	function onOk(){
		var level = nui.get("level").getData();
		var personType = nui.get("degree").getValue();
		if(personType==2||personType==3){
			for(var i=0;i<level.length;i++){
				if(level[i].startdate == '' || level[i].startdate == null ||
				   level[i].enddate == '' || level[i].enddate == null ||
				   level[i].degree == '' || level[i].degree == null ||
				   level[i].isworkrate == '' || level[i].isworkrate == null ||
				   level[i].currentstate == '' || level[i].currentstate == null){
				   
				   nui.alert("人员级别信息请补充完整");
				   return;
			   }
			}
		}
		
		var education = nui.get("Education").getData();
		for(var i=0;i<education.length;i++){
			if(education[i].degree == '' || education[i].degree == null ||
			   education[i].graduschool == '' || education[i].graduschool == null ){
			   
			   nui.alert("学历信息请补充完整");
			   return;
		   }
		}
		
		
		var workExp = nui.get("workExp").getData();
		for(var i=0;i<workExp.length;i++){
			if(workExp[i].startdate == '' || workExp[i].startdate == null ||
			   workExp[i].enddate == '' || workExp[i].enddate == null ||
			   workExp[i].companyname == '' || workExp[i].companyname == null ||
			   workExp[i].duty == '' || workExp[i].duty == null ||
			   workExp[i].workdescription  == '' || workExp[i].workdescription  == null){
			   
			   nui.alert("工作经历信息请补充完整");
			   return;
		   }
		}
		
		var projExp = nui.get("projExp").getData();
		for(var i=0;i<projExp.length;i++){
			if(projExp[i].beginenddate  == '' || projExp[i].beginenddate  == null ||
			   projExp[i].enddate == '' || projExp[i].enddate == null ||
			   projExp[i].projectname == '' || projExp[i].projectname == null ||
			   projExp[i].projectintroduce  == '' || projExp[i].projectintroduce  == null ||
			   projExp[i].projectduty  == '' || projExp[i].projectduty  == null ){
			   
			   nui.alert("项目经历信息请补充完整");
			   return;
		   }
		}
		
		var cert = nui.get("cert").getData();
		for(var i=0;i<cert.length;i++){
			if(cert[i].cardtype == '' || cert[i].cardtype == null ||
			   cert[i].cardno == '' || cert[i].cardno == null ||
			   cert[i].startdate == '' || cert[i].startdate == null ){
			   
			   nui.alert("有关证件(书)信息请补充完整");
			   return;
		   }
		}
		
		var filePaths = document.getElementsByName("uploadfile").length;
    	for(var j = 0;j < filePaths;j++){
    		var a = document.getElementsByName("remarkList")[j].value;
    		if(a == null || a == ""){
    			nui.alert("新增附件不可以为空");
    			return false;
    		}
    	}
    	var filePaths = document.getElementsByName("uploadfile1").length;
    	for(var j = 0;j < filePaths;j++){
			var a = document.getElementsByName("uploadfile1")[j].files.length;
			if(a == 0){
				nui.alert("新增新员工入职附件不可以为空");
				return false;
			}
    	}
    	
    	var auditstatus = nui.get("auditstatus").getValue();
    	if(auditstatus==1){
	    	//checklist必须全部选中，如果不通过在备注栏说明原因
	    	var grid_checklist = nui.get("grid_checklist"); 
	    	var checklistrow = grid_checklist.getData();
	    	for(var i =0; i<checklistrow.length;i++){
	    		if(checklistrow[i].ischeck=="0"){
	    			nui.alert("核查清单'"+checklistrow[i].checklistseq+checklistrow[i].checklistname+"'没有勾选！");
	    			return;
	    		}
	    	}
    		
			var isByNewEmpconfirm = nui.get("isByNewEmpconfirm").getValue();
			if(isByNewEmpconfirm == null || isByNewEmpconfirm == ''){
				nui.alert("请确认是否需要员工再补充资料!");
				return false;
			}
    	}
    	if(!form_Intend.validate() && auditstatus!="2"){
			nui.alert("信息录入不完整!");
			return;
		}else{
    		document.getElementById("fileCatalog").value="omIntendJoin";
    		form4.submit();
		}
	}
	
	function SaveData1(){
		form2.submit();
	}
	//保存
	function SaveData(){
		var json = form_Intend.getData();
		var message = "提交";
		//发起页面的处理信息
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		//得到核查要点
    	var checklistrow = grid_checklist.getData();
    	json.checklist = checklistrow;
    	if(activityDefID != "manualActivity7"){
			json.omIntendJoin.isByNewEmpconfirm1 = nui.get("isByNewEmpconfirm").getValue();
    	}else{
			json.omIntendJoin.isByNewEmpconfirm = nui.get("isByNewEmpconfirm").getValue();
    	}
    	
		var a =[];
		orgChange = null;
		var education = nui.get("Education").getChanges();
		if(nui.encode(education)==nui.encode(a)){
			education = nui.get("Education").getChanges();
		}
		var workExp = nui.get("workExp").getChanges();
		if(workExp==a){
			workExp = null;
		}
		var projExp = nui.get("projExp").getChanges();
		if(projExp==a){
			projExp = null;
		}
		var cert = nui.get("cert").getChanges();
		if(cert==a){
			cert = null;
		}
		var contract = nui.get("Contract").getData();
		if(contract==a){
			contract = nui.get("Contract").getChanges();
		}
		var level = nui.get("level").getData();
		if(nui.encode(level)==nui.encode(a)){
			var personType = nui.get("degree").getValue();
			if(personType==2||personType==3){
				level = nui.get("level").getChanges();
			}else{
				level = [];
			}
		}
		json.emp.oEmplevels = level;
		var istakepc = nui.get("istakepc").getValue();
		if(istakepc==1){//员工自备电脑
			//将员工自备电脑起始日更新为默认入职日期
			json.emp.takepcdate = json.emp.indate;
		}
		json.omIntendJoin.istakepc=istakepc;
		var empid = nui.get("empid").getValue();
		<%--json.education = education;--%>
		json.orgChange = orgChange;<%--json.speQuoList = speQuoList;--%>
		if(json.oOpr == null||json.oOpr == ""){
			
		}else{
			json.oOpr.hasopr='y';
		}
		//昵称默认为姓名
		json.emp.realname = json.emp.empname;
		
		//修改试用期
		json.omIntendJoin.probationstartdate = nui.get("veristart").getValue();
    	json.omIntendJoin.probation = nui.get("veritime").getValue();
    	json.omIntendJoin.probationenddate = nui.get("veriend").getValue();
    	//修改入职日期
    	json.omIntendJoin.actdate = nui.get("indate").getValue();
    	var updateURL = "org.gocom.abframe.org.intendstaff.addIntendStaffInfo.addIntendSatffInfo.biz.ext";
		var saveURL = "";
		
		saveURL = updateURL;
		
    	var backTo = nui.get("backTo").getValue();
		//回退信息
		if(backTo == 'manualActivity2'){
		  json.omIntendJoin.backflag = "2";
		}
		else if(backTo == 'manualActivity3' || backTo == 'autoActivity'){
		  json.omIntendJoin.backflag = "1";
		}
		else if(backTo == 'manualActivity' || backTo == 'manualActivity1' || backTo == 'manualActivity13')
		{
		  json.omIntendJoin.backflag = "3";
		  if(backTo == 'manualActivity' || backTo == 'manualActivity13'){
  	  		json.omIntendJoin.adminBackFlag = "1";
  		  	json.omIntendJoin.otherBackFlag = "0";
		  }	
		}
		
		json.contract = contract;
		json.education = null;
		
		var jsonresum = nui.encode({"AmeOmIntendJoinInfo":json.omIntendJoin,"resume":json.resume, "AmeWorkExp":workExp, "AmeProjectWork":projExp, "AmeCert":cert, "AmeDegreeExp":education,"flag":0,"workitemId":<%=workItemID %>,"processInstID":json.omIntendJoin.processinstid});
		
		nui.confirm("确定要"+message+"新员工入职流程吗？","操作提示",function (action){
			if(action == "ok"){
				nui.get("appButton").setEnabled(false);
				nui.get("saveButton").setEnabled(false);
				form_Intend.loading("处理中,请稍后...");
				nui.ajax({
	    			url: saveURL,
	    			data: jsonresum,
	    			type: 'POST',
	    			cache: false,
	    			contentType: 'text/json',
	    			success: function(text){
			    		nui.ajax({
			    			url:"com.primeton.eos.ame_permanage.ame_entry.EntryProcessReve.biz.ext",
			    			data: json,
			    			type:"post",
			    			contentType:"text/json",
			    			success:function(action){
			    				action = nui.clone(action);
			    				form_Intend.unmask();
			    				if(action.exception == null){
			    					var creatwx = "";
			    					if(action.wxresult){
				                    	creatwx = "微信企业号人员未能成功同步，错误原因："+action.wxresult;
				                    }
			    					nui.alert(message+"新员工入职流程成功！"+creatwx,"系统提示",function(){
						        		CloseWindow("ok");
					    				nui.get("appButton").setEnabled(true);
										nui.get("saveButton").setEnabled(true);
						        	});
			    				}else if(action.exception == "fallsendmail"){
						        	nui.alert(message+"新员工入职流程成功！提醒邮件发送失败，请手动发送入职提醒邮件！","系统提示",function(){
						        		CloseWindow("ok");
					    				nui.get("appButton").setEnabled(true);
										nui.get("saveButton").setEnabled(true);
						        	});
			    				}else{
			    					nui.alert("流程提交失败！","系统提示",function (){
					    				nui.get("appButton").setEnabled(true);
										nui.get("saveButton").setEnabled(true);
			    					});
			    				}
			    			},
			    			error:function(jqXHR, teactionatus, errorThrown){
			    				nui.alert("error:" + jqXHR.responseText);
			    			}
			    		});
		    		},
	    			error: function(jqXHR, textStatus, errorThrown){
	    			}
	    		});
			}
		});
	}
	//暂时保存
	function temsave(){
		var updateURL = "org.gocom.abframe.org.intendstaff.addIntendStaffInfo.addIntendSatffInfo.biz.ext";
		var saveURL = "";
		saveURL = updateURL;
    	if(!form_Intend.validate()){
			nui.alert("信息录入不完整!");
			return;
		}
		
		var level = nui.get("level").getData();
		for(var i=0;i<level.length;i++){
			if(level[i].startdate == '' || level[i].startdate == null ||
			   level[i].enddate == '' || level[i].enddate == null ||
			   level[i].degree == '' || level[i].degree == null ||
			   level[i].isworkrate == '' || level[i].isworkrate == null ||
			   level[i].currentstate == '' || level[i].currentstate == null){
			   
			   nui.alert("人员级别信息请补充完整");
			   return;
		   }
		}
		
		var education = nui.get("Education").getData();
		for(var i=0;i<education.length;i++){
			if(education[i].degree == '' || education[i].degree == null ||
			   education[i].graduschool == '' || education[i].graduschool == null ){
			   
			   nui.alert("学历信息请补充完整");
			   return;
		   }
		}
		
		var workExp = nui.get("workExp").getData();
		for(var i=0;i<workExp.length;i++){
			if(workExp[i].startdate == '' || workExp[i].startdate == null ||
			   workExp[i].enddate == '' || workExp[i].enddate == null ||
			   workExp[i].companyname == '' || workExp[i].companyname == null ||
			   workExp[i].duty == '' || workExp[i].duty == null ||
			   workExp[i].workdescription == '' || workExp[i].workdescription == null){
			   
			   nui.alert("工作经历信息请补充完整");
			   return;
		   }
		}
		var projExp = nui.get("projExp").getData();
		for(var i=0;i<projExp.length;i++){
			if(projExp[i].beginenddate == '' || projExp[i].beginenddate == null ||
			   projExp[i].enddate == '' || projExp[i].enddate == null ||
			   projExp[i].projectname == '' || projExp[i].projectname == null ||
			   projExp[i].projectintroduce == '' || projExp[i].projectintroduce == null ||
			   projExp[i].projectduty == '' || projExp[i].projectduty == null ){
			   
			   nui.alert("项目经历信息请补充完整");
			   return;
		   }
		}
		var cert = nui.get("cert").getData();
		for(var i=0;i<cert.length;i++){
			if(cert[i].cardtype == '' || cert[i].cardtype == null ||
			   cert[i].cardno == '' || cert[i].cardno == null ||
			   cert[i].startdate == '' || cert[i].startdate == null ){
			   
			   nui.alert("有关证件(书)信息请补充完整");
			   return;
		   }
		}
		
		var a =[];
		var data = form_Intend.getData();
		var userid = nui.get("userid").getValue();
		var workExp = nui.get("workExp").getChanges();
		if(workExp==a){
			workExp = null;
		}
		var projExp = nui.get("projExp").getChanges();
		if(projExp==a){
			projExp = null;
		}
		var cert = nui.get("cert").getChanges();
		if(cert==a){
			cert = null;
		}
		var education = nui.get("Education").getChanges();
		if(nui.encode(education)==nui.encode(a)){
			education = nui.get("Education").getChanges();
		}
		var contract = nui.get("Contract").getData();
		if(nui.encode(contract)==nui.encode(a)){
			contract = nui.get("Contract").getChanges();
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
		//昵称默认为姓名
		data.emp.realname = data.emp.empname;
		//修改试用期
		data.omIntendJoin.probationstartdate = nui.get("veristart").getValue();
    	data.omIntendJoin.probation = nui.get("veritime").getValue();
    	data.omIntendJoin.probationenddate = nui.get("veriend").getValue();
    	//修改入职日期
    	data.omIntendJoin.actdate = nui.get("indate").getValue();
    	var istakepc = nui.get("istakepc").getValue();
		if(istakepc==1){//员工自备电脑
			//将员工自备电脑起始日更新为默认入职日期
			data.emp.takepcdate = nui.get("indate").getValue();
		}
		data.omIntendJoin.istakepc=istakepc;
		var json = nui.encode({"AmeOmIntendJoinInfo":data.omIntendJoin,"resume":data.resume, "AmeWorkExp":workExp, "AmeProjectWork":projExp,"AmeCert":cert, "AmeDegreeExp":education,"flag":0,"workitemId":<%=workItemID %>,"processInstID":data.omIntendJoin.processinstid});
		var jsonemp = nui.encode({"emp":data.emp,"oOpr":data.oOpr,"verify":data.verify,"contract": contract,"education" : null });
    	nui.confirm("确定要暂时保存员工入职信息吗？","操作提示",function (action){
			if(action == "ok"){
				nui.get("appButton").setEnabled(false);
				nui.get("saveButton").setEnabled(false);
				nui.ajax({
	    			url: saveURL,
	    			data: json,
	    			type: 'POST',
	    			cache: false,
	    			contentType: 'text/json',
	    			success: function(text){
				    	nui.ajax({
							url: "org.gocom.abframe.org.organization.newOrgEmp.updateEmpOrg.biz.ext",
							data: jsonemp,
							type: 'POST',
							cache: false,
							contentType: 'text/json',
							success: function(text){
								if(text.returnVal==1){
									if(text.wxresult){
										nui.alert("暂时保存成功,但人员微信企业号未能成功同步,错误原因："+text.wxresult);
									}else{
										nui.alert("暂时保存成功！");
									}
				    			}else if(text.returnVal==2){
				    				nui.alert("暂时保存基本信息失败，请重新尝试");
				    			}else{
				    				nui.alert("暂时保存失败，请重新尝试");
				    			}
				    			nui.get("appButton").setEnabled(true);
								nui.get("saveButton").setEnabled(true);
							},
							error: function(jqXHR, textStatus, errorThrown){
								nui.alert("error:" + jqXHR.responseText);
				    			nui.get("appButton").setEnabled(true);
								nui.get("saveButton").setEnabled(true);
							}
						});
					},
	    			error: function(jqXHR, textStatus, errorThrown){
	    			}
	    		});
	    		var checklistrow = grid_checklist.getData();
				var opioionformData = opioionform.getData();
		    	var checkjson = {"csIncomecheck":checklistrow,"misOpinion":opioionformData.misOpinion};	
		    	nui.ajax({
					url: "com.primeton.eos.ame_income.csReveForeProcess.saveCheckList.biz.ext",
					data: checkjson,
					type: 'POST',
					cache: false,
					contentType: 'text/json',
					success: function(text){
					},
					error: function(jqXHR, textStatus, errorThrown){
					}
				});
			}
		});
	}
	
  	//默认主管
  	function majorname1(){
		if(orgid == null || orgid == ""){
			nui.get("major").setData(null);
		}else{
			var json = nui.encode({"orgid":orgid});
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
    			},
    			error: function(jqXHR, textStatus, errorThrown){
    			}
        	});
		}
	         
	}
	//选择人员
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
	
	//检查身份证号
	function checkcardno(){
		var cardtype = nui.get("cardtype").getValue();
		var cardno = nui.get("cardno").getValue();
		if(cardtype == "id"){//证件类型为身份证号
			if(cardno !=''  && cardno != null){
				if (cardno.length == 18) {
					//身份证正则表达式(18位) 
					var isIdCard2 = new RegExp(nui.getDictText("AME_SYSCONF","checkcardno18sits"),'i');
					if (!isIdCard2.test(cardno)) {
						nui.alert("身份证号码格式不符合要求");
						nui.get("cardno").setValue('');
						return;
					}
					var year = cardno.substr(6, 4);
					var month = cardno.substr(10, 2);
					var day = cardno.substr(12, 2);
					var birthday = cardno.substr(6, 8);
					if (birthday != dateToString(new Date(year + '/' + month + '/' + day)).replace(/-/g,'')) { //校验日期是否合法
						nui.alert("身份证号码出生年月日不符合要求");
						nui.get("cardno").setValue('');
					}
				}else if(cardno.length == 15){
					//身份证正则表达式(15位) 
					var isIdCard2 = new RegExp(nui.getDictText("AME_SYSCONF","checkcardno15sits"),'i');
					if (!isIdCard2.test(cardno)) {
						nui.alert("身份证号码格式不符合要求");
						nui.get("cardno").setValue('');
						return;
					}
					var year = cardno.substr(6, 4);
					var month = cardno.substr(10, 2);
					var day = cardno.substr(12, 2);
					var birthday = cardno.substr(6, 8);
					if (birthday != dateToString(new Date(year + '/' + month + '/' + day)).replace(/-/g,'')) { //校验日期是否合法
						nui.alert("身份证号码出生年月日不符合要求");
						nui.get("cardno").setValue('');
					}
				}else{
					nui.alert("请输入正确位数的身份证号！");
					nui.get("cardno").setValue("");
				}
			
			}
		}
	}
	//检查是否为数字
	function validate(){  
	     var reg = new RegExp("^[0-9]*[0-9][0-9]*$");  
	     var obj = nui.get("veritime").getValue();
	     if(!reg.test(obj)){  
	     	nui.alert("输入格式不正确，请输入整数！");
	     	nui.get("veritime").setValue("");    
	     }  
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
	//合同信息添加附件
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
    //返回日期格式
    function dealdate(e){
		if(e.value){
			return e.value.substring(0,10);
		}
	}
	//日期格式化
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
	//grid表单填写权限控制
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
	
	//grid业务字典
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
	function onCertTypeRenderer(e){
		return nui.getDictText('AME_CERTTYPE',e.value);//设置业务字典值
	}
	//额度类型业务字典
    function quoType(e) {
		return nui.getDictText('AME_SPEQUOTYPE',e.value);//设置业务字典值
	}
	//专项报销类型
	function feetype(e){
		return nui.getDictText('AME_SPEFEETYPE',e.value);//设置业务字典值
	}
	
	//关闭
	function onCancel(e) {
    	var data = form_Intend.getData();
    	if(data){
        	nui.showMessageBox({
	            title: "关闭提示",
	            iconCls: "nui-messagebox-question",
	            buttons: ["yes", "no"],
	            message: "是否关闭？",
	            callback: function (action) {
	                if(action=="yes"){
	                	CloseWindow("cancel");
	                }
	            }
	        });
		}else{
			CloseWindow("cancel");
		}
    }
    function CloseWindow(action){
		if (action == "close" && form_Intend.isChanged()){
			if (confirm("数据被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	/* //自动计算试用期结束日期
	function getDateNexThirdMonth(){
		var veristart = nui.get("veristart").getValue()
		var veritime = nui.get("veritime").getValue();
		if(veritime == null || veritime == ''){
			veritime = 3;
		}
		if(veristart != null && veristart != ''){
			var date1 = new Date(veristart);
    		var month =parseFloat(veritime);
    		if(month==0){//如果试用期设置为0，则试用期结束日期为试用期开始时间
				nui.get("veriend").setValue(date1);
				//应转正日期：规则是比试用期结束日期多一天，如果试用期期限为0，则为试用期开始日期
    			nui.get("shoulddate").setValue(date1);
        	}else{
        		if(month){
					var veriend = DateAdd("m", month, date1);
					//设置应转正日期
	    			nui.get("shoulddate").setValue(veriend);
					var veriend1 = DateAdd("d", -1, veriend);
	    			nui.get("veriend").setValue(veriend1);
				}
        	}
		}
	}
	 */
	 //自动计算试用期结束日期
	function getDateNexThirdMonth(){
		var veristart = nui.get("veristart").getValue();
		var veritime = nui.get("veritime").getValue();
		if(veritime == null || veritime == ''){
			veritime = 3;
		}
    	var month =parseFloat(veritime);
    	if(month==0){//如果试用期设置为0，试用期开始日期和结束日期都清空，同时将其设置为非必填
    		nui.get("veristart").setValue();//试用期开始日期
			nui.get("veriend").setValue();//试用期结束日期
			nui.get("shoulddate").setValue();//应转正日期
			nui.get("veristart").setReadOnly(true); 
			nui.get("veriend").setReadOnly(true);
			nui.get("shoulddate").setReadOnly(true);
			nui.get("veristart").setRequired(false);
			nui.get("veriend").setRequired(false); 
			nui.get("shoulddate").setRequired(false);   
    	}else{
    		nui.get("veristart").setReadOnly(false); 
			nui.get("veriend").setReadOnly(false);
			nui.get("shoulddate").setReadOnly(false);
			nui.get("veristart").setRequired(true);
			nui.get("veriend").setRequired(true);
			nui.get("shoulddate").setRequired(true);
			if(veristart&&veristart!=''){
				var date1 = new Date(veristart);
        		if(month){
					var veriend = DateAdd("m", month, date1);
					//设置应转正日期
	    			nui.get("shoulddate").setValue(veriend);
					var veriend1 = DateAdd("d", -1, veriend);
        			nui.get("veriend").setValue(veriend1);
				}
			}else{
				nui.get("veriend").setValue();
			}   
    	}
	}
	
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
	//导出pdf
	function exportPDFContract(filename){
		pdfjson.filename = filename;
		//因为试用期相关也面可以调整，所以在导出时，获取页面调整后的数据
		var trialstartdate =  nui.get("veristart").getValue();
        var trialdate = nui.get("veriend").getValue();
		if(trialstartdate&&trialdate){
			trialstartdate = new Date(trialstartdate)//获取试用期开始日期
			trialdate = new Date(trialdate);;//获取试用期结束日期
		}
		//签合同日期应为入职日期
        var indate = nui.get("indate").getValue();
        indate = new Date(indate);
		pdfjson.emp.starttrialyear=trialstartdate == null || trialstartdate == '' ?"/":trialstartdate.getFullYear();
		pdfjson.emp.starttrialmonth=trialstartdate == null || trialstartdate == '' ?"/":trialstartdate.getMonth()+1;
		pdfjson.emp.starttrialday=trialstartdate == null || trialstartdate == '' ?"/":trialstartdate.getDate();
		
		pdfjson.emp.endtrialyear=trialdate == null || trialdate == '' ?"/":trialdate.getFullYear();
		pdfjson.emp.endtrialmonth=trialdate == null || trialdate == '' ?"/":trialdate.getMonth()+1;
		pdfjson.emp.endtrialday=trialdate == null || trialdate == '' ?"/":trialdate.getDate();
		
		pdfjson.emp.nowyear=indate.getFullYear();
		pdfjson.emp.nowmonth=indate.getMonth()+1;
		pdfjson.emp.nowdate=indate.getDate();
		
		pdfjson.emp.positionname = nui.getDictText("AME_POSITION_MEMO",nui.get("positionname").getValue());
		pdfjson.emp.positionmemo = getDictfile("AME_POSITION_MEMO",nui.get("positionname").getValue());
		//console.log(pdfjson);
		nui.ajax({
			url: "com.primeton.eos.ame_permanage.ame_entry.createLaborContractByPDFTemplate.biz.ext",
	        type: "post",
	        data: pdfjson,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		var filePath = o.downloadFile;
	        	var fileName = "劳动合同_"+pdfjson.emp.empname;
	        	if(pdfjson.filename == "LetterOfAppoint.pdf"){
	        		fileName = "员工录用告知书_"+pdfjson.emp.empname;
	        	}
	        	var myDate = new Date();
	        	var year = myDate.getFullYear();
	        	var month = myDate.getMonth()+1;
	        	var day = myDate.getDate();
	        	var hours = myDate.getHours();
	        	var minutes = myDate.getMinutes();
	        	var seconds = myDate.getSeconds();
	        	var curDateTime = year;
	        	if(month>9){
					curDateTime = curDateTime + "" + month;
				}else{
					curDateTime = curDateTime + "0" + month;
					}
	        	if(day>9){
					curDateTime = curDateTime + day;
				}else{
					curDateTime = curDateTime + "0" + day;
					}
				if(hours>9){
					curDateTime = curDateTime + hours;
				}else{
					curDateTime = curDateTime + "0" + hours;
					}
				if(minutes>9){
					curDateTime = curDateTime + minutes;
				}else{
					curDateTime = curDateTime + "0" + minutes;
					}
				if(seconds>9){
					curDateTime = curDateTime + seconds;
				}else{
					curDateTime = curDateTime + "0" + seconds;
				}
				fileName = fileName + "_" + curDateTime + ".pdf";
				var frm = document.getElementById("viewlist1");
	        	frm.elements["downloadFile"].value = filePath;
	        	frm.elements["fileName"].value = fileName;
			    frm.submit();
	        },
	        error: function () {
	        	alert("error");
	        }
		});
	}
	
	//添加有关证书
	function addCert(){
		nui.open({
			url: "/default/ame_resume/addCertDetail.jsp",
	        title: "增加证书详情",
	        width: 700,
	        height: 400,
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
	                	var cardtype = data.cardtype;
	                	var cardno = data.cardno;
	                	var startdate = data.startdate;
	                	if(startdate!='null' && startdate!=null && startdate!=""){
	                		startdate = FormatDate(startdate);
	                	}
	                	var enddate = data.enddate;
	                	if(enddate!='null' && enddate!=null && enddate!=""){
	                		enddate = FormatDate(enddate);
	                	}
	                	var remark = data.remark;
	                	var fileid = data.fileid;
	                	if(fileid == null ||fileid==""||fileid=='null'){
	                		var newRow = { name: "New Row",
							cardtype: cardtype,
							cardno: cardno,
							startdate: startdate,
							enddate: enddate,
							remark: remark,
							fileid:  fileid
							};
							var grid = nui.get('cert');
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
									cardtype: cardtype,
									cardno: cardno,
									startdate: startdate,
									enddate: enddate,
									remark: remark,
									fileid:  fileid,
									files:  files
									};
									var grid = nui.get('cert');
									grid.addRow(newRow);
				    			}
				    		});
	                	}
	                }
	            }
	        }
		});
	}
	
	//修改有关证书
	function updateCert(){
		var rows = cert.getSelecteds();
		if (rows.length > 1){
    		alert("只能选中一条记录进行编辑！");
    	}else{
            var row = cert.getSelected();
            if(row){
            	var remark = row.remark;
            	var fileid = row.fileid;
            	var files = row.files;
            	var enddate = row.enddate;
            	var startdate = row.startdate;
            	var cardno = row.cardno;
            	var cardtype = row.cardtype;
            	var rescertid = row.rescertid;
            	nui.open({
					url: "/default/ame_resume/addCertDetail.jsp?",
	                title: "增加证书详情",
	                width: 700,
	                height: 400,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = {"action": "edit","o":{"remark":remark,"fileid":fileid,"files":files,"enddate":enddate,"startdate":startdate,"cardno":cardno,"cardtype":cardtype}};
	                    iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
	                    if (action == "ok") {
	                        var iframe = this.getIFrameEl();
	                        var data = iframe.contentWindow.GetData();
	                        data = nui.clone(data);    //必须
	                        if (data) {//.
	                        	var cardtype = data.cardtype;
	                        	var cardno = data.cardno;
	                        	var startdate = data.startdate;
	                        	if(startdate!='null' && startdate!=null && startdate!=""){
	                        		startdate = FormatDate(startdate);
	                        	}
	                        	var enddate = data.enddate;
	                        	if(enddate!='null' && enddate!=null && enddate!=""){
	                        		enddate = FormatDate(enddate);
	                        	}
	                        	var remark = data.remark;
	                        	var fileid = data.fileid;
	                        	if(fileid == null ||fileid==""||fileid=='null'){
	                        		var json = nui.encode({"rescertid":""});
	                        		nui.ajax({
						    			url: "com.primeton.eos.ame_resume.resumeManage.queryUploadFiles.biz.ext",
						    			data: json,
						    			type: 'POST',
						    			cache: false,
						    			contentType: 'text/json',
						    			success: function(o){
						    				var files = null;
						    				fileid = null;
						    				var updateRow = {
											cardtype: cardtype,
											cardno: cardno,
											startdate: startdate,
											enddate: enddate,
											remark: remark,
											fileid:fileid,
											files:  files
											};
											var grid = nui.get('cert');
											grid.updateRow(row,updateRow);
						    			}
						    		});
	                        	}else{
	                        		var json = nui.encode({"rescertid":rescertid,"fileid":fileid});
		                        	nui.ajax({
						    			url: "com.primeton.eos.ame_resume.resumeManage.queryUploadFiles.biz.ext",
						    			data: json,
						    			type: 'POST',
						    			cache: false,
						    			contentType: 'text/json',
						    			success: function(o){
						    				var files = o.files;
						    				var updateRow = {
											cardtype: cardtype,
											cardno: cardno,
											startdate: startdate,
											enddate: enddate,
											remark: remark,
											fileid:fileid,
											files:  files
											};
											var grid = nui.get('cert');
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
	
	//业务字典
	function onCertTypeRenderer(e){
		return nui.getDictText('AME_CERTTYPE',e.value);//设置业务字典值
	}
	
	function bankdict(e){
		return nui.getDictText('BANKNAME',e.value);//设置业务字典值
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
	
	function checkDate(e){
		var date = e.date;
        var d = new Date();
        var s = date.getTime() + 24*60*60*1000;
        if (s > d.getTime()) {
            e.allowSelect = false;
        }
	}
	 //设置日期格式并判断当期时间是否过去时间
	function onDealDate(e){
		if(e.field == "startdate"){
			var date = e.value;
			if(date){
				return e.cellHtml.substring(0,10);
			}
		}
	}
	function onDealDateS(e){
		if(e.field == "enddate"){
			var date = e.value;
			if(date){
				return e.cellHtml.substring(0,10);
			}
		}
	}
	function dealdate(e){
		if(e.value){
			return e.value.substring(0,10);
		}
	}
	
<%-- ---------------------------------------------银行卡信息操作开始	--%>
	//是否默认账户
	function isDefalut(e){
		if(e.field == "isdefault"){
			if(e.record.isdefault == "1"){
				e.cellHtml = "默认账户";
			}else if(e.record.isdefault == "0"){
				e.cellHtml = '<a href="javascript:void(0)" onclick="setDefault('+JSON.stringify(e.record).replace(/"/g, '&quot;')+')">设为默认</a>'
			}
		}
	}
	
	//设置为默认账户
	function setDefault(e){
		var json = {defaultAcct:e,empid:e.empid};
		nui.ajax({
            url: "com.primeton.eos.common.omemployeeacctbiz.setDefaultAcct.biz.ext",
            type: "POST",
            data: json, 
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	console.log(text);
            	if(text.reCode){
            		nui.alert("设置成功。","提示",function(e){
			    		bankcount.load({empid:empid});
            		})
            	}else{
            		nui.alert("设置失败，请联系信息技术部。")
            	}
            },
            error: function (err) {
            	nui.alert("错误" + err);
            }
       });
	}
	
	function add(){
		nui.open({
            url: "/default/ame_pur/settlepay/bankInfoInput.jsp?empid="+empid,
	        title: "新增"+expusername+"账户", 
	        width: 650, 
	        height: 250,
	        onload: function () {
	            var iframe = this.getIFrameEl();
	            var data = { action: "new", empid:empid};
	            iframe.contentWindow.SetData(data);
	        },
	        ondestroy: function (action) {
	            bankcount.load({empid:empid});
	        }

	    });
	}

	function edit(){
		var row = bankcount.getSelected();
		if (row) {
	  		nui.open({
	            url: "/default/ame_pur/settlepay/bankInfoInput.jsp",
	            title: "编辑"+expusername+"银行账户",
	            width: 650,
	            height: 250,
	            onload: function () {
					var iframe = this.getIFrameEl();
					var data = {action: "edit", empid: row.empid, bankacct: row.bankacct };
					iframe.contentWindow.SetData(data);
				},
				ondestroy: function (action) {
					bankcount.load({empid:empid});
				}
			});
		} else {
			nui.alert("请选中一条记录","提示");
		}
	}

	function remove(){
		var rows = bankcount.getSelecteds();   //获取所有选中的行对象
	    var data = {omemployeeaccts: rows};
	    var json = nui.encode(data);     //序列化成json字符串
		if (rows.length> 0) {
			nui.confirm("确定删除选中记录？", "确定？",
	            function (action) {            
	                if (action == "ok") {
	                    nui.ajax({
			                url: "com.primeton.eos.common.omemployeeacctbiz.deleteOmEmployeeAccts.biz.ext",
			                type: "POST",
			                data: json, 
			                cache: false,
			                contentType: 'text/json',
			                success: function (text) {
			                	if(text.exception == null){
			                		nui.alert("删除成功！",null,function(){
			                			bankcount.load({empid:empid});
			                		});
			                	}else{
			                		nui.alert("删除失败！");
			                	}
			                },
			                error: function (err) {
			                	nui.alert("错误" + err);
		                    }
		               });
	                } else {
	                    return;
	                }
	            }
			);
	    } else {
	        nui.alert("请至少选中一条记录");
	    }
	}
<%-- ---------------------------------------------银行卡信息操作结束	--%>

	function print(){
		executeUrl = "/default/ame_permanage/ame_entry/printGoal.jsp?workItemID=" + "<%=workItemID %>";
		window.open(executeUrl);
	}
	
	function getDictfile(dicttypeid,dictid){
		var json = ({"eocDictEntry":{"eosDictType":{"dicttypeid":dicttypeid},"dictid":dictid}});
		var dictname = '';
		nui.ajax({
            url: "org.gocom.abframe.tools.DictManager.queryDictEntry.biz.ext",
			type: 'POST',
			data: json,	
            async:false,
			contentType: 'text/json',
            success: function (o) {
            	if(o.eocDictEntry != null && o.eocDictEntry != ''){
	                dictname = o.eocDictEntry.filter1;
                }
            }
        });
        return dictname;
	}
	function setPositionName(e){
		//var recposition = e.value;
		var position = nui.get("positionname").getText();
		nui.get("positioncall").setValue(position);
	}
	
	function addContract(){
		nui.open({
			url: "/default/abframe/org/newOrganization/addContract.jsp",
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
						url: "/default/abframe/org/newOrganization/addContract.jsp?",
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
	
	function getConttype(e){
		return nui.getDictText('CONT_TYPE',e.value);
	}
	function getContprop(e){
		return nui.getDictText('CONT_PROP',e.value);
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
</script>
</html>