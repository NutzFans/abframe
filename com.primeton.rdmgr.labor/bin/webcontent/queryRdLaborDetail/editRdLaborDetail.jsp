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
  - Author(s): xuqq
  - Date: 2017-09-13 16:03:51
  - Description:
-->
<head>
	<title>编辑工时</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
</head>
<body style="width:100%;height:100%;padding:0px;margin:0px;">
<div class="nui-fit">
	<form id="form1" method="post" >
		<input name="rdlabordetail.laborDetailId" id="laborDetailId" class="nui-hidden" />
		<input name="rdlabordetail.userId" id="userId" class="nui-hidden" />
		<input name="rdlabordetail.orgid" id="orgid" class="nui-hidden" />
		<input name="rdlabordetail.price" id="price" class="nui-hidden" />
		<fieldset style="border:solid 1px #aaa;padding:3px;">
			<legend>工时基本信息</legend>
			<div style="padding:5px;"> 
				<table>
					<tr>
						<td align="right" style="width:120px;">工时类型：</td>
						<td style="width:200px;">    
	                       <input property="editor" class="nui-combobox" name="rdlabordetail.type" id="type"  data="typedata"  required="true"  style="width:80%;" onvaluechanged="watchtype"/>
	                    </td>
	                    <td align="right" style="width:120px;">填报人：</td>
						<td style="width:200px;">    
	                       <input class="nui-textbox" name="rdlabordetail.userName" id="userName" readOnly="readOnly" required="true"  style="width:80%;"/>
	                    </td>
	                    <td align="right" style="width:120px;">填报日期：</td>
						<td style="width:200px;">    
	                       <input class="nui-datepicker" name="rdlabordetail.laborDate" id="laborDate"  style="width:80%;" required="true" />
	                    </td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">客户：</td>
						<td style="width:200px;">    
	                       <input class="nui-buttonedit" name="rdlabordetail.custid" id="custid"  showClose="true" onbuttonclick="onButtonEdit" allowInput="false" style="width:100%;" onvaluechanged="watchcust"/>
	                    </td>
	                    <td align="right" style="width:120px;">项目：</td>
						<td style="width:200px;">    
	                       <input property="editor" class="nui-combobox" name="rdlabordetail.projectId" id="projectId" data="projectIddata" required="true"   showClose="true"  allowInput="false" onvaluechanged="watchproject" style="width:100%;"/>
	                    </td>
	                    <td align="right" style="width:120px;">受益部门：</td>
						<td style="width:200px;">    
	                       <input property="editor" class="nui-combobox" name="rdlabordetail.syorgid" id="syorgid" url="com.primeton.rdmgr.labor.labormgr.getAllOrgs.biz.ext" required="true"   showClose="true" filterType="like" textField="orgname" valueField="orgid" dataField="allorgs" valueFromSelect="true" allowInput="true"  style="width:100%;"/>
	                    </td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">项目活动：</td>
						<td style="width:200px;">    
	                       <input property="editor" class="nui-combobox" name="rdlabordetail.tasklist" id="tasklist" data="tasklistdata" required="true"   showClose="true"  allowInput="false" style="width:100%;"/>
	                    </td>
	                    <td align="right" style="width:120px;">总工时：</td>
						<td style="width:200px;">    
	                       <input property="editor" class="nui-combobox" name="rdlabordetail.actHours" id="actHours"  data="actHoursdata"  required="true"  style="width:80%;" onvaluechanged="watchactHours"/>
	                    </td>
	                    <td align="right" style="width:120px;">其中加班工时：</td>
						<td style="width:200px;">    
	                       <input property="editor" class="nui-combobox" name="rdlabordetail.otwHours" id="otwHours"  data="otwHoursdata"  required="true"  style="width:80%;" onvaluechanged="watchactHours1"/>
	                    </td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">工时定额成本：</td>
						<td style="width:200px;">    
	                       <input property="editor" class="nui-textbox" name="rdlabordetail.standcost" id="standcost" readOnly="readOnly" format="n2" style="width:80%;"/>
	                    </td>
						<td align="right" style="width:120px;">定额结算成本：</td>
						<td style="width:200px;">    
	                       <input property="editor" class="nui-textbox" name="rdlabordetail.cost" id="cost" required="true" format="n2" onblur="changecost" style="width:80%;"/>
	                    </td>
						<td align="right" style="width:120px;">转换系数：</td>
						<td style="width:200px;">    
	                       <input property="editor" class="nui-textbox" name="rdlabordetail.conratio" id="conratio" readOnly="readOnly" format="n2" style="width:80%;"/>
	                    </td>
					</tr>
					<tr>
						<td align="right" style="width:120px;">工时转换成本：</td>
						<td style="width:200px;">    
	                       <input property="editor" class="nui-textbox" name="rdlabordetail.concost" id="concost" readOnly="readOnly" format="n2" style="width:80%;"/>
	                    </td>
	                    <td align="right" style="width:120px;">工时状态：</td>
						<td style="width:200px;">    
	                       <input property="editor" class="nui-dictcombobox" name="rdlabordetail.status" id="status" required="true" dictTypeId="AME_LABOR_STATUS" style="width:80%;"/>
	                    </td>
					</tr>
					<tr>
	                    <td align="right" style="width:120px;">工作内容：</td>
	                    <td style="width:200px;" colspan="3">  
	                    	<input class="nui-textarea" vtype="rangeLength:0,4000" name="rdlabordetail.repContent" id="repContent" required="true" style="width:95%;"/>
						</td>
					</tr>
				</table>
			</div>
		</fieldset>	
	</form>
</div>
<div style="text-align:center;padding:10px;" class="nui-toolbar">
	<a class="nui-button"onclick="onOk"style="width:60px;margin-right:20px;">保存</a>
	<a class="nui-button"onclick="onCancel" style="width:60px;">关闭</a>
</div>
	<script type="text/javascript">
		var typedata = [{id: "Pro",text: "项目"},
		               {id: "nonPro",text: "非立项"},
		               {id: "orgLevel",text: "组织级"}];
        var actHoursdata = [{id: 0.5,text: "0.5小时"},
        					{id: 1.0,text: "1.0小时"},
        					{id: 1.5,text: "1.5小时"},
        					{id: 2.0,text: "2.0小时"},
        					{id: 2.5,text: "2.5小时"},
        					{id: 3.0,text: "3.0小时"},
        					{id: 3.5,text: "3.5小时"},
        					{id: 4.0,text: "4.0小时"},
        					{id: 4.5,text: "4.5小时"},
        					{id: 5.0,text: "5.0小时"},
        					{id: 5.5,text: "5.5小时"},
        					{id: 6.0,text: "6.0小时"},
        					{id: 6.5,text: "6.5小时"},
        					{id: 7.0,text: "7.0小时"},
        					{id: 7.5,text: "7.5小时"},
        					{id: 8.0,text: "8.0小时"},
        					{id: 8.5,text: "8.5小时"},
        					{id: 9.0,text: "9.0小时"},
        					{id: 9.5,text: "9.5小时"},
        					{id: 10.0,text: "10.0小时"},
        					{id: 11.0,text: "11.0小时"},
        					{id: 12.0,text: "12.0小时"},
        					{id: 13.0,text: "13.0小时"},
        					{id: 14.0,text: "14.0小时"},
        					{id: 15.0,text: "15.0小时"},
        					{id: 16.0,text: "16.0小时"}];
		var otwHoursdata =[ {id: 0.0,text: "0.0小时"},
							{id: 0.5,text: "0.5小时"},
        					{id: 1.0,text: "1.0小时"},
        					{id: 1.5,text: "1.5小时"},
        					{id: 2.0,text: "2.0小时"},
        					{id: 2.5,text: "2.5小时"},
        					{id: 3.0,text: "3.0小时"},
        					{id: 3.5,text: "3.5小时"},
        					{id: 4.0,text: "4.0小时"},
        					{id: 4.5,text: "4.5小时"},
        					{id: 5.0,text: "5.0小时"},
        					{id: 5.5,text: "5.5小时"},
        					{id: 6.0,text: "6.0小时"},
        					{id: 6.5,text: "6.5小时"},
        					{id: 7.0,text: "7.0小时"},
        					{id: 7.5,text: "7.5小时"},
        					{id: 8.0,text: "8.0小时"},
        					{id: 8.5,text: "8.5小时"},
        					{id: 9.0,text: "9.0小时"},
        					{id: 9.5,text: "9.5小时"},
        					{id: 10.0,text: "10.0小时"},
        					{id: 11.0,text: "11.0小时"},
        					{id: 12.0,text: "12.0小时"},
        					{id: 13.0,text: "13.0小时"},
        					{id: 14.0,text: "14.0小时"},
        					{id: 15.0,text: "15.0小时"},
        					{id: 16.0,text: "16.0小时"}];
        var form = new nui.Form("#form1");
        var projectIddata = [];
		//初始化操作               
        init();
       	function init(){
       		var laborDetailId = <%=request.getParameter("laborDetailId")%>;
       		var json = nui.encode({"rdlabordetail":{"laborDetailId": laborDetailId}});
			nui.ajax({
	            url: "com.primeton.rdmgr.labor.queryRdLaborDetail.queryRdLaborDetail.biz.ext",
				type: 'POST',
				data: json,	
				contentType: 'text/json',
	            success: function (o) {
	            	if(o.rdlabordetail.projectId == '1') {
	            		//客户
						o.rdlabordetail.type="orgLevel";
						nui.get("custid").setReadOnly(true);
       					nui.get("custid").setRequired(true);
						//项目
						projectIddata=[{id: '1', text: '组织级工时'}];
						nui.get("projectId").setReadOnly(true);
						nui.get("projectId").setData(projectIddata);
						//受益部门
						nui.get("syorgid").setReadOnly(false);
					}else if (o.rdlabordetail.projectId == '2'){
						//客户
						o.rdlabordetail.type="nonPro";
						nui.get("custid").setRequired(false);
						//项目
						projectIddata=[{id: '2', text: '非立项技术支持'}];
						nui.get("projectId").setReadOnly(true);
						nui.get("projectId").setData(projectIddata);
						//受益部门
						nui.get("syorgid").setReadOnly(false);
					}else{
						//客户
						o.rdlabordetail.type="Pro";
						nui.get("custid").setRequired(true);
						//项目
						projectIddata=[];
						var json = ({"custid":o.rdlabordetail.custid,"userid":o.rdlabordetail.userId});
                        $.ajax({
                            type:'get',
                            data:json,
                            async:false,
                            url:'com.primeton.eos.ame_common.wx_worktime.queryRdProject.biz.ext',
                            success:function(result){
                                for(var i = 0;i<result.project.length;i++){
                                    projectIddata.push({id:result.project[i].projectid,text:result.project[i].projectname});
                                }
                            }
                        })
						nui.get("projectId").setReadOnly(false);
						nui.get("projectId").setData(projectIddata);
						//受益部门
						nui.get("syorgid").setReadOnly(true);
					}
	            	form.setData(o);
	            	nui.get("custid").setValue(o.rdlabordetail.custid);
	            	nui.get("custid").setText(o.rdlabordetail.custname);
					tasklistdata(o.rdlabordetail.projectId);
					
					//系数获取
					var json_rate=({"criteria":
										{"_expr[0]":{"org":o.rdlabordetail.org},
										"_expr[1]":{"_property":"startdate","_op":"<=","_value":o.rdlabordetail.laborDate},
										"_expr[2]":{"_property":"enddate","_op":">=","_value":o.rdlabordetail.laborDate}},
									"page":{"begin":0,"length":20},
									"sortField":"startdate",
									"sortOrder":"desc"});
					nui.ajax({
                            type:'get',
                            data:json_rate,
                            cache: false,
                    		showModal: false,
                    		async :false,
                    		contentType: 'text/json',
                            url:'com.primeton.eos.ame_common.ameTransconf.queryTransconf.biz.ext',
                            success:function(result){
                                if(result.transconfs.length==1){
                                	nui.get("conratio").setValue(result.transconfs[0].transconf);
                                	var cost = nui.get("cost").getValue();
                                	var concost = cost*result.transconfs[0].transconf;
                                	nui.get("concost").setValue(concost);
                                }
                            }
                        })
                    //状态选择框
                    <%
                    	UserObject user = (UserObject)session.getAttribute("userObject");
			    		String nowuserid = user.getUserId();
			    		String nowusername = user.getUserName();
			    		Map attr = user.getAttributes();
			    		Map map = new HashMap();
			    		Boolean rolesroleids = false;	//是否是事业部助理
			    		Boolean isPMO = false; //是否PMO
			    		//角色
			    		DataObject[] roles = (DataObject[])attr.get("roles");
						for(int i=0;i < roles.length;i++){
							if(roles[i].getString("roleid").equals("assistant") || 
								roles[i].getString("roleid").equals("HDJRZL") || 
								roles[i].getString("roleid").equals("general") || 
								roles[i].getString("roleid").equals("viceGeneral")){
								rolesroleids = true;
							}
							if(roles[i].getString("roleid").equals("PMO")){
								isPMO = true;
							}
						}
                 	%>
                 	var statusdata = [];
                 	var ispmos="<%=isPMO %>";
				 	var rolesroleids = "<%=rolesroleids %>";
                    if(ispmos == "true"){
                    	statusdata = []
                    	statusdata.push({"dictID": '0',"dictName": "新增"});
                    	statusdata.push({"dictID": '1',"dictName": "受益部门确认"});
                    	statusdata.push({"dictID": '2',"dictName": "受益部门疑问"});
                    	statusdata.push({"dictID": '3',"dictName": "PMO审核确认"});
                    }else if(rolesroleids == "true"){
                    	statusdata = []
                    	statusdata.push({"dictID": '0',"dictName": "新增"});
                    	statusdata.push({"dictID": '1',"dictName": "受益部门确认"});
                    	statusdata.push({"dictID": '2',"dictName": "受益部门疑问"});
                    }
                    nui.get("status").setData(statusdata);
    				nui.get("status").setShowNullItem(false);
    				nui.get("status").select(o.rdlabordetail.status);
	            }
            })
       		
       	}
       	//客户选项
       	function onButtonEdit(){
       		var type = nui.get("type").getValue();
       		var param='';
       		if(type == "Pro"){
       			param="?userId="+nui.get("userId").getValue();
       		}
       		var btnEdit = this;	
	        nui.open({
				url:"<%=request.getContextPath()%>/labor/queryRdLaborDetail/queryMisCustinfo.jsp"+param,
				title: "选择列表",
				width: 600,
				height: 400,
				onload: function () {
	               var iframe = this.getIFrameEl();
	               var data = {userid: null };
	            },
				ondestroy: function (action) {
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data) {
			                btnEdit.setValue(data.id);
			                btnEdit.setText(data.text);
			                watchcust(data.id)
						}
					}
				}
			});
       	}
       	
       	//类型变更
       	function watchtype(){
       		var type=nui.get("type").getValue();
       		var orgid = nui.get("orgid").getValue();
       		if(type == "orgLevel"){
       			nui.get("custid").setValue("1926");
       			nui.get("custid").setText("普元信息技术股份有限公司");
       			nui.get("custid").setReadOnly(true);
       			projectIddata=[{id: '1', text: '组织级工时'}];
				nui.get("projectId").setReadOnly(true);
				nui.get("projectId").setData(projectIddata);
				nui.get("projectId").setValue("1");
				tasklistdata("1");
				//受益部门
				nui.get("syorgid").setReadOnly(false);
   				nui.get("syorgid").setValue(orgid);
       		}else{
       			nui.get("custid").setReadOnly(false);
       		}
       		if(type == "nonPro"){
       			nui.get("custid").setRequired(false);
       			projectIddata=[{id: '2', text: '非立项技术支持'}];
				nui.get("projectId").setReadOnly(true);
				nui.get("projectId").setData(projectIddata);
				nui.get("projectId").setValue("2");
				tasklistdata("2");
				//受益部门
				nui.get("syorgid").setReadOnly(false);
   				nui.get("syorgid").setValue(null);
       		}else{
       			nui.get("custid").setRequired(true);
       		}
       		if(type == "Pro"){
       			nui.get("custid").setValue(null);
       			nui.get("custid").setText(null);
       			//项目
				nui.get("projectId").setReadOnly(false);
				nui.get("projectId").setValue(null);
				tasklistdata(null);
				//受益部门
				nui.get("syorgid").setReadOnly(true);
       		}
       	}
       	
       	//客户变更
       	function watchcust(e){
       		var type = nui.get("type").getValue();
       		var custid = e;
       		var userid = nui.get("userId").getValue();
       		if(type=="orgLevel"){
				projectIddata=[{id: '1', text: '组织级工时'}];
				nui.get("projectId").setReadOnly(true);
				nui.get("projectId").setData(projectIddata);
				nui.get("projectId").setValue("1");
				tasklistdata("1");
       		}else if(type=="nonPro"){
       			projectIddata=[{id: '2', text: '非立项技术支持'}];
				nui.get("projectId").setReadOnly(true);
				nui.get("projectId").setData(projectIddata);
				nui.get("projectId").setValue("2");
				tasklistdata("2");
       		}else if(type=="Pro"){
       			projectIddata=[];
				var json = ({"custid":custid,"userid":userid});
                $.ajax({
                    type:'get',
                    data:json,
                    async:false,
                    url:'com.primeton.eos.ame_common.wx_worktime.queryRdProject.biz.ext',
                    success:function(result){
                        for(var i = 0;i<result.project.length;i++){
                            projectIddata.push({id:result.project[i].projectid,text:result.project[i].projectname});
                        }
                    }
                })
				nui.get("projectId").setReadOnly(false);
				nui.get("projectId").setData(projectIddata);
				tasklistdata(null);
       		}
       		
       	}
       	
       	//项目变更
       	function watchproject(){
       		var type = nui.get("type").getValue();
       		var orgid = nui.get("orgid").getValue();
       		var projectid = nui.get("projectId").getValue();
       		//受益部门
       		if(type != "Pro"){
       			if(type == "orgLevel"){
       				nui.get("syorgid").setValue(orgid);
       			}else{
       				nui.get("syorgid").setValue(null);
       			}
       		}else{
       			var json = ({"projectID":projectid});
                var org = [];
                //受益部门过滤
                $.ajax({
                    type:'get',
                    data:json,
                    async:false,
                    url:'com.primeton.eos.ame_common.wx_worktime.queryorg.biz.ext',
                    success:function(result){
                        for(var i = 0;i<result.allorgs.length;i++){
                            org.push(result.allorgs[i]);
                        }
                    }
                })
                nui.get("syorgid").setValue(org[0].orgid);
       		}
       		tasklistdata(projectid);
       	}
       	//项目活动下拉框
       	function tasklistdata(projectid){
       		//项目活动
       		var tasklist = [];
       		if(projectid != null){
       			var json = ({"projectid":projectid});
	            $.ajax({
	                type:'get',
	                data:json,
	                async:false,
	                url:'com.primeton.eos.ame_common.wx_worktime.querytasklist.biz.ext',
	                success:function(result){
	                    for(var i = 0;i<result.tasklists.length;i++){
	                        tasklist.push({id:result.tasklists[i].tasklist,text:result.tasklists[i].taskname});
	                    }
	                }
	            })
       		}
            nui.get("tasklist").setData(tasklist);
       	}
       	
       	function watchactHours(){
       		var actHours = nui.get("actHours").getValue();
       		if(actHours>8){
                nui.get("otwHours").setValue(actHours-8);
            }else{
                nui.get("otwHours").setValue(0);
            }
            var otwHours = nui.get("otwHours").getValue();
            var otwprice = nui.getDictText("AME_SYSCONF","LABOR_OVERTIME_PAY");
            var price =  nui.get("price").getValue();
            var standcost = price/8*(actHours-otwHours)+otwHours*otwprice;
            nui.get("standcost").setValue(standcost);
            nui.get("cost").setValue(standcost);
            changecost();
       	}
       	
       	function watchactHours1(){
       		var actHours = nui.get("actHours").getValue();
       		var otwHours = nui.get("otwHours").getValue();
            var otwprice = nui.getDictText("AME_SYSCONF","LABOR_OVERTIME_PAY");
            var price =  nui.get("price").getValue();
            var standcost = price/8*(actHours-otwHours)+otwHours*otwprice;
            nui.get("standcost").setValue(standcost);
            nui.get("cost").setValue(standcost);
            changecost();
       	}
       	
       	//修改定额结算成本
       	function changecost(){
       		var cost = nui.get("cost").getValue();
       		if(isNaN(cost)){
        		nui.alert("定额结算成本请输入数字！");
        		nui.get("cost").setValue(0);
        		return;
        	}
        	if(cost == null || cost == ""){
        		cost = 0;
        		nui.get("cost").setValue(0);
        	}
        	var conratio = nui.get("conratio").getValue();
        	var concost = cost*conratio;
        	nui.get("concost").setValue(concost);
       	}
       	//关闭页面
       	function CloseWindow(action) {
	        if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
	        else window.close();            
	    }
	    function onCancel(e) {
	        CloseWindow("cancel");
	    }
	    //保存
     	function onOk(e) {
     		if(form.validate()){
     			var data = form.getData();
     			nui.ajax({
                    type:'get',
                    data:data,
                    cache: false,
                    showModal: false,
                    async :false,
                    contentType: 'text/json',
                    url:'com.primeton.rdmgr.labor.queryRdLaborDetail.saveRdLaborDetail.biz.ext',
                    success:function(result){
                        if(result.exception == null){
                            nui.alert("保存成功","系统提示",function(){
                                CloseWindow("ok");
                            });
                        }else{
                            nui.alert("保存失败！请联系信息技术部人员。")
                        }
                        
                    },
                    error:function(jqXHR, textStatus, errorThrown){
                        nui.alert("error:" + jqXHR.responseText);
                    }
                })
     		}else{
			    return;
			}
     	}
	</script>
</body>
</html>