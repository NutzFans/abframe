<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>
<%
	UserObject user = (UserObject) session.getAttribute("userObject");
	String username = user.getUserName();
	String userid = user.getUserId();
	String orgid = user.getUserOrgId();
	String orgname= user.getUserOrgName();
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): 李鹏程
  - Date: 2020-04-09 13:49:55
  - Description:
-->
<head>
<title>新增/编辑员工导师关系信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
<div class="nui-fit">
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;height:350px">
	<legend>员工导师关系基本信息</legend>
	<form id="form1" method="post">
				<input name="omemptutor.recordwriter" id="recordwriter" class="nui-hidden" />
				<input name="omemptutor.recordtime" id="recordtime" class="nui-hidden" />
				<input  name="omemptutor.emptutorid"  class="nui-hidden"  id=emptutorid/>
				
	
		<div style="padding:5px;">
			<table style="table-layout:fixed;" id="table_file">
					
			
				<tr>
					<td align="right" style="width:120px">员工姓名：</td>
					<td>
				<!-- 	<input name="omemptutor.userid" id="userid" class="nui-hidden"/>
			                    <input id="userid1" class="mini-textboxlist"  name="omemptutor.userid" searchField="name" style="width:120px;"
									url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
									textField="empname" valueField="userid" required="true" onvaluechanged="getAdminname"/></td> -->
					
				<input name="omemptutor.userid" id="userid" class="nui-buttonedit" onbuttonclick="selectOmEmployee"  allowInput="false" style="width:120px" required="true"/></td>
					
					<td align="right" style="width:120px">导师姓名：</td>
					<td>
				<!-- 	<input name="omemptutor.tutorid" id="tutorid" class="nui-hidden"/>
			                    <input id="tutorid1" class="mini-textboxlist"  name="omemptutor.tutorid" searchField="name" style="width:120px;"
									url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
									textField="empname" valueField="userid" required="true" onvaluechanged="getAdminname1"/></td> -->
 					<input name="omemptutor.tutorid" id="tutorid" class="nui-buttonedit" required="true"   allowInput="false"onbuttonclick="selectOmEmployee1" style="width:120px"/></td>
 				</tr>
				<tr>
					<td align="right"  style="width:120px">有效开始时间：</td>
					<td><input name="omemptutor.effectstarttime" id="effectstarttime" class="nui-datepicker" required="true" style="width:120px"/></td>
				
					<td align="right"  style="width:120px">有效结束时间：</td>
					<td><input name="omemptutor.effectendtime" id="effectendtime" class="nui-datepicker"   required="true" style="width:120px"/></td>
					
				
				</tr>
				<!--  <tr>
					<td align="right" style="width:120px">记录写入人：</td>
					<td><input name="omemptutor.recordwriter" id="recordwriter" class="nui-textbox" style="width:120px" required="true"/></td>
					<td align="right"   style="width:120px">记录写入时间：</td>
					<td><input name="omemptutor.recordtime" id="recordtime" class="nui-datepicker"  style="width:120px"/></td>
 					
					
				</tr> -->
			<!-- 	<tr>
					<td align="right" style="width:120px">最终修改用户：</td>
					<td><input name="omemptutor.lastchanger" id="lastchanger" class="nui-textbox"     style="width:120px;" allowInput="true"/></td>
					
					<td align="right"  style="width:120px">最终修改时间：</td>
					<td><input name="omemptutor.lastchangetime" id="lastchangetime" class="nui-datepicker"  style="width:120px"/></td>
				
				</tr>  -->
				
			</table>
		</div>
		</form>
	</fieldset>
	<br/>
	
</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="saveEmptutor" style="width:60px;margin-right:20px;">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width:60px;">关闭</a>
	</div>
<script type="text/javascript">
        nui.parse();
	  	var form = new nui.Form("form1");
	  	var contextPath = '<%=contextPath %>'
	 
		<% UserObject user1 = (UserObject)session.getAttribute("userObject");
		String nowuserid = user1.getUserId();
		String nowusername = user1.getUserName();%>
		var nowusername="<%=nowusername %>"
        var updateURL = "org.gocom.abframe.org.employee.EmpManager.updateEmpTurtor.biz.ext";
		var addURL = "org.gocom.abframe.org.employee.EmpManager.addEmpTurtor.biz.ext";
    	var saveURL = "";  
    	var action1; 
        var isJudge=false;
    
	    function SetData(data){
	    	data = nui.clone(data);
	    	if(data.action == "edit"){//编辑
	    		action1="edit";
	    		var json = nui.encode({omemptutor1:data}); 
	        	nui.ajax({
	        		url: "org.gocom.abframe.org.employee.EmpManager.getEmpTutor.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                    form.setData(o);
	                 nui.getbyName("omemptutor.userid").setText(o.omemptutor.empname);
	                  nui.getbyName("omemptutor.tutorid").setText(o.omemptutor.tutorname); 
	                  
	                  
	                    form.isChanged(false);	
/*     					nui.get("recordwriter").setReadOnly(true);	*/	
                     
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    		}/* else if(data.action == "new"){//新增
    		
    	 	nui.get("recordwriter").setValue(nowusername);
    		nui.get("recordwriter").setReadOnly(true);	
    		var date =new date;
    		console.log(date)	
    		}else{
    			
    		} */
    	}
   
	        //保存
	      
	function onOk() {
		if (!form.validate()) {
			nui.alert("表单信息填写不完整，请确认必输项是否填写！！");

			return;
		}
		var effectstarttime1 = nui.get("effectstarttime").getValue();
		var effectendtime1 = nui.get("effectendtime").getValue();
		if (effectstarttime1 > effectendtime1) {

			nui.alert("有效开始时间不能大于有效结束时间!");
			return;
		}
		judgeTime();
		if (isJudge) {
			nui.alert("当前时间区间存在该员工的导师关系，请另选时间段！");
			return;
		}

		if (confirm("确定提交？")) {
			nui.get("saveEmptutor").disable();
			SaveData();
		}
	}

	function SaveData() {
		if (form.validate()) {
			nui.get("saveEmptutor").disable();

			var saveURL = "";
			var empTutor = form.getData();
			var json = nui.encode({
				empTutor : empTutor.omemptutor,
				nowusername : nowusername
			});
			if (action1 == "edit") {

				saveURL = updateURL;
				nui.ajax({
					url : saveURL,
					data : json,
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(text) {
						var returnJson = nui.decode(text);
						if (returnJson.exception == null) {
							nui.alert("保存成功！");
							CloseWindow();
						} else {
							nui.alert("保存失败！");
							nui.get("saveEmptutor").enable();
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						nui.alert(jqXHR.responseText);
					}
				});
			} else {
				saveURL = addURL;
				nui.ajax({
					url : saveURL,
					data : json,
					type : 'POST',
					cache : false,
					contentType : 'text/json',
					success : function(text) {
						var returnJson = nui.decode(text);
						form.setData(returnJson);

						if (returnJson.exception == null) {
							nui.alert("新增成功！");
							CloseWindow();
						} else {
							nui.alert("保存失败", "系统提示", function(action) {
								if (action == "ok" || action == "close") {
								}
							});
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert(jqXHR.responseText);
						CloseWindow();
					}
				});
			}
		} else {
			nui.alert("请补全信息！");
			return;
		}
	}

	//标准方法接口定义
	function CloseWindow(action) {
		if (action == "close" && form.isChanged()) {
			if (confirm("数据被修改了，是否先保存？")) {
				return false;
			}
		}
		if (window.CloseOwnerWindow){
		return window.CloseOwnerWindow(action);
		}
		else{
		window.close();
		}
			
	}

	function onCancel(e) {
		CloseWindow("cancel");
	}

	function getAdminname() {
		var adminname = nui.get("userid1").getText();
		nui.get("userid").setValue(adminname);
	}
	function getAdminname1() {
		var adminname = nui.get("tutorid1").getText();
		nui.get("tutorid").setValue(adminname);
	}

	// 选择员工 单选
	function selectOmEmployee() {
		var btnEdit = this;
		nui.open({
			url : contextPath + "/machine/SelectEmployee.jsp",
			title : "选择员工",
			width : 650,
			height : 380,
			ondestroy : function(action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data); //必须
					if (data) {
						if (nui.getbyName("omemptutor.userid")) {
							nui.getbyName("omemptutor.userid").setText(data.empname);
							nui.getbyName("omemptutor.userid").setValue(data.userid);
						}
					}
				}

			}
		});
	}

	// 选择员工 单选
	function selectOmEmployee1() {
		var btnEdit = this;
		nui.open({
			url : contextPath + "/machine/SelectEmployee.jsp",
			title : "选择导师",
			width : 650,
			height : 380,
			ondestroy : function(action) {
				if (action == "ok") {
					var iframe = this.getIFrameEl();
					var data = iframe.contentWindow.GetData();
					data = nui.clone(data); //必须
					if (data) {
						if (nui.getbyName("omemptutor.tutorid")) {
							nui.getbyName("omemptutor.tutorid").setText(data.empname);
							nui.getbyName("omemptutor.tutorid").setValue(data.userid);
						}
					}
				}

			}
		});
	}

	function judgeTime() {
				isJudge = false;
				var empTutor = form.getData();
			
				var json = nui.encode({
					empTutor : empTutor.omemptutor,action1:action1
				})
				if(action1 == "edit"){
				nui.ajax({
					url : "org.gocom.abframe.org.employee.EmpManager.judgeEmpTutorTime.biz.ext",
					data : json,
					type : 'POST',
					cache : false,
					async : false,
					contentType : 'text/json',
					success : function(text) {
						var returnJson = nui.decode(text);
						var emptutor2 = returnJson.empTutor2;
						var effectstarttime = nui.get("effectstarttime").getValue();
						var effectendtime = nui.get("effectendtime").getValue();
								
						for (var i = 0; i < emptutor2.length; i++) {
						
							var obj = emptutor2[i];
							var effectendtime1 =nui.formatDate ( obj.effectendtime, "yyyy-MM-dd hh:mm:ss");
							var effectstarttime1 = nui.formatDate ( obj.effectstarttime, "yyyy-MM-dd hh:mm:ss");
							if (((effectstarttime <=effectendtime1) && (effectstarttime >= effectstarttime1))
									|| ((effectendtime <= effectendtime1) && (effectendtime >= effectstarttime1))
									|| ((effectstarttime >= effectstarttime1) && (effectendtime <= effectendtime1))) {
								isJudge = true;
								break;
							}
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						nui.alert(jqXHR.responseText);
						CloseWindow();
					}
				});
				
				
				}else {
				nui.ajax({
					url : "org.gocom.abframe.org.employee.EmpManager.judgeEmpTutorTime.biz.ext",
					data : json,
					type : 'POST',
					cache : false,
					async : false,
					contentType : 'text/json',
					success : function(text) {
						var returnJson = nui.decode(text);
						var emptutor2 = returnJson.empTutor2;
						var effectstarttime = nui.get("effectstarttime").getValue();
						var effectendtime = nui.get("effectendtime").getValue();
						for (var i = 0; i < emptutor2.length; i++) {
							var obj = emptutor2[i];
							var effectendtime1 =nui.formatDate ( obj.effectendtime, "yyyy-MM-dd hh:mm:ss");
							var effectstarttime1 = nui.formatDate ( obj.effectstarttime, "yyyy-MM-dd hh:mm:ss");
							if (((effectstarttime <= effectendtime1) && (effectstarttime >= effectstarttime1))
									|| ((effectendtime <= effectendtime1) && (effectendtime >= effectstarttime1))
									|| ((effectstarttime >= effectstarttime1) && (effectendtime <= effectendtime1))) {
								isJudge = true;
								break;
							}
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						nui.alert(jqXHR.responseText);
						CloseWindow();
					}
				});
				
				
				}
				

	}
</script>
</body>
</html>
