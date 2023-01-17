<%@taglib uri="http://eos.primeton.com/tags/workflow" prefix="wf"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
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
	<title>普元业务综合管理平台</title>
		<!-- start: META -->
		<meta charset="utf-8" />
		<!--[if IE]>
		<meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" />
		<![endif]-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0"/>
		<meta name="apple-mobile-web-app-capable" content="yes"/>
		<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
		<meta content="" name="description" />
		<meta content="" name="author" />
		<!-- end: META -->
		<link rel="shortcut icon" href="/default/ame/login/image/favicon.ico" type="image/x-icon"/>
		<!-- start: MAIN CSS -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/ame/login/js/need/layer.css"/>
		<link rel="stylesheet" href="/default/ame/clipview/assets/plugins/bootstrap/css/bootstrap.min.css"/>
		<link rel="stylesheet" href="/default/ame/clipview/assets/plugins/font-awesome/css/font-awesome.min.css"/>
		<link rel="stylesheet" href="/default/ame/clipview/assets/fonts/style.css"/>
		<link rel="stylesheet" href="/default/ame/clipview/assets/css/main.css" />
		<%-- [if IE 7]
		<link rel="stylesheet" href="/default/ame/clipview/assets/plugins/font-awesome/css/font-awesome-ie7.min.css">
		<![endif] --%>
		<!-- end: MAIN CSS -->
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<link rel="stylesheet" href="/default/ame/clipview/assets/plugins/ladda-bootstrap/dist/ladda-themeless.min.css" />
		<link rel="stylesheet" href="/default/ame/clipview/assets/plugins/bootstrap-switch/static/stylesheets/bootstrap-switch.css" />
		<link rel="stylesheet" href="/default/ame/clipview/assets/plugins/bootstrap-social-buttons/social-buttons-3.css" />
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
<body style="margin:0;padding: 0;text-align: center;">
	<form id="loginForm" action="com.primeton.eos.ame_newlook.intendInfoInput.flow" checkType="blur" method="post" style="top: 0px; left: 0px; width: 100%; height: 100%; background-size: 100% 100%; margin: 0 auto;">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="workItemID" value='<%=request.getParameter("workItemID")%>' filter="false"/>
		<div class="bgpic" style="top: 0px; left: 0px; width: 100%; height: 100%; background-size: 100% 100%; margin: 0 auto;">
			<div style="position: relative; background-image: url(/default/ame/login/image/gp1.png); top: 0px; width: 320px; height: 600px; margin: 0 auto; text-align: center;">
				<!-- <div style="position: absolute; top: 29.5%; left: 13.5%">
					<img style='width:30px;' src="/default/ame/login/image/ame_logo.png"/>
				</div> -->
				<!-- <div style="position: absolute; width: 100%;height: 48px; top: 26%;left: 0%;line-height:48px;text-align:center">
					<img src="/default/ame/login/image/logo-dark.png" id="myimg" class="circle-img" style="width: 80%; height:80px;"/>
				</div> -->
				<div style="position: absolute; width: 100%;height: 48px; top: 27.9%;left: 0%;line-height:48px;text-align:center">
					<span style="font-family: .PingFang-SC-Medium;font-size: 20px; color: #ffffff; letter-spacing: 0.31px; text-align: center;">欢迎新员工</span>
				</div>
				<div class="pcLojin">
					<div style="position: absolute; top: 40%; left: 50%; margin-left: -40px;">
						<img src="/default/ame/login/image/yuanbao1.jpg" id="myimg" class="circle-img" alt="" style="width: 80px; height: 80px; border-radius: 10% 10% 10% 10%; border: 1px solid #617782;"/>
					</div>
					<div class="col-sm" style="position: absolute; width: 230px; height: 30px; top: 57%; left: 15%; z-index: 2;">
						<span class="input-icon"> 
							<input type="text" placeholder="手机号码" id="phoneNumber" name="phoneNumber" class="form-control"/>
							<i class="fa fa-mobile"></i>
						</span>
					</div>
					<div class="col-sm" style="position: absolute; width: 145px; height: 30px; top: 67%; left: 15%; z-index: 2;">
						<span class="input-icon">
							<input type="text" placeholder="手机验证码" id="validtionCode" name="validtionCode" class="form-control" /> 
						</span>
						<div style="position: absolute; width: 57px; height: 16px; top:4%; left:102%; z-index: 1;">
							<button type="button" id='sendVCode' style="font-size: 12px;" onclick="getValidtionCode()" class="btn btn-info">获取验证码</button>
						</div>
					</div>
					<button type="button" id="login_btn" data-style="expand-right" class="btn btn-bricky btn-lg" style="position: absolute; width: 230px; height: 40px; top: 80%; left: 15%; z-index: 1;">
						<span class="ladda-label"> 登录 </span> 
						<!-- <i class="fa fa-arrow-circle-right"></i> -->
					</button>
				</div>
				<div style="position: absolute; width: 100%; height: 16px; top: 91.5%; left: 0%">
					<span style="font-family: .PingFang-SC-Medium; font-size: 14px; color: #ffffff; letter-spacing: 0.16px; text-align: center;">Copyright©2016-2019 Primeton</span>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
<script src="https://rescdn.qqmail.com/node/ww/wwopenmng/js/sso/wwLogin-1.0.0.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ame/login/js/jquery.cookie.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ame/login/js/layer.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/ame/clipview/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function custInit(){
     	//初始化焦点
     	<l:notPresent property="retCode">
     	    $id("phoneNumber").focus();
     	</l:notPresent>
     	<l:present property="retCode">        
	     	<l:equal property="retCode" targetValue="-1">
	     	    $id("phoneNumber").focus();
	     	</l:equal>
	     	<l:equal property="retCode" targetValue="-2">
	     	   $id("phoneNumber").focus();
	     	</l:equal>
     	</l:present>     	     	
     }
     //189661
     //从url中获取工作项id
     var workItemID = <%=request.getParameter("workItemID")%>;
     var currentState;//流程状态
     init();
     function init(){
     	if(workItemID){
     		$.ajax({
				url:'<%=request.getContextPath()%>/org.gocom.abframe.org.intendstaff.addIntendStaffInfo.checkFlowStatus.biz.ext',
				data:{workitemId:workItemID},
				type:'post',
				dataType:'json',
				success:function(result){
					currentState = result.status;
					if(!(currentState==4||currentState==10)){
						layer.open({
						  title: '温馨提示'
						  ,content: '个人信息已填写提交，无法登录！'
						}); 
						return false;
					}
				},
                error: function (jqXHR, textStatus, errorThrown) {
                    //alert(jqXHR.responseText);
                    console.log(jqXHR.responseText);
                }
		   });
     	}
      }
      var empcode = "sysadmin";//拟入职员工号，由于此时员工工号还没有生成，所以写死为sysadmin;
	  //初始化页面按钮样式
      eventManager.add(window,"load",custInit);
	  /*  获取手机验证码 */
	  function getValidtionCode(){
		var phoneNumber = $("#phoneNumber").val();
		if(isNull(phoneNumber)){
			layer.tips('手机号不能为空!', '#phoneNumber',{tips:1,guide: 1, time: 1000});
			return false;
		}
		if(!(currentState==4||currentState==10)){
			layer.open({
			  title: '温馨提示'
			  ,content: '个人信息已填写提交，无法登录！'
			}); 
			return false;
		}
		$.ajax({
				url:'<%=request.getContextPath()%>/org.gocom.abframe.auth.intendJoinStaff.checkMobileNo.biz.ext',
				data:{phoneNumber:phoneNumber,workItemID:workItemID},
				type:'post',
				dataType:'json',
				success:function(result){
					var status = result.status;
					if(status==1){
						layer.tips('你输入的手机号码未通过验证，请确认手机号码是否输入正确！', '#phoneNumber',{tips:1,guide: 1, time: 2000});
						return false;
					}else if(status==0){
						var intendname = result.oEmp.intendname;//拟入职员工名称
						$.ajax({
							url:'<%=request.getContextPath()%>/com.primeton.eos.ame_common.smsPlatform.sendValidationCode.biz.ext',
							data:{userId:empcode,telphone:phoneNumber,userName:intendname,type:'2'},
							type:'post',
							dataType:'json',
							success:function(result){
								var returnNode = result.status;
						       	if( returnNode == 1 ){
						       	 	layer.tips('验证码已经发送,请注意查收！', '#sendVCode',{tips:1,guide: 1, time: 2000});
						       	 	settime(60,$("#sendVCode"));
						        }else if(returnNode == 2){
						        	layer.tips('短信发送接口异常！', '#sendVCode',{tips:1,guide: 1, time: 3000});
								}else if(returnNode == 3){
									layer.tips('发送过于频繁,请1分钟过后再试！', '#sendVCode',{tips:1,guide: 1, time: 3000});
								}else if(returnNode == 4){
									layer.tips('短信接口发送失败,请联系管理员查看短信接口表状态！', '#sendVCode',{tips:1,guide: 1, time: 3000});
								}else {
									layer.tips('发送失败，请联系管理员！', '#sendVCode',{tips:1,guide: 1, time: 3000});
								}
						    },
			                error: function (jqXHR, textStatus, errorThrown) {
			                    //alert(jqXHR.responseText);
			                    console.log(jqXHR.responseText);
			                }
					});
				}else{
					layer.open({
						  title: '操作提示'
						  ,content: '获取验证码异常，请联系招聘人员！'
					}); 
				}
			}
		})
	 }
	 $(function(){
     	$("#login_btn").click(function(){
	     	if(!(currentState==4||currentState==10)){
				layer.open({
				  title: '温馨提示'
				  ,content: '个人信息已填写提交，无法登录！'
				}); 
				return false;
			}
     		 //用户名密码
     		 var form = document.getElementById("loginForm");
     		 //$("#loginForm");这里用jquery的方式不可行。
     		 if(!checkForm(form)){
     		    return false;
     		 }
			 var phoneNumber = $("#phoneNumber").val();//手机号码
			 var validtionCode = $("#validtionCode").val();//手机验证码
     		 if(isNull(phoneNumber)){
	     		 layer.tips('手机号码不能为空！', '#phoneNumber',{tips:1,guide: 1, time: 2000});
	     		 $("#phoneNumber").focus();
	     		 return false;
     		 }
			 if(!validtionCode){
			 	layer.tips('手机验证码不能为空！', '#validtionCode',{tips:1,guide: 1, time: 2000});
     		 	$("#validtionCode").focus();
     		 	return false;
     		 }
     		 var json = {userId:empcode,code:validtionCode,telphone:phoneNumber};
     		 $.ajax({
					url:'<%=request.getContextPath()%>/org.gocom.abframe.auth.intendJoinStaff.checkValidationCodeForIntendLogin.biz.ext',
					data:json,
					type:'post',
					dataType:'json',
					success:function(result){
						var returnNode = result.status;
				       	if( returnNode == 0 ){//成功
				       		window.location="<%=request.getContextPath()%>/common/logins.jsp?phoneNumber="+phoneNumber+"&workItemID="+workItemID;
				        }else if(returnNode == 1){//验证码错误
				        	layer.tips('验证码错误，请重新输入验证码！', '#sendVCode',{tips:1,guide: 1, time: 2000});
						}else if(returnNode == 2){//验证码过期
							layer.tips('验证码过期，请重新获取验证码！', '#sendVCode',{tips:1,guide: 1, time: 2000});
						}else {
							layer.open({
								  title: '操作提示'
								  ,content: '登录失败，请联系管理员！'
							}); 
						}
					},
	                error: function (jqXHR, textStatus, errorThrown) {
	                    //alert(jqXHR.responseText);
	                    console.log(jqXHR.responseText);
	                }
			});
	　　	 });
	 });
	 
	 $(function(){
	 	$("#phoneNumber").blur(function(){
		 	var phoneNumber = $("#phoneNumber").val();//手机号码
		 	var reg =/^1[3456789]\d{9}$/;//手机号码格式验证
	        //var reg = /^1[3|4|5|7|8][0-9]{9}$/;
	        if(!isNull(phoneNumber)){
	     		if(!reg.test(phoneNumber)){
	     		 	layer.tips('手机号码格式不正确！', '#phoneNumber',{tips:1,guide: 1, time: 1000});
	     		 	$("#phoneNumber").focus();
	     		 	return false;
	     		}
	     	}
		 });
	 });
	  //登录按钮，实现Enter键，进行提交
	 $(document).keyup(function(event){  
		  if(event.keyCode ==13){  
		  	$("#login_btn").trigger("click");  
		  }  
	 }); 
	 
	 /* 设置验证码发送倒计时 */
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
	 /* 判断js对象是否为空 */
	 function isNull(obj){
		if(obj==null||obj==""||obj=="null"||obj == "undefined" || typeof(obj) == "undefined"){
			return true;
		}else{
			return false;
		}
	 }
</script>
</html>
