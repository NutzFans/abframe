<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2018-07-20 10:58:04
  - Description:
-->
<head>
<title>查询保函保证金</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-panel" title="合同保函保证金管理" width="auto">
		<div style="width:100%;height:110;padding:0px;margin:0px;"id="csContBackDepForm">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width: 50px;"><span>合同编号：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[1]._value" class="nui-textbox" onenter="onKeyEnter" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="contnum"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td>
						<td align="right" style="width: 50px;"><span>合同号：</span></td>
						<td align="left">
							<input name="criteria._expr[3]._value" class="nui-textbox" onenter="onKeyEnter" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="contid"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
						</td>
						<td align="right" style="width: 180px;"><span>保函保证金开具/打款日期：</span></td>
						<td align="left">
						    <input class="nui-datepicker" name="criteria._expr[6]._min" style="width:98px;" allowInput="true"/>
						     -
						    <input class="nui-datepicker" name="criteria._expr[6]._max" style="width:98px;" allowInput="true"/>
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="paydate"/>
						    <input class="nui-hidden" name="criteria._expr[6]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[6]._pattern" value="yyyy-MM-dd"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 120px;"><span>签署单位：</span></td>
						<td align="left">
							<input name="criteria._expr[2]._value" class="nui-textbox" onenter="onKeyEnter" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="custname"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
						<td align="right" style="width: 120px;"><span>保函保证金状态：</span></td>
						<td align="left">
							<input class="nui-dictcombobox" name="criteria._expr[5]._value" id="status" style="width:150px;" dictTypeId="CS_BACK_DEP" showNullItem="true" multiSelect="true" />
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="status"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="in"/>
						</td>
						<td align="right" style="width: 120px;"><span>保函保证金到期/预计退还日期：</span></td>
						<td align="left">
						    <input class="nui-datepicker" name="criteria._expr[4]._min" style="width:98px;" allowInput="true"/>
						     -
						    <input class="nui-datepicker" name="criteria._expr[4]._max" style="width:98px;" allowInput="true"/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="predredate"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[4]._pattern" value="yyyy-MM-dd"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width: 120px;"><span>合同名称：</span></td>
						<td align="left">
							<input name="criteria._expr[10]._value" class="nui-textbox" onenter="onKeyEnter" style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[10]._property" value="projectname"/>
						    <input class="nui-hidden" name="criteria._expr[10]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[10]._likeRule" value="all"/>
						</td>
						<td align="right" style="width: 120px;"><span>保函保证金类型：</span></td>
						<td align="left">
							<input class="nui-dictcombobox" name="criteria._expr[8]._value" id="status" style="width:150px;" dictTypeId="CS_BACKDEP_TYPE" showNullItem="true" multiSelect="true" />
						    <input class="nui-hidden" name="criteria._expr[8]._property" value="type"/>
						    <input class="nui-hidden" name="criteria._expr[8]._op" value="in"/>
						</td>
						<td align="right" style="width: 120px;"><span>保证金实际退还日期：</span></td>
		            	<td align="left" >
					        <input class="nui-datepicker" name="criteria._expr[7]._min"  style="width:98px"/>
					         -
					        <input class="nui-datepicker" name="criteria._expr[7]._max" style="width:98px"/>
					        <input class="nui-hidden" name="criteria._expr[7]._property" value="practredate"/>
						    <input class="nui-hidden" name="criteria._expr[7]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[7]._pattern" value="yyyy-MM-dd"/>
						</td>
					</tr>
					<tr>
		    			<td align="center" colspan="15">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
                       </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
	    <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
            	<tr>
                    <td style="width:20%;">
                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">新增</a>
                        <a class="nui-button" id="addBtn" iconCls="icon-edit" onclick="addOrEdit()">编辑</a>
				        <a class="nui-button" id="exportCsContBack" iconCls="icon-download" onclick="exportCsContBack()">导出</a>
                    </td>
                </tr>
             </table>           
        </div>
	    <div id="csContBackDepGrid" class="nui-datagrid" style="width:100%;height:350px;" allowResize="true" dataField="csContBackDeps" showSummaryRow="true" ondrawsummarycell="drawCsBackdepSum"
	    	url="com.primeton.mis.contract.csContBackDep.queryCsContBackDepList.biz.ext" sizeList="[10,20,50,100]"  multiSelect="true"
	    	frozenStartColumn="0" frozenEndColumn="5">
			<div property="columns">
				<div type="checkcolumn" width="25"></div>
				<div field="type" width="70" align="center" headerAlign="center" allowSort="true" renderer="onCsContType">类型</div> 
				<div field="contnum" width="70" align="center" headerAlign="center" allowSort="true" renderer="detailCont">合同编号</div> 
				<div field="contid" width="70" align="center" headerAlign="center" allowSort="true" >合同号</div> 
				<div field="projectname" width="180" headerAlign="center" allowSort="true" >合同项目名称</div>
				<div field="custname" width="200" align="left" headerAlign="center" allowSort="true">签署单位</div> 
                <div field="backdepmon" width="80" dataType="currency" allowSort="true" headerAlign="center" align="right" summaryType="sum">金额</div>
                <div field="expno" width="100" headerAlign="center" allowSort="true" align="center" renderer="getDetail">付款申请单号</div>
                <div field="perioddesc" width="180" headerAlign="center" allowSort="true" align="left">期间描述</div>
                <div field="isdeal" width="80" renderer="onGenderSaleseva" allowSort="true" headerAlign="center" align="left">是否已办理</div>
                <div field="status" width="80" renderer="onCsBackDepStatus" allowSort="true" headerAlign="center" align="left">状态</div>
                <div field="returnmon" width="80" dataType="currency" allowSort="true" headerAlign="center" align="right" summaryType="sum">退还金额</div>
                <div field="paydate" width="80" headerAlign="center"  allowSort="true" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保函/保证金打款日期</div>
                <div field="predredate" width="80" headerAlign="center" allowSort="true" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保函/保证金预计退款日期</div>
                <div field="practredate" width="80" headerAlign="center" allowSort="true" renderer="onDealDate" dateFormat="yyyy-MM-dd" align="left">保证金实际退款日期</div>
                <div field="remark" width="100" headerAlign="center" allowSort="true"align="left">备注</div>
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
		
		var csContBackDepForm = new nui.Form("#csContBackDepForm");
		var csContBackDepGrid = nui.get("csContBackDepGrid");
		search();
		
		
		function drawCsBackdepSum(e){
			if (e.field == "backdepmon" || e.field == "returnmon") {
	            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
	        }
		}
		
		//查询
	    function search(){
	    	var data = csContBackDepForm.getData();
			csContBackDepGrid.sortBy("contnum","desc");
    		csContBackDepGrid.load(data);
	    }
	     //重置
	    function reset(){
			csContBackDepForm.reset();
			search();
	    }
	    
	    //回车触发
	    function onKeyEnter(e){
	    	search();
	    }
		
	    //是否已办理
	    function onGenderSaleseva(e){
	    	return nui.getDictText('MIS_YN',e.value);
	    } 
	    //合同保函保证金状态
	    function onCsBackDepStatus(e){
	    	return nui.getDictText('CS_BACK_DEP',e.value);
	    }
		function onCsContType(e){
			return nui.getDictText("CS_BACKDEP_TYPE",e.value);
		}
		function getDetail(e){
			if(e.value){
	    		return "<a href='javascript:void(0)' onclick='checkDetailPayApply();' title='点击查看'>" + e.value + "</a>";
	    	}
	    }
	    function checkDetailPayApply(){
	 		var selectRow = csContBackDepGrid.getSelected();
			var executeUrl = "/default/ame_fee/PaymentApply/PayApplyDetail.jsp?expid=" + selectRow.expid;
			window.open(executeUrl, "付款申请明细", "fullscreen=1");
	    }
		 //合同详细信息
        function detailCont(e){
        	return "<a href='javascript:void(0)' onclick='detailCont1();' title='点击查看合同信息'>" + e.value + "</a>";
        }
        function detailCont1(){
	 		var selectRow = csContBackDepGrid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
	    }
		//日期处理
		function onDealDate(e){
			if(e.value){
				return e.value.substring(0,10);
			}
		}
		function add(){
			nui.open({
                url: "<%=request.getContextPath() %>/contract/csContBackDep/addCsContBackDep.jsp",
                title: "新增合同保函保证金记录", 
				width: 800,
	            height: 360,
                onload: function () {
                    var iframe = this.getIFrameEl();
                },
                ondestroy: function (action) {
                	if(action=="ok"){
	                    csContBackDepGrid.reload();
                	}
                }
	        });
		}
		//新增、编辑
	    function addOrEdit(){
	    	var rows = csContBackDepGrid.getSelecteds();
			if(rows.length<1){
				nui.alert("请选中一条合同记录!");
			}else if (rows.length>1){
				nui.alert("只能选中一条记录！");
			}else{
				var row = csContBackDepGrid.getSelected();
	            nui.open({
	                url: "<%=request.getContextPath() %>/contract/csContBackDep/showCsContAndCsContBackDep.jsp",
	                title: "编辑合同保函保证金记录", 
					width: 1100,
		            height: 500,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    var data = {contractid: row.contractid };
		              	iframe.contentWindow.SetData(data);
	                },
	                ondestroy: function (action) {
	                	if(action=="ok"){
		                    csContBackDepGrid.reload();
	                	}
	                }
	            });
			}
	    }
	    
	    function exportCsContBack(){
	    	if(!confirm("是否确认导出？")){
				return;
			}
			var data = csContBackDepForm.getData();
			var json =  nui.encode(data);
			nui.ajax({
    			url: "com.primeton.mis.contract.csContBackDep.exportCsContBackDep.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		nui.unmask();
		     		var filePath = o.downloadFile;
		        	var fileName = "cscontbackdep";
		        	var myDate = new Date();
		        	var year = myDate.getFullYear();
		        	var month = myDate.getMonth()+1;
		        	var day = myDate.getDate();
		        	var hours = myDate.getHours();
		        	var minutes = myDate.getMinutes();
		        	var seconds = myDate.getSeconds();
		        	var curDateTime = year;
		        	if(month>9){
						curDateTime = curDateTime + "" + month;
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