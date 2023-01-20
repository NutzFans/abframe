<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<!-- 
  - Author(s): LJ
  - Date: 2013-03-03 11:07:52
  - Description:
-->
<%@include file="/nui/common.jsp" %>
<%@include file="/common/common.jsp"%>

<head>
    <title>Pagination 分页表格</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="nui-panel" title="外包支付情况查询" style="width:100%;">
	    <div style="padding-bottom:5px;" id="form1">
	    	<input class="nui-hidden" name="sortField" value="optime"/>
			<input class="nui-hidden" name="sortOrder" value="desc"/>
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
		            	<td align="right"><span>商务确认人：</span></td>
		            	<td align="left">
							<input class="nui-textbox" name="criteria._expr[0]._value"/>
							<input class="nui-hidden" name="criteria._expr[0]._property" value="username"/>
							<input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td>
						<td align="right"><span>商务合同号：</span></td>
		            	<td align="left">
							<input class="nui-textbox" name="criteria._expr[1]._value"/>
							<input class="nui-hidden" name="criteria._expr[1]._property" value="contnum"/>
							<input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td>
						<td align="right"><span>供应商：</span></td>
		            	<td align="left">
							<input class="nui-textbox" name="criteria._expr[2]._value"/>
							<input class="nui-hidden" name="criteria._expr[2]._property" value="custname"/>
							<input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
		            	<td align="right"><span>销售姓名：</span></td>
		            	<td align="left">
							<input class="nui-textbox" name="criteria._expr[3]._value" id="salename"/>
							<input class="nui-hidden" name="criteria._expr[3]._property" value="salename"/>
							<input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
						</td>
		            	<td align="right"><span>商务确认日期：</span></td>
		            	<td align="left">
		            		<input class="nui-datepicker" name="criteria._expr[4]._min" style="width:100px;"/>-<input class="nui-datepicker" name="criteria._expr[4]._max" style="width:100px;"/>
					        <input class="nui-hidden" name="criteria._expr[4]._property" value="optime"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[4]._pattern" value="yyyy-MM-dd"/>
							<input class="nui-hidden" name="criteria._expr[5]._value" id="salesname"/>
							<input class="nui-hidden" name="criteria._expr[5]._property" value="salename"/>
							<input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
					    </td>
					    <td align="right"><span>报销单号：</span></td>
		            	<td align="left">
							<input class="nui-textbox" name="criteria._expr[6]._value" id="expno"/>
							<input class="nui-hidden" name="criteria._expr[6]._property" value="expno"/>        		
					    </td>
					</tr>
					<tr>
						<td align="right"><span>采购合同编号：</span></td>
		            	<td align="left">
							<input class="nui-textbox" name="criteria._expr[7]._value" id="purcontno"/>
							<input class="nui-hidden" name="criteria._expr[7]._property" value="purcontno"/>        		
					    </td>
					    <td align="right"><span>打款日期：</span></td>
		            	<td align="left">
		            		<input class="nui-datepicker" name="criteria._expr[8]._min" style="width:100px;"/>-<input class="nui-datepicker" name="criteria._expr[8]._max" style="width:100px;"/>
					        <input class="nui-hidden" name="criteria._expr[8]._property" value="paydate"/>
					        <input class="nui-hidden" name="criteria._expr[8]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[8]._pattern" value="yyyy-MM-dd"/>
					    </td>
		            	<td align="right"><span>财务审核人：</span></td>
		            	<td align="left">
							<input class="nui-textbox" name="criteria._expr[9]._value"/>
							<input class="nui-hidden" name="criteria._expr[9]._property" value="cwusername"/>
							<input class="nui-hidden" name="criteria._expr[9]._op" value="like"/>
							<input class="nui-hidden" name="criteria._expr[9]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="10">
							<a class="nui-button" iconCls="icon-search" onclick="search()">查找</a>
							<a class="nui-button" iconCls="icon-reload" onclick="reset">重置</a>
							<a class="nui-button" iconCls="icon-download" onclick="exportGather()">导出到Excel</a>
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
	                        <a class="nui-button" iconCls="icon-add" id="addBtn" onclick="add()">增加</a>
	                        <a class="nui-button" iconCls="icon-edit" id="editBtn" onclick="edit()">编辑</a>
	                        <a class="nui-button" iconCls="icon-remove" id="deleteBtn" onclick="remove()">删除</a>
	                    </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
		<div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" 
		    url="com.primeton.mis.contract.thirdpay.queryThirdpay.biz.ext"  idField="id" allowResize="true"
		    sizeList="[10,20,30,50,100,200,500,1000,10000]" pageSize="10" allowAlternating="true" multiSelect="false" 
		    showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell">
		    <div property="columns">
		       	<div type="checkcolumn" name="temp123"></div>
		        <div field="contnum" width="8%" renderer="onTitleRenderer" headerAlign="center" allowSort="true">商务合同号</div>
		        <div field="custname" width="17%" headerAlign="center" allowSort="true">供应商</div>
		        <div field="salename" width="6%" align="center" headerAlign="center" allowSort="true">销售姓名</div>
		        <div field="payedmon" width="10%" dataType="currency" currencyUnit="￥" align="right" headerAlign="center" allowSort="true" summaryType="sum">本次支付采购1</div>
		        <div name="payedomon" field="payedomon" width="10%" dataType="currency" currencyUnit="￥" align="right" headerAlign="center" allowSort="true" summaryType="sum">本次支付采购2</div>
		        <div field="username" width="7%" headerAlign="center" allowSort="true">商务确认人</div>
		        <div field="optime" width="9%" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">商务确认日期</div>
		        <div field="purcontno" width="10%" headerAlign="center" allowSort="true" renderer="getDetail">采购合同编号</div>
		        <div field="expno" width="10%" headerAlign="center" allowSort="true" renderer="getExpReiList">报销单号</div>
		        <div field="cwusername" width="7%" headerAlign="center" allowSort="true">财务审核人</div>
		        <div field="paydate" width="9%" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">打款日期</div>
		    </div>
		</div>  
	</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form>
<script type="text/javascript">
	nui.parse();
	var form=new nui.Form("#form1");
	var grid = nui.get("datagrid1");
	init();
	function init(){
		var isCommerce = false;
		var isFinance = false;
		var isOrgLeader = false;//是否是销售部门的主管
		<l:iterate id="roles" property="userObject/attributes/roles" scope="session">
			var roleid = "<b:write iterateId='roles' property='roleid'/>";
			if(roleid == "commerce"){
				isCommerce = true;
			}
			if(roleid == "finance"){
				isFinance = true;
			}
		</l:iterate>
		if(isFinance == false && isCommerce == false){//非商务、非财务，只能看自己的分包或者自己部门的分包
			nui.get("addBtn").setEnabled(false);
			nui.get("deleteBtn").setEnabled(false);
			grid.hideColumn("temp123");
			grid.hideColumn("payedomon");
			var empid = "<b:write property='userObject/attributes/empid' scope='session'/>";
			var data = {empid:empid};
		    var json = nui.encode(data);
		    var salesname = "";
			nui.ajax({
		        url: "com.primeton.mis.contract.contract.getSaleLeadersAllSubSale.biz.ext",
		        type: "post",
		        data: json, 
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		            if(o.isorgleader == "1"){
		            	isOrgLeader = true;
		            	salesname = o.salesname;
						if(isOrgLeader == true){//部门经理，可以看本部门的
							nui.get("salesname").setValue(salesname);
		                	var form=new nui.Form("#form1");
							var data=form.getData();
							grid.load(data);
						}
		            }else{		            	
						var username = "<b:write property='userObject/userName' scope='session'/>";
						nui.get("salename").setValue(username);
						nui.get("salename").setEnabled(false);
	                	var form=new nui.Form("#form1");
						var data=form.getData();
						grid.load(data);
		            }
		        },
		        error: function () {
		        }
		    });
		}else{
			grid.load();
			grid.sortBy("optime", "desc");
		}
	}
	function search() {
		var form=new nui.Form("#form1");
    	var data=form.getData();
		grid.load(data);
	}
	function reset(){
		form.reset();
		grid.load();
	}
	function onGenderRenderer(e) {
        return nui.getDictText('BILLTYPE',e.value);
    }
	function onGender1Renderer(e) {
        return nui.getDictText('CS_BILLTYPE',e.value);
    }
    function onTitleRenderer(e) {
		return "<a href='javascript:void(0)' onclick='doView();' title='点击查看服务费支付信息'>" + e.value + "</a>";
	}
	function doView(){
		var selectRow = grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条服务费支付数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/contract/thirdpay/thirdpayView.jsp?contsaleservid=" + selectRow.contsaleservid;
		window.open(executeUrl, "服务费支付信息查看", "fullscreen=1");
	}
	function doView1(){
		var selectRow = grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条开票数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/contract/bill/billApplyView.jsp?billid=" + selectRow.billid;
		window.open(executeUrl, "开票信息查看", "fullscreen=1");
	}
    function remove() {            
        var row = grid.getSelected();
        var data = {csContractsalePay: row};
        var json = nui.encode(data);
        if (row) {
            nui.confirm("确定删除选中记录？","操作提示",function(action){
            	if(action == "ok"){
            		grid.loading("操作中，请稍后......");
	                nui.ajax({
	                    url: "com.primeton.mis.contract.thirdpay.deleteThirdpay.biz.ext",
	                    type: "post",
	                    data: json, 
	                    cache: false,
	                    contentType: 'text/json',
	                    success: function (text) {
	                    	if(text.result == null){
	                    		nui.alert("删除成功！","操作提示",function (){
	                    			grid.reload();
	                    		});
	                    	}else{
	                    		nui.alert("删除失败！");
	                    	}
	                        grid.unmask();
	                    },
	                    error: function () {
	                    }
	                });
            	}else{
            		return;
            	}
            });
        } else {
            alert("请选中一条记录");
        }
    }
    function add() {
        nui.open({
            url: "<%=request.getContextPath() %>/contract/thirdpay/thirdpayConfirm.jsp",
            title: "财务新增服务费支付信息", width: 1000, height: 500,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "new"};
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
            	if(action == "ok"){
	                grid.reload();
            	}
            }
        });
    }
    function edit() {
    	var rows = grid.getSelecteds();
    	if (rows.length > 1) {
    		nui.alert("只能选中一条记录进行编辑");
    	}else{
            var row = grid.getSelected();
            if (row) {
                nui.open({
                    url: "<%=request.getContextPath() %>/contract/thirdpay/thirdpayConfirmEdit.jsp",
                    title: "财务编辑服务费支付信息", width: 1000, height: 500,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = { action: "edit", contsaleservid: row.contsaleservid };
                        iframe.contentWindow.SetData(data);
                    },
                    ondestroy: function (action) {
                    	if(action == "ok"){
                    		grid.reload();
                    	}
                    }
                });
                
            } else {
                alert("请选中一条记录");
            }
        }
    }
    function exportGather(){
		var form=new nui.Form("#form1");
    	var data=form.getData();
    	var json = data;
    	/* json.sortField = "optime";
    	json.sortOrder = "desc"; */
    	grid.loading("操作中，请稍后......");
		nui.ajax({
	        url: "com.primeton.mis.contract.thirdpay.exportThirdpay.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		grid.unmask ( );
	        	var filePath = o.downloadFile;
	        	var fileName = "thirdPay";
	        	var myDate = new Date();
	        	var year = myDate.getFullYear();
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
	            //window.open("com.primeton.mis.contract.exportGather.flow?downloadFile="+filePath+"&fileName=gather.xls");
	        },
	        error: function () {
	        	alert("error");
	        }
	    });
    }
    
    //采购合同编号链接
    function getDetail(e){
    	if(e.value)
    	return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
    }
    function checkDetail(){
 		var selectRow = grid.getSelected();
		var executeUrl = "/default/ame_pur/PurContract/DetailPurContract.jsp?id=" + selectRow.purcontid;
	    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
		window.open(executeUrl, "合同详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
    }
    
    function onDrawSummaryCell(e) {
        var result = e.result;
        var grid = e.sender;
        if (e.field == "payedmon") {
        	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
        }
        if (e.field == "payedomon") {
        	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
        }
    }
    function getExpReiList(e){
	    if(e.row.reiid){
	    		return "<a href='javascript:void(0)' onclick='checkExpNo("+ e.row.reiid +");' title='点击查看'>" + e.value + "</a>";
	    }
	}
    function checkExpNo(reiid){
		var executeUrl = "/default/ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=" + reiid;
		window.open(executeUrl);
	}
</script>
</body>
</html>