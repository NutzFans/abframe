<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common.jsp"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title><b:message key="OperatorManager_l_operator"></b:message><b:message key="OperatorManager_l_manager"></b:message></title><!-- 操作员管理 -->
    <script language="javascript">
		
		/*
		 * 功能：保存操作员信息
		 *
		 * return 保存成败标志
		 */
		function saveOperator()
		{
			var frm = $name("data_form");
	        
	        //表单验证
	        if(!checkForm(frm)) {
	            return;
	        }
			
		    var myAjax = null;
		    var message;
		    
		    //判断修改还是新增
			if($name("_eosFlowAction").value == "insertSubmit")
			{
				//调用增加逻辑流
			    myAjax = new Ajax("org.gocom.abframe.rights.OperatorManager.insertAcOperator.biz");
			    myAjax.addParam("acoperator/password",$id("acoperator/password").value);
			    message = '<b:message key="OperatorManager_m_add_failed"></b:message>';//增加操作员失败。
			}else{
				myAjax = new Ajax("org.gocom.abframe.rights.OperatorManager.updateAcOperator.biz");
				if($name('passwordchange').value=="0"){
				   myAjax.addParam("acoperator/password",$id("acoperator/password").value);
				}
				message = '<b:message key="OperatorManager_m_update_failed"></b:message>';//修改操作员失败。
			}
			
			
			var stratDate = $id("acoperator/startdate").value; //有效开始日期
			var endDate   = $id("acoperator/enddate").value;//有效截至日期
			if(stratDate!=null)
			   stratDate = stratDate.substring(0,4) + stratDate.substring(5,7) + stratDate.substring(8,10)
			if(endDate!=null)
		      endDate   = endDate.substring(0,4) + endDate.substring(5,7) + endDate.substring(8,10)
			
			//有效开始日期不能大于有效截至日期。
			if(endDate < stratDate)
			{
				alert('<b:message key="OperatorManager_m_date_compare"></b:message>'); //有效开始日期不能大于有效截至日期！
				return false;
			}
		    
		    //增加参数
		    myAjax.addParam("acoperator/operatorid",$id("acoperator/operatorid").value);
		    myAjax.addParam("acoperator/userid",$id("acoperator/userid").value);
		    myAjax.addParam("acoperator/menutype",$id("acoperator/menutype").value);		    
		    myAjax.addParam("acoperator/status",$id("acoperator/status").value);
		    myAjax.addParam("acoperator/operatorname",$id("acoperator/operatorname").value);
		    myAjax.addParam("acoperator/ipaddress",$id("acoperator/ipaddress").value);
		    myAjax.addParam("acoperator/authmode",$id("acoperator/authmode").value);
		    
		    if($id("acoperator/invaldate").value!=null)
		       myAjax.addParam("acoperator/invaldate",$id("acoperator/invaldate").value);
		    if(stratDate!=null)
		       myAjax.addParam("acoperator/startdate",$id("acoperator/startdate").value);
		    if(endDate!=null)
		       myAjax.addParam("acoperator/enddate",$id("acoperator/enddate").value);
		    
		    //开始调用
		    myAjax.submit();
		    
		    //取得调用后的结果(xml对象)
		    var returnNode =myAjax.getResponseXMLDom();
		    
		    var reCode;
		    if(returnNode)
		    {
		    	//获取指定的节点值
		    	reCode = myAjax.getValue("/root/data/reCode");
		    }
		    
		    //判断刷新业务字典信息成败
		    if(reCode == 1)
		    {
		    	alert('<b:message key="l_m_save_success"></b:message>'); //保存成功。
	    		window.close();
		    }else{
	    		alert(message);
	    		return false;
	    	}
		}
		
	</script>
  </head>
  <body leftmargin="0" rightmargin="0" topmargin="0" class="eos-panel-table">
    <e:datasource name="acoperator" type="entity" path="org.gocom.abframe.dataset.privilege.AcOperator" />
    <h:form name="data_form" action="org.gocom.abframe.rights.OperatorManager.flow" method="post" onsubmit="return checkForm(this);">
      <h:hidden property="acoperator/operatorid" id="acoperator/operatorid"/>
      <l:equal property="_eosLastAccessAction" targetValue="update">
        <input type="hidden" name="_eosFlowAction" value="updateSubmit" >
      </l:equal>
      <l:equal property="_eosLastAccessAction" targetValue="insert">
        <input type="hidden" name="_eosFlowAction" value="insertSubmit" >
      </l:equal>
      <h:hidden property="page/begin"/>
      <h:hidden property="page/length"/>
        <table align="center" border="0" width="516" class="form_table">
          <tr>
            <td class="form_label">
              &nbsp;<b:message key="OperatorManager_AcOperator.userid"></b:message><b:message key="DictManager_l_colon"></b:message><!-- 登录用户名： -->
            </td>
            <td colspan="1">
              <h:text property="acoperator/userid" id="acoperator/userid" validateAttr="maxLength=64;allowNull=false;"/>
            </td>
            <td class="form_label">
              &nbsp;<b:message key="OperatorManager_AcOperator.menutype"></b:message><b:message key="DictManager_l_colon"></b:message><!-- 菜单风格： -->
            </td>
            <td colspan="1">
              <d:select dictTypeId="ABF_SKINLAYOUT" id="acoperator/menutype" property="acoperator/menutype" style="width:133"/>
            </td>
          </tr>
          <tr>
            <td class="form_label">
              &nbsp;<b:message key="OperatorManager_AcOperator.password"></b:message><b:message key="DictManager_l_colon"></b:message><!-- 用户密码： -->
            </td>
            <td colspan="1">
              <h:hidden property="passwordchange" value="1" />
              <h:password property="acoperator/password" id="acoperator/password" onchange="$name('passwordchange').value=0" style="width:133" validateAttr="maxLength=100;minLength=4;allowNull=false;"/>
            </td>
            <td class="form_label">
              &nbsp;<b:message key="OperatorManager_l_operator"></b:message><b:message key="OperatorManager_l_status"></b:message><b:message key="DictManager_l_colon"></b:message><!-- 操作员状态： -->
            </td>
            <td colspan="1">
              <d:select dictTypeId="ABF_OPERSTATUS" id="acoperator/status" property="acoperator/status" style="width:133" />
            </td>
          </tr>
          <tr>
            <td class="form_label">
              &nbsp;<b:message key="OperatorManager_l_operator"></b:message><b:message key="OperatorManager_l_name"></b:message><b:message key="DictManager_l_colon"></b:message><!-- 操作员名称： -->
            </td>
            <td colspan="1">
              <h:text property="acoperator/operatorname" id="acoperator/operatorname" validateAttr="maxLength=64;allowNull=false;"/>
            </td>
            <td class="form_label">
              &nbsp;<b:message key="OperatorManager_AcOperator.authmode"></b:message><b:message key="DictManager_l_colon"></b:message><!-- 认证模式： -->
            </td>
            <td colspan="1">
              <d:select dictTypeId="ABF_AUTHMODE" id="acoperator/authmode" property="acoperator/authmode" style="width: 133" value="local"/>
            </td>
          </tr>
          <tr>
            <td class="form_label">
              &nbsp;<b:message key="OperatorManager_AcOperator.ipaddress"></b:message><b:message key="DictManager_l_colon"></b:message><!-- IP地址： -->
            </td>
            <td colspan="1">
              <h:text property="acoperator/ipaddress" id="acoperator/ipaddress" validateAttr="maxLength=128;type=IP;"/>
            </td>
            <td class="form_label">
              &nbsp;<b:message key="OperatorManager_AcOperator.invaldate"></b:message><b:message key="DictManager_l_colon"></b:message><!-- 密码失效日期： -->
            </td>
            <td colspan="1">
              <w:date property="acoperator/invaldate" id="acoperator/invaldate"/>
            </td>
          </tr>
          <tr>
            <td class="form_label">
              &nbsp;<b:message key="OperatorManager_AcOperator.startdate"></b:message><b:message key="DictManager_l_colon"></b:message><!-- 有效开始日期： -->
            </td>
            <td colspan="1">
              <w:date property="acoperator/startdate" id="acoperator/startdate"/>
            </td>
            <td class="form_label">
              &nbsp;<b:message key="OperatorManager_AcOperator.enddate"></b:message><b:message key="DictManager_l_colon"></b:message><!-- 有效截至日期： -->
            </td>
            <td colspan="1">
              <w:date property="acoperator/enddate" id="acoperator/enddate"/>
            </td>
          </tr>
          <tr class="form_bottom">
            <td colspan="6">
              <input type="button" class="button" value='<b:message key="l_save"></b:message>' onclick="saveOperator();">  <!-- 保存 -->
              <input type="button" class="button" value='<b:message key="l_close"></b:message>' onclick="javascript:window.close();"> <!-- 关闭 -->
            </td>
          </tr>
        </table>
    </h:form>
  </body>
</html>