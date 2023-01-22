<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2019-05-15 14:42:03
  - Description:
-->
<head>
<title>招聘需求详情</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;    
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<div id="form1" >
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>招聘需求维护</legend>
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
						<tr>
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
		</div>
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>(拟)入职人员信息</legend>
			<div id="grid_Intend" showPager="false" dataField="omIntendJoins" class="nui-datagrid" url="org.gocom.abframe.org.recruit.queryIntendJoin.biz.ext">
	                <div property="columns">
	                    <div field="intendname" width="80" align="center" headerAlign="center">姓名</div>
	                    <div field="inorgname" width="130" align="center"headerAlign="center" >入职部门</div>
	                    <div field="gender" width="60" align="center" headerAlign="center" renderer="getGender">性别</div>
	                    <div field="education" width="100" align="center" headerAlign="center" renderer="getEducation">学历</div>
	                    <div field="intendjobtype" width="80" align="center" headerAlign="center" renderer="getJobType">岗位类型</div>
	                    <div field="intendpositiontype" width="80" align="center" headerAlign="center" renderer="getPosition">入职人员性质</div>
	                    <div field="intendstatus" width="80" align="center" headerAlign="center" renderer="getIntendStatus">入职状态</div>
	                    <div field="interdate" width="80" align="center" headerAlign="center" >拟入职日期</div>
	                    <div field="actdate" width="80" align="center" headerAlign="center" >实际入职日期</div>
	                </div>
	            </div>
		</fieldset>
		
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<div style="width:100%;height:100%;padding:0px;margin:0px;" id="interviews_form2">
				<div style="width:100%;">
			        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			            <table style="width:100%;">
			            	<tr>
			                    <td style="width:20%;">
			                       	面试人员列表查询
			                    </td>
			                </tr>
		                 </table>           
			        </div>
			    </div>
			    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
							<td align="right" width="120px"><span>面试状态：</span></td>
			            	<td align="left" nowrap="nowrap">
			            		<input class="nui-dictcombobox" name="criteria._expr[0]._value" dictTypeId="INTERVIEW_RECOMMEND_STATUS" multiSelect="true" style="width: 200px;"/>
			            		<input class="nui-hidden" name="criteria._expr[0]._property" value="candidatestatus"/>
			            		<input class="nui-hidden" name="criteria._expr[0]._op" value="in"/>
							</td>
							<td align="right" width="120px"><span>人员姓名：</span></td>
			            	<td align="left" nowrap="nowrap">
			            		<input class="nui-textbox" name="criteria._expr[1]._value" style="width:200px"/>
						        <input class="nui-hidden" name="criteria._expr[1]._property" value="empname"/>
						        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
							</td>
							<td align="right" width="120px"><span>学历：</span></td>
			            	<td align="left" nowrap="nowrap">
			            		<input class="nui-dictcombobox" name="criteria._expr[2]._value" dictTypeId="DEGREE" multiSelect="true" style="width: 100px;"/>
			            		<input class="nui-hidden" name="criteria._expr[2]._property" value="education"/>
			            		<input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
			            		
			            		<input class="nui-hidden" name="criteria._expr[3]._property" value="recruitid"/>
			            		<input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
			            		<input class="nui-hidden" name="criteria._expr[3]._value" value="<%=request.getParameter("recruitid")%>"/>
							</td>
		                	<td align="center"  id="toolbars1">
		                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
		                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
		                        <a class="nui-button" onclick="exportinterviews" iconCls="icon-download"  id="exportButton">导出</a>
		                        <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
									<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
									<input type="hidden" name="downloadFile" filter="false"/>
									<input type="hidden" name="fileName" filter="false"/>
								</form>	
		                   </td>
						</tr>
					</table>
				</div>
			</div>
		    <legend>面试人员列表</legend>
	        <div id="interviews" class="nui-datagrid" showPager="true"allowResize="true" pageSize="20"  sizeList="[10,20,50,100,200,500]"  dataField="recruitidInterviews"
			    url="com.primeton.eos.ame_permanage.ame_resum.getRecruitInterviews.biz.ext" >
	    		<div property="columns">
					<div field="empname" headerAlign="center" align="center"  allowSort="true" width="40" renderer="getDetail">姓名</div>
					<div field="interviewdtae" width="70" headerAlign="center" align="center" allowSort="true" renderer="dealdate">第一次面试时间</div>
					<div field="candidatestatus" width="60" headerAlign="center"  align="center" allowSort="true" renderer="getinterviewstatus">面试状态</div>
					<!-- <div field="applyoccupation" headerAlign="center" align="center" width="0">应聘职位</div> -->
					<div field="gender" headerAlign="center" align="center"width="35" renderer="ongender" allowSort="true">性别</div>
					<div field="workdate" headerAlign="center" align="center"  width="70" allowSort="true">参加工作年月</div>
					<div field="education" headerAlign="center" align="center" width="40" renderer="onDegreeRenderer" allowSort="true">学历</div>
					<div field="school" headerAlign="center" align="left" width="90" allowSort="true">毕业学校</div>
					<div field="specialty" headerAlign="center" align="left" width="75" allowSort="true">专业</div>
					<div field="tel" headerAlign="center" align="left" width="80" allowSort="true">联系电话</div>
					<div field="selfemail" headerAlign="center" align="left" width="100" allowSort="true">电子邮件</div>
					<div field="expectincome" headerAlign="center" align="left" width="120" allowSort="true">期望薪资</div>
					<!-- <div field="applystatus" headerAlign="center" align="center"width="50" renderer="ongenderApplyStatus" allowSort="true">求职状态</div>
					<div field="interviewstatus" headerAlign="center" align="center"width="50" renderer="ongenderinterviewStatus" allowSort="true">简历状态</div> -->
				</div>
		  </div>	
	    </fieldset>
		<div id="body_tab" class="nui-tabs" activeIndex="0" style="width: 100%;height:100%;padding: 0">
			<div title="面试评价信息">
			    <fieldset id="field6" style="border:solid 1px #aaa;padding:3px;width:99%;">
					<legend>面试评价信息</legend>
					<iframe id="appraise" src="" frameborder="0" scrolling="no" height="600px" width="100%" style="text-align: center;"></iframe>
				</fieldset>
			</div>
			<div title="面试状态统计图">
				<fieldset id="field7" style="border:solid 1px #aaa;padding:3px;width:99%;">
					<legend>面试状态统计图</legend>
					<iframe id="interviewchat" src="" frameborder="0" scrolling="no" height="600px" width="100%" style="text-align: center;"></iframe>
				</fieldset>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");
	var grid_Intend = nui.get("grid_Intend");
	var grid_interview = nui.get("interviews");
	var grid_getmouldScore = nui.get("grid_getmouldScore");
	var recruitid = <%=request.getParameter("recruitid")%>;
	setData(recruitid);
	function setData(recruitid){
		var json = nui.encode({recruitid:recruitid});
    	nui.ajax({
            url: "org.gocom.abframe.org.recruit.getReruit.biz.ext",
			type: 'POST',
			data: json,	
			contentType: 'text/json',
            success: function (o) {
            	o = nui.decode(o);
                form.setData(o);
	            document.getElementById("omRecruit.recruitno").innerHTML = o.omRecruit.recruitno == null ?"":o.omRecruit.recruitno;
	            document.getElementById("omRecruit.orgid").innerHTML = o.omRecruit.orgname == null ?"":o.omRecruit.orgname;
	            document.getElementById("omRecruit.recposition").innerHTML = o.omRecruit.recposition == null ?"":nui.getDictText('AME_POSITION_MEMO',o.omRecruit.recposition);
	            document.getElementById("omRecruit.recpositionname").innerHTML = o.omRecruit.recpositionname == null ?"":o.omRecruit.recpositionname;
	            document.getElementById("omRecruit.jobtype").innerHTML = o.omRecruit.jobtype == null ?"":nui.getDictText('AME_EMPTYPE2',o.omRecruit.jobtype);
	            document.getElementById("omRecruit.position").innerHTML = o.omRecruit.position == null ?"":nui.getDictText('EMP_TYPE',o.omRecruit.position);
	            document.getElementById("omRecruit.priority").innerHTML = o.omRecruit.priority == null ?"":nui.getDictText('MIS_EMERLEVEL',o.omRecruit.priority);
	            document.getElementById("omRecruit.interviewer").innerHTML = o.omRecruit.intername == null ?"":o.omRecruit.intername;
	            document.getElementById("omRecruit.applyuserid").innerHTML = o.omRecruit.applyname == null ?"":o.omRecruit.applyname;
	            document.getElementById("omRecruit.workduties").innerHTML = o.omRecruit.workduties == null ?"":o.omRecruit.workduties;
	            document.getElementById("omRecruit.recdesc").innerHTML = o.omRecruit.recdesc == null ?"":o.omRecruit.recdesc;
	            document.getElementById("omRecruit.workplace").innerHTML = o.omRecruit.workplace == null ?"":nui.getDictText('AREA4CLRY',o.omRecruit.workplace);
	            document.getElementById("omRecruit.recnum").innerHTML = o.omRecruit.recnum == null ?"":o.omRecruit.recnum;
	            document.getElementById("omRecruit.isheadhunting").innerHTML = o.omRecruit.isheadhunting == null ?"":nui.getDictText('MIS_YN',o.omRecruit.isheadhunting);
	            document.getElementById("omRecruit.propdate").innerHTML = o.omRecruit.propdate == null ?"":o.omRecruit.propdate;
	            document.getElementById("omRecruit.status").innerHTML = o.omRecruit.status == null ?"":nui.getDictText('RECRUIT_STATUS',o.omRecruit.status);
	            document.getElementById("omRecruit.hopedate").innerHTML = o.omRecruit.hopedate == null ?"":o.omRecruit.hopedate;
	            document.getElementById("omRecruit.confirmdate").innerHTML = o.omRecruit.confirmdate == null ?"":o.omRecruit.confirmdate;
	            document.getElementById("omRecruit.recuserid").innerHTML = o.omRecruit.recusername == null ?"":o.omRecruit.recusername;
	            document.getElementById("omRecruit.recbackground").innerHTML = o.omRecruit.recbackground == null ?"":o.omRecruit.recbackground;
	            document.getElementById("omRecruit.remark").innerHTML = o.omRecruit.remark == null ?"":o.omRecruit.remark;
                grid_Intend.load({"recruitid":recruitid},function(){
                	
                });
				    
                search();
				
			    var path = nui.getDictText('AME_SYSCONF','AMEPATH')+"reportJsp/showReport4Proj.jsp?rpx=/queryInterviewsAppraise.rpx&recruitid="+recruitid;
               	$("#appraise").attr('src',path); 
					
				$("#interviewchat").attr('src',"/default/abframe/org/recruit/interviewChat.jsp?recruitid="+recruitid); 
                form.setChanged(false);
			}
     	});
	}
	
	function search(){
		var form = new nui.Form("#interviews_form2");
		var data = form.getData(); //获取表单JS对象数据
        grid_interview.load(data);
		grid_interview.sortBy("interviewdtae", "asc");
	}
	
	//重置
	function reset(){
		var form = new nui.Form("#interviews_form2");
		form.reset();
		search();
	}
	
	function getGender(e){
		return nui.getDictText('ABF_GENDER',e.value);
	}
	function getEducation(e){
		return nui.getDictText('DEGREE',e.value);
	}
	function getJobType(e){
		return nui.getDictText('AME_EMPTYPE2',e.value);
	}
	function getPosition(e){
		return nui.getDictText('EMP_TYPE',e.value);
	}
	function getIntendStatus(e){
		return nui.getDictText('INTEND_STATUS',e.value);
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
	function getposition(e){
		return nui.getDictText('AME_POSITION_MEMO',e.value);//设置业务字典值
	}
	function getinterviewstatus(e){
		return nui.getDictText('INTERVIEW_RECOMMEND_STATUS',e.value);//设置业务字典值
	}
	function getfeedbackstatus(e){
		return nui.getDictText('AME_FEEDBACK_STATUS',e.value);//设置业务字典值
	}
	function getDetail(e){
        return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    }
    function ongenderinterviewStatus(e){
		return nui.getDictText('INTERVIEW_STATUS_OUT',e.value);//设置业务字典值
	}
    function checkDetail(){
    	var row = grid_interview.getSelected();
    	nui.open({
            url: "/default/ame_permanage/ame_resum/detailofResume.jsp",
            title: "查看简历", 
            width: 1100, 
            height: 550,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = {action: "update", "resume": row };
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
            }
        });
    }
    function dealdate(e){
	    if(typeof(e.value)=="string" && e.value != '' && e.value != null && e.value != 'null'){
			return e.value.substring(0,16);
		}else{
			//alert(nui.formatDate(e.value,"yyyy-MM-dd HH:mm"))
			return nui.formatDate(e.value,"yyyy-MM-dd HH:mm");
		}
	}
	
	function exportinterviews(){
    	nui.confirm("确认导出面试人员列表？", "确定？",
        function (action) {
        	if(action=='ok'){
        		var form = new nui.Form("#interviews_form2");
				var data = form.getData(); //获取表单JS对象数据
				
				grid_interview.loading("操作中，请稍后......");
				data.sortField="interviewdtae";
				data.sortOrder="asc";
				nui.ajax({
	    			url: "com.primeton.eos.ame_permanage.ame_resum.exportrecruitinterview.biz.ext",
			        type: "post",
			        data: data,
			        cache: false,
			        contentType: 'text/json',
			        success: function (o) {
			     		grid_interview.unmask();
			     		var filePath = o.downloadFile;
			        	var fileName = "面试人员列表";
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
			     		grid_interview.unmask();
			        	alert("error");
			        }
				});
        		
        	}
        });
	}
</script>
</html>