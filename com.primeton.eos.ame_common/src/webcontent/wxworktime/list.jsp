<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): 张一博
  - Date: 2017-05-03 17:40:38
  - Description:
-->
<head>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/ame_common/css/main.css" />
<title>工时列表</title>
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
            <div class="xz" @click="add(startdate,enddate)">+</div>
        </div>
        <ul class="dataList" >
            <li  v-for="(index) in id" @mouseenter="enter($index)"  @mouseleave="leave($index)">
                <h2 v-cloak style="text-align:left;">{{da[$index] }}<span v-cloak class="hours">工时:{{ wt[$index] }}&nbsp;<%--加班:{{ extra[$index] }}--%></span></h2>
                <p v-cloak>项目：<span v-cloak>{{ xm[$index] }}</span></p>
                <p v-cloak>所属客户：<span v-cloak>{{ kh[$index] }}</span></p>
                <p v-cloak>受益人：<span v-cloak>{{ sy[$index] }}</span> <span class="stR" v-cloak>工时状态：{{ sm[$index] }}</span></p>
                <p v-cloak>项目活动：<span v-cloak>{{ hd[$index] }}</span></p>
                <p v-cloak>内容：<span v-cloak>{{ nr[$index] }}</span></p>
                <!-- <div class="btn">
                    <button @touchstart="edit(mes)">修改</button>
                    <button @touchstart="delete(mes)">删除</button>
                </div> -->
                <p v-if='!isPhone' class='edit' onclick='edit({{$index}})'>编辑</p>
                <p v-if='!isPhone' class='del' onclick='del({{$index}})'>删除</p>
            </li>
        </ul>
        
        <!-- 长按弹出模态框 -->
    <div style="position: fixed;top:0;bottom: 0;left: 0;right: 0;background: rgba(0,0,0,0);display: none;" class="modal">
        <div class="fix" style="position: fixed;top:0;bottom: 0;left: 0;right: 0;background: rgba(0,0,0,0.6);">
        <div style="width: 50%;height:80%;margin: 5% auto;">
            <p class=" btn-ok btnnn">删除该工时</h2>
            <p class=" btn-cancel btnnn">修改该工时</h2>
        </div>
        </div>
    </div>
    <div id="myscore" class="my_score" style="display:none;">长按可以编辑哦！(=^ ^=)</div>
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
            minDate:'',
        },
        ready:function(){
            //获取查询年月日并存储
            this.startdate = sessionStorage.getItem("startdate");
            this.enddate = sessionStorage.getItem("enddate");
            this.time = sessionStorage.getItem("time");
            //数据请求传入参数
            this.dataa(this.startdate,this.enddate);
            $("body").height($(window).height());
            
            //填报的最小日期
            var mindate_1='';
            $.ajax({
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
        methods:{
            //工时查询
            dataa:function(aa,bb){
            var nrr = [];var syy = [];
            var khh = [];var xmm = [];
            var wtt = [];var idd = [];
            var dat = [];var extrah = [];var hd = [];var statu = [];var sms = []; 
            var json = {startdate:aa,enddate:bb};
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
            	if(this.nr.length>0){
					window.onload = function(){
						var oScore = document.getElementById('myscore');
						if(flag ==false){
							oScore.style.display = 'block';
						}
						setTimeout(fnScore,1000,oScore);
					}
				}
            },
            enter:function(n){
            	$('.edit').eq(n).addClass('dell');
            	$('.del').eq(n).addClass('dell');
            },
            leave:function(n){
            	$('.edit').eq(n).removeClass('dell');
            	$('.del').eq(n).removeClass('dell');
            },
            add:function(startdate,enddate){
	            //判断日期是否合法
            	if(new Date(Date.parse(this.startdate.replace(/-/g,"/")))<new Date(Date.parse(this.minDate.replace(/-/g,"/")))){
            		var dayCount = parseInt((Math.abs(new Date() - new Date(Date.parse(this.minDate.replace(/-/g,"/")))))/1000/60/60/24)+1;
                	alert("根据系统设置要求，不能填报超过距离当前日期"+dayCount+"天的工时！(最小填报日期："+this.minDate.substr(0,10)+')');
                	return false;
                }
                sessionStorage.setItem("startdate",startdate);
                sessionStorage.setItem("enddate",enddate);
                sessionStorage.setItem("operate","add");
                sessionStorage.setItem("laborDetailId",'');
                location.href = 'addworktime.jsp';
            },
            fh:function(startdate){
                var arr=startdate.split("-"); 
                sessionStorage.setItem("year_d",arr[0]); 
                sessionStorage.setItem("month_d",arr[1]);
                location.href = 'worktime.jsp'
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
        //长按触发的事件
       
	   		 function longPress(index,x,y,width,height,e){
	        <%--$(this).css("background","rgba(0,0,0,0.6)");--%>
	        	if(flag==false){
			       $('.fix').css({
			       		 "top":y,
                         "left":x,
                         "width":width,
                         "height":height
                   });
			        $('.modal').fadeIn();
			        app.indexs = index;
			        timeOutEvent = 0;
			        e.preventDefault();
		      	}
		      	return;
      		}
        //修改该条信息
        $('.btn-cancel').on('touchstart',function(){
            edit();
        })
        function edit(ooo){
        	if(app.isPhone){
        		var index = app.indexs;
        	}else{
        		var index = ooo;
        	}
            if(app.status[index]=='3' || app.status[index]=='4' || app.status[index]=='1'){
            	var me='';
            	if(app.status[index]=='3'){
            		me="PMO审核确认";
            	}else if(app.status[index]=='4'){
            		me="财务已核算";
            	}else if(app.status[index]=='1'){
            		me="受益部门确认";
            	}
                alert("该工时状态为"+me+"，不能修改！");
                return;
            }
            
            var json = {laborDetailId:app.id[index]};
            var resultflag=true;
            $.ajax({
                type:'get',
                data:json,
                async:false,
                url:'com.primeton.rdmgr.labor.queryOverTime.judgeBreakOff.biz.ext',
                success:function(o){
                    if(o.result == 1){
                      	resultflag=false;
                    } 
                }
            })
            
            if(resultflag==false){
            	alert("该工时已被调休过，不能修改！");
       			return;
            }
            
            sessionStorage.setItem("startdate",app.da[index]);
            sessionStorage.setItem("enddate",app.da[index]);
            sessionStorage.setItem("laborDetailId",app.id[index]);
            sessionStorage.setItem("custname",app.kh[index]);
            sessionStorage.setItem("operate","alter");
            location.href = 'addworktime.jsp';
        }
        //删除该条信息
        $('.btn-ok').on('touchstart',function(){
             del();   
        });
        function del(ooo){
        	if(app.isPhone){
        		var index = app.indexs;
        	}else{
        		var index = ooo;
        	}
            if( app.status[index]=='4' ){
                alert("该工时状态为财务已核算，不能删除！")
                return;
            }
            var json = {laborDetailId:app.id[index]};
            var resultflag=true;
            $.ajax({
                type:'get',
                data:json,
                async:false,
                url:'com.primeton.rdmgr.labor.queryOverTime.judgeBreakOff.biz.ext',
                success:function(o){
                    if(o.result == 1){
                      	resultflag=false;
                    } 
                }
            })
            
            if(resultflag==false){
            	alert("该工时已被调休过，不能删除！");
       			return;
            }
            
            if(app.minDate != null && app.minDate != '' && app.da[index] != null && app.da[index] != null){
            	if(new   Date(Date.parse(app.da[index].replace(/-/g,"/")))<new Date(Date.parse(app.minDate.replace(/-/g,"/")))){
            		var dayCount = parseInt((Math.abs(new Date() - new Date(Date.parse(app.minDate.replace(/-/g,"/")))))/1000/60/60/24)+1;
	            	if(confirm("根据系统设置要求,超过距离当前日期"+dayCount+"天的工时删除后无法新增，确认要删除？(最小填报日期："+app.minDate.substr(0,10)+')')){
	            	}else{
	            		return;
	            	}
	            }
            }
            if(confirm("确认删除该工时？")){
	            var json = {laborDetailId:app.id[index],labordate:app.da[index]};
	            $.ajax({
	                type:'get',
	                data:json,
	                async:false,
	                url:'com.primeton.eos.ame_common.wx_worktime.wxWorTimeDelete.biz.ext',
	                success:function(o){
	                    if(o.result == 0){
	                        $('.modal').fadeOut();
	                        //重新获取列表信息
	                        app.dataa(app.startdate,app.enddate);
	                    } else {
	                        $('.modal').fadeOut();
	                        alert('删除失败！');
	                    } 
	                }
	            })
            }
        }
        //取消按钮隐藏modal框 
         $('.modal').on('touchstart',function(){
             $('.modal').fadeOut();
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
	            sendData: {startdate:app.startdate,enddate:app.enddate},
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