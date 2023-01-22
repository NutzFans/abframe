<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<link rel="stylesheet" type="text/css" href="assets/js/myRecruitBox.css">
<body>
<span style="font-size: 14px" >统计总数</span>
<table class="table table-striped table-hover " id="aa" >
		<thead>
			<tr>
				<th data-field="getrecruitnum" data-align="center" data-halign = "center" data-width = "55px" data-formatter = "recruittask">待领取需求数</th>
				<th data-field="getarrangeinterviewnum" class="center" data-align="center" data-halign = "center" data-width = "100px" data-formatter = "intervietask">待处理的面试安排数</th>
				<th data-field="getcommunicateoffernum" class="center" data-align="center" data-halign = "center" data-width = "130px" data-formatter = "offertask">待沟通Offer数</th>
				<th data-field="getentrynum" class="center" data-align="center" data-halign = "center" data-width = "80px">待发入职数</th>
			</tr>
		</thead>
</table>
<br>
<span style="font-size: 14px;" >任务列表</span> 
<select id="guolv" class="guolv"  onChange="guolv()"> 
</select>
<!-- <button class="button">过滤</button> -->
<table class="table table-striped table-hover table-responsive" id="tasklist">
	<thead>
		<tr>
			<th data-field="workItemName" data-width = "130px" data-align="left" data-halign = "center" data-formatter = "onActionRenderer">工作项名称</th>
			<th data-field="processInstName" class="center" data-align="left">流程实例名称</th>
		</tr>
	</thead>
</table>
</body>
<script src="assets/js/ySelect.js"></script>
<!-- end: BODY -->
<script type="text/javascript">
 	//加载我的待办任务
 	function loadMytask(){
 		//遮罩
 		getWorkItemName();
 	    var el = $('#tasklist').parents(".panel");
 	    var el1 = $('#aa').parents(".panel");
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
 		$.ajax({ 
		   	type:"POST",  
			url:'org.gocom.bps.wfclient.task.business.task.queryMyRecruitTask.biz.ext',
			success:function(data){
		    	var datalist1 = data.tasks;
		    	var datalist2 = [];
		    	var array = {};
		    	array['getrecruitnum'] = data.getrecruitnum;
		    	array['getarrangeinterviewnum'] = data.getarrangeinterviewnum;
		    	array['getcommunicateoffernum'] = data.getcommunicateoffernum;
		    	array['getentrynum'] = data.getentrynum;
		    	datalist2.push(array);
		     	$('#tasklist').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
		       		data:datalist1,   //datalist 即为需要的数据
			       	dataType:'json',
			       	data_locale:"zh-US",  //转换中文 但是没有什么用处
			       	pagination: false,
			       	pageList:[],
			       	pageNumber:1,
			       	paginationLoop:false,
		  			//这里也可以将TABLE样式中的<tr>标签里的内容挪到这里面：
		     
		     	});
		     	el.unblock();
		     	$('#aa').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
		       		data:datalist2,   //datalist 即为需要的数据
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
 	
 	//待办任务
 	 function onActionRenderer(e,row,index){
 	 	var workItemName = row.workItemName;
 	 	var workItemID = row.workItemID;
		var s = "<a href=javascript:doOperate('" + workItemID + "','" + workItemName + "')>" + e + "</a> ";
        return s;
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
			loadMytask();
			} else if (action == "execute") {  
				loadMytask();
				//doOperate(rowIndex, false);					
			}
		}
	});
}
	function myRecruitBox(classname){
		$("."+classname).ySelect(
					          {
					            placeholder: '任务列表过滤',
					            searchText: '搜索',
					            showSearch: true,
					            numDisplayed: 4,
					            overflowText: '已选中 {n}项',
					            isCheck:false
					          }
					      );
	}
    function guolv(){
             var items = new Array();
             var strArr = '';
             var string;
             items = $("#guolv option:selected");
             for(var i = 0;i<items.length;i++){
			    itemTitle = items[i].text + ',';
			    var strArr = strArr + itemTitle;
	         }
	         var workItemName= strArr.substring(0, strArr.lastIndexOf(','));
	         if(workItemName == null || workItemName == ''){
	            return;
	         }
	         task(workItemName);
    }
   //查环节名称
    function getWorkItemName(){
    	var json = nui.encode({"permisssion":'ALL',"scope":'ALL',"flag":'1'});
        $.ajax({
            url: "org.gocom.bps.wfclient.task.business.task.getWorkItemNameByMe.biz.ext",
            data: json,
            type: 'POST',
            cache: false,
            contentType: 'text/json',
            success: function (text) {
            	var data = text.tasks;
            	var h = "";  
                $.each(data, function(key, value) {
                    h += "<option value='" + key + "'>" + value.workItemName //下拉框序言的循环数据
                    + "</option>";  
                }); 
                
                $('#guolv').attr("multiple","multiple"); //弱化页面的渲染导致的不美观
                $("#guolv").append(h);//append 添加进去并展示
                /* $("#guolv").css({"width":"140px",margin": "-3px 0px 0px 53.5%"}); */
                myRecruitBox('guolv');
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert(jqXHR.responseText);
            }
        });
    } 
    function recruittask(e,row,index){
       var workItemName = '招聘需求审批HR信息确认'; 
       return "<a href='javascript:void(0)' onclick='task(\"" + workItemName+ "\")' title='点击查看'>" + e + "</a>";
    }
    function intervietask(e,row,index){
       var workItemName = '人员面试安排';
       return "<a href='javascript:void(0)' onclick='task(\"" + workItemName+ "\")' title='点击查看'>" + e + "</a>";
    }
    function offertask(e,row,index){
       var workItemName = 'offer沟通结果处理'; 
       return "<a href='javascript:void(0)' onclick='task(\"" + workItemName+ "\")' title='点击查看'>" + e + "</a>";
    }
    function task(workItemName){
           var json = {workItemName:workItemName};
	       $.ajax({ 
				   	type:"POST",
				   	data:json,  
					url:'org.gocom.bps.wfclient.task.business.task.queryMyRecruitTask.biz.ext',
					success:function(data){
				    	var datalist1 = data.tasks;
				     	$('#tasklist').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
				       		data:datalist1,   //datalist 即为需要的数据
					       	dataType:'json',
					       	data_locale:"zh-US",  //转换中文 但是没有什么用处
					       	pagination: false,
					       	pageList:[],
					       	pageNumber:1,
					       	paginationLoop:false,
				  			//这里也可以将TABLE样式中的<tr>标签里的内容挪到这里面：
				     
				     	});
			   		  },error:function(data){
			   		}
		 	})
    }
</script>
</html>