<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): ChiaYang
  - Date: 2016-10-31 14:19:25
  - Description:
-->
<head>
	<title>采购成本存货明细</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-fix">
		<div class="nui-panel" title="采购成本结转明细" style="width: auto">
			<div id="form1">
			<!-- <input class="nui-hidden" name="criteria._expr[2]._property" value="orgname"/>
			<input class="nui-hidden" name="criteria._expr[2]._value" id="salename"/>
			<input class="nui-hidden" name="criteria._expr[4]._property" value="contnum"/>
			<input class="nui-hidden" name="criteria._expr[4]._value" id="contnum"/>
			<input class="nui-hidden" name="criteria._expr[3]._property" value="custjc"/>
			<input class="nui-hidden" name="criteria._expr[3]._value" id="custname"/>
			<input class="nui-hidden" name="criteria._expr[1]._property" value="syb"/>
			<input class="nui-hidden" name="criteria._expr[1]._value" id="syb"/> -->
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:500px;" allowResize="true" dataField="purOutCosts" 
		    	url="com.primeton.mis.newcont.cgcbjzmx.purOutCostQuery.biz.ext" idField="id" allowResize="true" 
		    	sizeList="[10,20,50,100,1000]" pageSize="50"  multiSelect="true" showSummaryRow="true" ondrawsummarycell="doCountNowPage">
			    <div property="columns">
			    	<div field="outcostid" width="50px;" align="center" headerAlign="center" allowSort="true" renderer="getOutCostDetail">编号</div>
			    	<div field="syb" width="120px;" align="center" headerAlign="center" allowSort="true">事业部</div>
			    	<div field="custjc" width="120px;" align="center" headerAlign="center" allowSort="true">客户简称</div>
			    	<div field="contnum" width="100px;" align="left" headerAlign="center" allowSort="true" >销售合同编号</div>
			    	<div field="orgname" width="80px;" align="center" headerAlign="center" allowSort="true">销售</div>
			    	<div field="confirmdate" width="80px;" align="center" headerAlign="center" allowSort="true">成本确认日期</div>
			    	<div field="costmemo" width="80px;" align="center" headerAlign="center" allowSort="true" renderer="dictGetAME_COSTTYPE">成本结转说明</div>
			    	<div field="stockdate" width="80px;" align="center" headerAlign="center" allowSort="true">存货结转日期</div>
			    	<div field="outcosttype" width="80px;" align="center" headerAlign="center" allowSort="true" renderer="dictGetAME_OUTCOSTTYPE">成本结转类型</div>
			    	<div field="notaxmon" width="125px;" align="right" headerAlign="center" allowSort="true" currencyUnit="￥" summaryType="sum" dataType="currency">成本结转金额(不含税)</div>
			    	<div field="suppliersname" width="150px;" align="center" headerAlign="center" allowSort="true">供应商简称</div>
			    	<div field="purcontno" width="105px;" align="left" headerAlign="center" allowSort="true" renderer="getPurContractDetail">采购合同编号</div>
			    	<div field="purorderno" width="125px;" align="left" headerAlign="center" allowSort="true">采购订单编号</div>
			    	<div field="settlementno" width="100px;" align="left" headerAlign="center" allowSort="true" renderer="getSettlementno">结算单编号</div>
			    	<div field="accruedid" width="70px;" align="left" headerAlign="center" allowSort="true">计提单编号</div>
			    	<div field="startdate" width="80px;" align="center" headerAlign="center" allowSort="true">成本开始日期</div>
			    	<div field="enddate" width="80px;" align="center" headerAlign="center" allowSort="true">成本结束日期</div>
			    	<div field="outcoststatus" width="80px;" align="center" headerAlign="center" allowSort="true" renderer="dictGetAME_OUTCOSTSTATUS">成本结转状态</div>
			    	<div field="projectno" width="90px;" align="left" headerAlign="center" allowSort="true" renderer="detailProj">项目编号</div>
			    </div>
			</div>
		</div>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
	    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
		</div>
	<script type="text/javascript">
		nui.parse();
		var grid = nui.get("datagrid1");
		var form = new nui.Form("form1");
		var myyear = '<%=request.getParameter("years") %>';
		var mymonth = '<%=request.getParameter("months") %>';
		var salename = '<%=request.getParameter("salename") %>';
		var custname = '<%=request.getParameter("custname") %>';
		var syb = '<%=request.getParameter("syb") %>';
		var contnum = '<%=request.getParameter("contnum") %>';
		var chtype = '<%=request.getParameter("chtype") %>';
		//初始化加载数据,默认按照成本确认日期降序排列
		init();
	    function init() {
	    	var date1 = myyear+"-"+mymonth+"-01";
	    	var  days = new Date(myyear,mymonth,0);   
            var lastdate = myyear + '-' + mymonth + '-' + days.getDate();//获取当月最后一天日期  
		    var cont1 = {"_property": "contnum","_op": "=","_value": contnum};
		    var syb1 = {"_property": "syb","_op": "=","_value": syb};
		    var sale1 = {"_property": "orgname","_op": "=","_value": salename};
		    var cust1 = {"_property": "custjc","_op": "=","_value": custname};
		    var dates = {"_and[0]": {"_expr[0]": {"_property": "confirmdate","_op": "<","_value": date1},
			 						 "_expr[1]": {"_property": "costmemo","_op": "=","_value": "1"}},
			 			"_and[1]": {"_expr[0]": {"_property": "confirmdate","_op": "<","_value": date1},
			 						 "_expr[1]": {"_property": "costmemo","_op": "=","_value": "0"},
			 						 "_expr[2]": {"_property": "stockdate","_op": ">=","_value": date1}}}
		    if(chtype == "dqch"){
		    	dates = {"_and[0]": {"_expr[0]": {"_property": "confirmdate","_op": "between","_min": date1,"_max": lastdate},
			 						 "_expr[1]": {"_property": "costmemo","_op": "=","_value": "1"}},
			 			"_and[1]": {"_expr[0]": {"_property": "confirmdate","_op": "between","_min": date1,"_max": lastdate},
			 						 "_expr[1]": {"_property": "costmemo","_op": "=","_value": "0"},
			 						 "_expr[2]": {"_property": "stockdate","_op": ">=","_value": date1}}}
		    }else if(chtype == "dqjz"){
		    	dates = {"_and[0]": {"_expr[0]": {"_property": "confirmdate","_op": "<","_value": date1},
			 						 "_expr[1]": {"_property": "costmemo","_op": "=","_value": "0"},
			 						 "_expr[2]": {"_property": "stockdate","_op": "between","_min": date1,"_max": lastdate}},
			 			"_and[1]": {"_expr[0]": {"_property": "confirmdate","_op": "between","_min": date1,"_max": lastdate},
			 						 "_expr[1]": {"_property": "costmemo","_op": "=","_value": "0"},
			 						 "_expr[2]": {"_property": "stockdate","_op": "between","_min": date1,"_max": lastdate}}}
		    }else if(chtype == "chye"){
		    	dates = {"_and[0]": {"_expr[0]": {"_property": "confirmdate","_op": "<=","_value": lastdate},
			 						 "_expr[1]": {"_property": "costmemo","_op": "=","_value": "1"}},
			 			"_and[1]": {"_expr[0]": {"_property": "confirmdate","_op": "<=","_value": lastdate},
			 						 "_expr[1]": {"_property": "costmemo","_op": "=","_value": "0"},
			 						 "_expr[2]": {"_property": "stockdate","_op": ">","_value": lastdate}}}
		    }
		    
		    if(salename == null || salename ==""){
		    	sale1 = {"_property": "orgname","_op": "null"};
		    }else if(salename == "wxtj"){
		    	var sale1 = {"_property": "orgname","_op": "=","_value": null};
		    }
		    if(syb == null || syb ==""){
		    	syb1 = {"_property": "syb","_op": "null"};
		    }else if(syb == "wxtj"){
		    	var syb1 = {"_property": "syb","_op": "=","_value": null};
		    }
		    if(contnum == null || contnum ==""){
		    	cont1 = {"_property": "contnum","_op": "null"};
		    }else if(contnum == "wxtj"){
		    	cont1 = {"_property": "contnum","_op": "=","_value": null};
		    }
		    if(custname == null || custname ==""){
		    	cust1 = {"_property": "custjc","_op": "null"};
		    }else if(custname == "wxtj"){
		    	cust1 = {"_property": "custjc","_op": "=","_value": null};
		    }
			var json = {"criteria": {"_expr[1]": cont1,
									 "_expr[2]": cust1,
									 "_expr[3]": sale1,
									 "_expr[4]": syb1,
									 "_or[0]": dates}};
			var data = nui.decode(json);
			grid.load(data); 
	    	grid.sortBy("confirmdate","desc");
	    }
	    
	    //数字列提供统计行
        function doCountNowPage(e){        	
            if (e.field == "notaxmon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
	    //设置业务字典值-状态
	    function dictGetAME_OUTCOSTSTATUS(e) {
	        return nui.getDictText('AME_OUTCOSTSTATUS',e.value);
	    }
	    
	    //设置业务字典值-状态
	    function dictGetAME_COSTTYPE(e) {
	        return nui.getDictText('AME_COSTTYPE',e.value);
	    }
	      
	    //设置业务字典值-成本结转类型
	    function dictGetAME_OUTCOSTTYPE(e) {
	        return nui.getDictText('AME_OUTCOSTTYPE',e.value);
	    }
	    function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();  
	    }
	</script>
</body>
</html>