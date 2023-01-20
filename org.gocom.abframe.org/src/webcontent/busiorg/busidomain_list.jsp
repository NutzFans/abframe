<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<%
	//获取标签中使用的国际化资源信息
	String title=com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("bizOrgManager_l_title_busidomain_list");
%>
<head>
<title><%=title%></title> <!--业务套别列表 -->

<script language="javascript">

  //刷新指定树的选中节点 
	function refreshTreeNode(tree){
		try{
			tree.getRootNode().reloadChild();
		}catch(e){
			//alert(e);
		}
	}
  
  //模态窗口回调函数，关闭模态窗口时，刷新父窗口的数据
  function callBack() {
    refreshTreeNode(parent.parent.window.frames['orgTree'].orgTree);
    var frm = $name("viewlist1");
    frm.elements["_eosFlowAction"].value = "pageQuery";
    frm.submit();
  }

   //增加业务套别
 function addRecord() {
     var frm = $name("viewlist1");
     
     var url = "org.gocom.abframe.org.busiorg.BusiDomainMaintain.flow";
     url += "?_eosFlowAction=insert";
     url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
     showModalCenter(url, "", callBack, 400, 100, "<b:message key = 'bizOrgManager_l_addBusidomain'/>");
 }
 //更新业务套别
 function modiRecord() {
     var g = $id("group1");
     var frm = $name("viewlist1");
     if( g.getSelectLength() != 1 ) {
          alert("<b:message key='l_m_alert_mustAdnOnlySelectOne' />");
          return;
     }
     //取单个id的值
     var busiorgid = g.getSelectParams("selectedObjects/busiorgid");
     
     var url = "org.gocom.abframe.org.busiorg.BusiDomainMaintain.flow";
     url += "?_eosFlowAction=update";
     url += "&org/busiorgid=" + busiorgid;
     url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
     showModalCenter(url, "", callBack, 400, 100, "<b:message key='bizOrgManager_l_title_busidomain_update' />");
 }
 //实现全选复选框
 function checkSelectAll(){
	if ($id("checkSelect").checked){
		selectAll("group1");
	}else{
		selectNone("group1");
	}
 } 
 //删除业务套别
 function delRecord() {
     var g = $id("group1");
     if( g.getSelectLength() < 1 ) {
          alert("<b:message key='l_m_alert_mustSelectOneOrMore' />");
          return;
     }
     if( !confirm("<b:message key='bizOrgManager_l_m_delete_busidomain_confim' />") ) {
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

 
<h:form name="viewlist1" action="org.gocom.abframe.org.busiorg.BusiDomainMaintain.flow" checkType="blur" target="_self" method="post">
  <input type="hidden" name="_eosFlowAction" value="pageQuery" > 
  <h:hiddendata  property="page"/>
    <table align="center" border="0" width="100%" class="EOS_table">
      <tr>
       <td colspan="3" class="eos-panel-title">&nbsp;<%=title%></td><!--业务套别列表 -->
      </tr>
      <tr>
        <th align="center">
          <l:greaterThan property="page/size" targetValue="0" compareType="number">
	      	<input  type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll();"> 
	      </l:greaterThan>
          <b:message key = 'l_select'/> <!--选择 -->
        </th>
        <th>
          <b:message key = 'bizOrgManager_OmBusiorg.busidomain'/> <!--业务套别名称 -->
        </th>
        <th>
          <b:message key = 'bizOrgManager_OmBusiorg.orgname(busidomain)'/> <!--业务套别显示名称 -->
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
              <b:write iterateId="id1" property="busidomain"/>
            </td>
            <td>
              <b:write iterateId="id1" property="orgname"/>
            </td>
          </tr>
        </l:iterate>
      </w:checkGroup>
      <tr>
        <td colspan="3" class="command_sort_area">
        <div style="float:left">
          <input type="button" class="button" value="<b:message key = 'l_add'/>" onclick="addRecord();"><!--新增 -->
          <l:greaterThan property="page/size" targetValue="0" compareType="number"  >
            <input type="button" class="button" value="<b:message key = 'l_update'/>" onclick="modiRecord();" id="updateButton" disabled="true"><!--修改 -->
          </l:greaterThan>
          <l:greaterThan property="page/size" targetValue="0" compareType="number"  >
            <input type="button" class="button" value="<b:message key = 'l_delete'/>" onclick="delRecord();" id="deleteButton" disabled="true"><!--删除 -->
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