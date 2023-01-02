<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Template Name: Clip-One - Responsive Admin Template build with Twitter Bootstrap 3.x Version: 1.3 Author: ClipTheme -->
<!--[if IE 8]><html class="ie8 no-js" lang="en"><![endif]-->
<!--[if IE 9]><html class="ie9 no-js" lang="en"><![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
	<!--<![endif]-->
	<!-- start: HEAD -->
	<head>
		<title>Clip-One - Responsive Admin Template</title>
		<!-- start: META -->
		<meta charset="utf-8" />
		<!--[if IE]><meta http-equiv='X-UA-Compatible' content="IE=edge,IE=9,IE=8,chrome=1" /><![endif]-->
		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta content="" name="description" />
		<meta content="" name="author" />
		<!-- end: META -->
		<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
		<!-- start: MAIN CSS -->
		<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="assets/fonts/style.css">
		<link rel="stylesheet" href="assets/css/main.css">
		<link rel="stylesheet" href="assets/css/main-responsive.css">
		<link rel="stylesheet" href="assets/plugins/iCheck/skins/all.css">
		<link rel="stylesheet" href="assets/plugins/bootstrap-colorpalette/css/bootstrap-colorpalette.css">
		<link rel="stylesheet" href="assets/plugins/perfect-scrollbar/src/perfect-scrollbar.css">
		<link rel="stylesheet" href="assets/css/theme_light.css" type="text/css" id="skin_color">
		<link rel="stylesheet" href="assets/css/print.css" type="text/css" media="print"/>
		<!--[if IE 7]>
		<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome-ie7.min.css">
		<![endif]-->
		<!-- end: MAIN CSS -->
		<!-- start: CSS REQUIRED FOR THIS PAGE ONLY -->
		<link rel="stylesheet" href="assets/plugins/bootstrap-fileupload/bootstrap-fileupload.min.css">
		<link rel="stylesheet" href="assets/plugins/bootstrap-social-buttons/social-buttons-3.css">
		<link rel="stylesheet" href="assets/plugins/select2/select2.css">
		<link rel="stylesheet" href="assets/plugins/datepicker/css/datepicker.css">
		<!-- end: CSS REQUIRED FOR THIS PAGE ONLY -->
		<link rel="shortcut icon" href="favicon.ico" />
		<style type="text/css">
			.thumbnail img{
				display:block!important;
				min-height:120px;
			}
		</style>
	</head>
	<!-- end: HEAD -->
	<!-- start: BODY -->
	<body>
		<!-- start: PAGE CONTENT -->
		<form id="form3" action="com.primeton.eos.ame_newlook.addMyinfo.flow"  target="_self" method="post" enctype="multipart/form-data">
		<input type="hidden" name="_eosFlowAction" value="action0">
		<input type="hidden" name="fileCatalog" id="fileCatalog" value="MyPicture"/>
		<input type="hidden" name="emp/empid" id="empid"/>
		<div class="row " style = "background: white;border: 1;" >
			<div class="col-sm-5" id = "aa">
				<div class="user-left "style="border:none">
					<div class="center">
						<div class="fileupload fileupload-new" data-provides="fileupload">
							<div class="user-image">
								<div class="fileupload-new thumbnail" id="myimg"  style="width: 120px;height:120px"></div>
								<div class="fileupload-preview fileupload-exists thumbnail" style="width: 120px;height: 120px;"></div>
								<div class="user-image-buttons">
									<span class="btn btn-teal btn-file btn-sm"><span class="fileupload-new"><i class="fa fa-pencil"></i></span><span class="fileupload-exists"><i class="fa fa-pencil"></i></span>
										<input data-toggle="tooltip" data-placement="top" title="建议上传120*120的头像。" type="file" id='uploadfile' name="uploadfile" onchange='Javascript:fileSize(this)' >
									</span>
									<a href="#" class="btn fileupload-exists btn-bricky btn-sm" data-dismiss="fileupload">
										<i class="fa fa-times"></i>
									</a>
								</div>
							</div>
						</div>
						<h4 id = "empname"></h4>
					</div>
					<table class="table table-condensed table-hover">
						<tbody>
							<tr>
								<td >工号:</td>
								<td id = "empcode"></td>
							</tr>
							<tr>
								<td>入职日期:</td>
								<td id = "indate"></td>
							</tr>
							<tr>
								<td>微信企业号:</td>
								<td ><span id="wxqyh"></span><a style="float:right;display: none" href="javascript:bindWx()" id="sfbd">现在绑定</a></td>
							</tr>
							<tr>
								<td>性别:</td>
								<td><select name="emp/gender" id="gender" class="form-control" >
									<option value="m" >男</option>
									<option value="f">女</option>
									<option value="n">未知</option>
								</select></td>
							</tr>
							<tr>
								<td>出生日期:</td>
								<td>
									<div class="input-group">
										<input type="text" data-date-format="yyyy-mm-dd" data-date-viewmode="years" class="form-control date-picker" id = "birthdate" name = "emp/birthdate">
										<span class="input-group-addon"> 
											<i class="fa fa-calendar"></i> 
										</span>
									</div>
								</td>
							</tr>
							<tr>
								<td>证件类型:</td>
								<td><select name="emp/cardtype" id="cardtype" class="form-control" >
									<option value="id" selected="selected">身份证</option>
									<option value="zhanzhu">暂住证</option>
									<option value="passport">护照</option>
									<option value="junguan">军官证</option>
									<option value="student">学生证</option>
								</select></td>
							</tr>
							<tr>
								<td>证件号码:</td>
								<td><input type="text"  class="form-control" id="cardno" name="emp/cardno"></td>
							</tr>
							<tr>
								<td>手机号码:</td>
								<td><input type="text" id = "mobileno" class="form-control" name="emp/mobileno" disabled="disabled"></td>
							</tr>
							<tr>
								<td>办公邮件:</td>
								<td><input type="text" id = "oemail" class="form-control" name="emp/oemail" disabled="disabled"></td>
							</tr>
							<tr>
								<td>私人邮箱:</td>
								<td><input type="email" class="form-control" id="pemail" name="emp/pemail"></td>
							</tr>
							<!-- <tr>
								<td>开户行名称:</td>
								<td><input type="text" placeholder="Clark" class="form-control" id="bankname" name="emp/bankname"></td>
							</tr>
							<tr>
								<td>开户行帐号:</td>
								<td><input type="text" placeholder="Clark" class="form-control" id="bankacct" name="emp/bankacct"></td>
							</tr> -->
						</tbody>
					</table>
					<button class="btn btn-teal btn-block"  type = "submit">
						保存 <i class="fa fa-arrow-circle-right"></i>
					</button>
				</div>
			</div>
		</div>
		</form>
		<!-- end: MAIN CONTAINER -->
		<!-- start: MAIN JAVASCRIPTS -->
		<!--[if lt IE 9]>
		<script src="assets/plugins/respond.min.js"></script>
		<script src="assets/plugins/excanvas.min.js"></script>
		<script type="text/javascript" src="assets/js/jquery.min.js"></script>
		<![endif]-->
		<!--[if gte IE 9]><!-->
		<script src="assets/js/jquery1.min.js"></script>
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
		<script src="assets/js/main.js"></script>
		<!-- end: MAIN JAVASCRIPTS -->
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="assets/plugins/select2/select2.min.js"></script>
		<script src="assets/plugins/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
		<script src="assets/plugins/jquery.maskedinput/src/jquery.maskedinput.js"></script>
		<script src="assets/plugins/jquery-maskmoney/jquery.maskMoney.js"></script>
		<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
		<script src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		
		<script>

			//判断上传图片后缀以及大小
			function fileSize(ele){
				var file = ele.value;
				if (!/\.(gif|jpg|jpeg|png|JPG|PNG)$/.test(file)) {
					alert("图片类型必须是jpeg,jpg,png中的一种!");
					ele.value = '';
					return false;
				}else{
					if (((ele.files[0].size).toFixed(2))>=(200*1024)) {
						alert("请上传小于200k的图片!");
						ele.value = '';
						return false;
					}
				}
			}
			
			jQuery(document).ready(function() {
				Main.init();
				runDatePicker();
				loadinfo();
				
			});
			//初始化日历控件
			function runDatePicker() {
		        $('.date-picker').datepicker({
		            autoclose: true
		        });
		    };
			nui.parse();
			//页面加载数据
			function loadinfo(){
				var el = $('#aa');
	            el.block({
	                overlayCSS: {
	                    backgroundColor: '#fff'
	                },
	                message: '<img src="assets/images/loading.gif" /> Just a moment...',
	                css: {
	                    border: 'none',
	                    color: '#333',
	                    background: 'none'
	                }
	            });
				nui.ajax({
				    url:'com.primeton.eos.ame_newlook.newlook.loadMyinfo.biz.ext',
				    type:"POST",
				    success:function(data){
					    var emp = data.emp;
					    $('#empid').val(emp.empid);
					    $('#empname').text(emp.empname);
					    if(emp.wxqyh=="未绑定"){
					    	$('#wxqyh').text(emp.wxqyh);
					    	$('#sfbd').show();
					    }else{
					    	$('#wxqyh').text(emp.wxqyh);
					    }
					    $('#empcode').text(emp.empcode);
					    $('#gender').val(emp.gender);
					    $('#birthdate').val(emp.birthdate);
					    $('#cardtype').val(emp.cardtype);
					    $('#cardno').val(emp.cardno);
					    $('#indate').text(emp.indate);
					    $('#mobileno').val(emp.mobileno);
					    $('#oemail').val(emp.oemail);
					    $('#pemail').val(emp.pemail);
					   /*  $('#bankname').val(emp.bankname);
					    $('#bankacct').val(emp.bankacct); */
					    $('#myimg').css({
					    	'background-image':"url("+emp.filePath+")",
					    	'background-repeat': 'no-repeat',
					    	'background-size':'120px 120px'
					    })
					    el.unblock();
				   },error:function(data){
				   }
	 			})
			}
			function bindWx(){
				var url = "<%=request.getContextPath()%>/ame_common/notice/noticeShow.jsp?id=" + 241;
				var iWidth=1000; //弹出窗口的宽度;
				var iHeight=500; //弹出窗口的高度;
				var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
				var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
				window.open(url, "公告详细信息", "height="+iHeight+", width="+iWidth+",top="+iTop+",left="+iLeft+",resizable=yes");
			}
		</script>
	</body>
	<!-- end: BODY -->
</html>