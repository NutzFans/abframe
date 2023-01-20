
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): huangyq
  - Date: 2018-09-12 16:27:56
  - Description:
-->
<head>
<title>区域级公共费用分摊</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:;
	    }
    </style>
</head>
<body>
<div class="nui-panel" title="区域级公共费用分摊" style="width:100%;">
	<div id="form1">
    	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">        		
	            <table align="center" border="0" width="100%" class="form_table">	            
				      <tr>
		    				<td align="right" style="width: 100px;">机构名称：</td>
		    				<td colspan="1" align="left"  style="width: 200px">
						   	<input name="param.orgseq" class="nui-combobox" style="width: 100%" id="orgseq" textField="orgname" valueField="orgseq" dataField = "orgs"  shownullItem="true" onenter="onKeyEnter"
							    	allowInput="true" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" />
							</td>
							<td align="right" style="width: 100px;">年月：</td>
							<td colspan="1" align="left"  style="width: 200px">
						   	<input class="nui-monthpicker" id="date"  onvaluechanged="dateSet" onenter="onKeyEnter"/>
				 		 	<input class="nui-hidden" name="param.year"  id="year"/>
				 		 	<input class="nui-hidden" name="param.month"  id="month"/>
				 		 	</td>
							<td align="right" style="width: 100px;">区域：</td>
							<td colspan="1">
						   	<input name="param.regionid" class="nui-dictcombobox" id="regionid" dictTypeId="EXP_REGION" value="1" style="width:150px;" onenter="onKeyEnter"/>						   	 					    	
							</td>	
							<td align="center">
		    				<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
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
                    <td style="width:20%;">                    	 
                    	<a class="nui-button" id="export" iconCls="icon-download" onclick="doExport()">导出</a>
			            <a class="nui-button" id="save" iconCls="icon-save" onclick="divide()">分摊计算</a>	
			        </td>
                </tr>
            </table>           
        </div>		
        	<div id="datagrid1" class="nui-datagrid" style="width:100%;height:340px;" allowResize="true" dataField="listDeptCostRegion" 
        	 pagesize="100" sizeList="[100,200,300]" allowCellSelect="true" allowCellEdit="true" frozenStartColumn="0" frozenEndColumn="1"
        	 url="com.primeton.eos.common.deptcostRegion.deptcostRegionQuery.biz.ext"  multiSelect="true"
        	 ondrawsummarycell="onDrawSummaryCell" showSummaryRow="true" onDrawcell="sumLie">
				<div property="columns">  
            		<div header="一级分摊单位" headerAlign="center">  
            			<div property="columns">                     
                			<div field="grpName" width="150" align="center" headerAlign="center" allowSort="true" >单位名称（代号）</div> 
            			</div>
            		</div>
            		<div header="二级分摊单位" headerAlign="center"> 
            			<div property="columns">             				
                			<div field="deptName" width="150" align="center" headerAlign="center" allowSort="true" >单位名称（代号）</div>
            			</div>
            		</div> 
            		<div header="" headerAlign="center"> 
                		<div property="columns">         
                			<div field="empNum" width="75" align="right" headerAlign="center" allowSort="true" summaryType="sum">人数</div>
            			</div>
            		</div>
            		<div header="费用类型" headerAlign="center">
            			<div property="columns">
							<div field="qygdzcyz" width="120" align="right" headerAlign="left" text-align="left" allowSort="true" numberFormat="0.0" summaryType="sum">
								区域固定资产原值						
							</div>                            
	                		<div field="qyzjft" width="120" align="right" headerAlign="center" allowSort="true" numberFormat="0.0" summaryType="sum">
	                			区域折旧分摊	                	
	                		</div>
	                		<div field="zxtx" width="120" align="right" headerAlign="center" allowSort="true" numberFormat="0.0" summaryType="sum">
	                			装修摊销	                	
	                		</div>
	                		<div field="fzwy" width="120" align="right" headerAlign="center" allowSort="true" numberFormat="0.0"summaryType="sum">
	                			房租	                	
	                		</div>
	                		<div field="wy" width="120" align="right" headerAlign="center" allowSort="true" numberFormat="0.0" summaryType="sum">
	                			物业	                	
	                		</div>
	                		<div field="sdf" width="120" align="right" headerAlign="center" allowSort="true" numberFormat="0.0" summaryType="sum">
	                			水电费	                	
	                		</div>
	                		<div field="qtggfy" name = "qtggfy" width="120" align="right" headerAlign="center" allowSort="true" numberFormat="0.0" summaryType="sum">
	                			其他公共费用                	
	                		</div> 
	                		<div field="total" width="120" align="right" headerAlign="center" allowSort="true" numberFormat="0.0" summaryType="sum">
	                			合计               	
	                		</div> 
            			</div>
            		</div>        	                 	
            	</div>   
		</div>						           
	</div>		
</div>
				<form name="viewlist" id="viewlist" action="com.primeton.eos.ame_fee.exportTicket.flow" method="post">
					<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
					<input type="hidden" name="downloadFile" filter="false"/>
					<input type="hidden" name="fileName" filter="false"/>
				</form>
				
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
    var grid = nui.get("datagrid1");
    var year,month;
    var qygdzcyz=null;
    
	var qtggfy1;   
	
    init();
    function init(){
     	var date	=nui.get("date").getValue();
    	var text = formatDateTime(date);
		nui.get("date").setText(text.substring(0,7));
		nui.get("year").setValue(parseInt(text.substring(0,4)));
		nui.get("month").setValue(parseInt(text.substring(5,7)));
		year = parseInt(text.substring(0,4));
		month = parseInt(text.substring(5,7));
		var json = form.getData();
		grid.load(json,function(e){
			var qtggfy = e.text.listQtggfy[0].qtggfy;
			qtggfy1 = qtggfy;
			if(qtggfy==null||qtggfy==""){
				qtggfy = 0;
			}
			var html = grid.getSummaryCellEl("qtggfy");
			$(html).html("<span style='display: block;font-weight: bold;text-align: right;'>" + qtggfy + "</span>");
		});
	}
		
		function search() {
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data,function(e){
				var qtggfy = e.text.listQtggfy[0].qtggfy;
				qtggfy1 = qtggfy;
				if(qtggfy==null||qtggfy==""){
					qtggfy = 0;
				}
				var html = grid.getSummaryCellEl("qtggfy");
				$(html).html("<span style='display: block;font-weight: bold;text-align: right;'>" + qtggfy + "</span>");
			}); //datagrid加载数据
		}
		
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			init();
		}
		//分摊计算
		function divide(){
			var regionid = nui.get("regionid").getValue();
			var regionname = nui.getDictText('EXP_REGION',regionid);
			nui.open({
		          url: "<%= request.getContextPath() %>/mpcommon/deptcostRegion/deptcostregionDivide.jsp?year="+year+"&month="+month+"&regionid="+regionid,
		          title: "分摊合计值",
		          width: 1020,
	              height: 580,
	              onload: function () {//弹出页面加载完成
                  var iframe = this.getIFrameEl();
                  var data = { action: "save",qygdzcyz:qygdzcyz,qyzjft:qyzjft,zxtx:zxtx,fzwy:fzwy,wy:wy,sdf:sdf,regionname:regionname,qtggfy:qtggfy1};//传入页面的json数据
                  iframe.contentWindow.setData(data);
            	  },
            	  ondestroy: function (action) {
            	  if(action=="ok"){
            		search();
            	  }
                }
        		});
		}
		function dictGetRegion(e){
			return nui.getDictText('EXP_REGION',e.value);
		}
		
		//导出
		function doExport(){
			var form = new nui.Form("#form1");
			var json = form.getData();
			grid.loading("操作中，请稍后......");
			nui.ajax({
		        url: "com.primeton.eos.common.deptcostRegion.newExportDeptcostregion.biz.ext",
		        type: "post",
		        data: json,
		        success: function (o) {
		     		grid.unmask();
		        	var filePath = o.downloadFile;
		        	var fileName = "区域级公共费用分摊";
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
					var frm = document.getElementById("viewlist");
		        	frm.elements["downloadFile"].value = filePath;
		        	frm.elements["fileName"].value = fileName;
				    frm.submit();
		        },
		        error: function () {
		        	alert("error");
		        }
		    });	
		}
		//设置日期
		function dateSet(e){
			var text = formatDateTime(e.value);
			nui.get("year").setValue(parseInt(text.substring(0,4)));
			nui.get("month").setValue(parseInt(text.substring(5,7)));
			year = parseInt(text.substring(0,4));
			month = parseInt(text.substring(5,7))
		}	
		
		function changeData(e){
			var reg=/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
			if(!reg.test(e.value)){
				e.value = "";
				e.cellHtml = "";
				nui.alert("输入非正确字符，请重新输入。");
			}
		}		
	 
	    //格式化为千分位形式
		function formatNumber(num,cent) {
			num = num.toString().replace(/\$|\,/g,'');  
	        // 检查传入数值为数值类型  
	         if(isNaN(num))  
	          num = "0";  
	        // 获取符号(正/负数)  
	        sign = (num == (num = Math.abs(num)));  
	        num = Math.floor(num*Math.pow(10,cent)+0.50000000001); // 把指定的小数位先转换成整数.多余的小数位四舍五入  
	        cents = num%Math.pow(10,cent);       // 求出小数位数值  
	        num = Math.floor(num/Math.pow(10,cent)).toString();  // 求出整数位数值  
	        cents = cents.toString();        // 把小数位转换成字符串,以便求小数位长度  
	       
	        // 补足小数位到指定的位数  
	        while(cents.length<cent)  
	         cents = "0" + cents;  
	         // 对整数部分进行千分位格式化.  
	         for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)  
	          num = num.substring(0,num.length-(4*i+3))+','+ num.substring(num.length-(4*i+3));  
	        return (((sign)?'':'-') + num + '.' + cents); 
		}
		
	    //合计
	    var num = 0;
		function onDrawSummaryCell(e) {
		    var result = e.result;
		    var grid = e.sender;
		    if (e.field == "deptName") {
		        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
		    }
		    if (e.field == "empNum") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.toFixed(1) + "</span>";
		    }
		     if (e.field == "qygdzcyz") {
		     	qygdzcyz=e.cellHtml.toFixed(1);
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.toFixed(1) + "</span>";
		    }
		    if (e.field == "qyzjft") {
		    	qyzjft=e.cellHtml.toFixed(1);
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.toFixed(1) + "</span>";
		    }
		    if (e.field == "zxtx") {
		    	zxtx=e.cellHtml.toFixed(1);
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.toFixed(1) + "</span>";
		    }
		    if (e.field == "fzwy") {
		    	fzwy=e.cellHtml.toFixed(1);
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.toFixed(1) + "</span>";
		    }
		    if (e.field == "wy") {
		    	wy=e.cellHtml.toFixed(1);
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.toFixed(1) + "</span>";
		    }
		    if (e.field == "sdf") {
		    	sdf=e.cellHtml.toFixed(1);
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.toFixed(1) + "</span>";
		    }
		    if (e.field == "qtggfy") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.toFixed(1) + "</span>";
		    }		    			 
			if(e.column.field != "grpName" && e.column.field != "deptName" && e.column.field !="empNum" && e.column.field !="qygdzcyz" && e.column.field != "total"){
				num += e.column.summaryValue;
			}
			if (e.field == "total") {
    			e.cellHtml = "<div align='right'><b>" + num.toFixed(1) + "</b></div>";
    			num = 0;
			}	    			    
		} 
				
		function sumLie(e){
			if(e.field == "total"){
				var obj = e.record;
				var keys=[];//定义一个数组用来接受key  
				var values=[];//定义一个数组用来接受value  
				for(var key in obj){ 
		  				if(key != "grpName" && key != "deptName" && key != "total" && key != "grpNo"
		  				 && key != "deptNo" && key != "orgseq"){
		  					keys.push(key);  
		    				values.push(obj[key]);//取得value
		  				} 
					} 
					for(var i = 0 ; i < keys.length ; i++){
						var a = keys[i];
						if(eval("e.record."+a) == "null" || eval("e.record."+a) == null){
							eval("e.record."+a+"="+0);
						}
					}
				e.cellHtml =(parseFloat(e.record.qyzjft)+parseFloat(e.record.zxtx)+parseFloat(e.record.fzwy)+parseFloat(e.record.wy)
				+parseFloat(e.record.sdf)+parseFloat(e.record.qtggfy)).toFixed(1)
				
			}else if(e.value == 0||e.value == null||e.value == "null"){
				e.cellHtml = "";
			}
		}
		//格式化日期 and 当前日期
		function formatDateTime(date) {
			if(date == ''){
				date = new Date();
			}
		    var y = date.getFullYear();
		    var m = date.getMonth() + 1;
		    m = m < 10 ? ('0' + m) : m;
		    var d = date.getDate();
		    d = d < 10 ? ('0' + d) : d;
		    var h = date.getHours();
		    h = h < 10 ? ('0' + h) : h;
		    var minute = date.getMinutes();
		    minute = minute < 10 ? ('0' + minute) : minute;
		    return y + '-' + m + '-' + d+' '+h+':'+minute+':00';
	    }
	    //回车触发事件
	    function onKeyEnter(){
	    	search();
	    }
	    
	    
</script>
</html>