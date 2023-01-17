<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en" class="no-js">
<!-- 
  - Author(s): mengyy
  - Date: 2017-10-09 16:48:46
  - Description:
-->
<head>
<title>普元业务综合管理平台</title>
<style type="text/css">
.fa {
	display: inline-block;
	font-family: FontAwesome;
	font-style: normal;
	font-weight: normal;
	line-height: 1;
	-webkit-font-smoothing: antialiased;}
#dso{padding: 5px;width:100px;}
</style>
</head>
<body>
<div style="position:relative;margin:1% 0 -3% 3%;z-index:999;width: 200px;">
排序：
<select id="dso" onchange="init()" style="border-color: #D5D5D5">
	<option selected="selected" class="form-control" value="dsoall">全部余额</option>
	<option value="max730">DSO>730</option>
	<option value="max365">DSO>365</option>
	<option value="max180">DSO>180</option>
	<option value="max90">DSO>90</option>
	<option value="max30">DSO>30</option>
	<option value="min30">DSO&lt;30</option>
</select>
</div>
<div style="margin:1% 3% -2.2% 80%;">单位：万元</div>
<div id="main" style="width: 100%;height:600px;margin-top: 2px;">
</div>

</body>
<!-- 引入 echarts.js -->
<script type="text/javascript" src="assets/js/echarts.js"></script>
<!-- end:echarts.js  -->
<script type="text/javascript">
		var app = {};
		// 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        jQuery(document).ready(function() {
			init();
		});
		
		var length;
		function init(){
		
		//遮罩
     	    	var el = $('#dso').parents(".panel");
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
		
		
			length = 0;
			var dso = $("#dso").val();
			var data = {"dso":dso};
			nui.ajax({
			   url:'com.primeton.eos.ame_newlook.newlook.getAccountsReceivable.biz.ext',
			   type:"POST",
			   data: data,
			   success:function(o){
			   		var result = o.accounts;
					var orgname = [];
					var min30 = [];
					var max30 = [];
					var max90 = [];
					var max180 = [];
					var max365 = [];
					var max730 = [];
					var dsoAll = [];
					var maxdso = 0;
					//alert(nui.encode(result));
					for(var i = 0; i<result.length;i++){
						orgname.push(result[i].orgname);
						min30.push(result[i].min30);
						max30.push(result[i].max30);
						max90.push(result[i].max90);
						max180.push(result[i].max180);
						max365.push(result[i].max365);
						max730.push(result[i].max730);
						if(maxdso<result[i].dsoall){
							maxdso=result[i].dsoall;
						}
						dsoAll.push(result[i].dsoall);
						length = dsoAll.length;
					}
					// 指定图表的配置项和数据
			        option = {
					    tooltip : {
					        trigger: 'axis',
					        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
					            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
					        }
					    },
					    color:['#DEFFAC','#FFF4C1','#FFAF60','#FF5809','#820041','#642100'],
					    legend: {
					        data: ['DSO<30', 'DSO>30','DSO>90','DSO>180','DSO>365','DSO>730']
					    },
					    grid: {
					        left: '5%',
					        right: '4%',
					        bottom: '3%',
					        containLabel: true
					    },
					    xAxis:  {
					        min:0,
					        max:Math.ceil(maxdso)+200,
					        axisLabel:{
					        	formatter:'{value}'
					        }
					    },
					    yAxis: {
					        type: 'category',
					        data: orgname
					    },
					    series: [
					        {
					            name: 'DSO<30',
					            type: 'bar',
					            stack: '总量',
					            label: {
					                normal: {
					                    show: false,
					                    rotate:30,
					                    position: 'insideRight'
					                }
					            },
					            data: min30
					        },
					        {
					            name: 'DSO>30',
					            type: 'bar',
					            stack: '总量',
					            label: {
					                normal: {
					                    show: false,
					                    rotate:30,
					                    position: 'insideRight'
					                }
					            },
					            data: max30
					        },
					        {
					            name: 'DSO>90',
					            type: 'bar',
					            stack: '总量',
					            label: {
					                normal: {
					                    show: false,
					                    rotate:30,
					                    position: 'insideRight'
					                }
					            },
					            data: max90
					        },
					        {
					            name: 'DSO>180',
					            type: 'bar',
					            stack: '总量',
					            label: {
					                normal: {
					                    show: false,
					                    rotate:30,
					                    position: 'insideRight'
					                }
					            },
					            data: max180
					        },
					        {
					            name: 'DSO>365',
					            type: 'bar',
					            stack: '总量',
					            label: {
					                normal: {
					                    show: false,
					                    rotate:30,
					                    position: 'insideRight'
					                }
					            },
					            data: max365
					        },
					        {
					            name: 'DSO>730',
					            type: 'bar',
					            stack: '总量',
					            label: {
					                normal: {
					                    show: false,
					                    rotate:30,
					                    position: 'insideRight'
					                }
					            },
					            data: max730
					        },
					        { 
								name: '合计总量', 
								type: 'bar', 
								stack: '总量', 
								label: { 
									normal: { 
										offset:['50', '80'], 
										show: true, 
										position: 'insideLeft', 
										formatter:'{c}', 
										textStyle:{ color:'#000' } 
									}
								}, 
								itemStyle:{ 
									normal:{ 
									color:'rgba(128, 128, 128, 0)' 
									} 
								}, 
								data: dsoAll
							}
					    ]
					};
					
					
					 // 点击legend事件控制
			        myChart.on("legendselectchanged", function(a) {
			            var b = a.selected,
			                c = option.series,
			                d =new Array(dsoAll.length).fill(0),
			                f = !0;
			            for (var g in b)
			                0 == b[g] && (f = !1);
			            if (f) {
			                // var h = sessionStorage.getItem("left");
			                // 由于直接使用省略后的数据相加得到的结果与实际有很小的偏差，
			                // 所以最开始的总数取值来自于后台
			                // 在所有的都没被取消的情况下得到的结果还从这里来取
			                d = dsoAll;
			            } else
			                c.forEach(function(a, c) {
			                    name = a.name,
			                    b[name] && a.data.forEach(function(a, b) {
			                        "--" !== a && (d[b] = d[b] + Number(a))
			                    })
			                });
			                console.log(d);
			            var i = Math.max.apply(null , d).toFixed(0);
			            d = d.map(function(a) {
			                return 0 == a ? "--" : Number(a).toFixed(2)
			            }),
			            option.series[6].data = d,
			            // 从新刷新图表
			            myChart.setOption(option)
			        })
					
					
					
			        // 使用刚指定的配置项和数据显示图表。
			        myChart.setOption(option); 
			        el.unblock();
			   },error:function(data){
				    alert("刷新数据失败！");
				   }
 			});
		}
</script>
</html>