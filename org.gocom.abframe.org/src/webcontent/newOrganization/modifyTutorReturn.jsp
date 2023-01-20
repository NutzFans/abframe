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
  - Date: 2020-04-13 17:58:10
  - Description:
-->
<head>
<title>新增/编辑员工导师反馈信息</title>
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
	<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;height:400px">
	<legend>导师反馈基本信息</legend>
	<form id="form1" method="post">
		<div style="padding:5px;">
			<input  name="tutorReturn.tutorreturnid"  class="nui-hidden"  id=tutorreturnid/>
			<input  name="tutorReturn.emptutorid"  class="nui-hidden"  id=emptutorid/>
		
			<table style="table-layout:fixed;" id="table_file">
					
			
				<tr>
					<td align="right" style="width:120px">员工姓名：</td>
					<td colspan="3" >
<!-- 					<input name="tutorReturn.userid" id="userid" class="nui-combobox" onbuttonclick="selectOmEmployee"  allowInput="false" style="width:120px" required="true"/> -->
					<input name="tutorReturn.userid" id="userid" class="nui-combobox" textField="empname"  onvaluechanged="getNextPlan(e)" valueField="userid" dataField="tutorReturn1" allowInput="true"
					 allowInput="false" style="width:120px" required="true"/>
					
 					
					</td >
					
					<td align="right" style="width:120px">导师姓名：</td>
					<td colspan="3" >
 					<input name="tutorReturn.tutorid1" id="tutorid1" class="nui-textbox" required="true"   allowInput="false" style="width:120px"/>
 					<input name="tutorReturn.tutorid" id="tutorid" class="nui-hidden" allowInput="false" style="width:120px" required="true"/>
 					
 					</td>
 					<!-- <td align="right"  style="width:120px">评价年月：</td>
					<td><input name="tutorReturn.evaluatetime" id="evaluatetime" class="nui-monthpicker"  showTodayButton="false" allowInput="false" style="width:120px" onvalidation="judge(e)" ondrawdate="ddu(e)" required="true"/></td>
					<td align="right"  style="width:120px">评价最后修好时间：</td>
					<td><input name="omemptutor.lastchangetime" id="lastchangetime" class="nui-datepicker"  style="width:120px"/></td> -->
				</tr>  
				<tr>
					<td align="right" style="width:140px">工作态度：</td>
					<td colspan="3" ><input name="tutorReturn.workattitude" id="workattitude"class="nui-dictcombobox"  dictTypeId="AME_WORKATTITUDE" style="width:120px" required="true" /></td>
					<td align="right" style="width:140px">工作完成满意度：</td>
					<td colspan="3" ><input name="tutorReturn.evaluatetype" id="evaluatetype"class="nui-dictcombobox"   dictTypeId="AME_EVALUATETYPE" style="width:120px" required="true" /></td>
				
				</tr>
				<tr>
					<td align="right" style="width:140px">本月工作完成情况：</td>
					<td  colspan="5"><input name="tutorReturn.monthlyachievement" id="monthlyachievement"class="nui-textarea"  style="width:100%" required="true" /></td>
				</tr>
			 	<tr>
					<td align="right" style="width:140px">绩效不足之处：</td>
					<td colspan="5" ><input name="tutorReturn.achevementdown" id="achevementdown"class="nui-textarea"   maxLength = "1300" style="width:100%" required="true" /></td>
				</tr>
				<tr>
					<td align="right" style="width:140px">绩效提升的地方：</td>
					<td colspan="5" ><input name="tutorReturn.achevementup" id="achevementup"class="nui-textarea"   maxLength = "1300" style="width:100%" required="true" /></td>
				</tr>
				<tr>
					<td align="right"  style="width:140px">下一阶段改进计划：</td>
					<td colspan="5" ><input name="tutorReturn.nextplan" id="nextplan"class="nui-textarea"   maxLength = "1300"  style="width:100%" required="true" /></td>
				</tr>
				<tr>
					<td align="right"  style="width:140px">其他补充说明：</td>
					<td colspan="5" ><input name="tutorReturn.remarks" id="remarks"class="nui-textarea"   maxLength = "1300"  style="width:100%" required="true" /></td>
				</tr>
				
			</table>
		</div>
		</form>
	</fieldset>
	<br/>
	
</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="saveEmptutor"  iconCls="icon-ok" style="width:60px;margin-right:20px;">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" iconCls="icon-cancel" style="width:60px;">关闭</a>
	</div>
<script type="text/javascript">
        nui.parse();
	  	var form = new nui.Form("form1");
	  	var contextPath = '<%=contextPath %>'
	 
		<% UserObject user1 = (UserObject)session.getAttribute("userObject");
		String nowuserid = user1.getUserId();
		String nowusername = user1.getUserName();%>
		var nowusername="<%=nowusername %>"
		var nowuserid="<%=nowuserid %>"
		var effectendtime1=null;
		var emptutorid;
        var updateURL = "org.gocom.abframe.org.employee.EmpManager.updateTutorReturn.biz.ext";
		var addURL = "org.gocom.abframe.org.employee.EmpManager.addTutorReturn.biz.ext";
    	var saveURL = "";  
    	var action1;      
	    function SetData(data){
	    	data = nui.clone(data);
	    	if(data.action == "edit"){//编辑
	    	
	    		action1="edit";
	    		var json = nui.encode({tutorReturn1:data}); 
	        	nui.ajax({
	        		url: "org.gocom.abframe.org.employee.EmpManager.getTutorReturn.biz.ext",
	                data: json,
	                type: 'POST',
	                cache: false,
	                contentType: 'text/json',
	                success: function (o) {
	                    form.setData(o);
	                    
	                 nui.get("tutorid1").setValue(o.tutorReturn.tutorname); 
	             	  	nui.getbyName("tutorReturn.userid").setText(o.tutorReturn.empname);
	                	nui.get("userid").setReadOnly(true);
	                    form.isChanged(false);	
	                    
/*     					nui.get("recordwriter").setReadOnly(true);	*/	
                     
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	        	});
    		}else if(data.action == "new"){//新增
    	 	nui.get("tutorid").setValue(nowuserid);
    	 	nui.get("tutorid1").setValue(nowusername); 
    	 	selectOmEmployee();
    	 	//nui.get("tutorid1").setValue(nowusername);
    		}else{
    			
    		}
    	}
   
	        //保存
	        function onOk() {
	        	if(!form.validate()){
			    	nui.alert("表单信息填写不完整，请确认必输项是否填写！！");
			    	return;
			    }
	         	/* var evaluatetime=nui.get("evaluatetime").getValue();
	        	if(effectendtime1>evaluatetime){
	        		nui.alert("评价年月必须大于有效结束日期!");
	        	    return;
	        	} */
	        	var achievementTextLength = nui.get("monthlyachievement")._textEl.textLength;
	        	var nextplanTextLength = nui.get("nextplan")._textEl.textLength;
	        	if(achievementTextLength < 20){
	        	    nui.alert("'本月工作完成情况'字数不得低于20，请重新填写！！");
	        	    return;
	        	}
	        	if(nextplanTextLength < 20){
	        	    nui.alert("'下一阶段改进计划'字数不得低于20，请重新填写！！");
	        	    return;
	        	}
	            if(confirm("确定提交？")){
						nui.get("saveEmptutor").disable();
						SaveData();
					}
	            }
	       
	        
	        
        function SaveData() {
            if(form.validate()){
            	nui.get("saveEmptutor").disable();
            	var t=new Date();
				var month=nui.formatDate(t,"yyyy-MM")
				//var month="2020-03"
				
	        	var saveURL = "";
	        	var tutorReturn = form.getData();
		        var json = nui.encode({tutorReturn:tutorReturn.tutorReturn,nowusername:nowusername,emptutorid:emptutorid,month:month});
				if(action1 == "edit"){
					saveURL = updateURL;
					nui.ajax({
		                url: saveURL,
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                   var returnJson = nui.decode(text);
			              	if(returnJson.exception == null){
			                	alert("保存成功！");
			                	CloseWindow();
			              	}else{
	                    		alert("保存失败！");
	                    		nui.get("saveEmptutor").enable();
			              	}        
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            });
				} else{
					saveURL = addURL;
		            nui.ajax({
		                url: saveURL,
		                data: json,
		                type: 'POST',
		                cache: false,
		                contentType: 'text/json',
		                success: function (text) {
		                   	var returnJson = nui.decode(text);
		                   	form.setData(returnJson);
			              	if(returnJson.exception == null){
				                alert("新增成功！");
				                CloseWindow();
			              	}else{
		                		nui.alert("保存失败", "系统提示", function(action){
			                  	if(action == "ok" || action == "close"){
			                    	alert("新增失败！");
			                  	}
		                  	});
		                }     
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                    CloseWindow();
	                }
	            });
            }
        }else{
        	alert("请补全信息！");
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
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        
        function onCancel(e) {
            CloseWindow("cancel");
        }
     
      	function getAdminname(){
	    	var adminname = nui.get("userid1").getText();
	    	nui.get("userid").setValue(adminname);
	    }
	     function getAdminname1(){
	    	var adminname = nui.get("tutorid1").getText();
	    	nui.get("tutorid").setValue(adminname);
	    }
	    
		    // 选择我的学员
		function selectOmEmployee(){
		
			var t=new Date();
			var month=nui.formatDate(t,"yyyy-MM")
		    //var month="2020-03"
			var json ={nowdate:month,tutorid:nowuserid}

		    nui.ajax({
		        url:"org.gocom.abframe.org.employee.EmpManager.queryTutorReturnStudent.biz.ext",
		       	data: json,
		        type: 'POST',
		        cache: false,
		        async: false,
		        contentType: 'text/json',
		        success: function (text) {
		                   var returnJson = nui.decode(text);
		                   var tutorReturn1=returnJson.emptutor1;
			              	if(returnJson.exception == null){
			              		nui.get("userid").setData(tutorReturn1);
			              	
			              	}else{
	                    		alert("保存失败！");
	                    		nui.get("saveEmptutor").enable();
			              	}        
		                },
		                error: function (jqXHR, textStatus, errorThrown) {
		                    alert(jqXHR.responseText);
		                }
		            });
		}
		            
 	     // 选择我的学员(目前没用上)
		function selectOmEmployee2(){
			var btnEdit = this;
		    nui.open({
		        url:contextPath+"/abframe/org/newOrganization/myStudentEmpQuery.jsp",
		        title: "选择学员",
		        width: 700,
		        height: 430,
		        ondestroy: function (action) {
		            if (action == "ok") {
		                var iframe = this.getIFrameEl();
		                var data = iframe.contentWindow.GetData();
		                data = nui.clone(data);    //必须
		                effectendtime1=data[0].effectendtime;
		                emptutorid=data[0].emptutorid;
		                if (data) {
		                    if(nui.getbyName("tutorReturn.userid")) {nui.getbyName("tutorReturn.userid").setText(data[0].empname);nui.getbyName("tutorReturn.userid").setValue(data[0].userid);}
		                }
		            }
		
		        }
		    });
		}
		        
		     
 	     // 选择导师 单选（目前没用上）
		function selectOmEmployee1(){
			var btnEdit = this;
		    nui.open({
		        url:contextPath+"/machine/SelectEmployee.jsp",
		        title: "选择导师",
		        width: 650,
		        height: 380,
		        ondestroy: function (action) {
		            if (action == "ok") {
		                var iframe = this.getIFrameEl();
		                var data = iframe.contentWindow.GetData();
		                data = nui.clone(data);    //必须
		                if (data) {
		                    if(nui.getbyName("omemptutor.tutorid")) {nui.getbyName("omemptutor.tutorid").setText(data.empname);nui.getbyName("omemptutor.tutorid").setValue(data.userid);}
		                }
		            }
		
		        }
		    });
		}
		function judge(e){
		
		
		  var userid1 =nui.get("userid").getValue();
		  if(userid1==null ||userid1==""){
		  
		  nui.alert("请先选择员工导师关系信息!");
		  nui.get("evaluatetime").setValue("");
		  return;
		  }
		
		  }      

//每月25日开始七日（参数化）内可以反馈当月情况
	function ddu(e){
			var date = e.date;
			var date1=date.getDate();
			if(date1<25){
			e.allowSelect = false;
			}
			}
			
			
	function getNextPlan(e){
	var userid=nui.get("userid").getValue();
	if(userid){
	
	var json={userid:userid}
	nui.ajax({
	    	url:"org.gocom.abframe.org.employee.EmpManager.getNextPlan.biz.ext",
	       	data: json,
	        type: 'POST',
	        cache: false,
	        contentType: 'text/json',
	        success: function (text) {
	                   var returnJson = nui.decode(text);
	                  	nui.get("monthlyachievement").setValue("");
	                  
	                   var nextplan=returnJson.nextplan;
	                    if(nextplan.length>=1){
	                    	if(returnJson.exception == null ){
		              		nui.get("monthlyachievement").setValue(nextplan[0].nextplan);
		              	
		              	}else{
                    		nui.alert("请联系技术人员！");
		              	}        
	                    
	                    }
		              
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                }		
	          })
	     } 
	}	
			
			
			
    </script>
</body>
</html>
