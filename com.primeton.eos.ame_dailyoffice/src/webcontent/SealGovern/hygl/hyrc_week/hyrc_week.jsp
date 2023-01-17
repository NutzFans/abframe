<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--
  - Author(s): wusiru
  - Date: 2017-08-14 11:15:47
  - Description:
-->
<head>
<title>会议日程</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />

    <!-- 引入表单框架jsp -->
	<%@include file="/gdgz/common/common/gdgzCommon.jsp"%>

	<link rel="stylesheet" href="<%=request.getContextPath() %>/officeaffairs/hygl/hyrc_week/hyrc_week.css" type="text/css">
    <script src="<%=request.getContextPath() %>/officeaffairs/hygl/hyrc_week/hyrc_week.js" type="text/javascript"></script>

</head>
<body>

	<div class="hysq-content" onselectstart="return false">
        <div class="hysq-title">
            <div class="title-left clear">
                <div class="title-sjx day_week">日</div>
                <div class="title-week day_week active">周</div>
                <div class="title-today active">本周</div>
                <input class="nui-datepicker" onvaluechanged="changeDate"/>
            </div>

            <div class="date-show">
                <b class="prev-day" id="prev-day"></b>
                <span class="now-date"></span>
                <b class="next-day" id="next-day"></b>
            </div>

            <div class="title-right clear">
                <div class="dsp">
                    <b class="dsp"></b>
                    <span class="dsp">待审批</span>
                </div>
                <div class="sptg">
                    <b class="sptg"></b>
                    <span class="sptg">审批通过</span>
                </div>
                <div class="addMetting">
                    <b class="add"></b>
                    <span class="add">添加</span>
                </div>

            </div>
        </div>

        <div class="g-time-content">
            <!--时间表-->
            <div class="time_node"></div>

            <!--单元格-->
            <div class="mettingContent"></div>
        </div>

        <!--会议信息-->
        <div class="mettingMsg">

        </div>

    </div>

    <div class="logo_div logo_left"></div>
    <div class="logo_div logo_right"></div>

	<script type="text/javascript">
    	nui.parse();
		var ajid = '<%=request.getParameter("ajid") %>';
		var ywlx = '<%=request.getParameter("ywlx") %>';
		var processInstID = '<%=request.getParameter("processInstID") %>';
		var contextPath='<%= request.getContextPath() %>';

		var sUserId=nuiCurrUser.userId; // 员工id
	    var sUserName=nuiCurrUser.userName;
        var param = {"empid":sUserId};
        var sFqrName_sx;
        // 发起人部门
        $.ajax({
                url : "com.geostar.gtgh.oa.gdgz.common.OrgEmp.OrgEmpQuery.biz.ext", // 逻辑流
                type : 'POST',
                data : nui.encode({param:param}),
                cache : false,
                async : false,
                contentType : 'text/json',
                success : function(text) {
                	// 发起人部门
                	sFqrbm=text.orgEmps[0].orgname;
                	sFqrName_sx=text.orgEmps[0].userid; // 发起人名称缩写
                }
        });


		if(processInstID!=""&& processInstID&&processInstID!="null"){
			  nui.open({
	            url: contextPath+"/officeaffairs/hyrc/hysqb.jsp",
	            title:"申请会议表单",
	            width: "880px",
	            height: "650px",
	            onload:function(){
	           		var iframe = this.getIFrameEl().contentWindow;
	           		iframe.initData({processInstID:processInstID});
	            }
        	});
		}

    </script>
</body>
</html>