<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): lixq
  - Date: 2016-08-15 14:33:56
  - Description:
-->
<head>
<title>工时率计算</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div style="width:100%;height:50%;padding:0px;margin:0px;">
		<div style="width:100%;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;"id="form1">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                       	个人月度工时率计算
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>
    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:400px;" allowResize="true" pageSize="10" sizeList="[20,50,100,500]" showSummaryRow="true" ondrawsummarycell="doCountNowPage"
        url="com.primeton.rdmgr.labor.labormgr.querryLaborRate.biz.ext" dataField="LaborRates">
        <div property="columns">
            <div field="laborDate" width="20" headerAlign="center" align="center" allowSort="false" dateFormat="yyyy-MM">年份-月份</div>   
            <div field="userID" width="15" headerAlign="center" align="center" allowSort="false">用户ID</div>  
            <div field="empname" width="30" headerAlign="center" align="center" allowSort="false" renderer="getDetail">姓名</div>
            <div field="orgname" width="25" headerAlign="center" align="center" allowSort="false">员工所属部门</div>
            <div field="perActHours" width="15" headerAlign="center" align="right" dataType="float" decimalPlaces="2" allowSort="true" summaryType="sum">项目工时(h)</div>
            <div field="otwhours" width="20" headerAlign="center" align="right" dataType="float" decimalPlaces="2" allowSort="true" summaryType="sum">其中加班工时(h)</div>
            <div field="stdworkdays" width="15" headerAlign="center" align="right" <%--summaryType="sum"--%> allowSort="true" summaryType="sum">标准工作日(天)</div>
            <div field="stdworkhour" width="15" headerAlign="center" align="right" <%--summaryType="sum"--%> allowSort="true" summaryType="sum">标准工时(h)</div>
            <div field="LaborRate" width="20" headerAlign="center" align="right" allowSort="true" dataType="String" renderer="getper">个人月度工时率</div>        
        	<div field="isworkrate" width="15" headerAlign="center" align="center" renderer="getdict" allowSort="true">是否统计工时率</div>
        </div>
    </div>
   
  </div>
   <div style="text-align:center;padding:10px;">
	    <a class="nui-button" onclick="exportAtt" iconCls="icon-download" style="width:60px;">导出</a>
	    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div> 
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form>
    <script type="text/javascript">
    	nui.parse();
    	var grid = nui.get("datagrid1");
 
 		var form = new nui.Form("form1");
 		
 		var orgname = getUrlParam("orgname");
 		orgname=orgname.replace("%26","&");
 		var startdate = getUrlParam("startdate");
 		var enddate = getUrlParam("enddate");
 		
 		setDate();
		function setDate(){
    		var date1 = {sdate:startdate,edate:enddate,orgname: orgname};
		
	  		grid.load(date1,function(o){
		  		if(o.total==0){
		  			alert("该月无工时填写记录!");
		  			return;
		  		}
		  	});
		  	grid.sortBy("LaborRate","desc");
		}
    	
  		function getper(e){
  			var rate = (e.value*100).toFixed(2)+"%";
  			return rate;
  		}
    	
    	function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return decodeURI(r[2]); 
			return null; 
		}
		var data = [{id: 1,text: '是'},{id: 0,text: '否'}];
		function getdict(e){
			for (var i = 0, l = data.length; i < l; i++) {
                var g = data[i];
                if (g.id == e.value) return g.text;
            }
            return "否";
		}
		function getDetail(e){
	        return "<a href='javascript:void(0)' onclick='checkDetail();' title='人员工时填写记录'>" + e.value + "</a>";
	    }
	     function checkDetail(){
	 		var selectRow = grid.getSelected();
	 		var orgnameSend = orgname.replace("&","%26");
			var executeUrl = "<%=request.getContextPath()%>/labor/mgr/perLaborInput.jsp?userid=" + selectRow.userID +"&startdate=" + startdate + "&enddate="+enddate + "&orgname="+orgnameSend;
			var iWidth=1000; //弹出窗口的宽度;
			var iHeight=500; //弹出窗口的高度;
			var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
			window.open(executeUrl, "人员月度工时填写记录", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",toolbar=no,menubar=no,resizable=no");
	    }
	     function CloseWindow(action) {
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();            
	    }
	     function onCancel(e) {
	        CloseWindow("cancel");
	    }
	    var aaa= "";
	    var bbb= "";
	    function doCountNowPage(e){
	    	 if (e.field == "perActHours") {
                e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
                aaa=e.value;
             }
             if (e.field == "otwhours") {
                 e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
             }
             if (e.field == "stdworkdays") {
                 e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
             }
             if (e.field == "stdworkhour") {
                 e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
                 bbb= e.value;
             }
             if(e.field=="LaborRate"){
             	e.cellHtml = "<div align='right'><b>" + parseFloat(aaa/bbb*100).toFixed(2)+"%" + "</b></div>";
             }
	    }
	    function exportAtt(){
         form.loading("操作中，请稍后......");
         var json = {sdate:startdate,edate:enddate,orgname: orgname,sortField:"empname",sortOrder:"asc"};
			nui.ajax({
                url: "com.primeton.rdmgr.labor.labormgr.querryLaborRate4Export.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (o) {
             		form.unmask();
                	var filePath = o.downloadFile;
                	var fileName = "部门人员月度工时率";
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
    }
    </script>
</body>
</html>