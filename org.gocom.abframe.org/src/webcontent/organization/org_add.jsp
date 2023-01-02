<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("orgSubMaintain_l_title_addOrg");
	String pleaseSelect=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title><%=title%></title>
</head>
<body style="overflow:hidden">
<h:form name="dataform1" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);" >
  
    <table align="center" border="0" width="100%" class="form_table">
      <h:hidden name="oOrg/omOrganization/orglevel" property="porg/orglevel"/>
      <h:hidden name="oOrg/omOrganization/orgseq" property="porg/orgseq"/>
      
      <h:hidden property="oOrg/orgid"/>
      <h:hidden name="oOrg/updator" property="userObject/attributes/empid" scope="session"/>
      <h:hidden property="oOrg/subcount"/>
      <h:hidden property="oOrg/orglevel"/>
      <h:hidden property="oOrg/orgseq"/>
      <h:hidden property="oOrg/orgmanager"/>
      <h:hidden property="oOrg/isleaf"/>
      <tr>
        <td class="form_label">
          <!--机构名称-->
          <b:message key="orgSubMaintain_OmOrganization.orgname"></b:message><b:message key="l_colon"></b:message>        
        </td>
        <td colspan="1">
          <h:text property="oOrg/orgname" validateAttr="allowNull=false;maxLength=64"/><font style="color:red">*</font>
        </td>
        <td class="form_label" >
          <!--机构代码-->
          <b:message key="orgSubMaintain_OmOrganization.orgcode"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
           <h:hidden name="h_orgcode" property="oOrg/orgcode"  />
          <h:text property="oOrg/orgcode" validateAttr="allowNull=false;maxLength=32;type=unique"/><font style="color:red">*</font>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          <!--上级机构-->
          <b:message key="orgSubMaintain_OmOrganization.omOrganization.orgid"></b:message><b:message key="l_colon"></b:message>        
        </td>
        <td colspan="1">
          <h:hidden name="oOrg/omOrganization/orgid" property="porg/orgid"/>
          <h:text name="oOrg/omOrganization/orgname" property="porg/orgname" readonly="true" />          
        </td>      
        <td class="form_label">
          <!--机构类型-->
          <b:message key="orgSubMaintain_OmOrganization.orgtype"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_ORGTYPE" extAttr="allowNull=false;" property="oOrg/orgtype" style="width:133" nullLabel='<%=pleaseSelect%>'/><font style="color:red">*</font>
        </td>      
      </tr>
      <tr> 
        <td class="form_label">
          <!--机构等级-->
          <b:message key="orgSubMaintain_OmOrganization.orgdegree"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_ORGDEGREE" extAttr="allowNull=false;" property="oOrg/orgdegree" style="width:133" nullLabel="<%=pleaseSelect%>"/><font style="color:red">*</font>
        </td>             
        <td class="form_label">
          <!--机构状态-->
          <b:message key="orgSubMaintain_OmOrganization.status"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_ORGSTATUS" property="oOrg/status" style="width:133"/>
        </td> 
      </tr>
      <tr>
        <td class="form_label">
          <!--排列顺序-->
          <b:message key="orgSubMaintain_OmOrganization.sortno"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/sortno" validateAttr="type=number"/>
        </td>      
        <td class="form_label">
          <!--所属地域-->
          <b:message key="orgSubMaintain_OmOrganization.area"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/area" validateAttr="maxLength=40"/>
        </td>      
      </tr>
      <tr>
         <td class="form_label">
          <!--机构地址-->
          <b:message key="orgSubMaintain_OmOrganization.orgaddr"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/orgaddr" validateAttr="maxLength=256"/>
        </td>      
        <td class="form_label">
          <!--邮编-->
          <b:message key="orgSubMaintain_OmOrganization.zipcode"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/zipcode" validateAttr="maxLength=10"/>
        </td>
      </tr>
      <tr>  
        <td class="form_label">
          <!--机构主管岗位-->
          <b:message key="orgSubMaintain_OmOrganization.manaposition"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">        	
        	 <r:comboSelect id="posiList" property="oOrg/manaposition" nullText="<%=pleaseSelect %>"
			queryAction="org.gocom.abframe.org.organization.OrgManager.queryPosiByTemplate.biz" 
			textField="posiname" valueField="positionid" xpath="oaPosi" width="150" initParamFunc="initComboPosiParam"
		  />  
        </td>            
        <td class="form_label">
          <!--机构主管人员-->
          <b:message key="orgSubMaintain_OmOrganization.managerid"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">编辑时设置</td>
      </tr>
      <tr>
        <td class="form_label">
          <!--联系人-->
          <b:message key="orgSubMaintain_OmOrganization.linkman"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/linkman" validateAttr="maxLength=30"/>
        </td>      
        <td class="form_label">
          <!--联系电话-->
          <b:message key="orgSubMaintain_OmOrganization.linktel"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/linktel" validateAttr="maxLength=20"/>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <!--电子邮件-->
          <b:message key="orgSubMaintain_OmOrganization.email"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/email" validateAttr="maxLength=128"/>
        </td>      
        <td class="form_label">
          <!--网站地址-->
          <b:message key="orgSubMaintain_OmOrganization.weburl"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="oOrg/weburl" validateAttr="maxLength=512"/>
        </td>      

      </tr>
      <tr>
        <td class="form_label">
          <!--生效日期-->
          <b:message key="orgSubMaintain_OmOrganization.startdate"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <w:date property="oOrg/startdate"/>
        </td>              
        <td class="form_label">
          <!--失效日期-->
          <b:message key="orgSubMaintain_OmOrganization.enddate"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <w:date property="oOrg/enddate"/>
        </td>
      </tr>
      <tr>        
        <td class="form_label">
         		审批层级
        </td>
        <td colspan="3">
            <d:select dictTypeId="AME_FEELEVEL" value="1" extAttr="allowNull=false;" property="oOrg/approlevel" style="width:170" nullLabel='<%=pleaseSelect%>'/><font style="color:red">*</font>
        </td>
      </tr>
      <tr>        
        <td class="form_label">
          <!--备注-->
          <b:message key="orgSubMaintain_OmOrganization.remark"></b:message><b:message key="l_colon"></b:message>
        </td>
        <td colspan="3">
          <h:textarea property="oOrg/remark" cols="60" rows="2" validateAttr="maxLength=512"/>
        </td>
      </tr>
      <tr class="form_bottom">
        <td colspan="4">
          <input type="button" class="button" value="<b:message key='l_save' />" onclick="javascript:addOpr();">
          <input type="button" class="button" value="<b:message key='l_close' />" onclick="javascript:window.close();">
        </td>
      </tr>
    </table>
</h:form>
</body>
</html>
<script>
       
    function initComboPosiParam(){
    	return "<oPosi><omOrganization><orgid>"+$name("oOrg/orgid").value+"</orgid></omOrganization></oPosi>" ;
    }    
    function initComboEmpParam(){
    	return "<oEmp><orgid>"+$name("oOrg/orgid").value+"</orgid></oEmp>" ;
    }     
    function addOpr() {
        var ajax = new Ajax("org.gocom.abframe.org.organization.OrgManager.addOrg.biz");        
		var frm = $name("dataform1");
        if(checkForm(frm)){
        	if($name("oOrg/orgtype").value == ""){
        		alert("机构类型必选，涉及到财务与U8对接，如果对机构类型有疑问，请联系财务确认！谢谢！");
        		return;
        	}
        	if($name("oOrg/orgdegree").value == ""){
        		alert("机构等级必选！如果是事业部的部门，请选择事业部部门；如果是公司级的部门，请选择公司级部门！谢谢！");
        		return;
        	}
        	if($name("oOrg/approlevel").value == ""){
        		alert("审批层级必选！销售部门一定是受益部门内！谢谢！");
        		return;
        	}
          	dateResult = f_compare_date($name('oOrg/startdate').value,$name('oOrg/enddate').value,'yyyy-MM-dd');
          	if(dateResult==1){
          		f_alert( $name('oOrg/enddate'),"<b:message key='orgSubMaintain_OmOrganization.enddate' /><b:message key='l_date_check' /><b:message key='orgSubMaintain_OmOrganization.startdate' />" );
          		return false;
          	}
          	ajax.submitForm(frm);            
	        var rtnNode = ajax.getResponseXMLDom();
	        if( rtnNode ) {
	            if( ajax.getValue("root/data/iRtn") == 0 ){
	                alert( "<b:message key='l_m_save_success' />" );
					window.close();
	            }else {
	                alert( "<b:message key='l_m_save_fail' />" );    
	            }  
	        } else {
	            alert( "<b:message key='l_m_save_fail' />" ); 
	        }
        }
    }
    
    function f_check_unique(obj){
        var ret = true;
        if($name('h_orgcode').value!=obj.value){
	    	var myAjax = new Ajax("org.gocom.abframe.tools.CommonUtil.uniqueValidate.biz");
	 
			myAjax.addParam("dataType","org.gocom.abframe.dataset.organization.OmOrganization");
			myAjax.addParam("property","orgcode");
			myAjax.addParam("validateValue",obj.value);
			 
			myAjax.submit();
			var rtn = myAjax.getValue("root/data/isUnique");
			if(rtn!="-1"){
				if(rtn=="0"){
					f_alert(obj,"<b:message key='orgcode_unique'/>");
					ret = false;
				}
			}else{
				alert("<b:message key='orgcode_unique_faild'/>");
				ret =  false;
			}
		}
		return ret;
    }
   
</script>  
 



 