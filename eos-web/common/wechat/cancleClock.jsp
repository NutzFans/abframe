<%@page import="com.eos.runtime.core.TraceLoggerFactory"%>
<%@page import="com.eos.system.logging.Logger"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<!-- 
  - Author(s): devil_sh
  - Date: 2017-01-10 16:15:30
  - Description:
-->
<head>
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=yes">
<title>取消考勤</title>
<link rel="stylesheet" href="../weui.css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
</head>
<%
	Logger log = TraceLoggerFactory.getLogger(this.getClass());
	String signID = request.getParameter("signID");
	//上下班
	String type = request.getParameter("type");
	log.info("signID:"+signID+",type="+type);
 %>
<body>
	<div class="js_dialog" id="iosDialog1">
            <div class="weui-mask"></div>
            <div class="weui-dialog">
                <div class="weui-dialog__hd"><strong class="weui-dialog__title">取消考勤</strong></div>
                <div class="weui-dialog__bd">
                	<div id="signInfo"></div>
                	<div id="reasonDiv">
                		<input id="reason" class="weui-input" placeholder="取消理由" style="border:1px solid #D9D9D9"/>
                	</div>
                </div>
                <div class="weui-dialog__ft">
                    <a href="javascript:close();" class="weui-dialog__btn weui-dialog__btn_default">关闭</a>
                    <a href="javascript:cancel();" class="weui-dialog__btn weui-dialog__btn_primary">确认</a>
                </div>
            </div>
    </div>
</body>

<script type="text/javascript">
    var signID=<%=signID %>;
    var type=<%=type %>;
    initSignDetail();
    //关闭微信浏览器
	function close(){
		WeixinJSBridge.invoke('closeWindow');
	}
	
	function initSignDetail(){
		var datas ={signID:signID,type:type};
		$.ajax({
    	        type:"POST",
	            url: "com.primeton.eos.ame_common.weChatPlatform.getSignDetailBySignID.biz.ext",
	            dataType: 'json',
	            data: datas,
	            contentType : "application/x-www-form-urlencoded",
	            cache: false,
	            success: function (text) {
	            	var status = text.status;
	            	if(status=='SUCC'){
		            	var info = text.signInfo;
		            	$("#signInfo").append(info);
	            	}else{
	            		$("#iosDialog1").hide();
	            		alert("该次考勤已经被取消，请确认!");
	            		close();
	            	}
	            	
	            }
		 }); 
	}
	
	//取消签到人的签到
	function cancel(){
		var reason = $("#reason").val();
	    var datas ={signID:signID,reason:reason,ctype:type}
		$.ajax({
    	        type:"POST",
	            url: "com.primeton.eos.ame_common.weChatPlatform.cancleClockNew.biz.ext",
	            dataType: 'json',
	            data: datas,
	            contentType : "application/x-www-form-urlencoded",
	            cache: false,
	            success: function (text) {
	            	var type = text.type;
	            	if(type=='1'){
	            		alert("取消签到操作成功");
	            	}else{
	            		alert("取消签退操作成功");
	            	}
	            	//关闭当前页面
	             	close();
	            },
	            error: function (msg) {
                	alert(msg);
            	}
		 });  
	}

</script>
</html>