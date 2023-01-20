<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String funcGroup_list = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_funcGroupList");
    String funcGroup_add = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_funcGroupAdd"); 
%>

<script>
	//新增功能组
	function addRecord(){
		var appid = $id('application_id').value;
		var url = "org.gocom.abframe.rights.application.FunctionGroupManager.flow";
		url = url + "?_eosFlowAction=add";
		url = url + "&appid=" + appid;
		url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
		    	
		//弹出新增功能组模态框
		showModalCenter(url, "", callBackFuncGroup, 500, 220, '<%=funcGroup_add%>');//增加功能组 
	} 
	
	//新增完成回调函数
	function callBackFuncGroup()
    {
    	$name("appFuncGroup_viewlist").submit();
    	window.parent.parent.frames["IFRAMEAppFuncTree"].DTree.getSelectNode().reloadChild();
    } 
  	
  	//修改功能组
  	function modiRecord() {
    	var g = $id("group1");
    	if (g.getSelectLength() != 1) {
      		alert('<b:message key="m_update_illegalSelect"></b:message>');
      		return;
    	}
    
    	var funcUpdate = g.getSelectParams("appFuncGroup_slctedObjs/funcgroupid");
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
      	var id =  g.getSelectParams("appFuncGroup_slctedObjs/funcgroupid");
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
  	} //删除功能组
  
	/* 
   	*  实现全选复选框
   	*/
  	function checkSelectAll(){
		if ($id("checkSelect").checked){
			selectAll("group1");
		}else{
			selectNone("group1");
		}
  	}
</script>

</head>
<body leftmargin="0" topmargin="0" >
<%--viewlist configurationID:20080902142351 --%>
<h:form name="appFuncGroup_viewlist" action="org.gocom.abframe.rights.application.ApplicationManager.flow" checkType="blur" target="_self" method="post">
  <input type="hidden" name="_eosFlowAction" value="query" >
  <h:hidden id = "application_id" property = "appid"/>
  <h:hiddendata property="criteria" />
  <h:hiddendata property="page" />
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
       <td colspan="6" class="eos-panel-title">&nbsp;&nbsp;<%=funcGroup_list%></td>
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
          <b:message key="applicationManager_AcFuncGroup.grouplevel"></b:message>
        </th>
        <th>
          <b:message key="applicationManager_AcFuncGroup.funcgroupseq"></b:message>
        </th>
        <th>
          <b:message key="applicationManager_AcFuncGroup.isleaf"></b:message>
        </th>
      </tr>
      <w:checkGroup id="group1">
        <l:iterate property="funcgroups" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />">
            <td align="center">
              <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))">
                <h:param name='appFuncGroup_slctedObjs/funcgroupid' iterateId='id1' property='funcgroupid'/>
              </w:rowCheckbox>
            </td>
            <td>
              <b:write iterateId="id1" property="funcgroupname"/>
            </td>
            <td>
              <b:write iterateId="id1" property="grouplevel"/>
            </td>
            <td>
              <b:write iterateId="id1" property="funcgroupseq"/>
            </td>
            <td>
              <d:write iterateId="id1" property="isleaf" dictTypeId="ABF_YESORNO"/>
            </td>
          </tr>
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="5" class="command_sort_area">
         <div style="float:left">
          <input type="button" class="button" value='<b:message key="l_add"></b:message>' onclick="addRecord();">
          <l:greaterThan property="page/size" targetValue="0" compareType="number">
            <input type="button" class="button" value='<b:message key="l_update"></b:message>' onclick="modiRecord();" id="updateButton" disabled="true">
          </l:greaterThan>
          <l:greaterThan property="page/size" targetValue="0" compareType="number">
            <input type="button" class="button" value='<b:message key="l_delete"></b:message>' onclick="delRecord();" id="deleteButton" disabled="true">
          </l:greaterThan>
          </div>
          <div style="float:right">
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
            <input type="button" class="button" onclick="firstPage('page', 'query', null, null, 'appFuncGroup_viewlist');" value='<b:message key="l_firstPage"/>'  <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="prevPage('page', 'query', null, null, 'appFuncGroup_viewlist');" value='<b:message key="l_upPage"/>' <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
            <input type="button" class="button" onclick="nextPage('page', 'query', null, null, 'appFuncGroup_viewlist');" value='<b:message key="l_nextPage"/>' <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            <l:equal property="page/isCount" targetValue="true">
              <input type="button" class="button" onclick="lastPage('page', 'query', null, null, 'appFuncGroup_viewlist');" value='<b:message key="l_lastPage"/>' <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
            </l:equal>
          </div>
        </td>
      </tr>
    </table>
</h:form>
</body>
</html>