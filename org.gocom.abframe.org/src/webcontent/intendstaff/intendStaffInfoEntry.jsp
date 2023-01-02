<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String contextPath=request.getContextPath(); %>
<title>新员工个人信息填写</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<!-- end: META -->
<link rel="shortcut icon" href="/default/ame/login/image/favicon.ico" type="image/x-icon"/>
<%@include file="/common/common.jsp"%>
<script src="<%=contextPath%>/common/nui/nui.js" type="text/javascript"></script>
<script src="<%=contextPath %>/common/components/swffileupload/swfupload/swffileupload.js" type="text/javascript"></script>
<style type="text/css">
	body {
		margin: 0;
		padding: 0;
		width: 100%;
		height: 100%;
		overflow: hidden;
	}
	.mini-textbox-border {
	    padding-left: 0px !important;
	}
</style>
</head>
<!-- 从上个页面获取传的参数 -->
<%String phoneNumber = (String) request.getParameter("phoneNumber");
  String workItemID = (String) request.getParameter("workItemID");%>
<body>
	<div class="nui-fit">
		<div class="nui-panel" title="新员个人工信息填写" style="width: 100%;">
			<!-- 提示信息展示  -->
			<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
			<div id="form1">
				<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<input name="omIntendJoin.fileids" id="fileids1" class="nui-hidden" />
					<input name="omIntendJoin.intendid" id="intendid" class="nui-hidden" /> 
					<input name="resume.resumeid" id="resumeid" class="nui-hidden" /> 
					<legend>基本个人信息</legend>
					<div style="width: 100%;padding: 5px;">
						<table style="width: 98.2%;">
							<tr>
								<td align="right" style="width: 80px;height: 25px;">姓名：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.intendname" id="intendname" width="100%"
									class="nui-textbox" required="true" />
								</td>
								<td align="right" style="width: 80px;height: 25px;">性别：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.gender" class="nui-dictcombobox"
									width="100%" dictTypeId="ABF_GENDER" required="true" />
								</td>
								<td align="right" style="width: 80px;height: 25px;">籍贯：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.birthplace" class="nui-textbox" width="100%" required="true" onvalidation="checkLength(e,'籍贯',15)"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 80px;height: 25px;">民族：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.nation" width="100%" class="nui-textbox" required="true" onvalidation="checkLength(e,'民族',5)" />
								</td>
								<td align="right" style="width: 80px;height: 25px;">证件类型：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.cardtype" id="cardtype" width="100%" class="nui-dictcombobox" dictTypeId="ABF_CARDTYPE"
									required="true" onvaluechanged="changeCheckcardno" />
								</td>
								<td align="right" style="width: 80px;height: 25px;">证件号码：</td>
								<td align="left">
									<input name="omIntendJoin.cardno" id="cardno" class="nui-textbox" width="100%" required="true"
									onvalidation="checkcardno"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 80px;height: 25px;">出生日期：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.birthdate" width="100%" id="birthdate"
									class="nui-datepicker" required="true" />
								</td>
								<td align="right" style="width: 80px;height: 25px;">手机：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.mobileno" id="mobileno" width="100%" class="nui-textbox" required="true"/>
								</td>
								<td align="right" style="width: 80px;height: 25px;">电子邮箱：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.email" class="nui-textbox" width="100%"
									required="true" onvalidation="checkeamil(e)"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 80px;height: 25px;">入职时间：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.interdate" class="nui-datepicker" width="100%" required="true" />
								</td>
								<td align="right" style="width: 80px;height: 25px;">社会开始工作时间：</td>
								<td align="left" style="width: 140px;" id="socialTime" onmouseover="tips('socialTime','1.正式员工请填高等教育结束后开始签署全日制合同开始时间；</br>2.实习员工请填预计拟毕业时间之后一天')" onmouseout="outtips()">
									<input name="omIntendJoin.socialstart" class="nui-datepicker" width="100%" required="true"/>
								</td>
								<td align="right" style="width: 80px;height: 25px;">工作地：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.intendworkplace" id="intendworkplace" class="nui-dictcombobox" dictTypeId="AREA4CLRY" width="100%"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 80px;height: 25px;">最高学历：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.education" class="nui-dictcombobox" width="100%" dictTypeId="DEGREE" required="false" readOnly="readOnly" />
								</td>
								<td align="right" style="width: 80px;height: 25px;">最高学历入学时间：</td>
								<td align="left" style="width: 140px;" id="highstDegreeStarDate" onmouseover="tips('highstDegreeStarDate','1.正式员工请填已毕业的最高学历入学时间；</br>2.实习生请填目前在读的学历入学时间；')" onmouseout="outtips()">
									<input name="omIntendJoin.ghestindate" class="nui-datepicker" width="100%" required="true" />
								</td>
								<td align="right" style="width: 80px;height: 25px;">最高学历毕业时间：</td>
								<td align="left" style="width: 140px;" id="highstDegreeEndDate" onmouseover="tips('highstDegreeEndDate','1.正式员工请填已毕业的最高学历毕业时间；<br>2.实习生请填目前在读的学历预计毕业时间；')" onmouseout="outtips()">
									<input name="omIntendJoin.highestoutdate" class="nui-datepicker" width="100%" required="true" />
								</td>
							</tr>
						</table>
					</div>
				</fieldset>
				<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<legend>相关信息</legend>
					<div style="width: 97%;padding: 5px;">
						<table style="width: 100%;">
							<tr>
								<td align="right" style="width: 80px; height: 25px;">家庭电话：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.htel" id="htel"  onvalidation="checkPhone(e,this)" width="100%" class="nui-textbox" />
								</td>
								<td align="right" style="width: 80px; height: 25px;">联系地址邮编：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.postcode" id="postcode" onvalidation="checkpostcode(e)" width="100%" class="nui-textbox" />
								</td>
								<td align="right" style="width: 80px; height: 25px;">联系地址：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.address" width="106%" onvalidation="checkLength(e,'联系地址',64)" class="nui-textbox" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 80px; height: 25px;">紧急联系人：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.emergency" width="100%" class="nui-textbox" onvalidation="checkLength(e,'紧急联系人',32)" required="true"/>
								</td>
								<td align="right" style="width: 80px; height: 25px;">与本人关系：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.emerelation" width="100%" class="nui-dictcombobox" dictTypeId="EMP_RELATION" required="true"/>
								</td>
								<td align="right" style="width: 80px; height: 25px;">紧急联系人手机：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.emelink" id="emelink" onvalidation="checkPhone(e,this)" width="106%" class="nui-textbox" required="true"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 80px; height: 25px;">户籍性质：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.resiproperty" width="100%" class="nui-dictcombobox" dictTypeId="ABF_BIRTHTYPE" required="true"/>
								</td>
								<td align="right" style="width: 80px; height: 25px;">户口所在省市：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.residence" width="100%" class="nui-dictcombobox" valueField="dictid" textField="dictname" id="residence" required="true"/>
								</td>
								<td align="right" style="width: 80px; height: 25px;">户口所在地址：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.haddress" width="106%" class="nui-textbox" onvalidation="checkLength(e,'户口所在地址',64)" required="true"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 80px; height: 25px;">档案保管机构：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.filesaveorg" width="100%" class="nui-textbox" onvalidation="checkLength(e,'档案保管机构',20)" />
								</td>
								<td align="right" style="width: 80px; height: 25px;">档案所在省市：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.filecity" width="100%" class="nui-dictcombobox" id="filecity" valueField="dictid" textField="dictname" />
								</td>
								<td align="right" style="width: 80px; height: 25px;">档案所在地址：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.fileaddress" width="106%" class="nui-textbox" onvalidation="checkLength(e,'档案所在地址',64)"/>
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 80px; height: 25px;">居住证类型：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.ishaveresi" width="100%"
									class="nui-dictcombobox" dictTypeId="AME_RESIDENCE" />
								</td>
								<td align="right" style="width: 80px; height: 25px;">居住证办理单位名称：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.residealorg" width="100%" class="nui-textbox" onvalidation="checkLength(e,'居住证办理单位名称',32)"/>
								</td>
								<td align="right" style="width: 80px; height: 25px;">居住证开始时间：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.resistartdate" width="106%" class="nui-datepicker" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 80px; height: 25px;">居住证结束时间：</td>
								<td align="left" style="width: 100px;">
									<input name="omIntendJoin.resienddate" width="100%" class="nui-datepicker" />
								</td>
								<td align="right" style="width: 80px; height: 25px;">居住证年限：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.resilimit" onvalidation="checkInt(e,2)" width="100%" class="nui-textbox" />
								</td>
								<td align="right" style="width: 80px; height: 25px;">原福利缴纳省市：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.origwelfarprovin" width="106%" class="nui-dictcombobox" shownullItem="true" dictTypeId="AREA4CLRY" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 80px; height: 25px;">公积金账号：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.fundno" width="100%"  onvalidation="checkLength(e,'公积金账号',30)"  id ="fundno" class="nui-textbox" />
								</td>
								<td align="right" style="width: 80px; height: 25px;">补充公积金账号：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.addfundno" width="100%" onvalidation="checkLength(e,'补充公积金账号',30)"  id="addfundno" class="nui-textbox" />
								</td>
								<td align="right" style="width: 80px; height: 25px;">婚姻状况：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.marristatus" width="106%" class="nui-dictcombobox" dictTypeId="ABF_MARRITYPE" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 80px; height: 25px;">未成年子女姓名：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.nonagename" width="100%" class="nui-textbox" onvalidation="checkLength(e,'未成年子女姓名',10)"/>
								</td>
								<td align="right" style="width: 80px; height: 25px;">未成年子女性别：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.nonagesex" width="100%" class="nui-dictcombobox" dictTypeId="ABF_GENDER" />
								</td>
								<td align="right" style="width: 80px; height: 25px;">未成年子女出生年月：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.nonagebirth" width="106%" class="nui-datepicker" />
								</td>
							</tr>
						</table>
					</div>
				</fieldset>
				<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<legend>银行卡信息</legend>
					<div style="padding: 5px;">
						<table style="width:98%;">
							<tr>
								<td align="left" style="width: 100%;color:red;padding-left:5.4%;" colspan='4'>请提供本人名下招商银行和浦发银行卡用于工资和报销的发放，如目前无法提供，请尽快办理并在入职后提供。</td>
							</tr>
							<tr>
								<td align="right" style="width: 12%; height: 25px;">招商银行卡号：</td>
								<td align="left" style="width:58px;">
									<input name="omIntendJoin.cmbcardno" id="cmbcardno" onvalidation="checkBankCardNo(e,this)" width="91%" class="nui-textbox"/>
								</td>
								<td align="right" style="width: 25px; height: 25px;">浦发银行卡号：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.pfbankcardno" id="pfbankcardno" onvalidation="checkBankCardNo(e,this)" width="38%" class="nui-textbox"/>
								</td>
							</tr>
						</table>
					</div>
				</fieldset>
				<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<legend>PCF信息</legend>
					<div style="padding: 5px;">
						<table style="width:98%;" id="pcf">
							<tr>
								<td align="left" style="width: 100%;color:red;padding-left: 4.1%;" colspan='4'>1、PCF（普元慈善基金会）是公司公益慈善组织，致力于持续资助贫困山区的孩子上学、捐书、捐物等，目前已经圆了40多名孩子的上学梦，在持续资助下，有的孩子完成了小学、中学的学业，进入了大学。</td>
							</tr>
							<tr>
								<td align="left" style="width: 100%;color:red;padding-left: 4.1%;" colspan='4'>2、PCF秉承自愿参加的原则，捐款的比例可以是“每月”工资的比例（如工资的0.1%-1%），也可以是“每月”固定金额（如50元、100元）。公司已经有很多人员是PCF成员，也热切期待你的加入，为贫困孩子的上学梦尽一份绵薄之力！</td>
							</tr>
							<tr>
								<td align="right" style="width: 12%; height: 25px;">是否自愿加入PCF：</td>
								<td align="left" style="width: 58px;">
									<input name="omIntendJoin.isjoinpcf" id="isjoinpcf" width="91%" class="nui-dictcombobox" onvaluechanged="changePCF(this.value)" dictTypeId="MIS_YN" required="true"/>
								</td>
								<td align="right" style="width: 25px; height: 25px;">月捐金额：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.pcfamount" id ='pcfamount' class="nui-spinner" format="n2" width="38%" allowLimitValue="false" changeOnMousewheel="false" showbutton="false" required="true" />
								</td>
								<td align="right" style="width: 25px; height: 25px; display:none;"></td>
								<td align="left" style="width: 140px; display:none;"></td>
							</tr>
						</table>
					</div>
				</fieldset>
<!-- 				<div style="margin-right: 25%;padding: 5px;">
					<table style="width: 100%;">
						<tr>
							<td align="right" style="width: 16px; height: 25px;">工作电脑是否自备：</td>
							<td align="left" style="width: 50px;">
								<input name="omIntendJoin.isTakePC" width="84%" id="isTakePC"
								class="nui-dictcombobox" dictTypeId="MIS_YN" required="true" onvaluechanged="changePC(this.value)"/>
							</td>
							<td align="left" style="width: 80px; color:red; height: 25px;" >自备工作电脑，公司每月提供180元的电脑补贴，在每月的工资中发放。</td>
						</tr>
					</table>
				</div>
				<fieldset style="border: solid 1px #aaa; padding:3px;" id="pc">
					<legend>办公电脑</legend>
					<div style="padding: 5px;">
						<table style="width: 98%;">
							<tr>
								<td align="right" style="width: 80px; height: 25px;">电脑品牌：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.brands" id="brands" width="100%" class="nui-textbox"/>
								</td>
								<td align="right" style="width: 80px; height: 25px;">型号：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.modelNo" id="modelNo" width="100%" class="nui-textbox"/>
								</td>
								<td align="right" style="width: 80px; height: 25px;">购买日期：</td>
								<td align="left" style="width: 140px;">
									<input id ="buyDate" name="omIntendJoin.buyDate" id="buyDate" width="100%" class="nui-datepicker" />
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 80px; height: 25px;">CPU：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.cpu" id="cpu" width="100%" class="nui-textbox" />
								</td>
								<td align="right" style="width: 80px; height: 25px;">内存（G）：</td>
								<td align="left" style="width: 140px;">
									<input property="editor" name="omIntendJoin.ram"  id="ram" class="nui-spinner" vtype="int" minValue="0" maxValue="32" value="4" width="100%"/>
								</td>
								<td align="right" style="width: 80px; height: 25px;">序列号：</td>
								<td align="left" style="width: 140px;">
									<input name="omIntendJoin.serialNumber" id="serialNumber" width="100%" class="nui-textbox" />
								</td>
							</tr>
						</table>
					</div>
				</fieldset> -->				
				<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<legend>入职材料相关附件</legend>
					<div style="padding: 5px;">
						<span style="color:red; padding-left:3px;">请上传入职相关文件：离职证明（离职日期在入职日期之前）、体检报告，原件和其他入职资料（参阅入职须知）一并在入职时提交</span>
						<jsp:include page="/ame_common/addFiles1.jsp"/>
						<jsp:include page="/ame_common/detailFile.jsp"/>
					</div>
				</fieldset>
				<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<legend>学历信息：<span style="color: red;">请您务必从高中（或中专）学历开始填写！</span></legend>
					<div style="padding: 5px;">
						<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
							<table style="width: 100%;">
								<tr>
									<td style="width: 20%;">
										<a class="nui-button" id="addbtn" iconCls="icon-add" 
										onclick="addRow('grid_degreeDetail')">增加</a>
										<a class="nui-button" id="deltbtn" iconCls="icon-remove"
										onclick="removeRow('grid_degreeDetail')">删除</a>
									</td>
								</tr>
							</table>
						</div>
						<div id="grid_degreeDetail" class="nui-datagrid"
							style="width: 100%; height: auto;" dataField="edus"
							allowCellSelect="true" showPager="false" allowCellEdit="true"
							multiSelect="true" editNextOnEnterKey="true"
							allowSortColumn="true" allowCellWrap="true"
							url="org.gocom.abframe.org.employee.Education.getEducationByName.biz.ext">
							<div property="columns">
								<div type="checkcolumn" width="20px">&nbsp;</div>
								<div field="startdate" width="30" align="center"
									headerAlign="center" renderer="onDealDate"
									dateFormat="yyyy-MM-dd" allowSort="true">开始时间 
									<input property="editor" class="nui-datepicker"
										ondrawdate="checkDate" required="true" />
								</div>
								<div field="enddate" width="30" align="center"
									headerAlign="center" renderer="onDealDateS"
									dateFormat="yyyy-MM-dd">终止时间
									<input property="editor" class="nui-datepicker" required="true" />
								</div>
								<div field="degree" renderer="getDegree" width="55" align="center" headerAlign="center">学历
									<input property="editor" class="nui-dictcombobox" dictTypeId="DEGREE" required="true" onvaluechanged="fillProfession" />
								</div>
								<div field="graduschool" width="70" align="left" headerAlign="center">毕业院校
									<input property="editor" class="nui-textbox" required="true" maxLength="30" maxLengthErrorText="不能超过 {30} 个字符"/>
								</div>
								<div field="profession" width="85" align="left" headerAlign="center">专业
									<input property="editor" class="nui-textbox" maxLength="40"/>
								</div>
							</div>
						</div>
					</div>
				</fieldset>
				<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<legend>工作经历：<span style="color: red;">请您从毕业之后签订全日制合同开始时间填写，且开始时间为社会工作开始时间，如不完善会让您重新补充填写！</span></legend>
					<div style="padding: 5px;">
						<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
							<table style="width: 100%;">
								<tr>
									<td style="width: 20%;">
										<a class="nui-button" id="addbtn" iconCls="icon-add" 
										onclick="addRow('grid_workDetail')">增加</a>
										<a class="nui-button" id="deltbtn" iconCls="icon-remove"
										onclick="removeRow('grid_workDetail')">删除</a>
									</td>
								</tr>
							</table>
						</div>
						<div id="grid_workDetail" class="nui-datagrid"
							style="width: 100%; height: auto;" dataField="workExp"
							allowCellSelect="true" showPager="false" allowCellEdit="true"
							multiSelect="true" editNextOnEnterKey="true"
							allowSortColumn="true" allowCellWrap="true"
							url="com.primeton.eos.ame_resume.resumeManage.getWorkExp.biz.ext">
							<div property="columns">
								<div type="checkcolumn" width="20px">&nbsp;</div>
								<div field="startdate" width="30" align="center"
									headerAlign="center" renderer="onDealDate"
									dateFormat="yyyy-MM">开始年月
									<input property="editor" class="nui-monthpicker"
										ondrawdate="checkDate" required="true" />
								</div>
								<div field="enddate" width="30" align="center"
									headerAlign="center" renderer="onDealDateS"
									dateFormat="yyyy-MM">终止年月 
									<input property="editor" class="nui-monthpicker" ondrawdate="checkDate" required="true" />
								</div>
								<div field="companyname" width="55" align="left"
									headerAlign="center">工作单位 
									<input property="editor" class="nui-textbox"
										required="true" maxLength="100" />
								</div>
								<div field="duty" width="70" align="left"  headerAlign="center">职务 
									<input property="editor" maxLength="200" class="nui-textbox" required="true" />
								</div>
								<div field="workdescription" width="85" align="left"
									headerAlign="center">主要职责 
									<input property="editor" class="nui-textarea" maxLength="300" style="width: 200px" minWidth="200" minHeight="80" />
								</div>
							</div>
						</div>
					</div>
				</fieldset>
				<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<legend>项目经历：<span style="color: red;">请完善您的所有项目经历作为个人履历！</span></legend>
					<div style="padding: 5px;">
						<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
							<table style="width: 100%;">
								<tr>
									<td style="width: 20%;">
										<a class="nui-button" id="addbtn" iconCls="icon-add" 
										onclick="addRow('grid_projectDetail')">增加</a>
										<a class="nui-button" id="deltbtn" iconCls="icon-remove"
										onclick="removeRow('grid_projectDetail')">删除</a>
									</td>
								</tr>
							</table>
						</div>
						<div id="grid_projectDetail" class="nui-datagrid"
							style="width: 100%; height: auto;" dataField="projExp"
							allowCellSelect="true" showPager="false" allowCellEdit="true"
							multiSelect="true" editNextOnEnterKey="true"
							allowSortColumn="true" allowCellWrap="true"
							url="com.primeton.eos.ame_resume.resumeManage.getProjExp.biz.ext">
							<div property="columns">
								<div type="checkcolumn" width="20px">&nbsp;</div>
								<div field="beginenddate" width="30" align="center"
									headerAlign="center" 
									dateFormat="yyyy-MM">开始年月 
									<input property="editor" class="nui-monthpicker"
										ondrawdate="checkDate" required="true" />
								</div>
								<div field="enddate" width="30" align="center"
									headerAlign="center" renderer="onDealDateS"
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
								 <input property="editor" class="nui-textarea" maxLength="200"  style="width: 200px" minWidth="200" minHeight="80" />
								</div>
							</div>
						</div>
					</div>
				</fieldset>
				<fieldset style="border: solid 1px #aaa; padding: 3px;">
					<legend>有关资质证书：<span style="color: red;">为了登记您的职业技能等级，请填写您持有的资质证书信息，同时上传资质证书扫描件或者照片（尽量规整）！</span></legend>
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
					<div id="grid_cert" class="nui-datagrid"
						style="width: 100%; height: auto;" dataField="cert"
						showPager="false" allowCellEdit="true" allowCellSelect="true"
						allowSortColumn="true" allowCellWrap="true"
						multiSelect="true" editNextOnEnterKey="true"
						url="com.primeton.eos.ame_resume.resumeManage.getCert.biz.ext">
						<div property="columns">
							<div type="checkcolumn" width="20px"></div>
							<div field="cardtype" width="60" headerAlign="center"
								align="center" renderer="onCertTypeRenderer">
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
							<div field="files" renderer="onFileRenderer" width="200" hight="100"  align="left" headerAlign="center">附件</div>
			                <div field="fileid" displayField="filename" width="200" headerAlign="center" align="left" visible="false">附件
			                	<input property="editor" class="nui-hidden" style="width: 200px" minWidth="200" minHeight="80" />
			                </div>
							<div field="remark" width="150" headerAlign="center" align="left">
								备注 <input property="editor" class="nui-textarea"
									style="width: 200px" minWidth="200" maxLength="280"  minHeight="80" />
							</div>
						</div>
					</div>
				</fieldset>
			</div>
		</div>
	</div>
	<fieldset style="border: solid 1px #aaa; padding: 3px;display:none;">
		<!-- 审核意见  -->
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</fieldset>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk('0')" iconCls="icon-save" id="oktemp" style="width:90px;margin-right:16px;">暂时保存</a>
	    <a class="nui-button" onclick="onOk('1')" id="okbutton" iconCls="icon-ok" style="width:90px;margin-right:50px;">确认提交</a>
	</div> 
	<div id="tips" style="position:absolute;border:1px solid rgb(233, 239, 246);padding:0px 3px;color:#f00;display:none;height:auto;line-height:20px;background:rgb(255, 255, 255);">
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	//var fields = form.getFieldsMap();
	var grid_degreeDetail = nui.get("grid_degreeDetail");//行程列表
	var grid_workDetail = nui.get("grid_workDetail");//行程列表
	var grid_projectDetail = nui.get("grid_projectDetail");//行程列表
	var grid_cert = nui.get("grid_cert");//行程列表
	var currentState='other';//流程状态
	var intendid;
	var phoneNumber =<%=phoneNumber%>;
	var workItemID =<%=workItemID%>;
	var participant;//当前流程参与人
	var processInstID;//流程实例编号
	var intendInfo;
	//document.getElementById('pc').style.display="none";
	initData();
	var isAuthUser =false;
	function initData(){
		//form.mask("数据加载中...");
		if(!!workItemID){
			promptInit({workItemID:workItemID});//流程提示信息
		}
		nui.get("intendname").disable();
		nui.get("mobileno").disable();
		nui.get("intendworkplace").disable();
		var json = nui.encode({"phoneNumber":phoneNumber,"workItemID":workItemID});
		nui.ajax({
			url: "org.gocom.abframe.org.intendstaff.addIntendStaffInfo.queryIntendInfo.biz.ext",
			data: json,
			type: 'POST',
			cache: false,
			contentType: 'text/json',
			success: function(text){
				currentState = text.currentState; 
				participant = text.participant; 
				processInstID =text.processInstID;//流程实例编号
				if(text.retValue==0&&(currentState==4||currentState==10)){//4-任务待领取；10-流程运行状态
					var users= text.participant;//获取当前流程参与者
					isAuthUser = judgeIsHaveRight(users);
					if(!isAuthUser){
						nui.get("okbutton").disable();
						nui.get("oktemp").disable();
			    		nui.alert("没有该流程操作权限，请联系招聘人员！");
						return false;
					}
					intendInfo =text.intendInfo;
					intendid = intendInfo.intendid;
					resumeid = text.resume.resumeid
					grid_degreeDetail.load({resumeid:resumeid});
		            grid_degreeDetail.sortBy("startdate", "desc");
		            grid_workDetail.load({resumeid:resumeid});
		            grid_workDetail.sortBy("startdate", "desc");
		            grid_projectDetail.load({resumeid:resumeid});
		            grid_projectDetail.sortBy("beginenddate", "desc");
		            grid_cert.load({resumeid:resumeid});
		            grid_cert.sortBy("startdate", "desc");
		            nui.get("grid_0").load({"groupid":"omIntendJoinInfo","relationid":intendid});
		            //changePC(intendInfo.isTakePC);//初始化自备电脑信息
		            changePCF(intendInfo.isjoinpcf);//初始化PCF信息
					var pcfamount = intendInfo.pcfamount;
					if(!pcfamount){
						intendInfo.pcfamount=0;
					}
					form.setData({omIntendJoin:intendInfo,resume:text.resume});
					//根据身份证号码初始化出生日期
					setBirthDate();
					//审批意见的流程实例ID
					nui.get("processinstid").setValue(text.workitem.processInstID);
	               	nui.get("processinstname").setValue(text.workitem.processInstName);
	               	nui.get("activitydefid").setValue(text.workitem.activityDefID);
	               	nui.get("workitemname").setValue(text.workitem.workItemName);
					nui.get("workitemid").setValue(workItemID);
	               	nui.get("isshow").setValue("1");
	               	//nui.get("backTo").setData(o.omIntendJoin.backList);
	            	//初始化处理意见
					initMisOpinion({auditstatus:"1"});
					initDict();
    			}else if(text.retValue==1){
    				nui.get("okbutton").disable();
    				nui.get("oktemp").disable();
    				nui.alert("数据校验不通过，请联系招聘人员！");
    			}else if(text.retValue==0&&!(currentState==4||currentState==10)){
    				nui.get("okbutton").disable();
    				nui.get("oktemp").disable();
    				nui.alert("个人信息已填写提交，请勿重复提交！");
    			}else{
    				nui.alert("系统异常，请联系招聘人员！");
    			}
			},
			error: function(jqXHR, textStatus, errorThrown){
				nui.alert(jqXHR.responseText);
			}
		});
	}
	
	function fillProfession(e){
		var degree = e.value;
		var row = grid_degreeDetail.getSelected();
		var rowData = {"profession":""};
		if(degree=='5'||degree=='0'){//高中、中专
			rowData = {"profession":"无"};
		}else{
			rowData = {"profession":""};
		}
		grid_degreeDetail.updateRow(row,rowData);
	}
	
	//初始化户口所在省市以及档案所在省市的数据字典，过滤掉省份
	function initDict(){
		var json = nui.encode({"filter1":'0'});//过滤条件，业务参数1
		nui.ajax({
    		url: "org.gocom.abframe.org.intendstaff.addIntendStaffInfo.queryDictMisArea.biz.ext",
    		data: json,
    		type: 'POST',
			cache: false,
            async:false,
			contentType: 'text/json',
			success: function(text){
				nui.get("residence").setData(text.data);
				nui.get("filecity").setData(text.data);
			},
			error: function(jqXHR, textStatus, errorThrown){
				console.log(jqXHR.responseText);
			}
    	});
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
	
	/* function changePC(value){
		if(!!value){
			if(value==1){//是
				document.getElementById('pc').style.display="block";
				nui.get("brands").setRequired(true);    
				nui.get("modelNo").setRequired(true);
				nui.get("buyDate").setRequired(true);    
				nui.get("cpu").setRequired(true); 
				nui.get("ram").setRequired(true);    
				nui.get("serialNumber").setRequired(true);   
			}else{
				document.getElementById('pc').style.display="none";
				nui.get("brands").setRequired(false);    
				nui.get("modelNo").setRequired(false);
				nui.get("buyDate").setRequired(false);    
				nui.get("cpu").setRequired(false); 
				nui.get("ram").setRequired(false);    
				nui.get("serialNumber").setRequired(false);  
			}
		}
	} */
	 //判断当前登录员工是否有操作当前流程的权限
   function judgeIsHaveRight(users){
      	var currentUser=nui.getDictText("AME_VISITOR","account");
      	if(users){
      		if(users.indexOf('\|')!=-1){
      			var userArray = users.split('\|');
      			if(userArray.indexOf(currentUser)!=-1){
      				return true;
      			}else{
      				return false;
      			}
      		}else if(users==currentUser){
      			return true;
      		}else{
      			return false;
      		}
      	}
      	return false;
    }
    var isTempSave;
	function onOk(flag){
		isTempSave = flag;
	 	if(!isAuthUser){
			nui.get("okbutton").disable();
			nui.get("oktemp").disable();
    		nui.alert("没有该流程操作权限，请联系招聘人员！");
			return false;
		}
	 	if(flag==0){//暂时保存
	 		/* var isTakePC=nui.get("isTakePC").getValue();
			if(!!isTakePC){
				if(isTakePC==0){//否
					nui.get("brands").setValue();//电脑品牌
					nui.get("modelNo").setValue();//电脑型号
					nui.get("buyDate").setValue();//电脑购买日期
					nui.get("cpu").setValue();//电脑cpu
					nui.get("ram").setValue();//电脑内存
					nui.get("serialNumber").setValue();//电脑序列号
				}
			} */
	 		document.getElementById("fileCatalog1").value="omIntendJoinInfo";
			form4.submit();
	 	}else{//保存。同时完成此环节的流程
	 		var isjoinpcf=nui.get("isjoinpcf").getValue();
	 		var pcfamount = nui.get("pcfamount").getValue();
	 		if(!!isjoinpcf){
		 		 if(isjoinpcf==1){//加入普元PCF
		 			if(pcfamount <= 0){
			    		nui.alert("PCF捐款金额需大于0");
			    		return false;
		    		}
		 		 }
	 		}
	 		/* if(!checkComputer()){//校验电脑配置项
	 			return false;
	 		} */
			//入职材料需上传校验
			var filesData = nui.get("grid_0").getData();
			if(filesData.length==0){
				var filePaths = document.getElementsByName("uploadfile1").length;
				if(filePaths==0){
					nui.alert("请您上传入职材料相关附件！");
					return false;
				}
		    	for(var j = 0;j<filePaths;j++){
		    		var content = document.getElementsByName("remarkList1")[j].value;
		    		if(!content){
						nui.alert("请您上传入职材料相关附件！");
						return false;
					}
		    	}
			}
			//学历信息
			var degreeExp = nui.get("grid_degreeDetail").getData();
			if(degreeExp.length==0){
				nui.alert("请填写您的学历信息！");
				return false;
			}
			var highSchool;
			for(var i=0;i<degreeExp.length;i++){
				if(degreeExp[i].startdate == '' || degreeExp[i].startdate == null){
					nui.alert("学历信息中的“开始时间”是必填项，请完善您的学历信息！");
					return false;
				}
				if(degreeExp[i].enddate == '' || degreeExp[i].enddate == null){
					nui.alert("学历信息中的“终止时间”是必填项，请完善您的学历信息！");
					return false;
				}
				if(degreeExp[i].degree == '' || degreeExp[i].degree == null){
					nui.alert("学历信息中的“学历”是必填项，请完善您的学历信息！");
					return false;
				}
				if(degreeExp[i].graduschool == '' || degreeExp[i].graduschool == null){
				   nui.alert("学历信息中的“毕业院校”是必填项，请完善您的学历信息！");
				   return false;
			    }
			    if(degreeExp[i].profession == '' || degreeExp[i].profession == null){
				   nui.alert("学历信息中的“专业”是必填项，请完善您的学历信息！");
				   return false;
				}
			   	if(degreeExp[i].degree=='5'||degreeExp[i].degree=='0'){//高中、中专
			   	   highSchool= degreeExp[i].degree;
			   	}
			}
			if(!(highSchool=='5'||highSchool=='0')){
				 nui.alert("学历信息需从“高中（或中专）”填起，请完善您的学历信息！");
				 return false;
			}
			//工作经历
			var workExp = nui.get("grid_workDetail").getData();
			var d;
			for(var i=0;i<workExp.length;i++){
				d=i;
				d=d+1;
				if(workExp[i].startdate == '' || workExp[i].startdate == null ||
				   workExp[i].enddate == '' || workExp[i].enddate == null ||
				   workExp[i].companyname == '' || workExp[i].companyname == null ||
				   workExp[i].duty == '' || workExp[i].duty == null ||
				   workExp[i].workdescription == '' || workExp[i].workdescription == null){
				   nui.alert("工作经历第"+d+"条有漏填项，请您完善您的工作经历信息！");
				   return false;
			   }
			}
			//项目经历
			var c;
			var projExp = nui.get("grid_projectDetail").getData();
			for(var i=0;i<projExp.length;i++){
				c=i;
				c=c+1;
				if(projExp[i].beginenddate == '' || projExp[i].beginenddate == null ||
				   projExp[i].enddate == '' || projExp[i].enddate == null ||
				   projExp[i].projectname == '' || projExp[i].projectname == null ||
				   projExp[i].projectintroduce == '' || projExp[i].projectintroduce == null ||
				   projExp[i].projectduty == '' || projExp[i].projectduty == null ){
				   nui.alert("项目经历第"+c+"条有漏填项，请您完善您的项目经历信息！");
				   return false;
			   }
			}
			//有关资质证书信息
			var cert = nui.get("grid_cert").getData();
			var b;
			for(var i=0;i<cert.length;i++){
				b=i;
				b=b+1;
				if(cert[i].cardtype == '' || cert[i].cardtype == null){
					nui.alert("有关资质证书的“证件（证书）类型”是必填项，请完善您的有关资质证书信息！");
					return false;
				}
				if(cert[i].cardno == '' || cert[i].cardno == null){
					nui.alert("有关资质证书的“证件号码”是必填项，请完善您的有关资质证书信息！");
					return false;
				}
				if(cert[i].startdate == '' || cert[i].startdate == null){
					nui.alert("有关资质证书的“有效开始日期”是必填项，请完善您的有关资质证书信息！");
					return false;
				}
				if(cert[i].enddate == '' || cert[i].enddate == null){
					nui.alert("有关资质证书的“有效截止日期”是必填项，请完善您的有关资质证书信息！");
					return false;
				}
				if(cert[i].files.length==0){
				   	nui.alert("有关资质证书的第"+b+"条没有上传资质证书附件，请完善您的有关资质证书信息！");
				   	return false;
				}
			}
	 		form.validate();
	 		if(form.isValid()){
		 		if(workExp.length==0||projExp.length==0){
		 			nui.confirm("请确定您是否已经完成所有正式合同工作经历和项目经历？","保存提示",function(action){
						if(action == "ok"){
							nui.confirm("请确认已上传离职证明、体检报告等入职资料，是否提交您所填写的信息？","保存提示",function(action){
								if(action == "ok"){
									document.getElementById("fileCatalog1").value="omIntendJoinInfo";
									form4.submit();
								}
							});
						}
					});
		 		
		 		}else{
		 			nui.confirm("请确认已上传离职证明、体检报告等入职资料，是否提交您所填写的信息？","保存提示",function(action){
						if(action == "ok"){
							document.getElementById("fileCatalog1").value="omIntendJoinInfo";
							form4.submit();
						}
					});
		 		}
			}else{
				nui.alert("您还有必填项没有填写！");
			}
	 	}
	}
	//上传文件页面流走完之后会回调此函数
	function SaveData1(){
		nui.get("okbutton").disable();
		nui.get("oktemp").disable();
		var omIntendJoinInfo = form.getData();
		//学历信息
		var degreeExp = nui.get("grid_degreeDetail").getChanges();
		//工作经历
		var workExp = nui.get("grid_workDetail").getChanges();
		//项目经历
		var projectWork = nui.get("grid_projectDetail").getChanges();
		//有关资质证书
		var cert = nui.get("grid_cert").getChanges();
		//登录之后根据手机号查询拟入职人员表，同时把招聘专员填写的一些拟入职人员信息带过来。
		omIntendJoinInfo.omIntendJoin.intendid=intendid;
		var isjoinpcf = omIntendJoinInfo.omIntendJoin.isjoinpcf;
		if(isjoinpcf==0){//不愿加入普元PCF，将捐款金额置为0;
			omIntendJoinInfo.omIntendJoin.pcfamount=0;
		}
		//流程审批意见处理信息
		var misOpinion = opioionform.getData();
		//流程处理意见
		misOpinion.misOpinion.orgid=intendInfo.inorgid;
		misOpinion.misOpinion.operatorname=intendInfo.intendname;
		misOpinion.misOpinion.auditopinion="提交。";
		var json = nui.encode({"AmeOmIntendJoinInfo":omIntendJoinInfo.omIntendJoin,"resume":omIntendJoinInfo.resume, "AmeDegreeExp":degreeExp, "AmeWorkExp":workExp, "AmeProjectWork":projectWork,"AmeCert":cert,"workitemId":workItemID,"flag":isTempSave,"processInstID":processInstID,"misOpinion":misOpinion.misOpinion});
		nui.ajax({
			url: "org.gocom.abframe.org.intendstaff.addIntendStaffInfo.addIntendSatffInfo.biz.ext",
			data: json,
			type: 'POST',
			cache: false,
			contentType: 'text/json',
			success: function(text){
				if(text.returnVal==0){
					if(isTempSave==0){//暂时保存
						//重新刷新表格避免对此点击暂存时，保存重复数据
						grid_degreeDetail.reload();
			            grid_workDetail.reload();
			            grid_projectDetail.reload();
			            grid_cert.reload();
			            nui.get("grid_0").reload();
			            document.getElementById('filetable1').innerHTML = "";
			            nui.get("okbutton").enable();
						nui.get("oktemp").enable();
			            nui.alert("个人信息填写暂存成功！");
					}else{
						nui.get("okbutton").disable();
						nui.get("oktemp").disable();
						//nui.alert("个人信息填写完成");
						nui.confirm("个人信息已提交，感谢你的配合与支持，是否返回首页？","操作提示",function(action){
							if(action == "ok"){
								//返回首页
								window.location.href="/default/ame/login/visitor_login.jsp";
							}
						});
					}
    			}else if(text.returnVal==1){
    				nui.get("okbutton").enable();
    				nui.get("oktemp").disable();
    				nui.alert("更新基本信息失败，请重新尝试！");
    			}else if(text.returnVal==2){
    				nui.get("okbutton").enable();
    				nui.get("oktemp").disable();
    				nui.alert("增加教育经历失败，请重新尝试！");
    			}else if(text.returnVal==4){
    				nui.get("okbutton").enable();
    				nui.get("oktemp").disable();
    				nui.alert("增加项目经验失败，请重新尝试！");
    			}else if(text.returnVal==5){
    				nui.get("okbutton").enable();
    				nui.get("oktemp").disable();
    				nui.alert("增加证件信息失败，请重新尝试！");
    			}else if(text.returnVal==6){
    				nui.get("okbutton").enable();
    				nui.get("oktemp").disable();
    				nui.alert("流程提交异常，请联系招聘人员！");
    			}else if(text.returnVal==-1){
    				nui.get("okbutton").enable();
    				nui.get("oktemp").disable();
    				nui.alert("身份校验失败，请联系招聘人员！");
    			}else{
    				nui.get("okbutton").enable();
    				nui.get("oktemp").disable();
    				nui.alert("增加个人信息失败，请重新尝试！");
    			}
			},
			error: function(jqXHR, textStatus, errorThrown){
				nui.alert(jqXHR.responseText);
			}
		});
	}
	
	/* function checkComputer(){
		var isTakePC=nui.get("isTakePC").getValue();
		if(!!isTakePC){
			if(isTakePC==1){//是
				var brands=nui.get("brands").getValue();//电脑品牌
				var modelNo=nui.get("modelNo").getValue();//电脑型号
				var buyDate=nui.get("buyDate").getValue();//电脑购买日期
				var cpu=nui.get("cpu").getValue();//电脑cpu
				var ram=nui.get("ram").getValue();//电脑内存
				var serialNumber=nui.get("serialNumber").getValue();//电脑序列号
				if(!brands){
					nui.alert("请填写您的电脑品牌！");
					return false;
				}
				if(!modelNo){
					nui.alert("请您填写您的电脑型号！");
					return false;
				}
				if(!buyDate){
					nui.alert("请您填写您的电脑购买日期！");
					return false;
				}
				if(!cpu){
					nui.alert("请您填写您的电脑CPU型号！");
					return false;
				}
				if(!ram){
					nui.alert("请您填写您的电脑内存！");
					return false;
				}
				if(!serialNumber){
					nui.alert("请您填写您的电脑序列号！");
					return false;
				}
				return true;
			}else{
				nui.get("brands").setValue();//电脑品牌
				nui.get("modelNo").setValue();//电脑型号
				nui.get("buyDate").setValue();//电脑购买日期
				nui.get("cpu").setValue();//电脑cpu
				nui.get("ram").setValue();//电脑内存
				nui.get("serialNumber").setValue();//电脑序列号
				return true;
			}
		}
	} */
	function checkLength(e,title,number){
		 if (e.isValid) {
		 	var value = e.value;
		 	if(!!value){
				var length = value.length;
				if(length>number){
					e.errorText = title+"的长度不能超过"+number+"个字符！";
	                e.isValid = false;
					nui.alert(title+"的长度不能超过"+number+"个字符！");
				}
			}
        }
	}
	//添加table行
    function addRow(gridid){
		var newRow = { name: "New Row"};
        var grid = nui.get(gridid);
        grid.addRow(newRow, 0);
	}
	
	//删除table行
	function removeRow(gridid){
		var grid = nui.get(gridid);
        var rows = grid.getSelecteds();
        var num = rows.length
        if (rows.length > 0) {
        	nui.confirm("确定删除选择的"+num+"条记录吗？","删除提示",function(action){
				if(action == "ok"){
					grid.removeRows(rows, true);
				}
			});
        }else{
			nui.showMessageBox({
	            title: "操作提示",
	            iconCls: "nui-messagebox-question",
	            buttons: ["yes"],
	            message: "至少选择一条需要删除的记录！",
	            callback: function (action) {
	                if(action=="yes"){
	                }
	            }
	        });
        }
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
    
	function addCert(){
		nui.open({
			url: "<%=request.getContextPath() %>/abframe/org/intendstaff/addCertDetail.jsp",
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
							var grid = nui.get('grid_cert');
							grid.addRow(newRow);
                    	}else{
                    		var json = nui.encode({"fileid":fileid});
                        	nui.ajax({
				    			url: "org.gocom.abframe.org.intendstaff.addIntendStaffInfo.queryUploadFiles.biz.ext",
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
									var grid = nui.get('grid_cert');
									grid.addRow(newRow);
				    			}
				    		});
                    	}
                    }
                }
            }
		});
	}
	
	function updateCert(){
		var rows = grid_cert.getSelecteds();
		if (rows.length > 1){
			nui.alert("只能选中一条记录进行编辑！");
    	}else{
            var row = grid_cert.getSelected();
            if(row){
            	var remark = row.remark;
            	var fileid = row.fileid;
            	var files = row.files;
            	var enddate = row.enddate;
            	var startdate = row.startdate;
            	var cardno = row.cardno;
            	var cardtype = row.cardtype;
            	var certid = row.certid;
            	nui.open({
					url: "<%=request.getContextPath() %>/abframe/org/intendstaff/addCertDetail.jsp?",
	                title: "修改证书详情",
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
	                        		var json = nui.encode({"certid":""});
	                        		nui.ajax({
						    			url: "org.gocom.abframe.org.intendstaff.addIntendStaffInfo.queryUploadFiles.biz.ext",
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
											var grid = nui.get('grid_cert');
											grid.updateRow(row,updateRow);
						    			}
						    		});
	                        	}else{
	                        		var json = nui.encode({"certid":certid,"fileid":fileid});
		                        	nui.ajax({
						    			url: "org.gocom.abframe.org.intendstaff.addIntendStaffInfo.queryUploadFiles.biz.ext",
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
											var grid = nui.get('grid_cert');
											grid.updateRow(row,updateRow);
						    			}
						    		});
	                        	}
	                        }
	                    }
	                }
				});
            }else{
            	nui.alert("请选中一条记录！");
            }
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
	
	function checkDate(e){
		var date = e.date;
        var d = new Date();
        var s = date.getTime() + 24*60*60*1000;
        if (s > d.getTime()) {
            e.allowSelect = false;
        }
	} 
	//备注不能过长
	function onViewL(e){
		if(e.field == "remark"){
			if(e.value){
				if(e.value.length >199){
					nui.alert("输入过长！");
					e.value = '';
					e.row.remark='';
					return;
				}else{
					return e.value;
				}
			}
		}
	}
	//根据身份证号码初始化生日
	function setBirthDate(){
		var cardtype = nui.get("cardtype").getValue();
		var cardno = nui.get("cardno").getValue();
		if(cardtype == "id"){
			if(!!cardno){
				if(!(/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(cardno))){
					return false;
            	}
				//根据身份证号码自动回显出生日期
				var birthdate = nui.get("birthdate").getValue();
				var day = cardno.substring(cardno.length-12,cardno.length-8) + "-" + cardno.substring(cardno.length-8,cardno.length-6) + "-" + cardno.substring(cardno.length-6,cardno.length-4);
				nui.get("birthdate").setValue(day);
			}
		}
	}
	//检查身份证号
	function changeCheckcardno(e){
		var cardtype = nui.get("cardtype").getValue();
		var cardno = nui.get("cardno").getValue();
		if(cardtype == "id"){//证件类型为身份证号
			if(!!cardno){
				if(!(/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(cardno))){
	               	nui.alert("身份证号码格式不正确！");
					return false;
            	}
				//根据身份证号码自动回显出生日期
				var birthdate = nui.get("birthdate").getValue();
				var day = cardno.substring(cardno.length-12,cardno.length-8) + "-" + cardno.substring(cardno.length-8,cardno.length-6) + "-" + cardno.substring(cardno.length-6,cardno.length-4);
				nui.get("birthdate").setValue(day);
			}
		}else{
			if(!!cardno){
				var length = cardno.length;
				if(length>20){
					nui.alert("证件号码的长度不能超过20个字符！");
					return false;
				}
			}
		}
	}
	function checkcardno(e){
		var cardtype = nui.get("cardtype").getValue();
		var cardno = nui.get("cardno").getValue();
		var message="";
		if(e.isValid) {
			if(cardtype == "id"){//证件类型为身份证号
				if(!!cardno){
					if(!(/^\d{6}(18|19|20)?\d{2}(0[1-9]|1[012])(0[1-9]|[12]\d|3[01])\d{3}(\d|X)$/i.test(cardno))){
		               	message ="身份证号码格式不正确！";
			        	e.errorText = message;
	               		e.isValid = false;
	               		nui.alert(message);
						return false;
	            	}
					//根据身份证号码自动回显出生日期
					var birthdate = nui.get("birthdate").getValue();
					var day = cardno.substring(cardno.length-12,cardno.length-8) + "-" + cardno.substring(cardno.length-8,cardno.length-6) + "-" + cardno.substring(cardno.length-6,cardno.length-4);
					nui.get("birthdate").setValue(day);
				}
			}else{
				if(!!cardno){
					var length = cardno.length;
					if(length>20){
						message ="证件号码的长度不能超过20个字符！";
			        	e.errorText = message;
	               		e.isValid = false;
	               		nui.alert(message);
						return false;
					}
				}
			}
		}
	}
	
	function checkpostcode(e){
		if(e.isValid) {
			var obj =nui.get("postcode");
			var tar = e.target;
			var postcode = e.value;
			var re= /^[1-9][0-9]{5}$/;
			var message="";
			if(!!postcode){
				postcode=trim(postcode);
				nui.get("postcode").setValue(postcode);
				if(!re.test(postcode)){
					message ="请填写正确格式的邮编！";
		        	e.errorText = message;
               		e.isValid = false;
               		nui.alert(message);
					return false;
				}
			}
		}
	}
	
	function checkBankCardNo(e,obj){
		var cmbcardno = nui.get("cmbcardno").getValue();//招商银行卡号
		var pfbankcardno =nui.get("pfbankcardno").getValue();//浦发银行卡号
		if(cmbcardno&&pfbankcardno){
			if(trim(cmbcardno)==trim(pfbankcardno)){
				nui.alert("招商与浦发银行卡号不能相同，请重新填写！");
				return false;
			}
		}
		if(e.isValid){
			var cadrNo = e.value;
			var id = obj.id;
			var message="";
			if(!!cadrNo){
				cadrNo = trim(cadrNo);
				if(cadrNo.length<16||cadrNo.length>19){
					if(id=="cmbcardno"){
						message ="请填写正确格式的招商银行卡号！";
			        	e.errorText = message;
	               		e.isValid = false;
	               		nui.alert(message);
					}
					if(id=="pfbankcardno"){
						message ="请填写正确格式的浦发银行卡号！";
			        	e.errorText = message;
	               		e.isValid = false;
	               		nui.alert(message);
					}
					return false;
				}
				if(!bankCardValid(cadrNo)){
					if(id=="cmbcardno"){
						message ="请填写正确格式的招商银行卡号！";
			        	e.errorText = message;
	               		e.isValid = false;
	               		nui.alert(message);
					}
					if(id=="pfbankcardno"){
						message ="请填写正确格式的浦发银行卡号！";
			        	e.errorText = message;
	               		e.isValid = false;
	               		nui.alert(message);
					}
					return false;
				}
			}
		}
	}
	
	/**
	 * 16位或19位银行卡号（借记卡、信用卡）校验
	 * @param {Object} bankCardNumber
	 */
	function bankCardValid(bankCardNumber) {
	    if (new RegExp("^([0-9]{16}|[0-9]{19})$").test(bankCardNumber)) {
	        var bankCardNumberLen = bankCardNumber.length;
	        var arr = new Array();
	        for (var i = 0; i < bankCardNumberLen; i++) {
	            arr[i] = parseInt(bankCardNumber[i]);
	        }
	        //console.log(arr);
	        for (var i = bankCardNumberLen - 2; i >= 0; i -= 2) {
	            arr[i] = arr[i] * 2;
	            arr[i] = parseInt(arr[i] / 10) + arr[i] % 10;
	        }
	        //console.log(arr);
	        var sum = 0;
	        for (var i = 0; i < bankCardNumberLen; i++) {
	            sum += arr[i];
	        }
	        return sum % 10 == 0;
	    }
	    return false;
	}
	
	function checkPhone(e,obj){
		if(e.isValid) {
			var no = e.value;
			var id =obj.id;
			var message="";
			if(!!no){
				if(no.length>12){
					if(id=="htel"){
						message ="家庭电话号码的长度不能超过12个字符！";
			        	e.errorText = message;
	               		e.isValid = false;
	               		nui.alert(message);
			        	return false;
			        }	
			        if(id=="emelink"){
			        	message ="紧急联系人手机号码的长度不能超过12个字符！";
			        	e.errorText = message;
	               		e.isValid = false;
			        	nui.alert(message);
			        	return false;
			        }	
				}
				var tel = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
				//var phone = /^[1][3,4,5,7,8][0-9]{9}$/; 
				var phone =/^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
				if(no.length == 11&&no.indexOf("-")== -1){//手机号码
			        if(!phone.test(no)) {
			        	if(id=="htel"){
			        		message ="家庭手机号码格式不正确！";
			        		e.errorText = message;
	               			e.isValid = false;
			        		nui.alert(message);
			        	}
			        	if(id=="emelink"){
			        		message ="紧急联系人手机号码格式不正确！";
			        		e.errorText = message;
	               			e.isValid = false;
			        		nui.alert(message);
			        	}
			          	return false;
			        }
			      }else if(no.indexOf("-") != -1 ){//电话号码
			        if(!tel.test(no)) {
			          if(id=="htel"){
			          	message ="家庭固定电话格式不正确！";
			          	e.errorText = message;
	               		e.isValid = false;
			        	nui.alert(message);
			          }	
			          if(id=="emelink"){
			          	message ="紧急联系人固定电话格式不正确！";
			          	e.errorText = message;
	               		e.isValid = false;
			        	nui.alert(message);
			          }	
			          return false;
			        }
			     }else{
			     	if(id=="htel"){
			     		message ="家庭电话格式不正确！";
			     		e.errorText = message;
	               		e.isValid = false;
			        	nui.alert(message);
		          	}	
		          	if(id=="emelink"){
		          		message ="紧急联系人手机号码格式不正确！";
			     		e.errorText = message;
	               		e.isValid = false;
		        		nui.alert(message);
		          	}	
		          	return false;
			     }
			}
		}
	}
	
	function checkInt(e,number){
		if(e.isValid) {
			var value = e.value;
			var message="";
			if(!!value){
				var reg = /^(0|\+?[1-9][0-9]*)$/;
				if(!reg.test(value)){
					message ="居住证年限只能填写整数！";
		        	e.errorText = message;
               		e.isValid = false;
               		nui.alert(message);
			        return false;
				}
				if(value.length>number){
					message ="居住证年限长度不能超过"+number+"位！";
		        	e.errorText = message;
               		e.isValid = false;
               		nui.alert(message);
					return false;
				}
			}
		}
	}
	//日期转字符串 返回日期格式20080808
	function dateToString(date) {
		if (date instanceof Date) {
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			month = month < 10 ? '0' + month: month;
			var day = date.getDate();
			day = day < 10 ? '0' + day: day;
			return year + "" + month + "" + day;
		}
		return '';
	}
	
	function checkeamil(e){
		if(e.isValid) {
			var message ="";
			var value = e.value;
			var reg=new RegExp(/^([a-zA-Z0-9._-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/);
			if(!!value){
				var length = value.length;
				if(length>30){
					message ="电子邮箱的长度不能超过30个字符！";
				 	e.errorText = message;
               		e.isValid = false;
               		nui.alert(message);
					return false;
				}
				if(!reg.test(value)){
					message ="请填写正确的格式的电子邮件！";
				 	e.errorText = message;
               		e.isValid = false;
               		nui.alert(message);
					return false;
				}
			}
		
		}
	}
	
	function tips(id,str){
	    var t= window.event.pageY-document.getElementById(id).offsetHeight;
	    var l=  getLeft(document.getElementById(id));
	    document.getElementById("tips").innerHTML="提示："+str;
		var tipsheight = document.getElementById("tips").offsetHeight;
	    document.getElementById("tips").style.left=l+"px";
	    document.getElementById("tips").style.top=t-30+"px";
	    document.getElementById("tips").style.display="";
	}
	function outtips(){
	    document.getElementById("tips").style.display='none';
	}
	//获取元素的纵坐标
    function getTop(e){
        var offset=e.offsetTop;
        if(e.offsetParent!=null) offset+=getTop(e.offsetParent);
        return offset;
    }
	//获取元素的横坐标
    function getLeft(e){
        var offset=e.offsetLeft;
        if(e.offsetParent!=null) offset+=getLeft(e.offsetParent);
        return offset;
    }
	function trim(str){
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}
	function dealdate(e){
		if(e.value){
			return e.value.substring(0,10);
		}
	}
	//工作地
	function getWorkPlace(e){
		return nui.getDictText('AREA4CLRY',e.value);
	}
	//学历
	function getDegree(e){
		return nui.getDictText('DEGREE',e.value);
	}
	//性别
	function getGender(e){
		return nui.getDictText('ABF_GENDER',e.value);
	}
	//工作类型
	function getJobType(e){
		return nui.getDictText('AME_EMPTYPE2',e.value);
	}
	
	function getPosition(e){
		return nui.getDictText('EMP_TYPE',e.value);
	}
	//人员状态
	function getIntendStatus(e){
		return nui.getDictText('INTEND_STATUS',e.value);
	}
	//证书类型
	function onCertTypeRenderer(e){
		return nui.getDictText('AME_CERTTYPE',e.value);//设置业务字典值
	}
</script>
</html>