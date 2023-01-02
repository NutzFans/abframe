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
  - Date: 2019-07-08 16:45:42
  - Description:
-->
<head>
<title>发起新员工入职流程</title>
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
<div class="nui-fit">
	<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
	<form id="form_Intend" method="post">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>拟入职基本信息</legend>
			<div style="padding:5px;">
				<table style="table-layout:fixed;width:100%;" id="table_intend1">
					<tr>
						<td align="right" style="width:130px">姓名：</td>
						<td name="omIntendJoin.intendname" class = "asLabel" id="intendname" style="width:190px"></td>
						<td align="right" style="width:130px">出生日期：</td>
						<td name="omIntendJoin.birthdate" class = "asLabel" id="birthdate" style="width:190px"></td>
						<td align="right" style="width:130px">员工属性：</td>
						<td name="omIntendJoin.intendpositiontype" class = "asLabel" id="intendpositiontype" style="width:190px"></td>
						<%--<td align="right" style="width:130px">学历：</td>
						<td name="omIntendJoin.education" class = "asLabel" id="education" style="width:190px"></td>--%>
					</tr>
					<tr>
						<td align="right" style="width:130px">人员性质：</td>
						<td name="omIntendJoin.intendjobtype" class = "asLabel" id="intendjobtype" style="width:190px"></td>
						<%--<td align="right" style="width:130px">参加工作年月：</td>
						<td name="omIntendJoin.worktime" class = "asLabel" id="worktime" style="width:190px"></td>--%>
						<td align="right" style="width:130px">招聘专员：</td>
						<td name="omIntendJoin.intendrecempname" class = "asLabel" id="intendrecempname" style="width:190px"></td>
						<td align="right" style="width:130px">招聘渠道：</td>
						<td name="omIntendJoin.recruitway" class = "asLabel" id="recruitway" style="width:190px"></td>
					</tr>
					<tr>
						<td align="right" style="width:130px">备注：</td>
						<td name="omIntendJoin.remark" class = "asLabel" id="remark" style="width:190px" colspan="5"></td>
					</tr>
				</table>
			</div>
		</fieldset>
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>入职基本信息</legend>
			<div style="padding:5px;">
				<input name="omIntendJoin.intendid" id="intendid"  class="nui-hidden"/>
				<input name="omIntendJoin.processinstid" id="processinstid"  class="nui-hidden"/>
				<input name="omIntendJoin.fileids" id="fileids" class="nui-hidden"/>
				<input name="omIntendJoin.intendname" class="nui-hidden"/>
				<input name="omIntendJoin.intendpositiontype" class="nui-hidden"/>
				<table style="table-layout:fixed;width:100%;" id="table_entry1">
					<tr>
						<%--<td align="right" style="width:130px;">员工工号:</td>
                		<td style="width:190px;" align="left">    
                    		<input name="omIntendJoin.empcode" id="empcode" class="nui-textbox"  width="100%" required="true" onvaluechanged="checkempcode"/>
                		</td>--%>
                		<td width="130px" align="right">直属主管：</td>
                		<td width="190px">    
							<input property="editor" name="omIntendJoin.managerid" id="managerid" width="100%" class="nui-buttonedit" onbuttonclick="selectManager(this)" showClose="false" required="true" allowInput="false" />
	                    </td>
	                    <td width="130px" align="right">入职导师：</td>
                		<td width="190px">    
							<input property="editor" name="omIntendJoin.tutorid" id="tutorid" width="100%" class="nui-buttonedit" onbuttonclick="selectTutor(this)" showClose="false" required="true" allowInput="false" />
	                    </td>
                		<td align="right" style="width:130px;">手机号码：</td>
                		<td style="width:190px;" align="left">    
                    		<input name="omIntendJoin.mobileno" id="mobileno" class="nui-textbox"  width="100%" required="true" onvaluechanged="checkmobileno"/>
                		</td>
                		
					</tr>
					<tr>
						<td align="right" style="width:130px;">性别：</td>
                		<td style="width:190px;" align="left">    
                    		<input name="omIntendJoin.gender" id="gender" class="nui-dictcombobox" dictTypeId="ABF_GENDER" width="100%" required="true" shownullItem="true"/>
                		</td>
						<td align="right" style="width:130px;">证件类型：</td>
                		<td style="width:190px;" align="left">    
                    		<input name="omIntendJoin.cardtype" id="cardtype" class="nui-dictcombobox" shownullItem="true" dictTypeId="ABF_CARDTYPE" required="false" width="100%" onvaluechanged="checkcardno"/>
                		</td>
						<td align="right" style="width:130px;">证件号码：</td>
                		<td style="width:190px;" align="left">    
                    		<input name="omIntendJoin.cardno" id="cardno" class="nui-textbox" width="100%" required="false"  onvaluechanged="checkcardno"/>
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:130px;">职位分类：</td>
                		<td style="width:190px;" align="left">    
                    		<input name="omIntendJoin.position" id="position" class="nui-dictcombobox" shownullItem="true" allowInput="true" dictTypeId="AME_POSITION_MEMO"  width="100%" required="true" onvaluechanged="setPositionName"/>
                		</td>
                		<td align="right" style="width:130px;">职位名称：</td>
                		<td style="width:190px;" align="left">    
                    		<input name="omIntendJoin.positionname" id="positionname" class="nui-textbox"   width="100%" required="true"/>
                		</td>
						<td align="right" style="width:130px;">所属部门：</td>
						<td align="left" style="width:190px;">
						    <input class="nui-combobox"name="omIntendJoin.inorgid" id="orgid" url="com.primeton.eos.ame_fee.cashflow.getAllOrg.biz.ext" filterType="like" 
							textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" 
							allowInput="true"  required="true" style="width:100%;"  onvaluechanged="checkorgisleaf">
						</td>
					</tr>
					<tr>
					    <td align="right" style="width:130px;">归属子公司：</td>
	                	<td style="width:190px;">    
                			<input name="omIntendJoin.company" id="company" class="nui-dictcombobox" dictTypeId="company" required="true"  style="width:100%"/>
	                	</td>
						<td align="right" style="width:130px;">入职日期：</td>
                		<td style="width:190px;" align="left">
						 	<input class="nui-datepicker" name="omIntendJoin.actdate" id="actdate" style="width:100%" required="true" onvaluechanged="changeactdate"/>
						</td>
						<td align="right" style="width:130px;">Base地点：</td>
	                	<td style="width:190px;">    
                			<input name="omIntendJoin.intendworkplace" id="intendworkplace" class="nui-dictcombobox" dictTypeId="AREA4CLRY" required="true"  style="width:100%;" onvaluechanged="changeintendworkplace"/>
	                	</td>
					</tr>
					<tr>
					    <td align="right" style="width:130px;">福利缴纳地：</td>
	                	<td style="width:190px;"> 
	                		<input name="omIntendJoin.welfare" class="nui-dictcombobox" dictTypeId="AREA4CLRY" required="true" allowInput="true"  style="width:100%;"/>
	                	</td>
						<td align="right" style="width:130px;">个人邮箱：</td>
                		<td style="width:190px;" align="left">    
                    		<input name="omIntendJoin.email" id="email" class="nui-textbox"  width="100%" required="true"/>
                		</td>
						<td align="right" style="width:130px;">居住证类型：</td>
	                	<td style="width:190px;"> 
	                		<input name="omIntendJoin.ishaveresi" class="nui-dictcombobox" dictTypeId="AME_RESIDENCE" required="true" allowInput="true"  style="width:100%;"/>
	                	</td>
					</tr>
					<tr>
					    <td align="right" style="width:130px;">学历验证：</td>
	                	<td style="width:190px;" >    
                			<input name="omIntendJoin.eduverify" id="eduverify" class="nui-dictcombobox" dictTypeId="EDUVERIFY" required="true"  style="width:100%;"/>
	                	</td>
						<td align="right" style="width:130px;display:none;">合同签署部门：</td>
						<td align="left" style="width:190px;display:none;">
						    <input class="nui-combobox"name="omIntendJoin.htorgname1" id="htorgname1" url="com.primeton.eos.ame_fee.cashflow.getAllOrg.biz.ext" filterType="like" 
							textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" 
							allowInput="true"  required="false" style="width:100%;"  onvaluechanged="checkorgisleaf">
						</td>
						<td width="130px" align="right">业务部门助理：</td>
                		<td width="190px">    
							<input property="editor" name="omIntendJoin.assistant" id="assistant" width="100%"  class="nui-buttonedit" onbuttonclick="selectTutor(this)" showClose="false"  allowInput="false" />
	                    </td>
	                    <td width="130px"  align="right" >参加工作年月：</td>
						<td width="190px" align="left">
							<input name="omIntendJoin.worktime" id="worktime" format="yyyyMM"  class="nui-monthpicker" style="width: 100%;" required="true"/>
						</td>
					</tr>
					<tr>
					    <!-- 是否涉密 -->
	                    <td width="130px" align="right">是否SM：</td>
                		<td width="190px">    
	                    	<input name="omIntendJoin.isSM" id="isSM" width="100%" class="nui-dictcombobox" dictTypeId="MIS_YN" />
	                    </td>	
						<td width="130px" align="right">无需申请公司电脑：</td>
                		<td width="190px">    
	                    	<input name="omIntendJoin.isTakePC" id="isTakePC" width="100%" class="nui-dictcombobox" dictTypeId="MIS_YN" required="true"/>
	                    </td>					
	                    <td width="130px" align="right">员工入职报到地址：</td>
                		<td width="190px" >    
	                    	<input name="omIntendJoin.entrypalce1" id="entrypalce1" onvaluechanged="changeEntryPlace" width="97%" class="nui-dictcombobox" dictTypeId="ENTRY_PLACE" required="true"/>
	                    </td>
					</tr>
					<tr>
						<td align="right" style="width:130px;">最高学历：</td>
	                	<td style="width:190px;" >    
                			<input name="omIntendJoin.education" id="education" class="nui-dictcombobox" dictTypeId="DEGREE" required="true"  style="width:100%;"/>
	                	</td>
					</tr>
					<tr id="placeTr" style="display:none;">
						<td width="130px" align="right">入职报到地址（手输）：</td>
                		<td width="190px" colspan="2">    
	                    	<input name="omIntendJoin.entrypalce2" id="entrypalce2" width="97%" class="nui-textbox" required="true"/>
	                    </td>	
					</tr>
					<tr>
						<td align="right" style="width:200px"   colspan="2">是否给入职员工发送邮件通知:
						</td>
						<td>
							<input class="nui-radiobuttonlist" name="omIntendJoin.issendmail" id="issendmail" repeatItems="2" repeatLayout="table" repeatDirection="Horizontal" textField="text" valueField="id" required="true" style="width:200px;" onvaluechanged="changeissendmail" data="[{'id': '1','text': '是'},{'id': '0','text': '否'}]">
						</td>
					</tr>
					<tr id="backman" style="display:none;">
						<td align="right" style="width:200px"   colspan="2">新员工入职邮件回复人:
						</td>
						<td>
							<input id="recruiterEmail" name="omIntendJoin.recruiterEmail" class="nui-textboxlist" onremoveitem="removecc" allowInput="true" textField="EMPNAMES" valueField="OEMAIL" searchField="name" style="width:500px;"  url="com.primeton.mis.contract.contractApproval.getEmpByName.biz.ext" required="true"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:200px"   colspan="2">是否为实习生转正:
						</td>
						<td>
							<input class="nui-radiobuttonlist" name="omIntendJoin.isTrainee" id="isTrainee" repeatItems="2" repeatLayout="table" repeatDirection="Horizontal" textField="text" valueField="id" required="true" style="width:200px;" onvaluechanged="watchisTrainee" data="[{'id': '1','text': '是'},{'id': '0','text': '否'}]">
						</td>
					</tr>
				</table>
			</div>
		</fieldset>
		
		<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;display:none">
			<legend>实习生转正关联信息</legend>
			<div style="padding:5px;">
				<table  style="table-layout:fixed;">
	                <tr>
	                	<td align="right" style="width:130px;">关联实习员工账号：</td>
	                	<td>
	                		<input name="omIntendJoin.userid" class="mini-textboxlist" id="userid" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" style="width:160px;" url="com.primeton.eos.ame_budget.budgetOrgManager.queryAllEmpByName.biz.ext" onvaluechanged="changeAgent"/>
	                	</td>
	                </tr>
                </table>
			</div>
		</fieldset>
		
		<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
			<legend>试用期期限基本信息</legend>
			<div style="padding:5px;">
				<table  style="table-layout:fixed;">
	                <tr>
	                	<td align="right" style="width:130px;">试用期开始时间：</td>
						<td style="width:190px;" align="left"> 
							<input class="nui-datepicker" name="omIntendJoin.probationstartdate" id="probationstartdate" style="width:100%" required="true" onvaluechanged="getDateNexThirdMonth('probationstartdate','probation','probationenddate')"/>
						</td>
						<td align="right" style="width:130px;">试用期期限(月)：</td>
						<td style="width:190px;" align="left">
							<input name="omIntendJoin.probation"  id="probation" class="nui-textbox"  onvaluechanged="getDateNexThirdMonth('probationstartdate','probation','probationenddate')" required="true" style="width:100%;" onblur="validate('probation')" value="3" inputStyle="text-align: right;"/>
						</td>
	                	<td align="right" style="width:130px;">试用期结束时间：</td>
						<td style="width:190px;" align="left"> 
							<input class="nui-datepicker" name="omIntendJoin.probationenddate" id="probationenddate" style="width:100%" required="true"/>
						</td>
	                </tr>
                </table>
			</div>
		</fieldset>
		
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>劳动合同期限基本信息</legend>
			<div style="padding:5px;">
				<table  style="table-layout:fixed;">
	                <tr>
	                	<td align="right" style="width:130px;">劳动合同开始时间：</td>
						<td style="width:190px;" align="left"> 
							<input class="nui-datepicker" name="omIntendJoin.laborstart" id="laborstart" style="width:100%" required="true" onvaluechanged="getDateNexThirdMonth('laborstart','laborterm','laborend')"/>
						</td>
						<td align="right" style="width:130px;">劳动合同期限(年)：</td>
						<td style="width:190px;" align="left">
							<input name="omIntendJoin.laborterm"  id="laborterm" class="nui-spinner" format="n2" showButton="false"   onvaluechanged="getDateNexThirdMonth('laborstart','laborterm','laborend')" required="true" style="width:100%;" <%--onblur="validate('laborterm')"--%> value="3" inputStyle="text-align: right;"/>
						</td>
	                	<td align="right" style="width:130px;">劳动合同结束时间：</td>
						<td style="width:190px;" align="left"> 
							<input class="nui-datepicker" name="omIntendJoin.laborend" id="laborend" style="width:100%" required="true"/>
						</td>
	                </tr>
                </table>
			</div>
		</fieldset>
	</form>
	<fieldset style="border:solid 1px #aaa;padding:3px;">
		<legend><span style="color: red">新员工入职邮件通知</span></legend>
		<div style="padding-left: 66px;"><span>行政确认人：</span><input id="spr" class="mini-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" style="width:200px;" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext"></div>
		<!-- <div style="line-height: 30px;"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;附加审批人：</span><span style="color:red">  除部门领导的其他审批人例如：项目经理等</span></div> -->
		<div style="line-height: 30px;padding-left: 66px;"><span>邮件抄送人：</span><input id="cclist" class="nui-textboxlist" onvaluechanged="changecc" allowInput="true" textField="EMPNAMES" valueField="OEMAIL" searchField="name" style="width:500px;"  url="com.primeton.mis.contract.contractApproval.getEmpByName.biz.ext" /><span style="color:red"> （需要补充部门助理以及其他需要告知的人）</span></div>
	</fieldset>
	<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		<legend>入职附件</legend>
		<jsp:include page="/ame_common/addFiles.jsp"/>
		<jsp:include page="/ame_common/detailFile.jsp"/>
	</fieldset>
	
    <form id="opioionform" method="post">
        <div style="padding:5px;" id="opinionHide">
            <table style="table-layout:fixed;">
            	<tr style="display:none;">
                    <td style="width:150px;" align="right">审核结果：</td>
                    <td style="width:250px;">  
						<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
                    </td>
                </tr>
                <tr>
                    <td style="width:150px;height:auto;" align="right">任务处理说明：</td>
                    <td colspan="3">
                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height:60px;"/>
                    </td>
                </tr>
            </table>
        </div>
	</form>
</div>

<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注</a>
	<a class="nui-button" onclick="onOk('app')" iconCls="icon-organization" style="width:135px;margin-right:20px;" id="appButton">发起入职申请流程</a>
	<%--<a class="nui-button" onclick="onOk('save')" iconCls="icon-save" style="width:95px;margin-right:20px;" id="saveButton">暂时保存</a>--%>
	<a class="nui-button"onclick="onCancel" iconCls="icon-close" style="width:60px;">关闭</a>
</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form_Intend = new nui.Form("form_Intend");
	//审核意见的表单
	var opioionform = new nui.Form("#opioionform");
  	//拟入职人员信息主键
  	var intendid = '<%=request.getParameter("id") %>';
  	var intendjobtype = '';
  	var intendpositiontype = '';
  	var recruitway = '';
  	var userid='';
  	var empname='';
  	initdate();
  	function initdate(){
  		promptInit({"workItemID": 0,"processDefName": "com.primeton.eos.ame_permanage.ame_entry","activityDefID": "manualActivity"});//流程提示信息
  		//document.getElementById("salesEdit").style.display="none";
  		//初始化拟入职人员信息
       	nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_entry.getProcessEntry.biz.ext",
            data: {intendid:intendid,workItemID:null,processInstID:null},
            type: 'POST',
            cache: false,
   			async:false,
            contentType: 'text/json',
            success: function (o) {
            	if(o.omIntendJoin){
            		form_Intend.setData(o);
            		intendpositiontype = o.omIntendJoin.intendpositiontype;
            		recruitway = o.omIntendJoin.recruitway;
            		document.getElementById("intendname").innerHTML = o.omIntendJoin.intendname == null ?"":o.omIntendJoin.intendname;
            		document.getElementById("birthdate").innerHTML = o.omIntendJoin.birthdate == null ?"":o.omIntendJoin.birthdate;
            		//document.getElementById("education").innerHTML = o.omIntendJoin.education == null ?"":nui.getDictText('DEGREE',o.omIntendJoin.education);
            		document.getElementById("intendpositiontype").innerHTML = o.omIntendJoin.intendpositiontype == null ?"":nui.getDictText('EMP_TYPE',o.omIntendJoin.intendpositiontype);
            		//document.getElementById("worktime").innerHTML = o.omIntendJoin.worktime == null ?"":o.omIntendJoin.worktime;
            		document.getElementById("intendrecempname").innerHTML = o.omIntendJoin.intendrecempname2 == null ?"":o.omIntendJoin.intendrecempname2;
            		document.getElementById("intendjobtype").innerHTML = o.omIntendJoin.intendjobtype == null ?"":nui.getDictText('AME_EMPTYPE2',o.omIntendJoin.intendjobtype);
            		document.getElementById("remark").innerHTML = o.omIntendJoin.remark == null ?"":o.omIntendJoin.remark;
            		document.getElementById("recruitway").innerHTML = o.omIntendJoin.recruitway == null ?"":nui.getDictText('RECRUIT_WAY',o.omIntendJoin.recruitway);
            		//邮件回复人默认伟招聘专员
            		nui.get("recruiterEmail").setValue(o.omIntendJoin.intendrecempname2mail)
            		nui.get("recruiterEmail").setText(o.omIntendJoin.intendrecempname2+'<'+o.omIntendJoin.intendrecempname2mail+'>')
            		
            		userid = o.emp.userid;
            		empname = o.emp.empname;
            		
            		//缺省直属主管默认部门主管
            		nui.get("managerid").setValue(o.omIntendJoin.managerid);
	  				nui.get("managerid").setText(o.omIntendJoin.managername);
	  				//初始化入职导师
	  				nui.get("tutorid").setValue(o.omIntendJoin.tutorid);
	  				nui.get("tutorid").setText(o.omIntendJoin.tutorname);
	  				//初始化业务部门助理
	  				nui.get("assistant").setValue(o.omIntendJoin.assistant);
	  				nui.get("assistant").setText(o.omIntendJoin.assistantName);
            		changeintendworkplace();
            		intendjobtype = o.omIntendJoin.intendjobtype
            		//附件加载
            		nui.get("grid_0").load({"groupid":"omIntendJoin","relationid":intendid});
				  	nui.get("cclist").setValue("hr-all@primeton.com,mis@primeton.com");
				  	nui.get("cclist").setText("人事部全体&lt;hr-all@primeton.com&gt;,信息技术&lt;mis@primeton.com&gt;");
				  	changeorgid(o.omIntendJoin.managerid);
				  	var probation = o.omIntendJoin.probation;
				  	if(!probation){
				  		nui.get("probation").setValue(3);
				  	}
				  	nui.get("laborterm").setValue(3);
				  	//初始化合同签署部门，默认为其所在部门的二级部门（李苏这边不建议给默认值，暂时 注释掉）
				  	nui.get("htorgname1").setValue(o.sybOrg);
				  	
				  	nui.get(laborterm).setValue(o.omIntendJoin.laborterm);
				  	if(o.omIntendJoin.actdate == null || o.omIntendJoin.actdate == ''){
				  		nui.get("actdate").setValue(o.omIntendJoin.interdate);
				  	}
				  	changeactdate();
            	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
		});
  	}
  	//选择新员工入职主管
  	function selectManager(obj) {
        nui.open({
			url:"<%=request.getContextPath() %>/abframe/org/intendstaff/SelectEmployee.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                obj.setValue(data.userid);
		                obj.setText(data.empname);
		                //切换主管时，抄送的主管邮箱也跟着改变
		                changeorgid(data.userid);
					}
				}
			}
		});
	}
  	//选择新员工入职导师
  	function selectTutor(obj) {
        nui.open({
			url:"<%=request.getContextPath() %>/abframe/org/intendstaff/SelectEmployee.jsp",
			title: "选择列表",
			width: 600,
			height: 400,
			ondestroy: function (action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data);    //必须
					if (data) {
		                obj.setValue(data.userid);
		                obj.setText(data.empname);
					}
				}
			}
		});
	}
	
	function changeEntryPlace(e){
  		var value = e.value;
  		if(value=='8'){//报到地址是其他的时候，则让招聘人员手动输入报道地址
  			var table = document.getElementById("placeTr").style.display = "";
  			nui.get("entrypalce2").setRequired(true);
  		}else{
  			var table = document.getElementById("placeTr").style.display = "none";
  			nui.get("entrypalce2").setRequired(false);
  		}
  	}
  	//发起流程还是暂时保存
	var operate;
	function onOk(e){
		var entrypalce1 = nui.get("entrypalce1").getValue();
		if(entrypalce1=='8'){//报道地址其他
			var entrypalce2 = nui.get("entrypalce2").getValue();
			if(!entrypalce2){
				nui.alert("您需要手动填写员工入职报到地址！");
				return false;
			}
		}
		var spr = nui.get("spr").getValue();
		if(spr == '' || spr == null){
			nui.alert("行政审批人不可以为空！");
			return false;
		}
		var filePaths = document.getElementsByName("uploadfile").length;
    	for(var j = 0;j < filePaths;j++){
    		var a = document.getElementsByName("remarkList")[j].value;
    		if(a == null || a == ""){
    			nui.alert("新增附件不可以为空！");
    			return false;
    		}
    	}
    	form_Intend.validate();
    	if(!form_Intend.isValid()){
			nui.alert("信息录入不完整!");
			return false;
		}else{
			var email = nui.get("email").getValue();
			var issendmail = nui.get("issendmail").getValue();
			if(issendmail == '1'){
				nui.confirm("请您再次确认新员工私人邮箱（"+email+"）是否正确？点击确定后将给此邮箱发送新员工入职须知邮件。","操作提示",function(action){
					if(action == "ok"){
						operate = e;
			    		document.getElementById("fileCatalog").value="omIntendJoin";
			    		form2.submit();
					}
				});
			}else{
				form2.submit();
			}
		}
	}
	//检查与入职日期相关的日期
	function checkActdateRelation(){
		var actdate = nui.get("actdate").getValue();//入职日期
		var probationstartdate = nui.get("probationstartdate").getValue();//试用期开始日期
    	var laborstart = nui.get("laborstart").getValue();//劳动合同开始日期
		if(laborstart){
			if(actdate!=laborstart){
				return "“入职日期”与“劳动合同开始日期”不一致，";
			}
		}
		if(probationstartdate){
			if(actdate!=probationstartdate){
				return "“入职日期”与“试用期开始日期”不一致，";
			}
		}
		return '';
	}
	function SaveData(){
		var json = form_Intend.getData();
		//附件ID赋值
		json.omIntendJoin.fileids = nui.get("fileids").getValue();
		//操作-app：发起流程，save：暂时保存
		json.operate = operate;
		var message = "发起";
		if(operate == "save"){
			message = "暂时保存";
		}
		//发起页面的处理信息
		var opioionformData = opioionform.getData();
		json.misOpinion = opioionformData.misOpinion;
		var intendpositiontypename = document.getElementById("intendpositiontype").innerHTML;
		json.omIntendJoin.intendpositiontypename  = intendpositiontypename;
		var guanZhu = nui.get("guanZhuButton").getValue();//是否关注
		json.omIntendJoin.guanZhu = guanZhu;//是否关注
		json.omIntendJoin.spr = nui.get("spr").getValue();//行政审批人
		json.omIntendJoin.sendmail = nui.get("cclist").getValue();//发送邮件
		json.omIntendJoin.intendrecempnamename = document.getElementById("intendrecempname").innerHTML;
		json.omIntendJoin.intendname = document.getElementById("intendname").innerHTML;
		var probation = nui.get("probation").getValue();//试用期期限
		if(probation=='0'){//如果使用期期限为0,则不走试用期目标设定以及目标确认环节
			json.omIntendJoin.isNeedProbation ='1';//不走试用期目标确认以及目标确认环节
		}
		var htorgname1 = nui.get("htorgname1").getText();
		if(htorgname1.indexOf('-')!=-1){
			htorgname1 = htorgname1.split('-')[1];
		}
		var htorgname =  htorgname1+","+nui.get("htorgname1").getValue();
		json.omIntendJoin.htorgname =htorgname;//合同签署部门
		var entrypalce1 = nui.get("entrypalce1").getValue();//数据字典配置的
		var entrypalce2 = nui.get("entrypalce2").getValue();//手动输入员工入职报到地址
		if(entrypalce1=='8'){//报到地址其他
			json.omIntendJoin.entrypalce =entrypalce2;//入职员工报到地址
		}else{//业务字典配置
			json.omIntendJoin.entrypalce = nui.getDictText('ENTRY_PLACE',entrypalce1);
		}
		
		var worktime=json.omIntendJoin.worktime;
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
    			json.omIntendJoin.worktime = newyear +  newmonth;
			}
		}
		
		var tip =  checkActdateRelation();
		nui.confirm(tip+"您确定要"+message+"新员工入职流程吗？","操作提示",function (action){
			if(action == "ok"){
				form_Intend.loading("处理中,请稍后...");
				nui.get("appButton").setEnabled(false);
	    		nui.ajax({
	    			url:"com.primeton.eos.ame_permanage.ame_entry.EntryProcessCreate.biz.ext",
	    			data: json,
	    			type:"post",
	    			contentType:"text/json",
	    			success:function(action){
	    				action = nui.clone(action);
	    				form_Intend.unmask();
	    				if(action.exception == null){
	    					nui.alert(message+"新员工入职流程成功！","系统提示",function(){
				        		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
				        	});
	    				}else{
	    					nui.alert("流程提交失败！","系统提示",function (){
	    					});
	    				}
	    				nui.get("appButton").setEnabled(true);
	    			},
	    			error:function(jqXHR, textStatus, errorThrown){
	    				nui.alert("error:" + jqXHR.responseText);
	    				nui.get("appButton").setEnabled(true);
	    			}
	    		});
			}
		});
	}
	
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
	
	//检查手机号
	function checkmobileno(){
		 var myreg =  new RegExp(nui.getDictText('SMS_CONFIG',"PHONE_REG"),'i');
		 var mobileno = nui.get("mobileno").getValue();
		 if (!myreg.test(mobileno)) {
		 	nui.alert("请输入正确的手机号码");
            nui.get("mobileno").setValue('');
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
	
	//根据工作地点查找行政
	function changeintendworkplace(){
		var intendworkplace = nui.get("intendworkplace").getValue();
		var json = ({"eocDictEntry":{"eosDictType":{"dicttypeid":"EXP_REGIONPERSON"},"dictid":intendworkplace}});
		nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_entry.getAdminperson.biz.ext",
			type: 'POST',
			data: json,	
            async:false,
			contentType: 'text/json',
            success: function (o) {
            	if(o.userids != null && o.userids != ''){
	                nui.get("spr").setValue(o.userids);
	                nui.get("spr").setText(o.empnames);
                }else{
		             nui.get("spr").setValue(null);
	                 nui.get("spr").setText(null);
                }
            }
        });

	}
	
	//hr邮件组不能删除
    function changecc(e){
    	if(e.value.indexOf("hr-all@primeton.com")==-1){
    		nui.alert("人事部全体邮件组邮箱不能删除！");
    		if(e.value){
	    		nui.get("cclist").setValue("hr-all@primeton.com,"+e.value);
	    		nui.get("cclist").setText("人事部全体&lt;hr-all@primeton.com&gt;,"+nui.get("cclist").getText());
	    		e.value = "hr-all@primeton.com,"+e.value;
    		}else{
    			nui.get("cclist").setValue("hr-all@primeton.com");
	    		nui.get("cclist").setText("人事部全体&lt;hr-all@primeton.com&gt;");
	    		e.value = "hr-all@primeton.com";
    		}
    	}
    	if(e.value.indexOf("mis@primeton.com")==-1){
    		nui.alert("信息技术部门邮箱不能删除！");
    		if(e.value){
	    		nui.get("cclist").setValue("mis@primeton.com,"+e.value);
	    		nui.get("cclist").setText("信息技术&lt;mis@primeton.com&gt;,"+nui.get("cclist").getText());
    		}else{
    			nui.get("cclist").setValue("mis@primeton.com");
	    		nui.get("cclist").setText("信息技术&lt;mis@primeton.com&gt;");
    		}
    	}
    }
    
    //检查拟入职人员所属部门是否为叶子部门；判断规则：普通员工入职部门必须是叶子节点，销售的入职部门必须为：机构等级为事业部部门，机构类型：销售部门
	function checkorgisleaf(){//AME_EMPTYPE2
		var orgid = nui.get("orgid").getValue();
		if(orgid != null && orgid != ''){
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
    //取部门主管邮箱
    function changeorgid(value){
    	//不能根据所属部门查询主管，因为主管是可选择的
    	//var orgid = nui.get("orgid").getValue();
    	if(!!value){
    		var json = ({"managerid":value});
    		nui.ajax({
            url: "com.primeton.eos.ame_permanage.ame_entry.getOrgmanager.biz.ext",
			type: 'POST',
			data: json,	
            async:false,
			contentType: 'text/json',
            success: function (o) {
            	//重新选择了主管,重新初始化邮箱
           		nui.get("cclist").setValue("hr-all@primeton.com,mis@primeton.com");
				nui.get("cclist").setText("人事部全体&lt;hr-all@primeton.com&gt;,信息技术&lt;mis@primeton.com&gt;");
            	var cclist = nui.get("cclist").getValue();
            	var cclistname = nui.get("cclist").getText();
            	if(o.omemployee.oemail != null && o.omemployee.oemail != ''){
            		nui.get("cclist").setValue(cclist);
	                nui.get("cclist").setValue(cclist+","+o.omemployee.oemail);
		    		nui.get("cclist").setText(cclistname+","+o.omemployee.empname+"&lt;"+o.omemployee.oemail+"&gt;");
                }
            }
        });
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
    
    //检查是否为数字
	function validate(e){  
	     var reg = new RegExp("^[0-9]*[0-9][0-9]*$");  
	     var obj = nui.get(e).getValue();
	     if(!reg.test(obj)){  
	     	nui.alert("输入格式不正确，请输入整数！");
	     	nui.get(e).setValue("");    
	     }  
     }
     
     //自动计算试用期结束日期
	function getDateNexThirdMonth(start,term,end){
		var veristart = nui.get(start).getValue();
		var veritime = nui.get(term).getValue();
		if(veritime == null || veritime == ''){
			veritime = 3;
		}
		if(term == "laborterm"){
			veritime = veritime * 12;
		}
		if(veristart != null && veristart != ''){
        	if(term == "laborterm"){//合同
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
	function setPositionName(e){
		//var recposition = e.value;
		var position = nui.get("position").getText();
		nui.get("positionname").setValue(position);
	}
	
	function changeissendmail(){
		var issendmail = nui.get("issendmail").getValue();
		if(issendmail == '1'){
			document.getElementById("backman").style.display="";
		}else{
			document.getElementById("backman").style.display="none";
		}
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
	
	function watchisTrainee(){
		var isTrainee = nui.get("isTrainee").getValue();
		if(isTrainee == '1'){
			if(intendpositiontype != '1'){
				nui.alert("实习员工转正，员工属性必须为正式员工！","提示");
				nui.get("isTrainee").setValue('0');
				document.getElementById("field5").style.display = "none";
	  			nui.get("userid").setRequired(false);
	  			nui.get("worktime").setRequired(false);
	  			nui.get("userid").setValue(null);
			}else if(recruitway != '8'){
				nui.alert("实习员工转正，招聘渠道性必须为实习生转入！","提示");
				nui.get("isTrainee").setValue('0');
				document.getElementById("field5").style.display = "none";
	  			nui.get("userid").setRequired(false);
	  			nui.get("worktime").setRequired(false);
	  			nui.get("userid").setValue(null);
			}else{
		  		document.getElementById("field5").style.display = "";
		  		nui.get("userid").setRequired(true);
	  			nui.get("worktime").setRequired(true);
		  		if(empname != null && empname != ''){
		  			nui.get("userid").setValue(o.emp.userid);
		  			nui.get("userid").setText(o.emp.empname);
		  		}
			}
	  	}else{
			document.getElementById("field5").style.display = "none";
  			nui.get("userid").setRequired(false);
  			nui.get("worktime").setRequired(false);
  			nui.get("userid").setValue(null);
	  	}
	}
</script>
</html>