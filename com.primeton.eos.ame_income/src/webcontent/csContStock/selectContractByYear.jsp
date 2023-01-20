<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@include file="/nui/common.jsp"%>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2015-07-10 14:06:49
  - Description:
-->
<head>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<div class="nui-fit">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		        <table style="width:100%;">
		              <tr>
		                  <td style="width:100%;">
                  			 <a class="nui-button" iconCls="icon-save" onclick="saveContract()">项目转财务合同</a>
		                  	 <a class="nui-button" iconCls="icon-download" onclick="exportRG()">导出</a>
		                  </td>
		              </tr>
		         </table>
		</div>
		<div id="datagrid1" class="nui-datagrid" style="width:auto;height:auto;" sizeList="[50,100,200]" pageSize="200"
	            url="com.primeton.eos.ame_income.csContStock.selectContractByRG.biz.ext" dataField="cs" onSelect="changeC"
	            multiSelect="true" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell" ondrawcell="ondrawcell">
	        <div property="columns">
	        	<div type="checkcolumn" width="20"></div>
	        	<div field="contnum" width="60" headerAlign="center" align="center">合同编号</div>
	        	<div field="projectname" width="120" headerAlign="center" align="center">合同对应项目</div>
	        	<div field="custjc" width="90" headerAlign="center" align="center">客户简称</div>
	        	<div field="transcosts" width="60" headerAlign="center" align="center" dataType="currency" summaryType="sum">人工成本</div>
	        </div>
	    </div>
	</div>
	
	<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" borderStyle="border:0;">
        <a class="nui-button" style="width:60px;" onclick="onOk">确定</a>
        <span style="display:inline-block;width:25px;"></span>
        <a class="nui-button" style="width:60px;" onclick="onCancel">取消</a>
    </div>
    <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
			<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
			<input type="hidden" name="downloadFile" filter="false"/>
			<input type="hidden" name="fileName" filter="false"/>
		</form>
</body>
<script>
	nui.parse();
	var grid = nui.get("datagrid1");
	var year;
	var month;
	
	function setData(data){
		year = data.year;
		month = data.month;
		grid.load({"year":year,"month":month});
	}	
	
	function GetData() {
		var rows = grid.getSelecteds();
		return rows;
	}
	
	function onOk(){
		CloseWindow("ok");
	}
	
	function onCancel(){
		CloseWindow("cancel");
	}
	
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	function changeC(){
		var row = grid.getSelected();
		if(row.pkCorp!='1'){
			grid.deselect(row);
		}
	}
	
	function onDrawSummaryCell(e) {
	    var result = e.result;
	    var grid = e.sender;
	    if (e.field == "custjc") {
	        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计： </span>";
	    }
	    if (e.field == "transcosts") {
	    	var transcosts;//总和
		    var sq;//售前
		    var zzj;//组织级
		    var yf;//研发
		    var rg = 0;//人工成本
		    var sqrg;
		    if(e.cellHtml!=null&&e.cellHtml!=""){
		    	transcosts = e.cellHtml;
		    	transcosts = transcosts.replace(/,/g,"");
		    	rg = e.cellHtml;
			    for(var i=0;i<result.cs.length;i++){
			    	if(result.cs[i].contnum == "售前"){
			    		sq = result.cs[i].transcosts
			    	}else if(result.cs[i].contnum == "组织级"){
			    		zzj = result.cs[i].transcosts
			    	}else if(result.cs[i].contnum == "研发"){
			    		yf = result.cs[i].transcosts
			    	}
			    }
			    if(sq!=null&&sq!=""){
			    	rg = (parseFloat(transcosts) - parseFloat(sq)).toFixed(2);
			    }
			    if(zzj!=null&&zzj!=""){
			    	rg = parseFloat(transcosts) - parseFloat(zzj);
			    }
			    if(yf!=null&&yf!=""){
			    	rg = parseFloat(transcosts) - parseFloat(yf);
			    }
			    if(sq!=null&&sq!=""){
			    	sqrg = (parseFloat(rg) + parseFloat(sq)).toFixed(2);
			    }else{
			    	sqrg = parseFloat(rg).toFixed(2);
			    }
		        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>" + rg + "</br>" + sqrg + " </span>";
		    }else{
		    	e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>" + 0 + "</br>" + 0 + " </span>";
		    }
	    	
	    }
    }
    
    //导出
    function exportRG(){
		if(!confirm("导出人工成本归集记录？")){
			return;
		}
		var json =  nui.encode({"year":year,"month":month});
		nui.ajax({
			url: "com.primeton.eos.ame_income.csContStock.exportRG.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "人工成本归集记录";
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
	
	//针对项目没有关联合同的背景表红
	function ondrawcell(e){
		var state = e.record.state;
        //设置行样式   状态为未收款，预计收款年月小于当前月标记为红颜色FF99CC，预计收款年月为当前月标记为黄颜色FFFF99。
    	if(state == "1"){
    		e.rowStyle = "background-color: #FF99CC";
        }
	}
	
	//项目转合同
	function saveContract(){
		var datas = grid.getData();
		var json = nui.encode({"datas":datas});
		nui.ajax({
			url: "com.primeton.eos.ame_income.csContStock.updateCsContractByRg.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	        	if(o.result=='1'){
	        		alert("项目转合同成功！");
	        		grid.load({"year":year,"month":month});
	        	}else{
	        		alert("项目转合同失败！");
	        	}
	        }
        });
	}
</script>
</html>