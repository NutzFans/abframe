<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): devil_sh
  - Date: 2017-02-07 13:57:02
  - Description:
-->
<head>
	<title>考勤信息查询</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css"> 
		#detail a:link, #detail a:visiteid { 
		color:#FF0000; 
		text-decoration:none; 
		} 
		#detail a:hover, #detail a:active { 
		color:#000000; 
		text-decoration:underline; 
		}
</style>
</head>
<body>
	<div class="nui-panel" title="考勤记录查询" width="100%">
		   <form id="form1" method="post" style="width:100%">
			<div class="nui-toolbar" >
				<table style="width:100%;">
					<tr>
						<td align="right">外包人员：</td>
						<td>
							<input name="criteria._expr[1]._value" class="nui-textbox" style="width:120px;" id="names"/>
						    <input class="nui-hidden" name="criteria._expr[1]._property" value="outpername"/>
						    <input class="nui-hidden" name="criteria._expr[1]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[1]._likeRule" value="all"/>
						</td>
						<td align="right">供应商简称：</td>
						<td>
							<input name="criteria._expr[2]._value" class="nui-textbox" style="width:120px;" id="suppliersName"/>
						    <input class="nui-hidden" name="criteria._expr[2]._property" value="suppliersname"/>
						    <input class="nui-hidden" name="criteria._expr[2]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[2]._likeRule" value="all"/>
						</td>
						<td align="right">受益销售：</td>
						<td>
							<input name="criteria._expr[3]._value" class="nui-textbox" style="width:120px;" id="saleName"/>
						    <input class="nui-hidden" name="criteria._expr[3]._property" value="orgname"/>
						    <input class="nui-hidden" name="criteria._expr[3]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[3]._likeRule" value="all"/>
						</td>
						
						<td align="right">考勤日期：</td>
						<td>
							<input name="criteria._expr[4]._min" class="nui-datepicker" style="width:120px;" id="sendtimeMin"/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="signdate"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
						    -
						    <input name="criteria._expr[4]._max" class="nui-datepicker" style="width:120px;" id="sendtimeMax"/>
						    <input class="nui-hidden" name="criteria._expr[4]._property" value="signdate"/>
						    <input class="nui-hidden" name="criteria._expr[4]._op" value="between"/>
						</td>
					</tr>
					<tr>
						<td align="right">项目编号：</td>
						<td>
							<input name="criteria._expr[5]._value" class="nui-textbox" style="width:120px;" id="projectNo"/>
						    <input class="nui-hidden" name="criteria._expr[5]._property" value="projectno"/>
						    <input class="nui-hidden" name="criteria._expr[5]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[5]._likeRule" value="all"/>
						</td>
						<td align="right">项目：</td>
						<td>
							<input name="criteria._expr[6]._value" class="nui-textbox" style="width:120px;" id="projectName"/>
						    <input class="nui-hidden" name="criteria._expr[6]._property" value="projectName"/>
						    <input class="nui-hidden" name="criteria._expr[6]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[6]._likeRule" value="all"/>
						</td>
						<td align="right">是否迟到：</td>
						<td>
							<input name="criteria._expr[7]._value" class="nui-dictcombobox"  id="signInFlag"  
	                        data="[{id:'',text:''},{id:'是',text:'是'}, {id:'否', text: '否'}]" textField="text" valueField="id" style="width:120px;"/>
						    <input class="nui-hidden" name="criteria._expr[7]._property" value="inflag"/>
						    <input class="nui-hidden" name="criteria._expr[7]._op" value="="/>
						</td>
						<td align="right">是否早退：</td>
						<td>
							<input name="criteria._expr[8]._value" class="nui-dictcombobox"  id="signOutFlag"
							 data="[{id:'',text:''},{id:'是',text:'是'}, {id:'否', text: '否'}]" textField="text" valueField="id" style="width:120px;"/>
							<input class="nui-hidden" name="criteria._expr[8]._property" value="outflag"/>
						    <input class="nui-hidden" name="criteria._expr[8]._op" value="="/>
						</td>
					</tr>
					<!-- 签到距离范围、签退距离范围 -->
					<tr>
						<td align="right">事业部：</td>
						<td>
							<input name="criteria._expr[9]._value" class="nui-dictcombobox" dictTypeId="CONT_ORG" id="orgname1" showNullItem="true" style="width:120px;"/>
						    <input class="nui-hidden" name="criteria._expr[9]._property" value="orgname1"/>
						    <input class="nui-hidden" name="criteria._expr[9]._op" value="="/>
						</td>
						<td align="right">项目经理：</td>
						<td>
							<input name="criteria._expr[10]._value" class="nui-textBox"   id="managername" style="width:120px;"/>
						    <input class="nui-hidden" name="criteria._expr[10]._property" value="managername"/>
						    <input class="nui-hidden" name="criteria._expr[10]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[10]._likeRule" value="all"/>
						</td>
						<td align="right">汇报对象：</td>
						<td>
							<input name="criteria._expr[11]._value" class="nui-textBox"   id="managername1" style="width:120px;"/>
						    <input class="nui-hidden" name="criteria._expr[11]._property" value="managername1"/>
						    <input class="nui-hidden" name="criteria._expr[11]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[11]._likeRule" value="all"/>
						</td>
						<td align="right">客户：</td>
						<td>
							<input name="criteria._expr[12]._value" class="nui-textbox"  id="custjc" style="width:120px;"/>
						    <input class="nui-hidden" name="criteria._expr[12]._property" value="custname"/>
						    <input class="nui-hidden" name="criteria._expr[12]._op" value="like"/>
						    <input class="nui-hidden" name="criteria._expr[12]._likeRule" value="all"/>
						</td>
					</tr>
					<tr>
						<td align="right">签到距离范围：</td>
						<td>
							<input name="criteria._expr[13]._min" class="nui-textbox"  id="signindistancemin" style="width:55px;"/>
						    <input class="nui-hidden" name="criteria._expr[13]._property" value="indistance"/>
						    <input class="nui-hidden" name="criteria._expr[13]._op" value="between"/>
						    -
						    <input name="criteria._expr[13]._max" class="nui-textbox"  id="signindistancemax" style="width:55px;"/>
						    <input class="nui-hidden" name="criteria._expr[13]._property" value="indistance"/>
						    <input class="nui-hidden" name="criteria._expr[13]._op" value="between"/>
						</td>
						<td align="right">签退距离范围：</td>
						<td>
							<input name="criteria._expr[14]._min" class="nui-textbox"  id="signoutdistancemin" style="width:55px;"/>
						    <input class="nui-hidden" name="criteria._expr[14]._property" value="outdistance"/>
						    <input class="nui-hidden" name="criteria._expr[14]._op" value="between"/>
						    - 
						    <input name="criteria._expr[14]._max" class="nui-textbox"  id="signoutdistancemax" style="width:55px;"/>
						    <input class="nui-hidden" name="criteria._expr[14]._property" value="outdistance"/>
						    <input class="nui-hidden" name="criteria._expr[14]._op" value="between"/>
						</td>
					</tr>
	            </table> 
	             <table style="width:90%;">
		            <tr>
		                <td align="center" style="width:100%;">
		                    <a class="nui-button" iconCls="icon-search" id="search" onclick="search()" >查询</a>
							<a class="nui-button" iconCls="icon-reload" id="reset" onclick="reset()" >重置</a>
							<a class="nui-button" iconCls="icon-search" id="search" onclick="search2()" >缺勤人员</a>
		                </td>
		            </tr>
	        	</table>          
	        </div>
	    </form>
	   
	    <div style="width:100%;" >
	        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
	            <table style="width:100%;">
	            	<tr>
	                    <td style="width:20%;">
	                        <a class="nui-button" id="exportBtn" iconCls="icon-download" onclick="dataExport()">导出</a>
	                        <a class="nui-button" id="queryAttendance_updateBtn" iconCls="icon-edit" onclick="updateProjectNo()" >考勤记录变更</a>
	                    </td>
	                </tr>
                 </table>           
	        </div>
	    </div>
		<!-- 考勤记录信息列表
		-->
	    <div id="datagrid1" frozenStartColumn="0" frozenEndColumn="6"  class="nui-datagrid" style="width:100%;height:400px;" 
	    	url="com.primeton.eos.ame_common.ameAttendance.queryAttendanceDetailRecode.biz.ext" showSummaryRow="true"
	         dataField="datas"  allowAlternating="true" ondrawcell="ondrawCsGatherFcGridcell"
	    	pageSize="20" sizeList="[10,20,50,100]" multiSelect="true" allowSortColumn="true">
			<div property="columns">
				<div field="signdate" width="120" align="center" headerAlign="center"  allowSort="true" renderer="getDetail">考勤日期</div>	
				<div field="signid" visible="false">签到经度</div> 
				<div field="outpername" width="50" align="center"  headerAlign="center" allowSort="true">人员</div>
				<div field="suppliersname"width="100" align="center"  headerAlign="center" allowSort="true">供应商(简称)</div>
				<div field="orgname1" width="80" align="center"  headerAlign="center" allowSort="true">事业部</div>
				<div field="orgname" width="80" align="center"  headerAlign="center" allowSort="true">受益部门</div>
				<div field="projectName" width="200" align="left" headerAlign="center" allowSort="true">项目</div>			
				<div field="projectno" width="100" align="center" headerAlign="center" allowSort="true">项目编号</div>
				<div field="custjc" width="180" align="center" headerAlign="center" allowSort="true">客户(简称)</div> 
				<div field="managername" width="70" align="center"  headerAlign="center" allowSort="true">项目经理</div>
				<div field="managername1" width="70" align="center"  headerAlign="center" allowSort="true">汇报对象</div>
				<div field="ruledetail" width="80" align="center" headerAlign="center" allowSort="true">考勤时点</div>
				<div field="intime" width="80" align="center"  headerAlign="center" allowSort="true" dateFormat="HH:mm:ss">签到时间</div>	
				<div field="inflag" width="60" align="center"  headerAlign="center" allowSort="true">是否迟到</div>
				<div field="inlocation" width="200" align="left"  headerAlign="center" allowSort="true">签到位置</div>
				<div field="indistance" width="80" align="right" numberFormat="n0"  headerAlign="center" dataType="int" allowSort="true">签到距离(米)</div>
				<div field="outtime" width="85" align="center"  headerAlign="center" allowSort="true" dateFormat="HH:mm:ss">签退时间</div>
				<div field="outflag" width="60" align="center"  headerAlign="center" allowSort="true">是否早退</div>
				<div field="outlocation" width="200" align="left"  headerAlign="center" allowSort="true">签退位置</div>
				<div field="outdistance" width="80" align="right"  headerAlign="center" numberFormat="n0" dataType="int" allowSort="true">签退距离(米)</div>
				<div field="swcontnum" width="110" headerAlign="center" allowSort="true"  >项目对应合同编号</div>
				<div field="actrate" width="95" align="right" headerAlign="center" allowSort="true" renderer="csReveRate" >收入确认比例</div>
				<div field="inlongitude" visible="false">签到经度</div> 
				<div field="outlongitude" visible="false">签退经度</div>
				<div field="inlatitude" visible="false">签到纬度</div> 
				<div field="outlatitude" visible="false">签退纬度</div>
				<div field="inremark" visible="false">签到备注</div> 
				<div field="outremark" visible="false">签到备注</div>
				<div field="longitude" visible="false">考勤经度</div> 
				<div field="latitude" visible="false">考勤纬度</div>
                <div field="confirmday" width="80" align="center" headerAlign="center" allowSort="true" dateFormat="yyyy-MM-dd" >最近确认日期</div>
			</div>
	   </div>	
	</div>
	<form name="exForm" id="exForm" action="com.primeton.eos.ame_common.ameAttendanceDetailExport.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
</body>

<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("#form1");
	init();
	var grid = nui.get("datagrid1");
	
	//考勤统计详细页面传参
	var names = '<%=request.getParameter("names") %>';
	var year = '<%=request.getParameter("year") %>';
	var month = '<%=request.getParameter("month") %>';
	var projectno = '<%=request.getParameter("projectno") %>';
	var suppliersname = '<%=request.getParameter("suppliersname") %>';
	var clockTimeMin = year + '-' + month + '-01';  //获取月初
  	//var day = new Date(year,month,0);   
  	var day = new Date(year,month,0);   
    var clockTimeMax = year + '-' + month + '-' + day.getDate();//获取月末
	if(names != null && names != "" && names != "null"){
	    nui.get("names").setValue(names);
	    nui.get("projectNo").setValue(projectno);
	    nui.get("sendtimeMin").setValue(clockTimeMin);
	    nui.get("sendtimeMax").setValue(clockTimeMax); 
	    nui.get("suppliersName").setValue(suppliersname);
		//var cjson = {criteria:{_expr:[{_property:"outpername",_op:"like",_likeRule:"all",_value:names}]}};
		document.getElementById('form1').style.display='none';
		document.getElementById('queryAttendance_updateBtn').style.display='none';
		var cjson = form.getData();
		grid.load(cjson);
		grid.sortBy("signid","desc");
	}else{
		var json = {};
		json = nui.decode(json);
		nui.ajax({
			url:"com.primeton.eos.ame_common.sendMail.getMySYB.biz.ext",
			data:json,
			type:"post",
			contentType:"text/json",
			success:function(action){
				if(action.syb.length > 0){
    				var sybdata = [];
    				for(var i = 0;i < action.syb.length;i ++){
    					sybdata[i] = {"dictID": action.syb[i].dictid,"dictName": action.syb[i].dictname};
    				}
    				nui.get("orgname1").setData(sybdata);
    				nui.get("orgname1").setShowNullItem(false);
    				nui.get("orgname1").setValue(action.syb[0].dictid);
				}else{
					nui.get("orgname1").setShowNullItem(true);
				}
				var orgname1Value = nui.get("orgname1").getValue();
				var orgname1Text = nui.get("orgname1").getText();
				nui.get("orgname1").setValue(nui.get("orgname1").getText());
				var data = form.getData(); 
				grid.load(data);
				grid.sortBy("signid","desc");
				nui.get("orgname1").setValue(orgname1Value);
				nui.get("orgname1").setText(orgname1Text);
			},
			error:function(jqXHR, textStatus, errorThrown){
				nui.alert("error:" + jqXHR.responseText);
			}
		});
	}
	
	//设置默认的日期，当月的第一天
	function init(){
		//按钮权限的控制
    	getOpeatorButtonAuth("queryAttendance_updateBtn");//操作按钮权限初始化
		var nowdays = new Date();
    	var year = nowdays.getFullYear();
    	var month = nowdays.getMonth();
    	month = month+1;
    	if (month < 10) {
        	month = "0" + month;
    	}
    	var firstDay = year + "-" + month + "-" + "01";//上个月的第一天
		nui.get("sendtimeMin").setValue(firstDay);
	}
	//导出
	function dataExport(){
		var orgname1Value = nui.get("orgname1").getValue();
		var orgname1Text = nui.get("orgname1").getText();
		nui.get("orgname1").setValue(nui.get("orgname1").getText());
	    form.loading("操作中，请稍后......");
        var json = form.getData();
		nui.ajax({
            url: "com.primeton.eos.ame_common.ameAttendance.exportAttendanceDetail.biz.ext",
            type: "post",
            data: json,
            cache: false,
            contentType: 'text/json',
            success: function (o) {
         		form.unmask();
            	var filePath = o.downloadFile;
            	var fileName = "考勤查询";
            	var myDate = new Date();
            	var year = myDate.getYear();
            	var month = myDate.getMonth()+1;
            	var day = myDate.getDate();
            	var hours = myDate.getHours();
            	var minutes = myDate.getMinutes();
            	var seconds = myDate.getSeconds();
            	var curDateTime = year;
            	if(month>9){
					curDateTime = curDateTime + "" + month;
				}else{
					curDateTime = curDateTime + "0" + month;
					}
            	if(day>9){
					curDateTime = curDateTime + day;
				}else{
					curDateTime = curDateTime + "0" + day;
					}
				if(hours>9){
					curDateTime = curDateTime + hours;
				}else{
					curDateTime = curDateTime + "0" + hours;
					}
				if(minutes>9){
					curDateTime = curDateTime + minutes;
				}else{
					curDateTime = curDateTime + "0" + minutes;
					}
				if(seconds>9){
					curDateTime = curDateTime + seconds;
				}else{
					curDateTime = curDateTime + "0" + seconds;
					}
				fileName = fileName + "_" + curDateTime + ".xls";
				var frm = document.getElementById("exForm");
            	frm.elements["downloadFile"].value = filePath;
            	frm.elements["fileName"].value = fileName;
			    frm.submit();
            },
            error: function () {
            	alert("error");
            }
        });
		var frm = document.getElementById("dForm");
		var data = form.getData();
		frm.elements["criteria"].value = data;
	  	frm.submit();
		nui.get("orgname1").setValue(orgname1Value);
		nui.get("orgname1").setText(orgname1Text);
	}
	
	//考勤查询
	function search(){
		 var orgname1Value = nui.get("orgname1").getValue();
		var orgname1Text = nui.get("orgname1").getText();
		nui.get("orgname1").setValue(nui.get("orgname1").getText()); 
		var data = form.getData();
		grid.load(data);
		grid.sortBy("signid","desc");
		nui.get("orgname1").setValue(orgname1Value);
		nui.get("orgname1").setText(orgname1Text);
	}
	//考勤查询
	function search2(){
		 var sendtimeMin = nui.get("sendtimeMin").getValue();
		 var data = {sendtimeMin:sendtimeMin,isflag:'1'}; 
		 grid.load(data);
	}
	//对象为空处理
	function changeNull(obj){
	 if(obj==null){
	 	return "";
	 }else{
	   return obj;
	 }
	}
	
	function getDetail(e){
	    //var aLink = nui.formatDate(e.value, "yyyy-MM-dd");
	    if(e.value){
	       return "<a href='javascript:void(0)' onclick='showDetail();' title='点击查看'>" + e.value + "</a>";
	    }
    }
	
	//考勤详细信息
	function showDetail() {  
			var selectRow = grid.getSelected();
			nui.open({
	                url: "<%=request.getContextPath() %>/ame_common/attendance/showAttendanceDetail.jsp",
	                title: "考勤信息", 
					width: 700,
		            height: 600,
	                onload: function () {
	                    var iframe = this.getIFrameEl();
	                    iframe.contentWindow.SetData(selectRow);
	                }
	              });
        }
        
        //变更到指定项目
        function updateProjectNo(){
        	var data = form.getData(); 
        		nui.open({
		            url: "<%=request.getContextPath() %>/ame_common/attendance/changeProject.jsp?data" + data,
		            title: "考勤记录变更",
		            width: 400,
		            height: 200,
		            onload: function () {
						var iframe = this.getIFrameEl();
						iframe.contentWindow.SetData(data);
						
					},
					ondestroy: function (action) {
						if(action=="ok"){
							grid.load(data);
							grid.sortBy("signid","desc");
		                }
					}
				});
        		
        } 
	
	//重置
	function reset(){
		form.reset();
		grid.load();
		grid.sortBy("signid","desc");
	}
	
	
	//收入确认比例
    function csReveRate(e){
		if(e.value== null){
    		return "";
    	}else{
    		return parseFloat(e.value*100).toFixed(2)+"%";
    	}
    }
    
    function ondrawCsGatherFcGridcell(e){
			var record = e.record,
	        column = e.column,
	        field = e.field,
	        value = e.value;
            //设置行样式   状态为未收款，预计收款年月小于当前月标记为红颜色FF99CC，预计收款年月为当前月标记为黄颜色FFFF99。
        	if(parseFloat(record.actrate) >= parseFloat(0.9) && parseFloat(record.actrate) < parseFloat(1)){
        		e.rowStyle = "background-color: #FFFF99";
        	}else if(parseFloat(record.actrate) == parseFloat(1)){
        		e.rowStyle = "background-color: #FF99CC";
        	}
		}
</script>
</html>