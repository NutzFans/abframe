<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="commonj.sdo.DataObject" %>
<%@ page import="java.util.Map" %>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2019-12-27 20:04:08
  - Description:
-->
<head>
	<title>面试查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>

    </style>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fix">
	<div class="nui-panel" title="面试查询" style="width:100%;">
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
					<td class="form_label" align="right" >面试安排日期：</td>
					<td colspan="1" align="left">
						<input class="nui-datepicker" name="criteria._expr[1]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[1]._max" style="width:100px"/>
						<input class="nui-hidden" name="criteria._expr[1]._property" value="interviewdtae"/>
						<input class="nui-hidden" name="criteria._expr[1]._op" value="between"/>
						<input class="nui-hidden" name="criteria._expr[1]._pattern" value="yyyy-MM-dd"/>
					</td>
					<td class="form_label" align="right">候选人姓名：</td>
					<td colspan="1" align="left">
					    <input name="criteria._expr[2]._value" class="nui-textbox" style="width:140px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[2]._property" value="empname"/>
					    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
					</td>
					<td class="form_label" align="right">面试反馈：</td>
					<td colspan="1" align="left">
						<input name="criteria._expr[3]._value" class="nui-dictcombobox" style="width:140px;" onenter="onKeyEnter" dictTypeId="AME_FEEDBACK_STATUS" showNullItem="true" multiSelect="true"/>
					    <input class="nui-hidden" name="criteria._expr[3]._property" value="feedbackstatus" />
					    <input class="nui-hidden" name="criteria._expr[3]._op" value="in"/>
					    
					    <input class="nui-hidden" name="criteria._expr[4]._property" value="interviewer" />
					    <input class="nui-hidden" name="criteria._expr[4]._op" value="="/>
					    <input class="nui-hidden" name="criteria._expr[4]._value" value="" id ="interviewer" />
					    
					    <input class="nui-hidden" name="criteria._expr[5]._property" value="orgid" />
					    <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
					    <input class="nui-hidden" name="criteria._expr[5]._value" value="" id="orgids1"/>
					</td>
				<tr>
	    		<tr>
	    			<td align="center" colspan="8">
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search">查找</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
					</td>
				</tr>
			<table>
		</div>
	</div>
	<div class="nui-fit">
	    <div id="datagrid1" showPager="true" dataField="interviews" sizeList="[10,20,50,100,200,500]" 
	    	sortMode="client" 
	    	class="nui-datagrid" style="width:100%;height:340px;" url="com.primeton.eos.ame_permanage.ame_resum.queryByinterviewer.biz.ext" 
	    	multiSelect="true" allowSortColumn=true allowCellWrap="true">
	        <div property="columns">
	        	<div type="checkcolumn"></div>
	        	<div field="workitemid" width="0"></div>
	        	<div field="recruitno" width="80" align="center" headerAlign="center" renderer="getDetail">需求编号</div>
	            <div field="recpositionname" width="100" align="center" headerAlign="center">招聘岗位</div>
	            <div field="empname" width="70"  headerAlign="center" align="center" renderer="onActionRenderer">候选人</div>
	            <div field="status" width="90"  headerAlign="center"  align="center" renderer="getinterviewstatus">面试状态</div>
	            <div field="candidatestatus" width="90"  headerAlign="center"  align="center" renderer="getcandidatestatus">候选人面试状态</div>
	            <div field="interviewdtae" width="80"  headerAlign="center"  align="center" renderer="DateFormat">面试时间</div>
	            <div field="feedbackstatus" width="80" align="center" headerAlign="center" renderer="getfeedbackstatus">面试反馈</div>
	            <div field="overallmerit" width="180" align="center" headerAlign="center">总体评价</div>
	        </div>
	    </div>
	</div>
</div>
</body>
<script>
	nui.parse();
	<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    %>
    var grid = nui.get("datagrid1");
	var form = new nui.Form("#form1");
	
	init();
	function init(){
		//初始化有权的机构
		//code:对应功能编码，map：对于机构的查询条件
		var json = {"code":"WDMS","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					if(text.orgs.length==0){
						// 没有有权的机构时只能查销售为自己的数据
						nui.get("interviewer").setValue('<%=nowuserid %>');
					}
					var isall;
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
					}else{
						nui.get("orgids1").setValue(text.orgids);
					}
				}else{
					// 没有有权的机构时只能查销售为自己的数据
					nui.get("interviewer").setValue('<%=nowuserid %>');
				}
				search();//权限控制之后开始查询数据
			}
		});
	}
	
	function search() {
		var data = form.getData();
		grid.load(data);
	}
	function reset(){
		form.reset();
		init();
	}
	
	
	//回车触发
	function onKeyEnter(){
		search();
	}
	
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
    
    function DateFormat(e){
		if(typeof(e.value)=="string" && e.value != '' && e.value != null && e.value != 'null'){
			return e.value.substring(0,16);
		}else{
			//alert(nui.formatDate(e.value,"yyyy-MM-dd HH:mm"))
			return nui.formatDate(e.value,"yyyy-MM-dd HH:mm");
		}
    }
    
	function getfeedbackstatus(e){
		return nui.getDictText('AME_FEEDBACK_STATUS',e.value);//设置业务字典值
	}
	function getinterviewstatus(e){
		return nui.getDictText('INTERVIEW_STATUS',e.value);//设置业务字典值
	}
	function getcandidatestatus(e){
		return nui.getDictText('INTERVIEW_RECOMMEND_STATUS',e.value);//设置业务字典值
	}
</script>
</html>