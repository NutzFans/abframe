<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@include file="/common.jsp"%>
<%--
- Author(s): 周维
- Date: 2008-08-27 15:37:15
- Description:
--%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>
      选择功能
    </title>
  </head>
  <body>
    <e:datasource name="criteria" type="entity" path="com.primeton.das.criteria.criteraiType" />
    <e:datasource name="page" type="entity" path="com.eos.foundation.PageCond" />
    <h:form name="query_form" action="org.gocom.abframe.rights.application.FunctionExtendSelect.flow" method="post" onsubmit="return checkForm(this);">
      <input type="hidden" name="_eosFlowAction" value="query"/>
        <table align="center" border="0" width="100%" class="form_table">
          <tr>
            <td class="form_label">
              功能名称：
            </td>
            <td colspan="3">
              <h:text property="criteria/_expr[3]/funcname"/>
              <h:hidden property="criteria/_expr[3]/_op" value="like"/>
              <h:hidden property="criteria/_expr[3]/_likeRule" value="all"/>
              <h:hidden property="criteria/_expr[4]/ismenu" value="y" />
            </td>
            <td class="form_label">
              功能组名称：
            </td>
            <td colspan="1">
              <h:text property="criteria/_expr[2]/funcgroupname"/>
              <h:hidden property="criteria/_expr[2]/_op" value="like"/>
              <h:hidden property="criteria/_expr[2]/_likeRule" value="all"/>
            </td>            
 
          </tr>
          <tr>
            <td class="form_label">
              应用名称：
            </td>
            <td colspan="1">
              <h:text property="criteria/_expr[1]/appname"/>
              <h:hidden property="criteria/_expr[1]/_op" value="like"/>
              <h:hidden property="criteria/_expr[1]/_likeRule" value="all"/>
            </td>
          </tr>
          <tr class="form_bottom">
            <td colspan="6" class="form_bottom">
              <input type="hidden" name="criteria/_entity" value="org.gocom.abframe.dataset.privilege.AcFunctionExtend">
              每页显示
              <h:text size="2" property="page/length" value="10" validateAttr="minValue=1;maxValue=100;type=integer;isNull=true" />
              <input type="hidden" name="page/begin" value="0">
              <input type="hidden" name="page/isCount" value="true">
              <input type="submit" class="button" value="查询">
              <input type="reset" class="button" value="重置">
            </td>
          </tr>
        </table>
      <h:hidden property="criteria/_orderby[1]/_sort" value="asc"/>
      <h:hidden property="criteria/_orderby[1]/_property" value="funccode"/>
      <h:hidden property="criteria/_orderby[2]/_sort" value="asc"/>
      <h:hidden property="criteria/_orderby[2]/_property" value="funcgroupname"/>
    </h:form>
    <h:form name="page_form" action="org.gocom.abframe.rights.application.FunctionExtendSelect.flow" method="post" onsubmit="return checkForm(this);">
      <input type="hidden" name="_eosFlowAction" value="query"/>
      <h:hiddendata property="criteria" />
      <h:hidden property="page/begin"/>
      <h:hidden property="page/length"/>
      <h:hidden property="page/count"/>
        <table align="center" border="0" width="100%" class="EOS_table">
          <tr>
	         <td colspan="6" class="eos-panel-title">&nbsp;&nbsp;功能列表</td>
	      </tr>
          <tr>
            <th align="center">
              选择
            </th>
			<th>
              功能名称
            </th>
            <th>
              功能组名称
            </th>
            <th>
              应用名称
            </th>            
            
            <th>
              功能调用入口
            </th>
          </tr>
          <w:radioGroup id="group1">
            <l:iterate property="functions" id="id1">
              <tr class="<l:output evenOutput='EOS_table_row' />">
                <td align="center">
                  <w:rowRadio>
                    <h:param name='funccode' iterateId='id1' property='funccode'/>
                    <h:param name='funcname' iterateId='id1' property='funcname'/>
                    <h:param name='funcaction' iterateId='id1' property='funcaction'/>
                    <h:param name='appid' iterateId='id1' property='appid'/>
                    <h:param name='appname' iterateId='id1' property='appname'/>
                    <h:param name='funcgroupid' iterateId='id1' property='funcgroupid'/>
                    <h:param name='funcgroupname' iterateId='id1' property='funcgroupname'/>
                    <h:param name='funcurl' iterateId='id1' property='funcurl'/>
                  </w:rowRadio>
                </td>
                <td>
                  <b:write iterateId="id1" property="funcname"/>
                </td>
                <td>
                  <b:write iterateId="id1" property="funcgroupname"/>
                </td>
                <td>
                  <b:write iterateId="id1" property="appname"/>
                </td>                                

                <td>
                  <b:write iterateId="id1" property="funcaction"/>
                </td>
              </tr>
            </l:iterate>
          </w:radioGroup>
          <tr>
            <td colspan="7" class="command_sort_area">
             <div style="float:left">
              <l:greaterThan property="page/size" targetValue="0" compareType="number">
                <input type="button" class="button" value="选择" onclick="selectRecord();">
              </l:greaterThan>
              <input type="button" class="button" value="取消选择值" onclick="unSelectRecord();">
              <input type="button" class="button" value="关闭" onclick="window.close();">
            </div><div style="float:right" >
                <l:equal property="page/isCount" targetValue="true">
                  共
                  <b:write property="page/count"/>
                  条记录 第
                  <b:write property="page/currentPage"/>
                  页/
                  <b:write property="page/totalPage"/>
                  页
                </l:equal>
                <l:equal property="page/isCount" targetValue="false">
                  第
                  <b:write property="page/currentPage"/>
                  页
                </l:equal>
                <input type="button" class="button" onclick="firstPage('page', 'query', null, null, 'page_form');" value="首页"  <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
                <input type="button" class="button" onclick="prevPage('page', 'query', null, null, 'page_form');" value="上页" <l:equal property="page/isFirst" targetValue="true">disabled</l:equal> >
                <input type="button" class="button" onclick="nextPage('page', 'query', null, null, 'page_form');" value="下页" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
                <l:equal property="page/isCount" targetValue="true">
                  <input type="button" class="button" onclick="lastPage('page', 'query', null, null, 'page_form');" value="尾页" <l:equal property="page/isLast" targetValue="true">disabled</l:equal> >
                </l:equal>
              </div>
            </td>
          </tr>
        </table>
    </h:form>
    <script>
      window.resize(700, 440);
      window.moveCenter();
      function selectRecord()
      {
        var g = $id("group1");
        if (g.getSelectRow() == null) {
          alert("请选择一行记录");
          return;
        }
        var ret = new Array;
        
        ret[0] = g.getParam("funccode");
        ret[1] = g.getParam("funcname");
        ret[2] = g.getParam("funcurl");
        ret[3] = g.getParam("appid");        
        ret[4] = g.getParam("appname");
        ret[5] = g.getParam("funcgroupid");
        ret[6] = g.getParam("funcgroupname");
        if(ret[0] == "null") {
        	ret[0]=""
        }
        if(ret[1] == "null") {
        	ret[1]=""
        }
        if(ret[2] == "null") {
        	ret[2]=""
        }
        if(ret[3] == "null") {
        	ret[3]=""
        }
        if(ret[4] == "null") {
        	ret[4]=""
        }
        if(ret[5] == "null") {
        	ret[5]=""
        }
        if(ret[6] == "null") {
        	ret[6]=""
        }
        window.returnValue = ret;
        window.close();
      }

      function unSelectRecord()
      {
        var ret = new Array;
        ret[0] = "";
        ret[1] = "";
        ret[2] = "";
        ret[3] = "";
        window.returnValue = ret;
        window.close();
      }
     </script>
  </body>
</html>
