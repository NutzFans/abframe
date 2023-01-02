<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): 朱勇伦
  - Date: 2017-04-20 14:20:26
  - Description:
-->
<head>
	<title>开票信息查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-fix">
		<div class="nui-panel" title="开票信息查询" width="auto">
			<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
				<input class="nui-hidden" name="sortField" value="billid"/>
				<input class="nui-hidden" name="sortOrder" value="desc"/>
				<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
					<table style="width:100%;">
						<tr>
							<td align="right" style="width: 80px;"><span>开票申请人：</span></td>
			            	<td align="left" style="width: 100px;">
							    <input class="nui-textbox" name="criteria._expr[0]._value" onenter="onKeyEnter" style="width: 100px"/>
								<input class="nui-hidden" name="criteria._expr[0]._property" value="appname"/>
								<input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
								<input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
							</td>
							<td align="right" style="width: 80px"><span>开票状态：</span></td>
			            	<td align="left" style="width: 100px;">
			            		<input class="nui-dictcombobox" name="criteria._expr[1]._value" dictTypeId="MIS_BILLSTATUS" 
			            			showNullItem="true"  multiSelect="true" id="status" style="widht: 100px"/>
			            		<input class="nui-hidden" name="criteria._expr[1]._property" value="status"/>
			            		<input class="nui-hidden" name="criteria._expr[1]._op" value="in">
							</td>
							<td align="right" style="width: 120px"><span>开票单位：</span></td>
			            	<td align="left" style="width: 140px;">
			            		<input name="criteria._expr[2]._value" class="nui-textbox" style="width:140px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[2]._property" value="custname"/>
							    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
			            	</td>
			            	<td align="right" style="width: 80px"><span>合同存档编号：</span></td>
			            	<td align="left" style="width: 201px;">
			            		<input name="criteria._expr[3]._value" class="nui-textbox" style="width:100px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[3]._property" value="contnum"/>
							    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
			            	</td>
						</tr>
						<tr>
							<td align="right" style="width: 80px"><span>销售：</span></td>
			            	<td align="left" style="width: 100px;">
							    <input name="criteria._expr[4]._value" class="nui-textbox" style="width:100px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[4]._property" value="salename"/>
							    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
							</td> 
							<td align="right" style="width: 80px"><span>票据类型：</span></td>
			            	<td align="left" style="width: 100px;">
							    <input class="nui-dictcombobox" name="criteria._expr[5].billtype" dictTypeId="BILLTYPE" showNullItem="true" />
							</td>
							<td align="right" style="width: 140px"><span>合同名称（项目）：</span></td>
			            	<td align="left">
			            		<input name="criteria._expr[6]._value" class="nui-textbox" style="width:140px;" onenter="onKeyEnter"/>
							    <input class="nui-hidden" name="criteria._expr[6]._property" value="projectname"/>
							    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
							    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
			            	</td>
			            	<td align="right" style="width: 80px"><span>开票日期：</span></td>
			            	<td align="left">
			            		<input class="nui-datepicker" name="criteria._expr[7]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[7]._max" style="width:100px"/>
						        <input class="nui-hidden" name="criteria._expr[7]._property" value="billdate"/>
						        <input class="nui-hidden" name="criteria._expr[7]._op" value="between"/>
						        <input class="nui-hidden" name="criteria._expr[7]._pattern" value="yyyy-MM-dd"/>
			            	</td>
						</tr>
					    <tr>
					    	<td align="right" style="width: 80px"><span>开票来源：</span></td>
			            	<td align="left" style="width: 100px;">
							    <input class="nui-dictcombobox" name="criteria._expr[8].billtype1" dictTypeId="CS_BILLTYPE" showNullItem="true" style="width: 100px;"/>
							</td>
			    			<td align="center" colspan="16">
		                        <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
		                        <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
		                   </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
		    <div style="width: 100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" id="deleteBtn" iconCls="icon-remove" onclick="remove()">删除</a>
		                        <a class="nui-button" id="exportCurrentExcel" iconCls="icon-download" onclick="exportCurrent">导出明细表</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		        <div id="datagrid1" class="nui-datagrid" style="width: 100%;height: 340px;" showSummaryRow="true" frozenStartColumn="0" frozenEndColumn="4" 
		        	ondrawsummarycell="doCountNowPage" url="com.primeton.eos.ame_income.gatherFcBilling.queryBillLists.biz.ext" 
					dataField="queryBillLists" allowResize="true" sizeList="[10,20,30,50,100]" pageSize="10" allowAlternating="true" multiSelect="false">
				    <div property="columns">
				       	<div type="checkcolumn" name="temp123"></div>
				        <div field="custname" width="150" renderer="onTitleRenderer" headerAlign="center" allowSort="true">开票单位</div>
				        <div field="billdate" width="80" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">开票日期</div>
				        <div field="billappdate" width="80" dateFormat="yyyy-MM-dd" align="center" headerAlign="center" allowSort="true">开票申请日期</div>
				        <div field="contnum" width="90" renderer="onTitle1Renderer" headerAlign="center" allowSort="true">合同存档编号</div>
				        <div field="projectname" width="120" headerAlign="center" allowSort="true">合同名称（项目）</div>
				        <div field="billtype" width="80" renderer="onGenderRenderer" align="center" headerAlign="center" allowSort="true">票据类型</div>
				        <div field="billprodmon" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">开票产品金额</div>
				        <div field="billservmon" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">开票服务金额</div>
				        <div field="billsummon" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">开票总金额</div>
				        <div field="tax" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">税金</div>
				        <div field="u8xse" width="110" dataType="currency" summaryType="sum" align="right" headerAlign="center" allowSort="true">销售额</div>
				        <div field="appname" width="60" headerAlign="center" align="center" allowSort="true">申请人</div>
				        <div field="status" width="85" renderer="onGender2Renderer" align="center" headerAlign="center" allowSort="true">开票状态</div>
				        <div field="billtype1" width="85" renderer="onGender3Renderer" align="center" headerAlign="center" allowSort="true">开票来源</div>
				    </div>
				</div>
		    </div>
			<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
				<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
				<input type="hidden" name="downloadFile" filter="false"/>
				<input type="hidden" name="fileName" filter="false"/>
			</form> 
		</div>
	</div>
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	init();
    	function init(){
		    var json = form.getData();
		    grid.load(json);
		    var isFinance = false;//是否为财务
		    <%
		    UserObject user = (UserObject) session.getAttribute("userObject");
			Map attr = user.getAttributes();
			String userid = user.getUserId();
			DataObject[] roles = (DataObject[]) attr.get("roles");
			Boolean isHaveDeleteAuth = false;
			Boolean isHaveExportAuth = false;//是否为商务
			for(int i=0;i<roles.length;i++){
				if(roles[i].getString("roleid").equals("finance")){
					isHaveDeleteAuth = true;
				}
				if(roles[i].getString("roleid").equals("commerce")){
					isHaveExportAuth = true;
				}
			}
			if(isHaveDeleteAuth == false){
		     %>
				nui.get("deleteBtn").setEnabled(false);
				nui.get("exportCurrentExcel").setEnabled(false);
			
		   <% }
		   if(isHaveExportAuth == true){%>
				nui.get("exportCurrentExcel").setEnabled(true);
		   <% }%>	
		   }
		
		function doCountNowPage(e){        	
	        //客户端汇总计算
	        if (e.field == "billprodmon") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "billservmon") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "billsummon") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "tax") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	        if (e.field == "u8xse") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
	    }
		
		function onGenderRenderer(e) {
        	return nui.getDictText('BILLTYPE',e.value);
	    }
		function onGender1Renderer(e) {
	        return nui.getDictText('CS_BILLTYPE',e.value);
	    }
		function onGender2Renderer(e) {
	        return nui.getDictText('MIS_BILLSTATUS',e.value);
	    }
	    function onGender3Renderer(e) {
	        return nui.getDictText('CS_BILLTYPE',e.value);
	    }
	    function getProdName(e){
	    	return nui.getDictText('CS_PRODNAME',e.value);
	    }
	    function getServName(e){
	    	return nui.getDictText('CS_SERVNAME',e.value);
	    }
	    function onTitleRenderer(e) {
			return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
		}
		function onTitle1Renderer(e) {
			return "<a href='javascript:void(0)' onclick='doView1();' title='点击查看'>" + e.value + "</a>";
		}
		function doView1(){
			var selectRow = grid.getSelected();
			if(!selectRow){
				nui.alert("请选择其中一条合同数据!");
				return;
			}
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
			window.open(executeUrl, "合同查看");
		}
		function doView(){
			var selectRow = grid.getSelected();
			if(!selectRow){
				nui.alert("请选择其中一条开票数据!");
				return;
			}
			var executeUrl = "<%=request.getContextPath() %>/ame_income/gatherFcBilling/billApplyViewNew.jsp?billid=" + selectRow.billid;
			window.open(executeUrl, "开票信息查看");
		}
	    function remove() {       
	    	/* alert("待开发..."); 
	    	return; */    
	        var row = grid.getSelected();
	        var data = {csNewbill: row};
	        var json = nui.encode(data);
	        if (row) {
	        	nui.ajax({
                    url: "com.primeton.eos.ame_income.gatherFcBilling.verificationBill.biz.ext",
                    type: "post",
                    data: json, 
                    cache: false,
                    contentType: 'text/json',
                    success: function (o) {
                    	o = nui.clone(o);
                    	if(o.result == "0"){	//未查询到匹配的发票信息
                    		if (confirm("确定删除选中记录？")) {
				                grid.loading("操作中，请稍后......");
				                nui.ajax({
				                    url: "com.primeton.eos.ame_income.gatherFcBilling.deleteBill.biz.ext",
				                    type: "post",
				                    data: json, 
				                    cache: false,
				                    contentType: 'text/json',
				                    success: function (text) {
				                    	text = nui.clone(text);
				                    	if(text.result == "exception"){
				                    		nui.alert("删除失败！");
				                    	}else{
				                    		nui.alert("删除成功！","系统提示",function(){
					                        	grid.reload();
				                    		});
				                    	}
				                    },
				                    error: function () {
				                    }
				                });
				            }
                    	}else if(o.result == "1"){	//匹配到发票信息
                    		nui.alert("已开出发票，不允许删除！");
                    	}
                        
                    },
                    error: function () {
                    	nui.alert("验证是否有发票失败！");
                    }
                });
	            
	        } else {
	            alert("请选中一条记录");
	        }
	    }
		function search(){
			var json = form.getData();
		    grid.load(json);
		}
		
		function reset(){
			var form = new nui.Form("#form1");
            form.reset();
		    var json = form.getData();
            grid.sortBy("accrueddate","desc");
            grid.load(json);
		}
		
		//enter键触发查询
        function onKeyEnter(e) {
            search();
        }
        
        function exportCurrent(){
        	/* alert("待开发...");
        	return; */
	   		var form = new nui.Form("#form1");
	    	var json = form.getData();
			nui.ajax({
	            url: "com.primeton.eos.ame_income.gatherFcBilling.exportBill.biz.ext",
	            type: "post",
	            data: json,
	            cache: false,
	            contentType: 'text/json',
	            success: function (o) {
	         	nui.unmask();
	            	var filePath = o.downloadFile;
	            	var fileName = "currentBill";
	            	var myDate = new Date();
	            	var year = myDate.getYear();
	            	var month = myDate.getMonth()+1;
	            	var day = myDate.getDate();
	            	var hours = myDate.getHours();
	            	var minutes = myDate.getMinutes();
	            	var seconds = myDate.getSeconds();
	            	var curDateTime = year;
	            	if(month>9){
						curDateTime = curDateTime + "" + month;
						alert(curDateTime);
					}else{
						curDateTime = curDateTime + "0" + month;
						}
	            	if(day>9){
						curDateTime = curDateTime + day;
					}else{
						curDateTime = curDateTime + "0" + day;
						}
					if(hours>9){
						curDateTime = curDateTime + hours;
					}else{
						curDateTime = curDateTime + "0" + hours;
						}
					if(minutes>9){
						curDateTime = curDateTime + minutes;
					}else{
						curDateTime = curDateTime + "0" + minutes;
						}
					if(seconds>9){
						curDateTime = curDateTime + seconds;
					}else{
						curDateTime = curDateTime + "0" + seconds;
						}
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
    
	</script>
</body>
</html>