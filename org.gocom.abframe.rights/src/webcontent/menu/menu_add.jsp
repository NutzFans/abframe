<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_title_menu_add(menuInput)");
%>
<head>
<title><%=title %></title><!--菜单录入 -->
</head>
<body topmargin="0" leftmargin="0">

<h:form name="dataform1" action="org.gocom.abframe.rights.menu.MenuQuery.flow" method="post" checkType="blur" onsubmit="return checkForm(this);">
  <input type="hidden" name="_eosFlowAction" value="insertMenu"/>
  <h:hidden property="acmenu/menuid"/>
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
       <td colspan="2" class="eos-panel-title">&nbsp;&nbsp;<%=title %></td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.menuname'/><b:message key="l_colon"/><!--菜单名称 -->
        </td>
        <td colspan="1">
          <h:text property="acmenu/menuname" maxlength="40" validateAttr="allowNull=false;maxLength=40"/><font style="color:red">*</font>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.menulabel'/><b:message key="l_colon"/><!--菜单显示名称 -->
        </td>
        <td colspan="1">
          <h:text property="acmenu/menulabel" maxlength="40" validateAttr="allowNull=false;maxLength=40"/><font style="color:red">*</font>
        </td>
      </tr>      
      <tr>
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.menucode'/><b:message key="l_colon"/><!--菜单代码 -->
        </td>
        <td colspan="1">
          <h:text property="acmenu/menucode" maxlength="40"  validateAttr="maxLength=40" />
        </td>
      </tr>
      <tr> 
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.displayorder'/><b:message key="l_colon"/><!--显示顺序 -->
        </td>
        <td colspan="1">
          <h:text property="acmenu/displayorder" validateAttr="type=number;minValue=-32768;maxValue=32767" />
        </td>
      </tr>      
      <tr>
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.imagepath'/><b:message key="l_colon"/><!--菜单闭合图片路径 -->
        </td>
        <td colspan="1">
          <h:text property="acmenu/imagepath"  maxlength="100" validateAttr="maxLength=100"/>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.expandpath'/><b:message key="l_colon"/><!--菜单展开图片路径 -->
        </td>
        <td colspan="1">
          <h:text property="acmenu/expandpath"  maxlength="100" validateAttr="maxLength=100" />
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
</body>
</html>