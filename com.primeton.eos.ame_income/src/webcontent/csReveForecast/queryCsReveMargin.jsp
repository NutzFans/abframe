<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<%@ page import="com.eos.data.datacontext.UserObject" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2018-11-22 15:23:34
  - Description:
-->
<head>
<title>合同收入确认差异查询</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div  class="mini-panel" title="收入确认差异查询" width="auto">
		<div style="width:100%;height:20;padding:0px;margin:0px;"id="form1">
			<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
				<table style="width:100%;">
					<tr>
						<td align="right"><span>收入确认年月：</span></td>
						<td align="left">
							<input name="manage.startdate" class="nui-monthpicker" style="width:80px;" id="startdate" allowInput="true"/>-<input name="manage.enddate" class="nui-monthpicker" style="width:80px;" id="enddat" allowInput="true"/>
					    </td>
					    <td align="right"><span>合同编号：</span></td>
		            	<td align="left">
		            		<input name="manage.contnum" class="nui-textbox" style="width:162px;"/>
		            	</td>
					    <td align="right"><span>销售：</span></td>
		            	<td align="left">
		            		<input name="manage.salename" class="nui-textbox" style="width:162px;"/>
		            	</td>
					    <td align="right"><span>客户名称：</span></td>
		            	<td align="left">
		            		<input name="manage.custname" class="nui-textbox" style="width:162px;"/>
		            	</td>
					</tr>
					<tr>
		            	<td align="right"><span>事业部：</span></td>
		            	<td align="left">
		            		<input class="nui-dictcombobox" dictTypeId="CONT_ORG" name="manage.org" multiSelect="true" style="width:162px" showNullItem="true"/>
		            	</td>
					    <td align="right"><span>合同名称：</span></td>
		            	<td align="left">
		            		<input name="manage.projectname" class="nui-textbox" style="width:162px;"/>
		            	</td>
		            	<td align="left"  colspan="2">
		            		<input class="nui-checkbox" id="iszero" onvaluechanged="changeiszero" style="width:80px" text="去掉收入差额为'0'的合同" />
		            		<input name="manage.iszero" id="iszero1" class="nui-hidden"/>
						</td>
		            	<td align="center" colspan="2">
		            		<a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查找</a>
                            <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
                            <a class="nui-button" onclick="exportCsReveMargin" iconCls="icon-download"  id="exportButton">导出</a>
	                        <form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
								<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
								<input type="hidden" name="downloadFile" filter="false"/>
								<input type="hidden" name="fileName" filter="false"/>
							</form>
		            	</td>
					</tr>
				</table>
			</div>
		</div>
		
		<div id="form2" style="display: none;">
			<input class="nui-hidden" name="criteria._or[1]._expr[0]._property" value="status"/>
	        <input class="nui-hidden" name="criteria._or[1]._expr[0]._op" value="in"/>
	        <input class="nui-hidden" name="criteria._or[1]._expr[0]._value" value="6,7,8"/>
	        
			<input class="nui-hidden" name="criteria._or[1]._and[0]._expr[0]._property" value="confirmday"/>
	        <input class="nui-hidden" name="criteria._or[1]._and[0]._expr[0]._opProperty" value="<>"/>
	        <input class="nui-hidden" name="criteria._or[1]._and[0]._expr[0]._value" value="maconfirmday"/>
	        
			<input class="nui-hidden" name="criteria._or[1]._and[0]._expr[1]._property" value="status"/>
	        <input class="nui-hidden" name="criteria._or[1]._and[0]._expr[1]._op" value="in"/>
	        <input class="nui-hidden" name="criteria._or[1]._and[0]._expr[1]._value" value="3"/>
	        
			<input class="nui-hidden" name="criteria._or[0]._expr[0]._property" value="confirmday"/>
	        <input class="nui-hidden" name="criteria._or[0]._expr[0]._op" value="between"/>
	        <input name="criteria._or[0]._expr[0]._min" class="nui-hidden" id="newyearmonthmin" />-<input name="criteria._or[0]._expr[0]._max" class="nui-hidden" id="newyearmonthmax"/>
	        
	        <input class="nui-hidden" name="criteria._or[0]._expr[1]._property" value="maconfirmday"/>
	        <input class="nui-hidden" name="criteria._or[0]._expr[1]._op" value="between"/>
	        <input name="criteria._or[0]._expr[1]._min" class="nui-hidden" id="newyearmonthmin1" />-<input name="criteria._or[0]._expr[1]._max" class="nui-hidden" id="newyearmonthmax1"/>
	        
		    <input class="nui-hidden" name="criteria._expr[1]._property" value="contnum"/>
		    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
		    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
		    <input name="criteria._expr[1]._value" class="nui-hidden" id="contnum"/>
		    
		    <input class="nui-hidden" name="criteria._expr[2]._property" value="salename"/>
		    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
		    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
		    <input name="criteria._expr[2]._value" class="nui-hidden" id="salename"/>
		    
		    <input class="nui-hidden" name="criteria._expr[3]._property" value="custname"/>
		    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
		    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
		    <input name="criteria._expr[3]._value" class="nui-hidden" id="custname"/>
		    
			<input class="nui-hidden" name="criteria._expr[4]._property" value="org"/>
	        <input class="nui-hidden" name="criteria._expr[4]._op" value="in"/>
	        <input class="nui-hidden" name="criteria._expr[4]._value" id="org"/>
	        
	        <input class="nui-hidden" name="criteria._expr[0]._property" value="projectname"/>
		    <input class="nui-hidden" name="criteria._expr[0]._op" value="like"/>
		    <input class="nui-hidden" name="criteria._expr[0]._likeRule" value="all"/>
		    <input name="criteria._expr[0]._value" class="nui-hidden" id="projectname"/>
		    
	       <%-- <input class="nui-hidden" name="criteria._expr[6]._property" value="confirmday"/>
	        <input class="nui-hidden" name="criteria._expr[6]._opProperty" value="<>"/>
	        <input class="nui-hidden" name="criteria._expr[6]._value" value="maconfirmday"/>--%>
		</div>
		
		<div style="width:100%;">
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	                <tr>
	                    <td style="width:10%;">
	                        <a class="nui-button" id="exportinfo" iconCls="icon-download" onclick="exportCsReveForecast()">导出合同收入数据</a>     
	                    </td>
	                </tr>
	            </table>           
	        </div>
	    </div>
		
		<div id="datagrid1" class="nui-datagrid" style="width:100%;height:440px;" allowResize="true" dataField="csReveMargin" pageSize="20" allowResize="true" showSummaryRow="true" ondrawsummarycell="doCsReveSum"
	    url="com.primeton.eos.ame_income.csReveForecast.queryCsReveMargin.biz.ext" frozenStartColumn="0" frozenEndColumn="2"
	    >
			<div property="columns">
				<div field="contnum" width="70" align="center" headerAlign="center" allowSort="true" renderer="onContnumRenderer">合同编号</div> 
				<div field="projectname" width="180" align="center"  headerAlign="center" allowSort="true" renderer="renderprojectname">合同项目名称</div>
				<div field="contsum" width="100" align="right"  headerAlign="center" allowSort="true" dataType="currency" summaryType="sum" currencyUnit="￥">合同金额</div>
				<div field="custjc" width="150" align="center" headerAlign="center" allowSort="true">客户名称</div>
				<div field="salename" width="70" align="center" headerAlign="center" allowSort="true">受益销售</div>
				<div field="org" width="95" align="center" headerAlign="center" renderer="dictOrg" allowSort="true">事业部</div>
				<div field="syqname" width="95" align="center" headerAlign="center" allowSort="true">事业群</div>
				<div field="BHSFinActsum" width="150" align="right" headerAlign="center" dataType="currency" allowSort="true"  summaryType="sum" currencyUnit="￥">财报确认金额（不含税）</div>	
				<div field="BHSManActsum" width="150" align="right" headerAlign="center" dataType="currency" allowSort="true" summaryType="sum" currencyUnit="￥">管报确认金额（不含税）</div>	
				<div field="MarginActsum" width="140" align="right" headerAlign="center" dataType="currency" allowSort="true" summaryType="sum" currencyUnit="￥">收入差额（不含税）</div>	
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	var form2 = new nui.Form("#form2");
	var grid = nui.get("datagrid1");
	init();//页面初始化
	function init(){
		nui.get("iszero").setValue(true);
		nui.get("iszero1").setValue(0);
		var data = form.getData();
		data.isExport = 'false';
		if(!(data.manage.enddate==null || data.manage.enddate=='')){
			data.manage.enddate=getLastDay(data.manage.enddate.getFullYear(),data.manage.enddate.getMonth()+1);
		}
		grid.load(data);
	}
	
	//查询
	function search(){
		var data = form.getData();
		data.isExport = 'false';
		if(!(data.manage.enddate==null || data.manage.enddate=='')){
			data.manage.enddate=getLastDay(data.manage.enddate.getFullYear(),data.manage.enddate.getMonth()+1);
		}
		grid.load(data);
	}
	
	//重置
	function reset(){
		form.reset();
		init();
	}
	
	//查看合同详细信息
    function onContnumRenderer(e) {
		return "<a href='javascript:void(0)' onclick='doView();' title='点击查看'>" + e.value + "</a>";
	}
	function doView(){//查看合同明细
		var selectRow = grid.getSelected();
		if(!selectRow){
			nui.alert("请选择其中一条合同数据!");
			return;
		}
		var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
		window.open(executeUrl);
	}
	
	//汇总行样式设置
	function doCsReveSum(e){
		if (e.field == "contsum" || e.field == "BHSFinActsum" || e.field == "BHSManActsum" || e.field == "MarginActsum") {
            e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
        }
	}
	
	//导出
	function exportCsReveMargin(){
		var data = form.getData();
		data.isExport = 'true';
		if(!(data.manage.enddate==null || data.manage.enddate=='')){
			data.manage.enddate=getLastDay(data.manage.enddate.getFullYear(),data.manage.enddate.getMonth()+1);
		}
		nui.confirm("确认导出合同收入确认差异记录？", "确定？",
			function (action) {
				if(action=='ok'){
					nui.ajax({
		    			url: "com.primeton.eos.ame_income.csReveForecast.queryCsReveMargin.biz.ext",
				        type: "post",
				        data: data,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		nui.unmask();
				     		var filePath = o.downloadFile;
				        	var fileName = "合同收入确认差异记录";
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
	 		}
		 )
	}
	
	//导出合同收入数据
	function exportCsReveForecast(){
		var data1 = form.getData();
		//确认日期年月赋值
		nui.get("newyearmonthmin").setValue(data1.manage.startdate);
		nui.get("newyearmonthmin1").setValue(data1.manage.startdate);
		if(!(data1.manage.enddate == null || data1.manage.enddate=='')){
			nui.get("newyearmonthmax").setValue(getLastDay(data1.manage.enddate.getFullYear(),data1.manage.enddate.getMonth()+1));
			nui.get("newyearmonthmax1").setValue(getLastDay(data1.manage.enddate.getFullYear(),data1.manage.enddate.getMonth()+1));
		}
		//合同编号赋值
		nui.get("contnum").setValue(data1.manage.contnum);
		//受益人赋值
		nui.get("salename").setValue(data1.manage.salename);
		//客户名称赋值
		nui.get("custname").setValue(data1.manage.custname);
		//事业部赋值
		nui.get("org").setValue(data1.manage.org);
		//合同名称赋值
		nui.get("projectname").setValue(data1.manage.projectname);
		var data = form2.getData();
		nui.confirm("确认导出合同收入记录？", "确定？",
			function (action) {
				if(action=='ok'){
					nui.ajax({
		    			url: "com.primeton.eos.ame_income.csReveForecast.exportCsReveForecast.biz.ext",
				        type: "post",
				        data: data,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		nui.unmask();
				     		var filePath = o.downloadFile;
				        	var fileName = "合同收入记录";
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
	 		}
		 )
	}
	
	//得到月份最后一天
	function getLastDay(year,month)   
	{   
		 var new_year = year;  //取当前的年份   
		 var new_month = month++;//取下一个月的第一天，方便计算（最后一天不固定）   
		 if(month>12)      //如果当前大于12月，则年份转到下一年   
		 {   
		 new_month -=12;    //月份减   
		 new_year++;      //年份增   
		 }   
		 var new_date = new Date(new_year,new_month,1);        //取当年当月中的第一天   
		 return new Date(new_date.getTime()-1000*60*60*24);//获取当月最后一天日期   
	}
	
	//是否去掉差额为0的合同
	function changeiszero(){
		var iszero = nui.get("iszero").getValue();
		if(iszero == false || iszero == "false"){
			nui.get("iszero1").setValue(null);
		}else if(iszero == true || iszero == "true"){
			nui.get("iszero1").setValue(0);
		}
	}
	
	//事业部业务字典
	function dictOrg(e){
		return nui.getDictText('CONT_ORG',e.value);
	}
</script>
</html>