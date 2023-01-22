<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/nui/common.jsp"%>
<link id="css_skin" rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/coframe/tools/skins/skin1/style.css" />
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="java.util.Map"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="com.eos.foundation.eoscommon.BusinessDictUtil" %>
<html>
<!-- 
  - Author(s): zhuhx
  - Date: 2016-08-23 13:53:14
  - Description:
-->
<head>
<title>项目执行跟踪</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
		.asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;
	    }
	</style>
</head>
<body style="height:100%">
	<fieldset id="field1" style="border:solid 1px #aaa;padding:8px;">
    <legend>项目基本信息</legend>         
   		<div style="padding:8px;">
        	<table style="table-layout:fixed;">
				<tr>
               	 	<td style="width:105px" align="right">项目名称:</td>
               	 	<td style="width:280px" id="projectName" class = "asLabel"></td>
                    <td style="width:90px" align="right">项目编号:</td>
                    <td style="width:140px" id="projectno" class = "asLabel"></td>
                    <td style="width:105px" align="right">所属客户:</td>
                    <td style="width:200px" id="custname" class = "asLabel"></td>
                    <td style="width:105px" align="right">受益销售:</td>
                    <td style="width:200px" id="orgname" class = "asLabel"></td>
            	</tr>
			</table>
    	</div>
    </fieldset>
	<fieldset id="field1" style="border:solid 1px #aaa;padding:8px;">
        <legend>项目成本执行跟踪</legend>     
		<form id="form1" method="post" >
			<div class="nui-toolbar" id="id2" style="border-bottom:0;padding:0px;" >
			    <table style="width:100%;">
			        <tr>
			            <td>
			                <a class="nui-button" id="calBtn" iconCls="icon-edit" onclick="cal()" plain="true">重新生成统计数据</a>       
			                <a class="nui-button" id="exportBtn" iconCls="icon-download" onclick="exportPrj()" plain="true">导出</a>       
			            </td>
			            <td style="width:200px;" align="right">最近计算日期：</td>
		                <td style="width:200px;" id="lastcaldate"></td>
			        </tr>
			    </table>           
			</div>
		    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" allowResize="true" pageSize="20" sizeList="[10,20,50,100,500]"  showPager="true"
		    url="com.primeton.eos.ame_budget.ame_budget.queryPexecut.biz.ext" dataField="pexecuts" showSummaryRow="true" ondrawsummarycell="onDrawSummaryCell" onload="afterload" >
		        <div property="columns">
		            <div type="indexcolumn" width="15"></div>        
		            <div field="cycle" width="95" headerAlign="center">本周周期</div>    
		            <div field="weekly" width="34" headerAlign="center">周次</div>       
		            <div header="周费用预算（元）" headerAlign="center">
		                <div property="columns">
		                    <div field="webudpemp" headerAlign="center" datatype="currency" renderer="dealformat" summaryType="sum" align="right"  width="52">周人工成本</div>
		                    <div field="webudpdir" headerAlign="center" datatype="currency" renderer="dealformat" summaryType="sum" align="right"  width="50">周直接费用</div>
		                    <div field="webudpout" headerAlign="center" datatype="currency" renderer="dealformat" summaryType="sum" align="right"  width="50">周外包费用</div>
		                    <div field="webudpwb" headerAlign="center" datatype="currency" renderer="dealformat" summaryType="sum" align="right"  width="50">周外部采购</div>
		                    <div field="webucost" headerAlign="center"  datatype="currency" renderer="dealformat" summaryType="sum" align="right" width="50">周预算成本</div>
		                    <div field="tobucost" headerAlign="center"  numberFormat="n0" align="right"  width="50">累计预算</div>
		                </div>
		            </div>
		            <div header="周实际成本" headerAlign="center">
		                <div property="columns">
		                    <div field="weactnum" headerAlign="center" align="center"  width="52">本周内部人数</div>
		                    <div field="weactwork" headerAlign="center" align="center" summaryType="sum" width="52">周内部工作量(H)</div>
		                    <div field="weactpemp" headerAlign="center" datatype="currency" summaryType="sum"  align="right" renderer="getDetail1" width="51">周人工成本</div>
		                    <div field="weactpdir" headerAlign="center" datatype="currency" summaryType="sum"  align="right" renderer="getDetail2" width="50">周直接费用</div>
		                    <div field="weactoutnum" headerAlign="center"  align="center"  width="53">本周外包人数</div>
		                    <div field="weactpout" headerAlign="center" dataType="currency" summaryType="sum" align="right" renderer="dealformat" width="51">周外包成本</div>
		                    <div field="weactpwb" headerAlign="center" dataType="currency" summaryType="sum" align="right" renderer="dealformat" width="51">周外部采购</div>
		                    <div field="weactcost" headerAlign="center" datatype="currency" renderer="dealformat" summaryType="sum" align="right" width="50">周实际成本</div>
		                    <div field="antocost" headerAlign="center" numberFormat="n0" align="right"  width="52">当年累计成本</div>
		                    <div field="tocost" headerAlign="center" numberFormat="n0" align="right"  width="50">累计成本</div>
		                </div>
		            </div>
		        </div>
	        </div>
    	</form>
    	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
     <!-- 获取传递到图表的参数 -->
    <%Long aa=Long.parseLong(request.getParameter("projectId"));
    	String amereportpath = BusinessDictUtil.getDictName("AME_SYSCONF", "AMEREPORT");
    %>
   
   <!--  将页面上的参数传递到润乾图表 -->
	  	<iframe src="<%=amereportpath %>reportJsp/showReport4Proj.jsp?rpx=/prjWeekCost.rpx&projectid=<%=aa %>" frameborder="0" scrolling="no" height="2000px" width="100%" style="text-align: left;"></iframe>
	  	<%--<div  scrolling="no" style="text-align: left;height:2000px;width:100%">
	  	<jsp:include page="/reportJsp/showReport.jsp?rpx=/prjWeekCost.rpx"> 
	  	<jsp:param name="projectid" value="<%=aa %>"/>
	  	</jsp:include>
	  	</div>--%>
    </fieldset>
   
	  
    <script type="text/javascript">
        nui.parse();
        var grid = nui.get("datagrid1");
        var projectid="<b:write property='projectId'/>";
        var projectno="<b:write property='projectno'/>";
        var startdate="<b:write property='startdate'/>";
        var projectName="<b:write property='projectName'/>";
        var custname="<b:write property='custname'/>";
        var orgname="<b:write property='orgname'/>";
        if(projectid){
        }else{
	         projectid = <%=request.getParameter("projectId")%>;
	         projectno = "<%=request.getParameter("projectno")%>";
	         startdate = "<%=request.getParameter("startdate")%>";
	         projectName = "<%=request.getParameter("projectName")%>";
	         custname = "<%=request.getParameter("custname")%>";
	         orgname = "<%=request.getParameter("orgname")%>";
        }
        init();
        function init(){
        	document.getElementById("projectName").innerHTML = projectName == null ? "" : projectName;
        	document.getElementById("projectno").innerHTML = projectno == null ? "" : projectno;
        	document.getElementById("custname").innerHTML = custname == null ? "" : custname;
        	document.getElementById("orgname").innerHTML = orgname == null ? "" : orgname;
	    	var data={"projectid":projectid,"criteria":{"_orderby":{"_property":"cycle"}}};
	        grid.load(data);
        }
        function cal(){
    		var json = {projectid:projectid,projectno:projectno};
        	json = nui.encode(json);
        	if (confirm("是否确定计算？")) {
        		nui.get("calBtn").disable();
	            grid.loading("操作中，请稍后......");
	            nui.ajax({
	                url: "com.primeton.eos.ame_budget.ame_budget.calPrjWeekCost.biz.ext",
	                type: "post",
	                data: json, 
	                cache: false,
	                contentType: 'text/json',
	                success: function (text) {
		                if(text.count1==1){
		                	alert("计算失败!");
		                }else if(text.count1==2){
		                	alert("该项目未发生任何成本!");
		                }else {
		                	alert("计算成功!");
		                }
		              	window.location.reload(); 
		                nui.get("calBtn").enable();
	                },
	                error: function () {
	                alert("计算失败!");
	                }
	           });
        	}
        }
        function afterload(){
			var o=grid.getData();
			if(o.length!=0){
				document.getElementById("lastcaldate").innerHTML = o[0].lastcaldate;
				if(o.length==1){
					if(o[0].cycle == "" || o[0].cycle == null){
						grid.clearRows();
					}
				}
			} 
		}
       function getDetail1(e){
       		if(e.value){
        		return "<a href='javascript:void(0)' onclick='checkDetail1();' title='点击查看'> " + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + " </a>";
       		}else{
       			return 0;
       		}
        }
        function checkDetail1(){
	 		var selectRow = grid.getSelected();
	 		var cycle=selectRow.cycle;
	 		var startdate=cycle.split("-")[0];
	 		var enddate=cycle.split("-")[1];
			var executeUrl = "/default/ame_budget/detailPempcost.jsp?id=" + selectRow.projectid+"&startdate="+startdate+"&enddate="+enddate;
			window.open(executeUrl, "应用详细信息", "fullscreen=1");
	    }
	    function getDetail2(e){
        	if(e.value){
        		return "<a href='javascript:void(0)' onclick='checkDetail2();' title='点击查看'> " + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + " </a>";
       		}else{
       			return 0;
       		}
        }
        function checkDetail2(){
	 		var selectRow = grid.getSelected();
	 		var cycle=selectRow.cycle;
	 		var startdate=cycle.split("-")[0];
	 		var enddate=cycle.split("-")[1].replace(/\//g,'-');
			var executeUrl = "/default/ame_budget/detailPdircost.jsp?id=" + selectRow.projectid+"&startdate="+startdate+"&enddate="+enddate;
			window.open(executeUrl, "应用详细信息", "fullscreen=1");
	    }
	    /* function getDetail3(e){
        	if(e.value){
        		return "<a href='javascript:void(0)' onclick='checkDetail3();' title='点击查看'> " + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + " </a>";
       		}else{
       			
       			return 0;
       		}
        } */
        function dealformat(e){
        	if(e.value){
        		return e.cellHtml.substr(".",(e.cellHtml.length - 3));
       		}else{
       			
       			return 0;
       		}
        }
        /* function checkDetail3(){
	 		var selectRow = grid.getSelected();
	 		var cycle=selectRow.cycle;
	 		var startdate=cycle.split("-")[0];
	 		var enddate=cycle.split("-")[1];
			var executeUrl = "/default/ame_budget/detailPoutcost.jsp?id=" + projectno+"&startdate="+startdate+"&enddate="+enddate;
			window.open(executeUrl, "应用详细信息", "fullscreen=1");
	    } */
	   function onDrawSummaryCell(e) {
            if(e.field=='webudpemp'){
            	if(e.value !=0 ){
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</b></div>";
            	}else{
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            	}
            }
             if(e.field=='webudpdir'){
            	if(e.value!=0){
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</b></div>";
            	}else{
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            	}
            }
            if(e.field=='webudpout'){
            	if(e.value!=0){
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</b></div>";
            	}else{
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            	}
            }
   			if(e.field=='webucost'){
            	if(e.value!=0){
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</b></div>";
            	}else{
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            	}
            }
             if(e.field=='weactwork'){
        		e.cellHtml = "<div align='center'><b>" + e.cellHtml + "</b></div>";
            } 
            if(e.field=='weactpemp'){
            	if(e.value!=0){
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</b></div>";
            	}else{
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            	}
            } 
            if(e.field=='weactpdir'){
            	if(e.value!=0){
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</b></div>";
            	}else{
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            	}
            } 
            if(e.field=='weactpout'){
            	if(e.value!=0){
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</b></div>";
            	}else{
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            	}
            } 
             if(e.field=='webudpwb'){
            	if(e.value!=0){
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</b></div>";
            	}else{
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            	}
            } 
             if(e.field=='weactpwb'){
            	if(e.value!=0){
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</b></div>";
            	}else{
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            	}
            }
             if(e.field=='weactcost'){
            	if(e.value!=0){
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml.substr(".",(e.cellHtml.length - 3)) + "</b></div>";
            	}else{
            		e.cellHtml = "<div align='right'><b>" + e.cellHtml + "</b></div>";
            	}
            }  
        }
        //导出
        function exportPrj(){
		 var form = new nui.Form("#form1");
         form.loading("操作中，请稍后......");
         	var json=nui.encode({projectid:projectid});
			nui.ajax({
                url: "com.primeton.eos.ame_budget.ame_budget.exportPrj.biz.ext",
                type: "post",
                data: json,
                cache: false,
                contentType: 'text/json',
                success: function (o) {
             		form.unmask();
                	var filePath = o.downloadFile;
                	var fileName = "项目成本执行跟踪";
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
    </div>
</body>
</html>