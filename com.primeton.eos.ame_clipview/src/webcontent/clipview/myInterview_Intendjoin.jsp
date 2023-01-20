<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" class="no-js">
<!-- 
  - Author(s): xupc
  - Date: 2020-02-21 
  - Description:
-->
<style type="text/css">
	#interviewlist {white-space:nowrap;}
	#intendjoinlist {white-space:nowrap;}
</style>
<body>
	<!-- <legend style="font-size: 14px" id='ddd'>当日面试人员名单(人次)</legend> -->
	<span align="top" style="font-size: 14px"  id='ddd'>当日面试人员名单(人次)</span>
	<table class="table table-striped table-hover" id="interviewlist"  >
	
		<thead>
			<tr>
				<th data-field="empname" data-align="center" data-halign = "center" data-width = "55px" data-formatter = "onActionRenderer22">候选人</th>
				<th data-field="recpositionname" class="center" data-align="left" data-halign = "center" data-width = "110px">招聘岗位</th>
				<th data-field="interviewdtae" class="center" data-align="left" data-halign = "center" data-width = "128px">面试时间</th>
				<th data-field="interviewers" class="center" data-align="left" data-halign = "center" data-width = "70px">面试官</th>
				<th data-field="orgname" class="center" data-align="center" data-width = "96px">面试部门</th>
				<th data-field="status" class="center" data-formatter = "dictExpStatus" data-halign = "center"data-width = "80px">面试状态</th>
				<th data-field="recempname" class="center" data-align="center">面试发起人</th>
				
				<!-- <th data-field="venue" class="center" data-align="left" data-halign = "center"  data-width = "300px"> 面试地点</th> -->
			</tr>
		</thead>
	</table>
	<br>
	<span align="top" style="font-size: 14px"  id='eee'>当日入职人员名单(人)</span>
	<table class="table table-striped table-hover" id="intendjoinlist" >
		<thead>
			<tr>
				<th data-field="intendname" data-align="center" data-halign = "center" >入职人员</th>
				<th  data-field="interdate" class="center" data-align="center">入职时间</th>
				<th data-field="intendstatus" class="center" data-align="left" data-halign = "center" data-formatter = "getintendstatus">入职状态</th>
				<th data-field="intendrecempname" class="center" data-align="center">招聘专员</th>
				<th data-field="workplace" class="center" data-align="center" data-halign = "center" data-formatter = "getWorkspace">工作地点</th>
				<th data-field="orgname" class="center" data-align="left" data-halign = "center" data-switchable="true" >入职部门</th>
			</tr>
		</thead>
	</table>
</body>
<!-- end: BODY -->
<script type="text/javascript">
     	//加载面试人员
     	function loadMyinterview_intendjoin(date,userid){
 	    	//遮罩
 	    	var el = $('#interviewlist').parents(".panel");
 	    	var el1 = $('#intendjoinlist').parents(".panel");
            el.block({
                overlayCSS: {
                    backgroundColor: '#fff'
                },
                message: '<img src="assets/images/loading.gif" /> Just a moment...',
                css: {
                    border: 'none',
                    color: '#333',
                    background: 'none'
                }
            });
            el1.block({
                overlayCSS: {
                    backgroundColor: '#fff'
                },
                message: '<img src="assets/images/loading.gif" /> Just a moment...',
                css: {
                    border: 'none',
                    color: '#333',
                    background: 'none'
                }
            }); 
            var json = {flag:"3",date:date,userid:userid};
 	    	$.ajax({
			url:'org.gocom.abframe.org.interviewQuery.queryRecruitPanel.biz.ext',
		   	type:"get",
		   	data:json,
		   	async:false,
			success:function(data){
		    	var datalist11 = data.ints;
		    	var datalist12 = data.intendjoins;
		     	$('#interviewlist').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
		       		data:datalist11,   //datalist 即为需要的数据
			       	dataType:'json',
			       	data_locale:"zh-US",  //转换中文 但是没有什么用处
			       	pagination: false,
			       	pageList:[],
			       	pageNumber:1,
			       	paginationLoop:false,
		  			//这里也可以将TABLE样式中的<tr>标签里的内容挪到这里面：
		     	  });
		     	  el.unblock();
		     	  $('#intendjoinlist').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
		       		data:datalist12,   //datalist 即为需要的数据
			       	dataType:'json',
			       	data_locale:"zh-US",  //转换中文 但是没有什么用处
			       	pagination: false,
			       	pageList:[],
			       	pageNumber:1,
			       	paginationLoop:false,
		  			//这里也可以将TABLE样式中的<tr>标签里的内容挪到这里面：
		     	  });
		     	  el1.unblock();
		   		 },error:function(data){
		   	   }
	 		 })
     	}
    //外部状态业务字典值展示
		function dictExpStatus(e){
			return nui.getDictText('INTERVIEW_STATUS',e);
		}
	//入职地点	
		function getWorkspace(e){
		    return nui.getDictText('AREA4CLRY',e);
	    }
	    function getintendstatus(e){
		    return nui.getDictText('INTEND_STATUS',e);
	    }
	    //姓名关联详情页面 
		function onActionRenderer22(e,row,index) {
	    	var processinstid = row.processinstid;
	        if(processinstid){
				return "<a href='javascript:void(0)' onclick='getdetailIntendJoin("  + processinstid + ")' title='点击查看'>" + row.empname + "</a>";
			}        
	    }
		function getdetailIntendJoin(processinstid){
			var executeUrl = "<%= request.getContextPath() %>/abframe/org/interview/interviewDetail.jsp?processInstID=" + processinstid;
			window.open(executeUrl);
		}
</script>
</html>