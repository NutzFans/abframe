<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): WangTong
  - Date: 2019-12-04 14:37:08
  - Description:
-->
<head>
<title>面试人员详细信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
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
	  <div class="nui-panel" title="面试人员详细信息" style="width: 100%;">
		<div id="form1" >
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>招聘需求</legend>
			 	<input name="omRecruit.recruitid" id="recruitid" class="nui-hidden"/>
				<div style="padding:5px;">
					<table style="width:100%;">
						<tr>
							<td align="right" style="width:120px;">需求编号：</td>
		                	<td style="width:150px;" id="omRecruit.recruitno" class = "asLabel"></td>
							<td align="right"style="width: 110px;">招聘部门：</td>
							<td align="left" style="width: 150px;" id="omRecruit.orgid" class = "asLabel"></td>
		                	<td align="right"style="width: 120px;">招聘职位分类：</td>
							<td align="left" style="width: 150px;" id="omRecruit.recposition" class = "asLabel"></td>
							<td align="right"style="width: 120px;">招聘职位名称：</td>
							<td align="left" style="width: 150px;" id="omRecruit.recpositionname" class = "asLabel"></td>
		                	
						</tr>
						<tr>
							<td align="right"style="width: 120px;">优先级别：</td>
							<td align="left" style="width: 150px;" id="omRecruit.priority" class = "asLabel"></td>
							<td align="right">主考官：</td>
							<td align="left" style="width: 150px;" id="omRecruit.interviewer" class = "asLabel"></td>
		                	<td align="right"style="width: 120px;">人员性质：</td>
							<td align="left" style="width: 150px;" id="omRecruit.jobtype" class = "asLabel"></td>
							<td align="right" style="width:100px;">员工属性：</td>
		                	<td style="width:150px;" id="omRecruit.position" class = "asLabel"></td>
						</tr>
						<tr>
							<td align="right">招聘数量：</td>
							<td align="left" style="width: 150px;" id="omRecruit.recnum" class = "asLabel"></td>
							<td align="right" style="width:100px;">工作地点：</td>
		                	<td style="width:150px;" id="omRecruit.workplace" class = "asLabel"></td>
							<td align="right">期望入职时间：</td>
							<td align="left" style="width: 150px;" id="omRecruit.hopedate" class = "asLabel"></td>
							<td align="right">提出时间：</td>
							<td align="left" style="width: 150px;" id="omRecruit.propdate" class = "asLabel"></td>
						</tr>
						<tr >
							<td align="right"style="width: 100px;">招聘状态：</td>
							<td align="left" style="width: 150px;" id="omRecruit.status" class = "asLabel"></td>
							<td align="right">是否采用猎头：</td>
							<td align="left" style="width: 150px;" id="omRecruit.isheadhunting" class = "asLabel"></td>
							<td align="right">确认时间：</td>
							<td align="left" style="width: 150px;" id="omRecruit.confirmdate" class = "asLabel"></td>
							<td align="right">招聘专员：</td>
							<td align="left" style="width: 150px;" id="omRecruit.recuserid" class = "asLabel"></td>
						</tr>
						<tr>
							<td align="right">申请人：</td>
							<td align="left" style="width: 150px;" id="omRecruit.applyuserid" class = "asLabel"></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">工作职责描述：</td>
		                	<td style="width:150px;" colspan="7" id="omRecruit.workduties" class = "asLabel"></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">招聘要求描述：</td>
		                	<td style="width:150px;" colspan="7" id="omRecruit.recdesc" class = "asLabel"></td>
						</tr>
						<tr>
		                	<td align="right" style="width:100px;">需求背景：</td>
		                	<td style="width:601px;" colspan="7" id="omRecruit.recbackground" class = "asLabel"></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">备注：</td>
		                	<td style="width:601px;" colspan="7" id="omRecruit.remark" class = "asLabel"></td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>面试人员基本信息</legend>
			<div style="width: 100%;padding: 5px;">
				<table style="width: 98.2%;">
					<tr>
						<td align="right" style="width:130px;">姓名:</td>
	            		<td name="detail.empname" id="empname" style="width:170px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="font-size:12px;width:130px;">性别:</td>
	            		<td name="detail.gender" id="gender" style="width:170px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:130px;">出生日期:</td>
	            		<td name="detail.birthdate" id="birthdate" style="width:170px;" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">婚姻状况:</td>
	            		<td name="detail.marristatus" id="marristatus" style="width:120px;" class = "asLabel"></td>
					</tr>
					<tr>
	            		
	            		<td align="right" style="width:80px;">求职状态:</td>
	            		<td name="detail.applystatus" id="applystatus" style="width:120px;" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">发布城市:</td>
	            		<td name="detail.announcecity" id="announcecity" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">应聘职位:</td>
	            		<td name="detail.applyoccupation" id="applyoccupation" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">应聘日期:</td>
	            		<td name="detail.applydate" id="applydate" style="width:120px;" class = "asLabel"></td>
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">目前居住地:</td>
	            		<td name="detail.currentadress" id="currentadress" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">户口所在地:</td>
	            		<td name="detail.haddress" id="haddress" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">工作年月:</td>
	            		<td name="detail.workdate" id="workdate" style="width:120px;" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">工作年限:</td>
	            		<td name="detail.workingyear" id="workingyear" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
						
	            		</tr>
					<tr>
	            		<td align="right" style="width:80px;">学历:</td>
	            		<td name="detail.education" id="education" style="width:120px;" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">毕业学校:</td>
	            		<td name="detail.school" id="school" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">专业:</td>
	            		<td name="detail.specialty" id="specialty" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">毕业时间:</td>
	            		<td name="detail.highestoutdate" id="highestoutdate" style="width:120px;" class = "asLabel"></td>
						
					</tr>
					<tr>
	            		<td align="right" style="width:80px;">联系电话:</td>
	            		<td name="detail.tel" id="tel" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">私人邮箱:</td>
	            		<td name="detail.selfemail" id="selfemail" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">联系地址:</td>
	            		<td name="detail.mailaddress" id="mailaddress" style="width:120px;" align="left" class = "asLabel"></td>
						<td align="right" style="width:80px;">邮编:</td>
	            		<td name="detail.postcode" id="postcode" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">最近一家公司:</td>
	            		<td name="detail.currentcompany" id="currentcompany" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">最近一个职位:</td>
	            		<td name="detail.currentoccupation" id="currentoccupation" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">目前薪资:</td>
	            		<td name="detail.currentincome" id="currentincome" style="width:120px;" align="left" class = "asLabel"></td>
	            		<td align="right" style="width:80px;">期望薪资:</td>
	            		<td name="detail.expectincome" id="expectincome" style="width:120px;" align="left" class = "asLabel"></td>
					
					</tr>
					<tr>
						<td align="right" style="width:80px;">技术级别:</td>
	            		<td name="detail.technology" id="technology" style="width:120px;" align="left" class = "asLabel"></td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">备注:</td>
	            		<td style="width:120px;" align="left"  colspan="7"  class = "asLabel" id="remark"></td>
					</tr>
					
				</table>
			</div>
		</fieldset>
		<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
			<legend>简历附件</legend>
			<jsp:include page="/ame_common/detailAndDelFile.jsp"/>
		</fieldset>
		
		<fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>面试轮次信息</legend>
			<div id="interviews" class="nui-datagrid" style="width:100%;height:auto;" dataField="resumInterviews" showPager="false" onrowclick="rowclick"
				allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true" url="com.primeton.eos.ame_permanage.ame_resum.getInterview.biz.ext" 
				allowSortColumn="true" allowCellWrap="false" >
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
					<div field="interviewer" displayField="empname"width="45" headerAlign="center" align="center" >面试人
						<input property="editor" class="nui-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext">
					</div>
					<div field="positionname" width="45" headerAlign="center"  align="center" allowSort="true" renderer="getinterviewer_role">面试官角色
						<input property="editor" class="nui-dictcombobox" shownullItem="true"  dictTypeId="INTERVIEWER_ROLE" />
					</div>
					<div field="applyoccupation" width="0" headerAlign="center" align="center">面试岗位
						<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
					</div>
					<div field="memo" width="0" headerAlign="center" align="left">面试提醒
						<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
					</div>
					<div field="linkman" displayField="linkmanname"width="45" headerAlign="center" align="center" >联系人
						<input property="editor" class="nui-textboxlist" allowInput="true" textField="EMPNAME" valueField="USERID" searchField="name" url="com.primeton.eos.ame_common.ame_common.queryAllEmpByName.biz.ext">
					</div>
					<div field="linktel" width="40" headerAlign="center" align="center">联系人电话
						<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
					</div>
					<div field="venue" width="70" headerAlign="center" align="left">面试地点
						<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
					</div>
					<div field="feedbackstatus" width="45" headerAlign="center" align="center" renderer="getfeedbackstatus">反馈意见</div>
					<div field="feedback" width="70" headerAlign="center" align="left">反馈评价</div>
					<div field="orientation" width="0" headerAlign="center" align="left">意向薪资待遇说明</div>
				</div>
			</div>
		</fieldset>
		
		<!-- <fieldset style="border: solid 1px #aaa; padding: 3px;">
			<legend>面试评价表</legend>
			<table  id="mytable" style="table-layout:fixed;border-collapse:collapse;" bordercolor="#A8A8A8" border="1" cellspacing="0" cellpadding="1">
					
			</table>
		</fieldset> -->
		
		
		
		<div id="body_tab" class="nui-tabs" activeIndex="0" style="width: 100%;height:100%;padding: 0">
			<div title="面试评价信息">
				<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;width:99%;">
					<legend>面试评价信息</legend>
					<iframe id="appraise" src="" frameborder="0" scrolling="no" height="700px" width="100%" style="text-align: center;"></iframe>
				</fieldset>
			</div>
			<div title="HR面试核查信息">
				<fieldset id="field7" style="border:solid 1px #aaa;padding:3px;width:99%;">
					<legend>HR面试核查信息</legend>
					<jsp:include page="/ame_common/csIncomecheck/showIncomeCheck.jsp"/>	
				</fieldset>
			</div>
		</div>
		
		<jsp:include page="/ame_common/misOpinion.jsp"/>
	</div>
  </div>
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onCancel('cancel')" id="closeResume" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
</div> 
</body>
<script type="text/javascript">
	nui.parse();
	var processInstID = <%=request.getParameter("processInstID")%>;
    var form = new nui.Form("form1");
 
 	//createTable();
    SetData();
    function SetData(){
            var json = {"processInstID":processInstID};
            nui.ajax({
      		url: "org.gocom.abframe.org.interviewQuery.querydata.biz.ext",
	      	type: 'POST',
          	data: json,
      		success: function (o){
      		    o = nui.decode(o);
      		    //面试评价
      		    var path = nui.getDictText('AME_SYSCONF','AMEPATH')+"reportJsp/showReport4Proj.jsp?rpx=/queryAppraise.rpx&recruitid="+o.detail.recruitidtrue+"&resumeid="+o.detail.resumeid;
           		$("#appraise").attr('src',path); 
       	  		//需求信息
       	  		form.setData(o);
       	  		document.getElementById("omRecruit.recruitno").innerHTML = o.detail.recruitno == null ?"":o.detail.recruitno;
	            document.getElementById("omRecruit.orgid").innerHTML = o.detail.orgnamexuqiu == null ?"":o.detail.orgnamexuqiu;
	            document.getElementById("omRecruit.recposition").innerHTML = o.detail.recposition == null ?"":o.detail.recposition;
	            document.getElementById("omRecruit.recpositionname").innerHTML = o.detail.recpositionname == null ?"":o.detail.recpositionname;
	            document.getElementById("omRecruit.jobtype").innerHTML = o.detail.jobtype == null ?"":nui.getDictText('AME_EMPTYPE2',o.detail.jobtype);
	            document.getElementById("omRecruit.position").innerHTML = o.detail.position == null ?"":nui.getDictText('EMP_TYPE',o.detail.position);
	            document.getElementById("omRecruit.priority").innerHTML = o.detail.priority == null ?"":nui.getDictText('MIS_EMERLEVEL',o.detail.priority);
	            document.getElementById("omRecruit.interviewer").innerHTML = o.detail.intername == null ?"":o.detail.intername;
	            document.getElementById("omRecruit.applyuserid").innerHTML = o.detail.applyname == null ?"":o.detail.applyname;
	            document.getElementById("omRecruit.workduties").innerHTML = o.detail.workduties == null ?"":o.detail.workduties;
	            document.getElementById("omRecruit.recdesc").innerHTML = o.detail.recdesc == null ?"":o.detail.recdesc;
	            document.getElementById("omRecruit.workplace").innerHTML = o.detail.workplace == null ?"":nui.getDictText('AREA4CLRY',o.detail.workplace);
	            document.getElementById("omRecruit.recnum").innerHTML = o.detail.recnum == null ?"":o.detail.recnum;
	            document.getElementById("omRecruit.isheadhunting").innerHTML = o.detail.isheadhunting == null ?"":nui.getDictText('MIS_YN',o.detail.isheadhunting);
	            document.getElementById("omRecruit.propdate").innerHTML = o.detail.propdate == null ?"":o.detail.propdate;
	            document.getElementById("omRecruit.status").innerHTML = o.detail.status == null ?"":nui.getDictText('RECRUIT_STATUS',o.detail.status);
	            document.getElementById("omRecruit.hopedate").innerHTML = o.detail.hopedate == null ?"":o.detail.hopedate;
	            document.getElementById("omRecruit.confirmdate").innerHTML = o.detail.confirmdate == null ?"":o.detail.confirmdate;
	            document.getElementById("omRecruit.recuserid").innerHTML = o.detail.recusername == null ?"":o.detail.recusername;
	            document.getElementById("omRecruit.recbackground").innerHTML = o.detail.recbackground == null ?"":o.detail.recbackground;
	            document.getElementById("omRecruit.remark").innerHTML = o.detail.remark1 == null ?"":o.detail.remark1;
                //简历信息
        		document.getElementById("empname").innerHTML = o.detail.empname == null ? "" : o.detail.empname;
				document.getElementById("gender").innerHTML = o.detail.gender == null ? "" : nui.getDictText('ABF_GENDER',o.detail.gender);
				document.getElementById("birthdate").innerHTML = o.detail.birthdate == null ? "" : o.detail.birthdate;
				document.getElementById("marristatus").innerHTML = o.detail.marristatus == null ? "" : nui.getDictText('ABF_MARRITYPE',o.detail.marristatus);
				document.getElementById("applystatus").innerHTML = o.detail.applystatus == null ? "" : nui.getDictText('AME_APPLYSTATUS',o.detail.applystatus);
				document.getElementById("announcecity").innerHTML = o.detail.announcecity == null ? "" : o.detail.announcecity;
				document.getElementById("applyoccupation").innerHTML = o.detail.applyoccupation == null ? "" : o.detail.applyoccupation;
				document.getElementById("applydate").innerHTML = o.detail.applydate == null ? "" : o.detail.applydate;
				document.getElementById("haddress").innerHTML = o.detail.haddress == null ? "" : o.detail.haddress;
				document.getElementById("workdate").innerHTML = o.detail.workdate == null ? "" : o.detail.workdate;
				document.getElementById("workingyear").innerHTML = (o.detail.workingyear1 == null ? "" : o.detail.workingyear1)+'年';
				document.getElementById("education").innerHTML = o.detail.education == null ? "" : nui.getDictText('DEGREE',o.detail.education);
				document.getElementById("school").innerHTML = o.detail.school == null ? "" : o.detail.school;
				document.getElementById("specialty").innerHTML = o.detail.specialty == null ? "" : o.detail.specialty;
				document.getElementById("highestoutdate").innerHTML = o.detail.highestoutdate == null ? "" : o.detail.highestoutdate;
				document.getElementById("tel").innerHTML = o.detail.tel == null ? "" : o.detail.tel;
				document.getElementById("selfemail").innerHTML = o.detail.selfemail == null ? "" : o.detail.selfemail;
				document.getElementById("mailaddress").innerHTML = o.detail.mailaddress == null ? "" : o.detail.mailaddress;
				document.getElementById("postcode").innerHTML = o.detail.postcode == null ? "" : o.detail.postcode;
				document.getElementById("currentcompany").innerHTML = o.detail.currentcompany == null ? "" : o.detail.currentcompany;
				document.getElementById("currentoccupation").innerHTML = o.detail.currentoccupation == null ? "" : o.detail.currentoccupation;
				document.getElementById("currentincome").innerHTML = (o.detail.currentincome == null ? "" : o.detail.currentincome)+'千元（k）';
				document.getElementById("expectincome").innerHTML = (o.detail.expectincome == null ? "" : o.detail.expectincome)+'千元（k）';
				document.getElementById("technology").innerHTML = o.detail.technology == null ? "" : nui.getDictText('AME_TECH',o.detail.technology);
				document.getElementById("currentadress").innerHTML = (o.detail.currentadress == null ? "" : o.detail.currentadress);
				document.getElementById("remark").innerHTML = o.detail.remark == null ?"":o.detail.remark;
				
				//加载面试轮次信息
			    var grid_interview = nui.get('interviews');
			    grid_interview.load({"criteria": {"_expr[0]": { "ameResume.resumeid": o.detail.resumeid},"_expr[1]": { "omRecruit.recruitid": o.detail.recruitid}}});
				grid_interview.sortBy("interviewroundes", "asc");
				
				//简历附件信息
        		nui.get("grid_0").load({"groupid":"AmeResumefile","relationid":o.detail.resumeid});
				
				//hr面试核查要点信息
       			showIncomeCheck(processInstID);
		  				
          	},
	      	error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
    	if(processInstID != null && processInstID != ''){
    		document.getElementById("closeResume").style.display="none"	
    	}
    	
    	
		//查询审核意见
		$("#opinionHide").hide();
		var grid = nui.get("datagrid1");
		grid.sortBy("time", "desc");
		grid.load({processInstID:processInstID});
		
		
    }
    
    //创建面试评价表
   <%-- function createTable () {
    	//查询面试模板
        var json = {"processInstID":processInstID};
        nui.ajax({
	  		url: "org.gocom.abframe.org.interviewQuery.queryInterviewTemplete.biz.ext",
	      	type: 'POST',
	      	data: json,
	  		success: function (o){
	  			var myTable = document.getElementById("mytable");
	  			var rownum = o.templetes.length;
	  			var colnum = o.temps.length;
	  			if (rownum==0 || colnum==0) {
	  				myTable.hide();
	  			}
	    		for (var i=0; i<=rownum + 1; i++) {
		    		myTable.insertRow(i);
		    		for (var j=0; j<=colnum; j++) {
		    		if (j==0) {
		    			if (i == 0) {
		    				myTable.rows[i].insertCell(j).innerHTML='';
		    				myTable.rows[i].cells[j].style.width='150px';
		    				myTable.rows[i].cells[j].style.height='30px';
		    			} else if ( i == 1 ) {
		    				myTable.rows[i].insertCell(j).innerHTML="面试时间";
		    				myTable.rows[i].cells[j].id="interviewdate";
		    				myTable.rows[i].cells[j].style.width='150px';
		    				myTable.rows[i].cells[j].style.height='30px';
		    			} else if ( i == rownum + 1 ) {
		    				myTable.rows[i].insertCell(j).innerHTML="综合评价";
		    				myTable.rows[i].cells[j].id="overallmerit";
		    				myTable.rows[i].cells[j].style.width='150px';
		    				myTable.rows[i].cells[j].style.height='30px';
		    			}else {
		    				myTable.rows[i].insertCell(j).innerHTML=nui.getDictText('AME_EVALUATION_SUB',o.templetes[i-2].evaluationsubtype);
		    				myTable.rows[i].cells[j].style.width='150px';
		    				myTable.rows[i].cells[j].style.height='30px';
		    			}
		    		} else {
		    			if (i==0) {
		    				myTable.rows[i].insertCell(j).innerHTML=o.temps[j-1].empname;
		    				myTable.rows[i].cells[j].id = o.temps[j-1].appraiseid;
		    				myTable.rows[i].cells[j].style.width='100px';
		    				myTable.rows[i].cells[j].style.height='30px';
		    			} else {
		    				myTable.rows[i].insertCell(j).innerHTML='';
		    				myTable.rows[i].cells[j].style.width='100px';
		    				myTable.rows[i].cells[j].style.height='30px';
		    			}
		    			
		    		}
	    		}
    			}
    		
    		//填充分数
    		 alert(myTable.rows[0].cells[1].id);
    		 for (var k=0; k<o.scores.length; k++) {
    		 	 for (var i=1; i<=rownum; i++) {
	    		 	for (var j=1; j<=colnum; j++) {
	    		 		if (o.scores[k].appraiseid == myTable.rows[0].cells[j].id && nui.getDictText('AME_EVALUATION_SUB',o.scores[k].evaluationsubtype) == myTable.rows[i].cells[0].innerHTML) {
	    		 			myTable.rows[i].cells[j].innerHTML = o.scores[k].grade;
	    		 		}
	    		 	}
    			 }
    		 
    		 }
    		//填充面试时间
    		 for (var k=0; k<o.scores.length; k++) {
    		 	for (var j=1; j<=colnum; j++) {
    		 		if (o.scores[k].appraiseid == myTable.rows[0].cells[j].id ) {
    		 			myTable.rows[1].cells[j].innerHTML = o.scores[k].interviewdate;
    		 		}
    		 	
			    }
    		 }
    		 
    		 //填充综合评价
    		 for (var k=0; k<o.scores.length; k++) {
    		 	for (var j=1; j<=colnum; j++) {
    		 		if (o.scores[k].appraiseid == myTable.rows[0].cells[j].id ) {
    		 			myTable.rows[rownum+1].cells[j].innerHTML = o.scores[k].overallmerit;
    		 		}
    		 	
			    }
    		 }
	  		
	  		},
	  		error: function (jqXHR, textStatus, errorThrown) {
	        	alert(jqXHR.responseText);
	      	}
    	});
    
    	
    }--%>
    
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
    
    //业务字典
  	function ongender(e){
		return nui.getDictText('ABF_GENDER',e.value);//设置业务字典值
	}
	function onDegreeRenderer(e){
		return nui.getDictText('DEGREE',e.value);//设置业务字典值
	}
	function ongenderApplyStatus(e){
		return nui.getDictText('AME_APPLYSTATUS',e.value);//设置业务字典值
	}
	function getinterviewer_role(e){
		return nui.getDictText('INTERVIEWER_ROLE',e.value);//设置业务字典值
	}
	function getinterviewstatus(e){
		return nui.getDictText('INTERVIEW_STATUS',e.value);//设置业务字典值
	}
	function getfeedbackstatus(e){
		return nui.getDictText('AME_FEEDBACK_STATUS',e.value);//设置业务字典值
	}
    
</script>
</html>