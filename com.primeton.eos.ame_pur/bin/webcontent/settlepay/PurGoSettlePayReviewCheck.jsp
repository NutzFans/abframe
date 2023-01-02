<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2016-06-03 12:50:57
  - Description:
-->
<head>
	<title>商务合规审核、结算单财务复核</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js"
		type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<%long workItemID = (Long)request.getAttribute("workItemID"); %>
	<div class="nui-fit">
		<!-- 提示信息展示 -->
		<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
		<form id="form1" method="post">
			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
				<legend>外包结算基本信息</legend>
				<input class="nui-hidden" name="workitemid" id="workitemid" value="<%=workItemID %>"/>
				<input name="purSettle.settlementid" id="settlementid" class="nui-hidden"/>
				<input name="purSettle.fileids" id="fileids1" class="nui-hidden"/>
				<input name="misOpinion.fileids" class="nui-hidden"/>
				<input name="purSettle.setstatus" id="setstatus" class="nui-hidden"/>
				<input name="purSettle.processinstid" id="processinstidSettle" class="nui-hidden" />
				<input name="misOpinion.processinstid" id="processinstid2" class="nui-hidden" />
				<!-- 供应商简称 -->
				<input name="purSettle.suppliersname" id="suppliersname" class="nui-hidden" />
				<!-- 工作量数量 -->
				<input name="purSettle.workamount" id="workamount" class="nui-hidden" />
				<!-- 项目ID -->
				<input name="purSettle.projectid" id="projectid" class="nui-hidden" />
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">项目：</td>
							<td>
								<input name="purSettle.projectno" readOnly="readOnly" showButton="false" id="projectno" valueField="projectNo" textField="projectName" class="nui-buttonedit" required="false" style="width:240px" />
								<a href="javascript:void(0)" onclick='detailProj1();' title='点击查看项目信息'>查看</a>
							</td>
							<td align="right" style="width:120px;">客户：</td>
							<td><input name="purSettle.custno" readOnly="readOnly" showButton="false" id="custno" valueField="miscustid" textField="custname" class="nui-combobox" required="false" style="width:240px;" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">供应商：</td>
							<td><input id="custid" class="nui-combobox" required="false" style="width:240px" 
								readOnly="readOnly" showButton="false" allowInput="false" />
							</td>
							<td align="right" style="width:120px;">受益部门：</td>
							<td><input name="purSettle.benefitid" readOnly="readOnly" showButton="false" id="benefitid" class="nui-buttonedit" required="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">结算周期开始日期：</td>
							<td><input name="purSettle.startdate" id="startdate" readOnly="readOnly" showButton="false" class="nui-datepicker" required="false" style="width:100px"/></td>
							<td align="right" style="width:120px;">结算周期截止日期：</td>
							<td><input name="purSettle.enddate" id="enddate" readOnly="readOnly" showButton="false" class="nui-datepicker" required="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">工作量单位：</td>
							<td><input name="purSettle.workunit" id="workunit" readOnly="readOnly" showButton="false" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" required="false" style="width:50px" /></td>
							<td align="right" style="width:120px;">工作量数量：</td>
							<td><input name="purSettle.workamount" id="workamount" readOnly="readOnly" class="nui-textbox" dictTypeId="CONT_ORG" required="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">工作量技术确认人：</td>
							<td><input name="purSettle.confper" id="confper" readOnly="readOnly" class="nui-textbox" required="false" style="width:100px"/></td>
							<td align="right" style="width:120px;">财务对应合同编号：</td>
							<td><input name="purSettle.contnum" id="contnum" onbuttonclick="selectCont" class="nui-buttonedit" required="false" style="width:120px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">成本归属类型：</td>
							<td colspan="3"><input name="purSettle.costtype" id="costtype" class="nui-dictcombobox" dictTypeId="AME_CONTCOSTTYPE" required="true" style="width:100px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">备注：</td>
							<td colspan="3"><input name="purSettle.comment" id="comment" readOnly="readOnly" class="nui-textarea" required="false" style="width:440px"/></td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>外包人员结算信息</legend>
				<div id="datagridOutperson" class="nui-datagrid" style="width:100%;height:auto;" multiSelect="true" 
			    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" allowSortColumn="false"
			    	onselect="onSelect" ondeselect="onDeselect" onlyCheckSelection="true">
					<div property="columns">
						<div field="setdetailid" width="80" align="center" headerAlign="center" allowSort="true" visible="false">结算明细id</div>
						<div field="purorderid" align="center" headerAlign="center" allowSort="true" visible="false">采购订单编号</div>
						<div field="outperno" align="center" headerAlign="center" allowSort="true" visible="false">编号</div>
						<div field="outpername" width="60" align="center" headerAlign="center" allowSort="true" >姓名</div>	
						<div field="setstartdate" width="80" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">
							结算开始日期
						</div>
						<div field="setenddate" width="80" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">
							结算截止日期
						</div>
						<div field="days" width="67" align="center" headerAlign="center" allowSort="true">
							工作日统计
						</div>
						<div field="months" width="45" align="center" headerAlign="center" allowSort="true">
							人月数
						</div>
						<div field="price" width="75" dataType="currency" align="right" headerAlign="center" allowSort="true">人月单价</div>
						<div field="setfee" width="80" dataType="currency" align="right" headerAlign="center" allowSort="true">
							工时结算费用
						</div>
						<div field="othfee" width="60" dataType="currency" align="right" headerAlign="center" allowSort="true">
							其他费用
						</div>
						<div field="totalfee" summaryType="sum" dataType="currency" width="90" dataType="currency" align="right" headerAlign="center" allowSort="true">
							结算费用小计
						</div>
						<div field="score" width="42" align="center" headerAlign="center" allowSort="true">
							打分
						</div>
						<div field="evaluate" width="75" align="center" headerAlign="center" allowSort="true">
							评价
						</div>
						<div field="purordernum" width="135" align="center" headerAlign="center" allowSort="true">订单编号</div>
						<div field="purstatus" width="65" renderer="dictGetOrderStatus" align="center" headerAlign="center" allowSort="true">订单状态</div>
					</div>
				</div>
				<div style="width:800px;height:55px;margin-left:155px;float:left;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:100px;">总计：</td>
							<td id="daystotal" style="width:63px;" align="center" ></td>
							<td id="monthstotal" style="width:44px;" align="center" ></td>
							<td align="right" style="width:242px;">结算费用总计：</td>
							<td id="sumtotal" style="width:87px;" align="right" ></td>
						</tr>
						<tr>
							<td colspan="3"></td>
							<td align="right" style="width:210px;">结算最终总金额：</td>
							<td><input name="purSettle.setamount" id="setamount" readOnly="readOnly" inputStyle="text-align:right;" vtype="float" class="nui-textbox" required="false" style="width:89px" /></td>
						</tr>
					</table>
				</div>
			</fieldset>
			
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;width: 1250px;">
				<legend>计提核销信息</legend>
				<div id="datagrid2" class="nui-datagrid" dataField="purPresettles" style="width:100%;height:auto;" 
			    	url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleListToSettle.biz.ext" multiSelect="true"
			    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" 
			    	onselect="onSelectPre" ondeselect="onDeselectPre" 
			    	onlyCheckSelection="true" allowSortColumn="false">
					<div property="columns">
						<div type="checkcolumn" width="30"></div>
						<div field="accruedid" width="60" headerAlign="center" allowSort="true" visible="true">计提编号</div>
						<div field="contnum" width="100" headerAlign="center" allowSort="true" visible="true">财务合同编号</div>
		                <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商编号</div>
		                <div field="custname" headerAlign="center" allowSort="true" visible="false">供应商名称</div>
		                <div field="suppliersname" width="80" headerAlign="center" allowSort="true" >供应商简称</div>
		                <div field="projectno" headerAlign="center" allowSort="true" visible="false">项目代码</div>
		                <div field="projectname" headerAlign="center" allowSort="true" visible="false">项目名称</div>
		                <div field="salesid" headerAlign="center" allowSort="true" visible="false" >所属销售ID</div>
		                <div field="orgname" headerAlign="center" allowSort="true" width="60" align="center" >所属销售</div>
		                <div field="syb" headerAlign="center" allowSort="true" width="95" renderer="dictGetContOrg" >所属事业部</div>
		                <div field="contnum" headerAlign="center" allowSort="true" visible="false">销售合同</div>
		                
		                <div field="workunit" width="70" align="center" headerAlign="center" allowSort="true" renderer="dictGetWorkunit">工作量单位</div>
		                <div field="workamount" width="70" align="center" headerAlign="center" allowSort="true" >工作量数量</div>
		                
		                <div field="startdate" headerAlign="center" allowSort="true" width="75" align="center" >开始日期</div>
		                <div field="enddate" headerAlign="center" allowSort="true" width="75" align="center" >结束日期</div>
		                <div field="accruedmoney" headerAlign="center" allowSort="true" width="80" align="right" dataType="currency" >计提金额</div>
		                <div field="notaxmoney" headerAlign="center" allowSort="true" width="80" align="right" dataType="currency" >不含税金额</div>
		                <div field="costtype" headerAlign="center" allowSort="true" renderer="dictGetCostType" width="60" align="center" >成本类型</div>
		                <div field="outper" headerAlign="center" allowSort="true" width="90" >相关外包人员</div>
		                <div field="accrueddate" headerAlign="center" allowSort="true" width="75" align="center" dateFormat="yyyy-MM-dd" >计提时间</div>
		                <div field="accruedstatus" headerAlign="center" allowSort="true" renderer="dictGetStatus" width="120" align="center" >状态</div>
		                <div field="settlementid" headerAlign="center" allowSort="true" visible="false" >结算单编号</div>
		                <div name="action" width="110" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>
		                <div field="comment" width="120" headerAlign="center" allowSort="true" >备注</div>
					</div>
				</div>
				<div style="width: 600px;height: 25px;margin-left: 285px;float: left;">
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width:195px;">总计：</td>
						<td id="sumtotalworkamount" style="width:60px;" align="right" ></td>
						<td style="width: 150px;"></td>
						<td id="sumtotalpre" style="width:87px;" align="right" ></td>
						<td id="sumNottotalpre" style="width:78px;" align="right" ></td>
					</tr>
				</table>
				</div>
			</fieldset>
			<fieldset id="field6" style="border: solid 1px #aaa;padding: 3px;">
				<legend>冲销记录</legend>
				<div>
					<div class="nui-CheckBox" name="purOutcost.checkSure" id="checkSure" onclick="checkSure()" checked="true" text="是否增加计提冲销记录" trueValue="1" falseValue="0"></div>
					<input name="purOutcost.contnum" id="purOutcostContnum" class="nui-hidden" />
					<input name="purOutcost.outcosttype" id="purOutcostOutcosttype" class="nui-hidden" />
					<input name="purOutcost.settlementid" id="purOutcostSettlementid" class="nui-hidden" />
					<input name="purOutcost.accruedid" id="purOutcostAccruedid" class="nui-hidden" />
					<input name="purOutcost.startdate" id="purOutcostStartdate" class="nui-hidden" />
					<input name="purOutcost.enddate" id="purOutcostEnddate" class="nui-hidden" />
					<input name="purOutcost.supplierid" id="purOutcostSupplierid" class="nui-hidden" />
					<input name="purOutcost.outcoststatus" id="purOutcostOutcoststatus" class="nui-hidden" value="1" />
					<input name="purOutcost.confirmdate" id="purOutcostConfirmdate" class="nui-hidden" />
					<input name="purOutcost.pzhs" id="purOutcostPzhs" class="nui-hidden" />
					<table style="table-layout:fixed;" id="table_file2">
						<tr>
							<td align="right" style="width:140px;" id="a1">成本结转金额(含税)：</td>
							<td><input name="purOutcost.taxmon" id="purOutcostTaxmon" onblur="changePurOutcostTax" required="true" class="nui-textbox" inputStyle="text-align: right;" style="width: 100px;" /></td>
							<td align="right" style="width:100px;" id="a2">税率：</td>
							<td id="a7"><input name="purOutcost.tax" id="purOutcostTax" onblur="changePurOutcostTax" class="nui-textbox" required="true" inputStyle="text-align: right;" style="width: 50px;" />%</td>
							<td align="right" style="width:140px;" id="a3">成本结转金额(不含税)：</td>
							<td><input name="purOutcost.notaxmon" id="purOutcostNotaxmon" required="true" class="nui-textbox" inputStyle="text-align: right;" style="width: 100px;" /></td>
						</tr>
						<tr>
							<td align="right" style="width:140px;" id="a4">工作量单位：</td>
							<td><input name="purOutcost.workunit" id="purOutcostWorkunit" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" style="width: 100px;" inputStyle="text-align: right;"/></td>
							<td align="right" style="width:100px;" id="a5">工作量数量：</td>
							<td><input name="purOutcost.workamount" id="purOutcostWorkamount" onblur="changePurOutcostTax" class="nui-spinner" showButton="false" 
									allowLimitValue="false" changeOnMousewheel="false" style="width: 50px;" inputStyle="text-align: right;"/></td>
							<td align="right" style="width:140px;" id="a6">成本说明：</td>
							<td><input name="purOutcost.costmemo" id="costmemo" class="nui-combobox" multiSelect="false" required="true" inputStyle="text-align: right;" 
							style="width: 100px;" showNullItem="true" textField="dictname" valueField="dictid" dataField="costmemos"/></td>
							<td align="right" style="width:100px;" id="a8">单价：</td>
							<td><input id="purOutcostUnitprice" class="nui-textbox"  inputStyle="text-align: right;" style="width: 100px;" /></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
		<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
			<legend>外包结算附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
			<jsp:include page="/ame_common/addFiles1.jsp"/>
		</fieldset>
		<!-- 审核意见  -->
		<!-- 审核意见  -->
		<form id="opioionform" method="post">
			<input name="misOpinion.auditstatus" value="1" class="nui-hidden" />
		    <input name="misOpinion.processinstid" id="processinstid" class="nui-hidden" />
		    <input name="misOpinion.processinstname" id="processinstname" class="nui-hidden" />
		    <input name="misOpinion.activitydefid" id="activitydefid" class="nui-hidden" />
		    <input name="misOpinion.workitemid" id="workitemid" class="nui-hidden" />
		    <input name="misOpinion.workitemname" id="workitemname" class="nui-hidden" />
		    <input name="misOpinion.isshow" id="isshow" class="nui-hidden" />
			<input name="misOpinion.fileids" id="fileids"  class="nui-hidden"/>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
		        <legend>审批意见列表</legend>
	        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
				    url="com.primeton.eos.ame_pur.purContractProcess.queryAuditOpinions.biz.ext"  idField="id" allowResize="true"
				    allowAlternating="true" multiSelect="true" showPager="false" allowCellWrap="true">
				    <div property="columns">
				    	<div type="indexcolumn" headerAlign="center" width="30" >编号</div>
				        <div field="operatorname" width="50" headerAlign="center" align="center">处理人</div>
				        <div field="workitemname" width="80" align="center" headerAlign="center">处理环节</div>
				        <div field="auditstatus" renderer="onCheckRenderer" width="80" align="center" headerAlign="center">处理结果</div>
				        <div field="auditopinion" width="150" headerAlign="center">处理意见</div>
				        <div field="time" width="100" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">处理时间</div>
				        <div field="orgname" width="100" align="center" headerAlign="center">处理人所在机构</div>
				        <div field="files" renderer="onFileRenderer" width="100" hight="100"  align="center" headerAlign="center">附件</div>
				    </div>
				</div>
		        <div style="padding:5px;" id="opinionHide">
		            <table style="table-layout:fixed;">
		            	<tr>
		                    <td style="width:150px;" align="right">审核结果：</td>
		                    <td style="width:250px;">  
								<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
							</td> 
		                    <td style="width:366px;" align="right" colspan="2">
								<a class="nui-button" onclick="doSHZT" style="width:100px;margin-right:20px;">悬挂意见保存</a>
		                    </td>
		                </tr>
		                <tr id="choosehide">
		                    <td  style="width:150px;" align="right">回退到：</td> 
		                    <td style="width:140px;" colspan="3">
		                    	<input name="misOpinion.backTo" id="backTo" class="nui-combobox" valueField="id" textField="name" style="width:200px" required="true" />
		                    </td>
		                </tr>
		                <tr>
		                    <td style="width:150px;" align="right">审核意见：</td>
		                    <td style="width:300px;" colspan="3">
		                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height:40px;"/>
		                    </td>
		                </tr>
			            <!-- <tr>
		                    <td style="width:150px;" align="right">事业部审核人：</td>
		                    <td style="width:410px;" colspan="3">   
								<input id="sybcheckerid" class="mini-textboxlist"  name="misOpinion.sybcheckerid" searchField="name" style="width:180px;"
									url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
									textField="empname" valueField="userid" required="true"/>
		                    </td>
		                </tr> -->
		            </table>
		        </div>
		    </fieldset>
	    </form>
		<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
			<legend>审核意见附件</legend>
			<jsp:include page="/ame_common/addFiles.jsp"/>
		</fieldset>
		<div id="win1" class="nui-window" title="成本确认日期" style="width:100px;height:120px;" 
		    showMaxButton="true" showCollapseButton="true" showShadow="true"
		    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
	    	<div style="padding:5px;">
	    		<input name="purOutcost.confirmdate" id="confirmdate" class="nui-datePicker" style="width: 100px;margin-left: 10px;"/>
	    	</div>
		    <div property="footbar" style="padding:5px;margin-left: 10px;">
		        <input type='button' value='确定' onclick="sureDate()" style="vertical-align: bottom;"/>
		        <input type='button' value='关闭' onclick="hideWindow()" style="vertical-align: bottom;margin-left: 20px"/>
		    </div>
		</div>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	<jsp:include page="/ame_pur/settlepay/splitPreSettle.jsp"/>
	<script type="text/javascript">
		nui.parse();
	  	var form = new nui.Form("#form1");
	  	var opioionform = new nui.Form("#opioionform");
	  	var datagridOutperson = nui.get("datagridOutperson");
	  	var grid2 = nui.get("datagrid2");
	  	//计提状态为：确认计提审核中的计提总金额
		var sumAccruedmoney = 0;
		//计提状态为：确认计提审核中的工作量数量
		var sumWorkamount = 0;
	  	var dosuminit = 0;
	  	//事业部领导拼接
	  	var sybempllist = [];
	  	document.getElementById("choosehide").style.display="none";
		function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
		}
		var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
		nui.get("auditstatus").setData(dataStatus);
		nui.get("auditstatus").setValue("1");
	    nui.get("auditopinion").setValue("同意。");
	    //审核结果触发
	    function show(){
			var auditopinion = nui.get("auditopinion").getValue().trim();
			var auditstatus = nui.get("auditstatus").getValue();
			if(auditstatus=='0'){
				if(auditopinion=="同意。"){
					nui.get("auditopinion").setValue("");
				}
				chooselink();
			}else if(auditstatus=='1'){
				if(auditopinion==""){
					nui.get("auditopinion").setValue("同意。");
				}
				showNone();
			}else if(auditstatus=='2'){
				if(auditopinion=="同意。"){
					nui.get("auditopinion").setValue("");
				}
				showNone();
			}
		}
		function showNone(){
			nui.get("backTo").setValue("");
			document.getElementById("choosehide").style.display="none";
		}
		function chooselink(){
			document.getElementById("choosehide").style.display="";
		}
		//合同审批意见附件信息
		function onFileRenderer(e) {
	        var tempSrc = "";
	        for(var i=0;i<e.record.files.length;i++){
	        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>,&nbsp;&nbsp;&nbsp;&nbsp;";
	        }
	       	return tempSrc;
		}
		init();
		initcostmemo();
		function initcostmemo(){
			nui.ajax({	
			      url: "com.primeton.eos.ame_pur.settlePay.getCostmemo.biz.ext",
			      type: 'POST',
		          success: function (text) {
		       	  	//加载成本说明
		       	  	nui.get("costmemo").setData(text.costmemos);
		          },
			      error: function (jqXHR, textStatus, errorThrown) {
			        alert(jqXHR.responseText);
			      }
		    });
		}
		function init(){
    		var data={workItemID: <%=workItemID %>,goSettleStep: "reviewcheck"};
			var json=nui.encode(data);
			nui.ajax({
				url:"com.primeton.eos.ame_pur.settlePay.getGoSettlePay.biz.ext",
				type:"post",
				data:json,
				contentType:"text/json",
				success:function (o){
					o = nui.clone(o);
					//加载结算附件设置参数
            		nui.get("grid_0").load({"groupid":"purSettle","relationid":o.purSettle.settlementid});
					nui.get("startdate").setValue(o.purSettle.startdate);
					nui.get("enddate").setValue(o.purSettle.enddate);
					nui.get("workunit").setValue(o.purSettle.workunit);
					nui.get("workamount").setValue(o.purSettle.workamount);
					nui.get("setamount").setValue(o.purSettle.setamount == null ? 0 : o.purSettle.setamount);
					nui.get("confper").setValue(o.purSettle.confper);
					nui.get("comment").setValue(o.purSettle.comment);
					nui.get("settlementid").setValue(o.purSettle.settlementid);
					nui.get("setstatus").setValue(o.purSettle.setstatus);
					nui.get("suppliersname").setValue(o.purSettle.suppliersname);
					nui.get("processinstid2").setValue(o.purSettle.processinstid);
					nui.get("processinstidSettle").setValue(o.purSettle.processinstid);
					//成本归属类型
					nui.get("costtype").setValue(o.purSettle.costtype);
					
					nui.get("custid").setValue(o.purSettle.custid);//供应商id
					nui.get("custid").setText(o.purSettle.custname);//供应商名称
					nui.get("custno").setValue(o.purSettle.miscustid);//客户id
					nui.get("custno").setText(o.purSettle.miscustname);//客户名称
					nui.get("projectno").setValue(o.purSettle.projectno);
					nui.get("projectno").setText(o.purSettle.projectname);
					nui.get("projectid").setValue(o.purSettle.projectid);
					nui.get("benefitid").setValue(o.purSettle.orgid);
					nui.get("benefitid").setText(o.purSettle.orgname);
					nui.get("workitemid").setValue(<%=workItemID %>);
					nui.get("processinstid").setValue(o.purSettle.processinstid);
					nui.get("contnum").setValue(o.purSettle.contnum);
					nui.get("contnum").setText(o.purSettle.contnum);
					var custid = o.purSettle.custid;//供应商id
					var orgid = o.purSettle.orgid;//所属销售
					if(o.workItem.activityDefID != "manualActivity2"){
						document.getElementById("field6").style.display = "none";
						nui.get("checkSure").setValue(0);
					}
					//结算单编号 
					var settlementid = o.purSettle.settlementid;
					//与订单相关外包人员信息
					var projectno = nui.get("projectno").getValue();
					var custno = nui.get("custno").getValue();
					var jsonnew = nui.encode({purSettle: 
						{settlementid: settlementid,projectno: projectno,custid: custid,custno: custno}
					});
                	nui.ajax({
		        		url: "com.primeton.eos.ame_pur.outperson.queryOutSettleLook.biz.ext",
		                data: jsonnew,
		                type: 'POST',
		                cache: false,
		                showModal: false,
		                contentType: 'text/json',
		                success: function (onew) {
		                	datagridOutperson.setData(onew.purSettle.purSettleList);
                			datagridOutperson.selectAll(false);
                			dosuminit = 1;
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		        	});
                    //与订单相关的计提信息
					var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectno,settlementid: settlementid,iden: "2"}});
                	grid2.load(jsonPresettle,function(){
                		grid2.selectAll(false);
                		var rowsPresettle = grid2.getSelecteds();
                		for(var i = 0;i < rowsPresettle.length;i++){
                			if(rowsPresettle[i].settlementid != settlementid){
                				grid2.deselect(rowsPresettle[i]);
                			}
                		}
                		if(o.purOutcost!=null){
                			nui.get("purOutcostWorkunit").setValue(o.purOutcost.workunit);
                			nui.get("purOutcostWorkamount").setValue(o.purOutcost.workamount);
                			nui.get("purOutcostTaxmon").setValue(o.purOutcost.taxmon);
                			nui.get("purOutcostTax").setValue(o.purOutcost.tax);
                			nui.get("purOutcostNotaxmon").setValue(o.purOutcost.notaxmon);
                			nui.get("costmemo").setValue(o.purOutcost.costmemo);
                			nui.get("purOutcostContnum").setValue(o.purOutcost.contnum);
                			if(o.purOutcost.workamount!=null && o.purOutcost.workamount!=0){
                				nui.get("purOutcostUnitprice").setValue(o.purOutcost.taxmon/o.purOutcost.workamount);
                			}else{
                				nui.get("purOutcostUnitprice").setValue("");
                			}
                		}else{
                			//------------------------------------------------冲销信息初始化----开始----------------------------------
	                		//结算金额
							var setamount = nui.get("setamount").getValue();
							//计提金额
							var sumtotalpre = document.getElementById("sumtotalpre").innerHTML;
							//合同编号
							nui.get("purOutcostContnum").setValue(o.purSettle.contnum);
							var date = new Date();
							var rows = grid2.getSelecteds();
							//成本结转类型：1、计提，2、采购结算，3、计提冲销
							for(var i = 0;i < rows.length;i ++){
								if(rows[i].accruedstatus == "2"){	//确认计提审核中
									sumAccruedmoney += rows[i].accruedmoney;
									//工作量数量
									sumWorkamount += rows[i].workamount;
								}
							}
							//成本结转的工作量单位
	                		nui.get("purOutcostWorkunit").setValue(o.purSettle.workunit);
	                		//成本结转的工作量数量
	                		nui.get("purOutcostWorkamount").setValue(parseFloat(o.purSettle.workamount - sumWorkamount).toFixed(3)); 
							//计算成本结转金额（含税）
							setamount = parseFloat(setamount);
							sumAccruedmoney = parseFloat(sumAccruedmoney);
							//结转含税金额
							var purOutcostTaxmon = parseFloat(setamount-sumAccruedmoney).toFixed(2);
							purOutcostTaxmon = parseFloat(purOutcostTaxmon).toFixed(2);
							nui.get("purOutcostTaxmon").setValue(purOutcostTaxmon);
							//结转税率
							var purOutcostTax = o.purSettle.tax == null ? 0 : o.purSettle.tax*100;
							purOutcostTax = parseFloat(purOutcostTax).toFixed(2);
							nui.get("purOutcostTax").setValue(purOutcostTax);
							//结转不含税金额
							var purOutcostNotaxmon = parseFloat(purOutcostTaxmon/(1 + o.purSettle.tax)).toFixed(2);
							nui.get("purOutcostNotaxmon").setValue(purOutcostNotaxmon);
							//单价
							var purOutcostWorkamount=parseFloat(o.purSettle.workamount - sumWorkamount).toFixed(3);
							if(o.purOutcost!=null){
								if(o.purOutcost.workamount!=null && o.purOutcost.workamount!=0){
									nui.get("purOutcostUnitprice").setValue(parseFloat(purOutcostTaxmon/purOutcostWorkamount).toFixed(2));
								}else{
									nui.get("purOutcostUnitprice").setValue("");
								}
							}
							if(sumAccruedmoney != 0){	//确认计提审核中的计提总金额不为0，成本结转类型为计提冲销
								nui.get("purOutcostOutcosttype").setValue("3");
								var accruedids = "";
								for(var i = 0; i < rows.length; i++){
									if(rows[i].accruedstatus == "2"){
										if(accruedids == ""){
											accruedids = rows[i].accruedid;
										}else{
											accruedids = accruedids + "," + rows[i].accruedid;
										}
									}
								}
								//计提单编号
								nui.get("purOutcostAccruedid").setValue(accruedids);
							}else{						//确认计提审核中的计提总金额为0，成本结转类型为采购结算
								nui.get("purOutcostOutcosttype").setValue("2");
							}
							//结算单编号
							nui.get("purOutcostSettlementid").setValue(o.purSettle.settlementid);
							//成本开始日期
							nui.get("purOutcostStartdate").setValue(nui.get("startdate").getValue());
							//成本结束日期
							nui.get("purOutcostEnddate").setValue(nui.get("enddate").getValue());
							//供应商ID
							nui.get("purOutcostSupplierid").setValue(o.purSettle.custid);
							
				        	//------------------------------------------------冲销信息初始化----结束----------------------------------
                		}
                	});
                    //流程回退路径赋值 
                    nui.get("backTo").setData(o.purSettle.backList);
                    //审核结果设置
					/* var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
					nui.get("auditstatus").setData(dataStatus);
					nui.get("auditstatus").setValue("1");
					nui.get("auditopinion").setValue("已处理。"); */
					//initMisOpinion({auditstatus: "1"});
                    //查询审核意见
                    var processinstid = nui.get("processinstid").getValue();
					var grid = nui.get("datagrid1");
					grid.sortBy("time", "desc");
					grid.load({processInstID: processinstid});
					//流程提示信息
        			promptInit({workItemID:<%=workItemID %>});
        			//事业部领导审批人默认赋值
        			/* var sybname = "";
                    var sybid = "";
                    for(var i = 0;i < o.sybleaders.length;i++){
                    	sybid += o.sybleaders[i].id+",";  
						sybname += o.sybleaders[i].name+",";
                    	sybempllist[i] = {"userid": o.sybleaders[i].id,"empname": o.sybleaders[i].name};
                    }
                    sybname = sybname.substring(0,sybname.length-1);
                    sybid = sybid.substring(0,sybid.length-1);
                    nui.get("sybcheckerid").setValue(sybid);
                    nui.get("sybcheckerid").setText(sybname); */
				},
				error:function(){}
			});
		}
		
		//选择行
		var allSum = 0;
        function onSelect(e){
        	var rows = datagridOutperson.getSelecteds();
        	var sumFee = 0;
        	var sumdays = 0;
        	var summonths = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].totalfee){
					sumFee += parseFloat(rows[i].totalfee);
				}
				if(rows[i].days){
					sumdays += parseFloat(rows[i].days);
				}
				if(rows[i].months){
					summonths += parseFloat(rows[i].months);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			sumdays = parseFloat(sumdays);
			summonths = parseFloat(summonths);
            allSum = sumFee;
            allSum = parseFloat(allSum).toFixed(2);
            if(dosuminit == 1){
        		nui.get("setamount").setValue(allSum);
            }
            document.getElementById("sumtotal").innerHTML = parseFloat(allSum).toFixed(2);
            document.getElementById("daystotal").innerHTML = parseFloat(sumdays).toFixed(2);
            document.getElementById("monthstotal").innerHTML = parseFloat(summonths).toFixed(3);
        }
        
        //取消选中行
        function onDeselect(e){
        	var rows = datagridOutperson.getSelecteds();
        	var sumFee = 0;
        	var sumdays = 0;
        	var summonths = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].totalfee){
					sumFee += parseFloat(rows[i].totalfee);
				}
				if(rows[i].days){
					sumdays += parseFloat(rows[i].days);
				}
				if(rows[i].months){
					summonths += parseFloat(rows[i].months);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			allSum = sumFee;
			allSum = parseFloat(allSum).toFixed(2);
			if(dosuminit == 1){
        		nui.get("setamount").setValue(allSum);
			}
			document.getElementById("sumtotal").innerHTML = parseFloat(allSum).toFixed(2);
			document.getElementById("daystotal").innerHTML = parseFloat(sumdays).toFixed(2);
            document.getElementById("monthstotal").innerHTML = parseFloat(summonths).toFixed(3);
        }
        
        //选择行计提
        var allSumPre = 0;
        var allSumNotPre = 0;
        function onSelectPre(e){
        	var rows = grid2.getSelecteds();
        	var sumFee = 0;
        	var sumNotFee = 0;
        	var sumWorkamount = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].accruedmoney){
					sumFee += parseFloat(rows[i].accruedmoney);
					sumNotFee += parseFloat(rows[i].notaxmoney);
				}
				if(rows[i].workamount){
					sumWorkamount += parseFloat(rows[i].workamount);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			sumNotFee = parseFloat(sumNotFee).toFixed(2);
			sumWorkamount = parseFloat(sumWorkamount).toFixed(3);
            allSumPre = sumFee;
            allSumNotPre = sumNotFee;
            allSumPre = parseFloat(allSumPre).toFixed(2);
            allSumNotPre = parseFloat(allSumNotPre).toFixed(2);
            document.getElementById("sumtotalpre").innerHTML = parseFloat(allSumPre).toFixed(2);
            document.getElementById("sumNottotalpre").innerHTML = parseFloat(allSumNotPre).toFixed(2);
            document.getElementById("sumtotalworkamount").innerHTML = parseFloat(sumWorkamount).toFixed(3);
        }
        
        //取消选中行计提
        function onDeselectPre(e){
        	var rows = grid2.getSelecteds();
        	var sumFee = 0;
        	var sumNotFee = 0;
        	var sumWorkamount = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].accruedmoney){
					sumFee += parseFloat(rows[i].accruedmoney);
					sumNotFee += parseFloat(rows[i].notaxmoney);
				}
				if(rows[i].workamount){
					sumWorkamount += parseFloat(rows[i].workamount);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			sumNotFee = parseFloat(sumNotFee).toFixed(2);
			sumWorkamount = parseFloat(sumWorkamount).toFixed(3);
			allSumPre = sumFee;
			allSumNotPre = sumNotFee;
			allSumPre = parseFloat(allSumPre).toFixed(2);
			allSumNotPre = parseFloat(allSumNotPre).toFixed(2);
			document.getElementById("sumtotalpre").innerHTML = parseFloat(allSumPre).toFixed(2);
			document.getElementById("sumNottotalpre").innerHTML = parseFloat(allSumNotPre).toFixed(2);
			document.getElementById("sumtotalworkamount").innerHTML = parseFloat(sumWorkamount).toFixed(3);
        }
		
		function SaveData(){
			var auditstatus = nui.get("auditstatus").getValue();
			if(auditstatus == "1"){	
				if(!form.validate()){
					return;
				}
			}
			GoSettlePayReviewCheck();
		}
		
		//调用开票确认逻辑流
    	function GoSettlePayReviewCheck(){
    		var data = form.getData();
    		var opioionformData = opioionform.getData();
    		var workitemid = nui.get("workitemid").getValue();
    		data.workitemid = workitemid;
    		var backTo = nui.get("backTo").getValue();
    		data.purSettle.backTo = backTo;
    		//计提信息
    		var purPresettles = grid2.getSelecteds();
			data.purSettle.purPresettles = purPresettles;
			//结转税率
    		data.purOutcost.tax = data.purOutcost.tax/100;
    		//审核信息
    		data.misOpinion = opioionformData.misOpinion;
    		//赋值审核人集合
    		data.sybempllist = sybempllist;
    		var json = nui.encode(data);
    		nui.ajax({
    			url:"com.primeton.eos.ame_pur.settlePay.makeGoSettlePayReviewCheck.biz.ext",
    			data:json,
    			type:"post",
    			contentType:"text/json",
    			success:function(action){
    				if(action.exception == null){
			        	nui.alert("提交成功",null,function(){
				        	CloseWindow("ok");
			        	});
    				}else{
    					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
    						nui.get("sureButton").setEnabled(true);
    					});
    				}
    			},
    			error:function(jqXHR, textStatus, errorThrown){
    				nui.alert("error:" + jqXHR.responseText);
    			}
    		});
    	}
    	
    	//设置业务字典值-学历
		function dictGetDegree(e) {
			return nui.getDictText('DEGREE',e.value);
		}
		
		//设置业务字典值-性别
		function dictGetGender(e) {
			return nui.getDictText('ABF_GENDER',e.value);
		}
		
		//设置业务字典值-事业部
		function dictGetContOrg(e){
			return nui.getDictText('CONT_ORG',e.value);
		}
		
		//设置业务字典值-计提状态
		function dictGetStatus(e){
			return nui.getDictText('AME_ACCRUEDSTATUS',e.value);
		}
		
		//设置业务字典值-采购订单状态
	    function dictGetOrderStatus(e){
	    	return nui.getDictText('AME_ORDERSTATUS',e.value);
	    }
	    
	    //设置业务字典值-成本归属类型
		function dictGetCostType(e){
			return nui.getDictText('AME_CONTCOSTTYPE',e.value);
		}
		
		//设置业务字典值-工作量单位
		function dictGetWorkunit(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);
		}
		
		//设置日期格式
		function onDealDate(e){
			if(e.value){
				return e.value.substring(0,10);
			}
		}
	    
	  	//标准方法接口定义
        function CloseWindow(action) {            
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
		function onOk(){
			var auditstatus = nui.get("auditstatus").getValue();
			var filePaths = document.getElementsByName("uploadfile").length;
        	for(var j=0;j < filePaths;j++){
        		var a = document.getElementsByName("remarkList")[j].value;
        		if(a == null || a == ""){
        			nui.alert("新增附件不可以为空");
        			return false;
        		}
        	}
			var filePaths1 = document.getElementsByName("uploadfile1").length;
        	for(var j = 0;j < filePaths1;j++){
        		var a = document.getElementsByName("remarkList1")[j].value;
        		if(a == null || a == ""){
        			nui.alert("新增附件不可以为空");
        			return false;
        		}
        	}
        	/* var userid = nui.get("sybcheckerid").getValue();
		 	var empname = nui.get("sybcheckerid").getText();
            var userids = userid.split(",");
            var empnames = empname.split(",");
            //重新选择审核人后，先清空之前默认的审核人集合再赋值
            sybempllist.length = 0;
            for(var i = 0;i < userids.length;i ++){
            	sybempllist[i] = {"userid": userids[i],"empname": empnames[i]};
            } */
        	//冲销记录的税率
	        	var purOutcostTax = nui.get("purOutcostTax").getValue();
	        	//是否冲销
	        	var checkSure = nui.get("checkSure").getValue();
	        	//成本说明
	        	var costmemo = nui.get("costmemo").getValue();
	        	//选择冲销
	        	if(checkSure == "1"){
		        	if(!purOutcostTax){
		        		nui.alert("冲销记录的税率不能为空！");
		        		return false;
		        	}else if(!costmemo){
		        		nui.alert("成本说明不能为空！");
		        		return;
		        	}else{
		        		if(isNaN(purOutcostTax)){
		        			nui.alert("冲销记录的税率不是数字！");
		        			return false;
		        		}
		        	}
	        	}else{
	        		//nui.alert("不冲销！");
	        		//nui.get("purOutcostTax").setRequired(false);
	        	}
        	if(auditstatus == "2"){
        		nui.confirm("确定终止流程吗？", "操作提示",
	            function (action) {            
	                if (action == "ok") {
	                	nui.get("sureButton").setEnabled(false);
				    	document.getElementById("fileCatalog1").value="purSettle";
						form4.submit();
					}else{
						return;
					}
				});
        	}else if(auditstatus == "0"){
        		if(opioionform.validate()){
	        		nui.confirm("确定退回吗？", "操作提示",
		            function (action) {            
		                if (action == "ok") {
		                	nui.get("sureButton").setEnabled(false);
					    	document.getElementById("fileCatalog1").value="purSettle";
							form4.submit();
						}else{
							return;
						}
					});
				}else{
					return;
				}
        	}else{
				if(form.validate()){
					nui.confirm("确定提交吗？", "操作提示",
		            function (action) {            
		                if (action == "ok") {
		                	nui.get("sureButton").setEnabled(false);
					    	document.getElementById("fileCatalog1").value="purSettle";
							form4.submit();
						}else{
							return;
						}
					});
				}else{
					return;
				}
        	}
	    }
    	function doSHZT(){
    		if(nui.get("auditopinion").getValue().trim() == ""){
    			nui.alert("悬挂时审核意见不可以为空");
        		return false;
    		}else{
    			if (!confirm("是否保存悬挂时的审核意见？")) {
                    return false;
                }else{
		    		var data = opioionform.getData();
		    		data.misOpinion.auditstatus = "5";
		    		var json = nui.encode(data);
		    		nui.ajax({
		    			url:"com.primeton.eos.ame_common.mail.saveMisopinion.biz.ext",
		    			data:json,
		    			type:"post",
		    			contentType:"text/json",
		    			success:function(action){
		    				if(action.exception == null){
					        	nui.alert("提交成功",null,function(){
						        	nui.get("datagrid1").reload();
					        	});
		    				}else{
		    					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
		    					});
		    				}
		    			},
		    			error:function(jqXHR, textStatus, errorThrown){
		    				nui.alert("error:" + jqXHR.responseText);
		    			}
		    		});
		    	}
    		}
    	}
        function onCancel(e) {
            var data = form.getData();
        	if(data){
	        	nui.showMessageBox({
		            title: "关闭提示",
		            iconCls: "nui-messagebox-question",
		            buttons: ["yes", "no"],
		            message: "是否关闭？",
		            callback: function (action) {
		                if(action=="yes"){
		                	CloseWindow("cancel");
		                }
		            }
		        });
			}else{
				CloseWindow("cancel");
			}
        }
    	
        function SaveData1(){
        	document.getElementById("fileCatalog").value="MIS_OPINION";
            form2.submit();
    	}
    	
    	//选择合同弹窗
        function selectCont(){
        	var btnEdit = this;
        	nui.open({
                url:"<%=request.getContextPath() %>/ame_common/contract_lookup.jsp",
                title: "选择合同",
                width: 1000,
                height: 520,
                allowResize: false,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                            btnEdit.setValue(data.text);
                            btnEdit.setText(data.text);
                        }
                    }
                }
            });
        }
	    
	    //确认计提
	    function onActionRenderer(e) {
            var grid = e.sender;
            var record = e.record;
            var uid = record._uid;
            var rowIndex = e.rowIndex;
            var s = null;
            if(record.accruedstatus == 4 || record.accruedstatus == 0){
	            s = ' <a class="Edit_Button" href="javascript: editRow(\'' + uid + '\')" >计提确认</a>' ;
            }
            if(s){
	            s += ' <a class="Edit_Button" href="javascript: editPreSplitRow(\'' + uid + '\')" >计提拆分</a>';
            }else{
            	s = ' <a class="Edit_Button" href="javascript: editPreSplitRow(\'' + uid + '\')" >计提拆分</a>'
            }
            return s;
        }
        
        var chooseRow = "";
        function editRow(row_uid) {
        	//成本确认日期为空，设置为当天。
            var row = grid2.getRowByUID(row_uid);
            if (row) {
	        	if(nui.get("confirmdate").getValue() == ""){
		        	nui.get("confirmdate").setValue(new Date());
	        	}
        		showAtPos();
        		chooseRow = row;
            }
        }
        
        
        //成本确认日期
        function showAtPos() {
	        var win = nui.get("win1");
	        win.showAtPos("center", "middle");
	    }
	    function hideWindow() {
	        var win = nui.get("win1");
	        win.hide();
	    }
	    function sureDate(){
	    	hideWindow();
	    	surePreSettle(chooseRow);
	    }
	    
	    function surePreSettle(row){
	    	nui.confirm("确定要计提确认吗？","操作提示",function(action){
            	if(action == "ok"){
            		var json = nui.encode({"purOutcostParam": {"iden": "reviewCheck","accruedidSure": row.accruedid,
            			"confirmdate": nui.get("confirmdate").getValue(),"settlementid": nui.get("settlementid").getValue()}});
                    grid2.loading("正在计提确认中,请稍等...");
                    nui.ajax({
                        url:"com.primeton.eos.ame_pur.outaccrued.surePresettle.biz.ext",
                        type:'POST',
                        data:json,
                        cache: false,
                        contentType:'text/json',
                        success:function(text){
                            var returnJson = nui.decode(text);
                            grid2.unmask();
                            if(returnJson.exception == null){
                                nui.alert("确认计提成功", "系统提示",function(){
                                	var projectno = nui.get("projectno").getValue();
                                	var settlementid = nui.get("settlementid").getValue();
                                	var custid = nui.get("custid").getValue();
                                	//var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectno,settlementid: settlementid,iden: "2"}});
                                	var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectno,settlementid: settlementid,iden: "2"}});
				                	grid2.load(jsonPresettle,function(){
				                		grid2.selectAll(false);
				                		var rowsPresettle = grid2.getSelecteds();
				                		for(var i = 0;i < rowsPresettle.length;i++){
				                			if(rowsPresettle[i].settlementid != settlementid){
				                				grid2.deselect(rowsPresettle[i]);
				                			}
				                		}
				                	});
                                });
                                
                            }else{
                                nui.alert("确认计提失败", "系统提示");
                            }
                        }
                    }); 
            	}else{
            		//alert("取消");
            	}
            });
	    }
	    
	    //选择事业部领导审批人
    	function showEmployeesyb(e){
    		var btnEdit = this;
	        nui.open({
				url:"<%=request.getContextPath() %>/ame_common/tree/lazytree.jsp",
				title: "选择事业部领导审批人",
				width: 600,
				height: 400,
				onload: function () {
	                var iframe = this.getIFrameEl();
	                var empname=nui.get("sybcheckerid").getText();
	                var userid=nui.get("sybcheckerid").getValue();
	                if(userid){
	                	var data = {empname:empname,userid:userid};
	                }else{
	                	var data={};
	                }
	                iframe.contentWindow.SetData(data);
	            },
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
			                btnEdit.setValue(data.userid);
			                btnEdit.setText(data.empname);
			                var userids = data.userid.split(",");
			                var empnames = data.empname.split(",");
			                //重新选择审核人后，先清空之前默认的审核人集合再赋值
			                sybempllist.length = 0;
			                for(var i = 0;i < userids.length;i ++){
			                	sybempllist[i] = {"userid": userids[i],"empname": empnames[i]};
			                }
						}
					}
				}
			});
    	}
        
        /**
         * 查看项目
         */
        function detailProj1(){
	 		var projectid = nui.get("projectid").getValue();
			window.open("<%=request.getContextPath() %>/project/rdproject/projectDetail.jsp?projid=" + projectid);
	    }
	    
	    
	    //修改冲销记录税率
    	function changePurOutcostTax(){
    		//含税金额
    		var purOutcostTaxmon = nui.get("purOutcostTaxmon").getValue();
    		//税率
    		var purOutcostTax = nui.get("purOutcostTax").getValue();
    		
    		var purOutcostWorkamount = nui.get("purOutcostWorkamount").getValue();
    		
    		var purOutcostNotaxmon = 0;
    		if(purOutcostTax){
	    		if(!isNaN(purOutcostTax)){
	    			purOutcostTax = purOutcostTax/100;
		    		purOutcostNotaxmon = purOutcostTaxmon/(1 + parseFloat(purOutcostTax));
	    		}else{
	    			purOutcostNotaxmon = 0;
	    			nui.alert("请输入数字！");
	    		}
    		}else{
    			purOutcostNotaxmon = 0;
    		}
    		nui.get("purOutcostNotaxmon").setValue(parseFloat(purOutcostNotaxmon).toFixed(2));
    		if(purOutcostWorkamount !=null && purOutcostWorkamount!=0){
				nui.get("purOutcostUnitprice").setValue(parseFloat((purOutcostTaxmon)/(purOutcostWorkamount)).toFixed(2));
			}else{
				nui.get("purOutcostUnitprice").setValue("");
			}	
    	
    	}
    	
    	 //选择是否冲销
        function checkSure(){
        	var checkSure = nui.get("checkSure").getValue();
        	if(checkSure == "1"){
        		nui.get("purOutcostTax").setRequired(true);
        		document.getElementById("purOutcostTaxmon").style.display = "";
        		document.getElementById("purOutcostTax").style.display = "";
        		document.getElementById("purOutcostNotaxmon").style.display = "";
        		document.getElementById("purOutcostWorkunit").style.display = "";
        		document.getElementById("purOutcostWorkamount").style.display = "";
        		document.getElementById("costmemo").style.display = "";
        		document.getElementById("purOutcostUnitprice").style.display = "";
        		document.getElementById("a1").style.display = "";
        		document.getElementById("a2").style.display = "";
        		document.getElementById("a3").style.display = "";
        		document.getElementById("a4").style.display = "";
        		document.getElementById("a5").style.display = "";
        		document.getElementById("a6").style.display = "";
        		document.getElementById("a7").style.display = "";
        		document.getElementById("a8").style.display = "";
        	}else{	
        		nui.get("purOutcostTax").setRequired(false);
        		document.getElementById("purOutcostTaxmon").style.display = "none";
        		document.getElementById("purOutcostTax").style.display = "none";
        		document.getElementById("purOutcostNotaxmon").style.display = "none";
        		document.getElementById("purOutcostWorkunit").style.display = "none";
        		document.getElementById("purOutcostWorkamount").style.display = "none";
        		document.getElementById("costmemo").style.display = "none";
        		document.getElementById("purOutcostUnitprice").style.display = "none";
        		document.getElementById("a1").style.display = "none";
        		document.getElementById("a2").style.display = "none";
        		document.getElementById("a3").style.display = "none";
        		document.getElementById("a4").style.display = "none";
        		document.getElementById("a5").style.display = "none";
        		document.getElementById("a6").style.display = "none";
        		document.getElementById("a7").style.display = "none";
        		document.getElementById("a8").style.display = "none";
        	}
        }
	</script>
</body>
</html>