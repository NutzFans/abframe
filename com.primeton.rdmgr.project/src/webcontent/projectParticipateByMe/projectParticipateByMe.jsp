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
<div class="nui-fix">
	<div class="nui-panel" title="我参与的项目" style="width:100%;">
        <div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
        	<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table align="center" border="0" width="100%" class="form_table">
        <tr>
          <td class="form_label" align = "right"> 项目编号</td>
          <td colspan="1">
	    	<input name="criteria._expr[6]._value" class="nui-textbox" style="width:150px;"  />
          </td>
          <td class="form_label" align = "right"> 项目名称</td>
          <td colspan="1">
	    	<input name="criteria._expr[0]._value" class="nui-textbox" style="width:150px;"  />
          </td>
          <td class="form_label" align = "right"> 客户名称</td>
          <td colspan="1">
	    	<input name="criteria._expr[1]._value" class="nui-textbox" style="width:190px;" />
          </td>
      </tr>
      <tr>
  		<td class="form_label" align = "right">受益人</td>
      	<td colspan="1">
            <input name="criteria._expr[4]._value" class="nui-textbox" style="width:150px;"  />
        </td>
       <td class="form_label" align = "right">受益部门</td>
       <td colspan="1">
		 <input name="criteria._expr[5]._value" class="nui-combobox" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" 
			filterType="like" textField="orgname" valueField="orgseq" dataField="allorgs" valueFromSelect="true" allowInput="true"  shownullItem="true" style="width:150px;"/>
       </td>
       <td class="form_label" align = "right">服务期间</td>
          <td colspan="1">
            <input class="nui-datepicker" name="criteria._expr[2]._value" id="mindate" style="width:95px"/>-<input class="nui-datepicker" name="criteria._expr[3]._value" style="width:95px"/>
          </td>
          <input name="criteria._expr[7]._value" class="nui-hidden" value="1,2,4,0"/>
		  <input class="nui-hidden" name="criteria._expr[7]._property" value="projectStatus"/>
		  <input class="nui-hidden" name="criteria._expr[7]._op" value="in"/>
	  </tr>
	  <tr align="center">
          <td colspan="7">
              <a class="nui-button" id="search" iconCls="icon-search" onclick="search()">查询</a>
              <a class="nui-button" id="reset" iconCls="icon-reload" onclick="reset()">重置</a>
          </td>
	  </tr>
      </table>
	</div>
</div>
    	<div style="width:100%;">
    		<div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="barchart" iconCls="icon-zhuzhuangtu2" onclick="openBar()">柱状图展示</a>
	                    </td>
	                </tr>
	             </table>           
	        </div>
            <div id="datagrid1" frozenStartColumn="0" frozenEndColumn="4" sizeList="[10,20,50,100]" showPager="true" dataField="projects" 
            	showSummaryRow="true"  sortMode="client"  ondrawsummarycell="onDrawSummaryCell"
            	class="nui-datagrid" style="width:100%;height:400px;" url="com.primeton.rdmgr.project.queryProjByMe.queryProjByMe.biz.ext" 
            	multiSelect="true" allowSortColumn="true">
                <div property="columns">
                	<div field="projectNo" width="100" align="center" headerAlign="center" allowSort="true" >项目编号</div>
                	<div field="projectName" width="140" align="left"headerAlign="center" allowSort="true" renderer="getLab">项目名称</div>
	            	<div field="custjc" width="80" align="left"headerAlign="center" allowSort="true" >所属客户</div>
                    <div field="orgname" width="90" align="center" headerAlign="center" allowSort="true" >受益部门</div>
                     <div field="mindate" width="80" align="center" headerAlign="center" allowSort="true" renderer="formartDate">最早工时日期</div>
                    <div field="maxdate" width="80" align="center" headerAlign="center" allowSort="true" renderer="formartDate">最近工时日期</div>
                    <div field="days" width="80" align="right" headerAlign="center" allowSort="true"  summaryType="sum">工作天数</div>
                    <div field="costs" width="100" align="right" headerAlign="center" allowSort="true" dataType="currency" summaryType="sum">工时定额成本</div>
                    <div field="empname" width="80" align="center" headerAlign="center" allowSort="true"  >项目负责人</div>
                    <div field="projectStatus" width="80" align="center" headerAlign="center" allowSort="true" renderer="dictGetStatus">项目内部状态</div>
                    <div field="projectType" width="120" align="center" headerAlign="center" allowSort="true" renderer="dictGetType">项目类型</div>
                    <div field="createdate" width="80" align="center" headerAlign="center" allowSort="true" renderer="formartDate">项目创建时间</div>
                </div>
            </div>
		</div>
	</div>
</div>
<script type="text/javascript">
    	nui.parse();
		var form = new nui.Form("#form1");
    	var grid = nui.get("datagrid1");
    	var date = new Date();
    	var year = date.getFullYear();
    	var yearmonth = year + "-01"+"-01";
    	nui.get("mindate").setValue(yearmonth);
	    
    	search();
    	function init(){
    		grid.load();
    		grid.sortBy("days","desc");
		}

		function dictGetType(e){
			return nui.getDictText('PROJECT_TYPE',e.value);
		}
		function dictGetStatus(e){
			return nui.getDictText('MIS_PROJSTATUS',e.value);
		}
		 
		function formartDate(e){
			return nui.formatDate(e.value, "yyyy-MM-dd");
		} 
		
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
		
		function onOk(){
			search();
		}
		
		//回车触发
		function onKeyEnter(){
			search();
		}
		
		function getLab(e){
	    	var mindate = e.record.mindate;
	    	if(mindate){
	    		return "<a href='javascript:void(0)' onclick='checkExpNo();' title='点击查看'>" + e.value + "</a>";
	    	}else{
	    		return e.value;
	    	}
	    }
	    function checkExpNo(){
	    	var selectRow = grid.getSelected();
			var executeUrl = "<%= request.getContextPath() %>/project/projectParticipateByMe/getProjLabor.jsp?userid=" + selectRow.userid + "&projectId=" + selectRow.projectId;
			window.open(executeUrl);
	    }
	    
	    function onDrawSummaryCell(e) {
		    var result = e.result;
		    var grid = e.sender;
		    if (e.field == "maxdate") {
		        e.cellHtml = "<span style='display: block;font-weight: bold;font-size: 12px;text-align: right;'>合计：</span>";
		    }
		    if (e.field == "days") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		    if (e.field == "costs") {
		    	e.cellHtml = "<span style='display: block;font-weight: bold;text-align: right;'>" + e.cellHtml + "</span>";
		    }
		}
		
		function openBar(){
			var executeUrl = "/default/ame/clipview/joinProjectBar.jsp";
			window.open(executeUrl, "我参与的项目柱状图展示", 'height=500, width=1000, top=200, left=200, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, status=no');
		}
		
</script>
</body>
</html>