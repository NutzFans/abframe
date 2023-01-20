<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2019-08-21 17:24:17
  - Description:
-->
<head>
<title>打印新员工个人信息确认表</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery.qrcode.min.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/JsBarcode.all.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-barcode.js"></script>  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<style type="text/css">
    .asLabel{border:0;background-color:#F5F5F5;cursor:default;}
</style>
</head>
<body>
<div style="height: auto">
	<div class="mini-panel" style="width: 788px;height: auto">
		<form id=form_Intend method="post" style="table-layout:fixed;" >
			<div style="text-align:center;"><span style="font-weight:bold;text-align:center;">新员工个人信息表</span></div>
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend >基本信息</legend>
				<div style="padding:5px;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:141px;">姓名:</td>
							<td name="emp.empname" id="empname" class = "asLabel" style="width:190px"></td>
	                		<td align="right" style="width:145px;">性别:</td>
	                		<td name="emp.gender" id="gender" class = "asLabel" style="width:190px"></td>
							<td align="right" style="width:174px;">籍贯:</td>
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
							<td align="right" style="width:141px;">家庭电话:</td>
							<td name="emp.htel" id="htel" class = "asLabel" style="width:190px"></td>
	                		<td align="right" style="width:145px;">联系地址邮编:</td>
	                		<td name="emp.hzipcode" id="hzipcode" class = "asLabel" style="width:190px"></td>
							<td align="right" style="width:174px;">联系地址:</td>
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
							<td align="right" style="width:100px;">福利缴纳省市:</td>
							<td name="emp.welfareplace" id="welfareplace" class = "asLabel" style="width:190px"></td>
							<td align="right" style="width:100px;">原福利缴纳省市:</td>
							<td name="emp.origwelfarprovin" id="origwelfarprovin" class = "asLabel" style="width:190px"></td>
	                		<td align="right" style="width:100px;">公积金账号:</td>
	                		<td name="emp.fundno" id="fundno" class = "asLabel" style="width:190px"></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">补充公积金账号:</td>
							<td name="emp.addfundno" id="addfundno" class = "asLabel" style="width:190px"></td>
							<td align="right" style="width:100px;">未成年子女姓名:</td>
							<td name="emp.nonagename" id="nonagename" class = "asLabel" style="width:190px"></td>
	                		<td align="right" style="width:100px;">未成年子女性别:</td>
	                		<td name="emp.nonagesex" id="nonagesex" class = "asLabel" style="width:190px"></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">未成年子女生日:</td>
							<td name="emp.nonagebirth" id="nonagebirth" class = "asLabel" style="width:190px"></td>
							<td align="right" style="width:100px;">PCF:</td>
							<td name="emp.pcfamount" id="pcfamount" class = "asLabel" style="width:190px"></td>
	                		<td align="right" style="width:100px;">招商银行卡号:</td>
	                		<td name="omIntendJoin.cmbcardno" id="cmbcardno" class = "asLabel" style="width:190px"></td>
						</tr>
						<tr>
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
		            	<div field="startdate" width="40" headerAlign="center"  align="center" allowSort="true">开始时间</div>
		            	<div field="enddate" width="40" headerAlign="center"  align="center" allowSort="true">终止时间</div>
		            	<div field="degree" width="70" headerAlign="center"  align="center" allowSort="true" renderer="getDegree">学历</div>
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
		                <div field="startdate" width="40" align="center" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd">开始时间</div>
		                <div field="enddate" width="40" align="center" headerAlign="center" renderer="onDealDateS" dateFormat="yyyy-MM-dd">终止时间</div>
		                <div field="companyname" width="70" align="center" headerAlign="center">工作单位</div>
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
		                <div field="beginenddate" width="40" align="center" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd">开始时间</div>
		                <div field="enddate" width="40" align="center" headerAlign="center" renderer="onDealDateS" dateFormat="yyyy-MM-dd">终止时间</div>
		                <div field="projectname" width="70" align="center" headerAlign="center">项目名称</div>
		               	<div field="projectintroduce" width="110" align="left" headerAlign="center">项目描述</div>
		                <div field="projectduty" width="150" align="left" headerAlign="center" >主要职责</div> 
		            </div>
	        	</div>
			</fieldset>
		</form>
		
		<fieldset id="field8" style="border:solid 1px #aaa;padding:3px;">
			<div style="text-align:left;margin-right:200px;color:red;font-weight:bold;">
				我承诺以上信息真实、有效，如提供虚假信息，本人愿意承担一切相关法律后果。
			</div>
			<div style="text-align:right;margin-right:200px">
				<span >员工签名（手写）：</span>
			</div>
		</fieldset>
	</div>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form_Intend = new nui.Form("form_Intend");
	//工作经历表
	var grid_workDetail = nui.get("grid_workDetail");
	//项目经理表
	var grid_projectDetail = nui.get("grid_projectDetail");
	//学历表
	var education = nui.get("Education");
	
	initdate();
  	function initdate(){
  		nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_entry.getProcessEntry.biz.ext",
            data: {intendid:null,workItemID:<%=request.getParameter("workItemID")%>,processInstID:null},
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
            		document.getElementById("origwelfarprovin").innerHTML = o.omIntendJoin.origwelfarprovin == null ?"":nui.getDictText("AREA4CLRY",o.omIntendJoin.origwelfarprovin);
            		document.getElementById("fundno").innerHTML = o.emp.fundno == null ?"":o.emp.fundno;
            		document.getElementById("addfundno").innerHTML = o.emp.addfundno == null ?"":o.emp.addfundno;
            		document.getElementById("nonagename").innerHTML = o.emp.nonagename == null ?"":o.emp.nonagename;
            		document.getElementById("nonagesex").innerHTML = o.emp.nonagesex == null ?"":nui.getDictText("ABF_GENDER",o.emp.nonagesex);
            		document.getElementById("nonagebirth").innerHTML = o.emp.nonagebirth == null ?"":o.emp.nonagebirth;
            		document.getElementById("pcfamount").innerHTML = o.emp.pcfamount == null ?"":o.emp.pcfamount;
            		document.getElementById("cmbcardno").innerHTML = o.omIntendJoin.cmbcardno == null ?"":o.omIntendJoin.cmbcardno;
            		document.getElementById("pfbankcardno").innerHTML = o.omIntendJoin.pfbankcardno == null ?"":o.omIntendJoin.pfbankcardno;
            		//学历信息
            		education.load({ resumeid: o.resume.resumeid});
            		//工作经历
		            grid_workDetail.load({resumeid: o.resume.resumeid});
		            grid_workDetail.sortBy("startdate", "desc");
		            //项目经历
		            grid_projectDetail.load({resumeid: o.resume.resumeid});
		            grid_projectDetail.sortBy("beginenddate", "desc");
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
	function getDegree(e){
		return nui.getDictText('DEGREE',e.value);
	}
	function getSchooltype(e){
		return nui.getDictText('SCHOOL_TYPE',e.value);
	}
 </script>
</html>