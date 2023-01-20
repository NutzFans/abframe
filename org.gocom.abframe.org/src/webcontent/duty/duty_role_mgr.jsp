<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>

<%
	//未授予角色
	String notGrantRole = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionRole_l_title_notGrantRole");
	//已授予角色
	String haveBeenGrantRole = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionRole_l_title_haveBeenGrantRole");
	//角色功能列表
	String roleFuncList = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionRole_l_title_roleFuncList");
	//角色名称
	String funcname = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionRole_AcFunction.funcname");
%>

<script>
    var datacellObj = null;
    
    /* 
     *  双击角色，查看角色功能列表
     */ 
    function dbclick( value ) {
      datacellObj.queryAction = "org.gocom.abframe.rights.role.RoleManager.queryRoleFunction.biz";
      $name("roleFunc/acRole/roleid").value = value;
      datacellObj.reload();
    }
    
    var dutyid = '<b:write property="duty/dutyid"/>';
    
    /* 
     *  查询所有功能列表
     */
    function allFunc() {
        $name("partyRole/partyid").value = dutyid;
        datacellObj.queryAction = "org.gocom.abframe.org.duty.DutyManager.queryDutyRoleFuncAll.biz";
        datacellObj.reload();
    }
    
    /* 
     *  删除已经授予角色
     */
    function deleteRecord( ) {
        var bSelect = false;
        var s1 = $id("dutyRole");
        var myAjax = new Ajax("org.gocom.abframe.org.duty.DutyManager.deleteDutyrole.biz");
        
        for (i=0; i < s1.options.length; i++) {
		    if (s1.options[i].selected) {
		        bSelect = true;
		        myAjax.addParam("partyRole[" + (i+1) + "]/roleid", s1.options[i].value);
		    }
		}
		if( !bSelect ) {
		    alert( '<b:message key="positionRole_l_m_alert_notSelectRole"/>' );
		    return;
		}
		myAjax.addParam("duty/dutyid", '<b:write property="duty/dutyid"/>');
		myAjax.submit();
        var returnNode = myAjax.getResponseXMLDom(); 
        if( returnNode ) {
            if( myAjax.getValue("root/data/retCode") == 1 ) {
	            moveSelectedOptions($id('dutyRole'), $id('dutyRolesAllowAdd'), 20);
	            alert( '<b:message key="positionRole_l_m_alert_roleDelSuccess"/>' );   //角色删除成功  
	        } else {
	            alert( '<b:message key="positionRole_l_m_alert_roleDelFail"/>' );      //角色删除失败 
	        }
        } else {
            alert( '<b:message key="positionRole_l_m_alert_roleDelFail"/>' );      //角色删除失败  
        }
    }
    
    /*
     *  给职位增加角色
     */
    function addRecord(  ) {
        var bSelect = false;
        var s1 = $id("dutyRolesAllowAdd");
        var myAjax = new Ajax("org.gocom.abframe.org.duty.DutyManager.addDutyRole.biz");
        
        for (i=0; i < s1.options.length; i++) {
		    if (s1.options[i].selected) {
		        bSelect = true;
		        myAjax.addParam("partyRole[" + (i+1) + "]/roleid", s1.options[i].value);
		    }
		}
		if( !bSelect ) {
		    alert( '<b:message key="positionRole_l_m_alert_notSelectRole"/>' );
		    return;
		}
        myAjax.addParam("duty/dutyid", '<b:write property="duty/dutyid"/>');
        myAjax.submit();
        var returnNode = myAjax.getResponseXMLDom(); 
        if( returnNode ) {
            if( myAjax.getValue("root/data/retCode") == 1 ) {
                moveSelectedOptions($id('dutyRolesAllowAdd'),$id('dutyRole'),20);
                alert( '<b:message key="positionRole_l_m_alert_roleAddSuccess"/>' );   //角色增加成功 
            } else {
                alert( '<b:message key="positionRole_l_m_alert_roleAddFail"/>' );      //角色增加失败 
            }
        } else {
            alert( '<b:message key="positionRole_l_m_alert_roleAddFail"/>' );      //角色增加失败
        }
    }
    
     /*
      *  自定义初始化按钮样式
      */
	 function custInit(){  
	
		datacellObj = $id("id1");
		//给datacell设定自定义按钮
        //datacellObj.setCustomTool("<a href='javascript:allFunc();'>All</a>");
	 }
</script>

</head>
<body topmargin="0" leftmargin="0">
    <TABLE border="0" width="90%" cellspacing="0">
		<TR>
		    	<TD width="15%" valign="top">
		        <h:form name="posiRoleForm" action="org.gocom.abframe.position.EmpQueryInput.flow" method="post">
		                 <table align="center" border="0" width="100%" class="EOS_table">
				             <tr>
						       <td class="eos-panel-title">&nbsp;<%=haveBeenGrantRole %></td>
						      </tr>
				             <tr>
				                 <td width="100%">
				                     <h:select  multiple="true" style="width:100%;height:382;" id="dutyRole" ondblclick="dbclick(this.value)">
				                         <l:iterate id="dutyRoles" property="dutyRoles" >
				                             <h:option labelField="acRole/rolename" valueField="acRole/roleid" iterateId="dutyRoles"/>
				                         </l:iterate>
				                 	 </h:select>
				                 </td>
				             </tr>
				         </table>
		        </h:form>
		      	</td>
		        <td width="5%" align="center" valign="middle">
	         	    <input type="button" class="button" value="&nbsp;&gt;&gt;&nbsp;" style="width:30" onclick="deleteRecord();"/><br><br>
	         	    <input type="button" class="button" value="&nbsp;&lt;&lt;&nbsp;" style="width:30" onclick="addRecord();"/>
         	    </td>
         	    <td width="45%" height="380" valign="top">
		        <h:form name="noPosiRoleForm" action="org.gocom.abframe.position.EmpQueryInput.flow" method="post">
		                <table align="center" border="0" width="100%" class="EOS_table">
				          <tr>
						       <td colspan="2" class="eos-panel-title">&nbsp;<%=notGrantRole %></td>
						      </tr>
				          <tr>
				              <td width="35%">
			                     <h:select  multiple="true" style="width:100%;height:382" id="dutyRolesAllowAdd" ondblclick="dbclick(this.value)">
			                         <l:iterate id="dutyRolesAllow" property="dutyRolesAllow" >
			                             <h:option labelField="rolename" valueField="roleid" iterateId="dutyRolesAllow"/>
			                         </l:iterate>
			                 	 </h:select>
				                 </td>
				              <td height="100%">
				              <r:datacell  id="id1"
					            queryAction="org.gocom.abframe.rights.role.RoleManager.queryRoleFunction.biz"
					            xpath="roleFuncs"
					            width="100%"
					            height="382" initParamFunc="" paramFormId="datacellForm">
					            <r:field fieldName="acFunction/funcname" label="<%=funcname %>" width="200"/>					            
					        </r:datacell>
				              </td>  
				          </tr>
				         </table>
		        </h:form>
		        </td>
		</TR>    
	</TABLE>
	<form id="datacellForm">
        <input type="hidden" name="roleFunc/acRole/roleid"/>
        <input type="hidden" name="partyRole/partyid"/>
    </form>
</body>
</html>