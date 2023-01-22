<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp" %>
<html>
<head>
<title>选择采购立项</title>
		<style type="text/css">
			html, body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }  
    </style>

</head>
<body >
<div id="layout1" class="mini-layout" style="width:100%;height: 100%">
    <div region="north" height="40px" style="" showSplitIcon="false" showHeader="false">
       <div id="form1" >
        <table align="center" border="0" width="100%" class="form_table">
					<tr>
						<td class="form_label" align="right">立项名称:</td>
						<td colspan="1">
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width:65%;" />
							<input class="nui-hidden" name="criteria._expr[1]._property" value="proAppName" />
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like" />
						</td>
						<td class="form_label" align="right">立项编号:</td>
						<td colspan="1">
							<input name="criteria._expr[2]._value" class="nui-textbox" style="width:65%;" />
							<input class="nui-hidden" name="criteria._expr[2]._property" value="proAppCode" />
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like" />
						</td>
						<td class="form_label" align="right">采购计划编号:</td>
						<td colspan="1">
							<input name="criteria._expr[3]._value" class="nui-textbox" style="width:65%;" />
							<input class="nui-hidden" name="criteria._expr[3]._property" value="purchaseNumber" />
							<input class="nui-hidden" name="criteria._expr[3]._op" value="like" />
							<input class="nui-hidden" id="ischange" name="criteria._expr[4].ischange" value="1" />
							<input class="nui-hidden" name="criteria._expr[4]._op" value="=" />
							<input class="nui-hidden" name="criteria._expr[7]._property" value="createdOrgid" />
							<input class="nui-hidden" name="criteria._expr[7]._op" value="in" />
							<input class="nui-hidden" name="criteria._expr[7]._value" id="orgids2" />
							<input class="nui-hidden" name="criteria._expr[6].createdBy" id="createdBy" />
							<input class="nui-hidden" name="criteria._expr[6]._op" value="=" />
							<input class="nui-hidden" name="criteria._order[1]._desc" value="createdTime" >
						</td>
						<td colspan="9" align="center">
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
						</td>
					</tr>
				</table>
				</div>
    </div>
    <div region="south" showSplit="false" style="text-align: center;padding: 8px;" height="45px" showHeader="false" >
        <a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">确定</a>
			<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
    </div>
    <div region="center">
	        <div id="datagrid1" frozenStartColumn="0" sizeList="[10,20,50,100]" showPager="true"
						dataField="proApp" sortMode="client" class="nui-datagrid"
						style="width:100%;height: 100%" multiSelect="false"
						url="com.zhonghe.ame.purchase.purchaseProApp.queryProApp.biz.ext">
						<div property="columns">
							<div type="indexcolumn" align="center" headerAlign="center">序号</div>
							<div name="temp123" type="checkcolumn"></div>
							<!-- <div type="expandcolumn" width="20"></div> -->
							<div field="proAppName" width="180" align="left" headerAlign="center" allowSort="true">立项名称</div>
							<div field="type" width="180" align="left" headerAlign="center" renderer="onType">采购类型</div>
							<div field="proAppCode" width="100" align="left" headerAlign="center" allowSort="true">立项编号</div>
		<!-- 					 <div field="code" width="80" align="center" headerAlign="center" allowSort="true" >采购计划编号</div> -->
							<div field="proAppOrgName" width="100" align="left" headerAlign="center" allowSort="true">立项单位</div>
<!-- 							<div field="projectId" width="150" align="center" headerAlign="center" allowSort="true">所属项目名称</div> -->
							<div field="proAppApplyPrice" width="100" align="center" headerAlign="center"allowSort="true">立项金额(万元)</div>
							<div field="purchasMode" width="100" align="center" headerAlign="center"allowSort="true">采购方式</div>
						</div>
				</div>
			</div>
</div>
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");
		search();
		var type = <%=request.getParameter("type") %>;
		var reve_grid = nui.get("reve_grid");

		function onOk() {
			var row = grid.getSelected();
			closeOk();
		}

		function search() {
			var data = form.getData(); //获取表单JS对象数据
			grid.load(data); //datagrid加载数据
		}
		function reset() {
			form.reset();
			grid.load();
			search()
		}


		function GetData() {
			var row = grid.getSelected();
			return row;
		}
	
		function onType(e){
   		return nui.getDictText("ZH_PURCHASE",e.value);
	}

		//回车触发
		function onKeyEnter() {
			search();
		}

	</script>
</body>
</html>