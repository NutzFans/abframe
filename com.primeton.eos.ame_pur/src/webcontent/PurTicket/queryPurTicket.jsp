<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): wanglinqiong
  - Date: 2016-05-13 15:11:04
  - Description:
-->
<head>
<title>采购合同发票查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="mini-panel" title="采购合同发票查询" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>供应商名称：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[0]._value" class="nui-textbox"  style="width:200px;"/>
						    <input class="nui-hidden" name="criteria._expr[0]._property" value="custname"/>
						    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
						</td>
						<td align="right"><span>对应项目：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[1]._value" class="nui-textbox"  style="width:200px;"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="projectName"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td>
						<td align="right"><span>采购合同编号：</span></td>
		            	<td align="left">
						    <input name="criteria._expr[2]._value" class="nui-textbox"  style="width:150px;"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="purcontnum"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>发票类型：</span></td>
						<td align="left">
						    <input name="criteria._expr[4]._value" class="nui-dictcombobox" dictTypeId="MIS_MA_INVOICETYPE" style="width:200px;" showNullItem="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="tictype"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="="/>
						</td>
						<td align="right"><span>发票日期：</span></td>
		            	<td align="left">
						    <input class="nui-datepicker" name="criteria._expr[3]._min" style="width:98px" id="minyearmonth"/>-<input class="nui-datepicker" name="criteria._expr[1]._max" id="maxyearmonth" style="width:98px"/>
					        <input class="nui-hidden" name="criteria._expr[3]._property" value="ticdate"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
					        <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd"/>
						</td>
						<td align="right"><span>是否有效：</span></td>
						<td align="left">
						    <input name="criteria._expr[5]._value" class="nui-dictcombobox" dictTypeId="MIS_YN" style="width:150px;" showNullItem="true" nullItemText=""/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="state"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="="/>
						</td>
					</tr>
					<tr>
						<td align="right"><span>发票号：</span></td>
						<td align="left">
						    <input name="criteria._expr[7]._value" class="nui-textbox"  style="width:200px;"/>
						    <input class="nui-hidden" name="criteria._expr[7]._property" value="ticnum"/>
						    <input class="nui-hidden" name="criteria._expr[7]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[7]._likeRule" value="all"/>
						</td>
						<td align="right"><span>发票内容：</span></td>
						<td align="left">
						    <input name="criteria._expr[6]._value" class="nui-textbox"  style="width:200px;"/>
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="ticcontent"/>
						    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
						</td>
					
					</tr>
					<tr>
		    			<td align="center" colspan="15">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
                            <a class="nui-button" onclick="exportTicket" iconCls="icon-download" id="exportButton">导出</a>
                            	
                       </td>
	                </tr>
	                
	            </table>           
	        </div>
	    </div>
	     <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
			<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
			<input type="hidden" name="downloadFile" filter="false"/>
			<input type="hidden" name="fileName" filter="false"/>
		</form>
	    <div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="addBtn" iconCls="icon-add" onclick="add()">增加</a>
	                        <a class="nui-button" id="updateBtn" iconCls="icon-edit"  onclick="edit()">编辑</a>
	                        <a class="nui-button" id="deltbtn" iconCls="icon-remove"  onclick="remove()">删除</a>
	                    </td>
	                </tr>
                 </table>
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:320px;" allowResize="true" dataField="purTickets" showSummaryRow="true" ondrawsummarycell="doCountNowPage"
	    url="com.primeton.eos.ame_pur.purTicket.queryPurTicket.biz.ext" sizeList="[10,20,50,100,200,500]"  multiSelect="true" allowCellWrap="true" >
			<div property="columns">
				<div type="checkcolumn" width="25"></div>
				<div field="ticnum" width="75" align="center"  headerAlign="center"allowSort="true" renderer="getTicketDetail">发票号</div>
				<div field="ticdate" width="75" align="center" headerAlign="center"allowSort="true">开票日期</div>
				<div field="tictype" width="70" align="right" headerAlign="center"  allowSort="true" renderer="ticketType">发票类型</div>
				<div field="ticmon" width="70" align="right" headerAlign="center" dataType="currency" summaryType="sum" allowSort="true">发票金额</div>
				<div field="ticrate" width="45" align="right" headerAlign="center" dataType="currency" allowSort="true" numberFormat="p0">税率</div>
				<div field="tictax" width="70" align="right" headerAlign="center" dataType="currency" summaryType="sum" allowSort="true">税金</div>
				<div field="ticmonnet" width="70" align="right" headerAlign="center" dataType="currency" summaryType="sum" allowSort="true">不含税金额</div>
				<div field="suppliersname" width="60" align="center" headerAlign="center" allowSort="true">供应商简称</div>	
				<div field="purcontname" width="120" align="left" headerAlign="center" >采购合同名称</div>
				<div field="purcontnum" width="100" align="center" headerAlign="center" renderer="getDetail" allowSort="true">采购合同编号</div>
				<div field="contmoney" width="70" align="right" headerAlign="center" dataType="currency" allowSort="true">采购合同金额</div>
				<div field="state" width="40" align="center"  headerAlign="center"allowSort="true" renderer="getState">是否有效</div>
				<div field="ticcontent" width="120" align="left"  headerAlign="center"allowSort="true">开票内容</div>
				<div field="remark" width="120" align="left"  headerAlign="center"allowSort="true">备注</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	/**供应商查询*/
	var form = new nui.Form("#form1");
	nui.parse();
	var grid = nui.get("datagrid1");
	
	init();
	function init(){
		grid.load();
		grid.sortBy("ticdate","desc");
	}
	
	function search() {
		var form = new nui.Form("#form1");
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
	}

	function getState(e){
		return nui.getDictText('MIS_YN',e.value);
	}
	function ticketType(e){
		return nui.getDictText('MIS_MA_INVOICETYPE',e.value);
	}
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		grid.load();
	}
	function add() {        	
        nui.open({
            url: "<%=request.getContextPath() %>/ame_pur/PurTicket/modifyPurTicket.jsp",
            title: "新增采购合同发票", 
			width: 730,
            height: 420,
            onload: function () {
                var iframe = this.getIFrameEl();
                var data = { action: "new"};
                iframe.contentWindow.SetData(data);
            },
            ondestroy: function (action) {
                grid.reload();
            }
        });
    }
    
    function remove() {
		var rows = grid.getSelecteds();   //获取所有选中的行对象
		if(rows.length==null||rows.length==0){
			alert("请至少选中一条记录！");
			return;
		}else{
			var data = {tickets:rows};
			var json = nui.encode(data);     //序列化成json字符串
			if (rows.length> 0) {
				if (confirm("确定删除选中记录？")) {
					grid.loading("操作中，请稍后...");
					nui.ajax({
						url: "com.primeton.eos.ame_pur.purTicket.deletePurTicket.biz.ext",
						type: "post",
						data: json, 
						cache: false,
						contentType: 'text/json',
						success: function (text) {
							var result = text.result;
							if(result=='1'){
								nui.alert("删除成功!");
								grid.reload();
							}else{
								nui.alert("删除失败!");
								grid.unmask();
							}	
						},
						error: function () {
						}
					});
				}
			}else{
				return;
			}
		}
    }
    
    function edit() {
		var row = grid.getSelected();
		if (row) {
      		nui.open({
	            url: "<%=request.getContextPath() %>/ame_pur/PurTicket/modifyPurTicket.jsp",
	            title: "编辑采购合同发票",
	            width: 730,
	            height: 420,
	            onload: function () {
	              var iframe = this.getIFrameEl();
	              var data = {action: "edit", ticketid: row.ticketid };
	              iframe.contentWindow.SetData(data);
	            },
	            ondestroy: function (action) {
					grid.reload();
	            }
            });
        } else {
          nui.alert("请选中一条记录","提示");
        }
    }
    
    
    
      function exportTicket(){
			if(!confirm("确定要导出采购发票记录吗？")){
				return;
			}
			var data = form.getData();
			data.criteria._expr[3]._min = nui.get("minyearmonth").getText();
			data.criteria._expr[3]._max = nui.get("maxyearmonth").getText();
			var json =  nui.encode(data);
			nui.ajax({
    			url: "com.primeton.eos.ame_pur.purTicket.exportTicket.biz.ext",
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		nui.unmask();
		     		var filePath = o.downloadFile;
		        	var fileName = "采购发票记录";
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
    function checkDetail(){
 		var selectRow = grid.getSelected();
		var executeUrl = "<%=request.getContextPath() %>/ame_pur/PurContract/DetailPurContract.jsp?id=" + selectRow.purcontid;
	    var iTop = (window.screen.availHeight-30-550)/2; //获得窗口的垂直位置;
		var iLeft = (window.screen.availWidth-10-1200)/2; //获得窗口的水平位置;
		window.open(executeUrl, "采购合同详细信息","fullscreen=1" );//"height=550, width=1200,top="+iTop+",left="+iLeft+",resizable=yes"
    }
    
    function getDetail(e){
		if(e.value){
			return "<a href='javascript:void(0)' onclick='checkDetail();' title='点击查看'>" + e.value + "</a>";
		}
	}
	
	function checkTicDetail(){
		var selectRow = grid.getSelected();
		nui.open({
			url: "<%=request.getContextPath() %>/ame_pur/PurTicket/ticketDetail.jsp",
			title: "采购发票详细信息",
			width: 730,
			height: 420,
			onload: function () {
				var iframe = this.getIFrameEl();
				var data = {ticketid: selectRow.ticketid };
				iframe.contentWindow.SetData(data);
			}
		});
	}

	function getTicketDetail(e){
		if(e.value){
			return "<a href='javascript:void(0)' onclick='checkTicDetail();' title='点击查看'>" + e.value + "</a>";
		}
	}
    
    function doCountNowPage(e){
    	//客户端汇总计算
        if (e.field == "ticmon"||e.field == "tictax"||e.field == "ticmonnet") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
    }
</script>
</html>