<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<%
	//获取标签中使用的国际化资源信息
	String empInfo=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_empInfo");
	String oprInfo=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_oprInfo");

	String pleaseSelect=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
	String selectMngOrg=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_selectMngOrg");
	String selectReleaseRole=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("empOrgMaintain_l_title_selectReleaseRole");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Title</title>
<script>
    function mdfEmpOpr(){
        if( $id("checkOpr").checked ) {
        	$name("oOpr/hasopr").value="y";
        }else{
        	$name("oOpr/hasopr").value="n";
        }    
    	var frm = $name("dataform1");
    	frm.submit();
    }
	function isDisplay() {
		if( $id("checkOpr").checked ) {
			$id("tableDiv").style.display = "";
		}	else {
			$id("tableDiv").style.display = "none";
			$id('advOption').style.border='1px solid #CCCCCC';
		}
	}    
</script>
</head>
<body>

<h:form name="dataform1" action="org.gocom.abframe.org.employee.EmpOprPosiModify.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
  <input type="hidden" name="_eosFlowAction" value="mdf"/>

  <w:panel id="panel1" width="100%" title="<%=empInfo %>">
    <h:hidden property="oEmp/empid" />
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
        <td class="form_label" width="15%">
          <!--人员代码-->
          <b:message key="empOrgMaintain_oEmp.empcode"/><b:message key="l_colon"/>
        </td>
        <td colspan="1" width="35%">
          <h:text property="oEmp/empcode" validateAttr="allowNull=false;maxLength=30"/>
        </td>
        <td class="form_label" width="15%">
          <!--人员姓名-->
          <b:message key="empOrgMaintain_oEmp.empname"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/empname" validateAttr="allowNull=false;maxLength=50"/>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--性别-->
          <b:message key="empOrgMaintain_oEmp.gender"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_GENDER" property="oEmp/gender" style="width:133" nullLabel="<%=pleaseSelect%>"/>
        </td>
        <td class="form_label">
          <!--出生日期-->
          <b:message key="empOrgMaintain_oEmp.birthdate"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <w:date property="oEmp/birthdate"/>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--证件类型-->
          <b:message key="empOrgMaintain_oEmp.cardtype"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_CARDTYPE" property="oEmp/cardtype" style="width:133" nullLabel="<%=pleaseSelect%>"/>
        </td>
        <td class="form_label">
          <!--证件号码-->
          <b:message key="empOrgMaintain_oEmp.cardno"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/cardno" validateAttr="allowNull=false;maxLength=20"/>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--入职日期-->
          <b:message key="empOrgMaintain_oEmp.indate"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <w:date property="oEmp/indate"/>
        </td>
        <td class="form_label">
          <!--离职日期-->
          <b:message key="empOrgMaintain_oEmp.outdate"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <w:date property="oEmp/outdate"/>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--人员状态-->
          <b:message key="empOrgMaintain_oEmp.empstatus"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_EMPSTATUS" property="oEmp/empstatus" style="width:133" nullLabel="<%=pleaseSelect%>"/>
        </td>
        <td class="form_label">
          <!--办公电话-->
          <b:message key="empOrgMaintain_oEmp.otel"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/otel" validateAttr="maxLength=12"/>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--办公邮编-->
          <b:message key="empOrgMaintain_oEmp.ozipcode"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/ozipcode" validateAttr="maxLength=10"/>
        </td>
        <td class="form_label">
          <!--办公邮件-->
          <b:message key="empOrgMaintain_oEmp.oemail"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/oemail" validateAttr="maxLength=128"/>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--传真号码-->
          <b:message key="empOrgMaintain_oEmp.faxno"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/faxno" validateAttr="maxLength=14"/>
        </td>
        <td class="form_label">
          <!--手机号码-->
          <b:message key="empOrgMaintain_oEmp.mobileno"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/mobileno" validateAttr="maxLength=14"/>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--MSN号码-->
          <b:message key="empOrgMaintain_oEmp.msn"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/msn" validateAttr="maxLength=16"/>
        </td>
        <td class="form_label">
          <!--家庭电话-->
          <b:message key="empOrgMaintain_oEmp.htel"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/htel" validateAttr="maxLength=12"/>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--家庭地址-->
          <b:message key="empOrgMaintain_oEmp.haddress"/><b:message key="l_colon"/>
        </td>
        <td colspan="3">
          <h:textarea property="oEmp/haddress" cols="60" rows="1" validateAttr="maxLength=128"/>
        </td>        
      </tr>      
      <tr>
        <td class="form_label">
          <!--办公地址-->
          <b:message key="empOrgMaintain_oEmp.oaddress"/><b:message key="l_colon"/>
        </td>
        <td colspan="3">
          <h:textarea property="oEmp/oaddress" cols="60" rows="1" validateAttr="maxLength=128"/>
        </td>
   
      </tr>
      <tr>
        <td class="form_label">
          <!--家庭邮编-->
          <b:message key="empOrgMaintain_oEmp.hzipcode"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/hzipcode" validateAttr="maxLength=10"/>
        </td>
        <td class="form_label">
          <!--私人邮箱-->
          <b:message key="empOrgMaintain_oEmp.pemail"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/pemail" validateAttr="maxLength=128"/>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--政治面貌-->
          <b:message key="empOrgMaintain_oEmp.party"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_PARTYVISAGE" property="oEmp/party" style="width:133" nullLabel="<%=pleaseSelect%>"/>
        </td>
        <td class="form_label">
          <!--职级-->
          <b:message key="empOrgMaintain_oEmp.degree"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_EMPLEVEL" property="oEmp/degree" style="width:133" nullLabel="<%=pleaseSelect%>"/>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--直接主管-->
          <b:message key="empOrgMaintain_oEmp.major"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/major" validateAttr="maxLength=30"/>
        </td>
      </tr>
      <tr>        
        <td class="form_label">
          <!--可管理机构-->
          <b:message key="empOrgMaintain_oEmp.orgidlist"/><b:message key="l_colon"/>
        </td>
        <td colspan="3">
          <w:lookup property="oEmp/orgidlist" disabled="true" validateAttr="allowNull=true;message=可管理机构可以为空" readonly="true" displayProperty="oEmp/orgidlistname" lookupUrl="/org.gocom.abframe.org.employee.MngorgAssign.flow" dialogTitle="<%=selectMngOrg %>" width="350" height="430">
          </w:lookup>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--可授权角色-->
          <b:message key="empOrgMaintain_oEmp.specialty"/><b:message key="l_colon"/>
        </td>
        <td colspan="3">
          <w:lookup property="oEmp/specialty" disabled="true" validateAttr="allowNull=true;message=可授权角色可以为空" readonly="true" displayProperty="oEmp/specialtyname" lookupUrl="/org.gocom.abframe.org.employee.MngRoleAssign.flow" dialogTitle="<%=selectReleaseRole %>" width="350" height="430">
          	<h:param name="lOperatorid" property="oOpr/operatorid" />
          </w:lookup>
        </td>
      </tr>
      <tr>  
        <td class="form_label">
          <!--工作描述-->
          <b:message key="empOrgMaintain_oEmp.workexp"/><b:message key="l_colon"/>
        </td>
        <td colspan="3">
          <h:textarea property="oEmp/workexp" cols="60" rows="2" validateAttr="maxLength=512"/>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--备注-->
          <b:message key="empOrgMaintain_oEmp.remark"/><b:message key="l_colon"/>
        </td>
        <td colspan="3">
          <h:textarea property="oEmp/remark" cols="60" rows="2" validateAttr="maxLength=512"/>
        </td>
      </tr>
      <%--  
      <tr>
        <td class="form_label">
          operatorid
        </td>
        <td colspan="1">
          <h:text dictTypeId="yesno" property="oEmp/operatorid"/>
        </td>
        <td class="form_label">
          userid
        </td>
        <td colspan="1">
          <h:text property="oEmp/userid"/>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          realname
        </td>
        <td colspan="1">
          <h:text property="oEmp/realname"/>
        </td>
        <td class="form_label">
          position
        </td>
        <td colspan="1">
          <h:text property="oEmp/position"/>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          regdate
        </td>
        <td colspan="1">
          <w:date property="oEmp/regdate"/>
        </td>
        <td class="form_label">
          createtime
        </td>
        <td colspan="1">
          <w:date property="oEmp/createtime"/>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          lastmodytime
        </td>
        <td colspan="1">
          <w:date property="oEmp/lastmodytime"/>
        </td>
        <td class="form_label">
          orgid
        </td>
        <td colspan="1">
          <h:text property="oEmp/orgid"/>
        </td>
      </tr>
      
      <tr class="form_bottom">
        <td colspan="6">
          <input type="submit" class="button" value="保存">
          <input type="button" class="button" value="OK" onclick="javascript:window.close();">
          <input type="button" class="button" value="返回" onclick="javascript:history.go(-1);">
        </td>
      </tr>
     --%> 
    </table>
  </w:panel>
  
	<h:hidden property="oOpr/hasopr" />  <%--是否拥有操作者 y/n --%>
	<fieldset id="advOption">
		<legend id="legendId"> 
			<input type="checkbox" id="checkOpr" checked onclick="javascript:isDisplay();" />
			<%=oprInfo %> 
		</legend>
	<div id="tableDiv">
		<h:hidden property="oOpr/operatorid" />
		<table align="center" border="0" width="100%" class="form_table">
			<tr>
				<td class="form_label" width="15%">
				  <!--用户登录名-->
				  <b:message key="empOrgMaintain_oOpr.userid"/><b:message key="l_colon"/>
				</td>
				<td colspan="1" width="35%"><h:text property="oOpr/userid" validateAttr="maxLength=64"/></td>
				<td class="form_label" width="15%">
				  <!--菜单风格-->
				  <b:message key="empOrgMaintain_oOpr.menutype"/><b:message key="l_colon"/>
				</td>
				<td colspan="1"><d:select dictTypeId="ABF_LAYOUTSTYLE" property="oOpr/menutype" style="width:133" nullLabel="<%=pleaseSelect%>" /></td>
			</tr>
			<tr>
				<td class="form_label">
				  <!--用户密码-->
				  <b:message key="empOrgMaintain_oOpr.password"/><b:message key="l_colon"/>
				</td>
				<td colspan="1"><h:password property="oOpr/password" validateAttr="maxLength=100"/></td>
				<td class="form_label">
				  <!--确认密码-->
				  <b:message key="empOrgMaintain_oOpr.secondpsw"/><b:message key="l_colon"/>
				</td>
				<td colspan="1"><h:password property="oOpr/secondpsw" validateAttr="maxLength=100"/></td>
			</tr>
			<tr>
				<td class="form_label">
				  <!--密码失效日-->
				  <b:message key="empOrgMaintain_oOpr.invaldate"/><b:message key="l_colon"/>
				</td>
				<td colspan="1"><w:date property="oOpr/invaldate" /></td>
				<td class="form_label">
				  <!--认证模式-->
				  <b:message key="empOrgMaintain_oOpr.authmode"/><b:message key="l_colon"/>
				</td>
				<td colspan="1"><d:select dictTypeId="ABF_AUTHMODE" property="oOpr/authmode" style="width:133" nullLabel="<%=pleaseSelect%>" /></td>
			</tr>
			<tr>
				<td class="form_label">
				  <!--生效日期-->
				  <b:message key="empOrgMaintain_oOpr.startdate"/><b:message key="l_colon"/>
				</td>
				<td colspan="1"><w:date property="oOpr/startdate" /></td>
				<td class="form_label">
				  <!--失效日期-->
				  <b:message key="empOrgMaintain_oOpr.enddate"/><b:message key="l_colon"/>
				</td>
				<td colspan="1"><w:date property="oOpr/enddate" /></td>
			</tr>
			<tr>
				<td class="form_label">
				  <!--操作员状态-->
				  <b:message key="empOrgMaintain_oOpr.status"/><b:message key="l_colon"/>
				</td>
				<td colspan="1"><d:select dictTypeId="ABF_OPERSTATUS" property="oOpr/status" style="width:133" nullLabel="<%=pleaseSelect%>" /></td>
			</tr>
		</table>
	</div>
	</fieldset>
  <table align="center" border="0" width="100%" class="form_table">  
      <tr class="form_bottom">
        <td colspan="6">
          <input type="button" class="button" value="<b:message key='l_save' />" onclick="javascript:mdfEmpOpr();window.close();">
          <input type="button" class="button" value="<b:message key='l_close' />" onclick="javascript:window.close();">
        </td>
      </tr>
  </table>
</h:form>

<l:equal property="iRtn" targetValue="0" compareType="number" scope="request" >
	<script>
  		alert("<b:message key='l_m_save_success' />");
  		window.close();
	</script>
</l:equal>
<l:lessThan property="iRtn" targetValue="0" compareType="number" scope="request">
	<script>
  		alert("<b:message key='l_m_save_fail' />");
	</script>
</l:lessThan>

</body>
</html>


