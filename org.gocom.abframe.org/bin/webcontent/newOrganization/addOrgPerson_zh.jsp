<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/common.jsp"%>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-07-18 17:02:40
  - Description:
-->
<head>
<title>新增/修改人员信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<style type="text/css">
	body {
		margin: 0;
		padding: 0;
		width: 100%;
		height: 100%;
		overflow: hidden;
	}
</style>
</head>
<body>
	<%--民族、籍贯、户口所在省市、居住地省市、紧急联系人、与员工关系、
紧急联系人联系方式、社会工作时间、员工属性（正式员工、实习生、其他）、
职位、工作地、福利缴纳地、招聘渠道、内部推荐人、招聘经办人、
离职性质（主动离职、被动离职）、离职原因、离职去向、离职补偿、离职说明--%>
	<div class="nui-fit" id="form1">
		<div class="nui-panel" title="人员信息" style="width: 100%;">
			<fieldset style="border:solid 1px #aaa;padding:3px;">
			<input name="emp.empid" id="empid" class="nui-hidden">
			<input name="emp.orgid" id="orgid" class="nui-hidden">
				<legend >基本个人信息</legend>
				<div style="padding:5px;">
					<table style="width:100%;">
						<tr>
							<td align="right" style="width:80px;">员工工号:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.empcode" id="empcode" class="nui-textbox"  width="100%" required="true"/>
	                		</td>
							<td align="right" style="width:80px;">姓名:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.empname" id="empname" class="nui-textbox" required="true" style="width:100%;"/>
	                		</td>
	                		<td align="right" style="width:80px;">性别:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.gender" id="gender" class="nui-dictcombobox" dictTypeId="ABF_GENDER" width="100%" required="true" shownullItem="true"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">民族:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.nation" id="nation" class="nui-textbox"  width="100%" maxLength="20"/>
	                		</td>
							<td align="right" style="width:80px;">出生年月:</td>
	                		<td style="width:140px;">    
	                    		<input name="emp.birthdate" id="birthdate" class="nui-datepicker" showTodayButton="false" width="100%"/>
	                		</td>
	                		<td align="right" style="width:80px;">手机号码:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.mobileno" id="mobileno" class="nui-textbox"  width="100%" />
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">证件类型:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.cardtype" id="cardtype" class="nui-dictcombobox" shownullItem="true" dictTypeId="ABF_CARDTYPE" required="true" width="100%"/>
	                		</td>
							<td align="right" style="width:80px;">证件号码:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.cardno" id="cardno" class="nui-textbox" width="100%" />
	                		</td>
	                		<td align="right" style="width:80px;">社会工作时间:</td>
	                		<td style="width:100px;" align="left">    
	                    		<input name="emp.socialstart" id="socialstart" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"/>
	                		</td>
	                	</tr>
	                	<tr>
							<td align="right" style="width:80px;">最高学历:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.highestlen" id="highestlen" shownullItem="true" class="nui-dictcombobox" dictTypeId="DEGREE"  width="100%"/>
	                		</td>
							<td align="right" style="width:80px;">居住地省市:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.liveplace" id="liveplace" shownullItem="true" class="nui-dictcombobox" dictTypeId="MIS_AREA" width="100%" allowInput="true"/>
	                		</td>
							<td align="right" style="width:80px;">政治面貌:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.party" id="party" class="nui-dictcombobox" shownullItem="true" dictTypeId="ABF_PARTYVISAGE" width="100%"/>
	                		</td>
						</tr>
					</table>
				</div>
			</fieldset>
			
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>基本公司信息</legend>
				<div style="width:100%;">
		            <table style="width:100%;">
		                <tr>
		                	<td align="right" style="font-size:12px;width:80px;">人员状态:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.empstatus" id="empstatus" class="nui-dictcombobox" shownullItem="true" dictTypeId="ABF_EMPSTATUS" width="100%" required="true"/>
	                		</td>
							<td align="right" style="font-size:12px;width:80px;">员工属性:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.emptype" id="emptype" class="nui-dictcombobox" required="true"  dictTypeId="EMP_TYPE" width="100%" />
	                		</td>
							<td align="right" style="width:80px;">入职日期:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.indate" id="indate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"  />
	                		</td>
						</tr>
						<tr>
	            			<td align="right" style="width:80px;">职位名称:</td>
	            			<td style="width:140px;" align="left">    
	                			<input name="emp.positioncall" id="positioncall" class="nui-textbox"  width="100%"  />
	            			</td>
							<td align="right" style="width:80px;">直接上级:</td>
	                		<td style="width:140px;" align="left">
	                			<input name="emp.major" id="major"  width="100%" onbuttonclick="selectEmp" class="nui-buttonedit" allowInput="false" emptyText="请选择人员"   />    
	                		</td>
						</tr>
						<tr>
	            			<td align="right" style="width:80px;">所属公司:</td>
	            			<td style="width:140px;" align="left">    
	                			<input name="emp.company" id="company" class="nui-dictcombobox" dictTypeId="company" width="100%" />
	            			</td>
							<td align="right" style="width:80px;">工作地:</td>
	            			<td style="width:140px;" align="left">    
	                			<input name="emp.workplace" id="workplace" class="nui-dictcombobox" shownullItem="true" allowInput="true" dictTypeId="AREA4CLRY" width="100%"/>
	            			</td>
							<td align="right" style="width:80px;">工作描述:</td>
	                		<td align="left" colspan="3">    
	                    		<input name="emp.workexp" id="workexp" class="nui-textbox"  style="width:100%"/>
	                		</td>
						</tr>
						<tr>
	                		<td align="right" style="width:80px;">备注:</td>
	                		<td  align="left" colspan="3">    
	                    		<input name="emp.remark" id="remark" class="nui-textbox" style="width:100%"/>
	                		</td>
						</tr>
		            </table>           
			    </div>
			</fieldset>
			<fieldset style="border:solid 1px #aaa;padding:3px;">
				<legend>操作员信息</legend>
				<div style="width:100%;">
				<input name="oOpr.operatorid" id="operatorid" class="nui-hidden">
		            <table style="width:100%;">
		                <tr>
							<td align="right" style="width:80px;">用户登录名:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="oOpr.userid" id="userid" class="nui-textbox" width="100%" maxLength="20" readonly="readonly" required="true"/>
	                		</td>
	                		<td align="right" style="width:80px;">用户密码:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="oOpr.password" id="password" class="nui-password" width="100%" required="true" value="000000"readonly="readonly"/>
	                		</td>
							<td align="right" style="width:80px;">操作员状态:</td>
	                		<td style="width:140px;" align="left" >    
	                    		<input name="oOpr.status" id="status" shownullItem="true" dictTypeId="ABF_OPERSTATUS" class="nui-dictcombobox" width="100%"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;"  id="role1">员工角色:</td>
	                		<td style="width:140px;" align="left" id="role2">    
	                    		<input name="emp.role" id="role" dictTypeId="AME_ROLE" class="nui-dictcombobox" multiSelect="true"  style="width:100%;" required="true"/>
	                		</td>
	                		<td align="right" style="width:80px;">可管理机构:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.orgidlist" id="orgidlist" class="nui-textboxlist" searchField="orgname" style="width:100%"
	        						url="org.gocom.abframe.org.party.PartyManager.getMangerOrgs.biz.ext" value="" text="" 
	        						textField="orgname" valueField="orgid" dataField = "orgs"/>
	                		</td>
	                		<td align="right" style="width:80px;">可授权角色:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="emp.specialty" id="specialty"  class="nui-combobox"  shownullItem="true" 
								url="org.gocom.abframe.org.party.PartyManager.getAuthRole.biz.ext" filterType="like" multiSelect="true"
								textField="rolename" valueField="roleid" dataField="roles" valueFromSelect="true" allowInput="true" width="100%" />
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">认证模式:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="oOpr.authmode" id="authmode" shownullItem="true" dictTypeId="ABF_AUTHMODE" class="nui-dictcombobox" required="true" value="local" width="100%"/>
	                		</td>
	                		<td align="right" style="width:80px;">菜单风格:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="oOpr.menutype" id="menutype" dictTypeId="ABF_SKINLAYOUT" shownullItem="true" class="nui-dictcombobox" required="true" value="default"  width="100%" />
	                		</td>
							<td align="right" style="width:80px;">密码失效日:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="oOpr.invaldate" id="invaldate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%" />
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">生效日期:</td>
	                		<td style="width:140px;" align="left">    
	                    		<input name="oOpr.startdate" id="startdate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"/>
	                		</td>
							<td align="right" style="width:80px;">失效日期:</td>
	                		<td style="width:140px;" align="left" >    
	                    		<input name="oOpr.enddate" id="enddate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"/>
	                		</td>
						</tr>
		            </table>           
			    </div>
			</fieldset>
	</div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="saveEmp" iconCls="icon-ok" style="width: 60px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" id="closeResume" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
	</div>
</body>
<script type="text/javascript">
	nui.parse();
	var form = new nui.Form("form1");
	var grid_workDetail = nui.get("grid_workDetail");//人员工作信息
	var action = "";
	var personType = "";
	var tiaoshu=0;
	var tiaoshu1=0;
	//var orgid = '<b:write property="emp/orgid"/>';
	//var empid = '<b:write property="emp/empid"/>';
	var orgid = '<%=request.getParameter("orgid") %>';
	var empid = '<%=request.getParameter("empid") %>';
	var status = '<%=request.getParameter("status") %>';
	var major = '<%=request.getParameter("major") %>';
	nui.get("orgid").setValue(orgid);  
	nui.get("cardtype").setValue("id");
	nui.get("empstatus").setValue("on");
	nui.get("status").setValue("running");
	if(empid ==""||empid==null){
		nui.get("role").setValue("employee");
		nui.get("role").setText("员工");
		nui.get("userid").setReadOnly(false);
		/* majorname1(); */
	}else if(empid !=""&&empid !=null){
		SetData(empid);
	}
	
	function personType2(){
		<%--var grid = nui.get("speQuo");
		grid.clearRows();//清除所有行--%>
	 	personType = nui.get("degree").getValue();
		if(personType==2||personType==3){
			document.getElementById("levels").style.display="block";//显示
		}else{
			document.getElementById("levels").style.display="none";//不显示 
		}
		
		<%--var date = new Date();
		var year = date.getFullYear();
		var month =date.getMonth()+1;
		if(personType == 1 || personType ==2){
			var newRow = [{year:year,month:month,quotype: "1" },{year:year,month:month,quotype: "2" }];
        	grid.addRows(newRow);
		}else{
			var newRow = [{year:year,month:month,quotype: "1" }];
        	grid.addRows(newRow);
		}--%>
	}
	
	function changeReal(){
		var empname = nui.get("empname").getValue();
		nui.get("realname").setValue(empname);
	}
	function changeOutDate(e){
		if(e.value){
			//nui.get("outtype").setRequired(true);
		}
	}
	
	function SetData(data){
		var empid = data;
    	var json = nui.encode({"empid":empid});
    	nui.ajax({
    		url: "org.gocom.abframe.org.organization.newOrgEmp.queryMyEmp.biz.ext",
    		data: json,
    		type: 'POST',
			cache: false,
			contentType: 'text/json',
			success: function(text){
				form.setData(text);
				document.getElementById("role1").style.display="none";
				document.getElementById("role2").style.display="none";
				var majorname = text.emp.majorname;
				var major = text.emp.major;
				var majorvalue = text.emp.major;
				var orgnames = text.emp.orgnames;
				nui.get("major").setValue(major);
				nui.get("major").setText(majorname);
				nui.get("orgidlist").setText(orgnames);
	            nui.get("password").readOnly = true;
	            //changeReason();
	            if(text.resume.resumeid != null && text.resume.resumeid != ''){
	            	grid_workDetail.load({resumeid:text.resume.resumeid});
		            grid_workDetail.sortBy("startdate", "desc");
	            }
			},
			error: function(jqXHR, textStatus, errorThrown){
			}
    	});
	}
	
	function changeReason(){
		//var outtype = nui.get("outtype").getValue();
		var outtype = null;
		if(outtype == null || outtype == ""){
			//nui.get("outreason").setData(null);
		}else{
			var json = nui.encode({"dictid":outtype});
			nui.ajax({
        		url: "org.gocom.abframe.org.employee.EmpManager.changeOutReason.biz.ext",
        		data: json,
        		type: 'POST',
    			cache: false,
    			contentType: 'text/json',
    			success: function(text){
    				nui.get("outreason").setData(text.data);
    			},
    			error: function(jqXHR, textStatus, errorThrown){
    			}
        	});
		}
	}
	
	function getPlace(e){
		return nui.getDictText('AREA4CLRY',e.value);
	}
	function getConttype(e){
		return nui.getDictText('CONT_TYPE',e.value);
	}
	function getContprop(e){
		return nui.getDictText('CONT_PROP',e.value);
	}
	function getVeriresult(e){
		return nui.getDictText('VERI_RESULT',e.value);
	}
	function getDegree(e){
		return nui.getDictText('DEGREE',e.value);
	}
	
	function getSchooltype(e){
		return nui.getDictText('SCHOOL_TYPE',e.value);
	}
	function getCurrentstate(e){
		return nui.getDictText('ABF_STATUS',e.value);
	}
	function getIsworkrate(e){
		return nui.getDictText('MIS_YN',e.value);
	}
	//职位类型
	function getPosition(e){
		return nui.getDictText('AME_POSITION_MEMO',e.value);
	}
	
    //所属公司
	function company(e){
		return nui.getDictText('company',e.value);
	}
	//工作地
	function workplace(e){
		return nui.getDictText('AREA4CLRY',e.value);
	}
	//合同状态
	function contstatus(e){
		return nui.getDictText('EMP_CONT_STATUS',e.value);
	}
	
	function changeCard(){
		var cardno = nui.get("cardno").getValue();
		if(cardno.length<6){
			alert("证件号码必须大于等于6位");
		}else{
			if(empid == null || empid == ""){
				var password = cardno.substring(cardno.length-6,cardno.length);
				nui.get("password").setValue(password);
				var cardtype = nui.get("cardtype").getValue();
				if(cardtype=="id"){
					var birthdate = nui.get("birthdate").getValue();
					if(birthdate==""){
						var day = cardno.substring(cardno.length-12,cardno.length-8) + "-" + cardno.substring(cardno.length-8,cardno.length-6) + "-" + cardno.substring(cardno.length-6,cardno.length-4);
						nui.get("birthdate").setValue(day);
					}
				}
			}else{
				var cardtype = nui.get("cardtype").getValue();
				if(cardtype=="id"){
					var birthdate = nui.get("birthdate").getValue();
					if(birthdate==""){
						var day = cardno.substring(cardno.length-12,cardno.length-8) + "-" + cardno.substring(cardno.length-8,cardno.length-6) + "-" + cardno.substring(cardno.length-6,cardno.length-4);
						nui.get("birthdate").setValue(day);
					}
				}
			}
		}
	}
	
	function validate(){  
	     var reg = new RegExp("^[0-9]*[1-9][0-9]*$");  
	     var obj = nui.get("conttime").getValue();
	     if(!reg.test(obj)){  
	     	alert("请输入数字!");
	     	nui.get("conttime").setValue("");    
	     }  
     }
	
	function checkMessage(){
		var oemail = nui.get("oemail").getValue();
		var json = nui.encode({"oemail":oemail});
		nui.ajax({
			url: "org.gocom.abframe.org.organization.newOrgEmp.checkMail.biz.ext",
			data: json,
			type: 'POST',
			cache: false,
			contentType: 'text/json',
			success: function(text){
				if(text.result==1){
					return false;
    			}else{
    				return true;
    			}
			},
			error: function(jqXHR, textStatus, errorThrown){
				CloseWindow();
			}
		});
	}
	
	function onOk(){
		var addURL = "org.gocom.abframe.org.organization.newOrgEmp.addEmpOrg_zh.biz.ext";
		var updateURL = "org.gocom.abframe.org.organization.newOrgEmp.updateEmpOrg_zh.biz.ext";
		var saveURL = "";
		var userid = nui.get("userid").getValue();
		var indate = nui.get("indate").getValue();
		var mobileno = nui.get("mobileno").getValue();
		var cardno = nui.get("cardno").getValue();
		var cardtype = nui.get("cardtype").getValue();
		var gender = nui.get("gender").getValue();
		var empname = nui.get("empname").getValue();
		var empcode = nui.get("empcode").getValue();
		var company = nui.get("company").getValue();
		
		
		
		if(empcode==""||empcode==null){
			nui.alert("员工工号不能为空！");
			return;
		}
		if(empname==""||empname==null){
			nui.alert("人员姓名不能为空！");
			return;
		}
		if(gender==""||gender==null){
			nui.alert("性别不能为空！");
			return;
		}
		if(cardtype==""||cardtype==null){
			nui.alert("证件类型不能为空！");
			return;
		}
		if(userid==""||userid==null){
			nui.alert("用户登录名不能为空！");
			return;
		}
		
		var a =[];
		var data = form.getData();
		var empid = nui.get("empid").getValue();
		if(data.oOpr == null||data.oOpr == ""){
			
		}else{
			data.oOpr.hasopr='y';
		}
		if(empid==null||empid==""){
			form.validate();
			if(form.isValid()){
				judge1();
				if(tiaoshu==1){
					nui.alert("员工工号重复，请确认后再进行保存！");
					return;
				}
				judge2();
				if(tiaoshu1==1){
					nui.alert("用户登录名重复，请确认后再进行保存！");
					return;
				}
				nui.confirm("确认新增人员信息吗？","保存提示",function(action){
					if(action == "ok"){
						saveURL = addURL;
			    		var json = nui.encode({"emp":data.emp,"oOpr":data.oOpr,"role":data.role});
		    			nui.get("saveEmp").disable();
			    		nui.ajax({
			    			url: saveURL,
			    			data: json,
			    			type: 'POST',
			    			cache: false,
			    			contentType: 'text/json',
			    			success: function(text){
			    				nui.get("saveEmp").enable();
			    				if(text.returnVal==1){
		    						if(text.wxresult){
				                    	nui.alert("增加成功，但微信企业号人员未能成功同步，错误原因："+text.wxresult);
				                    }else{
						                nui.alert('增加成功！');  //保存成功 
				                    }
				                    if(text.dxresult != 0){
				                    	nui.alert("员工短信发送失败，请检查手机号码是否填写正确！");
				                    }
				    				CloseWindow("save");
				    			}else if(text.returnVal==2){
				    				nui.alert("增加基本信息失败，请重新尝试！");
				    			}else{
				    				nui.alert("增加失败，请重新尝试！");
				    			}
			    			},
			    			error: function(jqXHR, textStatus, errorThrown){
			    				CloseWindow();
			    			}
			    		});
					}
				});
				/* if(confirm("确认新增人员信息吗？")){
				
				}else{
					return;
				} */
			}else{
				nui.alert("请完善必填项信息！");
			}
		}else{
			form.validate();
			if(form.isValid()){
				nui.confirm("确认修改人员信息吗？","修改提示",function(action){
					if(action == "ok"){
						saveURL = updateURL;
			    		var json = nui.encode({"emp":data.emp,"oOpr":data.oOpr});
		    			nui.get("saveEmp").disable();
			    		nui.ajax({
			    			url: saveURL,
			    			data: json,
			    			type: 'POST',
			    			cache: false,
			    			contentType: 'text/json',
			    			success: function(text){
			    				nui.get("saveEmp").enable();
			    				if(text.returnVal==1){
			    					if(text.wxresult){
			    						nui.alert("修改成功,但人员微信企业号未能成功同步,错误原因："+text.wxresult);
			    					}else{
			    						nui.alert("修改成功！");
			    					}
			    					if(status!="tree"){
			    						CloseWindow("save");
			    					}
				    			}else if(text.returnVal==2){
				    				nui.alert("修改基本信息失败，请重新尝试！");
				    			}else{
				    				nui.alert("修改失败，请重新尝试！");
				    			}
			    			},
			    			error: function(jqXHR, textStatus, errorThrown){
			    				if(status != "tree"){
			    					CloseWindow();
			    				}
			    			}
			    		});
					}
				});
			}else{
				nui.alert("请完善必填项信息！");
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
	                	if(status != 'tree'){
	                		CloseWindow("cancel");
	                	}
	                }
	            }
	        });
		}else{
			if(status != 'tree'){
				CloseWindow("cancel");
			}
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
	
	
	function onCertTypeRenderer(e){
		return nui.getDictText('AME_CERTTYPE',e.value);//设置业务字典值
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
		
		
		function oncellmousedown(e){
	    	if(empid != null|| empid != ""){
	    		if(e.field == 'year' || e.field == 'month' || e.field == 'quotype'){
	    			if(typeof(e.row._state) == "undefined"){
		    			e.column.readOnly = true;
		    		}else{
		    			e.column.readOnly = false;
		    		}
	    			
	    		}
	    	}
	    } 
		
		//额度类型业务字典
	    function quoType(e) {
			return nui.getDictText('AME_SPEQUOTYPE',e.value);//设置业务字典值
		}
		
		//专项报销类型
		function feetype(e){
			return nui.getDictText('AME_SPEFEETYPE',e.value);//设置业务字典值
		}
		
	//验证员工编号
		function judge1(){
		 tiaoshu=0;
		//var newvalue=e.value;
		var newvalue=nui.get("empcode").getValue()
		var json ={empcode1:newvalue}
		nui.ajax({
					url: "org.gocom.abframe.org.organization.OrgManager.judgeEmpcode.biz.ext",
					type: 'POST',
					data:json,
					cache: false,
					async: false,
					contentType: 'text/json',
		            success: function (text) {
		            	if(text.result==1){
    					}
    					else{    					
    					tiaoshu=1;
    					return;
    				}
	    					
	    			}
		
		})
		}
		//验证登入名
		function judge2(){
		 tiaoshu1=0;
		//var newvalue=e.value;
		var newvalue=nui.get("userid").getValue()
		var json ={userid1:newvalue}
		nui.ajax({
					url: "org.gocom.abframe.org.organization.OrgManager.judgeEmpUserid.biz.ext",
					type: 'POST',
					data:json,
					cache: false,
					async: false,
					contentType: 'text/json',
		            success: function (text) {
		            	if(text.result==1){
    					}
    					else{    					
    					tiaoshu1=1;
    					return;
    				}
	    					
	    			}
		
		})
		}
		
		
	</script>
</html>