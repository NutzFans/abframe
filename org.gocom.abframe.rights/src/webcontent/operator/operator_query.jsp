<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common.jsp"%>

<%
	//获取标签中使用的国际化资源信息
	String operator     = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("OperatorManager_l_operator"); //操作员
	String query_cond   = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_query_cond");               //查询条件
	String choose       = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("OperatorManager_l_choose");   //请选择...
	String query_result = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_query_result");             //查询结果
%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title><b:message key="OperatorManager_l_operator"></b:message><b:message key="OperatorManager_l_manager"></b:message></title><!-- 操作员管理 -->
    <script>

      /*
	   * 功能：修改操作员
	   * 
	   * return
	   */
      function updateRecord()
      {
        var g = $id("group1");
        var frm = $name("page_form");
        if (g.getSelectLength() != 1) {
          alert('<b:message key="l_m_alert_mustAdnOnlySelectOne"/>'); //必须且只能选择一行
          return;
        }
        
        //操作员ID
        var operatorid = g.getSelectParams("select_objs/operatorid");
        var url = "org.gocom.abframe.rights.OperatorManager.flow";
        url += "?_eosFlowAction=update";
        url += "&acoperator/operatorid=" + operatorid;
        url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
        
        //弹出修改操作员模态框
    	showModalCenter(url, "", callBack, 520, 210, '<b:message key="l_update"/>' + '<b:message key="OperatorManager_l_operator"/>');//修改操作员
      }
      
      /*
       * 功能：新增操作员
       *
       * return 
       */
      function addRecord()
      {
        var url = "org.gocom.abframe.rights.OperatorManager.flow";
    	url = url + "?_eosFlowAction=insert";
    	url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
    	
    	//弹出新增操作员模态框
    	showModalCenter(url, "", callBack, 520, 210, '<b:message key="l_add"/>' + '<b:message key="OperatorManager_l_operator"/>');//新增操作员
      }
      
      /*
       * 功能：新增、修改完成后回调函数－重新刷新页面
       *
       * return 
       */
      function callBack()
      {
      	var frm = $name("page_form");
      	frm.elements["_eosFlowAction"].value = "pageQuery";
      	frm.submit();
      }
      
      /*
       * 功能：删除操作员
       *
       * return 删除成败标志
       */
      function deleteRecord()
      {
        var g = $id("group1");
        var frm = $name("page_form");
        
        if( g.getSelectLength() < 1 ) {
              alert( '<b:message key="l_m_alert_mustSelectOneOrMore"/>' );  //必须至少选择一行
              return;
         }
         if( !confirm('<b:message key="OperatorManager_m_delete_type_confirm"/>')) //您确认删除当前选中操作员吗？
         {     
             return;
         }
          
         var myAjax = new Ajax("org.gocom.abframe.rights.OperatorManager.deleteAcOperators.biz");
         var id =  g.getSelectParams("select_objs/operatorid");
         
         //删除可以多选，返回的是数组
         if( id != null && id != "" && id.length > 0 ) {
             for(var i = 0 ; i < id.length; i++) {
                 myAjax.addParam("acoperators[" + (i+1) + "]/operatorid", id[i] );
             }
             myAjax.submit();
	         var returnNode = myAjax.getResponseXMLDom();
	         if( returnNode ) {
	            if( myAjax.getValue("root/data/reCode") == 1 ) 
	            {
	                alert('<b:message key="l_m_delete_success"/>');   //删除成功
	            }else{
	                alert('<b:message key="l_m_delete_fail"/>');      //删除失败
	            }
	         } else {
	            alert('<b:message key="l_m_delete_fail"/>');          //删除失败
	         }
             
         }
         
         //删除记录后，重新刷新页面
         frm.elements["_eosFlowAction"].value = "pageQuery";
         frm.submit();
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
     
     /*
      * 功能：重置密码
      * 
      * return 
      */
     function resetPwd()
     {
     	var g = $id("group1");
        var frm = $name("page_form");
        
        if( g.getSelectLength() < 1 ) {
              alert( '<b:message key="l_m_alert_mustSelectOneOrMore"/>' );  //必须至少选择一行
              return;
         }
         if( !confirm('<b:message key="OperatorManager_m_reset_pwd_confirm"/>')) //您确认重置密码吗？
         {     
             return;
         }
          
         var myAjax = new Ajax("org.gocom.abframe.rights.OperatorManager.updateOperatorPwd.biz");
         var id =  g.getSelectParams("select_objs/operatorid");
         
         //重置密码可以多选，返回的是数组
         if( id != null && id != "" && id.length > 0 ) {
             for(var i = 0 ; i < id.length; i++) {
                 myAjax.addParam("acoperators[" + (i+1) + "]/operatorid", id[i] );
             }
             myAjax.submit();
	         var returnNode = myAjax.getResponseXMLDom();
	         if( returnNode ) {
	            if( myAjax.getValue("root/data/reCode") == 1 ) 
	            {
	                alert('<b:message key="OperatorManager_l_reset_pwd"/>' + '<b:message key="OperatorManager_m_succeed"/>');   //重置密码成功
	            }else{
	                alert('<b:message key="OperatorManager_l_reset_pwd"/>' + '<b:message key="OperatorManager_m_failed"/>');    //重置密码失败
	            }
	         } else {
	            alert('<b:message key="OperatorManager_l_reset_pwd"/>' + '<b:message key="OperatorManager_m_failed"/>');          //重置密码失败
	         }
             
         }
     }
     
    </script>
  </head>
  <body leftmargin="0" rightmargin="0" topmargin="0">
    <e:datasource name="criteria" type="entity" path="com.primeton.das.criteria.criteraiType" />
    <e:datasource name="page" type="entity" path="com.eos.foundation.PageCond" />
    <e:datasource name="acoperators" type="entity" path="org.gocom.abframe.dataset.privilege.AcOperator" />
    <h:form name="query_form" action="org.gocom.abframe.rights.OperatorManager.flow" method="post" onsubmit="return checkForm(this);">
      <input type="hidden" name="_eosFlowAction" value="pageQuery"/>
      <w:panel id="panel1" width="100%" title="<%=operator + query_cond%>"><!-- 操作员查询条件 -->
        <table align="center" border="0" width="100%" class="form_table">
          <tr>
            <td class="form_label">
              <b:message key="OperatorManager_l_operator"></b:message><b:message key="OperatorManager_l_name"></b:message><b:message key="DictManager_l_colon"></b:message><!-- 操作员名称： -->
            </td>
            <td colspan="1">
              <h:text property="criteria/_expr[1]/operatorname"/>
              <h:hidden property="criteria/_expr[1]/_op" value="like"/>
            </td>
            <td class="form_label">
              <b:message key="OperatorManager_l_operator"></b:message><b:message key="OperatorManager_l_status"></b:message><b:message key="DictManager_l_colon"></b:message><!-- 操作员状态： -->
            </td>
            <td colspan="1">
              <d:select dictTypeId="ABF_OPERSTATUS" property="criteria/_expr[2]/status" style="width:133" nullLabel="<%=choose%>"/><!-- 请选择... -->
              <h:hidden property="criteria/_expr[2]/_op" value="="/>
            </td>
          </tr>
          <tr class="form_bottom">
            <td colspan="4" class="form_bottom">
              <input type="hidden" name="criteria/_entity" value="org.gocom.abframe.dataset.privilege.AcOperator">
              <b:message key="l_pageDisplay"></b:message><!-- 每页显示 -->
              <h:text size="2" property="page/length" value="10" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
              <input type="hidden" name="page/begin" value="0">
              <input type="hidden" name="page/isCount" value="true">
              <input type="submit" class="button" value='<b:message key="l_query"></b:message>'> <!-- 查询 -->
              <input type="reset" class="button" value='<b:message key="l_reset"></b:message>'> <!-- "重置" -->
            </td>
          </tr>
        </table>
      </w:panel>
      <h:hidden property="criteria/_orderby[1]/_sort" value="asc"/>
      <h:hidden property="criteria/_orderby[1]/_property" value="operatorname"/>
    </h:form>
    <h:form name="page_form" action="org.gocom.abframe.rights.OperatorManager.flow" method="post">
      <input type="hidden" name="_eosFlowAction" value="pageQuery"/>
      <h:hiddendata property="criteria" />
      <h:hidden property="page/begin"/>
      <h:hidden property="page/length"/>
      <h:hidden property="page/count"/>
        <table align="center" border="0" width="100%" class="EOS_table">
          <tr>
	       <td colspan="6" class="eos-panel-title">&nbsp;<%=operator + query_result%></td><!-- 操作员查询结果 -->
	      </tr>
          <tr>
            <th align="center" width="60">
              <l:greaterThan property="page/size" targetValue="0" compareType="number">
	          	<input type="checkbox" id="checkSelect" name="checkSelect" title='<b:message key="l_select"></b:message>' onclick="checkSelectAll();"><!-- 选择 -->
	          </l:greaterThan>
	          <b:message key="l_select"></b:message>
            </th>
            <th>
              <b:message key="OperatorManager_l_operator"></b:message>ID <!-- 操作员ID -->
            </th>
            <th>
              <b:message key="OperatorManager_l_operator"></b:message><b:message key="OperatorManager_l_name"></b:message><!-- 操作员名称 -->
            </th>
            <th>
              <b:message key="OperatorManager_AcOperator.userid"></b:message><!-- 登录用户名 -->
            </th>
            <th>
              <b:message key="OperatorManager_AcOperator.authmode"></b:message><!-- 认证模式 -->
            </th>
            <th>
              <b:message key="OperatorManager_l_operator"></b:message><b:message key="OperatorManager_l_status"></b:message><!-- 操作员状态 -->
            </th>
          </tr>
          <w:checkGroup id="group1">
            <l:iterate property="acoperators" id="id1">
              <tr class="<l:output evenOutput='EOS_table_row' />">
                <td align="center">
                  <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" > 
                    <h:param name='select_objs/operatorid' iterateId='id1' property='operatorid' indexed="true"/>
                  </w:rowCheckbox>
                </td>
                <td>
                  <b:write iterateId="id1" property="operatorid"/>
                </td>
                <td>
                  <b:write iterateId="id1" property="operatorname"/>
                </td>
                <td>
                  <b:write iterateId="id1" property="userid"/>
                </td>
                <td>
                  <d:write dictTypeId="ABF_AUTHMODE" iterateId="id1" property="authmode"/>
                </td>
                <td align="center">
                  <d:write dictTypeId="ABF_OPERSTATUS" iterateId="id1" property="status"/>
                </td>
              </tr>
            </l:iterate>
          </w:checkGroup>
          <tr>
            <td colspan="6" class="command_sort_area">
              <div style="float:left" >
              <input type="button" class="button" value='<b:message key="l_add"/>' onclick="addRecord();"><!-- 增加 -->
              <l:greaterThan property="page/size" targetValue="0" compareType="number">
                <input type="button" class="button" value='<b:message key="l_update"/>' onclick="updateRecord();" id="updateButton" disabled="true"><!-- 修改 -->
              </l:greaterThan>
              <l:greaterThan property="page/size" targetValue="0" compareType="number">
                <input type="button" class="button" value='<b:message key="l_delete"/>' onclick="deleteRecord();" id="deleteButton" disabled="true"><!-- 删除 -->
              </l:greaterThan>
              <l:greaterThan property="page/size" targetValue="0" compareType="number">
                <input type="button" class="button" style="width: 60" value='<b:message key="OperatorManager_l_reset_pwd"></b:message>' onclick="resetPwd();"><!-- 重置密码 -->
              </l:greaterThan>
              </div><div style="float:right" >
                <l:equal property="page/isCount" targetValue="true">
                  <b:message key="l_total"></b:message><!-- 共 -->
                  <b:write property="page/count"/>
                  <b:message key="l_recordNO."></b:message><!-- 条记录 第 -->
                  <b:write property="page/currentPage"/>
                  <b:message key="l_page"></b:message>/<!-- 页/ -->
                  <b:write property="page/totalPage"/>
                  <b:message key="l_page"></b:message><!-- 页 -->
                </l:equal>
                <l:equal property="page/isCount" targetValue="false">
                  <b:message key="l_NO."></b:message><!-- 第 -->
                  <b:write property="page/currentPage"/>
                  <b:message key="l_page"></b:message><!-- 页 -->
                </l:equal>
                <input type="button" class="button" onclick="firstPage('page', 'pageQuery', null, null, 'page_form');" value='<b:message key="l_firstPage"></b:message>'
                <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >  <!-- 首页 --> 
                <input type="button" class="button" onclick="prevPage('page', 'pageQuery', null, null, 'page_form');" value='<b:message key="l_upPage"></b:message>' 
                <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >  <!-- 上页 -->
                <input type="button" class="button" onclick="nextPage('page', 'pageQuery', null, null, 'page_form');" value='<b:message key="l_nextPage"></b:message>' 
                <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >   <!-- 下页 -->
                <l:equal property="page/isCount" targetValue="true">
                  <input type="button" class="button" onclick="lastPage('page', 'pageQuery', null, null, 'page_form');" value='<b:message key="l_lastPage"></b:message>' 
                  <l:equal property="page/isLast" targetValue="true">disabled</l:equal> > <!-- 尾页 -->
                </l:equal>
              </div>
            </td>
          </tr>
        </table>
    </h:form>
  </body>
</html>
