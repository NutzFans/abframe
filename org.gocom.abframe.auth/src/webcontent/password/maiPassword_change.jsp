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
	        <td class="form_label" width="80">
	          <!--手机号码-->
	           	操作提示：
	        </td>
	        <td colspan="1">密码修改后将以短信和微信的形式发送到您的手机上!</br>重置密码前请确认系统中填写正确的手机号码和已关注“普元阿米加”微信企业号，否则您将收不到重置后的邮箱密码!
	        </td>        
	      </tr>
	       <tr>
	        <td class="form_label" width="80">
	          <!--手机号码-->
	           邮箱帐号：
	        </td>
	        <td colspan="1"><b:write property="userObject/userMail" scope="s"/></td>        
	      </tr>
	      <tr>
	        <td class="form_label" width="80">
	          <!--手机号码-->
	          手机号码：
	        </td>
	        <td colspan="1" id="tel"></td>        
	      </tr>
	      <tr class="form_bottom">
	        <td colspan="4" align="center" class="form_bottom">
	          <input type="button" class="button"  onclick="changePassword()" value="重置密码" > <!-- 重置 -->
	          <input type="button" value="关闭窗口" onclick="CloseWindow();" class="button">
	        </td>
	      </tr>
	    </table>
    </h:form>
</body>
</html>

<script>
	/*
	 * 功能：重置邮箱密码
	*/
	init();
	function init(){
	var empid = "<b:write property='userObject/attributes/empid' scope='session'/>";  
		var myAjax = new Ajax("org.gocom.abframe.org.employee.EmpManager.expandEmployeeByEmpId.biz");
			myAjax.addParam("oEmployeeId",empid);
			myAjax.submit();
			var result =myAjax.getValue("/root/data/oEmployee/mobileno");
			document.getElementById("tel").innerHTML = result;
	}
	function changePassword(){
				maskWindow();
				if(confirm("确认重置邮箱密码？")){
					var myAjax = new Ajax("com.primeton.eos.ame_common.mail.updatePassword.biz");
					myAjax.submit();
					var result =myAjax.getValue("/root/data/result");
					var result1 =myAjax.getValue("/root/data/result1");
					var result2 =myAjax.getValue("/root/data/result2");
					if(result != "0"){
						alert("邮箱密码重置失败，请重新尝试或者联系信息技术部！")
					}else if(result=="0" && result1 == 0 && result2 == 0){
						alert("邮箱密码重置成功，但邮箱密码未能发送到您的微信或手机短信，请将系统手机号码填写正确或关注“普元阿米加”微信企业号后，再次尝试重置密码！");
					}else if(result=="0" && result1 == 0 && result2 != 0){
						alert("邮箱密码重置成功，密码已发送至您的微信，但短信未能发送成功，请检查系统中是否填写正确的手机号码！");
					}else if(result=="0" && result2 == 0 && result1 != 0){
						alert("邮箱密码重置成功，密码已发送至您的手机短信，但微信未能发送成功，请确认是否关注“普元阿米加”微信企业号！");
					}else{
						alert("邮箱密码重置成功，密码已发送至您的手机短信和微信企业号提醒！");
					}
					unMaskWindow();
				}else{
					unMaskWindow();
				}
			    /* if( returnNode ) {
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
				} */
	}
    function CloseWindow(action) {
	    if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	    else window.close();            
	}
</script>