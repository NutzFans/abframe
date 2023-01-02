<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): xpc
  - Date: 2019-07-19 10:12:48
  - Description:
-->
<head>
<title>休假人数图形统计</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<style type="text/css">
.fa {display: inline-block;font-family: FontAwesome;font-style: normal;font-weight: normal;line-height: 1;
-webkit-font-smoothing: antialiased;}
orgid:hover   {color:red;}
</style>
<body>
<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
    <table class="table">
		<thead>
			<tr>
			    <td align="right" style="width:70px"><span>部门:</span></td>
			    <td style="width:200px">
	        	  <input name="orgid" class="nui-combobox"  id="orgid" textField="orgname" valueField="orgid" onvaluechanged="changepic" 
						 allowInput="true" style="width:100%"/>
						<!--  url="com.bos.mp.common.SelectManage.queryAllOrg.biz.ext" -->
				</td>
				<td align = "right" style="width:80px;">休假日期:</td>
	            <td style="width:260px">
					<input class="nui-datepicker"  id="min1" name="xjdate1"  onvaluechanged="changepic" style="width:48%"/>-<input class="nui-datepicker" id="max1" name="xjdate2" onvaluechanged="changepic" style="width:48%"/>
				</td>
			</tr>
		</thead>
	</table>
</div>	
<div id="main" style="width: 100%;height:500px;margin-top: 2px;"></div>	
</body>
<!-- 引入 echarts.js -->
<script type="text/javascript" src="assets/js/echarts.js"></script>
<!-- end:echarts.js  -->
<script type="text/javascript">
	    nui.parse();
	    <% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserorgid = user.getUserOrgId();
	    %>
	    var form = new nui.Form("#form1");
	    var myChart = echarts.init(document.getElementById('main'));
	        /*jQuery(document).ready(function() {
	             init(); 
	            changepic(); 
			});*/
		function changepic(){
	    	var data = form.getData();
	    	console.log(data);
	    	var orgid = nui.get("orgid").getValue();
	    	var mindate = nui.get("min1").getValue();
			var maxdate = nui.get("max1").getValue();
			var date = new Date();
	        var str = date.toString();
			str = str.replace("/-/g", "/");
		    date1 = new Date(str);
		    date2 = new Date(str);
		    Date.prototype.addDay = function(num){if(!isNaN(num))this.setDate(this.getDate() + parseInt(num));return this;}//给日期原型加个方法
		    Date.prototype.subDay = function(num){if(!isNaN(num))this.setDate(this.getDate() + parseInt(num));return this;}
	    	if(orgid = null || orgid == ""){
				 nui.alert("部门不能为空");
 				 nui.get("orgid").setValue('<%=nowuserorgid %>'); 
			     return;
			}
			if(mindate = null || mindate == ""){
				 nui.alert("休假开始日期不得为空");
 				 date1.subDay(-7);//调用原型方法减7天
 				 nui.get("min1").setValue(date1);
			     return;
			}
			if(maxdate = null || maxdate == ""){
				 nui.alert("休假结束日期不得为空");
 				 date2.addDay(7);//调用原型方法加7天
 				 nui.get("max1").setValue(date2);
			     return;
			}
			nui.ajax({
			   url:'com.primeton.eos.ame_permanage.ame_leavepro.getAccountsLeaves.biz.ext',
			   type:"POST",
			   data: data,
			   success:function(o){
			        var datecolunms = o.datecolunms;
			        var leavecounts = o.leavecounts;
			        var useralls = [];
					var dates = [];
					var counts = [];
			        for(var i = 0; i<datecolunms.length;i++){
						dates.push(datecolunms[i]);
						useralls.push(o.userall[0].userall);
					}
					for(var i = 0; i<leavecounts.length;i++){
						counts.push(leavecounts[i].leavecount);
					}
					// 指定图表的配置项和数据
			        option = {
						//数据提示框配置
			            tooltip: {
			                trigger: 'axis' //触发类型，默认数据触发，见下图，可选为：'item' | 'axis' 其实就是是否共享提示框
			            },
			            grid: {
					        left: '1%',
					        right: '1%',
					        containLabel: true
					    },
					    color:['#820041','#FF5809'],
					    legend: {
					         top:'3%',
					        data: ['休假人数','部门人数'],
					        selected:{'休假人数':true,'部门人数':false}
					    },
					    calculable: true,
                        //轴配置
					    xAxis:  {
					        type: 'category',
					        data: dates,
					        name: "日期",
							axisLabel:{
        	        		interval: 0,
        	        		rotate:55,
        	        		boundaryGap: [0, '20%']
        	        		/* formatter: function (value) {
        	        			//x轴的文字改为竖版显示
        	        			var str = value.split("");
        	        			return str.join("\n");
        	        		} */
        	        	}
        	        	/* //更改坐标轴颜色
        	        	axisLine:{
                                  lineStyle :{
                                      color: '#FF5809'
                                  }
                                 } */
					    },
					    //Y轴配置
					    yAxis: {
					        type: 'value',
					        name:"人数"
					    },
					    //图表Series数据序列配置
					    series: [
					            {
	                        name: '休假人数',
	                        type: 'line',
	                        data: counts,
	                        itemStyle : { normal: {
	                        borderWidth:5,
	                        label : {show: true}
	                        }}
                                },
                                {
	                        name: '部门人数',
	                        type: 'line',
	                        data: useralls,
	                        itemStyle : { normal: {
	                        borderWidth:0,
	                        }}
                                } 
					 ]
					 };
			        // 使用刚指定的配置项和数据显示图表。
			        myChart.setOption(option); 
			   }
 			});
		}
	    function init(orgseq){
	    	var json = {"code":"queryLeave","map":{"property":"status","op":"=","value":"running"}};
	    	nui.ajax({
				url:"com.primeton.eos.ame_auth.ame_auth.getownorg1.biz.ext",
				data:json,
				type:'POST',
				contentType:'text/json',
				success:function(text){
					if(text.orgs){
						nui.get("orgid").setData(text.orgs);
					}
				}
			});
			if(orgseq.orgid!=null && orgseq.orgid!='' ){
				nui.get("orgid").setValue(orgseq.orgid); 
			}else{
	        	nui.get("orgid").setValue('<%=nowuserorgid %>'); 
			}
	        var date = new Date();
	        var str = date.toString();
			str = str.replace("/-/g", "/");
		    date1 = new Date(str);
		    date2 = new Date(str); 
		    Date.prototype.addDay = function(num){if(!isNaN(num))this.setDate(this.getDate() + parseInt(num));return this;}//给日期原型加个方法
		    Date.prototype.subDay = function(num){if(!isNaN(num))this.setDate(this.getDate() + parseInt(num));return this;}
		    date1.subDay(-7);//调用原型方法减7天
		    date2.addDay(7);//调用原型方法加7天
		    nui.get("min1").setValue(date1);
		    nui.get("max1").setValue(date2);
		    changepic(); 
	     } 
</script> 
</html>