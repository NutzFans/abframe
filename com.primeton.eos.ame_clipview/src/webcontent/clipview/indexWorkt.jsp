<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2017-08-28 17:22:02
  - Description:
-->
<head>
<title>工时日历</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	body{font-size:100%}
	*{margin: 0;padding: 0;list-style-type:none;/*系统默认菜单被禁用*/-webkit-user-select:none; /*webkit浏览器*/-khtml-user-select:none; /*早期浏览器*/-moz-user-select:none;/*火狐*/-ms-user-select:none; /*IE10*/user-select:none;  }
    [v-cloak]{display: none !important;}
        #calendar{position: fixed;top:0;bottom:0;width:100%;margin: 0 auto;height: 100%;}
        .month {width: 100%;background: none;}
        .month ul {display: flex;justify-content: space-between;}
        .year-month {display: flex;flex-direction: column;align-items: center;justify-content: space-around;cursor: pointer;}
        
    
        .choose-month {
            text-align: center;
            font-size: 4rem;
        }
        
        .arrow {
            padding:1.5%;
            font-size: 3rem;
            display: inline-block;
            cursor: pointer;
        }
        .month ul li {
            color: #000;
            text-transform: uppercase;
            /*letter-spacing: 3px;*/
        }
        .today{
            display: none;
        }
        
        .weekdays {
	        padding: 1% 0;
	        background-color:#F1EFF6;
	        display: flex;
	        flex-wrap: wrap;
	        color: black;
	        justify-content: space-around;
	        font-size: 2rem;
	        margin-bottom: 0.3rem;
	        font-weight: 600;
	     }
        
        .weekdays li {
	        font-size:3.5rem;
	        width: 13.6%;
	        text-align: center;
        }
        
        .days {
	        background: none;
	        display: flex;
	        flex-wrap: wrap;
	        justify-content: space-around;
	        height: 80%;
        }
        
        .days li {
	        display: inline-block;
	        width: 13%;
	        margin-bottom:0.1%;
	        height: 15%;
	        text-align: center;
	        font-size: 2.5rem;
	        color: #000;
	        border:1px solid #DCDCDC;
	        position: relative;
	        border-radius: 10% 10% 10% 10%; 
	       	cursor: pointer;
	       	display: flex;
	       	align-items: center;
	       	justify-content: space-around;
        }
        .days li .active {
        color: #1E90FF;
        font-weight: 500;        
        }
        .days li .activee {
            color: red;
            font-weight: 500;
        }
        
        .days li .other-month {
            color: #C0C0C0;
        }
        .nnn{
            color:#000000;
            background: #FFCC33;
            position: absolute;
            top: 0;left: 0;
            font-size:2rem;
            width:50%;height:40%;
            border-radius:20% 0 100% 0;
            line-height: 12px!important;
        }
        .nnn:hover{
        	background:#F7B703;
        }
        .mmm{
            color:#251e1e;
            background: #2ff183;
            position: absolute;
            top: 0;left: 0;
            font-size:2rem;
            width:50%;height:40%;
            border-radius:20% 0 100% 0;
            line-height: 12px!important;
        }
        .mmm:hover{
        	background:#35bb6f;
        }
        .extra{
            color:#0099CC;
            background: #FFCC33; 
            float: left;
            position: absolute;
            top: 83%;left: 30%;
            line-height: 1rem;
            font-size: 1.5rem;
            padding:0.3rem 0 0 0;
            width:70%;
            height:15%;
            text-align:center;
            border-radius: 0 0 30% 0;
        }

    </style>
</head>
<body>
	<div id="calendar">
			<!-- 年份 月份 -->
			<div class="month">
				<ul>
					<li class="arrow" @click="pickPre(currentYear,currentMonth)">❮</li>
					<li class="year-month" @click="pickYear(currentYear,currentMonth)">
						<span v-cloak class="choose-month">{{ data }}</span>
					</li>
					<li  class="arrow" @click="pickNext(currentYear,currentMonth)">❯</li>
				</ul>
			</div>
			<!-- 星期 -->
			<ul class="weekdays">
				<li style="color:#42A9DF">日</li>
				<li>一</li>
				<li>二</li>
				<li>三</li>
				<li>四</li>
				<li>五</li>
				<li style="color:#42A9DF">六</li>
			</ul>
			<!-- 日期 -->
			<ul class="days">
				<li  @click="pick(day)" v-for="day in days">
					<!--不是本月-->
					<span v-cloak v-if="day.getMonth()+1 != currentMonth" class="other-month">{{day.getDate()}}</span>
					<!-- 本月 -->
					<span v-else >
						<!-- 判断签到的天数 -->
						<span  v-cloak  v-if="day.getFullYear() == year && day.getMonth()+1 == month && qdays.indexOf(day.getDate())!=-1" class="active">{{ day.getDate()}}</span>
						<span v-else>
							<!-- 今天 -->
 							<span v-cloak v-if="day.getFullYear() == new Date().getFullYear() && day.getMonth() == new Date().getMonth() && day.getDate() == new Date().getDate()" class="activee">{{ day.getDate() }}</span>
							<span v-cloak v-else>{{ day.getDate() }}</span>
						</span>
						<!-- 在这里显示签到的工时 -->
						<p v-cloak v-if="wStatus[qdays.indexOf(day.getDate())]==0" v-on:click.stop.prevent="pickList(day)" class="nnn" v-show="hours[qdays.indexOf(day.getDate())]!=null" >{{ hours[qdays.indexOf(day.getDate())] }}</p>
						<p v-cloak v-else v-on:click.stop.prevent="pickList(day)" class="mmm" v-show="hours[qdays.indexOf(day.getDate())]!=null" >{{ hours[qdays.indexOf(day.getDate())] }}</p>
						<%--<p v-cloak class="extra" v-show="extras[qdays.indexOf(day.getDate())]!=null">{{ "加班:"+extras[qdays.indexOf(day.getDate())] }}</p>--%>
					</span>
					
				</li>
			</ul>
			<ul class="today" @click="picknow(new Date().getFullYear(),(new Date().getMonth()))">
				<li style="color:#000000;text-align:center; width:25%">当前日期</li>
				<li v-cloak style="color:#000000;text-align:left;width:40%">{{ new Date().getFullYear()+'/'+(new Date().getMonth()+1)+'/'+new Date().getDate() }}</li>
				<li style="color:#000000;text-align:right;width:20%">星期</li>
				<li v-cloak style="color:#000000;text-align:left;width:15%">{{weekday[new Date().getDay()]}}</li>
			</ul>
		</div>
</body>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-latest.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/vue.min.js"></script>
<script type="text/javascript">
	
		var app = new Vue({
			el: '#calendar',
			data: {
			currentDay: 1,
			currentMonth: 1,
			currentYear: 1970,
			currentWeek: 1,
			days: [],
			// 签到的日期（天）
			qdays:[],
			// 签到的工时数  我现在的需求是怎么把这些工时数添加到 我签到的天里面
			hours:[],
			extras:[],
			year:2017,
			month:'',
			data:'',
			weekday:[],
			isPhone:'',
			minDate:'',
			wStatus:[]
			},
			created: function() {
				this.initData(null);
				// 初始化当月的样式
				this.pickPre(this.currentYear,this.currentMonth);
				this.pickNext(this.currentYear,this.currentMonth);
			},
			ready:function(){
				var year_d = sessionStorage.getItem("year_d");
				var month_d = parseInt(sessionStorage.getItem("month_d"));
				//数据请求传入参数
				if(year_d != null && year_d != "" && month_d != null && month_d !=""){
					this.dataa(year_d,month_d);
					var d = new Date(this.formatDate(year_d , month_d+1 , 1));
					this.initData(this.formatDate(d.getFullYear(),d.getMonth() ,1));
					//this.pickPre(year_d,month_d+1);
				}
			 	//填报的最小日期
	            var mindate_1='';
	            nui.ajax({
	                type:'get',
	                data:"",
	                async:false,
	                url:'com.primeton.eos.ame_common.wx_worktime.getLaborMinDate.biz.ext',
	                success:function(result){
	                    if(result.minDate  !='' && result.minDate  != null){
	                    	mindate_1 = result.minDate;
	                    }else{
	                    	mindate_1 = null;
	                    }
	                }
	            })
	            this.minDate = mindate_1;			
			},
			methods: {
				initData: function(cur) {
				var date;
				if (cur) {
					date = new Date(cur);
				} else {
					date = new Date();
				}
				//获取到当前的年月日周几并存储
				this.currentDay = date.getDate();
				this.currentYear = date.getFullYear();
				this.currentMonth = date.getMonth()+1;
				this.currentWeek = date.getDay()+1; // 1...6,0
				if (this.currentWeek == 0) {
					this.currentWeek = 7;
				}
				//formaDate 格式化年月日  返回 xxxx-xx-xx的格式
				var str = this.formatDate(this.currentYear , this.currentMonth, this.currentDay);
				this.data = str.slice(0,7);
				// console.log("today:" + str + "," + this.currentWeek);
				this.days.length = 0;
				// 今天是周日，放在第一行第7个位置，前面6个
				for (var i = this.currentWeek - 1; i >= 0; i--) {
					var d = new Date(str);
					d.setDate(d.getDate() - i);
					// console.log("y:" + d.getDate());
					// this.qdays = d.getDate();
					this.days.push(d);
				}
				for (var i = 1; i <= 42 - this.currentWeek; i++) {
					var d = new Date(str);
					d.setDate(d.getDate() + i);
					this.days.push(d);
				}
				this.weekday.length = 0;
				this.weekday.push('日');
				this.weekday.push('一');
				this.weekday.push('二');
				this.weekday.push('三');
				this.weekday.push('四');
				this.weekday.push('五');
				this.weekday.push('六');
			},
			dataa:function(year,month){
				var qdayss = [];
				var hourss = [];
				var extrass = [];
				var wStatuss = [];
				this.year = year;
				this.month = month;
				if(year != null && year != '' && !isNaN(year) && month != null && month != '' && !isNaN(month)){
					var json = {year:year,month:month};
					$.ajax({
						type:'get',
						data:json,
						async:false,
						url:'com.primeton.eos.ame_common.wx_worktime.wx_wtime.biz.ext',
						success:function(result){
							for(var i=0;i<result.labors.length;i++){
								wStatuss.push(result.labors[i].STATUS);
								qdayss.push(parseInt(result.labors[i].LABOR_DATE.slice(8,10)));
								hourss.push(result.labors[i].ACT_HOURS);
								if(result.labors[i].OTW_HOURS !=0){
									extrass.push(result.labors[i].OTW_HOURS)
								}
							}
						}
					})
					this.qdays = qdayss;
					this.hours = hourss;
					this.extras = extrass;
					this.wStatus = wStatuss;
				}	
			},
			pick: function(date) {
				
				var _this = this;
				if(this.isPhone==false){
					return false;
				}
				var startdate = this.formatDate(date.getFullYear(),date.getMonth() + 1,date.getDate());
				sessionStorage.setItem("startdate",startdate); 
				sessionStorage.setItem("enddate",startdate);
				sessionStorage.setItem("time",startdate);
				sessionStorage.setItem("operate","add");
				sessionStorage.setItem("laborDetailId",'');
				//获取当期时间，并进行格式化
				var year = startdate.split('-')[0];
				var month = startdate.split('-')[1];
				var daa = new Date();
				var y = daa.getFullYear();
				var m = daa.getMonth()+1;
				var d = daa.getDate();	
				var dMonth = this.currentMonth;
				
				//如果点击非本月跳转其他页面
				stringTimenot = this.formatDate(year,parseInt(month),1);;
				var timestampnot = Date.parse(new Date(stringTimenot));
				timestampnot = timestampnot / 1000;
				
				stringTimenow = this.formatDate(this.year,parseInt(this.month),1);;
				var timestampnow = Date.parse(new Date(stringTimenow));
				timestampnow = timestampnow / 1000;
				if(this.month != month){
					if(timestampnot<timestampnow){
						this.pickPre(this.currentYear,this.currentMonth);
						return false;
					}else{
						this.pickNext(this.currentYear,this.currentMonth);
						return false;
					}
				}
				
				var stringTime = this.formatDate(y,m,d);
				var timestamp2 = Date.parse(new Date(stringTime));
				timestamp2 = timestamp2 / 1000;
	
				// 获取点击的时间格式的时间戳
				stringTime1 = startdate;
				var timestamp3 = Date.parse(new Date(stringTime1));
				timestamp3 = timestamp3 / 1000;
				
				
				if(this.minDate != '' && this.minDate != null ){
					if(new Date(Date.parse(startdate.replace(/-/g,"/")))<new Date(Date.parse(this.minDate.replace(/-/g,"/")))){
						var dayCount = parseInt((Math.abs(new Date() - new Date(Date.parse(this.minDate.replace(/-/g,"/")))))/1000/60/60/24)+1;
                		alert("根据系统设置要求，不能填报超过距离当前日期"+dayCount+"天的工时！(最小填报日期："+this.minDate.substr(0,10)+')');
					}else{
						//判断点击时间戳与当期时间戳
						if (timestamp2>=timestamp3) {
							var url = '<%= request.getContextPath() %>/ame_common/wxworktime/addworktime.jsp' 
							nui.open({
								url: url,
								title: '新增工时',
								width: 600,
								height: 550,
								ondestroy:function(){
									/* 重新请求当月签到信息 */
									_this.dataa(year,month); 
								}
							}).show("center",60);;
						}
					}
				}
			},
			// 上月
			pickPre: function(year, month) {
				/* 重新请求当月签到信息 */
				if(month==1){
					this.dataa(this.currentYear-1,12); 
				}else{
					this.dataa(this.currentYear,this.currentMonth-1); 
				}
				// setDate(0); 上月最后一天
				// setDate(-1); 上月倒数第二天
				// setDate(dx) 参数dx为 上月最后一天的前后dx天
				var d = new Date(this.formatDate(year , month , 1));
				d.setDate(0);
				this.initData(this.formatDate(d.getFullYear(),d.getMonth() + 1,1));
			},
			// 下月
			pickNext: function(year, month) {
				/* 重新请求当月签到信息 */
				if(month==12){
					this.dataa(this.currentYear+1,1);
				}else {
					this.dataa(this.currentYear,this.currentMonth+1);
				}
				var d = new Date(this.formatDate(year , month , 1));
				d.setDate(35);
				this.initData(this.formatDate(d.getFullYear(),d.getMonth() + 1,1));
			},
			picknow: function(year,month){
				this.currentYear=year;
				this.currentMonth=month;
				this.pickNext(year,month);
			},
			//点击工时按钮
			pickList: function(date){
				var _this = this;
				if(this.isPhone==false){
					return false;
				}
				var startdate = this.formatDate(date.getFullYear(),date.getMonth() + 1,date.getDate());
				sessionStorage.setItem("startdate",startdate); 
				sessionStorage.setItem("enddate",startdate);
				sessionStorage.setItem("time",startdate);
				//获取当前页面的年月
				var year = startdate.split('-')[0];
				var month = startdate.split('-')[1];
				//判断点击时间戳与当期时间戳
				var url = '<%= request.getContextPath() %>/ame_common/wxworktime/list.jsp';
				nui.open({
					url: url,
					title: '工时详情',
					width: 600,
					height: 550,
					ondestroy:function(){
						/* 重新请求当月签到信息 */
						_this.dataa(year,month); 
					}
				}).show("center",60);;
			},
			pickYear: function(year,month) {
				var _this = this;
				if(this.isPhone==false){
					return false;
				}
				//当前月份的天数
				var tempTime = new Date(year,month,0);
			   	//初始化并设置查询开始时间结束时间
				var startdate = this.formatDate(year,month,1);
				var enddate = this.formatDate(year,month,tempTime.getDate());
				sessionStorage.setItem("startdate",startdate); 
				sessionStorage.setItem("enddate",enddate);
				sessionStorage.setItem("time",this.data);
				
				var daa = new Date();
				var y = daa.getFullYear();
				var m = daa.getMonth()+1;
				var d = daa.getDate();
				
				if((y == year && m >= month) || (year<y)){
					var url = '<%= request.getContextPath() %>/ame_common/wxworktime/list.jsp' 
					nui.open({
						url: url,
						title: '工时详情',
						width: 600,
						height: 550,
						ondestroy:function(){
							/* 重新请求当月签到信息 */
							_this.dataa(year,month); 
						}
					}).show("center",60);
				}
			},
			
			// 返回 类似 2016-01-02 格式的字符串
			formatDate: function(year,month,day){
			var y = year;
			var m = month;
			if(m<10) m = "0" + m;
			var d = day;
			if(d<10) d = "0" + d;
			return y+"-"+m+"-"+d
			},
			},
		});
		
		 //判断手机还是pc true为pc false为pc
		function IsPC() {
		    var userAgentInfo = navigator.userAgent;
		    var Agents = ["Android", "iPhone",
		                "SymbianOS", "Windows Phone",
		                "iPad", "iPod"];
		    var flag = true;
		    for (var v = 0; v < Agents.length; v++) {
		        if (userAgentInfo.indexOf(Agents[v]) > 0) {
		            flag = false;
		            break;
		        }
		    }
		    return flag;
		}
		app.isPhone = IsPC();
		//适配兼容
		(function(doc, win) {
			var docEle = doc.documentElement,
				dpr = Math.min(win.devicePixelRatio, 3),
				scale = 1 / dpr,
				resizeEvent = 'orientationchange' in window ? 'orientationchange' : 'resize';
			var metaEle = doc.createElement('meta');
			metaEle.name = 'viewport';
			metaEle.content = 'initial-scale=' + scale + ',maximum-scale=' + scale;
			docEle.firstElementChild.appendChild(metaEle);

			var recalCulate = function() {
				var width = docEle.clientWidth;
				docEle.style.fontSize = 10 * (width / 750) + 'px';
			};

			recalCulate();

			if (!doc.addEventListener) return;
			win.addEventListener(resizeEvent, recalCulate, false);
		})(document, window); 
	</script>
</html>
