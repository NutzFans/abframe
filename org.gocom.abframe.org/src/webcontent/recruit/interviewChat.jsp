<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en" class="no-js">
<!-- 
  - Author(s): 许青倩
  - Date: 2020-05-22 09:42:20
  - Description:
-->
<head>
	<title>面试状态统计图</title>
	<style type="text/css">
		.fa {
			display: inline-block;
			font-family: FontAwesome;
			font-style: normal;
			font-weight: normal;
			line-height: 1;
			-webkit-font-smoothing: antialiased;}
	</style>
</head>
<body>
	<div id="main" style="width: 1300px;height:350px;margin-top: 2px;">
	</div>
</body>
<!-- 引入 echarts.js -->
<script src="<%= request.getContextPath() %>/ame/clipview/assets/js/echarts.js"></script>
<!-- end:echarts.js  -->
<script src="<%= request.getContextPath() %>/ame/clipview/assets/js/jquery1.min.js"></script>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript">
		<% 
	        String path = request.getContextPath(); 
	        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
	        String recruitid = request.getParameter("recruitid");
		%> 
	 	//加载我的待办任务
	 	var recruitid = "<%=recruitid %>";
		var app = {};
		// 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        jQuery(document).ready(function() {
			init();
		});
		
		var length;
		function init(){
			length = 0;
			var dso = $("#dso").val();
			var data = {"recruitid":recruitid};
			nui.ajax({
			   url:'org.gocom.abframe.org.recruitApproval.recruitApproval.queryInterviewChat.biz.ext',
			   type:"POST",
			   data: data,
			   success:function(o){
			   		var result = o.chatdata;
					// 指定图表的配置项和数据
			        option = {
					    tooltip : {
					        trigger: 'axis',
					        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					        },
			                formatter: function (params,trigger) {
			                	var str=params[0].name+"："+params[0].data+"；";
			                	if(params[0].name=='初试人数'){
			                		if(result.fistactnum != 0 && result.fistactnum != null){
			                			str+="初试通过率：";
			                			var rate = Math.round(result.secondactnum/result.fistactnum* 10000) / 100.00 + "%";
			                			str+=rate;
			                		}
			                	}else if(params[0].name=='复试人数'){
			                		if(result.secondactnum != 0 && result.secondactnum != null){
			                			str+="复试通过率：";
			                			var rate = Math.round(result.sendoffernum/result.secondactnum* 10000) / 100.00 + "%";
			                			str+=rate;
		                			}
			                	}else if(params[0].name=='已入职人数' || params[0].name=='开放HC' ){
			                		if(result.recnum != 0 && result.recnum != null){
			                			str+="招聘完成率："
			                			var rate = Math.round(result.empnum/result.recnum* 10000) / 100.00 + "%";
			                			str+=rate;
		                			}
			                	}
			                	
			                    return '<div style="text-align:center"><div>'+str+'</div></div>'
			                }
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
				        	boundaryGap: true,
					        data: ['开放HC', '初选简历','预约初试人数','初试人数','预约复试人数','复试人数','发出offer','接受offer','拒绝offer','放弃入职人数','待入职人数','已入职人数','未完成人数']
					    },
					    yAxis: {
					        min:0,
					        type: 'value',
				        	name:'人'
					    },
					    series: [
					        {
					            type: 'bar',
					            data: [result.recnum,result.initialnum,result.fistnum,result.fistactnum,result.secondnum,result.secondactnum,result.sendoffernum,result.acceptoffernum,result.refuseoffernum,result.giveupnum,result.intendnum,result.empnum,result.incompletenum],
			                    itemStyle: {
			                        normal: {
			                            color: function(params) {
			                                var colorList = ["#3398db", "#434348", "#90ed7d", "#f7a35c", "#61a0a8", "#61a0a8", "#91c7ae", "#2f4554","#B0C4DE","#71C671","#FF1493","#FFC125","#FF0000"];
			                                return colorList[params.dataIndex]
			                            },
			                        	label: {
				                           show: true,		//开启显示
				                           position: 'top'
				                       }
			                        }
			                    }
					        }
					    ]
					};
					
			        // 使用刚指定的配置项和数据显示图表。
			        myChart.setOption(option); 
			   },error:function(data){
				    alert("刷新数据失败！");
				   }
 			});
		}
</script>
</html>