<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): WangTong
  - Date: 2019-11-27 10:01:20
  - Description:
-->
<head>
<title>坏账核销申请查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%=request.getContextPath()%>/common/nui/nui.js" type="text/javascript"></script>

</style>
</head>
<body style="width: 100%; height: 100%; padding: 0px; margin: 0px;">
	<div class="nui-fix">
		<div class="nui-panel" title="坏账核销申请查询" style="width: 100%;">
			<div id="form1">
				<div class="nui-toolbar"
					style="border-bottom: 0; padding: 0px">
					
					<table align="center" border="0" width="100%" class="form_table">
						<tr>
							<td class="form_label" align="right" >合同编号：</td>
							<td colspan="1" align="left">
								<input name="criteria._expr[0]._value" class="nui-textbox" style="width: 200px;" onenter="onKeyEnter" /> 
								<input class="nui-hidden" name="criteria._expr[0]._property" value="contnum" /> 
								<input class="nui-hidden"name="criteria._expr[0]._op" value="like" /> 
								<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all" />
							</td>
							<td class="form_label" align="right" >收款编号：</td>
							<td colspan="1" align="left">
								<input name="criteria._expr[1]._value" class="nui-textbox" style="width: 200px;" onenter="onKeyEnter" /> 
								<input class="nui-hidden" name="criteria._expr[1]._property" value="gatherno" /> 
								<input class="nui-hidden"name="criteria._expr[1]._op" value="like" /> 
								<input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all" />
							</td>
							<td class="form_label" align="right" >核销金额：</td>
							<td colspan="1" align="left">
								<input class="nui-textbox" name="criteria._expr[2]._min" style="width:75px"/>-<input class="nui-textbox" name="criteria._expr[2]._max" style="width:75px"/>
								<input class="nui-hidden" name="criteria._expr[2]._property" value="cancellmoney" />
								<input class="nui-hidden" name="criteria._expr[2]._op" value="between" /> 
							</td>
							
						</tr>
						<tr>
							<td align="right" style="width: 150px;"><span>受益部门：</span></td>
							<td align="left">
							     <input id="orgid2"  name="criteria._expr[4]._value" style="width:200px;" class="nui-combobox" 
								textField="orgname" valueField="orgseq" dataField="orgs" showNullItem="true" allowInput="true"/>
				            	<input class="nui-hidden" name="criteria._expr[4]._property" value="orgseq"/>
						        <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
						        <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="end"/>
						        <input class="nui-hidden" name="criteria._expr[5]._property" value="orgid"/>
						        <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
						        <input class="nui-hidden" name="criteria._expr[5]._value" id="orgids1"/>
							</td>
							<td class="form_label" align="right" >销售：</td>
							<td colspan="1" align="left">
								<input name="criteria._expr[6]._value" class="nui-textbox" style="width: 200px;" onenter="onKeyEnter" /> 
								<input class="nui-hidden" name="criteria._expr[6]._property" value="salename" /> 
								<input class="nui-hidden"name="criteria._expr[6]._op" value="like" /> 
								<input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all" />
								
						        <input class="nui-hidden" name="criteria._expr[3]._property" value="saleid"/>
						        <input class="nui-hidden" name="criteria._expr[3]._op" value="in"/>
						        <input class="nui-hidden" name="criteria._expr[3]._value" id="saleid"/>
							</td>
						</tr>
						<tr>
							<td align="center" colspan="8">
								<a class="nui-button" id="search" iconCls="icon-search" onclick="search">查找</a> 
								<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- <div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
				<table>
					<tr>
						<td><a class="nui-button" id="export" iconCls="icon-download"
							onclick="exportBillTicket">导出</a></td>
					</tr>
				</table>
			</div> -->
			<div class="nui-fit">
				<div id="datagrid1" frozenStartColumn="0" showPager="true" dataField="badbills" showSummaryRow="true"
					sortMode="client" allowCellWrap="false" class="nui-datagrid" 
					style="width: 100%; height: 340px;" onDrawSummaryCell="onDrawSummaryCell"
					url="com.primeton.mis.contract.cancelBadDebt.cancelBadDebtQuery.biz.ext"
					multiSelect="true" allowSortColumn=true showSummaryRow="true">
					<div property="columns">
						<div field="processinstid" width="80" align="center" headerAlign="center" allowSort="true" renderer="getDetail">操作</div>
						<div field="contnum" width="70" align="center" headerAlign="center" allowSort="true" renderer="detailCont">合同编号</div>
						<div field="custname" width="150" align="left" headerAlign="center" allowSort="true">客户</div>
						<div field="projectname" width="150" align="left" headerAlign="center" allowSort="true">合同名称</div>
						<div field="cancellmoney" width="80" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">核销金额</div>
		        		<div field="cancelldate" width="70" headerAlign="center" align="center" dateFormat="yyyy-MM-dd" allowSort="true">核销日期</div>	
						<div field="gatherno" width="60" align="left" headerAlign="center" allowSort="true" >收款编号</div>
						<div field="applyreason" width="120" align="left" headerAlign="center" allowSort="true">申请原因</div>	
						<div field="salename" width="50" align="center" headerAlign="center" allowSort="true">销售</div>		
						<div field="syqname" width="70" align="left" headerAlign="center" allowSort="true">一级部门</div>	
						<div field="sybname" width="70" align="left" headerAlign="center" allowSort="true">二级部门</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 导出的时候用到的 -->
	<form name="viewlist1" id="viewlist1"
		action="com.primeton.eos.ame_common.ameExportCommon.flow"
		method="post">
		<input type="hidden" name="_eosFlowAction" value="action0"
			filter="false" /> <input type="hidden" name="downloadFile"
			filter="false" /> <input type="hidden" name="fileName" filter="false" />
	</form>

</body>
<script>
	nui.parse();
	
	var grid = nui.get("datagrid1");
	var form = new nui.Form("#form1");
	
	init();
	function init(){
		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    		String userorgid=user.getUserOrgId();
		%>
		//机构权限初始化
		//code:对应功能编码，map：对于机构的查询条件
					
		var json = {"code":"cancelBadDebtsQuery","map":{"property":"status","op":"=","value":"running"}};
		nui.ajax({
			url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
			data:json,
			type:'POST',
			contentType:'text/json',
			success:function(text){
				if(text.orgs){
					if(text.orgs.length==0){
						// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("saleid").setValue('<%=nowuserid %>');
					}
					var isall;
					for(var i=0;i<text.orgs.length;i++){
						if(text.orgs[i].orgid == "1"){
							isall = "1";
							break;
						}
					}
					//如果拥有全公司的权限就取消部门限制
					if(isall == "1"){
					
					}else{
						nui.get("orgids1").setValue(text.orgids);
						nui.get("saleid").setValue('<%=nowuserid %>');
					}
					nui.get("orgid2").setData(text.orgs);
				}else{
					// 没有有权的机构时只能查项目负责人为自己的数据
						nui.get("saleid").setValue('<%=nowuserid %>');
						nui.get("saleid").setReadOnly(true);
				}
				search();
			}
		});
	}
	
	function search() {
		var data = form.getData();
		grid.load(data);
	}
	
	function reset(){
		form.reset();
		grid.load();
	}
	
	function getDetail(e){
        var record = e.record;
    	var processinstid = e.record.processinstid;
    	var aa;
    	var s =" <a  href='javascript:void(0)' onclick='getdetailBadApply(" + processinstid +")' title='点击查看'>明细</a>";
    	if(processinstid){
			s = s+" <a  href='javascript:void(0)' onclick='feeView();' title='点击查看'>流程</a>";
    	}
    	return s;
	}
	    
    function getdetailBadApply(processinstid){
		var executeUrl = "<%= request.getContextPath() %>/contract/cancelBadDebts/cancelBadDebtsLook.jsp?processInstID=" + processinstid+"&type=1";
		window.open(executeUrl);
	} 
	function feeView(){
        var selectRow = grid.getSelected();
        var processInstID=selectRow.processinstid;
		var url = "<%=request.getContextPath() %>/bps/wfclient/task/processinstView.jsp";
		var title = "流程图查看";
		var width=1000;
	    nui.open({
			url: url,
			title: title,
			width: width,
			height: 550,
			onload: function () {
				var iframe = this.getIFrameEl();
				if(iframe.contentWindow.initData) {
					iframe.contentWindow.initData({"processInstID": processInstID});
				}
			},
			ondestroy: function (action){
			}
		});
    }
	//回车触发
	function onKeyEnter(){
		search();
	}
	
	//合同详细信息
    function detailCont(e){
    	return "<a href='javascript:void(0)' onclick='detailCont1("+e.record.contractid+");' title='点击查看合同信息'>" + e.value + "</a>";
    }
    function detailCont1(contractid){
		var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + contractid;
		window.open(executeUrl, "合同查看", "fullscreen=1");
    }

	//导出数据
	function exportBillTicket() {
		if(!confirm("导出坏账信息？")){
				return;
		}
		form.loading("导出中...");
		var data = form.getData();
		var json =  nui.encode(data);
		
		form.loading("操作中，请稍后......");
		nui.ajax({
			url : "com.primeton.mis.contract.cancelBadDebt.exportBadDebt.biz.ext",
			type : "post",
			data : data,
			cache : false,
			contentType : 'text/json',
			success : function(o) {
				form.unmask();
				var filePath = o.downloadFile;
				var fileName = "坏账信息";
				var myDate = new Date();
				var year = myDate.getFullYear();
				var month = myDate.getMonth() + 1;
				var day = myDate.getDate();
				var hours = myDate.getHours();
				var minutes = myDate.getMinutes();
				var seconds = myDate.getSeconds();
				var curDateTime = year;
				if (month > 9) {
					curDateTime = curDateTime + "" + month;
				} else {
					curDateTime = curDateTime + "0" + month;
				}
				if (day > 9) {
					curDateTime = curDateTime + day;
				} else {
					curDateTime = curDateTime + "0" + day;
				}
				if (hours > 9) {
					curDateTime = curDateTime + hours;
				} else {
					curDateTime = curDateTime + "0" + hours;
				}
				if (minutes > 9) {
					curDateTime = curDateTime + minutes;
				} else {
					curDateTime = curDateTime + "0" + minutes;
				}
				if (seconds > 9) {
					curDateTime = curDateTime + seconds;
				} else {
					curDateTime = curDateTime + "0" + seconds;
				}
				fileName = fileName + "_" + curDateTime + ".xls";
				var frm = document.getElementById("viewlist1");
				frm.elements["downloadFile"].value = filePath;
				frm.elements["fileName"].value = fileName;
				frm.submit();
			},
			error : function() {
				alert("error");
			}
		});
	}


	
	//处理合计
	function onDrawSummaryCell(e) {
		if (e.field == "gatherno") {
		        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
		}
		if (e.field == "cancellmoney") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		}
	}
	
	
</script>
</html>