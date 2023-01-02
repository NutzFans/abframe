<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<style type="text/css">
	#recuitlist {white-space:nowrap;}
</style>
<body>
<table class="table table-striped table-hover table-responsive" id="recuitlist">
	<thead>
		<tr>
			<th data-field="status" data-align="left" data-halign = "center" data-formatter = "onActionRendererRe" data-width = "140px">操作</th>
			<th data-field="recruitno" class="center" data-align="center" data-width = "80px">招聘需求编号</th>
			<th data-field="recpositionname" class="center" data-formatter = "getReDetail" data-align="left" data-width = "140px">招聘职位名称</th>
			<th class="center" data-field="recnum" data-width = "140px">招聘数量</th>
			<th data-field="finishnum" class="center" data-align="center" data-width = "140px">已完成数</th>
			<th data-field="status" class="center" data-formatter = "dictReStatus" data-align="left" data-width = "140px">招聘状态</th>
			<th data-field="applyname" class="center"  data-align="left" data-width = "140px">申请人</th>
			<th data-field="ywdyname" class="center"  data-align="left" data-width = "140px">三级部门</th>
		</tr>
	</thead>
	<tbody class = "left">
		
	</tbody>
</table>
</body>
<!-- end: BODY -->
<script type="text/javascript">
 	<%
 	UserObject user = (UserObject) session.getAttribute("userObject");
	String username = user.getUserName();
	%>
 	//加载我的面试安排
 	function loadMyrecurit(){
 		//遮罩
 	    var el = $('#recuitlist').parents(".panel");
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
 	    var paramdata ={flag:"1"};
	 	$.ajax({
			url:'org.gocom.abframe.org.recruit.omRecruitList.biz.ext',
		   	type:"POST",
		   	data:paramdata,
			success:function(data){
		    	var datalistRe = data.omRecruits;
		     	$('#recuitlist').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
		       		data:datalistRe,   //datalist 即为需要的数据
			       	dataType:'json',
			       	data_locale:"zh-US",  //转换中文 但是没有什么用处
			       	pagination: false,
			       	pageList:[],
			       	pageNumber:1,
			       	paginationLoop:false,
		  			//这里也可以将TABLE样式中的<tr>标签里的内容挪到这里面：
		     
		     	});
		     	el.unblock();
	   		},error:function(data){
	   		}
 		})
 	}
 	
 	//待办任务
 	 function onActionRendererRe(e,row,index){
	 	 	var recruitid = row.recruitid;
	 	 	var s = "<a href=javascript:doOperateRe('" + recruitid + "')>安排面试</a>"+" "+"<a href=javascript:addRecord('" + recruitid + "')>日报</a>";
	        return s;
	} 
		//执行操作
    function doOperateRe(recruitid) {
		var url = "<%=request.getContextPath() %>/ame_permanage/ame_interview/createInterviewProcess.jsp?id=" + recruitid;
		var title = "发起面试安排流程";
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
				loadMyrecurit();
			}
		});
	}
	//执行操作
    function addRecord(recruitid){
		var url = "<%=request.getContextPath() %>/abframe/org/recruit/omRecruitRecommendRecord.jsp?id=" + recruitid;
		var title = "新增简历推荐记录";
	    nui.open({
			url: url,
			title: title,
			width: 800,
			height: 540,
			onload: function () {
              var iframe = this.getIFrameEl();
            },
			ondestroy: function (action){
				loadMyrecurit();
			}
		});
	}
	
	function getReDetail(e,row,index){
    	if(e){
    		return "<a href='javascript:void(0)' onclick='getOmRecruitDetail("+row.recruitid+");' title='点击查看'>" + e + "</a>";
    	}
    }
    function getOmRecruitDetail(recruitid){
		var url = "<%=request.getContextPath() %>/abframe/org/recruit/omRecruitDetail.jsp?recruitid=" + recruitid;
		var title = "招聘需求明细";
		var width=1100;
	    nui.open({
			url: url,
			title: title,
			width: width,
			height: 500,
			onload: function () {
				var iframe = this.getIFrameEl();
			},
			ondestroy: function (action){
			}
		});
    }
    
    function dictReStatus(e){
    	return nui.getDictText("RECRUIT_STATUS",e);
    }
	
</script>
</html>