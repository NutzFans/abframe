<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
	body {
		margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;
	}
	body .mini-textboxlist{
		border-collapse: collapse;
	}
</style>
<head>
<title>编辑市场经营信息</title>
</head>
	<div class="nui-fit" style="padding: 5px">
		<form id="form1" method="post">
			<fieldset id="field1" style="border: solid 1px #aaa;">
				<legend>市场经营信息</legend>
				<input name="files" id="fileids" class="nui-hidden" />
				<input name="id" id="id" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">牵头部门：</td>
							<td>
								<input name="bidOrg" id="bidOrg" class="nui-dictcombobox" dictTypeId="ZH_BID_ORG" style="width: 250px" required="true" />
							</td>
							<td align="right" style="width: 130px">备案日期：</td>
							<td>
								<input name="recordDate" id="recordDate" class="mini-monthpicker" required="true" style="width: 250px" />
							</td>
							<td align="right" style="width: 130px">填报人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" />
								<input id="createUser" class="nui-textbox" enabled="false" style="width: 250px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">内协外联：</td>
							<td>
								<input name="bidNxwl" id="bidNxwl" class="nui-dictcombobox" dictTypeId="ZH_BID_NXWL" style="width: 250px" required="true" />
							</td>
							<td align="right" style="width: 130px">甲方全称：</td>
							<td colspan="3">
								<input name="custId" allowInput="false" id="custId" class="nui-buttonedit" onbuttonclick="selectCustInfo" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">项目名称：</td>
							<td colspan="5">
								<input name="projectName" id="projectName" class="nui-textbox" style="width: 100%" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">投资额(万元)：</td>
							<td>
								<input name="investAmount" id="investAmount" class="nui-textbox" style="width: 250px" required="true" emptyText="必填项，无数据请输入 / 字符填充" />
							</td>
							<td align="right" style="width: 130px">标的额：</td>
							<td>
								<input name="bidBde" id="bidBde" class="nui-dictcombobox" dictTypeId="ZH_BID_BDE" style="width: 250px" required="true" />
							</td>
							<td align="right" style="width: 130px">项目地点：</td>
							<td>
								<input name="projectPlace" id="projectPlace" class="nui-textbox" style="width: 250px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">集团内外：</td>
							<td>
								<input name="headquarterGroup" id="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 250px" required="true" />
							</td>
							<td align="right" style="width: 130px">特点：</td>
							<td>
								<input name="bidFeatures" id="bidFeatures" class="nui-dictcombobox" dictTypeId="ZH_BID_FEATURES" style="width: 250px" required="true" />
							</td>
							<td align="right" style="width: 130px">工程类别：</td>
							<td>
								<input name="projectType" id="projectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 250px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">专业类别：</td>
							<td>
								<input name="majorType" id="majorType" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 250px" required="true" />
							</td>
							<td align="right" style="width: 130px">服务范围：</td>
							<td>
								<input name="bidService" id="bidService" class="nui-dictcombobox" dictTypeId="ZH_BID_SERVICE" style="width: 250px" required="true" />
							</td>
							<td align="right" style="width: 130px">合同类型：</td>
							<td>
								<input name="contractType" id="contractType" class="nui-dictcombobox" dictTypeId="ZH_BID_CONTRACT_TYPE" style="width: 250px" required="true" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">主要项目特征：</td>
							<td colspan="3">
								<input name="projectFeatures" id="projectFeatures" class="nui-textbox" style="width: 100%" required="true" emptyText="必填项，无数据请输入 / 字符填充" />
							</td>
							<td align="right" style="width: 130px">采购方式：</td>
							<td>
								<input name="procurementType" id="procurementType" class="nui-dictcombobox" dictTypeId="ZH_BID_PROCUREMENT_TYPE" style="width: 250px" required="true" />
							</td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset id="field6" style="border: solid 1px #aaa;">
				<legend style="color: red">最终需完善的信息 - 下面的信息全部填写后数据完善度将变更为 '已完善' </legend>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">参与单位：</td>
							<td colspan="3">
								<input name="bidUnits" id="bidUnits" class="nui-textboxlist" dataField="bidUnits" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryBidUnits.biz.ext" valueField="dictid"
									textField="dictname" inputMode="false" style="width: 638px" />
							</td>
							<td align="right" style="width: 140px">报价/合同价/万元/%：</td>
							<td>
								<input name="contractPrice" id="" contractPrice"" class="nui-textbox" style="width: 100%" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">价格模式：</td>
							<td>
								<input name="contractModel" id="contractModel" class="nui-dictcombobox" dictTypeId="CONTRACT_MODEL" style="width: 250px" />
							</td>
							<td align="right" style="width: 130px">折合万/人月：</td>
							<td>
								<input name="bidConvert" id="bidConvert" class="nui-textbox" style="width: 250px" emptyText="无数据请输入 / 字符填充" />
							</td>
							<td align="right" style="width: 130px">中标结果：</td>
							<td>
								<input name="bidResult" id="bidResult" class="nui-dictcombobox" dictTypeId="ZH_BID_RESULT" style="width: 250px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">备注：</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" style="width: 100%" emptyText="填写要求：
写明报价条件（如最高限价/预算、要求人月数、依据某规定报折扣率）、商务分计算规则、中标人及我方排名、暂定总价时的报价折扣率或新能源的单价水平等"/>
							</td>
						</tr>						
					</table>
				</div>
			</fieldset>
		</form>

		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>竞争对手情况</legend>
			<div>
				<div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
					<table style="width: 100%;">
						<tr>
							<td style="width: 100%;">
								<a class="nui-button" iconCls="icon-add" onclick="addRow()" plain="true">增加</a>
								<a class="nui-button" iconCls="icon-remove" onclick="removeRow()" plain="true">删除</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div id="datagrid2" class="nui-datagrid" style="width: 100%; height: 150px;" allowCellEdit="true" allowCellSelect="true" multiSelect="true" allowSortColumn="false" showPager="false">
				<div property="columns">
					<div type="checkcolumn" width="5"></div>
					<div field="competId" displayField="competName" headerAlign="center">
						竞争对手单位全称
						<input property="editor" allowInput="false" class="nui-buttonedit" onbuttonclick="selectCompetInfo" style="width: 100%" required="true"/>
					</div>
					<div field="competContractPrice" headerAlign="center">
						报价/合同价/万元/%
						<input property="editor" class="nui-textbox" style="width: 100%;" required="true" />
					</div>
				</div>
			</div>
		</fieldset>
		
		<fieldset id="field5" style="border: solid 1px #aaa;">
			<legend>上传附件</legend>
			<jsp:include page="/ame_common/inputFile.jsp" />
		</fieldset>
	</div>
	
	<div style="text-align: center; position: relative; bottom: 10px" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px; margin-right: 20px;" iconCls="icon-save">保存</a>
		<a class="nui-button" onclick="closeCancel()" id="saveReimbProcess" style="width: 80px; margin-right: 140px;" iconCls="icon-close">关闭</a>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid2 = nui.get("datagrid2");
		
		function setEditData(data) {
			form.setData(data);
			queryBidCompet(data.id);
			nui.get('createUser').setValue(data.empname);
			nui.get('custId').setText(data.custname);
			nui.get('bidUnits').setValue(data.bidUnitsCode);
			nui.get('bidUnits').setText(data.bidUnitsName);
			var grid_0 = nui.get("grid_0");
			grid_0.load({
				"groupid" : "BID_INFO",
				"relationid" : data.id
			});
			grid_0.sortBy("fileTime", "desc");		
		}
		
		function queryBidCompet(bidId){
			nui.ajax({
				url : "com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryBidCompetByBidId.biz.ext",
				type : "post",
				contentType : 'text/json',
				data : {
					"bidId" : bidId
				},
				success : function(result) {
					grid2.setData(result.data);
				}
			})
		}
		
		function selectCustInfo(){
			var custIdBtnEdit = this;
			mini.open({
				url : "/default/marketInfo/bid/selectCustInfo.jsp",
				title : "选择甲方客户（请先查找客户，如不存在再新增）",
				width : '500',
				height : '530',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						if (data) {
							custIdBtnEdit.setValue(data.custid);
							custIdBtnEdit.setText(data.custname);
							custIdBtnEdit.focus();
							custIdBtnEdit.blur();
						}
					}
				}
			});
		}
		
		function addRow() {
			var newRow = {
				name : "New Compet"
			};
			var index = grid2.getData().length;
			grid2.addRow(newRow, index+1);
			grid2.beginEditRow(newRow);
		}
		
		function removeRow(){
			var rows = grid2.getSelecteds();
			if (rows.length > 0) {
				grid2.removeRows(rows, false);
			}
		}
		
		function selectCompetInfo(){
			var competIdBtnEdit = this;
			mini.open({
				url : "/default/marketInfo/bid/selectCompetInfo.jsp",
				title : "选择竞争对手（请先查找竞争对手，如不存在再新增）",
				width : '500',
				height : '530',
				ondestroy : function(action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = mini.clone(data); //必须
						if (data) {
							competIdBtnEdit.setValue(data.competId);
							competIdBtnEdit.setText(data.competName);
							competIdBtnEdit.focus();
							competIdBtnEdit.blur();
						}
					}
				}
			});
		}				
		
		function onOk() {
			if (!form.validate()) {
				showTips("请检查表单的完整性!", "danger");
				return;
			}
			var compets = grid2.getData();
			if (compets.length > 0) {
				var competsStr = JSON.stringify(compets);
				var competsJson = JSON.parse(competsStr);
				for (var i = 0; i < competsJson.length; i++) {
					if (competsJson[i].competId == undefined || competsJson[i].competId == "") {
						showTips("请填写竞争对手情况中的 '竞争对手单位全称' 字段!", "danger");
						return;
					}
					if (competsJson[i].competContractPrice == undefined || competsJson[i].competContractPrice == "") {
						showTips("请填写竞争对手情况中的 '报价/合同价/万元/%' 字段!", "danger");
						return;
					}
				}
			}
			document.getElementById("fileCatalog").value = "BidInfo";
			form2.submit();
		}

		function SaveData() {
			var data = form.getData();
			data.files = nui.get("fileids").getValue();
			data.bidUnitsCode = nui.get("bidUnits").getValue();
			data.bidUnitsName = nui.get("bidUnits").getText();
			data.recordDate = nui.get("recordDate").getValue() + "-01";
			data.updateDate = getTimeStamp();
			var compets = grid2.getData();
			delete data.criteria;
			var json = nui.encode({
				'bidInfo' : data,
				'compets' : compets
			});
			ajaxCommon({
				"url" : "com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.editBidInfo.biz.ext",
				"data" : json,
				"success" : function(data) {
					if (data.result == "1") {
						showTips("编辑市场经营信息成功");
						closeOk();
					} else {
						showTips("编辑市场经营信息失败，请联系管理员！", "danger");
					}
				}
			});
		}

		function getTimeStamp() {
			var now = new Date();
			return (now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + (now.getDate()) + " " + now.getHours() + ':'
					+ ((now.getMinutes() < 10) ? ("0" + now.getMinutes()) : (now.getMinutes())) + ':' + ((now.getSeconds() < 10) ? ("0" + now.getSeconds()) : (now.getSeconds())));
		}
	</script>	
	
</html>