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
  - Date: 2016-06-07 14:31:34
  - Description:
-->
<head>
	<title>结算流程发起</title>
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
	<div class="nui-fit">
		<div class="mini-panel" title="发起外包结算流程" style="width: 1320px">
			<!-- 提示信息展示 -->
			<jsp:include page="/ame_common/ameFlowOperTips/ameFlowOperTipsInfo.jsp"/>
			<form id="form1" method="post">
				<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;width: 1250px">
					<legend>外包结算基本信息</legend>
					<input name="purSettle.settlementid" id="settlementid" class="nui-hidden"/>
					<input name="purSettle.fileids" id="fileids" class="nui-hidden"/>
					<input name="purSettle.setstatus" id="setstatus" class="nui-hidden" value="0"/>
					<!-- 客户简称 -->
					<input name="purSettle.custjc" id="custjc" class="nui-hidden" />
					<!-- 供应商简称 -->
					<input name="purSettle.suppliersname" id="suppliersname" class="nui-hidden" />
					<input name="purSettle.save" id="save" class="nui-hidden" />
					<!-- 内部商务合同编号 -->
					<input name="purSettle.contnum" id="contnum" class="nui-hidden" />
					<div style="padding:5px;">
						<table style="table-layout:fixed;" id="table_file">
							<tr>
								<td align="right" style="width:120px;">项目：</td>
								<td><input name="purSettle.projectno" id="projectno" onbuttonclick="selectProject" class="nui-buttonedit" allowInput="false" emptyText="请选择项目" required="true" style="width:240px" /></td>
								<td align="right" style="width:120px;">客户：</td>
								<td><input name="purSettle.custno" id="custno" valueField="miscustid" textField="miscustname" readOnly="readOnly" showButton="false" class="nui-combobox" required="true" style="width:280px;" /></td>
							</tr>
							<tr>
								<td align="right" style="width:120px;">供应商：</td>
								<td><input name="purSettle.custid" onvaluechanged="changeCust" id="custid"  valueField="custid" textField="custname" class="nui-combobox" required="true" style="width:200px" allowInput="false" />
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
								<td><input name="purSettle.workunit" id="workunit" onvaluechanged="changedWorkunit" value="1" class="nui-dictcombobox" dictTypeId="SERV_NUM_TYPE" required="false" style="width: 80px" /></td>
								<!-- 工作量数量 -->
								<td align="right" style="width:120px;">工作量数量：</td>
								<td><input name="purSettle.workamount" id="workamount" class="nui-spinner" showButton="false" 
									allowLimitValue="false" changeOnMousewheel="false" style="width: 100px;" 
									inputStyle="text-align: left" readOnly="readOnly" /></td>
							</tr>
							<tr>
								<td align="right" style="width:120px;">工作量技术确认人：</td>
								<td colspan="3"><input name="purSettle.confper" id="confper" class="nui-textbox" required="false" style="width:100px"/></td>
							</tr>
							<tr>
								<td align="right" style="width:120px;">备注：</td>
								<td colspan="3"><input name="purSettle.comment" id="comment" class="nui-textarea" required="false" style="width:440px"/></td>
							</tr>
						</table>
					</div>
				</fieldset>
				<fieldset id="field2" style="border:solid 1px #aaa;padding:3px;width: 1250px">
					<legend>外包人员结算信息</legend>
					<div id="datagridOutperson" class="nui-datagrid" dataField="outPersons" style="width:100%;height:auto;" 
				    	url="com.primeton.eos.ame_pur.outperson.queryPurpersonToSettle.biz.ext" multiSelect="true" 
				    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" allowSortColumn="false"
				    	oncellendedit="doSumfee" onselect="onSelect" ondeselect="onDeselect" 
				    	onlyCheckSelection="true">
						<div property="columns">
							<div type="checkcolumn" width="30"></div>
							<div field="setdetailid" width="80" align="center" headerAlign="center" allowSort="true" visible="false">结算明细id</div>
							<div field="purorderid" align="center" headerAlign="center" allowSort="true" visible="false">采购订单ID</div>
							<div field="outperno" align="center" headerAlign="center" allowSort="true" visible="false">编号</div>
							<div field="outpername"width="60" align="center" headerAlign="center" allowSort="true" >姓名</div>	
							<div field="setstartdate" width="100" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">
								结算开始日期
								<input property="editor" required="true" errormode="border" class="nui-datepicker" style="width:100%;" />
							</div>
							<div field="setenddate" width="100" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">
								结算截止日期
								<input property="editor" required="true" errormode="border" class="nui-datepicker" style="width:100%;" />
							</div>
							<div field="days" width="70" align="center" headerAlign="center" allowSort="true">
								工作日统计
								<input property="editor" required="false" class="nui-spinner" showButton="false" allowLimitValue="false" changeOnMousewheel="false" style="width:100%;" />
							</div>
							<div field="months" width="45" align="center" headerAlign="center" allowSort="true">
								人月数
								<input property="editor" required="false" class="nui-spinner" showButton="false" allowLimitValue="false" changeOnMousewheel="false" style="width:100%;" />
							</div>
							<div field="price" width="85" dataType="currency" align="right" headerAlign="center" allowSort="true">
								服务单价(元)
								<%--<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>--%>
							</div>
							<div field="setfee" width="80" dataType="currency" align="right" headerAlign="center" allowSort="true">
								工时结算费用
								<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
							</div>
							<div field="othfee" width="60" dataType="currency" align="right" headerAlign="center" allowSort="true">
								其他费用
								<input property="editor" class="nui-textbox" style="width:100%;" vtype="float"/>
							</div>
							<div field="totalfee" summaryType="sum" required="true" dataType="currency" width="90" dataType="currency" align="right" headerAlign="center" allowSort="true">
								结算费用小计
								<input property="editor" class="nui-textbox" allowInput="false" style="width:100%;" vtype="float" />
							</div>
							<div field="score" width="40" align="center" headerAlign="center" allowSort="true">
								打分
								<input property="editor" class="nui-textbox" style="width:100%;" />
							</div>
							<div field="evaluate" width="auto" align="center" headerAlign="center" allowSort="true">
								评价
								<input property="editor" class="nui-textbox" style="width:100%;" />
							</div>
							<div field="purordernum" width="130" align="center" headerAlign="center" allowSort="true">订单编号</div>
							<div field="currentstatus" align="center" headerAlign="center" allowSort="true" visible="false">人员状态</div>
							<div field="purstatus" align="center" headerAlign="center" allowSort="true" renderer="dictGetOrderStatus" visible="false">订单状态</div>
						</div>
					</div>
					<div style="width:800px;height:55px;margin-left:190px;float:left;">
						<table style="table-layout:fixed;">
							<tr>
								<td align="right" style="width:95px;">总计：</td>
								<td id="daystotal" style="width:66px;" align="center" ></td>
								<td id="monthstotal" style="width:46px;" align="center" ></td>
								<td align="right" style="width:215px;">结算费用总计：</td>
								<td id="sumtotal" style="width:85px;" align="right" ></td>
							</tr>
							<tr>
								<td colspan="3"></td>
								<td align="right" style="width:215px;">结算最终总金额：</td>
								<td><input name="purSettle.setamount" id="setamount" inputStyle="text-align:right;" vtype="float" class="nui-textbox" required="false" style="width:92px" /></td>
							</tr>
						</table>
					</div>
				</fieldset>
				
				<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;width: 1300px;">
					<legend>计提核销信息</legend>
					<div id="datagrid2" class="nui-datagrid" dataField="purPresettles" style="width:100%;height:auto;" 
				    	url="com.primeton.eos.ame_pur.outaccrued.queryPurPresettleListToSettle.biz.ext" multiSelect="true"
				    	showFooter="false" showPager="false" allowCellEdit="true" allowCellSelect="true" 
				    	onselect="onSelectPre" ondeselect="onDeselectPre" 
				    	onlyCheckSelection="true" allowSortColumn="false">
						<div property="columns">
							<div type="checkcolumn" width="30">&nbsp;</div>			
							<div field="accruedid" width="60" headerAlign="center" allowSort="true" visible="true">计提编号</div>
			                <div field="custid" headerAlign="center" allowSort="true" visible="false">供应商编号</div>
			                <div field="custname" headerAlign="center" allowSort="true" visible="false">供应商名称</div>
			                <div field="suppliersname" width="80" headerAlign="center" allowSort="true" >供应商简称</div>
			                <div field="projectno" headerAlign="center" allowSort="true" visible="false">项目代码</div>
			                <div field="projectname" headerAlign="center" allowSort="true" visible="false">项目名称</div>
			                <div field="salesid" headerAlign="center" allowSort="true" visible="false" >所属销售ID</div>
			                <div field="orgname" headerAlign="center" allowSort="true" width="70" align="center" >所属销售</div>
			                <div field="syb" headerAlign="center" allowSort="true" width="100" renderer="dictGetContOrg" >所属事业部</div>
			                <div field="contnum" headerAlign="center" allowSort="true" visible="false">销售合同</div>
			                
			                <div field="workunit" width="70" align="center" headerAlign="center" allowSort="true" renderer="dictGetWorkunit">工作量单位</div>
		                	<div field="workamount" width="70" align="center" headerAlign="center" allowSort="true" >工作量数量</div>
			                
			                <div field="startdate" headerAlign="center" allowSort="true" width="80" align="center" >开始日期</div>
			                <div field="enddate" headerAlign="center" allowSort="true" width="80" align="center" >结束日期</div>
			                <div field="accruedmoney" headerAlign="center" allowSort="true" width="100" align="right" dataType="currency" >计提金额</div>
			                <div field="costtype" headerAlign="center" allowSort="true" renderer="dictGetCostType" width="70" align="center" >成本类型</div>
			                <div field="outper" headerAlign="center" allowSort="true" width="200" >相关外包人员</div>
			                <div field="accrueddate" headerAlign="center" allowSort="true" width="80" align="center" dateFormat="yyyy-MM-dd" >计提时间</div>
			                <div field="accruedstatus" headerAlign="center" allowSort="true" renderer="dictGetStatus" width="120" align="center" >状态</div>
			                <div field="settlementid" headerAlign="center" allowSort="true" visible="false" >结算单编号</div>
			                <div field="comment" width="auto" headerAlign="center" allowSort="true" >备注</div>
						</div>
					</div>
					<div style="width:500px;height:25px;margin-left: 240px;float:left;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:270px;">总计：</td>
							<td id="sumtotalworkamount" style="width:125px;" align="center" ></td>
							<td style="width: 300px;"></td>
							<td id="sumtotalpre" style="width:100px;" align="right" ></td>
						</tr>
					</table>
					</div>
				</fieldset>
			</form>
			<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
				<legend>外包结算附件</legend>
				<jsp:include page="/ame_common/addFiles.jsp"/>
			</fieldset>
			<!-- 审核意见  -->
			<%-- <jsp:include page="/ame_common/misOpinion.jsp"/> --%>
			<form id="opioionform" method="post">
		        <div style="padding:5px;" id="opinionHide">
		            <table style="table-layout:fixed;">
		            	<tr id="salesEdit">
		                    <td style="width:150px;" align="right">审核结果：</td>
		                    <td style="width:250px;">  
								<input name="misOpinion.auditstatus" id="auditstatus" class="mini-dictradiogroup" value="1" style="width:250px;" required="true" dictTypeId="MIS_AUDITSTATUS"  onvaluechanged="show()" />
		                    </td>
		                </tr>
		                <tr>
		                    <td style="width:150px;height:auto;" align="right">任务处理说明：</td>
		                    <td colspan="3">
		                        <input name="misOpinion.auditopinion" id="auditopinion" class="nui-textarea" required="false" style="width:600px;height:60px;"/>
		                    </td>
		                </tr>
		            </table>
		        </div>
	    	</form>
		</div>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-checkbox" style="width:100px;padding-left: 10px;float: left;" id="guanZhuButton">关注流程</a>
		<a class="nui-button" onclick="exportSettle" iconCls="icon-download" style="width:105px;margin-right:20px;" id="exportButton">导出结算单</a>
		<a class="nui-button" onclick="onOk('app')" style="width:138px;margin-right:20px;" id="appButton"  iconCls="icon-create">发起结算申请流程</a>
		<a class="nui-button" onclick="onOk('save')" iconCls="icon-save" style="width:95px;margin-right:20px;" id="saveButton">暂时保存</a>
	</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
	<script type="text/javascript">
		nui.parse();
		//AME_OUTPERSTATUS外包人员状态(0-已离场,1-协议服务中,2-报备服务中)
		//更新逻辑流路径
		var updateURL = "com.primeton.eos.ame_pur.settle.updatePursettle.biz.ext";
        //新增逻辑流路径
    	var addURL = "com.primeton.eos.ame_pur.settle.addPursettle.biz.ext";
    	var saveURL = "";
	  	var form = new nui.Form("form1");
	  	var opioionform = new nui.Form("#opioionform");
	  	var datagridOutperson = nui.get("datagridOutperson");
	  	var grid2 = nui.get("datagrid2");
	  	var GURL = "<%=request.getContextPath() %>";
	  	var isflag = "0";
	  	
		init();
		function init(){
			promptInit({"workItemID":0,"processDefName":"com.primeton.eos.ame_pur.ame_purSettlePay","activityDefID":"manualActivity"});
			/* 
			设置流程处理结果为三项
			var dataStatus = [{"dictID": 1,"dictName": "通过"},{"dictID": 0,"dictName": "退回"},{"dictID": 2,"dictName": "终止流程"}];
			nui.get("auditstatus").setData(dataStatus);
			 */
			//设置流程发起页面处理结果为 发起(3)
			nui.get("auditstatus").setValue(3);
			document.getElementById("salesEdit").style.display="none";
			//document.getElementById("choosehide").style.display="none";
			nui.get("auditopinion").setValue("");
		}

		//发起结算申请
		function SaveData(){
			var save = nui.get("save").getValue();
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
			if(startdate.substring(0,10) > now){
				nui.alert("开始日期不能大于当前日期");
				return;
			}
			if(enddate.substring(0,10) > now){
				nui.alert("截止日期不能大于当前日期");
				return;
			}
			if(!startdate){
				nui.alert("开始日期不能为空");
				return;
			}
    		if(!enddate){
    			nui.alert("截止日期不能为空");
    			return;
    		}
    		if(startdate > enddate){
    			nui.alert("开始日期:" + startdate.substring(0,10) + "不能大于截止日期:" + enddate.substring(0,10));
    			return;
    		}
    		//结算的成本类型-初始化默认为成本项
    		var purSettleCosttype = "1";
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
				if(save != "save"){
					if(rows[i].currentstatus == "2"){
						nui.alert("外包人员[" + rows[i].outpername + "]，状态为报备服务中，不允许发起结算流程，可暂时保存。如需发起结算流程，请先对该外包人员进行订单流程处理！");
						return;
					}
				}
			}
			if(form.validate()){
				var setamount = nui.get("setamount").getValue();
				if(save == "save"){
					nui.confirm("结算最终总金额为:" + setamount + "(元),确认暂时保存？", "确定？",
			            function (action) {            
			                if (action == "ok") {
			                	//设置工作量数量
			                	nui.get("appButton").setEnabled(false);
			                	nui.get("saveButton").setEnabled(false);
			                	var data = form.getData();
					    		//将外包人员信息附带在结算信息中 
								var rows1 = datagridOutperson.getSelecteds();
								data.purSettle.purSettleLists = rows1;
								//计提信息
								var purPresettles = grid2.getSelecteds();
								if(purPresettles.length > 0){
									purSettleCosttype = purPresettles[0].costtype;
								}
								data.purSettle.purPresettles = purPresettles;
								//采购合同id
								data.purSettle.purcontid = data.purSettle.purSettleLists[0].purcontid;
								var custjc = nui.get("custjc").getValue();
								var custname = nui.get("custno").getText();
								var suppliersname = nui.get("suppliersname").getValue();
								data.custjc = custjc;
								data.suppliersname = suppliersname; 
								data.custname = custname; 
								//附件ID赋值
								data.purSettle.fileids = nui.get("fileids").getValue();
								//审核信息
								var opioionformData = opioionform.getData();
								data.misOpinion = opioionformData.misOpinion;
								//流程关注
								data.purSettle.guanzhu = nui.get("guanZhuButton").getValue();
								//结算的成本类型
								data.purSettle.costtype = purSettleCosttype;
					    		var json = nui.decode(data);
					    		form.loading("暂时保存处理中,请稍后...");
					    		nui.ajax({
					    			url:"com.primeton.eos.ame_pur.settlePay.makeGoSettlePay.biz.ext",
					    			data:json,
					    			type:"post",
					    			contentType:"text/json",
					    			success:function(action){
					    				form.unmask();
					    				var actionJson = nui.decode(action);
					    				if(actionJson.exception == null){
								        	nui.alert("保存成功","系统提示",function(){
								        		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=self";
								        	});
					    				}else{
					    					nui.alert("保存失败，请联系信息技术部人员！","系统提示", function(action){
					    						nui.get("appButton").setEnabled(true);
			                					nui.get("saveButton").setEnabled(true);
					    					});
					    				}
					    			},
					    			error:function(jqXHR, textStatus, errorThrown){
					    				nui.alert("error:" + jqXHR.responseText);
					    			}
					    		});
			                } else {
			                    return;
			                }
			            }
			        );
				}else{
					nui.confirm("结算最终总金额为:" + setamount + "(元),确认发起流程？", "确定？",
			            function (action) {            
			                if (action == "ok") {
			                	//设置工作量数量
			                	nui.get("appButton").setEnabled(false);
			                	nui.get("saveButton").setEnabled(false);
			                	var data = form.getData();
					    		//将外包人员信息附带在结算信息中 
								var rows1 = datagridOutperson.getSelecteds();
								data.purSettle.purSettleLists = rows1;
								//采购合同id
								data.purSettle.purcontid = data.purSettle.purSettleLists[0].purcontid;
								//计提信息
								var purPresettles = grid2.getSelecteds();
								if(purPresettles.length > 0){
									purSettleCosttype = purPresettles[0].costtype;
								}
								data.purSettle.purPresettles = purPresettles;
								var custjc = nui.get("custjc").getValue();
								var custname = nui.get("custno").getText();
								var suppliersname = nui.get("suppliersname").getValue();
								data.custjc = custjc;
								data.suppliersname = suppliersname; 
								data.custname = custname; 
								//审核信息
								var opioionformData = opioionform.getData();
								data.misOpinion = opioionformData.misOpinion;
								//附件ID赋值
								data.purSettle.fileids = nui.get("fileids").getValue();
								//流程关注
								data.purSettle.guanzhu = nui.get("guanZhuButton").getValue();
								//结算的成本类型
								data.purSettle.costtype = purSettleCosttype;
					    		var json = nui.decode(data);
					    		form.loading("流程处理中,请稍后...");
					    		nui.ajax({
					    			url:"com.primeton.eos.ame_pur.settlePay.makeGoSettlePay.biz.ext",
					    			data:json,
					    			type:"post",
					    			contentType:"text/json",
					    			success:function(action){
					    				form.unmask();
					    				var actionJson = nui.decode(action);
					    				if(actionJson.exception == null){
								        	nui.alert("结算流程发起成功","系统提示",function(){
								        		window.location="<%=request.getContextPath() %>/bps/wfclient/task/taskList.jsp?taskType=finishedSelf";
								        	});
					    				}else{
					    					nui.alert("结算流程发起失败，请联系信息技术部人员！","系统提示", function(action){
						    					nui.get("appButton").setEnabled(true);
				                				nui.get("saveButton").setEnabled(true);
					    					});
					    				}
					    			},
					    			error:function(jqXHR, textStatus, errorThrown){
					    				nui.alert("error:" + jqXHR.responseText);
					    			}
					    		});
			                } else {
			                    return;
			                }
			            }
			        );
				}
	    	}else{
	    		return;
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
        	var months = 0;
	        var sumtotalfee = 0;
	        var sumdays = 0;
	        var summonths = 0;
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
						sumdays += parseFloat(days);
					}
				}
				var months = datas[i].months;
				if(months){
					if(!isNaN(months)){
						summonths += parseFloat(months);
					}
				}
			}
			sumtotalfee = parseFloat(sumtotalfee).toFixed(2);
			sumdays = parseFloat(sumdays);
			summonths = parseFloat(summonths);
			if(doSumfeezongji != sumtotalfee){
				//赋值总费用
				var setamountValue = nui.get("setamount").getValue();
				sumtotalfee = parseFloat(sumtotalfee).toFixed(2);
				nui.get("setamount").setValue(sumtotalfee);
			}
			document.getElementById("sumtotal").innerHTML = parseFloat(sumtotalfee).toFixed(2);
			document.getElementById("daystotal").innerHTML = parseFloat(sumdays).toFixed(2);
        	document.getElementById("monthstotal").innerHTML = parseFloat(summonths).toFixed(3);
        	if(nui.get("workunit").getValue() == "1"){//人月数计算
				//设置工作量数量-人月数统计月数总量
	        	nui.get("workamount").setValue(document.getElementById("monthstotal").innerHTML);
        	}else{
				//设置工作量数量-人天数统计天数总量
	        	nui.get("workamount").setValue(document.getElementById("daystotal").innerHTML);
        	}
			doSumfeezongji = sumtotalfee;
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
		
		function onOk(e){
			var filePaths = document.getElementsByName("uploadfile").length;
        	for(var j = 0;j < filePaths;j++){
        		var a = document.getElementsByName("remarkList")[j].value;
        		if(a == null || a == ""){
        			nui.alert("新增附件不可以为空");
        			return false;
        		}
        	}
        	if(form.validate()){
        		nui.get("save").setValue(e);
	    		document.getElementById("fileCatalog").value="purSettle";
	    		form2.submit();
	    	}else{
	    		return;
	    	}
        	
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
	</script>
	<script type="text/javascript" src="purSettleCommon.js"></script>
</body>
</html>