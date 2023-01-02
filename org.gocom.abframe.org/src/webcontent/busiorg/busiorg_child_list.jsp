<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>
<html>
<head>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_title_busiorg_child_list");
	String selectPrompt=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("groupQuery_l_selectPrompt");
	String query_title = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_title_queryStr");
%>
<title><%=title%></title> <!--子业务机构列表 -->
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
	    var frm = $name("viewlist1");
	    frm.elements["_eosFlowAction"].value = "pageQuery";
	    frm.submit();
	    refreshTreeNode(parent.parent.window.frames['orgTree'].orgTree);
	  }
	
	   //增加业务机构
	 function addBusiorg() {
	     
	     var url = "org.gocom.abframe.org.busiorg.SubBusiOrgMaintain.flow";
	     url += "?_eosFlowAction=insert";
	     url += "&org/nodetype=actual";
	     //使用模态窗口，需要自己传递页面流级变量
	     url += "&parentBusiorgid=";
	     url += '<b:write property="parentBusiorgid" scope="flow"/>';     
	     url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	     showModalCenter(url, "", callBack, 400, 220, "<b:message key = 'bizOrgManager_l_addSubBusiorg'/>"); <!--新增子机构 -->
	 }
	   //增加虚拟子业务机构
	 function addVirtualBusiorg() {
	     
	     var url = "org.gocom.abframe.org.busiorg.SubBusiOrgMaintain.flow";
	     url += "?_eosFlowAction=insert";
	     url += "&org/nodetype=virtual";
	     //使用模态窗口，需要自己传递页面流级变量
	     url += "&parentBusiorgid=";
	     url += '<b:write property="parentBusiorgid" scope="flow"/>';
	     url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	     showModalCenter(url, "", callBack, 400, 200, "<b:message key = 'bizOrgManager_l_addVirtualSubBusiorg'/>"); //新增子虚拟机构  
	 }
	 //更新业务机构
	 function modiRecord() {
	     var g = $id("group1");
	     var frm = $name("viewlist1");
	     if( g.getSelectLength() != 1 ) {
	          alert("<b:message key='l_m_alert_mustAdnOnlySelectOne' />"); //必须且只能选择一行！ 
	          return;
	     }
	     //取单个id的值
	     var busiorgid = g.getSelectParams("selectedObjects/busiorgid");
	     
	     var url = "org.gocom.abframe.org.busiorg.SubBusiOrgMaintain.flow";
	     url += "?_eosFlowAction=update";
	     url += "&org/busiorgid=" + busiorgid;
	     url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	     showModalCenter(url, "", callBack, 400, 220, "<b:message key='bizOrgManager_l_title_busiorg_update' />"); //业务机构修改 
	 }
	 //实现全选复选框
	 function checkSelectAll(){
		if ($id("checkSelect").checked){
			selectAll("group1");
		}else{
			selectNone("group1");
		}
	 } 
	 //删除业务机构
	 function delRecord() {
	     var g = $id("group1");
	     if( g.getSelectLength() < 1 ) {
	          alert("<b:message key='l_m_alert_mustSelectOneOrMore' />");//至少选择一行！  
	          return;
	     }
	     if( !confirm("<b:message key='bizOrgManager_l_m_delete_busiorg_confim' />") ) { //您确认要删除选中的业务机构 
	         return;
	     }
	      
	     var myAjax = new Ajax("org.gocom.abframe.org.busiorg.BusiOrgManager.deleteBusiorgs.biz");
	     var id =  g.getSelectParams("selectedObjects/busiorgid");
	     //删除可以多选，返回的是数组
	     if( id != null && id != "" && id.length > 0 ) {
	         for(var i = 0 ; i < id.length; i++) {
	             myAjax.addParam("orgs[" + (i+1) + "]/busiorgid", id[i] );
	         }
	         myAjax.submit();
	         var returnNode = myAjax.getResponseXMLDom();
	         if( returnNode ) {
	            if( myAjax.getValue("root/data/oprResult") == 1 ) {
	                alert( '<b:message key="l_m_delete_success"/>' );  //删除成功 
	            } else {
	                alert( '<b:message key="l_m_delete_fail"/>' );     //删除失败 
	            }
	         } else {
	            alert( '<b:message key="l_m_delete_fail"/>' );     //删除失败  
	         }
	         
	     }
	     //删除记录后，重新刷新页面
	     callBack();
	 }    
</script>
</head>
<body leftmargin="0" topmargin="0" rightmargin="0">
<h:form name="form1" action="org.gocom.abframe.org.busiorg.SubBusiOrgMaintain.flow" checkType="blur" method="post" onsubmit="return checkForm(this);">
  <input type="hidden" name="_eosFlowAction" value="pageQuery"/>
  <h:hidden name="criteria/_expr[1]/omBusiorg.busiorgid" property="parentBusiorgid" scope="flow"/>
  <w:panel id="panel1" width="100%" title="<%=query_title %>"><!--业务机构查询条件-->
    <table align="center" border="0" width="100%" class="form_table" >
      <tr>
        <td class="form_label">
          <b:message key="bizOrgManager_OmBusiorg.orgname" /><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <h:text property="criteria/_expr[2]/orgname" maxlength="50" validateAttr="maxLength=50" />
          <h:hidden property="criteria/_expr[2]/_op" value="like"/>
          <h:hidden property="criteria/_expr[2]/_likeRule" value="all"/>
        </td>
        <td class="form_label">
          <b:message key="bizOrgManager_OmBusiorg.nodetype" /><b:message key="l_colon"/>
        </td>
        <td colspan="1">
          <d:select dictTypeId="ABF_BUSIORGTYPE" nullLabel="<%=selectPrompt%>" style="width:133" property="criteria/_expr[3]/nodetype"/>   
          <h:hidden property="criteria/_expr[3]/_op" value="="/>
        </td>
      </tr>
      <tr class="form_bottom">
        <td colspan="4" class="form_bottom">
          <input type="hidden" name="criteria/_entity" value="org.gocom.abframe.dataset.organization.OmBusiorg">
          <b:message key="l_pageDisplay" />
          <h:text size="2" property="page/length" value="10"   validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
          <input type="hidden" name="page/begin" value="0"  >
          <input type="hidden" name="page/isCount" value="true"  >
          <input type="submit" class="button" value="<b:message key="l_query" />">&nbsp;
              <input type="button" class="button" value='<b:message key="l_reset"></b:message>' onclick="javascript:$name('form1').reset();">
        </td>
      </tr>
    </table>
  </w:panel>
</h:form>
<%--viewlist configurationID:20080814144227 --%>
<h:form name="viewlist1" action="org.gocom.abframe.org.busiorg.SubBusiOrgMaintain.flow" checkType="blur" target="_self" method="post">
  <input type="hidden" name="_eosFlowAction" value="pageQuery" >
  <!-- 隐藏匿分页及查询信息 -->
  <h:hiddendata property="page" />
  <h:hiddendata property="criteria"  />
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
       <td colspan="4" class="eos-panel-title">&nbsp;<%=title %></td><!--子业务机构列表-->
      </tr>
      <tr>
        <th align="center">
          <l:greaterThan property="page/size" targetValue="0" compareType="number">
	      	<input  type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll();"> 
	      </l:greaterThan>
          <b:message key = 'l_select'/> <!--选择 -->
        </th>
        <th>
          <b:message key = 'bizOrgManager_OmBusiorg.orgname'/> <!--业务机构名称 -->
        </th>
        <th>
          <b:message key = 'bizOrgManager_OmBusiorg.orgcode'/> <!--业务机构代码 -->
        </th>        
        <th>
          <b:message key = 'bizOrgManager_OmBusiorg.nodetype'/> <!--业务机构类型 -->
        </th>

      </tr>
      <w:checkGroup id="group1">
        <l:iterate property="busiorgs" id="id1">
          <tr class="<l:output evenOutput='EOS_table_row' />">
            <td align="center">
              <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))">
              <h:param name='selectedObjects/busiorgid' iterateId='id1' property='busiorgid' indexed='true' />
              </w:rowCheckbox>
            </td>
            <td>
              <b:write iterateId="id1" property="orgname"/>
            </td>
            <td>
              <b:write iterateId="id1" property="orgcode"/>
            </td>
            <td>
              <d:write iterateId="id1" dictTypeId="ABF_BUSIORGTYPE" property="nodetype" />
            </td>
          </tr>
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="4" class="command_sort_area">
         <div style="float:left">
          <input type="button" class="button" value="<b:message key = 'bizOrgManager_l_addSubBusiorg'/>" style="width:70" onclick="addBusiorg();"> <!--新增子机构 -->
          <input type="button" class="button" value="<b:message key = 'bizOrgManager_l_addVirtualSubBusiorg'/>" style="width:95" onclick="addVirtualBusiorg();"> <!--新增子虚拟机构 -->
          <l:greaterThan property="page/size" targetValue="0" compareType="number"  >
            <input type="button" class="button" value="<b:message key = 'l_update'/>" onclick="modiRecord();" id="updateButton" disabled="true"> <!--修改 -->
          </l:greaterThan>
          <l:greaterThan property="page/size" targetValue="0" compareType="number"  >
            <input type="button" class="button" value="<b:message key = 'l_delete'/>" onclick="delRecord();" id="deleteButton" disabled="true"> <!--删除 -->
          </l:greaterThan>
          </div>
          <div style="float:right">
            <l:equal property="page/isCount" targetValue="true">
              <b:message key = 'l_total'/>       <!--共 -->
              <b:write property="page/count"/>
              <b:message key = 'l_recordNO.'/>   <!--条记录 第 -->
              <b:write property="page/currentPage"/>
              <b:message key = 'l_page'/>/       <!--页 -->
              <b:write property="page/totalPage"/>
              <b:message key = 'l_page'/>        <!--页 -->
            </l:equal>
            <l:equal property="page/isCount" targetValue="false">
              <b:message key = 'l_NO.'/>         <!--第 -->
              <b:write property="page/currentPage"/>
              <b:message key = 'l_page'/>        <!--页 -->
            </l:equal>

            <!--首页 上页 下页 尾页 -->           
            <input type="button" class="button" onclick="firstPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_firstPage'/>"  <l:equal property="page/isFirst" targetValue="true"  >disabled</l:equal> >
            <input type="button" class="button" onclick="prevPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_upPage'/>" <l:equal property="page/isFirst" targetValue="true"  >disabled</l:equal> >
            <input type="button" class="button" onclick="nextPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_nextPage'/>" <l:equal property="page/isLast" targetValue="true"  >disabled</l:equal> >
            <l:equal property="page/isCount" targetValue="true">
              <input type="button" class="button" onclick="lastPage('page', 'pageQuery', null, null, 'viewlist1');" value="<b:message key = 'l_lastPage'/>" <l:equal property="page/isLast" targetValue="true"  >disabled</l:equal> >
            </l:equal>
          </div>
        </td>
      </tr>
    </table>
</h:form>

</body>
</html>