<%@page import="com.eos.foundation.eoscommon.ConfigurationUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2016-07-16 16:23:13
  - Description:
-->
<head>
	<title>查看流程业务信息</title>
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
	<%Long processInstID = Long.parseLong(request.getParameter("processInstID")); %>
	<div class="nui-fit">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;width: 920px">
			<legend>外包结算基本信息</legend>
				<form id="formSettle">
				<div style="padding:5px;">
				<input class="nui-hidden" name="processInstID" id="processInstID" value="<%=processInstID %>"/>
				<input name="purSettle.settlementid" id="settlementid" class="nui-hidden"/>
				<input name="purSettle.fileids" id="fileids1" class="nui-hidden"/>
				<input name="misOpinion.fileids" class="nui-hidden"/>
				<input name="purSettle.setstatus" id="setstatus" class="nui-hidden"/>
				<input name="purSettle.processinstid" id="processinstidSettle" class="nui-hidden" />
				<!-- 供应商简称 -->
				<input name="purSettle.suppliersname" id="suppliersname" class="nui-hidden" />
				<input name="misOpinion.processinstid" id="processinstid2" class="nui-hidden" />
				<!-- 销售合同编号 -->
				<input name="purSettle.cscontractid" id="cscontractid" class="nui-hidden" />
				<input id="contractidFince" class="nui-hidden" />
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">项目：</td>
							<td id="projectno" style="width:300px"></td>
							<td align="right" style="width:120px;">客户：</td>
							<td id="custno" style="width:240px;"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">供应商：</td>
							<td id="custid" style="width:240px"></td>
							<td align="right" style="width:120px;">受益部门：</td>
							<td id="benefitid" style="width:100px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">开始日期：</td>
							<td id="startdate" style="width:100px"></td>
							<td align="right" style="width:120px;">截止日期：</td>
							<td id="enddate" style="width:100px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">工作量单位：</td>
							<td id="workunit" style="width:50px"></td>
							<td align="right" style="width:120px;">工作量数量：</td>
							<td id="workamount" style="width:100px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">付款日期：</td>
							<td id="paydate" style="width:100px"></td>
							<td align="right" style="width:120px;">凭证号：</td>
							<td id="pzhs" style="width:150px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">凭证年：</td>
							<td id="pzyear" style="width:100px"></td>
							<td align="right" style="width:120px;">凭证月：</td>
							<td id="pzmonth" style="width:100px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">税率：</td>
							<td id="tax" style="width:50px"></td>
							<td align="right" style="width:120px;">不含税金额（元）：</td>
							<td id="notaxmon" style="width:100px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">成本确认日期：</td>
							<td id="confirmdate" style="width:100px"></td>
							<td align="right" style="width:120px;">工作量技术确认人：</td>
							<td id="confper" style="width:100px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">成本类型：</td>
							<td id="costtype" style="width:100px"></td>
							<td align="right" style="width:120px;">成本说明：</td>
							<td id="costmemo" style="width:100px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">项目对应合同：</td>
							<td id="cscontnum" style="width:140px"></td>
							<td align="right" style="width:120px;">财务对应合同：</td>
							<td id="contnum" style="width:140px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">结算单编号：</td>
							<td id="settlementno" style="width:100px"></td>
							<td align="right" style="width:120px;">导出操作：</td>
							<td>
								<a class="nui-button" onclick="exportSettle" iconCls="icon-download" style="width:120px;margin-right:20px;" id="exportButton">导出结算单</a>
							</td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">备注：</td>
							<td colspan="3" id="comment" style="width:440px"></td>
						</tr>
					</table>
				</div>
				</form>
			</fieldset>
			<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;width: 920px;">
				<legend>结算外包人员信息</legend>
				<div id="datagridOutperson" class="nui-datagrid" style="width:100%;height:auto;" multiSelect="true" 
			    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" allowSortColumn="false"
			    	onselect="onSelect" ondeselect="onDeselect" onlyCheckSelection="true">
					<div property="columns">
						<div field="outpername"width="60" align="center" headerAlign="center" allowSort="true" >姓名</div>	
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
						<div field="evaluate" width="auto" align="center" headerAlign="center" allowSort="true">
							评价
						</div>
						<div field="purordernum" width="135" align="center" headerAlign="center" allowSort="true">订单编号</div>
						<div field="purstatus" width="65" renderer="dictGetOrderStatus" align="center" headerAlign="center" allowSort="true">订单状态</div>
					</div>
				</div>
				<div style="width:765px;height:55px;margin-left:155px;float:left;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:65px;">总计：</td>
							<td id="daystotal" style="width:63px;" align="center" ></td>
							<td id="monthstotal" style="width:40px;" align="center" ></td>
							<td align="right" style="width:215px;">结算费用总计：</td>
							<td id="sumtotal" style="width:83px;" align="right" ></td>
						</tr>
						<tr>
							<td colspan="3"></td>
							<td align="right" style="width:215px;">结算最终总金额：</td>
							<td id="setamount" style="width:83px;" align="right"></td>
						</tr>
					</table>
				</div>
			</fieldset>
			
			<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;width: 920px;">
				<legend>计提核销信息</legend>
				<div id="datagrid2" class="nui-datagrid" dataField="purPresettles" style="width:100%;height:auto;" 
			    	url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleListToSettle.biz.ext" multiSelect="true"
			    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" 
			    	onselect="onSelectPre" ondeselect="onDeselectPre" 
			    	onlyCheckSelection="true" allowSortColumn="false">
					<div property="columns">
						<div field="accruedid" headerAlign="center" allowSort="true" visible="false">计提编号</div>
		                <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商编号</div>
		                <div field="custname" headerAlign="center" allowSort="true" visible="false">供应商名称</div>
		                <div field="suppliersname" width="80" headerAlign="center" allowSort="true" >供应商简称</div>
		                <div field="projectno" headerAlign="center" allowSort="true" visible="false">项目代码</div>
		                <div field="projectname" headerAlign="center" allowSort="true" visible="false">项目名称</div>
		                <div field="salesid" headerAlign="center" allowSort="true" visible="false" >所属销售ID</div>
		                <div field="orgname" headerAlign="center" allowSort="true" width="70" align="center" >所属销售</div>
		                <div field="syb" headerAlign="center" allowSort="true" width="100" renderer="dictGetContOrg" >所属事业部</div>
		                <div field="contnum" headerAlign="center" allowSort="true" visible="false">销售合同</div>
		                <div field="startdate" headerAlign="center" allowSort="true" width="80" align="center" >开始日期</div>
		                <div field="enddate" headerAlign="center" allowSort="true" width="80" align="center" >结束日期</div>
		                <div field="accrueddate" headerAlign="center" allowSort="true" width="80" align="center" dateFormat="yyyy-MM-dd" >计提时间</div>
		                <div field="accruedmoney" headerAlign="center" allowSort="true" width="90" align="right" dataType="currency" >计提金额</div>
		                <div field="outper" headerAlign="center" allowSort="true" width="120" >相关外包人员</div>
		                <div field="accruedstatus" headerAlign="center" allowSort="true" renderer="dictGetStatus" width="120" align="center" >状态</div>
		                <div field="settlementid" headerAlign="center" allowSort="true" visible="false" >结算单编号</div>
		                <div field="comment" width="auto" headerAlign="center" allowSort="true" >备注</div>
					</div>
				</div>
				<div style="width:300px;height:25px;margin-left:350px;float:left;">
				<table style="table-layout:fixed;">
					<tr>
						<td align="right" style="width:140px;">总计：</td>
						<td id="sumtotalpre" style="width:80px" align="right" ></td>
					</tr>
				</table>
				</div>
			</fieldset>
			<!-- 填写外包费用页面，除了结算单本身的信息，还需要填报信息：日常零星报销单编号（自生成）、受益部门、
				  付款方式（必选）、收款单位（必选）、银行名称、银行账号、单位电话（可填）、对应客户、对应项目、
				  外包费用对应日期、外包服务金额、解释说明（可填） -->
			<!-- 报销单 -->
			<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;width: 920px;">
				<legend>报销单</legend>
				<div style="padding:5px;">
					<!-- 报销单编号 -->
					<input name="expReiList.expno" id="pettyexpno" class="nui-hidden" />
					<!-- 项目ID -->
					<input name="expReiList.projectid" id="projectid" class="nui-hidden" />
					<!-- 报销记录id -->
					<input name="expReiList.expRei.reiid" id="reiid" class="nui-hidden" />
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width: 120px;">受益部门：</td>
							<td id="benefitid2" style="width: 200px"></td>
							<td align="right" style="width:120px;">付款方式：</td>
							<td id="appmode" style="width: 300px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">收款单位：</td>
							<td id="companyname" style="width: 300px"></td>
							<td align="right" style="width:120px;">银行名称：</td>
							<td id="bankname" style="width: 300px;"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">银行账号：</td>
							<td id="bankacct" style="width: 300px"></td>
							<td align="right" style="width:120px;">单位电话：</td>
							<td id="companytel" style="width: 300px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">对应客户：</td>
							<td id="custno2" style="width: 300px;"></td>
							<td align="right" style="width:120px;">对应项目：</td>
							<td id="projectno2" style="width: 300px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">外包服务金额(元)：</td>
							<td id="setamount2" style="width: 300px"></td>
							<td align="right" style="width:120px;">对应项目编号：</td>
							<td id="projectno3" style="width: 300px"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">解释说明：</td>
							<td colspan="3" id="explain" style="width:450px;height:40px;"></td>
						</tr>
						<tr>
							<td align="right" style="width:120px;">查看报销单：</td>
							<td id="projectid2" style="width: 300px"></td>
							<td align="right" style="width:120px;">查看商务合同：</td>
							<td id="cscontnum2" style="width: 300px"></td>
						</tr>
					</table>
				</div>
			</fieldset>
		<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;width: 920px;">
			<legend>外包结算附件</legend>
			<jsp:include page="/ame_common/detailFile.jsp"/>
		</fieldset>
		<!-- 审核意见  -->
		<div style="width: 927px;">
		<jsp:include page="/ame_common/misOpinion.jsp"/>
		</div>
	</div>
	<!-- 导出结算信息表单 -->
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
	<script type="text/javascript">
        nui.parse();
        var fromSettle = new nui.Form("#formSettle");
	  	var opioionform = new nui.Form("#opioionform");
	  	var datagridOutperson = nui.get("datagridOutperson");
	  	var grid2 = nui.get("datagrid2");
	  	var dosuminit = 0;
		init();
		
		function init(){
			document.getElementById("opinionHide").style.display="none";
    		var data = {processInstID: <%=processInstID %>,workItemID: "0",goSettleStep: "leaderApprove"};
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
            		//hidden
            		nui.get("settlementid").setValue(o.purSettle.settlementid);
            		nui.get("setstatus").setValue(o.purSettle.setstatus);
            		nui.get("processinstidSettle").setValue(o.purSettle.processinstid);
            		nui.get("suppliersname").setValue(o.purSettle.suppliersname);
            		//流程和工作项ID
					nui.get("processInstID").setValue(<%=processInstID %>);
            		nui.get("processinstid2").setValue(o.purSettle.processinstid);
					nui.get("fileids").setValue(o.purSettle.fileids);
            		
            		//结算单赋值//document.getElementById("").innerHTML = o.purSettle. == null ? "" : o.purSettle.;
					//供应商名称
					document.getElementById("custid").innerHTML = o.purSettle.custname == null ? "" : o.purSettle.custname;
					//客户名称
					document.getElementById("custno").innerHTML = o.purSettle.miscustname == null ? "" : o.purSettle.miscustname;
					//项目名称
					document.getElementById("projectno").innerHTML = o.purSettle.projectname == null ? "" : o.purSettle.projectname + "(" + o.purSettle.projectno + ")";
					//受益部门名称
					document.getElementById("benefitid").innerHTML = o.purSettle.orgname == null ? "" : o.purSettle.orgname;
					//结算开始日期
					document.getElementById("startdate").innerHTML = o.purSettle.startdate == null ? "" : o.purSettle.startdate;
					//结算截止日期
					document.getElementById("enddate").innerHTML = o.purSettle.enddate == null ? "" : o.purSettle.enddate;
					//工作量单位
					document.getElementById("workunit").innerHTML = o.purSettle.workunit == null ? "" : nui.getDictText("SERV_NUM_TYPE",o.purSettle.workunit);
					//工作量数量
					document.getElementById("workamount").innerHTML = o.purSettle.workamount == null ? "" : o.purSettle.workamount;
					//结算最终总金额
					document.getElementById("setamount").innerHTML = o.purSettle.setamount == null ? "" : parseFloat(o.purSettle.setamount).toFixed(2);
					//工作量技术确认人
					document.getElementById("confper").innerHTML = o.purSettle.confper == null ? "" : o.purSettle.confper;
					//备注
					document.getElementById("comment").innerHTML = o.purSettle.comment == null ? "" : o.purSettle.comment;
					//付款日期
					document.getElementById("paydate").innerHTML = o.purSettle.paydate == null ? "" : o.purSettle.paydate;
					//凭证号
					document.getElementById("pzhs").innerHTML = o.purSettle.pzhs == null ? "" : o.purSettle.pzhs;
					//税率
					document.getElementById("tax").innerHTML = o.purSettle.tax == null ? "" : o.purSettle.tax;
					//不含税金额
					document.getElementById("notaxmon").innerHTML = o.purSettle.notaxmon == null ? "" : o.purSettle.notaxmon;
					//成本确认日期
					document.getElementById("confirmdate").innerHTML = o.purSettle.confirmdate == null ? "" : o.purSettle.confirmdate;
					//成本类型
					document.getElementById("costtype").innerHTML = o.purSettle.costtype == null ? "" : nui.getDictText("AME_CONTCOSTTYPE",o.purSettle.costtype);
					//成本说明
					document.getElementById("costmemo").innerHTML = o.purSettle.costmemo == null ? "" : nui.getDictText("AME_COSTTYPE",o.purSettle.costmemo);
					//结算单编号
					document.getElementById("settlementno").innerHTML = o.purSettle.settlementno == null ? "" : o.purSettle.settlementno;
					//凭证年
					document.getElementById("pzyear").innerHTML = o.purSettle.pzyear == null ? "" : o.purSettle.pzyear;
					//凭证月
					document.getElementById("pzmonth").innerHTML = o.purSettle.pzmonth == null ? "" : o.purSettle.pzmonth;
					if(o.purSettle.cscontractid){
						nui.get("cscontractid").setValue(o.purSettle.cscontractid);
						if(o.purSettle.cscontnum){
							document.getElementById("cscontnum").innerHTML = "<a href='#' onclick='javascript: doViewCsContract();' >" + o.purSettle.cscontnum + "</a>";
						}else{
							document.getElementById("cscontnum").innerHTML = "<a href='#' onclick='javascript: doViewCsContract();' >" + o.purSettle.cscontractid + "</a>";
						}
					}else{
						document.getElementById("cscontnum").innerHTML = "无项目对应合同";
					}
					//财务对应合同
					if(o.purSettle.contractidFince){
						nui.get("contractidFince").setValue(o.purSettle.contractidFince);
					}
					if(o.purSettle.contnum){
						document.getElementById("contnum").innerHTML = "<a href='#' onclick='javascript: doViewContract();' >" + o.purSettle.contnum + "</a>";
					}else{
						document.getElementById("contnum").innerHTML = "无财务对应合同";
					}
					//报销单表单赋值
					if(o.purSettle.pettyexpno){
						document.getElementById("setamount2").innerHTML = o.purSettle.setamount == null ? 0 : o.purSettle.setamount;
						//hidden
						nui.get("projectid").setValue(o.purSettle.projectid);//项目id
						//项目名称
						document.getElementById("projectno2").innerHTML = o.purSettle.projectname == null ? "" : o.purSettle.projectname;
						//项目no
						document.getElementById("projectno3").innerHTML = o.purSettle.projectno == null ? "" : o.purSettle.projectno;
						//客户名称
						document.getElementById("custno2").innerHTML = o.purSettle.custname == null ? "" : o.purSettle.custname;
						//所属销售名称
						document.getElementById("benefitid2").innerHTML = o.purSettle.orgname == null ? "" : o.purSettle.orgname;
						//银行卡名称
						document.getElementById("bankname").innerHTML = o.expReiList.expRei.bankname == null ? "" : o.expReiList.expRei.bankname;
						//银行卡账号
						document.getElementById("bankacct").innerHTML = o.expReiList.expRei.bankacct == null ? "" : o.expReiList.expRei.bankacct;
						//收款单位
						document.getElementById("companyname").innerHTML = o.expReiList.expRei.companyname == null ? "" : o.expReiList.expRei.companyname;
						//付款方式
						document.getElementById("appmode").innerHTML = o.expReiList.expRei.paymode == null ? "" : nui.getDictText("EXP_PAYMODE",o.expReiList.expRei.paymode);
						//单位电话
						document.getElementById("companytel").innerHTML = o.expReiList.expRei.companytel == null ? "" : o.expReiList.expRei.companytel;
						//解释说明
						document.getElementById("explain").innerHTML = o.expReiList.explain == null ? "" : o.expReiList.explain;
						
						//隐藏文本框
						nui.get("reiid").setValue(o.expReiList.expRei.reiid);//报销记录编号
						nui.get("pettyexpno").setValue(o.expReiList.expno);//报销单编号
						document.getElementById("projectid2").innerHTML = o.expReiList.expno == null ? "" : "<a href='#' onclick='javascript: doView();' >" + o.expReiList.expno + "</a>";
						if(o.purSettle.cscontractid){
							if(o.purSettle.cscontnum){
								document.getElementById("cscontnum2").innerHTML = "<a href='#' onclick='javascript: doViewCsContract();' >" + o.purSettle.cscontnum + "</a>";
							}else{
								document.getElementById("cscontnum2").innerHTML = "<a href='#' onclick='javascript: doViewCsContract();' >" + o.purSettle.cscontractid + "</a>";
							}
						}else{
							document.getElementById("cscontnum2").innerHTML = "无商务合同";
						}
					}
					
					var custid = o.purSettle.custid;
					var orgid = o.purSettle.orgid;
					
					//结算单编号 
					var settlementid = o.purSettle.settlementid;
					//与订单相关外包人员信息
                    var projectno = o.purSettle.projectno;
					var custno = o.purSettle.miscustid;
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
                    var jsonPresettle = nui.decode({purPresettle: {projectno: o.purSettle.projectno,settlementid: settlementid,iden: 3}});
                	grid2.load(jsonPresettle,function(){
                		grid2.selectAll(false);
                		var rowsPresettle = grid2.getSelecteds();
                		for(var i = 0;i < rowsPresettle.length;i++){
                			if(!rowsPresettle[i].settlementid){
                				grid2.deselect(rowsPresettle[i]);
                			}
                		}
                	});
                    //查询审核意见
                    var processinstid = nui.get("processinstid2").getValue();
					var grid = nui.get("datagrid1");
					grid.load({processInstID:processinstid});
					grid.sortBy("time", "desc");
				},
				error:function(){}
			});
		}
		
		//选择行
		var allSum = 0;
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
            document.getElementById("daystotal").innerHTML = parseFloat(sumdays).toFixed(1);
            document.getElementById("monthstotal").innerHTML = parseFloat(summonths).toFixed(1);
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
			document.getElementById("daystotal").innerHTML = parseFloat(sumdays).toFixed(1);
            document.getElementById("monthstotal").innerHTML = parseFloat(summonths).toFixed(1);
        }
        //选择行计提
        var allSumPre = 0;
        function onSelectPre(e){
        	var rows = grid2.getSelecteds();
        	var sumFee = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].accruedmoney){
					sumFee += parseFloat(rows[i].accruedmoney);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
            allSumPre = sumFee;
            allSumPre = parseFloat(allSumPre).toFixed(2);
            document.getElementById("sumtotalpre").innerHTML = parseFloat(allSumPre).toFixed(2);
        }
        
        //取消选中行计提
        function onDeselectPre(e){
        	var rows = grid2.getSelecteds();
        	var sumFee = 0;
			for(var i = 0;i < rows.length;i ++){
				if(rows[i].accruedmoney){
					sumFee += parseFloat(rows[i].accruedmoney);
				}
			}
			sumFee = parseFloat(sumFee).toFixed(2);
			allSumPre = sumFee;
			allSumPre = parseFloat(allSumPre).toFixed(2);
			document.getElementById("sumtotalpre").innerHTML = parseFloat(allSumPre).toFixed(2);
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
			if(form.validate()){
				nui.confirm("确认提交吗？", "确定？",
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
        
		//查看报销单信息
		function doView(){
			var reiid = nui.get("reiid").getValue();
			var executeUrl = "<%= request.getContextPath() %>/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + reiid;
			window.open(executeUrl);
		}
		
		//查看销售合同信息
		function doViewCsContract(){
<%	String newBXAdd = ConfigurationUtil.getContributionConfig("com.primeton.eos.ame_common","NewBXSystem","addressAndPort","ipaddress");
	String newBXPort = ConfigurationUtil.getContributionConfig("com.primeton.eos.ame_common","NewBXSystem","addressAndPort","port");
	String newBXAppName = ConfigurationUtil.getContributionConfig("com.primeton.eos.ame_common","NewBXSystem","addressAndPort","appName");

 %>
			var cscontractid = nui.get("cscontractid").getValue();
			var newBXPort = "<%=newBXPort %>"
			if(newBXPort == ""){
				window.open("http://<%=newBXAdd %>/<%=newBXAppName %>/contract/contract/contractView.jsp?contractid="+cscontractid,"csContractView","height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
			}else{
				window.open("http://<%=newBXAdd %>:<%=newBXPort %>/<%=newBXAppName %>/contract/contract/contractView.jsp?contractid="+cscontractid,"csContractView","height=600,width=1000,top=0,left=0,toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no");
			}
		}
		
		function SaveData1(){
        	document.getElementById("fileCatalog").value="MIS_OPINION";
            form2.submit();
    	}
    	
    	//生成外包结算单
        function exportSettle(){
        	var companyname = document.getElementById("companyname").innerHTML;
			var bankname = document.getElementById("bankname").innerHTML;
			var bankacct = document.getElementById("bankacct").innerHTML;
			
        	nui.confirm("确认导出结算单？", "操作提示",
            function (action) {            
                if (action == "ok") {
		        	var form = new nui.Form("#formSettle");
					var json = form.getData();
					var custname = document.getElementById("custid").innerHTML;
					var projectname = document.getElementById("projectno").innerHTML;
					var outperson = datagridOutperson.getSelecteds();
					var sumtotal = document.getElementById("sumtotal").innerHTML;
					sumtotal = parseFloat(sumtotal);
					var setamount = document.getElementById("setamount").innerHTML;
					setamount = parseFloat(setamount);
					var settlementid = nui.get("settlementid").getValue();
					json.purSettle.custname = custname;
					json.purSettle.projectname = projectname;
					json.purSettle.companyname = companyname;
					json.purSettle.bankname = bankname;
					json.purSettle.bankacct = bankacct;
					json.purSettle.sumtotal = sumtotal;
					json.purSettle.settlementids = settlementid + "";
					json.purSettle.setamount = setamount;
					json.outperson = outperson;
					nui.ajax({
		    			url: "com.primeton.eos.ame_pur.settle.exportSettle.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		nui.unmask();
				        	var filePath = o.downloadFile;
				        	var fileName = "结算单";
				        	var myDate = new Date();
				        	var year = myDate.getFullYear();
				        	var month = myDate.getMonth()+1;
				        	var day = myDate.getDate();
				        	var hours = myDate.getHours();
				        	var minutes = myDate.getMinutes();
				        	var seconds = myDate.getSeconds();
				        	var curDateTime = year;
				        	if(month>9){
								curDateTime = curDateTime + "" + month;
							}else{
								curDateTime = curDateTime + "0" + month;
								}
				        	if(day>9){
								curDateTime = curDateTime + day;
							}else{
								curDateTime = curDateTime + "0" + day;
								}
							if(hours>9){
								curDateTime = curDateTime + hours;
							}else{
								curDateTime = curDateTime + "0" + hours;
								}
							if(minutes>9){
								curDateTime = curDateTime + minutes;
							}else{
								curDateTime = curDateTime + "0" + minutes;
								}
							if(seconds>9){
								curDateTime = curDateTime + seconds;
							}else{
								curDateTime = curDateTime + "0" + seconds;
								}
							fileName = fileName + "_" + curDateTime + ".xls";
							var frm = document.getElementById("viewlist1");
				        	frm.elements["downloadFile"].value = filePath;
				        	frm.elements["fileName"].value = fileName;
						    frm.submit();
				        },
				        error: function () {
				        	alert("error");
				        }
					});
				}else{
					return;
				}
			});
        }
	</script>
</body>
</html>