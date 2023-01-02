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
  - Date: 2019-08-06 10:41:46
  - Description:
-->
<head>
<title>合同确认及下载</title>
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
	<form id=form_Intend method="post">
		<div style="text-align:center;"><span style="font-weight:bold;text-align:center;">新员工个人信息表</span></div>
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<input name="omIntendJoin.intendid" id="intendid"  class="nui-hidden"/>
			<input name="omIntendJoin.processinstid" id="processinstid2"  class="nui-hidden"/>
			<input name="omIntendJoin.fileids" id="fileids1" class="nui-hidden"/>
			<input name="resume.resumeid" id="resumeid" class="nui-hidden"/>
			<input class="nui-hidden" id="workItemID" value="<%=workItemID %>"/>
			<legend >基本信息</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:100px;">姓名:</td>
						<td name="emp.empname" id="empname" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:100px;">性别:</td>
                		<td name="emp.gender" id="gender" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:100px;">籍贯:</td>
						<td name="emp.birthplace" id="birthplace" class = "asLabel" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">年龄:</td>
						<td name="omIntendJoin.age" id="age" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:100px;">出生年月:</td>
                		<td name="emp.birthdate" id="birthdate" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:100px;">身份证号码:</td>
						<td name="emp.cardno" id="cardno" class = "asLabel" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">民族:</td>
						<td name="emp.nation" id="nation" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:100px;">手机:</td>
                		<td name="emp.mobileno" id="mobileno" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:100px;">电子邮箱:</td>
						<td name="emp.pemail" id="pemail" class = "asLabel" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">入职时间:</td>
						<td name="emp.indate" id="indate" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:100px;">工作地:</td>
                		<td name="emp.workplace" id="workplace" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:100px;">社会工作开始时间:</td>
						<td name="emp.socialstart" id="socialstart" class = "asLabel" style="width:190px"></td>
					</tr>
					<tr>
                		<td align="right" style="width:100px;">最高学历:</td>
                		<td name="emp.highestlen" id="highestlen" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:100px;">入学日期:</td>
						<td name="emp.highestindate" id="highestindate" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:100px;">毕业日期:</td>
						<td name="emp.highestoutdate" id="highestoutdate" class = "asLabel" style="width:190px"></td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
			<legend >相关信息</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:100px;">家庭电话:</td>
						<td name="emp.htel" id="htel" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:100px;">联系地址邮编:</td>
                		<td name="emp.hzipcode" id="hzipcode" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:100px;">联系地址:</td>
						<td name="emp.haddress" id="haddress" class = "asLabel" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">紧急联系人:</td>
						<td name="emp.emergency" id="emergency" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:100px;">关系:</td>
                		<td name="emp.emerelation" id="emerelation" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:100px;">手机:</td>
						<td name="emp.emelink" id="emelink" class = "asLabel" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">户籍性质:</td>
						<td name="emp.resiproperty" id="resiproperty" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:100px;">户口所在省市:</td>
                		<td name="emp.residende" id="residende" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:100px;">户口所在地址:</td>
						<td name="emp.resiaddress" id="resiaddress" class = "asLabel" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">档案保管机构:</td>
						<td name="emp.filesaveorg" id="filesaveorg" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:100px;">档案所在省市:</td>
                		<td name="emp.filecity" id="filecity" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:100px;">档案所在地址:</td>
						<td name="emp.fileaddress" id="fileaddress" class = "asLabel" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">居住证类型:</td>
						<td name="emp.ishaveresi" id="ishaveresi" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:100px;">年限:</td>
                		<td name="emp.resilimit" id="resilimit" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:100px;">办理单位名称:</td>
						<td name="emp.residealorg" id="residealorg" class = "asLabel" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">原福利缴纳省市:</td>
						<td name="emp.welfareplace" id="welfareplace" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:100px;">公积金账号:</td>
                		<td name="emp.fundno" id="fundno" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:100px;">补充公积金账号:</td>
						<td name="emp.addfundno" id="addfundno" class = "asLabel" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">未成年子女姓名:</td>
						<td name="emp.nonagename" id="nonagename" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:100px;">未成年子女性别:</td>
                		<td name="emp.nonagesex" id="nonagesex" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:100px;">未成年子女出生年月:</td>
						<td name="emp.nonagebirth" id="nonagebirth" class = "asLabel" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:100px;">PCF:</td>
						<td name="emp.pcfamount" id="pcfamount" class = "asLabel" style="width:190px"></td>
                		<td align="right" style="width:100px;">招商银行卡号:</td>
                		<td name="omIntendJoin.cmbcardno" id="cmbcardno" class = "asLabel" style="width:190px"></td>
						<td align="right" style="width:100px;">浦发银行卡号:</td>
						<td name="omIntendJoin.pfbankcardno" id="pfbankcardno" class = "asLabel" style="width:190px"></td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend >学历信息</legend>
			<div id="Education" class="nui-datagrid" style="width:100%;height:auto;" dataField="edus"
	            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
	            url="org.gocom.abframe.org.employee.Education.getEducationByName.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
	            <div property="columns">
	            	<input field="empeducid" class="nui-hidden" visible="false">
	            	<div field="startdate" width="35" headerAlign="center"  align="center" allowSort="true">开始时间</div>
	            	<div field="enddate" width="35" headerAlign="center"  align="center" allowSort="true">终止时间</div>
	            	<div field="degree" width="80" headerAlign="center"  align="center" allowSort="true" renderer="getDegree">学历</div>
	                <div field="graduschool" width="110" headerAlign="center"  align="center">毕业学校</div>
	                <div field="profession" width="150" headerAlign="center" align="center">专业</div>
	            </div>
	        </div>
		</fieldset>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend >工作经历</legend>
			<div id="grid_workDetail" class="nui-datagrid" style="width: 100%;height:auto;" dataField="workExp" allowCellSelect="true" 
	    		showPager="false" allowCellEdit="true" multiSelect="true" editNextOnEnterKey="true" allowSortColumn="true" allowCellWrap="true"
	    		url="com.primeton.eos.ame_resume.resumeManage.getWorkExp.biz.ext" >
	            <div property="columns">
	                <div field="startdate" width="35" align="center" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd">开始时间</div>
	                <div field="enddate" width="35" align="center" headerAlign="center" renderer="onDealDateS" dateFormat="yyyy-MM-dd">终止时间</div>
	                <div field="companyname" width="80" align="center" headerAlign="center">工作单位</div>
	          	 	<div field="duty" width="110" align="center" headerAlign="center">职务 </div>
	                <div field="workdescription" width="150" align="left" headerAlign="center">主要职责</div> 
	            </div>
            </div>
		</fieldset>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend >项目经历</legend>
			<div id="grid_projectDetail" class="nui-datagrid" style="width: 100%;height:auto;" dataField="projExp" allowCellSelect="true" 
	    		showPager="false" allowCellEdit="true" multiSelect="true" editNextOnEnterKey="true" allowSortColumn="true" allowCellWrap="true"
	    		url="com.primeton.eos.ame_resume.resumeManage.getProjExp.biz.ext" >
	            <div property="columns">
	                <div field="beginenddate" width="35" align="center" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd">开始时间</div>
	                <div field="enddate" width="35" align="center" headerAlign="center" renderer="onDealDateS" dateFormat="yyyy-MM-dd">终止时间</div>
	                <div field="projectname" width="80" align="center" headerAlign="center">项目名称</div>
	               	<div field="projectintroduce" width="110" align="left" headerAlign="center">项目描述</div>
	                <div field="projectduty" width="150" align="left" headerAlign="center" >主要职责</div> 
	            </div>
        	</div>
		</fieldset>
	</form>
	
	<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		<legend>入职附件</legend>
		<jsp:include page="/ame_common/detailFile.jsp"/>
	</fieldset>
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
	<fieldset id="field8" style="border:solid 1px #aaa;padding:3px;">
		<legend >入职打印清单及入职确认</legend>
		<div style="text-align:left; margin-left:5%;">
			1、<span style="color:red" id="zhengshi">请下载打印劳动合同，</span>
			<span style="color:red" id="shixi">实习生请打印实习协议，如果上方“入职附件”中有实习补充协议请一并打印，</span>
			<span style="color:red">填写好后交给人事。</span>
			<a class="nui-button"onclick="exportPDFContract('InternshipAgreement.pdf')" id="InternshipAgreement">实习协议</a>
			<a class="nui-button"onclick="exportPDFContract('Primeton_LaborContract.pdf')" id="Primeton_LaborContract">普元劳动合同</a>
			<a class="nui-button"onclick="exportPDFContract('PrimetonSmart_LaborContract.pdf')" id="PrimetonSmart_LaborContract">普元智慧数据劳动合同</a>
			<a class="nui-button"onclick="exportPDFContract('PrimetonNingbo_LaborContract.pdf')" id="PrimetonNingbo_LaborContract">宁波普元劳动合同</a>
			<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
				<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
				<input type="hidden" name="downloadFile" filter="false"/>
				<input type="hidden" name="fileName" filter="false"/>
			</form>	
		</div>
		<div style="text-align:left; margin-left:5%;">
			2、<a class="nui-button" onclick="print()" style="width:130px;margin-right:20px;" id="print" >打印员工信息确认表</a>
		</div>
		<div style="text-align:left; margin-left:5%;">
			3、<a href="/default/ame_permanage/ame_entry/ame_entry_file/保密承诺书.pdf" target="_blank">打印保密承诺书</a>
		</div>
		<div style="text-align:left; margin-left:5%;">
			4、<a href="/default/ame_permanage/ame_entry/ame_entry_file/新员工入职手续接收清单.pdf" target="_blank">打印新员工入职手续清单</a>
		</div>
		<div style="text-align:left; margin-left:5%;" id="LetterOfAppoint">
			5、<a class="nui-button"onclick="exportPDFContract('LetterOfAppoint.pdf')" >打印员工录用告知书</a>
		</div>
		<div style="text-align:left; margin-left:5%;" id="receiptall">
			6、<a href="/default/ame_permanage/ame_entry/ame_entry_file/普元公司员工手册签收单.pdf" target="_blank" id="receipt">打印员工手册签收单</a>
		</div>
		<div style="text-align:left; margin-left:5%;">
			<div id="confirmInto" name="confirmInto" class="nui-checkbox" style="font-weight:bold;text-align:center;">同意签署劳动合同成为公司员工</div>
		</div>
	</fieldset>
	<form id="recept" method="post">
		<fieldset id="contProve" style="border:solid 1px #aaa;padding:3px;">
	        <legend>为方便HR给您回寄盖章合同，请填写个人联系方式：</legend>
	        <table style="table-layout:fixed;" id="table_file1">
	        	<tr>
	        		<td style="width:120px;" align="right">收件人：</td>
	                <td style="width:150px;">   
	                    <input name="recept.recipient" id="recipient" class="nui-textbox" required="true"/>
	                </td>
	        		<td style="width:120px;" align="right">联系电话：</td>
	                <td style="width:150px;">    
	                    <input name="recept.telephone" id="telephone" class="nui-textbox" required="true"/>
	                </td>
	        		<td style="width:115px;" align="right">收件地址：</td>
	                <td style="width:150px;" colspan="3">    
	                    <input name="recept.address" id="address" class="nui-textbox" style="width: 400px;" required="true"/>
	                </td>
	        	</tr>
	        </table>
		</fieldset>
	</form>
    <!-- 审核意见  -->
	<fieldset style="display:none;">
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</fieldset>
	<fieldset id="field5" style="display:none;border:solid 1px #aaa;padding:3px;">
		<legend>处理意见附件</legend>
		<jsp:include page="/ame_common/addFiles.jsp"/>
	</fieldset>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" style="width:60px;margin-right:20px;" id="appButton">提交</a>
	<a class="nui-button"onclick="onCancel" iconCls="icon-close" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form_Intend = new nui.Form("form_Intend");
	var recept = new nui.Form("recept")
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
	//工作经历表
	var grid_workDetail = nui.get("grid_workDetail");
	//项目经理表
	var grid_projectDetail = nui.get("grid_projectDetail");
	//学历表
	var education = nui.get("Education");
	
	var pdfjson = [];
	
	var isNeedProbation = "";
	
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
					var empid = o.emp.empid;
					var intendid = o.omIntendJoin.intendid;
            		//基本信息
            		document.getElementById("empname").innerHTML = o.emp.empname == null ?"":o.emp.empname;
            		document.getElementById("gender").innerHTML = o.emp.gender == null ?"":nui.getDictText("ABF_GENDER",o.emp.gender);
            		document.getElementById("birthplace").innerHTML = o.emp.birthplace == null ?"":o.emp.birthplace;
            		/* document.getElementById("age").innerHTML = o.omIntendJoin.age == null ?"":o.omIntendJoin.age; */
            		document.getElementById("birthdate").innerHTML = o.emp.birthdate == null ?"":o.emp.birthdate;
            		document.getElementById("cardno").innerHTML = o.emp.cardno == null ?"":o.emp.cardno;
            		document.getElementById("nation").innerHTML = o.emp.nation == null ?"":o.emp.nation;
            		document.getElementById("mobileno").innerHTML = o.emp.mobileno == null ?"":o.emp.mobileno;
            		document.getElementById("pemail").innerHTML = o.emp.pemail == null ?"":o.emp.pemail;
            		document.getElementById("indate").innerHTML = o.emp.indate == null ?"":o.emp.indate;
            		document.getElementById("workplace").innerHTML = o.emp.workplace == null ?"":nui.getDictText("AREA4CLRY",o.emp.workplace);
            		document.getElementById("socialstart").innerHTML = o.emp.socialstart == null ?"":o.emp.socialstart;
            		document.getElementById("highestindate").innerHTML = o.emp.highestindate == null ?"":o.emp.highestindate;
            		document.getElementById("highestlen").innerHTML = o.emp.highestlen == null ?"":nui.getDictText("DEGREE",o.emp.highestlen);
            		document.getElementById("highestoutdate").innerHTML = o.emp.highestoutdate == null ?"":o.emp.highestoutdate;
            		//根据出生日期计算周岁
            		document.getElementById("age").innerHTML =computerAge(o.emp.birthdate);
            		//相关信息
            		document.getElementById("htel").innerHTML = o.emp.htel == null ?"":o.emp.htel;
            		document.getElementById("hzipcode").innerHTML = o.emp.hzipcode == null ?"":o.emp.hzipcode;
            		document.getElementById("haddress").innerHTML = o.emp.haddress == null ?"":o.emp.haddress;
            		document.getElementById("emergency").innerHTML = o.emp.emergency == null ?"":o.emp.emergency;
            		document.getElementById("emerelation").innerHTML = o.emp.emerelation == null ?"":nui.getDictText("EMP_RELATION",o.emp.emerelation);
            		document.getElementById("emelink").innerHTML = o.emp.emelink == null ?"":o.emp.emelink;
            		document.getElementById("resiproperty").innerHTML = o.emp.resiproperty == null ?"":nui.getDictText("ABF_BIRTHTYPE",o.emp.resiproperty);
            		document.getElementById("residende").innerHTML = o.emp.residende == null ?"":nui.getDictText("MIS_AREA",o.emp.residende);
            		document.getElementById("resiaddress").innerHTML = o.emp.resiaddress == null ?"":o.emp.resiaddress;
            		document.getElementById("filesaveorg").innerHTML = o.emp.filesaveorg == null ?"":o.emp.filesaveorg;
            		document.getElementById("filecity").innerHTML = o.emp.filecity == null ?"":nui.getDictText("MIS_AREA",o.emp.filecity);
            		document.getElementById("fileaddress").innerHTML = o.emp.fileaddress == null ?"":o.emp.fileaddress;
            		document.getElementById("ishaveresi").innerHTML = o.emp.ishaveresi == null ?"":nui.getDictText("AME_RESIDENCE",o.emp.ishaveresi);
            		document.getElementById("resilimit").innerHTML = o.emp.resilimit == null ?"":o.emp.resilimit;
            		document.getElementById("residealorg").innerHTML = o.emp.residealorg == null ?"":o.emp.residealorg;
            		document.getElementById("welfareplace").innerHTML = o.emp.welfareplace == null ?"":nui.getDictText("AREA4CLRY",o.emp.welfareplace);
            		document.getElementById("fundno").innerHTML = o.emp.fundno == null ?"":o.emp.fundno;
            		document.getElementById("addfundno").innerHTML = o.emp.addfundno == null ?"":o.emp.addfundno;
            		document.getElementById("nonagename").innerHTML = o.emp.nonagename == null ?"":o.emp.nonagename;
            		document.getElementById("nonagesex").innerHTML = o.emp.nonagesex == null ?"":nui.getDictText("ABF_GENDER",o.emp.nonagesex);
            		document.getElementById("nonagebirth").innerHTML = o.emp.nonagebirth == null ?"":o.emp.nonagebirth;
            		document.getElementById("pcfamount").innerHTML = o.emp.pcfamount == null ?"":o.emp.pcfamount;
            		document.getElementById("cmbcardno").innerHTML = o.omIntendJoin.cmbcardno == null ?"":o.omIntendJoin.cmbcardno;
            		document.getElementById("pfbankcardno").innerHTML = o.omIntendJoin.pfbankcardno == null ?"":o.omIntendJoin.pfbankcardno;
            		isNeedProbation = o.omIntendJoin.isNeedProbation;
            		
            		//学历信息
            		education.load({ resumeid: o.resume.resumeid});
            		//工作经历
		            grid_workDetail.load({resumeid: o.resume.resumeid});
		            grid_workDetail.sortBy("startdate", "desc");
		            //项目经历
		            grid_projectDetail.load({resumeid: o.resume.resumeid});
		            grid_projectDetail.sortBy("beginenddate", "desc");
		            //劳动合同信息
					var emptype = o.emp.emptype;
					var company = o.omIntendJoin.company;
					if(emptype == '2'){//实习生
						document.getElementById("InternshipAgreement").style.display="none";
						document.getElementById("LetterOfAppoint").style.display="none";
						document.getElementById("receiptall").style.display="none";
						document.getElementById("shixi").style.display="none";
						document.getElementById("zhengshi").style.display="none";
						document.getElementById("Primeton_LaborContract").style.display="none";
						document.getElementById("PrimetonSmart_LaborContract").style.display="none";
						document.getElementById("PrimetonNingbo_LaborContract").style.display="none";
					}else{
						document.getElementById("InternshipAgreement").style.display="none";
						document.getElementById("shixi").style.display="none";
						document.getElementById("zhengshi").style.display="";
						if(company == '2'){
							document.getElementById("receipt").href = "/default/ame_permanage/ame_entry/ame_entry_file/北京普元智慧公司员工手册签收单.pdf";
							document.getElementById("Primeton_LaborContract").style.display="none";
							document.getElementById("PrimetonSmart_LaborContract").style.display="";
							document.getElementById("PrimetonNingbo_LaborContract").style.display="none";
						}else if(company == '3'){
							document.getElementById("receipt").href = "/default/ame_permanage/ame_entry/ame_entry_file/宁波普元公司员工手册签收单.pdf";
							document.getElementById("Primeton_LaborContract").style.display="none";
							document.getElementById("PrimetonSmart_LaborContract").style.display="none";
							document.getElementById("PrimetonNingbo_LaborContract").style.display="";
						}else{
							document.getElementById("Primeton_LaborContract").style.display="";
							document.getElementById("PrimetonSmart_LaborContract").style.display="none";
							document.getElementById("PrimetonNingbo_LaborContract").style.display="none";
						}
					}
					
					if(isNeedProbation ==  "1"){
						document.getElementById("LetterOfAppoint").style.display="none";
					}
		            
		            //附件加载（加载新员工上传的入职附件）
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
					nui.get("activitydefid").setValue(o.workitem.activityDefID);
					
					//导出pdf模板数据
					var startdate = new Date(o.emp.indate);//获取合同开始日期
					var endday;//获取合同结束日期
					if(startdate.getDate() <= 15){
						endday = 15;
					}else{
						var enddate = new Date(startdate.getFullYear()+3,startdate.getMonth()+1,0);
						endday = enddate.getDate();
					}
					var trialstartdate = null;
					if(o.omIntendJoin.probationstartdate != null && o.omIntendJoin.probationstartdate != ''){
						trialstartdate = new Date(o.omIntendJoin.probationstartdate);//获取试用期开始日期
					}
					var trialdate = null;
					if(o.omIntendJoin.probationenddate != null && o.omIntendJoin.probationenddate != ''){
						trialdate = new Date(o.omIntendJoin.probationenddate);//获取试用期结束日期
					}
			        //合同签署部门
            		var htorgname = o.omIntendJoin.htorgname;
				  	if(htorgname){
				  		if(htorgname.indexOf(',')!=-1){
				  			htorgname = htorgname.split(',')[0];
				  		}
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
								"endyear":startdate.getFullYear()+3,
								"endmonth":startdate.getMonth()+1,
								"endday":endday,
								"starttrialyear":trialstartdate == null ?"/":trialstartdate.getFullYear(),
								"starttrialmonth":trialstartdate == null ?"/":trialstartdate.getMonth()+1,
								"starttrialday":trialstartdate == null ?"/":trialstartdate.getDate(),
								"endtrialyear":trialdate == null ?"/":trialdate.getFullYear(),
								"endtrialmonth":trialdate == null ?"/":trialdate.getMonth()+1,
								"endtrialday":trialdate == null ?"/":trialdate.getDate(),
								"positionname":nui.getDictText("AME_POSITION_MEMO",o.emp.positionname),
								"positionmemo":o.emp.positionname == null ?"":getDictfile("AME_POSITION_MEMO",o.emp.positionname),
								"positioncall":o.emp.positioncall == null ?"":o.emp.positioncall,
								"workplace":o.emp.workplace == null ?"":nui.getDictText("AREA4CLRY",o.emp.workplace),
								"worktype":o.omIntendJoin.worktype == null ?(o.emp.degree == 1 || o.emp.degree == 2?'2':'1'):o.omIntendJoin.worktype,
								"nowyear":indate.getFullYear(),
								"nowmonth":indate.getMonth()+1,
								"nowdate":indate.getDate(),
								"nowday":startdate.getFullYear()+'-'+(startdate.getMonth()+1)+'-'+startdate.getDate()
								}});
            	}
        	},
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
    	});
  	}
  	//根据出生日期计算周岁
  	function computerAge(birthDate){
  		if(!birthDate){
  			return '';
  		}
  		var now =  new Date();
  		var nowYear = now.getFullYear();
	    var nowMonth = now.getMonth() + 1;
	    var nowDay = now.getDate();
	    var bd = new Date(birthDate);
	    var bdYear = bd.getFullYear();
	    var bdMonth = bd.getMonth() + 1;
	    var bdDay = bd.getDate();
	    if(nowYear<bdYear){
	    	return '';
	    }
	    if(bdMonth<nowMonth){
	    	return nowYear-bdYear;
	    }else if(bdMonth==nowMonth){
	    	if(bdDay<=nowDay){
	    		return nowYear-bdYear;
	    	}else if(bdDay>nowDay){
	    		return (nowYear-bdYear)-1;
	    	}
	    }else{
	    	return (nowYear-bdYear)-1;
	    }
  	}
  	
  	//提交流程
	function onOk(){
		var filePaths = document.getElementsByName("uploadfile").length;
    	for(var j = 0;j < filePaths;j++){
    		var a = document.getElementsByName("remarkList")[j].value;
    		if(a == null || a == ""){
    			nui.alert("新增附件不可以为空");
    			return false;
    		}
    	}
    	var auditstatus = nui.get("auditstatus").getValue();
    	if(auditstatus == 1){
    		var confirmInto = nui.get("confirmInto").getValue();
			if(confirmInto == false || confirmInto == 'false'){
				nui.alert("请勾选同意签署劳动合同成为公司员工!");
				return false;
			}
    	}
    	var recipient = nui.get("recipient").getValue();
    	var telephone = nui.get("telephone").getValue();
    	var address = nui.get("address").getValue();
    	if(recipient == null || recipient == "" || telephone == null || telephone == ""|| address == null || address == ""){
			nui.alert("请填写个人联系方式！");
			return false;
		}
    	
    	if(!form_Intend.validate() && auditstatus!="2"){
			nui.alert("信息录入不完整!");
			return false;
		}else{
			nui.confirm("请确认您是否已下载或打印相关附件？否则提交之后将无法打印与下载！","提交提示",function(action){
				if(action == "ok"){
					form2.submit();
				}
			});
		}
	}
	//保存
	function SaveData(){
		var json = form_Intend.getData();
		var message = "提交";
		//发起页面的处理信息
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		json.omIntendJoin.endback = "0";
		json.recept = recept.getData().recept;
		
		nui.confirm("确定要"+message+"新员工入职流程吗？","操作提示",function (action){
			if(action == "ok"){
				nui.get("appButton").setEnabled(false);
				nui.get("print").setEnabled(false);
				form_Intend.loading("处理中,请稍后...");
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
								nui.get("print").setEnabled(true);
				        	});
	    				}else if(action.exception == "fallsendmail"){
				        	nui.alert(message+"新员工入职流程成功！提醒邮件发送失败，请手动发送入职提醒邮件！","系统提示",function(){
				        		CloseWindow("ok");
			    				nui.get("appButton").setEnabled(true);
								nui.get("print").setEnabled(true);
				        	});
	    				}else{
	    					nui.alert("流程提交失败！","系统提示",function (){
			    				nui.get("appButton").setEnabled(true);
								nui.get("print").setEnabled(true);
	    					});
	    				}
	    			},
	    			error:function(jqXHR, teactionatus, errorThrown){
	    				nui.alert("error:" + jqXHR.responseText);
	    			}
	    		});
			}
		});
	}
	
	function print(){
		executeUrl = "/default/ame_permanage/ame_entry/printNestaffConfirmMessage.jsp?workItemID=" + "<%=workItemID %>";
		window.open(executeUrl);
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
	
	function exportPDFContract(filename){
		pdfjson.filename = filename;
		nui.ajax({
			url: "com.primeton.eos.ame_permanage.ame_entry.createLaborContractByPDFTemplate.biz.ext",
	        type: "post",
	        data: pdfjson,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		var filePath = o.downloadFile;
	        	var fileName = "劳动合同";
	        	if(pdfjson.filename == "LetterOfAppoint.pdf"){
	        		fileName = "员工录用告知书";
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
</script>
</html>