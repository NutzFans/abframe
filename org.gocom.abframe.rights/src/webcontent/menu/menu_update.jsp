<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_title_menu_update(MenuInfo)");
	String selectFunction=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_title_selectFunction");
%>
<head>
<title><b:message key = 'menuManager_l_updateMenu'/></title><!--修改菜单 -->
</head>
<body topmargin="0" leftmargin="0" style="overflow: auto;">
     
<form name="dataform1" action="org.gocom.abframe.rights.menu.MenuQuery.flow" method="post" onsubmit="return checkForm(this);">
  <input type="hidden" name="_eosFlowAction" value="updateMenu"/>
  <h:hidden property="_eosFlowDataContext" />
  <h:hidden  property="_eosFlowKey"></h:hidden>   
  <h:hidden property="acmenu/menuid"/>
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
       <td colspan="2" class="eos-panel-title">&nbsp;&nbsp;<%=title %></td><!--菜单详细信息 -->
      </tr>
      <tr>
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;<b:message key = 'menuManager_l_AcMenu.parentid(menulabel)'/><b:message key="l_colon"/><!--父菜单显示名称 -->
        </td>
        <td colspan="1">
		  <input type="text" readonly="readonly"  value='<b:write property="acmenu/acMenu/menulabel"/>'>          
        </td>
      </tr>      
      <tr>
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;<b:message key = 'menuManager_l_AcMenu.menuname'/><b:message key="l_colon"/><!--菜单名称 -->
        </td>
        <td colspan="1">
          <h:text property="acmenu/menuname" maxlength="40" validateAttr="allowNull=false;maxLength=40"/><font style="color:red">*</font>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;<b:message key = 'menuManager_l_AcMenu.menulabel'/><b:message key="l_colon"/><!--菜单显示名称 -->
        </td>
        <td colspan="1">
          <h:text property="acmenu/menulabel" maxlength="40" validateAttr="allowNull=false;maxLength=40"/><font style="color:red">*</font>
        </td>
      </tr>
      <tr  >
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;<b:message key = 'menuManager_l_AcMenu.menucode'/><b:message key="l_colon"/><!--菜单代码 -->
        </td>
        <td colspan="1">
          <h:text property="acmenu/menucode" maxlength="40"  validateAttr="maxLength=40" />
        </td>
      </tr>
      <tr>
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;<b:message key = 'menuManager_l_AcMenu.isleaf'/><b:message key="l_colon"/><!--是否叶子菜单 -->
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_YESORNO" value="y" property="acmenu/isleaf"  onchange="changeMenuType();" style="width: 133"/>
        </td>
      </tr>
      <tr >
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;<b:message key = 'menuManager_l_AcMenu.funccode(funcname)'/><b:message key="l_colon"/><!--功能名称 -->
        </td>
        <td  colspan="1">        																														<!--选择功能 -->
          <w:lookup id="acmenu/funccode"  property="acmenu/funccode"   readonly="true" displayProperty="acmenu/funcname"  dialogTitle="<%=selectFunction %>"  width="350" height="400" lookupUrl="org.gocom.abframe.rights.application.FunctionExtendSelect.flow" onReturnFunc="lookupRetFun" ></w:lookup>
		  <h:hidden property="acmenu/menuaction"/>  
		  <h:hidden property="acmenu/appid"/>         
        </td>
      </tr>
      <tr>
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;<b:message key = 'menuManager_l_AcMenu.openmode'/><b:message key="l_colon"/><!--页面打开方式 -->
        </td>
        <td id="openmode" colspan="1">
          <d:select dictTypeId="ABF_PAGEOPENMODE" property="acmenu/openmode" style="width: 133"/>
        </td>
      </tr>
      <tr> 
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;<b:message key = 'menuManager_l_AcMenu.displayorder'/><b:message key="l_colon"/><!--显示顺序 -->
        </td>
        <td colspan="1">
          <h:text property="acmenu/displayorder" validateAttr="type=number;minValue=-32768;maxValue=32767" />
        </td>
      </tr>      
      <tr>
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;菜单图标：<!--菜单闭合图片路径 -->
        </td>
        <td  colspan="1">        																														<!--选择功能 -->
          <w:lookup id="acmenu/imagepath" property="acmenu/imagepath" displayProperty="acmenu/imagepathname" dialogTitle="图标选择"  width="800" height="450" lookupUrl="abframe/rights/iconmanage/pcIcon.jsp" onReturnFunc="retImgPath" ></w:lookup>
        </td>
      </tr>
      <tr style="display: none">
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;<b:message key = 'menuManager_l_AcMenu.expandpath'/><b:message key="l_colon"/><!--菜单展开图片路径 -->
        </td>
        <td colspan="1">
          <h:text property="acmenu/expandpath" maxlength="100" validateAttr="maxLength=100" />
        </td>
      </tr>
      <tr>
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;<b:message key = 'menuManager_l_AcMenu.menulevel'/><b:message key="l_colon"/><!--菜单层次 -->
        </td>
        <td colspan="1">
          <h:text property="acmenu/menulevel" readonly="true"  />
        </td>
      </tr>
      <tr>
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;<b:message key = 'menuManager_l_AcMenu.subcount'/><b:message key="l_colon"/><!--子节点数 -->
        </td>
        <td colspan="1">
          <h:text property="acmenu/subcount" readonly="true"  />
        </td>
      </tr>
      <tr class="form_bottom">
        <td colspan="6">
          <input type="submit" class="button" value="<b:message key = 'l_save'/>"><!--保存 -->
          <input type="button" class="button" value="<b:message key = 'menuManager_l_addSubMenu'/>" onclick="addSubMenu();" style="width: 80"><!--增加子菜单 -->
        </td>
      </tr>
    </table>
</form>

<script>

//如果是非叶子菜单，则隐藏功能选择项和打开方式选择项
if($name("acmenu/isleaf").value =="n"){	
	//$name("acmenu/funccode").disabled=true;
	$id("acmenu/funccode").setDisabled(true);
	$name("acmenu/openmode").disabled=true;
	if($name("acmenu/subcount").value !=="0") {
		$name("acmenu/isleaf").disabled=true;
	}	
}

//处理lookup返回值	
function lookupRetFun( args ) { 
console.log(args);
 if( args != null && args != "" && args.length > 0 ) {
 	 //处理返回值数组中第2和第3个值
     $name("acmenu/menuaction").value = args[2];
     $name("acmenu/appid").value = args[3];
 }  
 	//如果返回true，自动把第0和第1个值赋给lookup的property和displayProperty属性 	
    return true;
}

//处理图标返回值	
function retImgPath( args ) { 
	return true;
}

//非叶子菜单不允许添加功能	
function changeMenuType() {    	
	if($name("acmenu/isleaf").value =="y"){
		//$name("acmenu/funccode").disabled=false;
		$id("acmenu/funccode").setDisabled(false);
		$name("acmenu/openmode").disabled=false;
	} else {
		//$name("acmenu/funccode").disabled=true;
		$id("acmenu/funccode").setDisabled(true);
		$name("acmenu/openmode").disabled=true;	
	}
}

function addSubMenu() {
	var frm = $name("dataform1");        
    frm.elements["_eosFlowAction"].value = "addSubMenu";
    frm.submit();
}

</script>

</body>
</html>