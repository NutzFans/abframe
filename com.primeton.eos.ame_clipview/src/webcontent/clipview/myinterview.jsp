<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<body>
<table class="table table-striped table-hover table-responsive" id="interviewlist">
	<thead>
		<tr>
			<th data-field="workitemname" data-align="left" data-width = "70px" data-halign = "center" data-formatter = "onActionRenderer1">操作</th>
			<th data-field="empname" data-align="center" data-halign = "center" data-formatter = "onActionRenderer22">候选人</th>
			<th data-field="recpositionname" class="center" data-align="left">招聘岗位</th>
			<th class="center" data-field="interviewdtae1" >最新面试时间</th>
			<th data-field="interviewers" class="center" data-align="left">已面试面试官</th>
			<th data-field="candidatestatus" class="center" data-formatter = "process" data-align="left">面试状态</th>
		</tr>
	</thead>
	<tbody class = "left">
		
	</tbody>
</table>
</body>
<!-- end: BODY -->
<script type="text/javascript">
 	<%
 	String pstatus = (String)session.getAttribute("pstatus");
 	UserObject user = (UserObject) session.getAttribute("userObject");
	String username = user.getUserName();
	%>
 	//加载我的面试安排
 	function loadMyinterview(){
 		//遮罩
 	    var el = $('#interviewlist').parents(".panel");
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
			url:'org.gocom.abframe.org.interviewQuery.interviewQuery.biz.ext',
		   	type:"POST",
		   	data:paramdata,
			success:function(data){
		    	var datalist11 = data.ints;
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
	   		},error:function(data){
	   		}
 		})
 	}
 	
 	//待办任务
 	 function onActionRenderer1(e,row,index){
 	 	if(row.workitemname){
	 	 	var workItemName = row.workitemname;
	 	 	var workItemID = row.workitemid;
	 	 	processinstid = row.processinstid;
	 	 	if(row.workitemname=="更改安排"){
	 	 	if(row.recempname.indexOf("<%=username %>") != -1 ){
	 	 		var s = "<a href=javascript:doOperate11('" + workItemID + "','" + processinstid + "')>" + e + "</a> ";
	 	 		}else{
	 	 			s="";
	 	 		}
	 	 	}else{
				var s = "<a href=javascript:doOperate1('" + workItemID + "','" + workItemName + "')>" + e + "</a> ";
	 	 	}
	        return s;
 	 	}
	} 
		//执行操作
    function doOperate1(workItemID,workItemName) {
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
				loadMyinterview();
				} else if (action == "execute") {  
					loadMyinterview();
					//doOperate(rowIndex, false);					
				}
			}
		});
	}
	
	function doOperate11(workItemID,processinstid){
		if(!confirm("是否更改面试安排？确定后不可取消！")){
			return;
		}
		nui.ajax({
            url: "com.primeton.eos.ame_common.ame_common.drawBackAndreNewWorkitem.biz.ext",
            type: 'POST',
            data: {"activityinstid": workItemID,"processinstid":processinstid},
            cache: false,
            success: function (res) {
            	doOperate1(res.workitemid,"面试安排");
            }
        });
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
	
	 //面试状态关联流程
	function process(e,row,index){
    	if(row.candidatestatus){
    		return "<a href='javascript:void(0)' onclick='feeView("  +row.processinstid + ");' title='点击查看'>" + nui.getDictText("INTERVIEW_RECOMMEND_STATUS",row.candidatestatus) + "</a>";
    	}
    }
    
    
    function feeView(processinstid){
        var processInstID=processinstid;
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
</script>
</html>