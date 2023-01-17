<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common.jsp"%>
<h:css href="/css/style1/style-custom.css"/>
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
</head>
<body topmargin="0" leftmargin="0">

   <e:datasource name="rdproject" type="entity" path="com.primeton.rdmgr.data.rd.RdProject" />
  
<h:form name="dataform1" action="org.gocom.abframe.org.employee.EmployeeManager.flow" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
 
    <h:hidden property="oEmp/empid" />
    <h:hidden property="oEmp/userid" />
    <h:hidden property="oEmp/orgid" />
    <h:hidden property="oEmplevel/emplevelid" />
    <table align="center" border="0" width="100%" class="form_table">
    <b:write property="infoFlag"/>
    <l:notEmpty property="oEmp/empid">
      <tr>
       <td colspan="4" class="eos-panel-title">&nbsp;<%=empInfo %></td>
      </tr>
    </l:notEmpty>
      <tr>
        <td class="form_label">
          <!--人员姓名-->
          <b:message key="empOrgMaintain_oEmp.empname"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/empname" validateAttr="allowNull=false;maxLength=50"/><font style="color:red">*</font>
        </td> 
        <td class="form_label">员工工号<b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/empcode" validateAttr="allowNull=false;maxLength=30"/><font style="color:red">*</font>
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
          <d:select dictTypeId="ABF_CARDTYPE" property="oEmp/cardtype" style="width:133" /><font style="color:red">*</font>
        </td>
        <td class="form_label">
          <!--证件号码-->
          <b:message key="empOrgMaintain_oEmp.cardno"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/cardno" onchange="javascript:return changeCard(this);" validateAttr="maxLength=20;allowNull=false;"/><font style="color:red">*</font>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--入职日期-->
          <b:message key="empOrgMaintain_oEmp.indate"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <w:date property="oEmp/indate" allowNull="false"/><font style="color:red">*</font>
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
          <d:select dictTypeId="ABF_EMPSTATUS" property="oEmp/empstatus" style="width:133"/>
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
          <h:text property="oEmp/ozipcode" validateAttr="maxLength=10;type=chinaZipcode"/>
        </td>
        <td class="form_label">
          <!--办公邮件-->
          <b:message key="empOrgMaintain_oEmp.oemail"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/oemail" validateAttr="maxLength=128;type=email"/>
        </td>        
      </tr>      
      <tr>
        <td class="form_label">开户行名称<b:message key="l_colon"/></td>
        <td colspan="1">
          <h:text property="oEmp/bankname" validateAttr="maxLength=60;"/>
        </td>
        <td class="form_label">开户行帐号<b:message key="l_colon"/></td>
        <td colspan="1">
          <h:text property="oEmp/bankacct" validateAttr="maxLength=30;"/>
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
          <h:text property="oEmp/mobileno" validateAttr="maxLength=14;type=chinaMobile;allowNull=false"/><font style="color:red">*</font>
        </td>        
      </tr>
      <tr>
        <!--微信号 （原MSN）-->
      	<td class="form_label">微信号：</td> 
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
          <h:textarea property="oEmp/haddress" cols="50" rows="1" validateAttr="maxLength=128"/>
        </td>        
      </tr>      
      <tr>
        <td class="form_label">
          <!--办公地址-->
          <b:message key="empOrgMaintain_oEmp.oaddress"/><b:message key="l_colon"/>
        </td>
        <td colspan="3">
          <h:textarea property="oEmp/oaddress" cols="50" rows="1" validateAttr="maxLength=128"/>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <!--家庭邮编-->
          <b:message key="empOrgMaintain_oEmp.hzipcode"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/hzipcode" validateAttr="maxLength=10;type=chinaZipcode"/>
        </td>
        <td class="form_label">
          <!--私人邮箱-->
          <b:message key="empOrgMaintain_oEmp.pemail"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="oEmp/pemail" validateAttr="maxLength=128;type=email;allowNull=true"/>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--政治面貌-->
          <b:message key="empOrgMaintain_oEmp.party"/><b:message key="l_colon"/>
        </td>
        <td colspan="1">  
          <d:select dictTypeId="ABF_PARTYVISAGE" property="oEmp/party" style="width:133" nullLabel="<%=pleaseSelect%>" />
        </td>
        <!--人员类型（原职级）-->
      	<td class="form_label">人员类型：</td>
        <td colspan="1">
          <d:select id="personType1" dictTypeId="AME_EMPTYPE2" property="oEmp/degree" style="width:133" nullLabel="<%=pleaseSelect%>" onchange  ="personType2()"/><font style="color:red">*</font>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--直接主管-->
          <b:message key="empOrgMaintain_oEmp.major"/><b:message key="l_colon"/>
        </td>
        <td>
          <r:comboSelect id="empList" property="oEmp/major" nullText="<%=pleaseSelect%>" 
			queryAction="org.gocom.abframe.org.employee.EmpManager.queryEmpByTemplate.biz"  validateAttr="allowNull=true;"
			textField="empname" valueField="empid" xpath="oaEmp" width="100" initParamFunc="initComboEmpParam"
		  /> 
        </td>
        <td class="form_label">昵称：</td>
        <td><h:text property="oEmp/realname"/></td>
      </tr>
      <tr>        
        <td class="form_label">
          <!--可管理机构-->
          <b:message key="empOrgMaintain_oEmp.orgidlist"/><b:message key="l_colon"/>
        </td>
        <td>
          <w:lookup id="wl_mngorg" property="oEmp/orgidlist" validateAttr="allowNull=true;message=可管理机构可以为空" readonly="true" displayProperty="oEmp/orgidlistname" lookupUrl="/org.gocom.abframe.org.employee.MngorgAssign.flow" dialogTitle="<%=selectMngOrg %>" width="350" height="430">
           <h:param name="mngorgs" property="oEmp/orgidlist" />
          </w:lookup>          
        </td> 
        <td class="form_label">
          <!--可授权角色-->
          <b:message key="empOrgMaintain_oEmp.specialty"/><b:message key="l_colon"/>
        </td>
        <td>
          <w:lookup id="wl_mngrole" property="oEmp/specialty"  validateAttr="allowNull=true;message=可授权角色可以为空" readonly="true"  displayProperty="oEmp/specialtyname" lookupUrl="/org.gocom.abframe.org.employee.MngRoleAssign.flow" dialogTitle="<%=selectReleaseRole %>" width="350" height="430">             
          	<h:param name="mngroles" property="oEmp/specialty" />
          </w:lookup>
        </td>
      </tr>
 	

      <tr>        
        <td class="form_label">
          <!--工作描述-->
          <b:message key="empOrgMaintain_oEmp.workexp"/><b:message key="l_colon"/>
        </td>
        <td colspan="3">
          <h:textarea property="oEmp/workexp" cols="50" rows="2" validateAttr="maxLength=512"/>
        </td>        
      </tr>
      
      <tr>
        <td class="form_label">
          <!--备注-->
          <b:message key="empOrgMaintain_oEmp.remark"/><b:message key="l_colon"/>
        </td>
        <td colspan="3">
          <h:textarea property="oEmp/remark" cols="50" rows="2" validateAttr="maxLength=512"/>
        </td>
      </tr>
    </table>
    <div id="level">
    <table align="center" border="0" width="100%" class="form_table">
		<td class="form_label" style="text-align: left;">
			人员级别信息
		</td>
	</table>
		   	<r:datacell  height="150px" id="cell2" isCount="true"  width="100%" pageSize="80"  submitXpath="oEmp/oEmplevels"  xpath="oEmp/oEmplevels">
				<r:toolbar location="bottom" tools="nav:first prev next last goto,edit:add del,pagesize,info"/>
		  		<r:field fieldName="degree"  label="人员级别">
		      		<d:select dictTypeId="ABF_EMPLEVEL"  id="degree"/>
		  		</r:field>
		      	<r:field fieldName="startdate" width="100" label="有效开始日期" > 
		        	<w:date />
		      	</r:field>
		      	<r:field fieldName="enddate" label="有效截止日期">
		        	<w:date />
		      	</r:field>
		      	<r:field fieldName="isworkrate" label="是否统计工时率">
		      		<d:select  dictTypeId="MIS_YN"/>
		      	</r:field>
		      	<r:field fieldName="currentstate" label="有效状态">
		      		<d:select  dictTypeId="ABF_STATUS"  />
		      	</r:field>
		    </r:datacell>
	</div>
	<h:hidden property="oOpr/hasopr" />  <%--是否拥有操作者 y/n --%>
	<table align="center" border="0" width="100%" class="form_table">
		<tr><td class="form_label" style="text-align: left;">
			<input type="checkbox" id="checkOpr" checked onclick="isDisplay();" />
			<%=oprInfo %> 
		</td></tr>
	</table>
	<div>
		<h:hidden property="oOpr/operatorid" />
		<table align="center" border="0" width="100%" class="form_table" id="tableDiv">
			<tr>
				<td class="form_label" width="15%">
				  <!--用户登录名-->
				  <b:message key="empOrgMaintain_oOpr.userid"/><b:message key="l_colon"/>
				</td>
				<td colspan="1" width="35%">
					<l:notEmpty property="oOpr/operatorid">
						<h:text property="oOpr/userid" validateAttr="maxLength=64" readonly="true"/>
					</l:notEmpty>
					<l:empty property="oOpr/operatorid">
						<h:text property="oOpr/userid" validateAttr="maxLength=64"/>
					</l:empty>
					<font style="color:red">*</font></td>
				<td class="form_label" width="15%">
				  <!--菜单风格-->
				  <b:message key="empOrgMaintain_oOpr.menutype"/><b:message key="l_colon"/>
				</td>
				<td colspan="1"><d:select dictTypeId="ABF_SKINLAYOUT" property="oOpr/menutype" style="width:133" nullLabel="<%=pleaseSelect%>" /></td>
			</tr>
			<tr>
				<td class="form_label">
				  <!--用户密码-->
				  <b:message key="empOrgMaintain_oOpr.password"/><b:message key="l_colon"/>
				</td>
				<td><h:hidden name="oOpr/password" value=""/><h:password name="password" property="oOpr/password" onchange="$name('oOpr/password').value=this.value;" validateAttr="maxLength=100;minLength=6;allowNull=false;" disabled = "true" /><font style="color:red">*</font></td>
				<td class="form_label">
				  <!--操作员状态-->
				  <b:message key="empOrgMaintain_oOpr.status"/><b:message key="l_colon"/>
				</td>
				<td><d:select dictTypeId="ABF_OPERSTATUS" property="oOpr/status" style="width:133" /></td>
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
		</table>
	</div>
	
	
	

  <table align="center" border="0" width="100%" class="form_table">  
      <tr class="form_bottom">
        <td colspan="6">
          <input type="button" class="button" value="<b:message key='l_save' />" name="saveBtn" onclick="saveEmpOpr();">
          <l:present property="_ts" propertyType="parameter">
             <input type="button" class="button" value='<b:message key="l_close"/>' onclick="window.close();">              
          </l:present>
        </td>
      </tr>
  </table>
</h:form>
</body>
<script>

	 var cell2 = $id('cell2');
		
	 
	var personType = "";
	
	function personType3(){
	 	 personType = $id("personType1").value;
		if(personType==2||personType==3){
			document.getElementById("level").style.display="block";//显示
		}else{
			document.getElementById("level").style.display="none";//不显示 
		}
	}
	window.onload=personType3;
	function personType2(){
	 	personType = $id("personType1").value;
		if(personType==2||personType==3){
			document.getElementById("level").style.display="block";//显示
		}else{
			document.getElementById("level").style.display="none";//不显示 
		}
	}
	
	
	//日期转换
	function toDate(str){
	    var sd=str.split("-");
	    return new Date(sd[0],sd[1],sd[2]);
	}
	  
	function changeCard(e){
		var empid = $name("oEmp/empid").value;
		if(e.value.length<6){
			alert("证件号码必须大于等于6位");
			return false;
		}else{
			if(empid == null || empid == ""){
				var passwords = e.value;
				passwords = passwords.substring(passwords.length-6, passwords.length)
				$name("password").value = passwords;
				$name('oOpr/password').value = passwords;
			}
		}
	}  
    function saveEmpOpr(){
        if( $id("checkOpr").checked ) {
        	
        	//alert(personType);
        	
        	$name("oOpr/hasopr").value="y";
        	
        	/* if(personType==null||personType==""){
        		alert("请选择人员类型");
				return false;
        	}  */ 
        	//alert("11");
	    	var ary=[];
	    	for(var i=0; i<cell2.getCurrentRowCount();i++){
		    	var projid = cell2.getCellValue(cell2.getCellByRow(cell2.getRow(i),4));
				var sybm = cell2.getCellValue(cell2.getCellByRow(cell2.getRow(i),0));//人员级别
				var startdate = cell2.getCellValue(cell2.getCellByRow(cell2.getRow(i),1));//有效开始日期
				var enddate = cell2.getCellValue(cell2.getCellByRow(cell2.getRow(i),2));//有效截止日期
				var isworkrate = cell2.getCellValue(cell2.getCellByRow(cell2.getRow(i),3));//是否统计工时率
	    		ary[i] = projid;
	    	 	
	     	var s = ary.join(",")+",";
	    	for(var j=0;j<ary.length;j++) {
				if(s.replace(ary[j]+",","").indexOf(ary[j]+",")>-1) {
					if(ary[j]==1){
						alert("有效状态必须唯一");
						return false;
					}
				}
				if(sybm==null||sybm==""){
					alert("人员级别不能为空");
						return false;
				}
				if(startdate==null||startdate==""){
					alert("有效开始日期不能为空");
						return false;
				}
				if(enddate==null||enddate==""){
					alert("有效截止日期不能为空");
						return false;
				}
				if(isworkrate==null||isworkrate==""){
					alert("是否统计工时率不能为空");
						return false;
				}
				if(projid==null||projid==""){
					alert("有效状态不能为空");
						return false;
				}
				var d1=toDate(startdate);
				var d2=toDate(enddate)
				
				if(d1>=d2){
					alert("有效开始日期必须小于有效截止日期");
					return false;
				}
			}
        	}
        }else{
        	 $name("oOpr/hasopr").value="n";
        	 
        	/*   if(personType==null||personType==""){
        		alert("请选择人员类型");
				return false;
        	}  */
        	 
        	 var ary=[];
        	 
	    	for(var i=0; i<cell2.getCurrentRowCount();i++){
		    	var projid = cell2.getCellValue(cell2.getCellByRow(cell2.getRow(i),4));
				var sybm = cell2.getCellValue(cell2.getCellByRow(cell2.getRow(i),0));//人员级别
				var startdate = cell2.getCellValue(cell2.getCellByRow(cell2.getRow(i),1));//有效开始日期
				var enddate = cell2.getCellValue(cell2.getCellByRow(cell2.getRow(i),2));//有效截止日期
				var isworkrate = cell2.getCellValue(cell2.getCellByRow(cell2.getRow(i),3));//是否统计工时率
	    		ary[i] = projid;
	    	} 	
	     	var s = ary.join(",")+",";
	    	for(var j=0;j<ary.length;j++) {
				if(s.replace(ary[j]+",","").indexOf(ary[j]+",")>-1) {
					if(ary[j]==1){
						alert("有效状态必须唯一");
						return false;
					}
				}
				if(sybm==null||sybm==""){
					alert("人员级别不能为空");
						return false;
				}
				if(startdate==null||startdate==""){
					alert("有效开始日期不能为空");
						return false;
				}
				if(enddate==null||enddate==""){
					alert("有效截止日期不能为空");
						return false;
				}
				if(isworkrate==null||isworkrate==""){
					alert("是否统计工时率不能为空");
						return false;
				}
				if(projid==null||projid==""){
					alert("有效状态不能为空");
						return false;
				}
				var d1=toDate(startdate);
				var d2=toDate(enddate)
				
				if(d1>=d2){
					alert("有效开始日期必须小于有效截止日期");
					return false;
				}			
				
				}
				
				if(sybm != null && sybm != "" ){
					alert("操作员不能为空");
					return false;
				}
			
    	}
        var dcell = $id('cell2');
    	var frm = $name("dataform1");
    //	var dce = dcell.getAllRows(true);
    	dcell.submitAllByHidden();
    	var checkflag = !$id("checkOpr").checked;
    	var userid= $name("oOpr/userid");
    	$name("oOpr/userid").EOS_extendedAttribute=null	
    	if(isIE){
	    	$name("oOpr/userid").validateAttr = setAllowNull($name("oOpr/userid").validateAttr,checkflag);
	    	$name("password").validateAttr = setAllowNull($name("password").validateAttr,checkflag);
    	}else{
	    	$name("oOpr/userid").validateAttr = setAllowNull($name("oOpr/userid").attributes[3].value,checkflag);
		    $name("password").validateAttr = setAllowNull($name("password").attributes[3].value,checkflag);
    	}
    	$name("password").EOS_extendedAttribute=null  	
		
	    
    	if(checkForm(frm)){    	 
    		var result = f_compare_date($name("oEmp/indate").value,$name("oEmp/outdate").value,'yyyy-MM-dd');
		    if(result==1){
		    	f_alert($name("oEmp/outdate"),'<b:message key="empOrgMaintain_oEmp.outdate" /><b:message key="l_date_check" /><b:message key="empOrgMaintain_oEmp.indate" />');
		    	return;
		    }
		    var result1 = f_compare_date($name("oOpr/startdate").value,$name("oOpr/enddate").value,'yyyy-MM-dd');
		    if(result1==1){
		    	f_alert($name("oOpr/enddate"),'<b:message key="empOrgMaintain_oOpr.enddate" /><b:message key="l_date_check" /><b:message key="empOrgMaintain_oOpr.startdate" />');
		    	return;
		    }  
		  var empid = $name("oEmp/empid").value;
		  if(empid){
			  var empstatus = $name("oEmp/empstatus").value;
			  if(empstatus == "leave"){
			  	if(confirm("人员状态改为离职时，将删除微信企业号该人员信息，是否确定修改？")){
			  	}else{
			  		return false;
			  	}
			  } 
		  }else{
		  	if(confirm("新增人员时请确定手机号码是否填写正确，人员新增成功后将会发送短信提醒对方！")){
		  	}else{
		  		return false;
		  	}
		  }
          var myAjax = new Ajax("org.gocom.abframe.org.employee.EmpManager.saveEmployee.biz");          
          myAjax.submitForm(frm);
          var returnNode = myAjax.getResponseXMLDom();
          var wxresult = myAjax.getValue("root/data/wxresult")
          var dxresult = myAjax.getValue("root/data/dxresult")
          if( returnNode && myAjax.getValue("root/data/iRtn") == "0" ) {
		          	if(personType==null||personType==""){
		        		alert("请选择人员类型");
						return false;
		        	} 
                    $name('oOpr/password').value="";
                    if(wxresult){
                    	alert("保存成功，但微信企业号人员未能成功同步，错误原因："+wxresult);
                    }else{
		                alert( '<b:message key="l_m_save_success" />' );  //保存成功 
                    }
                    if(dxresult != 0){
                    	alert("员工短信发送失败，请检查手机号码是否填写正确！");
                    }
	                location.reload() ;//刷新
	                try{
	                	parent.parent.orgTree.getSelectNode().getParent().reloadChild();
	                }catch(e){}
	                <l:present property="_ts" propertyType="parameter">
	                window.close();
	                </l:present>	            
	      } else if( returnNode && myAjax.getValue("root/data/iRtn") == "-2" ){
	           alert( '<b:message key="empOrgMaintain_m_operLinked"/>' );         //操作员已经与其他人员关联 
 	      }else{
	            alert( '<b:message key="l_m_save_fail"/>' );         //保存失败 
          }  
       }  
    }

	function isDisplay() {	
	   var flag = $id("checkOpr").checked;
	   $id("tableDiv").style.display = flag?"":"none";	    	   
	}
	function setAllowNull(vAttr,flag){
	  var options = vAttr.split(';');
	  var found=false;
	  for(var i=0;i<options.length;i++){
	     if(options[i].test('^allowNull=')){
	         options[i]='allowNull='+flag;
	         found = true;
	         break;
	     }
	  }
	  if(!found){
	   options.push('allowNull='+flag);
	  }
	  return options.join(';');
	}	
    function roleBeforeSubmit(lookup){
       lookup.clearParam();
       lookup.addParam('mngroles',lookup.getValue());
       return true;
    }
    function orgBeforeSubmit(lookup){
       lookup.clearParam();
       lookup.addParam('mngorgs',lookup.getValue());
       return true;
    }
    function initComboEmpParam(){
    	return "<oEmp><empstatus>on</empstatus></oEmp>";
    }
    function custInit(){
      $id('checkOpr').checked=!(isNull($('oOpr/operatorid').value));
      isDisplay();
      $id('wl_mngrole').beforeOpenDialog=roleBeforeSubmit;
      $id('wl_mngorg').beforeOpenDialog=orgBeforeSubmit;      
    }
</script>
<script>
	eventManager.add(window,"load",custInit);		
</script>
</html>


