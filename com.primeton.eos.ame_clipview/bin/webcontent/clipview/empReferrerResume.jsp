<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<style type="text/css">
	#empReferrerResume {white-space:nowrap;}
</style> 
<body>
<table class="table table-striped table-hover table-responsive" id="empReferrerResume">
	<thead>
		<tr>
			<th data-field="referrername" class="center" data-align = "center" data-width = "70px">推荐人</th>
			<th data-field="empname" class="center" data-align="center" data-width = "70px"  data-formatter = "getResume" >候选人</th>
			<th data-field="tel" class="center" data-align="center" data-width = "60px">联系电话</th>
			<th data-field="referrerstatus" class="center" data-align = "center" data-width = "70px" data-formatter="ongenderreferrerStatus">简历确认状态</th>
			<th data-field="applydate" class="center" data-align = "center" data-width = "70px">推荐日期</th>
			<th data-field="applyoccupation" class="center" data-align="center" data-width = "70px">推荐岗位</th>
			<th data-field="announcecity" class="center" data-align="center" data-width = "70px">期望工作地点</th>
			<th data-field="recruitername" class="center"  data-align="left" data-width = "120px">招聘专员</th>
			<!-- <th data-field="files1" class="center"  data-align="left" data-width = "120px" data-formatter="onFileRenderer">附件</th> -->
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
 	//加载内推员工简历
 	function loadempReferrerResume(){
 		//遮罩
 	    var el = $('#empReferrerResume').parents(".panel");
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
	 	$.ajax({
			url:'com.primeton.eos.ame_newlook.newlook.queryEmpReferrerResumes.biz.ext',
		   	type:"POST",
			success:function(data){
		    	var datalistRe = data.queryResume;
		     	$('#empReferrerResume').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
		       		data:datalistRe,   //datalist 即为需要的数据
			       	dataType:'json',
			       	data_locale:"zh-US",  //转换中文 但是没有什么用处
			       	pagination: true,
			       	pageList:[10,25,50,100],
			       	pageNumber:1,
			       	paginationLoop:false,
		  			//这里也可以将TABLE样式中的<tr>标签里的内容挪到这里面：
		     
		     	});
		     	el.unblock();
	   		},error:function(data){
	   		}
 		})
 	}
 	function getResume(e,row,index){
    	if(e){
    		return "<a href='javascript:void(0)' onclick='checkDetail("+row.resumeid+");' title='点击查看'>" + e + "</a>";
    	}
    }
    function checkDetail(resumeid){
		var executeUrl = "/default/ame_permanage/ame_resum/detailofResume.jsp?action='update'&resumeid=" + resumeid;
		var iWidth=1000; //弹出窗口的宽度;
		var iHeight=500; //弹出窗口的高度;
		var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
		window.open(executeUrl, "反馈详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
    }
    function ongenderreferrerStatus(e,row,index){
        var recruitername = row.recruitername; 
        if(e == 0){
    		return "<a href='javascript:void(0)' onclick='referrerSure(\""+row.resumeid+"\",\""+row.operatorid+"\",\""+row.referrerstatus+"\",\""+row.recruitername+"\",\""+row.empname+"\",\""+row.referrername+"\",\""+row.referrer+"\");' title='点击查看'>" + nui.getDictText("REFFER_STATUS",e) + "</a>";
    	}else if(e == 1){
    	    return nui.getDictText("REFFER_STATUS",e);
    	}
    }
    //执行操作
    function referrerSure(resumeid,operatorid,referrerstatus,recruitername,empname,referrername,referrer){
		var url = "<%=request.getContextPath() %>/ame/clipview/referrerSure.jsp?id=" + resumeid+"&operatorid="+operatorid+"&recruitername="+recruitername+"&referrerstatus="+referrerstatus+"&empname="+empname+"&referrername="+referrername+"&referrer="+referrer;
		var title = "内推确认";
	    nui.open({
			url: url,
			title: title,
			width: 450,
			height: 160,
			onload: function () {
              var iframe = this.getIFrameEl();
            },
			ondestroy: function (action){
				if(action == "ok"){
	               loadempReferrerResume();
	            }
			}
		});
	}
	function onFileRenderer(e) {
        var tempSrc = "";
    	//长度为1，不换行
    	if(e.record.files1==null){
    		return;
    	}
    	if(e.record.files1.length == 1){
        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files1[0].fileId + "'>" + e.record.files1[0].fileName + "</a>";
    	}else{
	        for(var i=0;i<e.record.files1.length;i++){
	        	//长度大于1小于长度length换行
	        	if(i< e.record.files1.length-1){
	        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files1[i].fileId + "'>" + e.record.files1[i].fileName + "</a>&nbsp;&nbsp;";
	        	}
	        	//最后一个不换行
        		if(i == e.record.files1.length-1){
	        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files1[i].fileId + "'>" + e.record.files1[i].fileName + "</a>";
	        	}
	        }
    	}
       	return tempSrc;
     }
</script>
</html>