<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<!-- 
  - Author(s): zhang-yb
  - Date: 2018-03-21 16:00:09
  - Description:
-->
<head>
<title>微信工作台</title>
<!-- start: META -->
<meta charset="utf-8" />
<!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta content="" name="description" />
<meta content="" name="author" />
<script src="<%=request.getContextPath() %>/ame/clipview/assets/js/jquery.min.js"></script>
<!-- end: META -->
<!-- start: MAIN CSS -->
<link rel="stylesheet" href="assets/css/Mdate.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/fonts/style.css">
<link rel="stylesheet" href="assets/css/main.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/css/bootstrap-table.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/css/main-responsive.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/perfect-scrollbar/src/perfect-scrollbar.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/act/activityMessage/mescroll.css">
<link href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap-modal/css/bootstrap-modal-bs3patch.css" rel="stylesheet" type="text/css"/>
<link href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap-modal/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>

<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/datepicker/css/datepicker.css">
<!--[if IE 7]>
<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
<!-- end: MAIN CSS -->
<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
<link rel="shortcut icon" href="favicon.ico" />
<style type="text/css">
	*{margin: 0;padding: 0;}
	html,body{height: 100%;width: 100%;}
	.filter {margin-top: 30px;}
	.dropdown-menu a{padding: 10px auto;text-align: center;line-height: 30px !important;}
</style>
</head>
<body >
<div class="container-fluid">
	<div class="row ">
		<div class="col-sm-12">
			<div class="space12">
                <div class="input-group filter">
                    <div class="input-group-btn">
                        <button type="button" class="btn btn-default sx 
                        dropdown-toggle" data-toggle="dropdown">月度&nbsp;&nbsp;<span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" >
                            <li><a href="javascript:void(0)" >年度</a></li>
                            <li class="divider"></li>
							<li><a href="javascript:void(0)" >季度</a></li>
							<li class="divider"></li>
							<li><a href="javascript:void(0)" >月度</a></li>
                        </ul>
                    </div><!-- /btn-group -->
                    <input type="text"  class="form-control" readOnly="readOnly" onfocus="this.blur();" style="width: 40%;ime-mode: disabled" id="dateSelectorOne" >
                </div>
				<%--<div class="btn-group filter">
					
					<a class="btn btn-default" id="year">
						年度
					</a>
					<a class="btn btn-default" id="quarter">
						
					</a>
					<a class="btn btn-default active" id="month">
						
					</a>
				</div>--%>
				<%--<div class="btn-group filter">
					<input type="text" class="form-control time-picker" id="dateSelectorTwo" disabled="false">
				</div>--%>
			</div>
			<%--<div class="form-group season">
				<div class="input-group date center">
					<select id="form-field-select-1" class="form-control">
						<option value="AL" checked>第一季度</option>
						<option value="AK">第二季度</option>
						<option value="AZ">第三季度</option>
						<option value="AZ">第四季度</option>
					</select>
				</div>
			</div>--%>
			<%--<div class="form-group dataPick">
	        	<div class='input-group date center' id='datetimepicker1'>
	        		<input type="text" id="dateSelectorOne" placeholder="选择日期">
	            </div>
	            <div class='input-group date center dateSelectorTwo'>
	        		<input type="text" id="dateSelectorTwo" placeholder="选择日期">
            		<button type="button" id="dateShowBtn">选择日期</button>
	            </div>
	        </div>--%>
			<div class="tabbable">
				<ul id="myTab" class="nav nav-tabs tab-blue tab-space-3"><!--tab title-->
					<li class="active">
						<a href="#panel_tab2_1" data-toggle="tab">汇总</a>
					</li>
					<li>
						<a href="#panel_tab2_2" data-toggle="tab">流水</a>
					</li>
					<li>
						<a href="#panel_tab2_3" data-toggle="tab">提醒</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane in active" id="panel_tab2_1"></div>
					<div class="tab-pane" id="panel_tab2_2"></div>
					<div class="tab-pane" id="panel_tab2_3"></div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script src="<%=request.getContextPath() %>/act/activityMessage/mescroll.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/js/iScroll.js"></script>
<script src="assets/js/Mdate.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap-modal/js/bootstrap-modal.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap-modal/js/bootstrap-modalmanager.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/plugins/blockUI/jquery.blockUI.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/js/ui-modals.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/js/bootstrap-table.min.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/js/bootstrap-table-zh-CN.js"></script>
<script src="<%=request.getContextPath() %>/ame/clipview/assets/js/bootstrap-table-mobile.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-datepicker/1.8.0/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script type="text/javascript">
	$(function(){
		//初始化日期
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = getLastDay(year,month);
		if(month<10){
			month = "0" + month;
		}
		$("#dateSelectorOne").val(year+"-"+month);
	 	sessionStorage.setItem("beginDate",year + "-"+month+"-01");
		sessionStorage.setItem('endDate',year + "-"+month+"-"+day);
		$("#panel_tab2_1").load("workCollect.jsp");//默认 加载第一项
    })	
    $("#myTab li a").click(function(e){
		var tabName = $(this).attr("href");
	    $(tabName).tab('show');
	    if(tabName == '#panel_tab2_1'){
	    	$(tabName).load("workCollect.jsp");
	    }else if(tabName == '#panel_tab2_2'){
	    	$(tabName).load("workStream.jsp");
	    }else if(tabName == '#panel_tab2_3'){
	    	$(tabName).load("workWarn.jsp");
	    }
	    e.preventDefault(); //阻止a标签的默认行为
	});
	//new Mdate("dateSelectorOne");
	$('.filter a').on("click",function(){
		//获取当前的年月
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		
		var text = $(this).text();
		var content = $(this).parents(".filter").find(".sx");
		if(text == "年度"){
			content.html('年度&nbsp;&nbsp;<span class="caret"></span>');
			showMdate("year");
			changeSX("year",year)
		}else if(text == "季度"){
			content.html('季度&nbsp;&nbsp;<span class="caret"></span>');
			var quarter = getSeason(month);
			showMdate("quarter");
			changeSX("quarter",year,quarter);
		}else if(text == "月度"){
			content.html('月度&nbsp;&nbsp;<span class="caret"></span>');
			showMdate("month");
			changeSX("month",year,month);
		}
	})
	showMdate("month");
	//展示时间选择器
	function showMdate(a){
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var quarter = getSeason(month);
		//初始化三个时间选择器
		new Mdate("dateSelectorOne", {
		    acceptId: "dateSelectorOne",
		    beginYear: "",
		    beginMonth: "",
		    endYear: "",
		    endMonth: "",
		    format: "-",
		    show:a,
		    showYear:year,
		    showMonth:month,
		    showQuoter:quarter
		})
	}
	//获取某年某月的最后一天
	function getLastDay(year,month){   
    	var new_year = year;  //取当前的年份   
    	var new_month = month++;//取下一个月的第一天，方便计算（最后一天不固定）   
    	if(month>12){      //如果当前大于12月，则年份转到下一年   
    		new_month -=12;    //月份减   
    		new_year++;      //年份增   
    	}   
    	var new_date = new Date(new_year,new_month,1);        //取当年当月中的第一天   
    	return (new Date(new_date.getTime()-1000*60*60*24)).getDate();//获取当月最后一天日期   
    }
    
    
    //切换年度 季度 月度
    function changeSX(a,b,c){
    	if( a == "year" ){
    		$("#dateSelectorOne").val(b);
    		sessionStorage.setItem("beginDate",b+"-01-01");
            sessionStorage.setItem("endDate",b+"-12-31");
    	}else if(a == "quarter"){
    		var beginDate = getQuarterStartDate(b,c.toString());
        	var endDate = getQuarterEndDate(b,c.toString());
        	$("#dateSelectorOne").val(b+"-"+c+"季度");
        	sessionStorage.setItem("beginDate",beginDate);
            sessionStorage.setItem("endDate",endDate);
    	}else if(a == "month"){
    		var day = getLastDay(b,c);
    		$("#dateSelectorOne").val(b+"-"+dateForTen(c));
            sessionStorage.setItem("beginDate",b + "-" + dateForTen(c) + "-01");
            sessionStorage.setItem("endDate",b + "-" + dateForTen(c)+"-"+day);
    	}
    	//重新加载当前页面
    	$("#myTab li").each(function(){
        	if($(this).hasClass("active")){
        		var tabName = $(this).find("a").attr("href");
        	    $(tabName).tab('show');
        	    if(tabName == '#panel_tab2_1'){
        	    	$(tabName).load("workCollect.jsp");
        	    }else if(tabName == '#panel_tab2_2'){
        	    	$(tabName).load("workStream.jsp");
        	    }else if(tabName == '#panel_tab2_3'){
        	    	$(tabName).load("workWarn.jsp");
        	    }
        	}
        })
    }
    
     //获得某季度的开始日期　　 
    function getQuarterStartDate(paraYear,paraSeason){　　 
　 		switch (paraSeason){　　 
	　　　	case '1' : return paraYear+"-01-01";
	　　　	case '2' : return paraYear+"-04-01";
	　　　	case '3' : return paraYear+"-07-01";
	　　　	case '4' : return paraYear+"-10-01";
　 		}
    }　 
    //获得某季度的结束日期　　 
    function getQuarterEndDate(paraYear,paraSeason){　　 
	　	switch (paraSeason){　　 
	　 		case '1' : return paraYear+"-03-31";
	　		case '2' : return paraYear+"-06-30";
	　 		case '3' : return paraYear+"-09-30";
	　		case '4' : return paraYear+"-12-31";
　 		}　 
    }
    //格式化月份 天
    function dateForTen(n){
    	if (n < 10) {
            return "0" + n
        } else {
            return n
        }
    }
    
    //获取当前季度
    function getSeason(n){
		if(n  < 3) {
			return 1;
		}else if(n < 6) {
			return 2;
		}else if(n <9) {
			return 3;
		}else if(n <12){
			return 4;
		}
    }
</script>
</html>