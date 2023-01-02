<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/nui/common.jsp"%>
<html>
<!-- 
  - Author(s): Administrator
  - Date: 2015-07-10 14:06:49
  - Description:
-->
<head>
	<title>财务结算工时查询</title>
	<link href="../demo.css" rel="stylesheet" type="text/css" />
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fix">
	<div class="nui-panel" title="财务结算工时查询" style="width:100%;">
	<div id="form1">
		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
			<table style="width:100%;">
				<input name="criteria._expr[0]._value" id="year" class="nui-hidden" style="width:150px;"/>
			    <input class="nui-hidden" name="criteria._expr[0]._property" value="year"/>
			    <input class="nui-hidden" name="criteria._expr[0]._op" value="="/>
			    <input name="criteria._expr[1]._value" id="month" class="nui-hidden" style="width:150px;"/>
			    <input class="nui-hidden" name="criteria._expr[1]._property" value="month"/>
			    <input class="nui-hidden" name="criteria._expr[1]._op" value="="/>
				<tr>
					<td class="form_label" align="right" >财务年</td>
			           <td colspan="1" align="left">
			           <input name="criteria._expr[11]._value" id="finyear" valueField="dictid" textField="dictname" class="nui-combobox" shownullItem="true" style="width:150px;" onenter="onKeyEnter"/>
					   <input class="nui-hidden" name="criteria._expr[11]._property" value="year"/>
					   <input class="nui-hidden" name="criteria._expr[11]._op" value="="/>
			        </td>
			    	<td align="right" width="90px"><span>财务年月：</span></td>
					<td>
						<input class="nui-monthpicker" format="yyyy-MM" id="finYM" style="width:150px" onvaluechanged="watchfinYM"/>
					</td>
			        <td class="form_label" align="right">工时日期</td>
	          	    <td colspan="1">
						<input class="nui-datepicker" name="criteria._expr[3]._min" style="width:100px" id="min"/>-<input class="nui-datepicker" name="criteria._expr[3]._max" style="width:100px" id="max"/>
						<input class="nui-hidden" name="criteria._expr[3]._property" value="serviceDate"/>
						<input class="nui-hidden" name="criteria._expr[3]._op" value="between"/>
						<input class="nui-hidden" name="criteria._expr[3]._pattern" value="yyyy-MM-dd"/>
		          	</td>
			        <td class="form_label" align="right" >员工</td>
	          		<td colspan="1">
			        	<input name="criteria._expr[2]._value" class="nui-textbox"onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[2]._property" value="empName"/>
					    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
           		    </td>
	    		</tr>
				<tr>
					<td align="right" class="form_label">项目名称</td>
	            	<td align="left" colspan="1">
	            		<input name="criteria._expr[4]._value" class="nui-textbox" style="width:150px;"  onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[4]._property" value="prjName"/>
					    <input class="nui-hidden" name="criteria._expr[4]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[4]._likeRule" value="all"/>
				    </td>
			    	<td class="form_label" align="right">项目编号</td>
		          	<td colspan="1">
			           	<input name="criteria._expr[5]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[5]._property" value="prjNum"/>
					    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
		          	</td>
		    		<td class="form_label" align="right">员工所属部门</td>
		          	<td colspan="1">
			           	<input name="criteria._expr[6]._value" class="nui-textbox" id="empOrgname" style="width:204px;"/>
					    <input class="nui-hidden" name="criteria._expr[6]._property" value="empOrgname"/>
					    <input class="nui-hidden" name="criteria._expr[6]._op" value="="/>
		          	</td>
		          	<td class="form_label" align="right">受益部门</td>
		          	<td >
			           	<input name="criteria._expr[7]._value" class="nui-textbox" id="buyOrgname"/>
					    <input class="nui-hidden" name="criteria._expr[7]._property" value="buyOrgname"/>
					    <input class="nui-hidden" name="criteria._expr[7]._op" value="="/>
		          	</td>
		      	</tr>
		      	<tr>
		      		<td align="right" class="form_label" style="width:100px;">合同编号</td>
	            	 <td colspan="1">
	            		<input name="criteria._expr[8]._value" class="nui-textbox" style="width:150px;" onenter="onKeyEnter"/>
					    <input class="nui-hidden" name="criteria._expr[8]._property" value="contnum"/>
					    <input class="nui-hidden" name="criteria._expr[8]._op" value="like"/>
					    <input class="nui-hidden" name="criteria._expr[8]._likeRule" value="all"/>
				     </td>
		      		 <td class="form_label" align="right">工时成本类型</td>
	          		 <td colspan="1">
			           	<input name="criteria._expr[9]._value" class="nui-dictcombobox"  dictTypeId="AME_LABORTYPE" shownullItem="true" style="width:150px;"/>
					    <input class="nui-hidden" name="criteria._expr[9]._property" value="pkCorp"/>
					    <input class="nui-hidden" name="criteria._expr[9]._op" value="="/>
		          	 </td>
		          	 <td class="form_label" align="right">状态</td>
	          		 <td colspan="1">
			           	<input name="criteria._expr[10]._value" id="status" class="nui-dictcombobox"  dictTypeId="AME_OUTCOSTSTATUS" shownullItem="true" style="width:204px;"/>
					    <input class="nui-hidden" name="criteria._expr[10]._property" value="checkStatus"/>
					    <input class="nui-hidden" name="criteria._expr[10]._op" value="="/>
		          	 </td>
		          	 <td></td>
		          	 <td></td>
	    		</tr>
	    		<tr>
	    			<td align="center" colspan="8">
						<a class="nui-button" id="search" iconCls="icon-search" onclick="search">查找</a>
						<a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset">重置</a>
					</td>
				</tr>
	    	</table>
    	</div>
	</div>
	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	        <table style="width:100%;">
	              <tr>
	                  <td style="width:100%;">
	                  	 <a class="nui-button" iconCls="icon-download" onclick="exportLabor" id="bt1">导出</a>
						 <a class="nui-button" iconCls="icon-ok" onclick="surefileData" id="bt2">确认</a>
	                  </td>
	              </tr>
	         </table>
	</div>
	<div class="nui-fit">
	    <div id="datagrid1" sizeList="[10,20,50,100,500,1000,5000,10000]" showPager="true" dataField="outs" showSummaryRow="true"  sortMode="client" 
        	class="nui-datagrid" style="width:100%;height:340px;" url="com.primeton.rdmgr.labor.input.newRdLaborHistory.queryLaborHistory.biz.ext" 
        	multiSelect="true" allowSortColumn="true" ondrawsummarycell="onDrawSummaryCell" >
            <div property="columns">
            	<div type="checkcolumn"></div>
                <div field="serviceDate" width="80" align="left" headerAlign="center" allowSort="true" renderer="getDetail">填报日期</div>
                <div field="taskname" width="180" align="left"headerAlign="center" allowSort="true" >工作任务</div>
                <div field="workingHours" width="60" align="left"headerAlign="center" allowSort="true" renderer="getName">工作时间</div>
                <div field="otwHours" width="80" align="left"headerAlign="center" allowSort="true" >其中加班工时</div>
                <div field="empCode" width="80" align="center" headerAlign="center" allowSort="true">员工工号</div>
                <div field="empName" width="80" align="center" headerAlign="center" allowSort="true" >员工姓名</div>
                <div field="empOrgname" width="120" align="center" headerAlign="center" allowSort="true">员工所属部门</div>
                <div field="degree" width="60" align="center" headerAlign="center" allowSort="true">员工级别</div>
                <div field="buyOrgname" width="80" align="center" headerAlign="center" allowSort="true">受益部门</div>
                <div field="buyYjname" width="120" align="center" headerAlign="center" allowSort="true">受益事业部</div>
                <div field="pkCorp" width="60" align="center" headerAlign="center" allowSort="true" renderer="getPkCorp">成本类型</div>
                <div field="checkStatus" width="100" align="center" headerAlign="center" allowSort="true" renderer="getCheckStatus">状态</div>
                <div field="contnum" width="80" align="center" headerAlign="center" allowSort="true">合同编号</div>
                <div field="unitPrice" width="80" align="right"headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">工时单价</div>
                <div field="costs" width="80" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">工时成本</div>
                <div field="transcosts" width="80" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">转换成本</div>
            </div>
        </div>
	</div>
	</div>
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
	var form = new nui.Form("#form1");
	var state = false;
	var myDate = new Date();
	var year = myDate.getFullYear();
	var month = myDate.getMonth()+1;
	var day = myDate.getDate();
	var date = year+"-"+month+"-"+day;
	nui.get("min").setValue(date);
	nui.get("max").setValue(date);
	var years = [{"dictname":"2012","dictid":"2012"},{"dictname":"2013","dictid":"2013"},{"dictname":"2014","dictid":"2014"},{"dictname":"2015","dictid":"2015"},{"dictname":"2016","dictid":"2016"},{"dictname":"2017","dictid":"2017"},{"dictname":"2018","dictid":"2018"},{"dictname":"2019","dictid":"2019"},{"dictname":"2020","dictid":"2020"}];
	nui.get("finyear").setData(years);
	search();
	
	function search() {
		var form = new nui.Form("#form1");
		var data = form.getData();
		grid.load(data);
	}
	function reset(){
		var form = new nui.Form("#form1");
		form.reset();
		grid.load();
	}
	
	function getPkCorp(e){
		return nui.getDictText('AME_LABORTYPE',e.value);
	}
	
	function getName(e){
		if(e.value){
			return e.value + "小时";
		}
	}
	
	function getCheckStatus(e){
		return nui.getDictText('AME_OUTCOSTSTATUS',e.value);
	}
	
	//回车触发
	function onKeyEnter(){
		search();
	}
	
	//确认
	function surefileData(){
		var finYM = nui.get("finYM").getValue();
		if(nui.get("finYM").getValue() == ""){
      		alert("财务年月不能为空！");
      		return;
	    }
	    var year = finYM.getFullYear();
  		var month = finYM.getMonth()+1;
  		nui.get("year").setValue(year);
  		nui.get("month").setValue(month);
	    if(nui.get("status").getValue() == ""){
      		alert("状态不能为空！");
      		return;
	    }
	    if(nui.get("status").getValue() !== "1"){
      		alert("状态必须为新增！");
      		return;
	    }
	    var data = form.getData();
		var json =  nui.encode(data);
	    nui.ajax({
			url: "com.primeton.rdmgr.labor.labormgr.surefileData.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		var total = o.total;
	     		alert("确认成功！此次共确认" + total + "条数据!");
	     		var form = new nui.Form("#form1");
				var data = form.getData();
				grid.load(data);
	        },
	        error: function () {
	        	alert("error");
	        }
		});
	}

	
	//导出
	function exportLabor(){
		if(!confirm("导出历史结算工时查询记录？")){
			return;
		}
		var data = form.getData();
		var json =  nui.encode(data);
		nui.ajax({
			url: "com.primeton.rdmgr.labor.input.newRdLaborHistory.exportLaborHistory.biz.ext",
	        type: "post",
	        data: json,
	        cache: false,
	        contentType: 'text/json',
	        success: function (o) {
	     		nui.unmask();
	     		var filePath = o.downloadFile;
	        	var fileName = "历史结算工时查询记录";
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
	
	function getDetail(e){
    	if(e.value){
    		return "<a href='javascript:void(0)' onclick='getDetailByLabor();' title='点击查看'>" + e.value + "</a>";
    	}
    }
    function getDetailByLabor(){
    	var selectRow = grid.getSelected();
		var executeUrl = "/default/labor/newRdLabor/LaborHistoryDetail.jsp?id=" + selectRow.id;
		window.open(executeUrl);
    }
    //财务年月控制---根据系统数据得到财务年月的日期区间
	function watchfinYM(){
		var finYM = nui.get("finYM").getValue();
		if(finYM){
				var year = finYM.getFullYear();
		  		var month = finYM.getMonth()+1;
				var json = ({"criteria":{"_entity":"com.primeton.eos.common.newdataset.MisFinperiod",
										 "_expr[0]":{"_property":"finyear","_op":"=","_value":year},
										 "_expr[1]":{"_property":"finmonth","_op":"=","_value":month}
										}});
				nui.ajax({
			        type:'get',
			        data:json,
			        cache: false,
			        showModal: false,
			        async :false,
			        contentType: 'text/json',
			        url:'com.primeton.rdmgr.labor.misfinperiodbiz.queryMisFinperiods.biz.ext',
			        success:function(result){
			            if(result.misfinperiods.length>0){
			            	nui.get("min").setValue(result.misfinperiods[0].startdate);
			            	nui.get("max").setValue(result.misfinperiods[0].enddate);
			            }else{
			            	nui.get("min").setValue('');
			            	nui.get("max").setValue('');
			            }
			            nui.get("year").setValue(year);
			            nui.get("month").setValue(month);
			        },
			        error:function(jqXHR, textStatus, errorThrown){
			            nui.alert("error:" + jqXHR.responseText);
			        }
			    })
		}else{
            nui.get("year").setValue("");
            nui.get("month").setValue("");
		}
	}
    
    function onDrawSummaryCell(e) {
		    var result = e.result;
		    var grid = e.sender;
		    if (e.field == "contnum") {
		        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
		    }
		    if (e.field == "unitPrice") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "costs") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "transcosts") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		}
</script>
</html>