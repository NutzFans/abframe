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
	<title>设置离职信息</title>
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
	<div class="mini-panel" title="人员离职信息" style="width: 100%;height: 100%;">
		<div style="width:100%;">
		<input name="emp.empid" id="empid" class="nui-hidden">
		<input name="oOpr.operatorid" id="operatorid" class="nui-hidden">
            <table style="width:100%;">
            	<tr>
            		<td align="right" style="width:80px;">人员状态:</td>
            		<td style="width:140px;" align="left">    
                		<input name="emp.empstatus" id="empstatus" class="nui-dictcombobox" shownullItem="true" dictTypeId="ABF_EMPSTATUS" width="100%" readonly="readonly"/>
            		</td>
            		<td align="right" style="width:80px;">操作员状态:</td>
            		<td style="width:140px;" align="left">    
                		<input name="oOpr.status" id="status" shownullItem="true" dictTypeId="ABF_OPERSTATUS" class="nui-dictcombobox" width="100%" readonly="readonly"/>
            		</td>
            	</tr>
                <tr>
                	<td align="right" style="width:80px;">离职日期:</td>
            		<td style="width:140px;" align="left">    
                		<input name="emp.outdate" id="outdate" class="nui-datepicker" dateFormat="yyyy-MM-dd" width="100%"  onblur="changeStatus"/>
            		</td>
					<td align="right" style="width:80px;">离职性质:</td>
            		<td style="width:140px;" align="left">    
                		<input name="emp.outtype" id="outtype" class="nui-dictcombobox" shownullItem="true" dictTypeId="OUT_TYPE" width="100%"  onvaluechanged="changeReason"/>
            		</td>
            		<td align="right" style="width:80px;">离职原因:</td>
            		<td style="width:140px;" align="left">    
                		<input name="emp.outreason" id="outreason" valueField="dictid" textField="dictname" class="nui-combobox" shownullItem="true"  width="100%" />
            		</td>
				</tr>
				<tr>
					<td align="right" style="width:80px;">离职去向:</td>
            		<td colspan="3" align="left">    
                		<input name="emp.outto" id="outto" class="nui-textbox" width="100%" maxLength="20"/>
            		</td>
            		<td align="right" style="width:80px;">离职补偿:</td>
            		<td style="width:140px;" align="left">    
                		<input name="emp.outmakeup" id="outmakeup" class="nui-textbox" width="100%"/>
            		</td>
				</tr>
				<tr>
					<td align="right" style="width:80px;">离职说明:</td>
            		<td colspan="5" align="left">    
                		<input name="emp.outmemo" id="outmemo" class="nui-textbox" width="100%"/>
            		</td>
				</tr>
            </table>           
	    </div>
	    <div class="nui-tabs" activeIndex="0" id="tab1" style="height: 300px;">
	    	<div style="width:100%;" title="改派" >
		        <div class="nui-toolbar" style="border-bottom:0;padding:0px;">
		            <table style="width:100%;">
		            	<tr>
		                    <td style="width:20%;">
		                        <a class="nui-button" id="addBtn" iconCls="icon-edit" onclick="doReassign">改派</a>
		                    </td>
		                </tr>
	                 </table>
		        </div>
			    <div id="datagrid11" class="nui-datagrid" style="height:auto;" allowResize="true" dataField="wks" url="org.gocom.abframe.org.employee.EmpManager.queryWorkitemByEmp.biz.ext"
			    	 multiSelect="true"  showPager="false">
					<div property="columns">
						<div type="checkcolumn" width="25"></div>
						<div field="workitemname" headerAlign="center" align="center" width="80px">工作项名称</div>
				        <div field="processchname" headerAlign="center" align="center" width="80px">流程定义名称</div>
				        <div field="processinstname" headerAlign="center" align="center" width="200px">流程实例名称</div>
				        <div field="currentstate" headerAlign="center" align="center" width="40px" renderer="onCurrentStateRenderer">状态</div>
				        <div field="istimeout" headerAlign="center" align="center" width="40px" renderer="onTimeoutRenderer">超时</div>
					</div>
				</div>
			</div>
	    </div>
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="saveEmp" iconCls="icon-ok" style="width: 60px;margin-right: 20px;">保存</a>
		<a class="nui-button" onclick="onCancel('cancel')" id="closeResume" iconCls="icon-cancel" style="width: 60px;margin-right: 20px;">关闭</a>
	</div>	
	<script type="text/javascript">
		nui.parse();
		var form1 = new nui.Form("form1");
		var grid = nui.get("datagrid11");
		var body_tab  = nui.get("tab1");
		var empid = '<%=request.getParameter("empid") %>';
		init();
		function init(){
			var json = nui.encode({"empid":empid});
        	nui.ajax({
        		url: "org.gocom.abframe.org.organization.newOrgEmp.queryMyEmp.biz.ext",
        		data: json,
        		type: 'POST',
    			cache: false,
    			contentType: 'text/json',
    			success: function(text){
    				var emp = text.emp;
    				var userid = emp.userid;
    				var username = emp.empname;
					form1.setData(text);
					grid.load({"userid":userid});
					var tab_sign = {name: "tab_sale", id: "tab_sale", title: "代理", bodyStyle: "",refreshOnClick:true,url:"<%=request.getContextPath() %>/abframe/org/emp/doAddFullAgent.jsp?userid="+userid+"&&username="+username};
					body_tab.addTab(tab_sign,1);
					changeReason();
    			},
    			error: function(jqXHR, textStatus, errorThrown){
    			}
        	});
		}
		
        function onCurrentStateRenderer(e) {
        	if(e.value == '4'){
        		return "待领取";
        	}else if(e.value == '8'){
        		return "挂起";
        	}else if(e.value == '10'){
        		return "运行";
        	}else if(e.value == '12'){
        		return "完成";
        	}else if(e.value == '13'){
        		return "终止";
        	}else{
        		return "";
        	}
        }
        
        function onTimeoutRenderer(e){
        	if(e.value == 'Y'){
        		return "是";
        	}else if(e.value == 'N'){
        		return "否";
        	}else{
        		return "";
        	}
        }
		
		function changeReason(){
			var outtype = nui.get("outtype").getValue();
			if(outtype == null || outtype == ""){
				nui.get("outreason").setData(null);
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
		
		function onOk(){
			var updateURL = "org.gocom.abframe.org.employee.EmpManager.saveLeaveEmp.biz.ext";
			var saveURL = "";
		
			nui.get("saveEmp").disable();
			saveURL = updateURL;
			var data = form1.getData();
    		form1.validate();
    		var json = nui.encode({"emp":data.emp,"oOpr":data.oOpr});
    		if(form1.validate()){
	    		nui.ajax({
	    			url: saveURL,
	    			data: json,
	    			type: 'POST',
	    			cache: false,
	    			contentType: 'text/json',
	    			success: function(text){
	    				if(text.result=='0'){
	    					if(text.wxresult){
	    						alert("修改成功，但微信企业号人员未能成功删除，错误原因："+text.wxresult);
	    					}else{
	    						alert("修改成功");
	    					}
	    					nui.get("saveEmp").enable();
		    				CloseWindow("save");
		    			}else{
		    				alert("修改失败，请重新尝试");
		    				nui.get("saveEmp").enable();
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
		
		function changeStatus(){
			var outdate = nui.get("outdate").getValue();
			var json = nui.encode({"outdate":outdate});
			var URL = "org.gocom.abframe.org.organization.newOrgEmp.checkOutDate.biz.ext";
			nui.ajax({
    			url: URL,
    			data: json,
    			type: 'POST',
    			cache: false,
    			contentType: 'text/json',
    			success: function(text){
    				if(text.result=='-1'){
    					nui.get("empstatus").setValue("leave");
    					nui.get("status").setValue("stop");
	    			}else{
	    				nui.get("empstatus").setValue("on");
    					nui.get("status").setValue("running");
	    			}
    			},
    			error: function(jqXHR, textStatus, errorThrown){
    				CloseWindow();
    			}
    		});
		}
		
		function onCancel(e) {
        	var data = form1.getData();
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
    		if (action == "close" && form1.isChanged()){
    			if (confirm("数据被修改了，是否先保存？")){
    				return false;
    			}
    		}
    		if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
    		else window.close();
    	}
		
		//改派
	    function doReassign() {
	    	var rows = grid.getSelecteds();
	    	var workItemIDs;
	    	if (!rows) {
				nui.alert("请选中一条记录","提示");
				return;
			}
	    	nui.open({
				url: "<%=request.getContextPath() %>/ame_common/selectEmp.jsp",
				title: "指定改派人员",
				width: 400,
				height: 150,
				onload: function () {
					//var iframe = this.getIFrameEl();
				},
				ondestroy: function (action){
					if (action == "ok") {
						var iframe = this.getIFrameEl();
						var data = iframe.contentWindow.GetData();
						data = nui.clone(data);    //必须
						if (data.userid) {			//data.userid  data.empname
							var json = {workItems:rows ,personID:data.userid};
							nui.ajax({
					    		url: "org.gocom.abframe.org.employee.EmpManager.reassignBatch.biz.ext",
					            data: json,
					            type: 'POST',
					            cache: false,
					            showModal: false,
					            contentType: 'text/json',
					            success: function (o) {
					            	alert("改派成功！");
					            	grid.reload();
					            },
					            error: function (jqXHR, textStatus, errorThrown) {
					                alert(jqXHR.responseText);
					            }
					    	});
						}else{
							//alert("至少选择一条记录！");
						}
					}
				}
			});
	    }
	    
	</script>
</body>
</html>