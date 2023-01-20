<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 
  - Author(s): shihao
  - Date: 2017-02-20 10:28:23
  - Description:考勤详情展示
-->
	<head>
		<title>考勤详情</title>
		<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Alf18LnqUV9YwnpInPsGBitfH42dpRj9"></script>
		<style type="text/css">
			body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";font-size:12px;}
			#allmap{width:520px;height:250px;}
	</style>
	</head>
<body>
		<div id="form1">
				<table style="table-layout:fixed;" id="table_file1">
					<tr>
						<td align="right" style="width:120px">考勤人员:</td>
						<td ><input name="detail.OUTPERNAME" id="OUTPERNAME"  class="nui-textbox" style="width:170px" readonly="readonly"/></td>	
						<td align="right" style="width:120px">供应商简称:</td>
						<td ><input name="detail.SUPPLIERSNAME" id="SUPPLIERSNAME"  class="nui-textbox" style="width:170px" readonly="readonly"/></td>	
					</tr>
					<tr>
						<td align="right" style="width:120px">考勤日期:</td>
						<td>
							<input name="detail.SIGNDATE" id="SIGNDATE" class="nui-textbox" dateFormat="yyyy-MM-dd" style="width:170px" readonly="readonly"/>
						</td>
						<td align="right" style="width:120px">客户(简称):</td>
						<td><input name="detail.CUSTJC" id="CUSTJC" class="nui-textbox" style="width:170px" readonly="readonly"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">项目:</td>
						<td><input name="detail.PROJECT_NAME" id="PROJECT_NAME" class="nui-textbox" style="width:170px" readonly="readonly"/></td>
						<td align="right" style="width:120px">项目编号:</td>
						<td><input name="detail.PROJECT_NO" id="PROJECT_NO" class="nui-textbox"  style="width:170px" readonly="readonly"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">汇报对象:</td>
						<td><input name="adetail.MANAGERNAME" id="MANAGERNAME" class="nui-textbox" readonly="readonly"/></td>
						<td align="right" style="width:120px">受益部门:</td>
						<td><input name="detail.ORGNAME" id="ORGNAME" class="nui-textbox" style="width:170px" readonly="readonly"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">考勤时点:</td>
						<td><input name="detail.RULEDETAIL" id="RULEDETAIL" class="nui-textbox"  style="width:170px" readonly="readonly"/></td>
						<td align="right" style="width:120px">地图类型:</td>
						<td>
							<input  id="SIGNINTIME" class="nui-textbox" value="百度地图" style="width:170px" readonly="readonly"/>
						</td>
					</tr>
					<tr>
						<td align="right" style="width:120px">签到时间:</td>
						<td><input name="detail.SIGNINTIME" id="SIGNINTIME" class="nui-textbox" style="width:170px" readonly="readonly"/></td>
						<td align="right" style="width:120px">签退时间:</td>
						<td><input name="detail.SIGNOUTTIME" id="SIGNOUTTIME" class="nui-textbox" style="width:170px" readonly="readonly"/></td>
					</tr>
					
					<tr>
						<td align="right" style="width:120px">签到地点:</td>
						<td><input name="adetail.SIGNINLOCATION" id="SIGNINLOCATION" class="nui-textarea" style="width:170px" readonly="readonly"/></td>
						<td align="right" style="width:120px">签退地点:</td>
						<td><input name="adetail.SIGNOUTLOCATION" id="SIGNOUTLOCATION" class="nui-textarea" style="width:170px" readonly="readonly"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">签到距离(米):</td>
						<td><input name="adetail.SIGNINDISTANCE" id="SIGNINDISTANCE"  class="nui-textbox" style="width:170px" readonly="readonly"/></td>
						<td align="right" style="width:120px">签退距离(米):</td>
						<td><input name="adetail.SIGNOUTDISTANCE" id="SIGNOUTDISTANCE" class="nui-textbox" style="width:170px" readonly="readonly"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">是否迟到:</td>
						<td><input name="adetail.SIGNINFLAG" id="SIGNINFLAG"  class="nui-textbox" style="width:170px" readonly="readonly"/></td>
						<td align="right" style="width:120px">是否早退:</td>
						<td><input name="adetail.SIGNOUTFLAG" id="SIGNOUTFLAG" class="nui-textbox" style="width:170px" readonly="readonly"/></td>
					</tr>
					<tr>
						<td align="right" style="width:120px">签到备注:</td>
						<td><input name="adetail.SIGNINREMARK" id="SIGNINREMARK" class="nui-textarea" style="width:150px" readonly="readonly"/><a class="nui-button" id="addBtn1" onclick="add('1')">修改</a></td>
						<td align="right" style="width:120px">签退备注:</td>
						<td><input name="adetail.SIGNOUTREMARK" id="SIGNOUTREMARK" class="nui-textarea" style="width:150px" readonly="readonly"/><a class="nui-button" id="addBtn2" onclick="add('2')">修改</a></td>
						
					</tr>
					<tr>
					<td align="center" colspan="4"></td>
					</tr>
					<tr>
					  <td colspan="4"> 
					 	<div id="allmap" style="margin-left:70px;">
					
						</div>
					  </td>
					</tr>
					
				</table>
				
		</div>
</body>

<script type="text/javascript">
   nui.parse();
   
   var form = new nui.Form("#form1");
    var map = new BMap.Map("allmap");
    var geoc = new BMap.Geocoder(); 
    //地图转换
    var convertor = new BMap.Convertor();
    //定义成全局变量便于在添加备注信息时传递参数
    var SIGNINID = "" ;
    var SIGNOUTID = "" ;
    var SIGNINREMARK = "";
    var SIGNOUTREMARK ="";
   	map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
	map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用 
	//需要转换的GPS地点
	
   function SetData(detail){
        SIGNINID = detail.signid ;
        SIGNOUTID = detail.signid ;
        var inTime = detail.intime;
        var outTime = detail.outtime;
        if(inTime == null || inTime == ""){
        	nui.get("addBtn1").disable();
        }
        if(outTime == null || outTime == ""){
        	nui.get("addBtn2").disable();
        }
        var SIGNINLONGITUDE = detail.inlongitude ;
		var SIGNOUTLONGITUDE= detail.outlongitude;
		var SIGNINLATITUDE  = detail.inlatitude  ;
		var SIGNOUTLATITUDE = detail.outlatitude ;
		
		SIGNINREMARK    = detail.inremark    ;
		
		nui.get("SIGNINREMARK").setValue(SIGNINREMARK);
		SIGNOUTREMARK   = detail.outremark   ;
		
		nui.get("SIGNOUTREMARK").setValue(SIGNOUTREMARK);
		var SIGNDATE	    = detail.signdate	     ;
		
		nui.get("SIGNDATE").setValue(SIGNDATE);
		var OUTPERNAME      = detail.outpername      ;
		
		nui.get("OUTPERNAME").setValue(OUTPERNAME);
		var CUSTJC          = detail.custjc          ;
		
		nui.get("CUSTJC").setValue(CUSTJC);
		var PROJECT_NAME    = detail.projectName    ;
		
		nui.get("PROJECT_NAME").setValue(PROJECT_NAME);
		var PROJECT_NO      = detail.projectno      ;
		
		nui.get("PROJECT_NO").setValue(PROJECT_NO);
		var SUPPLIERSNAME   = detail.suppliersname   ;
		
		nui.get("SUPPLIERSNAME").setValue(SUPPLIERSNAME);
		var ORGNAME         = detail.orgname         ;
		
		nui.get("ORGNAME").setValue(ORGNAME);
		var MANAGERNAME     = detail.managername     ;
		
		nui.get("MANAGERNAME").setValue(MANAGERNAME);
		var RULEDETAIL      = detail.ruledetail      ;
		
		nui.get("RULEDETAIL").setValue(RULEDETAIL);
		var SIGNINTIME      = detail.intime      ;
		
		nui.get("SIGNINTIME").setValue(SIGNINTIME);
		var SIGNINFLAG      = detail.inflag      ;
		
		nui.get("SIGNINFLAG").setValue(SIGNINFLAG);
		var SIGNINLOCATION  = detail.inlocation  ;
		
		nui.get("SIGNINLOCATION").setValue(SIGNINLOCATION);
		var SIGNOUTTIME     = detail.outtime     ;
		
		nui.get("SIGNOUTTIME").setValue(SIGNOUTTIME);
		var SIGNOUTFLAG     = detail.outflag     ;
		
		nui.get("SIGNOUTFLAG").setValue(SIGNOUTFLAG);
		var SIGNOUTLOCATION = detail.outlocation ;
		nui.get("SIGNOUTLOCATION").setValue(SIGNOUTLOCATION);
		//
		if(inTime){
			changePoint(SIGNINLONGITUDE,SIGNINLATITUDE,"1");
		}
		if(outTime){
			changePoint(SIGNOUTLONGITUDE,SIGNOUTLATITUDE,"2");
		}
		//签退地点与考勤地点的距离
		var outDistance = detail.outdistance;
		if(outDistance){
		   var distance = parseInt(outDistance);
			nui.get("SIGNOUTDISTANCE").setValue(distance);
		}
		//签到地点与考勤地点的距离
		var inDistance = detail.indistance;
		if(inDistance){
			var distance = parseInt(inDistance);
			nui.get("SIGNINDISTANCE").setValue(distance);
		}
		//设置(项目组上班地点/考勤规则固定地点)的定位
		var LONGITUDE = detail.longitude;
		if(LONGITUDE){
			var LATITUDE = detail.latitude;
			if(LATITUDE){
				//在地图上设置标注
				standardPoint(LONGITUDE,LATITUDE);
			}
		}
   }
   
   //直接对考勤地点，增加标注。
   function standardPoint(longitude,latitude){
   		var point = new BMap.Point(longitude,latitude); 
 		var marker = new BMap.Marker(point);
        map.addOverlay(marker);
        var label = new BMap.Label("考勤地点",{offset:new BMap.Size(-52,-10)});
        marker.setLabel(label);
   }
   
   //转换GPS定位之后，增加标注
   function changePoint(longitude,latitude,type){
   		var datas ={longitude:longitude,latitude:latitude};
   		$.ajax({
    	        type:"POST",
	            url: "com.primeton.eos.ame_common.ameAttendance.getBMapByGPS.biz.ext",
	            dataType: 'json',
	            data: datas,
	            contentType : "application/x-www-form-urlencoded",
	            cache: false,
	            success: function (text) {
	                //获取当前地址
	             	var longitude_Bmap = text.longitude_Bmap;
	             	var latitude_Bmap = text.latitude_Bmap;
	             	
	             	if(longitude_Bmap){
	             		var point = new BMap.Point(longitude_Bmap,latitude_Bmap); 
	             		var marker = new BMap.Marker(point);
				        map.addOverlay(marker);
				        var label = null;
				        if(type==1){
				        	label = new BMap.Label("签到",{offset:new BMap.Size(20,-10)});
				        }else{
				        	label = new BMap.Label("签退",{offset:new BMap.Size(-25,20)});
				        }
				        marker.setLabel(label);
				        map.centerAndZoom(point,18);
	             	}
	            }
		 }); 
   
   }
   function add(e){
     nui.open({
       url: "<%=request.getContextPath() %>/ame_common/attendance/attRemark.jsp",
       title: "新增信息", width: 400, height: 220,
       onload: function () {
         var iframe = this.getIFrameEl();
         var data = { signinid: SIGNINID,signoutid : SIGNOUTID ,SIGNINREMARK:SIGNINREMARK,SIGNOUTREMARK:SIGNOUTREMARK,remarktype:e};
         iframe.contentWindow.SetData(data);
       },
       ondestroy: function (action) {
         if(action = "saveSuccess"){
           var iframe = this.getIFrameEl();
           var data = iframe.contentWindow.GetData();
           data = nui.clone(data);
           if(data.remarktype == "1"){
             nui.get("SIGNINREMARK").setValue(data.remark);
           }else{
           	 nui.get("SIGNOUTREMARK").setValue(data.remark);
           }
       	 }
       }
     });
   }
   function onCancel(){
   		CloseWindow("cancel");
   }
   
   function CloseWindow(action) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}

</script>
</html>