<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): xpc
  - Date: 2019-05-22 20:30
  - Description:
-->
<head>
	<title>拟入职人员需求</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;
	    }
    </style>
</head>
<body>
  <div class="nui-fit">
   <div id="form1" >
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
		<legend>拟入职人员基本信息</legend>
		<input name="omIntendJoin.fileids" id="fileids" class="nui-hidden"/>
		<input name="omIntendJoin.intendid" id="intendid" class="nui-hidden"/>
		<input name="omIntendJoin.recruitno" id="recruitno" class="nui-hidden"/>
		<input name="omIntendJoin.userid" id="userid" class="nui-hidden"/>
		<input name="resume.resumeid" id="resumeid" class="nui-hidden" />
		<div style="padding:5px;">
			<table style="width:100%;">
				<tr>
					<td align="right" style="width:120px;">招聘需求编号：</td>
                	<td align="left" >    
                    	<input name="omIntendJoin.recruitid" id="recruitid" class="nui-buttonedit" onbuttonclick="showEmployee" required="true" style="width:170px;"/>
                	</td>
                	<td align="right"style="width: 140px;">姓名：</td>
					<td align="left" >
						<input name="omIntendJoin.intendname" class="nui-textbox" required="true" style="width: 150px;"/>
					</td>
					<td align="right"style="width: 140px;">性别：</td>
					<td align="left" >
						<input name="omIntendJoin.gender" class="nui-dictcombobox" dictTypeId="ABF_GENDER" required="true" style="width: 150px;"/>
					</td>
					<td align="right" style="width: 140px;">学历：</td>
					<td align="left" >
						<input name="omIntendJoin.education" class="nui-dictcombobox" dictTypeId="DEGREE"  required="true"/>
					</td>
				</tr>
				<tr>
				    <td align="right">学历验证：</td>
					<td align="left" >
						<input name="omIntendJoin.eduverify" class="nui-dictcombobox" dictTypeId="EDUVERIFY" style="width:170px;" required="true" shownullItem="true"/>
					</td>
				    <td align="right">人员性质：</td>
					<td align="left">
						<input name="omIntendJoin.intendjobtype" class="nui-dictcombobox" id="intendjobtype" dictTypeId="AME_EMPTYPE2" onvaluechanged="checkorgisleaf" required="true"  style="width: 150px;"/>
					</td>
					<td align="right" >员工属性：</td>
                	<td align="left">    
                    	<input name="omIntendJoin.intendpositiontype" class="nui-dictcombobox" id="intendpositiontype" dictTypeId="EMP_TYPE" required="true"  style="width: 150px;"/>
                    </td>
                    <td align="right">入职状态：</td>
                	<td align="left">    
                    	<input name="omIntendJoin.intendstatus" class="nui-dictcombobox" dictTypeId="INTEND_STATUS" id='intendstatus' required="true" onvaluechanged="changestatus"/>
				    </td>
				</tr>
				<tr>
				   <td align="right">入职部门：</td>
				   <td align="left">
					    <input class="nui-combobox"name="omIntendJoin.inorgid" id="orgid" url="com.primeton.eos.ame_fee.cashflow.getAllOrg.biz.ext" filterType="like" 
						textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" onvaluechanged="checkorgisleaf"
						allowInput="true"  style="width:170px;" required="true">
				   </td>
				   <td align="right">直接主管：</td>
            		<td align="left">
            			<input name="omIntendJoin.managerid" id="managerid"  onbuttonclick="selectEmp1" class="nui-buttonedit" allowInput="false" emptyText="请选择人员" required="true"  style="width: 150px;"/>    
            		</td>
                    <td align="right">导师：</td>
            		<td align="left">
            			<input name="omIntendJoin.tutorid" id="tutorid"   onbuttonclick="selectEmp" class="nui-buttonedit" allowInput="false" emptyText="请选择人员" required="true"  style="width: 150px;"/>    
            		</td> 
					<td align="right" >招聘专员：</td>	
                    <td align="left">   
	                    <input id="intendrecempname" class="mini-textboxlist"  name="omIntendJoin.intendrecempname" searchField="name"
							url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
							textField="empname" valueField="userid" required="true"  onvaluechanged="changeAgent"/>
                    </td>
				</tr>
				<tr>
				<td align="right" >职位分类：</td>
                	<td align="left">    
            		   <input name="omIntendJoin.position" class="nui-dictcombobox" shownullItem="true" onvaluechanged="setPositionName" allowInput="true" dictTypeId="AME_POSITION_MEMO" id="position"required="true"  style="width:170px;"/>
                    </td>
                <td align="right">职位名称：</td>
					<td align="left">
						<input name="omIntendJoin.positionname" id="positionname" class="nui-textbox"  required="true" style="width: 150px;"/>
					</td>    
                <td align="right" >手机号码：</td>
        		    <td align="left">    
            		   <input name="omIntendJoin.mobileno" class="nui-textbox"  id="mobileno" required="true" onvaluechanged="checkmobileno"  style="width: 150px;"/>
        		    </td> 
        		<td align="right">归属子公司：</td>
            	    <td align="left">    
        			   <input name="omIntendJoin.company" id="company" class="nui-dictcombobox" dictTypeId="company" required="true" allowInput="true" />
            	    </td>     
                </tr>
                <tr>
	                <td align="right" >工作地：</td>
                	<td align="left" >    
            		    <input name="omIntendJoin.intendworkplace" class="nui-dictcombobox" dictTypeId="AREA4CLRY" required="true" allowInput="true" shownullItem="true" style="width:170px;"/>
                    </td>
            		<td align="right" >试用期开始时间：</td>
					<td align="left"> 
						<input class="nui-datepicker" name="omIntendJoin.probationstartdate" id="probationstartdate" required="true" onvaluechanged="getDateNexThirdMonth('probationstartdate','probation','probationenddate')"  style="width: 150px;"/>
					</td>
					<td align="right" >试用期期限(月)：</td>
					<td align="left">
						<input name="omIntendJoin.probation"  id="probation" class="nui-textbox"  onvaluechanged="getDateNexThirdMonth('probationstartdate','probation','probationenddate')" required="true"  onblur="validate('probation')" value="3" inputStyle="text-align: right;"  style="width: 150px;"/>
					</td>
                	<td align="right" >试用期结束时间：</td>
					<td align="left"> 
						<input class="nui-datepicker" name="omIntendJoin.probationenddate" id="probationenddate"  required="true"/>
					</td>
            		 
                </tr>
                <tr>
                    <td align="right" >个人邮箱：</td>
        		    <td align="left">    
            		    <input name="omIntendJoin.email" id="email" class="nui-textbox" required="true" style="width:170px;"/>
        		    </td>
            		<td align="right">劳动合同开始时间：</td>
					<td align="left"> 
						<input class="nui-datepicker" name="omIntendJoin.laborstart" id="laborstart" required="true" onvaluechanged="getDateNexThirdMonth('laborstart','laborterm','laborend')"  style="width: 150px;"/>
					</td>
					<td align="right" >劳动合同期限(年)：</td>
					<td align="left">
						<input name="omIntendJoin.laborterm"  id="laborterm"  class="nui-spinner" format="n2" showButton="false"  onvaluechanged="getDateNexThirdMonth('laborstart','laborterm','laborend')" required="true"<%-- onblur="validate('laborterm')"--%> value="3" inputStyle="text-align: right;"  style="width: 150px;"/>
					</td>
                	<td align="right" >劳动合同结束时间：</td>
					<td align="left"> 
						<input class="nui-datepicker" name="omIntendJoin.laborend" id="laborend" required="true"/>
					</td>
                </tr>
                <tr>
                    <td align="right" >招聘渠道：</td>
            		<td align="left">    
                		<input name="omIntendJoin.recruitway" id="recruitway" class="nui-dictcombobox" shownullItem="true" dictTypeId="RECRUIT_WAY" required="true"  onvaluechanged="changerecruitway()" style="width:170px;"/>
            		</td>
                    <!--根据招聘渠道类型切换招聘渠道说明的控件-->
            		<td align="right" id="zpqdsm1" >招聘渠道说明：</td>
            		<td align="left" id="zpqdsm"></td>
            		<td align="right">拟入职日期：</td>
					<td align="left">
						<input name="omIntendJoin.interdate" class="nui-datepicker" required="true" style="width: 150px;"/>
					</td>
					<td align="right">实际入职日期：</td>
					<td align="left">
						<input name="omIntendJoin.actdate" class="nui-datepicker" id="actdate" onvaluechanged="changeactdate"/>
					</td>
                </tr>
                <tr>
                 <td align="right" >福利缴纳地：</td>
                	<td align="left">    
            		   <input name="omIntendJoin.welfare" class="nui-dictcombobox" shownullItem="true" dictTypeId="AREA4CLRY" required="true" allowInput="true" style="width: 170px;"/>
                    </td>
                </tr>    
				<tr>
					<td align="right" >备 注：</td>
                	<td  colspan="7">    
                    	<input name="omIntendJoin.remark" class="nui-textarea" style = "width: 100%;height:50px" maxLength="260">
                	</td>
				</tr>
			</table>
		</div>
	</fieldset>
	<fieldset style="border:solid 1px #aaa;padding:3px;" id = "basicinfo">
		<legend>拟入职人员相关信息</legend>
		<div style="padding:5px;">
			<table style="width:100%;">
		        <tr>
		            <td align="right"style="width: 120px;">联系地址：</td>
					<td align="left" >
					    <input name="omIntendJoin.address" onvalidation="checkLength(e,'联系地址',64)" class="nui-textbox"  style="width:170px;"/>
					</td>
					<td align="right"style="width: 140px;">联系地址邮编：</td>
					<td align="left" >
						<input name="omIntendJoin.postcode" id="postcode" onvalidation="checkpostcode(e)" class="nui-textbox" style="width: 150px;"/>
					</td>
					<td align="right" style="width:140px;">家庭电话：</td>
                	<td align="left">  
                	    <input name="omIntendJoin.htel" id="htel"  onvalidation="checkPhone(e,this)" class="nui-textbox" style="width: 150px;"/>  
                	</td>
					<td align="right" style="width: 140px;">紧急联系人：</td>
					<td align="left" >
					    <input name="omIntendJoin.emergency" class="nui-textbox" onvalidation="checkLength(e,'紧急联系人',32)"/>
					</td> 
			    </tr>
				<tr>
				    <td align="right" >与本人关系：</td>
            		<td align="left">    
                		<input name="omIntendJoin.emerelation"  class="nui-dictcombobox" dictTypeId="EMP_RELATION" style="width:170px;"/>
            		</td>
            		<td align="right" >紧急联系人手机：</td>
            		<td align="left">    
                		<input name="omIntendJoin.emelink" id="emelink" onvalidation="checkPhone(e,this)" class="nui-textbox" style="width: 150px;"/>
            		</td>
            		<td align="right" >户籍性质：</td>
            		<td align="left">    
                		<input name="omIntendJoin.resiproperty"  class="nui-dictcombobox" dictTypeId="ABF_BIRTHTYPE" style="width: 150px;"/>
            		</td>
            		<td align="right" >户口所在省市：</td>
            		<td align="left">    
                		<input name="omIntendJoin.residence" class="nui-dictcombobox" dictTypeId="MIS_AREA" />
            		</td>
				</tr>
				<tr>
				    <td align="right" >户口所在地址：</td>
            		<td align="left">    
                		<input name="omIntendJoin.haddress" class="nui-textbox" onvalidation="checkLength(e,'户口所在地址',64)" style="width:170px;"/>
            		</td>
            		<td align="right" >档案保管机构：</td>
            		<td align="left">    
                		<input name="omIntendJoin.filesaveorg" class="nui-textbox" onvalidation="checkLength(e,'档案保管机构',20)" style="width: 150px;"/>
            		</td>
            		<td align="right" >档案所在省市：</td>
            		<td align="left">    
                		<input name="omIntendJoin.filecity" class="nui-dictcombobox" dictTypeId="MIS_AREA" style="width: 150px;"/>
            		</td>
            		<td align="right" >档案所在地址：</td>
            		<td align="left">    
                		<input name="omIntendJoin.fileaddress" class="nui-textbox" onvalidation="checkLength(e,'档案所在地址',64)"/>
            		</td>
				</tr>
				<tr>
				    <td align="right" >公积金账号：</td>
            		<td align="left">
						<input name="omIntendJoin.fundno" class="nui-textbox" onvalidation="checkLength(e,'公积金账号',30)"  id ="fundno" style="width:170px;"/>
            		</td>
            		<td align="right" >居住证办理单位名称：</td>
            		<td align="left">   
            		    <input name="omIntendJoin.residealorg" class="nui-textbox" onvalidation="checkLength(e,'居住证办理单位名称',32)" style="width: 150px;"/>
            		</td>
            		<td align="right" >居住证开始时间：</td>
            		<td align="left">    
                		<input name="omIntendJoin.resistartdate" class="nui-datepicker" style="width: 150px;"/>
            		</td>
            		<td align="right" >居住证结束时间：</td>
            		<td align="left">    
                		<input name="omIntendJoin.resienddate" class="nui-datepicker" />
            		</td>
				 </tr>
				 <tr>
				    <td align="right" >补充公积金账号：</td>
            		<td align="left">
						<input name="omIntendJoin.addfundno" class="nui-textbox" onvalidation="checkLength(e,'补充公积金账号',30)"  id="addfundno" style="width:170px;"/>
            		</td>
            		<td align="right" >居住证类型：</td>
            		<td align="left">
						<input name="omIntendJoin.ishaveresi" class="nui-dictcombobox" dictTypeId="AME_RESIDENCE" style="width: 150px;"/>
            		</td>
				    <td align="right" >居住证年限：</td>
            		<td align="left">
						<input name="omIntendJoin.resilimit" onvalidation="checkInt(e,2)"  class="nui-textbox" style="width: 150px;"/>
            		</td>
            		<td align="right" >原福利缴纳省市：</td>
            		<td align="left">
						<input name="omIntendJoin.origwelfarprovin" class="nui-dictcombobox" shownullItem="true" dictTypeId="AREA4CLRY" />
            		</td>
				 </tr>
				 <tr>
				    <td align="right" >浦发银行卡号：</td>
					<td align="left">
						<input name="omIntendJoin.pfbankcardno" id="pfbankcardno" onvalidation="checkBankCardNo(e,this)"  class="nui-textbox" style="width:170px;"/>
					</td>
					<td align="right" >婚姻状况：</td>
            		<td align="left">
						<input name="omIntendJoin.marristatus"  class="nui-dictcombobox" dictTypeId="ABF_MARRITYPE" style="width: 150px;"/>
            		</td>
            		<td align="right" >未成年子女姓名：</td>
            		<td align="left">
						<input name="omIntendJoin.nonagename" class="nui-textbox" onvalidation="checkLength(e,'未成年子女姓名',10)" style="width: 150px;"/>
            		</td>
            		<td align="right" >未成年子女性别：</td>
            		<td align="left">
						<input name="omIntendJoin.nonagesex" class="nui-dictcombobox" dictTypeId="ABF_GENDER" />
            		</td>
				 </tr>
				 <tr>
				    <td align="right" >招商银行卡号：</td>
					<td align="left" >
						<input name="omIntendJoin.cmbcardno" id="cmbcardno" onvalidation="checkBankCardNo(e,this)"  class="nui-textbox" style="width:170px;"/>
					</td>
					<td align="right" >未成年子女出生年月：</td>
            		<td align="left">
						<input name="omIntendJoin.nonagebirth" class="nui-datepicker" style="width: 150px;"/>
            		</td>
            		<td align="right" >民族：</td>
            		<td align="left">
						<input name="omIntendJoin.nation" class="nui-textbox" style="width: 150px;"/>
            		</td>
            		<td align="right" >PCF捐款金额：</td>
            		<td align="left">
						<input name="omIntendJoin.pcfamount" class="nui-textbox" />
            		</td>
            		</tr>
            		<tr>
            		<td align="right">社会开始工作时间：</td>
					<td align="left" id="socialTime" onmouseover="tips('socialTime','1.正式员工请填高等教育结束后开始签署全日制合同开始时间；</br>2.实习员工请填预计拟毕业时间之后一天')" onmouseout="outtips()">
						<input name="omIntendJoin.socialstart" class="nui-datepicker" style="width:170px;"/>
					</td>
                    <td align="right" >参加工作年月：</td>
					<td align="left">
						<input name="omIntendJoin.worktime" id="worktime" format="yyyyMM"  class="nui-monthpicker" style="width: 150px;"/>
					</td>
					<td align="right" >最高学历入学时间：</td>
					<td align="left"  id="highstDegreeStarDate" onmouseover="tips('highstDegreeStarDate','1.正式员工请填已毕业的最高学历入学时间；</br>2.实习生请填目前在读的学历入学时间；')" onmouseout="outtips()" style="width: 150px;">
						<input name="omIntendJoin.ghestindate" class="nui-datepicker" style="width: 150px;"/>
					</td>
					<td align="right" >最高学历毕业时间：</td>
					<td align="left"  id="highstDegreeEndDate" onmouseover="tips('highstDegreeEndDate','1.正式员工请填已毕业的最高学历毕业时间；<br>2.实习生请填目前在读的学历预计毕业时间；')" onmouseout="outtips()">
						<input name="omIntendJoin.highestoutdate" class="nui-datepicker" />
					</td>
				 </tr> 
				 <tr> 
				    <td align="right">出生日期：</td>
				    <td align="left" >
						 <input name="omIntendJoin.birthdate" class="nui-datepicker" showTodayButton="false" id = "birthdate"style="width:170px;"/>
				    </td>
				    <td align="right" >证件类型：</td>
                	<td align="left">    
                    	 <input name="omIntendJoin.cardtype" id="cardtype" class="nui-dictcombobox" shownullItem="true" dictTypeId="ABF_CARDTYPE" required="false" onvaluechanged="checkcardno" style="width: 150px;"/>
                	</td>
        		    <td align="right" style="width: 110px;">籍贯：</td>
					<td align="left" style="width: 120px;">
						<input name="omIntendJoin.birthplace" class="nui-textbox" onvalidation="checkLength(e,'籍贯',15)" style="width: 150px;"/>
					</td> 
					<td align="right" >最高学历：</td>
        		    <td align="left">    
            		    <input name="omIntendJoin.highestlen" id="highestlen" class="nui-textbox"/>
        		    </td>
                 </tr>
                 <tr>
                    <td align="right" >证件号码：</td>
            		<td align="left">    
                		<input name="omIntendJoin.cardno" id="cardno" class="nui-textbox"  required="false"  onvaluechanged="checkcardno" style="width:170px;"/>
            		</td>
            		<td align="right" >邮箱账号：</td>
        		    <td align="left">    
            		    <input name="omIntendJoin.oemail" id="oemail" class="nui-textbox" style="width: 150px;"/>
        		    </td> 
				 </tr> 
		  </table>
		</div>		
    </fieldset>	
    <span>&nbsp;&nbsp;请上传简历等相关附件!</span>
	<jsp:include page="/ame_common/addFiles.jsp"/>
	<jsp:include page="/ame_common/detailFile.jsp"/>
    <%-- <fieldset style="border: solid 1px #aaa; padding: 3px;" id="pc">
			<legend>入职材料相关附件</legend>
			<div style="padding: 5px;">
				<span style="font-size: 15px; color:red; padding-left:3px;">请上传入职相关文件，包括离职证明（离职日期在入职日期之前）、体检报告等，相关原件和其他入职资料一并在入职时提交。如果当前无法提供相应附件，也可以在入职后补充提交。</span>
				<jsp:include page="/ame_common/addFiles.jsp"/>
				<jsp:include page="/ame_common/detailFile.jsp"/>
			</div>
	</fieldset> --%>
	<fieldset style="border: solid 1px #aaa; padding: 3px;" id = "degreeinfo">
		<legend>学历信息</legend>
		<div style="width: 130px;">
			<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;"id="button_inorgid1">
				<table style="width: 100%;">
					<tr>
						<td style="width: 20%;">
							<a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addRow('grid_degreeDetail')">增加</a>
							<a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeRow('grid_degreeDetail')">删除</a>
						</td>
					</tr>
				</table>
			</div>	
		</div>
		<div id="grid_degreeDetail" class="nui-datagrid" style="width: 100%; height: auto;" dataField="edus"  allowCellSelect="true" showPager="false"
			 allowCellEdit="true" multiSelect="true" editNextOnEnterKey="true" allowSortColumn="true" allowCellWrap="true"
			 url="org.gocom.abframe.org.employee.Education.getEducationByName.biz.ext">
			<div property="columns">
				<div type="checkcolumn" width="10px">&nbsp;</div>
				<div field="startdate" width="30" align="center"headerAlign="center" renderer="onDealDate"dateFormat="yyyy-MM-dd" allowSort="true">开始时间
				     <input property="editor" class="nui-datepicker" ondrawdate="checkDate" required="true" />
				</div>
				<div field="enddate" width="30" align="center" headerAlign="center" renderer="onDealDateS" dateFormat="yyyy-MM-dd">终止时间
					<input property="editor" class="nui-datepicker" ondrawdate="checkDate" required="true" />
				</div>
				<div field="degree" renderer="getDegree" width="55" align="center" headerAlign="center">学历
					<input property="editor" class="nui-dictcombobox" dictTypeId="DEGREE" required="true" />
				</div>
				<div field="graduschool" width="70" align="left" headerAlign="center">毕业院校
					<input property="editor" class="nui-textbox" required="true" maxLength="24" maxLengthErrorText="不能超过 {24} 个字符"/>
				</div>
				<div field="profession" width="85" align="left" headerAlign="center">专业
					<input property="editor" class="nui-textbox" maxLength="20"/>
				</div>
			</div>
	  </div>
	</fieldset>
	<fieldset style="border: solid 1px #aaa; padding: 3px;" id = "workinfo">
		<legend>工作经历</legend>
		<div style="width: 130px;">
			<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;"id="button_inorgid1">
				<table style="width: 100%;">
					<tr>
						<td style="width: 20%;">
							<a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addRow('grid_workDetail')">增加</a>
							<a class="nui-button" id="deltbtn" iconCls="icon-remove" onclick="removeRow('grid_workDetail')">删除</a>
						</td>
					</tr>
				</table>
			</div>	
		 </div>
		 <div id="grid_workDetail" class="nui-datagrid" style="width: 100%; height: auto;" dataField="workExp" allowCellSelect="true" 
			  showPager="false" allowCellEdit="true" multiSelect="true" editNextOnEnterKey="true" allowSortColumn="true" allowCellWrap="true"
			  url="com.primeton.eos.ame_resume.resumeManage.getWorkExp.biz.ext">
				<div property="columns">
					<div type="checkcolumn" width="10px">&nbsp;</div>
					<div field="startdate" width="30" align="center" headerAlign="center" dateFormat="yyyy-MM">开始时间 
						<input property="editor" class="nui-monthpicker" ondrawdate="checkDate" required="true" />
					</div>
					<div field="enddate" width="30" align="center" headerAlign="center" dateFormat="yyyy-MM">终止时间 
						<input property="editor" class="nui-monthpicker" ondrawdate="checkDate" required="true" />
					</div>
					<div field="companyname" width="55" align="left" headerAlign="center">工作单位 
						<input property="editor" class="nui-textbox" required="true" maxLength="50" />
					</div>
					<div field="duty" width="70" align="left"  headerAlign="center">职务 
						<input property="editor" maxLength="50" class="nui-textbox" required="true" />
					</div>
					<div field="workdescription" width="85" align="left" headerAlign="center">主要职责 
						<input property="editor" class="nui-textarea" maxLength="150" style="width: 200px" minWidth="200" minHeight="80" />
					</div>
			</div>
		</div>
	</fieldset>
	<fieldset style="border: solid 1px #aaa; padding: 3px;" id = "projectinfo">
		<legend>项目经历</legend>
		<div style="width: 130px;">
			<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;"id="button_inorgid1">
				<table style="width: 100%;">
					<tr>
						<td style="width: 20%;">
							<a class="nui-button" id="addbtn" iconCls="icon-add" onclick="addRow('grid_projectDetail')">增加</a>
							<a class="nui-button" id="deltbtn" iconCls="icon-remove"onclick="removeRow('grid_projectDetail')">删除</a>
						</td>
					</tr>
				</table>
			  </div>	
			</div>
			<div id="grid_projectDetail" class="nui-datagrid" style="width: 100%; height: auto;" dataField="projExp"allowCellSelect="true" 
				showPager="false" allowCellEdit="true"multiSelect="true" editNextOnEnterKey="true" allowSortColumn="true" allowCellWrap="true"
				url="com.primeton.eos.ame_resume.resumeManage.getProjExp.biz.ext">
				<div property="columns">
					<div type="checkcolumn" width="10px">&nbsp;</div> 
					<div field="beginenddate" width="30" align="center" headerAlign="center" dateFormat="yyyy-MM">开始时间 
						<input property="editor" class="nui-monthpicker" ondrawdate="checkDate" required="true" />
					</div>
					<div field="enddate" width="30" align="center" headerAlign="center"  dateFormat="yyyy-MM">终止时间 
						<input property="editor" class="nui-monthpicker" ondrawdate="checkDate" required="true" />
					</div>
					<div field="projectname" width="55" align="left" headerAlign="center">项目名称 
						<input property="editor" class="nui-textbox" maxLength="150"  required="true" />
					</div>
					<div field="projectintroduce" width="70" align="left" headerAlign="center">项目描述
						<input property="editor" class="nui-textarea"  maxLength="150"  style="width: 200px" minWidth="200" minHeight="80" />
					</div>
					<div field="projectduty" width="85" align="left" headerAlign="center">主要职责
					    <input property="editor" class="nui-textarea" maxLength="150"  style="width: 200px" minWidth="200" minHeight="80" />
					</div>
			</div>
		</div>
	</fieldset>
	<fieldset style="border: solid 1px #aaa; padding: 3px;" id = "certinfo">
		<legend>有关资质证书</legend>
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
		<div id="grid_cert" class="nui-datagrid"style="width: 100%; height: auto;" dataField="cert" showPager="false" 
			allowCellEdit="true" allowCellSelect="true"allowSortColumn="true" allowCellWrap="true" multiSelect="true" editNextOnEnterKey="true"
			url="com.primeton.eos.ame_resume.resumeManage.getCert.biz.ext">
			<div property="columns">
				<div type="checkcolumn" width="20px"></div>
				<div field="cardtype" width="60" headerAlign="center" align="center" renderer="onCertTypeRenderer">证件（证书）类型
					 <input property="editor" class="nui-dictcombobox" dictTypeId="AME_CERTTYPE" inputStyle="text-align: left" />
				</div>
				<div field="cardno" width="80" headerAlign="center" align="left">证件号码 
					<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="32" />
				</div>
				<div field="startdate" width="60" headerAlign="center" dateFormat="yyyy-MM-dd" renderer="onDealDate" align="center">有效开始日期 
					<input property="editor" class="nui-datepicker" inputStyle="text-align: left" dateFormat="yyyy-MM-dd" />
				</div>
				<div field="enddate" width="60" headerAlign="center" dateFormat="yyyy-MM-dd" renderer="onDealDateS" align="center">有效截止日期
					<input property="editor" class="nui-datepicker"inputStyle="text-align: left" dateFormat="yyyy-MM-dd" />
				</div>
				<div field="files" renderer="onFileRenderer" width="200" hight="100"  align="left" headerAlign="center">附件</div>
                <div field="fileid" displayField="filename" width="200" headerAlign="center" align="left" visible="false">附件
                	<input property="editor" class="nui-hidden" style="width: 200px" minWidth="200" minHeight="80" />
                </div>
				<div field="remark" width="150" headerAlign="center" align="left">备注
					 <input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" maxLength="240"  minHeight="80" />
				</div>
			</div>
		</div>
	</fieldset>
    <!-- <div style="text-align:center;padding:10px;">               
	    <a class="nui-button" onclick="onOk"  id="okbutton" iconCls="icon-ok" style="width:60px;margin-right:20px;">保存</a>       
	    <a class="nui-button" onclick="onCancel('cancel')"  iconCls="icon-cancel" style="width:60px;">关闭</a>       
	</div> -->		
  </div>	
</div>
	<div id="tips" style="position:absolute;border:1px solid rgb(233, 239, 246);padding:0px 3px;color:#f00;display:none;height:auto;line-height:20px;background:rgb(255, 255, 255);">
	</div>
</body>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk"  id="okbutton" iconCls="icon-ok" style="width:60px;margin-right:20px;">保存</a>       
	    <a class="nui-button" onclick="onCancel('cancel')"  iconCls="icon-cancel" style="width:60px;">关闭</a>  
</div>  
<script type="text/javascript">
    <% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	var nowuserid='<%=nowuserid %>';
	var nowusername='<%=nowusername%>';
	nui.parse();
	var form = new nui.Form("form1");
	var save="add";
	var intendid=null;
	var recruitid=null;
	var grid_degreeDetail = nui.get("grid_degreeDetail");//拟入职人员教育经历信息
	var grid_workDetail = nui.get("grid_workDetail");//拟入职人员工作信息
	var grid_projectDetail = nui.get("grid_projectDetail");//拟入职人员项目信息
	var grid_cert = nui.get("grid_cert");//拟入职人员证书
    function changerecruitway(){ 
	         var wayvalue = nui.get(id="recruitway").getValue();
	         if(wayvalue == '1' || wayvalue == '6'){
	            document.getElementById("zpqdsm").innerHTML =  '<input name="omIntendJoin.recruitwayexp" id="recruitwayexp" class="nui-dictcombobox" shownullItem="true" dictTypeId="RECRUIT_WAYEXP" required="true" allowInput="true"  style="width: 150px;"/>';
	         }  
	         if(wayvalue == '2' || wayvalue == '3' || wayvalue == '4' || wayvalue == '5' || wayvalue == '7'){
	            document.getElementById("zpqdsm").innerHTML =  '<input name="omIntendJoin.recruitwayexp" id="recruitwayexp" class="nui-textbox"  required="true"  style="width: 150px;"/>';
	         } 
	         nui.parse();
	}
	function SetData(data){
	 if(data.action=="new"){
			var intendrecempname = nui.get("intendrecempname");
			intendrecempname.setValue(nowuserid);
			intendrecempname.setText(nowusername);
	        document.getElementById("zpqdsm").innerHTML =  '<input name="omIntendJoin.recruitwayexp" id="recruitwayexp" class="nui-dictcombobox" shownullItem="true" dictTypeId="RECRUIT_WAYEXP" required="true" allowInput="true"  style="width: 150px;"/>';
	        nui.parse();
	        document.getElementById("basicinfo").style.display="none"//隐藏拟入职人员基本信息
	        document.getElementById("workinfo").style.display="none"//工作信息
	        document.getElementById("degreeinfo").style.display="none"//学历信息
	        document.getElementById("projectinfo").style.display="none"//项目信息
	        document.getElementById("certinfo").style.display="none"//资质证书信息
	    }else{		
			save="edit";
			intendid=data.intendid;
			var json = nui.encode({intendid:intendid});
			nui.ajax({
	            url: "org.gocom.abframe.org.recruit.getIntendJoin.biz.ext",
				type: 'POST',
				data: json,
				contentType: 'text/json',
	            success: function (o) {
	                nui.get("grid_0").load({"groupid":"omIntendJoin","relationid":o.omIntendJoin.intendid});
	            	o = nui.decode(o);//反序列化成对象
	            	var wayvalue = o.omIntendJoin.recruitway;
	            	if(wayvalue == null || wayvalue == ''){
	                  document.getElementById("zpqdsm").innerHTML =  '<input name="omIntendJoin.recruitwayexp" id="recruitwayexp" class="nui-dictcombobox" shownullItem="true" dictTypeId="RECRUIT_WAYEXP"  allowInput="true" required="true"  style="width: 150px;"/>';
	                }
                    if(wayvalue == '1' || wayvalue == '6'){
	                  document.getElementById("zpqdsm").innerHTML =  '<input name="omIntendJoin.recruitwayexp" id="recruitwayexp" class="nui-dictcombobox" shownullItem="true" dictTypeId="RECRUIT_WAYEXP"  allowInput="true" required="true"  style="width: 150px;"/>';
	                }
                    if(wayvalue == '2' || wayvalue == '3' || wayvalue == '4' || wayvalue == '5' || wayvalue == '7'){
		        	  document.getElementById("zpqdsm").innerHTML =  '<input name="omIntendJoin.recruitwayexp" id="recruitwayexp" class="nui-textbox"  required="true"  style="width: 150px;"/>';
	                }
		            nui.parse();
		            form.setData(o);
	            	nui.get("intendrecempname").setValue(o.omIntendJoin.intendrecempname);
	            	nui.get("intendrecempname").setText(o.omIntendJoin.intendrecempname2);
	            	nui.get("recruitid").setText(o.omIntendJoin.recruitno); //注意"recruitid"的class="nui-buttonedit"不能为textbox
	            	nui.get("intendjobtype").setValue(o.omIntendJoin.intendjobtype);
	            	nui.get("intendpositiontype").setValue(o.omIntendJoin.intendpositiontype);
	            	if(o.omIntendJoin.managerid){
	            	   nui.get("managerid").setValue(o.omIntendJoin.managerid);
	            	   nui.get("managerid").setText(o.omIntendJoin.managername);
	            	}
	            	if(o.omIntendJoin.tutorid){
	            	   nui.get("tutorid").setValue(o.omIntendJoin.tutorid);
	            	   nui.get("tutorid").setText(o.omIntendJoin.tutname);
	            	}
	                form.setChanged(false);
	                changeactdate();
	                grid_degreeDetail.load({resumeid:o.resume.resumeid});
		            grid_degreeDetail.sortBy("startdate", "desc");
		            grid_workDetail.load({resumeid:o.resume.resumeid});
		            grid_workDetail.sortBy("startdate", "desc");
		            grid_projectDetail.load({resumeid:o.resume.resumeid});
		            grid_projectDetail.sortBy("beginenddate", "desc");
		            grid_cert.load({resumeid:o.resume.resumeid});
		            grid_cert.sortBy("startdate", "desc");
	         }			
	     	});
	  }
    }
	function onOk(){
		var intendstatus = nui.get("intendstatus").getValue();
		if(intendstatus == '2' || intendstatus == '3'){
			nui.confirm("是否保存？","保存提示",function(action){
				if(action == "ok"){
					nui.get("okbutton").disable();
					document.getElementById("fileCatalog").value="omIntendJoin";
					form2.submit();
				}
			});	
		}else{
			if(form.validate()){	
				nui.confirm("是否保存？请确认部门填写是否正确！","保存提示",function(action){
					if(action == "ok"){
						nui.get("okbutton").disable();
						document.getElementById("fileCatalog").value="omIntendJoin";
						form2.submit();
					}
				});	
			}else{
				nui.alert("请检查表单的完整性!");
				return;
			}
		}
	}
	
	function SaveData(){
		var data = form.getData();
		var omIntendJoin = data.omIntendJoin;
		var worktime=omIntendJoin.worktime;
		if(worktime){
			var newyear = "";
    		var newmonth = "";
    			if(typeof(worktime) == "string" && worktime.length == 7){
        		newyear = worktime.substr(0,4);
        		newmonth = worktime.substr(5,2);
        	}else if(typeof(worktime) == "string" && worktime.length == 6){
        		newyear = worktime.substr(0,4);
        		newmonth = worktime.substr(4,2);
        	}else{
    			newyear =worktime.getFullYear();
    			newmonth = worktime.getMonth() + 1;
    			if(newmonth < 10){
    				newmonth = "0" + newmonth;
    			}else{
    				newmonth = "" + newmonth;
    			}
    			omIntendJoin.worktime = newyear +  newmonth;
			}
		}
		//学历信息
		var degreeExp = nui.get("grid_degreeDetail").getChanges();
		//工作经历
		var workExp = nui.get("grid_workDetail").getChanges();
		//项目经历
		var projectWork = nui.get("grid_projectDetail").getChanges();
		//有关资质证书
		var cert = nui.get("grid_cert").getChanges();
		var json = nui.encode({"omIntendJoin":omIntendJoin,"resume":data.resume,"save":save,"AmeDegreeExp":degreeExp, "AmeWorkExp":workExp, "AmeProjectWork":projectWork,"AmeCert":cert});
		nui.ajax({
			url: "org.gocom.abframe.org.recruit.omIntendJoinInput.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
	        success: function (o) {
		    	if((o.result == '1'||o.result == 1) && (o.checkfile == '1'||o.checkfile == 1)){
		    		nui.alert("保存成功！","系统提示",function(){
		    			CloseWindow("ok");
		    		});
		    	}else{
		    	    if(o.length > o.recnum){
		    	        nui.alert("保存失败！招聘数量已完成，不能再添加拟入职人员","系统提示",function(){
				    		nui.get("okbutton").enable();
			    		});
		    	    }else{
		    	        if(o.checkfile == '0'||o.checkfile == 0){
			    	       	 nui.alert("保存失败！简历未上传","系统提示",function(){
					    		nui.get("okbutton").enable();
				    		 });
		    	       }else{
			    	         nui.alert("保存失败！","系统提示",function(){
					    		nui.get("okbutton").enable();
				    		 }); 
		    	       }
		    		}
		    	}
		    		
	        }
		});
	}
	
	/* function checknum(btnEdit,data){
          	recruitid = data.recruitid;
          	var json = nui.encode({recruitid:recruitid});
		 	nui.ajax({
		        url: "org.gocom.abframe.org.recruit.checknum.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
		        success: function (o) {
		        	o = nui.decode(o);
		        	var arrJoins = o.omIntendJoins;
		        	var arrRec = o.omRecruits;
		        	var arrlen = arrJoins.length;//状态为已入职、待入职的拟入职人员人数
		        	var recnum = arrRec.recnum;//招聘数量
		        	if(arrlen >= recnum ){
		        	        nui.alert("您选择的需求下的拟入职人员人数不能超过该需求的招聘人数，请重新选择");
		        	}else{
		        	        btnEdit.setValue(data.recruitid);
			                btnEdit.setText(data.recruitno);
			                nui.get("intendjobtype").setValue(data.jobtype);
			                nui.get("intendpositiontype").setValue(data.position);
			                nui.get("orgid").setValue(data.orgid);
			                nui.get("recruitno").setValue(data.recruitno);
			                nui.get("position").setValue(data.recposition);
			                orgid = nui.get("orgid").getValue();
		        	}
				}
		 	});
	} */
	
	function showEmployee(e){
		var btnEdit = this;
	    nui.open({
			url:"<%=request.getContextPath() %>/abframe/org/recruit/SelectRecruitno.jsp",
			title: "选择招聘需求编号",
			width: 780,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);   //必须
					/* if (data) {
					          checknum(btnEdit,data);
					} */
					btnEdit.setValue(data.recruitid);
		            btnEdit.setText(data.recruitno);
					nui.get("intendjobtype").setValue(data.jobtype);
	                nui.get("intendpositiontype").setValue(data.position);
	                /* nui.get("orgid").setValue(data.orgid);
	                nui.get("managerid").setValue(data.manageruserid);
	                nui.get("managerid").setText(data.managername); 
	                nui.get("tutorid").setValue(data.manageruserid);
	                nui.get("tutorid").setText(data.managername);  */
	                nui.get("recruitno").setValue(data.recruitno);
	                nui.get("position").setValue(data.recposition);
				}
			}
		});
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
	                	CloseWindow("cancel");
	                }
	            }
	        });
		}else{
			CloseWindow("cancel");
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
	
	function changestatus(){
    	var value = nui.get("intendstatus").getValue();
    	if(value == 0){
    	 nui.get("actdate").setRequired(true);
    	}else{
    	 nui.get("actdate").setRequired(false);
    	}
	}
	
	//检查拟入职人员所属部门是否为叶子部门；判断规则：普通员工入职部门必须是叶子节点，销售的入职部门必须为：机构等级为事业部部门，机构类型：销售部门
	function checkorgisleaf(){//AME_EMPTYPE2
		var orgid = nui.get("orgid").getValue();
		var intendjobtype = nui.get("intendjobtype").getValue();
		if(intendjobtype != null && intendjobtype != '' && orgid != null && orgid != ''){
			var json = nui.encode({"orgid":orgid});
			nui.ajax({
				url: "com.primeton.eos.ame_common.ame_common.getOrgInfo.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
		        success: function (o) {
			    	var isleaf = o.org.isleaf1;
			    	var orgtype = o.org.orgtype;
			    	var orgdegree = o.org.orgdegree;
			    	if(intendjobtype == 1){
			    		if(orgtype==2 && orgdegree==5){
			    		}else{
			    			nui.get("orgid").setValue("");
			    			nui.get("orgid").setText("");
			    			nui.alert("员工不能直接归属"+o.org.orgname+",请重新选择入职！");
			    		}
			    	}else if (isleaf != 'y'){
		    			nui.get("orgid").setValue("");
		    			nui.get("orgid").setText("");
		    			nui.alert("员工不能直接归属"+o.org.orgname+",请重新选择入职！");
		    		}
		        }
			});
		}
	}
	//工作地
	function getWorkPlace(e){
		return nui.getDictText('AREA4CLRY',e.value);
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
	//学历
	function getDegree(e){
		return nui.getDictText('DEGREE',e.value);
	}
	//证书类型
	function onCertTypeRenderer(e){
		return nui.getDictText('AME_CERTTYPE',e.value);//设置业务字典值
	}
	//检查手机号
	function checkmobileno(){
		var myreg =  new RegExp(nui.getDictText('SMS_CONFIG',"PHONE_REG"),'i');
		var mobileno = nui.get("mobileno").getValue();
		if (!myreg.test(mobileno)) {
		   nui.alert("请输入正确的手机号码");
	       nui.get("mobileno").setValue('');
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
					/* if (birthday != dateToString(new Date(year + '/' + month + '/' + day)).replace(/-/g,'')) { //校验日期是否合法
						nui.alert("身份证号码出生年月日不符合要求");
						nui.get("cardno").setValue('');
					} */
					var birthdate = nui.get("birthdate").getValue();
					if(birthdate==""){
						var day = cardno.substring(cardno.length-12,cardno.length-8) + "-" + cardno.substring(cardno.length-8,cardno.length-6) + "-" + cardno.substring(cardno.length-6,cardno.length-4);
						nui.get("birthdate").setValue(day);
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
					/* if (birthday != dateToString(new Date(year + '/' + month + '/' + day)).replace(/-/g,'')) { //校验日期是否合法
						nui.alert("身份证号码出生年月日不符合要求");
						nui.get("cardno").setValue('');
					} */
					var birthdate = nui.get("birthdate").getValue();
					if(birthdate==""){
						var day = '19' + cardno.substring(cardno.length-9,cardno.length-7) + "-" + cardno.substring(cardno.length-7,cardno.length-5) + "-" + cardno.substring(cardno.length-5,cardno.length-3);
						nui.get("birthdate").setValue(day);
					}
				}else{
					nui.alert("请输入正确位数的身份证号！");
					nui.get("cardno").setValue("");
				}
			}
		}
	}
	//检查是否为数字
	function validate(e){  
	     var reg = new RegExp("^[0-9]*[0-9][0-9]*$");  
	     var obj = nui.get(e).getValue();
	     if(!reg.test(obj)){  
	     	alert("请输入数字!");
	     	nui.get(e).setValue("");    
	     }  
     }
    //该表入职日期，同步试用期开始日期和劳动合同开始日期
    function changeactdate(){
    	var actdate = nui.get("actdate").getValue();
    	var probationstartdate = nui.get("probationstartdate").getValue(); 
    	var laborstart = nui.get("laborstart").getValue(); 
		if(actdate != null && actdate != ''){
			nui.get("probationstartdate").setValue(actdate); 
			nui.get("laborstart").setValue(actdate); 
			getDateNexThirdMonth('probationstartdate','probation','probationenddate');
			getDateNexThirdMonth('laborstart','laborterm','laborend');
		}
    }
    //自动计算试用期结束日期
	function getDateNexThirdMonth(start,term,end){
		var veristart = nui.get(start).getValue();
		/* var actdate = nui.get("actdate").getValue();
		if(!veristart&&actdate){
			nui.get(start).setValue(actdate);//试用期开始日期
			veristart =actdate;
		} */
		var veritime = nui.get(term).getValue();
		if(veritime == null || veritime == ''){
			veritime = 3;
		}
		if(term == "laborterm"){
			veritime = veritime * 12;
		}
		if(veristart != null && veristart != ''){
        	if(term == "laborterm"){
				var json = ({"actdate":veristart,"month":veritime});
				nui.ajax({
		            url: "com.primeton.eos.ame_permanage.ame_entry.getNextMonth.biz.ext",
					type: 'POST',
					data: json,	
		            async:false,
					contentType: 'text/json',
		            success: function (o) {
            		var enddate = new Date(o.probationenddate);
					if(enddate.getDate() <= 15){
						enddate = new Date(enddate.getFullYear(),enddate.getMonth(),15);
					}else{
						enddate = new Date(enddate.getFullYear(),enddate.getMonth()+1,0);
					}
            		nui.get(end).setValue(enddate);
		            }
		        });
	        }
		}
		if(term == "probation"){//试用期
        	var month =parseFloat(veritime);
        	if(month==0){//如果试用期设置为0，试用期开始日期和结束日期都清空，同时将其设置为非必填
        		nui.get(start).setValue();//试用期开始日期
				nui.get(end).setValue();//试用期结束日期
				nui.get(start).setReadOnly(true); 
				nui.get(end).setReadOnly(true);
				nui.get(start).setRequired(false);
				nui.get(end).setRequired(false);  
        	}else{
        		nui.get(start).setReadOnly(false); 
				nui.get(end).setReadOnly(false);
				nui.get(start).setRequired(true);
				nui.get(end).setRequired(true);
				if(veristart&&veristart!=''){
					var date1 = new Date(veristart);
	        		if(month){
						var veriend = DateAdd("m", month, date1);
						var veriend1 = DateAdd("d", -1, veriend);
	        			nui.get(end).setValue(veriend1);
					}
				}else{
					nui.get(end).setValue();
				}  
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
	        var sum = 0;
	        for (var i = 0; i < bankCardNumberLen; i++) {
	            sum += arr[i];
	        }
	        return sum % 10 == 0;
	    }
	    return false;
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
                       var na = data.nature;
		               if(na != 1){
                    	  nui.get("orgid").setValue(data.orgid);
		               }else{
		                  nui.get("orgid").setValue("");
		               }
                    }
                 }

            }
       });
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
	function setPositionName(e){
		//var recposition = e.value;
		var position = nui.get("position").getText();
		nui.get("positionname").setValue(position);
	}
	
	function changeAgent(e){
        var length = e.value.split(",").length;
        if (length > 1) {
        
            var text = e.sender.getText().split(",")[0];
            var value = e.sender.getValue().split(",")[0];
            setTimeout(function () {
                
                e.sender.setValue(value);
                e.sender.setText(text);
            }, 200)
        }
	}
</script>
</html>