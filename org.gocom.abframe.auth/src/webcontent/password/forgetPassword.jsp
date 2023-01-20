<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-06-26 15:07:27
  - Description:
-->
<head>
<title>忘记密码</title>
</head>
<body leftmargin="0" topmargin="0" style="background-color: #F0F8FF">
	<h:form name="passwordChange" method="post" checkType="blur;">
		<div align="left" border="0" width="100%" class="form_table" style="border: none;background-color: #F0F8FF">
			<div>
		          <!--手机号码-->
		           	<br>操作提示：
		           	</div>
		           	<div>
		        1、密码重置后将同时影响Ame+系统和普元人的登录!
		        </div>
		        <div>
		        2、密码重置后将以短信和微信的形式发送到您的手机上,重置密码前请确认系统中填写正确的
		  		</div>
		  		<div style="margin-left: 18px;">
		  		手机号码和已关注“普元阿米加”微信企业号，否则您将收不到重置后的系统密码!
		  		</div>
		  		<div>      
		        3、密码重置后建议立即登录系统修改密码并妥善保管!<br><br>
		        </div>
		         
	      </div>
	      <table align="center" border="0" width="100%" class="form_table" cellpadding="0" cellspacing="0">
	      <tr>
	        <td class="form_label" width="150px" style="background-color: #F0F8FF">
	          <b:message key="auth_login_userid"></b:message><b:message key="l_colon"></b:message>
	        </td>
	        <td colspan="1" style="background-color: #F0F8FF">
	          <h:text property="input/userid" validateAttr="allowNull=false"/>
	        </td>
	      </tr>
	      <tr>
	        <td class="form_label" style="background-color: #F0F8FF">
	          <b:message key="empOrgMaintain_oEmp.mobileno"></b:message><b:message key="l_colon"></b:message>
	        </td>
	        <td colspan="1" style="background-color: #F0F8FF">
	          <h:text property="input/telephone" validateAttr="allowNull=false"/>
	        </td>
	      </tr>
	      <tr>
	        <td class="form_label" style="background-color: #F0F8FF">
	          <!--短信验证码-->
	          <b:message key="empOrgMaintain_oEmp.validationCode"/><b:message key="l_colon"/>
	        </td>
	        <td colspan="1" style="background-color: #F0F8FF">
	          <h:text property="validationCode"  style="width:15%" validateAttr="maxLength=6;allowNull=false"/>
	          <input id="sendVCode" type="button" class="button" onclick="getValidtionCode()" value='<b:message key="l_validation_code"></b:message>'> 
	        </td>        
	      </tr>
	      <tr class="form_bottom">
	        <td colspan="4" class="form_bottom" style="background-color: #F0F8FF">
	          <input type="button" class="button" onclick="changePassword()" value="密码重置"> <!-- 修改 -->
	        </td>
	      </tr>
	      
		</table>
	</h:form>
</body>
</html>

<script>
		var mobileno = "";
		var empName = "";
		function getValidtionCode(){
			var userId = $name("input/userid").value;
			var tel = $name("input/telephone").value;
			var flag1 = isNull(userId);
			var flag2 = isNull(tel);
			if (flag1){
				alert("用户名不能为空！");
				return false;
			} else if(flag2){
				alert("手机号码不能为空！");
				return false;
			}
			var myAjax1 = new Ajax("<%=request.getContextPath() %>/org.gocom.abframe.auth.PasswordManager.checkUseridAndMobileNo.biz");
			myAjax1.addParam("oUserid", userId );
			myAjax1.submit();
			mobileno = myAjax1.getValue("/root/data/oEmp/mobileno");
			empName = myAjax1.getValue("/root/data/oEmp/empname");
			var status = myAjax1.getValue("/root/data/status");
			var flag = isNull(mobileno);
			if(status==1){
				alert("用户名不存在，请确认是否正确填写！");
				return false;
			}else if(flag){
			 	alert("没有设置手机号码，请联系信息技术部!");
			 	return false;
			}else if(mobileno!=tel){
				alert("填写的手机号码与用户名不匹配，请确认是否正确填写！");
				return false;
			}else{
				var myAjax = new Ajax("<%=request.getContextPath() %>/com.primeton.eos.ame_common.smsPlatform.sendValidationCode.biz");
				myAjax.addParam("userId", userId );
				myAjax.addParam("telphone", mobileno );
				myAjax.addParam("userName", empName );
				myAjax.addParam("type", null );
				myAjax.submit();
				var returnNode = myAjax.getResponseXMLDom();
			    if( returnNode ) {
		       	 	if( myAjax.getValue("root/data/status") == 1 ){
		       	 		alert("已发送验证码到手机。");
		       	 		settime(60,$id("sendVCode"));
		        	}else if(myAjax.getValue("root/data/status") == 2){
		            	alert("短信发送接口异常!");   //接口调用异常
					}else if(myAjax.getValue("root/data/status") == 3){
		            	alert("发送过于频繁,请1分钟过后再试!");   //发送过于频繁
					}else if(myAjax.getValue("root/data/status") == 4){
						alert("短信接口发送失败,请联系管理员查看短信接口表状态!");   //发送失败
					}
				} else {
					alert("发送失败，请联系管理员！");          //修改失败
				}
			}
	}	
	
	function changePassword(){
		var frm = $name(passwordChange);
		if (checkForm(frm)){
			var userId = $name("input/userid").value;
			var code = $name("validationCode").value;
			var flag_code = isNull(code);
			if(flag_code){
				alert("验证码不能为空!");   
	    		return false;
			}
				var myAjax = new Ajax("<%=request.getContextPath() %>/org.gocom.abframe.auth.PasswordManager.forgetPassword.biz");
				myAjax.addParam("acOperator/userid", userId );
				myAjax.addParam("code", code );
				myAjax.addParam("telphone", mobileno );
				myAjax.addParam("userName", empName );
				myAjax.submit();
				var returnValue=myAjax.getValue("root/data/returnValue");
				var result1=myAjax.getValue("root/data/result1");
				var result2=myAjax.getValue("root/data/result2");
				var returnNode = myAjax.getResponseXMLDom();
			    if( returnNode ) {
		       	 	if( returnValue == -1 ){
		        		alert("AME系统密码重置失败，请重新尝试或者联系信息技术部！");   //修改失败
		        		frm.reset();
		        	}else if( returnValue == 1 ){						//验证码正确
		            	if (result1==0 && result2==0){
		            		alert("AME系统密码重置成功，但邮箱密码未能发送到您的微信或手机短信，请将系统手机号码填写正确或关注“普元阿米加”微信企业号后，再次尝试重置密码！");
		            		frm.reset();
		            	} else if (result1==0){
		            		alert("AME系统密码重置成功，密码已发送至您的微信，但短信未能发送成功，请检查系统中是否填写正确的手机号码！");
		            		frm.reset();
		            	} else if(result2==0){
		            		alert("AME系统密码重置成功，密码已发送至您的手机短信，但微信未能发送成功，请确认是否关注“普元阿米加”微信企业号！");
		            		frm.reset();
		            	} else {
		            		alert("AME系统密码重置成功，密码已发送至您的手机短信和微信企业号提醒！");
		            		frm.reset();
		            	}
					}else if( returnValue == 2 ){
						alert("验证码错误,请确认手机号码与验证码是否正确!");   
						$name("validationCode").value = "";
					}else if( returnValue == 3 ){
						alert("验证码已经过期，请重新获取!");   
						$name("validationCode").value = "";
					}
				} else {
					alert("AME系统密码重置失败，请重新尝试或者联系信息技术部！");          //修改失败
					frm.reset();
				}
		}
	}
	
	//设置验证码发送倒计时
	function settime(t,mbobj){
		var m = mbobj;
		if(t<=0){
			mbobj.removeAttribute("disabled", false);  
			mbobj.value="获取验证码";
		}else{
			mbobj.setAttribute("disabled", true);  
			mbobj.value="重新发送("+t+"s)"
			t--;
			setTimeout(function(){settime(t,mbobj);},1000);
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