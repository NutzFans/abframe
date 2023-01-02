<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
</head>
<body leftmargin="0" topmargin="0">
	<h:form name="passwordChange" method="post" checkType="blur;">
		<h:hidden property="oEmp/empid" />
		<h:hidden property="oEmp/userid" />
		<h:hidden property="oEmp/empname" />
		<h:hidden property="oEmp/mobileno" name="mobileno"/>
	    <table align="center" border="0" width="100%" class="form_table"cellpadding="0" cellspacing="0">
	      <tr>
	        <td class="form_label">
	          <!--人员姓名-->
	          <b:message key="empOrgMaintain_oEmp.empname"/><b:message key="l_colon"/>
	        </td>
	        <td colspan="1">
	          <b:write property="oEmp/empname"/>
	        </td> 
       	  </tr>
       	  <tr>
	        <td class="form_label">
	          <!--人员代码-->
	          <b:message key="empOrgMaintain_oEmp.empcode"/><b:message key="l_colon"/>
	        </td>
	        <td colspan="1">
	          <b:write property="oEmp/empcode"/>
	        </td>               
      	  </tr>
      <tr>
        <td class="form_label">
          <!--办公邮件-->
          <b:message key="empOrgMaintain_oEmp.oemail"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <b:write property="oEmp/oemail"/>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--手机号码-->
          <b:message key="empOrgMaintain_oEmp.mobileno"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/mobileno" validateAttr="maxLength=14;type=chinaMobile;allowNull=true"/>
          
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--短信验证码-->
          <b:message key="empOrgMaintain_oEmp.validationCode"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="validationCode" style="width:10%" validateAttr="maxLength=6;"/>
          <input id="sendVCode" type="button" class="button" onclick="getValidtionCode()" value='<b:message key="l_validation_code"></b:message>'> 
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--私人邮箱-->
          <b:message key="empOrgMaintain_oEmp.pemail"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/pemail" validateAttr="maxLength=128;type=email;allowNull=true"/>
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
	var validaFlag = false;
	/*
	 * 功能：修改密码
	*/
	function changePassword(){
		var frm = $name(passwordChange);
		if (checkForm(frm)){
		   var oldMobileno = $name("mobileno").value;
		   var mobileno = $name("oEmp/mobileno").value;
		   if(validaFlag){
			   var flag = validationCode();
			   if(!flag){
				  return;
			   }
			}
			var empid = $name("oEmp/empid").value;
			var oemail = '<b:write property="oEmp/oemail"/>';
			var userid = $name("oEmp/userid").value;
			var empname = $name("oEmp/empname").value;
			var pemail = $name("oEmp/pemail").value;
			var myAjax = new Ajax("org.gocom.abframe.auth.PasswordManager.phonemailChange.biz");
			myAjax.addParam("oEmp/empid", empid );
			myAjax.addParam("oEmp/mobileno", mobileno );
			myAjax.addParam("oEmp/pemail", pemail );
			myAjax.addParam("oEmp/oemail", oemail );
			myAjax.addParam("oEmp/userid", userid );
			myAjax.addParam("oEmp/empname", empname );
			myAjax.submit();
			var returnNode = myAjax.getResponseXMLDom();
		    if( returnNode ) {
	       	 	if( myAjax.getValue("root/data/iRtn") == -1 ){
	        		alert("修改失败，请联系管理员！");   //修改失败
	        	}else{
	        		var wxresult =  myAjax.getValue("root/data/wxresult"); 
	        		if(wxresult == "0"){
		        		$name("validationCode").value="";
		            	alert("修改成功！");      //修改成功
	        		}else{
		        		$name("validationCode").value="";
		            	alert("修改成功，但未能成功更新微信企业号，错误原因："+wxresult);      //修改成功
	        		}
				}
			} else {
				alert("修改失败，请联系管理员！");          //修改失败
			}
		}
	}
		
	//获取验证码
	function getValidtionCode(){
			var empName = $name("oEmp/empname").value;
			var mobileno = $name("oEmp/mobileno").value;
			var oldMobileno = $name("mobileno").value;
			var isNull_old = isNull(oldMobileno);
			var isNull_new = isNull(mobileno);
			var sendFlag = false;
			if(isNull_new){
				alert("手机号码不能为空!");
				return false;
			}else{
				var reg = /^1[3|5|7|8|9][0-9]{9}$/;
				var flag = reg.test(mobileno);
				if(!flag){
					alert("手机号码格式错误!");
					return false;
				}else{
					if(!isNull_old){
						if(oldMobileno==mobileno){
							alert("手机号码没有变化，不需要短信验证码。");
							return false;
						}
					}
				}
			}
			
			var userId = $name("oEmp/userid").value;
			var myAjax = new Ajax("com.primeton.eos.ame_common.smsPlatform.sendValidationCode.biz");
			myAjax.addParam("userId", userId );
			myAjax.addParam("telphone", mobileno );
			myAjax.addParam("userName", empName );
			myAjax.addParam("type", "1" );
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
</script>