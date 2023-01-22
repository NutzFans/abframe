<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2020-03-18 14:17:51
  - Description:
-->
<head>
<title id="title1"></title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    </style>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
			<div class="nui-fit">
	<div>
		<div class="nui-panel" title="财报收入" style="width:49%;height:100%;padding:0px;float: left;margin-right: 1%;" >
	         <div id="grid_1" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" dataField="revelists" showSummaryRow="true" ondrawsummarycell="doCsReveSum"
		    url="com.primeton.eos.ame_income.csReveForcastFin.queryCompareReveList.biz.ext"  showPager="false" multiSelect="true" 
		   >
				<div property="columns">
					<div field="revetype" width="80" align="center" headerAlign="center" renderer="revetype">收入类型</div>
					<div field="confirmday" name="confirmday" width="80" align="center" headerAlign="center" allowSort="true" >确认日期</div>	
					<div field="reveno" width="80" align="center"  headerAlign="center" allowSort="true" renderer="detailReve">收入确认次数</div>
					<div field="actproductsum2" name="actproductsum2"  width="120" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">产品金额（不含税）</div>
					<div field="actservicesum2" name="actservicesum2"  width="120" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">服务金额（不含税）</div>
					<div field="actmasum2" name = "actmasum2"  width="120"  align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">MA金额（不含税）</div>
					<div field="actsum2" name = "actsum2"  width="120" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">已确认金额（不含税）</div>
					<div field="confirmdayStart" name="confirmdayStart" width="80" align="center" headerAlign="center" allowSort="true">应收开始日期</div>	
					<div field="memo" width="80" align="center" headerAlign="center" allowSort="true">说明</div>	
				</div>
			</div>
		</div>
		<div class="nui-panel" title="管报收入" style="width:49%;height:100%;padding:0px;margin:0px;float:left" >
	         <div id="grid_2" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" dataField="revelists" showSummaryRow="true" ondrawsummarycell="doCsReveSum"
		    url="com.primeton.eos.ame_income.csReveForcastFin.queryCompareReveList.biz.ext" showPager="false" multiSelect="true" 
		   >
				<div property="columns">
					<div field="revetype" width="80" align="center" headerAlign="center" renderer="revetype">收入类型</div>
					<div field="maconfirmday" name="confirmday" width="80" align="center" headerAlign="center" allowSort="true" >确认日期</div>	
					<div field="reveno" width="80" align="center"  headerAlign="center" allowSort="true" renderer="detailReve">收入确认次数</div>
					<div field="actproductsum2" name="actproductsum2"  width="120" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">产品金额（不含税）</div>
					<div field="actservicesum2" name="actservicesum2" width="120" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">服务金额（不含税）</div>
					<div field="actmasum2" name = "actmasum2"  width="120" align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">MA金额（不含税）</div>
					<div field="actsum2" name = "actsum2"  width="120"  align="right" headerAlign="center" dataType="currency" summaryType="sum" currencyUnit="￥">已确认金额（不含税）</div>
					<div field="maconfirmdayStart" name="confirmdayStart" width="80" align="center" headerAlign="center" allowSort="true">应收开始日期</div>	
					<div field="memo" width="80" align="center" headerAlign="center" allowSort="true">说明</div>	
				</div>
			</div>
		</div>
	</div>
	</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div> 
</body>
<script type="text/javascript">

	nui.parse();
	var grid = nui.get("grid_1");
	var grid2 = nui.get("grid_2");
	var contnum = getUrlParam("contnum");
	var day_min = getUrlParam("day_min");
	var day_max = getUrlParam("day_max");
	init();
	function getUrlParam(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) 
		return unescape(r[2]); 
		return null; 
	} 	
	
	function init(){
		search();
	}
	
	//查询
	function search() {
		var data1= {"contnum":contnum,"flag":"fin","day_min":day_min,"day_max":day_max}; 
		var data2={"contnum":contnum,"flag":"ma","day_min":day_min,"day_max":day_max}; 
	  	grid.load(data1,function(){
	  		grid2.load(data2);
	  	}); //datagrid加载数据
	}
			
	
	function onCancel(e) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();  
    }
    //汇总值处理
    function doCsReveSum(e){        	
        if (e.field == "actproductsum" || e.field == "actproductsum2"||e.field == "actservicesum" || e.field == "actservicesum2"||e.field == "actmasum" || e.field == "actmasum2"||e.field == "actsum" || e.field == "actsum2") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
    }
	function revetype(e) {
		return nui.getDictText('AME_REVETYPE',e.value);//设置业务字典值
	}	
    </script>
</html>