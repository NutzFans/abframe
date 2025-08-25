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

.mini-grid-summaryCell {
	text-align: center;
}
</style>
<head>
<title>长期资产管理</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="assetsForm">
			<input name="criteria._expr[0]._property" value="secondaryOrg" class="nui-hidden" />
			<input name="criteria._expr[0]._op" value="in" class="nui-hidden" />
			<input id="searchOrgids" name="criteria._expr[0]._value" class="nui-hidden" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 100px; text-align: right;">资产所属单位：</td>
						<td>
							<input id="secondaryOrg" name="criteria._expr[1].secondaryOrg" class="nui-combobox" textField="secOrgname" valueField="secOrg" style="width: 220px" showNullItem="true" />
						</td>
						<td style="width: 70px; text-align: right;">资产分类：</td>
						<td>
							<input name="criteria._expr[2].clazz" class="nui-dictcombobox" dictTypeId="ZH_CW_CQZCFL" showNullItem="true" nullItemText="全部" style="width: 100px" />
						</td>
						<td style="width: 70px; text-align: right;">资产名称：</td>
						<td>
							<input name="criteria._expr[3]._value" class="nui-textbox" style="width: 220px" />
							<input class="nui-hidden" name="criteria._expr[3]._property" value="name" />
							<input class="nui-hidden" name="criteria._expr[3]._op" value="like" />
						</td>
						<td style="width: 90px; text-align: right;">采购/装修日期:</td>
						<td style="width: 245px">
							<input class="nui-hidden" name="criteria._expr[4]._op" value="between" />
							<input class="nui-hidden" name="criteria._expr[4]._pattern" value="yyyy-MM-dd" />
							<input class="nui-hidden" name="criteria._expr[4]._property" value="procTime" />
							<input class="nui-datepicker" name="criteria._expr[4]._min" style="width: 110px" />
							<span>至</span>
							<input class="nui-datepicker" name="criteria._expr[4]._max" style="width: 110px" />
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
						<a class="nui-button" id="cwcqzc_add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="cwcqzc_edit" iconCls="icon-edit" onclick="edit()">编辑</a>
						<a class="nui-button" id="cwcqzc_del" iconCls="icon-remove" onclick="del()">删除</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="assetsGrid" sizeList="[20,50,100,500]" showPager="true" dataField="assetsList" pageSize="20" align="center" class="nui-datagrid" style="width: 100%; height: 100%;"
				url="com.zhonghe.ame.finance.longTermAssets.queryAssetsList.biz.ext" allowSortColumn=true multiSelect="true" onshowrowdetail="onShowRowDetail">
				<div property="columns">
					<div type="checkcolumn"></div>
					<div type="expandcolumn" renderer="expandColumn">+</div>
					<div field="createUsername" width="60" headerAlign="center" allowSort="true" align="center">创建人</div>
					<div field="secondaryOrgname" width="190" headerAlign="center" allowSort="true" align="center">资产所属单位</div>
					<div field="department" width="190" headerAlign="center" allowSort="true" align="center">资产所属部门</div>
					<div field="clazz" width="100" headerAlign="center" allowSort="true" align="center" renderer="ZH_CW_CQZCFL">资产分类</div>
					<div field="name" width="250" headerAlign="center" allowSort="true" align="center">资产名称</div>
					<div field="procTime" width="100" headerAlign="center" allowSort="true" align="center">采购/装修日期</div>
					<div field="quantity" width="80" headerAlign="center" allowSort="true" align="center">数量</div>
					<div field="price" width="100" headerAlign="center" allowSort="true" align="center" dataType="currency">单价(元)</div>
					<div field="total" width="100" headerAlign="center" allowSort="true" align="center" dataType="currency">总价预算</div>
					<div field="taxRate" width="100" headerAlign="center" allowSort="true" align="center" renderer="ZH_CW_CQZCSL">税率</div>
					<div field="amountTax" width="100" headerAlign="center" allowSort="true" align="center" dataType="currency">不含税金额</div>
					<div field="depreciationMonth" width="100" headerAlign="center" allowSort="true" align="center">总折旧(月)</div>
					<div field="depreciationRate" width="100" headerAlign="center" allowSort="true" align="center">月折旧/摊销率</div>
				</div>
			</div>
		</div>
	</div>

	<div id="assetsItemGridDiv" style="display: none;">
		<div id="assetsItemGrid" showPager="false" showSummaryRow="true" dataField="assetsItemList" class="nui-datagrid" url="com.zhonghe.ame.finance.longTermAssets.queryAssetsItemList.biz.ext"
			style="height: 250px">
			<div property="columns">
				<div field="zjYear" width="120" headerAlign="center" align="center">折旧年份</div>
				<div field="zjZb" width="120" headerAlign="center" align="center" summaryType="sum">折旧占比</div>
				<div field="total" width="120" headerAlign="center" align="center" summaryType="sum" dataType="currency">折旧金额</div>
				<div field="jan" headerAlign="center" align="center" summaryType="sum" dataType="currency">1月</div>
				<div field="feb" headerAlign="center" align="center" summaryType="sum" dataType="currency">2月</div>
				<div field="mar" headerAlign="center" align="center" summaryType="sum" dataType="currency">3月</div>
				<div field="apr" headerAlign="center" align="center" summaryType="sum" dataType="currency">4月</div>
				<div field="may" headerAlign="center" align="center" summaryType="sum" dataType="currency">5月</div>
				<div field="jun" headerAlign="center" align="center" summaryType="sum" dataType="currency">6月</div>
				<div field="jul" headerAlign="center" align="center" summaryType="sum" dataType="currency">7月</div>
				<div field="aug" headerAlign="center" align="center" summaryType="sum" dataType="currency">8月</div>
				<div field="sep" headerAlign="center" align="center" summaryType="sum" dataType="currency">9月</div>
				<div field="oct" headerAlign="center" align="center" summaryType="sum" dataType="currency">10月</div>
				<div field="nov" headerAlign="center" align="center" summaryType="sum" dataType="currency">11月</div>
				<div field="dec" headerAlign="center" align="center" summaryType="sum" dataType="currency">12月</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		nui.parse();
		var assetsForm = new nui.Form("#assetsForm");
		var assetsGrid = nui.get("assetsGrid");
		var assetsItemGrid = nui.get("assetsItemGrid");
		var assetsItemGridDiv = document.getElementById("assetsItemGridDiv");
		var secOrgId;
		var authVal;

		init();

		function init() {
			// 按钮权限
			if (userId != 'sysadmin') {
				getOpeatorButtonAuth("cwcqzc_add,cwcqzc_edit,cwcqzc_del");
			}
			//code:对应功能编码，map：对于机构的查询条件
			var json = nui.encode({
				'loginUserId' : userId,
				'loginUserOrgId' : userOrgId,
				'authCode' : 'cwcqzc'
			});
			nui.ajax({
				url : "com.zhonghe.ame.contractPact.statisticalReport.queryMonthlyBudgetTrackAuth.biz.ext",
				type : 'POST',
				async : false,
				data : json,
				contentType : 'text/json',
				success : function(o) {
					authVal = o.result;
					if (o.result == "1") {
						initSecOrgCombobox(null);
					}else{
						setSecOrg(userOrgId);
						initSecOrgCombobox(secOrgId);
					}
					search();
				}
			});
		}
		
		function setSecOrg(userOrgId) {
			var json = nui.encode({
				'userOrgId' : userOrgId
			});
			ajaxCommon({
				url : "com.primeton.eos.common.orgUtils.getSecOrg.biz.ext",
				data : json,
				async : false,
				success : function(result) {
					var data = result.data;
					secOrgId = data.ORGID;
				}
			});
		}
		
		function initSecOrgCombobox(secOrgId) {
			ajaxCommon({
				"url" : "com.zhonghe.ame.kaohe.common.getBusSecOrgList.biz.ext",
				contentType : 'text/json',
				async: false,
				success : function(result) {
					var datas = result.secOrgList;
					if(secOrgId != null){
						var orgIdSet = new Set(secOrgId.split(','));
						var filteredDatas = datas.filter(item => orgIdSet.has(item.secOrg));
						nui.get("secondaryOrg").setData(filteredDatas);
						nui.get("searchOrgids").setValue(secOrgId);
					}else{
						nui.get("secondaryOrg").setData(datas);
					}
				}
			});
		}				
		
		function search() {
			var data = assetsForm.getData();
			assetsGrid.sortBy("procTime", "desc");
			assetsGrid.load(data);
		}
		
		function reset() {
			assetsForm.reset();
			init();
		}				
		
		function add() {
			nui.open({
				url : "/default/finance/longTermAssets/addLongTermAssets.jsp",
				width : "100%",
				height : "100%",
				allowResize : false,
				title : "长期资产 - 新增",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					search();
				}
			});
		}
		
		function edit() {
			var rows = assetsGrid.getSelecteds();
			if (rows.length > 1 || rows.length == 0) {
				showTips("只能选中一条记录进行编辑", "danger");
				return;
			} else {
				var data = rows[0];
				if(authVal !="1" && authVal !="2"){
					if(userId != data.createUserid){
						showTips("当前用户权限只能编辑自己创建的数据", "danger");
						return;						
					}
				}
				nui.open({
					url : "/default/finance/longTermAssets/editLongTermAssets.jsp",
					width : "100%",
					height : "100%",
					allowResize : false,
					title : "长期资产 - 编辑",
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
			var rows = assetsGrid.getSelecteds();
			if (rows.length == 0) {
				showTips("请选中需要删除的数据记录", "danger");
			}else{
				if (!confirm("是否删除？")) {
					return;
				}else{
					var datas = rows.map(row =>"'"+row.id+"'").join(',');
					var json = nui.encode({
							'datas' : datas
					});
					nui.ajax({
						url : "com.zhonghe.ame.finance.longTermAssets.deleteAssetsById.biz.ext",
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
		
		function ZH_CW_CQZCFL(e){
			return nui.getDictText("ZH_CW_CQZCFL", e.value);
		}
		
		function ZH_CW_CQZCSL(e){
			return nui.getDictText("ZH_CW_CQZCSL", e.value);
		}
		
		function expandColumn(e) {
			return "<div class='mini-grid-cell-inner  mini-grid-cell-nowrap' style=''><a class='mini-grid-ecIcon' href='javascript:#' onclick='return false'></a></div>"
		}		
		
		function onShowRowDetail(e){
			var assets = e.sender;
			var row = e.record;
			var td = assets.getRowDetailCellEl(row);
			td.appendChild(assetsItemGridDiv);
			assetsItemGridDiv.style.display = "block";
			var data = {
				'assetsId' : row.id
			};
			assetsItemGrid.sortBy("zjYear", "asc");
			assetsItemGrid.load(data);
		}		
		
	</script>

</body>
</html>