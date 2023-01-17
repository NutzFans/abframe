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
  - Date: 2019-10-21 14:39:02
  - Description:
-->
<head>
	<title>新增/修改简历</title>
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
<body style="width:100%;height:100%;padding:0px;margin:0px;">
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
	            		<td style="width:170px;" align="left">    
	                		<input name="resume.empname" id="empname" class="nui-textbox" required="true" style="width:100%;"  onvaluechanged="changeempname"/>
	            		</td>
	            		<td align="right" style="font-size:12px;width:130px;">性别:</td>
	            		<td style="width:170px;" align="left">    
	                		<input name="resume.gender" id="gender" class="nui-dictcombobox" required="true" dictTypeId="ABF_GENDER" style="width:100%;" />
	            		</td>
	            		<td align="right" style="width:130px;">出生日期:</td>
	            		<td style="width:170px;">    
	                		<input name="resume.birthdate" id="birthdate" class="nui-datepicker" showTodayButton="false" style="width:100%;"/>
	            		</td>
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
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.tel" id="tel" required="true" class="nui-textbox"style="width:100%;" onvaluechanged="checkmobileno"/>
	            		</td>
						<td align="right" style="width:80px;">私人邮箱:</td>
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.selfemail" id="selfemail" class="nui-textbox" required="true" style="width:100%;"/>
	            		</td>
						<td align="right" style="width:80px;">联系地址:</td>
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.mailaddress" id="mailaddress" class="nui-textbox"style="width:100%;"/>
	            		</td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">婚姻状况:</td>
	            		<td style="width:120px;">    
	                		<input name="resume.marristatus" id="marristatus" class="nui-dictcombobox" dictTypeId="ABF_MARRITYPE" style="width:100%;"/>
	            		</td>
	            		<td align="right" style="width:80px;">求职状态:</td>
	            		<td style="width:120px;">    
	                		<input name="resume.applystatus" id="applystatus" class="nui-dictcombobox" dictTypeId="AME_APPLYSTATUS" style="width:100%;"/>
	            		</td>
	            		<td align="right" style="width:80px;">发布城市:</td>
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.announcecity" id="announcecity" class="nui-textbox" style="width:100%;" required="true"/>
	            		</td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">职位分类:</td>
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.jobscatagory" id="jobscatagory"  required="true" class="nui-dictcombobox" dictTypeId="AME_POSITION_MEMO" style="width:100%;" onvaluechanged="setPositionName" allowInput="true"/>
	            		</td>
	            		<td align="right" style="width:80px;">应聘日期:</td>
	            		<td style="width:120px;">    
	                		<input name="resume.applydate" id="applydate" class="nui-datepicker" showTodayButton="false" style="width:100%;"/>
	            		</td>
	            		<td align="right" style="width:80px;">目前居住地:</td>
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.currentadress" id="currentadress" class="nui-textbox" style="width:100%;"/>
	            		</td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">应聘职位:</td>
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.applyoccupation" id="applyoccupation"  required="true" class="nui-textbox" style="width:100%;"/>
	            		</td>
	            		<td align="right" style="width:80px;">工作年月:</td>
	            		<td style="width:120px;">    
	                		<input name="resume.workdate" id="workdate" class="nui-datepicker" showTodayButton="false" style="width:100%;"/>
	            		</td>
						<td align="right" style="width:80px;">户口所在地:</td>
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.haddress" id="haddress" class="nui-textbox"style="width:100%;"/>
	            		</td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">学历:</td>
	            		<td style="width:120px;">    
	                		<input name="resume.education" id="education" required="true" class="nui-dictcombobox" dictTypeId="DEGREE" style="width:100%;"/>
	            		</td>
	            		<td align="right" style="width:80px;">毕业学校:</td>
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.school" id="school" required="true" class="nui-textbox"style="width:100%;"/>
	            		</td>
						<td align="right" style="width:80px;">邮编:</td>
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.postcode" id="postcode" class="nui-textbox"style="width:100%;"/>
	            		</td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">毕业时间:</td>
	            		<td style="width:120px;">    
	                		<input name="resume.highestoutdate" id="highestoutdate" class="nui-datepicker" showTodayButton="false" style="width:100%;"/>
	            		</td>
	            		<td align="right" style="width:80px;">专业:</td>
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.specialty" id="specialty" class="nui-textbox"style="width:100%;"/>
	            		</td>
						<td align="right" style="width:80px;">最近一家公司:</td>
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.currentcompany" id="currentcompany" required="true" class="nui-textbox"style="width:100%;"/>
	            		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">最近一个职位:</td>
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.currentoccupation" id="currentoccupation" class="nui-textbox"style="width:100%;"/>
	            		</td>
	            		<td align="right" style="width:80px;">目前月薪:</td>
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.currentincome" id="currentincome" class="nui-spinner"  allowLimitValue="false" style="width:76%;" format="n2" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right;"/>千元(k)
	            		</td>
	            		<td align="right" style="width:80px;">期望薪资:</td>
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.expectincome" id="expectincome" class="nui-spinner"  allowLimitValue="false" style="width:76%;" format="n2" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right;"/>千元(k)
	            		</td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">工作年限:</td>
	            		<td style="width:120px;" align="left">    
	                		<input name="resume.workingyear1" id="workingyear1" class="nui-spinner"  allowLimitValue="false" style="width:90%;" format="n2" changeOnMousewheel="false" showbutton="false" inputStyle="text-align: right;"/>年
	            		</td>
						<td align="right" style="width:80px;">简历状态:</td>
	            		<td style="width:120px;" align="left" class = "asLabel">
	            			<input name="resume.interviewstatus" id="interviewstatus" class="nui-dictcombobox" dictTypeId="INTERVIEW_STATUS_OUT" style="width:100%;" style="width:100%;" required="true"/>
	            		</td>
	            		<td align="right">推荐人：</td>
	            		<td align="left">
	            			<input name="resume.referrer" id="referrer"   onbuttonclick="selectEmp" class="nui-buttonedit" allowInput="false" emptyText="请选择人员"  style="width: 100%;"/>    
	            		</td> 
					</tr>
					<tr>
						<td align="right" style="width:80px;">技术级别:</td>
	            		<td style="width:120px;" align="left">
	            			<input name="resume.technology" id="technology" class="nui-dictcombobox" dictTypeId="AME_TECH" style="width:100%;" style="width:100%;"/>
	            		</td>
	            		<td align="right" >招聘渠道：</td>
	            		<td align="left">    
	                		<input name="resume.recruitway" id="recruitway" class="nui-dictcombobox" required="true" shownullItem="true" dictTypeId="RECRUIT_WAY"  onvaluechanged="changerecruitway()" style="width:170px;"/>
	            		</td>
	            		<td align="right" style="width:80px;">内推状态:</td>
	            		<td style="width:320px;" align="left">
	            		    <input style="width:63%;" name="resume.referrerstatus" id="referrerstatus" class="nui-dictcombobox" required="false" readonly="readonly" dictTypeId="REFFER_STATUS">
	            		    <a style="width:32%;" id = "referrerSure" class="nui-button"  onclick="referrerSure()" >内推确认 </a>
	            		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;" id="addrecruit">招聘需求编号：</td>
	                	<td align="left" id="addrecruit1">    
	                    	<input name="resume.recruitid" id="recruitid" class="nui-buttonedit" onbuttonclick="showEmployee" required="false" style="width:170px;"/>
	                	</td>
						<!--根据招聘渠道类型切换招聘渠道说明的控件-->
	            		<td align="right" id="zpqdsm1" >招聘渠道说明：</td>
	            		<td align="left" id="zpqdsm"></td>
	            		<td align="right" >招聘专员：</td>
	            		<td align="left">
	            			<input name="resume.operatorid" id="operatorid"   onbuttonclick="selectEmp1" class="nui-buttonedit" allowInput="false" emptyText="请选择人员"  style="width:170px;"/>    
	            		</td> 
					</tr>
					<tr>
						<td align="right" style="width:80px;">标签:</td>
	            		<td style="width:120px;" align="left"  colspan="3"  class = "asLabel" id="label"></td>
	            		<td align="right" style="width:80px;">标签:</td>
	            		<td style="width:320px;" align="left">    
	                		<input id="labelid" class="nui-dictcombobox"style="width:63%;"  allowInput="true" textField="labelcontent" valueField="labelid" searchField="content" url="com.primeton.eos.ame_permanage.ame_resum.queryResumeLabel.biz.ext" onValueChanged = "validation"/>
	                		<a class="nui-button"onclick="addlabel()" style="width:32%;" >增加标签</a>
                		</td>
					</tr>
					<tr>
					    <td align="right" style="width:80px;">备注:</td>
	            		<td align="left"  colspan="5">
	            			<input name="resume.remark" id="remark" class="nui-textarea"  style="width:100%;height:40px"/>
            			</td>
					</tr>
				</table>
			</div>
		</fieldset>
	</form>
	<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		<legend>简历附件</legend>
		<span style="color: red;">请添加简历附件，以方便行政人员打印！</span>
		<jsp:include page="/ame_common/addFiles.jsp"/>
		<jsp:include page="/ame_common/detailAndDelFile.jsp"/>
	</fieldset>
	
	<div id="body_tab" class="nui-tabs" activeIndex="0" style="width: 100%;height:100%;padding: 0">
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
	                <div field="recommendresumedate" width="120" headerAlign="center" align="center" allowSort="true" dateFormat="yyyy-MM-dd" renderer="onDealDate">招聘专员推荐简历时间
						<input property="editor" class="nui-datepicker"dateFormat="yyyy-MM-dd"/>
					</div>
					<div field="resumefeedbackdate" width="120" headerAlign="center" align="center" allowSort="true" dateFormat="yyyy-MM-dd" renderer="onDealDate">面试官简历反馈时间
						<input property="editor" class="nui-datepicker"dateFormat="yyyy-MM-dd"/>
					</div>
	                <div field="omRecruit.orgname" width="80" headerAlign="center" align="left">招聘部门 </div>
	                <div field="omRecruit.recpositionname" width="80" headerAlign="center" align="left">招聘职位 </div>
	                <div field="omRecruit.jobtype" width="40" headerAlign="center" align="left" renderer="getJobType">人员性质 </div>
	                <div field="omRecruit.position" width="60" headerAlign="center" align="left" renderer="getPosition">员工属性 </div>
	                <div field="recommendcontent" width="150" headerAlign="center" align="left">推荐反馈
	                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
	                </div>
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
	            url="com.primeton.eos.ame_permanage.ame_resum.getRecommend.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
	            <div property="columns">
	            	<div type="checkcolumn" width="20px"></div>
	            	<input field="resumeid" class="nui-hidden" visible="false">
	            	<div field="omRecruit.recruitid" displayField="omRecruit.recruitno" width="40" headerAlign="center" align="left" allowSort="true" dateFormat="yyyy-MM-dd">招聘需求编号
	                	<input property="editor" class="nui-buttonedit" onbuttonclick=showRecuit />
	                </div>
	                <div field="omRecruit.orgname" width="80" headerAlign="center" align="left">招聘部门 </div>
	                <div field="omRecruit.recposition" width="80" headerAlign="center" align="left">招聘职位 </div>
	                <div field="omRecruit.jobtype" width="40" headerAlign="center" align="left" renderer="getJobType">人员性质 </div>
	                <div field="omRecruit.position" width="60" headerAlign="center" align="left" renderer="getPosition">员工属性 </div>
	                <div field="recommendcontent" width="150" headerAlign="center" align="left">推荐反馈
	                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
	                </div>
            	</div>
        	</div>
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
	<% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		Map attr = user.getAttributes();
		String operatorid = (String) attr.get("operatorid");
		String nowusername = user.getUserName();
	%>
	
	var operatorid='<%=operatorid%>';		
	var nowusername='<%=nowusername%>';
	var form = new nui.Form("form1");
	//学历信息
	var education = nui.get("Education");
	var workExp = nui.get("workExp");
	var projExp = nui.get("projExp");
	var grid_recommend = nui.get("grid_recommend");
	var cert = nui.get("cert");
	var body_tab=nui.get("body_tab");
	var tabs1 =nui.get("tabs1");
	var action = "";
	document.getElementById("referrerstatus").style.width="100%";
	document.getElementById("referrerSure").style.display="none";
	function SetData(data){
		if(data){
			if(data.action=="add"){
				action="add";
				body_tab.updateTab(body_tab.getTab("interview"), { visible: false });
				body_tab.updateTab(body_tab.getTab("tachLog"), { visible: false });
				body_tab.updateTab(body_tab.getTab("recommend"), { visible: false });
				
				var myDate = new Date();
        		nui.get("applydate").setValue(myDate.getFullYear()+'-'+(myDate.getMonth()+1)+'-'+myDate.getDate());
        		document.getElementById("zpqdsm").innerHTML =  '<input name="resume.recruitwayexp" id="recruitwayexp" class="nui-dictcombobox" shownullItem="true" dictTypeId="RECRUIT_WAYEXP"  allowInput="true" required="true"  style="width: 170px;"/>';
        		document.getElementById("referrerstatus").style.width="100%"
                document.getElementById("referrerSure").style.display="none"
        		nui.parse();
			}else if(data.action=="update"){
				document.getElementById("addrecruit").style.display = "none";
				document.getElementById("addrecruit1").style.display = "none";
				action="update";
				data = nui.clone(data);
				var json = data.resume;
				var wayvalue = json.resume.recruitway;
            	if(wayvalue == null || wayvalue == ''){
                  document.getElementById("zpqdsm").innerHTML =  '<input name="resume.recruitwayexp" id="recruitwayexp" class="nui-dictcombobox" shownullItem="true" dictTypeId="RECRUIT_WAYEXP"  allowInput="true"  required="true"  style="width: 170px;"/>';
                }
                if(wayvalue == '1' || wayvalue == '6'){
                  document.getElementById("zpqdsm").innerHTML =  '<input name="resume.recruitwayexp" id="recruitwayexp" class="nui-dictcombobox" shownullItem="true" dictTypeId="RECRUIT_WAYEXP"  allowInput="true" required="true"   style="width: 170px;"/>';
                }
                if(wayvalue == '2' || wayvalue == '3' || wayvalue == '4' || wayvalue == '5' || wayvalue == '7'){
	        	  document.getElementById("zpqdsm").innerHTML =  '<input name="resume.recruitwayexp" id="recruitwayexp" required="true" class="nui-textbox"    style="width: 170px;"/>';
                }
                if(json.resume.referrerstatus != '0'){
                    document.getElementById("referrerstatus").style.width="100%";
                    document.getElementById("referrerSure").style.display="none";
                }else{
                    document.getElementById("referrerstatus").style.width="63%";
                    document.getElementById("referrerSure").style.display="";
                }
                nui.parse();
				form.setData(json);
				nui.get("referrer").setText(json.resume.referrername);
				if(json.resume.operatorid == null || json.resume.operatorid == ''){
				    nui.get("operatorid").setValue(operatorid);
				    nui.get("operatorid").setText(nowusername);
				}else{
				    nui.get("operatorid").setValue(json.resume.operatorid);
				    nui.get("operatorid").setText(json.resume.recruitername);
				}
		        //学历信息
	           	education.load({ resumeid: data.resumeid,empid:null});
	            workExp.load({ resumeid: data.resumeid});
	            workExp.sortBy("startdate", "desc");
	            projExp.load({ resumeid: data.resumeid});
	            projExp.sortBy("beginenddate", "desc");
	            grid_recommend.sortBy("omRecruit.recruitno", "desc");
	            grid_recommend.load({"criteria": {"_expr[0]": { "resumeid": data.resumeid}}},function(){
	            	var recommends = grid_recommend.getData();
	            	for(var i=0;i<recommends.length;i++){
	            		setInterviewTabs(recommends[i]);
	            	}
	            });
	            cert.load({ resumeid: data.resumeid});//简历附件信息
	            
        		//接触日志
	            nui.get("grid_001").load({"groupid":"AME_RESUME","relationid":data.resumeid});
	            
	            var labeljson = {"criteria": {"_expr[0]": { "ameResume.resumeid": data.resumeid}}};
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
				nui.get("grid_0").load({"groupid":"AmeResumefile","relationid":data.resumeid});	
				//简历照片
				var picturejson = {"groupid":"AmeResume","relationid":data.resumeid};
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
        grid.addRow(newRow,  grid.getData().length);
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
			var resumeid = nui.get("resumeid").getValue();
			var tel = nui.get("tel").getValue();
			var empname = nui.get("empname").getValue();
			if(resumeid==null||resumeid==""){
				var ishave = 0;
				var json = {"criteria": {"_expr[0]": { "tel": tel},"_expr[1]": { "empname": empname}},"sortField":"empname","sortOrder":"asc"};
				nui.ajax({
		    			url: "com.primeton.eos.ame_resume.resumeManage.queryResume.biz.ext",
		    			data: json,
		    			type: 'POST',
		    			cache: false,
   						async:false,
		    			contentType: 'text/json',
		    			success: function(text){
		    				if(text.queryResume.length>0){
		    					ishave = 1;
		    				}
		    			}
    			});
    			if(ishave == 1){
					nui.alert("简历已存在！");
					return;
    			}
			}
			if(confirm("请确认是否已添加简历附件，是否新增/修改简历？")){
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
		var interviews = [];
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
			var json = nui.encode({"resume":resume.resume, "AmeResumeWorkexp":workExp, "AmeResumeProjexp":projExp, "AmeResumeCert":cert,"education":education,"recommend":resume.recommend});
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
		    			}else if(text.returnVal==9){
		    				alert("增加学历失败，请重新尝试");
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
			width: 820,
			height: 470,
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
	
	function validation (e){
		alert(nui.encode(e));
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
        html = html+'<div field="linkman" displayField="linkmanname"width="45" headerAlign="center" align="center" >联系人<input property="editor" class="nui-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext"></div>';
    	html = html+'<div field="linktel" width="40" headerAlign="center" align="center">联系人电话<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/></div>';
    	html = html+'<div field="interviewtype" width="60" headerAlign="center"  align="center" allowSort="true" renderer="getinterviewType">面试方式<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="INTERVIEW_TYPE" /></div>';
    	html = html+'<div field="venue" width="75" headerAlign="center" align="left">面试地点<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/></div>';
        html = html+'<div field="feedbackstatus" width="45" headerAlign="center" align="center" renderer="getfeedbackstatus">反馈意见<input property="editor" style="width:20%;" class="nui-dictcombobox" dictTypeId="AME_FEEDBACK_STATUS" width="100%" required="true" shownullItem="true"  onvaluechanged="changefeedbackstatus"/></div>';
        html = html+'<div field="feedback" width="200" headerAlign="center" align="left">面试反馈<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/></div>';
        html = html+'<div field="omRecruit.recruitid" width="0" headerAlign="center" align="left">招聘需求</div>';
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
	
	function changerecruitway(){ 
	     var wayvalue = nui.get("recruitway").getValue();
	     if(wayvalue == '1' || wayvalue == '6'){
	        document.getElementById("zpqdsm").innerHTML =  '<input name="resume.recruitwayexp" id="recruitwayexp" class="nui-dictcombobox" shownullItem="true" dictTypeId="RECRUIT_WAYEXP" required="true"  allowInput="true"  style="width: 170px;"/>';
	        nui.get("referrer").setValue('');
	        nui.get("referrer").setText('');
	        nui.get("referrerstatus").setValue('');
	        nui.get("referrer").setRequired(false);
	     }  
	     if(wayvalue == '2'){
	        document.getElementById("zpqdsm").innerHTML =  '<input name="resume.recruitwayexp" id="recruitwayexp" class="nui-textbox"  required="true"   style="width: 170px;"/>';
	        nui.get("referrer").setRequired(true);
	     }else if(wayvalue == '3' || wayvalue == '4' || wayvalue == '5' || wayvalue == '7'){
	        document.getElementById("zpqdsm").innerHTML =  '<input name="resume.recruitwayexp" id="recruitwayexp" class="nui-textbox"  required="true"   style="width: 170px;"/>';
	        nui.get("referrer").setValue('');
	        nui.get("referrer").setText('');
	        nui.get("referrerstatus").setValue('');
	        nui.get("referrer").setRequired(false);
	     }
	     nui.parse();
	}
	
	function selectEmp1(){
		var btnEdit = this;
	    nui.open({
	        url: "/default/machine/SelectEmployee.jsp",
            title: "选择人员",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                       btnEdit.setValue(data.operatorid);
                       btnEdit.setText(data.empname);
                    }
                 }

            }
       });
	}
	//只属于推荐人的方法,对内推状态单独控制，不能随意赋值
	function selectEmp(){
		var btnEdit = this;
	    nui.open({
	        url: "/default/machine/SelectEmployee.jsp",
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
                       nui.get("referrerstatus").setValue('0');
                       document.getElementById("referrerstatus").style.width="63%"
                       document.getElementById("referrerSure").style.display=""
                    }
                 }

            }
       });
	}
	function setPositionName(e){
		//var recposition = e.value;
		var jobscatagory = nui.get("jobscatagory").getText();
		var applyoccupation = nui.get("applyoccupation").getValue();
		if(applyoccupation == null || applyoccupation == ''){
			nui.get("applyoccupation").setValue(jobscatagory);
		}
	}
	
	function showEmployee(e){
		var btnEdit = this;
	    nui.open({
			url:"/default/abframe/org/recruit/SelectRecruitno.jsp",
			title: "选择招聘需求编号",
			width: 820,
			height: 470,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);  
					btnEdit.setValue(data.recruitid);
		            btnEdit.setText(data.recruitno);
				}
			}
		});
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
	//内推简历确认状态
    function referrerSure(){
    	var row = form.getData().resume;
    	var operatorid = nui.get("operatorid").getValue();
        if(row.referrerstatus != "0"){
        	nui.alert("当前内推简历确认状态为【" + nui.getDictText('REFFER_STATUS', row.referrerstatus) + "】！不能进行确认操作！");
        	return;
        }else{
            var json = nui.encode({"resume":row,operatorid:operatorid});
            nui.ajax({
                        url:"com.primeton.eos.ame_resume.resumeManage.sureReferrer.biz.ext",
                        type:'POST',
                        data:json,
                        cache: false,
                        contentType:'text/json',
                        success:function(text){
                            var returnJson = nui.decode(text);
                            if(returnJson.result == 1){
                              nui.get("referrerstatus").setValue('1');
				              document.getElementById("referrerstatus").style.width="100%";
                              document.getElementById("referrerSure").style.display="none";
                            }else{
                              nui.alert("确认失败，请联系信息部门");
                            }
                        }
            }); 
        }
    }
    
    //检查手机号
	function checkmobileno(){
		var myreg =  new RegExp(nui.getDictText('SMS_CONFIG',"PHONE_REG"),'i');
		var mobileno = nui.get("tel").getValue();
		if (!myreg.test(mobileno)) {
		   nui.alert("请输入正确的手机号码");
	       nui.get("tel").setValue('');
	    } 
	}
	function changeempname(){
		var empname = nui.get("empname").getValue();
		nui.get("empname").setValue(empname.replace(/\s*/g,""));
	}
	function getcandidatestatuse(e){
		return nui.getDictText('INTERVIEW_RECOMMEND_STATUS',e.value);//设置业务字典值
	}
</script>
</html>