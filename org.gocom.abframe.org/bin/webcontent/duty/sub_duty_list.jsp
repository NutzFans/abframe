<%@page pageEncoding="UTF-8"%>
<%@include file="/common.jsp"%>

<html>
<head>
<title></title>

<%
    //职务查询条件
	String duty_query_cond = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_title_duty")
	                       + com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_query_cond");
	//职务查询结果                      
	String duty_list_result = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("dutyManager_l_title_duty")
                           + com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_query_result");
 %>

<script>
     /* 
      * 模态窗口回调函数，关闭模态窗口时，刷新父窗口的数据
      */
    function callBack() {
        refreshTreeNode(parent.parent.tree1);//刷新左边的树
        parent.parent.tree1.getSelectNode().cell.click();       
    }
    
     /* 
      *  增加子职务
      */
    function addRecord() {
        var url = "org.gocom.abframe.org.duty.DutyMain.flow";
        url += "?_eosFlowAction=insert";
        url += "&parentDutyID=";
        url += '<b:write property="parentDutyID" scope="flow"/>';
        url += "&parentDutytype=";
        url += '<b:write property="parentDutytype" scope="flow"/>'
        url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
	    showModalCenter(url, "", callBack, 450,190, '<b:message key="dutyManager_l_title_addDuty"/>');
    }
    
     /* 
      *  删除子职位
      */
     function deleteRecord() {
         var g = $id("group1");
         var frm = $name("query_form");
         if( g.getSelectLength() < 1 ) {
              alert( '<b:message key="l_m_alert_mustSelectOneOrMore"/>' );  //必须至少选择一行
              return;
         }
          
         if( !confirm('<b:message key="dutyManager_l_m_alert_confirmDeleteDuty"/>') ) {   //确认删除选中的职务吗？
             return;
         }
          
         var myAjax = new Ajax("org.gocom.abframe.org.duty.DutyManager.deleteDutys.biz");
         var id =  g.getSelectParams("select_objs/dutyid");
          
         if( id != null && id != "" && id.length > 0 ) {
             for(var i = 0 ; i < id.length; i++) {
                 myAjax.addParam("dutys[" + (i+1) + "]/dutyid", id[i] );
             }
             myAjax.submit();
	         var returnNode = myAjax.getResponseXMLDom();
	         if( returnNode ) {
	            if( myAjax.getValue("root/data/retCode") == 1 ) {
	                alert( '<b:message key="l_m_delete_success"/>' );  //删除成功
	                //refreshTreeNode(parent.parent.tree1);//刷新左边的树
	                callBack();
	            } else {
	                alert( '<b:message key="l_m_delete_fail"/>' );     //删除失败
	            }
	         } else {
	            alert( '<b:message key="l_m_delete_fail"/>' );         //删除失败
	         }
             
         }       
         
     }
     
     function refreshTreeNode(tree){
     	try{
     		tree.getSelectNode().reloadChild();
     	}catch(e){
     		//alert(e);
     	}
     }
     
     /* 
      *  更新子职位
      */
     function updateRecord() {
         var g = $id("group1");
         var frm = $name("form1");
         if( g.getSelectLength() != 1 ) {
              alert('<b:message key="l_m_alert_mustAdnOnlySelectOne"/>');  //必须且只能选择一行 
              return;
         }
         var dutyid = g.getSelectParams("select_objs/dutyid");
         
         var url = "org.gocom.abframe.org.duty.DutyMain.flow";
         url += "?_eosFlowAction=update";
         url += "&duty/dutyid=" + dutyid;
         url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数
         showModalCenter(url, "", callBack, 450, 190, '<b:message key="dutyManager_l_title_updateDuty"/>');
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
<body topmargin="0" leftmargin="0">
    <e:datasource name="criteria" type="entity" path="com.primeton.das.criteria.criteraiType" />
    <h:form name="query_form" action="org.gocom.abframe.org.duty.DutyMain.flow" method="post">
      <input type="hidden" name="_eosFlowAction" value="pageQuery"/>
      <h:hidden property="parentDutyID" scope="flow"/>
      <h:hidden property="parentDutytype" scope="flow"/>
      <h:hidden name="criteria/_entity" value="org.gocom.abframe.dataset.organization.OmDuty"/>
      <h:hidden name="criteria/_expr[2]/omDuty.dutyid" property="parentDutyID" scope="flow"/>
       
      <w:panel id="panel1" width="100%" title="<%=duty_query_cond %>">
        <table align="center" border="0" width="100%" class="form_table">
          <tr>
            <td class="form_label">  <!-- 职务名称 -->
              <b:message key="dutyManager_omDuty.dutyname"></b:message><b:message key="l_colon"></b:message>
            </td>
            <td >
                <h:text property="criteria/_expr[1]/dutyname"/>
                <h:hidden property="criteria/_expr[1]/_op" value="like"/>
                <h:hidden property="criteria/_expr[1]/_likeRule" value="all"/>
            </td>
          </tr>
          <tr class="form_bottom">
            <td colspan="6" class="form_bottom">
               <b:message key="l_pageDisplay"></b:message>
              <h:text size="2" property="page/length" value="10" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
              <input type="hidden" name="page/begin" value="0">
              <input type="hidden" name="page/isCount" value="true">
              <input type="submit" class="button" value='<b:message key="l_query"></b:message>'>&nbsp;
              <input type="button" class="button" value='<b:message key="l_reset"></b:message>' onclick="javascript:$name('query_form').reset();">
            </td>
          </tr>
        </table>
      </w:panel>
    </h:form>
    
    <h:form name="form1" action="org.gocom.abframe.org.duty.DutyMain.flow" method="post">
        <input type="hidden" name="_eosFlowAction" value="insert"/>        
        <table align="center" border="0" width="100%" class="EOS_table">
            <h:hidden property="parentDutyID" name="parentDutyID" scope="flow"/>
            <h:hidden property="parentDutytype" name="parentDutytype" scope="flow"/>
            
            <h:hidden property="page/length"/>
            <h:hidden property="page/begin"/>
            <h:hidden property="page/isCount"/>
            <h:hidden property="page/count"/>
            
            <h:hidden name="criteria/_entity" value="org.gocom.abframe.dataset.organization.OmDuty"/>
            <h:hidden name="criteria/_expr[1]/omDuty.dutyid" property="parentDutyID" scope="flow"/>
            <h:hidden name="criteria/_expr[2]/dutytype" property="parentDutytype" scope="flow"/>
          <tr>
	       <td colspan="4" class="eos-panel-title">&nbsp;<%=duty_list_result %></td>
	      </tr>  
          <tr>
            <th align="center">
            <l:greaterThan property="page/size" targetValue="0" compareType="number">
              <input type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll();"> 
              </l:greaterThan>
               <b:message key="l_select"></b:message>
            </th>
             <th>   <!-- 职务代码 -->
              <b:message key="dutyManager_omDuty.dutycode"></b:message>
            </th> 
            <th>    <!-- 职务名称 -->
              <b:message key="dutyManager_omDuty.dutyname"></b:message>
            </th>
           
          </tr>
          <w:checkGroup id="group1">
          <l:iterate property="subDuty" id="id1">
              <tr class="<l:output evenOutput='EOS_table_row' />">
                <td align="center">
                    <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))">
                        <h:param name='select_objs/dutyid' iterateId='id1' property='dutyid' indexed="true"/>
                    </w:rowCheckbox>
                </td>
                <td>
                  <b:write iterateId="id1" property="dutycode"/>
                </td>
                <td>
                  <b:write iterateId="id1" property="dutyname"/>
                </td>
                </tr>
            </l:iterate>
            </w:checkGroup>
            <tr>
              <td colspan="5" class="command_sort_area">
              <div style="float: left">
                <input type="button" class="button" value='<b:message key="l_add"/>' onclick="addRecord();">
                <l:greaterThan property="page/size" targetValue="0" compareType="number">
                   <input type="button" class="button" value='<b:message key="l_update"/>' onclick="updateRecord();" id="updateButton" disabled="true">
                </l:greaterThan>
                <l:greaterThan property="page/size" targetValue="0" compareType="number">
                   <input type="button" class="button" value='<b:message key="l_delete"/>' onclick="deleteRecord();" id="deleteButton" disabled="true">
                </l:greaterThan>
                </div>
                <div style="float: right">
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
                <input type="button" class="button" onclick="firstPage('page', 'pageQuery', null, null, 'form1');" value='<b:message key="l_firstPage"></b:message>'  <l:equal property="page/isFirst"  targetValue="true">disabled</l:equal> >
                <input type="button" class="button" onclick="prevPage('page', 'pageQuery', null, null, 'form1');" value='<b:message key="l_upPage"></b:message>' <l:equal property="page/isFirst"  targetValue="true">disabled</l:equal> >
                <input type="button" class="button" onclick="nextPage('page', 'pageQuery', null, null, 'form1');" value='<b:message key="l_nextPage"></b:message>' <l:equal property="page/isLast"  targetValue="true">disabled</l:equal> >
                <l:equal property="page/isCount" targetValue="true">
                  <input type="button" class="button" onclick="lastPage('page', 'pageQuery', null, null, 'form1');" value='<b:message key="l_lastPage"></b:message>' <l:equal property="page/isLast"  targetValue="true">disabled</l:equal> >
                </l:equal>
              </div>
              </td>
            </tr>
      </table>
    </h:form>  
</body>
</html>
