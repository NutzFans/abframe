<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): lipc
  - Date: 2020-04-28 15:11:04
  - Description:
-->
<head>
<title>导师反馈记录</title>
<link href="<%= request.getContextPath() %>/ame_common/layer/layui.css" rel="stylesheet">
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame/clipview/assets/js/jquery.min.js"></script>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="../demo.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    </style>
</head>
<body>
<div class="nui-fit">
	 	<form id="form1" method="post" >
	        <fieldset style="border:solid 1px #aaa;padding:3px;" id="feildchange">
            <legend>导师反馈记录</legend>
            <div id="returnDetails_grid" class="nui-datagrid" style="width:100%;height:auto;" dataField="tutorReturn1" 
	            showPager="false" url="org.gocom.abframe.org.employee.EmpManager.tutorReturnDetails.biz.ext" >			            
	         <div property="columns">
	        <div field="evaluatetime" width="60" headerAlign="center" align="center" allowSort="true" format="yyyy-mm">评价年月</div>
	    <!-- 	<div field="yjbm" width="80" headerAlign="center" align="center" >一级部门</div>
	    	<div field="ejbm" width="80" headerAlign="center" align="center" >二级部门</div>
	    	<div field="bjbm" width="80" headerAlign="center" align="center" >本级部门</div> -->
	    	<div field="username" width="60" headerAlign="center" align="center" >员工姓名</div>
	    	<div field="tutorname" width="60" headerAlign="center" align="center" allowSort="true">导师姓名</div>
	    	<div field="evaluatetype" width="50" headerAlign="center" align="center" allowSort="true" renderer="evaluatetype">工作态度</div>
	    	<div field="evaluatetype" width="50" headerAlign="center" align="center" allowSort="true" renderer="evaluatetype">工作满意度</div>
	    	<div field="monthlyachievement"  width="110" headerAlign="center"  align="center" allowSort="true" >本月目标达成情况</div>
	    	<div field="achevementup"  width="110" headerAlign="center"  align="center" allowSort="true" >绩效提升之处</div>
	    	<div field="achevementdown"  width="110" headerAlign="center"  align="center" allowSort="true" >绩效不足之处</div>
	    	<div field="nextplan" width="110" headerAlign="center" align="center" allowSort="true">下一阶段改进计划</div>  
        	<div field="evaluatelastchangetime"  width="60" headerAlign="center"  align="center" allowSort="true" >评价最后修改日期</div>
	    	</div>
	        </div>
        </fieldset>
        
        </form>
</div>
	<div style="text-align:center;padding:10px;border-width:1px 0px 0px 0px;" id="temp1" class="nui-toolbar">
		
    	<a class="nui-button" onclick="onCancel" style="width:60px;">关闭</a>
	</div> 
	    <script type="text/javascript">
			nui.parse();
	    	var form = new nui.Form("form1");
			var returnDetails_grid = nui.get("returnDetails_grid");
	    	var userid= getUrlParam("id");
			init();
			function init(){
			
			returnDetails_grid.load({"userid1":userid})
			
			
			}
			function getUrlParam(name) { 
				var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
				var r = window.location.search.substr(1).match(reg); 
				if (r != null) 
				return unescape(r[2]); 
				return null; 
			} 
			
		   
	
		function onCancel(e) {
			if (window.CloseOwnerWindow) return window.CloseOwnerWindow();
	        else window.close();  
	    }
	    function evaluatetype(e) {
		return nui.getDictText('AME_EVALUATETYPE',e.value);//设置业务字典值
		}
		 function workattitude(e) {
		return nui.getDictText('AME_WORKATTITUDE',e.value);//设置业务字典值
		}
		
		
	   </script>
</body>
</html>