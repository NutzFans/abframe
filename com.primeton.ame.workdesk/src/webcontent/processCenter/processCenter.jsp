<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<!-- 
  - Author(s): zhang-yb
  - Date: 2018-06-13 13:54:50
  - Description:
-->
<head>
<title>流程中心</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,user-scalable=no"/>
<meta name="apple-mobile-web-app-capable" content="yes" />
<!-- start: MAIN CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ame_mobile/layer_mobile/need/layer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ame/clipview/assets/css/main-responsive.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ame_mobile/processCenter/js/mescroll.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ame_mobile/workDesk/assets/css/main.css">
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/ame_common/wxworktime/select2/dist/css/select2.min.css"/>
<style type="text/css">
	body{background:#EBEBEB;}
	.nav{display: flex;width: 100%;align-items:center;}
	.nav li{width: 33.33%;text-align: center;padding: 5px;}
	.navbar-nav{margin:0 0 !important;}
	.navbar-nav li i{font-size: 28px;color: #a09797;}
	.navbar-nav li a{font-size: 10px;padding: 0px;color:#a09797;}
	.activeThis i,.activeThis a{color: #3eaa96 !important;}
	#content-box{-webkit-transform: translateZ(0);}
	.contentTop{margin: 10px auto 5px;width: 80%;}
	.contentTop input{border-radius:100px!important;height: 34px;padding-left: 13px!important;padding-right: 25px!important}
	.contentTop span{display: inline-block;width: 40px;text-align: center;right:0;top:0;line-height: 22px;}
	.input-group-addon{background: none;border: none;position: absolute;right: 10px;top:3px;}
	.navbar-fixed-bottom,.navbar-fixed-top{background: #FAFAFA;color: #4A4A4A;}
	.container-fluid{padding-top: 49px; }
	 input[type=datetime-local]{-webkit-appearance:none;outline:none;border:none;}
    select{-webkit-appearance: none;}
   	.contentBottom{width: 100%;display: none;}
   	.bb{display: flex;align-items:center;margin: 10px auto 5px;width: 80%;justify-content: space-between;}
</style>
</head>
<body>
<!--<nav class="navbar navbar-default navbar-fixed-top">
	待办列表
</nav>-->
	<div class="navbar navbar-default navbar-fixed-top top-search">
		<div class="input-group contentTop">
			<input type="text" class="form-control" placeholder="请输入流程名称"/>
			<span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
		</div>
		
		<div class="input-group contentBottom">
			<div class='bb'>
				<div style="width: 60%;">
					<select id="search-select" style="width: 100%" class="search-select">
						<option id="" ></option>
					</select>
				</div>
				<button type="button" class="btn btn-light-grey cancle" >取消</button>
				<button type="button" class="btn btn-green ok" >确定</button>
			</div>
		</div>
		
	</div>
	
	
	
	<div class="container-fluid">
		<div id="content-box">
		  	
		</div>
	</div>
	
	<div class="navbar navbar-default navbar-fixed-bottom">
		<ul class="nav navbar-nav">
		    <li class="activeThis"><i class="fa fa-pencil-square-o"></i><a href="javascript:void(0);">待办</a></li>
			<li><i class="fa fa-check-square-o" ></i><a href="javascript:void(0);">已办</a></li>
			<li><i class="fa fa-bullhorn" ></i><a href="javascript:void(0);">提醒</a></li>
		</ul>
	</div>
	
</body>
<script src="<%=request.getContextPath() %>/ame_mobile/layer_mobile/layer.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/js/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath() %>/ame_mobile/processCenter/js/mescroll.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/wxworktime/select2/dist/js/select2.full.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/wxworktime/select2/dist/js/select2.min.js"></script>
<script type="text/javascript">
	
	//匿名自执行函数 默认加载待办任务列表
	$(function(){
		$(".columns li").remove();//确保没有缓存的页面内容
		$("#content-box").load("<%=request.getContextPath() %>/ame_mobile/processCenter/pendingTask.jsp");
	})
	
	//导航 1）已办待办才有搜索框
	$(".nav li").on("click",function(){
		$(".form-control").val("");//切换的时候搜索框清空
		var index = $(this).index();
		<%--$(".modalll").fadeOut(500,function(){
			$(".contentTop").fadeIn(500);
		});--%>
		$(".nav li").each(function(){
			$(this).removeClass("activeThis");
		})
		$(this).attr("class","activeThis");
		if(index == 0){
			$("#content-box").load("<%=request.getContextPath() %>/ame_mobile/processCenter/pendingTask.jsp");
		}else if(index == 1){
			$("#content-box").load("<%=request.getContextPath() %>/ame_mobile/processCenter/haveDownList.jsp");
		}else{
			$("#content-box").load("<%=request.getContextPath() %>/ame_mobile/processCenter/remindList.jsp");
		}
	})
	
	
	//点击搜索事件
	$(".input-group-addon").on("touchend",function(){
		loadData();
	});
	var tI = 0;//定义变量判断是否为第一次点击搜索。
	//加载数据
	function loadData(){
		var inputText = $(".form-control").val();
		var json = {num: 1, size: 10, time: null,processInstName:inputText};
		$(".columns li").remove();
		mescroll.showUpScroll();
		upCallback(json);
	}
	
	<%--//点击查看详情
	function doTask(processid){
		//window.location.href="<%=request.getContextPath() %>/ame_mobile/processCenter/processInfo.jsp?processid="+processid;
	}--%>
	
	var workItemID = "";//工作项id
	var catalogName = "";
	var currentActName = "";
	//操作 1 改派 2催办
	function operation(obj,type,event){
		currentActName = $(obj).attr("currentActName");
	  	workItemID = $(obj).attr("workItemID");
		if(type == 1){
			catalogName = $(obj).attr("catalogName");
			$(".contentTop").fadeOut(500,function(){
				$(".contentBottom").fadeIn(500);
			});
			<%--layer.open({
    			content:'<iframe src="<%=request.getContextPath() %>/ame_mobile/processCenter/selResPeo.jsp" id="ifrmid" frameborder="0" width="100%" height="100px"></iframe>',
    			btn: ['确定', '取消'],
    			success:function(){
		    		$(".layui-m-layershade").on("touchmove",function(event){
				  		event.preventDefault();
				  		event.stopPropagation();
				  	})
		    	},
    			yes: function(index){
    				var res = $("#ifrmid")[0].contentWindow.getData();
			      	ressign(res);
			      	layer.close(index);
			    }
  			});--%>
		}else if(type == 2){
			//提示
			layer.open({
			    content: '<div style="width:80%;margin:0 auto;text-align:left;"><label for="form-field-22">请输入催办信息：</label><textarea  style="resize:none" placeholder="请输入催办信息" id="doThing" class="form-control"></textarea></div>',
			    btn: ['确定', '取消'],
			    shadeClose: false,
			    success:function(){
			    	$("#doThing").val("请您尽快处理该环节任务。");
		    		$("#layui-m-layer0").on("touchmove",function(event){
				  		event.preventDefault();
				  		event.stopPropagation();
				  	})
		    	},
			    yes: function(index){
			    	var inputText = $("#doThing").val();
			    	if(inputText == ""){
			    		layer.open({
						    content: '催办的信息不能为空！',
						    skin: 'msg',
						    time: 2 //2秒后自动关闭
				 	 	});
				 	 	return;
			    	}
			      	layer.close(index);
			      	layer.open({
		    	 		type: 2,
				    	content: '催办中。。。',
				    	shadeClose: false,
					    success:function(){
				    		$("#layui-m-layer0").on("touchmove",function(event){
						  		event.preventDefault();
						  		event.stopPropagation();
						  	})
				    	}
				  	});
				  	var processInstName = $(obj).attr("processInstName");//流程实例名称
				  	var userIDs = $(obj).attr("userIDs");
				  	var doThingId = $(obj).attr("doThingId");
				  	var json = {currentActName:currentActName,workItemID:doThingId,processInstName:processInstName,doThingText:inputText,userIDs:userIDs};
				  	$.ajax({
				  		type:"post",
						dataType : 'json',
						data:json,
			  			url:"org.gocom.bps.wfclient.task.business.task.doThingTask.biz.ext",
			  			success:function(result){
			  				layer.closeAll();//关闭loading
			  				if(result.status == 0){
			            		layer.open({
								    content: '催办成功，发送微信提醒失败。',
								    skin: 'msg',
								    time: 2 //2秒后自动关闭
						 	 	});
			            	}else if(result.status == 2){
			            		layer.open({
								    content: '催办失败。',
								    skin: 'msg',
								    time: 2 //2秒后自动关闭
						 	 	});
			            	}else{
			            		layer.open({
								    content: '催办成功。',
								    skin: 'msg',
								    time: 2 //2秒后自动关闭
						 	 	});
			            	}
			  			}
				  	})
				  	
			    }
		  	});
		}
		event.stopPropagation();  
	}
	
	//改派
	function ressign(data){
	  	var json = {workItemID:workItemID ,personID:data.id, 
	  		catalogName:catalogName, currentActName:currentActName};
  		layer.open({
	 		type: 2,
	    	content: '改派中。。。',
	    	shadeClose: false,
	  	});
	  	$.ajax({
	  		type:"post",
			dataType : 'json',
			data:json,
  			url:"org.gocom.bps.wfclient.task.business.task.reassign.biz.ext",
  			success:function(result){
  				layer.closeAll();//关闭loading
  				if(result.result == '1'){
  					$("#search-select").select2("val", " ");
	  				layer.open({
						content: '改派成功。',
					    skin: 'msg',
					    time: 2, //2秒后自动关闭
					    success:function(){
					    	$(".contentBottom").fadeOut(300,function(){
								$(".contentTop").fadeIn(300);
								loadData();
							});
					    	
					    }
			 	 	});
  				}else{
	  				layer.open({
						content: '改派失败，联系信息技术部。',
					    skin: 'msg',
					    time: 2//2秒后自动关闭
			 	 	});
  				}
  			}
	  	})
	}
	
	//流程图
	function processImg(obj){
		var processInstID = $(obj).attr("processInstID");
		var processChName = $(obj).attr("processChName");
		window.location.href = '<%=request.getContextPath() %>/ame_mobile/processCenter/processInfo.jsp?processInstID='+processInstID+'&processChName='+processChName;
	}
	
	$('.cancle').on('click',function(){
		$(".contentBottom").fadeOut(300,function(){
			$(".contentTop").fadeIn(300);
		});
	})
	
	$('.ok').on('click',function(){
		var res = $("#search-select").select2('data')[0];
		if(res.id == ""){
			layer.open({
			    content: '请选择改派人。',
			    skin: 'msg',
			    time: 2 //2秒后自动关闭
	 	 	});
	  		return false;
	  	}
		ressign(res);
	})
	
	//关注
	function follow(obj,event){
		var html = "";
		var loadingHtml = "";
		var processInstID = $(obj).attr("processInstID");
	  	var id = $(obj).attr("id");
	  	var text = $(obj).text();
	  	if(text == "关注"){
	  		id = null;
	  		html = "是否进行关注？";
	  		loadingHtml = "正在关注。。。";
	  	}else{
	  		html = "是否取消关注？"
	  		loadingHtml = "正在取消关注。。。";
	  	}
		layer.open({
		    content: html,
		    btn: ['是', '否'],
		    skin: 'footer',
		    success:function(){
		    	$("#layui-m-layer0").on("touchmove",function(event){
			  		event.preventDefault();
			  		event.stopPropagation();
			  	})
		    },
		    yes: function(index){
		      	layer.close(index);
		      	layer.open({
	    	 		type: 2,
			    	content: loadingHtml,
			    	shadeClose: false,
			    	success:function(){
			    		$("#layui-m-layer0").on("touchmove",function(event){
					  		event.preventDefault();
					  		event.stopPropagation();
					  	})
			    	}
			  	});
			  	var json = {task:{processInstID:processInstID,id:id}};
			  	$.ajax({
			  		type:"post",
					dataType : 'json',
					data:JSON.stringify(json),
					async:false,
		  			url:"org.gocom.bps.wfclient.task.business.task.flowAttention.biz.ext",
		  			contentType: 'text/json',
		  			success:function(result){
		  				layer.closeAll();//关闭loading
		  				if(id == null){
					  		layer.open({
							    content: '关注成功',
							    skin: 'msg',
							    time: 2 //2秒后自动关闭
					 	 	});
					 	 	$(".btn"+processInstID).each(function(){
					 	 		$(this).text("取消关注");
					 	 	})
					  	}else{
					  		layer.open({
							    content: '取消成功',
							    skin: 'msg',
							    time: 2 //2秒后自动关闭
					 	 	});
					 	 	$(".btn"+processInstID).each(function(){
					 	 		$(this).text("关注");
					 	 	})
					  	}
		  			}
			  	})
		    }
	  	});
	}
	
	//执行
	function doTask(obj){
		var workItemID = $(obj).attr("workItemID");
		if(workItemID == null || workItemID == "null" || workItemID == ""){
			layer.open({
			    content: '该流程不存在工作项，请联系信息技术部。',
			    skin: 'msg',
			    time: 2 //2秒后自动关闭
	 	 	});
		}else{
			layer.open({
    	 		type: 2,
		    	content: 'Loading。。。',
		    	shadeClose: false,
			    success:function(){
		    		$("#layui-m-layer0").on("touchmove",function(event){
				  		event.preventDefault();
				  		event.stopPropagation();
				  	})
		    	}
		  	});
			$.ajax({
				type:"post",
				dataType : 'json',
				data:{workItemID:workItemID},
	  			url:"com.primeton.ame.processCenter.processCenter.dotingtasktest.biz.ext",
	  			success:function(result){
	  				layer.closeAll();//关闭loading
	  				var url = $(result.taskLink).attr("href");//获取  待办处理链接
	  				window.location.href = url;
	  			}
			});
		}
	}
	
	//下拉框
 	$("#search-select").select2({
  		placeholder: "请选择改派人",
      	allowClear:true,
      	ajax: {
	        url: "com.primeton.eos.ame_budget.budgetOrgManager.queryEmpByName.biz.ext",
	        dataType: 'json',
	        delay: 250,
	        openOnEnter:"true",
	        data: function (params) {
	          return {
	            name: params.term,
	          };
	        },
            processResults: function (data) {
                var arr = data.data;
                var empArr=[];
                for(item in arr){
                    empArr.push({id: arr[item].USERID, text: arr[item].EMPNAME});
                }
              	return {
                	results: empArr
              	};
            },
            cache: false
      	},
      	escapeMarkup: function (markup) { return markup; }, 
      	minimumInputLength: 2,
      	formatResult: function formatRepo(repo){
      		return repo.text;
      	}, // 函数用来渲染结果
      	formatSelection: function formatRepoSelection(repo){
      		return repo.text;
      	} // 函数用于呈现当前的选择
	});
	
</script>
</html>