<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-02-27 10:10:45
  - Description:
-->
<head>
<title>我参与的项目</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-panel" title="工时详情" style="width:100%;height: 100%">
    	<div style="width:100%;">
            <div id="datagrid1"  sizeList="[10,20,50,100]" showPager="false"dataField="labors" showSummaryRow="true"  sortMode="client"  ondrawsummarycell="onDrawSummaryCell"
            	class="nui-datagrid" style="width:100%;height:auto;" multiSelect="true" allowSortColumn="true">
                <div property="columns">
                	<div field="empname" width="40" align="center" headerAlign="center" allowSort="true" renderer="getLab">人员</div>
                	<div field="laborDate" width="60" align="center" headerAlign="center" allowSort="true" >工作日期</div>
                	<div field="projectno" width="80" align="center"headerAlign="center" allowSort="true" >项目编号</div>
                	<div field="projectName" width="100" align="left"headerAlign="center" allowSort="true" >项目名称</div>
                	<div field="omOrganization.orgname" width="80" align="center" headerAlign="center" allowSort="true" >受益部门</div>
	            	<div field="actHours" width="40" align="right"headerAlign="center" allowSort="true" summaryType="sum">工作时间</div>
                    <div field="otwHours" width="40" align="right"headerAlign="center" allowSort="true" summaryType="sum">其中加班工时</div>
                    <div field="cost" width="60" align="right" headerAlign="center" allowSort="true"  summaryType="sum">工时成本</div>
                    <div field="repContent" width="200" align="left"headerAlign="center" allowSort="true" >工作内容</div>
                </div>
            </div>
		</div>
	</div>
<script type="text/javascript">
    	nui.parse();
    	var grid = nui.get("datagrid1");
    	var userid='<%=request.getParameter("userid") %>';
    	var projectId='<%=request.getParameter("projectId") %>';
	    
    	setDate();
    	function setDate(){
			var json = nui.encode({userid:userid,projectId:projectId});
			nui.ajax({
		            url: "com.primeton.rdmgr.project.queryProjByMe.getProjLab.biz.ext",
					type: 'POST',
					data: json,	
					contentType: 'text/json',
		            success: function (o) {
		            	o = nui.decode(o);
		                if(o.result==1){
		                	alert("查询失败!");
		                }else{
			               	grid.setData(o.labors);
			               	grid.sortBy("laborDate","desc");
		                }
					}
		     });
		}

		function dictGetType(e){
			return nui.getDictText('PROJECT_TYPE',e.value);
		}
		function dictGetStatus(e){
			return nui.getDictText('MIS_PROJSTATUS',e.value);
		}
		function dictGetOrg(e){
			return nui.getDictText('CONT_ORG',e.value);
		}
		 
		function formartDate(e){
			return nui.formatDate(e.value, "yyyy-MM-dd");
		} 
		
	    function onDrawSummaryCell(e) {
		    var result = e.result;
		    var grid = e.sender;
		    if (e.field == "projectName") {
		        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
		    }
		    if (e.field == "actHours") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "otwHours") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "cost") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		}
		
</script>
</body>
</html>