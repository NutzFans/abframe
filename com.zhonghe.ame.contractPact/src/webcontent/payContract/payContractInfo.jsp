<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/purchase/common/common.jsp"%>
<html>
<head>
	<title>付费合同签订申请信息 </title>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
		<div class="mini-panel" title="" style="width: 100%;">
			<fieldset id="field1" style="border: solid 1px #aaa;padding: 3px;width: 100%;">
				<legend>付费合同签订申请信息</legend>
				<form id="form1" method="post">
						<input name="files" id="fileids" class="nui-hidden"/>
						<input class="nui-hidden" name="id"/>
					<div style="padding: 5px;">
						<table style="table-layout: fixed;">
							<tr>
							<td class="form_label" align = "right"> 申请人</td>
								<td>
									<input id="createUsername" name="createUsername" class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
								</td>
								<td align="right" style="width: 160px">合同实施部门：</td>
								<td >   
									<input name="implementOrg" id="implementOrg" class="nui-hidden" style="width: 200px;" />
									<input id="implementOrgname" name="implementOrgname" class="nui-textbox" enabled="false" style="width: 200px" required="true"/>
								</td>
								<td align="right" style="width:160px">申请日期：</td>
									<td><input id="createTime" name="createTime" enabled="false" class="nui-datepicker" style="width: 200px"/></td>
							</tr>
							<tr>
								
								<td align="right" style="width: 160px">合同名称：</td>
								<td><input id="contractName" name="contractName" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 160px">合同金额(元)：</td>
								<td><input id="contractSum" name="contractSum" enabled="false" class="nui-textbox" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">签约方：</td>
								<td><input id="signatoryname" name="signatoryname" enabled="false" class="nui-textbox" style="width: 200px"/></td>						
							</tr>
							<tr>
								<td align="right" style="width: 160px">合同类型：</td>
								<td><input id="contractType" name="contractType" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_CONTRACT_TYPE" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">采购立项编号：</td>
								<td><input id="purchasePlan" name="purchasePlan" enabled="false" class="nui-textbox" style="width: 200px" required="true"/></td>
								<td align="right" style="width: 160px">合同签约主体：</td>
								<td><input id="contractSubject" name="contractSubject" enabled="false" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px"  required="true"/></td>										
							</tr>
							<tr>
								
								<td align="right" style="width: 160px">实施地点：</td>
									<td><input id="projectLocal" name="projectLocal" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width: 160px">标的规模：</td>
									<td><input id="projectSize" name="projectSize" enabled="false" class="nui-textbox" style="width: 200px"/></td>
								<td align="right" style="width:160px">合同起始日期：</td>
									<td><input id="startTime" name="startTime" enabled="false" class="nui-datepicker" style="width: 200px"/></td>					
							</tr>
							<tr>
								
								<td align="right" style="width:160px">合同结束日期：</td>
									<td><input id="endTime" name="endTime" enabled="false" class="nui-datepicker" style="width: 200px"/></td>		
								<td align="right" style="width: 100px">分公司会签部门领导：</td>
							    <td  style="width: 20%;">
									<input name="fDeptCountersignName" id="fDeptCountersignName" class="nui-textbox" style="width: 100%" enabled="false" >
								</td>
							    <td align="right" style="width: 100px">本部会签部门领导：</td>
							    <td  style="width: 20%;">
							     	<input name="zDeptCountersignName" id="zDeptCountersignName" class="nui-textbox" style="width: 100%" enabled="false">
								</td>
							</tr>
							<tr>
								<td align="right" style="width: 160px">备注：</td>
								<td  colspan="5"><input id="remark" name="remark"  class="nui-textarea" style="width: 100%" enabled="false"/></td>
							</tr>
							
						</table>
					</div>
					<p style="color:red;">补充合同信息:</p>
					<div style="padding: 5px;">
							<table style="table-layout: fixed;">
								<tr>
									<td align="right" style="width: 100px">合同编号：</td>
										<td><input id="contractNo" name="contractNo"  class="nui-textbox"  style="width: 200px" required="true"/></td>
									<td align="right" style="width: 100px">支付节点：</td>
										<td><input id="payMethod" name="payMethod"  class="nui-textbox" style="width: 200px" required="true"/></td>
									<!-- <td align="right" style="width: 100px">执行状态：</td>
										<td><input id="executeStatus" name="executeStatus"  class="nui-dictcombobox" dictTypeId="ZH_EXECUTESTATUS" style="width: 300px" required="true"/></td> -->
									<!-- <td align="right" style="width: 100px">承办单位：</td>
										<td><input id="organizer" name="organizer"  class="nui-textbox" style="width: 300px"/></td> -->
									<td align="right" style="width: 100px">付款方：</td>
										<td><input id="payer" name="payer"  class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true"/></td>
									
								</tr>
								<tr>
									<td align="right" style="width: 100px">签订日期：</td>
										<td><input id="signingDate" name="signingDate"  class="nui-datepicker" style="width: 200px" required="true"/></td>
									<td align="right" style="width: 100px">合同期限：</td>
										<td><input id="contractPeriod" name="contractPeriod"  class="nui-textbox" style="width: 200px" required="true"/></td>
									<!--<td align="right" style="width: 100px">完成时间：</td>
										<td><input id="finishTime" name="finishTime"  class="nui-datepicker" style="width: 200px" required="true"/></td>-->
									<td align="right" style="width: 100px">合同专用章：</td>
										<td><input id="cachet" name="cachet" class="nui-dictcombobox" dictTypeId="ZH_INVOICE_NAME_TYPE" style="width: 200px" required="true"/></td>
								</tr>
							</table>
					</div>
				</form>
			</fieldset>

	<div id="tabs1" class="nui-tabs" activeIndex="0" style="width:auto;height:auto">
	    <div title="相关附件">
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</div>
	</div>
			<fieldset style="border:solid 1px #aaa;padding:3px;width:1354px;">
	        <legend>处理意见列表</legend>
	        	<div id="datagrid5" class="nui-datagrid" style="width:100%;height:auto;" dataField="misOpinions"
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
	    	</fieldset>
	</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="closeCancel" id="saveReimbProcess" style="width: 80px;margin-right: 140px;">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
		var form = new nui.Form("form1");
		isViewDelete=false;
		form.setEnabled(false)
		function setViewData(data){
			console.log(data)
			form.setData(data);
			var grid_0 = nui.get("grid_0");
        	grid_0.load({"groupid":"PAY_CONTRACT","relationid":data.id});
			grid_0.sortBy("fileTime","desc");
			var grid5 = nui.get("datagrid5");
			grid5.load({processInstID:data.processid});
			grid5.sortBy("time", "desc");
		}
		
		function onCheckRenderer(e) {
			return nui.getDictText('MIS_AUDITSTATUS',e.value);//设置业务字典值
		}
    </script></body>
</html>
