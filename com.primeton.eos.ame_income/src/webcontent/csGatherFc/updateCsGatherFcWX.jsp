<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.primeton.eos.ame_common.JsAPIUtil"%>
<%@page import="java.util.Map"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="com.eos.foundation.eoscommon.BusinessDictUtil"%>
<%@page import="java.util.Map"%>
<%@page import="com.primeton.bps.web.control.I18nUtil"%>
<html>
<!-- 
  - Author(s): yaoyi
  - Date: 2017-04-14 10:32:26
  - Description:
-->

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
	<legend>收款确认计划变更</legend>
	<form id="form1" method="post">
		<div style="padding:5px;">
			<input class="nui-hidden" id="year" >
			<input class="nui-hidden" id="num" >
			<input class="nui-hidden" id="gatherid" >
			<table style="table-layout:fixed;" id="table_file">
				<tr>
                    <td style="width:110px;" align="right">合同编号：</td>
                    <td style="width:110px;" id="contnum"></td>
					<td style="width:110px;" align="right">收款次数：</td>
                    <td style="width:110px;" id="gatherno"></td>
                </tr>
                <tr>
                    <td style="width:110px;" align="right">合同项目名称：</td>
                    <td colspan="3" style="width:330px;" id="projectname"></td>
                </tr>
                <tr>
                    <td style="width:110px;" align="right">客户名称：</td>
	                <td colspan="3" style="width:330px;" id="custname"></td>
                </tr>
                <tr>
                    <td style="width:110px;" align="right">预计确认金额：</td>
                    <td style="width:110px;" id="fcsum"></td>
                </tr>
                <tr>
                    <td style="width:110px;" align="right">原计划收款年月：</td>
                    <td style="width:110px;"id="yearmonth"></td>
                    <td style="width:110px;" align="right">更新预计收款年月：</td>
                    <td style="width:110px;">
                    	<input name="newyearmonth" id="newyearmonth" class="nui-monthPicker"  style="width:100px" onblur="check(1)"/>
                    </td>
                </tr>
                <tr>
                    <td style="width:110px;" align="right">收款确认时点：</td>
                    <td colspan="5">
                    	<input name="premise" id="premise" class="nui-textarea" style="width:100%;height: 100px;" onblur="check(3)"/>
                	</td>
                </tr>
                <tr>
                    <td style="width:110px;" align="right">变更原因：</td>
                    <td colspan="3">
                    	<input name="reason" id="reason" class="nui-textbox"style="width:100%" onblur="check(2)"/>
                    </td>
                </tr>
			</table>
		</div>
		</form>
	</fieldset>
</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOkEdit()" id="editReveFore" style="width:90px;margin-right:20px;">确定编辑</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
 
<script type="text/javascript">
	nui.parse();
	var gatherid='<%=request.getParameter("gatherid")%>';
	
	init(gatherid);
	var changetimes ;
	function init(gatherid){
		var json = nui.encode({gatherid:gatherid});
		nui.ajax({
	            url: "com.primeton.eos.ame_income.csGatherFc.getCsGatherFcById.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	var csGather=o.csGather;
	            	var contnum = csGather.contnum == null ?"":csGather.contnum;
	            	var projectname = csGather.projectname == null ?"":csGather.projectname;
	            	var custname = csGather.custname == null ?"":csGather.custname;
	            	var gatherid = csGather.gatherid == null ?"":csGather.gatherid;
	            	var gatherno = csGather.gatherno == null ?"":csGather.gatherno;
	            	var gathertimedesc = csGather.gathertimedesc == null ?"":csGather.gathertimedesc;
	            	var fcsum = csGather.fcsum == null ?"":csGather.fcsum;
	            	var yearmonth = csGather.yearmonth == null ?"":csGather.yearmonth;
	            	var newyearmonth = csGather.newyearmonth == null ?"":csGather.newyearmonth;
	            	document.getElementById("contnum").innerHTML = contnum;
	            	document.getElementById("projectname").innerHTML = projectname;
	            	document.getElementById("custname").innerHTML = custname;
	            	document.getElementById("gatherno").innerHTML = gatherno;
	            	document.getElementById("fcsum").innerHTML = fcsum;
	            	nui.get("premise").setValue(gathertimedesc);
	            	document.getElementById("yearmonth").innerHTML = yearmonth;
	            	changetimes =csGather.changetimes;
	            	nui.get("year").setValue(newyearmonth);
	            	nui.get("num").setValue(contnum);
	            	nui.get("gatherid").setValue(gatherid);
	            	newyearmonth = newyearmonth.substring(0,4)+"-"+newyearmonth.substring(4,6);
	            	nui.get("newyearmonth").setValue(newyearmonth);
	            }
	    });
	}
	
	
	function onCancel(e) {
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow();
        else window.close();  
    }
    
    function check(e){
    	if(e==1){
    		var newyearmonth = nui.get("newyearmonth").getValue();
    		if(newyearmonth==null||newyearmonth==""){
    			alert("更新预计收款年月不能为空!");
    			return;
    		}
    	}else if(e==2){
    		var reason = nui.get("reason").getValue();
    		if(reason==null||reason==""){
    			alert("变更原因不能为空!");
    			return;
    		}
    	}else if(e==3){
    		var premise = nui.get("premise").getValue();
    		if(premise==null||premise==""){
    			alert("确认前提说明不能为空!");
    			return;
    		}
    	}
    }
    
    function checkData(){
    	var newyearmonth = nui.get("newyearmonth").getValue();
    	var reason = nui.get("reason").getValue();
    	var premise = nui.get("premise").getValue();
    	if(newyearmonth==null||newyearmonth==""){
    		return 1;
    	}else if(reason==null||reason==""){
    		return 2;
    	}else if(premise==null||premise==""){
    		return 3;
    	}else{
    		return 0;
    	}
    }
    
    function onOkEdit(){
    	var a = checkData();
    	if(a==1){
    		alert("更新预计收款年月不能为空!");	
    		return;
    	}else if(a==2){
    		alert("变更原因不能为空!");
    		return;
    	}else if(a==3){
    		alert("确认前提说明不能为空!");
    		return;
    	}else{
    		var yearmonth = nui.get("year").getValue();
    		var newyearmonth = nui.get("newyearmonth").getValue();
    		var year = newyearmonth.getFullYear();
    		var month = newyearmonth.getMonth()+1;
    		month = month < 10 ? "0" +month:month;
    		newyearmonth =  year +""+ month;
	    	var reason = nui.get("reason").getValue();
	    	var premise = nui.get("premise").getValue();
	    	var contnum = nui.get("num").getValue();
	    	//type类型 0是收入1是收款
	    	var json = nui.encode({csChange:{yearmonth:yearmonth,newyearmonth:newyearmonth,reason:reason,premise:premise,type:"1",grid:gatherid,contnum:contnum,changetimes:changetimes}});
			nui.ajax({
	            url: "com.primeton.eos.ame_income.csGatherFc.updateCsGatherChange.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	if(o.result==1){
	            		alert("编辑成功!");
	            	}else{
	            		alert("编辑失败!");
	            	}
	            }
		    });
    	}
    }
	
</script>
</body>
</html>