<%@page pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%@ page import="com.eos.data.datacontext.UserObject"%>
<%@ page import="commonj.sdo.DataObject" %>
<%@ page import="java.util.Map" %>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	
<% 
	UserObject user = (UserObject)session.getAttribute("userObject");
	String userName=user.getUserName();
	String userOrgName = user.getUserOrgName();
	String nowuserid = user.getUserId();
	
	String contextPath=request.getContextPath();
	String userOrgId = user.getUserOrgId();
	Map<String,Object> a = user.getAttributes();
	
	String orgseq =(String) a.get("orgseq");
	String empid = (String) a.get("empid");
	DataObject[] roles = (DataObject[])a.get("roles");
	DataObject[] orgs = (DataObject[])a.get("orgs");
         
	  int orglen = orgs.length;
	  JSONObject orglist = new JSONObject();
	  for(int i=0;i<orgs.length;i++){
		JSONObject orgTemp = new JSONObject();
		orgTemp.put("orgid",orgs[i].get("orgid"));
		orgTemp.put("orgname",orgs[i].get("orgname"));
		orglist.put(i, orgTemp);
	  }
%>
<script src="<%=contextPath %>/common/nui/nui.js" type="text/javascript"></script>
	<script src="<%=contextPath %>/purchase/common/math.js" type="text/javascript"></script>
<script>
	var userName = '<%=userName %>';
 	var userId = '<%=nowuserid %>';
 	var userOrgId = '<%=userOrgId %>';
 	var userOrgName = '<%=userOrgName %>';
 	var orgseq = '<%=orgseq %>';
 	var orglist = <%=orglist %>;
 	function getOrgseq2(){
	 	if(orgseq){
	 		var  orgseqs = orgseq.split(".");
	 		return orgseqs[2];
	 	}
	 	return null;
 	}
 	
 	//关闭窗口
 	function CloseWindow(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();
    }
    
    function closeCancel() {
        close_window("cancel");
	}
	function closeOk() {
		close_window("ok");
	}
	function close_window_directly() {
        close_window("cancel");
	}
	function close_window(action) {
        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
        else window.close();            
	}
    
    function clog(object) {
	 	console.log(object);
	 }
	
	// 提示框
	 function showTips(content){
		 nui.showTips({      
	        content: content,
	        state: "success",    //default|success|info|warning|danger
	        x: "center",                //left|center|right
	        y: "center",            //top|center|bottom
	        timeout: 2000.       //自动消失间隔时间。默认2000（2秒）
	      });
      }
 	
 	//ajax示例
 	/* ajaxCommon({
		"url": "com.zhonghe.ame.purchase.common.expentOrg.biz.ext",
		"data": json,
		"success": function(data) {
			nui.getbyName("area.id").setValue(data.nextCode);
		}
	}); */
	
	
	// 获取这个月的第一天
	function getFirstDayOfThisMonth() {
		var date = new Date();
		debugger
		date.setDate(1);
		date.setHours(0);
		date.setMinutes(0);
		date.setSeconds(0);
		
		return nui.formatDate(date, "yyyy-MM-dd HH:mm:ss");	
	}
	// 获取这个月的最后一天
	function getLastDayOfThisMonth() {
	 	var date=new Date();
		var currentMonth = date.getMonth();
		var nextMonth = ++currentMonth;
		var nextMonthFirstDay=new Date(date.getFullYear(),nextMonth,1);
		var oneDay=1000 * 60 * 60 * 24;
		
		var lastDate = new Date(nextMonthFirstDay-oneDay);
		lastDate.setHours(23);
		lastDate.setMinutes(59);
		lastDate.setSeconds(59);
		
		return nui.formatDate(lastDate, "yyyy-MM-dd HH:mm:ss");	
	}
	function getMonthDays(year,month){
	  var stratDate = new Date(year,month-1,1),
     	endData = new Date(year,month,1);
	  	var days = (endData -stratDate)/(1000*60*60*24);
	  return days;
	}
	//ajax
	function ajaxCommon(params){
	 	if(typeof(params.async) == "undefined") {
	 		params.async = true;
	 	}
	 	var msgBoxId = nui.loading("正在处理...", "请稍后");
		nui.ajax({
	        url: params.url,
	        data: params.data,
	        type: 'POST',
	        async: params.async,
	        cache: false,
	        contentType: 'text/json',
	        success: function (data) {
	        	nui.hideMessageBox(msgBoxId);
	        	if(data.exception) {
	        		clog(data.exception.message);
	        		showTips(data.exception.message);
	        	}
	        	else {
	        		if(params.success) {
	        			params.success(data);
	        		}
	        	}
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
				if(params.error) {
	        		params.error(jqXHR, textStatus, errorThrown);
	        	}
	        	nui.hideMessageBox(msgBoxId);
	        }
	    });
	}
	
	//选人单选
	function selectUser(param){
    	var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择验收人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
	                    param(data);
                    }
                }

            }
        });
    }
	//选人多选
	function selectUsers(param){
    	var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/contractPact/selectUsers.jsp",
            title: "选择验收人",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
	                    param(data);
                    }
                }
            }
        });
    }
 	
	 // 获取用户部门对象(同步)
	function ajaxGetOrgObject(params, showMsgBox) {
		nui.ajax({
	        url: "com.zhonghe.ame.purchase.common.expentOrg.biz.ext",
	        type: 'POST',
	        async: false,
	        cache: false,
	        contentType: 'text/json',
	        success: function (data) {
	        	params.success(data.org);
	        },
	        error: function (jqXHR, textStatus, errorThrown) {
	        	params.error();
	        }
	    });
	}
	//获取部门类别
	function getJudge() {
		var judge;
		ajaxGetOrgObject({
			"success": function(org) {
				judge = org.judge;	
			}
		});
		return judge;
	}
	function getYear(){
		var newYear = nui.formatDate(new Date(),"yyyy");
		return  newYear;
	}
	
	//导出
	function exportExcel(param){
		if(!confirm("是否确认导出？")){
				return;
			}
		//	var data = form.getData();
			var json =  nui.encode(param.data);
			nui.ajax({
    			url: param.url,
		        type: "post",
		        data: json,
		        cache: false,
		        contentType: 'text/json',
		        success: function (o) {
		     		nui.unmask();
		     		var filePath = o.downloadFile;
		        	var fileName = param.fileName;
		        	var myDate = new Date();
		        	var year = myDate.getFullYear();
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
					var frm = document.getElementById("viewlist1");
		        	frm.elements["downloadFile"].value = filePath;
		        	frm.elements["fileName"].value = fileName;
				    frm.submit();
		        },
		        error: function () {
		        	alert("error");
		        }
			});
		}
	//////////////////////////////////////////
	// 
	//            ————运算————
	// 
	/////////////////////////////////////////
	function addFloat(num1, num2) {
		if(!num1) num1 = 0;
		if(!num2) num2 = 0;
		//num1 = parseFloat(num1);
		//num2 = parseFloat(num2);
		
		return math.format(math.chain(math.bignumber(num1)).add(math.bignumber(num2)).done());;
	}
	
	function subFloat(num1, num2) {
		if(!num1) num1 = 0;
		if(!num2) num2 = 0;
		num1 = parseFloat(num1);
		num2 = parseFloat(num2);
		
		return parseFloat(num1 - num2).toFixed(2);
	}
	
	function mulFloat(num1, num2) {
		if(!num1) num1 = 0;
		if(!num2) num2 = 0;
		return math.format(math.chain(math.bignumber(num1)).multiply(math.bignumber(num2)).done())
	}
	
	function divFloat(num1, num2) {
		num1 = parseFloat(num1);
		num2 = parseFloat(num2);
		
		return parseFloat(num1 / num2).toFixed(2);
	}
	function addInt(num1, num2) {
		num1 = parseInt(num1, 10);
		num2 = parseInt(num2, 10);
		
		return parseInt(num1 + num2);
	}
	function subInt(num1, num2) {
		num1 = parseInt(num1, 10);
		num2 = parseInt(num2, 10);
		
		return parseInt(num1 - num2);
	}
	

</script>