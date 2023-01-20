<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_title_menu_add(menuInput)");
	String selectFunction=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_title_selectFunction");
%>
<head>
<title>Title<b:message key = 'menuManager_l_title_menu_add(menuInput)'/></title><!-- -->
</head>
<body leftmargin="0" topmargin="0">

<h:form name="dataform1" action="org.gocom.abframe.rights.menu.MenuQuery.flow" method="post" checkType="blur"  onsubmit="return checkForm(this);">
  <input type="hidden" name="_eosFlowAction" id="_eosFlowAction" value="insertSubMenu"/>
  <h:hiddendata property="acmenu"  />
  <h:hidden property="subMenu/menuid"/>  
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
       <td colspan="2" class="eos-panel-title">&nbsp;&nbsp;<%=title%></td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.parentid(menulabel)'/><b:message key="l_colon"/><!--父菜单显示名称 -->
        </td>
        <td colspan="1">
		  <input type="text" name="parentMeunLabel"  readonly="readonly"  value='<b:write property="acmenu/menulabel"/>'>          
        </td>
      </tr>    
      <tr>
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.menuname'/><b:message key="l_colon"/><!--菜单名称 -->
        </td>
        <td colspan="1"> 
          <h:text property="subMenu/menuname" maxlength="40" validateAttr="allowNull=false;maxLength=40"/><font style="color:red">*</font>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.menulabel'/><b:message key="l_colon"/><!--菜单显示名称 -->
        </td>
        <td colspan="1">
          <h:text property="subMenu/menulabel" maxlength="40" validateAttr="allowNull=false;maxLength=40" /><font style="color:red">*</font>
        </td>
      </tr>      
      <tr>
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.menucode'/><b:message key="l_colon"/><!--菜单代码 -->
        </td>
        <td colspan="1">
          <h:text property="subMenu/menucode" maxlength="40"  validateAttr="maxLength=40" />
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.isleaf'/><b:message key="l_colon"/><!--是否叶子菜单 -->
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_YESORNO" value="n" property="subMenu/isleaf"  onchange="changeMenuType();"/>
        </td>
      </tr>
      <tr >
        <td id="funccode" class="form_label">
          <b:message key = 'menuManager_l_AcMenu.funccode(funcname)'/><b:message key="l_colon"/><!--功能名称 -->
        </td>
        <td colspan="1">                                                                                                <!--选择功能 -->
          <w:lookup id="subMenu/funccode"  property="subMenu/funccode" readonly="true"  displayProperty="funcnameshow" dialogTitle="<%=selectFunction %>" lookupUrl="org.gocom.abframe.rights.application.FunctionExtendSelect.flow" onReturnFunc="lookupRetFun" />
        </td>
      </tr>
	  <h:hidden property="subMenu/menuaction"/>  
	  <h:hidden property="subMenu/appid"/>  
      <tr>
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.openmode'/><b:message key="l_colon"/><!--页面打开方式 -->
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_PAGEOPENMODE" property="subMenu/openmode"/>
        </td>
      </tr>
      <tr> 
        <td class="form_label">
          <b:message key = 'menuManager_l_AcMenu.displayorder'/><b:message key="l_colon"/><!--显示顺序 -->
        </td>
        <td colspan="1">
          <h:text property="subMenu/displayorder" validateAttr="type=number;minValue=-32768;maxValue=32767" />
        </td>
      </tr>       
      <tr>
        <td class="form_label">菜单图标</td>
        <td colspan="1">
          <h:text property="subMenu/imagepath" maxlength="100" validateAttr="maxLength=100"/>
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
//处理lookup返回值
function lookupRetFun( args ) { 
 if( args != null && args != "" && args.length > 0 ) {
 //处理返回值数组中第2和第3个值
     $name("subMenu/menuaction").value = args[2];
     $name("subMenu/appid").value = args[3];
 }   
 //如果返回true，自动把第0和第1个值赋给lookup的property和displayProperty属性 	
    return true;
}

//默认新建非叶子菜单，隐藏功能选择项和打开方式选择项
$id("subMenu/funccode").setDisabled(true);
$name("subMenu/openmode").disabled=true;

//非叶子菜单不允许添加功能  
function changeMenuType() {
	if($name("subMenu/isleaf").value =="y"){
		//$name("subMenu/funccode").disabled=false;
		$id("subMenu/funccode").setDisabled(false);
		$name("subMenu/openmode").disabled=false;
	} else {
		//$name("subMenu/funccode").disabled=true;
		$id("subMenu/funccode").setDisabled(true);
		$name("subMenu/openmode").disabled=true;	
	}
}

//reload菜单树选中节点（暂时未使用）    
function save(){
	otherOperation();
	dataform1.submit();
	parent.parent.menuTreeFrame.menuTree.getSelectNode().getParent().reloadChild();
}

function otherOperation(){
	//点击组织结构树，新增子菜单。
	 <l:present property="isTreeAddMenu">
		<l:equal property="isTreeAddMenu" targetValue="true">			
			dataform1.action="org.gocom.abframe.rights.menu.MenuManager.flow";
			$id("_eosFlowAction").value="addSubMenu";
		</l:equal>	
	</l:present>		
}
</script>	
</body>
</html>