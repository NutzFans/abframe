<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common.jsp"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
    </title>
<%
    //岗位基本信息
    String posi_base_info = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_title_posiBaseInfo");
    //请选择
    String pleaseSelect = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
    //选择机构
    String selectOrg = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_title_selectOrg");
    //选择职务
    String selectDuty = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_title_selectDuty");
    //选择上级岗位
    String selectUpPosi = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_title_selectUpPosition");
   //panelid
   String lookid ="lookupid";
 %>
 
 <script language="javascript">    
    /*
     *  lookup返回函数
     *  param0: arg lookup返回值
     */
     
    function lookupRetFun( arg ) {
        return true;
     }
      
    function f_check_unique(obj){
    	var myAjax = new Ajax("org.gocom.abframe.tools.CommonUtil.uniqueValidate.biz");
 
		myAjax.addParam("dataType","org.gocom.abframe.dataset.organization.OmPosition");
		myAjax.addParam("property","posicode");
		myAjax.addParam("validateValue",obj.value);
		 
		myAjax.submit();
		var rtn = myAjax.getValue("root/data/isUnique");
		if(rtn!="-1"){
			if(rtn=="0"){
				f_alert(obj,"<b:message key='posicode_unique'/>");
				return false;
			}
		}else{
			alert("<b:message key='posicode_unique_faild'/>");
			return false;
		}
		return true;
    }
    
    /*  
     *  更新岗位
     */
     function doSave() {
        var frm = $name("form1");
        var podicodeO = $name("position/posicode");
        var myAjax;
        if( checkForm(frm) ) {
          if($name("position/positionid").value==null || $name("position/positionid").value==""){
          		if(f_check_unique(podicodeO)){
	           		myAjax = new Ajax("org.gocom.abframe.org.position.PositionManager.addPosition.biz");
	           }else{
	           	return false;
	           }
	        }else{
	           myAjax = new Ajax("org.gocom.abframe.org.position.PositionManager.updatePosition.biz");
	        }
	        dateResult = f_compare_date($name('position/startdate').value,$name('position/enddate').value,'yyyy-MM-dd');
          	if(dateResult==1){
          		f_alert( $name('position/enddate'),"<b:message key='positionManager_Omposition.endtime' /><b:message key='l_date_check' /><b:message key='positionManager_Omposition.starttime' />" );
          		return false;
          	}
        
        myAjax.submitForm(frm);
        var returnNode = myAjax.getResponseXMLDom();
        if( returnNode ) {
            if( myAjax.getValue("root/data/retCode") == 1 ) {
                alert( '<b:message key="l_m_save_success"/>' );  //保存成功 
                
                <l:notPresent property="_ts" propertyType="parameter">
                try{
                   //刷新左边岗位树                   	
                       parent.parent.tree1.getSelectNode().reloadChild();
		        } catch(e) {
		        }
		         try{
                   //刷新左边岗位树                   	
                   	parent.parent.orgTree.getSelectNode().getParent().reloadChild();
		        } catch(e) {
		        }
		        try{
                	parent.parent.window.frames['groupTree'].groupTree.getSelectNode().getParent().reloadChild();  //刷新左侧工作组树，注意：要刷新的是选中节点的上级节点
                }catch(e){}
		        </l:notPresent>
		        <l:present property="_ts" propertyType="parameter">
                   window.returnValue=true;
                   window.close();
                </l:present>
            } else {
                alert( '<b:message key="l_m_save_fail"/>' );         //保存失败 
            }
        } else {
            alert( '<b:message key="l_m_save_fail"/>' );         //保存失败 
        }
        }
        return false;
    }
</script>
  </head>
  <body leftmargin="0px" topmargin="0px">
  <h:form method="post"  name="form1">  
    <h:hidden property="position/positionid"/>
    <h:hidden property="position/positype"/>
	<l:present property="_ts" propertyType="parameter">
        <input type="hidden" name="_eosFlowAction" value="insert"/> 
        <table align="center" border="0" width="100%" class="form_table">
           <tr>
             <td class="form_label">   <!--  岗位名称 -->
              <b:message key="positionManager_OmPosition.posiname"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td colspan="1">
              <h:text property="position/posiname" validateAttr="maxLength=128;allowNull=false;"/><font style="color:red">*</font>
            </td>
             <td class="form_label">  <!-- 岗位代码  -->
              <b:message key="positionManager_OmPosition.posicode"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td colspan="1">
              <h:text property="position/posicode" validateAttr="maxLength=20;allowNull=false;"/><font style="color:red">*</font>
            </td>
          </tr>
          <tr>
            <td class="form_label">
             <b:message key="positionManager_OmPosition.omOrganization.orgid(orgname)"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td colspan="1"> <!-- 所属机构 -->
              <w:lookup property="position/omOrganization/orgid" validateAttr="allowNull=true;" readonly="true" displayProperty="position/omOrganization/orgname" lookupUrl="/abframe/org/organization/org_tree_select.jsp"  dialogTitle="<%=selectOrg %>" width="350" height="430"></w:lookup>
            </td> 
            <td class="form_label">   <!--  所属职务 -->
             <b:message key="positionManager_OmPosition.omDuty.dutyid(dutyname)"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td colspan="1">
              <w:lookup property="position/omDuty/dutyid" validateAttr="allowNull=true;" readonly="true" displayProperty="position/omDuty/dutyname"  dialogTitle="<%=selectDuty %>"  width="350" height="430" lookupUrl="/abframe/org/duty/duty_tree.jsp" onReturnFunc="lookupRetFun"></w:lookup>
            </td>
          </tr>
          <h:hidden property="position/omPosition/positionid"/><!--上级岗位-->
          <tr>
            <td class="form_label">   <!-- 有效时间  -->
              <b:message key="positionManager_Omposition.starttime"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td colspan="1">
              <w:date property="position/startdate"/>
            </td>
            <td class="form_label">  <!-- 失效时间 -->
              <b:message key="positionManager_Omposition.endtime"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td colspan="1">
              <w:date property="position/enddate"/>
            </td>
          </tr>
          <tr class="form_bottom">
            <td colspan="6">
              <input type="button" class="button" value='<b:message key="l_save"/>' onclick="doSave();">
              <input type="button" class="button" value='<b:message key="l_close"/>' onclick="javascript:window.close();">              
            </td>
          </tr>
        </table>
	</l:present>  
	<l:notPresent property="_ts" propertyType="parameter"> 
        <input type="hidden" name="_eosFlowAction" value="update"/>         
        <table align="center" border="0" width="100%" class="form_table">
          <tr>
	       <td colspan="4" class="eos-panel-title">&nbsp;<%=posi_base_info %></td>
	      </tr>
          
          <tr>
             <td class="form_label">   <!--  岗位名称 -->
              <b:message key="positionManager_OmPosition.posiname"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td colspan="1">
              <h:text property="position/posiname" validateAttr="maxLength=128;allowNull=false;"/><font style="color:red">*</font>
            </td>
             <td class="form_label">  <!-- 岗位代码  -->
              <b:message key="positionManager_OmPosition.posicode"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td colspan="1">
              <h:text property="position/posicode" validateAttr="maxLength=20;allowNull=false;"/><font style="color:red">*</font>
            </td>
          </tr>
          <tr>
            <td class="form_label">
             <b:message key="positionManager_OmPosition.omOrganization.orgid(orgname)"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td colspan="1"> <!-- 所属机构 -->
              <w:lookup property="position/omOrganization/orgid" validateAttr="" readonly="true" displayProperty="position/omOrganization/orgname" lookupUrl="/abframe/org/organization/org_tree_select.jsp"  dialogTitle="<%=selectOrg %>" width="350" height="430"></w:lookup>
            </td> 
            <td class="form_label">   <!--  所属职务 -->
             <b:message key="positionManager_OmPosition.omDuty.dutyid(dutyname)"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td colspan="1">
              <w:lookup property="position/omDuty/dutyid" validateAttr="allowNull=true;" readonly="true" displayProperty="position/omDuty/dutyname"  dialogTitle="<%=selectDuty %>"  width="350" height="430" lookupUrl="/abframe/org/duty/duty_tree.jsp" onReturnFunc="lookupRetFun"></w:lookup>
            </td>
          </tr>
          <h:hidden property="position/omPosition/positionid"/><!--上级岗位-->         
          <tr>
            <td class="form_label">   <!-- 有效时间  -->
              <b:message key="positionManager_Omposition.starttime"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td colspan="1">
              <w:date property="position/startdate"/>
            </td>
            <td class="form_label">  <!-- 失效时间 -->
              <b:message key="positionManager_Omposition.endtime"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td colspan="1">
              <w:date property="position/enddate"/>
            </td>
          </tr>
          <tr class="form_bottom">
            <td colspan="6">
              <input type="button" class="button" value='<b:message key="l_save"/>' onclick="doSave();">                          
            </td>
          </tr>
        </table>
	</l:notPresent>      
  </h:form>
  </body>
</html>