<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("menuManager_l_title_menuQueryInput(menuQuery)");
	//请选择
    String pleaseSelect = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_pleaseSelect");
%>

<head>
<script type="text/javascript">	
	//删除、新增菜单时需要更新菜单树
	<l:present property="reload">	
		parent.parent.menuTreeFrame.menuTree.getRootNode().reloadChild();	
	</l:present>	
	
	<l:present property="c_reload">	
		//刷新菜单树
    	window.parent.parent.frames["menuTreeFrame"].menuTree.getSelectNode().reloadChild();	
	</l:present>
	
	<l:present property="u_reload">	
		//刷新菜单树
    	window.parent.parent.frames["menuTreeFrame"].menuTree.getRootNode().reloadChild();	
	</l:present>
	
	function query(){		
		document.inputForm.submit();
	}
	
	/*
     *  自定义初始化按钮样式
     */
	function custInit(){  
		//每次进入页面时即执行一次查询操作
	    query();
	    
	    if($name("delFlag").value == "1")
	    {
	    	//刷新菜单树
    		window.parent.parent.frames["menuTreeFrame"].menuTree.getRootNode().reloadChild();
	    }
	 }
</script>
</head>

<h:form name="inputForm" action="org.gocom.abframe.rights.menu.MenuQuery.flow" method="post" target="result"  checkType="blur" >
  <input type="hidden" name="_eosFlowAction" value="query"/>
  <h:hidden property="delFlag"/>
  <h:hidden property="updateFlag"/>
  <h:hidden property="childFlag"/>
  <w:panel id="panel1" width="100%" title="<%=title %>"><!--菜单查询 -->
    <table align="center" border="0" width="100%" class="form_table">
      <tr>
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;<b:message key = 'menuManager_l_AcMenu.menuid'/><b:message key="l_colon"/><!--菜单编号 -->
        </td>
        <td colspan="1">
          <h:text property="menuCond/_expr[1]/menuid"  />
          <h:hidden property="menuCond/_expr[1]/_op" value="like"/>
          <h:hidden property="menuCond/_expr[1]/_likeRule" value="all"/>
        </td>
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;<b:message key = 'menuManager_l_AcMenu.menulevel'/><b:message key="l_colon"/><!--菜单层次 -->
        </td>
        <td colspan="1"> 
	      <select name="menuCond/_expr[2]/menulevel"   id="select1" style="width:133">
			<option value=""> <b:message key="l_pleaseSelect"></b:message> </option>
			<%
				for(int i=1;i<=10;i++){
					out.print("<option>"+i+"</option>");
				}
			 %>
		  </select>          
          <h:hidden property="menuCond/_expr[2]/_op" value="="/>
        </td>        
      </tr>
      <tr>
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;<b:message key = 'menuManager_l_AcMenu.menulabel'/><b:message key="l_colon"/><!--菜单显示名称 -->
        </td>
        <td colspan="1">
          <h:text property="menuCond/_expr[3]/menulabel" validateAttr="maxLength=40;allowNull=true"  />
          <h:hidden property="menuCond/_expr[3]/_op" value="like"/>
          <h:hidden property="menuCond/_expr[3]/_likeRule" value="all"/>
        </td>       
        <td class="form_label">
          &nbsp;&nbsp;&nbsp;<b:message key = 'menuManager_l_AcMenu.menuname'/><b:message key="l_colon"/><!--菜单名称 -->
        </td>
        <td colspan="1">
          <h:text property="menuCond/_expr[4]/menuname" />
          <h:hidden property="menuCond/_expr[4]/_op" value="like"/>
          <h:hidden property="menuCond/_expr[4]/_likeRule" value="all"/>
        </td>
      </tr>
      <tr class="form_bottom">
        <td colspan="4" class="form_bottom">
          <input type="hidden" name="menuCond/_entity" value="org.gocom.abframe.dataset.privilege.AcMenu">
          <b:message key = 'l_pageDisplay'/><!--每页显示 -->
          <h:text size="2" property="pageCond/length" value="10" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
          <input type="hidden" name="pageCond/begin" value="0">
          <input type="hidden" name="pageCond/isCount" value="true">
          <input type="submit" class="button" value="<b:message key = 'l_query'/>"><!--查询 -->
          <input type="reset" class="button" value="<b:message key = 'l_reset'/>"><!--重置 -->
        </td>
      </tr>
    </table>
  </w:panel>
  <h:hidden property="menuCond/_order[1]/_asc" value="menulevel" />
  <h:hidden property="menuCond/_order[2]/_asc" value="acMenu.menuid" />
  <h:hidden property="menuCond/_order[3]/_asc" value="displayorder" />
  <h:hidden property="menuCond/_order[4]/_asc" value="menuid" />
</h:form>

<iframe width="100%" height="78%" marginHeight="0" scrolling="no" frameBorder="0" marginWidth="0" name="result"></iframe>

<script language="javascript">
    //初始化页面按钮样式
     eventManager.add(window,"load",custInit); 
</script>