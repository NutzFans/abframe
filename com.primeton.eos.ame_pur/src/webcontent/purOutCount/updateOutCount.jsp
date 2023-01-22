<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): zyl
  - Date: 2016-06-02 10:10:25
  - Description:
-->
<head>
	<title>编辑考勤统计信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="../common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .asLabel
	    {
	        border:0;background-color:#F5F5F5;cursor:default;    
	    }
    </style>
</head>
<body>
	<div class="nui-fit">
		<form id="form1" method="post">
			<input name="attendanceid" id="attendanceid" class="nui-hidden" />
			<input name="year" id="year" class="nui-hidden" />
			<input name="month" id="month" class="nui-hidden" />
				<div style="padding:5px;">
					<table style="table-layout:fixed;">
						<tr>
							<td align="right" style="width:100px;">计提月度：</td>
							<td class="asLabel"><input name="pymonth" id="pymonth" class="nui-textbox"  required="false" style="width:80px" /></td>
							<td align="right" width="120px">姓名：</td>
							<td class="asLabel"><input name="outpername" id="outpername"  class="nui-textbox" required="true" style="width:100px" /></td>
							<td align="right" style="width:130px;">项目名称：</td>
							<td style="width:132px;" class="asLabel"><input name="projectname" id="projectname" class="nui-textbox"  required="false" style="width:100px"  /></td>
							<td align="right" style="width:120px;">项目编号：</td>
							<td style="width:132px;" class="asLabel"><input name="projectno" id="projectno" class="nui-textbox"  required="false" style="width:100px"  /></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">客户：</td>
							<td class="asLabel"><input name="custjc" id="custjc"  class="nui-textbox" required="true" style="width:80px" /></td>
							<td align="right" style="width:120px;">供应商：</td>
							<td class="asLabel"><input name="custname" id="custname"  class="nui-textbox" required="true" style="width:100px" /></td>
							<td align="right" style="width:120px;" id="tr7">事业部：</td>
							<td class="asLabel"id="tr8" ><input name="sybname" id="sybname" class="nui-textbox" required="false" style="width:100px" /></td>	
							<td align="right" style="width:120px;">汇报对象：</td>
							<td class="asLabel"><input name="hbname" id="hbname" class="nui-textbox" required="false" style="width:100px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;" id="t1">入场日期：</td>
							<td class="asLabel" id="tr4" ><input name="rcdate" id="rcdate"  class="nui-textbox" required="false" style="width:80px"/></td>
							<td align="right" style="width:120px;" id="tr3">离场日期：</td>
							<td class="asLabel" id="tr4" ><input name="lcdate" id="lcdate" class="nui-textbox" required="false" style="width:100px"/></td>
							<td align="right" style="width:120px;" id="tr3">个人项目标准工作日：</td>
							<td class="asLabel" id="tr4" ><input name="accrueddays" id="accrueddays" class="nui-textbox" required="false" style="width:100px"/></td>
							<td align="right" style="width:120px;" id="tr3">月标准工作日：</td>
							<td id="tr4" ><input name="standarddays" id="standarddays" class="nui-textbox" required="false" style="width:100px" onblur="changeCost()"/></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">打卡天数：</td>
							<td class="asLabel"><input name="attendancedays" id="attendancedays"  class="nui-textbox" required="false" style="width:80px" /></td>
							<td align="right" style="width:120px;">补充天数：</td>
							<td ><input name="adddays" id="adddays"  class="nui-textbox" required="false" style="width:100px" onblur="changeTotal()"/></td>
							<td align="right" style="width:120px;" id="tr3">当月出勤天数：</td>
							<td class="asLabel" id="tr4" ><input name="totaldays" id="totaldays"  class="nui-textbox" required="false" style="width:100px"/></td>
							<td align="right" style="width:120px;" id="tr7">项目认定出勤天数：</td>
							<td id="tr8" ><input name="agreeddays" id="agreeddays" class="nui-textbox" required="false" style="width:100px" onblur="changeData()"/></td>	
						</tr>
						<tr>
							<td align="right" style="width:100px;">未签到次数：</td>
							<td class="asLabel"><input name="signnum" id="signnum" class="nui-textbox" required="false" style="width:80px"/></td>
							<td align="right" style="width:120px;" >未签退次数：</td>
							<td class="asLabel"><input name="signoutnum" id="signoutnum" class="nui-textbox" required="false" style="width:100px"/></td>
							<td align="right" style="width:120px;">迟到次数：</td>
							<td class="asLabel"><input name="latenum" id="latenum" class="nui-textbox" required="false" style="width:100px"/></td>
							<td align="right" style="width:120px;" >早退次数：</td>
							<td class="asLabel"><input name="leavenum" id="leavenum" class="nui-textbox" required="false" style="width:100px"/></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;">考勤缺失天数：</td>
							<td ><input name="updatedays" id="updatedays"  class="nui-textbox" required="false" style="width:80px" onblur="changeLose()"/></td>
							<td align="right" style="width:120px;" id="k">单边考勤缺失次数：</td>
							<td id="tr8" ><input name="losedays" id="losedays" class="nui-textbox" required="false" style="width:100px" onblur="changeLose()"/></td>	
							<td align="right" style="width:120px;" id="tr7">罚款金额：</td>
							<td id="tr8" ><input name="penaltycost" id="penaltycost" class="nui-textbox" required="false" style="width:100px" /></td>	
						</tr>
						<tr>
							<td align="right" style="width:100px;" >人月数：</td>
							<td class="asLabel"><input name="months" id="months" class="nui-textbox" required="false" style="width:80px" /></td>
							<td align="right" style="width:120px;" >人月单价：</td>
							<td class="asLabel"><input name="price" id="price" class="nui-textbox" required="false" style="width:100px" /></td>
							<td align="right" style="width:120px;" id="tr7">当月计提成本：</td>
							<td id="tr8" ><input name="accruedcost" id="accruedcost" class="nui-textbox" required="false" style="width:100px" /></td>	
						</tr>
						<tr>
							<td align="right" style="width:100px;" >调整说明：</td>
							<td colspan="7"><input name="remark" id="remark"  class="nui-textarea"required="false" style="width:700px;height:50px" /></td>
						</tr>
						<tr>
							<td align="right" style="width:100px;color: red;">说明：</td>
							<td colspan="7" style="color: red">
								① 考勤缺失天数 = 项目认定出勤天数 - 当月出勤天数<br>
								 ② 人月数 = 项目认定出勤天数/月标准工作日<br>
								 ③ 当月计提成本 = 人员单价 * 人月数<br>
								 ④ 单边考勤缺失次数 = 未签到次数 + 未签退次数<br>
								 ⑤ 罚款金额 = 缺失天数 * 10 + 缺失次数 * 5<br>
								 ⑥ 当月出勤天数 = 打卡天数 + 补充天数
							</td>
						</tr>
					</table>
				</div>
		</form>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk" style="width:60px;margin-right:20px;" id="sureButton">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;" id="canelButton">关闭</a>
	</div>
	<script type="text/javascript">
        nui.parse();
	  	var form = new nui.Form("form1");

    	
	    function setData(data){
	    	data = nui.clone(data);
	    	if(data.action == "edit"){
		    	var json = nui.encode({attendanceid: data.attendanceid});
	        	nui.ajax({
	        		url: "com.primeton.eos.ame_pur.purOutCount.getOutCountById.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                	var outpername = o.outCount.outpername == null ?"":o.outCount.outpername;
	                	var month = o.outCount.month == null ?"":o.outCount.month;
	                	var year = o.outCount.year == null ?"":o.outCount.year;
	                	nui.get("month").setValue(month);
	                	nui.get("year").setValue(year);
	                	var pymonth=year+"-"+month;
	                	var custjc = o.outCount.custjc == null ?"":o.outCount.custjc;
	                	var sybname = o.outCount.sybname == null ?"":o.outCount.sybname;
	                	var hbname = o.outCount.hbname == null ?"":o.outCount.hbname;
	                	var projectname = o.outCount.projectName == null ?"":o.outCount.projectName;
	                	var projectno = o.outCount.projectno == null ?"":o.outCount.projectno;
	                	var custname = o.outCount.custname == null ?"":o.outCount.custname;
	                	var suppliersname = o.outCount.suppliersname == null ?"":o.outCount.suppliersname;
	                	var standarddays = o.outCount.standarddays == null ?"":o.outCount.standarddays;
	                	var attendancedays = o.outCount.attendancedays == null ?"":o.outCount.attendancedays;
	                	var adddays = o.outCount.adddays == null ?"":o.outCount.adddays;
	                	var updatedays = o.outCount.updatedays == null ?"":o.outCount.updatedays;
	                	var latenum = o.outCount.latenum == null ?"":o.outCount.latenum;
	                	var leavenum = o.outCount.leavenum == null ?"":o.outCount.leavenum;
	                	var signnum = o.outCount.signnum == null ?"":o.outCount.signnum;
	                	var signoutnum = o.outCount.signoutnum == null ?"":o.outCount.signoutnum;
	                	var createdate = o.outCount.createdate == null ?"":o.outCount.createdate;
	                	var rcdate = o.outCount.rcdate == null ?"":o.outCount.rcdate;
	                	var lcdate = o.outCount.lcdate == null ?"":o.outCount.lcdate;
	                	var months = o.outCount.months == null ?"":o.outCount.months;
	                	var price = o.outCount.price == null ?"":o.outCount.price;
	                	var accruedcost = o.outCount.accruedcost == null ?"":o.outCount.accruedcost;
	                	var remark = o.outCount.remark == null ?"":o.outCount.remark;
	                	var attendanceid = o.outCount.attendanceid == null ?"":o.outCount.attendanceid;
	                	var totaldays = o.outCount.totaldays == null ?"":o.outCount.totaldays;
	                	var accrueddays = o.outCount.accrueddays == null ?"":o.outCount.accrueddays;
	                	var losedays = o.outCount.losedays == null ?"":o.outCount.losedays;
	                	var defaultdays = o.outCount.defaultdays == null ?"":o.outCount.defaultdays;
	                	var agreeddays = o.outCount.agreeddays == null ?"":o.outCount.agreeddays;
	                	var penaltycost = o.outCount.penaltycost == null ?"":o.outCount.penaltycost;
	                	nui.get("remark").setValue(remark);
	                	nui.get("attendanceid").setValue(attendanceid);
	                	nui.get("standarddays").setValue(standarddays);
	                	nui.get("agreeddays").setValue(agreeddays);
	                	nui.get("adddays").setValue(adddays);
	                	nui.get("accruedcost").setValue(accruedcost);
	                	nui.get("updatedays").setValue(updatedays);
	                	nui.get("penaltycost").setValue(penaltycost);
	                	nui.get("losedays").setValue(losedays);
	                	document.getElementById("signnum").innerHTML = signnum;
	                	document.getElementById("signoutnum").innerHTML = signoutnum;
	                	document.getElementById("hbname").innerHTML = hbname;
	                	document.getElementById("outpername").innerHTML = outpername;
	                	document.getElementById("custjc").innerHTML = custjc;
	                	document.getElementById("pymonth").innerHTML = pymonth;
	                	document.getElementById("projectname").innerHTML = projectname;
	                	document.getElementById("projectno").innerHTML = projectno;
	                	document.getElementById("custname").innerHTML = suppliersname;
	                	document.getElementById("attendancedays").innerHTML = attendancedays;
	                	document.getElementById("latenum").innerHTML = latenum;
	                	document.getElementById("leavenum").innerHTML =leavenum;
	                	document.getElementById("rcdate").innerHTML = rcdate;
	                	document.getElementById("lcdate").innerHTML = lcdate;
	                	document.getElementById("months").innerHTML = months;
	                	document.getElementById("price").innerHTML = price;
	                	document.getElementById("accrueddays").innerHTML = accrueddays;
	                	document.getElementById("totaldays").innerHTML = totaldays;
	                	document.getElementById("sybname").innerHTML = sybname;
		        	}
	    		});
	    	}
    	}
    	
    	
    	
    	function onOk(){
    		var attendanceid = nui.get("attendanceid").getValue();
    		var remark = nui.get("remark").getValue();
	        var standarddays = nui.get("standarddays").getValue();
	        var adddays = nui.get("adddays").getValue();
	        var agreeddays = nui.get("agreeddays").getValue();
	        var updatedays = nui.get("updatedays").getValue();
			var losedays = nui.get("losedays").getValue();
	        var penaltycost = nui.get("penaltycost").getValue();
	        var accruedcost = nui.get("accruedcost").getValue();
	        var months = document.getElementById("months").innerHTML;
			
    		var json=nui.encode({outCount: {attendanceid: attendanceid,updatedays: updatedays,remark:remark,
    		standarddays:standarddays,adddays:adddays,agreeddays:agreeddays,losedays:losedays,accruedcost:accruedcost,months:months,penaltycost:penaltycost}});
    		nui.ajax({
                url: "com.primeton.eos.ame_pur.purOutCount.updateOutCount.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (text) {
                	if(text.result==1){
                		alert("保存成功！");
                		onCancel('ok');
                	}else{
                		alert("保存失败！");
                	}
                }
            });
    	}
    	
    	function changeCost(){
    		var standarddays = nui.get("standarddays").getValue();//当月标准工作日
    		var agreeddays = nui.get("agreeddays").getValue();//项目认定出勤天数
    		var price = document.getElementById("price").innerHTML;//单价
    		var json=nui.encode({standarddays:standarddays,agreeddays:agreeddays,price:price});
    		nui.ajax({
                url: "com.primeton.eos.ame_pur.purOutCount.changeCost.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                	var data = o.data;
                	nui.get("accruedcost").setValue(data.accruedcost);
                	document.getElementById("months").innerHTML = data.months;
                }
            });
    	}
    	
    	function changeData(){
    		var standarddays = nui.get("standarddays").getValue();//当月标准工作日
    		var agreeddays = nui.get("agreeddays").getValue();//项目认定出勤天数
    		var totaldays = document.getElementById("totaldays").innerHTML;//当月出勤天数
    		var price = document.getElementById("price").innerHTML;//单价
    		var losedays = nui.get("losedays").getValue();//单边考勤缺失次数
    		var json=nui.encode({standarddays:standarddays,agreeddays:agreeddays,price:price,totaldays:totaldays,losedays:losedays});
    		nui.ajax({
                url: "com.primeton.eos.ame_pur.purOutCount.changeDate.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                	var data = o.data;
                	nui.get("accruedcost").setValue(data.accruedcost);
                	nui.get("updatedays").setValue(data.updatedays);
                	nui.get("penaltycost").setValue(data.penaltycost);
                	nui.get("accruedcost").setValue(data.accruedcost);
                	document.getElementById("months").innerHTML = data.months;
                }
            });
    	}
    	
    	function changeTotal(){
    		var adddays = nui.get("adddays").getValue();//补充天数
    		var attendancedays = document.getElementById("attendancedays").innerHTML;//打卡天数
    		var json=nui.encode({adddays:adddays,attendancedays:attendancedays});
    		nui.ajax({
                url: "com.primeton.eos.ame_pur.purOutCount.changeTotal.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                	document.getElementById("totaldays").innerHTML = o.totaldays;
                }
            });
    	}
    	
    	
    	function changeLose(){
    		var losedays = nui.get("losedays").getValue();//单边考勤缺失次数
    		var updatedays = nui.get("updatedays").getValue();//考勤缺失天数
    		var json=nui.encode({losedays:losedays,updatedays:updatedays});
    		nui.ajax({
                url: "com.primeton.eos.ame_pur.purOutCount.changeLoseCost.biz.ext",
                data: json,
                type: 'POST',
                cache: false,
                contentType: 'text/json',
                success: function (o) {
                	var data = o.data;
                	nui.get("penaltycost").setValue(data.penaltycost);
                }
            });
    	}
    	
    	function onCancel(e) {
            CloseWindow(e);
        }
        	
        //标准方法接口定义
        function CloseWindow(action) {            
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        
        
    </script>
</body>
</html>