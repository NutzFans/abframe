<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<!-- 
  - Author(s): 张一博
  - Date: 2018-03-23 09:52:13
  - Description:
-->
<head>
<title>汇总</title>
<style type="text/css">
	#accordion .panel-title a { background: #71a0a6;transition: all 0.3s ease 0s;border-radius:2px;padding: 15px 25px;margin-left: -24px;}
	#accordion .panel-title a.collapsed { transition: all 0.3s ease 0s; margin-left: 0px;background: #98bdc1;color: #000;}
	.accordion-teal .panel-heading .accordion-toggle{color: #fff}
</style>
</head>
<body>
<!-- start: ACCORDION PANEL -->
<div class="panel-group accordion-custom accordion-teal" id="accordion">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
			<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
				<i class="icon-arrow"></i>
				合同总额
				<span  style="margin-left: 10px" id="contsum"></span>
			</a> </h4>
		</div>
		<div id="collapseOne" class="panel-collapse collapse">
			<div class="panel-body row">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th class="center">客户</th>
							<th class="center">合同号</th>
							<th class="center">签订日期</th>
							<th class="center">金额</th>
						</tr>
					</thead>
					<tbody id = "cont">
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
			<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
				<i class="icon-arrow"></i>
				收入确认
				<span  style="margin-left: 10px;" id = "srje"></span>
			</a></h4>
		</div>
		<div id="collapseTwo" class="panel-collapse collapse">
			<div class="panel-body row">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th class = "center">客户</th>
							<th class = "center" data-width = "120px">合同号</th>
							<th class = "center" data-width = "120px">确认日期</th>
							<th class="center"   data-width = "120px">确认收入</th>
						</tr>
					</thead>
					<tbody id = "reveid">
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
			<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
				<i class="icon-arrow"></i>
				收款总计
				<span  style="margin-left: 10px" id = "skje"></span>
			</a></h4>
		</div>
		<div id="collapseThree" class="panel-collapse collapse">
			<div class="panel-body row">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th class ="center">客户</th>
							<th class ="center" >合同号</th>
							<th class ="center" >收款日期</th>
							<th class ="center">收款金额</th>
						</tr>
					</thead>
					<tbody id = "gatherid">
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
			<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
				<i class="icon-arrow"></i>
				受益成本
				<span  style="margin-left: 10px" id="benefmon"></span>
			</a></h4>
		</div>
		<div id="collapseFour" class="panel-collapse collapse">
			<div class="panel-body row">
				<table class="table table-striped table-hover" id="sample-table-1">
					<tbody>
						<tr><td align="left">工时定额成本</td><td align="right" id = "standcost"></td></tr>
						<tr><td align="left">直接费用</td><td align="right" id = "pdircost"></td></tr>
						<tr><td align="left">外包费用</td><td align="right" id = "poutcost"></td></tr>
						<tr><td align="left">外部采购</td><td align="right" id = "wbcg"></td></tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4 class="panel-title">
			<a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">
				<i class="icon-arrow"></i>
				我的报销费用
				<span  style="margin-left: 10px" id="myfee"></span>
			</a></h4>
		</div>
		<div id="collapseFive" class="panel-collapse collapse">
			<div class="panel-body row">
				<table class="table table-striped table-hover" id="sample-table-1">
					<tbody>
						<tr><td align="left">审核中</td><td align="right" id = "mydircost"></td></tr>
						<tr><td align="left">已出款</td><td align="right" id = "mydircost1"></td></tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- end: ACCORDION PANEL -->
<script type="text/javascript">
	var beginDate = sessionStorage.getItem('beginDate');//获取年份参数
	var endDate = sessionStorage.getItem('endDate');//获取月份参数
	
	
	search(beginDate,endDate);
	function search(sd,ed){
		//遮罩
 	    var el = $('#accordion');
		el.block({
        	overlayCSS: {
            	backgroundColor: '#fff'
            },
            message: '<img src="assets/images/loading.gif" /> 加载中...',
            css: {
                border: 'none',
                color: '#333',
                background: 'none'
            }
        });
		$.ajax({
			type:"post",
			dataType : 'json',
			data:{startdate:sd,enddate:ed},
  			url:"com.primeton.ame.workdesk.workDesk.getPerInfo.biz.ext",
  			success:function(result){
  				el.unblock();
  				$("#loadingModal").hide();
  				var html = "";//合同信息
  				var html1 = "";//收入
  				var html2 = "";//收款
  				var skje = 0;//收款金额
  				var srje = 0;//收入金额
  				if(result.resultHt){
  					$.each(result.resultHt,function(n,p){
						html += '<tr><td align="left">'+result.resultHt[n].custname+'</td>';				      	
						html += '<td align="left" style = "width:60px;">'+result.resultHt[n].contnum+'</td>';
						html += '<td align="left" style = "width:70px;">'+result.resultHt[n].dates+'</td>';
				      	html += '<td align="right" style = "width:80px;"><i class="fa fa-cny"></i>'+numformat(result.resultHt[n].money)+'</td></tr>';
		  			})
  				}
  				if(result.resultYqr){
		  			$.each(result.resultYqr,function(n,p){
				      	srje = srje+result.resultYqr[n].money;
				      	html1 += '<tr><td align="left">'+result.resultYqr[n].custname+'</td>';				      	
						html1 += '<td align="left" style = "width:60px;">'+result.resultYqr[n].contnum+'</td>';
						html1 += '<td align="left" style = "width:70px;">'+result.resultYqr[n].dates+'</td>';
				      	html1 += '<td align="right" style = "width:80px;"><i class="fa fa-cny"></i>'+numformat(result.resultYqr[n].money)+'</td></tr>';
		  			})
	  			}
	  			if(result.resultYsk){
	  				$.each(result.resultYsk,function(n,p){
			      		skje = skje+result.resultYsk[n].money;
			      		html2 += '<tr><td align="left">'+result.resultYsk[n].custname+'</td>';				      	
						html2 += '<td align="left" style = "width:60px;">'+result.resultYsk[n].contnum+'</td>';
						html2 += '<td align="left" style = "width:70px;">'+result.resultYsk[n].dates+'</td>';
			      		html2 += '<td align="right" style = "width:80px;"><i class="fa fa-cny"></i>'+numformat(result.resultYsk[n].money)+'</td></tr>';
	  				})
	  			}
  				$('#cont').html(html);
  				$('#reveid').html(html1);
  				$('#gatherid').html(html2);
  				$('#contsum').html('<i class="fa fa-cny"></i>'+numformat(result.contsum));
  				$('#srje').html('<i class="fa fa-cny"></i>'+numformat(srje));
  				$('#skje').html('<i class="fa fa-cny"></i>'+numformat(skje));
  				$('#standcost').html('<i class="fa fa-cny"></i>'+numformat(result.standcost));
  				$('#pdircost').html('<i class="fa fa-cny"></i>'+numformat(result.pdircost));
  				$('#mydircost').html('<i class="fa fa-cny"></i>'+numformat(result.mydircost));
  				$('#mydircost1').html('<i class="fa fa-cny"></i>'+numformat(result.mydircost1));
  				$('#myfee').html('<i class="fa fa-cny"></i>'+numformat(result.mydircost+result.mydircost1));
  				$('#poutcost').html('<i class="fa fa-cny"></i>'+numformat(result.poutcost));
  				$('#wbcg').html('<i class="fa fa-cny"></i>'+numformat(result.wbcg));
  				$('#benefmon').html('<i class="fa fa-cny"></i>'+numformat(result.benefmon));
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
	
	function GetQueryString(name){
    	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    	var r = window.location.search.substr(1).match(reg);
    	if(r!=null)return  unescape(r[2]); return null;
	}
</script>
</body>
</html>