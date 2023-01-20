<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): devil_sh
  - Date: 2017-02-07 13:57:02
  - Description:
-->
<head>
	<title>考勤信息查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body>
	<div class="nui-panel" title="考勤记录查询" width="100%">
		<!-- 考勤记录信息列表
		-->
	    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:400px;"  sortMode="client"
	    	url="com.primeton.eos.ame_common.ameAttendance.queryAttendanceDetailRecode.biz.ext" 
	         dataField="datas" frozenStartColumn="0" frozenEndColumn="4"
	    	pageSize="10" sizeList="[10,20,50,100]" >
			<div property="columns">
				<div field="CUSTJC" width="150" align="center" headerAlign="center" allowSort="true">客户(简称)</div> 
				<div field="PROJECT_NAME" width="150" align="center" headerAlign="center" allowSort="true">项目</div>			
				<div field="PROJECT_NO" width="100" align="center" headerAlign="center" allowSort="true">项目编号</div>
				<div field="SUPPLIERSNAME" width="100" align="center"  headerAlign="center" allowSort="true">供应商(简称)</div>
				<div field="ORGNAME" width="100" align="center"  headerAlign="center" allowSort="true">受益部门</div>
				<div field="OUTPERNAME" width="50" align="center"  headerAlign="center" allowSort="true">人员</div>
				<div field="MANAGERNAME" width="70" align="center"  headerAlign="center" allowSort="true">汇报对象</div>
				<div field="RULEDETAIL" width="80" align="center" headerAlign="center" allowSort="true">考勤时点</div>
				<div field="SIGNDATE" width="80" align="center" headerAlign="center" dateFormat="yyyy-MM-dd" allowSort="true">考勤日期</div>	
				<div field="SIGNINTIME" width="80" align="center"  headerAlign="center" allowSort="true">签到时间</div>	
				<div field="SIGNINFLAG" width="80" align="center"  headerAlign="center" allowSort="true">是否迟到</div>
				<div field="SIGNINLOCATION" width="200" align="center"  headerAlign="center" allowSort="true">签到位置</div>
				<div field="SIGNINDISTANCE" width="80" align="center"  headerAlign="center" dataType="int" allowSort="true">签到距离(米)</div>
				<div field="SIGNOUTTIME" width="85" align="center"  headerAlign="center" allowSort="true">签退时间</div>
				<div field="SIGNOUTFLAG" width="80" align="center"  headerAlign="center" allowSort="true">是否早退</div>
				<div field="SIGNOUTLOCATION" width="200" align="center"  headerAlign="center" allowSort="true">签退位置</div>
				<div field="SIGNOUTDISTANCE" width="80" align="center"  headerAlign="center" dataType="int" allowSort="true">签退距离(米)</div>
			</div>
	   </div>	
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var grid = nui.get("datagrid1");
	//var name = getUrlParam("name");
	var name = '<%=request.getParameter("name") %>';
	var year = '<%=request.getParameter("year") %>';
	var month = '<%=request.getParameter("month") %>';
	var projectno = '<%=request.getParameter("projectno") %>';
	/* var year = getUrlParam("year");
	var month = getUrlParam("month");
	var projectno = getUrlParam("projectno"); */
  	var clockTimeMin = year + '-' + month + '-01';  //获取月初
  	var day = new Date(year,month,0);   
    var clockTimeMax = year + '-' + month + '-' + day.getDate();//获取月末
	var json = {map:{name:name,clockTimeMin:clockTimeMin,clockTimeMax:clockTimeMax,projectNo:projectno}};
	setData(json);
	function setData(data){
		grid.load(data);
	}
	/* function getUrlParam(name) { 
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
		var r = window.location.search.substr(1).match(reg); 
		if (r != null) 
		return unescape(r[2]); 
		return null; 
	} 				
    function toggleFieldSet(ck, id) {
        var dom = document.getElementById(id);
        dom.className = !ck.checked ? "hideFieldset" : "";
    }   */
</script>
</html>