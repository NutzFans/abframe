<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp"%>
<%@include file="/common/skins/skin0/component.jsp" %>
<html>
<!-- 
  - Author(s): jisx
  - Date: 2017-08-09 18:42:50
  - Description:
-->
<head>
	<title>增加合同信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
	<style type="text/css">
	    body{
	        margin: 0;padding: 0;border: 0;width: 100%;height: 100%;overflow: hidden;	
	    } 
    </style>
</head>
<body>
	<div class="nui-fit">
		<fieldset id="field1" style="border: solid 1px #aaa;" >
			<legend>合同详情</legend>
			<form id="contractDetail" method="post">
				<div>
					<table style="table-layout: fixed;" style="width:100%">
						<tr>
							<td align="right" style="width:80px;">合同属性:</td>
	                		<td align="left">    
	                    		<input name="conttype"  id="conttype" class="nui-dictcombobox" shownullItem="true" dictTypeId="CONT_TYPE" style="width:100%;" required="true" />
	                		</td>
	                		<td align="right" style="width:80px;">合同性质:</td>
	                		<td align="left">    
	                    		<input name="contprop" id="contprop" class="nui-dictcombobox" shownullItem="true" dictTypeId="CONT_PROP" style="width:100%;" required="true" />
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">签署工号:</td>
	                		<td align="left">    
	                    		<input name="contuserid" id="contuserid" class="nui-textbox" style="width:100%;" required="true" />
	                		</td>
							<td align="right" style="width:80px;">合同期限(年):</td>
	                		<td align="left">    
	                    		<input name="conttime" id="conttime" class="nui-textbox" onblur="validate()" style="width:100%;"/>
	                		</td>
						</tr>
						<tr>
	                		<td align="right" style="width:80px;">职位分类:</td>
	                		<td align="left">    
	                    		<input name="position" id="position" class="nui-dictcombobox" shownullItem="true" allowInput="true" dictTypeId="AME_POSITION_MEMO" style="width:100%;"/>
	                		</td>
						    <td align="right" style="width:80px;">职位名称:</td>
	            			<td align="left">    
	                			<input name="positionname" id="positionname" class="nui-textbox" allowInput="true" width="100%"  />
	            			</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">合同开始日期:</td>
	                		<td align="left">    
	                    		<input name="contstart" id="contstart" class="nui-datepicker" dateFormat="yyyy-MM-dd" style="width:100%;"/>
	                		</td>
		                    <td align="right" style="width:80px;">合同结束日期:</td>
	                		<td align="left">    
	                    		<input name="contend" id="contend" class="nui-datepicker" dateFormat="yyyy-MM-dd" style="width:100%;"/>
	                		</td>
						</tr>
						<tr>
		                    <td style="width:width:80px;" align="right">签署公司：</td>
		                    <td align="left">    
		                        <input name="contcompany" id="contcompany" class="nui-dictcombobox" shownullItem="true" dictTypeId="company"  style="width:100%;"/>
		                    </td>
		            		<td style="width:80px;" align="right">签署工作地：</td>
		                    <td align="left">    
		                        <input class="nui-dictcombobox" name="contworkplace" id="contworkplace" dictTypeId="AREA4CLRY"  style="width:100%;"/>
		                    </td>
						</tr>
						<tr>
		            		<td style="width:80px;" align="right">签署状态：</td>
		                    <td align="left">    
		                        <input class="nui-dictcombobox" name="contstatus" id="contstatus" dictTypeId="EMP_CONT_STATUS"  style="width:100%;"/>
		                    </td>
	                		<td align="right" style="width:80px;">经办人:</td>
	                		<td align="left">    
	                    		<input name="agent" id="agent" onbuttonclick="selectEmp" class="nui-buttonedit" allowInput="false" emptyText="请选择人员" style="width:100%;"/>
	                		</td>
						</tr>
						<tr>
						    <td align="right" style="width:80px;">备注:</td>
	            			<td align="left">    
	                			<input name="remark" id="remark" class="nui-textbox" allowInput="true" width="100%"  />
	            			</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
			<legend>合同信息附件</legend>
			<jsp:include page="/ame_common/inputFile.jsp"/>
		</fieldset>
		
	</div>
	<div style="text-align: center;padding: 10px;" class="nui-toolbar">
		<a class="nui-button" onclick="onOk()" id="sure" style="width: 60px;margin-right: 20px;">确认</a>
		<a class="nui-button" onclick="onCancel('cancel')" style="width: 60px;" id="canelButton">关闭</a>
	</div>
	<script type="text/javascript">
		nui.parse();
		
		var fileid;
		var detail;
		
		function SetData(data){
			var action = data.action;
			if(action=="edit"){
				var o = data.o;
				if(o != null &&o != "" &&o != 'null' ){
	            	var fileid = o.fileid;
	            	var files = o.files;
	            	var fileids;
	            	if(fileid==null||fileid==""||fileid=='null'){
	            		if(files==null||files==''||files=='null'){
	            		}else{
	            			fileids = files[0].relationId;
	            			nui.get("grid_0").load({"groupid":"OM_EMP_CONTRACT","relationid":fileids});
	            		}
	            	}else{
	            		fileids = fileid;
	            		nui.get("grid_0").load({"fileid":fileids});
	            	}
	            	var conttype = o.conttype;
	            	var contprop = o.contprop;
	            	var conttime = o.conttime;
	            	var position = o.position;
	            	var positionname = o.positionname;
	            	var contstart = o.contstart;
	            	var contend = o.contend;
	            	var agent = o.agent;
	            	var agentname = o.agentname;
	            	var contuserid = o.contuserid;
	            	var contcompany = o.contcompany;
	            	var contworkplace = o.contworkplace;
	            	var contstatus = o.contstatus;
	            	var remark = o.remark;
	            	nui.get("conttype").setValue(conttype);
	            	nui.get("contprop").setValue(contprop);
	            	nui.get("conttime").setValue(conttime);
	            	nui.get("position").setValue(position);
	            	nui.get("positionname").setValue(positionname);
	            	nui.get("contstart").setValue(contstart);
	            	nui.get("contend").setValue(contend);
	            	nui.get("agent").setValue(agent);
	            	nui.get("agent").setText(agentname);
	            	nui.get("contuserid").setValue(contuserid);
	            	nui.get("contcompany").setValue(contcompany);
	            	nui.get("contworkplace").setValue(contworkplace);
	            	nui.get("contstatus").setValue(contstatus);
	            	nui.get("remark").setValue(remark);
				}
			}
		}
		
		function onOk(){
			var form = new nui.Form("#form2");
			form.loading("保存中...");
			form2.submit();
			var form = new nui.Form("contractDetail");
			detail = form.getData();
			form.unmask();
		}
		
		function test(mesg){
			fileid = mesg;
			CloseWindow('ok');
		}
		
		function GetData(){
			var fileids = "";
			var grid_0 = nui.get("grid_0");
			var data = grid_0.getData();
			for(var i = 0; i<data.length;i++){
				var b = data[i].fileId;;
				if(i == 0){
					fileids += b;
				}else{
					fileids += ","+b;
				}
			}
			if(fileid == null || fileid == "" || fileid == "null"){
				fileid = fileids;
			}else{
				fileid += ","+fileids;
			}
			var agentname = nui.get("agent").getText();
			var data = {"conttype":detail.conttype,"contprop":detail.contprop,"conttime":detail.conttime,"position":detail.position,"positionname":detail.positionname,"contstart":detail.contstart,"contend":detail.contend,"agent":detail.agent,"agentname":agentname,
						"fileid":fileid,"contuserid":detail.contuserid,"contcompany":detail.contcompany,"contworkplace":detail.contworkplace,"contstatus":detail.contstatus,"remark":detail.remark};
			return data;
		}
		
		function onCancel(e) {
        	if(e=='cancel'){
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
    	
    	function validate(){  
		     var reg = new RegExp("^[0-9]*[1-9][0-9]*$");  
		     var obj = nui.get("conttime").getValue();
		     if(!reg.test(obj)){  
		     	alert("请输入数字!");
		     	nui.get("conttime").setValue("");    
		     }  
	     }
	</script>
</body>
</html>