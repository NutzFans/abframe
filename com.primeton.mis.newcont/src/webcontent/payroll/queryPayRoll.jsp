<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2018-04-09 18:32:23
  - Description:
-->
<head>
<title>薪资福利查询</title>
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
	<div class="nui-panel" title="薪资福利查询" style="width:100%;">
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table align="center" border="0" width="100%" class="form_table">
		    	    <tr>
		    	    	<td class="form_label" align="right">公司：</td>
			          	<td colspan="1">
				           	<input class="nui-dictcombobox" name="criteria._expr[0]._value" dictTypeId="company"  shownullItem="true" style="width: 150px;"/>
		            		<input class="nui-hidden" name="criteria._expr[0]._property" value="company"/>
		            		<input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
			          	</td>
			          	<td class="form_label" align="right">部门：</td>
		         	 	<td colspan="1">
				            <input name="criteria._expr[1]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="orgname"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
			          	</td>
			          	<td class = "form_label" align="right">成本类型：</td>
				      	<td colspan="1">
						 	<input class="nui-dictcombobox" name="criteria._expr[2]._value" dictTypeId="AME_U8_SUBJECT"  shownullItem="true" multiSelect="true"  style="width:150px"/>
						 	<input class="nui-hidden" name="criteria._expr[2]._property" value="costtype"/>
						 	<input class="nui-hidden" name="criteria._expr[2]._op" value="in"/>
					  	</td>
					  	<td class = "form_label" align="right">是否高管：</td>
				      	<td colspan="1">
						 	<input class="nui-dictcombobox" name="criteria._expr[3]._value" dictTypeId="MIS_YN"  shownullItem="true" style="width:150px"/>
						 	<input class="nui-hidden" name="criteria._expr[3]._property" value="issenior"/>
					        <input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
					  	</td>
		      		</tr>
			        <tr>
			          	<td class="form_label" align="right">年：</td>
		         	 	<td colspan="1">
				            <input name="criteria._expr[5]._value" valueField="dictid" textField="dictname" class="nui-combobox" shownullItem="true" id="year" style="width:150px;" onenter="onKeyEnter"/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="year"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="="/>
			          	</td>
			          	<td class="form_label" align="right">月：</td>
		         	 	<td colspan="1">
				            <input name="criteria._expr[6]._value" valueField="dictid" textField="dictname" class="nui-combobox" shownullItem="true" id="month" style="width:150px;" onenter="onKeyEnter"/>
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="month"/>
						    <input class="nui-hidden" name="criteria._expr[6]._op" value="="/>
			          	</td>
			          	<td class="form_label" align="right">状态：</td>
			            <td  align="left">
				            <input class="nui-dictcombobox" name="criteria._expr[4]._value" id="status" dictTypeId="AME_PAYROLLSTATUS"  shownullItem="true" style="width:150px"/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="status" />
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="="/>
			          	</td>
			          	<td align="right">费用类型:</td>
						<td align="left">
					        <input id="exptypeid"  name="criteria._expr[7]._value" style="width:200px;" class="nui-treeselect" 
							url="com.primeton.ame.ledger.equivalent.querySalaryfeetype.biz.ext" textField="feetypename" valueField="feetypecode" 
							parentField="parentfeetypeid" dataField="feetypes" showTreeIcon="true" valueFromSelect="true"
							showNullItem="true" multiSelect="true" expandOnLoad="true"/>
			            	<input class="nui-hidden" name="criteria._expr[7]._property" value="expFeetype.feetypecode"/>
					        <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
						</td>
			          	
				    </tr>
	  			</table>
	  			<table style="width:100%;" id = "toolbars1">
			    	<tr>
			            <td style="width:20%;" align="center">
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
	            	<tr>
	                    <td style="width:100%;">
	                        <a class="nui-button" onclick="importAmePayroll" iconCls="icon-upload" id="importAmePayroll">导入Excel</a>
	                    	<a class="nui-button" onclick="updateAmePayroll" iconCls="icon-edit" id="updateAmePayroll">编辑</a>
							<a class="nui-button" iconCls="icon-ok" onclick="showwin" id="bt2">确认</a>
	                    </td>
	                </tr>
	            </table>           
	        </div>
	        <div id="datagrid1" dataField="amePayrolls"  frozenStartColumn="0" frozenEndColumn="7"  class="nui-datagrid" style="width:100%;height:auto;"
		    	url="com.primeton.mis.newcont.payroll.queryPayRoll.biz.ext"  allowResize="true"
		    	sizeList="[10,20,30,50,100,500,1000]" pageSize="15" allowAlternating="true" multiSelect="true"
		    	showSummaryRow="true"  ondrawsummarycell="onDrawSummaryCell" >
			    <div property="columns">
			    	<div type="checkcolumn"></div>
			        <div field="company" renderer="dictCompany" width="80" headerAlign="center" allowSort="true" align="center">公司</div>
			        <div field="costtype" renderer="dictCosttype" width="80" headerAlign="center" allowSort="true" align="center">成本类型</div>
			        <div field="issenior" width="80" renderer="dictIssenior"  headerAlign="center" allowSort="true" align="center">是否高管</div>
			        <div field="orgname" width="100" headerAlign="center" allowSort="true" align="center">部门</div>
			        <div field="year" width="60" headerAlign="center" allowSort="true" align="center">年份</div>
			        <div field="month" width="40" headerAlign="center" allowSort="true" align="center">月份</div>
			        <div field="status" width="80" renderer="dictStatus"  headerAlign="center" allowSort="true" align="center">状态</div>
			        <div field="expFeetype.feetypename" width="80" headerAlign="center" allowSort="true" align="center">费用类型</div>
			        <div field="basicpay" width="60" dataType="currency" headerAlign="center" allowSort="true" align="right" summaryType="sum">金额/人数</div>
			        <div field="createdate" width="90" headerAlign="center" allowSort="true" align="center">创建日期</div>
			        <div field="confirmdate" width="90" headerAlign="center" allowSort="true" align="center">财务确认日期</div>
			    </div>
			</div>
		</div>	
	</div>
</div>
<div id="win1" class="nui-window" title="财务确认" style="width:300px;height:150px;" 
    showMaxButton="true" showCollapseButton="true" showShadow="true"
    showToolbar="false" showFooter="true" showModal="false" allowResize="true" allowDrag="true">
	<fieldset id="importPayroll">
		<legend>财务确认</legend>
		<form id="form2" class="" target="hidden_frame" method="post" enctype="multipart/form-data">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td class = "form_label" align="right" nowrap="nowrap">确认日期：</td>
						<td>
		            		<input class="nui-datepicker" id="confirmdate"/>
	            		</td>
					</tr>
				</table>
			</div>
		</form>
		<div style="text-align:center;padding:10px;" class="nui-toolbar">
			<a class="nui-button" onclick="surefileData()" style="width:60px;margin-right:20px;" id="sureButton">提交</a>
			<a class="nui-button" onclick="onCancel()" style="width:60px;margin-right:20px;">取消</a>  
		</div>
	</fieldset>
</div>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	
	var years = [{"dictname":"2018","dictid":"2018"},{"dictname":"2019","dictid":"2019"},{"dictname":"2020","dictid":"2020"},{"dictname":"2021","dictid":"2021"},{"dictname":"2022","dictid":"2022"}];
	var months = [{"dictname":"1","dictid":"1"},{"dictname":"2","dictid":"2"},{"dictname":"3","dictid":"3"},{"dictname":"4","dictid":"4"},{"dictname":"5","dictid":"5"},{"dictname":"6","dictid":"6"},{"dictname":"7","dictid":"7"},{"dictname":"8","dictid":"8"},{"dictname":"9","dictid":"9"},{"dictname":"10","dictid":"10"},{"dictname":"11","dictid":"11"},{"dictname":"12","dictid":"12"}];
	nui.get("year").setData(years);
	nui.get("month").setData(months);
	init();
	function init(){
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
		grid.sortBy("createdate", "desc");
	}
	
	function search(){
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
		grid.sortBy("createdate", "desc");
	}
	
	function onKeyEnter(){
		search();
	}
	
	/**
	 * 编辑薪资福利明细
	 */
	function updateAmePayroll(){
		var row = grid.getSelected();
    	if (row) {
    		if(row.status=="1"){
    			nui.alert("财务已确认的数据不可以修改")
    			return;
    		}
			nui.open({
	            url: "<%=request.getContextPath() %>/newcont/payroll/editPayroll.jsp",
	            title: "编辑薪酬福利明细", 
	            width: 1000, 
	            height: 400,
	            onload: function () {
	                var iframe = this.getIFrameEl();
	                var data = {action: "edit", payrollid: row.payrollid };
	                iframe.contentWindow.SetData(data);
	            },
	            ondestroy: function (action) {
	            	if(action=="ok"){
	            		grid.reload();
	            	}
	            }
	        });
	    }else{
	    	nui.alert("请选中一条记录","提示");
	    }
	}
	
	/**
	 *批量导入薪资福利
	 */
	function importAmePayroll(){
		nui.open({
            url: "<%=request.getContextPath() %>/newcont/payroll/importPayroll.jsp",
            title: "薪资福利明细导入", 
			width: 700,
            height: 210,
            allowDrag:true,
            ondestroy: function (action) {
            	if(action=="ok"){
            		grid.reload();
            	}
            }
        });
	}
	
	//确认
	function showwin(){
		if(nui.get("year").getValue() == ""){
      		alert("年份不能为空！");
      		return;
	    }
	    if(nui.get("month").getValue() == ""){
      		alert("月份不能为空！");
      		return;
	    }
	    if(nui.get("status").getValue() == ""){
      		alert("状态不能为空！");
      		return;
	    }
	    if(nui.get("status").getValue() !== "0"){
      		alert("状态必须为新增！");
      		return;
	    }
	    var win = nui.get("win1");
        win.showAtPos("center", "middle");
	}
	
	function surefileData(){
		var confirmdate = nui.get("confirmdate").getValue();
	    var data = form.getData();
		var json =  data;
		json.confirmdate = confirmdate;
	    nui.ajax({
			url: "com.primeton.mis.newcont.payroll.surePayrollData.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		var total = o.total;
	     		nui.alert("确认成功！此次共确认" + total + "条数据!");
	     		onCancel();
	     		var form = new nui.Form("#form1");
				var data = form.getData();
				grid.load(data);
	        },
	        error: function () {
	        	alert("error");
	        }
		});
		
	}
	
	//关闭框
	function onCancel() {//关闭清空编辑框内已填写的数据
		nui.get("confirmdate").setValue(null);
        var win = nui.get("win1");
        win.hide();
    }
	
	function dictCompany(e){
		return nui.getDictText('company',e.value);
	}
	function dictCosttype(e){
		return nui.getDictText('AME_U8_SUBJECT',e.value);
	}
	function dictIssenior(e){
		return nui.getDictText('MIS_YN',e.value);
	}
	function dictStatus(e){
		return nui.getDictText('AME_PAYROLLSTATUS',e.value);
	}
	 
	function onDrawSummaryCell(e) {
		var result = e.result;
	    var grid = e.sender;
	    if (e.field == "status") {
	        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
	    }
	    if (e.field == "basicpay") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "postallowance") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "replacement") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "projectsub") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "birthallow") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "overbonus") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "subsidy") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "severance") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "paysum") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "mealallow") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "otherpay") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "comppension") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "compmedical") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "compunemploy") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "compinjury") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "compbear") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "compprovfund") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "compwealsum") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "compcostsum") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "perpension") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "permedical") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "perunemploy") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "perprovfund") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "perwealsum") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "pretaxpay") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "perincometax") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "pcf") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "cutpay") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "paynum") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	    if (e.field == "activenum") {
	    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
	    }
	}
</script>
</body>
</html>