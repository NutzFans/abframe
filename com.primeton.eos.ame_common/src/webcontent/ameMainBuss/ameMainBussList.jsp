<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): mengyy
  - Date: 2018-11-07 14:19:48
  - Description:
-->
<head>
<title>关键业务数据查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div  class="mini-panel" title="关键业务数据查询" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
		            	<td align="right"><span>业务识别号：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[0].uniqnum" style="width: 150px;"/>
					        <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
					    </td>
		            	<td align="right"><span>业务描述：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[1].bussdesc" style="width: 150px;"/>
		            		<input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>操作日期：</span></td>
				      	<td >
						 <input class="nui-datepicker" name="criteria._expr[3]._min" style="width:100px"/>-<input class="nui-datepicker" name="criteria._expr[3]._max"  id="maxdatepicker" style="width:100px"/>
						 <input class="nui-hidden" name="criteria._expr[3]._property" value="operatetime"/>
						 <input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
						 <input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
					  	</td>
					</tr>
					<tr>
						<td align="right"><span>操作人：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[4].operator" style="width: 150px;"/>
					        <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
					    </td>
						<td align="right"><span>变更前属性值：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[5].beforevalue" style="width: 150px;"/>
					        <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
					    </td>
					    <td align="right"><span>变更后属性值：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[6].aftervalue" style="width: 150px;"/>
					        <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
					    </td>
					</tr>
					<tr>
						<td align="right"><span>属性描述：</span></td>
		            	<td>
		            		<input class="nui-textbox" name="criteria._expr[2].propertydesc" style="width: 150px;"/>
		            		<input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
					        <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
					    </td>
					    <td align="center" colspan="4">
                            <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>	
				        	<a class="nui-button" id="exportAmeMainBuss" iconCls="icon-download" onclick="exportAmeMainBuss()">导出</a>
                       </td>
					</tr>
	            </table>           
	        </div>
	    </div>
	    <div id="datagrid1" class="nui-datagrid" style="width:auto;height:335px;" allowResize="true" dataField="ameMainBussInfos" url="com.primeton.eos.ame_common.ameMainBussInfo.ameMainBusslist.biz.ext"
	    	 sizeList="[10,20,50,100]"  multiSelect="true" showSummaryRow="true" allowCellWrap="true">
			<div property="columns">
				<div field="operator" width="45" align="center" headerAlign="center" allowSort="true">操作人员</div>	
				<div field="bussdesc" width="50" headerAlign="center" align="center" allowSort="true">业务描述</div>
		        <div field="uniqnum" width="50" align="center" headerAlign="center" allowSort="true">业务唯一识别号</div>
		        <div field="propertydesc" width="80"  align="left" headerAlign="center" align="center" allowSort="true">属性描述</div>
		        <div field="beforevalue" width="50" headerAlign="center"align="left" allowSort="true">变更前属性值</div>
		        <div field="aftervalue" width="50" headerAlign="center" align="left" allowSort="true">变更后属性值</div>
				<div field="operatetime" width="75" align="center" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm:ss" allowSort="true">操作时间</div>
			</div>
		</div>
	</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	var form = new nui.Form("#form1");
	init();
	function init(){
		grid.load();
		grid.sortBy("operatetime","desc");
	}
	 
	function search() {	    		
		var str = nui.get("maxdatepicker").getValue();
		if(str!=null || str!=""){
			var strDate = str.substring(0,10)+" 23:59:59";
			nui.get("maxdatepicker").setValue(strDate);
		}
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
	}
	
	function exportAmeMainBuss(){
		if(!confirm("是否确认导出？")){
			return;
		}
		var data = form.getData();
		var json =  nui.encode(data);
		nui.ajax({
			url: "com.primeton.eos.ame_common.ameMainBussInfo.exportAmeMainBuss.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "amemainbuss";
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
	function reset(){
		form.reset();
		init();
	}
</script>
</html>