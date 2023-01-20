<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.eos.data.datacontext.UserObject"%>

<html>
<!-- 
  - Author(s): zhengquan
  - Date: 2019-05-08 17:58:20
  - Description:
-->
<head>
<title>会议室详细信息</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/common/nui/nui.js" type="text/javascript"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/common/nui/resource/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/common/nui/resource/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/common/nui/resource/kindeditor/kindeditor-all-min.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/common/nui/resource/kindeditor/lang/zh-CN.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/common/nui/resource/kindeditor/plugins/code/prettify.js"></script>

	<style type="text/css">
	    body{
	       width:100%;height:100%;font-size:12px;}
	    .mini-grid-rows-view{
	    	height: auto !important;
	    }
	    .rightInfo img{width:250px;height:140px;}
	    img[src=""]{opacity: 0;}
    </style>

	
</head>
<body>
	<div class="mini-panel" title="会议室详情" style="width: auto">
		<!-- 提示信息展示 -->
		<div class="nui-toolbar" id="hysglForm"  method="post">
<!-- 			<fieldset id="field1" style="border:solid 1px #aaa;padding:3px;">
 -->				<form id="form2" action="com.primeton.eos.ame_dailyoffice.hystpdz.flow"  target="hidden_frame" method="post" enctype="multipart/form-data">
				
					<!--隐藏域-->
					<input name="hysgl.hysid" class="nui-hidden"/>
					<!-- <input name="hysgl.glymc" class="nui-hidden"/> -->
					<input class="nui-hidden"  name="fileCatalog" id = "fileCatalog" value = "MyPicture"/>
					
					<input name="hysgl.hysbh" class="nui-hidden"/>
					<div style="padding:5px;">
						<table style="table-layout:fixed;" id="table_file" >
							<tr>
								<td align="right" style="width:120px;">会议室名称：</td>
								<td style="width:150px;"><input name="hysgl.hysmc" class="nui-textbox" style="width:100%" required="true" requiredErrorText="会议室名称不能为空！"/></td>
								<td align="right" style="width:120px;">会议室状态：</td>
								<td style="width:150px;"><input name="hysgl.hyszt" class="nui-dictcombobox" id="hyszt" style="width:100%" required="true" requiredErrorText="会议室状态不能为空！" /></td>
							</tr>
							<tr>
								<td align="right" style="width:120px;">会议室地址：</td>
								<td style="width:150px;"><input name="hysgl.dz" class="nui-textbox" style="width:100%" required="true" requiredErrorText="会议室地址不能为空！"/></td>
								<td align="right" style="width:120px;">容纳人数：</td>
								<td style="width:150px;"><input name="hysgl.rnrs" class="nui-textbox" style="width:100%" vtype="float" required="true" requiredErrorText="容纳人数必填且只能填写数字！"/></td>
							</tr>
							<tr>
								<td align="right" style="width:120px;">管理员名称：</td>
								<td><input name="hysgl.glymc" id="glymc" class="nui-hidden"/>
			                    <input id="glyid1" class="mini-textboxlist"  name="hysgl.glyid" searchField="name" style="width:100%;"
									url="com.primeton.eos.ame_budget.budgetOrgManager.queryUseridByName.biz.ext" value="" text=""
									textField="empname" valueField="userid" required="true" onvaluechanged="getAdminname"/>
									
									</td> 
								<!-- <td style="width:150px;">
									<input name="hysgl.glyid" class="nui-buttonedit" style="width:100%" onbuttonclick="selectOmEmployee" allowInput="false"  />
									<input name="hysgl.glymc" class="nui-hidden"/> 
								</td> -->
								<td align="right" style="width:120px;">会议室类型：</td>
								<td style="width:150px;"><input name="hysgl.hyslx" class="nui-dictcombobox" style="width:100%" id="hyslx" value="1"/></td>
							</tr>
							<tr>
								<td align="right" style="width:120px;">投影仪数量：</td>
								<td style="width:150px;"><input name="hysgl.tyysl" class="nui-textbox" style="width:100%" vtype="float" required="true" requiredErrorText="投影仪数量必填且只能填写数字！"/></td>
								<td align="right" style="width:120px;">屏幕数量：</td>
								<td style="width:150px;"><input name="hysgl.pmsl" class="nui-textbox" style="width:100%" vtype="float" required="true" requiredErrorText="屏幕数量必填且只能填写数字！"/></td>
							</tr>
							<tr>
							
								<td align="right" style = "width:110px;">会议室图片：</td>
								<td align="left"><input type = "file" name = "hystpdz"   id = "hystpdz"  style="width:200px"  onchange="show1(this)" /><a class="nui-button" onclick="deleteFile('1')" >删除</a>
									<input class="nui-hidden" name="hysgl.hystpdz" id="fileid1"/></td>
							
							</tr>
							<tr>
								<td align="right">图片预览：</td>
								<td align="left"><div id="imgPreview" class="rightInfo"></div></td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">使用范围：</td>
								<td colspan="5" class="asLabel"><input name="hysgl.syfw" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%"/></td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">设备描述：</td>
								<td colspan="5" class="asLabel"><input name="hysgl.sbms" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%"/></td>
							</tr>
							<tr>	
								<td align="right" style="width:120px">备注：</td>
								<td colspan="5" class="asLabel"><input name="hysgl.bz" class="nui-textarea" vtype="rangeChar:0,2000" style="width:100%"/></td>
							</tr>
						</table>
					</div>
				</form>
				 <iframe name='hidden_frame' id="hidden_frame" style='display:none'></iframe>
				
			<!-- </fieldset> -->
		</div>
	</div>
	<div style="text-align:center;padding:10px;" class="nui-toolbar" id="btnDiv">
		<a class="nui-button" onclick="onOk()" id="okbutton" style="width:80px;margin-right:20px;">保存</a>
		<a class="nui-button" onclick="CloseWindow(close)" style="width:80px;margin-right:20px;">取消</a>
	</div>
	<script type="text/javascript">
	    nui.parse();
	    var processInstId='<%=request.getParameter("processInstID") %>';
	    var hysid = '<%=request.getParameter("hysid") %>';
	    var form = new nui.Form("hysglForm");
		var type,bh;
		init();
	    function init(){
	    	var data_hyszt = [{"id": "true","text": "正常使用"},{"id": "false","text": "维护中"}];
			nui.get("hyszt").setData(data_hyszt);
			var data_hyslx = [{"id": "1","text": "围桌"},{"id": "2","text": "U型"}];
			nui.get("hyslx").setData(data_hyslx);
		    if(type == "add"){
				fisrtLoad();
			}else if(type == "update"){
				loadData();
			}else if(type == "view"){
				$("#btnDiv").remove()
				form.setEnabled();
				loadData();
			}
	    }
	    
	    function fisrtLoad(){
	    	nui.getbyName("hysgl.hysbh").setValue(bh);
	    	nui.getbyName("hysgl.hyszt").setValue("true");
	    	nui.getbyName("hysgl.hyslx").setValue(1);
	    	//nui.getbyName("hysgl.glymc").setValue("前台");
	    }
	    
	    function loadData(){
			form.mask("数据加载中...");
			var json = nui.encode({hysData : {"hysid" : hysid}});
			nui.ajax({
				url: "com.primeton.eos.ame_dailyoffice.Hysxx.queryMeetingRoomDetailData.biz.ext",
				type: "post",
				data: json,
				contentType: "text/json",
				success: function (o){
					form.unmask();
					o = nui.clone(o);
					form.setData(o);
					nui.getbyName("hysgl.glyid").setText(o.hysgl.glymc)
					document.getElementById("imgPreview").innerHTML = "<img src='"+o.hysgl.hystpdz+"'/>"; 
				    form.setChanged(false);
				},
				error: function(){}
			});
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
				  
		//确定保存或更新
		function onOk() {
		   if(!form.validate()){
		        nui.alert("表单信息填写不完整，请确认必输项是否填写！");
				return;
		   }
		   document.getElementById("fileCatalog").value = "MyPicture";
		       nui.get("okbutton").disable();
		   	   form2.submit();
		}
		function saveData(){
		 //   if(form.validate()){
  				document.getElementById("fileCatalog").value = "MyPicture";
	      	 	nui.get("okbutton").disable();
	   	  		 form2.submit();		    	
	   	  		 var formData = form.getData();
		    	console.log(formData)
		        var json = {hysData:formData.hysgl};
		        form.loading("保存中，请稍候...");
		        nui.ajax({
		            url: "com.primeton.eos.ame_dailyoffice.Hysxx.handleMeetingRoomData.biz.ext",
		            data: json,
		            type: 'POST',
		            cache: false,
		            contentType: 'text/json',
		            success: function (text) {
		            	form.unmask();
		            	var returnData = nui.clone(text);
		            	if(returnData != "-1"){
		            		if(type == "add"){
		            			nui.alert("保存成功！");
		            		}else if(type == "update"){
		            			nui.alert("修改成功！");
		            		}
		            		CloseWindow();
		            	}else{
		            		nui.alert("操作失败");
		            	}
		            }
		        });
		   /* else{
		    	var errorTexts = form.getErrorTexts();
		    	var str_error = '';
		    	errorTexts.forEach(function(errortext){
		    		str_error = str_error + errortext + '<br/>';
		    	});
		    	nui.alert(str_error);
		    } */
		}
		
		
		/* 
        // 选择人员弹窗 多选；
		function selectOmEmployee(){
		var btnEdit = this;
   		nui.open({
       		     url:contextPath+"/machine/SelectEmployee1.jsp", 
	 	  	   title: "选择管理员",
	           width: 650,
	          height: 380,
	       ondestroy: function (action) {
	            if (action == "ok") {
	                var iframe = this.getIFrameEl();
	                var data = iframe.contentWindow.GetData();
	                data = nui.clone(data);    //必须
	                if (data) {					//拼接字符串；
	               		 var empname="";
	                	 var empid=""; 
	                	 for (var i = 0, l = data.length; i < l; i++) {
							var tax;
	                    	var lee1 = data[i];
	                 	 	var empname1=lee1.empname;
	                 	 		empname+=empname1+",";
	                 	 	var empid1=lee1.empid;
	                 	 		empid+=empid1+",";
	                }
	                	empname= empname.substring(0,empname.length-1);
	                	empid=empid.substring(0,empid.length-1)
	              		if(nui.getbyName("hysgl.glyid")) {nui.getbyName("hysgl.glyid").setText(empname);nui.getbyName("hysgl.glyid").setValue(empid);
	              		nui.getbyName("hysgl.glymc").setValue(empname);}
	                
	                }
	            }
	
	        }
    });
} */


      	function getAdminname(){
	    	var adminname = nui.get("glyid1").getText();
	    	nui.get("glymc").setValue(adminname);
	    }
	    
	    
	    
	    function show1(imgFile){ 
	    console.log(imgFile)
		var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
		if(!pattern.test(imgFile.value)){ 
	     		alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
	     		imgFile.focus(); 
	    } 
	    else 
	   	{ 
	     	var path; 
	     	
	    	if(document.all)//IE 
	     	{ 
			  imgFile.select(); 
			  path = document.selection.createRange().text;
			  console.log(path) 
			  document.getElementById("imgPreview").innerHTML=""; 
			  document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
			} 
	     	else//FF 
	     	{ 
	     	
		      path = URL.createObjectURL(imgFile.files[0]);
		       console.log(path) 
		      document.getElementById("imgPreview").innerHTML = "<img src='"+path+"'/>"; 
	     	}  
		} 
	}
	
	
		function deleteFile(e){
			if(e=="1"){
			nui.get("fileid1").setValue("");
			document.getElementById("imgPreview").innerHTML = ""; 
		}
	} 
	
	
	function test(filename){
		console.log("hah"+filename)
		if(filename!="null"){
		console.log(filename)
			nui.get("fileid1").setValue(filename);
		}
		saveData();
	}
	</script>
</body>
</html>