<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/nui/common.jsp"%>
<html>
<!-- 
  - Author(s): shihao
  - Date: 2016-11-21 14:33:26
  - Description:
-->
<head>
<title>MA合同收入记录拆分</title>
<script src="<%= request.getContextPath() %>/common/nui/locale/zh_CN.js" type="text/javascript"></script>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
	<!-- 1、在合同增加页面的收入记录列表上增加一个按钮“MA收入分拆”
	2、点击弹出窗口，显示MA合同金额（缺省为合同额，可编辑），合同签订日期，MA开始日期，MA结束日期，分拆周期(按月分拆、按季度分拆）
	3、点击下面下方“分拆”按钮：提示是否进行分拆，确定情况下，将结合开始日期、签订日期、结束日期和
		分拆周期的选择情况计算分拆成多少条收入记录，写入到增加合同页面的收入记录列表，弹出窗口关闭 -->
	<div id="form1">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>MA合同收入信息</legend>
   			<div>
		 		<input id="contsum" class="nui-hidden" />
		 		<input id="oldReveLength" class="nui-hidden" />
			 	<table border="0" cellpadding="1" cellspacing="1" style="width:95%;height:70%;
			 		table-layout:fixed;border-collapse:separate;">
			 		<tr>
			 			<td style="width:100px" align="right">MA金额:</td>
			 			<td>
			 				<input id="masum" style="width: 100px" class="nui-textbox" name="csReveForecast.masum" inputStyle="text-align: right" required="true"/> 
			 			</td>
			 			<td style="width:80px" align="right">合同签订日期:</td>
			 			<td>
			 				<input id="signDate" style="width: 100px" class="nui-datepicker" name="csReveForecast.signDate" required="true"/> 
			 			</td>
			 		</tr>
			 		<tr>
			 			<td style="width:80px" align="right">MA开始日期:</td>
			 			<td> 
			 				<input id="startDate" style="width: 100px" class="nui-datepicker"  name="csReveForecast.startDate" required="true"/> 
			 			</td>
			 			<td style="width:80px" align="right">MA结束日期:</td>
			 			<td> 
			 				<input id="endDate" style="width: 100px" class="nui-datepicker"  name="csReveForecast.endDate" required="true"/> 
			 			</td>
			 		</tr>
			 		<tr>
			 			<td style="width:80px" align="right">分拆周期:</td>
			 			<td>
							<input class="nui-dictcombobox" data="[{id:'1',text:'按月拆分'}, {id:'2', text: '按季拆分'}]" 
	                        	required="true" name="csReveForecast.cycle" textField="text" valueField="id"
								id="cycle" style="width: 100px" />
			 			</td>
			 			<td></td><td></td>
			 		</tr>
			 	</table>
			 	<div class="nui-toolbar" style="padding:0px;margin-top: 80px" borderStyle="border:0;">
					<table width="100%" >
						<tr>
							<td style="text-align:center;">
								<a class="nui-button" iconCls="icon-ok" onclick="split">拆分</a>
								<span style="display:inline-block;width:25px;"></span>
								<a class="nui-button" iconCls="icon-cancel" onclick="onCancel">取消</a>
							</td>
						</tr>
				    </table>
				</div>
			</div>
		</fieldset>
	</div>
	<script type="text/javascript">
	    nui.parse();
	    var form = new nui.Form("#form1");
	    
	    //设置数据 signdate,
	    function SetData(masum,signDate,startDate,endDate,contsum,oldReveLength){
	    	nui.get("masum").setValue(masum);
	    	nui.get("signDate").setValue(signDate);
	    	nui.get("startDate").setValue(startDate);
	    	nui.get("endDate").setValue(endDate);
	    	nui.get("contsum").setValue(contsum);
	    	nui.get("oldReveLength").setValue(oldReveLength);
	    	//默认为按月拆分
	    	nui.get("cycle").setValue("1");
	    }
	    
	    //获取月份的天数
	    function getMonthDays(myYear,myMonth){
	        var monthStartDate = new Date(myYear, myMonth-1, 1);
	        var monthEndDate = new Date(myYear, myMonth, 1);
	        var days = (monthEndDate - monthStartDate)/(1000 * 60 * 60 * 24);
	        return days;
	    }
	    //拆分
	    function split(){
	    	if(!form.validate()){
	    		nui.alert("信息录入不完整！");
	    		return;
	    	}
	    	CloseWindow("ok");
	    }
	    
	    function GetData(){
	    	var reveObject = new Object();
	    	var data = [];
	    	//已存在的收入记录条数
	    	var oldReveLength = nui.get("oldReveLength").getValue();
	    	//合同金额
	    	var contsum = nui.get("contsum").getValue();
	    	//ma金额
	    	var masum = nui.get("masum").getValue();
	    	//签订日期
	    	var signDate = nui.get("signDate").getValue();
	    	//MA开始日期
	    	var startDate = nui.get("startDate").getValue();
	    	//MA结束日期
	    	var endDate = nui.get("endDate").getValue();
	    	//分拆周期
	    	var cycle = nui.get("cycle").getValue();
	    	//开始年份
	    	var firstYear;
	    	//开始月份
	    	var firstMonth;
	    	//开始季度月份
	    	var firstQuarterMonth;
	    	//开始天
	    	var firstDay;
	    	//签订日期距MA开始日期相差月份
	    	var MAstartmonth;
	    	//签订日期距MA结束日期相差月份
	    	var MAendmonth;
	    	//MA开始日期距MA结束日期相差月份
	    	var MAmonth;
	    	
	    	var sYear = startDate.substr(0,4);		//MA开始的年份
    		sYear = parseInt(sYear);
    		var eYear = endDate.substr(0,4);		//MA结束的年份
    		eYear = parseFloat(eYear);
    		var signYear = signDate.substr(0,4);	//合同签订的年份
    		signYear = parseFloat(signYear);
    		
    		var sMonth = startDate.substr(5,2);		//MA开始的月份
    		sMonth = parseFloat(sMonth);
    		var eMonth = endDate.substr(5,2);		//MA结束的月份
    		eMonth = parseFloat(eMonth);
    		var signMonth = signDate.substr(5,2);	//合同签订的月份
    		signMonth = parseFloat(signMonth);
    		
    		var sDay = startDate.substr(8,2);		//MA开始的日
    		sDay = parseFloat(sDay);
    		var signDay = signDate.substr(8,2);		//签订开始的日
    		signDay = parseFloat(signDay);
    		
    		//月份总条数
    		var sumdatalength = 0;
	    	//需要统计的月份条数
	    	var datalength = 0;
	    	//需要统计的季度条数
	    	var quarterdatalength = 0;
	    	//如果签订日期大于MA开始日期，那么从开始日期到签订日期算做一笔收入。
	    	if(cycle == "1"){	//按月度
	    		datalength += 1;
	    		sumdatalength += 1;
	    		if(signDate > startDate){
		    		MAstartmonth = (signYear*12+signMonth)-(sYear*12+sMonth)+1;
		    		MAendmonth = (eYear*12+eMonth)-(signYear*12+signMonth);
		    		MAmonth = MAstartmonth+MAendmonth;
		    		//签订日期到结束日期N条
		    		var maxEMonth = parseFloat((eYear - signYear) * 12) + eMonth;	//结束的最大月份
		    		datalength += (maxEMonth - signMonth);
		    		firstYear = signYear;
		    		firstMonth = signMonth;
		    		firstDay = signDay;
		    		sumdatalength += (maxEMonth - sMonth);
		    	}else{
		    		MAstartmonth=1;
		    		MAendmonth=1;
		    		MAmonth = (eYear*12+eMonth)-(sYear*12+sMonth)+1;
		    		//开始日期到结束日期N条
		    		var maxEMonth = parseFloat((eYear - sYear) * 12) + eMonth;	//结束的最大月份
		    		datalength += (maxEMonth - sMonth);
		    		firstYear = sYear;
		    		firstMonth = sMonth;
		    		firstDay = sDay;
		    		sumdatalength += (maxEMonth - signMonth);
		    	}
	    		var oldsum = 0;
	    		var leastSum = 0;
		    	for(var i = 0;i < datalength;i ++){
		    		var yearmonth;
		    		var newyearmonth;
		    		if((firstMonth + i) > 12){	//当前年之后
		    			var firstYearAdd = (firstMonth + i)%12 == 0 ? Math.floor((firstMonth + i)/12) - 1 : Math.floor((firstMonth + i)/12);
		    			var firstMonthAdd = (firstMonth + i)%12 == 0 ? 12 : (firstMonth + i)%12;
		    			if(0 < ((firstMonth + i) % 12) && ((firstMonth + i) % 12) < 10){
		    				yearmonth = (firstYear + firstYearAdd) + "-0" + parseFloat(firstMonthAdd);
		    				newyearmonth = (firstYear + firstYearAdd) + "-0" + parseFloat(firstMonthAdd);
		    			}else{
		    				yearmonth = (firstYear + firstYearAdd) + "-" + parseFloat(firstMonthAdd);
		    				newyearmonth = (firstYear + firstYearAdd) + "-" + parseFloat(firstMonthAdd);
		    			}
		    		}else{
		    			if(firstMonth + i < 10){
		    				yearmonth = firstYear + "-0" + parseFloat(firstMonth + i);
			    			newyearmonth = firstYear + "-0" + parseFloat(firstMonth + i);
		    			}else{
			    			yearmonth = firstYear + "-" + parseFloat(firstMonth + i);
			    			newyearmonth = firstYear + "-" + parseFloat(firstMonth + i);
		    			}
		    		}
		    		datalength = parseFloat(datalength);
		    		var reveno = "";
		    		var reveno1 = datalength + oldReveLength;
		    		var reveno2 = i + 1 + oldReveLength;
		    		if(reveno2 < 10){
		    			reveno = reveno1 + "-0" + reveno2;
		    		}else{
		    			reveno = reveno1 + "-" + reveno2;
		    		}
		    		var maOrFcSum = 0;
		    		var fcreverate = 0;
		    		if(i == 0){		//第一笔
		    			//取第一个月的总天数*一个月的拆分金额
		    			//第一个月的总天数
		    			var firstDays = 0;
		    			//第一个月的实际天数
		    			var realDays = 0;
		    			var myYear = firstYear;
		    			var myMonth = firstMonth;
		    			firstDays = getMonthDays(myYear,myMonth);
		    			var monthStartDate = new Date(myYear, myMonth-1, firstDay);
				        var monthEndDate = new Date(myYear, myMonth, 1);
				        realDays = (monthEndDate - monthStartDate)/(1000 * 60 * 60 * 24);
		    			maOrFcSum =  parseFloat(masum/MAmonth*MAstartmonth).toFixed(2);	
		    			oldsum += parseFloat(parseFloat(masum/sumdatalength*(sumdatalength - datalength + 1)/firstDays*realDays).toFixed(2));
		    			fcreverate = parseFloat(masum/sumdatalength*(sumdatalength - datalength + 1)/firstDays*realDays/contsum).toFixed(4);
		    			leastSum = parseFloat(parseFloat(maOrFcSum).toFixed(2));
		    		}else if(i == (datalength - 1)){		//最后一笔的金额 = 总金额 - 之前的金额 
		    			maOrFcSum = parseFloat(masum-leastSum).toFixed(2);
		    			fcreverate = parseFloat((masum - oldsum)/contsum).toFixed(4);
		    		}else{
			    		maOrFcSum = parseFloat(masum/MAmonth).toFixed(2);
			    		oldsum += parseFloat(parseFloat(masum/sumdatalength).toFixed(2));
			    		fcreverate = parseFloat(masum/sumdatalength/contsum).toFixed(4);
			    		leastSum = parseFloat(leastSum) + parseFloat(maOrFcSum);
		    		}
		    		data[i] = {name: "New Row","reveno": reveno,"revetype": "2","reveproof": "10",
		    			"revetimedesc": "按月等比确认","yearmonth": yearmonth,"newyearmonth": newyearmonth,
		    			"masum": maOrFcSum,"status": "0","saleseva": "0",
		    			"fcsum": maOrFcSum,"newtype": "2","monthperiod":"2","newmonthperiod": "2",
		    			"fcreverate": fcreverate};
		    	} 
	    	}else if(cycle == "2"){	//按季度
	    		datalength += 1;
	    		sumdatalength += 1;
	    		if(signDate > startDate){	//签订日期大于开始日期 
		    		//签订日期到结束日期N条
		    		var maxEMonth = parseFloat((eYear - signYear) * 12) + eMonth;	//结束的最大月份
		    		firstYear = signYear;
		    		firstMonth = signMonth;
		    		firstDay = signDay;
		    		datalength += (maxEMonth - signMonth);
	    			sumdatalength += (maxEMonth - sMonth);
		    		if(signMonth % 3 == 0){
		    			firstQuarterMonth = signMonth;
		    			quarterdatalength += Math.ceil((maxEMonth - signMonth + 3)/3);
		    		}else if((signMonth + 1) % 3 == 0){
		    			firstQuarterMonth = signMonth + 1;
		    			quarterdatalength += Math.ceil((maxEMonth - signMonth + 2)/3);
		    		}else if((signMonth + 2) % 3 == 0){
		    			firstQuarterMonth = signMonth + 2;
		    			quarterdatalength += Math.ceil((maxEMonth - signMonth + 1)/3);
		    		}
		    	}else{
		    		//开始日期到结束日期N条
		    		var maxEMonth = parseFloat((eYear - sYear) * 12) + eMonth;	//结束的最大月份
	    			firstYear = sYear;
    				firstMonth = sMonth;
		    		firstDay = sDay;
		    		datalength += (maxEMonth - sMonth);
		    		sumdatalength += (maxEMonth - signMonth);
		    		if(sMonth % 3 == 0){
		    			firstQuarterMonth = sMonth;
		    			quarterdatalength += Math.ceil((maxEMonth - sMonth + 3)/3);
		    		}else if((sMonth + 1) % 3 == 0){
		    			firstQuarterMonth = sMonth + 1;
		    			quarterdatalength += Math.ceil((maxEMonth - sMonth + 2)/3);
		    		}else if((sMonth + 2) % 3 == 0){
		    			firstQuarterMonth = sMonth + 2;
		    			quarterdatalength += Math.ceil((maxEMonth - sMonth + 1)/3);
		    		}
		    	}
	    		var oldsum = 0;
		    	for(var i = 0;i < quarterdatalength;i ++){
		    		var yearmonth;
		    		var newyearmonth;
		    		if((firstQuarterMonth + i*3) > 12){	//当前年之后
		    			var firstYearAdd = (firstQuarterMonth + i*3)%12 == 0 ? Math.floor((firstQuarterMonth + i*3)/12) - 1 : Math.floor((firstQuarterMonth + i*3)/12);
		    			var firstMonthAdd = (firstQuarterMonth + i*3)%12 == 0 ? 12 : ((firstQuarterMonth + i*3)%12);
		    			if(0 < ((firstQuarterMonth + i*3) % 12) && ((firstQuarterMonth + i*3) % 12) < 10){
		    				yearmonth = (firstYear + firstYearAdd) + "-0" + parseFloat(firstMonthAdd);
		    				newyearmonth = (firstYear + firstYearAdd) + "-0" + parseFloat(firstMonthAdd);
		    			}else{
		    				yearmonth = (firstYear + firstYearAdd) + "-" + parseFloat(firstMonthAdd);
		    				newyearmonth = (firstYear + firstYearAdd) + "-" + parseFloat(firstMonthAdd);
		    			}
		    		}else{
		    			if(parseFloat(firstQuarterMonth + i*3) < 10){
		    				yearmonth = firstYear + "-0" + parseFloat(firstQuarterMonth + i*3);
			    			newyearmonth = firstYear + "-0" + parseFloat(firstQuarterMonth + i*3);
		    			}else{
			    			yearmonth = firstYear + "-" + parseFloat(12);
			    			newyearmonth = firstYear + "-" + parseFloat(12);
		    			}
		    		}
		    		datalength = parseFloat(datalength);
		    		quarterdatalength = parseFloat(quarterdatalength);
		    		var reveno = "";
		    		var reveno1 = quarterdatalength + oldReveLength;
		    		var reveno2 = (i + 1) + oldReveLength;
		    		if(reveno2 < 10){
		    			reveno = reveno1 + "-0" + reveno2;
		    		}else{
		    			reveno = reveno1 + "-" + reveno2;
		    		}
		    		
		    		var maOrFcSum = 0;
		    		var fcreverate = 0;
		    		if(i == 0){		//第一个季度
		    			//第一个季度 = 第一个月的天数 + 第一季度的剩下的月 
		    			//第一个月的总天数
		    			var firstDays = 0;
		    			//第一个月的实际天数
		    			var realDays = 0;
		    			var myYear = firstYear;
		    			var myMonth = firstMonth;
		    			firstDays = getMonthDays(myYear,myMonth); 
		    			var monthStartDate = new Date(myYear, myMonth-1, firstDay);
				        var monthEndDate = new Date(myYear, myMonth, 1);
				        realDays = (monthEndDate - monthStartDate)/(1000 * 60 * 60 * 24);
				        //第一季度的剩下的月数 = 第一季度的月份 - 第一季度开始的月份
				        var firstOverMonth = firstQuarterMonth - firstMonth;
				        //第一个季度的金额 = 一天的金额 * 第一个月的天数  + 一个月的金额 * 第一季度剩余的月数 
				        maOrFcSum = parseFloat(masum/sumdatalength/firstDays*realDays + masum/sumdatalength*firstOverMonth).toFixed(2);
				        oldsum += parseFloat(parseFloat(masum/sumdatalength/firstDays*realDays + masum/sumdatalength*firstOverMonth).toFixed(2));
				        fcreverate += parseFloat(parseFloat((masum/sumdatalength/firstDays*realDays + masum/sumdatalength*firstOverMonth)/contsum).toFixed(4));
		    		}else if(i == (quarterdatalength - 1)){		//最后一个季度
		    			maOrFcSum = parseFloat(masum - oldsum).toFixed(2);
		    			fcreverate = parseFloat((masum - oldsum)/contsum).toFixed(4);
		    		}else{
		    			maOrFcSum = parseFloat(masum/sumdatalength*3).toFixed(2);
		    			oldsum +=  parseFloat(parseFloat(masum/sumdatalength*3).toFixed(2));
		    			fcreverate = parseFloat(masum/sumdatalength*3/contsum).toFixed(4);
		    		}
		    		data[i] = {name: "New Row","reveno": reveno,"revetype": "2","reveproof": "10",
		    			"revetimedesc": "按季度等比确认","yearmonth": yearmonth,"newyearmonth": newyearmonth,
		    			"masum": maOrFcSum,"status": "0","saleseva": "0",
		    			"fcsum": maOrFcSum,"newtype": "2","monthperiod":"2","newmonthperiod": "2",
		    			"fcreverate": fcreverate};
		    	}
	    	}
	    	reveObject.startDate = startDate;
	    	reveObject.endDate = endDate;
	    	reveObject.data = data;
			return reveObject;
	    }
	    
	    //取消，将关闭当前窗口
	    function onCancel(){
	    	CloseWindow("close");
	    }
	    
		//关闭窗口
		function CloseWindow(action){
			if(action=="close"){
				CloseWindow("cancel");
			}
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        	else window.close();
		}
	</script>
</body>
</html>