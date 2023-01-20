<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): laiwentao
  - Date: 2017-10-11 16:09:52
  - Description:
-->
<head>
<title>会议参与</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    
</head>
<body>
<div id="grid" class="nui-datagrid" dataField="data" url="com.geostar.gtgh.oa.officeaffairs.Hysq.queryHycyByHysqid.biz.ext"
 showPager="false">
    <div property="columns">
        <div field="cyzmc" width="100" headerAlign="center" allowSort="true">姓名</div>
    	<div field="qrzt" width="100" headerAlign="center" allowSort="true" renderer="renderQrzt">确认状态</div>
    	<div field="qrsj" width="100" headerAlign="center" allowSort="true" renderer="renderQrsj">确认时间</div>
    	<div field="jjyy" width="100" headerAlign="center" allowSort="true" renderer="renderJjyy">原因</div>
    	<div field="yqrmc" width="100" headerAlign="center" allowSort="true">邀请人</div>
    </div>
</div>
	<script type="text/javascript">
    	nui.parse();
    	var grid = nui.get("grid");
    	
    	function loadData(hysqid){
	    	grid.load({hysqid:hysqid});
    	}
    	function renderQrzt(e){
    		if(e.row.qrzt == "0"){
    			return "已拒绝";
    		}else if(e.row.qrzt == "1"){
    			return "已确认";
    		}else{
    			return "未查看";
    		}    		
    	}
    	
    	function renderQrsj(e){
    		return nui.formatDate(e.row.qrsj,"yyyy-MM-dd HH:mm");
    	}
    	
    	function renderJjyy(e){
    		if(e.row.jjyy != null){
    			return "<span title='"+e.row.jjyy+"'>"+e.row.jjyy+"</span>";
    		}else{
    			return "";
    		}
    	}
    	
    </script>
</body>
</html>