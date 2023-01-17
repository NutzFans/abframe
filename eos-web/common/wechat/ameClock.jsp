<%@page import="com.primeton.ext.engine.component.LogicComponentFactory"%>
<%@page import="com.eos.engine.component.ILogicComponent"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="com.eos.runtime.core.TraceLoggerFactory"%>
<%@page import="com.eos.system.logging.Logger"%>
<%@page import="com.primeton.eos.ame_common.WeChatUtil"%>
<%@page import="org.json.simple.JSONValue"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.primeton.eos.ame_common.HttpClientUtil"%>
<%@page import="java.util.Map"%>
<%@page import="com.eos.foundation.eoscommon.BusinessDictUtil"%>
<%@page import="com.primeton.eos.ame_common.JsAPIUtil"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<!-- 
  - Author(s): shihao
  - Date: 2016-11-29 17:13:47
  - Description:
-->
<% 
    Logger log = TraceLoggerFactory.getLogger(this.getClass());
    /**
    * 逻辑：
    * 1.通过用户，获取用户信息，用户考勤规则，当天考勤信息
    * 2.通过获取的信息，初始化考勤规则
    */
	String code = request.getParameter("code");
	if(code==null){
		request.getAttribute("");
		log.info("code is null!");
	}else{
	    //由于已经登录过，code已经被使用过一次，所以，拿不到用户名
		//String userID = WeChatUtil.getUserInfo(code);
		UserObject user = (UserObject)request.getSession().getAttribute("userObject");
		String userID = user.getUserId();
		log.info("userID is"+userID);
		try{
			String componentName = "com.primeton.eos.ame_common.ameAttendance";
			// 逻辑流名称
			String logicName = "checkOutPerson";
			ILogicComponent comp = LogicComponentFactory.create(componentName);
	
			Object[] params = { userID };
			Object[] returnValues = null;
			returnValues = comp.invoke(logicName, params);
			String flag = (String)returnValues[0];
			if(flag.equals("false")){
				userID = "FAIL";
			}
		}catch(Throwable e){
			userID = "FAIL";
		} 
		//获取用户成功
		if(userID!=null && !userID.equals("FAIL") && !userID.equals("TOKEN_FAIL")){
	    	//必不可少，不然签名失败。
	    	String qs = request.getQueryString();
	    	String s = BusinessDictUtil.getDictName("AME_SYSCONF", "AMEPATH");
	    	String url = s+"common/wechat/ameClock.jsp";
	    	if(qs!=null && !qs.equals("")){
	    		url = url+"?"+qs;
	    	}
		    //签名
		    Map<String, String> map = JsAPIUtil.sign(url);
		    String appId = BusinessDictUtil.getDictName("AME_WE_CHAT", "CORP_ID");
		    String nonceStr = map.get("nonceStr");
		    String timestamp = map.get("timestamp");
		    String signature = map.get("signature");  
%>
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=yes">
	<title>微信签到</title>
	<link rel="stylesheet" href="../weui.css"/>
	<script type="text/javascript" src="js/moment.min.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript" src="js/clock.js"></script>
	<script>
	    //TIPS:由于规则的内容，需要优先加载，所以放在这里。
		//初始化考勤规则
	 	var rules =null;
	 	var userID = '<%=userID %>';
	 	getAttentionRule();
		function getAttentionRule(){
		 	var datas = {personID:userID};
		 	$.ajax({
	    	        type:"POST",
		            url: "com.primeton.eos.ame_common.ameAttendance.getAttendanceBypersonID.biz.ext",
		            dataType: 'json',
		            data: datas,
		            contentType : "application/x-www-form-urlencoded",
		            cache: false,
		            success: function (text) {
		            	//获取所有的规则，
		             	rules= text.attendanceRule;
		             	if(rules){
		             		var size = rules.length;
		             		for(var i=0;i<size;i++){
		             			var rule = rules[i]; 
		             			//设置考勤规则
		             			var option = "<option value='" + rule.projectno + "'>" + rule.projectname + "</option>"; ;
		             			//添加考勤规则
		             			$("#ruleSelect").append(option);
		             		}
		             		//根据考勤规则设置考勤时间
	             		    var managerid = rules[0].managerid;
	             		    var projectno = rules[0].projectno;
	             		    var ruleno = rules[0].ruleno;
	             		    var custid = rules[0].custid;
	             		    var outperno = rules[0].outperno;
							$("#managerid").val(managerid);
							$("#projectno").val(projectno);
							$("#ruleno").val(ruleno);
							$("#custid").val(custid);
							$("#outperno").val(outperno);
							
		             	}
		            }
			 });  
		}
		 
	</script>
	<style>
	  *{
		margin:0;
		padding:0;
	   }	

	.weui-flex_access {
	    border-bottom-style:solid;
	    border-bottom-width: thin;
	    border-bottom-color: #D9D9D9;
	  }
	 body{ 
	  	background:url(img/bg.jpg) no-repeat;
	  	background-size:100%;
	  	height:100%;
	  }
	 .signIn {
	 	height:40%;
	 }
	 .signInBtn {
	 	width: 35%;  
    	height: 5%;
	 	background:url(img/button-N.png) no-repeat;
	 	background-size:100% 100%;
	 }

	 .address_icon {
		width: 18px;  
    	height: 25px;
    	background:url(img/ad-icon.png) no-repeat;
    	background-size:13px 18px; 
	 }
	 .times_show {
	 	text-align:center;
	 	height: 20px;
	 	line-height: 100px;
	 	color:#f6f6f6
	 }
	 
	 .signText {
	 	text-align:center;
	 	height:20px;
	 	line-height:100px;
	 	color:#ffffff;
	 	font-size:21px;
	 }
	 hr {
	 	border-bottom-style:solid;
	    border-bottom-width: thin;
	    border-bottom-color: #D9D9D9;

	 }
	</style>
	
</head>

<body>
<div class="page">
    <div class="page__hd">
    </div>
    <div class="page__bd page__bd_spacing">
    	<div class="weui-panel weui-panel_access">
			<div class="weui-cells">
				<div class="weui-cell weui-cell_access">
			        <div class="weui-cell__bd" id="day_show" style="text-align:center;">
			            <!-- 当前日期+星期几 -->
			            <h4></h4>
			        </div>
			    </div>
				<div class="weui-cell weui-cell_select weui-cell_select-after">
	                <div class="weui-cell__hd">
	                    <label for="" class="weui-label">考勤项目</label>
	                </div>
	                <div class="weui-cell__bd" >
	                	<!-- 考勤规则 -->
	                    <select class="weui-select" id="ruleSelect" name="ruleSelect" onchange="changeRules()">
	                    </select>
	                </div>
	            </div>
			    
			</div>
		</div>
		<!-- 签到flex start -->
		<div id="signIn" class="signIn" style="margin-top:10px;">
			<!-- 显示地址的div -->
			<div id="address_show" style="margin-left:50px;margin-top:10px;position:relative">
				    <!-- 显示地址的图标 -->
					<img id="signInImg" src="img/ad-icon.png" style="width: 13px;height: 21px;position:absolute">
					<div id="signInAddress" style="margin-left:15px;display:block;height:25px"></div>
			</div>
			<div id="remark_show" style="margin-left:50px;">
			   <!-- 显示签到备注-->
			   <input class="weui-input" id="inRemark" placeholder="补充说明" style="border:1px solid #DfDfDf;width:75%;border-radius:8px;height:35px"/>
			</div>
			<canvas id="signInBtn_show" width="350px" height="150px">
			</canvas>
		</div>
		<!-- 签到flex end -->
		
		<!-- 我是华丽丽的分隔线 -->
		<div class="weui-flex_access"></div>
		<!-- 签退flex start -->
		<div id="signOut" class="signIn" >
			<!-- 显示地址的div -->
			<div id="address_show" style="margin-left:13%;margin-top:10px;position:relative">
				    <!-- 显示地址的图标 -->
					<img id="signOutImg" src="img/ad-icon.png" style="width: 13px;height: 21px;position:absolute">
					<div id="signOutAddress" style="margin-left:15px;height:25px"></div>
			</div>
			<div id="remark_show" style="margin-left:13%;">
			   <!-- 显示签退备注-->
			   <input class="weui-input" id="outRemark" placeholder="补充说明" style="border:1px solid #DfDfDf;width:75%;border-radius:8px;height:35px"/>
			</div>
			
			<!-- 签退按钮的div -->
			<canvas id="signOutBtn_show" width="350px" height="150px" >
			</canvas>
		</div>
		<!-- 签退flex end -->
    </div>   
</div>
   <!-- 汇报对象 -->
   <input type="hidden" id="managerid">
    <!--所在项目组的编号-->
   <input type="hidden" id="projectno">
   <!--对应的规则编号-->
   <input type="hidden" id="ruleno">
   <!--所在供应商-->
   <input type="hidden" id="custid">
   <!--外包人员ID-->
   <input type="hidden" id="outperno">
</body>
<script>
      /**  完整的逻辑
         	第一步：取得规则
         	第二步：设置规则项目组，设置考勤时间
         	第三步：获取考勤信息。
         	     1.如果有考勤信息，需要配置考勤成功的画布
         	     2.没有考勤信息，配置打卡按钮的画布
      */
      var now = new Date() ;
	  var nowYear = now.getFullYear() ; //年
	  var nowMonth = now.getMonth()+1<10?"0"+(now.getMonth()+1):now.getMonth()+1 ; //月
	  var nowDay = now.getDate()<10?"0"+now.getDate():now.getDate() ; //日期
	  var nowDate = nowYear+"-"+nowMonth+"-"+nowDay ;
	  //初始化星期
	  var day = new Array("周日", "周一", "周二", "周三", "周四", "周五", "周六");  
	  var week = now.getDay();
	  var show_week =  day[week];
	  $("#day_show h4").text(nowDate+"  "+show_week);
      initButtion();

	 
	 var  inFlag = false;
	 var  outFlag = false;
	 var outEndFlag = false;
	 var inRuleNo =null;
	 var outRuleNo =null;
	  //获取当前人员的考勤规则
	 
 
	 
	 
	 //微信JSAPI
	 var longitude = null; 
     var latitude = null;
     var address = null;
	 wx.config({
		    debug: false, 
		    appId: '<%=appId %>', 
		    timestamp: '<%=timestamp %>', 
		    nonceStr: '<%=nonceStr %>', 
		    signature: '<%=signature %>',
		    jsApiList: ['getLocation'] 
	 }); 
	  
	 wx.ready(function () {    
       wx.getLocation({
			    success: function (res) {
			       longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
			       latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
			       var speed = res.speed; // 速度，以米/每秒计,暂时没用
			       var accuracy = res.accuracy; // 位置精度
			       getLocation(longitude,latitude);
			    },
			    cancel: function (res) {
			        alert('用户拒绝授权获取地理位置');
			    },
			   fail: function (res) {
			        alert(JSON.stringify(res));
			   }
		}); 
		
     }); 

     initClockData();
     function initClockData(projectNo){
     	intradayClock(projectNo); 
     }
	
     //根据经度，纬度获取地理位置
     function getLocation(longitude,latitude){
     	var datas = {longitude:longitude,latitude:latitude};
     	$.ajax({
    	        type:"POST",
	            url: "com.primeton.eos.ame_common.ameAttendance.getLocationByGPS.biz.ext",
	            dataType: 'json',
	            data: datas,
	            contentType : "application/x-www-form-urlencoded",
	            cache: false,
	            success: function (text) {
	                //获取当前地址
	             	var location = text.location;
	             	if(location){
	             		//先判断是否有签到/签退信息
	             		var address_in = $("#address_sign").val();
	             		address = location;
	             		if(!inFlag){
     						$("#signInAddress").append(address);
     						 canvasIn();
	             		    showText(ctx_in,"签到"); 
	             		}
	             		var address_out = $("#address_signOut").val();
	             		if(!outFlag){
		             		//左对齐
						 	 $("#signOutAddress").append(address);
						 	 canvasOut();
						 	 showText(ctx_out,"签退");
	             			
	             		}
	             	}
	            }
		 });  
     }
     
     function close(){
     	//关闭微信浏览器
		WeixinJSBridge.invoke('closeWindow');
	 }
     
     //改变
     function changeRules(){
     	var ruleNo = $("#ruleSelect").val();
        if(rules){
           var size = rules.length;
          for(var i=0;i<size;i++){
          	var rule = rules[i];
          	if(rule.projectno==ruleNo){
				$("#managerid").val(rule.managerid);
				$("#projectno").val(rule.projectno);
				$("#ruleno").val(rule.ruleno);
				initButtion();
				inFlag = false;
	 			outFlag = false;
	 			//$("#signInBtn_show").removeAttr("onclick");
				initClockData(rule.projectno);
				
          	}
          }
        }
     }
     
     $(canvas_in).click(function(e) {
         //如果是已近签到，则不响应事件
         if(inFlag){
         	return false;
         }else{
	         var x = e.offsetX;
	         var y = e.offsetY;
	         var c_x = 180;
	         var c_y = 80;
	         var c_Z = 65;
	         
	         var distanceX = Math.abs(x-c_x);
	         var distanceY = Math.abs(y-c_y);
	         var distanceC = Math.pow(c_Z,2);
	         //根据勾股定理，计算2点的距离
	         var distanceZ = Math.pow(distanceX,2)+Math.pow(distanceY,2);
	         if(distanceZ>distanceC){
	            //不在画布的圆范围内
	          	return false;
	         }else{
	            //在画布的圆范围内
	         	signIn();
	         }
         }
	});
	  
	 function signIn(){
	    if(longitude==null||latitude==null){
	    	alert("请稍后，正在获取地理位置");
	    	return false;
	    }
	    var date = new Date();
	    var time = moment(date).format('HH:mm');
	    if(!confirm("  确认考勤签到吗？\r[考勤时间:"+time+","+"考勤地点:"+address+"]")){
	    	return false;
	    }
	    //项目组编号
	 	var projectNO = $("#ruleSelect").val();
	 	var inRemark = $("#inRemark").val();
	 	var managerid = $("#managerid").val();
	 	var ruleNO = $("#ruleno").val();
	 	var custID = $("#custid").val();
	 	var outperno = $("#outperno").val();
	 	if(!ruleNO){
	    	alert("考勤规则缺失，请项目经理确认。");
	    	return false;
	    }
	    if(!managerid){
	    	alert("项目组汇报对象缺失，请确认。");
	    	return false;
	    }
	    
	    var datas = {
            ruleNO:ruleNO,
        	longitude:longitude,
        	latitude:latitude,
        	managerid:managerid,
        	remark:inRemark,
        	address:address,
        	projectNo:projectNO,
        	custID:custID,
        	outperno:outperno,
        	type:'1'
        };
		sign(datas);
	 }
	 
	 //画布事件监听
	 $(canvas_out).click(function(e) {
         //如果是已近签到，则不响应事件
         if(outFlag){
         	return false;
         }else{
	         var x = e.offsetX;
	         var y = e.offsetY;
	         var c_x = 180;
	         var c_y = 80;
	         var c_Z = 65;
	         
	         var distanceX = Math.abs(x-c_x);
	         var distanceY = Math.abs(y-c_y);
	         var distanceC = Math.pow(c_Z,2);
	         //根据勾股定理，计算2点的距离
	         var distanceZ = Math.pow(distanceX,2)+Math.pow(distanceY,2);
	         if(distanceZ>distanceC){
	            //不在画布的圆范围内
	          	return false;
	         }else{
	            //不在画布的圆范围内
	         	signOut();
	         }
         }
	});
	 
	 function signOut(){
	    if(outEndFlag){
	    	outEndFlag = false;
	    }
	 	if(longitude==null||latitude==null){
	 		outEndFlag = true;
	    	alert("请稍后，正在获取地理位置");
	    	return false;
	    }
	    var date = new Date();
	    var time = moment(date).format('HH:mm');
	    if(!confirm("  确认考勤签退吗？\r[考勤时间:"+time+","+"考勤地点:"+address+"]")){
	    	outEndFlag = true;
	    	return false;
	    }
	    
	 	$("#signOut_ab").attr({"disabled":"disabled"});
	 	//考勤规则
	 	var projectNO = $("#ruleSelect").val();
	 	var outRemark = $("#outRemark").val();
	 	//汇报对象
	 	var managerid = $("#managerid").val();
	 	var ruleNO = $("#ruleno").val();
	 	var custID = $("#custid").val();
	 	var outperno = $("#outperno").val();
	 	if(!ruleNO){
	    	alert("考勤规则缺失，请项目经理确认。");
	    	return false;
	    }
	    if(!managerid){
	    	alert("项目组汇报对象缺失，请确认。");
	    	return false;
	    }  
	 	//签退按钮隐藏
	 	var datas = {
            ruleNO:ruleNO,
        	longitude:longitude,
        	latitude:latitude,
        	userID:userID,
        	managerid:managerid,
        	remark:outRemark,
        	projectNo:projectNO,
        	custID:custID,
        	outperno:outperno,
        	address:address,
        	type:'2'
        };
	 	sign(datas);
	 }
	 
	
	 
	//根据项目组获取当天的考勤信息
	function intradayClock(projectNO){
	 	var datas = {personID:userID,projectNo:projectNO};
	 	$.ajax({
    	        type:"POST",
	            url: "com.primeton.eos.ame_common.weChatPlatform.getIntradayClock.biz.ext",
	            dataType: 'json',
	            data: datas,
	            contentType : "application/x-www-form-urlencoded",
	            cache: false,
	            success: function (text) {
	             	var clocks= text.clocks;
	             	if(clocks){
	             	  //需要修改按钮
	             	  var size = clocks.length;
	             	  //如果有多个项目，取最后一条记录来进行考勤
	             	  //TIPS：要考虑工作时间重复的情况
	             	  var clock;
	             	  if(size>1){
	             	  	 clock = clocks[size-1];
	             	  }else if(size=1){
	             	  	clock = clocks[0];
	             	  }
	             	  //初始化考勤信息
	             	  if(clock){
	             	  	clockInDetail(clock);
	             	  	clockOutDetail(clock);
	             	  }
	             	  /* for(var i=0;i<size;i++){
	             	  	var clock = clocks[i];
	             	  	if(clock.clocktype=='1'){
	             	  		inFlag = true;//存在签到的考勤
	             	  	    clockInDetail(clock);
	             	  	    
	             	  	}else if(clock.clocktype=='2'){
	             	  		outFlag = true;//存在签退的考勤
	             	  	   clockOutDetail(clock);
	             	  	  
	             	  	}
	             	  } */
	             	  if(size==0){//当天没有考勤信息
	             	  	canvasIn();
	             		showText(ctx_out,"签退");
	             		canvasOut();
	             		showText(ctx_in,"签到");
	             	  }
	             	}
	            }
		});  
	}
	
	//签到详情显示
	function clockInDetail(clock){
	 	if(clock.INTIME){
	 		inFlag = true;
	 		inRuleNo  = clock.PROJECTNO;
		    //设置考勤规则
			$("#ruleSelect option[value='"+inRuleNo+"']").attr("select","selected");
			//当有考勤后，将规则置为不可选，保证当天只在一个地方。
			//$("#ruleSelect").attr("disabled","disabled");  
			//格式化签到时间
			var time = timeFormat(clock.INTIME);
			//签到成功画布
			canvasInSucc(time);
			//显示地理位置
			$("#signInAddress").empty();
			$("#signInAddress").append(clock.INLOCATION);
			//如果有备注，就显示备注，没有就显示“无”
		 	if(clock.INREMARK){
		 	    $("#inRemark").val(clock.INREMARK);
		 	}
		 	//将录入框设置为只读
		 	$("#inRemark").attr({"readonly":"readonly"});
		 	//去掉打卡画布的onclick事件
		    //$("#signInBtn_show").removeAttr("onclick");
	 	}
	 	
	}
	
	//格式化考勤时间
	function timeFormat(time){
		//是24小时格式，如果想改格式，请参考moment插件的格式化方法
		var m = moment(time).format('HH:mm');
		return m;
	}
	
	//签退详情显示
	function clockOutDetail(clock){
		if(clock.OUTTIME){
			outFlag = true;//存在签退的考勤
			outRuleNo =clock.PROJECTNO;
			//$("#ruleSelect").val(outRuleNo);
			$("#ruleSelect").find("option[value='"+outRuleNo+"']").attr("selected",true);
		    //格式化签退时间
			var time = timeFormat(clock.OUTTIME);
			//重置签退成功画布（按钮与时间显示）
			canvasOutSucc(time);
			//设置签退地理位置（可忽略，因为打卡的时候，会初始化，初始化的值会传给后台）
			$("#signOutAddress").empty();//清空考勤地址
			$("#signOutAddress").append(clock.OUTLOCATION);
			//设置签退的备注
		 	if(clock.OUTREMARK){
		 		$("#outRemark").val(clock.OUTREMARK);
		 	}
		    //设置成只读
		    $("#outRemark").attr({"readonly":"readonly"});
		    //去掉签退画布（按钮）的onclick事件，这里如果去掉这个onclick事件，将不能再次启用，用flag来控制即可。
		    //$("#signOutBtn_show").removeAttr("onclick");
	    }
	}


	//打卡，上报信息
    function sign(datas){
        //将签到信息，传给Ame+后台
    	$.ajax({
    	        type:"POST",
	            url: "com.primeton.eos.ame_common.weChatPlatform.punchClockNew.biz.ext",
	            dataType: 'json',
	            data: datas,
	            contentType : "application/x-www-form-urlencoded",
	            cache: false,
	            success: function (text) {
	             	var status= text.status;
	             	var tips = text.tips;
	             	
	             	if(status=='0'){//成功
		             	var location = text.location;
		             	var time = text.time;
					 	//如果type=1,修改签到按钮的文本与地址
					 	//1:签到，2:签退
					 	if(datas.type=='1'){
					 		//重新设置画布
					 		canvasInSucc(time);
					 		if(datas.remark){
						 		$("#inRemark").text(datas.remark);
						 	}
						 	//设置为只读
	 						$("#inRemark").attr({"readonly":"readonly"});
						 	alert('签到成功');
					 	}else{//如果type=2,修改签推的页面
					 		canvasOutSucc(time);
						 	
						 	if(datas.remark){
						 		$("#outRemark").text(datas.remark);
						 	}
						 	$("#outRemark").attr({"readonly":"readonly"});
						 	alert('签退成功');
					 	}
	             	}else{//
	             	 	alert(tips);
	             	}
	            }
		});  
    }
</script>
<%
		}else{//用户获取不到
%>
			<div class="page__bd page__bd_spacing" style="margin-top:38%;">
				    <div class="icon-box" align="center">
			            <i class="weui-icon-info weui-icon_msg"></i>
			            <div class="icon-box__ctn">
			                <h5 class="icon-box__title" >你没有权限访问该页面!</h5>
			            </div>
		        	</div>
		        </div>
<%		}
	}
 %>

</html>