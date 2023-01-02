<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<!-- 
  - Author(s): zhang-yb
  - Date: 2018-06-13 16:05:35
  - Description:
-->
<head>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<title>已办列表</title>
<style type="text/css">
	div.timeline div.spine{left:10% ;background:#b7c6ce;}
	.timelinefooter{line-height:50px;border-top: 1px solid #0000001a;text-align: right;}
	.timelinefooter button{margin: 0 10px;}
	.timelinefooter{color: #fff;}
	div.timeline .columns > li  div.timeline_element:after ,div.timeline .columns > li div.timeline_element:before{
	    display: none;
	}
	div.timeline .columns > li{width: 100% !important;}
	div.timeline .columns > li div.timeline_element{margin-left: 0 !important;margin-right: 0 !important;}
	div.timeline_element{margin:20px auto !important}
	.timeline_label{font-size: 16px;color:#b07e7e;white-space: nowrap;overflow: hidden;text-overflow: ellipsis;display: inline-block;width: 100%;}
	.cccccc{background-color: #F7DB70 !important;border-color: #F7DB70 !important;color: #000000 !important;}
	.dddddd{background-color: #EABEBF !important;border-color: #EABEBF !important;color: #000000 !important;}
	.eeeeee{background-color: #75CCEB !important;border-color: #75CCEB !important;color: #000000 !important;}
	.ffffff{background-color: #A5DEE5 !important;border-color: #A5DEE5 !important;color: #000000 !important;}
	.gggggg{background-color: #D6AEDC !important;border-color: #D6AEDC !important;color: #000000 !important;}
	ul li{list-style-type: none;}
	.content ul{padding: 0;border-top: 1px solid #0000001a;padding: 0px 5px;border-radius:5px 5px 5px 5px;}
	.content ul li{border:none;box-shadow:none;font-size: 14px;margin: 5px auto;}
	.content div{display: inline-block;width: 50%;}
	.processChName{font-size: 14px;}
	.tips{color: #7A7A7A;}
	.overSize{white-space: nowrap;overflow: hidden;text-overflow: ellipsis;}
</style>
</head>
<body>
<div id="timeline" class="demo1">
	<div class="timeline">
		<div class="spine"></div>
		<ul class="columns mescroll" id="mescroll">
			
		</ul>
	</div>
</div>
</body>
<script type="text/javascript">
	//高度初始化
	$(document).ready(function(){
		var wh = $(window).height();
		var h = $("#timeline").offset().top;
		h = wh-h-59;
		//$("#timeline").fadeIn(1000);
		$(".columns").height(h);
	})
	
	//定义上拉加载实例
	var mescroll = new MeScroll("mescroll", {
		up:{
			use: true,
			isBounce:false,
			callback:upCallback,
			auto:true
		},
		down: {
			use:false
		}
	});
	var bolen = true;//定义变量防止重复请求
	//查询已办列表
	function queryDoTheTask(pageIndex,processInstName){
		if(bolen){
			i = false;
			var json = {scope:"ALL",permisssion:"ALL","pageIndex":pageIndex,"processInstName":processInstName};
			$.ajax({
				type:"post",
				dataType : 'json',
				data:json,
	  			url:"com.primeton.ame.processCenter.processCenter.queryDoTheTask.biz.ext",
	  			success:function(result){
	  				bolen = true;
	  				mescroll.endUpScroll(false);
	  				var html = "";//已办列表
	  				if(result.tasks.length > 0){
	  					$.each(result.tasks,function(n,p){
	  						html = "";
	  						html += '<li style="display:none"><div class="timeline_element ffffff"><div class="timeline_title">';
							html += '<span class="timeline_label">'+result.tasks[n].workItemName+'-<span class="processChName">'+result.tasks[n].processChName+'</span></span></div>';				
							html += '<div class="content"><ul>';
							html += '<li><b style="margin-right: 5px;">任务处理:</b>'+result.tasks[n].endTime+'</li>';
							html += '<li><b style="margin-right: 5px;">流程实例:</b>'+result.tasks[n].processInstName+'</li>';
							if(typeof(result.tasks[n].currentActName) == "undefined"){
								html += '<li class="tips"><b style="margin-right: 5px;"><i class="fa fa-volume-down"></i></b>该流程已经结束！</li>';
							}else{
								html += '<li class="overSize"><b style="margin-right: 5px;">当前环节:</b>'+result.tasks[n].currentActName+'('+result.tasks[n].endTime.substring(0,16)+')</li>';
								html += '<li><b style="margin-right: 5px;">当前环节参与人:</b>'+result.tasks[n].currentActParti+'</li>';
							}
							html += '</ul></div><div class="timelinefooter">';
							if(typeof(result.tasks[n].currentActName) != "undefined"){
								if( result.tasks[n].id == null || result.tasks[n].id == ""){
									html += '<button type="button" class="btn btn-yellow btn'+result.tasks[n].processInstID+'" processInstID="'+ result.tasks[n].processInstID +'" id="'+ result.tasks[n].id +'" onclick="follow(this,event)">关注</button>';
								}else{
									html += '<button type="button" class="btn btn-yellow btn'+result.tasks[n].processInstID+'" processInstID="'+ result.tasks[n].processInstID +'" id="'+ result.tasks[n].id +'" onclick="follow(this,event)">取消关注</button>';
								}
								if(result.tasks[n].isPerson == "true"){
									html += '<button type="button" class="btn btn-yellow" currentActName="'+result.tasks[n].currentActName+'" processInstName="'+result.tasks[n].processInstName+'" userIDs="' + result.tasks[n].userIDs + '"  doThingId="'+result.tasks[n].doThingId+'"   onclick="operation(this,2,event)">催办</button>';
								}
							}
							html += '<button type="button" class="btn btn-yellow" processInstID="'+result.tasks[n].processInstID+'" processChName="'+result.tasks[n].processChName+'" onclick="processImg(this)">流程图</button></div></div></li>';
							$('.mescroll-upwarp').before(html);
	  					})
	  					$("#mescroll li").fadeIn(1000);
	  				}else{
	  					mescroll.showNoMore();
	  				}
	  				
	  			}
			})
		}else{
			return;
		}
	}
	/*上拉刷新的回调 */
	function upCallback(object){
		setTimeout(function () {
			queryDoTheTask((object.num-1)*object.size,object.processInstName);
		},50);
	}
</script>
</html>