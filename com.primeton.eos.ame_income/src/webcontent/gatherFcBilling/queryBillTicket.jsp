<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): xuqq
  - Date: 2018-03-14 14:21:08
  - Description:
-->
<head>
	<title>发票明细查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-fix">
		<div class="nui-panel" title="发票信息查询" width="auto">
			<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
				<input class="nui-hidden" name="sortField" value="ticketdate"/>
				<input class="nui-hidden" name="sortOrder" value="desc"/>
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
							<td align="right" style="width: 100px" nowrap="nowrap"><span>开票单位：</span></td>
			            	<td align="left" style="width: 150px;" nowrap="nowrap">
			            		<input name="criteria._expr[0]._value" class="nui-textbox" style="width:140px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[0]._property" value="custname"/>
							    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			            	</td>
			            	<td align="right" style="width: 100px" nowrap="nowrap"><span>合同存档编号：</span></td>
			            	<td align="left" style="width: 100px;" nowrap="nowrap">
			            		<input name="criteria._expr[1]._value" class="nui-textbox" style="width:100px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[1]._property" value="contnum"/>
							    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
			            	</td>
							<td align="right" style="width: 100px" nowrap="nowrap"><span>合同名称(项目)：</span></td>
			            	<td align="left" style="width: 160px;" nowrap="nowrap">
			            		<input name="criteria._expr[2]._value" class="nui-textbox" style="width:160px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[2]._property" value="projectname"/>
							    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
			            	</td>
			            	<td align="right" style="width: 100px" nowrap="nowrap"><span>销售：</span></td>
			            	<td align="left" style="width: 100px;" nowrap="nowrap">
							    <input name="criteria._expr[3]._value" class="nui-textbox" style="width:100px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[3]._property" value="salename"/>
							    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
							</td> 
						</tr>
						
						<tr>
							<td align="right" style="width: 100px" nowrap="nowrap"><span>发票日期：</span></td>
			            	<td align="left" nowrap="nowrap">
			            		<input class="nui-datepicker" name="criteria._expr[4]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[4]._max" style="width:100px"/>
						        <input class="nui-hidden" name="criteria._expr[4]._property" value="ticketdate"/>
						        <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
						        <input class="nui-hidden" name="criteria._expr[4]._pattern" value="yyyy-MM-dd"/>
			            	</td>
			            	<td align="right" style="width: 100px" nowrap="nowrap"><span>发票票号：</span></td>
			            	<td align="left" style="width: 160px;" nowrap="nowrap">
			            		<input name="criteria._expr[5]._value" class="nui-textbox" style="width:100px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[5]._property" value="billno"/>
							    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
			            	</td>
			            	<td align="right" style="width: 100px"><span>开票类型：</span></td>
			            	<td align="left" style="width: 160px;">
							    <input class="nui-dictcombobox" name="criteria._expr[6].type" dictTypeId="CS_BILLTICKET_TYPE" style="width:160px;" showNullItem="true" />
							</td>
							<td align="right" style="width: 100px"><span>发票状态：</span></td>
			            	<td align="left" style="width: 100px;">
							    <input class="nui-dictcombobox" name="criteria._expr[7]._value" dictTypeId="CS_BILLSTATUS" showNullItem="true" style="width: 100px;" multiSelect="true"/>
							    <input class="nui-hidden" name="criteria._expr[7]._property" value="status"/>
							    <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
							</td>
						</tr>
						<tr>
							<td align="right" style="width: 100px"><span>产品/服务状态：</span></td>
			            	<td align="left" style="width: 150px;">
							    <input class="nui-dictcombobox" style="width: 140px;" name="criteria._expr[8]._value" dictTypeId="MIS_BILLSTATUS" showNullItem="true" multiSelect="true"/>
							    <input class="nui-hidden" name="criteria._expr[8]._property" value="saleProStatus"/>
							    <input class="nui-hidden" name="criteria._expr[8]._op" value="in"/>
							</td>
							<td align="center" colspan="6">
		                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
		                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		                        <a class="nui-button" onclick="exportCsBillTickets" iconCls="icon-download"  id="exportButton">导出</a>
		                        <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
									<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
									<input type="hidden" name="downloadFile" filter="false"/>
									<input type="hidden" name="fileName" filter="false"/>
								</form>	
		                   </td>
						</tr>
					</table>
				</div>
			</div>
			<div style="width: 100%;">
				<div id="datagrid1" class="nui-datagrid" style="width: 100%;height: 340px;" showSummaryRow="true" frozenStartColumn="0" frozenEndColumn="4" 
					ondrawsummarycell="doCountNowPage" url="com.primeton.eos.ame_income.gatherFcBilling.queryBillTicket.biz.ext" 
					dataField="queryBillTickets" allowResize="true" sizeList="[10,20,30,50,100]" pageSize="10" allowAlternating="true" multiSelect="false">
				    <div property="columns">
				    	<div field="billno" width="90" headerAlign="center" align="center" allowSort="true">发票票号</div>
				    	<div field="custname" width="150" headerAlign="center" allowSort="true" renderer="onTitleRenderer2">开票单位</div>
				        <div field="ticketdate" width="80" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">发票日期</div>
				        <div field="projectname" width="120" headerAlign="center" allowSort="true">合同名称（项目）</div>
				        <div field="type" width="70" renderer="onGenderRenderer" align="center" headerAlign="center" allowSort="true">开票类型</div>
				        <div field="money" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">发票金额</div>
				        <div field="tax" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">税金</div>
				        <div field="u8xse" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">销售额</div>
				        <div field="taxrate" width="100" dataType="currency"  align="right" headerAlign="center" allowSort="true">税率</div>
				        <div field="status" width="85" renderer="onGender2Renderer" align="center" headerAlign="center" allowSort="true">发票状态</div>
				        <div field="price" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">服务/产品单价</div>
				        <div field="num" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">服务/产品数量</div>
				        <div field="unit" width="60" headerAlign="center" renderer="onUnitRenderer">产品单位</div>
				        <div field="moneySub" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">服务/产品金额</div>
				        <div field="taxSub" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">服务/产品税金</div>
				        <div field="u8xseSub" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">服务/产品销售额</div>
				        <div field="taxrateSub" width="100" dataType="currency"  align="right" headerAlign="center" allowSort="true">服务/产品税率</div>
				        <div field="saleProStatus" width="85" renderer="onGender3Renderer" align="center" headerAlign="center" allowSort="true">服务/产品状态</div>
				        <div field="contnum" width="90" renderer="onTitle1Renderer" headerAlign="center" allowSort="true">合同存档编号</div>
				        <div field="salename" width="60" headerAlign="center" align="center" allowSort="true">销售</div>
				        <div field="billtypename" width="85" headerAlign="center" align="center" allowSort="true">发票类型</div>
				    </div>
			    </div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	init();
    	function init(){
    		var json = form.getData();
		    grid.load(json);
    	}
    	
		function search(){
			var json = form.getData();
		    grid.load(json);
		}
		
		function reset(){
			var form = new nui.Form("#form1");
            form.reset();
		    var json = form.getData();
            grid.sortBy("ticketdate","desc");
            grid.load(json);
		}
		
		//enter键触发查询
        function onKeyEnter(e) {
            search();
        }
        function onTitleRenderer2(e) {
			return "<a href='javascript:void(0)' onclick='doViewNewBill();' title='点击查看开票信息'>" + e.value + "</a>";
		}
        function doViewNewBill(){
			var selectRow = grid.getSelected();
			if(!selectRow){
				nui.alert("请选择其中一条发票数据!");
				return;
			}
			var executeUrl = "<%=request.getContextPath() %>/ame_income/gatherFcBilling/billApplyViewNew.jsp?billid=" + selectRow.billid;
			window.open(executeUrl, "开票信息查看", "fullscreen=1");
		}
        //合同编号链接
		function onTitle1Renderer(e) {
			return "<a href='javascript:void(0)' onclick='doView1();' title='点击查看'>" + e.value + "</a>";
		}
		function doView1(){
			var selectRow = grid.getSelected();
			if(!selectRow){
				nui.alert("请选择其中一条合同数据!");
				return;
			}
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
		}
		
		//业务字典
		function onGenderRenderer(e) {
        	return nui.getDictText('CS_BILLTICKET_TYPE',e.value);
	    }
		function onGender2Renderer(e) {
	        return nui.getDictText('CS_BILLSTATUS',e.value);
	    }
	    function onUnitRenderer(e){
	    	return nui.getDictText('UNIT',e.value);
	    }
	    function onGender3Renderer(e){
	    	return nui.getDictText('MIS_BILLSTATUS',e.value);
	    }
	    
	    function doCountNowPage(e){        	
	        //客户端汇总计算
	        if (e.field == "money") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "tax") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "u8xse") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "moneySub") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "taxSub") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "u8xseSub") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "price") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "num") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	    }
	    
	    //导出
	    function exportCsBillTickets(){
	    	nui.confirm("确认导出发票信息记录？", "确定？",
        		function (action) {
				    var json = form.getData();
				    grid.loading("操作中，请稍后......");
				    nui.ajax({
				    	url: "com.primeton.eos.ame_income.gatherFcBilling.exportBillTicket.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		grid.unmask();
				     		var filePath = o.downloadFile;
				        	var fileName = "发票信息记录";
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
				     		grid.unmask();
				        	alert("error");
				        }
				    });
        		}
    		);
	    }
	</script>
</body>
</html>