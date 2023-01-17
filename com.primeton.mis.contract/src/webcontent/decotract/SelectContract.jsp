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
    	<input class="nui-hidden" name="sortField" value="contractid"/>
		<input class="nui-hidden" name="sortOrder" value="desc"/>
      <table style="width:100%;" class="table">
        <tr>
          <td class="tit">
            合同存档编号:
          </td>
          <td align="left">
            <input class="nui-textbox " onEnter='onKeyEnter' name="criteria._expr[1].contnum"/>
            <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
            <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
          </td>
          <td >
            <a class="nui-button" iconCls="icon-search" onclick="search">
              查询
            </a>
          </td>
        </tr>
      </table>
      <input class="nui-hidden" name="criteria._entity" value="com.primeton.mis.contract.contract.CsContract"/>
    </div>
  </div>
  <div class="nui-fit">
    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:100%;" idField="custid" url="com.primeton.mis.contract.contract.queryContract.biz.ext" dataField="contracts" sizeList=[5,10,20,50,100] multiSelect="false" pageSize="10"   >
      <div property="columns" >
        <div type="checkcolumn">
        </div>
        <div field="contnum" width="73" renderer="onTitleRenderer" headerAlign="center" allowSort="true">合同存档编号</div>
	        <div field="contreg" width="70" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">登记日期</div>
	        <div field="custname" width="160" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true">签署单位</div>
	        <div field="contsum" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">总金额（元）</div>
	         <div field="gathermon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">已收款金额（元）</div>
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
    search();

    function search(){
      var form = new nui.Form("#form1");
      var data = form.getData(true,true);
      grid.load(data);
    }

    function GetData() {
      var row = grid.getSelected();
		return row;
    }


    function onKeyEnter(e) {
      search();
    }
    //////////////////////////////////
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
