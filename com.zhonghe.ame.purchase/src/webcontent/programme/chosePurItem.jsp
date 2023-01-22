<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp" %>
<html>
<head>
	<title>零星采购</title>
	<style type="text/css">
		body {margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;}
	</style>
	</head>
	<body>
		<div id="form1">
		<input class="nui-hidden" name="critria._entity" value="com.zhonghe.ame.purchase.restData.queryzh_materials_master_data" />
		<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
			<table align="center" border="0" width="100%" class="form_table">
				<tr>
					<td class="form_label" align="right" style="width: 3%">类别名称:</td>
			        <td colspan="1" style="width: 7%">
			            <input name="critria._expr[1]._value" class="nui-textbox" style="width: 200px;" />
			            <input class="nui-hidden" name="critria._expr[1]._property" value="categoryname" />
			            <input class="nui-hidden" name="critria._expr[1]._op" value="like" />
			        </td>
			        
			        <td class="form_label" align="right" style="width: 3%">长描述:</td>
			        <td colspan="1" style="width: 7%">
			            <input name="critria._expr[2]._value" class="nui-textbox" style="width: 200px;" />
			            <input class="nui-hidden" name="critria._expr[2]._property" value="desclong" />
			            <input class="nui-hidden" name="critria._expr[2]._op" value="like" />
			        </td>
				</tr>
			</table>
		</div>
	</div>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		<table style="width:100%;">
        	<tr>
		        <td   align="center">
		            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
		            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		        </td>
            </tr>
        </table>           
    </div>
	<div class="nui-fit">
		<div id="datagrid1" sizeList="[10,20,50,100]" showPager="true" dataField="data" sortMode="client"
			class="nui-datagrid" style="width: 100%; height: 100%;"
			url="com.zhonghe.ame.purchase.purchaseItems.queryPurItemAll.biz.ext" >
				<div property="columns">
					<div name="temp123" type="checkcolumn"></div>
					<div type="indexcolumn" width="50" align="center"
						headerAlign="center">序号</div>
					<!-- <div type="expandcolumn" width="20"></div> -->
					<div field="categorycode" width="70" align="center"
						headerAlign="center" allowSort="true">物项代码</div>
					<div field="categoryname" width="110" align="center"
						headerAlign="center" allowSort="true">类别名称</div>
					<div field="code" width="70" align="center" headerAlign="center"
						allowSort="true">物资编码</div>
					<div field="desclong" width="200" align="center"
						headerAlign="center" allowSort="true">长描述</div>
					<div field="descshort" width="200" align="center"
						headerAlign="center" allowSort="true">短描述</div>
					<div field="desc10" width="65" align="center" headerAlign="center"
						allowSort="true">单位编码</div>
					<div field="desc11" width="65" align="center" headerAlign="center"
						allowSort="true">单位名称</div>
					<div field="desc20" width="45" align="center" headerAlign="center">状态</div>
				</div>
			</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">确定</a>
			<a class="nui-button" onclick="onCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
		</div>
	</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
	<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
	<input type="hidden" name="downloadFile" filter="false"/>
	<input type="hidden" name="fileName" filter="false"/>
</form>
	<script type="text/javascript">
			nui.parse();
			var form = new nui.Form("#form1");
			var grid = nui.get("datagrid1");
			search();
			function doView(id) {
				var executeUrl = "<%= request.getContextPath() %>/purchase/purzero/zeroPrintAll.jsp?id=" + id;
				window.open(executeUrl);
			}

			function search() {
				var form = new nui.Form("#form1");
				var data = form.getData(); //获取表单JS对象数据
				grid.load(data); //datagrid加载数据
			}

			function reset() {
				var form = new nui.Form("#form1");
				form.reset();
				search();
			}

		function onCancel(e) {
            CloseWindow("cancel");
        }
        //标准方法接口定义
        function CloseWindow(action) {           
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
		function onOk(){
			var row = grid.getSelected();
            CloseWindow("ok"); 
		}
		
		 function CloseWindow(action) {
    	      
		    if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		    else window.close();            
		}
		function GetData() {
	        var row = grid.getSelected();
	        return row;
    	}
    	function onActionRenderer(e) {
				var record = e.record;
				var processId = record.processid;
				console.log(e.value);
				var s = "<a  href='javascript:void(0)' onclick='feeView();' >" + nui.getDictText('ZH_FLOW_TYPE', e.value) +
					"</a>";
				return s;
			}
	</script>
</body>
</html>