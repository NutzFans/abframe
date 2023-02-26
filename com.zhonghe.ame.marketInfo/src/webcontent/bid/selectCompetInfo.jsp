<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<head>
<title>选择竞争对手</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	.nui-radiobuttonlist-item {
		float: left;margin-left: 200px;color: pink;
	}
</style>
</head>
	<div style="width: auto; height: 100%; padding: 5px; overflow: hidden;">
		<div id="form1">
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">竞争对手:</td>
						<td style="width: 205px">
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 200px" />
							<input class="nui-hidden" name="criteria._expr[1]._property" value="competName" />
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like" />
						</td>
						<td>
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
			<table>
				<tr>
					<td>
						<a class="nui-button" id="add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="edit" iconCls="icon-edit" onclick="edit()">编辑</a>
						<a class="nui-button" id="del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="nui-fit">
			<div id="datagrid1" class="nui-datagrid" style="width: 100%; height: 340px;" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryCompetInfo.biz.ext" dataField="compets"
				sizeList="[10,30,50,100]" pageSize="10" allowAlternating="true" onrowdblclick="onRowDblClick">
				<div property="columns">
					<div type="checkcolumn" width="10"></div>
					<div field="competId" visible="false">竞争对手主键</div>
					<div field="competName" align="left" headerAlign="center">竞争对手单位全称</div>
				</div>
			</div>
		</div>

		<div style="text-align: center; padding: 5px; border-top: 0px;" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;" iconCls="icon-ok">确定</a>
			<a class="nui-button" onclick="onCancel()" id="saveReimbProcess" style="width: 80px; margin-left: 56px" iconCls="icon-close">关闭</a>
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");
		
		init();
		
		function init(){
			grid.sortBy("createDate", "desc");
			grid.load();
		}
		
		function search() {
			var data = form.getData();
			grid.sortBy("createDate", "desc");
			grid.load(data);
		}
		
		function reset() {
			form.reset();
			init();
		}
		
		function onOk() {
			var row = grid.getSelected();
			CloseWindow("ok");
		}
		
		function onRowDblClick(e) {
			onOk();
		}						
		
		function onCancel(e) {
			CloseWindow("cancel");
		}
		
		function GetData() {
			var row = grid.getSelected();
			return row;
		}		
		
		//标准方法接口定义
		function CloseWindow(action) {
			if (window.CloseOwnerWindow) {
				return window.CloseOwnerWindow(action);
			} else {
				window.close();
			}
		}
		
		function add() {
			nui.open({
				url : "/default/marketInfo/bid/addCompetInfo.jsp",
				width : '580',
				height : '150',
				title : "新增竞争对手",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			})
		}
		
		function edit() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录进行编辑", "danger");
				return;
			}else{
				var data = row[0];
				nui.open({
					url : "/default/marketInfo/bid/editCompetInfo.jsp",
					width : '580',
					height : '150',
					title : "编辑竞争对手",
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.setEditData(data);
					},
					ondestroy : function(action) {
						search();
					}
				})				
			}			
		}			
		
		function deleteInfo() {
			var row = grid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录进行删除", "danger");
				return;
			}else{
				var row = row[0];
				if (!confirm("是否删除？")) {
					return;
				}else{
					var json = nui.encode({'data' : row});	
					nui.ajax({
						url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.deleteCompetInfo.biz.ext",
						type : 'POST',
						data : json,
						contentType : 'text/json',
						success : function(o) {
							if (o.result == 1) {
								showTips("删除成功");
								search();
							} else {
								showTips("删除失败，请联系管理员！", "danger");
							}
						}
					});				
				}				
			}			
		}
		
		function showTips(content, state) {
			if(state) {
				nui.showTips({content: content, state: state, x: "center", y: "center",timeout: 3500.});
			}
			else {
				nui.showTips({content: content, state: "success", x: "center", y: "center",timeout: 3500.});
			}
		}				
		
	</script>
	
</html>