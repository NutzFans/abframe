<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
    //请选择
    String pleaseSelect = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
    //选择职务
    String selectDuty = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_title_selectDuty");
%>

<script>
    /*
     *  lookup返回参数
     */
    function lookupRetFun( arg ) {     
        $name("duty/dutytype").value = arg[2];        
        return true;
    }
    
    /*
     *  保存职务
     */ 
    function saveDuty() {
        var frm = $name("data_form");
        
        if( !checkForm(frm) ) {           
            return false;
        }        
        var myAjax = null;
        if( $name("_eosFlowAction").value == "insertSubmit"  ) {
            myAjax = new Ajax("org.gocom.abframe.org.duty.DutyManager.addDuty.biz");
        } else {
            myAjax = new Ajax("org.gocom.abframe.org.duty.DutyManager.updateDuty.biz");
        }
         
        /*
        if( frm ){
			for(var i = 0; i < frm.elements.length; i++){
				var elem = frm.elements[i];
				if( elem.name ){
					myAjax.addParam(elem.name, getElementValue(elem) );
				}
			}
		}
        */
        
        myAjax.submitForm(frm);
        var returnNode = myAjax.getResponseXMLDom();
        if( returnNode ) {
            if( myAjax.getValue("root/data/retCode") == 1 )
                alert( '<b:message key="l_m_save_success"/>' );      //保存成功
            else {
                alert( '<b:message key="l_m_save_fail"/>' );         //保存失败
            }
        } else {
            alert( '<b:message key="l_m_save_fail"/>' );             //保存失败
        }
        
        window.close();
    }
    
     /*
      *  自定义初始化按钮样式
      */
	 function custInit(){  
		
		//如果是修改职务信息，初始化上级职务和职务套别不能修改
	    <l:present property="duty/dutyid">
	         $id("lookupID").setDisabled(true);
	         $name("duty/dutytype").disabled = true;
	    </l:present>
	    <l:equal property="_eosLastAccessAction" targetValue="insertRoot">
	    	 $id("lookupID").setDisabled(true);
	         $name("duty/dutytype").disabled = true;
	    </l:equal>
	     <l:present property="duty/omDuty/dutyid">
	         $id("lookupID").setDisabled(true);
	         $name("duty/dutytype").disabled = true;
	    </l:present>
	 }
</script>

</head>
<body  leftmargin="0" topmargin="0" bottommargin="0" rightmargin="0" class="eos-panel-table">

    <table align="center" border="0" width="446" class="form_table">
      <h:form name="data_form" action="org.gocom.abframe.org.duty.DutyMain.flow" method="post" onsubmit="return checkForm(this);">
     
      <h:hidden property="duty/dutyid"/>  
      <l:equal property="_eosLastAccessAction" targetValue="update">
        <input type="hidden" name="_eosFlowAction" value="updateSubmit" >
      </l:equal>
      <l:equal property="_eosLastAccessAction" targetValue="insert">
        <input type="hidden" name="_eosFlowAction" value="insertSubmit" >
      </l:equal>
      <l:equal property="_eosLastAccessAction" targetValue="insertRoot">
        <input type="hidden" name="_eosFlowAction" value="insertSubmit" >
      </l:equal>
      
      <h:hidden property="page/length"/>
      <h:hidden property="page/begin"/>
      <h:hidden property="page/isCount"/>
          <tr>
            <td class="form_label">   <!-- 上级职务 -->
              <b:message key="dutyManager_omDuty.dutyid" /><b:message key="l_colon" />
            </td>
            <td colspan="1">
              <w:lookup property="duty/omDuty/dutyid" readonly="true" id="lookupID" name="parentDutyID"  displayProperty="duty/omDuty/dutyname"  dialogTitle="<%=selectDuty %>"  width="350" height="430" lookupUrl="/abframe/org/duty/duty_tree.jsp" onReturnFunc="lookupRetFun"></w:lookup>
            </td>  
            <td class="form_label">   <!-- 所属套别 -->
              <b:message key="dutyManager_omDuty.dutytype" /><b:message key="l_colon" />
            </td>
            <td>
                <l:present property="parentDutytype">
                    <d:select dictTypeId="ABF_DUTYTYPE" property="parentDutytype" name="duty/dutytype" disabled="true"  style="width:133"/> <font style="color:red">*</font>
                </l:present>
                <l:notPresent property="parentDutytype">
                    <d:select dictTypeId="ABF_DUTYTYPE" property="duty/dutytype"   style="width:133"/> <font style="color:red">*</font>
                </l:notPresent>
            </td>
          </tr>
          <tr>
            <td class="form_label">   <!-- 职务代码 -->
              <b:message key="dutyManager_omDuty.dutycode" /><b:message key="l_colon"/>
            </td>
            <td colspan="1">
               <h:text property="duty/dutycode" validateAttr="maxLength=20;allowNull=false;" /><font style="color:red">*</font>
            </td>
            <td class="form_label">   <!-- 职务名称 -->
              <b:message key="dutyManager_omDuty.dutyname" /><b:message key="l_colon"/>
            </td>
            <td colspan="1">
               <h:text property="duty/dutyname" validateAttr="maxLength=30;allowNull=false;"/><font style="color:red">*</font>
            </td>
          </tr>
          <tr>
            <td class="form_label" >   <!-- 职务描述 -->
              <b:message key="dutyManager_omDuty.remark" /><b:message key="l_colon"/>
            </td>
            <td  colspan="6">
              <h:textarea property="duty/remark"  style="width:350" rows="3"  validateAttr="maxLength=255"/>
            </td>
          </tr>          
          <tr class="form_bottom">
            <td colspan="6">
              <input type="button" class="button" value='<b:message key="l_save"/>' onclick="saveDuty()">
              <input type="button" class="button" value='<b:message key="l_close"/>' onclick="javascript:window.close();">
            </td>
          </tr>
          </h:form>
        </table>
 
</body>
</html>

<script language="javascript">
    //初始化页面按钮样式
     eventManager.add(window,"load",custInit); 
</script>