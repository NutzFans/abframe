<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="java.util.Map" %>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2020-04-20 11:44:45
  - Description:
-->
<head>
<title>经营驾驶舱</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes"/>
<!-- start: MAIN CSS --><%--
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/bootstrap/css/bootstrap.min.css">--%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/fonts/style.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame_mobile/layer_mobile/need/layer.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/css/main-responsive.css"><%--
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame_mobile/workDesk/assets/css/main.css">--%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/datepicker/css/datepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/datepicker/css/timepicker.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/ame/clipview/assets/plugins/select2/select2.css">
<style type="text/css">
	.carbin.titleclive{
		font-family: SimSun;
		font-style: normal;
		font-weight: normal;
		width: 100%;
		height:auto;
		margin: 15px auto 0px;
	}
	.carbin.con{
		font-family: SimSun;
		font-style: normal;
		font-weight: normal;
		width: 100%;
		height:auto;
		margin: 3px auto 0px;
		border: rgb(55,83,138) 1px solid;
	}
	.table-condensed{
		width:98%;
	    margin-left: 1%;
	}
	.table-condensed > tbody > tr > td
	{
	    border: white 4px solid;
	    text-align : center;
	    font-size:12px;
	    line-height:150%;
	}
	.table-condensed > tbody>.project> td{
		background-color: rgb(106,155,208)!important;
		font-size:14px;
		border: white 2px solid;
		font-family: SimHei;
		color: white;
	}
	.table-condensed > tbody>.project-value> td{
		background-color: rgb(212,222,236)!important;
		font-size:14px;
		border: white 2px solid;
	}
	
	.table-condensed > tbody>.project-value> td>a{
		color: red;
	}
	
	.table-condensed > tbody>.person> td{
		background-color: rgb(126,170,85)!important;
		font-size:14px;
		border: white 2px solid;
		font-family: SimHei;
		color: white;
	}
	.table-condensed > tbody>.person-value> td{
		background-color: rgb(216,226,209)!important;
		font-size:14px;
		border: white 2px solid;
		color: red;
	}
	.table-condensed > tbody>.person-value> td>a{
		color: red;
	}
</style>
</head>
<body>
	<div class="carbin">
	<div class="container"style="border: 0px!important;">
		<div class="row" >
			<div class="col-xs-12 col-sm-6 col-lg-6">
				<form role="form" id="form_table">
					<div class="titleclive">
						<table style="width:100%;">
							<tr style="width:100%;">
								<td style="width:13%;font-family: SimSun;font-size:14px;" align="right">机构：</td>
								<td style="width:47%;font-family: SimSun;font-size:14px;" align="left">
							      	<select class="form-control search-select"<%-- multiple="multiple"--%> data-live-search="true" id="org-select" name="orgid"  onchange="searchcontroCabinTable()">
							    	</select>
								</td>
								<td style="width:13%;font-family: SimSun;font-size:14px;" align="right">期间：</td>
								<td  style="width:27%;font-family: SimSun;font-size:14px;" align="left">
						     	 	<%--<select class="form-control"  id="year-select" name="year">
							    	</select>--%>
							    	<div class='input-group date' id='datetimepicker2'  onchange="searchcontroCabinTable()">
						                <input type='text' class="form-control" name="yearmonth" id="yearmonth"/>
						                <span class="input-group-addon">
						                    <span class="glyphicon glyphicon-calendar"></span>
						                </span>
						            </div>
							    </td>
							</tr>
						</table>
					</div>
					
					<div class="con" id="kpi" >
						<table class="table table-condensed">
							<thead>
						      <tr>
						         <th colspan="3">经营指标</th>
						      </tr>
						   </thead>
						   <tbody>
								<tr>
									<td style="background-color: RGB(229,238,219);">
										当年累计合同额<br/>
										<a style="color:red;font-size:15px;" id="contsum" target="_blank">-</a><br/>
										<span style="color:RGB(97,106,108);font-size:10px;">距目标：</span><span style="color:RGB(97,106,108);font-size:10px;" id="contsumspan">-</span><br/>
										<span style="color:RGB(97,106,108);font-size:10px;">去年同期：</span><a style="color:RGB(97,106,108);font-size:10px;" id="lastcontsum" target="_blank">-</a>
									</td>
									<td style="background-color: RGB(224,235,246);">
										累计不含税收入<br/>
										<a style="color:red;font-size:15px;" id="confirmcontsum" target="_blank">-</a><br/>
										<span style="color:RGB(97,106,108);font-size:10px;">距目标：</span><span style="color:RGB(97,106,108);font-size:10px;" id="confirmcontsumspan">-</span><br/>
										<span style="color:RGB(97,106,108);font-size:10px;">去年同期：</span><a style="color:RGB(97,106,108);font-size:10px;" id="lastconfirmcontsum" target="_blank">-</a>
									</td>
									<td style="background-color: RGB(248,230,216);">
										累计已收款<br/>
										<a style="color:red;font-size:15px;" id="confirmgather" target="_blank">-</a><br/>
										<span style="color:RGB(97,106,108);font-size:10px;">距目标：</span><span style="color:RGB(97,106,108);font-size:10px;" id="confirmgatherspan">-</span><br/>
										<span style="color:RGB(97,106,108);font-size:10px;">去年同期：</span><a style="color:RGB(97,106,108);font-size:10px;" id="lastconfirmgather" target="_blank">-</a>
									</td>
								</tr>
								<tr>
									<td style="background-color: RGB(238,237,237);padding:8px 8px;">
										当前应收账款<br/>
										<a style="color:red;font-size:15px;" id="yszk" target="_blank">-</a><br/>
										<span style="color:RGB(97,106,108);font-size:10px;">去年同期：</span><a style="color:RGB(97,106,108);font-size:10px;" id="lastyszk" target="_blank">-</a>
									</td>
									<td style="background-color: RGB(253,242,207);padding:8px 8px;">
										当月预计确认收入<br/>
										<a style="color:red;font-size:15px;" id="noconfirmcontsum" target="_blank">-</a><br/>
										<%--<span style="color:RGB(97,106,108);font-size:10px;">去年同期：</span><a style="color:RGB(97,106,108);font-size:10px;" id="lastnoconfirmcontsum" target="_blank">-</a>--%>
									</td>
									<td style="background-color: RGB(252,243,208);padding:8px 8px;">
										当月预计收款<br/>
										<a style="color:red;font-size:15px;" id="noconfirmgather" target="_blank">-</a><br/>
										<%--<span style="color:RGB(97,106,108);font-size:10px;">去年同期：</span><a style="color:RGB(97,106,108);font-size:10px;" id="lastnoconfirmgather" target="_blank">-</a>--%>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="con"  id="project" >
						<table class="table table-condensed">
							<thead>
						      <tr>
						         <th colspan="4">项目数据</th>
						      </tr>
						   </thead>
						   <tbody>
								<tr class="project">
									<td>活动项目数</td>
									<td>超预算项目</td>
									<td>延期项目</td>
									<td>未签合同项目</td>
									<td>当月新增</td>
								</tr>
								<tr class="project-value">
									<td><a id="activerproject" target="_blank">-</a></td>
									<td><a id="passbudproject" target="_blank">-</a></td>
									<td><a id="postproject" target="_blank">-</a></td>
									<td><a id="nocontractproject" target="_blank">-</a></td>
									<td><a id="newproject" target="_blank">-</a></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="con" id="people">
						<table class="table table-condensed">
							<thead>
						      <tr>
						         <th colspan="4">人员情况</th>
						      </tr>
						   </thead>
						   <tbody>
								<tr class="person">
									<td>当月总人数</td>
									<td>当月入职</td>
									<td>当月离职</td>
									<td>当前待入职</td>
									<td>本日请假</td>
								</tr>
								<tr class="person-value">
									<td id="earlynum">-<%--<a id="earlynum" target="_blank">-</a>--%></td>
									<td><a id="innum" target="_blank">-</a></td>
									<td><a id="leavenum" target="_blank">-</a></td>
									<td><a id="intends" target="_blank">-</a></td>
									<td><a id="days">-</a></td>
								</tr>
							</tbody>
						</table>
					</div>
				</form>
	      	</div>
	      	<div class="col-xs-12 col-sm-6 col-lg-6" id="chat">
				<div class="titleclive" id="mainchat" style="width: 100%;height:455px;"></div>
	      	</div>
		</div>
	</div>
	</div>
</body>
<script src="<%= request.getContextPath() %>/ame/clipview/assets/plugins/select2/select2.min.js"></script>
<!-- 引入 echarts.js -->
<script src="<%= request.getContextPath() %>/ame/clipview/assets/js/echarts.js"></script>
<!-- 引入 日期控件 -->
<script src="<%= request.getContextPath() %>/ame/clipview/assets/js/moment-with-locales.js"></script>
<script src="<%= request.getContextPath() %>/ame/clipview/assets/js/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript">
	//设置年份的选择 
	var myDate= new Date();
	
	<!-- start:echarts.js  -->
	// 基于准备好的dom，初始化echarts实例
    var myChartop = echarts.init(document.getElementById('mainchat'));
    jQuery(document).ready(function() {
    	var startYear=myDate.getFullYear();//起始年份 
		var startmonth=myDate.getMonth();//结束年份 
		$('#datetimepicker2').datetimepicker({
	        format: 'YYYY-MM',
	        locale: moment.locale('zh-cn'),
	        defaultDate:startYear+'-'+((startmonth+1)<10?('0'+(startmonth+1)):(startmonth+1)),
	        maxDate:startYear+'-'+((startmonth+1)<10?('0'+(startmonth+1)):(startmonth+1))
	    }).bind('dp.change', function(e){
	    	searchcontroCabinTable();
	    });
    
		initcontroCabinTable();
	});
	<!-- end:echarts.js  -->
	
    
	
	function initcontroCabinTable(){
		//数据初始化
		<% 
    		UserObject user = (UserObject)session.getAttribute("userObject");
    		String nowuserid = user.getUserId();
    		String nowusername = user.getUserName();
    		String orgname = user.getUserOrgName();
    		String orgid = user.getUserOrgId();
    	%>
		//code:对应功能编码，map：对于机构的查询条件
		var json = {"code":"controlCarbin","map":{"property":"status;orglevel","op":"=;<","value":"running;4"}};
		var orgArr = [];//所有部门
	  	$.ajax({
            url: "com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
            type: "post",
			contentType:'text/json',
            data:JSON.stringify(json),
			async:false,
            success: function (text) {
            	if(text.orgs){
            		if(text.orgs.length==0){
						// 没有有权的机构时只能查销售为自己的数据
						orgArr.push({id: "<%=orgid %>", text: "<%=orgname %>"});
					}else{
			            for(item in text.orgs){
			            	orgArr.push({"id": text.orgs[item].orgid, "text": text.orgs[item].orgname});
			            }
					}
            	}else{
            		// 没有有权的机构时只能查销售为自己的数据
					orgArr.push({id: "<%=orgid %>", text: "<%=orgname %>"});
            	}
    		}
    	});
    	
		//受益部门下拉框
    	for(var i=0;i<orgArr.length;i++){
    		if(orgArr[i].text){
	    		$("#org-select" ).append("<option value='"+orgArr[i].id+"'>"+orgArr[i].text+"</option>");
    		}
    	}
	
		$("#org-select" ).selectpicker('refresh');
        $('#org-select').selectpicker('render');
		
		searchcontroCabinTable();
	}
	
	function searchcontroCabinTable(){
		//遮罩
 	    var kpiel = $('#kpi');
 	    var projectel = $('#project');
 	    var peopleel = $('#people');
 	    var el = $('#chat');
 	    
 	    var src = "<%= request.getContextPath() %>"+"/ame/clipview/assets/images/loading.gif"
 	    kpiel.block({
		    overlayCSS: {
		        backgroundColor: '#fff'
		    },
		    message: '<img src="'+src+'" /> Just a moment...',
		    css: {
		        border: 'none',
		        color: '#333',
		        background: 'none'
		    }
		});
		projectel.block({
		    overlayCSS: {
		        backgroundColor: '#fff'
		    },
		    message: '<img src="'+src+'" /> Just a moment...',
		    css: {
		        border: 'none',
		        color: '#333',
		        background: 'none'
		    }
		});
		peopleel.block({
		    overlayCSS: {
		        backgroundColor: '#fff'
		    },
		    message: '<img src="'+src+'" /> Just a moment...',
		    css: {
		        border: 'none',
		        color: '#333',
		        background: 'none'
		    }
		});
		el.block({
		    overlayCSS: {
		        backgroundColor: '#fff'
		    },
		    message: '<img src="'+src+'" /> Just a moment...',
		    css: {
		        border: 'none',
		        color: '#333',
		        background: 'none'
		    }
		});
		
		//表单信息
		var t = $('#form_table').serializeArray();
		var map ={};
    	$.each(t, function(i,field) {
    		map[field.name]  = field.value;
    	});
    	
    	var monthdate = [];
    	var maxmonth = map["yearmonth"].split("-")[1];
    	var months = '';
    	var lastyearmonth = (Number(map["yearmonth"].split("-")[0])-1)+""+map["yearmonth"].split("-")[1];
    	for(var i=1;i<=Number(maxmonth);i++){
    		monthdate.push(i+"月");
    		if(months == ''){
    			months = months+ i;
    		}else{
    			months = months+','+ i;
    		}
    	}
    	map["lastyearmonth"] = lastyearmonth;
    	
    	var startdate = getMonthDateRange(Number(map["yearmonth"].split("-")[0]),Number(map["yearmonth"].split("-")[1])).firstDay;
    	var enddate = getMonthDateRange(Number(map["yearmonth"].split("-")[0]),Number(map["yearmonth"].split("-")[1])).lastDay;
    	
    	var json ={"map":map};
    	
    	$.ajax({
            url: "com.primeton.rdmgr.project.controlCabin.getKPI.biz.ext",
            type: "POST",
            data:JSON.stringify(json),
			contentType:'text/json',
            success: function (text) {
            	//取消遮罩
            	kpiel.unblock();
            	
            	var kpi = text.KPI;
            	var lastkpi = text.lastKPI;
            	var noconfirmcontsums = text.noconfirmcontsums;
            	var yszks = text.yszks;
            	var lastyszks = text.lastyszks;
            	if(kpi){
            		document.getElementById("contsum").innerHTML = kpi[0].contsum == null||kpi[0].contsum == 0 ?"-":formatnum(kpi[0].contsum);
	            	document.getElementById("contsumspan").innerHTML = kpi[0].contsumspan == null||kpi[0].contsumspan == 0 ?"-":formatnum(kpi[0].contsumspan);
	            	document.getElementById("confirmcontsum").innerHTML = kpi[0].confirmcontsum == null||kpi[0].confirmcontsum == 0 ?"-":formatnum(kpi[0].confirmcontsum);
	            	document.getElementById("confirmcontsumspan").innerHTML = kpi[0].confirmcontsumspan == null||kpi[0].confirmcontsumspan == 0 ?"-":formatnum(kpi[0].confirmcontsumspan);
	            	document.getElementById("confirmgather").innerHTML = kpi[0].confirmgather == null||kpi[0].confirmgather == 0 ?"-":formatnum(kpi[0].confirmgather);
	            	document.getElementById("confirmgatherspan").innerHTML = kpi[0].confirmgatherspan == null||kpi[0].confirmgatherspan == 0 ?"-":formatnum(kpi[0].confirmgatherspan);
	            	document.getElementById("noconfirmgather").innerHTML = kpi[0].noconfirmgather == null||kpi[0].noconfirmgather == 0 ?"-":formatnum(kpi[0].noconfirmgather);
            	}
	            //去年同期
	            if(lastkpi){
		            document.getElementById("lastcontsum").innerHTML = lastkpi[0].contsum == null||lastkpi[0].contsum == 0 ?"-":formatnum(lastkpi[0].contsum);
	            	document.getElementById("lastconfirmcontsum").innerHTML = lastkpi[0].confirmcontsum == null||lastkpi[0].confirmcontsum == 0 ?"-":formatnum(lastkpi[0].confirmcontsum);
	            	document.getElementById("lastconfirmgather").innerHTML = lastkpi[0].confirmgather == null||lastkpi[0].confirmgather == 0 ?"-":formatnum(lastkpi[0].confirmgather);
            	}
            	if(noconfirmcontsums){
            		document.getElementById("noconfirmcontsum").innerHTML = noconfirmcontsums[0].noconfirmcontsum == null||noconfirmcontsums[0].noconfirmcontsum == 0 ?"-":formatnum(noconfirmcontsums[0].noconfirmcontsum);
            	}
            	if(yszks){
            		document.getElementById("yszk").innerHTML = yszks[0].yszk == null||yszks[0].yszk == 0 || formatnum(yszks[0].yszk) =='0'?"-":formatnum(yszks[0].yszk);
            	}
            	//去年同期
            	if(lastyszks){
            		document.getElementById("lastyszk").innerHTML = lastyszks[0].yszk == null||lastyszks[0].yszk == 0 || formatnum(lastyszks[0].yszk) =='0'?"-":formatnum(lastyszks[0].yszk);
	            }
            }
        });
        
        $.ajax({
            url: "com.primeton.rdmgr.project.controlCabin.getProject.biz.ext",
            type: "POST",
            data:JSON.stringify(json),
			contentType:'text/json',
            success: function (text) {
            	//取消遮罩
            	projectel.unblock();
            	var project = text.project;
	            if(project){
	            	document.getElementById("activerproject").innerHTML = project.activerproject == null||project.activerproject == 0 ?"-":formatnum(project.activerproject);
	            	document.getElementById("passbudproject").innerHTML = project.passbudproject == null||project.passbudproject == 0 ?"-":formatnum(project.passbudproject);
	            	document.getElementById("postproject").innerHTML = project.postproject == null||project.postproject == 0 ?"-":formatnum(project.postproject);
	            	document.getElementById("nocontractproject").innerHTML = project.nocontractproject == null||project.nocontractproject == 0 ?"-":formatnum(project.nocontractproject);
	            	document.getElementById("newproject").innerHTML = project.newproject == null||project.newproject == 0 ?"-":formatnum(project.newproject);
	            }
        	}
    	});
    	
    	$.ajax({
            url: "com.primeton.rdmgr.project.controlCabin.getPeople.biz.ext",
            type: "POST",
            data:JSON.stringify(json),
			contentType:'text/json',
            success: function (text) {
            	//取消遮罩
            	peopleel.unblock();
            	var people = text.people;
            	var leave = text.leave;
            	var intend = text.intend;
	            if(people){
	            	document.getElementById("earlynum").innerHTML = people.earlynum == null||people.earlynum == 0 ?"-":formatnum(people.earlynum);
	            	document.getElementById("innum").innerHTML = people.innum == null||people.innum == 0 ?"-":formatnum(people.innum);
	            	document.getElementById("leavenum").innerHTML = people.leavenum == null||people.leavenum == 0 ?"-":formatnum(people.leavenum);
	            }
	            
	            if(leave){
	            	document.getElementById("days").innerHTML = leave.days == null||leave.days == 0 ?"-":formatnum(leave.days);
	            }
	            
	            if(intend){
	            	document.getElementById("intends").innerHTML = intend.intends == null||intend.intends == 0 ?"-":formatnum(intend.intends);
	            }
        	}
    	});
    	
    	$.ajax({
            url: "com.primeton.rdmgr.project.controlCabin.queryControlCabin.biz.ext",
            type: "POST",
            data:JSON.stringify(json),
			contentType:'text/json',
            success: function (text) {
		     	//取消遮罩
     			el.unblock();
            	var kpi = text.KPI;
            	var lastkpi = text.lastKPI;
            	var noconfirmcontsums = text.noconfirmcontsums;
            	var yszks = text.yszks;
            	var lastyszks = text.lastyszks;
            	
            	var contsum = [];
            	var confirmcontsum = [];
            	var confirmgather = [];
            	var yszk = [];
	            for(var i=0;i<kpi.length;i++){
	            	contsum.push(kpi[i].contsum==null?0:(kpi[i].contsum/10000).toFixed(2));
	            	confirmcontsum.push(kpi[i].confirmcontsum==null?0:(kpi[i].confirmcontsum/10000).toFixed(2));
	            	confirmgather.push(kpi[i].confirmgather==null?0:(kpi[i].confirmgather/10000).toFixed(2));
	            	yszk.push(yszks[i].yszk==null?0:(yszks[i].yszk/10000).toFixed(2));
	            }
            	// 指定图表的配置项和数据
		        option = {
		        	title: {
				        text: '经营指标情况',
				         backgroundColor: '',
			        	textStyle: {//主标题文本样式
			        		color:'rgb(112,112,112)',
			                fontSize: 16
			            }
				    },
				    tooltip : {
				        trigger: 'axis'
				    },
				    legend: {
				    	orient: 'horizontal',
				    	x: 'right',
				    	y: 30,
				        data: ['合同', '不含税收入','收款','应收账款']
				    },
				    grid: {
				        left: '5%',
				        right: '4%',
				        bottom: '3%',
				        containLabel: true
				    },
				    toolbox: {
				        feature: {
				            saveAsImage: {}
				        }
				    },
				    xAxis:  {
				        type: 'category',
				        boundaryGap: false,
				        data: monthdate,
				        name:'月'
				    },
				    yAxis: {
				        type: 'value',
				        name:'万元'
				    },
				    series: [
				        {
				            name:'合同',
				            type:'line',
				            data:contsum
				        },
				        {
				            name:'不含税收入',
				            type:'line',
				            data:confirmcontsum
				        },
				        {
				            name:'收款',
				            type:'line',
				            data:confirmgather
				        },
				        {
				            name:'应收账款',
				            type:'line',
				            data:yszk
				        }
				    ],
		        	color:["#FF0000","#61a0a8", "#2f4554", "#FFC125"]
				};
					
		        // 使用刚指定的配置项和数据显示图表。
		        myChartop.setOption(option);
    		}
    	});
    	var amereport = nui.getDictText('AME_SYSCONF',"AMEREPORT");
    	$.ajax({
            url: "com.primeton.eos.ame_common.ame_common.getOrgInfo.biz.ext",
            type: "POST",
            data:JSON.stringify({"orgid":map.orgid}),
			contentType:'text/json',
            success: function (o) {
            	if(o.org){
            		document.getElementById("contsum").onclick = function(){
						var url = '/default/project/controlCabin/contsumDetail.jsp?orgseq='+o.org.orgseq+'&myyear='+map["yearmonth"].split("-")[0]+'&mymonth='+map["yearmonth"].split("-")[1];
					    var title = "合同额明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
            		document.getElementById("lastcontsum").onclick = function(){
						var url = '/default/project/controlCabin/contsumDetail.jsp?orgseq='+o.org.orgseq+'&myyear='+(Number(map["yearmonth"].split("-")[0])-1)+'&mymonth='+map["yearmonth"].split("-")[1];
					    var title = "去年同期合同额明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
            		
            		document.getElementById("confirmcontsum").onclick = function(){
						var url = '/default/project/controlCabin/confirmcontsumDetail.jsp?orgseqsearch='+o.org.orgseq+'&yyears='+map["yearmonth"].split("-")[0]+'&ymonths='+months+'&status=3';
					    var title = "不含税收入明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
            		document.getElementById("lastconfirmcontsum").onclick = function(){
						var url = '/default/project/controlCabin/confirmcontsumDetail.jsp?orgseqsearch='+o.org.orgseq+'&yyears='+(Number(map["yearmonth"].split("-")[0])-1)+'&ymonths='+months+'&status=3';
					    var title = "去年同期不含税收入明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
            		
            		document.getElementById("confirmgather").onclick = function(){
						var url = '/default/project/controlCabin/confirmgatherDetail.jsp?orgseqsearch='+o.org.orgseq+'&yyears='+map["yearmonth"].split("-")[0]+'&ymonths='+months+'&status=2';
					    var title = "已收款明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
            		document.getElementById("lastconfirmgather").onclick = function(){
						var url = '/default/project/controlCabin/confirmgatherDetail.jsp?orgseqsearch='+o.org.orgseq+'&yyears='+(Number(map["yearmonth"].split("-")[0])-1)+'&ymonths='+months+'&status=2';
					    var title = "去年同期已收款明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
            		
            		document.getElementById("yszk").onclick = function(){
						var url = '/default/project/controlCabin/yszkDetail.jsp?orgseq='+o.org.orgseq+'&yearmonth='+map["yearmonth"];
					    var title = "应收账款明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
            		document.getElementById("lastyszk").onclick = function(){
						var url = '/default/project/controlCabin/yszkDetail.jsp?orgseq='+o.org.orgseq+'&yearmonth='+(Number(map["yearmonth"].split("-")[0])-1)+"-"+map["yearmonth"].split("-")[1];
					    var title = "去年同期应收账款明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
            		
            		document.getElementById("noconfirmcontsum").onclick = function(){
						var url = '/default/project/controlCabin/confirmcontsumDetail.jsp?orgseqsearch='+o.org.orgseq+'&yyears='+map["yearmonth"].split("-")[0]+'&ymonths='+map["yearmonth"].split("-")[1]+'&status=0,2';
					    var title = "预计确认收入明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
            		//document.getElementById("lastnoconfirmcontsum").href = '/default/project/controlCabin/confirmcontsumDetail.jsp?orgseqsearch='+o.org.orgseq+'&yyears='+(Number(map["yearmonth"].split("-")[0])-1)+'&ymonths='+map["yearmonth"].split("-")[1]+'&status=0';
            		
            		document.getElementById("noconfirmgather").onclick = function(){
						var url = '/default/project/controlCabin/confirmgatherDetail.jsp?orgseqsearch='+o.org.orgseq+'&yyears='+map["yearmonth"].split("-")[0]+'&ymonths='+map["yearmonth"].split("-")[1]+'&status=0';
					    var title = "预计收款明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
            		//document.getElementById("lastnoconfirmgather").href = '/default/project/controlCabin/confirmgatherDetail.jsp?orgseqsearch='+o.org.orgseq+'&yyears='+(Number(map["yearmonth"].split("-")[0])-1)+'&ymonths='+map["yearmonth"].split("-")[1]+'&status=0';
            		
            		document.getElementById("activerproject").onclick = function(){
						var url = '/default/project/controlCabin/projectdetail.jsp?orgseq='+o.org.orgseq+'&startdate='+startdate+'&enddate='+enddate+'&type=activerproject';
					    var title = "活动项目明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
            		document.getElementById("passbudproject").onclick = function(){
						var url = '/default/project/controlCabin/projectdetail.jsp?orgseq='+o.org.orgseq+'&startdate='+startdate+'&enddate='+enddate+'&type=passbudproject';
					    var title = "超预算项目明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
            		document.getElementById("postproject").onclick = function(){
						var url = '/default/project/controlCabin/projectdetail.jsp?orgseq='+o.org.orgseq+'&startdate='+startdate+'&enddate='+enddate+'&type=postproject';
					    var title = "延期项目明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
            		document.getElementById("nocontractproject").onclick = function(){
						var url = '/default/project/controlCabin/projectdetail.jsp?orgseq='+o.org.orgseq+'&startdate='+startdate+'&enddate='+enddate+'&type=nocontractproject';
					    var title = "未签合同项目明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
            		document.getElementById("newproject").onclick = function(){
						var url = '/default/project/controlCabin/projectdetail.jsp?orgseq='+o.org.orgseq+'&startdate='+startdate+'&enddate='+enddate+'&type=newproject';
					    var title = "当月新增项目明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
					
					document.getElementById("innum").onclick = function(){
						var url = '/default/project/controlCabin/innumdetail.jsp?orgseq='+o.org.orgseq+'&startdate='+startdate+'&enddate='+enddate+'&type=innum';
					    var title = "当月入职人数明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
					document.getElementById("intends").onclick = function(){
						var url = '/default/project/controlCabin/innumdetail.jsp?orgseq='+o.org.orgseq+'&startdate='+startdate+'&enddate='+enddate+'&type=intends';
					    var title = "当前待入职人数明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
					document.getElementById("leavenum").onclick = function(){
						var url = '/default/project/controlCabin/leavenumdetail.jsp?orgseq='+o.org.orgseq+'&startdate='+startdate+'&enddate='+enddate;
					    var title = "当月离职人数明细";
						nui.open({
							url: url,
							title: title,
							width: '95%',
							height: '100%',
							onload: function () {
								var iframe = this.getIFrameEl();
							},
							ondestroy: function (action){
							}
						});
					};
            		
            		document.getElementById("days").onclick = function(){
						var url = "/default/ame_permanage/ame_leave/getAccountsLeaves.jsp";
					    var title = "休假人数图形统计";
						nui.open({
							url: url,
							title: title,
							width: 415,
							height: 620,
							onload: function () {
								var iframe = this.getIFrameEl();
								if(iframe.contentWindow.init) {
									iframe.contentWindow.init({"orgid": o.org.orgid});
								}
							},
							ondestroy: function (action){
							}
						});
					};
            	}
            }
        });
	}
	
	function formatCurrency(num) {
	    num = num.toString().replace(/\$|\,/g,'');
	    if(isNaN(num))
	        num = "0";
	    var sign = (num == (num = Math.abs(num)));
	    num = Math.floor(num*100+0.50000000001);
	    var cents = num%100;
	    num = Math.floor(num/100).toString();
	    if(cents<10)
	        cents = "0" + cents;
	    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
	        num = num.substring(0,num.length-(4*i+3))+','+
	            num.substring(num.length-(4*i+3));
	    return (((sign)?'':'-') + num + '.' + cents);
	}
	
	function formatnum(num) {
	    num = num.toString().replace(/\$|\,/g,'');
	    if(isNaN(num))
	        num = "0";
	    var sign = (num == (num = Math.abs(num)));
	    num = Math.floor(num*100+0.50000000001);
	    var cents = num%100;
	    num = Math.floor(num/100).toString();
	    if(cents<10)
	        cents = "0" + cents;
	    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
	        num = num.substring(0,num.length-(4*i+3))+','+
	            num.substring(num.length-(4*i+3));
	    return (((sign)?'':'-') + num );
	}
	
	function getMonthDateRange(year, month) {
		var firstDay = new Date(year,month-1);
		var lastDay = new Date(new Date(year,month).valueOf()-60*60*1000*24);
		return {"firstDay":datasFormat(firstDay),"lastDay":datasFormat(lastDay)};
	}
	
	function datasFormat(d){
		var datetime=d.getFullYear() + '-' + (d.getMonth() + 1) + '-' + d.getDate();
		return datetime;
	}
</script>
</html>