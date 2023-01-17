<%@page pageEncoding="UTF-8"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%@page import="com.eos.data.datacontext.UserObject"%>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2017-08-28 13:58:11
  - Description:
-->
<head>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/ame_common/css/main.css" />
<title>工时确认</title>
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	* {margin:0;padding:0;/* 禁用浏览器长按默认样式 */-webkit-box-sizing: border-box;-moz-box-sizing: border-box;box-sizing: border-box;-webkit-tap-highlight-color: transparent;outline: none;}
    *:not(input,textarea) { -webkit-touch-callout: none; -webkit-user-select: none; }
    [v-cloak]{display: none !important;}
     .nav{padding:0.7rem 0;box-shadow:0px 2px 2px gray;display: flex;align-items: center;justify-content: space-around;height:10%;font-size:4rem;}
        
    .dataList{width:95%;padding: 4% 2.5%;margin-top: 0.5rem;list-style-type: none;margin-left: 2.5%;}
    .dataList li {padding:1rem;margin-top:1rem;background: #F5FFFA;border-radius:2%;box-shadow: 0px 0px 1px gray;}
    .dataList li p {margin-top:0.5rem;line-height:200%;text-align:left;font-size:3rem;}.hours{float:right;font-size:3rem;}.extra{float:right;font-size:3rem;}
    
    .submit{padding:0 2.5%;box-shadow:0px 0px 0px gray;text-align: center;width:95%;height:7rem;line-height:5rem;bottom:0;position: fixed;margin-left: 2.5%;}
    .tijiao{background: #00BFF0;width:100%;padding: 1rem 2.5%;font-size: 2.5rem;margin-top: 0.5rem;font-size:4rem;line-height:5rem;}
</style>
</head>
<body style="background:url(/default/common/wechat/img/bg.jpg);  background-repeat:no-repeat;background-size:100% 100%; background-attachment:fixed;">
<div id="confirm">
	<div class="nav" >
        <div v-cloak class="data">
            <div v-cloak id="demo1">工时信息</div>
        </div>
    </div>
	<div class="dataList">
		<li>
			<p v-cloak>填报人：<span v-cloak>{{ empname }}</span></p>
			<p v-cloak>填报日期：<span v-cloak>{{ laborDate }}</span></p>
			<p v-cloak>总工时：<span v-cloak>{{ actHours }}</span>小时</p>
			<p v-cloak>项目：<span v-cloak>{{ projectName }}</span></p>
            <p v-cloak>所属客户：<span v-cloak>{{ custname }}</span></p>
            <p v-cloak>工作内容：<span v-cloak>{{ repContent }}</span></p>
		</li>
		<li v-if="feedback==0" style="height:30%;">
			<p>请输入你对工时的疑问：</p>
            <p v-cloak  style="height:100%;">
            	<%--<span v-cloak style="display:inline-block;text-align:left;width:30% ;height:8%;float:left;margin-top:2px;" >疑问信息：</span>--%>
                <textarea v-model="benefconfq" cols=40 rows=5 style="width:100% ;height:75%;border-color:#ADADAD;text-align:left;font-size: 3rem;resize:none;padding: 0.5rem;"></textarea>
            </p>
		</li>
	</div>
	<div v-cloak class="submit" v-show="bolen">
		<div v-cloak class="tijiao">
            <div v-cloak v-if="feedback==0" @click="submit()">疑问提交</div>
            <div v-cloak v-if="feedback==1" @click="submit()">确认提交</div>
        </div>
	</div>
</div>
</body>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/jquery-latest.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/p-pull-refresh.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/touche.js"></script>
<script type="text/javascript" src="<%= request.getContextPath() %>/ame_common/js/vue.min.js"></script>
<script type="text/javascript">
	
	function GetQueryString(name)
	{
	     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	     var r = window.location.search.substr(1).match(reg);
	     if(r!=null)return  unescape(r[2]); return null;
	}
	
	function close(){
		WeixinJSBridge.invoke('closeWindow');
	}
	
 	var deviceH=document.documentElement.clientHeight+"px";
    //表单获得焦点后动态改变body和背景图片的大小
    $('textarea').on("click",function(){
        $("body").attr("style","background:url(/default/common/wechat/img/bg.jpg);  background-repeat:no-repeat; background-attachment:fixed;width:100%;height:"+deviceH+";background-size: 100%"+deviceH);
    });
    
	
	
	/* vue 实例 */
	var confirm =  new  Vue({
		el:'#confirm',
		data:{
			empname:'',
			laborDate:'',
			actHours:0.0,
			projectName:'',
			custname:'',
			repContent:'',
			laborDetailId:null,
			feedback:'',
			benefconfq:'',
			message:'',
			bolen:true,
			status:'',
		},
		ready:function(){
			this.laborDetailId = GetQueryString("laborDetailId");
			this.feedback = GetQueryString("feedback");
			if(this.laborDetailId != null && this.laborDetailId !=''){
				this.init(this.laborDetailId);
			}
			if(this.feedback=='0'){
                document.title = '工时疑问';
			}else if(this.feedback=='1'){
                document.title = '工时确认';
			}
			if(this.message != '' &&　this.message != null){
				window.self.location='alertpage.jsp?message='+this.message;
			}
			if(this.feedback=='0' && this.status == '1'){
				window.self.location='alertpage.jsp?message='+'confirmed';
			}
			if(this.feedback=='1' && this.status == '1'){
				window.self.location='alertpage.jsp?message='+'sales';
			}
	 	},
	 	methods:{
	 		init:function(laborDetailId){
	 			<%
	                String userid = "";
	                UserObject user = (UserObject) request.getSession().getAttribute("userObject");
               		userid = user.getUserId(); 
	            %>
	            var userid= "<%=userid %>";
	 		    var empname_timly='';
	 		    var laborDate_timly='';
	 		    var actHours_timly='';
	 		    var projectName_timly='';
	 		    var custname_timly='';
	 		    var repContent_timly='';
	 		    var benefconfq_timly='';
	 		    var salesid='';
	 		    var message_timly='';
	 		    var status='';
	 		    var manager='';
	 			var json = {laborDetailId:laborDetailId};
	 			$.ajax({
	                type:'get',
	                data:json,
	                async:false,
	                url:'com.primeton.eos.ame_common.wx_worktime.getLaborConfirm.biz.ext',
	                success:function(result){
		                if(result.rdLabor.length>0){
		                	empname_timly=result.rdLabor[0].empname;
		                	laborDate_timly=result.rdLabor[0].laborDate;
		                	actHours_timly=result.rdLabor[0].actHours;
		                	projectName_timly=result.rdLabor[0].projectName;
		                	custname_timly=result.rdLabor[0].custname;
		                	repContent_timly=result.rdLabor[0].repContent;
		                	benefconfq_timly=result.rdLabor[0].benefconfq;
		                	salesid=result.rdLabor[0].benefitid;
		                	manager=result.rdLabor[0].manager;
		                	status=result.rdLabor[0].status;
		                	if(salesid != userid && manager != userid){
		                		message_timly="change";
		                	}
		                	if (status=='3'){
		                		message_timly="pmo";
		                	}else if(status=='4'){
		                		message_timly="fin";
		                	}
		                }else{
		                	message_timly="delete";
		                }
	                }
	            })
	            if(empname_timly!='' && empname_timly != null){
	            	this.empname=empname_timly;
		            this.laborDate=laborDate_timly;
		            this.actHours=actHours_timly;
		            this.projectName=projectName_timly;
		            this.custname=custname_timly;
		            this.repContent=repContent_timly;
		            this.benefconfq=benefconfq_timly;
		            this.status = status;
	            }
	            this.message=message_timly
	 		},
	 		submit:function(){
	 			var _self = this;
	 			var json=null;
	 			if(this.feedback=='0'){
	 				if(this.benefconfq=='' || this.benefconfq ==null){
	 					alert("请填写疑问信息！");
	 					return;
	 				}else{
	 					json=({"updateEntities": 
                                    [{
                                    "laborDetailId":this.laborDetailId,
                                    "status":2,
                                    "benefconfq":this.benefconfq
                                    }],"style":"syr"});
                    }
	 			}else if (this.feedback=='1'){
 					json=({"updateEntities": 
                                    [{
                                    "laborDetailId":this.laborDetailId,
                                    "status":1
                                    }],"style":"syr"});
	 			}
	 			_self.bolen = false;
	 			nui.ajax({
                    type:'get',
                    data:json,
                    cache: false,
                    showModal: false,
                    contentType: 'text/json',
                    url:'com.primeton.eos.ame_common.wx_worktime.changeLaborStatus.biz.ext',
                    success:function(result){
                        if(result.exception == null){
                            alert("提交成功");
							this.bolen= true;
							close();
                        }else{
                            alert("提交失败！请联系信息技术部人员。");
                            this.bolen= true;
							close();
                        }
                        
                    },
                    error:function(jqXHR, textStatus, errorThrown){
                        nui.alert("error:" + jqXHR.responseText);
                    }
                })
	 		},
	 	}
	});
	
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