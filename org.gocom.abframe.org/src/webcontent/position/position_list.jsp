<%@page pageEncoding="UTF-8"%>
<%
	//岗位查询结果
	String posi_query_result = com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("positionManager_l_title_position")
	                         + com.eos.foundation.eoscommon.ResourcesMessageUtil.getI18nResourceMessage("l_query_result");
%>
<html>
<head>
<title></title>
<%@include file="/common.jsp"%>
<script>
     /*  
      *  模态窗口回调函数，关闭模态窗口时，刷新列表数据，刷新父窗口的树
      */
    function callBack(flag) {
       if(flag==true){
          parent.parent.window.$id("orgTree").getSelectNode().reloadChild();
          var frm = $name("data_form");
          frm.elements["_eosFlowAction"].value = "pageQuery";
          frm.submit();
        }
    }
    
     /*  
      *  增加子岗位
      */
     function addRecord() {           
         var url = 'org.gocom.abframe.org.position.PositionMaintain.flow?_eosFlowAction=baseinfo'
                 +'&position/positype=<b:write property="position/positype"/>';
         if(""!='<b:write property="position/omOrganization/orgid"/>')
              url+='&position/omOrganization/orgid=<b:write property="position/omOrganization/orgid"/>'
         if(""!='<b:write property="position/positionid"/>')        
              url+='&position/omPosition/positionid=<b:write property="position/positionid"/>'
         
         url=url+'&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数,并且作为判断是否弹出窗口的标志
	     showModalCenter(url, window, callBack, 500, 190, '<b:message key="positionManager_l_title_addPosition"/>');  //增加子岗位
     }
     
     /*  
      *  删除子岗位
      */ 
     function deleteRecord() {
         var g = $id("group1");
         var frm = $name("query_form");
         if( g.getSelectLength() < 1 ) {
              alert( '<b:message key="l_m_alert_mustSelectOneOrMore"/>' );  //必须至少选择一行 
              return;
         }
         if( !confirm( '<b:message key="positionManager_l_m_alert_confirmDeletePosi"/>' ) ) {  //您确定删除选择中的岗位 
             return;
         }
          
         var myAjax = new Ajax("org.gocom.abframe.org.position.PositionManager.deletePositions.biz");
         var id =  g.getSelectParams("select_objs/positionid");
         //删除可以多选，返回的是数组
         if( id != null && id != "" && id.length > 0 ) {
             for(var i = 0 ; i < id.length; i++) {
                 myAjax.addParam("pos[" + (i+1) + "]/positionid", id[i] );
             }
             myAjax.submit();
	         var returnNode = myAjax.getResponseXMLDom();
	         if( returnNode ) {
	            if( myAjax.getValue("root/data/retCode") == 1 ) {
	                alert( '<b:message key="l_m_delete_success"/>' );  //删除成功 
	                callBack(true);
	            } else { 
	                alert( '<b:message key="l_m_delete_fail"/>' );     //删除失败 
	            }
	         } else {
	            alert( '<b:message key="l_m_delete_fail"/>' );         //删除失败 
	         }
             
         }
          
         //删除记录后，重新刷新页面
         frm.submit();
     }
     /*  
      *  修改岗位
      */
     function updateRecord() {
         var g = $id("group1");
         var frm = $name("data_form");
         if( g.getSelectLength() != 1 ) {
              alert('<b:message key="l_m_alert_mustAdnOnlySelectOne"/>');  //必须且只能选择一行 
              return;
         }
         //取单个id的值
         var positionid = g.getSelectParams("select_objs/positionid");
         
         var url = "org.gocom.abframe.org.position.PositionMaintain.flow";
         url += "?_eosFlowAction=baseinfo";
         url += "&position/positionid=" + positionid;
         url += '&_ts='+(new Date()).getTime();   //防止IE缓存，在每次打开时加个时间差的参数,并且作为判断是否弹出窗口的标志
         showModalCenter(url, "", callBack, 500, 190, '<b:message key="positionManager_l_title_updatePosition"/>');  //修改岗位
     }
    
</script>

</head>
<body topmargin="0" leftmargin="0" >
    <h:form name="data_form" action="org.gocom.abframe.org.position.PositionMaintain.flow" method="post">
            <h:hidden name="_eosFlowAction" value="pageQuery"/>            
            <h:hiddendata property="position"/>
            <h:hiddendata property="criteria"/>
            <h:hiddendata property="page"/>
           <table align="center" border="0" width="100%" class="EOS_table">
           <tr>
		       <td colspan="5" class="eos-panel-title">&nbsp;<%=posi_query_result %></td>
		      </tr>
           <tr>
	            <th align="center">
	              <l:greaterThan property="page/size" targetValue="0" compareType="number">
	                  <input  type="checkbox" id="checkSelect" name="checkSelect" onclick="checkSelectAll('checkSelect','group1');"> 
	              </l:greaterThan>
	              <b:message key="l_select"></b:message>
	            </th>
	            <th>   <!-- 岗位名称 -->
	              <b:message key="positionManager_OmPosition.posiname"></b:message>
	            </th>
	            <th> <!--  岗位代码 -->
	              <b:message key="positionManager_OmPosition.posicode"></b:message>
	            </th>	            
	            <th>   <!-- 所属机构 -->
	              <b:message key="positionManager_OmPosition.omOrganization.orgid(orgname)"></b:message>
	            </th>
	            <th>   <!-- 所属职务 -->
	              <b:message key="positionManager_OmPosition.omDuty.dutyid(dutyname)"></b:message>
	            </th>
	          </tr>
          <w:checkGroup id="group1">
          <l:iterate property="posList" id="id1">
              <tr class="<l:output evenOutput='EOS_table_row' />">
                <td align="center">
                    <w:rowCheckbox afterSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))" afterUnSelectFunc="clickCheck($id('group1'), $id('updateButton'), $id('deleteButton'))">
                        <h:param name='select_objs/positionid' iterateId='id1' property='positionid'/>
                    </w:rowCheckbox>
                </td>                
                <td>  <!--  岗位名称 -->
                  <b:write iterateId="id1" property="posiname"/>
                </td>
                <td>  <!--  岗位代码 -->
                  <b:write iterateId="id1" property="posicode"/>
                </td>
                <td>  <!-- 所属机构 -->
                  <b:write iterateId="id1" property="omOrganization/orgname"/>
                </td>
                <td>  <!--  所属职务 -->
                  <b:write iterateId="id1" property="omDuty/dutyname"/>
                </td>
                </tr>
            </l:iterate>
            </w:checkGroup>
            <tr>
              <td colspan="5" class="command_sort_area">
                <div style="float:left">
                <input type="button" class="button" style='margin-top:2' value='<b:message key="l_add"/>' onclick="addRecord();" >
                <l:greaterThan property="page/size" targetValue="0" compareType="number" >
                   <input type="button" class="button" value='<b:message key="l_update"/>' onclick="updateRecord();"  id="updateButton" disabled="true">
                </l:greaterThan>
                <l:greaterThan property="page/size" targetValue="0" compareType="number">
                   <input type="button" class="button" value='<b:message key="l_delete"/>' onclick="deleteRecord();" id="deleteButton" disabled="true">
                </l:greaterThan>
                </div>
          <div style="float:right">
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
                
                <input type="button" class="button" onclick="firstPage('page', 'pageQuery', null, null, 'data_form');" value='<b:message key="l_firstPage"></b:message>'  <l:equal property="page/isFirst"  targetValue="true">disabled</l:equal> >
                <input type="button" class="button" onclick="prevPage('page', 'pageQuery', null, null, 'data_form');" value='<b:message key="l_upPage"></b:message>' <l:equal property="page/isFirst"  targetValue="true">disabled</l:equal> >
                <input type="button" class="button" onclick="nextPage('page', 'pageQuery', null, null, 'data_form');" value='<b:message key="l_nextPage"></b:message>' <l:equal property="page/isLast"  targetValue="true">disabled</l:equal> >
                <l:equal property="page/isCount" targetValue="true">
                  <input type="button" class="button" onclick="lastPage('page', 'pageQuery', null, null, 'data_form');" value='<b:message key="l_lastPage"></b:message>' <l:equal property="page/isLast"  targetValue="true">disabled</l:equal> >
                </l:equal>
              </div>
              </td>
            </tr>
            </table>
          </h:form> 
     </body>
</html>