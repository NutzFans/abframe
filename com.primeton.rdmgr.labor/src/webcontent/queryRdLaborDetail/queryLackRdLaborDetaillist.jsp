<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): EPCNB324
  - Date: 2017-12-27 16:00:20
  - Description:
-->
<head>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/ame_common/css/main.css" />
<title>工时详情</title>
<style type="text/css">
    *{margin: 0;padding: 0;list-style-type:none;-webkit-touch-callout:none !important; /*系统默认菜单被禁用*/   -webkit-user-select:none; /*webkit浏览器*/   -khtml-user-select:none; /*早期浏览器*/   -moz-user-select:none;/*火狐*/   -ms-user-select:none; /*IE10*/   user-select:none;  }
    [v-cloak]{display: none !important;}
    #list{overflow: hidden; min-height: 101%;}
    .flex1 {-webkit-flex: 1;/* Chrome */  -ms-flex: 1;/* IE 10 */  flex: 1;/* NEW, Spec - Opera 12.1, Firefox 20+ */-webkit-box-flex: 1;/* OLD - iOS 6-, Safari 3.1-6 */-moz-box-flex: 1;/* OLD - Firefox 19- */}
    div.my_score{position:fixed;*position:absolute;top:40%;left:50%;margin-left:-30%;z-index:110;width:60%;line-height:4rem;border:1px solid gray;border-radius:8px;-webkit-border-radius:8px;-moz-border-radius:8px; text-align:center;font-size:3rem;font-weight:lighter;background: #00BFF0;color:white;}
    
    @media only screen and (min-device-width:599px) {
   		body{background: #F5F5F5}
        .nav{box-shadow:0 2px 2px gray;position: fixed;top: 0;width: 100%;height: 10%;background: #fff;text-align: center;}
        .data{font-size:3rem;;display: inline-block;height: 100%;display: flex;align-items: center;justify-content: center;}
        .xz{cursor: pointer;text-align: center;width: 6%;height:60%;background: #5BC0DE;font-size: 4rem;color: #000000;border-radius: 0.5rem;line-height: 100%;position: absolute;right: 5%;top: 25%;color: #fff;}
        .xz:hover{background: #2DAADE}.dataList{width:94%;padding: 7% 3% 5%;font-size: 1.6rem;}
        .dataList li {padding:2% 2%;margin-top:2rem;background: #ffffff;border-radius:2%;box-shadow: 0px 0px 1px gray;position: relative;}
        .dataList li p {margin-top:0.5rem;}.hours{float:right;font-size:2rem;font-weight: 0;}.extra{float:right;font-size:3rem;}
        /* .btn{display: flex;justify-content: space-around;}
        .btn button{width: 7rem;height: 4rem;font-size: 3rem;margin: 2rem 0;} */
        .btn-ok,.btn-cancel{font-size: 1.3rem;}
        .refreshed,.refreshing{text-align: center;line-height: 0.5rem; opacity: 0.7;display: none;}
        .loading-warp{display: none !important;}
        .btnnn{cursor:pointer;background: #FCFCFC;height:30%;text-align: center;font-size: 3rem;margin-bottom: 10%;border-radius:2%; }
    	.del{display:none;cursor:pointer;position: absolute;bottom:1rem;right: 1.5rem;width: 3rem;line-height: 2rem;background:#2DAADE;text-align: center;font-size: 1rem;color: #fff;border-radius:3px;}
    	.edit{display:none;cursor:pointer;position: absolute;bottom:1rem;right: 6rem;width: 3rem;line-height: 2rem;background:#2DAADE;text-align: center;font-size: 1rem;color: #fff;border-radius:3px;}
    	.del:hover,.edit:hover{
    		background:#5BC0DE;
    	}
    	.dell{display: block;}
    	.stR{float: right;color: gray;}
    }
    @media only screen and (max-device-width:599px) {
    	body{background:url(/default/common/wechat/img/bg.jpg);  background-repeat:no-repeat; background-attachment:fixed;}
        .nav{position: fixed;top: 0;background:#fff;display: flex;align-items: center;justify-content: space-around;width: 100%;box-shadow:0 2px 2px gray;}
        .data{display: flex;flex-direction: column;align-items: center;justify-content: space-around;font-size: 5rem;width:75%}
        .dataList{width:95%;padding: 8rem 2.5%;font-size: 2.5rem;margin-top:4rem;}
        .dataList li {padding:2rem;margin-top:2rem;background: #F5FFFA;border-radius:2%;box-shadow: 0px 0px 5px gray;}
        .dataList li p {margin-top:2rem;}.hours{float:right;font-size:3rem;}.extra{float:right;font-size:3rem;}
        .dataList li h2{font-size:5rem;}
        /* .btn{display: flex;justify-content: space-around;}
        .btn button{width: 7rem;height: 4rem;font-size: 3rem;margin: 2rem 0;} */
        .btn-ok,.btn-cancel{font-size: 2rem;}
        .fh{padding: 5rem;font-size: 4rem;}
        .xz{text-align: center;width: 5rem;height: 4rem;line-height: 4rem;background: #00BFF0;font-size: 3rem;margin-right: 2rem;color: #000000;border-radius: 0.5rem;}
        .refreshing{display: block; text-align: center; display:none;line-height: 0.5rem; opacity: 0.7; margin-top: 12rem;}
        .refreshed{display: block; text-align: center;line-height: 0.5rem; opacity: 0.7; margin-top: 12rem; display:none;}
        .btnnn{background: #FCFCFC;height:30%;line-height: 320%;text-align: center;font-size: 3rem;margin-bottom: 10%;}
    	.stR{float: right;color: gray;}
    }
    
</style>
</head>
<body>
<div id="list" >
    <!-- 下拉刷新的样式存储 -->
        <div class="loading-warp" >
            <div class="box">
                <div>
                    <img src="<%= request.getContextPath() %>/ame_common/img/loading.gif" />
                    <span class="text">下拉开始刷新</span>
                </div>
            </div>
        </div>
        <div class="refreshing">
            <span class="text">数据刷新中···</span>
        </div>
        <div class="refreshed"><span class="text">数据刷新成功！</span></div>
        
        <!-- 生成fixd定位的导航 -->
        <div class="nav">
            <div v-show='isPhone' class="fh" @click="fh(startdate)" >❮</div>
            <div v-cloak class="data">{{ time }}</div>
        </div>
        <ul class="dataList" >
            <li  v-for="(index) in id" @mouseenter="enter($index)"  @mouseleave="leave($index)">
                <h2 v-cloak style="text-align:left;">{{da[$index] }}<span v-cloak class="hours">工时:{{ wt[$index] }}&nbsp;加班:{{ extra[$index] }}</span></h2>
                <p v-cloak>项目：<span v-cloak>{{ xm[$index] }}</span></p>
                <p v-cloak>所属客户：<span v-cloak>{{ kh[$index] }}</span></p>
                <p v-cloak>受益人：<span v-cloak>{{ sy[$index] }}</span> <span class="stR" v-cloak>工时状态：{{ sm[$index] }}</span></p>
                <p v-cloak>项目活动：<span v-cloak>{{ hd[$index] }}</span></p>
                <p v-cloak>内容：<span v-cloak>{{ nr[$index] }}</span></p>
                <!-- <div class="btn">
                    <button @touchstart="edit(mes)">修改</button>
                    <button @touchstart="delete(mes)">删除</button>
                </div> -->
            </li>
        </ul>
</div>
    
    
</body>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-latest.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/p-pull-refresh.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/touche.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/vue.min.js"></script>
<script type="text/javascript">
/* vue 实例 */
    //禁止手机端所有的系统默认事件
    function fnScore(e){
    	e.style.display = 'none';
    }
    var app = new  Vue({
        el:'#list',
        data:{
            mes:'nihao',
            startdate:1,
            enddate:1,
            time:1,
            nr:[],
            sy:[],
            kh:[],
            xm:[],
            wt:[],
            id:[],
            da:[],
            extra:[],
            hd:[],
            status:[],
            sm:[],
            indexs:'',
            isPhone:'',
            userid:''
        },
        ready:function(){
            //获取查询年月日并存储
            this.startdate = sessionStorage.getItem("startdate_lack");
            this.enddate = sessionStorage.getItem("enddate_lack");
            this.time = sessionStorage.getItem("time_lack");
            this.userid = sessionStorage.getItem("userid_lack");
            //数据请求传入参数
            this.dataa(this.startdate,this.enddate);
            $("body").height($(window).height());           
        },
        methods:{
            //工时查询
            dataa:function(aa,bb){
            var nrr = [];var syy = [];
            var khh = [];var xmm = [];
            var wtt = [];var idd = [];
            var dat = [];var extrah = [];var hd = [];var statu = [];var sms = []; 
            var json = {startdate:aa,enddate:bb,userid:this.userid};
                $.ajax({
                    type:'get',
                    data:json,
                    async:false,
                    url:'com.primeton.eos.ame_common.wx_worktime.wxTimeList.biz.ext',
                    success:function(result){
                        for(var i = 0;i<result.rdLabor.length;i++){
                            nrr.push(result.rdLabor[i].repContent);
                            syy.push(result.rdLabor[i].salesName);
                            khh.push(result.rdLabor[i].custname);
                            xmm.push(result.rdLabor[i].projectName);
                            wtt.push(result.rdLabor[i].actHours);
                            idd.push(result.rdLabor[i].laborDetailId);
                            dat.push(result.rdLabor[i].laborDate);
                            extrah.push(result.rdLabor[i].otwHours);
                            hd.push(result.rdLabor[i].taskname);
                            statu.push(result.rdLabor[i].status);
                            sms.push(result.rdLabor[i].statusname)
                        }
                    }
                })
                /* if(this.startdate == this.enddate){
                    dat = [];
                    $('.da').hide();
                }  */
                this.nr = nrr;this.sy = syy;this.kh = khh;this.xm = xmm;this.wt = wtt;this.id= idd;this.da = dat;this.extra = extrah;this.hd = hd;this.status = statu;this.sm = sms;
            	
            },
            enter:function(n){
            	$('.edit').eq(n).addClass('dell');
            	$('.del').eq(n).addClass('dell');
            },
            leave:function(n){
            	$('.edit').eq(n).removeClass('dell');
            	$('.del').eq(n).removeClass('dell');
            },
            fh:function(startdate){
                var arr=startdate.split("-"); 
                sessionStorage.setItem("year_lack",arr[0]); 
                sessionStorage.setItem("month_lack",arr[1]);
                location.href = 'queryLackRdLaborDetaildata.jsp'
            },
            // 返回 类似 2016-01-02 格式的字符串
            formatDate: function(year,month,day){
                var y = year;
                var m = month;
                if(m<10) m = "0" + m;
                    var d = day;
                if(d<10) d = "0" + d;
                    return y+"-"+m+"-"+d;
            }
        },
    });
    //判断触摸时间
    var timeOutEvent=0;
        $(function(){
            $('li').each(function(){
                $(this).on({
                    touchstart: function(){
                        var index = $(this).index();
                        var offset = $(this).offset(); 
                        var list_y =$(document).scrollTop();
                        var body_y =$(window).height();
                        var x=offset.left;
                        var y=offset.top;
                        var width=$(this).outerWidth();
                        var height=$(this).outerHeight();
                        y=body_y-(body_y-y+list_y);
                        timeOutEvent = setTimeout('longPress('+index+','+x+','+y+','+width+','+height+')',500);
                    },
                    touchmove: function(){
                        clearTimeout(timeOutEvent); 
                        timeOutEvent = 0;
                    },
                    touchend: function(){
                        clearTimeout(timeOutEvent);
                        timeOutEvent = 0; 
                    }
                })
            })
        });
        var ttt = IsPC();
       	if(!ttt){
       		 //获取文字节点  
	        var $statu = $('.loading-warp .text');
	        var $refresh = $('.refreshing');
	        var $refreshed = $('.refreshed');
	        //下拉刷新
	        var pullRefresh = $('#list').pPullRefresh({
	            //绑定元素
	            $el: $('#list'),
	            //绑定加载动画元素
	            $loadingEl: $('.loading-warp'),
	            sendData: {startdate:app.startdate,enddate:app.enddate,userid:this.userid},
	            url: 'com.primeton.eos.ame_common.wx_worktime.wxTimeList.biz.ext',
	            autoHide: true,
	            
	            callbacks: {
	                pullStart: function(){
	                    $statu.text('松开开始刷新');
	                },
	                start: function(){
	                    //$statu.text('数据刷新中···');
	                    $refresh.show();
	                },
	                success: function(o){
	                    var nrr = [];var syy = [];
	                    var khh = [];var xmm = [];
	                    var wtt = [];var idd = [];
	                    var dat = [];var extrah = [];var hd = [];var statu = [];
	                    for(var i = 0;i<o.rdLabor.length;i++){
	                        nrr.push(o.rdLabor[i].repContent);
	                        syy.push(o.rdLabor[i].salesName);
	                        khh.push(o.rdLabor[i].custname);
	                        xmm.push(o.rdLabor[i].projectName);
	                        wtt.push(o.rdLabor[i].actHours);
	                        idd.push(o.rdLabor[i].laborDetailId);
	                        dat.push(o.rdLabor[i].laborDate); 
	                        extrah.push(o.rdLabor[i].otwHours);
	                        hd.push(o.rdLabor[i].taskname);
	                        statu.push(o.rdLabor[i].status);
	                    }
	                    <%--if(this.startdate == this.enddate){
	                        dat = [];
	                    }--%>
	                    app.nr = nrr;app.sy = syy;app.kh = khh;app.xm = xmm;app.wt = wtt;app.id= idd;app.da = dat;app.extra = extrah;app.hd = hd; 
	                    app.status = statu;
	                },
	                end: function(){
	                    $refresh.hide();
	                    $refreshed.show();
	                    setTimeout(function(){
	                        $refreshed.hide();
	                    },500);
	                },
	                error: function(){
	                    $statu.text('找不到请求地址,数据刷新失败');
	                }
	            }
	       	 });
       	}
        
        
        $(document).ready(function(){
            stopDrop();     
        })
        
    function stopDrop() {
        var lastY;//最后一次y坐标点
        $(document.body).on('touchstart', function(event) {
            lastY = event.originalEvent.changedTouches[0].clientY;//点击屏幕时记录最后一次Y度坐标。
        });
        $(document.body).on('touchmove', function(event) {
            var y = event.originalEvent.changedTouches[0].clientY;
            var st = $(this).scrollTop(); //滚动条高度  
            if (y >= lastY && st <= 0) {//如果滚动条高度小于0，可以理解为到顶了，且是下拉情况下，阻止touchmove事件。
                lastY = y;
                event.preventDefault();
            }
            lastY = y;
     
        });
    }
        
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
		 
		var flag = IsPC();
		app.isPhone = !flag;
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