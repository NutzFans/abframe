<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String funcResource_list = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_funcResource_list");
           
%>

</head>
<body leftmargin="0" topmargin="0" >
<%--viewlist configurationID:20080814195806 --%>
<h:form id="funcResource" name="funcResource_viewlist" action="org.gocom.abframe.rights.application.ResourceManager.flow" method="post">
  <input type="hidden" name="_eosFlowAction" value="" >
  <h:hidden id="function_code" property="funccode"/>
  <h:hiddendata property="criteria" />
  <h:hiddendata property="page" />
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
       <td colspan="6" class="eos-panel-title">&nbsp;&nbsp;<%=funcResource_list%></td>
      </tr>
      <tr>
        <th width="8%" align="center">
		  <input type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll();"><b:message key="l_select"></b:message> 
		</th>
        <th>
          <b:message key="applicationManager_AcFuncresource.restype"></b:message>
        </th>
        <th>
          <b:message key="applicationManager_AcFuncresource.respath"></b:message>
        </th>
        <th>
          <b:message key="applicationManager_AcFuncresource.compackname2"></b:message>
        </th>
        <th>
          <b:message key="applicationManager_AcFuncresource.resname"></b:message>
        </th>
      </tr>
      <w:checkGroup id="group1">
        <l:iterate property="funcResourceList" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />">
            <td align="center">
              <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))">
                <h:param name='funcResource_selectedObjects/resid' iterateId='id1' property='resid'/>
              </w:rowCheckbox>
            </td>
            <td>
              <d:write iterateId="id1" property="restype" dictTypeId="ABF_RESOURCETYPE"/>
            </td>
            <td>
              <b:write iterateId="id1" property="respath"/>
            </td>
            <td>
              <b:write iterateId="id1" property="compackname"/>
            </td>
            <td>
              <b:write iterateId="id1" property="resname"/>
            </td>
          </tr>
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="5" class="command_sort_area">
          <div style="float:left" >
          <input type="button" class="button" value='<b:message key="l_add"></b:message>' onclick="addRecord();">
          <l:greaterThan property="page/size" targetValue="0" compareType="number">
            <input type="button" class="button" value='<b:message key="l_update"></b:message>' onclick="modiRecord();" id="updateButton" disabled="true">
          </l:greaterThan>
          <l:greaterThan property="page/size" targetValue="0" compareType="number">
            <input type="button" class="button" value='<b:message key="l_delete"></b:message>' onclick="delRecord();" id="deleteButton" disabled="true">
          </l:greaterThan>
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
            <input type="button" class="button" onclick="firstPage('page', 'queryByFunction', null, null, 'funcResource_viewlist');" value='<b:message key="l_firstPage"/>'  <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="prevPage('page', 'queryByFunction', null, null, 'funcResource_viewlist');" value='<b:message key="l_upPage"/>' <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="nextPage('page', 'queryByFunction', null, null, 'funcResource_viewlist');" value='<b:message key="l_nextPage"/>' <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            <l:equal property="page/isCount" targetValue="true">
              <input type="button" class="button" onclick="lastPage('page', 'queryByFunction', null, null, 'funcResource_viewlist');" value='<b:message key="l_lastPage"/>' <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            </l:equal>
          </div>
        </td>
      </tr>
    </table>
</h:form>
<script type="text/javascript">
    
  	function addRecord() {
    	var url="org.gocom.abframe.rights.application.ResourceAdd.flow?_eosFlowAction=add&funccode="+$id("function_code").value;
		showModal(url,null,reQueryFuncResource,500,200,"","",'<b:message key="applicationManager_l_funcResourceAdd"/>');
  	}
  
  	function reQueryFuncResource(funccode){
    //$name("funcResource_viewlist").submit();
    	funccode=$id("function_code").value;
    	window.location.href="org.gocom.abframe.rights.application.ResourceManager.flow?_eosFlowAction=queryFuncResources&funccode="+funccode;
  	}
  
  	function modiRecord() {
    	var g = $id("group1");
    	if (g.getSelectLength() != 1) {
      		alert('<b:message key="m_update_illegalSelect"></b:message>');
      		return;
    	}                                          
    	var resid = g.getSelectParams("funcResource_selectedObjects/resid");
    	var url="org.gocom.abframe.rights.application.ResourceUpdate.flow?_eosFlowAction=update&resid="+resid+"&funccode="+$id("function_code").value;
		showModal(url,null,reQueryFuncResource,500,200,"","",'<b:message key="applicationManager_l_funcResourceUpdate"/>');
  	}
  
  	function delRecord() {
    	var g = $id("group1");
    	if (g.getSelectLength() < 1) {
      		alert('<b:message key="m_delete_illegalSelect"></b:message>');
      		return;
    	}
    	if(confirm('<b:message key="applicationManager_m_funcResourcedelete_confirm"/>')){
	    	var myAjax = new Ajax("org.gocom.abframe.rights.application.ResourceManager.deleteFuncResource.biz");
	    	var id =  g.getSelectParams("funcResource_selectedObjects/resid");
	        //删除可以多选，返回的是数组
	        if( id != null && id != "" && id.length > 0 ) {
	        	for(var i = 0 ; i < id.length; i++) {
	            	myAjax.addParam("funcResourceDel[" + (i+1) + "]/resid", id[i] );
	            }
	            myAjax.submit();
		        var returnNode = myAjax.getResponseXMLDom();
		        if( returnNode ) {
		        	if( myAjax.getValue("root/data/funcResourceDel_result") == 1 ) {
		                alert( '<b:message key="applicationManager_m_delete_success"></b:message>' );
		            } 
		            else {
		                alert('<b:message key="applicationManager_m_delete_failure"></b:message>' );
		            }
		         } 
		         else {
		             alert('<b:message key="applicationManager_m_delete_failure"></b:message>');
		         }

         	}
    	}
    	funccode=$id("function_code").value;
    	window.location.href="org.gocom.abframe.rights.application.ResourceManager.flow?_eosFlowAction=queryFuncResources&funccode="+funccode;
	}
	
	/*
      * 功能：实现全选复选框
      *
      * return 
      */
     function checkSelectAll()
     {
		if ($id("checkSelect").checked)
		{
			selectAll("group1");
		}else{
			selectNone("group1");
		}
     }
</script>
</body>
</html>