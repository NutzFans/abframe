<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Template Name: Clip-One - Responsive Admin Template build with Twitter Bootstrap 3.x Version: 1.3 Author: ClipTheme -->
<!--[if IE 8]><html class="ie8 no-js" lang="en"><![endif]-->
<!--[if IE 9]><html class="ie9 no-js" lang="en"><![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
	
	<!-- end: HEAD -->
	<!-- start: BODY -->
	<body>
		<!-- start: MAIN CONTAINER -->
		<!-- 引入页面头head.jsp 动态包含-->
			<jsp:include page="menu.jsp"></jsp:include>
		
			<!-- start: PAGE -->
			<div class="main-content">
				<!-- start: PANEL CONFIGURATION MODAL FORM -->
				<div class="modal fade" id="panel-config" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
									&times;
								</button>
								<h4 class="modal-title">Panel Configuration</h4>
							</div>
							<div class="modal-body">
								Here will be a configuration form
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">
									Close
								</button>
								<button type="button" class="btn btn-primary">
									Save changes
								</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<!-- end: SPANEL CONFIGURATION MODAL FORM -->
				<div class="container">
					<!-- start: PAGE HEADER -->
					<div class="row">
						<div class="col-sm-12">
							<!-- start: STYLE SELECTOR BOX -->
							<div id="style_selector" class="hidden-xs">
								<div id="style_selector_container" style="display:block">
									<div class="style-main-title">
										Style Selector
									</div>
									<div class="box-title">
										Choose Your Layout Style
									</div>
									<div class="input-box">
										<div class="input">
											<select name="layout">
												<option value="default">Wide</option><option value="boxed">Boxed</option>
											</select>
										</div>
									</div>
									<div class="box-title">
										Choose Your Header Style
									</div>
									<div class="input-box">
										<div class="input">
											<select name="header">
												<option value="fixed">Fixed</option><option value="default">Default</option>
											</select>
										</div>
									</div>
									<div class="box-title">
										Choose Your Footer Style
									</div>
									<div class="input-box">
										<div class="input">
											<select name="footer">
												<option value="default">Default</option><option value="fixed">Fixed</option>
											</select>
										</div>
									</div>
									<div class="box-title">
										Backgrounds for Boxed Version
									</div>
									<div class="images boxed-patterns">
										<a id="bg_style_1" href="#"><img alt="" src="assets/images/bg.png"></a>
										<a id="bg_style_2" href="#"><img alt="" src="assets/images/bg_2.png"></a>
										<a id="bg_style_3" href="#"><img alt="" src="assets/images/bg_3.png"></a>
										<a id="bg_style_4" href="#"><img alt="" src="assets/images/bg_4.png"></a>
										<a id="bg_style_5" href="#"><img alt="" src="assets/images/bg_5.png"></a>
									</div>
									<div class="box-title">
										5 Predefined Color Schemes
									</div>
									<div class="images icons-color">
										<a id="light" href="#"><img class="active" alt="" src="assets/images/lightgrey.png"></a>
										<a id="dark" href="#"><img alt="" src="assets/images/darkgrey.png"></a>
										<a id="black_and_white" href="#"><img alt="" src="assets/images/blackandwhite.png"></a>
										<a id="navy" href="#"><img alt="" src="assets/images/navy.png"></a>
										<a id="green" href="#"><img alt="" src="assets/images/green.png"></a>
									</div>
									<div class="box-title">
										Style it with LESS
									</div>
									<div class="images">
										<div class="form-group">
											<label>
												Basic
											</label>
											<input type="text" value="#ffffff" class="color-base">
											<div class="dropdown">
												<a class="add-on dropdown-toggle" data-toggle="dropdown"><i style="background-color: #ffffff"></i></a>
												<ul class="dropdown-menu pull-right">
													<li>
														<div class="colorpalette"></div>
													</li>
												</ul>
											</div>
										</div>
										<div class="form-group">
											<label>
												Text
											</label>
											<input type="text" value="#555555" class="color-text">
											<div class="dropdown">
												<a class="add-on dropdown-toggle" data-toggle="dropdown"><i style="background-color: #555555"></i></a>
												<ul class="dropdown-menu pull-right">
													<li>
														<div class="colorpalette"></div>
													</li>
												</ul>
											</div>
										</div>
										<div class="form-group">
											<label>
												Elements
											</label>
											<input type="text" value="#007AFF" class="color-badge">
											<div class="dropdown">
												<a class="add-on dropdown-toggle" data-toggle="dropdown"><i style="background-color: #007AFF"></i></a>
												<ul class="dropdown-menu pull-right">
													<li>
														<div class="colorpalette"></div>
													</li>
												</ul>
											</div>
										</div>
									</div>
									<div style="height:25px;line-height:25px; text-align: center">
										<a class="clear_style" href="#">
											Clear Styles
										</a>
										<a class="save_style" href="#">
											Save Styles
										</a>
									</div>
								</div>
								<div class="style-toggle open"></div>
							</div>
							<!-- end: STYLE SELECTOR BOX -->
							<!-- start: PAGE TITLE & BREADCRUMB -->
							<ol class="breadcrumb">
								<li>
									<i class="clip-home-3"></i>
									<a href="#">
										Home
									</a>
								</li>
								<li class="active">
									Dashboard
								</li>
								<li class="search-box">
									<form class="sidebar-search">
										<div class="form-group">
											<input type="text" placeholder="Start Searching...">
											<button class="submit">
												<i class="clip-search-3"></i>
											</button>
										</div>
									</form>
								</li>
							</ol>
							<!--<div class="page-header">
								<h1>Dashboard <small>overview &amp; stats </small></h1>
							</div> -->
							<!-- end: PAGE TITLE & BREADCRUMB -->
						</div>
					</div>
					<!-- end: PAGE HEADER -->
					<!-- start: PAGE CONTENT -->
					<div class="row">
						<div class="col-sm-6">
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="clip-users-2"></i>
									公司公告
									<div class="panel-tools">
										<a class="btn btn-xs btn-link panel-collapse collapses" href="#">
										</a>
										<a class="btn btn-xs btn-link panel-config" href="#panel-config" data-toggle="modal">
											<i class="fa fa-wrench"></i>
										</a>
										<a class="btn btn-xs btn-link panel-refresh" href="#">
											<i class="fa fa-refresh"></i>
										</a>
										<a class="btn btn-xs btn-link panel-close" href="#">
											<i class="fa fa-times"></i>
										</a>
									</div>
								</div>
								<div class="panel-body panel-scroll" style="height:400px">
									<table class="table table-striped table-hover" id="cusTable"  data_height = "5"  >
										<thead>
											<tr>
												<th  data-field="noticetitle" data-align="left" data-halign = "center" data-formatter= "operateFormatter">标题</th>
												<th data-field="orgname" class="center"  data_height = "5" >发布部门</th>
												<th class="center" data-field="noticedate"  data_height = "5" >发布日期</th>
											</tr>
										</thead>
										<tbody>
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="col-sm-6" >
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="clip-checkbox"></i>
									待办任务
									<div class="panel-tools">
										<a class="btn btn-xs btn-link panel-collapse collapses" href="#">
										</a>
										<a class="btn btn-xs btn-link panel-config" href="#panel-config" data-toggle="modal">
											<i class="fa fa-wrench"></i>
										</a>
										<a class="btn btn-xs btn-link panel-refresh" href="#">
											<i class="fa fa-refresh"></i>
										</a>
										<a class="btn btn-xs btn-link panel-close" href="#">
											<i class="fa fa-times"></i>
										</a>
									</div>
								</div>
								<div class="panel-body panel-scroll" style="height:400px">
									<table class="table table-striped table-hover table-responsive" id="tasklist">
										<thead>
											<tr>
												<th data-field="workItemName" data-width = "130px" data-align="left" data-halign = "center" data-formatter= "operateFormatter" >工作项名称</th>
												<th data-field="processInstName" class="center" >流程实例名称</th>
											</tr>
										</thead>
										<tbody class = "left">
											
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-6">
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="clip-checkbox"></i>
									规章制度
									<div class="panel-tools">
										<a class="btn btn-xs btn-link panel-collapse collapses" href="#">
										</a>
										<a class="btn btn-xs btn-link panel-config" href="#panel-config" data-toggle="modal">
											<i class="fa fa-wrench"></i>
										</a>
										<a class="btn btn-xs btn-link panel-refresh" href="#">
											<i class="fa fa-refresh"></i>
										</a>
										<a class="btn btn-xs btn-link panel-close" href="#">
											<i class="fa fa-times"></i>
										</a>
									</div>
								</div>
								<div class="panel-body panel-scroll" style="height:400px">
									<table class="table table-striped table-hover" id="regularListId" >
										<thead>
											<tr>
												<th data-field="title" data-align="left" data-halign = "center" data-formatter= "operateFormatter">制度名称</th>
												<th data-field="orgname">发布部门</th>
												<th data-field="pubdate">发布日期</th>
											</tr>
										</thead>
									</table>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="clip-stats"></i>
									XX图表
									<div class="panel-tools">
										<a class="btn btn-xs btn-link panel-collapse collapses" href="#">
										</a>
										<a class="btn btn-xs btn-link panel-config" href="#panel-config" data-toggle="modal">
											<i class="fa fa-wrench"></i>
										</a>
										<a class="btn btn-xs btn-link panel-refresh" href="#">
											<i class="fa fa-refresh"></i>
										</a>
										<a class="btn btn-xs btn-link panel-close" href="#">
											<i class="fa fa-times"></i>
										</a>
									</div>
								</div>
								<div class="panel-body">
									<div class="flot-medium-container">
										<div id="placeholder-h1" class="flot-placeholder"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-7">
							<div class="panel panel-default">
								<div class="panel-heading">
									<i class="clip-calendar"></i>
									工时日历
									<div class="panel-tools">
										<a class="btn btn-xs btn-link panel-collapse collapses" href="#">
										</a>
										<a class="btn btn-xs btn-link panel-config" href="#panel-config" data-toggle="modal">
											<i class="fa fa-wrench"></i>
										</a>
										<a class="btn btn-xs btn-link panel-refresh" href="#">
											<i class="fa fa-refresh"></i>
										</a>
										<a class="btn btn-xs btn-link panel-expand" href="#">
											<i class="fa fa-resize-full"></i>
										</a>
										<a class="btn btn-xs btn-link panel-close" href="#">
											<i class="fa fa-times"></i>
										</a>
									</div>
								</div>
								<div class="panel-body">
									<div id='calendar'></div>
								</div>
							</div>
						</div>
						<div class="col-sm-5">
							<div class="row">
								<div class="col-sm-12">
									<div class="panel panel-default">
										<div class="panel-heading">
											<i class="clip-bubble-4"></i>
											规章制度
											<div class="panel-tools">
												<a class="btn btn-xs btn-link panel-collapse collapses" href="#">
												</a>
												<a class="btn btn-xs btn-link panel-config" href="#panel-config" data-toggle="modal">
													<i class="fa fa-wrench"></i>
												</a>
												<a class="btn btn-xs btn-link panel-refresh" href="#">
													<i class="fa fa-refresh"></i>
												</a>
												<a class="btn btn-xs btn-link panel-expand" href="#">
													<i class="fa fa-resize-full"></i>
												</a>
												<a class="btn btn-xs btn-link panel-close" href="#">
													<i class="fa fa-times"></i>
												</a>
											</div>
										</div>
										<div class="panel-body panel-scroll" style="height:460px">
											<ol class="discussion">
												<li class="other">
													<div class="avatar">
														<img alt="" src="assets/images/avatar-4.jpg">
													</div>
													<div class="messages">
														<p>
															Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
														</p>
														<span class="time"> Timothy • 51 min </span>
													</div>
												</li>
												<li class="self">
													<div class="avatar">
														<img alt="" src="assets/images/avatar-1.jpg">
													</div>
													<div class="messages">
														<p>
															Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
														</p>
														<span class="time"> 37 mins </span>
													</div>
												</li>
												<li class="other">
													<div class="avatar">
														<img alt="" src="assets/images/avatar-3.jpg">
													</div>
													<div class="messages">
														<p>
															Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
														</p>
													</div>
												</li>
												<li class="self">
													<div class="avatar">
														<img alt="" src="assets/images/avatar-1.jpg">
													</div>
													<div class="messages">
														<p>
															Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
														</p>
													</div>
												</li>
												<li class="other">
													<div class="avatar">
														<img alt="" src="assets/images/avatar-4.jpg">
													</div>
													<div class="messages">
														<p>
															Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
														</p>
													</div>
												</li>
											</ol>
										</div>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="chat-form">
										<div class="input-group">
											<input type="text" class="form-control input-mask-date" placeholder="Type a message here...">
											<span class="input-group-btn">
												<button class="btn btn-teal" type="button">
													<i class="fa fa-check"></i>
												</button> </span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- end: PAGE CONTENT-->
				</div>
			</div>
			<!-- end: PAGE -->
		</div>
		<!-- end: MAIN CONTAINER -->
		<!-- start: FOOTER -->
		<div class="footer clearfix">
			<div class="footer-inner">
				2014 &copy; clip-one by cliptheme.
			</div>
			<div class="footer-items">
				<span class="go-top"><i class="clip-chevron-up"></i></span>
			</div>
		</div>
		<!-- end: FOOTER -->
		<div id="event-management" class="modal fade" tabindex="-1" data-width="760" style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
							&times;
						</button>
						<h4 class="modal-title">Event Management</h4>
					</div>
					<div class="modal-body"></div>
					<div class="modal-footer">
						<button type="button" data-dismiss="modal" class="btn btn-light-grey">
							Close
						</button>
						<button type="button" class="btn btn-danger remove-event no-display">
							<i class='fa fa-trash-o'></i> Delete Event
						</button>
						<button type='submit' class='btn btn-success save-event'>
							<i class='fa fa-check'></i> Save
						</button>
					</div>
				</div>
			</div>
		</div>
		
			<!-- start: MAIN JAVASCRIPTS -->
		<!--[if lt IE 9]>
		<script src="assets/plugins/respond.min.js"></script>
		<script src="assets/plugins/excanvas.min.js"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<![endif]-->
		<!--[if gte IE 9]><!-->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
		<!--<![endif]-->
		<script src="assets/plugins/jquery-ui/jquery-ui-1.10.2.custom.min.js"></script>
		<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js"></script>
		<script src="assets/plugins/blockUI/jquery.blockUI.js"></script>
		<script src="assets/plugins/iCheck/jquery.icheck.min.js"></script>
		<script src="assets/plugins/perfect-scrollbar/src/jquery.mousewheel.js"></script>
		<script src="assets/plugins/perfect-scrollbar/src/perfect-scrollbar.js"></script>
		<script src="assets/plugins/less/less-1.5.0.min.js"></script>
		<script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
		<script src="assets/plugins/bootstrap-colorpalette/js/bootstrap-colorpalette.js"></script>
	    <script src="assets/js/bootstrap-tab.js"></script>
		<script src="assets/js/sidebar-menu.js"></script>
		<script src="assets/js/main.js"></script>
		<!-- end: MAIN JAVASCRIPTS -->
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="assets/plugins/flot/jquery.flot.js"></script>
		<script src="assets/plugins/flot/jquery.flot.pie.js"></script>
		<script src="assets/plugins/flot/jquery.flot.resize.min.js"></script>
		<script src="assets/plugins/jquery.sparkline/jquery.sparkline.js"></script>
		<script src="assets/plugins/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
		<script src="assets/plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
		<script src="assets/plugins/fullcalendar/fullcalendar/fullcalendar.js"></script>
		<script src="assets/js/index.js"></script>
		<script src="assets/js/bootstrap-table.min.js"></script>
		<script src="assets/js/bootstrap-table-zh-CN.js"></script>
		<script src="assets/js/bootstrap-table-mobile.min.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script type="text/javascript">
			jQuery(document).ready(function() {
			    Index.init();
				
			});
			nui.parse();
			initTable()
			function initTable() {  
		        nui.ajax({
				   type:"POST",
				   url:'com.primeton.eos.ame_common.ameNotice.noticeList1.biz.ext',
				   success:function(data){
				     var datalist = data.rows;
				     $('#cusTable').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
				       data:datalist,   //datalist 即为需要的数据
				       dataType:'json',
				       data_locale:"zh-US",  //转换中文 但是没有什么用处
				       pagination: false,
				       pageList:[],
				       pageNumber:1,
				       paginationLoop:false,
				  //这里也可以将TABLE样式中的<tr>标签里的内容挪到这里面：
				     
				     });
				   },error:function(data){
				     Modal.confirm({title:'提示',msg:"刷新数据失败!"});
				   }
	 			})
	 			 nui.ajax({
				   type:"POST",
				   url:'org.gocom.bps.wfclient.task.business.task.queryMyTasks.biz.ext',
				   success:function(data){
				     var datalist = data.tasks;
				     $('#tasklist').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
				       data:datalist,   //datalist 即为需要的数据
				       dataType:'json',
				       data_locale:"zh-US",  //转换中文 但是没有什么用处
				       pagination: false,
				       pageList:[],
				       pageNumber:1,
				       paginationLoop:false,
				  //这里也可以将TABLE样式中的<tr>标签里的内容挪到这里面：
				     
				     });
				   },error:function(data){
				     Modal.confirm({title:'提示',msg:"刷新数据失败!"});
				   }
	 			})
	 			nui.ajax({
				   type:"POST",
				   url:'com.primeton.eos.ame_common.ameRegular.regularList.biz.ext',
				   success:function(data){
				     var datalist = data.ameRegular;
				     $('#regularListId').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
				       data:datalist,   //datalist 即为需要的数据
				       dataType:'json',
				       data_locale:"zh-US",  //转换中文 但是没有什么用处
				       data_align:"left",
				       pagination: false,
				       pageList:[],
				       pageNumber:1,
				       paginationLoop:false,
				  //这里也可以将TABLE样式中的<tr>标签里的内容挪到这里面：
				     /*   columns: [{
						 field: 'title',
						 title: '制度名称',
						 height:'200px',
						 formatter: operateFormatter
						 }, {
						 field: 'orgname',
						 title: '发布部门'
						 }, {
						 field: 'pubdate',
						 title: '发布日期'
					 }]  */
				     });
				   },error:function(data){
				     Modal.confirm({title:'提示',msg:"刷新数据失败!"});
				   }
	 			})
	     	}
	     	function operateFormatter(e){
	     		return '<a href="javascript:doView()">' + e + '</a> ';
	     	} 
	     	function doView(){
	     		alert("s");
	     	}
		</script>
	</body>
	<!-- end: BODY -->
</html>