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
<script src="<%=contextPath %>/common/nui/crypto-js.min.js" type="text/javascript"></script>
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
	function showTips(content, state) {
		//  state  default|success|info|warning|danger
		if(state) {
			nui.showTips({content: content, state: state, x: "center", y: "center",timeout: 6000.});
		}
		else {
			nui.showTips({content: content, state: "success", x: "center", y: "center",timeout: 6000.});
		}
	}
	
	//ajax
	function ajaxCommon(params){
	 	if(typeof(params.async) == "undefined") {
	 		params.async = true;
	 	}
		nui.ajax({
	        url: params.url,
	        data: params.data,
	        type: 'POST',
	        async: params.async,
	        cache: false,
	        contentType: 'text/json',
	        success: function (data) {
	        	if(data.exception) {
	        		nui.unmask(document.body);
	        		showTips(data.exception.message,"danger");
	        		if(params.success) {
	        			params.success(data);
	        		}
	        	} else {
	        		if(params.success) {
	        			params.success(data);
	        		}
	        	}
	        }
	    });
	}
	
	//选人单选
	function selectUser(param){
    	var btnEdit = this;
        nui.open({
            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
            title: "选择人员",
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
            title: "选择人员",
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
	
	
	//打印按钮
	function preview() {
        document.getElementById('checkview').style.display="none";
        window.document.body.innerHTML = document.documentElement.innerHTML;
        window.print();
    };
	
	//导出
	function exportExcel(param){
		if(!confirm("是否确认导出？")){
				return;
			}
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
		return math.number(math.chain(math.bignumber(num1)).add(math.bignumber(num2)).done());;
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
		return math.number(math.chain(math.bignumber(num1)).multiply(math.bignumber(num2)).done())
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