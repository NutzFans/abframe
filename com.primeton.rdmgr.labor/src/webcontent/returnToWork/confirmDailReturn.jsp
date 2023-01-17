<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<html>
<!-- 
  - Author(s): 许青倩
  - Date: 2020-03-06 11:12:36
  - Description:
-->
<head>
<title>复工日报确认</title>
<%@include file="/common/skins/skin0/component.jsp" %>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0">
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body{background:#EBEBEB;}
	.con{width: 100%;margin: 50px auto auto;}
</style>
</head>
<body  class="con">
	<div style="width:100%;height:100%;padding:0px;margin:0px;" id="form1">
		<input name="retrunWork.userid" id="userid" class="nui-hidden"/>
		<input name="retrunWork.returndate" id="returndate1" class="nui-hidden"/>
		<input name="retrunWork.empname" id="empname1" class="nui-hidden"/>
		<table style="width:100%;border-collapse:separate; border-spacing:0px 20px;">
			<tr>
				<td align="right" width="100px"><span>报工人：</span></td>
            	<td align="left" nowrap="nowrap" width="180px" id="empname"  name="retrunWork.empname"></td>
			</tr>
			<tr>
				<td align="right" width="100px"><span>报工日期：</span></td>
            	<td align="left" nowrap="nowrap" width="180px" id="returndate" name="retrunWork.returndate"></td>
			</tr>
			<tr>
				<td align="right" width="100px"><span>复工状态：</span></td>
            	<td align="left" nowrap="nowrap" width="180px" id="retrunstatus" name="retrunWork.retrunstatus"></td>
			</tr>
			<tr>
				<td align="right" width="100px"><span>当日所在省市：</span></td>
            	<td align="left" nowrap="nowrap" width="180px" id="returncity" name="retrunWork.returncity"></td>
			</tr>
			<tr>
				<td align="right" width="100px"><span>填报地理位置：</span></td>
            	<td align="left" nowrap="nowrap" width="180px" id="inlocation" name="retrunWork.inlocation"></td>
			</tr>
			<tr>
				<td align="right" width="100px"><span>其他说明：</span></td>
            	<td align="left" nowrap="nowrap" width="180px" id="remark" name="retrunWork.remark"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<a class="nui-button" onclick="onOk('1')" id="confirm" style="width: 80px;margin-right: 20px;">确认</a>
				</td>
				<%--<td align="center">
					<a class="nui-button" onclick="onOk('2')" id="double" style="width: 80px;margin-right: 20px;">疑问</a>
				</td>--%>
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
	
	var returndate = <%=request.getParameter("returndate")%>;
	var userid = <%=request.getParameter("userid")%>;
	
	//初始化
	init();
	function init(){
		var json = {"retrunWork":{"userid":userid,"returndate":returndate}};
	 	nui.ajax({
            type:'get',
            data:json,
            async:false,
            url:'com.primeton.rdmgr.labor.returnToWork.getReturnworkDetail.biz.ext',
            success:function(o){
                form1.setData(o);
                document.getElementById("empname").innerHTML = o.retrunWork.empname == null ?"":o.retrunWork.empname;
                document.getElementById("returndate").innerHTML = o.retrunWork.returndate == null ?"":o.retrunWork.returndate;
                document.getElementById("retrunstatus").innerHTML = o.retrunWork.retrunstatus == null ?"":nui.getDictText('AME_FGZT',o.retrunWork.retrunstatus);
                document.getElementById("returncity").innerHTML = (o.retrunWork.returnprovince == null ?"":(nui.getDictText('AME_PROVINCE',o.retrunWork.returnprovince)+'-'))+(o.retrunWork.returncity == null ?"":nui.getDictText('AME_CITY',o.retrunWork.returncity));
                document.getElementById("inlocation").innerHTML = o.retrunWork.inlocation == null ?"":o.retrunWork.inlocation;
                document.getElementById("remark").innerHTML = o.retrunWork.remark == null ?"":o.retrunWork.remark;
                if(o.retrunWork.confirmstatus == '1' || o.retrunWork.confirmstatus == '2' ){
                	alert("本条复工上报已被确认，无需再确认！");
					nui.get("confirm").setEnabled(false);
                }
            }
        })
	}
	
	//上报
	function onOk(e){
		if(!form1.validate()){
			alert("信息录入不完整!");
			return;
		}else{
			var json = form1.getData();
			json.retrunWork.confirmstatus = '1';
    		nui.confirm("确定要确认本条复工上报信息吗？","操作提示",function (action){
			if(action == "ok"){
				nui.get("confirm").setEnabled(false);
				form1.loading("处理中,请稍后...");
	    		nui.ajax({
	    			url:"com.primeton.rdmgr.labor.returnToWork.confirmReturnwork.biz.ext",
	    			data: json,
	    			type:"post",
	    			contentType:"text/json",
	    			success:function(action){
	    				action = nui.clone(action);
	    				form1.unmask();
	    				if(action.exception == '1'){
	    					nui.alert("确认成功！","系统提示",function(){
	    						close();
				        	});
	    				}else{
	    					nui.alert("确认失败,"+action.exception,"系统提示",function (){
			    				nui.get("confirm").setEnabled(true);
			    				init();
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
</script>
</html>