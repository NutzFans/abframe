<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common.jsp"%>
<%--
- Author(s): 蔡述尧
- Date: 2008-08-12 13:54:07
- Description:
--%>
<html>
<%
	//获取标签中使用的国际化资源信息	
	String panel1Title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("opershortcutManager_l_custMenuInput");		
	String selectFunction=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_title_selectFunction");		

 %>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
      <b:message key = 'opershortcutManager_l_custMenuInput'/><!--快捷菜单录入 -->
    </title>
  </head>
  <body topmargin="0" leftmargin="0">
    <e:datasource name="acopershortcut" type="entity" path="org.gocom.abframe.dataset.privilege.AcOpershortcut" />
    <h:form name="data_form" action="org.gocom.abframe.rights.menu.OpershortcutManager.flow" method="post" onsubmit="return checkForm(this);">
      <l:equal property="_eosLastAccessAction" targetValue="update">
        <input type="hidden" name="_eosFlowAction" value="updateSubmit" >
          
      </l:equal>
      <l:equal property="_eosLastAccessAction" targetValue="insert">
        <input type="hidden" name="_eosFlowAction" value="insertSubmit" >
      </l:equal>
      <h:hidden property="page/begin"/>
      <h:hidden property="page/length"/>
      <h:hidden name="acopershortcut/acOperator/operatorid" property="userObject/attributes/operatorid" scope="s" />
        <table align="center" border="0" width="100%" class="form_table">
		  <tr height="4%">
			<td class="eos-panel-title" colspan="4">&nbsp;&nbsp;<%=panel1Title %></td><!--快捷菜单录入 -->
		  </tr>
          <tr>            
            <td class="form_label">
              <b:message key = 'opershortcutManager_l_AcOpershortcut.funccode(funcname)'/><b:message key="l_colon"/><!--功能名称 -->
            </td>
            <td >
			  <w:lookup   id="funcname"   readonly="true"  validateAttr="allowNull=false"  dialogTitle="<%=selectFunction %>"  width="350" height="400" lookupUrl="org.gocom.abframe.rights.application.FunctionExtendSelectMy.flow" onReturnFunc="lookupRetFun" ></w:lookup>
			  <h:hidden property="acopershortcut/appid"/>  
			  <h:hidden property="acopershortcut/funcgroupid"/>   
			  <h:hidden property="acopershortcut/funccode"/>   
            </td>
          </tr>
          <tr>            
            <td class="form_label">
              <b:message key = 'opershortcutManager_l_AcOpershortcut.funcgroupid(funcgroupname)'/><b:message key="l_colon"/><!--功能组名称 -->
            </td>
            <td >
              <input type=text id="funcgroupname" value="<b:write property='acopershortcut/funcgroupname'/>"   readonly="readonly"/> 
            </td>
          </tr>
          <tr>
            <td class="form_label">
              <b:message key = 'opershortcutManager_l_AcOpershortcut.appid(appname)'/><b:message key="l_colon"/><!--应用名称 -->
            </td>
            <td >
              <input type=text id="appname" value="<b:write property='acopershortcut/appname'/>"   readonly="readonly"/>              
            </td>
          </tr>
          <tr>
            <td class="form_label">
              <b:message key = 'opershortcutManager_l_AcOpershortcut.orderno'/><b:message key="l_colon"/><!--排列顺序 -->
            </td>
            <td >
              <h:text property="acopershortcut/orderno" validateAttr="type=number;minValue=-32768;maxValue=32767"/>
            </td>
          </tr>
          <tr>            
            <td class="form_label">
              <b:message key = 'opershortcutManager_l_AcOpershortcut.imagepath'/><b:message key="l_colon"/><!--快捷菜单图片路径 -->
            </td>
            <td >
              <h:text property="acopershortcut/imagepath" maxlength="100" validateAttr="maxLength=100"/>
            </td>
          </tr>
          <tr class="form_bottom">
            <td colspan="6">
              <input type="submit" class="button" value="<b:message key = 'l_save'/>"><!--保存 -->
              <input type="button" class="button" value="<b:message key = 'l_return'/>" onclick="javascript:history.go(-1);"><!--返回 -->
            </td>
          </tr>
        </table>
    </h:form>

<script type="text/javascript">
	var funcname = "<b:write property='acopershortcut/funcname'/>";
	//给lookup显示属性赋值
	$id("funcname").setDisplayValue(funcname);
	//处理lookup控件返回值
    function lookupRetFun( args ) { 
     if( args != null && args != "" && args.length > 0 ) {

         $id("appname").value = args[4];
         $id("funcgroupname").value = args[6];
         //设置lookup的displayValue并刷新显示
         $id("funcname").setDisplayValue(args[1]);
         $name("acopershortcut/funcgroupid").value = args[5];
         $name("acopershortcut/appid").value = args[3];
         $name("acopershortcut/funccode").value = args[0];

     }   
     	//返回true，将自动给lookup属性赋值 	
        return true;
    }

</script>	   
  </body>
</html>
