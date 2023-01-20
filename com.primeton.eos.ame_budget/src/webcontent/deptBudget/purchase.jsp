<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>采购tab页面</title>
<%@include file="/common/common.jsp"%>
<h:script src='<%="/common/scripts/eos-web.js"%>' />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<div width="auto">
	<fieldset style="border:solid 1px #aaa;padding:3px;width:1080px;">
    <legend>采购</legend>
    	<div style="width:1080px;">
	        <div style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="lookAllYearPurchase" iconCls="icon-search"  onclick="modifPurchase()" >查看全年采购成本</a>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
        <div id="grid_purchase" class="nui-datagrid" style="width:1080px;height:auto;" dataField="deptPurBudgets"allowAlternating="true"
    	 url="com.primeton.eos.ame_budget.purchase.queryAllPurchaseList.biz.ext" showPager="false" showSummaryRow="true" ondrawsummarycell="doCountSum">
			<div property="columns">
				<div field="dictname" width="120" align="center" headerAlign="center" >分类</div>
				<div field="dictid" visible="false">分类ID</div>
				<div field="editButton" width="55" align="center" headerAlign="center" renderer="editDictItem">编辑</div>
				<div field="month1" width="60" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyPurchase">1月</div>
				<div field="month2" width="60" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyPurchase">2月</div>
				<div field="month3" width="60" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyPurchase">3月</div>
				<div field="month4" width="60" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyPurchase">4月</div>
				<div field="month5" width="60" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyPurchase">5月</div>
				<div field="month6" width="60" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyPurchase">6月</div>
				<div field="month7" width="60" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyPurchase">7月</div>
				<div field="month8" width="60" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyPurchase">8月</div>
				<div field="month9" width="60" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyPurchase">9月</div>
				<div field="month10" width="60" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyPurchase">10月</div>
				<div field="month11" width="60" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyPurchase">11月</div>
				<div field="month12" width="60" align="right" headerAlign="center" numberFormat="n0" summaryType="sum" renderer="modifyPurchase">12月</div>
				<div field="yearMoney" width="80" align="right" headerAlign="center"  numberFormat="n0" summaryType="sum" renderer="modifyPurchase">全年</div>
			</div>
		</div>
    </fieldset>
</div>
	<script type="text/javascript">
    	nui.parse();
    	var grid_purchase = nui.get("grid_purchase");
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
    	
    	if(orgFlag=="1"||orgFlag=="2"){
    		//事业部级的隐藏编辑列
	    	grid_purchase.hideColumn(grid_purchase.getColumn(2));
// 	    	document.getElementById("lookAllYearPurchase").style.display="none";
    	}
    	init();
    	//初始化、重置调用方法
    	function init(){
    		grid_purchase.load({"orgid":orgid,"year":year,"costtype":costtype,"orgname":orgname,"orgFlag":orgFlag});
		}
		function modifPurchase(month, dictid){
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
			var row = grid_purchase.getSelected();
			var dictname = "";
			if(row){
				dictname=row.dictname
			}
			nui.open({
                url: "<%=request.getContextPath() %>/ame_budget/deptBudget/modifyPurchase.jsp",
                title: year+"年度采购月度成本", 
				width: 900,
	            height: 500,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = nui.decode({orgid:orgid,year:year,orgname:orgname,costtype:costtype,month:month,purtype:dictid,dictname:dictname,orgFlag:orgFlag,budstatus:budstatus,costtypename:costtypename});
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
					grid_purchase.reload();
					//父页面的汇总刷新
                    parent.reload();
                }
            });
		}
		function doCountSum(e){        	
            if (e.field == "yearMoney"||e.field == "month1"||e.field == "month2"||e.field == "month3"||e.field == "month4"||e.field == "month5"||e.field == "month6"||e.field == "month7"||e.field == "month8"||e.field == "month9"||e.field == "month10"||e.field == "month11"||e.field == "month12") {
                e.cellHtml = "<div align='right'><b>" + formatNumber(e.cellHtml,'#,##') + "</b></div>";
            }
        }
        //去除全年展示的0元素
		function modifyPurchase(e){
			//如果是非业务单元级的不允许编辑
			if(orgFlag=="1" || orgFlag=="2"){
				return formatNumber(e.value,'#,##');
			}
			if(e.field=="yearMoney"){
				return formatNumber(e.value,'#,##');
			}else{
				//隐藏编辑列引起的调整
				var dictid = '"'+ e.record.dictid +'"';
				if(orgFlag!=3){
					return "<a href='javascript:void(0)' onclick='javascript:modifPurchase(" + e.columnIndex + "," + dictid + ")' title='点击查看'> " + formatNumber(e.value,'#,##') + " </a>"
				}else{
					return "<a href='javascript:void(0)' onclick='javascript:modifPurchase(" + (e.columnIndex-1) + "," + dictid + ")' title='点击查看'> " + formatNumber(e.value,'#,##') + " </a>"
				}
			}
		}
		function editDictItem(e){
			var dictid = '"'+ e.record.dictid +'"';
			return "<input  type='button' align='center' value='编辑' onclick='javascript:modifPurchase(null," + dictid + ")'/>";
		}
  </script>
</body>
</html>