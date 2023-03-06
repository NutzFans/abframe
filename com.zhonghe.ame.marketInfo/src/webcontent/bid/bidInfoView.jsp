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
<title>市场经营信息</title>
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
								<input name="bidOrg" id="bidOrg" class="nui-dictcombobox" dictTypeId="ZH_BID_ORG" style="width: 250px" required="true" enabled="false"/>
							</td>
							<td align="right" style="width: 130px">备案日期：</td>
							<td>
								<input name="recordDate" id="recordDate" class="nui-monthpicker" required="true" style="width: 250px" enabled="false" />
							</td>
							<td align="right" style="width: 130px">填报人：</td>
							<td>
								<input name="createUserid" id="createUserid" class="nui-hidden" />
								<input id="createUser" class="nui-textbox" enabled="false" style="width: 250px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">内协外联：</td>
							<td>
								<input name="bidNxwl" id="bidNxwl" class="nui-dictcombobox" dictTypeId="ZH_BID_NXWL" style="width: 250px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">甲方全称：</td>
							<td colspan="3">
								<input name="custId" allowInput="false" id="custId" class="nui-buttonedit" onbuttonclick="selectCustInfo" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">项目名称：</td>
							<td colspan="5">
								<input name="projectName" id="projectName" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">投资额(万元)：</td>
							<td>
								<input name="investAmount" id="investAmount" class="nui-textbox" style="width: 250px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">标的额：</td>
							<td>
								<input name="bidBde" id="bidBde" class="nui-dictcombobox" dictTypeId="ZH_BID_BDE" style="width: 250px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">项目地点：</td>
							<td>
								<input name="projectPlace" id="projectPlace" class="nui-textbox" style="width: 250px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">集团内外：</td>
							<td>
								<input name="headquarterGroup" id="headquarterGroup" class="nui-dictcombobox" dictTypeId="ZH_GROUP" style="width: 250px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">特点：</td>
							<td>
								<input name="bidFeatures" id="bidFeatures" class="nui-dictcombobox" dictTypeId="ZH_BID_FEATURES" style="width: 250px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">工程类别：</td>
							<td>
								<input name="projectType" id="projectType" class="nui-dictcombobox" dictTypeId="ZH_PROJECT_TYPE" style="width: 250px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">专业类别：</td>
							<td>
								<input name="majorType" id="majorType" class="nui-dictcombobox" dictTypeId="ZH_MAJOR_TYPE" style="width: 250px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">服务范围：</td>
							<td>
								<input name="bidService" id="bidService" class="nui-dictcombobox" dictTypeId="ZH_BID_SERVICE" style="width: 250px" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">合同类型：</td>
							<td>
								<input name="contractType" id="contractType" class="nui-dictcombobox" dictTypeId="ZH_BID_CONTRACT_TYPE" style="width: 250px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">主要项目特征：</td>
							<td colspan="3">
								<input name="projectFeatures" id="projectFeatures" class="nui-textbox" style="width: 100%" required="true" enabled="false" />
							</td>
							<td align="right" style="width: 130px">采购方式：</td>
							<td>
								<input name="procurementType" id="procurementType" class="nui-dictcombobox" dictTypeId="ZH_BID_PROCUREMENT_TYPE" style="width: 250px" required="true" enabled="false" />
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">创建时间：</td>
							<td>
								<input name="createDate" id="createDate" class="nui-datepicker" format="yyyy-MM-dd HH:mm:ss" required="true" style="width: 250px" enabled="false" />
							</td>
							<td align="right" style="width: 130px">最后更新人：</td>
							<td>
								<input name="updatename" id="updatename" class="nui-textbox" required="true" style="width: 250px" enabled="false" />
							</td>
							<td align="right" style="width: 130px">最后更新时间：</td>
							<td>
								<input name="updateDate" id="updateDate" class="nui-datepicker" format="yyyy-MM-dd HH:mm:ss" required="true" style="width: 250px" enabled="false" />
							</td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset id="field6" style="border: solid 1px #aaa;">
				<legend>最终需完善的信息 - 下面的信息全部填写后数据完善度将变更为 '已完善' </legend>
				<div style="padding: 5px;">
					<table style="table-layout: fixed;">
						<tr>
							<td align="right" style="width: 130px">参与单位：</td>
							<td colspan="3" style="background: #f0f0f0">
								<input name="bidUnits" id="bidUnits" class="nui-textboxlist" dataField="bidUnits" url="com.zhonghe.ame.marketInfo.marketinfo.khxx.bid.queryBidUnits.biz.ext" valueField="dictid"
									textField="dictname" inputMode="false" style="width: 638px" enabled="false" />
							</td>
							<td align="right" style="width: 140px">报价/合同价/万元/%：</td>
							<td>
								<input name="contractPrice" id="" contractPrice"" class="nui-textbox" style="width: 100%"  enabled="false"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">价格模式：</td>
							<td>
								<input name="contractModel" id="contractModel" class="nui-dictcombobox" dictTypeId="CONTRACT_MODEL" style="width: 250px"  enabled="false"/>
							</td>
							<td align="right" style="width: 130px">折合万/人月：</td>
							<td>
								<input name="bidConvert" id="bidConvert" class="nui-textbox" style="width: 250px"  enabled="false"/>
							</td>
							<td align="right" style="width: 130px">中标结果：</td>
							<td>
								<input name="bidResult" id="bidResult" class="nui-dictcombobox" dictTypeId="ZH_BID_RESULT" style="width: 250px"  enabled="false"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 130px">备注：</td>
							<td colspan="5">
								<input name="remark" class="nui-textarea" style="width: 100%" enabled="false"/>
							</td>
						</tr>						
					</table>
				</div>
			</fieldset>
		</form>

		<fieldset id="field3" style="border: solid 1px #aaa;">
			<legend>竞争对手情况</legend>
			<div id="datagrid2" class="nui-datagrid" style="width: 100%; height: 150px;" allowCellEdit="true" allowCellSelect="true" multiSelect="true" allowSortColumn="false" showPager="false">
				<div property="columns">
					<div field="competId" displayField="competName" headerAlign="center">
						竞争对手单位全称
					</div>
					<div field="competContractPrice" headerAlign="center">
						报价/合同价/万元/%
					</div>
				</div>
			</div>
		</fieldset>
		
		<fieldset id="field5" style="border: solid 1px #aaa;">
			<legend>相关附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp" />
		</fieldset>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
		var grid2 = nui.get("datagrid2");
		
		function setViewData(data) {
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
	</script>	
	
</html>