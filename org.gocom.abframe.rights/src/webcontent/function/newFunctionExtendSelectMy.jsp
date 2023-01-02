<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>选择功能</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
		   <form id="form1" method="post" style="width:100%">
			<div class="nui-toolbar" >
				<table style="width:100%;">
					<tr>
						<td align="right">功能名称：</td>
						<td>
							<input name="criteria._expr[0]._value" class="nui-textbox" style="width:100px;" />
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="funcname"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td>
						<td align="right">功能组名称：</td>
						<td>
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width:100px;"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="funcgroupname"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td>
						<td align="right">应用名称：</td>
						<td>
							<input name="criteria._expr[2]._value" class="nui-textbox" style="width:100px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="appname"/>
						   <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
					</tr>
	            </table> 
	             <table style="width:90%;">
		            <tr>
		                <td align="center" style="width:100%;">
		                    <a class="nui-button" iconCls="icon-search" id="search" onclick="search()" >查询</a>
							<a class="nui-button" iconCls="icon-reload" id="reset" onclick="reset()" >重置</a>
		                </td>
		            </tr>
	        	</table>          
	        </div>
	    </form>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:290px;"  pageSize="10" sizeList="[10,20,50,100,200]" showPager="true"
	    	url="org.gocom.abframe.rights.menu.OpershortcutManager.FunctionExtendSelectMy.biz.ext" dataField="functions"  allowSortColumn="true" multiSelect="false">
			<div property="columns">
				<div type="checkcolumn" width="10"></div>
				<div field="funcname" width="60" align="center"  headerAlign="center" allowSort="true" >功能名称</div>
				<div field="funcgroupname" width="60" align="center"  headerAlign="center" allowSort="true">功能组名称</div>
				<div field="appname" width="40" align="center"  headerAlign="center" allowSort="true">应用名称</div>
			</div>
	   </div>
	<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
	    <a class="nui-button" style="width:60px;" onclick="onOk()">确定</a>
	    <span style="display:inline-block;width:25px;"></span>
	    <a class="nui-button" style="width:60px;" onclick="onCancel()">取消</a>
  </div>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
    
    
    init();
	function init(){
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
	}
	
		
	function search(){
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
	}
	
	//重置
	function reset(){
		form.reset();
		grid.load();
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
    
    function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	function GetData() {
      	var row = grid.getSelected();
		return row;
    }
    
</script>
</body>
</html>