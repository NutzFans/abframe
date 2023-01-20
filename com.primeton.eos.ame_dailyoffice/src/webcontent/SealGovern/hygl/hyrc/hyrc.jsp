<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	UserObject user = (UserObject) session.getAttribute("userObject");
	String username = user.getUserName();
	String userid = user.getUserId();
	String orgid = user.getUserOrgId();
	String orgname= user.getUserOrgName();
	String contextPath=request.getContextPath();
 %>
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
	<%@include file="/common/common.jsp"%>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= contextPath %>/common/nui/nui.js" type="text/javascript"></script>

	<link rel="stylesheet" href="<%=contextPath %>/ame_dailyoffice/SealGovern/css/form.css" type="text/css">
	<link rel="stylesheet" href="<%=contextPath %>/ame_dailyoffice/SealGovern/hygl/hyrc/hyrc.css" type="text/css">
    <script src="<%=contextPath %>/ame_dailyoffice/SealGovern/hygl/hyrc/hyrc.js" type="text/javascript"></script>
</head>
<body>

	<div class="hysq-content" onselectstart="return false">
        <div class="hysq-title">
            <div class="title-left clear">
                <div class="title-sjx active day_week">日</div>
                <div class="title-week day_week">周</div>
                <div class="title-today active">今天</div>
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
                    <span class="dsp">已保存</span>
                </div>
                <div class="sptg">
                    <b class="sptg"></b>
                    <span class="sptg">已提交</span>
                </div>
                <div class="addMetting">
                    <b class="add"></b>
                    <span class="add">添加会议</span>
                </div>

            </div>
        </div>

        <!--时间表-->
        <div class="time_node"></div>

        <!--单元格-->
        <div class="mettingContent"></div>

        <!--会议信息-->
        <div class="mettingMsg">
        </div>

        <%--会议悬浮信息--%>
        <div id="hyHover">
            <div><span>会议主题：</span><b class="zt"></b></div>
            <div><span>会议时间：</span><b class="sj"></b></div>
            <div><span>会议地点：</span><b class="dd"></b></div>
            <div><span>发起人员：</span><b class="ry"></b></div>
            <div><span>容纳人数：</span><b class="rs"></b></div>
            <div><span>设备情况：</span><b class="sb"></b></div>
            
            
        </div>

        <%--会议详细信息--%>
       <!--  <div id="detailData">
            <div class="hybt">
                <span>会议标题：</span>
                <b>新员工转正会</b>
            </div>
            <div class="hybt">
                <span>会议标题：</span>
                <b>新员工转正会</b>
            </div>
            <div class="hydd">
                <span>会议标题：</span>
                <b>新员工转正会</b>
            </div>
        </div> -->
    </div>

    <div class="logo_div logo_left"></div>
    <div class="logo_div logo_right"></div>

	<script type="text/javascript">
    	nui.parse();
		var ajid = '<%=request.getParameter("ajid") %>';
		var ywlx = '<%=request.getParameter("ywlx") %>';
		var processInstID = '<%=request.getParameter("processInstID") %>';
		var contextPath='<%= request.getContextPath() %>';

	    var sUserId='<%=userid %>'; // 员工id
	    var sUserName='<%=username %>';
	    
        var sUserBm;
        var param = {"empid":sUserId};
        var sFqrbm;
        var sFqrName_sx;
        // 发起人部门
        $.ajax({
                url : "com.primeton.eos.ame_dailyoffice.Hysxx.OrgEmpQuery.biz.ext", // 逻辑流
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
	            url: contextPath+"/ame_dailyoffice/SealGovern/hygl/hysq/hysp.jsp",
	            title:"申请会议表单",
	            width: "1270px",
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