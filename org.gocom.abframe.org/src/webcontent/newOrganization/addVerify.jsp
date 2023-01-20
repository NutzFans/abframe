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
			<legend>转正详情</legend>
			<form id="verifyDetail" method="post">
				<div>
					<table style="table-layout: fixed;" style="width:100%">
					
						<tr>
							<td align="right" style="width:100px;">试用期期限(月):</td>
	                		<td align="left">    
	                    		<input name="veritime"  id="veritime" class="nui-textbox" onvaluechanged="changeVeritime" style="width:100%;" onblur="validate()"/>
	                		</td>
	                		<td align="right" style="width:80px;">试用开始日期:</td>
	                		<td align="left">    
	                    		<input name="veristart" id="veristart" class="nui-datepicker" dateFormat="yyyy-MM-dd"  style="width:100%;"/>
	                		</td>
						</tr>
						<tr>
	                		<td align="right" style="width:120px;">试用结束日期:</td>
	                		<td align="left">    
	                    		<input name="veriend" id="veriend" class="nui-datepicker" dateFormat="yyyy-MM-dd" style="width:100%;" onvaluechanged="changeVeritime2"/>
	                		</td>
	                		<td align="right" style="width:120px;">应转正日期:</td>
	                		<td align="left">    
	                    		<input name="shoulddate" id="shoulddate" class="nui-datepicker" dateFormat="yyyy-MM-dd" style="width:100%;"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">转正结果:</td>
	                		<td align="left">    
	                    		<input name="veriresult" id="veriresult" class="nui-dictcombobox" dictTypeId="VERI_RESULT" shownullItem="true" style="width:100%;"/>
	                		</td>
	                		<td align="right" style="width:120px;">实际转正日期:</td>
	                		<td align="left">    
	                    		<input name="realdate" id="realdate" class="nui-datepicker" dateFormat="yyyy-MM-dd" style="width:100%;"/>
	                		</td>
						</tr>
						<tr>
	                		<td align="right" style="width:80px;">转正评价人:</td>
	                		<td align="left">    
	                    		<input name="verijudgor" id="verijudgor" onbuttonclick="selectEmp" class="nui-buttonedit" allowInput="false" emptyText="请选择人员" style="width:100%;"/>
	                		</td>
	                		<td align="right" style="width:80px;">经办人:</td>
	                		<td align="left">    
	                    		<input name="agent" id="agent" onbuttonclick="selectEmp" class="nui-buttonedit" allowInput="false" emptyText="请选择人员" style="width:100%;"/>
	                		</td>
						</tr>
						<tr>
							<td align="right" style="width:80px;">转正评价:</td>
	                		<td align="left" colspan="4">    
	                    		<input name="verijudge" id="verijudge" class="nui-textarea"style="width:100%;"/>
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
		var veristartDate=null;
		function SetData(data){
			var action = data.action;
			if(action == "add"){
				var indate=data.indate;
				nui.get("veristart").setValue(indate);
				veristartDate = indate;
			}else if(action=="edit"){
				var o = data.o;
				if(o != null &&o != "" &&o != 'null' ){
	            	var fileid = o.fileid;
	            	var files = o.files;
	            	var fileids;
	            	if(fileid==null||fileid==""||fileid=='null'){
	            		if(files==null||files==''||files=='null'){
	            		}else{
	            			fileids = files[0].relationId;
	            			nui.get("grid_0").load({"groupid":"OM_EMP_VERIFY","relationid":fileids});
	            		}
	            	}else{
	            		fileids = fileid;
	            		nui.get("grid_0").load({"fileid":fileids});
	            	}
	            	var veritime = o.veritime;
	            	var veristart = o.veristart;
	            	var veriend = o.veriend;
	            	var veriresult = o.veriresult;
	            	var shoulddate = o.shoulddate;
	            	var realdate = o.realdate;
	            	var verijudge = o.verijudge;
	            	var verijudgor = o.verijudgor;
	            	var verijudgorname = o.verijudgorname;
	            	var agent = o.agent;
	            	var agentname = o.agentname;
	            	veristartDate = veristart;
	            	nui.get("veritime").setValue(veritime);
	            	nui.get("veristart").setValue(veristart);
	            	nui.get("veriend").setValue(veriend);
	            	nui.get("veriresult").setValue(veriresult);
	            	nui.get("shoulddate").setValue(shoulddate);
	            	nui.get("realdate").setValue(realdate);
	            	nui.get("verijudge").setValue(verijudge);
	            	nui.get("verijudgor").setValue(verijudgor);
	            	nui.get("verijudgor").setText(verijudgorname);
	            	nui.get("agent").setValue(agent);
	            	nui.get("agent").setText(agentname);
				}
			}
		}
		
		function changeVeritime(e){
			nui.get("veriend").setValue(null);
			var date1 = new Date(veristartDate);
    		var month =parseFloat(e.value);
			if(e.value){
				var veriend = DateAdd("m", month, date1);
				nui.get("veriend").setValue(veriend);
				var veriend1 = DateAdd("d", -1, veriend);
				nui.get("veriend").setValue(veriend1);
				var shoulddate = DateAdd("d", 1, veriend1);
				console.log(shoulddate);
				nui.get("shoulddate").setValue(shoulddate);
				nui.get("realdate").setValue(shoulddate);
				console.log(nui.get("shoulddate").getValue());
				
			}
		}
		
		function changeVeritime2(e){
			if(e.value){
				var veriend = nui.get("veriend").getValue();
				var veriend = veriend.toString();
				veriend = veriend.replace("/-/g", "/");
			    veriend = new Date(veriend);
			    Date.prototype.addDay = function(num){if(!isNaN(num))this.setDate(this.getDate() + parseInt(num));return this;}//给日期原型加个方法
			    var shoulddate = veriend.addDay(1);
				nui.get("shoulddate").setValue(shoulddate);
				nui.get("realdate").setValue(shoulddate);
			}
		}
		
		
		/*
	 *   功能:实现VBScript的DateAdd功能.
	 *   参数:interval,字符串表达式，表示要添加的时间间隔.
	 *   参数:number,数值表达式，表示要添加的时间间隔的个数.
	 *   参数:date,时间对象.
	 *   返回:新的时间对象.
	 *   var now = new Date();
	 *   var newDate = DateAdd( "d", 5, now);
	 *---------------   DateAdd(interval,number,date)   -----------------
	 */
	function DateAdd(interval, number, date) {
	    switch (interval) {
	    case "y": {
	        date.setFullYear(date.getFullYear() + number);
	        return date;
	        break;
	    }
	    case "q": {
	        date.setMonth(date.getMonth() + number * 3);
	        return date;
	        break;
	    }
	    case "m": {
	        date.setMonth(date.getMonth() + number);
	        return date;
	        break;
	    }
	    case "w": {
	        date.setDate(date.getDate() + number * 7);
	        return date;
	        break;
	    }
	    case "d": {
	        date.setDate(date.getDate() + number);
	        return date;
	        break;
	    }
	    case "h": {
	        date.setHours(date.getHours() + number);
	        return date;
	        break;
	    }
	    case "mm": {
	        date.setMinutes(date.getMinutes() + number);
	        return date;
	        break;
	    }
	    case "s": {
	        date.setSeconds(date.getSeconds() + number);
	        return date;
	        break;
	    }
	    default: {
	        date.setDate(d.getDate() + number);
	        return date;
	        break;
	    }
	    }
	}
		
		function onOk(){
			var form = new nui.Form("#form2");
			form.loading("保存中...");
			form2.submit();
			var form = new nui.Form("verifyDetail");
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
			var verijudgorname = nui.get("verijudgor").getText();
			var agentname = nui.get("agent").getText();
			var data = {"veritime":detail.veritime,"veristart":detail.veristart,"veriend":detail.veriend,"veriresult":detail.veriresult,"shoulddate":detail.shoulddate,"realdate":detail.realdate,"verijudge":detail.verijudge,"verijudgor":detail.verijudgor,"verijudgorname":verijudgorname,"agent":detail.agent,"agentname":agentname,"fileid":fileid};
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
		     var reg = new RegExp("^[0-9]*[0-9][0-9]*$");  
		     var obj = nui.get("veritime").getValue();
		     if(obj){
			     if(!reg.test(obj)){  
			     	alert("请输入数字!");
			     	nui.get("veritime").setValue("");    
			     } 
		     } 
	     }  
</script>
</body>
</html>