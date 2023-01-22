<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-07-13 14:02:13
  - Description:
-->
<head>
	<title>新增简历</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
    <style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
    </style>
</head>
<body>
	<div class="nui-fit" id="form1">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend >基本信息</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
					<td align="right" style="width:80px;">简历性质:</td>
					<td style="width:120px;" align="left">    
                		<input id="resProp" class="nui-combobox"  required="true" data="[{id: 1,text: '在职员工'},{id: 2,text: '新增员工'}]" onValueChanged="changeProp()"/>
            		</td>
            		<td>
                    </td>
                    <td>
                    	<a class="nui-button" iconCls="icon-upload" id="import" onclick="inportResume()" style="width:120px;">导入人员简历</a>
                    </td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">员工工号:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.userid" id="userid" class="nui-textbox" onblur="queryEmp()" required="true"/>
                		</td>
						<td align="right" style="width:80px;">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.empname" id="empname" class="nui-textbox" required="true"/>
                		</td>
                		<td align="right" style="font-size:12px;width:80px;">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.gender" id="gender" class="nui-dictcombobox" dictTypeId="ABF_GENDER"  />
                		</td>
                		<td align="right" style="width:80px;">出生年月:</td>
                		<td style="width:120px;">    
                    		<input name="resume.birthdate" id="birthdate" class="nui-datepicker" showTodayButton="false"/>
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">身份证号:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.cardno" id="cardno" class="nui-textbox" required="true"/>
                		</td>
						<td align="right" style="width:80px;">参加工作年月:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.workdate" id="workdate" class="nui-monthpicker"/>
                		</td>
                		<td align="right" style="width:80px;">入职年月:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.indate" id="indate" class="nui-monthpicker"/>
                		</td>
                		<td align="right" style="font-size:12px;width:80px;">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.education" id="education" class="nui-dictcombobox" dictTypeId="DEGREE"  />
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">毕业院校:</td>
                		<td align="left" colspan="3">    
                    		<input name="resume.school" id="school" class="nui-textbox" style="width:100%;"/>
                    	</td>
                    	<td align="right" style="width:80px;">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业:</td>
                		<td align="left" colspan="3">    
                    		<input name="resume.specialty" id="specialty" class="nui-textbox" style="width:100%;"/>
                    	</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">当前所在部门:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.orgname" id="orgname" class="nui-textbox"/>
                		</td>
						<td align="right" style="width:80px;">当前职务:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.duty" id="duty" class="nui-textbox"/>
                		</td>
                		<td align="right" style="width:80px;">当前技术等级:</td>
                		<td style="width:120px;" align="left">                                       <%--这个页面已经作废掉了，不用改--%>
                    		<input name="resume.technology" id="technology" class="nui-dictcombobox" dictTypeId="ABF_EMPLEVEL"/>
                		</td>
                		<td align="right" style="width:80px;">人员类型:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.emptype" id="emptype" class="nui-dictcombobox" dictTypeId="AME_EMPTYPE2"/>
                		</td>
                	</tr>
					<tr>
                		<td align="right" style="font-size:12px;width:80px;">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.email" id="email" class="nui-textbox"/>
                		</td>
						<td align="right" style="width:80px;">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.tel" id="tel" class="nui-textbox"/>
                		</td>
					</tr>
					<tr>
						<td align="right" style="font-size:12px;width:80px;">其它说明:</td>
                		<td align="left" colspan="7">    
                    		<input name="resume.otherdescription" id="otherdescription" class="nui-textarea" style="width:100%;height:50px;"/>
					</tr>
				</table>
				<table style="width:100%;">
					<tr>
						<td align="right" style="font-size:12px;width:80px;">专业能力说明:</td>
                		<td align="left" >    
                    		<input name="resume.abilitydescription" id="abilitydescription" class="nui-textarea" style="width:100%;height:100px;"/>
					</tr>
				</table>
			</div>
		</fieldset>
		
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend >工作经历</legend>
			<div style="width:140px;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" iconCls="icon-add" id="add1" onclick="addRow('workExp')">增加</a>
		                        <a class="nui-button" iconCls="icon-remove" id="delete1" onclick="removeRow('workExp')">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
		    <div id="workExp" class="nui-datagrid" style="width:100%;height:auto;" dataField="AmeResumeWorkexp"
	            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
	            <div property="columns">
	            	<div type="checkcolumn" width="20px"></div>
	            	<div field="startdate" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left">服务开始年月
	                	<input property="editor" class="nui-monthpicker" dateFormat="yyyy-MM" inputStyle="text-align: left"/>
	                </div>
	                <div field="enddate" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left">服务截止年月
	                	<input property="editor" class="nui-monthpicker" dateFormat="yyyy-MM" inputStyle="text-align: left"/>
	                </div>
	                <div field="companyname" width="80" headerAlign="center" align="left">公司名称
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left"/>
	                </div>
	                <div field="duty" width="80" headerAlign="center" align="left">担任职务
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left"/>
	                </div>
	                <div field="workdescription" width="200" headerAlign="center" align="left">工作说明
	                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" />
	                </div>
	            </div>
	        </div>
		</fieldset>
		
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend >项目经验 </legend>
			<div style="width:140px;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" iconCls="icon-add" id="add2" onclick="addRow('projExp')">增加</a>
		                        <a class="nui-button" iconCls="icon-remove" id="delete2" onclick="removeRow('projExp')">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
		    <div id="projExp" class="nui-datagrid" style="width:100%;height:auto;" dataField="AmeResumeProjexp"
	            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
	            <div property="columns">
	            	<div type="checkcolumn" width="20px"></div>
	            	<div field="beginenddate" width="80" headerAlign="center" align="left">起止年月
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left"/>
	                </div>
	                <div field="projectname" width="80" headerAlign="center" align="left">项目名称
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left"/>
	                </div>
	                <div field="custname" width="80" headerAlign="center" align="left">客户名称
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left"/>
	                </div>
	                <div field="projectintroduce" width="200" headerAlign="center" align="left">项目介绍
	                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" />
	                </div>
	                <div field="projectduty" width="200" headerAlign="center" align="left">项目职责及主要工作
	                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" />
	                </div>
            	</div>
        	</div>
		</fieldset>
		
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>有关证件（证书）</legend>
			<div style="width:140px;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" iconCls="icon-add" id="add3" onclick="addRow('cert')">增加</a>
		                        <a class="nui-button" iconCls="icon-remove" id="delete3" onclick="removeRow('cert')">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
		    <div id="cert" class="nui-datagrid" style="width:100%;height:auto;" dataField="AmeResumeCert"
	            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true">			            
	            <div property="columns">
	            	<div type="checkcolumn" width="20px"></div>
	            	<div field="cardtype" width="80" headerAlign="center" align="left" renderer="onCertTypeRenderer">证件（证书）类型
	                	<input property="editor" class="nui-dictcombobox" dictTypeId="AME_CERTTYPE" inputStyle="text-align: left"/>
	                </div>
	                <div field="cardno" width="80" headerAlign="center" align="left">证件号码
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left"/>
	                </div>
	                <div field="startdate" width="80" headerAlign="center" dateFormat="yyyy-MM-dd" renderer="dealdate" align="left">有效开始日期
	                	<input property="editor" class="nui-datepicker" inputStyle="text-align: left" dateFormat="yyyy-MM-dd"/>
	                </div>
	                <div field="enddate" width="80" headerAlign="center" dateFormat="yyyy-MM-dd" renderer="dealdate" align="left">有效截止日期
	                	<input property="editor" class="nui-datepicker" inputStyle="text-align: left" dateFormat="yyyy-MM-dd"/>
	                </div>
	                <div field="remark" width="200" headerAlign="center" align="left">备注
	                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" />
	                </div>
            	</div>
        	</div>
	    </fieldset>
	</div>
	
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="saveExpRei" iconCls="icon-ok" style="width: 60px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" id="closeExpRei" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
	</div>
	
	
	<script type="text/javascript">
		nui.parse();
		init();
		var form = new nui.Form("form1");

		function init(){
			nui.get("userid").disable();
			nui.get("empname").disable();
			nui.get("gender").disable();
			nui.get("birthdate").disable();
			nui.get("cardno").disable();
			nui.get("workdate").disable();
			nui.get("indate").disable();
			nui.get("education").disable();
			nui.get("school").disable();
			nui.get("specialty").disable();
			nui.get("orgname").disable();
			nui.get("duty").disable();
			nui.get("technology").disable();
			nui.get("emptype").disable();
			nui.get("email").disable();
			nui.get("tel").disable();
			nui.get("abilitydescription").disable();
			nui.get("otherdescription").disable();
			nui.get("add1").disable();
			nui.get("add2").disable();
			nui.get("add3").disable();
			nui.get("delete1").disable();
			nui.get("delete2").disable();
			nui.get("delete3").disable();
		}
		
		function changeProp(){
			var resProp = nui.get("resProp").getValue();
			if(resProp==1){
				nui.get("userid").enable();
				nui.get("empname").disable();
				nui.get("gender").disable();
				nui.get("birthdate").disable();
				nui.get("cardno").disable();
				nui.get("workdate").disable();
				nui.get("indate").disable();
				nui.get("education").disable();
				nui.get("school").disable();
				nui.get("specialty").disable();
				nui.get("orgname").disable();
				nui.get("duty").disable();
				nui.get("technology").disable();
				nui.get("emptype").disable();
				nui.get("email").disable();
				nui.get("tel").disable();
				nui.get("abilitydescription").disable();
				nui.get("otherdescription").disable();
				nui.get("add1").disable();
				nui.get("add2").disable();
				nui.get("add3").disable();
				nui.get("delete1").disable();
				nui.get("delete2").disable();
				nui.get("delete3").disable();
			}
			else if(resProp==2){
				nui.get("userid").disable();
				nui.get("userid").setValue("");
				nui.get("empname").enable();
				nui.get("gender").enable();
				nui.get("birthdate").enable();
				nui.get("cardno").enable();
				nui.get("workdate").enable();
				nui.get("indate").enable();
				nui.get("education").enable();
				nui.get("school").enable();
				nui.get("specialty").enable();
				nui.get("orgname").enable();
				nui.get("duty").enable();
				nui.get("technology").enable();
				nui.get("emptype").enable();
				nui.get("email").enable();
				nui.get("tel").enable();
				nui.get("abilitydescription").enable();
				nui.get("otherdescription").enable();
				nui.get("add1").enable();
				nui.get("add2").enable();
				nui.get("add3").enable();
				nui.get("delete1").enable();
				nui.get("delete2").enable();
				nui.get("delete3").enable();
			}
		}
		
		function queryEmp(){
			var userid = nui.get("userid").getValue();
			var json = nui.encode({"userid":userid});
			nui.ajax({
				url: "com.primeton.eos.ame_resume.resumeManage.queryEmpByUserid.biz.ext",
				data: json,
				type: 'POST',
				cache: false,
				contentType: 'text/json',
				success: function(text){
					var temp = text.temp;
					var returnVal = text.returnValue;
					if(returnVal==1){
						alert("此工号对应的简历已经存在！");
						nui.get("userid").setValue("");
						nui.get("empname").setValue("");
						nui.get("gender").setValue("");
						nui.get("birthdate").setValue("");
						nui.get("cardno").setValue("");
						nui.get("workdate").setValue("");
						nui.get("indate").setValue("");
						nui.get("education").setValue("");
						nui.get("school").setValue("");
						nui.get("specialty").setValue("");
						nui.get("orgname").setValue("");
						nui.get("duty").setValue("");
						nui.get("technology").setValue("");
						nui.get("emptype").setValue("");
						nui.get("email").setValue("");
						nui.get("tel").setValue("");
						return;
					}else if(temp==null){
						alert("该工号不存在，请确认是否正确输入！");
						nui.get("empname").setValue("");
						nui.get("gender").setValue("");
						nui.get("birthdate").setValue("");
						nui.get("cardno").setValue("");
						nui.get("workdate").setValue("");
						nui.get("indate").setValue("");
						nui.get("education").setValue("");
						nui.get("school").setValue("");
						nui.get("specialty").setValue("");
						nui.get("orgname").setValue("");
						nui.get("duty").setValue("");
						nui.get("technology").setValue("");
						nui.get("emptype").setValue("");
						nui.get("email").setValue("");
						nui.get("tel").setValue("");
					}else{
						nui.get("empname").setValue("");
						nui.get("gender").setValue("");
						nui.get("birthdate").setValue("");
						nui.get("cardno").setValue("");
						nui.get("workdate").setValue("");
						nui.get("indate").setValue("");
						nui.get("education").setValue("");
						nui.get("school").setValue("");
						nui.get("specialty").setValue("");
						nui.get("orgname").setValue("");
						nui.get("duty").setValue("");
						nui.get("technology").setValue("");
						nui.get("emptype").setValue("");
						nui.get("email").setValue("");
						nui.get("tel").setValue("");
					
						nui.get("empname").enable();
						nui.get("gender").enable();
						nui.get("birthdate").enable();
						nui.get("cardno").enable();
						nui.get("workdate").enable();
						nui.get("indate").enable();
						nui.get("education").enable();
						nui.get("school").enable();
						nui.get("specialty").enable();
						nui.get("orgname").enable();
						nui.get("duty").enable();
						nui.get("technology").enable();
						nui.get("emptype").enable();
						nui.get("email").enable();
						nui.get("tel").enable();
						nui.get("abilitydescription").enable();
						nui.get("otherdescription").enable();
						nui.get("add1").enable();
						nui.get("add2").enable();
						nui.get("add3").enable();
						nui.get("delete1").enable();
						nui.get("delete2").enable();
						nui.get("delete3").enable();
				
						var tempname = temp.empname;
						nui.get("empname").setValue(tempname);
						var tempgender = temp.gender;
						nui.get("gender").setValue(tempgender);
						var tempbirthday = temp.birthdate;
						nui.get("birthdate").setValue(tempbirthday);
						var tempcardno = temp.cardno;
						nui.get("cardno").setValue(tempcardno);
						var tempindate = temp.indate;
						nui.get("indate").setValue(tempindate);
						var tempmail = temp.oemail;
						nui.get("email").setValue(tempmail);
						var temptel = temp.mobileno;
						nui.get("tel").setValue(temptel);
						var tempdegree = temp.degree;
						nui.get("education").setValue(tempdegree);
					}
    			},
    			error: function(jqXHR, textStatus, errorThrown){
    				alert(jqXHR.responseText);
    			}
    		});
		}
		
		function inportResume(){
			nui.open({
	            url: "<%=request.getContextPath() %>/ame_resume/importResume.jsp",
	            title: "导入简历", 
				width: 700,
	            height: 150,
	            allowDrag:true,
	            ondestroy: function (action) {
	            	if(action == "ok"){
	            		var iframe = this.getIFrameEl();
		            	var data = iframe.contentWindow.getData();
		            	data= nui.clone(data);
		            	data = nui.decode(data);
		            	//alert(nui.encode(data));
		            	if(data.resultMap.returnVal==0){
		            		/* var ability = data.resume.abilitydescription;
							KindEditor.html("#ke",ability); */
		            		form.setData(data.resume);
		            		var workExp= data.workExp;
		            		var count = 0;
							for(var pro in workExp){
							   if(workExp.hasOwnProperty(pro)) count++;
							}
		            		for(i=0;i<count;i++){
		            			var temp = "temp"+i;
								var startdate = nui.encode(workExp[eval("temp")].startdate);
								if(startdate==""){
		            				startdate=null;
		            			}else{
		            				startdate = startdate.substring(1,startdate.length-1);
		            			}
		            			var enddate = nui.encode(workExp[eval("temp")].enddate);
		            			if(enddate==""){
		            				enddate=null;
		            			}else{
		            				enddate = enddate.substring(1,enddate.length-1);
		            			}
		            			var companyname = nui.encode(workExp[eval("temp")].companyname);
		            			if(companyname==""){
		            				companyname=null;
		            			}else{
		            				companyname = companyname.substring(1,companyname.length-1);
		            			}
		            			var duty = nui.encode(workExp[eval("temp")].duty);
		            			if(duty==""){
		            				duty=null;
		            			}else{
		            				duty = duty.substring(1,duty.length-1);
		            			}
		            			var workdescription = nui.encode(workExp[eval("temp")].workdescription);
		            			if(workdescription==""){
		            				workdescription=null;
		            			}else{
		            				workdescription = workdescription.substring(1,workdescription.length-1);
		            			}
		            			var newRow = { name: "New Row",
								startdate: startdate,
								enddate: enddate,
								companyname: companyname,
								duty: duty,
								workdescription: workdescription
								};
								var grid = nui.get('workExp');
								grid.addRow(newRow);
		            		}
		            		var projExp= data.projExp;
		            		var count1 = 0;
							for(var pro in projExp){
							   if(projExp.hasOwnProperty(pro)) count1++;
							}
		            		for(i=0;i<count1;i++){
		            			var temp = "temp"+i;
		            			var beginenddate = nui.encode(projExp[eval("temp")].beginenddate);
		            			if(beginenddate==""){
		            				beginenddate=null;
		            			}else{
		            				beginenddate = beginenddate.substring(1,beginenddate.length-1);
		            			}
		            			var projectname = nui.encode(projExp[eval("temp")].projectname);
		            			if(projectname==""){
		            				projectname=null;
		            			}else{
		            				projectname = projectname.substring(1,projectname.length-1);
		            			}
		            			var custname = nui.encode(projExp[eval("temp")].custname);
		            			if(custname==""){
		            				custname=null;
		            			}else{
		            				custname = custname.substring(1,custname.length-1);
		            			}
		            			var projectintroduce = nui.encode(projExp[eval("temp")].projectintroduce);
		            			if(projectintroduce==""){
		            				projectintroduce=null;
		            			}else{
		            				projectintroduce = projectintroduce.substring(1,projectintroduce.length-1);
		            			}
		            			var projectduty = nui.encode(projExp[eval("temp")].projectduty);
		            			if(projectduty==""){
		            				projectduty=null;
		            			}else{
		            				projectduty = projectduty.substring(1,projectduty.length-1);
		            			}
		            			var newRow = { name: "New Row",
								beginenddate: beginenddate,
								projectname: projectname,
								custname: custname,
								projectintroduce: projectintroduce,
								projectduty: projectduty
								};
								var grid = nui.get('projExp');
								grid.addRow(newRow);
		            		}
		            		var cert= data.cert;
		            		var count2 = 0;
							for(var pro in cert){
							   if(cert.hasOwnProperty(pro)) count2++;
							}
		            		for(i=0;i<count2;i++){
		            			var temp = "temp"+i;
		            			var cardtype = nui.encode(cert[eval("temp")].cardtype);
		            			if(cardtype==""||cardtype=="null"){
		            				cardtype=null;
		            			}else{
		            				cardtype = cardtype.substring(1,cardtype.length-1);
		            			}
		            			var cardno = nui.encode(cert[eval("temp")].cardno);
		            			if(cardno==""){
		            				cardno=null;
		            			}else{
		            				cardno = cardno.substring(1,cardno.length-1);
		            			}
		            			var startdate = nui.encode(cert[eval("temp")].startdate);
		            			if(startdate==""){
		            				startdate=null;
		            			}else{
		            				startdate = startdate.substring(1,startdate.length-1);
		            			}
		            			var enddate = nui.encode(cert[eval("temp")].enddate);
		            			if(enddate==""){
		            				enddate=null;
		            			}else{
		            				enddate = enddate.substring(1,enddate.length-1);
		            			}
		            			var remark = nui.encode(cert[eval("temp")].remark);
		            			if(remark==""){
		            				remark=null;
		            			}else{
		            				remark = remark.substring(1,remark.length-1);
		            			}
		            			var newRow = { name: "New Row",
								cardtype: cardtype,
								cardno: cardno,
								startdate: startdate,
								enddate: enddate,
								remark: remark
								};
								var grid = nui.get('cert');
								grid.addRow(newRow);
		            		}
		            		nui.get("resProp").disable();
		            		nui.get("empname").enable();
							nui.get("gender").enable();
							nui.get("birthdate").enable();
							nui.get("cardno").enable();
							nui.get("workdate").enable();
							nui.get("indate").enable();
							nui.get("education").enable();
							nui.get("school").enable();
							nui.get("specialty").enable();
							nui.get("orgname").enable();
							nui.get("duty").enable();
							nui.get("technology").enable();
							nui.get("emptype").enable();
							nui.get("email").enable();
							nui.get("tel").enable();
							nui.get("abilitydescription").enable();
							nui.get("otherdescription").enable();
							nui.get("add1").enable();
							nui.get("add2").enable();
							nui.get("add3").enable();
							nui.get("delete1").enable();
							nui.get("delete2").enable();
							nui.get("delete3").enable();
							nui.get("import").disable();
			            	if(data.resultMap.content == null||data.resultMap.content == ""){
			            		alert("导入成功！");
			            	}else{
			            		var content = data.resultMap.content;
			            		alert("导入成功！其中的"+content+"输入不符合规范，请在页面上手动选择！");
			            	}
		            	}else{
		            		alert("导入失败，请确认格式与模板相同后重新尝试！");
		            	}
	            	}
	            }
        	});
		}
		
		function onOk(){
			var a =[];
			var resume = form.getData();
			var workExp = nui.get("workExp").getData();
			if(workExp==a){
				workExp = null;
			}
			var projExp = nui.get("projExp").getData();
			if(projExp==a){
				projExp = null;
			}
			var cert = nui.get("cert").getData();
			if(cert==a){
				cert = null;
			}
    		form.validate();
    		var json = nui.encode({"resume":resume.resume, "AmeResumeWorkexp":workExp, "AmeResumeProjexp":projExp, "AmeResumeCert":cert});
    		if(form.validate()){
	    		nui.ajax({
	    			url: "com.primeton.eos.ame_resume.resumeManage.addResume.biz.ext",
	    			data: json,
	    			type: 'POST',
	    			cache: false,
	    			contentType: 'text/json',
	    			success: function(text){
	    				if(text.returnVal==1){
	    					alert("增加成功");
		    				CloseWindow("save");
		    			}else if(text.returnVal==2){
		    				alert("增加基本信息失败，请重新尝试");
		    			}else if(text.returnVal==3){
		    				alert("增加工作经历失败，请重新尝试");
		    			}else if(text.returnVal==4){
		    				alert("增加项目经验失败，请重新尝试");
		    			}else if(text.returnVal==5){
		    				alert("增加有关证件（证书）失败，请重新尝试");
		    			}else if(text.returnVal==6){
		    				alert("该工号对应的员工简历已存在，请确认是否正输入！");
		    			}else{
		    				alert("增加失败，请重新尝试");
		    			}
	    			},
	    			error: function(jqXHR, textStatus, errorThrown){
	    				alert(jqXHR.responseText);
	    				CloseWindow();
	    			}
	    		});
    		}else{
    			return;
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
    			if (confirm("数据被修改了，是否先保存？")){
    				return false;
    			}
    		}
    		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
    		else window.close();
    	}
		
		function addRow(gridid){
			var newRow = { name: "New Row",status: "0" };
	        var grid = nui.get(gridid);
	        grid.addRow(newRow, 0);
		}
		
		function removeRow(gridid){
			var grid = nui.get(gridid);
	        var rows = grid.getSelecteds();
	        var num = rows.length
	        if (rows.length > 0) {
	        	if(confirm("确定删除"+num+"条记录吗？")){
	        		grid.removeRows(rows, false);
	        	}else{
	        		return false;
	        	}
	        }else{
				alert("请选择一条记录！"); 
	        }
		}
		
		function onCertTypeRenderer(e){
			return nui.getDictText('AME_CERTTYPE',e.value);//设置业务字典值
		}
		function dealdate(e){
			if(e.value){
			return e.value.substring(0,10);
			}
		}
	</script>
</body>
</html>