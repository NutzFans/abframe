<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%@page import="commonj.sdo.DataObject"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<!-- 
  - Author(s): xupc
  - Date: 2019-03-05
  - Description:
-->
<head>
	<title>招聘日报</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fit">
	<form id="form1">
	        <input name="resume.resumeid" id="resumeid" class="nui-hidden">
			<div style="padding:15px;">
				<table style="width:100%;">
				    <tr>	
				        <td align="right" style="width:60px;">推荐人:</td>
	            		<td align="left">
	            		    <input style="width:100px;" name="resume.referrer" id="referrername"   onbuttonclick="selectEmp" class="nui-buttonedit" allowInput="false" readonly="readonly" emptyText="请选择人员" />
	            		</td>
	            		<td align="right" style="width:60px;">候选人:</td>
	            		<td align="left">
	            		    <input style="width:100px;"name="resume.empname" id="empname" class="nui-textbox" required="false" readonly="readonly">
	            		</td>
					</tr>
				    <tr>	
	            		<td align="right" style="width:60px;">内推状态:</td>
	            		<td align="left">
	            		    <input style="width:100px;"name="resume.referrerstatus" id="referrerstatus" class="nui-dictcombobox" required="false" readonly="readonly" dictTypeId="REFFER_STATUS">
	            		    <!-- <a style="width:30%;" id = "referrerSure" class="nui-button"  onclick="referrerSure()" >内推确认 </a> -->
	            		</td>
	            		<td align="right" style="width:60px;">招聘专员：</td>
	            		<td  align="left" >
	            			<input style="width:100px;" name="resume.operatorid" id="operatorid"   onbuttonclick="selectEmp" class="nui-buttonedit" allowInput="false" emptyText="请选择人员" />    
	            		</td>
					</tr>
				</table>
			</div>
	</form>
</div>	
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-button" onclick="referrerSure()" id="saveExpRei" iconCls="icon-ok" style="width: 100px;margin-right: 20px;">内推确认 </a>
	<!-- <a class="nui-button" onclick="onCancel('cancel')" id="closeResume" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a> -->
</div>
</body>
<script type="text/javascript">
    <% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		Map attr = user.getAttributes();
		String operatorid = (String) attr.get("operatorid");
		String nowusername = user.getUserName();
	%>
	var nowoperatorid='<%=operatorid%>';
	var nowusername='<%=nowusername%>';
	var resumeid = '<%=request.getParameter("id") %>';
	var operatorid = '<%=request.getParameter("operatorid") %>';
	var referrerstatus = '<%=request.getParameter("referrerstatus") %>';
	var recruitername = '<%=request.getParameter("recruitername") %>';
	var empname = '<%=request.getParameter("empname") %>';
	var referrer = '<%=request.getParameter("referrer") %>';
	var referrername = '<%=request.getParameter("referrername") %>';
	nui.parse();
	nui.get("resumeid").setValue(resumeid);
	nui.get("empname").setValue(empname);
	nui.get("referrername").setValue(referrer);
	nui.get("referrername").setText(referrername);
	if(operatorid == null || operatorid == '' || operatorid == 'null'){
	    nui.get("operatorid").setValue(nowoperatorid);
	    nui.get("operatorid").setText(nowusername);
	}else{
	    nui.get("operatorid").setValue(operatorid);
	    nui.get("operatorid").setText(recruitername);
	}
	nui.get("referrerstatus").setValue(referrerstatus);
	var form = new nui.Form("form1");
	/* function onOk(){
	       var  resume = form.getData();
	       var json = nui.encode(resume);
		   nui.confirm("确定编辑此条内推记录？","内推信息提示",function(action){
				  if(action=="ok"){
		            form.mask("此条内推记录正在录入，请稍等...");
		            nui.ajax({
		                url:"com.primeton.eos.ame_resume.resumeManage.updateResume.biz.ext",
						type: 'POST',
						data: json,	
						contentType: 'text/json',
		                success: function (o){
		                    form.unmask();
		                	if(o.result == 0){
		                		nui.alert("编辑失败，重新操作！");
		                		return;
		                	}else{
		                	    nui.alert("编辑成功！","推荐简历信息提示",function (action){
			                            if(action == "ok"){
			                                   CloseWindow("ok")
			                               }
	                            })
		                	} 
		                }
		            });
		     }
		 })   
	} */
	//内推简历确认状态
    function referrerSure(){
            var row = form.getData().resume;
	        var json = nui.encode({"resume":row});
	        nui.ajax({
	            url:"com.primeton.eos.ame_resume.resumeManage.sureReferrer.biz.ext",
	            type:'POST',
	            data:json,
	            cache: false,
	            contentType:'text/json',
	            success:function(text){
	                var returnJson = nui.decode(text);
	                if(returnJson.result == 1){
	                  nui.get("referrerstatus").setValue('1');
	                  /* document.getElementById("referrerSure").style.display="none"; */
	                  nui.alert("内推确认成功！","推荐简历信息提示",function (action){
	                            if(action == "ok"){
	                                   CloseWindow("ok")
	                            }
	                  })
	                }else{
	                  nui.alert("确认失败，请联系信息部门");
	                }
	            }
	        }); 
    }
	function onCancel(e) {
    	var data = form.getData();
    	if(data){
        	nui.showMessageBox({
	            title: "关闭提示",
	            iconCls: "nui-messagebox-question",
	            buttons: ["yes", "no"],
	            message: "是否关闭？",
	            callback: function (action) {
	                if(action=="yes"){
	                	CloseWindow("cancel");
	                }
	            }
	        });
		}else{
			CloseWindow("cancel");
		}
    }
	function CloseWindow(action){
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	function selectEmp(){
		var btnEdit = this;
	    nui.open({
	        url: "/default/machine/SelectEmployee.jsp",
            title: "选择人员",
            width: 430,
            height: 400,
            ondestroy: function (action) {
                if (action == "ok") {
                    var iframe = this.getIFrameEl();
                    var data = iframe.contentWindow.GetData();
                    data = nui.clone(data);    //必须
                    if (data) {
                       btnEdit.setValue(data.operatorid);
                       btnEdit.setText(data.empname);
                    }
                 }

            }
       });
	}
</script>
</html>