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
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>

	<link rel="stylesheet" href="<%=request.getContextPath() %>/ame_dailyoffice/SealGovern/css/form.css" type="text/css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/ame_dailyoffice/SealGovern/hygl/hyrcWeek/hyrcWeek.css" type="text/css">
    <script src="<%=request.getContextPath() %>/ame_dailyoffice/SealGovern/hygl/hyrcWeek/hyrcWeek.js" type="text/javascript"></script>

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

            <%--会议室选择--%>
            <div id="hys" class="clear">
                <lable>会议室：</lable>
                <div class="hys_msg">
                    <div class="clear">
                        <span class="hysmc">全部</span>
                        <b class="search"></b>
                    </div>
                    <div class="div_ul">
                        <ul>
                            <li class="clear allHys">
                                <input type="checkbox" checked/>
                                <div>全部</div>
                            </li>
                        </ul>
                        <div class="button">
                            <div class="yes">确定</div>
                            <%--<div class="cancel">取消</div>--%>
                        </div>
                    </div>
                </div>

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
            <div class="mettingContent">

            </div>
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

		var sUserId='<%=userid %>'; // 员工id
	    var sUserName='<%=username %>';
        var param = {"empid":sUserId};
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

		/* if(processInstID!=""&& processInstID&&processInstID!="null"){
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
 */
    </script>
</body>
</html>