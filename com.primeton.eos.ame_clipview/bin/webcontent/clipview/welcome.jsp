<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@include file="/ame/clipview/common.jsp"%>
<html lang="en" class="no-js">
	<!--<![endif]-->
	<!-- start: HEAD -->
<head>
	<title>中核咨询企业经营管理系统</title>
	<link rel="stylesheet" href="assets/plugins/fullcalendar/fullcalendar/fullcalendar.css">
	<link rel="shortcut icon" href="assets/images/title_logo.png" />
	<style>
		body{overflow-x:hidden}
		#a1,#a2{color:#428bca;float: right;border: 0;margin: 0;width: 15px;height:15px;font-size: 16px;
		  line-height: 15px;padding:0!important;margin-right: 20px;display: block;}
		.div1{color: #333333;font-size: 12px;font-weight: 300;margin: 0;padding: 8px 8px 6px; 
			border-bottom: 1px solid rgba(100, 100, 100, 0.22);white-space: normal !important;display: block;}
		.div2{display: block;margin-left: -15px;margin-right: -15px;height: 17px;}
		.span1{color:#0362FD;}
		.span2{color:#0362FD;float:right;}
		.span3{color:#333333;display: block;}
		.span4{font-size: 14px;font-weight: 300;}
		.icons1{color: #007AFF;display: inline-block;text-shadow: none;font-size: 16px;font-weight: normal;}
</style>
</head>
<body>
<div class="row" id="windowContent"></div>
		<!-- end: HEADER -->
<iframe id="logoutIFrame" width="0" height="0" src=""></iframe>
</body>
<!-- end: BODY -->
<!-- start: MAIN JAVASCRIPTS -->
<script src="assets/js/main.js"></script>
<!-- end: MAIN JAVASCRIPTS -->
<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
<!-- start: 首页柱状图 -->
<script src="assets/plugins/flot/jquery.flot.js"></script>
<script src="assets/plugins/flot/jquery.flot.barnumbers.js"></script>
<!-- end: 首页柱状图 -->
<script src="assets/js/bootstrap-tab.js"></script>
<script src="assets/js/sidebar-menu.js"></script>
<script src="assets/js/tasklist.js"></script>
<script src="assets/js/fast-menu.js"></script>
<script src="assets/plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
<!-- <script src="assets/js/index.js"></script> -->
<script src="assets/js/bootstrap-table.min.js"></script>
<script src="assets/js/bootstrap-table-zh-CN.js"></script>
<script src="assets/js/bootstrap-table-mobile.min.js"></script>
<script src="assets/plugins/fullcalendar/fullcalendar/fullcalendar.js"></script>
<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
<script type="text/javascript">
	<%
 	String pstatus = (String)session.getAttribute("pstatus");
 	UserObject user = (UserObject) session.getAttribute("userObject");
 	System.out.print(user);
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
	 
	$(document).ready(function() {
	    loadMenus();
	    var pstatus  = '<%=pstatus %>';
    	loadWindow();
		if(pstatus==2){
		  	tips();
		}
	});
	nui.parse();
 	function loadMenus(){
     	nui.ajax({
			url:"com.primeton.eos.ame_newlook.newlook.loadmenu.biz.ext",
			data: {},
			type:"post",
			contentType:"text/json",
			success:function(o){
				$('#menu').sidebarMenu({
					//data:nui.encode(o.data)
					data:o.data
				})
				$('#menutask').task({
					//data:nui.encode(o.data)
					data:o.tasks
				})
				$('#fastmenus').fastMenu({
				//data:nui.encode(o.data)
				data:o.fastmenus
				})
				$('#fastmenunum').text(o.fastmenus.length);
				$('#myname').text('<%=username %>')
				$('#myimg').attr('src',o.filePath)
				//设置cookie 到期时间为7天
				var userid = '<%=userid %>';
				$.cookie(userid,o.filePath,{ path: '/', expires: 7 });
				Main.init();
				/* Index.init(); */
			}
		});  
 	}
	function loadWindow(){
    	var json = {isIndex:1};
    	$.ajax({
    		url:"org.gocom.abframe.rights.menu.newMenu.queryMyIndexWindow.biz.ext",
    		data:json,
    		type:"post",
    		dataType:"json",
    		async:false,
    		success:function(result){
    			var data = result.windowList;
    			var oEmp = result.oEmp;
    			if (data.length > 0){
    				$.each(data,function(i,v){
			    		loadIndexMenu(data[i],oEmp);
			    	});
    			}
    			
    		},
    		error:function(result){
    			alert("error");
    		}
    	})
    	<%--var data = [{menuname:'workTt',menuurl:'/ame/clipview/indexWorkt.jsp'},
    	{menuname:'myTask',menuurl:'/ame/clipview/mytask.jsp'},
    	{menuname:'myQuestion',menuurl:'/ame/clipview/workQuestion.jsp'},
    	{menuname:'mySaleExpense',menuurl:'/ame/clipview/mySaleExpense.jsp'},
    	{menuname:'myReiOnway',menuurl:'/ame_fee/myExpenseReimbursement/myReiOnway.jsp'},
    	{menuname:'myProject',menuurl:'/ame/clipview/myProjects.jsp'},
    	{menuname:'myRegular',menuurl:'/ame/clipview/myRegular.jsp'},
    	{menuname:'myNotice',menuurl:'/ame/clipview/myNotice.jsp'},
    	{menuname:'myCont',menuurl:'/ame/clipview/myCont.jsp'},
    	{menuname:'barChart',menuurl:'/ame/clipview/barChart.jsp'},
    	{menuname:'accountsReceivable',menuurl:'/ame/clipview/accountsReceivable.jsp'}];
    	$.each(data,function(i,v){
    		loadIndexMenu(data[i]);
    	});--%>
    	
    }
    
    //加载首页窗口
	function loadIndexMenu(data,o){
	debugger;
		var type = data.windowtype;
		var html = "";
		html += '<div class="'+data.windowwidth+' remove">';
		<%--if(o.degree != '2' && o.degree != '3'){//如果不为服务或者研发，则不用加载以下三个
			if(type == 'workTt' || type == 'myQuestion'|| type == 'barChart'){
				return false;
			}
		}--%>
			
		html += '<div class="panel panel-default"><div class="panel-heading">';
		if(type == 'workTt'){
			html += '<i class="clip-calendar"></i>'+data.windowname;
		}else if(type == "myTask"){
			html += '<i class="fa fa-list-ol"></i>'+data.windowname;
		}else if(type == "myInterview"){
			html += '<i class="fa fa-list-ol"></i>'+data.windowname;
		}else if(type == "myRecruit"){
			html += '<i class="fa fa-list-ol"></i>'+data.windowname;
		}else if(type == "myQuestion"){
			html += '<i class="clip-history"></i><span id="headText"></span>';
		}else if(type == 'mySaleExpense'){
			html += '<i class="clip-checkbox"></i>'+data.windowname;
		}else if(type == 'myReiOnway'){
			html += '<i class="clip-banknote"></i>'+data.windowname;
		}else if(type == "myProject"){
			html += '<i class="clip-checkbox"></i>'+data.windowname;
		}else if(type == 'barChart'){
			html += '<i class="clip-stats"></i>'+data.windowname;
		}else if(type == 'accountsReceivable'){
			html += '<i class="clip-stats"></i>'+data.windowname;
		}else if(type == 'myRegular'){
			html += '<i class="clip-compass"></i>'+data.windowname;
		}else if(type == "myNotice"){
			html += '<i class="fa fa-bullhorn"></i>'+data.windowname;
		}else if(type =='myCont'){
			html += '<i class="clip-checkbox"></i>'+data.windowname;
		}else if(type =='myTax'){
			html += '<i class="clip-checkbox"></i>'+data.windowname;
		}else if(type =='controCabinTable'){
			html += '<i class="clip-checkbox"></i>'+data.windowname;
		}
		html += '<div class="panel-tools">';
		html += '<a class="btn btn-xs btn-link panel-collapse collapses" href="#"></a>';
		html += '<a class="btn btn-xs btn-link" href="javascript:void(0)" t='+type+' onclick="refresh(this)"><i class="fa fa-refresh"></i></a>';
		html += '<a class="btn btn-xs btn-link panel-remove" href="javascript:void(0)" onclick="remove(this)"><i class="fa fa-times"></i></a>';
		html += '<a class="btn btn-xs btn-link" href="javascript:void(0)" t='+type+' onclick="doOperator(this)"><i class="fa fa-arrow-circle-o-right "></i></a>';
		html += '</div></div>';
		if(data.windowwidth == 'col-sm-12'){//投入统计和应收账款高度自适应
			html += '<div class="panel-body" id="'+type+'" style="padding: 0;margin: 10px;height:auto;"></div></div></div>';
		}else{
			html += '<div class="panel-body panel-scroll" id="'+type+'" style="padding: 0;margin: 10px;height:400px;"></div></div></div>';
		}
		
		var src = "<%=request.getContextPath()%>"+data.windowurl;
		html += '</div></div></div>';
		$("#windowContent").append(html);
		if(type == 'workTt'){
			var str = '<iframe src="'+src+'" id="ifrmid" frameborder="0" width="100%" height="400px"></iframe>' 
			$("#"+type).html(str).attr("class","panel-body");//取消滚动条
		}else{
			$("#"+type).load(src,data,function(result){
				if(type == "myTask"){
					loadMytask();
					//每五分钟刷新一次待办任务
					window.setInterval(loadMytask,300000);
				}else if(type == "myQuestion"){
					myQuestion();
				}else if(type == "mySaleExpense"){
					loadMySaleExpense();
				}else if(type == 'myReiOnway'){
					loadReiOnway();
				}else if(type == 'myProject'){
					loadMyproject();
				}else if(type == 'myRegular'){
					loadRegular();
				}else if(type == 'myNotice'){
					loadNotice();
				}else if(type == 'myCont'){
					loadMycont();
				}else if(type == 'myTax'){
					loadMyTaxApply();
				}else if(type == 'myInterview'){
					loadMyinterview();
				}else if(type == 'myRecruit'){
					loadMyrecurit();
				}else if(type == "accountsReceivable"){
			    	init();
			    }else if(type == "barChart"){
					changePicture();
				}else if(type == "controCabinTable"){
			    	//initcontroCabinTable();
			    }
			});
		}
	}
	
 	function tips(){
 		return;
		nui.confirm("密码强度不够，请修改密码？", "提示",
            function (action) {
                if (action == "ok") {
                   addTabs({id:'passwordReset',title: '重置密码',close: true,url: '/default/org.gocom.abframe.auth.PasswordChange.flow'});
                }
            }
        );
	}
	
	//增加新的tab
	function doOperator(obj){
		var e = $(obj).attr('t');
		if(e==1){
			addTabs({id: 'quickMenu', title: '快捷菜单配置', close: true,url:'/default/abframe/rights/opershortcut/opershortcutQuery.jsp'});
		}else if(e==2){
			addTabs({id:'myinfo',title: '个人信息',close: true,url: '/default/ame/clipview/myinfo.jsp'});
		}else if(e==3){
			addTabs({id:'passwordReset',title: '密码、手机号设置',close: true,url: '/default/org.gocom.abframe.auth.PasswordChange.flow'});
		}else if(e == 'myTask'){
			addTabs({id:'263',title: '我的待办',close: true,url: '/default/bps/wfclient/task/taskList.jsp?taskType=self'});
		}else if(e == 'myInterview'){
			addTabs({id:'3205',title: '面试安排查询',close: true,url: '/default/abframe/org/interview/interviewQuery.jsp'});
		}else if(e == 'myRecruit'){
			addTabs({id:'2923',title: '招聘需求管理',close: true,url: '/default/abframe/org/recruit/omRecruitList.jsp'});
		}else if(e=='myNotice'){
			addTabs({id:'gggllj',title: '公告查询',close: true,url: '/default/ame_common/notice/noticeMyList.jsp'});
		}else if(e=='myRegular'){
			addTabs({id:'gzzdgllj',title: '规章制度查询',close: true,url: '/default/ame_common/regular/regularMyList.jsp'});
		}else if(e=='myProject'){
			addTabs({id:'1664',title: '我负责的项目',close: true,url: '/default/project/benefitToBenefitProject/ConscientiousToProject.jsp'});
		}else if(e == 'myCont'){
			addTabs({id:'1146',title: '我的销售合同',close: true,url: '/default/ame_income/csContract/csContractList.jsp'});
		}else if(e == 10){
			addTabs({id:'addfeedback',title: '意见反馈',close: true,url: '/default/ame_common/feedback/addFeedback.jsp'});
		}else if(e == 'myReiOnway'){
			addTabs({id:'1765',title: '我的费用报销',close: true,url: '/default/ame_fee/myExpenseReimbursement/myFee.jsp'});
		}else if(e == 12){
			addTabs({id:'64',title: '我的年假',close: true,url: '/default/ame_permanage/ame_leave/yearEmpvac.jsp'});
		}else if(e == 'myQuestion'){
			addTabs({id:'2024',title: '疑问工时查询',close: true,url: '/default/labor/queryRdLaborDetail/queryDoubtfulRdLabrDetail.jsp'});
		}else if(e == 'mySaleExpense'){
			addTabs({id:'1772',title: '我的销售费用额度',close: true,url: '/default/ame/clipview/mySaleExpenseDetail.jsp'});
		}else if(e == 'myTax'){
			addTabs({id:'2744',title: '我的个税专项申请记录',close: true,url: '/default/ame_tax/myTax/myTaxApply.jsp'});
		}else if(e == 'wx'){
			var url = "<%=request.getContextPath()%>/ame_common/notice/noticeShow.jsp?id=" + 241;
			var iWidth=1000; //弹出窗口的宽度;
			var iHeight=500; //弹出窗口的高度;
			var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
			window.open(url, "公告详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",resizable=yes");
		}else if(e == 'shxt'){
			var ame = nui.getDictText('AME_SYSCONF',"AMEPATH");
			var url =ame+ "common/skins/layouts/default/main1.jsp";
			window.open(url); 
		}else if(e == 'barChart'){
			addTabs({id:'1863',title: '我参与的项目',close: true,url: '/default/project/projectParticipateByMe/projectParticipateByMe.jsp'});
		}else if(e == 'myjl'){
			addTabs({id:'1924',title: '我的简历',close: true,url: '/default/ame_resume/modifyResume.jsp?flag=1'});
		}else if(e == 'accountsReceivable'){
			var amereport = nui.getDictText('AME_SYSCONF',"AMEREPORT");
			addTabs({id:'2685',title: '应收账款账龄分布(管)',close: true,url: amereport+'/reportJsp/showReport.jsp?rpx=/received/ame_AccountsReceivableManager.rpx'});
		}else if(e == 'workTt'){
			addTabs({id:'374',title: '工时查询',close: true,url: '/default/labor/queryRdLaborDetail/queryRdLaborDetail.jsp'});
		}else if(e == 'logout'){
			document.getElementById("logoutIFrame").src = "<%=request.getContextPath()%>/ame/clipview/clearSession.jsp";
			$.cookie('cas-login', null, {path: '/', domain: '.ame.primeton.com', expires: -1});
			window.location.href="/default/sso.login?SSOLOGOUT=true";
		}
	}
	
	//点击首页时刷新我的待办
	function clicksy(){
		loadMytask();
	}
	//点击首页刷新按钮触发事件
	function refresh(obj){
		var e = $(obj).attr("t");
		if(e == "myNotice"){
			loadNotice();
		}else if(e == "myRegular"){
			loadRegular();
		}else if(e == "barChart"){
			changePicture();
		}else if(e== "myProject"){
			loadMyproject();
		}else if(e == "myCont"){
			loadMycont();
		}else if(e == "myTask"){
			loadMytask();
		}else if(e == "myQuestion"){
			myQuestion();
		}else if(e == "myReiOnway" ){
			loadReiOnway();
		}else if(e == "mySaleExpense"){
			loadMySaleExpense();
		}else if(e == "myInterview"){
			loadMyinterview();
		}else if(e == "myRecruit"){
			loadMyrecurit();
		}else if(e == "accountsReceivable"){
	    	init();
	    }else if(e == "myTax"){
			loadMyTaxApply();
		}else if(e == "workTt"){
			document.getElementById('ifrmid').contentWindow.location.reload(true);
		}else if(e == "controCabinTable"){
			searchcontroCabinTable();
		}
	}
	
	//查看我的待办任务
	function doOperate1(currentState,isTimeOut,limitNumDesc,timeOutNumDesc,workItemID,activityInstID ,processInstID,processDefName ,activityDefID,workItemName) {
		var row = new Object();
		row.currentState = currentState;
		row.isTimeOut = isTimeOut;
		row.limitNumDesc = limitNumDesc;
		row.timeOutNumDesc = timeOutNumDesc;
		row.workItemID = workItemID;
		row.activityInstID = activityInstID;
		row.processInstID = processInstID;
		row.processDefName = processDefName;
		row.activityDefID = activityDefID;
		row.workItemName = workItemName;
		nui.open({
			url: "<%=request.getContextPath()%>/bps/wfclient/task/task.jsp?workItemID="+workItemName,
			title: "工作项详细信息"+"-"+row.workItemName,
			width: 1000,
			height: 550,
			onload: function () {
				var iframe = this.getIFrameEl();
				if(iframe.contentWindow.initData) {
					iframe.contentWindow.initData(row, "self",true);
				}	
			},
			ondestroy: function (action){
				if (action == "ok") {
				} else if (action == "execute") {  
					loadMytask();			
				}
			}
		});
	 }
 
		
	//菜单回到顶部
	function go(){
		document.documentElement.scrollTop = document.body.scrollTop = 0;
	}
	
  	//关闭按钮 直接移除该节点
  	function remove(obj){
  		$(obj).parents('.remove').remove();
  	}
  
</script>
</html>