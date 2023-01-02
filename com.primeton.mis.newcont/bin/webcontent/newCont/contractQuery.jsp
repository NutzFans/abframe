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
<head>
	<title>合同信息管理</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="nui-panel" title="合同综合信息" style="width:100%;">
		<div id="form1">
			<input class="nui-hidden" name="sortField" value="contractid"/>
			<input class="nui-hidden" name="sortOrder" value="desc"/>
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
		            	<td align="right"><span>合同存档编号：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[0].contnum"/>
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
					    </td>
			        	<td align="right"><span>登记日期：</span></td>
		            	<td>
		            		<input class="nui-datepicker" name="criteria._expr[1]._min" style="width:98px"/>-<input class="nui-datepicker" name="criteria._expr[1]._max" style="width:98px"/>
					        <input class="nui-hidden" name="criteria._expr[1]._property" value="contreg"/>
					        <input class="nui-hidden" name="criteria._expr[1]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[1]._pattern" value="yyyy-MM-dd"/>
					    </td>
						<td align="right"><span>签署单位：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[3]._value"/>
		            		<input class="nui-hidden" name="criteria._expr[3]._property" value="misCustinfo.custname"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>合同项目名称：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[4]._value"/>
		            		<input class="nui-hidden" name="criteria._expr[4]._property" value="projectname"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
					    </td>
					</tr>
					<tr>
					    <td align="right"><span>行业：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[15]._value" dictTypeId="MIS_INDUSTRY_SUBDIVISION" id="industry" multiSelect="true"/>
		            		<input class="nui-hidden" name="criteria._expr[15]._property" value="industry"/>
		            		<input class="nui-hidden" name="criteria._expr[15]._op" value="in"/>
					    </td>
			        	<td align="right"><span>签署日期：</span></td>
		            	<td>
		            		<input class="nui-datepicker" name="criteria._expr[2]._min" style="width:98px"/>-<input class="nui-datepicker" name="criteria._expr[2]._max" style="width:98px"/>
					        <input class="nui-hidden" name="criteria._expr[2]._property" value="signdate"/>
					        <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[2]._pattern" value="yyyy-MM-dd"/>
					    </td>
					    <td align="right"><span>所属事业部：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" id="org" name="criteria._expr[10]._value" dictTypeId="CONT_ORG" showNullItem="true" nullItemText="全部"/>
		            		<input class="nui-hidden" name="criteria._expr[10]._property" value="org"/>
					        <input class="nui-hidden" name="criteria._expr[10]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[10]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>销售姓名：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[9]._value" id="salename"/>
		            		<input class="nui-hidden" name="criteria._expr[9]._property" value="salename"/>
					        <input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[9]._likeRule" value="all"/>
					    </td>
					</tr>
					<tr>
					    <td align="right"><span>销售所在部门：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._ref[1]._expr[0]._value" id="orgname"/>
		            		<input class="nui-hidden" name="criteria._expr[11]._property" value="contractid"/>
					        <input class="nui-hidden" name="criteria._expr[11]._op" value="in" id="tempCond11"/>
					        <input class="nui-hidden" name="criteria._expr[11]._ref" value="2" id="tempCond21"/>
					        <input class="nui-hidden" name="criteria._ref[0]._id" value="2"/>
					        <input class="nui-hidden" name="criteria._ref[0]._entity" value="com.primeton.mis.contract.contract.CsContractsale"/>
					        <input class="nui-hidden" name="criteria._ref[0]._select._field[0]" value="contractid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._property" value="orgid"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._op" value="in"/>
					        <input class="nui-hidden" name="criteria._ref[0]._expr[0]._ref" value="3"/>
					        <input class="nui-hidden" name="criteria._ref[1]._id" value="3"/>
					        <input class="nui-hidden" name="criteria._ref[1]._entity" value="org.gocom.abframe.dataset.organization.OmOrganization"/>
					        <input class="nui-hidden" name="criteria._ref[1]._select._field[0]" value="orgid"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._property" value="orgname"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._ref[1]._expr[0]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>合同总金额：</span></td>
					    <td>
		            		<input class="nui-textbox" name="criteria._expr[5]._min" style="width:98px"/>-<input class="nui-textbox" name="criteria._expr[5]._max" style="width:98px"/>
					        <input class="nui-hidden" name="criteria._expr[5]._property" value="contsum"/>
					        <input class="nui-hidden" name="criteria._expr[5]._op" value="between"/>
					    </td>
					    <td align="right"><span>新合同收入类型：</span></td>
					    <td>
		            		<input class="nui-dictcombobox" name="criteria._ref[2]._expr[0]._value" dictTypeId="AME_NEWTYPE" multiSelect="true"  id="newtype"/>
		            		<input class="nui-hidden" name="criteria._expr[12]._property" value="contnum"/>
					        <input class="nui-hidden" name="criteria._expr[12]._op" value="in" id="tempCond1"/>
					        <input class="nui-hidden" name="criteria._expr[12]._ref" value="1" id="tempCond2"/>
					        <input class="nui-hidden" name="criteria._ref[2]._id" value="1"/>
					        <input class="nui-hidden" name="criteria._ref[2]._entity" value="com.primeton.mis.contract.contract.CsReveForecast"/>
					        <input class="nui-hidden" name="criteria._ref[2]._select._field[0]" value="contnum"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._property" value="newtype"/>
					        <input class="nui-hidden" name="criteria._ref[2]._expr[0]._op" value="in"/>
					    </td>
					    <td align="right"><span>所属公司：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[16]._value" dictTypeId="company" multiSelect="true" style="width: 115px;"/>
		            		<input class="nui-hidden" name="criteria._expr[16]._property" value="company"/>
		            		<input class="nui-hidden" name="criteria._expr[16]._op" value="in"/>
					    </td>
					</tr>
					<tr>
					<td align="right"><span>是否可以对外宣传：</span></td>
		            	<td>
		            		<input class="nui-dictcombobox" name="criteria._expr[17]._value" dictTypeId="MIS_YN" showNullItem="true" />
		            		<input class="nui-hidden" name="criteria._expr[17]._property" value="publicity"/>
		            		<input class="nui-hidden" name="criteria._expr[17]._op" value="="/>
					    </td>
					</tr>    
					<tr><td align="center" colspan="10">
						<a class="nui-button" iconCls="icon-search" onclick="search()">查找</a>
						<a class="nui-button" iconCls="icon-download" onclick="exportContract()" id="contractQuery_exportButton">导出到Excel</a>
						<a class="nui-button" iconCls="icon-converse" id ="contCover" onclick="contCover()">商务合同转财务合同</a>
					</td></tr>
			    </table>
			</div>
	    </div><!-- 
	    <div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	                <tr>
	                    <td style="width:100%;">
	                        <a class="nui-button" id="editBtn" iconCls="icon-edit" onclick="edit()">编辑</a>     
	                    </td>
	                </tr>
	            </table>           
	        </div>
	    </div> -->
	    <div id="datagrid1" dataField="contracts" class="nui-datagrid" frozenStartColumn="0" frozenEndColumn="4"  style="width:100%;height:420px;" showSummaryRow="true"
	    	url="com.primeton.mis.newcont.newCont.queryContract.biz.ext" idField="id" allowResize="true" ondrawsummarycell="doCountNowPage"
	    	sizeList="[10,20,30,50,100,200,500,1000,5000,10000]" pageSize="15" allowAlternating="true" multiSelect="true">
		    <div property="columns">
		    	<!-- <div name="temp123" type="checkcolumn"></div> -->
		        <div field="contnum" width="77" renderer="onTitleRenderer" headerAlign="center" allowSort="true">合同存档编号</div>
		        <div field="contreg" width="70" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">登记日期</div>
		        <div field="signdate" width="70" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">签署日期</div>
		        <div field="misCustinfo.custname" width="130" dateFormat="yyyy-MM-dd" headerAlign="center" allowSort="true">签署单位</div>
		        <div field="projectname" width="130" headerAlign="center">合同项目名称</div>
		        <div field="prodmon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">产品金额（元）</div>
		        <div field="servmon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">服务金额（元）</div>
		        <div field="prodwbmon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="80" headerAlign="center" allowSort="true">MA金额（元）</div>
		        <div field="contsum" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">总金额（元）</div>
		        <div field="contsumNet" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">总金额不含税（元）</div>
		        <div field="gathermon" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center">已收款金额（元）</div>
		        <div field="salename" width="50" headerAlign="center" allowSort="true">销售姓名</div>
		        <div field="org" renderer="onGenderRenderer" width="70" headerAlign="center" allowSort="true">部门</div>
		        <div field="incomeNet" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="80" headerAlign="center" allowSort="true">已确认收入</div>
		        <div field="cbjz" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">已结转成本</div> 
		        <div field="incomerat" numberFormat="p1" width="80" align="right" headerAlign="center">已确认毛利率</div>
		        <div field="notincomeNet" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="80" headerAlign="center" allowSort="true">未确认收入</div>
		        <div field="stockNet" dataType="currency" summaryType="sum" currencyUnit="￥" align="right" width="100" headerAlign="center" allowSort="true">存货成本</div>  
		        <div field="beconfrat" numberFormat="p1" width="80" align="right" headerAlign="center">待确认毛利率</div>
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
	init();
	function init(){
		grid.load();
		grid.sortBy("contractid", "desc");
	}
		var contsumNet=0; 
    	var incomeNet=0;
    	var cbjz=0;
    	var	notincomeNet=0;
    	var stockNet=0;
    	var incomerat=0;
    	var beconfrat=0;
        //对该页的总金额做合计
        function doCountNowPage(e){     
            //客户端汇总计算
            if (e.field == "prodmon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "servmon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "prodwbmon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "contsum") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "contsumNet") {
            	contsumNet=commafyback(e.cellHtml);
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "gathermon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "incomeNet") {
            	incomeNet=commafyback(e.cellHtml);
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "cbjz") {
            	cbjz=commafyback(e.cellHtml);
            	if(cbjz <0){
            		cbjz = cbjz*-1;
            	}
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "incomerat") {
            	if(contsumNet > 0){
            		incomerat = (incomeNet-cbjz)/incomeNet;
            	}
            	if(incomerat == null || incomerat ==0){
            		incomerat =0;
            	}else{
            		incomerat = (incomerat*100).toFixed(1)+"%";
            	}
                e.cellHtml = "<div align='right'><b>" + incomerat+ "</b></div>";
            }
            if (e.field == "notincomeNet") {
            	notincomeNet=commafyback(e.cellHtml);
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "stockNet") {
            	stockNet=commafyback(e.cellHtml);
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "beconfrat") {
            	if(notincomeNet > 0){
            		beconfrat = (notincomeNet-stockNet)/notincomeNet;
            	}
            	if(beconfrat == null || beconfrat ==0){
            		beconfrat =0;
            	}else{
            		beconfrat = (beconfrat*100).toFixed(1)+"%";
            	}
                e.cellHtml = "<div align='right'><b>" + beconfrat + "</b></div>";
            }
            
            //按钮权限的控制
           	getOpeatorButtonAuth("contractQuery_exportButton");
        }
        function commafyback(num){
	    	if(num ==0 ){
	    		return 0;
	    	}else{
	    		num = num.substring(1);
	    	}
	       var x = num.split(',');
	       return parseFloat(x.join(""));
		}
        function search() {
        	if(nui.get("orgname").getValue() == ""){
        		nui.get("tempCond11").setValue("=");
        		nui.get("tempCond21").setValue("");
        	}else{
        		nui.get("tempCond11").setValue("in");
        		nui.get("tempCond21").setValue("2");
        	}
        	if(nui.get("newtype").getValue() == ""){
        		nui.get("tempCond1").setValue("=");
        		nui.get("tempCond2").setValue("");
        	}else{
        		nui.get("tempCond1").setValue("in");
        		nui.get("tempCond2").setValue("1");
        	}
            var form = new nui.Form("#form1");
			var data = form.getData();
            grid.load(data);
        }
        function onGenderRenderer(e) {
            return nui.getDictText('CONT_ORG',e.value);
        }
	    function onTitleRenderer(e) {
			return "<a href='javascript:void(0)' onclick='doView(" + e.record.contractid + ");' title='点击查看'>" + e.value + "</a>";
		}
		function doView(contractid){
			var executeUrl = "<%=request.getContextPath() %>/newcont/newCont/contractView.jsp?contractid=" + contractid;
			window.open(executeUrl, "", "fullscreen=yes,resizable=yes,scrollbars=yes,location=yes");
		}
        function exportContract(){
        	if(nui.get("orgname").getValue() == ""){
        		nui.get("tempCond11").setValue("=");
        		nui.get("tempCond21").setValue("");
        	}else{
        		nui.get("tempCond11").setValue("in");
        		nui.get("tempCond21").setValue("2");
        	}
        	if(nui.get("newtype").getValue() == ""){
        		nui.get("tempCond1").setValue("=");
        		nui.get("tempCond2").setValue("");
        	}else{
        		nui.get("tempCond1").setValue("in");
        		nui.get("tempCond2").setValue("1");
        	}
            var form = new nui.Form("#form1");
			var data = form.getData();
            var json = nui.encode(data);
    	
    	grid.loading("操作中，请稍后......");
		nui.ajax({
                    url: "com.primeton.mis.newcont.newCont.exportContract.biz.ext",
                    type: "post",
                    data: json,
                    cache: false,
                    contentType: 'text/json',
                    success: function (o) {
                 	grid.unmask ( );
                    	var filePath = o.downloadFile;
                    	var fileName = "contract";
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
        
        function contCover(){
        	if(!confirm("确认将商务合同转换为财务合同？")){
				return;
			}else{
				nui.get("contCover").disable();
				nui.ajax({
					url: "com.primeton.mis.newcont.newCont.contCover.biz.ext",
					type: 'POST',
					contentType: 'text/json',
			        success: function (o) {
				    	if(o.result == '1'||o.result == 1){
				    		nui.alert("转换成功！","系统提示",function(){
				    			grid.reload();
				    		});
				    	}else{
				    		nui.alert("转换失败！","系统提示",function(){
					    		nui.get("contCover").enable();
				    		});
				    	}
			        }
				});
			}
        }
    </script>
</body>
</html>