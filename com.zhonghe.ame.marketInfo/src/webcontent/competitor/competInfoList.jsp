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
<title>竞争对手信息</title>
</head>
<body>
	<div style="width: auto; height: 99%; padding: 5px;">
		<div id="form1">
			<input class="nui-hidden" name="criteria._entity" value="com.zhonghe.ame.marketInfo.bid.ZhCompetBidEntity" />
			<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
				<table>
					<td style="width: 60px; text-align: right;">竞争对手:</td>
					<td style="width: 255px">
						<input name="criteria._expr[0]._value" class="nui-combobox" valueField="competName" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.queryCompetInfoLike.biz.ext" filterType="like"
							textField="competName" dataField="competInfos" valueFromSelect="true" allowInput="true" style="width: 250px" onvaluechanged="triggerSearch"/>
						<input class="nui-hidden" name="criteria._expr[0]._property" value="competName" />
						<input class="nui-hidden" name="criteria._expr[0]._op" value="like" />
					</td>
					<td>
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
					</td>
				</table>
			</div>
		</div>

		<div class="nui-toolbar" style="border-bottom: 0; padding: 5px;">
			<table style="width: 100%;">
				<tr>
					<td>
						<a class="nui-button" id="edit" iconCls="icon-edit" onclick="edit()">维护</a>
					</td>
				</tr>
			</table>
		</div>

		<div class="nui-fit">
			<div id="datagrid1" sizeList="[25,50,100,500]" dataField="competBids" pageSize="25" class="nui-datagrid" style="width: 100%; height: 100%;"
				url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.queryCompetBidInfo.biz.ext" allowAlternating="true" idField="id" onshowrowdetail="onShowRowDetail">
				<div property="columns">
					<div type="checkcolumn" width="10">○</div>
					<div type="expandcolumn" width="10">+</div>
					<div field="competId" headerAlign="center" visible="false">competId</div>
					<div field="competName" headerAlign="center" align="left" width="100">竞争单位全称</div>
					<div field="competRemark" headerAlign="center" align="left" width="400">简介</div>
					<div field="bidNum" headerAlign="center" align="center"width="50">共同投标项目数</div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="competBidProject" style="display: none;">
		<div id="competBidGrid" sizeList="[100]" dataField="competBidProjects" pageSize="100" class="nui-datagrid" style="width: 100%; height: 568px;"
			url="com.zhonghe.ame.marketInfo.marketinfo.khxx.commpetior.queryCompetBidProject.biz.ext" enableHotTrack="false" allowRowSelect="false">
			<div property="columns">
				<div field="projectName" name="projectName" headerAlign="center" align="center" width="300">项目名称</div>
				<div field="recordDate" name="recordDate" headerAlign="center" align="center" dateFormat="yyyy-MM" width="70">备案日期</div>
				<div field="custname" name="custname" headerAlign="center" align="center" width="300">甲方全称</div>
				<div field="bidUnitsName" name="bidUnitsName" headerAlign="center" align="center" width="250">参与单位</div>
				<div field="contractPrice" name="contractPrice" headerAlign="center" align="center" width="150">报价/合同价/万元/%</div>
				<div field="competName" headerAlign="center" align="center" width="250">竞争对手单位</div>
				<div field="competContractPrice" headerAlign="center" align="center" width="150">报价/合同价/万元/%</div>
			</div>	
		</div>
	</div>	

	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid = nui.get("datagrid1");
		var competBidGrid = nui.get("competBidGrid");
		var competBidProject = document.getElementById("competBidProject");
		
		search();
		
		function search() {
			var data = form.getData();
			grid.sortBy("bidNum", "desc");
			grid.load(data);
		}
		
		function reset() {
			form.reset();
			search();
		}		
		
		function onShowRowDetail(e) {
			var projectGrid = e.sender;
			var row = e.record;
			var td = projectGrid.getRowDetailCellEl(row);
			td.appendChild(competBidProject);
			competBidProject.style.display = "block";
			var data = {
				'competId' : row.competId
			};
			competBidGrid.sortBy("recordDate", "desc");
			competBidGrid.load(data);
		}
		
		competBidGrid.on("load", function(){
			competBidGrid.mergeColumns(["projectName", "recordDate", "custname", "bidUnitsName", "contractPrice"]);
		})
		
		function triggerSearch(){
			search();
		}						
		
	</script>
	
</body>
</html>