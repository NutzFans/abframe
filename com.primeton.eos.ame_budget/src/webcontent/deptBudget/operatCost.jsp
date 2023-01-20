<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>运营费用tab页面</title>
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<fieldset style="border:solid 1px #aaa;padding:3px;width:1080px;">
    <legend>运营费用</legend>
    	<div style="width:1080px;">
	        <div style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="lookAllYearOperatCost" iconCls="icon-search"  onclick="modifOperatCost()" >查看全年运营成本</a>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
        <div id="grid_operatCost" class="nui-datagrid" style="width:1080px;height:auto;" dataField="deptOperBudgets" allowAlternating="true"
    	 url="com.primeton.eos.ame_budget.operatCost.queryAllOperatCostList.biz.ext" showPager="false" showSummaryRow="true" ondrawsummarycell="doCountSum">
			<div property="columns">
				<div field="dictname" width="128" align="left" headerAlign="center" >分类</div>
				<div field="editButton" width="55" align="center" headerAlign="center" renderer="editDictItem">编辑</div>
				<div field="month1" width="65" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyOperatCost">1月</div>
				<div field="month2" width="65" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyOperatCost">2月</div>
				<div field="month3" width="65" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyOperatCost">3月</div>
				<div field="month4" width="65" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyOperatCost">4月</div>
				<div field="month5" width="65" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyOperatCost">5月</div>
				<div field="month6" width="65" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyOperatCost">6月</div>
				<div field="month7" width="65" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyOperatCost">7月</div>
				<div field="month8" width="65" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyOperatCost">8月</div>
				<div field="month9" width="65" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyOperatCost">9月</div>
				<div field="month10" width="65" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyOperatCost">10月</div>
				<div field="month11" width="65" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyOperatCost">11月</div>
				<div field="month12" width="65" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyOperatCost">12月</div>
				<div field="yearMoney" width="75" align="right" headerAlign="center"  numberFormat="n0" summaryType="sum" renderer="modifyOperatCost">全年</div>
			</div>
		</div>
    </fieldset>
	<script type="text/javascript">
    	nui.parse();
    	var grid_operatCost = nui.get("grid_operatCost");
    	//事业部（或普元或业务单元）
    	var orgid = '<%=request.getParameter("orgid") %>';
    	//事业部名称
    	var orgname = '<%=request.getParameter("orgname") %>';
    	//年份
    	var year = '<%=request.getParameter("year") %>';
    	//costtype服务为1，
    	var costtype = '<%=request.getParameter("costtype") %>';
    	var costtypename = '<%=request.getParameter("costtypename") %>';
    	//初始化数据事业部查看权限（业务单元、或者事业部数据）
    	var orgFlag = '<%=request.getParameter("orgFlag") %>';
    	if(orgFlag!=3){
    		//非业务单元级的隐藏编辑列
	    	grid_operatCost.hideColumn(grid_operatCost.getColumn(1));
//     		document.getElementById("lookAllYearOperatCost").style.display="none";
    	}
    	init();
    	//初始化、重置调用方法
    	function init(){
    		grid_operatCost.load({"orgid":orgid,"year":year,"costtype":costtype,"orgname":orgname,"orgFlag":orgFlag});
		}
		function modifOperatCost(month,dictid){
			var budstatus = "";
			//锁定解锁
			nui.ajax({
                url: "com.primeton.eos.ame_budget.common.lockOrUnlock.biz.ext",
                data: {year:year},
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	budstatus = text.budstatus;//1锁定、2解锁
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
			var row = grid_operatCost.getSelected();
			var dictname = "";
			if(row){
				dictname=row.dictname
			}
			nui.open({
                url: "<%=request.getContextPath() %>/ame_budget/deptBudget/modifyOperatCost.jsp",
                title: year+"年度运营费用月度成本", 
				width: 900,
	            height: 500,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = nui.decode({orgid:orgid,year:year,orgname:orgname,costtype:costtype,month:month,feetype:dictid,dictname:dictname,"orgFlag":orgFlag,budstatus:budstatus,costtypename:costtypename});
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
					grid_operatCost.reload();
					//父页面的汇总刷新
                    parent.reload();
                }
            });
		}
		function detailOperatCost(month,dictid){
			//锁定解锁
			nui.ajax({
                url: "com.primeton.eos.ame_budget.common.lockOrUnlock.biz.ext",
                data: {year:year},
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	budstatus = text.budstatus;//1锁定、2解锁
                	if(text.budstatus==1){
                		alert("当前处于锁定状态，不能编辑！");
                		return;
                	}
					var row = grid_operatCost.getSelected();
					var dictname = "";
					if(row){
						dictname=row.dictname;
					}
					nui.open({
		                url: "<%=request.getContextPath() %>/ame_budget/deptBudget/detailOperatCost.jsp",
		                title: year + "年"+month+"月-" + orgname + "-运营费用-"+dictname+"费用", 
						width: 380,
			            height: 143,
		                onload: function () {
		                    var iframe = this.getIFrameEl();
		                    var data = {orgid:orgid,year:year,costtype:costtype,month:month,feetype:dictid,orgname:orgname,costtypename:costtypename};
		                    iframe.contentWindow.SetData(data);
		                },
		                ondestroy: function (action) {
							grid_operatCost.reload();
							//父页面的汇总刷新
		                    parent.reload();
		                }
		            });
             },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
		}
		function doCountSum(e){
            if (e.field == "yearMoney"||e.field == "month1"||e.field == "month2"||e.field == "month3"||e.field == "month4"||e.field == "month5"||e.field == "month6"||e.field == "month7"||e.field == "month8"||e.field == "month9"||e.field == "month10"||e.field == "month11"||e.field == "month12") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
        }
        //去除全年展示的0元素
		function modifyOperatCost(e){
			//如果是公司级和事业部级的不允许编辑
			if(orgFlag=="1" || orgFlag=="2"){
				return formatNumber(e.value,'#,##');
			}
			if(e.field=="yearMoney"){
				return formatNumber(e.value,'#,##');
			}else{
				if(orgFlag!=3){
					return "<a href='javascript:void(0)' onclick='javascript:detailOperatCost(" + e.columnIndex + "," + e.record.dictid + ")' title='点击查看'> " + formatNumber(e.value,'#,##') + " </a>"
				}else{
					return "<a href='javascript:void(0)' onclick='javascript:detailOperatCost(" + (e.columnIndex-1) + "," + e.record.dictid + ")' title='点击查看'> " + formatNumber(e.value,'#,##') + " </a>"
				}
			}
		}
		function editDictItem(e){
			if(e.record.dictid=='99'){//公司福利分摊(sql手动拼上去的)
				return "<input  type='button' align='center' value='计算' onclick='javascript:calgsflMoney()'/>";
			}
			return "<input  type='button' align='center' value='编辑' onclick='javascript:modifOperatCost(null," + e.record.dictid + ")'/>";
		}
		function calgsflMoney(){
			grid_operatCost.loading("计算中...");
			nui.ajax({
                url: "com.primeton.eos.ame_budget.common.lockOrUnlock.biz.ext",
                data: {year:year},
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	budstatus = text.budstatus;//1锁定、2解锁
                	if(text.budstatus==1){
                		alert("当前处于锁定状态，不能计算！");
                		grid_operatCost.unmask();
                		return;
                	}
                	if(year==null||orgid==null||costtype==null){
						alert("计算失败，请联系信息技术部！");
						grid_operatCost.unmask();
					}
					nui.ajax({
		                url: "com.primeton.eos.ame_budget.operatCost.calgsflMoney.biz.ext",
		                data: {year:year,orgid:orgid,costtype:costtype,costtypename:costtypename,orgname:orgname},
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                	grid_operatCost.unmask();
		                	grid_operatCost.reload();
		                	 parent.reload();
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
		}
  </script>
</body>
</html>