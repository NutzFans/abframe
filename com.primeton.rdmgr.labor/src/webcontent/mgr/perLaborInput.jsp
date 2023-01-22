<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): lixq
  - Date: 2016-08-31 09:42:31
  - Description:
-->
<head>
<title>个人工时填写情况</title>
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
		                       	人员月度项目工时当月填报记录
		                    </td>
		                </tr>
	                 </table>           
		        </div>
		    </div>

    <div id="datagrid1" class="nui-datagrid" style="width:100%;height:auto;" allowResize="false" pageSize="10" sizeList="[10,20,50,100,500]" showSummaryRow="true"
        url="com.primeton.rdmgr.labor.labormgr.querryLaborInput.biz.ext" dataField="LaborInput">
        <div property="columns">
            <div field="labordate" width="20" headerAlign="center" align="center" allowSort="false" dateFormat="yyyy-MM-dd">日期</div>   
            <div field="labordate" width="15" headerAlign="center" align="center" allowSort="false" renderer="getMyDay">星期</div>  
            <div field="userid" width="15" headerAlign="center" align="center" allowSort="false">用户ID</div>  
            <div field="empname" width="15" headerAlign="center" align="center" allowSort="false">姓名</div>
            <div field="orgname" width="20" headerAlign="center" align="center" allowSort="false">员工所属部门</div>
            <div field="acthours" width="15" headerAlign="center" dataType="float" decimalPlaces="2" align="center" >工作时间(h)</div>
            <div field="otwhours" width="15" headerAlign="center" dataType="float" decimalPlaces="2" align="center" allowSort="false">其中加班工时</div>
            <div field="projectname" width="25" headerAlign="center" align="center" allowSort="false">项目名称</div>
        </div>
    </div>
    <div style="text-align:center;padding:10px;">               
	    <a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>       
	</div> 
  </div>
    <script type="text/javascript">
    	nui.parse();
    	var grid = nui.get("datagrid1");
 		var form = new nui.Form("form1");
 		
 		var orgname = getUrlParam("orgname");
 		orgname=orgname.replace("%26","&");
 		var startdate = getUrlParam("startdate");
 		var enddate = getUrlParam("enddate");
 		var userid = getUrlParam("userid");
 		setDate();
		function setDate(){
    		var date1 = {sdate:startdate,edate:enddate,orgname:orgname,userid:userid};
		  	grid.load(date1);
		}
    	
  		function getper(e){
  			var rate = (e.value*100).toFixed(2)+"%";
  			return rate;
  		}
    	//获取url后面携带的明文内容
    	function getUrlParam(name) { 
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
			var r = window.location.search.substr(1).match(reg); 
			if (r != null) 
			return decodeURI(r[2]); 
			return null; 
		}
		function CloseWindow(action) {
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();            
	    }
		function onCancel(e) {
	        CloseWindow("cancel");
	    }
	    function getMyDay(e){
			var week; 
			var date = e.value;
			if(date.getDay()==0) week="周日"
			if(date.getDay()==1) week="周一"
			if(date.getDay()==2) week="周二" 
			if(date.getDay()==3) week="周三"
			if(date.getDay()==4) week="周四"
			if(date.getDay()==5) week="周五"
			if(date.getDay()==6) week="周六"
			return week;
		}
    </script>
</body>
</html>