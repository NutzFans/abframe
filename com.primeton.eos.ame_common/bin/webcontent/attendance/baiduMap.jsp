<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">

		
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";font-size:12px;}
		#allmap{width:700px;height:300px;}
		p{margin-left:5px; font-size:12px;}
	</style>
	<script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=Alf18LnqUV9YwnpInPsGBitfH42dpRj9"></script>
	
	
	
	<title>百度地图</title>
</head>
<body>
	<div id="r-result">请输入要查找的位置：<input type="text" id="suggestId" size="30" style="width:200px;" /></div>
	<div id="searchResultPanel" style="border:1px solid #C0C0C0;width:150px;height:auto; display:none;"></div>
	<div id="allmap"></div>
	<p>点击地图后显示当前经纬度</p>
	<form id ="form1" method="post">
		<table>
			<tr>
				<td>经度：</td>
				<td><input type="text" id="longitude" size="20"  style="width:150px;" /></td>
				<td>纬度：</td>
				<td><input type="text" id="latitude" size="20" style="width:150px;" /></td>
				<td>
					<input  type="button" value="确定" onclick="onOk('ok')" id="s1"/>
				</td>
				<td>
					<input id="btnClose" type="button" value="取消" onClick="onOk('cancle')" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<script type="text/javascript">
	
	function onOk(e) {
		//点击确定带出数据
		if(e=="ok"){
			var suggestId = document.getElementById('suggestId').value;
			if(suggestId.length>100){
				alert("目标位置过长，请重新确认！");
				return;
			}else{
				window.returnValue = GetData();
			}
		}
        CloseWindow(e);
	}		
	
	function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	
	function GetData(){
	  var suggestId = document.getElementById('suggestId').value;
	  var longitude = document.getElementById('longitude').value;
	  var latitude = document.getElementById("latitude").value;
	  var json ={longitude:longitude,latitude:latitude,suggestId:suggestId};
	  return json;
	}
	
	/* function selectRecord()
      {
        var g = $id("group1");
        if (g.getSelectRow() == null) {
          alert("请选择一行记录");
          return;
        }
        var ret = new Array;
        ret[0] = g.getParam("custid");
        ret[1] = g.getParam("custname");
        window.returnValue = ret;
        window.close();
      } */
	// 位置搜索
	function G(id) {
		return document.getElementById(id);
	}
	
	
	var map = new BMap.Map("allmap");
	//百度地图的比例尺
	var top_left_control = new BMap.ScaleControl({anchor: BMAP_ANCHOR_TOP_LEFT});// 左上角，添加比例尺
	var top_left_navigation = new BMap.NavigationControl();  //左上角，添加默认缩放平移控件
	var top_right_navigation = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_RIGHT, type: BMAP_NAVIGATION_CONTROL_SMALL});
	map.addControl(top_left_control);        
	map.addControl(top_left_navigation);     
	map.addControl(top_right_navigation);
	//项目信息管理Hweb页面进来js
	var suggestId = '<%=request.getParameter("suggestId") %>';
	var longitude = '<%=request.getParameter("longitude") %>';
	var latitude = '<%=request.getParameter("latitude") %>';
	var state = '<%=request.getParameter("state") %>';
	if(state=='1'){
		document.getElementById("suggestId").readOnly=true;
		document.getElementById("longitude").readOnly=true;
		document.getElementById("latitude").readOnly=true;
		document.getElementById("s1").disabled = "disabled";
	}
	function init(){
		if(!(suggestId=="null" || longitude=="null" || latitude=="null")){
			var data = {suggestId:suggestId,longitude:longitude,latitude:latitude};
			SetData(data);
		}
	}
	setTimeout(init,100);
	var geoc = new BMap.Geocoder(); 
	//如果
	var point;
	function SetData(data){
    	var longitude = data.longitude;
    	//三个参数必须是一起传进来的（要么都没有，要么都有值）
    	if(!longitude){
    		longitude = 121.588639;
    	}
    	var latitude = data.latitude;
    	if(!latitude){
    		latitude = 31.21025;
    	}
    	var suggestId = data.suggestId;
    	if(!suggestId){
    		suggestId = "上海市浦东新区普元信息技术股份有限公司上海公司";
    	}
		document.getElementById('suggestId').value = suggestId;
    	document.getElementById('longitude').value = longitude;
		document.getElementById('latitude').value = latitude;
		point = new BMap.Point(longitude,latitude);
		//增加标注
		var mark = new BMap.Marker(point);
		map.addOverlay(mark);
		map.panTo(point);
		map.centerAndZoom(point,18); 
	}
	
	//加载完毕事件
	//为了解决中心点偏移的问题,只有第一次初始化的时候，设置为中心点
	var times =1;
	map.addEventListener("tilesloaded",function(){
	   if(times==1){
			map.centerAndZoom(point,18); 
		}
		 times = times+1;
     });  
	
	var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
		{"input" : "suggestId"
		,"location" : map
	});
	 
	ac.addEventListener("onhighlight", function(e) {  //鼠标放在下拉列表上的事件
		var str = "";
		var _value = e.fromitem.value;
		var value = "";
		if (e.fromitem.index > -1) {
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str = "FromItem<br />index = " + e.fromitem.index + "<br />value = " + value;
		
		value = "";
		if (e.toitem.index > -1) {
			_value = e.toitem.value;
			value = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		}    
		str += "<br />ToItem<br />index = " + e.toitem.index + "<br />value = " + value;
		G("searchResultPanel").innerHTML = str;
		
	});
	
	var myValue;
	ac.addEventListener("onconfirm", function(e) {    //鼠标点击下拉列表后的事件
		var _value = e.item.value;
		myValue = _value.province +  _value.city +  _value.district +  _value.street +  _value.business;
		G("searchResultPanel").innerHTML ="onconfirm<br />index = " + e.item.index + "<br />myValue = " + myValue;
		setPlace();
		
	});

	function setPlace(){
		map.clearOverlays();    //清除地图上所有覆盖物
		function myFun(){
			var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
			map.centerAndZoom(pp, 18);
			map.addOverlay(new BMap.Marker(pp));    //添加标注
			var lng = pp.lng;
			var lat = pp.lat;
			document.getElementById('longitude').value = lng;
		    document.getElementById('latitude').value = lat;
		}
		var local = new BMap.LocalSearch(map, { //智能搜索
		  onSearchComplete: myFun
		});
		local.search(myValue);
	}
	
	//显示地址信息
	function showInfo(e){
	    //去掉之前的标注
		map.clearOverlays();
	   //获取地址
		var pt = e.point;
		geoc.getLocation(pt, function(rs){
			//获取地址
		    var address = rs.address;
		    document.getElementById('suggestId').value =address;
		    //把当前点击的地点设置成标注.
			var mark = new BMap.Marker(pt);
			map.addOverlay(mark);
			map.panTo(pt);
			//var addComp = rs.addressComponents;
			//alert(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);
		});
		//设置经纬度
		document.getElementById('longitude').value = e.point.lng;
		document.getElementById('latitude').value = e.point.lat;
	}
	//鼠标单击监听
	map.addEventListener("click", showInfo);

/* 	
	//浏览器定位
	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			//alert('您的位置：'+r.point.lng+','+r.point.lat);
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true})
	 */
              
	map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用 
</script>
