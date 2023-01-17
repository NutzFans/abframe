<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<body>
	<table class="table table-striped table-hover" id="recruitListId"  >
		<thead>
			<tr>
			    <th data-field="recruitid" data-visible = "false"></th>
				<th data-field="recruitno" class="center" data-align="center"  data-formatter = "onMyRecruits">招聘需求编号</th>
				<th data-field="recnum" class="center" data-align="center">招聘需求数</th>
				<th data-field="resumecount" class="center" data-align="center">待面试人数</th>
				<th data-field="feedbackcount" class="center" data-align="center">待反馈人数</th>
			</tr>
		</thead>
	</table>
<script type="text/javascript">
    //获取当前登陆人 的id,name
		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    	%>
    	var  nowuserid = '<%=nowuserid %>';
    	var  nowusername = '<%=nowusername %>';
	//加载我的招聘情况
	function loadmyRecruits(){	
		//遮罩
		var el = $('#recruitListId').parents(".panel");
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
 		var json = {"userid":nowuserid};
		$.ajax({
			url:'org.gocom.abframe.org.recruit.queryRecruitByIndex.biz.ext',
			data: json,
			type:"POST",
			success:function(data){
			var datalist = data.myRecruits;
				$('#recruitListId').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
			       	data:datalist,   //datalist 即为需要的数据
			       	dataType:'json',
			       	data_locale:"zh-US",  //转换中文 但是没有什么用处
			       	pagination: false,
			       	pageList:[],
			       	pageNumber:1,
			       	paginationLoop:false,
			  		//这里也可以将TABLE样式中的<tr>标签里的内容挪到这里面：
		     	});
		     	el.unblock();
			    /*  $('#cusTable').bootstrapTable('hideColumn', 'noticeid'); */
		   	},
		   	error:function(data){
	    		alert("刷新数据失败！");
	    	}
	    })
	}    
 	function onMyRecruits(e,row,index){
     		return '<a href="javascript:doViewRecruits(' + row.recruitid + ')">' + e + '</a> ';
    } 
 	function doViewRecruits(e){
 		var url = "<%=request.getContextPath()%>/abframe/org/recruit/omRecruitDetail.jsp?recruitid=" + e;
			var iWidth=1000; //弹出窗口的宽度;
			var iHeight=500; //弹出窗口的高度;
			var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
			window.open(url, "招聘需求详情", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",resizable=yes");
 	}
</script>
</body>
<!-- end: BODY -->
</html>