<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
	//获取标签中使用的国际化资源信息
	String application_list = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_applicationList");
	String application_add = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_applicationAdd");
	String application_update = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("applicationManager_l_applicationUpdate");
%>

<script>

  	// 新增应用
  	function addRecord() {
		var url = "org.gocom.abframe.rights.application.ApplicationManager.flow";
		url = url + "?_eosFlowAction=add";
    	url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
    	
    	//弹出新增业务字典类型模态框
    	showModalCenter(url, "", callBackTypeAdd, 500, 220, '<%=application_add%>');//增加应用
  	}
	
	//新增完成回调函数
	function callBackTypeAdd()
    {
    	$name("app_viewlist").submit();
    	window.parent.parent.parent.frames["IFRAMEAppFuncTree"].DTree.getRootNode().reloadChild();
    }
     
    //修改应用
  	function modiRecord() {
  		var appids = $id("group1").getSelectRows();
  		var appid = appids[0].getParam("app_selectedObjects/appid");
    	var url = "org.gocom.abframe.rights.application.ApplicationManager.flow";
		url = url + "?_eosFlowAction=update";
		url = url + "&appid=" + appid;
    	url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
    	
    	//弹出新增业务字典类型模态框
    	showModalCenter(url, "", callBackTypeAdd, 500, 220, '<%=application_update%>');//修改应用
  	}

	// 删除应用
  	function delRecord() {
	    var g = $id("group1");
	    if (g.getSelectLength() < 1) {
	      alert('<b:message key="m_delete_illegalSelect"/>');
	      return;
	    }
	    var frm = $name("app_viewlist");
	    frm.elements["_eosFlowAction"].value = "buttonDelete";
	    if(confirm('<b:message key="applicationManager_m_applicationdelete_confirm"/>')){
	      frm.submit();
	    }
  	}

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
<body topmargin="0" leftmargin="0" style="overflow: auto">

<h:form name="app_viewlist" action="org.gocom.abframe.rights.application.ApplicationManager.flow" method="post" >
<input type="hidden" name="_eosFlowAction" value="pageQuery">
<h:hiddendata property="page" />
<h:hiddendata property="application" />

<%--viewlist configurationID:20080807111434 --%>
  <table align="center" border="0" width="100%" class="EOS_table">
    <tr>
       <td colspan="10" class="eos-panel-title">&nbsp;&nbsp;<%=application_list %></td>
    </tr>
    <tr>
      <th align="center" width="12%">
      	<l:greaterThan property="page/size" targetValue="0" compareType="number">
        	<input type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll();"> 
        </l:greaterThan>
        <b:message key="l_select"></b:message>
      </th>
      <th>
        <b:message key="applicationManager_AcApplication.appname"></b:message>
      </th>
      <th>
        <b:message key="applicationManager_AcApplication.appcode"></b:message>
      </th>
      <th>
        <b:message key="applicationManager_AcApplication.apptype"></b:message>
      </th>
      <th>
        <b:message key="applicationManager_AcApplication.isopen"></b:message>
      </th>
      <th>
        <b:message key="applicationManager_AcApplication.opendate"></b:message>
      </th>
      <th>
        <b:message key="applicationManager_AcApplication.url"></b:message>
      </th>
      <th>
        <b:message key="applicationManager_AcApplication.ipaddr"></b:message>
      </th>
      <th>
        <b:message key="applicationManager_AcApplication.ipport"></b:message>
      </th>
      <th>
        <b:message key="applicationManager_AcApplication.appdesc"></b:message>
      </th>
    </tr>
    <w:checkGroup id="group1">
      <l:iterate property="appList" id="id1">
        <tr class="<l:output evenOutput='EOS_table_row' />">
          <td align="center">
          	<w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))">
              <h:param name='app_selectedObjects/appid' iterateId='id1' property='appid' indexed='true' />
            </w:rowCheckbox>
          </td>
          <td>
            <b:write iterateId="id1" property="appname"/>&nbsp;
          </td>
          <td>
            <b:write iterateId="id1" property="appcode"/>&nbsp;
          </td>
          <td>
            <d:write iterateId="id1" property="apptype" dictTypeId="ABF_APPTYPE"/>&nbsp;
          </td>
          <td>
            <d:write iterateId="id1" property="isopen" dictTypeId="ABF_YESORNO"/>&nbsp;
          </td>
          <td>
            <b:write iterateId="id1" property="opendate"/>&nbsp;
          </td>
          <td>
            <b:write iterateId="id1" property="url"/>&nbsp;
          </td>
          <td>
            <b:write iterateId="id1" property="ipaddr"/>&nbsp;
          </td>
          <td>
            <b:write iterateId="id1" property="ipport"/>&nbsp;
          </td>
          <td>
            <b:write iterateId="id1" property="appdesc"/>&nbsp;
          </td>
        </tr>
      </l:iterate>
    </w:checkGroup>
    <tr>
      <td colspan="10" class="command_sort_area">
         <div style="float:left">
          <input type="button" class="button" value='<b:message key="l_add"/>' onclick="addRecord();">
        <l:greaterThan property="page/size" targetValue="0" compareType="number">
          <input type="button" class="button" value='<b:message key="l_update"/>' onclick="modiRecord();" id="updateButton" disabled="true">
        </l:greaterThan>
        <l:greaterThan property="page/size" targetValue="0" compareType="number">
          <input type="button" class="button" value='<b:message key="l_delete"/>' onclick="delRecord();" id="deleteButton" disabled="true">
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
          <input type="button" class="button" onclick="firstPage('page', 'pageQuery', null, null, 'app_viewlist');" value='<b:message key="l_firstPage"/>'  <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
          <input type="button" class="button" onclick="prevPage('page', 'pageQuery', null, null, 'app_viewlist');" value='<b:message key="l_upPage"/>' <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
          <input type="button" class="button" onclick="nextPage('page', 'pageQuery', null, null, 'app_viewlist');" value='<b:message key="l_nextPage"/>' <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
          <l:equal property="page/isCount" targetValue="true">
            <input type="button" class="button" onclick="lastPage('page', 'pageQuery', null, null, 'app_viewlist');" value='<b:message key="l_lastPage"/>' <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
          </l:equal>
        </div>
      </td>
    </tr>
  </table>
</h:form>
</body>
</html>