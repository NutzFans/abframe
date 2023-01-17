<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<%
	String contextPath=request.getContextPath();
 %>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-07-18 17:02:40
  - Description:
-->
<head>
	<title>修改简历</title>
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
	<div class="mini-panel" title="简历详情" style="width: 100%;">
		<fieldset style="border:solid 1px #aaa;padding:3px;">
		<input name="resume.resumeid" id="resumeid" class="nui-hidden">
			<legend >基本信息</legend>
			<div style="padding:5px;">
				<table style="width:100%;">
					<tr>
						<td align="right" style="width:80px;">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.empname" id="empname" class="nui-textbox" required="true" style="width:74px;"/>
                    		<a  class="nui-button" id="selectEmp" onclick="selectOmEmployee()">选择</a>
                		</td>
						<td align="right" style="width:80px;">员工工号:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.userid" id="userid" class="nui-textbox" onblur="queryEmp()" width="100%"/>
                		</td>
                		<td align="right" style="font-size:12px;width:80px;">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.gender" id="gender" class="nui-dictcombobox" dictTypeId="ABF_GENDER" width="100%" />
                		</td>
                		<td align="right" style="width:80px;">出生年月:</td>
                		<td style="width:120px;">    
                    		<input name="resume.birthdate" id="birthdate" class="nui-datepicker" showTodayButton="false" width="100%"/>
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">身份证号:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.cardno" id="cardno" class="nui-textbox" required="true" width="100%" maxLength="20"/>
                		</td>
						<td align="right" style="width:80px;">参加工作年月:</td>
                		<td style="width:100px;" align="left">    
                    		<input name="resume.workdate" id="workdate" class="nui-monthpicker" width="100%"/>
                		</td>
                		<td align="right" style="width:80px;">入职年月:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.indate" id="indate" class="nui-monthpicker" width="100%"/>
                		</td>
                		<td align="right" style="font-size:12px;width:80px;">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;历:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.education" id="education" class="nui-dictcombobox" dictTypeId="DEGREE" width="100%" />
                		</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">毕业院校:</td>
                		<td align="left" colspan="3">    
                    		<input name="resume.school" id="school" class="nui-textbox" style="width:100%;" maxLength="255"/>
                    	</td>
                    	
                    	<td align="right" style="width:80px;">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业:</td>
                		<td align="left" colspan="3">    
                    		<input name="resume.specialty" id="specialty" class="nui-textbox" style="width:100%;" maxLength="255"/>
                    	</td>
					</tr>
					<tr>
						<td align="right" style="width:80px;">当前所在部门:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.orgname" id="orgname" class="nui-textbox" width="100%" maxLength="64"/>
                		</td>
						<td align="right" style="width:80px;">当前职务:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.duty" id="duty" class="nui-textbox" style="width:100%;" maxLength="255"/>
                		</td>
                		<td align="right" style="width:80px;">技术级别:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.technology" id="technology" class="nui-dictcombobox" dictTypeId="AME_TECH" width="100%"/>
                		</td>
                		<td align="right" style="width:80px;">人员类型:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.emptype" id="emptype" class="nui-dictcombobox" dictTypeId="AME_EMPTYPE2" width="100%"/>
                		</td>
                	</tr>
					<tr>
                		<td align="right" style="font-size:12px;width:80px;">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.email" id="email" class="nui-textbox" width="100%" maxLength="128"/>
                		</td>
						<td align="right" style="width:80px;">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话:</td>
                		<td style="width:120px;" align="left">    
                    		<input name="resume.tel" id="tel" class="nui-textbox" style="width:100%;" maxLength="12" />
                		</td>
                		<td align="right">    
                    		<input name="resume.interviewstatus" id="interviewstatus" class="nui-hidden"value="8"/>
                    	</td>
					</tr>
					<tr>
						<td align="right" style="font-size:12px;width:80px;" valign="top">专业能力综述:</td>
                		<td align="left" colspan="7">    
                    		<input name="resume.abilitydescription" id="abilitydescription" class="nui-textarea" style="width:100%;height:150px;" maxLength="2048"/>
					</tr>
					<tr>
						<td align="right" style="font-size:12px;width:80px;">其它说明:</td>
                		<td align="left" colspan="7">    
                    		<input name="resume.otherdescription" id="otherdescription" class="nui-textbox" style="width:100%;" maxLength="255"/>
                    	</td>
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
		    <div id="workExp" class="nui-datagrid" style="width:100%;height:auto;" dataField="workExp"
	            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
	            url="com.primeton.eos.ame_resume.resumeManage.getWorkExp.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
	            <div property="columns">
	            	<div type="checkcolumn" width="20px"></div>
	            	<input field="resworkexpid" class="nui-hidden" visible="false">
	            	<div field="startdate" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left" allowSort="true">服务开始年月
	                	<input property="editor" class="nui-monthpicker" dateFormat="yyyy-MM" inputStyle="text-align: left"/>
	                </div>
	                <div field="enddate" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left">服务截止年月
	                	<input property="editor" class="nui-monthpicker" dateFormat="yyyy-MM" inputStyle="text-align: left"/>
	                </div>
	                <div field="companyname" width="80" headerAlign="center" align="left">公司名称
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
	                </div>
	                <div field="duty" width="80" headerAlign="center" align="left" allowCellWrap="true">担任职务
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
	                </div>
	                <div field="workdescription" width="200" headerAlign="center" align="left" allowCellWrap="true">工作说明
	                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
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
		    <div id="projExp" class="nui-datagrid" style="width:100%;height:auto;" dataField="projExp"
	            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
	            url="com.primeton.eos.ame_resume.resumeManage.getProjExp.biz.ext" allowSortColumn="true" allowCellWrap="true">			            
	            <div property="columns">
	            	<div type="checkcolumn" width="20px"></div>
	            	<input field="resprojexpid" class="nui-hidden" visible="false">
	            	<div field="beginenddate" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left" allowSort="true">开始年月
	                	<input property="editor" class="nui-monthpicker" dateFormat="yyyy-MM" inputStyle="text-align: left"/>
	                </div>
	                <div field="enddate" width="80" headerAlign="center" dateFormat="yyyy-MM" align="left">截止年月
	                	<input property="editor" class="nui-monthpicker" dateFormat="yyyy-MM" inputStyle="text-align: left"/>
	                </div>
	                <div field="custname" width="80" headerAlign="center" align="left">客户名称
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
	                </div>
	                <div field="projectname" width="80" headerAlign="center" align="left">项目名称
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="255"/>
	                </div>
	                <div field="projectintroduce" width="200" headerAlign="center" align="left">项目介绍
	                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
	                </div>
	                <div field="projectduty" width="200" headerAlign="center" align="left">项目职责及主要工作
	                	<input property="editor" class="nui-textarea" style="width: 200px" minWidth="200" minHeight="80" maxLength="255"/>
	                </div>
            	</div>
        	</div>
		</fieldset>
		
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>有关证件(书)</legend>
			<div style="width:200px;">
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		                <tr>
		                    <td style="width:100%;">
		                        <a class="nui-button" iconCls="icon-add" id="add3" onclick="addCert()">增加</a>
		                        <a class="nui-button" iconCls="icon-edit" id="add3" onclick="updateCert()">修改</a>
		                        <a class="nui-button" iconCls="icon-remove" id="delete3" onclick="removeRow('cert')">删除</a>
		                    </td>
		                </tr>
		            </table>           
		        </div>
		    </div>
		    <div id="cert" class="nui-datagrid" style="width:100%;height:auto;" dataField="cert"
	            showPager="false" allowCellEdit="true" allowCellSelect="true" multiSelect="true" editNextOnEnterKey="true"
	            url="com.primeton.eos.ame_resume.resumeManage.getCert.biz.ext" allowCellWrap="true">			            
	            <div property="columns">
	            	<div type="checkcolumn" width="20px"></div>
	            	<input field="rescertid" class="nui-hidden" visible="false">
	                <div field="cardtype" width="120" renderer="onCertTypeRenderer" headerAlign="center" align="left">证件(书)类型
	                	<input property="editor" class="nui-dictcombobox" inputStyle="text-align: left" multiSelect="false" dictTypeId="AME_CERTTYPE"/>
	                </div>
	                <div field="cardno" width="80" headerAlign="center" align="left">证件(书)号码
	                	<input property="editor" class="nui-textbox" vtype="float" inputStyle="text-align: left" maxLength="32"/>
	                </div>
	                <div field="startdate" width="120" headerAlign="center" dateFormat="yyyy-MM-dd"  align="left">有效开始日期
	                	<input property="editor" class="nui-datepicker" inputStyle="text-align: left"/>
	                </div>
	                <div field="enddate" width="120" headerAlign="center" dateFormat="yyyy-MM-dd"  align="left">有效截止日期
	                	<input property="editor" class="nui-datepicker" inputStyle="text-align: left"/>
	                </div>
	                <div field="files" renderer="onFileRenderer" width="200" hight="100"  align="center" headerAlign="center">附件</div>
	                <div field="fileid" displayField="filename" width="200" headerAlign="center" align="left" visible="false">附件
	                	<input property="editor" class="nui-hidden" style="width: 200px" minWidth="200" minHeight="80" />
	                </div>
	                <div field="remark" width="80" headerAlign="center" align="left">备注
	                	<input property="editor" class="nui-textarea" style="width: 150px" minWidth="200" minHeight="80" maxLength="255"/>
	                </div>
            	</div>
        	</div>
	    </fieldset>
	</div>
	</div>
		<div style="text-align: center;padding: 10px;" class="nui-toolbar">
			<a class="nui-button" onclick="onOk()" id="saveExpRei" iconCls="icon-ok" style="width: 60px;margin-right: 20px;">保存</a>
			<a class="nui-button" onclick="onCancel('cancel')" id="closeResume" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
			<a class="nui-button" iconCls="icon-upload" id="importResume" onclick="inportResume()" style="width:120px;">导入我的简历</a>
			<a class="nui-button" onclick="downloadResume()" id="exportResume" iconCls="icon-download">导出我的简历</a>
		</div>
	
	<form name="viewlist1" id="viewlist1" action="com.primeton.eos.ame_common.ameExportCommon.flow" method="post">
		<input type="hidden" name="_eosFlowAction" value="action0" filter="false"/>
		<input type="hidden" name="downloadFile" filter="false"/>
		<input type="hidden" name="fileName" filter="false"/>
	</form> 
	
	
	
	<script type="text/javascript">
		nui.parse();
		var form = new nui.Form("form1");
		var workExp = nui.get("workExp");
		var projExp = nui.get("projExp");
		var cert = nui.get("cert");
		var action = "";
		var flag = '<%=request.getParameter("flag")%>';
		if(flag=='1'){
			SetData();
			$('#selectEmp').hide();
			$('#closeResume').hide();
		}
		
		function SetData(data){
			if(data){
				if(data.action=="add"){
					$('#importResume').hide();
					$('#exportResume').hide();
					action="add";
				}else if(data.action=="update"){
					$('#selectEmp').hide();
					$('#importResume').hide();
					$('#exportResume').hide();
					action="update";
					data = nui.clone(data);
					var json = data.resume;
					form.setData(json);
		            workExp.load({ resumeid: data.resumeid});
		            workExp.sortBy("startdate", "desc");
		            projExp.load({ resumeid: data.resumeid});
		            projExp.sortBy("beginenddate", "desc");
		            cert.load({ resumeid: data.resumeid});
		            var userid = nui.get("userid").getValue();
		            if(!(userid==null || userid=="")){
		            	nui.get("userid").disable();
		            }
	            }
            }else{
            	action="myResume";
            	nui.ajax({
            		url: "com.primeton.eos.ame_resume.resumeManage.queryMyResume.biz.ext",
            		data: {},
            		type: 'POST',
	    			cache: false,
	    			contentType: 'text/json',
	    			success: function(text){
	    				var json = text;
    					form.setData(json);
	    				if(text.resume.resumeid==null||text.resume.resumeid==""){
							alert("您还没有保存简历，请填写相关信息后保存！");
	    					return;
	    				}else{
	    					workExp.load({ resumeid: text.resume.resumeid});
	    					workExp.sortBy("startdate", "desc");
				            projExp.load({ resumeid: text.resume.resumeid});
				            projExp.sortBy("beginenddate", "desc");
				            cert.load({ resumeid: text.resume.resumeid});
	    				}
	    				nui.get("userid").disable();
	    			},
	    			error: function(jqXHR, textStatus, errorThrown){
	    			}
            	});
            }
		}
		
		function SetData1(){
			nui.ajax({
            		url: "com.primeton.eos.ame_resume.resumeManage.queryMyResume.biz.ext",
            		data: {},
            		type: 'POST',
	    			cache: false,
	    			contentType: 'text/json',
	    			success: function(text){
	    				var json = text;
    					form.setData(json);
    					var resumeid = json.resume.resumeid;
    					if(resumeid !=null && resumeid !="" && resumeid !='null'){
    						workExp.load({ resumeid: resumeid});
	    					workExp.sortBy("startdate", "desc");
				            projExp.load({ resumeid: resumeid});
				            projExp.sortBy("beginenddate", "desc");
				            cert.load({ resumeid: resumeid});
    					}
	    				nui.get("userid").disable();
	    			},
	    			error: function(jqXHR, textStatus, errorThrown){
	    			}
            	});
		}
		
		function onOk(){
			var addURL = "com.primeton.eos.ame_resume.resumeManage.addResume.biz.ext";
			var updateURL = "com.primeton.eos.ame_resume.resumeManage.updateResume.biz.ext";
			var saveURL = "";
		
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
			var resumeid = nui.get("resumeid").getValue();
			if(resumeid==null||resumeid==""){
				if(action=="myResume"){
					if(form.validate()){
						if(confirm("确认新增简历吗？")){
						
						}else{
							return;
						}
					}
				}
				saveURL = addURL;
				form.validate();
	    		var json = nui.encode({"resume":resume.resume, "AmeResumeWorkexp":workExp, "AmeResumeProjexp":projExp, "AmeResumeCert":cert});
	    		if(form.validate()){
		    		nui.ajax({
		    			url: saveURL,
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
			    			if(action=="myResume"){
				    			SetData1();
				    		}
		    			},
		    			error: function(jqXHR, textStatus, errorThrown){
		    				CloseWindow();
		    			}
		    		});
	    		}else{
	    			return;
	    		}
			}else{
				if(action=="myResume"){
					if(form.validate()){
						if(confirm("确认修改简历吗？")){
						
						}else{
							return;
						}
					}
				}
				saveURL = updateURL;
	    		form.validate();
	    		var json = nui.encode({"resume":resume.resume, "AmeResumeWorkexp":workExp, "AmeResumeProjexp":projExp, "AmeResumeCert":cert});
	    		if(form.validate()){
		    		nui.ajax({
		    			url: saveURL,
		    			data: json,
		    			type: 'POST',
		    			cache: false,
		    			contentType: 'text/json',
		    			success: function(text){
		    				if(text.returnVal==1){
		    					alert("修改成功");
			    				CloseWindow("save");
			    			}else if(text.returnVal==2){
			    				alert("修改基本信息失败，请重新尝试");
			    			}else if(text.returnVal==3){
			    				alert("修改工作经历失败，请重新尝试");
			    			}else if(text.returnVal==4){
			    				alert("修改项目经验失败，请重新尝试");
			    			}else if(text.returnVal==5){
			    				alert("修改有关证件（证书）失败，请重新尝试");
			    			}
			    			else if(text.returnVal==6){
			    				alert("删除原有数据失败，请重新尝试");
			    			}else{
			    				alert("修改失败，请重新尝试");
			    			}
		    			},
		    			error: function(jqXHR, textStatus, errorThrown){
		    				CloseWindow();
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
	        var num = rows.length;
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
		
		function addCert(){
			nui.open({
				url: "<%=request.getContextPath() %>/ame_resume/addCertDetail.jsp",
                title: "增加证书详情",
                width: 700,
                height: 400,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = {"action": "add"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {//.
                        	var cardtype = data.cardtype;
                        	var cardno = data.cardno;
                        	var startdate = data.startdate;
                        	if(startdate!='null' && startdate!=null && startdate!=""){
                        		startdate = FormatDate(startdate);
                        	}
                        	var enddate = data.enddate;
                        	if(enddate!='null' && enddate!=null && enddate!=""){
                        		enddate = FormatDate(enddate);
                        	}
                        	var remark = data.remark;
                        	var fileid = data.fileid;
                        	if(fileid == null ||fileid==""||fileid=='null'){
                        		var newRow = { name: "New Row",
								cardtype: cardtype,
								cardno: cardno,
								startdate: startdate,
								enddate: enddate,
								remark: remark,
								fileid:  fileid
								};
								var grid = nui.get('cert');
								grid.addRow(newRow);
                        	}else{
                        		var json = nui.encode({"fileid":fileid});
	                        	nui.ajax({
					    			url: "com.primeton.eos.ame_resume.resumeManage.queryUploadFiles.biz.ext",
					    			data: json,
					    			type: 'POST',
					    			cache: false,
					    			contentType: 'text/json',
					    			success: function(o){
					    				var files = o.files;
					    				var newRow = { name: "New Row",
										cardtype: cardtype,
										cardno: cardno,
										startdate: startdate,
										enddate: enddate,
										remark: remark,
										fileid:  fileid,
										files:  files
										};
										var grid = nui.get('cert');
										grid.addRow(newRow);
					    			}
					    		});
                        	}
                        }
                    }
                }
			});
		}
		
		function onCertTypeRenderer(e){
			return nui.getDictText('AME_CERTTYPE',e.value);//设置业务字典值
		}
		
		function selectOmEmployee(){
	        nui.open({
	            url: "<%=request.getContextPath() %>/machine/SelectEmployee.jsp",
                title: "选择员工",
                width: 430,
                height: 400,
                ondestroy: function (action) {
                    if (action == "ok") {
                        var iframe = this.getIFrameEl();
                        var data = iframe.contentWindow.GetData();
                        data = nui.clone(data);    //必须
                        if (data) {
                        	var empname = data.empname == null ? "" : data.empname;
                            nui.get("empname").setValue(empname);
                            var userid = data.userid == null ? "" : data.userid;
                            nui.get("userid").setValue(userid);
                            nui.get("userid").disable();
                            var gender = data.gender == null ? "" : data.gender;
                            nui.get("gender").setValue(gender);
                            var birthdate = data.birthdate == null ? "" : data.birthdate;
                            nui.get("birthdate").setValue(birthdate);
                            var cardno = data.cardno == null ? "" : data.cardno;
                            nui.get("cardno").setValue(cardno);
                            var degree = data.degree == null ? "" : data.degree;
                            nui.get("education").setValue(degree);
                            var indate = data.indate == null ? "" : data.indate;
                            nui.get("indate").setValue(indate);
                            var orgname = data.orgname == null ? "" : data.orgname;
                            nui.get("orgname").setValue(orgname);
                            var oemail = data.oemail == null ? "" : data.oemail;
                            nui.get("email").setValue(data.oemail);
                            var mobileno = data.mobileno == null ? "" : data.mobileno;
                            nui.get("tel").setValue(mobileno);
                        }
                    }

                }
            });
        }
        
        function inportResume(){
			nui.open({
	            url: "<%=request.getContextPath() %>/ame_resume/importResume.jsp",
	            title: "导入简历", 
				width: 700,
	            height: 200,
	            allowDrag:true,
	            ondestroy: function (action) {
	            	if(action == "ok"){
	            		var iframe = this.getIFrameEl();
		            	var data1 = iframe.contentWindow.getData();
            			data = nui.decode(data1);
		            		
		            	//alert(nui.encode(data));
		            	if(data.resultMap.returnVal=='0'||data.resultMap.returnVal==0){
		            		/* var ability = data.resume.abilitydescription;
							KindEditor.html("#ke",ability); */
							data.resume.resume.abilitydescription = data.resume.resume.abilitydescription.split("<br>").join("\n");
							data.resume.resume.abilitydescription = data.resume.resume.abilitydescription.split("<br/>").join("\t");
							data.resume.resume.abilitydescription = data.resume.resume.abilitydescription.split("<br1>").join("'");
							data.resume.resume.abilitydescription = data.resume.resume.abilitydescription.split("<br2>").join("\"");
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
		
		function downloadResume(){
	    	var resumeid = nui.get("resumeid").getValue();
	    	if(resumeid == null || resumeid == ""){
	    		alert("你的简历暂时不存在，请保存后导出！");
	    	}else{
		    	var json = nui.encode({"resumeid":resumeid});
		    	nui.ajax({
	    			url: "com.primeton.eos.ame_resume.resumeManage.exportResume.biz.ext",
	    			data: json,
	    			type: 'POST',
	    			cache: false,
	    			contentType: 'text/json',
	    			success: function(text){
						nui.unmask();
			     		var filePath = text.downloadFile;
			        	var fileName = "简历";
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
	    			error: function(jqXHR, textStatus, errorThrown){
	    				CloseWindow();
	    			}
	    		});
    		}
	    }
	    
	    function onFileRenderer(e) {
	        var tempSrc = "";
        	//长度为1，不换行
        	if(e.record.files==null){
        		return;
        	}
        	if(e.record.files.length == 1){
	        	tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[0].fileId + "'>" + e.record.files[0].fileName + "</a>";
        	}else{
		        for(var i=0;i<e.record.files.length;i++){
		        	//长度大于1小于长度length换行
		        	if(i< e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>&nbsp;&nbsp;";
		        	}
		        	//最后一个不换行
	        		if(i == e.record.files.length-1){
		        		tempSrc += "<a href='com.primeton.components.web.fileupload.getfile.flow?fileId=" + e.record.files[i].fileId + "'>" + e.record.files[i].fileName + "</a>";
		        	}
		        }
        	}
	       	return tempSrc;
	     }
		function dealdate(e){
			if(e.value){
				return e.value.substring(0,10);
			}
		}
		
		function FormatDate(strTime) { 
		    var date = new Date(strTime); 
		    var year = date.getFullYear();
		    var month = date.getMonth()+1;
		    var day = date.getDate();
		    if(month<10){
		    	month = "0"+month;
		    }
		    if(day<10){
		    	day = "0"+day;
		    }
		    return year+"-"+month+"-"+day; 
		}
		
		function updateCert(){
			var rows = cert.getSelecteds();
			if (rows.length > 1){
        		alert("只能选中一条记录进行编辑！");
        	}else{
	            var row = cert.getSelected();
	            if(row){
	            	var remark = row.remark;
	            	var fileid = row.fileid;
	            	var files = row.files;
	            	var enddate = row.enddate;
	            	var startdate = row.startdate;
	            	var cardno = row.cardno;
	            	var cardtype = row.cardtype;
	            	var rescertid = row.rescertid;
	            	nui.open({
						url: "<%=request.getContextPath() %>/ame_resume/addCertDetail.jsp?",
		                title: "增加证书详情",
		                width: 700,
		                height: 400,
		                onload: function () {
		                    var iframe = this.getIFrameEl();
		                    var data = {"action": "edit","o":{"remark":remark,"fileid":fileid,"files":files,"enddate":enddate,"startdate":startdate,"cardno":cardno,"cardtype":cardtype}};
		                    iframe.contentWindow.SetData(data);
		                },
		                ondestroy: function (action) {
		                    if (action == "ok") {
		                        var iframe = this.getIFrameEl();
		                        var data = iframe.contentWindow.GetData();
		                        data = nui.clone(data);    //必须
		                        if (data) {//.
		                        	var cardtype = data.cardtype;
		                        	var cardno = data.cardno;
		                        	var startdate = data.startdate;
		                        	if(startdate!='null' && startdate!=null && startdate!=""){
		                        		startdate = FormatDate(startdate);
		                        	}
		                        	var enddate = data.enddate;
		                        	if(enddate!='null' && enddate!=null && enddate!=""){
		                        		enddate = FormatDate(enddate);
		                        	}
		                        	var remark = data.remark;
		                        	var fileid = data.fileid;
		                        	if(fileid == null ||fileid==""||fileid=='null'){
		                        		var json = nui.encode({"rescertid":""});
		                        		nui.ajax({
							    			url: "com.primeton.eos.ame_resume.resumeManage.queryUploadFiles.biz.ext",
							    			data: json,
							    			type: 'POST',
							    			cache: false,
							    			contentType: 'text/json',
							    			success: function(o){
							    				var files = null;
							    				fileid = null;
							    				var updateRow = {
												cardtype: cardtype,
												cardno: cardno,
												startdate: startdate,
												enddate: enddate,
												remark: remark,
												fileid:fileid,
												files:  files
												};
												var grid = nui.get('cert');
												grid.updateRow(row,updateRow);
							    			}
							    		});
		                        	}else{
		                        		var json = nui.encode({"rescertid":rescertid,"fileid":fileid});
			                        	nui.ajax({
							    			url: "com.primeton.eos.ame_resume.resumeManage.queryUploadFiles.biz.ext",
							    			data: json,
							    			type: 'POST',
							    			cache: false,
							    			contentType: 'text/json',
							    			success: function(o){
							    				var files = o.files;
							    				var updateRow = {
												cardtype: cardtype,
												cardno: cardno,
												startdate: startdate,
												enddate: enddate,
												remark: remark,
												fileid:fileid,
												files:  files
												};
												var grid = nui.get('cert');
												grid.updateRow(row,updateRow);
							    			}
							    		});
		                        	}
		                        }
		                    }
		                }
					});
	            }else{
	                alert("请选中一条记录！");
	            }
            }
		}
	</script>

</body>
</html>