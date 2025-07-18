<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.mini-grid-cell-nowrap {
	white-space: nowrap;
}
</style>
<head>
<title>考核收入系数</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="coefficientForm">
			<input name="criteria._expr[0]._property" value="secondaryOrg" class="nui-hidden" />
			<input name="criteria._expr[0]._op" value="in" class="nui-hidden" />
			<input id="searchOrgids" name="criteria._expr[0]._value" class="nui-hidden" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">合同编号:</td>
						<td style="width: 205px">
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 200px" />
							<input name="criteria._expr[1]._property" value="contractNo" class="nui-hidden" />
							<input name="criteria._expr[1]._op" value="like" class="nui-hidden" />
						</td>
						<td style="width: 60px; text-align: right;">合同名称:</td>
						<td style="width: 205px">
							<input name="criteria._expr[2]._value" class="nui-textbox" style="width: 200px" />
							<input name="criteria._expr[2]._property" value="contractName" class="nui-hidden" />
							<input name="criteria._expr[2]._op" value="like" class="nui-hidden" />
						</td>
						<td style="width: 70px; text-align: right;">集团内/外:</td>
						<td style="width: 155px">
							<input name="criteria._expr[3].headquarterGroupVirtual" class="nui-dictcombobox" dictTypeId="ZH_GROUP" showNullItem="true" nullItemText="全部" style="width: 150px" />
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
			<table style="width: 100%;">
				<tr>
					<td>
						<a class="nui-button" id="khsrxsgl_add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="khsrxsgl_edit" iconCls="icon-edit" onclick="edit()">编辑</a>
						<a class="nui-button" id="khsrxsgl_del" iconCls="icon-remove" onclick="del()">删除</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="coefficientGrid" sizeList="[50,100,500]" showPager="true" dataField="incomeCoefficientList" pageSize="50" class="nui-datagrid" style="width: 100%; height: 100%;" multiSelect="true"
				url="com.zhonghe.ame.kaohe.incomeCoefficient.queryIncomeCoefficientList.biz.ext">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="contractNo" width="180" headerAlign="center" allowSort="true" align="center">合同编号</div>
					<div field="contractName" width="250" align="center" headerAlign="center" allowSort="true">合同名称</div>
					<div field="headquarterGroupVirtual" width="80" align="center" headerAlign="center" allowSort="true" renderer="ZH_GROUP">集团内外</div>
					<div field="coefficient" width="60" align="center" headerAlign="center" allowSort="true">考核系数</div>
					<div field="dataType" width="80" align="center" headerAlign="center" allowSort="true" renderer="COEFFICIENT_TYPE">数据类型</div>
					<div field="secondaryOrgname" width="190" headerAlign="center" allowSort="true" align="center">合同承办单位</div>
					<div field="remark" width="200" headerAlign="center" allowSort="true" align="center">备注</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		nui.parse();
		var coefficientForm = new nui.Form("#coefficientForm");
		var coefficientGrid = nui.get("coefficientGrid");
		
		init();
		
		function init(){
			// 按钮权限
			if (userId != 'sysadmin') {
				getOpeatorButtonAuth("khsrxsgl_add,khsrxsgl_edit,khsrxsgl_del");
			}
			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "khsrxsgl"
			};
			nui.ajax({
				url : "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data : json,
				type : 'POST',
				contentType : 'text/json',
				success : function(text) {
					if(text.errcode == "没有有权的机构"){
						getSecOrg(userOrgId);												
					}else{
						nui.get("searchOrgids").setValue(text.orgids);
					}
					search();
				}
			});
		}
		
		function search() {
			var data = coefficientForm.getData();
			coefficientGrid.sortBy("updateTime", "desc");
			coefficientGrid.load(data);
		}
		
		function getSecOrg(userOrgId){
			var json = nui.encode({'userOrgId' : userOrgId});
			ajaxCommon({
				url : "com.primeton.eos.common.orgUtils.getSecOrg.biz.ext",
				data : json,
				async: false,
				success : function(result) {
					var data = result.data;
					nui.get("searchOrgids").setValue(data.ORGID);
				}
			});
		}
		
		function reset() {
			coefficientForm.reset();
			init();
		}						
		
		function add(){
			nui.open({
				url : "/default/kaohe/incomeCoefficient/incomeCoefficientAdd.jsp",
				width : "450",
				height : "300",
				allowResize: false,
				title : "考核收入系数 - 新增",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			});
		}
		
		function edit(){
			var rows = coefficientGrid.getSelecteds();
			if (rows.length > 1 || rows.length == 0) {
				showTips("只能选中一条记录进行编辑", "danger");
				return;
			}else{
				var data = rows[0];
				nui.open({
					url : "/default/kaohe/incomeCoefficient/incomeCoefficientEdit.jsp",
					width : '450',
					height : '300',
					title : "考核收入系数 - 编辑",
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
		
		function del(){
			var rows = coefficientGrid.getSelecteds();
			if (rows.length == 0) {
				showTips("请选中需要删除的数据记录", "danger");
			}else{
				var status = rows.every(item => item.dataType == '0');
				if(status){
					if (!confirm("是否删除？")) {
						return;
					}else{
						var datas = rows.map(row => ({ id: row.id }));
						var json = nui.encode({
							'datas' : datas
						});
						nui.ajax({
							url : "com.zhonghe.ame.kaohe.incomeCoefficient.deleteIncomeCoefficientById.biz.ext",
							type : 'POST',
							data : json,
							contentType : 'text/json',
							success : function(o) {
								if (o.result == 1) {
									showTips("删除成功");
									search();
								} else {
									showTips("删除失败，请联系系统管理员！", "danger");
								}
							}
						});
					}
				}else{
					showTips("只能删除数据类型为【特殊系数】的数据", "danger");
				}
			}
		}
		
		function ZH_GROUP(e) {
			return nui.getDictText("ZH_GROUP", e.value);
		}
		
		function COEFFICIENT_TYPE(e){
			return nui.getDictText("coefficient_type", e.value);
		}
		
	</script>

</body>
</html>