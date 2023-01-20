<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String contextPath=request.getContextPath(); %>
<title>拟入职人员信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
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
<body>
	<div class="nui-fit">
	  <div class="nui-panel" title="拟入职人员信息" style="width: 100%;">
		<!-- 提示信息展示  -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<div id="form1" >
		<fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>基本个人信息</legend>
			<div style="width: 100%;padding: 5px;">
				<table style="width: 98.2%;">
					<tr>
						<td align="right" style="width: 80px;height: 25px;">姓名：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.intendname" id="intendname" readonly="readonly"width="100%" class="nui-textbox" required="true" />
							<!-- emptyText="请输入商品编号" -->
						</td>
						<td align="right" style="width: 80px;height: 25px;">性别：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.gender" class="nui-dictcombobox" readonly="readonly" width="100%" dictTypeId="ABF_GENDER" required="true" />
						</td>
						<td align="right" style="width: 80px;height: 25px;">籍贯：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.birthplace" class="nui-textbox" width="100%"readonly="readonly" required="true"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 80px;height: 25px;">民族：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.nation" width="100%" class="nui-textbox" readonly="readonly"required="true" />
						</td>
						<td align="right" style="width: 80px;height: 25px;">证件类型：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.cardtype" id="cardtype" width="100%" class="nui-dictcombobox" readonly="readonly"dictTypeId="ABF_CARDTYPE" required="true" />
						</td>
						<td align="right" style="width: 80px;height: 25px;">证件号码：</td>
						<td align="left">
							<input name="omIntendJoin.cardno" id="cardno" class="nui-textbox" width="100%" required="true"readonly="readonly" vtype="maxLength:18" />
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 80px;height: 25px;">出生日期：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.birthdate" width="100%" id="birthdate" class="nui-datepicker" readonly="readonly" required="true" />
						</td>
						<td align="right" style="width: 80px;height: 25px;">手机：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.mobileno" id="mobileno" width="100%" class="nui-textbox" readonly="readonly" required="true"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">电子邮箱：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.email" class="nui-textbox" width="100%" required="true" readonly="readonly" vtype="email;maxLength:20;"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 80px;height: 25px;">入职时间：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.interdate" class="nui-datepicker" width="100%" readonly="readonly" required="true" />
						</td>
						<td align="right" style="width: 80px;height: 25px;">社会开始工作时间：</td>
						<td align="left" style="width: 140px;" id="socialTime">
							<input name="omIntendJoin.socialstart" class="nui-datepicker" width="100%" readonly="readonly" required="true"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">工作地：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.intendworkplace" id="intendworkplace" class="nui-dictcombobox" readonly="readonly" dictTypeId="AREA4CLRY" width="100%"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 80px;height: 25px;">最高学历：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.education" class="nui-dictcombobox" width="100%" dictTypeId="DEGREE" readonly="readonly" required="true" />
						</td>
						<td align="right" style="width: 80px;height: 25px;">最高学历入学时间：</td>
						<td align="left" style="width: 140px;" id="highstDegreeStarDate" >
							<input name="omIntendJoin.ghestindate" class="nui-datepicker" width="100%" readonly="readonly" required="true" />
						</td>
						<td align="right" style="width: 80px;height: 25px;">最高学历毕业时间：</td>
						<td align="left" style="width: 140px;" id="highstDegreeEndDate" >
							<input name="omIntendJoin.highestoutdate" class="nui-datepicker" width="100%" readonly="readonly" required="true" />
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 80px;height: 25px;">收件人：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.recipient"  class="nui-textbox" width="100%" required="true" readonly="readonly"  />
						</td>
						<td align="right" style="width: 80px;height: 25px;">联系电话：</td>
						<td align="left" style="width: 140px;" id="highstDegreeStarDate" >
							<input name="omIntendJoin.telephone"  class="nui-textbox" width="100%" required="true" readonly="readonly" />
						</td>
						<td align="right" style="width: 80px;height: 25px;">收件地址：</td>
						<td align="left" style="width: 140px;" id="sjaddress" >
							<input name="omIntendJoin.sjaddress"  class="nui-textbox" width="100%" required="true" readonly="readonly" />
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
						<td align="right" style="width: 80px;height: 25px;">家庭电话：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.htel"  width="100%" class="nui-textbox" readonly="readonly"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">联系地址邮编：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.postcode" id="postcode"  width="100%" class="nui-textbox" readonly="readonly"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">联系地址：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.address" width="106%" maxLength="100" class="nui-textbox" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 80px;height: 25px;">紧急联系人：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.emergency" width="100%" class="nui-textbox" readonly="readonly"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">与本人关系：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.emerelation" width="100%" class="nui-dictcombobox" dictTypeId="EMP_RELATION" readonly="readonly"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">紧急联系人手机：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.emelink" width="106%" class="nui-textbox" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 80px;height: 25px;">户籍性质：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.resiproperty" width="100%" class="nui-dictcombobox" dictTypeId="ABF_BIRTHTYPE" readonly="readonly"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">户口所在省市：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.residence" width="100%" class="nui-dictcombobox" dictTypeId="MIS_AREA" readonly="readonly"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">户口所在地址：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.haddress" width="106%" class="nui-textbox" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 80px;height: 25px;">档案保管机构：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.filesaveorg" width="100%" class="nui-textbox" readonly="readonly"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">档案所在省市：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.filecity" width="100%" class="nui-dictcombobox" dictTypeId="MIS_AREA" readonly="readonly"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">档案所在地址：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.fileaddress" width="106%" class="nui-textbox" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 80px;height: 25px;">居住证类型：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.ishaveresi" width="100%" class="nui-dictcombobox" dictTypeId="AME_RESIDENCE" readonly="readonly"/>
							
						</td>
						<td align="right" style="width: 80px;height: 25px;">居住证办理单位名称：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.residealorg" width="100%" class="nui-textbox" readonly="readonly"/>
							
						</td>
						<td align="right" style="width: 80px;height: 25px;">居住证开始时间：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.resistartdate" width="106%" class="nui-datepicker" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 80px; height: 25px;">居住证结束时间：</td>
						<td align="left" style="width: 100px;">
							<input name="omIntendJoin.resienddate" width="100%" class="nui-datepicker" readonly="readonly"/>
						</td>
						<td align="right" style="width: 80px; height: 25px;">居住证年限：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.resilimit" vtype="maxLength:2" width="100%" class="nui-textbox" readonly="readonly"/>
						</td>
						<td align="right" style="width: 80px; height: 25px;">原福利缴纳省市：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.origwelfarprovin" width="106%" class="nui-dictcombobox" shownullItem="true" dictTypeId="AREA4CLRY" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 80px;height: 25px;">公积金账号：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.fundno" width="100%" vtype="maxLength:10" id ="fundno"  class="nui-textbox" readonly="readonly"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">补充公积金账号：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.addfundno" width="100%" vtype="maxLength:10"  class="nui-textbox" />
						</td>
						<td align="right" style="width: 80px;height: 25px;">婚姻状况：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.marristatus" width="106%" class="nui-dictcombobox" dictTypeId="ABF_MARRITYPE" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 80px;height: 25px;">未成年子女姓名：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.nonagename" width="100%" class="nui-textbox" readonly="readonly"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">未成年子女性别：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.nonagesex" width="100%" class="nui-dictcombobox" dictTypeId="ABF_GENDER" readonly="readonly"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">未成年子女出生年月：</td>
						<td align="left" style="width: 140px;">
						    <input name="omIntendJoin.nonagebirth" width="106%" class="nui-datepicker" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 80px;height: 25px;">招商银行卡号：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.cmbcardno" id="cmbcardno"  width="100%" class="nui-textbox" required="true" readonly="readonly"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">浦发银行卡号：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.pfbankcardno" id="pfbankcardno" width="100%" class="nui-textbox" required="true" readonly="readonly"/>
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
		<!--<fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>其他信息</legend>
			<div style="width: 97%;padding: 5px;">
				<table style="width: 100%;">
					<tr>
					    <td align="right" style="width: 80px;height: 25px;">工作电脑是否自备：</td>
						<td align="left" style="width: 140px;">
					 	    <input name="omIntendJoin.isTakePC" width="100%" id="isTakePC" class="nui-dictcombobox" dictTypeId="MIS_YN" required="true" readonly="readonly"/>
					    </td> 
						<td align="right" style="width: 80px;height: 25px;">是否自愿加入PCF：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.isjoinpcf" id="isjoinpcf" width="100%" class="nui-dictcombobox"  dictTypeId="MIS_YN" required="true" readonly="readonly"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">PCF捐款金额：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.pcfamount" id ='pcfamount' class="nui-spinner" format="n2" width="100%"  showbutton="false" required="true" readonly="readonly"/>
						</td>
					</tr>
				</table>
			</div>
		</fieldset>-->
		<!-- <fieldset style="border: solid 1px #aaa; padding: 3px;" id="pc">
			<legend>办公电脑</legend>
			<div style="padding: 5px;">
				<table style="width: 98%;">
					<tr>
					    <td align="right" style="width: 80px;height: 25px;">电脑品牌：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.brands" id="brands" width="100%" class="nui-textbox"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">型号：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.modelNo" id="modelNo" width="100%" class="nui-textbox"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">购买日期：</td>
						<td align="left" style="width: 140px;">
							<input id ="buyDate" name="omIntendJoin.buyDate" id="buyDate" width="100%" id="birthdate" class="nui-datepicker" />
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 80px;height: 25px;">CPU：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.cpu" id="cpu" width="100%" class="nui-textbox" />
						</td>
						<td align="right" style="width: 80px;height: 25px;">内存（G）：</td>
						<td align="left" style="width: 140px;">
							<input property="editor" name="omIntendJoin.ram"  id="ram" class="nui-spinner" vtype="int" minValue="0" maxValue="32" value="4" width="100%"/>
						</td>
						<td align="right" style="width: 80px;height: 25px;">序列号：</td>
						<td align="left" style="width: 140px;">
							<input name="omIntendJoin.serialNumber" id="serialNumber" width="100%" class="nui-textbox" />
						</td>
					</tr>
				</table>
			</div>
		</fieldset> -->
		<fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>学历信息</legend>
			 <div id="grid_degreeDetail" class="nui-datagrid" style="width: 100%; height: auto;" dataField="edus"  showPager="false"
					 allowCellWrap="true"  url="org.gocom.abframe.org.employee.Education.getEducationByName.biz.ext">
				<div property="columns">
				  <div field="startdate" width="30" align="center" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd" allowSort="true">开始时间</div> 
				  <div field="enddate" width="30" align="center" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd">终止时间</div>
				  <div field="degree" renderer="getDegree" width="55" align="center" headerAlign="center">学历</div>
				  <div field="graduschool" width="70" align="left" headerAlign="center">毕业院校</div>
				  <div field="profession" width="85" align="left" headerAlign="center">专业 </div>
				</div>
			  </div>
		</fieldset>
		<fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>工作经历</legend>
				<div id="grid_workDetail" class="nui-datagrid" style="width: 100%; height: auto;" dataField="workExp" showPager="false" 
					 url="com.primeton.eos.ame_resume.resumeManage.getWorkExp.biz.ext">
					<div property="columns">
						<div field="startdate" width="30" align="center" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd">开始时间</div> 
						<div field="enddate" width="30" align="center" headerAlign="center" renderer="onDealDateS" dateFormat="yyyy-MM-dd">终止时间 </div>
						<div field="companyname" width="55" align="left" headerAlign="center">工作单位 </div>
						<div field="duty" width="70" align="left" headerAlign="center">职务 </div>
						<div field="workdescription" width="85" align="left" headerAlign="center">主要职责 </div>
					</div>
				</div>
		</fieldset>
		<fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>项目经历</legend>
				<div id="grid_projectDetail" class="nui-datagrid" style="width: 100%; height: auto;" dataField="projExp" showPager="false"
					 url="com.primeton.eos.ame_resume.resumeManage.getProjExp.biz.ext">
					<div property="columns">
						<div field="beginenddate" width="30" align="center" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd">开始时间</div>
						<div field="enddate" width="30" align="center" headerAlign="center" renderer="onDealDate" dateFormat="yyyy-MM-dd">终止时间</div>
						<div field="projectname" width="55" align="left" headerAlign="center">项目名称 </div>
						<div field="projectintroduce" width="70" align="left" headerAlign="center">项目描述</div>
						<div field="projectduty" width="85" align="left" headerAlign="center">主要职责</div>
					</div>
				</div>
		</fieldset>
		<fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>有关证件（证书）</legend>
			<div id="grid_cert" class="nui-datagrid" style="width: 100%; height: auto;"  dataField="cert"  showPager="false"  
				 url="com.primeton.eos.ame_resume.resumeManage.getCert.biz.ext">
				<div property="columns">
					<div field="cardtype" width="60" headerAlign="center" align="center" renderer="onCertTypeRenderer">证件（证书）类型</div>
					<div field="cardno" width="80" headerAlign="center" align="left">证件号码 </div>
					<div field="startdate" width="60" headerAlign="center" dateFormat="yyyy-MM-dd" align="center">有效开始日期 </div>
					<div field="enddate" width="60" headerAlign="center" dateFormat="yyyy-MM-dd" align="center">有效截止日期</div>
					<div field="files" renderer="onFileRenderer" width="200" hight="100"  align="left" headerAlign="center">附件</div>
	                <div field="fileid" displayField="filename" width="200" headerAlign="center" align="left" visible="false">附件</div>
					<div field="remark" width="150" headerAlign="center" align="left">备注 </div>
				</div>
			</div>
		 </fieldset>
		</div>
		<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
			<legend>入职材料相关附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</fieldset>
    	<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
  </div>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onCancel('cancel')" id="closeResume" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
</div> 
</body>
<script type="text/javascript">
    var intendid = <%=request.getParameter("intendid")%>;
	var processInstID = <%=request.getParameter("processInstID")%>;
    var form = new nui.Form("form1");
    SetData();
    function SetData(){
            var json = {"omIntend":{"intendid":intendid,"processinstid":processInstID}};
            nui.ajax({
      		url: "org.gocom.abframe.org.recruit.queryIntend.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      		    o = nui.decode(o);
      		    //加载拟入职人员信息
       	  		form.setData(o);
       	  		
       	  		$("#opinionHide").hide();
  				//查询审核意见
				var grid = nui.get("datagrid1");
				grid.sortBy("time", "desc");
				grid.load({processInstID:o.omIntendJoin.processinstid});
				
				//加载学历详情
				var grid_degree = nui.get("grid_degreeDetail");
				var json = {resumeid:o.resume.resumeid};
				grid_degree.sortBy("startdate", "desc");
		  		grid_degree.load(json);
		  		
		  		//加载工作经历
				var grid_work = nui.get("grid_workDetail");
				var json = {resumeid:o.resume.resumeid};
				grid_work.sortBy("startdate", "desc");
		  		grid_work.load(json);
		  		
		  		//加载项目经历
				var grid_project = nui.get("grid_projectDetail");
				var json = {resumeid:o.resume.resumeid};
				grid_project.sortBy("beginenddate", "desc");
		  		grid_project.load(json);
		  		
		  		//加载证书
				var grid_cert = nui.get("grid_cert");
				var json = {resumeid:o.resume.resumeid};
				grid_cert.sortBy("startdate", "desc");
		  		grid_cert.load(json);		  		
		        nui.get("grid_0").load({"groupid":"omIntendJoinInfo","relationid":intendid});
		        
		        //加载附件
  				var grid_0 = nui.get("grid_0");
  				grid_0.load({"groupid":"omIntendJoinInfo","relationid":o.omIntendJoin.intendid});
				grid_0.sortBy("fileTime","desc");
		  				
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
    	if(processInstID != null && processInstID != ''){
    		document.getElementById("closeResume").style.display="none"
    	}
    }
    //日期格式化
	function onDealDate(e){
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
	//
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
</script>
</html>