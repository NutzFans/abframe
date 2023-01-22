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
	<title>新增推荐人简历</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fit">
	<form id="form1">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<input name="resume.resumeid" id="resumeid" class="nui-hidden">
		<input name="resume.fileids1" id="fileids" class="nui-hidden"/>
		<!-- 推荐日期 -->
		<input name="resume.applydate" id="applydate"  class="nui-hidden"/>
		<!-- 简历状态 -->
		<input name="resume.interviewstatus" id="interviewstatus"   value='0' class="nui-hidden"/>
		<!-- 招聘渠道 -->
		<input name="resume.recruitway" id="recruitway"  value='2' class="nui-hidden"/>
		<!-- 招聘渠道说明 -->
		<input name="resume.recruitwayexp" id="recruitwayexp"  value='内部推荐' class="nui-hidden"/>
		<!-- 内推状态 -->
		<input name="resume.referrerstatus" id="referrerstatus"  value='0' class="nui-hidden"/>
		<!-- 邮件组 -->
		<input id="cclist" class="nui-hidden" value="zhaopin@primeton.com"/>
			<legend >推荐人基本信息</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:100px;">被推荐人姓名 :</td>
	            		<td style="width:150px;" align="left">    
	                		<input name="resume.empname" id="empname" class="nui-textbox" required="true" maxLength="50" onvaluechanged="changeempname"/>
	            		</td>
	            		<td align="right" style="width:100px;">联系电话:</td>
	            		<td style="width:150px;" align="left">    
	                		<input name="resume.tel" id="tel" required="true" class="nui-textbox" maxLength="11" onvalidation="checkPhone(e,this)"/>
	            		</td>
	            		<td align="right" style="width:100px;">期望工作地点:</td>
	            		<td style="width:150px;" align="left">    
	                		<input name="resume.announcecity" id="announcecity" class="nui-textbox" maxLength="20" required="true"/>
	            		</td>
					</tr>
					<tr>
	            		<td align="right" style="width:100px;">期望职位名称:</td>
	            		<td style="width:150px;" align="left">    
	                		<input name="resume.applyoccupation" id="applyoccupation"  required="true" class="nui-textbox" maxLength="128"/>
	            		</td>
	            		
	            		<td align="right" style="width:100px;">最近一家公司:</td>
	            		<td align="left" style="width:150px;">    
	                		<input name="resume.currentcompany" id="currentcompany"  class="nui-textbox" maxLength="128"/>
	            		</td>
	            		<td align="right" style="width:100px;">毕业学校:</td>
	            		<td align="left" style="width:150px;">    
	                		<input name="resume.school" id="school" class="nui-textbox" maxLength="255"/>
	            		</td>
					</tr>
					<tr>
	            		<td align="right" style="width:100px;">学历:</td>
	            		<td align="left" style="width:150px;">    
	                		<input name="resume.education" id="education"  class="nui-dictcombobox" dictTypeId="DEGREE"/>
	            		</td>
	            		<td align="right" style="width:100px;">毕业时间:</td>
	            		<td align="left" style="width:150px;">    
	                		<input name="resume.highestoutdate" id="highestoutdate" class="nui-datepicker" showTodayButton="false"/>
	            		</td>
	            		<td align="right" >推荐人:</td>
	            		<td style="width:150px;" align="left">
	            			<input name="resume.referrer" id="referrer" class="nui-buttonedit" allowInput="false" onbuttonclick="selectEmp"/>    
	            		</td>
					</tr>
					<tr>
					    <td align="right" style="width:100px;">备注:</td>
	            		<td align="left"  style="width:150px;">
	            			<input name="resume.remark" id="remark" class="nui-textbox" style="width:428%;"/>
            			</td>
					</tr>
				</table>
			</div>
		</fieldset>
	</form>
	<fieldset id="field4" style="border:solid 1px #aaa;padding:3px;">
		<legend>简历附件</legend>
		<jsp:include page="/ame_common/addFiles.jsp"/>
	</fieldset>
	<fieldset id="field5" style="border:solid 1px #aaa;padding:3px;">
		<legend><span style="color: red">注意事项</span></legend>
		<font>1、为保证HR获得被推荐人更多的信息，请上传被推荐人最新且真实有效的简历</br>
		   2、请在备注中说明被推荐人目前的在职状态及预期可入职时间等</br>
		   3、如果希望<span style="color: red">明确目标推荐部门</span>，也请在备注中注明
		</font>
	</fieldset>
</div>	
<div style="text-align: center;padding: 10px;" class="nui-toolbar">
	<a class="nui-button" onclick="onOk()" id="saveExpRei" iconCls="icon-ok" style="width: 60px;margin-right: 20px;">提交</a>
	<a class="nui-button" onclick="onCancel('cancel')" id="closeResume" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
</div>
</body>
<script type="text/javascript">
    <% 
		UserObject user = (UserObject)session.getAttribute("userObject");
		String nowuserid = user.getUserId();
		String nowusername = user.getUserName();
	%>
	var nowuserid='<%=nowuserid %>';
	var nowusername='<%=nowusername%>';
	nui.parse();
	var form = new nui.Form("form1");
	var referrer = nui.get("referrer");
	referrer.setValue(nowuserid);
	referrer.setText(nowusername);
	var applydate = nui.get("applydate").setValue(new Date());
	function onOk(){
		if(form.validate()){
			var resumeid = nui.get("resumeid").getValue();
			var tel = nui.get("tel").getValue();
			var empname = nui.get("empname").getValue();
			if(resumeid==null||resumeid==""){
				var ishave = 0;
				var json = {"criteria": {"_expr[0]": { "tel": tel},"_expr[1]": { "empname": empname}},"sortField":"empname","sortOrder":"asc"};
				nui.ajax({
		    			url: "com.primeton.eos.ame_resume.resumeManage.queryResume.biz.ext",
		    			data: json,
		    			type: 'POST',
		    			cache: false,
   						async:false,
		    			contentType: 'text/json',
		    			success: function(text){
		    				if(text.queryResume.length>0){
		    					ishave = 1;
		    				}
		    			}
    			});
    			if(ishave == 1){
    			    form.unmask();
					nui.alert("简历已存在！");
					return;
    			}
			}
				document.getElementById("fileCatalog").value="AmeResumefile";
				form2.submit();
		}
	}
	function SaveData(){
		var saveURL = "com.primeton.eos.ame_resume.resumeManage.addResumByMyReferrer.biz.ext";
		var a =[];
		var resume = form.getData();
		var resumeid = nui.get("resumeid").getValue();
		var cclist = nui.get("cclist").getValue();//发送邮件 
		if(resumeid==null||resumeid==""){
			form.validate();
			var json = nui.encode({"resume":resume.resume,cclist:cclist});
			if(form.validate()){
			    nui.confirm("您推荐的简历信息提交之后将无法修改，请确认无误后再提交！","内推简历确认提示",function(action){
			    if(action=="ok"){
			        form.mask("简历正在录入人才库，请稍等...");
					nui.ajax({
		    			url: saveURL,
		    			data: json,
		    			type: 'POST',
		    			cache: false,
		    			contentType: 'text/json',
		    			success: function(text){
		    			    form.unmask();
		    				if(text.returnVal==1){
	                            nui.alert("您推荐的简历已邮件通知招聘部门，请等待确认！","操作提示",function (action){
			                            if(action == "ok"){
			                                   CloseWindow("ok")
			                               }
	                            }) 
			    			}else if(text.returnVal==6){
			    				nui.alert("该工号对应的员工简历已存在，请确认是否正输入！");
			    			}else{
			    				nui.alert("您推荐的候选人简历录入失败，请重新尝试");
			    			}
		    			},
		    			error: function(jqXHR, textStatus, errorThrown){
		    				CloseWindow();
		    			}
		    		});
	    		 }
	    	  });	
			}else{
				return;
			}
		}
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
		if (action == "close" && form.isChanged()){
			if (confirm("简历被修改了，是否先保存？")){
				return false;
			}
		}
		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
		else window.close();
	}
	function selectEmp(){
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
                            btnEdit.setValue(data.userid);
                            btnEdit.setText(data.empname);
                        }
                    }

                }
            });
	}
	function checkPhone(e,obj){
		if(e.isValid) {
			var no = e.value;
			var id =obj.id;
			var message="";
			if(!!no){
				var tel = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
				var phone =/^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
				if(no.length == 11&&no.indexOf("-")== -1){//手机号码
			        if(!phone.test(no)) {
			        	if(id=="tel"){
			        		message ="手机号码格式不正确！";
			        		e.errorText = message;
	               			e.isValid = false;
			        		nui.alert(message);
			        	}
			          	return false;
			        }
			      }else if(no.indexOf("-") != -1 ){//电话号码
			        if(!tel.test(no)) {
			          if(id=="tel"){
			          	message ="联系电话格式不正确！";
			          	e.errorText = message;
	               		e.isValid = false;
			        	nui.alert(message);
			          }	
			          return false;
			        }
			     }else{
			     	if(id=="tel"){
			     		message ="联系电话格式不正确！";
			     		e.errorText = message;
	               		e.isValid = false;
			        	nui.alert(message);
		          	}	
		          	return false;
			     }
			}
		}
	}
	function changeempname(){
		var empname = nui.get("empname").getValue();
		nui.get("empname").setValue(empname.replace(/\s*/g,""));
	}
</script>
</html>