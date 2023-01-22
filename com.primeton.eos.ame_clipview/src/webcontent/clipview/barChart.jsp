<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<style type="text/css">
.fa {display: inline-block;font-family: FontAwesome;font-style: normal;font-weight: normal;line-height: 1;
-webkit-font-smoothing: antialiased;}
</style>
</head>
<body>
	<table class="table" id="barChartListId">
		<thead>
			<tr>
				<td align="right" width="100px">统计年度：</td>
				<td width="150px"><input style='width: 60px;' type="date"
					id="minyear" onchange="changePicture()">-<input style='width: 60px;' type="text"
					id="maxyear" onchange="changePicture()"></td>
				<td align="left" width="45px">X轴:</td>
				<td width="110px"><select class="form-control" id="xaxis" onchange="changePicture()">
						<option selected="selected" value="0">项目</option>
						<option value="1">受益人</option>
				</select></td>
				<td align="left" width="45px">Y轴:</td>
				<td width="150px"><select id="yaxis" class="form-control" onchange="changePicture()">
						<option selected="selected" value="0">人天数</option>
						<option value="1">定额成本汇总</option>
				</select></td>
			</tr>
		</thead>
	</table>
	<div class="panel-body">
		<div class="flot-medium-container">
			<div id="placeholder-h1" class="flot-placeholder"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
		    
			jQuery(document).ready(function() {
			    var date=new Date;
 				var year=date.getFullYear(); 
			    $("#minyear").val(year);
			    changePicture();
			});
			
		
		function changePicture(){
		
		
			//遮罩
     	    	var el = $('#barChartListId').parents(".panel");
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
			var minyear = $("#minyear").val();
			var maxyear = $("#maxyear").val();
			var date=new Date;
 			var year=date.getFullYear();
 			if(parseFloat(minyear) > year){
 				alert("统计年度最小值不能大于当前年份！");
 				$("#minyear").val(year);
 				return;
 			}
 			if(parseFloat(maxyear) > year){
 				alert("统计年度最大值不能大于当前年份！");
 				$("#maxyear").val(year);
 				return;
 			}
			if(maxyear!=null||maxyear!==""){
				if(parseFloat(minyear) > parseFloat(maxyear)){
					alert("统计年度最大值不能小于最小值！");
					 $("#maxyear").val(minyear);
					return
				}
			}
			var xaxis = $("#xaxis").val();
			var yaxis = $("#yaxis").val();
			if(minyear != null && minyear !=""){
				minyear = minyear + "-01-01";
			}
			if(maxyear != null && maxyear !=""){
				maxyear = maxyear + "-12-31";
			}
			var data = {"data":{"minyear":minyear,"maxyear":maxyear,"yaxis":yaxis,"xaxis":xaxis}};
			nui.ajax({
			   url:'com.primeton.rdmgr.project.queryProjByMe.queryProjectByMe.biz.ext',
			   data: data,
			   type:"POST",
			   success:function(o){
			   		var result = o.projects;
					var data = [];
					var ticks = [];
					for(var i = 0; i<result.length;i++){
						if(xaxis=='0'&&yaxis=='0'){
							var projectName = result[i].projectName;
							var days = result[i].days;
							var b =[];
							var c =[];
							b.push(i);
							b.push(projectName);
							c.push(i);
							c.push(days);
							data.push(c);
							ticks.push(b);
						}else if(xaxis=='0'&&yaxis=='1'){
							var projectName = result[i].projectName;
							var costs = result[i].costs;
							var b =[];
							var c =[];
							b.push(i);
							b.push(projectName);
							c.push(i);
							c.push(costs);
							data.push(c);
							ticks.push(b);
						}else if(xaxis=='1'&&yaxis=='0'){
							var orgname = result[i].orgname;
							var days = result[i].days;
							var b =[];
							var c =[];
							b.push(i);
							b.push(orgname);
							c.push(i);
							c.push(days);
							data.push(c);
							ticks.push(b);
						}else if(xaxis=='1'&&yaxis=='1'){
							var orgname = result[i].orgname;
							var costs = result[i].costs;
							var b =[];
							var c =[];
							b.push(i);
							b.push(orgname);
							c.push(i);
							c.push(costs);
							data.push(c);
							ticks.push(b);
						}
					}
					var name;
					if(xaxis=='0'){
						name="项目"
					}else{
						name="受益人"
					}
					var dataset = [
				        {
				            label: name,
				            data: data
				        }
				    ];
				    var options = {
				        series: {  
				            bars: { 
				            	show: true ,
				            	barWidth: 0.4,
				            	align: "center",
				            	lineWidth: 0,
				            	numbers:{
				            		show:true,
				            		font:{size: 14, weight: "bold", family: "Verdana", color: "#545454"},
				            		xAlign :function (x) {
				            			return x;
				            		}, 
             						yAlign :function (y) {
         								return y;
             						}
				            	}
				            },
				            color:"#0000FF"
				        },
						legend: {
			                noColumns: 0,
			                labelBoxBorderColor: "#EEF4F9"
			            },
			            grid: {
			                hoverable: true,
			                borderWidth: 0,
			                backgroundColor: { colors: ["#EEF4F9", "#EEF4F9"] }
			            },
			            xaxis:{
			            	show:true,
							axisLabelUseCanvas: true,
			                axisLabelFontSizePixels: 12,
			                axisLabelFontFamily: 'Verdana, Arial',
			                axisLabelPadding: 10,
			            	ticks: ticks,
			            	tickColor:"#EEF4F9"
			            },
			            yaxis:{
			            	show:true,
			            	tickColor:"#EEF4F9"
			            }
				    };
					$.plot($("#placeholder-h1"), dataset, options);  
					 el.unblock();
			   },error:function(data){
				    alert("刷新数据失败！");
				   }
 			});
		}
		</script>
</html>