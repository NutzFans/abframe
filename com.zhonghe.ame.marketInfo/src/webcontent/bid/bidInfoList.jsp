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
<title>市场经营信息</title>
</head>
<body>
	<div id="tabs" class="nui-tabs" activeIndex="0" style="width: auto; height: 99%; padding: 5px;" onactivechanged="tabActiveChanged">
		<div title="市场经营信息 - 未完善">
			<div id="dataNotFinshForm">
				<input class="nui-hidden" name="criteria._entity" value="com.zhonghe.ame.marketInfo.bid.ZhBidinfoEntity" />
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 70px; text-align: right;">数据完善度:</td>
							<td style="width: 155px">
								<input id="dataNotFinshBidDataStatus" name="criteria._expr[1].bidDataStatus" class="nui-dictcombobox" dictTypeId="ZH_BID_STATUS" showNullItem="true" nullItemText="全部" style="width: 150px"
									enabled="false" />
							</td>
							<td style="width: 60px; text-align: right;">牵头部门:</td>
							<td style="width: 155px">
								<input id="dataNotFinshBidOrg" name="criteria._expr[2].bidOrg" class="nui-combobox" textField="secOrgname" valueField="secOrg" showNullItem="true" nullItemText="全部" style="width: 150px" />
							</td>
							<td style="width: 60px; text-align: right;">内协外联:</td>
							<td style="width: 155px">
								<input name="criteria._expr[4].bidNxwl" class="nui-dictcombobox" dictTypeId="ZH_BID_NXWL" showNullItem="true" nullItemText="全部" style="width: 150px" />
							</td>
							<td style="width: 60px; text-align: right;">甲方全称:</td>
							<td colspan="2" style="width: 320px">
								<input name="criteria._expr[5]._value" class="nui-combobox" url="com.zhonghe.ame.chargeContract.chargeContract.queryCusts.biz.ext" filterType="like" textField="custname" valueField="custname"
									dataField="custs" valueFromSelect="true" allowInput="true" style="width: 315px;" />
								<input class="nui-hidden" name="criteria._expr[5]._property" value="custName" />
								<input class="nui-hidden" name="criteria._expr[5]._op" value="like" />
							</td>
							<td style="width: 60px; text-align: right;">备案日期:</td>
							<td colspan="2" style="width: 245px">
								<input class="nui-hidden" name="criteria._expr[3]._op" value="between" />
								<input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd" />
								<input class="nui-hidden" name="criteria._expr[3]._property" value="recordDate" />
								<input class="mini-datepicker" name="criteria._expr[3]._min" style="width: 110px" />
								<span>至</span>
								<input class="mini-datepicker" name="criteria._expr[3]._max" style="width: 110px" />
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
							<td colspan="2" style="width: 320px">
								<input name="criteria._expr[14].bidService" class="nui-dictcombobox" dictTypeId="ZH_BID_SERVICE" showNullItem="true" nullItemText="全部" style="width: 315px" />
							</td>
							<td style="width: 60px; text-align: right;">定标时间:</td>
							<td colspan="2" style="width: 245px">
								<input class="nui-hidden" name="criteria._expr[20]._op" value="between" />
								<input class="nui-hidden" name="criteria._expr[20]._pattern" value="yyyy-MM-dd" />
								<input class="nui-hidden" name="criteria._expr[20]._property" value="bidDate" />
								<input class="mini-datepicker" name="criteria._expr[20]._min" style="width: 110px" />
								<span>至</span>
								<input class="mini-datepicker" name="criteria._expr[20]._max" style="width: 110px" />
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
							<td style="width: 100px; text-align: right;">集团或二级单位:</td>
							<td colspan="2" style="width: 320px">
								<input name="criteria._expr[30].twoOrg" class="nui-dictcombobox" dictTypeId="ZH_BID_TWO_ORG" showNullItem="true" nullItemText="全部" style="width: 315px" />
							</td>
							<td style="width: 60px; text-align: right;">中标结果:</td>
							<td style="width: 115px">
								<input name="criteria._expr[18].bidResult" class="nui-dictcombobox" dictTypeId="ZH_BID_RESULT" showNullItem="true" nullItemText="全部" style="width: 110px" />
							</td>
							<td>
								<a class="nui-button" id="dataNotFinshSearch" iconCls="icon-search" onclick="dataNotFinshSearch()">查询</a>
								<a class="nui-button" id="dataNotFinshReset" iconCls="icon-reload" onclick="dataNotFinshReset()">重置</a>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table style="width: 100%;">
					<tr>
						<td>
							<a class="nui-button" id="dataNotFinshAdd" iconCls="icon-add" onclick="dataNotFinshAdd()">新增</a>
							<a class="nui-button" id="dataNotFinshEdit" iconCls="icon-edit" onclick="dataNotFinshEdit()">编辑</a>
							<a class="nui-button" id="dataNotFinshDel" iconCls="icon-remove" onclick="dataNotFinshDel()">删除</a>
							<!-- <a class="nui-button" id="dataNotFinshImprot" iconCls="icon-upload" onclick="dataNotFinshImprot()">导入</a> -->
							<a class="nui-button" id="tbxxgl_not_export" iconCls="icon-download" onclick="dataNotFinshExport()">导出</a>
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-fit">
				<div id="dataNotFinshDataGrid" sizeList="[50,100,500]" dataField="bidInfos" pageSize="50" class="nui-datagrid" style="width: 100%; height: 100%;"
					url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryBidInfo.biz.ext" frozenStartColumn="0" frozenEndColumn="9" allowAlternating="true" idField="id" onshowrowdetail="onShowRowDetail"
					onrowdblclick="dataNotFinshDoView">
					<div property="columns">
						<div type="checkcolumn">○</div>
						<div type="expandcolumn" renderer="expandColumn">+</div>
						<div field="id" headerAlign="center" visible="false">id</div>
						<div field="bidDataStatus" headerAlign="center" align="center" renderer="ZH_BID_STATUS" width="75">数据完善度</div>
						<div field="bidOrgName" headerAlign="center" align="center">牵头部门</div>
						<div field="recordDate" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" width="80" allowSort="true">备案日期</div>
						<div field="updateDate" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" allowSort="true">最后更新日期</div>
						<div field="createUserid" displayField="empname" headerAlign="center" align="center" width="55">填报人</div>
						<div field="bidNxwl" headerAlign="center" align="center" renderer="ZH_BID_NXWL" width="65">内协外联</div>
						<div field="custId" displayField="custName" headerAlign="center" align="center" width="300">甲方全称</div>
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
						<div field="bidUnitsCode" displayField="bidUnitsName" headerAlign="center" align="center" width="300px">参与单位全称</div>
						<div field="contractPrice" headerAlign="center" align="center" width="150px">合同价(万元/%)</div>
						<div field="contractModel" headerAlign="center" align="center" renderer="CONTRACT_MODEL">价格模式</div>
						<div field="bidConvert" headerAlign="center" align="center">折合万/人月</div>
						<div field="remark" headerAlign="center" align="center" width="300">备注</div>
						<div field="bidDate" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" allowSort="true">定标时间</div>
						<div field="bidResult" headerAlign="center" align="center" renderer="ZH_BID_RESULT">中标结果</div>
						<div field="twoOrg" headerAlign="center" align="center" width="200">集团或二级单位</div>
					</div>
				</div>
			</div>
		</div>

		<div name="scjyxxywsDimTab" title="市场经营信息 - 已完善" visible="false">
			<div id="dataFinshForm">
				<input class="nui-hidden" name="criteria._entity" value="com.zhonghe.ame.marketInfo.bid.ZhBidinfoEntity" />
				<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
					<table>
						<tr>
							<td style="width: 70px; text-align: right;">数据完善度:</td>
							<td style="width: 155px">
								<input id="dataFinshBidDataStatus" name="criteria._expr[1].bidDataStatus" class="nui-dictcombobox" dictTypeId="ZH_BID_STATUS" showNullItem="true" nullItemText="全部" style="width: 150px"
									enabled="false" />
							</td>
							<td style="width: 60px; text-align: right;">牵头部门:</td>
							<td style="width: 155px">
								<input id="dataFinshBidOrg" name="criteria._expr[2].bidOrg" class="nui-combobox" textField="secOrgname" valueField="secOrg" showNullItem="true" nullItemText="全部" style="width: 150px" />
							</td>
							<td style="width: 60px; text-align: right;">内协外联:</td>
							<td style="width: 155px">
								<input name="criteria._expr[4].bidNxwl" class="nui-dictcombobox" dictTypeId="ZH_BID_NXWL" showNullItem="true" nullItemText="全部" style="width: 150px" />
							</td>
							<td style="width: 60px; text-align: right;">甲方全称:</td>
							<td colspan="2" style="width: 320px">
								<input name="criteria._expr[5]._value" class="nui-combobox" url="com.zhonghe.ame.chargeContract.chargeContract.queryCusts.biz.ext" filterType="like" textField="custname" valueField="custname"
									dataField="custs" valueFromSelect="true" allowInput="true" style="width: 315px;" />
								<input class="nui-hidden" name="criteria._expr[5]._property" value="custName" />
								<input class="nui-hidden" name="criteria._expr[5]._op" value="like" />
							</td>
							<td style="width: 60px; text-align: right;">备案日期:</td>
							<td colspan="2" style="width: 245px">
								<input class="nui-hidden" name="criteria._expr[3]._op" value="between" />
								<input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd" />
								<input class="nui-hidden" name="criteria._expr[3]._property" value="recordDate" />
								<input class="mini-datepicker" name="criteria._expr[3]._min" style="width: 110px" />
								<span>至</span>
								<input class="mini-datepicker" name="criteria._expr[3]._max" style="width: 110px" />
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
							<td colspan="2" style="width: 320px">
								<input name="criteria._expr[14].bidService" class="nui-dictcombobox" dictTypeId="ZH_BID_SERVICE" showNullItem="true" nullItemText="全部" style="width: 315px" />
							</td>
							<td style="width: 60px; text-align: right;">定标时间:</td>
							<td colspan="2" style="width: 245px">
								<input class="nui-hidden" name="criteria._expr[20]._op" value="between" />
								<input class="nui-hidden" name="criteria._expr[20]._pattern" value="yyyy-MM-dd" />
								<input class="nui-hidden" name="criteria._expr[20]._property" value="bidDate" />
								<input class="mini-datepicker" name="criteria._expr[20]._min" style="width: 110px" />
								<span>至</span>
								<input class="mini-datepicker" name="criteria._expr[20]._max" style="width: 110px" />
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
							<td style="width: 100px; text-align: right;">集团或二级单位:</td>
							<td colspan="2" style="width: 320px">
								<input name="criteria._expr[30].twoOrg" class="nui-dictcombobox" dictTypeId="ZH_BID_TWO_ORG" showNullItem="true" nullItemText="全部" style="width: 315px" />
							</td>
							<td style="width: 60px; text-align: right;">中标结果:</td>
							<td style="width: 115px">
								<input name="criteria._expr[18].bidResult" class="nui-dictcombobox" dictTypeId="ZH_BID_RESULT" showNullItem="true" nullItemText="全部" style="width: 110px" />
							</td>
							<td>
								<a class="nui-button" id="dataFinshSearch" iconCls="icon-search" onclick="dataFinshSearch()">查询</a>
								<a class="nui-button" id="dataFinshReset" iconCls="icon-reload" onclick="dataFinshReset()">重置</a>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table style="width: 100%;">
					<tr>
						<td>
							<a class="nui-button" id="dataFinshEdit" iconCls="icon-edit" onclick="dataFinshEdit()">编辑</a>
							<a class="nui-button" id="dataFinshDel" iconCls="icon-remove" onclick="dataFinshDel()">删除</a>
							<!-- <a class="nui-button" id="dataFinshImprot" iconCls="icon-upload" onclick="dataFinshImprot()">导入</a> -->
							<a class="nui-button" id="tbxxgl_fin_export" iconCls="icon-download" onclick="dataFinshExport()">导出</a>
						</td>
					</tr>
				</table>
			</div>

			<div class="nui-fit">
				<div id="dataFinshDataGrid" sizeList="[50,100,500]" dataField="bidInfos" pageSize="50" class="nui-datagrid" style="width: 100%; height: 100%;"
					url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryBidInfo.biz.ext" frozenStartColumn="0" frozenEndColumn="9" allowAlternating="true" idField="id" onshowrowdetail="onShowRowDetail"
					onrowdblclick="dataFinshDoView">
					<div property="columns">
						<div type="checkcolumn">○</div>
						<div type="expandcolumn" renderer="expandColumn">+</div>
						<div field="id" headerAlign="center" visible="false">id</div>
						<div field="bidDataStatus" headerAlign="center" align="center" renderer="ZH_BID_STATUS" width="75">数据完善度</div>
						<div field="bidOrgName" headerAlign="center" align="center">牵头部门</div>
						<div field="recordDate" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" width="80" allowSort="true">备案日期</div>
						<div field="updateDate" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" allowSort="true">最后更新日期</div>
						<div field="createUserid" displayField="empname" headerAlign="center" align="center" width="55">填报人</div>
						<div field="bidNxwl" headerAlign="center" align="center" renderer="ZH_BID_NXWL" width="65">内协外联</div>
						<div field="custId" displayField="custName" headerAlign="center" align="center" width="300">甲方全称</div>
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
						<div field="bidUnitsCode" displayField="bidUnitsName" headerAlign="center" align="center" width="300px">参与单位全称</div>
						<div field="contractPrice" headerAlign="center" align="center" width="150px">合同价(万元/%)</div>
						<div field="contractModel" headerAlign="center" align="center" renderer="CONTRACT_MODEL">价格模式</div>
						<div field="bidConvert" headerAlign="center" align="center">折合万/人月</div>
						<div field="remark" headerAlign="center" align="center" width="300">备注</div>
						<div field="bidDate" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" allowSort="true">定标时间</div>
						<div field="bidResult" headerAlign="center" align="center" renderer="ZH_BID_RESULT">中标结果</div>
						<div field="twoOrg" headerAlign="center" align="center" width="200">集团或二级单位</div>
						<div field="contractNo" headerAlign="center" align="center" width="200" renderer="lookInfo">合同编号</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="bidCompetInfo" style="display: none;">
		<div id="bidCompetGrid" sizeList="[5]" dataField="bidCompets" pageSize="5" class="nui-datagrid" style="width: 605px; height: 203px; margin-left: 1088px"
			url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryCompetByBid.biz.ext" allowAlternating="true">
			<div property="columns">
				<div field="id" headerAlign="center" visible="false">id</div>
				<div field="bidId" headerAlign="center" visible="false">bidId</div>
				<div field="competId" headerAlign="center" visible="false">competId</div>
				<div field="competName" headerAlign="center" width="300px">竞争对手单位全称</div>
				<div field="competContractPrice" headerAlign="center" align="center" width="150px">合同价(万元/%)</div>
				<div field="competResult" headerAlign="center" align="center" width="150px" renderer="ZH_BID_RESULT">中标结果</div>
			</div>
		</div>
	</div>

	<form name="exprotExcelFlow" id="exprotExcelFlow" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false" />
		<input type="hidden" name="downloadFile" filter="false" />
		<input type="hidden" name="fileName" filter="false" />
	</form>

	<script type="text/javascript">
		nui.parse();
		var dataNotFinshForm = new nui.Form("#dataNotFinshForm");
		var dataFinshForm = new nui.Form("#dataFinshForm");
		var dataNotFinshDataGrid = nui.get("dataNotFinshDataGrid");
		var dataFinshDataGrid = nui.get("dataFinshDataGrid");
		var bidCompetGrid = nui.get("bidCompetGrid");
		var bidCompetInfo = document.getElementById("bidCompetInfo");
		var tabs = nui.get("tabs");
		
		function tabActiveChanged(e) {
			var json = nui.encode({
				'loginUserId' : userId
			});
			nui.ajax({
				url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.auth.analyzeBidAuthTab.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(o) {
					if(o.result == "ALL"){
						var scjyxxywsDimTab = tabs.getTab("scjyxxywsDimTab");
						tabs.updateTab(scjyxxywsDimTab, {
							visible : true
						});
					}
					init();
				}
			});			
		}
		
		function init() {
			// 按钮权限
			if(userId !='sysadmin'){
				// 维护按钮 - ffhtlist_wh
				getOpeatorButtonAuth("tbxxgl_not_export,tbxxgl_fin_export");
			}		
			nui.get("dataNotFinshBidDataStatus").setValue("2");
			nui.get("dataFinshBidDataStatus").setValue("1");
			initSecOrgCombobox();
			var json = nui.encode({
				'loginUserId' : userId
			});
			nui.ajax({
				url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.auth.analyzeBidAuth.biz.ext",
				type : 'POST',
				data : json,
				contentType : 'text/json',
				success : function(o) {
					if(o.result != "ALL"){
						nui.get("dataNotFinshBidOrg").setValue(o.bidOrg);
						nui.get("dataNotFinshBidOrg").disable();
					}
					dataNotFinshSearch();
					dataFinshSearch();
				}
			});
		}
		
		function initSecOrgCombobox() {
			ajaxCommon({
				"url" : "com.zhonghe.ame.kaohe.common.getBusSecOrgList.biz.ext",
				async: false,
				contentType : 'text/json',
				success : function(result) {
					var datas = result.secOrgList;
					nui.get("dataNotFinshBidOrg").setData(datas);
					nui.get("dataFinshBidOrg").setData(datas);
				}
			});
		}		

		function dataNotFinshSearch() {
			var data = dataNotFinshForm.getData();
			dataNotFinshDataGrid.sortBy("updateDate", "desc");
			dataNotFinshDataGrid.load(data);
		}

		function dataNotFinshReset() {
			dataNotFinshForm.reset();
			init();
		}

		function dataFinshSearch() {
			var data = dataFinshForm.getData();
			dataFinshDataGrid.sortBy("updateDate", "desc");
			dataFinshDataGrid.load(data);
		}

		function dataFinshReset() {
			dataFinshForm.reset();
			init();
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
		
		function expandColumn(e){
			if(e.record.isCompet == "0"){
				return "";
			}else{
				return "<div class='mini-grid-cell-inner  mini-grid-cell-nowrap' style=''><a class='mini-grid-ecIcon' href='javascript:#' onclick='return false'></a></div>"
			}
		}
		
		function ZH_BID_STATUS(e) {
			if (e.value == '2') {
				e.cellStyle = "color: red";
			}
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
		
		function dataNotFinshDoView() {
			var row = dataNotFinshDataGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("需要选中一条记录", "danger");
				return;
			} else {
				var data = row[0];
				nui.open({
					url : "/default/marketInfo/bid/bidInfoView.jsp",
					width : '1210',
					height : '800',
					title : "市场经营信息 - 详情",
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.setViewData(data);
					}
				})
			}
		}
		
		function dataFinshDoView() {
			var row = dataFinshDataGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("需要选中一条记录", "danger");
				return;
			} else {
				var data = row[0];
				nui.open({
					url : "/default/marketInfo/bid/bidInfoView.jsp",
					width : '1210',
					height : '800',
					title : "市场经营信息 - 详情",
					onload : function() {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.setViewData(data);
					}
				})
			}
		}		
		
		function dataNotFinshAdd() {
			nui.open({
				url : "/default/marketInfo/bid/addBidInfo.jsp",
				width : '100%',
				height : '100%',
				title : "新增市场经营信息",
				onload : function() {
					var iframe = this.getIFrameEl();
				},
				ondestroy : function(action) {
					dataNotFinshSearch();
					dataFinshSearch();
				}
			})
		}
		
		function dataNotFinshEdit() {
			var row = dataNotFinshDataGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录进行编辑", "danger");
				return;
			} else {
				var data = row[0];
				var json = nui.encode({
					'loginUserId' : userId,
					'createUserId' : data.createUserid,
					'bidOrg' : data.bidOrg
				});
				nui.ajax({
					url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.auth.queryBidAuth.biz.ext",
					type : 'POST',
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if (o.result == "1") {
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
									dataNotFinshSearch();
									dataFinshSearch();
								}
							})
						} else {
							showTips("您没有编辑该条数据的权限，只有创建者及对应牵头部门指定人员可以编辑！", "danger");
							return;
						}
					}
				});
			}
		}
		
		function dataFinshEdit() {
			var row = dataFinshDataGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录进行编辑", "danger");
				return;
			} else {
				var data = row[0];
				var json = nui.encode({
					'loginUserId' : userId,
					'createUserId' : data.createUserid,
					'bidOrg' : data.bidOrg
				});
				nui.ajax({
					url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.auth.queryBidAuth.biz.ext",
					type : 'POST',
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if (o.result == "1") {
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
									dataNotFinshSearch();
									dataFinshSearch();
								}
							})
						} else {
							showTips("您没有编辑该条数据的权限，只有创建者及对应牵头部门指定人员可以编辑！", "danger");
							return;
						}
					}
				});
			}
		}		
		
		function dataNotFinshDel() {
			var row = dataNotFinshDataGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录进行删除", "danger");
				return;
			} else {
				var row = row[0];
				var json = nui.encode({
					'loginUserId' : userId,
					'createUserId' : row.createUserid,
					'bidOrg' : row.bidOrg
				});
				nui.ajax({
					url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.auth.queryBidAuth.biz.ext",
					type : 'POST',
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if (o.result == "1") {
							if (!confirm("是否删除？")) {
								return;
							} else {
								var json = nui.encode({
									'data' : row
								});
								nui.ajax({
									url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.deleteBidInfo.biz.ext",
									type : 'POST',
									data : json,
									contentType : 'text/json',
									success : function(o) {
										if (o.result == 1) {
											showTips("删除成功");
											dataNotFinshSearch();
											dataFinshSearch();
										} else {
											showTips("删除失败，请联系管理员！", "danger");
										}
									}
								});
							}
						} else {
							showTips("您没有删除该条数据的权限，只有创建者及对应牵头部门指定人员可以删除！", "danger");
							return;
						}
					}
				});
			}
		}
		
		function dataFinshDel() {
			var row = dataFinshDataGrid.getSelecteds();
			if (row.length > 1 || row.length == 0) {
				showTips("只能选中一条记录进行删除", "danger");
				return;
			} else {
				var row = row[0];
				var json = nui.encode({
					'loginUserId' : userId,
					'createUserId' : row.createUserid,
					'bidOrg' : row.bidOrg
				});
				nui.ajax({
					url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.auth.queryBidAuth.biz.ext",
					type : 'POST',
					data : json,
					contentType : 'text/json',
					success : function(o) {
						if (o.result == "1") {
							if (!confirm("是否删除？")) {
								return;
							} else {
								var json = nui.encode({
									'data' : row
								});
								nui.ajax({
									url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.deleteBidInfo.biz.ext",
									type : 'POST',
									data : json,
									contentType : 'text/json',
									success : function(o) {
										if (o.result == 1) {
											showTips("删除成功");
											dataNotFinshSearch();
											dataFinshSearch();
										} else {
											showTips("删除失败，请联系管理员！", "danger");
										}
									}
								});
							}
						} else {
							showTips("您没有删除该条数据的权限，只有创建者及对应牵头部门指定人员可以删除！", "danger");
							return;
						}
					}
				});
			}
		}		
		
		function dataNotFinshImprot() {
			nui.open({
				url : "<%=request.getContextPath()%>/marketInfo/bid/improtBidInfo.jsp",
				title : "选择导入文件",
				width : 350,
				height : 50,
				allowResize : false
			});
		}
		
		function dataFinshImprot() {
			nui.open({
				url : "<%=request.getContextPath()%>/marketInfo/bid/improtBidInfo.jsp",
				title : "选择导入文件",
				width : 350,
				height : 50,
				allowResize : false
			});
		}

		//导出
		function dataNotFinshExport() {
			if (!confirm("是否确认导出？")) {
				return;
			}
			var data = dataNotFinshForm.getData(); //获取表单JS对象数据
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.exportBidCompetExcel.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					var fileName = "市场经营";
					var myDate = new Date();
					var year = myDate.getFullYear();
					var month = myDate.getMonth() + 1;
					var day = myDate.getDate();
					var hours = myDate.getHours();
					var minutes = myDate.getMinutes();
					var seconds = myDate.getSeconds();
					var curDateTime = year;
					if (month > 9) {
						curDateTime = curDateTime + "" + month;
					} else {
						curDateTime = curDateTime + "0" + month;
					}
					if (day > 9) {
						curDateTime = curDateTime + day;
					} else {
						curDateTime = curDateTime + "0" + day;
					}
					if (hours > 9) {
						curDateTime = curDateTime + hours;
					} else {
						curDateTime = curDateTime + "0" + hours;
					}
					if (minutes > 9) {
						curDateTime = curDateTime + minutes;
					} else {
						curDateTime = curDateTime + "0" + minutes;
					}
					if (seconds > 9) {
						curDateTime = curDateTime + seconds;
					} else {
						curDateTime = curDateTime + "0" + seconds;
					}
					fileName = fileName + "_" + curDateTime + ".xls";
					var frm = document.getElementById("exprotExcelFlow");
					frm.elements["downloadFile"].value = filePath;
					frm.elements["fileName"].value = fileName;
					frm.submit();
				},
				error : function() {
					showTips("导出数据异常，请联系管理员！", "danger");
				}
			});
		}

		//导出
		function dataFinshExport() {
			if (!confirm("是否确认导出？")) {
				return;
			}
			var data = dataFinshForm.getData(); //获取表单JS对象数据
			var json = nui.encode(data);
			nui.ajax({
				url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.exportBidCompetExcel.biz.ext",
				type : "post",
				data : json,
				cache : false,
				contentType : 'text/json',
				success : function(o) {
					var filePath = o.downloadFile;
					var fileName = "市场经营";
					var myDate = new Date();
					var year = myDate.getFullYear();
					var month = myDate.getMonth() + 1;
					var day = myDate.getDate();
					var hours = myDate.getHours();
					var minutes = myDate.getMinutes();
					var seconds = myDate.getSeconds();
					var curDateTime = year;
					if (month > 9) {
						curDateTime = curDateTime + "" + month;
					} else {
						curDateTime = curDateTime + "0" + month;
					}
					if (day > 9) {
						curDateTime = curDateTime + day;
					} else {
						curDateTime = curDateTime + "0" + day;
					}
					if (hours > 9) {
						curDateTime = curDateTime + hours;
					} else {
						curDateTime = curDateTime + "0" + hours;
					}
					if (minutes > 9) {
						curDateTime = curDateTime + minutes;
					} else {
						curDateTime = curDateTime + "0" + minutes;
					}
					if (seconds > 9) {
						curDateTime = curDateTime + seconds;
					} else {
						curDateTime = curDateTime + "0" + seconds;
					}
					fileName = fileName + "_" + curDateTime + ".xls";
					var frm = document.getElementById("exprotExcelFlow");
					frm.elements["downloadFile"].value = filePath;
					frm.elements["fileName"].value = fileName;
					frm.submit();
				},
				error : function() {
					showTips("导出数据异常，请联系管理员！", "danger");
				}
			});
		}
		
		function lookInfo(e) {
			if(isNotBank(e.value)){
				return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
			}else{
				return;
			}
		}
		
		function doView() {
			var row = dataFinshDataGrid.getSelected();
			if (row) {
				var json = {
					"contractNo" : row.contractNo
				};
				ajaxCommon({
					url : "com.zhonghe.ame.chargeContract.chargeContract.getChargeContractByContractNo.biz.ext",
					data : json,
					success : function(result) {
						var executeUrl = "<%=request.getContextPath()%>/contractPact/print/chargeContractInfoPrint.jsp?id=" + result.id;
						window.open(executeUrl);
					}
				});
			}
		}

		function isNotBank(data) {
			if (data != null && data != "" && data != "null" && data != "undefined" && data) {
				return true;
			} else {
				return false;
			}
		}

		function isBank(data) {
			if (data != null && data != "" && data != "null" && data != "undefined" && data) {
				return false;
			} else {
				return true;
			}
		}
		
		function ZH_BID_RESULT(e){
	   		return nui.getDictText("ZH_BID_RESULT",e.value);
		}		
		
	</script>

</body>
</html>
