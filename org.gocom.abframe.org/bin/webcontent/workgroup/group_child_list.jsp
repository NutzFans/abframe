<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("groupQuery_l_groupList");
	String groupQuery=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("workgroupManager_l_groupQuery");
	String selectPrompt=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("groupQuery_l_selectPrompt");
 %>
<title><%=title%></title> <!--工作组列表 -->
<script>
    //刷新指定树的选中节点 
    function refreshTreeNode(tree){
		try{
			tree.getSelectNode().reloadChild();
		}catch(e){
			//alert(e);
		}
	}
    
     //模态窗口回调函数，关闭模态窗口时，刷新父窗口的数据
    function callBack() {
        refreshTreeNode(parent.parent.window.frames['groupTree'].groupTree);
        var frm = $name("viewlist1");
        frm.elements["_eosFlowAction"].value = "pageQuery";
        frm.submit();
    }

	   //增加子工作组
	 function addRecord() {
	     var frm = $name("viewlist1");
	     //frm.elements["_eosFlowAction"].value = "insert";
	     //frm.submit();
	     
	     var url = "org.gocom.abframe.org.workgroup.GroupMain.flow";
	     url += "?_eosFlowAction=addGroup";
	     url += "&parentGroupid=";
	     url += '<b:write property="parentGroupid" scope="flow"/>';
	     url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	     showModalCenter(url, "", callBack, 700, 200, "<b:message key='workgroupManager_l_addSubGroup' />"); <!--增加子工作组 -->
	 }
	 //更新子工作组
	 function modiRecord() {
	     var g = $id("group1");
	     var frm = $name("viewlist1");
	     if( g.getSelectLength() != 1 ) {
	          alert("<b:message key='l_m_alert_mustAdnOnlySelectOne' />"); <!--必须且只能选择一行！ -->
	          return;
	     }
	     //取单个id的值
	     var groupid = g.getSelectParams("selectedObjects/groupid");
	     
	     var url = "org.gocom.abframe.org.workgroup.GroupMain.flow";
	     url += "?_eosFlowAction=update";
	     url += "&group/groupid=" + groupid;
	     url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	     showModalCenter(url, "", callBack, 700, 500, "<b:message key='workgroupManager_l_updateGroup' />"); <!--修改工作组 -->
	 }
	 //实现全选复选框
	 function checkSelectAll(){
		if ($id("checkSelect").checked){
			selectAll("group1");
		}else{
			selectNone("group1");
		}
	 } 
	 //删除子工作组
	 function deleteRecord() {
	     var g = $id("group1");
	     if( g.getSelectLength() < 1 ) {
	          alert("<b:message key='l_m_alert_mustSelectOneOrMore' />");<!--至少选择一行！ -->
	          return;
	     }
	     if( !confirm("<b:message key='workgroupManager_m_delete_group_confirm' />") ) { <!--您确认要删除选中的工作组？ -->
	         return;
	     }
	      
	     var myAjax = new Ajax("org.gocom.abframe.org.workgroup.WorkgroupManager.deleteGroups.biz");
	     var id =  g.getSelectParams("selectedObjects/groupid");
	     //删除可以多选，返回的是数组
	     if( id != null && id != "" && id.length > 0 ) {
	         for(var i = 0 ; i < id.length; i++) {
	             myAjax.addParam("groups[" + (i+1) + "]/groupid", id[i] );
	         }
	         myAjax.submit();
	         var returnNode = myAjax.getResponseXMLDom();
	         if( returnNode ) {
	            if( myAjax.getValue("root/data/oprResult") == 1 ) {
	                alert( '<b:message key="l_m_delete_success"/>' );  <!--  删除成功 -->
	            } else {
	                alert( '<b:message key="l_m_delete_fail"/>' );     <!-- 删除失败 -->      
	            }
	         } else {
	            alert( '<b:message key="l_m_delete_fail"/>' );     <!-- 删除失败 -->     
	         }
	         
	     }
	     //删除记录后，重新刷新页面
	     callBack();
	 }
</script>

</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<h:form name="form1" action="org.gocom.abframe.org.workgroup.GroupMain.flow" checkType="blur" method="post" onsubmit="return checkForm(this);">
  <input type="hidden" name="_eosFlowAction" value="pageQuery"/>
  <h:hidden name="criteria/_expr[1]/omGroup.groupid" property="parentGroupid" scope="flow"/>
  <w:panel id="panel1" width="100%" title="<%=groupQuery%>">
    <table align="center" border="0" width="100%" class="form_table" >
      <tr>
        <td class="form_label">
          <b:message key="workgroupManager_OmGroup.groupname" /><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <h:text property="criteria/_expr[2]/groupname" maxlength="50" validateAttr="maxLength=50" />
          <h:hidden property="criteria/_expr[2]/_op" value="like"/>
          <h:hidden property="criteria/_expr[2]/_likeRule" value="all"/>
        </td>
        <td class="form_label">
          <b:message key="workgroupManager_OmGroup.grouptype" /><b:message key="l_colon"></b:message>
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_GROUPTYPE" nullLabel="<%=selectPrompt%>" style="width:133" property="criteria/_expr[3]/grouptype"/>   
          <h:hidden property="criteria/_expr[3]/_op" value="="/>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          <b:message key="workgroupManager_OmGroup.groupstatus" /><b:message key="l_colon"></b:message>
        </td>
        <td colspan="3">
          <d:select dictTypeId="ABF_GROUPSTATUS" nullLabel="<%=selectPrompt%>" style="width:133" property="criteria/_expr[4]/groupstatus"/>
          <h:hidden property="criteria/_expr[4]/_op" value="="/>
        </td>
      </tr>
      <tr class="form_bottom">
        <td colspan="4" class="form_bottom">
          <input type="hidden" name="criteria/_entity" value="org.gocom.abframe.dataset.organization.OmGroup">
          <b:message key="l_pageDisplay" />
          <h:text size="2" property="page/length" value="10"  scope="flow" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
          <input type="hidden" name="page/begin" value="0"  scope="flow">
          <input type="hidden" name="page/isCount" value="true"  scope="flow">
          <input type="submit" class="button" value="<b:message key="l_query" />">&nbsp;
              <input type="button" class="button" value='<b:message key="l_reset"></b:message>' onclick="javascript:$name('query_form').reset();">
        </td>
      </tr>
    </table>
  </w:panel>
</h:form>
<%--viewlist configurationID:20080820172055 --%>
<h:form name="viewlist1" action="org.gocom.abframe.org.workgroup.GroupMain.flow" checkType="blur" target="_self" method="post">
  <input type="hidden" name="_eosFlowAction" value="pageQuery" >
  <!-- 隐藏匿分页及查询信息 -->
  <h:hiddendata property="page" scope="flow"/>
  <h:hiddendata property="criteria"  />
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
       <td colspan="7" class="eos-panel-title">&nbsp;<%=title %></td>
      </tr>
      <tr>
        <th align="center">
          <l:greaterThan property="page/size" targetValue="0" compareType="number" scope="f">
	      	<input  type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll();"> 
	      </l:greaterThan>        
          <b:message key="l_select" /> <!--选择 -->
        </th>
        <th>
          <b:message key="workgroupManager_OmGroup.groupname" /> <!--工作组名称 -->
        </th>
        <th>
          <b:message key="workgroupManager_OmGroup.orgid(Organization.orgname)" /> <!--隶属机构 -->
        </th>        
        <th>
          <b:message key="workgroupManager_OmGroup.grouptype" /> <!--工作组类型 -->
        </th>
        <th>
          <b:message key="workgroupManager_OmGroup.groupstatus" /> <!--工作组状态 -->
        </th>

        <th>
          <b:message key="workgroupManager_OmGroup.startdate" /> <!--有效开始日期 -->
        </th>
        <th>
          <b:message key="workgroupManager_OmGroup.enddate" /> <!--有效截止日期 -->
        </th>
      </tr>
      <w:checkGroup id="group1">
        <l:iterate property="groups" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />">
            <td align="center">
              <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))">
                <h:param name='selectedObjects/groupid' iterateId='id1' property='groupid' indexed="true" />
              </w:rowCheckbox>
            </td>
            <td>
              <b:write iterateId="id1" property="groupname"/>
            </td>
            <td>
              <b:write iterateId="id1" property="Organization/orgname"/>
            </td>                        
            <td>
              <d:write dictTypeId="ABF_GROUPTYPE" iterateId="id1" property="grouptype"/>
            </td>
            <td>
              <d:write dictTypeId="ABF_GROUPSTATUS" iterateId="id1" property="groupstatus"/>
            </td>            
            <td>
              <b:write iterateId="id1" property="startdate" formatPattern="yyyy-MM-dd"/>
            </td>
            <td>
              <b:write iterateId="id1" property="enddate" formatPattern="yyyy-MM-dd"/>
            </td>
          </tr>
        </l:iterate>
      </w:checkGroup>
      <tr>

        <td colspan="10" class="command_sort_area">
          <div style="float:left">
          <input type="button" class="button" value="<b:message key = 'l_add'/>" onclick="addRecord();"><!--新增 -->
          
          <l:greaterThan property="page/size" targetValue="0" compareType="number"  scope="flow" >
            <input type="button" class="button" value="<b:message key = 'l_update'/>" onclick="modiRecord();" id="updateButton" disabled="true"> <!--修改 -->
          </l:greaterThan>
          <l:greaterThan property="page/size" targetValue="0" compareType="number"  scope="flow" >
            <input type="button" class="button" value="<b:message key = 'l_delete'/>" onclick="deleteRecord();" id="deleteButton" disabled="true"> <!--删除 -->
          </l:greaterThan>
          </div>
          <div style="float:right">
            <l:equal property="page/isCount" targetValue="true" scope="flow" >
              <b:message key = 'l_total'/>       <!--共 -->
              <b:write property="page/count" scope="flow" />
              <b:message key = 'l_recordNO.'/>   <!--条记录 第 -->
              <b:write property="page/currentPage" scope="flow" />
              <b:message key = 'l_page'/>/       <!--页 -->
              <b:write property="page/totalPage" scope="flow" />
              <b:message key = 'l_page'/>        <!--页 -->
            </l:equal>
            <l:equal property="page/isCount" targetValue="false" scope="flow" >
              <b:message key = 'l_NO.'/>         <!--第 -->
              <b:write property="page/currentPage" scope="flow" />
              <b:message key = 'l_page'/>        <!--页 -->
            </l:equal>
            <!--首页 上页 下页 尾页 -->
            <input type="button" class="button" onclick="firstPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_firstPage'/>"  <l:equal property="page/isFirst" targetValue="true"  scope="flow">disabled</l:equal> >
            <input type="button" class="button" onclick="prevPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_upPage'/>" <l:equal property="page/isFirst" targetValue="true"  scope="flow">disabled</l:equal> >
            <input type="button" class="button" onclick="nextPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_nextPage'/>" <l:equal property="page/isLast" targetValue="true"  scope="flow">disabled</l:equal> >
            <l:equal property="page/isCount" targetValue="true"  scope="flow">
              <input type="button" class="button" onclick="lastPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_lastPage'/>" <l:equal property="page/isLast" targetValue="true"  scope="flow">disabled</l:equal> >
            </l:equal>
          </div>
        </td>
      </tr>
    </table>
</h:form>
</body>
</html>