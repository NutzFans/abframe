<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): zhuyl
  - Date: 2016-11-11 16:05:49
  - Description:
-->
<head>
	<title>合同收款报表明细</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div>
	 	<fieldset style="width:1815px;border:solid 1px #aaa;padding:3px;">
	 		<legend><span id="titletext" style="font-size: 12px;">部门合同收款明细信息</span></legend>
	        <div id="datagrid1" class="nui-datagrid" style="width:100%;height: auto;" allowResize="true" dataField="objs" 
		    	multiSelect="true" allowAlternating="true" showpager="false" ondrawsummarycell="onDrawSummaryCell" 
		    	showSummaryRow="true" virtualScroll="true" allowHeaderWrap="true" allowSortColumn="false" 
		    	onheadercellclick="headerSort" 
		    	url="com.primeton.eos.ame_income.csGatherFc.queryCsGatherFcReportDetail.biz.ext">
				<div property="columns">
					<div field="dictname" width="100" align="left" headerAlign="center" allowSort="true">事业部</div>
					<div field="salename" width="70" align="center" headerAlign="center" allowSort="true">销售</div>
					<div field="contnum" width="90" align="left" headerAlign="center" allowSort="true" renderer="detailCont">合同编号</div>
					<div field="projectname" width="150" align="left" headerAlign="center" allowSort="true">合同名称</div>
					<div field="custname" width="200" align="left" headerAlign="center" allowSort="true">所属客户</div>
					<div field="contsum" width="90" dataType="currency" align="right" headerAlign="center" >合同金额</div>
					<div field="gatherno" width="40" align="center" headerAlign="center" >收款编号</div>
					<div field="newyearmonth" width="50" align="center" dateFormat="yyyy-MM-dd" headerAlign="center" >预计收款年月</div>
					<div field="wqrje" width="90" summaryType="sum" dataType="currency" align="right" headerAlign="center" >预计收款</div>
					<div field="yqrje" width="90" summaryType="sum" dataType="currency" align="right" headerAlign="center" >已收款</div>
					<div field="maconfirmday" width="80" align="center" dateFormat="yyyy-MM-dd" allowSort="true" headerAlign="center" >实际收款日期</div>
					<div field="fcreverate" width="60" numberFormat="p1" align="center" headerAlign="center" >预估收款比例</div>
					<div field="fcreverate2" width="60" numberFormat="p1" align="center" headerAlign="center" >实际收款比例</div>
					<div field="gathertype" width="120" renderer="onGenderGatherFcType" align="left" headerAlign="center" >收款类型</div>
					<div field="status" width="80" renderer="onGenderStatus" align="center" headerAlign="center">收款状态</div>
					<div field="billstatus" width="80" renderer="onGenderStatus1" align="center" headerAlign="center">收款开票状态</div>
					<div field="gathertimedesc" width="130" align="left" headerAlign="center" >收款确认时点描述</div>
					<div field="changetimes" width="50" align="center" headerAlign="center" >预测变更次数</div>
					<div field="processInstID" width="50" align="center"headerAlign="center" renderer="onGenderProId" >流程ID</div>
					<div field="memo" width="auto" align="left" headerAlign="center" >说明</div>
				</div>
			</div>
		</fieldset>
	</div>
	<div style="text-align:center;padding:10px;width:1805px;" class="nui-toolbar">
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
		<a class="nui-button" onclick="exportCsGatherDetail" iconCls="icon-download" style="width:135px;" id="exportButton">导出收款</a>	
	</div>
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form>
	<script type="text/javascript">
		nui.parse();
		var grid = nui.get("datagrid1");
		//事业部
		var dictname = getUrlParam("dictname");
		//销售
		var salename = getUrlParam("salename");
		//月份
		var months = getUrlParam("months");
		//年度
		var years = getUrlParam("years");
		//状态(2,0)
		var status = getUrlParam("status");
		//所属客户
		var custname = getUrlParam("custname");
		//部门seq
		var orgseq = getUrlParam("orgseq");
		//部门seqsearch
		var orgseqsearch = getUrlParam("orgseqsearch");
		//客户search
		var custnamesearch = getUrlParam("custnamesearch");
		//销售search
		var salenamesearch = getUrlParam("salenamesearch");
		if(months < 10){
			months = "0" + months;
		}
		function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return decodeURIComponent(r[2]); 
			return null; 
		}
		init();
		function init(){
			//未收款
			if(status == 0){
				status = "'0','1'";
			}
			/* if(months < 10){
				months = "0" + months;
			} */
			var titletext = "";
			if(status == 2){
				if((dictname == null || dictname == "") && (salename == null || salename != "")){
					titletext =  "普元 " + years + "年" + months + "月的" + "已收款详细信息";
				}else if(months.indexOf("年之后的收款总计") != "-1"){
					titletext =  " " + salename + " " + years + "年之后已收款详细信息";
				}else if(months=="总计" && years.length==4){
					titletext =  " " + salename + " " + years + "年已收款总计详细信息";
				}else if(months=="总计" && years.length==8){
					var yearmin = years.substr(0,4);
					var yearmax = years.substr(4,4);
					years = yearmin+","+yearmax;
					if(yearmin == yearmax){
						titletext =  " " + salename + " " + yearmin + "年已收款总计详细信息";
					}else{
						titletext =  " " + salename + " " + yearmin + "年-"+ yearmax + "年已收款总计详细信息";
					}
				}else{
					titletext =  " " + salename + " " + years + "年" + months + "月的" + "已收款详细信息";
				}
				
			}else{
				if((dictname == null || dictname == "") && (salename == null || salename != "")){
					titletext = "普元 " + years + "年" + months + "月的" + "预计收款详细信息";
				}else if(months.indexOf("年之后的收款总计") != "-1"){
					titletext =  " " + salename + " " + years + "年之后预计收款详细信息";
				}else if(months=="总计" && years.length==4){
					titletext =  " " + salename + " " + years + "年预计收款总计详细信息";
				}else if(months=="总计" && years.length==8){
					var yearmin = years.substr(0,4);
					var yearmax = years.substr(4,4);
					years = yearmin+","+yearmax;
					if(yearmin == yearmax){
						titletext =  " " + salename + " " + yearmin + "年预计收款总计详细信息";
					}else{
						titletext =  " " + salename + " " + yearmin + "年-"+ yearmax + "年预计收款总计详细信息";
					}
				}else{
					titletext =  " " + salename + " " + years + "年" + months + "月的" + "预计收款详细信息";
				}
			}
			document.getElementById("titletext").innerHTML = titletext;
			var json = {obj: {dictname: dictname,salename: salename,custname: custname,orgseq:orgseq,orgseqsearch:orgseqsearch,custnamesearch:custnamesearch,salenamesearch:salenamesearch,ymonths: months,yyears: years,status: status,s1: "YQRJE",s2: "DESC"}};
			grid.load(json,function(){
				
			});
		}
		
		//设置业务字典-状态
		function onGenderStatus(e) {
	    	return nui.getDictText('AME_GATHERSTATUS',e.value);
	    }
	    function onGenderStatus1(e) {
	    	return nui.getDictText('MIS_GATHERBILL',e.value);
	    }
	    //收款类型
	    function onGenderGatherFcType(e) {
	        return nui.getDictText('AME_GATHERTYPE',e.value);
	    }
	    
	    function onDrawSummaryCell(e) {
            var result = e.result;
            var grid = e.sender;
            //客户端汇总计算
            if (e.field == "custname") {
                e.cellHtml = "<div style='width: 200px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>合计：</span></div>";
            }
            if (e.field == "yqrje") {
                e.cellHtml = "<div style='width: 83px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>" + e.cellHtml + "</span></div>";
            }
            if (e.field == "wqrje") {
                e.cellHtml = "<div style='width: 83px;height: 20px;text-align: right;'><span style='color: blue;align: right;'>" + e.cellHtml + "</span></div>";
            }
        }
        function onCancel(e) {
        	CloseWindow("cancel");
        }
        
        //标准方法接口定义
        function CloseWindow(action) {            
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        //导出收款明细
        function exportCsGatherDetail(){
        	nui.confirm("是否确认导出收款明细？", "确定？",
            function (action) {            
                if (action == "ok") {
		        	if(status == 0){
						status = "'0','1'";
					}
					var titletext;
					//事业部
					dictname = getUrlParam("dictname");
					//销售
					salename = getUrlParam("salename");
					//所属客户
					custname = getUrlParam("custname");
					//所属客户
					orgseq = getUrlParam("orgseq");
					//部门seqsearch
					orgseqsearch = getUrlParam("orgseqsearch");
					//客户search
					custnamesearch = getUrlParam("custnamesearch");
					//销售search
					salenamesearch = getUrlParam("salenamesearch");
					//月份
					months = getUrlParam("months");
					//年度
					years = getUrlParam("years");
					//状态(2,0)
					status = getUrlParam("status");
					if(months < 10){
						months = "0" + months;
					}else if(months == "总计"){
						months = "'1','2','3','4','5','6','7','8','9','10','11','12'";
					}
					if(status == 2){
						if((dictname == null || dictname == "") && (salename == null || dictname != "")){
							titletext =  "普元 " + years + "年" + months + "月的" + "已收款详细信息";
						}else if(months.indexOf("年之后的收款总计") != "-1"){
							titletext =  " " + salename + " " + years + "年之后已收款详细信息";
						}else if(months=="总计" && years.length==4){
							titletext =  " " + salename + " " + years + "年已收款总计详细信息";
						}else if(months=="总计" && years.length==8){
							var yearmin = years.substr(0,4);
							var yearmax = years.substr(4,4);
							years = yearmin+","+yearmax;
							if(yearmin == yearmax){
								titletext =  " " + salename + " " + yearmin + "年已收款总计详细信息";
							}else{
								titletext =  " " + salename + " " + yearmin + "年-"+ yearmax + "年已收款总计详细信息";
							}
						}else{
							titletext =  " " + salename + " " + years + "年" + months + "月的" + "已收款详细信息";
						}
						
					}else{
						if((dictname == null || dictname == "") && (salename == null || dictname != "")){
							titletext = "普元 " + years + "年" + months + "月的" + "预计收款详细信息";
						}else if(months.indexOf("年之后的收款总计") != "-1"){
							titletext =  " " + salename + " " + years + "年之后预计收款详细信息";
						}else if(months=="总计" && years.length==4){
							titletext =  " " + salename + " " + years + "年预计收款总计详细信息";
						}else if(months=="总计" && years.length==8){
							var yearmin = years.substr(0,4);
							var yearmax = years.substr(4,4);
							years = yearmin+","+yearmax;
							if(yearmin == yearmax){
								titletext =  " " + salename + " " + yearmin + "年预计收款总计详细信息";
							}else{
								titletext =  " " + salename + " " + yearmin + "年-"+ yearmax + "年预计收款总计详细信息";
							}
						}else{
							titletext =  " " + salename + " " + years + "年" + months + "月的" + "预计收款详细信息";
						}
					}
					
					var json = {obj: {dictname: dictname,salename: salename,ymonths: months,yyears: years,status: status,custname: custname,orgseq:orgseq,orgseqsearch:orgseqsearch,custnamesearch:custnamesearch,salenamesearch:salenamesearch,s1: "YQRJE",s2: "DESC"},titletexts: {titletext: titletext}};
					grid.loading("收款明细导出中...");
					nui.ajax({
		    			url: "com.primeton.eos.ame_income.csGatherFc.exportCsGatherFcDetail.biz.ext",
				        type: "post",
				        data: json,
				        cache: false,
				        contentType: 'text/json',
				        success: function (o) {
				     		grid.unmask();
				        	var filePath = o.downloadFile;
				        	var fileName = "收款明细";
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
            });
        }
        
        var sortOrderTime = 0;
        function headerSort(e){
        	var sortFiled = e.column.field;
        	if(sortFiled == "wqrje" || sortFiled == "yqrje"){
        		return;
        	}
        	if(sortOrderTime == 0){
	        	sortOrder = "DESC";
	        	sortOrderTime = 1;
        	}else{
        		sortOrder = "ASC";
        		sortOrderTime = 0;
        	}
        	sortFiled = "bb." + sortFiled;
    		if(status == 0){
				status = "'0','1'";
			}
			var titletext = "";
			if(status == 2){
				if((dictname == null || dictname == "") && (salename == null || salename != "")){
					titletext =  "普元 " + years + "年" + months + "月的" + "已收款详细信息";
				}else if(months.indexOf("年之后的收款总计") != "-1"){
					titletext =  " " + salename + " " + years + "年之后已收款详细信息";
				}else if(months=="总计" && years.length==4){
					titletext =  " " + salename + " " + years + "年已收款总计详细信息";
				}else if(months=="总计" && years.length==8){
					var yearmin = years.substr(0,4);
					var yearmax = years.substr(4,4);
					years = yearmin+","+yearmax;
					if(yearmin == yearmax){
						titletext =  " " + salename + " " + yearmin + "年已收款总计详细信息";
					}else{
						titletext =  " " + salename + " " + yearmin + "年-"+ yearmax + "年已收款总计详细信息";
					}
				}else{
					titletext =  " " + salename + " " + years + "年" + months + "月的" + "已收款详细信息";
				}
				
			}else{
				if((dictname == null || dictname == "") && (salename == null || salename != "")){
					titletext = "普元 " + years + "年" + months + "月的" + "预计收款详细信息";
				}else if(months.indexOf("年之后的收款总计") != "-1"){
					titletext =  " " + salename + " " + years + "年之后预计收款详细信息";
				}else if(months=="总计" && years.length==4){
					titletext =  " " + salename + " " + years + "年预计收款总计详细信息";
				}else if(months=="总计" && years.length==8){
					var yearmin = years.substr(0,4);
					var yearmax = years.substr(4,4);
					years = yearmin+","+yearmax;
					if(yearmin == yearmax){
						titletext =  " " + salename + " " + yearmin + "年预计收款总计详细信息";
					}else{
						titletext =  " " + salename + " " + yearmin + "年-"+ yearmax + "年预计收款总计详细信息";
					}
				}else{
					titletext =  " " + salename + " " + years + "年" + months + "月的" + "预计收款详细信息";
				}
			}
			document.getElementById("titletext").innerHTML = titletext;
			var json = {obj: {dictname: dictname,salename: salename,custname: custname,orgseq:orgseq,orgseqsearch:orgseqsearch,custnamesearch:custnamesearch,salenamesearch:salenamesearch,ymonths: months,yyears: years,status: status,"sortFiled": sortFiled,"sortOrder": sortOrder}};
			grid.load(json,function(){});
        }
        //合同详细信息
        function detailCont(e){
        	return "<a href='javascript:void(0)' onclick='detailCont1();' title='点击查看合同信息'>" + e.value + "</a>";
        }
        function detailCont1(){
	 		var selectRow = grid.getSelected();
			var executeUrl = "<%=request.getContextPath() %>/contract/contract/contractView.jsp?contractid=" + selectRow.contractid;
			window.open(executeUrl, "合同查看", "fullscreen=1");
	    }
	</script>
</body>
</html>