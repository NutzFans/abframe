<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<h:script src="/common/javascripts/eos-verifyCode.js" />
<h:script src="/common/nui/jquery/jquery-1.8.1.min.js" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2017-07-24 10:46:54
  - Description:
-->
<%@page import="org.gocom.abframe.auth.bizlet.LogonUtil"%>
<head>
<title>中核咨询企业经营管理系统</title>
<!-- start: META -->
<meta charset="utf-8" />
<!--[if IE]>
<meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" />
<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta content="" name="description" />
<meta content="" name="author" />
<!-- end: META -->
<!-- start: MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/ame/login/js/need/layer.css">
<link rel="stylesheet" href="/default/ame/clipview/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/default/ame/clipview/assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/default/ame/clipview/assets/fonts/style.css">
<link rel="stylesheet" href="/default/ame/clipview/assets/css/main.css">
<!--[if IE 7]>
<link rel="stylesheet" href="/default/ame/clipview/assets/plugins/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
<!-- end: MAIN CSS -->
<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
<link rel="stylesheet" href="/default/ame/clipview/assets/plugins/ladda-bootstrap/dist/ladda-themeless.min.css">
<link rel="stylesheet" href="/default/ame/clipview/assets/plugins/bootstrap-switch/static/stylesheets/bootstrap-switch.css">
<link rel="stylesheet" href="/default/ame/clipview/assets/plugins/bootstrap-social-buttons/social-buttons-3.css">
<link rel="shortcut icon" href="/default/ame/clipview/assets/images/title_logo.png" />
<style>
.button1 {
	background: #ee8322;
	border-radius: 1px;
	width: 100%;
	height: 100%;
	cursor: pointer;
	-webkit-appearance: none;
}
.chageImg:hover{
	width:30px !important;
	cursor:pointer;
}

.bgpic {
	background-image: url('/default/ame/login/image/backgroundimg.png');
	background-size: cover;
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(
    src='/default/ame/login/image/backgroundimg.png', sizingMethod='scale');
}
#box{
	height:230px;
	overflow:hidden;
}
</style>
</head>
<%
	String pstatus = (String) session.getAttribute("pstatus");
	String failMsg = (String) request.getAttribute("loginFailure");
	UserObject uo = (UserObject) session.getAttribute("userObject");
	boolean flag = uo != null;
	/* if(flag){
		response.sendRedirect("ame/clipview/menu.jsp");
	}  */
%>
<body style="margin:0;padding: 0;text-align: center;">
	<form id="loginForm" checkType="blur" method="post" style="top: 0px; left: 0px; width: 100%; height: 100%; background-size: 100% 100%; margin: 0 auto;">
		<input type="hidden" name="_eosFlowAction" value="login">
		<input type='hidden' name='loginPage' value='<%=request.getAttribute("loginPage")%>'> 
		<input type='hidden' name='service' value='<%=request.getAttribute("service")%>'>
		<div class="bgpic" style="top: 0px; left: 0px; width: 100%; height: 100%; background-size: 100% 100%; margin: 0 auto;">
			<div style="position: relative; background-image: url(/default/ame/login/image/gp1.png); top: 0px; width: 320px; height: 600px; margin: 0 auto; text-align: center;">
				<div style="position: absolute; top: 29.5%; left: 13.5%">
					<img style='width:30px;' src="/default/ame/login/image/ame_logo.png">
				</div>
				<div style="position: absolute; width: 100%;height: 48px; top: 27.9%;left: 0%;line-height:48px;text-align:center">
					<span style="font-family: .PingFang-SC-Medium;font-size: 20px; color: #ffffff; letter-spacing: 0.31px; text-align: center;">中核咨询企业经营</span>
				</div>
				<div class="changeHalf"></div>
				<div class="pcLojin">
					<div style="position: absolute; top: 40%; left: 50%; margin-left: -40px;">
						<img src="/default/ame/login/image/yuanbao1.jpg" id="myimg" class="circle-img" alt="" style="width: 80px; height: 80px; border-radius: 10% 10% 10% 10%; border: 1px solid #617782;">
					</div>
					<div class="col-sm" style="position: absolute; width: 230px; height: 30px; top: 57%; left: 15%; z-index: 2;">
						<span class="input-icon"> <input type="text" placeholder="帐号" id="username" name="username" class="form-control">
							<i class="fa fa-user"></i>
						</span>
					</div>
					<div class="col-sm" style="position: absolute; width: 230px; height: 30px; top: 65%; left: 15%; z-index: 2;">
						<span class="input-icon"> 
							<input type="password" id="password" property="password" name="password" placeholder="密码" class="form-control"> 
							<i class="clip-locked"></i>
						</span>
					</div>
					<div class='yz' style="position: absolute; width: 145px; height: 19px; top: 73%; left: 15%; z-index: 1;">
						<h:verifyCode name="verifyCode" style="width:45%;height:25px;background:#eff4f8;border:1px solid #8899a6;" />
					</div>
					<div style="position: absolute; width: 57px; height: 16px; top: 73%; left: 68%; z-index: 1;">
						<a href="javascript:void(0)" onclick="doView();">
							<span style="font-family: PingFangSC-Regular; font-size: 14px; color: #666666; letter-spacing: 0.16px; text-align: center;">忘记密码</span>
						</a>
					</div>
					<button type="button" id="login_btn" data-style="expand-right" class="btn btn-bricky btn-lg" style="position: absolute; width: 230px; height: 40px; top: 80%; left: 15%; z-index: 1;">
						<span class="ladda-label"> 登录 </span> 
						<i class="fa fa-arrow-circle-right"></i>
					</button>
				</div>
				<div class="wxLojin" style="display:none;">
					<div style="position: absolute; width: 80%; top: 40%; left: 4%">
						<div id="box">
							<img style='width:140px;margin:10px auto;' alt="" src="/default/ame/login/image/ame.jpg">
						</div>
						<div style="color:#9c9c9c;margin-left:15%;"><img style='width:30px;vertical-align: middle;' src="/default/ame/login/image/saoYsao.png">&nbsp;打开<span style="color:#f40;">&nbsp;企业微信&nbsp;</span>扫一扫登录</div>
					</div>
				</div>
				<!-- <div style="position:absolute;width:41px;height:30px;top:76%;left:42%;z-index: 2;"><span style = "font-family:.PingFang-SC-Medium;font-size:20px;color:#ffffff;letter-spacing:0.24px;text-align: center;width: 100%;height: 100%">登录</span></div> -->
				<div style="position: absolute; width: 100%; height: 16px; top: 91.5%; left: 0%">
					<span style="font-family: .PingFang-SC-Medium; font-size: 14px; color: #ffffff; letter-spacing: 0.16px; text-align: center;">Copyright©2016-2019 Primeton</span>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">重置Ame+密码</h4>
			</div>
			<div class="modal-body">
				<form role="form" class="form-horizontal row" id="aa">
					<div class="form-group">
						<label for="lastname" class="col-xs-3 control-label">用户名：</label>
						<div class="col-xs-7">
							<input type="text" style='font-size:12px;' class="form-control" id="username1" value="" placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-xs-3 control-label">手机号：</label>
						<div class="col-xs-7">
							<input type="text" style='font-size:12px;' class="form-control" id="phoneNumber" value="" placeholder="请输入手机号">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-xs-3 control-label">验证码：</label>
						<div class="col-xs-4">
							<input type="text" style='font-size:12px;' class="form-control" id="mobileNumber" placeholder="手机验证码">
						</div>
						<div class="col-xs-1">
							<button type="button" id='sendVCode' style="font-size: 12px;" onclick="getValidtionCode()" class="btn btn-info ">获取验证码</button>
							<!--<input type="button" id='sendVCode' onclick='getValidtionCode()' value="获取验证码" style="line-height: 30px;">-->
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-offset-3 col-xs-1">
							<button id='cz' type="button" onclick="changePassword()" class="btn btn-danger">重置</button>
						</div>
					</div>
					<div class="form-group">
						<div class="col-xs-offset-1 col-xs-10" style="line-height: 25px; font-size: 10px; color: gray;">
							<ol class="text-left">
								<li>密码修改后将以短信和微信的形式发送到您的手机上</li>
								<li>重置密码前请确认系统中填写正确的手机号码和已关注企业微信，否则您将收不到重置后的密码</li>
							</ol>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
<script src="https://rescdn.qqmail.com/node/ww/wwopenmng/js/sso/wwLogin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ame/login/js/jquery.cookie.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ame/login/js/layer.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ame/clipview/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	 /*
	  * 功能：初始化页面
	  *
	  *
	  */
	  
	 $('#username').change(function(){
	 	var key = $(this).val();
	 	if(key.length==0){
	 		$('#myimg').attr('src','/default/ame/login/image/yuanbao1.jpg');
	 	}else {
		 	var value = $.cookie(key);
		 	if(value){
		 		$('#myimg').attr('src',value);
		 	}else if(typeof(value) == 'undefined'){
		 		$('#myimg').attr('src','/default/ame/login/image/yuanbao1.jpg');
		 	}
	 	}
	 })
	 //微信 、pc登录切换
	 $(".chageImg").on("click",function(){
	 	var value = '/default/ame/login/image/codeHalf.png';
	 	var value1 = '/default/ame/login/image/pcHalf.png'
	 	var chageValue = $(this).attr('src');
	 	if(chageValue == value1){
	 		$(this).attr('src',value);
	 		$('.pcLojin').fadeOut("slow");
	 		$('.wxLojin').fadeIn("slow");
	 	}else if(chageValue == value){
	 		$(this).attr('src',value1);
	 		$('.pcLojin').fadeIn("slow");
	 		$('.wxLojin').fadeOut("slow");
	 	}
	 })
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
     var pstatus = '<%=pstatus%>';
     if(pstatus){
	     if(pstatus==1){
	     	layer.tips('验证码错误!', '.yz',{tips:1,guide: 1, time: 1000});
	     	<!--$("#vError").append("<font color='red'>验证码错误</font>");-->
	     }
     }
     var fmsg = '<%=failMsg%>';
     if(fmsg !=null && fmsg !="null"){
     	layer.tips('请输入正确的用户名和密码!', '#username',{tips:1});
     	<!--$("#vError").append("<font color='red'>请输入正确的用户名和密码</font>");-->
     }
     
     $(function(){
     	$("#login_btn").click(function(){
     		 //用户名密码
     		 var form = document.getElementById("loginForm");
     		 //$("#loginForm");这里用jquery的方式不可行。
     		 if(!checkForm(form)){
     		    return false;
     		 }
     		 var verifyCodeFlag = '<%=LogonUtil.useVerifyCode()%>';
     		 var vcode = '';
     		 if(verifyCodeFlag){
     		 	vcode = $("input[name='verifyCode']").val();
     		 }
			 var pw = $("#password").val();
			 var username = $("#username").val();
     		  if(!username){
     		  	layer.tips('帐号不能为空!', '#username',{tips:1,guide: 1, time: 1000});
     		 	$("#username").focus();
     		 	return false;
     		 }
			 if(!pw){
			 	layer.tips('密码不能为空!', '#password',{tips:1,guide: 1, time: 1000});
     		 	$("#password").focus();
     		 	return false;
     		 }
     		 if(!vcode){
     		 	layer.tips('验证码不能为空!', '.yz',{tips:1,guide: 1, time: 1000});
     		 	$name("verifyCode").focus();
     		 	return false;
     		 }
			 var datas = {code:vcode,password:pw,flag:verifyCodeFlag};
			 var flags = "";
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
					if(status=='0'){
						$("#loginForm").submit();
					}else{
					   flags ='1';
					   //刷新页面
					   location.reload();
					  return false;
					}
				},
				error : function(response) {
					location.reload();
				}
	         })    
	         if(flags=='1'){
	         	location.reload();
	         	return false;
	         } 
	　　});
	 });
	 //企业微信扫一扫登陆配置
 	 var wx = new WwLogin({
        "id" : "box",  
        "appid" : "wx06742b5415f5da67",
        "agentid" : "7",
        "redirect_uri" :"https%3a%2f%2fame.primeton.com%2fdefault%2fcommon%2fwechatAme.jsp%3fagentid%3d7",
        "state" : "2",
        "href" : "data:text/css;base64,LmltcG93ZXJCb3ggLnRpdGxlICwgLnN0YXR1cyAsIC5zdGF0dXNfdHh0e2Rpc3BsYXk6IG5vbmU7fS5xcmNvZGV7d2lkdGg6MjAwcHggIWltcG9ydGFudH0KLmltcG93ZXJCb3ggLmluZm8ge3dpZHRoOiAxMDAlO30K"
	});
	 //忘记密码
	  function doView() {
    	<%--var url="<%=request.getContextPath() %>/ame/clipview/forgetPassword.jsp";
		showModal(url,null,null,400,500,"","","重置Ame+系统密码");--%>
		$('#myModal').modal('show');
  	}
	 //登录按钮，实现Enter键，进行提交
	 $(document).keyup(function(event){  
		  if(event.keyCode ==13){  
		  	if($('#myModal').hasClass('in')){
		  		$("#cz").trigger("click");
		  	}else{
		  		$("#login_btn").trigger("click");  
		  	}
		  }  
	 }); 
	 
	 	var mobileno = "";
		var empName = "";
		function getValidtionCode(){
			var userId = $("#username1").val();
			var tel = $("#phoneNumber").val();
			var flag1 = isNull(userId);
			var flag2 = isNull(tel);
			if (flag1){
				layer.tips('用户名不能为空!', '#username1',{tips:1,guide: 1, time: 1000});
				return false;
			} else if(flag2){
				layer.tips('手机号不能为空!', '#phoneNumber',{tips:1,guide: 1, time: 1000});
				return false;
			}
			$.ajax({
				url:'<%=request.getContextPath() %>/org.gocom.abframe.auth.PasswordManager.checkUseridAndMobileNo.biz.ext',
				data:{oUserid:userId},
				type:'post',
				dataType:'json',
				success:function(result){
					mobileno = result.oEmp.mobileno;
					empName = result.oEmp.empname;
					var status = result.status;
					var flag = isNull(mobileno);
					if(status==1){
						layer.tips('用户名不存在，请确认是否正确填写！', '#username1',{tips:1,guide: 1, time: 1000});
						return false;
					}else if(flag){
						layer.tips('没有设置手机号码，请联系信息技术部！', '#phoneNumber',{tips:1,guide: 1, time: 1000});
					 	return false;
					}else if(mobileno!=tel){
						layer.tips('填写的手机号码与用户名不匹配，请确认是否正确填写！', '#username1',{tips:1,guide: 1, time: 1000});
						return false;
					}else{
					$.ajax({
						url:'<%=request.getContextPath()%>/com.primeton.eos.ame_common.smsPlatform.sendValidationCode.biz.ext',
						data:{userId:userId,telphone:mobileno,userName:empName,type:null},
						type:'post',
						dataType:'json',
						success:function(result){
							var returnNode = result.status;
					       	if( returnNode == 1 ){
					       	 	layer.tips('验证码已经发送,请注意查收！', '#sendVCode',{tips:1,guide: 1, time: 1000});
					       	 	settime(60,$("#sendVCode"));
					        }else if(returnNode == 2){
					        	layer.tips('短信发送接口异常！', '#sendVCode',{tips:1,guide: 1, time: 1000});
							}else if(returnNode == 3){
								layer.tips('发送过于频繁,请1分钟过后再试！', '#sendVCode',{tips:1,guide: 1, time: 1000});
							}else if(returnNode == 4){
								layer.tips('短信接口发送失败,请联系管理员查看短信接口表状态！', '#sendVCode',{tips:1,guide: 1, time: 1000});
							}else {
								layer.tips('发送失败，请联系管理员！', '#sendVCode',{tips:1,guide: 1, time: 1000});
							}
						}
					})
				}
			}
		})
	}
	
	function changePassword(){
		var frm = document.getElementById("aa");
		if (checkForm(frm)){
			var userId = $("#username1").val();
			var code = $("#mobileNumber").val();
			var flag_code = isNull(code);
			if(flag_code){
				layer.tips('验证码不能为空!', '#mobileNumber',{tips:1,guide: 1, time: 1000});
	    		return false;
			}
			var json = {acOperator:{userid:userId},code:code,telphone:mobileno,userName:empName};
			$.ajax({
				url:'<%=request.getContextPath() %>/org.gocom.abframe.auth.PasswordManager.forgetPassword.biz.ext',
				data:JSON.stringify(json),
				type:'post',
				async:false,
				contentType: 'text/json',
				dataType:'json',
				success:function(result){
					var returnValue=result.returnValue;
					var result1=result.result1;
					var result2=result.result2;
					var returnNode = result.status;
					if( returnValue == -1 ){
						layer.msg('AME系统密码重置失败，请重新尝试或者联系信息技术部！');
		        		frm.reset();
		        	}else if( returnValue == 1 ){						//验证码正确
		            	if (result1==0 && result2==0){
		            		layer.msg('AME系统密码重置成功，但邮箱密码未能发送到您的微信或手机短信，请将系统手机号码填写正确或关注“普元阿米加”微信企业号后，再次尝试重置密码！');
		            		frm.reset();
		            	} else if (result1==0){
		            		layer.msg('AME系统密码重置成功，密码已发送至您的微信，但短信未能发送成功，请检查系统中是否填写正确的手机号码！');
		            		frm.reset();
		            	} else if(result2==0){
		            		layer.msg('AME系统密码重置成功，密码已发送至您的手机短信，但微信未能发送成功，请确认是否关注“普元阿米加”微信企业号！');
		            		frm.reset();
		            	} else {
		            		layer.msg('AME系统密码重置成功，密码已发送至您的手机短信和微信企业号提醒！');
		            		frm.reset();
		            	}
					}else if( returnValue == 2 ){
						layer.tips('验证码错误,请确认手机号码与验证码是否正确!', '#mobileNumber',{tips:1,guide: 1, time: 1000});
						$("#mobileNumber").val('');
					}else if( returnValue == 3 ){
						layer.tips('验证码已经过期，请重新获取!', '#mobileNumber',{tips:1,guide: 1, time: 1000});
						$("#mobileNumber").val('');
					}else {
						layer.msg('AME系统密码重置失败，请重新尝试或者联系信息技术部！');
						frm.reset();
					}
				}
			})
		}
	}
	//设置验证码发送倒计时
	function settime(t,mbobj){
		var m = mbobj;
		if(t<=0){
			m.attr('disabled',false);
			m.text("获取验证码");
		}else{
			m.attr('disabled',true);
			m.text("重新发送("+t+"s)");
			t--;
			setTimeout(function(){settime(t,m);},1000);
		}
	}
	function isNull(obj){
		if(obj==null||obj==""||obj=="null"||obj == "undefined" || typeof(obj) == "undefined"){
			return true;
		}else{
			return false;
		}
	}
</script>
</html>
