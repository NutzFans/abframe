<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="com.primeton.eos.ame_common.WeChatUtil"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<!-- 
  - Author(s): shihao
  - Date: 2016-12-29 15:14:38
  - Description:考勤详情页面
-->
<head>
<title>考勤详情</title>
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=yes">
<link rel="stylesheet" href="../weui.css"/>
<link rel="stylesheet" href="style/fullcalendar.min.css"/>
<!--media不能删-->
<link rel="stylesheet" href="style/fullcalendar.print.min.css" media='print' />
<!--moment.min.js和 fullcalendar.min.js引用的顺序不能倒置-->
<script type="text/javascript" src="js/moment.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/fullcalendar.min.js"></script>
<style>
	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 100%;
		margin: 0 auto;
		max-height: 100%;
	}
	
	.fc-ltr .fc-basic-view .fc-other-month {
     	color: trnasparent;
	}
</style>
</head>
<body>
<% 
	String code = request.getParameter("code");
	UserObject user = (UserObject)request.getSession().getAttribute("userObject");
	String userID = user.getUserId();
	if(code==null){
%>	
		<div class="page__bd page__bd_spacing" style="margin-top:38%;">
				    <div class="icon-box" align="center">
			            <i class="weui-icon-info weui-icon_msg"></i>
			            <div class="icon-box__ctn">
			                <h5 class="icon-box__title" >你没有权限访问该页面</h5>
			            </div>
		        	</div>
		        </div>
<%		        
	}else{
	    if(userID!=null){
%>
<script>
     //当天
    var now = new Date();
    var clockDetail = null;
    var personID = <%=userID %>;
	var sc_h = document.documentElement.clientHeight;
	$(document).ready(function() {
	   $('#calendar').fullCalendar({
			buttonText:{
				 	today:    '今天'
				 },
			dayNames: ["星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"],
			dayNamesShort:['日', '一', '二', '三', '四', '五', '六'],
			monthNames:['一月','二月', '三月', '四月', '五月', '六月', '七月',
			            '八月', '九月', '十月', '十一月', '十二月'],
			height: 430,
			defaultDate: now,
			weekMode: 'liquid',
			timeFormat:'H:mm',//默认是h:mm(h:mm,这个是12小时，上午用a，下午用p),H:mm是24小时
			editable: true,
			eventLimit: 2, //boolean型或者int型
			eventColor: '#378006',
			events:function(start, end, timezone, callback) {
					//获取当前月
			 		var date = this.getDate().format('YYYY-MM');
			        var eventArray = [];
			        var startDate = moment(start).format("YYYY-MM-DD");
			        var endDate = moment(end).format("YYYY-MM-DD");
			        var datas = {personID:personID,startDate:startDate,endDate:endDate,currentMonth:date+"-01"};
					$.ajax({
			    	        type:"POST",
				            url: "com.primeton.eos.ame_common.weChatPlatform.getCurrentMonthClocks.biz.ext",
				            dataType: 'json',
				            data: datas,
				            contentType : "application/x-www-form-urlencoded",
				            cache: false,
				            success: function (text) {
				            	var fullClock = text.fullClock;
				            	var late = text.late;
				            	var early = text.early;
				            	var actWorkDays = text.actWorkDays;
				            	var workDays   = text.workDays;
				            	//var misClock = text.misClock;
				            	$("#fullClock").text(fullClock+'天');
				            	$("#actWorkDays").text(actWorkDays+'天');
				            	$("#late").text(late+'次');
				            	$("#early").text(early+'次');
				            	$("#workDays").text(workDays+'天');
				            	//获取所有的考勤信息，
				             	var clocks= text.clocks;
				             	if(clocks){
				             		var size = clocks.length;
				             		for(var i=0;i<size;i++){
				             			var clock = clocks[i]; 
				             			var signid = clock.SIGNID;
				             			//var clocktype = clock.clocktype;
				             			var time = clock.clocktime;
				             			var inTime = clock.INTIME;
				             			var outTime = clock.OUTTIME;
				             			var inFlag = clock.INFLAG;
				             			var outFlag = clock.OUTFLAG;
				             			//存在上班考勤
				             			if(inTime){
				             				var title="上";
				             				if(inFlag=='0'){
					             			   var event = {
					             				id   :signid+"_1",
					             				title:title,
					             				start:inTime
					             				}
					             				eventArray.push(event);
					             			}else{
					             			    //如果迟到或者，标志红色字体
					             				var event = {
						             				id   :signid+"_1",
						             				title:title,
						             				start:inTime,
						             				textColor:'red'
					             				}
					             				eventArray.push(event);
					             			}
				             			}
				             			if(outTime){
				             				var title="下";
				             				if(outFlag=='0'){
					             			   var event = {
						             				id   :signid+"_2",
						             				title:title,
						             				start:outTime
					             				}
					             				eventArray.push(event);
					             			}else{
					             			    //如果迟到或者，标志红色字体
					             				var event = {
						             				id   :signid+"_2",
						             				title:title,
						             				start:outTime,
						             				textColor:'red'
					             				}
					             				eventArray.push(event);
					             			}
				             			}
				             		}
				             		callback(eventArray);
				             	}
				            }
					}); 
			} 
		});
	});
	
</script>

	<div id='calendar'></div>
	<!-- <div class="page__bd"> -->
		<div class="weui-cells__title" style="background-Color:#DCDCDC;text-align:center;">当月考勤汇总</div>
	        <div class="weui-cells weui-cells_form">
	        	<div class="weui-cell">
	                <div class="weui-cell__hd">
	                	<label class="weui-label">当月工作日</label>
	                </div>
	                <div class="weui-cell__bd" style="text-align:right;">
	                	<label id="workDays" class="weui-label"></label>
	                </div>
	            </div>
	            <div class="weui-cell">
	                <div class="weui-cell__hd">
	                	<label class="weui-label">总共打卡</label>
	                </div>
	                <div id="" class="weui-cell__bd" style="text-align:right;">
	                	<label id="actWorkDays" class="weui-label"></label>
	                </div>
	            </div>
	            <div class="weui-cell">
	                <div class="weui-cell__hd">
	                    <label class="weui-label">完整考勤</label>
	                </div>
	                <div class="weui-cell__bd" style="text-align:right;">
	                    <label id="fullClock" class="weui-label"></label>
	                </div>
	            </div>
	            <div class="weui-cell">
	                <div class="weui-cell__hd">
	                	<label for="" class="weui-label">迟到</label>
	                </div>
	                <div class="weui-cell__bd" style="text-align:right;">
	                	<label id="late" class="weui-label"></label>
	                </div>
	            </div>
	            <div class="weui-cell">
	                <div class="weui-cell__hd">
	                	<label for="" class="weui-label">早退</label>
	                </div>
	                <div class="weui-cell__bd" style="text-align:right;">
	                	<label id="early" class="weui-label"></label>
	                </div>
	            </div>
	           <!--    -->
	        </div>
	  <!-- </div> -->
<% 
			//假如userID不为空。
			}else{
%>	
		<div class="page__bd page__bd_spacing" style="margin-top:38%;">
				    <div class="icon-box" align="center">
			            <i class="weui-icon-info weui-icon_msg"></i>
			            <div class="icon-box__ctn">
			                <h5 class="icon-box__title" >你没有权限访问该页面</h5>
			            </div>
		        	</div>
		        </div>
<%				
			}
			
	  	}//code不为空

%>
</body>
</html>