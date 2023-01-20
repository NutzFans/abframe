<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String subFuncGroup_list = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_subFuncGroup_list");
           
%>

</head>
<body leftmargin="0" topmargin="0" >
<h:form name="subFuncGroup_viewlist" method="post" action="org.gocom.abframe.rights.application.FunctionGroupManager.flow">
<input type="hidden" name="_eosFlowAction" value="queryGroups">
<h:hidden id="funcGroup_id" property="funcgroupid"/>
  <h:hiddendata property="criteria" />
  <h:hiddendata property="page" />
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
       <td colspan="6" class="eos-panel-title">&nbsp;&nbsp;<%=subFuncGroup_list%></td>
      </tr>
      <tr>
        <th width="8%" align="center">
		  <input type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll();"> 
		  <b:message key="l_select"></b:message>
		</th>
        <th>
          <b:message key="applicationManager_AcFuncGroup.funcgroupname"></b:message>
        </th>
        <th>
          <b:message key="applicationManager_AcFunction.parentFuncGroup"></b:message>
        </th>
        <th>
          <b:message key="applicationManager_AcFuncGroup.grouplevel"></b:message>
        </th>
        <th>
          <b:message key="applicationManager_AcFuncGroup.isleaf"></b:message>
        </th>
      </tr>
      <w:checkGroup id="group1">
        <l:iterate property="subFuncGroups" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />">
            <td align="center">
              <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))">
                <h:param name='funcGroup_selectedObjects/funcgroupid' iterateId='id1' property='funcgroupid'/>
              </w:rowCheckbox>
            </td>
            <td>
              <b:write iterateId="id1" property="funcgroupname"/>
            </td>
            <td>
              <b:write iterateId="id1" property="acFuncgroup/funcgroupname"/>
            </td>
            <td>
              <b:write iterateId="id1" property="grouplevel"/>
            </td>
            <td>
              <d:write iterateId="id1" property="isleaf" dictTypeId="ABF_YESORNO"/>
            </td>
          </tr>
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="5" class="command_sort_area">
        <div style="float:left" >
          <input type="button" class="button" value='<b:message key="applicationManager_l_subFuncGroupAdd"></b:message>' onclick="addRecord();">
          <input type="button" class="button" value='<b:message key="applicationManager_l_funcGroupUpdate"></b:message>' onclick="modiRecord();" id="updateButton" disabled="true">
          <input type="button" class="button" value='<b:message key="applicationManager_l_funcGroupDelete"></b:message>' onclick="delRecord();" id="deleteButton" disabled="true">
           </div><div style="float:right" >
            <l:equal property="page/isCount" targetValue="true">
              <b:message key="l_total"/>
              <b:write property="page/count"/>
              <b:message key="l_recordNO."/>
              <b:write property="page/currentPage"/>
              <b:message key="l_page"/>/
              <b:write property="page/totalPage"/>
              <b:message key="l_page"/>
            </l:equal>
            <l:equal property="page/isCount" targetValue="false">
              <b:message key="l_NO."/>
              <b:write property="page/currentPage"/>
              <b:message key="l_page"/>
            </l:equal>
            <input type="button" class="button" onclick="firstPage('page', 'queryGroups', null, null, 'subFuncGroup_viewlist');" value='<b:message key="l_firstPage"/>'  <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="prevPage('page', 'queryGroups', null, null, 'subFuncGroup_viewlist');" value='<b:message key="l_upPage"/>' <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="nextPage('page', 'queryGroups', null, null, 'subFuncGroup_viewlist');" value='<b:message key="l_nextPage"/>' <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            <l:equal property="page/isCount" targetValue="true">
              <input type="button" class="button" onclick="lastPage('page', 'queryGroups', null, null, 'subFuncGroup_viewlist');" value='<b:message key="l_lastPage"/>' <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            </l:equal>
          </div> 
        </td>
      </tr>
    </table>
</h:form>
<script>
  function addRecord() {
    var url="org.gocom.abframe.rights.application.FuncGroupSubAdd.flow?_eosFlowAction=add&funcgroupid="+$id("funcGroup_id").value; 
	showModalCenter(url,null,callBackFuncGroup,450,200,'<b:message key="applicationManager_l_subFuncGroupAdd"></b:message>');
																			  
  }
  
	//新增完成回调函数
	function callBackFuncGroup()
    {
    	funcgroupid=$id("funcGroup_id").value;
    	window.location.href="org.gocom.abframe.rights.application.FunctionGroupManager.flow?_eosFlowAction=querySubFuncGroup&funcgroupid="+$id("funcGroup_id").value;
    	window.parent.parent.frames["IFRAMEAppFuncTree"].DTree.getSelectNode().reloadChild();
    } 
  
  function modiRecord() {
    var g = $id("group1");
    if (g.getSelectLength() != 1) {
      alert('<b:message key="m_update_illegalSelect"></b:message>');
      return;
    }
    var funcUpdate = g.getSelectParams("funcGroup_selectedObjects/funcgroupid");
    var url="org.gocom.abframe.rights.application.FuncGroupUpdate.flow?_eosFlowAction=update&funcgroupid="+funcUpdate;  
	showModalCenter(url,null,callBackFuncGroup,450,200,'<b:message key="applicationManager_l_funcGroupUpdate"></b:message>');
  }
  
  function delRecord() {
    var g = $id("group1");
    if (g.getSelectLength() < 1) {
      alert('<b:message key="m_delete_illegalSelect"></b:message>');
      return;
    }
    if(confirm('<b:message key="applicationManager_m_funcGroupdelete_confirm"></b:message>')){
      var myAjax = new Ajax("org.gocom.abframe.rights.application.FuncGroupManager.deleteFuncGroup.biz");
      var id =  g.getSelectParams("funcGroup_selectedObjects/funcgroupid");
         //删除可以多选，返回的是数组
         if( id != null && id != "" && id.length > 0 ) {
             for(var i = 0 ; i < id.length; i++) {
                 myAjax.addParam("funcGroup[" + (i+1) + "]/funcgroupid", id[i] );
             }
             myAjax.submit();
	         var returnNode = myAjax.getResponseXMLDom();
	         if( returnNode ) {
	            if( myAjax.getValue("root/data/funcGroupDelResult") == 1 ) {
	                alert( '<b:message key="applicationManager_m_delete_success"></b:message>' );
	            } 
	            else {
	                alert( '<b:message key="applicationManager_m_delete_failure"></b:message>' );
	            }
	         } 
	         else {
	             alert( '<b:message key="applicationManager_m_delete_failure"></b:message>' );
	         }

         }
         callBackFuncGroup();
    }   
    
  }
  
  function checkSelectAll(){
		if ($id("checkSelect").checked){
			selectAll("group1");
		}else{
			selectNone("group1");
		}
  } //实现全选复选框

</script>
<script>
     function refreshFunctionGroupNode(){
		  <l:present property="isRefreshNode">	
			<l:equal property="isRefreshNode" targetValue="true">
		      parent.IFRAMEAppFuncTree.DTree.getSelectNode().reloadChild();
			</l:equal>	
		  </l:present>	// 动态树删除操作后刷新节点
		  
		  <l:present property="isRefreshParent">	
			<l:equal property="isRefreshParent" targetValue="true">
		      parent.IFRAMEAppFuncTree.DTree.getSelectNode().getParent().reloadChild();
			</l:equal>	
		  </l:present>	// 动态树新增、修改操作后刷新父节点
     }
     eventManager.add(window,"load",refreshFunctionGroupNode); 
    
     
</script>
</body>
</html>