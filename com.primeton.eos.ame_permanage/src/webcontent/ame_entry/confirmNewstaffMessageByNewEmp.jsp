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
  - Date: 2019-08-06 10:35:40
  - Description:
-->
<head>
<title>员工补充入职信息确认</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
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
			<input name="emp.empcode" id="empcode" class="nui-hidden">
			<input name="emp.realname" id="realname" class="nui-hidden">
			<input name="oOpr.userid" id="userid" class="nui-hidden">
			<input name="oOpr.operatorid" id="operatorid" class="nui-hidden">
			<input name="omIntendJoin.intendid" id="intendid"  class="nui-hidden"/>
			<input name="omIntendJoin.intendname" id="intendname"  class="nui-hidden"/>
			<input name="omIntendJoin.processinstid" id="processinstid2"  class="nui-hidden"/>
			<input name="omIntendJoin.userid" id="userid1"  class="nui-hidden"/>
			<input name="resume.resumeid" id="resumeid" class="nui-hidden"/>
			<input name="omIntendJoin.fileids" id="fileids1" class="nui-hidden"/>
			<input class="nui-hidden" id="workItemID" value="<%=workItemID %>"/>
			<legend >基本个人信息</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:80px;">姓名:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.empname" id="empname" class="nui-textbox" required="true" style="width:100%;" onblur="changeReal()"/>
                		</td>
                		<td align="right" style="width:80px;">性别:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.gender" id="gender" class="nui-dictcombobox" dictTypeId="ABF_GENDER" width="100%" required="true" shownullItem="true"/>
                		</td>
						<td align="right" style="width:80px;">籍贯:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.birthplace" id="birthplace" class="nui-textbox" required="true"  width="100%"/>
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">民族:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.nation" id="nation" class="nui-textbox"  required="true" width="100%" maxLength="20"/>
                		</td>
						<td align="right" style="width:80px;">证件类型:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.cardtype" id="cardtype" class="nui-dictcombobox" shownullItem="true" dictTypeId="ABF_CARDTYPE" required="true" width="100%"/>
                		</td>
						<td align="right" style="width:80px;">证件号码:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.cardno" id="cardno" class="nui-textbox" width="100%" required="true" onvaluechanged="checkcardno"/>
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">出生年月:</td>
                		<td style="width:140px;">    
                    		<input name="emp.birthdate" id="birthdate" class="nui-datepicker" required="true" showTodayButton="false" width="100%"/>
                		</td>
                		<td align="right" style="width:80px;">手机号码:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.mobileno" id="mobileno" class="nui-textbox" required="true"  width="100%" required="true"/>
                		</td>
                		<td align="right" style="width:80px;">私人邮箱:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.pemail" id="pemail" class="nui-textbox" required="true" width="100%"/>
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">入职日期:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.indate" id="indate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%" required="true" readOnly="readOnly"/>
                		</td>
                		<td align="right" style="width:80px;">社会工作时间:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.socialstart" id="socialstart" class="nui-datepicker" required="true" dateFormat="yyyy-MM-dd" width="100%" required="true"/>
                		</td>
                		<td align="right" style="width:80px;">工作地:</td>
            			<td style="width:140px;" align="left">    
                			<input name="emp.workplace" id="workplace" class="nui-dictcombobox" required="true" shownullItem="true" dictTypeId="AREA4CLRY" width="100%" readOnly="readOnly"/>
            			</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">最高学历:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.highestlen" id="highestlen" class="nui-dictcombobox" required="false"  width="100%" maxLength="20" dictTypeId="DEGREE" readOnly="readOnly"/>
                		</td>
						<td align="right" style="width:80px;">最高学历入学:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.highestindate" id="highestindate" class="nui-datepicker" required="true" dateFormat="yyyy-MM-dd" width="100%" required="true"/>
                		</td>
                		<td align="right" style="width:80px;">最高学历毕业:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.highestoutdate" id="highestoutdate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%" required="true" required="true"/>
                		</td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
			<legend >相关信息</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:80px;">家庭电话:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.htel" id="htel" class="nui-textbox" width="100%" required="true"/>
                		</td>
                		<td align="right" style="width:80px;">联系地址邮编:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.hzipcode" id="hzipcode" class="nui-textbox"  width="100%" maxLength="20" required="true"/>
                		</td>
                		<td align="right" style="width:80px;">联系地址:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.haddress" id="haddress" class="nui-textbox" width="100%" required="true"/>
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">紧急联系人:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.emergency" id="emergency" class="nui-textbox"  width="100%" maxLength="20" required="true"/>
                		</td>
						<td align="right" style="width:80px;">与本人关系:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.emerelation" id="emerelation" shownullItem="true" class="nui-dictcombobox" dictTypeId="EMP_RELATION" width="100%" required="true"/>
                		</td>
                		<td align="right" style="width:80px;">紧急联系人手机:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.emelink" id="emelink" class="nui-textbox" width="100%" required="true"/>
                		</td>
					</tr>
					<tr>
                		<td align="right" style="width:80px;">户籍性质:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.resiproperty" id="resiproperty" shownullItem="true" class="nui-dictcombobox" dictTypeId="ABF_BIRTHTYPE" width="100%"/>
                		</td>
                		<td align="right" style="width:80px;">户口所在省市:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.residende" id="residende" shownullItem="true" class="nui-dictcombobox" dictTypeId="MIS_AREA" width="100%"/>
                		</td>
                		<td align="right" style="width:80px;">户口所在地址:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.resiaddress" id="resiaddress" class="nui-textbox" width="100%"/>
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">档案保管机构:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.filesaveorg" id="filesaveorg" class="nui-textbox" width="100%" required="true"/>
                		</td>
						<td align="right" style="width:80px;">档案所在省市:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.filecity" id="filecity" shownullItem="true" class="nui-dictcombobox" dictTypeId="MIS_AREA"  width="100%"  required="true"/>
                		</td>
                		<td align="right" style="width:80px;">档案所在地址:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.fileaddress" id="fileaddress" class="nui-textbox" width="100%" required="true"/>
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">居住证类型:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.ishaveresi" id="ishaveresi" class="nui-dictcombobox" shownullItem="true" dictTypeId="AME_RESIDENCE" width="100%"/>
                		</td>
                		<td align="right" style="width:80px;">居住地省市:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.liveplace" id="liveplace" shownullItem="true" class="nui-dictcombobox" dictTypeId="MIS_AREA" width="100%" />
                		</td>
                		<td align="right" style="width:80px;">居住证办理单位名称:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.residealorg" id="residealorg" class="nui-textbox" width="100%"/>
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
                		<td align="right" style="width:80px;">居住证年限:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.resilimit" id="resilimit" class="nui-textbox" width="100%"/>
                		</td>
					</tr>
					<tr>
                		<td align="right" style="width:80px;">原福利缴纳省市：</td>
            			<td style="width:140px;" align="left">    
                			<input name="emp.welfareplace" id="welfareplace" class="nui-dictcombobox" shownullItem="true" dictTypeId="AREA4CLRY" width="100%"/>
            			</td>
						<td align="right" style="width:80px;">公积金帐号:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="emp.fundno" id="fundno" class="nui-textbox" width="100%"/>
                		</td>
                		<td align="right" style="width:80px;">补充公积金帐号:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.addfundno" id="addfundno" class="nui-textbox"  width="100%" />
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">微信号:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.msn" id="msn" class="nui-textbox"  width="100%" maxLength="20"/>
                		</td>
						<td align="right" style="width:80px;">政治面貌:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.party" id="party" class="nui-dictcombobox" shownullItem="true" dictTypeId="ABF_PARTYVISAGE" width="100%" required="true"/>
                		</td>
                		<td align="right" style="width:80px;">婚姻状况:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.marristatus" id="marristatus" shownullItem="true" class="nui-dictcombobox" dictTypeId="ABF_MARRITYPE" width="100%" />
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
                		<td align="right" style="width:80px;">年子女出生年月:</td>
                		<td style="width:140px;" align="left">    
                    		<input name="emp.nonagebirth" id="nonagebirth" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"/>
                		</td>
					</tr>
				</table>
			</div>
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
	        	showPageInfo="false" showPager="false" multiSelect="false" allowSortColumn="false">
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
		
		<fieldset style="border: solid 1px #aaa; padding: 3px;" >
			<legend>PCF信息</legend>
			<div style="padding: 5px;">
				<table  style="width:98%;" id="pcf">
					<tr>
						<td align="left" style="width: 100%;color:red;padding-left: 4.1%;" colspan='4'>1、PCF（普元慈善基金会）是公司公益慈善组织，致力于持续资助贫困山区的孩子上学、捐书、捐物等，目前已经园了40多名孩子的上学梦，在持续资助下，有的孩子完成了小学、中学的学业，进入了大学。</td>
					</tr>
					<tr>
						<td align="left" style="width: 100%;color:red;padding-left: 4.1%;" colspan='4'>2、PCF秉承自愿参加的原则，捐款的比例可以是一个比例（如工资的0.1%-1%），也可以是固定金额（如50元、100元）。公司已经有很多人员是PCF成员，也热切期待你的加入，为贫困孩子的上学梦尽一份绵薄之力！</td>
					</tr>
					<tr>
						<td align="right" style="width: 12%;height: 25px;">是否自愿加入PCF:</td>
                		<td align="left" style="width: 58px;">    
                    		<input name="emp.isjoinpcf" id="isjoinpcf" class="nui-dictcombobox"  width="91%"  dictTypeId="MIS_YN"  width="100%" shownullItem="true" onvaluechanged="changePCF(this.value)"/>
                		</td>
						<td align="right" style="width: 12%;height: 25px;">PCF捐款金额：</td>
						<td align="left" style="width: 140px;">
							<input name="emp.pcfamount" id ='pcfamount' class="nui-spinner" format="n2" width="38%" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" />
						</td>
						<td align="right" style="width: 25px;height: 25px;display:none;"></td>
						<td align="left" style="width: 140px;display:none;"></td>
					</tr>
				</table>
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
	            	<div field="startdate" width="30" headerAlign="center"  align="center" dateFormat="yyyy-MM-dd" renderer="dealdate">开始时间
	                	<input property="editor" class="nui-datepicker" dateFormat="yyyy-MM-dd"/>
	                </div>
	                <div field="enddate" width="30" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" renderer="dealdate">截止时间
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
	
	<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		<legend>入职附件</legend>
		<jsp:include page="/ame_common/detailFile.jsp"/>
		<jsp:include page="/ame_common/addFiles1.jsp"/>
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
	//学历信息
	var education = nui.get("Education");
	//工作经历信息
	var workExp = nui.get("workExp");
	//项目经理信息
	var projExp = nui.get("projExp");
	//证书信息
	var cert = nui.get("cert");
	//银行卡号
	var bankcount = nui.get("bankcount");
	
	var action = "";
	var orgid = "";
	var empid = "";
	var expusername = "";
	
	function changeReal(){
		var empname = nui.get("empname").getValue();
		nui.get("realname").setValue(empname);
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
            		form_Intend.setData(o);
					empid = o.emp.empid;
					expusername = o.emp.empname;
					orgid = nui.get("orgid").getValue();
            		//学历信息
		            education.load({  resumeid: o.resume.resumeid});
		            //工作经历信息
		            workExp.load({ resumeid: o.resume.resumeid});
		            workExp.sortBy("startdate", "desc");
		            projExp.load({ resumeid: o.resume.resumeid});
		            projExp.sortBy("beginenddate", "desc");
		            cert.load({ resumeid: o.resume.resumeid});
		            cert.sortBy("startdate", "desc");
		            changePCF(o.emp.isjoinpcf);//初始化PCF信息
		            
		            //银行卡信息
					bankcount.load({empid:empid});
		            
            		//附件加载（加载新员工上传的附件）
            		nui.get("grid_0").load({"groupid":"omIntendJoinInfo","relationid":o.omIntendJoin.intendid});
            		//审批意见的流程实例ID
					nui.get("processinstid").setValue(o.omIntendJoin.processinstid);
					//流程回退路径赋值 
                	nui.get("backTo").setData(o.omIntendJoin.backList);
               		//审核结果设置
					var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"}];
					nui.get("auditstatus").setData(dataStatus);
					nui.get("auditstatus").setValue("1");
					nui.get("auditopinion").setValue("同意。");
					nui.get("workitemid").setValue(<%=workItemID %>);
               		nui.get("activitydefid").setValue(o.workitem.activityDefID);
					var processinstid = o.omIntendJoin.processinstid;
					var grid = nui.get("datagrid1");
					grid.sortBy("time", "desc");
					grid.load({"processInstID": processinstid});
					//checklist所需参数processInstID、activityInstID、incomeType、checkObj
               		nui.get("activitydefid").setValue(o.workitem.activityDefID);
					
            	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
		});
  	}
  	//提交流程
	function onOk(){
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
			   projExp[i].projectname == '' || projExp[i].projectname == null |
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
    	if(!form_Intend.validate() && auditstatus!="2"){
			nui.alert("信息录入不完整!");
			return;
		}else{
    		document.getElementById("fileCatalog").value="omIntendJoinInfo";//新员工上传附件
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
		json.omIntendJoin.endback = "1";
		var a =[];
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
		json.education = education;
		
		var updateURL = "org.gocom.abframe.org.intendstaff.addIntendStaffInfo.addIntendSatffInfo.biz.ext";
		var saveURL = "";
		
		saveURL = updateURL;
		
		if(json.oOpr == null||json.oOpr == ""){
		}else{
			json.oOpr.hasopr='y';
		}
		
		json.contract = null;
		json.education = null;
		
		var jsonresum = nui.encode({"AmeOmIntendJoinInfo":json.omIntendJoin,"resume":json.resume, "AmeWorkExp":workExp, "AmeProjectWork":projExp, "AmeCert":cert, "AmeDegreeExp":education,"flag":0,"workitemId":<%=workItemID %>,"processInstID":json.omIntendJoin.processinstid});
		
		nui.confirm("确定要"+message+"新员工入职流程吗？","操作提示",function (action){
			if(action == "ok"){
				nui.get("appButton").setEnabled(false);
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
			    					nui.alert(message+"入职流程成功！"+creatwx,"系统提示",function(){
						        		CloseWindow("ok");
					    				nui.get("appButton").setEnabled(true);
						        	});
			    				}else if(action.exception == "fallsendmail"){
						        	nui.alert(message+"入职流程成功！","系统提示",function(){
						        		CloseWindow("ok");
					    				nui.get("appButton").setEnabled(true);
						        	});
			    				}else{
			    					nui.alert("流程提交失败！","系统提示",function (){
					    				nui.get("appButton").setEnabled(true);
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
		
		if(!form_Intend.validate()){
			nui.alert("信息录入不完整!");
			return;
		}
	
		var a =[];
		var resume = form_Intend.getData();
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
		
		var resumeid = nui.get("resumeid").getValue();
		saveURL = updateURL;
		
		if(resume.oOpr == null||resume.oOpr == ""){
		}else{
			resume.oOpr.hasopr='y';
		}
		
		var json = nui.encode({"AmeOmIntendJoinInfo":resume.omIntendJoin,"resume":resume.resume, "AmeWorkExp":workExp, "AmeProjectWork":projExp,"AmeCert":cert, "AmeDegreeExp":education,"flag":0,"workitemId":<%=workItemID %>,"processInstID":resume.omIntendJoin.processinstid});
		
		var jsonemp = nui.encode({"emp":resume.emp,"oOpr":resume.oOpr,"contract": null,"education" : null});
		nui.confirm("确定要暂时保存个人信息吗？","操作提示",function (action){
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
									initdate();
									alert("暂时保存成功");
				    			}else if(text.returnVal==2){
				    				alert("暂时保存失败，请重新尝试");
				    			}else{
				    				alert("暂时保存失败，请重新尝试");
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
			}else{
				return;
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
	
	function getDegree(e){
		return nui.getDictText('DEGREE',e.value);
	}
	function getSchooltype(e){
		return nui.getDictText('SCHOOL_TYPE',e.value);
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
	//证件附件信息
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
	
	function changePCF(value){
		var table = document.getElementById("pcf");
		if(!!value){
			if(value==1){//加入普元PCF
				nui.get("pcfamount").setRequired(true);
				table.rows[2].cells[2].style.display = "table-cell";
				table.rows[2].cells[3].style.display = "table-cell";
				table.rows[2].cells[4].style.display = "none";
				table.rows[2].cells[5].style.display = "none";
			}else{
				nui.get("pcfamount").setRequired(false); 
				nui.get("pcfamount").setValue(0);
				table.rows[2].cells[2].style.display = "none";
				table.rows[2].cells[3].style.display = "none";
				table.rows[2].cells[4].style.display = "table-cell";
				table.rows[2].cells[5].style.display = "table-cell";
			}
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
	        alert("请至少选中一条记录");
	    }
	}
<%-- ---------------------------------------------银行卡信息操作结束	--%>
</script>
</html>