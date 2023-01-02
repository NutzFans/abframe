<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 朱勇伦
  - Date: 2017-04-22 14:15:40
  - Description:
-->
<head>
	<title>收入确认票</title>
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
		<div class="nui-panel" title="收入确认开票查询" width="auto">
			<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
				<input class="nui-hidden" name="sortField" value="confirmday"/>
				<input class="nui-hidden" name="sortOrder" value="desc"/>
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
			            	<td align="right" style="width: 100px"><span>合同存档编号：</span></td>
			            	<td align="left" style="width: 310px;">
			            		<input name="criteria._expr[0]._value" class="nui-textbox" style="width:100px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[0]._property" value="contnum"/>
							    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
			            	</td>
			            	<td align="right" style="width: 100px"><span>客户名称：</span></td>
			            	<td align="left" style="width: 310px;">
			            		<input name="criteria._expr[1]._value" class="nui-textbox" style="width:100px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[1]._property" value="custname"/>
							    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
			            	</td>
			            	<td align="right" style="width: 100px"><span>开票日期：</span></td>
			            	<td align="left" style="width: 310px;">
			            		<input class="nui-datepicker" name="criteria._expr[2]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[2]._max" style="width:100px"/>
						        <input class="nui-hidden" name="criteria._expr[2]._property" value="confirmday"/>
						        <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
						        <input class="nui-hidden" name="criteria._expr[2]._pattern" value="yyyy-MM-dd"/>
			            	</td>
						</tr>
					    <tr>
			    			<td align="center" colspan="6">
		                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">收入确认开票查询</a>
		                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		                   </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
		    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	                <tr>
	                    <td style="width:100%;">
	                        <a class="nui-button" id="addBtnFinance" iconCls="icon-add" onclick="addDoneSureBill">新增收入确认票</a>
	                        <a class="nui-button" id="exportDoneSureBills" iconCls="icon-download" onclick="exportDoneSureBills">导出明细</a>
	                        <a class="nui-button" id="ImportDoneSureBill" iconCls="icon-upload" onclick="ImportDoneSureBill">导入收入确认票</a>
	                    </td>
	                </tr>
	            </table>           
	        </div>
			<div id="datagrid1" class="nui-datagrid" style="width: 100%;height: 340px;" showSummaryRow="true" 
				ondrawsummarycell="doCountNowPage" url="com.primeton.eos.ame_income.gatherFcBilling.queryDoneSureBillLists.biz.ext" 
				dataField="queryDoneSureBills" allowResize="true" sizeList="[10,20,30,50,100]" pageSize="10" 
				allowAlternating="true" multiSelect="false">
			    <div property="columns">
			       	<div type="checkcolumn" name="temp123"></div>
			        <div field="contnum" width="150" headerAlign="center" align="center" allowSort="true">合同编号</div>
			        <div field="custname" width="150" headerAlign="center" align="left" allowSort="true">客户</div>
			        <div field="confirmday" width="105" headerAlign="center" align="center" allowSort="true">最近收入确认时间</div>
			        <div field="actsum" width="130" headerAlign="center" align="right" dataType="currency" summaryType="sum" allowSort="true">已确认收入金额</div>
			        <div field="yymoney" width="130" headerAlign="center" align="right" dataType="currency" summaryType="sum" allowSort="true">已开票已交付金额</div>
			        <div field="ywmoney" width="130" headerAlign="center" align="right" dataType="currency" summaryType="sum" allowSort="true">已开票未交付金额</div>
			        <div field="ywactsum" width="130" headerAlign="center" align="right" dataType="currency" summaryType="sum" allowSort="true">已确认未开票金额</div>
			    </div>
			</div>
			<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
				<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
				<input type="hidden" name="downloadFile" filter="false"/>
				<input type="hidden" name="fileName" filter="false"/>
			</form> 
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var grid = nui.get("datagrid1");
		init();
		function init(){
			var form=new nui.Form("#form1");
	    	var data=form.getData();
			grid.load(data);
		}
		function onKeyEnter(){
			search();
		}
		function search() {
			var form=new nui.Form("#form1");
	    	var data=form.getData();
			grid.load(data);
		}
		function reset(){
			var form = new nui.Form("#form1");
            form.reset();
		    var json = form.getData();
            grid.load(json);
		}
		function doCountNowPage(e){
			//客户端汇总计算
	        if (e.field == "actsum") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "yymoney") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "ywmoney") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "ywactsum") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
		}
		
		function addDoneSureBill(){
			//ame_income/gatherFcBilling/doneSureBillAdd.jsp
			var row = grid.getSelected();
			if(row){
				nui.open({
		            url: "<%=request.getContextPath() %>/ame_income/gatherFcBilling/doneSureBillAdd.jsp",
		            title: "新增收入确认票", width: 1000, height: 500,
		            onload: function () {
		                var iframe = this.getIFrameEl();
		                var data = { "doneSureBill": row};
		                iframe.contentWindow.SetData(data);
		            },
		            ondestroy: function (action) {
		            	if(action == "ok"){
			                grid.reload();
		            	}
		            }
		        });
			}else{
				nui.alert("请选择一条记录！");
			}
		}
		
		function exportDoneSureBills(){
			var form=new nui.Form("#form1");
	    	var json = form.getData();
	    	nui.ajax({
	            url: "com.primeton.eos.ame_income.gatherFcBilling.exportSureBill.biz.ext",
	            type: "post",
	            data: json,
	            cache: false,
	            contentType: 'text/json',
	            success: function (o) {
	         	nui.unmask();
	            	var filePath = o.downloadFile;
	            	var fileName = "currentBill";
	            	var myDate = new Date();
	            	var year = myDate.getYear();
	            	var month = myDate.getMonth()+1;
	            	var day = myDate.getDate();
	            	var hours = myDate.getHours();
	            	var minutes = myDate.getMinutes();
	            	var seconds = myDate.getSeconds();
	            	var curDateTime = year;
	            	if(month>9){
						curDateTime = curDateTime + "" + month;
						alert(curDateTime);
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
		}
		
		function ImportDoneSureBill(){
			nui.open({
	            url: "<%=request.getContextPath() %>/ame_income/gatherFcBilling/importSureBill.jsp",
	            title: "导入收入确认票", 
				width: 440,
	            height: 170,
	            onload: function () {
	                var iframe = this.getIFrameEl();
	            },
	            ondestroy: function (action) {
	            	if(action == "ok"){
		            	grid.reload();
	            	}
	            }
	        });
		}
		
	</script>
</body>
</html>