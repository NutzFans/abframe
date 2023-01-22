<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2016-06-03 11:34:14
  - Description:
-->
<head>
	<title>结算单审核</title><!-- (PMO) -->
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
				<input name="purSettle.setstatus" id="setstatus" class="nui-hidden"/>
				<input name="purSettle.processinstid" id="processinstidSettle" class="nui-hidden" />
				<input name="misOpinion.processinstid" id="processinstid2" class="nui-hidden" />
				<!-- 供应商简称 -->
				<input name="purSettle.suppliersname" id="suppliersname" class="nui-hidden" />
				<!-- 项目ID -->
				<input name="purSettle.projectid" id="projectid" class="nui-hidden" />
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">项目：</td>
							<td><input name="purSettle.projectno" readOnly="readOnly" showButton="false" id="projectno" valueField="projectNo" textField="projectName" class="nui-buttonedit" required="false" style="width:240px" />
								<a href="javascript:void(0)" onclick='detailProj1();' title='点击查看项目信息'>查看</a>
							</td>
							<td align="right" style="width:120px;">客户：</td>
							<td><input name="purSettle.custno" readOnly="readOnly" showButton="false" id="custno" valueField="miscustid" textField="custname" class="nui-combobox" required="false" style="width:280px;" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">供应商：</td>
							<td><input name="purSettle.custid"  id="custid" class="nui-combobox" required="false" style="width:200px" 
								readOnly="readOnly" showButton="false" allowInput="false" />
							</td>
							<td align="right" style="width:120px;">受益部门：</td>
							<td><input name="purSettle.benefitid" readOnly="readOnly" showButton="false" id="benefitid" class="nui-buttonedit" required="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">结算周期开始日期：</td>
							<td><input name="purSettle.startdate" id="startdate" onvaluechanged="startandend('start')" class="nui-datepicker" required="true" requiredErrorText="开始日期不能为空" style="width:100px"/></td>
							<td align="right" style="width:120px;">结算周期截止日期：</td>
							<td><input name="purSettle.enddate" id="enddate" onvaluechanged="startandend('end')" class="nui-datepicker" required="true" requiredErrorText="截止日期不能为空" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">工作量单位：</td>
							<td><input name="purSettle.workunit" id="workunit" onvaluechanged="changedWorkunit" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" required="false" style="width: 80px" /></td>
							<!-- 工作量数量 -->
							<td align="right" style="width:120px;">工作量数量：</td>
							<td><input name="purSettle.workamount" id="workamount" class="nui-spinner" showButton="false" 
								allowLimitValue="false" changeOnMousewheel="false" style="width: 100px;" 
								inputStyle="text-align: left;" readOnly="readOnly" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">工作量技术确认人：</td>
							<td><input name="purSettle.confper" id="confper" class="nui-textbox" required="false" style="width:100px"/></td>
							<td align="right" style="width:120px;">财务对应合同编号：</td>
							<td><input name="purSettle.contnum" id="contnum" onbuttonclick="selectCont" class="nui-buttonedit" required="false" style="width:120px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">成本归属类型：</td>
							<td colspan="3"><input name="purSettle.costtype" id="costtype" class="nui-dictcombobox" dictTypeId="AME_CONTCOSTTYPE" required="false" style="width:100px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">备注：</td>
							<td colspan="3"><input name="purSettle.comment" id="comment" class="nui-textarea" required="false" style="width:440px"/></td>
						</tr>
					</table>
				</div>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;">
				<legend>外包人员结算信息</legend>
				<div id="datagridOutperson" class="nui-datagrid" dataField="outPersons" style="width:100%;height:auto;" 
			    	url="com.primeton.eos.ame_pur.outperson.queryPurpersonToSettle.biz.ext" multiSelect="true" 
			    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" allowSortColumn="false"
			    	oncellendedit="doSumfee" onselect="onSelect" ondeselect="onDeselect" 
			    	onlyCheckSelection="true">
					<div property="columns">
						<div type="checkcolumn" width="30"></div>
						<div field="settlementid" headerAlign="center" allowSort="true" visible="false" >结算单编号</div>
		                <div field="setdetailid" align="center" headerAlign="center" allowSort="true" visible="false">结算明细id</div>
						<div field="purorderid" align="center" headerAlign="center" allowSort="true" visible="false">采购订单编号</div>
						<div field="outperno" align="center" headerAlign="center" allowSort="true" visible="false">编号</div>
						<div field="outpername"width="60" align="center" headerAlign="center" allowSort="true" renderer="getOutperDetail" >姓名</div>	
						<div field="setstartdate" width="80" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">
							结算开始日期
							<input property="editor" required="true" errormode="border" class="nui-datepicker" style="width:100%;" />
						</div>
						<div field="setenddate" width="80" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">
							结算截止日期
							<input property="editor" required="true" errormode="border" class="nui-datepicker" style="width:100%;" />
						</div>
						<div field="days" width="67" align="center" headerAlign="center" allowSort="true">
							工作日统计
							<input property="editor" required="false" class="nui-textbox" style="width:100%;" />
						</div>
						<div field="months" width="45" align="center" headerAlign="center" allowSort="true">
							人月数
							<input property="editor" required="false" class="nui-textbox" style="width:100%;" />
						</div>
						<div field="price" width="75" dataType="currency" align="right" headerAlign="center" allowSort="true">人月单价</div>
						<div field="setfee" width="80" dataType="currency" align="right" headerAlign="center" allowSort="true">
							工时结算费用
							<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
						</div>
						<div field="othfee" width="60" dataType="currency" align="right" headerAlign="center" allowSort="true">
							其他费用
							<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
						</div>
						<div field="totalfee" width="90" summaryType="sum" dataType="currency" dataType="currency" align="right" headerAlign="center" allowSort="true">
							结算费用小计
							<input property="editor" class="nui-textbox" allowInput="false" style="width:100%;" vtype="float" />
						</div>
						<div field="score" width="42" align="center" headerAlign="center" allowSort="true">
							打分
							<input property="editor" class="nui-textbox" style="width:100%;" />
						</div>
						<div field="evaluate" width="60" align="center" headerAlign="center" allowSort="true">
							评价
							<input property="editor" class="nui-textbox" style="width:100%;" />
						</div>
						<div field="purordernum" width="135" align="center" headerAlign="center" allowSort="true">订单编号</div>
						<div field="purstatus" width="65" renderer="dictGetOrderStatus" align="center" headerAlign="center" allowSort="true">订单状态</div>
					</div>
				</div>
				<div style="width:800px;height:55px;margin-left:185px;float:left;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:90px;">总计：</td>
							<td id="daystotal" style="width:63px;" align="center" ></td>
							<td id="monthstotal" style="width:60px;" align="center" ></td>
							<td align="right" style="width:228px;">结算费用总计：</td>
							<td id="sumtotal" style="width:85px;" align="right" ></td>
						</tr>
						<tr>
							<td colspan="3"></td>
							<td align="right" style="width:210px;">结算最终总金额：</td>
							<td><input name="purSettle.setamount" id="setamount" inputStyle="text-align:right;" vtype="float" class="nui-textbox" required="false" style="width:86px" /></td>
						</tr>
					</table>
				</div>
			</fieldset>
			
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;width: 1250px;">
				<legend>计提核销信息</legend>
				<div id="datagrid2" class="nui-datagrid" dataField="purPresettles" style="width: 100%;height:auto;" 
			    	url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleListToSettle.biz.ext" multiSelect="true"
			    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" 
			    	onselect="onSelectPre" ondeselect="onDeselectPre" 
			    	onlyCheckSelection="true" allowSortColumn="false">
					<div property="columns">
						<div type="checkcolumn" width="30"></div>			
						<div field="accruedid" width="60" headerAlign="center" allowSort="true" visible="true">计提编号</div>
		                <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商编号</div>
		                <div field="custname" headerAlign="center" allowSort="true" visible="false">供应商名称</div>
		                <div field="suppliersname" width="80" headerAlign="center" allowSort="true" >供应商简称</div>
		                <div field="projectno" headerAlign="center" allowSort="true" visible="false">项目代码</div>
		                <div field="projectname" headerAlign="center" allowSort="true" visible="false">项目名称</div>
		                <div field="salesid" headerAlign="center" allowSort="true" visible="false" >所属销售ID</div>
		                <div field="orgname" headerAlign="center" allowSort="true" width="60" align="center" >所属销售</div>
		                <div field="syb" headerAlign="center" allowSort="true" width="100" renderer="dictGetContOrg" >所属事业部</div>
		                <div field="contnum" headerAlign="center" allowSort="true" visible="false">销售合同</div>
		                
		                <div field="workunit" width="70" align="center" headerAlign="center" allowSort="true" renderer="dictGetWorkunit">工作量单位</div>
		                <div field="workamount" width="70" align="center" headerAlign="center" allowSort="true" >工作量数量</div>
		                
		                <div field="startdate" headerAlign="center" allowSort="true" width="75" align="center" >开始日期</div>
		                <div field="enddate" headerAlign="center" allowSort="true" width="75" align="center" >结束日期</div>
		                <div field="accruedmoney" headerAlign="center" allowSort="true" width="80" align="right" dataType="currency" >计提金额</div>
		                <div field="costtype" headerAlign="center" allowSort="true" renderer="dictGetCostType" width="60" align="center" >成本类型</div>
		                <div field="outper" headerAlign="center" allowSort="true" width="130" >相关外包人员</div>
		                <div field="accrueddate" headerAlign="center" allowSort="true" width="75" align="center" dateFormat="yyyy-MM-dd" >计提时间</div>
		                <div field="accruedstatus" headerAlign="center" allowSort="true" renderer="dictGetStatus" width="120" align="center" >状态</div>
		                <div field="settlementid" headerAlign="center" allowSort="true" visible="false" >结算单编号</div>
		                <div name="action" width="50" headerAlign="center" align="center" renderer="onPreSplit" cellStyle="padding:0;">操作</div>
		                <div field="comment" width="auto" headerAlign="center" allowSort="true" >备注</div>
					</div>
				</div>
				<div style="width:450px;height:25px;margin-left: 250px;float:left;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:245px;">总计：</td>
							<td id="sumtotalworkamount" style="width:125px;" align="center" ></td>
							<td style="width: 250px;"></td>
							<td id="sumtotalpre" style="width:100px;" align="right" ></td>
						</tr>
					</table>
				</div>
			</fieldset>
		</form>
		<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
			<legend>外包结算附件</legend>
			<%-- 
				<jsp:include page="/ame_common/detailFile.jsp"/> 
			--%>
			<!-- 
			-->
			<div id="grid_0" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
				<div property="columns">
					<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
					<div field="fileName"width="400" headerAlign="center" align="center" renderer="getdetail1">附件名称</div>
					<div field="fileType" width="140" renderer="dictKbasetype" align="center" headerAlign="center" >附件类型</div>
					<div field="operatorname" width="100"headerAlign="center" align="center">操作员名称</div>
					<div field="fileTime" width="150" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
					<div renderer="deleteFile" width="auto" headerAlign="center" align="center">操作</div>
				</div>
			</div> 
			<jsp:include page="/ame_common/addFiles1.jsp"/>
		</fieldset>
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
			           <!--  <tr>
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
	  	var dosuminit = 0;
	  	var doSumfeezongji = 0;
	  	var taxrate = 0;
	  	var GURL = "<%=request.getContextPath() %>";
	  	var isflag ='1';
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
		init();
		
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
					//加载附件设置参数
            		nui.get("grid_0").load({"groupid":"purSettle","relationid":o.purSettle.settlementid});
            		//加载审核附件设置参数
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
					nui.get("setamount").setEnabled(true);
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
					//成本归属类型为空，默认设置为成本项
					if(!o.purSettle.costtype){
						nui.get("costtype").setValue("1");
					}else{
						nui.get("costtype").setValue(o.purSettle.costtype);
					}
					var custid = o.purSettle.custid;
					var orgid = o.purSettle.orgid;
					var projectno = o.purSettle.projectno;
					//结算单编号 
					var settlementid = o.purSettle.settlementid;
					//与订单相关外包人员信息
                    var json1 = nui.decode({custid: custid,projectno: projectno,settlementid: settlementid,setSettle: "2"});
                	datagridOutperson.sortBy("outpername","asc");
                	datagridOutperson.load(json1,function (){
                		datagridOutperson.selectAll(false);
                		var rows = datagridOutperson.getSelecteds();
                		for(var i = 0;i < rows.length;i++){
                			/* if(!rows[i].setdetailid){
                				datagridOutperson.deselect(rows[i]);
                			} */
                			if(rows[i].settlementid != settlementid){
                				datagridOutperson.deselect(rows[i]);
                			}
                		}
                		dosuminit = 1;
                	});
                    //与订单相关的计提信息
					var jsonPresettle = nui.decode({purPresettle: {custid: custid,projectno: projectno,settlementid: settlementid,iden: "2"}});
                	grid2.load(jsonPresettle,function(){
                		grid2.selectAll(false);
                		var rowsPresettle = grid2.getSelecteds();
                		for(var i = 0;i < rowsPresettle.length;i++){
                			if(rowsPresettle[i].settlementid != o.purSettle.settlementid){
                				grid2.deselect(rowsPresettle[i]);
                			}
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
        			/* //事业部领导审批人默认赋值
        			var sybname = "";
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
				error:function(){
				}
			});
		}
		
		function SaveData(){
			var auditstatus = nui.get("auditstatus").getValue();
			if(auditstatus == "1"){		//不是终止流程
				if(!form.validate()){
					return;
				}
			}
			GoSettlePayReview();
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
		
		//调用结算单审核逻辑流
    	function GoSettlePayReview(){
    		var data = form.getData();
    		var opioionformData = opioionform.getData();
    		var workitemid = nui.get("workitemid").getValue();
    		data.workitemid = workitemid;
    		var backTo = nui.get("backTo").getValue();
    		data.purSettle.backTo = backTo;
    		//外包人员信息
    		var rows = datagridOutperson.getSelecteds();
    		data.purSettle.purSettleLists = rows;
    		//计提信息
			var purPresettles = grid2.getSelecteds();
			data.purSettle.purPresettles = purPresettles;
			//审核信息
			data.misOpinion = opioionformData.misOpinion;
			//赋值审核人集合
    		data.sybempllist = sybempllist;
			data.iden = "review";
    		var json = nui.encode(data);
    		nui.ajax({
    			url:"com.primeton.eos.ame_pur.settlePay.makeGoSettlePayReview.biz.ext",
    			data:json,
    			type:"post",
    			contentType:"text/json",
    			success:function(action){
    				if(action.exception == null){
			        	nui.alert("提交成功","系统提示",function(){
			        		CloseWindow("ok");
			        	});
    				}else{
    					nui.alert("提交失败，请联系信息技术部人员！","系统提示", function(action){
    						nui.get("sureButton").setEnabled(true);
    					});
    				}
					//CloseWindow("ok");
    			},
    			error:function(jqXHR, textStatus, errorThrown){
    				nui.alert("error:" + jqXHR.responseText);
    			}
    		});
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
		
		function onOk(){
			//审核结果0：退回，1：提交，2：终止流程
			var auditstatus = nui.get("auditstatus").getValue();
			if(auditstatus == "2"){		//终止流程
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
	        	nui.confirm("确定终止流程吗？", "操作提示",
		            function (action) {            
		                if (action == "ok") {
		                	nui.get("sureButton").setEnabled(false);
					    	document.getElementById("fileCatalog1").value="purSettle";
							form4.submit();
						}else{
							return;
						}
					}
				);
			}else if(auditstatus == "0"){		//退回流程
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
						}
					);
				}else{
					return;
				}
			}else{
				var rows = datagridOutperson.getSelecteds();
	    		if(rows.length == 0){
					nui.alert("未选中外包人员记录");
					return;
				}
				var zongji = parseFloat(document.getElementById("sumtotal").innerHTML).toFixed(2);
	    		var zongje = parseFloat(nui.get("setamount").getValue()).toFixed(2);
				if(parseFloat(zongje) > parseFloat(zongji)){
					nui.alert("结算最终总金额(" + zongje + ")大于总计(" + zongji + ")");
					return;
				}
				var outpernos = [];
				for(var i = 0;i < rows.length;i ++){
					outpernos[i] = rows[i].outperno;
				}
				var sortoutpernos = outpernos.sort();
				/* for(var i = 0;i < sortoutpernos.length;i ++){
					if(sortoutpernos[i] == sortoutpernos[i+1]){
						nui.alert("同一个人员只能选中一条记录");
						return;
					}
				} */
			 	/* var userid = nui.get("sybcheckerid").getValue();
			 	var empname = nui.get("sybcheckerid").getText();
                var userids = userid.split(",");
                var empnames = empname.split(",");
                //重新选择审核人后，先清空之前默认的审核人集合再赋值
                sybempllist.length = 0;
                for(var i = 0;i < userids.length;i ++){
                	sybempllist[i] = {"userid": userids[i],"empname": empnames[i]};
                } */
				var nowdate = new Date();
				var nowyear = nowdate.getFullYear();
				var nowmonth;
				if(nowdate.getMonth() < 9){
					nowmonth = "0" + (nowdate.getMonth() + 1);
				}else{
					nowmonth = nowdate.getMonth() + 1;
				}
				var nowday;
				if(nowdate.getDate() <= 9){
					nowday = "0" + nowdate.getDate();
				}else{
					nowday = nowdate.getDate();
				}
				var now = nowyear + "-" + nowmonth + "-" + nowday;
	        	var startdate = nui.get("startdate").getValue();
	        	var enddate = nui.get("enddate").getValue();
	        	if(!startdate){
					nui.alert("开始日期不能为空");
					return;
				}
	    		if(!enddate){
	    			nui.alert("截止日期不能为空");
	    			return;
	    		}
				if(startdate.substring(0,10) > now){
					nui.alert("开始日期不能大于当前日期");
					return;
				}
				if(enddate.substring(0,10) > now){
					nui.alert("截止日期不能大于当前日期");
					return;
				}
	    		if(startdate > enddate){
	    			nui.alert("开始日期:" + startdate.substring(0,10) + "不能大于截止日期:" + enddate.substring(0,10));
	    			return;
	    		}
				for(var i = 0;i < rows.length;i ++){
					if(!rows[i].setstartdate){
						nui.alert("结算开始日期不能为空");
						return;
					}
					if(!rows[i].setenddate){
						nui.alert("结算截止日期不能为空");
						return;
					}
					if(nui.get("workunit").getValue() == "1"){//人月数计算
						if(!rows[i].months){
							nui.alert("人月数不能为空");
							return;
						}
		            }else{
						if(!rows[i].days){
							nui.alert("工作日统计不能为空");
							return;
						}
		            }
					if(rows[i].setstartdate > rows[i].setenddate){
	        			nui.alert("外包人员[" + rows[i].outpername + "]的结算开始日期:" + rows[i].setstartdate.substring(0,10) + "不能大于结算截止日期:" + rows[i].setenddate.substring(0,10));
	        			return;
	        		}
		        	if(rows[i].setstartdate.substring(0,10) > now){
						nui.alert("外包人员[" + rows[i].outpername + "]的结算开始日期不能大于当前日期");
						return;
					}
					if(rows[i].setenddate.substring(0,10) > now){
						nui.alert("外包人员[" + rows[i].outpername + "]的结算截止日期不能大于当前日期");
						return;
					}
					if(rows[i].setstartdate.substring(0,10) < startdate.substring(0,10) 
						|| rows[i].setstartdate.substring(0,10) > enddate.substring(0,10)){
						nui.alert("外包人员[" + rows[i].outpername + "]的结算开始日期不能超出结算单的结算日期");
						return;
					}
					if(rows[i].setenddate.substring(0,10) < startdate.substring(0,10) 
						|| rows[i].setenddate.substring(0,10) > enddate.substring(0,10)){
						nui.alert("外包人员[" + rows[i].outpername + "]的结算截止日期不能超出结算单的结算日期");
						return;
					}
				}
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
				if(form.validate()){
					if(nui.get("backTo").getValue() == ""){//提交
						var setamount = nui.get("setamount").getValue();
						nui.confirm("结算最终总金额为:" + setamount + "(元),确认提交吗？", "操作提示",
			            function (action) {            
			                if (action == "ok") {
			                	nui.get("sureButton").setEnabled(false);
						    	document.getElementById("fileCatalog1").value="purSettle";
								form4.submit();
							}else{
								return;
							}
						});
					}else{//退回
						var setamount = nui.get("setamount").getValue();
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
					}
					
				}else{
					return;
				}
			}
	    }
    
        //计算算费用 
        function doSumfee(e){
        	//setfee：本次结算费用，othfee：其他费用，totalfee：小计
        	var row = datagridOutperson.getRow(e.rowIndex);
        	var setfee = 0;
        	var othfee = 0;
        	var totalfee = 0;
        	var price = 0;
        	var days = 0;
        	var months = 0;
	        var sumtotalfee = 0;
	        var sumdaystotal = 0;
	        var summonthstotal = 0;
	        if(row.days){
	        	days = row.days;
	        }
        	if(row.months){
        		months = row.months;
        	}
        	if(row.price){
        		price = row.price; 
        	}
        	if(row.setfee){
        		setfee = row.setfee;
        	}
        	if(row.othfee){
        		othfee = row.othfee;
        	}
        	var setfee;
        	if(nui.get("workunit").getValue() == "1"){//人月数计算
        		setfee = (parseFloat(price) * parseFloat(months)).toFixed(2);
        	}else{//人天数计算
        		setfee = (parseFloat(price) * parseFloat(days)).toFixed(2);
        	}
        	var othfee = parseFloat(othfee).toFixed(2);
        	var totalfee = (parseFloat(setfee) + parseFloat(othfee)).toFixed(2);
        	//赋值小计费用 
        	var rowData = {totalfee: totalfee,setfee: setfee,othfee: othfee};
			datagridOutperson.updateRow(row,rowData);
			//获取编辑数据后求和 
			var datas = datagridOutperson.getSelecteds();
			for(var i=0;i<datas.length;i++){
				var totalfee = datas[i].totalfee;
				if(totalfee){
					if(!isNaN(totalfee)){
						sumtotalfee += parseFloat(totalfee);
					}
				}
				var days = datas[i].days;
				if(days){
					if(!isNaN(days)){
						sumdaystotal += parseFloat(days);
					}
				}
				var months = datas[i].months;
				if(months){
					if(!isNaN(months)){
						summonthstotal += parseFloat(months);
					}
				}
			}
			sumtotalfee = parseFloat(sumtotalfee).toFixed(2);
			sumdaystotal = parseFloat(sumdaystotal);
			summonthstotal = parseFloat(summonthstotal);
			if(doSumfeezongji != sumtotalfee){
				//赋值总费用
				var setamountValue = nui.get("setamount").getValue();
				sumtotalfee = parseFloat(sumtotalfee).toFixed(2);
				nui.get("setamount").setValue(sumtotalfee);
			}
			document.getElementById("sumtotal").innerHTML = parseFloat(sumtotalfee).toFixed(2);
			document.getElementById("daystotal").innerHTML = parseFloat(sumdaystotal).toFixed(2);
			document.getElementById("monthstotal").innerHTML = parseFloat(summonthstotal).toFixed(3);
			if(nui.get("workunit").getValue() == "1"){//人月数计算
				//设置工作量数量-人月数统计月数总量
	        	nui.get("workamount").setValue(document.getElementById("monthstotal").innerHTML);
        	}else{
				//设置工作量数量-人天数统计天数总量
	        	nui.get("workamount").setValue(document.getElementById("daystotal").innerHTML);
        	}
			doSumfeezongji = sumtotalfee;
        }
        
        function SaveData1(){
        	document.getElementById("fileCatalog").value="MIS_OPINION";
            form2.submit();
    	}
    	
        function checkDetail(){
        	var grid = nui.get("grid_0");
        	var selectRow = grid.getSelected();
        	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
			window.open(url, '_self');
        }
        
        /**
         * 工作量单位改变时
         */
        function changedWorkunit(){
        	if(nui.get("workunit").getValue() == "1"){//人月数计算
				//设置工作量数量-人月数统计月数总量
	        	nui.get("workamount").setValue(document.getElementById("monthstotal").innerHTML);
        	}else if(nui.get("workunit").getValue() == "2"){//人天数计算
				//设置工作量数量-人天数统计天数总量
	        	nui.get("workamount").setValue(document.getElementById("daystotal").innerHTML);
        	}else{
        		nui.get("workamount").setValue(0);
        	}
        }
        
        /**
         * 查看项目
         */
        function detailProj1(){
	 		var projectid = nui.get("projectid").getValue();
	 		var executeUrl = "<%=request.getContextPath() %>/project/rdproject/projectDetail.jsp?projid=" + projectid;
			window.open(executeUrl);
	    }
	    
	    //外包人员链接-编辑页面
	    function getOutperDetail(e){
	        return "<a href='javascript:void(0)' onclick='checkOutperDetail(" + e.record.outperno + ");' title='点击查看'>" + e.value + "</a>";
        }
        function checkOutperDetail(a){
			var executeUrl = "<%=request.getContextPath() %>/ame_pur/outperson/PurOutpersonLook.jsp?id=" + a;
			window.open(executeUrl, "外包人员详细信息", "fullscreen=1");
	    }
	    
	</script>
	<script type="text/javascript" src="<%= request.getContextPath() %>/ame_pur/settlepay/purSettleCommon.js"></script>
</body>
</html>