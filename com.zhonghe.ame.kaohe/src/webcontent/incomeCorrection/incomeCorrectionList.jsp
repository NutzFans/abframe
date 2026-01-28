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
						<td style="width: 70px; text-align: right;">运用年份：</td>
						<td>
							<input id="years" name="criteria._expr[1].years" class="nui-textbox" style="width: 100px" />
						</td>
						<td style="width: 50px; text-align: right;">单位：</td>
						<td>
							<input id="secondaryOrg" name="criteria._expr[2].secondaryOrg" class="nui-combobox" textField="secOrgname" valueField="secOrg" style="width: 200px" showNullItem="true" />
						</td>
						<td style="width: 70px; text-align: right;">修正类型：</td>
						<td>
							<input name="criteria._expr[3].correctionType" class="nui-dictcombobox" dictTypeId="correction_type" showNullItem="true" nullItemText="全部" style="width: 120px" />
						</td>
						<td style="width: 70px; text-align: right;">集团内外：</td>
						<td>
							<input name="criteria._expr[4].headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" showNullItem="true" nullItemText="全部" style="width: 120px" />
						</td>
						<td>
							<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
							<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
							<a class="nui-button" id="srxzExport" iconCls="icon-download" onclick="srxzExport()">导出</a>
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
					<div field="secondaryOrgname" width="200" headerAlign="center" allowSort="true" align="center">单位</div>
					<div field="years" width="80" headerAlign="center" allowSort="true" align="center">运用年份</div>
					<div field="amount" width="100" headerAlign="center" allowSort="true" align="center" dataType="currency">修正金额(元)</div>
					<div field="correctionType" width="100" headerAlign="center" allowSort="true" align="center" renderer="CORRECTION_TYPE">修正类型</div>
					<div field="headquarterGroup" width="80" align="center" headerAlign="center" allowSort="true" renderer="ZH_GROUP">集团内外</div>
					<div field="remark" width="200" headerAlign="center" allowSort="true" align="left">备注</div>
				</div>
			</div>
		</div>

	</div>

	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>

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
				height : "350",
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
				if(data.correctionType != "虚拟产值"){
					nui.open({
						url : "/default/kaohe/incomeCorrection/incomeCorrectionEdit.jsp",
						width : '450',
						height : '350',
						title : "考核收入修正 - 编辑",
						onload : function() {
							var iframe = this.getIFrameEl();
							iframe.contentWindow.setEditData(data);
						},
						ondestroy : function(action) {
							search();
						}
					})					
				}else{
					showTips("该记录修正类型为[虚拟产值]，无法进行维护操作！", "danger");
				}
			}
		}
		
		function del(){
			var rows = correctionGrid.getSelecteds();
			if (rows.length == 0) {
				showTips("请选中需要删除的数据记录", "danger");
			}else{
				var status = rows.every(item => item.correctionType  != "虚拟产值");
				if (status) {
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
				}else{
					showTips("存在修正类型为[虚拟产值]的数据，无法进行删除操作！", "danger");
				}
			}
		}				
		
		function CORRECTION_TYPE(e){
			return nui.getDictText("correction_type", e.value);
		}
		
		function ZH_GROUP(e){
			return nui.getDictText("ZH_GROUP", e.value);
		}
		
		function srxzExport(){
			var data = correctionForm.getData();
			exportExcel({
				"data" : data,
				"url" : "com.zhonghe.ame.kaohe.incomeCorrection.exportIncomeCorrectionExcel.biz.ext",
				"fileName" : "考核收入修正"
			})			
		}		
		
	</script>

</body>
</html>