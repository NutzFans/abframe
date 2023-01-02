<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-23 10:40:20
  - Description:
-->
<head>
<title>提醒</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<style type="text/css">
	.timelinefooter{line-height:30px;text-align: center;border-top: 1px solid #0000001a;}
	.timelinefooter{color: #fff;}
	.content{padding: 0 !important;}
	ul li{list-style-type: none;}
	.timeline_label{font-size: 20px;color:#b07e7e}
	.qrsr ul li{border-top: 1px solid #0000001a;padding: 0px 5px;border-radius:5px 5px 5px 5px;}
	.qrsr ul li ul li{border:none;box-shadow:none;font-size: 14px;}
	.qrsr div{display: inline-block;width: 50%;}
	.cccccc{background-color: #F7DB70 !important;border-color: #F7DB70 !important;color: #000000 !important;}
	.dddddd{background-color: #EABEBF !important;border-color: #EABEBF !important;color: #000000 !important;}
	.eeeeee{background-color: #75CCEB !important;border-color: #75CCEB !important;color: #000000 !important;}
	.ffffff{background-color: #A5DEE5 !important;border-color: #A5DEE5 !important;color: #000000 !important;}
	.gggggg{background-color: #D6AEDC !important;border-color: #D6AEDC !important;color: #000000 !important;}
	.btnS ul li ul{position: relative;}
	.btnS ul li ul li:nth-child(5){position: absolute;bottom: 5px;text-align: right;}
	.allok{float: right;vertical-align: top;}
	.modal.fade.in, .modal.container.fade.in,.modal.modal-overflow.fade.in{margin-top: 20% !important;}
	.modal, .modal.container, .modal.modal-overflow{right: 5% !important;left: 5% !important;}
	[readonly="readonly"] {
  		user-select: none;
	}
	.datepicker{width: 70% !important;}
	.control-label{margin: 10px 0;font-size: 15px;}
	.views li {margin: 8px auto;}
	body.modal-open {
	    position: fixed;
	    width: 100%;
	    height: 100%;
	    overflow: hidden;
	}
	.notfound{text-align: center;margin: 20px auto;display: none;}
</style>
</head>
<body>
<div id="timeline">
	<div  class="timeline" class="demo1">
		<div class="notfound">
			<img src="assets/images/200.png">
		</div>
		<ul class="columns" id="mescroll" >
				
			
			<%--<li>
				<div class="timeline_element cccccc">
					<div class="timeline_title">
						<span class="timeline_label">工时确认</span>
					</div>
					<div class="content qrsr">
						<ul>
							<li>
								<ul>
									<li><b style="margin-right: 15px;">工时日期：</b>2018-04-12</li>
									<li><b style="margin-right: 15px;">客户：</b>普元信息</li>
									<li><b style="margin-right: 15px;">项目：</b>Ame+2018</li>
									<li><b style="margin-right: 15px;">总工时：</b><i class="clip clip-clock-2"></i> 8</li>
									<li><button type="button" class="btn btn-beige">处理</button></li>
								</ul>
							</li>
							<li>
								<ul>
									<li><b style="margin-right: 15px;">工时日期：</b>2018-04-12</li>
									<li><b style="margin-right: 15px;">客户：</b>普元信息</li>
									<li><b style="margin-right: 15px;">项目：</b>Ame+2018</li>
									<li><b style="margin-right: 15px;">总工时：</b><i class="clip clip-clock-2"></i> 8</li>
									<li><button type="button" class="btn btn-beige">处理</button></li>
								</ul>
							</li>
						</ul>	
					</div>
					<div class="timelinefooter">
						<a href="javascript:view(4)">
							查看更多 <i class="fa fa-arrow-circle-o-right"></i>
						</a>
					</div>
				</div>
			</li>
			<li>
				<div class="timeline_element dddddd">
					<div class="timeline_title">
						<span class="timeline_label">待收款</span>
					</div>
					<div class="content qrsr">
						<ul>
							<li>
								<ul>
									<li><b style="margin-right: 15px;">合同号：</b>S-20180428</li>
									<li><b style="margin-right: 15px;">待确认次数：</b>x-11</li>
									<li><b style="margin-right: 15px;">预计年月：</b>2018-04-29</li>
									<li><b style="margin-right: 15px;">金额：</b><i class="fa fa-cny"></i>400</li>
								</ul>
							</li>
							<li>
								<ul>
									<li><b style="margin-right: 15px;">合同号：</b>S-20180428</li>
									<li><b style="margin-right: 15px;">待确认次数：</b>x-11</li>
									<li><b style="margin-right: 15px;">预计年月：</b>2018-04-29</li>
									<li><b style="margin-right: 15px;">金额：</b><i class="fa fa-cny"></i>400</li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="timelinefooter">
						<a href="javascript:view(4)">
							查看更多 <i class="fa fa-arrow-circle-o-right"></i>
						</a>
					</div>
				</div>
			</li>
		 	<li>
				<div class="timeline_element eeeeee">
					<div class="timeline_title">
						<span class="timeline_label">待确认收入</span>
					</div>
					<div class="content qrsr">
						<ul>
							<li>
								<ul>
									<li><b style="margin-right: 15px;">合同号：</b>S-20180428</li>
									<li><b style="margin-right: 15px;">待确认次数：</b>x-11</li>
									<li><b style="margin-right: 15px;">预计年月：</b>2018-04-29</li>
									<li><b style="margin-right: 15px;">金额：</b><i class="fa fa-cny"></i>400</li>
								</ul>
							</li>
							<li>
								<ul>
									<li><b style="margin-right: 15px;">合同号：</b>S-20180428</li>
									<li><b style="margin-right: 15px;">待确认次数：</b>x-11</li>
									<li><b style="margin-right: 15px;">预计年月：</b>2018-04-29</li>
									<li><b style="margin-right: 15px;">金额：</b><i class="fa fa-cny"></i>400</li>
								</ul>
							</li>
						</ul>
					</div>
					<div class="timelinefooter">
						<a href="javascript:view(4)">
							查看更多 <i class="fa fa-arrow-circle-o-right"></i>
						</a>
					</div>
				</div>
			</li>--%>
		</ul>
	</div>
</div>

<!--待收款模态框-->
<div id="full-widthDsk" class="modal container fade" tabindex="-1" style="display: none;">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
			&times;
		</button>
		<h4 class="modal-title">待收款更新</h4>
	</div>
	<div class="modal-body">
		<form class="form-horizontal row col-sm-12" id="aa">
			<div class="form-group">
				<label class="col-sm-2 control-label"  for="gathertimedesc">
					收款确认时点：
				</label>
				<div class="col-sm-9">
					<input type="text"  id="gathertimedesc" readonly="readonly" class="form-control">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label"  for="newyearmonth">
					收款年月：
				</label>
				<div class="col-sm-9">
					<input type="text" data-date-format="yyyy-mm"  id="newyearmonth" readonly="readonly" class="form-control date-picker">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="reason">
					变更原因：
				</label>
				<div class="col-sm-9">
					<textarea placeholder="请输入变更原因" id="reason" class="form-control"></textarea>
				</div>
			</div>
			<!-- <div class="form-group">
				<label class="col-sm-2 control-label" for="premise">
					确认前提说明：
				</label>
				<div class="col-sm-9">
					<textarea placeholder="请输入确认前提说明"  id="premise" class="form-control"></textarea>
				</div>
			</div> -->
		</form>
	</div>
	<div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="submit()">提交</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    </div>
</div>

<!--待确认收入模态框-->
<div id="full-width22" class="modal container fade" tabindex="-1" style="display: none;">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
			&times;
		</button>
		<h4 class="modal-title">待确认收入</h4>
	</div>
	<div class="modal-body">
		<form class="form-horizontal row col-sm-12" id="aa">
			<div class="form-group">
				<label class="col-sm-2 control-label"  for="newyearmonth2">
					确认年月：
				</label>
				<div class="col-sm-9">
					<input type="text" data-date-format="yyyy-mm"  id="newyearmonth2" readonly="readonly" class="form-control date-picker">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="reason2">
					变更原因：
				</label>
				<div class="col-sm-9">
					<textarea placeholder="请输入变更原因" id="reason2" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="premise2">
					确认前提说明：
				</label>
				<div class="col-sm-9">
					<textarea placeholder="请输入确认前提说明" id="premise2" class="form-control"></textarea>
				</div>
			</div>
		</form>
	</div>
	<div class="modal-footer">
        <button type="button" class="btn btn-primary" onclick="submit2()">提交</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    </div>
</div>

</body>
<script type="text/javascript">
	runDatePicker();
	function runDatePicker() {
        $('.date-picker').datepicker({
            autoclose: true,
            startView: 'months',
          	maxViewMode:'years',
          	minViewMode:'months',
          	language: "zh-CN",
          	todayHighlight: true,
        });
    };

	var endDate = sessionStorage.getItem('endDate');//获取月份参数
	search(endDate);
	function search(ed){
		$.ajax({
			type:"post",
			dataType : 'json',
			data:{"enddate":ed},
  			url:"com.primeton.ame.workdesk.workDesk.getWorkWarn.biz.ext",
  			success:function(result){
  				//如果没有数据
  				if(result.gcData.length == 0 && result.reveData.length == 0 && result.projects.length == 0 && result.laborData.length == 0 && result.payData.length == 0){
  					$(".notfound").show();
  				}
  				if(result.gcData.length>0){//待收款
  				  
  					waitIncome(result.gcData);
  				}
  				if(result.reveData.length>0){//待确认收入
					toConfirmed(result.reveData);
				}
				if(result.projects.length>0){//超预算项目
					overBudget(result.projects);
				}
				if(result.laborData.length>0){//待确认工时
  					workTime(result.laborData);
  				}
				if(result.payData.length>0){//借款
					payData(result.payData);
				}
  			}
  		})
	}
	
	//待收款
	function waitIncome(data){
		var html ="";
		html += '<li><div class="timeline_element dddddd dsk"><div class="timeline_title"><span class="timeline_label">待收款</span></div><div class="content qrsr btnS"><ul>';
		$.each( data, function(n,p){
			if(n>1){
				html += '<li style="display:none" class="views"><ul>';
			}else{
				html += '<li  class="views"><ul>';
			}
			html += '<li><b style="margin-right: 15px;">客户合同：</b>'+data[n].custname+'('+data[n].contnum+')</li>';
			html += '<li><b style="margin-right: 15px;">收款次数：</b>'+data[n].num+'</li>';
			html += '<li><b style="margin-right: 15px;">预计收款年月：</b>'+data[n].dates+'</li>';
			html += '<li><b style="margin-right: 15px;">预计收款金额：</b><i class="fa fa-cny"></i>'+data[n].fcsum+'</li>';
			html += '<li><button type="button" class="btn btn-yellow" contnum="'+data[n].contnum+'" gathertimedesc="'+data[n].gathertimedesc+'" yearMonth="'+data[n].dates+'" ids="'+data[n].ids+'" onclick="jump(this)">更新</button></li>';
			html += '</ul></li>';
		})
		html += '</ul></div><div class="timelinefooter" onclick="view(this)">查看更多</div></div></li>'
		$(".columns").append(html);	
	}
	
	//工时确认提醒
	function workTime(data){
		var html ="";
		html += '<li><div class="timeline_element cccccc"><div class="timeline_title"><span class="timeline_label">工时确认</span><button type="button" class="btn btn-yellow allok"  onclick="sureA(this)">全部确认</button></div><div class="content qrsr btnS"><ul>';
		$.each( data, function(n,p){
			if(n>1){
				html += '<li style="display:none" class="views"><ul>';
			}else{
				html += '<li  class="views"><ul>';
			}
			html += '<li><b style="margin-right: 15px;">项目：</b>'+data[n].projectName+'</li>';
			html += '<li><b style="margin-right: 15px;">员工姓名：</b>'+data[n].empname+'</li>';
			html += '<li><b style="margin-right: 15px;">总工时：</b><i class="clip clip-clock-2"></i>'+data[n].actHours+'</li>';
			html += '<li><b style="margin-right: 15px;">工时成本：</b>'+data[n].cost+'</li>';
			html += '<li><button type="button" class="btn btn-yellow" projectname="'+data[n].projectName+'" empname="'+data[n].empname+'" projectId="'+data[n].projectId+'" userid="'+data[n].userid+'"  onclick="sureT(this)">确认</button></li>';
			html += '</ul></li>';
		})
		html += '</ul></div><div class="timelinefooter" onclick="view(this)">查看更多</div></div></li>'
		$(".columns").append(html);	
	}
	
	//借款
	function payData(data){
		var html ="";
		html += '<li><div class="timeline_element ffffff"><div class="timeline_title"><span class="timeline_label">未核销借款</span></div><div class="content qrsr  btnS"><ul>';
		$.each(data, function(n,p){
			if(n>1){
				html += '<li style="display:none" class="views"><ul>';
			}else{
				html += '<li  class="views"><ul>';
			}
			html += '<li><b style="margin-right: 15px;">借款日期：</b>'+data[n].paydate+'</li>';
			html += '<li><b style="margin-right: 15px;">借款单类型：</b>'+data[n].feetypename+'('+data[n].expno+')</li>';
			html += '<li><b style="margin-right: 15px;">计划还款日期：</b>'+data[n].planrepaydate+'</li>';
			html += '<li><b style="margin-right: 15px;">借款金额：</b><i class="fa fa-cny"></i>'+data[n].confamt+'</li>';
			html += '<li>></li>';
			html += '</ul></li>';			
		})
		html += '</ul></div><div class="timelinefooter" onclick="view(this)">查看更多</div></div></li>'
		$(".columns").append(html);	
	}
	
	//逾期项目未确认
	function overProject(data){
		var html ="";
		html += '<li><div class="timeline_element ffffff"><div class="timeline_title"><span class="timeline_label">未核销借款</span></div><div class="content qrsr btnS"><ul>';
		$.each(data, function(n,p){
			if(n>1){
				html += '<li style="display:none" class="views"><ul>';
			}else{
				html += '<li  class="views"><ul>';
			}
			html += '<li><b style="margin-right: 15px;">借款日期：</b>'+data[n].paydate+'</li>';
			html += '<li><b style="margin-right: 15px;">借款单类型：</b>'+data[n].feetypename+'('+data[n].expno+')</li>';
			html += '<li><b style="margin-right: 15px;">计划还款日期：</b>'+data[n].planrepaydate+'</li>';
			html += '<li><b style="margin-right: 15px;">借款金额：</b><i class="fa fa-cny"></i>'+data[n].confamt+'</li>';
			html += '<li>></li>';
			html += '</ul></li>';			
		})
		html += '</ul></div><div class="timelinefooter" onclick="view(this)">查看更多</div></div></li>'
		$(".columns").append(html);
	}
	
	//待确认收入
	function toConfirmed(data){
		var html ="";
		html += '<li><div class="timeline_element eeeeee"><div class="timeline_title"><span class="timeline_label">待确认收入</span></div><div class="content qrsr btnS"><ul>';
		$.each(data, function(n,p){
			if(n>1){
				html += '<li style="display:none" class="views"><ul>';
			}else{
				html += '<li  class="views"><ul>';
			}
			html += '<li><b style="margin-right: 15px;">客户合同：</b>'+data[n].custname+'('+data[n].contnum+')</li>';
			html += '<li><b style="margin-right: 15px;">确认次数：</b>'+data[n].num+'</li>';
			html += '<li><b style="margin-right: 15px;">预计确认年月：</b>'+data[n].dates+'</li>';
			html += '<li><b style="margin-right: 15px;">预计确认金额：</b><i class="fa fa-cny"></i>'+data[n].fcsum+'</li>';
			html += '<li><button type="button" class="btn btn-yellow" contnum="'+data[n].contnum+'" yearMonth="'+data[n].dates+'"  ids="'+data[n].ids+'" onclick="jump2(this)">更新</button></li>';
			html += '</ul></li>';			
		})
		html += '</ul></div><div class="timelinefooter" onclick="view(this)">查看更多</div></div></li>'
		$(".columns").append(html);	
	}
	
	//超预算项目
	function overBudget(data){
		var html ="";
		html += '<li><div class="timeline_element gggggg"><div class="timeline_title"><span class="timeline_label">超预算项目</span></div><div class="content qrsr"><ul>';
		$.each(data, function(n,p){
			if(n>1){
				html += '<li style="display:none" class="views"><ul>';
			}else{
				html += '<li  class="views"><ul>';
			}
			html += '<li><b style="margin-right: 15px;">客户：</b>'+data[n].custjc+'</li>';
			html += '<li><b style="margin-right: 15px;">项目名称：</b>'+data[n].projectName+'</li>';
			html += '<li><b style="margin-right: 15px;">预算状态：</b>'+data[n].ispassbud+'</li>';
			html += '<li><b style="margin-right: 15px;">预算成本：</b><i class="fa fa-cny"></i>'+data[n].pcostsum+'</li>';
			html += '<li><b style="margin-right: 15px;">当前预算成本：</b><i class="fa fa-cny"></i>'+data[n].tobucost+'</li>';
			html += '<li><b style="margin-right: 15px;">当前实际成本：</b><i class="fa fa-cny"></i>'+data[n].tocost+'</li>';
			html += '</ul></li>';			
		})
		html += '</ul></div><div class="timelinefooter" onclick="view(this)">查看更多</div></div></li>'
		$(".columns").append(html);	
	}
	
	//查看更多
	function view(obj){
		var text = $(obj).text();
		if(text == "查看更多"){
			$(obj).siblings(".content").find("ul").find(".views").show();
			$(obj).html('收起更多');
		}else{
			$(obj).siblings(".content").find("ul").find(".views").hide();
			$(obj).siblings(".content").find("ul").find("li:lt(12)").show();
			$(obj).html('查看更多');
		}
	}
	//确认工时全部
	function sureA(obj){
		var content = $(obj).parents(".timeline_element");
		var json ={flag:"1",enddate:endDate}
		var r=confirm("是否确认全部人员的工时？");
		if (r==true){
			//遮罩
			var el = $('.cccccc')
			mask(el);
			$.ajax({
				type:"post",
				dataType : 'json',
				data:json,
	  			url:"com.primeton.ame.workdesk.workDesk.laborConfBySy.biz.ext",
	  			success:function(result){
	  				el.unblock();
	  				if(result.retCode == 1){
	  					content.remove();//局部更新
	  					alert("确认成功。");
	  				}else{
	  					alert("确认失败。");
	  				}
	  			}
	  		})
  		}else{
  			return;
  		}
	}
	//确认单个工时
	function sureT(obj){
		var content = $(obj).parents(".content");
		var userid = $(obj).attr("userid");
		var projectId = $(obj).attr("projectId");
		var empname = $(obj).attr("empname");
		var projectname = $(obj).attr("projectname");
		var json ={userid:userid,projectid:projectId,flag:"2",enddate:endDate,empname:empname,projectname:projectname}
		var r=confirm("是否确认指定人员的工时？");
    	if (r==true){
    		var el = $('.cccccc').find(".content");
    		mask(el);
       		$.ajax({
				type:"post",
				dataType : 'json',
				data:json,
	  			url:"com.primeton.ame.workdesk.workDesk.laborConfBySy.biz.ext",
	  			success:function(result){
	  				el.unblock();
	  				if(result.retCode == 1){
	  					$(obj).parents(".views").remove();
	  					content.find("ul").find(".views").hide();//局部更新
						content.find("ul").find("li:lt(12)").show();//局部更新
	  					if($(obj).parents(".views").length == 0){
	  						$(obj).parents(".timeline_element").remove();
	  					}
	  					alert("确认成功。");
	  				}else{
	  					alert("确认失败。");
	  				}
	  			}
	  		})
    	}else{
	        return
	    }
	}
	var jsons;
	//待收款处理
	function jump(obj){
		var ids = $(obj).attr("ids");
		var yearMonth = $(obj).attr("yearMonth");
		var contnum = $(obj).attr("contnum");
		$("#full-widthDsk").modal("show");
		$("#newyearmonth").val(getTime());
		$("#gathertimedesc").val($(obj).attr("gathertimedesc"));
		
		
		
		
		
		
		jsons = {yearMonth:yearMonth,ids:ids,contnum:contnum};
	}
	
	function submit(){
		var newyearmonth = $("#newyearmonth").val().replace("-","");
		var reason = $("#reason").val();
		$("#reason").val("");
		//var premise = $("#premise").val();
		
		if(newyearmonth == null || newyearmonth ==""){
			alert("更新年月不能为空！");
			return;
		} 
		if(reason == null || reason ==""){
			alert("变更原因不能为空!");
			return;
		}
		/* if(premise == null || premise == ""){
			alert("确认前提说明不能为空!");
			return;
		} */
	/* 	if(gathertimedesc == null || gathertimedesc == ""){
			alert("收款确认时点不能为空!");
			return;
		} */
		var json ={csChange:{yearmonth:jsons.yearMonth,newyearmonth:newyearmonth,reason:reason,grid:jsons.ids,contnum:jsons.contnum}};
		$.ajax({
            url: "com.primeton.eos.ame_income.csGatherFc.updateCsGatherChange.biz.ext",
			type: 'POST',
			data: JSON.stringify(json),	
			contentType: 'text/json',
            success: function (o) {
            	if(o.result==1){
            		$("#full-widthDsk").modal("hide");
            		alert("更新成功!");
            		$(".columns").empty();
            		search(endDate);
            	}else{
            		alert("更新失败!");
            	}
            }
	    });
	}
	
	//待确认收入
	function jump2(obj){
		var ids = $(obj).attr("ids");
		var yearMonth = $(obj).attr("yearMonth");
		var contnum = $(obj).attr("contnum");
		$("#full-width22").modal("show");
		$("#newyearmonth").val(getTime());
		jsons = {yearMonth:yearMonth,ids:ids,contnum:contnum};
	}
	
	//更新提交事件
	function submit2(){
		var newyearmonth = $("#newyearmonth2").val().replace("-","");
		var reason = $("#reason2").val();
		var premise = $("#premise2").val();
		$("#reason2").val("");
		$("#premise2").val("");

		
		if(newyearmonth == null || newyearmonth ==""){
			alert("更新年月不能为空！");
			return;
		}
		if(reason == null || reason ==""){
			alert("变更原因不能为空!");
			return;
		}
		if(premise == null || premise == ""){
			alert("确认前提说明不能为空!");
			return;
		}
		var json ={csChange:{yearmonth:jsons.yearMonth,newyearmonth:newyearmonth,reason:reason,premise:premise,grid:jsons.ids,contnum:jsons.contnum}};
		$.ajax({
            url: "com.primeton.eos.ame_income.csReveForecast.updateCsChange.biz.ext",
			type: 'POST',
			data: JSON.stringify(json),	
			contentType: 'text/json',
            success: function (o) {
            	if(o.result==1){
            		$("#full-width22").modal("hide");
            		alert("更新成功!");
            		$(".columns").empty();
            		search(endDate);
            	}else{
            		alert("更新失败!");
            	}
            }
	    });
	}
	//遮罩
	function mask(a){
		//遮罩
 	    var el = a;
		el.block({
        	overlayCSS: {
            	backgroundColor: '#000'
            },
            message: '<img src="assets/images/loading.gif" /> 请稍后...',
            css: {
                border: 'none',
                color: '#fff',
                background: 'none'
            }
        });
	}
	
	//获取事件
	function getTime(){
		var now = new Date();  
        var year = now.getFullYear();       //年  
        var month = now.getMonth() + 1;     //月  
        var clock = year + "-";  
          
        if(month < 10) {
        	clock += "0"; 
        }
        return clock += month;
        
	}
	

</script>
</html>