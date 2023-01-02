<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): xupc
  - Date: 2020-02-10 
  - Description:
-->
<head>
<title>招聘日历</title>
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
       .p1 {
		    background: #F9EF66;
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
            color:#ffffff;
            background: #E74C3C;
            position: absolute;
            top: 0;left: 0;
            font-size:2rem;
            width:40%;height:40%;
            border-radius:20% 0 100% 0;
            line-height: 12px!important;
        }
        .nnn:hover{
        	background:	#C0392B;
        }
        .mmm{
            color:#ffffff;
            background: #007AFF;
            position: absolute;
            top: 0;right: 0;
            font-size:2rem;
            width:40%;height:40%;
            border-radius:0 20% 0 80%;
            line-height: 12px!important;
        }
        .mmm:hover{
        	background:#2980B9;
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
					<li class="arrow" @click="pickPre(currentYear,currentMonth,userid)">❮</li>
					<li class="year-month" >
						<span v-cloak class="choose-month">{{ data }}</span>
					</li>
					<li  class="arrow" @click="pickNext(currentYear,currentMonth,userid)">❯</li>
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
				<li  @click="pick(day,userid)" v-for="day in days" :class = "{'p1':(day.getDate()==pickday && day.getMonth()+1  === pickmonth && day.getMonth()+1 ===currentMonth)}">
					<!--不是本月-->
					<span v-cloak v-if="day.getMonth()+1 != currentMonth" class="other-month">{{day.getDate()}}</span>
					<!-- 本月 -->
					<span v-else >
						<!-- 显示有面试或者入职人员名单的日期 -->
						<span  v-cloak  v-if="day.getFullYear() == year && day.getMonth()+1 == month && (mdays.indexOf(day.getDate())!=-1 || rdays.indexOf(day.getDate())!=-1)" class="active">{{ day.getDate()}}</span>
						<span v-else>
							<!-- 今天 -->
 							<span v-cloak v-if="day.getFullYear() == new Date().getFullYear() && day.getMonth() == new Date().getMonth() && day.getDate() == new Date().getDate()" class="activee">{{ day.getDate() }}</span>
							<span v-cloak v-else>{{ day.getDate() }}</span>
						</span>
						<!-- 在这里显示面试和入职人员人员名单 -->
						<p v-cloak class="nnn" v-show="interviewnums[mdays.indexOf(day.getDate())]!=null" >{{ interviewnums[mdays.indexOf(day.getDate())] }}</p>
						<p v-cloak class="mmm" v-show="intendjoinnums[rdays.indexOf(day.getDate())]!=null" >{{ intendjoinnums[rdays.indexOf(day.getDate())] }}</p>
					</span>
					
				</li>
			</ul>
		</div>
</body>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-latest.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/vue.min.js"></script>
<script type="text/javascript"> 
   <% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
		var app = new Vue({
			el: '#calendar',
			data: {
			userid:'<%=nowuserid %>',
			currentDay: 1,
			currentMonth: 1,
			currentYear: 1970,
			currentWeek: 1,
			pickmonth:1,
			pickday:1,
			days: [],
			// 面试的日期（天） 
			mdays:[],
			// 面试的人数（人）
			interviewnums:[],
			// 入职的日期（天）
			rdays:[],
			// 入职的人数（人）
			intendjoinnums:[],
			//当月当日面试的人数（人）
			viewnum:0,
			//当月当日入职的人数（人）
			joinnum:0,
			year:2017,
			month:'',
			data:'',
			isPhone:'',
			wStatus:[]
			},
			created: function() {
				this.initData(null);
				// 初始化当月的样式
				this.pickPre(this.currentYear,this.currentMonth,this.userid);
				this.pickNext(this.currentYear,this.currentMonth,this.userid);
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
				this.days.length = 0;
				// 今天是周日，放在第一行第7个位置，前面6个
				for (var i = this.currentWeek - 1; i >= 0; i--) {
					var d = new Date(str);
					d.setDate(d.getDate() - i);
					this.days.push(d);
				}
				for (var i = 1; i <= 42 - this.currentWeek; i++) {
					var d = new Date(str);
					d.setDate(d.getDate() + i);
					this.days.push(d);
				}
			},
			dataa:function(year,month,userid){
				var mdayss = [];
				var rdayss = [];
				var interviewnumss = [];
				var intendjoinnumss = [];
				this.year = year;
				this.month = month;
				if(year != null && year != '' && !isNaN(year) && month != null && month != '' && !isNaN(month)){
					var json = {flag:"2",year:year,month:month,userid:userid};
					$.ajax({
						type:'get',
						data:json,
						async:false,
						url:'org.gocom.abframe.org.interviewQuery.queryRecruitPanel.biz.ext',
						success:function(result){
						    for(var i=0;i<result.interviewnums.length;i++){
								mdayss.push(parseInt(result.interviewnums[i].interviewdtae.slice(8,10)));
								interviewnumss.push(result.interviewnums[i].interviewnum);
							}
							for(var i=0;i<result.intendjoinnums.length;i++){
								rdayss.push(parseInt(result.intendjoinnums[i].interdate.slice(8,10)));
								intendjoinnumss.push(result.intendjoinnums[i].intendjoinnum);
							}
						}
					})
					this.mdays = mdayss;
					this.interviewnums = interviewnumss;
					this.rdays = rdayss;   
					this.intendjoinnums = intendjoinnumss;  
				    this.editLabel(year,month,null);
				}	
			},
			pick: function(date,userid) {
				var _this = this;
				if(this.isPhone==false){
					return false;
				}
				//获取当期时间，并进行格式化 
				var year = date.getFullYear();
				var month = date.getMonth() + 1;
				var day = date.getDate();
				this.editLabel(year,month,day,userid);
			},
			// 上月
			pickPre: function(year, month,userid) {
				/* 重新请求当月面试入职信息 */
				if(month==1){
					this.dataa(this.currentYear-1,12,this.userid); 
				}else{
					this.dataa(this.currentYear,this.currentMonth-1,this.userid); 
				}
				// setDate(0); 上月最后一天
				// setDate(-1); 上月倒数第二天
				// setDate(dx) 参数dx为 上月最后一天的前后dx天
				var d = new Date(this.formatDate(year , month , 1));
				d.setDate(0);
				this.initData(this.formatDate(d.getFullYear(),d.getMonth() + 1,1));
			},
			// 下月
			pickNext: function(year, month,userid) {
				/* 重新请求当月面试入职信息 */
				if(month==12){
					this.dataa(this.currentYear+1,1,this.userid);
				}else {
					this.dataa(this.currentYear,this.currentMonth+1,this.userid);
				}
				var d = new Date(this.formatDate(year , month , 1));
				d.setDate(35);
				this.initData(this.formatDate(d.getFullYear(),d.getMonth() + 1,1));
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
			editLabel:function(year,month,day,userid){
				if(day == null){ 
				     var date = new Date();
				     this.pickmonth = date.getMonth() + 1;
				     this.pickday = date.getDate();
				     var d = this.pickday;
				     parent.loadMyinterview_intendjoin(this.formatDate(date.getFullYear(),date.getMonth() + 1,date.getDate()),userid);
				     var aa = this.intendjoinnums[this.rdays.indexOf(d)];
					 var intendjoinnum =  aa == undefined ?this.joinnum:aa;
					 this.joinnum = intendjoinnum;
					 var bb =  this.interviewnums[this.mdays.indexOf(d)];
					 var interviewnum =  bb == undefined ?this.viewnum:bb;  
					 this.viewnum = interviewnum;
				     parent.document.getElementById("Interview_Intendjoin").innerHTML =  '当日面试和入职人员名单';
				     parent.document.getElementById("ddd").innerHTML = '当日面试人员名单(<font color="red">' +  interviewnum + '</font>人次)';
					 parent.document.getElementById("eee").innerHTML = '当日入职人员名单(<font color="#007AFF">' + intendjoinnum + '</font>人)';
				}else{
				     this.pickmonth = month;
				     this.pickday = day;
				     var date = this.formatDate(year,month,day)
					 if(month == this.currentMonth){
					    parent.loadMyinterview_intendjoin(date,userid);
					 }else{
					   parent.loadMyinterview_intendjoin(null,userid);
					 }
				     var aa = this.intendjoinnums[this.rdays.indexOf(day)];
					 var intendjoinnum =  aa == undefined ?0:aa;
					 var bb =  this.interviewnums[this.mdays.indexOf(day)];
					 var interviewnum =  bb == undefined ?0:bb;  
				     parent.document.getElementById("Interview_Intendjoin").innerHTML =  date+ '的面试和入职人员名单';
				     parent.document.getElementById("ddd").innerHTML = date+'面试人员名单(<font color="red">' + interviewnum + '</font>人次)';
					 parent.document.getElementById("eee").innerHTML = date+'入职人员名单(<font color="#007AFF">' + intendjoinnum + '</font>人)';
				}
				   
			}
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
