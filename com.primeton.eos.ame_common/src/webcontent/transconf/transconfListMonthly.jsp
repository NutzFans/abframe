<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): EPCNB324
  - Date: 2018-01-03 15:15:22
  - Description:
-->
<head>
<title>工时转换系数月度展示</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-panel" title="工时转换系数月度展示" style="width:100%;">
		<div style="width:100%;height:100%;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>财务月度区间：</span></td>
		            	<td align="left">
		            		<input class="nui-monthpicker" format="yyyy-MM" name="map.startdate" id="minmonth" style="width:80px;" />
		            		&nbsp;至 &nbsp;
		            		<input class="nui-monthpicker" format="yyyy-MM" name="map.enddate" id="maxmonth" style="width:80px;" />
					    </td>
					    
					    <td align="right"><span>填报部门:</span></td>
				        <td>
				        	<input name="map.orgid" showNullItem="true" class="nui-combobox" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" textField="orgname" valueField="orgid" dataField="orgs" multiSelect="false" allowInput="true" style="width:200px;"/>
				        </td>
					    
					    <td align="right"><span>对应受受益部门:</span></td>
				        <td>
				        	<input name="map.org" showNullItem="true" class="nui-combobox" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" textField="orgname" valueField="orgid" dataField="orgs" multiSelect="false" allowInput="true" style="width:200px;"/>
				        </td>
				        <td align="center">
		                    <a class="nui-button" iconCls="icon-search" id="search" onclick="search()" >查询</a>
							<a class="nui-button" iconCls="icon-reset" id="reset" onclick="reset()" >重置</a>
		                </td>
					</tr>
				</table> 
			</div>
		</div>
		<div class="nui-fit">
			<!-- 系数列表-->
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:450px;"  dataField="data" showSummaryRow="true"   allowCellWrap="true" ondrawsummarycell="onDrawSummaryCell" sortMode="client"
		    	url="com.primeton.eos.ame_common.ameTransconf.querytransconfMonthly.biz.ext" showPager="false"  multiSelect="true" frozenStartColumn="0"  ondrawcell="ondrawCsGatherFcGridcell">
				
			</div>
	   </div>	
	</div>
</body>
<script type="text/javascript">
	nui.parse();
    var form = new nui.Form("#form1");
    var grid = nui.get("datagrid1");
    
    var date = new Date();
    var year = date.getFullYear();
    nui.get("minmonth").setValue(year+"-01");
    nui.get("maxmonth").setValue(date);
    //业务类型
    function doBizType(e){
    	if(e.value == '0'){
    		return '平均值';
    	}else{
    		var orgname="";
    		if(e.value != null && e.value != ''){
	    		var json = ({"orgid":e.value});
	    		nui.ajax({
	                url: "com.primeton.eos.ame_common.ame_common.getOrgInfo.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
               	   	async:false,
	                contentType: 'text/json',
	                success: function (text) {	
	                	orgname = text.org.orgname;
	                },
	                // 不懂jqXHR?? 
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	            });
    		}
    		return orgname;
    	}
    }
   	search();
   	//查询
    function search(){
		var data = form.getData(); 
		var startDate = nui.get("minmonth").getValue();
		var endDate = nui.get("maxmonth").getValue();
		var syear = startDate.getFullYear();
		var smonth = startDate.getMonth()+1;
		var eyear = endDate.getFullYear();
		var emonth = endDate.getMonth()+1;
		if(smonth<10){
			smonth = '0'+smonth;
		}
		if(emonth<10){
			emonth = '0'+emonth
		}
		var cols = getColumns(syear+'-'+smonth,eyear+'-'+emonth);
		grid.set({columns:cols});
		data.map.startdate = syear+'-'+smonth;
		data.map.enddate = eyear+'-'+emonth;
	  	grid.load(data);
    }
     //重置
    function reset(){
    	form.reset();
    }
    //动态获取列
    function getColumns(start, end) {
	    var result = [];
	    var starts = start.split('-');
	    var ends = end.split('-');
	    var staYear = parseInt(starts[0]);
	    var staMon = parseInt(starts[1]);
	    var endYear = parseInt(ends[0]);
	    var endMon = parseInt(ends[1]);
	    result.push({field:'orgid',width:40,align:'center',headerAlign:'center',header:'填报部门',renderer:'doBizType'});
	    result.push({field:'ORG',width:40,align:'center',headerAlign:'center',header:'对应受益部门',renderer:'doBizType'});
	    while (staYear <= endYear) {
	        if (staYear === endYear) {
	            while (staMon <= endMon) {
	            	if(staMon<10){
	            		result.push({field: staYear+'0'+staMon, width: 35,align:'right', headerAlign: 'center', allowSort: true,dataType:'float',decimalPlaces:'3', numberFormat:'#,0.000',header: staYear+'-'+staMon});
	            	}else{
	            		result.push({field: staYear+''+staMon, width: 35,align:'right', headerAlign: 'center', allowSort: true,dataType:'float', decimalPlaces:'3',numberFormat:'#,0.000',header: staYear+'-'+staMon});
	            	}
	                staMon++;
	            }
	            staYear++;
	        } else {
	            if (staMon > 12) {
	                staMon = 1;
	                staYear++;
	            }
	            if(staMon<10){
	            	result.push({field: staYear+'0'+staMon, width: 35, align:'right',headerAlign: 'center', allowSort: true,dataType:'float',decimalPlaces:'3',numberFormat:'#,0.000',header: staYear+'-'+staMon});
	            }else{
	            	result.push({field: staYear+''+staMon, width: 35,align:'right', headerAlign: 'center', allowSort: true,dataType:'float',decimalPlaces:'3',numberFormat:'#,0.000', header: staYear+'-'+staMon});
	           	}
	            staMon++;
	        }
	    }
	 	result.push({field:'00',width:40,align:'right',headerAlign:'center',decimalPlaces:'3',numberFormat:'#,0.000',allowSort: true,dataType:'float', header:'平均值'});
	    return result;
	}
	
	function onDrawSummaryCell(e) {
        var num = e.value;
        var result = e.result;
        var grid = e.sender;
        var rows = e.data;
        if (e.field == "total") {
            var totals = 0;
            for(var i=0;i<rows.length;i++){
               var row = rows[i];
               for (prop in row){
                 if(prop=="BIZTYPE"||prop=="_id"||prop=="_uid"){
                 	continue;
                 }else{
                 	var count =row[prop]; 
                 	if (isNaN(count)) continue;
                		totals += count;
                 }
			   }
			}
            e.cellHtml = "总计: " + totals;
        }
    }
        
    function onDrawCell(e){
		var record = e.record;
		var num = e.value;
		if (e.field == "total") {
			var totals = 0;
			for (prop in record){
	             if(prop=="BIZTYPE"||prop=="_id"||prop=="_uid"){
	             	continue;
	             }else{
	             	var count =record[prop]; 
	             	if (isNaN(count)||count==null){ 
	             		continue;
	             	}
	                totals += count;
	             }
			 }
	         e.cellHtml = totals;
	     }else{
	     	if(e.field=="BIZTYPE"){
	     		
	     	}else{
	     		if (num==null){
	     		        e.cellHtml =0;
	             }
	     	}
	     }
		
	}
	
	function format (e) {
	    return (e.value.toFixed(3) + '').replace(/\d{1,3}(?=(\d{3})+(\.\d*)?$)/g, '$&,');
	}
	
	//非工作日标示
	function ondrawCsGatherFcGridcell(e){
		var isWork = e.record.ORG;
		//alert(isWork);
        if(isWork == '0'){
        	e.rowStyle = "background-color: rgba(145,228,87,0.6)";
        }
	}
</script>
</html>