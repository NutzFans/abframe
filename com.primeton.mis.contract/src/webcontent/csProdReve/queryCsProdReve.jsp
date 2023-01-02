<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2017-08-21 17:51:37
  - Description:
-->
<head>
<title>产品分成记录查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;
	    }
    </style>
</head>
<body>
<div class="nui-fix">
	<div class="nui-panel" title="产品分成记录查询" style="width:100%;">
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table align="center" border="0" width="100%" class="form_table">
		    	    <tr>
		    	    	<td class = "form_label" align="right">合同编号：</td>
				      	<td colspan="1">
						 	<input class="nui-textbox" name="criteria._expr[2]._value" style="width:150px"/>
						 	<input class="nui-hidden" name="criteria._expr[2]._property" value="contnum"/>
						 	<input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
					  	</td>
		    	    	<td class="form_label" align="right">产品目录：</td>
			          	<td colspan="1">
				           	<input id="prodtypeid"  name="criteria._expr[0]._value" url="com.primeton.eos.ame_product.QuoProdType.getProdtypeTree.biz.ext" style="width:200px;" class="nui-treeselect" 
							textField="prodtypename" valueField="prodtypeid" parentField="parenttypeid" dataField="prodTypes" showTreeIcon="true" valueFromSelect="true"
							showNullItem="true" multiSelect="true" expandOnLoad="true" showFolderCheckBox="true" />
			            	<input class="nui-hidden" name="criteria._expr[0]._property" value="prodtypeid"/>
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="in"/>
			          	</td>
			          	<td class="form_label" align="right">产品名称：</td>
		         	 	<td colspan="1">
				            <input url="com.primeton.eos.ame_product.QuoProdType.getQuoProdTypeTree.biz.ext" style="width:200px;" class="nui-treeselect" name="criteria._expr[1]._value"
			                    textField="prodtypename" valueField="prodtypeid" parentField="parenttypeid" dataField="quoProdtypes" showTreeIcon="true" valueFromSelect="true" 
								showNullItem="true" multiSelect="true" expandOnLoad="true" showFolderCheckBox="false" onbeforenodeselect="beforenodeselect"/>
							<input class="nui-hidden" name="criteria._expr[1]._property" value="prodid"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="in"/>
			          	</td>
					  	<td class = "form_label" align="right">预计确认年月：</td>
				      	<td colspan="1">
						 	<input class="nui-monthpicker" name="criteria._expr[3]._min" style="width:98px" id="min"/>-<input class="nui-monthpicker" name="criteria._expr[3]._max" style="width:98px" id="max" />
					        <input class="nui-hidden" name="criteria._expr[3]._property" value="newyearmonth"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
					  	</td>
		      		</tr>
			        <tr>
			        	<td class="form_label" align="right">受益部门：</td>
			            <td colspan="1" align="left">
				            <input name="criteria._expr[4]._value"  class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
							filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true" style="width:150px;" >
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="orgid" />
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="="/>
			          	</td>
			          	<td class="form_label" align="right">客户名称：</td>
			           	<td colspan="1">
			          		<input class="nui-textbox" name="criteria._expr[5]._value" style="width:200px"/>
					        <input class="nui-hidden" name="criteria._expr[5]._property" value="custname"/>
					        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
			            </td>
			          	<td class="form_label" align="right">合同登记日期：</td>
			          	<td colspan="1">
							<input class="nui-datepicker"name="criteria._expr[8]._min" style="width:98px"/>-<input class="nui-datepicker" name="criteria._expr[8]._max" style="width:98px"/>
		            		<input class="nui-hidden" name="criteria._expr[8]._property" value="contreg"/>
					        <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
			            </td>
			         	<td class="form_label" align="right">实际确认年月：</td>
			          	<td colspan="1">
							<input class="nui-monthpicker" name="criteria._expr[7]._min" style="width:98px" id="mixdate" />-<input class="nui-monthpicker" name="criteria._expr[7]._max" style="width:98px"/>
		            		<input class="nui-hidden" name="criteria._expr[7]._property" value="confirm"/>
					        <input class="nui-hidden" name="criteria._expr[7]._op" value="between"/>
			            </td>
				  	</tr>
				  	<tr>
				  		<td class="form_label" align="right">收入产品类型：</td>
			           	<td colspan="1">
			          		<input class="nui-dictcombobox"  name="criteria._expr[9]._value" dictTypeId="REVE_PRODTYPE" showNullItem="true"  style="width: 150px;" multiSelect="true"/>
		            		<input class="nui-hidden" name="criteria._expr[9]._property" value="prodrevetype"/>
					        <input class="nui-hidden" name="criteria._expr[9]._op" value="in"/>
			         	</td>
				  		<td class="form_label" align="right">收入确认状态：</td>
			           	<td colspan="1">
			          		<input class="nui-dictcombobox"  name="criteria._expr[6]._value" dictTypeId="AME_REVESTATUS" showNullItem="true"  style="width: 200px;" multiSelect="true"/>
		            		<input class="nui-hidden" name="criteria._expr[6]._property" value="status"/>
					        <input class="nui-hidden" name="criteria._expr[6]._op" value="in"/>
			         	</td>
			         	<td class="form_label" align="right">订单登记日期：</td>
			          	<td colspan="1">
					        <input class="nui-datepicker"name="criteria._ref[0]._expr[0]._min" style="width:98px"/>-<input class="nui-datepicker" name="criteria._ref[0]._expr[0]._max" style="width:98px"/>
		            		<input class="nui-hidden" name="criteria._expr[8]._property" value="contractid"/>
					        <input class="nui-hidden" name="criteria._expr[8]._op" value="in" id="tempCond51"/>
					        <input class="nui-hidden" name="criteria._expr[8]._ref" value="1" id="tempCond52"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.mis.contract.contract.CsContOrder"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="contractid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orderreg"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="between"/>
			            </td>
				  	</tr>
				  	<tr>
				        <td colspan="8" align="center">
				            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
				            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
				        </td>
				    </tr>
	  			</table>
		  	</div>
		</div>
		<div style="width:100%;">
	    	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
            		<a class="nui-button" id="export" iconCls="icon-download" onclick="exportDetail()">导出明细</a>
	            </table>           
	        </div>
	        <div id="datagrid1" dataField="reveProds" class="nui-datagrid" style="width:100%;height:auto;" showSummaryRow="true"
		    	url="com.primeton.mis.contract.csReveProd.queryCsRevePrd.biz.ext" allowResize="true"  ondrawsummarycell="doCountNowPage"
		    	sizeList="[10,15,20,30,50,100,200,500,1000,5000,10000]" pageSize="15" allowAlternating="true" multiSelect="true">
			    <div property="columns">
			    	<div type="checkcolumn"></div>
		    		<div field="custname"  width="180" headerAlign="center" allowSort="true" align="left">客户名称</div>
			        <div field="contnum" width="100" headerAlign="center" allowSort="true" align="center" renderer="getCsContractDetail">合同编号</div>
			        <div field="orgname" width="100"  headerAlign="center" allowSort="true" align="center">受益部门</div>
			        <div field="contsum1" width="100" headerAlign="center" align="right"dataType="currency" summaryType="sum">合同金额</div>
			        <div field="reveno" width="60" headerAlign="center" allowSort="true" align="center" renderer="detailReve">收入次数</div>
			        <div field="fcsum" width="100" headerAlign="center" allowSort="true" align="right" dataType="currency" summaryType="sum">预计确认金额</div>
			        <div field="actsum2" width="100" headerAlign="center" allowSort="true" align="right" dataType="currency" summaryType="sum">实际确认金额</div>
			        <div field="prodname" width="180" headerAlign="center" allowSort="true" align="left">产品名称</div>
			        <div field="prodtypename" width="100" headerAlign="center" allowSort="true" align="center">产品分类</div>
			        <div field="prodrevetype" width="80" headerAlign="center" allowSort="true" align="center" renderer="getReveProdtype">收入产品类型</div>
			        <div field="contsum" width="100" headerAlign="center" allowSort="true" align="right" dataType="currency" summaryType="sum">产品分成合同额</div>
			        <div field="productrate" width="60" headerAlign="center" allowSort="true" align="right" renderer="changeTax">税率</div>
			        <div field="contsum2" dataType="currency" summaryType="sum" align="right" width="100" headerAlign="center" allowSort="true">不含税合同额</div>
			        <div field="pratio" dataType="currency" summaryType="sum" align="right" width="100" headerAlign="center" allowSort="true" renderer="changeTax">分成比例</div>
			        <div field="pratiomon" dataType="currency" summaryType="sum" align="right" width="100" headerAlign="center" allowSort="true">分成金额</div>
			        <div field="status" align="center"width="100" headerAlign="center" allowSort="true" renderer="getStatus">收入确认状态</div>
			        <div field="newyearmonth" align="center"width="80" headerAlign="center" allowSort="true">预计确认年月</div>
			        <div field="confirmday" align="center" width="80" headerAlign="center" allowSort="true">实际确认日期</div>
			    </div>
			</div>
		</div>	
	</div>
</div>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
	<h:hidden property="_eosFlowAction" value="action0"/>
	<h:hidden property="downloadFile"/>
	<h:hidden property="fileName"/>
</form> 
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	init();
    	function init(){
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
    		grid.sortBy("contnum", "desc");
		}
		
		
		//对该页的总金额做合计
        function doCountNowPage(e){
            //客户端汇总计算
            if (e.field == "pratiomon" || e.field == "pratio" || e.field == "contsum2" || e.field == "contsum" || e.field == "actsum2" || e.field == "fcsum" || e.field == "contsum1") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
		
		
		function getStatus(e) {
            return nui.getDictText('AME_REVESTATUS',e.value);
        }
        function getReveProdtype(e){
			return nui.getDictText('REVE_PRODTYPE',e.value);
		}
		
		function changeTax(e){
			if(e.value!=null&&e.value!=""){
				return parseFloat(parseFloat(e.value)*100).toFixed(2)+"%";
			}
		}
		
		function search() {
			var form = new nui.Form("#form1");
			var data = form.getData(); //获取表单JS对象数据
			var min = nui.get("min").getValue();
			if(min!=null&&min!=""){
				min = nui.formatDate(min,"yyyyMM");
				data.criteria._expr[3]._min = min;
			}
			var max = nui.get("max").getValue();
			if(max!=null&&max!=""){
				max = nui.formatDate(max,"yyyyMM");
				data.criteria._expr[3]._max = max;
			}
		  	grid.load(data); //datagrid加载数据
		}
		
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			grid.load();
		}
		
		function onOk(){
			search();
		}
		
		//回车触发
		function onKeyEnter(){
			search();
		}
		
		function getCsContractDetail(e){
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}
		function doView(){
			var selectRow = grid.getSelected();
			if(!selectRow){
				nui.alert("请选择其中一条合同数据!");
				return;
			}
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
			window.open(executeUrl);
		}
		
		function beforenodeselect(e){
		    if (e.isLeaf == false) {
		    	e.cancel = true;
		    }
		}
		
		//合同收入记录详情
        function detailReve(e){
        	return "<a href='javascript:void(0)' onclick='detailReve1();' title='点击查看收入记录'>" + e.value + "</a>";
        }
        function detailReve1(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "/default/ame_income/csReveForecast/detailCsReveForecast.jsp?id=" + selectRow.reveid;
		    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
			window.open(executeUrl, "合同收入记录详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
	    }
		
		function exportDetail(){
            var form = new nui.Form("#form1");
			var data = form.getData();
			var min = nui.get("min").getValue();
			if(min!=null&&min!=""){
				min = nui.formatDate(min,"yyyyMM");
				data.criteria._expr[3]._min = min;
			}
			var max = nui.get("max").getValue();
			if(max!=null&&max!=""){
				max = nui.formatDate(max,"yyyyMM");
				data.criteria._expr[3]._max = max;
			}
            var json = nui.encode(data);
	    	grid.loading("操作中，请稍后......");
			nui.ajax({
                url: "com.primeton.mis.contract.csReveProd.exportDetail.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (o) {
             	grid.unmask ( );
                	var filePath = o.downloadFile;
                	var fileName = "产品分成记录";
                	var myDate = new Date();
                	var year = myDate.getYear();
                	var month = myDate.getMonth()+1;
                	var day = myDate.getDate();
                	var hours = myDate.getHours();
                	var minutes = myDate.getMinutes();
                	var seconds = myDate.getSeconds();
                	var curDateTime = year;
                	if(month>9)
						curDateTime = curDateTime + "" + month;
					else
						curDateTime = curDateTime + "0" + month;
                	if(day>9)
						curDateTime = curDateTime + "" + day;
					else
						curDateTime = curDateTime + "0" + day;
					if(hours>9)
						curDateTime = curDateTime + "" + hours;
					else
						curDateTime = curDateTime + "0" + hours;
					if(minutes>9)
						curDateTime = curDateTime + "" + minutes;
					else
						curDateTime = curDateTime + "0" + minutes;
					if(seconds>9)
						curDateTime = curDateTime + "" + seconds;
					else
						curDateTime = curDateTime + "0" + seconds;
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
</script>
</body>
</html>