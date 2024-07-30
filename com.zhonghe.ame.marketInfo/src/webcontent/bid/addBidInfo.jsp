<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}

body .mini-textboxlist {
	border-collapse: collapse;
}
</style>
<head>
<title>新增市场经营信息</title>
</head>
<body>
	<div class="nui-fit" style="padding: 5px">
		<form id="form1" method="post">
			<fieldset id="field1" style="border: solid 1px #aaa;">
				<legend>市场经营信息</legend>
				<input name="files" id="fileids" class="nui-hidden" />
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">牵头部门：</td>
							<td>
								<input name="bidOrg" id="bidOrg" class="nui-dictcombobox" dictTypeId="ZH_BID_ORG" style="width: 250px" required="true" />
							</td>
							<td align="right" style="width: 130px">备案日期：</td>
							<td>
								<input name="recordDate" id="recordDate" class="mini-datepicker" required="true" style="width: 250px" />
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
								<span class="mini-buttonedit-border" style="padding-left: 0px; padding-right: 0px">
									<input name="custInfo" id="custInfo" class="nui-textboxlist" style="width: 620px" dataField="custinfos" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryCustByNameInfo.biz.ext"
										valueField="custid" textField="custname" allowInput="false" />
									<span class="mini-buttonedit-buttons">
										<span class="mini-buttonedit-close"></span>
										<span class="mini-buttonedit-button" onclick="selectCustInfo()" onmouseover="mini.addClass(this, 'mini-buttonedit-button-hover');"
											onmouseout="mini.removeClass(this, 'mini-buttonedit-button-hover');">
											<span class="mini-buttonedit-icon"></span>
										</span>
									</span>
								</span>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">项目名称：</td>
							<td colspan="3">
								<input name="projectName" id="projectName" class="nui-textbox" style="width: 100%" required="true" />
							</td>
							<td align="right" style="width: 130px">集团或二级单位：</td>
							<td>
								<span data-placement="right" data-tooltip="1、集团内请选择甲方全称对应二级单位。<br>2、集团合同/大合同可以选择集团或甲方全称对应二级单位">
									<input name="twoOrg" id="twoOrg" class="nui-dictcombobox" dictTypeId="ZH_BID_TWO_ORG" style="width: 250px" emptyText="集团内外:集团内/合同/大合同 时必填" showNullItem="true" />
								</span>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">投资额(万元)：</td>
							<td>
								<span data-placement="right" data-tooltip="注意：单位为万元">
									<input name="investAmount" id="investAmount" class="nui-textbox" style="width: 250px" required="true" emptyText="必填项，只允许出现数字或'未知'字眼" />
								</span>
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
							<td colspan="5">
								<input name="bidUnits" id="bidUnits" class="nui-textboxlist" dataField="bidUnits" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryBidUnits.biz.ext" valueField="dictid"
									textField="dictname" inputMode="false" style="width: 710px" />
							</td>
							<td align="right" style="width: 140px">合同价(万元/%)：</td>
							<td>
								<input name="contractPrice" id="" contractPrice"" class="nui-textbox" style="width: 165px" />
							</td>
							<td rowspan="3" style="padding-left: 10px">
								备注填写参考：限价656万，基准价=报价平均值的90%=满分50分（高1%扣0.5，低1%扣0.2）。工期300天，要求312人月/实际投入20人月（兼职），最终按照合同约定综合单价及实际发生工作量结算。固定单价合同1.3万/MV（35万/人年，1000元/人天），据实结算。发改价格[2007]670号文取费*95%。XXX中标，我方排名第2。</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">价格模式：</td>
							<td>
								<input name="contractModel" id="contractModel" class="nui-dictcombobox" dictTypeId="CONTRACT_MODEL" style="width: 165px" />
							</td>
							<td align="right" style="width: 100px">折合万/人月：</td>
							<td>
								<input name="bidConvert" id="bidConvert" class="nui-textbox" style="width: 165px" emptyText="无数据请输入 / 字符填充" />
							</td>
							<td align="right" style="width: 100px">定标时间：</td>
							<td>
								<input name="bidDate" id="bidDate" class="mini-datepicker" style="width: 165px" />
							</td>
							<td align="right" style="width: 100px">中标结果：</td>
							<td>
								<input name="bidResult" id="bidResult" class="nui-dictcombobox" dictTypeId="ZH_BID_RESULT" style="width: 165px" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px">备注：</td>
							<td colspan="7">
								<input name="remark" class="nui-textarea" style="width: 100%" emptyText="填写要求：
写明报价条件（如最高限价/预算、要求人月数、依据某规定报折扣率）、商务分计算规则、中标人及我方排名、暂定总价时的报价折扣率或新能源的单价水平等" />
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
						<input property="editor" allowInput="false" class="nui-buttonedit" onbuttonclick="selectCompetInfo" style="width: 100%" required="true" />
					</div>
					<div field="competContractPrice" headerAlign="center">
						合同价(万元/%)
						<input property="editor" class="nui-textbox" style="width: 100%;" required="true" />
					</div>
					<div field="competResult" headerAlign="center" renderer="ZH_BID_RESULT">
						中标结果
						<input property="editor" class="nui-dictcombobox" dictTypeId="ZH_BID_RESULT" style="width: 100%;" required="true" />
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
		var tip = new mini.ToolTip();
		tip.set({
			target : document,
			selector : '[data-tooltip], [data-placement]'
		});
		nui.parse();
		var form = new nui.Form("#form1");
		var grid2 = nui.get("datagrid2");

		$("input[name='custInfo']").parent("td").attr("style", "border: 0px; background: #FFFFE6;")

		init();

		function init() {
			nui.get("createUserid").setValue(userId);
			nui.get("createUser").setValue(userName);
		}

		function selectCustInfo() {
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
						var custid = nui.get("custInfo").getValue();
						var custname = nui.get("custInfo").getText();
						if (custid != "" && custname != "") {
							custid = custid + "," + data.custid;
							custname = custname + "," + data.custname;
						} else {
							custid = data.custid;
							custname = data.custname;
						}
						nui.get("custInfo").setValue("" + custid + "");
						nui.get("custInfo").setText("" + custname + "");
					}
				}
			});
		}

		function addRow() {
			var newRow = {
				name : "New Compet"
			};
			var index = grid2.getData().length;
			grid2.addRow(newRow, index + 1);
			grid2.beginEditRow(newRow);
		}

		function removeRow() {
			var rows = grid2.getSelecteds();
			if (rows.length > 0) {
				grid2.removeRows(rows, false);
			}
		}

		function selectCompetInfo() {
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
			var custId = nui.get("custInfo").getValue();
			var custName = nui.get("custInfo").getText();
			if (isBank(custId) || isBank(custName)) {
				showTips("请填写 '甲方全称' 字段内容 !", "danger");
				return;
			}
			var regexpNum = new RegExp(/^[0-9\.]+$/);
			var investAmount = nui.get("investAmount").getValue();
			if (!regexpNum.test(investAmount)) {
				if (!(investAmount == "未知")) {
					showTips("请检查 '投资额(万元)' 字段，只允许出现数字或'未知'字眼!", "danger");
					return;
				}
			}
			var headquarterGroup = nui.get("headquarterGroup").getText();
			if (!(headquarterGroup == "集团外")) {
				var twoOrg = nui.get("twoOrg").getValue();
				if (isBank(twoOrg)) {
					showTips("'二级单位' 字段必须填写（'集团内外' 字段值为：集团内、集团合同、集团大合同 时）!", "danger");
					return;
				} else {
					if (headquarterGroup == "集团内" && twoOrg == "中国核工业集团有限公司") {
						showTips("'集团内外' 字段值为 '集团内' 时，'集团或二级单位' 字段不能选择集团!", "danger");
						return;
					}
				}
			}
			var bidResult = nui.get("bidResult").getValue();
			if(!isBank(bidResult)){
				var bidDate = nui.get("bidDate").getValue();
				if(isBank(bidDate)){
					showTips("请填写 '定标时间' 字段内容 !", "danger");
					return;					
				}
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
			data.custId = nui.get("custInfo").getValue();
			data.custName = nui.get("custInfo").getText();
			data.bidUnitsCode = nui.get("bidUnits").getValue();
			data.bidUnitsName = nui.get("bidUnits").getText();
			data.recordDate = nui.get("recordDate").getValue() + "-01";
			data.createDate = getTimeStamp();
			var compets = grid2.getData();
			delete data.criteria;
			var json = nui.encode({
				'bidInfo' : data,
				'compets' : compets
			});
			ajaxCommon({
				"url" : "com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.addBidInfo.biz.ext",
				"data" : json,
				"success" : function(data) {
					if (data.result == "1") {
						showTips("新增市场经营信息成功");
						closeOk();
					} else if (data.result == "3") {
						showTips("已存在相同数据无法新增，请联系企发部咨询", "danger");
					} else {
						showTips("新增市场经营信息失败，请联系管理员！", "danger");
					}
				}
			});
		}

		function getTimeStamp() {
			var now = new Date();
			return (now.getFullYear() + '-' + (now.getMonth() + 1) + '-' + (now.getDate()) + " " + now.getHours() + ':'
					+ ((now.getMinutes() < 10) ? ("0" + now.getMinutes()) : (now.getMinutes())) + ':' + ((now.getSeconds() < 10) ? ("0" + now.getSeconds()) : (now.getSeconds())));
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