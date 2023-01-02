<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=contextPath%>/coframe/tools/skins/skin1/style.css" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>员工面板</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    </style>
</head>
<body> 
  <div class="nui-toolbar" style="text-align:center;line-height:30px;" borderStyle="border:0;">
    <div id="form1">
    	<input class="nui-hidden" name="sortField" value="servid"/>
		<input class="nui-hidden" name="sortOrder" value="desc"/>
    		<table style="width:100%;">
				<tr>
	            	<td><span>服务编号：</span></td>
	            	<td>
	            		<input class="nui-textbox" name="criteria._expr[0].servnum" onEnter='onKeyEnter'/>
				        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				        <input class="nui-hidden" name="criteria._expr[3].contractid" id="contractid" />
				        <input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
				    </td>
	            	<td><span>合同编号：</span></td>
	            	<td>
	            		<input class="nui-textbox" name="criteria._expr[1].contnum" id="contnum"/>
				        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
				    </td>
	            	<td><span>销售姓名：</span></td>
	            	<td>
	            		<input class="nui-textbox" name="criteria._expr[2].salesname"/>
				        <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
				        <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
				    </td>
				</tr>
				<tr><td align="center" colspan="6"><a class="nui-button" iconCls="icon-search" onclick="search()">查找</a></td></tr>
		    </table>
      <input class="nui-hidden" name="criteria._entity" value="com.primeton.mis.contract.contract.QueryCsServinfo"/>
    </div>
  </div>
  <div class="nui-fit">
    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%;" url="com.primeton.mis.contract.contract.queryServinfos.biz.ext" 
    	dataField="servinfos" sizeList=[5,10,20,50,100] multiSelect="false" pageSize="10"   >
      <div property="columns" >
        <div type="checkcolumn"></div>
        <div field="servnum" width="100" allowSort="true" headerAlign="center" >服务编号</div>
        <div field="contnum" width="75" allowSort="true" headerAlign="center" >合同编号</div>
        <div field="salename" width="60" allowSort="true" headerAlign="center" >所属销售姓名</div>
        <div field="custname" width="180" headerAlign="center" allowSort="true">合作伙伴</div>
        <div field="startdate" dateFormat="yyyy-MM-dd" align="left" width="80" headerAlign="center" allowSort="true">服务开始日期</div>
        <div field="overdate" dateFormat="yyyy-MM-dd" align="left" width="80" headerAlign="center" allowSort="true">服务截止日期</div>
        <div field="closedate" dateFormat="yyyy-MM-dd" align="left" width="80" headerAlign="center" allowSort="true">标准截止日期</div>
      </div>
    </div>
  </div>
  <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
    <a class="nui-button" style="width:60px;" onclick="onOk()">
      确定
    </a>
    <span style="display:inline-block;width:25px;">
    </span>
    <a class="nui-button" style="width:60px;" onclick="onCancel()">
      取消
    </a>
  </div>
  <script type="text/javascript">
    nui.parse();
    var grid = nui.get("datagrid1");
    
    function SetData(data){
    	var cscontract = data.cscontract;
    	nui.get("contnum").setValue(cscontract.contnum);
		nui.get("contractid").setValue(cscontract.contractid);
   	 	search();
    }
    function search(){
      var form = new nui.Form("#form1");
      var data = form.getData(true,true);
      grid.load(data);
    }
    function GetData() {
      var row = grid.getSelected();
      var data = {};
      data.servid = row.servid;
      data.servnum = row.servnum;
      return data;
    }
    function onKeyEnter(e) {
      search();
    }
    function CloseWindow(action) {
      if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
      else window.close();
    }
    function onOk() {
      var row = grid.getSelected();
      if (!row) {
        alert("请选中一条记录");
        return;
      }
      CloseWindow("ok");
    }
    function onCancel() {
      CloseWindow("cancel");
    }
  </script>
</body>
</html>
