<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%-- <%@page import="com.primeton.cap.AppUserManager"%> --%>
<head>
<title>经营管理系统</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="images/favicon.ico">
    <link rel="stylesheet" href="../../common/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
    <link rel="stylesheet" href="../../common/layuimini/css/layuimini.css?v=2.0.4.2" media="all">
    <link rel="stylesheet" href="../../common/layuimini/css/themes/default.css" media="all">
    <link rel="stylesheet" href="../../common/layuimini/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
    	.layui-layout-admin .layuimini-logo img{
    		height:30px;
    		margin-top:15px;
    	}
    	.layuimini-tool{
    		width:30px;
    		margin-right: 0px;
    	}
    </style>
    <style id="layuimini-bg-color">
    </style>
</head>   
<body class="layui-layout-body layuimini-all">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header header">
        <div class="layui-logo layuimini-logo"></div>
        <div class="layuimini-header-content">
            <a>
                <div class="layuimini-tool"><i title="展开" class="fa fa-outdent" data-side-fold="1"></i>
                	
                </div>
            </a>
			 <ul class="layui-nav layui-layout-left" style="">
				 <li class="layui-nav-item" lay-unselect style="margin-left: 0px;">
				 	<a  class="layui-nav-item" style="font-size: 16px;font-weight: bold;font-family: inherit;padding-left: 0">经营管理系统</a>
                    <a href="javascript:;" data-refresh="刷新"><i class="fa fa-refresh"></i></a>
                </li>
				
			</ul>
            <!--电脑端头部菜单-->
            <ul class="layui-nav layui-layout-left layuimini-header-menu layuimini-menu-header-pc layuimini-pc-show">
            </ul>
			
            <!--手机端头部菜单-->
            <ul class="layui-nav layui-layout-left layuimini-header-menu layuimini-mobile-show">
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="fa fa-list-ul"></i> 选择模块</a>
                    <dl class="layui-nav-child layuimini-menu-header-mobile">
                    </dl>
                </li>
            </ul>
			
            <ul class="layui-nav layui-layout-right">
				
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;" data-refresh="刷新"><i class="fa fa-refresh"></i></a>
                </li>
               <!--  <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;" data-clear="清理" class="layuimini-clear"><i class="fa fa-trash-o"></i></a>
                </li> -->
                <li class="layui-nav-item mobile layui-hide-xs" lay-unselect>
                    <a href="javascript:;" data-check-screen="full"><i class="fa fa-arrows-alt"></i></a>
                </li>
                <li class="layui-nav-item layuimini-setting">
                    <%-- <a href="javascript:;"><%=AppUserManager.getCurrentUserId() %></a> --%>
                    <a href="javascript:;" id="myname"></a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" layuimini-content-href="../../ame/clipview/myinfo.jsp" data-title="基本资料" data-icon="fa fa-gears">基本资料<span class="layui-badge-dot"></span></a>
                        </dd>
                        <!--<dd>
                            <a href="javascript:;" layuimini-content-href="../../common/layuimini/page/user-password.html" data-title="修改密码" data-icon="fa fa-gears">修改密码</a>
                        </dd>
                        <dd>
                             <a href="javascript:;" layuimini-content-href="../../coframe/rights/user/update_password.jsp" data-title="修改密码" data-icon="fa fa-gears">修改密码</a>
                        </dd>-->
                        <dd>
                            <hr>
                        </dd>
                        <dd>
                            <a href="javascript:;" class="login-out" layuimini-content-href="../../coframe/auth/login/logout.jsp">退出登录</a>
                        </dd>
                    </dl>
                </li>
                <li class="layui-nav-item layuimini-select-bgcolor" lay-unselect>
                    <a href="javascript:;" data-bgcolor="配色方案"><i class="fa fa-ellipsis-v"></i></a>
                </li>
            </ul>
        </div>
    </div>

    <!--无限极左侧菜单-->
    <div class="layui-side layui-bg-black layuimini-menu-left">
    </div>

    <!--初始化加载层-->
    <div class="layuimini-loader">
        <div class="layuimini-loader-inner"></div>
    </div>

    <!--手机端遮罩层-->
    <div class="layuimini-make"></div>

    <!-- 移动导航 -->
    <div class="layuimini-site-mobile"><i class="layui-icon"></i></div>

    <div class="layui-body">

        <div class="layuimini-tab layui-tab-rollTool layui-tab" lay-filter="layuiminiTab" lay-allowclose="true">
            <ul class="layui-tab-title">
                <li class="layui-this" id="layuiminiHomeTabId" lay-id=""></li>
            </ul>
            <div class="layui-tab-control">
                <li class="layuimini-tab-roll-left layui-icon layui-icon-left"></li>
                <li class="layuimini-tab-roll-right layui-icon layui-icon-right"></li>
                <li class="layui-tab-tool layui-icon layui-icon-down">
                    <ul class="layui-nav close-box">
                        <li class="layui-nav-item">
                            <a href="javascript:;"><span class="layui-nav-more"></span></a>
                            <dl class="layui-nav-child">
                                <dd><a href="javascript:;" layuimini-tab-close="current">关 闭 当 前</a></dd>
                                <dd><a href="javascript:;" layuimini-tab-close="other">关 闭 其 他</a></dd>
                                <dd><a href="javascript:;" layuimini-tab-close="all">关 闭 全 部</a></dd>
                            </dl>
                        </li>
                    </ul>
                </li>
            </div>
            <div class="layui-tab-content">
                <div id="layuiminiHomeTabIframe" class="layui-tab-item layui-show"></div>
            </div>
        </div>

    </div>
</div>
<iframe id="logoutIFrame" width="0" height="0" src=""></iframe>
<script src="<%= request.getContextPath() %>/common/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
<script src="<%= request.getContextPath() %>/common/layuimini/js/lay-config.js?v=2.0.0" charset="utf-8"></script>
<script>
<%
 	String pstatus = (String)session.getAttribute("pstatus");
 	UserObject user = (UserObject) session.getAttribute("userObject");
	String username = user.getUserName();
	String userid = user.getUserId();
	Map attr = user.getAttributes();
	DataObject[] roles = (DataObject[]) attr.get("roles");
	Boolean isSh = false;
	Boolean ismanageAdmin = false;
	for(int i=0;i<roles.length;i++){
		String rolesTemp = roles[i].getString("roleid");
		if(rolesTemp.equals("manager")||rolesTemp.equals("csoper")||rolesTemp.equals("csoutoper")||rolesTemp.equals("commerce")||rolesTemp.equals("cssyboper")){
			isSh = true;
		}
	}
%>
    layui.use(['jquery', 'layer', 'miniAdmin','miniTongji'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            miniAdmin = layui.miniAdmin,
            miniTongji = layui.miniTongji;

        var options = {
            iniUrl: "../../common/layuimini/api/init.json",    // 初始化接口
            clearUrl: "../../common/layuimini/api/clear.json", // 缓存清理接口
            urlHashLocation: false,      // 是否打开hash定位
            bgColorDefault: 7,      // 主题默认配置
            multiModule: false,          // 是否开启多模块
            menuChildOpen: false,       // 是否默认展开菜单
            loadingTime: 0,             // 初始化加载时间
            pageAnim: true,             // iframe窗口动画
            maxTabNum: 20,              // 最大的tab打开数量
        };
        miniAdmin.render(options);
		$('#myname').text('<%=username %>')
        // 百度统计代码，只统计指定域名
        miniTongji.render({
            specific: true,
            domains: [
                '99php.cn',
                'layuimini.99php.cn',
                'layuimini-onepage.99php.cn',
            ],
        });

        $('.login-out').on("click", function () {
            	layer.msg('退出登录成功');
        		 document.getElementById("logoutIFrame").src = "<%=request.getContextPath()%>/ame/clipview/clearSession.jsp";
        		window.location ="../../sso.login?SSOLOGOUT=true";
            	<%-- <%-- document.getElementById("logoutIFrame").src = "<%=request.getContextPath()%>/ame/clipview/clearSession.jsp"; --%>
				$.cookie('cas-login', null, {path: '/', domain: '.ame.primeton.com', expires: -1}); 
				
                /* window.location = '../../common/layuimini/page/login-3.html'; */
        });
    });
</script>
</body>
</html>