<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
	html,body {
		margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	}
	
	.mini-grid-cell-nowrap{
		white-space: nowrap;
	}	
</style>
<head>
<title>市场经营信息</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="form1">
			<input class="nui-hidden" name="criteria._entity" value="com.zhonghe.ame.marketInfo.bid.ZhBidinfoEntity" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<tr>
						<td style="width: 70px; text-align: right;">数据完善度:</td>
						<td style="width: 155px">
							<input name="criteria._expr[1].bidDataStatus" class="nui-dictcombobox" dictTypeId="ZH_BID_STATUS" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">牵头部门:</td>
						<td style="width: 155px">
							<input name="criteria._expr[2].bidOrg" class="nui-dictcombobox" dictTypeId="ZH_BID_ORG" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">内协外联:</td>
						<td style="width: 155px">
							<input name="criteria._expr[4].bidNxwl" class="nui-dictcombobox" dictTypeId="ZH_BID_NXWL" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">甲方全称:</td>
						<td colspan="2" style="width: 320px">
							<input name="criteria._expr[5].custId" class="nui-combobox" url="com.zhonghe.ame.chargeContract.chargeContract.queryCusts.biz.ext" filterType="like" textField="custname" valueField="custid"
								dataField="custs" valueFromSelect="true" allowInput="true" style="width: 315px;" />
						</td>
						<td style="width: 60px; text-align: right;">备案日期:</td>
						<td colspan="2" style="width: 245px">
							<input class="nui-hidden" name="criteria._expr[3]._op" value="between" />
							<input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM" />
							<input class="nui-hidden" name="criteria._expr[3]._property" value="recordDate" />
							<input class="mini-monthpicker" name="criteria._expr[3]._min" style="width: 110px" />
							<span>至</span>
							<input class="mini-monthpicker" name="criteria._expr[3]._max" style="width: 110px" />
						</td>
					</tr>
					<tr>
						<td style="width: 60px; text-align: right;">标的额:</td>
						<td style="width: 155px">
							<input name="criteria._expr[6].bidBde" class="nui-dictcombobox" dictTypeId="ZH_BID_BDE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">项目地点:</td>
						<td style="width: 155px">
							<input name="criteria._expr[7]._value" class="nui-textbox" style="width: 150px" />
							<input class="nui-hidden" name="criteria._expr[7]._property" value="projectPlace" />
							<input class="nui-hidden" name="criteria._expr[7]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">集团内外:</td>
						<td style="width: 155px">
							<input name="criteria._expr[8].headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">项目名称:</td>
						<td colspan="2" style="width: 320px">
							<input name="criteria._expr[9]._value" class="nui-textbox" style="width: 315px" />
							<input class="nui-hidden" name="criteria._expr[9]._property" value="projectName" />
							<input class="nui-hidden" name="criteria._expr[9]._op" value="like" />
						</td>
						<td style="width: 60px; text-align: right;">参与单位:</td>
						<td colspan="2" style="width: 245px">
							<input name="criteria._expr[10]._value" class="nui-combobox" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryBidUnits.biz.ext" filterType="like" textField="dictname"
								valueField="dictname" dataField="bidUnits" valueFromSelect="true" allowInput="true" style="width: 241px;" />
							<input class="nui-hidden" name="criteria._expr[10]._property" value="bidUnitsName" />
							<input class="nui-hidden" name="criteria._expr[10]._op" value="like" />
						</td>
					</tr>
					<tr>
						<td style="width: 60px; text-align: right;">特点:</td>
						<td style="width: 155px">
							<input name="criteria._expr[11].bidFeatures" class="nui-dictcombobox" dictTypeId="ZH_BID_FEATURES" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">工程类别:</td>
						<td style="width: 155px">
							<input name="criteria._expr[12].projectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">专业类别:</td>
						<td style="width: 155px">
							<input name="criteria._expr[13].majorType" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">服务范围:</td>
						<td style="width: 155px">
							<input name="criteria._expr[14].bidService" class="nui-dictcombobox" dictTypeId="ZH_BID_SERVICE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
					</tr>
					<tr>
						<td style="width: 60px; text-align: right;">合同类型:</td>
						<td style="width: 155px">
							<input name="criteria._expr[15].contractType" class="nui-dictcombobox" dictTypeId="ZH_BID_CONTRACT_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">采购方式:</td>
						<td style="width: 155px">
							<input name="criteria._expr[16].procurementType" class="nui-dictcombobox" dictTypeId="ZH_BID_PROCUREMENT_TYPE" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">价格模式:</td>
						<td style="width: 155px">
							<input name="criteria._expr[17].contractModel" class="nui-dictcombobox" dictTypeId="CONTRACT_MODEL" showNullItem="true" nullItemText="全部" style="width: 150px" />
						</td>
						<td style="width: 60px; text-align: right;">中标结果:</td>
						<td style="width: 155px">
							<input name="criteria._expr[18].bidResult" class="nui-dictcombobox" dictTypeId="ZH_BID_RESULT" showNullItem="true" nullItemText="全部" style="width: 150px" />
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
						<a class="nui-button" id="add" iconCls="icon-add" onclick="add()">新增</a>
						<a class="nui-button" id="edit" iconCls="icon-edit" onclick="edit()">编辑</a>
						<a class="nui-button" id="del" iconCls="icon-remove" onclick="deleteInfo()">删除</a>
						<a class="nui-button" id="improt" iconCls="icon-upload" onclick="improt()">导入</a>
						<a class="nui-button" id="export" iconCls="icon-download" onclick="exportExcel()">导出</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="datagrid1" sizeList="[20,50,100,500]" dataField="bidInfos" pageSize="20" class="nui-datagrid" style="width: 100%; height: 100%;"
				url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryBidInfo.biz.ext" frozenStartColumn="0" frozenEndColumn="9" allowAlternating="true" idField="id" onshowrowdetail="onShowRowDetail">
				<div property="columns">
					<div type="checkcolumn">○</div>
					<div type="expandcolumn" >+</div>
					<div field="id" headerAlign="center" visible="false">id</div>
					<div field="bidDataStatus" headerAlign="center" align="center" renderer="ZH_BID_STATUS" width="75">数据完善度</div>
					<div field="bidOrg" headerAlign="center" align="center" renderer="ZH_BID_ORG">牵头部门</div>
					<div field="recordDate" headerAlign="center" align="center" dateFormat="yyyy-MM" width="70">备案日期</div>
					<div field="createUserid" displayField="empname" headerAlign="center" align="center" width="55">填报人</div>
					<div field="bidNxwl" headerAlign="center" align="center" renderer="ZH_BID_NXWL" width="65">内协外联</div>
					<div field="custId" displayField="custname" headerAlign="center" align="center" width="300">甲方全称</div>
					<div field="projectName" headerAlign="center" align="center" width="300">项目名称</div>
					<div field="investAmount" headerAlign="center" align="center">投资额(万元)</div>
					<div field="bidBde" headerAlign="center" align="center" renderer="ZH_BID_BDE">标的额</div>
					<div field="projectPlace" headerAlign="center" align="center">项目地点</div>
					<div field="headquarterGroup" headerAlign="center" align="center" renderer="ZH_GROUP">集团内外</div>
					<div field="bidFeatures" headerAlign="center" align="center" renderer="ZH_BID_FEATURES">特点</div>
					<div field="projectType" headerAlign="center" align="center" renderer="ZH_PROJECT_TYPE">工程类别</div>
					<div field="majorType" headerAlign="center" align="center" renderer="ZH_MAJOR_TYPE">专业类别</div>
					<div field="bidService" headerAlign="center" align="center" renderer="ZH_BID_SERVICE">服务范围</div>
					<div field="projectFeatures" headerAlign="center" align="center">主要项目特征</div>
					<div field="contractType" headerAlign="center" align="center" renderer="ZH_BID_CONTRACT_TYPE">合同类型</div>
					<div field="procurementType" headerAlign="center" align="center" renderer="ZH_BID_PROCUREMENT_TYPE">采购方式</div>
					<div field="bidUnitsCode" displayField="bidUnitsName" headerAlign="center" align="center" width="250">参与单位全称</div>
					<div field="contractPrice" headerAlign="center" align="center" width="150">报价/合同价/万元/%</div>
					<div field="contractModel" headerAlign="center" align="center" renderer="CONTRACT_MODEL">价格模式</div>
					<div field="bidConvert" headerAlign="center" align="center">折合万/人月</div>
					<div field="remark" headerAlign="center" align="center" width="300">备注</div>
					<div field="bidResult" headerAlign="center" align="center" renderer="ZH_BID_RESULT">中标结果</div>
				</div>
			</div>
		</div>
	</div>

	<div id="bidCompetInfo" style="display: none;">
		<div id="bidCompetGrid" sizeList="[5]" dataField="bidCompets" pageSize="5" class="nui-datagrid" style="width: 510px; height: 203px;"
			url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryCompetByBid.biz.ext" allowAlternating="true">
			<div property="columns">
				<div field="id" headerAlign="center" visible="false">id</div>
				<div field="bidId" headerAlign="center" visible="false">bidId</div>
				<div field="competId" headerAlign="center" visible="false">competId</div>
				<div field="competName" headerAlign="center" width="300px">竞争对手单位全称</div>
				<div field="competContractPrice" headerAlign="center" align="center">报价/合同价/万元/%</div>
			</div>	
		</div>
	</div>


	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");
		var bidCompetGrid = nui.get("bidCompetGrid");
		var bidCompetInfo = document.getElementById("bidCompetInfo");
		
		search();
		
		function search() {
			var data = form.getData();
			grid.sortBy("recordDate", "desc");
			grid.load(data);
		}
		
		function reset() {
			form.reset();
			search();
		}
		
		function onShowRowDetail(e) {
			var bidGrid = e.sender;
			var row = e.record;
			var td = bidGrid.getRowDetailCellEl(row);
			td.appendChild(bidCompetInfo);
			bidCompetInfo.style.display = "block";
			var data = {
				'bidId' : row.id
			};
			bidCompetGrid.load(data);
		}

		function add() {
			nui.open({
				url : "/default/marketInfo/bid/addBidInfo.jsp",
				width : '100%',
				height : '100%',
				title : "新增市场经营信息",
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
					url : "/default/marketInfo/bid/editBidInfo.jsp",
					width : '100%',
					height : '100%',
					title : "编辑市场经营信息",
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
						url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.deleteBidInfo.biz.ext",
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

		function ZH_BID_STATUS(e) {
			return nui.getDictText("ZH_BID_STATUS", e.value);
		}

		function ZH_BID_ORG(e) {
			return nui.getDictText("ZH_BID_ORG", e.value);
		}

		function ZH_BID_NXWL(e) {
			return nui.getDictText("ZH_BID_NXWL", e.value);
		}

		function ZH_BID_BDE(e) {
			return nui.getDictText("ZH_BID_BDE", e.value);
		}

		function ZH_GROUP(e) {
			return nui.getDictText("ZH_GROUP", e.value);
		}

		function ZH_BID_FEATURES(e) {
			return nui.getDictText("ZH_BID_FEATURES", e.value);
		}

		function ZH_PROJECT_TYPE(e) {
			return nui.getDictText("ZH_PROJECT_TYPE", e.value);
		}

		function ZH_MAJOR_TYPE(e) {
			return nui.getDictText("ZH_MAJOR_TYPE", e.value);
		}

		function ZH_BID_SERVICE(e) {
			return nui.getDictText("ZH_BID_SERVICE", e.value);
		}

		function ZH_BID_CONTRACT_TYPE(e) {
			return nui.getDictText("ZH_BID_CONTRACT_TYPE", e.value);
		}

		function ZH_BID_PROCUREMENT_TYPE(e) {
			return nui.getDictText("ZH_BID_PROCUREMENT_TYPE", e.value);
		}

		function CONTRACT_MODEL(e) {
			return nui.getDictText("CONTRACT_MODEL", e.value);
		}

		function ZH_BID_RESULT(e) {
			return nui.getDictText("ZH_BID_RESULT", e.value);
		}
		
		function improt() {
			nui.open({
				url : "<%=request.getContextPath()%>/marketInfo/bid/improtBidInfo.jsp",
				title : "选择导入文件",
				width : 350,
				height : 50,
				allowResize : false
			});
		}		
		
	</script>
	
</body>
</html>
