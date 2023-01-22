<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): devil_sh
  - Date: 2016-11-15 15:50:38
  - Description:
-->
<head>
<title>短信记录月度汇总统计</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/common/nui/locale/zh_CN.js" type="text/javascript"></script>
</head>
<body>
<div  class="nui-panel" title="短信记录月度汇总统计" width="auto">
		<div style="width:100%;height:100%;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right">发送时间：</td>
						<td>
							<input name="map/sendtimeMin" class="nui-datepicker" format="yyyy-MM-dd" style="width:100px;" id="sendtimeMin" required="true"/>
							&nbsp;至
							<input name="map/sendtimeMax" class="nui-datepicker" format="yyyy-MM-dd" style="width:100px;" id="sendtimeMax" required="true"/>
						</td>
						<td align="right">短信类型：</td>
						<td>
							<input class="nui-dictcombobox" dictTypeId="SMS_BIZ_TYPE"  name="map/smsbiztype" id="smsbiztype"/>
						</td>
						<td align="right">状态：</td>
						<td>
							<input class="nui-dictcombobox" dictTypeId="SMS_SEND_STATUS"  name="map/sendstatus" id="sendstatus"/>
						</td>
						<td align="right">短信平台代码：</td>
						<td>
							<input name="map/smsplatformno" class="nui-textBox"  id="smsplatformno"/>
						</td>
					</tr>
	            </table> 
	             <table style="width:90%;">
		            <tr>
		                <td align="center" style="width:100%;">
		                    <a class="nui-button" iconCls="icon-search" id="search" onclick="search()" >查询</a>
							<a class="nui-button" iconCls="icon-reload" id="reset" onclick="reset()" >重置</a>
		                </td>
		            </tr>
	        	</table>          
	        </div>
	    </div>
	    <div class="nui-fit">
		<!-- 短信信息列表-->
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:450px;"  dataField="data" showSummaryRow="true"   allowCellWrap="true" ondrawsummarycell="onDrawSummaryCell"
	    	url="com.primeton.eos.ame_common.smsPlatform.gatherSmsSendRecord.biz.ext" showPager="false"  multiSelect="true" frozenStartColumn="0"  ondrawcell="onDrawCell">
			
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
    nui.get("sendtimeMin").setValue(year+"-01-01");
    nui.get("sendtimeMax").setValue(date);
   search();
    
    //短信业务类型
    function doBizType(e){
    	return nui.getDictText('SMS_BIZ_TYPE',e.value);
    }
    
    //查询短信信息
    function search(){
		var data = form.getData(); 
		var startDate = nui.get("sendtimeMin").getValue();
		var endDate = nui.get("sendtimeMax").getValue();
		var cols = getColumns(startDate,endDate);
		grid.set({columns:cols});
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
	    result.push({field:'BIZTYPE',width:40,align:'center',headerAlign:'center',header:'业务类型',renderer:'doBizType'});
	    while (staYear <= endYear) {
	        if (staYear === endYear) {
	            while (staMon <= endMon) {
	            	if(staMon<10){
	            		result.push({field: staYear+'0'+staMon, width: 40, headerAlign: 'center', allowSort: true,dataType:'int',summaryType:'sum', header: staYear+'年'+staMon+'月'});
	            	}else{
	            		result.push({field: staYear+''+staMon, width: 40, headerAlign: 'center', allowSort: true,dataType:'int',summaryType:'sum', header: staYear+'年'+staMon+'月'});
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
	            	result.push({field: staYear+'0'+staMon, width: 40, headerAlign: 'center', allowSort: true,dataType:'int',summaryType:'sum', header: staYear+'年'+staMon+'月'});
	            }else{
	            	result.push({field: staYear+''+staMon, width: 40, headerAlign: 'center', allowSort: true,dataType:'int',summaryType:'sum', header: staYear+'年'+staMon+'月'});
	           	}
	            staMon++;
	        }
	    }
	 	result.push({field:'total',width:40,align:'center',headerAlign:'center',header:'汇总'});
	    return result;
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
    
</script>
</html>