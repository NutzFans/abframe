<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2019-10-18 10:07:42
  - Description:
-->
<head>
<title>人员简历信息查看</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width: 98%" class="body-font">
	<div style="width:100%;height:100%;padding:0px;margin:0px;">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<legend>简历列表</legend>
			<div class="nui-toolbar" line-height="30px;" borderStyle="border:0;" id="queryform">
				<table id="table1" style="width: 100%;height:32px;font-size:12px;" align="center" >
		        	<tr>
		        		<td align="right" nowrap="nowrap">姓名:</td>
		        		<td align="left" nowrap="nowrap">
			        		<input class="nui-textbox" name="criteria._expr[0]._value" id = "username">
							<input class="nui-hidden" name="criteria._expr[0]._property" value="empname">
							<input class="nui-hidden" name="criteria._expr[0]._op" value="like">
		        		</td>
						<td align="right" nowrap="nowrap">学历:</td>
						<td align="left" nowrap="nowrap">
							<input class="nui-dictcombobox" name="criteria._expr[1]._value" style="width:125px" id="degree" showNullItem="true"  dictTypeId="DEGREE" multiselect="true">
							<input class="nui-hidden" name="criteria._expr[1]._property" value="education">
							<input class="nui-hidden" name="criteria._expr[1]._op" id="tempCond41" value="in">
						</td>
		        		<td align="right" nowrap="nowrap">学校:</td>
		        		<td align="left" nowrap="nowrap">
			        		<input class="nui-textbox" name="criteria._expr[2]._value" id = "school">
							<input class="nui-hidden" name="criteria._expr[2]._property" value="school">
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like">
		        		</td>
						<td align="right" nowrap="nowrap">出生年月：</td>
		            	<td align="left" nowrap="nowrap">
						  	<input class="nui-datepicker" id="min1" name="criteria._expr[3]._min" style="width:100px"/>-<input class="nui-datepicker" id="max1" name="criteria._expr[0]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="birthdate"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd"/>
						</td>
	        		</tr>
	        		<tr>
						<td align="right" nowrap="nowrap">求职状态:</td>
						<td align="left" nowrap="nowrap">
							<input class="nui-dictcombobox" name="criteria._expr[4]._value" style="width:125px" id="applystatus" showNullItem="true"  dictTypeId="AME_APPLYSTATUS" multiselect="true">
							<input class="nui-hidden" name="criteria._expr[4]._property" value="applystatus">
							<input class="nui-hidden" name="criteria._expr[4]._op"  value="in">
						</td>
						<td align="right" nowrap="nowrap">是否重名:</td>
						<td align="left" nowrap="nowrap">
							<input class="nui-dictcombobox" name="criteria._ref[0]._expr[0]._value" style="width:125px" id="degree" showNullItem="true"  dictTypeId="MIS_YN" multiselect="true">
							<input class="nui-hidden" name="criteria._expr[5]._property" value="resumeid">
							<input class="nui-hidden" name="criteria._expr[5]._op"  value="in">
							<input class="nui-hidden" name="criteria._expr[5]._ref"  value="3">
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="3"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.eos.ame_resume.resume.AmeResumIsRepeat"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="resumeid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="issamename"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="in"/>
						</td>
						<td align="right" nowrap="nowrap">手机号是否重复:</td>
						<td align="left" nowrap="nowrap">
							<input class="nui-dictcombobox" name="criteria._ref[1]._expr[0]._value" style="width:125px" id="degree" showNullItem="true"  dictTypeId="MIS_YN" multiselect="true">
							<input class="nui-hidden" name="criteria._expr[6]._property" value="resumeid">
							<input class="nui-hidden" name="criteria._expr[6]._op"  value="in">
							<input class="nui-hidden" name="criteria._expr[6]._ref"  value="2">
					        <input class="nui-hidden" name="criteria._ref[1]._id" value="2"/>
					        <input class="nui-hidden" name="criteria._ref[1]._entity" value="com.primeton.eos.ame_resume.resume.AmeResumIsRepeat"/>
					        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="resumeid"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="issametel"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="in"/>
						</td>
						<td align="right" nowrap="nowrap">工作年限：</td>
						<td align="left" style="width: 150px;" >
							<input class="nui-textbox" name="criteria._expr[13]._min" style="width:100px"/>-<input class="nui-textbox" name="criteria._expr[13]._max" style="width:100px"/>
							<input class="nui-hidden" name="criteria._expr[13]._property" value="workingyear1">
							<input class="nui-hidden" name="criteria._expr[13]._op"  value="between">
						</td>
	        		</tr>
	        		<tr>
						<td align="right" nowrap="nowrap">简历状态:</td>
						<td align="left" nowrap="nowrap">
							<input class="nui-dictcombobox" name="criteria._expr[12]._value" style="width:125px" id="jobscatagory" showNullItem="true"  dictTypeId="INTERVIEW_STATUS_OUT" multiselect="true">
							<input class="nui-hidden" name="criteria._expr[12]._property" value="interviewstatus">
							<input class="nui-hidden" name="criteria._expr[12]._op"  value="in">
							
							<input class="nui-hidden" name="criteria._expr[10]._value" value="8">
							<input class="nui-hidden" name="criteria._expr[10]._property" value="interviewstatus">
							<input class="nui-hidden" name="criteria._expr[10]._op"  value="<>">
						</td>
	        			<td align="right" nowrap="nowrap">标签:</td>
						<td align="left" nowrap="nowrap">
							<input class="nui-textboxlist" name="criteria._ref[3]._expr[0]._value" id="labelid"  allowInput="true" textField="labelcontent" valueField="labelid" searchField="content" url="com.primeton.eos.ame_permanage.ame_resum.queryResumeLabel.biz.ext" multiselect="true" onvaluechanged="changelabel">
							<input class="nui-hidden" name="criteria._expr[7]._property" value="resumeid">
							<input class="nui-hidden" name="criteria._expr[7]._op"  value="in"  id="tempCond71">
							<input class="nui-hidden" name="criteria._expr[7]._ref"  value="4" id="tempCond72">
					        <input class="nui-hidden" name="criteria._ref[3]._id" value="4" />
					        <input class="nui-hidden" name="criteria._ref[3]._entity" value="com.primeton.eos.ame_resume.resume.AmeResumeLabel"/>
					        <input class="nui-hidden" name="criteria._ref[3]._select._field[0]" value="ameResume.resumeid"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._property" value="ameLabel.labelid"/>
					        <input class="nui-hidden" name="criteria._ref[3]._expr[0]._op" value="in"/>
						</td>	
						<td align="right" nowrap="nowrap">招聘渠道:</td>
						<td align="left" nowrap="nowrap">
							<input class="nui-dictcombobox" name="criteria._expr[8]._value" style="width:125px" id="recruitway" showNullItem="true"  dictTypeId="RECRUIT_WAY" multiselect="true">
							<input class="nui-hidden" name="criteria._expr[8]._property" value="recruitway">
							<input class="nui-hidden" name="criteria._expr[8]._op"  value="in">
						</td>
						<td align="right" nowrap="nowrap">目前月收入(千元)：</td>
						<td align="left" style="width: 150px;" >
							<input class="nui-textbox" name="criteria._expr[17]._min" style="width:100px"/>-<input class="nui-textbox" name="criteria._expr[17]._max" style="width:100px"/>
							<input class="nui-hidden" name="criteria._expr[17]._property" value="currentincome">
							<input class="nui-hidden" name="criteria._expr[17]._op"  value="between">
						</td>
					</tr>
					<tr>
						<td align="right" nowrap="nowrap">职位分类:</td>
						<td align="left" nowrap="nowrap">
							<input class="nui-dictcombobox" name="criteria._expr[19]._value" style="width:125px" id="jobscatagory" showNullItem="true"  dictTypeId="AME_POSITION_MEMO" multiselect="true">
							<input class="nui-hidden" name="criteria._expr[19]._property" value="jobscatagory">
							<input class="nui-hidden" name="criteria._expr[19]._op"  value="in">
						</td>
		        		<td align="right" nowrap="nowrap">应聘职位:</td>
		        		<td align="left" nowrap="nowrap">
			        		<input class="nui-textbox" name="criteria._expr[11]._value" id = "applyoccupation">
							<input class="nui-hidden" name="criteria._expr[11]._property" value="applyoccupation">
							<input class="nui-hidden" name="criteria._expr[11]._op" value="like">
		        		</td>
						<td align="right" nowrap="nowrap">公司:</td>
		        		<td align="left" nowrap="nowrap">
			        		<input class="nui-textbox" name="criteria._ref[2]._expr[0]._value" id = "companyname" onvaluechanged="changecompany">
			        		<input class="nui-hidden" name="criteria._or[0]._expr[0]._property" value="resumeid"/>
							<input class="nui-hidden" name="criteria._or[0]._expr[0]._op" value="in" id="tempCond51">
							<input class="nui-hidden" name="criteria._or[0]._expr[0]._ref" value="1" id="tempCond52">
					        <input class="nui-hidden" name="criteria._ref[2]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[2]._entity" value="com.primeton.eos.ame_resume.resume.AmeResumeWorkexp"/>
					        <input class="nui-hidden" name="criteria._ref[2]._select._field[0]" value="ameResume.resumeid"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._property" value="companyname"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._op" value="in"/>
					        
					        
			        		<input class="nui-hidden" name="criteria._or[0]._expr[1]._value" id = "currentcompany">
							<input class="nui-hidden" name="criteria._or[0]._expr[1]._property" value="currentcompany">
							<input class="nui-hidden" name="criteria._or[0]._expr[1]._op" value="like">
		        		</td>
		        		<td align="right" nowrap="nowrap">创建日期：</td>
		            	<td align="left" nowrap="nowrap">
						  	<input class="nui-datepicker" id="min1" name="criteria._expr[18]._min" style="width:100px" dateFormat="yyyy-MM-dd H:mm:ss"/>-<input class="nui-datepicker" id="max1" name="criteria._expr[18]._max" style="width:100px"  dateFormat="yyyy-MM-dd H:mm:ss"/>
						    <input class="nui-hidden" name="criteria._expr[18]._property" value="createdate"/>
						    <input class="nui-hidden" name="criteria._expr[18]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[18]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
						</td>
					</tr>
					<tr>
		        		<td align="right" nowrap="nowrap">手机号:</td>
		        		<td align="left" nowrap="nowrap">
			        		<input class="nui-textbox" name="criteria._expr[15]._value" id = "tel">
							<input class="nui-hidden" name="criteria._expr[15]._property" value="tel">
							<input class="nui-hidden" name="criteria._expr[15]._op" value="like">
		        		</td>
		        		<td align="right" nowrap="nowrap">发布城市:</td>
		        		<td align="left" nowrap="nowrap">
			        		<input class="nui-textbox" name="criteria._expr[16]._value" id = "announcecity">
							<input class="nui-hidden" name="criteria._expr[16]._property" value="announcecity">
							<input class="nui-hidden" name="criteria._expr[16]._op" value="like">
		        		</td>
						<td align="right" nowrap="nowrap">推荐人:</td>
						<td align="left" nowrap="nowrap">
							<input class="mini-textboxlist" name="criteria._expr[9]._value" id="referrer" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext">
							<input class="nui-hidden" name="criteria._expr[9]._property" value="referrer">
							<input class="nui-hidden" name="criteria._expr[9]._op"  value="in">
						</td>
		        		<td align="right" nowrap="nowrap">备注:</td>
		        		<td align="left" nowrap="nowrap" colspan="2">
			        		<input class="nui-textbox" name="criteria._expr[21]._value" id = "remark" style="width:100%">
							<input class="nui-hidden" name="criteria._expr[21]._property" value="remark">
							<input class="nui-hidden" name="criteria._expr[21]._op" value="like">
		        		</td>
					</tr>
					<tr>
						<td align="right" nowrap="nowrap">招聘专员:</td>
						<td align="left" nowrap="nowrap">
							<input class="mini-textboxlist" name="criteria._expr[20]._value" id="operatorid" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext">
							<input class="nui-hidden" name="criteria._expr[20]._property" value="operatoruserid">
							<input class="nui-hidden" name="criteria._expr[20]._op"  value="in">
						</td>
						<td align="right" nowrap="nowrap">性别:</td>
		        		<td align="left" nowrap="nowrap">
							<input class="nui-dictcombobox" name="criteria._expr[14]._value"  id="jobscatagory" showNullItem="true"  dictTypeId="ABF_GENDER" multiselect="true">
							<input class="nui-hidden" name="criteria._expr[14]._property" value="gender">
							<input class="nui-hidden" name="criteria._expr[14]._op"  value="in">
		        		</td>
		        		<td align="right" nowrap="nowrap">内推简历确认状态:</td>
						<td align="left" nowrap="nowrap">
							<input class="nui-dictcombobox" name="criteria._expr[22]._value" style="width:125px" id="referrerstatus" showNullItem="true"  dictTypeId="REFFER_STATUS">
							<input class="nui-hidden" name="criteria._expr[22]._property" value="referrerstatus">
							<input class="nui-hidden" name="criteria._expr[22]._op"  value="=">
						</td>
		        		<td align="right" nowrap="nowrap">电子邮件:</td>
		        		<td align="left" nowrap="nowrap">
			        		<input class="nui-textbox" name="criteria._expr[23]._value" id = "selfemail" style="width:100%">
							<input class="nui-hidden" name="criteria._expr[23]._property" value="selfemail">
							<input class="nui-hidden" name="criteria._expr[23]._op" value="like">
		        		</td>
					</tr>
					<tr>
						<td align="center" colspan="8">
							<a class="nui-button grayBtn" iconCls="icon-search" onclick="search">查询</a>
							<a class="nui-button grayBtn" iconCls="icon-reload" onclick="reset">重置</a>
						</td>
					</tr>
        		</table>
			</div>
			<div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="resume_addBtn" iconCls="icon-add" onclick="addResume()" plain="true">增加</a>
		                        <a class="nui-button" id="resume_editBtn" iconCls="icon-edit" onclick="editResume()" plain="true">编辑</a>
		                        <a class="nui-button" id="resume_remove"iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
		                        <a class="nui-button" id="resume_download" iconCls="icon-download" onclick="exportResume()" plain="true">导出简历数据</a>
				            	<a class="nui-button" id="resume_impBtn" iconCls="icon-upload" onclick="impResume()" plain="true">导入简历数据</a>
                            	<a class="nui-button" id="resume_startEntryFlow" iconCls="icon-goto" onclick="startInterviewFlow()" plain="true">安排面试</a>
		                    </td>
		                </tr>
		             </table>           
		        </div>
		    </div>
		    <div id="searchResumeLogId" class="nui-datagrid"  allowResize="true" showSummaryRow="true"
				style="margin-top:0px;width: 100%;height:410px;" dataField="queryResume" frozenStartColumn="0" frozenEndColumn="5" 
				url="com.primeton.eos.ame_resume.resumeManage.queryResume.biz.ext" 
				allowAlternating="true" pageSize="20" showPager="true" multiSelect="true">
				<div property="columns">
					<div type="checkcolumn" width="20px"></div>
					<div field="empname" headerAlign="center" align="center" renderer="getDetail" allowSort="true" width="60">姓名</div>
					<div field="applyoccupation" headerAlign="center" align="center" allowSort="true" width="100">应聘职位</div>
					<div field="announcecity" headerAlign="center" align="center" allowSort="true" width="60">发布城市</div>
					<div field="applydate" headerAlign="center" align="center" allowSort="true" width="80">应聘日期</div>
					<div field="interviewstatus" headerAlign="center" align="center"width="80" renderer="ongenderinterviewStatus">简历状态</div>
					<div field="gender" headerAlign="center" align="center" allowSort="true" width="35" renderer="ongender">性别</div>
					<div field="education" headerAlign="center" align="center" allowSort="true" width="40" renderer="onDegreeRenderer">学历</div>
					<div field="school" headerAlign="center" align="left" allowSort="true" width="100">毕业学校</div>
					<div field="specialty" headerAlign="center" align="left" width=80">专业</div>
					<div field="tel" headerAlign="center" align="left" allowSort="true" width="100">联系电话</div>
					<div field="selfemail" headerAlign="center" align="left" allowSort="true" width="150">电子邮件</div>
					<div field="currentcompany" headerAlign="center" align="left" allowSort="true" width="100">最近一家公司</div>
					<div field="currentoccupation" headerAlign="center" align="left" allowSort="true" width="100">最近一个职位</div>
					<div field="recruitway" headerAlign="center" align="center" allowSort="true" width="60" renderer="ongenderrecruitway">招聘渠道</div>
					<div field="recruitwayexp" headerAlign="center" align="center" allowSort="true" width="60" renderer="ongenderrecruitway1">招聘渠道说明</div>
					<div field="recruitername" headerAlign="center" align="center" allowSort="true" width="60">招聘专员</div>
					<div field="workingyear1" headerAlign="center" align="center" allowSort="true" width="80">工作年限(年)</div>
					<div field="postcode" headerAlign="center" align="left" allowSort="true" width="0">邮编</div>
					<div field="currentincome" headerAlign="center" align="right" allowSort="true" width="100">目前月收入(千元)</div>
					<div field="expectincome" headerAlign="center" align="right" allowSort="true" width="100">期望薪资(千元)</div>
					<div field="applystatus" headerAlign="center" align="center" allowSort="true" width="100" renderer="ongenderApplyStatus">求职状态</div>
					<div field="userid" headerAlign="center" align="center" allowSort="true" width="0">工号</div>
					<div field="orgs" headerAlign="center" align="center" allowSort="true" width="0">部门</div>
					<div field="technology" headerAlign="center" align="center" allowSort="true" width="60" renderer="onTechRenderer">技术级别</div>
					<div field="workdate" headerAlign="center" align="center" allowSort="true" width="60">工作年月</div>
					<div field="indate" headerAlign="center" align="center" allowSort="true" width="60">入职年月</div>
					<div field="files1" renderer="onFileRenderer" width="250" align="left" headerAlign="center">附件</div>
					<div field="referrername" headerAlign="center" align="center" allowSort="true" width="60">推荐人</div>
					<div field="referrerstatus" headerAlign="center" align="center"width="115" renderer="ongenderreferrerStatus">内推简历确认状态</div>
					<div field="createdate" headerAlign="center" align="center" allowSort="true" width="125" renderer = "ondealdate">创建日期</div>
					<div field="lastupdate" headerAlign="center" align="center" allowSort="true" width="125" renderer = "ondealdate">最近更新日期</div>
					<div field="birthdate" headerAlign="center" align="center" allowSort="true" width="80">出生日期</div>
					<div field="currentadress" headerAlign="center" align="center" allowSort="true" width="80">目前居住地</div>
					<div field="haddress" headerAlign="center" align="center" allowSort="true" width="60">户籍</div>
					<div field="mailaddress" headerAlign="center" align="left" allowSort="true" width="100">联系地址</div>
					<div field="remark" headerAlign="center" align="center" allowSort="true" width="120">备注</div>
				</div>
			</div>
		</div>
	</div>
	
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
	
	<div id="win1" class="nui-window" title="导入excel" style="width:700px;height:225px;" 
	    showMaxButton="true" showCollapseButton="true" showShadow="true"
	    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
	    	<fieldset id="importPayroll">
			<legend>简历数据导入</legend>
			<form id="form2" class="" action="ame_resum.importResume.flow" target="hidden_frame" method="post" enctype="multipart/form-data">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	                <tr>
		            	<td style="width:550px;" colspan="5">
		            		请选择附件：<input type='file' id="uploadfile" name='uploadfile' size='30' >
		       	  		</td>
	                </tr>
	                <tr>
			            <td style="width:13%;" align="right" >上传注意事项：</td>
				        <td style="width:12%x;" colspan="4">
				        	<div style="color: red;">上传用的 Excel 文件版本为 97-2007版本，即 .xls 为后缀的版本，数据全部放在第一个工作表内。</div>
				       	</td>
			        </tr>
			        <tr>
			        	<td style="width:13%;"colspan="5"><a href="/default/importResume.xls">点击下载Excel 模板文件</a></td>
			        </tr>
	            </table>           
	        </div>
	        <div class="nui-toolbar" id="handle">
	        	
	        </div>
	        </form>
		  <div style="text-align:center;padding:10px;" class="nui-toolbar">
			<a class="nui-button" onclick="importResume" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
			<a class="nui-button" onclick="onCancel()" style="width:60px;margin-right:20px;">取消</a>  
		  </div>
	    </fieldset>
	    <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid=nui.get("searchResumeLogId");
	var form = new nui.Form("#queryform");
	
	init();
	function init(){
		search();
	}
	
	function search(){
		var companyname = nui.get("companyname").getValue();
		if(companyname == ""||companyname==null){
    		nui.get("tempCond51").setValue("=");
    		nui.get("tempCond52").setValue("");
    	}else{
    		nui.get("tempCond51").setValue("in");
    		nui.get("tempCond52").setValue("1");
    	}
    	var labelid = nui.get("labelid").getValue();
    	if(labelid == "" || labelid==null){
    		nui.get("tempCond71").setValue("=");
    		nui.get("tempCond72").setValue("");
    	}else{
    		nui.get("tempCond71").setValue("in");
    		nui.get("tempCond72").setValue("4");
    	}
        var data = form.getData();
        grid.load(data);
        grid.sortBy("lastupdate", "desc");
        //按钮权限的控制
		getOpeatorButtonAuth("resume_addBtn,resume_editBtn,resume_remove,resume_download,resume_impBtn,resume_startEntryFlow");//操作按钮权限初始化
	}
	
	function reset(){
		form.reset();
		init();
	}

	function onTechRenderer(e){
		return nui.getDictText('AME_TECH',e.value);//设置业务字典值
	}
	
	function onDegreeRenderer(e){
		return nui.getDictText('DEGREE',e.value);//设置业务字典值
	}
	
	function ongender(e){
		return nui.getDictText('ABF_GENDER',e.value);//设置业务字典值
	}
	
	function ongenderApplyStatus(e){
		return nui.getDictText('AME_APPLYSTATUS',e.value);//设置业务字典值
	}
	function ongenderinterviewStatus(e){
		return nui.getDictText('INTERVIEW_STATUS_OUT',e.value);//设置业务字典值
	}
	function ongenderrecruitway(e){
		return nui.getDictText('RECRUIT_WAY',e.value);//设置业务字典值
	}
	function ongenderreferrerStatus(e){
		return nui.getDictText('REFFER_STATUS',e.value);//内推简历是否确认
	}
	function ongenderrecruitway1(e){
		if(nui.getDictText('RECRUIT_WAYEXP',e.value) == null || nui.getDictText('RECRUIT_WAYEXP',e.value) ==''){
			return e.value;//设置业务字典值
		}else{
			return nui.getDictText('RECRUIT_WAYEXP',e.value);//设置业务字典值
		}
	}
	
	//日期格式化---时分秒的格式化
    function ondealdate(e){
		if(typeof(e.value)=="string" && e.value != '' && e.value != null && e.value != 'null'){
			return e.value.substring(0,18);
		}else{
			//alert(nui.formatDate(e.value,"yyyy-MM-dd HH:mm"))
			return nui.formatDate(e.value,"yyyy-MM-dd HH:mm:ss");
		}
	}
	
	function onFileRenderer(e) {
        var tempSrc = "";
    	//长度为1，不换行
    	if(e.record.files1==null){
    		return;
    	}
    	if(e.record.files1.length == 1){
        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files1[0].fileId + "'>" + e.record.files1[0].fileName + "</a>";
    	}else{
	        for(var i=0;i<e.record.files1.length;i++){
	        	//长度大于1小于长度length换行
	        	if(i< e.record.files1.length-1){
	        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files1[i].fileId + "'>" + e.record.files1[i].fileName + "</a>&nbsp;&nbsp;";
	        	}
	        	//最后一个不换行
        		if(i == e.record.files1.length-1){
	        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files1[i].fileId + "'>" + e.record.files1[i].fileName + "</a>";
	        	}
	        }
    	}
       	return tempSrc;
     }
     
     function addResume(){
		nui.open({
            url: "<%=request.getContextPath() %>/ame_permanage/ame_resum/addResumByRecruiter.jsp",
            title: "新增简历", 
            width: 1100, 
            height: 550,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = {action: "add" };
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
        		grid.reload();
            }
        });
	}
	
	function editResume(){
		var rows = grid.getSelecteds();
		if (rows.length > 1){
    		alert("只能选中一条记录进行编辑！");
    	}else{
            var row = grid.getSelected();
            if(row){
				nui.open({
		            url: "<%=request.getContextPath() %>/ame_permanage/ame_resum/addResumByRecruiter.jsp",
		            title: "编辑简历", 
		            width: 1100, 
		            height: 550,
		            onload: function () {
		                var iframe = this.getIFrameEl();
		                var data = {action: "update", "resumeid": row.resumeid, "resume":{resume:row} };
		                iframe.contentWindow.SetData(data);
		            },
		            ondestroy: function (action) {
		        		grid.reload();
		            }
		        });
		    }else{
                alert("请选中一条记录！");
            }
		}
	}
	
	function removeRow(){
		var rows = grid.getSelecteds();
		if (rows.length < 1){
    		alert("请选择要删除的记录！");
    	}else{
    		json ={"resumes":rows};
    		nui.ajax({
    			url: "com.primeton.eos.ame_permanage.ame_resum.deleteResum.biz.ext",
    			data: json,
    			type: 'POST',
    			cache: false,
    			contentType: 'text/json',
    			success: function(o){
    				alert("删除成功！");
    				grid.reload();
    			}
    		});
    	}
	    
	}
	
	function getDetail(e){
        return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    }
    
    function checkDetail(){
    	var row = grid.getSelected();
		var executeUrl = "/default/ame_permanage/ame_resum/detailofResume.jsp?action='update'&resumeid=" + row.resumeid;
		var iWidth=1200; //弹出窗口的宽度;
		var iHeight=600; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open(executeUrl, "反馈详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
    	
    }
    
    function impResume(){
    	var win = nui.get("win1");
        win.showAtPos("center", "middle");
    }
    
    //关闭框
	function onCancel() {//关闭清空编辑框内已填写的数据
		var handle=document.getElementById("handle");
		handle.innerHTML = "";
		document.getElementById('uploadfile').value='';
        var win = nui.get("win1");
        win.hide();
    }
    
    //导入提交
    function importResume(){
    	var fileName = document.getElementById("uploadfile").value;
    	var handle=document.getElementById("handle");
		handle.innerHTML = "操作中，请稍等......";
		if(fileName == ""){
			alert("请选择附件！");
			return;
		}else{
			form2.submit();
		}
    }
    
    function test(msg){
		if(msg=='1'){
			var handle=document.getElementById("handle");
			handle.innerHTML = "";
			alert("导入失败，请联系信息技术部！");
		}else{
			var handle=document.getElementById("handle");
			handle.innerHTML = "";
			alert(msg);
			onCancel();
			grid.reload();
		}
	}
	
	function exportResume(){
		if(!confirm("是否确认根据查询条件导出简历数据？")){
			return;
		}
		var data = form.getData();
		var json =  nui.encode(data);
		nui.ajax({
			url: "com.primeton.eos.ame_permanage.ame_resum.exportResum.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "resumes";
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
				fileName = fileName + "_" + curDateTime + ".xls";
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
	
	function changecompany (){
		var companyname = nui.get("companyname").getValue();
		nui.get("currentcompany").setValue(companyname);
	}
	
	function changelabel(){
		var labelid = nui.get("labelid").getValue();
		if(labelid == ""||labelid==null){
    		nui.get("tempCond71").setValue("=");
    		nui.get("tempCond72").setValue("");
    	}else{
    		nui.get("tempCond71").setValue("in");
    		nui.get("tempCond72").setValue("4");
    	}
	}
	
	function startInterviewFlow(){
		var rows = grid.getSelecteds();
		if(rows.length>0){
			for(var i=0;i<rows.length;i++){
				var row = rows[i];
				if(row.interviewstatus != '0' && row.interviewstatus != '1' && row.interviewstatus != '3' && row.interviewstatus != '5' && row.interviewstatus != '7' && row.interviewstatus != '9' && row.interviewstatus != '10'){
					nui.alert("简历状态不允许发起面试流程！","提示");
					return false;
				}
				if(row.referrer !=null && row.referrerstatus !=1){
				        nui.alert("内推简历确认状态未确认不允许发起面试流程！","提示");
				        return false;
				}
			}
		}else{
			nui.alert("请您选择至少一条简历！","提示");
			return false;
		}
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
					var recruitid = data.recruitid;
					var recommendresumedate = data.recommendresumedate;
			        var resumefeedbackdate = data.resumefeedbackdate;
					nui.open({
						url: "/default/ame_permanage/ame_interview/createInterviewProcess.jsp?id=" + recruitid + "&recommendresumedate=" + recommendresumedate + "&resumefeedbackdate=" + resumefeedbackdate,
			            title: "发起面试安排流程", 
						width: 1100,
			            height: 520,
			            onload: function () {
		            	 	var iframe = this.getIFrameEl();
			                var data = { "resumes": rows};
			                iframe.contentWindow.initdate(data);
			            },
			            ondestroy: function (action) {
			            	grid.reload();
			            }
					});
				}
			}
		});
	}
</script>
</html>