<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<h:script src="/common/javascripts/eos-verifyCode.js"/>
<h:script src="/common/nui/jquery/jquery-1.8.1.min.js"/>
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2017-07-24 10:46:54
  - Description:
-->
<%@page import="org.gocom.abframe.auth.bizlet.LogonUtil"%>
<head>
	<title>Clip-One - Responsive Admin Template</title>
		<!-- start: META -->
		<meta charset="utf-8" />
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
		<!-- end: META -->
		<!-- start: MAIN CSS -->
		<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/fonts/style.css">
		<link rel="stylesheet" href="assets/css/main.css">
		<!--[if IE 7]>
		<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome-ie7.min.css">
		<![endif]-->
		<!-- end: MAIN CSS -->
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<link rel="stylesheet" href="assets/plugins/ladda-bootstrap/dist/ladda-themeless.min.css">
		<link rel="stylesheet" href="assets/plugins/bootstrap-switch/static/stylesheets/bootstrap-switch.css">
		<link rel="stylesheet" href="assets/plugins/bootstrap-social-buttons/social-buttons-3.css">
	<style>
	.button1
	{
	   background:#ee8322;
		border-radius:1px;
		width:100%;
		height:100%;
		cursor: pointer; -webkit-appearance: none;
	}
	.bgpic {
    background-image: url('/default/ame_newlook/newlogin/image/zzbj.png');
    background-size: cover;
    filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(
    src='/default/ame_newlook/newlogin/image/zzbj.png',
    sizingMethod='scale');
}
    </style>
</head>
<%
  String pstatus = (String)session.getAttribute("pstatus");
  String failMsg = (String)request.getAttribute("loginFailure");
  UserObject uo = (UserObject)session.getAttribute("userObject");
  boolean flag = uo!=null;
  /* if(flag){
  	response.sendRedirect("ame_newlook/newlook/menu.jsp");
  }  */
 %>
<body style = "margin:0;padding:0;text-align:center">
	 <form id="loginForm" checkType="blur" method="post" style="top:0px;left:0px;width: 100%;height: 100%;background-size:100% 100%;margin: 0 auto;">
	 	<input type="hidden" name="_eosFlowAction" value="login">
		<input type='hidden' name='loginPage' value='<%=request.getAttribute("loginPage")%>'>   
		<input type='hidden' name='service' value='<%=request.getAttribute("service")%>'>
		 <div class = "bgpic" style="top:0px;left:0px;width: 100%;height: 100%;background-size:100% 100%;margin: 0 auto;">
			 <div  style="position:relative;background-image: url(/default/ame_newlook/newlogin/image/gp.png);top:0px;width:320px;height: 550px;margin: 0 auto;text-align: center;">
			 	<div style="position:absolute;width:132px;height: 28px;top:31.5%;left:31.5%"><span style = "font-family:.PingFang-SC-Medium;font-size:26px;color:#ffffff;letter-spacing:0.31px;text-align:center;">普元阿米加</span></div>
			 	<div class="col-sm" style="position:absolute;width:230px;height: 30px;top:51%;left:15%;z-index: 2;">
					<span class="input-icon">
						<input type="text" placeholder="帐号" id="username" name = "username"  class="form-control">
						<i class="fa fa-user"></i> </span>
				</div>
			 	<div class="col-sm" style="position:absolute;width:230px;height: 30px;top:58%;left:15%;z-index: 2;">
					<span class="input-icon">
					<input type="password" id="password" property="password"  placeholder="密码" id="form-field-2" class="form-control">
					<i class="clip-locked"></i> </span>
				</div>
			 	<div style="position:absolute;width:145px;height: 19px;top:68%;left:15%;z-index: 1;"><h:verifyCode name="verifyCode"  style = "width:45%;height:25px;background:#eff4f8;border:1px solid #8899a6;"/></div>
			 	<div style="position:absolute;width:57px;height: 16px;top:68%;left:68%;z-index: 1;"><span style = "font-family:PingFangSC-Regular;font-size:14px;color:#666666;letter-spacing:0.16px;text-align:center;">忘记密码</span></div>
			 	<button id="login_btn" data-style="expand-right" class="btn btn-bricky btn-lg" style="position:absolute;width:230px;height:40px;top:78%;left:15%;z-index: 1;">
					<span class="ladda-label"> 登录 </span>
					<i class="fa fa-arrow-circle-right"></i>
				</button>
			 	<!-- <div style="position:absolute;width:41px;height:30px;top:76%;left:42%;z-index: 2;"><span style = "font-family:.PingFang-SC-Medium;font-size:20px;color:#ffffff;letter-spacing:0.24px;text-align: center;width: 100%;height: 100%">登录</span></div> -->
			 	<div style="position:absolute;width:151px;height:30px;top:42%;left:25%;z-index: 1;" id="vError"></div>
			 	<div style="position:absolute;width:188px;height: 16px;top:91.5%;left:23%"><span style = "font-family:.PingFang-SC-Medium;font-size:14px;color:#ffffff;letter-spacing:0.16px;text-align:center;">Copyright©2017 primeton</span></div>
			 </div>
		 </div>
	</form>
</body>
<script type="text/javascript">
	 /*
	  * 功能：初始化页面
	  *
	  *
	  */
     function custInit(){
     	//初始化焦点
     	<l:notPresent property="retCode">
     	    $id("username").focus();
     	</l:notPresent>
     	<l:present property="retCode">        
	     	<l:equal property="retCode" targetValue="-1">
	     	    $id("username").focus();
	     	</l:equal>
	     	<l:equal property="retCode" targetValue="-2">
	     	   $id("password").focus();
	     	</l:equal>
     	</l:present>     	     	
     }
     
	 //初始化页面按钮样式
     eventManager.add(window,"load",custInit);
     
      //用来提示内容
     var pstatus = '<%=pstatus %>';
     if(pstatus){
	     if(pstatus==1){
	     	$("#vError").append("<font color='red'>验证码错误</font>");
	     }
     }
     var fmsg = '<%=failMsg %>';
     if(fmsg !=null && fmsg !="null"){
     	$("#vError").append("<font color='red'>请输入正确的用户名和密码</font>");
     }
     
     $(function(){
     	$("#login_btn").click(function(){
     		 //用户名密码
     		 var form = document.getElementById("loginForm");
     		 //$("#loginForm");这里用jquery的方式不可行。
     		 if(!checkForm(form)){
     		    return false;
     		 }
     		 var verifyCodeFlag = '<%=LogonUtil.useVerifyCode() %>';
     		 var vcode = '';
     		 if(verifyCodeFlag){
     		 	vcode = $("input[name='verifyCode']").val();
     		 }
			 var pw = $("#password").val();
			 var username = $("#username").val();
     		  if(!username){
     		 	$('#vError').empty();
     		 	$("#vError").append("<font color='red'>帐号不能为空</font>");
     		 	$id("username").focus();
     		 	return false;
     		 }
			 if(!pw){
     		 	$('#vError').empty();
     		 	$("#vError").append("<font color='red'>密码不能为空</font>");
     		 	$id("password").focus();
     		 	return false;
     		 }
     		 if(!vcode){
     		 	$('#vError').empty();
     		 	$("#vError").append("<font color='red'>验证码不能为空</font>");
     		 	$name("verifyCode").focus();
     		 	return false;
     		 }
			 var datas = {code:vcode,password:pw,flag:verifyCodeFlag};
	         $.ajax({
	          	url:"/default/org.gocom.abframe.auth.LoginManager.verifyCode.biz.ext",
				type : "POST",
				dataType : "json",
				contentType : "application/x-www-form-urlencoded",
				data : datas,
				cache: false,
				async : false,
				success : function(response) {
				    var status = response.status;
					if(status=='1'){
					   //刷新页面
					   location.reload();
					  /* 用来模拟点击图片事件
					  var img_o = $("div > img")[0];
					  img_o.click();
					  $("#vError").append("<font color='red'>验证码错误</font>"); 
					  */
					  return false;
					}else{
						$("#loginForm").submit();
					}
				},
				error : function(response) {
					location.reload();
				}

	          
	         })     
	　　});
	 });
	 //登录按钮，实现Enter键，进行提交
	 $(document).keyup(function(event){  
		  if(event.keyCode ==13){  
		    $("#login_btn").trigger("click");  
		  }  
	 }); 
</script>
</html>



