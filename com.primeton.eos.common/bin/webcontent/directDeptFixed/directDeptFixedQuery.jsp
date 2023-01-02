<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): huangyq
  - Date: 2018-09-04 16:13:52
  - Description:
-->
<head>
<title>直接固定资产折旧</title>
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
<div class="nui-panel" title="直接固定资产折旧" style="width:100%;">
        <div id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">        		
	            <table align="center" border="0" width="100%" class="form_table">	            
				      <tr>
		    				<td align="right">机构名称：</td>
		            		<td align="left" style="width: 200px;">
						   	<input name="param.orgseq" class="nui-combobox" style="width: 100%" id="orgseq" textField="orgname" valueField="orgseq" dataField = "orgs"  shownullItem="true" onenter="onKeyEnter"
							    	allowInput="true" url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext"/>
							</td>
							<td align="right" style="width: 100px;">年月：</td>
		            		<td align="left"  style="width: 200px" >
						   	<input class="nui-monthpicker" id="date"  onvaluechanged="dateSet" />
				 		 	<input class="nui-hidden" name="param.year"  id="year"/>
				 		 	<input class="nui-hidden" name="param.month"  id="month"/>
							</td>
							<td align="center" >
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
                    	<!-- <a class="nui-button" id="import" iconCls="icon-upload" onclick="doImport()">导入部门折旧数</a>  -->
                    	<a class="nui-button" id="export" iconCls="icon-download" onclick="doExport()">导出</a>
			            <a class="nui-button" id="save" iconCls="icon-save" onclick="ok">保存</a>		
			            <a class="nui-button" id="savedep" iconCls="icon-gj" onclick="savedep">资产原值折旧归集</a>			         	           
			        </td>
                </tr>
            </table>           
        </div>
        <div id="datagrid1" class="nui-datagrid" style="width:100%;height:340px;" allowResize="true" dataField="listDeptCost" 
        	 pagesize="20" sizeList="[20,30,50,200,300]" allowCellSelect="true" allowCellEdit="true" 
        	 url="com.primeton.eos.common.directDepFixed.directDepQuery.biz.ext"  multiSelect="true"
        	 ondrawsummarycell="onDrawSummaryCell" showSummaryRow="true" onDrawcell="sumLie">
			<div property="columns">  
            <div header="一级分摊单位" headerAlign="center">  
            	<div property="columns">                     
                <div field="grpName" width="150" align="center" headerAlign="center" allowSort="true" >单位名称（代号）</div> 
            	</div>
            </div>
            <div header="二级分摊单位" headerAlign="center"> 
            	<div property="columns">             				
                <div field="deptName" width="150" align="center" headerAlign="center" allowSort="true" renderer="dictGetStatus">单位名称（代号）</div>
            	</div>
            </div> 
            <div header="" headerAlign="center"> 
                <div property="columns">         
                	<div field="empNum" width="75" align="right" headerAlign="center" allowSort="true" summaryType="sum" >人数</div>
            	</div>
            </div>
            <div header="费用类型" headerAlign="center">
            	<div property="columns">
					<div field="property" width="120" align="right" headerAlign="left" text-align="left" allowSort="true" numberFormat="0.0" summaryType="sum">
						直接固定资产原值
						<input property="editor" class="nui-textbox" onvaluechanged="changeData"/>
					</div>                            
	                <div field="depreciation" width="120" align="right" headerAlign="center" allowSort="true" numberFormat="0.0" summaryType="sum">
	                	直接固定资产折旧
	                	<input property="editor" class="nui-textbox" onvaluechanged="changeData"/>
	                </div>
	                <div field="total" width="120" align="right" headerAlign="center" allowSort="true" summaryType="sum">合计</div> 
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
	    
    init();
    function init(){
     	var date = nui.get("date").getValue();
    	var text = formatDateTime(date);
		nui.get("date").setText(text.substring(0,7));
		nui.get("year").setValue(parseInt(text.substring(0,4)));
		nui.get("month").setValue(parseInt(text.substring(5,7)));
		year = parseInt(text.substring(0,4));
		month = parseInt(text.substring(5,7))
		var json = form.getData();
		grid.load(json);
	}
		
		function search() {
			var data = form.getData(); //获取表单JS对象数据
		  	grid.load(data); //datagrid加载数据
		}
		
		function reset(){
			var form = new nui.Form("#form1");
			form.reset();
			init();
		}
		//保存
		function ok(){
			var arr = [];
			var selectRow = grid.getChanges("modified");
			for (var i = 0 ; i < selectRow.length ; i++){
				var obj = {};
				var reg=/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
				if(reg.test(selectRow[i].property)){
					obj = createObj('21',selectRow[i].deptNo,selectRow[i].property);
					arr.push(obj);
				}
				if(reg.test(selectRow[i].depreciation)){
					obj = createObj('22',selectRow[i].deptNo,selectRow[i].depreciation);
					arr.push(obj);
				}
			}
			save(arr);
		}
		
		function save(data){
			if(data.length == 0){
				alert("费用无修改！");
				return;
			}
			var json = {list:data};
			nui.ajax({
		        url: "com.primeton.eos.common.directDepFixed.newSaveDepFixed.biz.ext",
		        type: "post",
		        data: json,
		        success: function (o) {
		        	if(o.result == '1'){
		        		nui.alert("保存成功。","提示",function(e){
		        			search();
		        		})
		        	}else{
		        		nui.alert("保存失败。")
		        	}
		        },
		        error: function () {
		        	nui.alert("error");
		        }
	        });
		}		
		//导入
		function doImport(){
			nui.open({
	            url: "<%=request.getContextPath() %>/mpcommon/directDepFixed/importDepFixed.jsp?year="+year+"&month="+month,
	            title: "导入部门折旧数", 
				width: 660,
	            height: 220,
	            onload: function () {
	            	
	            },
	            ondestroy: function (action) {
	            	if(action == "ok"){
	            		grid.reload();
	            	}
	            }
	        });
		}
		//直接固定资产折旧加数据归集
		function savedep(){
			var json = {year:year,month:month};
			nui.ajax({
		        url: "com.primeton.eos.common.directDepFixed.queryMisMachinAsset.biz.ext",
		        type: "post",
		        data: json,
		        success: function (o) {
		        	if(o.misMaAssets.length>0){
		        		var month1="";
		        		if(month<10){
		        			month1="0"+month;
		        		}else{
		        			month1=month;
		        		}
		        		var yearmonth =year+""+month1;
		        		var json = {map:{year:year,month:month,yearmonth:yearmonth}};
		        		nui.confirm("是否确定执行"+year+"年"+month+"月资产原值折旧归集?","操作提示",function(o){
			        		if("ok" == o){
			        			nui.ajax({
							        url: "com.primeton.eos.common.directDepFixed.saveDepAsset.biz.ext",
							        type: "post",
							        data: json,
							        success: function (o) {
							        	if(o.result == '1'){
							        		nui.alert("资产归集成功。","提示",function(e){
							        			search();
							        		})
							        	}else{
							        		nui.alert("资产归集失败。")
							        	}
							        },
							        error: function () {
							        	nui.alert("error");
							        }
						        });
			        		}else{
			        		
			        		}
			        	});
		        	}else{
		        		nui.alert("所归集年月还未生成折旧数据，请在资产报表中计算折旧数据！")
		        	}
		        },
		        error: function () {
		        	nui.alert("error");
		        }
	        });
		}
		function changeData(e){
			var reg=/^[+]{0,1}(\d+)$|^[+]{0,1}(\d+\.\d+)$/;
			if(!reg.test(e.value)){
				e.value = "";
				e.cellHtml = "";
				nui.alert("输入非正确字符，请重新输入。");
			}
		}	
		
		//工厂赋值修改的对象
		function createObj(costtypeid,deptno,amt){
			var o = new Object();
		    o.year = year;
		    o.month = month;
		   	o.costtypeid = costtypeid;
		    o.deptno = deptno;
		    o.amt = parseFloat(amt);
		    return o;
		}
		//导出
		function doExport(){
			var form = new nui.Form("#form1");
			var json = form.getData();
			grid.loading("操作中，请稍后......");
			nui.ajax({
		        url: "com.primeton.eos.common.directDepFixed.newExportDepFixed.biz.ext",
		        type: "post",
		        data: json,
		        success: function (o) {
		     		grid.unmask();
		        	var filePath = o.downloadFile;
		        	var fileName = "直接固定资产折旧";
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
		    if (e.field == "property") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.toFixed(1) + "</span>";
		    }
		    if (e.field == "depreciation") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml.toFixed(1) + "</span>";
		    }	    			 
			if(e.column.field != "grpName" && e.column.field != "deptName" && e.column.field !="empNum" && e.column.field !="property" && e.column.field != "total"){
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
				e.cellHtml =(parseFloat(e.record.depreciation)).toFixed(1)
			}else if(e.value == 0||e.value == null||e.value == "null"){
				e.cellHtml = "";
			}
		}
		//格式化日期 and 当期日期
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
</script>
</html>