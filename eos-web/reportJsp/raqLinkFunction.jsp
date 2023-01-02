<%@ page contentType="text/html;charset=UTF-8" %>

<script type="text/javascript">

var url = nui.getDictText('AME_SYSCONF','AMEPATH');
//公共费用预算与执行表点击链接调用的js函数
function show_commBudgetDetail(subRaq,regionid,year,month,comExpTypeID,comGroupTypeID){
	//alert(regionid);
	//alert('subRaq='+subRaq+' regionid='+regionid+' year='+year+' month='+month+" comExpTypeID="+comExpTypeID +' comGroupTypeID='+comGroupTypeID);
	var strurl='showReport.jsp?rpx=/budget/'+subRaq+'.rpx&regionid='+regionid+'&year='+year+'&month='+month+'&comExpTypeID='+comExpTypeID+'&comGroupTypeID='+comGroupTypeID;
	window.open(strurl,"_blank"); 
}

function department_PL_listDetail(subRaq,orgid,year,month,deptExpTypeID,parentType){
//	alert('subRaq='+subRaq+' deptno='+deptno+' year='+year+' month='+month+" deptExpTypeID="+deptExpTypeID +' parentType='+parentType);
	var strurl='showReport.jsp?rpx=/budget/'+subRaq+'.rpx&orgid='+orgid+'&year='+year+'&month='+month+'&deptExpTypeID='+deptExpTypeID+'&parentType='+parentType;
	window.open(strurl,"_blank"); 
}

function show_expnoDetail(id){
	var strurl=url+'ame_fee/myExpenseReimbursement/myReiFee.jsp?reiid=' + id;
	window.open(strurl,"_blank");
}
function show_preSettleDetail(id){
	var strurl=url+'ame_pur/outaccrued/PurOutPreSettleLook.jsp?accruedid=' + id;
	window.open(strurl,"_blank");
}

function impDeptBudgetData(){
	var year = document.getElementById("year").value;
	if(year==null||year==''){
		alert("年份必填!");
		return;
	}else{
		if(confirm("确定要导入"+year+"年"+"预算数据？")){
			var json={year:year};
			var messageId = nui.loading("正在导入中,请稍后...","提示");
			nui.ajax({
		    	url: "com.primeton.eos.ame_budget.deptbudget.impBudgetData.biz.ext",//url: "http://ame.primeton.com/com.primeton.eos.machine.machine.assetCast.biz.ext",
		    	type: "post",
		    	dataType:"json",    //测试环境用，不要随意提交amereport环境，需按照注释内容修改dataType:"jsonp",jsonp: "callbackparam",  跨域json请求一定是jsonp，  
		    	data: json,
		    	cache: false,
		    	contentType: 'text/json',
		    	success: function (o) {
		    		nui.hideMessageBox(messageId);
		    		if(o.result=="1"){
		    			alert("预算数据导入成功！");
		    		}else if(o.result=="0"){
		    			alert("预算数据导入失败，请联系管理员！");
		    		}
		    	}
		    });
		}
	}
}

function deptBudget_export(){
	var orgid = document.getElementById( "orgids" ).value;
	var year = document.getElementById( "years" ).value;
	var action = document.getElementById( "action" ).value;
	var reportFile = "<%=request.getSession().getServletContext().getRealPath("/WEB-INF/reportFiles/"+request.getParameter( "rpx" )).replace("\\","\\\\")  %>";
	//alert(orgid+","+year);
	//console.log(reportFile);
	if(year==null||year==''){
		alert("年份必填!");
		return;
	}else if(orgid==null||orgid==''){
		alert("请查询后再导出!");
		return;
	}else{
		var json={year:year,orgid:orgid,reportFile:reportFile,action:action};
		var messageId = nui.loading("导出时间较长，请耐心等待。。。","提示");
		nui.ajax({
	    	url: "com.primeton.xbb.importExcel.exportPL.ExportDeptBudgetV5.biz.ext",//url: "http://ame.primeton.com/com.primeton.eos.machine.machine.assetCast.biz.ext",
	    	type: "post",
	    	dataType:"json",    //测试环境用，不要随意提交amereport环境，需按照注释内容修改dataType:"jsonp",jsonp: "callbackparam",  跨域json请求一定是jsonp，  
	    	data: json,
	    	cache: false,
	    	contentType: 'text/json',
	    	success: function (o) {
	    		nui.hideMessageBox(messageId);
	    		var returnvalue =o.a;
	    		var returnurl =o.url;
	    		console.log(o);
	    		if(returnvalue=="1"){
	    			alert("导出成功！");
	    			var filePath = returnurl;
			    	var fileName = "DeptBudget";
			    	var myDate = new Date();
			    	var year = myDate.getYear();
			    	var month = myDate.getMonth()+1;
			    	var day = myDate.getDate();
			    	var hours = myDate.getHours();
			    	var minutes = myDate.getMinutes();
			    	var seconds = myDate.getSeconds();
			    	var curDateTime = year;
			    	if(month>9)
						curDateTime = curDateTime + "" + month;
					else
						curDateTime = curDateTime + "0" + month;
			    	if(day>9)
						curDateTime = curDateTime + "" + day;
					else
						curDateTime = curDateTime + "0" + day;
					if(hours>9)
						curDateTime = curDateTime + "" + hours;
					else
						curDateTime = curDateTime + "0" + hours;
					if(minutes>9)
						curDateTime = curDateTime + "" + minutes;
					else
						curDateTime = curDateTime + "0" + minutes;
					if(seconds>9)
						curDateTime = curDateTime + "" + seconds;
					else
						curDateTime = curDateTime + "0" + seconds;
					fileName = fileName + curDateTime + ".xls";
					var frm = document.getElementById("viewlist1");
		        	frm.elements["downloadFile"].value = o.url;
		        	frm.elements["fileName"].value = fileName;
				    frm.submit();
	    		}else {
	    			alert("导出失败，请联系管理员！");
	    		}
	    	}
	    })
	}
}

//流程处理时效
function processInstshow(o){
	var processInstID = encodeURIComponent(o);
	var strurl = url+"bps/wfclient/task/processinstView.jsp";
	var title = "流程图查看";
	var width=1000;
    nui.open({
		url: strurl,
		title: title,
		width: width,
		height: 530,
		onload: function () {
			var iframe = this.getIFrameEl();
			if(iframe.contentWindow) {
				iframe.contentWindow.postMessage({"processInstID": o},url);
			}
		},
		ondestroy: function (action){
		}
	});
}
</script>
