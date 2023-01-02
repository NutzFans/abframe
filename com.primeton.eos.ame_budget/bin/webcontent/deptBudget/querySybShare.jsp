<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhx
  - Date: 2016-05-31 14:20:45
  - Description:
-->
<head>
	<title>事业部分摊查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body >
	<div class="nui-fix">
		<div class="nui-panel" title="利润部门分摊查询" style="width: auto">
			<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<span>预算年份：</span>
							    <input  class="nui-textbox" style="width:100px;" id="inputyear" onvaluechanged="changeYear"/>
							<span>利润部门:</span>
						<input name="sharPara.orgids" id = "orgid" class="nui-treeselect" checkRecursive = "false"
							textField="orgname" valueField="orgid" parentField="parentorgid" dataField="orgs" showTreeIcon="true" valueFromSelect="true"
							showNullItem="true" multiSelect="true" checkRecursive = "true" expandOnLoad="true" showFolderCheckBox="true" style="width:300px;"/>
		                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
		        </div>
		    </div>
		        <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" dataField="sharfees" showPager="false" sortMode="client"
		        url="com.primeton.eos.ame_budget.ame_budget.querySharFee.biz.ext" showSummaryRow="true" ondrawsummarycell="doCountSum" onload="showcolumns">
					<div property="columns">
						<div field="year" align="center" headerAlign="center" allowSort="true" visible="false">预算年份</div>
						<div field="orgname" width="60" align="left" headerAlign="center" allowSort="true">利润部门</div>	
	                    <div field="commshar" headerAlign="center" width="50" numberFormat="n0" align="right" summaryType="sum" allowSort="true" dataType="float">管理分摊</div>
						<div field="comdshar" headerAlign="center" width="50" numberFormat="n0" align="right" summaryType="sum" allowSort="true" dataType="float">研发分摊</div>
	                    <div field="comashar" headerAlign="center" width="50" numberFormat="n0" align="right" summaryType="sum" allowSort="true" dataType="float">市场分摊</div>
	                    <div field="fthj" headerAlign="center" width="50" numberFormat="n0" align="right" summaryType="sum" allowSort="true" dataType="float">分摊合计</div>
	                    <div field="wptotalfee" headerAlign="center" width="50" numberFormat="n0" align="right" summaryType="sum" allowSort="true" dataType="float">含税总收入</div>
	                    <div field="jqlr" headerAlign="center" width="50" numberFormat="n0" align="right" summaryType="sum" allowSort="true" dataType="float">不含分摊的奖前利润</div>
					</div>
				</div>
			</div>
		</div>
    </div> 
	<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	var tree = nui.get("orgid");
    	init();
    	function init(){
			var d=new Date();
			var nowyear = d.getFullYear();
    	    nui.get("inputyear").setValue(nowyear);
    	    changeYear();
    		grid.load({year:nowyear});
		}
    	function search() {
			var year = nui.get("inputyear").getValue();
			var orgids = nui.get("orgid").getValue();
			if(year==null||year==""){
				alert("预算年份不能为空！");
				return;
			}
		  	grid.load({year:year,"orgids":orgids}); //datagrid加载数据
		}
		function doCountSum(e){        	
            if (e.field == "commshar" || e.field == "comdshar" ||e.field == "comashar" ||e.field == "fthj" ||e.field == "wptotalfee" ||e.field == "jqlr") {
                e.cellHtml = "<div align='right'><b>" + nui.formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
            if (e.field == "syb") {
                e.cellHtml = "<div align='center'><b> 普元 </b></div>";
            }
        }
        
        function changeYear(){
        	var year = nui.get("inputyear").getValue();
        	tree.setValue("");
        	tree.loadList("", "orgid", "parentorgid");
    		if(year){
				var json = nui.encode({year:year,orgdegree:"'1','2'"});
				nui.ajax({
	    		 	 url: "com.primeton.eos.ame_budget.budgetOrgManager.getBudgetOrgTree.biz.ext",
	    		 	 data: json,
	                 type: 'POST',
	                 cache: false,
	                 contentType: 'text/json',
	                 success: function (o) {
	                 	var data = o.orgs;
	                 	tree.loadList(data, "orgid", "parentorgid");
	                 },
	                 error: function (jqXHR, textStatus, errorThrown) {
	                 	alert(jqXHR.responseText);
	                 }
    			});
    		}else{
    		}
        }
  </script>
</body>
</html>