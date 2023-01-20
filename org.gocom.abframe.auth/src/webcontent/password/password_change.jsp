<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
</head>
<body leftmargin="0" topmargin="0">
	<h:form name="passwordChange" method="post" checkType="blur;">
		<h:hidden property="userObject/userId" scope="session"/>
		<h:hidden property="oEmp/empname"/>
		<h:hidden property="oEmp/mobileno"/>
	    <table align="center" border="0" width="100%" class="form_table"cellpadding="0" cellspacing="0">
	      <tr>
	        <td class="form_label">
	          <!--手机号码-->
	           	操作提示：
	        </td>
	        <td colspan="1">&nbsp;密码修改后将影响Ame+系统的登录!
	        </td>        
	      </tr>
	      
	      <tr>
	        <td class="form_label">
	          <b:message key="password_l_old"></b:message><b:message key="DictManager_l_colon"></b:message>
	        </td>
	        <td colspan="1">
	          <h:password property="password/old" validateAttr="allowNull=false"/>
	        </td>
	      </tr>
	      <tr>
	        <td class="form_label">
	          <b:message key="password_l_new_one"></b:message><b:message key="DictManager_l_colon"></b:message>
	        </td>
	        <td colspan="1">
	          <h:password property="password/new_one" validateAttr="allowNull=false"/>&nbsp;密码长度不小于8位，且必须包含大小写字母及数字
	        </td>
	      </tr>
	      <tr>
	        <td class="form_label">
	          <b:message key="password_l_new_two"></b:message><b:message key="DictManager_l_colon"></b:message>
	        </td>
	        <td colspan="1">
	          <h:password property="password/new_two" validateAttr="allowNull=false"/>
	        </td>
	      </tr>
	      <tr class="form_bottom">
	        <td colspan="4" class="form_bottom">
	          <input type="button" class="button" onclick="changePassword()" value='<b:message key="l_update"></b:message>'> <!-- 修改 -->
	          <input type="reset" class="button" value='<b:message key="l_reset"></b:message>'> <!-- "重置" -->
	        </td>
	      </tr>
	      
	    </table>
    </h:form>
</body>
</html>

<script>
	/*
	 * 功能：修改密码
	*/
	function changePassword(){
		var frm = $name(passwordChange);
		if (checkForm(frm)){
			var pass_old = $name("password/old").value;
			var pass_new_one = $name("password/new_one").value;
			var pass_new_two = $name("password/new_two").value;
			var userId = $name("userObject/userId").value;
			//var code = $name("validationCode").value;
			//var flag_code = isNull(code);
			//if(flag_code){
			//	alert("验证码不能为空!");   
	    	//	return false;
			//}
			var flag_op = isNull(pass_old);
			if(flag_op){
				alert("原密码不能为空!");   
	    		return false;
			}
			var flag_np = isNull(pass_new_one);
			if(flag_np){
				alert("新密码不能为空!");   
	    		return false;
			}
			
			var flag_tnp = isNull(pass_new_two);
			if(flag_tnp){
				alert("重复新密码不能为空!");   
	    		return false;
			}
			
			if(pass_new_one.length<8){
				alert("密码长度不小于8位，且必须包含大小写字母及数字!");   
	    		return false;
			}
			
			if (pass_new_one != pass_new_two) 
				alert('<b:message key="password_l_not_equal"/>');   //“新密码”与“重复密码”不一致
			else{
				if(!contNum(pass_new_one)){
					alert("密码长度不小于8位，且必须包含大小写字母及数字!");
					return false;
				}
				if(!contLowchar(pass_new_one)){
					alert("密码长度不小于8位，且必须包含大小写字母及数字!");
					return false;
				}
				if(!contUpchar(pass_new_one)){
					alert("密码长度不小于8位，且必须包含大小写字母及数字!");
					return false;
				}
				var empName = $name("oEmp/empname").value;
				var mobileno = $name("oEmp/mobileno").value;
				var userId = $name("userObject/userId").value;
				//var flag = isNull(mobileno);
				//if(flag){
				// 	alert("没有设置手机号码，请先到手机邮箱设置中设置手机号码!");
				// 	return false;
				//}
				var myAjax = new Ajax("org.gocom.abframe.auth.PasswordManager.passwordChange.biz");
				myAjax.addParam("acOperator/userid", userId );
				myAjax.addParam("code", "" );
				myAjax.addParam("telphone", mobileno );
				myAjax.addParam("userName", empName );
				myAjax.addParam("password/old", pass_old );
				myAjax.addParam("password/new", pass_new_one );
				myAjax.submit();
				
				var returnNode = myAjax.getResponseXMLDom();
			    if( returnNode ) {
					if( myAjax.getValue("root/data/returnValue") == -2 ){
			        	alert('<b:message key="password_l_old_not_ok"/>');   //原密码不正确
			        }else{
			       	 	if( myAjax.getValue("root/data/returnValue") == -1 ){
			        		alert('<b:message key="password_l_change_not_ok"/>');   //修改失败
			        	}else if( myAjax.getValue("root/data/returnValue") == 1 ){
			            	alert('<b:message key="password_l_change_ok"/>');      //修改成功
						}else if( myAjax.getValue("root/data/returnValue") == 2 ){
							alert("验证码错误,请确认手机号码与验证码是否正确!");   
						}else if( myAjax.getValue("root/data/returnValue") == 3 ){
							alert("验证码已经过期，请重新获取!");   
						}
					}
				} else {
					alert('<b:message key="password_l_change_not_ok"/>');          //修改失败
				}
			}
		}
		frm.reset();
	}
	
	//获取验证码
	function getValidtionCode(){
			var empName = $name("oEmp/empname").value;
			var mobileno = $name("oEmp/mobileno").value;
			var userId = $name("userObject/userId").value;
			var flag = isNull(mobileno);
			if(flag){
			 	alert("没有设置手机号码，请先到手机邮箱设置中设置手机号码!");
			 	return false;
			}
			var myAjax = new Ajax("com.primeton.eos.ame_common.smsPlatform.sendValidationCode.biz");
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
	
	function validationCode(){
		var empName = $name("oEmp/empname").value;
		var mobileno = $name("oEmp/mobileno").value;
		var code = $name("validationCode").value;
		var myAjax = new Ajax("com.primeton.eos.ame_common.smsPlatform.checkValidationCode.biz");
		myAjax.addParam("code", code );
		myAjax.addParam("telphone", mobileno );
		myAjax.addParam("userName", empName );
		myAjax.submit();
		var returnNode = myAjax.getResponseXMLDom();
		    if( returnNode ) {
	       	 	if( myAjax.getValue("root/data/status") == 0 ){
	       	 		return true;
	        	}else if(myAjax.getValue("root/data/status") == 1){
	            	alert("验证码错误,请确认手机号码与验证码是否正确!");   //接口调用异常
	            	return false;
				}else if(myAjax.getValue("root/data/status") == 2){
	            	alert("验证码已经过期，请重新获取!");   
	            	return false;
				}
			} else {
				alert("校验错误！");          //修改失败
				return false;
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
	
	function checkLength(){
		var length = password.length;
	    if(length<9){
	    	alert("密码长度必须大于8位!");   
	    	return false;
	    }
	}
	
	function contUpchar(text){
		var reg = new RegExp("^[A-Z]+$");
		for(var i=0;i<text.length;i++){
			var c=text.charAt(i);
			if(reg.test(c)){
				return true;
			}
		}
		return false;
	}
	
	function contLowchar(text){
		var reg = new RegExp("^[a-z]+$");
		for(var i=0;i<text.length;i++){
			var c=text.charAt(i);
			if(reg.test(c)){
				return true;
			}
		}
		return false;
	}
	
	//校验是否包含数字
	function contNum(text){
		var reg = new RegExp("^[0-9]*$");
		for(var i=0;i<text.length;i++){
			var c=text.charAt(i);
			if(reg.test(c)){
				return true;
			}
		}
		return false;
	}
</script>