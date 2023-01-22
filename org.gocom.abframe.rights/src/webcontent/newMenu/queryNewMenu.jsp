	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-20 11:06:02
  - Description:
-->
<head>
	<title>菜单查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div class="nui-panel" title="菜单查询" style="width:100%;">
   <form id="form1" method="post" style="width:100%">
	<div class="nui-toolbar" >
		<table style="width:100%;">
			<tr>
				<td align="right">菜单编号：</td>
				<td>
					<input name="criteria._expr[0]._value" class="nui-textbox" style="width:150px;" />
				    <input class="nui-hidden" name="criteria._expr[0]._property" value="menuid"/>
				    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
				    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				</td>
				<td align="right">菜单层次：</td>
				<td>
					<input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;"/>
				    <input class="nui-hidden" name="criteria._expr[1]._property" value="menulevel"/>
				    <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
				</td>
			</tr>
			<tr>
				<td align="right">菜单显示名称：</td>
				<td>
					<input name="criteria._expr[2]._value" class="nui-textbox" style="width:150px;"/>
				    <input class="nui-hidden" name="criteria._expr[2]._property" value="menulabel"/>
				   <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
				    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
				</td>
				<td align="right">菜单名称：</td>
				<td>
					<input name="criteria._expr[3]._value" class="nui-textbox" style="width:150px;"/>
				    <input class="nui-hidden" name="criteria._expr[3]._property" value="menuname"/>
				   <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
				    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
				</td>
				<td align="right">菜单描述：</td>
				<td>
					<input name="criteria._expr[4]._value" class="nui-textbox" style="width:150px;"/>
				    <input class="nui-hidden" name="criteria._expr[4]._property" value="menudesc"/>
				   <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
				    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
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
    	url="org.gocom.abframe.rights.menu.newMenu.queryNewM.biz.ext" dataField="menuList"  allowSortColumn="true" multiSelect="true">
		<div property="columns">
			<div field="menulabel" width="100" align="center"  headerAlign="center" allowSort="true" >菜单显示名称</div>
			<div field="menuname" width="100" align="center"  headerAlign="center" allowSort="true">菜单名称</div>
			<div field="menucode" width="80" align="center"  headerAlign="center" allowSort="true">菜单代码</div>
			<div field="isleaf" width="40" align="center"  headerAlign="center" allowSort="true" renderer="getIsleaf">是否叶子菜单</div>
			<div field="menulevel" width="40" align="center"  headerAlign="center" allowSort="true">菜单层次</div>
			<div field="menudesc" width="240" align="center"  headerAlign="center" allowSort="true">菜单描述</div>
		</div>
   </div>
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
	
	function getIsleaf(e){
		return nui.getDictText('ABF_YESORNO',e.value);
	}
	
	//重置
	function reset(){
		form.reset();
		grid.load();
	}
	
</script>
</body>
</html>