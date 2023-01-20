<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String function_list = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_functionQueryResult");
           
%>

<script>
  //修改功能
  function modiRecord() {
    var g = $id("group1");
    if (g.getSelectLength() != 1) {
      alert('<b:message key="m_update_illegalSelect"></b:message>');
      return;
    }
    var funcUpdate = g.getSelectParams("funcSelectedObjects/funccode");
    var url="org.gocom.abframe.rights.application.FunctionManager.flow?_eosFlowAction=prepareUpdate&func/funccode="+funcUpdate;  
	showModalCenter(url,null,reQueryFuncResource,500,220,'<b:message key="applicationManager_l_functionUpdate"></b:message>');
  } 
  
  //新增/修改功能弹出页面关闭后调用的函数
  function reQueryFuncResource(){
    $name("func_viewlist").submit();
    window.parent.parent.parent.frames["IFRAMEAppFuncTree"].DTree.getSelectNode().reloadChild();
  }
  
  function delRecord() {
    var g = $id("group1");
    if (g.getSelectLength() < 1) {
      alert('<b:message key="m_delete_illegalSelect"></b:message>');
      return;
    }
    if(confirm('<b:message key="applicationManager_m_functiondelete_confirm"></b:message>')){
      var myAjax = new Ajax("org.gocom.abframe.rights.application.FunctionManager.deleteFunction.biz");
      var id =  g.getSelectParams("funcSelectedObjects/funccode");
         //删除可以多选，返回的是数组
         if( id != null && id != "" && id.length > 0 ) {
             for(var i = 0 ; i < id.length; i++) {
                 myAjax.addParam("function[" + (i+1) + "]/funccode", id[i] );
             }
             myAjax.submit();
	         var returnNode = myAjax.getResponseXMLDom();
	         if( returnNode ) {
	            if( myAjax.getValue("root/data/funcDelResult") == 1 ) {
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
      
      $name("func_viewlist").submit();
      window.parent.parent.parent.frames["IFRAMEAppFuncTree"].DTree.getRootNode().reloadChild();   
    }   
  } //删除功能
  
  function checkSelectAll(){
		if ($id("checkSelect").checked){
			selectAll("group1");
		}else{
			selectNone("group1");
		}
  } //实现全选复选框
    
</script>


</head>
<body leftmargin="0" topmargin="0" >
<%--viewlist configurationID:20080812112310 --%>
<h:form name="func_viewlist" action="org.gocom.abframe.rights.application.FunctionManager.flow" method="post">
<input type="hidden" name="_eosFlowAction" value="pageQuery">
  <h:hiddendata property="criteria" />
  <h:hiddendata property="page" />
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
       <td colspan="6" class="eos-panel-title">&nbsp;&nbsp;<%=function_list%></td>
      </tr>
      <tr>
        <th width="8%" align="center">
		  <input type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll();"> 
		  <b:message key="l_select"></b:message>
		</th>
        <th>
          <b:message key="applicationManager_AcFunction.funccode"></b:message>
        </th>
        <th>
          <b:message key="applicationManager_AcFunction.funcname"></b:message>
        </th>
        <th>
          <b:message key="applicationManager_AcFunction.functype"></b:message>
        </th>
        <th>
          <b:message key="applicationManager_AcFunction.parentFuncGroup"></b:message>
        </th>
        <th>
          <b:message key="applicationManager_AcFunction.funcaction"></b:message>
        </th>
      </tr>
      <w:checkGroup id="group1">
        <l:iterate property="funcList" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />">
            <td align="center">
              <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))">
                <h:param name='funcSelectedObjects/funccode' iterateId='id1' property='funccode'/>
              </w:rowCheckbox>
            </td>
            <td>
              <b:write iterateId="id1" property="funccode"/>
            </td>
            <td>
              <b:write iterateId="id1" property="funcname"/>
            </td>
            <td>
              <d:write iterateId="id1" property="functype" dictTypeId="ABF_FUNCTYPE"/>
            </td>
            <td>
              <b:write iterateId="id1" property="acFuncgroup/funcgroupname"/>
            </td>
            <td>
              <b:write iterateId="id1" property="funcaction"/>
            </td>
          </tr>
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="6" class="command_sort_area">
         <div style="float:left">
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
            <input type="button" class="button" onclick="firstPage('page', 'pageQuery', null, null, 'func_viewlist');" value='<b:message key="l_firstPage"/>'  <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="prevPage('page', 'pageQuery', null, null, 'func_viewlist');" value='<b:message key="l_upPage"/>' <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="nextPage('page', 'pageQuery', null, null, 'func_viewlist');" value='<b:message key="l_nextPage"/>' <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            <l:equal property="page/isCount" targetValue="true">
              <input type="button" class="button" onclick="lastPage('page', 'pageQuery', null, null, 'func_viewlist');" value='<b:message key="l_lastPage"/>' <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            </l:equal>
          </div>
        </td>
      </tr>
    </table>
</h:form>
</body>
</html>