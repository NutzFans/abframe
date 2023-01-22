<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): wyy
  - Date: 2016-06-14 16:04:18
  - Description:
-->
<head>
<title>操作日志查询</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
	<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
	<input type="hidden" name="downloadFile" filter="false"/>
	<input type="hidden" name="fileName" filter="false"/>
</form>
<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
	<div style="width:100%;">
        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
            <legend>操作日志列表</legend>
        </div>
    </div>
	<div class="nui-toolbar"style="border-bottom:0;padding:0px;">
			 <table style="width:100%;">
			 	<tr>
			 		<td align="right"><span>操作人:</span></td>
            		<td align="left">
					    <input name="criteria._expr[0]._value" class="nui-textbox"  style="width:110px;"/>
					    <input class="nui-hidden" name="criteria._expr[0]._property" value="operator"/>
					    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
				    </td>
				    <td align="right"><span>功能模块:</span></td>
            		<td align="left">
					    <input name="criteria._expr[1]._value" class="nui-textbox"  style="width:110px;"/>
					    <input class="nui-hidden" name="criteria._expr[1]._property" value="operatefuncmo"/>
					    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
				    </td>
				    <td align="right"><span>操作日期:</span></td>
				    <td align="left">
					    <input class="nui-datepicker" name="criteria._expr[2]._min" style="width:100px"/>
	            		<input class="nui-datepicker" name="criteria._expr[2]._max" style="width:100px" id="maxdatepicker"/>
				        <input class="nui-hidden" name="criteria._expr[2]._property" value="operatetime"/>
					    <input class="nui-hidden" name="criteria._expr[2]._op" value="between"/>
				        <input class="nui-hidden" name="criteria._expr[2]._pattern" value="yyyy-MM-dd HH:mm:ss"/>
					</td> 
					</tr>
					<tr>
					<td align="right"><span>操作类型:</span></td>
					<td align="left">
					    <input name="criteria._expr[3]._value" shownullItem="true" class="nui-dictcombobox" dictTypeId="AME_OPERATETYPE" style="width:110px;"/>
					    <input class="nui-hidden" name="criteria._expr[3]._property" value="operatetype"/>
					    <input class="nui-hidden" name="criteria._expr[3]._op" value="="/>
				    </td>
			 	    <td align="right"><span>操作功能:</span></td>
            		<td align="left">
					    <input name="criteria._expr[4]._value" class="nui-textbox"  style="width:110px;"/>
					    <input class="nui-hidden" name="criteria._expr[4]._property" value="operatefunc"/>
					    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
				    </td>
				    <!--<td colspan="4"></td>-->
				    <td align="right"><span>操作信息:</span></td>
            		<td align="left">
					    <input name="criteria._expr[5]._value" class="nui-textbox"  style="width:110px;"/>
					    <input class="nui-hidden" name="criteria._expr[5]._property" value="operateinfo"/>
					    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
				    </td>
			 	</tr>
		 	</table>
			 <table style="width:90%;">
	            <tr>
	                <td align="center" style="width:100%;">
	                    <a class="nui-button" iconCls="icon-search" onclick="search()">查找</a>
	                    <a id="lookbutton" class="nui-button" iconCls="icon-edit" onclick="backups()">备份</a>
	                    <a id="upbutton" class="nui-button" iconCls="icon-download" onclick="exports()">导出</a>
	                </td>
	            </tr>
	        </table>
	</div>
</div>
	<div style="width:100%;height:85%;" showToolbar="false" showFooter="false" >
		<div id="datagrid1" class="nui-datagrid" style="width:100%;height:400px;" allowCellWrap="true" allowResize="true" dataField="AmeOperatlog" url="com.primeton.eos.ame_common.AmeOperatlog.QueryOperatlog.biz.ext" sizeList="[10,20,50,100]" pageSize="20" idField="appid" multiSelect="true" onload = "getTotal">
			<div property="columns">
				<div field="operator" width="45" align="center" headerAlign="center" allowSort="true">操作人员</div>	
				<div field="userid" width="45" align="center" headerAlign="center" allowSort="true">操作人员登录名</div>
				<div field="operatefuncmo" width="75" align="center" headerAlign="center" allowSort="true">功能模块</div>
				<div field="operatefunc" width="75" align="center" headerAlign="center" allowSort="true">操作功能</div>	
				<div field="operatetype" width="45" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">操作类型</div>
				<div field="operateinfo" width="175" align="left" headerAlign="center" allowSort="true">操作信息</div>
				<div field="operatetime" width="75" align="center" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm:ss" allowSort="true">操作时间</div>
			</div>
		</div>
	</div>	
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	init();
	function init(){
		grid.load();
		grid.sortBy("operatetime","desc");
	}
	 
	function search() {	    		
		var form = new nui.Form("#form1");
		var str = nui.get("maxdatepicker").getValue();
		if(str!=null || str!=""){
			var strDate = str.substring(0,10)+" 23:59:59";
			nui.get("maxdatepicker").setValue(strDate);
		}
		//str = str.replace(/-/g,"/");
		//var date = new Date(str);
		//var newDate=new Date(date.setDate(date.getDate()+1)); 
		//nui.get("maxdatepicker").setValue(FormatDate(newDate));
		
		var data = form.getData(); //获取表单JS对象数据
	  	grid.load(data); //datagrid加载数据
	}
	function FormatDate (date) {
	    return date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	}
	//备份
	function backups(){
		if(confirm("备份将对符合条件的数据存入备份表，同时在当前数据表中删除符合条件的数据，是否确定？")){
			var form = new nui.Form("#form1"); 
			var data = form.getData(); //获取表单JS对象数据
			var json = nui.encode(data);
			nui.ajax({
	            url: "com.primeton.eos.ame_common.AmeOperatlog.backups.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	alert("备份成功");
	            	 location.reload() 
	            	//CloseWindow("saveSuccess");
	            }
	 		});
 		}else{
 			return;
 		}
	}
	
	function exports(){
	 	//导出前检查是否超出最大条数
	 	if(totals==0){
		 	nui.alert("请查询出数据后导出!");
		 	return false;
		 }else{
		 	nui.ajax({
		 		url: "com.primeton.eos.ame_common.ame_common.getResultLimit.biz.ext",
	                type: "post",
	                cache: false,
	                contentType: 'text/json',
	                async:false, 
	                success: function (o) {
	                	var limits = o.limitcount;
	                	if(limits != -1){
	                		if(totals>limits){
	                			nui.alert("超过系统配置的最大导出条数"+limits+"，无法导出！");
	                			return false;
	                		}else{
	                			exports1();
	                		}
	                	}else{
	                		exports1();
	                	}
	                }
		 	})
		 }
	}
	//导出
	function exports1(){
		if(confirm("是否将符合查询条件的操作日志导出到Excel文件中？")){
			 var form = new nui.Form("#form1");
	         var json = form.getData();
				nui.ajax({
	                url: "com.primeton.eos.ame_common.AmeOperatlog.exportLog.biz.ext",
	                type: "post",
	                data: json,
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	             		nui.unmask();
	                	if(o.result=='-1'){
	                		nui.alert("超过系统配置的最大导出条数"+limitcount+"，无法导出！");
	                	}
	                	var filePath = o.downloadFile;
	                	var fileName = "operatLog";
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
	    }else{
	    	return;
	    }
    } 
	//设置业务字典
	function dictGetType(e){
		return nui.getDictText('AME_OPERATETYPE',e.value);
	}
	
	//数据加载成功后获取数据总条数
	var totals=0;
	function getTotal(e){
		totals = e.total;
	}
</script>
</body>
</html>