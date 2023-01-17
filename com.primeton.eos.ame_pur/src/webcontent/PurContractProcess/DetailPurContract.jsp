<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): wlq
  - Date: 2016-06-02 18:18:37
  - Description:
-->
<head>
	<title>合同流程业务信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
			<legend>采购合同基本信息</legend>
			<form id="form1" method="post">
				<input name="purContract.purcontid" id="purcontid" class="nui-hidden" />
				<input name="purContract.purOrderYesOrNo" id="purOrderYesOrNo" class="nui-hidden"/>
				<input name="purContract.edit" id="edit" class="nui-hidden" />
				<input name="purContract.last" id="last" class="nui-hidden" />
				<input name="purContract.fileids" id="fileids2" class="nui-hidden"/>
<!-- 			<input name="misOpinion.fileids" id="fileids"  class="nui-hidden"/> -->
				<div style="padding:5px;">
					<table style="table-layout:fixed;" id="table_file">
						<tr>
							<td align="right" style="width:120px;">供应商：</td>
							<td style="width:180px;"><input name="purContract.purSupplier.custid" id="custname" readonly="readonly" class="nui-buttonedit" required="true" style="width:200px" emptyText="请选择供应商" onbuttonclick="selectSupplier" allowInput="false" /></td>
							<td align="right" style="width:100px">合同类型：</td>
							<td style="width:120px;"><input name="purContract.purtype" id="purtype" readonly="readonly" class="nui-dictcombobox" dictTypeId="AME_CONTYPE" required="true" style="width:100px"/></td>
							<td align="right" style="width:100px">合同金额：</td>
							<td style="width:200px;"><input name="purContract.contmoney" id="contmoney" readonly="readonly" class="nui-textbox" style="width:100px" vtype="int"/>&nbsp;(元)</td>
						</tr>
						<tr>
							<td align="right" style="width:120px">有效开始日期：</td>
							<td><input name="purContract.startdate" id="startdate" class="nui-datepicker" readonly="readonly" style="width:100px" onblur="startTime"/></td>
							<td align="right" style="width:100px">有效截止日期：</td>
							<td><input name="purContract.enddate" id="enddate" class="nui-datepicker" readonly="readonly" style="width:100px" onblur="endTime"/></td>
							<td align="right" style="width:100px">我方申请人：</td>
							<td><input name="purContract.ouroper" id="ouroper" class="nui-textbox" readonly="readonly" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">财务合同编号：</td>
							<td style="width:180px"><input name="purContract.outcontnum" id="outcontnum" readonly="readonly" class="nui-buttonedit" style="width:100px"/><input type='button' align='center' value='查看' style="width:40px" onclick='javascript:lookCsContract()'/></td>
							<td align="right" style="width:100px">成本类型：</td>
							<td><input name="purContract.costtype" id="costtype" class="nui-dictcombobox" readonly="readonly" dictTypeId="AME_CONTCOSTTYPE" style="width:100px" showNullItem="true"/></td>
							<td align="right" style="width:120px">合同签订日期：</td>
							<td><input name="purContract.signdate" id="contSigndate" class="nui-datepicker" required="true" readonly="readonly" style="width:100px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">供应商联系人：</td>
							<td><input name="purContract.liankman" id="liankman" class="nui-textbox" readonly="readonly"style="width:100px"/></td>
							<td align="right" style="width:120px">联系电话：</td>
							<td><input name="purContract.linktel" id="linktel" class="nui-textbox" readonly="readonly" style="width:130px"/></td>
							<td align="right" style="width:120px">电子邮件：</td>
							<td><input name="purContract.linkemail" id="linkemail" class="nui-textbox" readonly="readonly" style="width:200px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">采购合同代码：</td>
							<td><input name="purContract.purcontnum" id="purcontnum" class="nui-textbox" required="true" readonly="readonly" style="width:200px"/></td>
							<td align="right" style="width:100px">合同名称：</td>
							<td colspan="3"><input name="purContract.purcontname" id="purcontname" class="nui-textbox" readonly="readonly" style="width:280px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">合同关键内容：</td>
							<td colspan="5"><input name="purContract.contKeyinfo" id="contKeyinfo" class="nui-textarea" readonly="readonly" style="width:100%"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">说明：</td>
							<td colspan="5"><input name="purContract.comment" id="comment" class="nui-textarea" readonly="readonly" style="width:100%"/></td>
						</tr>
					</table>
				</div>
			</form>
			<jsp:include page="/ame_common/detailFile.jsp"/>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
			    <legend>采购合同对应项目列表</legend>
				<div id="grid_purProjCont" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="purProjConts" 
				 url="com.primeton.eos.ame_pur.PurContract.queryPurProjContByPurcontid.biz.ext" allowCellSelect="true"  allowCellEdit="false" showPager="false" multiSelect="true" showSummaryRow="true" ondrawsummarycell="drawPurProjContSum">
					<div property="columns">
						<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
						<div type="projectid" visible="false"></div>
						<div type="purprojcontid" visible="false"></div>
						<div field="projectno" displayField="projectName" width="150" headerAlign="center">
							项目
			                <input property="editor" class="nui-buttonedit" onbuttonclick="selectProject" style="width:100%;"allowInput="false"/>
			            </div>
						<div field="projectno" width="100" align="center" headerAlign="center" >项目编号</div>
						<div field="contnum" width="100" align="center" headerAlign="center" >销售合同编号</div>
						<div field="custjc" width="100" align="center" headerAlign="center" >所属客户</div>
						<div field="orgname" width="75" align="center" headerAlign="center">受益销售</div>	
						<div field="purmoney"  width="100" headerAlign="center" align="right" summaryType="sum" numberFormat="n2">
							采购金额
							<input property="editor" class="nui-spinner" format="n2" allowLimitValue="false" changeOnMousewheel="false" increment="0" showButton="false"  style="width:100%;" inputStyle="text-align:right;" allowInput="true" />
			            </div>
						<div field="comment"  width="200" headerAlign="center" align="center">
							备注说明
							<input property="editor" class="nui-textbox" style="width:100%;"/>
			            </div>
					</div>
				</div>
			</fieldset>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>采购付款计划列表</legend>
				<div id="paymentPlanGrid" class="nui-datagrid" style="width:100%;height:auto;" allowResize="false" dataField="plans" showSummaryRow="true"
		 	url="com.primeton.eos.ame_pur.purPaymentPlan.paymentPlanQueryByContract.biz.ext"  allowCellEdit="false" showPager="false" multiSelect="true" ondrawsummarycell="drawPaymentPlanSum">
					<div property="columns">
						<div type="indexcolumn" headerAlign="center" width="35" >编号</div>
						<div field="payCount" width="80" align="center" headerAlign="center" >付款次数</div>	
						<div field="expectedAmount" width="100" align="center"  headerAlign="center" currencyUnit="￥" dataType="currency" numberFormat="n2" summaryType="sum">付款金额</div>
						<div field="percentage" width="80" align="center"  headerAlign="center" summaryType="sum" renderer="percentageRenderer">付款比例</div>
						<div field="expectedDate" width="100" align="center"  headerAlign="center" dataType="date" dateFormat="yyyy-MM" renderer="onDealDate">预计付款年月</div>
			            <div field="evidence" width="140" align="center" headerAlign="center" >付款依据</div>
						<div field="nodeRemark" width="280" align="center"  headerAlign="center" >付款节点备注</div>
					</div>
				</div>
			</fieldset>
		</fieldset>
		<fieldset id="field3" style="border:solid 1px #aaa;padding:3px;">
			<legend>采购订单基本信息</legend>
			<form id="form3" method="post">
				<input name="purOrder.purorderid" id="purorderid" class="nui-hidden" />	
				<input name="purOrder.fileids" id="fileids1" class="nui-hidden" />
            	<table style="table-layout:fixed;" id="table_purOrder">
					<tbody>
						<tr>
							<td align="right" style="width:120px">服务客户：</td>
							<td style="width:200px"><input name="purOrder.userid" id="userid" class="nui-buttonedit" onbuttonclick="selectCustmer" readonly="readonly" allowInput="false" style="width:200px" /></td>
							<td align="right" style="width:120px">项目名称：</td>
							<td style="width:200px"><input name="purOrder.projectno" id="projectno" class="nui-combobox" valueField="projectno" textField="projectName" readonly="readonly" allowInput="false"  style="width:200px" /></td>
							<td align="right" style="width:120px">协议签订人员：</td>
							<td style="width:100px"><input name="purOrder.signuserid" id="signuserid" class="nui-buttonedit" onbuttonclick="selectOmEmployee"  allowInput="false" readonly="readonly" style="width:80px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">协议签订日期：</td>
							<td><input name="purOrder.signdate" id="orderSigndate" class="nui-datepicker" required="true" readonly="readonly" style="width:100px" /></td>
							<td align="right" style="width:120px">采购订单编号：</td>
							<td colspan="3"><input name="purOrder.purordernum" id="purordernum" class="nui-textbox" required="true" readonly="readonly" style="width:200px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">结算周期说明：</td>
							<td colspan="5"><input name="purOrder.calcycle" id="calcycle" class="nui-textarea" allowInput="true" readonly="readonly" style="width:100%"/></td>
						</tr>
						<tr>
							<td align="right" style="width:120px">协议内容说明：</td>
							<td colspan="5"><input name="purOrder.contmemo" id="contmemo" class="nui-textarea" allowInput="true" readonly="readonly" style="width:100%"/></td>
						</tr>
					</table>
					<div id="grid_1" class="nui-datagrid" style="width:100%;height:auto;" showPager="false" sortMode="client" url="com.primeton.eos.ame_common.file.getFiles.biz.ext" dataField="files" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">
						<div property="columns">
							<div type="indexcolumn" headerAlign="center" width="40" >编号</div>
							<div field="fileName"width="200" headerAlign="center" align="center" renderer="getdetail1">附件名称</div>
							<div field="fileType" width="120" renderer="dictKbasetype" align="center" headerAlign="center" >附件类型</div>
							<div field="operatorname" width="80"headerAlign="center" align="center">操作员名称</div>
							<div field="fileTime" width="120" headerAlign="center" align="center" dateFormat="yyyy-MM-dd HH:mm:ss">附件上传时间</div>
						</div>
					</div>
				</form>
			</fieldset>
		<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
			<legend>协议书人员</legend>
			<div id="grid_outper" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="purOrderOutpers" 
		    	url="com.primeton.eos.ame_pur.purContractProcess.queryOutperByOrder.biz.ext"  
		    	idField="appid" multiSelect="true" allowAlternating="true" onselectionchanged="selectionChanged" showPager="false">
				<div property="columns">
					<div field="purOutperson.outperno" align="center" headerAlign="center" allowSort="true" visible="false">人员编号</div>
					<div field="purOutperson.outpername" width="60" align="center" headerAlign="center"renderer="getDetail">姓名</div>	
					<div field="workunit" width="90" align="center"headerAlign="center" allowSort="true" renderer="dictOutperType">工作量计量单位</div>	
					<div field="price" width="90" align="center" dataType="currency" headerAlign="center" allowSort="true">人月单价(元)</div>	
					<div field="startdate" width="90" align="center" headerAlign="center" allowSort="true">服务开始日期</div>	
					<div field="expenddate" width="90" align="center" headerAlign="center" allowSort="true">预计服务结束日期</div>	
					<div field="projectName" width="120" align="center" headerAlign="center">项目</div>		
					<div field="managername" width="70" align="center" headerAlign="center">汇报人</div>	
					<div field="pcprotype" width="90" align="center" headerAlign="center" renderer="onFileRendererway">电脑提供方式</div>	
					<div field="comment" width="90" align="center" headerAlign="center">说明</div>
				</div>
			</div>
		</fieldset>
		<jsp:include page="/ame_common/misOpinion.jsp"/>
		<form id="form5" method="post">
				<fieldset id="field8" style="border:solid 1px #aaa;padding:3px;">
					<legend>送递信息</legend>
					<table>
						<tr>
							<td align="right" style="width:150px">送递人：</td>
							<td><input name="amePostservice[0].postorname" id="postorname" class="nui-textbox" required="false" readonly="readonly"  style="width:100px"/></td>
							<td align="right" style="width:150px">送递方式：</td>
							<td><input name="amePostservice[0].postway" id="postway" class="nui-dictcombobox" dictTypeId="AME_POSTWAY" readonly="readonly"  style="width:100px" showNullItem="true" nullItemText=""/></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">送递日期：</td>
							<td><input name="amePostservice[0].postdate" id="postdate" class="nui-datepicker" required="false" readonly="readonly"  style="width:100px"/></td>
							<td align="right" style="width:150px">快递单号：</td>
							<td><input name="amePostservice[0].postno" id="postno" class="nui-textbox" required="false" readonly="readonly"   style="width:200px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">收件人：</td>
							<td><input name="amePostservice[0].receivername" id="receivername" class="nui-textbox" required="false" readonly="readonly"  style="width:100px"/></td>
							<td align="right" style="width:150px">联系电话：</td>
							<td><input name="amePostservice[0].receiverlinktel" id="receiverlinktel" class="nui-textbox" required="false" readonly="readonly"  style="width:200px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">邮寄地址：</td>
							<td colspan="5"><input name="amePostservice[0].postaddress" id="postaddress" class="nui-textbox" required="false" readonly="readonly"  style="width:100%"/></td>
						</tr>
						<tr>
							<td align="right" style="width:150px">邮寄内容：</td>
							<td colspan="3"><input name="amePostservice[0].postcontent" id="postcontent" class="nui-textbox" required="false" readonly="readonly"  style="width:100%"/></td>
						</tr>
					</tbody>
				</table>
			</fieldset>
		</form>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
  	var form = new nui.Form("form1");
  	var form3 = new nui.Form("form3");
  	var form5 = new nui.Form("form5");
  	var opioionform = new nui.Form("opioionform");
  	//采购合同与项目关系
    var grid_purProjCont = nui.get("grid_purProjCont");
  	<%Long processInstID = Long.parseLong(request.getParameter("processInstID")); %>
	function onFileRendererway(e){
		return nui.getDictText('AME_POSTWAY',e.value);
	}
	loadData();
	function loadData(){
		document.getElementById("opinionHide").style.display="none";
		var data={processInstID:<%=processInstID %>, detailPurcont:"notnull",getOutpersonAndPost:"2"};
		var json=nui.encode(data);
		nui.ajax({
			url:"com.primeton.eos.ame_pur.purContractProcess.queryContractWorkItem.biz.ext",
			type:"post",
			data:json,
			contentType:"text/json",
			success:function (o){
				form.setData(o);
				nui.get("outcontnum").setValue(o.purContract.outcontnum);
				nui.get("outcontnum").setText(o.purContract.outcontnum);
				form3.setData(o);
				form5.setData(o);
				if(o.purContract.purcontid){
					var grid_0 = nui.get("grid_0");
					grid_0.load({"groupid":"purContract","relationid":o.purContract.purcontid});
					grid_0.sortBy("fileTime","desc");
				}
				nui.get("purOrderYesOrNo").setValue(o.purContract.YesOrNo);
				if(o.purContract.YesOrNo==0){
					document.getElementById("field3").style.display="none";
					document.getElementById("field6").style.display="none";
				}else if(o.purContract.YesOrNo==1){	
					//查询订单人员
	            	var purorderid = nui.get("purorderid").getValue();
					var grid_outper = nui.get("grid_outper");
					grid_outper.load({purOrder:{purorderid:purorderid}});
					grid_outper.sortBy("purOutperson.outperno", "desc");
					//订单附件
					var grid_1 = nui.get("grid_1");
					grid_1.load({"groupid":"purOrder","relationid":o.purOrder.purorderid});
					grid_1.sortBy("fileTime","desc");
				}
				nui.get("custname").setText(o.purContract.purSupplier.custname);
				nui.get("userid").setText(o.purOrder.custname);
                nui.get("projectno").setText(o.purOrder.projectName);	
                nui.get("signuserid").setText(o.purOrder.empname);
				//设置审核意见基本信息
				nui.get("processinstid").setValue(o.workitem.processInstID);
               	nui.get("processinstname").setValue(o.workitem.processInstName);
               	nui.get("activitydefid").setValue(o.workitem.activityDefID);
               	nui.get("workitemname").setValue(o.workitem.workItemName);
               	nui.get("isshow").setValue("1");
               	nui.get("edit").setValue("1");
            	nui.get("purtype").setText(nui.getDictText('AME_CONTYPE',o.purContract.purtype));
            	nui.get("backTo").setData(o.purContract.backList);
            	//查询审核意见
				var grid = nui.get("datagrid1");
				grid.load({processInstID:<%=processInstID %>});
				grid.sortBy("time", "desc");
				//项目合同关系列表查询
        		grid_purProjCont.load({purcontid:o.purContract.purcontid});
        		//采购合同付款计划查询
        		nui.get("paymentPlanGrid").load({purcontid:o.purContract.purcontid});
        		
			},
			error:function(){}
		});
	}
    
  	//标准方法接口定义
    function CloseWindow(action) {            
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
    }
    
    function onCancel(e) {
        CloseWindow("cancel");
    }
    
	//附件下载
    function getdetail1(e){
        	return "<a href='javascript:void(0)' onclick='checkDetail1();' title='点击查看'>" + e.value + "</a>";
        }
    function checkDetail1(){
    	var grid = nui.get("grid_1");
    	var selectRow = grid.getSelected();
    	var url="com.primeton.components.web.fileupload.getfile.flow?fileId="+selectRow.fileId;
		window.open(url, '_self');
    }
    
	//人员订单关系表，计算单位
	function dictOutperType(e){
		return nui.getDictText('SERV_NUM_TYPE',e.value);//设置业务字典值
	}
	function lookCsContract(){
		//为了公用 页面只能传过去contractid
		var outcontnum = nui.get("outcontnum").getValue();
		nui.ajax({
			url:"com.primeton.eos.ame_income.csReveForeProcess.queryContByContnum.biz.ext",
			data: {contnum:outcontnum},
			type:"post",
			contentType:"text/json",
			success:function(data){
				var contractid = data.csContract.contractid;
				if(contractid){
					var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid="+contractid;
					window.open(executeUrl, "合同查看", "fullscreen=1");
				}
			}
		});
  	}
    function drawPurProjContSum(e){
		if (e.field == "purmoney"||e.field == "wzfje") {
            e.cellHtml = "<div align='right'><b>" + nui.formatNumber(e.cellHtml,'#,##.##') + "</b></div>";
        }
	}
	var paymentPlanSum = 0;
	function drawPaymentPlanSum(e){
		if (e.field == "expectedAmount") {
			var html = nui.formatNumber(e.value,"n");
            e.cellHtml = "<div align='right'><b>" + html + "</b></div>";
            paymentPlanSum = (Math.round(e.value*100)/100);  
        } 
        if (e.field == "percentage") {
        	var contmoney = nui.get("contmoney").getValue();
       	 	var html = "";
        	if(contmoney && contmoney > 0) {
        		var p = (Math.round(paymentPlanSum * 10000 / contmoney ) / 100.00);
        		html = nui.formatNumber(p,"n");
        	} else {
        		html = "0.00";
        	}
        	e.cellHtml = "<div align='right'><b>" + html + "%</b></div>";
        }
	}
	function percentageRenderer(e) {
		if(e.value == null) {
			return "";
		}
		return e.value + "%";
	}
	function onDealDate(e){
		if(e.field == "expectedDate"){
			var date = e.value;
			if(date){
				return e.cellHtml.substring(0,7);
			}
		}
	}
</script>
</html>