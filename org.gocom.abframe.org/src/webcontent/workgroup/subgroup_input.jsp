<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("groupUpdate_l_title_group_update");
	String pleaseSelect=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
 %>
<head>
<title><%=title%></title><!--工作组录入 -->
</head>
<body leftmargin="0px;" topmargin="0px;">
<%--dataform configurationID:20080820194550 --%>
<h:form name="dataform1" action="" checkType="blur" target="_self" method="post" onsubmit="return checkForm(this);">
  <h:hidden property="group/groupid" />
  <h:hidden property="parentGroupid" scope="flow"/>
  <h:hidden property="group/omGroup/groupid" />
  
  <l:equal property="_eosLastAccessAction" targetValue="update">
      <input type="hidden" name="_eosFlowAction" value="updateSubmit" >
  </l:equal>
  <l:equal property="_eosLastAccessAction" targetValue="addGroup">
    <input type="hidden" name="_eosFlowAction" value="insertSubmit" >
  </l:equal>
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
        <td class="form_label" nowrap="nowrap">
          <b:message key="workgroupManager_OmGroup.groupname" /><b:message key="l_colon"/> <!--工作组名称 -->
        </td>
        <td colspan="1">
          <h:text  property="group/groupname" maxlength="50" validateAttr="allowNull=false;maxLength=50"/>
        </td>
        <td class="form_label" nowrap="nowrap">
          <b:message key="workgroupManager_OmGroup.manager" /><b:message key="l_colon"/> <!--负责人 -->
        </td>
        <td colspan="1">
          <r:comboSelect id="empList" property="group/manager"  
			queryAction="org.gocom.abframe.org.workgroup.WorkgroupManager.queryGroupOmEmployee.biz"  nullText="<%=pleaseSelect%>" 
			textField="empname" valueField="empid" xpath="omEmployees" width="150" initParamFunc="initComboEmpParam"
		  /> 
        </td>
      </tr>
      <tr>
        <td class="form_label" nowrap="nowrap">
          <b:message key="workgroupManager_OmGroup.grouptype" /><b:message key="l_colon"/> <!--工作组类型 -->
        </td>
        <td colspan="1">
          <d:select  dictTypeId="ABF_GROUPTYPE" property="group/grouptype" value="system" style="width: 150"/>
        </td>      
        <td class="form_label" nowrap="nowrap">
          <b:message key="workgroupManager_OmGroup.groupstatus" /><b:message key="l_colon"/><!--工作组状态 -->
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_GROUPSTATUS" property="group/groupstatus" value="run" style="width: 150"/>
        </td>
      </tr>
      <tr>
        <td class="form_label" nowrap="nowrap">
          <b:message key="workgroupManager_OmGroup.startdate" /><b:message key="l_colon"/> <!--有效开始日期 -->
        </td>
        <td colspan="1">
          <w:date property="group/startdate"/>
        </td>
        <td class="form_label" nowrap="nowrap">
          <b:message key="workgroupManager_OmGroup.enddate" /><b:message key="l_colon"/> <!--有效截止日期 -->
        </td>
        <td colspan="1">
          <w:date property="group/enddate"  />
        </td>
      </tr>
      <tr>
        <td class="form_label" nowrap="nowrap">
          <b:message key="workgroupManager_OmGroup.groupdesc" /><b:message key="l_colon"/> <!--工作组描述 -->
        </td>
        <td colspan="3">
          <h:textarea  property="group/groupdesc" validateAttr="maxLength=512" cols="70"/>
        </td>
      </tr>
      <tr class="form_bottom">
        <td colspan="6">
              <input type="button" class="button" value="<b:message key='l_save' />" onclick="saveGroup()">
              <input type="button" class="button" value="<b:message key='l_close' />" onclick="javascript:window.close();">
         
        </td>
      </tr>
    </table>
</h:form>
<script>
	//r:comboSelect初始化数据
	function initComboEmpParam()
	{
		var groupid = $name("parentGroupid").value;
		if(groupid == "")
		{
			groupid = $name("group/groupid").value;
		}
		return "<groupid>"+groupid+"</groupid>" ;
	}
	
	// 提交新增或更新子工作组
    function saveGroup() {
        var frm = $name("dataform1");
        
	    //表单验证
	    if( !checkForm(frm) ) {
	        return;
	    }
	    var result = f_compare_date($name("group/startdate").value,$name("group/enddate").value,'yyyy-MM-dd');
	    if(result==1){
	    	f_alert($name("group/enddate"),'<b:message key="workgroupManager_OmGroup.enddate" /><b:message key="l_date_check" /><b:message key="workgroupManager_OmGroup.startdate" />');
	    	return;
	    }
	
        var myAjax = null;
        if( $name("_eosFlowAction").value == "insertSubmit"  ) {
            myAjax = new Ajax("org.gocom.abframe.org.workgroup.WorkgroupManager.addGroup.biz");
            $name('group/omGroup/groupid').value=$name('parentGroupid').value;
            /*
            myAjax.addParam("group/groupid", $name("group/groupid").value );
	        myAjax.addParam("group/groupname", $name("group/groupname").value );
	        myAjax.addParam("group/manager", $name("group/manager").value);
	        myAjax.addParam("group/groupstatus", $name("group/groupstatus").value  );
	        myAjax.addParam("group/grouptype", $name("group/grouptype").value  );
	        myAjax.addParam("group/startdate", $name("group/startdate").value  );
	        myAjax.addParam("group/enddate", $name("group/enddate").value);
	        myAjax.addParam("group/groupdesc", $name("group/groupdesc").value);
	        myAjax.addParam("group/omGroup/groupid", $name("parentGroupid").value);
	        */
	        
        } else {
            myAjax = new Ajax("org.gocom.abframe.org.workgroup.WorkgroupManager.updateGroupWithReturn.biz");
            /*
            myAjax.addParam("group/groupid", $name("group/groupid").value );
	        myAjax.addParam("group/groupname", $name("group/groupname").value );
	        myAjax.addParam("group/manager", $name("group/manager").value);
	        myAjax.addParam("group/groupstatus", $name("group/groupstatus").value  );
	        myAjax.addParam("group/grouptype", $name("group/grouptype").value  );
	        myAjax.addParam("group/startdate", $name("group/startdate").value  );
	        myAjax.addParam("group/enddate", $name("group/enddate").value);     
	        */
        }

        myAjax.submitForm(frm);
        var returnNode = myAjax.getResponseXMLDom();
        if( returnNode ) {
            if( myAjax.getValue("root/data/oprResult") == 1 ){
                alert( "<b:message key='l_m_save_success' />" ); <!--  保存成功 -->
                try{
                	parent.parent.window.frames['groupTree'].groupTree.getSelectNode().getParent().reloadChild();  //刷新左侧树，注意：要刷新的是选中节点的上级节点
                }catch(e){}
               
            }else {
                alert( "<b:message key='l_m_save_fail' />" );    <!-- 保存失败 -->     
            }
        } else {
            alert( "<b:message key='l_m_save_fail' />" );    <!-- 保存失败 --> 
        }
        window.close();
    }
</script>
</body>
</html>