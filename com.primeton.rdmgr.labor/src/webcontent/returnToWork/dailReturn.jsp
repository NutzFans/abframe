<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="com.eos.foundation.eoscommon.BusinessDictUtil"%>
<%@page import="com.primeton.eos.ame_common.JsAPIUtil"%>
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="com.primeton.eos.ame_common.WeChatUtil"%>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2020-03-05 18:07:50
  - Description:
-->
<% 
	String code = request.getParameter("code");
	String appId = "";
	String nonceStr = "";
	String timestamp = "";
	String signature = ""; 
	String userID ="";
	UserObject user = (UserObject)request.getSession().getAttribute("userObject");
	userID = user.getUserId();
	if(code==null){
		request.getAttribute("");
	}else{
		//由于已经登录过，code已经被使用过一次，所以，拿不到用户名
		//String userID = WeChatUtil.getUserInfo(code);
		if(userID!=null && !userID.equals("FAIL") && !userID.equals("TOKEN_FAIL")){
	    	//必不可少，不然签名失败。
	    	String qs = request.getQueryString();
	    	String s = BusinessDictUtil.getDictName("AME_SYSCONF", "AMEPATH");
	    	String url = s+"labor/returnToWork/dailReturn.jsp";
	    	if(qs!=null && !qs.equals("")){
	    		url = url+"?"+qs;
	    	}
		    //签名
		    Map<String, String> map = JsAPIUtil.sign(url);
		    appId = BusinessDictUtil.getDictName("AME_WE_CHAT", "CORP_ID");
		    nonceStr = map.get("nonceStr");
		    timestamp = map.get("timestamp");
		    signature = map.get("signature"); 
	    }
	}
%>
<head>
<title>复工情况填报</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0">
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="js/moment.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script type="text/javascript" src="js/clock.js"></script>
<style type="text/css">
	body{background:#EBEBEB;}
	.con{width: 100%;margin: 50px auto auto;}
</style>
</head>
<body class="con">
	<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
		<input name="retrunWork.userid" id="userid" class="nui-hidden"/>
		<input name="retrunWork.inlongitude" id="inlongitude" class="nui-hidden"/>
		<input name="retrunWork.inlatitude" id="inlatitude" class="nui-hidden"/>
		<input name="retrunWork.inlocation" id="inlocation" class="nui-hidden"/>
		<table style="width:100%;border-collapse:separate; border-spacing:0px 20px;">
			<tr>
				<td align="right" width="100px"><span>报工日期：</span></td>
            	<td align="left" nowrap="nowrap" width="180px">
				  	<input class="nui-datepicker" id="returndate" name="retrunWork.returndate" style="width:210px" required="true"  allowInput="false" ondrawdate="onDrawDate" onValuechanged="changeDate"/>
				</td>
			</tr>
			<tr>
				<td align="right" width="100px"><span>复工状态：</span></td>
            	<td align="left" nowrap="nowrap" width="180px">
				  	<input class="nui-dictcombobox" dictTypeId="AME_FGZT" id="retrunstatus" name="retrunWork.retrunstatus" style="width:210px" required="true"/>
				</td>
			</tr>
			<tr>
				<td align="right" width="100px"><span>当日所在省市：</span></td>
            	<td align="left" nowrap="nowrap" width="180px">
            		<input name="retrunWork.returnprovince" class="nui-dictcombobox" dictTypeId="AME_PROVINCE" id="returnprovince" required="true" width="100px" onvaluechanged="getCity" allowInput="none"/>-
				  	<input name="retrunWork.returncity" id="returncity" valueField="dictid" textField="dictname" class="nui-combobox" required="true" width="100px" allowInput="none"/>
				</td>
			</tr>
			<tr>
				<td align="right" width="100px"><span>其他说明：</span></td>
            	<td align="left" nowrap="nowrap" width="180px">
				  	<input class="nui-textarea" id="remark" name="retrunWork.remark" style="width:210px" required="false"/>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<a class="nui-button" onclick="onOk()" id="creatReimbProcess" style="width: 80px;margin-right: 20px;">上报</a>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<span style="color: red" id="noregist"></span>
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript">
	var oHeight = $(document).height(); //浏览器当前的高度
   
   $(window).resize(function(){
        if($(document).height() < oHeight){
         
        $("body").css("position","static");
    }else{
         
        $("body").css("position","absolute");
    }
        
   });

	nui.parse();
	var form1 = new nui.Form("form1");

	//级联省市
    function getCity(){
		var province = nui.get("returnprovince").getValue();
		if(province == null || province == ""){
			nui.get("returncity").setData(null);
		}else{
			var json = nui.encode({"dictid":province});
			nui.ajax({
        		url: "com.primeton.eos.ame_tax.business.getCity.biz.ext",
        		data: json,
        		type: 'POST',
    			cache: false,
    			contentType: 'text/json',
    			success: function(text){
    				nui.get("returncity").setData(text.data);
    			},
    			error: function(jqXHR, textStatus, errorThrown){
    			}
        	});
		}
	}
	
	//微信JSAPI
	 var longitude = null; 
     var latitude = null;
     var address = null;
	 wx.config({
		    debug: false, 
		    appId: '<%=appId %>', 
		    timestamp: '<%=timestamp %>', 
		    nonceStr: '<%=nonceStr %>', 
		    signature: '<%=signature %>',
		    jsApiList: ['getLocation'] 
	 }); 
	  
	 wx.ready(function () {    
       wx.getLocation({
			    success: function (res) {
			       longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
			       latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
			       nui.get("inlongitude").setValue(longitude);
			       nui.get("inlatitude").setValue(latitude);
			       var speed = res.speed; // 速度，以米/每秒计,暂时没用
			       var accuracy = res.accuracy; // 位置精度
			       getLocation(longitude,latitude);
			    },
			    cancel: function (res) {
			        alert('用户拒绝授权获取地理位置');
			    },
			   fail: function (res) {
			        alert(JSON.stringify(res));
			   }
		}); 
		
     }); 
     
     //根据经度，纬度获取地理位置
     function getLocation(longitude,latitude){
     	var datas = {longitude:longitude,latitude:latitude};
     	$.ajax({
    	        type:"POST",
	            url: "com.primeton.eos.ame_common.ameAttendance.getLocationByGPS.biz.ext",
	            dataType: 'json',
	            data: datas,
	            contentType : "application/x-www-form-urlencoded",
	            cache: false,
	            success: function (text) {
	                //获取当前地址
	             	var location = text.location;
	             	if(location){
	             		//先判断是否有签到/签退信息
	             		address = location;
			       		nui.get("inlocation").setValue(address);
	             	}
	            }
		 });  
     }
	
	//初始化
	init();
	function init(){
		 nui.ajax({
            type:'get',
            data:"",
            async:false,
            url:'com.primeton.rdmgr.labor.returnToWork.getReturnworkDetail.biz.ext',
            success:function(result){
                form1.setData(result);
                getCity();
                if(result.retrunWork.confirmstatus == '1' || result.retrunWork.confirmstatus == '2' ){
                	alert("时间"+result.retrunWork.returndate+"的复工日报已被确认，无法再次上报！");
                }
            }
        })
	}
	
	//上报
	function onOk(){
		if(!form1.validate()){
			alert("信息录入不完整!");
			return;
		}else{
			var json = form1.getData();
    		nui.confirm("复工情况将微信信息发送给直属主管确认，确定要上报吗？","操作提示",function (action){
			if(action == "ok"){
				nui.get("creatReimbProcess").setEnabled(false);
				form1.loading("处理中,请稍后...");
	    		nui.ajax({
	    			url:"com.primeton.rdmgr.labor.returnToWork.registReturnWork.biz.ext",
	    			data: json,
	    			type:"post",
	    			contentType:"text/json",
	    			success:function(action){
	    				action = nui.clone(action);
	    				form1.unmask();
	    				if(action.exception == '1'){
	    					nui.alert("上报成功！","系统提示",function(){
			    				nui.get("creatReimbProcess").setEnabled(true);
			    				close();
				        	});
	    				}else if(action.exception == '2'){
                			alert("时间"+json.retrunWork.returndate.slice(0,10)+"的复工日报已被确认，无法再次上报！")
		    				nui.get("creatReimbProcess").setEnabled(true);
	    				}else if(action.exception == '3'){
                			alert("时间"+json.retrunWork.returndate.slice(0,10)+"大于当日，无法上报！")
		    				nui.get("creatReimbProcess").setEnabled(true);
	    				}else{
	    					nui.alert("上报失败！请联系信息技术部","系统提示",function (){
			    				nui.get("creatReimbProcess").setEnabled(true);
	    					});
	    				}
	    			},
	    			error:function(jqXHR, teactionatus, errorThrown){
	    				alert("error:" + jqXHR.responseText);
	    			}
	    		});
			}
		});
		}
	}
	
	function close(){
		WeixinJSBridge.invoke('closeWindow');
	}
	
	function onDrawDate(e){
		var date = e.date;
	    var d = new Date();
	    if (date.getTime() > d.getTime()) 
	    {
			e.allowSelect = false;
	    }
	}
	
	function changeDate(){
		var json = {"retrunWork":{"userid":'<%=userID %>',"returndate":nui.get("returndate").getValue()}};
		nui.ajax({
            type:'get',
            data:json,
            async:false,
            url:'com.primeton.rdmgr.labor.returnToWork.getReturnworkDetail.biz.ext',
            success:function(result){
                form1.setData(result);
                getCity();
                if(result.retrunWork.confirmstatus == '1' || result.retrunWork.confirmstatus == '2' ){
                	document.getElementById("noregist").innerHTML = "当日的复工日报已被确认，无法再次上报！";
                	document.getElementById("noregist").style.display='';
    				nui.get("creatReimbProcess").setEnabled(false);
                }else{
                	document.getElementById("noregist").innerHTML = "";
                	document.getElementById("noregist").style.display='none';
                	nui.get("creatReimbProcess").setEnabled(true);
                }
            }
        })
	}
</script>
</html>