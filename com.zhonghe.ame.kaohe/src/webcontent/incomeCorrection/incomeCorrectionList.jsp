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
<title>考核收入修正</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="correctionForm">
			<input name="criteria._expr[0]._property" value="secondaryOrg" class="nui-hidden" />
			<input name="criteria._expr[0]._op" value="in" class="nui-hidden" />
			<input id="searchOrgids" name="criteria._expr[0]._value" class="nui-hidden" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 60px; text-align: right;">扣减年份:</td>
						<td>
							<input id="years" name="criteria._expr[1].years" class="nui-textbox" style="width: 100px" />
						</td>
						<td style="width: 60px; text-align: right;">扣减单位:</td>
						<td>
							<input id="secondaryOrg" name="criteria._expr[2].secondaryOrg" class="nui-combobox" textField="secOrgname" valueField="secOrg" style="width: 200px" showNullItem="true" />
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
						<a class="nui-button" id="khsrxzgl_add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="khsrxzgl_edit" iconCls="icon-edit" onclick="edit()">编辑</a>
						<a class="nui-button" id="khsrxzgl_del" iconCls="icon-remove" onclick="del()">删除</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="correctionGrid" sizeList="[50,100,500]" showPager="true" dataField="incomeCorrectionList" pageSize="50" class="nui-datagrid" style="width: 100%; height: 100%;" multiSelect="true"
				url="com.zhonghe.ame.kaohe.incomeCorrection.queryIncomeCorrectionList.biz.ext">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div field="secondaryOrgname" width="200" headerAlign="center" allowSort="true" align="center">扣减单位</div>
					<div field="years" width="80" headerAlign="center" allowSort="true" align="center">扣减年份</div>
					<div field="amountWithinGroup" width="100" headerAlign="center" allowSort="true" align="center">集团内修正金额(元)</div>
					<div field="amountOutsideGroup" width="100" headerAlign="center" allowSort="true" align="center">集团外修正金额(元)</div>
					<div field="remark" width="200" headerAlign="center" allowSort="true" align="center">备注</div>
				</div>
			</div>
		</div>

	</div>

	<script type="text/javascript">
		nui.parse();
		var correctionForm = new nui.Form("#correctionForm");
		var correctionGrid = nui.get("correctionGrid");
		
		init();
		
		function init(){
			// 按钮权限
			if (userId != 'sysadmin') {
				getOpeatorButtonAuth("khsrxzgl_add,khsrxzgl_edit,khsrxzgl_del");
			}
			//code:对应功能编码，map：对于机构的查询条件
			var json = {
				"code" : "khsrxzgl"
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
						initSecOrgCombobox(text.orgids)
					}
					search();
				}
			});
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

		function initSecOrgCombobox(orgids) {
			ajaxCommon({
				"url" : "com.zhonghe.ame.kaohe.common.getBusSecOrgList.biz.ext",
				contentType : 'text/json',
				async: false,
				success : function(result) {
					var datas = result.secOrgList;
					var orgIdSet = new Set(orgids.split(','));
					var filteredDatas = datas.filter(item => orgIdSet.has(item.secOrg));
					nui.get("secondaryOrg").setData(filteredDatas);
					nui.get("searchOrgids").setValue(orgids);
				}
			});
		}

		function search() {
			var data = correctionForm.getData();
			correctionGrid.sortBy("updateTime", "desc");
			correctionGrid.load(data);
		}
		
		function reset() {
			correctionForm.reset();
			init();
		}		

		function add() {
			nui.open({
				url : "/default/kaohe/incomeCorrection/incomeCorrectionAdd.jsp",
				width : "450",
				height : "300",
				allowResize : false,
				title : "考核收入修正 - 新增",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			});
		}
		
		function edit(){
			var rows = correctionGrid.getSelecteds();
			if (rows.length > 1 || rows.length == 0) {
				showTips("只能选中一条记录进行编辑", "danger");
				return;
			}else{
				var data = rows[0];
				nui.open({
					url : "/default/kaohe/incomeCorrection/incomeCorrectionEdit.jsp",
					width : '450',
					height : '300',
					title : "考核收入修正 - 编辑",
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
			var rows = correctionGrid.getSelecteds();
			if (rows.length == 0) {
				showTips("请选中需要删除的数据记录", "danger");
			}else{
				if (!confirm("是否删除？")) {
					return;
				}else{
					var datas = rows.map(row => ({ id: row.id }));
					var json = nui.encode({
							'datas' : datas
					});
					nui.ajax({
						url : "com.zhonghe.ame.kaohe.incomeCorrection.deleteIncomeCorrectionById.biz.ext",
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
			}
		}				
		
	</script>

</body>
</html>