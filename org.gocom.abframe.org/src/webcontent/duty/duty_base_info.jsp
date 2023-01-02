<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common.jsp"%>
<%--
- Author(s): 刘良金
- Date: 2008-08-08 11:15:22
- Description:
--%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
    </title>
    
<%
    //职务基本信息
	String duty_base_info = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_title_posiBaseInfo");
	//请选择
	String pleaseSelect = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
	//选择职务
	String selectDuty = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_title_selectDuty");
 %>    
<script>
    
    
    /* lookup返回参数值是否写入到lookup
     *
    */
    function lookupRetFun( arg ) {
        return true;
    }
    
    /* 
     *  更新职务
     */
    function updateDuty() {
        var frm = $name("form1");
        
        if( !checkForm(frm) ) {
             return;
        }
        if( $("duty/dutytype").value == "" ) {
            f_alert( $("duty/dutytype"), CHECK_MUST_INPUT);   //CHECK_MUST_INPUT js常量，该项为必填项
            return false;
            
        }
        var myAjax = new Ajax("org.gocom.abframe.org.duty.DutyManager.updateDuty.biz");
        myAjax.addParam("duty/dutyid", $name("duty/dutyid").value );
        myAjax.addParam("duty/dutycode", $name("duty/dutycode").value);
        myAjax.addParam("duty/dutyname", $name("duty/dutyname").value);
        myAjax.addParam("duty/remark", $name("duty/remark").value);
        myAjax.addParam("duty/dutytype", $name("duty/dutytype").value);
        myAjax.addParam("duty/omDuty/dutyid", $name("duty/omDuty/dutyid").value);
    
        myAjax.submit();
        var returnNode = myAjax.getResponseXMLDom();
        if( returnNode ) {
            if( myAjax.getValue("root/data/retCode") == 1 ) {
                alert( '<b:message key="l_m_save_success"/>' );  //保存成功
                try{
                    parent.parent.tree1.getSelectNode().getParent().reloadChild();  //刷新左侧树，注意：要刷新的是选中节点的上级节点
		        } catch(e) {
		        }
                window.close();
            } else {
                alert( '<b:message key="l_m_save_fail"/>' );         //保存失败
            }
        } else {
            alert( '<b:message key="l_m_save_fail"/>' );         //保存失败
        }
    }
    
     /*
      *  自定义初始化按钮样式
      */
	 function custInit(){ 
		$id("lookupID").setDisabled(true);   //上级职务不能修改
	 }
</script>    
  </head>
  <body leftmargin="0" topmargin="0">
      <h:form method="post" action="org.gocom.abframe.org.duty.DutyBaseInfo.flow" name="form1">  
        <h:hidden property="duty/dutyid"/>
        <input type="hidden" name="_eosFlowAction" value="update"/>
        <table align="center" border="0" width="100%" class="form_table">
          <tr>
	       <td colspan="4" class="eos-panel-title">&nbsp;<%=duty_base_info %></td>
	      </tr>
          <tr>
            <td class="form_label">    <!-- 上级职务 -->
              <b:message key="dutyManager_omDuty.dutyid"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td colspan="1">
              <w:lookup property="duty/omDuty/dutyid" name="duty/omDuty/dutyid" id="lookupID"  readonly="true" displayProperty="duty/omDuty/dutyname"   dialogTitle="<%=selectDuty %>"  width="350" height="430" lookupUrl="/abframe/org/duty/duty_tree.jsp" onReturnFunc="lookupRetFun"></w:lookup>
              
            </td>
            <td class="form_label">     <!-- 所属套别 -->
              <b:message key="dutyManager_omDuty.dutytype"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td>
                <d:select dictTypeId="ABF_DUTYTYPE"  property="duty/dutytype" disabled="true"  nullLabel="<%=pleaseSelect %>" name="duty/dutytype" style="width:133"/><font style="color:red">*</font>
            </td>
          </tr>
          <tr> 
            <td class="form_label">     <!-- 职务代码 -->
              <b:message key="dutyManager_omDuty.dutycode"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td colspan="1">
               <h:text property="duty/dutycode" validateAttr="maxLength=20;allowNull=false"/><font style="color:red">*</font>
            </td>
            <td class="form_label">      <!-- 职务名称 -->
              <b:message key="dutyManager_omDuty.dutyname"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td colspan="1">
               <h:text property="duty/dutyname" validateAttr="maxLength=30;allowNull=false"/><font style="color:red">*</font>
            </td>
          </tr>
          <tr>
            <td class="form_label" >     <!-- 职务描述 -->
              <b:message key="dutyManager_omDuty.remark"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td  colspan="6">
              <h:textarea property="duty/remark" cols="56" rows="3"  validateAttr="maxLength=255"></h:textarea>
            </td>
          </tr>
          <tr class="form_bottom">
            <td colspan="6">
              <input type="button" class="button" value='<b:message key="l_save"/>' onclick="updateDuty()">              
            </td>
          </tr>
        </table>
      </h:form>
  </body>
</html>


<script language="javascript">
    //初始化页面按钮样式
     eventManager.add(window,"load",custInit); 
</script>