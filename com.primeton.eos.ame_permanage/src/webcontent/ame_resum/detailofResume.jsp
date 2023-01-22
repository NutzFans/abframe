<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2019-10-28 15:29:37
  - Description:
-->
<head>
<title>简历明细信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    .asLabel{border:0;background-color:#F5F5F5;cursor:default;}
	    #file{
		    display: none;
		}
		#file + label{
		    display: inline-block;
		    width: 100px;
		    height: 30px;
		    background-color: rgb(90, 152, 222);
		    text-align: center;
		    line-height: 30px;
		    border-radius: 5px;
		}
		img{
		    display: none;
		    width: 135px;
		    height: 189px;
		}
	</style>
</head>
<body  style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fit">
	<form id="form1" method="post" action="com.primeton.eos.ame_common.ame_fileupload1.flow" target="hidden_frame1"  enctype="multipart/form-data">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<input name="resume.resumeid" id="resumeid" class="nui-hidden">
		<input name="resume.fileids" id="fileids1" class="nui-hidden"/>
		<input name="resume.fileids1" id="fileids" class="nui-hidden"/>
		<input name="resume.labelid" id="labelid1" class="nui-hidden"/>
			<legend >基本信息</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:130px;">姓名:</td>
	            		<td name="resume.empname" id="empname" style="width:170px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="font-size:12px;width:130px;">性别:</td>
	            		<td name="resume.gender" id="gender" style="width:170px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:130px;">出生日期:</td>
	            		<td name="resume.birthdate" id="birthdate" style="width:170px;" class = "asLabel"></td>
	            		<td rowspan="8"style="width:130px;" align="center">
							<img src="" alt="" id="myimg"/>
							<input type="hidden" name="atFileupload/fileCatalog" id="fileCatalog1" value=""/>
							<input type="hidden" name="remarkList1" disabled="true" id="filey1"  size="30" validateAttr="allowNull=false"  size="45">
							<input type="file" id="file" accept="image/jpg,image/jpeg,image/png,image/PNG" style="width:100%;" name="uploadfile1">
						    <label for="file">个人照片</label>
					    <td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">联系电话:</td>
	            		<td name="resume.tel" id="tel" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">私人邮箱:</td>
	            		<td name="resume.selfemail" id="selfemail" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">联系地址:</td>
	            		<td name="resume.mailaddress" id="mailaddress" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">婚姻状况:</td>
	            		<td name="resume.marristatus" id="marristatus" style="width:120px;" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">求职状态:</td>
	            		<td name="resume.applystatus" id="applystatus" style="width:120px;" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">发布城市:</td>
	            		<td name="resume.announcecity" id="announcecity" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">职位分类:</td>
	            		<td name="resume.jobscatagory" id="jobscatagory" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">应聘日期:</td>
	            		<td name="resume.applydate" id="applydate" style="width:120px;" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">目前居住地:</td>
	            		<td name="resume.currentadress" id="currentadress" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">应聘职位:</td>
	            		<td name="resume.applyoccupation" id="applyoccupation" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">工作年月:</td>
	            		<td name="resume.workdate" id="workdate" style="width:120px;" class = "asLabel"></td>
						<td align="right" style="width:80px;">户口所在地:</td>
	            		<td name="resume.haddress" id="haddress" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">学历:</td>
	            		<td name="resume.education" id="education" style="width:120px;" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">毕业学校:</td>
	            		<td name="resume.school" id="school" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">专业:</td>
	            		<td name="resume.specialty" id="specialty" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">毕业时间:</td>
	            		<td name="resume.highestoutdate" id="highestoutdate" style="width:120px;" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">邮编:</td>
	            		<td name="resume.postcode" id="postcode" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">最近一家公司:</td>
	            		<td name="resume.currentcompany" id="currentcompany" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">最近一个职位:</td>
	            		<td name="resume.currentoccupation" id="currentoccupation" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">目前薪资:</td>
	            		<td name="resume.currentincome" id="currentincome" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">期望薪资:</td>
	            		<td name="resume.expectincome" id="expectincome" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">工作年限:</td>
	            		<td name="resume.workingyear1" id="workingyear1" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">简历状态:</td>
	            		<td name="resume.interviewstatus" id="interviewstatus" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">推荐人：</td>
	            		<td name="resume.referrer" id="referrer" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">技术级别:</td>
	            		<td name="resume.technology" id="technology" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">招聘渠道：</td>
	            		<td name="resume.recruitway" id="recruitway" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">招聘渠道说明：</td>
	            		<td name="resume.recruitwayexp" id="recruitwayexp" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:40px;">招聘专员：</td>
	            		<td name="resume.recruitername" id="recruitername" style="width:80px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">备注:</td>
	            		<td style="width:120px;" align="left"  colspan="7"  class = "asLabel" id="remark"></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">标签:</td>
	            		<td style="width:120px;" align="left"  colspan="3"  class = "asLabel" id="label"></td>
	            		<td align="right" style="width:80px;"></td>
	            		<td style="width:320px;" align="left">    
	                		<input id="labelid" class="nui-dictcombobox"style="width:63%;"  allowInput="true" textField="labelcontent" valueField="labelid" searchField="content" url="com.primeton.eos.ame_permanage.ame_resum.queryResumeLabel.biz.ext" onValueChanged = "validation"/>
	                		<a class="nui-button"onclick="addlabel()" style="width:32%;" >增加标签</a>
                		</td>
					</tr>
				</table>
			</div>
		</fieldset>
	</form>
	
	<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		<legend>简历附件</legend>
		<jsp:include page="/ame_common/addFiles.jsp"/>
		<jsp:include page="/ame_common/detailAndDelFile.jsp"/>
	</fieldset>
	
	<div id="body_tab" class="nui-tabs" activeIndex="0" style="width: 100%;height:100%;padding: 0">
		<div title="关联招聘需求" id = "interview" name = "interview">
			<div style="width:140px;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" iconCls="icon-add" id="add2" onclick="addRow('grid_recommend')">增加</a>
		                        <a class="nui-button" iconCls="icon-remove" id="delete2" onclick="removeRow('grid_recommend')">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
		    <div id="grid_recommend" class="nui-datagrid" style="width:100%;height:auto;" dataField="resumRecommends"
	            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
	            url="com.primeton.eos.ame_permanage.ame_resum.getRecommend.biz.ext" allowSortColumn="true" allowCellWrap="true" onrowclick="selectedchange">			            
	            <div property="columns">
	            	<div type="checkcolumn" width="20px"></div>
	            	<input field="resumeid" class="nui-hidden" visible="false">
	            	<div field="omRecruit.recruitid" displayField="omRecruit.recruitno" width="40" headerAlign="center" align="left" allowSort="true" dateFormat="yyyy-MM-dd">招聘需求编号
	                	<input property="editor" class="nui-buttonedit" onbuttonclick=showRecuit />
	                </div>
	                <div field="candidatestatus" width="60" headerAlign="center" align="left" renderer="getcandidatestatuse">面试状态
	                	<input property="editor" class="nui-dictcombobox" shownullItem="false"  dictTypeId="INTERVIEW_RECOMMEND_STATUS"/>
	                </div>
	                <div field="omRecruit.orgname" width="80" headerAlign="center" align="left">招聘部门 </div>
	                <div field="omRecruit.recpositionname" width="80" headerAlign="center" align="left">招聘职位 </div>
	                <div field="omRecruit.jobtype" width="40" headerAlign="center" align="left" renderer="getJobType">人员性质 </div>
	                <div field="omRecruit.position" width="60" headerAlign="center" align="left" renderer="getPosition">员工属性 </div>
	                <div field="recommendcontent" width="150" headerAlign="center" align="left">推荐反馈
	                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
	                </div>
					<div field="files1" renderer="onFileRenderer" width="250" align="left" headerAlign="center">背景调查附件</div>
            	</div>
        	</div>
			<div id="tabs1" class="nui-tabs" ctiveIndex="0" style="width:100%;height:auto;">
				
			</div><%--
			<div style="width:140px;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" iconCls="icon-add" id="add2" onclick="addRow('grid_interview')">增加</a>
		                        <a class="nui-button" iconCls="icon-remove" id="delete2" onclick="removeRow('grid_interview')">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
		    <div id="grid_interview" class="nui-datagrid" style="width:100%;height:auto;" dataField="resumInterviews"
	            showPager="false" allowCellEdit="false" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
	            url="com.primeton.eos.ame_permanage.ame_resum.getInterview.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
	            <div property="columns">
	            	<div type="checkcolumn" width="20px"></div>
	            	<input field="interviewid" class="nui-hidden" visible="false">
	            	<div field="interviewroundes" width="15" headerAlign="center" align="center">轮次
						<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
					</div>
					<div field="status" width="40" headerAlign="center"  align="center" allowSort="true" renderer="getinterviewstatus">面试状态
						<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="INTERVIEW_STATUS" />
					</div>
					<div field="interviewdtae" width="50" headerAlign="center" align="center" allowSort="true" dateFormat="yyyy-MM-dd H:mm:ss">面试时间
						<input property="editor" class="nui-datepicker" timeFormat="H:mm:ss" showTime="true" showOkButton="true" showClearButton="false" style="width:100%;"  dateFormat="yyyy-MM-dd H:mm:ss"/>
					</div>
	                <div field="interviewer" displayField="empname"width="40" headerAlign="center" align="left" >面试人
						<input property="editor" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false"/>
					</div>
					<div field="positionname" width="45" headerAlign="center"  align="center" allowSort="true" renderer="getposition">面试官角色
						<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="INTERVIEWER_ROLE" />
					</div>
	                <div field="applyoccupation" width="0" headerAlign="center" align="left">面试岗位
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
	                </div>
					<div field="linkman" displayField="linkmanname"width="45" headerAlign="center" align="center" >联系人
						<input property="editor" class="nui-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext">
					</div>
					<div field="linktel" width="40" headerAlign="center" align="center">联系人电话
						<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
					</div>
					<div field="interviewtype" width="45" headerAlign="center"  align="center" allowSort="true" renderer="getinterviewType">面试方式
						<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="INTERVIEW_TYPE" />
					</div>
					<div field="venue" width="70" headerAlign="center" align="left">面试地点
						<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
					</div>
					<div field="feedbackstatus" width="45" headerAlign="center" align="center" renderer="getfeedbackstatus">反馈意见</div>
	                <div field="feedback" width="200" headerAlign="center" align="left">面试反馈
	                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
	                </div>
					<div field="orientation" width="0" headerAlign="center" align="left">意向薪资待遇说明</div>
            	</div>
        	</div>--%>
		</div>
		<div title="经历信息">
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
		            	<div field="startdate" width="30" headerAlign="center"  align="center" dateFormat="yyyy-MM-dd" renderer="onDealDate">开始时间
		                	<input property="editor" class="nui-datepicker" dateFormat="yyyy-MM-dd"/>
		                </div>
		                <div field="enddate" width="30" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" renderer="onDealDate">截止时间
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
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend >工作经历</legend>
				<div style="width:140px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-add" id="add1" onclick="addRow('workExp')">增加</a>
			                        <a class="nui-button" iconCls="icon-remove" id="delete1" onclick="removeRow('workExp')">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
			    <div id="workExp" class="nui-datagrid" style="width:100%;height:auto;" dataField="workExp"
		            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
		            url="com.primeton.eos.ame_resume.resumeManage.getWorkExp.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
		            <div property="columns">
		            	<div type="checkcolumn" width="20px"></div>
		            	<input field="resworkexpid" class="nui-hidden" visible="false">
		            	<div field="startdate" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left" allowSort="true">服务开始年月
		                	<input property="editor" class="nui-monthpicker" dateFormat="yyyy-MM" inputStyle="text-align: left"/>
		                </div>
		                <div field="enddate" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left">服务截止年月
		                	<input property="editor" class="nui-monthpicker" dateFormat="yyyy-MM" inputStyle="text-align: left"/>
		                </div>
		                <div field="companyname" width="80" headerAlign="center" align="left">公司名称
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
		                </div>
		                <div field="duty" width="80" headerAlign="center" align="left" allowCellWrap="true">担任职务
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
		                </div>
		                <div field="workdescription" width="200" headerAlign="center" align="left" allowCellWrap="true">工作说明
		                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
		                </div>
		            </div>
		        </div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend >项目经验 </legend>
				<div style="width:140px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-add" id="add2" onclick="addRow('projExp')">增加</a>
			                        <a class="nui-button" iconCls="icon-remove" id="delete2" onclick="removeRow('projExp')">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
			    <div id="projExp" class="nui-datagrid" style="width:100%;height:auto;" dataField="projExp"
		            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
		            url="com.primeton.eos.ame_resume.resumeManage.getProjExp.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
		            <div property="columns">
		            	<div type="checkcolumn" width="20px"></div>
		            	<input field="resprojexpid" class="nui-hidden" visible="false">
		            	<div field="beginenddate" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left" allowSort="true">开始年月
		                	<input property="editor" class="nui-monthpicker" dateFormat="yyyy-MM" inputStyle="text-align: left"/>
		                </div>
		                <div field="enddate" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left">截止年月
		                	<input property="editor" class="nui-monthpicker" dateFormat="yyyy-MM" inputStyle="text-align: left"/>
		                </div>
		                <div field="custname" width="80" headerAlign="center" align="left">客户名称
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
		                </div>
		                <div field="projectname" width="80" headerAlign="center" align="left">项目名称
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
		                </div>
		                <div field="projectintroduce" width="200" headerAlign="center" align="left">项目介绍
		                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
		                </div>
		                <div field="projectduty" width="200" headerAlign="center" align="left">项目职责及主要工作
		                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
		                </div>
	            	</div>
	        	</div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>有关证件(书)</legend>
				<div style="width:200px;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			                <tr>
			                    <td style="width:100%;">
			                        <a class="nui-button" iconCls="icon-add" id="add3" onclick="addCert()">增加</a>
			                        <a class="nui-button" iconCls="icon-edit" id="add3" onclick="updateCert()">修改</a>
			                        <a class="nui-button" iconCls="icon-remove" id="delete3" onclick="removeRow('cert')">删除</a>
			                    </td>
			                </tr>
			            </table>           
			        </div>
			    </div>
			    <div id="cert" class="nui-datagrid" style="width:100%;height:auto;" dataField="cert"
		            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
		            url="com.primeton.eos.ame_resume.resumeManage.getCert.biz.ext" allowCellWrap="true">			            
		            <div property="columns">
		            	<div type="checkcolumn" width="20px"></div>
		            	<input field="rescertid" class="nui-hidden" visible="false">
		                <div field="cardtype" width="120" renderer="onCertTypeRenderer" headerAlign="center" align="left">证件(书)类型
		                	<input property="editor" class="nui-dictcombobox" inputStyle="text-align: left" multiSelect="false" dictTypeId="AME_CERTTYPE"/>
		                </div>
		                <div field="cardno" width="80" headerAlign="center" align="left">证件(书)号码
		                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="32"/>
		                </div>
		                <div field="startdate" width="120" headerAlign="center" dateFormat="yyyy-MM-dd"  align="left" renderer="onDealDate">有效开始日期
		                	<input property="editor" class="nui-datepicker" inputStyle="text-align: left" dateFormat="yyyy-MM-dd"/>
		                </div>
		                <div field="enddate" width="120" headerAlign="center" dateFormat="yyyy-MM-dd"  align="left" renderer="onDealDate">有效截止日期
		                	<input property="editor" class="nui-datepicker" inputStyle="text-align: left" dateFormat="yyyy-MM-dd"/>
		                </div>
		                <div field="files" renderer="onFileRenderer" width="200" hight="100"  align="center" headerAlign="center">附件</div>
		                <div field="fileid" displayField="filename" width="200" headerAlign="center" align="left" visible="false">附件
		                	<input property="editor" class="nui-hidden" style="width: 200px" minWidth="200" minHeight="80" />
		                </div>
		                <div field="remark" width="80" headerAlign="center" align="left">备注
		                	<input property="editor" class="nui-textarea" style="width: 150px" minWidth="200" minHeight="80" maxLength="255"/>
		                </div>
	            	</div>
	        	</div>
		    </fieldset>
		</div>
		<div title="招聘接触日志" id = "tachLog" name = "tachLog">
			<div style="width:100%;">
	        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            	<table style="width:100%;">
	            		<tr>
	                    	<td style="width:20%;" id="innerHtml">
	                    		<a class="nui-button" iconCls="icon-add" onclick="addlog()" plain="true">增加</a>
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>
			<div id="grid_001" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" 
				url="com.primeton.eos.ame_common.operatLog.getOperatLogs.biz.ext" dataField="logs" 
				allowCellEdit="true" allowCellSelect="true" multiSelect="true" allowCellWrap="true" allowCellWrap="true">
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="20" >编号</div>
					<div field="userid" displayField="empname"width="40" headerAlign="center" align="left" >接触人
						<%--<input property="editor" class="nui-buttonedit" onbuttonclick="showEmployee" showClose="false" required="true" allowInput="false"/>--%>
					</div>
					<div field="operatetime" width="80"  align="center" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm:ss">接触时间</div>
					<div field="loginfo" width="400"headerAlign="left"align="left" >接触内容</div>
				</div>
			</div>
		</div>
		<%--<div title="推荐记录" id = "recommend" name = "recommend">
			
		</div>--%>
	</div>
</div>

<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" id="saveExpRei" iconCls="icon-ok" style="width: 60px;margin-right: 20px;">保存</a>
	<a class="nui-button" onclick="onCancel('cancel')" id="closeResume" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
</div>
	
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
	<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
	<input type="hidden" name="downloadFile" filter="false"/>
	<input type="hidden" name="fileName" filter="false"/>
</form> 
<iframe name='hidden_frame1' id="hidden_frame1" style='display:none'></iframe>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");
	//学历信息
	var education = nui.get("Education");
	var workExp = nui.get("workExp");
	var projExp = nui.get("projExp");
	var grid_recommend = nui.get("grid_recommend");
	var cert = nui.get("cert");
	var body_tab=nui.get("body_tab");
	var tabs1 =nui.get("tabs1");
	var resumeid = '<%=request.getParameter("resumeid")%>';
	var action = "";
	
	init();
	function init(){
		if(resumeid != null && resumeid != ''){
			var jsoncriteria = {"criteria": {"_expr[0]": { "resumeid": resumeid}},"sortField":"resumeid","sortOrder":"desc"};
            nui.ajax({
				url: "com.primeton.eos.ame_resume.resumeManage.queryResume.biz.ext",
				data: jsoncriteria,
				type: 'POST',
				cache: false,
				contentType: 'text/json',
				success: function(o){
					if(o.queryResume.length>0){
						var data = {action: "update", "resume": o.queryResume[0] };
						SetData(data);
					}
					
				}
			});
		}
	}
	
	function SetData(data){
		if(data){
			if(data.action=="update"){
				action="update";
				data = nui.clone(data);
				var json = data.resume;
				form.setData(data);
				document.getElementById("empname").innerHTML = json.empname == null ? "" : json.empname;
				document.getElementById("gender").innerHTML = json.gender == null ? "" : nui.getDictText('ABF_GENDER',json.gender);
				document.getElementById("birthdate").innerHTML = json.birthdate == null ? "" : json.birthdate;
				document.getElementById("marristatus").innerHTML = json.marristatus == null ? "" : nui.getDictText('ABF_MARRITYPE',json.marristatus);
				document.getElementById("applystatus").innerHTML = json.applystatus == null ? "" : nui.getDictText('AME_APPLYSTATUS',json.applystatus);
				document.getElementById("announcecity").innerHTML = json.announcecity == null ? "" : json.announcecity;
				document.getElementById("jobscatagory").innerHTML = json.jobscatagory == null ? "" : nui.getDictText('AME_POSITION_MEMO',json.jobscatagory);
				document.getElementById("applyoccupation").innerHTML = json.applyoccupation == null ? "" : json.applyoccupation;
				document.getElementById("applydate").innerHTML = json.applydate == null ? "" : json.applydate;
				document.getElementById("haddress").innerHTML = json.haddress == null ? "" : json.haddress;
				document.getElementById("workdate").innerHTML = json.workdate == null ? "" : json.workdate;
				document.getElementById("workingyear1").innerHTML = (json.workingyear1 == null ? "" : json.workingyear1)+'年';
				document.getElementById("education").innerHTML = json.education == null ? "" : nui.getDictText('DEGREE',json.education);
				document.getElementById("school").innerHTML = json.school == null ? "" : json.school;
				document.getElementById("specialty").innerHTML = json.specialty == null ? "" : json.specialty;
				document.getElementById("highestoutdate").innerHTML = json.highestoutdate == null ? "" : json.highestoutdate;
				document.getElementById("tel").innerHTML = json.tel == null ? "" : json.tel;
				document.getElementById("selfemail").innerHTML = json.selfemail == null ? "" : json.selfemail;
				document.getElementById("mailaddress").innerHTML = json.mailaddress == null ? "" : json.mailaddress;
				document.getElementById("postcode").innerHTML = json.postcode == null ? "" : json.postcode;
				document.getElementById("currentcompany").innerHTML = json.currentcompany == null ? "" : json.currentcompany;
				document.getElementById("currentoccupation").innerHTML = json.currentoccupation == null ? "" : json.currentoccupation;
				document.getElementById("currentincome").innerHTML = (json.currentincome == null ? "" : json.currentincome)+'千元（k）';
				document.getElementById("expectincome").innerHTML = (json.expectincome == null ? "" : json.expectincome)+'千元（k）';
				document.getElementById("technology").innerHTML = json.technology == null ? "" : nui.getDictText('AME_TECH',json.technology);
				document.getElementById("interviewstatus").innerHTML = json.interviewstatus == null ? "" : nui.getDictText('INTERVIEW_STATUS_OUT',json.interviewstatus);
				document.getElementById("referrer").innerHTML = json.referrer == null ? "" : json.referrername;
				document.getElementById("recruitway").innerHTML = json.recruitway == null ? "" : nui.getDictText('RECRUIT_WAY',json.recruitway);
				document.getElementById("recruitwayexp").innerHTML = json.recruitwayexp == null ? "" : nui.getDictText('RECRUIT_WAYEXP',json.recruitwayexp)==null || nui.getDictText('RECRUIT_WAYEXP',json.recruitwayexp)==''?json.recruitwayexp:nui.getDictText('RECRUIT_WAYEXP',json.recruitwayexp);
				document.getElementById("remark").innerHTML = json.remark == null ? "" : json.remark;
				document.getElementById("recruitername").innerHTML = json.recruitername == null ? "" : json.recruitername;
				
	            workExp.load({ resumeid: json.resumeid});
		        //学历信息
	            education.load({ resumeid: json.resumeid});
	            workExp.sortBy("startdate", "desc");
	            projExp.load({ resumeid: json.resumeid});
	            projExp.sortBy("beginenddate", "desc");
	            grid_recommend.sortBy("omRecruit.recruitno", "desc");
	            grid_recommend.load({"criteria": {"_expr[0]": { "resumeid": json.resumeid}}},function(){
	            	var recommends = grid_recommend.getData();
	            	for(var i=0;i<recommends.length;i++){
	            		setInterviewTabs(recommends[i]);
	            	}
	            });
	            cert.load({ resumeid: json.resumeid});
	            nui.get("grid_001").load({"groupid":"AME_RESUME","relationid":json.resumeid});
	          <%--  var userid = json.userid;
	            if(!(userid==null || userid=="")){
	            	nui.get("userid").disable();
	            }--%>
	            
	            var labeljson = {"criteria": {"_expr[0]": { "ameResume.resumeid": json.resumeid}}};
	            nui.ajax({
					url: "com.primeton.eos.ame_permanage.ame_resum.getResumlabel.biz.ext",
					data: labeljson,
					type: 'POST',
					cache: false,
					contentType: 'text/json',
					success: function(o){
						var resumelabels = o.resumelabels;
						var id = '';
						var name = '';
						for (var i=0;i<resumelabels.length;i++){
							if(id == ''){
								id=id+resumelabels[i].ameLabel.labelid;
								name=name+resumelabels[i].ameLabel.labelcontent;
							}else{
								id=id+","+resumelabels[i].ameLabel.labelid;
								name=name+","+resumelabels[i].ameLabel.labelcontent;
							}
						}
						document.getElementById("label").innerHTML = name;
						nui.get("labelid1").setValue(id);
					}
				});
				//简历附件
				nui.get("grid_0").load({"groupid":"AmeResumefile","relationid":json.resumeid});	
				//简历照片
				var picturejson = {"groupid":"AmeResume","relationid":json.resumeid};
				nui.ajax({
					url: "com.primeton.eos.ame_common.file.getFiles.biz.ext",
					data: picturejson,
					type: 'POST',
					cache: false,
					contentType: 'text/json',
					success: function(o){
						if(o.files.length>0){
							myimg.src = "/file/"+o.files[0].fileNewName;
		    				myimg.style.display = "block";
						}
					}
				});
            }
        }
	}
	
	function addRow(gridid){
		var newRow = { name: "New Row",status: "0" };
        var grid = nui.get(gridid);
        grid.addRow(newRow, grid.getData().length);
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
	
	function addCert(){
		nui.open({
			url: "<%=request.getContextPath() %>/ame_resume/addCertDetail.jsp",
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
					url: "<%=request.getContextPath() %>/ame_resume/addCertDetail.jsp?",
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
	
	function onCertTypeRenderer(e){
		return nui.getDictText('AME_CERTTYPE',e.value);//设置业务字典值
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
	
	function test1(msg){
		if (msg == null || msg == "null" || msg == ''){
		}else{
    		nui.get("fileids1").setValue(msg);
    	}
    	document.getElementById("fileCatalog").value="AmeResumefile";
		form2.submit();
    }
	
	function onOk(){
		if(form.validate()){
			if(confirm("确认更新简历吗？")){
				form1.submit();
			}else{
				return;
			}
		}
	}
	function SaveData(){
		var addURL = "com.primeton.eos.ame_resume.resumeManage.addResume.biz.ext";
		var updateURL = "com.primeton.eos.ame_resume.resumeManage.updateResume.biz.ext";
		var saveURL = "";
	
		var a =[];
		var resume = form.getData();
		var workExp = nui.get("workExp").getData();
		if(workExp==a){
			workExp = null;
		}
		var projExp = nui.get("projExp").getData();
		if(projExp==a){
			projExp = null;
		}
		var cert = nui.get("cert").getData();
		if(cert==a){
			cert = null;
		}
		var interviews =[];
		var recommends = grid_recommend.getChanges();
		for(var i=0;i<recommends.length;i++){
			var interviews_one = nui.get('interviewtab_'+recommends[i].omRecruit.recruitid).getChanges();
			
			for(var j=0;j<interviews_one.length;j++){
				interviews.push(interviews_one[j]);
			}
		}
		var education = nui.get("Education").getChanges();
		
		var resumeid = nui.get("resumeid").getValue();
		if(resumeid==null||resumeid==""){
			saveURL = addURL;
			form.validate();
			var json = nui.encode({"resume":resume.resume, "AmeResumeWorkexp":workExp, "AmeResumeProjexp":projExp, "AmeResumeCert":cert,"education":education});
			if(form.validate()){
	    		nui.ajax({
	    			url: saveURL,
	    			data: json,
	    			type: 'POST',
	    			cache: false,
	    			contentType: 'text/json',
	    			success: function(text){
	    				if(text.returnVal==1){
	    					alert("增加成功");
		    				CloseWindow("save");
		    			}else if(text.returnVal==2){
		    				alert("增加基本信息失败，请重新尝试");
		    			}else if(text.returnVal==3){
		    				alert("增加工作经历失败，请重新尝试");
		    			}else if(text.returnVal==4){
		    				alert("增加项目经验失败，请重新尝试");
		    			}else if(text.returnVal==5){
		    				alert("增加有关证件（证书）失败，请重新尝试");
		    			}else if(text.returnVal==6){
		    				alert("该工号对应的员工简历已存在，请确认是否正输入！");
		    			}else{
		    				alert("增加失败，请重新尝试");
		    			}
	    			},
	    			error: function(jqXHR, textStatus, errorThrown){
	    				CloseWindow();
	    			}
	    		});
			}else{
				return;
			}
		}else{
			saveURL = updateURL;
			form.validate();
			var json = nui.encode({"resume":resume.resume, "AmeResumeWorkexp":workExp, "AmeResumeProjexp":projExp, "AmeResumeCert":cert,"interviews":interviews,"recommends":recommends,"education":education});
			if(form.validate()){
	    		nui.ajax({
	    			url: saveURL,
	    			data: json,
	    			type: 'POST',
	    			cache: false,
	    			contentType: 'text/json',
	    			success: function(text){
	    				if(text.returnVal==1){
	    					alert("修改成功");
		    				CloseWindow("save");
		    			}else if(text.returnVal==2){
		    				alert("修改基本信息失败，请重新尝试");
		    			}else if(text.returnVal==3){
		    				alert("修改工作经历失败，请重新尝试");
		    			}else if(text.returnVal==4){
		    				alert("修改项目经验失败，请重新尝试");
		    			}else if(text.returnVal==5){
		    				alert("修改有关证件（证书）失败，请重新尝试");
		    			}
		    			else if(text.returnVal==6){
		    				alert("删除原有数据失败，请重新尝试");
		    			}
		    			else if(text.returnVal==7){
		    				alert("修改面试情况失败，请重新尝试");
		    			}
		    			else if(text.returnVal==8){
		    				alert("修改推荐失败，请重新尝试");
		    			}else if(text.returnVal==9){
		    				alert("增加学历失败，请重新尝试");
		    			}else{
		    				alert("修改失败，请重新尝试");
		    			}
	    			},
	    			error: function(jqXHR, textStatus, errorThrown){
	    				CloseWindow();
	    			}
	    		});
			}else{
				return;
			}
		}
	}
	
	//-------------------------------------招聘接触日志开始
	function addlog(){
		var groupid = "AME_RESUME";
		var relationid = nui.get("resumeid").getValue();
    	nui.open({
			url:"<%=request.getContextPath() %>/ame_common/addOperatLog.jsp?groupid="+groupid+"&relationid="+relationid,
			title: "增加招聘接触日志",
			width: 800,
			height: 400,
			ondestroy: function (action) {
				if (action == "save") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.SetData();
					data = nui.clone(data);    //必须
					nui.get("grid_001").load({"groupid":groupid,"relationid":relationid});
				}
			}
		});
    }
    
    //选择接触人
	function showEmployee(e) {
        var btnEdit = this;
        nui.open({
			url:"/default/machine/SelectEmployee.jsp",
			title: "选择列表",
			width: 600,
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
    //---------------------------------------------招聘接触日志结束
    
    function showRecuit(e){
		var btnEdit = this;
	    nui.open({
			url:"/default/abframe/org/recruit/SelectRecruitno.jsp",
			title: "选择招聘需求编号",
			width: 780,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data); 
					btnEdit.setValue(data.recruitid);
		            btnEdit.setText(data.recruitno);
		            var row = grid_recommend.getSelected();
	                var updateRow = {"omRecruit.recruitid":data.recruitid,"omRecruit.recruitno":data.recruitno,"omRecruit.orgname":data.orgname,"omRecruit.recposition":data.recposition,"omRecruit.jobtype":data.jobtype,"omRecruit.position":data.position};
	                grid_recommend.updateRow(row,updateRow);
		            var allRow = grid_recommend.getSelected();
	                setInterviewTabs(allRow);
				}
			}
		});
	}
		
	function getJobType(e){
		return nui.getDictText('AME_EMPTYPE2',e.value);
	}
	function getPosition(e){
		return nui.getDictText('EMP_TYPE',e.value);
	}
	function getinterviewType(e){
		return nui.getDictText('INTERVIEW_TYPE',e.value);//设置业务字典值
	}
	function getPositioname(e){
		return nui.getDictText('AME_POSITION_MEMO',e.value);//设置业务字典值
	}
	function getcandidatestatuse(e){
		return nui.getDictText('INTERVIEW_RECOMMEND_STATUS',e.value);//设置业务字典值
	}
	
	//设置日期格式并判断当期时间是否过去时间
	function onDealDate(e){
		var date = e.value;
		if(date){
			return e.cellHtml.substring(0,10);
		}
	}
	
	function getDegree(e){
		return nui.getDictText('DEGREE',e.value);
	}
	
	function addlabel(){
		var labels=[];
		var labelid = nui.get("labelid").getValue();
		var labelcontent = nui.get("labelid").getText();
		if(labelid == labelcontent){
			labelid = null;
		}
		var label = {"labelid":labelid,"labelcontent":labelcontent};
		labels.push(label);
		var json = {"labels":labels};
		if(labelcontent == '' || labelcontent == null){
			return;
		}
    	nui.ajax({
			url: "com.primeton.eos.ame_permanage.ame_resum.insertlabels.biz.ext",
			data: json,
			type: 'POST',
			cache: false,
			contentType: 'text/json',
			success: function(o){
				var result = o.result;
				if(result == 0){
					nui.alert("标签添加失败！");
				}else{
					var labelid1 = nui.get("labelid1").getValue();
					if(labelid1 == null || labelid1 == ''){
						labelid1 = o.laborids ;
					}else{
						labelid1 = labelid1+','+o.laborids;
					}
					nui.get("labelid1").setValue(labelid1);
					nui.get("labelid").load("com.primeton.eos.ame_permanage.ame_resum.queryResumeLabel.biz.ext");
					nui.get("labelid").setValue(null);
					
					var label = document.getElementById("label").innerHTML;
					if(label == null || label == ''){
						label = labelcontent ;
					}else{
						label = label+','+ labelcontent;
					}
					document.getElementById("label").innerHTML = label;
				}
			}
		});
	}
	
	var tabnum = 0;
	function setInterviewTabs(recommends){
		var tab_1 = {name: "interviewtab_"+recommends.omRecruit.recruitid, id: "interviewtab_"+recommends.omRecruit.recruitid, title: recommends.omRecruit.recruitno+"面试安排"};
		tabnum = grid_recommend.indexOf(recommends);
		tabs1.addTab(tab_1,tabnum);
		var tabBodyEl=tabs1.getTabBodyEl (tab_1);
		var html = '<div style="width:100%;"><div class="nui-toolbar" style="border-bottom:0;padding:0px;"><table style="width:100%;"><tr><td style="width:100%;"><a class="nui-button" iconCls="icon-add" id="add2" onclick="addRow1('+"'interviewtab_"+recommends.omRecruit.recruitid+"'"+')">增加</a></td></tr></table></div></div>';//<a class="nui-button" iconCls="icon-remove" id="delete2" onclick="removeRow1('+"'interviewtab_"+Resumes.resumeid+"'"+')">删除</a>
		html = html+'<div style="width:100%;"><div class="nui-toolbar" style="border-bottom:0;padding:0px;"><table style="width:100%;"><tr><td style="width:20%;">'+recommends.omRecruit.recruitno+'面试安排</td></tr></table></div></div>';
		html = html+'<div id="'+"interviewtab_"+recommends.omRecruit.recruitid+'" class="nui-datagrid" style="width:100%;height:auto;" dataField="resumInterviews" showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" url="com.primeton.eos.ame_permanage.ame_resum.getInterview.biz.ext" allowSortColumn="true" allowCellWrap="false" oncellendedit="changeinterviewer('+"'interviewtab_"+recommends.omRecruit.recruitid+"',null"+')"><div property="columns">';
		html = html+'<div type="checkcolumn" width="20px"></div><input field="interviewid" class="nui-hidden" visible="false">';
    	html = html+'<div field="interviewroundes" width="15" headerAlign="center" align="center">轮次</div>';//<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
    	html = html+'<div field="status" width="45" headerAlign="center"  align="center" allowSort="true" renderer="getinterviewstatus">面试状态<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="INTERVIEW_STATUS" /></div>';
    	html = html+'<div field="interviewdtae" width="60" headerAlign="center" align="center" allowSort="true" dateFormat="yyyy-MM-dd H:mm:ss">面试时间<input property="editor" class="nui-datepicker" timeFormat="H:mm:ss" showTime="true" showOkButton="true" showClearButton="false" style="width:100%;"  dateFormat="yyyy-MM-dd H:mm:ss"/></div>';
        html = html+'<div field="interviewer" displayField="empname"width="45" headerAlign="center" align="center" >面试人<input property="editor" class="nui-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext"></div>';
        html = html+'<div field="positionname" width="45" headerAlign="center"  align="center" allowSort="true" renderer="getposition">面试官角色<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="INTERVIEWER_ROLE" /></div>';
    	html = html+'<div field="applyoccupation" width="0" headerAlign="center" align="center">面试岗位<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/></div>';
        html = html+'<div field="memo" width="0" headerAlign="center" align="left">面试提醒<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/></div>';
        /* html = html+'<div field="linkman" displayField="linkmanname"width="45" headerAlign="center" align="center" >联系人<input property="editor" class="nui-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext"></div>';
    	html = html+'<div field="linktel" width="40" headerAlign="center" align="center">联系人电话<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/></div>'; */
    	html = html+'<div field="interviewtype" width="60" headerAlign="center"  align="center" allowSort="true" renderer="getinterviewType">面试方式<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="INTERVIEW_TYPE" /></div>';
    	html = html+'<div field="venue" width="75" headerAlign="center" align="left">面试地点<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/></div>';
        html = html+'<div field="feedbackstatus" width="45" headerAlign="center" align="center" renderer="getfeedbackstatus">反馈意见<input property="editor" style="width:20%;" class="nui-dictcombobox" dictTypeId="AME_FEEDBACK_STATUS" width="100%" required="true" shownullItem="true"  onvaluechanged="changefeedbackstatus"/></div>';
        html = html+'<div field="feedback" width="200" headerAlign="center" align="left">面试反馈<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/></div>';
        html = html+'</div></div>';
        html = html+'<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;width:99%;"><legend>面试评价信息</legend>';
        html = html+'<iframe id="appraise'+recommends.omRecruit.recruitid+'" src="" frameborder="0" scrolling="no" height="670px" width="100%" style="text-align: center;"></iframe></fieldset>'
		$(tabBodyEl).append(html);
		nui.parse();
		
        tabs1.activeTab(tab_1);
		tabnum++;
		var grid_interview = nui.get('interviewtab_'+recommends.omRecruit.recruitid);
		var resumeid = nui.get("resumeid").getValue();
		
		var path = nui.getDictText('AME_SYSCONF','AMEPATH')+"reportJsp/showReport4Proj.jsp?rpx=/queryAppraise.rpx&recruitid="+recommends.omRecruit.recruitid+"&resumeid="+resumeid;
   		$("#appraise"+recommends.omRecruit.recruitid).attr('src',path); 
		
		grid_interview.sortBy("interviewroundes", "asc");
		grid_interview.load({"criteria": {"_expr[0]": { "ameResume.resumeid": resumeid},"_expr[1]": { "omRecruit.recruitid": recommends.omRecruit.recruitid}}},function(){
        	var interviewrows = grid_interview.getData();
        	if(interviewrows.length<=0){
        		var forminterview = new nui.Form("form_interviewScheduals");
				interviewScheduals = forminterview.getData().interviewScheduals;
        		if(interviewScheduals.length>0){
	        		for(var i=0;i<interviewScheduals.length;i++){
	        			newRow = { name: "New Row",status: "0",interviewroundes: interviewScheduals[i].interviewroundes,interviewer:interviewScheduals[i].interviewer,positionname:interviewScheduals[i].interviewerrole,empname:nui.get("interviewer"+i).getText(),linktel:interviewScheduals[i].linktel
	            					,linkman:interviewScheduals[i].linkman,linkmanname:nui.get("linkman"+i).getText(),interviewtype:interviewScheduals[i].interviewtype,venue:interviewScheduals[i].venue,applyoccupation:applyoccupation};
	        			grid_interview.addRow(newRow,i)
	        		}
        		}else{
	        		addRow1("interviewtab_"+recommends.omRecruit.recruitid)
	        		interviewScheduals = grid_interview.getData();
	        	}
        	}
    	});
	}
	
	function selectedchange(){
        var row = grid_recommend.getSelected();
        if(row.omRecruit){
        	tabs1.activeTab("interviewtab_"+row.omRecruit.recruitid);
        }
	}
	
	function changeinterviewer(gridid,num){
		if (gridid == 'input'){
			var linkman = nui.get("linkman"+num).getValue();
			if(linkman.indexOf(",")!=-1){
				nui.alert("面试安排的联系人唯一！");
	            nui.get("linkman"+num).setValue(null);
    			nui.get("linktel"+num).setValue(null);
    			changeinterviewScheduals("linkman",num);
	            return;
			}
			nui.ajax({
	            url: "com.primeton.eos.ame_permanage.ame_leave_apply.getEmpByUserid.biz.ext",
	            type: 'POST',
	            data: {userid:linkman},
	            contentType:'text/json',
	            async:false,
	            success: function (text) {
	                var emp = text.emp;
	                if(emp != null && emp != ''){
            			nui.get("linktel"+num).setValue(emp.mobileno);
	                }
	            }
		     }); 
		     changeinterviewScheduals("linkman",num);
		     return;
		}
	 	var grid = nui.get(gridid);
        var row = grid.getSelected();
        <%--if(row.interviewer != null && row.interviewer != ''){
	        if(row.interviewer.indexOf(",")!=-1){
	        	nui.alert("每一条面试安排的面试人唯一！");
	            var updateRow = {"interviewer":null,"empname":null};
	            grid.updateRow(row,updateRow);
	            return;
	        }
        }--%>
        if(row.linkman != null && row.linkman != ''){
        	if(row.linkman.indexOf(",")!=-1){
	        	nui.alert("每一条面试安排的联系人唯一！");
	            var updateRow = {"linkman":null,"linkmanname":null,"linktel":null};
	            grid.updateRow(row,updateRow);
	            return;
	        }else{
	        	nui.ajax({
		            url: "com.primeton.eos.ame_permanage.ame_leave_apply.getEmpByUserid.biz.ext",
		            type: 'POST',
		            data: {userid:row.linkman},
		            contentType:'text/json',
		            async:false,
		            success: function (text) {
		                var emp = text.emp;
		                if(emp != null && emp != ''){
		                	var updateRow = {"linktel":emp.mobileno};
	            			grid.updateRow(row,updateRow);
		                }
		            }
			     }); 
	        }
        }
	}
	
	
	
	function addRow1(gridid){
		var newRow = { name: "New Row"};
        var grid = nui.get(gridid);
		if(gridid.indexOf("interviewtab_")>=0){
			newRow = { name: "New Row",status: "0",interviewroundes: grid.getData().length+1,"omRecruit.recruitid":gridid.replace("interviewtab_",""),"ameResume.resumeid":nui.get("resumeid").getValue()};
		}
        grid.addRow(newRow,grid.getData().length);
	}
	
	function removeRow1(gridid){
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
	
	var myimg = document.getElementById('myimg');
	var file = document.getElementById('file');
	file.onchange = function(){
	    var url;
	    var agent = navigator.userAgent;   //检测浏览器版本
	    if (agent.indexOf("MSIE")>=1) {
	      url = file.value;
	    } else if(agent.indexOf("Firefox")>0) {
	      url = window.URL.createObjectURL(file.files.item(0));
	    } else if(agent.indexOf("Chrome")>0) {
	      url = window.URL.createObjectURL(file.files.item(0));
	    }
	    myimg.src = url
	    myimg.style.display = "block";
	    
	    var flag = 'filey1';
	    var objvalue = this.value;
	    if(objvalue=="" ||objvalue==null){
			return false;
		}else{
			var textname=objvalue.split("\\");
			textname=textname[textname.length-1];
			textname=textname.split(".")[0];
			eval("document.getElementById('"+flag+"')").value = textname;
			eval("document.getElementById('"+flag+"')").disabled =false;
		}
	}
	
	function getposition(e){
		return nui.getDictText('AME_POSITION_MEMO',e.value);//设置业务字典值
	}
	function getinterviewstatus(e){
		return nui.getDictText('INTERVIEW_STATUS',e.value);//设置业务字典值
	}
	function getfeedbackstatus(e){
		return nui.getDictText('AME_FEEDBACK_STATUS',e.value);//设置业务字典值
	}
	function getposition(e){
		return nui.getDictText('INTERVIEWER_ROLE',e.value);//设置业务字典值
	}
	function getinterviewType(e){
		return nui.getDictText('INTERVIEW_TYPE',e.value);//设置业务字典值
	}
</script>
</html>