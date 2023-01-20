<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2018-12-20 16:59:41
  - Description:
-->
<head>
	<title>选择人员级别</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }
    </style>
</head>
<body>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;line-height:30px;" id="form1">
    	<table style="width:100%;">
    		<tr>
		    	<td>所属部门：</td>
		      	<td>
			      	<input class="nui-textbox" name="criteria._expr[0].orgname" onenter="onKeyEnter" style = "width :80px;"/>
			        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
			        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
		        </td>
		      	 <td>级别名称：</td>
		      	<td>
			      	<input class="nui-textbox" name="criteria._expr[1].degreename" onenter="onKeyEnter" style = "width :80px;"/>
			        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
			        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
		        </td>
		        <td>定额成本套别：</td>
		      	<td>
			      	<input class="nui-combobox" name="criteria._expr[2].percostid" textField="percostname" valueField="percostid" dataField ="percosts" url="com.primeton.rdmgr.labor.mispricebiz.queryPercost.biz.ext" shownullItem="true" onenter="onKeyEnter" style = "width :160px;"/>
			        <input class="nui-hidden" name="criteria._expr[2]._op" value="="/>
		        </td>
	        	<td>
		      		<a class="nui-button" style="width:60px;" onclick="search()">查询</a>
		      	</td>
	      	</tr>
      	</table>
    </div>
    
    <div id="grid1" class="nui-datagrid" style="width:100%;height:300px;" showPager="true"  dataField="percost"  allowCellSelect="true" 
		sizeList="[10,20,50,100,500]" onrowdblclick="onRowDblClick"
		url="com.primeton.rdmgr.labor.mispricebiz.queryMisprice.biz.ext">
         <div property="columns"> 
         	<div type="checkcolumn"></div>
         	<div field="percostname" width="140" headerAlign="center">成本套别</div>
         	<div field="pricetype" displayField="orgname"width="120" headerAlign="center">所属部门 </div>
         	<div field="degree" width="100" align="center" headerAlign="center">服务人员级别代码</div>
            <div field="degreename" width="100" align="center" headerAlign="center">服务人员级别</div>
         </div>
    </div>
     <div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="onCancel()">关闭</a>
    </div>
</body>

<script type="text/javascript">
	nui.parse();
	var url="com.primeton.rdmgr.labor.mispricebiz.queryMisprice.biz.ext"
	var grid = nui.get("grid1");
	grid.setUrl(url);
	var form = new nui.Form("#form1");
	var data = form.getData();
	grid.load(data);
	
	function search() {
		var data = form.getData();
		grid.load(data);
	}
	 
	function GetData() {
		var row = grid.getSelected();
		return row;
	}
	 
	function onKeyEnter(e) {
		search();
	}
	    
	function onRowDblClick(e) {
		onOk();
	}

	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	function onOk() {
		CloseWindow("ok");
	}
	
	function onCancel() {
		CloseWindow("cancel");
	}
</script>
</html>