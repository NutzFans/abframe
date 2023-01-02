<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common.jsp"%>
<%
	//获取标签中使用的国际化资源信息
	String identity_query_result = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("identityManager_l_identity")
			+ com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_query_result");
%>
<html>
<head>
<title><b:message key="identityManager_l_title_identityManager"></b:message>
</title>

<script>
  //模态窗口回调函数，关闭模态窗口时，刷新父窗口的数据
    function callBack() {
        //parent.parent.tree1.getSelectNode().reloadChild();  
        var frm = $name("query_form");
        frm.elements["_eosFlowAction"].value = "pageQuery";
        frm.submit();
    }
     //增加身份
     function addRecord() {
         var frm = $name("data_form");
         frm.elements["_eosFlowAction"].value = "insert";
         //frm.submit();
         
         var url = "org.gocom.abframe.rights.application.IdentityManager.flow";
         url += "?_eosFlowAction=insert";
         url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	     showModalCenter(url, "", callBack, 450, 350, '<b:message key="identityManager_l_identityadd"/>');
     }
     //删除身份
     function deleteRecord() {
         var g = $id("group1");       
         if( g.getSelectLength() < 1 ) {
              alert( '<b:message key="l_m_alert_mustSelectOneOrMore"/>' );  <!-- 必须至少选择一行 -->
              return;
         }
         if( !confirm( '<b:message key="identityManager_l_alert_confirmDelIdentity"/>' ) ) {  <!-- 您确定删除选择中的岗位 -->
             return;
         }                                
         var myAjax = new Ajax("org.gocom.abframe.rights.application.IdentityManager.deleteIdentity.biz");                 
             myAjax.submitForm($name("data_form"));     
	         var returnNode = myAjax.getResponseXMLDom();
	         if( returnNode ) {	         
	            if( myAjax.getValue("root/data/flag") == "true" ) {
	                alert( '<b:message key="l_m_delete_success"/>' );  <!-- 删除成功 -->
	                //删除记录后，重新刷新页面
                $name("query_form").submit();
	            } else { 
	                alert( '<b:message key="l_m_delete_fail"/>' );     <!-- 删除失败 -->
	            }
	         } else {
	            alert( '<b:message key="l_m_delete_fail"/>' );         <!-- 删除失败 --> 
	         }
        
         
     }
     //更新身份
     function updateRecord() {
         var g = $id("group1");
         var frm = $name("data_form");
         if( g.getSelectLength() != 1 ) {
              alert('<b:message key="l_m_alert_mustAdnOnlySelectOne"/>');  <!-- 必须且只能选择一行  -->
              return;
         }
         //取单个id的值
         var identityid = g.getSelectParams("select_objs/identityid");
         
         var url = "org.gocom.abframe.rights.application.IdentityManager.flow";
         url += "?_eosFlowAction=update";
         url += "&identity/identityid=" + identityid;
         url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
         showModalCenter(url, "", callBack, 450, 350, '<b:message key="identityManager_l_modify"/>');
     }
</script>
</head>
<body topmargin="0" leftmargin="0">
<h:form name="query_form"	action="org.gocom.abframe.rights.application.IdentityManager.flow" method="post">
<h:hiddendata property="criteria"/>
<h:hiddendata property="page"/>
<h:hidden property="_eosFlowAction" />
</h:form>
<h:form name="data_form" action="org.gocom.abframe.rights.application.IdentityManager.flow" method="post">
           <table align="center" border="0" width="100%" class="EOS_table">
            <input type="hidden" name="_eosFlowAction" value="pageQuery"/>            
            <h:hidden property="page/length"/>
            <h:hidden property="page/begin"/>
            <h:hidden property="page/isCount"/>
            <h:hidden property="page/count"/>
	          <tr height="4%">
				<td class="eos-panel-title" colspan="6">&nbsp;&nbsp;<%=identity_query_result%></td>
			  </tr>
	          <tr>
	            <th align="center">
	              <l:greaterThan property="page/size" targetValue="0" compareType="number">
	                  <input  type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll('checkSelect','group1');"> 
	              </l:greaterThan>
	              <b:message key="l_select"></b:message>	             
	            </th>
	            <th> <!--  身份编号 -->
	              <b:message key="identityManager_l_identityid"></b:message>
	            </th>
	            <th> <!--  身份名称 -->
	              <b:message key="identityManager_l_identityname"></b:message>
	            </th>
	            <th>   <!-- 显示顺序 -->
	              <b:message key="identityManager_l_seqno"></b:message>
	            </th>
	            <th>   <!-- 默认身份 -->
	              <b:message key="identityManager_l_identityflag"></b:message>
	            </th>
	            	            
	          </tr>
          <w:checkGroup id="group1">
          <l:iterate property="identitylist" id="id1">
              <tr class="<l:output evenOutput='EOS_table_row' />">
                <td align="center" width="8%">
                    <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" >
                        <h:param name='select_objs/identityid' iterateId='id1' property='identityid' indexed="true" />
                    </w:rowCheckbox>
                </td>
                <td>  <!--  身份编号 -->
                  <b:write iterateId="id1" property="identityid"/>
                </td>
                <td>  <!--  身份名称 -->
                  <b:write iterateId="id1" property="identityname"/>
                </td>
                <td>  <!-- 显示顺序 -->
                  <b:write iterateId="id1" property="seqno"/>
                </td>
                <td>  <!-- 默认身份 -->
                  <d:write iterateId="id1" dictTypeId="ABF_YESORNO"  property="identityflag" />
                </td>
                </tr>
            </l:iterate>
            </w:checkGroup>
            <tr>
              <td colspan="5" class="command_sort_area">
              <div style="float:left" >
                <input type="button" class="button" value='<b:message key="l_add"/>' onclick="addRecord();" >
                <l:greaterThan property="page/size" targetValue="0" compareType="number" >
                   <input type="button" class="button" value='<b:message key="l_update"/>' onclick="updateRecord();"  id="updateButton" disabled="true">
                </l:greaterThan>
                <l:greaterThan property="page/size" targetValue="0" compareType="number">
                   <input type="button" class="button" value='<b:message key="l_delete"/>' onclick="deleteRecord();"  id="deleteButton" disabled="true">
                </l:greaterThan>
                </div><div style="float:right" >
                <l:equal property="page/isCount" targetValue="true" >
                  <b:message key="l_total"></b:message>
                  <b:write property="page/count" />
                  <b:message key="l_recordNO."></b:message>
                  <b:write property="page/currentPage" />
                  <b:message key="l_page"></b:message>/
                  <b:write property="page/totalPage" />
                  <b:message key="l_page"></b:message>
                </l:equal>
                <l:equal property="page/isCount" targetValue="false" >
                  <b:message key="l_NO."></b:message>
                  <b:write property="page/currentPage" />
                  <b:message key="l_page"></b:message>
                </l:equal>
                <input type="button" class="button" onclick="firstPage('page', 'pageQuery', null, null, 'query_form');" value='<b:message key="l_firstPage"></b:message>'  <l:equal property="page/isFirst"  targetValue="true">disabled</l:equal> >
                <input type="button" class="button" onclick="prevPage('page', 'pageQuery', null, null, 'query_form');" value='<b:message key="l_upPage"></b:message>' <l:equal property="page/isFirst"  targetValue="true">disabled</l:equal> >
                <input type="button" class="button" onclick="nextPage('page', 'pageQuery', null, null, 'query_form');" value='<b:message key="l_nextPage"></b:message>' <l:equal property="page/isLast"  targetValue="true">disabled</l:equal> >
                <l:equal property="page/isCount" targetValue="true">
                  <input type="button" class="button" onclick="lastPage('page', 'pageQuery', null, null, 'query_form');" value='<b:message key="l_lastPage"></b:message>' <l:equal property="page/isLast"  targetValue="true">disabled</l:equal> >
                </l:equal>
              </div>
              </td>
            </tr>
            </table>
          </h:form>  
</body>
</html>          