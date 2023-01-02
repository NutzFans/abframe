<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- 
  - Author(s): huangqj
  - Date: 2014-01-02 13:46:35
  - Description:
-->
<%@include file="/nui/common.jsp" %>
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<head>
	<title>收入查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="nui-panel" title="收入查询" style="width:100%;">
		<div id="form1">
			<input class="nui-hidden" name="sortField" value="contnum"/>
			<input class="nui-hidden" name="sortOrder" value="desc"/>
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
		            	<td align="right"><span>合同存档编号：</span></td>
		            	<td>
					        <input class="nui-textbox" name="criteria._expr[0]._value"/>
		            		<input class="nui-hidden" name="criteria._expr[0]._property" value="contnum"/>
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					    </td>
			        	<td align="right"><span>事业部：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" id="org" name="criteria._expr[1]._value" dictTypeId="CONT_ORG" showNullItem="true" nullItemText="全部"/>
		            		<input class="nui-hidden" name="criteria._expr[1]._property" value="newCsContract.org"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
					    </td>
			        	<td align="right"><span>类型：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[2]._value" dictTypeId="MIS_INCOMETYPE" showNullItem="true" nullItemText="全部"/>
		            		<input class="nui-hidden" name="criteria._expr[2]._property" value="incometype"/>
					    </td>
					    <td align="right">
							<a class="nui-button" iconCls="icon-search" onclick="search()">查找</a>
							<a class="nui-button" iconCls="icon-download" onclick="exportContract()">导出到Excel</a>
						</td>
					</tr>
			    </table>
			</div>
	    </div>
	    <div id="datagrid1" dataField="incomes" class="nui-datagrid" style="width:100%;height:452px;" showSummaryRow="true" ondrawcell="onDrawCell"
	    	url="com.primeton.mis.newcont.income.queryIncome.biz.ext" idField="id" allowResize="true" ondrawsummarycell="doCountNowPage"
	    	sizeList="[10,20,30,50,100,200,500,1000,5000,10000]" pageSize="15" allowAlternating="true" multiSelect="true" frozenStartColumn="0" frozenEndColumn="2">
		    <div property="columns">
		        <div field="contnum" width="77" renderer="onTitleRenderer" headerAlign="center" allowSort="true">合同存档编号</div>
		        <div field="newCsContract.org" renderer="onGenderRenderer" width="70" headerAlign="center" allowSort="true">部门</div>
		        <div field="incometype" renderer="onGender1Renderer" width="120" headerAlign="center">类型</div>
		        <div field="income11" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2011</div>
		        <div field="income121" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2012-Q1</div>
		        <div field="income122" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2012-Q2</div>
		        <div field="income123" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2012-Q3</div>
		        <div field="income124" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2012-Q4</div>
		        <div field="total12" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2012合计</div>
		        <div field="income131" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2013-Q1</div>
		        <div field="income132" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2013-Q2</div>
		        <div field="income133" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2013-Q3</div>
		        <div field="income134" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2013-Q4</div>
		        <div field="total13" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2013合计</div>
		        <div field="income141" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2014-Q1</div>
		        <div field="income142" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2014-Q2</div>
		        <div field="income143" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2014-Q3</div>
		        <div field="income144" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2014-Q4</div>
		        <div field="total14" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2014合计</div>
		        <div field="income151" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2015-Q1</div>
		        <div field="income152" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2015-Q2</div>
		        <div field="income153" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2015-Q3</div>
		        <div field="income154" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2015-Q4</div>
		        <div field="total15" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2015合计</div>
		        <div field="income161" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2016-Q1</div>
		        <div field="income162" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2016-Q2</div>
		        <div field="income163" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2016-Q3</div>
		        <div field="income164" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2016-Q4</div>
		        <div field="total16" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2016合计</div>
		        <div field="income1701" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2017-01</div>
		        <div field="income1702" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2017-02</div>
		        <div field="income1703" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2017-03</div>
		        <div field="income1704" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2017-04</div>
		        <div field="income1705" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2017-05</div>
		        <div field="income1706" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2017-06</div>
		        <div field="income1707" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2017-07</div>
		        <div field="income1708" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2017-08</div>
		        <div field="income1709" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2017-09</div>
		        <div field="income1710" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2017-10</div>
		        <div field="income1711" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2017-11</div>
		        <div field="income1712" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2017-12</div>
		        <div field="total16" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2017合计</div>
		        <div field="income16" width="100" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">2018</div>
		        <div field="total" width="110" summaryType="sum" dataType="currency" currencyUnit="￥" align="right" headerAlign="center">合计</div>
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
        var grid = nui.get("datagrid1");
		grid.load();
		grid.sortBy("contnum", "desc");
        //对该页的总金额做合计
        function doCountNowPage(e){        	
            //客户端汇总计算
            if (e.field == "income11") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income121") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income122") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income123") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income124") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income131") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income132") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income133") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income134") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income141") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income142") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income143") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income144") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income151") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income152") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income153") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income154") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income161") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income162") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income163") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income164") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income1701") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income1702") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income1703") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income1704") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income1705") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income1706") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income1707") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income1708") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income1709") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income1710") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income1711") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income1712") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "income16") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            var grid = e.sender;
            var rows = e.data;
        	var total = 0;
        	var total12 = 0;
        	var total13 = 0;
        	var total14 = 0;
        	var total15 = 0;
        	var total16 = 0;
        	var total17 = 0;
            for (var i = 0; i < rows.length; i++) {
                var row = rows[i];
                var t = row.income11+row.income121+row.income122+row.income123+row.income124+row.income131+row.income132+row.income133+row.income134+row.income141+row.income142+row.income143+row.income144+row.income151+row.income152+row.income153+row.income154+row.income161+row.income162+row.income163+row.income164+row.income1701+row.income1702+row.income1703+row.income1704+row.income1705+row.income1706+row.income1707+row.income1708+row.income1709+row.income1710+row.income1711+row.income1712+row.income16;
                var t12 = row.income121+row.income122+row.income123+row.income124;
                var t13 = row.income131+row.income132+row.income133+row.income134;
                var t14 = row.income141+row.income142+row.income143+row.income144;
                var t15 = row.income151+row.income152+row.income153+row.income154;
                var t16 = row.income161+row.income162+row.income163+row.income164;
                var t17 = row.income1701+row.income1702+row.income1703+row.income1704+row.income1705+row.income1706+row.income1707+row.income1708+row.income1709+row.income1710+row.income1711+row.income1712;
                if (!isNaN(t)){
                	total += t;
                }
                if(!isNaN(t12)){
                	total12 += t12;
                }
                if(!isNaN(t13)){
                	total13 += t13;
                }
                if(!isNaN(t14)){
                	total14 += t14;
                }
                if(!isNaN(t15)){
                	total15 += t15;
                }
                if(!isNaN(t16)){
                	total16 += t16;
                }
                if(!isNaN(t17)){
                	total17 += t17;
                }
            }
            if(e.field == "total12"){
            	e.cellHtml = "<div align='right'><b>￥" + formatNumber(total12.toFixed(2),'#,##.00'); + "</b></div>";
            }
            if(e.field == "total13"){
            	e.cellHtml = "<div align='right'><b>￥" + formatNumber(total13.toFixed(2),'#,##.00'); + "</b></div>";
            }
            if(e.field == "total14"){
            	e.cellHtml = "<div align='right'><b>￥" + formatNumber(total14.toFixed(2),'#,##.00'); + "</b></div>";
            }
            if(e.field == "total15"){
            	e.cellHtml = "<div align='right'><b>￥" + formatNumber(total15.toFixed(2),'#,##.00'); + "</b></div>";
            }
            if(e.field == "total16"){
            	e.cellHtml = "<div align='right'><b>￥" + formatNumber(total16.toFixed(2),'#,##.00'); + "</b></div>";
            }
            if(e.field == "total17"){
            	e.cellHtml = "<div align='right'><b>￥" + formatNumber(total17.toFixed(2),'#,##.00'); + "</b></div>";
            }
            if(e.field == "total"){
            	e.cellHtml = "<div align='right'><b>￥" + formatNumber(total.toFixed(2),'#,##.00'); + "</b></div>";
            }
        }
        function search() {
            var form = new nui.Form("#form1");
			var data = form.getData();
            grid.load(data);
        }
        function onGenderRenderer(e) {
            return nui.getDictText('CONT_ORG',e.value);
        }
        function onGender1Renderer(e) {
            return nui.getDictText('MIS_INCOMETYPE',e.value);
        }
	    function onTitleRenderer(e) {
			return "<a href='javascript:void(0)' onclick='doView(" + e.record.newCsContract.contractid + ");' title='点击查看合同信息'>" + e.value + "</a>";
		}
	    function onTitle1Renderer(e) {
			return "<a href='javascript:void(0)' onclick='doView1();' title='点击查看采购信息'>" + e.value + "</a>";
		}
		function doView(contractid){
			var executeUrl = "<%=request.getContextPath() %>/newcont/newCont/contractView.jsp?contractid=" + contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
		}
		function doView1(){
			var selectRow = grid.getSelected();
			if(!selectRow){
				nui.alert("请选择其中一条采购数据!");
				return;
			}
			var executeUrl = "<%=request.getContextPath() %>/newcont/buy/buyView.jsp?buyid=" + selectRow.buyid;
			window.open(executeUrl, "采购查看", "fullscreen=1");
		}
        function add() {
            nui.open({
                url: "<%=request.getContextPath() %>/newcont/buy/buyModify.jsp",
                title: "新增采购", width: 1100, height: 550,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "new"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                	if(action=='save'){
                    	grid.reload();
                	}
                }
            });
        }
        function edit() {
        	var rows = grid.getSelecteds();
        	if (rows.length > 1) {
        		alert("只能选中一条记录进行编辑");
        	}else{
	            var row = grid.getSelected();
	            if (row) {
	                nui.open({
	                    url: "<%=request.getContextPath() %>/newcont/buy/buyModify.jsp",
	                    title: "编辑采购", width: 1100, height: 550,
	                    onload: function () {
	                        var iframe = this.getIFrameEl();
	                        var data = { action: "edit", buyid: row.buyid };
	                        iframe.contentWindow.SetData(data);
	                    },
	                    ondestroy: function (action) {
	                        grid.reload();
	                    }
	                });
	                
	            } else {
	                alert("请选中一条记录");
	            }
            }
        }
        function remove() {            
            var rows = grid.getSelecteds();
            var data = {csbuys:rows};
            var json = nui.encode(data);
            if (rows.length > 0) {
                if (confirm("确定删除选中记录？")) {
                    grid.loading("操作中，请稍后......");
                    nui.ajax({
                        url: "com.primeton.mis.newcont.buy.deleteBuys.biz.ext",
                        type: "post",
                        data: json, 
                        cache: false,
                        contentType: 'text/json',
                        success: function (text) {
                            grid.reload();
                        },
                        error: function () {
                        }
                    });
                }
            } else {
                alert("请选中一条记录");
            }
        }
        function onDrawCell(e){
	    	var record = e.record;
	        var income11 = record.income11;
	        var income121 = record.income121;
	        var income122 = record.income122;
	        var income123 = record.income123;
	        var income124 = record.income124;
	        var income131 = record.income131;
	        var income132 = record.income132;
	        var income133 = record.income133;
	        var income134 = record.income134;
	        var income141 = record.income141;
	        var income142 = record.income142;
	        var income143 = record.income143;
	        var income144 = record.income144;
	        var income151 = record.income151;
	        var income152 = record.income152;
	        var income153 = record.income153;
	        var income154 = record.income154;
	        var income161 = record.income161;
	        var income162 = record.income162;
	        var income163 = record.income163;
	        var income164 = record.income164;
	        var income1701 = record.income1701;
	        var income1702 = record.income1702;
	        var income1703 = record.income1703;
	        var income1704 = record.income1704;
	        var income1705 = record.income1705;
	        var income1706 = record.income1706;
	        var income1707 = record.income1707;
	        var income1708 = record.income1708;
	        var income1709 = record.income1709;
	        var income1710 = record.income1710;
	        var income1711 = record.income1711;
	        var income1712 = record.income1712;
	        var income16 = record.income16;
	        if (e.field == "total12") {
	            e.cellStyle = "background:#CC99CC;";
	            if((income121+income122+income123+income124) != 0){
	            	e.cellHtml = "￥" + formatNumber((income121+income122+income123+income124).toFixed(2),'#,##.00');
	        	}
	        }
	        if (e.field == "total13") {
	            e.cellStyle = "background:#CC99CC;";
	            if((income131+income132+income133+income134) != 0){
	            	e.cellHtml = "￥" + formatNumber((income131+income132+income133+income134).toFixed(2),'#,##.00');
	        	}
	        }
	        if (e.field == "total14") {
	            e.cellStyle = "background:#CC99CC;";
	            if((income141+income142+income143+income144) != 0){
	            	e.cellHtml = "￥" + formatNumber((income141+income142+income143+income144).toFixed(2),'#,##.00');
	        	}
	        }
	        if (e.field == "total15") {
	            e.cellStyle = "background:#CC99CC;";
	            if((income151+income152+income153+income154) != 0){
	            	e.cellHtml = "￥" + formatNumber((income151+income152+income153+income154).toFixed(2),'#,##.00');
	        	}
	        }
	        if (e.field == "total16") {
	            e.cellStyle = "background:#CC99CC;";
	            if((income161+income162+income163+income164) != 0){
	            	e.cellHtml = "￥" + formatNumber((income161+income162+income163+income164).toFixed(2),'#,##.00');
	        	}
	        }
	        if (e.field == "total17") {
	            e.cellStyle = "background:#CC99CC;";
	            if((income1701+income1702+income1703+income1704+income1705+income1706+income1707+income1708+income1709+income1710+income1711+income1712) != 0){
	            	e.cellHtml = "￥" + formatNumber((income1701+income1702+income1703+income1704+income1705+income1706+income1707+income1708+income1709+income1710+income1711+income1712).toFixed(2),'#,##.00');
	        	}
	        }
	        if (e.field == "total") {
	            if((income11+income121+income122+income123+income124+income131+income132+income133+income134+income141+income142+income143+income144+income151+income152+income153+income154+income161+income162+income163+income164+income1701+income1702+income1703+income1704+income1705+income1706+income1707+income1708+income1709+income1710+income1711+income1712+income16) != 0){
	            	e.cellHtml = "￥" + formatNumber((income11+income121+income122+income123+income124+income131+income132+income133+income134+income141+income142+income143+income144+income151+income152+income153+income154+income161+income162+income163+income164+income1701+income1702+income1703+income1704+income1705+income1706+income1707+income1708+income1709+income1710+income1711+income1712+income16).toFixed(2),'#,##.00');
	        	}
	        }
	    }
        
        function exportContract(){
            var form = new nui.Form("#form1");
			var data = form.getData();
            var json = nui.encode(data);
    	
    	grid.loading("操作中，请稍后......");
		nui.ajax({
                    url: "com.primeton.mis.newcont.income.exportIncome.biz.ext",
                    type: "post",
                    data: json,
                    cache: false,
                    contentType: 'text/json',
                    success: function (o) {
                 	grid.unmask ( );
                    	var filePath = o.downloadFile;
                    	var fileName = "income";
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