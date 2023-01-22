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
	<title>增加证书</title>
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
			<legend>证件(书)详情</legend>
			<form id="certDetail" method="post">
				<div>
					<table style="table-layout: fixed;" style="width:100%">
						<tr>
							<td align="right" style="width:80px;">证件(书)类型:</td>
	                		<td align="left">    
	                    		<input name="cardtype"  id="cardtype" class="nui-dictcombobox" dictTypeId="AME_CERTTYPE" style="width:100%;"/>
	                		</td>
	                		<td align="right" style="width:80px;">证件(书)号码:</td>
	                		<td align="left">    
	                    		<input name="cardno" id="cardno" class="nui-textbox" style="width:100%;"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">有效开始年月:</td>
	                		<td align="left">    
	                    		<input name="startdate" id="startdate" class="nui-datepicker" showTodayButton="false" style="width:100%;"/>
	                		</td>
	                		<td align="right" style="width:80px;">有效截止年月:</td>
	                		<td align="left">    
	                    		<input name="enddate" id="enddate" class="nui-datepicker" showTodayButton="false" style="width:100%;"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注:</td>
	                		<td align="left" colspan="3">    
	                    		<input name="remark" id="remark" class="nui-textarea" style="width:100%;"/>
	                		</td>
						</tr>
					</table>
				</div>
			</form>
		</fieldset>
		
		<fieldset id="field6" style="border:solid 1px #aaa;padding:3px;">
			<legend>证件(书)附件</legend>
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
					var remark = o.remark;
	            	var fileid = o.fileid;
	            	var files = o.files;
	            	var fileids;
	            	if(fileid==null||fileid==""||fileid=='null'){
	            		if(files==null||files==''||files=='null'){
	            		}else{
	            			fileids = files[0].relationId;
	            			nui.get("grid_0").load({"groupid":"AME_RESUME_CERT","relationid":fileids});
	            		}
	            	}else{
	            		fileids = fileid;
	            		nui.get("grid_0").load({"fileid":fileids});
	            	}
	            	var enddate = o.enddate;
	            	var startdate = o.startdate;
	            	var cardno = o.cardno;
	            	var cardtype = o.cardtype;
	            	nui.get("cardtype").setValue(cardtype);
	            	nui.get("cardno").setValue(cardno);
	            	nui.get("startdate").setValue(startdate);
	            	nui.get("enddate").setValue(enddate);
	            	nui.get("remark").setValue(remark);
	            	nui.get("cardtype").setValue(cardtype);
	            	nui.get("cardtype").setValue(cardtype);
				}
			}
		}
		
		function onOk(){
			var form = new nui.Form("#form2");
			form.loading("保存中...");
			form2.submit();
			var form = new nui.Form("certDetail");
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
			var data = {"cardtype":detail.cardtype,"cardno":detail.cardno,"startdate":detail.startdate,"enddate":detail.enddate,"remark":detail.remark,"fileid":fileid};
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
    	
	</script>
</body>
</html>