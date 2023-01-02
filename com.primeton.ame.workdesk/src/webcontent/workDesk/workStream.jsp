<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-23 10:07:47
  - Description:
-->
<head>
<title>流水</title>
<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
<style type="text/css">
	.content ul li {margin: 10px auto;list-style-type: none;line-height: 25px;padding: 0 10px;}
	.content ul li a{margin:0 10px;}.teal a{color: #f3e7e7;}.white a{color: #807a7a;}
	.columns{overflow: scroll;}
	.loadEffect{width: 100px;height: 100px;position: relative;margin: 10px auto;display: none;}
 	.loadEffect span{display: inline-block;width: 16px;height: 16px;border-radius: 50%;background: #667c8f;position: absolute;
    	-webkit-animation: load 1.04s ease infinite;}
    .loadEffect span:nth-child(1){left: 0;top: 50%;margin-top:-8px;-webkit-animation-delay:0.13s;}
	.loadEffect span:nth-child(2){left: 14px;top: 14px;-webkit-animation-delay:0.26s;}
	.loadEffect span:nth-child(3){left: 50%;top: 0;margin-left: -8px;-webkit-animation-delay:0.39s;}
	.loadEffect span:nth-child(4){top: 14px;right:14px;-webkit-animation-delay:0.52s;}
	.loadEffect span:nth-child(5){right: 0;top: 50%;margin-top:-8px;-webkit-animation-delay:0.65s;}
	.loadEffect span:nth-child(6){right: 14px;bottom:14px;-webkit-animation-delay:0.78s;}
	.loadEffect span:nth-child(7){bottom: 0;left: 50%;margin-left: -8px;-webkit-animation-delay:0.91s;}
	.loadEffect span:nth-child(8){bottom: 14px;left: 14px;-webkit-animation-delay:1.04s;}
	 @-webkit-keyframes load{
	    0%{
	       opacity: 1;
	    }
	    100%{
	       opacity: 0.2;
	    }
	 }
	.notfound{text-align: center;margin: 20px auto;display: none;}
	.modal.fade.in, .modal.container.fade.in,.modal.modal-overflow.fade.in{margin-top: 10% !important;}
	.modal, .modal.container, .modal.modal-overflow{right: 5% !important;left: 5% !important;}
	body .modal-open { position: fixed;width: 100%;height: 100%;overflow: hidden;}
	.modal-footer{padding: 10px 20px;margin-top:0px; }
	.modal-header{padding: 10px 20px;}
	.modal-body{height: 400px !important;overflow: scroll !important;}
</style>
</head>
<body>
<div id="timeline" class="demo1">
	<div class="timeline">
		<div class="notfound">
			<img src="assets/images/200.png">
		</div>
		<!-- <div class="date_separator">
			<span>2018 03</span>
		</div> -->
		<%--<div class="loadEffect">
		     <span></span>
		     <span></span>
		     <span></span>
		     <span></span>
		     <span></span>
		     <span></span>
		     <span></span>
		     <span></span>
		</div>--%>
		<div class="spine"></div>
		<ul class="columns mescroll" id="mescroll" >
			<!-- <li>
				<div class="timeline_element teal">
					<div class="timeline_title">
						<span class="timeline_label">签订合同</span><span class="timeline_date">2018 03 22</span>
					</div>
					<div class="content">
						<b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
					</div>
				</div>
			</li>
			<li>
				<div class="timeline_element white">
					<div class="timeline_title">
						<span class="timeline_label">日程会议</span><span class="timeline_date">2018 03 21</span>
					</div>
					<div class="content">
						<b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.
					</div>[
				</div>
			</li>-->
		</ul>
	</div>
</div>
<!--工时明细模态框-->
<div id="full-width" class="modal container fade" tabindex="-1" style="display: none;">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
			&times;
		</button>
		<h4 class="modal-title">工时明细</h4>
	</div>
	<div class="modal-body">
		<table class="table table-striped table-hover table-responsive" id="workTime">
			<thead>
				<tr>
					<th data-field="projectName" data-align="center">项目名称</th>
					<th data-field="empname" data-width="90px" data-align="center">人员姓名</th>
					<th data-field="hours" data-align="left" data-halign = "center">工时数</th>
					<th data-field="LABORCOST" data-align="left" data-halign = "center">工时成本</th>
				</tr>
			</thead>
			<tbody class = "left">
				
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    </div>
</div>
<!--报销明细模态框-->
<div id="full-width2" class="modal container fade" tabindex="-1" style="display: none;">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
			&times;
		</button>
		<h4 class="modal-title">报销明细</h4>
	</div>
	<div class="modal-body">
		<table class="table table-striped table-hover table-responsive" id="expRei">
			<thead>
				<tr>
					<th data-field="reiid" data-align="center">报销记录号</th>
					<th data-field="empname" data-width="90px" data-align="center">报销人</th>
					<th data-field="feetypename" data-align="left" data-halign = "center">报销类型</th>
					<th data-field="dircost" data-align="left" data-halign = "center">出款金额</th>
				</tr>
			</thead>
			<tbody class = "left">
				
			</tbody>
		</table>
	</div>
	<div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
    </div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		var wh = $(window).height();
		var h = $("#timeline").offset().top;
		h = wh-h-50;
		$(".columns").height(h);
		$(".loadEffect").show();
		$(".spine").hide();
	})
	var i = 0;
	var beginDate = sessionStorage.getItem('beginDate');//获取年份参数
	var endDate = sessionStorage.getItem('endDate');//获取月份参数
	
	//创建MeScroll对象
	var pageIndex = 0;
	
	var mescroll = new MeScroll("mescroll", {
		up:{
			use:true,
			isBounce:false,
			callback:upCallback,
			auto:true
		},
		down: {
			use: false
		}
	});
	function search(sd,ed,pageIndex){
		i++;
		$.ajax({
			type:"post",
			dataType : 'json',
			data:{"startdate":sd,"enddate":ed,"pageIndex":pageIndex},
  			url:"com.primeton.ame.workdesk.workDesk.getPerStream.biz.ext",
  			success:function(result){
  				$(".spine").show();
  				if(result.islast==true){
	  				mescroll.endUpScroll(true);
  				}
  				//时间线
  				mescroll.endSuccess();//隐藏上拉回调显示
  				var lastdate;//上次循环的日期
  				var lastcontnum;//上次循环的合同号
  				var lastrecontnum;//上次循环的收入合同号
  				var lastskcontnum;//上次循环的收款合同号 
  				var html = "";//流水信息
  				var contli = "";//拼接的合同信息
  				var reli = "";//拼接的收入信息
  				var skli = "";//拼接的收款信息
  				var laborli = "";//拼接的工时信息
  				var expli = "";//拼接的工时信息
  				if(result.datas.length == 0){
  					$(".spine").hide();
  					if(i==1){
  						$(".notfound").show();
  					}
  					mescroll.endUpScroll(false);
  					return;
  				}
  				$.each(result.datas,function(n,p){
					if(lastdate==result.datas[n].date){
						if(result.datas[n].contnum!=lastcontnum && result.datas[n].contnum != null && result.datas[n].contnum != ""){
							contli+='<li>【<b>合同签订</b>】签订'+result.datas[n].custname+'客户合同('+result.datas[n].contnum+')金额：'+result.datas[n].contsum+'元</li>';
						}
						if(result.datas[n].recontnum!=lastrecontnum && result.datas[n].recontnum != null && result.datas[n].recontnum != ""){
							reli+='<li>【<b>收入确认</b>】'+result.datas[n].recustname+'客户合同('+result.datas[n].recontnum+')确认收入：'+result.datas[n].remoney+'元</li>';
						}
						if(result.datas[n].skcontnum!=lastskcontnum && result.datas[n].skcontnum != null && result.datas[n].skcontnum != ""){
							skli+='<li>【<b>合同收款</b>】'+result.datas[n].skcustname+'客户合同('+result.datas[n].skcontnum+')收款：'+result.datas[n].skmoney+'元</li>';
						}
						if(n==result.datas.length-1){
							html += '<div class="content"> <ul>'+contli+reli+skli+'</ul></div>';
							html += '</div></li>';
							$('.mescroll-upwarp').before(html);
							contli = "";
							skli = "";
							reli = "";
							html = "";
						}
					}else{
						if(n!=0){
							html += '<div class="content"> <ul>'+contli+reli+skli+laborli+expli+'</ul></div>';
							html += '</div></li>';
							$('.mescroll-upwarp').before(html);
							contli = "";
							skli = "";
							reli = "";
							html = "";
						}
						if(result.datas[n].contnum != null && result.datas[n].contnum != ""){
							contli+='<li>【<b>合同签订</b>】签订'+result.datas[n].custname+'客户合同('+result.datas[n].contnum+')金额：'+result.datas[n].contsum+'元</li>';
						}
						if(result.datas[n].recontnum != null && result.datas[n].recontnum != ""){
							reli+='<li>【<b>收入确认</b>】'+result.datas[n].recustname+'客户合同('+result.datas[n].recontnum+')确认收入：'+result.datas[n].remoney+'元</li>';
						}
						if(result.datas[n].skcontnum != null && result.datas[n].skcontnum != ""){
							skli+='<li>【<b>合同收款</b>】'+result.datas[n].skcustname+'客户合同('+result.datas[n].skcontnum+')收款：'+result.datas[n].skmoney+'元</li>';
						}
						if(result.datas[n].laborDate != null && result.datas[n].laborDate != ""){
							laborli='<li>【<b>工时成本</b>】'+result.datas[n].pronum+'个项目产生的工时成本总计为：'+result.datas[n].laborcost+'元'+'<a date="'+result.datas[n].date+'" href="javascript:void(0)"  onclick="viewInfo(this,1)">详情<i class="fa  fa-angle-double-right"></i></a></li>';
						}else{
							laborli = "";
						}
						if(result.datas[n].paydate != null && result.datas[n].paydate != ""){
							expli='<li>【<b>受益报销</b>】'+result.datas[n].expnum+'张报销单已出款，金额总计为：'+result.datas[n].dircost+'元'+'<a date="'+result.datas[n].date+'" href="javascript:void(0)"onclick="viewInfo(this,2)">详情<i class="fa  fa-angle-double-right"></i></a></li>';
						}else{
							expli = "";
						}
						lastdate = result.datas[n].date;
						lastrecontnum = result.datas[n].recontnum;
						lastskcontnum = result.datas[n].skcontnum;
						lastcontnum = result.datas[n].contnum;
						html += '<li>';
						if(n%2==0){
							html += '<div class="timeline_element teal">';
						}else{
							html += '<div class="timeline_element white">';
						}
						html += '<div class="timeline_title" style = "text-align:center">';
						html += '<span class="timeline_date" style = "float:none;font-size:14px">'+result.datas[n].date+'</span></div>';
						if(n==result.datas.length-1){
							html += '<div class="content"> <ul>'+contli+reli+skli+laborli+expli+'</ul></div>';
							html += '</div></li>';
							$('.mescroll-upwarp').before(html);
							contli = "";
							skli = "";
							reli = "";
							html = "";
						}
					}
					
	  			})
  				
  			}
  		})
	}
	
  	//格式化
	function numformat(e){
		if(e==null || e==""){
			return 0;
		}else{
			var num = (e || 0).toString(), result = '';
			if(num){
				if(num != 0){
					var num2 = num.split(".");
					num = num2[0];
					while (num.length > 3) {
						result = ',' + num.slice(-3) + result;
						num = num.slice(0, num.length - 3);
					}
					if (num) { 
						result = num + result; 
					}
				}else{
					result = 0;
				}
			}else{
				result = 0;
			}
			return result;
		}
	}
	
	//查看详情 
	//var date;//点击的是什么详情;
	function viewInfo(obj,a){
		date = $(obj).attr("date");
		if(a == "1"){
			$("#full-width").modal("show");
			var el = $("#workTime");
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
			$.ajax({
				type:"post",
				dataType : 'json',
				data:{flag:"1",date:date},
	  			url:"com.primeton.ame.workdesk.workDesk.getStreamDetail.biz.ext",
	  			success:function(result){
	  				el.unblock();
	  				var datalist = result.datas;
	  				$('#workTime').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
			       		data:datalist,   //datalist 即为需要的数据
				      	data_locale:"zh-US",  //转换中文 但是没有什么用处
				      	pagination: false,
				      	pageList:[],
				      	pageNumber:1,
				      	paginationLoop:false,
			     	});
	  			}
			})
		}else{
			$("#full-width2").modal("show");
			var el = $("#expRei");
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
			$.ajax({
				type:"post",
				dataType : 'json',
				data:{flag:"2",date:date},
	  			url:"com.primeton.ame.workdesk.workDesk.getStreamDetail.biz.ext",
	  			success:function(result){
	  				el.unblock();
	  				var datalist = result.datas;
	  				$('#expRei').bootstrapTable('destroy').bootstrapTable({  //'destroy' 是必须要加的==作用是加载服务器//  //数据，初始化表格的内容Destroy the bootstrap table.
			       		data:datalist,   //datalist 即为需要的数据
				      	data_locale:"zh-US",  //转换中文 但是没有什么用处
				      	pagination: false,
				      	pageList:[],
				      	pageNumber:1,
				      	paginationLoop:false,
			     	});
	  			}
			})
		}
	}
	
	/*上拉刷新的回调 */
	function upCallback(page){
		setTimeout(function () {
			search(beginDate,endDate,(page.num-1)*page.size);
		},50);
	}
	
</script>
</body>
</html>