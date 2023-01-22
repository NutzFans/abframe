<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2018-05-02 19:06:04
  - Description:
-->
<head>
	<title>计提/结算明细</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-fix">
		<div class="nui-panel" title="计提/结算明细" width="auto">
			<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
				<input class="nui-hidden" name="criteria._expr[0]._value" style="width:120px;" onenter="onKeyEnter" id="contnum"/>
			    <input class="nui-hidden" name="criteria._expr[0]._property" value="contnum"/>
			    <input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
			    
			    <input name="criteria._expr[1]._min" class="nui-hidden" style="width:100px;" id="startdate"/>
			    <input name="criteria._expr[1]._max" class="nui-hidden" style="width:100px;" id="enddate"/>
			    <input class="nui-hidden" name="criteria._expr[1]._property" value="confirmdate"/>
			    <input class="nui-hidden" name="criteria._expr[1]._op" value="between"/>
			    
			    <input class="nui-hidden" name="criteria._expr[2]._value" style="width:120px;" onenter="onKeyEnter" id="outcosttype"/>
			    <input class="nui-hidden" name="criteria._expr[2]._property" value="outcosttype"/>
			    <input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
			</div>
			
			<div id="datagrid1" class="nui-datagrid" style="width:100%;height:535px;" allowResize="true" dataField="purOutCosts" 
		    	url="com.primeton.mis.newcont.cgcbjzmx.purOutCostQuery.biz.ext" idField="id" allowResize="true" 
		    	sizeList="[10,20,50,100,1000]" pageSize="50"  multiSelect="true" showSummaryRow="true" ondrawsummarycell="doCountNowPage">
			    <div property="columns">
			    	<div type="checkcolumn"></div>
			    	<div field="outcostid" width="50px;" align="center" headerAlign="center" allowSort="true">编号</div>
			    	<div field="confirmdate" width="80px;" align="center" headerAlign="center" allowSort="true">成本确认日期</div>
			    	<div field="outcosttype" width="80px;" align="center" headerAlign="center" allowSort="true" renderer="dictGetAME_OUTCOSTTYPE">成本结转类型</div>
			    	<div field="pzhs" width="50px;" align="center" headerAlign="center" allowSort="true">凭证号数</div>
			    	<div field="taxmon" width="115px;" align="right" headerAlign="center" allowSort="true" currencyUnit="￥" summaryType="sum" dataType="currency">成本结转金额(含税)</div>
			    	<div field="notaxmon" width="125px;" align="right" headerAlign="center" allowSort="true" currencyUnit="￥" summaryType="sum" dataType="currency">成本结转金额(不含税)</div>
			    	<div field="suppliersname" width="150px;" align="center" headerAlign="center" allowSort="true">供应商简称</div>
			    	<div field="purcontno" width="125px;" align="left" headerAlign="center" allowSort="true">采购合同编号</div>
			    	<div field="purcontid" width="0" align="left" headerAlign="center" allowSort="true">采购合同id</div>	
			    	<div field="purorderno" width="135px;" align="left" headerAlign="center" allowSort="true">采购订单编号</div>
			    	<div field="purorderid" width="0" align="left" headerAlign="center" allowSort="true">采购订单id</div>  	
			    	<div field="settlementno" width="120px;" align="left" headerAlign="center" allowSort="true">结算单编号</div>
			    	<div field="settlemon" width="90px;" align="right" headerAlign="center" allowSort="true" currencyUnit="￥" summaryType="sum" dataType="currency">结算单金额</div>
			    	<div field="accruedid" width="70px;" align="left" headerAlign="center" allowSort="true">计提单编号</div>
			    	<div field="accruedmon" width="90px;" align="right" headerAlign="center" allowSort="true" currencyUnit="￥" summaryType="sum" dataType="currency">计提金额</div>
			    	<div field="startdate" width="80px;" align="center" headerAlign="center" allowSort="true">成本开始日期</div>
			    	<div field="enddate" width="80px;" align="center" headerAlign="center" allowSort="true">成本结束日期</div>
			    	<div field="outcoststatus" width="80px;" align="center" headerAlign="center" allowSort="true" renderer="dictGetAME_OUTCOSTSTATUS">成本结转状态</div>
			    	<div field="costmemo" width="80px;" align="center" headerAlign="center" allowSort="true" renderer="dictGetAME_COSTTYPE">成本结转说明</div>
			    	<div field="stockdate" width="80px;" align="center" headerAlign="center" allowSort="true">存货结转日期</div>
			    	<div field="projectno" width="100px;" align="left" headerAlign="center" allowSort="true" >项目编号</div>
			    	<div field="contnum" width="110px;" align="left" headerAlign="center" allowSort="true">财务对应合同编号</div>
			    	<div field="orgname" width="80px;" align="center" headerAlign="center" allowSort="true">受益部门</div>
			    	<div field="workunit" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictGetWorkunit">工作量单位</div>
	                <div field="workamount" width="80" headerAlign="center" allowSort="true" >工作量数量</div>
			    </div>
			</div>
			
			<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
		    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
        var grid = nui.get("datagrid1");
        var contnum = getUrlParam("contnum");
        var startdate= getUrlParam("startdate");
    	var enddate= getUrlParam("enddate");
    	var outcosttype= getUrlParam("outcosttype");
    	if(contnum!=null&& contnum!=""){
    		nui.get("contnum").setValue(contnum);
    	}
    	if(startdate!=null&&startdate!=""){
    		nui.get("startdate").setValue(startdate);
    	}
    	if(enddate!=null&&enddate!=""){
    		nui.get("enddate").setValue(enddate);
    	}
    	if(outcosttype != null && outcosttype !=""){
    		nui.get("outcosttype").setValue(outcosttype);
    	}
    	init();
    	function init(){
    		var data = form.getData(); //获取表单JS对象数据
    		grid.load(data);
	    	grid.sortBy("confirmdate","desc");
		}
		
		//设置业务字典值-成本结转类型
	    function dictGetAME_OUTCOSTTYPE(e) {
	        return nui.getDictText('AME_OUTCOSTTYPE',e.value);
	    }
	    //设置业务字典值-状态
	    function dictGetAME_OUTCOSTSTATUS(e) {
	        return nui.getDictText('AME_OUTCOSTSTATUS',e.value);
	    }
	    //设置业务字典值-状态
	    function dictGetAME_COSTTYPE(e) {
	        return nui.getDictText('AME_COSTTYPE',e.value);
	    }
	    //设置业务字典值-工作量单位
		function dictGetWorkunit(e){
			return nui.getDictText('SERV_NUM_TYPE',e.value);
		}
		//数字列提供统计行
        function doCountNowPage(e){        	
            if (e.field == "taxmon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "notaxmon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "settlemon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
            if (e.field == "accruedmon") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            }
        }
        function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();  
	    }
	    function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return unescape(r[2]); 
			return null; 
		} 
	</script>
</body>
</html>