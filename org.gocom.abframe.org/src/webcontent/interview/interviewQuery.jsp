<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="commonj.sdo.DataObject" %>
<%@ page import="java.util.Map" %>
<html>
<!-- 
  - Author(s): WangTong
  - Date: 2019-12-12 11:15:07
  - Description:
-->
<head>
	<title>面试安排查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>

    </style>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fix">
	<div class="nui-panel" title="面试安排查询" style="width:100%;">
	<div id="form1">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				  <tr>
			      	  <td class="form_label" align="right">招聘需求编号：</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[0]._value" class="nui-textbox" style="width:160px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[0]._property" value="recruitno"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			          </td>
			          <td class="form_label" align="right">面试状态：</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[3]._value" class="nui-dictcombobox" style="width:140px;" onenter="onKeyEnter" dictTypeId="INTERVIEW_RECOMMEND_STATUS" showNullItem="true" multiSelect="true"/>
					    <input class="nui-hidden" name="criteria._expr[3]._property" value="candidatestatus" />
					    <input class="nui-hidden" name="criteria._expr[3]._op" value="in"/>
			          </td>
			          <td class="form_label" align="right">候选人姓名：</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[4]._value" class="nui-textbox" style="width:140px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[4]._property" value="empname"/>
					    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
			          </td>
			      
						<td class="form_label" align="right" >面试日期：</td>
						<td colspan="1" align="left">
							<input class="nui-datepicker" name="criteria._expr[8]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[8]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[8]._property" value="interviewdtae2"/>
						    <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[8]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
						</td>
					
	    		</tr>
				<tr>
					<td class="form_label" align="right">招聘部门：</td>
		          	 <!-- 结果集只有orgid的并且用combobox展示-->
						<td>
							<input id="orgid2"  name="criteria._ref[0]._expr[0]._value" style="width:160px;" class="nui-combobox" 
							textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"/>
		            		<input class="nui-hidden" name="criteria._expr[1]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="in" id="tempCond1"/>
					        <input class="nui-hidden" name="criteria._expr[1]._ref" value="1" id="tempCond2"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="orgid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgseq"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._likeRule" value="end"/>
					        <input class="nui-hidden" name="criteria._expr[2]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._expr[2]._value" id="orgids2"/>
						</td> 
					<!-- <td class="form_label" align="right">面试反馈意见：</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[5]._value" class="nui-textbox" style="width:160px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[5]._property" value="feedback"/>
					    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
			          </td> -->
			          <td class="form_label" align="right">面试官：</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[5]._value" class="nui-textbox" style="width:140px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[5]._property" value="interempname"/>
					    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
			          </td>
			    	<td class="form_label" align="right">面试发起人：</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[6]._value" id="recempname" class="nui-textbox" style="width:140px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[6]._property" value="creatorname"/>
					    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
			          </td>
				     <!-- <td class="form_label" align="right">招聘岗位：</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[7]._value" class="nui-dictcombobox" style="width:160px;" onenter="onKeyEnter" dictTypeId="AME_POSITION_MEMO" showNullItem="true" multiSelect="true"/>
					    <input class="nui-hidden" name="criteria._expr[7]._property" value="applyoccupation"/>
					    <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
			          </td>-->
			         
			          
			         <td class="form_label" align="right" >需求确认日期：</td>
						<td colspan="1" align="left">
							<input class="nui-datepicker" name="criteria._expr[9]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[9]._max" style="width:100px"/>
						    <input class="nui-hidden" name="criteria._expr[9]._property" value="confirmdate"/>
						    <input class="nui-hidden" name="criteria._expr[9]._op" value="between"/>
						    <input class="nui-hidden" name="criteria._expr[9]._pattern" value="yyyy-MM-dd"/>
						</td>
		      	</tr>
		      	<tr>
		      		<td class="form_label" align="right">招聘专员：</td>
			          <td colspan="1" align="left">
			            <input name="criteria._expr[10]._value" id="recempname" class="nui-textbox" style="width:160px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[10]._property" value="recempname"/>
					    <input class="nui-hidden" name="criteria._expr[10]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[10]._likeRule" value="all"/>
			          </td>
		      	</tr>
	    		<tr>
	    			<td align="center" colspan="8">
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search">查找</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
					</td>
				</tr>
	    	</table>
    	</div>
	</div>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	    <table>
	        <tr>
	            <td>
	                <a class="nui-button" id="export" iconCls="icon-download" onclick="exportInterview">导出人员面试信息</a>
	            </td>
	        </tr>
	    </table>
	</div> 
	<div class="nui-fit">
	    <div id="datagrid1" showPager="true" dataField="ints" sizeList="[10,20,50,100,200,500]" 
        	class="nui-datagrid" style="width:100%;height:340px;" url="org.gocom.abframe.org.interviewQuery.interviewQuery.biz.ext" 
        	multiSelect="true" allowSortColumn=true onload="onload">
            <div property="columns">
            	<div type="checkcolumn"></div>
            	<div field="workitemid" width="0"></div>
            	<div field="workitemname" width="80" align="center" renderer="onAction" headerAlign="center">操作</div>
            	<div field="recruitno" width="80" align="center" headerAlign="center">需求编号</div>
                <div field="recpositionname" width="150" align="center" headerAlign="center" renderer="getDetail">招聘岗位</div>
                <div field="empname" width="70"  headerAlign="center" align="center" renderer="onActionRenderer">候选人</div>
                <div field="interviewdtae1" width="150"  headerAlign="center" allowSort="true" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">最新面试时间</div>
                <!-- <div field="interviewdtae" width="80"  headerAlign="center"  align="center" dateFormat="yyyy-MM-dd">发起面试日期</div> -->
                <div field="interviewers" width="180" align="center" headerAlign="center">面试官</div>
                <div field="candidatestatus" width="90"  headerAlign="center"  align="center" renderer="process">当前面试状态</div>
                <div field="tel" width="90"  headerAlign="center" align="center">候选人电话</div>
                <div field="selfemail" width="110" align="center" headerAlign="center">候选人邮件</div>
            	<div field="orgname1" width="90" align="center" headerAlign="center" >招聘一级部门</div>
                <div field="orgname2" width="90" align="center" headerAlign="center" >招聘二级部门</div>
                <div field="creatorname" width="130" align="center" headerAlign="center">面试发起人</div>
                <div field="recempname" width="130" align="center" headerAlign="center">招聘专员</div>
            </div>
        </div>
	</div>
	</div>
</div>

	<!-- 导出的时候用到的 -->
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
	
</body>
<script>
	nui.parse();
	<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    %>
    init();
    function init(){
	    //code:对应功能编码，map：对于机构的查询条件
		var json = {"code":"interviewQuery","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					if(text.orgs.length==0){
						//当没有有权的机构时将某一个查询条件限定住比如说“员工”，“项目负责人”等
						nui.get("recempname").setValue("<%=nowusername %>");
						nui.get("recempname").setReadOnly(true);
						//return;
					}
					//根据情况选择一种
					nui.get("orgid2").setData(text.orgs);
					nui.get("orgids2").setValue(text.orgids);
					search();
				}else{
					//当没有有权的机构时将某一个查询条件限定住比如说“员工”，“项目负责人”等
					nui.get("recempname").setValue("<%=nowusername %>");
					nui.get("recempname").setReadOnly(true);
					//return;
				}
				
			}
		});
    }
    
	
	var grid = nui.get("datagrid1");
	var form = new nui.Form("#form1");
	//search();
	
	function search() {
	    nui.get("search").setEnabled(false);
		if(nui.get("orgid2").getValue() == ""){
    		nui.get("tempCond1").setValue("=");
    		nui.get("tempCond2").setValue("");
    	}else{
    		nui.get("tempCond1").setValue("in");
    		nui.get("tempCond2").setValue("1");
    	}
		var data = form.getData();
		if(data.criteria._expr[8]._max!=null&&data.criteria._expr[8]._max!=""){
			data.criteria._expr[8]._max = data.criteria._expr[8]._max.substring(0,10)+" 23:59:59"
		}
		grid.load(data);
		grid.sortBy("interviewdtae1","desc");
		
	}
	function reset(){
		form.reset();
		init();
	}
	function onload(){
	    nui.get("search").setEnabled(true);
	}
	//回车触发
	function onKeyEnter(){
		search();
	}
	
	
	//导出数据
	function exportInterview(){
		if(!confirm("导出人员面试信息？")){
				return;
		}
		form.loading("导出中...");
		var data = form.getData();
		var json =  nui.encode(data);
	
		form.loading("操作中，请稍后......");
		nui.ajax({
            url: "org.gocom.abframe.org.interviewQuery.exportInterview.biz.ext",
            type: "post",
            data: json,
            cache: false,
            contentType: 'text/json',
            success: function (o) {
         		form.unmask();
            	var filePath = o.downloadFile;
            	var fileName = "人员面试信息";
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
	
	
	//面试人员状态
	function status (e) {
		return nui.getDictText("INTERVIEW_RECOMMEND_STATUS",e.value);
	}
	/* //面试反馈意见
	function feedbackstatus (e) {
		return nui.getDictText("AME_FEEDBACK_STATUS",e.value);
	} */
	//姓名关联详情页面 
	function onActionRenderer(e) {
		var record = e.record;
    	var processinstid = e.record.processinstid;
        if(record.recruitid){
			return "<a href='javascript:void(0)' onclick='getdetailIntendJoin("  + processinstid + ")' title='点击查看'>" + e.value + "</a>";
		}        
    }
	function getdetailIntendJoin(processinstid){
		var executeUrl = "<%= request.getContextPath() %>/abframe/org/interview/interviewDetail.jsp?processInstID=" + processinstid;
		window.open(executeUrl);
	}
	
	
	//关联招聘需求详情
	function getDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='getOmRecruitDetail();' title='点击查看'>" + e.value + "</a>";
    	}
    }
     function getOmRecruitDetail(){
    	var selectRow = grid.getSelected();
		var executeUrl = "/default/abframe/org/recruit/omRecruitDetail.jsp?recruitid=" + selectRow.recruitid;
		window.open(executeUrl);
    }
    
    //面试状态关联流程
	function process(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='feeView();' title='点击查看'>" + nui.getDictText("INTERVIEW_RECOMMEND_STATUS",e.value) + "</a>";
    	}
    }
    
    
    function feeView(){
        var selectRow = grid.getSelected();
        var processInstID=selectRow.processinstid;
		var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
		var title = "流程图查看";
		var width=1000;
	    nui.open({
			url: url,
			title: title,
			width: width,
			height: 550,
			onload: function () {
				var iframe = this.getIFrameEl();
				if(iframe.contentWindow.initData) {
					iframe.contentWindow.initData({"processInstID": processInstID});
				}
			},
			ondestroy: function (action){
			}
		});
    }
    
    //待办任务
 	 function onAction(e){
 	 	if(e.value){
	 	 	var row = e.record;
	 	 	var workItemName = row.workitemname;
	 	 	var workItemID = row.workitemid;
	 	 	var processinstid = e.record.processinstid;
	 	 	if(row.workitemname=="更改安排"){
	 	 		if(row.participant.indexOf("<%=nowuserid %>") != -1 ){
	 	 			var s = "<a href=javascript:doOperate1('" + workItemID + "','" + processinstid + "')>" + e.value + "</a> ";
	 	 		}else{
	 	 			s="";
	 	 		}
	 	 	}else if(row.workitemname=="面试安排"){
	 	 		if(row.participant.indexOf("<%=nowuserid %>") != -1 ){
	 	 			var s = "<a href=javascript:doOperate('" + workItemID + "','" + workItemName + "')>" + e.value + "</a> ";
	 	 		}else{
	 	 			s="";
	 	 		}
	 	 	}else{
				var s = "<a href=javascript:doOperate('" + workItemID + "','" + workItemName + "')>" + e.value + "</a> ";
	 	 	}
	        return s;
 	 	}
	} 
		//执行操作
    function doOperate(workItemID,workItemName) {
		var url = "<%=request.getContextPath()%>/bps/wfclient/task/dispatchTaskExecute.jsp?workItemID="+workItemID;
		var title = "工作项执行"+"-"+workItemName;
		var width=1100;
	    nui.open({
			url: url,
			title: title,
			width: width,
			height: 600,
			onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
				if (action == "ok") {
				search();
				} else if (action == "execute") {  
					search();
				}
			}
		});
	}
	
	//更改安排时工作项id为活动实例id
	function doOperate1(workItemID,processinstid){
		if(!confirm("是否更改面试安排？确定后不可取消！")){
			return;
		}
		nui.ajax({
            url: "com.primeton.eos.ame_common.ame_common.drawBackAndreNewWorkitem.biz.ext",
            type: 'POST',
            data: {"activityinstid": workItemID,"processinstid":processinstid},
            cache: false,
            success: function (res) {
            	console.log(res);
            	doOperate(res.workitemid,"面试安排");
            }
        });
	}
</script>
</html>